Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CED1C87FCB
	for <igt-dev@archiver.kernel.org>; Tue, 12 Aug 2025 15:33:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF99810E03C;
	Tue, 12 Aug 2025 15:33:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CGqo9ph+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C215810E155
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Aug 2025 15:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755012810; x=1786548810;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=N//2MbQd6WiRx2E5YlKwl1G9wVKq9F5HOoF3wUjLyic=;
 b=CGqo9ph+0RlRRgzHEd/1iPD9Ukug6i0cKr0MiKCO24hMGRYuoQJr1KhD
 ATGEuvxWWPy/lhug7tk1CNfGnL1yadtBYcO6BCFE+rM0YRr9cjW7GwgfT
 pnBjbNqJGV0kAYp5vVD4Op2/VhXyoOQQ5zNcRGlDXlUmflSngr1s72ayT
 2TFjTl0XmXC0j3haC8fLB+GaF61VeK3Uzn1CYbyOGfRD1aTMMlUz1O+ck
 hg+RLMs/0kSU7JhSuNjBdC5/hEQm0CxGVLGKXrRojefJ29yZTJ8tzm0UK
 73TATSfFC5fAtO2Lqw8Vb4hI80WZoOi4Cp5CbNsZQrl1KFYMK/TP56Nx4 A==;
X-CSE-ConnectionGUID: /xY70R58TceJdOxnyNXlxg==
X-CSE-MsgGUID: +YoMSRo1TY+Rnvh+o2anIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="57374036"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; d="scan'208";a="57374036"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2025 08:33:30 -0700
X-CSE-ConnectionGUID: OG/0RRCTRByey+wRQLGfMg==
X-CSE-MsgGUID: J2ya0pCRSuGoR/OyqcgIDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; d="scan'208";a="165860588"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2025 08:33:27 -0700
Date: Tue, 12 Aug 2025 17:33:09 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: =?utf-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Cc: igt-dev@lists.freedesktop.org, louis.chauvet@bootlin.com,
 zbigniew.kempczynski@intel.com, karthik.b.s@intel.com,
 Jim Shargo <jshargo@chromium.org>, Marius Vlad <marius.vlad@collabora.com>
Subject: Re: [PATCH i-g-t v4 01/41] lib/drmtest: Add VKMS as a known driver
 type
Message-ID: <20250812153309.hzybgmeztq6tlvt7@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 =?utf-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 igt-dev@lists.freedesktop.org, louis.chauvet@bootlin.com,
 zbigniew.kempczynski@intel.com, karthik.b.s@intel.com,
 Jim Shargo <jshargo@chromium.org>,
 Marius Vlad <marius.vlad@collabora.com>
References: <20250807074550.6543-1-jose.exposito89@gmail.com>
 <20250807074550.6543-2-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250807074550.6543-2-jose.exposito89@gmail.com>
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

Hi José,
On 2025-08-07 at 09:45:10 +0200, José Expósito wrote:
> As we are going to add VKMS specific tests, allow to check if it is
> available.
> 
> Co-developed-by: Jim Shargo <jshargo@chromium.org>
> Signed-off-by: Jim Shargo <jshargo@chromium.org>
> Co-developed-by: Marius Vlad <marius.vlad@collabora.com>
> Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
> Signed-off-by: José Expósito <jose.exposito89@gmail.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  lib/drmtest.c | 21 +++++++++++++++++++++
>  lib/drmtest.h |  6 +++++-
>  2 files changed, 26 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/drmtest.c b/lib/drmtest.c
> index 436b6de78..943ea8dbe 100644
> --- a/lib/drmtest.c
> +++ b/lib/drmtest.c
> @@ -223,6 +223,7 @@ static const struct module {
>  	{ DRIVER_V3D, "v3d" },
>  	{ DRIVER_VC4, "vc4" },
>  	{ DRIVER_VGEM, "vgem" },
> +	{ DRIVER_VKMS, "vkms" },
>  	{ DRIVER_VMWGFX, "vmwgfx" },
>  	{ DRIVER_XE, "xe" },
>  	{}
> @@ -295,6 +296,8 @@ static const char *chipset_to_str(int chipset)
>  		return "xe";
>  	case DRIVER_VMWGFX:
>  		return "vmwgfx";
> +	case DRIVER_VKMS:
> +		return "vkms";
>  	case DRIVER_ANY:
>  		return "any";
>  	default:
> @@ -971,3 +974,21 @@ void igt_require_xe(int fd)
>  {
>  	igt_require(is_xe_device(fd));
>  }
> +
> +void igt_require_vkms(void)
> +{
> +	/*
> +	 * Since VKMS can create and destroy virtual drivers at will, instead
> +	 * look to make sure the driver is installed.
> +	 */
> +	struct stat s = {};
> +	int ret;
> +	const char *vkms_module_dir = "/sys/module/vkms";
> +
> +	ret = stat(vkms_module_dir, &s);
> +
> +	igt_require_f(ret == 0, "VKMS stat of %s returned %d (%s)\n",
> +		      vkms_module_dir, ret, strerror(ret));
> +	igt_require_f(S_ISDIR(s.st_mode),
> +		      "VKMS stat of %s was not a directory\n", vkms_module_dir);
> +}
> diff --git a/lib/drmtest.h b/lib/drmtest.h
> index 27e5a18e2..a9542dde2 100644
> --- a/lib/drmtest.h
> +++ b/lib/drmtest.h
> @@ -55,14 +55,17 @@ int __get_drm_device_name(int fd, char *name, int name_size);
>  #define DRIVER_MSM	(1 << 6)
>  #define DRIVER_XE	(1 << 7)
>  #define DRIVER_VMWGFX   (1 << 8)
> +#define DRIVER_VKMS	(1 << 9)
>  
>  /*
>   * Exclude DRVER_VGEM from DRIVER_ANY since if you run on a system
>   * with vgem as well as a supported driver, you can end up with a
>   * near-100% skip rate if you don't explicitly specify the device,
>   * depending on device-load ordering.
> + *
> + * Exclude VKMS to prefer hardware drivers.
>   */
> -#define DRIVER_ANY 	~(DRIVER_VGEM)
> +#define DRIVER_ANY	~(DRIVER_VGEM | DRIVER_VKMS)
>  
>  /*
>   * Compile friendly enum for i915/xe.
> @@ -135,6 +138,7 @@ void igt_require_i915(int fd);
>  void igt_require_nouveau(int fd);
>  void igt_require_vc4(int fd);
>  void igt_require_xe(int fd);
> +void igt_require_vkms(void);
>  
>  bool is_amdgpu_device(int fd);
>  bool is_i915_device(int fd);
> -- 
> 2.50.1
> 
