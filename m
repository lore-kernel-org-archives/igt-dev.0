Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AFA0CD5BD0
	for <igt-dev@archiver.kernel.org>; Tue, 26 May 2026 09:26:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CB3710E179;
	Tue, 26 May 2026 09:26:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j8fAA1BU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA59510E179
 for <igt-dev@lists.freedesktop.org>; Tue, 26 May 2026 09:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779787544; x=1811323544;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=tY+3H7YVRM4Ra5v+5lRHAuSxhrtBlJpA4mD+0OfyMtA=;
 b=j8fAA1BUrDp8HL2uSdIRtCh+BCifOmjTcaL12GBP/Q0UWzMKT5i/lO/w
 R6dxOGkQqiT3AaBWZYxXkHMQpmWPQX+4PmiosFPEpEcOdmJmch7t6+0x6
 Jiws7kCLQLzHqQw+X/sxwTKaE2Zv/2jgjdBOl7zUFgAu/NpB7in6C7/y1
 dpkahTl52utKIk1u74AiuvhSy+6jz0wokrUpPr9EiuL5c3+EI3M2AcJU7
 x5/zcwCZ0UDYqwipWgkWjCeaSSg1hCtCweTGwWeIoROczDPS326RI40qa
 3rH2S8/BOgZ5ayZwTI0jM0W49G0IZ8i7gE20MikG4lZgq0gonowWnm3at w==;
X-CSE-ConnectionGUID: ATgIlWifSoqhK/V4LWODGA==
X-CSE-MsgGUID: E3ZETCXFRP6nPE+2CvS7jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="80629198"
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; d="scan'208";a="80629198"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 02:25:44 -0700
X-CSE-ConnectionGUID: yg4rQ3LsQ0Wh8/42KsfwUg==
X-CSE-MsgGUID: pzUEOzpOQhOYPIaFENLU2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; d="scan'208";a="265723823"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 02:25:43 -0700
Date: Tue, 26 May 2026 11:25:19 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH] lib/meson.build: add rebuild_iga64 target
Message-ID: <20260526092519.srfr7okxaay65lze@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 igt-dev@lists.freedesktop.org,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
References: <20260526-rebuild_iga64-v1-1-531eff7e3e24@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260526-rebuild_iga64-v1-1-531eff7e3e24@intel.com>
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

Hi Andrzej,
On 2026-05-26 at 10:23:38 +0200, Andrzej Hajda wrote:
> In some circumstances rebuilding all GPU asms is desirable.
> There is already a way to do it, but it is complicated.
> rebuild_iga64 virtual target encapsulates it in single command:
> $ ninja rebuild_iga64
> 
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>

LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  lib/meson.build | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/lib/meson.build b/lib/meson.build
> index ce2c329fbbcd..a8d6566aecca 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -322,6 +322,9 @@ endforeach
>  
>  lib_intermediates += static_library('iga64_gpu_codes', iga64_codes_targets)
>  
> +run_target('rebuild_iga64',
> +    command : [ 'bash', '-c', 'ninja -t clean lib/libiga64_asms.a && FORCE_IGA64_REBUILD=1 ninja lib/libiga64_gpu_codes.a' ])
> +
>  lib_igt_build = shared_library('igt',
>      ['dummy.c'],
>      link_whole: lib_intermediates,
> 
> ---
> base-commit: d88ebc53b2e92095f8717f5bacd567becf7f0c1d
> change-id: 20260526-rebuild_iga64-c835ca3b8485
> 
> Best regards,
> --  
> Andrzej Hajda <andrzej.hajda@intel.com>
> 
