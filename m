Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65B5AC04FFE
	for <igt-dev@archiver.kernel.org>; Mon, 20 May 2024 08:22:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4AB810E4DB;
	Mon, 20 May 2024 08:22:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cCe7cczJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13E3210E4CC
 for <igt-dev@lists.freedesktop.org>; Mon, 20 May 2024 08:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716193357; x=1747729357;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=keYVwiIE6tsGtp7ggPJS/3S/3ECCb2PL6N2UZKAjZW4=;
 b=cCe7cczJYandPo91AjMwxUtTARoFekwPuJiAG5+45ZLnKb6kaXiOW7DM
 Nko33wlQmjowzao+ReOe0nEdwF8F/Jg6DucTyIyfqCIhKM/sEvBHEr4lf
 m7L+qILf1PV+MTrznBkbfDorG0/VDrr2B+blIxO9CsTv3cgaebOM250Ew
 jz34T+uSV3Erdiwa6Jll5PGdp70sDJKERkjIHV6MP5KPaYTLZqRunp0a0
 xeJsPLsAgK6Oa3JI32dxwdHhTTk4ZIpE4BUCegQc/82wrNo/5JaRiuMko
 XwidulZ1LDqAyxc1/ztZHEBCyIBt+Z5hNEgi53lyw4s1UZkJkd0nGjlEk g==;
X-CSE-ConnectionGUID: lqn9a/bYTmWHzJPHQZuU0g==
X-CSE-MsgGUID: jnrvCI4oRKaHp0HTwwl/aw==
X-IronPort-AV: E=McAfee;i="6600,9927,11077"; a="12477670"
X-IronPort-AV: E=Sophos;i="6.08,174,1712646000"; d="scan'208";a="12477670"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2024 01:22:36 -0700
X-CSE-ConnectionGUID: pTEkU1f9T4qRrQpzul93lQ==
X-CSE-MsgGUID: v3DLJULqQYO5U2t9wzPo3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,174,1712646000"; d="scan'208";a="33025913"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2024 01:22:35 -0700
Date: Mon, 20 May 2024 10:22:17 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Mark Yacoub <markyacoub@chromium.org>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: Re: [PATCH i-g-t] tests/kms: Move kms_plane_scaling to intel directory
Message-ID: <20240520082217.agl3fz6d6d25jyhu@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Mark Yacoub <markyacoub@chromium.org>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
References: <20240520064150.2519210-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240520064150.2519210-1-bhanuprakash.modem@intel.com>
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

Hi Bhanuprakash,
On 2024-05-20 at 12:11:50 +0530, Bhanuprakash Modem wrote:
> As kms_plane_scaling is limited to run on Intel hw only,
> move this test to tests/intel directory.
> 
> Cc: Mark Yacoub <markyacoub@chromium.org>
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/{ => intel}/kms_plane_scaling.c | 6 ++----
>  tests/meson.build                     | 2 +-
>  2 files changed, 3 insertions(+), 5 deletions(-)
>  rename tests/{ => intel}/kms_plane_scaling.c (99%)
> 
> diff --git a/tests/kms_plane_scaling.c b/tests/intel/kms_plane_scaling.c
> similarity index 99%
> rename from tests/kms_plane_scaling.c
> rename to tests/intel/kms_plane_scaling.c
> index acb4a1da1..620dba911 100644
> --- a/tests/kms_plane_scaling.c
> +++ b/tests/intel/kms_plane_scaling.c
> @@ -1291,10 +1291,9 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>  	enum pipe pipe;
>  
>  	igt_fixture {
> -		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
> +		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
>  		igt_display_require(&data.display, data.drm_fd);
> -		data.devid = is_intel_device(data.drm_fd) ?
> -			intel_get_drm_devid(data.drm_fd) : 0;
> +		data.devid = intel_get_drm_devid(data.drm_fd);
>  		igt_require(data.display.is_atomic);
>  	}
>  
> @@ -1464,7 +1463,6 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>  		for (int index = 0; index < ARRAY_SIZE(intel_paramtests); index++) {
>  			igt_describe("Test for validating max source size.");
>  			igt_subtest_with_dynamic(intel_paramtests[index].testname) {
> -				igt_require_intel(data.drm_fd);
>  				for_each_pipe(&data.display, pipe) {
>  					for_each_valid_output_on_pipe(&data.display, pipe, output) {
>  						drmModeModeInfo *mode = NULL;
> diff --git a/tests/meson.build b/tests/meson.build
> index 758ae090c..c53e3bc3c 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -47,7 +47,6 @@ test_progs = [
>  	'kms_plane_cursor',
>  	'kms_plane_lowres',
>  	'kms_plane_multiple',
> -	'kms_plane_scaling',
>  	'kms_prime',
>  	'kms_prop_blob',
>  	'kms_properties',
> @@ -262,6 +261,7 @@ intel_kms_progs = [
>  	'kms_legacy_colorkey',
>  	'kms_mmap_write_crc',
>  	'kms_pipe_b_c_ivb',
> +	'kms_plane_scaling',
>  	'kms_pm_backlight',
>  	'kms_pm_dc',
>  	'kms_pm_lpsp',
> -- 
> 2.43.2
> 
