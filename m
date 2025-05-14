Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEA77C3ABD8
	for <igt-dev@archiver.kernel.org>; Wed, 14 May 2025 12:53:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72E7610E631;
	Wed, 14 May 2025 12:53:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bDi5YYpd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D5CE10E631
 for <igt-dev@lists.freedesktop.org>; Wed, 14 May 2025 12:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747227208; x=1778763208;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=vLnL2Yj3d/DV9eDPYpOSuBlFu7xAocyF13Q+sKmHGBI=;
 b=bDi5YYpde0oblalSLvn9fhGSvDCy/0LcZUUU63Ceo41zwyQicbgxEpwK
 OJYnP/olXE4Yiyu6asTvrRySbQShDyo2AUgq8G0bruk2k4OpY/DRikJn5
 1A079cy7PNSFDLX9tL4AEKqjNJAbBML88BGg0sK/yoN7IQaZI3H6lbE9P
 /+56DvHK4Ccw+/6Ghxis3Zcf6xg00sl8X96j1DWTyG0itOGGcCjPiD7kb
 1cY6AxINLbLnK1ZkXKTCTM4eXtoM6XEP2d9TMyZJAthNBem30RE5TtPKE
 z8O8S2QjzUxvzDDaYSrIma0zhUCiXBk84XZ94VtaO2Tgy2I6zO04g+GZp A==;
X-CSE-ConnectionGUID: 820lRbFETNSVAZCJzzG/XA==
X-CSE-MsgGUID: fqmOn+oFT5at8sRGanvw4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="52925379"
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; d="scan'208";a="52925379"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 05:53:27 -0700
X-CSE-ConnectionGUID: dH6V4NyKSa+Z4ARKq0MCmQ==
X-CSE-MsgGUID: iEVwcP3oSrO5rWJbtcRGTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; d="scan'208";a="137738469"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost)
 ([10.245.245.97])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 05:53:25 -0700
Date: Wed, 14 May 2025 14:53:21 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Cc: igt-dev@lists.freedesktop.org, markyacoub@google.com, 
 seanpaul@google.com, carlos.santa@intel.com, sapna1.singh@intel.com
Subject: Re: [PATCH v4 10/15] lib/igt_core: Conditionally define __noreturn
 for non-Android platforms
Message-ID: <sn6l3sduxzl7imyezp5k6maivaevxepb6fbxq73bf2utngxrwf@nufzrtuulxt7>
References: <20250507160148.53857-1-jeevaka.badrappan@intel.com>
 <20250507160148.53857-11-jeevaka.badrappan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250507160148.53857-11-jeevaka.badrappan@intel.com>
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

On Wed, May 07, 2025 at 04:01:43PM +0000, Jeevaka Prabu Badrappan wrote:
> Ensure __noreturn is defined only if it is not already defined,
> addressing compatibility with Android where __noreturn is predefined.
> 
> Signed-off-by: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
> ---
>  lib/igt_core.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/lib/igt_core.h b/lib/igt_core.h
> index 45170e215..2db579423 100644
> --- a/lib/igt_core.h
> +++ b/lib/igt_core.h
> @@ -86,7 +86,9 @@
>  #define igt_assume(e) BUILD_BUG_ON_INVALID(e)
>  #endif
>  
> +#ifndef __noreturn
>  #define __noreturn __attribute__((noreturn))
> +#endif

Acked-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

>  #define __maybe_unused __attribute__((unused))
>  
>  extern const char* __igt_test_description __attribute__((weak));
> -- 
> 2.34.1
> 
