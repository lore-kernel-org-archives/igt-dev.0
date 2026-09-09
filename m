Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CAD8C79FB7
	for <igt-dev@archiver.kernel.org>; Wed,  9 Sep 2026 16:31:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F02FA10F223;
	Wed,  9 Sep 2026 16:31:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gyiCwq7t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9B1610F1F1
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Sep 2026 16:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788971425; x=1820507425;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=yGL372GxxMShi31dpxz0/mRhujAdszzpPi8pdFXcm4w=;
 b=gyiCwq7traTEQhtns1ZQU7aFnnTIBG8Ya6yaqDi4hdUbBMF+db1G6bvF
 /ThWFE4EPXzbxJw9qk3VCFg1ehteCBjw9UmUPayyMzjNGSifOl+rI23IF
 UT0GGNSSZ7eJ7vKDHWQmtucSQCy5v1XNPZw6DyiW4toI4XCXSDGQZjRVF
 EIuo5QbmDnPNhguR1xD5TUvTF6OmfeTxZem4M1tVoU+AqRicQLxlIwGte
 NHzEX/MKWWF9YzuNbtBeZvHkDXgzsfQk5zPN+uORSYs4GUE5jydrfeTb5
 3ljKXz02/axthF2usOAfhoZm6IbSEr8VBL44dg59YnxTo1sTE0kL0dZ8u w==;
X-CSE-ConnectionGUID: H1cfxMRxRr2hlmculyK9dw==
X-CSE-MsgGUID: 9NyJrx2QSY65/Ed+X1v4cA==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="106919799"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="106919799"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 09:30:18 -0700
X-CSE-ConnectionGUID: VCFLmdmSRZaGGsD43qLKHg==
X-CSE-MsgGUID: zH8G04YOQG2gjqNo3gZgBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="271352779"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 09:30:17 -0700
Date: Wed, 9 Sep 2026 18:30:15 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: igt-dev@lists.freedesktop.org, Julia Filipchuk <julia.filipchuk@intel.com>
Subject: Re: [PATCH i-g-t v2 1/3] tests/intel-ci: remove pxp from PTL
 blocklist.
Message-ID: <20260909163015.wk5tyng25urxm5tk@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 igt-dev@lists.freedesktop.org,
 Julia Filipchuk <julia.filipchuk@intel.com>
References: <20260909002705.431136-5-alan.previn.teres.alexis@intel.com>
 <20260909002705.431136-6-alan.previn.teres.alexis@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260909002705.431136-6-alan.previn.teres.alexis@intel.com>
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

Hi Alan,
On 2026-09-08 at 17:27:04 -0700, Alan Previn wrote:

only small nit about subject, it could be fixed at merge time
so need for resend, unless you want to send new version.

Please do not add dot at end, also all Intel CI changes
could start with shorter prefix 'intel-ci:', so here:

[PATCH i-g-t v2 1/3] intel-ci: remove pxp from PTL blocklist

With above fixed this is
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> We've added GSC FW with PXP support for PTL sometime back.
> However, it was still in the block list so let's remove this.
> 
> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> ---
>  tests/intel-ci/xe.ptl.core.blocklist.txt | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/tests/intel-ci/xe.ptl.core.blocklist.txt b/tests/intel-ci/xe.ptl.core.blocklist.txt
> index 362711406..85e0c3f3c 100644
> --- a/tests/intel-ci/xe.ptl.core.blocklist.txt
> +++ b/tests/intel-ci/xe.ptl.core.blocklist.txt
> @@ -82,11 +82,6 @@ igt@xe_oa@unprivileged-single-ctx-counters
>  igt@xe_pm_residency@gt-c6-freeze
>  igt@xe_pm_residency@toggle-gt-c6
>  ##################################################################
> -# Expected skip as PXP is not enabled for PTL upstream
> -##################################################################
> -igt@xe_pxp@.*
> -igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add
> -##################################################################
>  # survivability feature not applicable for PTL
>  ##################################################################
>  igt@.*survivability.*
> -- 
> 2.43.0
> 
