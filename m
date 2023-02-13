Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Zbigniew =?utf-8?B?S2VtcGN6ecWEc2tp?= <zbigniew.kempczynski@intel.com>
Date: Mon, 13 Feb 2023 11:10:30 +0100
Message-ID: <21773235.EfDdHjke4D@jkrzyszt-mobl1.ger.corp.intel.com>
In-Reply-To: <20230213095139.c5gcznwdf4a5kpgo@zkempczy-mobl2>
References: <20230209193231.57538-1-janusz.krzysztofik@linux.intel.com>
 <13320072.uLZWGnKmhe@jkrzyszt-mobl1.ger.corp.intel.com>
 <20230213095139.c5gcznwdf4a5kpgo@zkempczy-mobl2>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t] tests/i915_suspend: Free
 device list after *-without-i915 subtests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Monday, 13 February 2023 10:51:39 CET Zbigniew Kempczy=C5=84ski wrote:
> On Fri, Feb 10, 2023 at 10:33:21PM +0100, Janusz Krzysztofik wrote:
> > On Thursday, 9 February 2023 20:32:31 CET Janusz Krzysztofik wrote:
> > > If any of *-without-i915 subtests fails or skips for any reason, it m=
ay
> > > leave the i915 module unloaded while keeping our device list populated
> > > with initially collected data.  In a follow up igt_fixture section we=
=20
then
> > > try to reopen the device.  If the test has been executed with a device
> > > filter specified, an attempt to open the device finds a matching entry
> > > that belongs to the no longer existing device in that initially=20
collected
> > > device list, fails to stat() it, concludes that's because of the devi=
ce
> > > having been already open, and returns an error.
> > >=20
> > > Fix this potentially confusing test result by freeing the potentially
> > > outdated device list before continuing with drm_open_driver().
> >=20
> > Freeing device list occurred not safe if device scan was not performed=
=20
before. =20
> > I can see 3 potential solutions:
> > 1) force device rescan instead of free before calling drm_open_driver(),
> > 2) teach igt_device_free() to return immediately if the device list has=
=20
not=20
> >    been allocated,
> > 3) provide a has_device_list() helper for to be used if not sure before=
=20
> >    calling igt_device_free().
> >=20
> > Any preferences?
>=20
> I would enforce rescan.
>=20
> BTW I wonder how it can happen if runner is executing each subtest
> in new process so you're starting from scratch and rescan should be
> executed automatically.

The scenario I'm trying to address is different: a subtest fails, leaving t=
he=20
i915 module unloaded but the device list populated.  Then, before the test=
=20
exist, open_drm_driver() called from a follow up igt_fixture section falsel=
y=20
detects the (non-existent) device as already open and fails instead of=20
reloading the module.

While that late failure shouldn't affect results of the subtest, debug=20
messages triggered from that failed device_open_driver() can occur potentia=
lly=20
misleading to anyone watching CI results, then should be avoided if possibl=
e.

Thanks,
Janusz


>=20
> Is is the case you're running few tests from the console?
>=20
> --
> Zbigniew
>=20
>=20
> >=20
> > Thanks,
> > Janusz
> >=20
> > >=20
> > > While being at it, add a comment that explains why we call
> > > igt_device_scan() from __igt_device_card_match() but don't force devi=
ce
> > > rescan, and emit a debug message if we fail in _is_already_opened() on
> > > unsuccessful device stat().
> > >=20
> > > Subtest basic-s3-without-i915: FAIL (9.572s)
> > > (i915_suspend:9050) drmtest-WARNING: card maching filter 0 is already=
=20
opened
> > > (i915_suspend:9050) drmtest-CRITICAL: Test abort in function=20
drm_open_driver, file ../lib/drmtest.c:639:
> > > (i915_suspend:9050) drmtest-CRITICAL: abort condition: fd < 0
> > > (i915_suspend:9050) drmtest-CRITICAL: Last errno: 2, No such file or=
=20
directory
> > > (i915_suspend:9050) drmtest-CRITICAL: No known gpu found for chipset=
=20
flags 0x1 (intel)
> > > Test i915_suspend failed.
> > > **** DEBUG ****
> > > (i915_suspend:9050) drmtest-DEBUG: Looking for devices to open using=
=20
filter 0: pci:vendor=3Dintel,device=3Ddg2
> > > (i915_suspend:9050) drmtest-DEBUG: Filter matched /dev/dri/card0 | /d=
ev/
dri/renderD128
> > > (i915_suspend:9050) drmtest-WARNING: card maching filter 0 is already=
=20
opened
> > > (i915_suspend:9050) drmtest-CRITICAL: Test abort in function=20
drm_open_driver, file ../lib/drmtest.c:639:
> > > (i915_suspend:9050) drmtest-CRITICAL: abort condition: fd < 0
> > > (i915_suspend:9050) drmtest-CRITICAL: Last errno: 2, No such file or=
=20
directory
> > > (i915_suspend:9050) drmtest-CRITICAL: No known gpu found for chipset=
=20
flags 0x1 (intel)
> > > (i915_suspend:9050) igt_core-INFO: Stack trace:
> > > (i915_suspend:9050) igt_core-INFO:   #0 ../lib/igt_core.c:2066=20
__igt_abort()
> > > (i915_suspend:9050) igt_core-INFO:   #1 ../lib/drmtest.c:573=20
drm_open_driver()
> > > (i915_suspend:9050) igt_core-INFO:   #2 ../tests/i915/i915_suspend.c:=
258=20
__igt_unique____real_main245()
> > > (i915_suspend:9050) igt_core-INFO:   #3 ../tests/i915/i915_suspend.c:=
245=20
main()
> > > (i915_suspend:9050) igt_core-INFO:   #4 ../sysdeps/nptl/
libc_start_call_main.h:58 __libc_start_call_main()
> > > (i915_suspend:9050) igt_core-INFO:   #5 ../csu/libc-start.c:128=20
__libc_start_main@@GLIBC_2.34()
> > > (i915_suspend:9050) igt_core-INFO:   #6 [_start+0x2a]
> > > ****  END  ****
> > >=20
> > > Fixes: f7aff600ab16 ("tests/i915/i915_suspend: Disable d3cold_allowed=
=20
for basic-s2idle-without-i915")
> > > Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> > > Cc: Riana Tauro <riana.tauro@intel.com>
> > > ---
> > >  lib/drmtest.c             |  2 +-
> > >  lib/igt_device_scan.c     |  4 ++++
> > >  tests/i915/i915_suspend.c | 10 +++++++++-
> > >  3 files changed, 14 insertions(+), 2 deletions(-)
> > >=20
> > > diff --git a/lib/drmtest.c b/lib/drmtest.c
> > > index 16e80bdfcf..8e2d1ac50b 100644
> > > --- a/lib/drmtest.c
> > > +++ b/lib/drmtest.c
> > > @@ -260,7 +260,7 @@ static bool _is_already_opened(const char *path, =
int=20
as_idx)
> > >  	 * we cannot even stat the device, so it's of no use - let's claim=
=20
it's
> > >  	 * already opened
> > >  	 */
> > > -	if (stat(path, &new) !=3D 0)
> > > +	if (igt_debug_on(stat(path, &new) !=3D 0))
> > >  		return true;
> > > =20
> > >  	for (int i =3D 0; i < as_idx; ++i) {
> > > diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
> > > index 8b767eed20..ae69ed09f1 100644
> > > --- a/lib/igt_device_scan.c
> > > +++ b/lib/igt_device_scan.c
> > > @@ -1918,6 +1918,10 @@ static bool __igt_device_card_match(const char=
=20
*filter,
> > >  		return false;
> > >  	memset(card, 0, sizeof(*card));
> > > =20
> > > +	/*
> > > +	 * Scan devices in case the user hasn't yet,
> > > +	 * but leave a decision on forced rescan on the user side.
> > > +	 */
> > >  	igt_devices_scan(false);
> > > =20
> > >  	if (igt_device_filter_apply(filter) =3D=3D false)
> > > diff --git a/tests/i915/i915_suspend.c b/tests/i915/i915_suspend.c
> > > index 815f1c8a2c..c68110476e 100644
> > > --- a/tests/i915/i915_suspend.c
> > > +++ b/tests/i915/i915_suspend.c
> > > @@ -253,8 +253,16 @@ igt_main
> > >  	igt_subtest("basic-s3-without-i915")
> > >  		test_suspend_without_i915(SUSPEND_STATE_S3);
> > > =20
> > > -	igt_fixture
> > > +	igt_fixture {
> > > +		/*
> > > +		 * Since above tests may fail leaving the i915 module=20
unloaded,
> > > +		 * force refresh of device list before opening an i915=20
device
> > > +		 * by cleaning up the current device list, otherwise we=20
can fail
> > > +		 * if we have been called with a device filter=20
specified.
> > > +		 */
> > > +		igt_devices_free();
> > >  		fd =3D drm_open_driver(DRIVER_INTEL);
> > > +	}
> > > =20
> > >  	igt_subtest("fence-restore-tiled2untiled") {
> > >  		gem_require_mappable_ggtt(fd);
> > >=20
> >=20
> >=20
> >=20
> >=20
>=20



