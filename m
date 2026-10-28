Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C63E606A31D
	for <igt-dev@archiver.kernel.org>; Wed, 28 Oct 2026 12:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Qi8Ksc70
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41D6110E2E0;
	Wed, 28 Oct 2026 12:39:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBFAC10E2E0;
 Wed, 28 Oct 2026 12:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793191095; x=1824727095;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=csfjtnZ0wGGZ7RSqYNCf0ESw9Xop2jCIil7NEnlLNR4=;
 b=Qi8Ksc70y9ghX71ThJuX84JaKnneokCOaHRT5D05ZtjNwJNKgcfshVha
 E4QY0N6PnoW3mTN8pcmBp2WdE2Z7P/LkIqgY5I+83GXzGzhE8LabSNA9K
 654KY8NLmT98RoAvFS5LJn/71773rD9GlNMZPAfFX68dmx1SGEVKIrr02
 BWV7IN5+ZeBmPhWjcyOe1GxEGl9B7dDRgMcVF5KETLi/0JGXk/9xlgr9l
 Hbi9GQTm1qRsWs5kvyQZoxmKGRShlUxcDXOxtWAT9xh6rBfl+L81ZTYxx
 xGwss2eKmpMIcIzS1zO7O51GG+wTm4RJYfg0lzUYrCBPyyJJulgTLlv2P Q==;
X-CSE-ConnectionGUID: L87a7FrwQZy5MXHKmUeiUw==
X-CSE-MsgGUID: wbYIFfWjTs+h4V8GZkGJoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1801999"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1801999"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 05:38:14 -0700
X-CSE-ConnectionGUID: r0TK1u6QRo6F0WUxv4B/6g==
X-CSE-MsgGUID: vpiP2WHPSUuEWzpTFNRetw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="5175913"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 05:38:13 -0700
Date: Wed, 28 Oct 2026 13:38:10 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbA==?= =?utf-8?Q?=3A?= failure for
 Runner: report test command line (rev2)
Message-ID: <20261028123810.awaiempcyvlvdcs3@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20261026141702.44811-1-kamil.konieczny@linux.intel.com>
 <179306033350.73748.6427433506043054420@221881a7231d>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <179306033350.73748.6427433506043054420@221881a7231d>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi igt-dev,
On 2026-10-27 at 00:18:53 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Runner: report test command line (rev2)
> URL   : https://patchwork.freedesktop.org/series/151715/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_9165_full -> IGTPW_16047_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_16047_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_16047_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16047/index.html
> 
> Participating hosts (10 -> 10)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_16047_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:
>     - shard-glk:          NOTRUN -> [SKIP][1] +78 other tests skip
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16047/shard-glk9/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-indfb-draw-pwrite:
>     - shard-glk:          [PASS][2] -> [SKIP][3] +1 other test skip
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9165/shard-glk8/igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-indfb-draw-pwrite.html
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16047/shard-glk9/igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-indfb-draw-pwrite.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-pwrite:
>     - shard-glk11:        NOTRUN -> [SKIP][4] +6 other tests skip
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16047/shard-glk11/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-pwrite.html
> 
>   * igt@perf@gen12-group-exclusive-stream-ctx-handle:
>     - shard-glk10:        NOTRUN -> [SKIP][5] +32 other tests skip
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16047/shard-glk10/igt@perf@gen12-group-exclusive-stream-ctx-handle.html
> 
>   * igt@perf@gen12-oa-tlb-invalidate@0-rcs0:
>     - shard-dg1:          [PASS][6] -> [FAIL][7] +1 other test fail
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9165/shard-dg1-16/igt@perf@gen12-oa-tlb-invalidate@0-rcs0.html
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16047/shard-dg1-19/igt@perf@gen12-oa-tlb-invalidate@0-rcs0.html
> 
>   * igt@perf_pmu@gt-awake:
>     - shard-mtlp:         NOTRUN -> [FAIL][8]
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16047/shard-mtlp-2/igt@perf_pmu@gt-awake.html
> 

Unrelated,

Regards,
Kamil

>   
> New tests
> ---------
> 
>   New tests have been introduced between IGT_9165_full and IGTPW_16047_full:
> 
> ### New IGT tests (3) ###
> 
>   * igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-c-hdmi-a-2:
>     - Statuses : 1 pass(s)
>     - Exec time: [2.43] s
> 
>   * igt@kms_cursor_crc@cursor-sliding-256x256@pipe-c-hdmi-a-2:
>     - Statuses : 1 pass(s)
>     - Exec time: [3.95] s
> 
>   * igt@kms_plane_alpha_blend@coverage-7efc@pipe-c-hdmi-a-2:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.59] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_16047_full that come from known issues:
...cut...

