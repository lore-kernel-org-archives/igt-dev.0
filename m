Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 720FCC531DC
	for <igt-dev@archiver.kernel.org>; Fri, 23 Aug 2024 10:23:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E4F010E482;
	Fri, 23 Aug 2024 10:23:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WIIHhAWR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00A9610E482
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Aug 2024 10:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724408587; x=1755944587;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=dXO9XB9IXAMYR98vjoU+Gof6cKcbz+JOanb6Bceb1Ws=;
 b=WIIHhAWRC7G19Px3ep8IR8jYlbvImmURjfQSpG6aWI+CmOMyc+GfLKi2
 Uk9HxL1SpOgOdqBIETbWe4vtged23FASWVNpZiQWy7QXJO7Jw+a4NCRKh
 8+sINWSF/f782bVWPGEd8lW9EB28Z8rrNVRqd7dELoZtjuFkgaHgxwEgO
 wCryhAEvjH6u1oNKYb/SVc4DQbNX0na98MfX4kJkL2zX0njHk3O2f0Gb4
 FPLg1ayS4F6oHDDX5dAheD8yS1CQu7i9KSZea8u+RUSeolR2qswpV4qGZ
 BB2AHzWiY15n3BmRA2GQmArVSnWHfSxXaEI97CCknJzD+hPHJB4P26Yk2 A==;
X-CSE-ConnectionGUID: AyypX3QgRiWxwjh0PDFQlQ==
X-CSE-MsgGUID: avFtGKCZRnWMopJaWrRrdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="33532996"
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; d="scan'208";a="33532996"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 03:23:06 -0700
X-CSE-ConnectionGUID: T0jsc8aCTnuDmZaHY9bphg==
X-CSE-MsgGUID: p5h7KV2FSge+97SYtnQYVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; d="scan'208";a="62276105"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2024 03:23:05 -0700
Date: Fri, 23 Aug 2024 12:23:02 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Subject: Re: [PATCH i-g-t] lib/igt: Fix double include statement
Message-ID: <20240823102302.5pxgsvdrvcsxauku@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>
References: <20240812154139.54404-3-krzysztof.niemiec@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240812154139.54404-3-krzysztof.niemiec@intel.com>
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

Hi Krzysztof,
On 2024-08-12 at 17:41:41 +0200, Krzysztof Niemiec wrote:
> igt_core.h is included two times in the igt.h header. Fix the header so
> that isn't the case anymore.
> 
> Signed-off-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>

Thank you for spotting this, I merged your patch.

Regards,
Kamil

> ---
>  lib/igt.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/lib/igt.h b/lib/igt.h
> index 7af3d10cb..58c39e098 100644
> --- a/lib/igt.h
> +++ b/lib/igt.h
> @@ -28,7 +28,6 @@
>  #include "i915_3d.h"
>  #include "igt_aux.h"
>  #include "igt_core.h"
> -#include "igt_core.h"
>  #include "igt_debugfs.h"
>  #include "igt_draw.h"
>  #include "igt_dummyload.h"
> -- 
> 2.34.1
> 
