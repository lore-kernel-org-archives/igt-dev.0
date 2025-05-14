Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85382C3ABCC
	for <igt-dev@archiver.kernel.org>; Wed, 14 May 2025 12:44:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40C1F10E62D;
	Wed, 14 May 2025 12:44:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mGph0RIv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 208F810E62D
 for <igt-dev@lists.freedesktop.org>; Wed, 14 May 2025 12:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747226683; x=1778762683;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=f1m1fqQa4P7qIObzUM1nGzfHWxZIhfmfxh5hJz9O4zI=;
 b=mGph0RIvAktDpU9/Jhc3XEYdYDdSCmDO4kg44mTPMz2vrl1BSxVasGBP
 Kec3tC0FwcheSXdJE+/9I8kGij1sZPLc2tNq6QlwrNTcdetBYrjrJii3v
 o2LYjFoVRxu5c6653O4/VN9KaB0jxXkfSr13+nfK5ucThy07LzunqfL62
 bqUmcTYs0IC83PyGay1QLzp2ahxohIxefldqx8uS+yeUoG8ROcHBCB0oc
 A+2H92MflH6extljrDBPxDMBrk8RiHj8YnxZlxYsiUTWOmAr8d5T3qyRM
 5L2Uwo0qFdAEdgTkF6k3K3eJeX3F5a6v1+NQpBzTgFPXzIAGS9ufK2HI8 g==;
X-CSE-ConnectionGUID: xXQ9qtOpQuS8uVU759AUew==
X-CSE-MsgGUID: p8TYfQ9wTbWashcw6zfmFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="49101329"
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; d="scan'208";a="49101329"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 05:44:41 -0700
X-CSE-ConnectionGUID: cStjSUf9Q9aevTZn6ohsWg==
X-CSE-MsgGUID: 3MGS5x4uQ6C7hSLkxmJSVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; d="scan'208";a="138079527"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost)
 ([10.245.245.97])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 05:44:38 -0700
Date: Wed, 14 May 2025 14:44:35 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Cc: igt-dev@lists.freedesktop.org, markyacoub@google.com, 
 seanpaul@google.com, carlos.santa@intel.com, sapna1.singh@intel.com
Subject: Re: [PATCH v4 05/15] tools: Include local igt_glib header for Android
Message-ID: <3flmg5ukt3sxg6kjyp6iuf765xbm5xzprakrrlexogkj65ttsd@2bcfp26qa6ba>
References: <20250507160148.53857-1-jeevaka.badrappan@intel.com>
 <20250507160148.53857-6-jeevaka.badrappan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250507160148.53857-6-jeevaka.badrappan@intel.com>
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

On Wed, May 07, 2025 at 04:01:38PM +0000, Jeevaka Prabu Badrappan wrote:
> Signed-off-by: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
> ---
>  tools/igt_dp_compliance.h | 4 ++++
>  tools/intel_pm_rpm.c      | 4 ++++
>  tools/lsgpu.c             | 4 ++++
>  3 files changed, 12 insertions(+)
> 
> diff --git a/tools/igt_dp_compliance.h b/tools/igt_dp_compliance.h
> index 5b1688039..0df44dad3 100644
> --- a/tools/igt_dp_compliance.h
> +++ b/tools/igt_dp_compliance.h
> @@ -28,7 +28,11 @@
>  #include <stdio.h>
>  #include <string.h>
>  #include <stdlib.h>
> +#ifndef ANDROID
>  #include <glib.h>
> +#else
> +#include "igt_glib.h"
> +#endif
>  
>  extern int drm_fd;
>  
> diff --git a/tools/intel_pm_rpm.c b/tools/intel_pm_rpm.c
> index 9622f0552..a2fe16d01 100644
> --- a/tools/intel_pm_rpm.c
> +++ b/tools/intel_pm_rpm.c
> @@ -24,7 +24,11 @@
>  
>  #include <errno.h>
>  #include <getopt.h>
> +#ifndef ANDROID
>  #include <glib.h>
> +#else
> +#include "igt_glib.h"
> +#endif

Address my comment from first patch, then:

Acked-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew
>  #include <stdio.h>
>  #include <stdlib.h>
>  #include <string.h>
> diff --git a/tools/lsgpu.c b/tools/lsgpu.c
> index e68390083..83ecaf953 100644
> --- a/tools/lsgpu.c
> +++ b/tools/lsgpu.c
> @@ -24,7 +24,11 @@
>  
>  #include <errno.h>
>  #include <fcntl.h>
> +#ifndef ANDROID
>  #include <glib.h>
> +#else
> +#include "igt_glib.h"
> +#endif
>  #include <libudev.h>
>  #include <string.h>
>  #include <signal.h>
> -- 
> 2.34.1
> 
