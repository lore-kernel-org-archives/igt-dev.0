Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDC73C3ABC9
	for <igt-dev@archiver.kernel.org>; Thu, 15 May 2025 08:36:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86EA510E7C6;
	Thu, 15 May 2025 08:36:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zo/C05yl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 467BF10E7C6
 for <igt-dev@lists.freedesktop.org>; Thu, 15 May 2025 08:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747298183; x=1778834183;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=8tH4EV1LqoGqk1u/lcuQM6SlWOnVSwnyZSug4TJFboc=;
 b=Zo/C05ylV3wolBaSpb1ot4wqjJEpAvqPptIvW1VI7VSdM+Up/wChYiMt
 9LUqa44iObGRS2/rTY4GBo3EN0wmcmjc1IBtuOexGorDIATWilguYF9m0
 Xb7mKJqWSFbucNhI8aDQmkLbr6ZSAI434Sjic+OPIPbH+JX5Mq71WBIMg
 L6PziWwhqBZAKkC3cf2IZWsBfcJUAgiY3ehdowwleXd7WWjmjynNgsh3+
 kzksQ7J7YYjBjsG8OcIytshnnegAYXbHJ3vb5hZiqO1WzngBwwUHrcW+7
 YER1s7tiQ1IPKusZGkfyLiEcUyFCIM8BY5Y0pzT1TG1MKfVZWmhlIXQBA w==;
X-CSE-ConnectionGUID: sta/3hnxQX6nddNXML+2gg==
X-CSE-MsgGUID: ZXC1F9ScRgSFyFXCAy88dw==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="60233905"
X-IronPort-AV: E=Sophos;i="6.15,290,1739865600"; d="scan'208";a="60233905"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2025 01:36:23 -0700
X-CSE-ConnectionGUID: 50GBb2oKQCaElGSt4DwgfA==
X-CSE-MsgGUID: nexVkxPHQE+K+qEzoqbbdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,290,1739865600"; d="scan'208";a="175426097"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.87])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2025 01:36:21 -0700
Date: Thu, 15 May 2025 10:36:18 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Jan Sokolowski <jan.sokolowski@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v1 1/1] tests/intel/xe_render_copy: Skip tests on PVC
Message-ID: <imbnou2uahpw276ewjvighty2mz4x3p3bihrmlben4o4btsr52@izy5eroo52mf>
References: <20250513115252.9095-1-jan.sokolowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250513115252.9095-1-jan.sokolowski@intel.com>
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

On Tue, May 13, 2025 at 11:52:52AM +0000, Jan Sokolowski wrote:
> As PVC doesn't have render, these tests will fail by definition.
> 
> Skip render tests on PVC.
> 
> Signed-off-by: Jan Sokolowski <jan.sokolowski@intel.com>
> ---
>  tests/intel/xe_render_copy.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/tests/intel/xe_render_copy.c b/tests/intel/xe_render_copy.c
> index fadfd162c..c36520c92 100644
> --- a/tests/intel/xe_render_copy.c
> +++ b/tests/intel/xe_render_copy.c
> @@ -697,6 +697,10 @@ igt_main_args("dpiW:H:", NULL, help_str, opt_handler, NULL)
>  
>  	igt_fixture {
>  		xe = drm_open_driver(DRIVER_XE);
> +
> +		/* As PVC doesn't have render, we should skip here */
> +		igt_require(!IS_PONTEVECCHIO(xe_dev_id(xe)));

Please add is_render_supported() helper below render_supports_tiling().
Checking cmds_info->render_tilings is enough to determine if render is supported.

--
Zbigniew

> +
>  		bops = buf_ops_create(xe);
>  		srand(time(NULL));
>  		set = xe_get_memory_region_set(xe, DRM_XE_MEM_REGION_CLASS_SYSMEM);
> -- 
> 2.34.1
> 
