Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5F826E072
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Nov 2020 18:58:15 +0000 (UTC)
References: <20201120105217.5058-1-tzimmermann@suse.de>
 <20201120105217.5058-2-tzimmermann@suse.de>
 <20201123112724.GP7444@platvala-desk.ger.corp.intel.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <46d49d87-9745-d43a-0391-fcec2d702b02@suse.de>
Date: Mon, 23 Nov 2020 19:58:13 +0100
MIME-Version: 1.0
In-Reply-To: <20201123112724.GP7444@platvala-desk.ger.corp.intel.com>
Subject: Re: [igt-dev] [PATCH v6 1/8] tests/fbdev: Move existing tests into
 separate subgroups
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1048957425=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Petri Latvala <petri.latvala@intel.com>
Cc: igt-dev@lists.freedesktop.org, chris@chris-wilson.co.uk
List-ID: <igt-dev@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1048957425==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="XERsx2IYI7o94J10le21DZuNRVrB1DzXO"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--XERsx2IYI7o94J10le21DZuNRVrB1DzXO
Content-Type: multipart/mixed; boundary="e6Ox7D036JLsYni2NBEuo8dAbvN7ASNDw";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Petri Latvala <petri.latvala@intel.com>
Cc: chris@chris-wilson.co.uk, daniel.vetter@ffwll.ch,
 igt-dev@lists.freedesktop.org
Message-ID: <46d49d87-9745-d43a-0391-fcec2d702b02@suse.de>
Subject: Re: [PATCH v6 1/8] tests/fbdev: Move existing tests into separate
 subgroups
References: <20201120105217.5058-1-tzimmermann@suse.de>
 <20201120105217.5058-2-tzimmermann@suse.de>
 <20201123112724.GP7444@platvala-desk.ger.corp.intel.com>
In-Reply-To: <20201123112724.GP7444@platvala-desk.ger.corp.intel.com>

--e6Ox7D036JLsYni2NBEuo8dAbvN7ASNDw
Content-Type: multipart/mixed;
 boundary="------------A5D1341F58D0CC531CACF50F"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------A5D1341F58D0CC531CACF50F
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable



Am 23.11.20 um 12:27 schrieb Petri Latvala:
> On Fri, Nov 20, 2020 at 11:52:10AM +0100, Thomas Zimmermann wrote:
>> Move the existing tests into subgroups for testing modesetting and
>> accessing the framebuffer.
>>
>> v5:
>> 	* test mmap() with igt_assert() (Daniel, Chris)
>> v4:
>> 	* declare fd as volatile (Petri)
>> 	* add info test to CI
>> v3:
>> 	* put igt_describe() before igt_subtest() and igt_subtest_group()
>> 	  (Petri)
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>=20
> Reviewed-by: Petri Latvala <petri.latvala@intel.com>

Thanks for your reviews.

>=20
>=20
>> ---
>>   tests/fbdev.c                         | 53 ++++++++++++++++++++-----=
--
>>   tests/intel-ci/fast-feedback.testlist |  1 +
>>   2 files changed, 41 insertions(+), 13 deletions(-)
>>
>> diff --git a/tests/fbdev.c b/tests/fbdev.c
>> index e5efeb93..a803f445 100644
>> --- a/tests/fbdev.c
>> +++ b/tests/fbdev.c
>> @@ -37,28 +37,17 @@
>>  =20
>>   #include "igt.h"
>>  =20
>> -igt_main
>> +static void mode_tests(int fd)
>>   {
>>   	struct fb_var_screeninfo var_info;
>>   	struct fb_fix_screeninfo fix_info;
>> -	int fd =3D -1;
>>  =20
>> -	/*
>> -	 * Should this test focus on the fbdev independent of any drm driver=
,
>> -	 * or should it look for fbdev of a particular device?
>> -	 */
>>   	igt_fixture {
>> -		fd =3D open("/dev/fb0", O_RDWR);
>> -		if (fd < 0) {
>> -			drm_load_module(DRIVER_ANY);
>> -			fd =3D open("/dev/fb0", O_RDWR);
>> -		}
>> -		igt_require_f(fd !=3D -1, "/dev/fb0\n");
>> -
>>   		igt_require(ioctl(fd, FBIOGET_VSCREENINFO, &var_info) =3D=3D 0);
>>   		igt_require(ioctl(fd, FBIOGET_FSCREENINFO, &fix_info) =3D=3D 0);
>>   	}
>>  =20
>> +	igt_describe("Check if screeninfo is valid");
>>   	igt_subtest("info") {
>>   		unsigned long size;
>>  =20
>> @@ -69,7 +58,17 @@ igt_main
>>   			     fix_info.line_length,
>>   			     fix_info.smem_len);
>>   	}
>> +}
>> +
>> +static void framebuffer_tests(int fd)
>> +{
>> +	struct fb_fix_screeninfo fix_info;
>> +
>> +	igt_fixture {
>> +		igt_require(ioctl(fd, FBIOGET_FSCREENINFO, &fix_info) =3D=3D 0);
>> +	}
>>  =20
>> +	igt_describe("Check mmap operations on framebuffer memory");
>>   	igt_subtest("mmap") {
>>   		void *map;
>>  =20
>> @@ -82,6 +81,34 @@ igt_main
>>   		memset(map, 0, fix_info.smem_len);
>>   		munmap(map, fix_info.smem_len);
>>   	}
>> +}
>> +
>> +igt_main
>> +{
>> +	volatile int fd =3D -1;
>> +
>> +	/*
>> +	 * Should this test focus on the fbdev independent of any drm driver=
,
>> +	 * or should it look for fbdev of a particular device?
>> +	 */
>> +	igt_fixture {
>> +		fd =3D open("/dev/fb0", O_RDWR);
>> +		if (fd < 0) {
>> +			drm_load_module(DRIVER_ANY);
>> +			fd =3D open("/dev/fb0", O_RDWR);
>> +		}
>> +		igt_require_f(fd !=3D -1, "/dev/fb0\n");
>> +	}
>> +
>> +	igt_describe("Check modesetting");
>> +	igt_subtest_group {
>> +		mode_tests(fd);
>> +	}
>> +
>> +	igt_describe("Check framebuffer access");
>> +	igt_subtest_group {
>> +		framebuffer_tests(fd);
>> +	}
>>  =20
>>   	igt_fixture {
>>   		close(fd);
>> diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fa=
st-feedback.testlist
>> index 83722f83..a40410a8 100644
>> --- a/tests/intel-ci/fast-feedback.testlist
>> +++ b/tests/intel-ci/fast-feedback.testlist
>> @@ -2,6 +2,7 @@
>>  =20
>>   igt@core_auth@basic-auth
>>   igt@debugfs_test@read_all_entries
>> +igt@fbdev@info
>>   igt@fbdev@mmap
>>   igt@gem_basic@bad-close
>>   igt@gem_basic@create-close
>> --=20
>> 2.29.2
>>

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer

--------------A5D1341F58D0CC531CACF50F
Content-Type: application/pgp-keys;
 name="OpenPGP_0x680DC11D530B7A23.asc"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="OpenPGP_0x680DC11D530B7A23.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdgX=
H47
fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0BeB5B=
bqP
5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4YchdHm3bkPj=
z9E
ErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB9GluwvIhSezPg=
nEm
imZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEBAAHNKFRob21hcyBaa=
W1t
ZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmNvbT7CwI4EEwEIADgCGwMFCwkIBwIGFQoJCAsCB=
BYC
AwECHgECF4AWIQRyF/usjOnPY0ShaOVoDcEdUwt6IwUCXvxIWAAKCRBoDcEdUwt6I+aZB/9ih=
Onf
G4Lgf1L87cvoXh95/bnaJ6aQhP6/ZeRleuCXflnyDajlm3c9loQr0r2bQUi7JeYwUKbBab2QS=
GJm
DMRGlLMnmzWB8mHmZ6bHAu+2Sth8SraE42p6BB9d8dlYEID+dl/D/xUBeulfkck5rloGtYqDi=
+1Q
DfkEZJaxVSZ6FFkXuQi/G9qcI4iklN2nv02iQ7mZe8WYAysix6s/6vIobhirEBreclSNxXqis=
p8n
91+v855JC11EgRdUXMRK81IAaCKXP8zLx3ixku7mvP9Om61yerHSbeU2HZbIggZYQlFh6llJm=
zF1
CjCWgPTJyk4t4kMTcNOw5ykD47vU/KW+wl0EEBECAB0WIQQn6OOmnzvP/7ktjmoud6EwEfXTw=
gUC
WzodVwAKCRAud6EwEfXTwidvAKDkOADDHfI0QNXqAZcg6i1kOndAYACeLXHBwpjnumkPSyoab=
IiL
+he8r3zCwHMEEAEIAB0WIQQeXZghmQijlU7YzFiqUDvJrg9HpwUCWznxsQAKCRCqUDvJrg9Hp=
42f
CADIvsZcAd04PDFclRltHr2huy6s7+ZZA6PgYlMblEBh4bJA+dNPBTvzpJ7FJv/bmHOa+phWy=
Urj
EpfFGuOKGuWAfzgVAEu52fMrW3/mm+O26z1AKIu8hiZ/x9OAe4AM71ZO2lZrV1/53ZdzWnRuO=
45N
GQcotU8oeVfT9okAfmozmWMmIMq7Q0K6bV8W3qiD5XfDNxjr2caxc/9WX1bZPUo3n0H23MNaA=
Tpy
Oz732UtDh6sKUAB1RfzBBd/REbjHD7+quwJGAdRScyDRncX1vNb2+wihy0ipA69XY3bkhR5iD=
u5r
A9enuiMe6J1IBMI1PZh+vOufB/M6cd2D9RULIJaJwsBzBBABCAAdFiEEuyNtt7Ge78bIRx1op=
/N8
GYw5MYEFAls6MrsACgkQp/N8GYw5MYEnLQf/dwqlDJVQL2q+i8FFaqTMAm0n9jLRV6pN8JxFH=
j0g
voyWUOnQuNdAFgtKd26ZhN8NkLoSMO8E19eBPfLoBIFK5yNNVmRHAZm07MzGbA0uNWINJhmdR=
bZM
RMh0nneXjcEU/IvUmd8TPFTAd24X2mbzHgcaHMLJSVx1ohd4alRJXHIqDobKmiVwekyPnInJn=
zWw
iuZUkIotTkQple1PT/dF3S+KtPXBL6ldQ4NkAeCjsz4wnzSa9+VKOxEhiHM0PMzXSbkCMP+4m=
Xy9
RMplBw9Dm9hN2PSouBPifIrSodiiSWZYXOEkzLiBAB0frCKR63Dnx9kvjCD9Pz5wLd/70rjqI=
cLA
jgQTAQgAOAIbAwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC=
3oj
BQJftODHAAoJEGgNwR1TC3ojZSIIAIV3makffp4P4leU8JSLt0aTNewsOhy7VQzKUtlCw3PKD=
3l/
SuymZhQKgH+n6sijzFauZnZ+x0T+Oy+dDVZb3sNJuuMUDIHw18EO9daZBMcueaS54FGe73lAp=
HUl
7nxyocCxoqIG8+fP+75itV/ls2TSh5rJvjLvHC8J3NqfGlJ/jlSKrQUnzFbXfE5KGWiKNAn+I=
1a2
EE0I7uLpYgkdb8hcjtV9Rxr2ja+GWOaSoqB29P5GUzipkWo4144Q16JBO6QP2R9y/1ZK9VqH2=
5T8
lTKocLAaHCEdpDqY5KI15as9tIxlI1Vh+eqhTh/gwEm1ykO1gmrQ1zvGLDMB1EE6El3NJ1Rob=
21h
cyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIbAwULCQgHAgYVC=
gkI
CwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJe/EheAAoJEGgNwR1TC3ojq=
RgI
AIoegtTp1prPzfHgTAuEPd8v58ssHubwi9tg69a8IJ+iMNozhs4iUou84WOLBJNjSieXHZRa8=
fJj
//2/sTuABn38AQ9FcKX9/B49hrdCo6c0WHHKqlPrSTzuXNKYyOdmSFd/pDhBb2Bn5DTxxH5RP=
m/N
U/C9nUlwi7Y+FgBlDNa5h592wmJfv0cJAfvF56C+QL65jHFOFIW9xSaTOAxxMXHGJHXki6Iwa=
aTg
s7QQlKQcd5XvvED1bwLyQ7rq+MEZo5N7IygpQMM3qqGMlCnDdyQ3W95rd0HCWpfa0oVRCOwdu=
SL3
5hG7ONqBpvBj8z5GjSbt4HLJGvpeT0k37qzRExrCXQQQEQIAHRYhBCfo46afO8//uS2Oai53o=
TAR
9dPCBQJbOh1XAAoJEC53oTAR9dPC05AAoIy0HQ2DBDYugQ42P4HfyxfZTIvKAJ0fqNBcBFW9S=
tbR
DEP9cfpNVOv8YMLAcwQQAQgAHRYhBB5dmCGZCKOVTtjMWKpQO8muD0enBQJbOfGzAAoJEKpQO=
8mu
D0enL0wIAM2NTeUDCofBAkbWHGTZopclefbh0xGPYQEfttNyalp0hn1CrVO7OsX5eTjRqgyOa=
1C5
OAsNghCM4PUmrfv5cZ9+sNn9bRM50uVW9IFRlq8wwBY4+7QejJ5gs7DW/0tZIMZ6iTGKK0WEO=
7gd
2K9hXadPBScTdIqXeWH82meiqElnEQL+K9UeGUBrku+1EQIOxwziKwTDlTvhyJ+xmEKj0uWRc=
Ocl
27xLS9XOWPGXcNQBtlZhF8e/E1kFRt5CPP5UBdUCN8qydUadseXivSNDiYob9dyJSFt7G0Bq4=
/ac
Ret5ANtGRWsp8xYJQRossRMWL0w9P8SiIc2IY/JrQrpz29nCwHMEEAEIAB0WIQS7I223sZ7vx=
shH
HWin83wZjDkxgQUCWzoywAAKCRCn83wZjDkxgQaDCACyFuBLQWNvLT8GTDqTf/gETzmtoEM6Y=
r8O
4jbYg05xiFzAqMZctQsm3zHakx2JrimxDvQJRQJQzp5ICJ7J/BOuSL4FE1SPeQIfjm4jyBZGH=
P/W
vgHsT5e3+ZCPePPZO+3irarTKVhaaP70Tpka6EsOCZzO6L8D6tUDkhxMX0ymy7p8w9Yt1eD0o=
Ume
mxrKdS1ulpNJUTBw7gJN8bMowVnycEm6wntxOjrCxuwbkKhFLdn0ejcXQ0UkfbUFKfU64gGBu=
S53
ZlM8XlOhQEIw/FrdXszhR+Tg3Ag130cmJhOrghgOBLzvJfUd6OvDT5VIz0QGbAm8SWlAIIms1=
9Z8
kBsLwsCOBBMBCAA4AhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAFiEEchf7rIzpz2NEoWjla=
A3B
HVMLeiMFAl+04McACgkQaA3BHVMLeiPHXAf/SEoZa6CKoOAs1ctEP/hN8cEQqbEiuZ+71nm3u=
/BQ
p/CEUvqGq+iVc8kkpClDbPz5fa9mb+yWwufsnXKOs6ygmEoAEOL7dBZZIaRobBEkB09VXIkx8=
lE0
00grBVtToHUGRfZcMoMZ98XhPGU6lJDN200j/2CV46hQDz6PLySecNjOME05mosbYW5N2JwFd=
uXP
Qx++DjWB32QLBhcOcP3WslTy3PKVe/TcTvk0JpPFMz4UFc+awBVhDgZiGGAW3xLZRYyhpoAEs=
N7u
XkV2ct0MRxuZ3y4tTYJobhbZwutRojiPPZduRw9CSpNDcQHruFiSOIQTpnLeCA6K2JAZyqmP/=
87A
TQRbOdLgAQgAxiY/gz9X5PlFjlq3+DutR02wuFa/UA9iuH1FB584Nges1EdQT16ixhtPpcyvJ=
H2F
PxeUY5hHApbCJAGhZIOJMyj9eLb2NSefgFd8janHYNNfBzbYsq0sCBNGM/6ptTrdjTGdA3b1Q=
YNt
iDLIrnUNbcfQh/Zrck2yF4AAr5dz1tqPQsYhzxP26IRYcGcIf5F2GABOdZYYp0N6BRHkGQN8O=
Dk7
8UhLKYkEfHYPKiSW/mDgHOSCpOrCZpjOyXxTFkq9trGrTNt6EN1ryW+EVeh00UwCBMsmUu4Ng=
4Ys
rYDButLdKnQARuSl0kFvjipWUablsClmi4d4n/6f7uvXb6Wp2wARAQABwsB8BBgBCAAmFiEEc=
hf7
rIzpz2NEoWjlaA3BHVMLeiMFAls50uACGwwFCQPCZwAACgkQaA3BHVMLeiOl9wgAifA/k6VwQ=
qiR
OccKINPPg6fLgacdE/Z9cBNBkIrGa7gAljaH2J/D01/ZOMJnoAy8Le2EA3SsUOPnk32XizUKl=
oOj
gn7R+Sse7I1pydPbToJ4lXUTs1ie3FSf4tKJGs53LCfp6uPFGL0RhNUsIdwOEESMqYVl+DgAz=
gZk
xZfWWDT54dt3mgvVqzbxa+8j+4hozJXxFvJei3Wv/xAuVaV1Tc2tMXmntMxTbLdkfaZ/my5Io=
cAy
1sTiMonxkcU6jcaEuCNWsFYcT0lc7TzEqSAP7Dq/zf6eiawS5/oLotiupj+2xm/IRfrM3wK2K=
s90
9a79Vc1FgCX+Vq3uVIjcfbqqscLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojB=
QJf
tOH6AAoJEGgNwR1TC3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6=
Baa
6H7ufXNQtThRyIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3=
T0T
trijKP4ASAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446S=
h8W
n/2DYa8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRai=
tYJ
4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9fOwU0EX7ThE=
wEQ
ANJiTIb/nQ+MPgIBsSfBBhmXrVFUwFveO6DWPZ0M+Y5xBJhvDukosstSgcLCdld4SFF2JnnCo=
yh9
boM2j2Ksd5wNzTzXlo3lEzFRAipftboviUjap0qxoRwy1hBV3Ft1/VyNwwYY7qjGVATQU7cIT=
/zL
gb+Sd0NPQA8r2NvpJq1MnI8nFfA2ZH4diuRtavhEBUzp63SlCYxnyxqT5AQzSQGUpsjSyh1A5=
ezt
j1pwxgnkX7F9ZT0lUBo6zZM6ZBq8Nkyvox46l79QoWMBm9y+/nIXy/uXdT6RaumPjBzVttGmk=
Onm
TlGUJyQAndAE1boib9iWCJ4kIr2ezRKjXJXGuaM1m7hSfdQYWed0j52+nW9qGSNNk1GjYXM8Z=
SWT
agX6O5mfbpzRgBBK/XoE9NWRNAa4V+tUX4/vqqDl0m+O4F2GYs6Eu7WLredRgwjDuMF/VCKvQ=
fr3
yjIt90Zi10cHQw3khdJWmSDKYgenpvsffo4x56biifOh6IxS/whf5/BAx4nx8GyX7JO0DUnUu=
ieC
NfEGRu8QbYBSOkO/vdm4xy7RZwdzlqN8zjCLFOCG346Bnsx3ku2lNtX6qZoajmfD4oO6N0Xds=
2pE
wjufCfJW9sCLdBmqLD5OvsRljyv7vt5w28XSF1tyhQaxIs+8sFJtwfCliduffq56FcFrEXCxs=
LQr
ABEBAAHCwqwEGAEIACAWIQRyF/usjOnPY0ShaOVoDcEdUwt6IwUCX7ThEwIbAgJACRBoDcEdU=
wt6
I8F0IAQZAQgAHRYhBMZ3Zv36bjFHcGBRaJYfxNxEKL/gBQJftOETAAoJEJYfxNxEKL/gkygQA=
LQH
pXm45ZfMCDx7u/d7rRH/R7EfEV5OAoS981IkzbTgrb9z6YYfhQqH+R2ImgoX/Lou7zSjyd22/=
IaZ
AnTKHKkXIFIM1uB144dqAi3tW/Bei/CSdiD7DY1q92Ebl6e+Gpf3TZdATSY00fVeLMNFnjbbz=
CVX
9+LEKYARNm7kYogVJMc5CuVmXBn9FFF3cioRvpuals8llsFc4WiUBJfDfOzjXExqv3OMtJj0s=
qlK
sXdnLkXbtAmEvFaxqUuO1ZwTCTGflrn/g4C8Cg0ifk0wZGgGYRindkJE1vOQZPaDI7GtNxJ+D=
sx4
fL/8tf7Wuk3TZ6t/ofKhjq8sUVCVhnlyd/3ujruDu/PhwwYBsHjNn+PmHeCCRJuOWwKapdfjH=
9nt
sHXTvyXBB2D3H7Oj7S/HOTXRNTUWhaxICKtq+XDSuJKOv7CNevkjMF4ybQDsrUxnaWd76YqNP=
vZv
PYoTqKzKukifjGXMsxC6HU4K2GscpvoaIk7glaD+NYi3fIGi/gR0UNc6cmXtOrYKSnCsNOwcO=
CJL
DjEr6YdbdAXO2wxCLqnupo8JRJgA8hjjHM5OoTGEyP/c+DKDqFO90YilX1XN8xchHrw+bDv0E=
Zm0
RZpVdL7WNr7qQE4UhDfuyo4Gis4Z+npzoOL4g3yaQQfK32zZD9iqk9152b7ny2Ke5oFIF5SSa=
EwH
/2tLNBevzgzWuEB6FtqoMT5RjDyx+xBeImRlhnP0EenRh+EP0nmLCAaFiP4tTp1bX54SyByp8=
wcN
7F2+v2Sgdd64w1pdrjT74Zf1xj0NTxEdt5jEaPfl5Vjv3cXiB8ACwPkMIXmkJx3uaGJynl4Os=
irb
nzzviEzvDVpLAxL7Qr6imlKUh92iAoz+XxEDqgMZnJJOTDFdDxEBhv911VzlRraDNdxw4MHMm=
5Nr
5pj4HGYh3PigzNo0KIreB50YqhGOesaC4Q75gv8mLc2Ec5dEq79BVMUOaCmYDShBN9j6JovNs=
WSR
5YP3tXi+jZ+VnyKLft9wo1fh1oYadFEVSHgGsEY=3D
=3DfoRs
-----END PGP PUBLIC KEY BLOCK-----

--------------A5D1341F58D0CC531CACF50F--

--e6Ox7D036JLsYni2NBEuo8dAbvN7ASNDw--

--XERsx2IYI7o94J10le21DZuNRVrB1DzXO
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl+8BkUFAwAAAAAACgkQlh/E3EQov+BK
hRAAlBOF1ScRGkdHGndjDXSxJUqjlJVZmPeSQwFJKDLNhLd87OAX5rvT+/M+u9hAHrkLv8Uu5dtt
fh0QYvHpQZ8Oj5y450hh1u7wt/eQwjlNGYwLXEb6z0QnR/95/b+Fm0KQS9E25cBoqykAIlBi21TB
s65/INDcGcgvMGCykXVN+S5Fj/xT55+yvUcAFAY2Og3vfwmprmjoAk2gZhjqanZRKIU01hw2NJ49
cHmuuQdJbA3dWQc1se2qwNyBsUcCERW23fKewpQo+9OlygxhD7PyFCF4GHjScjgU4Yuvy9VHRvpi
Vet2qI1ArOvix9qkSCGpgdtzmu1dvMa+q08Bs9Qff3A7iy7p2KVfMhlRtS8E/g3lwDlNqAR392LD
971QpwY8/spCUtAK+lnipjKw4FwKYZI+d3asVxjoUo1PsNj9cCuxfxLp25z0eCvVUBVd9JNL8+QC
4GedpiCeTTN1a41XxA4qyrhOq9xigQ6YTlz3Rn7XmmZYGOsmj54PshLFbFFeruQoCjWei6V0yYg9
qQCb+oOzxfu+P3agDBM5cTw0A5ysFCiPeou2eY/EaG4HSxawGKNCPx6ngBeRAhIEdt/7sMPHVYjM
dDsydngi7QSMSQeiaHhXRPxiZFzN+ItLWsVT06TUONsMvoummg+BxULww9dR//8JG6MWJxPKRHh4
yYI=
=zudU
-----END PGP SIGNATURE-----

--XERsx2IYI7o94J10le21DZuNRVrB1DzXO--

--===============1048957425==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1048957425==--
