Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9BAA606EE9B
	for <igt-dev@archiver.kernel.org>; Mon,  9 Nov 2026 14:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nMtV7oX6
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BFFF10E1A2;
	Mon,  9 Nov 2026 14:58:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A7EF10E345
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Nov 2026 14:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794236278; x=1825772278;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=98mvuRB8Y7pNIHJBsuzRWN//vDaInmyq9SqFjn8+Xec=;
 b=nMtV7oX6gPAjW3HoGKaB4RLKBIL+wl0SLAyjXjqDozQXymJ4uZI9k+JB
 SfFeVdJ1wYCb4TVzsL/vDK5XLkc3z2NNX9I2SX4sMZ7vXKpNQTFR75yae
 FDiUk4WhtaILtAf7sIFzaCH9l7r1hD3hNjuXsLxfFKg9XsOHAMUzvF+B9
 oiVYYXxoPV6/JXzoVP86xM3PmqbUV+MlqtAcrAMoqKQzJAC9+7xCwLOMc
 FPJ+PbkjY0EcHTTGvBIra4IXaIO/+3xtFSKxTDvLHz3RkU191y7sXqt6v
 3HcT0gkeGw/K3rldMOdYuMXnNdNd08ge7hxi///Dhmryh6L7kdExXTE9V w==;
X-CSE-ConnectionGUID: LRH9TXUpRgurNgZ7q5Py9g==
X-CSE-MsgGUID: MDivSfZKTvCdaxxjglfb6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="2838922"
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="2838922"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2026 06:57:58 -0800
X-CSE-ConnectionGUID: NOiYJlorTI6z5lDfG0bVSA==
X-CSE-MsgGUID: 1PLrmrlKSw2FvxmFH+bvLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="8324995"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2026 06:57:54 -0800
Date: Mon, 9 Nov 2026 15:57:51 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: shivtej.eknath.patil@intel.com
Cc: igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com, 
 nishit.sharma@intel.com, smitha.balasubramanyam@intel.com,
 karthik.poosa@intel.com, 
 ramadevi.gandi@intel.com, badal.nilawar@intel.com, peter.senna@intel.com, 
 Patil@freedesktop.org
Subject: Re: [PATCH v1 1/2] tests/core_sysfs: add coverage for
 xe_device_sysfs entries
Message-ID: <wrnao7lanzy3ujr3rnpqvdqty42a36bb4adtaoyylti6pyotsj@cgxaucfjphwh>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 shivtej.eknath.patil@intel.com, igt-dev@lists.freedesktop.org,
 kamil.konieczny@intel.com, 
 nishit.sharma@intel.com, smitha.balasubramanyam@intel.com,
 karthik.poosa@intel.com, 
 ramadevi.gandi@intel.com, badal.nilawar@intel.com, peter.senna@intel.com, 
 Patil@freedesktop.org
References: <20261104072850.18413-1-shivtej.eknath.patil@intel.com>
 <20261104072850.18413-2-shivtej.eknath.patil@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261104072850.18413-2-shivtej.eknath.patil@intel.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi shivtej.eknath.patil,
On 2026-11-04 at 07:28:49 +0000, shivtej.eknath.patil@intel.com wrote:
> From: "Patil, Shivtej Eknath" <shivtej.eknath.patil@intel.com>

This should be:

> From: "Shivtej Eknath Patil" <shivtej.eknath.patil@intel.com>


> 
> Add sysfs coverage subtests to validate the following
> xe_device_sysfs entries:

Nack, please do not add driver-specific code to generic core
tests, if possible.

> - auto-link-downgrade-capable
> - auto-link-downgrade-status
> - lb-fan-control-version
> - lb-voltage-regulator-version
> - vram-d3cold-threshold-show
> - vram-d3cold-threshold-store
> 
> Signed-off-by: Patil, Shivtej Eknath <shivtej.eknath.patil@intel.com>

This should be:

Signed-off-by: Shivtej Eknath Patil <shivtej.eknath.patil@intel.com>

Let me propose some changes to this test, so it should be
easier to spot a problem, if there is any.


Regards,
Kamil

> ---
>  tests/core_sysfs.c | 115 +++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 115 insertions(+)
> 
> diff --git a/tests/core_sysfs.c b/tests/core_sysfs.c
> index 3173ffa7b..a10e462c8 100644
> --- a/tests/core_sysfs.c
> +++ b/tests/core_sysfs.c
> @@ -20,8 +20,30 @@
>   * SUBTEST: read-all-entries
>   * Description: Read all entries from sysfs path
>   *
> + * SUBTEST: auto-link-downgrade-capable-show
> + * Description: Read auto_link_downgrade_capable sysfs entry
> + *
> + * SUBTEST: auto-link-downgrade-status-show
> + * Description: Read auto_link_downgrade_status sysfs entry
> + *
> + * SUBTEST: lb-fan-control-version-show
> + * Description: Read lb_fan_control_version sysfs entry
> + *
> + * SUBTEST: lb-voltage-regulator-version-show
> + * Description: Read lb_voltage_regulator_version sysfs entry
> + *
> + * SUBTEST: vram-d3cold-threshold-show
> + * Description: Read vram_d3cold_threshold sysfs entry
> + *
> + * SUBTEST: vram-d3cold-threshold-store
> + * Description: Write and read back vram_d3cold_threshold sysfs entry
>   */
>  
> +static bool sysfs_exists(int sysfs_fd, const char *path)
> +{
> +	return !faccessat(sysfs_fd, path, R_OK, 0);
> +}
> +
>  IGT_TEST_DESCRIPTION("Read entries from sysfs paths.");
>  
>  int igt_main()
> @@ -41,6 +63,99 @@ int igt_main()
>  	igt_subtest("read-all-entries")
>  		igt_dir_process_files_simple(sysfs);
>  
> +	igt_subtest("auto-link-downgrade-capable-show") {
> +		int val;
> +		int ret;
> +
> +		igt_require(sysfs_exists(sysfs,
> +					 "device/auto_link_downgrade_capable"));
> +
> +		ret = igt_sysfs_scanf(sysfs,
> +				      "device/auto_link_downgrade_capable",
> +				      "%d", &val);
> +
> +		igt_assert(ret > 0);
> +		igt_info("auto-link-downgrade-capable=%d\n", val);
> +		igt_assert(val == 0 || val == 1);
> +	}
> +
> +	igt_subtest("auto-link-downgrade-status-show") {
> +		int val;
> +		int ret;
> +
> +		igt_require(sysfs_exists(sysfs,
> +					 "device/auto_link_downgrade_status"));
> +
> +		ret = igt_sysfs_scanf(sysfs,
> +				      "device/auto_link_downgrade_status",
> +				      "%d", &val);
> +
> +		igt_assert(ret > 0);
> +		igt_info("auto-link-downgrade-status=%d\n", val);
> +		igt_assert(val == 0 || val == 1);
> +	}
> +
> +	igt_subtest("lb-fan-control-version-show") {
> +		char version[64];
> +		int ret;
> +
> +		igt_require(sysfs_exists(sysfs,
> +					 "device/lb_fan_control_version"));
> +
> +		ret = igt_sysfs_scanf(sysfs,
> +				      "device/lb_fan_control_version",
> +				      "%63s", version);
> +
> +		igt_debug("ret=%d errno=%d\n", ret, errno);
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
> +		igt_require(sysfs_exists(sysfs,
> +					 "device/lb_voltage_regulator_version"));
> +
> +		ret = igt_sysfs_scanf(sysfs,
> +				      "device/lb_voltage_regulator_version",
> +				      "%63s", version);
> +		igt_debug("ret=%d errno=%d\n", ret, errno);
> +
> +		igt_assert(ret > 0);
> +		igt_info("lb-voltage-regulator-version=%s\n", version);
> +	}
> +
> +	igt_subtest("vram-d3cold-threshold-show") {
> +		uint64_t threshold;
> +
> +		igt_require(sysfs_exists(sysfs,
> +					 "device/vram_d3cold_threshold"));
> +
> +		threshold = igt_sysfs_get_vram_d3cold_threshold(sysfs);
> +
> +		igt_info("threshold=%" PRIu64 "\n", threshold);
> +	}
> +
> +	igt_subtest("vram-d3cold-threshold-store") {
> +		uint64_t old_val;
> +		uint64_t new_val;
> +
> +		igt_require(sysfs_exists(sysfs,
> +					 "device/vram_d3cold_threshold"));
> +		old_val = igt_sysfs_get_vram_d3cold_threshold(sysfs);
> +		igt_sysfs_set_vram_d3cold_threshold(sysfs, old_val + 1);
> +		new_val = igt_sysfs_get_vram_d3cold_threshold(sysfs);
> +		igt_assert_eq(new_val, old_val + 1);
> +		/* restore */
> +		igt_sysfs_set_vram_d3cold_threshold(sysfs, old_val);
> +		igt_info("old=%" PRIu64 " new=%" PRIu64 "\n",
> +			 old_val, new_val);
> +	}
> +
>  	igt_fixture() {
>  		close(sysfs);
>  		drm_close_driver(fd);
> -- 
> 2.34.1
> 
