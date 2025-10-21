Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9206CCD1A7
	for <igt-dev@archiver.kernel.org>; Tue, 21 Oct 2025 14:53:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9338B10E302;
	Tue, 21 Oct 2025 14:53:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B5SyOpKZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AD0A10E302;
 Tue, 21 Oct 2025 14:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761058412; x=1792594412;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=OslaW56KTyTmetMCGEJd6jpAm8Sv0ZKTQq6s3FBpQ4o=;
 b=B5SyOpKZgwxBXbltrLUbazLRGCkLE5qQt5drfRLWfPXgUTPxs8YDZoWm
 QJjj90cBvuusftxljELzcwn96jb+JpTY39fGwWzB87cvekgwbUEvb0OMK
 Z9yHDK1JvAKQyIWYhxxNXQ/Mukz4e7Hv3BdEQ9jMrXrhkLRtDKWeXC5R9
 /8ckV4Y0JW/8UAXKcoStMufBhkxlvUJ6feB75jqhtBVWMHHQppmbQDlXQ
 6n/gyRYY3ghBWZa9j7I+OVvy+Kl6j6iESAzPBrYnpOWVyESbLcpD7NLEK
 z8s6TVVKq3Tj2cX/9JAW0BjH1Pv877ksUEb8mXD7iDH0gJWFFbA5G92he Q==;
X-CSE-ConnectionGUID: 8EJcLV1CSFeagSypLden6Q==
X-CSE-MsgGUID: ob5H1IMGStGiDJoXfrZKgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="80809690"
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; d="scan'208";a="80809690"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 07:53:32 -0700
X-CSE-ConnectionGUID: vQqwWw/+SnSet/oTF+dVgQ==
X-CSE-MsgGUID: vQu3RkSmTbuAiXEwZ5+02g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; d="scan'208";a="188720398"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 07:53:31 -0700
Date: Tue, 21 Oct 2025 16:53:16 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw6IGZhaWx1cmUgZm9yIEZp?=
 =?utf-8?Q?x?= drm_open_driver() with IGT_FORCE_DRIVER and DRIVER_ANY (rev2)
Message-ID: <20251021145316.fx7wjqmlbdvp44wq@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20251020174127.170084-1-kamil.konieczny@linux.intel.com>
 <176104950032.36810.266377570401860877@97596180aaec>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <176104950032.36810.266377570401860877@97596180aaec>
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
On 2025-10-21 at 12:25:00 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Fix drm_open_driver() with IGT_FORCE_DRIVER and DRIVER_ANY (rev2)
> URL   : https://patchwork.freedesktop.org/series/156071/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8594_FULL -> XEIGTPW_13924_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_13924_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_13924_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in XEIGTPW_13924_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-vram01-vram01:
>     - shard-dg2-set2:     [PASS][1] -> [INCOMPLETE][2] +1 other test incomplete
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8594/shard-dg2-434/igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-vram01-vram01.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13924/shard-dg2-464/igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-vram01-vram01.html
> 
>   * igt@xe_gt_freq@freq_suspend:
>     - shard-bmg:          [PASS][3] -> [DMESG-WARN][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8594/shard-bmg-7/igt@xe_gt_freq@freq_suspend.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13924/shard-bmg-5/igt@xe_gt_freq@freq_suspend.html
> 

Not related to change.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_13924_FULL that come from known issues:
...cut...

