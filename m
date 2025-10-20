Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80D7DCCD199
	for <igt-dev@archiver.kernel.org>; Mon, 20 Oct 2025 08:40:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34F8210E328;
	Mon, 20 Oct 2025 08:40:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PGo1sLyd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58B5B10E280;
 Mon, 20 Oct 2025 08:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760949628; x=1792485628;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=onJbvScgOu2PdXVGUES8uK6vjj7xtDYFGiGoJMJQvfg=;
 b=PGo1sLydEDz9cJAsvRLF11/eQwUiD7TEpnc5BAXDWuUWTTVZrZh2bxJf
 ADZGwS+i8/2BhqGaPIiG22J30IOMULgpi7viHdBtwrQfwigCTc4e1e1Om
 av8OCJ4RtRaSC5VZ3dvIGVspFGc9VIIG0HPamSJnkRbBf/1WeZ1tT1pKA
 z3E/idb1Aedoo+Aw/KBu//O5Mz+c15PL9djYVbTmOwg4Myf84ADD/lFiL
 Ctf9TyuyNA78yHG4kkJjDnjUiOTnotjRhYaBe8XjMKFBrw9zQ5PDVnVNy
 B/aGcZRosibjX6fsaWlZHIOpfl+9UC+QfRHb4IpeQt8F7D0RO95VysTlB Q==;
X-CSE-ConnectionGUID: bik8QcyIQEKpNTdescl6EA==
X-CSE-MsgGUID: JNzZjhhQTwusJ9Q14yQPHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62981326"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="62981326"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 01:40:28 -0700
X-CSE-ConnectionGUID: FRuCoY1wTnCKEv8L7sOqOg==
X-CSE-MsgGUID: 8oLF+139Tau+Oez/LwnsuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; d="scan'208";a="182418901"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2025 01:40:27 -0700
Date: Mon, 20 Oct 2025 10:40:12 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuQkFUOiBmYWlsdXJlIGZv?= =?utf-8?Q?r?=
 Fix drm_open_driver() with IGT_FORCE_DRIVER and DRIVER_ANY
Message-ID: <20251020084012.cp7unc5x3zph3kun@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20251016160544.122657-1-kamil.konieczny@linux.intel.com>
 <176066989854.24656.6336972400901534830@97596180aaec>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <176066989854.24656.6336972400901534830@97596180aaec>
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
On 2025-10-17 at 02:58:18 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Fix drm_open_driver() with IGT_FORCE_DRIVER and DRIVER_ANY
> URL   : https://patchwork.freedesktop.org/series/156071/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_8589 -> IGTPW_13915
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_13915 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_13915, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13915/index.html
> 
> Participating hosts (41 -> 40)
> ------------------------------
> 
>   Missing    (1): fi-snb-2520m 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_13915:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_selftest@live:
>     - fi-hsw-4770:        [PASS][1] -> [INCOMPLETE][2] +1 other test incomplete
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8589/fi-hsw-4770/igt@i915_selftest@live.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13915/fi-hsw-4770/igt@i915_selftest@live.html
> 

This is unrelated, please respin testing for i915.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_13915 that come from known issues:
> 
...cut...

