Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60CB5CA5FB1
	for <igt-dev@archiver.kernel.org>; Wed, 30 Sep 2026 11:37:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C914B10E9F2;
	Wed, 30 Sep 2026 11:37:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KTSfVKE9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FCA310F309
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Sep 2026 11:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790768177; x=1822304177;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=zhZi+wtJLgx7YLhktxfqBVWX2x+lKpZvamLG6ox2MdM=;
 b=KTSfVKE97BFHR5/aLNhsZgFOBwM2nXd/YnN86P12dRzy47/togm6FlZR
 bROiO4WAoOsGdhdg2xKQw51q9K38qpec3TC8L1GE84UFuTEiC8wVHFyMz
 8v/3Y8qbCXAPWV0AiRMoLmY+qVXi0QKq0Fi8553z1c7MOTv7euMD0S+Aq
 9ukIoyslf9fVU5H+OqxuIFuqhgPRcLUxgcxkvU+RMz1i8y2Ayg4CjdSE5
 TGskmJkzz26YnaFGZGQFN6a9bCd5FEpQduayHYcUKu6qjFYjBzLE/LSic
 2JLMDASrRnSc0tzJKCub9CeC+dqxRwEJuDs4Bwo4BqORAQsKPZ32Q8MQN A==;
X-CSE-ConnectionGUID: p4M32Q+QTT+NP2BMTJS8Rw==
X-CSE-MsgGUID: hIDi3t1PSvCiI2XDmuIoiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="93988579"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208";a="93988579"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 04:36:17 -0700
X-CSE-ConnectionGUID: 9GCBXJd0Q5WgrBjbJ10Npg==
X-CSE-MsgGUID: DLM9R4x9SpCvLkdHbrRoEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208";a="313597845"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 04:36:15 -0700
Date: Wed, 30 Sep 2026 13:36:13 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: shivtej.eknath.patil@intel.com
Cc: igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com,
 nishit.sharma@intel.com, smitha.balasubramanyam@intel.com
Subject: Re: [PATCH v7 2/3] tests/intel/xe_pm: add coverage for xe_device_sysfs
Message-ID: <20260930113613.t356gmbagtd4fnb7@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 shivtej.eknath.patil@intel.com, igt-dev@lists.freedesktop.org,
 kamil.konieczny@intel.com, nishit.sharma@intel.com,
 smitha.balasubramanyam@intel.com
References: <20260915052421.23254-1-shivtej.eknath.patil@intel.com>
 <20260915052421.23254-3-shivtej.eknath.patil@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260915052421.23254-3-shivtej.eknath.patil@intel.com>
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
On 2026-09-15 at 05:24:15 +0000, shivtej.eknath.patil@intel.com wrote:
> From: Shivtej Patil <shivtej.eknath.patil@intel.com>
> 
> Modify xe_pm subtests to exercise the following

Better:

Add new subtests to exercise the following

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

Do not repeat, just make it short:

The subtests validate the corresponding sysfs attributes and
improve code coverage.

> 
> Signed-off-by: Shivtej Patil <shivtej.eknath.patil@intel.com>
> ---
>  tests/intel/xe_pm.c | 176 ++++++++++++++++++++++++++++++++++++--------
>  1 file changed, 145 insertions(+), 31 deletions(-)
> 
> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
> index 7faba7c2b..9286233e4 100644
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
> @@ -1081,7 +1098,7 @@ int igt_main()
>  		}
>  
>  		igt_describe_f("Validate mmap memory mappings with vram region,"
> -			     "when device along with parent bridge in %s", d->name);
> +			       "when device along with parent bridge in %s", d->name);

Drop this change, it is unrelated.

>  		igt_subtest_f("%s-mmap-vram", d->name) {
>  			int delay_ms;
>  
> @@ -1115,11 +1132,108 @@ int igt_main()
>  		     "if vram used > vram threshold");
>  	igt_subtest("vram-d3cold-threshold") {
>  		igt_require_f(has_runtime_pm, "Runtime PM not available\n");
> -		orig_threshold = get_vram_d3cold_threshold(sysfs_fd);
> +		orig_threshold = igt_sysfs_get_vram_d3cold_threshold(sysfs_fd);
>  		igt_install_exit_handler(vram_d3cold_threshold_restore);
>  		test_vram_d3cold_threshold(device, sysfs_fd);
>  	}
>  
> +	igt_subtest("vram-d3cold-threshold-show") {
> +		uint64_t threshold;
> +
> +		igt_require(sysfs_exists(sysfs_fd,
> +					 "device/vram_d3cold_threshold"));
> +
> +		threshold = igt_sysfs_get_vram_d3cold_threshold(sysfs_fd);
> +
> +		igt_info("threshold=%" PRIu64 "\n", threshold);
> +	}
> +
> +	igt_subtest("vram-d3cold-threshold-store") {
> +		uint64_t old_val;
> +		uint64_t new_val;
> +
> +		igt_require(sysfs_exists(sysfs_fd,
> +					 "device/vram_d3cold_threshold"));
> +		old_val = igt_sysfs_get_vram_d3cold_threshold(sysfs_fd);
> +		/*
> +		 * Ensure the original threshold is restored even if
> +		 * an assertion fails later in the test.
> +		 */

You need to set original value before, otherwise exit handler
will set bogus value, so here it should be:

		orig_threshold = old_val;

> +		igt_install_exit_handler(vram_d3cold_threshold_restore);
> +		igt_sysfs_set_vram_d3cold_threshold(sysfs_fd, old_val + 1);
> +		new_val = igt_sysfs_get_vram_d3cold_threshold(sysfs_fd);
> +		igt_assert_eq(new_val, old_val + 1);
> +		/* restore */
> +		igt_sysfs_set_vram_d3cold_threshold(sysfs_fd, old_val);
> +		igt_info("old=%" PRIu64 " new=%" PRIu64 "\n",
> +			 old_val, new_val);
> +	}
> +
> +	igt_subtest("lb-fan-control-version-show") {
> +		char version[64];
> +		int ret;
> +
> +		igt_require(sysfs_exists(sysfs_fd,
> +					 "device/lb_fan_control_version"));
> +
> +		ret = igt_sysfs_scanf(sysfs_fd,
> +				      "device/lb_fan_control_version",
> +				      "%63s", version);
> +
> +		igt_assert(ret > 0);
> +
> +		igt_info("lb-fan-control-version=%s\n", version);
> +	}
> +
> +	igt_subtest("lb-voltage-regulator-version-show") {
> +		char version[64] = {};
> +		int ret;
> +
> +		igt_require(sysfs_exists(sysfs_fd,
> +					 "device/lb_voltage_regulator_version"));
> +
> +		ret = igt_sysfs_scanf(sysfs_fd,
> +				      "device/lb_voltage_regulator_version",
> +				      "%63s", version);
> +		igt_info("ret=%d errno=%d version='%s'\n",
> +			 ret, errno, version);

Don't print version here, also imho better to use igt_debug() here.

> +
> +		igt_assert(ret > 0);
> +		igt_info("lb-voltage-regulator-version=%s\n", version);
> +	}
> +
> +	igt_subtest("auto-link-downgrade-capable-show") {
> +		int val;
> +		int ret;
> +
> +		igt_require(sysfs_exists(sysfs_fd,
> +					 "device/auto_link_downgrade_capable"));
> +
> +		ret = igt_sysfs_scanf(sysfs_fd,
> +				      "device/auto_link_downgrade_capable",
> +				      "%d", &val);
> +
> +		igt_assert(ret > 0);
> +		igt_assert(val == 0 || val == 1);
> +		igt_info("auto-link-downgrade-capable=%d\n", val);

Move this print before igt_assert(val == 0 || val == 1);

> +	}
> +
> +	igt_subtest("auto-link-downgrade-status-show") {
> +		int val;
> +		int ret;
> +
> +		igt_require(sysfs_exists(sysfs_fd,
> +					 "device/auto_link_downgrade_status"));
> +
> +		ret = igt_sysfs_scanf(sysfs_fd,
> +				      "device/auto_link_downgrade_status",
> +				      "%d", &val);
> +
> +		igt_assert(ret > 0);
> +		igt_assert(val == 0 || val == 1);
> +		igt_info("auto-link-downgrade-status=%d\n", val);

Same here, move this print before last assert. As you need to
update this patch, please also correct minors at first one.

Regards,
Kamil

> +	}
> +
>  	igt_fixture() {
>  		close(sysfs_fd);
>  		igt_pm_set_d3cold_allowed(device.pci_slot_name, d3cold_allowed);
> -- 
> 2.43.0
> 
