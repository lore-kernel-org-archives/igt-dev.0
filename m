Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF406F8E4B4
	for <igt-dev@archiver.kernel.org>; Fri, 17 Apr 2026 07:21:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4ADB10E222;
	Fri, 17 Apr 2026 07:21:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GD9xkIf0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83D8D10E98A
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Apr 2026 07:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776410474; x=1807946474;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Oj87qjyOeGgyQWIWLlVb5v6pGLGQYXNGJFsqP5X1A64=;
 b=GD9xkIf0A62SdCdOwhJ4TskEdMkert9ps0jsTaPfcsvRRNrS/vJbP8Q/
 lNDZiWkEX0CoMjFOgUv3uNGmR6rnOqsLZFQ9sk5ajytvowOo7MoWnJPxb
 o/En3k/MEBLvBruJZw0YKH1OaFIHf3SvpPwcPP6D2+NKJ5g4C2aj1R1PC
 VNVF5xQAlAYoCaveFbsNBW1CjJQEqIIvA9vK7sCunUCVj1chKhIxUlEFW
 C+G8E6EOQ/vAcHXKl4lZWnJ2Rc2arsXCUHVROuh8RmqAOiPxqoLm+11aR
 HbXFaSNEdNBjaqJ0MUbUTxjChMB08VzHwT4ncSx1IKSq5C0ZDMEgQAfMi g==;
X-CSE-ConnectionGUID: K2S7tOnkRbGpt9a/rNfdAA==
X-CSE-MsgGUID: vp9q37C3QAqsUFKwBnECbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="87726270"
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; d="scan'208";a="87726270"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2026 00:21:13 -0700
X-CSE-ConnectionGUID: ipH+/0JqSPyvlBAbTkTjUw==
X-CSE-MsgGUID: nuJgrzZ8Q9i5GPKsyX/iqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; d="scan'208";a="232717144"
Received: from ajayshan-mobl1.ger.corp.intel.com (HELO [10.245.17.109])
 ([10.245.17.109])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2026 00:21:11 -0700
Message-ID: <17bda989-1bc2-43c6-b1db-bc301b85d0af@linux.intel.com>
Date: Fri, 17 Apr 2026 09:21:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/intel/xe_configfs: Skip ctx-restore subtests on
 platforms without RCS
To: Nitin Gote <nitin.r.gote@intel.com>, igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com
References: <20260416083004.2723418-2-nitin.r.gote@intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20260416083004.2723418-2-nitin.r.gote@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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


On 4/16/2026 10:30 AM, Nitin Gote wrote:
> The ctx-restore-post-bb and ctx-restore-mid-bb subtests inject a batch
> buffer via configfs using the "rcs" (render) engine class. However,
> platforms like CRI, PVC don't have render. The BB is stored via configfs
> but never injected into any engine's LRC, causing the subsequent register
> readback to fail.
>
> Fix by adding runtime detection of the render engine using
> xe_for_each_engine() and skip the ctx-restore subtests with
> igt_require_f(has_rcs) on platforms without a render engine instead
> of failing silently.
>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Fixes: b6abdc26e01b ("tests/intel/xe_configfs: Check ctx_restore_post_bb")
> Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
> ---
>   tests/intel/xe_configfs.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
>
> diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
> index 755524e7c..445f35431 100644
> --- a/tests/intel/xe_configfs.c
> +++ b/tests/intel/xe_configfs.c
> @@ -364,12 +364,22 @@ int igt_main()
>   	int fd, configfs_fd, configfs_device_fd;
>   	uint32_t devid;
>   	bool is_vf_device;
> +	bool has_rcs = false;
>   
>   	igt_fixture() {
> +		struct drm_xe_engine_class_instance *hwe;
> +
>   		fd = drm_open_driver(DRIVER_XE);
>   		devid = intel_get_drm_devid(fd);
>   		is_vf_device = intel_is_vf_device(fd);
>   		set_bus_addr(fd);
> +
> +		xe_for_each_engine(fd, hwe)
> +			if (hwe->engine_class == DRM_XE_ENGINE_CLASS_RENDER) {
> +				has_rcs = true;
> +				break;
> +			}
> +
Does it mean the feature is designed and used for RCS only ?
>   		drm_close_driver(fd);
>   
>   		configfs_fd = igt_configfs_open("xe");
> @@ -418,6 +428,7 @@ int igt_main()
>   	igt_describe("Validate ctx_restore_post_bb");
>   	igt_subtest("ctx-restore-post-bb") {
>   		igt_skip_on_f(is_vf_device, "MMIO register readback not possible on VF\n");
> +		igt_require_f(has_rcs, "Platform has no render engine\n");
>   		configfs_device_fd = create_device_configfs_group(configfs_fd);
>   		test_ctx_restore(configfs_device_fd, "post");
>   		close_configfs_group(configfs_fd, configfs_device_fd);
> @@ -434,6 +445,7 @@ int igt_main()
>   	igt_describe("Validate ctx_restore_mid_bb");
>   	igt_subtest("ctx-restore-mid-bb") {
>   		igt_skip_on_f(is_vf_device, "MMIO register readback not possible on VF\n");
> +		igt_require_f(has_rcs, "Platform has no render engine\n");
>   		configfs_device_fd = create_device_configfs_group(configfs_fd);
>   		test_ctx_restore(configfs_device_fd, "mid");
>   		close_configfs_group(configfs_fd, configfs_device_fd);
