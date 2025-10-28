Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6257CCCD1BF
	for <igt-dev@archiver.kernel.org>; Tue, 28 Oct 2025 17:55:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B22E10E640;
	Tue, 28 Oct 2025 17:55:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n9sNKNa/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DFC610E63F;
 Tue, 28 Oct 2025 17:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761674136; x=1793210136;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=VbS0TJIkqAZZmHr9eX8JxwNp7bP1eQz1lXyUTC/dk5A=;
 b=n9sNKNa/osjwE6BKjSTebeVUzrYtY+LUD6L4kRq6qvjgHsLkjDzmO3SU
 GHQBgSCo0NN0Ymzv3a6dOaQU1/m7CLJ9kzKXVSSDZMPam45L2wY01Lv9e
 ByUkzjYUkYMZIH7mIkmFL8JUwr2impENEhYPjh4m3UVoiE6dC537pBqHw
 ijX9KRw2/7iVBqHFcpD1m32bC1duUO+uJPoe6D9E/I61HJ9YOtgiYfo8d
 p5O5rxIKJ91FQ6kbw/EWdF8OgdIUmiCeGmF8GmwL11ORKLFbd7ywPJxtH
 d2JXW4TFkTRvQEa/HlRzJlxKjps0D4RjT451hJI9cSWiYHEvasvkm6kBG g==;
X-CSE-ConnectionGUID: IMB9yL80SIeCLCynL7e0dg==
X-CSE-MsgGUID: qorBJ49jR/2hkA20dERKbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74903330"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="74903330"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 10:55:36 -0700
X-CSE-ConnectionGUID: 9kFyqqyDSPy3Bon1hs5wiw==
X-CSE-MsgGUID: iTMFYrJRTg6Cy2fZNBv0cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="190552273"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 10:55:34 -0700
Date: Tue, 28 Oct 2025 18:55:32 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Sync_PC?=
 =?utf-8?Q?I?= ids with kernel: split BMG to BMG-G21 and add NVL-S (rev2)
Message-ID: <20251028175532.eyfnnk7hhwah3m7q@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20251028104234.14745-1-kamil.konieczny@linux.intel.com>
 <176166973504.63971.16390483315813240840@97596180aaec>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <176166973504.63971.16390483315813240840@97596180aaec>
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
On 2025-10-28 at 16:42:15 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Sync PCI ids with kernel: split BMG to BMG-G21 and add NVL-S (rev2)
> URL   : https://patchwork.freedesktop.org/series/156479/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8598_FULL -> XEIGTPW_13955_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_13955_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_13955_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (4 -> 3)
> ------------------------------
> 
>   Missing    (1): shard-adlp 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_13955_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_pipe_stress@stress-xrgb8888-xtiled:
>     - shard-dg2-set2:     [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8598/shard-dg2-463/igt@kms_pipe_stress@stress-xrgb8888-xtiled.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13955/shard-dg2-435/igt@kms_pipe_stress@stress-xrgb8888-xtiled.html
> 

Unrelated.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_13955_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][3] ([Intel XE#623])
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13955/shard-dg2-463/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
> 
...cut...

