Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB9DBCA5FC5
	for <igt-dev@archiver.kernel.org>; Wed, 30 Sep 2026 14:25:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A79D10F422;
	Wed, 30 Sep 2026 14:25:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QugcuIdS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D33D10E25C;
 Wed, 30 Sep 2026 14:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790778283; x=1822314283;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=FI+XSP/+NDEIdHow2Eule78NEVQ3Fr4B+zELVHZgUmk=;
 b=QugcuIdS0hrWlp1Zojqt/9uVI6UMNBgrBz5c7sc2hbRpZKTMooRNrxRr
 93tm5EXe4Ry9vdK5zT8c39O8gi5o51E0nm1kF3um13rIfV8OIFJ3ms4S/
 rB8WqopfnHsjMTbeNZ0mIURLTzxBdfeY28j5KEwDWTDRVRNxmMlBGpUKk
 vRmrPQMFt7OChEt34gmAavV7VsEVBDOWkdFkTVqVDKogAdcVpzqJem52N
 T/M5UgL5idY4jGKz49bFUtwknG4X9KI4j/WpYSLhrrIx7CXsn/BPAqBGy
 P3G5cqXps+UBKN4bUU50e9OEcUfvz4ugVUDBeOXIw4xfSvKO8p83ng9r/ A==;
X-CSE-ConnectionGUID: PmjykIYARm+gkTC4B9/nXw==
X-CSE-MsgGUID: nmgPnT5FTqSSmaR+28QFGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="102191012"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208";a="102191012"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 07:24:43 -0700
X-CSE-ConnectionGUID: nuExSnECS12KHsSM7jVqiQ==
X-CSE-MsgGUID: XTZJm4oFRy6fr1oYRHxGww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208";a="275253042"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 07:24:42 -0700
Date: Wed, 30 Sep 2026 16:24:39 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Alex Hung <alex.hung@amd.com>, I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkJBVDogZmFpbHVy?= =?utf-8?Q?e?= for
 Preserve const qualifiers in string parsing (rev2)
Message-ID: <20260930142439.zoe4gosct2tseeax@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Alex Hung <alex.hung@amd.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20260929154950.838280-1-alex.hung@amd.com>
 <179070370209.218638.14938498058854751670@61270ab9df2a>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <179070370209.218638.14938498058854751670@61270ab9df2a>
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
On 2026-09-29 at 17:41:42 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Preserve const qualifiers in string parsing (rev2)
> URL   : https://patchwork.freedesktop.org/series/175019/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_9116_BAT -> XEIGTPW_15919_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_15919_BAT absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_15919_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (15 -> 15)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_15919_BAT:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@core_hotunplug@unbind-rebind:
>     - bat-bmg-2:          [PASS][1] -> [ABORT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9116/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15919/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html
> 

Unrelated.



Regards,
Kamil

>   
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_9116 -> IGTPW_15919
> 
>   IGTPW_15919: 15919
>   IGT_9116: 9d4b6ef512b4e2e4d05129c6519313fd13a306d2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-5840-ecc5a84be849c400af610cdc613a0274e3b101b2: ecc5a84be849c400af610cdc613a0274e3b101b2
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15919/index.html
