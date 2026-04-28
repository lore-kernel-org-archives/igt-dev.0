Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9684AFF885D
	for <igt-dev@archiver.kernel.org>; Tue, 28 Apr 2026 12:57:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 485B010ECE7;
	Tue, 28 Apr 2026 12:57:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NHg2YA0X";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4774110ECE7
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Apr 2026 12:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777381046; x=1808917046;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=PDwOc/fzOJ50Tk/XukibhzTtiWNwOXRaxOpEmZsCROg=;
 b=NHg2YA0Xpj9hT8WBDi5AmccRdR3UCPL5TXjgTdyK0t+DYiSTsfg07s0p
 90eqo6FRpv33XEc/dOQEXY5up9IDUaOvlw8+xwmjUq1XmsKe9+WoZYlQT
 vGE3G06D7iaooDXkfEVTx6sfRjicEQ9JG5Nc1a1NNLnFDoBenZgeRpUYn
 v8+zSvarER0fFRFnLJ/sdAvbhSXxR86x6mV3zrjnbGEfNKJnESaKxfG5y
 wdn/fvqtgrGVOAjoC3IlyfO8fgmsJ77in3nDVJGEFgZmcU1iQpoWsYnLn
 gqaxu8AV3LezXMwM9LnNAqC+qntBI3eYiOID26B1wiP1TP5q5MarDbXLT Q==;
X-CSE-ConnectionGUID: BTcSSQOWTpGIfvHxn2yrYw==
X-CSE-MsgGUID: m+hNmEUxRbqWJ3h76wM+KQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="89377544"
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; d="scan'208";a="89377544"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 05:57:25 -0700
X-CSE-ConnectionGUID: HyHZ2oBmRWiYc/51DfDtaQ==
X-CSE-MsgGUID: FPYBtIVsRaCtD/wlYy/t4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; d="scan'208";a="257264646"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 05:57:23 -0700
Date: Tue, 28 Apr 2026 14:57:21 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Nitin Gote <nitin.r.gote@intel.com>
Cc: igt-dev@lists.freedesktop.org, marcin.bernatowicz@linux.intel.com
Subject: Re: [PATCH] tests/intel/xe_configfs: Use available engine for
 ctx-restore subtests
Message-ID: <20260428125721.w2xibxs7wvpczl62@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Nitin Gote <nitin.r.gote@intel.com>, igt-dev@lists.freedesktop.org,
 marcin.bernatowicz@linux.intel.com
References: <20260421144041.1365713-2-nitin.r.gote@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260421144041.1365713-2-nitin.r.gote@intel.com>
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

Hi Nitin,
On 2026-04-21 at 20:10:42 +0530, Nitin Gote wrote:
> The ctx-restore-post-bb and ctx-restore-mid-bb subtests were hardcoded
> to use the "rcs" engine class. Platforms without a render engine (e.g.
> PVC, CRI) fail because the batch buffer is never injected into any
> engine's LRC, causing register readback to fail.
> 
> Fix by dynamically detecting an available engine in the fixture using
> xe_for_each_engine(). Prefer render ("rcs") when available, otherwise
> fall back to compute ("ccs"). Every xe platform has at least one of
> these engine classes. Remove the hardcoded "rcs" from test data and
> add the detected engine name at runtime.
> 
> Fixes: b6abdc26e01b ("tests/intel/xe_configfs: Check ctx_restore_post_bb")
> Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
> ---
>  tests/intel/xe_configfs.c | 61 ++++++++++++++++++++++++++-------------
>  1 file changed, 41 insertions(+), 20 deletions(-)
> 
> diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
> index 755524e7c..1d5ea1503 100644
> --- a/tests/intel/xe_configfs.c
> +++ b/tests/intel/xe_configfs.c
> @@ -261,11 +261,12 @@ static void test_ctx_restore_invalid(int configfs_device_fd, const char *type)
>   * SUBTEST: ctx-restore-mid-bb
>   * Description: Validate ctx_restore_mid_bb attribute
>   */
> -static void test_ctx_restore(int configfs_device_fd, const char *type)
> +static void test_ctx_restore(int configfs_device_fd, const char *type,
> +			     const char *engine)
>  {
>  	static const struct value {
>  		const char *test;
> -		const char *in;
> +		const char *in[3];
>  		const char *out;
>  		uint32_t reg[4];
>  		uint32_t reg_val[4];
> @@ -276,38 +277,40 @@ static void test_ctx_restore(int configfs_device_fd, const char *type)
>  		 * previous execution set a specific value in the HW
>  		 */
>  		{ .test = "cmd-single",
> -		  .in = "rcs cmd 11000001 4F100 DEA0BEE0",
> -		  .out = "rcs: 11000001 0004f100 dea0bee0\n",
> +		  .in = { "cmd 11000001 4F100 DEA0BEE0" },
> +		  .out = "11000001 0004f100 dea0bee0",
>  		  .reg = { 0x4f100 },
>  		  .reg_val = { 0xdea0bee0 },
>  		},
>  		{ .test = "cmd-single-multi-values",
> -		  .in = "rcs cmd 11000003 4F100 DEA1BEE1 4F104 DEA2BEE2",
> -		  .out = "rcs: 11000003 0004f100 dea1bee1 0004f104 dea2bee2\n",
> +		  .in = { "cmd 11000003 4F100 DEA1BEE1 4F104 DEA2BEE2" },
> +		  .out = "11000003 0004f100 dea1bee1 0004f104 dea2bee2",
>  		  .reg = { 0x4f100, 0x4f104 },
>  		  .reg_val = { 0xdea1bee1, 0xdea2bee2 },
>  		},
>  		{ .test = "cmd-multi",
> -		  .in = "rcs cmd 11000001 4F100 DEA3BEE3\n"
> -			"rcs cmd 11000001 4F104 DEA4BEE4",
> -		  .out = "rcs: 11000001 0004f100 dea3bee3 11000001 0004f104 dea4bee4\n",
> +		  .in = { "cmd 11000001 4F100 DEA3BEE3",
> +			  "cmd 11000001 4F104 DEA4BEE4" },
> +		  .out = "11000001 0004f100 dea3bee3 11000001 0004f104 dea4bee4",
>  		  .reg = { 0x4f100, 0x4f104 },
>  		  .reg_val = { 0xdea3bee3, 0xdea4bee4 },
>  		},
>  		{ .test = "reg-single",
> -		  .in = "rcs reg 4F100 DEA5BEE5",
> -		  .out = "rcs: 11000001 0004f100 dea5bee5\n",
> +		  .in = { "reg 4F100 DEA5BEE5" },
> +		  .out = "11000001 0004f100 dea5bee5",
>  		  .reg = { 0x4f100 },
>  		  .reg_val = { 0xdea5bee5 },
>  		},
>  		{ .test = "reg-multi",
> -		  .in = "rcs reg 4F100 DEA6BEE6\n"
> -			"rcs reg 4F104 DEA7BEE7",
> -		  .out = "rcs: 11000001 0004f100 dea6bee6 11000001 0004f104 dea7bee7\n",
> +		  .in = { "reg 4F100 DEA6BEE6",
> +			  "reg 4F104 DEA7BEE7" },
> +		  .out = "11000001 0004f100 dea6bee6 11000001 0004f104 dea7bee7",
>  		  .reg = { 0x4f100, 0x4f104 },
>  		  .reg_val = { 0xdea6bee6, 0xdea7bee7 },
>  		},
>  	};
> +	char in[4096] = { };
> +	char out[4096] = { };
>  	char buf[4096] = { };
>  	char file[64] = { };
>  
> @@ -319,14 +322,19 @@ static void test_ctx_restore(int configfs_device_fd, const char *type)
>  		igt_audio_driver_unload(NULL);
>  		igt_kmod_unbind("xe", bus_addr);
>  

Add igt_require_f(engine, "explanation\n")

Overall looks good.

Regards,
Kamil

> +		for (int j = 0, off = 0; v->in[j]; j++)
> +			off += snprintf(in + off, sizeof(in) - off, "%s %s\n",
> +					engine, v->in[j]);
> +		snprintf(out, sizeof(out), "%s: %s\n", engine, v->out);
> +
>  		igt_info("Test %s\n", v->test);
> -		igt_debug("bb '%s'\n", v->in);
> -		igt_assert(igt_sysfs_set(configfs_device_fd, file, v->in));
> +		igt_debug("bb '%s'\n", in);
> +		igt_assert(igt_sysfs_set(configfs_device_fd, file, in));
>  
>  		igt_assert(igt_sysfs_read(configfs_device_fd, file, buf,
>  					  sizeof(buf) - 1));
> -		if (strcmp(v->out, buf)) {
> -			igt_debug("Expecting '%s' but found '%s'\n", v->out, buf);
> +		if (strcmp(out, buf)) {
> +			igt_debug("Expecting '%s' but found '%s'\n", out, buf);
>  			igt_fail(IGT_EXIT_FAILURE);
>  		}
>  
> @@ -364,12 +372,25 @@ int igt_main()
>  	int fd, configfs_fd, configfs_device_fd;
>  	uint32_t devid;
>  	bool is_vf_device;
> +	const char *engine = NULL;
>  
>  	igt_fixture() {
> +		struct drm_xe_engine_class_instance *hwe;
> +
>  		fd = drm_open_driver(DRIVER_XE);
>  		devid = intel_get_drm_devid(fd);
>  		is_vf_device = intel_is_vf_device(fd);
>  		set_bus_addr(fd);
> +
> +		xe_for_each_engine(fd, hwe) {
> +			if (hwe->engine_class == DRM_XE_ENGINE_CLASS_RENDER) {
> +				engine = "rcs";
> +				break;
> +			}
> +			if (!engine && hwe->engine_class == DRM_XE_ENGINE_CLASS_COMPUTE)
> +				engine = "ccs";
> +		}
> +
>  		drm_close_driver(fd);
>  
>  		configfs_fd = igt_configfs_open("xe");
> @@ -419,7 +440,7 @@ int igt_main()
>  	igt_subtest("ctx-restore-post-bb") {
>  		igt_skip_on_f(is_vf_device, "MMIO register readback not possible on VF\n");
>  		configfs_device_fd = create_device_configfs_group(configfs_fd);
> -		test_ctx_restore(configfs_device_fd, "post");
> +		test_ctx_restore(configfs_device_fd, "post", engine);
>  		close_configfs_group(configfs_fd, configfs_device_fd);
>  	}
>  
> @@ -435,7 +456,7 @@ int igt_main()
>  	igt_subtest("ctx-restore-mid-bb") {
>  		igt_skip_on_f(is_vf_device, "MMIO register readback not possible on VF\n");
>  		configfs_device_fd = create_device_configfs_group(configfs_fd);
> -		test_ctx_restore(configfs_device_fd, "mid");
> +		test_ctx_restore(configfs_device_fd, "mid", engine);
>  		close_configfs_group(configfs_fd, configfs_device_fd);
>  	}
>  
> -- 
> 2.50.1
> 
