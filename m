Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BD55CA5FFC
	for <igt-dev@archiver.kernel.org>; Wed,  7 Oct 2026 13:51:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EB2610EB26;
	Wed,  7 Oct 2026 13:51:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J0r7z3wi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59DDE10E5C8
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Oct 2026 13:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791381051; x=1822917051;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=e8Sp4j9MNzoky4lbf1nENMp/9TrPI9ym5E+i1uAEL64=;
 b=J0r7z3wiDDMJWgYHLu+lJVaXucordcsxzdRgXR1k+z52TJwl+lkh9g/v
 U/4ZdGcCNLHAeMKriF6/kdicGsM8BYvwV8d62TGMiOCJo1J8xzJ3JM1Ub
 RBcWYN2ZeSMAgFjUZ6U2XXQmlqSUzZ3e4RKxFjWUe7JeLmtZINfTJPcg0
 qKAIYgsdTCo/ehHbxA2ukt7o/GOwc0R8qURSFeKfMwntqWppuTCk8R8i6
 ENN4DCHg1qyU9lCRm9s5Ww3bZYMwCkwDfA3VtRLZj3LXslwADRteBZlqJ
 QI2Ms96gdBtyv4hmruUTCNpC5s023lcDFWLKy9djeWdVwEyY/EjAtu+QZ Q==;
X-CSE-ConnectionGUID: XHczyQS6QuWNcyCa0W8Ieg==
X-CSE-MsgGUID: /AOTJCmpToC0lUaMmpB/aQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="244413"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="244413"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 06:50:51 -0700
X-CSE-ConnectionGUID: XWocWCygTpqWSyMI9zdOZg==
X-CSE-MsgGUID: wjeQXZTiTTO5j9Lf4yzDFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; d="scan'208";a="305437933"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 06:50:49 -0700
Date: Wed, 7 Oct 2026 15:50:46 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: shivtej.eknath.patil@intel.com
Cc: igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com,
 nishit.sharma@intel.com, smitha.balasubramanyam@intel.com,
 karthik.poosa@intel.com, dwarakanath.ramadeva@intel.com
Subject: Re: [PATCH v1] Revert "tests/intel/xe_pm: add coverage for
 xe_device_sysfs"
Message-ID: <20261007135046.ga2yenstriqpbi3k@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 shivtej.eknath.patil@intel.com, igt-dev@lists.freedesktop.org,
 kamil.konieczny@intel.com, nishit.sharma@intel.com,
 smitha.balasubramanyam@intel.com, karthik.poosa@intel.com,
 dwarakanath.ramadeva@intel.com
References: <20261007051044.6399-1-shivtej.eknath.patil@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261007051044.6399-1-shivtej.eknath.patil@intel.com>
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

Hi Shivtej,
On 2026-10-07 at 05:10:44 +0000, shivtej.eknath.patil@intel.com wrote:
> From: Shivtej Patil <shivtej.eknath.patil@intel.com>
> 
> The added subtests exercise sysfs interfaces exposed by
> xe_device_sysfs.c. Subsequent discussion identified that
> these checks are better suited for a dedicated xe_sysfs
> test rather than xe_pm.

Please do not cite original commit message, above should be
removed.

>  
> Revert the xe_pm coverage for now. The sysfs coverage will
> be revisited and reintroduced in a more appropriate test.
> 
> This reverts commit 92dd3081aa8de197a5dc37b9799526a0de183c8f.
> 
> Signed-off-by: Shivtej Patil <shivtej.eknath.patil@intel.com>

LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

PS. Reading of sysfs nodes should be covered by core_sysfs,
if not core test should be fixed.

> ---
>  tests/intel/xe_pm.c | 176 ++++++++------------------------------------
>  1 file changed, 31 insertions(+), 145 deletions(-)
> 
> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
> index 9a70b1645..543f46f5b 100644
> --- a/tests/intel/xe_pm.c
> +++ b/tests/intel/xe_pm.c
> @@ -111,9 +111,34 @@ static bool runtime_usage_available(struct pci_device *pci)
>  	return access(name, F_OK) == 0;
>  }
>  
> -static bool sysfs_exists(int sysfs_fd, const char *path)
> +static uint64_t get_vram_d3cold_threshold(int sysfs)
>  {
> -	return !faccessat(sysfs_fd, path, R_OK, 0);
> +	uint64_t threshold;
> +	char path[64];
> +	int ret;
> +
> +	sprintf(path, "device/vram_d3cold_threshold");
> +	igt_require_f(!faccessat(sysfs, path, R_OK, 0), "vram_d3cold_threshold is not present\n");
> +
> +	ret = igt_sysfs_scanf(sysfs, path, "%"PRIu64"", &threshold);
> +	igt_assert_lt(0, ret);
> +
> +	return threshold;
> +}
> +
> +static void set_vram_d3cold_threshold(int sysfs, uint64_t threshold)
> +{
> +	char path[64];
> +	int ret;
> +
> +	sprintf(path, "device/vram_d3cold_threshold");
> +
> +	if (!faccessat(sysfs, path, R_OK | W_OK, 0))
> +		ret = igt_sysfs_printf(sysfs, path, "%"PRIu64"", threshold);
> +	else
> +		igt_warn("vram_d3cold_threshold is not present\n");
> +
> +	igt_assert_lt(0, ret);
>  }
>  
>  static void vram_d3cold_threshold_restore(int sig)
> @@ -123,7 +148,7 @@ static void vram_d3cold_threshold_restore(int sig)
>  	fd = drm_open_driver_master(DRIVER_XE);
>  	sysfs_fd = igt_sysfs_open(fd);
>  
> -	igt_sysfs_set_vram_d3cold_threshold(sysfs_fd, orig_threshold);
> +	set_vram_d3cold_threshold(sysfs_fd, orig_threshold);
>  
>  	close(sysfs_fd);
>  	close(fd);
> @@ -595,48 +620,6 @@ test_exec(device_t device, int n_exec_queues, int n_execs,
>  	active_threads = 0;
>  }
>  
> -/**
> - * SUBTEST: vram-d3cold-threshold-show
> - * Description:
> - *      Validate reading of vram_d3cold_threshold sysfs entry.
> - * Functionality: pm-d3cold
> - */
> -
> -/**
> - * SUBTEST: vram-d3cold-threshold-store
> - * Description:
> - *      Validate writing and reading back vram_d3cold_threshold sysfs entry.
> - * Functionality: pm-d3cold
> - */
> -
> -/**
> - * SUBTEST: lb-fan-control-version-show
> - * Description:
> - *      Validate reading lb_fan_control_version sysfs entry.
> - * Functionality: pm-sysfs
> - */
> -
> -/**
> - * SUBTEST: lb-voltage-regulator-version-show
> - * Description:
> - *      Validate reading lb_voltage_regulator_version sysfs entry.
> - * Functionality: pm-sysfs
> - */
> -
> -/**
> - * SUBTEST: auto-link-downgrade-capable-show
> - * Description:
> - *      Validate reading auto_link_downgrade_capable sysfs entry.
> - * Functionality: pm-sysfs
> - */
> -
> -/**
> - * SUBTEST: auto-link-downgrade-status-show
> - * Description:
> - *      Validate reading auto_link_downgrade_status sysfs entry.
> - * Functionality: pm-sysfs
> - */
> -
>  /**
>   * SUBTEST: vram-d3cold-threshold
>   * Functionality: pm - d3cold
> @@ -687,7 +670,7 @@ static void test_vram_d3cold_threshold(device_t device, int sysfs_fd)
>  	map = xe_bo_map(device.fd_xe, bo, SIZE);
>  	memset(map, 0, SIZE);
>  	munmap(map, SIZE);
> -	igt_sysfs_set_vram_d3cold_threshold(sysfs_fd, threshold);
> +	set_vram_d3cold_threshold(sysfs_fd, threshold);
>  
>  	/* Setup D3Cold but card should be in D3hot */
>  	igt_assert(setup_d3(device, IGT_ACPI_D3Cold));
> @@ -1099,7 +1082,7 @@ int igt_main()
>  		}
>  
>  		igt_describe_f("Validate mmap memory mappings with vram region,"
> -			       "when device along with parent bridge in %s", d->name);
> +			     "when device along with parent bridge in %s", d->name);
>  		igt_subtest_f("%s-mmap-vram", d->name) {
>  			int delay_ms;
>  
> @@ -1133,108 +1116,11 @@ int igt_main()
>  		     "if vram used > vram threshold");
>  	igt_subtest("vram-d3cold-threshold") {
>  		igt_require_f(has_runtime_pm, "Runtime PM not available\n");
> -		orig_threshold = igt_sysfs_get_vram_d3cold_threshold(sysfs_fd);
> +		orig_threshold = get_vram_d3cold_threshold(sysfs_fd);
>  		igt_install_exit_handler(vram_d3cold_threshold_restore);
>  		test_vram_d3cold_threshold(device, sysfs_fd);
>  	}
>  
> -	igt_subtest("vram-d3cold-threshold-show") {
> -		uint64_t threshold;
> -
> -		igt_require(sysfs_exists(sysfs_fd,
> -					 "device/vram_d3cold_threshold"));
> -
> -		threshold = igt_sysfs_get_vram_d3cold_threshold(sysfs_fd);
> -
> -		igt_info("threshold=%" PRIu64 "\n", threshold);
> -	}
> -
> -	igt_subtest("vram-d3cold-threshold-store") {
> -		uint64_t old_val;
> -		uint64_t new_val;
> -
> -		igt_require(sysfs_exists(sysfs_fd,
> -					 "device/vram_d3cold_threshold"));
> -		old_val = igt_sysfs_get_vram_d3cold_threshold(sysfs_fd);
> -		/*
> -		 * Ensure the original threshold is restored even if
> -		 * an assertion fails later in the test.
> -		 */
> -		orig_threshold = old_val;
> -		igt_install_exit_handler(vram_d3cold_threshold_restore);
> -		igt_sysfs_set_vram_d3cold_threshold(sysfs_fd, old_val + 1);
> -		new_val = igt_sysfs_get_vram_d3cold_threshold(sysfs_fd);
> -		igt_assert_eq(new_val, old_val + 1);
> -		/* restore */
> -		igt_sysfs_set_vram_d3cold_threshold(sysfs_fd, old_val);
> -		igt_info("old=%" PRIu64 " new=%" PRIu64 "\n",
> -			 old_val, new_val);
> -	}
> -
> -	igt_subtest("lb-fan-control-version-show") {
> -		char version[64];
> -		int ret;
> -
> -		igt_require(sysfs_exists(sysfs_fd,
> -					 "device/lb_fan_control_version"));
> -
> -		ret = igt_sysfs_scanf(sysfs_fd,
> -				      "device/lb_fan_control_version",
> -				      "%63s", version);
> -
> -		igt_assert(ret > 0);
> -
> -		igt_info("lb-fan-control-version=%s\n", version);
> -	}
> -
> -	igt_subtest("lb-voltage-regulator-version-show") {
> -		char version[64] = {};
> -		int ret;
> -
> -		igt_require(sysfs_exists(sysfs_fd,
> -					 "device/lb_voltage_regulator_version"));
> -
> -		ret = igt_sysfs_scanf(sysfs_fd,
> -				      "device/lb_voltage_regulator_version",
> -				      "%63s", version);
> -		igt_debug("ret=%d errno=%d\n", ret, errno);
> -
> -		igt_assert(ret > 0);
> -		igt_info("lb-voltage-regulator-version=%s\n", version);
> -	}
> -
> -	igt_subtest("auto-link-downgrade-capable-show") {
> -		int val;
> -		int ret;
> -
> -		igt_require(sysfs_exists(sysfs_fd,
> -					 "device/auto_link_downgrade_capable"));
> -
> -		ret = igt_sysfs_scanf(sysfs_fd,
> -				      "device/auto_link_downgrade_capable",
> -				      "%d", &val);
> -
> -		igt_assert(ret > 0);
> -		igt_info("auto-link-downgrade-capable=%d\n", val);
> -		igt_assert(val == 0 || val == 1);
> -	}
> -
> -	igt_subtest("auto-link-downgrade-status-show") {
> -		int val;
> -		int ret;
> -
> -		igt_require(sysfs_exists(sysfs_fd,
> -					 "device/auto_link_downgrade_status"));
> -
> -		ret = igt_sysfs_scanf(sysfs_fd,
> -				      "device/auto_link_downgrade_status",
> -				      "%d", &val);
> -
> -		igt_assert(ret > 0);
> -		igt_info("auto-link-downgrade-status=%d\n", val);
> -		igt_assert(val == 0 || val == 1);
> -	}
> -
>  	igt_fixture() {
>  		close(sysfs_fd);
>  		igt_pm_set_d3cold_allowed(device.pci_slot_name, d3cold_allowed);
> -- 
> 2.43.0
> 
