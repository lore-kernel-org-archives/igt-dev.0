Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DC5BCC6B1D
	for <igt-dev@archiver.kernel.org>; Wed, 14 Oct 2026 10:24:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3488910E0DC;
	Wed, 14 Oct 2026 10:24:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E161D10E0DC;
 Wed, 14 Oct 2026 10:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791973391; x=1823509391;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=x1AG4nQgY6QkYGSGr43hccMtSVmXdK/TiCCMxEcBnHg=;
 b=bk9voOwCW+GMtJskiN+P5hKRMAGIt2LPehQTwFJD7KVU6E8CZ9QYl6cL
 cKIx3KRMIxL09bHetRCr8UO0JyoWcKBIKtDmmtVJd7niJ/28zQMA4roMM
 spl8GiA2Gsk2QO3lPf7GYSRRv9KIRThCulQlWKRjC/59QFMUcDBAlbkOd
 wexl7/jwPmUOIzrv2ruMDJTMwupnzEFgGUDSZBbM6puq4HBcyy2K1++aJ
 uRkPd8AKQr8hg9bZdytPBLBY96/mY1kr5vF+5o/uza+Na3R+HSitsBqf+
 xv4PDM+lUx//R03HI4OZVGY4C1G+2l8IvdCeKX3oxvL+vDA2Chxz7FJEy A==;
X-CSE-ConnectionGUID: kLiHcj8FQeyoyAtuWaBXEg==
X-CSE-MsgGUID: hV4H/bDJRKiuHfi+cfiHRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="725210"
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="725210"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 03:23:10 -0700
X-CSE-ConnectionGUID: AXfdSVHbSrW4+5IgZ8IEiA==
X-CSE-MsgGUID: OkTiY67ISjOPpHQVFmqkGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="1291181"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 03:23:10 -0700
Date: Wed, 14 Oct 2026 12:22:51 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbDogZmFpbHVy?= =?utf-8?Q?e?= for
 Fix missing const in lib and runner on Ubuntu 26
Message-ID: <20261014102251.yy5fljxizf6u5n3u@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20261013151644.174387-1-kamil.konieczny@linux.intel.com>
 <179193667863.21395.6639341670077289948@221881a7231d>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <179193667863.21395.6639341670077289948@221881a7231d>
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
On 2026-10-14 at 00:11:18 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Fix missing const in lib and runner on Ubuntu 26
> URL   : https://patchwork.freedesktop.org/series/176057/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_9143_full -> IGTPW_15978_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_15978_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_15978_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15978/index.html
> 
> Participating hosts (10 -> 10)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_15978_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_flip@plain-flip-interruptible@b-hdmi-a1:
>     - shard-rkl:          NOTRUN -> [DMESG-WARN][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15978/shard-rkl-8/igt@kms_flip@plain-flip-interruptible@b-hdmi-a1.html
> 
>   * igt@kms_flip@plain-flip-interruptible@c-hdmi-a1:
>     - shard-rkl:          NOTRUN -> [ABORT][2]
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15978/shard-rkl-8/igt@kms_flip@plain-flip-interruptible@c-hdmi-a1.html
> 

Unrelated,

Regards,
Kamil

>   
> New tests
> ---------
> 
>   New tests have been introduced between IGT_9143_full and IGTPW_15978_full:
> 
> ### New IGT tests (31) ###
> 
>   * igt@kms_flip@basic-hang:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_flip@big-bo-tiledx:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_flip@device-signal-unordered:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_flip@fault-concurrent:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_flip@fbc:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_flip@fbc-1p-indfb-fliptrack-mmap-gtt:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_flip@fbc-modesetfrombusy:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_flip@fbchdr-2p-scndscrn-spr-indfb-draw-mmap-wc:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_flip@fbchdr-rgb565-draw-pwrite:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_flip@fbcpsr-2p-primscrn-indfb-msflip-blt:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_flip@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_flip@fbcpsrhdr-1p-offscreen-pri-indfb-draw-mmap-gtt:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_flip@fbcpsrhdr-1p-primscrn-spr-indfb-draw-mmap-gtt:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_flip@fbcpsrhdr-2p-primscrn-spr-indfb-draw-blt:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_flip@fences-dpms:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_flip@invalid-get-ringsize:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_flip@invalid-signal-zero-handles:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_flip@modeset-lpsp-stress-no-wait:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_flip@primary-y-tiled-reflect-x-90:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_flip@psr-1p-primscrn-indfb-pgflip-blt:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_flip@psr-2p-scndscrn-pri-shrfb-draw-render:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_flip@psrhdr-1p-primscrn-pri-indfb-draw-mmap-wc:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_flip@psrhdr-2p-primscrn-cur-indfb-draw-blt:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_flip@psrhdr-2p-scndscrn-cur-indfb-draw-mmap-gtt:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_flip@query-idle:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_flip@reserve-simple:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_flip@semaphore-noskip:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_flip@thresholds-idle:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_flip@uevent:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_flip@wait-zero-handles:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@kms_flip@yf-tiled:
>     - Statuses :
>     - Exec time: [None] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_15978_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@api_intel_bb@blit-reloc-keep-cache:
>     - shard-dg2:          NOTRUN -> [SKIP][3] ([i915#8411])
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15978/shard-dg2-8/igt@api_intel_bb@blit-reloc-keep-cache.html
> 
...cut...
