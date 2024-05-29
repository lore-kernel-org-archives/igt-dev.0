Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A03C4C25B75
	for <igt-dev@archiver.kernel.org>; Wed, 29 May 2024 11:51:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7B5D1135C7;
	Wed, 29 May 2024 11:51:08 +0000 (UTC)
Received: from coelho.fi (paleale.coelho.fi [176.9.41.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BE681134AC;
 Wed, 29 May 2024 11:51:01 +0000 (UTC)
Received: from 91-156-7-239.elisa-laajakaista.fi ([91.156.7.239]
 helo=[192.168.100.137])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.97) (envelope-from <luca@coelho.fi>)
 id 1sCHpZ-00000001H31-1JNE; Wed, 29 May 2024 14:51:00 +0300
Message-ID: <3e27575f16e43956b4c05141a346435c7b56ce72.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: I915-ci-infra@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org, Luca Coelho <luciano.coelho@intel.com>
Date: Wed, 29 May 2024 14:50:56 +0300
In-Reply-To: <171698071962.2233681.5428261691700384954@8e613ede5ea5>
References: <20240528075855.463729-1-luciano.coelho@intel.com>
 <171698071962.2233681.5428261691700384954@8e613ede5ea5>
Content-Type: multipart/alternative; boundary="=-LBYVDlFmPGsDHFASTLG3"
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
Subject: Re: =?UTF-8?Q?=E2=9C=97?= Fi.CI.IGT: failure for check
 drmModeGetConnector() return value in some missing places (rev3)
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

--=-LBYVDlFmPGsDHFASTLG3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

All these new issues are false positives and not related to this
patchset.

Can you please re-report it?

--
Cheers,
Luca.


On Wed, 2024-05-29 at 11:05 +0000, Patchwork wrote:
> Patch Details
> Series:check drmModeGetConnector() return value in some missing
> places (rev3)
> URL:https://patchwork.freedesktop.org/series/133953/
> State:failure
> Details:
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/index.html
> CI Bug Log - changes from IGT_7873_full -> IGTPW_11201_fullSummaryFAILURE
> Serious unknown changes coming with IGTPW_11201_full absolutely need
> to be
> verified manually.
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_11201_full, please notify your bug team (I915-ci-
> infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives
> in CI.
> External URL: https://intel-gfx-ci.01.org/tree/drm-
> tip/IGTPW_11201/index.html
> Participating hosts (9 -> 9)No changes in participating hosts
> Possible new issuesHere are the unknown changes that may have been introd=
uced in
> IGTPW_11201_full:
> IGT changesPossible regressions * igt@gem_exec_gttfill@engines@vcs0:shard=
-mtlp: PASS -> INCOMPLETE
>  * igt@i915_selftest@live@gem_contexts:shard-dg1: PASS -> INCOMPLETE
>  * igt@kms_flip@blocking-absolute-wf_vblank@b-hdmi-a1:shard-dg2: NOTRUN
>    -> INCOMPLETE +1 other test incomplete
>  * igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a4:shard-dg1: PASS ->
>    FAIL
> Warnings * igt@kms_big_fb@y-tiled-8bpp-rotate-270:shard-tglu: SKIP ->
>    INCOMPLETE
> New testsNew tests have been introduced between IGT_7873_full and
> IGTPW_11201_full:
> New IGT tests (3) * igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ab-hdmi-a1=
-hdmi-
>    a2:Statuses : 1 pass(s)Exec time: [10.92] s
>  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ac-hdmi-a1-hdmi-
>    a2:Statuses : 1 pass(s)Exec time: [11.01] s
>  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank@bc-hdmi-a1-hdmi-
>    a2:Statuses : 1 pass(s)Exec time: [10.84] s
> Known issuesHere are the changes found in IGTPW_11201_full that come from=
 known
> issues:
> IGT changesIssues hit * igt@api_intel_bb@blit-reloc-purge-cache:shard-dg1=
: NOTRUN -> SKIP
>    ([i915#8411])shard-dg2: NOTRUN -> SKIP ([i915#8411])
>  * igt@api_intel_bb@crc32:shard-dg1: NOTRUN -> SKIP ([i915#6230])shard-
>    tglu: NOTRUN -> SKIP ([i915#6230])
>  * igt@api_intel_bb@object-reloc-keep-cache:shard-rkl: NOTRUN -> SKIP
>    ([i915#8411]) +2 other tests skipshard-mtlp: NOTRUN -> SKIP
>    ([i915#8411])
>  * igt@api_intel_bb@render-ccs:shard-dg2: NOTRUN -> FAIL (i915#10380)
>  * igt@debugfs_test@basic-hwmon:shard-tglu: NOTRUN -> SKIP
>    ([i915#9318])
>  * igt@device_reset@cold-reset-bound:shard-dg1: NOTRUN -> SKIP
>    (i915#11078)shard-tglu: NOTRUN -> SKIP (i915#11078)shard-dg2: NOTRUN
>    -> SKIP (i915#11078)
>  * igt@device_reset@unbind-cold-reset-rebind:shard-rkl: NOTRUN -> SKIP
>    (i915#11078) +1 other test skipshard-mtlp: NOTRUN -> SKIP
>    (i915#11078)
>  * igt@device_reset@unbind-reset-rebind:shard-dg1: NOTRUN -> ABORT
>    (i915#11164)
>  * igt@drm_fdinfo@all-busy-idle-check-all:shard-dg2: NOTRUN -> SKIP
>    ([i915#8414]) +1 other test skip
>  * igt@drm_fdinfo@busy-hang@bcs0:shard-dg1: NOTRUN -> SKIP
>    ([i915#8414]) +4 other tests skip
>  * igt@drm_fdinfo@virtual-busy-idle:shard-mtlp: NOTRUN -> SKIP
>    ([i915#8414])
>  * igt@drm_fdinfo@virtual-idle:shard-rkl: NOTRUN -> FAIL ([i915#7742])
>    +1 other test fail
>  * igt@gem_basic@multigpu-create-close:shard-rkl: NOTRUN -> SKIP
>    ([i915#7697]) +1 other test skip
>  * igt@gem_busy@semaphore:shard-mtlp: NOTRUN -> SKIP ([i915#3936])
>  * igt@gem_ccs@block-copy-compressed:shard-dg1: NOTRUN -> SKIP
>    ([i915#3555] / [i915#9323])
>  * igt@gem_ccs@block-multicopy-compressed:shard-rkl: NOTRUN -> SKIP
>    ([i915#9323])
>  * igt@gem_close_race@multigpu-basic-process:shard-tglu: NOTRUN -> SKIP
>    ([i915#7697])shard-dg2: NOTRUN -> SKIP ([i915#7697])
>  * igt@gem_compute@compute-square:shard-mtlp: NOTRUN -> SKIP
>    ([i915#9310])
>  * igt@gem_ctx_exec@basic-nohangcheck:shard-rkl: PASS -> FAIL
>    ([i915#6268])
>  * igt@gem_ctx_persistence@saturated-hostile-nopreempt@vcs0:shard-mtlp:
>    NOTRUN -> SKIP ([i915#5882]) +5 other tests skip
>  * igt@gem_ctx_sseu@engines:shard-dg2: NOTRUN -> SKIP (i915#280)
>  * igt@gem_ctx_sseu@mmap-args:shard-mtlp: NOTRUN -> SKIP (i915#280)
>  * igt@gem_eio@kms:shard-tglu: NOTRUN -> INCOMPLETE (i915#10513)shard-
>    dg2: NOTRUN -> INCOMPLETE (i915#10513 / i915#1982)shard-dg1: NOTRUN
>    -> INCOMPLETE (i915#10513)
>  * igt@gem_exec_balancer@bonded-pair:shard-dg2: NOTRUN -> SKIP
>    ([i915#4771])
>  * igt@gem_exec_balancer@bonded-sync:shard-mtlp: NOTRUN -> SKIP
>    ([i915#4771])
>  * igt@gem_exec_balancer@parallel-out-fence:shard-rkl: NOTRUN -> SKIP
>    ([i915#4525]) +2 other tests skip
>  * igt@gem_exec_capture@capture-invisible@lmem0:shard-dg1: NOTRUN ->
>    SKIP ([i915#6334]) +1 other test skip
>  * igt@gem_exec_capture@capture@vecs0-smem:shard-mtlp: NOTRUN -> FAIL
>    (i915#10386)
>  * igt@gem_exec_capture@many-4k-incremental:shard-dg1: NOTRUN -> FAIL
>    ([i915#9606])
>  * igt@gem_exec_fair@basic-none:shard-dg1: NOTRUN -> SKIP ([i915#3539]
>    / [i915#4852]) +5 other tests skip
>  * igt@gem_exec_fair@basic-none-rrul:shard-mtlp: NOTRUN -> SKIP
>    ([i915#4473] / [i915#4771]) +2 other tests skip
>  * igt@gem_exec_fair@basic-none-rrul@rcs0:shard-glk: NOTRUN -> FAIL
>    ([i915#2842]) +1 other test fail
>  * igt@gem_exec_fair@basic-none-share@rcs0:shard-tglu: PASS -> FAIL
>    ([i915#2842])
>  * igt@gem_exec_fair@basic-none@bcs0:shard-rkl: NOTRUN -> FAIL
>    ([i915#2842]) +2 other tests fail
>  * igt@gem_exec_fair@basic-pace-solo@rcs0:shard-rkl: PASS -> FAIL
>    ([i915#2842])
>  * igt@gem_exec_fair@basic-pace@bcs0:shard-tglu: NOTRUN -> FAIL
>    ([i915#2842]) +4 other tests fail
>  * igt@gem_exec_fair@basic-sync:shard-dg2: NOTRUN -> SKIP ([i915#3539])
>    +1 other test skip
>  * igt@gem_exec_fence@submit:shard-dg1: NOTRUN -> SKIP ([i915#4812]) +3
>    other tests skip
>  * igt@gem_exec_fence@submit3:shard-dg2: NOTRUN -> SKIP ([i915#4812])
>    +2 other tests skip
>  * igt@gem_exec_fence@submit67:shard-mtlp: NOTRUN -> SKIP ([i915#4812])
>    +3 other tests skip
>  * igt@gem_exec_flush@basic-wb-ro-before-default:shard-dg2: NOTRUN ->
>    SKIP ([i915#3539] / [i915#4852]) +1 other test skip
>  * igt@gem_exec_reloc@basic-active:shard-dg2: NOTRUN -> SKIP
>    ([i915#3281]) +11 other tests skip
>  * igt@gem_exec_reloc@basic-scanout:shard-dg1: NOTRUN -> SKIP
>    ([i915#3281]) +8 other tests skip
>  * igt@gem_exec_reloc@basic-wc-read-noreloc:shard-rkl: NOTRUN -> SKIP
>    ([i915#3281]) +14 other tests skip
>  * igt@gem_exec_reloc@basic-write-wc-noreloc:shard-mtlp: NOTRUN -> SKIP
>    ([i915#3281]) +9 other tests skip
>  * igt@gem_exec_schedule@deep@rcs0:shard-mtlp: NOTRUN -> SKIP
>    ([i915#4537])
>  * igt@gem_exec_schedule@reorder-wide:shard-dg2: NOTRUN -> SKIP
>    ([i915#4537] / [i915#4812])
>  * igt@gem_exec_schedule@semaphore-power:shard-rkl: NOTRUN -> SKIP
>    ([i915#7276])
>  * igt@gem_fence_thrash@bo-copy:shard-dg1: NOTRUN -> SKIP ([i915#4860])
>    +2 other tests skip
>  * igt@gem_fence_thrash@bo-write-verify-x:shard-dg2: NOTRUN -> SKIP
>    ([i915#4860]) +1 other test skip
>  * igt@gem_fenced_exec_thrash@too-many-fences:shard-mtlp: NOTRUN ->
>    SKIP ([i915#4860]) +1 other test skip
>  * igt@gem_huc_copy@huc-copy:shard-rkl: NOTRUN -> SKIP
>    (i915#2190)shard-tglu: NOTRUN -> SKIP (i915#2190)
>  * igt@gem_lmem_swapping@heavy-verify-multi@lmem0:shard-dg1: PASS ->
>    FAIL (i915#10378)
>  * igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0:shard-dg2:
>    NOTRUN -> FAIL (i915#10378)
>  * igt@gem_lmem_swapping@parallel-random-verify:shard-rkl: NOTRUN ->
>    SKIP ([i915#4613]) +4 other tests skipshard-mtlp: NOTRUN -> SKIP
>    ([i915#4613]) +3 other tests skip
>  * igt@gem_lmem_swapping@verify-ccs:shard-glk: NOTRUN -> SKIP
>    ([i915#4613]) +4 other tests skip
>  * igt@gem_lmem_swapping@verify-ccs@lmem0:shard-dg1: NOTRUN -> SKIP
>    ([i915#4565]) +1 other test skip
>  * igt@gem_media_vme:shard-mtlp: NOTRUN -> SKIP (i915#284)
>  * igt@gem_mmap_gtt@cpuset-basic-small-copy-xy:shard-dg1: NOTRUN ->
>    SKIP ([i915#4077]) +13 other tests skip
>  * igt@gem_mmap_gtt@cpuset-big-copy-xy:shard-mtlp: NOTRUN -> SKIP
>    ([i915#4077]) +9 other tests skip
>  * igt@gem_mmap_gtt@fault-concurrent-x:shard-dg2: NOTRUN -> SKIP
>    ([i915#4077]) +19 other tests skip
>  * igt@gem_mmap_wc@bad-offset:shard-mtlp: NOTRUN -> SKIP ([i915#4083])
>    +3 other tests skip
>  * igt@gem_mmap_wc@invalid-flags:shard-dg2: NOTRUN -> SKIP
>    ([i915#4083]) +8 other tests skip
>  * igt@gem_mmap_wc@write-read:shard-dg1: NOTRUN -> SKIP ([i915#4083])
>    +5 other tests skip
>  * igt@gem_partial_pwrite_pread@writes-after-reads:shard-rkl: NOTRUN ->
>    SKIP ([i915#3282]) +4 other tests skip
>  * igt@gem_pread@exhaustion:shard-dg1: NOTRUN -> SKIP ([i915#3282]) +9
>    other tests skipshard-tglu: NOTRUN -> WARN (i915#2658)
>  * igt@gem_pread@snoop:shard-dg2: NOTRUN -> SKIP ([i915#3282]) +4 other
>    tests skip
>  * igt@gem_pxp@create-regular-context-2:shard-tglu: NOTRUN -> SKIP
>    ([i915#4270]) +1 other test skip
>  * igt@gem_pxp@display-protected-crc:shard-rkl: NOTRUN -> SKIP
>    ([i915#4270]) +4 other tests skip
>  * igt@gem_pxp@reject-modify-context-protection-off-1:shard-mtlp:
>    NOTRUN -> SKIP ([i915#4270]) +1 other test skip
>  * igt@gem_pxp@verify-pxp-execution-after-suspend-resume:shard-dg2:
>    NOTRUN -> SKIP ([i915#4270]) +3 other tests skip
>  * igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:shard-dg1:
>    NOTRUN -> SKIP ([i915#4270]) +2 other tests skip
>  * igt@gem_readwrite@read-bad-handle:shard-mtlp: NOTRUN -> SKIP
>    ([i915#3282]) +5 other tests skip
>  * igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs:shard-glk: NOTRUN
>    -> SKIP +272 other tests skip
>  * igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled:shard-mtlp:
>    NOTRUN -> SKIP ([i915#8428]) +3 other tests skip
>  * igt@gem_render_copy@y-tiled-to-vebox-y-tiled:shard-dg2: NOTRUN ->
>    SKIP ([i915#5190] / [i915#8428]) +6 other tests skip
>  * igt@gem_softpin@evict-snoop:shard-dg1: NOTRUN -> SKIP ([i915#4885])
>  * igt@gem_softpin@evict-snoop-interruptible:shard-mtlp: NOTRUN -> SKIP
>    ([i915#4885])
>  * igt@gem_tiled_pread_pwrite:shard-mtlp: NOTRUN -> SKIP ([i915#4079])
>    +2 other tests skip
>  * igt@gem_userptr_blits@coherency-sync:shard-tglu: NOTRUN -> SKIP
>    ([i915#3297])
>  * igt@gem_userptr_blits@create-destroy-unsync:shard-dg2: NOTRUN ->
>    SKIP ([i915#3297]) +2 other tests skipshard-dg1: NOTRUN -> SKIP
>    ([i915#3297]) +3 other tests skip
>  * igt@gem_userptr_blits@dmabuf-sync:shard-glk: NOTRUN -> SKIP
>    ([i915#3323])
>  * igt@gem_userptr_blits@map-fixed-invalidate:shard-dg1: NOTRUN -> SKIP
>    ([i915#3297] / [i915#4880])
>  * igt@gem_userptr_blits@relocations:shard-dg1: NOTRUN -> SKIP
>    ([i915#3281] / [i915#3297])
>  * igt@gem_userptr_blits@sd-probe:shard-dg1: NOTRUN -> SKIP
>    ([i915#3297] / [i915#4958])
>  * igt@gem_userptr_blits@unsync-overlap:shard-mtlp: NOTRUN -> SKIP
>    ([i915#3297]) +3 other tests skip
>  * igt@gem_userptr_blits@unsync-unmap-after-close:shard-rkl: NOTRUN ->
>    SKIP ([i915#3297]) +3 other tests skip
>  * igt@gen9_exec_parse@allowed-all:shard-mtlp: NOTRUN -> SKIP
>    ([i915#2856]) +4 other tests skip
>  * igt@gen9_exec_parse@bb-start-out:shard-rkl: NOTRUN -> SKIP
>    (i915#2527) +3 other tests skipshard-dg1: NOTRUN -> SKIP (i915#2527)
>    +4 other tests skipshard-tglu: NOTRUN -> SKIP (i915#2527 /
>    [i915#2856])
>  * igt@gen9_exec_parse@shadow-peek:shard-dg2: NOTRUN -> SKIP
>    ([i915#2856]) +2 other tests skip
>  * igt@i915_fb_tiling:shard-dg1: NOTRUN -> SKIP ([i915#4881])
>  * igt@i915_module_load@load:shard-glk: NOTRUN -> SKIP ([i915#6227])
>  * igt@i915_module_load@reload-with-fault-injection:shard-snb: PASS ->
>    INCOMPLETE ([i915#9849])shard-dg1: NOTRUN -> INCOMPLETE (i915#1982 /
>    [i915#9820] / [i915#9849])
>  * igt@i915_pipe_stress@stress-xrgb8888-ytiled:shard-dg2: NOTRUN ->
>    SKIP ([i915#7091])
>  * igt@i915_pm_freq_api@freq-suspend:shard-rkl: NOTRUN -> SKIP
>    ([i915#8399])shard-tglu: NOTRUN -> SKIP ([i915#8399])
>  * igt@i915_pm_freq_mult@media-freq@gt0:shard-dg1: NOTRUN -> SKIP
>    ([i915#6590])
>  * igt@i915_pm_rps@basic-api:shard-mtlp: NOTRUN -> SKIP ([i915#6621])
>    +1 other test skip
>  * igt@i915_pm_rps@min-max-config-loaded:shard-dg1: NOTRUN -> SKIP
>    ([i915#6621])
>  * igt@i915_pm_rps@thresholds-park@gt0:shard-dg1: NOTRUN -> SKIP
>    ([i915#8925])
>  * igt@i915_pm_rps@thresholds@gt0:shard-dg2: NOTRUN -> SKIP
>    ([i915#8925])
>  * igt@i915_power@sanity:shard-rkl: NOTRUN -> SKIP ([i915#7984])
>  * igt@i915_query@hwconfig_table:shard-dg1: NOTRUN -> SKIP
>    ([i915#6245])
>  * igt@i915_query@test-query-geometry-subslices:shard-rkl: NOTRUN ->
>    SKIP ([i915#5723])
>  * igt@i915_suspend@basic-s3-without-i915:shard-rkl: NOTRUN -> FAIL
>    (i915#10031)
>  * igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling:shard-dg2:
>    NOTRUN -> SKIP ([i915#4212])
>  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:shard-mtlp: NOTRUN
>    -> SKIP ([i915#5190])
>  * igt@kms_addfb_basic@bo-too-small-due-to-tiling:shard-mtlp: NOTRUN ->
>    SKIP ([i915#4212]) +1 other test skip
>  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:shard-rkl: NOTRUN ->
>    SKIP ([i915#3826])
>  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-
>    1-y-rc-ccs-cc:shard-rkl: NOTRUN -> SKIP ([i915#8709]) +3 other tests
>    skip
>  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-
>    1-4-mc-ccs:shard-dg2: NOTRUN -> SKIP ([i915#8709]) +11 other tests
>    skip
>  * igt@kms_async_flips@invalid-async-flip:shard-mtlp: NOTRUN -> SKIP
>    ([i915#6228])
>  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:shard-dg2: NOTRUN
>    -> SKIP ([i915#9531])
>  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-
>    internal-panels:shard-dg1: NOTRUN -> SKIP (i915#1769 / [i915#3555])
>  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-
>    panels:shard-dg2: NOTRUN -> SKIP (i915#1769 / [i915#3555])
>  * igt@kms_big_fb@4-tiled-16bpp-rotate-180:shard-tglu: NOTRUN -> SKIP
>    ([i915#5286]) +1 other test skip
>  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:shard-dg1: NOTRUN -> SKIP
>    ([i915#4538] / [i915#5286]) +4 other tests skip
>  * igt@kms_big_fb@4-tiled-addfb:shard-rkl: NOTRUN -> SKIP ([i915#5286])
>    +5 other tests skip
>  * igt@kms_big_fb@linear-64bpp-rotate-270:shard-rkl: NOTRUN -> SKIP
>    ([i915#3638]) +3 other tests skip
>  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:shard-dg2: NOTRUN -> SKIP
>    ([i915#4538] / [i915#5190]) +7 other tests skip
>  * igt@kms_big_fb@y-tiled-8bpp-rotate-270:shard-dg1: NOTRUN -> SKIP
>    ([i915#3638]) +4 other tests skip
>  * igt@kms_big_fb@y-tiled-addfb:shard-mtlp: NOTRUN -> SKIP
>    ([i915#6187])
>  * igt@kms_big_fb@y-tiled-addfb-size-overflow:shard-dg2: NOTRUN -> SKIP
>    ([i915#5190]) +2 other tests skip
>  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:shard-dg1:
>    NOTRUN -> SKIP ([i915#4538]) +8 other tests skip
>  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:shard-mtlp:
>    NOTRUN -> SKIP +17 other tests skip
>  * igt@kms_big_joiner@basic:shard-dg2: NOTRUN -> SKIP (i915#10656) +1
>    other test skipshard-rkl: NOTRUN -> SKIP (i915#10656)shard-tglu:
>    NOTRUN -> SKIP (i915#10656)
>  * igt@kms_big_joiner@invalid-modeset:shard-dg1: NOTRUN -> SKIP
>    (i915#10656) +1 other test skip
>  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-
>    1:shard-dg2: NOTRUN -> SKIP (i915#10307 / i915#10434 / [i915#6095])
>    +2 other tests skip
>  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-c-edp-1:shard-
>    mtlp: NOTRUN -> SKIP ([i915#6095]) +39 other tests skip
>  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-
>    4:shard-dg1: NOTRUN -> SKIP ([i915#6095]) +95 other tests skip
>  * igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs:shard-dg2: NOTRUN ->
>    SKIP (i915#10278) +1 other test skip
>  * igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-a-hdmi-a-1:shard-tglu:
>    NOTRUN -> SKIP ([i915#6095]) +23 other tests skip
>  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-b-hdmi-
>    a-1:shard-rkl: NOTRUN -> SKIP ([i915#6095]) +73 other tests skip
>  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs:shard-dg1:
>    NOTRUN -> SKIP (i915#10278)shard-tglu: NOTRUN -> SKIP (i915#10278)
>  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-d-
>    hdmi-a-1:shard-dg2: NOTRUN -> SKIP (i915#10307 / [i915#6095]) +160
>    other tests skip
>  * igt@kms_cdclk@mode-transition-all-outputs:shard-mtlp: NOTRUN -> SKIP
>    ([i915#7213] / [i915#9010])
>  * igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-2:shard-dg2: NOTRUN ->
>    SKIP ([i915#7213]) +3 other tests skip
>  * igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3:shard-dg2: NOTRUN ->
>    SKIP ([i915#4087]) +3 other tests skip
>  * igt@kms_chamelium_audio@hdmi-audio-edid:shard-dg1: NOTRUN -> SKIP
>    ([i915#7828]) +14 other tests skip
>  * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:shard-rkl:
>    NOTRUN -> SKIP ([i915#7828]) +14 other tests skip
>  * igt@kms_chamelium_frames@dp-crc-multiple:shard-dg2: NOTRUN -> SKIP
>    ([i915#7828]) +9 other tests skip
>  * igt@kms_chamelium_hpd@dp-hpd-after-suspend:shard-tglu: NOTRUN ->
>    SKIP ([i915#7828]) +6 other tests skip
>  * igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode:shard-mtlp: NOTRUN
>    -> SKIP ([i915#7828]) +9 other tests skip
>  * igt@kms_content_protection@atomic-dpms:shard-dg2: NOTRUN -> SKIP
>    ([i915#7118] / [i915#9424])
>  * igt@kms_content_protection@dp-mst-lic-type-0:shard-dg2: NOTRUN ->
>    SKIP ([i915#3299])
>  * igt@kms_content_protection@dp-mst-type-0:shard-rkl: NOTRUN -> SKIP
>    ([i915#3116])
>  * igt@kms_content_protection@lic-type-0:shard-mtlp: NOTRUN -> SKIP
>    ([i915#6944] / [i915#9424]) +1 other test skip
>  * igt@kms_content_protection@lic-type-1:shard-dg2: NOTRUN -> SKIP
>    ([i915#9424]) +1 other test skipshard-rkl: NOTRUN -> SKIP
>    ([i915#9424])shard-tglu: NOTRUN -> SKIP ([i915#6944] / [i915#9424])
>  * igt@kms_content_protection@srm@pipe-a-dp-4:shard-dg2: NOTRUN ->
>    TIMEOUT ([i915#7173])
>  * igt@kms_cursor_crc@cursor-offscreen-32x32:shard-dg1: NOTRUN -> SKIP
>    ([i915#3555]) +6 other tests skip
>  * igt@kms_cursor_crc@cursor-onscreen-32x32:shard-rkl: NOTRUN -> SKIP
>    ([i915#3555]) +12 other tests skip
>  * igt@kms_cursor_crc@cursor-random-256x85:shard-mtlp: NOTRUN -> SKIP
>    ([i915#8814])
>  * igt@kms_cursor_crc@cursor-random-32x10:shard-mtlp: NOTRUN -> SKIP
>    ([i915#3555] / [i915#8814]) +1 other test skip
>  * igt@kms_cursor_crc@cursor-random-512x170:shard-rkl: NOTRUN -> SKIP
>    ([i915#3359]) +1 other test skipshard-mtlp: NOTRUN -> SKIP
>    ([i915#3359])
>  * igt@kms_cursor_crc@cursor-random-512x512:shard-dg2: NOTRUN -> SKIP
>    ([i915#3359]) +2 other tests skip
>  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:shard-tglu: NOTRUN
>    -> SKIP ([i915#3359]) +1 other test skip
>  * igt@kms_cursor_crc@cursor-sliding-512x512:shard-dg1: NOTRUN -> SKIP
>    ([i915#3359]) +1 other test skip
>  * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:shard-
>    mtlp: NOTRUN -> SKIP ([i915#9809]) +3 other tests skip
>  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-
>    size:shard-tglu: NOTRUN -> SKIP ([i915#4103])
>  * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:shard-rkl:
>    NOTRUN -> SKIP ([i915#9067])
>  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-
>    transitions-varying-size:shard-dg2: NOTRUN -> SKIP ([i915#4103] /
>    [i915#4213]) +1 other test skip
>  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:shard-
>    mtlp: NOTRUN -> SKIP ([i915#4213])shard-rkl: NOTRUN -> SKIP
>    ([i915#4103])
>  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:shard-rkl: NOTRUN -> SKIP
>    ([i915#9723])shard-mtlp: NOTRUN -> SKIP ([i915#9833])
>  * igt@kms_display_modes@extended-mode-basic:shard-dg2: NOTRUN -> SKIP
>    ([i915#3555]) +9 other tests skip
>  * igt@kms_display_modes@mst-extended-mode-negative:shard-dg1: NOTRUN -
>    > SKIP ([i915#8588])
>  * igt@kms_draw_crc@draw-method-mmap-gtt:shard-dg1: NOTRUN -> SKIP
>    ([i915#8812])
>  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:shard-rkl: NOTRUN -> SKIP
>    ([i915#3840])shard-dg1: NOTRUN -> SKIP ([i915#3840])
>  * igt@kms_dsc@dsc-with-output-formats:shard-mtlp: NOTRUN -> SKIP
>    ([i915#3555] / [i915#3840])shard-dg2: NOTRUN -> SKIP ([i915#3555] /
>    [i915#3840])shard-dg1: NOTRUN -> SKIP ([i915#3555] / [i915#3840]) +1
>    other test skip
>  * igt@kms_dsc@dsc-with-output-formats-with-bpc:shard-dg1: NOTRUN ->
>    SKIP ([i915#3840] / [i915#9053])
>  * igt@kms_fbcon_fbt@psr:shard-dg2: NOTRUN -> SKIP ([i915#3469]) +1
>    other test skip
>  * igt@kms_feature_discovery@chamelium:shard-tglu: NOTRUN -> SKIP
>    (i915#2065 / [i915#4854])shard-dg2: NOTRUN -> SKIP
>    ([i915#4854])shard-rkl: NOTRUN -> SKIP ([i915#4854])shard-dg1:
>    NOTRUN -> SKIP ([i915#4854])
>  * igt@kms_feature_discovery@dp-mst:shard-dg2: NOTRUN -> SKIP
>    ([i915#9337])
>  * igt@kms_flip@2x-absolute-wf_vblank-interruptible:shard-mtlp: NOTRUN
>    -> SKIP ([i915#3637]) +1 other test skip
>  * igt@kms_flip@2x-nonexisting-fb:shard-tglu: NOTRUN -> SKIP
>    ([i915#3637]) +1 other test skip
>  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:shard-dg1:
>    NOTRUN -> SKIP ([i915#9934]) +10 other tests skip
>  * igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-vga1-hdmi-
>    a1:shard-snb: PASS -> FAIL (i915#2122)
>  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-
>    downscaling@pipe-a-default-mode:shard-mtlp: NOTRUN -> SKIP
>    ([i915#3555] / [i915#8810]) +2 other tests skip
>  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-
>    upscaling@pipe-a-valid-mode:shard-rkl: NOTRUN -> SKIP (i915#2672) +3
>    other tests skipshard-dg1: NOTRUN -> SKIP (i915#2587 / i915#2672) +4
>    other tests skipshard-tglu: NOTRUN -> SKIP (i915#2587 / i915#2672)
>    +1 other test skip
>  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-
>    downscaling@pipe-a-valid-mode:shard-dg2: NOTRUN -> SKIP (i915#2672)
>    +5 other tests skip
>  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-
>    upscaling@pipe-a-default-mode:shard-mtlp: NOTRUN -> SKIP (i915#2672)
>    +1 other test skip
>  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-
>    downscaling@pipe-a-default-mode:shard-mtlp: NOTRUN -> SKIP
>    (i915#2672 / [i915#3555])
>  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-
>    gtt:shard-dg2: NOTRUN -> SKIP ([i915#8708]) +19 other tests skip
>  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-
>    cpu:shard-dg2: NOTRUN -> FAIL ([i915#6880]) +1 other test fail
>  * igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw:shard-snb:
>    PASS -> SKIP +3 other tests skip
>  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-
>    wc:shard-dg1: NOTRUN -> SKIP ([i915#8708]) +27 other tests skip
>  * igt@kms_frontbuffer_tracking@fbc-tiling-4:shard-rkl: NOTRUN -> SKIP
>    ([i915#5439]) +1 other test skipshard-dg1: NOTRUN -> SKIP
>    ([i915#5439])shard-tglu: NOTRUN -> SKIP ([i915#5439])
>  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-
>    move:shard-rkl: NOTRUN -> SKIP (i915#1825) +58 other tests skip
>  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-
>    cpu:shard-mtlp: NOTRUN -> SKIP (i915#1825) +39 other tests skip
>  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-
>    blt:shard-dg2: NOTRUN -> SKIP ([i915#5354]) +38 other tests skip
>  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:shard-
>    rkl: NOTRUN -> SKIP ([i915#3023]) +33 other tests skip
>  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-pwrite:shard-dg2:
>    NOTRUN -> SKIP (i915#10433 / [i915#3458])
>  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:shard-dg2: NOTRUN ->
>    SKIP (i915#10055)
>  * igt@kms_frontbuffer_tracking@plane-fbc-rte:shard-mtlp: NOTRUN ->
>    SKIP (i915#10070)
>  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-
>    pwrite:shard-dg2: NOTRUN -> SKIP ([i915#3458]) +19 other tests skip
>  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-
>    cpu:shard-tglu: NOTRUN -> SKIP +55 other tests skip
>  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-
>    gtt:shard-mtlp: NOTRUN -> SKIP ([i915#8708]) +8 other tests skip
>  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-pwrite:shard-dg1:
>    NOTRUN -> SKIP ([i915#3458]) +17 other tests skip
>  * igt@kms_hdr@bpc-switch-suspend:shard-tglu: NOTRUN -> SKIP
>    ([i915#3555] / [i915#8228]) +2 other tests skip
>  * igt@kms_hdr@static-toggle-dpms:shard-mtlp: NOTRUN -> SKIP
>    ([i915#3555] / [i915#8228])
>  * igt@kms_hdr@static-toggle-suspend:shard-dg2: NOTRUN -> SKIP
>    ([i915#3555] / [i915#8228]) +3 other tests skipshard-rkl: NOTRUN ->
>    SKIP ([i915#3555] / [i915#8228]) +1 other test skipshard-dg1: NOTRUN
>    -> SKIP ([i915#3555] / [i915#8228]) +2 other tests skip
>  * igt@kms_panel_fitting@atomic-fastset:shard-rkl: NOTRUN -> SKIP
>    ([i915#6301]) +1 other test skip
>  * igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes:shard-dg2: NOTRUN
>    -> SKIP +26 other tests skip
>  * igt@kms_plane_lowres@tiling-4@pipe-b-edp-1:shard-mtlp: NOTRUN ->
>    SKIP ([i915#3582]) +3 other tests skip
>  * igt@kms_plane_lowres@tiling-y:shard-mtlp: NOTRUN -> SKIP
>    ([i915#3555] / [i915#8821])
>  * igt@kms_plane_multiple@tiling-y:shard-dg2: NOTRUN -> SKIP
>    ([i915#8806])
>  * igt@kms_plane_multiple@tiling-yf:shard-dg2: NOTRUN -> SKIP
>    ([i915#3555] / [i915#8806])
>  * igt@kms_plane_scaling@2x-scaler-multi-pipe:shard-dg2: NOTRUN -> SKIP
>    ([i915#5354] / [i915#9423])
>  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-
>    format@pipe-a-hdmi-a-1:shard-tglu: NOTRUN -> SKIP ([i915#9423]) +3
>    other tests skip
>  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-
>    format@pipe-c-hdmi-a-1:shard-dg2: NOTRUN -> SKIP ([i915#9423]) +7
>    other tests skip
>  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-
>    rotation@pipe-a-hdmi-a-2:shard-rkl: NOTRUN -> SKIP ([i915#9423]) +7
>    other tests skip
>  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-
>    rotation@pipe-a-hdmi-a-1:shard-rkl: NOTRUN -> SKIP ([i915#5176] /
>    [i915#9423]) +1 other test skip
>  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-
>    a-hdmi-a-3:shard-dg1: NOTRUN -> SKIP ([i915#9423]) +11 other tests
>    skip
>  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-
>    20x20@pipe-b-hdmi-a-2:shard-rkl: NOTRUN -> SKIP ([i915#5235]) +5
>    other tests skip
>  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-c-hdmi-a-
>    4:shard-dg1: NOTRUN -> SKIP ([i915#5235]) +7 other tests skip
>  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-
>    5@pipe-d-edp-1:shard-mtlp: NOTRUN -> SKIP ([i915#5235]) +3 other
>    tests skip
>  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-
>    25@pipe-a-hdmi-a-3:shard-dg2: NOTRUN -> SKIP ([i915#5235] /
>    [i915#9423]) +23 other tests skip
>  * igt@kms_pm_backlight@bad-brightness:shard-rkl: NOTRUN -> SKIP
>    ([i915#5354])shard-tglu: NOTRUN -> SKIP ([i915#9812])
>  * igt@kms_pm_dc@dc5-psr:shard-dg1: NOTRUN -> SKIP ([i915#9685]) +2
>    other tests skip
>  * igt@kms_pm_dc@dc9-dpms:shard-tglu: PASS -> SKIP ([i915#4281])
>  * igt@kms_pm_lpsp@screens-disabled:shard-mtlp: NOTRUN -> SKIP
>    ([i915#8430])
>  * igt@kms_pm_rpm@modeset-lpsp:shard-dg2: PASS -> SKIP ([i915#9519]) +2
>    other tests skip
>  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:shard-dg1: NOTRUN -> SKIP
>    ([i915#9519])
>  * igt@kms_pm_rpm@modeset-non-lpsp:shard-mtlp: NOTRUN -> SKIP
>    ([i915#9519]) +1 other test skip
>  * igt@kms_prime@basic-crc-hybrid:shard-rkl: NOTRUN -> SKIP
>    ([i915#6524])
>  * igt@kms_prime@basic-crc-vgem:shard-dg2: NOTRUN -> SKIP ([i915#6524]
>    / [i915#6805])
>  * igt@kms_prime@d3hot:shard-mtlp: NOTRUN -> SKIP ([i915#6524]) +1
>    other test skip
>  * igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area:shard-dg1:
>    NOTRUN -> SKIP +59 other tests skip
>  * igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area@psr2-pipe-a-
>    edp-1:shard-mtlp: NOTRUN -> SKIP ([i915#9808]) +3 other tests skip
>  * igt@kms_psr2_su@page_flip-nv12:shard-mtlp: NOTRUN -> SKIP
>    ([i915#4348])
>  * igt@kms_psr2_su@page_flip-p010:shard-dg2: NOTRUN -> SKIP
>    ([i915#9683])shard-rkl: NOTRUN -> SKIP ([i915#9683]) +1 other test
>    skipshard-dg1: NOTRUN -> SKIP ([i915#9683]) +1 other test skipshard-
>    tglu: NOTRUN -> SKIP ([i915#9683]) +1 other test skip
>  * igt@kms_psr@fbc-pr-primary-blt:shard-mtlp: NOTRUN -> SKIP
>    ([i915#9688]) +9 other tests skip
>  * igt@kms_psr@fbc-psr-basic:shard-dg2: NOTRUN -> SKIP (i915#1072 /
>    [i915#9673] / [i915#9732]) +1 other test skip
>  * igt@kms_psr@pr-basic:shard-tglu: NOTRUN -> SKIP ([i915#9732]) +13
>    other tests skip
>  * igt@kms_psr@psr-sprite-mmap-cpu:shard-dg1: NOTRUN -> SKIP (i915#1072
>    / [i915#9732]) +29 other tests skip
>  * igt@kms_psr@psr2-cursor-blt:shard-dg2: NOTRUN -> SKIP (i915#1072 /
>    [i915#9732]) +22 other tests skip
>  * igt@kms_psr@psr2-cursor-mmap-gtt:shard-rkl: NOTRUN -> SKIP
>    (i915#1072 / [i915#9732]) +27 other tests skip
>  * igt@kms_psr@psr2-sprite-mmap-gtt@edp-1:shard-mtlp: NOTRUN -> SKIP
>    ([i915#4077] / [i915#9688])
>  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:shard-dg2:
>    NOTRUN -> SKIP ([i915#9685]) +1 other test skip
>  * igt@kms_rotation_crc@bad-tiling:shard-dg2: NOTRUN -> SKIP
>    ([i915#4235])
>  * igt@kms_rotation_crc@exhaust-fences:shard-dg1: NOTRUN -> SKIP
>    ([i915#4884])
>  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:shard-rkl: NOTRUN
>    -> SKIP ([i915#5289])shard-dg1: NOTRUN -> SKIP ([i915#5289])
>  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:shard-mtlp:
>    NOTRUN -> SKIP ([i915#5289])
>  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:shard-mtlp: NOTRUN
>    -> SKIP ([i915#4235]) +2 other tests skip
>  * igt@kms_scaling_modes@scaling-mode-full-aspect:shard-tglu: NOTRUN ->
>    SKIP ([i915#3555]) +5 other tests skip
>  * igt@kms_vrr@flip-suspend:shard-mtlp: NOTRUN -> SKIP ([i915#3555] /
>    [i915#8808])
>  * igt@kms_vrr@max-min:shard-dg2: NOTRUN -> SKIP ([i915#9906])
>  * igt@kms_vrr@seamless-rr-switch-virtual:shard-dg1: NOTRUN -> SKIP
>    ([i915#9906])
>  * igt@kms_writeback@writeback-check-output:shard-dg2: NOTRUN -> SKIP
>    (i915#2437) +1 other test skipshard-dg1: NOTRUN -> SKIP
>    (i915#2437)shard-mtlp: NOTRUN -> SKIP (i915#2437)
>  * igt@perf@gen8-unprivileged-single-ctx-counters:shard-dg2: NOTRUN ->
>    SKIP (i915#2436)shard-rkl: NOTRUN -> SKIP (i915#2436)
>  * igt@perf@mi-rpc:shard-mtlp: NOTRUN -> SKIP (i915#2434)
>  * igt@perf@per-context-mode-unprivileged:shard-dg1: NOTRUN -> SKIP
>    (i915#2433)
>  * igt@perf_pmu@busy-double-start@vecs1:shard-dg2: NOTRUN -> FAIL
>    ([i915#4349]) +3 other tests fail
>  * igt@perf_pmu@cpu-hotplug:shard-mtlp: NOTRUN -> SKIP ([i915#8850])
>  * igt@perf_pmu@faulting-read@gtt:shard-mtlp: NOTRUN -> SKIP
>    ([i915#8440])
>  * igt@prime_vgem@basic-fence-read:shard-mtlp: NOTRUN -> SKIP
>    ([i915#3708])
>  * igt@prime_vgem@coherency-gtt:shard-dg2: NOTRUN -> SKIP ([i915#3708]
>    / [i915#4077]) +1 other test skipshard-rkl: NOTRUN -> SKIP
>    ([i915#3708]) +1 other test skip
>  * igt@sriov_basic@bind-unbind-vf:shard-rkl: NOTRUN -> SKIP
>    ([i915#9917])shard-mtlp: NOTRUN -> SKIP ([i915#9917])
>  * igt@sriov_basic@enable-vfs-autoprobe-on:shard-dg1: NOTRUN -> SKIP
>    ([i915#9917])
>  * igt@syncobj_timeline@invalid-wait-zero-handles:shard-dg1: NOTRUN ->
>    FAIL ([i915#9781])
>  * igt@tools_test@sysfs_l3_parity:shard-rkl: NOTRUN -> SKIP +52 other
>    tests skip
>  * igt@v3d/v3d_mmap@mmap-bo:shard-mtlp: NOTRUN -> SKIP (i915#2575) +10
>    other tests skip
>  * igt@v3d/v3d_submit_cl@job-perfmon:shard-dg1: NOTRUN -> SKIP
>    (i915#2575) +15 other tests skip
>  * igt@v3d/v3d_submit_csd@single-out-sync:shard-dg2: NOTRUN -> SKIP
>    (i915#2575) +15 other tests skip
>  * igt@vc4/vc4_mmap@mmap-bad-handle:shard-dg1: NOTRUN -> SKIP
>    ([i915#7711]) +13 other tests skip
>  * igt@vc4/vc4_perfmon@create-two-perfmon:shard-rkl: NOTRUN -> SKIP
>    ([i915#7711]) +14 other tests skip
>  * igt@vc4/vc4_perfmon@get-values-invalid-pointer:shard-tglu: NOTRUN ->
>    SKIP (i915#2575) +12 other tests skip
>  * igt@vc4/vc4_purgeable_bo@access-purged-bo-mem:shard-mtlp: NOTRUN ->
>    SKIP ([i915#7711]) +8 other tests skip
>  * igt@vc4/vc4_tiling@set-bad-modifier:shard-dg2: NOTRUN -> SKIP
>    ([i915#7711]) +6 other tests skip
> Possible fixes * igt@gem_eio@unwedge-stress:shard-dg1: FAIL ([i915#5784])=
 -> PASS
>  * igt@gem_lmem_swapping@basic@lmem0:shard-dg2: FAIL (i915#10378) ->
>    PASS +1 other test pass
>  * igt@gem_lmem_swapping@heavy-random@lmem0:shard-dg1: FAIL
>    (i915#10378) -> PASS
>  * igt@i915_module_load@reload-with-fault-injection:shard-rkl: ABORT
>    ([i915#9820]) -> PASS
>  * igt@i915_module_load@resize-bar:shard-dg2: SKIP -> PASS +2 other
>    tests pass
>  * igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0:shard-dg1: FAIL
>    ([i915#3591]) -> PASS
>  * igt@kms_cursor_legacy@cursor-vs-flip-varying-size:shard-dg2:
>    INCOMPLETE (i915#10670) -> PASS
>  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-
>    size:shard-snb: SKIP -> PASS +3 other tests pass
>  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ab-vga1-hdmi-a1:shard-
>    snb: FAIL (i915#2122) -> PASS
>  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt:shard-
>    dg2: FAIL ([i915#6880]) -> PASS
>  * igt@kms_plane@pixel-format@pipe-b:shard-mtlp: ABORT -> PASS
>  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:shard-rkl: SKIP
>    ([i915#9519]) -> PASS +2 other tests pass
>  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:shard-dg2: SKIP
>    ([i915#9519]) -> PASS
>  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:shard-mtlp: FAIL
>    ([i915#9196]) -> PASS +1 other test pass
>  * igt@syncobj_timeline@etime-multi-wait-all-submitted:shard-dg2: SKIP
>    (i915#2575) -> PASS +20 other tests pass
> Warnings * igt@drm_fdinfo@all-busy-check-all:shard-dg2: SKIP ([i915#5608]=
) ->
>    SKIP ([i915#8414])
>  * igt@gem_exec_fair@basic-pace-share:shard-dg2: SKIP (i915#2575) ->
>    SKIP ([i915#3539] / [i915#4852]) +1 other test skip
>  * igt@gem_exec_fence@concurrent:shard-dg2: SKIP (i915#2575) -> SKIP
>    ([i915#4812])
>  * igt@gem_exec_reloc@basic-wc-active:shard-dg2: SKIP (i915#2575) ->
>    SKIP ([i915#3281]) +3 other tests skip
>  * igt@gem_fenced_exec_thrash@no-spare-fences:shard-dg2: SKIP
>    (i915#2575) -> SKIP ([i915#4860])
>  * igt@gem_mmap_wc@write-wc-read-gtt:shard-dg2: SKIP (i915#2575) ->
>    SKIP ([i915#4083])
>  * igt@gem_readwrite@write-bad-handle:shard-dg2: SKIP (i915#2575) ->
>    SKIP ([i915#3282]) +1 other test skip
>  * igt@gem_render_copy@yf-tiled:shard-dg2: SKIP (i915#2575 /
>    [i915#5190]) -> SKIP ([i915#5190] / [i915#8428])
>  * igt@gem_tiled_partial_pwrite_pread@writes:shard-dg2: SKIP
>    (i915#2575) -> SKIP ([i915#4077]) +2 other tests skip
>  * igt@gen9_exec_parse@cmd-crossing-page:shard-dg2: SKIP (i915#2575) ->
>    SKIP ([i915#2856])
>  * igt@i915_module_load@reload-with-fault-injection:shard-dg2:
>    INCOMPLETE (i915#1982 / [i915#9820] / [i915#9849]) -> INCOMPLETE
>    ([i915#9820] / [i915#9849])
>  * igt@kms_addfb_basic@tile-pitch-mismatch:shard-dg2: SKIP (i915#2575)
>    -> SKIP ([i915#4212])
>  * igt@kms_big_fb@y-tiled-32bpp-rotate-90:shard-dg2: SKIP ([i915#5190])
>    -> SKIP ([i915#4538] / [i915#5190]) +1 other test skip
>  * igt@kms_chamelium_audio@hdmi-audio:shard-dg2: SKIP (i915#2575) ->
>    SKIP ([i915#7828])
>  * igt@kms_content_protection@dp-mst-lic-type-1:shard-dg2: SKIP
>    (i915#2575) -> SKIP ([i915#3299])
>  * igt@kms_content_protection@srm:shard-snb: SKIP -> INCOMPLETE
>    ([i915#8816])
>  * igt@kms_content_protection@uevent:shard-dg2: SKIP (i915#2575) ->
>    SKIP ([i915#7118] / [i915#9424])
>  * igt@kms_dsc@dsc-basic:shard-dg2: SKIP -> SKIP ([i915#3555] /
>    [i915#3840])
>  * igt@kms_flip@2x-flip-vs-wf_vblank:shard-dg2: SKIP (i915#2575) ->
>    SKIP +1 other test skip
>  * igt@kms_force_connector_basic@prune-stale-modes:shard-dg2: SKIP
>    (i915#2575) -> SKIP ([i915#5274])
>  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc:shard-dg2: SKIP
>    -> SKIP ([i915#8708]) +3 other tests skip
>  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-
>    render:shard-dg2: SKIP -> SKIP ([i915#3458]) +2 other tests skip
>  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:shard-dg2: SKIP
>    (i915#10433 / [i915#3458]) -> SKIP ([i915#3458]) +2 other tests skip
>  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt:shard-
>    dg2: SKIP -> SKIP ([i915#5354]) +3 other tests skip
>  * igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:shard-dg2: SKIP
>    ([i915#3458]) -> SKIP (i915#10433 / [i915#3458]) +1 other test skip
>  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:shard-rkl: SKIP
>    ([i915#4816]) -> SKIP ([i915#4070] / [i915#4816])
>  * igt@kms_psr@fbc-pr-sprite-blt:shard-dg2: SKIP (i915#1072 /
>    [i915#9732]) -> SKIP (i915#1072 / [i915#9673] / [i915#9732]) +11
>    other tests skip
>  * igt@kms_psr@fbc-psr-suspend:shard-dg2: SKIP (i915#1072 / [i915#9673]
>    / [i915#9732]) -> SKIP (i915#1072 / [i915#9732]) +2 other tests skip
>  * igt@kms_psr@pr-sprite-blt:shard-dg2: SKIP -> SKIP (i915#1072 /
>    [i915#9732]) +1 other test skip
>  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:shard-dg2: SKIP
>    (i915#2575 / [i915#5190]) -> SKIP ([i915#5190])
>  * igt@kms_rotation_crc@sprite-rotation-90:shard-dg2: SKIP (i915#2575)
>    -> SKIP ([i915#4235]) +1 other test skip
>  * igt@kms_setmode@basic-clone-single-crtc:shard-dg2: SKIP (i915#2575)
>    -> SKIP ([i915#3555]) +1 other test skip
>  * igt@kms_writeback@writeback-pixel-formats:shard-dg2: SKIP
>    (i915#2575) -> SKIP (i915#2437 / [i915#9412])
> [i915#


--=-LBYVDlFmPGsDHFASTLG3
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html><head>
 =20
  <title>Project List - Patchwork</title>
  <style id=3D"css-table-select" type=3D"text/css">
   td { padding: 2pt; }
  </style>
</head>
<body><div style=3D"unicode-bidi: plaintext; caret-color: rgb(46, 52, 54); =
color: rgb(46, 52, 54); font-family: Cantarell; font-size: 12px; font-style=
: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: norm=
al; orphans: auto; text-align: start; text-indent: 0px; text-transform: non=
e; white-space: normal; widows: auto; word-spacing: 0px; -webkit-tap-highli=
ght-color: rgba(0, 0, 0, 0.4); -webkit-text-stroke-width: 0px; background-c=
olor: rgb(255, 255, 255); text-decoration: none;">Hi,</div><div style=3D"un=
icode-bidi: plaintext; caret-color: rgb(46, 52, 54); color: rgb(46, 52, 54)=
; font-family: Cantarell; font-size: 12px; font-style: normal; font-variant=
-caps: normal; font-weight: 400; letter-spacing: normal; orphans: auto; tex=
t-align: start; text-indent: 0px; text-transform: none; white-space: normal=
; widows: auto; word-spacing: 0px; -webkit-tap-highlight-color: rgba(0, 0, =
0, 0.4); -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 25=
5); text-decoration: none;"><br></div><div style=3D"unicode-bidi: plaintext=
; caret-color: rgb(46, 52, 54); color: rgb(46, 52, 54); font-family: Cantar=
ell; font-size: 12px; font-style: normal; font-variant-caps: normal; font-w=
eight: 400; letter-spacing: normal; orphans: auto; text-align: start; text-=
indent: 0px; text-transform: none; white-space: normal; widows: auto; word-=
spacing: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.4); -webkit-text=
-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration: =
none;">All these new issues are false positives and not related to this pat=
chset.</div><div style=3D"unicode-bidi: plaintext; caret-color: rgb(46, 52,=
 54); color: rgb(46, 52, 54); font-family: Cantarell; font-size: 12px; font=
-style: normal; font-variant-caps: normal; font-weight: 400; letter-spacing=
: normal; orphans: auto; text-align: start; text-indent: 0px; text-transfor=
m: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-tap-=
highlight-color: rgba(0, 0, 0, 0.4); -webkit-text-stroke-width: 0px; backgr=
ound-color: rgb(255, 255, 255); text-decoration: none;"><br></div><div styl=
e=3D"unicode-bidi: plaintext; caret-color: rgb(46, 52, 54); color: rgb(46, =
52, 54); font-family: Cantarell; font-size: 12px; font-style: normal; font-=
variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: au=
to; text-align: start; text-indent: 0px; text-transform: none; white-space:=
 normal; widows: auto; word-spacing: 0px; -webkit-tap-highlight-color: rgba=
(0, 0, 0, 0.4); -webkit-text-stroke-width: 0px; background-color: rgb(255, =
255, 255); text-decoration: none;">Can you please re-report it?</div><div s=
tyle=3D"unicode-bidi: plaintext; caret-color: rgb(46, 52, 54); color: rgb(4=
6, 52, 54); font-family: Cantarell; font-size: 12px; font-style: normal; fo=
nt-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans:=
 auto; text-align: start; text-indent: 0px; text-transform: none; white-spa=
ce: normal; widows: auto; word-spacing: 0px; -webkit-tap-highlight-color: r=
gba(0, 0, 0, 0.4); -webkit-text-stroke-width: 0px; background-color: rgb(25=
5, 255, 255); text-decoration: none;"><br></div><div style=3D"unicode-bidi:=
 plaintext; caret-color: rgb(46, 52, 54); color: rgb(46, 52, 54); font-fami=
ly: Cantarell; font-size: 12px; font-style: normal; font-variant-caps: norm=
al; font-weight: 400; letter-spacing: normal; orphans: auto; text-align: st=
art; text-indent: 0px; text-transform: none; white-space: normal; widows: a=
uto; word-spacing: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.4); -w=
ebkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-de=
coration: none;">--</div><div style=3D"unicode-bidi: plaintext; caret-color=
: rgb(46, 52, 54); color: rgb(46, 52, 54); font-family: Cantarell; font-siz=
e: 12px; font-style: normal; font-variant-caps: normal; font-weight: 400; l=
etter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: 0px;=
 -webkit-tap-highlight-color: rgba(0, 0, 0, 0.4); -webkit-text-stroke-width=
: 0px; background-color: rgb(255, 255, 255); text-decoration: none;">Cheers=
,</div><div style=3D"unicode-bidi: plaintext; caret-color: rgb(46, 52, 54);=
 color: rgb(46, 52, 54); font-family: Cantarell; font-size: 12px; font-styl=
e: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: nor=
mal; orphans: auto; text-align: start; text-indent: 0px; text-transform: no=
ne; white-space: normal; widows: auto; word-spacing: 0px; -webkit-tap-highl=
ight-color: rgba(0, 0, 0, 0.4); -webkit-text-stroke-width: 0px; background-=
color: rgb(255, 255, 255); text-decoration: none;">Luca.</div><div><br></di=
v><div><br></div><div>On Wed, 2024-05-29 at 11:05 +0000, Patchwork wrote:</=
div><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #=
729fcf solid;padding-left:1ex"><div><b>Patch Details</b></div><div><table><=
tbody><tr><td><b>Series:</b></td><td>check drmModeGetConnector() return val=
ue in some missing places (rev3)</td></tr><tr><td><b>URL:</b></td><td><a hr=
ef=3D"https://patchwork.freedesktop.org/series/133953/">https://patchwork.f=
reedesktop.org/series/133953/</a></td></tr><tr><td><b>State:</b></td><td>fa=
ilure</td></tr> <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_11201/index.html">https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_11201/index.html</a></td></tr></tbody></table> </div><=
h1>CI Bug Log - changes from IGT_7873_full -&gt; IGTPW_11201_full</h1><h2>S=
ummary</h2><p><strong>FAILURE</strong></p><p>Serious unknown changes coming=
 with IGTPW_11201_full absolutely need to be<br> verified manually.</p><p>I=
f you think the reported changes have nothing to do with the changes<br> in=
troduced in IGTPW_11201_full, please notify your bug team (I915-ci-infra@li=
sts.freedesktop.org) to allow them<br> to document this new failure mode, w=
hich will reduce false positives in CI.</p><p>External URL: https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_11201/index.html</p><h2>Participating hosts=
 (9 -&gt; 9)</h2><p>No changes in participating hosts</p><h2>Possible new i=
ssues</h2><p>Here are the unknown changes that may have been introduced in =
IGTPW_11201_full:</p><h3>IGT changes</h3><h4>Possible regressions</h4><ul><=
li><p>igt@gem_exec_gttfill@engines@vcs0:</p><ul><li>shard-mtlp: <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7873/shard-mtlp-2/igt@gem_exec=
_gttfill@engines@vcs0.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_11201/shard-mtlp-8/igt@gem_exec_gttfill@engines@v=
cs0.html">INCOMPLETE</a></li></ul></li><li><p>igt@i915_selftest@live@gem_co=
ntexts:</p><ul><li>shard-dg1: <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGT_7873/shard-dg1-18/igt@i915_selftest@live@gem_contexts.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/=
shard-dg1-17/igt@i915_selftest@live@gem_contexts.html">INCOMPLETE</a></li><=
/ul></li><li><p>igt@kms_flip@blocking-absolute-wf_vblank@b-hdmi-a1:</p><ul>=
<li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_11201/shard-dg2-8/igt@kms_flip@blocking-absolute-wf_vblank@b-hdm=
i-a1.html">INCOMPLETE</a> +1 other test incomplete</li></ul></li><li><p>igt=
@kms_flip@flip-vs-expired-vblank@d-hdmi-a4:</p><ul><li>shard-dg1: <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7873/shard-dg1-18/igt@kms_=
flip@flip-vs-expired-vblank@d-hdmi-a4.html">PASS</a> -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-dg1-16/igt@kms_flip@f=
lip-vs-expired-vblank@d-hdmi-a4.html">FAIL</a></li></ul></li></ul><h4>Warni=
ngs</h4><ul><li>igt@kms_big_fb@y-tiled-8bpp-rotate-270:<ul><li>shard-tglu: =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7873/shard-tglu-6/i=
gt@kms_big_fb@y-tiled-8bpp-rotate-270.html">SKIP</a> -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-tglu-9/igt@kms_big_fb=
@y-tiled-8bpp-rotate-270.html">INCOMPLETE</a></li></ul></li></ul><h2>New te=
sts</h2><p>New tests have been introduced between IGT_7873_full and IGTPW_1=
1201_full:</p><h3>New IGT tests (3)</h3><ul><li><p>igt@kms_flip@2x-flip-vs-=
absolute-wf_vblank@ab-hdmi-a1-hdmi-a2:</p><ul><li>Statuses : 1 pass(s)</li>=
<li>Exec time: [10.92] s</li></ul></li><li><p>igt@kms_flip@2x-flip-vs-absol=
ute-wf_vblank@ac-hdmi-a1-hdmi-a2:</p><ul><li>Statuses : 1 pass(s)</li><li>E=
xec time: [11.01] s</li></ul></li><li><p>igt@kms_flip@2x-flip-vs-absolute-w=
f_vblank@bc-hdmi-a1-hdmi-a2:</p><ul><li>Statuses : 1 pass(s)</li><li>Exec t=
ime: [10.84] s</li></ul></li></ul><h2>Known issues</h2><p>Here are the chan=
ges found in IGTPW_11201_full that come from known issues:</p><h3>IGT chang=
es</h3><h4>Issues hit</h4><ul><li><p>igt@api_intel_bb@blit-reloc-purge-cach=
e:</p><ul><li>shard-dg1: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_11201/shard-dg1-15/igt@api_intel_bb@blit-reloc-purge-c=
ache.html">SKIP</a> ([i915#8411])</li><li>shard-dg2: NOTRUN -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-dg2-6/igt@ap=
i_intel_bb@blit-reloc-purge-cache.html">SKIP</a> ([i915#8411])</li></ul></l=
i><li><p>igt@api_intel_bb@crc32:</p><ul><li>shard-dg1: NOTRUN -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-dg1-16/igt@a=
pi_intel_bb@crc32.html">SKIP</a> ([i915#6230])</li><li>shard-tglu: NOTRUN -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-=
tglu-7/igt@api_intel_bb@crc32.html">SKIP</a> ([i915#6230])</li></ul></li><l=
i><p>igt@api_intel_bb@object-reloc-keep-cache:</p><ul><li>shard-rkl: NOTRUN=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shar=
d-rkl-3/igt@api_intel_bb@object-reloc-keep-cache.html">SKIP</a> ([i915#8411=
]) +2 other tests skip</li><li>shard-mtlp: NOTRUN -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-mtlp-3/igt@api_intel_bb@=
object-reloc-keep-cache.html">SKIP</a> ([i915#8411])</li></ul></li><li><p>i=
gt@api_intel_bb@render-ccs:</p><ul><li>shard-dg2: NOTRUN -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-dg2-5/igt@api_int=
el_bb@render-ccs.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/10380">i915#10380</a>)</li></ul></li><li><p>igt@de=
bugfs_test@basic-hwmon:</p><ul><li>shard-tglu: NOTRUN -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-tglu-8/igt@debugfs_t=
est@basic-hwmon.html">SKIP</a> ([i915#9318])</li></ul></li><li><p>igt@devic=
e_reset@cold-reset-bound:</p><ul><li>shard-dg1: NOTRUN -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-dg1-15/igt@device_r=
eset@cold-reset-bound.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/11078">i915#11078</a>)</li><li>shard-tglu: NO=
TRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/=
shard-tglu-8/igt@device_reset@cold-reset-bound.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078">i915#11078</a=
>)</li><li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_11201/shard-dg2-4/igt@device_reset@cold-reset-bound.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/11078">i915#11078</a>)</li></ul></li><li><p>igt@device_reset@unbind-cold=
-reset-rebind:</p><ul><li>shard-rkl: NOTRUN -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-rkl-2/igt@device_reset@unbind-=
cold-reset-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/11078">i915#11078</a>) +1 other test skip</li><li=
>shard-mtlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_11201/shard-mtlp-3/igt@device_reset@unbind-cold-reset-rebind.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/11078">i915#11078</a>)</li></ul></li><li><p>igt@device_reset@unbind-rese=
t-rebind:</p><ul><li>shard-dg1: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_11201/shard-dg1-13/igt@device_reset@unbind-rese=
t-rebind.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/11164">i915#11164</a>)</li></ul></li><li><p>igt@drm_fdinf=
o@all-busy-idle-check-all:</p><ul><li>shard-dg2: NOTRUN -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-dg2-6/igt@drm_fdin=
fo@all-busy-idle-check-all.html">SKIP</a> ([i915#8414]) +1 other test skip<=
/li></ul></li><li><p>igt@drm_fdinfo@busy-hang@bcs0:</p><ul><li>shard-dg1: N=
OTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201=
/shard-dg1-17/igt@drm_fdinfo@busy-hang@bcs0.html">SKIP</a> ([i915#8414]) +4=
 other tests skip</li></ul></li><li><p>igt@drm_fdinfo@virtual-busy-idle:</p=
><ul><li>shard-mtlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_11201/shard-mtlp-7/igt@drm_fdinfo@virtual-busy-idle.html">=
SKIP</a> ([i915#8414])</li></ul></li><li><p>igt@drm_fdinfo@virtual-idle:</p=
><ul><li>shard-rkl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_11201/shard-rkl-3/igt@drm_fdinfo@virtual-idle.html">FAIL</a=
> ([i915#7742]) +1 other test fail</li></ul></li><li><p>igt@gem_basic@multi=
gpu-create-close:</p><ul><li>shard-rkl: NOTRUN -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-rkl-3/igt@gem_basic@multigp=
u-create-close.html">SKIP</a> ([i915#7697]) +1 other test skip</li></ul></l=
i><li><p>igt@gem_busy@semaphore:</p><ul><li>shard-mtlp: NOTRUN -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-mtlp-2/igt@=
gem_busy@semaphore.html">SKIP</a> ([i915#3936])</li></ul></li><li><p>igt@ge=
m_ccs@block-copy-compressed:</p><ul><li>shard-dg1: NOTRUN -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-dg1-18/igt@gem_c=
cs@block-copy-compressed.html">SKIP</a> ([i915#3555] / [i915#9323])</li></u=
l></li><li><p>igt@gem_ccs@block-multicopy-compressed:</p><ul><li>shard-rkl:=
 NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_112=
01/shard-rkl-4/igt@gem_ccs@block-multicopy-compressed.html">SKIP</a> ([i915=
#9323])</li></ul></li><li><p>igt@gem_close_race@multigpu-basic-process:</p>=
<ul><li>shard-tglu: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_11201/shard-tglu-6/igt@gem_close_race@multigpu-basic-proces=
s.html">SKIP</a> ([i915#7697])</li><li>shard-dg2: NOTRUN -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-dg2-7/igt@gem_clo=
se_race@multigpu-basic-process.html">SKIP</a> ([i915#7697])</li></ul></li><=
li><p>igt@gem_compute@compute-square:</p><ul><li>shard-mtlp: NOTRUN -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-mtlp-3=
/igt@gem_compute@compute-square.html">SKIP</a> ([i915#9310])</li></ul></li>=
<li><p>igt@gem_ctx_exec@basic-nohangcheck:</p><ul><li>shard-rkl: <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7873/shard-rkl-3/igt@gem_ctx_=
exec@basic-nohangcheck.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_11201/shard-rkl-1/igt@gem_ctx_exec@basic-nohangc=
heck.html">FAIL</a> ([i915#6268])</li></ul></li><li><p>igt@gem_ctx_persiste=
nce@saturated-hostile-nopreempt@vcs0:</p><ul><li>shard-mtlp: NOTRUN -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-mtlp-3=
/igt@gem_ctx_persistence@saturated-hostile-nopreempt@vcs0.html">SKIP</a> ([=
i915#5882]) +5 other tests skip</li></ul></li><li><p>igt@gem_ctx_sseu@engin=
es:</p><ul><li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_11201/shard-dg2-6/igt@gem_ctx_sseu@engines.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/28=
0">i915#280</a>)</li></ul></li><li><p>igt@gem_ctx_sseu@mmap-args:</p><ul><l=
i>shard-mtlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_11201/shard-mtlp-5/igt@gem_ctx_sseu@mmap-args.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#2=
80</a>)</li></ul></li><li><p>igt@gem_eio@kms:</p><ul><li>shard-tglu: NOTRUN=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shar=
d-tglu-4/igt@gem_eio@kms.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/10513">i915#10513</a>)</li><li>shard=
-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_11201/shard-dg2-1/igt@gem_eio@kms.html">INCOMPLETE</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/10513">i915#10513</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982">i91=
5#1982</a>)</li><li>shard-dg1: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_11201/shard-dg1-15/igt@gem_eio@kms.html">INCOMPL=
ETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/10513">i915#10513</a>)</li></ul></li><li><p>igt@gem_exec_balancer@bonded-p=
air:</p><ul><li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11201/shard-dg2-4/igt@gem_exec_balancer@bonded-pair.=
html">SKIP</a> ([i915#4771])</li></ul></li><li><p>igt@gem_exec_balancer@bon=
ded-sync:</p><ul><li>shard-mtlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_11201/shard-mtlp-7/igt@gem_exec_balancer@bonde=
d-sync.html">SKIP</a> ([i915#4771])</li></ul></li><li><p>igt@gem_exec_balan=
cer@parallel-out-fence:</p><ul><li>shard-rkl: NOTRUN -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-rkl-2/igt@gem_exec_ba=
lancer@parallel-out-fence.html">SKIP</a> ([i915#4525]) +2 other tests skip<=
/li></ul></li><li><p>igt@gem_exec_capture@capture-invisible@lmem0:</p><ul><=
li>shard-dg1: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_11201/shard-dg1-13/igt@gem_exec_capture@capture-invisible@lmem0.h=
tml">SKIP</a> ([i915#6334]) +1 other test skip</li></ul></li><li><p>igt@gem=
_exec_capture@capture@vecs0-smem:</p><ul><li>shard-mtlp: NOTRUN -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-mtlp-5/igt=
@gem_exec_capture@capture@vecs0-smem.html">FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/10386">i915#10386</a>)</li></u=
l></li><li><p>igt@gem_exec_capture@many-4k-incremental:</p><ul><li>shard-dg=
1: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1=
1201/shard-dg1-17/igt@gem_exec_capture@many-4k-incremental.html">FAIL</a> (=
[i915#9606])</li></ul></li><li><p>igt@gem_exec_fair@basic-none:</p><ul><li>=
shard-dg1: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_11201/shard-dg1-13/igt@gem_exec_fair@basic-none.html">SKIP</a> ([i91=
5#3539] / [i915#4852]) +5 other tests skip</li></ul></li><li><p>igt@gem_exe=
c_fair@basic-none-rrul:</p><ul><li>shard-mtlp: NOTRUN -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-mtlp-7/igt@gem_exec_=
fair@basic-none-rrul.html">SKIP</a> ([i915#4473] / [i915#4771]) +2 other te=
sts skip</li></ul></li><li><p>igt@gem_exec_fair@basic-none-rrul@rcs0:</p><u=
l><li>shard-glk: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_11201/shard-glk8/igt@gem_exec_fair@basic-none-rrul@rcs0.html">=
FAIL</a> ([i915#2842]) +1 other test fail</li></ul></li><li><p>igt@gem_exec=
_fair@basic-none-share@rcs0:</p><ul><li>shard-tglu: <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/IGT_7873/shard-tglu-6/igt@gem_exec_fair@basic-=
none-share@rcs0.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_11201/shard-tglu-3/igt@gem_exec_fair@basic-none-share@r=
cs0.html">FAIL</a> ([i915#2842])</li></ul></li><li><p>igt@gem_exec_fair@bas=
ic-none@bcs0:</p><ul><li>shard-rkl: NOTRUN -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-rkl-1/igt@gem_exec_fair@basic-n=
one@bcs0.html">FAIL</a> ([i915#2842]) +2 other tests fail</li></ul></li><li=
><p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p><ul><li>shard-rkl: <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7873/shard-rkl-4/igt@gem_e=
xec_fair@basic-pace-solo@rcs0.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-rkl-4/igt@gem_exec_fair@basic=
-pace-solo@rcs0.html">FAIL</a> ([i915#2842])</li></ul></li><li><p>igt@gem_e=
xec_fair@basic-pace@bcs0:</p><ul><li>shard-tglu: NOTRUN -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-tglu-8/igt@gem_exe=
c_fair@basic-pace@bcs0.html">FAIL</a> ([i915#2842]) +4 other tests fail</li=
></ul></li><li><p>igt@gem_exec_fair@basic-sync:</p><ul><li>shard-dg2: NOTRU=
N -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/sha=
rd-dg2-5/igt@gem_exec_fair@basic-sync.html">SKIP</a> ([i915#3539]) +1 other=
 test skip</li></ul></li><li><p>igt@gem_exec_fence@submit:</p><ul><li>shard=
-dg1: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_11201/shard-dg1-17/igt@gem_exec_fence@submit.html">SKIP</a> ([i915#4812])=
 +3 other tests skip</li></ul></li><li><p>igt@gem_exec_fence@submit3:</p><u=
l><li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_11201/shard-dg2-5/igt@gem_exec_fence@submit3.html">SKIP</a> ([=
i915#4812]) +2 other tests skip</li></ul></li><li><p>igt@gem_exec_fence@sub=
mit67:</p><ul><li>shard-mtlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_11201/shard-mtlp-5/igt@gem_exec_fence@submit67.ht=
ml">SKIP</a> ([i915#4812]) +3 other tests skip</li></ul></li><li><p>igt@gem=
_exec_flush@basic-wb-ro-before-default:</p><ul><li>shard-dg2: NOTRUN -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-dg2-5=
/igt@gem_exec_flush@basic-wb-ro-before-default.html">SKIP</a> ([i915#3539] =
/ [i915#4852]) +1 other test skip</li></ul></li><li><p>igt@gem_exec_reloc@b=
asic-active:</p><ul><li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_11201/shard-dg2-8/igt@gem_exec_reloc@basic-a=
ctive.html">SKIP</a> ([i915#3281]) +11 other tests skip</li></ul></li><li><=
p>igt@gem_exec_reloc@basic-scanout:</p><ul><li>shard-dg1: NOTRUN -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-dg1-13/ig=
t@gem_exec_reloc@basic-scanout.html">SKIP</a> ([i915#3281]) +8 other tests =
skip</li></ul></li><li><p>igt@gem_exec_reloc@basic-wc-read-noreloc:</p><ul>=
<li>shard-rkl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_11201/shard-rkl-4/igt@gem_exec_reloc@basic-wc-read-noreloc.html"=
>SKIP</a> ([i915#3281]) +14 other tests skip</li></ul></li><li><p>igt@gem_e=
xec_reloc@basic-write-wc-noreloc:</p><ul><li>shard-mtlp: NOTRUN -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-mtlp-5/igt=
@gem_exec_reloc@basic-write-wc-noreloc.html">SKIP</a> ([i915#3281]) +9 othe=
r tests skip</li></ul></li><li><p>igt@gem_exec_schedule@deep@rcs0:</p><ul><=
li>shard-mtlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_11201/shard-mtlp-1/igt@gem_exec_schedule@deep@rcs0.html">SKIP</a=
> ([i915#4537])</li></ul></li><li><p>igt@gem_exec_schedule@reorder-wide:</p=
><ul><li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_11201/shard-dg2-5/igt@gem_exec_schedule@reorder-wide.html">=
SKIP</a> ([i915#4537] / [i915#4812])</li></ul></li><li><p>igt@gem_exec_sche=
dule@semaphore-power:</p><ul><li>shard-rkl: NOTRUN -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-rkl-5/igt@gem_exec_sche=
dule@semaphore-power.html">SKIP</a> ([i915#7276])</li></ul></li><li><p>igt@=
gem_fence_thrash@bo-copy:</p><ul><li>shard-dg1: NOTRUN -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-dg1-13/igt@gem_fenc=
e_thrash@bo-copy.html">SKIP</a> ([i915#4860]) +2 other tests skip</li></ul>=
</li><li><p>igt@gem_fence_thrash@bo-write-verify-x:</p><ul><li>shard-dg2: N=
OTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201=
/shard-dg2-7/igt@gem_fence_thrash@bo-write-verify-x.html">SKIP</a> ([i915#4=
860]) +1 other test skip</li></ul></li><li><p>igt@gem_fenced_exec_thrash@to=
o-many-fences:</p><ul><li>shard-mtlp: NOTRUN -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-mtlp-3/igt@gem_fenced_exec_th=
rash@too-many-fences.html">SKIP</a> ([i915#4860]) +1 other test skip</li></=
ul></li><li><p>igt@gem_huc_copy@huc-copy:</p><ul><li>shard-rkl: NOTRUN -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-rkl=
-5/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/2190">i915#2190</a>)</li><li>shard-tgl=
u: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1=
1201/shard-tglu-7/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190">i915#2190</a>)</l=
i></ul></li><li><p>igt@gem_lmem_swapping@heavy-verify-multi@lmem0:</p><ul><=
li>shard-dg1: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7873/=
shard-dg1-17/igt@gem_lmem_swapping@heavy-verify-multi@lmem0.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard=
-dg1-17/igt@gem_lmem_swapping@heavy-verify-multi@lmem0.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10378">i915#=
10378</a>)</li></ul></li><li><p>igt@gem_lmem_swapping@heavy-verify-random-c=
cs@lmem0:</p><ul><li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_11201/shard-dg2-5/igt@gem_lmem_swapping@heavy-v=
erify-random-ccs@lmem0.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/10378">i915#10378</a>)</li></ul></li><li><p>=
igt@gem_lmem_swapping@parallel-random-verify:</p><ul><li>shard-rkl: NOTRUN =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard=
-rkl-1/igt@gem_lmem_swapping@parallel-random-verify.html">SKIP</a> ([i915#4=
613]) +4 other tests skip</li><li>shard-mtlp: NOTRUN -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-mtlp-2/igt@gem_lmem_s=
wapping@parallel-random-verify.html">SKIP</a> ([i915#4613]) +3 other tests =
skip</li></ul></li><li><p>igt@gem_lmem_swapping@verify-ccs:</p><ul><li>shar=
d-glk: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_11201/shard-glk5/igt@gem_lmem_swapping@verify-ccs.html">SKIP</a> ([i915#=
4613]) +4 other tests skip</li></ul></li><li><p>igt@gem_lmem_swapping@verif=
y-ccs@lmem0:</p><ul><li>shard-dg1: NOTRUN -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_11201/shard-dg1-16/igt@gem_lmem_swapping@ver=
ify-ccs@lmem0.html">SKIP</a> ([i915#4565]) +1 other test skip</li></ul></li=
><li><p>igt@gem_media_vme:</p><ul><li>shard-mtlp: NOTRUN -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-mtlp-8/igt@gem_me=
dia_vme.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/284">i915#284</a>)</li></ul></li><li><p>igt@gem_mmap_gtt@cp=
uset-basic-small-copy-xy:</p><ul><li>shard-dg1: NOTRUN -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-dg1-15/igt@gem_mmap=
_gtt@cpuset-basic-small-copy-xy.html">SKIP</a> ([i915#4077]) +13 other test=
s skip</li></ul></li><li><p>igt@gem_mmap_gtt@cpuset-big-copy-xy:</p><ul><li=
>shard-mtlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_11201/shard-mtlp-7/igt@gem_mmap_gtt@cpuset-big-copy-xy.html">SKIP<=
/a> ([i915#4077]) +9 other tests skip</li></ul></li><li><p>igt@gem_mmap_gtt=
@fault-concurrent-x:</p><ul><li>shard-dg2: NOTRUN -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-dg2-11/igt@gem_mmap_gtt@=
fault-concurrent-x.html">SKIP</a> ([i915#4077]) +19 other tests skip</li></=
ul></li><li><p>igt@gem_mmap_wc@bad-offset:</p><ul><li>shard-mtlp: NOTRUN -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-m=
tlp-8/igt@gem_mmap_wc@bad-offset.html">SKIP</a> ([i915#4083]) +3 other test=
s skip</li></ul></li><li><p>igt@gem_mmap_wc@invalid-flags:</p><ul><li>shard=
-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_11201/shard-dg2-5/igt@gem_mmap_wc@invalid-flags.html">SKIP</a> ([i915#408=
3]) +8 other tests skip</li></ul></li><li><p>igt@gem_mmap_wc@write-read:</p=
><ul><li>shard-dg1: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_11201/shard-dg1-17/igt@gem_mmap_wc@write-read.html">SKIP</a=
> ([i915#4083]) +5 other tests skip</li></ul></li><li><p>igt@gem_partial_pw=
rite_pread@writes-after-reads:</p><ul><li>shard-rkl: NOTRUN -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-rkl-5/igt@ge=
m_partial_pwrite_pread@writes-after-reads.html">SKIP</a> ([i915#3282]) +4 o=
ther tests skip</li></ul></li><li><p>igt@gem_pread@exhaustion:</p><ul><li>s=
hard-dg1: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_11201/shard-dg1-15/igt@gem_pread@exhaustion.html">SKIP</a> ([i915#328=
2]) +9 other tests skip</li><li>shard-tglu: NOTRUN -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-tglu-4/igt@gem_pread@ex=
haustion.html">WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/2658">i915#2658</a>)</li></ul></li><li><p>igt@gem_pread@sn=
oop:</p><ul><li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11201/shard-dg2-5/igt@gem_pread@snoop.html">SKIP</a>=
 ([i915#3282]) +4 other tests skip</li></ul></li><li><p>igt@gem_pxp@create-=
regular-context-2:</p><ul><li>shard-tglu: NOTRUN -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-tglu-3/igt@gem_pxp@create=
-regular-context-2.html">SKIP</a> ([i915#4270]) +1 other test skip</li></ul=
></li><li><p>igt@gem_pxp@display-protected-crc:</p><ul><li>shard-rkl: NOTRU=
N -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/sha=
rd-rkl-5/igt@gem_pxp@display-protected-crc.html">SKIP</a> ([i915#4270]) +4 =
other tests skip</li></ul></li><li><p>igt@gem_pxp@reject-modify-context-pro=
tection-off-1:</p><ul><li>shard-mtlp: NOTRUN -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-mtlp-8/igt@gem_pxp@reject-mod=
ify-context-protection-off-1.html">SKIP</a> ([i915#4270]) +1 other test ski=
p</li></ul></li><li><p>igt@gem_pxp@verify-pxp-execution-after-suspend-resum=
e:</p><ul><li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_11201/shard-dg2-5/igt@gem_pxp@verify-pxp-execution-aft=
er-suspend-resume.html">SKIP</a> ([i915#4270]) +3 other tests skip</li></ul=
></li><li><p>igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:</p><ul=
><li>shard-dg1: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_11201/shard-dg1-13/igt@gem_pxp@verify-pxp-key-change-after-susp=
end-resume.html">SKIP</a> ([i915#4270]) +2 other tests skip</li></ul></li><=
li><p>igt@gem_readwrite@read-bad-handle:</p><ul><li>shard-mtlp: NOTRUN -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-mtl=
p-4/igt@gem_readwrite@read-bad-handle.html">SKIP</a> ([i915#3282]) +5 other=
 tests skip</li></ul></li><li><p>igt@gem_render_copy@y-tiled-ccs-to-y-tiled=
-mc-ccs:</p><ul><li>shard-glk: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_11201/shard-glk6/igt@gem_render_copy@y-tiled-ccs=
-to-y-tiled-mc-ccs.html">SKIP</a> +272 other tests skip</li></ul></li><li><=
p>igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled:</p><ul><li>shard-mtl=
p: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1=
1201/shard-mtlp-2/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled.html"=
>SKIP</a> ([i915#8428]) +3 other tests skip</li></ul></li><li><p>igt@gem_re=
nder_copy@y-tiled-to-vebox-y-tiled:</p><ul><li>shard-dg2: NOTRUN -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-dg2-11/ig=
t@gem_render_copy@y-tiled-to-vebox-y-tiled.html">SKIP</a> ([i915#5190] / [i=
915#8428]) +6 other tests skip</li></ul></li><li><p>igt@gem_softpin@evict-s=
noop:</p><ul><li>shard-dg1: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_11201/shard-dg1-15/igt@gem_softpin@evict-snoop.html=
">SKIP</a> ([i915#4885])</li></ul></li><li><p>igt@gem_softpin@evict-snoop-i=
nterruptible:</p><ul><li>shard-mtlp: NOTRUN -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-mtlp-5/igt@gem_softpin@evict-s=
noop-interruptible.html">SKIP</a> ([i915#4885])</li></ul></li><li><p>igt@ge=
m_tiled_pread_pwrite:</p><ul><li>shard-mtlp: NOTRUN -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-mtlp-2/igt@gem_tiled_p=
read_pwrite.html">SKIP</a> ([i915#4079]) +2 other tests skip</li></ul></li>=
<li><p>igt@gem_userptr_blits@coherency-sync:</p><ul><li>shard-tglu: NOTRUN =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard=
-tglu-3/igt@gem_userptr_blits@coherency-sync.html">SKIP</a> ([i915#3297])</=
li></ul></li><li><p>igt@gem_userptr_blits@create-destroy-unsync:</p><ul><li=
>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_11201/shard-dg2-4/igt@gem_userptr_blits@create-destroy-unsync.html"=
>SKIP</a> ([i915#3297]) +2 other tests skip</li><li>shard-dg1: NOTRUN -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-dg1-=
15/igt@gem_userptr_blits@create-destroy-unsync.html">SKIP</a> ([i915#3297])=
 +3 other tests skip</li></ul></li><li><p>igt@gem_userptr_blits@dmabuf-sync=
:</p><ul><li>shard-glk: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_11201/shard-glk5/igt@gem_userptr_blits@dmabuf-sync.html=
">SKIP</a> ([i915#3323])</li></ul></li><li><p>igt@gem_userptr_blits@map-fix=
ed-invalidate:</p><ul><li>shard-dg1: NOTRUN -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-dg1-16/igt@gem_userptr_blits@m=
ap-fixed-invalidate.html">SKIP</a> ([i915#3297] / [i915#4880])</li></ul></l=
i><li><p>igt@gem_userptr_blits@relocations:</p><ul><li>shard-dg1: NOTRUN -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-d=
g1-17/igt@gem_userptr_blits@relocations.html">SKIP</a> ([i915#3281] / [i915=
#3297])</li></ul></li><li><p>igt@gem_userptr_blits@sd-probe:</p><ul><li>sha=
rd-dg1: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_11201/shard-dg1-13/igt@gem_userptr_blits@sd-probe.html">SKIP</a> ([i915=
#3297] / [i915#4958])</li></ul></li><li><p>igt@gem_userptr_blits@unsync-ove=
rlap:</p><ul><li>shard-mtlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_11201/shard-mtlp-5/igt@gem_userptr_blits@unsync-ov=
erlap.html">SKIP</a> ([i915#3297]) +3 other tests skip</li></ul></li><li><p=
>igt@gem_userptr_blits@unsync-unmap-after-close:</p><ul><li>shard-rkl: NOTR=
UN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/sh=
ard-rkl-1/igt@gem_userptr_blits@unsync-unmap-after-close.html">SKIP</a> ([i=
915#3297]) +3 other tests skip</li></ul></li><li><p>igt@gen9_exec_parse@all=
owed-all:</p><ul><li>shard-mtlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_11201/shard-mtlp-7/igt@gen9_exec_parse@allowed=
-all.html">SKIP</a> ([i915#2856]) +4 other tests skip</li></ul></li><li><p>=
igt@gen9_exec_parse@bb-start-out:</p><ul><li>shard-rkl: NOTRUN -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-rkl-1/igt@g=
en9_exec_parse@bb-start-out.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) +3 other tests ski=
p</li><li>shard-dg1: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_11201/shard-dg1-14/igt@gen9_exec_parse@bb-start-out.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/2527">i915#2527</a>) +4 other tests skip</li><li>shard-tglu: NOTRUN -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-tglu=
-6/igt@gen9_exec_parse@bb-start-out.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a> / [i915#285=
6])</li></ul></li><li><p>igt@gen9_exec_parse@shadow-peek:</p><ul><li>shard-=
dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_11201/shard-dg2-6/igt@gen9_exec_parse@shadow-peek.html">SKIP</a> ([i915#28=
56]) +2 other tests skip</li></ul></li><li><p>igt@i915_fb_tiling:</p><ul><l=
i>shard-dg1: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_11201/shard-dg1-17/igt@i915_fb_tiling.html">SKIP</a> ([i915#4881])=
</li></ul></li><li><p>igt@i915_module_load@load:</p><ul><li>shard-glk: NOTR=
UN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/sh=
ard-glk6/igt@i915_module_load@load.html">SKIP</a> ([i915#6227])</li></ul></=
li><li><p>igt@i915_module_load@reload-with-fault-injection:</p><ul><li>shar=
d-snb: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7873/shard-s=
nb5/igt@i915_module_load@reload-with-fault-injection.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-snb4/i=
gt@i915_module_load@reload-with-fault-injection.html">INCOMPLETE</a> ([i915=
#9849])</li><li>shard-dg1: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11201/shard-dg1-14/igt@i915_module_load@reload-with-=
fault-injection.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/1982">i915#1982</a> / [i915#9820] / [i915#984=
9])</li></ul></li><li><p>igt@i915_pipe_stress@stress-xrgb8888-ytiled:</p><u=
l><li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_11201/shard-dg2-3/igt@i915_pipe_stress@stress-xrgb8888-ytiled.=
html">SKIP</a> ([i915#7091])</li></ul></li><li><p>igt@i915_pm_freq_api@freq=
-suspend:</p><ul><li>shard-rkl: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_11201/shard-rkl-2/igt@i915_pm_freq_api@freq-sus=
pend.html">SKIP</a> ([i915#8399])</li><li>shard-tglu: NOTRUN -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-tglu-4/igt@i=
915_pm_freq_api@freq-suspend.html">SKIP</a> ([i915#8399])</li></ul></li><li=
><p>igt@i915_pm_freq_mult@media-freq@gt0:</p><ul><li>shard-dg1: NOTRUN -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-dg1=
-17/igt@i915_pm_freq_mult@media-freq@gt0.html">SKIP</a> ([i915#6590])</li><=
/ul></li><li><p>igt@i915_pm_rps@basic-api:</p><ul><li>shard-mtlp: NOTRUN -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-m=
tlp-3/igt@i915_pm_rps@basic-api.html">SKIP</a> ([i915#6621]) +1 other test =
skip</li></ul></li><li><p>igt@i915_pm_rps@min-max-config-loaded:</p><ul><li=
>shard-dg1: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_11201/shard-dg1-15/igt@i915_pm_rps@min-max-config-loaded.html">SKIP=
</a> ([i915#6621])</li></ul></li><li><p>igt@i915_pm_rps@thresholds-park@gt0=
:</p><ul><li>shard-dg1: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_11201/shard-dg1-16/igt@i915_pm_rps@thresholds-park@gt0.=
html">SKIP</a> ([i915#8925])</li></ul></li><li><p>igt@i915_pm_rps@threshold=
s@gt0:</p><ul><li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_11201/shard-dg2-3/igt@i915_pm_rps@thresholds@gt0.h=
tml">SKIP</a> ([i915#8925])</li></ul></li><li><p>igt@i915_power@sanity:</p>=
<ul><li>shard-rkl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_11201/shard-rkl-3/igt@i915_power@sanity.html">SKIP</a> ([i91=
5#7984])</li></ul></li><li><p>igt@i915_query@hwconfig_table:</p><ul><li>sha=
rd-dg1: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_11201/shard-dg1-15/igt@i915_query@hwconfig_table.html">SKIP</a> ([i915#=
6245])</li></ul></li><li><p>igt@i915_query@test-query-geometry-subslices:</=
p><ul><li>shard-rkl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_11201/shard-rkl-5/igt@i915_query@test-query-geometry-subsl=
ices.html">SKIP</a> ([i915#5723])</li></ul></li><li><p>igt@i915_suspend@bas=
ic-s3-without-i915:</p><ul><li>shard-rkl: NOTRUN -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-rkl-5/igt@i915_suspend@ba=
sic-s3-without-i915.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/10031">i915#10031</a>)</li></ul></li><li><p>igt=
@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling:</p><ul><li>shard-dg2: N=
OTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201=
/shard-dg2-3/igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling.html">SK=
IP</a> ([i915#4212])</li></ul></li><li><p>igt@kms_addfb_basic@addfb25-y-til=
ed-small-legacy:</p><ul><li>shard-mtlp: NOTRUN -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-mtlp-8/igt@kms_addfb_basic@=
addfb25-y-tiled-small-legacy.html">SKIP</a> ([i915#5190])</li></ul></li><li=
><p>igt@kms_addfb_basic@bo-too-small-due-to-tiling:</p><ul><li>shard-mtlp: =
NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1120=
1/shard-mtlp-2/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html">SKIP</a=
> ([i915#4212]) +1 other test skip</li></ul></li><li><p>igt@kms_addfb_basic=
@invalid-smem-bo-on-discrete:</p><ul><li>shard-rkl: NOTRUN -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-rkl-1/igt@kms_a=
ddfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a> ([i915#3826])</li></u=
l></li><li><p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-h=
dmi-a-1-y-rc-ccs-cc:</p><ul><li>shard-rkl: NOTRUN -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-rkl-2/igt@kms_async_flip=
s@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc.html">SKIP</=
a> ([i915#8709]) +3 other tests skip</li></ul></li><li><p>igt@kms_async_fli=
ps@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-4-mc-ccs:</p><ul><li>sh=
ard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_11201/shard-dg2-4/igt@kms_async_flips@async-flip-with-page-flip-events=
@pipe-c-hdmi-a-1-4-mc-ccs.html">SKIP</a> ([i915#8709]) +11 other tests skip=
</li></ul></li><li><p>igt@kms_async_flips@invalid-async-flip:</p><ul><li>sh=
ard-mtlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_11201/shard-mtlp-1/igt@kms_async_flips@invalid-async-flip.html">SKIP<=
/a> ([i915#6228])</li></ul></li><li><p>igt@kms_atomic@plane-primary-overlay=
-mutable-zpos:</p><ul><li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-dg2-7/igt@kms_atomic@plane-pri=
mary-overlay-mutable-zpos.html">SKIP</a> ([i915#9531])</li></ul></li><li><p=
>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-pa=
nels:</p><ul><li>shard-dg1: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_11201/shard-dg1-16/igt@kms_atomic_transition@plane-=
all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> =
/ [i915#3555])</li></ul></li><li><p>igt@kms_atomic_transition@plane-all-mod=
eset-transition-internal-panels:</p><ul><li>shard-dg2: NOTRUN -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-dg2-3/igt@km=
s_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17=
69">i915#1769</a> / [i915#3555])</li></ul></li><li><p>igt@kms_big_fb@4-tile=
d-16bpp-rotate-180:</p><ul><li>shard-tglu: NOTRUN -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-tglu-8/igt@kms_big_fb@4-=
tiled-16bpp-rotate-180.html">SKIP</a> ([i915#5286]) +1 other test skip</li>=
</ul></li><li><p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p><ul><li>shard-d=
g1: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
11201/shard-dg1-16/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html">SKIP</a> ([=
i915#4538] / [i915#5286]) +4 other tests skip</li></ul></li><li><p>igt@kms_=
big_fb@4-tiled-addfb:</p><ul><li>shard-rkl: NOTRUN -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-rkl-3/igt@kms_big_fb@4-=
tiled-addfb.html">SKIP</a> ([i915#5286]) +5 other tests skip</li></ul></li>=
<li><p>igt@kms_big_fb@linear-64bpp-rotate-270:</p><ul><li>shard-rkl: NOTRUN=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shar=
d-rkl-1/igt@kms_big_fb@linear-64bpp-rotate-270.html">SKIP</a> ([i915#3638])=
 +3 other tests skip</li></ul></li><li><p>igt@kms_big_fb@y-tiled-64bpp-rota=
te-0:</p><ul><li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_11201/shard-dg2-7/igt@kms_big_fb@y-tiled-64bpp-rota=
te-0.html">SKIP</a> ([i915#4538] / [i915#5190]) +7 other tests skip</li></u=
l></li><li><p>igt@kms_big_fb@y-tiled-8bpp-rotate-270:</p><ul><li>shard-dg1:=
 NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_112=
01/shard-dg1-18/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html">SKIP</a> ([i91=
5#3638]) +4 other tests skip</li></ul></li><li><p>igt@kms_big_fb@y-tiled-ad=
dfb:</p><ul><li>shard-mtlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_11201/shard-mtlp-3/igt@kms_big_fb@y-tiled-addfb.htm=
l">SKIP</a> ([i915#6187])</li></ul></li><li><p>igt@kms_big_fb@y-tiled-addfb=
-size-overflow:</p><ul><li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-dg2-3/igt@kms_big_fb@y-tiled-=
addfb-size-overflow.html">SKIP</a> ([i915#5190]) +2 other tests skip</li></=
ul></li><li><p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:</p><ul=
><li>shard-dg1: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_11201/shard-dg1-18/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-=
rotate-0.html">SKIP</a> ([i915#4538]) +8 other tests skip</li></ul></li><li=
><p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:</p><ul><li>shard-=
mtlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_11201/shard-mtlp-3/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.h=
tml">SKIP</a> +17 other tests skip</li></ul></li><li><p>igt@kms_big_joiner@=
basic:</p><ul><li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_11201/shard-dg2-5/igt@kms_big_joiner@basic.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/10656">i915#10656</a>) +1 other test skip</li><li>shard-rkl: NOTRUN -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-rkl-2=
/igt@kms_big_joiner@basic.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/10656">i915#10656</a>)</li><li>shard-tglu=
: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11=
201/shard-tglu-4/igt@kms_big_joiner@basic.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656">i915#10656</a>)</l=
i></ul></li><li><p>igt@kms_big_joiner@invalid-modeset:</p><ul><li>shard-dg1=
: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11=
201/shard-dg1-15/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656">i915#106=
56</a>) +1 other test skip</li></ul></li><li><p>igt@kms_ccs@bad-aux-stride-=
y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1:</p><ul><li>shard-dg2: NOTRUN -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-dg2-8/i=
gt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1030=
7">i915#10307</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/10434">i915#10434</a> / [i915#6095]) +2 other tests skip</li></=
ul></li><li><p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-c-edp-1:=
</p><ul><li>shard-mtlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_11201/shard-mtlp-4/igt@kms_ccs@bad-rotation-90-4-tiled-=
dg2-mc-ccs@pipe-c-edp-1.html">SKIP</a> ([i915#6095]) +39 other tests skip</=
li></ul></li><li><p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-=
b-hdmi-a-4:</p><ul><li>shard-dg1: NOTRUN -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_11201/shard-dg1-15/igt@kms_ccs@bad-rotation-9=
0-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4.html">SKIP</a> ([i915#6095]) +95 ot=
her tests skip</li></ul></li><li><p>igt@kms_ccs@bad-rotation-90-4-tiled-xe2=
-ccs:</p><ul><li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_11201/shard-dg2-5/igt@kms_ccs@bad-rotation-90-4-til=
ed-xe2-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/10278">i915#10278</a>) +1 other test skip</li></ul></li>=
<li><p>igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-a-hdmi-a-1:</p><ul><li=
>shard-tglu: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_11201/shard-tglu-9/igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-a=
-hdmi-a-1.html">SKIP</a> ([i915#6095]) +23 other tests skip</li></ul></li><=
li><p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a=
-1:</p><ul><li>shard-rkl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_11201/shard-rkl-5/igt@kms_ccs@crc-primary-rotation-18=
0-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1.html">SKIP</a> ([i915#6095]) +73 other=
 tests skip</li></ul></li><li><p>igt@kms_ccs@crc-primary-rotation-180-4-til=
ed-xe2-ccs:</p><ul><li>shard-dg1: NOTRUN -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_11201/shard-dg1-17/igt@kms_ccs@crc-primary-ro=
tation-180-4-tiled-xe2-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/10278">i915#10278</a>)</li><li>shard-tgl=
u: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1=
1201/shard-tglu-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/10278">i915#10278</a>)</li></ul></li><li><p>igt@kms_ccs@crc-sprite-plan=
es-basic-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1:</p><ul><li>shard-dg2: NOTRUN=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shar=
d-dg2-4/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-d-hdm=
i-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/10307">i915#10307</a> / [i915#6095]) +160 other tests skip</l=
i></ul></li><li><p>igt@kms_cdclk@mode-transition-all-outputs:</p><ul><li>sh=
ard-mtlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_11201/shard-mtlp-7/igt@kms_cdclk@mode-transition-all-outputs.html">SK=
IP</a> ([i915#7213] / [i915#9010])</li></ul></li><li><p>igt@kms_cdclk@mode-=
transition@pipe-b-hdmi-a-2:</p><ul><li>shard-dg2: NOTRUN -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-dg2-2/igt@kms_cdc=
lk@mode-transition@pipe-b-hdmi-a-2.html">SKIP</a> ([i915#7213]) +3 other te=
sts skip</li></ul></li><li><p>igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3:<=
/p><ul><li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_11201/shard-dg2-6/igt@kms_cdclk@plane-scaling@pipe-b-hdmi=
-a-3.html">SKIP</a> ([i915#4087]) +3 other tests skip</li></ul></li><li><p>=
igt@kms_chamelium_audio@hdmi-audio-edid:</p><ul><li>shard-dg1: NOTRUN -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-dg1-=
15/igt@kms_chamelium_audio@hdmi-audio-edid.html">SKIP</a> ([i915#7828]) +14=
 other tests skip</li></ul></li><li><p>igt@kms_chamelium_edid@hdmi-edid-cha=
nge-during-suspend:</p><ul><li>shard-rkl: NOTRUN -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-rkl-3/igt@kms_chamelium_e=
did@hdmi-edid-change-during-suspend.html">SKIP</a> ([i915#7828]) +14 other =
tests skip</li></ul></li><li><p>igt@kms_chamelium_frames@dp-crc-multiple:</=
p><ul><li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_11201/shard-dg2-4/igt@kms_chamelium_frames@dp-crc-multiple=
.html">SKIP</a> ([i915#7828]) +9 other tests skip</li></ul></li><li><p>igt@=
kms_chamelium_hpd@dp-hpd-after-suspend:</p><ul><li>shard-tglu: NOTRUN -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-tglu=
-6/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html">SKIP</a> ([i915#7828]) =
+6 other tests skip</li></ul></li><li><p>igt@kms_chamelium_hpd@vga-hpd-enab=
le-disable-mode:</p><ul><li>shard-mtlp: NOTRUN -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-mtlp-2/igt@kms_chamelium_hp=
d@vga-hpd-enable-disable-mode.html">SKIP</a> ([i915#7828]) +9 other tests s=
kip</li></ul></li><li><p>igt@kms_content_protection@atomic-dpms:</p><ul><li=
>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_11201/shard-dg2-5/igt@kms_content_protection@atomic-dpms.html">SKIP=
</a> ([i915#7118] / [i915#9424])</li></ul></li><li><p>igt@kms_content_prote=
ction@dp-mst-lic-type-0:</p><ul><li>shard-dg2: NOTRUN -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-dg2-4/igt@kms_conten=
t_protection@dp-mst-lic-type-0.html">SKIP</a> ([i915#3299])</li></ul></li><=
li><p>igt@kms_content_protection@dp-mst-type-0:</p><ul><li>shard-rkl: NOTRU=
N -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/sha=
rd-rkl-6/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> ([i915#311=
6])</li></ul></li><li><p>igt@kms_content_protection@lic-type-0:</p><ul><li>=
shard-mtlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_11201/shard-mtlp-8/igt@kms_content_protection@lic-type-0.html">SKIP=
</a> ([i915#6944] / [i915#9424]) +1 other test skip</li></ul></li><li><p>ig=
t@kms_content_protection@lic-type-1:</p><ul><li>shard-dg2: NOTRUN -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-dg2-5/ig=
t@kms_content_protection@lic-type-1.html">SKIP</a> ([i915#9424]) +1 other t=
est skip</li><li>shard-rkl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_11201/shard-rkl-2/igt@kms_content_protection@lic-ty=
pe-1.html">SKIP</a> ([i915#9424])</li><li>shard-tglu: NOTRUN -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-tglu-4/igt@k=
ms_content_protection@lic-type-1.html">SKIP</a> ([i915#6944] / [i915#9424])=
</li></ul></li><li><p>igt@kms_content_protection@srm@pipe-a-dp-4:</p><ul><l=
i>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_11201/shard-dg2-11/igt@kms_content_protection@srm@pipe-a-dp-4.html=
">TIMEOUT</a> ([i915#7173])</li></ul></li><li><p>igt@kms_cursor_crc@cursor-=
offscreen-32x32:</p><ul><li>shard-dg1: NOTRUN -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-dg1-15/igt@kms_cursor_crc@cu=
rsor-offscreen-32x32.html">SKIP</a> ([i915#3555]) +6 other tests skip</li><=
/ul></li><li><p>igt@kms_cursor_crc@cursor-onscreen-32x32:</p><ul><li>shard-=
rkl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_11201/shard-rkl-5/igt@kms_cursor_crc@cursor-onscreen-32x32.html">SKIP</a> =
([i915#3555]) +12 other tests skip</li></ul></li><li><p>igt@kms_cursor_crc@=
cursor-random-256x85:</p><ul><li>shard-mtlp: NOTRUN -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-mtlp-8/igt@kms_cursor_=
crc@cursor-random-256x85.html">SKIP</a> ([i915#8814])</li></ul></li><li><p>=
igt@kms_cursor_crc@cursor-random-32x10:</p><ul><li>shard-mtlp: NOTRUN -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-mtlp=
-5/igt@kms_cursor_crc@cursor-random-32x10.html">SKIP</a> ([i915#3555] / [i9=
15#8814]) +1 other test skip</li></ul></li><li><p>igt@kms_cursor_crc@cursor=
-random-512x170:</p><ul><li>shard-rkl: NOTRUN -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-rkl-5/igt@kms_cursor_crc@cur=
sor-random-512x170.html">SKIP</a> ([i915#3359]) +1 other test skip</li><li>=
shard-mtlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_11201/shard-mtlp-5/igt@kms_cursor_crc@cursor-random-512x170.html">S=
KIP</a> ([i915#3359])</li></ul></li><li><p>igt@kms_cursor_crc@cursor-random=
-512x512:</p><ul><li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_11201/shard-dg2-5/igt@kms_cursor_crc@cursor-ran=
dom-512x512.html">SKIP</a> ([i915#3359]) +2 other tests skip</li></ul></li>=
<li><p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p><ul><li>shard-t=
glu: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_11201/shard-tglu-5/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">=
SKIP</a> ([i915#3359]) +1 other test skip</li></ul></li><li><p>igt@kms_curs=
or_crc@cursor-sliding-512x512:</p><ul><li>shard-dg1: NOTRUN -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-dg1-17/igt@k=
ms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> ([i915#3359]) +1 other =
test skip</li></ul></li><li><p>igt@kms_cursor_legacy@2x-nonblocking-modeset=
-vs-cursor-atomic:</p><ul><li>shard-mtlp: NOTRUN -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-mtlp-7/igt@kms_cursor_leg=
acy@2x-nonblocking-modeset-vs-cursor-atomic.html">SKIP</a> ([i915#9809]) +3=
 other tests skip</li></ul></li><li><p>igt@kms_cursor_legacy@basic-busy-fli=
p-before-cursor-varying-size:</p><ul><li>shard-tglu: NOTRUN -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-tglu-9/igt@k=
ms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> =
([i915#4103])</li></ul></li><li><p>igt@kms_cursor_legacy@modeset-atomic-cur=
sor-hotspot:</p><ul><li>shard-rkl: NOTRUN -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_11201/shard-rkl-3/igt@kms_cursor_legacy@mode=
set-atomic-cursor-hotspot.html">SKIP</a> ([i915#9067])</li></ul></li><li><p=
>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-var=
ying-size:</p><ul><li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_11201/shard-dg2-3/igt@kms_cursor_legacy@short-=
busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> ([i9=
15#4103] / [i915#4213]) +1 other test skip</li></ul></li><li><p>igt@kms_cur=
sor_legacy@short-busy-flip-before-cursor-toggle:</p><ul><li>shard-mtlp: NOT=
RUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/s=
hard-mtlp-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html=
">SKIP</a> ([i915#4213])</li><li>shard-rkl: NOTRUN -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-rkl-4/igt@kms_cursor_le=
gacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> ([i915#4103])</li>=
</ul></li><li><p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p><ul><li>shard-rkl: =
NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1120=
1/shard-rkl-1/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> ([i915#9723=
])</li><li>shard-mtlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_11201/shard-mtlp-2/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.ht=
ml">SKIP</a> ([i915#9833])</li></ul></li><li><p>igt@kms_display_modes@exten=
ded-mode-basic:</p><ul><li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-dg2-4/igt@kms_display_modes@e=
xtended-mode-basic.html">SKIP</a> ([i915#3555]) +9 other tests skip</li></u=
l></li><li><p>igt@kms_display_modes@mst-extended-mode-negative:</p><ul><li>=
shard-dg1: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_11201/shard-dg1-15/igt@kms_display_modes@mst-extended-mode-negative.=
html">SKIP</a> ([i915#8588])</li></ul></li><li><p>igt@kms_draw_crc@draw-met=
hod-mmap-gtt:</p><ul><li>shard-dg1: NOTRUN -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-dg1-13/igt@kms_draw_crc@draw-me=
thod-mmap-gtt.html">SKIP</a> ([i915#8812])</li></ul></li><li><p>igt@kms_dsc=
@dsc-fractional-bpp-with-bpc:</p><ul><li>shard-rkl: NOTRUN -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-rkl-1/igt@kms_d=
sc@dsc-fractional-bpp-with-bpc.html">SKIP</a> ([i915#3840])</li><li>shard-d=
g1: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
11201/shard-dg1-14/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> (=
[i915#3840])</li></ul></li><li><p>igt@kms_dsc@dsc-with-output-formats:</p><=
ul><li>shard-mtlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_11201/shard-mtlp-2/igt@kms_dsc@dsc-with-output-formats.html"=
>SKIP</a> ([i915#3555] / [i915#3840])</li><li>shard-dg2: NOTRUN -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-dg2-2/igt@=
kms_dsc@dsc-with-output-formats.html">SKIP</a> ([i915#3555] / [i915#3840])<=
/li><li>shard-dg1: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_11201/shard-dg1-13/igt@kms_dsc@dsc-with-output-formats.html"=
>SKIP</a> ([i915#3555] / [i915#3840]) +1 other test skip</li></ul></li><li>=
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p><ul><li>shard-dg1: NOTR=
UN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/sh=
ard-dg1-15/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> ([i9=
15#3840] / [i915#9053])</li></ul></li><li><p>igt@kms_fbcon_fbt@psr:</p><ul>=
<li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_11201/shard-dg2-3/igt@kms_fbcon_fbt@psr.html">SKIP</a> ([i915#34=
69]) +1 other test skip</li></ul></li><li><p>igt@kms_feature_discovery@cham=
elium:</p><ul><li>shard-tglu: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_11201/shard-tglu-7/igt@kms_feature_discovery@cham=
elium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/2065">i915#2065</a> / [i915#4854])</li><li>shard-dg2: NOTRUN =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard=
-dg2-6/igt@kms_feature_discovery@chamelium.html">SKIP</a> ([i915#4854])</li=
><li>shard-rkl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_11201/shard-rkl-5/igt@kms_feature_discovery@chamelium.html">SKI=
P</a> ([i915#4854])</li><li>shard-dg1: NOTRUN -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-dg1-15/igt@kms_feature_disco=
very@chamelium.html">SKIP</a> ([i915#4854])</li></ul></li><li><p>igt@kms_fe=
ature_discovery@dp-mst:</p><ul><li>shard-dg2: NOTRUN -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-dg2-7/igt@kms_feature=
_discovery@dp-mst.html">SKIP</a> ([i915#9337])</li></ul></li><li><p>igt@kms=
_flip@2x-absolute-wf_vblank-interruptible:</p><ul><li>shard-mtlp: NOTRUN -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-m=
tlp-2/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html">SKIP</a> ([i91=
5#3637]) +1 other test skip</li></ul></li><li><p>igt@kms_flip@2x-nonexistin=
g-fb:</p><ul><li>shard-tglu: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_11201/shard-tglu-7/igt@kms_flip@2x-nonexisting-fb.=
html">SKIP</a> ([i915#3637]) +1 other test skip</li></ul></li><li><p>igt@km=
s_flip@2x-plain-flip-fb-recreate-interruptible:</p><ul><li>shard-dg1: NOTRU=
N -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/sha=
rd-dg1-17/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">SKIP</=
a> ([i915#9934]) +10 other tests skip</li></ul></li><li><p>igt@kms_flip@2x-=
plain-flip-ts-check-interruptible@ab-vga1-hdmi-a1:</p><ul><li>shard-snb: <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7873/shard-snb7/igt@k=
ms_flip@2x-plain-flip-ts-check-interruptible@ab-vga1-hdmi-a1.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shar=
d-snb7/igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-vga1-hdmi-a1.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/2122">i915#2122</a>)</li></ul></li><li><p>igt@kms_flip_scaled_crc@fli=
p-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-default-mode:</p><ul><li>=
shard-mtlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_11201/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64b=
pp-linear-downscaling@pipe-a-default-mode.html">SKIP</a> ([i915#3555] / [i9=
15#8810]) +2 other tests skip</li></ul></li><li><p>igt@kms_flip_scaled_crc@=
flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:</p><ul><li>s=
hard-rkl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_11201/shard-rkl-4/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-=
yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a>) +3 other te=
sts skip</li><li>shard-dg1: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_11201/shard-dg1-18/igt@kms_flip_scaled_crc@flip-32b=
pp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587">i915#25=
87</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/2672">i915#2672</a>) +4 other tests skip</li><li>shard-tglu: NOTRUN -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-tglu-=
4/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-=
a-valid-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/2587">i915#2587</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a>) +1 other test skip<=
/li></ul></li><li><p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-=
yftile-downscaling@pipe-a-valid-mode:</p><ul><li>shard-dg2: NOTRUN -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-dg2-6/i=
gt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pip=
e-a-valid-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/2672">i915#2672</a>) +5 other tests skip</li></ul></=
li><li><p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs=
-upscaling@pipe-a-default-mode:</p><ul><li>shard-mtlp: NOTRUN -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-mtlp-3/igt@k=
ms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe=
-a-default-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/2672">i915#2672</a>) +1 other test skip</li></ul></=
li><li><p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-down=
scaling@pipe-a-default-mode:</p><ul><li>shard-mtlp: NOTRUN -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-mtlp-7/igt@kms_=
flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-def=
ault-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/2672">i915#2672</a> / [i915#3555])</li></ul></li><li><p>i=
gt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-gtt:</p><ul=
><li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_11201/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-=
cur-indfb-draw-mmap-gtt.html">SKIP</a> ([i915#8708]) +19 other tests skip</=
li></ul></li><li><p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-=
draw-mmap-cpu:</p><ul><li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-dg2-6/igt@kms_frontbuffer_trac=
king@fbc-1p-primscrn-pri-indfb-draw-mmap-cpu.html">FAIL</a> ([i915#6880]) +=
1 other test fail</li></ul></li><li><p>igt@kms_frontbuffer_tracking@fbc-2p-=
pri-indfb-multidraw:</p><ul><li>shard-snb: <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGT_7873/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p=
-pri-indfb-multidraw.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_11201/shard-snb5/igt@kms_frontbuffer_tracking@fbc-=
2p-pri-indfb-multidraw.html">SKIP</a> +3 other tests skip</li></ul></li><li=
><p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p=
><ul><li>shard-dg1: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_11201/shard-dg1-16/igt@kms_frontbuffer_tracking@fbc-2p-scnd=
scrn-spr-indfb-draw-mmap-wc.html">SKIP</a> ([i915#8708]) +27 other tests sk=
ip</li></ul></li><li><p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p><ul><=
li>shard-rkl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_11201/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-tiling-4.html"=
>SKIP</a> ([i915#5439]) +1 other test skip</li><li>shard-dg1: NOTRUN -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-dg1-1=
6/igt@kms_frontbuffer_tracking@fbc-tiling-4.html">SKIP</a> ([i915#5439])</l=
i><li>shard-tglu: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_11201/shard-tglu-9/igt@kms_frontbuffer_tracking@fbc-tiling-4.=
html">SKIP</a> ([i915#5439])</li></ul></li><li><p>igt@kms_frontbuffer_track=
ing@fbcpsr-2p-primscrn-cur-indfb-move:</p><ul><li>shard-rkl: NOTRUN -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-rkl-3/=
igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825=
">i915#1825</a>) +58 other tests skip</li></ul></li><li><p>igt@kms_frontbuf=
fer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-cpu:</p><ul><li>shard-m=
tlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_11201/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shr=
fb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/1825">i915#1825</a>) +39 other tests skip</li></ul=
></li><li><p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-b=
lt:</p><ul><li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_11201/shard-dg2-2/igt@kms_frontbuffer_tracking@fbcpsr=
-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> ([i915#5354]) +38 other tests =
skip</li></ul></li><li><p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-dra=
w-mmap-wc:</p><ul><li>shard-rkl: NOTRUN -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_11201/shard-rkl-2/igt@kms_frontbuffer_tracking=
@fbcpsr-rgb101010-draw-mmap-wc.html">SKIP</a> ([i915#3023]) +33 other tests=
 skip</li></ul></li><li><p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-dr=
aw-pwrite:</p><ul><li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_11201/shard-dg2-4/igt@kms_frontbuffer_tracking=
@fbcpsr-rgb101010-draw-pwrite.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/10433">i915#10433</a> / [i915#3458])<=
/li></ul></li><li><p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p><ul><=
li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_11201/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/10055">i915#10055</a>)</li></ul></li><li><p>igt@kms_frontbuffer_track=
ing@plane-fbc-rte:</p><ul><li>shard-mtlp: NOTRUN -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-mtlp-4/igt@kms_frontbuffe=
r_tracking@plane-fbc-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/10070">i915#10070</a>)</li></ul></li><li><=
p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-pwrite:</p><u=
l><li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_11201/shard-dg2-3/igt@kms_frontbuffer_tracking@psr-1p-offscren=
-pri-shrfb-draw-pwrite.html">SKIP</a> ([i915#3458]) +19 other tests skip</l=
i></ul></li><li><p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-d=
raw-mmap-cpu:</p><ul><li>shard-tglu: NOTRUN -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-tglu-10/igt@kms_frontbuffer_tr=
acking@psr-1p-primscrn-spr-indfb-draw-mmap-cpu.html">SKIP</a> +55 other tes=
ts skip</li></ul></li><li><p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-s=
pr-indfb-draw-mmap-gtt:</p><ul><li>shard-mtlp: NOTRUN -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-mtlp-5/igt@kms_front=
buffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> ([i9=
15#8708]) +8 other tests skip</li></ul></li><li><p>igt@kms_frontbuffer_trac=
king@psr-rgb565-draw-pwrite:</p><ul><li>shard-dg1: NOTRUN -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-dg1-15/igt@kms_f=
rontbuffer_tracking@psr-rgb565-draw-pwrite.html">SKIP</a> ([i915#3458]) +17=
 other tests skip</li></ul></li><li><p>igt@kms_hdr@bpc-switch-suspend:</p><=
ul><li>shard-tglu: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_11201/shard-tglu-6/igt@kms_hdr@bpc-switch-suspend.html">SKIP=
</a> ([i915#3555] / [i915#8228]) +2 other tests skip</li></ul></li><li><p>i=
gt@kms_hdr@static-toggle-dpms:</p><ul><li>shard-mtlp: NOTRUN -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-mtlp-7/igt@k=
ms_hdr@static-toggle-dpms.html">SKIP</a> ([i915#3555] / [i915#8228])</li></=
ul></li><li><p>igt@kms_hdr@static-toggle-suspend:</p><ul><li>shard-dg2: NOT=
RUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/s=
hard-dg2-8/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> ([i915#3555] / =
[i915#8228]) +3 other tests skip</li><li>shard-rkl: NOTRUN -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-rkl-5/igt@kms_h=
dr@static-toggle-suspend.html">SKIP</a> ([i915#3555] / [i915#8228]) +1 othe=
r test skip</li><li>shard-dg1: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_11201/shard-dg1-16/igt@kms_hdr@static-toggle-sus=
pend.html">SKIP</a> ([i915#3555] / [i915#8228]) +2 other tests skip</li></u=
l></li><li><p>igt@kms_panel_fitting@atomic-fastset:</p><ul><li>shard-rkl: N=
OTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201=
/shard-rkl-4/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> ([i915#630=
1]) +1 other test skip</li></ul></li><li><p>igt@kms_pipe_b_c_ivb@from-pipe-=
c-to-b-with-3-lanes:</p><ul><li>shard-dg2: NOTRUN -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-dg2-2/igt@kms_pipe_b_c_i=
vb@from-pipe-c-to-b-with-3-lanes.html">SKIP</a> +26 other tests skip</li></=
ul></li><li><p>igt@kms_plane_lowres@tiling-4@pipe-b-edp-1:</p><ul><li>shard=
-mtlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_11201/shard-mtlp-1/igt@kms_plane_lowres@tiling-4@pipe-b-edp-1.html">SKIP=
</a> ([i915#3582]) +3 other tests skip</li></ul></li><li><p>igt@kms_plane_l=
owres@tiling-y:</p><ul><li>shard-mtlp: NOTRUN -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-mtlp-2/igt@kms_plane_lowres@=
tiling-y.html">SKIP</a> ([i915#3555] / [i915#8821])</li></ul></li><li><p>ig=
t@kms_plane_multiple@tiling-y:</p><ul><li>shard-dg2: NOTRUN -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-dg2-8/igt@km=
s_plane_multiple@tiling-y.html">SKIP</a> ([i915#8806])</li></ul></li><li><p=
>igt@kms_plane_multiple@tiling-yf:</p><ul><li>shard-dg2: NOTRUN -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-dg2-11/igt=
@kms_plane_multiple@tiling-yf.html">SKIP</a> ([i915#3555] / [i915#8806])</l=
i></ul></li><li><p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p><ul><li>s=
hard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_11201/shard-dg2-5/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SK=
IP</a> ([i915#5354] / [i915#9423])</li></ul></li><li><p>igt@kms_plane_scali=
ng@plane-downscale-factor-0-25-with-pixel-format@pipe-a-hdmi-a-1:</p><ul><l=
i>shard-tglu: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_11201/shard-tglu-8/igt@kms_plane_scaling@plane-downscale-factor-0=
-25-with-pixel-format@pipe-a-hdmi-a-1.html">SKIP</a> ([i915#9423]) +3 other=
 tests skip</li></ul></li><li><p>igt@kms_plane_scaling@plane-downscale-fact=
or-0-25-with-pixel-format@pipe-c-hdmi-a-1:</p><ul><li>shard-dg2: NOTRUN -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-dg=
2-4/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pip=
e-c-hdmi-a-1.html">SKIP</a> ([i915#9423]) +7 other tests skip</li></ul></li=
><li><p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pip=
e-a-hdmi-a-2:</p><ul><li>shard-rkl: NOTRUN -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-rkl-3/igt@kms_plane_scaling@pla=
ne-downscale-factor-0-75-with-rotation@pipe-a-hdmi-a-2.html">SKIP</a> ([i91=
5#9423]) +7 other tests skip</li></ul></li><li><p>igt@kms_plane_scaling@pla=
ne-scaler-with-clipping-clamping-rotation@pipe-a-hdmi-a-1:</p><ul><li>shard=
-rkl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_11201/shard-rkl-4/igt@kms_plane_scaling@plane-scaler-with-clipping-clampi=
ng-rotation@pipe-a-hdmi-a-1.html">SKIP</a> ([i915#5176] / [i915#9423]) +1 o=
ther test skip</li></ul></li><li><p>igt@kms_plane_scaling@plane-upscale-fac=
tor-0-25-with-rotation@pipe-a-hdmi-a-3:</p><ul><li>shard-dg1: NOTRUN -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-dg1-1=
3/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-a-hdmi=
-a-3.html">SKIP</a> ([i915#9423]) +11 other tests skip</li></ul></li><li><p=
>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b-hd=
mi-a-2:</p><ul><li>shard-rkl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_11201/shard-rkl-3/igt@kms_plane_scaling@planes-do=
wnscale-factor-0-25-upscale-20x20@pipe-b-hdmi-a-2.html">SKIP</a> ([i915#523=
5]) +5 other tests skip</li></ul></li><li><p>igt@kms_plane_scaling@planes-d=
ownscale-factor-0-25@pipe-c-hdmi-a-4:</p><ul><li>shard-dg1: NOTRUN -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-dg1-16/=
igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-c-hdmi-a-4.html">SK=
IP</a> ([i915#5235]) +7 other tests skip</li></ul></li><li><p>igt@kms_plane=
_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-d-edp-1:</p><ul><li=
>shard-mtlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_11201/shard-mtlp-6/igt@kms_plane_scaling@planes-unity-scaling-down=
scale-factor-0-5@pipe-d-edp-1.html">SKIP</a> ([i915#5235]) +3 other tests s=
kip</li></ul></li><li><p>igt@kms_plane_scaling@planes-upscale-factor-0-25-d=
ownscale-factor-0-25@pipe-a-hdmi-a-3:</p><ul><li>shard-dg2: NOTRUN -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-dg2-7/i=
gt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-=
a-hdmi-a-3.html">SKIP</a> ([i915#5235] / [i915#9423]) +23 other tests skip<=
/li></ul></li><li><p>igt@kms_pm_backlight@bad-brightness:</p><ul><li>shard-=
rkl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_11201/shard-rkl-3/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> ([i91=
5#5354])</li><li>shard-tglu: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_11201/shard-tglu-5/igt@kms_pm_backlight@bad-bright=
ness.html">SKIP</a> ([i915#9812])</li></ul></li><li><p>igt@kms_pm_dc@dc5-ps=
r:</p><ul><li>shard-dg1: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_11201/shard-dg1-18/igt@kms_pm_dc@dc5-psr.html">SKIP</a=
> ([i915#9685]) +2 other tests skip</li></ul></li><li><p>igt@kms_pm_dc@dc9-=
dpms:</p><ul><li>shard-tglu: <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGT_7873/shard-tglu-10/igt@kms_pm_dc@dc9-dpms.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-tglu-8/=
igt@kms_pm_dc@dc9-dpms.html">SKIP</a> ([i915#4281])</li></ul></li><li><p>ig=
t@kms_pm_lpsp@screens-disabled:</p><ul><li>shard-mtlp: NOTRUN -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-mtlp-4/igt@k=
ms_pm_lpsp@screens-disabled.html">SKIP</a> ([i915#8430])</li></ul></li><li>=
<p>igt@kms_pm_rpm@modeset-lpsp:</p><ul><li>shard-dg2: <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGT_7873/shard-dg2-4/igt@kms_pm_rpm@modeset-=
lpsp.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_11201/shard-dg2-11/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> ([i9=
15#9519]) +2 other tests skip</li></ul></li><li><p>igt@kms_pm_rpm@modeset-l=
psp-stress-no-wait:</p><ul><li>shard-dg1: NOTRUN -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-dg1-16/igt@kms_pm_rpm@mod=
eset-lpsp-stress-no-wait.html">SKIP</a> ([i915#9519])</li></ul></li><li><p>=
igt@kms_pm_rpm@modeset-non-lpsp:</p><ul><li>shard-mtlp: NOTRUN -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-mtlp-3/igt@=
kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> ([i915#9519]) +1 other test skip=
</li></ul></li><li><p>igt@kms_prime@basic-crc-hybrid:</p><ul><li>shard-rkl:=
 NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_112=
01/shard-rkl-1/igt@kms_prime@basic-crc-hybrid.html">SKIP</a> ([i915#6524])<=
/li></ul></li><li><p>igt@kms_prime@basic-crc-vgem:</p><ul><li>shard-dg2: NO=
TRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/=
shard-dg2-8/igt@kms_prime@basic-crc-vgem.html">SKIP</a> ([i915#6524] / [i91=
5#6805])</li></ul></li><li><p>igt@kms_prime@d3hot:</p><ul><li>shard-mtlp: N=
OTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201=
/shard-mtlp-1/igt@kms_prime@d3hot.html">SKIP</a> ([i915#6524]) +1 other tes=
t skip</li></ul></li><li><p>igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg=
-area:</p><ul><li>shard-dg1: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_11201/shard-dg1-15/igt@kms_psr2_sf@fbc-overlay-pla=
ne-update-sf-dmg-area.html">SKIP</a> +59 other tests skip</li></ul></li><li=
><p>igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area@psr2-pipe-a-edp-1:=
</p><ul><li>shard-mtlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_11201/shard-mtlp-6/igt@kms_psr2_sf@fbc-primary-plane-up=
date-sf-dmg-area@psr2-pipe-a-edp-1.html">SKIP</a> ([i915#9808]) +3 other te=
sts skip</li></ul></li><li><p>igt@kms_psr2_su@page_flip-nv12:</p><ul><li>sh=
ard-mtlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_11201/shard-mtlp-8/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> ([i9=
15#4348])</li></ul></li><li><p>igt@kms_psr2_su@page_flip-p010:</p><ul><li>s=
hard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_11201/shard-dg2-3/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> ([i91=
5#9683])</li><li>shard-rkl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_11201/shard-rkl-3/igt@kms_psr2_su@page_flip-p010.ht=
ml">SKIP</a> ([i915#9683]) +1 other test skip</li><li>shard-dg1: NOTRUN -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-dg=
1-13/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> ([i915#9683]) +1 other t=
est skip</li><li>shard-tglu: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_11201/shard-tglu-5/igt@kms_psr2_su@page_flip-p010.=
html">SKIP</a> ([i915#9683]) +1 other test skip</li></ul></li><li><p>igt@km=
s_psr@fbc-pr-primary-blt:</p><ul><li>shard-mtlp: NOTRUN -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-mtlp-3/igt@kms_psr=
@fbc-pr-primary-blt.html">SKIP</a> ([i915#9688]) +9 other tests skip</li></=
ul></li><li><p>igt@kms_psr@fbc-psr-basic:</p><ul><li>shard-dg2: NOTRUN -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-dg2=
-11/igt@kms_psr@fbc-psr-basic.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / [i915#9673] / [=
i915#9732]) +1 other test skip</li></ul></li><li><p>igt@kms_psr@pr-basic:</=
p><ul><li>shard-tglu: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_11201/shard-tglu-7/igt@kms_psr@pr-basic.html">SKIP</a> ([=
i915#9732]) +13 other tests skip</li></ul></li><li><p>igt@kms_psr@psr-sprit=
e-mmap-cpu:</p><ul><li>shard-dg1: NOTRUN -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_11201/shard-dg1-15/igt@kms_psr@psr-sprite-mma=
p-cpu.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/1072">i915#1072</a> / [i915#9732]) +29 other tests skip</li><=
/ul></li><li><p>igt@kms_psr@psr2-cursor-blt:</p><ul><li>shard-dg2: NOTRUN -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-=
dg2-3/igt@kms_psr@psr2-cursor-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / [i915#9732]=
) +22 other tests skip</li></ul></li><li><p>igt@kms_psr@psr2-cursor-mmap-gt=
t:</p><ul><li>shard-rkl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_11201/shard-rkl-2/igt@kms_psr@psr2-cursor-mmap-gtt.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/1072">i915#1072</a> / [i915#9732]) +27 other tests skip</li></ul></li>=
<li><p>igt@kms_psr@psr2-sprite-mmap-gtt@edp-1:</p><ul><li>shard-mtlp: NOTRU=
N -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/sha=
rd-mtlp-7/igt@kms_psr@psr2-sprite-mmap-gtt@edp-1.html">SKIP</a> ([i915#4077=
] / [i915#9688])</li></ul></li><li><p>igt@kms_psr_stress_test@invalidate-pr=
imary-flip-overlay:</p><ul><li>shard-dg2: NOTRUN -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-dg2-11/igt@kms_psr_stress=
_test@invalidate-primary-flip-overlay.html">SKIP</a> ([i915#9685]) +1 other=
 test skip</li></ul></li><li><p>igt@kms_rotation_crc@bad-tiling:</p><ul><li=
>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_11201/shard-dg2-5/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> ([=
i915#4235])</li></ul></li><li><p>igt@kms_rotation_crc@exhaust-fences:</p><u=
l><li>shard-dg1: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_11201/shard-dg1-15/igt@kms_rotation_crc@exhaust-fences.html">S=
KIP</a> ([i915#4884])</li></ul></li><li><p>igt@kms_rotation_crc@primary-yf-=
tiled-reflect-x-0:</p><ul><li>shard-rkl: NOTRUN -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-rkl-5/igt@kms_rotation_crc=
@primary-yf-tiled-reflect-x-0.html">SKIP</a> ([i915#5289])</li><li>shard-dg=
1: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1=
1201/shard-dg1-15/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">S=
KIP</a> ([i915#5289])</li></ul></li><li><p>igt@kms_rotation_crc@primary-yf-=
tiled-reflect-x-180:</p><ul><li>shard-mtlp: NOTRUN -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-mtlp-5/igt@kms_rotation=
_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> ([i915#5289])</li></ul><=
/li><li><p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p><ul><li>sh=
ard-mtlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_11201/shard-mtlp-3/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.=
html">SKIP</a> ([i915#4235]) +2 other tests skip</li></ul></li><li><p>igt@k=
ms_scaling_modes@scaling-mode-full-aspect:</p><ul><li>shard-tglu: NOTRUN -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-t=
glu-6/igt@kms_scaling_modes@scaling-mode-full-aspect.html">SKIP</a> ([i915#=
3555]) +5 other tests skip</li></ul></li><li><p>igt@kms_vrr@flip-suspend:</=
p><ul><li>shard-mtlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_11201/shard-mtlp-6/igt@kms_vrr@flip-suspend.html">SKIP</a=
> ([i915#3555] / [i915#8808])</li></ul></li><li><p>igt@kms_vrr@max-min:</p>=
<ul><li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_11201/shard-dg2-3/igt@kms_vrr@max-min.html">SKIP</a> ([i915#=
9906])</li></ul></li><li><p>igt@kms_vrr@seamless-rr-switch-virtual:</p><ul>=
<li>shard-dg1: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_11201/shard-dg1-18/igt@kms_vrr@seamless-rr-switch-virtual.html">=
SKIP</a> ([i915#9906])</li></ul></li><li><p>igt@kms_writeback@writeback-che=
ck-output:</p><ul><li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_11201/shard-dg2-5/igt@kms_writeback@writeback-=
check-output.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/2437">i915#2437</a>) +1 other test skip</li><li>shard-=
dg1: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_11201/shard-dg1-18/igt@kms_writeback@writeback-check-output.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437">=
i915#2437</a>)</li><li>shard-mtlp: NOTRUN -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_11201/shard-mtlp-3/igt@kms_writeback@writeba=
ck-check-output.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/2437">i915#2437</a>)</li></ul></li><li><p>igt@perf@=
gen8-unprivileged-single-ctx-counters:</p><ul><li>shard-dg2: NOTRUN -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-dg2-5/=
igt@perf@gen8-unprivileged-single-ctx-counters.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2436">i915#2436</a>)=
</li><li>shard-rkl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_11201/shard-rkl-3/igt@perf@gen8-unprivileged-single-ctx-cou=
nters.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/2436">i915#2436</a>)</li></ul></li><li><p>igt@perf@mi-rpc:</p=
><ul><li>shard-mtlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_11201/shard-mtlp-7/igt@perf@mi-rpc.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2434">i915#2434=
</a>)</li></ul></li><li><p>igt@perf@per-context-mode-unprivileged:</p><ul><=
li>shard-dg1: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_11201/shard-dg1-14/igt@perf@per-context-mode-unprivileged.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/2433">i915#2433</a>)</li></ul></li><li><p>igt@perf_pmu@busy-double-start@v=
ecs1:</p><ul><li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_11201/shard-dg2-7/igt@perf_pmu@busy-double-start@ve=
cs1.html">FAIL</a> ([i915#4349]) +3 other tests fail</li></ul></li><li><p>i=
gt@perf_pmu@cpu-hotplug:</p><ul><li>shard-mtlp: NOTRUN -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-mtlp-5/igt@perf_pmu=
@cpu-hotplug.html">SKIP</a> ([i915#8850])</li></ul></li><li><p>igt@perf_pmu=
@faulting-read@gtt:</p><ul><li>shard-mtlp: NOTRUN -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-mtlp-3/igt@perf_pmu@faul=
ting-read@gtt.html">SKIP</a> ([i915#8440])</li></ul></li><li><p>igt@prime_v=
gem@basic-fence-read:</p><ul><li>shard-mtlp: NOTRUN -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-mtlp-8/igt@prime_vgem@=
basic-fence-read.html">SKIP</a> ([i915#3708])</li></ul></li><li><p>igt@prim=
e_vgem@coherency-gtt:</p><ul><li>shard-dg2: NOTRUN -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-dg2-5/igt@prime_vgem@co=
herency-gtt.html">SKIP</a> ([i915#3708] / [i915#4077]) +1 other test skip</=
li><li>shard-rkl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_11201/shard-rkl-3/igt@prime_vgem@coherency-gtt.html">SKIP</a>=
 ([i915#3708]) +1 other test skip</li></ul></li><li><p>igt@sriov_basic@bind=
-unbind-vf:</p><ul><li>shard-rkl: NOTRUN -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_11201/shard-rkl-2/igt@sriov_basic@bind-unbind=
-vf.html">SKIP</a> ([i915#9917])</li><li>shard-mtlp: NOTRUN -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-mtlp-3/igt@s=
riov_basic@bind-unbind-vf.html">SKIP</a> ([i915#9917])</li></ul></li><li><p=
>igt@sriov_basic@enable-vfs-autoprobe-on:</p><ul><li>shard-dg1: NOTRUN -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-dg1=
-14/igt@sriov_basic@enable-vfs-autoprobe-on.html">SKIP</a> ([i915#9917])</l=
i></ul></li><li><p>igt@syncobj_timeline@invalid-wait-zero-handles:</p><ul><=
li>shard-dg1: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_11201/shard-dg1-18/igt@syncobj_timeline@invalid-wait-zero-handles=
.html">FAIL</a> ([i915#9781])</li></ul></li><li><p>igt@tools_test@sysfs_l3_=
parity:</p><ul><li>shard-rkl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_11201/shard-rkl-5/igt@tools_test@sysfs_l3_parity.=
html">SKIP</a> +52 other tests skip</li></ul></li><li><p>igt@v3d/v3d_mmap@m=
map-bo:</p><ul><li>shard-mtlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_11201/shard-mtlp-3/igt@v3d/v3d_mmap@mmap-bo.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/2575">i915#2575</a>) +10 other tests skip</li></ul></li><li><p>igt@v3d/=
v3d_submit_cl@job-perfmon:</p><ul><li>shard-dg1: NOTRUN -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-dg1-16/igt@v3d/v3d=
_submit_cl@job-perfmon.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +15 other tests skip</l=
i></ul></li><li><p>igt@v3d/v3d_submit_csd@single-out-sync:</p><ul><li>shard=
-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_11201/shard-dg2-3/igt@v3d/v3d_submit_csd@single-out-sync.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i9=
15#2575</a>) +15 other tests skip</li></ul></li><li><p>igt@vc4/vc4_mmap@mma=
p-bad-handle:</p><ul><li>shard-dg1: NOTRUN -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-dg1-15/igt@vc4/vc4_mmap@mmap-ba=
d-handle.html">SKIP</a> ([i915#7711]) +13 other tests skip</li></ul></li><l=
i><p>igt@vc4/vc4_perfmon@create-two-perfmon:</p><ul><li>shard-rkl: NOTRUN -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-=
rkl-4/igt@vc4/vc4_perfmon@create-two-perfmon.html">SKIP</a> ([i915#7711]) +=
14 other tests skip</li></ul></li><li><p>igt@vc4/vc4_perfmon@get-values-inv=
alid-pointer:</p><ul><li>shard-tglu: NOTRUN -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-tglu-3/igt@vc4/vc4_perfmon@get=
-values-invalid-pointer.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +12 other tests skip</=
li></ul></li><li><p>igt@vc4/vc4_purgeable_bo@access-purged-bo-mem:</p><ul><=
li>shard-mtlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_11201/shard-mtlp-2/igt@vc4/vc4_purgeable_bo@access-purged-bo-mem=
.html">SKIP</a> ([i915#7711]) +8 other tests skip</li></ul></li><li><p>igt@=
vc4/vc4_tiling@set-bad-modifier:</p><ul><li>shard-dg2: NOTRUN -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-dg2-6/igt@vc=
4/vc4_tiling@set-bad-modifier.html">SKIP</a> ([i915#7711]) +6 other tests s=
kip</li></ul></li></ul><h4>Possible fixes</h4><ul><li><p>igt@gem_eio@unwedg=
e-stress:</p><ul><li>shard-dg1: <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGT_7873/shard-dg1-15/igt@gem_eio@unwedge-stress.html">FAIL</a> ([=
i915#5784]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_11201/shard-dg1-16/igt@gem_eio@unwedge-stress.html">PASS</a></li></ul></li=
><li><p>igt@gem_lmem_swapping@basic@lmem0:</p><ul><li>shard-dg2: <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7873/shard-dg2-8/igt@gem_lmem=
_swapping@basic@lmem0.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/10378">i915#10378</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-dg2-8/igt@gem_lmem_sw=
apping@basic@lmem0.html">PASS</a> +1 other test pass</li></ul></li><li><p>i=
gt@gem_lmem_swapping@heavy-random@lmem0:</p><ul><li>shard-dg1: <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGT_7873/shard-dg1-17/igt@gem_lmem_=
swapping@heavy-random@lmem0.html">FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/10378">i915#10378</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-dg1-15/igt@gem_=
lmem_swapping@heavy-random@lmem0.html">PASS</a></li></ul></li><li><p>igt@i9=
15_module_load@reload-with-fault-injection:</p><ul><li>shard-rkl: <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7873/shard-rkl-3/igt@i915_=
module_load@reload-with-fault-injection.html">ABORT</a> ([i915#9820]) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-rkl-=
4/igt@i915_module_load@reload-with-fault-injection.html">PASS</a></li></ul>=
</li><li><p>igt@i915_module_load@resize-bar:</p><ul><li>shard-dg2: <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7873/shard-dg2-8/igt@i915_=
module_load@resize-bar.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_11201/shard-dg2-1/igt@i915_module_load@resize-ba=
r.html">PASS</a> +2 other tests pass</li></ul></li><li><p>igt@i915_pm_rc6_r=
esidency@rc6-idle@gt0-rcs0:</p><ul><li>shard-dg1: <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGT_7873/shard-dg1-16/igt@i915_pm_rc6_residency@=
rc6-idle@gt0-rcs0.html">FAIL</a> ([i915#3591]) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-dg1-13/igt@i915_pm_rc6_resi=
dency@rc6-idle@gt0-rcs0.html">PASS</a></li></ul></li><li><p>igt@kms_cursor_=
legacy@cursor-vs-flip-varying-size:</p><ul><li>shard-dg2: <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGT_7873/shard-dg2-5/igt@kms_cursor_lega=
cy@cursor-vs-flip-varying-size.html">INCOMPLETE</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/10670">i915#10670</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-dg2-3/=
igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html">PASS</a></li></ul><=
/li><li><p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varyin=
g-size:</p><ul><li>shard-snb: <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGT_7873/shard-snb2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-tr=
ansitions-varying-size.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_11201/shard-snb7/igt@kms_cursor_legacy@cursorb-v=
s-flipb-atomic-transitions-varying-size.html">PASS</a> +3 other tests pass<=
/li></ul></li><li><p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ab-vga1-hdm=
i-a1:</p><ul><li>shard-snb: <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGT_7873/shard-snb7/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ab-vga1=
-hdmi-a1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/2122">i915#2122</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_11201/shard-snb5/igt@kms_flip@2x-flip-vs-blockin=
g-wf-vblank@ab-vga1-hdmi-a1.html">PASS</a></li></ul></li><li><p>igt@kms_fro=
ntbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt:</p><ul><li>shard-dg2: <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7873/shard-dg2-7/igt=
@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt.html">FAIL</a> (=
[i915#6880]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_11201/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plfl=
ip-blt.html">PASS</a></li></ul></li><li><p>igt@kms_plane@pixel-format@pipe-=
b:</p><ul><li>shard-mtlp: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGT_7873/shard-mtlp-3/igt@kms_plane@pixel-format@pipe-b.html">ABORT</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard=
-mtlp-8/igt@kms_plane@pixel-format@pipe-b.html">PASS</a></li></ul></li><li>=
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p><ul><li>shard-rkl: <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7873/shard-rkl-2/igt@kms_p=
m_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> ([i915#9519]) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-rkl-3/igt@km=
s_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS</a> +2 other tests pass</li></=
ul></li><li><p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p><ul><li>shard=
-dg2: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7873/shard-dg=
2-5/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> ([i915#9519])=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shar=
d-dg2-8/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">PASS</a></li></ul>=
</li><li><p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:</p><ul><li=
>shard-mtlp: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7873/s=
hard-mtlp-7/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html">FAIL<=
/a> ([i915#9196]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_11201/shard-mtlp-4/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp=
-1.html">PASS</a> +1 other test pass</li></ul></li><li><p>igt@syncobj_timel=
ine@etime-multi-wait-all-submitted:</p><ul><li>shard-dg2: <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGT_7873/shard-dg2-8/igt@syncobj_timelin=
e@etime-multi-wait-all-submitted.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-dg2-7/igt@sy=
ncobj_timeline@etime-multi-wait-all-submitted.html">PASS</a> +20 other test=
s pass</li></ul></li></ul><h4>Warnings</h4><ul><li><p>igt@drm_fdinfo@all-bu=
sy-check-all:</p><ul><li>shard-dg2: <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGT_7873/shard-dg2-8/igt@drm_fdinfo@all-busy-check-all.html">S=
KIP</a> ([i915#5608]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_11201/shard-dg2-8/igt@drm_fdinfo@all-busy-check-all.html">SKIP</=
a> ([i915#8414])</li></ul></li><li><p>igt@gem_exec_fair@basic-pace-share:</=
p><ul><li>shard-dg2: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
T_7873/shard-dg2-8/igt@gem_exec_fair@basic-pace-share.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#25=
75</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_112=
01/shard-dg2-5/igt@gem_exec_fair@basic-pace-share.html">SKIP</a> ([i915#353=
9] / [i915#4852]) +1 other test skip</li></ul></li><li><p>igt@gem_exec_fenc=
e@concurrent:</p><ul><li>shard-dg2: <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGT_7873/shard-dg2-8/igt@gem_exec_fence@concurrent.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/257=
5">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_11201/shard-dg2-4/igt@gem_exec_fence@concurrent.html">SKIP</a> ([i91=
5#4812])</li></ul></li><li><p>igt@gem_exec_reloc@basic-wc-active:</p><ul><l=
i>shard-dg2: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7873/s=
hard-dg2-8/igt@gem_exec_reloc@basic-wc-active.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard=
-dg2-11/igt@gem_exec_reloc@basic-wc-active.html">SKIP</a> ([i915#3281]) +3 =
other tests skip</li></ul></li><li><p>igt@gem_fenced_exec_thrash@no-spare-f=
ences:</p><ul><li>shard-dg2: <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGT_7873/shard-dg2-8/igt@gem_fenced_exec_thrash@no-spare-fences.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_11201/shard-dg2-6/igt@gem_fenced_exec_thrash@no-spare-fences.h=
tml">SKIP</a> ([i915#4860])</li></ul></li><li><p>igt@gem_mmap_wc@write-wc-r=
ead-gtt:</p><ul><li>shard-dg2: <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGT_7873/shard-dg2-8/igt@gem_mmap_wc@write-wc-read-gtt.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575=
">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_11201/shard-dg2-8/igt@gem_mmap_wc@write-wc-read-gtt.html">SKIP</a> ([=
i915#4083])</li></ul></li><li><p>igt@gem_readwrite@write-bad-handle:</p><ul=
><li>shard-dg2: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_787=
3/shard-dg2-8/igt@gem_readwrite@write-bad-handle.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/sh=
ard-dg2-7/igt@gem_readwrite@write-bad-handle.html">SKIP</a> ([i915#3282]) +=
1 other test skip</li></ul></li><li><p>igt@gem_render_copy@yf-tiled:</p><ul=
><li>shard-dg2: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_787=
3/shard-dg2-8/igt@gem_render_copy@yf-tiled.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a> / [i=
915#5190]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
11201/shard-dg2-6/igt@gem_render_copy@yf-tiled.html">SKIP</a> ([i915#5190] =
/ [i915#8428])</li></ul></li><li><p>igt@gem_tiled_partial_pwrite_pread@writ=
es:</p><ul><li>shard-dg2: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGT_7873/shard-dg2-8/igt@gem_tiled_partial_pwrite_pread@writes.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2=
575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_11201/shard-dg2-5/igt@gem_tiled_partial_pwrite_pread@writes.html">=
SKIP</a> ([i915#4077]) +2 other tests skip</li></ul></li><li><p>igt@gen9_ex=
ec_parse@cmd-crossing-page:</p><ul><li>shard-dg2: <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGT_7873/shard-dg2-8/igt@gen9_exec_parse@cmd-cro=
ssing-page.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_11201/shard-dg2-4/igt@gen9_exec_parse@cmd-cros=
sing-page.html">SKIP</a> ([i915#2856])</li></ul></li><li><p>igt@i915_module=
_load@reload-with-fault-injection:</p><ul><li>shard-dg2: <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGT_7873/shard-dg2-4/igt@i915_module_load=
@reload-with-fault-injection.html">INCOMPLETE</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/1982">i915#1982</a> / [i915#9820=
] / [i915#9849]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_11201/shard-dg2-1/igt@i915_module_load@reload-with-fault-injection.ht=
ml">INCOMPLETE</a> ([i915#9820] / [i915#9849])</li></ul></li><li><p>igt@kms=
_addfb_basic@tile-pitch-mismatch:</p><ul><li>shard-dg2: <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGT_7873/shard-dg2-8/igt@kms_addfb_basic@t=
ile-pitch-mismatch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-dg2-5/igt@kms_addfb_basic@=
tile-pitch-mismatch.html">SKIP</a> ([i915#4212])</li></ul></li><li><p>igt@k=
ms_big_fb@y-tiled-32bpp-rotate-90:</p><ul><li>shard-dg2: <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGT_7873/shard-dg2-8/igt@kms_big_fb@y-til=
ed-32bpp-rotate-90.html">SKIP</a> ([i915#5190]) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-dg2-8/igt@kms_big_fb@y-til=
ed-32bpp-rotate-90.html">SKIP</a> ([i915#4538] / [i915#5190]) +1 other test=
 skip</li></ul></li><li><p>igt@kms_chamelium_audio@hdmi-audio:</p><ul><li>s=
hard-dg2: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7873/shar=
d-dg2-8/igt@kms_chamelium_audio@hdmi-audio.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-dg=
2-11/igt@kms_chamelium_audio@hdmi-audio.html">SKIP</a> ([i915#7828])</li></=
ul></li><li><p>igt@kms_content_protection@dp-mst-lic-type-1:</p><ul><li>sha=
rd-dg2: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7873/shard-=
dg2-8/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201=
/shard-dg2-5/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> ([=
i915#3299])</li></ul></li><li><p>igt@kms_content_protection@srm:</p><ul><li=
>shard-snb: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7873/sh=
ard-snb4/igt@kms_content_protection@srm.html">SKIP</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-snb7/igt@kms_conten=
t_protection@srm.html">INCOMPLETE</a> ([i915#8816])</li></ul></li><li><p>ig=
t@kms_content_protection@uevent:</p><ul><li>shard-dg2: <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGT_7873/shard-dg2-8/igt@kms_content_protec=
tion@uevent.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_11201/shard-dg2-3/igt@kms_content_protection@=
uevent.html">SKIP</a> ([i915#7118] / [i915#9424])</li></ul></li><li><p>igt@=
kms_dsc@dsc-basic:</p><ul><li>shard-dg2: <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGT_7873/shard-dg2-8/igt@kms_dsc@dsc-basic.html">SKIP</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shar=
d-dg2-4/igt@kms_dsc@dsc-basic.html">SKIP</a> ([i915#3555] / [i915#3840])</l=
i></ul></li><li><p>igt@kms_flip@2x-flip-vs-wf_vblank:</p><ul><li>shard-dg2:=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7873/shard-dg2-8/i=
gt@kms_flip@2x-flip-vs-wf_vblank.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-dg2-6/igt@km=
s_flip@2x-flip-vs-wf_vblank.html">SKIP</a> +1 other test skip</li></ul></li=
><li><p>igt@kms_force_connector_basic@prune-stale-modes:</p><ul><li>shard-d=
g2: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7873/shard-dg2-=
8/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201=
/shard-dg2-4/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a>=
 ([i915#5274])</li></ul></li><li><p>igt@kms_frontbuffer_tracking@fbc-rgb565=
-draw-mmap-wc:</p><ul><li>shard-dg2: <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGT_7873/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-rgb565-=
draw-mmap-wc.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_11201/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-rgb565-=
draw-mmap-wc.html">SKIP</a> ([i915#8708]) +3 other tests skip</li></ul></li=
><li><p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-rend=
er:</p><ul><li>shard-dg2: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGT_7873/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur=
-indfb-draw-render.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11201/shard-dg2-5/igt@kms_frontbuffer_tracking@fbcps=
r-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> ([i915#3458]) +2 other t=
ests skip</li></ul></li><li><p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4=
:</p><ul><li>shard-dg2: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7873/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
10433">i915#10433</a> / [i915#3458]) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_11201/shard-dg2-7/igt@kms_frontbuffer_tracking@fb=
cpsr-tiling-4.html">SKIP</a> ([i915#3458]) +2 other tests skip</li></ul></l=
i><li><p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt:</p>=
<ul><li>shard-dg2: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_=
7873/shard-dg2-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-=
blt.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_11201/shard-dg2-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrf=
b-pgflip-blt.html">SKIP</a> ([i915#5354]) +3 other tests skip</li></ul></li=
><li><p>igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:</p><ul><li>sh=
ard-dg2: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7873/shard=
-dg2-8/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html">SKIP</a> =
([i915#3458]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_11201/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/10433">i915#10433</a> / [i915#3458]) +1 other test skip</li></ul></l=
i><li><p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p><ul><li>sha=
rd-rkl: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7873/shard-=
rkl-4/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> ([i=
915#4816]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
11201/shard-rkl-2/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">=
SKIP</a> ([i915#4070] / [i915#4816])</li></ul></li><li><p>igt@kms_psr@fbc-p=
r-sprite-blt:</p><ul><li>shard-dg2: <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGT_7873/shard-dg2-3/igt@kms_psr@fbc-pr-sprite-blt.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/107=
2">i915#1072</a> / [i915#9732]) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_11201/shard-dg2-11/igt@kms_psr@fbc-pr-sprite-blt.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/1072">i915#1072</a> / [i915#9673] / [i915#9732]) +11 other tests skip</l=
i></ul></li><li><p>igt@kms_psr@fbc-psr-suspend:</p><ul><li>shard-dg2: <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7873/shard-dg2-11/igt@km=
s_psr@fbc-psr-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / [i915#9673] / [i915#973=
2]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/s=
hard-dg2-7/igt@kms_psr@fbc-psr-suspend.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / [i915#=
9732]) +2 other tests skip</li></ul></li><li><p>igt@kms_psr@pr-sprite-blt:<=
/p><ul><li>shard-dg2: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GT_7873/shard-dg2-8/igt@kms_psr@pr-sprite-blt.html">SKIP</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-dg2-4/igt@km=
s_psr@pr-sprite-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/1072">i915#1072</a> / [i915#9732]) +1 other tes=
t skip</li></ul></li><li><p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-=
0:</p><ul><li>shard-dg2: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_7873/shard-dg2-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/2575">i915#2575</a> / [i915#5190]) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_11201/shard-dg2-5/igt@kms_rotation_crc@primary=
-y-tiled-reflect-x-0.html">SKIP</a> ([i915#5190])</li></ul></li><li><p>igt@=
kms_rotation_crc@sprite-rotation-90:</p><ul><li>shard-dg2: <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGT_7873/shard-dg2-8/igt@kms_rotation_c=
rc@sprite-rotation-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-dg2-6/igt@kms_rotation_=
crc@sprite-rotation-90.html">SKIP</a> ([i915#4235]) +1 other test skip</li>=
</ul></li><li><p>igt@kms_setmode@basic-clone-single-crtc:</p><ul><li>shard-=
dg2: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7873/shard-dg2=
-8/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11201/shard-dg=
2-4/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> ([i915#3555]) +1=
 other test skip</li></ul></li><li><p>igt@kms_writeback@writeback-pixel-for=
mats:</p><ul><li>shard-dg2: <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGT_7873/shard-dg2-8/igt@kms_writeback@writeback-pixel-formats.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_11201/shard-dg2-6/igt@kms_writeback@writeback-pixel-formats.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/2437">i915#2437</a> / [i915#9412])</li></ul></li></ul><p>[i915#</p></bl=
ockquote><div><br></div><div><span></span></div></body></html>

--=-LBYVDlFmPGsDHFASTLG3--
