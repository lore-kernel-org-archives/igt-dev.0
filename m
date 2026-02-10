Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD3CEEB26F5
	for <igt-dev@archiver.kernel.org>; Tue, 10 Feb 2026 18:18:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FD7610E22B;
	Tue, 10 Feb 2026 18:18:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DvrN9dcm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 183DF10E22B
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Feb 2026 18:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770747527; x=1802283527;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=7dkXje5paapcSQk7NiIZZ2hLy11lHv6epa2pXmhdJmM=;
 b=DvrN9dcmV22KDHN6SwC605PC9Ua+8Pz4HZWwaGKW+MzhYQVl+WsSk3hd
 0DjxsNwxop3/EvFpSkK0vbdq69xbCa4tH5AKDHhmZY/hC12+QKSzvx0K/
 zo9XWhLXv4yytLpSN/3LKC1IqhsZ8qGTuprjvuGbonVeoBd5Kg+OveTY7
 YYDVo/4jVdNP5Ac05EIYMkgrdwkj6r4xE7JCXV6VS5DjFddqSuItGzl/3
 M+ytTiILeezx/FcCW+xyw9mSnc0tn3ygHonJ02/oytNvJoG86zPwdO+fA
 5LRIjdpefZLcHyFhk2HZOWQwSdok+6202LUQbOtRFJyuGysXAowRdzU+M w==;
X-CSE-ConnectionGUID: SwUnyJQMQHimtU2HwuSTIg==
X-CSE-MsgGUID: 2yPpHpSLTAKE4sw4M9lqXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="71871808"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="71871808"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 10:18:47 -0800
X-CSE-ConnectionGUID: jC8BV4oySEaKeyYGTPRMEw==
X-CSE-MsgGUID: YfPrgr0hSDCzikEltJ+QQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="211022782"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 10:18:45 -0800
Date: Tue, 10 Feb 2026 19:18:27 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 2/2] tools/intel_vbt_decode: sync intel_vbt_defs.h
 with commit 1b85a9b04681
Message-ID: <20260210181827.p67yzioejzuiutsj@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20260119111918.2686910-1-ankit.k.nautiyal@intel.com>
 <20260119111918.2686910-3-ankit.k.nautiyal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260119111918.2686910-3-ankit.k.nautiyal@intel.com>
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

Hi Ankit,
On 2026-01-19 at 16:49:18 +0530, Ankit Nautiyal wrote:
> Synchronize intel_vbt_defs.h with kernel commit:
> 1b85a9b04681 ("drm/i915/vbt: Add edp pipe joiner enable/disable bits")
> 
> Bspec:20142
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  tools/intel_vbt_decode.c | 4 ++++
>  tools/intel_vbt_defs.h   | 1 +
>  2 files changed, 5 insertions(+)
> 
> diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
> index 6f6f70dcee63..1cc863f59808 100644
> --- a/tools/intel_vbt_decode.c
> +++ b/tools/intel_vbt_decode.c
> @@ -2519,6 +2519,10 @@ static void dump_edp(struct context *context,
>  		if (context->bdb->version >= 251)
>  			printf("\t\teDP DSC disable: %s\n",
>  			       YESNO(panel_bool(edp->edp_dsc_disable, i)));
> +
> +		if (context->bdb->version >= 261)
> +			printf("\t\teDP Joiner Enable: %s\n",
> +			       YESNO(panel_bool(edp->joiner_enable, i)));
>  	}
>  }
>  
> diff --git a/tools/intel_vbt_defs.h b/tools/intel_vbt_defs.h
> index 932305df2320..acdd973bd006 100644
> --- a/tools/intel_vbt_defs.h
> +++ b/tools/intel_vbt_defs.h
> @@ -1108,6 +1108,7 @@ struct bdb_edp {
>  	u16 edp_dsc_disable;					/* 251+ */
>  	u16 t6_delay_support;					/* 260+ */
>  	u16 link_idle_time[16];					/* 260+ */
> +	u16 joiner_enable;					/* 261+ */
>  } __packed;
>  
>  /*
> -- 
> 2.45.2
> 
