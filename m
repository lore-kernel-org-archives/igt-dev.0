Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6675C44539
	for <igt-dev@archiver.kernel.org>; Wed, 22 Jul 2026 10:00:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86B7F10E456;
	Wed, 22 Jul 2026 10:00:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BIk5k08F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E24910E443
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Jul 2026 09:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784714377; x=1816250377;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=LnU1c812cKWVkjqruB7cdR3n50+x0fb/QPBVAwbcgw0=;
 b=BIk5k08FvB9WDlk3H49qbgqVkukfZnoXR5H6kIcTG5re7Se7y0Fc+dnk
 +OtV9PHIjgBFd0dtyOD+grZp39LYIEXkC/MhZh5x/yczfBsX1n59rwPmU
 upWULTNCNxWDao7L1vpjPaMuXa9AuML91hVGn21Wo/3l+Ac+CA4p2t/eD
 Tlt29BGzTmXmVQ3SQXN8akmClVkn/vfxWDFA3vP/8rSwxfH7xHKSUFZZc
 YMCH+LYWv8iX27TVnOv1ZHxbIEppVyOLhr9gF2I2ow08y89Rt3oZE+/Au
 63JcB1vczrJOw3IBPFl1InQLMptQX3Xuz/DLIn6JZdK0o7dRYFeLy1vpV g==;
X-CSE-ConnectionGUID: +jDektVeSoGfsqWq+CG1Pw==
X-CSE-MsgGUID: fNAalUsbT/iuZ4CH/BOb/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="110888846"
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; d="scan'208";a="110888846"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2026 02:59:37 -0700
X-CSE-ConnectionGUID: ihsMrSgBSuClPpp23MJaPA==
X-CSE-MsgGUID: AL20Nmj5RcWBY7P6PMK/2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; d="scan'208";a="262982575"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2026 02:59:35 -0700
Date: Wed, 22 Jul 2026 11:59:20 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Dominik Karol =?utf-8?Q?Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>
Subject: Re: [PATCH i-g-t 1/1] meson: Remove Xe EUdebug
Message-ID: <20260722095920.xoll3dfkdr6z3cet@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Dominik Karol =?utf-8?Q?Pi=C4=85tkowski?= <dominik.karol.piatkowski@intel.com>,
 igt-dev@lists.freedesktop.org,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>
References: <20260722072959.12790-1-dominik.karol.piatkowski@intel.com>
 <20260722072959.12790-2-dominik.karol.piatkowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260722072959.12790-2-dominik.karol.piatkowski@intel.com>
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

Hi Dominik,
On 2026-07-22 at 09:29:59 +0200, Dominik Karol Piątkowski wrote:
> Remove Xe EUdebug from meson and meson_options, as there are no EUdebug
> files present.
> 

+cc Ryszard Knop <ryszard.knop@intel.com>



Regards,
Kamil

> Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
> Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> ---
>  meson.build       | 2 --
>  meson_options.txt | 5 -----
>  2 files changed, 7 deletions(-)
> 
> diff --git a/meson.build b/meson.build
> index e09122a09..cb6dea30e 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -90,12 +90,10 @@ build_chamelium = get_option('chamelium')
>  build_docs = get_option('docs')
>  build_tests = not get_option('tests').disabled()
>  build_xe = not get_option('xe_driver').disabled()
> -build_xe_eudebug = get_option('xe_eudebug').enabled()
>  build_vmtb = get_option('vmtb').enabled()
>  with_libdrm = get_option('libdrm_drivers')
>  
>  build_info = ['Build type: ' + get_option('buildtype')]
> -build_info += 'Build Xe EU debugger test framework: @0@'.format(build_xe_eudebug)
>  build_info += 'Build VM Test Bench: @0@'.format(build_vmtb)
>  
>  inc = include_directories('include', 'include/drm-uapi', 'include/drm-uapi-experimental', 'include/linux-uapi', 'lib', 'lib/stubs/syscalls', '.')
> diff --git a/meson_options.txt b/meson_options.txt
> index e23402b36..fc824dda9 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -42,11 +42,6 @@ option('xe_driver',
>         value : 'enabled',
>         description : 'Build tests for Xe driver')
>  
> -option('xe_eudebug',
> -       type : 'feature',
> -       value : 'disabled',
> -       description : 'Build library and tests for Xe EU debugger')
> -
>  option('vmtb',
>         type : 'feature',
>         value : 'disabled',
> -- 
> 2.34.1
> 
