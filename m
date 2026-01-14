Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34E4ED37E2A
	for <igt-dev@archiver.kernel.org>; Wed, 14 Jan 2026 13:09:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D99F910E608;
	Wed, 14 Jan 2026 13:09:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N1EO4+FX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A553C10E608;
 Wed, 14 Jan 2026 13:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768396157; x=1799932157;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IvgCaArapmfTSha4iyGxXHq50wG5f+YtNLmiQwcmaSE=;
 b=N1EO4+FXO7+qxouJzcYG/gn0xunn+JMy4OI6zZ+HDY8Rf1PzvEfBY8d+
 Ea7LpfWKbkEkfMuI5+KIB/933SPCB95o8URvfsSZzGetMTBzBaI6eykBz
 szRpyVZ+js37bQWmj/wLUHUq6aGl8E7n7040LvGrgf2B+SmoklUNcRCvc
 sGe4tzT1sEPKuTIloRT21SOP74z4Pv+cJyK3k1VBx8qpxi9ofsWAVK/4W
 UEQp1vSPqzQxG/nIBBgHFKGs3HpFS2dn0LrRcGCBHh03/AIkUzNhyJe6f
 HFqQrfM8ISUwvy2HqDH7KJGdv/D5yrtM+5aW+CZiycBEl+x6OMUVip5jV g==;
X-CSE-ConnectionGUID: NPLHiUejTlymtRzbQ9ioFg==
X-CSE-MsgGUID: CozzaKN6RSCucx6YzmVNSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="72276388"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; d="scan'208";a="72276388"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2026 05:09:17 -0800
X-CSE-ConnectionGUID: 9UevuwcrRNSTrMlnCiNvrQ==
X-CSE-MsgGUID: 6v60uTH/TMy4UvT8gIUBzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; d="scan'208";a="235936819"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.246.97])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2026 05:09:16 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: I915-ci-infra@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: Re: =?UTF-8?B?4pyX?= i915.CI.Full: failure for
 tests/intel/gem_lmem_swapping:
 Avoid false failures from oom-killer (rev4)
Date: Wed, 14 Jan 2026 14:09:13 +0100
Message-ID: <3351138.aV6nBDHxoP@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <176835414338.152186.17058735113237015167@a3b018990fe9>
References: <20260113160043.694106-2-janusz.krzysztofik@linux.intel.com>
 <176835414338.152186.17058735113237015167@a3b018990fe9>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
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

Hi I915-ci-infra@lists.freedesktop.org,

On Wednesday, 14 January 2026 02:29:03 CET Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel/gem_lmem_swapping: Avoid false failures from oom-killer (rev4)
> URL   : https://patchwork.freedesktop.org/series/159160/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_17814_full -> IGTPW_14334_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_14334_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_14334_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14334/index.html
> 
> Participating hosts (9 -> 9)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_14334_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_exec_await@wide-contexts:
>     - shard-dg2:          [PASS][1] -> [DMESG-WARN][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17814/shard-dg2-3/igt@gem_exec_await@wide-contexts.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14334/shard-dg2-5/igt@gem_exec_await@wide-contexts.html
> 
>   * igt@gem_pwrite@basic-exhaustion:
>     - shard-tglu:         NOTRUN -> [ABORT][3]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14334/shard-tglu-2/igt@gem_pwrite@basic-exhaustion.html

The patch under this pre-merge testing only affects igt@gem_lmem_swapping.  
None of the above is related.  Please update filters and re-report.

Thanks,
Janusz

> 
>   
> New tests
> ---------
> 
>   New tests have been introduced between CI_DRM_17814_full and IGTPW_14334_full:
> 
> ### New IGT tests (1) ###
> 
>   * igt@kms_draw_crc@draw-method-mmap-cpu@xbgr16161616f-ytiled:
>     - Statuses : 4 pass(s)
>     - Exec time: [0.08, 0.18] s
> 
>   
> 
> Known issues
> ------------
...


