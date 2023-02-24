Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Riana Tauro <riana.tauro@intel.com>,
 Zbigniew =?utf-8?B?S2VtcGN6ecWEc2tp?= <zbigniew.kempczynski@intel.com>,
 intel-gfx@lists.freedesktop.org
Date: Fri, 24 Feb 2023 09:46:53 +0100
Message-ID: <5908864.lOV4Wx5bFT@jkrzyszt-mobl1.ger.corp.intel.com>
In-Reply-To: <20230224083854.oharfpdp6aidbfsk@kamilkon-desk1>
References: <20230213143445.24228-1-janusz.krzysztofik@linux.intel.com>
 <20230224083854.oharfpdp6aidbfsk@kamilkon-desk1>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Subject: Re: [igt-dev] [PATCH i-g-t v2] tests/i915_suspend: Refresh device
 list after *-without-i915 subtests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Friday, 24 February 2023 09:38:54 CET Kamil Konieczny wrote:
> On 2023-02-13 at 15:34:45 +0100, Janusz Krzysztofik wrote:
> > If any of *-without-i915 subtests fails or skips for any reason, it may
> > leave the i915 module unloaded while keeping our device list populated
> > with initially collected data.  In a follow up igt_fixture section we then
> > try to reopen the device.  If the test has been executed with a device
> > filter specified, an attempt to open the device finds a matching entry
> > that belongs to the no longer existing device in that initially collected
> > device list, fails to stat() it, concludes that's because of the device
> > having been already open, and returns an error.  While that error,
> > triggered after subtests completion, doesn't affect results of the
> > subtest, reported by CI togethger with those results it is confusing to
> > users reviewing those reports.
> > 
> > Fix this issue by refreshing the potentially outdated device list before
> > continuing with drm_open_driver() if we've been called with a device
> > filter specified.
> > 
> > While being at it, add a comment that explains why we call
> > igt_devices_scan() from __igt_device_card_match() but don't force device
> > rescan, and emit a debug message if we fail in _is_already_opened() on
> > unsuccessful device stat().
> > 
> > v2: don't free the device list -- we can't tell if it has been populated,
> >     and igt_devices_free() fails if it hasn't,
> >   - commit message updated, description improved.
> > 
> > Subtest basic-s3-without-i915: FAIL (9.572s)
> > (i915_suspend:9050) drmtest-WARNING: card maching filter 0 is already opened
> > (i915_suspend:9050) drmtest-CRITICAL: Test abort in function drm_open_driver, file ../lib/drmtest.c:639:
> > (i915_suspend:9050) drmtest-CRITICAL: abort condition: fd < 0
> > (i915_suspend:9050) drmtest-CRITICAL: Last errno: 2, No such file or directory
> > (i915_suspend:9050) drmtest-CRITICAL: No known gpu found for chipset flags 0x1 (intel)
> > Test i915_suspend failed.
> > **** DEBUG ****
> > (i915_suspend:9050) drmtest-DEBUG: Looking for devices to open using filter 0: pci:vendor=intel,device=dg2
> > (i915_suspend:9050) drmtest-DEBUG: Filter matched /dev/dri/card0 | /dev/dri/renderD128
> > (i915_suspend:9050) drmtest-WARNING: card maching filter 0 is already opened
> > (i915_suspend:9050) drmtest-CRITICAL: Test abort in function drm_open_driver, file ../lib/drmtest.c:639:
> > (i915_suspend:9050) drmtest-CRITICAL: abort condition: fd < 0
> > (i915_suspend:9050) drmtest-CRITICAL: Last errno: 2, No such file or directory
> > (i915_suspend:9050) drmtest-CRITICAL: No known gpu found for chipset flags 0x1 (intel)
> > (i915_suspend:9050) igt_core-INFO: Stack trace:
> > (i915_suspend:9050) igt_core-INFO:   #0 ../lib/igt_core.c:2066 __igt_abort()
> > (i915_suspend:9050) igt_core-INFO:   #1 ../lib/drmtest.c:573 drm_open_driver()
> > (i915_suspend:9050) igt_core-INFO:   #2 ../tests/i915/i915_suspend.c:258 __igt_unique____real_main245()
> > (i915_suspend:9050) igt_core-INFO:   #3 ../tests/i915/i915_suspend.c:245 main()
> > (i915_suspend:9050) igt_core-INFO:   #4 ../sysdeps/nptl/libc_start_call_main.h:58 __libc_start_call_main()
> > (i915_suspend:9050) igt_core-INFO:   #5 ../csu/libc-start.c:128 __libc_start_main@@GLIBC_2.34()
> > (i915_suspend:9050) igt_core-INFO:   #6 [_start+0x2a]
> > ****  END  ****
> > 
> > Fixes: f7aff600ab16 ("tests/i915/i915_suspend: Disable d3cold_allowed for basic-s2idle-without-i915")
> > Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> > Cc: Riana Tauro <riana.tauro@intel.com>
> 
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Thanks Kamil, pushed.

Janusz

> 
> > ---
> >  lib/drmtest.c             |  2 +-
> >  lib/igt_device_scan.c     |  4 ++++
> >  tests/i915/i915_suspend.c | 12 +++++++++++-
> >  3 files changed, 16 insertions(+), 2 deletions(-)
> > 
> > diff --git a/lib/drmtest.c b/lib/drmtest.c
> > index 16e80bdfcf..8e2d1ac50b 100644
> > --- a/lib/drmtest.c
> > +++ b/lib/drmtest.c
> > @@ -260,7 +260,7 @@ static bool _is_already_opened(const char *path, int as_idx)
> >  	 * we cannot even stat the device, so it's of no use - let's claim it's
> >  	 * already opened
> >  	 */
> > -	if (stat(path, &new) != 0)
> > +	if (igt_debug_on(stat(path, &new) != 0))
> >  		return true;
> >  
> >  	for (int i = 0; i < as_idx; ++i) {
> > diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
> > index 8b767eed20..ae69ed09f1 100644
> > --- a/lib/igt_device_scan.c
> > +++ b/lib/igt_device_scan.c
> > @@ -1918,6 +1918,10 @@ static bool __igt_device_card_match(const char *filter,
> >  		return false;
> >  	memset(card, 0, sizeof(*card));
> >  
> > +	/*
> > +	 * Scan devices in case the user hasn't yet,
> > +	 * but leave a decision on forced rescan on the user side.
> > +	 */
> >  	igt_devices_scan(false);
> >  
> >  	if (igt_device_filter_apply(filter) == false)
> > diff --git a/tests/i915/i915_suspend.c b/tests/i915/i915_suspend.c
> > index 815f1c8a2c..1d304a9317 100644
> > --- a/tests/i915/i915_suspend.c
> > +++ b/tests/i915/i915_suspend.c
> > @@ -253,8 +253,18 @@ igt_main
> >  	igt_subtest("basic-s3-without-i915")
> >  		test_suspend_without_i915(SUSPEND_STATE_S3);
> >  
> > -	igt_fixture
> > +	igt_fixture {
> > +		/*
> > +		 * Since above subtests may fail, leaving i915 module unloaded
> > +		 * but device list populated, refresh the device list before
> > +		 * reopening the i915 device if we've been called with a device
> > +		 * filter specified, otherwise drm_open_driver() will fail
> > +		 * instead of reloading the i915 module.
> > +		 */
> > +		if (igt_device_filter_count())
> > +			igt_devices_scan(true);
> >  		fd = drm_open_driver(DRIVER_INTEL);
> > +	}
> >  
> >  	igt_subtest("fence-restore-tiled2untiled") {
> >  		gem_require_mappable_ggtt(fd);
> 



