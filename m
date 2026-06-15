Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27F3ECD98C5
	for <igt-dev@archiver.kernel.org>; Mon, 15 Jun 2026 10:11:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C743010E33C;
	Mon, 15 Jun 2026 10:11:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B/GWVbiA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6C4D10E346
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Jun 2026 10:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781518263; x=1813054263;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=DhtBVcEhUprDmt7FtyEiADmWkklWOVgD3i7cC25/Lu0=;
 b=B/GWVbiAgKgbT245lc4nnLYak7rTqn6pfjJLipKgHeeHJxj+hdzLpJt0
 P6QgoL+JeF5BQzasAT/CjVHLWWPfsGv7rFX823UlOYHU1wxA4gRy29N6y
 3lgeV9+D8klY3IF4fbIaLYIoG6tc4hmBTvuAk05qZTCX+mJ7N136iVFgq
 /XFUxv2uULk7ZXRO5yF7YbYTm3xnJwb/wYQibG9vZcia2ou8C/odwUZ3M
 s7CGkjc1qbeOyE676UPGLNghskVtE+IrVabj0WNDMxZX/JKB7gyWCiKbd
 gvszdmi+0hG6S/ASnHzC/9qBLT6JAfWrE0DXemcliFw+hTTp2OmrT7cjj A==;
X-CSE-ConnectionGUID: X5mTVcRFTtilc+oVIwzwGw==
X-CSE-MsgGUID: lIard2GMT5et2bhkFqxopA==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="82101592"
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="82101592"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 03:11:02 -0700
X-CSE-ConnectionGUID: FO8t67KzSwOh2NzAWFUwzw==
X-CSE-MsgGUID: EUNBJkT+RYuLDZiH6UJGOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="246542284"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2026 03:11:01 -0700
Date: Mon, 15 Jun 2026 12:10:58 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: nakshtra.goyal@intel.com
Cc: igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com,
 andrzej.hajda@intel.com, zbigniew.kempczynski@intel.com,
 priyanka.dandamudi@intel.com
Subject: Re: [PATCH i-g-t v3 1/1] lib: s/GEN_VER/GFX_VER/ for Intel platform
Message-ID: <20260615101058.wfgp6t5owrmqp2mn@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 nakshtra.goyal@intel.com, igt-dev@lists.freedesktop.org,
 kamil.konieczny@intel.com, andrzej.hajda@intel.com,
 zbigniew.kempczynski@intel.com, priyanka.dandamudi@intel.com
References: <20260615051321.544506-1-nakshtra.goyal@intel.com>
 <20260615051321.544506-2-nakshtra.goyal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260615051321.544506-2-nakshtra.goyal@intel.com>
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

Hi Nakshtra,
On 2026-06-15 at 10:43:21 +0530, nakshtra.goyal@intel.com wrote:
> From: Nakshtra Goyal <nakshtra.goyal@intel.com>
> 
> This patch series replaces all occurrences of GEN_VER/gen_ver
> with GFX_VER/gfx_ver across the IGA64 shader infrastructure
> and igt code base to align with IGT naming convention.
> 
> v2: Changing subject as per requirement and correcting
>     commit message (Kamil)
> 
> v3: re-compiling to change to verify with changes in
>     shader sums (Andrzej)
> 
> Signed-off-by: Nakshtra Goyal <nakshtra.goyal@intel.com>

Thank you all, I merged it this with small re-wording
in the end of description.

Regards,
Kamil

> ---
>  lib/gpgpu_fill.c                              |   4 +-
>  lib/gpgpu_fill.c.gen.iga64_codes.c            |  16 +-
>  lib/gpgpu_shader.c                            |  30 +--
>  lib/gpgpu_shader.c.gen.iga64_codes.c          | 186 +++++++++---------
>  lib/gpgpu_shader.h                            |   4 +-
>  lib/iga64_macros.h                            |  10 +-
>  scripts/generate_iga64_codes                  |  16 +-
>  tests/intel/xe_eudebug_online.c               |   6 +-
>  .../xe_eudebug_online.c.gen.iga64_codes.c     |  16 +-
>  tests/intel/xe_prefetch_fault.c               |   2 +-
>  .../xe_prefetch_fault.c.gen.iga64_codes.c     |   6 +-
>  11 files changed, 148 insertions(+), 148 deletions(-)
> 
> diff --git a/lib/gpgpu_fill.c b/lib/gpgpu_fill.c
> index ed13f6eb5..2c47169d2 100644
[cut]
