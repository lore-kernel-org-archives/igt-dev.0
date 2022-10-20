Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [IPv6:2607:f8b0:4864:20::b31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9100E10F265
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Oct 2022 14:17:44 +0000 (UTC)
Received: by mail-yb1-xb31.google.com with SMTP id f205so13639767yba.2
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Oct 2022 07:17:44 -0700 (PDT)
MIME-Version: 1.0
References: <20221018145926.4014906-1-markyacoub@chromium.org>
 <166618191026.29706.10764726093268257312@emeril.freedesktop.org>
In-Reply-To: <166618191026.29706.10764726093268257312@emeril.freedesktop.org>
From: Mark Yacoub <markyacoub@chromium.org>
Date: Thu, 20 Oct 2022 10:17:32 -0400
Message-ID: <CAJUqKUpfg5jsDDGNjjqx+KBU7EfosvJtm6jbU7de4buO9FufZA@mail.gmail.com>
To: "Vudum, Lakshminarayana" <lakshminarayana.vudum@intel.com>
Content-Type: multipart/alternative; boundary="00000000000019ef6105eb77fd0d"
Subject: Re: [igt-dev]
	=?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgUmVmYWN0?=
	=?utf-8?q?or_Display_Outputs_to_handle_MST_Connectors=2E?=
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

--00000000000019ef6105eb77fd0d
Content-Type: text/plain; charset="UTF-8"

Hi Lakshminarayana, Can I get a rerun please. Thanks!

On Wed, Oct 19, 2022 at 8:18 AM Patchwork <patchwork@emeril.freedesktop.org>
wrote:

> *Patch Details*
> *Series:* Refactor Display Outputs to handle MST Connectors.
> *URL:* https://patchwork.freedesktop.org/series/109831/
> *State:* failure
> *Details:* https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/index.html CI
> Bug Log - changes from IGT_7019_full -> IGTPW_7977_full Summary
>
> *FAILURE*
>
> Serious unknown changes coming with IGTPW_7977_full absolutely need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_7977_full, please notify your bug team to allow them
> to document this new failure mode, which will reduce false positives in CI.
>
> External URL:
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/index.html
> Participating hosts (8 -> 8)
>
> No changes in participating hosts
> Possible new issues
>
> Here are the unknown changes that may have been introduced in
> IGTPW_7977_full:
> IGT changes Possible regressions
>
>    -
>
>    igt@gem_pread@exhaustion:
>    - shard-apl: NOTRUN -> INCOMPLETE
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-apl3/igt@gem_pread@exhaustion.html>
>       +2 similar issues
>    -
>
>    igt@i915_selftest@perf:
>    - shard-glk: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-glk7/igt@i915_selftest@perf.html>
>    -
>
>    igt@i915_selftest@perf@engine_cs:
>    - shard-iclb: NOTRUN -> INCOMPLETE
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-iclb7/igt@i915_selftest@perf@engine_cs.html>
>    -
>
>    igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a1-hdmi-a2:
>    - shard-glk: NOTRUN -> INCOMPLETE
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-glk6/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a1-hdmi-a2.html>
>       +3 similar issues
>    -
>
>    igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-gtt:
>    - shard-apl: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-apl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-gtt.html>
>
> Suppressed
>
> The following results come from untrusted machines, tests, or statuses.
> They do not affect the overall result.
>
>    -
>
>    igt@i915_selftest@perf@engine_cs:
>    - {shard-rkl}: NOTRUN -> INCOMPLETE
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-rkl-4/igt@i915_selftest@perf@engine_cs.html>
>       +1 similar issue
>    -
>
>    igt@kms_cursor_legacy@torture-bo@all-pipes:
>    - {shard-rkl}: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7019/shard-rkl-4/igt@kms_cursor_legacy@torture-bo@all-pipes.html>
>       -> INCOMPLETE
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-rkl-5/igt@kms_cursor_legacy@torture-bo@all-pipes.html>
>    -
>
>    igt@kms_vblank@pipe-d-ts-continuation-suspend:
>    - {shard-dg1}: NOTRUN -> INCOMPLETE
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-dg1-17/igt@kms_vblank@pipe-d-ts-continuation-suspend.html>
>       +6 similar issues
>
> Known issues
>
> Here are the changes found in IGTPW_7977_full that come from known issues:
> IGT changes Issues hit
>
>    -
>
>    igt@gem_ccs@ctrl-surf-copy-new-ctx:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-iclb5/igt@gem_ccs@ctrl-surf-copy-new-ctx.html>
>       (i915#5327 <https://gitlab.freedesktop.org/drm/intel/issues/5327>)
>       +1 similar issue
>    -
>
>    igt@gem_create@create-ext-cpu-access-sanity-check:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-iclb5/igt@gem_create@create-ext-cpu-access-sanity-check.html>
>       (i915#6335 <https://gitlab.freedesktop.org/drm/intel/issues/6335>)
>    -
>
>    igt@gem_ctx_persistence@hostile:
>    - shard-snb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-snb4/igt@gem_ctx_persistence@hostile.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#1099 <https://gitlab.freedesktop.org/drm/intel/issues/1099>)
>    -
>
>    igt@gem_exec_balancer@parallel-bb-first:
>    - shard-iclb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7019/shard-iclb2/igt@gem_exec_balancer@parallel-bb-first.html>
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-iclb3/igt@gem_exec_balancer@parallel-bb-first.html>
>       (i915#4525 <https://gitlab.freedesktop.org/drm/intel/issues/4525>)
>    -
>
>    igt@gem_exec_balancer@parallel-contexts:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-iclb8/igt@gem_exec_balancer@parallel-contexts.html>
>       (i915#4525 <https://gitlab.freedesktop.org/drm/intel/issues/4525>)
>    -
>
>    igt@gem_exec_balancer@parallel-ordering:
>    - shard-iclb: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-iclb2/igt@gem_exec_balancer@parallel-ordering.html>
>       (i915#6117 <https://gitlab.freedesktop.org/drm/intel/issues/6117>)
>    -
>
>    igt@gem_exec_fair@basic-none-solo@rcs0:
>    - shard-apl: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7019/shard-apl6/igt@gem_exec_fair@basic-none-solo@rcs0.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-apl1/igt@gem_exec_fair@basic-none-solo@rcs0.html>
>       (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
>    -
>
>    igt@gem_exec_fair@basic-throttle@rcs0:
>    - shard-glk: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-glk6/igt@gem_exec_fair@basic-throttle@rcs0.html>
>       (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
>       +2 similar issues
>    -
>
>    igt@gem_lmem_swapping@smem-oom:
>    -
>
>       shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-apl7/igt@gem_lmem_swapping@smem-oom.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#4613 <https://gitlab.freedesktop.org/drm/intel/issues/4613>)
>       +2 similar issues
>       -
>
>       shard-glk: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-glk2/igt@gem_lmem_swapping@smem-oom.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#4613 <https://gitlab.freedesktop.org/drm/intel/issues/4613>)
>       +2 similar issues
>       -
>
>    igt@gem_lmem_swapping@verify:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-iclb6/igt@gem_lmem_swapping@verify.html>
>       (i915#4613 <https://gitlab.freedesktop.org/drm/intel/issues/4613>)
>       +5 similar issues
>    -
>
>    igt@gem_pread@exhaustion:
>    -
>
>       shard-glk: NOTRUN -> WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-glk8/igt@gem_pread@exhaustion.html>
>       (i915#2658 <https://gitlab.freedesktop.org/drm/intel/issues/2658>)
>       -
>
>       shard-iclb: NOTRUN -> WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-iclb5/igt@gem_pread@exhaustion.html>
>       (i915#2658 <https://gitlab.freedesktop.org/drm/intel/issues/2658>)
>       -
>
>    igt@gem_pxp@verify-pxp-stale-buf-execution:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-iclb2/igt@gem_pxp@verify-pxp-stale-buf-execution.html>
>       (i915#4270 <https://gitlab.freedesktop.org/drm/intel/issues/4270>)
>       +3 similar issues
>    -
>
>    igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs:
>    -
>
>       shard-glk: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-glk5/igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>)
>       +297 similar issues
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-iclb6/igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs.html>
>       (i915#768 <https://gitlab.freedesktop.org/drm/intel/issues/768>) +1
>       similar issue
>       -
>
>    igt@gem_softpin@evict-single-offset:
>    -
>
>       shard-apl: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-apl1/igt@gem_softpin@evict-single-offset.html>
>       (i915#4171 <https://gitlab.freedesktop.org/drm/intel/issues/4171>)
>       -
>
>       shard-glk: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-glk5/igt@gem_softpin@evict-single-offset.html>
>       (i915#4171 <https://gitlab.freedesktop.org/drm/intel/issues/4171>)
>       -
>
>    igt@gem_userptr_blits@access-control:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-iclb1/igt@gem_userptr_blits@access-control.html>
>       (i915#3297 <https://gitlab.freedesktop.org/drm/intel/issues/3297>)
>    -
>
>    igt@gem_workarounds@suspend-resume:
>    -
>
>       shard-apl: NOTRUN -> INCOMPLETE
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-apl1/igt@gem_workarounds@suspend-resume.html>
>       (i915#7231 <https://gitlab.freedesktop.org/drm/intel/issues/7231> /
>       i915#7259 <https://gitlab.freedesktop.org/drm/intel/issues/7259>)
>       -
>
>       shard-glk: NOTRUN -> INCOMPLETE
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-glk8/igt@gem_workarounds@suspend-resume.html>
>       (i915#7231 <https://gitlab.freedesktop.org/drm/intel/issues/7231> /
>       i915#7259 <https://gitlab.freedesktop.org/drm/intel/issues/7259>)
>       -
>
>    igt@gen7_exec_parse@basic-allocation:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-iclb6/igt@gen7_exec_parse@basic-allocation.html>
>       (fdo#109289 <https://bugs.freedesktop.org/show_bug.cgi?id=109289>)
>       +4 similar issues
>    -
>
>    igt@gen7_exec_parse@oacontrol-tracking:
>    - shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-apl8/igt@gen7_exec_parse@oacontrol-tracking.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>)
>       +356 similar issues
>    -
>
>    igt@gen9_exec_parse@batch-without-end:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-iclb1/igt@gen9_exec_parse@batch-without-end.html>
>       (i915#2856 <https://gitlab.freedesktop.org/drm/intel/issues/2856>)
>       +3 similar issues
>    -
>
>    igt@i915_module_load@resize-bar:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-iclb5/igt@i915_module_load@resize-bar.html>
>       (i915#6412 <https://gitlab.freedesktop.org/drm/intel/issues/6412>)
>    -
>
>    igt@i915_pipe_stress@stress-xrgb8888-untiled:
>    - shard-apl: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-apl8/igt@i915_pipe_stress@stress-xrgb8888-untiled.html>
>       (i915#7036 <https://gitlab.freedesktop.org/drm/intel/issues/7036>)
>    -
>
>    igt@i915_pm_dc@dc9-dpms:
>    - shard-iclb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7019/shard-iclb2/igt@i915_pm_dc@dc9-dpms.html>
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-iclb3/igt@i915_pm_dc@dc9-dpms.html>
>       (i915#4281 <https://gitlab.freedesktop.org/drm/intel/issues/4281>)
>    -
>
>    igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:
>    - shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-apl7/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#1937 <https://gitlab.freedesktop.org/drm/intel/issues/1937>)
>    -
>
>    igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:
>    - shard-glk: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-glk8/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#1937 <https://gitlab.freedesktop.org/drm/intel/issues/1937>)
>    -
>
>    igt@i915_pm_lpsp@screens-disabled:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-iclb1/igt@i915_pm_lpsp@screens-disabled.html>
>       (i915#1902 <https://gitlab.freedesktop.org/drm/intel/issues/1902>)
>    -
>
>    igt@i915_pm_rc6_residency@rc6-idle@vcs0:
>    - shard-iclb: NOTRUN -> WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-iclb5/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html>
>       (i915#2684 <https://gitlab.freedesktop.org/drm/intel/issues/2684>)
>       +3 similar issues
>    -
>
>    igt@i915_pm_rpm@dpms-non-lpsp:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-iclb8/igt@i915_pm_rpm@dpms-non-lpsp.html>
>       (fdo#110892 <https://bugs.freedesktop.org/show_bug.cgi?id=110892>)
>    -
>
>    igt@i915_pm_rpm@modeset-pc8-residency-stress:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-iclb5/igt@i915_pm_rpm@modeset-pc8-residency-stress.html>
>       (fdo#109293 <https://bugs.freedesktop.org/show_bug.cgi?id=109293> /
>       fdo#109506 <https://bugs.freedesktop.org/show_bug.cgi?id=109506>)
>    -
>
>    igt@i915_selftest@live@gt_timelines:
>    - shard-iclb: NOTRUN -> INCOMPLETE
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-iclb3/igt@i915_selftest@live@gt_timelines.html>
>       (i915#7222 <https://gitlab.freedesktop.org/drm/intel/issues/7222>)
>    -
>
>    igt@i915_suspend@basic-s3-without-i915:
>    - shard-apl: NOTRUN -> INCOMPLETE
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-apl8/igt@i915_suspend@basic-s3-without-i915.html>
>       (i915#4817 <https://gitlab.freedesktop.org/drm/intel/issues/4817>)
>    -
>
>    igt@i915_suspend@forcewake:
>    -
>
>       shard-glk: NOTRUN -> INCOMPLETE
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-glk3/igt@i915_suspend@forcewake.html>
>       (i915#4817 <https://gitlab.freedesktop.org/drm/intel/issues/4817>)
>       -
>
>       shard-apl: NOTRUN -> INCOMPLETE
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-apl7/igt@i915_suspend@forcewake.html>
>       (i915#4817 <https://gitlab.freedesktop.org/drm/intel/issues/4817> /
>       i915#7228 <https://gitlab.freedesktop.org/drm/intel/issues/7228>)
>       -
>
>    igt@kms_atomic@plane-primary-overlay-mutable-zpos:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-iclb7/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html>
>       (i915#404 <https://gitlab.freedesktop.org/drm/intel/issues/404>)
>    -
>
>    igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-iclb1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html>
>       (i915#5286 <https://gitlab.freedesktop.org/drm/intel/issues/5286>)
>       +3 similar issues
>    -
>
>    igt@kms_big_fb@y-tiled-64bpp-rotate-90:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-iclb3/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html>
>       (fdo#110725 <https://bugs.freedesktop.org/show_bug.cgi?id=110725> /
>       fdo#111614 <https://bugs.freedesktop.org/show_bug.cgi?id=111614>)
>       +1 similar issue
>    -
>
>    igt@kms_big_fb@yf-tiled-8bpp-rotate-90:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-iclb7/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html>
>       (fdo#110723 <https://bugs.freedesktop.org/show_bug.cgi?id=110723>)
>       +5 similar issues
>    -
>
>    igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_gen12_mc_ccs:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-iclb2/igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_gen12_mc_ccs.html>
>       (fdo#109278 <https://bugs.freedesktop.org/show_bug.cgi?id=109278> /
>       i915#3886 <https://gitlab.freedesktop.org/drm/intel/issues/3886>)
>       +7 similar issues
>    -
>
>    igt@kms_ccs@pipe-c-crc-primary-basic-y_tiled_gen12_mc_ccs:
>    - shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-apl6/igt@kms_ccs@pipe-c-crc-primary-basic-y_tiled_gen12_mc_ccs.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#3886 <https://gitlab.freedesktop.org/drm/intel/issues/3886>)
>       +23 similar issues
>    -
>
>    igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc:
>    - shard-glk: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-glk1/igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#3886 <https://gitlab.freedesktop.org/drm/intel/issues/3886>)
>       +20 similar issues
>    -
>
>    igt@kms_ccs@pipe-d-bad-aux-stride-y_tiled_gen12_mc_ccs:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-iclb6/igt@kms_ccs@pipe-d-bad-aux-stride-y_tiled_gen12_mc_ccs.html>
>       (fdo#109278 <https://bugs.freedesktop.org/show_bug.cgi?id=109278>)
>       +28 similar issues
>    -
>
>    igt@kms_cdclk@mode-transition:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-iclb5/igt@kms_cdclk@mode-transition.html>
>       (i915#3742 <https://gitlab.freedesktop.org/drm/intel/issues/3742>)
>    -
>
>    igt@kms_chamelium@common-hpd-after-suspend:
>    - shard-snb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-snb7/igt@kms_chamelium@common-hpd-after-suspend.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>)
>       +3 similar issues
>    -
>
>    igt@kms_chamelium@hdmi-crc-multiple:
>    - shard-glk: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-glk5/igt@kms_chamelium@hdmi-crc-multiple.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>)
>       +14 similar issues
>    -
>
>    igt@kms_chamelium@hdmi-hpd-for-each-pipe:
>    - shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-apl1/igt@kms_chamelium@hdmi-hpd-for-each-pipe.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>)
>       +17 similar issues
>    -
>
>    igt@kms_color_chamelium@ctm-0-75:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-iclb3/igt@kms_color_chamelium@ctm-0-75.html>
>       (fdo#109284 <https://bugs.freedesktop.org/show_bug.cgi?id=109284> /
>       fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>)
>       +6 similar issues
>    -
>
>    igt@kms_content_protection@atomic:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-iclb8/igt@kms_content_protection@atomic.html>
>       (i915#7118 <https://gitlab.freedesktop.org/drm/intel/issues/7118>)
>       +2 similar issues
>    -
>
>    igt@kms_content_protection@dp-mst-lic-type-0:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-iclb6/igt@kms_content_protection@dp-mst-lic-type-0.html>
>       (i915#3116 <https://gitlab.freedesktop.org/drm/intel/issues/3116>)
>       +1 similar issue
>    -
>
>    igt@kms_content_protection@srm@pipe-a-dp-1:
>    - shard-apl: NOTRUN -> INCOMPLETE
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-apl1/igt@kms_content_protection@srm@pipe-a-dp-1.html>
>       (i915#7121 <https://gitlab.freedesktop.org/drm/intel/issues/7121> /
>       i915#7173 <https://gitlab.freedesktop.org/drm/intel/issues/7173>)
>       +1 similar issue
>    -
>
>    igt@kms_cursor_crc@cursor-onscreen-512x170:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-iclb8/igt@kms_cursor_crc@cursor-onscreen-512x170.html>
>       (fdo#109279 <https://bugs.freedesktop.org/show_bug.cgi?id=109279> /
>       i915#3359 <https://gitlab.freedesktop.org/drm/intel/issues/3359>)
>    -
>
>    igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-1:
>    - shard-apl: NOTRUN -> INCOMPLETE
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-apl2/igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-1.html>
>       (i915#7242 <https://gitlab.freedesktop.org/drm/intel/issues/7242>)
>    -
>
>    igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:
>    - shard-glk: NOTRUN -> INCOMPLETE
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-glk7/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html>
>       (i915#7085 <https://gitlab.freedesktop.org/drm/intel/issues/7085>)
>    -
>
>    igt@kms_cursor_legacy@basic-busy-flip-before-cursor:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-iclb7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html>
>       (i915#4103 <https://gitlab.freedesktop.org/drm/intel/issues/4103>)
>    -
>
>    igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-iclb1/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html>
>       (i915#3528 <https://gitlab.freedesktop.org/drm/intel/issues/3528>)
>    -
>
>    igt@kms_dsc@dsc-with-bpc-formats:
>    -
>
>       shard-glk: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-glk6/igt@kms_dsc@dsc-with-bpc-formats.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#7205 <https://gitlab.freedesktop.org/drm/intel/issues/7205>)
>       -
>
>       shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-apl6/igt@kms_dsc@dsc-with-bpc-formats.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#7205 <https://gitlab.freedesktop.org/drm/intel/issues/7205>)
>       -
>
>    igt@kms_fbcon_fbt@fbc-suspend:
>    - shard-apl: NOTRUN -> INCOMPLETE
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-apl2/igt@kms_fbcon_fbt@fbc-suspend.html>
>       (i915#4939 <https://gitlab.freedesktop.org/drm/intel/issues/4939>)
>       +2 similar issues
>    -
>
>    igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-iclb3/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html>
>       (fdo#109274 <https://bugs.freedesktop.org/show_bug.cgi?id=109274>)
>       +12 similar issues
>    -
>
>    igt@kms_flip_scaled_crc
>    @flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-iclb6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html>
>       (i915#2587 <https://gitlab.freedesktop.org/drm/intel/issues/2587> /
>       i915#2672 <https://gitlab.freedesktop.org/drm/intel/issues/2672>)
>       +3 similar issues
>    -
>
>    igt@kms_flip_scaled_crc
>    @flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-default-mode:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-default-mode.html>
>       (i915#2672 <https://gitlab.freedesktop.org/drm/intel/issues/2672>)
>       +3 similar issues
>    -
>
>    igt@kms_flip_scaled_crc
>    @flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode
>    :
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html>
>       (i915#2672 <https://gitlab.freedesktop.org/drm/intel/issues/2672> /
>       i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555>)
>       +1 similar issue
>    -
>
>    igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-plflip-blt:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-iclb8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-plflip-blt.html>
>       (fdo#109280 <https://bugs.freedesktop.org/show_bug.cgi?id=109280>)
>       +41 similar issues
>    -
>
>    igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-iclb7/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html>
>       (i915#1839 <https://gitlab.freedesktop.org/drm/intel/issues/1839>)
>    -
>
>    igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-dp-1:
>    - shard-apl: NOTRUN -> INCOMPLETE
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-apl3/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-dp-1.html>
>       (i915#7074 <https://gitlab.freedesktop.org/drm/intel/issues/7074>)
>    -
>
>    igt@kms_plane_alpha_blend@constant-alpha-max@pipe-b-dp-1:
>    - shard-apl: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-apl3/igt@kms_plane_alpha_blend@constant-alpha-max@pipe-b-dp-1.html>
>       (i915#4573 <https://gitlab.freedesktop.org/drm/intel/issues/4573>)
>       +5 similar issues
>    -
>
>    igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1:
>    - shard-glk: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-glk5/igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1.html>
>       (i915#4573 <https://gitlab.freedesktop.org/drm/intel/issues/4573>)
>       +5 similar issues
>    -
>
>    igt@kms_plane_scaling
>    @plane-downscale-with-modifiers-factor-0-5@pipe-c-edp-1:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-iclb5/igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-5@pipe-c-edp-1.html>
>       (i915#5176 <https://gitlab.freedesktop.org/drm/intel/issues/5176>)
>       +5 similar issues
>    -
>
>    igt@kms_prime@basic-modeset-hybrid:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-iclb2/igt@kms_prime@basic-modeset-hybrid.html>
>       (i915#6524 <https://gitlab.freedesktop.org/drm/intel/issues/6524>)
>       +1 similar issue
>    -
>
>    igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-iclb6/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html>
>       (i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>)
>    -
>
>    igt@kms_psr2_sf@cursor-plane-update-sf:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-iclb2/igt@kms_psr2_sf@cursor-plane-update-sf.html>
>       (i915#2920 <https://gitlab.freedesktop.org/drm/intel/issues/2920>)
>    -
>
>    igt@kms_psr2_sf@plane-move-sf-dmg-area:
>    -
>
>       shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-apl1/igt@kms_psr2_sf@plane-move-sf-dmg-area.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>) +3
>       similar issues
>       -
>
>       shard-glk: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-glk5/igt@kms_psr2_sf@plane-move-sf-dmg-area.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>) +3
>       similar issues
>       -
>
>    igt@kms_psr2_sf@primary-plane-update-sf-dmg-area:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-iclb8/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html>
>       (fdo#111068 <https://bugs.freedesktop.org/show_bug.cgi?id=111068> /
>       i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>)
>    -
>
>    igt@kms_psr@psr2_primary_mmap_gtt:
>    - shard-iclb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7019/shard-iclb2/igt@kms_psr@psr2_primary_mmap_gtt.html>
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-iclb6/igt@kms_psr@psr2_primary_mmap_gtt.html>
>       (fdo#109441 <https://bugs.freedesktop.org/show_bug.cgi?id=109441>)
>       +1 similar issue
>    -
>
>    igt@kms_psr@psr2_sprite_blt:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-iclb6/igt@kms_psr@psr2_sprite_blt.html>
>       (fdo#109441 <https://bugs.freedesktop.org/show_bug.cgi?id=109441>)
>       +4 similar issues
>    -
>
>    igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-iclb1/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html>
>       (i915#5289 <https://gitlab.freedesktop.org/drm/intel/issues/5289>)
>    -
>
>    igt@kms_setmode@basic-clone-single-crtc:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-iclb6/igt@kms_setmode@basic-clone-single-crtc.html>
>       (i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555>)
>       +5 similar issues
>    -
>
>    igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend:
>    -
>
>       shard-snb: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-snb2/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html>
>       (fdo#103375 <https://bugs.freedesktop.org/show_bug.cgi?id=103375>)
>       -
>
>       shard-glk: NOTRUN -> INCOMPLETE
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-glk5/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html>
>       (i915#7251 <https://gitlab.freedesktop.org/drm/intel/issues/7251>)
>       +1 similar issue
>       -
>
>    igt@kms_vblank@pipe-c-query-busy-hang:
>    - shard-snb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-snb4/igt@kms_vblank@pipe-c-query-busy-hang.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>)
>       +176 similar issues
>    -
>
>    igt@kms_writeback@writeback-check-output:
>    - shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-apl2/igt@kms_writeback@writeback-check-output.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#2437 <https://gitlab.freedesktop.org/drm/intel/issues/2437>)
>       +1 similar issue
>    -
>
>    igt@kms_writeback@writeback-fb-id:
>    - shard-glk: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-glk6/igt@kms_writeback@writeback-fb-id.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#2437 <https://gitlab.freedesktop.org/drm/intel/issues/2437>)
>       +1 similar issue
>    -
>
>    igt@sysfs_clients@busy:
>    - shard-glk: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-glk6/igt@sysfs_clients@busy.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#2994 <https://gitlab.freedesktop.org/drm/intel/issues/2994>)
>       +4 similar issues
>    -
>
>    igt@sysfs_clients@pidname:
>    - shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-apl8/igt@sysfs_clients@pidname.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#2994 <https://gitlab.freedesktop.org/drm/intel/issues/2994>)
>       +4 similar issues
>    -
>
>    igt@sysfs_clients@split-25:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-iclb8/igt@sysfs_clients@split-25.html>
>       (i915#2994 <https://gitlab.freedesktop.org/drm/intel/issues/2994>)
>       +1 similar issue
>    -
>
>    igt@tools_test@sysfs_l3_parity:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-iclb5/igt@tools_test@sysfs_l3_parity.html>
>       (fdo#109307 <https://bugs.freedesktop.org/show_bug.cgi?id=109307>)
>
> Possible fixes
>
>    -
>
>    igt@api_intel_bb@object-reloc-keep-cache:
>    - {shard-rkl}: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7019/shard-rkl-6/igt@api_intel_bb@object-reloc-keep-cache.html>
>       (i915#3281 <https://gitlab.freedesktop.org/drm/intel/issues/3281>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-rkl-5/igt@api_intel_bb@object-reloc-keep-cache.html>
>       +1 similar issue
>    -
>
>    igt@fbdev@nullptr:
>    - {shard-rkl}: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7019/shard-rkl-4/igt@fbdev@nullptr.html>
>       (i915#2582 <https://gitlab.freedesktop.org/drm/intel/issues/2582>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-rkl-2/igt@fbdev@nullptr.html>
>    -
>
>    igt@gem_ctx_persistence@hang:
>    - {shard-rkl}: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7019/shard-rkl-5/igt@gem_ctx_persistence@hang.html>
>       (i915#6252 <https://gitlab.freedesktop.org/drm/intel/issues/6252>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-rkl-6/igt@gem_ctx_persistence@hang.html>
>    -
>
>    igt@gem_exec_balancer@parallel-keep-in-fence:
>    - shard-iclb: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7019/shard-iclb7/igt@gem_exec_balancer@parallel-keep-in-fence.html>
>       (i915#4525 <https://gitlab.freedesktop.org/drm/intel/issues/4525>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-iclb1/igt@gem_exec_balancer@parallel-keep-in-fence.html>
>    -
>
>    igt@gem_exec_fair@basic-none@rcs0:
>    - shard-glk: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7019/shard-glk2/igt@gem_exec_fair@basic-none@rcs0.html>
>       (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-glk5/igt@gem_exec_fair@basic-none@rcs0.html>
>    -
>
>    igt@gem_readwrite@beyond-eob:
>    - {shard-rkl}: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7019/shard-rkl-1/igt@gem_readwrite@beyond-eob.html>
>       (i915#3282 <https://gitlab.freedesktop.org/drm/intel/issues/3282>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-rkl-5/igt@gem_readwrite@beyond-eob.html>
>       +1 similar issue
>    -
>
>    igt@i915_hangman@gt-engine-error@bcs0:
>    - {shard-rkl}: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7019/shard-rkl-5/igt@i915_hangman@gt-engine-error@bcs0.html>
>       (i915#6258 <https://gitlab.freedesktop.org/drm/intel/issues/6258>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-rkl-1/igt@i915_hangman@gt-engine-error@bcs0.html>
>    -
>
>    igt@i915_pm_backlight@bad-brightness:
>    - {shard-rkl}: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7019/shard-rkl-4/igt@i915_pm_backlight@bad-brightness.html>
>       (i915#3012 <https://gitlab.freedesktop.org/drm/intel/issues/3012>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-rkl-6/igt@i915_pm_backlight@bad-brightness.html>
>    -
>
>    igt@i915_pm_rpm@pm-tiling:
>    - {shard-rkl}: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7019/shard-rkl-3/igt@i915_pm_rpm@pm-tiling.html>
>       (fdo#109308 <https://bugs.freedesktop.org/show_bug.cgi?id=109308>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-rkl-6/igt@i915_pm_rpm@pm-tiling.html>
>       +1 similar issue
>    -
>
>    igt@i915_pm_rps@engine-order:
>    - {shard-rkl}: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7019/shard-rkl-5/igt@i915_pm_rps@engine-order.html>
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-rkl-2/igt@i915_pm_rps@engine-order.html>
>    -
>
>    igt@i915_selftest@live@sanitycheck:
>    - shard-iclb: INCOMPLETE
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7019/shard-iclb2/igt@i915_selftest@live@sanitycheck.html>
>       (i915#7222 <https://gitlab.freedesktop.org/drm/intel/issues/7222>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-iclb3/igt@i915_selftest@live@sanitycheck.html>
>    -
>
>    igt@kms_atomic@plane-overlay-legacy:
>    - {shard-rkl}: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7019/shard-rkl-4/igt@kms_atomic@plane-overlay-legacy.html>
>       (i915#1845 <https://gitlab.freedesktop.org/drm/intel/issues/1845> /
>       i915#4098 <https://gitlab.freedesktop.org/drm/intel/issues/4098>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-rkl-6/igt@kms_atomic@plane-overlay-legacy.html>
>       +10 similar issues
>    -
>
>    igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a2:
>    - shard-glk: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7019/shard-glk2/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a2.html>
>       (i915#79 <https://gitlab.freedesktop.org/drm/intel/issues/79>) ->
>       PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-glk1/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a2.html>
>    -
>
>    igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt:
>    - {shard-rkl}: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7019/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt.html>
>       (i915#1849 <https://gitlab.freedesktop.org/drm/intel/issues/1849> /
>       i915#4098 <https://gitlab.freedesktop.org/drm/intel/issues/4098>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt.html>
>       +10 similar issues
>    -
>
>    igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes:
>    - {shard-rkl}: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7019/shard-rkl-5/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes.html>
>       (i915#1849 <https://gitlab.freedesktop.org/drm/intel/issues/1849> /
>       i915#3558 <https://gitlab.freedesktop.org/drm/intel/issues/3558>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-rkl-6/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes.html>
>       +1 similar issue
>    -
>
>    igt@kms_plane_lowres@tiling-none@pipe-c-hdmi-a-2:
>    - shard-glk: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7019/shard-glk3/igt@kms_plane_lowres@tiling-none@pipe-c-hdmi-a-2.html>
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-glk6/igt@kms_plane_lowres@tiling-none@pipe-c-hdmi-a-2.html>
>       +1 similar issue
>    -
>
>    igt@kms_psr@psr2_sprite_plane_onoff:
>    - shard-iclb: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7019/shard-iclb1/igt@kms_psr@psr2_sprite_plane_onoff.html>
>       (fdo#109441 <https://bugs.freedesktop.org/show_bug.cgi?id=109441>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-iclb2/igt@kms_psr@psr2_sprite_plane_onoff.html>
>    -
>
>    igt@kms_psr@sprite_mmap_cpu:
>    - {shard-rkl}: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7019/shard-rkl-4/igt@kms_psr@sprite_mmap_cpu.html>
>       (i915#1072 <https://gitlab.freedesktop.org/drm/intel/issues/1072>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-rkl-6/igt@kms_psr@sprite_mmap_cpu.html>
>       +1 similar issue
>    -
>
>    igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-b:
>    - {shard-rkl}: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7019/shard-rkl-4/igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-b.html>
>       (i915#4098 <https://gitlab.freedesktop.org/drm/intel/issues/4098>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-rkl-6/igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-b.html>
>    -
>
>    igt@perf_pmu@busy-double-start@vecs0:
>    - {shard-dg1}: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7019/shard-dg1-17/igt@perf_pmu@busy-double-start@vecs0.html>
>       (i915#4349 <https://gitlab.freedesktop.org/drm/intel/issues/4349>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-dg1-13/igt@perf_pmu@busy-double-start@vecs0.html>
>       +2 similar issues
>
> Warnings
>
>    -
>
>    igt@gem_eio@in-flight-suspend:
>    - shard-apl: INCOMPLETE
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7019/shard-apl7/igt@gem_eio@in-flight-suspend.html>
>       -> INCOMPLETE
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-apl3/igt@gem_eio@in-flight-suspend.html>
>       (i915#7112 <https://gitlab.freedesktop.org/drm/intel/issues/7112>)
>    -
>
>    igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf:
>    - shard-iclb: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7019/shard-iclb2/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf.html>
>       (i915#2920 <https://gitlab.freedesktop.org/drm/intel/issues/2920>)
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-iclb5/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf.html>
>       (i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>)
>    -
>
>    igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:
>    - shard-iclb: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7019/shard-iclb1/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html>
>       (i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>) ->
>       SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html>
>       (i915#2920 <https://gitlab.freedesktop.org/drm/intel/issues/2920>)
>
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> Build changes
>
>    - CI: CI-20190529 -> None
>    - IGT: IGT_7019 -> IGTPW_7977
>
> CI-20190529: 20190529
> CI_DRM_12257: b249abef9f86f788e6bacc657ae8eb7743948200 @ git://
> anongit.freedesktop.org/gfx-ci/linux
> IGTPW_7977: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/index.html
> IGT_7019: fdbafce2b74e84739bb1d81223ae6f01fb442980 @
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>

--00000000000019ef6105eb77fd0d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi=C2=A0Lakshminarayana, Can I get a rerun please. Thanks!=
</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=
On Wed, Oct 19, 2022 at 8:18 AM Patchwork &lt;<a href=3D"mailto:patchwork@e=
meril.freedesktop.org">patchwork@emeril.freedesktop.org</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex"><div class=3D"msg-10=
097166255444572">
<u></u>

=20
 =20
 =20
 =20

<div>


<b>Patch Details</b>
<table>
<tbody><tr><td><b>Series:</b></td><td>Refactor Display Outputs to handle MS=
T Connectors.</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/109831/" target=3D"_blank">https://patchwork.freedesktop.org/series/10=
9831/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7977/index.html" target=3D"_blank">https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_7977/index.html</a></td></tr>

</tbody></table>


    <h1>CI Bug Log - changes from IGT_7019_full -&gt; IGTPW_7977_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_7977_full absolutely need to b=
e<br>
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
>
  introduced in IGTPW_7977_full, please notify your bug team to allow them<=
br>
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7977/index.html" target=3D"_blank">https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_7977/index.html</a></p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7977=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7977/shard-apl3/igt@gem_pread@exhaustion.html" target=
=3D"_blank">INCOMPLETE</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@perf:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7977/shard-glk7/igt@i915_selftest@perf.html" target=3D"=
_blank">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@perf@engine_cs:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7977/shard-iclb7/igt@i915_selftest@perf@engine_cs.html"=
 target=3D"_blank">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7977/shard-glk6/igt@kms_flip@2x-flip-vs-suspend-interru=
ptible@ab-hdmi-a1-hdmi-a2.html" target=3D"_blank">INCOMPLETE</a> +3 similar=
 issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-gtt:</p=
>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7977/shard-apl6/igt@kms_frontbuffer_tracking@fbc-1p-pri=
mscrn-pri-shrfb-draw-mmap-gtt.html" target=3D"_blank">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br>
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@i915_selftest@perf@engine_cs:</p>
<ul>
<li>{shard-rkl}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7977/shard-rkl-4/igt@i915_selftest@perf@engine_cs.html"=
 target=3D"_blank">INCOMPLETE</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-bo@all-pipes:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7019/shard-rkl-4/igt@kms_cursor_legacy@torture-bo@all-pipes.html" targ=
et=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_7977/shard-rkl-5/igt@kms_cursor_legacy@torture-bo@all-pipes.htm=
l" target=3D"_blank">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-ts-continuation-suspend:</p>
<ul>
<li>{shard-dg1}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7977/shard-dg1-17/igt@kms_vblank@pipe-d-ts-continuation=
-suspend.html" target=3D"_blank">INCOMPLETE</a> +6 similar issues</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7977_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ccs@ctrl-surf-copy-new-ctx:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7977/shard-iclb5/igt@gem_ccs@ctrl-surf-copy-new-ctx.htm=
l" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/5327" target=3D"_blank">i915#5327</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-sanity-check:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7977/shard-iclb5/igt@gem_create@create-ext-cpu-access-s=
anity-check.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/6335" target=3D"_blank">i915#6335</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@hostile:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7977/shard-snb4/igt@gem_ctx_persistence@hostile.html" t=
arget=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug=
.cgi?id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/1099" target=3D"_blank">i915#1099</a>)=
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-bb-first:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7019/shard-iclb2/igt@gem_exec_balancer@parallel-bb-first.html" target=
=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_7977/shard-iclb3/igt@gem_exec_balancer@parallel-bb-first.html" ta=
rget=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/4525" target=3D"_blank">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-contexts:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7977/shard-iclb8/igt@gem_exec_balancer@parallel-context=
s.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/4525" target=3D"_blank">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-ordering:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7977/shard-iclb2/igt@gem_exec_balancer@parallel-orderin=
g.html" target=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/6117" target=3D"_blank">i915#6117</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7019/shard-apl6/igt@gem_exec_fair@basic-none-solo@rcs0.html" target=3D=
"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_7977/shard-apl1/igt@gem_exec_fair@basic-none-solo@rcs0.html" target=
=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2842" target=3D"_blank">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7977/shard-glk6/igt@gem_exec_fair@basic-throttle@rcs0.h=
tml" target=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/2842" target=3D"_blank">i915#2842</a>) +2 similar issues</=
li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7977/shard-apl7/igt@gem_lmem_swapping@smem-oom.html" tar=
get=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/intel/issues/4613" target=3D"_blank">i915#4613</a>) +=
2 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7977/shard-glk2/igt@gem_lmem_swapping@smem-oom.html" tar=
get=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/intel/issues/4613" target=3D"_blank">i915#4613</a>) +=
2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7977/shard-iclb6/igt@gem_lmem_swapping@verify.html" tar=
get=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/4613" target=3D"_blank">i915#4613</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7977/shard-glk8/igt@gem_pread@exhaustion.html" target=3D=
"_blank">WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/2658" target=3D"_blank">i915#2658</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7977/shard-iclb5/igt@gem_pread@exhaustion.html" target=
=3D"_blank">WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2658" target=3D"_blank">i915#2658</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-stale-buf-execution:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7977/shard-iclb2/igt@gem_pxp@verify-pxp-stale-buf-execu=
tion.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/4270" target=3D"_blank">i915#4270</a>) +3 similar is=
sues</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7977/shard-glk5/igt@gem_render_copy@y-tiled-ccs-to-y-til=
ed-mc-ccs.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedes=
ktop.org/show_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a>) +297 s=
imilar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7977/shard-iclb6/igt@gem_render_copy@y-tiled-ccs-to-y-ti=
led-mc-ccs.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/intel/issues/768" target=3D"_blank">i915#768</a>) +1 simila=
r issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-single-offset:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7977/shard-apl1/igt@gem_softpin@evict-single-offset.html=
" target=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/4171" target=3D"_blank">i915#4171</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7977/shard-glk5/igt@gem_softpin@evict-single-offset.html=
" target=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/4171" target=3D"_blank">i915#4171</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@access-control:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7977/shard-iclb1/igt@gem_userptr_blits@access-control.h=
tml" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/3297" target=3D"_blank">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7977/shard-apl1/igt@gem_workarounds@suspend-resume.html"=
 target=3D"_blank">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/7231" target=3D"_blank">i915#7231</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/intel/issues/7259" target=3D"_blank">i915#725=
9</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7977/shard-glk8/igt@gem_workarounds@suspend-resume.html"=
 target=3D"_blank">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/7231" target=3D"_blank">i915#7231</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/intel/issues/7259" target=3D"_blank">i915#725=
9</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-allocation:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7977/shard-iclb6/igt@gen7_exec_parse@basic-allocation.h=
tml" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D109289" target=3D"_blank">fdo#109289</a>) +4 similar issues=
</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@oacontrol-tracking:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7977/shard-apl8/igt@gen7_exec_parse@oacontrol-tracking.=
html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a>) +356 similar iss=
ues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-without-end:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7977/shard-iclb1/igt@gen9_exec_parse@batch-without-end.=
html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/2856" target=3D"_blank">i915#2856</a>) +3 similar issues<=
/li>
</ul>
</li>
<li>
<p>igt@i915_module_load@resize-bar:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7977/shard-iclb5/igt@i915_module_load@resize-bar.html" =
target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/6412" target=3D"_blank">i915#6412</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pipe_stress@stress-xrgb8888-untiled:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7977/shard-apl8/igt@i915_pipe_stress@stress-xrgb8888-un=
tiled.html" target=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/7036" target=3D"_blank">i915#7036</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7019/shard-iclb2/igt@i915_pm_dc@dc9-dpms.html" target=3D"_blank">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/sh=
ard-iclb3/igt@i915_pm_dc@dc9-dpms.html" target=3D"_blank">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/4281" target=3D"_blank"=
>i915#4281</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7977/shard-apl7/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.h=
tml" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/intel/issues/1937" target=3D"_blank">i915#193=
7</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7977/shard-glk8/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi=
-a.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.or=
g/show_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/intel/issues/1937" target=3D"_blank">i915=
#1937</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@screens-disabled:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7977/shard-iclb1/igt@i915_pm_lpsp@screens-disabled.html=
" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/1902" target=3D"_blank">i915#1902</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@vcs0:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7977/shard-iclb5/igt@i915_pm_rc6_residency@rc6-idle@vcs=
0.html" target=3D"_blank">WARN</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/2684" target=3D"_blank">i915#2684</a>) +3 similar issue=
s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7977/shard-iclb8/igt@i915_pm_rpm@dpms-non-lpsp.html" ta=
rget=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D110892" target=3D"_blank">fdo#110892</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-pc8-residency-stress:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7977/shard-iclb5/igt@i915_pm_rpm@modeset-pc8-residency-=
stress.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedeskto=
p.org/show_bug.cgi?id=3D109293" target=3D"_blank">fdo#109293</a> / <a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109506" target=3D"_blank=
">fdo#109506</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_timelines:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7977/shard-iclb3/igt@i915_selftest@live@gt_timelines.ht=
ml" target=3D"_blank">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/7222" target=3D"_blank">i915#7222</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7977/shard-apl8/igt@i915_suspend@basic-s3-without-i915.=
html" target=3D"_blank">INCOMPLETE</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/4817" target=3D"_blank">i915#4817</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@forcewake:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7977/shard-glk3/igt@i915_suspend@forcewake.html" target=
=3D"_blank">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/4817" target=3D"_blank">i915#4817</a>)</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7977/shard-apl7/igt@i915_suspend@forcewake.html" target=
=3D"_blank">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/4817" target=3D"_blank">i915#4817</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/7228" target=3D"_blank">i915#7228</a>)<=
/p>
</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7977/shard-iclb7/igt@kms_atomic@plane-primary-overlay-m=
utable-zpos.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/404" target=3D"_blank">i915#404</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7977/shard-iclb1/igt@kms_big_fb@4-tiled-max-hw-stride-6=
4bpp-rotate-0-async-flip.html" target=3D"_blank">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/intel/issues/5286" target=3D"_blank">i915#528=
6</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7977/shard-iclb3/igt@kms_big_fb@y-tiled-64bpp-rotate-90=
.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D110725" target=3D"_blank">fdo#110725</a> / <a href=3D"htt=
ps://bugs.freedesktop.org/show_bug.cgi?id=3D111614" target=3D"_blank">fdo#1=
11614</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7977/shard-iclb7/igt@kms_big_fb@yf-tiled-8bpp-rotate-90=
.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D110723" target=3D"_blank">fdo#110723</a>) +5 similar issu=
es</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7977/shard-iclb2/igt@kms_ccs@pipe-b-bad-rotation-90-y_t=
iled_gen12_mc_ccs.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs=
.freedesktop.org/show_bug.cgi?id=3D109278" target=3D"_blank">fdo#109278</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3886" target=
=3D"_blank">i915#3886</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-primary-basic-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7977/shard-apl6/igt@kms_ccs@pipe-c-crc-primary-basic-y_=
tiled_gen12_mc_ccs.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bug=
s.freedesktop.org/show_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3886" target=
=3D"_blank">i915#3886</a>) +23 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7977/shard-glk1/igt@kms_ccs@pipe-c-crc-sprite-planes-ba=
sic-y_tiled_gen12_rc_ccs_cc.html" target=3D"_blank">SKIP</a> (<a href=3D"ht=
tps://bugs.freedesktop.org/show_bug.cgi?id=3D109271" target=3D"_blank">fdo#=
109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/388=
6" target=3D"_blank">i915#3886</a>) +20 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-aux-stride-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7977/shard-iclb6/igt@kms_ccs@pipe-d-bad-aux-stride-y_ti=
led_gen12_mc_ccs.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.=
freedesktop.org/show_bug.cgi?id=3D109278" target=3D"_blank">fdo#109278</a>)=
 +28 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7977/shard-iclb5/igt@kms_cdclk@mode-transition.html" ta=
rget=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/3742" target=3D"_blank">i915#3742</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@common-hpd-after-suspend:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7977/shard-snb7/igt@kms_chamelium@common-hpd-after-susp=
end.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.o=
rg/show_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D"=
https://bugs.freedesktop.org/show_bug.cgi?id=3D111827" target=3D"_blank">fd=
o#111827</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-crc-multiple:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7977/shard-glk5/igt@kms_chamelium@hdmi-crc-multiple.htm=
l" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show=
_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D"https:/=
/bugs.freedesktop.org/show_bug.cgi?id=3D111827" target=3D"_blank">fdo#11182=
7</a>) +14 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7977/shard-apl1/igt@kms_chamelium@hdmi-hpd-for-each-pip=
e.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org=
/show_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D"ht=
tps://bugs.freedesktop.org/show_bug.cgi?id=3D111827" target=3D"_blank">fdo#=
111827</a>) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@ctm-0-75:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7977/shard-iclb3/igt@kms_color_chamelium@ctm-0-75.html"=
 target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D109284" target=3D"_blank">fdo#109284</a> / <a href=3D"https://b=
ugs.freedesktop.org/show_bug.cgi?id=3D111827" target=3D"_blank">fdo#111827<=
/a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7977/shard-iclb8/igt@kms_content_protection@atomic.html=
" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/7118" target=3D"_blank">i915#7118</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7977/shard-iclb6/igt@kms_content_protection@dp-mst-lic-=
type-0.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/3116" target=3D"_blank">i915#3116</a>) +1 similar =
issue</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-1:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7977/shard-apl1/igt@kms_content_protection@srm@pipe-a-d=
p-1.html" target=3D"_blank">INCOMPLETE</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/7121" target=3D"_blank">i915#7121</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/7173" target=3D"_blank"=
>i915#7173</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7977/shard-iclb8/igt@kms_cursor_crc@cursor-onscreen-512=
x170.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.=
org/show_bug.cgi?id=3D109279" target=3D"_blank">fdo#109279</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/3359" target=3D"_blank">i9=
15#3359</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-1:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7977/shard-apl2/igt@kms_cursor_crc@cursor-suspend@pipe-=
a-dp-1.html" target=3D"_blank">INCOMPLETE</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/7242" target=3D"_blank">i915#7242</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7977/shard-glk7/igt@kms_cursor_crc@cursor-suspend@pipe-=
a-hdmi-a-1.html" target=3D"_blank">INCOMPLETE</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/intel/issues/7085" target=3D"_blank">i915#7085</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7977/shard-iclb7/igt@kms_cursor_legacy@basic-busy-flip-=
before-cursor.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/intel/issues/4103" target=3D"_blank">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7977/shard-iclb1/igt@kms_dp_tiled_display@basic-test-pa=
ttern-with-chamelium.html" target=3D"_blank">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/3528" target=3D"_blank">i915#3528</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7977/shard-glk6/igt@kms_dsc@dsc-with-bpc-formats.html" t=
arget=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug=
.cgi?id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/7205" target=3D"_blank">i915#7205</a>)=
</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7977/shard-apl6/igt@kms_dsc@dsc-with-bpc-formats.html" t=
arget=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug=
.cgi?id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/7205" target=3D"_blank">i915#7205</a>)=
</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7977/shard-apl2/igt@kms_fbcon_fbt@fbc-suspend.html" tar=
get=3D"_blank">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/4939" target=3D"_blank">i915#4939</a>) +2 similar issues</li=
>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7977/shard-iclb3/igt@kms_flip@2x-flip-vs-absolute-wf_vb=
lank-interruptible.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bug=
s.freedesktop.org/show_bug.cgi?id=3D109274" target=3D"_blank">fdo#109274</a=
>) +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing@pipe-a-valid-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7977/shard-iclb6/igt@kms_flip_scaled_crc@flip-32bpp-4ti=
le-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html" target=3D"_bl=
ank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2=
587" target=3D"_blank">i915#2587</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/2672" target=3D"_blank">i915#2672</a>) +3 similar is=
sues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a=
-default-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7977/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-4ti=
le-to-16bpp-4tile-upscaling@pipe-a-default-mode.html" target=3D"_blank">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2672" tar=
get=3D"_blank">i915#2672</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing@pipe-a-default-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7977/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-yti=
le-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html" target=3D"_=
blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/2672" target=3D"_blank">i915#2672</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/3555" target=3D"_blank">i915#3555</a>) +1 similar =
issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7977/shard-iclb8/igt@kms_frontbuffer_tracking@psr-2p-sc=
ndscrn-indfb-plflip-blt.html" target=3D"_blank">SKIP</a> (<a href=3D"https:=
//bugs.freedesktop.org/show_bug.cgi?id=3D109280" target=3D"_blank">fdo#1092=
80</a>) +41 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7977/shard-iclb7/igt@kms_multipipe_modeset@basic-max-pi=
pe-crc-check.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/1839" target=3D"_blank">i915#1839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-dp-1:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7977/shard-apl3/igt@kms_pipe_crc_basic@suspend-read-crc=
@pipe-a-dp-1.html" target=3D"_blank">INCOMPLETE</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/7074" target=3D"_blank">i915#7074</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-max@pipe-b-dp-1:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7977/shard-apl3/igt@kms_plane_alpha_blend@constant-alph=
a-max@pipe-b-dp-1.html" target=3D"_blank">FAIL</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/4573" target=3D"_blank">i915#4573</a>) =
+5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7977/shard-glk5/igt@kms_plane_alpha_blend@constant-alph=
a-max@pipe-c-hdmi-a-1.html" target=3D"_blank">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/4573" target=3D"_blank">i915#4573</=
a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-5@pipe-c-e=
dp-1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7977/shard-iclb5/igt@kms_plane_scaling@plane-downscale-=
with-modifiers-factor-0-5@pipe-c-edp-1.html" target=3D"_blank">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5176" target=3D"_b=
lank">i915#5176</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-modeset-hybrid:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7977/shard-iclb2/igt@kms_prime@basic-modeset-hybrid.htm=
l" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/6524" target=3D"_blank">i915#6524</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7977/shard-iclb6/igt@kms_psr2_sf@cursor-plane-move-cont=
inuous-exceed-sf.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/intel/issues/658" target=3D"_blank">i915#658</a>)</li=
>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-update-sf:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7977/shard-iclb2/igt@kms_psr2_sf@cursor-plane-update-sf=
.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/2920" target=3D"_blank">i915#2920</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@plane-move-sf-dmg-area:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7977/shard-apl1/igt@kms_psr2_sf@plane-move-sf-dmg-area.h=
tml" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/intel/issues/658" target=3D"_blank">i915#658<=
/a>) +3 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7977/shard-glk5/igt@kms_psr2_sf@plane-move-sf-dmg-area.h=
tml" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/intel/issues/658" target=3D"_blank">i915#658<=
/a>) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7977/shard-iclb8/igt@kms_psr2_sf@primary-plane-update-s=
f-dmg-area.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freede=
sktop.org/show_bug.cgi?id=3D111068" target=3D"_blank">fdo#111068</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/658" target=3D"_blan=
k">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_gtt:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7019/shard-iclb2/igt@kms_psr@psr2_primary_mmap_gtt.html" target=3D"_bl=
ank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_7977/shard-iclb6/igt@kms_psr@psr2_primary_mmap_gtt.html" target=3D"_blan=
k">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1094=
41" target=3D"_blank">fdo#109441</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_blt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7977/shard-iclb6/igt@kms_psr@psr2_sprite_blt.html" targ=
et=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109441" target=3D"_blank">fdo#109441</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7977/shard-iclb1/igt@kms_rotation_crc@primary-4-tiled-r=
eflect-x-0.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/intel/issues/5289" target=3D"_blank">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7977/shard-iclb6/igt@kms_setmode@basic-clone-single-crt=
c.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/3555" target=3D"_blank">i915#3555</a>) +5 similar issue=
s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7977/shard-snb2/igt@kms_vblank@pipe-a-ts-continuation-dp=
ms-suspend.html" target=3D"_blank">FAIL</a> (<a href=3D"https://bugs.freede=
sktop.org/show_bug.cgi?id=3D103375" target=3D"_blank">fdo#103375</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7977/shard-glk5/igt@kms_vblank@pipe-a-ts-continuation-dp=
ms-suspend.html" target=3D"_blank">INCOMPLETE</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/intel/issues/7251" target=3D"_blank">i915#7251</a>) +=
1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-query-busy-hang:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7977/shard-snb4/igt@kms_vblank@pipe-c-query-busy-hang.h=
tml" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a>) +176 similar issu=
es</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7977/shard-apl2/igt@kms_writeback@writeback-check-outpu=
t.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org=
/show_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/2437" target=3D"_blank">i915#=
2437</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7977/shard-glk6/igt@kms_writeback@writeback-fb-id.html"=
 target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/2437" target=3D"_blank">i915#2437</a=
>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@busy:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7977/shard-glk6/igt@sysfs_clients@busy.html" target=3D"=
_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/2994" target=3D"_blank">i915#2994</a>) +4 sim=
ilar issues</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@pidname:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7977/shard-apl8/igt@sysfs_clients@pidname.html" target=
=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/intel/issues/2994" target=3D"_blank">i915#2994</a>) +4 s=
imilar issues</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@split-25:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7977/shard-iclb8/igt@sysfs_clients@split-25.html" targe=
t=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/2994" target=3D"_blank">i915#2994</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@tools_test@sysfs_l3_parity:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7977/shard-iclb5/igt@tools_test@sysfs_l3_parity.html" t=
arget=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug=
.cgi?id=3D109307" target=3D"_blank">fdo#109307</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@api_intel_bb@object-reloc-keep-cache:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7019/shard-rkl-6/igt@api_intel_bb@object-reloc-keep-cache.html" target=
=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/3281" target=3D"_blank">i915#3281</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-rkl-5/igt@api_intel_bb@object-=
reloc-keep-cache.html" target=3D"_blank">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7019/shard-rkl-4/igt@fbdev@nullptr.html" target=3D"_blank">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2582" target=3D"_=
blank">i915#2582</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_7977/shard-rkl-2/igt@fbdev@nullptr.html" target=3D"_blank">PASS<=
/a></li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@hang:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7019/shard-rkl-5/igt@gem_ctx_persistence@hang.html" target=3D"_blank">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6252" =
target=3D"_blank">i915#6252</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_7977/shard-rkl-6/igt@gem_ctx_persistence@hang.html" t=
arget=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-in-fence:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7019/shard-iclb7/igt@gem_exec_balancer@parallel-keep-in-fence.html" ta=
rget=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/4525" target=3D"_blank">i915#4525</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-iclb1/igt@gem_exec_balance=
r@parallel-keep-in-fence.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7019/shard-glk2/igt@gem_exec_fair@basic-none@rcs0.html" target=3D"_bla=
nk">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/28=
42" target=3D"_blank">i915#2842</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_7977/shard-glk5/igt@gem_exec_fair@basic-none@rcs0=
.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_readwrite@beyond-eob:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7019/shard-rkl-1/igt@gem_readwrite@beyond-eob.html" target=3D"_blank">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3282" =
target=3D"_blank">i915#3282</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_7977/shard-rkl-5/igt@gem_readwrite@beyond-eob.html" t=
arget=3D"_blank">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_hangman@gt-engine-error@bcs0:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7019/shard-rkl-5/igt@i915_hangman@gt-engine-error@bcs0.html" target=3D=
"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/6258" target=3D"_blank">i915#6258</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_7977/shard-rkl-1/igt@i915_hangman@gt-engine-=
error@bcs0.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_backlight@bad-brightness:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7019/shard-rkl-4/igt@i915_pm_backlight@bad-brightness.html" target=3D"=
_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/3012" target=3D"_blank">i915#3012</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_7977/shard-rkl-6/igt@i915_pm_backlight@bad-br=
ightness.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@pm-tiling:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7019/shard-rkl-3/igt@i915_pm_rpm@pm-tiling.html" target=3D"_blank">SKI=
P</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109308" ta=
rget=3D"_blank">fdo#109308</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7977/shard-rkl-6/igt@i915_pm_rpm@pm-tiling.html" targe=
t=3D"_blank">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@engine-order:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7019/shard-rkl-5/igt@i915_pm_rps@engine-order.html" target=3D"_blank">=
FAIL</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_79=
77/shard-rkl-2/igt@i915_pm_rps@engine-order.html" target=3D"_blank">PASS</a=
></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@sanitycheck:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7019/shard-iclb2/igt@i915_selftest@live@sanitycheck.html" target=3D"_b=
lank">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/7222" target=3D"_blank">i915#7222</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-iclb3/igt@i915_selftest@live@s=
anitycheck.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-overlay-legacy:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7019/shard-rkl-4/igt@kms_atomic@plane-overlay-legacy.html" target=3D"_=
blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/1845" target=3D"_blank">i915#1845</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/4098" target=3D"_blank">i915#4098</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-rkl-6/igt@k=
ms_atomic@plane-overlay-legacy.html" target=3D"_blank">PASS</a> +10 similar=
 issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7019/shard-glk2/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hd=
mi-a2.html" target=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/79" target=3D"_blank">i915#79</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-glk1/igt@kms_fli=
p@flip-vs-expired-vblank-interruptible@c-hdmi-a2.html" target=3D"_blank">PA=
SS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7019/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-=
gtt.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/1849" target=3D"_blank">i915#1849</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/4098" target=3D"_blank">i915#=
4098</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
977/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt.ht=
ml" target=3D"_blank">PASS</a> +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7019/shard-rkl-5/igt@kms_plane@plane-panning-bottom-right-suspend@pipe=
-a-planes.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/1849" target=3D"_blank">i915#1849</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/3558" target=3D"_blank"=
>i915#3558</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_7977/shard-rkl-6/igt@kms_plane@plane-panning-bottom-right-suspend@pipe=
-a-planes.html" target=3D"_blank">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-none@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7019/shard-glk3/igt@kms_plane_lowres@tiling-none@pipe-c-hdmi-a-2.html"=
 target=3D"_blank">FAIL</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_7977/shard-glk6/igt@kms_plane_lowres@tiling-none@pipe-c-hd=
mi-a-2.html" target=3D"_blank">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_onoff:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7019/shard-iclb1/igt@kms_psr@psr2_sprite_plane_onoff.html" target=3D"_=
blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109441" target=3D"_blank">fdo#109441</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_7977/shard-iclb2/igt@kms_psr@psr2_sprite_pla=
ne_onoff.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@sprite_mmap_cpu:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7019/shard-rkl-4/igt@kms_psr@sprite_mmap_cpu.html" target=3D"_blank">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1072" t=
arget=3D"_blank">i915#1072</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7977/shard-rkl-6/igt@kms_psr@sprite_mmap_cpu.html" tar=
get=3D"_blank">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-b:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7019/shard-rkl-4/igt@kms_universal_plane@universal-plane-pageflip-wind=
owed-pipe-b.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/4098" target=3D"_blank">i915#4098</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-rkl-6/=
igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-b.html" targ=
et=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@vecs0:</p>
<ul>
<li>{shard-dg1}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7019/shard-dg1-17/igt@perf_pmu@busy-double-start@vecs0.html" target=3D=
"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/4349" target=3D"_blank">i915#4349</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_7977/shard-dg1-13/igt@perf_pmu@busy-double-s=
tart@vecs0.html" target=3D"_blank">PASS</a> +2 similar issues</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_eio@in-flight-suspend:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7019/shard-apl7/igt@gem_eio@in-flight-suspend.html" target=3D"_blank">=
INCOMPLETE</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_7977/shard-apl3/igt@gem_eio@in-flight-suspend.html" target=3D"_blank">I=
NCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/7=
112" target=3D"_blank">i915#7112</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7019/shard-iclb2/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-=
sf.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/2920" target=3D"_blank">i915#2920</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-iclb5/igt@kms=
_psr2_sf@overlay-plane-move-continuous-exceed-sf.html" target=3D"_blank">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/658" tar=
get=3D"_blank">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7019/shard-iclb1/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-=
fb.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/658" target=3D"_blank">i915#658</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/shard-iclb2/igt@kms_psr=
2_sf@primary-plane-update-sf-dmg-area-big-fb.html" target=3D"_blank">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2920" target=
=3D"_blank">i915#2920</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br>
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7019 -&gt; IGTPW_7977</li>
</ul>
<p>CI-20190529: 20190529<br>
  CI_DRM_12257: b249abef9f86f788e6bacc657ae8eb7743948200 @ git://<a href=3D=
"http://anongit.freedesktop.org/gfx-ci/linux" target=3D"_blank">anongit.fre=
edesktop.org/gfx-ci/linux</a><br>
  IGTPW_7977: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_797=
7/index.html" target=3D"_blank">https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_7977/index.html</a><br>
  IGT_7019: fdbafce2b74e84739bb1d81223ae6f01fb442980 @ <a href=3D"https://g=
itlab.freedesktop.org/drm/igt-gpu-tools.git" target=3D"_blank">https://gitl=
ab.freedesktop.org/drm/igt-gpu-tools.git</a></p>

</div>

</div></blockquote></div>

--00000000000019ef6105eb77fd0d--
