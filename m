Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E41FE95A8C
	for <igt-dev@archiver.kernel.org>; Tue, 30 Dec 2025 13:52:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18FD210E1B9;
	Tue, 30 Dec 2025 13:52:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rf29rH2I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C7E110E1B9
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Dec 2025 13:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767102743; x=1798638743;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=0VJxe1w02QL7DEVGvP3/WiEJb90pqLoKeoHxf4C5RHk=;
 b=Rf29rH2IbSQCfIETqExarY3FlrVWbBP7/uchBJIxWMVE7TGSQ/56mLtS
 0ONmdSuC8LuQjscu7aqCXkg0WVOQ6j138dyWYZq6ZOTguMEUWs4CDmSBq
 2jJwA05BPNC7CB49+A9f8DusmNH+wTmD25Cy3B7nqrucOh4FZjgoqzZyT
 n5yL83SfLSJj8lRvgNcwGCITW7vEtCsBtr6Kog5OMUxhZUmrL1YYYhF45
 IU1hNmcQkTT+N7XBE/bd8kpZrX8SuBFDO2JxJkxCq2QGOSkENPDuBdCfv
 udUOqlMQk95e/cw4kY7KgNA8WgIV0KAJsQWyA4fWpqNVICYrJg+Dldj5y w==;
X-CSE-ConnectionGUID: qarFLvYzTAq/gXGninj3LA==
X-CSE-MsgGUID: mKT1FuKvSomlVxsLAMz/Vg==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="80061952"
X-IronPort-AV: E=Sophos;i="6.21,189,1763452800"; d="scan'208";a="80061952"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2025 05:52:23 -0800
X-CSE-ConnectionGUID: d2jNBEMHRayIZIoDZLbTQg==
X-CSE-MsgGUID: pwPZPSAUSqCdaWQNdQTchA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,189,1763452800"; d="scan'208";a="206274455"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 05:52:21 -0800
Date: Tue, 30 Dec 2025 14:52:18 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Karthik Poosa <karthik.poosa@intel.com>
Cc: igt-dev@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, riana.tauro@intel.com, rodrigo.vivi@intel.com
Subject: Re: [PATCH i-g-t v9 2/2] tests/intel/xe_pm_residency: Add subtest
 for ASPM Link state residency
Message-ID: <20251230135218.iod6cx6xbx4vqjby@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Karthik Poosa <karthik.poosa@intel.com>,
 igt-dev@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, riana.tauro@intel.com,
 rodrigo.vivi@intel.com
References: <20251219112620.273174-1-karthik.poosa@intel.com>
 <20251219112620.273174-3-karthik.poosa@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251219112620.273174-3-karthik.poosa@intel.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Hi Karthik,
On 2025-12-19 at 16:56:20 +0530, Karthik Poosa wrote:
> Add subtest aspm_link_residency to verify PCIe ASPM.
> Active State Power Management (ASPM) is a power management mechanism
> for PCI Express (PCIe) devices that aims to save power while the devices
> are in a fully active state.
> This test uses link state counters from debugfs - dgfx_pcie_link_residencies
> to verify this.
> 
> v2:
>  - Add dedicated function to get pcie endpoint upstream port. (Badal)
>  - Read residency counter as unsigned long long int instead of
>    unsigned long int.
>  - Print residency counter before sleep also.
>  - Don't assert if sysfs not corresponding to aspm_link_state
>    is not present. (Badal)
>  - Run workload before validation of aspm link residency. (Anshuman)
> 
> v3:
>  - Move igt_device_get_pci_usp to separate patch. (Kamil)
>  - Move reading of residency to separate function. (Badal)
> 
> v4:
>  - Add description about PCIe ASPM in commit message and code. (Kamil)
>  - Add a NULL check for the return value of igt_device_get_pci_usp().
>  - Resolve compilation warnings about using variable as format string
>    to sscanf.
> 
> v5:
>  - Use igt_device_get_pci_upstream_port() which is the renamed version
>    of igt_device_get_pci_usp().
> 
> v6:
>  - Refactor and enhance readability. (Badal)
>  - Move save and restore of link states to separate functions. (Badal)
> 
> v7:
>  - Skip aspm_link_residency on integrated platforms as it not supported.
> 
> v8:
>  - Address below review comments from Riana.
>  - Use igt_sysfs_has_attr() instead of faccess().
>  - Remove unnecessary spaces, debug logs, if checks.
>  - Wrap line length to 100 chars.
>  - Use spinner instead of mmap for workload.
> 
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>  tests/intel/xe_pm_residency.c | 174 ++++++++++++++++++++++++++++++++++
>  1 file changed, 174 insertions(+)
>  mode change 100644 => 100755 tests/intel/xe_pm_residency.c

Please do not set exec bit in C source file permissions.

> 
> diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
> old mode 100644
> new mode 100755
> index d33a87b13..e5166d81c
> --- a/tests/intel/xe_pm_residency.c
> +++ b/tests/intel/xe_pm_residency.c
> @@ -37,6 +37,27 @@ enum test_type {
>  	TEST_IDLE,
>  };
>  
> +enum link_state_index {
> +	LINK_STATE_ASPM,
> +	LINK_STATE_ASPM_L1_1,
> +	LINK_STATE_ASPM_L1_2,
> +	LINK_STATE_PCIPM_L1_1,
> +	LINK_STATE_PCIPM_L1_2,
> +	MAX_LINK_STATES,
> +};
> +
> +struct link_state_info {
> +	const char *filename;
> +	char state;
> +	const char *parse_str;
> +} link_state_sysfs[] = {
> +	{ "l1_aspm", 0, "PCIE LINK L1 RESIDENCY : "},
> +	{ "l1_1_aspm", 0, "NULL"},
> +	{ "l1_2_aspm", 0, "PCIE LINK L1.2 RESIDENCY : "},
> +	{ "l1_1_pcipm", 0, NULL},
> +	{ "l1_2_pcipm", 0, NULL},
> +};
> +
>  /**
>   * SUBTEST: gt-c6-on-idle
>   * Description: Validate GT C6 state on idle
> @@ -64,6 +85,10 @@ enum test_type {
>   * SUBTEST: cpg-gt-toggle
>   * Description: Toggle GT coarse power gating states by acquiring/releasing
>   *		forcewake.
> + *
> + * SUBTEST: aspm_link_residency
> + * Description: Check for PCIe ASPM (Active State Power Management) link states
> + * entry while device is in D0.
>   */
>  IGT_TEST_DESCRIPTION("Tests for gtidle properties");
>  
> @@ -255,6 +280,21 @@ static void idle_residency_on_exec(int fd, struct drm_xe_engine_class_instance *
>  	munmap(done, 4096);
>  }
>  
> +static void do_spin(int fd, struct drm_xe_engine_class_instance *eci)
> +{
> +	igt_spin_t *spin;
> +	uint64_t vm, ahnd;
> +
> +	igt_info("Running spinner on %s:%d\n",
> +		 xe_engine_class_string(eci->engine_class), eci->engine_instance);
> +	vm = xe_vm_create(fd, 0, 0);
> +	intel_allocator_init();
> +	ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
> +	spin = igt_spin_new(fd, .ahnd = ahnd, .vm = vm, .hwe = eci);
> +	igt_measured_usleep(USEC_PER_SEC);
> +	igt_spin_free(fd, spin);
> +}
> +
>  static void measure_power(struct igt_power *gpu, double *power)
>  {
>  	struct power_sample power_sample[2];
> @@ -370,6 +410,125 @@ static void cpg_gt_toggle(int fd)
>  		powergate_status(fd, gt, "down");
>  }
>  
> +static uint64_t get_link_state_residency(int fd_xe, const char *parse_str)
> +{
> +	int fd_debugfs_dir = 0;
> +	int ret = 0;
> +	char *ptr = NULL;
> +	char path[256] = {0}, buf[1024] = {0};
> +	uint64_t residency = 0;
> +
> +	fd_debugfs_dir = igt_debugfs_dir(fd_xe);
> +	igt_assert(fd_debugfs_dir >= 0);
> +	ret = igt_debugfs_simple_read(fd_debugfs_dir, "dgfx_pcie_link_residencies" , buf,

s/ , buf,/, buf,/

> +				      sizeof(buf));
> +	igt_assert_f(ret >= 0, "cannot read link residency file\n");

Consider printing errno here.

> +	ptr = strstr(buf, parse_str);
> +	igt_assert_f((ptr != NULL), "cannot find residency string %s\n", parse_str);

No need for '!= NULL', just use pointer:

	igt_assert_f(ptr, "cannot find residency string %s\n", parse_str);

> +	sprintf(path, "%s%%llu", parse_str);
> +	sscanf(ptr + strlen(parse_str), "%lu", &residency);

You should check return value from sscanf.

> +	igt_info("Link residency %"PRIu64"\n", residency);
> +	close(fd_debugfs_dir);

Add newline.

> +	return residency;
> +}
> +
> +static void save_and_disable_link_states(int fd_pci_usp)
> +{
> +	int i = 0;
> +	int ret = 0;
> +	char path[256] = {0};
> +
> +	for (i = 0 ; i < MAX_LINK_STATES ; i++) {
> +		sprintf(path, "%s", link_state_sysfs[i].filename);
> +		if (!igt_sysfs_has_attr(fd_pci_usp, path))
> +			continue;
> +		ret = igt_sysfs_scanf(fd_pci_usp, path, "%c", &link_state_sysfs[i].state);
> +		igt_assert_lt(0, ret);
> +		igt_debug("saved %s = %c\n", link_state_sysfs[i].filename ,

Remove space before ',': ... filename,

> +			  link_state_sysfs[i].state);
> +		ret = igt_sysfs_printf(fd_pci_usp, path, "%c", '0');
> +		igt_assert_lt(0, ret);
> +	}
> +}
> +
> +static void restore_link_states(int fd_pci_usp)
> +{
> +	int i = 0;
> +	int ret = 0;
> +	char path[256] = {0};
> +
> +	/* Restore saved states of L1 sysfs entries. */
> +	for (i = 0 ; i < MAX_LINK_STATES ; i++) {
> +		sprintf(path, "%s", link_state_sysfs[i].filename);
> +		if (!igt_sysfs_has_attr(fd_pci_usp, path))
> +			continue;
> +		ret = igt_sysfs_printf(fd_pci_usp, path, "%c", link_state_sysfs[i].state);
> +		igt_assert_lt(0, ret);
> +		igt_debug("restored %s to %c\n", link_state_sysfs[i].filename ,

Same here.

> +			  link_state_sysfs[i].state);
> +	}
> +}
> +
> +static void test_aspm_link_residency(int fd_xe, enum link_state_index aspm_link_state)
> +{
> +	struct pci_device *pci_dev;
> +	int fd_pci_usp = 0;
> +	char name[PATH_MAX];
> +	int ret = 0;
> +	char path[256] = {0};
> +	uint64_t residency_pre = 0, residency_post = 0;
> +
> +	igt_assert(aspm_link_state <= LINK_STATE_ASPM_L1_2);
> +
> +	/* Get upstream port pci_dev */
> +	pci_dev = igt_device_get_pci_upstream_port(fd_xe);
> +	igt_assert_f(pci_dev != NULL, "Couldn't get pci device of upstream port\n");

No need for '!= NULL':

	igt_assert_f(pci_dev, "Couldn't get pci device of upstream port\n");

> +	igt_debug("Upstream port PCI device: %04x:%02x:%02x.%01x\n", pci_dev->domain,
> +		  pci_dev->bus, pci_dev->dev, pci_dev->func);
> +
> +	snprintf(name, sizeof(name), "/sys/bus/pci/devices/%04x:%02x:%02x.%01x/link",
> +		 pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func);
> +	fd_pci_usp = open(name, O_DIRECTORY);
> +	igt_assert_f((fd_pci_usp >= 0), "Can't open link directory upstream port %s, ret %d\n",
> +		      name, fd_pci_usp);

Align.

Regards,
Kamil

> +
> +	/* Disable runtime PM as link ASPM entry happens during device is in D0 only. */
> +	igt_assert(igt_setup_runtime_pm(fd_xe));
> +	igt_disable_runtime_pm();
> +
> +	/* Check if ASPM sysfs is present. */
> +	sprintf(path, "%s", link_state_sysfs[aspm_link_state].filename);
> +	igt_require_f(igt_sysfs_has_attr(fd_pci_usp, path), "%s is not present\n", path);
> +	ret = igt_sysfs_scanf(fd_pci_usp, path, "%c", &link_state_sysfs[aspm_link_state].state);
> +	igt_assert_f((ret > 0), "Couldn't read residency for %s", path);
> +
> +	/* Save current state of all available link sysfs entries and disable all link states. */
> +	save_and_disable_link_states(fd_pci_usp);
> +
> +	/* Enable only the ASPM link state needed for test. */
> +	igt_debug("Enabling %s\n", link_state_sysfs[aspm_link_state].filename);
> +	sprintf(path, "%s", link_state_sysfs[aspm_link_state].filename);
> +	ret = igt_sysfs_printf(fd_pci_usp, path, "%c", '1');
> +
> +	/* Read link state residencies before and after idle wait time. */
> +	residency_pre = get_link_state_residency(fd_xe,
> +						 link_state_sysfs[aspm_link_state].parse_str);
> +	igt_info("Waiting for link to enter idle....\n");
> +	sleep(SLEEP_DURATION);
> +	residency_post = get_link_state_residency(fd_xe,
> +						  link_state_sysfs[aspm_link_state].parse_str);
> +
> +	/* Restore saved link states. */
> +	restore_link_states(fd_pci_usp);
> +
> +	igt_restore_runtime_pm();
> +	close(fd_pci_usp);
> +	close(fd_xe);
> +
> +	igt_assert_f(residency_post > residency_pre,
> +		     "ASPM entry failed, pre %"PRIu64", post %"PRIu64"\n", residency_pre,
> +		     residency_post);
> +}
>  int igt_main()
>  {
>  	uint32_t d3cold_allowed;
> @@ -444,6 +603,21 @@ int igt_main()
>  		cpg_gt_toggle(fd);
>  	}
>  
> +	igt_describe("ASPM Link residency validation");
> +	igt_subtest_with_dynamic("aspm_link_residency") {
> +		igt_require(xe_has_vram(fd));
> +		xe_for_each_gt(fd, gt) {
> +			xe_for_each_engine(fd, hwe) {
> +				if (gt == hwe->gt_id && !hwe->engine_instance) {
> +					igt_dynamic_f("gt%u-engine-%s", gt,
> +						      xe_engine_class_string(hwe->engine_class))
> +						do_spin(fd, hwe);
> +				}
> +			}
> +		}
> +		test_aspm_link_residency(fd, LINK_STATE_ASPM);
> +	}
> +
>  	igt_fixture() {
>  		close(fd);
>  	}
> -- 
> 2.25.1
> 
