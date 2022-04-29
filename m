Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5F7810ED1B
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Apr 2022 13:28:07 +0000 (UTC)
Date: Fri, 29 Apr 2022 16:28:14 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>
Message-ID: <Ymvn7vI+yLo7oudN@platvala-desk.ger.corp.intel.com>
References: <20220429085425.24568-1-anshuman.gupta@intel.com>
 <20220429085425.24568-7-anshuman.gupta@intel.com>
 <Ymvi/oPF1oyKyNwk@intel.com>
 <63df14e7660045ed98799ef8f0694e3b@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <63df14e7660045ed98799ef8f0694e3b@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 6/8] i915_pm_rpm: Extend
 gem_exec_stress test with D3Cold
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Nilawar,
 Badal" <badal.nilawar@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Apr 29, 2022 at 04:10:15PM +0300, Gupta, Anshuman wrote:
> 
> 
> > -----Original Message-----
> > From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> > Sent: Friday, April 29, 2022 6:37 PM
> > To: Gupta, Anshuman <anshuman.gupta@intel.com>
> > Cc: igt-dev@lists.freedesktop.org; kamil.konieczny@linux.intel.com; Latvala,
> > Petri <petri.latvala@intel.com>; Nilawar, Badal <badal.nilawar@intel.com>;
> > Ewins, Jon <jon.ewins@intel.com>
> > Subject: Re: [PATCH i-g-t v2 6/8] i915_pm_rpm: Extend gem_exec_stress test
> > with D3Cold
> > 
> > On Fri, Apr 29, 2022 at 02:24:23PM +0530, Anshuman Gupta wrote:
> > > Added d3cold dynamic subtest to gem_exec_stress with device class
> > > memory region. It test both D3Cold-{VRAM_SR, Off} by using
> > > d3cold_sr_lmem_threshold i915_params debugfs.
> > >
> > > v2:
> > > - Two different subtest d3cold-off and d3cold-vrsr. [Rodrigo]
> > > - commit header modification.
> > >
> > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> > > ---
> > >  tests/i915/i915_pm_rpm.c | 97
> > > ++++++++++++++++++++++++++++++++++------
> > >  1 file changed, 83 insertions(+), 14 deletions(-)
> > >
> > > diff --git a/tests/i915/i915_pm_rpm.c b/tests/i915/i915_pm_rpm.c index
> > > 31f9712a8..1ef76f562 100644
> > > --- a/tests/i915/i915_pm_rpm.c
> > > +++ b/tests/i915/i915_pm_rpm.c
> > > @@ -85,6 +85,7 @@ enum plane_type {
> > >  #define WAIT_PC8_RES	2
> > >  #define WAIT_EXTRA	4
> > >  #define USE_DPMS	8
> > > +#define WAIT_D3COLD	16
> > >
> > >  int drm_fd, msr_fd, pc8_status_fd;
> > >  int debugfs;
> > > @@ -215,6 +216,21 @@ static bool wait_for_suspended(void)
> > >  	}
> > >  }
> > >
> > > +static bool wait_for_d3cold(struct pci_device *root) {
> > > +	bool d3colded;
> > > +
> > > +	d3colded = igt_wait(igt_pm_get_acpi_real_d_state(root) ==
> > > +IGT_ACPI_D3Cold, 10000, 500);
> > > +
> > > +	if (!d3colded) {
> > > +		igt_info("D3Cold not achieved for root port
> > %04x:%02x:%02x.%01x\n",
> > > +			 root->domain, root->bus, root->dev, root->func);
> > > +		igt_pm_print_pci_card_runtime_status();
> > > +	}
> > > +
> > > +	return d3colded;
> > > +}
> > > +
> > >  static bool wait_for_active(void)
> > >  {
> > >  	if (has_pc8 && !has_runtime_pm)
> > > @@ -744,6 +760,30 @@ static void test_i2c(struct mode_set_data *data)
> > >  			"There is an EDID mismatch between i2c and DRM!\n");
> > }
> > >
> > > +static int get_d3cold_sr_lmem_threshold(int dir) {
> > > +	int param_dir, lmem_threshold, ret;
> > > +
> > > +	param_dir = openat(dir, "i915_params", O_RDONLY);
> > > +	ret = igt_sysfs_scanf(param_dir, "d3cold_sr_lmem_threshold", "%d",
> > &lmem_threshold);
> > > +	igt_assert(ret >= 0);
> > > +
> > > +	close(param_dir);
> > > +	return lmem_threshold;
> > > +}
> > > +
> > > +static int set_d3cold_sr_lmem_threshold(int dir, int val) {
> > > +	int param_dir, ret;
> > > +
> > > +	param_dir = openat(dir, "i915_params", O_RDONLY);
> > > +	ret = igt_sysfs_printf(param_dir, "d3cold_sr_lmem_threshold", "%d",
> > val);
> > > +	igt_assert(ret > 0);
> > > +
> > > +	close(param_dir);
> > > +	return ret;
> > > +}
> > > +
> > >  static void setup_pc8(void)
> > >  {
> > >  	has_pc8 = false;
> > > @@ -1069,6 +1109,17 @@ static void debugfs_forcewake_user_subtest(void)
> > >  	igt_assert(wait_for_suspended());
> > >  }
> > >
> > > +static struct pci_device *setup_d3cold_and_get_root_port(void)
> > > +{
> > > +	struct pci_device *root;
> > > +
> > > +	root = igt_device_get_pci_root_port(drm_fd);
> > > +	igt_require(igt_pm_acpi_d3cold_supported(root));
> > > +	igt_pm_setup_pci_card_runtime_pm(root);
> > > +
> > > +	return root;
> > > +}
> > > +
> > >  static void gem_mmap_args(const struct mmap_offset *t,
> > >  			  struct drm_i915_gem_memory_class_instance
> > *mem_regions)  { @@
> > > -1392,6 +1443,7 @@ gem_execbuf_stress_subtest(int rounds, int wait_flags,
> > >  	int i;
> > >  	int batch_size = 4 * sizeof(uint32_t);
> > >  	uint32_t batch_buf[batch_size];
> > > +	struct pci_device *root;
> > >  	uint32_t handle;
> > >  	struct drm_i915_gem_execbuffer2 execbuf = {};
> > >  	struct drm_i915_gem_exec_object2 objs[1] = {{}}; @@ -1408,6 +1460,9
> > > @@ gem_execbuf_stress_subtest(int rounds, int wait_flags,
> > >  	batch_buf[i++] = MI_NOOP;
> > >  	igt_assert(i * sizeof(uint32_t) == batch_size);
> > >
> > > +	if (wait_flags & WAIT_D3COLD)
> > > +		root = setup_d3cold_and_get_root_port();
> > > +
> > >  	disable_all_screens_and_wait(&ms_data);
> > >
> > >  	/* PC8 test is only applicable to igfx  */ @@ -1433,6 +1488,9 @@
> > > gem_execbuf_stress_subtest(int rounds, int wait_flags,
> > >  			/* clean up idle work */
> > >  			igt_drop_caches_set(drm_fd, DROP_IDLE);
> > >  			igt_assert(wait_for_suspended());
> > > +			if (wait_flags & WAIT_D3COLD)
> > > +				igt_assert(wait_for_d3cold(root));
> > > +
> > >  		}
> > >  		if (wait_flags & WAIT_PC8_RES)
> > >  			igt_assert(pc8_plus_residency_changed(30));
> > > @@ -1440,6 +1498,9 @@ gem_execbuf_stress_subtest(int rounds, int
> > wait_flags,
> > >  			sleep(5);
> > >  	}
> > >
> > > +	if (wait_flags & WAIT_D3COLD)
> > > +		igt_pm_restore_pci_card_runtime_pm();
> > > +
> > >  	gem_close(drm_fd, handle);
> > >  }
> > >
> > > @@ -1537,22 +1598,10 @@ __noreturn static void stay_subtest(void)
> > > static void d3cold_basic_subtest(void)  {
> > >  	struct pci_device *root;
> > > -	bool result;
> > >
> > > -	root = igt_device_get_pci_root_port(drm_fd);
> > > -	igt_require(igt_pm_acpi_d3cold_supported(root));
> > > -	igt_pm_setup_pci_card_runtime_pm(root);
> > > +	root = setup_d3cold_and_get_root_port();
> > >  	disable_all_screens_and_wait(&ms_data);
> > > -
> > > -	result = igt_wait(igt_pm_get_acpi_real_d_state(root) ==
> > IGT_ACPI_D3Cold, 10000, 500);
> > > -
> > > -	if (!result) {
> > > -		igt_info("D3Cold not achieved for root port
> > %04x:%02x:%02x.%01x\n",
> > > -			 root->domain, root->bus, root->dev, root->func);
> > > -		igt_pm_print_pci_card_runtime_status();
> > > -	}
> > > -
> > > -	igt_assert(result);
> > > +	igt_assert(wait_for_d3cold(root));
> > >  	igt_pm_restore_pci_card_runtime_pm();
> > >  }
> > >
> > > @@ -2206,11 +2255,31 @@ igt_main_args("", long_options, help_str,
> > opt_handler, NULL)
> > >  	igt_describe("Validate execbuf submission while exercising rpm "
> > >  		     "suspend/resume cycles.");
> > >  	igt_subtest_with_dynamic("gem-execbuf-stress") {
> > > +		int lmem_threshold;
> > > +
> > >  		for_each_memory_region(r, drm_fd) {
> > >  			igt_dynamic_f("%s", r->name)
> > >  				gem_execbuf_stress_subtest(rounds,
> > WAIT_STATUS, &r->ci);
> > >  			igt_dynamic_f("%s-%s", "extra-wait", r->name)
> > >  				gem_execbuf_stress_subtest(rounds,
> > WAIT_STATUS | WAIT_EXTRA,
> > > &r->ci);
> > > +
> > > +			if (r->ci.memory_class ==
> > I915_MEMORY_CLASS_SYSTEM)
> > > +				continue;
> > > +
> > > +			lmem_threshold =
> > get_d3cold_sr_lmem_threshold(debugfs);
> > 
> > since we have just one global threashold and not one per memory region we can
> > avoid the extra reads in here by moving it ouside.
> > 
> > > +			igt_dynamic_f("%s-%s", "d3cold-off", r->name) {
> > > +				set_d3cold_sr_lmem_threshold(debugfs, 300);
> > > +				gem_execbuf_stress_subtest(rounds,
> > WAIT_STATUS | WAIT_D3COLD,
> > > +							   &r->ci);
> > > +				set_d3cold_sr_lmem_threshold(debugfs,
> > lmem_threshold);
> > 
> > but also we should probably do the save/restore with igt_fixture?
> We can do once we have this param in kernel , otherwise CI will break for all i915_pm_rpm tests. 

Does this mean LTS kernels are expected to be broken?

-- 
Petri Latvala
