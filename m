Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F309BC25B75
	for <igt-dev@archiver.kernel.org>; Tue, 14 May 2024 10:52:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B8ED10E2D8;
	Tue, 14 May 2024 10:52:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="myoKdjuV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5441410E2BE;
 Tue, 14 May 2024 10:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715683968; x=1747219968;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=2S91ms5bKoD1uFIDT7WYLFHKyK8XFOWmvXFi2VHjuhI=;
 b=myoKdjuVYT8GetUPYYGn1t924YYRAna/wbXUg5aAww6ChwY5uGpRwh3f
 hMW+AluA/GjVzd56rka/0/YqPhhyFPI0V3BIG2nGRsHsbCXLxrT/jflq9
 ucTr1WFL1c1ZMpkfVxQraWToso5VgTB4GKQ6RcaLXtes/2o+vwy4p2YQX
 qj3Ss+oxuv7JWII+7oiGOOXEEJlbJA4hZeehnLQXQaM4OV3YEQVWk+0mL
 8kVpuphvXKYLbAI9ddfc8leJf6EbuFOBtKBnPWX4QOkR0qTz2/1XwlVxX
 6qUUccVwUOWX3jLduMbsgPAtjAtMFdIblONGrPZkIZ4/cpvJglTNJxch4 w==;
X-CSE-ConnectionGUID: k9/MMdkESxy9bjVsKarbcw==
X-CSE-MsgGUID: s8v6jU+BTwOKBwVPcXtHog==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="11480482"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="11480482"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 03:52:46 -0700
X-CSE-ConnectionGUID: ZG9a9H+1QLiknxC1uE+UFQ==
X-CSE-MsgGUID: 2W56SZRySs6BuZPfDpv5hA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="30691923"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2024 03:52:45 -0700
Date: Tue, 14 May 2024 12:52:26 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIENJLnhlRlVMTDogZmFpbHVy?= =?utf-8?Q?e?= for
 tests/intel/perf: move igt_require into subtests
Message-ID: <20240514105226.ev5fvhpkwwmp4oru@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20240513160638.137890-1-kamil.konieczny@linux.intel.com>
 <171564153330.2095830.1496887335395381348@8e613ede5ea5>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <171564153330.2095830.1496887335395381348@8e613ede5ea5>
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

Hi igt-dev,
On 2024-05-13 at 23:05:33 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel/perf: move igt_require into subtests
> URL   : https://patchwork.freedesktop.org/series/133561/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_7850_full -> XEIGTPW_11134_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_11134_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_11134_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (3 -> 1)
> ------------------------------
> 
>   ERROR: It appears as if the changes made in XEIGTPW_11134_full prevented too many machines from booting.
> 
>   Missing    (2): shard-adlp shard-lnl 

perf test cannot do that,

Regards,
Kamil

> 
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_11134_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 

...cut...

> 
> Build changes
> -------------
> 
>   * IGT: IGT_7850 -> IGTPW_11134
>   * Linux: xe-1280-3d00e04692d45ab076e9e493252361bb18373a0e -> xe-1281-5f823e6608065c42909c6a41adc7ff448cbfbfc5
> 
>   IGTPW_11134: 11134
>   IGT_7850: 7850
>   xe-1280-3d00e04692d45ab076e9e493252361bb18373a0e: 3d00e04692d45ab076e9e493252361bb18373a0e
>   xe-1281-5f823e6608065c42909c6a41adc7ff448cbfbfc5: 5f823e6608065c42909c6a41adc7ff448cbfbfc5
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11134/index.html
