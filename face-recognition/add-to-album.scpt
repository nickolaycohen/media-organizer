FasdUAS 1.101.10   ��   ��    k             l     ��  ��      Function to write logs     � 	 	 .   F u n c t i o n   t o   w r i t e   l o g s   
  
 i         I      �� ���� 0 writelog writeLog   ��  o      ���� 0 
logmessage 
logMessage��  ��    Q     )  ��  k            l        r        b        b    
    l    ����  I   �� ��
�� .sysoexecTEXT���     TEXT  m         � ! ! 2 d a t e   ' + % Y - % m - % d   % H : % M : % S '��  ��  ��    m    	 " " � # #    -    o   
 ���� 0 
logmessage 
logMessage  o      ���� 0 logentry logEntry   
& linefeed     � $ $  &   l i n e f e e d   %�� % I    �� &��
�� .sysoexecTEXT���     TEXT & b     ' ( ' b     ) * ) b     + , + m     - - � . . 
 e c h o   , n     / 0 / 1    ��
�� 
strq 0 o    ���� 0 logentry logEntry * m     1 1 � 2 2    > >   ( n     3 4 3 1    ��
�� 
strq 4 n     5 6 5 1    ��
�� 
psxp 6 m     7 7 � 8 8 � / U s e r s / n i c k o l a y c o h e n / d e v / m e d i a - o r g a n i z e r / f a c e - r e c o g n i t i o n / p h o t o s _ l o g . t x t��  ��    R      ������
�� .ascrerr ****      � ****��  ��  ��     9 : 9 l     ��������  ��  ��   :  ; < ; l   � =���� = t    � > ? > k   � @ @  A B A n    C D C I    �� E���� 0 writelog writeLog E  F�� F m     G G � H H P = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =��  ��   D  f     B  I J I l  	 	��������  ��  ��   J  K L K r   	  M N M b   	  O P O n   	  Q R Q 1    ��
�� 
psxp R l  	  S���� S I  	 �� T��
�� .earsffdralis        afdr T m   	 
��
�� afdrcusr��  ��  ��   P m     U U � V V j / d e v / m e d i a - o r g a n i z e r / f a c e - r e c o g n i t i o n / p h o t o _ u u i d s . t x t N o      ���� 0 uuidsfilepath uuidsFilePath L  W X W r     Y Z Y m     [ [ � \ \ * H i g h   A e s t h e t i c   P h o t o s Z o      ���� 0 	albumname 	albumName X  ] ^ ] l   ��������  ��  ��   ^  _ ` _ l   �� a b��   a   Read UUIDs from file    b � c c *   R e a d   U U I D s   f r o m   f i l e `  d e d r    & f g f n    $ h i h 2  " $��
�� 
cpar i l   " j���� j I   "�� k��
�� .sysoexecTEXT���     TEXT k b     l m l m     n n � o o  c a t   m n     p q p 1    ��
�� 
strq q o    ���� 0 uuidsfilepath uuidsFilePath��  ��  ��   g o      ���� 0 uuidlist uuidList e  r s r r   ' 0 t u t l  ' , v���� v I  ' ,�� w��
�� .corecnte****       **** w o   ' (���� 0 uuidlist uuidList��  ��  ��   u o      ���� 0 
totalfiles 
totalFiles s  x y x n  1 = z { z I   2 =�� |���� 0 writelog writeLog |  }�� } b   2 9 ~  ~ m   2 5 � � � � � h D e b u g :   S t a r t i n g   p r o c e s s i n g .   T o t a l   U U I D s   t o   p r o c e s s :    o   5 8���� 0 
totalfiles 
totalFiles��  ��   {  f   1 2 y  � � � l  > >��������  ��  ��   �  � � � l  > >�� � ���   �   Capture start time    � � � � &   C a p t u r e   s t a r t   t i m e �  � � � r   > M � � � c   > I � � � l  > E ����� � I  > E�� ���
�� .sysoexecTEXT���     TEXT � m   > A � � � � �  d a t e   + % s��  ��  ��   � m   E H��
�� 
long � o      ���� 0 	starttime 	startTime �  � � � l  N N��������  ��  ��   �  � � � O   Nl � � � k   Tk � �  � � � l  T T�� � ���   �   Ensure Photos is open    � � � � ,   E n s u r e   P h o t o s   i s   o p e n �  � � � n  T \ � � � I   U \�� ����� 0 writelog writeLog �  ��� � m   U X � � � � � 0 D e b u g :   A c t i v a t i n g   P h o t o s��  ��   �  f   T U �  � � � I  ] b������
�� .miscactvnull��� ��� null��  ��   �  � � � l  c c��������  ��  ��   �  � � � l  c c�� � ���   � 2 , Check if the album exists, create it if not    � � � � X   C h e c k   i f   t h e   a l b u m   e x i s t s ,   c r e a t e   i t   i f   n o t �  � � � n  c m � � � I   d m�� ����� 0 writelog writeLog �  ��� � b   d i � � � m   d g � � � � � J D e b u g :   C h e c k i n g   f o r   e x i s t i n g   a l b u m   -   � o   g h���� 0 	albumname 	albumName��  ��   �  f   c d �  � � � r   n s � � � m   n o��
�� boovfals � o      ���� 0 albumexists albumExists �  � � � r   t { � � � m   t w��
�� 
msng � o      ���� 0 targetalbum targetAlbum �  � � � l  | |��������  ��  ��   �  � � � X   | � ��� � � Z   � � � ����� � =  � � � � � n   � � � � � 1   � ���
�� 
pnam � o   � ����� 0 a   � o   � ����� 0 	albumname 	albumName � k   � � � �  � � � r   � � � � � o   � ����� 0 a   � o      ���� 0 targetalbum targetAlbum �  � � � r   � � � � � m   � ���
�� boovtrue � o      ���� 0 albumexists albumExists �  ��� �  S   � ���  ��  ��  �� 0 a   � 2   ���
�� 
IPal �  � � � l  � ���������  ��  ��   �  � � � Z   � � � ��� � � =  � � � � � o   � ����� 0 albumexists albumExists � m   � ���
�� boovfals � k   � � � �  � � � n  � � � � � I   � ��� ����� 0 writelog writeLog �  ��� � b   � � � � � m   � � � � � � � 0 D e b u g :   C r e a t i n g   a l b u m   -   � o   � ����� 0 	albumname 	albumName��  ��   �  f   � � �  ��� � r   � � � � � I  � ����� �
�� .corecrel****      � null��   � �� � �
�� 
kocl � m   � ���
�� 
IPal � �� ���
�� 
naME � o   � ��� 0 	albumname 	albumName��   � o      �~�~ 0 targetalbum targetAlbum��  ��   � n  � � � � � I   � ��} ��|�} 0 writelog writeLog �  ��{ � b   � � � � � m   � � � � � � � < D e b u g :   A l b u m   a l r e a d y   e x i s t s   -   � o   � ��z�z 0 	albumname 	albumName�{  �|   �  f   � � �  � � � l  � ��y�x�w�y  �x  �w   �  � � � l  � ��v � �v   �   Process each UUID     � $   P r o c e s s   e a c h   U U I D �  r   � � m   � ��u�u   o      �t�t  0 processedcount processedCount �s X   �k�r k  f		 

 l �q�q   > 8 my writeLog("Debug: Searching for UUID - " & photoUUID)    � p   m y   w r i t e L o g ( " D e b u g :   S e a r c h i n g   f o r   U U I D   -   "   &   p h o t o U U I D )  l �p�o�n�p  �o  �n    l  r   l �m�l 6  2 
�k
�k 
IPmi C   1  �j
�j 
ID   o  �i�i 0 	photouuid 	photoUUID�m  �l   o      �h�h 0 foundphotos foundPhotos   Strict match    �    S t r i c t   m a t c h �g Z  f �f! > ""#" o  �e�e 0 foundphotos foundPhotos# J  !�d�d    k  %Y$$ %&% n %A'(' I  &A�c)�b�c 0 writelog writeLog) *�a* b  &=+,+ b  &;-.- b  &7/0/ b  &3121 b  &/343 m  &)55 �66  A d d i n g :  4 [  ).787 o  ),�`�`  0 processedcount processedCount8 m  ,-�_�_ 2 m  /299 �::    o f  0 o  36�^�^ 0 
totalfiles 
totalFiles. m  7:;; �<<    |  , o  ;<�]�] 0 	photouuid 	photoUUID�a  �b  (  f  %&& =>= I BO�\?@
�\ .IPXSaddpnull���     ****? o  BE�[�[ 0 foundphotos foundPhotos@ �ZA�Y
�Z 
toAlA o  HK�X�X 0 targetalbum targetAlbum�Y  > B�WB r  PYCDC [  PUEFE o  PS�V�V  0 processedcount processedCountF m  ST�U�U D o      �T�T  0 processedcount processedCount�W  �f  ! n \fGHG I  ]f�SI�R�S 0 writelog writeLogI J�QJ b  ]bKLK m  ]`MM �NN H W a r n i n g :   P h o t o   n o t   f o u n d   f o r   U U I D   -  L o  `a�P�P 0 	photouuid 	photoUUID�Q  �R  H  f  \]�g  �r 0 	photouuid 	photoUUID o   � ��O�O 0 uuidlist uuidList�s   � m   N QOO�                                                                                  Phts  alis    0  Macintosh HD               �ym{BD ����
Photos.app                                                     �����ym{        ����  
 cu             Applications  !/:System:Applications:Photos.app/    
 P h o t o s . a p p    M a c i n t o s h   H D  System/Applications/Photos.app  / ��   � PQP l mm�N�M�L�N  �M  �L  Q RSR l mm�KTU�K  T . ( Capture end time & calculate throughput   U �VV P   C a p t u r e   e n d   t i m e   &   c a l c u l a t e   t h r o u g h p u tS WXW r  m|YZY c  mx[\[ l mt]�J�I] I mt�H^�G
�H .sysoexecTEXT���     TEXT^ m  mp__ �``  d a t e   + % s�G  �J  �I  \ m  tw�F
�F 
longZ o      �E�E 0 endtime endTimeX aba r  }�cdc \  }�efe o  }��D�D 0 endtime endTimef o  ���C�C 0 	starttime 	startTimed o      �B�B 0 durationsec  b ghg Z  ��ij�Aki ?  ��lml o  ���@�@ 0 durationsec  m m  ���?�?  j r  ��non ^  ��pqp o  ���>�>  0 processedcount processedCountq o  ���=�= 0 durationsec  o o      �<�< 0 throughputsec  �A  k r  ��rsr m  ���;�;  s o      �:�: 0 throughputsec  h tut l ���9�8�7�9  �8  �7  u vwv l ���6xy�6  x   Log performance results   y �zz 0   L o g   p e r f o r m a n c e   r e s u l t sw {|{ n ��}~} I  ���5�4�5 0 writelog writeLog ��3� b  ����� m  ���� ��� Z P r o c e s s i n g   c o m p l e t e d .   T o t a l   f i l e s   p r o c e s s e d :  � o  ���2�2  0 processedcount processedCount�3  �4  ~  f  ��| ��� n ����� I  ���1��0�1 0 writelog writeLog� ��/� b  ����� b  ����� b  ����� b  ����� m  ���� ��� $ T o t a l   t i m e   t a k e n :  � o  ���.�. 0 durationsec  � m  ���� ���    s e c   |  � ^  ����� o  ���-�- 0 durationsec  � m  ���,�, <� m  ���� ���    m i n�/  �0  �  f  ��� ��� n ����� I  ���+��*�+ 0 writelog writeLog� ��)� b  ����� b  ����� b  ����� b  ����� m  ���� ���  T h r o u g h p u t :  � o  ���(�( 0 throughputsec  � m  ���� ���    f i l e s / s e c   |  � ]  ����� o  ���'�' 0 throughputsec  � m  ���&�& <� m  ���� ���    f i l e s / m i n�)  �*  �  f  ��� ��� l ���%�$�#�%  �$  �#  � ��"� l ���!� ��!  �   �  �"   ? m     �����  ��   < ��� l     ����  �  �  �       �����  � ��� 0 writelog writeLog
� .aevtoappnull  �   � ****� � ������ 0 writelog writeLog� ��� �  �� 0 
logmessage 
logMessage�  � ��� 0 
logmessage 
logMessage� 0 logentry logEntry� 
  � " -� 1 7���

� .sysoexecTEXT���     TEXT
� 
strq
� 
psxp�  �
  � * "�j �%�%E�O��,%�%��,�,%j W X  	h� �	������
�	 .aevtoappnull  �   � ****� k    ���  ;��  �  �  � ��� 0 a  � 0 	photouuid 	photoUUID� <� G�� ���� U�� [�� n������������ � �����O ��� ��������������� ������� ����������59;����M_������������������ 0 writelog writeLog
�  afdrcusr
�� .earsffdralis        afdr
�� 
psxp�� 0 uuidsfilepath uuidsFilePath�� 0 	albumname 	albumName
�� 
strq
�� .sysoexecTEXT���     TEXT
�� 
cpar�� 0 uuidlist uuidList
�� .corecnte****       ****�� 0 
totalfiles 
totalFiles
�� 
long�� 0 	starttime 	startTime
�� .miscactvnull��� ��� null�� 0 albumexists albumExists
�� 
msng�� 0 targetalbum targetAlbum
�� 
IPal
�� 
kocl
�� 
cobj
�� 
pnam
�� 
naME�� 
�� .corecrel****      � null��  0 processedcount processedCount
�� 
IPmi�  
�� 
ID  �� 0 foundphotos foundPhotos
�� 
toAl
�� .IPXSaddpnull���     ****�� 0 endtime endTime�� 0 durationsec  �� 0 throughputsec  �� <���n)�k+ O�j �,�%E�O�E�O���,%j �-E�O�j E` O)a _ %k+ Oa j a &E` Oa )a k+ O*j O)a �%k+ OfE` Oa E` O 7*a -[a a l kh  �a ,�  �E` OeE` OY h[OY��O_ f  %)a  �%k+ O*a a a !�a " #E` Y )a $�%k+ OjE` %O y�[a a l kh *a &-a '[a (,\Z�>1E` )O_ )jv 9)a *_ %k%a +%_ %a ,%�%k+ O_ )a -_ l .O_ %kE` %Y )a /�%k+ [OY��UOa 0j a &E` 1O_ 1_ E` 2O_ 2j _ %_ 2!E` 3Y jE` 3O)a 4_ %%k+ O)a 5_ 2%a 6%_ 2a 7!%a 8%k+ O)a 9_ 3%a :%_ 3a 7 %a ;%k+ OPo ascr  ��ޭ