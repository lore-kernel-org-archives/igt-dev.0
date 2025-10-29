Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EB28CCF9EE
	for <igt-dev@archiver.kernel.org>; Wed, 29 Oct 2025 17:17:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 160C810E210;
	Wed, 29 Oct 2025 17:17:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YTsX8Ai2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B808410E201;
 Wed, 29 Oct 2025 17:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761758269; x=1793294269;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=oma0bBJYDZLfNvwvRuEd56JMD1ofP0vJUYoMlQ1eLcE=;
 b=YTsX8Ai2fNIlN3yuSROv5CXFzHK5/6whoEU89aiI3z4Jvp/7WRp6Pv13
 EuBEYR2v4lrTgfLWbYr8/t4OgC5li3OBB/+t76CiK+T4KTPIhUqAgG6LW
 eZ5JMtc3KyFL9GIHilznS30VxMMRXjrdd92JRSZo8zSO+ObdYATH1qOYg
 2aPXDX0ttlavn+IBGCpsou3/Kj43fiFvby0fdVB1alk9jWVa9VcAe3pCC
 vc5DruPJMmtXaeLSedmz8SeBdaG4bpEZ5wiE/X+cEqQNp2oobooxH5k/T
 ssxfC48nhJrD4z/WdFcq4CjGPK0ws3u3dlZOFGwO7xGyM1v89m25ime0V w==;
X-CSE-ConnectionGUID: POoxTJcwTBmF8c0FYM+o+Q==
X-CSE-MsgGUID: 84YwQIn0Tbqu9/dEGi5etw==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="51461520"
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; d="scan'208";a="51461520"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 10:17:48 -0700
X-CSE-ConnectionGUID: qOprff69RvuJ4yKIxKo6Fw==
X-CSE-MsgGUID: eCxyhiNOTGauvgR+n5vZyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; d="scan'208";a="185371788"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 10:17:46 -0700
Date: Wed, 29 Oct 2025 18:17:31 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_Sync_PC?=
 =?utf-8?Q?I?= ids with kernel: split BMG to BMG-G21 and add NVL-S (rev2)
Message-ID: <20251029171731.3ahbulvdxx5ybrxu@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20251028104234.14745-1-kamil.konieczny@linux.intel.com>
 <176168324321.64512.5775949973480792343@97596180aaec>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <176168324321.64512.5775949973480792343@97596180aaec>
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
On 2025-10-28 at 20:27:23 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Sync PCI ids with kernel: split BMG to BMG-G21 and add NVL-S (rev2)
> URL   : https://patchwork.freedesktop.org/series/156479/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_17436_full -> IGTPW_13955_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_13955_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_13955_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13955/index.html
> 
> Participating hosts (11 -> 12)
> ------------------------------
> 
>   Additional (1): shard-dg2-set2 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_13955_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-1-size-128:
>     - shard-rkl:          [PASS][1] -> [FAIL][2] +3 other tests fail
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17436/shard-rkl-4/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-1-size-128.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13955/shard-rkl-7/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-1-size-128.html
> 

Unrelated.

Regards,
Kamil

>   
> New tests
> ---------
> 
>   New tests have been introduced between CI_DRM_17436_full and IGTPW_13955_full:
> 
> ### New IGT tests (11) ###
> 
>   * igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-3:
>     - Statuses : 1 pass(s)
>     - Exec time: [2.29] s
> 
>   * igt@kms_async_flips@alternate-sync-async-flip@pipe-b-dp-3:
>     - Statuses : 1 pass(s)
>     - Exec time: [2.13] s
> 
>   * igt@kms_async_flips@alternate-sync-async-flip@pipe-c-dp-3:
>     - Statuses : 1 pass(s)
>     - Exec time: [2.14] s
> 
>   * igt@kms_async_flips@alternate-sync-async-flip@pipe-d-dp-3:
>     - Statuses : 1 pass(s)
>     - Exec time: [2.13] s
> 
>   * igt@kms_cursor_crc@cursor-alpha-transparent@pipe-d-dp-3:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.55] s
> 
>   * igt@kms_cursor_crc@cursor-onscreen-256x256@pipe-d-dp-3:
>     - Statuses : 1 pass(s)
>     - Exec time: [2.73] s
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-256x256@pipe-d-dp-3:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.41] s
> 
>   * igt@kms_invalid_mode@bad-hsync-start@pipe-a-dp-3:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.08] s
> 
>   * igt@kms_invalid_mode@bad-hsync-start@pipe-b-dp-3:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.00] s
> 
>   * igt@kms_invalid_mode@bad-hsync-start@pipe-c-dp-3:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.00] s
> 
>   * igt@kms_invalid_mode@bad-hsync-start@pipe-d-dp-3:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.00] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_13955_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@api_intel_bb@blit-reloc-keep-cache:

...cut...

