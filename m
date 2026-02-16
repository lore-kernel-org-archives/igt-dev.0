Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88F74E7BD83
	for <igt-dev@archiver.kernel.org>; Mon, 16 Feb 2026 10:56:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2947810E202;
	Mon, 16 Feb 2026 10:56:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mYMFZkvI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6A1C10E202
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Feb 2026 10:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771239403; x=1802775403;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=nOKy/fz23KL8+7pyZp8ZdmfsDtF4mXGoFwHNHWVYTR4=;
 b=mYMFZkvIAOk6JIq5oHCeBLj2AUIdT1qrBqxR7WqaSeGUcGK12F3IkRRZ
 a9ChT4aPiacwkWu4tw35ezBsQzI639D9eNHm5PFf7k6YksGhzEFki7lqw
 tpN4QiOgPAeLAbDSNEWsmHKmzOoam9scLcOpIxgBINDxfT8PKIZ2WSDET
 1ot/jZvDabE+0WgGSbSvS2G3th26ckHGRhRCglntg4aODSfMj9Z7uK3Ga
 x+DwYlxNuUFfQFFUJVOzgTlCglUDTgsdABp1brViqjj8EehDsAEdM1gOU
 ELeLIS/zDEDrUyjomGBslZZpdATaQnAjzHno3V4Qn3M4aJuFGCUgMrDaA A==;
X-CSE-ConnectionGUID: ZW3oJ07NTCmTT6+FHMzeXg==
X-CSE-MsgGUID: OCl5BufcTrOgXQ8lwFT8AQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11702"; a="72308070"
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; d="scan'208";a="72308070"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2026 02:56:42 -0800
X-CSE-ConnectionGUID: 95xmKNwtRyilbe4DgS+wfA==
X-CSE-MsgGUID: 51iL9ZvsQcKH+DyICZy5/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; d="scan'208";a="212352163"
Received: from administrator-system-product-name.igk.intel.com
 ([10.91.214.181])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2026 02:56:41 -0800
Date: Mon, 16 Feb 2026 11:56:39 +0100 (CET)
From: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
cc: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_kms?=
 =?UTF-8?Q?=5Fflip=3A_limit_number_of_subtests_run_=28rev5=29?=
In-Reply-To: <177123775284.255555.14014380607562713622@a3b018990fe9>
Message-ID: <2b42980a-cf44-6f49-b1c7-e548932fd883@intel.com>
References: <20260213084930.252273-1-michal.grzelak@intel.com>
 <177123775284.255555.14014380607562713622@a3b018990fe9>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="1527428566-664931966-1771239401=:356414"
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--1527428566-664931966-1771239401=:356414
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Mon, 16 Feb 2026, Patchwork wrote:
> Patch Details
> Series:
> kms_flip: limit number of subtests run (rev5)
> URL:
> https://patchwork.freedesktop.org/series/161389/
> State:
> failure
> Details:
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14554/index.html
>                                             CI Bug Log - changes from CI_DRM_17992_full -> IGTPW_14554_full
> 
> SUMMARY
> 
> FAILURE
> 
> Serious unknown changes coming with IGTPW_14554_full absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_14554_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14554/index.html
> 
> PARTICIPATING HOSTS (9 -> 9)
> 
> No changes in participating hosts
> 
> POSSIBLE NEW ISSUES
> 
> Here are the unknown changes that may have been introduced in IGTPW_14554_full:
>
>   IGT changes
>
>     Possible regressions
>
>  *  igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-d-hdmi-a-1:
>      +  shard-dg2: NOTRUN -> ABORT

<3>[  498.379397] guc_lrc_desc_unpin:3418 GEM_BUG_ON(!ctx_id_mapped(guc, ce->guc_id.id))
<0>[  498.379435] Dumping ftrace buffer:
<0>[  498.379439] ---------------------------------
<0>[  498.379744] CPU:5 [LOST 8120 EVENTS]

Unrelated change.

BR,
Michał

> 
> NEW TESTS
> 
> New tests have been introduced between CI_DRM_17992_full and IGTPW_14554_full:
>
>   New IGT tests (261)
>
>  * 
>
>     igt@core_setmaster@master-drop-set-root:
>
>      +  Statuses : 6 pass(s)
>      +  Exec time: [0.01, 0.04] s
>  * 
>
>     igt@core_setmaster@master-drop-set-shared-fd:
>
>      +  Statuses : 7 pass(s)
>      +  Exec time: [0.01, 0.03] s
>  * 
>
>     igt@core_setmaster@master-drop-set-user:
>
>      +  Statuses : 7 pass(s)
>      +  Exec time: [0.02, 0.05] s
>  * 
>
>     igt@gem_ctx_isolation@clean@bcs0:
>
>      +  Statuses : 5 pass(s)
>      +  Exec time: [0.07, 0.13] s
>  * 
>
>     igt@gem_ctx_isolation@clean@rcs0:
>
>      +  Statuses : 6 pass(s)
>      +  Exec time: [0.02, 0.10] s
>  * 
>
>     igt@gem_ctx_isolation@clean@vcs0:
>
>      +  Statuses : 5 pass(s)
>      +  Exec time: [0.07, 0.15] s
>  * 
>
>     igt@gem_ctx_isolation@clean@vcs1:
>
>      +  Statuses : 4 pass(s)
>      +  Exec time: [0.06, 1.18] s
>  * 
>
>     igt@gem_ctx_isolation@clean@vecs0:
>
>      +  Statuses : 5 pass(s)
>      +  Exec time: [0.06, 2.06] s
>  * 
>
>     igt@gem_ctx_isolation@dirty-create@bcs0:
>
>      +  Statuses : 6 pass(s)
>      +  Exec time: [0.19, 0.91] s
>  * 
>
>     igt@gem_ctx_isolation@dirty-create@rcs0:
>
>      +  Statuses : 7 pass(s)
>      +  Exec time: [0.13, 0.74] s
>  * 
>
>     igt@gem_ctx_isolation@dirty-create@vcs0:
>
>      +  Statuses : 6 pass(s)
>      +  Exec time: [0.20, 0.85] s
>  * 
>
>     igt@gem_ctx_isolation@dirty-create@vcs1:
>
>      +  Statuses : 4 pass(s)
>      +  Exec time: [0.21, 1.88] s
>  * 
>
>     igt@gem_ctx_isolation@dirty-create@vecs0:
>
>      +  Statuses : 6 pass(s)
>      +  Exec time: [0.20, 2.00] s
>  * 
>
>     igt@gem_ctx_isolation@dirty-switch@bcs0:
>
>      +  Statuses : 6 pass(s)
>      +  Exec time: [0.20, 0.95] s
>  * 
>
>     igt@gem_ctx_isolation@dirty-switch@rcs0:
>
>      +  Statuses : 7 pass(s)
>      +  Exec time: [0.14, 0.76] s
>  * 
>
>     igt@gem_ctx_isolation@dirty-switch@vcs0:
>
>      +  Statuses : 6 pass(s)
>      +  Exec time: [0.20, 0.77] s
>  * 
>
>     igt@gem_ctx_isolation@dirty-switch@vcs1:
>
>      +  Statuses : 4 pass(s)
>      +  Exec time: [0.26, 1.49] s
>  * 
>
>     igt@gem_ctx_isolation@dirty-switch@vecs0:
>
>      +  Statuses : 6 pass(s)
>      +  Exec time: [0.21, 2.11] s
>  * 
>
>     igt@gem_ctx_isolation@nonpriv-switch@bcs0:
>
>      +  Statuses : 5 pass(s)
>      +  Exec time: [0.27, 1.13] s
>  * 
>
>     igt@gem_ctx_isolation@nonpriv-switch@rcs0:
>
>      +  Statuses : 5 pass(s) 1 skip(s)
>      +  Exec time: [0.0, 1.09] s
>  * 
>
>     igt@gem_ctx_isolation@nonpriv-switch@vcs0:
>
>      +  Statuses : 5 pass(s)
>      +  Exec time: [0.26, 1.14] s
>  * 
>
>     igt@gem_ctx_isolation@nonpriv-switch@vcs1:
>
>      +  Statuses : 4 pass(s)
>      +  Exec time: [0.29, 1.63] s
>  * 
>
>     igt@gem_ctx_isolation@nonpriv-switch@vecs0:
>
>      +  Statuses : 5 pass(s)
>      +  Exec time: [0.26, 2.00] s
>  * 
>
>     igt@gem_ctx_isolation@nonpriv@bcs0:
>
>      +  Statuses : 5 pass(s)
>      +  Exec time: [0.23, 1.01] s
>  * 
>
>     igt@gem_ctx_isolation@nonpriv@rcs0:
>
>      +  Statuses : 5 pass(s) 1 skip(s)
>      +  Exec time: [0.0, 0.96] s
>  * 
>
>     igt@gem_ctx_isolation@nonpriv@vcs0:
>
>      +  Statuses : 5 pass(s)
>      +  Exec time: [0.23, 1.06] s
>  * 
>
>     igt@gem_ctx_isolation@nonpriv@vcs1:
>
>      +  Statuses : 4 pass(s)
>      +  Exec time: [0.27, 1.40] s
>  * 
>
>     igt@gem_ctx_isolation@nonpriv@vecs0:
>
>      +  Statuses : 5 pass(s)
>      +  Exec time: [0.24, 2.06] s
>  * 
>
>     igt@gem_ctx_isolation@preservation-reset@bcs0:
>
>      +  Statuses : 4 pass(s)
>      +  Exec time: [0.17, 0.65] s
>  * 
>
>     igt@gem_ctx_isolation@preservation-reset@rcs0:
>
>      +  Statuses : 5 pass(s)
>      +  Exec time: [0.13, 0.61] s
>  * 
>
>     igt@gem_ctx_isolation@preservation-reset@vcs0:
>
>      +  Statuses : 4 pass(s)
>      +  Exec time: [0.18, 0.66] s
>  * 
>
>     igt@gem_ctx_isolation@preservation-reset@vcs1:
>
>      +  Statuses : 4 pass(s)
>      +  Exec time: [0.18, 1.40] s
>  * 
>
>     igt@gem_ctx_isolation@preservation-reset@vecs0:
>
>      +  Statuses : 4 pass(s)
>      +  Exec time: [0.18, 2.07] s
>  * 
>
>     igt@gem_ctx_isolation@preservation-s3@bcs0:
>
>      +  Statuses : 4 pass(s)
>      +  Exec time: [1.29, 10.06] s
>  * 
>
>     igt@gem_ctx_isolation@preservation-s3@rcs0:
>
>      +  Statuses : 5 pass(s)
>      +  Exec time: [1.03, 10.23] s
>  * 
>
>     igt@gem_ctx_isolation@preservation-s3@vcs0:
>
>      +  Statuses : 4 pass(s)
>      +  Exec time: [1.35, 9.97] s
>  * 
>
>     igt@gem_ctx_isolation@preservation-s3@vcs1:
>
>      +  Statuses : 4 pass(s)
>      +  Exec time: [1.38, 9.97] s
>  * 
>
>     igt@gem_ctx_isolation@preservation-s3@vecs0:
>
>      +  Statuses : 4 pass(s)
>      +  Exec time: [1.37, 10.06] s
>  * 
>
>     igt@gem_ctx_isolation@preservation@bcs0:
>
>      +  Statuses : 6 pass(s)
>      +  Exec time: [0.15, 1.23] s
>  * 
>
>     igt@gem_ctx_isolation@preservation@rcs0:
>
>      +  Statuses : 7 pass(s)
>      +  Exec time: [0.09, 1.05] s
>  * 
>
>     igt@gem_ctx_isolation@preservation@vcs0:
>
>      +  Statuses : 6 pass(s)
>      +  Exec time: [0.13, 0.95] s
>  * 
>
>     igt@gem_ctx_isolation@preservation@vcs1:
>
>      +  Statuses : 4 pass(s)
>      +  Exec time: [0.18, 1.92] s
>  * 
>
>     igt@gem_ctx_isolation@preservation@vecs0:
>
>      +  Statuses : 6 pass(s)
>      +  Exec time: [0.15, 2.00] s
>  * 
>
>     igt@gem_ctx_shared@exec-shared-gtt@bcs0:
>
>      +  Statuses : 5 pass(s)
>      +  Exec time: [0.00, 0.01] s
>  * 
>
>     igt@gem_ctx_shared@exec-shared-gtt@rcs0:
>
>      +  Statuses : 5 pass(s)
>      +  Exec time: [0.00, 0.01] s
>  * 
>
>     igt@gem_ctx_shared@exec-shared-gtt@vcs0:
>
>      +  Statuses : 5 pass(s)
>      +  Exec time: [0.00, 0.01] s
>  * 
>
>     igt@gem_ctx_shared@exec-shared-gtt@vcs1:
>
>      +  Statuses : 4 pass(s)
>      +  Exec time: [0.00, 0.01] s
>  * 
>
>     igt@gem_ctx_shared@exec-shared-gtt@vecs0:
>
>      +  Statuses : 5 pass(s)
>      +  Exec time: [0.00, 0.01] s
>  * 
>
>     igt@gem_ctx_shared@exec-single-timeline@bcs0:
>
>      +  Statuses : 6 pass(s)
>      +  Exec time: [1.02, 1.09] s
>  * 
>
>     igt@gem_ctx_shared@exec-single-timeline@rcs0:
>
>      +  Statuses : 6 pass(s)
>      +  Exec time: [1.02, 1.08] s
>  * 
>
>     igt@gem_ctx_shared@exec-single-timeline@vcs0:
>
>      +  Statuses : 6 pass(s)
>      +  Exec time: [1.02, 1.09] s
>  * 
>
>     igt@gem_ctx_shared@exec-single-timeline@vcs1:
>
>      +  Statuses : 4 pass(s)
>      +  Exec time: [1.02, 1.09] s
>  * 
>
>     igt@gem_ctx_shared@exec-single-timeline@vecs0:
>
>      +  Statuses : 6 pass(s)
>      +  Exec time: [1.02, 1.08] s
>  * 
>
>     igt@gem_ctx_shared@q-in-order@rcs0:
>
>      +  Statuses : 6 pass(s)
>      +  Exec time: [0.06, 0.33] s
>  * 
>
>     igt@gem_ctx_shared@q-in-order@vcs0:
>
>      +  Statuses : 6 pass(s)
>      +  Exec time: [0.05, 0.19] s
>  * 
>
>     igt@gem_ctx_shared@q-in-order@vcs1:
>
>      +  Statuses : 4 pass(s)
>      +  Exec time: [0.05, 0.19] s
>  * 
>
>     igt@gem_ctx_shared@q-in-order@vecs0:
>
>      +  Statuses : 6 pass(s)
>      +  Exec time: [0.05, 0.19] s
>  * 
>
>     igt@gem_ctx_shared@q-independent@rcs0:
>
>      +  Statuses : 5 pass(s)
>      +  Exec time: [0.02, 0.23] s
>  * 
>
>     igt@gem_ctx_shared@q-independent@vcs0:
>
>      +  Statuses : 5 pass(s)
>      +  Exec time: [0.02, 0.16] s
>  * 
>
>     igt@gem_ctx_shared@q-independent@vcs1:
>
>      +  Statuses : 4 pass(s)
>      +  Exec time: [0.02, 0.16] s
>  * 
>
>     igt@gem_ctx_shared@q-independent@vecs0:
>
>      +  Statuses : 5 pass(s)
>      +  Exec time: [0.02, 0.16] s
>  * 
>
>     igt@gem_ctx_shared@q-out-order@rcs0:
>
>      +  Statuses : 6 pass(s)
>      +  Exec time: [0.05, 0.27] s
>  * 
>
>     igt@gem_ctx_shared@q-out-order@vcs0:
>
>      +  Statuses : 6 pass(s)
>      +  Exec time: [0.05, 0.19] s
>  * 
>
>     igt@gem_ctx_shared@q-out-order@vcs1:
>
>      +  Statuses : 4 pass(s)
>      +  Exec time: [0.05, 0.19] s
>  * 
>
>     igt@gem_ctx_shared@q-out-order@vecs0:
>
>      +  Statuses : 6 pass(s)
>      +  Exec time: [0.05, 0.19] s
>  * 
>
>     igt@gem_ctx_shared@q-promotion@rcs0:
>
>      +  Statuses : 6 pass(s)
>      +  Exec time: [0.05, 0.27] s
>  * 
>
>     igt@gem_ctx_shared@q-promotion@vcs0:
>
>      +  Statuses : 6 pass(s)
>      +  Exec time: [0.05, 0.20] s
>  * 
>
>     igt@gem_ctx_shared@q-promotion@vcs1:
>
>      +  Statuses : 4 pass(s)
>      +  Exec time: [0.05, 0.19] s
>  * 
>
>     igt@gem_ctx_shared@q-promotion@vecs0:
>
>      +  Statuses : 6 pass(s)
>      +  Exec time: [0.05, 0.19] s
>  * 
>
>     igt@gem_ctx_shared@q-smoketest@bcs0:
>
>      +  Statuses : 5 pass(s)
>      +  Exec time: [5.42, 5.49] s
>  * 
>
>     igt@gem_ctx_shared@q-smoketest@rcs0:
>
>      +  Statuses : 5 pass(s)
>      +  Exec time: [5.42, 5.51] s
>  * 
>
>     igt@gem_ctx_shared@q-smoketest@vcs0:
>
>      +  Statuses : 5 pass(s)
>      +  Exec time: [5.42, 5.48] s
>  * 
>
>     igt@gem_ctx_shared@q-smoketest@vcs1:
>
>      +  Statuses : 4 pass(s)
>      +  Exec time: [5.42, 5.48] s
>  * 
>
>     igt@gem_ctx_shared@q-smoketest@vecs0:
>
>      +  Statuses : 5 pass(s)
>      +  Exec time: [5.42, 5.47] s
>  * 
>
>     igt@i915_pm_rps@2x-dpms-vs-vblank-race:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@i915_pm_rps@bad-hsync-end:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@i915_pm_rps@dmabuf-fence-before:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@i915_pm_rps@fbc-2p-rte:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@i915_pm_rps@flip-vs-blocking-wf-vblank:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@i915_pm_rps@medium-copy:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@i915_pm_rps@query-topology-matches-eu-total:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@i915_pm_rps@render-ccs:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@i915_pm_rps@verify-pxp-key-change-after-suspend-resume:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@kms_async_flips@2x-cursor-vs-flip-atomic:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@kms_async_flips@2x-flip-vs-absolute-wf_vblank:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@kms_async_flips@4-tiled-32bpp-rotate-90:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@kms_async_flips@alpha-opaque-fb:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@kms_async_flips@bad-handle:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@kms_async_flips@basic-norecovery:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@kms_async_flips@bo-write-verify-threaded-none:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@kms_async_flips@cursor-rapid-movement-64x21:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@kms_async_flips@debugfs-forcewake-user:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@kms_async_flips@dmabuf-export:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@kms_async_flips@drrs-dirtyfb-ioctl:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@kms_async_flips@extended-pageflip-hang-newfb:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@kms_async_flips@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@kms_async_flips@fbc-1p-primscrn-spr-indfb-draw-mmap-wc:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@kms_async_flips@fbc-2p-primscrn-cur-indfb-draw-render:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@kms_async_flips@fbc-2p-scndscrn-pri-shrfb-draw-pwrite:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@kms_async_flips@fbcpsr-1p-offscreen-pri-indfb-draw-render:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@kms_async_flips@fbcpsr-1p-primscrn-pri-shrfb-draw-render:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@kms_async_flips@fbcpsr-2p-primscrn-cur-indfb-draw-blt:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@kms_async_flips@fbcpsr-2p-primscrn-cur-indfb-draw-blt@pipe-c-hdmi-a-1:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@kms_async_flips@fbcpsr-2p-primscrn-spr-indfb-draw-render:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@kms_async_flips@fbcpsr-2p-scndscrn-indfb-msflip-blt:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@kms_async_flips@fbcpsr-stridechange:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@kms_async_flips@flip-32bpp-linear-to-64bpp-linear-downscaling:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@kms_async_flips@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@kms_async_flips@flip-vs-dpms-off-vs-modeset-interruptible:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@kms_async_flips@full:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@kms_async_flips@heavy-verify-multi-ccs:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@kms_async_flips@host-signal-ordered:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@kms_async_flips@hostile:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@kms_async_flips@invalid-illegal-eventfd:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@kms_async_flips@linear-64bpp-rotate-0:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@kms_async_flips@linear-max-hw-stride-64bpp-rotate-180-hflip:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@kms_async_flips@long-history:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@kms_async_flips@main:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@kms_async_flips@map-invalid-size:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@kms_async_flips@multi-wait-all-submitted-signaled:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@kms_async_flips@multigpu-basic-process:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@kms_async_flips@plane-scaler-with-clipping-clamping-modifiers:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@kms_async_flips@process-exit-busy:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@kms_async_flips@protected-encrypted-src-copy-not-readible:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@kms_async_flips@protected-encrypted-src-copy-not-readible@pipe-b-hdmi-a-1:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@kms_async_flips@psr-shrfb-scaledprimary:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@kms_async_flips@reloc-allocator:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@kms_async_flips@short-flip-before-cursor-atomic-transitions:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@kms_async_flips@sol-reset-invalid:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@kms_async_flips@stress-open-close:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@kms_async_flips@syncobj-timeline-wait:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@kms_async_flips@system-suspend-idle:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@kms_async_flips@u-fairslice:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@kms_async_flips@waits:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@kms_async_flips@waits@pipe-d-hdmi-a-1:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@kms_async_flips@x-tiled:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@kms_async_flips@y-tiled-16bpp-rotate-0:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@kms_async_flips@y-tiled-to-vebox-linear:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@kms_async_flips@yf-tiled-64bpp-rotate-270:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@kms_cursor_edge_walk@128x128-left-edge@pipe-a-dp-3:
>
>      +  Statuses : 1 pass(s)
>      +  Exec time: [3.48] s
>  * 
>
>     igt@kms_cursor_edge_walk@128x128-left-edge@pipe-d-dp-3:
>
>      +  Statuses : 1 pass(s)
>      +  Exec time: [3.33] s
>  * 
>
>     igt@kms_cursor_edge_walk@128x128-right-edge@pipe-a-hdmi-a-4:
>
>      +  Statuses : 1 pass(s)
>      +  Exec time: [3.33] s
>  * 
>
>     igt@kms_cursor_edge_walk@128x128-right-edge@pipe-d-hdmi-a-4:
>
>      +  Statuses : 1 pass(s)
>      +  Exec time: [3.21] s
>  * 
>
>     igt@kms_cursor_edge_walk@128x128-top-bottom@pipe-c-hdmi-a-1:
>
>      +  Statuses : 1 pass(s)
>      +  Exec time: [3.60] s
>  * 
>
>     igt@kms_cursor_edge_walk@256x256-left-edge@pipe-a-hdmi-a-1:
>
>      +  Statuses : 4 pass(s)
>      +  Exec time: [1.73, 3.81] s
>  * 
>
>     igt@kms_cursor_edge_walk@256x256-left-edge@pipe-b-hdmi-a-1:
>
>      +  Statuses : 1 pass(s)
>      +  Exec time: [3.33] s
>  * 
>
>     igt@kms_cursor_edge_walk@256x256-left-edge@pipe-c-hdmi-a-1:
>
>      +  Statuses : 2 pass(s)
>      +  Exec time: [3.41, 3.64] s
>  * 
>
>     igt@kms_cursor_edge_walk@256x256-top-edge@pipe-c-hdmi-a-1:
>
>      +  Statuses : 1 pass(s)
>      +  Exec time: [3.64] s
>  * 
>
>     igt@kms_cursor_edge_walk@64x64-right-edge@pipe-a-hdmi-a-4:
>
>      +  Statuses : 1 pass(s)
>      +  Exec time: [3.31] s
>  * 
>
>     igt@kms_cursor_edge_walk@64x64-right-edge@pipe-c-hdmi-a-2:
>
>      +  Statuses : 1 pass(s)
>      +  Exec time: [3.23] s
>  * 
>
>     igt@kms_cursor_edge_walk@64x64-right-edge@pipe-d-hdmi-a-4:
>
>      +  Statuses : 1 pass(s)
>      +  Exec time: [3.23] s
>  * 
>
>     igt@kms_draw_crc@draw-method-blt@rgb565-ytiled:
>
>      +  Statuses : 3 pass(s)
>      +  Exec time: [0.08, 0.18] s
>  * 
>
>     igt@kms_draw_crc@draw-method-blt@xrgb2101010-ytiled:
>
>      +  Statuses : 3 pass(s)
>      +  Exec time: [0.07, 0.16] s
>  * 
>
>     igt@kms_draw_crc@draw-method-blt@xrgb8888-ytiled:
>
>      +  Statuses : 3 pass(s)
>      +  Exec time: [0.10, 0.18] s
>  * 
>
>     igt@kms_draw_crc@draw-method-pwrite@rgb565-ytiled:
>
>      +  Statuses : 3 pass(s)
>      +  Exec time: [0.16, 0.58] s
>  * 
>
>     igt@kms_draw_crc@draw-method-pwrite@xrgb2101010-ytiled:
>
>      +  Statuses : 3 pass(s)
>      +  Exec time: [0.15, 0.88] s
>  * 
>
>     igt@kms_draw_crc@draw-method-pwrite@xrgb8888-ytiled:
>
>      +  Statuses : 3 pass(s)
>      +  Exec time: [0.16, 0.90] s
>  * 
>
>     igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
>
>      +  Statuses : 1 pass(s) 5 skip(s)
>      +  Exec time: [0.0, 7.00] s
>  * 
>
>     igt@kms_plane@bad-flags-fd-to-handle:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@kms_plane@bad-handle-to-fd:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@kms_plane@basic-ultra-joiner:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@kms_plane@binary-wait-before-signal:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@kms_plane@busy-fence:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@kms_plane@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@kms_plane@cursor-onscreen-128x42:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@kms_plane@cursor-size-hints:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@kms_plane@display-protected-crc:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@kms_plane@dp-mst-type-0-suspend-resume:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@kms_plane@dsc-with-formats:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@kms_plane@execbuf:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@kms_plane@fbc-2p-primscrn-pri-shrfb-draw-render:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@kms_plane@fbc-2p-primscrn-shrfb-pgflip-blt:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@kms_plane@fbc-2p-scndscrn-cur-indfb-draw-render:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@kms_plane@fbc-suspend:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@kms_plane@fbcpsr-1p-primscrn-cur-indfb-onoff:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@kms_plane@fbcpsr-rgb101010-draw-blt:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@kms_plane@flip-vs-cursor-atomic:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@kms_plane@flipline:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@kms_plane@force-edid:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@kms_plane@invalid-set-no-zeromap:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@kms_plane@load:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@kms_plane@master-drop-set-user:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@kms_plane@master-rmfb:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@kms_plane@modeset-pc8-residency-stress:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@kms_plane@non-system-wide-paranoid:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@kms_plane@plain-flip-ts-check:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@kms_plane@pr-cursor-mmap-cpu:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@kms_plane@psr-1p-primscrn-cur-indfb-draw-pwrite:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@kms_plane@psr-1p-primscrn-spr-indfb-onoff:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@kms_plane@psr-2p-scndscrn-spr-indfb-move:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@kms_plane@query-busy-hang:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@kms_plane@sliced:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@kms_plane@suspend-resume:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@kms_plane@system-suspend-execbuf:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@kms_plane@test_userptr:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@kms_plane@wait-all-interrupted:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@kms_plane@y-tiled-8bpp-rotate-90:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@kms_plane@yf-tiled-32bpp-rotate-0:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
>
>      +  Statuses : 1 pass(s) 5 skip(s)
>      +  Exec time: [0.0, 11.57] s
>  * 
>
>     igt@kms_setmode@invalid-clone-single-crtc@pipe-a-hdmi-a-1-hdmi-a-2:
>
>      +  Statuses : 1 pass(s)
>      +  Exec time: [0.03] s
>  * 
>
>     igt@kms_setmode@invalid-clone-single-crtc@pipe-b-hdmi-a-1-hdmi-a-2:
>
>      +  Statuses : 1 pass(s)
>      +  Exec time: [0.04] s
>  * 
>
>     igt@sysfs_heartbeat_interval@idempotent@bcs0:
>
>      +  Statuses : 6 pass(s)
>      +  Exec time: [0.00] s
>  * 
>
>     igt@sysfs_heartbeat_interval@idempotent@rcs0:
>
>      +  Statuses : 6 pass(s)
>      +  Exec time: [0.00] s
>  * 
>
>     igt@sysfs_heartbeat_interval@idempotent@vcs0:
>
>      +  Statuses : 6 pass(s)
>      +  Exec time: [0.0, 0.00] s
>  * 
>
>     igt@sysfs_heartbeat_interval@idempotent@vcs1:
>
>      +  Statuses : 4 pass(s)
>      +  Exec time: [0.0, 0.00] s
>  * 
>
>     igt@sysfs_heartbeat_interval@idempotent@vecs0:
>
>      +  Statuses : 5 pass(s)
>      +  Exec time: [0.00] s
>  * 
>
>     igt@sysfs_heartbeat_interval@invalid@bcs0:
>
>      +  Statuses : 7 pass(s)
>      +  Exec time: [0.0, 0.00] s
>  * 
>
>     igt@sysfs_heartbeat_interval@invalid@rcs0:
>
>      +  Statuses : 7 pass(s)
>      +  Exec time: [0.0, 0.00] s
>  * 
>
>     igt@sysfs_heartbeat_interval@invalid@vcs0:
>
>      +  Statuses : 7 pass(s)
>      +  Exec time: [0.0, 0.00] s
>  * 
>
>     igt@sysfs_heartbeat_interval@invalid@vcs1:
>
>      +  Statuses : 4 pass(s)
>      +  Exec time: [0.0] s
>  * 
>
>     igt@sysfs_heartbeat_interval@invalid@vecs0:
>
>      +  Statuses : 6 pass(s)
>      +  Exec time: [0.0, 0.00] s
>  * 
>
>     igt@sysfs_heartbeat_interval@mixed@bcs0:
>
>      +  Statuses : 5 pass(s) 1 skip(s)
>      +  Exec time: [0.0, 5.32] s
>  * 
>
>     igt@sysfs_heartbeat_interval@mixed@rcs0:
>
>      +  Statuses : 5 pass(s) 1 skip(s)
>      +  Exec time: [0.0, 5.30] s
>  * 
>
>     igt@sysfs_heartbeat_interval@mixed@vcs0:
>
>      +  Statuses : 5 pass(s) 1 skip(s)
>      +  Exec time: [0.0, 5.33] s
>  * 
>
>     igt@sysfs_heartbeat_interval@mixed@vcs1:
>
>      +  Statuses : 4 pass(s)
>      +  Exec time: [5.06, 5.22] s
>  * 
>
>     igt@sysfs_heartbeat_interval@mixed@vecs0:
>
>      +  Statuses : 5 pass(s)
>      +  Exec time: [5.16, 5.31] s
>  * 
>
>     igt@sysfs_heartbeat_interval@nopreempt@bcs0:
>
>      +  Statuses : 6 pass(s)
>      +  Exec time: [3.63, 4.21] s
>  * 
>
>     igt@sysfs_heartbeat_interval@nopreempt@rcs0:
>
>      +  Statuses : 6 pass(s)
>      +  Exec time: [3.66, 4.34] s
>  * 
>
>     igt@sysfs_heartbeat_interval@nopreempt@vcs0:
>
>      +  Statuses : 6 pass(s)
>      +  Exec time: [3.61, 9.94] s
>  * 
>
>     igt@sysfs_heartbeat_interval@nopreempt@vcs1:
>
>      +  Statuses : 4 pass(s)
>      +  Exec time: [3.64, 9.95] s
>  * 
>
>     igt@sysfs_heartbeat_interval@nopreempt@vecs0:
>
>      +  Statuses : 6 pass(s)
>      +  Exec time: [3.62, 9.81] s
>  * 
>
>     igt@sysfs_heartbeat_interval@precise@bcs0:
>
>      +  Statuses : 5 pass(s) 1 skip(s)
>      +  Exec time: [0.0, 2.96] s
>  * 
>
>     igt@sysfs_heartbeat_interval@precise@rcs0:
>
>      +  Statuses : 5 pass(s) 1 skip(s)
>      +  Exec time: [0.0, 1.53] s
>  * 
>
>     igt@sysfs_heartbeat_interval@precise@vcs0:
>
>      +  Statuses : 5 pass(s) 1 skip(s)
>      +  Exec time: [0.0, 7.74] s
>  * 
>
>     igt@sysfs_heartbeat_interval@precise@vcs1:
>
>      +  Statuses : 4 pass(s)
>      +  Exec time: [1.59, 7.73] s
>  * 
>
>     igt@sysfs_heartbeat_interval@precise@vecs0:
>
>      +  Statuses : 5 pass(s)
>      +  Exec time: [1.57, 7.22] s
>  * 
>
>     igt@sysfs_preempt_timeout@idempotent@bcs0:
>
>      +  Statuses : 5 pass(s) 1 skip(s)
>      +  Exec time: [0.0, 0.00] s
>  * 
>
>     igt@sysfs_preempt_timeout@idempotent@rcs0:
>
>      +  Statuses : 5 pass(s) 1 skip(s)
>      +  Exec time: [0.0, 0.00] s
>  * 
>
>     igt@sysfs_preempt_timeout@idempotent@vcs0:
>
>      +  Statuses : 5 pass(s) 1 skip(s)
>      +  Exec time: [0.0, 0.00] s
>  * 
>
>     igt@sysfs_preempt_timeout@idempotent@vcs1:
>
>      +  Statuses : 4 pass(s)
>      +  Exec time: [0.0, 0.00] s
>  * 
>
>     igt@sysfs_preempt_timeout@idempotent@vecs0:
>
>      +  Statuses : 5 pass(s)
>      +  Exec time: [0.0, 0.00] s
>  * 
>
>     igt@sysfs_preempt_timeout@invalid@bcs0:
>
>      +  Statuses : 6 pass(s) 1 skip(s)
>      +  Exec time: [0.0, 0.00] s
>  * 
>
>     igt@sysfs_preempt_timeout@invalid@rcs0:
>
>      +  Statuses : 6 pass(s) 1 skip(s)
>      +  Exec time: [0.0, 0.00] s
>  * 
>
>     igt@sysfs_preempt_timeout@invalid@vcs0:
>
>      +  Statuses : 6 pass(s) 1 skip(s)
>      +  Exec time: [0.0, 0.00] s
>  * 
>
>     igt@sysfs_preempt_timeout@invalid@vcs1:
>
>      +  Statuses : 4 pass(s)
>      +  Exec time: [0.0] s
>  * 
>
>     igt@sysfs_preempt_timeout@invalid@vecs0:
>
>      +  Statuses : 6 pass(s)
>      +  Exec time: [0.0, 0.00] s
>  * 
>
>     igt@sysfs_preempt_timeout@timeout@bcs0:
>
>      +  Statuses : 4 pass(s) 1 skip(s)
>      +  Exec time: [0.0, 1.70] s
>  * 
>
>     igt@sysfs_preempt_timeout@timeout@rcs0:
>
>      +  Statuses : 4 pass(s) 1 skip(s)
>      +  Exec time: [0.0, 1.65] s
>  * 
>
>     igt@sysfs_preempt_timeout@timeout@vcs0:
>
>      +  Statuses : 4 pass(s) 1 skip(s)
>      +  Exec time: [0.0, 9.60] s
>  * 
>
>     igt@sysfs_preempt_timeout@timeout@vcs1:
>
>      +  Statuses : 4 pass(s)
>      +  Exec time: [0.94, 9.28] s
>  * 
>
>     igt@sysfs_preempt_timeout@timeout@vecs0:
>
>      +  Statuses : 4 pass(s)
>      +  Exec time: [1.00, 9.65] s
>  * 
>
>     igt@sysfs_timeslice_duration@duration@bcs0:
>
>      +  Statuses : 5 pass(s) 1 skip(s)
>      +  Exec time: [0.0, 13.17] s
>  * 
>
>     igt@sysfs_timeslice_duration@duration@rcs0:
>
>      +  Statuses : 5 pass(s) 1 skip(s)
>      +  Exec time: [0.0, 13.17] s
>  * 
>
>     igt@sysfs_timeslice_duration@duration@vcs0:
>
>      +  Statuses : 5 pass(s) 1 skip(s)
>      +  Exec time: [0.0, 13.86] s
>  * 
>
>     igt@sysfs_timeslice_duration@duration@vcs1:
>
>      +  Statuses : 4 pass(s)
>      +  Exec time: [0.07, 13.65] s
>  * 
>
>     igt@sysfs_timeslice_duration@duration@vecs0:
>
>      +  Statuses : 5 pass(s)
>      +  Exec time: [0.08, 13.47] s
>  * 
>
>     igt@sysfs_timeslice_duration@idempotent@bcs0:
>
>      +  Statuses : 4 pass(s) 1 skip(s)
>      +  Exec time: [0.0, 0.00] s
>  * 
>
>     igt@sysfs_timeslice_duration@idempotent@rcs0:
>
>      +  Statuses : 4 pass(s) 1 skip(s)
>      +  Exec time: [0.0, 0.00] s
>  * 
>
>     igt@sysfs_timeslice_duration@idempotent@vcs0:
>
>      +  Statuses : 4 pass(s) 1 skip(s)
>      +  Exec time: [0.0, 0.00] s
>  * 
>
>     igt@sysfs_timeslice_duration@idempotent@vcs1:
>
>      +  Statuses : 3 pass(s)
>      +  Exec time: [0.0, 0.00] s
>  * 
>
>     igt@sysfs_timeslice_duration@idempotent@vecs0:
>
>      +  Statuses : 4 pass(s)
>      +  Exec time: [0.0, 0.00] s
>  * 
>
>     igt@sysfs_timeslice_duration@invalid@bcs0:
>
>      +  Statuses : 6 pass(s) 1 skip(s)
>      +  Exec time: [0.0, 0.00] s
>  * 
>
>     igt@sysfs_timeslice_duration@invalid@rcs0:
>
>      +  Statuses : 6 pass(s) 1 skip(s)
>      +  Exec time: [0.0, 0.00] s
>  * 
>
>     igt@sysfs_timeslice_duration@invalid@vcs0:
>
>      +  Statuses : 6 pass(s) 1 skip(s)
>      +  Exec time: [0.0, 0.02] s
>  * 
>
>     igt@sysfs_timeslice_duration@invalid@vcs1:
>
>      +  Statuses : 4 pass(s)
>      +  Exec time: [0.0] s
>  * 
>
>     igt@sysfs_timeslice_duration@invalid@vecs0:
>
>      +  Statuses : 6 pass(s)
>      +  Exec time: [0.0, 0.00] s
>  * 
>
>     igt@sysfs_timeslice_duration@timeout@bcs0:
>
>      +  Statuses : 5 pass(s) 1 skip(s)
>      +  Exec time: [0.0, 1.11] s
>  * 
>
>     igt@sysfs_timeslice_duration@timeout@rcs0:
>
>      +  Statuses : 5 pass(s) 1 skip(s)
>      +  Exec time: [0.0, 1.70] s
>  * 
>
>     igt@sysfs_timeslice_duration@timeout@vcs0:
>
>      +  Statuses : 5 pass(s) 1 skip(s)
>      +  Exec time: [0.0, 9.67] s
>  * 
>
>     igt@sysfs_timeslice_duration@timeout@vcs1:
>
>      +  Statuses : 4 pass(s)
>      +  Exec time: [0.98, 10.03] s
>  * 
>
>     igt@sysfs_timeslice_duration@timeout@vecs0:
>
>      +  Statuses : 5 pass(s)
>      +  Exec time: [0.94, 9.75] s
> 
> KNOWN ISSUES
> 
> Here are the changes found in IGTPW_14554_full that come from known issues:
>
>   IGT changes
>
>     Issues hit
>
>  * 
>
>     igt@api_intel_bb@object-reloc-keep-cache:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#8411)
>      +  shard-dg1: NOTRUN -> SKIP (i915#8411)
>      +  shard-mtlp: NOTRUN -> SKIP (i915#8411)
>      +  shard-dg2: NOTRUN -> SKIP (i915#8411)
>  * 
>
>     igt@gem_basic@multigpu-create-close:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#7697)
>  * 
>
>     igt@gem_ccs@block-copy-compressed:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#3555 / i915#9323)
>  * 
>
>     igt@gem_ccs@block-multicopy-compressed:
>
>      +  shard-dg1: NOTRUN -> SKIP (i915#9323)
>  * 
>
>     igt@gem_ccs@ctrl-surf-copy:
>
>      +  shard-tglu: NOTRUN -> SKIP (i915#3555 / i915#9323)
>  * 
>
>     igt@gem_close_race@multigpu-basic-process:
>
>      +  shard-tglu: NOTRUN -> SKIP (i915#7697)
>  * 
>
>     igt@gem_create@create-ext-cpu-access-sanity-check:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#6335) +1 other test skip
>  * 
>
>     igt@gem_ctx_persistence@heartbeat-many:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#8555)
>  * 
>
>     igt@gem_ctx_persistence@smoketest:
>
>      +  shard-snb: NOTRUN -> SKIP (i915#1099)
>  * 
>
>     igt@gem_ctx_sseu@engines:
>
>      +  shard-tglu-1: NOTRUN -> SKIP (i915#280)
>  * 
>
>     igt@gem_ctx_sseu@invalid-sseu:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#280)
>      +  shard-rkl: NOTRUN -> SKIP (i915#280) +1 other test skip
>      +  shard-dg1: NOTRUN -> SKIP (i915#280) +1 other test skip
>      +  shard-tglu: NOTRUN -> SKIP (i915#280)
>  * 
>
>     igt@gem_eio@kms:
>
>      +  shard-tglu: PASS -> ABORT (i915#13363)
>  * 
>
>     igt@gem_exec_balancer@parallel:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#4525) +1 other test skip
>  * 
>
>     igt@gem_exec_balancer@parallel-out-fence:
>
>      +  shard-tglu: NOTRUN -> SKIP (i915#4525)
>  * 
>
>     igt@gem_exec_big@single:
>
>      +  shard-tglu: NOTRUN -> ABORT (i915#11713)
>  * 
>
>     igt@gem_exec_capture@capture-invisible@smem0:
>
>      +  shard-glk: NOTRUN -> SKIP (i915#6334) +1 other test skip
>  * 
>
>     igt@gem_exec_capture@capture-recoverable:
>
>      +  shard-tglu-1: NOTRUN -> SKIP (i915#6344)
>  * 
>
>     igt@gem_exec_flush@basic-uc-set-default:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#3539)
>      +  shard-dg1: NOTRUN -> SKIP (i915#3539)
>  * 
>
>     igt@gem_exec_flush@basic-wb-pro-default:
>
>      +  shard-dg1: NOTRUN -> SKIP (i915#3539 / i915#4852)
>  * 
>
>     igt@gem_exec_reloc@basic-softpin:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#3281) +3 other tests skip
>  * 
>
>     igt@gem_exec_reloc@basic-wc-active:
>
>      +  shard-dg1: NOTRUN -> SKIP (i915#3281) +3 other tests skip
>  * 
>
>     igt@gem_exec_reloc@basic-wc-cpu:
>
>      +  shard-mtlp: NOTRUN -> SKIP (i915#3281) +1 other test skip
>  * 
>
>     igt@gem_exec_reloc@basic-wc-read-active:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#3281)
>  * 
>
>     igt@gem_exec_reloc@basic-write-read-active:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#3281) +11 other tests skip
>  * 
>
>     igt@gem_exec_schedule@deep@rcs0:
>
>      +  shard-mtlp: NOTRUN -> SKIP (i915#4537)
>  * 
>
>     igt@gem_fenced_exec_thrash@no-spare-fences-interruptible:
>
>      +  shard-dg1: NOTRUN -> SKIP (i915#4860)
>  * 
>
>     igt@gem_lmem_evict@dontneed-evict-race:
>
>      +  shard-tglu: NOTRUN -> SKIP (i915#4613 / i915#7582)
>  * 
>
>     igt@gem_lmem_swapping@heavy-multi:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#4613)
>  * 
>
>     igt@gem_lmem_swapping@massive-random:
>
>      +  shard-glk: NOTRUN -> SKIP (i915#4613) +5 other tests skip
>  * 
>
>     igt@gem_lmem_swapping@parallel-random-verify-ccs:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#4613) +1 other test skip
>  * 
>
>     igt@gem_lmem_swapping@verify:
>
>      +  shard-tglu-1: NOTRUN -> SKIP (i915#4613) +1 other test skip
>  * 
>
>     igt@gem_madvise@dontneed-before-exec:
>
>      +  shard-mtlp: NOTRUN -> SKIP (i915#3282) +1 other test skip
>      +  shard-dg2: NOTRUN -> SKIP (i915#3282)
>  * 
>
>     igt@gem_media_vme:
>
>      +  shard-dg1: NOTRUN -> SKIP (i915#284)
>  * 
>
>     igt@gem_mmap_gtt@basic-small-copy-xy:
>
>      +  shard-dg1: NOTRUN -> SKIP (i915#4077) +4 other tests skip
>  * 
>
>     igt@gem_mmap_gtt@cpuset-medium-copy-xy:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#4077) +7 other tests skip
>  * 
>
>     igt@gem_mmap_wc@read:
>
>      +  shard-dg1: NOTRUN -> SKIP (i915#4083) +2 other tests skip
>  * 
>
>     igt@gem_mmap_wc@read-write:
>
>      +  shard-mtlp: NOTRUN -> SKIP (i915#4083) +2 other tests skip
>      +  shard-dg2: NOTRUN -> SKIP (i915#4083) +1 other test skip
>  * 
>
>     igt@gem_partial_pwrite_pread@reads-snoop:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#3282)
>  * 
>
>     igt@gem_pwrite@basic-exhaustion:
>
>      +  shard-glk10: NOTRUN -> WARN (i915#14702 / i915#2658)
>  * 
>
>     igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#4270) +2 other tests skip
>      +  shard-dg1: NOTRUN -> SKIP (i915#4270) +1 other test skip
>  * 
>
>     igt@gem_pxp@hw-rejects-pxp-context:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#13717)
>  * 
>
>     igt@gem_readwrite@read-bad-handle:
>
>      +  shard-dg1: NOTRUN -> SKIP (i915#3282) +1 other test skip
>  * 
>
>     igt@gem_render_copy@y-tiled-ccs-to-y-tiled:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#5190 / i915#8428) +1 other test skip
>  * 
>
>     igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled:
>
>      +  shard-mtlp: NOTRUN -> SKIP (i915#8428) +1 other test skip
>  * 
>
>     igt@gem_set_tiling_vs_blt@tiled-to-untiled:
>
>      +  shard-mtlp: NOTRUN -> SKIP (i915#4079)
>  * 
>
>     igt@gem_tiled_partial_pwrite_pread@writes:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#3282) +3 other tests skip
>  * 
>
>     igt@gem_tiled_pread_basic@basic:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#15656)
>      +  shard-dg1: NOTRUN -> SKIP (i915#15657)
>  * 
>
>     igt@gem_userptr_blits@coherency-sync:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#3297)
>      +  shard-tglu-1: NOTRUN -> SKIP (i915#3297)
>      +  shard-dg1: NOTRUN -> SKIP (i915#3297)
>  * 
>
>     igt@gem_userptr_blits@dmabuf-sync:
>
>      +  shard-tglu-1: NOTRUN -> SKIP (i915#3297 / i915#3323)
>  * 
>
>     igt@gem_userptr_blits@forbidden-operations:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#3282 / i915#3297)
>  * 
>
>     igt@gem_userptr_blits@map-fixed-invalidate-busy:
>
>      +  shard-mtlp: NOTRUN -> SKIP (i915#3297) +1 other test skip
>  * 
>
>     igt@gem_userptr_blits@relocations:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#3281 / i915#3297)
>      +  shard-dg1: NOTRUN -> SKIP (i915#3281 / i915#3297)
>  * 
>
>     igt@gem_workarounds@suspend-resume-context:
>
>      +  shard-rkl: NOTRUN -> INCOMPLETE (i915#13356)
>  * 
>
>     igt@gen7_exec_parse@basic-rejected:
>
>      +  shard-dg2: NOTRUN -> SKIP +3 other tests skip
>  * 
>
>     igt@gen9_exec_parse@bb-chained:
>
>      +  shard-tglu-1: NOTRUN -> SKIP (i915#2527 / i915#2856) +1 other test skip
>  * 
>
>     igt@gen9_exec_parse@bb-oversize:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#2527) +2 other tests skip
>      +  shard-mtlp: NOTRUN -> SKIP (i915#2856)
>  * 
>
>     igt@gen9_exec_parse@bb-secure:
>
>      +  shard-tglu: NOTRUN -> SKIP (i915#2527 / i915#2856) +1 other test skip
>  * 
>
>     igt@gen9_exec_parse@bb-start-cmd:
>
>      +  shard-dg1: NOTRUN -> SKIP (i915#2527) +1 other test skip
>      +  shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#2527)
>  * 
>
>     igt@gen9_exec_parse@unaligned-jump:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#2856) +2 other tests skip
>  * 
>
>     igt@i915_drm_fdinfo@isolation@rcs0:
>
>      +  shard-mtlp: NOTRUN -> SKIP (i915#14073) +6 other tests skip
>  * 
>
>     igt@i915_drm_fdinfo@virtual-busy-hang:
>
>      +  shard-dg1: NOTRUN -> SKIP (i915#14118)
>  * 
>
>     igt@i915_drm_fdinfo@virtual-busy-idle-all:
>
>      +  shard-mtlp: NOTRUN -> SKIP (i915#14118)
>  * 
>
>     igt@i915_module_load@fault-injection@intel_connector_register:
>
>      +  shard-glk10: NOTRUN -> ABORT (i915#15342) +1 other test abort
>  * 
>
>     igt@i915_module_load@fault-injection@intel_gt_init-enodev:
>
>      +  shard-glk10: NOTRUN -> SKIP +263 other tests skip
>  * 
>
>     igt@i915_module_load@resize-bar:
>
>      +  shard-dg2: NOTRUN -> DMESG-WARN (i915#14545)
>  * 
>
>     igt@i915_pm_freq_api@freq-basic-api:
>
>      +  shard-tglu: NOTRUN -> SKIP (i915#8399)
>      +  shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#8399)
>  * 
>
>     igt@i915_pm_freq_api@freq-reset:
>
>      +  shard-tglu-1: NOTRUN -> SKIP (i915#8399)
>  * 
>
>     igt@i915_pm_freq_api@freq-reset-multiple:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#8399)
>  * 
>
>     igt@i915_pm_rc6_residency@rc6-idle:
>
>      +  shard-tglu-1: NOTRUN -> SKIP (i915#14498)
>  * 
>
>     igt@i915_pm_rpm@system-suspend-devices:
>
>      +  shard-snb: NOTRUN -> SKIP +127 other tests skip
>  * 
>
>     igt@i915_pm_rpm@system-suspend-execbuf:
>
>      +  shard-glk: NOTRUN -> INCOMPLETE (i915#13356 / i915#15172)
>  * 
>
>     igt@i915_pm_rps@reset:
>
>      +  shard-snb: PASS -> INCOMPLETE (i915#13729 / i915#13821)
>  * 
>
>     igt@i915_pm_rps@thresholds-idle-park:
>
>      +  shard-dg1: NOTRUN -> SKIP (i915#11681)
>  * 
>
>     igt@i915_power@sanity:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#7984)
>  * 
>
>     igt@i915_query@hwconfig_table:
>
>      +  shard-tglu-1: NOTRUN -> SKIP (i915#6245)
>  * 
>
>     igt@i915_suspend@basic-s3-without-i915:
>
>      +  shard-tglu: NOTRUN -> INCOMPLETE (i915#4817 / i915#7443)
>  * 
>
>     igt@i915_suspend@fence-restore-tiled2untiled:
>
>      +  shard-mtlp: NOTRUN -> SKIP (i915#4077) +2 other tests skip
>  * 
>
>     igt@intel_hwmon@hwmon-read:
>
>      +  shard-mtlp: NOTRUN -> SKIP (i915#7707)
>  * 
>
>     igt@kms_addfb_basic@bo-too-small:
>
>      +  shard-dg1: PASS -> DMESG-WARN (i915#4391 / i915#4423)
>  * 
>
>     igt@kms_async_flips@async-flip-suspend-resume:
>
>      +  shard-rkl: PASS -> INCOMPLETE (i915#12761)
>      +  shard-glk: NOTRUN -> INCOMPLETE (i915#12761) +1 other test incomplete
>  * 
>
>     igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-2:
>
>      +  shard-rkl: NOTRUN -> INCOMPLETE (i915#12761)
>  * 
>
>     igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic:
>
>      +  shard-dg2: PASS -> ABORT (i915#13562)
>  * 
>
>     igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-a-hdmi-a-1:
>
>      +  shard-dg2: NOTRUN -> DMESG-WARN (i915#13562)
>  * 
>
>     igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
>
>      +  shard-tglu: NOTRUN -> SKIP (i915#1769 / i915#3555)
>      +  shard-glk: NOTRUN -> SKIP (i915#1769)
>  * 
>
>     igt@kms_big_fb@4-tiled-16bpp-rotate-180:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#5286) +8 other tests skip
>      +  shard-dg1: NOTRUN -> SKIP (i915#4538 / i915#5286) +5 other tests skip
>  * 
>
>     igt@kms_big_fb@4-tiled-16bpp-rotate-90:
>
>      +  shard-tglu-1: NOTRUN -> SKIP (i915#5286) +1 other test skip
>  * 
>
>     igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#5286)
>  * 
>
>     igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180:
>
>      +  shard-tglu: NOTRUN -> SKIP (i915#5286) +5 other tests skip
>  * 
>
>     igt@kms_big_fb@linear-8bpp-rotate-270:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#3638) +1 other test skip
>  * 
>
>     igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:
>
>      +  shard-tglu: NOTRUN -> SKIP (i915#3828)
>  * 
>
>     igt@kms_big_fb@x-tiled-32bpp-rotate-90:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#3638)
>  * 
>
>     igt@kms_big_fb@y-tiled-64bpp-rotate-90:
>
>      +  shard-dg1: NOTRUN -> SKIP (i915#3638) +1 other test skip
>  * 
>
>     igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
>
>      +  shard-mtlp: NOTRUN -> SKIP +10 other tests skip
>  * 
>
>     igt@kms_big_fb@yf-tiled-8bpp-rotate-180:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#4538 / i915#5190) +6 other tests skip
>  * 
>
>     igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>
>      +  shard-dg1: NOTRUN -> SKIP (i915#4538) +1 other test skip
>  * 
>
>     igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4:
>
>      +  shard-dg1: NOTRUN -> SKIP (i915#6095) +215 other tests skip
>  * 
>
>     igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#12313) +1 other test skip
>  * 
>
>     igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-a-edp-1:
>
>      +  shard-mtlp: NOTRUN -> SKIP (i915#6095) +24 other tests skip
>  * 
>
>     igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-b-hdmi-a-1:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#10307 / i915#6095) +104 other tests skip
>  * 
>
>     igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#12313) +2 other tests skip
>      +  shard-dg1: NOTRUN -> SKIP (i915#12313)
>      +  shard-tglu: NOTRUN -> SKIP (i915#12313)
>      +  shard-mtlp: NOTRUN -> SKIP (i915#12313)
>  * 
>
>     igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#10307 / i915#10434 / i915#6095) +1 other test skip
>  * 
>
>     igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
>
>      +  shard-tglu-1: NOTRUN -> SKIP (i915#12313)
>  * 
>
>     igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-3:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#6095) +57 other tests skip
>  * 
>
>     igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-2:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#6095) +11 other tests skip
>  * 
>
>     igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#14098 / i915#14544 / i915#6095) +6 other tests skip
>  * 
>
>     igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#6095) +63 other tests skip
>  * 
>
>     igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
>
>      +  shard-dg1: NOTRUN -> SKIP (i915#12805)
>  * 
>
>     igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2:
>
>      +  shard-rkl: NOTRUN -> INCOMPLETE (i915#15582) +1 other test incomplete
>  * 
>
>     igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-c-hdmi-a-2:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#14098 / i915#6095) +42 other tests skip
>  * 
>
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
>
>      +  shard-tglu-1: NOTRUN -> SKIP (i915#6095) +34 other tests skip
>  * 
>
>     igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:
>
>      +  shard-tglu: NOTRUN -> SKIP (i915#6095) +44 other tests skip
>  * 
>
>     igt@kms_cdclk@plane-scaling@pipe-c-dp-3:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#13783) +3 other tests skip
>  * 
>
>     igt@kms_chamelium_audio@dp-audio:
>
>      +  shard-tglu: NOTRUN -> SKIP (i915#11151 / i915#7828) +4 other tests skip
>  * 
>
>     igt@kms_chamelium_audio@hdmi-audio:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#11151 / i915#7828) +9 other tests skip
>  * 
>
>     igt@kms_chamelium_edid@dp-edid-read:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#11151 / i915#14544 / i915#7828)
>  * 
>
>     igt@kms_chamelium_frames@hdmi-crc-fast:
>
>      +  shard-dg1: NOTRUN -> SKIP (i915#11151 / i915#7828) +2 other tests skip
>  * 
>
>     igt@kms_chamelium_hpd@dp-hpd-after-suspend:
>
>      +  shard-tglu-1: NOTRUN -> SKIP (i915#11151 / i915#7828) +3 other tests skip
>  * 
>
>     igt@kms_chamelium_hpd@hdmi-hpd-after-suspend:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#11151 / i915#7828) +3 other tests skip
>  * 
>
>     igt@kms_chamelium_hpd@hdmi-hpd-storm:
>
>      +  shard-mtlp: NOTRUN -> SKIP (i915#11151 / i915#7828) +1 other test skip
>  * 
>
>     igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-a-edp-1:
>
>      +  shard-mtlp: NOTRUN -> FAIL (i915#15522) +4 other tests fail
>  * 
>
>     igt@kms_content_protection@atomic-dpms:
>
>      +  shard-tglu-1: NOTRUN -> SKIP (i915#6944 / i915#7116 / i915#7118 / i915#9424)
>  * 
>
>     igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:
>
>      +  shard-tglu: NOTRUN -> SKIP (i915#15330)
>  * 
>
>     igt@kms_content_protection@dp-mst-type-0:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#15330 / i915#3116)
>      +  shard-dg1: NOTRUN -> SKIP (i915#15330 / i915#3299)
>      +  shard-tglu: NOTRUN -> SKIP (i915#15330 / i915#3116 / i915#3299)
>      +  shard-mtlp: NOTRUN -> SKIP (i915#15330 / i915#3299)
>      +  shard-dg2: NOTRUN -> SKIP (i915#15330 / i915#3299)
>  * 
>
>     igt@kms_content_protection@dp-mst-type-0-suspend-resume:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#15330)
>  * 
>
>     igt@kms_content_protection@legacy:
>
>      +  shard-tglu: NOTRUN -> SKIP (i915#6944 / i915#7116 / i915#7118 / i915#9424)
>      +  shard-dg2: NOTRUN -> SKIP (i915#6944 / i915#7118 / i915#9424)
>      +  shard-rkl: NOTRUN -> SKIP (i915#6944 / i915#7118 / i915#9424)
>      +  shard-dg1: NOTRUN -> SKIP (i915#6944 / i915#7116 / i915#9424)
>  * 
>
>     igt@kms_content_protection@lic-type-0:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#6944 / i915#9424)
>      +  shard-dg1: NOTRUN -> SKIP (i915#6944 / i915#9424)
>  * 
>
>     igt@kms_content_protection@lic-type-0-hdcp14:
>
>      +  shard-tglu-1: NOTRUN -> SKIP (i915#6944)
>  * 
>
>     igt@kms_content_protection@lic-type-1:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#6944 / i915#9424)
>  * 
>
>     igt@kms_content_protection@suspend-resume:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#6944) +1 other test skip
>  * 
>
>     igt@kms_content_protection@uevent:
>
>      +  shard-mtlp: NOTRUN -> SKIP (i915#6944 / i915#9424) +1 other test skip
>  * 
>
>     igt@kms_cursor_crc@cursor-offscreen-32x32:
>
>      +  shard-tglu-1: NOTRUN -> SKIP (i915#3555) +1 other test skip
>  * 
>
>     igt@kms_cursor_crc@cursor-offscreen-512x170:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#13049) +1 other test skip
>  * 
>
>     igt@kms_cursor_crc@cursor-offscreen-64x21:
>
>      +  shard-mtlp: NOTRUN -> SKIP (i915#8814)
>  * 
>
>     igt@kms_cursor_crc@cursor-offscreen-max-size:
>
>      +  shard-dg1: NOTRUN -> SKIP (i915#3555) +5 other tests skip
>  * 
>
>     igt@kms_cursor_crc@cursor-onscreen-64x21@pipe-a-hdmi-a-1:
>
>      +  shard-tglu: NOTRUN -> FAIL (i915#13566) +1 other test fail
>  * 
>
>     igt@kms_cursor_crc@cursor-random-256x85:
>
>      +  shard-rkl: PASS -> FAIL (i915#13566) +2 other tests fail
>  * 
>
>     igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-2:
>
>      +  shard-rkl: NOTRUN -> FAIL (i915#13566)
>  * 
>
>     igt@kms_cursor_crc@cursor-random-32x10:
>
>      +  shard-tglu: NOTRUN -> SKIP (i915#3555) +4 other tests skip
>      +  shard-mtlp: NOTRUN -> SKIP (i915#3555 / i915#8814) +2 other tests skip
>  * 
>
>     igt@kms_cursor_crc@cursor-random-512x512:
>
>      +  shard-tglu-1: NOTRUN -> SKIP (i915#13049)
>  * 
>
>     igt@kms_cursor_crc@cursor-random-64x21:
>
>      +  shard-tglu: PASS -> FAIL (i915#13566) +1 other test fail
>  * 
>
>     igt@kms_cursor_crc@cursor-rapid-movement-32x10:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#3555) +7 other tests skip
>  * 
>
>     igt@kms_cursor_crc@cursor-sliding-512x170:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#13049) +1 other test skip
>  * 
>
>     igt@kms_cursor_crc@cursor-suspend:
>
>      +  shard-glk: NOTRUN -> INCOMPLETE (i915#12358 / i915#14152 / i915#7882)
>      +  shard-rkl: PASS -> INCOMPLETE (i915#12358 / i915#14152)
>  * 
>
>     igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:
>
>      +  shard-glk: NOTRUN -> INCOMPLETE (i915#12358 / i915#14152)
>  * 
>
>     igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-2:
>
>      +  shard-rkl: NOTRUN -> INCOMPLETE (i915#12358 / i915#14152)
>  * 
>
>     igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
>
>      +  shard-mtlp: NOTRUN -> SKIP (i915#9809) +2 other tests skip
>  * 
>
>     igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#13046 / i915#5354) +3 other tests skip
>  * 
>
>     igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
>
>      +  shard-tglu: NOTRUN -> SKIP (i915#4103)
>  * 
>
>     igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
>
>      +  shard-glk: NOTRUN -> FAIL (i915#2346)
>  * 
>
>     igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
>
>      +  shard-mtlp: NOTRUN -> SKIP (i915#9067)
>      +  shard-dg2: NOTRUN -> SKIP (i915#9067)
>      +  shard-dg1: NOTRUN -> SKIP (i915#9067)
>      +  shard-tglu: NOTRUN -> SKIP (i915#9067)
>  * 
>
>     igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
>
>      +  shard-mtlp: NOTRUN -> SKIP (i915#4213)
>  * 
>
>     igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
>
>      +  shard-tglu-1: NOTRUN -> SKIP (i915#4103) +1 other test skip
>  * 
>
>     igt@kms_dp_aux_dev:
>
>      +  shard-dg2: PASS -> SKIP (i915#1257)
>      +  shard-dg1: NOTRUN -> SKIP (i915#1257)
>  * 
>
>     igt@kms_dp_link_training@non-uhbr-sst:
>
>      +  shard-dg2: PASS -> SKIP (i915#13749)
>      +  shard-tglu: NOTRUN -> SKIP (i915#13749)
>  * 
>
>     igt@kms_dp_link_training@uhbr-mst:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#13748)
>  * 
>
>     igt@kms_dp_linktrain_fallback@dsc-fallback:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#13707)
>      +  shard-rkl: NOTRUN -> SKIP (i915#13707)
>      +  shard-dg1: NOTRUN -> SKIP (i915#13707)
>      +  shard-tglu: NOTRUN -> SKIP (i915#13707)
>  * 
>
>     igt@kms_dsc@dsc-fractional-bpp-with-bpc:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#3840)
>  * 
>
>     igt@kms_dsc@dsc-with-bpc-formats:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#3555 / i915#3840)
>      +  shard-dg1: NOTRUN -> SKIP (i915#3555 / i915#3840)
>  * 
>
>     igt@kms_dsc@dsc-with-formats:
>
>      +  shard-tglu: NOTRUN -> SKIP (i915#3555 / i915#3840)
>  * 
>
>     igt@kms_dsc@dsc-with-output-formats:
>
>      +  shard-tglu-1: NOTRUN -> SKIP (i915#3555 / i915#3840)
>  * 
>
>     igt@kms_fbcon_fbt@psr:
>
>      +  shard-tglu: NOTRUN -> SKIP (i915#3469)
>  * 
>
>     igt@kms_feature_discovery@chamelium:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#4854)
>  * 
>
>     igt@kms_feature_discovery@display-3x:
>
>      +  shard-tglu: NOTRUN -> SKIP (i915#1839)
>  * 
>
>     igt@kms_fence_pin_leak:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#4881)
>  * 
>
>     igt@kms_flip@2x-absolute-wf_vblank:
>
>      +  shard-tglu-1: NOTRUN -> SKIP (i915#3637 / i915#9934) +1 other test skip
>  * 
>
>     igt@kms_flip@2x-absolute-wf_vblank-interruptible:
>
>      +  shard-mtlp: NOTRUN -> SKIP (i915#3637 / i915#9934) +6 other tests skip
>  * 
>
>     igt@kms_flip@2x-flip-vs-panning-vs-hang:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#9934) +5 other tests skip
>  * 
>
>     igt@kms_flip@2x-nonexisting-fb:
>
>      +  shard-tglu: NOTRUN -> SKIP (i915#3637 / i915#9934) +8 other tests skip
>  * 
>
>     igt@kms_flip@2x-plain-flip:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#9934) +12 other tests skip
>  * 
>
>     igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
>
>      +  shard-dg1: NOTRUN -> SKIP (i915#9934) +7 other tests skip
>  * 
>
>     igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:
>
>      +  shard-tglu: NOTRUN -> SKIP (i915#15643) +3 other tests skip
>      +  shard-mtlp: NOTRUN -> SKIP (i915#3555 / i915#8810 / i915#8813)
>      +  shard-rkl: NOTRUN -> SKIP (i915#15643) +5 other tests skip
>      +  shard-dg1: NOTRUN -> SKIP (i915#15643) +1 other test skip
>  * 
>
>     igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-default-mode:
>
>      +  shard-mtlp: NOTRUN -> SKIP (i915#8810 / i915#8813)
>  * 
>
>     igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#15643)
>  * 
>
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:
>
>      +  shard-mtlp: NOTRUN -> SKIP (i915#15643)
>      +  shard-dg2: NOTRUN -> SKIP (i915#15643 / i915#5190)
>  * 
>
>     igt@kms_force_connector_basic@prune-stale-modes:
>
>      +  shard-mtlp: PASS -> SKIP (i915#15672)
>  * 
>
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#1825) +4 other tests skip
>  * 
>
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-gtt:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#8708) +7 other tests skip
>      +  shard-mtlp: NOTRUN -> SKIP (i915#8708)
>  * 
>
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
>
>      +  shard-tglu-1: NOTRUN -> SKIP +33 other tests skip
>  * 
>
>     igt@kms_frontbuffer_tracking@fbc-suspend:
>
>      +  shard-rkl: PASS -> INCOMPLETE (i915#10056)
>  * 
>
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-cpu:
>
>      +  shard-dg1: NOTRUN -> SKIP (i915#15102)
>  * 
>
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-gtt:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#15102 / i915#3023) +1 other test skip
>  * 
>
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move:
>
>      +  shard-tglu-1: NOTRUN -> SKIP (i915#15102) +9 other tests skip
>  * 
>
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#15102 / i915#3458) +8 other tests skip
>  * 
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt:
>
>      +  shard-rkl: NOTRUN -> SKIP +27 other tests skip
>  * 
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-pwrite:
>
>      +  shard-dg1: NOTRUN -> SKIP +29 other tests skip
>  * 
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-cpu:
>
>      +  shard-mtlp: NOTRUN -> SKIP (i915#1825) +18 other tests skip
>  * 
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen:
>
>      +  shard-tglu: NOTRUN -> SKIP +40 other tests skip
>  * 
>
>     igt@kms_frontbuffer_tracking@fbcpsr-tiling-4 (NEW):
>
>      +  shard-dg2: SKIP (i915#10433 / i915#15102 / i915#3458) -> SKIP (i915#15102 / i915#3458)
>  * 
>
>     igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-cpu:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#15102)
>  * 
>
>     igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-wc:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#15102) +1 other test skip
>  * 
>
>     igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-wc:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#15102) +3 other tests skip
>      +  shard-dg1: NOTRUN -> SKIP (i915#15104) +1 other test skip
>  * 
>
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#15102 / i915#3023) +23 other tests skip
>  * 
>
>     igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#1825) +40 other tests skip
>  * 
>
>     igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-pwrite:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#5354) +19 other tests skip
>  * 
>
>     igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:
>
>      +  shard-dg1: NOTRUN -> SKIP (i915#8708) +6 other tests skip
>  * 
>
>     igt@kms_frontbuffer_tracking@psr-rgb565-draw-pwrite:
>
>      +  shard-dg1: NOTRUN -> SKIP (i915#15102 / i915#3458) +8 other tests skip
>  * 
>
>     igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary:
>
>      +  shard-tglu: NOTRUN -> SKIP (i915#15102) +14 other tests skip
>  * 
>
>     igt@kms_hdr@invalid-hdr:
>
>      +  shard-tglu-1: NOTRUN -> SKIP (i915#3555 / i915#8228)
>  * 
>
>     igt@kms_hdr@invalid-metadata-sizes:
>
>      +  shard-mtlp: NOTRUN -> SKIP (i915#12713 / i915#3555 / i915#8228)
>      +  shard-dg2: NOTRUN -> SKIP (i915#3555 / i915#8228) +1 other test skip
>      +  shard-rkl: NOTRUN -> SKIP (i915#3555 / i915#8228)
>      +  shard-dg1: NOTRUN -> SKIP (i915#3555 / i915#8228) +1 other test skip
>      +  shard-tglu: NOTRUN -> SKIP (i915#3555 / i915#8228)
>  * 
>
>     igt@kms_hdr@static-swap:
>
>      +  shard-rkl: PASS -> SKIP (i915#3555 / i915#8228) +1 other test skip
>  * 
>
>     igt@kms_joiner@invalid-modeset-force-big-joiner:
>
>      +  shard-dg2: PASS -> SKIP (i915#15459)
>      +  shard-tglu: NOTRUN -> SKIP (i915#15459)
>  * 
>
>     igt@kms_joiner@invalid-modeset-force-ultra-joiner:
>
>      +  shard-tglu-1: NOTRUN -> SKIP (i915#15458)
>      +  shard-mtlp: NOTRUN -> SKIP (i915#15458)
>  * 
>
>     igt@kms_panel_fitting@legacy:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#6301)
>  * 
>
>     igt@kms_pipe_stress@stress-xrgb8888-yftiled:
>
>      +  shard-tglu: NOTRUN -> SKIP (i915#14712)
>      +  shard-dg2: NOTRUN -> SKIP (i915#14712)
>      +  shard-rkl: NOTRUN -> SKIP (i915#14712)
>      +  shard-dg1: NOTRUN -> SKIP (i915#14712)
>  * 
>
>     igt@kms_pipe_stress@stress-xrgb8888-ytiled:
>
>      +  shard-mtlp: NOTRUN -> SKIP (i915#13705)
>  * 
>
>     igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier:
>
>      +  shard-tglu-1: NOTRUN -> SKIP (i915#8825) +2 other tests skip
>  * 
>
>     igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier:
>
>      +  shard-tglu: NOTRUN -> SKIP (i915#8825) +5 other tests skip
>      +  shard-mtlp: NOTRUN -> SKIP (i915#8825) +3 other tests skip
>  * 
>
>     igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#8825) +5 other tests skip
>  * 
>
>     igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier:
>
>      +  shard-dg1: NOTRUN -> SKIP (i915#8825) +2 other tests skip
>  * 
>
>     igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#8825) +3 other tests skip
>  * 
>
>     igt@kms_plane@pixel-format-y-tiled-modifier@pipe-a-plane-7:
>
>      +  shard-tglu-1: NOTRUN -> SKIP (i915#15608) +1 other test skip
>  * 
>
>     igt@kms_plane@planar-pixel-format-settings:
>
>      +  shard-mtlp: PASS -> ABORT (i915#13562)
>  * 
>
>     igt@kms_plane_alpha_blend@alpha-transparent-fb:
>
>      +  shard-glk10: NOTRUN -> FAIL (i915#10647 / i915#12177)
>  * 
>
>     igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-a-hdmi-a-1:
>
>      +  shard-glk10: NOTRUN -> FAIL (i915#10647) +3 other tests fail
>  * 
>
>     igt@kms_plane_alpha_blend@constant-alpha-max:
>
>      +  shard-glk10: NOTRUN -> FAIL (i915#10647 / i915#12169)
>  * 
>
>     igt@kms_plane_lowres@tiling-y:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#8821)
>      +  shard-dg1: PASS -> DMESG-WARN (i915#4423)
>  * 
>
>     igt@kms_plane_scaling@intel-max-src-size:
>
>      +  shard-dg2: PASS -> SKIP (i915#6953 / i915#9423)
>      +  shard-rkl: NOTRUN -> SKIP (i915#6953)
>      +  shard-tglu-1: NOTRUN -> SKIP (i915#6953)
>      +  shard-dg1: NOTRUN -> SKIP (i915#6953)
>  * 
>
>     igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:
>
>      +  shard-tglu-1: NOTRUN -> SKIP (i915#15329) +4 other tests skip
>  * 
>
>     igt@kms_pm_backlight@basic-brightness:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#5354) +2 other tests skip
>  * 
>
>     igt@kms_pm_backlight@brightness-with-dpms:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#12343)
>  * 
>
>     igt@kms_pm_backlight@fade-with-dpms:
>
>      +  shard-tglu-1: NOTRUN -> SKIP (i915#9812)
>  * 
>
>     igt@kms_pm_dc@dc6-psr:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#9685)
>  * 
>
>     igt@kms_pm_lpsp@screens-disabled:
>
>      +  shard-tglu: NOTRUN -> SKIP (i915#8430)
>  * 
>
>     igt@kms_pm_rpm@dpms-lpsp:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#15073)
>      +  shard-dg1: NOTRUN -> SKIP (i915#15073)
>  * 
>
>     igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
>
>      +  shard-rkl: PASS -> SKIP (i915#15073) +1 other test skip
>  * 
>
>     igt@kms_pm_rpm@modeset-lpsp-stress:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#15073)
>  * 
>
>     igt@kms_pm_rpm@modeset-non-lpsp:
>
>      +  shard-dg2: PASS -> SKIP (i915#15073)
>  * 
>
>     igt@kms_pm_rpm@modeset-non-lpsp-stress:
>
>      +  shard-dg1: PASS -> SKIP (i915#15073)
>  * 
>
>     igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
>
>      +  shard-tglu: NOTRUN -> SKIP (i915#15073) +1 other test skip
>      +  shard-mtlp: NOTRUN -> SKIP (i915#15073)
>  * 
>
>     igt@kms_pm_rpm@package-g7:
>
>      +  shard-tglu: NOTRUN -> SKIP (i915#15403)
>  * 
>
>     igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#11520) +4 other tests skip
>  * 
>
>     igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1:
>
>      +  shard-mtlp: NOTRUN -> SKIP (i915#9808) +2 other tests skip
>  * 
>
>     igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-b-edp-1:
>
>      +  shard-mtlp: NOTRUN -> SKIP (i915#12316) +6 other tests skip
>  * 
>
>     igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:
>
>      +  shard-tglu-1: NOTRUN -> SKIP (i915#11520) +3 other tests skip
>  * 
>
>     igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#11520) +15 other tests skip
>  * 
>
>     igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:
>
>      +  shard-glk: NOTRUN -> SKIP (i915#11520) +15 other tests skip
>  * 
>
>     igt@kms_psr2_sf@psr2-cursor-plane-update-sf:
>
>      +  shard-glk10: NOTRUN -> SKIP (i915#11520) +5 other tests skip
>  * 
>
>     igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
>
>      +  shard-snb: NOTRUN -> SKIP (i915#11520) +3 other tests skip
>      +  shard-dg1: NOTRUN -> SKIP (i915#11520) +4 other tests skip
>      +  shard-tglu: NOTRUN -> SKIP (i915#11520) +6 other tests skip
>  * 
>
>     igt@kms_psr2_su@frontbuffer-xrgb8888:
>
>      +  shard-tglu-1: NOTRUN -> SKIP (i915#9683)
>  * 
>
>     igt@kms_psr2_su@page_flip-nv12:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#9683)
>  * 
>
>     igt@kms_psr2_su@page_flip-p010:
>
>      +  shard-mtlp: NOTRUN -> SKIP (i915#4348)
>  * 
>
>     igt@kms_psr@fbc-pr-primary-mmap-gtt:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#1072 / i915#9732) +12 other tests skip
>  * 
>
>     igt@kms_psr@fbc-psr-cursor-render:
>
>      +  shard-tglu: NOTRUN -> SKIP (i915#9732) +15 other tests skip
>  * 
>
>     igt@kms_psr@fbc-psr-primary-mmap-cpu@edp-1:
>
>      +  shard-mtlp: NOTRUN -> SKIP (i915#9688) +7 other tests skip
>  * 
>
>     igt@kms_psr@pr-sprite-render:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#1072 / i915#14544 / i915#9732) +2 other tests skip
>  * 
>
>     igt@kms_psr@pr-suspend:
>
>      +  shard-tglu-1: NOTRUN -> SKIP (i915#9732) +9 other tests skip
>  * 
>
>     igt@kms_psr@psr-sprite-plane-move:
>
>      +  shard-dg1: NOTRUN -> SKIP (i915#1072 / i915#9732) +14 other tests skip
>  * 
>
>     igt@kms_psr@psr2-cursor-mmap-gtt:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#1072 / i915#9732) +29 other tests skip
>  * 
>
>     igt@kms_psr@psr2-sprite-plane-onoff:
>
>      +  shard-glk: NOTRUN -> SKIP +438 other tests skip
>  * 
>
>     igt@kms_psr_stress_test@flip-primary-invalidate-overlay (NEW):
>
>      +  shard-tglu: NOTRUN -> SKIP (i915#9685)
>  * 
>
>     igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
>
>      +  shard-tglu-1: NOTRUN -> SKIP (i915#9685)
>      +  shard-rkl: NOTRUN -> SKIP (i915#9685)
>  * 
>
>     igt@kms_rotation_crc@exhaust-fences:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#4235)
>  * 
>
>     igt@kms_rotation_crc@multiplane-rotation-cropping-top:
>
>      +  shard-glk: NOTRUN -> INCOMPLETE (i915#15492) +1 other test incomplete
>  * 
>
>     igt@kms_rotation_crc@primary-rotation-270:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#12755) +1 other test skip
>      +  shard-mtlp: NOTRUN -> SKIP (i915#12755)
>  * 
>
>     igt@kms_setmode@basic-clone-single-crtc:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#3555) +4 other tests skip
>  * 
>
>     igt@kms_setmode@invalid-clone-single-crtc:
>
>      +  shard-mtlp: NOTRUN -> SKIP (i915#3555 / i915#8809)
>      +  shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#3555)
>  * 
>
>     igt@kms_vrr@flip-basic:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#15243 / i915#3555) +1 other test skip
>  * 
>
>     igt@kms_vrr@flip-suspend:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#15243 / i915#3555)
>  * 
>
>     igt@kms_vrr@seamless-rr-switch-vrr:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#9906)
>      +  shard-dg1: NOTRUN -> SKIP (i915#9906)
>  * 
>
>     igt@perf@global-sseu-config:
>
>      +  shard-mtlp: NOTRUN -> SKIP (i915#7387)
>      +  shard-dg2: NOTRUN -> SKIP (i915#7387)
>  * 
>
>     igt@perf@unprivileged-single-ctx-counters:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#2433)
>  * 
>
>     igt@perf_pmu@rc6-all-gts:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#8516)
>  * 
>
>     igt@perf_pmu@rc6-suspend:
>
>      +  shard-glk: NOTRUN -> INCOMPLETE (i915#13356 / i915#14242)
>  * 
>
>     igt@prime_vgem@coherency-gtt:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#3708)
>  * 
>
>     igt@sriov_basic@enable-vfs-autoprobe-on:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#9917)
>
>     Possible fixes
>
>  * 
>
>     igt@gem_ccs@suspend-resume:
>
>      +  shard-dg2: INCOMPLETE (i915#13356) -> PASS
>  * 
>
>     igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-lmem0-lmem0:
>
>      +  shard-dg2: INCOMPLETE (i915#12392 / i915#13356) -> PASS
>  * 
>
>     igt@gem_exec_suspend@basic-s3@smem:
>
>      +  shard-snb: ABORT (i915#14871) -> PASS +1 other test pass
>  * 
>
>     igt@gem_workarounds@suspend-resume:
>
>      +  shard-glk: INCOMPLETE (i915#13356 / i915#14586) -> PASS
>  * 
>
>     igt@gem_workarounds@suspend-resume-fd:
>
>      +  shard-rkl: INCOMPLETE (i915#13356) -> PASS +2 other tests pass
>  * 
>
>     igt@i915_pm_rc6_residency@rc6-fence:
>
>      +  shard-tglu: WARN (i915#13790 / i915#2681) -> PASS +1 other test pass
>  * 
>
>     igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-3:
>
>      +  shard-dg2: FAIL (i915#5956) -> PASS +1 other test pass
>  * 
>
>     igt@kms_cursor_crc@cursor-onscreen-128x42:
>
>      +  shard-rkl: FAIL (i915#13566) -> PASS +3 other tests pass
>  * 
>
>     igt@kms_cursor_crc@cursor-random-64x64:
>
>      +  shard-dg1: DMESG-WARN (i915#4423) -> PASS +1 other test pass
>  * 
>
>     igt@kms_cursor_crc@cursor-sliding-256x85:
>
>      +  shard-tglu: FAIL (i915#13566) -> PASS +3 other tests pass
>  * 
>
>     igt@kms_flip@2x-flip-vs-suspend-interruptible:
>
>      +  shard-snb: TIMEOUT (i915#14033 / i915#14350) -> PASS
>  * 
>
>     igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-vga1-hdmi-a1:
>
>      +  shard-snb: TIMEOUT (i915#14033) -> PASS
>  * 
>
>     igt@kms_flip@flip-vs-dpms-on-nop-interruptible:
>
>      +  shard-rkl: FAIL (i915#10826) -> PASS +1 other test pass
>  * 
>
>     igt@kms_hdr@bpc-switch:
>
>      +  shard-dg2: SKIP (i915#3555 / i915#8228) -> PASS
>  * 
>
>     igt@kms_hdr@static-toggle:
>
>      +  shard-rkl: SKIP (i915#3555 / i915#8228) -> PASS
>  * 
>
>     igt@kms_plane_cursor@primary@pipe-d-edp-1-size-64:
>
>      +  shard-mtlp: DMESG-WARN -> PASS +1 other test pass
>  * 
>
>     igt@kms_pm_rpm@modeset-lpsp:
>
>      +  shard-dg1: SKIP (i915#15073) -> PASS +2 other tests pass
>  * 
>
>     igt@kms_pm_rpm@system-suspend-idle:
>
>      +  shard-dg2: INCOMPLETE (i915#14419) -> PASS
>  * 
>
>     igt@kms_vblank@ts-continuation-suspend:
>
>      +  shard-rkl: INCOMPLETE (i915#12276) -> PASS
>  * 
>
>     igt@perf_pmu@busy-double-start@vecs1:
>
>      +  shard-dg2: FAIL (i915#4349) -> PASS +4 other tests pass
>
>     Warnings
>
>  * 
>
>     igt@device_reset@cold-reset-bound:
>
>      +  shard-rkl: SKIP (i915#11078) -> SKIP (i915#11078 / i915#14544)
>  * 
>
>     igt@device_reset@unbind-cold-reset-rebind:
>
>      +  shard-rkl: SKIP (i915#11078 / i915#14544) -> SKIP (i915#11078)
>  * 
>
>     igt@gem_ccs@ctrl-surf-copy-new-ctx:
>
>      +  shard-rkl: SKIP (i915#9323) -> SKIP (i915#14544 / i915#9323)
>  * 
>
>     igt@gem_exec_balancer@parallel-keep-in-fence:
>
>      +  shard-rkl: SKIP (i915#4525) -> SKIP (i915#14544 / i915#4525)
>  * 
>
>     igt@gem_exec_reloc@basic-gtt-read-noreloc:
>
>      +  shard-rkl: SKIP (i915#14544 / i915#3281) -> SKIP (i915#3281) +3 other tests skip
>  * 
>
>     igt@gem_exec_reloc@basic-wc-read-noreloc:
>
>      +  shard-rkl: SKIP (i915#3281) -> SKIP (i915#14544 / i915#3281) +4 other tests skip
>  * 
>
>     igt@gem_lmem_swapping@heavy-verify-random:
>
>      +  shard-rkl: SKIP (i915#14544 / i915#4613) -> SKIP (i915#4613)
>  * 
>
>     igt@gem_partial_pwrite_pread@writes-after-reads:
>
>      +  shard-rkl: SKIP (i915#3282) -> SKIP (i915#14544 / i915#3282) +2 other tests skip
>  * 
>
>     igt@gem_pxp@hw-rejects-pxp-buffer:
>
>      +  shard-rkl: SKIP (i915#13717 / i915#14544) -> SKIP (i915#13717)
>  * 
>
>     igt@gem_readwrite@read-write:
>
>      +  shard-rkl: SKIP (i915#14544 / i915#3282) -> SKIP (i915#3282)
>  * 
>
>     igt@gem_set_tiling_vs_blt@tiled-to-tiled:
>
>      +  shard-rkl: SKIP (i915#8411) -> SKIP (i915#14544 / i915#8411)
>  * 
>
>     igt@gem_userptr_blits@access-control:
>
>      +  shard-rkl: SKIP (i915#3297) -> SKIP (i915#14544 / i915#3297)
>  * 
>
>     igt@gem_userptr_blits@unsync-overlap:
>
>      +  shard-rkl: SKIP (i915#14544 / i915#3297) -> SKIP (i915#3297)
>  * 
>
>     igt@gen7_exec_parse@batch-without-end:
>
>      +  shard-rkl: SKIP (i915#14544) -> SKIP +5 other tests skip
>  * 
>
>     igt@gen9_exec_parse@batch-invalid-length:
>
>      +  shard-rkl: SKIP (i915#14544 / i915#2527) -> SKIP (i915#2527)
>  * 
>
>     igt@intel_hwmon@hwmon-read:
>
>      +  shard-rkl: SKIP (i915#7707) -> SKIP (i915#14544 / i915#7707)
>  * 
>
>     igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
>
>      +  shard-rkl: SKIP (i915#12454 / i915#12712 / i915#14544) -> SKIP (i915#12454 / i915#12712)
>  * 
>
>     igt@kms_big_fb@4-tiled-32bpp-rotate-0:
>
>      +  shard-rkl: SKIP (i915#5286) -> SKIP (i915#14544 / i915#5286) +1 other test skip
>  * 
>
>     igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
>
>      +  shard-rkl: SKIP (i915#14544 / i915#5286) -> SKIP (i915#5286)
>  * 
>
>     igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:
>
>      +  shard-rkl: SKIP (i915#14544 / i915#3828) -> SKIP (i915#3828)
>  * 
>
>     igt@kms_big_fb@x-tiled-8bpp-rotate-270:
>
>      +  shard-rkl: SKIP (i915#3638) -> SKIP (i915#14544 / i915#3638)
>  * 
>
>     igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs:
>
>      +  shard-rkl: SKIP (i915#14098 / i915#6095) -> SKIP (i915#14098 / i915#14544 / i915#6095) +4 other tests skip
>  * 
>
>     igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
>
>      +  shard-rkl: SKIP (i915#12805 / i915#14544) -> SKIP (i915#12805)
>  * 
>
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs:
>
>      +  shard-rkl: SKIP (i915#14098 / i915#14544 / i915#6095) -> SKIP (i915#14098 / i915#6095) +2 other tests skip
>  * 
>
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-2:
>
>      +  shard-rkl: SKIP (i915#14544 / i915#6095) -> SKIP (i915#6095) +1 other test skip
>  * 
>
>     igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
>
>      +  shard-rkl: SKIP (i915#12313 / i915#14544) -> SKIP (i915#12313)
>  * 
>
>     igt@kms_cdclk@mode-transition-all-outputs:
>
>      +  shard-rkl: SKIP (i915#3742) -> SKIP (i915#14544 / i915#3742)
>  * 
>
>     igt@kms_chamelium_frames@hdmi-aspect-ratio:
>
>      +  shard-dg1: SKIP (i915#11151 / i915#4423 / i915#7828) -> SKIP (i915#11151 / i915#7828)
>  * 
>
>     igt@kms_chamelium_frames@hdmi-crc-single:
>
>      +  shard-rkl: SKIP (i915#11151 / i915#14544 / i915#7828) -> SKIP (i915#11151 / i915#7828) +2 other tests skip
>  * 
>
>     igt@kms_chamelium_frames@vga-frame-dump:
>
>      +  shard-rkl: SKIP (i915#11151 / i915#7828) -> SKIP (i915#11151 / i915#14544 / i915#7828) +1 other test skip
>  * 
>
>     igt@kms_content_protection@atomic:
>
>      +  shard-rkl: SKIP (i915#6944 / i915#7118 / i915#9424) -> SKIP (i915#14544 / i915#6944 / i915#7118 / i915#9424)
>  * 
>
>     igt@kms_content_protection@dp-mst-lic-type-0:
>
>      +  shard-rkl: SKIP (i915#14544 / i915#15330 / i915#3116) -> SKIP (i915#15330 / i915#3116)
>  * 
>
>     igt@kms_content_protection@lic-type-0:
>
>      +  shard-dg2: FAIL (i915#7173) -> SKIP (i915#6944 / i915#9424)
>  * 
>
>     igt@kms_content_protection@mei-interface:
>
>      +  shard-rkl: SKIP (i915#14544 / i915#6944 / i915#9424) -> SKIP (i915#6944 / i915#9424)
>      +  shard-dg1: SKIP (i915#6944 / i915#9424) -> SKIP (i915#9433)
>  * 
>
>     igt@kms_content_protection@type1:
>
>      +  shard-dg2: SKIP (i915#6944 / i915#7118 / i915#9424) -> SKIP (i915#6944 / i915#7118 / i915#7162 / i915#9424)
>  * 
>
>     igt@kms_cursor_crc@cursor-sliding-512x512:
>
>      +  shard-dg1: SKIP (i915#13049 / i915#4423) -> SKIP (i915#13049)
>  * 
>
>     igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
>
>      +  shard-dg1: SKIP (i915#9723) -> SKIP (i915#4423 / i915#9723)
>  * 
>
>     igt@kms_dither@fb-8bpc-vs-panel-6bpc:
>
>      +  shard-rkl: SKIP (i915#14544 / i915#3555 / i915#3804) -> SKIP (i915#3555 / i915#3804)
>  * 
>
>     igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
>
>      +  shard-rkl: SKIP (i915#14544 / i915#3804) -> SKIP (i915#3804)
>  * 
>
>     igt@kms_dsc@dsc-with-output-formats:
>
>      +  shard-rkl: SKIP (i915#14544 / i915#3555 / i915#3840) -> SKIP (i915#3555 / i915#3840)
>  * 
>
>     igt@kms_fbcon_fbt@psr:
>
>      +  shard-rkl: SKIP (i915#3955) -> SKIP (i915#14544 / i915#3955)
>  * 
>
>     igt@kms_feature_discovery@display-2x:
>
>      +  shard-rkl: SKIP (i915#1839) -> SKIP (i915#14544 / i915#1839)
>  * 
>
>     igt@kms_flip@2x-flip-vs-dpms-on-nop:
>
>      +  shard-rkl: SKIP (i915#9934) -> SKIP (i915#14544 / i915#9934)
>  * 
>
>     igt@kms_flip@2x-flip-vs-suspend-interruptible:
>
>      +  shard-rkl: SKIP (i915#14544 / i915#9934) -> SKIP (i915#9934) +1 other test skip
>  * 
>
>     igt@kms_flip@flip-vs-suspend:
>
>      +  shard-glk: INCOMPLETE (i915#12745 / i915#4839 / i915#6113) -> INCOMPLETE (i915#12745 / i915#4839)
>  * 
>
>     igt@kms_flip@flip-vs-suspend-interruptible:
>
>      +  shard-glk: INCOMPLETE (i915#12745 / i915#4839) -> INCOMPLETE (i915#12314 / i915#12745 / i915#4839 / i915#6113)
>  * 
>
>     igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:
>
>      +  shard-glk: INCOMPLETE (i915#12745) -> INCOMPLETE (i915#12314 / i915#12745)
>  * 
>
>     igt@kms_flip@flip-vs-suspend@a-hdmi-a1:
>
>      +  shard-glk: INCOMPLETE (i915#12745 / i915#6113) -> INCOMPLETE (i915#12745)
>  * 
>
>     igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
>
>      +  shard-rkl: SKIP (i915#14544 / i915#15643) -> SKIP (i915#15643) +1 other test skip
>  * 
>
>     igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
>
>      +  shard-rkl: SKIP (i915#15643) -> SKIP (i915#14544 / i915#15643)
>  * 
>
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-pwrite:
>
>      +  shard-rkl: SKIP (i915#15102) -> SKIP (i915#14544 / i915#15102)
>  * 
>
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:
>
>      +  shard-dg2: SKIP (i915#10433 / i915#15102 / i915#3458) -> SKIP (i915#15102 / i915#3458) +1 other test skip
>  * 
>
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt:
>
>      +  shard-dg2: SKIP (i915#15102 / i915#3458) -> SKIP (i915#10433 / i915#15102 / i915#3458) +2 other tests skip
>  * 
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt:
>
>      +  shard-rkl: SKIP (i915#1825) -> SKIP (i915#14544 / i915#1825) +11 other tests skip
>  * 
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt:
>
>      +  shard-rkl: SKIP (i915#14544 / i915#1825) -> SKIP (i915#1825) +13 other tests skip
>  * 
>
>     igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-pwrite:
>
>      +  shard-rkl: SKIP (i915#14544 / i915#15102) -> SKIP (i915#15102)
>  * 
>
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt:
>
>      +  shard-rkl: SKIP (i915#14544 / i915#15102 / i915#3023) -> SKIP (i915#15102 / i915#3023) +8 other tests skip
>  * 
>
>     igt@kms_frontbuffer_tracking@psr-suspend:
>
>      +  shard-rkl: SKIP (i915#15102 / i915#3023) -> SKIP (i915#14544 / i915#15102 / i915#3023) +2 other tests skip
>  * 
>
>     igt@kms_hdr@brightness-with-hdr:
>
>      +  shard-dg2: SKIP (i915#12713) -> SKIP (i915#13331)
>  * 
>
>     igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>
>      +  shard-dg1: SKIP (i915#1839) -> SKIP (i915#1839 / i915#4423)
>  * 
>
>     igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping:
>
>      +  shard-rkl: SKIP (i915#14544 / i915#8825) -> SKIP (i915#8825)
>  * 
>
>     igt@kms_plane_multiple@2x-tiling-none:
>
>      +  shard-rkl: SKIP (i915#13958) -> SKIP (i915#13958 / i915#14544)
>  * 
>
>     igt@kms_pm_dc@dc5-retention-flops:
>
>      +  shard-rkl: SKIP (i915#3828) -> SKIP (i915#14544 / i915#3828)
>  * 
>
>     igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
>
>      +  shard-rkl: SKIP (i915#11520 / i915#14544) -> SKIP (i915#11520) +1 other test skip
>  * 
>
>     igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf:
>
>      +  shard-rkl: SKIP (i915#11520) -> SKIP (i915#11520 / i915#14544) +3 other tests skip
>  * 
>
>     igt@kms_psr@fbc-pr-cursor-plane-onoff:
>
>      +  shard-rkl: SKIP (i915#1072 / i915#14544 / i915#9732) -> SKIP (i915#1072 / i915#9732) +4 other tests skip
>  * 
>
>     igt@kms_psr@fbc-psr-sprite-mmap-cpu:
>
>      +  shard-rkl: SKIP (i915#1072 / i915#9732) -> SKIP (i915#1072 / i915#14544 / i915#9732) +4 other tests skip
>  * 
>
>     igt@kms_psr@psr2-sprite-mmap-gtt:
>
>      +  shard-dg1: SKIP (i915#1072 / i915#4423 / i915#9732) -> SKIP (i915#1072 / i915#9732)
>  * 
>
>     igt@kms_scaling_modes@scaling-mode-none:
>
>      +  shard-rkl: SKIP (i915#3555) -> SKIP (i915#14544 / i915#3555) +2 other tests skip
>  * 
>
>     igt@kms_tiled_display@basic-test-pattern:
>
>      +  shard-rkl: SKIP (i915#8623) -> SKIP (i915#14544 / i915#8623)
>  * 
>
>     igt@kms_vrr@seamless-rr-switch-virtual:
>
>      +  shard-rkl: SKIP (i915#14544 / i915#9906) -> SKIP (i915#9906)
>  * 
>
>     igt@perf_pmu@event-wait:
>
>      +  shard-rkl: SKIP -> SKIP (i915#14544) +3 other tests skip
> 
> BUILD CHANGES
>
>  *  CI: CI-20190529 -> None
>  *  IGT: IGT_8753 -> IGTPW_14554
>  *  Piglit: piglit_4509 -> None
> 
> CI-20190529: 20190529
> CI_DRM_17992: eac0d1b8d00bd336f2db6f0a45f6c35cdac374bc @ git://anongit.freedesktop.org/gfx-ci/linux
> IGTPW_14554: 14554
> IGT_8753: 8753
> piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> 
>
--1527428566-664931966-1771239401=:356414--
