Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 398E4D462A6
	for <igt-dev@archiver.kernel.org>; Wed, 13 Nov 2024 14:03:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2B4810E705;
	Wed, 13 Nov 2024 14:03:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FlpJUJgQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70CC810E252;
 Wed, 13 Nov 2024 14:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731506595; x=1763042595;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=vQnyRs0jrLor3+N5nKJZgE40xXMStWZLrgwhw4ymQY0=;
 b=FlpJUJgQMjda779tpWGDehXNA1TIAS8n5KfUf/rr6Uaf67lLs6SlgdQF
 L0Oy2GndyPFLK1KFhIFvcA9ApTZsiypeaKz65iIlTqehw97Gq+35mtHKt
 zSxCPDlDRkG1ncfrmgGkWocVB4Lpnh8bDdBjzKB13UJzE6hTE2Vae3IVC
 umyXtsK4TaUWtaMiLflpDXR25Oge+ys0IVp8h5XUezVwJu7gOv82ivEWc
 eZgiO1C5QKvt8wjazv/C2MdBO8NhtEL5tgT83zisB7+T5P28Igww9+osC
 ZqxeB52MVakkZDpWU/9j1VX//JV/RUAsfjtpPJWTOZ6ywKHIvyfbOxHFA g==;
X-CSE-ConnectionGUID: VV79jwjHQvaWcEmoap6YFw==
X-CSE-MsgGUID: ao9p2FmISJuaX1ebPdr3tA==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="30797905"
X-IronPort-AV: E=Sophos;i="6.12,151,1728975600"; d="scan'208";a="30797905"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 06:03:08 -0800
X-CSE-ConnectionGUID: jwLp7rJ+Q0O9F0wVjOcxtg==
X-CSE-MsgGUID: Tag8TBjBSSOz4qtG+CieoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,151,1728975600"; d="scan'208";a="118712566"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 06:03:07 -0800
Date: Wed, 13 Nov 2024 15:02:51 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Ngai-Mint Kwan <ngai-mint.kwan@linux.intel.com>,
 I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLklHVA==?= =?utf-8?Q?=3A?= failure for
 lib: sync PCI ID macros with kernel
Message-ID: <20241113140251.gmjq277xcv5hbrwf@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Ngai-Mint Kwan <ngai-mint.kwan@linux.intel.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20241106185846.1218835-1-ngai-mint.kwan@linux.intel.com>
 <173093698951.1419482.8226455280346003364@2413ebb6fbb6>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <173093698951.1419482.8226455280346003364@2413ebb6fbb6>
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
On 2024-11-06 at 23:49:49 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: lib: sync PCI ID macros with kernel
> URL   : https://patchwork.freedesktop.org/series/141024/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_15647_full -> IGTPW_12053_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_12053_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_12053_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12053/index.html
> 
> Participating hosts (9 -> 9)
> ------------------------------
> 
>   Additional (1): shard-glk-0 
>   Missing    (1): shard-glk 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_12053_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_force_connector_basic@force-connector-state:
>     - shard-tglu:         [PASS][1] -> [ABORT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15647/shard-tglu-5/igt@kms_force_connector_basic@force-connector-state.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12053/shard-tglu-3/igt@kms_force_connector_basic@force-connector-state.html
> 

This is unrelated, from dmesg log:
[526.158767] nvme nvme0: I/O tag 220 (70dc) QID 2 timeout, completion polled

it looks like a disk problem?

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_12053_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
...cut...
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_8099 -> IGTPW_12053
>   * Piglit: piglit_4509 -> None
> 
>   CI-20190529: 20190529
>   CI_DRM_15647: 438ef86a725b59a171dba81fc258bb23a0ff536c @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_12053: 0c6d7777ccf47fdfbcd2c36c323decfeca917a81 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_8099: 27be46dee80b6b0de80f9fa3cd9bb5f55edccaf8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12053/index.html
