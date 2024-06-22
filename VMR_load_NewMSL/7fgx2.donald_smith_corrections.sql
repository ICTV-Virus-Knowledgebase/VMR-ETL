-- 
-- VMR spread-sheet annotated changes from Donald Smith
--
/*
From: Donald Smith <donald.smith.ictv@gmail.com>
Date: Wednesday, May 15, 2024 at 03:06
To: Hendrickson, Curtis (Campus) <curtish@uab.edu>
Cc: Lefkowitz, Elliot J <elliotl@uab.edu>, Dempsey, Donald M (Campus) <ddempsey@uab.edu>, Mims, Logan Ray <lmims52@uab.edu>
Subject: Re: VMR_MSL39_v1.xlsx
Dear Curtis, 

I realised that I hadn't done what you asked me to do, which was to correct the columns X and Y where there were errors - I have now done that in the attached version with yellow highlighting to show the corrected cells. I also switched the order of a couple of accession cells where the segments were not in the standard order for that family.

Stuart has confirmed that the genome for Toleculsatellitidae should be ssDNA(-) for the genus Betasatellite and ssDNA for the genus Deltasatellite, ie as on the previous VMR, so no correction required to column Y.

Best wishes,

Donald
*/

update vmr set -- select *,
	 exemplar_seq_complete = 'Partial genome' -- select * 
from Vmr where sort_species = 1639 and exemplar_seq_complete = 'Complete genome'

-- 
-- fix molecule - sometimes fixing it to what it already is - quicker than sorting out which change.
--

update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5046 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Versovirus Vipa26



update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5046 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Versovirus Vipa26
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5047 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Versovirus Vipa36
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5048 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Versovirus Vipa71
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5049 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Versovirus Vipa4291
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5050 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Versovirus VipaK
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5052 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Villovirus FR
update vmr set  molecule = 'ssDNA(+)' from Vmr where sort_species=5053 and sort=1 and molecule <> 'ssDNA(+)' -- species: Villovirus V5
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5354 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Hemiambidensovirus hemipteran3
update vmr set  molecule = 'ssDNA' from Vmr where sort_species=5380 and sort=1 and molecule <> 'ssDNA' -- species: Brevihamaparvovirus orthopteran1
update vmr set  molecule = 'ssDNA' from Vmr where sort_species=5392 and sort=1 and molecule <> 'ssDNA' -- species: Chaphamaparvovirus chiropteran2
update vmr set  molecule = 'ssDNA' from Vmr where sort_species=5401 and sort=1 and molecule <> 'ssDNA' -- species: Chaphamaparvovirus galliform6
update vmr set  molecule = 'ssDNA' from Vmr where sort_species=5402 and sort=1 and molecule <> 'ssDNA' -- species: Chaphamaparvovirus galliform7
update vmr set  molecule = 'ssDNA' from Vmr where sort_species=5408 and sort=1 and molecule <> 'ssDNA' -- species: Chaphamaparvovirus pholidota1
update vmr set  molecule = 'ssDNA' from Vmr where sort_species=5427 and sort=1 and molecule <> 'ssDNA' -- species: Amdoparvovirus carnivoran8
update vmr set  molecule = 'ssDNA' from Vmr where sort_species=5430 and sort=1 and molecule <> 'ssDNA' -- species: Amdoparvovirus chiropteran1
update vmr set  molecule = 'ssDNA' from Vmr where sort_species=5476 and sort=1 and molecule <> 'ssDNA' -- species: Copiparvovirus ungulate9
update vmr set  molecule = 'ssDNA' from Vmr where sort_species=5486 and sort=1 and molecule <> 'ssDNA' -- species: Dependoparvovirus psittacine1
update vmr set  molecule = 'ssDNA' from Vmr where sort_species=5517 and sort=1 and molecule <> 'ssDNA' -- species: Protoparvovirus ungulate4
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5550 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Circovirus ban
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5571 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Circovirus gyurgyalag
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5573 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Circovirus human
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5578 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Circovirus kukwuria
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5608 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Circovirus torpegem
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5627 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Cyclovirus ezzike
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5705 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Bovdisavirus nainis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5706 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Camdisavirus jamalis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5707 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Camdisavirus kauis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5708 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Camdisavirus lingis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5709 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Camdisavirus miluis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5710 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Chidisavirus niois
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5711 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Chidisavirus ryguais
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5712 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Hudisavirus jaqis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5713 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Hudisavirus runais
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5714 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Hudisavirus sewis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5885 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Atripovirus timinis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5886 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Meliavirus jackflis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5887 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Oreadivirus manflis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5888 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Oreiadivirus spriflis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5889 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Satyrivirus cordulis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5890 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Sthenivirus nowtis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5891 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Thisbivirus naringis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5892 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Thyiavirua flanatis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5893 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Aretevirus hermico
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5894 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Aretevirus marisnaco
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5895 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Aretevirus swances
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5896 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Boebeisivirus manatense
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5897 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Boebeisivirus mintis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5898 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Demetevirus haddotis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5899 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Demetevirus plantaes
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5900 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Doliovirus lythtis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5901 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Dorisivirus aiptaes
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5902 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Dorisivirus orcatis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5903 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Eurynomevirus troutis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5904 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Gorgovirus cisneis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5905 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Heravirus camaronis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5906 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Horusivirus apimellis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5907 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Horusivirus mencois
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5908 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Horusivirus pandaco
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5909 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Ioniavirus callioris
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5910 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Ioniavirus farduois
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5911 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Kadmovirus poulis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5912 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Kreonivirus cygolis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5913 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Kreonivirus seabatis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5914 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Lamposivirus ageladense
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5915 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Lamposivirus gammaris
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5916 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Mantiovirus clamco
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5917 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Mantiovirus ealaes
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5918 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Naiadivirus befense
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5919 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Naiadivirus vacaense
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5920 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Naiadivirus wakense
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5921 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Otosivirus volusiense
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5922 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Patroklovirus gulmense
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5923 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Perimedevirus blatis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5924 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Peronelivirus doingaes
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5925 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Peronelivirus palaeminteris
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5926 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Persevirus forpensaes
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5927 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Persevirus mingois
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5928 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Persevirus niaois
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5929 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Persevirus pargotis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5930 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Persevirus pectis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5931 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Persevirus truchatis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5932 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Proteusivirus raitis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5933 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Pylenevirus paphis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5934 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Pythorivirus pauaes
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5935 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Rhipevirus didemis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5936 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Stentovirus reppertis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5937 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Styxivirus ecklonis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5938 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Tantalovirus resnatis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5939 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Taphiavirus pestrotis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5940 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Telemovirus vaitis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5941 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Tethyvirus abatis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5942 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Tethyvirus nemileis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5943 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Armipotenivirus tanscopis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5944 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Asperivirus lasarense
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5945 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Asperivirus nemenis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5946 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Atroxivirus austris
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5947 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Audacivirus pinazonis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5948 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Audaxivirus bacesis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5949 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Audaxivirus minifulis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5950 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Audaxivirus myomainis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5951 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Audaxivirus yotargis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5952 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Bellicusivirus grunawis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5953 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Belligerivirus frelianis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5954 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Citaivirus phonalis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5955 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Citataivirus sanlemaris
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5956 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Citataivirus uhadis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5957 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Citiorivirus crordgris
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5958 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Durusivirus erthyycolis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5959 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Ferullusivirus baguanis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5960 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Ferullusivirus cylocis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5961 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Ferullusivirus minfulis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5962 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Fervidivirus umantense
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5963 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Funestivirus anlentse
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5964 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Funestivirus seabatis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5965 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Incitativirus reperis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5966 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Incitatusivirus orancis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5967 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Malificivirus porcris
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5968 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Mordaxivirus sitoranense
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5969 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Nervillivirus flovetense
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5970 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Nocentianivirus saidatense
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5971 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Periculosovirus lancristus
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5972 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Periculosovirus satuanis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5973 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Pollentivirus pleritis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5974 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Potensivirus flowis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5975 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Properatisvirus sabatis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5976 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Properatisvirus stregense
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5977 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Rapidusivirus mimentis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5978 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Robaratusivirus reperis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5979 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Robaratusivirus semberis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5980 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Roburiusivirus westrobis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5981 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Strenuaivirus antaflavis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5982 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Strenuusivirus lasamoense
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5983 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Strenuusivirus resnapis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5984 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Tetricillivirus motavenis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5985 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Torentivirus aristcris
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5986 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Torentivirus crutis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5987 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Torentivirus curcianense
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5988 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Torentivirus lanversius
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5989 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Torentivirus orstucis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5990 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Torentivirus potacris
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5991 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Torentivirus zocris
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5992 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Valentivirus aedvexis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5993 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Valentivirus rhisidis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5994 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Valentivirus ridensis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5995 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Valentivirus saquitis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5996 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Validivirus umaspis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5997 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Vegetinivirus molmolis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5998 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Vegetinivirus nobatis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=5999 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Vegetivirus loriverwastis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6000 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Vegetivirus portlucense
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6001 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Vehemenivirus recresis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6002 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Velocianivirus diadonense
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6003 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Veloxivirus ubatis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6004 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Violenivirus cotis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6005 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Violenivirus raptis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6006 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Viratusivirus arilasis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6007 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Virilianivirus pachylongis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6008 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Volantivirus lastavis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6009 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Volantivirus zuncris
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6012 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Baranavirus uduis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6013 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Ketkevirus silauonis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6014 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Kopavirus kakawais
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6015 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Manawavirus kapowais
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6016 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Otevirus soksuewis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6017 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Patavirus kakahis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6018 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Pekavirus fuais
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6019 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Rakkovirus canuewis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6020 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Uewvirus yahnais
update vmr set  molecule = 'ssDNA(+)' from Vmr where sort_species=6026 and sort=1 and molecule <> 'ssDNA(+)' -- species: Nanovirus astragalirani
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6039 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Amaruvirus aka
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6040 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Amaruvirus masi
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6041 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Amaruvirus taruka
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6042 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Capamivirus cipi
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6043 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Capamivirus muyu
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6044 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Cinchivirus asul
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6045 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Cinchivirus quwi
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6046 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Intivirus quri
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6047 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Intivirus runa
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6048 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Intivirus surtixa
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6049 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Macochavirus kuci
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6050 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Macochavirus uywa
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6051 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Quillavirus paku
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6052 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Tambotovirus akara
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6053 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Yaviravirus kapata
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6109 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Chinseivirus sewoxi
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6110 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Chiunvirus auroris
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6111 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Chiunvirus grujae
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6112 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Chiunvirus melani
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6113 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Chiunvirus muliumi
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6114 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Chiunvirus sainlis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6115 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Doseivirus sewoxi
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6116 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Kaiwanvirus raringis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6117 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Kaiwanvirus sewoxi
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6118 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Kajamanuvirus cruti
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6119 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Kajamanuvirus cryonitae
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6120 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Kajamanuvirus lawatis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6121 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Kajamanuvirus moutis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6122 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Kajamanuvirus musmis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6123 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Kronovirus crassaminis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6124 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Ninurtavirus bowris
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6125 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Ninurtavirus cruti
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6126 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Ninurtavirus culiziae
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6127 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Ninurtavirus duliaris
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6128 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Ninurtavirus floridaense
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6129 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Ninurtavirus jaringis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6130 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Ninurtavirus lawatis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6131 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Ninurtavirus lophus
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6132 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Ninurtavirus maringis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6133 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Ninurtavirus mintis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6134 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Ninurtavirus momolo
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6135 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Ninurtavirus muliumi
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6136 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Ninurtavirus nowtis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6137 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Ninurtavirus oceanis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6138 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Ninurtavirus particulae
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6139 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Ninurtavirus pintis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6140 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Ninurtavirus pondae
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6141 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Ninurtavirus procoris
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6142 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Ninurtavirus raringis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6143 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Ninurtavirus rhiphus
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6144 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Ninurtavirus sewoxi
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6145 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Ninurtavirus tersae
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6146 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Ninurtavirus wagopi
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6147 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Ninurtavirus waseris
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6148 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Phainonvirus cryonitae
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6149 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Phainonvirus hydris
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6150 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Phainonvirus libraris
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6151 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Raagevirus napperis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6152 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Sadornvirus chesapis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6153 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Sagusvirus crownis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6154 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Sagusvirus jaringis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6155 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Sakkuthvirus batchis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6156 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Sakkuthvirus culiziae
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6157 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Sakkuthvirus donghis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6158 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Sakkuthvirus napperis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6159 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Sakkuthvirus raringis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6160 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Sanchirviurs lawatis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6161 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Sanivirus maringis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6162 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Sanivirus suspensae
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6163 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Saothovirus cruti
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6164 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Saothovirus dianchis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6165 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Saothovirus lawatis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6166 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Saothovirus manatis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6167 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Saothovirus maringis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6168 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Saothovirus mintis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6169 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Savurvirus yangris
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6170 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Scythevirus dianchis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6171 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Scythevirus lawatis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6172 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Scythevirus manatis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6173 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Scythevirus maringis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6174 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Scythevirus monetis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6175 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Scythevirus natringis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6176 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Seetinvirus maringis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6177 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Shabtayvirus brolerae
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6178 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Shabtayvirus lawatis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6179 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Shanivirus acrenis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6180 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Shanivirus airbis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6181 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Shanivirus bortici
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6182 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Shanivirus cryonitae
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6183 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Shanivirus culiziae
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6184 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Shanivirus lawatis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6185 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Shanivirus maringis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6186 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Shanivirus neozealandicus
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6187 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Shanivirus particulae
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6188 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Shanivirus partimae
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6189 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Shanivirus pondae
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6190 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Shanivirus sewoxi
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6191 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Shanivirus waseris
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6192 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Shanivirus yangris
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6193 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Sickelvirus hydris
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6194 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Sickelvirus maringis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6195 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Tuxingvirus gruidis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6196 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Zohali maramis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6197 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Zuhalvirus cruti
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6198 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Acamarivirus apogeeis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6199 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Acamarivirus cometis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6200 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Acamarivirus faculaes
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6201 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Acamarivirus lunaes
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6202 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Acamarivirus nebulais
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6203 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Acamarivirus parsecis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6204 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Acamarivirus perigeeis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6205 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Acamarivirus solis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6206 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Amalthevirus altais
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6207 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Anthevirus archis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6208 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Anthevirus beronis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6209 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Anthevirus cielois
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6210 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Anthevirus eris
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6211 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Anthevirus kuiperis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6212 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Anthevirus perseuis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6213 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Anthevirus rigelis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6214 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Cursavirus nadis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6215 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Cursavirus rocheis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6216 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Cursavirus zenis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6217 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Elnathivirus orbitis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6218 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Enifivirus asteris
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6219 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Fuluvirus siderealis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6220 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Fuluvirus stellaris
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6221 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Garivirus zodis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6222 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Himalivirus celestis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6223 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Himalivirus chandais
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6224 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Himalivirus cordelis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6225 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Himalivirus halles
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6226 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Janusivirus ophels
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6227 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Janusivirus portis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6228 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Thebevirus arielis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6988 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Acciovirus arizlamas
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6989 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Acciovirus quadrimis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6990 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Aguamentivirus avheatis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6991 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Aguamentivirus racskinis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6992 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Alohovirus ailgensis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6993 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Alohovirus bromhordis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6994 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Alohovirus bromis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6995 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Alohovirus trifolis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6996 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Aparevirus airobis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6997 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Avadavirus phoenis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6998 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Densaugvirus maspris
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=6999 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Diffindovirus austrosis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=7000 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Engorgivirus mincris
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=7001 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Engorgivirus musculis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=7002 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Episkevirus kirilis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=7003 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Episkevirus trichosis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=7004 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Expellivirus minnis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=7005 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Impedivirus copteris
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=7006 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Impedivirus libequis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=7007 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Lumovirus arcechis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=7008 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Oblivivirus yangtsis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=7009 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Patrovirus dianchis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=7010 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Protegovirus ailuris
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=7011 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Protegovirus mintis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=7012 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Protegovirus tongis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=7013 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Riddikuvirus forpesis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=7014 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Riddikuvirus manatis
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=7015 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Stupevirus kummerois
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=7016 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Wingardivirus arilais
update vmr set  molecule = 'ssDNA(+/-)' from Vmr where sort_species=7017 and sort=1 and molecule <> 'ssDNA(+/-)' -- species: Wingardivirus capibaris
update vmr set  molecule = 'dsDNA' from Vmr where sort_species=7024 and sort=1 and molecule <> 'dsDNA' -- species: Betapleolipovirus halogeometrici
update vmr set  molecule = 'dsDNA' from Vmr where sort_species=7027 and sort=1 and molecule <> 'dsDNA' -- species: Betapleolipovirus kalvoae
update vmr set  molecule = 'ssRNA(+/-)' from Vmr where sort_species=7034 and sort=1 and molecule <> 'ssRNA(+/-)' -- species: Orthodumbivirus armillariae
update vmr set  molecule = 'ssRNA(+/-)' from Vmr where sort_species=7035 and sort=1 and molecule <> 'ssRNA(+/-)' -- species: Orthodumbivirus duatulasnellae
update vmr set  molecule = 'ssRNA(+/-)' from Vmr where sort_species=7036 and sort=1 and molecule <> 'ssRNA(+/-)' -- species: Orthodumbivirus duoheterobasidii
update vmr set  molecule = 'ssRNA(+/-)' from Vmr where sort_species=7037 and sort=1 and molecule <> 'ssRNA(+/-)' -- species: Orthodumbivirus phlebiopsis
update vmr set  molecule = 'ssRNA(+/-)' from Vmr where sort_species=7038 and sort=1 and molecule <> 'ssRNA(+/-)' -- species: Orthodumbivirus rhizoctoniae
update vmr set  molecule = 'ssRNA(+/-)' from Vmr where sort_species=7039 and sort=1 and molecule <> 'ssRNA(+/-)' -- species: Orthodumbivirus unatulasnellae
update vmr set  molecule = 'ssRNA(+/-)' from Vmr where sort_species=7040 and sort=1 and molecule <> 'ssRNA(+/-)' -- species: Orthodumbivirus unoheterobasidii
update vmr set  molecule = 'ssRNA(+/-)' from Vmr where sort_species=7041 and sort=1 and molecule <> 'ssRNA(+/-)' -- species: Orthoquambivirus armillariae
update vmr set  molecule = 'ssRNA(+/-)' from Vmr where sort_species=7042 and sort=1 and molecule <> 'ssRNA(+/-)' -- species: Orthoquambivirus duatulasnellae
update vmr set  molecule = 'ssRNA(+/-)' from Vmr where sort_species=7043 and sort=1 and molecule <> 'ssRNA(+/-)' -- species: Orthoquambivirus tritulasnellae
update vmr set  molecule = 'ssRNA(+/-)' from Vmr where sort_species=7044 and sort=1 and molecule <> 'ssRNA(+/-)' -- species: Orthoquambivirus unatulasnellae
update vmr set  molecule = 'ssRNA(+/-)' from Vmr where sort_species=7045 and sort=1 and molecule <> 'ssRNA(+/-)' -- species: Orthotrimbivirus duarmillariae
update vmr set  molecule = 'ssRNA(+/-)' from Vmr where sort_species=7046 and sort=1 and molecule <> 'ssRNA(+/-)' -- species: Orthotrimbivirus duoheterobasidii
update vmr set  molecule = 'ssRNA(+/-)' from Vmr where sort_species=7047 and sort=1 and molecule <> 'ssRNA(+/-)' -- species: Orthotrimbivirus triarmillariae
update vmr set  molecule = 'ssRNA(+/-)' from Vmr where sort_species=7048 and sort=1 and molecule <> 'ssRNA(+/-)' -- species: Orthotrimbivirus unarmillariae
update vmr set  molecule = 'ssRNA(+/-)' from Vmr where sort_species=7049 and sort=1 and molecule <> 'ssRNA(+/-)' -- species: Orthotrimbivirus unheterobasidii
update vmr set  molecule = 'ssRNA(+/-)' from Vmr where sort_species=7050 and sort=1 and molecule <> 'ssRNA(+/-)' -- species: Orthounambivirus cryphonectriae
update vmr set  molecule = 'ssRNA(+/-)' from Vmr where sort_species=7051 and sort=1 and molecule <> 'ssRNA(+/-)' -- species: Orthounambivirus duarmillariae
update vmr set  molecule = 'ssRNA(+/-)' from Vmr where sort_species=7052 and sort=1 and molecule <> 'ssRNA(+/-)' -- species: Orthounambivirus phlebiopsis
update vmr set  molecule = 'ssRNA(+/-)' from Vmr where sort_species=7053 and sort=1 and molecule <> 'ssRNA(+/-)' -- species: Orthounambivirus unarmillariae
update vmr set  molecule = 'dsRNA' from Vmr where sort_species=7139 and sort=1 and molecule <> 'dsRNA' -- species: Victorivirus hachi
update vmr set  molecule = 'dsRNA' from Vmr where sort_species=7170 and sort=3 and molecule <> 'dsRNA' -- species: Quadrivirus ichi
update vmr set  molecule = 'dsRNA' from Vmr where sort_species=7239 and sort=1 and molecule <> 'dsRNA' -- species: Totivirus go
update vmr set  molecule = 'dsRNA' from Vmr where sort_species=7265 and sort=1 and molecule <> 'dsRNA' -- species: Totivirus sani
update vmr set  molecule = 'dsRNA' from Vmr where sort_species=7269 and sort=1 and molecule <> 'dsRNA' -- species: Totivirus shi
update vmr set  molecule = 'ssRNA(+/-)' from Vmr where sort_species=11874 and sort=1 and molecule <> 'ssRNA(+/-)' -- species: Olpivirus tulipae
update vmr set  molecule = 'ssRNA(-)' from Vmr where sort_species=11875 and sort=1 and molecule <> 'ssRNA(-)' -- species: Gryffinivirus alamedaense
update vmr set  molecule = 'ssRNA(-)' from Vmr where sort_species=11876 and sort=1 and molecule <> 'ssRNA(-)' -- species: Gryffinivirus hedwigae
update vmr set  molecule = 'ssRNA(+/-)' from Vmr where sort_species=12079 and sort=1 and molecule <> 'ssRNA(+/-)' -- species: Paratulasvirus agrocybes
update vmr set  molecule = 'ssRNA(-)' from Vmr where sort_species=12227 and sort=1 and molecule <> 'ssRNA(-)' -- species: Bocivirus botrytidis
update vmr set  molecule = 'ssRNA(-); ssRNA(+/-)' from Vmr where sort_species=12228 and sort=1 and molecule <> 'ssRNA(-); ssRNA(+/-)' -- species: Bocivirus fusarii
update vmr set  molecule = 'ssRNA(-)' from Vmr where sort_species=12229 and sort=1 and molecule <> 'ssRNA(-)' -- species: Bocivirus trichodermae
update vmr set  molecule = 'ssRNA(-); ssRNA(+/-)' from Vmr where sort_species=12233 and sort=1 and molecule <> 'ssRNA(-); ssRNA(+/-)' -- species: Coguvirus chrysanthae
update vmr set  molecule = 'ssRNA(-); ssRNA(+/-)' from Vmr where sort_species=12234 and sort=1 and molecule <> 'ssRNA(-); ssRNA(+/-)' -- species: Coguvirus citri
update vmr set  molecule = 'ssRNA(-); ssRNA(+/-)' from Vmr where sort_species=12260 and sort=1 and molecule <> 'ssRNA(-); ssRNA(+/-)' -- species: Mechlorovirus ramuense
update vmr set  molecule = 'dsDNA-RT' from Vmr where sort_species=13510 and sort=1 and molecule <> 'dsDNA-RT' -- species: Badnavirus camelliae
update vmr set  molecule = 'dsDNA-RT' from Vmr where sort_species=13546 and sort=1 and molecule <> 'dsDNA-RT' -- species: Badnavirus tessellopandani
update vmr set  molecule = 'dsDNA-RT' from Vmr where sort_species=13574 and sort=1 and molecule <> 'dsDNA-RT' -- species: Caulimovirus puerariae
update vmr set  molecule = 'dsDNA-RT' from Vmr where sort_species=13585 and sort=1 and molecule <> 'dsDNA-RT' -- species: Rosadnavirus maculaviolae
update vmr set  molecule = 'dsDNA-RT' from Vmr where sort_species=13592 and sort=1 and molecule <> 'dsDNA-RT' -- species: Soymovirus hibisci
update vmr set  molecule = 'dsDNA-RT' from Vmr where sort_species=13595 and sort=1 and molecule <> 'dsDNA-RT' -- species: Soymovirus malvae

--
-- fix accession numbers
-- 
update vmr set  exemplar_genbank_accession = 'Seg1: OP436269; Seg2: OP436270' select * from Vmr where sort_species=5380 and sort=1 and exemplar_genbank_accession <> 'Seg1: OP436269; Seg2: OP436270' -- species: Brevihamaparvovirus orthopteran1  notes=ssDNA, also accessions Seg1: OP436269; Seg2: OP436270
update vmr set  exemplar_seq_complete = 'Complete genome' from Vmr where sort_species=7139 and sort=1 and exemplar_seq_complete <> 'Complete genome' -- species: Victorivirus hachi  notes=Complete genome

update vmr set  exemplar_seq_complete = 'Coding-complete genome' from Vmr where sort_species=7239 and sort=1 and exemplar_seq_complete <> 'Coding-complete genome' -- species: Totivirus go  notes=Coding-complete genome
update vmr set  exemplar_seq_complete = 'Coding-complete genome' from Vmr where sort_species=7265 and sort=1 and exemplar_seq_complete <> 'Coding-complete genome' -- species: Totivirus sani  notes=Coding-complete genome
update vmr set  exemplar_seq_complete = 'Coding-complete genome' from Vmr where sort_species=7269 and sort=1 and exemplar_seq_complete <> 'Coding-complete genome' -- species: Totivirus shi  notes=Coding-complete genome_species=7269 and sort=1 and exemplar_seq_complete <> 'Coding-complete genome' -- species: E  notes=

update vmr set  exemplar_seq_complete = 'Partial genome' from Vmr where sort_species=1639 and sort=1 and exemplar_seq_complete <> 'Partial genome' -- species: Cinvestavvirus PaMx74  notes=OK to change to partial genome

update vmr set  exemplar_genbank_accession = 'RNA1: KX960112; RNA2: KX960111 ' from Vmr where sort_species=12234 and sort=1 and exemplar_genbank_accession <> 'RNA1: KX960112; RNA2: KX960111 ' -- species: Coguvirus citri  notes=VMR change OK Reverse order of segments - RNA 1 first.
update vmr set  exemplar_refseq_accession = ' RNA1: NC_035759; RNA2: NC_035454' from Vmr where sort_species=12234 and sort=1 and exemplar_refseq_accession <> ' RNA1: NC_035759; RNA2: NC_035454' -- species: Coguvirus citri  notes=VMR change OK Reverse order of segments - RNA 1 first.


select * from  vmr where vmr_uid=14661