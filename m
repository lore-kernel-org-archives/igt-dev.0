Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4D27CCD1BE
	for <igt-dev@archiver.kernel.org>; Thu, 23 Oct 2025 10:38:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 652D510E3CB;
	Thu, 23 Oct 2025 10:38:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q5mhAswp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 399D110E3B6;
 Thu, 23 Oct 2025 10:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761215897; x=1792751897;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=rtEizTaeEbghKuDmg12K2oGeBzOS+20KxndtChWRnvI=;
 b=Q5mhAswp+avqlFDDswTjs/moTdj/XU4IuX+jTi7Nz2LZBoIBVPsT9Fnn
 dyf65b4lUQILKbIoNJE7ttBQjxKFLgschfEeFIDzWIeSA/W2l5vXx5qVv
 qRfpoTRJLmvVllM3JvUYepvLjayZRwe18/prPfytmp0l5R3CYNNGrtNFH
 f49uCCPFCDRib4DncwnUTBfcA3TsbLM9kXYHyQ4BUXiEdfJJfEExd1zFR
 PP8sYffpv8BZ9fsBGPl2wqrzVPbqRgB22rYrov+0RJoAFGVbs0RgUiJIw
 hrj9ZcpgMBvYx2+/hL3VhTD9R9ZjuWVbuxLLOgNK6J7L0zQE9CZ/ahcgc w==;
X-CSE-ConnectionGUID: xUnQlUtPT2K8XjGB74mvJg==
X-CSE-MsgGUID: Lprc1WH3QH6DHBcjQj6b0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74050528"
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; d="scan'208";a="74050528"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 03:38:17 -0700
X-CSE-ConnectionGUID: uqjaVJO5SnCbbfEptQ/dJg==
X-CSE-MsgGUID: 6mTokW0iQfyf5ga4Iaj0Gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; d="scan'208";a="188415914"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 03:38:16 -0700
Date: Thu, 23 Oct 2025 12:37:59 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkJBVDogZmFpbHVy?= =?utf-8?Q?e?= for
 tests/intel/xe_exec_reset: Fix uninitialized var
Message-ID: <20251023103759.ycqfzul6bc2dc4fh@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20251022114655.70478-1-kamil.konieczny@linux.intel.com>
 <176114319263.42904.15346747777450098368@97596180aaec>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <176114319263.42904.15346747777450098368@97596180aaec>
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
On 2025-10-22 at 14:26:32 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel/xe_exec_reset: Fix uninitialized var
> URL   : https://patchwork.freedesktop.org/series/156333/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8594_BAT -> XEIGTPW_13928_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_13928_BAT absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_13928_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (12 -> 12)
> ------------------------------
> 
>   Additional (1): bat-bmg-3 
>   Missing    (1): bat-pvc-2 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_13928_BAT:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * {igt@xe_peer2peer@read@read-gpua-vram01-gpub-vram01-p2p} (NEW):
>     - bat-bmg-3:          NOTRUN -> [FAIL][1] +5 other tests fail
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13928/bat-bmg-3/igt@xe_peer2peer@read@read-gpua-vram01-gpub-vram01-p2p.html
> 

Unrelated to xe_exec_reset change.

Regards,
Kamil

>   
> New tests
> ---------
> 
>   New tests have been introduced between XEIGT_8594_BAT and XEIGTPW_13928_BAT:
> 
> ### New IGT tests (4) ###
> 
>   * igt@xe_peer2peer@read@read-gpua-system-gpub-vram01-p2p:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.24] s
> 
>   * igt@xe_peer2peer@read@read-gpua-vram01-gpub-vram01-p2p:
>     - Statuses : 1 fail(s)
>     - Exec time: [0.03] s
> 
>   * igt@xe_peer2peer@write@write-gpua-system-gpub-vram01-p2p:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.23] s
> 
>   * igt@xe_peer2peer@write@write-gpua-vram01-gpub-vram01-p2p:
>     - Statuses : 1 fail(s)
>     - Exec time: [0.03] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_13928_BAT that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_flip@basic-flip-vs-modeset:
>     - bat-adlp-7:         [PASS][2] -> [DMESG-WARN][3] ([Intel XE#4543]) +1 other test dmesg-warn
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8594/bat-adlp-7/igt@kms_flip@basic-flip-vs-modeset.html
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13928/bat-adlp-7/igt@kms_flip@basic-flip-vs-modeset.html
> 
>   * igt@xe_create@multigpu-create-massive-size:
>     - bat-bmg-3:          NOTRUN -> [SKIP][4] ([Intel XE#2504])
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13928/bat-bmg-3/igt@xe_create@multigpu-create-massive-size.html
> 
>   * igt@xe_eudebug@multigpu-basic-client:
>     - bat-bmg-3:          NOTRUN -> [SKIP][5] ([Intel XE#4837]) +1 other test skip
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13928/bat-bmg-3/igt@xe_eudebug@multigpu-basic-client.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#2504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504
>   [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
>   [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_8594 -> IGTPW_13928
>   * Linux: xe-3950-76e60b5ce41fc1bcabf7941a57303d541bffd6ad -> xe-3964-b3696aee36c443dbea93e1068b9c3c765bc8e700
> 
>   IGTPW_13928: 13928
>   IGT_8594: 8594
>   xe-3950-76e60b5ce41fc1bcabf7941a57303d541bffd6ad: 76e60b5ce41fc1bcabf7941a57303d541bffd6ad
>   xe-3964-b3696aee36c443dbea93e1068b9c3c765bc8e700: b3696aee36c443dbea93e1068b9c3c765bc8e700
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13928/index.html
