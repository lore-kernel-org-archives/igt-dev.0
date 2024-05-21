Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B960EC25B74
	for <igt-dev@archiver.kernel.org>; Tue, 21 May 2024 07:51:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8FF210E2A5;
	Tue, 21 May 2024 07:51:31 +0000 (UTC)
Received: from coelho.fi (paleale.coelho.fi [176.9.41.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87D7D10E2A5
 for <igt-dev@lists.freedesktop.org>; Tue, 21 May 2024 07:51:28 +0000 (UTC)
Received: from 91-156-7-239.elisa-laajakaista.fi ([91.156.7.239]
 helo=[192.168.100.137])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.97) (envelope-from <luca@coelho.fi>)
 id 1s9KHL-000000016hA-1cDK; Tue, 21 May 2024 10:51:26 +0300
Message-ID: <a7b3248ee47b0aff76dbcb5b9e5bcb5de27006e1.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: igt-dev@lists.freedesktop.org, Luca Coelho <luciano.coelho@intel.com>
Date: Tue, 21 May 2024 10:51:22 +0300
In-Reply-To: <171626815645.2162015.8604858161410343671@8e613ede5ea5>
References: <20240520092216.150083-1-luciano.coelho@intel.com>
 <171626815645.2162015.8604858161410343671@8e613ede5ea5>
Content-Type: multipart/alternative; boundary="=-Vj0j8uviD0SyAuVxdzbS"
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
Subject: Re: =?UTF-8?Q?=E2=9C=97?= Fi.CI.IGT: failure for lib/igt_kms: add
 retry loop in igt_enable_connectors() (rev3)
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

--=-Vj0j8uviD0SyAuVxdzbS
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

These failures are not related to this patchseries, since the new code
doesn't even run in these tests.

--
Cheers,
Luca.


On Tue, 2024-05-21 at 05:09 +0000, Patchwork wrote:
> Patch Details
> Series:lib/igt_kms: add retry loop in igt_enable_connectors() (rev3)
> URL:https://patchwork.freedesktop.org/series/133597/
> State:failure
> Details:
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/index.html
> CI Bug Log - changes from IGT_7864_full -> IGTPW_11160_fullSummaryFAILURE
> Serious unknown changes coming with IGTPW_11160_full absolutely need
> to be
> verified manually.
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_11160_full, please notify your bug team (I915-ci-
> infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives
> in CI.
> External URL: https://intel-gfx-ci.01.org/tree/drm-
> tip/IGTPW_11160/index.html
> Participating hosts (9 -> 9)No changes in participating hosts
> Possible new issuesHere are the unknown changes that may have been introd=
uced in
> IGTPW_11160_full:
> IGT changesPossible regressions * igt@gem_exec_schedule@deep@ccs0:shard-m=
tlp: PASS -> INCOMPLETE
>  * igt@kms_vrr@seamless-rr-switch-virtual:shard-mtlp: NOTRUN -> SKIP
> New testsNew tests have been introduced between IGT_7864_full and
> IGTPW_11160_full:
> New IGT tests (5) * igt@kms_plane_lowres@tiling-4@pipe-a-hdmi-a-1:Statuse=
s : 1
>    pass(s)Exec time: [7.83] s
>  * igt@kms_plane_lowres@tiling-4@pipe-b-hdmi-a-1:Statuses : 1
>    pass(s)Exec time: [7.36] s
>  * igt@kms_plane_lowres@tiling-4@pipe-c-hdmi-a-1:Statuses : 1
>    pass(s)Exec time: [7.56] s
>  * igt@kms_plane_lowres@tiling-4@pipe-d-hdmi-a-1:Statuses : 1
>    pass(s)Exec time: [7.46] s
>  * igt@perf@oa-exponents@1-vcs1:Statuses : 1 pass(s)Exec time: [1.83] s
> Known issuesHere are the changes found in IGTPW_11160_full that come from=
 known
> issues:
> IGT changesIssues hit * igt@drm_fdinfo@busy-check-all@bcs0:shard-dg1: NOT=
RUN -> SKIP
>    (i915#8414) +8 other tests skip
>  * igt@drm_fdinfo@busy@rcs0:shard-dg2: NOTRUN -> SKIP (i915#8414) +16
>    other tests skip
>  * igt@drm_fdinfo@virtual-busy-idle-all:shard-mtlp: NOTRUN -> SKIP
>    (i915#8414)
>  * igt@gem_ccs@block-copy-compressed:shard-dg1: NOTRUN -> SKIP
>    (i915#3555 / i915#9323) +1 other test skipshard-rkl: NOTRUN -> SKIP
>    (i915#3555 / i915#9323)
>  * igt@gem_ccs@block-multicopy-compressed:shard-rkl: NOTRUN -> SKIP
>    (i915#9323)
>  * igt@gem_ccs@suspend-resume:shard-tglu: NOTRUN -> SKIP (i915#9323) +1
>    other test skip
>  * igt@gem_create@create-ext-cpu-access-big:shard-rkl: NOTRUN -> SKIP
>    (i915#6335)
>  * igt@gem_create@create-ext-cpu-access-sanity-check:shard-mtlp: NOTRUN
>    -> SKIP (i915#6335) +1 other test skip
>  * igt@gem_create@create-ext-set-pat:shard-rkl: NOTRUN -> SKIP
>    (i915#8562)
>  * igt@gem_ctx_persistence@heartbeat-stop:shard-dg1: NOTRUN -> SKIP
>    (i915#8555) +1 other test skip
>  * igt@gem_eio@reset-stress:shard-dg2: PASS -> FAIL (i915#5784)
>  * igt@gem_exec_balancer@bonded-dual:shard-dg1: NOTRUN -> SKIP
>    (i915#4771)
>  * igt@gem_exec_balancer@bonded-true-hang:shard-dg2: NOTRUN -> SKIP
>    (i915#4812) +2 other tests skip
>  * igt@gem_exec_balancer@noheartbeat:shard-dg2: NOTRUN -> SKIP
>    (i915#8555)
>  * igt@gem_exec_balancer@parallel-keep-in-fence:shard-rkl: NOTRUN ->
>    SKIP (i915#4525)
>  * igt@gem_exec_capture@capture-invisible@smem0:shard-mtlp: NOTRUN ->
>    SKIP (i915#6334)
>  * igt@gem_exec_capture@many-4k-incremental:shard-dg2: NOTRUN -> FAIL
>    (i915#9606)shard-dg1: NOTRUN -> FAIL (i915#9606)
>  * igt@gem_exec_capture@many-4k-zero:shard-tglu: NOTRUN -> FAIL
>    (i915#9606)shard-rkl: NOTRUN -> FAIL (i915#9606)
>  * igt@gem_exec_fair@basic-flow:shard-dg1: NOTRUN -> SKIP (i915#3539 /
>    i915#4852) +2 other tests skip
>  * igt@gem_exec_fair@basic-none-solo@rcs0:shard-rkl: PASS -> FAIL
>    (i915#2842)
>  * igt@gem_exec_fair@basic-pace-solo:shard-dg2: NOTRUN -> SKIP
>    (i915#3539) +1 other test skip
>  * igt@gem_exec_fence@concurrent:shard-mtlp: NOTRUN -> SKIP (i915#4812)
>    +2 other tests skip
>  * igt@gem_exec_flush@basic-wb-pro-default:shard-dg2: NOTRUN -> SKIP
>    (i915#3539 / i915#4852)
>  * igt@gem_exec_reloc@basic-cpu-noreloc:shard-mtlp: NOTRUN -> SKIP
>    (i915#3281) +5 other tests skip
>  * igt@gem_exec_reloc@basic-wc-gtt-noreloc:shard-dg1: NOTRUN -> SKIP
>    (i915#3281) +9 other tests skip
>  * igt@gem_exec_reloc@basic-write-gtt:shard-dg2: NOTRUN -> SKIP
>    (i915#3281) +5 other tests skip
>  * igt@gem_exec_reloc@basic-write-read-noreloc:shard-rkl: NOTRUN ->
>    SKIP (i915#3281) +8 other tests skip
>  * igt@gem_exec_schedule@preempt-queue-chain:shard-dg2: NOTRUN -> SKIP
>    (i915#4537 / i915#4812)
>  * igt@gem_exec_schedule@preempt-queue-contexts-chain:shard-mtlp:
>    NOTRUN -> SKIP (i915#4537 / i915#4812)
>  * igt@gem_exec_schedule@semaphore-power:shard-dg1: NOTRUN -> SKIP
>    (i915#4812) +3 other tests skip
>  * igt@gem_exec_schedule@u-fairslice:shard-snb: NOTRUN -> SKIP +29
>    other tests skip
>  * igt@gem_fence_thrash@bo-copy:shard-dg1: NOTRUN -> SKIP (i915#4860)
>    +2 other tests skip
>  * igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible:shard-
>    dg2: NOTRUN -> SKIP (i915#4860)
>  * igt@gem_fenced_exec_thrash@too-many-fences:shard-mtlp: NOTRUN ->
>    SKIP (i915#4860)
>  * igt@gem_huc_copy@huc-copy:shard-glk: NOTRUN -> SKIP (i915#2190)
>  * igt@gem_lmem_evict@dontneed-evict-race:shard-rkl: NOTRUN -> SKIP
>    (i915#4613 / i915#7582)
>  * igt@gem_lmem_swapping@basic@lmem0:shard-dg2: PASS -> FAIL
>    (i915#10378) +1 other test fail
>  * igt@gem_lmem_swapping@heavy-random@lmem0:shard-dg1: NOTRUN -> FAIL
>    (i915#10378) +1 other test fail
>  * igt@gem_lmem_swapping@parallel-random-verify:shard-rkl: NOTRUN ->
>    SKIP (i915#4613) +3 other tests skip
>  * igt@gem_lmem_swapping@random-engines:shard-glk: NOTRUN -> SKIP
>    (i915#4613) +4 other tests skip
>  * igt@gem_lmem_swapping@verify-random:shard-tglu: NOTRUN -> SKIP
>    (i915#4613) +1 other test skip
>  * igt@gem_media_vme:shard-dg2: NOTRUN -> SKIP (i915#284)shard-rkl:
>    NOTRUN -> SKIP (i915#284)
>  * igt@gem_mmap_gtt@basic-read-write:shard-mtlp: NOTRUN -> SKIP
>    (i915#4077) +6 other tests skip
>  * igt@gem_mmap_gtt@basic-small-copy-odd:shard-dg1: NOTRUN -> SKIP
>    (i915#4077) +9 other tests skip
>  * igt@gem_mmap_gtt@isolation:shard-dg2: NOTRUN -> SKIP (i915#4077) +4
>    other tests skip
>  * igt@gem_mmap_offset@clear@smem0:shard-mtlp: PASS -> ABORT
>    (i915#10029 / i915#10729)
>  * igt@gem_mmap_wc@read-write:shard-dg2: NOTRUN -> SKIP (i915#4083) +2
>    other tests skip
>  * igt@gem_mmap_wc@write-read-distinct:shard-mtlp: NOTRUN -> SKIP
>    (i915#4083)
>  * igt@gem_partial_pwrite_pread@writes-after-reads-snoop:shard-mtlp:
>    NOTRUN -> SKIP (i915#3282)
>  * igt@gem_pread@display:shard-dg2: NOTRUN -> SKIP (i915#3282)
>  * igt@gem_pread@exhaustion:shard-tglu: NOTRUN -> WARN (i915#2658)
>  * igt@gem_pwrite@basic-self:shard-dg1: NOTRUN -> SKIP (i915#3282) +5
>    other tests skip
>  * igt@gem_pxp@create-protected-buffer:shard-rkl: NOTRUN -> SKIP
>    (i915#4270) +3 other tests skipshard-mtlp: NOTRUN -> SKIP
>    (i915#4270)
>  * igt@gem_pxp@create-regular-context-1:shard-dg2: NOTRUN -> SKIP
>    (i915#4270) +3 other tests skip
>  * igt@gem_pxp@reject-modify-context-protection-off-1:shard-tglu:
>    NOTRUN -> SKIP (i915#4270)
>  * igt@gem_pxp@reject-modify-context-protection-on:shard-dg1: NOTRUN ->
>    SKIP (i915#4270) +1 other test skip
>  * igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled:shard-mtlp: NOTRUN ->
>    SKIP (i915#8428) +2 other tests skip
>  * igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled:shard-dg2:
>    NOTRUN -> SKIP (i915#5190 / i915#8428) +3 other tests skip
>  * igt@gem_set_tiling_vs_blt@untiled-to-tiled:shard-dg1: NOTRUN -> SKIP
>    (i915#4079)
>  * igt@gem_unfence_active_buffers:shard-dg1: NOTRUN -> SKIP (i915#4879)
>  * igt@gem_userptr_blits@dmabuf-unsync:shard-dg2: NOTRUN -> SKIP
>    (i915#3297) +2 other tests skipshard-mtlp: NOTRUN -> SKIP
>    (i915#3297) +1 other test skip
>  * igt@gem_userptr_blits@forbidden-operations:shard-rkl: NOTRUN -> SKIP
>    (i915#3282) +2 other tests skipshard-mtlp: NOTRUN -> SKIP (i915#3282
>    / i915#3297)shard-dg2: NOTRUN -> SKIP (i915#3282 / i915#3297)
>  * igt@gem_userptr_blits@invalid-mmap-offset-unsync:shard-dg1: NOTRUN -
>    > SKIP (i915#3297)
>  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:shard-dg1:
>    NOTRUN -> SKIP (i915#3297 / i915#4880) +1 other test skip
>  * igt@gem_userptr_blits@unsync-unmap-after-close:shard-rkl: NOTRUN ->
>    SKIP (i915#3297) +3 other tests skip
>  * igt@gen9_exec_parse@allowed-single:shard-mtlp: NOTRUN -> SKIP
>    (i915#2856) +1 other test skip
>  * igt@gen9_exec_parse@bb-start-param:shard-dg1: NOTRUN -> SKIP
>    (i915#2527) +1 other test skip
>  * igt@gen9_exec_parse@secure-batches:shard-dg2: NOTRUN -> SKIP
>    (i915#2856)
>  * igt@gen9_exec_parse@unaligned-jump:shard-tglu: NOTRUN -> SKIP
>    (i915#2527 / i915#2856) +1 other test skipshard-rkl: NOTRUN -> SKIP
>    (i915#2527) +1 other test skip
>  * igt@i915_module_load@load:shard-dg1: NOTRUN -> SKIP
>    (i915#6227)shard-glk: NOTRUN -> SKIP (i915#6227)shard-dg2: NOTRUN ->
>    SKIP (i915#6227)shard-rkl: NOTRUN -> SKIP (i915#6227)
>  * igt@i915_module_load@reload-with-fault-injection:shard-snb: PASS ->
>    INCOMPLETE (i915#9849)shard-tglu: NOTRUN -> INCOMPLETE (i915#10047 /
>    i915#10887 / i915#9820)
>  * igt@i915_pm_rps@thresholds-idle@gt0:shard-mtlp: NOTRUN -> SKIP
>    (i915#8925)
>  * igt@i915_pm_rps@thresholds-idle@gt1:shard-mtlp: NOTRUN -> SKIP
>    (i915#3555 / i915#8925)
>  * igt@i915_query@query-topology-coherent-slice-mask:shard-dg2: NOTRUN
>    -> SKIP (i915#6188)
>  * igt@i915_query@test-query-geometry-subslices:shard-rkl: NOTRUN ->
>    SKIP (i915#5723)shard-dg1: NOTRUN -> SKIP (i915#5723)
>  * igt@i915_suspend@forcewake:shard-tglu: PASS -> INCOMPLETE
>    (i915#8797)
>  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:shard-rkl: NOTRUN ->
>    SKIP (i915#3826)
>  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-
>    2-y-rc-ccs-cc:shard-rkl: NOTRUN -> SKIP (i915#8709) +3 other tests
>    skip
>  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-
>    3-4-mc-ccs:shard-dg2: NOTRUN -> SKIP (i915#8709) +11 other tests
>    skip
>  * igt@kms_async_flips@invalid-async-flip:shard-dg2: NOTRUN -> SKIP
>    (i915#6228)
>  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:shard-dg1: NOTRUN
>    -> SKIP (i915#9531)
>  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-
>    panels:shard-glk: NOTRUN -> SKIP (i915#1769)
>  * igt@kms_big_fb@4-tiled-8bpp-rotate-180:shard-tglu: NOTRUN -> SKIP
>    (i915#5286) +2 other tests skip
>  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:shard-rkl: NOTRUN -> SKIP
>    (i915#5286) +7 other tests skip
>  * igt@kms_big_fb@4-tiled-addfb:shard-dg1: NOTRUN -> SKIP (i915#5286)
>    +1 other test skip
>  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-
>    flip:shard-dg1: NOTRUN -> SKIP (i915#4538 / i915#5286) +3 other
>    tests skip
>  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:shard-rkl: NOTRUN -> SKIP
>    (i915#3638) +2 other tests skip
>  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:shard-dg2: NOTRUN
>    -> SKIP (i915#5190) +1 other test skip
>  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:shard-
>    mtlp: NOTRUN -> SKIP +8 other tests skip
>  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-
>    flip:shard-dg2: NOTRUN -> SKIP (i915#4538 / i915#5190) +7 other
>    tests skip
>  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:shard-dg1:
>    NOTRUN -> SKIP (i915#4538) +5 other tests skip
>  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4:shard-
>    dg1: NOTRUN -> SKIP (i915#6095) +71 other tests skip
>  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-
>    1:shard-dg2: NOTRUN -> SKIP (i915#10307 / i915#10434 / i915#6095) +3
>    other tests skip
>  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-edp-
>    1:shard-mtlp: NOTRUN -> SKIP (i915#6095) +27 other tests skip
>  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-
>    a-2:shard-rkl: NOTRUN -> SKIP (i915#6095) +67 other tests skip
>  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs:shard-rkl:
>    NOTRUN -> SKIP (i915#10278)
>  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-a-hdmi-
>    a-1:shard-tglu: NOTRUN -> SKIP (i915#6095) +27 other tests skip
>  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-d-
>    hdmi-a-1:shard-dg2: NOTRUN -> SKIP (i915#10307 / i915#6095) +163
>    other tests skip
>  * igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs:shard-dg2: NOTRUN ->
>    SKIP (i915#10278)
>  * igt@kms_cdclk@mode-transition-all-outputs:shard-mtlp: NOTRUN -> SKIP
>    (i915#7213 / i915#9010)shard-rkl: NOTRUN -> SKIP (i915#3742)
>  * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:shard-dg2: NOTRUN ->
>    SKIP (i915#7213) +3 other tests skip
>  * igt@kms_cdclk@plane-scaling:shard-dg1: NOTRUN -> SKIP (i915#3742) +1
>    other test skip
>  * igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3:shard-dg2: NOTRUN ->
>    SKIP (i915#4087) +3 other tests skip
>  * igt@kms_chamelium_audio@hdmi-audio-edid:shard-dg1: NOTRUN -> SKIP
>    (i915#7828) +8 other tests skip
>  * igt@kms_chamelium_edid@dp-edid-change-during-suspend:shard-mtlp:
>    NOTRUN -> SKIP (i915#7828) +3 other tests skip
>  * igt@kms_chamelium_frames@hdmi-cmp-planar-formats:shard-dg2: NOTRUN -
>    > SKIP (i915#7828) +3 other tests skip
>  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:shard-tglu: NOTRUN ->
>    SKIP (i915#7828) +3 other tests skip
>  * igt@kms_chamelium_hpd@vga-hpd-fast:shard-rkl: NOTRUN -> SKIP
>    (i915#7828) +9 other tests skip
>  * igt@kms_content_protection@atomic:shard-dg1: NOTRUN -> SKIP
>    (i915#7116 / i915#9424)shard-dg2: NOTRUN -> SKIP (i915#7118 /
>    i915#9424)
>  * igt@kms_content_protection@atomic-dpms:shard-tglu: NOTRUN -> SKIP
>    (i915#6944 / i915#7116 / i915#7118 / i915#9424) +1 other test
>    skipshard-rkl: NOTRUN -> SKIP (i915#7118 / i915#9424)
>  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-4:shard-dg2: NOTRUN
>    -> TIMEOUT (i915#7173)
>  * igt@kms_content_protection@dp-mst-lic-type-0:shard-mtlp: NOTRUN ->
>    SKIP (i915#3299) +1 other test skip
>  * igt@kms_content_protection@dp-mst-type-0:shard-dg2: NOTRUN -> SKIP
>    (i915#3299)
>  * igt@kms_content_protection@dp-mst-type-1:shard-rkl: NOTRUN -> SKIP
>    (i915#3116) +1 other test skip
>  * igt@kms_content_protection@lic-type-0:shard-dg1: NOTRUN -> SKIP
>    (i915#9424)
>  * igt@kms_content_protection@uevent@pipe-a-dp-4:shard-dg2: NOTRUN ->
>    FAIL (i915#1339 / i915#7173)
>  * igt@kms_cursor_crc@cursor-offscreen-512x170:shard-tglu: NOTRUN ->
>    SKIP (i915#3359)
>  * igt@kms_cursor_crc@cursor-onscreen-512x512:shard-mtlp: NOTRUN ->
>    SKIP (i915#3359)shard-dg2: NOTRUN -> SKIP (i915#3359) +1 other test
>    skipshard-rkl: NOTRUN -> SKIP (i915#3359) +1 other test skip
>  * igt@kms_cursor_crc@cursor-rapid-movement-32x32:shard-mtlp: NOTRUN ->
>    SKIP (i915#3555 / i915#8814)
>  * igt@kms_cursor_crc@cursor-sliding-512x512:shard-dg1: NOTRUN -> SKIP
>    (i915#3359) +2 other tests skip
>  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-
>    size:shard-dg1: NOTRUN -> SKIP (i915#4103 / i915#4213)
>  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:shard-
>    mtlp: NOTRUN -> SKIP (i915#9809) +3 other tests skip
>  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:shard-glk:
>    NOTRUN -> FAIL (i915#2346)
>  * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:shard-dg2:
>    NOTRUN -> SKIP (i915#9067)shard-dg1: NOTRUN -> SKIP (i915#9067)
>  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-
>    transitions:shard-rkl: NOTRUN -> SKIP (i915#4103)
>  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-
>    transitions-varying-size:shard-mtlp: NOTRUN -> SKIP (i915#4213)
>  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:shard-
>    tglu: NOTRUN -> SKIP (i915#4103) +1 other test skipshard-dg2: NOTRUN
>    -> SKIP (i915#4103 / i915#4213)
>  * igt@kms_cursor_legacy@torture-move@pipe-a:shard-dg1: PASS -> DMESG-
>    WARN (i915#10166)shard-tglu: PASS -> DMESG-WARN (i915#10166 /
>    i915#1982)
>  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:shard-rkl: NOTRUN -> SKIP
>    (i915#9723)shard-tglu: NOTRUN -> SKIP (i915#9723)
>  * igt@kms_display_modes@extended-mode-basic:shard-dg2: NOTRUN -> SKIP
>    (i915#3555) +2 other tests skipshard-rkl: NOTRUN -> SKIP (i915#3555)
>    +4 other tests skipshard-mtlp: NOTRUN -> SKIP (i915#3555 /
>    i915#8827)
>  * igt@kms_draw_crc@draw-method-mmap-wc:shard-dg1: NOTRUN -> SKIP
>    (i915#8812)
>  * igt@kms_dsc@dsc-fractional-bpp:shard-dg1: NOTRUN -> SKIP (i915#3840)
>    +1 other test skip
>  * igt@kms_dsc@dsc-with-bpc:shard-rkl: NOTRUN -> SKIP (i915#3555 /
>    i915#3840)
>  * igt@kms_dsc@dsc-with-bpc-formats:shard-dg1: NOTRUN -> SKIP
>    (i915#3555 / i915#3840)
>  * igt@kms_dsc@dsc-with-output-formats-with-bpc:shard-dg2: NOTRUN ->
>    SKIP (i915#3840 / i915#9053)shard-dg1: NOTRUN -> SKIP (i915#3840 /
>    i915#9053)
>  * igt@kms_feature_discovery@chamelium:shard-rkl: NOTRUN -> SKIP
>    (i915#4854)
>  * igt@kms_feature_discovery@display-2x:shard-rkl: NOTRUN -> SKIP
>    (i915#1839)
>  * igt@kms_feature_discovery@psr1:shard-tglu: NOTRUN -> SKIP
>    (i915#658)shard-rkl: NOTRUN -> SKIP (i915#658)
>  * igt@kms_flip@2x-absolute-wf_vblank:shard-tglu: NOTRUN -> SKIP
>    (i915#3637 / i915#3966)
>  * igt@kms_flip@2x-dpms-vs-vblank-race:shard-mtlp: NOTRUN -> SKIP
>    (i915#3637) +2 other tests skip
>  * igt@kms_flip@2x-flip-vs-dpms:shard-rkl: NOTRUN -> SKIP +49 other
>    tests skip
>  * igt@kms_flip@2x-flip-vs-fences-interruptible:shard-mtlp: NOTRUN ->
>    SKIP (i915#8381)
>  * igt@kms_flip@2x-flip-vs-modeset-vs-hang:shard-dg2: NOTRUN -> SKIP
>    +14 other tests skip
>  * igt@kms_flip@2x-flip-vs-panning-interruptible:shard-dg1: NOTRUN ->
>    SKIP (i915#9934) +1 other test skip
>  * igt@kms_flip@flip-vs-fences-interruptible:shard-dg2: NOTRUN -> SKIP
>    (i915#8381)shard-dg1: NOTRUN -> SKIP (i915#8381)
>  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-
>    downscaling@pipe-a-default-mode:shard-mtlp: NOTRUN -> SKIP
>    (i915#2672)
>  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-
>    upscaling@pipe-a-valid-mode:shard-dg1: NOTRUN -> SKIP (i915#2587 /
>    i915#2672) +2 other tests skip
>  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-
>    downscaling@pipe-a-valid-mode:shard-rkl: NOTRUN -> SKIP (i915#2672)
>    +4 other tests skip
>  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-
>    downscaling@pipe-a-default-mode:shard-mtlp: NOTRUN -> SKIP
>    (i915#3555 / i915#8810)
>  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-
>    downscaling@pipe-a-valid-mode:shard-dg2: NOTRUN -> SKIP (i915#2672)
>    +2 other tests skip
>  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-
>    upscaling@pipe-a-valid-mode:shard-tglu: NOTRUN -> SKIP (i915#2587 /
>    i915#2672) +3 other tests skip
>  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-move:shard-
>    tglu: NOTRUN -> SKIP +36 other tests skip
>  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move:shard-
>    snb: PASS -> SKIP +1 other test skip
>  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:shard-
>    dg2: NOTRUN -> SKIP (i915#5354) +29 other tests skip
>  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:shard-
>    dg1: NOTRUN -> SKIP +43 other tests skip
>  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-
>    wc:shard-dg1: NOTRUN -> SKIP (i915#8708) +14 other tests skip
>  * igt@kms_frontbuffer_tracking@fbc-tiling-4:shard-dg1: NOTRUN -> SKIP
>    (i915#5439)
>  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-
>    pwrite:shard-dg2: NOTRUN -> SKIP (i915#3458) +5 other tests skip
>  * igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:shard-
>    dg1: NOTRUN -> SKIP (i915#3458) +12 other tests skip
>  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-
>    wc:shard-dg2: NOTRUN -> SKIP (i915#8708) +15 other tests skip
>  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-
>    blt:shard-rkl: NOTRUN -> SKIP (i915#1825) +41 other tests skip
>  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:shard-
>    rkl: NOTRUN -> SKIP (i915#3023) +21 other tests skip
>  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:shard-rkl: NOTRUN ->
>    SKIP (i915#5439)
>  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:shard-dg1: NOTRUN -> SKIP
>    (i915#9766)shard-dg2: NOTRUN -> SKIP (i915#9766)
>  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-pgflip-blt:shard-
>    mtlp: NOTRUN -> SKIP (i915#1825) +14 other tests skip
>  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-
>    gtt:shard-mtlp: NOTRUN -> SKIP (i915#8708) +6 other tests skip
>  * igt@kms_hdr@static-toggle:shard-dg2: NOTRUN -> SKIP (i915#3555 /
>    i915#8228)shard-rkl: NOTRUN -> SKIP (i915#3555 / i915#8228)
>  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:shard-rkl: NOTRUN
>    -> SKIP (i915#4816)shard-dg1: NOTRUN -> SKIP (i915#1839)
>  * igt@kms_panel_fitting@atomic-fastset:shard-dg2: NOTRUN -> SKIP
>    (i915#6301) +1 other test skip
>  * igt@kms_panel_fitting@legacy:shard-rkl: NOTRUN -> SKIP
>    (i915#6301)shard-dg1: NOTRUN -> SKIP (i915#6301)
>  * igt@kms_plane_alpha_blend@alpha-basic@pipe-c-hdmi-a-1:shard-glk:
>    NOTRUN -> FAIL (i915#7862) +1 other test fail
>  * igt@kms_plane_lowres@tiling-x@pipe-a-edp-1:shard-mtlp: NOTRUN ->
>    SKIP (i915#3582) +7 other tests skip
>  * igt@kms_plane_multiple@tiling-4:shard-tglu: NOTRUN -> SKIP
>    (i915#3555)
>  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-3:shard-dg1:
>    NOTRUN -> FAIL (i915#8292)
>  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-
>    format@pipe-a-hdmi-a-2:shard-rkl: NOTRUN -> SKIP (i915#9423) +3
>    other tests skip
>  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-
>    format@pipe-c-hdmi-a-2:shard-dg2: NOTRUN -> SKIP (i915#9423) +7
>    other tests skip
>  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-
>    d-hdmi-a-4:shard-dg1: NOTRUN -> SKIP (i915#9423) +3 other tests skip
>  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-
>    20x20@pipe-b-hdmi-a-2:shard-rkl: NOTRUN -> SKIP (i915#5235) +5 other
>    tests skip
>  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a-edp-
>    1:shard-mtlp: NOTRUN -> SKIP (i915#5235) +5 other tests skip
>  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-edp-
>    1:shard-mtlp: NOTRUN -> SKIP (i915#3555 / i915#5235) +1 other test
>    skip
>  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-
>    25@pipe-a-hdmi-a-3:shard-dg2: NOTRUN -> SKIP (i915#5235 / i915#9423)
>    +19 other tests skip
>  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-
>    25@pipe-d-hdmi-a-4:shard-dg1: NOTRUN -> SKIP (i915#5235) +11 other
>    tests skip
>  * igt@kms_pm_backlight@bad-brightness:shard-dg1: NOTRUN -> SKIP
>    (i915#5354) +1 other test skip
>  * igt@kms_pm_backlight@basic-brightness:shard-rkl: NOTRUN -> SKIP
>    (i915#5354) +1 other test skip
>  * igt@kms_pm_backlight@fade-with-dpms:shard-tglu: NOTRUN -> SKIP
>    (i915#9812)
>  * igt@kms_pm_lpsp@screens-disabled:shard-tglu: NOTRUN -> SKIP
>    (i915#8430)
>  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:shard-dg2: PASS -> SKIP
>    (i915#9519)
>  * igt@kms_pm_rpm@dpms-non-lpsp:shard-mtlp: NOTRUN -> SKIP (i915#9519)
>  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:shard-rkl: PASS ->
>    SKIP (i915#9519)shard-tglu: NOTRUN -> SKIP (i915#9519)
>  * igt@kms_prime@basic-crc-vgem:shard-dg2: NOTRUN -> SKIP (i915#6524 /
>    i915#6805) +1 other test skip
>  * igt@kms_prime@d3hot:shard-rkl: NOTRUN -> SKIP (i915#6524)
>  * igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf@psr2-
>    pipe-a-edp-1:shard-mtlp: NOTRUN -> SKIP (i915#9808) +3 other tests
>    skip
>  * igt@kms_psr2_su@page_flip-p010:shard-dg1: NOTRUN -> SKIP (i915#9683)
>    +2 other tests skip
>  * igt@kms_psr2_su@page_flip-xrgb8888:shard-dg2: NOTRUN -> SKIP
>    (i915#9683)
>  * igt@kms_psr@fbc-pr-primary-blt:shard-mtlp: NOTRUN -> SKIP
>    (i915#9688) +6 other tests skip
>  * igt@kms_psr@fbc-psr2-no-drrs:shard-tglu: NOTRUN -> SKIP (i915#9732)
>    +8 other tests skip
>  * igt@kms_psr@fbc-psr2-sprite-render:shard-rkl: NOTRUN -> SKIP
>    (i915#1072 / i915#9732) +22 other tests skip
>  * igt@kms_psr@psr2-primary-mmap-gtt:shard-dg2: NOTRUN -> SKIP
>    (i915#1072 / i915#9732) +8 other tests skip
>  * igt@kms_psr@psr2-primary-page-flip:shard-dg2: NOTRUN -> SKIP
>    (i915#1072 / i915#9673 / i915#9732) +2 other tests skip
>  * igt@kms_psr@psr2-sprite-blt:shard-dg1: NOTRUN -> SKIP (i915#1072 /
>    i915#9732) +22 other tests skip
>  * igt@kms_psr@psr2-sprite-plane-onoff:shard-glk: NOTRUN -> SKIP +243
>    other tests skip
>  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:shard-rkl:
>    NOTRUN -> SKIP (i915#9685)
>  * igt@kms_rotation_crc@bad-pixel-format:shard-mtlp: NOTRUN -> SKIP
>    (i915#4235) +2 other tests skip
>  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:shard-rkl: NOTRUN
>    -> SKIP (i915#5289) +1 other test skipshard-tglu: NOTRUN -> SKIP
>    (i915#5289)
>  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:shard-dg1:
>    NOTRUN -> SKIP (i915#5289)
>  * igt@kms_setmode@clone-exclusive-crtc:shard-dg1: NOTRUN -> SKIP
>    (i915#3555) +5 other tests skip
>  * igt@kms_sysfs_edid_timing:shard-dg1: NOTRUN -> FAIL (IGT#2 /
>    i915#6493)
>  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:shard-mtlp: PASS
>    -> FAIL (i915#9196)
>  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1:shard-snb:
>    PASS -> FAIL (i915#9196)
>  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-3:shard-dg1:
>    NOTRUN -> FAIL (i915#9196)
>  * igt@kms_vrr@seamless-rr-switch-drrs:shard-dg1: NOTRUN -> SKIP
>    (i915#9906)
>  * igt@kms_writeback@writeback-check-output-xrgb2101010:shard-dg2:
>    NOTRUN -> SKIP (i915#2437 / i915#9412)
>  * igt@kms_writeback@writeback-fb-id:shard-dg2: NOTRUN -> SKIP
>    (i915#2437)shard-rkl: NOTRUN -> SKIP (i915#2437)
>  * igt@kms_writeback@writeback-invalid-parameters:shard-dg1: NOTRUN ->
>    SKIP (i915#2437)shard-glk: NOTRUN -> SKIP (i915#2437)
>  * igt@perf@per-context-mode-unprivileged:shard-rkl: NOTRUN -> SKIP
>    (i915#2435)
>  * igt@perf@unprivileged-single-ctx-counters:shard-dg1: NOTRUN -> SKIP
>    (i915#2433)
>  * igt@perf_pmu@busy-double-start@vecs1:shard-dg2: NOTRUN -> FAIL
>    (i915#4349) +3 other tests fail
>  * igt@perf_pmu@cpu-hotplug:shard-mtlp: NOTRUN -> SKIP (i915#8850)
>  * igt@perf_pmu@rc6@other-idle-gt0:shard-rkl: NOTRUN -> SKIP
>    (i915#8516)
>  * igt@prime_vgem@basic-fence-read:shard-mtlp: NOTRUN -> SKIP
>    (i915#3708)
>  * igt@prime_vgem@basic-read:shard-rkl: NOTRUN -> SKIP (i915#3291 /
>    i915#3708)
>  * igt@prime_vgem@fence-write-hang:shard-dg1: NOTRUN -> SKIP
>    (i915#3708)
>  * igt@sriov_basic@enable-vfs-autoprobe-off:shard-dg2: NOTRUN -> SKIP
>    (i915#9917)shard-tglu: NOTRUN -> SKIP (i915#9917)
>  * igt@tools_test@sysfs_l3_parity:shard-dg2: NOTRUN -> SKIP (i915#4818)
>  * igt@v3d/v3d_get_param@get-bad-param:shard-dg1: NOTRUN -> SKIP
>    (i915#2575) +6 other tests skip
>  * igt@v3d/v3d_submit_cl@simple-flush-cache:shard-dg2: NOTRUN -> SKIP
>    (i915#2575) +7 other tests skip
>  * igt@v3d/v3d_wait_bo@used-bo:shard-mtlp: NOTRUN -> SKIP (i915#2575)
>    +5 other tests skip
>  * igt@vc4/vc4_create_bo@create-bo-zeroed:shard-rkl: NOTRUN -> SKIP
>    (i915#7711) +7 other tests skip
>  * igt@vc4/vc4_label_bo@set-bad-handle:shard-mtlp: NOTRUN -> SKIP
>    (i915#7711) +2 other tests skip
>  * igt@vc4/vc4_mmap@mmap-bad-handle:shard-dg1: NOTRUN -> SKIP
>    (i915#7711) +6 other tests skip
>  * igt@vc4/vc4_tiling@set-get:shard-dg2: NOTRUN -> SKIP (i915#7711) +4
>    other tests skip
>  * igt@vc4/vc4_wait_bo@used-bo-0ns:shard-tglu: NOTRUN -> SKIP
>    (i915#2575) +5 other tests skip
> Possible fixes * igt@device_reset@unbind-reset-rebind:shard-dg2: INCOMPLE=
TE
>    (i915#5507) -> PASSshard-mtlp: ABORT (i915#5507) -> PASS
>  * igt@drm_fdinfo@most-busy-check-all@rcs0:shard-rkl: FAIL (i915#7742)
>    -> PASS
>  * igt@gem_eio@kms:shard-tglu: INCOMPLETE (i915#10513) -> PASS
>  * igt@gem_exec_fair@basic-none-share@rcs0:shard-rkl: FAIL (i915#2842)
>    -> PASS
>  * igt@gem_lmem_swapping@heavy-multi@lmem0:shard-dg2: FAIL (i915#10378)
>    -> PASS
>  * igt@gem_lmem_swapping@heavy-verify-multi@lmem0:shard-dg1: FAIL
>    (i915#10378) -> PASS
>  * igt@gem_lmem_swapping@smem-oom@lmem0:shard-dg1: TIMEOUT (i915#5493)
>    -> PASS
>  * igt@i915_module_load@reload-with-fault-injection:shard-glk:
>    INCOMPLETE (i915#1982 / i915#9849) -> PASS
>  * igt@kms_busy@extended-modeset-hang-oldfb-with-reset@pipe-b:shard-
>    snb: ABORT -> PASS
>  * igt@kms_flip@plain-flip-fb-recreate-interruptible@c-hdmi-a3:shard-
>    dg2: FAIL (i915#2122) -> PASS +1 other test pass
>  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-
>    fullscreen:shard-snb: SKIP -> PASS
>  * igt@kms_pm_rpm@modeset-lpsp:shard-dg2: SKIP (i915#9519) -> PASS +2
>    other tests passshard-rkl: SKIP (i915#9519) -> PASS +2 other tests
>    pass
> Warnings * igt@gem_create@create-ext-cpu-access-big:shard-dg2: ABORT
>    (i915#9846) -> INCOMPLETE (i915#9364)
>  * igt@kms_psr@fbc-psr-suspend:shard-dg2: SKIP (i915#1072 / i915#9673 /
>    i915#9732) -> SKIP (i915#1072 / i915#9732) +9 other tests skip
>  * igt@kms_psr@fbc-psr2-sprite-mmap-cpu:shard-dg2: SKIP (i915#1072 /
>    i915#9732) -> SKIP (i915#1072 / i915#9673 / i915#9732) +6 other
>    tests skip
> Build changes * CI: CI-20190529 -> None
>  * IGT: IGT_7864 -> IGTPW_11160
> CI-20190529: 20190529
> CI_DRM_14785: 1ba62f8cea9c797427d45108df1d453f4b343240 @
> git://anongit.freedesktop.org/gfx-ci/linux
> IGTPW_11160: 11160
> IGT_7864: 8eff53c9664fa0abaa55b403c9f10f96260e44b7 @
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


--=-Vj0j8uviD0SyAuVxdzbS
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html><head>
 =20
  <title>Project List - Patchwork</title>
  <style id=3D"css-table-select" type=3D"text/css">
   td { padding: 2pt; }
  </style>
</head>
<body><div style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font-fa=
mily: Cantarell; font-size: 12px; font-style: normal; font-variant-caps: no=
rmal; font-weight: 400; letter-spacing: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; widows:=
 auto; word-spacing: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.4); =
-webkit-text-stroke-width: 0px; text-decoration: none;">These failures are =
not related to this patchseries, since the new code doesn't even run in the=
se tests.</div><div style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0)=
; font-family: Cantarell; font-size: 12px; font-style: normal; font-variant=
-caps: normal; font-weight: 400; letter-spacing: normal; orphans: auto; tex=
t-align: start; text-indent: 0px; text-transform: none; white-space: normal=
; widows: auto; word-spacing: 0px; -webkit-tap-highlight-color: rgba(0, 0, =
0, 0.4); -webkit-text-stroke-width: 0px; text-decoration: none;"><br></div>=
<div style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font-family: =
Cantarell; font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: 400; letter-spacing: normal; orphans: auto; text-align: start;=
 text-indent: 0px; text-transform: none; white-space: normal; widows: auto;=
 word-spacing: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.4); -webki=
t-text-stroke-width: 0px; text-decoration: none;">--</div><div style=3D"car=
et-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font-family: Cantarell; font-s=
ize: 12px; font-style: normal; font-variant-caps: normal; font-weight: 400;=
 letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px=
; text-transform: none; white-space: normal; widows: auto; word-spacing: 0p=
x; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.4); -webkit-text-stroke-wid=
th: 0px; text-decoration: none;">Cheers,</div><div style=3D"caret-color: rg=
b(0, 0, 0); color: rgb(0, 0, 0); font-family: Cantarell; font-size: 12px; f=
ont-style: normal; font-variant-caps: normal; font-weight: 400; letter-spac=
ing: normal; orphans: auto; text-align: start; text-indent: 0px; text-trans=
form: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-t=
ap-highlight-color: rgba(0, 0, 0, 0.4); -webkit-text-stroke-width: 0px; tex=
t-decoration: none;">Luca.</div><div><br></div><div><br></div><div>On Tue, =
2024-05-21 at 05:09 +0000, Patchwork wrote:</div><blockquote type=3D"cite" =
style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex"=
><div><b>Patch Details</b></div><div><table><tbody><tr><td><b>Series:</b></=
td><td>lib/igt_kms: add retry loop in igt_enable_connectors() (rev3)</td></=
tr><tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org=
/series/133597/">https://patchwork.freedesktop.org/series/133597/</a></td><=
/tr><tr><td><b>State:</b></td><td>failure</td></tr> <tr><td><b>Details:</b>=
</td><td><a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/in=
dex.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/index.html</=
a></td></tr></tbody></table> </div><h1>CI Bug Log - changes from IGT_7864_f=
ull -&gt; IGTPW_11160_full</h1><h2>Summary</h2><p><strong>FAILURE</strong><=
/p><p>Serious unknown changes coming with IGTPW_11160_full absolutely need =
to be<br> verified manually.</p><p>If you think the reported changes have n=
othing to do with the changes<br> introduced in IGTPW_11160_full, please no=
tify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br> =
to document this new failure mode, which will reduce false positives in CI.=
</p><p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/i=
ndex.html</p><h2>Participating hosts (9 -&gt; 9)</h2><p>No changes in parti=
cipating hosts</p><h2>Possible new issues</h2><p>Here are the unknown chang=
es that may have been introduced in IGTPW_11160_full:</p><h3>IGT changes</h=
3><h4>Possible regressions</h4><ul><li><p>igt@gem_exec_schedule@deep@ccs0:<=
/p><ul><li>shard-mtlp: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_7864/shard-mtlp-8/igt@gem_exec_schedule@deep@ccs0.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-mtlp-=
6/igt@gem_exec_schedule@deep@ccs0.html">INCOMPLETE</a></li></ul></li><li><p=
>igt@kms_vrr@seamless-rr-switch-virtual:</p><ul><li>shard-mtlp: NOTRUN -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-mtl=
p-6/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a></li></ul></li></u=
l><h2>New tests</h2><p>New tests have been introduced between IGT_7864_full=
 and IGTPW_11160_full:</p><h3>New IGT tests (5)</h3><ul><li><p>igt@kms_plan=
e_lowres@tiling-4@pipe-a-hdmi-a-1:</p><ul><li>Statuses : 1 pass(s)</li><li>=
Exec time: [7.83] s</li></ul></li><li><p>igt@kms_plane_lowres@tiling-4@pipe=
-b-hdmi-a-1:</p><ul><li>Statuses : 1 pass(s)</li><li>Exec time: [7.36] s</l=
i></ul></li><li><p>igt@kms_plane_lowres@tiling-4@pipe-c-hdmi-a-1:</p><ul><l=
i>Statuses : 1 pass(s)</li><li>Exec time: [7.56] s</li></ul></li><li><p>igt=
@kms_plane_lowres@tiling-4@pipe-d-hdmi-a-1:</p><ul><li>Statuses : 1 pass(s)=
</li><li>Exec time: [7.46] s</li></ul></li><li><p>igt@perf@oa-exponents@1-v=
cs1:</p><ul><li>Statuses : 1 pass(s)</li><li>Exec time: [1.83] s</li></ul><=
/li></ul><h2>Known issues</h2><p>Here are the changes found in IGTPW_11160_=
full that come from known issues:</p><h3>IGT changes</h3><h4>Issues hit</h4=
><ul><li><p>igt@drm_fdinfo@busy-check-all@bcs0:</p><ul><li>shard-dg1: NOTRU=
N -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/sha=
rd-dg1-18/igt@drm_fdinfo@busy-check-all@bcs0.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8414">i915#8414</a>) +=
8 other tests skip</li></ul></li><li><p>igt@drm_fdinfo@busy@rcs0:</p><ul><l=
i>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_11160/shard-dg2-11/igt@drm_fdinfo@busy@rcs0.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8414">i915#841=
4</a>) +16 other tests skip</li></ul></li><li><p>igt@drm_fdinfo@virtual-bus=
y-idle-all:</p><ul><li>shard-mtlp: NOTRUN -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_11160/shard-mtlp-3/igt@drm_fdinfo@virtual-bu=
sy-idle-all.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/8414">i915#8414</a>)</li></ul></li><li><p>igt@gem_ccs@b=
lock-copy-compressed:</p><ul><li>shard-dg1: NOTRUN -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-dg1-13/igt@gem_ccs@bloc=
k-copy-compressed.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>) +1 other test =
skip</li><li>shard-rkl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_11160/shard-rkl-5/igt@gem_ccs@block-copy-compressed.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/9323">i915#9323</a>)</li></ul></li><li><p>igt@gem_ccs@bl=
ock-multicopy-compressed:</p><ul><li>shard-rkl: NOTRUN -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-rkl-4/igt@gem_ccs@b=
lock-multicopy-compressed.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li></ul></li><li><p=
>igt@gem_ccs@suspend-resume:</p><ul><li>shard-tglu: NOTRUN -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-tglu-4/igt@gem_=
ccs@suspend-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/9323">i915#9323</a>) +1 other test skip</li></ul=
></li><li><p>igt@gem_create@create-ext-cpu-access-big:</p><ul><li>shard-rkl=
: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11=
160/shard-rkl-4/igt@gem_create@create-ext-cpu-access-big.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335">i915=
#6335</a>)</li></ul></li><li><p>igt@gem_create@create-ext-cpu-access-sanity=
-check:</p><ul><li>shard-mtlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_11160/shard-mtlp-1/igt@gem_create@create-ext-cpu=
-access-sanity-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/6335">i915#6335</a>) +1 other test skip</li></=
ul></li><li><p>igt@gem_create@create-ext-set-pat:</p><ul><li>shard-rkl: NOT=
RUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/s=
hard-rkl-2/igt@gem_create@create-ext-set-pat.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8562">i915#8562</a>)</=
li></ul></li><li><p>igt@gem_ctx_persistence@heartbeat-stop:</p><ul><li>shar=
d-dg1: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_11160/shard-dg1-18/igt@gem_ctx_persistence@heartbeat-stop.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555">=
i915#8555</a>) +1 other test skip</li></ul></li><li><p>igt@gem_eio@reset-st=
ress:</p><ul><li>shard-dg2: <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGT_7864/shard-dg2-8/igt@gem_eio@reset-stress.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-dg2-10/i=
gt@gem_eio@reset-stress.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/5784">i915#5784</a>)</li></ul></li><li><p>i=
gt@gem_exec_balancer@bonded-dual:</p><ul><li>shard-dg1: NOTRUN -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-dg1-16/igt@=
gem_exec_balancer@bonded-dual.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/4771">i915#4771</a>)</li></ul></li><l=
i><p>igt@gem_exec_balancer@bonded-true-hang:</p><ul><li>shard-dg2: NOTRUN -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-=
dg2-5/igt@gem_exec_balancer@bonded-true-hang.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812">i915#4812</a>) +=
2 other tests skip</li></ul></li><li><p>igt@gem_exec_balancer@noheartbeat:<=
/p><ul><li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_11160/shard-dg2-4/igt@gem_exec_balancer@noheartbeat.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/8555">i915#8555</a>)</li></ul></li><li><p>igt@gem_exec_balancer@parallel=
-keep-in-fence:</p><ul><li>shard-rkl: NOTRUN -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-rkl-2/igt@gem_exec_balancer@p=
arallel-keep-in-fence.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/4525">i915#4525</a>)</li></ul></li><li><p>igt=
@gem_exec_capture@capture-invisible@smem0:</p><ul><li>shard-mtlp: NOTRUN -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-m=
tlp-3/igt@gem_exec_capture@capture-invisible@smem0.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334">i915#6334=
</a>)</li></ul></li><li><p>igt@gem_exec_capture@many-4k-incremental:</p><ul=
><li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_11160/shard-dg2-6/igt@gem_exec_capture@many-4k-incremental.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/9606">i915#9606</a>)</li><li>shard-dg1: NOTRUN -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-dg1-16/igt@gem_exec_cap=
ture@many-4k-incremental.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/9606">i915#9606</a>)</li></ul></li><li><p>=
igt@gem_exec_capture@many-4k-zero:</p><ul><li>shard-tglu: NOTRUN -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-tglu-4/ig=
t@gem_exec_capture@many-4k-zero.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/9606">i915#9606</a>)</li><li>shard-=
rkl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_11160/shard-rkl-5/igt@gem_exec_capture@many-4k-zero.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9606">i915#960=
6</a>)</li></ul></li><li><p>igt@gem_exec_fair@basic-flow:</p><ul><li>shard-=
dg1: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_11160/shard-dg1-17/igt@gem_exec_fair@basic-flow.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539">i915#3539</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852=
">i915#4852</a>) +2 other tests skip</li></ul></li><li><p>igt@gem_exec_fair=
@basic-none-solo@rcs0:</p><ul><li>shard-rkl: <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGT_7864/shard-rkl-3/igt@gem_exec_fair@basic-none-sol=
o@rcs0.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_11160/shard-rkl-4/igt@gem_exec_fair@basic-none-solo@rcs0.html">F=
AIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/2842">i915#2842</a>)</li></ul></li><li><p>igt@gem_exec_fair@basic-pace-sol=
o:</p><ul><li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_11160/shard-dg2-2/igt@gem_exec_fair@basic-pace-solo.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/3539">i915#3539</a>) +1 other test skip</li></ul></li><li><p>igt@gem_=
exec_fence@concurrent:</p><ul><li>shard-mtlp: NOTRUN -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-mtlp-4/igt@gem_exec_f=
ence@concurrent.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/4812">i915#4812</a>) +2 other tests skip</li></ul><=
/li><li><p>igt@gem_exec_flush@basic-wb-pro-default:</p><ul><li>shard-dg2: N=
OTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160=
/shard-dg2-2/igt@gem_exec_flush@basic-wb-pro-default.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539">i915#353=
9</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
4852">i915#4852</a>)</li></ul></li><li><p>igt@gem_exec_reloc@basic-cpu-nore=
loc:</p><ul><li>shard-mtlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_11160/shard-mtlp-4/igt@gem_exec_reloc@basic-cpu-nor=
eloc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/3281">i915#3281</a>) +5 other tests skip</li></ul></li><li><p>=
igt@gem_exec_reloc@basic-wc-gtt-noreloc:</p><ul><li>shard-dg1: NOTRUN -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-dg1-=
18/igt@gem_exec_reloc@basic-wc-gtt-noreloc.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +9 =
other tests skip</li></ul></li><li><p>igt@gem_exec_reloc@basic-write-gtt:</=
p><ul><li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_11160/shard-dg2-2/igt@gem_exec_reloc@basic-write-gtt.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3281">i915#3281</a>) +5 other tests skip</li></ul></li><li><p>igt@gem_ex=
ec_reloc@basic-write-read-noreloc:</p><ul><li>shard-rkl: NOTRUN -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-rkl-5/igt@=
gem_exec_reloc@basic-write-read-noreloc.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +8 oth=
er tests skip</li></ul></li><li><p>igt@gem_exec_schedule@preempt-queue-chai=
n:</p><ul><li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_11160/shard-dg2-11/igt@gem_exec_schedule@preempt-queue=
-chain.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/4537">i915#4537</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/4812">i915#4812</a>)</li></ul></li><li><p>igt@=
gem_exec_schedule@preempt-queue-contexts-chain:</p><ul><li>shard-mtlp: NOTR=
UN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/sh=
ard-mtlp-8/igt@gem_exec_schedule@preempt-queue-contexts-chain.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537"=
>i915#4537</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/4812">i915#4812</a>)</li></ul></li><li><p>igt@gem_exec_schedule@se=
maphore-power:</p><ul><li>shard-dg1: NOTRUN -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-dg1-18/igt@gem_exec_schedule@s=
emaphore-power.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/4812">i915#4812</a>) +3 other tests skip</li></ul></=
li><li><p>igt@gem_exec_schedule@u-fairslice:</p><ul><li>shard-snb: NOTRUN -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-=
snb6/igt@gem_exec_schedule@u-fairslice.html">SKIP</a> +29 other tests skip<=
/li></ul></li><li><p>igt@gem_fence_thrash@bo-copy:</p><ul><li>shard-dg1: NO=
TRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/=
shard-dg1-16/igt@gem_fence_thrash@bo-copy.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860">i915#4860</a>) +2 o=
ther tests skip</li></ul></li><li><p>igt@gem_fenced_exec_thrash@no-spare-fe=
nces-busy-interruptible:</p><ul><li>shard-dg2: NOTRUN -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-dg2-11/igt@gem_fence=
d_exec_thrash@no-spare-fences-busy-interruptible.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860">i915#4860</a=
>)</li></ul></li><li><p>igt@gem_fenced_exec_thrash@too-many-fences:</p><ul>=
<li>shard-mtlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_11160/shard-mtlp-3/igt@gem_fenced_exec_thrash@too-many-fences.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/4860">i915#4860</a>)</li></ul></li><li><p>igt@gem_huc_copy@huc-copy:=
</p><ul><li>shard-glk: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_11160/shard-glk5/igt@gem_huc_copy@huc-copy.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190"=
>i915#2190</a>)</li></ul></li><li><p>igt@gem_lmem_evict@dontneed-evict-race=
:</p><ul><li>shard-rkl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_11160/shard-rkl-4/igt@gem_lmem_evict@dontneed-evict-rac=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/4613">i915#4613</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/7582">i915#7582</a>)</li></ul></li><li><p>igt@gem_l=
mem_swapping@basic@lmem0:</p><ul><li>shard-dg2: <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGT_7864/shard-dg2-10/igt@gem_lmem_swapping@basic@=
lmem0.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_11160/shard-dg2-6/igt@gem_lmem_swapping@basic@lmem0.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10378=
">i915#10378</a>) +1 other test fail</li></ul></li><li><p>igt@gem_lmem_swap=
ping@heavy-random@lmem0:</p><ul><li>shard-dg1: NOTRUN -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-dg1-13/igt@gem_lmem_=
swapping@heavy-random@lmem0.html">FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/10378">i915#10378</a>) +1 other test fa=
il</li></ul></li><li><p>igt@gem_lmem_swapping@parallel-random-verify:</p><u=
l><li>shard-rkl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_11160/shard-rkl-5/igt@gem_lmem_swapping@parallel-random-verify=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/4613">i915#4613</a>) +3 other tests skip</li></ul></li><li><p>igt@=
gem_lmem_swapping@random-engines:</p><ul><li>shard-glk: NOTRUN -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-glk8/igt@ge=
m_lmem_swapping@random-engines.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +4 other tests =
skip</li></ul></li><li><p>igt@gem_lmem_swapping@verify-random:</p><ul><li>s=
hard-tglu: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_11160/shard-tglu-6/igt@gem_lmem_swapping@verify-random.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613"=
>i915#4613</a>) +1 other test skip</li></ul></li><li><p>igt@gem_media_vme:<=
/p><ul><li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_11160/shard-dg2-5/igt@gem_media_vme.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284">i915#284=
</a>)</li><li>shard-rkl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_11160/shard-rkl-3/igt@gem_media_vme.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284">i915#=
284</a>)</li></ul></li><li><p>igt@gem_mmap_gtt@basic-read-write:</p><ul><li=
>shard-mtlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_11160/shard-mtlp-1/igt@gem_mmap_gtt@basic-read-write.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077"=
>i915#4077</a>) +6 other tests skip</li></ul></li><li><p>igt@gem_mmap_gtt@b=
asic-small-copy-odd:</p><ul><li>shard-dg1: NOTRUN -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-dg1-18/igt@gem_mmap_gtt@=
basic-small-copy-odd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +9 other tests skip</li><=
/ul></li><li><p>igt@gem_mmap_gtt@isolation:</p><ul><li>shard-dg2: NOTRUN -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-d=
g2-8/igt@gem_mmap_gtt@isolation.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +4 other tests=
 skip</li></ul></li><li><p>igt@gem_mmap_offset@clear@smem0:</p><ul><li>shar=
d-mtlp: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7864/shard-=
mtlp-6/igt@gem_mmap_offset@clear@smem0.html">PASS</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-mtlp-3/igt@gem_mmap_=
offset@clear@smem0.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/10029">i915#10029</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/10729">i915#10729</a>)</li></ul=
></li><li><p>igt@gem_mmap_wc@read-write:</p><ul><li>shard-dg2: NOTRUN -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-dg2-=
5/igt@gem_mmap_wc@read-write.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>) +2 other tests sk=
ip</li></ul></li><li><p>igt@gem_mmap_wc@write-read-distinct:</p><ul><li>sha=
rd-mtlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_11160/shard-mtlp-3/igt@gem_mmap_wc@write-read-distinct.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i=
915#4083</a>)</li></ul></li><li><p>igt@gem_partial_pwrite_pread@writes-afte=
r-reads-snoop:</p><ul><li>shard-mtlp: NOTRUN -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-mtlp-2/igt@gem_partial_pwrite=
_pread@writes-after-reads-snoop.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>)</li></ul></li>=
<li><p>igt@gem_pread@display:</p><ul><li>shard-dg2: NOTRUN -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-dg2-6/igt@gem_p=
read@display.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/3282">i915#3282</a>)</li></ul></li><li><p>igt@gem_prea=
d@exhaustion:</p><ul><li>shard-tglu: NOTRUN -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-tglu-9/igt@gem_pread@exhaustio=
n.html">WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/2658">i915#2658</a>)</li></ul></li><li><p>igt@gem_pwrite@basic-se=
lf:</p><ul><li>shard-dg1: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_11160/shard-dg1-16/igt@gem_pwrite@basic-self.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
3282">i915#3282</a>) +5 other tests skip</li></ul></li><li><p>igt@gem_pxp@c=
reate-protected-buffer:</p><ul><li>shard-rkl: NOTRUN -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-rkl-4/igt@gem_pxp@cre=
ate-protected-buffer.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/4270">i915#4270</a>) +3 other tests skip</li><=
li>shard-mtlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_11160/shard-mtlp-5/igt@gem_pxp@create-protected-buffer.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4=
270">i915#4270</a>)</li></ul></li><li><p>igt@gem_pxp@create-regular-context=
-1:</p><ul><li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_11160/shard-dg2-2/igt@gem_pxp@create-regular-context-=
1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/4270">i915#4270</a>) +3 other tests skip</li></ul></li><li><p>igt=
@gem_pxp@reject-modify-context-protection-off-1:</p><ul><li>shard-tglu: NOT=
RUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/s=
hard-tglu-2/igt@gem_pxp@reject-modify-context-protection-off-1.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270=
">i915#4270</a>)</li></ul></li><li><p>igt@gem_pxp@reject-modify-context-pro=
tection-on:</p><ul><li>shard-dg1: NOTRUN -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_11160/shard-dg1-15/igt@gem_pxp@reject-modify-=
context-protection-on.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/4270">i915#4270</a>) +1 other test skip</li><=
/ul></li><li><p>igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled:</p><ul><li>sh=
ard-mtlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_11160/shard-mtlp-7/igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/8428">i915#8428</a>) +2 other tests skip</li></ul></li><li><p>igt@gem_re=
nder_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled:</p><ul><li>shard-dg2: NOTRUN -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-=
dg2-11/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">=
i915#5190</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/8428">i915#8428</a>) +3 other tests skip</li></ul></li><li><p>igt@g=
em_set_tiling_vs_blt@untiled-to-tiled:</p><ul><li>shard-dg1: NOTRUN -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-dg1-14=
/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079">i915#4079</a>)</l=
i></ul></li><li><p>igt@gem_unfence_active_buffers:</p><ul><li>shard-dg1: NO=
TRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/=
shard-dg1-14/igt@gem_unfence_active_buffers.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4879">i915#4879</a>)</l=
i></ul></li><li><p>igt@gem_userptr_blits@dmabuf-unsync:</p><ul><li>shard-dg=
2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1=
1160/shard-dg2-3/igt@gem_userptr_blits@dmabuf-unsync.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#329=
7</a>) +2 other tests skip</li><li>shard-mtlp: NOTRUN -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-mtlp-2/igt@gem_userp=
tr_blits@dmabuf-unsync.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) +1 other test skip</li>=
</ul></li><li><p>igt@gem_userptr_blits@forbidden-operations:</p><ul><li>sha=
rd-rkl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_11160/shard-rkl-2/igt@gem_userptr_blits@forbidden-operations.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/32=
82">i915#3282</a>) +2 other tests skip</li><li>shard-mtlp: NOTRUN -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-mtlp-3/i=
gt@gem_userptr_blits@forbidden-operations.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#=
3297</a>)</li><li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_11160/shard-dg2-1/igt@gem_userptr_blits@forbidden-=
operations.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/3282">i915#3282</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li></ul></li><li><p>=
igt@gem_userptr_blits@invalid-mmap-offset-unsync:</p><ul><li>shard-dg1: NOT=
RUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/s=
hard-dg1-17/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">=
i915#3297</a>)</li></ul></li><li><p>igt@gem_userptr_blits@map-fixed-invalid=
ate-overlap-busy:</p><ul><li>shard-dg1: NOTRUN -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-dg1-18/igt@gem_userptr_blit=
s@map-fixed-invalidate-overlap-busy.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4880">i915#4880=
</a>) +1 other test skip</li></ul></li><li><p>igt@gem_userptr_blits@unsync-=
unmap-after-close:</p><ul><li>shard-rkl: NOTRUN -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-rkl-4/igt@gem_userptr_blit=
s@unsync-unmap-after-close.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) +3 other tests skip=
</li></ul></li><li><p>igt@gen9_exec_parse@allowed-single:</p><ul><li>shard-=
mtlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_11160/shard-mtlp-6/igt@gen9_exec_parse@allowed-single.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#=
2856</a>) +1 other test skip</li></ul></li><li><p>igt@gen9_exec_parse@bb-st=
art-param:</p><ul><li>shard-dg1: NOTRUN -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_11160/shard-dg1-17/igt@gen9_exec_parse@bb-star=
t-param.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/2527">i915#2527</a>) +1 other test skip</li></ul></li><li><=
p>igt@gen9_exec_parse@secure-batches:</p><ul><li>shard-dg2: NOTRUN -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-dg2-11/=
igt@gen9_exec_parse@secure-batches.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>)</li></ul></=
li><li><p>igt@gen9_exec_parse@unaligned-jump:</p><ul><li>shard-tglu: NOTRUN=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shar=
d-tglu-8/igt@gen9_exec_parse@unaligned-jump.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i91=
5#2856</a>) +1 other test skip</li><li>shard-rkl: NOTRUN -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-rkl-5/igt@gen9_ex=
ec_parse@unaligned-jump.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) +1 other test skip</li=
></ul></li><li><p>igt@i915_module_load@load:</p><ul><li>shard-dg1: NOTRUN -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-=
dg1-17/igt@i915_module_load@load.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/6227">i915#6227</a>)</li><li>shard=
-glk: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_11160/shard-glk8/igt@i915_module_load@load.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6227">i915#6227</a>)</=
li><li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_11160/shard-dg2-3/igt@i915_module_load@load.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6227">i91=
5#6227</a>)</li><li>shard-rkl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_11160/shard-rkl-3/igt@i915_module_load@load.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/6227">i915#6227</a>)</li></ul></li><li><p>igt@i915_module_load@reload-w=
ith-fault-injection:</p><ul><li>shard-snb: <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGT_7864/shard-snb7/igt@i915_module_load@reload-with-fa=
ult-injection.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_11160/shard-snb4/igt@i915_module_load@reload-with-fault-i=
njection.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/9849">i915#9849</a>)</li><li>shard-tglu: NOTRUN -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-tgl=
u-3/igt@i915_module_load@reload-with-fault-injection.html">INCOMPLETE</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10047">i=
915#10047</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/10887">i915#10887</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/9820">i915#9820</a>)</li></ul></li><li><p>igt@i915_=
pm_rps@thresholds-idle@gt0:</p><ul><li>shard-mtlp: NOTRUN -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-mtlp-3/igt@i915_=
pm_rps@thresholds-idle@gt0.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/8925">i915#8925</a>)</li></ul></li><li><=
p>igt@i915_pm_rps@thresholds-idle@gt1:</p><ul><li>shard-mtlp: NOTRUN -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-mtlp-=
3/igt@i915_pm_rps@thresholds-idle@gt1.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8925">i915#8925=
</a>)</li></ul></li><li><p>igt@i915_query@query-topology-coherent-slice-mas=
k:</p><ul><li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_11160/shard-dg2-6/igt@i915_query@query-topology-cohere=
nt-slice-mask.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/6188">i915#6188</a>)</li></ul></li><li><p>igt@i915_qu=
ery@test-query-geometry-subslices:</p><ul><li>shard-rkl: NOTRUN -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-rkl-5/igt@=
i915_query@test-query-geometry-subslices.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/5723">i915#5723</a>)</li><=
li>shard-dg1: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_11160/shard-dg1-15/igt@i915_query@test-query-geometry-subslices.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/5723">i915#5723</a>)</li></ul></li><li><p>igt@i915_suspend@forcewake=
:</p><ul><li>shard-tglu: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_7864/shard-tglu-4/igt@i915_suspend@forcewake.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-tglu-6/i=
gt@i915_suspend@forcewake.html">INCOMPLETE</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/8797">i915#8797</a>)</li></ul></li>=
<li><p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p><ul><li>shard-rk=
l: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1=
1160/shard-rkl-5/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/38=
26">i915#3826</a>)</li></ul></li><li><p>igt@kms_async_flips@async-flip-with=
-page-flip-events@pipe-b-hdmi-a-2-y-rc-ccs-cc:</p><ul><li>shard-rkl: NOTRUN=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shar=
d-rkl-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-=
2-y-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/8709">i915#8709</a>) +3 other tests skip</li></ul></l=
i><li><p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a=
-3-4-mc-ccs:</p><ul><li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_11160/shard-dg2-5/igt@kms_async_flips@async-=
flip-with-page-flip-events@pipe-d-hdmi-a-3-4-mc-ccs.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8709">i915#8709=
</a>) +11 other tests skip</li></ul></li><li><p>igt@kms_async_flips@invalid=
-async-flip:</p><ul><li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_11160/shard-dg2-11/igt@kms_async_flips@inval=
id-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/6228">i915#6228</a>)</li></ul></li><li><p>igt@kms_ato=
mic@plane-primary-overlay-mutable-zpos:</p><ul><li>shard-dg1: NOTRUN -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-dg1-1=
8/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9531">i915#9531=
</a>)</li></ul></li><li><p>igt@kms_atomic_transition@plane-all-modeset-tran=
sition-internal-panels:</p><ul><li>shard-glk: NOTRUN -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-glk1/igt@kms_atomic_t=
ransition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1=
769</a>)</li></ul></li><li><p>igt@kms_big_fb@4-tiled-8bpp-rotate-180:</p><u=
l><li>shard-tglu: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_11160/shard-tglu-7/igt@kms_big_fb@4-tiled-8bpp-rotate-180.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/5286">i915#5286</a>) +2 other tests skip</li></ul></li><li><p>igt@kms_=
big_fb@4-tiled-8bpp-rotate-90:</p><ul><li>shard-rkl: NOTRUN -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-rkl-3/igt@km=
s_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +7 other tests=
 skip</li></ul></li><li><p>igt@kms_big_fb@4-tiled-addfb:</p><ul><li>shard-d=
g1: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
11160/shard-dg1-13/igt@kms_big_fb@4-tiled-addfb.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>=
) +1 other test skip</li></ul></li><li><p>igt@kms_big_fb@4-tiled-max-hw-str=
ide-32bpp-rotate-180-hflip-async-flip:</p><ul><li>shard-dg1: NOTRUN -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-dg1-16=
/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/4538">i915#4538</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/5286">i915#5286</a>) +3 other tests skip</li></ul></li><=
li><p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p><ul><li>shard-rkl: NOTRUN =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard=
-rkl-4/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) =
+2 other tests skip</li></ul></li><li><p>igt@kms_big_fb@y-tiled-addfb-size-=
offset-overflow:</p><ul><li>shard-dg2: NOTRUN -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-dg2-5/igt@kms_big_fb@y-tiled=
-addfb-size-offset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +1 other test skip=
</li></ul></li><li><p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180=
-hflip:</p><ul><li>shard-mtlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_11160/shard-mtlp-5/igt@kms_big_fb@y-tiled-max-hw=
-stride-32bpp-rotate-180-hflip.html">SKIP</a> +8 other tests skip</li></ul>=
</li><li><p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-asy=
nc-flip:</p><ul><li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_11160/shard-dg2-5/igt@kms_big_fb@y-tiled-max-hw-=
stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5=
190</a>) +7 other tests skip</li></ul></li><li><p>igt@kms_big_fb@yf-tiled-m=
ax-hw-stride-64bpp-rotate-180:</p><ul><li>shard-dg1: NOTRUN -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-dg1-18/igt@k=
ms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538=
</a>) +5 other tests skip</li></ul></li><li><p>igt@kms_ccs@bad-aux-stride-4=
-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4:</p><ul><li>shard-dg1: NOTRUN -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-dg1-18/igt=
@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i9=
15#6095</a>) +71 other tests skip</li></ul></li><li><p>igt@kms_ccs@ccs-on-a=
nother-bo-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-1:</p><ul><li>shard-dg2: NOTRUN =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard=
-dg2-10/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-1.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/10307">i915#10307</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/10434">i915#10434</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +3 other tests s=
kip</li></ul></li><li><p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs=
@pipe-b-edp-1:</p><ul><li>shard-mtlp: NOTRUN -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-mtlp-7/igt@kms_ccs@ccs-on-ano=
ther-bo-y-tiled-gen12-mc-ccs@pipe-b-edp-1.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +27 =
other tests skip</li></ul></li><li><p>igt@kms_ccs@crc-primary-rotation-180-=
4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:</p><ul><li>shard-rkl: NOTRUN -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-rkl-3/igt=
@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/6095">i915#6095</a>) +67 other tests skip</li></ul></li><li><p>igt@kms_cc=
s@crc-primary-rotation-180-4-tiled-xe2-ccs:</p><ul><li>shard-rkl: NOTRUN -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-r=
kl-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10278">i9=
15#10278</a>)</li></ul></li><li><p>igt@kms_ccs@crc-sprite-planes-basic-4-ti=
led-dg2-mc-ccs@pipe-a-hdmi-a-1:</p><ul><li>shard-tglu: NOTRUN -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-tglu-8/igt@k=
ms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6=
095">i915#6095</a>) +27 other tests skip</li></ul></li><li><p>igt@kms_ccs@c=
rc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1:</p><ul><li>sha=
rd-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_11160/shard-dg2-8/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-=
ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +163 other=
 tests skip</li></ul></li><li><p>igt@kms_ccs@random-ccs-data-4-tiled-xe2-cc=
s:</p><ul><li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_11160/shard-dg2-8/igt@kms_ccs@random-ccs-data-4-tiled-=
xe2-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/10278">i915#10278</a>)</li></ul></li><li><p>igt@kms_cdclk@m=
ode-transition-all-outputs:</p><ul><li>shard-mtlp: NOTRUN -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-mtlp-6/igt@kms_c=
dclk@mode-transition-all-outputs.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/7213">i915#7213</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9010">i915#9010</a>)=
</li><li>shard-rkl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_11160/shard-rkl-6/igt@kms_cdclk@mode-transition-all-outputs=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/3742">i915#3742</a>)</li></ul></li><li><p>igt@kms_cdclk@mode-trans=
ition@pipe-d-hdmi-a-3:</p><ul><li>shard-dg2: NOTRUN -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-dg2-1/igt@kms_cdclk@mo=
de-transition@pipe-d-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/7213">i915#7213</a>) +3 other tests s=
kip</li></ul></li><li><p>igt@kms_cdclk@plane-scaling:</p><ul><li>shard-dg1:=
 NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_111=
60/shard-dg1-16/igt@kms_cdclk@plane-scaling.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742">i915#3742</a>) +1=
 other test skip</li></ul></li><li><p>igt@kms_cdclk@plane-scaling@pipe-b-hd=
mi-a-3:</p><ul><li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_11160/shard-dg2-6/igt@kms_cdclk@plane-scaling@pip=
e-b-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/4087">i915#4087</a>) +3 other tests skip</li></ul></li=
><li><p>igt@kms_chamelium_audio@hdmi-audio-edid:</p><ul><li>shard-dg1: NOTR=
UN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/sh=
ard-dg1-18/igt@kms_chamelium_audio@hdmi-audio-edid.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828=
</a>) +8 other tests skip</li></ul></li><li><p>igt@kms_chamelium_edid@dp-ed=
id-change-during-suspend:</p><ul><li>shard-mtlp: NOTRUN -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-mtlp-7/igt@kms_cha=
melium_edid@dp-edid-change-during-suspend.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +3 o=
ther tests skip</li></ul></li><li><p>igt@kms_chamelium_frames@hdmi-cmp-plan=
ar-formats:</p><ul><li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_11160/shard-dg2-10/igt@kms_chamelium_frames@h=
dmi-cmp-planar-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +3 other tests skip</li=
></ul></li><li><p>igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:</p><ul><li>=
shard-tglu: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_11160/shard-tglu-3/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/7828">i915#7828</a>) +3 other tests skip</li></ul></li><li><p>igt@kms_=
chamelium_hpd@vga-hpd-fast:</p><ul><li>shard-rkl: NOTRUN -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-rkl-2/igt@kms_cha=
melium_hpd@vga-hpd-fast.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +9 other tests skip</l=
i></ul></li><li><p>igt@kms_content_protection@atomic:</p><ul><li>shard-dg1:=
 NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_111=
60/shard-dg1-18/igt@kms_content_protection@atomic.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7116">i915#7116=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9=
424">i915#9424</a>)</li><li>shard-dg2: NOTRUN -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-dg2-10/igt@kms_content_prote=
ction@atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/7118">i915#7118</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>)</li></ul></li><li><=
p>igt@kms_content_protection@atomic-dpms:</p><ul><li>shard-tglu: NOTRUN -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-tg=
lu-8/igt@kms_content_protection@atomic-dpms.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944">i915#6944</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7116">i91=
5#7116</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/7118">i915#7118</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/9424">i915#9424</a>) +1 other test skip</li><li>shard-rk=
l: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1=
1160/shard-rkl-5/igt@kms_content_protection@atomic-dpms.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118">i915#=
7118</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/9424">i915#9424</a>)</li></ul></li><li><p>igt@kms_content_protection@ato=
mic-dpms@pipe-a-dp-4:</p><ul><li>shard-dg2: NOTRUN -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-dg2-11/igt@kms_content_=
protection@atomic-dpms@pipe-a-dp-4.html">TIMEOUT</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/7173">i915#7173</a>)</li></ul=
></li><li><p>igt@kms_content_protection@dp-mst-lic-type-0:</p><ul><li>shard=
-mtlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_11160/shard-mtlp-7/igt@kms_content_protection@dp-mst-lic-type-0.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
3299">i915#3299</a>) +1 other test skip</li></ul></li><li><p>igt@kms_conten=
t_protection@dp-mst-type-0:</p><ul><li>shard-dg2: NOTRUN -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-dg2-11/igt@kms_co=
ntent_protection@dp-mst-type-0.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/3299">i915#3299</a>)</li></ul></li><=
li><p>igt@kms_content_protection@dp-mst-type-1:</p><ul><li>shard-rkl: NOTRU=
N -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/sha=
rd-rkl-4/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116">i915#3116=
</a>) +1 other test skip</li></ul></li><li><p>igt@kms_content_protection@li=
c-type-0:</p><ul><li>shard-dg1: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_11160/shard-dg1-16/igt@kms_content_protection@l=
ic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/9424">i915#9424</a>)</li></ul></li><li><p>igt@kms_content=
_protection@uevent@pipe-a-dp-4:</p><ul><li>shard-dg2: NOTRUN -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-dg2-11/igt@k=
ms_content_protection@uevent@pipe-a-dp-4.html">FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/1339">i915#1339</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7173">i915#7=
173</a>)</li></ul></li><li><p>igt@kms_cursor_crc@cursor-offscreen-512x170:<=
/p><ul><li>shard-tglu: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_11160/shard-tglu-6/igt@kms_cursor_crc@cursor-offscreen-5=
12x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/3359">i915#3359</a>)</li></ul></li><li><p>igt@kms_cursor_crc=
@cursor-onscreen-512x512:</p><ul><li>shard-mtlp: NOTRUN -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-mtlp-2/igt@kms_cur=
sor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/3359">i915#3359</a>)</li><li>shard-=
dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_11160/shard-dg2-3/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3359"=
>i915#3359</a>) +1 other test skip</li><li>shard-rkl: NOTRUN -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-rkl-3/igt@km=
s_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/3359">i915#3359</a>) +1 other =
test skip</li></ul></li><li><p>igt@kms_cursor_crc@cursor-rapid-movement-32x=
32:</p><ul><li>shard-mtlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11160/shard-mtlp-7/igt@kms_cursor_crc@cursor-rapid-m=
ovement-32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/8814">i915#8814</a>)</li></ul></li><li>=
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p><ul><li>shard-dg1: NOTRUN =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard=
-dg1-14/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3359">i915#3359=
</a>) +2 other tests skip</li></ul></li><li><p>igt@kms_cursor_legacy@basic-=
busy-flip-before-cursor-varying-size:</p><ul><li>shard-dg1: NOTRUN -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-dg1-13/=
igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/41=
03">i915#4103</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/4213">i915#4213</a>)</li></ul></li><li><p>igt@kms_cursor_legacy=
@cursorb-vs-flipa-atomic-transitions:</p><ul><li>shard-mtlp: NOTRUN -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-mtlp-3=
/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809">i9=
15#9809</a>) +3 other tests skip</li></ul></li><li><p>igt@kms_cursor_legacy=
@flip-vs-cursor-atomic-transitions:</p><ul><li>shard-glk: NOTRUN -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-glk3/igt@=
kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2346">i915#2346=
</a>)</li></ul></li><li><p>igt@kms_cursor_legacy@modeset-atomic-cursor-hots=
pot:</p><ul><li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11160/shard-dg2-8/igt@kms_cursor_legacy@modeset-atom=
ic-cursor-hotspot.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/9067">i915#9067</a>)</li><li>shard-dg1: NOTRUN -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-d=
g1-18/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9067">i91=
5#9067</a>)</li></ul></li><li><p>igt@kms_cursor_legacy@short-busy-flip-befo=
re-cursor-atomic-transitions:</p><ul><li>shard-rkl: NOTRUN -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-rkl-3/igt@kms_c=
ursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103"=
>i915#4103</a>)</li></ul></li><li><p>igt@kms_cursor_legacy@short-busy-flip-=
before-cursor-atomic-transitions-varying-size:</p><ul><li>shard-mtlp: NOTRU=
N -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/sha=
rd-mtlp-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transi=
tions-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/4213">i915#4213</a>)</li></ul></li><li><p>igt@km=
s_cursor_legacy@short-busy-flip-before-cursor-toggle:</p><ul><li>shard-tglu=
: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11=
160/shard-tglu-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/4103">i915#4103</a>) +1 other test skip</li><li>shard-dg2: NOTRUN =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard=
-dg2-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4=
103">i915#4103</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/4213">i915#4213</a>)</li></ul></li><li><p>igt@kms_cursor_legac=
y@torture-move@pipe-a:</p><ul><li>shard-dg1: <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGT_7864/shard-dg1-16/igt@kms_cursor_legacy@torture-m=
ove@pipe-a.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_11160/shard-dg1-16/igt@kms_cursor_legacy@torture-move@pipe-a=
.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/10166">i915#10166</a>)</li><li>shard-tglu: <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGT_7864/shard-tglu-3/igt@kms_cursor_leg=
acy@torture-move@pipe-a.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_11160/shard-tglu-6/igt@kms_cursor_legacy@tortur=
e-move@pipe-a.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/10166">i915#10166</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/1982">i915#1982</a>)</li></ul><=
/li><li><p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p><ul><li>shard-rkl: NOTRUN=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shar=
d-rkl-4/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723">i915#9723</a>)</li=
><li>shard-tglu: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_11160/shard-tglu-7/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
9723">i915#9723</a>)</li></ul></li><li><p>igt@kms_display_modes@extended-mo=
de-basic:</p><ul><li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_11160/shard-dg2-11/igt@kms_display_modes@extend=
ed-mode-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/3555">i915#3555</a>) +2 other tests skip</li><li>shar=
d-rkl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_11160/shard-rkl-4/igt@kms_display_modes@extended-mode-basic.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555=
">i915#3555</a>) +4 other tests skip</li><li>shard-mtlp: NOTRUN -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-mtlp-8/igt=
@kms_display_modes@extended-mode-basic.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8827">i915#882=
7</a>)</li></ul></li><li><p>igt@kms_draw_crc@draw-method-mmap-wc:</p><ul><l=
i>shard-dg1: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_11160/shard-dg1-18/igt@kms_draw_crc@draw-method-mmap-wc.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/88=
12">i915#8812</a>)</li></ul></li><li><p>igt@kms_dsc@dsc-fractional-bpp:</p>=
<ul><li>shard-dg1: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_11160/shard-dg1-17/igt@kms_dsc@dsc-fractional-bpp.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/38=
40">i915#3840</a>) +1 other test skip</li></ul></li><li><p>igt@kms_dsc@dsc-=
with-bpc:</p><ul><li>shard-rkl: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_11160/shard-rkl-3/igt@kms_dsc@dsc-with-bpc.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/3840">i915#3840</a>)</li></ul></li><li><p>igt@kms_dsc@dsc=
-with-bpc-formats:</p><ul><li>shard-dg1: NOTRUN -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-dg1-17/igt@kms_dsc@dsc-wit=
h-bpc-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>)</li></ul></li><li>=
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p><ul><li>shard-dg2: NOTR=
UN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/sh=
ard-dg2-6/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3=
840</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/9053">i915#9053</a>)</li><li>shard-dg1: NOTRUN -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-dg1-16/igt@kms_dsc@dsc-wi=
th-output-formats-with-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/9053">i915#9053</a>)</li><=
/ul></li><li><p>igt@kms_feature_discovery@chamelium:</p><ul><li>shard-rkl: =
NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1116=
0/shard-rkl-4/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4854">i915#4854=
</a>)</li></ul></li><li><p>igt@kms_feature_discovery@display-2x:</p><ul><li=
>shard-rkl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_11160/shard-rkl-4/igt@kms_feature_discovery@display-2x.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839=
">i915#1839</a>)</li></ul></li><li><p>igt@kms_feature_discovery@psr1:</p><u=
l><li>shard-tglu: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_11160/shard-tglu-4/igt@kms_feature_discovery@psr1.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658=
">i915#658</a>)</li><li>shard-rkl: NOTRUN -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_11160/shard-rkl-5/igt@kms_feature_discovery@=
psr1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/658">i915#658</a>)</li></ul></li><li><p>igt@kms_flip@2x-absolu=
te-wf_vblank:</p><ul><li>shard-tglu: NOTRUN -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-tglu-2/igt@kms_flip@2x-absolut=
e-wf_vblank.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/3637">i915#3637</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/3966">i915#3966</a>)</li></ul></li><li><p=
>igt@kms_flip@2x-dpms-vs-vblank-race:</p><ul><li>shard-mtlp: NOTRUN -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-mtlp-4=
/igt@kms_flip@2x-dpms-vs-vblank-race.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a>) +2 other =
tests skip</li></ul></li><li><p>igt@kms_flip@2x-flip-vs-dpms:</p><ul><li>sh=
ard-rkl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_11160/shard-rkl-2/igt@kms_flip@2x-flip-vs-dpms.html">SKIP</a> +49 othe=
r tests skip</li></ul></li><li><p>igt@kms_flip@2x-flip-vs-fences-interrupti=
ble:</p><ul><li>shard-mtlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_11160/shard-mtlp-4/igt@kms_flip@2x-flip-vs-fences-i=
nterruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/8381">i915#8381</a>)</li></ul></li><li><p>igt@kms_flip=
@2x-flip-vs-modeset-vs-hang:</p><ul><li>shard-dg2: NOTRUN -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-dg2-5/igt@kms_fl=
ip@2x-flip-vs-modeset-vs-hang.html">SKIP</a> +14 other tests skip</li></ul>=
</li><li><p>igt@kms_flip@2x-flip-vs-panning-interruptible:</p><ul><li>shard=
-dg1: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_11160/shard-dg1-17/igt@kms_flip@2x-flip-vs-panning-interruptible.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
9934">i915#9934</a>) +1 other test skip</li></ul></li><li><p>igt@kms_flip@f=
lip-vs-fences-interruptible:</p><ul><li>shard-dg2: NOTRUN -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-dg2-5/igt@kms_fl=
ip@flip-vs-fences-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/8381">i915#8381</a>)</li><li>shard-=
dg1: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_11160/shard-dg1-17/igt@kms_flip@flip-vs-fences-interruptible.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381"=
>i915#8381</a>)</li></ul></li><li><p>igt@kms_flip_scaled_crc@flip-32bpp-yft=
ile-to-32bpp-yftileccs-downscaling@pipe-a-default-mode:</p><ul><li>shard-mt=
lp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
11160/shard-mtlp-5/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftil=
eccs-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a>)</li></ul>=
</li><li><p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-up=
scaling@pipe-a-valid-mode:</p><ul><li>shard-dg1: NOTRUN -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-dg1-13/igt@kms_fli=
p_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mo=
de.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/2587">i915#2587</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/2672">i915#2672</a>) +2 other tests skip</li></ul>=
</li><li><p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-do=
wnscaling@pipe-a-valid-mode:</p><ul><li>shard-rkl: NOTRUN -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-rkl-4/igt@kms_fl=
ip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid=
-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/2672">i915#2672</a>) +4 other tests skip</li></ul></li><li><p=
>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a=
-default-mode:</p><ul><li>shard-mtlp: NOTRUN -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-mtlp-2/igt@kms_flip_scaled_cr=
c@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3=
555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/8810">i915#8810</a>)</li></ul></li><li><p>igt@kms_flip_scaled_=
crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling@pipe-a-valid-mode:</p><ul=
><li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_11160/shard-dg2-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-=
16bpp-yftile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a>) +2 =
other tests skip</li></ul></li><li><p>igt@kms_flip_scaled_crc@flip-64bpp-yf=
tile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:</p><ul><li>shard-tglu: NO=
TRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/=
shard-tglu-9/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upsc=
aling@pipe-a-valid-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/2587">i915#2587</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a>) +3 other=
 tests skip</li></ul></li><li><p>igt@kms_frontbuffer_tracking@fbc-2p-primsc=
rn-spr-indfb-move:</p><ul><li>shard-tglu: NOTRUN -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-tglu-5/igt@kms_frontbuffe=
r_tracking@fbc-2p-primscrn-spr-indfb-move.html">SKIP</a> +36 other tests sk=
ip</li></ul></li><li><p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-in=
dfb-move:</p><ul><li>shard-snb: <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGT_7864/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-c=
ur-indfb-move.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_11160/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-scnd=
scrn-cur-indfb-move.html">SKIP</a> +1 other test skip</li></ul></li><li><p>=
igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:</p><ul><li>s=
hard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_11160/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-=
plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/5354">i915#5354</a>) +29 other tests skip</li></ul></li>=
<li><p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:</p><u=
l><li>shard-dg1: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_11160/shard-dg1-14/igt@kms_frontbuffer_tracking@fbc-2p-scndscr=
n-shrfb-pgflip-blt.html">SKIP</a> +43 other tests skip</li></ul></li><li><p=
>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p><u=
l><li>shard-dg1: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_11160/shard-dg1-18/igt@kms_frontbuffer_tracking@fbc-2p-scndscr=
n-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +14 other tests skip<=
/li></ul></li><li><p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p><ul><li>=
shard-dg1: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_11160/shard-dg1-18/igt@kms_frontbuffer_tracking@fbc-tiling-4.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/5439">i915#5439</a>)</li></ul></li><li><p>igt@kms_frontbuffer_tracking@fbc=
psr-1p-offscren-pri-indfb-draw-pwrite:</p><ul><li>shard-dg2: NOTRUN -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-dg2-5/=
igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-pwrite.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3458">i915#3458</a>) +5 other tests skip</li></ul></li><li><p>igt@kms_fr=
ontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:</p><ul><li>shard-dg1: NOT=
RUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/s=
hard-dg1-13/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/3458">i915#3458</a>) +12 other tests skip</li></ul></li><li><p>igt@kms_=
frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc:</p><ul><li>=
shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_11160/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pr=
i-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +15 other tests skip</li>=
</ul></li><li><p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgfl=
ip-blt:</p><ul><li>shard-rkl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_11160/shard-rkl-5/igt@kms_frontbuffer_tracking@fb=
cpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +41 other te=
sts skip</li></ul></li><li><p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010=
-draw-mmap-wc:</p><ul><li>shard-rkl: NOTRUN -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-rkl-2/igt@kms_frontbuffer_trac=
king@fbcpsr-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) +21 other t=
ests skip</li></ul></li><li><p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4=
:</p><ul><li>shard-rkl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_11160/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-t=
iling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/5439">i915#5439</a>)</li></ul></li><li><p>igt@kms_frontbuff=
er_tracking@pipe-fbc-rte:</p><ul><li>shard-dg1: NOTRUN -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-dg1-13/igt@kms_fron=
tbuffer_tracking@pipe-fbc-rte.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/9766">i915#9766</a>)</li><li>shard-dg=
2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1=
1160/shard-dg2-2/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9766">i9=
15#9766</a>)</li></ul></li><li><p>igt@kms_frontbuffer_tracking@psr-2p-prims=
crn-indfb-pgflip-blt:</p><ul><li>shard-mtlp: NOTRUN -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-mtlp-4/igt@kms_frontbu=
ffer_tracking@psr-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>)=
 +14 other tests skip</li></ul></li><li><p>igt@kms_frontbuffer_tracking@psr=
-2p-primscrn-pri-indfb-draw-mmap-gtt:</p><ul><li>shard-mtlp: NOTRUN -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-mtlp-5=
/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-gtt.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/8708">i915#8708</a>) +6 other tests skip</li></ul></li><li><p>igt@kms_hd=
r@static-toggle:</p><ul><li>shard-dg2: NOTRUN -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-dg2-8/igt@kms_hdr@static-tog=
gle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li><li>shard-rkl: NOTRUN -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-r=
kl-2/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</=
li></ul></li><li><p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>=
<ul><li>shard-rkl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_11160/shard-rkl-4/igt@kms_multipipe_modeset@basic-max-pipe-c=
rc-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/4816">i915#4816</a>)</li><li>shard-dg1: NOTRUN -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-dg1-16/igt=
@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839">i915#1839</a>=
)</li></ul></li><li><p>igt@kms_panel_fitting@atomic-fastset:</p><ul><li>sha=
rd-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_11160/shard-dg2-10/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301">i=
915#6301</a>) +1 other test skip</li></ul></li><li><p>igt@kms_panel_fitting=
@legacy:</p><ul><li>shard-rkl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_11160/shard-rkl-5/igt@kms_panel_fitting@legacy.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/6301">i915#6301</a>)</li><li>shard-dg1: NOTRUN -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-dg1-13/igt@kms_panel=
_fitting@legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/6301">i915#6301</a>)</li></ul></li><li><p>igt@kms_p=
lane_alpha_blend@alpha-basic@pipe-c-hdmi-a-1:</p><ul><li>shard-glk: NOTRUN =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard=
-glk7/igt@kms_plane_alpha_blend@alpha-basic@pipe-c-hdmi-a-1.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7862">i=
915#7862</a>) +1 other test fail</li></ul></li><li><p>igt@kms_plane_lowres@=
tiling-x@pipe-a-edp-1:</p><ul><li>shard-mtlp: NOTRUN -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-mtlp-3/igt@kms_plane_=
lowres@tiling-x@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/3582">i915#3582</a>) +7 other tests sk=
ip</li></ul></li><li><p>igt@kms_plane_multiple@tiling-4:</p><ul><li>shard-t=
glu: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_11160/shard-tglu-4/igt@kms_plane_multiple@tiling-4.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555=
</a>)</li></ul></li><li><p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-=
hdmi-a-3:</p><ul><li>shard-dg1: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_11160/shard-dg1-13/igt@kms_plane_scaling@intel-=
max-src-size@pipe-a-hdmi-a-3.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/8292">i915#8292</a>)</li></ul></li><li=
><p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pip=
e-a-hdmi-a-2:</p><ul><li>shard-rkl: NOTRUN -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-rkl-3/igt@kms_plane_scaling@pla=
ne-downscale-factor-0-25-with-pixel-format@pipe-a-hdmi-a-2.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i9=
15#9423</a>) +3 other tests skip</li></ul></li><li><p>igt@kms_plane_scaling=
@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-2:</p><ul><li>=
shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_11160/shard-dg2-3/igt@kms_plane_scaling@plane-downscale-factor-0-25-=
with-pixel-format@pipe-c-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) +7 other tes=
ts skip</li></ul></li><li><p>igt@kms_plane_scaling@plane-scaler-unity-scali=
ng-with-rotation@pipe-d-hdmi-a-4:</p><ul><li>shard-dg1: NOTRUN -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-dg1-17/igt@=
kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-d-hdmi-a-4.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/9423">i915#9423</a>) +3 other tests skip</li></ul></li><li><p>igt@k=
ms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b-hdmi-a-2=
:</p><ul><li>shard-rkl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_11160/shard-rkl-3/igt@kms_plane_scaling@planes-downscal=
e-factor-0-25-upscale-20x20@pipe-b-hdmi-a-2.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5235">i915#5235</a>) +5=
 other tests skip</li></ul></li><li><p>igt@kms_plane_scaling@planes-downsca=
le-factor-0-25@pipe-a-edp-1:</p><ul><li>shard-mtlp: NOTRUN -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-mtlp-5/igt@kms_=
plane_scaling@planes-downscale-factor-0-25@pipe-a-edp-1.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5235">i915#=
5235</a>) +5 other tests skip</li></ul></li><li><p>igt@kms_plane_scaling@pl=
anes-downscale-factor-0-25@pipe-d-edp-1:</p><ul><li>shard-mtlp: NOTRUN -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-mtl=
p-5/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-edp-1.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/5235">i915#5235</a>) +1 other test skip</li></ul></li><li><p=
>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pip=
e-a-hdmi-a-3:</p><ul><li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-dg2-6/igt@kms_plane_scaling@pla=
nes-upscale-factor-0-25-downscale-factor-0-25@pipe-a-hdmi-a-3.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5235"=
>i915#5235</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/9423">i915#9423</a>) +19 other tests skip</li></ul></li><li><p>igt=
@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-=
hdmi-a-4:</p><ul><li>shard-dg1: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_11160/shard-dg1-17/igt@kms_plane_scaling@planes=
-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-4.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5235">i9=
15#5235</a>) +11 other tests skip</li></ul></li><li><p>igt@kms_pm_backlight=
@bad-brightness:</p><ul><li>shard-dg1: NOTRUN -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-dg1-14/igt@kms_pm_backlight@=
bad-brightness.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/5354">i915#5354</a>) +1 other test skip</li></ul></l=
i><li><p>igt@kms_pm_backlight@basic-brightness:</p><ul><li>shard-rkl: NOTRU=
N -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/sha=
rd-rkl-5/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)=
 +1 other test skip</li></ul></li><li><p>igt@kms_pm_backlight@fade-with-dpm=
s:</p><ul><li>shard-tglu: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_11160/shard-tglu-7/igt@kms_pm_backlight@fade-with-dpm=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/9812">i915#9812</a>)</li></ul></li><li><p>igt@kms_pm_lpsp@screens=
-disabled:</p><ul><li>shard-tglu: NOTRUN -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_11160/shard-tglu-9/igt@kms_pm_lpsp@screens-di=
sabled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/8430">i915#8430</a>)</li></ul></li><li><p>igt@kms_pm_rpm@dpm=
s-mode-unset-lpsp:</p><ul><li>shard-dg2: <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGT_7864/shard-dg2-10/igt@kms_pm_rpm@dpms-mode-unset-lpsp=
.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_11160/shard-dg2-2/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519">i9=
15#9519</a>)</li></ul></li><li><p>igt@kms_pm_rpm@dpms-non-lpsp:</p><ul><li>=
shard-mtlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_11160/shard-mtlp-6/igt@kms_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519">i915#=
9519</a>)</li></ul></li><li><p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wa=
it:</p><ul><li>shard-rkl: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGT_7864/shard-rkl-3/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
11160/shard-rkl-2/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/95=
19">i915#9519</a>)</li><li>shard-tglu: NOTRUN -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-tglu-9/igt@kms_pm_rpm@modese=
t-non-lpsp-stress-no-wait.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/9519">i915#9519</a>)</li></ul></li><li><p=
>igt@kms_prime@basic-crc-vgem:</p><ul><li>shard-dg2: NOTRUN -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-dg2-8/igt@km=
s_prime@basic-crc-vgem.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/6524">i915#6524</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/6805">i915#6805</a>) +1 other =
test skip</li></ul></li><li><p>igt@kms_prime@d3hot:</p><ul><li>shard-rkl: N=
OTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160=
/shard-rkl-2/igt@kms_prime@d3hot.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/6524">i915#6524</a>)</li></ul></li=
><li><p>igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf@psr2-pip=
e-a-edp-1:</p><ul><li>shard-mtlp: NOTRUN -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_11160/shard-mtlp-8/igt@kms_psr2_sf@fbc-cursor=
-plane-move-continuous-exceed-sf@psr2-pipe-a-edp-1.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9808">i915#9808=
</a>) +3 other tests skip</li></ul></li><li><p>igt@kms_psr2_su@page_flip-p0=
10:</p><ul><li>shard-dg1: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_11160/shard-dg1-14/igt@kms_psr2_su@page_flip-p010.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/9683">i915#9683</a>) +2 other tests skip</li></ul></li><li><p>igt@kms_=
psr2_su@page_flip-xrgb8888:</p><ul><li>shard-dg2: NOTRUN -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-dg2-10/igt@kms_ps=
r2_su@page_flip-xrgb8888.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/9683">i915#9683</a>)</li></ul></li><li><p>=
igt@kms_psr@fbc-pr-primary-blt:</p><ul><li>shard-mtlp: NOTRUN -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-mtlp-3/igt@k=
ms_psr@fbc-pr-primary-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/9688">i915#9688</a>) +6 other tests skip<=
/li></ul></li><li><p>igt@kms_psr@fbc-psr2-no-drrs:</p><ul><li>shard-tglu: N=
OTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160=
/shard-tglu-9/igt@kms_psr@fbc-psr2-no-drrs.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +8 =
other tests skip</li></ul></li><li><p>igt@kms_psr@fbc-psr2-sprite-render:</=
p><ul><li>shard-rkl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_11160/shard-rkl-2/igt@kms_psr@fbc-psr2-sprite-render.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/9732">i915#9732</a>) +22 other tests skip</li></ul></li><l=
i><p>igt@kms_psr@psr2-primary-mmap-gtt:</p><ul><li>shard-dg2: NOTRUN -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-dg2-5=
/igt@kms_psr@psr2-primary-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a=
>) +8 other tests skip</li></ul></li><li><p>igt@kms_psr@psr2-primary-page-f=
lip:</p><ul><li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_11160/shard-dg2-11/igt@kms_psr@psr2-primary-page-fli=
p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/9673">i915#9673</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +2 other tests s=
kip</li></ul></li><li><p>igt@kms_psr@psr2-sprite-blt:</p><ul><li>shard-dg1:=
 NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_111=
60/shard-dg1-16/igt@kms_psr@psr2-sprite-blt.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i91=
5#9732</a>) +22 other tests skip</li></ul></li><li><p>igt@kms_psr@psr2-spri=
te-plane-onoff:</p><ul><li>shard-glk: NOTRUN -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-glk7/igt@kms_psr@psr2-sprite-=
plane-onoff.html">SKIP</a> +243 other tests skip</li></ul></li><li><p>igt@k=
ms_psr_stress_test@flip-primary-invalidate-overlay:</p><ul><li>shard-rkl: N=
OTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160=
/shard-rkl-5/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/9685">i915#9685</a>)</li></ul></li><li><p>igt@kms_rotation_crc@bad-pixel-=
format:</p><ul><li>shard-mtlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_11160/shard-mtlp-6/igt@kms_rotation_crc@bad-pixe=
l-format.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/4235">i915#4235</a>) +2 other tests skip</li></ul></li><li=
><p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p><ul><li>shard-rkl=
: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11=
160/shard-rkl-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5=
289">i915#5289</a>) +1 other test skip</li><li>shard-tglu: NOTRUN -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-tglu-2/i=
gt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a=
>)</li></ul></li><li><p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180=
:</p><ul><li>shard-dg1: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_11160/shard-dg1-14/igt@kms_rotation_crc@primary-yf-tile=
d-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/5289">i915#5289</a>)</li></ul></li><li><p>igt@kms_s=
etmode@clone-exclusive-crtc:</p><ul><li>shard-dg1: NOTRUN -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-dg1-14/igt@kms_s=
etmode@clone-exclusive-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +5 other tests ski=
p</li></ul></li><li><p>igt@kms_sysfs_edid_timing:</p><ul><li>shard-dg1: NOT=
RUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/s=
hard-dg1-15/igt@kms_sysfs_edid_timing.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/igt-gpu-tools/issues/2">IGT#2</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6493">i915#6493</a>)</=
li></ul></li><li><p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:</p=
><ul><li>shard-mtlp: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
T_7864/shard-mtlp-7/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_11160/shard-mtlp-6/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.htm=
l">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/9196">i915#9196</a>)</li></ul></li><li><p>igt@kms_universal_plane@curs=
or-fb-leak@pipe-a-hdmi-a-1:</p><ul><li>shard-snb: <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGT_7864/shard-snb6/igt@kms_universal_plane@curs=
or-fb-leak@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_11160/shard-snb2/igt@kms_universal_plane@cur=
sor-fb-leak@pipe-a-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/9196">i915#9196</a>)</li></ul></li><li>=
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-3:</p><ul><li>shard=
-dg1: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_11160/shard-dg1-13/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-3=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/9196">i915#9196</a>)</li></ul></li><li><p>igt@kms_vrr@seamless-rr-=
switch-drrs:</p><ul><li>shard-dg1: NOTRUN -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_11160/shard-dg1-17/igt@kms_vrr@seamless-rr-s=
witch-drrs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/9906">i915#9906</a>)</li></ul></li><li><p>igt@kms_writeb=
ack@writeback-check-output-xrgb2101010:</p><ul><li>shard-dg2: NOTRUN -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-dg2-2=
/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437">i915#24=
37</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/9412">i915#9412</a>)</li></ul></li><li><p>igt@kms_writeback@writeback-fb-i=
d:</p><ul><li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_11160/shard-dg2-10/igt@kms_writeback@writeback-fb-id.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/2437">i915#2437</a>)</li><li>shard-rkl: NOTRUN -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-rkl-4/igt@kms_writeb=
ack@writeback-fb-id.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/2437">i915#2437</a>)</li></ul></li><li><p>igt@k=
ms_writeback@writeback-invalid-parameters:</p><ul><li>shard-dg1: NOTRUN -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-dg=
1-16/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437">i915#2437=
</a>)</li><li>shard-glk: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_11160/shard-glk1/igt@kms_writeback@writeback-invalid-p=
arameters.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/2437">i915#2437</a>)</li></ul></li><li><p>igt@perf@per-co=
ntext-mode-unprivileged:</p><ul><li>shard-rkl: NOTRUN -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-rkl-2/igt@perf@per-c=
ontext-mode-unprivileged.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/2435">i915#2435</a>)</li></ul></li><li><p>=
igt@perf@unprivileged-single-ctx-counters:</p><ul><li>shard-dg1: NOTRUN -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-dg=
1-17/igt@perf@unprivileged-single-ctx-counters.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2433">i915#2433</a>)=
</li></ul></li><li><p>igt@perf_pmu@busy-double-start@vecs1:</p><ul><li>shar=
d-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_11160/shard-dg2-10/igt@perf_pmu@busy-double-start@vecs1.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349">i9=
15#4349</a>) +3 other tests fail</li></ul></li><li><p>igt@perf_pmu@cpu-hotp=
lug:</p><ul><li>shard-mtlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_11160/shard-mtlp-6/igt@perf_pmu@cpu-hotplug.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/8850">i915#8850</a>)</li></ul></li><li><p>igt@perf_pmu@rc6@other-idle-gt0:=
</p><ul><li>shard-rkl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_11160/shard-rkl-4/igt@perf_pmu@rc6@other-idle-gt0.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/8516">i915#8516</a>)</li></ul></li><li><p>igt@prime_vgem@basic-fence-read=
:</p><ul><li>shard-mtlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_11160/shard-mtlp-1/igt@prime_vgem@basic-fence-read.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/3708">i915#3708</a>)</li></ul></li><li><p>igt@prime_vgem@basic-read:</=
p><ul><li>shard-rkl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_11160/shard-rkl-5/igt@prime_vgem@basic-read.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291">=
i915#3291</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/3708">i915#3708</a>)</li></ul></li><li><p>igt@prime_vgem@fence-writ=
e-hang:</p><ul><li>shard-dg1: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_11160/shard-dg1-13/igt@prime_vgem@fence-write-han=
g.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3708">i915#3708</a>)</li></ul></li><li><p>igt@sriov_basic@enable-=
vfs-autoprobe-off:</p><ul><li>shard-dg2: NOTRUN -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-dg2-8/igt@sriov_basic@enab=
le-vfs-autoprobe-off.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/9917">i915#9917</a>)</li><li>shard-tglu: NOTRU=
N -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/sha=
rd-tglu-8/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917">i915#9917=
</a>)</li></ul></li><li><p>igt@tools_test@sysfs_l3_parity:</p><ul><li>shard=
-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_11160/shard-dg2-2/igt@tools_test@sysfs_l3_parity.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4818">i915#4818=
</a>)</li></ul></li><li><p>igt@v3d/v3d_get_param@get-bad-param:</p><ul><li>=
shard-dg1: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_11160/shard-dg1-15/igt@v3d/v3d_get_param@get-bad-param.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575"=
>i915#2575</a>) +6 other tests skip</li></ul></li><li><p>igt@v3d/v3d_submit=
_cl@simple-flush-cache:</p><ul><li>shard-dg2: NOTRUN -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-dg2-1/igt@v3d/v3d_sub=
mit_cl@simple-flush-cache.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +7 other tests skip<=
/li></ul></li><li><p>igt@v3d/v3d_wait_bo@used-bo:</p><ul><li>shard-mtlp: NO=
TRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/=
shard-mtlp-2/igt@v3d/v3d_wait_bo@used-bo.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +5 ot=
her tests skip</li></ul></li><li><p>igt@vc4/vc4_create_bo@create-bo-zeroed:=
</p><ul><li>shard-rkl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_11160/shard-rkl-6/igt@vc4/vc4_create_bo@create-bo-zeroed=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/7711">i915#7711</a>) +7 other tests skip</li></ul></li><li><p>igt@=
vc4/vc4_label_bo@set-bad-handle:</p><ul><li>shard-mtlp: NOTRUN -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-mtlp-2/igt@=
vc4/vc4_label_bo@set-bad-handle.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/7711">i915#7711</a>) +2 other tests=
 skip</li></ul></li><li><p>igt@vc4/vc4_mmap@mmap-bad-handle:</p><ul><li>sha=
rd-dg1: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_11160/shard-dg1-16/igt@vc4/vc4_mmap@mmap-bad-handle.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7711">i915#=
7711</a>) +6 other tests skip</li></ul></li><li><p>igt@vc4/vc4_tiling@set-g=
et:</p><ul><li>shard-dg2: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_11160/shard-dg2-8/igt@vc4/vc4_tiling@set-get.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
7711">i915#7711</a>) +4 other tests skip</li></ul></li><li><p>igt@vc4/vc4_w=
ait_bo@used-bo-0ns:</p><ul><li>shard-tglu: NOTRUN -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-tglu-4/igt@vc4/vc4_wait_=
bo@used-bo-0ns.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/2575">i915#2575</a>) +5 other tests skip</li></ul></=
li></ul><h4>Possible fixes</h4><ul><li><p>igt@device_reset@unbind-reset-reb=
ind:</p><ul><li>shard-dg2: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGT_7864/shard-dg2-11/igt@device_reset@unbind-reset-rebind.html">INCOMP=
LETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/5507">i915#5507</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_11160/shard-dg2-11/igt@device_reset@unbind-reset-rebind.html">P=
ASS</a></li><li>shard-mtlp: <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGT_7864/shard-mtlp-8/igt@device_reset@unbind-reset-rebind.html">ABORT=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/55=
07">i915#5507</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_11160/shard-mtlp-8/igt@device_reset@unbind-reset-rebind.html">PASS<=
/a></li></ul></li><li><p>igt@drm_fdinfo@most-busy-check-all@rcs0:</p><ul><l=
i>shard-rkl: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7864/s=
hard-rkl-6/igt@drm_fdinfo@most-busy-check-all@rcs0.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7742">i915#7742=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160=
/shard-rkl-5/igt@drm_fdinfo@most-busy-check-all@rcs0.html">PASS</a></li></u=
l></li><li><p>igt@gem_eio@kms:</p><ul><li>shard-tglu: <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGT_7864/shard-tglu-3/igt@gem_eio@kms.html">=
INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/10513">i915#10513</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_11160/shard-tglu-7/igt@gem_eio@kms.html">PASS</a></li><=
/ul></li><li><p>igt@gem_exec_fair@basic-none-share@rcs0:</p><ul><li>shard-r=
kl: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7864/shard-rkl-=
5/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/2842">i915#2842</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-rkl=
-1/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a></li></ul></li><li=
><p>igt@gem_lmem_swapping@heavy-multi@lmem0:</p><ul><li>shard-dg2: <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7864/shard-dg2-8/igt@gem_l=
mem_swapping@heavy-multi@lmem0.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/10378">i915#10378</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-dg2-3/igt@ge=
m_lmem_swapping@heavy-multi@lmem0.html">PASS</a></li></ul></li><li><p>igt@g=
em_lmem_swapping@heavy-verify-multi@lmem0:</p><ul><li>shard-dg1: <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7864/shard-dg1-15/igt@gem_lme=
m_swapping@heavy-verify-multi@lmem0.html">FAIL</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/10378">i915#10378</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-dg1-14/=
igt@gem_lmem_swapping@heavy-verify-multi@lmem0.html">PASS</a></li></ul></li=
><li><p>igt@gem_lmem_swapping@smem-oom@lmem0:</p><ul><li>shard-dg1: <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7864/shard-dg1-17/igt@gem_=
lmem_swapping@smem-oom@lmem0.html">TIMEOUT</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/5493">i915#5493</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-dg1-15/igt@g=
em_lmem_swapping@smem-oom@lmem0.html">PASS</a></li></ul></li><li><p>igt@i91=
5_module_load@reload-with-fault-injection:</p><ul><li>shard-glk: <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7864/shard-glk6/igt@i915_modu=
le_load@reload-with-fault-injection.html">INCOMPLETE</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982">i915#1982</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9849">i915#=
9849</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1=
1160/shard-glk7/igt@i915_module_load@reload-with-fault-injection.html">PASS=
</a></li></ul></li><li><p>igt@kms_busy@extended-modeset-hang-oldfb-with-res=
et@pipe-b:</p><ul><li>shard-snb: <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGT_7864/shard-snb7/igt@kms_busy@extended-modeset-hang-oldfb-with=
-reset@pipe-b.html">ABORT</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_11160/shard-snb4/igt@kms_busy@extended-modeset-hang-oldf=
b-with-reset@pipe-b.html">PASS</a></li></ul></li><li><p>igt@kms_flip@plain-=
flip-fb-recreate-interruptible@c-hdmi-a3:</p><ul><li>shard-dg2: <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7864/shard-dg2-6/igt@kms_flip@=
plain-flip-fb-recreate-interruptible@c-hdmi-a3.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2122">i915#2122</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shar=
d-dg2-5/igt@kms_flip@plain-flip-fb-recreate-interruptible@c-hdmi-a3.html">P=
ASS</a> +1 other test pass</li></ul></li><li><p>igt@kms_frontbuffer_trackin=
g@fbc-2p-scndscrn-spr-indfb-fullscreen:</p><ul><li>shard-snb: <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/IGT_7864/shard-snb5/igt@kms_frontbuf=
fer_tracking@fbc-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-snb7/igt@=
kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-fullscreen.html">PASS</a=
></li></ul></li><li><p>igt@kms_pm_rpm@modeset-lpsp:</p><ul><li>shard-dg2: <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7864/shard-dg2-7/igt=
@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/9519">i915#9519</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-dg2-4/igt@kms_pm_rpm=
@modeset-lpsp.html">PASS</a> +2 other tests pass</li><li>shard-rkl: <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7864/shard-rkl-6/igt@kms_p=
m_rpm@modeset-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/9519">i915#9519</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-rkl-2/igt@kms_pm_rpm@modes=
et-lpsp.html">PASS</a> +2 other tests pass</li></ul></li></ul><h4>Warnings<=
/h4><ul><li><p>igt@gem_create@create-ext-cpu-access-big:</p><ul><li>shard-d=
g2: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7864/shard-dg2-=
3/igt@gem_create@create-ext-cpu-access-big.html">ABORT</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9846">i915#9846</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-d=
g2-2/igt@gem_create@create-ext-cpu-access-big.html">INCOMPLETE</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9364">i915#9364=
</a>)</li></ul></li><li><p>igt@kms_psr@fbc-psr-suspend:</p><ul><li>shard-dg=
2: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7864/shard-dg2-1=
1/igt@kms_psr@fbc-psr-suspend.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9673">i915#9673</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i91=
5#9732</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_11160/shard-dg2-8/igt@kms_psr@fbc-psr-suspend.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">=
i915#9732</a>) +9 other tests skip</li></ul></li><li><p>igt@kms_psr@fbc-psr=
2-sprite-mmap-cpu:</p><ul><li>shard-dg2: <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGT_7864/shard-dg2-10/igt@kms_psr@fbc-psr2-sprite-mmap-cp=
u.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_11160/shard-dg2-11/igt@kms_psr@fbc-psr2-s=
prite-mmap-cpu.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/1072">i915#1072</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/9673">i915#9673</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +6 =
other tests skip</li></ul></li></ul><h2>Build changes</h2><ul><li>CI: CI-20=
190529 -&gt; None</li><li>IGT: IGT_7864 -&gt; IGTPW_11160</li></ul><p>CI-20=
190529: 20190529<br> CI_DRM_14785: 1ba62f8cea9c797427d45108df1d453f4b343240=
 @ git://anongit.freedesktop.org/gfx-ci/linux<br> IGTPW_11160: 11160<br> IG=
T_7864: 8eff53c9664fa0abaa55b403c9f10f96260e44b7 @ https://gitlab.freedeskt=
op.org/drm/igt-gpu-tools.git</p></blockquote><div><br></div><div><span></sp=
an></div></body></html>

--=-Vj0j8uviD0SyAuVxdzbS--
