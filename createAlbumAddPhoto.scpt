FasdUAS 1.101.10   ��   ��    k             l     ��  ��    ) # Read UUIDs from the generated file     � 	 	 F   R e a d   U U I D s   f r o m   t h e   g e n e r a t e d   f i l e   
  
 l     ����  r         4     �� 
�� 
psxf  m       �   l / U s e r s / n i c k o l a y c o h e n / d e v / p i c t u r e - m a i n t e n a n c e / u u i d s . t x t  o      ���� 0 uuidfilepath uuidFilePath��  ��        l     ��������  ��  ��        l     ��  ��      Function to write logs     �   .   F u n c t i o n   t o   w r i t e   l o g s      i         I      �� ���� 0 writelog writeLog   ��  o      ���� 0 
logmessage 
logMessage��  ��    Q     +   ��  k    " ! !  " # " r     $ % $ b     & ' & b     ( ) ( b    
 * + * l    ,���� , I   �� -��
�� .sysoexecTEXT���     TEXT - m     . . � / / 2 d a t e   ' + % Y - % m - % d   % H : % M : % S '��  ��  ��   + m    	 0 0 � 1 1    -   ) o   
 ���� 0 
logmessage 
logMessage ' 1    ��
�� 
lnfd % o      ���� 0 logentry logEntry #  2�� 2 I   "�� 3��
�� .sysoexecTEXT���     TEXT 3 b     4 5 4 b     6 7 6 b     8 9 8 m     : : � ; ; 
 e c h o   9 n     < = < 1    ��
�� 
strq = o    ���� 0 logentry logEntry 7 m     > > � ? ?    > >   5 n     @ A @ 1    ��
�� 
strq A n     B C B 1    ��
�� 
psxp C m     D D � E E v / U s e r s / n i c k o l a y c o h e n / d e v / p i c t u r e - m a i n t e n a n c e / p h o t o s _ l o g . t x t��  ��     R      ������
�� .ascrerr ****      � ****��  ��  ��     F G F l     ��������  ��  ��   G  H I H l     �� J K��   J   Read UUIDs    K � L L    R e a d   U U I D s I  M N M l    O���� O r     P Q P J    	����   Q o      ���� 0 uuidlist uuidList��  ��   N  R S R l   Q T���� T Q    Q U V W U k    < X X  Y Z Y r     [ \ [ I   �� ]��
�� .rdwropenshor       file ] o    ���� 0 uuidfilepath uuidFilePath��   \ o      ���� 0 fileref fileRef Z  ^ _ ^ r      ` a ` I   �� b c
�� .rdwrread****        **** b o    ���� 0 fileref fileRef c �� d��
�� 
deli d 1    ��
�� 
lnfd��   a o      ���� 0 uuiddata uuidData _  e f e I  ! &�� g��
�� .rdwrclosnull���     **** g o   ! "���� 0 fileref fileRef��   f  h i h r   ' * j k j o   ' (���� 0 uuiddata uuidData k o      ���� 0 uuidlist uuidList i  l m l I   + 3�� n���� 0 writelog writeLog n  o�� o b   , / p q p m   , - r r � s s F S u c c e s s f u l l y   r e a d   U U I D s   f r o m   f i l e :   q o   - .���� 0 uuidfilepath uuidFilePath��  ��   m  t�� t I   4 <�� u���� 0 writelog writeLog u  v�� v b   5 8 w x w m   5 6 y y � z z  D a t a   r e a d :   x o   6 7���� 0 uuiddata uuidData��  ��  ��   V R      �� {��
�� .ascrerr ****      � **** { o      ���� 0 errmsg errMsg��   W k   D Q | |  } ~ } I   D N�� ���� 0 writelog writeLog   ��� � b   E J � � � m   E H � � � � � 2 E r r o r   r e a d i n g   U U I D   f i l e :   � o   H I���� 0 errmsg errMsg��  ��   ~  ��� � L   O Q����  ��  ��  ��   S  � � � l     ��������  ��  ��   �  � � � l  R� ����� � O   R� � � � k   X� � �  � � � I  X _�� ���
�� .sysodlogaskr        TEXT � m   X [ � � � � � 0 D e b u g :   A c t i v a t i n g   P h o t o s��   �  � � � I  ` e������
�� .miscactvnull��� ��� null��  ��   �  � � � l  f f��������  ��  ��   �  � � � l  f f�� � ���   � I C get the photo from the UUid parameter found in the parameter file     � � � � �   g e t   t h e   p h o t o   f r o m   t h e   U U i d   p a r a m e t e r   f o u n d   i n   t h e   p a r a m e t e r   f i l e   �  � � � r   f o � � � c   f k � � � o   f g���� 0 uuidlist uuidList � m   g j��
�� 
TEXT � o      ���� 0 
targetuuid 
targetUUID �  � � � r   p � � � � l  p � ����� � 6  p � � � � 2   p u��
�� 
IPmi � C   x � � � � 1   y }��
�� 
ID   � o   ~ ����� 0 
targetuuid 
targetUUID��  ��   � o      ���� 0 matchingitems matchingItems �  � � � Z   � � � ��� � � ?   � � � � � l  � � ����� � I  � ��� ���
�� .corecnte****       **** � o   � ����� 0 matchingitems matchingItems��  ��  ��   � m   � �����   � I  � ��� ���
�� .sysodlogaskr        TEXT � b   � � � � � m   � � � � � � �  P h o t o   f o u n d :   � l  � � ����� � n   � � � � � 1   � ���
�� 
filn � n   � � � � � 4   � ��� �
�� 
cobj � m   � �����  � o   � ����� 0 matchingitems matchingItems��  ��  ��  ��   � I  � ��� ���
�� .sysodlogaskr        TEXT � m   � � � � � � �  P h o t o   n o t   f o u n d��   �  � � � l  � ���������  ��  ��   �  � � � l  � ���������  ��  ��   �  � � � l  � ��� � ���   � * $if (count of matchingItems) > 0 then    � � � � H i f   ( c o u n t   o f   m a t c h i n g I t e m s )   >   0   t h e n �  � � � l  � ��� � ���   � 4 .	set foundPhoto to first item of matchingItems    � � � � \ 	 s e t   f o u n d P h o t o   t o   f i r s t   i t e m   o f   m a t c h i n g I t e m s �  � � � l  � ��� � ���   � L F	display dialog "Found photo with filename: " & filename of foundPhoto    � � � � � 	 d i s p l a y   d i a l o g   " F o u n d   p h o t o   w i t h   f i l e n a m e :   "   &   f i l e n a m e   o f   f o u n d P h o t o �  � � � l  � ��� � ���   � 
 else    � � � �  e l s e �  � � � l  � ��� � ���   � ? 9	display dialog "No photo found with UUID: " & targetUUID    � � � � r 	 d i s p l a y   d i a l o g   " N o   p h o t o   f o u n d   w i t h   U U I D :   "   &   t a r g e t U U I D �  � � � l  � ��� � ���   �  end if    � � � �  e n d   i f �  � � � l  � �����~��  �  �~   �  ��} � X   �� ��| � � Q   �� � � � � k   �� � �  � � � l  � ��{ � ��{   � ) # create or get the container folder    � � � � F   c r e a t e   o r   g e t   t h e   c o n t a i n e r   f o l d e r �  � � � l  � � � � � � r   � � � � � m   � � � � � � � 6 0 1 - H i g h   R a t e d   E v e n t s   I n t a k e � o      �z�z 0 
foldername 
folderName � !  Change to your folder name    � � � � 6   C h a n g e   t o   y o u r   f o l d e r   n a m e �  � � � l  � ��y � ��y   � !  Check if the folder exists    � �   6   C h e c k   i f   t h e   f o l d e r   e x i s t s �  r   � � m   � ��x
�x boovfals o      �w�w .0 containerfolderexists containerFolderExists  r   � � m   � ��v
�v 
msng o      �u�u .0 containertargetfolder containerTargetFolder 	
	 l  � ��t�s�r�t  �s  �r  
  X   ��q Z   ��p�o =  � n   � 1   ��n
�n 
pnam o   � ��m�m 0 afolder aFolder o  �l�l 0 
foldername 
folderName k    r   m  	�k
�k boovtrue o      �j�j .0 containerfolderexists containerFolderExists  r   o  �i�i 0 afolder aFolder o      �h�h .0 containertargetfolder containerTargetFolder �g  S  �g  �p  �o  �q 0 afolder aFolder l  � ��f�e e   � �   2  � ��d
�d 
IPfd�f  �e   !"! l �c�b�a�c  �b  �a  " #$# l �`%&�`  % , & Create the folder if it doesn�t exist   & �'' L   C r e a t e   t h e   f o l d e r   i f   i t   d o e s n  t   e x i s t$ ()( Z  B*+�_,* = $-.- o  "�^�^ .0 containerfolderexists containerFolderExists. m  "#�]
�] boovfals+ k  '>// 010 l ''�\23�\  2 F @display dialog "containerTargetFolder does not exist - creating"   3 �44 � d i s p l a y   d i a l o g   " c o n t a i n e r T a r g e t F o l d e r   d o e s   n o t   e x i s t   -   c r e a t i n g "1 5�[5 r  '>676 I ':�Z�Y8
�Z .corecrel****      � null�Y  8 �X9:
�X 
kocl9 m  +.�W
�W 
IPfd: �V;�U
�V 
naME; o  14�T�T 0 
foldername 
folderName�U  7 o      �S�S .0 containertargetfolder containerTargetFolder�[  �_  , l AA�R<=�R  < o idisplay dialog ("containerTargetFolder " & name of containerTargetFolder as string) & "exists - skipping"   = �>> � d i s p l a y   d i a l o g   ( " c o n t a i n e r T a r g e t F o l d e r   "   &   n a m e   o f   c o n t a i n e r T a r g e t F o l d e r   a s   s t r i n g )   &   " e x i s t s   -   s k i p p i n g ") ?@? l CC�Q�P�O�Q  �P  �O  @ ABA l CC�NCD�N  C   process the child folder   D �EE 2   p r o c e s s   t h e   c h i l d   f o l d e rB FGF r  CLHIH n  CHJKJ m  DH�M
�M 
ldt K o  CD�L�L 0 aphoto aPhotoI o      �K�K 0 cdate cDateG LML r  M\NON c  MXPQP n  MTRSR 1  PT�J
�J 
yearS o  MP�I�I 0 cdate cDateQ m  TW�H
�H 
TEXTO o      �G�G 0 y  M TUT r  ]lVWV c  ]hXYX l ]dZ�F�EZ n  ]d[\[ m  `d�D
�D 
mnth\ o  ]`�C�C 0 cdate cDate�F  �E  Y m  dg�B
�B 
longW o      �A�A 0 mnum mNumU ]^] Z  m�_`�@a_ A  mtbcb o  mp�?�? 0 mnum mNumc m  ps�>�> 
` r  w�ded c  w�fgf b  w~hih m  wzjj �kk  0i o  z}�=�= 0 mnum mNumg m  ~��<
�< 
TEXTe o      �;�; 0 m  �@  a r  ��lml o  ���:�: 0 mnum mNumm o      �9�9 0 m  ^ non r  ��pqp n  ��rsr 1  ���8
�8 
day s o  ���7�7 0 cdate cDateq o      �6�6 0 dnum dNumo tut Z  ��vw�5xv A  ��yzy o  ���4�4 0 dnum dNumz m  ���3�3 
w r  ��{|{ c  ��}~} b  ��� m  ���� ���  0� o  ���2�2 0 dnum dNum~ m  ���1
�1 
TEXT| o      �0�0 0 d  �5  x r  ����� o  ���/�/ 0 dnum dNum� o      �.�. 0 d  u ��� r  ����� b  ����� b  ����� b  ����� b  ����� o  ���-�- 0 y  � m  ���� ���  -� o  ���,�, 0 m  � m  ���� ���  -� o  ���+�+ 0 d  � o      �*�* 0 	albumname 	albumName� ��� l ���)���)  � ) # writeLog("albumName " & albumName)   � ��� F   w r i t e L o g ( " a l b u m N a m e   "   &   a l b u m N a m e )� ��� l ���(�'�&�(  �'  �&  � ��� l ���%���%  �    Check if the album exists   � ��� 4   C h e c k   i f   t h e   a l b u m   e x i s t s� ��� r  ����� m  ���$
�$ boovfals� o      �#�# 0 albumexists albumExists� ��� r  ����� J  ���"�"  � o      �!�! 0 	albumlist 	albumList� ��� r  ����� m  ��� 
�  
msng� o      �� 0 thealbum theAlbum� ��� l ������  �  �  � ��� X  �3���� k  	.�� ��� l 		����  �  �  � ��� r  	��� n  	��� 1  
�
� 
pnam� o  	
�� 0 analbum anAlbum� o      �� 0 nameofalbum nameOfAlbum� ��� Z  .����� =  ��� o  �� 0 nameofalbum nameOfAlbum� o  �� 0 	albumname 	albumName� k  *�� ��� r  "��� m  �
� boovtrue� o      �� 0 albumexists albumExists� ��� r  #(��� o  #$�� 0 analbum anAlbum� o      �� 0 thealbum theAlbum� ���  S  )*�  �  �  �  � 0 analbum anAlbum� l ����
�	� e  ���� n ����� 2 ���
� 
IPal� o  ���� .0 containertargetfolder containerTargetFolder�
  �	  � ��� l 44����  �  �  � ��� Z  4q����� = 49��� o  47�� 0 albumexists albumExists� m  78�
� boovfals� k  <m�� ��� I <O� ���
�  .sysodlogaskr        TEXT� b  <K��� l <G������ c  <G��� b  <C��� m  <?�� ���  A l b u m  � o  ?B���� 0 	albumname 	albumName� m  CF��
�� 
TEXT��  ��  � m  GJ�� ���     d o e s   n o t   e x i s t .��  � ���� r  Pm��� I Pi�����
�� .corecrel****      � null��  � ����
�� 
kocl� m  TW��
�� 
IPal� ����
�� 
naME� o  Z]���� 0 	albumname 	albumName� �����
�� 
atFD� o  `c���� .0 containertargetfolder containerTargetFolder��  � o      ���� 0 thealbum theAlbum��  �  � l pp��������  ��  ��  � ��� l rr��������  ��  ��  � ��� l rr������  � U O display dialog "count of matchingItems: " & (count of matchingItems) as string   � ��� �   d i s p l a y   d i a l o g   " c o u n t   o f   m a t c h i n g I t e m s :   "   &   ( c o u n t   o f   m a t c h i n g I t e m s )   a s   s t r i n g� ��� Z  r������� ?  r{��� l ry������ I ry�����
�� .corecnte****       ****� o  ru���� 0 matchingitems matchingItems��  ��  ��  � m  yz����  � k  ~�    I ~���
�� .IPXSaddpnull���     **** o  ~����� 0 matchingitems matchingItems ����
�� 
toAl o  ������ 0 thealbum theAlbum��   �� I ������
�� .sysodlogaskr        TEXT b  ��	 b  ��

 b  �� b  �� m  �� �  A d d e d   l ������ I ������
�� .corecnte****       **** o  ������ 0 matchingitems matchingItems��  ��  ��   m  �� �    p h o t o ( s )   t o   ' o  ������ 0 	albumname 	albumName	 m  �� �  '��  ��  ��  � I ������
�� .sysodlogaskr        TEXT m  �� �   N o   p h o t o s   a d d e d !��  �  l ����������  ��  ��    l ���� ��   3 -writeLog("Photo added to album " & albumName)     �!! Z w r i t e L o g ( " P h o t o   a d d e d   t o   a l b u m   "   &   a l b u m N a m e ) "��" l ����������  ��  ��  ��   � R      ��#��
�� .ascrerr ****      � ****# o      ���� 0 errmsg2 errMsg2��   � l ����$%��  $ 5 / writeLog("Error processing photo: " & errMsg2)   % �&& ^   w r i t e L o g ( " E r r o r   p r o c e s s i n g   p h o t o :   "   &   e r r M s g 2 )�| 0 aphoto aPhoto � o   � ����� 0 matchingitems matchingItems�}   � m   R U''�                                                                                  Phts  alis    0  Macintosh HD               �ym{BD ����
Photos.app                                                     �����ym{        ����  
 cu             Applications  !/:System:Applications:Photos.app/    
 P h o t o s . a p p    M a c i n t o s h   H D  System/Applications/Photos.app  / ��  ��  ��   � (��( l     ��������  ��  ��  ��       "��)*+,-��-./ ���012��3����4��567����������������������  )  ������������������������������������������������������������������ 0 writelog writeLog
�� .aevtoappnull  �   � ****�� 0 uuidfilepath uuidFilePath�� 0 uuidlist uuidList�� 0 fileref fileRef�� 0 uuiddata uuidData�� 0 
targetuuid 
targetUUID�� 0 matchingitems matchingItems�� 0 
foldername 
folderName�� .0 containerfolderexists containerFolderExists�� .0 containertargetfolder containerTargetFolder�� 0 cdate cDate�� 0 y  �� 0 mnum mNum�� 0 m  �� 0 dnum dNum�� 0 d  �� 0 	albumname 	albumName�� 0 albumexists albumExists�� 0 	albumlist 	albumList�� 0 thealbum theAlbum�� 0 nameofalbum nameOfAlbum��  ��  ��  ��  ��  ��  ��  ��  ��  ��  * �� ����89���� 0 writelog writeLog�� ��:�� :  ���� 0 
logmessage 
logMessage��  8 ������ 0 
logmessage 
logMessage�� 0 logentry logEntry9  .�� 0�� :�� > D������
�� .sysoexecTEXT���     TEXT
�� 
lnfd
�� 
strq
�� 
psxp��  ��  �� , $�j �%�%�%E�O��,%�%��,�,%j W X 	 
h+ ��;���<=�~
�� .aevtoappnull  �   � ****; k    �>>  
??  M@@  RAA  ��}�}  ��  �  < �|�{�z�y�x�| 0 errmsg errMsg�{ 0 aphoto aPhoto�z 0 afolder aFolder�y 0 analbum anAlbum�x 0 errmsg2 errMsg2= L�w �v�u�t�s�r�q�p�o�n r�m y�l�k �' ��j�i�h�g�fB�e�d�c ��b�a ��` ��_�^�]�\�[�Z�Y�X�W�V�U�T�S�R�Q�P�Oj�N�M�L��K���J�I�H�G�F�E���D�C�B�A�@
�w 
psxf�v 0 uuidfilepath uuidFilePath�u 0 uuidlist uuidList
�t .rdwropenshor       file�s 0 fileref fileRef
�r 
deli
�q 
lnfd
�p .rdwrread****        ****�o 0 uuiddata uuidData
�n .rdwrclosnull���     ****�m 0 writelog writeLog�l 0 errmsg errMsg�k  
�j .sysodlogaskr        TEXT
�i .miscactvnull��� ��� null
�h 
TEXT�g 0 
targetuuid 
targetUUID
�f 
IPmiB  
�e 
ID  �d 0 matchingitems matchingItems
�c .corecnte****       ****
�b 
cobj
�a 
filn
�` 
kocl�_ 0 
foldername 
folderName�^ .0 containerfolderexists containerFolderExists
�] 
msng�\ .0 containertargetfolder containerTargetFolder
�[ 
IPfd
�Z 
pnam
�Y 
naME�X 
�W .corecrel****      � null
�V 
ldt �U 0 cdate cDate
�T 
year�S 0 y  
�R 
mnth
�Q 
long�P 0 mnum mNum�O 
�N 0 m  
�M 
day �L 0 dnum dNum�K 0 d  �J 0 	albumname 	albumName�I 0 albumexists albumExists�H 0 	albumlist 	albumList�G 0 thealbum theAlbum
�F 
IPal�E 0 nameofalbum nameOfAlbum
�D 
atFD�C 
�B 
toAl
�A .IPXSaddpnull���     ****�@ 0 errmsg2 errMsg2�~�)��/E�OjvE�O 2�j E�O���l E�O�j 
O�E�O*��%k+ O*��%k+ W X  *a �%k+ OhOa ka j O*j O�a &E` O*a -a [a ,\Z_ >1E` O_ j j a _ a k/a ,%j Y 	a j O_ [a  a l kh �a !E` "OfE` #Oa $E` %O :*a &-E[a  a l kh �a ',_ "  eE` #O�E` %OY h[OY��O_ #f  *a  a &a (_ "a ) *E` %Y hO�a +,E` ,O_ ,a -,a &E` .O_ ,a /,a 0&E` 1O_ 1a 2 a 3_ 1%a &E` 4Y 	_ 1E` 4O_ ,a 5,E` 6O_ 6a 2 a 7_ 6%a &E` 8Y 	_ 6E` 8O_ .a 9%_ 4%a :%_ 8%E` ;OfE` <OjvE` =Oa $E` >O D_ %a ?-E[a  a l kh �a ',E` @O_ @_ ;  eE` <O�E` >OY h[OY��O_ <f  6a A_ ;%a &a B%j O*a  a ?a (_ ;a C_ %a D *E` >Y hO_ j j ._ a E_ >l FOa G_ j %a H%_ ;%a I%j Y 	a Jj OPW X K h[OY�U, Afurlfile:///Users/nickolaycohen/dev/picture-maintenance/uuids.txt- �?C�? C  .. �DD H 8 0 9 7 7 8 5 5 - 1 9 3 1 - 4 B E 3 - 9 F 0 6 - 9 6 A 0 5 1 3 F B 5 3 C�� / �>E�> E  FF GG '�=H�<
�= 
IPmiH �II V 8 0 9 7 7 8 5 5 - 1 9 3 1 - 4 B E 3 - 9 F 0 6 - 9 6 A 0 5 1 3 F B 5 3 C / L 0 / 0 0 1
�< kfrmID  
�� boovtrue0 JJ K�;�:K �9L�9 L  MNOPQRSTUVWXYZ[\]^_`abcM dd '�8e�7
�8 
IPfde �ff V 2 7 7 1 E D 3 2 - 1 8 8 7 - 4 A B 6 - 9 4 B 0 - B D D C 4 7 4 7 9 2 5 B / L 0 / 0 2 0
�7 kfrmID  N gg '�6h�5
�6 
IPfdh �ii V 6 0 9 D B E 5 B - B B 2 B - 4 A 5 2 - 8 0 C B - A 0 3 D 3 5 6 6 6 F 3 4 / L 0 / 0 2 0
�5 kfrmID  O jj '�4k�3
�4 
IPfdk �ll V 8 5 4 A 3 F 5 9 - 9 E 0 B - 4 7 6 E - A 8 C 7 - 9 0 A 1 6 6 3 8 2 E 4 3 / L 0 / 0 2 0
�3 kfrmID  P mm '�2n�1
�2 
IPfdn �oo V B 2 C 5 E 2 9 8 - 7 A 1 0 - 4 3 3 C - B A 3 8 - A 3 9 4 3 2 D C F 8 A 5 / L 0 / 0 2 0
�1 kfrmID  Q pp '�0q�/
�0 
IPfdq �rr V 8 A 4 D 4 D 5 7 - C 7 1 D - 4 4 6 1 - B 1 3 C - E 7 4 5 E 1 D 3 6 2 D 3 / L 0 / 0 2 0
�/ kfrmID  R ss '�.t�-
�. 
IPfdt �uu V 1 8 C 0 3 0 2 2 - 4 D D 1 - 4 3 2 6 - 8 D 0 5 - D E 5 6 B 9 E 4 6 B 0 C / L 0 / 0 2 0
�- kfrmID  S vv '�,w�+
�, 
IPfdw �xx V 5 2 6 6 D E 6 A - A 7 E A - 4 C 6 5 - 9 E 8 E - 0 9 D 3 E C 2 9 C 3 5 D / L 0 / 0 2 0
�+ kfrmID  T yy '�*z�)
�* 
IPfdz �{{ V D 1 8 D E 3 4 A - 7 7 B B - 4 C 9 0 - B C 2 6 - 8 D 4 D A 9 3 B B A 8 E / L 0 / 0 2 0
�) kfrmID  U || '�(}�'
�( 
IPfd} �~~ V E 9 2 D 1 C 9 E - 5 B D 6 - 4 D 7 5 - 9 5 C F - 1 8 3 F F 5 3 6 3 6 7 7 / L 0 / 0 2 0
�' kfrmID  V  '�&��%
�& 
IPfd� ��� V 5 5 D F A F B 2 - 5 C A 2 - 4 B 7 4 - 8 2 6 C - 4 D F C E D A A 2 B 3 3 / L 0 / 0 2 0
�% kfrmID  W �� '�$��#
�$ 
IPfd� ��� V 5 E C 1 0 1 5 5 - 2 E D 1 - 4 F 1 C - A F C B - 0 9 8 8 7 2 A 6 D E 0 4 / L 0 / 0 2 0
�# kfrmID  X �� '�"��!
�" 
IPfd� ��� V 9 E D E 7 4 4 3 - 5 A 2 8 - 4 C 2 B - B 5 2 3 - A 0 2 A B 8 A 8 6 D 9 5 / L 0 / 0 2 0
�! kfrmID  Y �� '� ��
�  
IPfd� ��� V E 4 B E 2 5 8 5 - E 9 5 3 - 4 3 4 8 - A 2 5 8 - 3 3 9 9 0 5 1 4 2 7 F D / L 0 / 0 2 0
� kfrmID  Z �� '���
� 
IPfd� ��� V 6 B 2 4 3 6 5 0 - E A 6 2 - 4 C 0 F - B 4 B 7 - F E 0 2 E B B 5 C 0 7 8 / L 0 / 0 2 0
� kfrmID  [ �� '���
� 
IPfd� ��� V A F A 9 B 3 5 7 - 2 2 A 3 - 4 C 4 5 - 9 3 C F - 5 6 6 B C C 7 A 1 4 D 3 / L 0 / 0 2 0
� kfrmID  \ �� '���
� 
IPfd� ��� V 1 C E B 1 7 B E - 0 9 7 2 - 4 7 9 D - A B E B - 9 7 1 C 2 C 3 9 7 A C 2 / L 0 / 0 2 0
� kfrmID  ] �� '���
� 
IPfd� ��� V E 8 4 A D D 1 E - 4 9 2 B - 4 5 2 E - 9 A 7 3 - 3 E 4 6 6 9 B 0 9 E 5 E / L 0 / 0 2 0
� kfrmID  ^ �� '���
� 
IPfd� ��� V 4 5 F C 4 8 0 4 - 2 3 C 6 - 4 B B 8 - B B B F - 9 F 9 8 8 F 1 5 D F 9 B / L 0 / 0 2 0
� kfrmID  _ �� '���
� 
IPfd� ��� V F 4 F 3 9 1 F 7 - 4 E B 2 - 4 D 9 D - 9 E C B - C C 4 1 4 E 9 3 3 7 2 9 / L 0 / 0 2 0
� kfrmID  ` �� '���
� 
IPfd� ��� V C A F 3 2 8 9 C - 3 8 4 F - 4 9 C F - 9 A 7 4 - 3 E E 5 F 2 9 8 2 E 3 B / L 0 / 0 2 0
� kfrmID  a �� '���
� 
IPfd� ��� V D 4 F 5 A 6 0 D - 3 B 7 F - 4 A 0 5 - A D 3 9 - E 0 4 5 0 9 8 9 0 4 8 B / L 0 / 0 2 0
� kfrmID  b �� '���
� 
IPfd� ��� V 6 D 7 7 2 C 2 1 - 9 4 D F - 4 B E 0 - A 7 2 9 - A 6 C 7 C E 7 D C 7 A 9 / L 0 / 0 2 0
� kfrmID  c �� '���
� 
IPfd� ��� V F F 9 7 D 8 C E - 5 F 1 5 - 4 1 A 4 - B 2 5 A - 0 7 4 F A 1 7 6 B E B 9 / L 0 / 0 2 0
� kfrmID  
�; 
cobj�: 1 ldt     �Em2 ���  2 0 2 0�� 3 ���  0 7�� �� 4 ���  2 0 2 0 - 0 7 - 2 8
�� boovfals5 �
�	�
  �	  6 �� ����� '���
� 
IPfd� ��� V 2 7 7 1 E D 3 2 - 1 8 8 7 - 4 A B 6 - 9 4 B 0 - B D D C 4 7 4 7 9 2 5 B / L 0 / 0 2 0
� kfrmID  
� 
IPct� ��� V 5 D A 4 7 6 A 6 - 6 0 F D - 4 0 5 C - 8 0 B B - D 2 E 5 8 2 7 5 C 5 4 E / L 0 / 0 4 0
� kfrmID  7 ���  2 0 2 3 - 0 7 - 1 2��  ��  ��  ��  ��  ��  ��  ��  ��  ��   ascr  ��ޭ