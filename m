Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9A90CA0EE4
	for <igt-dev@archiver.kernel.org>; Wed, 20 Aug 2025 13:47:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54D6A10E73A;
	Wed, 20 Aug 2025 13:47:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LJTj4q0k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5393710E740;
 Wed, 20 Aug 2025 13:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755697666; x=1787233666;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=jsBKYPQwkkaFqx/SzNg/oOnjlwQONeMaTkX2kAyR4/c=;
 b=LJTj4q0k8jf9BqwVSCnWYXbNEjRvTuMqKeTsisGZMTGvVGRkRV0oioqe
 5tWED8Jy2P856ufEgeygr7qJLgNzs6Iz/Ws4dlwe2WYqy4PMu0g1L6ZOW
 aEeVcvhY39ROi3Oqo1l8eDlu3yru1tVVMSaLXWI8bptwL29L6LwWCkX+B
 NKOtScU6RAXSBF8xQUuMh406KtQYrZ10pnGGltDbNMY/PtaylTzLZsk2T
 Cl5QIuyqvO6lFBXSHyztGsPAGB1EE5pJ4ncfoezswfGwpaiwom9z8HIjr
 +6RCHMbXlC6ib6qfxzpRybRzYLc0JZxHhIbUPdcHWiNpV9j9ve98Vf2hi Q==;
X-CSE-ConnectionGUID: ikEt5pN8QOyo1c6IDoyefA==
X-CSE-MsgGUID: wHJBOwBYQWy36uwGOoDo8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="56990801"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="56990801"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2025 06:47:45 -0700
X-CSE-ConnectionGUID: Btw2QKaZSlWhq98lDl9sMQ==
X-CSE-MsgGUID: PgmeU0s8R4yH8AuJF/NNAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="205291840"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2025 06:47:44 -0700
Date: Wed, 20 Aug 2025 15:47:27 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw=?= =?utf-8?Q?=3A?= failure for
 Convert kms_3d into subtest
Message-ID: <20250820134727.xsifwpifqlfc7yuh@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20250819155058.129794-1-kamil.konieczny@linux.intel.com>
 <175569311293.251997.17082434179751666316@1538d3639d33>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <175569311293.251997.17082434179751666316@1538d3639d33>
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
On 2025-08-20 at 12:31:52 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Convert kms_3d into subtest
> URL   : https://patchwork.freedesktop.org/series/153155/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8498_FULL -> XEIGTPW_13600_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_13600_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_13600_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in XEIGTPW_13600_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * {igt@kms_3d@basic} (NEW):
>     - shard-lnl:          NOTRUN -> [SKIP][1]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13600/shard-lnl-2/igt@kms_3d@basic.html

This is valid skip as this machine has monitor connected by eDP
and tests needs HDMI.

> 
>   * igt@kms_color@deep-color@pipe-b-edp-1-gamma:
>     - shard-lnl:          [PASS][2] -> [INCOMPLETE][3] +1 other test incomplete
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8498/shard-lnl-2/igt@kms_color@deep-color@pipe-b-edp-1-gamma.html
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13600/shard-lnl-1/igt@kms_color@deep-color@pipe-b-edp-1-gamma.html

Unrelated.

Regards,
Kamil

> 
>   
> New tests
> ---------
> 
>   New tests have been introduced between XEIGT_8498_FULL and XEIGTPW_13600_FULL:
> 
> ### New IGT tests (1) ###
> 
>   * igt@kms_3d@basic:
>     - Statuses : 2 pass(s) 1 skip(s)
>     - Exec time: [0.0, 1.51] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_13600_FULL that come from known issues:

...cut...

> 
> Build changes
> -------------
> 
>   * IGT: IGT_8498 -> IGTPW_13600
>   * Linux: xe-3578-deb6c5d08f8b84ea7e019b7682631c6375cc17aa -> xe-3579-8093b67375779a975c13b9a23c8fcc25cb1e9c83
> 
>   IGTPW_13600: e50acf4e67e6826b14605753615c30666f704747 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_8498: 8498
>   xe-3578-deb6c5d08f8b84ea7e019b7682631c6375cc17aa: deb6c5d08f8b84ea7e019b7682631c6375cc17aa
>   xe-3579-8093b67375779a975c13b9a23c8fcc25cb1e9c83: 8093b67375779a975c13b9a23c8fcc25cb1e9c83
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13600/index.html
