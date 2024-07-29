Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4EBEC3DA4A
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jul 2024 12:17:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F5E410E3A4;
	Mon, 29 Jul 2024 12:17:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GA3M5hTf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4167610E3AC;
 Mon, 29 Jul 2024 12:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722255450; x=1753791450;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=vyZKEA7Xv7HxIqkmukn6C8Ip+b545RMfatAQtaZ96Qw=;
 b=GA3M5hTfpKl62bHdwwdZcNaNf9qZwaOqlIbgievHRqlpcM2djoMSLnX8
 oaJydtq5XnDulbkqKEpCdLZ9H0hAmnRg6wauyI9x3zqEVnzqHcTJKLYg9
 XZ3m+8bWhI7fX0fZZiK5A8UymwPI9pPN6H7xpCpz0igOpaYD02OprqnlJ
 oOm0CsFNedafGsZFgLKvI6Wv2mRg6MJN/76UW8NGjUhn9fpyADZTUjQyd
 QnVqFo6xzgQSV9yPWfLGA0n9jMM3C8mi/tgCDicERLvlWhCpKcc7lq8zF
 EZcwpVIWTO4RLWjotjWSVdShb20KT2IauFFK2ebV7QJZJR2fJ3gFBlgIZ Q==;
X-CSE-ConnectionGUID: JP+IFXBJS6ik8tJtWHLffQ==
X-CSE-MsgGUID: O8QGr+n1RpWfOjyKCHKlKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="19886971"
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="19886971"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 05:17:30 -0700
X-CSE-ConnectionGUID: 5n+83tMER5qVVGZ9pKQV/A==
X-CSE-MsgGUID: zIlNKEwRTNi2OgA8hfLm8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="58548803"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2024 05:17:28 -0700
Date: Mon, 29 Jul 2024 14:17:11 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIENJLnhlRlVMTDogZmFpbHVy?= =?utf-8?Q?e?= for
 tests/device_reset: Wait for device nodes to re-appear
Message-ID: <20240729121711.byw7qrjkb4kmiabe@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20240726084022.356654-4-janusz.krzysztofik@linux.intel.com>
 <172202827326.387176.17549369868654949846@2413ebb6fbb6>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <172202827326.387176.17549369868654949846@2413ebb6fbb6>
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
On 2024-07-26 at 21:11:13 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/device_reset: Wait for device nodes to re-appear
> URL   : https://patchwork.freedesktop.org/series/136559/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_7939_full -> XEIGTPW_11475_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_11475_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_11475_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (3 -> 3)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_11475_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_exec_compute_mode@twice-userptr-invalidate:
>     - shard-lnl:          [PASS][1] -> [DMESG-WARN][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7939/shard-lnl-8/igt@xe_exec_compute_mode@twice-userptr-invalidate.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11475/shard-lnl-7/igt@xe_exec_compute_mode@twice-userptr-invalidate.html
> 
>   * igt@xe_exec_reset@cm-gt-reset:
>     - shard-dg2-set2:     [PASS][3] -> [DMESG-WARN][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7939/shard-dg2-432/igt@xe_exec_reset@cm-gt-reset.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11475/shard-dg2-435/igt@xe_exec_reset@cm-gt-reset.html
> 

These are unrelated to device_reset and core_hotunplug,

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_11475_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
>     - shard-lnl:          [PASS][5] -> [FAIL][6] ([Intel XE#1659]) +1 other test fail
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7939/shard-lnl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11475/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
> 

...cut...

> 
> Build changes
> -------------
> 
>   * IGT: IGT_7939 -> IGTPW_11475
> 
>   IGTPW_11475: 11475
>   IGT_7939: 7939
>   xe-1671-edd84625d093bb52bfb1c0c6feb12cff308d81b7: edd84625d093bb52bfb1c0c6feb12cff308d81b7
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11475/index.html
