Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77FE6C79F9F
	for <igt-dev@archiver.kernel.org>; Thu, 10 Sep 2026 16:04:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED25789BAE;
	Thu, 10 Sep 2026 16:04:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aP5aZEHa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A769F89BAE
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Sep 2026 16:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789056227; x=1820592227;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=TccmM2bs2Z5UCs2P/Ta6eCh5i182VHtyTAFksbIIkIo=;
 b=aP5aZEHaLAiye04rqVpc0dQjFOYEhdfjvKFnuEqprCfWa3KJsOYGPylD
 ChQYMcyMuKbTfoHZpnMLaa3UDdTxStiRSRGaZ81qgEdH6rAM5xRQrdOT6
 xxAxPATn3no5zA+M/PFsYtiU0yzl8wJZliT+1YlAfouABO0kGBujDfjaC
 46xW62CXY4lwnn/zNg7go8ZCJ7v5MaaFnu1vTjIBj/vzfPatvosHAMt4u
 0r0UIKgV+GvZEtvxHWpvZlcXFOMdhCgtsrlfygRw+fx1vrzNM9Xytggwe
 B/SLBiBGH9ZOqaXRfvANOWD14LwXkH+4R5FFziIpZWnYhNTE7Ekfk2yKF w==;
X-CSE-ConnectionGUID: lSEpk7kmTfW4v3fB3kNHyA==
X-CSE-MsgGUID: OFG3dJv4T1+M6o4xsYFbag==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="89354048"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="89354048"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 09:03:46 -0700
X-CSE-ConnectionGUID: b719zFlTSJyH4tuFR3Cipw==
X-CSE-MsgGUID: BDtBwwnAQ9K8cKby21Adjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; d="scan'208";a="275453589"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 09:03:44 -0700
Date: Thu, 10 Sep 2026 18:03:42 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: shivtej.eknath.patil@intel.com
Cc: igt-dev@lists.freedesktop.org, nishit.sharma@intel.com,
 kamil.konieczny@intel.com, sobin.thomas@intel.com,
 smitha.balasubramanyam@intel.com
Subject: Re: [PATCH v5 2/2] tests/intel/xe_pm: add coverage for xe_device_sysfs
Message-ID: <20260910160342.loyn3upt4oto5sxn@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 shivtej.eknath.patil@intel.com, igt-dev@lists.freedesktop.org,
 nishit.sharma@intel.com, kamil.konieczny@intel.com,
 sobin.thomas@intel.com, smitha.balasubramanyam@intel.com
References: <20260826073710.37283-1-shivtej.eknath.patil@intel.com>
 <20260826073710.37283-3-shivtej.eknath.patil@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260826073710.37283-3-shivtej.eknath.patil@intel.com>
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

Hi shivtej.eknath.patil,
On 2026-08-26 at 07:37:10 +0000, shivtej.eknath.patil@intel.com wrote:
> From: Shivtej Patil <shivtej.eknath.patil@intel.com>
> 
> Modify xe_pm subtests to exercise the following
> xe_device_sysfs.c functions:
> 
> - vram_d3cold_threshold_show()
> - vram_d3cold_threshold_store()
> - lb_fan_control_version_show()
> - lb_voltage_regulator_version_show()
> - auto_link_downgrade_capable_show()
> - auto_link_downgrade_status_show()
> 
> The subtests validate the corresponding sysfs
> attributes and improve code coverage for
> xe_device_sysfs.c.
> 
> Signed-off-by: Shivtej Patil <shivtej.eknath.patil@intel.com>
> ---
>  tests/intel-ci/xe.pm.d3cold.testlist |   6 +

Please move this into a separate last patch, use 'intel-ci:' prefix.

>  tests/intel/xe_pm.c                  | 184 ++++++++++++++++++++++-----
>  2 files changed, 158 insertions(+), 32 deletions(-)
> 
> diff --git a/tests/intel-ci/xe.pm.d3cold.testlist b/tests/intel-ci/xe.pm.d3cold.testlist
> index 783859fc7..e240fe7fb 100644
> --- a/tests/intel-ci/xe.pm.d3cold.testlist
> +++ b/tests/intel-ci/xe.pm.d3cold.testlist
> @@ -9,3 +9,9 @@ igt@xe_pm@d3cold-mmap-system
>  igt@xe_pm@d3cold-mmap-vram
>  igt@xe_pm@d3cold-mocs
>  igt@xe_pm@vram-d3cold-threshold
> +igt@xe_pm@vram-d3cold-threshold-show
> +igt@xe_pm@vram-d3cold-threshold-store
> +igt@xe_pm@lb-fan-control-version-show
> +igt@xe_pm@lb-voltage-regulator-version-show
> +igt@xe_pm@auto-link-downgrade-capable-show
> +igt@xe_pm@auto-link-downgrade-status-show
> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
> index 7faba7c2b..a7a7d84a7 100644
> --- a/tests/intel/xe_pm.c
> +++ b/tests/intel/xe_pm.c
> @@ -111,34 +111,9 @@ static bool runtime_usage_available(struct pci_device *pci)
>  	return access(name, F_OK) == 0;
>  }
>  
> -static uint64_t get_vram_d3cold_threshold(int sysfs)
> +static bool sysfs_exists(int sysfs_fd, const char *path)
>  {
> -	uint64_t threshold;
> -	char path[64];
> -	int ret;
> -
> -	sprintf(path, "device/vram_d3cold_threshold");
> -	igt_require_f(!faccessat(sysfs, path, R_OK, 0), "vram_d3cold_threshold is not present\n");
> -
> -	ret = igt_sysfs_scanf(sysfs, path, "%"PRIu64"", &threshold);
> -	igt_assert_lt(0, ret);
> -
> -	return threshold;
> -}
> -
> -static void set_vram_d3cold_threshold(int sysfs, uint64_t threshold)
> -{
> -	char path[64];
> -	int ret;
> -
> -	sprintf(path, "device/vram_d3cold_threshold");
> -
> -	if (!faccessat(sysfs, path, R_OK | W_OK, 0))
> -		ret = igt_sysfs_printf(sysfs, path, "%"PRIu64"", threshold);
> -	else
> -		igt_warn("vram_d3cold_threshold is not present\n");
> -
> -	igt_assert_lt(0, ret);
> +	return !faccessat(sysfs_fd, path, R_OK, 0);
>  }
>  
>  static void vram_d3cold_threshold_restore(int sig)
> @@ -148,7 +123,7 @@ static void vram_d3cold_threshold_restore(int sig)
>  	fd = drm_open_driver_master(DRIVER_XE);
>  	sysfs_fd = igt_sysfs_open(fd);
>  
> -	set_vram_d3cold_threshold(sysfs_fd, orig_threshold);
> +	igt_sysfs_set_vram_d3cold_threshold(sysfs_fd, orig_threshold);
>  
>  	close(sysfs_fd);
>  	close(fd);
> @@ -620,6 +595,48 @@ test_exec(device_t device, int n_exec_queues, int n_execs,
>  	active_threads = 0;
>  }
>  
> +/**
> + * SUBTEST: vram-d3cold-threshold-show
> + * Description:
> + *      Validate reading of vram_d3cold_threshold sysfs entry.
> + * Functionality: pm-d3cold
> + */
> +
> +/**
> + * SUBTEST: vram-d3cold-threshold-store
> + * Description:
> + *      Validate writing and reading back vram_d3cold_threshold sysfs entry.
> + * Functionality: pm-d3cold
> + */
> +
> +/**
> + * SUBTEST: lb-fan-control-version-show
> + * Description:
> + *      Validate reading lb_fan_control_version sysfs entry.
> + * Functionality: pm-sysfs
> + */
> +
> +/**
> + * SUBTEST: lb-voltage-regulator-version-show
> + * Description:
> + *      Validate reading lb_voltage_regulator_version sysfs entry.
> + * Functionality: pm-sysfs
> + */
> +
> +/**
> + * SUBTEST: auto-link-downgrade-capable-show
> + * Description:
> + *      Validate reading auto_link_downgrade_capable sysfs entry.
> + * Functionality: pm-sysfs
> + */
> +
> +/**
> + * SUBTEST: auto-link-downgrade-status-show
> + * Description:
> + *      Validate reading auto_link_downgrade_status sysfs entry.
> + * Functionality: pm-sysfs
> + */
> +
>  /**
>   * SUBTEST: vram-d3cold-threshold
>   * Functionality: pm - d3cold
> @@ -670,7 +687,7 @@ static void test_vram_d3cold_threshold(device_t device, int sysfs_fd)
>  	map = xe_bo_map(device.fd_xe, bo, SIZE);
>  	memset(map, 0, SIZE);
>  	munmap(map, SIZE);
> -	set_vram_d3cold_threshold(sysfs_fd, threshold);
> +	igt_sysfs_set_vram_d3cold_threshold(sysfs_fd, threshold);
>  
>  	/* Setup D3Cold but card should be in D3hot */
>  	igt_assert(setup_d3(device, IGT_ACPI_D3Cold));
> @@ -1113,14 +1130,117 @@ int igt_main()
>  
>  	igt_describe("Validate whether card is limited to d3hot,"
>  		     "if vram used > vram threshold");
> -	igt_subtest("vram-d3cold-threshold") {
> +igt_subtest("vram-d3cold-threshold") {
>  		igt_require_f(has_runtime_pm, "Runtime PM not available\n");
> -		orig_threshold = get_vram_d3cold_threshold(sysfs_fd);
> +		orig_threshold = igt_sysfs_get_vram_d3cold_threshold(sysfs_fd);
>  		igt_install_exit_handler(vram_d3cold_threshold_restore);
>  		test_vram_d3cold_threshold(device, sysfs_fd);
>  	}
>  
> -	igt_fixture() {
> +igt_subtest("vram-d3cold-threshold-show")
> +{
> +	uint64_t threshold;
> +
> +	igt_require(sysfs_exists(sysfs_fd,
> +				 "device/vram_d3cold_threshold"));
> +
> +	threshold = igt_sysfs_get_vram_d3cold_threshold(sysfs_fd);
> +
> +	igt_info("threshold=%" PRIu64 "\n", threshold);
> +}

Please indent this one tab to right, all of these new subtests.

Overall looks good.

> +
> +igt_subtest("vram-d3cold-threshold-store")
> +{
> +	uint64_t old_val;
> +	uint64_t new_val;
> +
> +	igt_require(sysfs_exists(sysfs_fd,
> +				 "device/vram_d3cold_threshold"));
> +	old_val = igt_sysfs_get_vram_d3cold_threshold(sysfs_fd);
> +	/*
> +	 * Ensure the original threshold is restored even if
> +	 * an assertion fails later in the test.
> +	 */
> +	igt_install_exit_handler(vram_d3cold_threshold_restore);
> +	igt_sysfs_set_vram_d3cold_threshold(sysfs_fd, old_val + 1);
> +	new_val = igt_sysfs_get_vram_d3cold_threshold(sysfs_fd);
> +	igt_assert_eq(new_val, old_val + 1);
> +	/* restore */
> +	igt_sysfs_set_vram_d3cold_threshold(sysfs_fd, old_val);
> +	igt_info("old=%" PRIu64 " new=%" PRIu64 "\n",
> +		 old_val, new_val);
> +}
> +
> +igt_subtest("lb-fan-control-version-show")
> +{
> +	char version[64];
> +	int ret;
> +
> +	igt_require(sysfs_exists(sysfs_fd,
> +				 "device/lb_fan_control_version"));
> +
> +	ret = igt_sysfs_scanf(sysfs_fd,
> +			      "device/lb_fan_control_version",
> +			      "%63s", version);
> +
> +	igt_assert(ret > 0);
> +
> +	igt_info("lb-fan-control-version=%s\n", version);
> +}
> +
> +igt_subtest("lb-voltage-regulator-version-show")
> +{
> +	char version[64] = {};
> +	int ret;
> +
> +	igt_require(sysfs_exists(sysfs_fd,
> +				 "device/lb_voltage_regulator_version"));
> +
> +	ret = igt_sysfs_scanf(sysfs_fd,
> +			      "device/lb_voltage_regulator_version",
> +			      "%63s", version);
> +	igt_info("ret=%d errno=%d version='%s'\n",
> +		 ret, errno, version);
> +
> +	igt_assert(ret > 0);
> +	igt_info("lb-voltage-regulator-version=%s\n", version);
> +}
> +
> +igt_subtest("auto-link-downgrade-capable-show")
> +{
> +	int val;
> +	int ret;
> +
> +	igt_require(sysfs_exists(sysfs_fd,
> +				 "device/auto_link_downgrade_capable"));
> +
> +	ret = igt_sysfs_scanf(sysfs_fd,
> +			      "device/auto_link_downgrade_capable",
> +			      "%d", &val);
> +
> +	igt_assert(ret > 0);
> +	igt_assert(val == 0 || val == 1);
> +	igt_info("auto-link-downgrade-capable=%d\n", val);
> +}
> +
> +igt_subtest("auto-link-downgrade-status-show")
> +{
> +	int val;
> +	int ret;
> +
> +	igt_require(sysfs_exists(sysfs_fd,
> +				 "device/auto_link_downgrade_status"));
> +
> +	ret = igt_sysfs_scanf(sysfs_fd,
> +			      "device/auto_link_downgrade_status",
> +			      "%d", &val);
> +
> +	igt_assert(ret > 0);
> +	igt_assert(val == 0 || val == 1);
> +	igt_info("auto-link-downgrade-status=%d\n", val);
> +}
> +
> +igt_fixture() {

This 'igt_fixture() {' also should be moved to right, this code
is inside igt_main(), not a separate function.

Regards,
Kamil

>  		close(sysfs_fd);
>  		igt_pm_set_d3cold_allowed(device.pci_slot_name, d3cold_allowed);
>  		if (has_runtime_pm)
> -- 
> 2.43.0
> 
