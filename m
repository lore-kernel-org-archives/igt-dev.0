Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0D02103E160
	for <igt-dev@archiver.kernel.org>; Wed, 18 Mar 2026 11:58:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75AC410E71A;
	Wed, 18 Mar 2026 11:58:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RHthw0zf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B997410E528;
 Wed, 18 Mar 2026 11:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773835090; x=1805371090;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:mime-version;
 bh=a+alc3x7sAu//yAd7A1GZTe258FAvYZeIzcPpdMYB0o=;
 b=RHthw0zfipUlMQGkTp1YRcA/AVFcqS2jnJ4K80Sm24xNwFkP/Qt44wpv
 Wj7hCUUjzuONJJofVFKGIBUw82gVAUVFi1fV1+FJUH8KG8vt9i3IhNl1k
 06y5sTIgUkK+HGn0FKehKKd8xrIySMdYVXww2E+fmE226bCKr87Rlw5nc
 9itpEkhp6VFkGzNfbSjhaYK+1ZFP3LwkDWXikl7Pt9CsmauoFU/+yZmMn
 gHuS+rgqdi2nCy4NvUHsVn9bWTuy13IDshDwWRDHqbE3jxGCpMXq5GaDU
 iF46w2q5McL9EvcPgWy8tNDnbI56DJnyWvShG0uR5yd67zTtrm0M6KZDw A==;
X-CSE-ConnectionGUID: WF+7sxEIQaKMx8GYfhXOMQ==
X-CSE-MsgGUID: oFgkOprARsGh0kOKOxewPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="97492453"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208,217";a="97492453"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 04:58:09 -0700
X-CSE-ConnectionGUID: WwR9c2UMTuCG10bgkmTEKA==
X-CSE-MsgGUID: kGi+6AZ9R9KfoQxRx6KRBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
 d="scan'208,217";a="227290163"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.246.84])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 04:58:06 -0700
Message-ID: <7560f6c70ebff632a2e7466418ca4e24b808136f.camel@linux.intel.com>
Subject: Re: =?UTF-8?Q?=E2=9C=97?= i915.CI.Full: failure for
 tests/intel/gem_lmem_swapping: Expect gem leak helper crashes (rev2)
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: I915-ci-infra@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 18 Mar 2026 12:58:04 +0100
In-Reply-To: <177383385346.372028.2825704416803279744@a3b018990fe9>
References: <20260312181032.20485-5-janusz.krzysztofik@linux.intel.com>
 <177383385346.372028.2825704416803279744@a3b018990fe9>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
Content-Type: multipart/alternative; boundary="=-txpjMCQ6JsHeqANLWc8W"
User-Agent: Evolution 3.58.3 
MIME-Version: 1.0
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

--=-txpjMCQ6JsHeqANLWc8W
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi=C2=A0I915-ci-infra@lists.freedesktop.org

On Wed, 2026-03-18 at 11:37 +0000, Patchwork wrote:
> Patch Details
>=20
> Series:tests/intel/gem_lmem_swapping: Expect gem leak helper crashes
> (rev2)
>=20
> URL:https://patchwork.freedesktop.org/series/162418/
>=20
> State:failure
> Details:https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/index.html
> CI Bug Log - changes from CI_DRM_18139_full -> IGTPW_14752_fullSummaryFAI=
LURE
> Serious unknown changes coming with IGTPW_14752_full absolutely need to
> be
> verified manually.
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_14752_full, please notify your bug team (I915-ci-
> infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in
> CI.
> External URL: https://intel-gfx-ci.01.org/tree/drm-
> tip/IGTPW_14752/index.html
> Participating hosts (10 -> 10)No changes in participating hosts
> Possible new issuesHere are the unknown changes that may have been introd=
uced in
> IGTPW_14752_full:
> IGT changesPossible regressions *=20
>    igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
>     - shard-mtlp:         NOTRUN -> FAIL [730]

(kms_big_fb:2474) ioctl_wrappers-CRITICAL: Last errno: 12, Cannot allocate =
memory
>  *=20
>    igt@kms_big_fb@linear-64bpp-rotate-180:
>     - shard-mtlp:         PASS [729] -> INCOMPLETE [728]

<3> [436.858161] Out of memory: Killed process 2791 (kms_big_fb)

Not the test changed by this series, not a discrete platform -- not
related.
Please update filters and re-report.

Thanks,
Janusz


> Known issuesHere are the changes found in IGTPW_14752_full that come from=
 known
> issues:
> IGT changesIssues hit *=20
>    igt@gem_bad_reloc@negative-reloc-lut:shard-rkl: NOTRUN -> SKIP [727]
>    (i915#14544 [3] / i915#3281 [165]) +1 other test skip
>  *=20
>    igt@gem_ccs@ctrl-surf-copy:shard-rkl: NOTRUN -> SKIP [723] (i915#3555
>    [2] / i915#9323 [722])shard-tglu-1: NOTRUN -> SKIP [724] (i915#3555 [2=
]
>    / i915#9323 [722])shard-dg1: NOTRUN -> SKIP [725] (i915#3555 [2] /
>    i915#9323 [722])shard-mtlp: NOTRUN -> SKIP [726] (i915#3555 [2] /
>    i915#9323 [722])
>  *=20
>    igt@gem_ccs@large-ctrl-surf-copy:shard-rkl: NOTRUN -> SKIP [720]
>    (i915#13008 [719])shard-dg1: NOTRUN -> SKIP [721] (i915#13008 [719])
>  *=20
>    igt@gem_ccs@suspend-resume:shard-dg2: PASS [718] -> INCOMPLETE [717]
>    (i915#13356 [255]) +3 other tests incomplete
>  *=20
>    igt@gem_close_race@multigpu-basic-process:shard-rkl: NOTRUN -> SKIP
>    [716] (i915#7697 [715])
>  *=20
>    igt@gem_create@create-ext-set-pat:shard-rkl: NOTRUN -> SKIP [713]
>    (i915#8562 [712])shard-tglu-1: NOTRUN -> SKIP [714] (i915#8562 [712])
>  *=20
>    igt@gem_ctx_isolation@preservation-s3@rcs0:shard-glk: NOTRUN ->
>    INCOMPLETE [711] (i915#13356 [255]) +1 other test incomplete
>  *=20
>    igt@gem_ctx_persistence@heartbeat-close:shard-dg2: NOTRUN -> SKIP [708=
]
>    (i915#8555 [707])shard-dg1: NOTRUN -> SKIP [709] (i915#8555 [707])shar=
d-
>    mtlp: NOTRUN -> SKIP [710] (i915#8555 [707])
>  *=20
>    igt@gem_ctx_persistence@legacy-engines-persistence:shard-snb: NOTRUN -=
>
>    SKIP [706] (i915#1099 [705])
>  *=20
>    igt@gem_ctx_sseu@engines:shard-tglu-1: NOTRUN -> SKIP [704] (i915#280
>    [699])
>  *=20
>    igt@gem_ctx_sseu@invalid-args:shard-dg2: NOTRUN -> SKIP [700] (i915#28=
0
>    [699])shard-dg1: NOTRUN -> SKIP [701] (i915#280 [699])shard-tglu: NOTR=
UN
>    -> SKIP [702] (i915#280 [699])shard-mtlp: NOTRUN -> SKIP [703] (i915#2=
80
>    [699])
>  *=20
>    igt@gem_eio@in-flight-suspend:shard-rkl: NOTRUN -> INCOMPLETE [697]
>    (i915#13390 [696])shard-glk: NOTRUN -> INCOMPLETE [698] (i915#13390
>    [696])
>  *=20
>    igt@gem_exec_balancer@bonded-false-hang:shard-dg2: NOTRUN -> SKIP [693=
]
>    (i915#4812 [692]) +1 other test skipshard-dg1: NOTRUN -> SKIP [694]
>    (i915#4812 [692]) +1 other test skipshard-mtlp: NOTRUN -> SKIP [695]
>    (i915#4812 [692]) +1 other test skip
>  *=20
>    igt@gem_exec_balancer@bonded-sync:shard-dg2: NOTRUN -> SKIP [689]
>    (i915#4771 [688])shard-dg1: NOTRUN -> SKIP [690] (i915#4771 [688])shar=
d-
>    mtlp: NOTRUN -> SKIP [691] (i915#4771 [688])
>  *=20
>    igt@gem_exec_balancer@parallel-keep-submit-fence:shard-rkl: NOTRUN ->
>    SKIP [686] (i915#4525 [684]) +1 other test skipshard-tglu-1: NOTRUN ->
>    SKIP [687] (i915#4525 [684])
>  *=20
>    igt@gem_exec_balancer@parallel-ordering:shard-tglu: NOTRUN -> SKIP [68=
5]
>    (i915#4525 [684])
>  *=20
>    igt@gem_exec_big@single:shard-mtlp: PASS [683] -> DMESG-FAIL [682]
>    (i915#15478 [646])
>  *=20
>    igt@gem_exec_flush@basic-uc-rw-default:shard-dg2: NOTRUN -> SKIP [681]
>    (i915#3539 [680] / i915#4852 [679])
>  *=20
>    igt@gem_exec_params@rsvd2-dirt:shard-mtlp: NOTRUN -> SKIP [677]
>    (i915#5107 [676])shard-dg2: NOTRUN -> SKIP [678] (i915#5107 [676])
>  *=20
>    igt@gem_exec_reloc@basic-wc-cpu:shard-dg2: NOTRUN -> SKIP [673]
>    (i915#3281 [165])shard-dg1: NOTRUN -> SKIP [674] (i915#3281 [165]) +3
>    other tests skipshard-mtlp: NOTRUN -> SKIP [675] (i915#3281 [165]) +1
>    other test skip
>  *=20
>    igt@gem_exec_reloc@basic-write-wc-noreloc:shard-rkl: NOTRUN -> SKIP
>    [672] (i915#3281 [165]) +10 other tests skip
>  *=20
>    igt@gem_exec_suspend@basic-s3:shard-glk11: NOTRUN -> INCOMPLETE [671]
>    (i915#13196 [670] / i915#13356 [255]) +1 other test incomplete
>  *=20
>    igt@gem_fenced_exec_thrash@2-spare-fences:shard-dg1: NOTRUN -> SKIP
>    [669] (i915#4860 [668])
>  *=20
>    igt@gem_huc_copy@huc-copy:shard-rkl: NOTRUN -> SKIP [666] (i915#2190
>    [665])shard-glk: NOTRUN -> SKIP [667] (i915#2190 [665])
>  *=20
>    igt@gem_lmem_evict@dontneed-evict-race:shard-tglu-1: NOTRUN -> SKIP
>    [664] (i915#4613 [162] / i915#7582 [663])
>  *=20
>    igt@gem_lmem_swapping@heavy-multi:shard-rkl: NOTRUN -> SKIP [662]
>    (i915#14544 [3] / i915#4613 [162])
>  *=20
>    igt@gem_lmem_swapping@heavy-verify-multi-ccs:shard-glk: NOTRUN -> SKIP
>    [660] (i915#4613 [162]) +5 other tests skipshard-mtlp: NOTRUN -> SKIP
>    [661] (i915#4613 [162])
>  *=20
>    igt@gem_lmem_swapping@heavy-verify-random-ccs:shard-dg1: NOTRUN -> SKI=
P
>    [659] (i915#12193 [658]) +1 other test skip
>  *=20
>    igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0:shard-dg1: NOTRUN =
->
>    SKIP [657] (i915#4565 [656]) +1 other test skip
>  *=20
>    igt@gem_lmem_swapping@parallel-random-verify:shard-rkl: NOTRUN -> SKIP
>    [654] (i915#4613 [162]) +4 other tests skipshard-tglu-1: NOTRUN -> SKI=
P
>    [655] (i915#4613 [162]) +1 other test skip
>  *=20
>    igt@gem_lmem_swapping@random-engines:shard-tglu: NOTRUN -> SKIP [653]
>    (i915#4613 [162]) +1 other test skip
>  *=20
>    igt@gem_mmap@pf-nonblock:shard-dg2: NOTRUN -> SKIP [651] (i915#4083
>    [644])shard-mtlp: NOTRUN -> SKIP [652] (i915#4083 [644])
>  *=20
>    igt@gem_mmap_gtt@close-race:shard-dg1: NOTRUN -> SKIP [649] (i915#4077
>    [617]) +6 other tests skipshard-mtlp: NOTRUN -> SKIP [650] (i915#4077
>    [617]) +4 other tests skip
>  *=20
>    igt@gem_mmap_offset@clear@smem0:shard-mtlp: PASS [648] -> INCOMPLETE
>    [647] (i915#15478 [646] / i915#5493 [228]) +1 other test incomplete
>  *=20
>    igt@gem_mmap_wc@write-cpu-read-wc:shard-dg1: NOTRUN -> SKIP [645]
>    (i915#4083 [644]) +1 other test skip
>  *=20
>    igt@gem_partial_pwrite_pread@reads-uncached:shard-dg2: NOTRUN -> SKIP
>    [641] (i915#3282 [639]) +1 other test skipshard-dg1: NOTRUN -> SKIP
>    [642] (i915#3282 [639]) +2 other tests skipshard-mtlp: NOTRUN -> SKIP
>    [643] (i915#3282 [639]) +1 other test skip
>  *=20
>    igt@gem_partial_pwrite_pread@writes-after-reads:shard-rkl: NOTRUN ->
>    SKIP [640] (i915#3282 [639]) +6 other tests skip
>  *=20
>    igt@gem_pread@exhaustion:shard-glk: NOTRUN -> WARN [638] (i915#2658
>    [634])
>  *=20
>    igt@gem_pwrite@basic-exhaustion:shard-glk: NOTRUN -> WARN [636]
>    (i915#14702 [635] / i915#2658 [634])shard-tglu: NOTRUN -> WARN [637]
>    (i915#2658 [634])
>  *=20
>    igt@gem_pxp@hw-rejects-pxp-buffer:shard-rkl: NOTRUN -> SKIP [633]
>    (i915#13717 [632] / i915#14544 [3])
>  *=20
>    igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:shard-dg2: NOTR=
UN
>    -> SKIP [630] (i915#4270 [629]) +1 other test skipshard-dg1: NOTRUN ->
>    SKIP [631] (i915#4270 [629]) +1 other test skip
>  *=20
>    igt@gem_render_copy@yf-tiled-to-vebox-linear:shard-dg2: NOTRUN -> SKIP
>    [627] (i915#5190 [401] / i915#8428 [626])shard-mtlp: NOTRUN -> SKIP
>    [628] (i915#8428 [626])
>  *=20
>    igt@gem_set_tiling_vs_gtt:shard-dg1: NOTRUN -> SKIP [623] (i915#4079
>    [622])shard-mtlp: NOTRUN -> SKIP [624] (i915#4079 [622])shard-dg2:
>    NOTRUN -> SKIP [625] (i915#4079 [622])
>  *=20
>    igt@gem_softpin@noreloc-s3:shard-rkl: PASS [621] -> INCOMPLETE [620]
>    (i915#13809 [619])
>  *=20
>    igt@gem_tiled_partial_pwrite_pread@writes-after-reads:shard-dg2: NOTRU=
N
>    -> SKIP [618] (i915#4077 [617]) +4 other tests skip
>  *=20
>    igt@gem_userptr_blits@access-control:shard-mtlp: NOTRUN -> SKIP [616]
>    (i915#3297 [153]) +1 other test skip
>  *=20
>    igt@gem_userptr_blits@coherency-sync:shard-rkl: NOTRUN -> SKIP [615]
>    (i915#3297 [153]) +2 other tests skip
>  *=20
>    igt@gem_userptr_blits@invalid-mmap-offset-unsync:shard-tglu-1: NOTRUN =
->
>    SKIP [614] (i915#3297 [153])
>  *=20
>    igt@gem_userptr_blits@map-fixed-invalidate-overlap:shard-dg2: NOTRUN -=
>
>    SKIP [612] (i915#3297 [153] / i915#4880 [611])shard-dg1: NOTRUN -> SKI=
P
>    [613] (i915#3297 [153] / i915#4880 [611])
>  *=20
>    igt@gem_userptr_blits@unsync-unmap-after-close:shard-glk11: NOTRUN ->
>    SKIP [610] +71 other tests skip
>  *=20
>    igt@gem_userptr_blits@unsync-unmap-cycles:shard-dg2: NOTRUN -> SKIP
>    [607] (i915#3297 [153])shard-dg1: NOTRUN -> SKIP [608] (i915#3297 [153=
])
>    +1 other test skipshard-tglu: NOTRUN -> SKIP [609] (i915#3297 [153]) +=
2
>    other tests skip
>  *=20
>    igt@gem_workarounds@suspend-resume:shard-glk10: NOTRUN -> INCOMPLETE
>    [606] (i915#13356 [255] / i915#14586 [605])
>  *=20
>    igt@gem_workarounds@suspend-resume-context:shard-rkl: PASS [604] ->
>    INCOMPLETE [603] (i915#13356 [255])
>  *=20
>    igt@gen9_exec_parse@allowed-single:shard-glk: PASS [602] -> ABORT [601=
]
>    (i915#5566 [600])
>  *=20
>    igt@gen9_exec_parse@bb-start-cmd:shard-dg1: NOTRUN -> SKIP [595]
>    (i915#2527 [150]) +2 other tests skipshard-tglu: NOTRUN -> SKIP [597]
>    (i915#2527 [150] / i915#2856 [596]) +1 other test skipshard-mtlp: NOTR=
UN
>    -> SKIP [598] (i915#2856 [596])shard-dg2: NOTRUN -> SKIP [599]
>    (i915#2856 [596])
>  *=20
>    igt@gen9_exec_parse@shadow-peek:shard-rkl: NOTRUN -> SKIP [594]
>    (i915#2527 [150]) +4 other tests skip
>  *=20
>    igt@gen9_exec_parse@valid-registers:shard-rkl: NOTRUN -> SKIP [593]
>    (i915#14544 [3] / i915#2527 [150]) +1 other test skip
>  *=20
>    igt@i915_drm_fdinfo@busy-check-all:shard-dg1: NOTRUN -> SKIP [592]
>    (i915#11527 [589]) +5 other tests skip
>  *=20
>    igt@i915_drm_fdinfo@busy-check-all@ccs0:shard-mtlp: NOTRUN -> SKIP [59=
1]
>    (i915#11527 [589]) +6 other tests skip
>  *=20
>    igt@i915_drm_fdinfo@busy-check-all@vecs0:shard-dg2: NOTRUN -> SKIP [59=
0]
>    (i915#11527 [589]) +7 other tests skip
>  *=20
>    igt@i915_module_load@fault-injection@__uc_init:shard-tglu-1: NOTRUN ->
>    SKIP [588] (i915#15479 [587]) +4 other tests skip
>  *=20
>    igt@i915_module_load@fault-injection@intel_connector_register:shard-
>    tglu-1: NOTRUN -> ABORT [585] (i915#15342 [584]) +1 other test
>    abortshard-glk: NOTRUN -> ABORT [586] (i915#15342 [584]) +1 other test
>    abort
>  *=20
>    igt@i915_module_load@load:shard-glk: (PASS [582], PASS [580], PASS
>    [583], PASS [579], PASS [583], PASS [582], PASS [583], PASS [582], PAS=
S
>    [581], PASS [580], PASS [579], PASS [578], PASS [578], PASS [578], PAS=
S
>    [577], PASS [576], PASS [576], PASS [576]) -> (PASS [572], PASS [572],
>    PASS [571], PASS [569], PASS [571], PASS [574], PASS [575], PASS [568]=
,
>    PASS [573], PASS [570], PASS [575], PASS [574], DMESG-WARN [573], PASS
>    [569], PASS [573], PASS [572], PASS [571], PASS [570], PASS [569], PAS=
S
>    [568]) (i915#118 [567])
>  *=20
>    igt@i915_module_load@reload-no-display:shard-dg1: PASS [566] ->
>    DMESG-WARN [565] (i915#13029 [564] / i915#14545 [563])
>  *=20
>    igt@i915_module_load@resize-bar:shard-tglu: NOTRUN -> SKIP [562]
>    (i915#6412 [147])
>  *=20
>    igt@i915_pm_freq_api@freq-suspend:shard-rkl: NOTRUN -> SKIP [561]
>    (i915#8399 [560]) +1 other test skip
>  *=20
>    igt@i915_pm_rps@min-max-config-idle:shard-dg1: NOTRUN -> SKIP [558]
>    (i915#11681 [555] / i915#6621 [557])shard-mtlp: NOTRUN -> SKIP [559]
>    (i915#11681 [555] / i915#6621 [557])
>  *=20
>    igt@i915_pm_rps@thresholds-idle:shard-dg1: NOTRUN -> SKIP [556]
>    (i915#11681 [555])
>  *=20
>    igt@i915_query@test-query-geometry-subslices:shard-rkl: NOTRUN -> SKIP
>    [552] (i915#14544 [3] / i915#5723 [551])shard-dg1: NOTRUN -> SKIP [553=
]
>    (i915#5723 [551])shard-tglu: NOTRUN -> SKIP [554] (i915#5723 [551])
>  *=20
>    igt@i915_suspend@fence-restore-tiled2untiled:shard-rkl: PASS [550] ->
>    ABORT [549] (i915#15140 [548])
>  *=20
>    igt@i915_suspend@forcewake:shard-glk: NOTRUN -> INCOMPLETE [547]
>    (i915#4817 [546])
>  *=20
>    igt@kms_addfb_basic@clobberred-modifier:shard-dg1: NOTRUN -> SKIP [545=
]
>    (i915#4212 [544])
>  *=20
>    igt@kms_atomic_transition@plane-all-modeset-transition-internal-
>    panels:shard-glk: NOTRUN -> SKIP [542] (i915#1769 [541])shard-tglu:
>    NOTRUN -> SKIP [543] (i915#1769 [541] / i915#3555 [2])
>  *=20
>    igt@kms_atomic_transition@plane-all-modeset-transition-internal-
>    panels@pipe-a-edp-1:shard-mtlp: PASS [540] -> FAIL [539] (i915#5956
>    [215]) +1 other test fail
>  *=20
>    igt@kms_big_fb@4-tiled-32bpp-rotate-0:shard-rkl: NOTRUN -> SKIP [538]
>    (i915#14544 [3] / i915#5286 [139])
>  *=20
>    igt@kms_big_fb@4-tiled-32bpp-rotate-90:shard-tglu-1: NOTRUN -> SKIP
>    [537] (i915#5286 [139])
>  *=20
>    igt@kms_big_fb@4-tiled-64bpp-rotate-180:shard-rkl: NOTRUN -> SKIP [536=
]
>    (i915#5286 [139]) +7 other tests skip
>  *=20
>    igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:shard-
>    tglu: NOTRUN -> SKIP [535] (i915#5286 [139]) +4 other tests skip
>  *=20
>    igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:shard-mtlp:
>    PASS [534] -> FAIL [533] (i915#15733 [212] / i915#5138 [211])
>  *=20
>    igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:shard=
-
>    dg1: NOTRUN -> SKIP [532] (i915#4538 [520] / i915#5286 [139]) +4 other
>    tests skip
>  *=20
>    igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:shard-tglu:
>    NOTRUN -> SKIP [530] (i915#3828 [37])shard-rkl: NOTRUN -> SKIP [531]
>    (i915#3828 [37]) +1 other test skip
>  *=20
>    igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:shard-tglu-1:
>    NOTRUN -> SKIP [529] (i915#3828 [37]) +1 other test skip
>  *=20
>    igt@kms_big_fb@x-tiled-16bpp-rotate-270:shard-dg1: NOTRUN -> SKIP [528=
]
>    (i915#3638 [136]) +1 other test skip
>  *=20
>    igt@kms_big_fb@y-tiled-8bpp-rotate-270:shard-rkl: NOTRUN -> SKIP [527]
>    (i915#3638 [136]) +3 other tests skip
>  *=20
>    igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:shard-dg2: NOTRUN ->
>    SKIP [524] (i915#5190 [401])shard-mtlp: NOTRUN -> SKIP [526] (i915#618=
7
>    [525])
>  *=20
>    igt@kms_big_fb@yf-tiled-64bpp-rotate-180:shard-dg2: NOTRUN -> SKIP [52=
1]
>    (i915#4538 [520] / i915#5190 [401]) +2 other tests skipshard-rkl: NOTR=
UN
>    -> SKIP [522] (i915#14544 [3]) +1 other test skipshard-dg1: NOTRUN ->
>    SKIP [523] (i915#4538 [520]) +2 other tests skip
>  *=20
>    igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:shard-tglu-1:
>    NOTRUN -> SKIP [519] +32 other tests skip
>  *=20
>    igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-
>    flip:shard-mtlp: NOTRUN -> SKIP [518] +6 other tests skip
>  *=20
>    igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4:shard-dg=
1:
>    NOTRUN -> SKIP [517] (i915#6095 [122]) +206 other tests skip
>  *=20
>    igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-3:shard=
-
>    dg2: NOTRUN -> SKIP [516] (i915#10307 [501] / i915#6095 [122]) +80 oth=
er
>    tests skip
>  *=20
>    igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-1:shard-
>    rkl: NOTRUN -> SKIP [515] (i915#6095 [122]) +73 other tests skip
>  *=20
>    igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs:shard-tglu: NOTRUN ->
>    SKIP [514] (i915#6095 [122]) +49 other tests skip
>  *=20
>    igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:shard-rkl: NOTRUN =
->
>    SKIP [513] (i915#14098 [123] / i915#14544 [3] / i915#6095 [122]) +3
>    other tests skip
>  *=20
>    igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-
>    2:shard-rkl: NOTRUN -> SKIP [512] (i915#14544 [3] / i915#6095 [122]) +=
3
>    other tests skip
>  *=20
>    igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-
>    3:shard-dg2: NOTRUN -> SKIP [511] (i915#6095 [122]) +24 other tests sk=
ip
>  *=20
>    igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:shard-tglu-1: NOTRU=
N
>    -> SKIP [510] (i915#6095 [122]) +44 other tests skip
>  *=20
>    igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:shard-tglu: PASS
>    [509] -> ABORT [508] (i915#15652 [507]) +1 other test abort
>  *=20
>    igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-2:shard-glk=
:
>    NOTRUN -> INCOMPLETE [506] (i915#15582 [208])
>  *=20
>    igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:shard-rkl: NOTRUN =
->
>    SKIP [504] (i915#12313 [503]) +1 other test skipshard-tglu: NOTRUN ->
>    SKIP [505] (i915#12313 [503])
>  *=20
>    igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-hdmi-a-1:shard-dg2:
>    NOTRUN -> SKIP [502] (i915#10307 [501] / i915#10434 [500] / i915#6095
>    [122]) +2 other tests skip
>  *=20
>    igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-a-edp-1:shard-mtlp:
>    NOTRUN -> SKIP [499] (i915#6095 [122]) +29 other tests skip
>  *=20
>    igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-2:shard-
>    rkl: NOTRUN -> SKIP [498] (i915#14098 [123] / i915#6095 [122]) +50 oth=
er
>    tests skip
>  *=20
>    igt@kms_cdclk@mode-transition:shard-glk: NOTRUN -> SKIP [495] +448 oth=
er
>    tests skipshard-rkl: NOTRUN -> SKIP [496] (i915#3742 [493]) +1 other
>    test skipshard-tglu: NOTRUN -> SKIP [497] (i915#3742 [493])
>  *=20
>    igt@kms_cdclk@mode-transition-all-outputs:shard-dg1: NOTRUN -> SKIP
>    [494] (i915#3742 [493])
>  *=20
>    igt@kms_chamelium_frames@hdmi-crc-fast:shard-rkl: NOTRUN -> SKIP [491]
>    (i915#11151 [119] / i915#14544 [3] / i915#7828 [118]) +1 other test
>    skipshard-tglu: NOTRUN -> SKIP [492] (i915#11151 [119] / i915#7828
>    [118]) +7 other tests skip
>  *=20
>    igt@kms_chamelium_hpd@dp-hpd-storm-disable:shard-tglu-1: NOTRUN -> SKI=
P
>    [490] (i915#11151 [119] / i915#7828 [118]) +5 other tests skip
>  *=20
>    igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode:shard-mtlp: NOTRUN -=
>
>    SKIP [489] (i915#11151 [119] / i915#7828 [118]) +3 other tests skip
>  *=20
>    igt@kms_chamelium_hpd@vga-hpd-fast:shard-rkl: NOTRUN -> SKIP [487]
>    (i915#11151 [119] / i915#7828 [118]) +10 other tests skipshard-dg1:
>    NOTRUN -> SKIP [488] (i915#11151 [119] / i915#7828 [118]) +5 other tes=
ts
>    skip
>  *=20
>    igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:shard-dg2: NOTRUN ->
>    SKIP [486] (i915#11151 [119] / i915#7828 [118]) +3 other tests skip
>  *=20
>    igt@kms_content_protection@atomic:shard-tglu: NOTRUN -> SKIP [485]
>    (i915#6944 [113] / i915#7116 [484] / i915#7118 [112] / i915#9424 [111]=
)
>  *=20
>    igt@kms_content_protection@atomic-hdcp14:shard-rkl: NOTRUN -> SKIP [48=
3]
>    (i915#6944 [113])
>  *=20
>    igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:shard-dg1: NOTRUN =
->
>    SKIP [479] (i915#15330 [477])shard-tglu: NOTRUN -> SKIP [480]
>    (i915#15330 [477]) +1 other test skipshard-mtlp: NOTRUN -> SKIP [481]
>    (i915#15330 [477])shard-dg2: NOTRUN -> SKIP [482] (i915#15330 [477])
>  *=20
>    igt@kms_content_protection@dp-mst-type-0-suspend-resume:shard-rkl:
>    NOTRUN -> SKIP [478] (i915#15330 [477])
>  *=20
>    igt@kms_content_protection@legacy:shard-rkl: NOTRUN -> SKIP [476]
>    (i915#6944 [113] / i915#7118 [112] / i915#9424 [111])
>  *=20
>    igt@kms_content_protection@legacy-hdcp14:shard-tglu-1: NOTRUN -> SKIP
>    [475] (i915#6944 [113])
>  *=20
>    igt@kms_cursor_crc@cursor-onscreen-32x32:shard-tglu: NOTRUN -> SKIP
>    [474] (i915#3555 [2]) +1 other test skip
>  *=20
>    igt@kms_cursor_crc@cursor-onscreen-512x170:shard-tglu-1: NOTRUN -> SKI=
P
>    [473] (i915#13049 [106])
>  *=20
>    igt@kms_cursor_crc@cursor-onscreen-512x512:shard-rkl: NOTRUN -> SKIP
>    [472] (i915#13049 [106]) +1 other test skip
>  *=20
>    igt@kms_cursor_crc@cursor-onscreen-64x21:shard-mtlp: NOTRUN -> SKIP
>    [471] (i915#8814 [470])
>  *=20
>    igt@kms_cursor_crc@cursor-onscreen-64x21@pipe-a-hdmi-a-1:shard-tglu:
>    NOTRUN -> FAIL [469] (i915#13566 [201]) +1 other test fail
>  *=20
>    igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1:shard-tglu: PA=
SS
>    [468] -> FAIL [467] (i915#13566 [201]) +5 other tests fail
>  *=20
>    igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-2:shard-rkl: PAS=
S
>    [466] -> FAIL [465] (i915#13566 [201]) +3 other tests fail
>  *=20
>    igt@kms_cursor_crc@cursor-rapid-movement-32x10:shard-rkl: NOTRUN -> SK=
IP
>    [464] (i915#3555 [2]) +2 other tests skip
>  *=20
>    igt@kms_cursor_crc@cursor-rapid-movement-max-size:shard-tglu-1: NOTRUN=
 -
>    > SKIP [463] (i915#3555 [2])
>  *=20
>    igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:shard-rkl: NOTRUN -> SK=
IP
>    [460] +14 other tests skipshard-mtlp: NOTRUN -> SKIP [462] (i915#9809
>    [461]) +1 other test skip
>  *=20
>    igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:shard-rkl:
>    NOTRUN -> SKIP [459] (i915#4103 [458])
>  *=20
>    igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:shard-dg2: NOTRUN -> SKI=
P
>    [457] (i915#13046 [456] / i915#5354 [326]) +1 other test skip
>  *=20
>    igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:shard-rkl: NOTRUN =
->
>    SKIP [454] (i915#9067 [453])shard-tglu: NOTRUN -> SKIP [455] (i915#906=
7
>    [453])
>  *=20
>    igt@kms_dirtyfb@psr-dirtyfb-ioctl:shard-dg1: NOTRUN -> SKIP [452]
>    (i915#9723 [451])
>  *=20
>    igt@kms_display_modes@extended-mode-basic:shard-rkl: NOTRUN -> SKIP
>    [450] (i915#13691 [449])
>  *=20
>    igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:shard-rkl: NOTRUN=
 -
>    > SKIP [448] (i915#3804 [447])
>  *=20
>    igt@kms_dp_link_training@non-uhbr-mst:shard-dg2: NOTRUN -> SKIP [442]
>    (i915#13749 [100])shard-rkl: NOTRUN -> SKIP [443] (i915#13749
>    [100])shard-dg1: NOTRUN -> SKIP [444] (i915#13749 [100])shard-tglu:
>    NOTRUN -> SKIP [445] (i915#13749 [100])shard-mtlp: NOTRUN -> SKIP [446=
]
>    (i915#13749 [100])
>  *=20
>    igt@kms_dp_linktrain_fallback@dp-fallback:shard-dg2: NOTRUN -> SKIP
>    [438] (i915#13707 [437])shard-dg1: NOTRUN -> SKIP [439] (i915#13707
>    [437])shard-tglu: NOTRUN -> SKIP [440] (i915#13707 [437])shard-mtlp:
>    NOTRUN -> SKIP [441] (i915#13707 [437])
>  *=20
>    igt@kms_dsc@dsc-with-formats:shard-tglu: NOTRUN -> SKIP [432] (i915#35=
55
>    [2] / i915#3840 [97])shard-mtlp: NOTRUN -> SKIP [433] (i915#3555 [2] /
>    i915#3840 [97])shard-dg2: NOTRUN -> SKIP [434] (i915#3555 [2] /
>    i915#3840 [97])shard-rkl: NOTRUN -> SKIP [435] (i915#3555 [2] /
>    i915#3840 [97])shard-dg1: NOTRUN -> SKIP [436] (i915#3555 [2] /
>    i915#3840 [97])
>  *=20
>    igt@kms_dsc@dsc-with-output-formats:shard-rkl: NOTRUN -> SKIP [431]
>    (i915#14544 [3] / i915#3555 [2] / i915#3840 [97])
>  *=20
>    igt@kms_dsc@dsc-with-output-formats-with-bpc:shard-dg1: NOTRUN -> SKIP
>    [430] (i915#3840 [97] / i915#9053 [429])
>  *=20
>    igt@kms_flip@2x-flip-vs-absolute-wf_vblank:shard-tglu: NOTRUN -> SKIP
>    [427] (i915#3637 [418] / i915#9934 [89]) +4 other tests skipshard-mtlp=
:
>    NOTRUN -> SKIP [428] (i915#3637 [418] / i915#9934 [89]) +2 other tests
>    skip
>  *=20
>    igt@kms_flip@2x-flip-vs-dpms:shard-rkl: NOTRUN -> SKIP [426] (i915#993=
4
>    [89]) +6 other tests skip
>  *=20
>    igt@kms_flip@2x-flip-vs-fences-interruptible:shard-dg2: NOTRUN -> SKIP
>    [423] (i915#8381 [422])shard-dg1: NOTRUN -> SKIP [424] (i915#8381
>    [422])shard-mtlp: NOTRUN -> SKIP [425] (i915#8381 [422])
>  *=20
>    igt@kms_flip@2x-flip-vs-panning-vs-hang:shard-dg2: NOTRUN -> SKIP [420=
]
>    (i915#9934 [89]) +1 other test skipshard-dg1: NOTRUN -> SKIP [421]
>    (i915#9934 [89]) +3 other tests skip
>  *=20
>    igt@kms_flip@2x-wf_vblank-ts-check:shard-tglu-1: NOTRUN -> SKIP [419]
>    (i915#3637 [418] / i915#9934 [89]) +2 other tests skip
>  *=20
>    igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3:shard-dg2: PASS [417] ->
>    FAIL [416] (i915#13027 [415]) +1 other test fail
>  *=20
>    igt@kms_flip@flip-vs-suspend:shard-dg2: PASS [412] -> ABORT [411]
>    (i915#15132 [198])shard-rkl: PASS [414] -> INCOMPLETE [413] (i915#6113
>    [409])
>  *=20
>    igt@kms_flip@flip-vs-suspend@a-hdmi-a2:shard-rkl: NOTRUN -> INCOMPLETE
>    [410] (i915#6113 [409])
>  *=20
>    igt@kms_flip@flip-vs-suspend@d-dp3:shard-dg2: NOTRUN -> ABORT [408]
>    (i915#15132 [198])
>  *=20
>    igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-
>    upscaling:shard-tglu: NOTRUN -> SKIP [407] (i915#15643 [84]) +2 other
>    tests skip
>  *=20
>    igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-
>    downscaling:shard-dg1: NOTRUN -> SKIP [406] (i915#15643 [84]) +1 other
>    test skip
>  *=20
>    igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-
>    downscaling:shard-mtlp: NOTRUN -> SKIP [405] (i915#15643 [84]) +2 othe=
r
>    tests skip
>  *=20
>    igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-
>    downscaling:shard-rkl: NOTRUN -> SKIP [404] (i915#15643 [84]) +4 other
>    tests skip
>  *=20
>    igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-
>    upscaling:shard-tglu-1: NOTRUN -> SKIP [403] (i915#15643 [84])
>  *=20
>    igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling:shar=
d-
>    dg2: NOTRUN -> SKIP [402] (i915#15643 [84] / i915#5190 [401]) +1 other
>    test skip
>  *=20
>    igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-
>    cpu:shard-dg2: PASS [400] -> FAIL [399] (i915#15389 [189] / i915#6880
>    [188])
>  *=20
>    igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-
>    wc:shard-dg2: NOTRUN -> SKIP [398] (i915#8708 [372]) +6 other tests sk=
ip
>  *=20
>    igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-
>    render:shard-rkl: NOTRUN -> SKIP [397] (i915#14544 [3] / i915#1825 [77=
])
>    +1 other test skip
>  *=20
>    igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-
>    render:shard-dg2: NOTRUN -> SKIP [396] (i915#5354 [326]) +7 other test=
s
>    skip
>  *=20
>    igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-
>    pwrite:shard-dg1: NOTRUN -> SKIP [395] +16 other tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@fbc-suspend:shard-glk: NOTRUN -> INCOMPLE=
TE
>    [394] (i915#10056 [393])
>  *=20
>    igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-
>    blt:shard-rkl: NOTRUN -> SKIP [391] (i915#15102 [59]) +2 other tests
>    skipshard-dg1: NOTRUN -> SKIP [392] (i915#15102 [59])
>  *=20
>    igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-
>    gtt:shard-mtlp: NOTRUN -> SKIP [389] (i915#15104 [374]) +1 other test
>    skipshard-dg2: NOTRUN -> SKIP [390] (i915#15104 [374]) +1 other test
>    skip
>  *=20
>    igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-
>    wc:shard-dg1: NOTRUN -> SKIP [388] (i915#8708 [372]) +9 other tests sk=
ip
>  *=20
>    igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-
>    render:shard-dg2: NOTRUN -> SKIP [387] (i915#15102 [59] / i915#3458
>    [64]) +8 other tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@fbcpsr-1p-shrfb-fliptrack-mmap-gtt:shard-
>    rkl: NOTRUN -> SKIP [386] (i915#14544 [3] / i915#15102 [59] / i915#302=
3
>    [58]) +2 other tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-
>    wc:shard-mtlp: NOTRUN -> SKIP [385] (i915#1825 [77]) +10 other tests
>    skip
>  *=20
>    igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-
>    pwrite:shard-tglu: NOTRUN -> SKIP [384] +48 other tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff:shard-
>    rkl: NOTRUN -> SKIP [383] (i915#1825 [77]) +41 other tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-gtt:shard-tglu=
:
>    NOTRUN -> SKIP [382] (i915#15102 [59]) +24 other tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:shard-rkl:
>    NOTRUN -> SKIP [381] (i915#15102 [59] / i915#3023 [58]) +26 other test=
s
>    skip
>  *=20
>    igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render:shard-tglu-1=
:
>    NOTRUN -> SKIP [379] (i915#15102 [59]) +8 other tests skipshard-dg1:
>    NOTRUN -> SKIP [380] (i915#15102 [59] / i915#3458 [64]) +11 other test=
s
>    skip
>  *=20
>    igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:shard-rkl: NOTRUN -> SKIP
>    [378] (i915#5439 [74])
>  *=20
>    igt@kms_frontbuffer_tracking@pipe-fbc-rte:shard-tglu-1: NOTRUN -> SKIP
>    [377] (i915#9766 [376])
>  *=20
>    igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-
>    gtt:shard-dg1: NOTRUN -> SKIP [375] (i915#15104 [374]) +2 other tests
>    skip
>  *=20
>    igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-
>    gtt:shard-mtlp: NOTRUN -> SKIP [373] (i915#8708 [372]) +2 other tests
>    skip
>  *=20
>    igt@kms_frontbuffer_tracking@psr-slowdraw:shard-dg2: NOTRUN -> SKIP
>    [371] (i915#10433 [65] / i915#15102 [59] / i915#3458 [64])
>  *=20
>    igt@kms_hdr@bpc-switch:shard-rkl: PASS [370] -> SKIP [369] (i915#3555
>    [2] / i915#8228 [185])
>  *=20
>    igt@kms_hdr@bpc-switch-suspend:shard-tglu: NOTRUN -> SKIP [366]
>    (i915#3555 [2] / i915#8228 [185]) +1 other test skipshard-dg2: NOTRUN =
->
>    SKIP [367] (i915#3555 [2] / i915#8228 [185])shard-dg1: NOTRUN -> SKIP
>    [368] (i915#3555 [2] / i915#8228 [185]) +1 other test skip
>  *=20
>    igt@kms_hdr@invalid-metadata-sizes:shard-tglu-1: NOTRUN -> SKIP [365]
>    (i915#3555 [2] / i915#8228 [185])
>  *=20
>    igt@kms_hdr@static-toggle-dpms:shard-rkl: NOTRUN -> SKIP [364]
>    (i915#3555 [2] / i915#8228 [185]) +2 other tests skip
>  *=20
>    igt@kms_joiner@basic-ultra-joiner:shard-tglu-1: NOTRUN -> SKIP [363]
>    (i915#15458 [362])
>  *=20
>    igt@kms_joiner@invalid-modeset-big-joiner:shard-tglu: NOTRUN -> SKIP
>    [361] (i915#15460 [360])
>  *=20
>    igt@kms_panel_fitting@atomic-fastset:shard-rkl: NOTRUN -> SKIP [357]
>    (i915#6301 [356])shard-tglu-1: NOTRUN -> SKIP [358] (i915#6301
>    [356])shard-dg1: NOTRUN -> SKIP [359] (i915#6301 [356])
>  *=20
>    igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier:shard-rkl: NOTR=
UN
>    -> SKIP [355] (i915#15709 [48]) +4 other tests skip
>  *=20
>    igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier:shard-dg1:
>    NOTRUN -> SKIP [354] (i915#15709 [48])
>  *=20
>    igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-
>    clamping:shard-tglu-1: NOTRUN -> SKIP [353] (i915#15709 [48])
>  *=20
>    igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-
>    plane-7:shard-tglu-1: NOTRUN -> SKIP [352] (i915#15608 [348]) +3 other
>    tests skip
>  *=20
>    igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-
>    clamping:shard-dg2: NOTRUN -> SKIP [350] (i915#15709 [48])shard-mtlp:
>    NOTRUN -> SKIP [351] (i915#15709 [48])
>  *=20
>    igt@kms_plane@pixel-format-y-tiled-modifier@pipe-b-plane-5:shard-rkl:
>    NOTRUN -> SKIP [349] (i915#15608 [348]) +1 other test skip
>  *=20
>    igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping:shard-tgl=
u:
>    NOTRUN -> SKIP [347] (i915#15709 [48]) +2 other tests skip
>  *=20
>    igt@kms_plane_alpha_blend@alpha-basic:shard-glk: NOTRUN -> FAIL [346]
>    (i915#12178 [345])
>  *=20
>    igt@kms_plane_alpha_blend@alpha-basic@pipe-a-hdmi-a-1:shard-glk: NOTRU=
N
>    -> FAIL [344] (i915#7862 [343]) +1 other test fail
>  *=20
>    igt@kms_plane_lowres@tiling-x:shard-mtlp: NOTRUN -> SKIP [342]
>    (i915#11614 [339] / i915#3582 [338]) +1 other test skip
>  *=20
>    igt@kms_plane_lowres@tiling-x@pipe-c-edp-1:shard-mtlp: NOTRUN -> SKIP
>    [341] (i915#10226 [340] / i915#11614 [339] / i915#3582 [338]) +2 other
>    tests skip
>  *=20
>    igt@kms_plane_multiple@2x-tiling-4:shard-rkl: NOTRUN -> SKIP [337]
>    (i915#13958 [336])
>  *=20
>    igt@kms_plane_multiple@tiling-4:shard-rkl: NOTRUN -> SKIP [335]
>    (i915#14259 [333])
>  *=20
>    igt@kms_plane_multiple@tiling-yf:shard-tglu-1: NOTRUN -> SKIP [334]
>    (i915#14259 [333])
>  *=20
>    igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:shard-
>    rkl: NOTRUN -> SKIP [332] (i915#15329 [328]) +7 other tests skip
>  *=20
>    igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:shard=
-
>    mtlp: NOTRUN -> SKIP [331] (i915#15329 [328] / i915#6953 [330])
>  *=20
>    igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-
>    d:shard-mtlp: NOTRUN -> SKIP [329] (i915#15329 [328]) +3 other tests
>    skip
>  *=20
>    igt@kms_pm_backlight@bad-brightness:shard-rkl: NOTRUN -> SKIP [327]
>    (i915#5354 [326])
>  *=20
>    igt@kms_pm_backlight@brightness-with-dpms:shard-rkl: NOTRUN -> SKIP
>    [324] (i915#12343 [323])shard-dg1: NOTRUN -> SKIP [325] (i915#12343
>    [323])
>  *=20
>    igt@kms_pm_dc@dc9-dpms:shard-tglu-1: NOTRUN -> SKIP [322] (i915#15739
>    [321])
>  *=20
>    igt@kms_pm_rpm@dpms-lpsp:shard-rkl: PASS [320] -> SKIP [319] (i915#150=
73
>    [178]) +3 other tests skip
>  *=20
>    igt@kms_pm_rpm@modeset-lpsp-stress:shard-dg2: PASS [317] -> SKIP [316]
>    (i915#15073 [178])shard-rkl: NOTRUN -> SKIP [318] (i915#15073 [178]) +=
1
>    other test skip
>  *=20
>    igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:shard-dg1: PASS [315] -> SK=
IP
>    [314] (i915#15073 [178])
>  *=20
>    igt@kms_pm_rpm@pc8-residency:shard-dg2: NOTRUN -> SKIP [313] +2 other
>    tests skip
>  *=20
>    igt@kms_prime@basic-crc-hybrid:shard-rkl: NOTRUN -> SKIP [311]
>    (i915#6524 [32])shard-tglu: NOTRUN -> SKIP [312] (i915#6524 [32])
>  *=20
>    igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-
>    sf:shard-dg2: NOTRUN -> SKIP [306] (i915#11520 [25]) +2 other tests
>    skipshard-snb: NOTRUN -> SKIP [307] (i915#11520 [25]) +2 other tests
>    skipshard-dg1: NOTRUN -> SKIP [308] (i915#11520 [25]) +3 other tests
>    skipshard-mtlp: NOTRUN -> SKIP [310] (i915#12316 [309])
>  *=20
>    igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:shard-rkl:
>    NOTRUN -> SKIP [305] (i915#11520 [25] / i915#14544 [3])
>  *=20
>    igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:shard=
-
>    tglu-1: NOTRUN -> SKIP [304] (i915#11520 [25]) +3 other tests skip
>  *=20
>    igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:shard=
-
>    glk10: NOTRUN -> SKIP [303] (i915#11520 [25]) +2 other tests skip
>  *=20
>    igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:shard-glk11:
>    NOTRUN -> SKIP [302] (i915#11520 [25])
>  *=20
>    igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:shard-tglu: NOTR=
UN
>    -> SKIP [301] (i915#11520 [25]) +7 other tests skip
>  *=20
>    igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:shard-glk:
>    NOTRUN -> SKIP [299] (i915#11520 [25]) +15 other tests skipshard-rkl:
>    NOTRUN -> SKIP [300] (i915#11520 [25]) +8 other tests skip
>  *=20
>    igt@kms_psr@fbc-pr-primary-render:shard-glk10: NOTRUN -> SKIP [298] +1=
25
>    other tests skip
>  *=20
>    igt@kms_psr@fbc-psr-cursor-plane-move:shard-dg2: NOTRUN -> SKIP [296]
>    (i915#1072 [17] / i915#9732 [16]) +7 other tests skipshard-dg1: NOTRUN=
 -
>    > SKIP [297] (i915#1072 [17] / i915#9732 [16]) +10 other tests skip
>  *=20
>    igt@kms_psr@fbc-psr-cursor-plane-move@edp-1:shard-mtlp: NOTRUN -> SKIP
>    [295] (i915#9688 [294]) +9 other tests skip
>  *=20
>    igt@kms_psr@fbc-psr2-sprite-render:shard-rkl: NOTRUN -> SKIP [293]
>    (i915#1072 [17] / i915#9732 [16]) +21 other tests skip
>  *=20
>    igt@kms_psr@pr-cursor-blt:shard-rkl: NOTRUN -> SKIP [292] (i915#1072
>    [17] / i915#14544 [3] / i915#9732 [16]) +1 other test skip
>  *=20
>    igt@kms_psr@pr-cursor-plane-onoff:shard-tglu: NOTRUN -> SKIP [291]
>    (i915#9732 [16]) +17 other tests skip
>  *=20
>    igt@kms_psr@psr2-cursor-blt:shard-tglu-1: NOTRUN -> SKIP [290]
>    (i915#9732 [16]) +11 other tests skip
>  *=20
>    igt@kms_psr_stress_test@flip-primary-invalidate-overlay:shard-tglu:
>    NOTRUN -> SKIP [289] (i915#9685 [43]) +1 other test skip
>  *=20
>    igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:shard-glk:
>    NOTRUN -> INCOMPLETE [288] (i915#15500 [287])
>  *=20
>    igt@kms_rotation_crc@multiplane-rotation-cropping-top:shard-glk: NOTRU=
N
>    -> INCOMPLETE [286] (i915#15492 [285])
>  *=20
>    igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:shard-rkl: NOTRUN ->
>    SKIP [283] (i915#5289 [11])shard-dg1: NOTRUN -> SKIP [284] (i915#5289
>    [11])
>  *=20
>    igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:shard-tglu-1: NOTRU=
N
>    -> SKIP [282] (i915#5289 [11])
>  *=20
>    igt@kms_selftest@drm_framebuffer:shard-tglu-1: NOTRUN -> ABORT [281]
>    (i915#13179 [280]) +1 other test abort
>  *=20
>    igt@kms_setmode@clone-exclusive-crtc:shard-dg2: NOTRUN -> SKIP [277]
>    (i915#3555 [2])shard-mtlp: NOTRUN -> SKIP [279] (i915#3555 [2] /
>    i915#8809 [278])
>  *=20
>    igt@kms_tiled_display@basic-test-pattern-with-chamelium:shard-rkl:
>    NOTRUN -> SKIP [274] (i915#8623 [273])shard-tglu-1: NOTRUN -> SKIP [27=
5]
>    (i915#8623 [273])shard-dg1: NOTRUN -> SKIP [276] (i915#8623 [273])
>  *=20
>    igt@kms_vblank@ts-continuation-suspend:shard-glk10: NOTRUN -> INCOMPLE=
TE
>    [272] (i915#12276 [271]) +1 other test incomplete
>  *=20
>    igt@kms_vrr@flip-basic:shard-rkl: NOTRUN -> SKIP [269] (i915#15243 [8]=
 /
>    i915#3555 [2])shard-dg1: NOTRUN -> SKIP [270] (i915#3555 [2]) +2 other
>    tests skip
>  *=20
>    igt@kms_vrr@lobf:shard-rkl: NOTRUN -> SKIP [265] (i915#11920
>    [264])shard-dg1: NOTRUN -> SKIP [266] (i915#11920 [264])shard-tglu:
>    NOTRUN -> SKIP [267] (i915#11920 [264])shard-mtlp: NOTRUN -> SKIP [268=
]
>    (i915#11920 [264])
>  *=20
>    igt@kms_vrr@seamless-rr-switch-vrr:shard-tglu-1: NOTRUN -> SKIP [263]
>    (i915#9906 [1])
>  *=20
>    igt@perf@mi-rpc:shard-rkl: NOTRUN -> SKIP [262] (i915#2434 [261])
>  *=20
>    igt@perf@unprivileged-single-ctx-counters:shard-rkl: NOTRUN -> SKIP
>    [260] (i915#2433 [259])
>  *=20
>    igt@perf_pmu@module-unload:shard-glk: NOTRUN -> ABORT [258] (i915#1577=
8
>    [257])
>  *=20
>    igt@perf_pmu@rc6-suspend:shard-glk11: NOTRUN -> INCOMPLETE [256]
>    (i915#13356 [255])
>  *=20
>    igt@perf_pmu@rc6@other-idle-gt0:shard-tglu: NOTRUN -> SKIP [254]
>    (i915#8516 [253])
>  *=20
>    igt@prime_mmap@test_aperture_limit:shard-dg2: NOTRUN -> SKIP [252]
>    (i915#14121 [249]) +1 other test skip
>  *=20
>    igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:shard-dg1:
>    NOTRUN -> SKIP [250] (i915#14121 [249]) +1 other test skipshard-mtlp:
>    NOTRUN -> SKIP [251] (i915#14121 [249]) +1 other test skip
>  *=20
>    igt@prime_vgem@basic-fence-flip:shard-dg1: NOTRUN -> SKIP [248]
>    (i915#3708 [244])
>  *=20
>    igt@prime_vgem@basic-write:shard-rkl: NOTRUN -> SKIP [247] (i915#3291
>    [246] / i915#3708 [244])
>  *=20
>    igt@prime_vgem@fence-read-hang:shard-rkl: NOTRUN -> SKIP [245]
>    (i915#3708 [244])
>  *=20
>    igt@sriov_basic@enable-vfs-autoprobe-off:shard-rkl: NOTRUN -> SKIP [24=
3]
>    (i915#9917 [241])
>  *=20
>    igt@sriov_basic@enable-vfs-bind-unbind-each:shard-dg1: NOTRUN -> SKIP
>    [242] (i915#9917 [241])
>  *=20
>    igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:shard-tglu-1:
>    NOTRUN -> FAIL [240] (i915#12910 [237])
>  *=20
>    igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-random:shard-tglu:
>    NOTRUN -> FAIL [238] (i915#12910 [237]) +18 other tests failshard-mtlp=
:
>    NOTRUN -> FAIL [239] (i915#12910 [237]) +8 other tests fail
>  *=20
>    igt@sysfs_timeslice_duration@idempotent@vcs0:shard-snb: NOTRUN -> SKIP
>    [236] +121 other tests skip
> Possible fixes *=20
>    igt@gem_exec_big@single:shard-tglu: FAIL [235] (i915#15816 [234]) ->
>    PASS [233]
>  *=20
>    igt@gem_lmem_swapping@smem-oom:shard-dg1: FAIL [232] (i915#15734 [231]=
)
>    -> PASS [230]
>  *=20
>    igt@gem_lmem_swapping@smem-oom@lmem0:shard-dg1: CRASH [229] (i915#5493
>    [228]) -> PASS [227]
>  *=20
>    igt@i915_pm_rc6_residency@rc6-fence:shard-tglu: WARN [226] (i915#13790
>    [225] / i915#2681 [224]) -> PASS [223] +1 other test pass
>  *=20
>    igt@i915_suspend@basic-s2idle-without-i915:shard-rkl: ABORT [222]
>    (i915#15131 [221]) -> PASS [220]
>  *=20
>    igt@kms_async_flips@alternate-sync-async-flip:shard-dg1: FAIL [219]
>    (i915#14888 [218]) -> PASS [217]
>  *=20
>    igt@kms_atomic_transition@plane-all-modeset-transition-fencing:shard-
>    dg2: FAIL [216] (i915#5956 [215]) -> PASS [214] +1 other test pass
>  *=20
>    igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:shard-mtlp=
:
>    FAIL [213] (i915#15733 [212] / i915#5138 [211]) -> PASS [210]
>  *=20
>    igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1:shard-glk=
:
>    INCOMPLETE [209] (i915#15582 [208]) -> PASS [207]
>  *=20
>    igt@kms_color_pipeline@plane-lut1d-lut1d:shard-dg1: DMESG-WARN [206]
>    (i915#4423 [20]) -> PASS [205] +2 other tests pass
>  *=20
>    igt@kms_cursor_crc@cursor-onscreen-256x85:shard-tglu: FAIL [202]
>    (i915#13566 [201]) -> PASS [200] +1 other test passshard-rkl: FAIL [20=
4]
>    (i915#13566 [201]) -> PASS [203]
>  *=20
>    igt@kms_cursor_crc@cursor-suspend:shard-rkl: ABORT [199] (i915#15132
>    [198]) -> PASS [197] +1 other test pass
>  *=20
>    igt@kms_fbcon_fbt@fbc-suspend:shard-dg1: FAIL [196] (i915#4767 [195]) =
->
>    PASS [194]
>  *=20
>    igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1:shard-snb: TIMEOUT [19=
3]
>    (i915#14033 [192]) -> PASS [191] +1 other test pass
>  *=20
>    igt@kms_frontbuffer_tracking@fbc-tiling-4:shard-dg2: FAIL [190]
>    (i915#15389 [189] / i915#6880 [188]) -> PASS [187]
>  *=20
>    igt@kms_hdr@static-toggle:shard-rkl: SKIP [186] (i915#3555 [2] /
>    i915#8228 [185]) -> PASS [184] +1 other test pass
>  *=20
>    igt@kms_pm_rpm@dpms-non-lpsp:shard-dg1: SKIP [183] (i915#15073 [178]) =
->
>    PASS [182]
>  *=20
>    igt@kms_pm_rpm@modeset-lpsp:shard-dg2: SKIP [181] (i915#15073 [178]) -=
>
>    PASS [180] +1 other test pass
>  *=20
>    igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:shard-rkl: SKIP [179]
>    (i915#15073 [178]) -> PASS [177] +1 other test pass
>  *=20
>    igt@perf_pmu@busy-idle@vcs0:shard-dg2: FAIL [174] (i915#4349 [171]) ->
>    PASS [173] +5 other tests passshard-dg1: FAIL [176] (i915#4349 [171]) =
->
>    PASS [175] +2 other tests pass
>  *=20
>    igt@perf_pmu@busy-idle@vcs1:shard-mtlp: FAIL [172] (i915#4349 [171]) -=
>
>    PASS [170]
> Warnings *=20
>    igt@gem_exec_reloc@basic-gtt-cpu:shard-rkl: SKIP [169] (i915#14544 [3]=
 /
>    i915#3281 [165]) -> SKIP [168] (i915#3281 [165]) +1 other test skip
>  *=20
>    igt@gem_exec_reloc@basic-range-active:shard-rkl: SKIP [167] (i915#3281
>    [165]) -> SKIP [166] (i915#14544 [3] / i915#3281 [165]) +2 other tests
>    skip
>  *=20
>    igt@gem_lmem_swapping@random:shard-rkl: SKIP [164] (i915#14544 [3] /
>    i915#4613 [162]) -> SKIP [163] (i915#4613 [162]) +1 other test skip
>  *=20
>    igt@gem_media_vme:shard-rkl: SKIP [161] (i915#14544 [3] / i915#284
>    [159]) -> SKIP [160] (i915#284 [159])
>  *=20
>    igt@gem_set_tiling_vs_blt@tiled-to-tiled:shard-rkl: SKIP [158]
>    (i915#14544 [3] / i915#8411 [156]) -> SKIP [157] (i915#8411 [156])
>  *=20
>    igt@gem_userptr_blits@coherency-unsync:shard-rkl: SKIP [155] (i915#329=
7
>    [153]) -> SKIP [154] (i915#14544 [3] / i915#3297 [153])
>  *=20
>    igt@gen9_exec_parse@bb-oversize:shard-rkl: SKIP [152] (i915#14544 [3] =
/
>    i915#2527 [150]) -> SKIP [151] (i915#2527 [150]) +1 other test skip
>  *=20
>    igt@i915_module_load@resize-bar:shard-rkl: SKIP [149] (i915#6412 [147]=
)
>    -> SKIP [148] (i915#14544 [3] / i915#6412 [147])
>  *=20
>    igt@kms_atomic@plane-primary-overlay-mutable-zpos:shard-rkl: SKIP [146=
]
>    (i915#9531 [144]) -> SKIP [145] (i915#14544 [3] / i915#9531 [144])
>  *=20
>    igt@kms_big_fb@4-tiled-8bpp-rotate-180:shard-rkl: SKIP [143] (i915#528=
6
>    [139]) -> SKIP [142] (i915#14544 [3] / i915#5286 [139])
>  *=20
>    igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180:shard-rkl: SKIP
>    [141] (i915#14544 [3] / i915#5286 [139]) -> SKIP [140] (i915#5286 [139=
])
>    +1 other test skip
>  *=20
>    igt@kms_big_fb@y-tiled-64bpp-rotate-90:shard-rkl: SKIP [138] (i915#363=
8
>    [136]) -> SKIP [137] (i915#14544 [3] / i915#3638 [136]) +2 other tests
>    skip
>  *=20
>    igt@kms_big_fb@yf-tiled-32bpp-rotate-180:shard-rkl: SKIP [135]
>    (i915#14544 [3]) -> SKIP [134] +10 other tests skip
>  *=20
>    igt@kms_big_fb@yf-tiled-addfb:shard-rkl: SKIP [133] -> SKIP [132]
>    (i915#14544 [3]) +1 other test skip
>  *=20
>    igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-b-hdmi-a-2:shard-rkl:
>    SKIP [131] (i915#14544 [3] / i915#6095 [122]) -> SKIP [130] (i915#6095
>    [122]) +6 other tests skip
>  *=20
>    igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:shard-rkl: SKIP [129]
>    (i915#14098 [123] / i915#14544 [3] / i915#6095 [122]) -> SKIP [128]
>    (i915#14098 [123] / i915#6095 [122]) +9 other tests skip
>  *=20
>    igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-a-hdmi-a-2:shard-rkl: SK=
IP
>    [127] (i915#6095 [122]) -> SKIP [126] (i915#14544 [3] / i915#6095 [122=
])
>    +1 other test skip
>  *=20
>    igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-c-hdmi-a-2:shard-rkl: SK=
IP
>    [125] (i915#14098 [123] / i915#6095 [122]) -> SKIP [124] (i915#14098
>    [123] / i915#14544 [3] / i915#6095 [122]) +1 other test skip
>  *=20
>    igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:shard-rkl: SKIP [121]
>    (i915#11151 [119] / i915#14544 [3] / i915#7828 [118]) -> SKIP [120]
>    (i915#11151 [119] / i915#7828 [118]) +2 other tests skip
>  *=20
>    igt@kms_content_protection@mei-interface:shard-rkl: SKIP [117]
>    (i915#14544 [3] / i915#6944 [113] / i915#9424 [111]) -> SKIP [116]
>    (i915#6944 [113] / i915#9424 [111])
>  *=20
>    igt@kms_content_protection@type1:shard-rkl: SKIP [115] (i915#14544 [3]=
 /
>    i915#6944 [113] / i915#7118 [112] / i915#9424 [111]) -> SKIP [114]
>    (i915#6944 [113] / i915#7118 [112] / i915#9424 [111])
>  *=20
>    igt@kms_cursor_crc@cursor-offscreen-max-size:shard-rkl: SKIP [110]
>    (i915#14544 [3] / i915#3555 [2]) -> SKIP [109] (i915#3555 [2])
>  *=20
>    igt@kms_cursor_crc@cursor-sliding-512x512:shard-rkl: SKIP [108]
>    (i915#13049 [106] / i915#14544 [3]) -> SKIP [107] (i915#13049 [106]) +=
1
>    other test skip
>  *=20
>    igt@kms_dp_aux_dev:shard-rkl: SKIP [105] (i915#1257 [103] / i915#14544
>    [3]) -> SKIP [104] (i915#1257 [103])
>  *=20
>    igt@kms_dp_link_training@non-uhbr-sst:shard-rkl: SKIP [102] (i915#1374=
9
>    [100]) -> SKIP [101] (i915#13749 [100] / i915#14544 [3])
>  *=20
>    igt@kms_dsc@dsc-with-bpc:shard-rkl: SKIP [99] (i915#14544 [3] /
>    i915#3555 [2] / i915#3840 [97]) -> SKIP [98] (i915#3555 [2] / i915#384=
0
>    [97])
>  *=20
>    igt@kms_feature_discovery@psr1:shard-rkl: SKIP [96] (i915#14544 [3] /
>    i915#658 [94]) -> SKIP [95] (i915#658 [94])
>  *=20
>    igt@kms_flip@2x-blocking-wf_vblank:shard-rkl: SKIP [93] (i915#14544 [3=
]
>    / i915#9934 [89]) -> SKIP [92] (i915#9934 [89]) +2 other tests skip
>  *=20
>    igt@kms_flip@2x-modeset-vs-vblank-race:shard-rkl: SKIP [91] (i915#9934
>    [89]) -> SKIP [90] (i915#14544 [3] / i915#9934 [89])
>  *=20
>    igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-
>    downscaling:shard-rkl: SKIP [88] (i915#15643 [84]) -> SKIP [87]
>    (i915#14544 [3] / i915#15643 [84])
>  *=20
>    igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:shar=
d-
>    rkl: SKIP [86] (i915#14544 [3] / i915#15643 [84]) -> SKIP [85]
>    (i915#15643 [84])
>  *=20
>    igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:shard-rk=
l:
>    SKIP [83] (i915#14544 [3] / i915#1825 [77]) -> SKIP [82] (i915#1825
>    [77]) +9 other tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt:shard-
>    dg1: SKIP [81] (i915#4423 [20]) -> SKIP [80]
>  *=20
>    igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-
>    render:shard-rkl: SKIP [79] (i915#1825 [77]) -> SKIP [78] (i915#14544
>    [3] / i915#1825 [77]) +7 other tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@fbc-tiling-4:shard-rkl: SKIP [76]
>    (i915#14544 [3] / i915#5439 [74]) -> SKIP [75] (i915#5439 [74])
>  *=20
>    igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-
>    pwrite:shard-rkl: SKIP [73] (i915#15102 [59]) -> SKIP [72] (i915#14544
>    [3] / i915#15102 [59])
>  *=20
>    igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:shard-rkl:
>    SKIP [71] (i915#14544 [3] / i915#15102 [59] / i915#3023 [58]) -> SKIP
>    [70] (i915#15102 [59] / i915#3023 [58]) +5 other tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-
>    blt:shard-dg2: SKIP [69] (i915#10433 [65] / i915#15102 [59] / i915#345=
8
>    [64]) -> SKIP [68] (i915#15102 [59] / i915#3458 [64]) +1 other test sk=
ip
>  *=20
>    igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:shard-dg2: SKI=
P
>    [67] (i915#15102 [59] / i915#3458 [64]) -> SKIP [66] (i915#10433 [65] =
/
>    i915#15102 [59] / i915#3458 [64]) +5 other tests skip
>  *=20
>    igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-
>    cpu:shard-rkl: SKIP [63] (i915#14544 [3] / i915#15102 [59]) -> SKIP [6=
2]
>    (i915#15102 [59])
>  *=20
>    igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-
>    render:shard-rkl: SKIP [61] (i915#15102 [59] / i915#3023 [58]) -> SKIP
>    [60] (i915#14544 [3] / i915#15102 [59] / i915#3023 [58]) +2 other test=
s
>    skip
>  *=20
>    igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:shard-rkl: SKIP
>    [57] (i915#14544 [3] / i915#15638 [55] / i915#15722 [54]) -> SKIP [56]
>    (i915#15638 [55] / i915#15722 [54])
>  *=20
>    igt@kms_pipe_stress@stress-xrgb8888-yftiled:shard-rkl: SKIP [53]
>    (i915#14544 [3] / i915#14712 [51]) -> SKIP [52] (i915#14712 [51])
>  *=20
>    igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-
>    clamping:shard-rkl: SKIP [50] (i915#14544 [3] / i915#15709 [48]) -> SK=
IP
>    [49] (i915#15709 [48]) +1 other test skip
>  *=20
>    igt@kms_plane_lowres@tiling-yf:shard-rkl: SKIP [47] (i915#3555 [2]) ->
>    SKIP [46] (i915#14544 [3] / i915#3555 [2])
>  *=20
>    igt@kms_pm_dc@dc3co-vpb-simulation:shard-rkl: SKIP [45] (i915#14544 [3=
]
>    / i915#9685 [43]) -> SKIP [44] (i915#9685 [43])
>  *=20
>    igt@kms_pm_dc@dc6-dpms:shard-tglu: FAIL [42] (i915#15752 [41]) -> SKIP
>    [40] (i915#15128 [39])
>  *=20
>    igt@kms_pm_lpsp@kms-lpsp:shard-rkl: SKIP [38] (i915#3828 [37]) -> SKIP
>    [36] (i915#9340 [35])
>  *=20
>    igt@kms_prime@d3hot:shard-rkl: SKIP [34] (i915#6524 [32]) -> SKIP [33]
>    (i915#14544 [3] / i915#6524 [32])
>  *=20
>    igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:shard-
>    rkl: SKIP [31] (i915#11520 [25]) -> SKIP [30] (i915#11520 [25] /
>    i915#14544 [3]) +1 other test skip
>  *=20
>    igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:shard-rkl:
>    SKIP [29] (i915#11520 [25] / i915#14544 [3]) -> SKIP [28] (i915#11520
>    [25]) +2 other tests skip
>  *=20
>    igt@kms_psr2_sf@psr2-cursor-plane-update-sf:shard-dg1: SKIP [27]
>    (i915#11520 [25] / i915#4423 [20]) -> SKIP [26] (i915#11520 [25])
>  *=20
>    igt@kms_psr@pr-cursor-plane-onoff:shard-rkl: SKIP [24] (i915#1072 [17]=
 /
>    i915#9732 [16]) -> SKIP [23] (i915#1072 [17] / i915#14544 [3] /
>    i915#9732 [16]) +3 other tests skip
>  *=20
>    igt@kms_psr@psr-no-drrs:shard-dg1: SKIP [22] (i915#1072 [17] / i915#97=
32
>    [16]) -> SKIP [21] (i915#1072 [17] / i915#4423 [20] / i915#9732 [16])
>  *=20
>    igt@kms_psr@psr-sprite-plane-move:shard-rkl: SKIP [19] (i915#1072 [17]=
 /
>    i915#14544 [3] / i915#9732 [16]) -> SKIP [18] (i915#1072 [17] /
>    i915#9732 [16]) +8 other tests skip
>  *=20
>    igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:shard-rkl: SKIP [15=
]
>    (i915#5289 [11]) -> SKIP [14] (i915#14544 [3] / i915#5289 [11])
>  *=20
>    igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:shard-rkl: SKIP [13]
>    (i915#14544 [3] / i915#5289 [11]) -> SKIP [12] (i915#5289 [11])
>  *=20
>    igt@kms_vrr@flip-suspend:shard-rkl: SKIP [10] (i915#14544 [3] /
>    i915#15243 [8] / i915#3555 [2]) -> SKIP [9] (i915#15243 [8] / i915#355=
5
>    [2])
>  *=20
>    igt@kms_vrr@max-min:shard-rkl: SKIP [7] (i915#9906 [1]) -> SKIP [6]
>    (i915#14544 [3] / i915#9906 [1])
>  *=20
>    igt@kms_vrr@negative-basic:shard-rkl: SKIP [5] (i915#3555 [2] /
>    i915#9906 [1]) -> SKIP [4] (i915#14544 [3] / i915#3555 [2] / i915#9906
>    [1])
> Build changes * CI: CI-20190529 -> None
>  * IGT: IGT_8799 -> IGTPW_14752
>  * Piglit: piglit_4509 -> None
> CI-20190529: 20190529
> CI_DRM_18139: 3fb8dfc6a69ee530c365c36f13bb79ef7f35af1d @
> git://anongit.freedesktop.org/gfx-ci/linux
> IGTPW_14752: 14752
> IGT_8799: 8799
> piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @
> git://anongit.freedesktop.org/piglit


[1] i915#9906 https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906
[2] i915#3555 https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
[3] i915#14544
    https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544
[4] SKIP
    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-6/igt@km=
s_vrr@negative-basic.html
[5] SKIP
    https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-rkl-2/igt@k=
ms_vrr@negative-basic.html
[6] SKIP
    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-6/igt@km=
s_vrr@max-min.html
[7] SKIP
    https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-rkl-5/igt@k=
ms_vrr@max-min.html
[8] i915#15243
    https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243
[9] SKIP
    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-2/igt@km=
s_vrr@flip-suspend.html
[10] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-rkl-6/igt@=
kms_vrr@flip-suspend.html
[11] i915#5289 https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289
[12] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-7/igt@k=
ms_rotation_crc@primary-yf-tiled-reflect-x-0.html
[13] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-rkl-6/igt@=
kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
[14] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-6/igt@k=
ms_rotation_crc@primary-4-tiled-reflect-x-180.html
[15] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-rkl-5/igt@=
kms_rotation_crc@primary-4-tiled-reflect-x-180.html
[16] i915#9732 https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
[17] i915#1072 https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
[18] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-5/igt@k=
ms_psr@psr-sprite-plane-move.html
[19] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-rkl-6/igt@=
kms_psr@psr-sprite-plane-move.html
[20] i915#4423 https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423
[21] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg1-17/igt@=
kms_psr@psr-no-drrs.html
[22] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-dg1-18/igt=
@kms_psr@psr-no-drrs.html
[23] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-6/igt@k=
ms_psr@pr-cursor-plane-onoff.html
[24] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-rkl-2/igt@=
kms_psr@pr-cursor-plane-onoff.html
[25] i915#11520
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
[26] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg1-13/igt@=
kms_psr2_sf@psr2-cursor-plane-update-sf.html
[27] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-dg1-12/igt=
@kms_psr2_sf@psr2-cursor-plane-update-sf.html
[28] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-3/igt@k=
ms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html
[29] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-rkl-6/igt@=
kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html
[30] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-6/igt@k=
ms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html
[31] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-rkl-5/igt@=
kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html
[32] i915#6524 https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524
[33] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-6/igt@k=
ms_prime@d3hot.html
[34] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-rkl-1/igt@=
kms_prime@d3hot.html
[35] i915#9340 https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340
[36] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-4/igt@k=
ms_pm_lpsp@kms-lpsp.html
[37] i915#3828 https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828
[38] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-rkl-8/igt@=
kms_pm_lpsp@kms-lpsp.html
[39] i915#15128
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15128
[40] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-tglu-6/igt@=
kms_pm_dc@dc6-dpms.html
[41] i915#15752
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15752
[42] FAIL
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-tglu-3/igt=
@kms_pm_dc@dc6-dpms.html
[43] i915#9685 https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685
[44] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-8/igt@k=
ms_pm_dc@dc3co-vpb-simulation.html
[45] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-rkl-6/igt@=
kms_pm_dc@dc3co-vpb-simulation.html
[46] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-6/igt@k=
ms_plane_lowres@tiling-yf.html
[47] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-rkl-8/igt@=
kms_plane_lowres@tiling-yf.html
[48] i915#15709
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709
[49] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-5/igt@k=
ms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping.html
[50] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-rkl-6/igt@=
kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping.html
[51] i915#14712
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712
[52] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-8/igt@k=
ms_pipe_stress@stress-xrgb8888-yftiled.html
[53] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-rkl-6/igt@=
kms_pipe_stress@stress-xrgb8888-yftiled.html
[54] i915#15722
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15722
[55] i915#15638
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15638
[56] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-2/igt@k=
ms_joiner@switch-modeset-ultra-joiner-big-joiner.html
[57] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-rkl-6/igt@=
kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
[58] i915#3023 https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023
[59] i915#15102
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102
[60] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-6/igt@k=
ms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render.html
[61] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-rkl-4/igt@=
kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render.html
[62] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-5/igt@k=
ms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-cpu.html
[63] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-rkl-6/igt@=
kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-cpu.html
[64] i915#3458 https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458
[65] i915#10433
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433
[66] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg2-4/igt@k=
ms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html
[67] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-dg2-7/igt@=
kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html
[68] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg2-8/igt@k=
ms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
[69] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-dg2-4/igt@=
kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
[70] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-8/igt@k=
ms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html
[71] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-rkl-6/igt@=
kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html
[72] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-6/igt@k=
ms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-pwrite.html
[73] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-rkl-2/igt@=
kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-pwrite.html
[74] i915#5439 https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439
[75] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-3/igt@k=
ms_frontbuffer_tracking@fbc-tiling-4.html
[76] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-rkl-6/igt@=
kms_frontbuffer_tracking@fbc-tiling-4.html
[77] i915#1825 https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
[78] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-6/igt@k=
ms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render.html
[79] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-rkl-2/igt@=
kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render.html
[80] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg1-19/igt@=
kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt.html
[81] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-dg1-12/igt=
@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt.html
[82] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-1/igt@k=
ms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html
[83] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-rkl-6/igt@=
kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html
[84] i915#15643
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643
[85] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-4/igt@k=
ms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html
[86] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-rkl-6/igt@=
kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html
[87] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-6/igt@k=
ms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html
[88] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-rkl-4/igt@=
kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html
[89] i915#9934 https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934
[90] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-6/igt@k=
ms_flip@2x-modeset-vs-vblank-race.html
[91] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-rkl-8/igt@=
kms_flip@2x-modeset-vs-vblank-race.html
[92] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-2/igt@k=
ms_flip@2x-blocking-wf_vblank.html
[93] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-rkl-6/igt@=
kms_flip@2x-blocking-wf_vblank.html
[94] i915#658 https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658
[95] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-8/igt@k=
ms_feature_discovery@psr1.html
[96] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-rkl-6/igt@=
kms_feature_discovery@psr1.html
[97] i915#3840 https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840
[98] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-7/igt@k=
ms_dsc@dsc-with-bpc.html
[99] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-rkl-6/igt@=
kms_dsc@dsc-with-bpc.html
[100] i915#13749
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749
[101] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-6/igt@=
kms_dp_link_training@non-uhbr-sst.html
[102] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-rkl-4/igt=
@kms_dp_link_training@non-uhbr-sst.html
[103] i915#1257
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257
[104] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-5/igt@=
kms_dp_aux_dev.html
[105] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-rkl-6/igt=
@kms_dp_aux_dev.html
[106] i915#13049
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049
[107] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-7/igt@=
kms_cursor_crc@cursor-sliding-512x512.html
[108] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-rkl-6/igt=
@kms_cursor_crc@cursor-sliding-512x512.html
[109] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-3/igt@=
kms_cursor_crc@cursor-offscreen-max-size.html
[110] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-rkl-6/igt=
@kms_cursor_crc@cursor-offscreen-max-size.html
[111] i915#9424
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424
[112] i915#7118
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118
[113] i915#6944
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944
[114] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-7/igt@=
kms_content_protection@type1.html
[115] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-rkl-6/igt=
@kms_content_protection@type1.html
[116] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-4/igt@=
kms_content_protection@mei-interface.html
[117] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-rkl-6/igt=
@kms_content_protection@mei-interface.html
[118] i915#7828
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
[119] i915#11151
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151
[120] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-7/igt@=
kms_chamelium_hpd@dp-hpd-enable-disable-mode.html
[121] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-rkl-6/igt=
@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html
[122] i915#6095
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095
[123] i915#14098
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098
[124] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-6/igt@=
kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-c-hdmi-a-2.html
[125] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-rkl-7/igt=
@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-c-hdmi-a-2.html
[126] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-6/igt@=
kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-a-hdmi-a-2.html
[127] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-rkl-7/igt=
@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-a-hdmi-a-2.html
[128] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-3/igt@=
kms_ccs@crc-primary-suspend-yf-tiled-ccs.html
[129] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-rkl-6/igt=
@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html
[130] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-3/igt@=
kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-b-hdmi-a-2.html
[131] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-rkl-6/igt=
@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-b-hdmi-a-2.html
[132] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-6/igt@=
kms_big_fb@yf-tiled-addfb.html
[133] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-rkl-7/igt=
@kms_big_fb@yf-tiled-addfb.html
[134] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-5/igt@=
kms_big_fb@yf-tiled-32bpp-rotate-180.html
[135] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-rkl-6/igt=
@kms_big_fb@yf-tiled-32bpp-rotate-180.html
[136] i915#3638
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638
[137] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-6/igt@=
kms_big_fb@y-tiled-64bpp-rotate-90.html
[138] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-rkl-8/igt=
@kms_big_fb@y-tiled-64bpp-rotate-90.html
[139] i915#5286
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286
[140] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-4/igt@=
kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html
[141] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-rkl-6/igt=
@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html
[142] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-6/igt@=
kms_big_fb@4-tiled-8bpp-rotate-180.html
[143] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-rkl-4/igt=
@kms_big_fb@4-tiled-8bpp-rotate-180.html
[144] i915#9531
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9531
[145] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-6/igt@=
kms_atomic@plane-primary-overlay-mutable-zpos.html
[146] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-rkl-3/igt=
@kms_atomic@plane-primary-overlay-mutable-zpos.html
[147] i915#6412
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6412
[148] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-6/igt@=
i915_module_load@resize-bar.html
[149] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-rkl-2/igt=
@i915_module_load@resize-bar.html
[150] i915#2527
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527
[151] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-3/igt@=
gen9_exec_parse@bb-oversize.html
[152] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-rkl-6/igt=
@gen9_exec_parse@bb-oversize.html
[153] i915#3297
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297
[154] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-6/igt@=
gem_userptr_blits@coherency-unsync.html
[155] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-rkl-1/igt=
@gem_userptr_blits@coherency-unsync.html
[156] i915#8411
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411
[157] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-2/igt@=
gem_set_tiling_vs_blt@tiled-to-tiled.html
[158] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-rkl-6/igt=
@gem_set_tiling_vs_blt@tiled-to-tiled.html
[159] i915#284 https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284
[160] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-8/igt@=
gem_media_vme.html
[161] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-rkl-6/igt=
@gem_media_vme.html
[162] i915#4613
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
[163] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-7/igt@=
gem_lmem_swapping@random.html
[164] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-rkl-6/igt=
@gem_lmem_swapping@random.html
[165] i915#3281
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281
[166] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-6/igt@=
gem_exec_reloc@basic-range-active.html
[167] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-rkl-3/igt=
@gem_exec_reloc@basic-range-active.html
[168] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-2/igt@=
gem_exec_reloc@basic-gtt-cpu.html
[169] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-rkl-6/igt=
@gem_exec_reloc@basic-gtt-cpu.html
[170] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-mtlp-4/igt=
@perf_pmu@busy-idle@vcs1.html
[171] i915#4349
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349
[172] FAIL
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-mtlp-5/ig=
t@perf_pmu@busy-idle@vcs1.html
[173] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg2-4/igt@=
perf_pmu@busy-idle@vcs0.html
[174] FAIL
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-dg2-4/igt=
@perf_pmu@busy-idle@vcs0.html
[175] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg1-17/igt=
@perf_pmu@busy-idle@vcs0.html
[176] FAIL
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-dg1-12/ig=
t@perf_pmu@busy-idle@vcs0.html
[177] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-3/igt@=
kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
[178] i915#15073
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073
[179] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-rkl-5/igt=
@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
[180] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg2-4/igt@=
kms_pm_rpm@modeset-lpsp.html
[181] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-dg2-7/igt=
@kms_pm_rpm@modeset-lpsp.html
[182] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg1-12/igt=
@kms_pm_rpm@dpms-non-lpsp.html
[183] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-dg1-14/ig=
t@kms_pm_rpm@dpms-non-lpsp.html
[184] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-6/igt@=
kms_hdr@static-toggle.html
[185] i915#8228
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228
[186] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-rkl-2/igt=
@kms_hdr@static-toggle.html
[187] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg2-3/igt@=
kms_frontbuffer_tracking@fbc-tiling-4.html
[188] i915#6880
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6880
[189] i915#15389
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15389
[190] FAIL
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-dg2-6/igt=
@kms_frontbuffer_tracking@fbc-tiling-4.html
[191] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-snb1/igt@k=
ms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1.html
[192] i915#14033
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14033
[193] TIMEOUT
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-snb6/igt@=
kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1.html
[194] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg1-18/igt=
@kms_fbcon_fbt@fbc-suspend.html
[195] i915#4767
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4767
[196] FAIL
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-dg1-12/ig=
t@kms_fbcon_fbt@fbc-suspend.html
[197] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-7/igt@=
kms_cursor_crc@cursor-suspend.html
[198] i915#15132
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15132
[199] ABORT
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-rkl-1/igt=
@kms_cursor_crc@cursor-suspend.html
[200] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-tglu-5/igt=
@kms_cursor_crc@cursor-onscreen-256x85.html
[201] i915#13566
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566
[202] FAIL
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-tglu-4/ig=
t@kms_cursor_crc@cursor-onscreen-256x85.html
[203] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-8/igt@=
kms_cursor_crc@cursor-onscreen-256x85.html
[204] FAIL
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-rkl-1/igt=
@kms_cursor_crc@cursor-onscreen-256x85.html
[205] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg1-17/igt=
@kms_color_pipeline@plane-lut1d-lut1d.html
[206] DMESG-WARN
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-dg1-16/ig=
t@kms_color_pipeline@plane-lut1d-lut1d.html
[207] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-glk6/igt@k=
ms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1.html
[208] i915#15582
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582
[209] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-glk8/igt@=
kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1.html
[210] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-mtlp-7/igt=
@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
[211] i915#5138
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5138
[212] i915#15733
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15733
[213] FAIL
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-mtlp-8/ig=
t@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
[214] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg2-3/igt@=
kms_atomic_transition@plane-all-modeset-transition-fencing.html
[215] i915#5956
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5956
[216] FAIL
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-dg2-3/igt=
@kms_atomic_transition@plane-all-modeset-transition-fencing.html
[217] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg1-17/igt=
@kms_async_flips@alternate-sync-async-flip.html
[218] i915#14888
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14888
[219] FAIL
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-dg1-14/ig=
t@kms_async_flips@alternate-sync-async-flip.html
[220] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-2/igt@=
i915_suspend@basic-s2idle-without-i915.html
[221] i915#15131
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15131
[222] ABORT
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-rkl-1/igt=
@i915_suspend@basic-s2idle-without-i915.html
[223] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-tglu-6/igt=
@i915_pm_rc6_residency@rc6-fence.html
[224] i915#2681
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2681
[225] i915#13790
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13790
[226] WARN
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-tglu-3/ig=
t@i915_pm_rc6_residency@rc6-fence.html
[227] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg1-16/igt=
@gem_lmem_swapping@smem-oom@lmem0.html
[228] i915#5493
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5493
[229] CRASH
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-dg1-19/ig=
t@gem_lmem_swapping@smem-oom@lmem0.html
[230] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg1-16/igt=
@gem_lmem_swapping@smem-oom.html
[231] i915#15734
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15734
[232] FAIL
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-dg1-19/ig=
t@gem_lmem_swapping@smem-oom.html
[233] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-tglu-10/ig=
t@gem_exec_big@single.html
[234] i915#15816
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15816
[235] FAIL
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-tglu-8/ig=
t@gem_exec_big@single.html
[236] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-snb7/igt@s=
ysfs_timeslice_duration@idempotent@vcs0.html
[237] i915#12910
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12910
[238] FAIL
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-tglu-3/igt=
@sriov_basic@enable-vfs-bind-unbind-each@numvfs-random.html
[239] FAIL
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-mtlp-8/igt=
@sriov_basic@enable-vfs-bind-unbind-each@numvfs-random.html
[240] FAIL
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-tglu-1/igt=
@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
[241] i915#9917
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917
[242] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg1-12/igt=
@sriov_basic@enable-vfs-bind-unbind-each.html
[243] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-4/igt@=
sriov_basic@enable-vfs-autoprobe-off.html
[244] i915#3708
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
[245] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-3/igt@=
prime_vgem@fence-read-hang.html
[246] i915#3291
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291
[247] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-2/igt@=
prime_vgem@basic-write.html
[248] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg1-12/igt=
@prime_vgem@basic-fence-flip.html
[249] i915#14121
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14121
[250] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg1-12/igt=
@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html
[251] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-mtlp-3/igt=
@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html
[252] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg2-3/igt@=
prime_mmap@test_aperture_limit.html
[253] i915#8516
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516
[254] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-tglu-4/igt=
@perf_pmu@rc6@other-idle-gt0.html
[255] i915#13356
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356
[256] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-glk11/igt@=
perf_pmu@rc6-suspend.html
[257] i915#15778
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15778
[258] ABORT
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-glk9/igt@p=
erf_pmu@module-unload.html
[259] i915#2433
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2433
[260] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-5/igt@=
perf@unprivileged-single-ctx-counters.html
[261] i915#2434
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2434
[262] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-5/igt@=
perf@mi-rpc.html
[263] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-tglu-1/igt=
@kms_vrr@seamless-rr-switch-vrr.html
[264] i915#11920
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920
[265] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-8/igt@=
kms_vrr@lobf.html
[266] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg1-18/igt=
@kms_vrr@lobf.html
[267] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-tglu-3/igt=
@kms_vrr@lobf.html
[268] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-mtlp-1/igt=
@kms_vrr@lobf.html
[269] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-3/igt@=
kms_vrr@flip-basic.html
[270] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg1-17/igt=
@kms_vrr@flip-basic.html
[271] i915#12276
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12276
[272] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-glk10/igt@=
kms_vblank@ts-continuation-suspend.html
[273] i915#8623
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623
[274] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-2/igt@=
kms_tiled_display@basic-test-pattern-with-chamelium.html
[275] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-tglu-1/igt=
@kms_tiled_display@basic-test-pattern-with-chamelium.html
[276] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg1-14/igt=
@kms_tiled_display@basic-test-pattern-with-chamelium.html
[277] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg2-4/igt@=
kms_setmode@clone-exclusive-crtc.html
[278] i915#8809
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8809
[279] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-mtlp-2/igt=
@kms_setmode@clone-exclusive-crtc.html
[280] i915#13179
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13179
[281] ABORT
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-tglu-1/igt=
@kms_selftest@drm_framebuffer.html
[282] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-tglu-1/igt=
@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
[283] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-2/igt@=
kms_rotation_crc@primary-4-tiled-reflect-x-0.html
[284] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg1-14/igt=
@kms_rotation_crc@primary-4-tiled-reflect-x-0.html
[285] i915#15492
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15492
[286] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-glk5/igt@k=
ms_rotation_crc@multiplane-rotation-cropping-top.html
[287] i915#15500
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15500
[288] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-glk9/igt@k=
ms_rotation_crc@multiplane-rotation-cropping-bottom.html
[289] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-tglu-7/igt=
@kms_psr_stress_test@flip-primary-invalidate-overlay.html
[290] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-tglu-1/igt=
@kms_psr@psr2-cursor-blt.html
[291] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-tglu-7/igt=
@kms_psr@pr-cursor-plane-onoff.html
[292] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-6/igt@=
kms_psr@pr-cursor-blt.html
[293] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-7/igt@=
kms_psr@fbc-psr2-sprite-render.html
[294] i915#9688
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688
[295] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-mtlp-5/igt=
@kms_psr@fbc-psr-cursor-plane-move@edp-1.html
[296] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg2-3/igt@=
kms_psr@fbc-psr-cursor-plane-move.html
[297] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg1-18/igt=
@kms_psr@fbc-psr-cursor-plane-move.html
[298] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-glk10/igt@=
kms_psr@fbc-pr-primary-render.html
[299] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-glk2/igt@k=
ms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html
[300] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-7/igt@=
kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html
[301] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-tglu-2/igt=
@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html
[302] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-glk11/igt@=
kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html
[303] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-glk10/igt@=
kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html
[304] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-tglu-1/igt=
@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html
[305] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-6/igt@=
kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html
[306] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg2-1/igt@=
kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html
[307] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-snb4/igt@k=
ms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html
[308] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg1-12/igt=
@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html
[309] i915#12316
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316
[310] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-mtlp-6/igt=
@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html
[311] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-7/igt@=
kms_prime@basic-crc-hybrid.html
[312] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-tglu-7/igt=
@kms_prime@basic-crc-hybrid.html
[313] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg2-3/igt@=
kms_pm_rpm@pc8-residency.html
[314] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg1-13/igt=
@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
[315] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-dg1-14/ig=
t@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
[316] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg2-1/igt@=
kms_pm_rpm@modeset-lpsp-stress.html
[317] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-dg2-4/igt=
@kms_pm_rpm@modeset-lpsp-stress.html
[318] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-7/igt@=
kms_pm_rpm@modeset-lpsp-stress.html
[319] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-7/igt@=
kms_pm_rpm@dpms-lpsp.html
[320] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-rkl-5/igt=
@kms_pm_rpm@dpms-lpsp.html
[321] i915#15739
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15739
[322] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-tglu-1/igt=
@kms_pm_dc@dc9-dpms.html
[323] i915#12343
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343
[324] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-7/igt@=
kms_pm_backlight@brightness-with-dpms.html
[325] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg1-16/igt=
@kms_pm_backlight@brightness-with-dpms.html
[326] i915#5354
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
[327] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-8/igt@=
kms_pm_backlight@bad-brightness.html
[328] i915#15329
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329
[329] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-mtlp-4/igt=
@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-d.html
[330] i915#6953
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953
[331] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-mtlp-4/igt=
@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html
[332] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-7/igt@=
kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html
[333] i915#14259
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259
[334] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-tglu-1/igt=
@kms_plane_multiple@tiling-yf.html
[335] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-8/igt@=
kms_plane_multiple@tiling-4.html
[336] i915#13958
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958
[337] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-2/igt@=
kms_plane_multiple@2x-tiling-4.html
[338] i915#3582
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3582
[339] i915#11614
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11614
[340] i915#10226
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10226
[341] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-mtlp-5/igt=
@kms_plane_lowres@tiling-x@pipe-c-edp-1.html
[342] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-mtlp-5/igt=
@kms_plane_lowres@tiling-x.html
[343] i915#7862
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7862
[344] FAIL
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-glk1/igt@k=
ms_plane_alpha_blend@alpha-basic@pipe-a-hdmi-a-1.html
[345] i915#12178
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12178
[346] FAIL
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-glk1/igt@k=
ms_plane_alpha_blend@alpha-basic.html
[347] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-tglu-10/ig=
t@kms_plane@pixel-format-yf-tiled-modifier-source-clamping.html
[348] i915#15608
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15608
[349] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-2/igt@=
kms_plane@pixel-format-y-tiled-modifier@pipe-b-plane-5.html
[350] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg2-7/igt@=
kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping.html
[351] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-mtlp-1/igt=
@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping.html
[352] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-tglu-1/igt=
@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane-7.htm=
l
[353] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-tglu-1/igt=
@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping.html
[354] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg1-16/igt=
@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier.html
[355] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-8/igt@=
kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier.html
[356] i915#6301
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301
[357] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-1/igt@=
kms_panel_fitting@atomic-fastset.html
[358] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-tglu-1/igt=
@kms_panel_fitting@atomic-fastset.html
[359] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg1-19/igt=
@kms_panel_fitting@atomic-fastset.html
[360] i915#15460
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15460
[361] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-tglu-6/igt=
@kms_joiner@invalid-modeset-big-joiner.html
[362] i915#15458
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458
[363] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-tglu-1/igt=
@kms_joiner@basic-ultra-joiner.html
[364] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-8/igt@=
kms_hdr@static-toggle-dpms.html
[365] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-tglu-1/igt=
@kms_hdr@invalid-metadata-sizes.html
[366] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-tglu-5/igt=
@kms_hdr@bpc-switch-suspend.html
[367] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg2-4/igt@=
kms_hdr@bpc-switch-suspend.html
[368] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg1-17/igt=
@kms_hdr@bpc-switch-suspend.html
[369] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-7/igt@=
kms_hdr@bpc-switch.html
[370] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-rkl-6/igt=
@kms_hdr@bpc-switch.html
[371] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg2-4/igt@=
kms_frontbuffer_tracking@psr-slowdraw.html
[372] i915#8708
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708
[373] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-mtlp-4/igt=
@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-gtt.html
[374] i915#15104
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104
[375] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg1-12/igt=
@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-gtt.html
[376] i915#9766
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9766
[377] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-tglu-1/igt=
@kms_frontbuffer_tracking@pipe-fbc-rte.html
[378] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-7/igt@=
kms_frontbuffer_tracking@fbcpsr-tiling-4.html
[379] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-tglu-1/igt=
@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render.html
[380] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg1-14/igt=
@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render.html
[381] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-7/igt@=
kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html
[382] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-tglu-10/ig=
t@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-gtt.html
[383] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-5/igt@=
kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html
[384] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-tglu-4/igt=
@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-pwrite.html
[385] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-mtlp-4/igt=
@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc.html
[386] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-6/igt@=
kms_frontbuffer_tracking@fbcpsr-1p-shrfb-fliptrack-mmap-gtt.html
[387] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg2-1/igt@=
kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render.html
[388] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg1-12/igt=
@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc.html
[389] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-mtlp-6/igt=
@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-gtt.html
[390] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg2-1/igt@=
kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-gtt.html
[391] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-7/igt@=
kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt.html
[392] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg1-16/igt=
@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt.html
[393] i915#10056
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10056
[394] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-glk8/igt@k=
ms_frontbuffer_tracking@fbc-suspend.html
[395] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg1-16/igt=
@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-pwrite.html
[396] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg2-4/igt@=
kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render.html
[397] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-6/igt@=
kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html
[398] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg2-8/igt@=
kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html
[399] FAIL
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg2-3/igt@=
kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-cpu.html
[400] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-dg2-5/igt=
@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-cpu.html
[401] i915#5190
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
[402] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg2-5/igt@=
kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling.html
[403] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-tglu-1/igt=
@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
[404] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-2/igt@=
kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.htm=
l
[405] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-mtlp-8/igt=
@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html
[406] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg1-12/igt=
@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html
[407] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-tglu-9/igt=
@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html
[408] ABORT
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg2-10/igt=
@kms_flip@flip-vs-suspend@d-dp3.html
[409] i915#6113
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113
[410] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-6/igt@=
kms_flip@flip-vs-suspend@a-hdmi-a2.html
[411] ABORT
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg2-10/igt=
@kms_flip@flip-vs-suspend.html
[412] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-dg2-3/igt=
@kms_flip@flip-vs-suspend.html
[413] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-6/igt@=
kms_flip@flip-vs-suspend.html
[414] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-rkl-5/igt=
@kms_flip@flip-vs-suspend.html
[415] i915#13027
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13027
[416] FAIL
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg2-5/igt@=
kms_flip@flip-vs-expired-vblank@a-hdmi-a3.html
[417] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-dg2-5/igt=
@kms_flip@flip-vs-expired-vblank@a-hdmi-a3.html
[418] i915#3637
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
[419] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-tglu-1/igt=
@kms_flip@2x-wf_vblank-ts-check.html
[420] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg2-5/igt@=
kms_flip@2x-flip-vs-panning-vs-hang.html
[421] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg1-14/igt=
@kms_flip@2x-flip-vs-panning-vs-hang.html
[422] i915#8381
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381
[423] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg2-4/igt@=
kms_flip@2x-flip-vs-fences-interruptible.html
[424] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg1-14/igt=
@kms_flip@2x-flip-vs-fences-interruptible.html
[425] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-mtlp-3/igt=
@kms_flip@2x-flip-vs-fences-interruptible.html
[426] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-2/igt@=
kms_flip@2x-flip-vs-dpms.html
[427] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-tglu-9/igt=
@kms_flip@2x-flip-vs-absolute-wf_vblank.html
[428] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-mtlp-2/igt=
@kms_flip@2x-flip-vs-absolute-wf_vblank.html
[429] i915#9053
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9053
[430] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg1-19/igt=
@kms_dsc@dsc-with-output-formats-with-bpc.html
[431] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-6/igt@=
kms_dsc@dsc-with-output-formats.html
[432] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-tglu-4/igt=
@kms_dsc@dsc-with-formats.html
[433] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-mtlp-3/igt=
@kms_dsc@dsc-with-formats.html
[434] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg2-3/igt@=
kms_dsc@dsc-with-formats.html
[435] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-2/igt@=
kms_dsc@dsc-with-formats.html
[436] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg1-12/igt=
@kms_dsc@dsc-with-formats.html
[437] i915#13707
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707
[438] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg2-8/igt@=
kms_dp_linktrain_fallback@dp-fallback.html
[439] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg1-16/igt=
@kms_dp_linktrain_fallback@dp-fallback.html
[440] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-tglu-8/igt=
@kms_dp_linktrain_fallback@dp-fallback.html
[441] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-mtlp-4/igt=
@kms_dp_linktrain_fallback@dp-fallback.html
[442] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg2-1/igt@=
kms_dp_link_training@non-uhbr-mst.html
[443] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-7/igt@=
kms_dp_link_training@non-uhbr-mst.html
[444] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg1-16/igt=
@kms_dp_link_training@non-uhbr-mst.html
[445] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-tglu-2/igt=
@kms_dp_link_training@non-uhbr-mst.html
[446] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-mtlp-1/igt=
@kms_dp_link_training@non-uhbr-mst.html
[447] i915#3804
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
[448] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-5/igt@=
kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html
[449] i915#13691
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13691
[450] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-3/igt@=
kms_display_modes@extended-mode-basic.html
[451] i915#9723
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723
[452] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg1-19/igt=
@kms_dirtyfb@psr-dirtyfb-ioctl.html
[453] i915#9067
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9067
[454] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-2/igt@=
kms_cursor_legacy@modeset-atomic-cursor-hotspot.html
[455] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-tglu-9/igt=
@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html
[456] i915#13046
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046
[457] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg2-4/igt@=
kms_cursor_legacy@cursorb-vs-flipb-atomic.html
[458] i915#4103
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
[459] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-4/igt@=
kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
[460] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-5/igt@=
kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
[461] i915#9809
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809
[462] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-mtlp-4/igt=
@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
[463] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-tglu-1/igt=
@kms_cursor_crc@cursor-rapid-movement-max-size.html
[464] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-7/igt@=
kms_cursor_crc@cursor-rapid-movement-32x10.html
[465] FAIL
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-4/igt@=
kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-2.html
[466] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-rkl-3/igt=
@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-2.html
[467] FAIL
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-tglu-2/igt=
@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1.html
[468] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-tglu-6/ig=
t@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1.html
[469] FAIL
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-tglu-8/igt=
@kms_cursor_crc@cursor-onscreen-64x21@pipe-a-hdmi-a-1.html
[470] i915#8814
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814
[471] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-mtlp-4/igt=
@kms_cursor_crc@cursor-onscreen-64x21.html
[472] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-7/igt@=
kms_cursor_crc@cursor-onscreen-512x512.html
[473] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-tglu-1/igt=
@kms_cursor_crc@cursor-onscreen-512x170.html
[474] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-tglu-9/igt=
@kms_cursor_crc@cursor-onscreen-32x32.html
[475] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-tglu-1/igt=
@kms_content_protection@legacy-hdcp14.html
[476] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-2/igt@=
kms_content_protection@legacy.html
[477] i915#15330
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330
[478] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-3/igt@=
kms_content_protection@dp-mst-type-0-suspend-resume.html
[479] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg1-12/igt=
@kms_content_protection@dp-mst-lic-type-0-hdcp14.html
[480] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-tglu-4/igt=
@kms_content_protection@dp-mst-lic-type-0-hdcp14.html
[481] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-mtlp-6/igt=
@kms_content_protection@dp-mst-lic-type-0-hdcp14.html
[482] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg2-1/igt@=
kms_content_protection@dp-mst-lic-type-0-hdcp14.html
[483] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-5/igt@=
kms_content_protection@atomic-hdcp14.html
[484] i915#7116
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7116
[485] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-tglu-2/igt=
@kms_content_protection@atomic.html
[486] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg2-10/igt=
@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html
[487] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-4/igt@=
kms_chamelium_hpd@vga-hpd-fast.html
[488] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg1-12/igt=
@kms_chamelium_hpd@vga-hpd-fast.html
[489] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-mtlp-4/igt=
@kms_chamelium_hpd@vga-hpd-enable-disable-mode.html
[490] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-tglu-1/igt=
@kms_chamelium_hpd@dp-hpd-storm-disable.html
[491] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-6/igt@=
kms_chamelium_frames@hdmi-crc-fast.html
[492] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-tglu-7/igt=
@kms_chamelium_frames@hdmi-crc-fast.html
[493] i915#3742
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742
[494] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg1-17/igt=
@kms_cdclk@mode-transition-all-outputs.html
[495] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-glk8/igt@k=
ms_cdclk@mode-transition.html
[496] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-3/igt@=
kms_cdclk@mode-transition.html
[497] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-tglu-8/igt=
@kms_cdclk@mode-transition.html
[498] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-3/igt@=
kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-2.html
[499] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-mtlp-5/igt=
@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-a-edp-1.html
[500] i915#10434
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434
[501] i915#10307
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
[502] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg2-4/igt@=
kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-hdmi-a-1.html
[503] i915#12313
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313
[504] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-5/igt@=
kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
[505] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-tglu-5/igt=
@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
[506] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-glk6/igt@k=
ms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-2.html
[507] i915#15652
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15652
[508] ABORT
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-tglu-4/igt=
@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html
[509] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-tglu-8/ig=
t@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html
[510] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-tglu-1/igt=
@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
[511] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg2-3/igt@=
kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-3.html
[512] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-6/igt@=
kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-2.html
[513] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-6/igt@=
kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html
[514] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-tglu-9/igt=
@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs.html
[515] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-8/igt@=
kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-1.html
[516] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg2-8/igt@=
kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-3.html
[517] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg1-18/igt=
@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4.html
[518] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-mtlp-6/igt=
@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
[519] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-tglu-1/igt=
@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html
[520] i915#4538
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538
[521] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg2-4/igt@=
kms_big_fb@yf-tiled-64bpp-rotate-180.html
[522] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-6/igt@=
kms_big_fb@yf-tiled-64bpp-rotate-180.html
[523] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg1-19/igt=
@kms_big_fb@yf-tiled-64bpp-rotate-180.html
[524] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg2-5/igt@=
kms_big_fb@y-tiled-addfb-size-offset-overflow.html
[525] i915#6187
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6187
[526] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-mtlp-1/igt=
@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
[527] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-7/igt@=
kms_big_fb@y-tiled-8bpp-rotate-270.html
[528] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg1-13/igt=
@kms_big_fb@x-tiled-16bpp-rotate-270.html
[529] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-tglu-1/igt=
@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html
[530] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-tglu-3/igt=
@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html
[531] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-8/igt@=
kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html
[532] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg1-13/igt=
@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
[533] FAIL
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-mtlp-7/igt=
@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
[534] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-mtlp-5/ig=
t@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
[535] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-tglu-4/igt=
@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
[536] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-2/igt@=
kms_big_fb@4-tiled-64bpp-rotate-180.html
[537] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-tglu-1/igt=
@kms_big_fb@4-tiled-32bpp-rotate-90.html
[538] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-6/igt@=
kms_big_fb@4-tiled-32bpp-rotate-0.html
[539] FAIL
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-mtlp-6/igt=
@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-=
edp-1.html
[540] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-mtlp-2/ig=
t@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a=
-edp-1.html
[541] i915#1769
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769
[542] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-glk9/igt@k=
ms_atomic_transition@plane-all-modeset-transition-internal-panels.html
[543] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-tglu-10/ig=
t@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
[544] i915#4212
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212
[545] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg1-12/igt=
@kms_addfb_basic@clobberred-modifier.html
[546] i915#4817
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817
[547] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-glk1/igt@i=
915_suspend@forcewake.html
[548] i915#15140
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15140
[549] ABORT
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-1/igt@=
i915_suspend@fence-restore-tiled2untiled.html
[550] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-rkl-3/igt=
@i915_suspend@fence-restore-tiled2untiled.html
[551] i915#5723
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5723
[552] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-6/igt@=
i915_query@test-query-geometry-subslices.html
[553] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg1-12/igt=
@i915_query@test-query-geometry-subslices.html
[554] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-tglu-3/igt=
@i915_query@test-query-geometry-subslices.html
[555] i915#11681
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
[556] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg1-18/igt=
@i915_pm_rps@thresholds-idle.html
[557] i915#6621
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621
[558] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg1-18/igt=
@i915_pm_rps@min-max-config-idle.html
[559] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-mtlp-1/igt=
@i915_pm_rps@min-max-config-idle.html
[560] i915#8399
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399
[561] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-2/igt@=
i915_pm_freq_api@freq-suspend.html
[562] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-tglu-3/igt=
@i915_module_load@resize-bar.html
[563] i915#14545
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14545
[564] i915#13029
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13029
[565] DMESG-WARN
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg1-19/igt=
@i915_module_load@reload-no-display.html
[566] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-dg1-16/ig=
t@i915_module_load@reload-no-display.html
[567] i915#118 https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/118
[568] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-glk3/igt@i=
915_module_load@load.html
[569] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-glk1/igt@i=
915_module_load@load.html
[570] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-glk2/igt@i=
915_module_load@load.html
[571] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-glk9/igt@i=
915_module_load@load.html
[572] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-glk4/igt@i=
915_module_load@load.html
[573] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-glk5/igt@i=
915_module_load@load.html
[574] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-glk6/igt@i=
915_module_load@load.html
[575] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-glk8/igt@i=
915_module_load@load.html
[576] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-glk9/igt@=
i915_module_load@load.html
[577] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-glk8/igt@=
i915_module_load@load.html
[578] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-glk3/igt@=
i915_module_load@load.html
[579] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-glk4/igt@=
i915_module_load@load.html
[580] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-glk5/igt@=
i915_module_load@load.html
[581] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-glk6/igt@=
i915_module_load@load.html
[582] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-glk2/igt@=
i915_module_load@load.html
[583] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-glk1/igt@=
i915_module_load@load.html
[584] i915#15342
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15342
[585] ABORT
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-tglu-1/igt=
@i915_module_load@fault-injection@intel_connector_register.html
[586] ABORT
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-glk5/igt@i=
915_module_load@fault-injection@intel_connector_register.html
[587] i915#15479
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15479
[588] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-tglu-1/igt=
@i915_module_load@fault-injection@__uc_init.html
[589] i915#11527
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11527
[590] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg2-4/igt@=
i915_drm_fdinfo@busy-check-all@vecs0.html
[591] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-mtlp-4/igt=
@i915_drm_fdinfo@busy-check-all@ccs0.html
[592] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg1-17/igt=
@i915_drm_fdinfo@busy-check-all.html
[593] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-6/igt@=
gen9_exec_parse@valid-registers.html
[594] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-4/igt@=
gen9_exec_parse@shadow-peek.html
[595] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg1-18/igt=
@gen9_exec_parse@bb-start-cmd.html
[596] i915#2856
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856
[597] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-tglu-10/ig=
t@gen9_exec_parse@bb-start-cmd.html
[598] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-mtlp-6/igt=
@gen9_exec_parse@bb-start-cmd.html
[599] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg2-8/igt@=
gen9_exec_parse@bb-start-cmd.html
[600] i915#5566
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5566
[601] ABORT
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-glk1/igt@g=
en9_exec_parse@allowed-single.html
[602] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-glk1/igt@=
gen9_exec_parse@allowed-single.html
[603] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-6/igt@=
gem_workarounds@suspend-resume-context.html
[604] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-rkl-7/igt=
@gem_workarounds@suspend-resume-context.html
[605] i915#14586
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14586
[606] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-glk10/igt@=
gem_workarounds@suspend-resume.html
[607] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg2-1/igt@=
gem_userptr_blits@unsync-unmap-cycles.html
[608] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg1-16/igt=
@gem_userptr_blits@unsync-unmap-cycles.html
[609] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-tglu-2/igt=
@gem_userptr_blits@unsync-unmap-cycles.html
[610] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-glk11/igt@=
gem_userptr_blits@unsync-unmap-after-close.html
[611] i915#4880
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4880
[612] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg2-6/igt@=
gem_userptr_blits@map-fixed-invalidate-overlap.html
[613] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg1-16/igt=
@gem_userptr_blits@map-fixed-invalidate-overlap.html
[614] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-tglu-1/igt=
@gem_userptr_blits@invalid-mmap-offset-unsync.html
[615] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-7/igt@=
gem_userptr_blits@coherency-sync.html
[616] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-mtlp-7/igt=
@gem_userptr_blits@access-control.html
[617] i915#4077
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
[618] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg2-6/igt@=
gem_tiled_partial_pwrite_pread@writes-after-reads.html
[619] i915#13809
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13809
[620] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-3/igt@=
gem_softpin@noreloc-s3.html
[621] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-rkl-8/igt=
@gem_softpin@noreloc-s3.html
[622] i915#4079
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
[623] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg1-16/igt=
@gem_set_tiling_vs_gtt.html
[624] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-mtlp-7/igt=
@gem_set_tiling_vs_gtt.html
[625] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg2-6/igt@=
gem_set_tiling_vs_gtt.html
[626] i915#8428
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428
[627] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg2-1/igt@=
gem_render_copy@yf-tiled-to-vebox-linear.html
[628] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-mtlp-1/igt=
@gem_render_copy@yf-tiled-to-vebox-linear.html
[629] i915#4270
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270
[630] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg2-8/igt@=
gem_pxp@verify-pxp-key-change-after-suspend-resume.html
[631] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg1-18/igt=
@gem_pxp@verify-pxp-key-change-after-suspend-resume.html
[632] i915#13717
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13717
[633] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-6/igt@=
gem_pxp@hw-rejects-pxp-buffer.html
[634] i915#2658
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658
[635] i915#14702
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14702
[636] WARN
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-glk9/igt@g=
em_pwrite@basic-exhaustion.html
[637] WARN
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-tglu-2/igt=
@gem_pwrite@basic-exhaustion.html
[638] WARN
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-glk1/igt@g=
em_pread@exhaustion.html
[639] i915#3282
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282
[640] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-8/igt@=
gem_partial_pwrite_pread@writes-after-reads.html
[641] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg2-4/igt@=
gem_partial_pwrite_pread@reads-uncached.html
[642] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg1-19/igt=
@gem_partial_pwrite_pread@reads-uncached.html
[643] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-mtlp-8/igt=
@gem_partial_pwrite_pread@reads-uncached.html
[644] i915#4083
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
[645] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg1-13/igt=
@gem_mmap_wc@write-cpu-read-wc.html
[646] i915#15478
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15478
[647] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-mtlp-5/igt=
@gem_mmap_offset@clear@smem0.html
[648] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-mtlp-5/ig=
t@gem_mmap_offset@clear@smem0.html
[649] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg1-16/igt=
@gem_mmap_gtt@close-race.html
[650] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-mtlp-1/igt=
@gem_mmap_gtt@close-race.html
[651] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg2-7/igt@=
gem_mmap@pf-nonblock.html
[652] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-mtlp-1/igt=
@gem_mmap@pf-nonblock.html
[653] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-tglu-7/igt=
@gem_lmem_swapping@random-engines.html
[654] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-2/igt@=
gem_lmem_swapping@parallel-random-verify.html
[655] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-tglu-1/igt=
@gem_lmem_swapping@parallel-random-verify.html
[656] i915#4565
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4565
[657] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg1-14/igt=
@gem_lmem_swapping@heavy-verify-random-ccs@lmem0.html
[658] i915#12193
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12193
[659] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg1-14/igt=
@gem_lmem_swapping@heavy-verify-random-ccs.html
[660] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-glk8/igt@g=
em_lmem_swapping@heavy-verify-multi-ccs.html
[661] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-mtlp-2/igt=
@gem_lmem_swapping@heavy-verify-multi-ccs.html
[662] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-6/igt@=
gem_lmem_swapping@heavy-multi.html
[663] i915#7582
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7582
[664] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-tglu-1/igt=
@gem_lmem_evict@dontneed-evict-race.html
[665] i915#2190
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190
[666] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-3/igt@=
gem_huc_copy@huc-copy.html
[667] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-glk9/igt@g=
em_huc_copy@huc-copy.html
[668] i915#4860
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860
[669] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg1-18/igt=
@gem_fenced_exec_thrash@2-spare-fences.html
[670] i915#13196
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13196
[671] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-glk11/igt@=
gem_exec_suspend@basic-s3.html
[672] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-2/igt@=
gem_exec_reloc@basic-write-wc-noreloc.html
[673] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg2-5/igt@=
gem_exec_reloc@basic-wc-cpu.html
[674] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg1-14/igt=
@gem_exec_reloc@basic-wc-cpu.html
[675] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-mtlp-4/igt=
@gem_exec_reloc@basic-wc-cpu.html
[676] i915#5107
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5107
[677] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-mtlp-3/igt=
@gem_exec_params@rsvd2-dirt.html
[678] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg2-3/igt@=
gem_exec_params@rsvd2-dirt.html
[679] i915#4852
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852
[680] i915#3539
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539
[681] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg2-3/igt@=
gem_exec_flush@basic-uc-rw-default.html
[682] DMESG-FAIL
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-mtlp-6/igt=
@gem_exec_big@single.html
[683] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-mtlp-5/ig=
t@gem_exec_big@single.html
[684] i915#4525
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525
[685] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-tglu-9/igt=
@gem_exec_balancer@parallel-ordering.html
[686] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-2/igt@=
gem_exec_balancer@parallel-keep-submit-fence.html
[687] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-tglu-1/igt=
@gem_exec_balancer@parallel-keep-submit-fence.html
[688] i915#4771
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4771
[689] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg2-8/igt@=
gem_exec_balancer@bonded-sync.html
[690] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg1-13/igt=
@gem_exec_balancer@bonded-sync.html
[691] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-mtlp-5/igt=
@gem_exec_balancer@bonded-sync.html
[692] i915#4812
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812
[693] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg2-1/igt@=
gem_exec_balancer@bonded-false-hang.html
[694] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg1-16/igt=
@gem_exec_balancer@bonded-false-hang.html
[695] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-mtlp-1/igt=
@gem_exec_balancer@bonded-false-hang.html
[696] i915#13390
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13390
[697] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-6/igt@=
gem_eio@in-flight-suspend.html
[698] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-glk4/igt@g=
em_eio@in-flight-suspend.html
[699] i915#280 https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280
[700] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg2-4/igt@=
gem_ctx_sseu@invalid-args.html
[701] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg1-19/igt=
@gem_ctx_sseu@invalid-args.html
[702] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-tglu-2/igt=
@gem_ctx_sseu@invalid-args.html
[703] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-mtlp-8/igt=
@gem_ctx_sseu@invalid-args.html
[704] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-tglu-1/igt=
@gem_ctx_sseu@engines.html
[705] i915#1099
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099
[706] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-snb4/igt@g=
em_ctx_persistence@legacy-engines-persistence.html
[707] i915#8555
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555
[708] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg2-1/igt@=
gem_ctx_persistence@heartbeat-close.html
[709] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg1-17/igt=
@gem_ctx_persistence@heartbeat-close.html
[710] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-mtlp-7/igt=
@gem_ctx_persistence@heartbeat-close.html
[711] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-glk5/igt@g=
em_ctx_isolation@preservation-s3@rcs0.html
[712] i915#8562
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8562
[713] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-4/igt@=
gem_create@create-ext-set-pat.html
[714] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-tglu-1/igt=
@gem_create@create-ext-set-pat.html
[715] i915#7697
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697
[716] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-7/igt@=
gem_close_race@multigpu-basic-process.html
[717] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg2-7/igt@=
gem_ccs@suspend-resume.html
[718] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-dg2-3/igt=
@gem_ccs@suspend-resume.html
[719] i915#13008
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13008
[720] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-7/igt@=
gem_ccs@large-ctrl-surf-copy.html
[721] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg1-14/igt=
@gem_ccs@large-ctrl-surf-copy.html
[722] i915#9323
      https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323
[723] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-1/igt@=
gem_ccs@ctrl-surf-copy.html
[724] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-tglu-1/igt=
@gem_ccs@ctrl-surf-copy.html
[725] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg1-19/igt=
@gem_ccs@ctrl-surf-copy.html
[726] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-mtlp-8/igt=
@gem_ccs@ctrl-surf-copy.html
[727] SKIP
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-6/igt@=
gem_bad_reloc@negative-reloc-lut.html
[728] INCOMPLETE
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-mtlp-5/igt=
@kms_big_fb@linear-64bpp-rotate-180.html
[729] PASS
      https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-mtlp-5/ig=
t@kms_big_fb@linear-64bpp-rotate-180.html
[730] FAIL
      https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-mtlp-5/igt=
@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

--=-txpjMCQ6JsHeqANLWc8W
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html><head>
 =20
  <title>Project List - Patchwork</title>
  <style id=3D"css-table-select" type=3D"text/css">
   td { padding: 2pt; }
  </style>
<style>pre,code,address {
  margin: 0px;
}
h1,h2,h3,h4,h5,h6 {
  margin-top: 0.2em;
  margin-bottom: 0.2em;
}
ol,ul {
  margin-top: 0em;
  margin-bottom: 0em;
}
blockquote {
  margin-top: 0em;
  margin-bottom: 0em;
}
</style></head>
<body><div>Hi&nbsp;<a href=3D"mailto:I915-ci-infra@lists.freedesktop.org">I=
915-ci-infra@lists.freedesktop.org</a></div><div><br></div><div>On Wed, 202=
6-03-18 at 11:37 +0000, Patchwork wrote:</div><blockquote type=3D"cite" sty=
le=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex"><d=
iv><b>Patch Details</b></div>
<div><table>
<tbody><tr><td><b>Series:</b></td><td>tests/intel/gem_lmem_swapping: Expect=
 gem leak helper crashes (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/162418/">https://patchwork.freedesktop.org/series/162418/</a></td></tr=
>
<tr><td><b>State:</b></td><td>failure</td></tr> <tr><td><b>Details:</b></td=
><td><a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/index.=
html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/index.html</a></=
td></tr></tbody></table> </div><h1>CI Bug Log - changes from CI_DRM_18139_f=
ull -&gt; IGTPW_14752_full</h1><h2>Summary</h2><p><strong>FAILURE</strong><=
/p><p>Serious unknown changes coming with IGTPW_14752_full absolutely need =
to be<br> verified manually.</p><p>If you think the reported changes have n=
othing to do with the changes<br> introduced in IGTPW_14752_full, please no=
tify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br> =
to document this new failure mode, which will reduce false positives in CI.=
</p><p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/i=
ndex.html</p><h2>Participating hosts (10 -&gt; 10)</h2><p>No changes in par=
ticipating hosts</p><h2>Possible new issues</h2><p>Here are the unknown cha=
nges that may have been introduced in IGTPW_14752_full:</p><h3>IGT changes<=
/h3><h4>Possible regressions</h4><ul>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p></li>=
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-mtlp-5/igt@kms_big_fb@4-tiled-max-hw-stride=
-32bpp-rotate-0-async-flip.html">FAIL</a><br></li>
</ul></ul></blockquote><div><br></div><pre>(kms_big_fb:2474) ioctl_wrappers=
-CRITICAL: Last errno: 12, Cannot allocate memory
</pre><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px=
 #729fcf solid;padding-left:1ex"><ul>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-180:</p></li><ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18139/shard-mtlp-5/igt@kms_big_fb@linear-64bpp-rotate-180.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752=
/shard-mtlp-5/igt@kms_big_fb@linear-64bpp-rotate-180.html">INCOMPLETE</a></=
li>
</ul>
</ul></blockquote><div><br></div><div><div><span id=3D"dmesg-normal194" cla=
ss=3D"dmesg dmesg-normal">&lt;3&gt; [436.858161] Out of memory: Killed proc=
ess 2791 (kms_big_fb)</span></div></div><div><br></div><div>Not the test ch=
anged by this series, not a discrete platform -- not related.</div><div>Ple=
ase update filters and re-report.</div><div><br></div><div>Thanks,<br>Janus=
z</div><div><br></div><div><br></div><blockquote type=3D"cite" style=3D"mar=
gin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex"><h2>Known i=
ssues</h2><p>Here are the changes found in IGTPW_14752_full that come from =
known issues:</p><h3>IGT changes</h3><h4>Issues hit</h4><ul>
<li>
<p>igt@gem_bad_reloc@negative-reloc-lut:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-rkl-6/igt@gem_bad_reloc@negative-reloc-lut.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/3281">i915#3281</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-rkl-1/igt@gem_ccs@ctrl-surf-copy.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/35=
55">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/9323">i915#9323</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-tglu-1/igt@gem_ccs@ctrl-surf-copy.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3=
555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/9323">i915#9323</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-dg1-19/igt@gem_ccs@ctrl-surf-copy.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3=
555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/9323">i915#9323</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-mtlp-8/igt@gem_ccs@ctrl-surf-copy.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3=
555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/9323">i915#9323</a>)</li>
</ul></li>
<li>
<p>igt@gem_ccs@large-ctrl-surf-copy:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-rkl-7/igt@gem_ccs@large-ctrl-surf-copy.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/13008">i915#13008</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-dg1-14/igt@gem_ccs@large-ctrl-surf-copy.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/13008">i915#13008</a>)</li>
</ul></li>
<li>
<p>igt@gem_ccs@suspend-resume:</p><ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18139/shard-dg2-3/igt@gem_ccs@suspend-resume.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg2-7/=
igt@gem_ccs@suspend-resume.html">INCOMPLETE</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) +3 other te=
sts incomplete</li>
</ul></li>
<li>
<p>igt@gem_close_race@multigpu-basic-process:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-rkl-7/igt@gem_close_race@multigpu-basic-pro=
cess.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/7697">i915#7697</a>)</li>
</ul></li>
<li>
<p>igt@gem_create@create-ext-set-pat:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-rkl-4/igt@gem_create@create-ext-set-pat.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/8562">i915#8562</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-tglu-1/igt@gem_create@create-ext-set-pat.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/8562">i915#8562</a>)</li>
</ul></li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@rcs0:</p><ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-glk5/igt@gem_ctx_isolation@preservation-s3@=
rcs0.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/13356">i915#13356</a>) +1 other test incomplete</li>
</ul></li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-close:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-dg2-1/igt@gem_ctx_persistence@heartbeat-clo=
se.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/8555">i915#8555</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-dg1-17/igt@gem_ctx_persistence@heartbeat-cl=
ose.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/8555">i915#8555</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-mtlp-7/igt@gem_ctx_persistence@heartbeat-cl=
ose.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/8555">i915#8555</a>)</li>
</ul></li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-persistence:</p><ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-snb4/igt@gem_ctx_persistence@legacy-engines=
-persistence.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/1099">i915#1099</a>)</li>
</ul></li>
<li>
<p>igt@gem_ctx_sseu@engines:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-tglu-1/igt@gem_ctx_sseu@engines.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280=
">i915#280</a>)</li>
</ul></li>
<li>
<p>igt@gem_ctx_sseu@invalid-args:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-dg2-4/igt@gem_ctx_sseu@invalid-args.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/280">i915#280</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-dg1-19/igt@gem_ctx_sseu@invalid-args.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/280">i915#280</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-tglu-2/igt@gem_ctx_sseu@invalid-args.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/280">i915#280</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-mtlp-8/igt@gem_ctx_sseu@invalid-args.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/280">i915#280</a>)</li>
</ul></li>
<li>
<p>igt@gem_eio@in-flight-suspend:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-rkl-6/igt@gem_eio@in-flight-suspend.html">I=
NCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/13390">i915#13390</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-glk4/igt@gem_eio@in-flight-suspend.html">IN=
COMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/13390">i915#13390</a>)</li>
</ul></li>
<li>
<p>igt@gem_exec_balancer@bonded-false-hang:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-dg2-1/igt@gem_exec_balancer@bonded-false-ha=
ng.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/4812">i915#4812</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-dg1-16/igt@gem_exec_balancer@bonded-false-h=
ang.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/4812">i915#4812</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-mtlp-1/igt@gem_exec_balancer@bonded-false-h=
ang.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/4812">i915#4812</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@gem_exec_balancer@bonded-sync:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-dg2-8/igt@gem_exec_balancer@bonded-sync.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/4771">i915#4771</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-dg1-13/igt@gem_exec_balancer@bonded-sync.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/4771">i915#4771</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-mtlp-5/igt@gem_exec_balancer@bonded-sync.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/4771">i915#4771</a>)</li>
</ul></li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-submit-fence:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-rkl-2/igt@gem_exec_balancer@parallel-keep-s=
ubmit-fence.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/4525">i915#4525</a>) +1 other test skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-tglu-1/igt@gem_exec_balancer@parallel-keep-=
submit-fence.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/4525">i915#4525</a>)</li>
</ul></li>
<li>
<p>igt@gem_exec_balancer@parallel-ordering:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-tglu-9/igt@gem_exec_balancer@parallel-order=
ing.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/4525">i915#4525</a>)</li>
</ul></li>
<li>
<p>igt@gem_exec_big@single:</p><ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18139/shard-mtlp-5/igt@gem_exec_big@single.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-mtlp-6/i=
gt@gem_exec_big@single.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/15478">i915#15478</a>)</li>
</ul></li>
<li>
<p>igt@gem_exec_flush@basic-uc-rw-default:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-dg2-3/igt@gem_exec_flush@basic-uc-rw-defaul=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3539">i915#3539</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/4852">i915#4852</a>)</li>
</ul></li>
<li>
<p>igt@gem_exec_params@rsvd2-dirt:</p><ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-mtlp-3/igt@gem_exec_params@rsvd2-dirt.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/5107">i915#5107</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-dg2-3/igt@gem_exec_params@rsvd2-dirt.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/5107">i915#5107</a>)</li>
</ul></li>
<li>
<p>igt@gem_exec_reloc@basic-wc-cpu:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-dg2-5/igt@gem_exec_reloc@basic-wc-cpu.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3281">i915#3281</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-dg1-14/igt@gem_exec_reloc@basic-wc-cpu.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/3281">i915#3281</a>) +3 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-mtlp-4/igt@gem_exec_reloc@basic-wc-cpu.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/3281">i915#3281</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@gem_exec_reloc@basic-write-wc-noreloc:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-rkl-2/igt@gem_exec_reloc@basic-write-wc-nor=
eloc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/3281">i915#3281</a>) +10 other tests skip</li>
</ul></li>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p><ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-glk11/igt@gem_exec_suspend@basic-s3.html">I=
NCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/13196">i915#13196</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/13356">i915#13356</a>) +1 other test incomplete</li>
</ul></li>
<li>
<p>igt@gem_fenced_exec_thrash@2-spare-fences:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-dg1-18/igt@gem_fenced_exec_thrash@2-spare-f=
ences.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/4860">i915#4860</a>)</li>
</ul></li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-rkl-3/igt@gem_huc_copy@huc-copy.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/219=
0">i915#2190</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-glk9/igt@gem_huc_copy@huc-copy.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190=
">i915#2190</a>)</li>
</ul></li>
<li>
<p>igt@gem_lmem_evict@dontneed-evict-race:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-tglu-1/igt@gem_lmem_evict@dontneed-evict-ra=
ce.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/4613">i915#4613</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/7582">i915#7582</a>)</li>
</ul></li>
<li>
<p>igt@gem_lmem_swapping@heavy-multi:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-rkl-6/igt@gem_lmem_swapping@heavy-multi.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/4613">i915#4613</a>)</li>
</ul></li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi-ccs:</p><ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-glk8/igt@gem_lmem_swapping@heavy-verify-mul=
ti-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/4613">i915#4613</a>) +5 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-mtlp-2/igt@gem_lmem_swapping@heavy-verify-m=
ulti-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/4613">i915#4613</a>)</li>
</ul></li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random-ccs:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-dg1-14/igt@gem_lmem_swapping@heavy-verify-r=
andom-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/12193">i915#12193</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-dg1-14/igt@gem_lmem_swapping@heavy-verify-r=
andom-ccs@lmem0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/4565">i915#4565</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-rkl-2/igt@gem_lmem_swapping@parallel-random=
-verify.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/4613">i915#4613</a>) +4 other tests skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-tglu-1/igt@gem_lmem_swapping@parallel-rando=
m-verify.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/4613">i915#4613</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@gem_lmem_swapping@random-engines:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-tglu-7/igt@gem_lmem_swapping@random-engines=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/4613">i915#4613</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@gem_mmap@pf-nonblock:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-dg2-7/igt@gem_mmap@pf-nonblock.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083=
">i915#4083</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-mtlp-1/igt@gem_mmap@pf-nonblock.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/408=
3">i915#4083</a>)</li>
</ul></li>
<li>
<p>igt@gem_mmap_gtt@close-race:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-dg1-16/igt@gem_mmap_gtt@close-race.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
4077">i915#4077</a>) +6 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-mtlp-1/igt@gem_mmap_gtt@close-race.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
4077">i915#4077</a>) +4 other tests skip</li>
</ul></li>
<li>
<p>igt@gem_mmap_offset@clear@smem0:</p><ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18139/shard-mtlp-5/igt@gem_mmap_offset@clear@smem0.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-=
mtlp-5/igt@gem_mmap_offset@clear@smem0.html">INCOMPLETE</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15478">i915#15478</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5493">=
i915#5493</a>) +1 other test incomplete</li>
</ul></li>
<li>
<p>igt@gem_mmap_wc@write-cpu-read-wc:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-dg1-13/igt@gem_mmap_wc@write-cpu-read-wc.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/4083">i915#4083</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@gem_partial_pwrite_pread@reads-uncached:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-dg2-4/igt@gem_partial_pwrite_pread@reads-un=
cached.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/3282">i915#3282</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-dg1-19/igt@gem_partial_pwrite_pread@reads-u=
ncached.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/3282">i915#3282</a>) +2 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-mtlp-8/igt@gem_partial_pwrite_pread@reads-u=
ncached.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/3282">i915#3282</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-rkl-8/igt@gem_partial_pwrite_pread@writes-a=
fter-reads.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/3282">i915#3282</a>) +6 other tests skip</li>
</ul></li>
<li>
<p>igt@gem_pread@exhaustion:</p><ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-glk1/igt@gem_pread@exhaustion.html">WARN</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658"=
>i915#2658</a>)</li>
</ul></li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p><ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-glk9/igt@gem_pwrite@basic-exhaustion.html">=
WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/14702">i915#14702</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/2658">i915#2658</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-tglu-2/igt@gem_pwrite@basic-exhaustion.html=
">WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/2658">i915#2658</a>)</li>
</ul></li>
<li>
<p>igt@gem_pxp@hw-rejects-pxp-buffer:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-rkl-6/igt@gem_pxp@hw-rejects-pxp-buffer.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/13717">i915#13717</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul></li>
<li>
<p>igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-dg2-8/igt@gem_pxp@verify-pxp-key-change-aft=
er-suspend-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/4270">i915#4270</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-dg1-18/igt@gem_pxp@verify-pxp-key-change-af=
ter-suspend-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/4270">i915#4270</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@gem_render_copy@yf-tiled-to-vebox-linear:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-dg2-1/igt@gem_render_copy@yf-tiled-to-vebox=
-linear.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/5190">i915#5190</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/8428">i915#8428</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-mtlp-1/igt@gem_render_copy@yf-tiled-to-vebo=
x-linear.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/8428">i915#8428</a>)</li>
</ul></li>
<li>
<p>igt@gem_set_tiling_vs_gtt:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-dg1-16/igt@gem_set_tiling_vs_gtt.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/40=
79">i915#4079</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-mtlp-7/igt@gem_set_tiling_vs_gtt.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/40=
79">i915#4079</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-dg2-6/igt@gem_set_tiling_vs_gtt.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/407=
9">i915#4079</a>)</li>
</ul></li>
<li>
<p>igt@gem_softpin@noreloc-s3:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18139/shard-rkl-8/igt@gem_softpin@noreloc-s3.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-3/=
igt@gem_softpin@noreloc-s3.html">INCOMPLETE</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/13809">i915#13809</a>)</li>
</ul></li>
<li>
<p>igt@gem_tiled_partial_pwrite_pread@writes-after-reads:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-dg2-6/igt@gem_tiled_partial_pwrite_pread@wr=
ites-after-reads.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/4077">i915#4077</a>) +4 other tests skip</li>
</ul></li>
<li>
<p>igt@gem_userptr_blits@access-control:</p><ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-mtlp-7/igt@gem_userptr_blits@access-control=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/3297">i915#3297</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@gem_userptr_blits@coherency-sync:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-rkl-7/igt@gem_userptr_blits@coherency-sync.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/3297">i915#3297</a>) +2 other tests skip</li>
</ul></li>
<li>
<p>igt@gem_userptr_blits@invalid-mmap-offset-unsync:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-tglu-1/igt@gem_userptr_blits@invalid-mmap-o=
ffset-unsync.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul></li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate-overlap:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-dg2-6/igt@gem_userptr_blits@map-fixed-inval=
idate-overlap.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/3297">i915#3297</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/4880">i915#4880</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-dg1-16/igt@gem_userptr_blits@map-fixed-inva=
lidate-overlap.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/3297">i915#3297</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/4880">i915#4880</a>)</li>
</ul></li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-after-close:</p><ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-glk11/igt@gem_userptr_blits@unsync-unmap-af=
ter-close.html">SKIP</a> +71 other tests skip</li>
</ul></li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-cycles:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-dg2-1/igt@gem_userptr_blits@unsync-unmap-cy=
cles.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/3297">i915#3297</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-dg1-16/igt@gem_userptr_blits@unsync-unmap-c=
ycles.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3297">i915#3297</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-tglu-2/igt@gem_userptr_blits@unsync-unmap-c=
ycles.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3297">i915#3297</a>) +2 other tests skip</li>
</ul></li>
<li>
<p>igt@gem_workarounds@suspend-resume:</p><ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-glk10/igt@gem_workarounds@suspend-resume.ht=
ml">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/13356">i915#13356</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/14586">i915#14586</a>)</li>
</ul></li>
<li>
<p>igt@gem_workarounds@suspend-resume-context:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18139/shard-rkl-7/igt@gem_workarounds@suspend-resume-context.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14=
752/shard-rkl-6/igt@gem_workarounds@suspend-resume-context.html">INCOMPLETE=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13=
356">i915#13356</a>)</li>
</ul></li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p><ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18139/shard-glk1/igt@gen9_exec_parse@allowed-single.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard=
-glk1/igt@gen9_exec_parse@allowed-single.html">ABORT</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/5566">i915#5566</a>)</li>
</ul></li>
<li>
<p>igt@gen9_exec_parse@bb-start-cmd:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-dg1-18/igt@gen9_exec_parse@bb-start-cmd.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/2527">i915#2527</a>) +2 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-tglu-10/igt@gen9_exec_parse@bb-start-cmd.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/2527">i915#2527</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/2856">i915#2856</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-mtlp-6/igt@gen9_exec_parse@bb-start-cmd.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/2856">i915#2856</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-dg2-8/igt@gen9_exec_parse@bb-start-cmd.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/2856">i915#2856</a>)</li>
</ul></li>
<li>
<p>igt@gen9_exec_parse@shadow-peek:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-rkl-4/igt@gen9_exec_parse@shadow-peek.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/2527">i915#2527</a>) +4 other tests skip</li>
</ul></li>
<li>
<p>igt@gen9_exec_parse@valid-registers:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-rkl-6/igt@gen9_exec_parse@valid-registers.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/2527">i915#2527</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@i915_drm_fdinfo@busy-check-all:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-dg1-17/igt@i915_drm_fdinfo@busy-check-all.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/11527">i915#11527</a>) +5 other tests skip</li>
</ul></li>
<li>
<p>igt@i915_drm_fdinfo@busy-check-all@ccs0:</p><ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-mtlp-4/igt@i915_drm_fdinfo@busy-check-all@c=
cs0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/11527">i915#11527</a>) +6 other tests skip</li>
</ul></li>
<li>
<p>igt@i915_drm_fdinfo@busy-check-all@vecs0:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-dg2-4/igt@i915_drm_fdinfo@busy-check-all@ve=
cs0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/11527">i915#11527</a>) +7 other tests skip</li>
</ul></li>
<li>
<p>igt@i915_module_load@fault-injection@__uc_init:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-tglu-1/igt@i915_module_load@fault-injection=
@__uc_init.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/15479">i915#15479</a>) +4 other tests skip</li>
</ul></li>
<li>
<p>igt@i915_module_load@fault-injection@intel_connector_register:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-tglu-1/igt@i915_module_load@fault-injection=
@intel_connector_register.html">ABORT</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/15342">i915#15342</a>) +1 other test abo=
rt</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-glk5/igt@i915_module_load@fault-injection@i=
ntel_connector_register.html">ABORT</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/15342">i915#15342</a>) +1 other test abort=
</li>
</ul></li>
<li>
<p>igt@i915_module_load@load:</p><ul>
<li>shard-glk:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_18139/shard-glk2/igt@i915_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-glk5/igt@i9=
15_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/CI_DRM_18139/shard-glk1/igt@i915_module_load@load.html">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-=
glk4/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-glk1/igt@i915_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_1=
8139/shard-glk2/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-glk1/igt@i915_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/CI_DRM_18139/shard-glk2/igt@i915_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-glk6/igt@i=
915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/CI_DRM_18139/shard-glk5/igt@i915_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard=
-glk4/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-glk3/igt@i915_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_=
18139/shard-glk3/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-glk3/igt@i915_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/CI_DRM_18139/shard-glk8/igt@i915_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shard-glk9/igt@=
i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/CI_DRM_18139/shard-glk9/igt@i915_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18139/shar=
d-glk9/igt@i915_module_load@load.html">PASS</a>) -&gt; (<a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-glk4/igt@i915_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_14752/shard-glk4/igt@i915_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-glk9/igt@i915_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_14752/shard-glk1/igt@i915_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-glk9/i=
gt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_14752/shard-glk6/igt@i915_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/sha=
rd-glk8/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-glk3/igt@i915_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
14752/shard-glk5/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-glk2/igt@i915_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_14752/shard-glk8/igt@i915_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-glk6/igt@i91=
5_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_14752/shard-glk5/igt@i915_module_load@load.html">DMESG-WA=
RN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/sha=
rd-glk1/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-glk5/igt@i915_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
14752/shard-glk4/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-glk9/igt@i915_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_14752/shard-glk2/igt@i915_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-glk1/igt@i91=
5_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_14752/shard-glk3/igt@i915_module_load@load.html">PASS</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/118">=
i915#118</a>)</li>
</ul></li>
<li>
<p>igt@i915_module_load@reload-no-display:</p><ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18139/shard-dg1-16/igt@i915_module_load@reload-no-display.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752=
/shard-dg1-19/igt@i915_module_load@reload-no-display.html">DMESG-WARN</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13029">i=
915#13029</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/14545">i915#14545</a>)</li>
</ul></li>
<li>
<p>igt@i915_module_load@resize-bar:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-tglu-3/igt@i915_module_load@resize-bar.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/6412">i915#6412</a>)</li>
</ul></li>
<li>
<p>igt@i915_pm_freq_api@freq-suspend:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-rkl-2/igt@i915_pm_freq_api@freq-suspend.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/8399">i915#8399</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@i915_pm_rps@min-max-config-idle:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-dg1-18/igt@i915_pm_rps@min-max-config-idle.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/11681">i915#11681</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/6621">i915#6621</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-mtlp-1/igt@i915_pm_rps@min-max-config-idle.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/11681">i915#11681</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/6621">i915#6621</a>)</li>
</ul></li>
<li>
<p>igt@i915_pm_rps@thresholds-idle:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-dg1-18/igt@i915_pm_rps@thresholds-idle.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/11681">i915#11681</a>)</li>
</ul></li>
<li>
<p>igt@i915_query@test-query-geometry-subslices:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-rkl-6/igt@i915_query@test-query-geometry-su=
bslices.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/5723">i915#5723</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-dg1-12/igt@i915_query@test-query-geometry-s=
ubslices.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/5723">i915#5723</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-tglu-3/igt@i915_query@test-query-geometry-s=
ubslices.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/5723">i915#5723</a>)</li>
</ul></li>
<li>
<p>igt@i915_suspend@fence-restore-tiled2untiled:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18139/shard-rkl-3/igt@i915_suspend@fence-restore-tiled2untiled.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
14752/shard-rkl-1/igt@i915_suspend@fence-restore-tiled2untiled.html">ABORT<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/151=
40">i915#15140</a>)</li>
</ul></li>
<li>
<p>igt@i915_suspend@forcewake:</p><ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-glk1/igt@i915_suspend@forcewake.html">INCOM=
PLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/4817">i915#4817</a>)</li>
</ul></li>
<li>
<p>igt@kms_addfb_basic@clobberred-modifier:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-dg1-12/igt@kms_addfb_basic@clobberred-modif=
ier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/4212">i915#4212</a>)</li>
</ul></li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:<=
/p><ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-glk9/igt@kms_atomic_transition@plane-all-mo=
deset-transition-internal-panels.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-tglu-10/igt@kms_atomic_transition@plane-all=
-modeset-transition-internal-panels.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555=
</a>)</li>
</ul></li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@p=
ipe-a-edp-1:</p><ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18139/shard-mtlp-2/igt@kms_atomic_transition@plane-all-modeset-tran=
sition-internal-panels@pipe-a-edp-1.html">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-mtlp-6/igt@kms_atomic_t=
ransition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html">F=
AIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/5956">i915#5956</a>) +1 other test fail</li>
</ul></li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-0:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-rkl-6/igt@kms_big_fb@4-tiled-32bpp-rotate-0=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/5286">i915#5286</a>)</li>
</ul></li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-tglu-1/igt@kms_big_fb@4-tiled-32bpp-rotate-=
90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/5286">i915#5286</a>)</li>
</ul></li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-180:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-rkl-2/igt@kms_big_fb@4-tiled-64bpp-rotate-1=
80.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/5286">i915#5286</a>) +7 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-tglu-4/igt@kms_big_fb@4-tiled-max-hw-stride=
-32bpp-rotate-0-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +4 other tests skip=
</li>
</ul></li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p><ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18139/shard-mtlp-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotat=
e-0-hflip.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_14752/shard-mtlp-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp=
-rotate-0-hflip.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/15733">i915#15733</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/5138">i915#5138</a>)</li>
</ul></li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p><ul=
>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-dg1-13/igt@kms_big_fb@4-tiled-max-hw-stride=
-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +4 =
other tests skip</li>
</ul></li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-tglu-3/igt@kms_big_fb@linear-max-hw-stride-=
32bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-rkl-8/igt@kms_big_fb@linear-max-hw-stride-3=
2bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/3828">i915#3828</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-tglu-1/igt@kms_big_fb@linear-max-hw-stride-=
64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/3828">i915#3828</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-dg1-13/igt@kms_big_fb@x-tiled-16bpp-rotate-=
270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3638">i915#3638</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-270:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-rkl-7/igt@kms_big_fb@y-tiled-8bpp-rotate-27=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3638">i915#3638</a>) +3 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-dg2-5/igt@kms_big_fb@y-tiled-addfb-size-off=
set-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/5190">i915#5190</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-mtlp-1/igt@kms_big_fb@y-tiled-addfb-size-of=
fset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/6187">i915#6187</a>)</li>
</ul></li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-dg2-4/igt@kms_big_fb@yf-tiled-64bpp-rotate-=
180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/4538">i915#4538</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/5190">i915#5190</a>) +2 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-rkl-6/igt@kms_big_fb@yf-tiled-64bpp-rotate-=
180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/14544">i915#14544</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-dg1-19/igt@kms_big_fb@yf-tiled-64bpp-rotate=
-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/4538">i915#4538</a>) +2 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-tglu-1/igt@kms_big_fb@yf-tiled-max-hw-strid=
e-32bpp-rotate-0.html">SKIP</a> +32 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:=
</p><ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-mtlp-6/igt@kms_big_fb@yf-tiled-max-hw-strid=
e-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> +6 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-dg1-18/igt@kms_ccs@bad-aux-stride-4-tiled-m=
tl-mc-ccs@pipe-a-hdmi-a-4.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +206 other tests ski=
p</li>
</ul></li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-3:</p><ul=
>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-dg2-8/igt@kms_ccs@bad-aux-stride-4-tiled-mt=
l-rc-ccs-cc@pipe-a-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +8=
0 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-1:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-rkl-8/igt@kms_ccs@bad-rotation-90-4-tiled-m=
tl-rc-ccs@pipe-a-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +73 other tests skip=
</li>
</ul></li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-tglu-9/igt@kms_ccs@bad-rotation-90-y-tiled-=
gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/6095">i915#6095</a>) +49 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-rkl-6/igt@kms_ccs@crc-primary-basic-4-tiled=
-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/14098">i915#14098</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>)=
 +3 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-2:</p>=
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-rkl-6/igt@kms_ccs@crc-primary-basic-4-tiled=
-dg2-rc-ccs-cc@pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>)=
 +3 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-3:=
</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-dg2-3/igt@kms_ccs@crc-primary-rotation-180-=
4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +24 other t=
ests skip</li>
</ul></li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-tglu-1/igt@kms_ccs@crc-primary-suspend-4-ti=
led-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/6095">i915#6095</a>) +44 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:</p><ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18139/shard-tglu-8/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc=
-ccs.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_14752/shard-tglu-4/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-r=
c-ccs.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/15652">i915#15652</a>) +1 other test abort</li>
</ul></li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-2:</p><ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-glk6/igt@kms_ccs@crc-primary-suspend-yf-til=
ed-ccs@pipe-a-hdmi-a-2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/15582">i915#15582</a>)</li>
</ul></li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-rkl-5/igt@kms_ccs@crc-sprite-planes-basic-4=
-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/12313">i915#12313</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-tglu-5/igt@kms_ccs@crc-sprite-planes-basic-=
4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
</ul></li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-hdmi-a-1:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-dg2-4/igt@kms_ccs@missing-ccs-buffer-y-tile=
d-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/10434">i915#10434</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#60=
95</a>) +2 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-a-edp-1:</p><ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-mtlp-5/igt@kms_ccs@missing-ccs-buffer-yf-ti=
led-ccs@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +29 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-2:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-rkl-3/igt@kms_ccs@random-ccs-data-4-tiled-d=
g2-mc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +50 =
other tests skip</li>
</ul></li>
<li>
<p>igt@kms_cdclk@mode-transition:</p><ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-glk8/igt@kms_cdclk@mode-transition.html">SK=
IP</a> +448 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-rkl-3/igt@kms_cdclk@mode-transition.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/3742">i915#3742</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-tglu-8/igt@kms_cdclk@mode-transition.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3742">i915#3742</a>)</li>
</ul></li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-dg1-17/igt@kms_cdclk@mode-transition-all-ou=
tputs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3742">i915#3742</a>)</li>
</ul></li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-fast:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-rkl-6/igt@kms_chamelium_frames@hdmi-crc-fas=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +1 other tes=
t skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-tglu-7/igt@kms_chamelium_frames@hdmi-crc-fa=
st.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/7828">i915#7828</a>) +7 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm-disable:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-tglu-1/igt@kms_chamelium_hpd@dp-hpd-storm-d=
isable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +5 other tests skip</li=
>
</ul></li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode:</p><ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-mtlp-4/igt@kms_chamelium_hpd@vga-hpd-enable=
-disable-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +3 other tests s=
kip</li>
</ul></li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-fast:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-rkl-4/igt@kms_chamelium_hpd@vga-hpd-fast.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/7828">i915#7828</a>) +10 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-dg1-12/igt@kms_chamelium_hpd@vga-hpd-fast.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/7828">i915#7828</a>) +5 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-dg2-10/igt@kms_chamelium_hpd@vga-hpd-with-e=
nabled-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +3 other tests ski=
p</li>
</ul></li>
<li>
<p>igt@kms_content_protection@atomic:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-tglu-2/igt@kms_content_protection@atomic.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/6944">i915#6944</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/7116">i915#7116</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/7118">i915#7118</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>)</li>
</ul></li>
<li>
<p>igt@kms_content_protection@atomic-hdcp14:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-rkl-5/igt@kms_content_protection@atomic-hdc=
p14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/6944">i915#6944</a>)</li>
</ul></li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-dg1-12/igt@kms_content_protection@dp-mst-li=
c-type-0-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/15330">i915#15330</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-tglu-4/igt@kms_content_protection@dp-mst-li=
c-type-0-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/15330">i915#15330</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-mtlp-6/igt@kms_content_protection@dp-mst-li=
c-type-0-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/15330">i915#15330</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-dg2-1/igt@kms_content_protection@dp-mst-lic=
-type-0-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/15330">i915#15330</a>)</li>
</ul></li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-suspend-resume:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-rkl-3/igt@kms_content_protection@dp-mst-typ=
e-0-suspend-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/15330">i915#15330</a>)</li>
</ul></li>
<li>
<p>igt@kms_content_protection@legacy:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-rkl-2/igt@kms_content_protection@legacy.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/6944">i915#6944</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/7118">i915#7118</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/9424">i915#9424</a>)</li>
</ul></li>
<li>
<p>igt@kms_content_protection@legacy-hdcp14:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-tglu-1/igt@kms_content_protection@legacy-hd=
cp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/6944">i915#6944</a>)</li>
</ul></li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x32:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-tglu-9/igt@kms_cursor_crc@cursor-onscreen-3=
2x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-tglu-1/igt@kms_cursor_crc@cursor-onscreen-5=
12x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/13049">i915#13049</a>)</li>
</ul></li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-rkl-7/igt@kms_cursor_crc@cursor-onscreen-51=
2x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/13049">i915#13049</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-64x21:</p><ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-mtlp-4/igt@kms_cursor_crc@cursor-onscreen-6=
4x21.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/8814">i915#8814</a>)</li>
</ul></li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-64x21@pipe-a-hdmi-a-1:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-tglu-8/igt@kms_cursor_crc@cursor-onscreen-6=
4x21@pipe-a-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +1 other test fail</li>
</ul></li>
<li>
<p>igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1:</p><ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18139/shard-tglu-6/igt@kms_cursor_crc@cursor-random-128x42@pipe-a-h=
dmi-a-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_14752/shard-tglu-2/igt@kms_cursor_crc@cursor-random-128x42@pipe=
-a-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/13566">i915#13566</a>) +5 other tests fail</li>
</ul></li>
<li>
<p>igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-2:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18139/shard-rkl-3/igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hd=
mi-a-2.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_14752/shard-rkl-4/igt@kms_cursor_crc@cursor-random-256x85@pipe-a=
-hdmi-a-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/13566">i915#13566</a>) +3 other tests fail</li>
</ul></li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-rkl-7/igt@kms_cursor_crc@cursor-rapid-movem=
ent-32x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/3555">i915#3555</a>) +2 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-max-size:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-tglu-1/igt@kms_cursor_crc@cursor-rapid-move=
ment-max-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul></li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-rkl-5/igt@kms_cursor_legacy@2x-flip-vs-curs=
or-legacy.html">SKIP</a> +14 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-mtlp-4/igt@kms_cursor_legacy@2x-flip-vs-cur=
sor-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/9809">i915#9809</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-rkl-4/igt@kms_cursor_legacy@basic-busy-flip=
-before-cursor-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</li>
</ul></li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-dg2-4/igt@kms_cursor_legacy@cursorb-vs-flip=
b-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/13046">i915#13046</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +1 other test skip</l=
i>
</ul></li>
<li>
<p>igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-rkl-2/igt@kms_cursor_legacy@modeset-atomic-=
cursor-hotspot.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/9067">i915#9067</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-tglu-9/igt@kms_cursor_legacy@modeset-atomic=
-cursor-hotspot.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/9067">i915#9067</a>)</li>
</ul></li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-dg1-19/igt@kms_dirtyfb@psr-dirtyfb-ioctl.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/9723">i915#9723</a>)</li>
</ul></li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-rkl-3/igt@kms_display_modes@extended-mode-b=
asic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/13691">i915#13691</a>)</li>
</ul></li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-rkl-5/igt@kms_dither@fb-8bpc-vs-panel-6bpc@=
pipe-a-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul></li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-dg2-1/igt@kms_dp_link_training@non-uhbr-mst=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/13749">i915#13749</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-rkl-7/igt@kms_dp_link_training@non-uhbr-mst=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/13749">i915#13749</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-dg1-16/igt@kms_dp_link_training@non-uhbr-ms=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/13749">i915#13749</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-tglu-2/igt@kms_dp_link_training@non-uhbr-ms=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/13749">i915#13749</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-mtlp-1/igt@kms_dp_link_training@non-uhbr-ms=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/13749">i915#13749</a>)</li>
</ul></li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-dg2-8/igt@kms_dp_linktrain_fallback@dp-fall=
back.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/13707">i915#13707</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-dg1-16/igt@kms_dp_linktrain_fallback@dp-fal=
lback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/13707">i915#13707</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-tglu-8/igt@kms_dp_linktrain_fallback@dp-fal=
lback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/13707">i915#13707</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-mtlp-4/igt@kms_dp_linktrain_fallback@dp-fal=
lback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/13707">i915#13707</a>)</li>
</ul></li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-tglu-4/igt@kms_dsc@dsc-with-formats.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/3840">i915#3840</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-mtlp-3/igt@kms_dsc@dsc-with-formats.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/3840">i915#3840</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-dg2-3/igt@kms_dsc@dsc-with-formats.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3840">i915#3840</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-rkl-2/igt@kms_dsc@dsc-with-formats.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3840">i915#3840</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-dg1-12/igt@kms_dsc@dsc-with-formats.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/3840">i915#3840</a>)</li>
</ul></li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-rkl-6/igt@kms_dsc@dsc-with-output-formats.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>)</li>
</ul></li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-dg1-19/igt@kms_dsc@dsc-with-output-formats-=
with-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/3840">i915#3840</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/9053">i915#9053</a>)</li>
</ul></li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-tglu-9/igt@kms_flip@2x-flip-vs-absolute-wf_=
vblank.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/3637">i915#3637</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +4 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-mtlp-2/igt@kms_flip@2x-flip-vs-absolute-wf_=
vblank.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/3637">i915#3637</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +2 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-rkl-2/igt@kms_flip@2x-flip-vs-dpms.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
9934">i915#9934</a>) +6 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences-interruptible:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-dg2-4/igt@kms_flip@2x-flip-vs-fences-interr=
uptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/8381">i915#8381</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-dg1-14/igt@kms_flip@2x-flip-vs-fences-inter=
ruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/8381">i915#8381</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-mtlp-3/igt@kms_flip@2x-flip-vs-fences-inter=
ruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/8381">i915#8381</a>)</li>
</ul></li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-vs-hang:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-dg2-5/igt@kms_flip@2x-flip-vs-panning-vs-ha=
ng.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/9934">i915#9934</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-dg1-14/igt@kms_flip@2x-flip-vs-panning-vs-h=
ang.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/9934">i915#9934</a>) +3 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-tglu-1/igt@kms_flip@2x-wf_vblank-ts-check.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/3637">i915#3637</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/9934">i915#9934</a>) +2 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3:</p><ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18139/shard-dg2-5/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_14752/shard-dg2-5/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13=
027">i915#13027</a>) +1 other test fail</li>
</ul></li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p><ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18139/shard-dg2-3/igt@kms_flip@flip-vs-suspend.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg2-=
10/igt@kms_flip@flip-vs-suspend.html">ABORT</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15132">i915#15132</a>)</li>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18139/shard-rkl-5/igt@kms_flip@flip-vs-suspend.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-=
6/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/6113">i915#6113</a>)</li>
</ul></li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-hdmi-a2:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-rkl-6/igt@kms_flip@flip-vs-suspend@a-hdmi-a=
2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/6113">i915#6113</a>)</li>
</ul></li>
<li>
<p>igt@kms_flip@flip-vs-suspend@d-dp3:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-dg2-10/igt@kms_flip@flip-vs-suspend@d-dp3.h=
tml">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/15132">i915#15132</a>)</li>
</ul></li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:<=
/p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-tglu-9/igt@kms_flip_scaled_crc@flip-32bpp-y=
ftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +2 other =
tests skip</li>
</ul></li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:<=
/p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-dg1-12/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-32bpp-ytileccs-downscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +1 other =
test skip</li>
</ul></li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:</p>=
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +2 other tes=
ts skip</li>
</ul></li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-rkl-2/igt@kms_flip_scaled_crc@flip-64bpp-4t=
ile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +4 ot=
her tests skip</li>
</ul></li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4=
tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>)</li>
</ul></li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling:</p><u=
l>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-dg2-5/igt@kms_flip_scaled_crc@flip-64bpp-yt=
ile-to-32bpp-ytile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +=
1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-cpu:</p=
><ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18139/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-=
shrfb-draw-mmap-cpu.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_14752/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-=
1p-primscrn-pri-shrfb-draw-mmap-cpu.html">FAIL</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/15389">i915#15389</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6880">i915#6880=
</a>)</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:</p>=
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-2p-p=
rimscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +6 other tests =
skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render:</p><=
ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-p=
rimscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) =
+1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render:</p><=
ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-dg2-4/igt@kms_frontbuffer_tracking@fbc-2p-p=
rimscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +7 other tests s=
kip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-pwrite:</p><=
ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-dg1-16/igt@kms_frontbuffer_tracking@fbc-2p-=
scndscrn-pri-indfb-draw-pwrite.html">SKIP</a> +16 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p><ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-glk8/igt@kms_frontbuffer_tracking@fbc-suspe=
nd.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/10056">i915#10056</a>)</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt:</p>=
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-1=
p-offscreen-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +2 other test=
s skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-dg1-16/igt@kms_frontbuffer_tracking@fbcpsr-=
1p-offscreen-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>)</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-gtt=
:</p><ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-mtlp-6/igt@kms_frontbuffer_tracking@fbcpsr-=
1p-offscreen-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/15104">i915#15104</a>) +1 othe=
r test skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsr-1=
p-offscreen-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/15104">i915#15104</a>) +1 other=
 test skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc:<=
/p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-dg1-12/igt@kms_frontbuffer_tracking@fbcpsr-=
1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +9 other te=
sts skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render:</=
p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsr-1=
p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a=
>) +8 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-shrfb-fliptrack-mmap-gtt:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1=
p-shrfb-fliptrack-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i9=
15#3023</a>) +2 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc:<=
/p><ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-mtlp-4/igt@kms_frontbuffer_tracking@fbcpsr-=
2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +10 other t=
ests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-pwrite:</=
p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-tglu-4/igt@kms_frontbuffer_tracking@fbcpsr-=
2p-scndscrn-pri-shrfb-draw-pwrite.html">SKIP</a> +48 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-2=
p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +41 other tests ski=
p</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-gtt:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-tglu-10/igt@kms_frontbuffer_tracking@fbcpsr=
-rgb101010-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +24 other tests ski=
p</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-r=
gb101010-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) +26 othe=
r tests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-=
rgb101010-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +8 other tests skip</l=
i>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-dg1-14/igt@kms_frontbuffer_tracking@fbcpsr-=
rgb101010-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) +11 othe=
r tests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-t=
iling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/5439">i915#5439</a>)</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-tglu-1/igt@kms_frontbuffer_tracking@pipe-fb=
c-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/9766">i915#9766</a>)</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-gtt:</=
p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-dg1-12/igt@kms_frontbuffer_tracking@psr-1p-=
offscreen-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15104">i915#15104</a>) +2 other t=
ests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-gtt:</p=
><ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-mtlp-4/igt@kms_frontbuffer_tracking@psr-2p-=
primscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +2 other test=
s skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-slowdraw:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-slow=
draw.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/10433">i915#10433</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>)</li>
</ul></li>
<li>
<p>igt@kms_hdr@bpc-switch:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18139/shard-rkl-6/igt@kms_hdr@bpc-switch.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-7/igt@=
kms_hdr@bpc-switch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul></li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-tglu-5/igt@kms_hdr@bpc-switch-suspend.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/8228">i915#8228</a>) +1 other test skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-dg2-4/igt@kms_hdr@bpc-switch-suspend.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/8228">i915#8228</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-dg1-17/igt@kms_hdr@bpc-switch-suspend.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/8228">i915#8228</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-tglu-1/igt@kms_hdr@invalid-metadata-sizes.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul></li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-rkl-8/igt@kms_hdr@static-toggle-dpms.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/8228">i915#8228</a>) +2 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-tglu-1/igt@kms_joiner@basic-ultra-joiner.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/15458">i915#15458</a>)</li>
</ul></li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-tglu-6/igt@kms_joiner@invalid-modeset-big-j=
oiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/15460">i915#15460</a>)</li>
</ul></li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-rkl-1/igt@kms_panel_fitting@atomic-fastset.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/6301">i915#6301</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-tglu-1/igt@kms_panel_fitting@atomic-fastset=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/6301">i915#6301</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-dg1-19/igt@kms_panel_fitting@atomic-fastset=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/6301">i915#6301</a>)</li>
</ul></li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-rkl-8/igt@kms_plane@pixel-format-4-tiled-mt=
l-mc-ccs-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/15709">i915#15709</a>) +4 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-dg1-16/igt@kms_plane@pixel-format-y-tiled-g=
en12-mc-ccs-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/15709">i915#15709</a>)</li>
</ul></li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping=
:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-tglu-1/igt@kms_plane@pixel-format-y-tiled-g=
en12-mc-ccs-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>)</li>
</ul></li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane=
-7:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-tglu-1/igt@kms_plane@pixel-format-y-tiled-g=
en12-rc-ccs-cc-modifier@pipe-b-plane-7.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/15608">i915#15608</a>) +3 ot=
her tests skip</li>
</ul></li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping=
:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-dg2-7/igt@kms_plane@pixel-format-y-tiled-ge=
n12-rc-ccs-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-mtlp-1/igt@kms_plane@pixel-format-y-tiled-g=
en12-rc-ccs-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>)</li>
</ul></li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier@pipe-b-plane-5:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-rkl-2/igt@kms_plane@pixel-format-y-tiled-mo=
difier@pipe-b-plane-5.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/15608">i915#15608</a>) +1 other test skip</li=
>
</ul></li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-tglu-10/igt@kms_plane@pixel-format-yf-tiled=
-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +2 other tests ski=
p</li>
</ul></li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-basic:</p><ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-glk1/igt@kms_plane_alpha_blend@alpha-basic.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/12178">i915#12178</a>)</li>
</ul></li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-basic@pipe-a-hdmi-a-1:</p><ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-glk1/igt@kms_plane_alpha_blend@alpha-basic@=
pipe-a-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/7862">i915#7862</a>) +1 other test fail</li>
</ul></li>
<li>
<p>igt@kms_plane_lowres@tiling-x:</p><ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-mtlp-5/igt@kms_plane_lowres@tiling-x.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/11614">i915#11614</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/3582">i915#3582</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_plane_lowres@tiling-x@pipe-c-edp-1:</p><ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-mtlp-5/igt@kms_plane_lowres@tiling-x@pipe-c=
-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/10226">i915#10226</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/11614">i915#11614</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/3582">i915#3582</a>) +2 othe=
r tests skip</li>
</ul></li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-rkl-2/igt@kms_plane_multiple@2x-tiling-4.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/13958">i915#13958</a>)</li>
</ul></li>
<li>
<p>igt@kms_plane_multiple@tiling-4:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-rkl-8/igt@kms_plane_multiple@tiling-4.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/14259">i915#14259</a>)</li>
</ul></li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-tglu-1/igt@kms_plane_multiple@tiling-yf.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/14259">i915#14259</a>)</li>
</ul></li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-rkl-7/igt@kms_plane_scaling@plane-upscale-2=
0x20-with-rotation@pipe-a.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +7 other tests ski=
p</li>
</ul></li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:</p><ul=
>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-mtlp-4/igt@kms_plane_scaling@planes-upscale=
-20x20-downscale-factor-0-75.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a>)</=
li>
</ul></li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-d:=
</p><ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-mtlp-4/igt@kms_plane_scaling@planes-upscale=
-20x20-downscale-factor-0-75@pipe-d.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +3 other=
 tests skip</li>
</ul></li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-rkl-8/igt@kms_pm_backlight@bad-brightness.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/5354">i915#5354</a>)</li>
</ul></li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-rkl-7/igt@kms_pm_backlight@brightness-with-=
dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/12343">i915#12343</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-dg1-16/igt@kms_pm_backlight@brightness-with=
-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/12343">i915#12343</a>)</li>
</ul></li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-tglu-1/igt@kms_pm_dc@dc9-dpms.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15739=
">i915#15739</a>)</li>
</ul></li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18139/shard-rkl-5/igt@kms_pm_rpm@dpms-lpsp.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-7/ig=
t@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) +3 other tests skip</=
li>
</ul></li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p><ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18139/shard-dg2-4/igt@kms_pm_rpm@modeset-lpsp-stress.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shar=
d-dg2-1/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</=
li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-rkl-7/igt@kms_pm_rpm@modeset-lpsp-stress.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/15073">i915#15073</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p><ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18139/shard-dg1-14/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1=
4752/shard-dg1-13/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073"=
>i915#15073</a>)</li>
</ul></li>
<li>
<p>igt@kms_pm_rpm@pc8-residency:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-dg2-3/igt@kms_pm_rpm@pc8-residency.html">SK=
IP</a> +2 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_prime@basic-crc-hybrid:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-rkl-7/igt@kms_prime@basic-crc-hybrid.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/6524">i915#6524</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-tglu-7/igt@kms_prime@basic-crc-hybrid.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/6524">i915#6524</a>)</li>
</ul></li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf:</p>=
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-dg2-1/igt@kms_psr2_sf@fbc-pr-cursor-plane-m=
ove-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +2 other test=
s skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-snb4/igt@kms_psr2_sf@fbc-pr-cursor-plane-mo=
ve-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +2 other tests=
 skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-dg1-12/igt@kms_psr2_sf@fbc-pr-cursor-plane-=
move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +3 other tes=
ts skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-mtlp-6/igt@kms_psr2_sf@fbc-pr-cursor-plane-=
move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/12316">i915#12316</a>)</li>
</ul></li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-rkl-6/igt@kms_psr2_sf@fbc-pr-overlay-plane-=
update-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul></li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:</p><ul=
>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-tglu-1/igt@kms_psr2_sf@fbc-psr2-overlay-pla=
ne-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +3 other tests =
skip</li>
</ul></li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:</p><ul=
>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-glk10/igt@kms_psr2_sf@pr-overlay-plane-move=
-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +2 other tests s=
kip</li>
</ul></li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:</p><ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-glk11/igt@kms_psr2_sf@pr-overlay-plane-upda=
te-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/11520">i915#11520</a>)</li>
</ul></li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-tglu-2/igt@kms_psr2_sf@psr2-overlay-plane-u=
pdate-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/11520">i915#11520</a>) +7 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:</p><ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-glk2/igt@kms_psr2_sf@psr2-overlay-primary-u=
pdate-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/11520">i915#11520</a>) +15 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-rkl-7/igt@kms_psr2_sf@psr2-overlay-primary-=
update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/11520">i915#11520</a>) +8 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_psr@fbc-pr-primary-render:</p><ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-glk10/igt@kms_psr@fbc-pr-primary-render.htm=
l">SKIP</a> +125 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_psr@fbc-psr-cursor-plane-move:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-dg2-3/igt@kms_psr@fbc-psr-cursor-plane-move=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/9732">i915#9732</a>) +7 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-dg1-18/igt@kms_psr@fbc-psr-cursor-plane-mov=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/9732">i915#9732</a>) +10 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_psr@fbc-psr-cursor-plane-move@edp-1:</p><ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-mtlp-5/igt@kms_psr@fbc-psr-cursor-plane-mov=
e@edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/9688">i915#9688</a>) +9 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-render:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-rkl-7/igt@kms_psr@fbc-psr2-sprite-render.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/9732">i915#9732</a>) +21 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_psr@pr-cursor-blt:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-rkl-6/igt@kms_psr@pr-cursor-blt.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/107=
2">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/9732">i915#9732</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_psr@pr-cursor-plane-onoff:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-tglu-7/igt@kms_psr@pr-cursor-plane-onoff.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/9732">i915#9732</a>) +17 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_psr@psr2-cursor-blt:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-tglu-1/igt@kms_psr@psr2-cursor-blt.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
9732">i915#9732</a>) +11 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-tglu-7/igt@kms_psr_stress_test@flip-primary=
-invalidate-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/9685">i915#9685</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:</p><ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-glk9/igt@kms_rotation_crc@multiplane-rotati=
on-cropping-bottom.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/15500">i915#15500</a>)</li>
</ul></li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation-cropping-top:</p><ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-glk5/igt@kms_rotation_crc@multiplane-rotati=
on-cropping-top.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/15492">i915#15492</a>)</li>
</ul></li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-rkl-2/igt@kms_rotation_crc@primary-4-tiled-=
reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/5289">i915#5289</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-dg1-14/igt@kms_rotation_crc@primary-4-tiled=
-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul></li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-tglu-1/igt@kms_rotation_crc@primary-yf-tile=
d-reflect-x-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul></li>
<li>
<p>igt@kms_selftest@drm_framebuffer:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-tglu-1/igt@kms_selftest@drm_framebuffer.htm=
l">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/13179">i915#13179</a>) +1 other test abort</li>
</ul></li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-dg2-4/igt@kms_setmode@clone-exclusive-crtc.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/3555">i915#3555</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-mtlp-2/igt@kms_setmode@clone-exclusive-crtc=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/8809">i915#8809</a>)</li>
</ul></li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-rkl-2/igt@kms_tiled_display@basic-test-patt=
ern-with-chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/8623">i915#8623</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-tglu-1/igt@kms_tiled_display@basic-test-pat=
tern-with-chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/8623">i915#8623</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-dg1-14/igt@kms_tiled_display@basic-test-pat=
tern-with-chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/8623">i915#8623</a>)</li>
</ul></li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p><ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-glk10/igt@kms_vblank@ts-continuation-suspen=
d.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/12276">i915#12276</a>) +1 other test incomplete</li>
</ul></li>
<li>
<p>igt@kms_vrr@flip-basic:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-rkl-3/igt@kms_vrr@flip-basic.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243"=
>i915#15243</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3555">i915#3555</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-dg1-17/igt@kms_vrr@flip-basic.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555"=
>i915#3555</a>) +2 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_vrr@lobf:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-rkl-8/igt@kms_vrr@lobf.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920">i915#=
11920</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-dg1-18/igt@kms_vrr@lobf.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920">i915=
#11920</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-tglu-3/igt@kms_vrr@lobf.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920">i915=
#11920</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-mtlp-1/igt@kms_vrr@lobf.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920">i915=
#11920</a>)</li>
</ul></li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-tglu-1/igt@kms_vrr@seamless-rr-switch-vrr.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/9906">i915#9906</a>)</li>
</ul></li>
<li>
<p>igt@perf@mi-rpc:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-rkl-5/igt@perf@mi-rpc.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2434">i915#24=
34</a>)</li>
</ul></li>
<li>
<p>igt@perf@unprivileged-single-ctx-counters:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-rkl-5/igt@perf@unprivileged-single-ctx-coun=
ters.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/2433">i915#2433</a>)</li>
</ul></li>
<li>
<p>igt@perf_pmu@module-unload:</p><ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-glk9/igt@perf_pmu@module-unload.html">ABORT=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15=
778">i915#15778</a>)</li>
</ul></li>
<li>
<p>igt@perf_pmu@rc6-suspend:</p><ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-glk11/igt@perf_pmu@rc6-suspend.html">INCOMP=
LETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/13356">i915#13356</a>)</li>
</ul></li>
<li>
<p>igt@perf_pmu@rc6@other-idle-gt0:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-tglu-4/igt@perf_pmu@rc6@other-idle-gt0.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/8516">i915#8516</a>)</li>
</ul></li>
<li>
<p>igt@prime_mmap@test_aperture_limit:</p><ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-dg2-3/igt@prime_mmap@test_aperture_limit.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/14121">i915#14121</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-dg1-12/igt@prime_mmap@test_aperture_limit@t=
est_aperture_limit-smem.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/14121">i915#14121</a>) +1 other test skip</=
li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-mtlp-3/igt@prime_mmap@test_aperture_limit@t=
est_aperture_limit-smem.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/14121">i915#14121</a>) +1 other test skip</=
li>
</ul></li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-dg1-12/igt@prime_vgem@basic-fence-flip.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/3708">i915#3708</a>)</li>
</ul></li>
<li>
<p>igt@prime_vgem@basic-write:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-rkl-2/igt@prime_vgem@basic-write.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/32=
91">i915#3291</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3708">i915#3708</a>)</li>
</ul></li>
<li>
<p>igt@prime_vgem@fence-read-hang:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-rkl-3/igt@prime_vgem@fence-read-hang.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3708">i915#3708</a>)</li>
</ul></li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-rkl-4/igt@sriov_basic@enable-vfs-autoprobe-=
off.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/9917">i915#9917</a>)</li>
</ul></li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each:</p><ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-dg1-12/igt@sriov_basic@enable-vfs-bind-unbi=
nd-each.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/9917">i915#9917</a>)</li>
</ul></li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p><ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-tglu-1/igt@sriov_basic@enable-vfs-bind-unbi=
nd-each-numvfs-all.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/12910">i915#12910</a>)</li>
</ul></li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-random:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-tglu-3/igt@sriov_basic@enable-vfs-bind-unbi=
nd-each@numvfs-random.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/12910">i915#12910</a>) +18 other tests fail</=
li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-mtlp-8/igt@sriov_basic@enable-vfs-bind-unbi=
nd-each@numvfs-random.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/12910">i915#12910</a>) +8 other tests fail</l=
i>
</ul></li>
<li>
<p>igt@sysfs_timeslice_duration@idempotent@vcs0:</p><ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-snb7/igt@sysfs_timeslice_duration@idempoten=
t@vcs0.html">SKIP</a> +121 other tests skip</li>
</ul></li>
</ul><h4>Possible fixes</h4><ul>
<li>
<p>igt@gem_exec_big@single:</p><ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18139/shard-tglu-8/igt@gem_exec_big@single.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15816">i915#158=
16</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_147=
52/shard-tglu-10/igt@gem_exec_big@single.html">PASS</a></li>
</ul></li>
<li>
<p>igt@gem_lmem_swapping@smem-oom:</p><ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18139/shard-dg1-19/igt@gem_lmem_swapping@smem-oom.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15734">i9=
15#15734</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_14752/shard-dg1-16/igt@gem_lmem_swapping@smem-oom.html">PASS</a></li>
</ul></li>
<li>
<p>igt@gem_lmem_swapping@smem-oom@lmem0:</p><ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18139/shard-dg1-19/igt@gem_lmem_swapping@smem-oom@lmem0.html">CRASH=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/54=
93">i915#5493</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_14752/shard-dg1-16/igt@gem_lmem_swapping@smem-oom@lmem0.html">PASS<=
/a></li>
</ul></li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p><ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18139/shard-tglu-3/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1379=
0">i915#13790</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/2681">i915#2681</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_14752/shard-tglu-6/igt@i915_pm_rc6_residency@rc6-fenc=
e.html">PASS</a> +1 other test pass</li>
</ul></li>
<li>
<p>igt@i915_suspend@basic-s2idle-without-i915:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18139/shard-rkl-1/igt@i915_suspend@basic-s2idle-without-i915.html">=
ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/15131">i915#15131</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_14752/shard-rkl-2/igt@i915_suspend@basic-s2idle-without-i915=
.html">PASS</a></li>
</ul></li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p><ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18139/shard-dg1-14/igt@kms_async_flips@alternate-sync-async-flip.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/14888">i915#14888</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_14752/shard-dg1-17/igt@kms_async_flips@alternate-sync-asy=
nc-flip.html">PASS</a></li>
</ul></li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p><ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18139/shard-dg2-3/igt@kms_atomic_transition@plane-all-modeset-trans=
ition-fencing.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/5956">i915#5956</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg2-3/igt@kms_atomic_transition=
@plane-all-modeset-transition-fencing.html">PASS</a> +1 other test pass</li=
>
</ul></li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p><ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18139/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotat=
e-180-hflip.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/15733">i915#15733</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/5138">i915#5138</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-mtlp-7/igt@kms_bi=
g_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">PASS</a></li>
</ul></li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1:</p><ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18139/shard-glk8/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-=
a-hdmi-a-1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/15582">i915#15582</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-glk6/igt@kms_ccs@crc-prima=
ry-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1.html">PASS</a></li>
</ul></li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-lut1d:</p><ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18139/shard-dg1-16/igt@kms_color_pipeline@plane-lut1d-lut1d.html">D=
MESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/4423">i915#4423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_14752/shard-dg1-17/igt@kms_color_pipeline@plane-lut1d-lut1=
d.html">PASS</a> +2 other tests pass</li>
</ul></li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85:</p><ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18139/shard-tglu-4/igt@kms_cursor_crc@cursor-onscreen-256x85.html">=
FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/13566">i915#13566</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_14752/shard-tglu-5/igt@kms_cursor_crc@cursor-onscreen-256x85.=
html">PASS</a> +1 other test pass</li>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18139/shard-rkl-1/igt@kms_cursor_crc@cursor-onscreen-256x85.html">F=
AIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/13566">i915#13566</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_14752/shard-rkl-8/igt@kms_cursor_crc@cursor-onscreen-256x85.ht=
ml">PASS</a></li>
</ul></li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18139/shard-rkl-1/igt@kms_cursor_crc@cursor-suspend.html">ABORT</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15132"=
>i915#15132</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_14752/shard-rkl-7/igt@kms_cursor_crc@cursor-suspend.html">PASS</a> +1=
 other test pass</li>
</ul></li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p><ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18139/shard-dg1-12/igt@kms_fbcon_fbt@fbc-suspend.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4767">i915=
#4767</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
14752/shard-dg1-18/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a></li>
</ul></li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1:</p><ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18139/shard-snb6/igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1.ht=
ml">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/14033">i915#14033</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_14752/shard-snb1/igt@kms_flip@2x-flip-vs-suspend@ab-vg=
a1-hdmi-a1.html">PASS</a> +1 other test pass</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p><ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18139/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-tiling-4.html">F=
AIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/15389">i915#15389</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/6880">i915#6880</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_14752/shard-dg2-3/igt@kms_frontbuffer_tracking@f=
bc-tiling-4.html">PASS</a></li>
</ul></li>
<li>
<p>igt@kms_hdr@static-toggle:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18139/shard-rkl-2/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8=
228">i915#8228</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_14752/shard-rkl-6/igt@kms_hdr@static-toggle.html">PASS</a> +1 othe=
r test pass</li>
</ul></li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p><ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18139/shard-dg1-14/igt@kms_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915=
#15073</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_14752/shard-dg1-12/igt@kms_pm_rpm@dpms-non-lpsp.html">PASS</a></li>
</ul></li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p><ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18139/shard-dg2-7/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#1=
5073</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1=
4752/shard-dg2-4/igt@kms_pm_rpm@modeset-lpsp.html">PASS</a> +1 other test p=
ass</li>
</ul></li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18139/shard-rkl-5/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/15073">i915#15073</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_14752/shard-rkl-3/igt@kms_pm_rpm@modeset-non-lpsp-stress-=
no-wait.html">PASS</a> +1 other test pass</li>
</ul></li>
<li>
<p>igt@perf_pmu@busy-idle@vcs0:</p><ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18139/shard-dg2-4/igt@perf_pmu@busy-idle@vcs0.html">FAIL</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349">i915#43=
49</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_147=
52/shard-dg2-4/igt@perf_pmu@busy-idle@vcs0.html">PASS</a> +5 other tests pa=
ss</li>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18139/shard-dg1-12/igt@perf_pmu@busy-idle@vcs0.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349">i915#4=
349</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14=
752/shard-dg1-17/igt@perf_pmu@busy-idle@vcs0.html">PASS</a> +2 other tests =
pass</li>
</ul></li>
<li>
<p>igt@perf_pmu@busy-idle@vcs1:</p><ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18139/shard-mtlp-5/igt@perf_pmu@busy-idle@vcs1.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349">i915#4=
349</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14=
752/shard-mtlp-4/igt@perf_pmu@busy-idle@vcs1.html">PASS</a></li>
</ul></li>
</ul><h4>Warnings</h4><ul>
<li>
<p>igt@gem_exec_reloc@basic-gtt-cpu:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18139/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-cpu.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i=
915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/3281">i915#3281</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_14752/shard-rkl-2/igt@gem_exec_reloc@basic-gtt-cpu.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3281">i915#3281</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@gem_exec_reloc@basic-range-active:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18139/shard-rkl-3/igt@gem_exec_reloc@basic-range-active.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/328=
1">i915#3281</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_14752/shard-rkl-6/igt@gem_exec_reloc@basic-range-active.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1454=
4">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3281">i915#3281</a>) +2 other tests skip</li>
</ul></li>
<li>
<p>igt@gem_lmem_swapping@random:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18139/shard-rkl-6/igt@gem_lmem_swapping@random.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#=
14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/4613">i915#4613</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_14752/shard-rkl-7/igt@gem_lmem_swapping@random.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">=
i915#4613</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@gem_media_vme:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18139/shard-rkl-6/igt@gem_media_vme.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284">i9=
15#284</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_14752/shard-rkl-8/igt@gem_media_vme.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/284">i915#284</a>)</li>
</ul></li>
<li>
<p>igt@gem_set_tiling_vs_blt@tiled-to-tiled:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18139/shard-rkl-6/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/8411">i915#8411</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_14752/shard-rkl-2/igt@gem_set_tiling_vs_blt@tiled=
-to-tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/8411">i915#8411</a>)</li>
</ul></li>
<li>
<p>igt@gem_userptr_blits@coherency-unsync:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18139/shard-rkl-1/igt@gem_userptr_blits@coherency-unsync.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/32=
97">i915#3297</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_14752/shard-rkl-6/igt@gem_userptr_blits@coherency-unsync.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3297">i915#3297</a>)</li>
</ul></li>
<li>
<p>igt@gen9_exec_parse@bb-oversize:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18139/shard-rkl-6/igt@gen9_exec_parse@bb-oversize.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i9=
15#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/2527">i915#2527</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_14752/shard-rkl-3/igt@gen9_exec_parse@bb-oversize.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
2527">i915#2527</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@i915_module_load@resize-bar:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18139/shard-rkl-2/igt@i915_module_load@resize-bar.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6412">i91=
5#6412</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_14752/shard-rkl-6/igt@i915_module_load@resize-bar.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/6412">i915#6412</a>)</li>
</ul></li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18139/shard-rkl-3/igt@kms_atomic@plane-primary-overlay-mutable-zpos=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/9531">i915#9531</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_14752/shard-rkl-6/igt@kms_atomic@plane-primary-overlay-m=
utable-zpos.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/9531">i915#9531</a>)</li>
</ul></li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-180:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18139/shard-rkl-4/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/52=
86">i915#5286</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_14752/shard-rkl-6/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/5286">i915#5286</a>)</li>
</ul></li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18139/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate=
-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/5286">i915#5286</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-4/igt@kms_big_fb@4-t=
iled-max-hw-stride-64bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +1 other t=
est skip</li>
</ul></li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-90:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18139/shard-rkl-8/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/36=
38">i915#3638</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_14752/shard-rkl-6/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3638">i915#3638</a>) +2 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18139/shard-rkl-6/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_14752/shard-rkl-5/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html=
">SKIP</a> +10 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18139/shard-rkl-7/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl=
-6/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +1 other te=
st skip</li>
</ul></li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-b-hdmi-a-2:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18139/shard-rkl-6/igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-b-=
hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-3/igt@kms_ccs@cr=
c-primary-basic-y-tiled-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +6=
 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18139/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/14098">i915#14098</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-3/igt@kms_ccs=
@crc-primary-suspend-yf-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095=
</a>) +9 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-a-hdmi-a-2:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18139/shard-rkl-7/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-a-h=
dmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_14752/shard-rkl-6/igt@kms_ccs@random-ccs-data-yf-=
tiled-ccs@pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +1 o=
ther test skip</li>
</ul></li>
<li>
<p>igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-c-hdmi-a-2:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18139/shard-rkl-7/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-c-h=
dmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/14098">i915#14098</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-6/igt@kms_ccs@ran=
dom-ccs-data-yf-tiled-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i9=
15#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/6095">i915#6095</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18139/shard-rkl-6/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-7/igt@km=
s_chamelium_hpd@dp-hpd-enable-disable-mode.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i9=
15#7828</a>) +2 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_content_protection@mei-interface:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18139/shard-rkl-6/igt@kms_content_protection@mei-interface.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/6944">i915#6944</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/9424">i915#9424</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-4/igt@kms_content_p=
rotection@mei-interface.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/6944">i915#6944</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>)</li>
</ul></li>
<li>
<p>igt@kms_content_protection@type1:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18139/shard-rkl-6/igt@kms_content_protection@type1.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i=
915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/6944">i915#6944</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/7118">i915#7118</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-7/igt@kms_con=
tent_protection@type1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/6944">i915#6944</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/7118">i915#7118</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424=
</a>)</li>
</ul></li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-max-size:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18139/shard-rkl-6/igt@kms_cursor_crc@cursor-offscreen-max-size.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-3/igt@kms_cursor_crc@cursor-o=
ffscreen-max-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul></li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18139/shard-rkl-6/igt@kms_cursor_crc@cursor-sliding-512x512.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/13049">i915#13049</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-7/igt@kms_cursor_crc@cursor-sl=
iding-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/13049">i915#13049</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_dp_aux_dev:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18139/shard-rkl-6/igt@kms_dp_aux_dev.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257">i915#1257</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i=
915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_14752/shard-rkl-5/igt@kms_dp_aux_dev.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257">i915#1257</a>)</li>
</ul></li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18139/shard-rkl-4/igt@kms_dp_link_training@non-uhbr-sst.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/137=
49">i915#13749</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_14752/shard-rkl-6/igt@kms_dp_link_training@non-uhbr-sst.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13=
749">i915#13749</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/14544">i915#14544</a>)</li>
</ul></li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18139/shard-rkl-6/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/3840">i915#3840</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_14752/shard-rkl-7/igt@kms_dsc@dsc-with-bpc.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/3840">i915#3840</a>)</li>
</ul></li>
<li>
<p>igt@kms_feature_discovery@psr1:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18139/shard-rkl-6/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i91=
5#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/658">i915#658</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_14752/shard-rkl-8/igt@kms_feature_discovery@psr1.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658"=
>i915#658</a>)</li>
</ul></li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18139/shard-rkl-6/igt@kms_flip@2x-blocking-wf_vblank.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"=
>i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/9934">i915#9934</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-rkl-2/igt@kms_flip@2x-blocking-wf_vblank.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/9934">i915#9934</a>) +2 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18139/shard-rkl-8/igt@kms_flip@2x-modeset-vs-vblank-race.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/99=
34">i915#9934</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_14752/shard-rkl-6/igt@kms_flip@2x-modeset-vs-vblank-race.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/9934">i915#9934</a>)</li>
</ul></li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:</p>=
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18139/shard-rkl-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp=
-4tile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/15643">i915#15643</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-6/igt@kms_flip_scale=
d_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/15643">i915#15643</a>)</li>
</ul></li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:</p><u=
l>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18139/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp=
-4tile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-4/igt@=
kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643=
">i915#15643</a>)</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18139/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indf=
b-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-1/igt@kms_fr=
ontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825=
</a>) +9 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt:</p><ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18139/shard-dg1-12/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri=
-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/4423">i915#4423</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg1-19/igt@kms_frontbuffer_tr=
acking@fbc-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a></li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render:</p><=
ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18139/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-=
indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/1825">i915#1825</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-6/igt@kms_frontbuffer_t=
racking@fbc-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825"=
>i915#1825</a>) +7 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18139/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-tiling-4.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/5439">i915#5439</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-3/igt@kms_frontbuffer_tracking@f=
bc-tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/5439">i915#5439</a>)</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-pwrite:<=
/p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18139/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-=
pri-shrfb-draw-pwrite.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-6/igt@kms_frontbu=
ffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-pwrite.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915=
#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/15102">i915#15102</a>)</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18139/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-=
multidraw.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl=
-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102=
">i915#15102</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3023">i915#3023</a>) +5 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:</p><=
ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18139/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-s=
pr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/10433">i915#10433</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752=
/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw=
-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/15102">i915#15102</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/3458">i915#3458</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:</p><ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18139/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledp=
rimary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/15102">i915#15102</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg2-4/igt@kms_frontbuf=
fer_tracking@fbcpsr-indfb-scaledprimary.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433">i915#10433</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915=
#15102</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/3458">i915#3458</a>) +5 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-cpu:</=
p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18139/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri=
-shrfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-5/=
igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-cpu.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/15102">i915#15102</a>)</li>
</ul></li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render:</p><=
ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18139/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-=
shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-6/igt@k=
ms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544=
">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/15102">i915#15102</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/3023">i915#3023</a>) +2 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18139/shard-rkl-6/igt@kms_joiner@switch-modeset-ultra-joiner-big-jo=
iner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/15638">i915#15638</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/15722">i915#15722</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-2/=
igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15638">i915#1=
5638</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/15722">i915#15722</a>)</li>
</ul></li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-yftiled:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18139/shard-rkl-6/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/14712">i915#14712</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-8/igt@kms_pipe_stress@stress=
-xrgb8888-yftiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/14712">i915#14712</a>)</li>
</ul></li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clampin=
g:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18139/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-=
modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rk=
l-5/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clampi=
ng.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/15709">i915#15709</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18139/shard-rkl-8/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915=
#3555</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
14752/shard-rkl-6/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/35=
55">i915#3555</a>)</li>
</ul></li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18139/shard-rkl-6/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"=
>i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/9685">i915#9685</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-rkl-8/igt@kms_pm_dc@dc3co-vpb-simulation.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/9685">i915#9685</a>)</li>
</ul></li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p><ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18139/shard-tglu-3/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15752">i915#157=
52</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_147=
52/shard-tglu-6/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/15128">i915#15128</a>)</li>
</ul></li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18139/shard-rkl-8/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752=
/shard-rkl-4/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/9340">i915#9340</a>)</li>
</ul></li>
<li>
<p>igt@kms_prime@d3hot:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18139/shard-rkl-1/igt@kms_prime@d3hot.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915#6524</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard=
-rkl-6/igt@kms_prime@d3hot.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915#6524</a>)</li=
>
</ul></li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18139/shard-rkl-5/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-contin=
uous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/11520">i915#11520</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-6/igt@kms_psr2_sf@fbc-ps=
r2-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i9=
15#14544</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18139/shard-rkl-6/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-=
exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/11520">i915#11520</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-3/igt@kms_psr=
2_sf@pr-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</=
a>) +2 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-update-sf:</p><ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18139/shard-dg1-12/igt@kms_psr2_sf@psr2-cursor-plane-update-sf.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/11520">i915#11520</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/4423">i915#4423</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_14752/shard-dg1-13/igt@kms_psr2_sf@psr2-curso=
r-plane-update-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/11520">i915#11520</a>)</li>
</ul></li>
<li>
<p>igt@kms_psr@pr-cursor-plane-onoff:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18139/shard-rkl-2/igt@kms_psr@pr-cursor-plane-onoff.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i=
915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/9732">i915#9732</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_14752/shard-rkl-6/igt@kms_psr@pr-cursor-plane-onoff.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +3 other tests skip</l=
i>
</ul></li>
<li>
<p>igt@kms_psr@psr-no-drrs:</p><ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18139/shard-dg1-18/igt@kms_psr@psr-no-drrs.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9=
732">i915#9732</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_14752/shard-dg1-17/igt@kms_psr@psr-no-drrs.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4=
423">i915#4423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/9732">i915#9732</a>)</li>
</ul></li>
<li>
<p>igt@kms_psr@psr-sprite-plane-move:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18139/shard-rkl-6/igt@kms_psr@psr-sprite-plane-move.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i=
915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-5/igt@kms_psr@psr-sprite-p=
lane-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +8 other tests skip</l=
i>
</ul></li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18139/shard-rkl-5/igt@kms_rotation_crc@primary-4-tiled-reflect-x-18=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/5289">i915#5289</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/shard-rkl-6/igt@kms_rotation_crc@primary-4-tiled-=
reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul></li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18139/shard-rkl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/5289">i915#5289</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-7/igt@kms_rotation_crc@p=
rimary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul></li>
<li>
<p>igt@kms_vrr@flip-suspend:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18139/shard-rkl-6/igt@kms_vrr@flip-suspend.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/15243">i915#15243</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_14752/shard-rkl-2/igt@kms_vrr@flip-suspend.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/15243">i915#15243</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/3555">i915#3555</a>)</li>
</ul></li>
<li>
<p>igt@kms_vrr@max-min:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18139/shard-rkl-5/igt@kms_vrr@max-min.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/shard=
-rkl-6/igt@kms_vrr@max-min.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li=
>
</ul></li>
<li>
<p>igt@kms_vrr@negative-basic:</p><ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_18139/shard-rkl-2/igt@kms_vrr@negative-basic.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#355=
5</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
9906">i915#9906</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_14752/shard-rkl-6/igt@kms_vrr@negative-basic.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#=
14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/9906">i915#9906</a>)</li>
</ul></li>
</ul><h2>Build changes</h2><ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8799 -&gt; IGTPW_14752</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul><p>CI-20190529: 20190529<br> CI_DRM_18139: 3fb8dfc6a69ee530c365c36f13b=
b79ef7f35af1d @ git://anongit.freedesktop.org/gfx-ci/linux<br> IGTPW_14752:=
 14752<br> IGT_8799: 8799<br> piglit_4509: fdc5a4ca11124ab8413c7988896eec4c=
97336694 @ git://anongit.freedesktop.org/piglit</p></blockquote><div><br></=
div><div><span></span></div></body></html>

--=-txpjMCQ6JsHeqANLWc8W--
