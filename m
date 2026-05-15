Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6138DCD4F25
	for <igt-dev@archiver.kernel.org>; Fri, 15 May 2026 15:09:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8324310F562;
	Fri, 15 May 2026 15:09:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PFfDTpli";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B70410F565
 for <igt-dev@lists.freedesktop.org>; Fri, 15 May 2026 15:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778857724; x=1810393724;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=wzawTO4bvyeHLTmouaabSv4jnfaIS4T4itHRJux+7Fo=;
 b=PFfDTpli6o22bHaem29bK/Cky+Sz7ooTlKjUUnsR95MZJBZItgE0XTjp
 Vh6pmvQhyMtCCzpZ+9jVsjZ0TvuCJDhuxT8jZk+ILg+L7GcyQAaULaGGK
 jxZlpUuPLliKm6g2hUGc4TgTEMSJaGtzj3ruhtx50WFDPYorvcadt0Jtf
 bPkiskwEcsqc2TLYIJyHQQwULAykf8TUag1rKlumO0tf+J+5O0ekqKgyu
 cjP91hteSJpNIAiNwe6mqMehxfmltpZ1aTNiGQQLJ/Rq4vxDmAthd5eKb
 gnjpZzNiaJOzCScv/3yj3RHrrkigtgI3++ybi0cWKSo4uf6M7BhvxYK57 Q==;
X-CSE-ConnectionGUID: HUIsk0HdTUawCWV0dfmeAw==
X-CSE-MsgGUID: UnTxRDB8QQK9mhY78jhPhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="79983855"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; d="scan'208";a="79983855"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2026 08:08:43 -0700
X-CSE-ConnectionGUID: oQK9CRbLS6K61943r8czVA==
X-CSE-MsgGUID: nwqWaC5lRz61JRhBca7E0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; d="scan'208";a="232318566"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 08:08:41 -0700
Date: Fri, 15 May 2026 17:08:39 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Lee Shawn C <shawn.c.lee@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [i-g-t,v6, 0/2] *** SUBJECT HERE ***
Message-ID: <20260515150839.3d7cwrlt7ro6s3by@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Lee Shawn C <shawn.c.lee@intel.com>, igt-dev@lists.freedesktop.org
References: <shawn.c.lee@intel.com>
 <20260515063251.2239524-1-shawn.c.lee@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260515063251.2239524-1-shawn.c.lee@intel.com>
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

Hi Lee,
On 2026-05-15 at 06:32:49 +0000, Lee Shawn C wrote:
> *** BLURB HERE ***
> 

Please replace '***...' lines with actual content, not now
(no need for resend this) but next time in future.

Regards,
Kamil

> Lee Shawn C (2):
>   Revert "tests/kms_vrr: Start virtual RR test above midpoint to avoid
>     mode fallback"
>   tests/kms_vrr: add support for full range refresh rate testing
> 
>  tests/kms_vrr.c | 135 ++++++++++++++++++++++++++++++++++--------------
>  1 file changed, 95 insertions(+), 40 deletions(-)
> 
> -- 
> 2.34.1
> 
