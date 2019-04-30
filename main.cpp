

#include "lib/tdm_ripper.hpp"

int main(int argc, char* argv[])
{
  // path of filename provided ?
  assert( argc > 1 && "please provide a filename and path" );

  // declare and initialize tdm_ripper
  tdm_ripper ripper(argv[1]);

  // ripper.list_datatypes();
  // ripper.show_structure();

  // ripper.print_hash_local("data/hash_table_xml_local.dat");
  // ripper.print_hash_values("data/hash_table_xml_value.dat");
  // ripper.print_hash_double("data/hash_table_xml_double.dat");

  ripper.list_channels();
  std::ofstream fout("data/list_of_channels.dat");
  ripper.list_channels(fout);
  fout.close();

  std::cout<<"number of channels "<<ripper.num_channels()<<"\n\n";
  std::cout<<"number of groups "<<ripper.num_groups()<<"\n\n";

  // std::vector<double> channA = ripper.get_channel(1);
  // for ( auto el: channA ) std::cout<<el<<"\n";
  // std::cout<<"\n\n";

  for ( int i = 0; i < 30; i++ )
  // for ( int i = 0; i < ripper.num_channels(); i++ )
  // for ( int i = 11880; i < ripper.num_channels(); i++ )
  {
    ripper.print_channel(i+1,("data/channel_"+std::to_string(i+1)+"_"
                                        +ripper.channel_name(i+1)+".dat").c_str());
  }

  return 0;
}
