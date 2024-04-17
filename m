Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0630DC4345F
	for <igt-dev@archiver.kernel.org>; Wed, 17 Apr 2024 10:01:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9138F113366;
	Wed, 17 Apr 2024 10:01:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cjp/s0YD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8194410F558;
 Wed, 17 Apr 2024 10:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713348086; x=1744884086;
 h=date:from:cc:subject:message-id:references:mime-version:
 in-reply-to; bh=loj60T5AVll9+tZkfsLtvwteKSyZlAtNyvo6fjvTOOU=;
 b=cjp/s0YDnTyhffg0neESfgSPB5QdFXpnEiA9smIqtB4EuNJKMrVKHQuD
 SYjRbwRvUjTUETMAqkWA07zp/peLFB3sgvxTaZBEjqG/SqDHPiBMsyr0c
 zrhG4Q3hi23///p7rsatmFoB4VXYxOi/KALktDg2X7RQdUiy1flTv9N5h
 U9omqXdeg/+/lpD/nfpR6FK8V+9ce6Y7pJheVlmExGjl1i7eOUtnc4TGc
 457oZLoMa6WU2MI7e6XUB0x70UJvDKX8jN0Fh1zf6qnCFo+5TaEDYW0Fc
 brKf0UnmDcCsWUiU7t5DcfLcVKkX0tGzKvbIibt3kozME3N0zQYmAZQ23 Q==;
X-CSE-ConnectionGUID: j6EWPDdmSyumknksGGiYQQ==
X-CSE-MsgGUID: WMmr4q+hRryueUZraRAUsA==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="34216449"
X-IronPort-AV: E=Sophos;i="6.07,208,1708416000"; d="scan'208";a="34216449"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 03:01:26 -0700
X-CSE-ConnectionGUID: 1YaoI5kjTQmJcOXwfjVV+Q==
X-CSE-MsgGUID: MFYNhKKTRYqJ7mUiZ/eBlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,208,1708416000"; d="scan'208";a="27214816"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 03:01:24 -0700
Date: Wed, 17 Apr 2024 12:01:21 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLklHVA==?= =?utf-8?Q?=3A?= failure for
 lib/kunit: Read results from debugfs (rev3)
Message-ID: <20240417100121.73pgcmcwmyicmhis@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20240415173405.120137-2-janusz.krzysztofik@linux.intel.com>
 <171329504746.1445385.3302698868541752372@8e613ede5ea5>
 <3541512.V25eIC5XRa@jkrzyszt-mobl2.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3541512.V25eIC5XRa@jkrzyszt-mobl2.ger.corp.intel.com>
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

Hi Janusz,
On 2024-04-16 at 22:06:21 +0200, Janusz Krzysztofik wrote:
> On Tuesday, 16 April 2024 21:17:27 CEST Patchwork wrote:
> > == Series Details ==
> > 
> > Series: lib/kunit: Read results from debugfs (rev3)
> > URL   : https://patchwork.freedesktop.org/series/131686/
> > State : failure
> > 
> > == Summary ==
> > 
> > CI Bug Log - changes from IGT_7807_full -> IGTPW_11024_full
> > ====================================================
> > 
> > Summary
> > -------
> > 
> >   **FAILURE**
> > 
> >   Serious unknown changes coming with IGTPW_11024_full absolutely need to be
> >   verified manually.
> >   
> >   If you think the reported changes have nothing to do with the changes
> >   introduced in IGTPW_11024_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
> >   to document this new failure mode, which will reduce false positives in CI.
> > 
> >   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/index.html
> > 
> > Participating hosts (9 -> 9)
> > ------------------------------
> > 
> >   No changes in participating hosts
> > 
> > Possible new issues
> > -------------------
> > 
> >   Here are the unknown changes that may have been introduced in IGTPW_11024_full:
> > 
> > ### IGT changes ###
> > 
> > #### Possible regressions ####
> > 
> >   * igt@gem_partial_pwrite_pread@write:
> >     - shard-snb:          [PASS][1] -> [ABORT][2]
> >    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7807/shard-snb4/igt@gem_partial_pwrite_pread@write.html
> >    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-snb7/igt@gem_partial_pwrite_pread@write.html
> > 
> >   * igt@kms_cursor_legacy@single-move@pipe-c:
> >     - shard-glk:          [PASS][3] -> [INCOMPLETE][4] +1 other test incomplete
> >    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7807/shard-glk5/igt@kms_cursor_legacy@single-move@pipe-c.html
> >    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-glk4/igt@kms_cursor_legacy@single-move@pipe-c.html
> 
> These failures have nothing to do with changes to IGT KUnit library.
> 
> @BUG Filing, please update filters and re-report.
> 
> Thanks,
> Janusz
> 

Adding Cc: I915-ci-infra@lists.freedesktop.org

Regards,
Kamil

> > 
> >   
> > Known issues
> > ------------
> > 
> >   Here are the changes found in IGTPW_11024_full that come from known issues:
> > 
> > ### IGT changes ###
> > 
> > #### Issues hit ####
> > 
> >   * igt@api_intel_bb@blit-reloc-purge-cache:
> >     - shard-dg1:          NOTRUN -> [SKIP][5] ([i915#8411]) +1 other test skip
> >    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg1-14/igt@api_intel_bb@blit-reloc-purge-cache.html
> >     - shard-mtlp:         NOTRUN -> [SKIP][6] ([i915#8411]) +1 other test skip
> >    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-mtlp-4/igt@api_intel_bb@blit-reloc-purge-cache.html
> > 
> >   * igt@api_intel_bb@object-noreloc-keep-cache-simple:
> >     - shard-snb:          NOTRUN -> [SKIP][7] +15 other tests skip
> >    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-snb5/igt@api_intel_bb@object-noreloc-keep-cache-simple.html
> > 
> >   * igt@device_reset@unbind-cold-reset-rebind:
> >     - shard-rkl:          NOTRUN -> [SKIP][8] ([i915#7701])
> >    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-rkl-4/igt@device_reset@unbind-cold-reset-rebind.html
> >     - shard-dg1:          NOTRUN -> [SKIP][9] ([i915#7701])
> >    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg1-13/igt@device_reset@unbind-cold-reset-rebind.html
> > 
> >   * igt@drm_fdinfo@busy-check-all@bcs0:
> >     - shard-dg1:          NOTRUN -> [SKIP][10] ([i915#8414]) +12 other tests skip
> >    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg1-15/igt@drm_fdinfo@busy-check-all@bcs0.html
> > 
> >   * igt@drm_fdinfo@busy@bcs0:
> >     - shard-mtlp:         NOTRUN -> [SKIP][11] ([i915#8414]) +6 other tests skip
> >    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-mtlp-1/igt@drm_fdinfo@busy@bcs0.html
> > 
> >   * igt@drm_fdinfo@isolation@vcs1:
> >     - shard-dg2:          NOTRUN -> [SKIP][12] ([i915#8414]) +7 other tests skip
> >    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg2-5/igt@drm_fdinfo@isolation@vcs1.html
> > 
> >   * igt@drm_fdinfo@virtual-idle:
> >     - shard-rkl:          [PASS][13] -> [FAIL][14] ([i915#7742]) +1 other test fail
> >    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7807/shard-rkl-5/igt@drm_fdinfo@virtual-idle.html
> >    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-rkl-3/igt@drm_fdinfo@virtual-idle.html
> > 
> >   * igt@gem_ccs@block-copy-compressed:
> >     - shard-dg1:          NOTRUN -> [SKIP][15] ([i915#3555] / [i915#9323]) +1 other test skip
> >    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg1-17/igt@gem_ccs@block-copy-compressed.html
> > 
> >   * igt@gem_ccs@block-multicopy-compressed:
> >     - shard-rkl:          NOTRUN -> [SKIP][16] ([i915#9323])
> >    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-rkl-3/igt@gem_ccs@block-multicopy-compressed.html
> > 
> >   * igt@gem_ccs@ctrl-surf-copy-new-ctx:
> >     - shard-dg1:          NOTRUN -> [SKIP][17] ([i915#9323])
> >    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg1-13/igt@gem_ccs@ctrl-surf-copy-new-ctx.html
> > 
> >   * igt@gem_ccs@suspend-resume:
> >     - shard-mtlp:         NOTRUN -> [SKIP][18] ([i915#9323])
> >    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-mtlp-4/igt@gem_ccs@suspend-resume.html
> > 
> >   * igt@gem_close_race@multigpu-basic-process:
> >     - shard-tglu:         NOTRUN -> [SKIP][19] ([i915#7697]) +1 other test skip
> >    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-tglu-2/igt@gem_close_race@multigpu-basic-process.html
> >     - shard-dg1:          NOTRUN -> [SKIP][20] ([i915#7697])
> >    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg1-15/igt@gem_close_race@multigpu-basic-process.html
> > 
> >   * igt@gem_compute@compute-square:
> >     - shard-mtlp:         NOTRUN -> [SKIP][21] ([i915#9310])
> >    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-mtlp-5/igt@gem_compute@compute-square.html
> > 
> >   * igt@gem_create@create-ext-set-pat:
> >     - shard-tglu:         NOTRUN -> [SKIP][22] ([i915#8562])
> >    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-tglu-7/igt@gem_create@create-ext-set-pat.html
> > 
> >   * igt@gem_ctx_persistence@heartbeat-close:
> >     - shard-mtlp:         NOTRUN -> [SKIP][23] ([i915#8555])
> >    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-mtlp-4/igt@gem_ctx_persistence@heartbeat-close.html
> > 
> >   * igt@gem_ctx_persistence@heartbeat-hang:
> >     - shard-dg1:          NOTRUN -> [SKIP][24] ([i915#8555])
> >    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg1-17/igt@gem_ctx_persistence@heartbeat-hang.html
> > 
> >   * igt@gem_ctx_sseu@invalid-args:
> >     - shard-dg2:          NOTRUN -> [SKIP][25] ([i915#280])
> >    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg2-2/igt@gem_ctx_sseu@invalid-args.html
> >     - shard-dg1:          NOTRUN -> [SKIP][26] ([i915#280])
> >    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg1-14/igt@gem_ctx_sseu@invalid-args.html
> > 
> >   * igt@gem_ctx_sseu@mmap-args:
> >     - shard-mtlp:         NOTRUN -> [SKIP][27] ([i915#280])
> >    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-mtlp-2/igt@gem_ctx_sseu@mmap-args.html
> > 
> >   * igt@gem_eio@hibernate:
> >     - shard-rkl:          NOTRUN -> [ABORT][28] ([i915#7975] / [i915#8213])
> >    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-rkl-2/igt@gem_eio@hibernate.html
> > 
> >   * igt@gem_eio@kms:
> >     - shard-tglu:         [PASS][29] -> [INCOMPLETE][30] ([i915#10513])
> >    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7807/shard-tglu-9/igt@gem_eio@kms.html
> >    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-tglu-4/igt@gem_eio@kms.html
> >     - shard-dg1:          NOTRUN -> [INCOMPLETE][31] ([i915#10513] / [i915#1982])
> >    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg1-15/igt@gem_eio@kms.html
> > 
> >   * igt@gem_eio@reset-stress:
> >     - shard-dg1:          NOTRUN -> [FAIL][32] ([i915#5784])
> >    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg1-16/igt@gem_eio@reset-stress.html
> > 
> >   * igt@gem_exec_balancer@bonded-semaphore:
> >     - shard-dg1:          NOTRUN -> [SKIP][33] ([i915#4812]) +3 other tests skip
> >    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg1-18/igt@gem_exec_balancer@bonded-semaphore.html
> > 
> >   * igt@gem_exec_balancer@bonded-sync:
> >     - shard-dg2:          NOTRUN -> [SKIP][34] ([i915#4771])
> >    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg2-8/igt@gem_exec_balancer@bonded-sync.html
> > 
> >   * igt@gem_exec_balancer@invalid-bonds:
> >     - shard-mtlp:         NOTRUN -> [SKIP][35] ([i915#4036])
> >    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-mtlp-4/igt@gem_exec_balancer@invalid-bonds.html
> > 
> >   * igt@gem_exec_balancer@noheartbeat:
> >     - shard-dg2:          NOTRUN -> [SKIP][36] ([i915#8555])
> >    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg2-5/igt@gem_exec_balancer@noheartbeat.html
> > 
> >   * igt@gem_exec_balancer@parallel:
> >     - shard-rkl:          NOTRUN -> [SKIP][37] ([i915#4525]) +2 other tests skip
> >    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-rkl-5/igt@gem_exec_balancer@parallel.html
> > 
> >   * igt@gem_exec_capture@capture-invisible@smem0:
> >     - shard-mtlp:         NOTRUN -> [SKIP][38] ([i915#6334])
> >    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-mtlp-4/igt@gem_exec_capture@capture-invisible@smem0.html
> > 
> >   * igt@gem_exec_capture@many-4k-incremental:
> >     - shard-dg1:          NOTRUN -> [FAIL][39] ([i915#9606])
> >    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg1-14/igt@gem_exec_capture@many-4k-incremental.html
> > 
> >   * igt@gem_exec_capture@many-4k-zero:
> >     - shard-glk:          NOTRUN -> [FAIL][40] ([i915#9606])
> >    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-glk4/igt@gem_exec_capture@many-4k-zero.html
> > 
> >   * igt@gem_exec_fair@basic-none-rrul:
> >     - shard-dg1:          NOTRUN -> [SKIP][41] ([i915#3539] / [i915#4852]) +2 other tests skip
> >    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg1-18/igt@gem_exec_fair@basic-none-rrul.html
> >     - shard-mtlp:         NOTRUN -> [SKIP][42] ([i915#4473] / [i915#4771])
> >    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-mtlp-3/igt@gem_exec_fair@basic-none-rrul.html
> > 
> >   * igt@gem_exec_fair@basic-none-share@rcs0:
> >     - shard-tglu:         NOTRUN -> [FAIL][43] ([i915#2842])
> >    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-tglu-6/igt@gem_exec_fair@basic-none-share@rcs0.html
> > 
> >   * igt@gem_exec_fair@basic-none-vip@rcs0:
> >     - shard-rkl:          NOTRUN -> [FAIL][44] ([i915#2842])
> >    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-rkl-4/igt@gem_exec_fair@basic-none-vip@rcs0.html
> > 
> >   * igt@gem_exec_fair@basic-pace:
> >     - shard-dg1:          NOTRUN -> [SKIP][45] ([i915#3539])
> >    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg1-17/igt@gem_exec_fair@basic-pace.html
> > 
> >   * igt@gem_exec_fair@basic-pace-solo@rcs0:
> >     - shard-tglu:         [PASS][46] -> [FAIL][47] ([i915#2842])
> >    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7807/shard-tglu-2/igt@gem_exec_fair@basic-pace-solo@rcs0.html
> >    [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-tglu-3/igt@gem_exec_fair@basic-pace-solo@rcs0.html
> > 
> >   * igt@gem_exec_fair@basic-pace@rcs0:
> >     - shard-tglu:         [PASS][48] -> [FAIL][49] ([i915#2876])
> >    [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7807/shard-tglu-7/igt@gem_exec_fair@basic-pace@rcs0.html
> >    [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-tglu-9/igt@gem_exec_fair@basic-pace@rcs0.html
> > 
> >   * igt@gem_exec_fair@basic-throttle@rcs0:
> >     - shard-rkl:          [PASS][50] -> [FAIL][51] ([i915#2842])
> >    [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7807/shard-rkl-4/igt@gem_exec_fair@basic-throttle@rcs0.html
> >    [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-rkl-5/igt@gem_exec_fair@basic-throttle@rcs0.html
> > 
> >   * igt@gem_exec_fence@submit67:
> >     - shard-dg2:          NOTRUN -> [SKIP][52] ([i915#4812]) +2 other tests skip
> >    [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg2-2/igt@gem_exec_fence@submit67.html
> > 
> >   * igt@gem_exec_reloc@basic-concurrent0:
> >     - shard-dg1:          NOTRUN -> [SKIP][53] ([i915#3281]) +12 other tests skip
> >    [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg1-17/igt@gem_exec_reloc@basic-concurrent0.html
> >     - shard-mtlp:         NOTRUN -> [SKIP][54] ([i915#3281]) +3 other tests skip
> >    [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-mtlp-7/igt@gem_exec_reloc@basic-concurrent0.html
> > 
> >   * igt@gem_exec_reloc@basic-gtt:
> >     - shard-dg2:          NOTRUN -> [SKIP][55] ([i915#3281]) +8 other tests skip
> >    [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg2-7/igt@gem_exec_reloc@basic-gtt.html
> > 
> >   * igt@gem_exec_reloc@basic-write-read:
> >     - shard-rkl:          NOTRUN -> [SKIP][56] ([i915#3281]) +15 other tests skip
> >    [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-rkl-5/igt@gem_exec_reloc@basic-write-read.html
> > 
> >   * igt@gem_exec_schedule@preempt-queue:
> >     - shard-mtlp:         NOTRUN -> [SKIP][57] ([i915#4537] / [i915#4812])
> >    [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-mtlp-7/igt@gem_exec_schedule@preempt-queue.html
> > 
> >   * igt@gem_exec_schedule@semaphore-power:
> >     - shard-rkl:          NOTRUN -> [SKIP][58] ([i915#7276])
> >    [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-rkl-5/igt@gem_exec_schedule@semaphore-power.html
> > 
> >   * igt@gem_fenced_exec_thrash@no-spare-fences-busy:
> >     - shard-dg1:          NOTRUN -> [SKIP][59] ([i915#4860]) +4 other tests skip
> >    [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg1-14/igt@gem_fenced_exec_thrash@no-spare-fences-busy.html
> > 
> >   * igt@gem_huc_copy@huc-copy:
> >     - shard-rkl:          NOTRUN -> [SKIP][60] ([i915#2190])
> >    [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-rkl-5/igt@gem_huc_copy@huc-copy.html
> > 
> >   * igt@gem_lmem_evict@dontneed-evict-race:
> >     - shard-tglu:         NOTRUN -> [SKIP][61] ([i915#4613] / [i915#7582])
> >    [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-tglu-6/igt@gem_lmem_evict@dontneed-evict-race.html
> > 
> >   * igt@gem_lmem_swapping@heavy-random@lmem0:
> >     - shard-dg1:          NOTRUN -> [FAIL][62] ([i915#10378]) +1 other test fail
> >    [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg1-14/igt@gem_lmem_swapping@heavy-random@lmem0.html
> > 
> >   * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
> >     - shard-mtlp:         NOTRUN -> [SKIP][63] ([i915#4613]) +1 other test skip
> >    [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-mtlp-5/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html
> > 
> >   * igt@gem_lmem_swapping@parallel-multi:
> >     - shard-tglu:         NOTRUN -> [SKIP][64] ([i915#4613]) +2 other tests skip
> >    [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-tglu-4/igt@gem_lmem_swapping@parallel-multi.html
> > 
> >   * igt@gem_lmem_swapping@parallel-random-verify:
> >     - shard-rkl:          NOTRUN -> [SKIP][65] ([i915#4613]) +5 other tests skip
> >    [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-rkl-5/igt@gem_lmem_swapping@parallel-random-verify.html
> > 
> >   * igt@gem_lmem_swapping@verify-ccs:
> >     - shard-glk:          NOTRUN -> [SKIP][66] ([i915#4613]) +3 other tests skip
> >    [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-glk7/igt@gem_lmem_swapping@verify-ccs.html
> > 
> >   * igt@gem_lmem_swapping@verify-random-ccs@lmem0:
> >     - shard-dg1:          NOTRUN -> [SKIP][67] ([i915#4565]) +2 other tests skip
> >    [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg1-16/igt@gem_lmem_swapping@verify-random-ccs@lmem0.html
> > 
> >   * igt@gem_mmap_gtt@basic-write-read:
> >     - shard-mtlp:         NOTRUN -> [SKIP][68] ([i915#4077]) +4 other tests skip
> >    [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-mtlp-2/igt@gem_mmap_gtt@basic-write-read.html
> > 
> >   * igt@gem_mmap_gtt@coherency:
> >     - shard-dg1:          NOTRUN -> [SKIP][69] ([i915#4077]) +13 other tests skip
> >    [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg1-13/igt@gem_mmap_gtt@coherency.html
> > 
> >   * igt@gem_mmap_wc@write-cpu-read-wc-unflushed:
> >     - shard-dg1:          NOTRUN -> [SKIP][70] ([i915#4083]) +5 other tests skip
> >    [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg1-13/igt@gem_mmap_wc@write-cpu-read-wc-unflushed.html
> > 
> >   * igt@gem_mmap_wc@write-prefaulted:
> >     - shard-dg2:          NOTRUN -> [SKIP][71] ([i915#4083]) +1 other test skip
> >    [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg2-6/igt@gem_mmap_wc@write-prefaulted.html
> > 
> >   * igt@gem_partial_pwrite_pread@reads:
> >     - shard-dg2:          NOTRUN -> [SKIP][72] ([i915#3282]) +5 other tests skip
> >    [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg2-6/igt@gem_partial_pwrite_pread@reads.html
> >     - shard-dg1:          NOTRUN -> [SKIP][73] ([i915#3282]) +7 other tests skip
> >    [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg1-18/igt@gem_partial_pwrite_pread@reads.html
> > 
> >   * igt@gem_pwrite@basic-exhaustion:
> >     - shard-snb:          NOTRUN -> [WARN][74] ([i915#2658])
> >    [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-snb1/igt@gem_pwrite@basic-exhaustion.html
> > 
> >   * igt@gem_pwrite@basic-self:
> >     - shard-rkl:          NOTRUN -> [SKIP][75] ([i915#3282]) +4 other tests skip
> >    [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-rkl-4/igt@gem_pwrite@basic-self.html
> > 
> >   * igt@gem_pxp@protected-encrypted-src-copy-not-readible:
> >     - shard-rkl:          NOTRUN -> [SKIP][76] ([i915#4270]) +3 other tests skip
> >    [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-rkl-4/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html
> > 
> >   * igt@gem_pxp@reject-modify-context-protection-off-3:
> >     - shard-mtlp:         NOTRUN -> [SKIP][77] ([i915#4270]) +1 other test skip
> >    [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-mtlp-4/igt@gem_pxp@reject-modify-context-protection-off-3.html
> > 
> >   * igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:
> >     - shard-dg1:          NOTRUN -> [SKIP][78] ([i915#4270]) +1 other test skip
> >    [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg1-18/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html
> > 
> >   * igt@gem_pxp@verify-pxp-stale-buf-optout-execution:
> >     - shard-dg2:          NOTRUN -> [SKIP][79] ([i915#4270]) +1 other test skip
> >    [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg2-6/igt@gem_pxp@verify-pxp-stale-buf-optout-execution.html
> > 
> >   * igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs:
> >     - shard-mtlp:         NOTRUN -> [SKIP][80] ([i915#8428]) +2 other tests skip
> >    [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-mtlp-3/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs.html
> > 
> >   * igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled:
> >     - shard-dg2:          NOTRUN -> [SKIP][81] ([i915#5190] / [i915#8428]) +3 other tests skip
> >    [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg2-10/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled.html
> > 
> >   * igt@gem_set_tiling_vs_blt@tiled-to-tiled:
> >     - shard-mtlp:         NOTRUN -> [SKIP][82] ([i915#4079])
> >    [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-mtlp-4/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html
> > 
> >   * igt@gem_set_tiling_vs_blt@untiled-to-tiled:
> >     - shard-dg1:          NOTRUN -> [SKIP][83] ([i915#4079])
> >    [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg1-13/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html
> >     - shard-rkl:          NOTRUN -> [SKIP][84] ([i915#8411])
> >    [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-rkl-4/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html
> > 
> >   * igt@gem_spin_batch@spin-all-new:
> >     - shard-dg2:          NOTRUN -> [FAIL][85] ([i915#5889])
> >    [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg2-11/igt@gem_spin_batch@spin-all-new.html
> > 
> >   * igt@gem_tiled_partial_pwrite_pread@writes:
> >     - shard-dg2:          NOTRUN -> [SKIP][86] ([i915#4077]) +13 other tests skip
> >    [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg2-10/igt@gem_tiled_partial_pwrite_pread@writes.html
> > 
> >   * igt@gem_unfence_active_buffers:
> >     - shard-mtlp:         NOTRUN -> [SKIP][87] ([i915#4879])
> >    [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-mtlp-2/igt@gem_unfence_active_buffers.html
> > 
> >   * igt@gem_userptr_blits@dmabuf-sync:
> >     - shard-tglu:         NOTRUN -> [SKIP][88] ([i915#3323])
> >    [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-tglu-3/igt@gem_userptr_blits@dmabuf-sync.html
> > 
> >   * igt@gem_userptr_blits@forbidden-operations:
> >     - shard-dg2:          NOTRUN -> [SKIP][89] ([i915#3282] / [i915#3297])
> >    [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg2-11/igt@gem_userptr_blits@forbidden-operations.html
> > 
> >   * igt@gem_userptr_blits@invalid-mmap-offset-unsync:
> >     - shard-mtlp:         NOTRUN -> [SKIP][90] ([i915#3297]) +2 other tests skip
> >    [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-mtlp-7/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html
> > 
> >   * igt@gem_userptr_blits@readonly-unsync:
> >     - shard-rkl:          NOTRUN -> [SKIP][91] ([i915#3297]) +1 other test skip
> >    [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-rkl-5/igt@gem_userptr_blits@readonly-unsync.html
> >     - shard-tglu:         NOTRUN -> [SKIP][92] ([i915#3297])
> >    [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-tglu-6/igt@gem_userptr_blits@readonly-unsync.html
> > 
> >   * igt@gem_userptr_blits@sd-probe:
> >     - shard-dg1:          NOTRUN -> [SKIP][93] ([i915#3297] / [i915#4958])
> >    [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg1-17/igt@gem_userptr_blits@sd-probe.html
> > 
> >   * igt@gem_userptr_blits@unsync-unmap-after-close:
> >     - shard-dg1:          NOTRUN -> [SKIP][94] ([i915#3297]) +2 other tests skip
> >    [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg1-16/igt@gem_userptr_blits@unsync-unmap-after-close.html
> > 
> >   * igt@gen9_exec_parse@batch-invalid-length:
> >     - shard-rkl:          NOTRUN -> [SKIP][95] ([i915#2527]) +3 other tests skip
> >    [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-rkl-3/igt@gen9_exec_parse@batch-invalid-length.html
> >     - shard-dg1:          NOTRUN -> [SKIP][96] ([i915#2527]) +4 other tests skip
> >    [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg1-15/igt@gen9_exec_parse@batch-invalid-length.html
> > 
> >   * igt@gen9_exec_parse@bb-chained:
> >     - shard-tglu:         NOTRUN -> [SKIP][97] ([i915#2527] / [i915#2856]) +1 other test skip
> >    [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-tglu-5/igt@gen9_exec_parse@bb-chained.html
> > 
> >   * igt@gen9_exec_parse@bb-start-cmd:
> >     - shard-mtlp:         NOTRUN -> [SKIP][98] ([i915#2856]) +1 other test skip
> >    [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-mtlp-4/igt@gen9_exec_parse@bb-start-cmd.html
> > 
> >   * igt@gen9_exec_parse@unaligned-access:
> >     - shard-dg2:          NOTRUN -> [SKIP][99] ([i915#2856]) +6 other tests skip
> >    [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg2-6/igt@gen9_exec_parse@unaligned-access.html
> > 
> >   * igt@i915_module_load@reload-with-fault-injection:
> >     - shard-snb:          [PASS][100] -> [INCOMPLETE][101] ([i915#9849])
> >    [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7807/shard-snb2/igt@i915_module_load@reload-with-fault-injection.html
> >    [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-snb4/igt@i915_module_load@reload-with-fault-injection.html
> > 
> >   * igt@i915_pm_freq_api@freq-reset-multiple:
> >     - shard-rkl:          NOTRUN -> [SKIP][102] ([i915#8399])
> >    [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-rkl-4/igt@i915_pm_freq_api@freq-reset-multiple.html
> > 
> >   * igt@i915_pm_freq_mult@media-freq@gt1:
> >     - shard-mtlp:         NOTRUN -> [SKIP][103] ([i915#6590]) +1 other test skip
> >    [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-mtlp-4/igt@i915_pm_freq_mult@media-freq@gt1.html
> > 
> >   * igt@i915_pm_sseu@full-enable:
> >     - shard-dg2:          NOTRUN -> [SKIP][104] ([i915#4387])
> >    [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg2-8/igt@i915_pm_sseu@full-enable.html
> > 
> >   * igt@i915_query@hwconfig_table:
> >     - shard-rkl:          NOTRUN -> [SKIP][105] ([i915#6245])
> >    [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-rkl-4/igt@i915_query@hwconfig_table.html
> > 
> >   * igt@i915_query@query-topology-coherent-slice-mask:
> >     - shard-dg2:          NOTRUN -> [SKIP][106] ([i915#6188])
> >    [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg2-10/igt@i915_query@query-topology-coherent-slice-mask.html
> > 
> >   * igt@i915_selftest@live@guc_multi_lrc:
> >     - shard-dg2:          [PASS][107] -> [ABORT][108] ([i915#10366])
> >    [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7807/shard-dg2-4/igt@i915_selftest@live@guc_multi_lrc.html
> >    [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg2-5/igt@i915_selftest@live@guc_multi_lrc.html
> > 
> >   * igt@i915_selftest@mock@memory_region:
> >     - shard-dg1:          NOTRUN -> [DMESG-WARN][109] ([i915#9311])
> >    [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg1-17/igt@i915_selftest@mock@memory_region.html
> > 
> >   * igt@intel_hwmon@hwmon-write:
> >     - shard-rkl:          NOTRUN -> [SKIP][110] ([i915#7707])
> >    [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-rkl-5/igt@intel_hwmon@hwmon-write.html
> > 
> >   * igt@kms_addfb_basic@clobberred-modifier:
> >     - shard-dg2:          NOTRUN -> [SKIP][111] ([i915#4212])
> >    [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg2-11/igt@kms_addfb_basic@clobberred-modifier.html
> > 
> >   * igt@kms_addfb_basic@framebuffer-vs-set-tiling:
> >     - shard-dg1:          NOTRUN -> [SKIP][112] ([i915#4212]) +2 other tests skip
> >    [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg1-15/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html
> > 
> >   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-3-4-mc-ccs:
> >     - shard-dg2:          NOTRUN -> [SKIP][113] ([i915#8709]) +11 other tests skip
> >    [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg2-7/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-3-4-mc-ccs.html
> > 
> >   * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
> >     - shard-rkl:          NOTRUN -> [SKIP][114] ([i915#1769] / [i915#3555])
> >    [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-rkl-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
> >     - shard-dg1:          NOTRUN -> [SKIP][115] ([i915#1769] / [i915#3555])
> >    [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg1-17/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
> > 
> >   * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
> >     - shard-tglu:         NOTRUN -> [SKIP][116] ([i915#1769] / [i915#3555])
> >    [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-tglu-8/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
> > 
> >   * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
> >     - shard-tglu:         NOTRUN -> [SKIP][117] ([i915#5286]) +2 other tests skip
> >    [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-tglu-8/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
> > 
> >   * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
> >     - shard-dg1:          NOTRUN -> [SKIP][118] ([i915#4538] / [i915#5286]) +7 other tests skip
> >    [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg1-18/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html
> > 
> >   * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
> >     - shard-rkl:          NOTRUN -> [SKIP][119] ([i915#5286]) +10 other tests skip
> >    [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-rkl-3/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
> > 
> >   * igt@kms_big_fb@4-tiled-addfb-size-overflow:
> >     - shard-dg1:          NOTRUN -> [SKIP][120] ([i915#5286])
> >    [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg1-16/igt@kms_big_fb@4-tiled-addfb-size-overflow.html
> > 
> >   * igt@kms_big_fb@linear-8bpp-rotate-270:
> >     - shard-dg1:          NOTRUN -> [SKIP][121] ([i915#3638]) +4 other tests skip
> >    [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg1-15/igt@kms_big_fb@linear-8bpp-rotate-270.html
> > 
> >   * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
> >     - shard-rkl:          NOTRUN -> [SKIP][122] ([i915#3638]) +5 other tests skip
> >    [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-rkl-1/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html
> > 
> >   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
> >     - shard-dg2:          NOTRUN -> [SKIP][123] ([i915#4538] / [i915#5190]) +7 other tests skip
> >    [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg2-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
> > 
> >   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
> >     - shard-dg1:          NOTRUN -> [SKIP][124] ([i915#4538]) +6 other tests skip
> >    [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg1-13/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html
> > 
> >   * igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-d-hdmi-a-1:
> >     - shard-tglu:         NOTRUN -> [SKIP][125] ([i915#6095]) +15 other tests skip
> >    [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-tglu-8/igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-d-hdmi-a-1.html
> > 
> >   * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4:
> >     - shard-dg2:          NOTRUN -> [SKIP][126] ([i915#10307] / [i915#6095]) +169 other tests skip
> >    [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg2-11/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html
> > 
> >   * igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs:
> >     - shard-tglu:         NOTRUN -> [SKIP][127] ([i915#10278]) +1 other test skip
> >    [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-tglu-8/igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs.html
> > 
> >   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1:
> >     - shard-dg2:          NOTRUN -> [SKIP][128] ([i915#10307] / [i915#10434] / [i915#6095]) +5 other tests skip
> >    [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg2-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1.html
> > 
> >   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs:
> >     - shard-rkl:          NOTRUN -> [SKIP][129] ([i915#10278]) +2 other tests skip
> >    [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-rkl-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html
> > 
> >   * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-4:
> >     - shard-dg1:          NOTRUN -> [SKIP][130] ([i915#6095]) +91 other tests skip
> >    [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg1-14/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-4.html
> > 
> >   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2:
> >     - shard-rkl:          NOTRUN -> [SKIP][131] ([i915#6095]) +57 other tests skip
> >    [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-rkl-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2.html
> > 
> >   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-edp-1:
> >     - shard-mtlp:         NOTRUN -> [SKIP][132] ([i915#6095]) +11 other tests skip
> >    [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-mtlp-6/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-edp-1.html
> > 
> >   * igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs:
> >     - shard-dg1:          NOTRUN -> [SKIP][133] ([i915#10278])
> >    [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg1-17/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html
> > 
> >   * igt@kms_chamelium_color@ctm-max:
> >     - shard-mtlp:         NOTRUN -> [SKIP][134] +9 other tests skip
> >    [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-mtlp-3/igt@kms_chamelium_color@ctm-max.html
> > 
> >   * igt@kms_chamelium_edid@dp-edid-resolution-list:
> >     - shard-tglu:         NOTRUN -> [SKIP][135] ([i915#7828]) +3 other tests skip
> >    [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-tglu-2/igt@kms_chamelium_edid@dp-edid-resolution-list.html
> > 
> >   * igt@kms_chamelium_frames@dp-frame-dump:
> >     - shard-dg2:          NOTRUN -> [SKIP][136] ([i915#7828]) +6 other tests skip
> >    [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg2-8/igt@kms_chamelium_frames@dp-frame-dump.html
> > 
> >   * igt@kms_chamelium_frames@vga-frame-dump:
> >     - shard-rkl:          NOTRUN -> [SKIP][137] ([i915#7828]) +9 other tests skip
> >    [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-rkl-5/igt@kms_chamelium_frames@vga-frame-dump.html
> > 
> >   * igt@kms_chamelium_hpd@dp-hpd-after-suspend:
> >     - shard-dg1:          NOTRUN -> [SKIP][138] ([i915#7828]) +7 other tests skip
> >    [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg1-16/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html
> > 
> >   * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
> >     - shard-mtlp:         NOTRUN -> [SKIP][139] ([i915#7828]) +2 other tests skip
> >    [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-mtlp-6/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
> > 
> >   * igt@kms_content_protection@atomic-dpms:
> >     - shard-rkl:          NOTRUN -> [SKIP][140] ([i915#7118] / [i915#9424]) +1 other test skip
> >    [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-rkl-5/igt@kms_content_protection@atomic-dpms.html
> > 
> >   * igt@kms_content_protection@atomic@pipe-a-dp-4:
> >     - shard-dg2:          NOTRUN -> [TIMEOUT][141] ([i915#7173])
> >    [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg2-11/igt@kms_content_protection@atomic@pipe-a-dp-4.html
> > 
> >   * igt@kms_content_protection@content-type-change:
> >     - shard-tglu:         NOTRUN -> [SKIP][142] ([i915#6944] / [i915#9424])
> >    [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-tglu-4/igt@kms_content_protection@content-type-change.html
> >     - shard-dg1:          NOTRUN -> [SKIP][143] ([i915#9424])
> >    [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg1-16/igt@kms_content_protection@content-type-change.html
> > 
> >   * igt@kms_content_protection@dp-mst-type-1:
> >     - shard-dg1:          NOTRUN -> [SKIP][144] ([i915#3299])
> >    [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg1-16/igt@kms_content_protection@dp-mst-type-1.html
> > 
> >   * igt@kms_cursor_crc@cursor-offscreen-32x10:
> >     - shard-tglu:         NOTRUN -> [SKIP][145] ([i915#3555])
> >    [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-tglu-3/igt@kms_cursor_crc@cursor-offscreen-32x10.html
> > 
> >   * igt@kms_cursor_crc@cursor-offscreen-32x32:
> >     - shard-dg1:          NOTRUN -> [SKIP][146] ([i915#3555]) +8 other tests skip
> >    [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg1-16/igt@kms_cursor_crc@cursor-offscreen-32x32.html
> > 
> >   * igt@kms_cursor_crc@cursor-offscreen-512x512:
> >     - shard-tglu:         NOTRUN -> [SKIP][147] ([i915#3359])
> >    [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-tglu-10/igt@kms_cursor_crc@cursor-offscreen-512x512.html
> > 
> >   * igt@kms_cursor_crc@cursor-onscreen-32x32:
> >     - shard-rkl:          NOTRUN -> [SKIP][148] ([i915#3555]) +8 other tests skip
> >    [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-rkl-3/igt@kms_cursor_crc@cursor-onscreen-32x32.html
> > 
> >   * igt@kms_cursor_crc@cursor-random-512x170:
> >     - shard-dg2:          NOTRUN -> [SKIP][149] ([i915#3359]) +1 other test skip
> >    [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg2-8/igt@kms_cursor_crc@cursor-random-512x170.html
> > 
> >   * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
> >     - shard-mtlp:         NOTRUN -> [SKIP][150] ([i915#3359])
> >    [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-mtlp-7/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
> >     - shard-dg1:          NOTRUN -> [SKIP][151] ([i915#3359])
> >    [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg1-15/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
> > 
> >   * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
> >     - shard-dg2:          NOTRUN -> [SKIP][152] ([i915#3555]) +8 other tests skip
> >    [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg2-8/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html
> > 
> >   * igt@kms_cursor_crc@cursor-sliding-128x42:
> >     - shard-mtlp:         NOTRUN -> [SKIP][153] ([i915#8814]) +1 other test skip
> >    [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-mtlp-2/igt@kms_cursor_crc@cursor-sliding-128x42.html
> > 
> >   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
> >     - shard-dg1:          NOTRUN -> [SKIP][154] ([i915#4103] / [i915#4213]) +1 other test skip
> >    [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg1-16/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
> > 
> >   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
> >     - shard-dg2:          NOTRUN -> [SKIP][155] ([i915#4103] / [i915#4213])
> >    [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg2-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
> > 
> >   * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
> >     - shard-mtlp:         NOTRUN -> [SKIP][156] ([i915#9809]) +3 other tests skip
> >    [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-mtlp-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
> > 
> >   * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
> >     - shard-dg1:          NOTRUN -> [SKIP][157] ([i915#9067])
> >    [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg1-15/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html
> > 
> >   * igt@kms_cursor_legacy@torture-move@pipe-a:
> >     - shard-tglu:         NOTRUN -> [DMESG-WARN][158] ([i915#10166] / [i915#1982])
> >    [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-tglu-7/igt@kms_cursor_legacy@torture-move@pipe-a.html
> > 
> >   * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-1:
> >     - shard-dg2:          NOTRUN -> [SKIP][159] ([i915#9227])
> >    [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg2-4/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-1.html
> > 
> >   * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
> >     - shard-rkl:          NOTRUN -> [SKIP][160] ([i915#9723]) +1 other test skip
> >    [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-rkl-3/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
> > 
> >   * igt@kms_display_modes@mst-extended-mode-negative:
> >     - shard-dg2:          NOTRUN -> [SKIP][161] ([i915#8588])
> >    [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg2-6/igt@kms_display_modes@mst-extended-mode-negative.html
> >     - shard-dg1:          NOTRUN -> [SKIP][162] ([i915#8588])
> >    [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg1-18/igt@kms_display_modes@mst-extended-mode-negative.html
> > 
> >   * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:
> >     - shard-rkl:          NOTRUN -> [SKIP][163] ([i915#3804])
> >    [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-rkl-5/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html
> > 
> >   * igt@kms_dsc@dsc-with-bpc-formats:
> >     - shard-tglu:         NOTRUN -> [SKIP][164] ([i915#3555] / [i915#3840])
> >    [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-tglu-6/igt@kms_dsc@dsc-with-bpc-formats.html
> > 
> >   * igt@kms_dsc@dsc-with-formats:
> >     - shard-rkl:          NOTRUN -> [SKIP][165] ([i915#3555] / [i915#3840])
> >    [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-rkl-5/igt@kms_dsc@dsc-with-formats.html
> > 
> >   * igt@kms_dsc@dsc-with-output-formats:
> >     - shard-dg2:          NOTRUN -> [SKIP][166] ([i915#3555] / [i915#3840]) +1 other test skip
> >    [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg2-6/igt@kms_dsc@dsc-with-output-formats.html
> > 
> >   * igt@kms_fbcon_fbt@psr:
> >     - shard-rkl:          NOTRUN -> [SKIP][167] ([i915#3955])
> >    [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-rkl-5/igt@kms_fbcon_fbt@psr.html
> >     - shard-tglu:         NOTRUN -> [SKIP][168] ([i915#3469])
> >    [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-tglu-6/igt@kms_fbcon_fbt@psr.html
> > 
> >   * igt@kms_fbcon_fbt@psr-suspend:
> >     - shard-dg2:          NOTRUN -> [SKIP][169] ([i915#3469])
> >    [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg2-7/igt@kms_fbcon_fbt@psr-suspend.html
> > 
> >   * igt@kms_feature_discovery@display-2x:
> >     - shard-rkl:          NOTRUN -> [SKIP][170] ([i915#1839])
> >    [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-rkl-5/igt@kms_feature_discovery@display-2x.html
> > 
> >   * igt@kms_feature_discovery@display-3x:
> >     - shard-dg2:          NOTRUN -> [SKIP][171] ([i915#1839])
> >    [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg2-6/igt@kms_feature_discovery@display-3x.html
> > 
> >   * igt@kms_feature_discovery@display-4x:
> >     - shard-dg1:          NOTRUN -> [SKIP][172] ([i915#1839])
> >    [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg1-15/igt@kms_feature_discovery@display-4x.html
> >     - shard-mtlp:         NOTRUN -> [SKIP][173] ([i915#1839])
> >    [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-mtlp-6/igt@kms_feature_discovery@display-4x.html
> > 
> >   * igt@kms_feature_discovery@dp-mst:
> >     - shard-dg1:          NOTRUN -> [SKIP][174] ([i915#9337])
> >    [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg1-17/igt@kms_feature_discovery@dp-mst.html
> >     - shard-mtlp:         NOTRUN -> [SKIP][175] ([i915#9337])
> >    [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-mtlp-7/igt@kms_feature_discovery@dp-mst.html
> > 
> >   * igt@kms_fence_pin_leak:
> >     - shard-dg1:          NOTRUN -> [SKIP][176] ([i915#4881])
> >    [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg1-14/igt@kms_fence_pin_leak.html
> >     - shard-mtlp:         NOTRUN -> [SKIP][177] ([i915#4881])
> >    [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-mtlp-1/igt@kms_fence_pin_leak.html
> > 
> >   * igt@kms_flip@2x-blocking-absolute-wf_vblank:
> >     - shard-tglu:         NOTRUN -> [SKIP][178] ([i915#3637]) +2 other tests skip
> >    [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-tglu-4/igt@kms_flip@2x-blocking-absolute-wf_vblank.html
> > 
> >   * igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
> >     - shard-mtlp:         NOTRUN -> [SKIP][179] ([i915#3637]) +2 other tests skip
> >    [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-mtlp-7/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html
> > 
> >   * igt@kms_flip@2x-flip-vs-fences-interruptible:
> >     - shard-dg1:          NOTRUN -> [SKIP][180] ([i915#8381])
> >    [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg1-17/igt@kms_flip@2x-flip-vs-fences-interruptible.html
> > 
> >   * igt@kms_flip@2x-flip-vs-modeset-vs-hang:
> >     - shard-dg2:          NOTRUN -> [SKIP][181] +19 other tests skip
> >    [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg2-11/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html
> > 
> >   * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
> >     - shard-dg1:          NOTRUN -> [SKIP][182] ([i915#9934]) +9 other tests skip
> >    [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg1-17/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
> > 
> >   * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-default-mode:
> >     - shard-mtlp:         NOTRUN -> [SKIP][183] ([i915#2672])
> >    [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-default-mode.html
> > 
> >   * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode:
> >     - shard-dg1:          NOTRUN -> [SKIP][184] ([i915#2587] / [i915#2672]) +2 other tests skip
> >    [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg1-18/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html
> > 
> >   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode:
> >     - shard-tglu:         NOTRUN -> [SKIP][185] ([i915#2587] / [i915#2672]) +2 other tests skip
> >    [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-tglu-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode.html
> > 
> >   * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:
> >     - shard-rkl:          NOTRUN -> [SKIP][186] ([i915#2672]) +5 other tests skip
> >    [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-rkl-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html
> > 
> >   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling@pipe-a-valid-mode:
> >     - shard-dg2:          NOTRUN -> [SKIP][187] ([i915#2672]) +3 other tests skip
> >    [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg2-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling@pipe-a-valid-mode.html
> > 
> >   * igt@kms_force_connector_basic@prune-stale-modes:
> >     - shard-mtlp:         NOTRUN -> [SKIP][188] ([i915#5274])
> >    [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-mtlp-2/igt@kms_force_connector_basic@prune-stale-modes.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
> >     - shard-dg2:          NOTRUN -> [SKIP][189] ([i915#5354]) +25 other tests skip
> >    [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
> >     - shard-rkl:          NOTRUN -> [SKIP][190] ([i915#1825]) +47 other tests skip
> >    [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff:
> >     - shard-mtlp:         NOTRUN -> [SKIP][191] ([i915#1825]) +12 other tests skip
> >    [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbc-tiling-4:
> >     - shard-dg1:          NOTRUN -> [SKIP][192] ([i915#5439])
> >    [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg1-17/igt@kms_frontbuffer_tracking@fbc-tiling-4.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-render:
> >     - shard-dg1:          NOTRUN -> [SKIP][193] ([i915#3458]) +25 other tests skip
> >    [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg1-15/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-render.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc:
> >     - shard-dg1:          NOTRUN -> [SKIP][194] ([i915#8708]) +31 other tests skip
> >    [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt:
> >     - shard-rkl:          NOTRUN -> [SKIP][195] +64 other tests skip
> >    [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-gtt:
> >     - shard-dg2:          NOTRUN -> [SKIP][196] ([i915#8708]) +14 other tests skip
> >    [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-gtt.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-gtt:
> >     - shard-mtlp:         NOTRUN -> [SKIP][197] ([i915#8708]) +8 other tests skip
> >    [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-mtlp-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-gtt.html
> > 
> >   * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
> >     - shard-rkl:          NOTRUN -> [SKIP][198] ([i915#9766])
> >    [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-rkl-4/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
> > 
> >   * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-pwrite:
> >     - shard-dg2:          NOTRUN -> [SKIP][199] ([i915#3458]) +11 other tests skip
> >    [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-pwrite.html
> > 
> >   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-gtt:
> >     - shard-glk:          NOTRUN -> [SKIP][200] +191 other tests skip
> >    [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-glk5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-gtt.html
> > 
> >   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite:
> >     - shard-rkl:          NOTRUN -> [SKIP][201] ([i915#3023]) +28 other tests skip
> >    [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-rkl-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite.html
> > 
> >   * igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary:
> >     - shard-tglu:         NOTRUN -> [SKIP][202] +46 other tests skip
> >    [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-tglu-2/igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary.html
> > 
> >   * igt@kms_hdr@bpc-switch-suspend:
> >     - shard-tglu:         NOTRUN -> [SKIP][203] ([i915#3555] / [i915#8228]) +1 other test skip
> >    [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-tglu-4/igt@kms_hdr@bpc-switch-suspend.html
> > 
> >   * igt@kms_hdr@static-toggle:
> >     - shard-dg1:          NOTRUN -> [SKIP][204] ([i915#3555] / [i915#8228]) +1 other test skip
> >    [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg1-16/igt@kms_hdr@static-toggle.html
> > 
> >   * igt@kms_hdr@static-toggle-dpms:
> >     - shard-dg2:          NOTRUN -> [SKIP][205] ([i915#3555] / [i915#8228])
> >    [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg2-10/igt@kms_hdr@static-toggle-dpms.html
> > 
> >   * igt@kms_hdr@static-toggle-suspend:
> >     - shard-rkl:          NOTRUN -> [SKIP][206] ([i915#3555] / [i915#8228]) +2 other tests skip
> >    [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-rkl-5/igt@kms_hdr@static-toggle-suspend.html
> > 
> >   * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
> >     - shard-dg2:          NOTRUN -> [SKIP][207] ([i915#4816])
> >    [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg2-5/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
> >     - shard-rkl:          NOTRUN -> [SKIP][208] ([i915#4070] / [i915#4816])
> >    [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-rkl-5/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
> > 
> >   * igt@kms_panel_fitting@atomic-fastset:
> >     - shard-rkl:          NOTRUN -> [SKIP][209] ([i915#6301]) +1 other test skip
> >    [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-rkl-3/igt@kms_panel_fitting@atomic-fastset.html
> >     - shard-dg1:          NOTRUN -> [SKIP][210] ([i915#6301])
> >    [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg1-17/igt@kms_panel_fitting@atomic-fastset.html
> > 
> >   * igt@kms_panel_fitting@legacy:
> >     - shard-tglu:         NOTRUN -> [SKIP][211] ([i915#6301])
> >    [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-tglu-7/igt@kms_panel_fitting@legacy.html
> > 
> >   * igt@kms_plane@pixel-format@pipe-b:
> >     - shard-mtlp:         [PASS][212] -> [ABORT][213] ([i915#10608] / [i915#10650])
> >    [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7807/shard-mtlp-3/igt@kms_plane@pixel-format@pipe-b.html
> >    [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-mtlp-1/igt@kms_plane@pixel-format@pipe-b.html
> > 
> >   * igt@kms_plane_multiple@tiling-yf:
> >     - shard-mtlp:         NOTRUN -> [SKIP][214] ([i915#3555] / [i915#8806])
> >    [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-mtlp-5/igt@kms_plane_multiple@tiling-yf.html
> > 
> >   * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1:
> >     - shard-rkl:          NOTRUN -> [FAIL][215] ([i915#8292])
> >    [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-rkl-4/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html
> > 
> >   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-a-dp-4:
> >     - shard-dg2:          NOTRUN -> [SKIP][216] ([i915#9423]) +7 other tests skip
> >    [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg2-11/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-a-dp-4.html
> > 
> >   * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a-hdmi-a-1:
> >     - shard-rkl:          NOTRUN -> [SKIP][217] ([i915#9423]) +7 other tests skip
> >    [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-rkl-2/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a-hdmi-a-1.html
> > 
> >   * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-d-hdmi-a-4:
> >     - shard-dg1:          NOTRUN -> [SKIP][218] ([i915#9423]) +7 other tests skip
> >    [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg1-14/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-d-hdmi-a-4.html
> > 
> >   * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a-hdmi-a-1:
> >     - shard-rkl:          NOTRUN -> [SKIP][219] ([i915#5176] / [i915#9423]) +1 other test skip
> >    [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-rkl-4/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a-hdmi-a-1.html
> > 
> >   * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a-hdmi-a-3:
> >     - shard-dg1:          NOTRUN -> [SKIP][220] ([i915#5176] / [i915#9423]) +3 other tests skip
> >    [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg1-13/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a-hdmi-a-3.html
> > 
> >   * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-d-hdmi-a-1:
> >     - shard-tglu:         NOTRUN -> [SKIP][221] ([i915#9423]) +7 other tests skip
> >    [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-tglu-5/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-d-hdmi-a-1.html
> > 
> >   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-2:
> >     - shard-rkl:          NOTRUN -> [SKIP][222] ([i915#5235]) +3 other tests skip
> >    [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-rkl-6/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-2.html
> > 
> >   * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-b-edp-1:
> >     - shard-mtlp:         NOTRUN -> [SKIP][223] ([i915#5235]) +6 other tests skip
> >    [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-mtlp-3/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-b-edp-1.html
> > 
> >   * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a-hdmi-a-1:
> >     - shard-tglu:         NOTRUN -> [SKIP][224] ([i915#5235]) +3 other tests skip
> >    [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-tglu-10/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a-hdmi-a-1.html
> > 
> >   * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-d-edp-1:
> >     - shard-mtlp:         NOTRUN -> [SKIP][225] ([i915#3555] / [i915#5235])
> >    [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-mtlp-8/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-d-edp-1.html
> > 
> >   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a-hdmi-a-3:
> >     - shard-dg2:          NOTRUN -> [SKIP][226] ([i915#5235] / [i915#9423]) +3 other tests skip
> >    [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg2-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a-hdmi-a-3.html
> > 
> >   * igt@kms_pm_backlight@bad-brightness:
> >     - shard-rkl:          NOTRUN -> [SKIP][227] ([i915#5354]) +1 other test skip
> >    [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-rkl-3/igt@kms_pm_backlight@bad-brightness.html
> > 
> >   * igt@kms_pm_backlight@basic-brightness:
> >     - shard-dg1:          NOTRUN -> [SKIP][228] ([i915#5354])
> >    [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg1-13/igt@kms_pm_backlight@basic-brightness.html
> > 
> >   * igt@kms_pm_backlight@fade:
> >     - shard-tglu:         NOTRUN -> [SKIP][229] ([i915#9812])
> >    [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-tglu-10/igt@kms_pm_backlight@fade.html
> > 
> >   * igt@kms_pm_dc@dc6-dpms:
> >     - shard-tglu:         [PASS][230] -> [FAIL][231] ([i915#9295])
> >    [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7807/shard-tglu-6/igt@kms_pm_dc@dc6-dpms.html
> >    [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-tglu-7/igt@kms_pm_dc@dc6-dpms.html
> > 
> >   * igt@kms_pm_dc@dc6-psr:
> >     - shard-dg2:          NOTRUN -> [SKIP][232] ([i915#9685]) +1 other test skip
> >    [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg2-8/igt@kms_pm_dc@dc6-psr.html
> > 
> >   * igt@kms_pm_lpsp@kms-lpsp:
> >     - shard-dg2:          NOTRUN -> [SKIP][233] ([i915#9340])
> >    [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg2-11/igt@kms_pm_lpsp@kms-lpsp.html
> > 
> >   * igt@kms_pm_lpsp@screens-disabled:
> >     - shard-dg1:          NOTRUN -> [SKIP][234] ([i915#8430])
> >    [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg1-14/igt@kms_pm_lpsp@screens-disabled.html
> > 
> >   * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
> >     - shard-dg1:          NOTRUN -> [SKIP][235] ([i915#9519])
> >    [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg1-15/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
> > 
> >   * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
> >     - shard-rkl:          NOTRUN -> [SKIP][236] ([i915#9519])
> >    [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-rkl-3/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
> > 
> >   * igt@kms_pm_rpm@modeset-non-lpsp:
> >     - shard-tglu:         NOTRUN -> [SKIP][237] ([i915#9519])
> >    [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-tglu-3/igt@kms_pm_rpm@modeset-non-lpsp.html
> > 
> >   * igt@kms_prime@basic-crc-hybrid:
> >     - shard-dg2:          NOTRUN -> [SKIP][238] ([i915#6524] / [i915#6805])
> >    [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg2-10/igt@kms_prime@basic-crc-hybrid.html
> >     - shard-dg1:          NOTRUN -> [SKIP][239] ([i915#6524])
> >    [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg1-15/igt@kms_prime@basic-crc-hybrid.html
> > 
> >   * igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-fully-sf@psr2-pipe-a-edp-1:
> >     - shard-mtlp:         NOTRUN -> [SKIP][240] ([i915#9808]) +3 other tests skip
> >    [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-mtlp-4/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-fully-sf@psr2-pipe-a-edp-1.html
> > 
> >   * igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area:
> >     - shard-dg1:          NOTRUN -> [SKIP][241] +47 other tests skip
> >    [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg1-16/igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area.html
> > 
> >   * igt@kms_psr2_su@page_flip-p010:
> >     - shard-dg1:          NOTRUN -> [SKIP][242] ([i915#9683])
> >    [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg1-16/igt@kms_psr2_su@page_flip-p010.html
> > 
> >   * igt@kms_psr2_su@page_flip-xrgb8888:
> >     - shard-mtlp:         NOTRUN -> [SKIP][243] ([i915#4348])
> >    [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-mtlp-6/igt@kms_psr2_su@page_flip-xrgb8888.html
> > 
> >   * igt@kms_psr@fbc-pr-primary-mmap-gtt:
> >     - shard-dg2:          NOTRUN -> [SKIP][244] ([i915#1072] / [i915#9732]) +12 other tests skip
> >    [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg2-8/igt@kms_psr@fbc-pr-primary-mmap-gtt.html
> > 
> >   * igt@kms_psr@fbc-psr2-cursor-mmap-cpu:
> >     - shard-tglu:         NOTRUN -> [SKIP][245] ([i915#9732]) +10 other tests skip
> >    [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-tglu-4/igt@kms_psr@fbc-psr2-cursor-mmap-cpu.html
> > 
> >   * igt@kms_psr@pr-basic:
> >     - shard-mtlp:         NOTRUN -> [SKIP][246] ([i915#9688]) +4 other tests skip
> >    [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-mtlp-7/igt@kms_psr@pr-basic.html
> > 
> >   * igt@kms_psr@psr-primary-mmap-gtt@edp-1:
> >     - shard-mtlp:         NOTRUN -> [SKIP][247] ([i915#4077] / [i915#9688])
> >    [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-mtlp-2/igt@kms_psr@psr-primary-mmap-gtt@edp-1.html
> > 
> >   * igt@kms_psr@psr2-sprite-mmap-gtt:
> >     - shard-dg1:          NOTRUN -> [SKIP][248] ([i915#1072] / [i915#9732]) +20 other tests skip
> >    [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg1-18/igt@kms_psr@psr2-sprite-mmap-gtt.html
> >     - shard-dg2:          NOTRUN -> [SKIP][249] ([i915#1072] / [i915#9673] / [i915#9732]) +1 other test skip
> >    [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg2-11/igt@kms_psr@psr2-sprite-mmap-gtt.html
> > 
> >   * igt@kms_psr@psr2-suspend:
> >     - shard-rkl:          NOTRUN -> [SKIP][250] ([i915#1072] / [i915#9732]) +20 other tests skip
> >    [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-rkl-5/igt@kms_psr@psr2-suspend.html
> > 
> >   * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
> >     - shard-rkl:          NOTRUN -> [SKIP][251] ([i915#9685]) +1 other test skip
> >    [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-rkl-3/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
> > 
> >   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
> >     - shard-mtlp:         NOTRUN -> [SKIP][252] ([i915#4235])
> >    [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-mtlp-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html
> > 
> >   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
> >     - shard-rkl:          NOTRUN -> [SKIP][253] ([i915#5289])
> >    [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-rkl-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
> > 
> >   * igt@kms_setmode@invalid-clone-exclusive-crtc:
> >     - shard-mtlp:         NOTRUN -> [SKIP][254] ([i915#3555] / [i915#8823])
> >    [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-mtlp-4/igt@kms_setmode@invalid-clone-exclusive-crtc.html
> > 
> >   * igt@kms_sysfs_edid_timing:
> >     - shard-dg2:          NOTRUN -> [FAIL][255] ([IGT#2])
> >    [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg2-8/igt@kms_sysfs_edid_timing.html
> > 
> >   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
> >     - shard-dg1:          NOTRUN -> [SKIP][256] ([i915#8623])
> >    [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg1-18/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> >     - shard-dg2:          NOTRUN -> [SKIP][257] ([i915#8623])
> >    [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg2-11/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> > 
> >   * igt@kms_vrr@max-min:
> >     - shard-tglu:         NOTRUN -> [SKIP][258] ([i915#9906])
> >    [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-tglu-3/igt@kms_vrr@max-min.html
> > 
> >   * igt@kms_writeback@writeback-fb-id:
> >     - shard-dg2:          NOTRUN -> [SKIP][259] ([i915#2437])
> >    [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg2-6/igt@kms_writeback@writeback-fb-id.html
> > 
> >   * igt@kms_writeback@writeback-fb-id-xrgb2101010:
> >     - shard-rkl:          NOTRUN -> [SKIP][260] ([i915#2437] / [i915#9412]) +1 other test skip
> >    [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-rkl-5/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
> > 
> >   * igt@kms_writeback@writeback-pixel-formats:
> >     - shard-dg1:          NOTRUN -> [SKIP][261] ([i915#2437] / [i915#9412])
> >    [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg1-15/igt@kms_writeback@writeback-pixel-formats.html
> > 
> >   * igt@perf@gen8-unprivileged-single-ctx-counters:
> >     - shard-dg2:          NOTRUN -> [SKIP][262] ([i915#2436] / [i915#7387])
> >    [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg2-2/igt@perf@gen8-unprivileged-single-ctx-counters.html
> > 
> >   * igt@perf_pmu@busy-accuracy-2@rcs0:
> >     - shard-glk:          [PASS][263] -> [DMESG-WARN][264] ([i915#118])
> >    [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7807/shard-glk4/igt@perf_pmu@busy-accuracy-2@rcs0.html
> >    [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-glk9/igt@perf_pmu@busy-accuracy-2@rcs0.html
> > 
> >   * igt@perf_pmu@busy-double-start@vecs1:
> >     - shard-dg2:          NOTRUN -> [FAIL][265] ([i915#4349]) +3 other tests fail
> >    [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg2-10/igt@perf_pmu@busy-double-start@vecs1.html
> > 
> >   * igt@perf_pmu@rc6@other-idle-gt0:
> >     - shard-rkl:          NOTRUN -> [SKIP][266] ([i915#8516])
> >    [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-rkl-4/igt@perf_pmu@rc6@other-idle-gt0.html
> >     - shard-dg1:          NOTRUN -> [SKIP][267] ([i915#8516])
> >    [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg1-13/igt@perf_pmu@rc6@other-idle-gt0.html
> > 
> >   * igt@prime_vgem@basic-fence-read:
> >     - shard-dg1:          NOTRUN -> [SKIP][268] ([i915#3708])
> >    [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg1-15/igt@prime_vgem@basic-fence-read.html
> >     - shard-mtlp:         NOTRUN -> [SKIP][269] ([i915#3708])
> >    [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-mtlp-7/igt@prime_vgem@basic-fence-read.html
> > 
> >   * igt@prime_vgem@basic-gtt:
> >     - shard-dg1:          NOTRUN -> [SKIP][270] ([i915#3708] / [i915#4077])
> >    [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg1-13/igt@prime_vgem@basic-gtt.html
> > 
> >   * igt@prime_vgem@coherency-gtt:
> >     - shard-rkl:          NOTRUN -> [SKIP][271] ([i915#3708]) +1 other test skip
> >    [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-rkl-5/igt@prime_vgem@coherency-gtt.html
> > 
> >   * igt@prime_vgem@fence-read-hang:
> >     - shard-dg2:          NOTRUN -> [SKIP][272] ([i915#3708])
> >    [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg2-6/igt@prime_vgem@fence-read-hang.html
> > 
> >   * igt@sriov_basic@bind-unbind-vf:
> >     - shard-dg1:          NOTRUN -> [SKIP][273] ([i915#9917])
> >    [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg1-16/igt@sriov_basic@bind-unbind-vf.html
> > 
> >   * igt@sriov_basic@enable-vfs-autoprobe-on:
> >     - shard-dg2:          NOTRUN -> [SKIP][274] ([i915#9917])
> >    [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg2-6/igt@sriov_basic@enable-vfs-autoprobe-on.html
> >     - shard-rkl:          NOTRUN -> [SKIP][275] ([i915#9917]) +1 other test skip
> >    [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-rkl-1/igt@sriov_basic@enable-vfs-autoprobe-on.html
> > 
> >   * igt@syncobj_timeline@invalid-wait-zero-handles:
> >     - shard-dg1:          NOTRUN -> [FAIL][276] ([i915#9781])
> >    [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg1-15/igt@syncobj_timeline@invalid-wait-zero-handles.html
> >     - shard-mtlp:         NOTRUN -> [FAIL][277] ([i915#9781])
> >    [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-mtlp-6/igt@syncobj_timeline@invalid-wait-zero-handles.html
> > 
> >   * igt@syncobj_wait@invalid-wait-zero-handles:
> >     - shard-tglu:         NOTRUN -> [FAIL][278] ([i915#9779])
> >    [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-tglu-9/igt@syncobj_wait@invalid-wait-zero-handles.html
> > 
> >   * igt@tools_test@sysfs_l3_parity:
> >     - shard-dg1:          NOTRUN -> [SKIP][279] ([i915#4818])
> >    [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg1-17/igt@tools_test@sysfs_l3_parity.html
> >     - shard-dg2:          NOTRUN -> [SKIP][280] ([i915#4818])
> >    [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg2-8/igt@tools_test@sysfs_l3_parity.html
> > 
> >   * igt@v3d/v3d_mmap@mmap-bo:
> >     - shard-mtlp:         NOTRUN -> [SKIP][281] ([i915#2575]) +4 other tests skip
> >    [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-mtlp-5/igt@v3d/v3d_mmap@mmap-bo.html
> > 
> >   * igt@v3d/v3d_perfmon@destroy-invalid-perfmon:
> >     - shard-tglu:         NOTRUN -> [SKIP][282] ([i915#2575]) +9 other tests skip
> >    [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-tglu-3/igt@v3d/v3d_perfmon@destroy-invalid-perfmon.html
> > 
> >   * igt@v3d/v3d_submit_cl@job-perfmon:
> >     - shard-dg1:          NOTRUN -> [SKIP][283] ([i915#2575]) +16 other tests skip
> >    [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg1-16/igt@v3d/v3d_submit_cl@job-perfmon.html
> > 
> >   * igt@v3d/v3d_wait_bo@used-bo-1ns:
> >     - shard-dg2:          NOTRUN -> [SKIP][284] ([i915#2575]) +11 other tests skip
> >    [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg2-11/igt@v3d/v3d_wait_bo@used-bo-1ns.html
> > 
> >   * igt@vc4/vc4_dmabuf_poll@poll-write-waits-until-write-done:
> >     - shard-mtlp:         NOTRUN -> [SKIP][285] ([i915#7711]) +2 other tests skip
> >    [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-mtlp-7/igt@vc4/vc4_dmabuf_poll@poll-write-waits-until-write-done.html
> > 
> >   * igt@vc4/vc4_purgeable_bo@mark-purgeable:
> >     - shard-rkl:          NOTRUN -> [SKIP][286] ([i915#7711]) +13 other tests skip
> >    [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-rkl-4/igt@vc4/vc4_purgeable_bo@mark-purgeable.html
> > 
> >   * igt@vc4/vc4_wait_bo@unused-bo-1ns:
> >     - shard-dg2:          NOTRUN -> [SKIP][287] ([i915#7711]) +6 other tests skip
> >    [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg2-8/igt@vc4/vc4_wait_bo@unused-bo-1ns.html
> > 
> >   * igt@vc4/vc4_wait_bo@used-bo-0ns:
> >     - shard-dg1:          NOTRUN -> [SKIP][288] ([i915#7711]) +10 other tests skip
> >    [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg1-17/igt@vc4/vc4_wait_bo@used-bo-0ns.html
> > 
> >   
> > #### Possible fixes ####
> > 
> >   * igt@gem_exec_fair@basic-none@vcs0:
> >     - shard-glk:          [FAIL][289] ([i915#2842]) -> [PASS][290] +1 other test pass
> >    [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7807/shard-glk1/igt@gem_exec_fair@basic-none@vcs0.html
> >    [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-glk5/igt@gem_exec_fair@basic-none@vcs0.html
> > 
> >   * igt@gem_lmem_swapping@basic@lmem0:
> >     - shard-dg2:          [FAIL][291] ([i915#10378]) -> [PASS][292] +2 other tests pass
> >    [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7807/shard-dg2-2/igt@gem_lmem_swapping@basic@lmem0.html
> >    [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg2-5/igt@gem_lmem_swapping@basic@lmem0.html
> > 
> >   * igt@gem_lmem_swapping@smem-oom@lmem0:
> >     - shard-dg2:          [TIMEOUT][293] ([i915#5493]) -> [PASS][294]
> >    [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7807/shard-dg2-8/igt@gem_lmem_swapping@smem-oom@lmem0.html
> >    [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg2-8/igt@gem_lmem_swapping@smem-oom@lmem0.html
> > 
> >   * igt@i915_module_load@reload:
> >     - shard-snb:          [INCOMPLETE][295] ([i915#9849]) -> [PASS][296]
> >    [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7807/shard-snb6/igt@i915_module_load@reload.html
> >    [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-snb2/igt@i915_module_load@reload.html
> > 
> >   * igt@i915_module_load@reload-with-fault-injection:
> >     - shard-dg1:          [INCOMPLETE][297] ([i915#9820] / [i915#9849]) -> [PASS][298]
> >    [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7807/shard-dg1-18/igt@i915_module_load@reload-with-fault-injection.html
> >    [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg1-13/igt@i915_module_load@reload-with-fault-injection.html
> >     - shard-tglu:         [INCOMPLETE][299] ([i915#9697]) -> [PASS][300]
> >    [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7807/shard-tglu-8/igt@i915_module_load@reload-with-fault-injection.html
> >    [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-tglu-6/igt@i915_module_load@reload-with-fault-injection.html
> >     - shard-glk:          [ABORT][301] ([i915#9849]) -> [PASS][302]
> >    [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7807/shard-glk9/igt@i915_module_load@reload-with-fault-injection.html
> >    [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-glk2/igt@i915_module_load@reload-with-fault-injection.html
> > 
> >   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
> >     - shard-tglu:         [FAIL][303] ([i915#3743]) -> [PASS][304] +1 other test pass
> >    [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7807/shard-tglu-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
> >    [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-tglu-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
> > 
> >   * igt@kms_cursor_legacy@torture-move@pipe-a:
> >     - shard-snb:          [DMESG-WARN][305] ([i915#10166]) -> [PASS][306]
> >    [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7807/shard-snb6/igt@kms_cursor_legacy@torture-move@pipe-a.html
> >    [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-snb2/igt@kms_cursor_legacy@torture-move@pipe-a.html
> > 
> >   * igt@kms_flip@wf_vblank-ts-check-interruptible@b-hdmi-a4:
> >     - shard-dg1:          [FAIL][307] ([i915#2122]) -> [PASS][308] +3 other tests pass
> >    [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7807/shard-dg1-16/igt@kms_flip@wf_vblank-ts-check-interruptible@b-hdmi-a4.html
> >    [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg1-14/igt@kms_flip@wf_vblank-ts-check-interruptible@b-hdmi-a4.html
> > 
> >   * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
> >     - shard-rkl:          [SKIP][309] ([i915#9519]) -> [PASS][310]
> >    [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7807/shard-rkl-4/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
> >    [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-rkl-3/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
> > 
> >   * igt@kms_psr@psr2-sprite-mmap-cpu@edp-1:
> >     - shard-mtlp:         [FAIL][311] ([i915#10105]) -> [PASS][312]
> >    [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7807/shard-mtlp-3/igt@kms_psr@psr2-sprite-mmap-cpu@edp-1.html
> >    [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-mtlp-6/igt@kms_psr@psr2-sprite-mmap-cpu@edp-1.html
> > 
> >   
> > #### Warnings ####
> > 
> >   * igt@gem_eio@kms:
> >     - shard-dg2:          [INCOMPLETE][313] ([i915#10513]) -> [FAIL][314] ([i915#5784])
> >    [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7807/shard-dg2-4/igt@gem_eio@kms.html
> >    [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg2-10/igt@gem_eio@kms.html
> > 
> >   * igt@i915_module_load@reload-with-fault-injection:
> >     - shard-dg2:          [WARN][315] ([i915#7356]) -> [ABORT][316] ([i915#9820])
> >    [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7807/shard-dg2-10/igt@i915_module_load@reload-with-fault-injection.html
> >    [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg2-7/igt@i915_module_load@reload-with-fault-injection.html
> > 
> >   * igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0:
> >     - shard-tglu:         [FAIL][317] ([i915#3591]) -> [WARN][318] ([i915#2681])
> >    [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7807/shard-tglu-6/igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0.html
> >    [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-tglu-10/igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0.html
> > 
> >   * igt@kms_content_protection@mei-interface:
> >     - shard-dg1:          [SKIP][319] ([i915#9433]) -> [SKIP][320] ([i915#9424])
> >    [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7807/shard-dg1-17/igt@kms_content_protection@mei-interface.html
> >    [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg1-18/igt@kms_content_protection@mei-interface.html
> > 
> >   * igt@kms_content_protection@type1:
> >     - shard-dg2:          [SKIP][321] ([i915#7118] / [i915#9424]) -> [SKIP][322] ([i915#7118] / [i915#7162] / [i915#9424])
> >    [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7807/shard-dg2-8/igt@kms_content_protection@type1.html
> >    [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg2-11/igt@kms_content_protection@type1.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-cpu:
> >     - shard-dg2:          [SKIP][323] ([i915#10433] / [i915#3458]) -> [SKIP][324] ([i915#3458]) +3 other tests skip
> >    [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7807/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-cpu.html
> >    [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg2-11/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-cpu.html
> > 
> >   * igt@kms_frontbuffer_tracking@psr-slowdraw:
> >     - shard-dg2:          [SKIP][325] ([i915#3458]) -> [SKIP][326] ([i915#10433] / [i915#3458]) +1 other test skip
> >    [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7807/shard-dg2-8/igt@kms_frontbuffer_tracking@psr-slowdraw.html
> >    [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-slowdraw.html
> > 
> >   * igt@kms_psr@fbc-pr-primary-page-flip:
> >     - shard-dg2:          [SKIP][327] ([i915#1072] / [i915#9673] / [i915#9732]) -> [SKIP][328] ([i915#1072] / [i915#9732]) +4 other tests skip
> >    [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7807/shard-dg2-11/igt@kms_psr@fbc-pr-primary-page-flip.html
> >    [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg2-2/igt@kms_psr@fbc-pr-primary-page-flip.html
> > 
> >   * igt@kms_psr@fbc-psr-basic:
> >     - shard-dg2:          [SKIP][329] ([i915#1072] / [i915#9732]) -> [SKIP][330] ([i915#1072] / [i915#9673] / [i915#9732]) +12 other tests skip
> >    [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7807/shard-dg2-2/igt@kms_psr@fbc-psr-basic.html
> >    [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg2-11/igt@kms_psr@fbc-psr-basic.html
> > 
> >   * igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:
> >     - shard-dg2:          [INCOMPLETE][331] ([i915#5493]) -> [CRASH][332] ([i915#9351])
> >    [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7807/shard-dg2-11/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html
> >    [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/shard-dg2-6/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html
> > 
> >   
> >   {name}: This element is suppressed. This means it is ignored when computing
> >           the status of the difference (SUCCESS, WARNING, or FAILURE).
> > 
> >   [IGT#2]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2
> >   [i915#10105]: https://gitlab.freedesktop.org/drm/intel/issues/10105
> >   [i915#10166]: https://gitlab.freedesktop.org/drm/intel/issues/10166
> >   [i915#10278]: https://gitlab.freedesktop.org/drm/intel/issues/10278
> >   [i915#10307]: https://gitlab.freedesktop.org/drm/intel/issues/10307
> >   [i915#10366]: https://gitlab.freedesktop.org/drm/intel/issues/10366
> >   [i915#10378]: https://gitlab.freedesktop.org/drm/intel/issues/10378
> >   [i915#10433]: https://gitlab.freedesktop.org/drm/intel/issues/10433
> >   [i915#10434]: https://gitlab.freedesktop.org/drm/intel/issues/10434
> >   [i915#10513]: https://gitlab.freedesktop.org/drm/intel/issues/10513
> >   [i915#10608]: https://gitlab.freedesktop.org/drm/intel/issues/10608
> >   [i915#10650]: https://gitlab.freedesktop.org/drm/intel/issues/10650
> >   [i915#10656]: https://gitlab.freedesktop.org/drm/intel/issues/10656
> >   [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
> >   [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
> >   [i915#1769]: https://gitlab.freedesktop.org/drm/intel/issues/1769
> >   [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
> >   [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
> >   [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
> >   [i915#2122]: https://gitlab.freedesktop.org/drm/intel/issues/2122
> >   [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
> >   [i915#2436]: https://gitlab.freedesktop.org/drm/intel/issues/2436
> >   [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
> >   [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
> >   [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
> >   [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
> >   [i915#2658]: https://gitlab.freedesktop.org/drm/intel/issues/2658
> >   [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
> >   [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
> >   [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
> >   [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
> >   [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
> >   [i915#2876]: https://gitlab.freedesktop.org/drm/intel/issues/2876
> >   [i915#3023]: https://gitlab.freedesktop.org/drm/intel/issues/3023
> >   [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
> >   [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
> >   [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
> >   [i915#3299]: https://gitlab.freedesktop.org/drm/intel/issues/3299
> >   [i915#3323]: https://gitlab.freedesktop.org/drm/intel/issues/3323
> >   [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
> >   [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
> >   [i915#3469]: https://gitlab.freedesktop.org/drm/intel/issues/3469
> >   [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
> >   [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
> >   [i915#3591]: https://gitlab.freedesktop.org/drm/intel/issues/3591
> >   [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
> >   [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
> >   [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
> >   [i915#3743]: https://gitlab.freedesktop.org/drm/intel/issues/3743
> >   [i915#3804]: https://gitlab.freedesktop.org/drm/intel/issues/3804
> >   [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
> >   [i915#3955]: https://gitlab.freedesktop.org/drm/intel/issues/3955
> >   [i915#4036]: https://gitlab.freedesktop.org/drm/intel/issues/4036
> >   [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
> >   [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
> >   [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
> >   [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
> >   [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
> >   [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
> >   [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
> >   [i915#4235]: https://gitlab.freedesktop.org/drm/intel/issues/4235
> >   [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
> >   [i915#4348]: https://gitlab.freedesktop.org/drm/intel/issues/4348
> >   [i915#4349]: https://gitlab.freedesktop.org/drm/intel/issues/4349
> >   [i915#4387]: https://gitlab.freedesktop.org/drm/intel/issues/4387
> >   [i915#4473]: https://gitlab.freedesktop.org/drm/intel/issues/4473
> >   [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
> >   [i915#4537]: https://gitlab.freedesktop.org/drm/intel/issues/4537
> >   [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
> >   [i915#4565]: https://gitlab.freedesktop.org/drm/intel/issues/4565
> >   [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
> >   [i915#4771]: https://gitlab.freedesktop.org/drm/intel/issues/4771
> >   [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
> >   [i915#4816]: https://gitlab.freedesktop.org/drm/intel/issues/4816
> >   [i915#4818]: https://gitlab.freedesktop.org/drm/intel/issues/4818
> >   [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
> >   [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
> >   [i915#4879]: https://gitlab.freedesktop.org/drm/intel/issues/4879
> >   [i915#4881]: https://gitlab.freedesktop.org/drm/intel/issues/4881
> >   [i915#4958]: https://gitlab.freedesktop.org/drm/intel/issues/4958
> >   [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
> >   [i915#5190]: https://gitlab.freedesktop.org/drm/intel/issues/5190
> >   [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
> >   [i915#5274]: https://gitlab.freedesktop.org/drm/intel/issues/5274
> >   [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
> >   [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
> >   [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
> >   [i915#5439]: https://gitlab.freedesktop.org/drm/intel/issues/5439
> >   [i915#5493]: https://gitlab.freedesktop.org/drm/intel/issues/5493
> >   [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
> >   [i915#5889]: https://gitlab.freedesktop.org/drm/intel/issues/5889
> >   [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
> >   [i915#6188]: https://gitlab.freedesktop.org/drm/intel/issues/6188
> >   [i915#6245]: https://gitlab.freedesktop.org/drm/intel/issues/6245
> >   [i915#6301]: https://gitlab.freedesktop.org/drm/intel/issues/6301
> >   [i915#6334]: https://gitlab.freedesktop.org/drm/intel/issues/6334
> >   [i915#6524]: https://gitlab.freedesktop.org/drm/intel/issues/6524
> >   [i915#6590]: https://gitlab.freedesktop.org/drm/intel/issues/6590
> >   [i915#6805]: https://gitlab.freedesktop.org/drm/intel/issues/6805
> >   [i915#6944]: https://gitlab.freedesktop.org/drm/intel/issues/6944
> >   [i915#7118]: https://gitlab.freedesktop.org/drm/intel/issues/7118
> >   [i915#7162]: https://gitlab.freedesktop.org/drm/intel/issues/7162
> >   [i915#7173]: https://gitlab.freedesktop.org/drm/intel/issues/7173
> >   [i915#7276]: https://gitlab.freedesktop.org/drm/intel/issues/7276
> >   [i915#7356]: https://gitlab.freedesktop.org/drm/intel/issues/7356
> >   [i915#7387]: https://gitlab.freedesktop.org/drm/intel/issues/7387
> >   [i915#7582]: https://gitlab.freedesktop.org/drm/intel/issues/7582
> >   [i915#7697]: https://gitlab.freedesktop.org/drm/intel/issues/7697
> >   [i915#7701]: https://gitlab.freedesktop.org/drm/intel/issues/7701
> >   [i915#7707]: https://gitlab.freedesktop.org/drm/intel/issues/7707
> >   [i915#7711]: https://gitlab.freedesktop.org/drm/intel/issues/7711
> >   [i915#7742]: https://gitlab.freedesktop.org/drm/intel/issues/7742
> >   [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
> >   [i915#7975]: https://gitlab.freedesktop.org/drm/intel/issues/7975
> >   [i915#8213]: https://gitlab.freedesktop.org/drm/intel/issues/8213
> >   [i915#8228]: https://gitlab.freedesktop.org/drm/intel/issues/8228
> >   [i915#8292]: https://gitlab.freedesktop.org/drm/intel/issues/8292
> >   [i915#8381]: https://gitlab.freedesktop.org/drm/intel/issues/8381
> >   [i915#8399]: https://gitlab.freedesktop.org/drm/intel/issues/8399
> >   [i915#8411]: https://gitlab.freedesktop.org/drm/intel/issues/8411
> >   [i915#8414]: https://gitlab.freedesktop.org/drm/intel/issues/8414
> >   [i915#8428]: https://gitlab.freedesktop.org/drm/intel/issues/8428
> >   [i915#8430]: https://gitlab.freedesktop.org/drm/intel/issues/8430
> >   [i915#8516]: https://gitlab.freedesktop.org/drm/intel/issues/8516
> >   [i915#8555]: https://gitlab.freedesktop.org/drm/intel/issues/8555
> >   [i915#8562]: https://gitlab.freedesktop.org/drm/intel/issues/8562
> >   [i915#8588]: https://gitlab.freedesktop.org/drm/intel/issues/8588
> >   [i915#8623]: https://gitlab.freedesktop.org/drm/intel/issues/8623
> >   [i915#8708]: https://gitlab.freedesktop.org/drm/intel/issues/8708
> >   [i915#8709]: https://gitlab.freedesktop.org/drm/intel/issues/8709
> >   [i915#8806]: https://gitlab.freedesktop.org/drm/intel/issues/8806
> >   [i915#8814]: https://gitlab.freedesktop.org/drm/intel/issues/8814
> >   [i915#8823]: https://gitlab.freedesktop.org/drm/intel/issues/8823
> >   [i915#9067]: https://gitlab.freedesktop.org/drm/intel/issues/9067
> >   [i915#9227]: https://gitlab.freedesktop.org/drm/intel/issues/9227
> >   [i915#9295]: https://gitlab.freedesktop.org/drm/intel/issues/9295
> >   [i915#9310]: https://gitlab.freedesktop.org/drm/intel/issues/9310
> >   [i915#9311]: https://gitlab.freedesktop.org/drm/intel/issues/9311
> >   [i915#9323]: https://gitlab.freedesktop.org/drm/intel/issues/9323
> >   [i915#9337]: https://gitlab.freedesktop.org/drm/intel/issues/9337
> >   [i915#9340]: https://gitlab.freedesktop.org/drm/intel/issues/9340
> >   [i915#9351]: https://gitlab.freedesktop.org/drm/intel/issues/9351
> >   [i915#9412]: https://gitlab.freedesktop.org/drm/intel/issues/9412
> >   [i915#9423]: https://gitlab.freedesktop.org/drm/intel/issues/9423
> >   [i915#9424]: https://gitlab.freedesktop.org/drm/intel/issues/9424
> >   [i915#9433]: https://gitlab.freedesktop.org/drm/intel/issues/9433
> >   [i915#9519]: https://gitlab.freedesktop.org/drm/intel/issues/9519
> >   [i915#9606]: https://gitlab.freedesktop.org/drm/intel/issues/9606
> >   [i915#9673]: https://gitlab.freedesktop.org/drm/intel/issues/9673
> >   [i915#9683]: https://gitlab.freedesktop.org/drm/intel/issues/9683
> >   [i915#9685]: https://gitlab.freedesktop.org/drm/intel/issues/9685
> >   [i915#9688]: https://gitlab.freedesktop.org/drm/intel/issues/9688
> >   [i915#9697]: https://gitlab.freedesktop.org/drm/intel/issues/9697
> >   [i915#9723]: https://gitlab.freedesktop.org/drm/intel/issues/9723
> >   [i915#9732]: https://gitlab.freedesktop.org/drm/intel/issues/9732
> >   [i915#9766]: https://gitlab.freedesktop.org/drm/intel/issues/9766
> >   [i915#9779]: https://gitlab.freedesktop.org/drm/intel/issues/9779
> >   [i915#9781]: https://gitlab.freedesktop.org/drm/intel/issues/9781
> >   [i915#9808]: https://gitlab.freedesktop.org/drm/intel/issues/9808
> >   [i915#9809]: https://gitlab.freedesktop.org/drm/intel/issues/9809
> >   [i915#9812]: https://gitlab.freedesktop.org/drm/intel/issues/9812
> >   [i915#9820]: https://gitlab.freedesktop.org/drm/intel/issues/9820
> >   [i915#9849]: https://gitlab.freedesktop.org/drm/intel/issues/9849
> >   [i915#9906]: https://gitlab.freedesktop.org/drm/intel/issues/9906
> >   [i915#9917]: https://gitlab.freedesktop.org/drm/intel/issues/9917
> >   [i915#9934]: https://gitlab.freedesktop.org/drm/intel/issues/9934
> > 
> > 
> > Build changes
> > -------------
> > 
> >   * CI: CI-20190529 -> None
> >   * IGT: IGT_7807 -> IGTPW_11024
> > 
> >   CI-20190529: 20190529
> >   CI_DRM_14583: 5f7597e990bea547bd1261170497e7476fb781bb @ git://anongit.freedesktop.org/gfx-ci/linux
> >   IGTPW_11024: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/index.html
> >   IGT_7807: 43e71eeac0fb4fe59df40df2c96fd0fdbf585c0b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> > 
> > == Logs ==
> > 
> > For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11024/index.html
> > 
> 
> 
> 
> 
