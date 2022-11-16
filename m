Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05AE410E06D
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Nov 2022 15:06:06 +0000 (UTC)
Received: by mail-yb1-xb2a.google.com with SMTP id e68so18457853ybh.2
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Nov 2022 07:06:05 -0800 (PST)
MIME-Version: 1.0
References: <20221107171845.3663446-1-markyacoub@chromium.org>
 <166856886576.29189.15183652980955083203@emeril.freedesktop.org>
In-Reply-To: <166856886576.29189.15183652980955083203@emeril.freedesktop.org>
From: Mark Yacoub <markyacoub@chromium.org>
Date: Wed, 16 Nov 2022 10:05:53 -0500
Message-ID: <CAJUqKUogXEHsKQnf=2MDXVk5eeNM4pevM=GTXeUy4hu6isSfVw@mail.gmail.com>
To: "Vudum, Lakshminarayana" <lakshminarayana.vudum@intel.com>
Content-Type: multipart/alternative; boundary="000000000000bc9ae905ed97cf25"
Subject: Re: [igt-dev]
	=?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgQ2hhbWVs?=
	=?utf-8?q?ium=3A_Add_new_EDID_Resolution_List_test_=28rev3=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--000000000000bc9ae905ed97cf25
Content-Type: text/plain; charset="UTF-8"

Hi Lakshminarayana, can I get a rerun please.

On Tue, Nov 15, 2022 at 10:21 PM Patchwork <patchwork@emeril.freedesktop.org>
wrote:

> *Patch Details*
> *Series:* Chamelium: Add new EDID Resolution List test (rev3)
> *URL:* https://patchwork.freedesktop.org/series/110614/
> *State:* failure
> *Details:* https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/index.html CI
> Bug Log - changes from IGT_7059_full -> IGTPW_8109_full Summary
>
> *FAILURE*
>
> Serious unknown changes coming with IGTPW_8109_full absolutely need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_8109_full, please notify your bug team to allow them
> to document this new failure mode, which will reduce false positives in CI.
>
> External URL:
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/index.html
> Participating hosts (8 -> 8)
>
> No changes in participating hosts
> Possible new issues
>
> Here are the unknown changes that may have been introduced in
> IGTPW_8109_full:
> IGT changes Possible regressions
>
>    -
>
>    igt@i915_pm_dc@dc5-psr:
>    - shard-tglb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7059/shard-tglb2/igt@i915_pm_dc@dc5-psr.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-tglb5/igt@i915_pm_dc@dc5-psr.html>
>    -
>
>    {igt@kms_chamelium@dp-edid-resolution-list} (NEW):
>    - {shard-rkl}: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-rkl-2/igt@kms_chamelium@dp-edid-resolution-list.html>
>    -
>
>    igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:
>    - shard-iclb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7059/shard-iclb3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html>
>
> Suppressed
>
> The following results come from untrusted machines, tests, or statuses.
> They do not affect the overall result.
>
>    - igt@fbdev@read:
>       - {shard-dg1}: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7059/shard-dg1-18/igt@fbdev@read.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-dg1-19/igt@fbdev@read.html>
>
> New tests
>
> New tests have been introduced between IGT_7059_full and IGTPW_8109_full:
> New IGT tests (1)
>
>    - igt@kms_chamelium@dp-edid-resolution-list:
>       - Statuses : 6 skip(s)
>       - Exec time: [0.0] s
>
> Known issues
>
> Here are the changes found in IGTPW_8109_full that come from known issues:
> IGT changes Issues hit
>
>    -
>
>    igt@feature_discovery@display-2x:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb2/igt@feature_discovery@display-2x.html>
>       (i915#1839 <https://gitlab.freedesktop.org/drm/intel/issues/1839>)
>    -
>
>    igt@feature_discovery@psr2:
>    - shard-iclb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7059/shard-iclb2/igt@feature_discovery@psr2.html>
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb6/igt@feature_discovery@psr2.html>
>       (i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>)
>    -
>
>    igt@gem_create@create-ext-cpu-access-sanity-check:
>    -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-tglb7/igt@gem_create@create-ext-cpu-access-sanity-check.html>
>       (i915#6335 <https://gitlab.freedesktop.org/drm/intel/issues/6335>)
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb6/igt@gem_create@create-ext-cpu-access-sanity-check.html>
>       (i915#6335 <https://gitlab.freedesktop.org/drm/intel/issues/6335>)
>       -
>
>    igt@gem_ctx_persistence@legacy-engines-mixed-process:
>    - shard-snb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-snb2/igt@gem_ctx_persistence@legacy-engines-mixed-process.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#1099 <https://gitlab.freedesktop.org/drm/intel/issues/1099>)
>       +1 similar issue
>    -
>
>    igt@gem_eio@unwedge-stress:
>    - shard-snb: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-snb5/igt@gem_eio@unwedge-stress.html>
>       (i915#3354 <https://gitlab.freedesktop.org/drm/intel/issues/3354>)
>    -
>
>    igt@gem_exec_balancer@parallel-bb-first:
>    - shard-iclb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7059/shard-iclb1/igt@gem_exec_balancer@parallel-bb-first.html>
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb3/igt@gem_exec_balancer@parallel-bb-first.html>
>       (i915#4525 <https://gitlab.freedesktop.org/drm/intel/issues/4525>)
>    -
>
>    igt@gem_exec_fair@basic-none@vcs1:
>    - shard-iclb: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb1/igt@gem_exec_fair@basic-none@vcs1.html>
>       (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
>    -
>
>    igt@gem_exec_fair@basic-none@vecs0:
>    - shard-glk: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7059/shard-glk1/igt@gem_exec_fair@basic-none@vecs0.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-glk2/igt@gem_exec_fair@basic-none@vecs0.html>
>       (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
>    -
>
>    igt@gem_huc_copy@huc-copy:
>    - shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-apl1/igt@gem_huc_copy@huc-copy.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#2190 <https://gitlab.freedesktop.org/drm/intel/issues/2190>)
>    -
>
>    igt@gem_lmem_swapping@basic:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb1/igt@gem_lmem_swapping@basic.html>
>       (i915#4613 <https://gitlab.freedesktop.org/drm/intel/issues/4613>)
>       +2 similar issues
>    -
>
>    igt@gem_lmem_swapping@heavy-multi:
>    - shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-apl1/igt@gem_lmem_swapping@heavy-multi.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#4613 <https://gitlab.freedesktop.org/drm/intel/issues/4613>)
>       +2 similar issues
>    -
>
>    igt@gem_lmem_swapping@heavy-verify-multi-ccs:
>    -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-tglb5/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html>
>       (i915#4613 <https://gitlab.freedesktop.org/drm/intel/issues/4613>)
>       +2 similar issues
>       -
>
>       shard-glk: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-glk1/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#4613 <https://gitlab.freedesktop.org/drm/intel/issues/4613>)
>       +1 similar issue
>       -
>
>    igt@gem_render_copy@linear-to-vebox-yf-tiled:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb8/igt@gem_render_copy@linear-to-vebox-yf-tiled.html>
>       (i915#768 <https://gitlab.freedesktop.org/drm/intel/issues/768>)
>    -
>
>    igt@gem_softpin@evict-single-offset:
>    - shard-iclb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7059/shard-iclb6/igt@gem_softpin@evict-single-offset.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb6/igt@gem_softpin@evict-single-offset.html>
>       (i915#4171 <https://gitlab.freedesktop.org/drm/intel/issues/4171>)
>    -
>
>    igt@gem_softpin@evict-snoop-interruptible:
>    -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-tglb8/igt@gem_softpin@evict-snoop-interruptible.html>
>       (fdo#109312 <https://bugs.freedesktop.org/show_bug.cgi?id=109312>)
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb5/igt@gem_softpin@evict-snoop-interruptible.html>
>       (fdo#109312 <https://bugs.freedesktop.org/show_bug.cgi?id=109312>)
>       -
>
>    igt@gem_userptr_blits@access-control:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb6/igt@gem_userptr_blits@access-control.html>
>       (i915#3297 <https://gitlab.freedesktop.org/drm/intel/issues/3297>)
>    -
>
>    igt@gem_userptr_blits@coherency-sync:
>    -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb3/igt@gem_userptr_blits@coherency-sync.html>
>       (fdo#109290 <https://bugs.freedesktop.org/show_bug.cgi?id=109290>)
>       -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-tglb3/igt@gem_userptr_blits@coherency-sync.html>
>       (fdo#110542 <https://bugs.freedesktop.org/show_bug.cgi?id=110542>)
>       -
>
>    igt@gen7_exec_parse@basic-allowed:
>    -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-tglb1/igt@gen7_exec_parse@basic-allowed.html>
>       (fdo#109289 <https://bugs.freedesktop.org/show_bug.cgi?id=109289>)
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb8/igt@gen7_exec_parse@basic-allowed.html>
>       (fdo#109289 <https://bugs.freedesktop.org/show_bug.cgi?id=109289>)
>       +1 similar issue
>       -
>
>    igt@gen9_exec_parse@allowed-single:
>    - shard-apl: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7059/shard-apl3/igt@gen9_exec_parse@allowed-single.html>
>       -> DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-apl3/igt@gen9_exec_parse@allowed-single.html>
>       (i915#5566 <https://gitlab.freedesktop.org/drm/intel/issues/5566> /
>       i915#716 <https://gitlab.freedesktop.org/drm/intel/issues/716>)
>    -
>
>    igt@i915_module_load@resize-bar:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb7/igt@i915_module_load@resize-bar.html>
>       (i915#6412 <https://gitlab.freedesktop.org/drm/intel/issues/6412>)
>    -
>
>    igt@i915_pm_freq_mult@media-freq@gt0:
>    -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb6/igt@i915_pm_freq_mult@media-freq@gt0.html>
>       (i915#6590 <https://gitlab.freedesktop.org/drm/intel/issues/6590>)
>       -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-tglb2/igt@i915_pm_freq_mult@media-freq@gt0.html>
>       (i915#6590 <https://gitlab.freedesktop.org/drm/intel/issues/6590>)
>       -
>
>    igt@i915_selftest@live@hangcheck:
>    - shard-tglb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7059/shard-tglb1/igt@i915_selftest@live@hangcheck.html>
>       -> DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-tglb3/igt@i915_selftest@live@hangcheck.html>
>       (i915#5591 <https://gitlab.freedesktop.org/drm/intel/issues/5591>)
>    -
>
>    igt@i915_suspend@fence-restore-tiled2untiled:
>    - shard-apl: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7059/shard-apl3/igt@i915_suspend@fence-restore-tiled2untiled.html>
>       -> DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-apl6/igt@i915_suspend@fence-restore-tiled2untiled.html>
>       (i915#180 <https://gitlab.freedesktop.org/drm/intel/issues/180>) +1
>       similar issue
>    -
>
>    igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
>    -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-tglb6/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html>
>       (i915#3826 <https://gitlab.freedesktop.org/drm/intel/issues/3826>)
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb2/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html>
>       (i915#3826 <https://gitlab.freedesktop.org/drm/intel/issues/3826>)
>       -
>
>    igt@kms_atomic@atomic_plane_damage:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb3/igt@kms_atomic@atomic_plane_damage.html>
>       (i915#4765 <https://gitlab.freedesktop.org/drm/intel/issues/4765>)
>    -
>
>    igt@kms_big_fb@4-tiled-64bpp-rotate-270:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-tglb5/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html>
>       (i915#5286 <https://gitlab.freedesktop.org/drm/intel/issues/5286>)
>    -
>
>    igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html>
>       (i915#5286 <https://gitlab.freedesktop.org/drm/intel/issues/5286>)
>    -
>
>    igt@kms_big_fb@linear-32bpp-rotate-270:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-tglb2/igt@kms_big_fb@linear-32bpp-rotate-270.html>
>       (fdo#111614 <https://bugs.freedesktop.org/show_bug.cgi?id=111614>)
>       +2 similar issues
>    -
>
>    igt@kms_big_fb@x-tiled-64bpp-rotate-90:
>    - shard-glk: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-glk9/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>)
>       +72 similar issues
>    -
>
>    igt@kms_big_fb@y-tiled-8bpp-rotate-90:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb2/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html>
>       (fdo#110725 <https://bugs.freedesktop.org/show_bug.cgi?id=110725> /
>       fdo#111614 <https://bugs.freedesktop.org/show_bug.cgi?id=111614>)
>       +3 similar issues
>    -
>
>    igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
>    -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-tglb5/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html>
>       (fdo#111615 <https://bugs.freedesktop.org/show_bug.cgi?id=111615>)
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb2/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html>
>       (fdo#110723 <https://bugs.freedesktop.org/show_bug.cgi?id=110723>)
>       -
>
>    igt@kms_big_joiner@2x-modeset:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb6/igt@kms_big_joiner@2x-modeset.html>
>       (i915#2705 <https://gitlab.freedesktop.org/drm/intel/issues/2705>)
>    -
>
>    igt@kms_ccs@pipe-a-bad-pixel-format-4_tiled_dg2_rc_ccs:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb3/igt@kms_ccs@pipe-a-bad-pixel-format-4_tiled_dg2_rc_ccs.html>
>       (fdo#109278 <https://bugs.freedesktop.org/show_bug.cgi?id=109278>)
>       +13 similar issues
>    -
>
>    igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-tglb6/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html>
>       (i915#3689 <https://gitlab.freedesktop.org/drm/intel/issues/3689> /
>       i915#3886 <https://gitlab.freedesktop.org/drm/intel/issues/3886>)
>       +2 similar issues
>    -
>
>    igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc:
>    - shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-apl7/igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#3886 <https://gitlab.freedesktop.org/drm/intel/issues/3886>)
>       +8 similar issues
>    -
>
>    igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:
>    - shard-glk: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-glk1/igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#3886 <https://gitlab.freedesktop.org/drm/intel/issues/3886>)
>       +4 similar issues
>    -
>
>    igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_mc_ccs:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb6/igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_mc_ccs.html>
>       (fdo#109278 <https://bugs.freedesktop.org/show_bug.cgi?id=109278> /
>       i915#3886 <https://gitlab.freedesktop.org/drm/intel/issues/3886>)
>       +3 similar issues
>    -
>
>    igt@kms_ccs@pipe-c-crc-primary-basic-4_tiled_dg2_rc_ccs_cc:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-tglb2/igt@kms_ccs@pipe-c-crc-primary-basic-4_tiled_dg2_rc_ccs_cc.html>
>       (i915#6095 <https://gitlab.freedesktop.org/drm/intel/issues/6095>)
>       +3 similar issues
>    -
>
>    igt@kms_ccs@pipe-d-bad-rotation-90-4_tiled_dg2_mc_ccs:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-tglb6/igt@kms_ccs@pipe-d-bad-rotation-90-4_tiled_dg2_mc_ccs.html>
>       (i915#3689 <https://gitlab.freedesktop.org/drm/intel/issues/3689>)
>    -
>
>    igt@kms_chamelium@dp-crc-single:
>    - shard-snb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-snb5/igt@kms_chamelium@dp-crc-single.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>)
>       +5 similar issues
>    -
>
>    {igt@kms_chamelium@dp-edid-resolution-list} (NEW):
>    -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb1/igt@kms_chamelium@dp-edid-resolution-list.html>
>       (fdo#109284 <https://bugs.freedesktop.org/show_bug.cgi?id=109284>)
>       -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-tglb8/igt@kms_chamelium@dp-edid-resolution-list.html>
>       (fdo#109284 <https://bugs.freedesktop.org/show_bug.cgi?id=109284>)
>       -
>
>    igt@kms_chamelium@hdmi-hpd-for-each-pipe:
>    - shard-glk: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-glk1/igt@kms_chamelium@hdmi-hpd-for-each-pipe.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>)
>       +4 similar issues
>    -
>
>    igt@kms_chamelium@vga-hpd-fast:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-tglb1/igt@kms_chamelium@vga-hpd-fast.html>
>       (fdo#109284 <https://bugs.freedesktop.org/show_bug.cgi?id=109284> /
>       fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>)
>       +3 similar issues
>    -
>
>    igt@kms_color_chamelium@ctm-0-50:
>    - shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-apl6/igt@kms_color_chamelium@ctm-0-50.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>)
>       +6 similar issues
>    -
>
>    igt@kms_color_chamelium@ctm-0-75:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb5/igt@kms_color_chamelium@ctm-0-75.html>
>       (fdo#109284 <https://bugs.freedesktop.org/show_bug.cgi?id=109284> /
>       fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>)
>       +4 similar issues
>    -
>
>    igt@kms_content_protection@atomic-dpms:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb7/igt@kms_content_protection@atomic-dpms.html>
>       (i915#7118 <https://gitlab.freedesktop.org/drm/intel/issues/7118>)
>    -
>
>    igt@kms_content_protection@atomic@pipe-a-dp-1:
>    - shard-apl: NOTRUN -> TIMEOUT
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-apl7/igt@kms_content_protection@atomic@pipe-a-dp-1.html>
>       (i915#7173 <https://gitlab.freedesktop.org/drm/intel/issues/7173>)
>    -
>
>    igt@kms_cursor_crc@cursor-offscreen-512x170:
>    -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb2/igt@kms_cursor_crc@cursor-offscreen-512x170.html>
>       (fdo#109279 <https://bugs.freedesktop.org/show_bug.cgi?id=109279> /
>       i915#3359 <https://gitlab.freedesktop.org/drm/intel/issues/3359>)
>       -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-tglb6/igt@kms_cursor_crc@cursor-offscreen-512x170.html>
>       (fdo#109279 <https://bugs.freedesktop.org/show_bug.cgi?id=109279> /
>       i915#3359 <https://gitlab.freedesktop.org/drm/intel/issues/3359>)
>       -
>
>    igt@kms_cursor_crc@cursor-sliding-32x32:
>    - shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-apl1/igt@kms_cursor_crc@cursor-sliding-32x32.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>)
>       +98 similar issues
>    -
>
>    igt@kms_cursor_crc@cursor-sliding-512x512:
>    -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-tglb2/igt@kms_cursor_crc@cursor-sliding-512x512.html>
>       (i915#3359 <https://gitlab.freedesktop.org/drm/intel/issues/3359>)
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb6/igt@kms_cursor_crc@cursor-sliding-512x512.html>
>       (i915#3359 <https://gitlab.freedesktop.org/drm/intel/issues/3359>)
>       -
>
>    igt@kms_cursor_legacy@cursorb-vs-flipa@atomic-transitions-varying-size:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-tglb6/igt@kms_cursor_legacy@cursorb-vs-flipa@atomic-transitions-varying-size.html>
>       (fdo#109274 <https://bugs.freedesktop.org/show_bug.cgi?id=109274> /
>       fdo#111825 <https://bugs.freedesktop.org/show_bug.cgi?id=111825>)
>       +6 similar issues
>    -
>
>    igt@kms_cursor_legacy@cursorb-vs-flipa@legacy:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb8/igt@kms_cursor_legacy@cursorb-vs-flipa@legacy.html>
>       (fdo#109274 <https://bugs.freedesktop.org/show_bug.cgi?id=109274>)
>       +17 similar issues
>    -
>
>    igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size:
>    - shard-glk: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7059/shard-glk1/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size.html>
>       (i915#2346 <https://gitlab.freedesktop.org/drm/intel/issues/2346>)
>       +1 similar issue
>    -
>
>    igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium:
>    -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-tglb3/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html>
>       (i915#3528 <https://gitlab.freedesktop.org/drm/intel/issues/3528>)
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb3/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html>
>       (i915#3528 <https://gitlab.freedesktop.org/drm/intel/issues/3528>)
>       -
>
>    igt@kms_dsc@dsc-with-bpc-formats:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb7/igt@kms_dsc@dsc-with-bpc-formats.html>
>       (i915#3840 <https://gitlab.freedesktop.org/drm/intel/issues/3840>)
>    -
>
>    igt@kms_fbcon_fbt@fbc-suspend:
>    -
>
>       shard-apl: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-apl6/igt@kms_fbcon_fbt@fbc-suspend.html>
>       (i915#4767 <https://gitlab.freedesktop.org/drm/intel/issues/4767>)
>       -
>
>       shard-tglb: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-tglb3/igt@kms_fbcon_fbt@fbc-suspend.html>
>       (i915#2411 <https://gitlab.freedesktop.org/drm/intel/issues/2411> /
>       i915#4767 <https://gitlab.freedesktop.org/drm/intel/issues/4767>)
>       -
>
>       shard-glk: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-glk2/igt@kms_fbcon_fbt@fbc-suspend.html>
>       (i915#4767 <https://gitlab.freedesktop.org/drm/intel/issues/4767>)
>       -
>
>       shard-iclb: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb3/igt@kms_fbcon_fbt@fbc-suspend.html>
>       (i915#4767 <https://gitlab.freedesktop.org/drm/intel/issues/4767>)
>       -
>
>    igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2
>    :
>    - shard-glk: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7059/shard-glk9/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-glk7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2.html>
>       (i915#79 <https://gitlab.freedesktop.org/drm/intel/issues/79>)
>    -
>
>    igt@kms_flip@2x-nonexisting-fb-interruptible:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-tglb3/igt@kms_flip@2x-nonexisting-fb-interruptible.html>
>       (fdo#109274 <https://bugs.freedesktop.org/show_bug.cgi?id=109274> /
>       fdo#111825 <https://bugs.freedesktop.org/show_bug.cgi?id=111825> /
>       i915#3637 <https://gitlab.freedesktop.org/drm/intel/issues/3637>)
>       +1 similar issue
>    -
>
>    igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp1:
>    - shard-apl: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7059/shard-apl8/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp1.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-apl8/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp1.html>
>       (i915#79 <https://gitlab.freedesktop.org/drm/intel/issues/79>)
>    -
>
>    igt@kms_flip_scaled_crc
>    @flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb7/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html>
>       (i915#2587 <https://gitlab.freedesktop.org/drm/intel/issues/2587> /
>       i915#2672 <https://gitlab.freedesktop.org/drm/intel/issues/2672>)
>       +1 similar issue
>    -
>
>    igt@kms_flip_scaled_crc
>    @flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-default-mode:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-default-mode.html>
>       (i915#6375 <https://gitlab.freedesktop.org/drm/intel/issues/6375>)
>    -
>
>    igt@kms_flip_scaled_crc
>    @flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode.html>
>       (i915#2672 <https://gitlab.freedesktop.org/drm/intel/issues/2672>)
>       +3 similar issues
>    -
>
>    igt@kms_flip_scaled_crc
>    @flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-default-mode:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-default-mode.html>
>       (i915#2672 <https://gitlab.freedesktop.org/drm/intel/issues/2672> /
>       i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555>)
>    -
>
>    igt@kms_frontbuffer_tracking
>    @fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-gtt:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-gtt.html>
>       (fdo#109280 <https://bugs.freedesktop.org/show_bug.cgi?id=109280>)
>       +14 similar issues
>    -
>
>    igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render.html>
>       (fdo#109280 <https://bugs.freedesktop.org/show_bug.cgi?id=109280> /
>       fdo#111825 <https://bugs.freedesktop.org/show_bug.cgi?id=111825>)
>       +9 similar issues
>    -
>
>    igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-gtt:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-gtt.html>
>       (i915#6497 <https://gitlab.freedesktop.org/drm/intel/issues/6497>)
>       +4 similar issues
>    -
>
>    igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-dp-1:
>    - shard-apl: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-apl1/igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-dp-1.html>
>       (i915#4573 <https://gitlab.freedesktop.org/drm/intel/issues/4573>)
>       +2 similar issues
>    -
>
>    igt@kms_plane_multiple@tiling-4:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb5/igt@kms_plane_multiple@tiling-4.html>
>       (i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555>)
>       +1 similar issue
>    -
>
>    igt@kms_plane_scaling
>    @planes-upscale-20x20-downscale-factor-0-5@pipe-b-edp-1:
>    - shard-iclb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7059/shard-iclb6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b-edp-1.html>
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b-edp-1.html>
>       (i915#5235 <https://gitlab.freedesktop.org/drm/intel/issues/5235>)
>       +2 similar issues
>    -
>
>    igt@kms_prime@d3hot:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb3/igt@kms_prime@d3hot.html>
>       (i915#6524 <https://gitlab.freedesktop.org/drm/intel/issues/6524>)
>    -
>
>    igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:
>    -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-tglb8/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html>
>       (i915#2920 <https://gitlab.freedesktop.org/drm/intel/issues/2920>)
>       -
>
>       shard-glk: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-glk5/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>)
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb5/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html>
>       (i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>)
>       -
>
>    igt@kms_psr2_su@page_flip-p010:
>    - shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-apl1/igt@kms_psr2_su@page_flip-p010.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>) +1
>       similar issue
>    -
>
>    igt@kms_psr2_su@page_flip-xrgb8888:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb6/igt@kms_psr2_su@page_flip-xrgb8888.html>
>       (fdo#109642 <https://bugs.freedesktop.org/show_bug.cgi?id=109642> /
>       fdo#111068 <https://bugs.freedesktop.org/show_bug.cgi?id=111068> /
>       i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>)
>    -
>
>    igt@kms_psr@psr2_cursor_plane_onoff:
>    - shard-tglb: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-tglb2/igt@kms_psr@psr2_cursor_plane_onoff.html>
>       (i915#132 <https://gitlab.freedesktop.org/drm/intel/issues/132> /
>       i915#3467 <https://gitlab.freedesktop.org/drm/intel/issues/3467>)
>    -
>
>    igt@kms_psr@psr2_sprite_blt:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb6/igt@kms_psr@psr2_sprite_blt.html>
>       (fdo#109441 <https://bugs.freedesktop.org/show_bug.cgi?id=109441>)
>    -
>
>    igt@kms_psr@psr2_sprite_mmap_gtt:
>    - shard-iclb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7059/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html>
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb7/igt@kms_psr@psr2_sprite_mmap_gtt.html>
>       (fdo#109441 <https://bugs.freedesktop.org/show_bug.cgi?id=109441>)
>       +3 similar issues
>    -
>
>    igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
>    - shard-tglb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7059/shard-tglb6/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html>
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-tglb8/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html>
>       (i915#5519 <https://gitlab.freedesktop.org/drm/intel/issues/5519>)
>    -
>
>    igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb2/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html>
>       (i915#5289 <https://gitlab.freedesktop.org/drm/intel/issues/5289>)
>    -
>
>    igt@kms_tv_load_detect@load-detect:
>    - shard-snb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-snb4/igt@kms_tv_load_detect@load-detect.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>)
>       +138 similar issues
>    -
>
>    igt@kms_writeback@writeback-check-output:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb3/igt@kms_writeback@writeback-check-output.html>
>       (i915#2437 <https://gitlab.freedesktop.org/drm/intel/issues/2437>)
>    -
>
>    igt@sysfs_clients@recycle-many:
>    - shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-apl8/igt@sysfs_clients@recycle-many.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#2994 <https://gitlab.freedesktop.org/drm/intel/issues/2994>)
>       +1 similar issue
>    -
>
>    igt@sysfs_clients@sema-10:
>    -
>
>       shard-glk: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-glk2/igt@sysfs_clients@sema-10.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#2994 <https://gitlab.freedesktop.org/drm/intel/issues/2994>)
>       +2 similar issues
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb3/igt@sysfs_clients@sema-10.html>
>       (i915#2994 <https://gitlab.freedesktop.org/drm/intel/issues/2994>)
>       -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-tglb3/igt@sysfs_clients@sema-10.html>
>       (i915#2994 <https://gitlab.freedesktop.org/drm/intel/issues/2994>)
>
> Possible fixes
>
>    -
>
>    igt@fbdev@read:
>    - {shard-rkl}: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7059/shard-rkl-1/igt@fbdev@read.html>
>       (i915#2582 <https://gitlab.freedesktop.org/drm/intel/issues/2582>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-rkl-6/igt@fbdev@read.html>
>    -
>
>    igt@gem_ctx_exec@basic-nohangcheck:
>    - shard-tglb: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7059/shard-tglb2/igt@gem_ctx_exec@basic-nohangcheck.html>
>       (i915#6268 <https://gitlab.freedesktop.org/drm/intel/issues/6268>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-tglb1/igt@gem_ctx_exec@basic-nohangcheck.html>
>    -
>
>    igt@gem_ctx_persistence@many-contexts:
>    - {shard-rkl}: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7059/shard-rkl-6/igt@gem_ctx_persistence@many-contexts.html>
>       (i915#2410 <https://gitlab.freedesktop.org/drm/intel/issues/2410>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-rkl-5/igt@gem_ctx_persistence@many-contexts.html>
>    -
>
>    igt@gem_eio@in-flight-suspend:
>    - {shard-rkl}: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7059/shard-rkl-3/igt@gem_eio@in-flight-suspend.html>
>       (fdo#103375 <https://bugs.freedesktop.org/show_bug.cgi?id=103375>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-rkl-2/igt@gem_eio@in-flight-suspend.html>
>    -
>
>    igt@gem_exec_balancer@parallel-keep-submit-fence:
>    - shard-iclb: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7059/shard-iclb3/igt@gem_exec_balancer@parallel-keep-submit-fence.html>
>       (i915#4525 <https://gitlab.freedesktop.org/drm/intel/issues/4525>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb1/igt@gem_exec_balancer@parallel-keep-submit-fence.html>
>    -
>
>    igt@gem_exec_fair@basic-none-share@rcs0:
>    - shard-iclb: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7059/shard-iclb8/igt@gem_exec_fair@basic-none-share@rcs0.html>
>       (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb1/igt@gem_exec_fair@basic-none-share@rcs0.html>
>    -
>
>    igt@gem_exec_fair@basic-pace-share@rcs0:
>    - shard-tglb: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7059/shard-tglb2/igt@gem_exec_fair@basic-pace-share@rcs0.html>
>       (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-tglb8/igt@gem_exec_fair@basic-pace-share@rcs0.html>
>    -
>
>    igt@gem_exec_fair@basic-pace@vcs0:
>    - shard-glk: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7059/shard-glk6/igt@gem_exec_fair@basic-pace@vcs0.html>
>       (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-glk3/igt@gem_exec_fair@basic-pace@vcs0.html>
>       +3 similar issues
>    -
>
>    igt@gem_exec_reloc@basic-write-gtt-noreloc:
>    - {shard-rkl}: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7059/shard-rkl-4/igt@gem_exec_reloc@basic-write-gtt-noreloc.html>
>       (i915#3281 <https://gitlab.freedesktop.org/drm/intel/issues/3281>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-rkl-5/igt@gem_exec_reloc@basic-write-gtt-noreloc.html>
>       +5 similar issues
>    -
>
>    igt@gem_exec_schedule@semaphore-power:
>    - {shard-rkl}: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7059/shard-rkl-1/igt@gem_exec_schedule@semaphore-power.html>
>       (i915#7276 <https://gitlab.freedesktop.org/drm/intel/issues/7276>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-rkl-5/igt@gem_exec_schedule@semaphore-power.html>
>    -
>
>    igt@gem_mmap_gtt@coherency:
>    - {shard-rkl}: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7059/shard-rkl-3/igt@gem_mmap_gtt@coherency.html>
>       (fdo#111656 <https://bugs.freedesktop.org/show_bug.cgi?id=111656>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-rkl-5/igt@gem_mmap_gtt@coherency.html>
>    -
>
>    igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
>    - {shard-rkl}: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7059/shard-rkl-4/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html>
>       (i915#3282 <https://gitlab.freedesktop.org/drm/intel/issues/3282>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-rkl-5/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html>
>       +5 similar issues
>    -
>
>    igt@gem_softpin@evict-single-offset:
>    - shard-tglb: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7059/shard-tglb8/igt@gem_softpin@evict-single-offset.html>
>       (i915#4171 <https://gitlab.freedesktop.org/drm/intel/issues/4171>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-tglb7/igt@gem_softpin@evict-single-offset.html>
>    -
>
>    igt@gem_workarounds@suspend-resume-context:
>    - shard-apl: DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7059/shard-apl6/igt@gem_workarounds@suspend-resume-context.html>
>       (i915#180 <https://gitlab.freedesktop.org/drm/intel/issues/180> /
>       i915#1982 <https://gitlab.freedesktop.org/drm/intel/issues/1982>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-apl7/igt@gem_workarounds@suspend-resume-context.html>
>    -
>
>    igt@gen9_exec_parse@secure-batches:
>    - {shard-rkl}: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7059/shard-rkl-1/igt@gen9_exec_parse@secure-batches.html>
>       (i915#2527 <https://gitlab.freedesktop.org/drm/intel/issues/2527>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-rkl-5/igt@gen9_exec_parse@secure-batches.html>
>       +3 similar issues
>    -
>
>    igt@i915_pipe_stress@stress-xrgb8888-ytiled:
>    - {shard-rkl}: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7059/shard-rkl-5/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html>
>       (i915#4098 <https://gitlab.freedesktop.org/drm/intel/issues/4098>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-rkl-6/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html>
>       +1 similar issue
>    -
>
>    igt@i915_pm_dc@dc6-psr:
>    - shard-iclb: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7059/shard-iclb3/igt@i915_pm_dc@dc6-psr.html>
>       (i915#3989 <https://gitlab.freedesktop.org/drm/intel/issues/3989> /
>       i915#454 <https://gitlab.freedesktop.org/drm/intel/issues/454>) ->
>       PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb5/igt@i915_pm_dc@dc6-psr.html>
>    -
>
>    igt@i915_pm_sseu@full-enable:
>    - {shard-rkl}: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7059/shard-rkl-3/igt@i915_pm_sseu@full-enable.html>
>       (i915#4387 <https://gitlab.freedesktop.org/drm/intel/issues/4387>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-rkl-5/igt@i915_pm_sseu@full-enable.html>
>    -
>
>    igt@i915_selftest@live@gt_heartbeat:
>    - shard-apl: DMESG-FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7059/shard-apl1/igt@i915_selftest@live@gt_heartbeat.html>
>       (i915#5334 <https://gitlab.freedesktop.org/drm/intel/issues/5334>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-apl6/igt@i915_selftest@live@gt_heartbeat.html>
>    -
>
>    igt@i915_selftest@perf@engine_cs:
>    - shard-snb: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7059/shard-snb7/igt@i915_selftest@perf@engine_cs.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-snb6/igt@i915_selftest@perf@engine_cs.html>
>    -
>
>    igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
>    - {shard-rkl}: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7059/shard-rkl-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html>
>       (i915#1845 <https://gitlab.freedesktop.org/drm/intel/issues/1845> /
>       i915#4098 <https://gitlab.freedesktop.org/drm/intel/issues/4098>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-rkl-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html>
>       +13 similar issues
>    -
>
>    igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp1:
>    - shard-apl: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7059/shard-apl8/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp1.html>
>       (i915#79 <https://gitlab.freedesktop.org/drm/intel/issues/79>) ->
>       PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-apl8/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp1.html>
>    -
>
>    igt@kms_flip@flip-vs-suspend-interruptible@b-edp1:
>    - shard-tglb: DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7059/shard-tglb7/igt@kms_flip@flip-vs-suspend-interruptible@b-edp1.html>
>       (i915#2411 <https://gitlab.freedesktop.org/drm/intel/issues/2411> /
>       i915#2867 <https://gitlab.freedesktop.org/drm/intel/issues/2867>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-tglb1/igt@kms_flip@flip-vs-suspend-interruptible@b-edp1.html>
>    -
>
>    igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:
>    - {shard-rkl}: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7059/shard-rkl-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html>
>       (i915#1849 <https://gitlab.freedesktop.org/drm/intel/issues/1849> /
>       i915#4098 <https://gitlab.freedesktop.org/drm/intel/issues/4098>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html>
>       +11 similar issues
>    -
>
>    igt@kms_plane@pixel-format-source-clamping@pipe-b-planes:
>    - {shard-rkl}: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7059/shard-rkl-3/igt@kms_plane@pixel-format-source-clamping@pipe-b-planes.html>
>       (i915#3558 <https://gitlab.freedesktop.org/drm/intel/issues/3558>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-rkl-6/igt@kms_plane@pixel-format-source-clamping@pipe-b-planes.html>
>       +1 similar issue
>    -
>
>    igt@kms_plane_scaling
>    @planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a-edp-1:
>    - shard-iclb: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7059/shard-iclb2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a-edp-1.html>
>       (i915#5235 <https://gitlab.freedesktop.org/drm/intel/issues/5235>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a-edp-1.html>
>       +2 similar issues
>    -
>
>    igt@kms_properties@crtc-properties-atomic:
>    - {shard-rkl}: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7059/shard-rkl-4/igt@kms_properties@crtc-properties-atomic.html>
>       (i915#1849 <https://gitlab.freedesktop.org/drm/intel/issues/1849>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-rkl-6/igt@kms_properties@crtc-properties-atomic.html>
>    -
>
>    igt@kms_psr@psr2_primary_mmap_gtt:
>    - shard-iclb: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7059/shard-iclb6/igt@kms_psr@psr2_primary_mmap_gtt.html>
>       (fdo#109441 <https://bugs.freedesktop.org/show_bug.cgi?id=109441>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb2/igt@kms_psr@psr2_primary_mmap_gtt.html>
>    -
>
>    igt@kms_psr@sprite_blt:
>    - {shard-rkl}: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7059/shard-rkl-4/igt@kms_psr@sprite_blt.html>
>       (i915#1072 <https://gitlab.freedesktop.org/drm/intel/issues/1072>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-rkl-6/igt@kms_psr@sprite_blt.html>
>    -
>
>    igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
>    - shard-iclb: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7059/shard-iclb6/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html>
>       (i915#5519 <https://gitlab.freedesktop.org/drm/intel/issues/5519>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb1/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html>
>    -
>
>    igt@kms_vblank@pipe-a-ts-continuation-suspend:
>    - shard-apl: DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7059/shard-apl1/igt@kms_vblank@pipe-a-ts-continuation-suspend.html>
>       (i915#180 <https://gitlab.freedesktop.org/drm/intel/issues/180>) ->
>       PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-apl1/igt@kms_vblank@pipe-a-ts-continuation-suspend.html>
>    -
>
>    igt@sysfs_heartbeat_interval@precise@rcs0:
>    - {shard-dg1}: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7059/shard-dg1-15/igt@sysfs_heartbeat_interval@precise@rcs0.html>
>       (i915#1755 <https://gitlab.freedesktop.org/drm/intel/issues/1755>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-dg1-15/igt@sysfs_heartbeat_interval@precise@rcs0.html>
>       +4 similar issues
>
> Warnings
>
>    -
>
>    igt@gem_pread@exhaustion:
>    - shard-apl: INCOMPLETE
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7059/shard-apl3/igt@gem_pread@exhaustion.html>
>       (i915#7248 <https://gitlab.freedesktop.org/drm/intel/issues/7248>)
>       -> WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-apl6/igt@gem_pread@exhaustion.html>
>       (i915#2658 <https://gitlab.freedesktop.org/drm/intel/issues/2658>)
>    -
>
>    igt@i915_pm_rc6_residency@rc6-idle@rcs0:
>    - shard-iclb: WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7059/shard-iclb8/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html>
>       (i915#2684 <https://gitlab.freedesktop.org/drm/intel/issues/2684>)
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb1/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html>
>       (i915#2684 <https://gitlab.freedesktop.org/drm/intel/issues/2684>)
>    -
>
>    igt@i915_pm_rc6_residency@rc6-idle@vecs0:
>    - shard-iclb: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7059/shard-iclb8/igt@i915_pm_rc6_residency@rc6-idle@vecs0.html>
>       (i915#2684 <https://gitlab.freedesktop.org/drm/intel/issues/2684>)
>       -> WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb1/igt@i915_pm_rc6_residency@rc6-idle@vecs0.html>
>       (i915#2684 <https://gitlab.freedesktop.org/drm/intel/issues/2684>)
>    -
>
>    igt@kms_content_protection@mei_interface:
>    -
>
>       shard-tglb: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7059/shard-tglb1/igt@kms_content_protection@mei_interface.html>
>       (i915#7118 <https://gitlab.freedesktop.org/drm/intel/issues/7118>)
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-tglb8/igt@kms_content_protection@mei_interface.html>
>       (fdo#109300 <https://bugs.freedesktop.org/show_bug.cgi?id=109300>)
>       -
>
>       shard-iclb: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7059/shard-iclb1/igt@kms_content_protection@mei_interface.html>
>       (i915#7118 <https://gitlab.freedesktop.org/drm/intel/issues/7118>)
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb1/igt@kms_content_protection@mei_interface.html>
>       (fdo#109300 <https://bugs.freedesktop.org/show_bug.cgi?id=109300>)
>       -
>
>    igt@kms_plane_alpha_blend@alpha-basic@pipe-c-dp-1:
>    - shard-apl: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7059/shard-apl7/igt@kms_plane_alpha_blend@alpha-basic@pipe-c-dp-1.html>
>       (i915#4573 <https://gitlab.freedesktop.org/drm/intel/issues/4573>)
>       -> DMESG-FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-apl2/igt@kms_plane_alpha_blend@alpha-basic@pipe-c-dp-1.html>
>       (IGT#6 <https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/6>)
>       +1 similar issue
>    -
>
>    igt@kms_psr2_sf@overlay-plane-update-continuous-sf:
>    - shard-iclb: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7059/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html>
>       (i915#2920 <https://gitlab.freedesktop.org/drm/intel/issues/2920>)
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb7/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html>
>       (fdo#111068 <https://bugs.freedesktop.org/show_bug.cgi?id=111068> /
>       i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>)
>
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> Build changes
>
>    - CI: CI-20190529 -> None
>    - IGT: IGT_7059 -> IGTPW_8109
>
> CI-20190529: 20190529
> CI_DRM_12382: cb74864693414b221b3601572e75449558126e8b @ git://
> anongit.freedesktop.org/gfx-ci/linux
> IGTPW_8109: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/index.html
> IGT_7059: 89c5c56dfde602d54eefa301e9887eff8bcda0e8 @
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>

On Tue, Nov 15, 2022 at 10:21 PM Patchwork <patchwork@emeril.freedesktop.org>
wrote:

> *Patch Details*
> *Series:* Chamelium: Add new EDID Resolution List test (rev3)
> *URL:* https://patchwork.freedesktop.org/series/110614/
> *State:* failure
> *Details:* https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/index.html CI
> Bug Log - changes from IGT_7059_full -> IGTPW_8109_full Summary
>
> *FAILURE*
>
> Serious unknown changes coming with IGTPW_8109_full absolutely need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_8109_full, please notify your bug team to allow them
> to document this new failure mode, which will reduce false positives in CI.
>
> External URL:
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/index.html
> Participating hosts (8 -> 8)
>
> No changes in participating hosts
> Possible new issues
>
> Here are the unknown changes that may have been introduced in
> IGTPW_8109_full:
> IGT changes Possible regressions
>
>    -
>
>    igt@i915_pm_dc@dc5-psr:
>    - shard-tglb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7059/shard-tglb2/igt@i915_pm_dc@dc5-psr.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-tglb5/igt@i915_pm_dc@dc5-psr.html>
>    -
>
>    {igt@kms_chamelium@dp-edid-resolution-list} (NEW):
>    - {shard-rkl}: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-rkl-2/igt@kms_chamelium@dp-edid-resolution-list.html>
>    -
>
>    igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:
>    - shard-iclb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7059/shard-iclb3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html>
>
> Suppressed
>
> The following results come from untrusted machines, tests, or statuses.
> They do not affect the overall result.
>
>    - igt@fbdev@read:
>       - {shard-dg1}: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7059/shard-dg1-18/igt@fbdev@read.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-dg1-19/igt@fbdev@read.html>
>
> New tests
>
> New tests have been introduced between IGT_7059_full and IGTPW_8109_full:
> New IGT tests (1)
>
>    - igt@kms_chamelium@dp-edid-resolution-list:
>       - Statuses : 6 skip(s)
>       - Exec time: [0.0] s
>
> Known issues
>
> Here are the changes found in IGTPW_8109_full that come from known issues:
> IGT changes Issues hit
>
>    -
>
>    igt@feature_discovery@display-2x:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb2/igt@feature_discovery@display-2x.html>
>       (i915#1839 <https://gitlab.freedesktop.org/drm/intel/issues/1839>)
>    -
>
>    igt@feature_discovery@psr2:
>    - shard-iclb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7059/shard-iclb2/igt@feature_discovery@psr2.html>
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb6/igt@feature_discovery@psr2.html>
>       (i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>)
>    -
>
>    igt@gem_create@create-ext-cpu-access-sanity-check:
>    -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-tglb7/igt@gem_create@create-ext-cpu-access-sanity-check.html>
>       (i915#6335 <https://gitlab.freedesktop.org/drm/intel/issues/6335>)
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb6/igt@gem_create@create-ext-cpu-access-sanity-check.html>
>       (i915#6335 <https://gitlab.freedesktop.org/drm/intel/issues/6335>)
>       -
>
>    igt@gem_ctx_persistence@legacy-engines-mixed-process:
>    - shard-snb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-snb2/igt@gem_ctx_persistence@legacy-engines-mixed-process.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#1099 <https://gitlab.freedesktop.org/drm/intel/issues/1099>)
>       +1 similar issue
>    -
>
>    igt@gem_eio@unwedge-stress:
>    - shard-snb: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-snb5/igt@gem_eio@unwedge-stress.html>
>       (i915#3354 <https://gitlab.freedesktop.org/drm/intel/issues/3354>)
>    -
>
>    igt@gem_exec_balancer@parallel-bb-first:
>    - shard-iclb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7059/shard-iclb1/igt@gem_exec_balancer@parallel-bb-first.html>
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb3/igt@gem_exec_balancer@parallel-bb-first.html>
>       (i915#4525 <https://gitlab.freedesktop.org/drm/intel/issues/4525>)
>    -
>
>    igt@gem_exec_fair@basic-none@vcs1:
>    - shard-iclb: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb1/igt@gem_exec_fair@basic-none@vcs1.html>
>       (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
>    -
>
>    igt@gem_exec_fair@basic-none@vecs0:
>    - shard-glk: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7059/shard-glk1/igt@gem_exec_fair@basic-none@vecs0.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-glk2/igt@gem_exec_fair@basic-none@vecs0.html>
>       (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
>    -
>
>    igt@gem_huc_copy@huc-copy:
>    - shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-apl1/igt@gem_huc_copy@huc-copy.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#2190 <https://gitlab.freedesktop.org/drm/intel/issues/2190>)
>    -
>
>    igt@gem_lmem_swapping@basic:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb1/igt@gem_lmem_swapping@basic.html>
>       (i915#4613 <https://gitlab.freedesktop.org/drm/intel/issues/4613>)
>       +2 similar issues
>    -
>
>    igt@gem_lmem_swapping@heavy-multi:
>    - shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-apl1/igt@gem_lmem_swapping@heavy-multi.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#4613 <https://gitlab.freedesktop.org/drm/intel/issues/4613>)
>       +2 similar issues
>    -
>
>    igt@gem_lmem_swapping@heavy-verify-multi-ccs:
>    -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-tglb5/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html>
>       (i915#4613 <https://gitlab.freedesktop.org/drm/intel/issues/4613>)
>       +2 similar issues
>       -
>
>       shard-glk: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-glk1/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#4613 <https://gitlab.freedesktop.org/drm/intel/issues/4613>)
>       +1 similar issue
>       -
>
>    igt@gem_render_copy@linear-to-vebox-yf-tiled:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb8/igt@gem_render_copy@linear-to-vebox-yf-tiled.html>
>       (i915#768 <https://gitlab.freedesktop.org/drm/intel/issues/768>)
>    -
>
>    igt@gem_softpin@evict-single-offset:
>    - shard-iclb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7059/shard-iclb6/igt@gem_softpin@evict-single-offset.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb6/igt@gem_softpin@evict-single-offset.html>
>       (i915#4171 <https://gitlab.freedesktop.org/drm/intel/issues/4171>)
>    -
>
>    igt@gem_softpin@evict-snoop-interruptible:
>    -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-tglb8/igt@gem_softpin@evict-snoop-interruptible.html>
>       (fdo#109312 <https://bugs.freedesktop.org/show_bug.cgi?id=109312>)
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb5/igt@gem_softpin@evict-snoop-interruptible.html>
>       (fdo#109312 <https://bugs.freedesktop.org/show_bug.cgi?id=109312>)
>       -
>
>    igt@gem_userptr_blits@access-control:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb6/igt@gem_userptr_blits@access-control.html>
>       (i915#3297 <https://gitlab.freedesktop.org/drm/intel/issues/3297>)
>    -
>
>    igt@gem_userptr_blits@coherency-sync:
>    -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb3/igt@gem_userptr_blits@coherency-sync.html>
>       (fdo#109290 <https://bugs.freedesktop.org/show_bug.cgi?id=109290>)
>       -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-tglb3/igt@gem_userptr_blits@coherency-sync.html>
>       (fdo#110542 <https://bugs.freedesktop.org/show_bug.cgi?id=110542>)
>       -
>
>    igt@gen7_exec_parse@basic-allowed:
>    -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-tglb1/igt@gen7_exec_parse@basic-allowed.html>
>       (fdo#109289 <https://bugs.freedesktop.org/show_bug.cgi?id=109289>)
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb8/igt@gen7_exec_parse@basic-allowed.html>
>       (fdo#109289 <https://bugs.freedesktop.org/show_bug.cgi?id=109289>)
>       +1 similar issue
>       -
>
>    igt@gen9_exec_parse@allowed-single:
>    - shard-apl: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7059/shard-apl3/igt@gen9_exec_parse@allowed-single.html>
>       -> DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-apl3/igt@gen9_exec_parse@allowed-single.html>
>       (i915#5566 <https://gitlab.freedesktop.org/drm/intel/issues/5566> /
>       i915#716 <https://gitlab.freedesktop.org/drm/intel/issues/716>)
>    -
>
>    igt@i915_module_load@resize-bar:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb7/igt@i915_module_load@resize-bar.html>
>       (i915#6412 <https://gitlab.freedesktop.org/drm/intel/issues/6412>)
>    -
>
>    igt@i915_pm_freq_mult@media-freq@gt0:
>    -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb6/igt@i915_pm_freq_mult@media-freq@gt0.html>
>       (i915#6590 <https://gitlab.freedesktop.org/drm/intel/issues/6590>)
>       -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-tglb2/igt@i915_pm_freq_mult@media-freq@gt0.html>
>       (i915#6590 <https://gitlab.freedesktop.org/drm/intel/issues/6590>)
>       -
>
>    igt@i915_selftest@live@hangcheck:
>    - shard-tglb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7059/shard-tglb1/igt@i915_selftest@live@hangcheck.html>
>       -> DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-tglb3/igt@i915_selftest@live@hangcheck.html>
>       (i915#5591 <https://gitlab.freedesktop.org/drm/intel/issues/5591>)
>    -
>
>    igt@i915_suspend@fence-restore-tiled2untiled:
>    - shard-apl: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7059/shard-apl3/igt@i915_suspend@fence-restore-tiled2untiled.html>
>       -> DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-apl6/igt@i915_suspend@fence-restore-tiled2untiled.html>
>       (i915#180 <https://gitlab.freedesktop.org/drm/intel/issues/180>) +1
>       similar issue
>    -
>
>    igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
>    -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-tglb6/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html>
>       (i915#3826 <https://gitlab.freedesktop.org/drm/intel/issues/3826>)
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb2/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html>
>       (i915#3826 <https://gitlab.freedesktop.org/drm/intel/issues/3826>)
>       -
>
>    igt@kms_atomic@atomic_plane_damage:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb3/igt@kms_atomic@atomic_plane_damage.html>
>       (i915#4765 <https://gitlab.freedesktop.org/drm/intel/issues/4765>)
>    -
>
>    igt@kms_big_fb@4-tiled-64bpp-rotate-270:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-tglb5/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html>
>       (i915#5286 <https://gitlab.freedesktop.org/drm/intel/issues/5286>)
>    -
>
>    igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html>
>       (i915#5286 <https://gitlab.freedesktop.org/drm/intel/issues/5286>)
>    -
>
>    igt@kms_big_fb@linear-32bpp-rotate-270:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-tglb2/igt@kms_big_fb@linear-32bpp-rotate-270.html>
>       (fdo#111614 <https://bugs.freedesktop.org/show_bug.cgi?id=111614>)
>       +2 similar issues
>    -
>
>    igt@kms_big_fb@x-tiled-64bpp-rotate-90:
>    - shard-glk: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-glk9/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>)
>       +72 similar issues
>    -
>
>    igt@kms_big_fb@y-tiled-8bpp-rotate-90:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb2/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html>
>       (fdo#110725 <https://bugs.freedesktop.org/show_bug.cgi?id=110725> /
>       fdo#111614 <https://bugs.freedesktop.org/show_bug.cgi?id=111614>)
>       +3 similar issues
>    -
>
>    igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
>    -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-tglb5/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html>
>       (fdo#111615 <https://bugs.freedesktop.org/show_bug.cgi?id=111615>)
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb2/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html>
>       (fdo#110723 <https://bugs.freedesktop.org/show_bug.cgi?id=110723>)
>       -
>
>    igt@kms_big_joiner@2x-modeset:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb6/igt@kms_big_joiner@2x-modeset.html>
>       (i915#2705 <https://gitlab.freedesktop.org/drm/intel/issues/2705>)
>    -
>
>    igt@kms_ccs@pipe-a-bad-pixel-format-4_tiled_dg2_rc_ccs:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb3/igt@kms_ccs@pipe-a-bad-pixel-format-4_tiled_dg2_rc_ccs.html>
>       (fdo#109278 <https://bugs.freedesktop.org/show_bug.cgi?id=109278>)
>       +13 similar issues
>    -
>
>    igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-tglb6/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html>
>       (i915#3689 <https://gitlab.freedesktop.org/drm/intel/issues/3689> /
>       i915#3886 <https://gitlab.freedesktop.org/drm/intel/issues/3886>)
>       +2 similar issues
>    -
>
>    igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc:
>    - shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-apl7/igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#3886 <https://gitlab.freedesktop.org/drm/intel/issues/3886>)
>       +8 similar issues
>    -
>
>    igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:
>    - shard-glk: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-glk1/igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#3886 <https://gitlab.freedesktop.org/drm/intel/issues/3886>)
>       +4 similar issues
>    -
>
>    igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_mc_ccs:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb6/igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_mc_ccs.html>
>       (fdo#109278 <https://bugs.freedesktop.org/show_bug.cgi?id=109278> /
>       i915#3886 <https://gitlab.freedesktop.org/drm/intel/issues/3886>)
>       +3 similar issues
>    -
>
>    igt@kms_ccs@pipe-c-crc-primary-basic-4_tiled_dg2_rc_ccs_cc:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-tglb2/igt@kms_ccs@pipe-c-crc-primary-basic-4_tiled_dg2_rc_ccs_cc.html>
>       (i915#6095 <https://gitlab.freedesktop.org/drm/intel/issues/6095>)
>       +3 similar issues
>    -
>
>    igt@kms_ccs@pipe-d-bad-rotation-90-4_tiled_dg2_mc_ccs:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-tglb6/igt@kms_ccs@pipe-d-bad-rotation-90-4_tiled_dg2_mc_ccs.html>
>       (i915#3689 <https://gitlab.freedesktop.org/drm/intel/issues/3689>)
>    -
>
>    igt@kms_chamelium@dp-crc-single:
>    - shard-snb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-snb5/igt@kms_chamelium@dp-crc-single.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>)
>       +5 similar issues
>    -
>
>    {igt@kms_chamelium@dp-edid-resolution-list} (NEW):
>    -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb1/igt@kms_chamelium@dp-edid-resolution-list.html>
>       (fdo#109284 <https://bugs.freedesktop.org/show_bug.cgi?id=109284>)
>       -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-tglb8/igt@kms_chamelium@dp-edid-resolution-list.html>
>       (fdo#109284 <https://bugs.freedesktop.org/show_bug.cgi?id=109284>)
>       -
>
>    igt@kms_chamelium@hdmi-hpd-for-each-pipe:
>    - shard-glk: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-glk1/igt@kms_chamelium@hdmi-hpd-for-each-pipe.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>)
>       +4 similar issues
>    -
>
>    igt@kms_chamelium@vga-hpd-fast:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-tglb1/igt@kms_chamelium@vga-hpd-fast.html>
>       (fdo#109284 <https://bugs.freedesktop.org/show_bug.cgi?id=109284> /
>       fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>)
>       +3 similar issues
>    -
>
>    igt@kms_color_chamelium@ctm-0-50:
>    - shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-apl6/igt@kms_color_chamelium@ctm-0-50.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>)
>       +6 similar issues
>    -
>
>    igt@kms_color_chamelium@ctm-0-75:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb5/igt@kms_color_chamelium@ctm-0-75.html>
>       (fdo#109284 <https://bugs.freedesktop.org/show_bug.cgi?id=109284> /
>       fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>)
>       +4 similar issues
>    -
>
>    igt@kms_content_protection@atomic-dpms:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb7/igt@kms_content_protection@atomic-dpms.html>
>       (i915#7118 <https://gitlab.freedesktop.org/drm/intel/issues/7118>)
>    -
>
>    igt@kms_content_protection@atomic@pipe-a-dp-1:
>    - shard-apl: NOTRUN -> TIMEOUT
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-apl7/igt@kms_content_protection@atomic@pipe-a-dp-1.html>
>       (i915#7173 <https://gitlab.freedesktop.org/drm/intel/issues/7173>)
>    -
>
>    igt@kms_cursor_crc@cursor-offscreen-512x170:
>    -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb2/igt@kms_cursor_crc@cursor-offscreen-512x170.html>
>       (fdo#109279 <https://bugs.freedesktop.org/show_bug.cgi?id=109279> /
>       i915#3359 <https://gitlab.freedesktop.org/drm/intel/issues/3359>)
>       -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-tglb6/igt@kms_cursor_crc@cursor-offscreen-512x170.html>
>       (fdo#109279 <https://bugs.freedesktop.org/show_bug.cgi?id=109279> /
>       i915#3359 <https://gitlab.freedesktop.org/drm/intel/issues/3359>)
>       -
>
>    igt@kms_cursor_crc@cursor-sliding-32x32:
>    - shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-apl1/igt@kms_cursor_crc@cursor-sliding-32x32.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>)
>       +98 similar issues
>    -
>
>    igt@kms_cursor_crc@cursor-sliding-512x512:
>    -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-tglb2/igt@kms_cursor_crc@cursor-sliding-512x512.html>
>       (i915#3359 <https://gitlab.freedesktop.org/drm/intel/issues/3359>)
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb6/igt@kms_cursor_crc@cursor-sliding-512x512.html>
>       (i915#3359 <https://gitlab.freedesktop.org/drm/intel/issues/3359>)
>       -
>
>    igt@kms_cursor_legacy@cursorb-vs-flipa@atomic-transitions-varying-size:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-tglb6/igt@kms_cursor_legacy@cursorb-vs-flipa@atomic-transitions-varying-size.html>
>       (fdo#109274 <https://bugs.freedesktop.org/show_bug.cgi?id=109274> /
>       fdo#111825 <https://bugs.freedesktop.org/show_bug.cgi?id=111825>)
>       +6 similar issues
>    -
>
>    igt@kms_cursor_legacy@cursorb-vs-flipa@legacy:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb8/igt@kms_cursor_legacy@cursorb-vs-flipa@legacy.html>
>       (fdo#109274 <https://bugs.freedesktop.org/show_bug.cgi?id=109274>)
>       +17 similar issues
>    -
>
>    igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size:
>    - shard-glk: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7059/shard-glk1/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size.html>
>       (i915#2346 <https://gitlab.freedesktop.org/drm/intel/issues/2346>)
>       +1 similar issue
>    -
>
>    igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium:
>    -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-tglb3/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html>
>       (i915#3528 <https://gitlab.freedesktop.org/drm/intel/issues/3528>)
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb3/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html>
>       (i915#3528 <https://gitlab.freedesktop.org/drm/intel/issues/3528>)
>       -
>
>    igt@kms_dsc@dsc-with-bpc-formats:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb7/igt@kms_dsc@dsc-with-bpc-formats.html>
>       (i915#3840 <https://gitlab.freedesktop.org/drm/intel/issues/3840>)
>    -
>
>    igt@kms_fbcon_fbt@fbc-suspend:
>    -
>
>       shard-apl: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-apl6/igt@kms_fbcon_fbt@fbc-suspend.html>
>       (i915#4767 <https://gitlab.freedesktop.org/drm/intel/issues/4767>)
>       -
>
>       shard-tglb: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-tglb3/igt@kms_fbcon_fbt@fbc-suspend.html>
>       (i915#2411 <https://gitlab.freedesktop.org/drm/intel/issues/2411> /
>       i915#4767 <https://gitlab.freedesktop.org/drm/intel/issues/4767>)
>       -
>
>       shard-glk: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-glk2/igt@kms_fbcon_fbt@fbc-suspend.html>
>       (i915#4767 <https://gitlab.freedesktop.org/drm/intel/issues/4767>)
>       -
>
>       shard-iclb: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb3/igt@kms_fbcon_fbt@fbc-suspend.html>
>       (i915#4767 <https://gitlab.freedesktop.org/drm/intel/issues/4767>)
>       -
>
>    igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2
>    :
>    - shard-glk: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7059/shard-glk9/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-glk7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2.html>
>       (i915#79 <https://gitlab.freedesktop.org/drm/intel/issues/79>)
>    -
>
>    igt@kms_flip@2x-nonexisting-fb-interruptible:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-tglb3/igt@kms_flip@2x-nonexisting-fb-interruptible.html>
>       (fdo#109274 <https://bugs.freedesktop.org/show_bug.cgi?id=109274> /
>       fdo#111825 <https://bugs.freedesktop.org/show_bug.cgi?id=111825> /
>       i915#3637 <https://gitlab.freedesktop.org/drm/intel/issues/3637>)
>       +1 similar issue
>    -
>
>    igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp1:
>    - shard-apl: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7059/shard-apl8/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp1.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-apl8/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp1.html>
>       (i915#79 <https://gitlab.freedesktop.org/drm/intel/issues/79>)
>    -
>
>    igt@kms_flip_scaled_crc
>    @flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb7/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html>
>       (i915#2587 <https://gitlab.freedesktop.org/drm/intel/issues/2587> /
>       i915#2672 <https://gitlab.freedesktop.org/drm/intel/issues/2672>)
>       +1 similar issue
>    -
>
>    igt@kms_flip_scaled_crc
>    @flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-default-mode:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-default-mode.html>
>       (i915#6375 <https://gitlab.freedesktop.org/drm/intel/issues/6375>)
>    -
>
>    igt@kms_flip_scaled_crc
>    @flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode.html>
>       (i915#2672 <https://gitlab.freedesktop.org/drm/intel/issues/2672>)
>       +3 similar issues
>    -
>
>    igt@kms_flip_scaled_crc
>    @flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-default-mode:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-default-mode.html>
>       (i915#2672 <https://gitlab.freedesktop.org/drm/intel/issues/2672> /
>       i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555>)
>    -
>
>    igt@kms_frontbuffer_tracking
>    @fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-gtt:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-gtt.html>
>       (fdo#109280 <https://bugs.freedesktop.org/show_bug.cgi?id=109280>)
>       +14 similar issues
>    -
>
>    igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render.html>
>       (fdo#109280 <https://bugs.freedesktop.org/show_bug.cgi?id=109280> /
>       fdo#111825 <https://bugs.freedesktop.org/show_bug.cgi?id=111825>)
>       +9 similar issues
>    -
>
>    igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-gtt:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-gtt.html>
>       (i915#6497 <https://gitlab.freedesktop.org/drm/intel/issues/6497>)
>       +4 similar issues
>    -
>
>    igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-dp-1:
>    - shard-apl: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-apl1/igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-dp-1.html>
>       (i915#4573 <https://gitlab.freedesktop.org/drm/intel/issues/4573>)
>       +2 similar issues
>    -
>
>    igt@kms_plane_multiple@tiling-4:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb5/igt@kms_plane_multiple@tiling-4.html>
>       (i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555>)
>       +1 similar issue
>    -
>
>    igt@kms_plane_scaling
>    @planes-upscale-20x20-downscale-factor-0-5@pipe-b-edp-1:
>    - shard-iclb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7059/shard-iclb6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b-edp-1.html>
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b-edp-1.html>
>       (i915#5235 <https://gitlab.freedesktop.org/drm/intel/issues/5235>)
>       +2 similar issues
>    -
>
>    igt@kms_prime@d3hot:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb3/igt@kms_prime@d3hot.html>
>       (i915#6524 <https://gitlab.freedesktop.org/drm/intel/issues/6524>)
>    -
>
>    igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:
>    -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-tglb8/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html>
>       (i915#2920 <https://gitlab.freedesktop.org/drm/intel/issues/2920>)
>       -
>
>       shard-glk: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-glk5/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>)
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb5/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html>
>       (i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>)
>       -
>
>    igt@kms_psr2_su@page_flip-p010:
>    - shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-apl1/igt@kms_psr2_su@page_flip-p010.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>) +1
>       similar issue
>    -
>
>    igt@kms_psr2_su@page_flip-xrgb8888:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb6/igt@kms_psr2_su@page_flip-xrgb8888.html>
>       (fdo#109642 <https://bugs.freedesktop.org/show_bug.cgi?id=109642> /
>       fdo#111068 <https://bugs.freedesktop.org/show_bug.cgi?id=111068> /
>       i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>)
>    -
>
>    igt@kms_psr@psr2_cursor_plane_onoff:
>    - shard-tglb: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-tglb2/igt@kms_psr@psr2_cursor_plane_onoff.html>
>       (i915#132 <https://gitlab.freedesktop.org/drm/intel/issues/132> /
>       i915#3467 <https://gitlab.freedesktop.org/drm/intel/issues/3467>)
>    -
>
>    igt@kms_psr@psr2_sprite_blt:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb6/igt@kms_psr@psr2_sprite_blt.html>
>       (fdo#109441 <https://bugs.freedesktop.org/show_bug.cgi?id=109441>)
>    -
>
>    igt@kms_psr@psr2_sprite_mmap_gtt:
>    - shard-iclb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7059/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html>
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb7/igt@kms_psr@psr2_sprite_mmap_gtt.html>
>       (fdo#109441 <https://bugs.freedesktop.org/show_bug.cgi?id=109441>)
>       +3 similar issues
>    -
>
>    igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
>    - shard-tglb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7059/shard-tglb6/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html>
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-tglb8/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html>
>       (i915#5519 <https://gitlab.freedesktop.org/drm/intel/issues/5519>)
>    -
>
>    igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb2/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html>
>       (i915#5289 <https://gitlab.freedesktop.org/drm/intel/issues/5289>)
>    -
>
>    igt@kms_tv_load_detect@load-detect:
>    - shard-snb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-snb4/igt@kms_tv_load_detect@load-detect.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>)
>       +138 similar issues
>    -
>
>    igt@kms_writeback@writeback-check-output:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb3/igt@kms_writeback@writeback-check-output.html>
>       (i915#2437 <https://gitlab.freedesktop.org/drm/intel/issues/2437>)
>    -
>
>    igt@sysfs_clients@recycle-many:
>    - shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-apl8/igt@sysfs_clients@recycle-many.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#2994 <https://gitlab.freedesktop.org/drm/intel/issues/2994>)
>       +1 similar issue
>    -
>
>    igt@sysfs_clients@sema-10:
>    -
>
>       shard-glk: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-glk2/igt@sysfs_clients@sema-10.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#2994 <https://gitlab.freedesktop.org/drm/intel/issues/2994>)
>       +2 similar issues
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb3/igt@sysfs_clients@sema-10.html>
>       (i915#2994 <https://gitlab.freedesktop.org/drm/intel/issues/2994>)
>       -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-tglb3/igt@sysfs_clients@sema-10.html>
>       (i915#2994 <https://gitlab.freedesktop.org/drm/intel/issues/2994>)
>
> Possible fixes
>
>    -
>
>    igt@fbdev@read:
>    - {shard-rkl}: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7059/shard-rkl-1/igt@fbdev@read.html>
>       (i915#2582 <https://gitlab.freedesktop.org/drm/intel/issues/2582>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-rkl-6/igt@fbdev@read.html>
>    -
>
>    igt@gem_ctx_exec@basic-nohangcheck:
>    - shard-tglb: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7059/shard-tglb2/igt@gem_ctx_exec@basic-nohangcheck.html>
>       (i915#6268 <https://gitlab.freedesktop.org/drm/intel/issues/6268>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-tglb1/igt@gem_ctx_exec@basic-nohangcheck.html>
>    -
>
>    igt@gem_ctx_persistence@many-contexts:
>    - {shard-rkl}: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7059/shard-rkl-6/igt@gem_ctx_persistence@many-contexts.html>
>       (i915#2410 <https://gitlab.freedesktop.org/drm/intel/issues/2410>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-rkl-5/igt@gem_ctx_persistence@many-contexts.html>
>    -
>
>    igt@gem_eio@in-flight-suspend:
>    - {shard-rkl}: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7059/shard-rkl-3/igt@gem_eio@in-flight-suspend.html>
>       (fdo#103375 <https://bugs.freedesktop.org/show_bug.cgi?id=103375>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-rkl-2/igt@gem_eio@in-flight-suspend.html>
>    -
>
>    igt@gem_exec_balancer@parallel-keep-submit-fence:
>    - shard-iclb: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7059/shard-iclb3/igt@gem_exec_balancer@parallel-keep-submit-fence.html>
>       (i915#4525 <https://gitlab.freedesktop.org/drm/intel/issues/4525>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb1/igt@gem_exec_balancer@parallel-keep-submit-fence.html>
>    -
>
>    igt@gem_exec_fair@basic-none-share@rcs0:
>    - shard-iclb: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7059/shard-iclb8/igt@gem_exec_fair@basic-none-share@rcs0.html>
>       (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb1/igt@gem_exec_fair@basic-none-share@rcs0.html>
>    -
>
>    igt@gem_exec_fair@basic-pace-share@rcs0:
>    - shard-tglb: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7059/shard-tglb2/igt@gem_exec_fair@basic-pace-share@rcs0.html>
>       (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-tglb8/igt@gem_exec_fair@basic-pace-share@rcs0.html>
>    -
>
>    igt@gem_exec_fair@basic-pace@vcs0:
>    - shard-glk: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7059/shard-glk6/igt@gem_exec_fair@basic-pace@vcs0.html>
>       (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-glk3/igt@gem_exec_fair@basic-pace@vcs0.html>
>       +3 similar issues
>    -
>
>    igt@gem_exec_reloc@basic-write-gtt-noreloc:
>    - {shard-rkl}: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7059/shard-rkl-4/igt@gem_exec_reloc@basic-write-gtt-noreloc.html>
>       (i915#3281 <https://gitlab.freedesktop.org/drm/intel/issues/3281>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-rkl-5/igt@gem_exec_reloc@basic-write-gtt-noreloc.html>
>       +5 similar issues
>    -
>
>    igt@gem_exec_schedule@semaphore-power:
>    - {shard-rkl}: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7059/shard-rkl-1/igt@gem_exec_schedule@semaphore-power.html>
>       (i915#7276 <https://gitlab.freedesktop.org/drm/intel/issues/7276>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-rkl-5/igt@gem_exec_schedule@semaphore-power.html>
>    -
>
>    igt@gem_mmap_gtt@coherency:
>    - {shard-rkl}: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7059/shard-rkl-3/igt@gem_mmap_gtt@coherency.html>
>       (fdo#111656 <https://bugs.freedesktop.org/show_bug.cgi?id=111656>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-rkl-5/igt@gem_mmap_gtt@coherency.html>
>    -
>
>    igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
>    - {shard-rkl}: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7059/shard-rkl-4/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html>
>       (i915#3282 <https://gitlab.freedesktop.org/drm/intel/issues/3282>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-rkl-5/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html>
>       +5 similar issues
>    -
>
>    igt@gem_softpin@evict-single-offset:
>    - shard-tglb: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7059/shard-tglb8/igt@gem_softpin@evict-single-offset.html>
>       (i915#4171 <https://gitlab.freedesktop.org/drm/intel/issues/4171>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-tglb7/igt@gem_softpin@evict-single-offset.html>
>    -
>
>    igt@gem_workarounds@suspend-resume-context:
>    - shard-apl: DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7059/shard-apl6/igt@gem_workarounds@suspend-resume-context.html>
>       (i915#180 <https://gitlab.freedesktop.org/drm/intel/issues/180> /
>       i915#1982 <https://gitlab.freedesktop.org/drm/intel/issues/1982>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-apl7/igt@gem_workarounds@suspend-resume-context.html>
>    -
>
>    igt@gen9_exec_parse@secure-batches:
>    - {shard-rkl}: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7059/shard-rkl-1/igt@gen9_exec_parse@secure-batches.html>
>       (i915#2527 <https://gitlab.freedesktop.org/drm/intel/issues/2527>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-rkl-5/igt@gen9_exec_parse@secure-batches.html>
>       +3 similar issues
>    -
>
>    igt@i915_pipe_stress@stress-xrgb8888-ytiled:
>    - {shard-rkl}: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7059/shard-rkl-5/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html>
>       (i915#4098 <https://gitlab.freedesktop.org/drm/intel/issues/4098>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-rkl-6/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html>
>       +1 similar issue
>    -
>
>    igt@i915_pm_dc@dc6-psr:
>    - shard-iclb: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7059/shard-iclb3/igt@i915_pm_dc@dc6-psr.html>
>       (i915#3989 <https://gitlab.freedesktop.org/drm/intel/issues/3989> /
>       i915#454 <https://gitlab.freedesktop.org/drm/intel/issues/454>) ->
>       PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb5/igt@i915_pm_dc@dc6-psr.html>
>    -
>
>    igt@i915_pm_sseu@full-enable:
>    - {shard-rkl}: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7059/shard-rkl-3/igt@i915_pm_sseu@full-enable.html>
>       (i915#4387 <https://gitlab.freedesktop.org/drm/intel/issues/4387>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-rkl-5/igt@i915_pm_sseu@full-enable.html>
>    -
>
>    igt@i915_selftest@live@gt_heartbeat:
>    - shard-apl: DMESG-FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7059/shard-apl1/igt@i915_selftest@live@gt_heartbeat.html>
>       (i915#5334 <https://gitlab.freedesktop.org/drm/intel/issues/5334>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-apl6/igt@i915_selftest@live@gt_heartbeat.html>
>    -
>
>    igt@i915_selftest@perf@engine_cs:
>    - shard-snb: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7059/shard-snb7/igt@i915_selftest@perf@engine_cs.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-snb6/igt@i915_selftest@perf@engine_cs.html>
>    -
>
>    igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
>    - {shard-rkl}: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7059/shard-rkl-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html>
>       (i915#1845 <https://gitlab.freedesktop.org/drm/intel/issues/1845> /
>       i915#4098 <https://gitlab.freedesktop.org/drm/intel/issues/4098>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-rkl-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html>
>       +13 similar issues
>    -
>
>    igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp1:
>    - shard-apl: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7059/shard-apl8/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp1.html>
>       (i915#79 <https://gitlab.freedesktop.org/drm/intel/issues/79>) ->
>       PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-apl8/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp1.html>
>    -
>
>    igt@kms_flip@flip-vs-suspend-interruptible@b-edp1:
>    - shard-tglb: DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7059/shard-tglb7/igt@kms_flip@flip-vs-suspend-interruptible@b-edp1.html>
>       (i915#2411 <https://gitlab.freedesktop.org/drm/intel/issues/2411> /
>       i915#2867 <https://gitlab.freedesktop.org/drm/intel/issues/2867>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-tglb1/igt@kms_flip@flip-vs-suspend-interruptible@b-edp1.html>
>    -
>
>    igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:
>    - {shard-rkl}: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7059/shard-rkl-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html>
>       (i915#1849 <https://gitlab.freedesktop.org/drm/intel/issues/1849> /
>       i915#4098 <https://gitlab.freedesktop.org/drm/intel/issues/4098>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html>
>       +11 similar issues
>    -
>
>    igt@kms_plane@pixel-format-source-clamping@pipe-b-planes:
>    - {shard-rkl}: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7059/shard-rkl-3/igt@kms_plane@pixel-format-source-clamping@pipe-b-planes.html>
>       (i915#3558 <https://gitlab.freedesktop.org/drm/intel/issues/3558>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-rkl-6/igt@kms_plane@pixel-format-source-clamping@pipe-b-planes.html>
>       +1 similar issue
>    -
>
>    igt@kms_plane_scaling
>    @planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a-edp-1:
>    - shard-iclb: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7059/shard-iclb2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a-edp-1.html>
>       (i915#5235 <https://gitlab.freedesktop.org/drm/intel/issues/5235>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a-edp-1.html>
>       +2 similar issues
>    -
>
>    igt@kms_properties@crtc-properties-atomic:
>    - {shard-rkl}: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7059/shard-rkl-4/igt@kms_properties@crtc-properties-atomic.html>
>       (i915#1849 <https://gitlab.freedesktop.org/drm/intel/issues/1849>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-rkl-6/igt@kms_properties@crtc-properties-atomic.html>
>    -
>
>    igt@kms_psr@psr2_primary_mmap_gtt:
>    - shard-iclb: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7059/shard-iclb6/igt@kms_psr@psr2_primary_mmap_gtt.html>
>       (fdo#109441 <https://bugs.freedesktop.org/show_bug.cgi?id=109441>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb2/igt@kms_psr@psr2_primary_mmap_gtt.html>
>    -
>
>    igt@kms_psr@sprite_blt:
>    - {shard-rkl}: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7059/shard-rkl-4/igt@kms_psr@sprite_blt.html>
>       (i915#1072 <https://gitlab.freedesktop.org/drm/intel/issues/1072>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-rkl-6/igt@kms_psr@sprite_blt.html>
>    -
>
>    igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
>    - shard-iclb: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7059/shard-iclb6/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html>
>       (i915#5519 <https://gitlab.freedesktop.org/drm/intel/issues/5519>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb1/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html>
>    -
>
>    igt@kms_vblank@pipe-a-ts-continuation-suspend:
>    - shard-apl: DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7059/shard-apl1/igt@kms_vblank@pipe-a-ts-continuation-suspend.html>
>       (i915#180 <https://gitlab.freedesktop.org/drm/intel/issues/180>) ->
>       PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-apl1/igt@kms_vblank@pipe-a-ts-continuation-suspend.html>
>    -
>
>    igt@sysfs_heartbeat_interval@precise@rcs0:
>    - {shard-dg1}: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7059/shard-dg1-15/igt@sysfs_heartbeat_interval@precise@rcs0.html>
>       (i915#1755 <https://gitlab.freedesktop.org/drm/intel/issues/1755>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-dg1-15/igt@sysfs_heartbeat_interval@precise@rcs0.html>
>       +4 similar issues
>
> Warnings
>
>    -
>
>    igt@gem_pread@exhaustion:
>    - shard-apl: INCOMPLETE
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7059/shard-apl3/igt@gem_pread@exhaustion.html>
>       (i915#7248 <https://gitlab.freedesktop.org/drm/intel/issues/7248>)
>       -> WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-apl6/igt@gem_pread@exhaustion.html>
>       (i915#2658 <https://gitlab.freedesktop.org/drm/intel/issues/2658>)
>    -
>
>    igt@i915_pm_rc6_residency@rc6-idle@rcs0:
>    - shard-iclb: WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7059/shard-iclb8/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html>
>       (i915#2684 <https://gitlab.freedesktop.org/drm/intel/issues/2684>)
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb1/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html>
>       (i915#2684 <https://gitlab.freedesktop.org/drm/intel/issues/2684>)
>    -
>
>    igt@i915_pm_rc6_residency@rc6-idle@vecs0:
>    - shard-iclb: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7059/shard-iclb8/igt@i915_pm_rc6_residency@rc6-idle@vecs0.html>
>       (i915#2684 <https://gitlab.freedesktop.org/drm/intel/issues/2684>)
>       -> WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb1/igt@i915_pm_rc6_residency@rc6-idle@vecs0.html>
>       (i915#2684 <https://gitlab.freedesktop.org/drm/intel/issues/2684>)
>    -
>
>    igt@kms_content_protection@mei_interface:
>    -
>
>       shard-tglb: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7059/shard-tglb1/igt@kms_content_protection@mei_interface.html>
>       (i915#7118 <https://gitlab.freedesktop.org/drm/intel/issues/7118>)
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-tglb8/igt@kms_content_protection@mei_interface.html>
>       (fdo#109300 <https://bugs.freedesktop.org/show_bug.cgi?id=109300>)
>       -
>
>       shard-iclb: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7059/shard-iclb1/igt@kms_content_protection@mei_interface.html>
>       (i915#7118 <https://gitlab.freedesktop.org/drm/intel/issues/7118>)
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb1/igt@kms_content_protection@mei_interface.html>
>       (fdo#109300 <https://bugs.freedesktop.org/show_bug.cgi?id=109300>)
>       -
>
>    igt@kms_plane_alpha_blend@alpha-basic@pipe-c-dp-1:
>    - shard-apl: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7059/shard-apl7/igt@kms_plane_alpha_blend@alpha-basic@pipe-c-dp-1.html>
>       (i915#4573 <https://gitlab.freedesktop.org/drm/intel/issues/4573>)
>       -> DMESG-FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-apl2/igt@kms_plane_alpha_blend@alpha-basic@pipe-c-dp-1.html>
>       (IGT#6 <https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/6>)
>       +1 similar issue
>    -
>
>    igt@kms_psr2_sf@overlay-plane-update-continuous-sf:
>    - shard-iclb: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7059/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html>
>       (i915#2920 <https://gitlab.freedesktop.org/drm/intel/issues/2920>)
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb7/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html>
>       (fdo#111068 <https://bugs.freedesktop.org/show_bug.cgi?id=111068> /
>       i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>)
>
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> Build changes
>
>    - CI: CI-20190529 -> None
>    - IGT: IGT_7059 -> IGTPW_8109
>
> CI-20190529: 20190529
> CI_DRM_12382: cb74864693414b221b3601572e75449558126e8b @ git://
> anongit.freedesktop.org/gfx-ci/linux
> IGTPW_8109: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/index.html
> IGT_7059: 89c5c56dfde602d54eefa301e9887eff8bcda0e8 @
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>

--000000000000bc9ae905ed97cf25
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Lakshminarayana, can I get a rerun ple=
ase.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_at=
tr">On Tue, Nov 15, 2022 at 10:21 PM Patchwork &lt;<a href=3D"mailto:patchw=
ork@emeril.freedesktop.org">patchwork@emeril.freedesktop.org</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div class=3D"m=
sg4499438268541239734">
<u></u>

=20
 =20
 =20
 =20

<div>


<b>Patch Details</b>
<table>
<tbody><tr><td><b>Series:</b></td><td>Chamelium: Add new EDID Resolution Li=
st test (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/110614/" target=3D"_blank">https://patchwork.freedesktop.org/series/11=
0614/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8109/index.html" target=3D"_blank">https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_8109/index.html</a></td></tr>

</tbody></table>


    <h1>CI Bug Log - changes from IGT_7059_full -&gt; IGTPW_8109_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_8109_full absolutely need to b=
e<br>
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
>
  introduced in IGTPW_8109_full, please notify your bug team to allow them<=
br>
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
8109/index.html" target=3D"_blank">https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_8109/index.html</a></p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_8109=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@i915_pm_dc@dc5-psr:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7059/shard-tglb2/igt@i915_pm_dc@dc5-psr.html" target=3D"_blank">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/sha=
rd-tglb5/igt@i915_pm_dc@dc5-psr.html" target=3D"_blank">FAIL</a></li>
</ul>
</li>
<li>
<p>{igt@kms_chamelium@dp-edid-resolution-list} (NEW):</p>
<ul>
<li>{shard-rkl}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8109/shard-rkl-2/igt@kms_chamelium@dp-edid-resolution-l=
ist.html" target=3D"_blank">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7059/shard-iclb3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indf=
b-draw-blt.html" target=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb8/igt@kms_frontbuffer_track=
ing@psr-1p-primscrn-cur-indfb-draw-blt.html" target=3D"_blank">FAIL</a></li=
>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br>
  They do not affect the overall result.</p>
<ul>
<li>igt@fbdev@read:<ul>
<li>{shard-dg1}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7059/shard-dg1-18/igt@fbdev@read.html" target=3D"_blank">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-dg1-=
19/igt@fbdev@read.html" target=3D"_blank">FAIL</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_7059_full and IGTPW_8109_full=
:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@kms_chamelium@dp-edid-resolution-list:<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8109_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@feature_discovery@display-2x:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8109/shard-iclb2/igt@feature_discovery@display-2x.html"=
 target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/1839" target=3D"_blank">i915#1839</a>)</li>
</ul>
</li>
<li>
<p>igt@feature_discovery@psr2:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7059/shard-iclb2/igt@feature_discovery@psr2.html" target=3D"_blank">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109=
/shard-iclb6/igt@feature_discovery@psr2.html" target=3D"_blank">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/658" target=3D"_b=
lank">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-sanity-check:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8109/shard-tglb7/igt@gem_create@create-ext-cpu-access-sa=
nity-check.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/intel/issues/6335" target=3D"_blank">i915#6335</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8109/shard-iclb6/igt@gem_create@create-ext-cpu-access-sa=
nity-check.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/intel/issues/6335" target=3D"_blank">i915#6335</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-mixed-process:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8109/shard-snb2/igt@gem_ctx_persistence@legacy-engines-=
mixed-process.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.fre=
edesktop.org/show_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1099" target=3D"_=
blank">i915#1099</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8109/shard-snb5/igt@gem_eio@unwedge-stress.html" target=
=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/3354" target=3D"_blank">i915#3354</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-bb-first:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7059/shard-iclb1/igt@gem_exec_balancer@parallel-bb-first.html" target=
=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_8109/shard-iclb3/igt@gem_exec_balancer@parallel-bb-first.html" ta=
rget=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/4525" target=3D"_blank">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8109/shard-iclb1/igt@gem_exec_fair@basic-none@vcs1.html=
" target=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/2842" target=3D"_blank">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vecs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7059/shard-glk1/igt@gem_exec_fair@basic-none@vecs0.html" target=3D"_bl=
ank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_8109/shard-glk2/igt@gem_exec_fair@basic-none@vecs0.html" target=3D"_blan=
k">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/284=
2" target=3D"_blank">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8109/shard-apl1/igt@gem_huc_copy@huc-copy.html" target=
=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/intel/issues/2190" target=3D"_blank">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8109/shard-iclb1/igt@gem_lmem_swapping@basic.html" targ=
et=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/4613" target=3D"_blank">i915#4613</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-multi:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8109/shard-apl1/igt@gem_lmem_swapping@heavy-multi.html"=
 target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/4613" target=3D"_blank">i915#4613</a=
>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi-ccs:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8109/shard-tglb5/igt@gem_lmem_swapping@heavy-verify-mult=
i-ccs.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/4613" target=3D"_blank">i915#4613</a>) +2 similar i=
ssues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8109/shard-glk1/igt@gem_lmem_swapping@heavy-verify-multi=
-ccs.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.=
org/show_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/4613" target=3D"_blank">i9=
15#4613</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@linear-to-vebox-yf-tiled:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8109/shard-iclb8/igt@gem_render_copy@linear-to-vebox-yf=
-tiled.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/768" target=3D"_blank">i915#768</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-single-offset:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7059/shard-iclb6/igt@gem_softpin@evict-single-offset.html" target=3D"_=
blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_8109/shard-iclb6/igt@gem_softpin@evict-single-offset.html" target=3D"_=
blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/4171" target=3D"_blank">i915#4171</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop-interruptible:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8109/shard-tglb8/igt@gem_softpin@evict-snoop-interruptib=
le.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.or=
g/show_bug.cgi?id=3D109312" target=3D"_blank">fdo#109312</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8109/shard-iclb5/igt@gem_softpin@evict-snoop-interruptib=
le.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.or=
g/show_bug.cgi?id=3D109312" target=3D"_blank">fdo#109312</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@access-control:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8109/shard-iclb6/igt@gem_userptr_blits@access-control.h=
tml" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/3297" target=3D"_blank">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-sync:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8109/shard-iclb3/igt@gem_userptr_blits@coherency-sync.ht=
ml" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D109290" target=3D"_blank">fdo#109290</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8109/shard-tglb3/igt@gem_userptr_blits@coherency-sync.ht=
ml" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D110542" target=3D"_blank">fdo#110542</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-allowed:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8109/shard-tglb1/igt@gen7_exec_parse@basic-allowed.html"=
 target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D109289" target=3D"_blank">fdo#109289</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8109/shard-iclb8/igt@gen7_exec_parse@basic-allowed.html"=
 target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D109289" target=3D"_blank">fdo#109289</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7059/shard-apl3/igt@gen9_exec_parse@allowed-single.html" target=3D"_bl=
ank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_8109/shard-apl3/igt@gen9_exec_parse@allowed-single.html" target=3D"_blan=
k">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/5566" target=3D"_blank">i915#5566</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/716" target=3D"_blank">i915#716</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@resize-bar:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8109/shard-iclb7/igt@i915_module_load@resize-bar.html" =
target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/6412" target=3D"_blank">i915#6412</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_mult@media-freq@gt0:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8109/shard-iclb6/igt@i915_pm_freq_mult@media-freq@gt0.ht=
ml" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/6590" target=3D"_blank">i915#6590</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8109/shard-tglb2/igt@i915_pm_freq_mult@media-freq@gt0.ht=
ml" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/6590" target=3D"_blank">i915#6590</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7059/shard-tglb1/igt@i915_selftest@live@hangcheck.html" target=3D"_bla=
nk">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_8109/shard-tglb3/igt@i915_selftest@live@hangcheck.html" target=3D"_blank"=
>DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/5591" target=3D"_blank">i915#5591</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-tiled2untiled:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7059/shard-apl3/igt@i915_suspend@fence-restore-tiled2untiled.html" tar=
get=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_8109/shard-apl6/igt@i915_suspend@fence-restore-tiled2untiled.h=
tml" target=3D"_blank">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/180" target=3D"_blank">i915#180</a>) +1 similar issu=
e</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8109/shard-tglb6/igt@kms_addfb_basic@invalid-smem-bo-on-=
discrete.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/3826" target=3D"_blank">i915#3826</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8109/shard-iclb2/igt@kms_addfb_basic@invalid-smem-bo-on-=
discrete.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/3826" target=3D"_blank">i915#3826</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@atomic_plane_damage:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8109/shard-iclb3/igt@kms_atomic@atomic_plane_damage.htm=
l" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/4765" target=3D"_blank">i915#4765</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8109/shard-tglb5/igt@kms_big_fb@4-tiled-64bpp-rotate-27=
0.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/5286" target=3D"_blank">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8109/shard-iclb2/igt@kms_big_fb@4-tiled-max-hw-stride-3=
2bpp-rotate-180-async-flip.html" target=3D"_blank">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/5286" target=3D"_blank">i915#5=
286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8109/shard-tglb2/igt@kms_big_fb@linear-32bpp-rotate-270=
.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D111614" target=3D"_blank">fdo#111614</a>) +2 similar issu=
es</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8109/shard-glk9/igt@kms_big_fb@x-tiled-64bpp-rotate-90.=
html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a>) +72 similar issu=
es</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8109/shard-iclb2/igt@kms_big_fb@y-tiled-8bpp-rotate-90.=
html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D110725" target=3D"_blank">fdo#110725</a> / <a href=3D"http=
s://bugs.freedesktop.org/show_bug.cgi?id=3D111614" target=3D"_blank">fdo#11=
1614</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-0:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8109/shard-tglb5/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.=
html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D111615" target=3D"_blank">fdo#111615</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8109/shard-iclb2/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.=
html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D110723" target=3D"_blank">fdo#110723</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@2x-modeset:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8109/shard-iclb6/igt@kms_big_joiner@2x-modeset.html" ta=
rget=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/2705" target=3D"_blank">i915#2705</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-pixel-format-4_tiled_dg2_rc_ccs:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8109/shard-iclb3/igt@kms_ccs@pipe-a-bad-pixel-format-4_=
tiled_dg2_rc_ccs.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.=
freedesktop.org/show_bug.cgi?id=3D109278" target=3D"_blank">fdo#109278</a>)=
 +13 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8109/shard-tglb6/igt@kms_ccs@pipe-a-ccs-on-another-bo-y=
_tiled_gen12_mc_ccs.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/3689" target=3D"_blank">i915#3689</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3886" target=
=3D"_blank">i915#3886</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8109/shard-apl7/igt@kms_ccs@pipe-a-crc-primary-rotation=
-180-y_tiled_gen12_rc_ccs_cc.html" target=3D"_blank">SKIP</a> (<a href=3D"h=
ttps://bugs.freedesktop.org/show_bug.cgi?id=3D109271" target=3D"_blank">fdo=
#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/38=
86" target=3D"_blank">i915#3886</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8109/shard-glk1/igt@kms_ccs@pipe-b-crc-sprite-planes-ba=
sic-y_tiled_gen12_mc_ccs.html" target=3D"_blank">SKIP</a> (<a href=3D"https=
://bugs.freedesktop.org/show_bug.cgi?id=3D109271" target=3D"_blank">fdo#109=
271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3886" =
target=3D"_blank">i915#3886</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8109/shard-iclb6/igt@kms_ccs@pipe-b-random-ccs-data-y_t=
iled_gen12_mc_ccs.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs=
.freedesktop.org/show_bug.cgi?id=3D109278" target=3D"_blank">fdo#109278</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3886" target=
=3D"_blank">i915#3886</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-primary-basic-4_tiled_dg2_rc_ccs_cc:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8109/shard-tglb2/igt@kms_ccs@pipe-c-crc-primary-basic-4=
_tiled_dg2_rc_ccs_cc.html" target=3D"_blank">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/6095" target=3D"_blank">i915#6095</a=
>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-rotation-90-4_tiled_dg2_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8109/shard-tglb6/igt@kms_ccs@pipe-d-bad-rotation-90-4_t=
iled_dg2_mc_ccs.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/3689" target=3D"_blank">i915#3689</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-crc-single:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8109/shard-snb5/igt@kms_chamelium@dp-crc-single.html" t=
arget=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug=
.cgi?id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D"https://bug=
s.freedesktop.org/show_bug.cgi?id=3D111827" target=3D"_blank">fdo#111827</a=
>) +5 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_chamelium@dp-edid-resolution-list} (NEW):</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8109/shard-iclb1/igt@kms_chamelium@dp-edid-resolution-li=
st.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.or=
g/show_bug.cgi?id=3D109284" target=3D"_blank">fdo#109284</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8109/shard-tglb8/igt@kms_chamelium@dp-edid-resolution-li=
st.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.or=
g/show_bug.cgi?id=3D109284" target=3D"_blank">fdo#109284</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8109/shard-glk1/igt@kms_chamelium@hdmi-hpd-for-each-pip=
e.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org=
/show_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D"ht=
tps://bugs.freedesktop.org/show_bug.cgi?id=3D111827" target=3D"_blank">fdo#=
111827</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-fast:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8109/shard-tglb1/igt@kms_chamelium@vga-hpd-fast.html" t=
arget=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug=
.cgi?id=3D109284" target=3D"_blank">fdo#109284</a> / <a href=3D"https://bug=
s.freedesktop.org/show_bug.cgi?id=3D111827" target=3D"_blank">fdo#111827</a=
>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@ctm-0-50:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8109/shard-apl6/igt@kms_color_chamelium@ctm-0-50.html" =
target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D"https://bu=
gs.freedesktop.org/show_bug.cgi?id=3D111827" target=3D"_blank">fdo#111827</=
a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@ctm-0-75:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8109/shard-iclb5/igt@kms_color_chamelium@ctm-0-75.html"=
 target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D109284" target=3D"_blank">fdo#109284</a> / <a href=3D"https://b=
ugs.freedesktop.org/show_bug.cgi?id=3D111827" target=3D"_blank">fdo#111827<=
/a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8109/shard-iclb7/igt@kms_content_protection@atomic-dpms=
.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/7118" target=3D"_blank">i915#7118</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic@pipe-a-dp-1:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8109/shard-apl7/igt@kms_content_protection@atomic@pipe-=
a-dp-1.html" target=3D"_blank">TIMEOUT</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/7173" target=3D"_blank">i915#7173</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8109/shard-iclb2/igt@kms_cursor_crc@cursor-offscreen-512=
x170.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.=
org/show_bug.cgi?id=3D109279" target=3D"_blank">fdo#109279</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/3359" target=3D"_blank">i9=
15#3359</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8109/shard-tglb6/igt@kms_cursor_crc@cursor-offscreen-512=
x170.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.=
org/show_bug.cgi?id=3D109279" target=3D"_blank">fdo#109279</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/3359" target=3D"_blank">i9=
15#3359</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x32:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8109/shard-apl1/igt@kms_cursor_crc@cursor-sliding-32x32=
.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a>) +98 similar iss=
ues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8109/shard-tglb2/igt@kms_cursor_crc@cursor-sliding-512x5=
12.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/3359" target=3D"_blank">i915#3359</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8109/shard-iclb6/igt@kms_cursor_crc@cursor-sliding-512x5=
12.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/3359" target=3D"_blank">i915#3359</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa@atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8109/shard-tglb6/igt@kms_cursor_legacy@cursorb-vs-flipa=
@atomic-transitions-varying-size.html" target=3D"_blank">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109274" target=3D"_blank=
">fdo#109274</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111825" target=3D"_blank">fdo#111825</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa@legacy:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8109/shard-iclb8/igt@kms_cursor_legacy@cursorb-vs-flipa=
@legacy.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedeskt=
op.org/show_bug.cgi?id=3D109274" target=3D"_blank">fdo#109274</a>) +17 simi=
lar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size:</p=
>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7059/shard-glk1/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transition=
s-varying-size.html" target=3D"_blank">PASS</a> -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-glk3/igt@kms_cursor_legacy@=
flip-vs-cursor@atomic-transitions-varying-size.html" target=3D"_blank">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2346" targ=
et=3D"_blank">i915#2346</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8109/shard-tglb3/igt@kms_dp_tiled_display@basic-test-pat=
tern-with-chamelium.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/3528" target=3D"_blank">i915#3528</a>=
)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8109/shard-iclb3/igt@kms_dp_tiled_display@basic-test-pat=
tern-with-chamelium.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/3528" target=3D"_blank">i915#3528</a>=
)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8109/shard-iclb7/igt@kms_dsc@dsc-with-bpc-formats.html"=
 target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/3840" target=3D"_blank">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8109/shard-apl6/igt@kms_fbcon_fbt@fbc-suspend.html" targ=
et=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/4767" target=3D"_blank">i915#4767</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8109/shard-tglb3/igt@kms_fbcon_fbt@fbc-suspend.html" tar=
get=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/2411" target=3D"_blank">i915#2411</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/4767" target=3D"_blank">i915#4767</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8109/shard-glk2/igt@kms_fbcon_fbt@fbc-suspend.html" targ=
et=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/4767" target=3D"_blank">i915#4767</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8109/shard-iclb3/igt@kms_fbcon_fbt@fbc-suspend.html" tar=
get=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/4767" target=3D"_blank">i915#4767</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2:=
</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7059/shard-glk9/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@a=
b-hdmi-a1-hdmi-a2.html" target=3D"_blank">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-glk7/igt@kms_flip@2x-fli=
p-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2.html" target=3D"_blank=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/79" =
target=3D"_blank">i915#79</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb-interruptible:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8109/shard-tglb3/igt@kms_flip@2x-nonexisting-fb-interru=
ptible.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedeskto=
p.org/show_bug.cgi?id=3D109274" target=3D"_blank">fdo#109274</a> / <a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111825" target=3D"_blank=
">fdo#111825</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/3637" target=3D"_blank">i915#3637</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7059/shard-apl8/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp=
1.html" target=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_8109/shard-apl8/igt@kms_flip@flip-vs-expired-vblank=
-interruptible@b-dp1.html" target=3D"_blank">FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/79" target=3D"_blank">i915#79</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing@pipe-a-valid-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8109/shard-iclb7/igt@kms_flip_scaled_crc@flip-32bpp-4ti=
le-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html" target=3D"_bl=
ank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2=
587" target=3D"_blank">i915#2587</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/2672" target=3D"_blank">i915#2672</a>) +1 similar is=
sue</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling=
@pipe-a-default-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8109/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-yft=
ile-to-32bpp-yftileccs-downscaling@pipe-a-default-mode.html" target=3D"_bla=
nk">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/63=
75" target=3D"_blank">i915#6375</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8109/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-4ti=
le-to-32bpp-4tile-downscaling@pipe-a-default-mode.html" target=3D"_blank">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2672" t=
arget=3D"_blank">i915#2672</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling=
@pipe-a-default-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8109/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-yti=
le-to-32bpp-ytilercccs-downscaling@pipe-a-default-mode.html" target=3D"_bla=
nk">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/26=
72" target=3D"_blank">i915#2672</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/3555" target=3D"_blank">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-gtt:=
</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8109/shard-iclb7/igt@kms_frontbuffer_tracking@fbcpsr-2p=
-scndscrn-spr-indfb-draw-mmap-gtt.html" target=3D"_blank">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109280" target=3D"_blank=
">fdo#109280</a>) +14 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render:</=
p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8109/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-2p=
-scndscrn-spr-indfb-draw-render.html" target=3D"_blank">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109280" target=3D"_blank=
">fdo#109280</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111825" target=3D"_blank">fdo#111825</a>) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-gtt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8109/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-rg=
b101010-draw-mmap-gtt.html" target=3D"_blank">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/6497" target=3D"_blank">i915#6497</=
a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-dp-1:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8109/shard-apl1/igt@kms_plane_alpha_blend@alpha-opaque-=
fb@pipe-a-dp-1.html" target=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/4573" target=3D"_blank">i915#4573</a>) +2 =
similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-4:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8109/shard-iclb5/igt@kms_plane_multiple@tiling-4.html" =
target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/3555" target=3D"_blank">i915#3555</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b-e=
dp-1:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7059/shard-iclb6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-=
factor-0-5@pipe-b-edp-1.html" target=3D"_blank">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb2/igt@kms_plan=
e_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b-edp-1.html" targ=
et=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/5235" target=3D"_blank">i915#5235</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_prime@d3hot:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8109/shard-iclb3/igt@kms_prime@d3hot.html" target=3D"_b=
lank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
6524" target=3D"_blank">i915#6524</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8109/shard-tglb8/igt@kms_psr2_sf@cursor-plane-move-conti=
nuous-exceed-sf.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/2920" target=3D"_blank">i915#2920</a>)</p=
>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8109/shard-glk5/igt@kms_psr2_sf@cursor-plane-move-contin=
uous-exceed-sf.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.fr=
eedesktop.org/show_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/658" target=3D"_=
blank">i915#658</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8109/shard-iclb5/igt@kms_psr2_sf@cursor-plane-move-conti=
nuous-exceed-sf.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/658" target=3D"_blank">i915#658</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8109/shard-apl1/igt@kms_psr2_su@page_flip-p010.html" ta=
rget=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/658" target=3D"_blank">i915#658</a>) +1=
 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8109/shard-iclb6/igt@kms_psr2_su@page_flip-xrgb8888.htm=
l" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show=
_bug.cgi?id=3D109642" target=3D"_blank">fdo#109642</a> / <a href=3D"https:/=
/bugs.freedesktop.org/show_bug.cgi?id=3D111068" target=3D"_blank">fdo#11106=
8</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/658" tar=
get=3D"_blank">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_plane_onoff:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8109/shard-tglb2/igt@kms_psr@psr2_cursor_plane_onoff.ht=
ml" target=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/132" target=3D"_blank">i915#132</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/3467" target=3D"_blank">i915#3467</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_blt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8109/shard-iclb6/igt@kms_psr@psr2_sprite_blt.html" targ=
et=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109441" target=3D"_blank">fdo#109441</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_mmap_gtt:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7059/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html" target=3D"_bla=
nk">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_8109/shard-iclb7/igt@kms_psr@psr2_sprite_mmap_gtt.html" target=3D"_blank"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441=
" target=3D"_blank">fdo#109441</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7059/shard-tglb6/igt@kms_psr_stress_test@invalidate-primary-flip-overl=
ay.html" target=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_8109/shard-tglb8/igt@kms_psr_stress_test@invalidat=
e-primary-flip-overlay.html" target=3D"_blank">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/intel/issues/5519" target=3D"_blank">i915#5519<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8109/shard-iclb2/igt@kms_rotation_crc@primary-4-tiled-r=
eflect-x-0.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/intel/issues/5289" target=3D"_blank">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8109/shard-snb4/igt@kms_tv_load_detect@load-detect.html=
" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_=
bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a>) +138 similar issues<=
/li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8109/shard-iclb3/igt@kms_writeback@writeback-check-outp=
ut.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/2437" target=3D"_blank">i915#2437</a>)</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@recycle-many:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8109/shard-apl8/igt@sysfs_clients@recycle-many.html" ta=
rget=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/2994" target=3D"_blank">i915#2994</a>) =
+1 similar issue</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@sema-10:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8109/shard-glk2/igt@sysfs_clients@sema-10.html" target=
=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/intel/issues/2994" target=3D"_blank">i915#2994</a>) +2 s=
imilar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8109/shard-iclb3/igt@sysfs_clients@sema-10.html" target=
=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2994" target=3D"_blank">i915#2994</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8109/shard-tglb3/igt@sysfs_clients@sema-10.html" target=
=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2994" target=3D"_blank">i915#2994</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7059/shard-rkl-1/igt@fbdev@read.html" target=3D"_blank">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/2582" target=3D"_bla=
nk">i915#2582</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_8109/shard-rkl-6/igt@fbdev@read.html" target=3D"_blank">PASS</a></l=
i>
</ul>
</li>
<li>
<p>igt@gem_ctx_exec@basic-nohangcheck:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7059/shard-tglb2/igt@gem_ctx_exec@basic-nohangcheck.html" target=3D"_b=
lank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
6268" target=3D"_blank">i915#6268</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_8109/shard-tglb1/igt@gem_ctx_exec@basic-nohangc=
heck.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@many-contexts:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7059/shard-rkl-6/igt@gem_ctx_persistence@many-contexts.html" target=3D=
"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/2410" target=3D"_blank">i915#2410</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_8109/shard-rkl-5/igt@gem_ctx_persistence@man=
y-contexts.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-suspend:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7059/shard-rkl-3/igt@gem_eio@in-flight-suspend.html" target=3D"_blank"=
>FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D103375=
" target=3D"_blank">fdo#103375</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_8109/shard-rkl-2/igt@gem_eio@in-flight-suspend.htm=
l" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-submit-fence:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7059/shard-iclb3/igt@gem_exec_balancer@parallel-keep-submit-fence.html=
" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/4525" target=3D"_blank">i915#4525</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb1/igt@gem_exec_bal=
ancer@parallel-keep-submit-fence.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7059/shard-iclb8/igt@gem_exec_fair@basic-none-share@rcs0.html" target=
=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2842" target=3D"_blank">i915#2842</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb1/igt@gem_exec_fair@basic-=
none-share@rcs0.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7059/shard-tglb2/igt@gem_exec_fair@basic-pace-share@rcs0.html" target=
=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2842" target=3D"_blank">i915#2842</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-tglb8/igt@gem_exec_fair@basic-=
pace-share@rcs0.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7059/shard-glk6/igt@gem_exec_fair@basic-pace@vcs0.html" target=3D"_bla=
nk">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/28=
42" target=3D"_blank">i915#2842</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_8109/shard-glk3/igt@gem_exec_fair@basic-pace@vcs0=
.html" target=3D"_blank">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-gtt-noreloc:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7059/shard-rkl-4/igt@gem_exec_reloc@basic-write-gtt-noreloc.html" targ=
et=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/3281" target=3D"_blank">i915#3281</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-rkl-5/igt@gem_exec_reloc@bas=
ic-write-gtt-noreloc.html" target=3D"_blank">PASS</a> +5 similar issues</li=
>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@semaphore-power:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7059/shard-rkl-1/igt@gem_exec_schedule@semaphore-power.html" target=3D=
"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/7276" target=3D"_blank">i915#7276</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_8109/shard-rkl-5/igt@gem_exec_schedule@semap=
hore-power.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@coherency:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7059/shard-rkl-3/igt@gem_mmap_gtt@coherency.html" target=3D"_blank">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111656" t=
arget=3D"_blank">fdo#111656</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_8109/shard-rkl-5/igt@gem_mmap_gtt@coherency.html" tar=
get=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads-uncached:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7059/shard-rkl-4/igt@gem_partial_pwrite_pread@writes-after-reads-uncac=
hed.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/3282" target=3D"_blank">i915#3282</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-rkl-5/igt@gem=
_partial_pwrite_pread@writes-after-reads-uncached.html" target=3D"_blank">P=
ASS</a> +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-single-offset:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7059/shard-tglb8/igt@gem_softpin@evict-single-offset.html" target=3D"_=
blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/4171" target=3D"_blank">i915#4171</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_8109/shard-tglb7/igt@gem_softpin@evict-single-=
offset.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-context:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7059/shard-apl6/igt@gem_workarounds@suspend-resume-context.html" targe=
t=3D"_blank">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/180" target=3D"_blank">i915#180</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/intel/issues/1982" target=3D"_blank">i915#1982</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-a=
pl7/igt@gem_workarounds@suspend-resume-context.html" target=3D"_blank">PASS=
</a></li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@secure-batches:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7059/shard-rkl-1/igt@gen9_exec_parse@secure-batches.html" target=3D"_b=
lank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
2527" target=3D"_blank">i915#2527</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_8109/shard-rkl-5/igt@gen9_exec_parse@secure-bat=
ches.html" target=3D"_blank">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7059/shard-rkl-5/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html" tar=
get=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/4098" target=3D"_blank">i915#4098</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-rkl-6/igt@i915_pipe_stress@=
stress-xrgb8888-ytiled.html" target=3D"_blank">PASS</a> +1 similar issue</l=
i>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7059/shard-iclb3/igt@i915_pm_dc@dc6-psr.html" target=3D"_blank">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3989" target=
=3D"_blank">i915#3989</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/454" target=3D"_blank">i915#454</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb5/igt@i915_pm_dc@dc6-p=
sr.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_sseu@full-enable:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7059/shard-rkl-3/igt@i915_pm_sseu@full-enable.html" target=3D"_blank">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4387" =
target=3D"_blank">i915#4387</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_8109/shard-rkl-5/igt@i915_pm_sseu@full-enable.html" t=
arget=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7059/shard-apl1/igt@i915_selftest@live@gt_heartbeat.html" target=3D"_b=
lank">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/5334" target=3D"_blank">i915#5334</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-apl6/igt@i915_selftest@live@gt=
_heartbeat.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@perf@engine_cs:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7059/shard-snb7/igt@i915_selftest@perf@engine_cs.html" target=3D"_blan=
k">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1092=
71" target=3D"_blank">fdo#109271</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_8109/shard-snb6/igt@i915_selftest@perf@engine_cs=
.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7059/shard-rkl-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180=
-async-flip.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/1845" target=3D"_blank">i915#1845</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/4098" target=3D"_blan=
k">i915#4098</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_8109/shard-rkl-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-1=
80-async-flip.html" target=3D"_blank">PASS</a> +13 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7059/shard-apl8/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp=
1.html" target=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/79" target=3D"_blank">i915#79</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-apl8/igt@kms_flip@fl=
ip-vs-expired-vblank-interruptible@a-dp1.html" target=3D"_blank">PASS</a></=
li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@b-edp1:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7059/shard-tglb7/igt@kms_flip@flip-vs-suspend-interruptible@b-edp1.htm=
l" target=3D"_blank">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/2411" target=3D"_blank">i915#2411</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/2867" target=3D"_blank">i915#2=
867</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_81=
09/shard-tglb1/igt@kms_flip@flip-vs-suspend-interruptible@b-edp1.html" targ=
et=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7059/shard-rkl-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indf=
b-draw-blt.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/intel/issues/1849" target=3D"_blank">i915#1849</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/4098" target=3D"_blank=
">i915#4098</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_8109/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-ind=
fb-draw-blt.html" target=3D"_blank">PASS</a> +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping@pipe-b-planes:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7059/shard-rkl-3/igt@kms_plane@pixel-format-source-clamping@pipe-b-pla=
nes.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/3558" target=3D"_blank">i915#3558</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-rkl-6/igt@kms=
_plane@pixel-format-source-clamping@pipe-b-planes.html" target=3D"_blank">P=
ASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pi=
pe-a-edp-1:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7059/shard-iclb2/igt@kms_plane_scaling@planes-upscale-factor-0-25-down=
scale-factor-0-5@pipe-a-edp-1.html" target=3D"_blank">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/5235" target=3D"_blank">i91=
5#5235</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_8109/shard-iclb1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscal=
e-factor-0-5@pipe-a-edp-1.html" target=3D"_blank">PASS</a> +2 similar issue=
s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@crtc-properties-atomic:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7059/shard-rkl-4/igt@kms_properties@crtc-properties-atomic.html" targe=
t=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/1849" target=3D"_blank">i915#1849</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-rkl-6/igt@kms_properties@crtc=
-properties-atomic.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_gtt:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7059/shard-iclb6/igt@kms_psr@psr2_primary_mmap_gtt.html" target=3D"_bl=
ank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9441" target=3D"_blank">fdo#109441</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb2/igt@kms_psr@psr2_primary_mmap=
_gtt.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@sprite_blt:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7059/shard-rkl-4/igt@kms_psr@sprite_blt.html" target=3D"_blank">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1072" target=
=3D"_blank">i915#1072</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_8109/shard-rkl-6/igt@kms_psr@sprite_blt.html" target=3D"_bl=
ank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7059/shard-iclb6/igt@kms_psr_stress_test@flip-primary-invalidate-overl=
ay.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/5519" target=3D"_blank">i915#5519</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb1/igt@kms=
_psr_stress_test@flip-primary-invalidate-overlay.html" target=3D"_blank">PA=
SS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-ts-continuation-suspend:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7059/shard-apl1/igt@kms_vblank@pipe-a-ts-continuation-suspend.html" ta=
rget=3D"_blank">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/180" target=3D"_blank">i915#180</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-apl1/igt@kms_vblank@pi=
pe-a-ts-continuation-suspend.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@sysfs_heartbeat_interval@precise@rcs0:</p>
<ul>
<li>{shard-dg1}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7059/shard-dg1-15/igt@sysfs_heartbeat_interval@precise@rcs0.html" targ=
et=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/1755" target=3D"_blank">i915#1755</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-dg1-15/igt@sysfs_heartbeat_i=
nterval@precise@rcs0.html" target=3D"_blank">PASS</a> +4 similar issues</li=
>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7059/shard-apl3/igt@gem_pread@exhaustion.html" target=3D"_blank">INCOM=
PLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/7248"=
 target=3D"_blank">i915#7248</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_8109/shard-apl6/igt@gem_pread@exhaustion.html" targe=
t=3D"_blank">WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/2658" target=3D"_blank">i915#2658</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@rcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7059/shard-iclb8/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html" target=
=3D"_blank">WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2684" target=3D"_blank">i915#2684</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb1/igt@i915_pm_rc6_residenc=
y@rc6-idle@rcs0.html" target=3D"_blank">FAIL</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/2684" target=3D"_blank">i915#2684</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@vecs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7059/shard-iclb8/igt@i915_pm_rc6_residency@rc6-idle@vecs0.html" target=
=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2684" target=3D"_blank">i915#2684</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb1/igt@i915_pm_rc6_residenc=
y@rc6-idle@vecs0.html" target=3D"_blank">WARN</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/intel/issues/2684" target=3D"_blank">i915#2684</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei_interface:</p>
<ul>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_7059/shard-tglb1/igt@kms_content_protection@mei_interface.html" target=
=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/7118" target=3D"_blank">i915#7118</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-tglb8/igt@kms_content_protecti=
on@mei_interface.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.=
freedesktop.org/show_bug.cgi?id=3D109300" target=3D"_blank">fdo#109300</a>)=
</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_7059/shard-iclb1/igt@kms_content_protection@mei_interface.html" target=
=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/7118" target=3D"_blank">i915#7118</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb1/igt@kms_content_protecti=
on@mei_interface.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.=
freedesktop.org/show_bug.cgi?id=3D109300" target=3D"_blank">fdo#109300</a>)=
</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-basic@pipe-c-dp-1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7059/shard-apl7/igt@kms_plane_alpha_blend@alpha-basic@pipe-c-dp-1.html=
" target=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/4573" target=3D"_blank">i915#4573</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-apl2/igt@kms_plane_alp=
ha_blend@alpha-basic@pipe-c-dp-1.html" target=3D"_blank">DMESG-FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/6" target=
=3D"_blank">IGT#6</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7059/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.ht=
ml" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/2920" target=3D"_blank">i915#2920</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb7/igt@kms_psr2_s=
f@overlay-plane-update-continuous-sf.html" target=3D"_blank">SKIP</a> (<a h=
ref=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111068" target=3D"_bl=
ank">fdo#111068</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/658" target=3D"_blank">i915#658</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br>
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7059 -&gt; IGTPW_8109</li>
</ul>
<p>CI-20190529: 20190529<br>
  CI_DRM_12382: cb74864693414b221b3601572e75449558126e8b @ git://<a href=3D=
"http://anongit.freedesktop.org/gfx-ci/linux" target=3D"_blank">anongit.fre=
edesktop.org/gfx-ci/linux</a><br>
  IGTPW_8109: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_810=
9/index.html" target=3D"_blank">https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_8109/index.html</a><br>
  IGT_7059: 89c5c56dfde602d54eefa301e9887eff8bcda0e8 @ <a href=3D"https://g=
itlab.freedesktop.org/drm/igt-gpu-tools.git" target=3D"_blank">https://gitl=
ab.freedesktop.org/drm/igt-gpu-tools.git</a></p>

</div>

</div></blockquote></div></div><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">On Tue, Nov 15, 2022 at 10:21 PM Patchwork &lt;<a =
href=3D"mailto:patchwork@emeril.freedesktop.org">patchwork@emeril.freedeskt=
op.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex"><div class=3D"msg4499438268541239734">
<u></u>

=20
 =20
 =20
 =20

<div>


<b>Patch Details</b>
<table>
<tbody><tr><td><b>Series:</b></td><td>Chamelium: Add new EDID Resolution Li=
st test (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/110614/" target=3D"_blank">https://patchwork.freedesktop.org/series/11=
0614/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8109/index.html" target=3D"_blank">https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_8109/index.html</a></td></tr>

</tbody></table>


    <h1>CI Bug Log - changes from IGT_7059_full -&gt; IGTPW_8109_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_8109_full absolutely need to b=
e<br>
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
>
  introduced in IGTPW_8109_full, please notify your bug team to allow them<=
br>
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
8109/index.html" target=3D"_blank">https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_8109/index.html</a></p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_8109=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@i915_pm_dc@dc5-psr:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7059/shard-tglb2/igt@i915_pm_dc@dc5-psr.html" target=3D"_blank">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/sha=
rd-tglb5/igt@i915_pm_dc@dc5-psr.html" target=3D"_blank">FAIL</a></li>
</ul>
</li>
<li>
<p>{igt@kms_chamelium@dp-edid-resolution-list} (NEW):</p>
<ul>
<li>{shard-rkl}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8109/shard-rkl-2/igt@kms_chamelium@dp-edid-resolution-l=
ist.html" target=3D"_blank">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7059/shard-iclb3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indf=
b-draw-blt.html" target=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb8/igt@kms_frontbuffer_track=
ing@psr-1p-primscrn-cur-indfb-draw-blt.html" target=3D"_blank">FAIL</a></li=
>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br>
  They do not affect the overall result.</p>
<ul>
<li>igt@fbdev@read:<ul>
<li>{shard-dg1}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7059/shard-dg1-18/igt@fbdev@read.html" target=3D"_blank">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-dg1-=
19/igt@fbdev@read.html" target=3D"_blank">FAIL</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_7059_full and IGTPW_8109_full=
:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@kms_chamelium@dp-edid-resolution-list:<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8109_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@feature_discovery@display-2x:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8109/shard-iclb2/igt@feature_discovery@display-2x.html"=
 target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/1839" target=3D"_blank">i915#1839</a>)</li>
</ul>
</li>
<li>
<p>igt@feature_discovery@psr2:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7059/shard-iclb2/igt@feature_discovery@psr2.html" target=3D"_blank">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109=
/shard-iclb6/igt@feature_discovery@psr2.html" target=3D"_blank">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/658" target=3D"_b=
lank">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-sanity-check:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8109/shard-tglb7/igt@gem_create@create-ext-cpu-access-sa=
nity-check.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/intel/issues/6335" target=3D"_blank">i915#6335</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8109/shard-iclb6/igt@gem_create@create-ext-cpu-access-sa=
nity-check.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/intel/issues/6335" target=3D"_blank">i915#6335</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-mixed-process:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8109/shard-snb2/igt@gem_ctx_persistence@legacy-engines-=
mixed-process.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.fre=
edesktop.org/show_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1099" target=3D"_=
blank">i915#1099</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8109/shard-snb5/igt@gem_eio@unwedge-stress.html" target=
=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/3354" target=3D"_blank">i915#3354</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-bb-first:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7059/shard-iclb1/igt@gem_exec_balancer@parallel-bb-first.html" target=
=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_8109/shard-iclb3/igt@gem_exec_balancer@parallel-bb-first.html" ta=
rget=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/4525" target=3D"_blank">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8109/shard-iclb1/igt@gem_exec_fair@basic-none@vcs1.html=
" target=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/2842" target=3D"_blank">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vecs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7059/shard-glk1/igt@gem_exec_fair@basic-none@vecs0.html" target=3D"_bl=
ank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_8109/shard-glk2/igt@gem_exec_fair@basic-none@vecs0.html" target=3D"_blan=
k">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/284=
2" target=3D"_blank">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8109/shard-apl1/igt@gem_huc_copy@huc-copy.html" target=
=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/intel/issues/2190" target=3D"_blank">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8109/shard-iclb1/igt@gem_lmem_swapping@basic.html" targ=
et=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/4613" target=3D"_blank">i915#4613</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-multi:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8109/shard-apl1/igt@gem_lmem_swapping@heavy-multi.html"=
 target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/4613" target=3D"_blank">i915#4613</a=
>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi-ccs:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8109/shard-tglb5/igt@gem_lmem_swapping@heavy-verify-mult=
i-ccs.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/4613" target=3D"_blank">i915#4613</a>) +2 similar i=
ssues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8109/shard-glk1/igt@gem_lmem_swapping@heavy-verify-multi=
-ccs.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.=
org/show_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/4613" target=3D"_blank">i9=
15#4613</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@linear-to-vebox-yf-tiled:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8109/shard-iclb8/igt@gem_render_copy@linear-to-vebox-yf=
-tiled.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/768" target=3D"_blank">i915#768</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-single-offset:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7059/shard-iclb6/igt@gem_softpin@evict-single-offset.html" target=3D"_=
blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_8109/shard-iclb6/igt@gem_softpin@evict-single-offset.html" target=3D"_=
blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/4171" target=3D"_blank">i915#4171</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop-interruptible:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8109/shard-tglb8/igt@gem_softpin@evict-snoop-interruptib=
le.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.or=
g/show_bug.cgi?id=3D109312" target=3D"_blank">fdo#109312</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8109/shard-iclb5/igt@gem_softpin@evict-snoop-interruptib=
le.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.or=
g/show_bug.cgi?id=3D109312" target=3D"_blank">fdo#109312</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@access-control:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8109/shard-iclb6/igt@gem_userptr_blits@access-control.h=
tml" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/3297" target=3D"_blank">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-sync:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8109/shard-iclb3/igt@gem_userptr_blits@coherency-sync.ht=
ml" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D109290" target=3D"_blank">fdo#109290</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8109/shard-tglb3/igt@gem_userptr_blits@coherency-sync.ht=
ml" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D110542" target=3D"_blank">fdo#110542</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-allowed:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8109/shard-tglb1/igt@gen7_exec_parse@basic-allowed.html"=
 target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D109289" target=3D"_blank">fdo#109289</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8109/shard-iclb8/igt@gen7_exec_parse@basic-allowed.html"=
 target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D109289" target=3D"_blank">fdo#109289</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7059/shard-apl3/igt@gen9_exec_parse@allowed-single.html" target=3D"_bl=
ank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_8109/shard-apl3/igt@gen9_exec_parse@allowed-single.html" target=3D"_blan=
k">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/5566" target=3D"_blank">i915#5566</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/716" target=3D"_blank">i915#716</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@resize-bar:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8109/shard-iclb7/igt@i915_module_load@resize-bar.html" =
target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/6412" target=3D"_blank">i915#6412</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_mult@media-freq@gt0:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8109/shard-iclb6/igt@i915_pm_freq_mult@media-freq@gt0.ht=
ml" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/6590" target=3D"_blank">i915#6590</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8109/shard-tglb2/igt@i915_pm_freq_mult@media-freq@gt0.ht=
ml" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/6590" target=3D"_blank">i915#6590</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7059/shard-tglb1/igt@i915_selftest@live@hangcheck.html" target=3D"_bla=
nk">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_8109/shard-tglb3/igt@i915_selftest@live@hangcheck.html" target=3D"_blank"=
>DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/5591" target=3D"_blank">i915#5591</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-tiled2untiled:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7059/shard-apl3/igt@i915_suspend@fence-restore-tiled2untiled.html" tar=
get=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_8109/shard-apl6/igt@i915_suspend@fence-restore-tiled2untiled.h=
tml" target=3D"_blank">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/180" target=3D"_blank">i915#180</a>) +1 similar issu=
e</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8109/shard-tglb6/igt@kms_addfb_basic@invalid-smem-bo-on-=
discrete.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/3826" target=3D"_blank">i915#3826</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8109/shard-iclb2/igt@kms_addfb_basic@invalid-smem-bo-on-=
discrete.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/3826" target=3D"_blank">i915#3826</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@atomic_plane_damage:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8109/shard-iclb3/igt@kms_atomic@atomic_plane_damage.htm=
l" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/4765" target=3D"_blank">i915#4765</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8109/shard-tglb5/igt@kms_big_fb@4-tiled-64bpp-rotate-27=
0.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/5286" target=3D"_blank">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8109/shard-iclb2/igt@kms_big_fb@4-tiled-max-hw-stride-3=
2bpp-rotate-180-async-flip.html" target=3D"_blank">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/5286" target=3D"_blank">i915#5=
286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8109/shard-tglb2/igt@kms_big_fb@linear-32bpp-rotate-270=
.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D111614" target=3D"_blank">fdo#111614</a>) +2 similar issu=
es</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8109/shard-glk9/igt@kms_big_fb@x-tiled-64bpp-rotate-90.=
html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a>) +72 similar issu=
es</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8109/shard-iclb2/igt@kms_big_fb@y-tiled-8bpp-rotate-90.=
html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D110725" target=3D"_blank">fdo#110725</a> / <a href=3D"http=
s://bugs.freedesktop.org/show_bug.cgi?id=3D111614" target=3D"_blank">fdo#11=
1614</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-0:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8109/shard-tglb5/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.=
html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D111615" target=3D"_blank">fdo#111615</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8109/shard-iclb2/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.=
html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D110723" target=3D"_blank">fdo#110723</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@2x-modeset:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8109/shard-iclb6/igt@kms_big_joiner@2x-modeset.html" ta=
rget=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/2705" target=3D"_blank">i915#2705</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-pixel-format-4_tiled_dg2_rc_ccs:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8109/shard-iclb3/igt@kms_ccs@pipe-a-bad-pixel-format-4_=
tiled_dg2_rc_ccs.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.=
freedesktop.org/show_bug.cgi?id=3D109278" target=3D"_blank">fdo#109278</a>)=
 +13 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8109/shard-tglb6/igt@kms_ccs@pipe-a-ccs-on-another-bo-y=
_tiled_gen12_mc_ccs.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/3689" target=3D"_blank">i915#3689</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3886" target=
=3D"_blank">i915#3886</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8109/shard-apl7/igt@kms_ccs@pipe-a-crc-primary-rotation=
-180-y_tiled_gen12_rc_ccs_cc.html" target=3D"_blank">SKIP</a> (<a href=3D"h=
ttps://bugs.freedesktop.org/show_bug.cgi?id=3D109271" target=3D"_blank">fdo=
#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/38=
86" target=3D"_blank">i915#3886</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8109/shard-glk1/igt@kms_ccs@pipe-b-crc-sprite-planes-ba=
sic-y_tiled_gen12_mc_ccs.html" target=3D"_blank">SKIP</a> (<a href=3D"https=
://bugs.freedesktop.org/show_bug.cgi?id=3D109271" target=3D"_blank">fdo#109=
271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3886" =
target=3D"_blank">i915#3886</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8109/shard-iclb6/igt@kms_ccs@pipe-b-random-ccs-data-y_t=
iled_gen12_mc_ccs.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs=
.freedesktop.org/show_bug.cgi?id=3D109278" target=3D"_blank">fdo#109278</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3886" target=
=3D"_blank">i915#3886</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-primary-basic-4_tiled_dg2_rc_ccs_cc:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8109/shard-tglb2/igt@kms_ccs@pipe-c-crc-primary-basic-4=
_tiled_dg2_rc_ccs_cc.html" target=3D"_blank">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/6095" target=3D"_blank">i915#6095</a=
>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-rotation-90-4_tiled_dg2_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8109/shard-tglb6/igt@kms_ccs@pipe-d-bad-rotation-90-4_t=
iled_dg2_mc_ccs.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/3689" target=3D"_blank">i915#3689</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-crc-single:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8109/shard-snb5/igt@kms_chamelium@dp-crc-single.html" t=
arget=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug=
.cgi?id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D"https://bug=
s.freedesktop.org/show_bug.cgi?id=3D111827" target=3D"_blank">fdo#111827</a=
>) +5 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_chamelium@dp-edid-resolution-list} (NEW):</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8109/shard-iclb1/igt@kms_chamelium@dp-edid-resolution-li=
st.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.or=
g/show_bug.cgi?id=3D109284" target=3D"_blank">fdo#109284</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8109/shard-tglb8/igt@kms_chamelium@dp-edid-resolution-li=
st.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.or=
g/show_bug.cgi?id=3D109284" target=3D"_blank">fdo#109284</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8109/shard-glk1/igt@kms_chamelium@hdmi-hpd-for-each-pip=
e.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org=
/show_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D"ht=
tps://bugs.freedesktop.org/show_bug.cgi?id=3D111827" target=3D"_blank">fdo#=
111827</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-fast:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8109/shard-tglb1/igt@kms_chamelium@vga-hpd-fast.html" t=
arget=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug=
.cgi?id=3D109284" target=3D"_blank">fdo#109284</a> / <a href=3D"https://bug=
s.freedesktop.org/show_bug.cgi?id=3D111827" target=3D"_blank">fdo#111827</a=
>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@ctm-0-50:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8109/shard-apl6/igt@kms_color_chamelium@ctm-0-50.html" =
target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D"https://bu=
gs.freedesktop.org/show_bug.cgi?id=3D111827" target=3D"_blank">fdo#111827</=
a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@ctm-0-75:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8109/shard-iclb5/igt@kms_color_chamelium@ctm-0-75.html"=
 target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D109284" target=3D"_blank">fdo#109284</a> / <a href=3D"https://b=
ugs.freedesktop.org/show_bug.cgi?id=3D111827" target=3D"_blank">fdo#111827<=
/a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8109/shard-iclb7/igt@kms_content_protection@atomic-dpms=
.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/7118" target=3D"_blank">i915#7118</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic@pipe-a-dp-1:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8109/shard-apl7/igt@kms_content_protection@atomic@pipe-=
a-dp-1.html" target=3D"_blank">TIMEOUT</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/7173" target=3D"_blank">i915#7173</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8109/shard-iclb2/igt@kms_cursor_crc@cursor-offscreen-512=
x170.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.=
org/show_bug.cgi?id=3D109279" target=3D"_blank">fdo#109279</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/3359" target=3D"_blank">i9=
15#3359</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8109/shard-tglb6/igt@kms_cursor_crc@cursor-offscreen-512=
x170.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.=
org/show_bug.cgi?id=3D109279" target=3D"_blank">fdo#109279</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/3359" target=3D"_blank">i9=
15#3359</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x32:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8109/shard-apl1/igt@kms_cursor_crc@cursor-sliding-32x32=
.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a>) +98 similar iss=
ues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8109/shard-tglb2/igt@kms_cursor_crc@cursor-sliding-512x5=
12.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/3359" target=3D"_blank">i915#3359</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8109/shard-iclb6/igt@kms_cursor_crc@cursor-sliding-512x5=
12.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/3359" target=3D"_blank">i915#3359</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa@atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8109/shard-tglb6/igt@kms_cursor_legacy@cursorb-vs-flipa=
@atomic-transitions-varying-size.html" target=3D"_blank">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109274" target=3D"_blank=
">fdo#109274</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111825" target=3D"_blank">fdo#111825</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa@legacy:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8109/shard-iclb8/igt@kms_cursor_legacy@cursorb-vs-flipa=
@legacy.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedeskt=
op.org/show_bug.cgi?id=3D109274" target=3D"_blank">fdo#109274</a>) +17 simi=
lar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size:</p=
>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7059/shard-glk1/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transition=
s-varying-size.html" target=3D"_blank">PASS</a> -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-glk3/igt@kms_cursor_legacy@=
flip-vs-cursor@atomic-transitions-varying-size.html" target=3D"_blank">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2346" targ=
et=3D"_blank">i915#2346</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8109/shard-tglb3/igt@kms_dp_tiled_display@basic-test-pat=
tern-with-chamelium.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/3528" target=3D"_blank">i915#3528</a>=
)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8109/shard-iclb3/igt@kms_dp_tiled_display@basic-test-pat=
tern-with-chamelium.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/3528" target=3D"_blank">i915#3528</a>=
)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8109/shard-iclb7/igt@kms_dsc@dsc-with-bpc-formats.html"=
 target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/3840" target=3D"_blank">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8109/shard-apl6/igt@kms_fbcon_fbt@fbc-suspend.html" targ=
et=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/4767" target=3D"_blank">i915#4767</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8109/shard-tglb3/igt@kms_fbcon_fbt@fbc-suspend.html" tar=
get=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/2411" target=3D"_blank">i915#2411</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/4767" target=3D"_blank">i915#4767</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8109/shard-glk2/igt@kms_fbcon_fbt@fbc-suspend.html" targ=
et=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/4767" target=3D"_blank">i915#4767</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8109/shard-iclb3/igt@kms_fbcon_fbt@fbc-suspend.html" tar=
get=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/4767" target=3D"_blank">i915#4767</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2:=
</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7059/shard-glk9/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@a=
b-hdmi-a1-hdmi-a2.html" target=3D"_blank">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-glk7/igt@kms_flip@2x-fli=
p-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2.html" target=3D"_blank=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/79" =
target=3D"_blank">i915#79</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb-interruptible:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8109/shard-tglb3/igt@kms_flip@2x-nonexisting-fb-interru=
ptible.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedeskto=
p.org/show_bug.cgi?id=3D109274" target=3D"_blank">fdo#109274</a> / <a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111825" target=3D"_blank=
">fdo#111825</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/3637" target=3D"_blank">i915#3637</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7059/shard-apl8/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp=
1.html" target=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_8109/shard-apl8/igt@kms_flip@flip-vs-expired-vblank=
-interruptible@b-dp1.html" target=3D"_blank">FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/79" target=3D"_blank">i915#79</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing@pipe-a-valid-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8109/shard-iclb7/igt@kms_flip_scaled_crc@flip-32bpp-4ti=
le-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html" target=3D"_bl=
ank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2=
587" target=3D"_blank">i915#2587</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/2672" target=3D"_blank">i915#2672</a>) +1 similar is=
sue</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling=
@pipe-a-default-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8109/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-yft=
ile-to-32bpp-yftileccs-downscaling@pipe-a-default-mode.html" target=3D"_bla=
nk">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/63=
75" target=3D"_blank">i915#6375</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8109/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-4ti=
le-to-32bpp-4tile-downscaling@pipe-a-default-mode.html" target=3D"_blank">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2672" t=
arget=3D"_blank">i915#2672</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling=
@pipe-a-default-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8109/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-yti=
le-to-32bpp-ytilercccs-downscaling@pipe-a-default-mode.html" target=3D"_bla=
nk">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/26=
72" target=3D"_blank">i915#2672</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/3555" target=3D"_blank">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-gtt:=
</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8109/shard-iclb7/igt@kms_frontbuffer_tracking@fbcpsr-2p=
-scndscrn-spr-indfb-draw-mmap-gtt.html" target=3D"_blank">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109280" target=3D"_blank=
">fdo#109280</a>) +14 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render:</=
p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8109/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-2p=
-scndscrn-spr-indfb-draw-render.html" target=3D"_blank">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109280" target=3D"_blank=
">fdo#109280</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111825" target=3D"_blank">fdo#111825</a>) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-gtt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8109/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-rg=
b101010-draw-mmap-gtt.html" target=3D"_blank">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/6497" target=3D"_blank">i915#6497</=
a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-dp-1:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8109/shard-apl1/igt@kms_plane_alpha_blend@alpha-opaque-=
fb@pipe-a-dp-1.html" target=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/4573" target=3D"_blank">i915#4573</a>) +2 =
similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-4:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8109/shard-iclb5/igt@kms_plane_multiple@tiling-4.html" =
target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/3555" target=3D"_blank">i915#3555</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b-e=
dp-1:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7059/shard-iclb6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-=
factor-0-5@pipe-b-edp-1.html" target=3D"_blank">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb2/igt@kms_plan=
e_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b-edp-1.html" targ=
et=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/5235" target=3D"_blank">i915#5235</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_prime@d3hot:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8109/shard-iclb3/igt@kms_prime@d3hot.html" target=3D"_b=
lank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
6524" target=3D"_blank">i915#6524</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8109/shard-tglb8/igt@kms_psr2_sf@cursor-plane-move-conti=
nuous-exceed-sf.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/2920" target=3D"_blank">i915#2920</a>)</p=
>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8109/shard-glk5/igt@kms_psr2_sf@cursor-plane-move-contin=
uous-exceed-sf.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.fr=
eedesktop.org/show_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/658" target=3D"_=
blank">i915#658</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8109/shard-iclb5/igt@kms_psr2_sf@cursor-plane-move-conti=
nuous-exceed-sf.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/658" target=3D"_blank">i915#658</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8109/shard-apl1/igt@kms_psr2_su@page_flip-p010.html" ta=
rget=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/658" target=3D"_blank">i915#658</a>) +1=
 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8109/shard-iclb6/igt@kms_psr2_su@page_flip-xrgb8888.htm=
l" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show=
_bug.cgi?id=3D109642" target=3D"_blank">fdo#109642</a> / <a href=3D"https:/=
/bugs.freedesktop.org/show_bug.cgi?id=3D111068" target=3D"_blank">fdo#11106=
8</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/658" tar=
get=3D"_blank">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_plane_onoff:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8109/shard-tglb2/igt@kms_psr@psr2_cursor_plane_onoff.ht=
ml" target=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/132" target=3D"_blank">i915#132</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/3467" target=3D"_blank">i915#3467</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_blt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8109/shard-iclb6/igt@kms_psr@psr2_sprite_blt.html" targ=
et=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109441" target=3D"_blank">fdo#109441</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_mmap_gtt:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7059/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html" target=3D"_bla=
nk">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_8109/shard-iclb7/igt@kms_psr@psr2_sprite_mmap_gtt.html" target=3D"_blank"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441=
" target=3D"_blank">fdo#109441</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7059/shard-tglb6/igt@kms_psr_stress_test@invalidate-primary-flip-overl=
ay.html" target=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_8109/shard-tglb8/igt@kms_psr_stress_test@invalidat=
e-primary-flip-overlay.html" target=3D"_blank">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/intel/issues/5519" target=3D"_blank">i915#5519<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8109/shard-iclb2/igt@kms_rotation_crc@primary-4-tiled-r=
eflect-x-0.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/intel/issues/5289" target=3D"_blank">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8109/shard-snb4/igt@kms_tv_load_detect@load-detect.html=
" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_=
bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a>) +138 similar issues<=
/li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8109/shard-iclb3/igt@kms_writeback@writeback-check-outp=
ut.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/2437" target=3D"_blank">i915#2437</a>)</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@recycle-many:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8109/shard-apl8/igt@sysfs_clients@recycle-many.html" ta=
rget=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/2994" target=3D"_blank">i915#2994</a>) =
+1 similar issue</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@sema-10:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8109/shard-glk2/igt@sysfs_clients@sema-10.html" target=
=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/intel/issues/2994" target=3D"_blank">i915#2994</a>) +2 s=
imilar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8109/shard-iclb3/igt@sysfs_clients@sema-10.html" target=
=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2994" target=3D"_blank">i915#2994</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8109/shard-tglb3/igt@sysfs_clients@sema-10.html" target=
=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2994" target=3D"_blank">i915#2994</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7059/shard-rkl-1/igt@fbdev@read.html" target=3D"_blank">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/2582" target=3D"_bla=
nk">i915#2582</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_8109/shard-rkl-6/igt@fbdev@read.html" target=3D"_blank">PASS</a></l=
i>
</ul>
</li>
<li>
<p>igt@gem_ctx_exec@basic-nohangcheck:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7059/shard-tglb2/igt@gem_ctx_exec@basic-nohangcheck.html" target=3D"_b=
lank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
6268" target=3D"_blank">i915#6268</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_8109/shard-tglb1/igt@gem_ctx_exec@basic-nohangc=
heck.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@many-contexts:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7059/shard-rkl-6/igt@gem_ctx_persistence@many-contexts.html" target=3D=
"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/2410" target=3D"_blank">i915#2410</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_8109/shard-rkl-5/igt@gem_ctx_persistence@man=
y-contexts.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-suspend:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7059/shard-rkl-3/igt@gem_eio@in-flight-suspend.html" target=3D"_blank"=
>FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D103375=
" target=3D"_blank">fdo#103375</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_8109/shard-rkl-2/igt@gem_eio@in-flight-suspend.htm=
l" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-submit-fence:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7059/shard-iclb3/igt@gem_exec_balancer@parallel-keep-submit-fence.html=
" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/4525" target=3D"_blank">i915#4525</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb1/igt@gem_exec_bal=
ancer@parallel-keep-submit-fence.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7059/shard-iclb8/igt@gem_exec_fair@basic-none-share@rcs0.html" target=
=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2842" target=3D"_blank">i915#2842</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb1/igt@gem_exec_fair@basic-=
none-share@rcs0.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7059/shard-tglb2/igt@gem_exec_fair@basic-pace-share@rcs0.html" target=
=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2842" target=3D"_blank">i915#2842</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-tglb8/igt@gem_exec_fair@basic-=
pace-share@rcs0.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7059/shard-glk6/igt@gem_exec_fair@basic-pace@vcs0.html" target=3D"_bla=
nk">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/28=
42" target=3D"_blank">i915#2842</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_8109/shard-glk3/igt@gem_exec_fair@basic-pace@vcs0=
.html" target=3D"_blank">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-gtt-noreloc:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7059/shard-rkl-4/igt@gem_exec_reloc@basic-write-gtt-noreloc.html" targ=
et=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/3281" target=3D"_blank">i915#3281</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-rkl-5/igt@gem_exec_reloc@bas=
ic-write-gtt-noreloc.html" target=3D"_blank">PASS</a> +5 similar issues</li=
>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@semaphore-power:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7059/shard-rkl-1/igt@gem_exec_schedule@semaphore-power.html" target=3D=
"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/7276" target=3D"_blank">i915#7276</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_8109/shard-rkl-5/igt@gem_exec_schedule@semap=
hore-power.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@coherency:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7059/shard-rkl-3/igt@gem_mmap_gtt@coherency.html" target=3D"_blank">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111656" t=
arget=3D"_blank">fdo#111656</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_8109/shard-rkl-5/igt@gem_mmap_gtt@coherency.html" tar=
get=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads-uncached:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7059/shard-rkl-4/igt@gem_partial_pwrite_pread@writes-after-reads-uncac=
hed.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/3282" target=3D"_blank">i915#3282</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-rkl-5/igt@gem=
_partial_pwrite_pread@writes-after-reads-uncached.html" target=3D"_blank">P=
ASS</a> +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-single-offset:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7059/shard-tglb8/igt@gem_softpin@evict-single-offset.html" target=3D"_=
blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/4171" target=3D"_blank">i915#4171</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_8109/shard-tglb7/igt@gem_softpin@evict-single-=
offset.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-context:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7059/shard-apl6/igt@gem_workarounds@suspend-resume-context.html" targe=
t=3D"_blank">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/180" target=3D"_blank">i915#180</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/intel/issues/1982" target=3D"_blank">i915#1982</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-a=
pl7/igt@gem_workarounds@suspend-resume-context.html" target=3D"_blank">PASS=
</a></li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@secure-batches:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7059/shard-rkl-1/igt@gen9_exec_parse@secure-batches.html" target=3D"_b=
lank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
2527" target=3D"_blank">i915#2527</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_8109/shard-rkl-5/igt@gen9_exec_parse@secure-bat=
ches.html" target=3D"_blank">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7059/shard-rkl-5/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html" tar=
get=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/4098" target=3D"_blank">i915#4098</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-rkl-6/igt@i915_pipe_stress@=
stress-xrgb8888-ytiled.html" target=3D"_blank">PASS</a> +1 similar issue</l=
i>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7059/shard-iclb3/igt@i915_pm_dc@dc6-psr.html" target=3D"_blank">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3989" target=
=3D"_blank">i915#3989</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/454" target=3D"_blank">i915#454</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb5/igt@i915_pm_dc@dc6-p=
sr.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_sseu@full-enable:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7059/shard-rkl-3/igt@i915_pm_sseu@full-enable.html" target=3D"_blank">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4387" =
target=3D"_blank">i915#4387</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_8109/shard-rkl-5/igt@i915_pm_sseu@full-enable.html" t=
arget=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7059/shard-apl1/igt@i915_selftest@live@gt_heartbeat.html" target=3D"_b=
lank">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/5334" target=3D"_blank">i915#5334</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-apl6/igt@i915_selftest@live@gt=
_heartbeat.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@perf@engine_cs:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7059/shard-snb7/igt@i915_selftest@perf@engine_cs.html" target=3D"_blan=
k">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1092=
71" target=3D"_blank">fdo#109271</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_8109/shard-snb6/igt@i915_selftest@perf@engine_cs=
.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7059/shard-rkl-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180=
-async-flip.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/1845" target=3D"_blank">i915#1845</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/4098" target=3D"_blan=
k">i915#4098</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_8109/shard-rkl-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-1=
80-async-flip.html" target=3D"_blank">PASS</a> +13 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7059/shard-apl8/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp=
1.html" target=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/79" target=3D"_blank">i915#79</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-apl8/igt@kms_flip@fl=
ip-vs-expired-vblank-interruptible@a-dp1.html" target=3D"_blank">PASS</a></=
li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@b-edp1:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7059/shard-tglb7/igt@kms_flip@flip-vs-suspend-interruptible@b-edp1.htm=
l" target=3D"_blank">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/2411" target=3D"_blank">i915#2411</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/2867" target=3D"_blank">i915#2=
867</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_81=
09/shard-tglb1/igt@kms_flip@flip-vs-suspend-interruptible@b-edp1.html" targ=
et=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7059/shard-rkl-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indf=
b-draw-blt.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/intel/issues/1849" target=3D"_blank">i915#1849</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/4098" target=3D"_blank=
">i915#4098</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_8109/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-ind=
fb-draw-blt.html" target=3D"_blank">PASS</a> +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping@pipe-b-planes:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7059/shard-rkl-3/igt@kms_plane@pixel-format-source-clamping@pipe-b-pla=
nes.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/3558" target=3D"_blank">i915#3558</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-rkl-6/igt@kms=
_plane@pixel-format-source-clamping@pipe-b-planes.html" target=3D"_blank">P=
ASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pi=
pe-a-edp-1:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7059/shard-iclb2/igt@kms_plane_scaling@planes-upscale-factor-0-25-down=
scale-factor-0-5@pipe-a-edp-1.html" target=3D"_blank">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/5235" target=3D"_blank">i91=
5#5235</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_8109/shard-iclb1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscal=
e-factor-0-5@pipe-a-edp-1.html" target=3D"_blank">PASS</a> +2 similar issue=
s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@crtc-properties-atomic:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7059/shard-rkl-4/igt@kms_properties@crtc-properties-atomic.html" targe=
t=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/1849" target=3D"_blank">i915#1849</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-rkl-6/igt@kms_properties@crtc=
-properties-atomic.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_gtt:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7059/shard-iclb6/igt@kms_psr@psr2_primary_mmap_gtt.html" target=3D"_bl=
ank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9441" target=3D"_blank">fdo#109441</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb2/igt@kms_psr@psr2_primary_mmap=
_gtt.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@sprite_blt:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7059/shard-rkl-4/igt@kms_psr@sprite_blt.html" target=3D"_blank">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1072" target=
=3D"_blank">i915#1072</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_8109/shard-rkl-6/igt@kms_psr@sprite_blt.html" target=3D"_bl=
ank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7059/shard-iclb6/igt@kms_psr_stress_test@flip-primary-invalidate-overl=
ay.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/5519" target=3D"_blank">i915#5519</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb1/igt@kms=
_psr_stress_test@flip-primary-invalidate-overlay.html" target=3D"_blank">PA=
SS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-ts-continuation-suspend:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7059/shard-apl1/igt@kms_vblank@pipe-a-ts-continuation-suspend.html" ta=
rget=3D"_blank">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/180" target=3D"_blank">i915#180</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-apl1/igt@kms_vblank@pi=
pe-a-ts-continuation-suspend.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@sysfs_heartbeat_interval@precise@rcs0:</p>
<ul>
<li>{shard-dg1}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7059/shard-dg1-15/igt@sysfs_heartbeat_interval@precise@rcs0.html" targ=
et=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/1755" target=3D"_blank">i915#1755</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-dg1-15/igt@sysfs_heartbeat_i=
nterval@precise@rcs0.html" target=3D"_blank">PASS</a> +4 similar issues</li=
>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7059/shard-apl3/igt@gem_pread@exhaustion.html" target=3D"_blank">INCOM=
PLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/7248"=
 target=3D"_blank">i915#7248</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_8109/shard-apl6/igt@gem_pread@exhaustion.html" targe=
t=3D"_blank">WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/2658" target=3D"_blank">i915#2658</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@rcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7059/shard-iclb8/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html" target=
=3D"_blank">WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2684" target=3D"_blank">i915#2684</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb1/igt@i915_pm_rc6_residenc=
y@rc6-idle@rcs0.html" target=3D"_blank">FAIL</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/2684" target=3D"_blank">i915#2684</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@vecs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7059/shard-iclb8/igt@i915_pm_rc6_residency@rc6-idle@vecs0.html" target=
=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2684" target=3D"_blank">i915#2684</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb1/igt@i915_pm_rc6_residenc=
y@rc6-idle@vecs0.html" target=3D"_blank">WARN</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/intel/issues/2684" target=3D"_blank">i915#2684</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei_interface:</p>
<ul>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_7059/shard-tglb1/igt@kms_content_protection@mei_interface.html" target=
=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/7118" target=3D"_blank">i915#7118</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-tglb8/igt@kms_content_protecti=
on@mei_interface.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.=
freedesktop.org/show_bug.cgi?id=3D109300" target=3D"_blank">fdo#109300</a>)=
</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_7059/shard-iclb1/igt@kms_content_protection@mei_interface.html" target=
=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/7118" target=3D"_blank">i915#7118</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb1/igt@kms_content_protecti=
on@mei_interface.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.=
freedesktop.org/show_bug.cgi?id=3D109300" target=3D"_blank">fdo#109300</a>)=
</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-basic@pipe-c-dp-1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7059/shard-apl7/igt@kms_plane_alpha_blend@alpha-basic@pipe-c-dp-1.html=
" target=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/4573" target=3D"_blank">i915#4573</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-apl2/igt@kms_plane_alp=
ha_blend@alpha-basic@pipe-c-dp-1.html" target=3D"_blank">DMESG-FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/6" target=
=3D"_blank">IGT#6</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7059/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.ht=
ml" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/2920" target=3D"_blank">i915#2920</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8109/shard-iclb7/igt@kms_psr2_s=
f@overlay-plane-update-continuous-sf.html" target=3D"_blank">SKIP</a> (<a h=
ref=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111068" target=3D"_bl=
ank">fdo#111068</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/658" target=3D"_blank">i915#658</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br>
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7059 -&gt; IGTPW_8109</li>
</ul>
<p>CI-20190529: 20190529<br>
  CI_DRM_12382: cb74864693414b221b3601572e75449558126e8b @ git://<a href=3D=
"http://anongit.freedesktop.org/gfx-ci/linux" target=3D"_blank">anongit.fre=
edesktop.org/gfx-ci/linux</a><br>
  IGTPW_8109: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_810=
9/index.html" target=3D"_blank">https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_8109/index.html</a><br>
  IGT_7059: 89c5c56dfde602d54eefa301e9887eff8bcda0e8 @ <a href=3D"https://g=
itlab.freedesktop.org/drm/igt-gpu-tools.git" target=3D"_blank">https://gitl=
ab.freedesktop.org/drm/igt-gpu-tools.git</a></p>

</div>

</div></blockquote></div>

--000000000000bc9ae905ed97cf25--
