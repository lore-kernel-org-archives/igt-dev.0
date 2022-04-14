Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1475E10FF5C
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Apr 2022 09:42:33 +0000 (UTC)
Date: Thu, 14 Apr 2022 12:42:26 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: "Souza, Jose" <jose.souza@intel.com>
Message-ID: <YlfsgjQklE9KEL4t@platvala-desk.ger.corp.intel.com>
References: <20220405191215.76309-1-jose.souza@intel.com>
 <20220405191215.76309-2-jose.souza@intel.com>
 <Yk1CL+wMYOyZ0k2e@platvala-desk.ger.corp.intel.com>
 <3d2810e80da6f0ecb231d71d95e9877a3a1b2c05.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3d2810e80da6f0ecb231d71d95e9877a3a1b2c05.camel@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] test: kms_frontbuffer_tracking: Fix
 DRRS subtests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Apr 13, 2022 at 10:46:04PM +0300, Souza, Jose wrote:
> On Wed, 2022-04-06 at 10:33 +0300, Petri Latvala wrote:
> > On Tue, Apr 05, 2022 at 12:12:15PM -0700, José Roberto de Souza wrote:
> > > Due to recent refactors in i915, it completely changed
> > > i915_drrs_status breaking all DRRS subtests, so here using
> > > the newly added DRRS helpers to fix it.
> > > 
> > > Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > > Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
> > > ---
> > >  tests/i915/kms_frontbuffer_tracking.c | 57 +++------------------------
> > >  1 file changed, 5 insertions(+), 52 deletions(-)
> > > 
> > > diff --git a/tests/i915/kms_frontbuffer_tracking.c b/tests/i915/kms_frontbuffer_tracking.c
> > > index 814ddb46ce..59ba6cfc11 100644
> > > --- a/tests/i915/kms_frontbuffer_tracking.c
> > > +++ b/tests/i915/kms_frontbuffer_tracking.c
> > > @@ -34,6 +34,7 @@
> > >  #include "i915/gem_create.h"
> > >  #include "igt.h"
> > >  #include "igt_sysfs.h"
> > > +#include "igt_drrs.h"
> > >  #include "igt_psr.h"
> > >  
> > >  IGT_TEST_DESCRIPTION("Test the Kernel's frontbuffer tracking mechanism and "
> > > @@ -723,13 +724,6 @@ static void set_mode_for_params(struct modeset_params *params)
> > >  	igt_display_commit(&drm.display);
> > >  }
> > >  
> > > -static void __debugfs_read(const char *param, char *buf, int len)
> > > -{
> > > -	len = igt_debugfs_simple_read(drm.debugfs, param, buf, len);
> > > -	if (len < 0)
> > > -		igt_assert(len == -ENOENT || len == -ENODEV);
> > > -}
> > > -
> > >  static int __debugfs_write(const char *param, char *buf, int len)
> > >  {
> > >  	return igt_sysfs_write(drm.debugfs, param, buf, len - 1);
> > > @@ -790,47 +784,11 @@ static void drrs_set(unsigned int val)
> > >  		igt_assert_f(ret == (sizeof(buf) - 1), "debugfs_write failed");
> > >  }
> > >  
> > > -static bool is_drrs_high(void)
> > > -{
> > > -	char buf[MAX_DRRS_STATUS_BUF_LEN];
> > > -
> > > -	debugfs_read("i915_drrs_status", buf);
> > > -	return strstr(buf, "DRRS_HIGH_RR");
> > > -}
> > > -
> > > -static bool is_drrs_low(void)
> > > -{
> > > -	char buf[MAX_DRRS_STATUS_BUF_LEN];
> > > -
> > > -	debugfs_read("i915_drrs_status", buf);
> > > -	return strstr(buf, "DRRS_LOW_RR");
> > > -}
> > > -
> > > -static bool is_drrs_supported(void)
> > > -{
> > > -	char buf[MAX_DRRS_STATUS_BUF_LEN];
> > > -
> > > -	debugfs_read("i915_drrs_status", buf);
> > > -	return strcasestr(buf, "DRRS Supported: Yes");
> > > -}
> > > -
> > > -static bool is_drrs_inactive(void)
> > > -{
> > > -	char buf[MAX_DRRS_STATUS_BUF_LEN];
> > > -
> > > -	debugfs_read("i915_drrs_status", buf);
> > > -
> > > -	if (strstr(buf, "DRRS_State: "))
> > > -		return false;
> > > -
> > > -	return true;
> > > -}
> > > -
> > >  static void drrs_print_status(void)
> > >  {
> > >  	char buf[MAX_DRRS_STATUS_BUF_LEN];
> > >  
> > > -	debugfs_read("i915_drrs_status", buf);
> > > +	drrs_write_status(drm.debugfs, prim_mode_params.pipe, buf, sizeof(buf));
> > >  	igt_info("DRRS STATUS :\n%s\n", buf);
> > >  }
> > >  
> > > @@ -951,7 +909,7 @@ static bool fbc_wait_until_enabled(void)
> > >  
> > >  static bool drrs_wait_until_rr_switch_to_low(void)
> > >  {
> > > -	return igt_wait(is_drrs_low(), 5000, 1);
> > > +	return igt_wait(drrs_is_low_refresh_rate(drm.debugfs, prim_mode_params.pipe), 5000, 1);
> > >  }
> > >  
> > >  #define fbc_enable() igt_set_module_param_int(drm.fd, "enable_fbc", 1)
> > > @@ -1460,11 +1418,6 @@ static void setup_drrs(void)
> > >  		return;
> > >  	}
> > >  
> > > -	if (!is_drrs_supported()) {
> > > -		igt_info("Can't test DRRS: Not supported.\n");
> > > -		return;
> > > -	}
> > > -
> > >  	drrs.can_test = true;
> > >  }
> > >  
> > > @@ -1607,7 +1560,7 @@ static void do_status_assertions(int flags)
> > >  	}
> > >  
> > >  	if (flags & ASSERT_DRRS_HIGH) {
> > > -		if (!is_drrs_high()) {
> > > +		if (drrs_is_low_refresh_rate(drm.debugfs, prim_mode_params.pipe)) {
> > >  			drrs_print_status();
> > >  			igt_assert_f(false, "DRRS HIGH\n");
> > >  		}
> > > @@ -1617,7 +1570,7 @@ static void do_status_assertions(int flags)
> > >  			igt_assert_f(false, "DRRS LOW\n");
> > >  		}
> > >  	} else if (flags & ASSERT_DRRS_INACTIVE) {
> > > -		if (!is_drrs_inactive()) {
> > > +		if (drrs_is_active(drm.debugfs, prim_mode_params.pipe)) {
> > >  			drrs_print_status();
> > >  			igt_assert_f(false, "DRRS INACTIVE\n");
> > >  		}
> > 
> > With how the DRRS state handling is moved to lib it's hard to read
> > from the patch series what actually changed in the kernel.
> 
> This is now the output:
> 
> gta@DUT4020-ADLP:~$ sudo more /sys/kernel/debug/dri/0/i915_drrs_status
> [CRTC:80:pipe A]:
> 	DRRS Enabled: no
> 	DRRS Active: no
> 	Busy_frontbuffer_bits: 0x0
> 	DRRS refresh rate: high
> [CRTC:131:pipe B]:
> 	DRRS Enabled: no
> 	DRRS Active: no
> 	Busy_frontbuffer_bits: 0x0
> 	DRRS refresh rate: high
> [CRTC:182:pipe C]:
> 	DRRS Enabled: no
> 	DRRS Active: no
> 	Busy_frontbuffer_bits: 0x0
> 	DRRS refresh rate: high
> [CRTC:233:pipe D]:
> 	DRRS Enabled: no
> 	DRRS Active: no
> 	Busy_frontbuffer_bits: 0x0
> 	DRRS refresh rate: high
> 
> So completely different than the old one
> 
> > 
> > Does this now handle just the new semantics? Is the old one used in
> > any stable kernels?
> 
> Semantics also have changed a bit, so stable kernels would be broken with the fix.
> 
> What should be done here?

A fallback to parse the old format would be neat.

If the DRRS stuff is moved to a different path (per-crtc), can the old
path use old format (if exists) and new path use new format?


-- 
Petri Latvala
