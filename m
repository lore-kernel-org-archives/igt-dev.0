Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D22CCCD4F24
	for <igt-dev@archiver.kernel.org>; Wed, 13 May 2026 11:50:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8940810E318;
	Wed, 13 May 2026 11:50:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z48JSaQa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7AE110E318
 for <igt-dev@lists.freedesktop.org>; Wed, 13 May 2026 11:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778673006; x=1810209006;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=DFbAmvDs8bvLDteyRgrhuRxlM/lPNy3WKgjEkLipj1Y=;
 b=Z48JSaQaPwTCozD7jKV0uPu1ecNQo3XEVcvZ3BSEbSK9tWrCzS8p1N81
 vcUN6ZU1NvrcUojiiU9s9CcHc1/xvqPWoF/uVVCAijDfXX6zBo3sADocf
 hoNunqoyIngtfqlbHxb/pqDsLYKocLhgIwTzqcoEhMvM3S3nbcN7Hrz0w
 FqZZxnLMcNwy5Gx+DOXN3rXZQCIM4segNxLlEB9o7YnhlhE/W6AmrEoHn
 /usqq3onofXmIJzxgIRDfpql8v+EjcVyARSxH32nEraCtc4Q+mvXcEi7r
 DQUfe1Spg1GO8NkcXcGG5cVJmb8rW3DwJ6rUjT/HE7SrRgqpsRmuedDJR A==;
X-CSE-ConnectionGUID: pkwY1XosToqtJsZfNzHF3w==
X-CSE-MsgGUID: ztg59TuOQtyNWU9Fr1N6Aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="105057615"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; d="scan'208";a="105057615"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 04:50:05 -0700
X-CSE-ConnectionGUID: ptvPRpGbSsmB73ZlbIFxDg==
X-CSE-MsgGUID: vuZ17P+kTtSB7k+8J6x7FQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; d="scan'208";a="238169698"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 04:50:04 -0700
Date: Wed, 13 May 2026 13:49:44 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Nitin Gote <nitin.r.gote@intel.com>
Cc: igt-dev@lists.freedesktop.org, stuart.summers@intel.com,
 marcin.bernatowicz@linux.intel.com
Subject: Re: [PATCH] tests/intel/xe_configfs: Use available engine for
 ctx-restore subtests
Message-ID: <20260513114944.cldqo2huf65bixpt@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Nitin Gote <nitin.r.gote@intel.com>, igt-dev@lists.freedesktop.org,
 stuart.summers@intel.com, marcin.bernatowicz@linux.intel.com
References: <20260507055506.1966181-2-nitin.r.gote@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260507055506.1966181-2-nitin.r.gote@intel.com>
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
On 2026-05-07 at 11:25:07 +0530, Nitin Gote wrote:
> The ctx-restore-post-bb and ctx-restore-mid-bb subtests were hardcoded
> to use the "rcs" engine class. Platforms without a render engine (e.g.
> PVC, CRI) fail because the batch buffer is never injected into any
> engine's LRC, causing register readback to fail.
> 
> Fix by dynamically detecting an available engine in the fixture using
> xe_for_each_engine(). Prefer render ("rcs") when available, otherwise

Please make it shorter here, where you changed it is in a patch
itself, so s/in the fixture...//

Fix it by dynamically detecting an available engine, prefer render
("rcs") when available, otherwise

> fall back to compute ("ccs"). Every xe platform has at least one of
> these engine classes. Remove the hardcoded "rcs" from test data and
> add the detected engine name at runtime.
> 
> v3: Add break after the ccs for consistency, so the loop exits
>     as soon as a usable engine is picked regardless of class
>     iteration order (Stuart)
> v2: Add igt_require_f(engine, "explanation\n") (Kamil)
> 
> Fixes: b6abdc26e01b ("tests/intel/xe_configfs: Check ctx_restore_post_bb")
> Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
> ---
>  tests/intel/xe_configfs.c | 66 +++++++++++++++++++++++++++------------
>  1 file changed, 46 insertions(+), 20 deletions(-)
> 
> diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
> index 39762e030..a9f2b857a 100644
> --- a/tests/intel/xe_configfs.c
> +++ b/tests/intel/xe_configfs.c
> @@ -265,11 +265,12 @@ static void test_ctx_restore_invalid(int configfs_device_fd, const char *type)
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
> @@ -280,41 +281,46 @@ static void test_ctx_restore(int configfs_device_fd, const char *type)
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
> +	igt_require_f(engine,
> +		      "No render or compute engine available for ctx-restore test\n");

Hmm, here also it could be shorter, no need for repeating subtest
name, so imho one liner would be better:

	igt_require_f(engine, "No render nor compute engine available\n");

> +
>  	snprintf(file, sizeof(file), "ctx_restore_%s_bb", type);
>  
>  	for (size_t i = 0; i < ARRAY_SIZE(values); i++) {
> @@ -323,14 +329,19 @@ static void test_ctx_restore(int configfs_device_fd, const char *type)
>  		igt_audio_driver_unload(NULL);
>  		igt_kmod_unbind("xe", bus_addr);
>  
> +		for (int j = 0, off = 0; v->in[j]; j++)
> +			off += snprintf(in + off, sizeof(in) - off, "%s %s\n",
> +					engine, v->in[j]);

Add newline.

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
> @@ -368,12 +379,27 @@ int igt_main()
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

Add newline.

> +			if (!engine && hwe->engine_class == DRM_XE_ENGINE_CLASS_COMPUTE) {
> +				engine = "ccs";

I would prefer to not having break here but I did see Stuart
wanted it.

With above nits fixed LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> +				break;
> +			}
> +		}
> +
>  		drm_close_driver(fd);
>  
>  		configfs_fd = igt_configfs_open("xe");
> @@ -423,7 +449,7 @@ int igt_main()
>  	igt_subtest("ctx-restore-post-bb") {
>  		igt_skip_on_f(is_vf_device, "MMIO register readback not possible on VF\n");
>  		configfs_device_fd = create_device_configfs_group(configfs_fd);
> -		test_ctx_restore(configfs_device_fd, "post");
> +		test_ctx_restore(configfs_device_fd, "post", engine);
>  		close_configfs_group(configfs_fd, configfs_device_fd);
>  	}
>  
> @@ -439,7 +465,7 @@ int igt_main()
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
