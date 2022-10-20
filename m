Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCA9F10F037
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Oct 2022 14:14:13 +0000 (UTC)
Received: by mail-yb1-xb2a.google.com with SMTP id t186so24755162yba.12
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Oct 2022 07:14:13 -0700 (PDT)
MIME-Version: 1.0
References: <20221019174217.201103-1-markyacoub@chromium.org>
 <166622451194.8590.8953923487857019375@emeril.freedesktop.org>
In-Reply-To: <166622451194.8590.8953923487857019375@emeril.freedesktop.org>
From: Mark Yacoub <markyacoub@chromium.org>
Date: Thu, 20 Oct 2022 10:14:01 -0400
Message-ID: <CAJUqKUr3JskydHhdUg3Ybm6yag6Ln7AWFgDOmcJhCCxEkGgivA@mail.gmail.com>
To: "Vudum, Lakshminarayana" <lakshminarayana.vudum@intel.com>
Content-Type: multipart/alternative; boundary="0000000000008b9bc105eb77f09f"
Subject: Re: [igt-dev]
	=?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgY2hhbWVs?=
	=?utf-8?q?ium=3A_Get_connector_After_plug_to_get_EDID?=
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

--0000000000008b9bc105eb77f09f
Content-Type: text/plain; charset="UTF-8"

Hi Lakshminarayana, this looks irrelevant. Can I get a rerun please? thanks!

On Wed, Oct 19, 2022 at 8:08 PM Patchwork <patchwork@emeril.freedesktop.org>
wrote:

> *Patch Details*
> *Series:* chamelium: Get connector After plug to get EDID
> *URL:* https://patchwork.freedesktop.org/series/109903/
> *State:* failure
> *Details:* https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/index.html CI
> Bug Log - changes from IGT_7020_full -> IGTPW_7986_full Summary
>
> *FAILURE*
>
> Serious unknown changes coming with IGTPW_7986_full absolutely need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_7986_full, please notify your bug team to allow them
> to document this new failure mode, which will reduce false positives in CI.
>
> External URL:
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/index.html
> Participating hosts (9 -> 9)
>
> No changes in participating hosts
> Possible new issues
>
> Here are the unknown changes that may have been introduced in
> IGTPW_7986_full:
> IGT changes Possible regressions
>
>    - igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
>       - shard-iclb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7020/shard-iclb1/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-iclb7/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html>
>
> Known issues
>
> Here are the changes found in IGTPW_7986_full that come from known issues:
> IGT changes Issues hit
>
>    -
>
>    igt@gem_ccs@ctrl-surf-copy:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-tglb2/igt@gem_ccs@ctrl-surf-copy.html>
>       (i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555> /
>       i915#5325 <https://gitlab.freedesktop.org/drm/intel/issues/5325>)
>    -
>
>    igt@gem_ccs@suspend-resume:
>    -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-iclb3/igt@gem_ccs@suspend-resume.html>
>       (i915#5327 <https://gitlab.freedesktop.org/drm/intel/issues/5327>)
>       +1 similar issue
>       -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-tglb7/igt@gem_ccs@suspend-resume.html>
>       (i915#5325 <https://gitlab.freedesktop.org/drm/intel/issues/5325>)
>       -
>
>    igt@gem_create@create-ext-cpu-access-sanity-check:
>    -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-tglb3/igt@gem_create@create-ext-cpu-access-sanity-check.html>
>       (i915#6335 <https://gitlab.freedesktop.org/drm/intel/issues/6335>)
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-iclb3/igt@gem_create@create-ext-cpu-access-sanity-check.html>
>       (i915#6335 <https://gitlab.freedesktop.org/drm/intel/issues/6335>)
>       -
>
>    igt@gem_ctx_isolation@preservation-s3@vcs0:
>    - shard-apl: NOTRUN -> DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-apl1/igt@gem_ctx_isolation@preservation-s3@vcs0.html>
>       (i915#180 <https://gitlab.freedesktop.org/drm/intel/issues/180>)
>    -
>
>    igt@gem_ctx_persistence@engines-mixed-process:
>    - shard-snb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-snb6/igt@gem_ctx_persistence@engines-mixed-process.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#1099 <https://gitlab.freedesktop.org/drm/intel/issues/1099>)
>    -
>
>    igt@gem_exec_balancer@parallel-out-fence:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-iclb5/igt@gem_exec_balancer@parallel-out-fence.html>
>       (i915#4525 <https://gitlab.freedesktop.org/drm/intel/issues/4525>)
>    -
>
>    igt@gem_exec_fair@basic-none-rrul@rcs0:
>    -
>
>       shard-glk: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-glk6/igt@gem_exec_fair@basic-none-rrul@rcs0.html>
>       (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
>       +1 similar issue
>       -
>
>       shard-tglb: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-tglb1/igt@gem_exec_fair@basic-none-rrul@rcs0.html>
>       (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
>       -
>
>    igt@gem_exec_fair@basic-none@vcs1:
>    - shard-iclb: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-iclb1/igt@gem_exec_fair@basic-none@vcs1.html>
>       (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
>       +1 similar issue
>    -
>
>    igt@gem_exec_fair@basic-pace-solo@rcs0:
>    - shard-glk: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7020/shard-glk7/igt@gem_exec_fair@basic-pace-solo@rcs0.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-glk1/igt@gem_exec_fair@basic-pace-solo@rcs0.html>
>       (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
>    -
>
>    igt@gem_exec_whisper@basic-queues:
>    - shard-snb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-snb4/igt@gem_exec_whisper@basic-queues.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>)
>       +119 similar issues
>    -
>
>    igt@gem_lmem_swapping@heavy-multi:
>    -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-iclb3/igt@gem_lmem_swapping@heavy-multi.html>
>       (i915#4613 <https://gitlab.freedesktop.org/drm/intel/issues/4613>)
>       -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-tglb7/igt@gem_lmem_swapping@heavy-multi.html>
>       (i915#4613 <https://gitlab.freedesktop.org/drm/intel/issues/4613>)
>       -
>
>    igt@gem_lmem_swapping@random:
>    - shard-glk: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-glk3/igt@gem_lmem_swapping@random.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#4613 <https://gitlab.freedesktop.org/drm/intel/issues/4613>)
>       +2 similar issues
>    -
>
>    igt@gem_pxp@create-regular-context-2:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-tglb5/igt@gem_pxp@create-regular-context-2.html>
>       (i915#4270 <https://gitlab.freedesktop.org/drm/intel/issues/4270>)
>       +2 similar issues
>    -
>
>    igt@gem_pxp@verify-pxp-stale-buf-execution:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-iclb8/igt@gem_pxp@verify-pxp-stale-buf-execution.html>
>       (i915#4270 <https://gitlab.freedesktop.org/drm/intel/issues/4270>)
>       +2 similar issues
>    -
>
>    igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs:
>    - shard-glk: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-glk6/igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>)
>       +150 similar issues
>    -
>
>    igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-iclb3/igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs.html>
>       (i915#768 <https://gitlab.freedesktop.org/drm/intel/issues/768>) +1
>       similar issue
>    -
>
>    igt@gem_userptr_blits@dmabuf-sync:
>    - shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-apl6/igt@gem_userptr_blits@dmabuf-sync.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#3323 <https://gitlab.freedesktop.org/drm/intel/issues/3323>)
>    -
>
>    igt@gem_userptr_blits@unsync-overlap:
>    -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-iclb7/igt@gem_userptr_blits@unsync-overlap.html>
>       (i915#3297 <https://gitlab.freedesktop.org/drm/intel/issues/3297>)
>       -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-tglb2/igt@gem_userptr_blits@unsync-overlap.html>
>       (i915#3297 <https://gitlab.freedesktop.org/drm/intel/issues/3297>)
>       -
>
>    igt@gem_userptr_blits@vma-merge:
>    -
>
>       shard-apl: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-apl1/igt@gem_userptr_blits@vma-merge.html>
>       (i915#3318 <https://gitlab.freedesktop.org/drm/intel/issues/3318>)
>       -
>
>       shard-snb: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-snb7/igt@gem_userptr_blits@vma-merge.html>
>       (i915#2724 <https://gitlab.freedesktop.org/drm/intel/issues/2724>)
>       -
>
>       shard-tglb: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-tglb2/igt@gem_userptr_blits@vma-merge.html>
>       (i915#3318 <https://gitlab.freedesktop.org/drm/intel/issues/3318>)
>       -
>
>       shard-glk: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-glk3/igt@gem_userptr_blits@vma-merge.html>
>       (i915#3318 <https://gitlab.freedesktop.org/drm/intel/issues/3318>)
>       -
>
>       shard-iclb: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-iclb7/igt@gem_userptr_blits@vma-merge.html>
>       (i915#3318 <https://gitlab.freedesktop.org/drm/intel/issues/3318>)
>       -
>
>    igt@gen7_exec_parse@basic-rejected:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-iclb1/igt@gen7_exec_parse@basic-rejected.html>
>       (fdo#109289 <https://bugs.freedesktop.org/show_bug.cgi?id=109289>)
>       +3 similar issues
>    -
>
>    igt@gen9_exec_parse@allowed-all:
>    - shard-glk: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7020/shard-glk7/igt@gen9_exec_parse@allowed-all.html>
>       -> DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-glk1/igt@gen9_exec_parse@allowed-all.html>
>       (i915#5566 <https://gitlab.freedesktop.org/drm/intel/issues/5566> /
>       i915#716 <https://gitlab.freedesktop.org/drm/intel/issues/716>)
>    -
>
>    igt@gen9_exec_parse@bb-start-param:
>    -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-iclb7/igt@gen9_exec_parse@bb-start-param.html>
>       (i915#2856 <https://gitlab.freedesktop.org/drm/intel/issues/2856>)
>       +1 similar issue
>       -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-tglb5/igt@gen9_exec_parse@bb-start-param.html>
>       (i915#2527 <https://gitlab.freedesktop.org/drm/intel/issues/2527> /
>       i915#2856 <https://gitlab.freedesktop.org/drm/intel/issues/2856>)
>       -
>
>    igt@i915_module_load@resize-bar:
>    -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-iclb8/igt@i915_module_load@resize-bar.html>
>       (i915#6412 <https://gitlab.freedesktop.org/drm/intel/issues/6412>)
>       -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-tglb3/igt@i915_module_load@resize-bar.html>
>       (i915#6412 <https://gitlab.freedesktop.org/drm/intel/issues/6412>)
>       -
>
>    igt@i915_pipe_stress@stress-xrgb8888-ytiled:
>    - shard-apl: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-apl6/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html>
>       (i915#7036 <https://gitlab.freedesktop.org/drm/intel/issues/7036>)
>    -
>
>    igt@i915_pm_dc@dc6-dpms:
>    - shard-iclb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7020/shard-iclb8/igt@i915_pm_dc@dc6-dpms.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-iclb3/igt@i915_pm_dc@dc6-dpms.html>
>       (i915#3989 <https://gitlab.freedesktop.org/drm/intel/issues/3989> /
>       i915#454 <https://gitlab.freedesktop.org/drm/intel/issues/454>)
>    -
>
>    igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:
>    - shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-apl6/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#1937 <https://gitlab.freedesktop.org/drm/intel/issues/1937>)
>    -
>
>    igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:
>    - shard-glk: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-glk6/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#1937 <https://gitlab.freedesktop.org/drm/intel/issues/1937>)
>    -
>
>    igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-tglb3/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html>
>       (fdo#111644 <https://bugs.freedesktop.org/show_bug.cgi?id=111644> /
>       i915#1397 <https://gitlab.freedesktop.org/drm/intel/issues/1397>)
>       +1 similar issue
>    -
>
>    igt@i915_pm_rpm@gem-execbuf-stress-pc8:
>    -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-iclb5/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html>
>       (fdo#109293 <https://bugs.freedesktop.org/show_bug.cgi?id=109293> /
>       fdo#109506 <https://bugs.freedesktop.org/show_bug.cgi?id=109506>)
>       -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-tglb1/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html>
>       (fdo#109506 <https://bugs.freedesktop.org/show_bug.cgi?id=109506>)
>       -
>
>    igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-iclb3/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html>
>       (fdo#110892 <https://bugs.freedesktop.org/show_bug.cgi?id=110892>)
>       +1 similar issue
>    -
>
>    igt@i915_selftest@mock@requests:
>    -
>
>       shard-apl: NOTRUN -> INCOMPLETE
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-apl1/igt@i915_selftest@mock@requests.html>
>       (i915#7226 <https://gitlab.freedesktop.org/drm/intel/issues/7226>)
>       -
>
>       shard-snb: NOTRUN -> INCOMPLETE
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-snb7/igt@i915_selftest@mock@requests.html>
>       (i915#7226 <https://gitlab.freedesktop.org/drm/intel/issues/7226>)
>       -
>
>       shard-iclb: NOTRUN -> INCOMPLETE
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-iclb5/igt@i915_selftest@mock@requests.html>
>       (i915#7267 <https://gitlab.freedesktop.org/drm/intel/issues/7267>)
>       -
>
>    igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-tglb2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html>
>       (i915#5286 <https://gitlab.freedesktop.org/drm/intel/issues/5286>)
>       +5 similar issues
>    -
>
>    igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-iclb7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html>
>       (i915#5286 <https://gitlab.freedesktop.org/drm/intel/issues/5286>)
>       +6 similar issues
>    -
>
>    igt@kms_big_fb@linear-64bpp-rotate-90:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-tglb5/igt@kms_big_fb@linear-64bpp-rotate-90.html>
>       (fdo#111614 <https://bugs.freedesktop.org/show_bug.cgi?id=111614>)
>       +2 similar issues
>    -
>
>    igt@kms_big_fb@x-tiled-8bpp-rotate-270:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-iclb1/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html>
>       (fdo#110725 <https://bugs.freedesktop.org/show_bug.cgi?id=110725> /
>       fdo#111614 <https://bugs.freedesktop.org/show_bug.cgi?id=111614>)
>       +2 similar issues
>    -
>
>    igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-tglb2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html>
>       (fdo#111615 <https://bugs.freedesktop.org/show_bug.cgi?id=111615>)
>       +3 similar issues
>    -
>
>    igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-iclb1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html>
>       (fdo#110723 <https://bugs.freedesktop.org/show_bug.cgi?id=110723>)
>       +1 similar issue
>    -
>
>    igt@kms_big_joiner@2x-modeset:
>    -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-tglb7/igt@kms_big_joiner@2x-modeset.html>
>       (i915#2705 <https://gitlab.freedesktop.org/drm/intel/issues/2705>)
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-iclb8/igt@kms_big_joiner@2x-modeset.html>
>       (i915#2705 <https://gitlab.freedesktop.org/drm/intel/issues/2705>)
>       -
>
>    igt@kms_ccs@pipe-b-bad-pixel-format-4_tiled_dg2_rc_ccs_cc:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-tglb7/igt@kms_ccs@pipe-b-bad-pixel-format-4_tiled_dg2_rc_ccs_cc.html>
>       (i915#3689 <https://gitlab.freedesktop.org/drm/intel/issues/3689> /
>       i915#6095 <https://gitlab.freedesktop.org/drm/intel/issues/6095>)
>       +4 similar issues
>    -
>
>    igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_mc_ccs:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-tglb2/igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html>
>       (i915#3689 <https://gitlab.freedesktop.org/drm/intel/issues/3689> /
>       i915#3886 <https://gitlab.freedesktop.org/drm/intel/issues/3886>)
>    -
>
>    igt@kms_ccs@pipe-c-crc-primary-basic-y_tiled_gen12_mc_ccs:
>    - shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-apl7/igt@kms_ccs@pipe-c-crc-primary-basic-y_tiled_gen12_mc_ccs.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#3886 <https://gitlab.freedesktop.org/drm/intel/issues/3886>)
>       +10 similar issues
>    -
>
>    igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-iclb8/igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc.html>
>       (fdo#109278 <https://bugs.freedesktop.org/show_bug.cgi?id=109278> /
>       i915#3886 <https://gitlab.freedesktop.org/drm/intel/issues/3886>)
>       +6 similar issues
>    -
>
>    igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc:
>    - shard-glk: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-glk7/igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#3886 <https://gitlab.freedesktop.org/drm/intel/issues/3886>)
>       +7 similar issues
>    -
>
>    igt@kms_ccs@pipe-d-bad-aux-stride-y_tiled_ccs:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-tglb1/igt@kms_ccs@pipe-d-bad-aux-stride-y_tiled_ccs.html>
>       (i915#3689 <https://gitlab.freedesktop.org/drm/intel/issues/3689>)
>       +2 similar issues
>    -
>
>    igt@kms_ccs@pipe-d-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs_cc:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-tglb3/igt@kms_ccs@pipe-d-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs_cc.html>
>       (i915#6095 <https://gitlab.freedesktop.org/drm/intel/issues/6095>)
>       +3 similar issues
>    -
>
>    igt@kms_ccs@pipe-d-random-ccs-data-yf_tiled_ccs:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-tglb2/igt@kms_ccs@pipe-d-random-ccs-data-yf_tiled_ccs.html>
>       (fdo#111615 <https://bugs.freedesktop.org/show_bug.cgi?id=111615> /
>       i915#3689 <https://gitlab.freedesktop.org/drm/intel/issues/3689>)
>    -
>
>    igt@kms_chamelium@dp-crc-single:
>    - shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-apl6/igt@kms_chamelium@dp-crc-single.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>)
>       +12 similar issues
>    -
>
>    igt@kms_chamelium@dp-hpd-fast:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-tglb7/igt@kms_chamelium@dp-hpd-fast.html>
>       (fdo#109284 <https://bugs.freedesktop.org/show_bug.cgi?id=109284> /
>       fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>)
>       +4 similar issues
>    -
>
>    igt@kms_chamelium@vga-hpd-without-ddc:
>    - shard-snb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-snb4/igt@kms_chamelium@vga-hpd-without-ddc.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>)
>    -
>
>    igt@kms_color@ctm-0-75@pipe-a-edp-1:
>    - shard-iclb: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-iclb2/igt@kms_color@ctm-0-75@pipe-a-edp-1.html>
>       (i915#315 <https://gitlab.freedesktop.org/drm/intel/issues/315> /
>       i915#6946 <https://gitlab.freedesktop.org/drm/intel/issues/6946>)
>       +2 similar issues
>    -
>
>    igt@kms_color@ctm-0-75@pipe-c-edp-1:
>    - shard-tglb: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-tglb1/igt@kms_color@ctm-0-75@pipe-c-edp-1.html>
>       (i915#315 <https://gitlab.freedesktop.org/drm/intel/issues/315> /
>       i915#6946 <https://gitlab.freedesktop.org/drm/intel/issues/6946>)
>       +3 similar issues
>    -
>
>    igt@kms_color_chamelium@ctm-0-25:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-iclb1/igt@kms_color_chamelium@ctm-0-25.html>
>       (fdo#109284 <https://bugs.freedesktop.org/show_bug.cgi?id=109284> /
>       fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>)
>       +4 similar issues
>    -
>
>    igt@kms_color_chamelium@ctm-limited-range:
>    - shard-glk: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-glk5/igt@kms_color_chamelium@ctm-limited-range.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>)
>       +6 similar issues
>    -
>
>    igt@kms_content_protection@legacy:
>    -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-tglb7/igt@kms_content_protection@legacy.html>
>       (i915#7118 <https://gitlab.freedesktop.org/drm/intel/issues/7118>)
>       +1 similar issue
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-iclb3/igt@kms_content_protection@legacy.html>
>       (i915#7118 <https://gitlab.freedesktop.org/drm/intel/issues/7118>)
>       +1 similar issue
>       -
>
>    igt@kms_content_protection@srm@pipe-a-dp-1:
>    - shard-apl: NOTRUN -> INCOMPLETE
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-apl8/igt@kms_content_protection@srm@pipe-a-dp-1.html>
>       (i915#7121 <https://gitlab.freedesktop.org/drm/intel/issues/7121> /
>       i915#7173 <https://gitlab.freedesktop.org/drm/intel/issues/7173>)
>    -
>
>    igt@kms_cursor_crc@cursor-offscreen-512x170:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-iclb7/igt@kms_cursor_crc@cursor-offscreen-512x170.html>
>       (fdo#109279 <https://bugs.freedesktop.org/show_bug.cgi?id=109279> /
>       i915#3359 <https://gitlab.freedesktop.org/drm/intel/issues/3359>)
>    -
>
>    igt@kms_cursor_crc@cursor-sliding-32x32:
>    - shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-apl3/igt@kms_cursor_crc@cursor-sliding-32x32.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>)
>       +249 similar issues
>    -
>
>    igt@kms_cursor_legacy@cursorb-vs-flipa@atomic-transitions-varying-size:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-tglb7/igt@kms_cursor_legacy@cursorb-vs-flipa@atomic-transitions-varying-size.html>
>       (fdo#109274 <https://bugs.freedesktop.org/show_bug.cgi?id=109274> /
>       fdo#111825 <https://bugs.freedesktop.org/show_bug.cgi?id=111825>)
>       +5 similar issues
>    -
>
>    igt@kms_flip@2x-blocking-wf_vblank:
>    -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-iclb7/igt@kms_flip@2x-blocking-wf_vblank.html>
>       (fdo#109274 <https://bugs.freedesktop.org/show_bug.cgi?id=109274>)
>       +7 similar issues
>       -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-tglb2/igt@kms_flip@2x-blocking-wf_vblank.html>
>       (fdo#109274 <https://bugs.freedesktop.org/show_bug.cgi?id=109274> /
>       fdo#111825 <https://bugs.freedesktop.org/show_bug.cgi?id=111825> /
>       i915#3637 <https://gitlab.freedesktop.org/drm/intel/issues/3637>)
>       +1 similar issue
>       -
>
>    igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp1:
>    - shard-apl: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7020/shard-apl2/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp1.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-apl2/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp1.html>
>       (i915#79 <https://gitlab.freedesktop.org/drm/intel/issues/79>)
>    -
>
>    igt@kms_flip@flip-vs-suspend-interruptible@b-dp1:
>    - shard-apl: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7020/shard-apl6/igt@kms_flip@flip-vs-suspend-interruptible@b-dp1.html>
>       -> DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-apl8/igt@kms_flip@flip-vs-suspend-interruptible@b-dp1.html>
>       (i915#180 <https://gitlab.freedesktop.org/drm/intel/issues/180>) +4
>       similar issues
>    -
>
>    igt@kms_flip_scaled_crc
>    @flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-iclb1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html>
>       (i915#2587 <https://gitlab.freedesktop.org/drm/intel/issues/2587> /
>       i915#2672 <https://gitlab.freedesktop.org/drm/intel/issues/2672>)
>       +6 similar issues
>    -
>
>    igt@kms_flip_scaled_crc
>    @flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-tglb3/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html>
>       (i915#2587 <https://gitlab.freedesktop.org/drm/intel/issues/2587> /
>       i915#2672 <https://gitlab.freedesktop.org/drm/intel/issues/2672>)
>       +3 similar issues
>    -
>
>    igt@kms_flip_scaled_crc
>    @flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-default-mode:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-default-mode.html>
>       (i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555>)
>       +3 similar issues
>    -
>
>    igt@kms_flip_scaled_crc
>    @flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-default-mode:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-iclb3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-default-mode.html>
>       (i915#2672 <https://gitlab.freedesktop.org/drm/intel/issues/2672>)
>       +2 similar issues
>    -
>
>    igt@kms_frontbuffer_tracking
>    @fbcpsr-1p-primscrn-pri-indfb-draw-mmap-cpu:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-cpu.html>
>       (i915#6497 <https://gitlab.freedesktop.org/drm/intel/issues/6497>)
>       +7 similar issues
>    -
>
>    igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-iclb8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc.html>
>       (fdo#109280 <https://bugs.freedesktop.org/show_bug.cgi?id=109280>)
>       +27 similar issues
>    -
>
>    igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-gtt:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-tglb5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-gtt.html>
>       (fdo#109280 <https://bugs.freedesktop.org/show_bug.cgi?id=109280> /
>       fdo#111825 <https://bugs.freedesktop.org/show_bug.cgi?id=111825>)
>       +21 similar issues
>    -
>
>    igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1:
>    - shard-glk: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-glk9/igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1.html>
>       (i915#4573 <https://gitlab.freedesktop.org/drm/intel/issues/4573>)
>       +2 similar issues
>    -
>
>    igt@kms_plane_scaling
>    @plane-downscale-with-modifiers-factor-0-25@pipe-b-edp-1:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-iclb7/igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-b-edp-1.html>
>       (i915#5176 <https://gitlab.freedesktop.org/drm/intel/issues/5176>)
>       +5 similar issues
>    -
>
>    igt@kms_plane_scaling
>    @plane-downscale-with-modifiers-factor-0-5@pipe-d-edp-1:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-tglb2/igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-5@pipe-d-edp-1.html>
>       (i915#5176 <https://gitlab.freedesktop.org/drm/intel/issues/5176>)
>       +7 similar issues
>    -
>
>    igt@kms_prime@basic-modeset-hybrid:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-iclb2/igt@kms_prime@basic-modeset-hybrid.html>
>       (i915#6524 <https://gitlab.freedesktop.org/drm/intel/issues/6524>)
>    -
>
>    igt@kms_psr2_sf@overlay-plane-move-continuous-sf:
>    - shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-apl2/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>) +1
>       similar issue
>    -
>
>    igt@kms_psr2_su@frontbuffer-xrgb8888:
>    -
>
>       shard-glk: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-glk7/igt@kms_psr2_su@frontbuffer-xrgb8888.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>)
>       -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-tglb7/igt@kms_psr2_su@frontbuffer-xrgb8888.html>
>       (i915#7037 <https://gitlab.freedesktop.org/drm/intel/issues/7037>)
>       -
>
>    igt@kms_psr@psr2_cursor_blt:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-iclb3/igt@kms_psr@psr2_cursor_blt.html>
>       (fdo#109441 <https://bugs.freedesktop.org/show_bug.cgi?id=109441>)
>       +2 similar issues
>    -
>
>    igt@kms_psr@psr2_cursor_render:
>    - shard-tglb: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-tglb7/igt@kms_psr@psr2_cursor_render.html>
>       (i915#132 <https://gitlab.freedesktop.org/drm/intel/issues/132> /
>       i915#3467 <https://gitlab.freedesktop.org/drm/intel/issues/3467>)
>       +3 similar issues
>    -
>
>    igt@kms_psr@psr2_sprite_plane_move:
>    - shard-iclb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7020/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html>
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-iclb6/igt@kms_psr@psr2_sprite_plane_move.html>
>       (fdo#109441 <https://bugs.freedesktop.org/show_bug.cgi?id=109441>)
>    -
>
>    igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
>    - shard-iclb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7020/shard-iclb6/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html>
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-iclb7/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html>
>       (i915#5519 <https://gitlab.freedesktop.org/drm/intel/issues/5519>)
>    -
>
>    igt@kms_setmode@basic@pipe-a-vga-1:
>    - shard-snb: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-snb2/igt@kms_setmode@basic@pipe-a-vga-1.html>
>       (i915#5465 <https://gitlab.freedesktop.org/drm/intel/issues/5465>)
>       +1 similar issue
>    -
>
>    igt@kms_vblank@pipe-b-query-idle-hang:
>    -
>
>       shard-glk: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7020/shard-glk6/igt@kms_vblank@pipe-b-query-idle-hang.html>
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-glk9/igt@kms_vblank@pipe-b-query-idle-hang.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>)
>       -
>
>       shard-apl: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7020/shard-apl8/igt@kms_vblank@pipe-b-query-idle-hang.html>
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-apl8/igt@kms_vblank@pipe-b-query-idle-hang.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>)
>       -
>
>    igt@kms_vblank@pipe-d-query-forked-hang:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-iclb8/igt@kms_vblank@pipe-d-query-forked-hang.html>
>       (fdo#109278 <https://bugs.freedesktop.org/show_bug.cgi?id=109278>)
>       +21 similar issues
>    -
>
>    igt@kms_writeback@writeback-check-output:
>    -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-iclb6/igt@kms_writeback@writeback-check-output.html>
>       (i915#2437 <https://gitlab.freedesktop.org/drm/intel/issues/2437>)
>       -
>
>       shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-apl6/igt@kms_writeback@writeback-check-output.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#2437 <https://gitlab.freedesktop.org/drm/intel/issues/2437>)
>       -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-tglb2/igt@kms_writeback@writeback-check-output.html>
>       (i915#2437 <https://gitlab.freedesktop.org/drm/intel/issues/2437>)
>       -
>
>       shard-glk: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-glk8/igt@kms_writeback@writeback-check-output.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#2437 <https://gitlab.freedesktop.org/drm/intel/issues/2437>)
>       -
>
>    igt@perf@per-context-mode-unprivileged:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-tglb2/igt@perf@per-context-mode-unprivileged.html>
>       (fdo#109289 <https://bugs.freedesktop.org/show_bug.cgi?id=109289>)
>       +2 similar issues
>    -
>
>    igt@sysfs_clients@create:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-iclb7/igt@sysfs_clients@create.html>
>       (i915#2994 <https://gitlab.freedesktop.org/drm/intel/issues/2994>)
>       +3 similar issues
>    -
>
>    igt@sysfs_clients@fair-0:
>    -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-tglb5/igt@sysfs_clients@fair-0.html>
>       (i915#2994 <https://gitlab.freedesktop.org/drm/intel/issues/2994>)
>       +2 similar issues
>       -
>
>       shard-glk: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-glk1/igt@sysfs_clients@fair-0.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#2994 <https://gitlab.freedesktop.org/drm/intel/issues/2994>)
>       +2 similar issues
>       -
>
>    igt@sysfs_clients@fair-3:
>    - shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-apl6/igt@sysfs_clients@fair-3.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#2994 <https://gitlab.freedesktop.org/drm/intel/issues/2994>)
>       +3 similar issues
>
> Possible fixes
>
>    -
>
>    igt@gem_ctx_exec@basic-nohangcheck:
>    - {shard-tglu}: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7020/shard-tglu-2/igt@gem_ctx_exec@basic-nohangcheck.html>
>       (i915#6268 <https://gitlab.freedesktop.org/drm/intel/issues/6268>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-tglu-1/igt@gem_ctx_exec@basic-nohangcheck.html>
>    -
>
>    igt@gem_ctx_persistence@legacy-engines-hang@blt:
>    - {shard-rkl}: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7020/shard-rkl-5/igt@gem_ctx_persistence@legacy-engines-hang@blt.html>
>       (i915#6252 <https://gitlab.freedesktop.org/drm/intel/issues/6252>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-rkl-3/igt@gem_ctx_persistence@legacy-engines-hang@blt.html>
>    -
>
>    igt@gem_exec_balancer@parallel-bb-first:
>    - shard-iclb: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7020/shard-iclb6/igt@gem_exec_balancer@parallel-bb-first.html>
>       (i915#4525 <https://gitlab.freedesktop.org/drm/intel/issues/4525>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-iclb1/igt@gem_exec_balancer@parallel-bb-first.html>
>       +1 similar issue
>    -
>
>    igt@gem_exec_reloc@basic-wc-cpu-active:
>    - {shard-rkl}: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7020/shard-rkl-3/igt@gem_exec_reloc@basic-wc-cpu-active.html>
>       (i915#3281 <https://gitlab.freedesktop.org/drm/intel/issues/3281>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-rkl-5/igt@gem_exec_reloc@basic-wc-cpu-active.html>
>       +1 similar issue
>    -
>
>    igt@gem_pread@snoop:
>    - {shard-rkl}: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7020/shard-rkl-3/igt@gem_pread@snoop.html>
>       (i915#3282 <https://gitlab.freedesktop.org/drm/intel/issues/3282>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-rkl-5/igt@gem_pread@snoop.html>
>    -
>
>    igt@gem_softpin@evict-single-offset:
>    - shard-tglb: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7020/shard-tglb2/igt@gem_softpin@evict-single-offset.html>
>       (i915#4171 <https://gitlab.freedesktop.org/drm/intel/issues/4171>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-tglb5/igt@gem_softpin@evict-single-offset.html>
>    -
>
>    igt@gen9_exec_parse@shadow-peek:
>    - {shard-rkl}: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7020/shard-rkl-4/igt@gen9_exec_parse@shadow-peek.html>
>       (i915#2527 <https://gitlab.freedesktop.org/drm/intel/issues/2527>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-rkl-5/igt@gen9_exec_parse@shadow-peek.html>
>    -
>
>    igt@i915_pm_backlight@bad-brightness:
>    - {shard-rkl}: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7020/shard-rkl-5/igt@i915_pm_backlight@bad-brightness.html>
>       (i915#3012 <https://gitlab.freedesktop.org/drm/intel/issues/3012>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-rkl-6/igt@i915_pm_backlight@bad-brightness.html>
>    -
>
>    igt@i915_pm_rpm@pm-tiling:
>    - {shard-rkl}: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7020/shard-rkl-3/igt@i915_pm_rpm@pm-tiling.html>
>       (fdo#109308 <https://bugs.freedesktop.org/show_bug.cgi?id=109308>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-rkl-6/igt@i915_pm_rpm@pm-tiling.html>
>    -
>
>    igt@i915_selftest@live@gt_heartbeat:
>    - shard-apl: DMESG-FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7020/shard-apl1/igt@i915_selftest@live@gt_heartbeat.html>
>       (i915#5334 <https://gitlab.freedesktop.org/drm/intel/issues/5334>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-apl6/igt@i915_selftest@live@gt_heartbeat.html>
>    -
>
>    igt@i915_suspend@fence-restore-untiled:
>    - {shard-rkl}: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7020/shard-rkl-4/igt@i915_suspend@fence-restore-untiled.html>
>       (fdo#103375 <https://bugs.freedesktop.org/show_bug.cgi?id=103375>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-rkl-3/igt@i915_suspend@fence-restore-untiled.html>
>    -
>
>    igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
>    - shard-tglb: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7020/shard-tglb7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html>
>       (i915#3743 <https://gitlab.freedesktop.org/drm/intel/issues/3743>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-tglb3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html>
>       +1 similar issue
>    -
>
>    igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:
>    - {shard-rkl}: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7020/shard-rkl-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html>
>       (i915#1849 <https://gitlab.freedesktop.org/drm/intel/issues/1849> /
>       i915#4098 <https://gitlab.freedesktop.org/drm/intel/issues/4098>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html>
>       +6 similar issues
>    -
>
>    igt@kms_hdmi_inject@inject-audio:
>    -
>
>       {shard-rkl}: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7020/shard-rkl-3/igt@kms_hdmi_inject@inject-audio.html>
>       (i915#433 <https://gitlab.freedesktop.org/drm/intel/issues/433>) ->
>       PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-rkl-3/igt@kms_hdmi_inject@inject-audio.html>
>       -
>
>       shard-tglb: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7020/shard-tglb5/igt@kms_hdmi_inject@inject-audio.html>
>       (i915#433 <https://gitlab.freedesktop.org/drm/intel/issues/433>) ->
>       PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-tglb7/igt@kms_hdmi_inject@inject-audio.html>
>       -
>
>       {shard-tglu}: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7020/shard-tglu-2/igt@kms_hdmi_inject@inject-audio.html>
>       (i915#433 <https://gitlab.freedesktop.org/drm/intel/issues/433>) ->
>       PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-tglu-4/igt@kms_hdmi_inject@inject-audio.html>
>       -
>
>    igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes:
>    - shard-apl: DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7020/shard-apl2/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes.html>
>       (i915#180 <https://gitlab.freedesktop.org/drm/intel/issues/180>) ->
>       PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-apl6/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes.html>
>       +5 similar issues
>    -
>
>    igt@kms_plane_scaling
>    @plane-downscale-with-pixel-format-factor-0-5@pipe-b-edp-1:
>    - shard-iclb: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7020/shard-iclb2/igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-5@pipe-b-edp-1.html>
>       (i915#5176 <https://gitlab.freedesktop.org/drm/intel/issues/5176>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-iclb7/igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-5@pipe-b-edp-1.html>
>       +2 similar issues
>    -
>
>    igt@kms_plane_scaling
>    @planes-unity-scaling-downscale-factor-0-5@pipe-c-edp-1:
>    - shard-iclb: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7020/shard-iclb2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-c-edp-1.html>
>       (i915#5235 <https://gitlab.freedesktop.org/drm/intel/issues/5235>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-iclb6/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-c-edp-1.html>
>       +2 similar issues
>    -
>
>    igt@kms_psr@no_drrs:
>    - {shard-rkl}: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7020/shard-rkl-4/igt@kms_psr@no_drrs.html>
>       (i915#1072 <https://gitlab.freedesktop.org/drm/intel/issues/1072>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-rkl-6/igt@kms_psr@no_drrs.html>
>    -
>
>    igt@kms_universal_plane@cursor-fb-leak-pipe-a:
>    - {shard-rkl}: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7020/shard-rkl-1/igt@kms_universal_plane@cursor-fb-leak-pipe-a.html>
>       (i915#1845 <https://gitlab.freedesktop.org/drm/intel/issues/1845> /
>       i915#4070 <https://gitlab.freedesktop.org/drm/intel/issues/4070> /
>       i915#4098 <https://gitlab.freedesktop.org/drm/intel/issues/4098>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-rkl-6/igt@kms_universal_plane@cursor-fb-leak-pipe-a.html>
>    -
>
>    igt@kms_vblank@pipe-b-query-forked:
>    - {shard-rkl}: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7020/shard-rkl-3/igt@kms_vblank@pipe-b-query-forked.html>
>       (i915#1845 <https://gitlab.freedesktop.org/drm/intel/issues/1845> /
>       i915#4098 <https://gitlab.freedesktop.org/drm/intel/issues/4098>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-rkl-6/igt@kms_vblank@pipe-b-query-forked.html>
>       +17 similar issues
>
> Warnings
>
>    -
>
>    igt@gem_pwrite@basic-exhaustion:
>    - shard-apl: WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7020/shard-apl3/igt@gem_pwrite@basic-exhaustion.html>
>       (i915#2658 <https://gitlab.freedesktop.org/drm/intel/issues/2658>)
>       -> INCOMPLETE
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-apl2/igt@gem_pwrite@basic-exhaustion.html>
>       (i915#7248 <https://gitlab.freedesktop.org/drm/intel/issues/7248>)
>    -
>
>    igt@kms_content_protection@mei_interface:
>    -
>
>       shard-tglb: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7020/shard-tglb7/igt@kms_content_protection@mei_interface.html>
>       (i915#7118 <https://gitlab.freedesktop.org/drm/intel/issues/7118>)
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-tglb2/igt@kms_content_protection@mei_interface.html>
>       (fdo#109300 <https://bugs.freedesktop.org/show_bug.cgi?id=109300>)
>       -
>
>       shard-iclb: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7020/shard-iclb2/igt@kms_content_protection@mei_interface.html>
>       (i915#7118 <https://gitlab.freedesktop.org/drm/intel/issues/7118>)
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-iclb7/igt@kms_content_protection@mei_interface.html>
>       (fdo#109300 <https://bugs.freedesktop.org/show_bug.cgi?id=109300>)
>       -
>
>    igt@kms_psr2_sf@cursor-plane-update-sf:
>    - shard-iclb: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7020/shard-iclb2/igt@kms_psr2_sf@cursor-plane-update-sf.html>
>       (i915#2920 <https://gitlab.freedesktop.org/drm/intel/issues/2920>)
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-iclb6/igt@kms_psr2_sf@cursor-plane-update-sf.html>
>       (fdo#111068 <https://bugs.freedesktop.org/show_bug.cgi?id=111068> /
>       i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>)
>
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> Build changes
>
>    - CI: CI-20190529 -> None
>    - IGT: IGT_7020 -> IGTPW_7986
>
> CI-20190529: 20190529
> CI_DRM_12261: 41447224fdfbfbfd1e9ffa5fabc9d277f9c02f8a @ git://
> anongit.freedesktop.org/gfx-ci/linux
> IGTPW_7986: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/index.html
> IGT_7020: 05b7eaf9ade2216d17c069c89439015757ee25f7 @
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>

--0000000000008b9bc105eb77f09f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Lakshminarayana, this looks irrelevant. Can I get a rer=
un please? thanks!</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">On Wed, Oct 19, 2022 at 8:08 PM Patchwork &lt;<a href=3D"=
mailto:patchwork@emeril.freedesktop.org">patchwork@emeril.freedesktop.org</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><d=
iv class=3D"msg651290180826167779">
<u></u>

=20
 =20
 =20
 =20

<div>


<b>Patch Details</b>
<table>
<tbody><tr><td><b>Series:</b></td><td>chamelium: Get connector After plug t=
o get EDID</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/109903/" target=3D"_blank">https://patchwork.freedesktop.org/series/10=
9903/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7986/index.html" target=3D"_blank">https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_7986/index.html</a></td></tr>

</tbody></table>


    <h1>CI Bug Log - changes from IGT_7020_full -&gt; IGTPW_7986_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_7986_full absolutely need to b=
e<br>
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
>
  introduced in IGTPW_7986_full, please notify your bug team to allow them<=
br>
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7986/index.html" target=3D"_blank">https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_7986/index.html</a></p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7986=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7020/shard-iclb1/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html" target=
=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_7986/shard-iclb7/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html" tar=
get=3D"_blank">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7986_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ccs@ctrl-surf-copy:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7986/shard-tglb2/igt@gem_ccs@ctrl-surf-copy.html" targe=
t=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/3555" target=3D"_blank">i915#3555</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/5325" target=3D"_blank">i915#5325</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7986/shard-iclb3/igt@gem_ccs@suspend-resume.html" target=
=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/5327" target=3D"_blank">i915#5327</a>) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7986/shard-tglb7/igt@gem_ccs@suspend-resume.html" target=
=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/5325" target=3D"_blank">i915#5325</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-sanity-check:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7986/shard-tglb3/igt@gem_create@create-ext-cpu-access-sa=
nity-check.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/intel/issues/6335" target=3D"_blank">i915#6335</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7986/shard-iclb3/igt@gem_create@create-ext-cpu-access-sa=
nity-check.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/intel/issues/6335" target=3D"_blank">i915#6335</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@vcs0:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7986/shard-apl1/igt@gem_ctx_isolation@preservation-s3@v=
cs0.html" target=3D"_blank">DMESG-WARN</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/180" target=3D"_blank">i915#180</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@engines-mixed-process:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7986/shard-snb6/igt@gem_ctx_persistence@engines-mixed-p=
rocess.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedeskto=
p.org/show_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/1099" target=3D"_blank"=
>i915#1099</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-out-fence:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7986/shard-iclb5/igt@gem_exec_balancer@parallel-out-fen=
ce.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/4525" target=3D"_blank">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-rrul@rcs0:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7986/shard-glk6/igt@gem_exec_fair@basic-none-rrul@rcs0.h=
tml" target=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/2842" target=3D"_blank">i915#2842</a>) +1 similar issue</p=
>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7986/shard-tglb1/igt@gem_exec_fair@basic-none-rrul@rcs0.=
html" target=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/2842" target=3D"_blank">i915#2842</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7986/shard-iclb1/igt@gem_exec_fair@basic-none@vcs1.html=
" target=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/2842" target=3D"_blank">i915#2842</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7020/shard-glk7/igt@gem_exec_fair@basic-pace-solo@rcs0.html" target=3D=
"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_7986/shard-glk1/igt@gem_exec_fair@basic-pace-solo@rcs0.html" target=
=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2842" target=3D"_blank">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7986/shard-snb4/igt@gem_exec_whisper@basic-queues.html"=
 target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a>) +119 similar issues</=
li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-multi:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7986/shard-iclb3/igt@gem_lmem_swapping@heavy-multi.html"=
 target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/4613" target=3D"_blank">i915#4613</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7986/shard-tglb7/igt@gem_lmem_swapping@heavy-multi.html"=
 target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/4613" target=3D"_blank">i915#4613</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7986/shard-glk3/igt@gem_lmem_swapping@random.html" targ=
et=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/4613" target=3D"_blank">i915#4613</a>) +2=
 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-regular-context-2:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7986/shard-tglb5/igt@gem_pxp@create-regular-context-2.h=
tml" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/4270" target=3D"_blank">i915#4270</a>) +2 similar issues</=
li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-stale-buf-execution:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7986/shard-iclb8/igt@gem_pxp@verify-pxp-stale-buf-execu=
tion.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/4270" target=3D"_blank">i915#4270</a>) +2 similar is=
sues</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7986/shard-glk6/igt@gem_render_copy@y-tiled-ccs-to-y-ti=
led-mc-ccs.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freede=
sktop.org/show_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a>) +150 =
similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7986/shard-iclb3/igt@gem_render_copy@y-tiled-mc-ccs-to-=
yf-tiled-ccs.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/768" target=3D"_blank">i915#768</a>) +1 simi=
lar issue</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7986/shard-apl6/igt@gem_userptr_blits@dmabuf-sync.html"=
 target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/3323" target=3D"_blank">i915#3323</a=
>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-overlap:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7986/shard-iclb7/igt@gem_userptr_blits@unsync-overlap.ht=
ml" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/3297" target=3D"_blank">i915#3297</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7986/shard-tglb2/igt@gem_userptr_blits@unsync-overlap.ht=
ml" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/3297" target=3D"_blank">i915#3297</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@vma-merge:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7986/shard-apl1/igt@gem_userptr_blits@vma-merge.html" ta=
rget=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/3318" target=3D"_blank">i915#3318</a>)</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7986/shard-snb7/igt@gem_userptr_blits@vma-merge.html" ta=
rget=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/2724" target=3D"_blank">i915#2724</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7986/shard-tglb2/igt@gem_userptr_blits@vma-merge.html" t=
arget=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/3318" target=3D"_blank">i915#3318</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7986/shard-glk3/igt@gem_userptr_blits@vma-merge.html" ta=
rget=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/3318" target=3D"_blank">i915#3318</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7986/shard-iclb7/igt@gem_userptr_blits@vma-merge.html" t=
arget=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/3318" target=3D"_blank">i915#3318</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-rejected:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7986/shard-iclb1/igt@gen7_exec_parse@basic-rejected.htm=
l" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show=
_bug.cgi?id=3D109289" target=3D"_blank">fdo#109289</a>) +3 similar issues</=
li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7020/shard-glk7/igt@gen9_exec_parse@allowed-all.html" target=3D"_blank=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7986/shard-glk1/igt@gen9_exec_parse@allowed-all.html" target=3D"_blank">DME=
SG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/556=
6" target=3D"_blank">i915#5566</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/716" target=3D"_blank">i915#716</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-param:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7986/shard-iclb7/igt@gen9_exec_parse@bb-start-param.html=
" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/2856" target=3D"_blank">i915#2856</a>) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7986/shard-tglb5/igt@gen9_exec_parse@bb-start-param.html=
" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/2527" target=3D"_blank">i915#2527</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/2856" target=3D"_blank">i915#2856</a>=
)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@resize-bar:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7986/shard-iclb8/igt@i915_module_load@resize-bar.html" t=
arget=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/6412" target=3D"_blank">i915#6412</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7986/shard-tglb3/igt@i915_module_load@resize-bar.html" t=
arget=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/6412" target=3D"_blank">i915#6412</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7986/shard-apl6/igt@i915_pipe_stress@stress-xrgb8888-yt=
iled.html" target=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/7036" target=3D"_blank">i915#7036</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7020/shard-iclb8/igt@i915_pm_dc@dc6-dpms.html" target=3D"_blank">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/sh=
ard-iclb3/igt@i915_pm_dc@dc6-dpms.html" target=3D"_blank">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/3989" target=3D"_blank"=
>i915#3989</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/454" target=3D"_blank">i915#454</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7986/shard-apl6/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.h=
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
/tree/drm-tip/IGTPW_7986/shard-glk6/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi=
-a.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.or=
g/show_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/intel/issues/1937" target=3D"_blank">i915=
#1937</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7986/shard-tglb3/igt@i915_pm_rpm@dpms-mode-unset-non-lp=
sp.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.or=
g/show_bug.cgi?id=3D111644" target=3D"_blank">fdo#111644</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/intel/issues/1397" target=3D"_blank">i915=
#1397</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress-pc8:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7986/shard-iclb5/igt@i915_pm_rpm@gem-execbuf-stress-pc8.=
html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D109293" target=3D"_blank">fdo#109293</a> / <a href=3D"http=
s://bugs.freedesktop.org/show_bug.cgi?id=3D109506" target=3D"_blank">fdo#10=
9506</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7986/shard-tglb1/igt@i915_pm_rpm@gem-execbuf-stress-pc8.=
html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D109506" target=3D"_blank">fdo#109506</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7986/shard-iclb3/igt@i915_pm_rpm@modeset-non-lpsp-stres=
s-no-wait.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedes=
ktop.org/show_bug.cgi?id=3D110892" target=3D"_blank">fdo#110892</a>) +1 sim=
ilar issue</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@mock@requests:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7986/shard-apl1/igt@i915_selftest@mock@requests.html" ta=
rget=3D"_blank">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/7226" target=3D"_blank">i915#7226</a>)</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7986/shard-snb7/igt@i915_selftest@mock@requests.html" ta=
rget=3D"_blank">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/7226" target=3D"_blank">i915#7226</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7986/shard-iclb5/igt@i915_selftest@mock@requests.html" t=
arget=3D"_blank">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/7267" target=3D"_blank">i915#7267</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7986/shard-tglb2/igt@kms_big_fb@4-tiled-max-hw-stride-3=
2bpp-rotate-180-async-flip.html" target=3D"_blank">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/5286" target=3D"_blank">i915#5=
286</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7986/shard-iclb7/igt@kms_big_fb@4-tiled-max-hw-stride-6=
4bpp-rotate-0-hflip.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/5286" target=3D"_blank">i915#5286</a>=
) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7986/shard-tglb5/igt@kms_big_fb@linear-64bpp-rotate-90.=
html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D111614" target=3D"_blank">fdo#111614</a>) +2 similar issue=
s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7986/shard-iclb1/igt@kms_big_fb@x-tiled-8bpp-rotate-270=
.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D110725" target=3D"_blank">fdo#110725</a> / <a href=3D"htt=
ps://bugs.freedesktop.org/show_bug.cgi?id=3D111614" target=3D"_blank">fdo#1=
11614</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</=
p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7986/shard-tglb2/igt@kms_big_fb@yf-tiled-max-hw-stride-=
32bpp-rotate-0-hflip-async-flip.html" target=3D"_blank">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111615" target=3D"_blank=
">fdo#111615</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7986/shard-iclb1/igt@kms_big_fb@yf-tiled-max-hw-stride-=
64bpp-rotate-0-async-flip.html" target=3D"_blank">SKIP</a> (<a href=3D"http=
s://bugs.freedesktop.org/show_bug.cgi?id=3D110723" target=3D"_blank">fdo#11=
0723</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@2x-modeset:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7986/shard-tglb7/igt@kms_big_joiner@2x-modeset.html" tar=
get=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/2705" target=3D"_blank">i915#2705</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7986/shard-iclb8/igt@kms_big_joiner@2x-modeset.html" tar=
get=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/2705" target=3D"_blank">i915#2705</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-pixel-format-4_tiled_dg2_rc_ccs_cc:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7986/shard-tglb7/igt@kms_ccs@pipe-b-bad-pixel-format-4_=
tiled_dg2_rc_ccs_cc.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/3689" target=3D"_blank">i915#3689</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6095" target=
=3D"_blank">i915#6095</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7986/shard-tglb2/igt@kms_ccs@pipe-b-missing-ccs-buffer-=
y_tiled_gen12_mc_ccs.html" target=3D"_blank">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/3689" target=3D"_blank">i915#3689</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3886" target=
=3D"_blank">i915#3886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-primary-basic-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7986/shard-apl7/igt@kms_ccs@pipe-c-crc-primary-basic-y_=
tiled_gen12_mc_ccs.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bug=
s.freedesktop.org/show_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3886" target=
=3D"_blank">i915#3886</a>) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7986/shard-iclb8/igt@kms_ccs@pipe-c-crc-primary-rotatio=
n-180-y_tiled_gen12_rc_ccs_cc.html" target=3D"_blank">SKIP</a> (<a href=3D"=
https://bugs.freedesktop.org/show_bug.cgi?id=3D109278" target=3D"_blank">fd=
o#109278</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3=
886" target=3D"_blank">i915#3886</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7986/shard-glk7/igt@kms_ccs@pipe-c-crc-sprite-planes-ba=
sic-y_tiled_gen12_rc_ccs_cc.html" target=3D"_blank">SKIP</a> (<a href=3D"ht=
tps://bugs.freedesktop.org/show_bug.cgi?id=3D109271" target=3D"_blank">fdo#=
109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/388=
6" target=3D"_blank">i915#3886</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-aux-stride-y_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7986/shard-tglb1/igt@kms_ccs@pipe-d-bad-aux-stride-y_ti=
led_ccs.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/3689" target=3D"_blank">i915#3689</a>) +2 similar=
 issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs_cc:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7986/shard-tglb3/igt@kms_ccs@pipe-d-crc-sprite-planes-b=
asic-4_tiled_dg2_rc_ccs_cc.html" target=3D"_blank">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/6095" target=3D"_blank">i915#6=
095</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-random-ccs-data-yf_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7986/shard-tglb2/igt@kms_ccs@pipe-d-random-ccs-data-yf_=
tiled_ccs.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedes=
ktop.org/show_bug.cgi?id=3D111615" target=3D"_blank">fdo#111615</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/3689" target=3D"_blan=
k">i915#3689</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-crc-single:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7986/shard-apl6/igt@kms_chamelium@dp-crc-single.html" t=
arget=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug=
.cgi?id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D"https://bug=
s.freedesktop.org/show_bug.cgi?id=3D111827" target=3D"_blank">fdo#111827</a=
>) +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-hpd-fast:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7986/shard-tglb7/igt@kms_chamelium@dp-hpd-fast.html" ta=
rget=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D109284" target=3D"_blank">fdo#109284</a> / <a href=3D"https://bugs=
.freedesktop.org/show_bug.cgi?id=3D111827" target=3D"_blank">fdo#111827</a>=
) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-without-ddc:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7986/shard-snb4/igt@kms_chamelium@vga-hpd-without-ddc.h=
tml" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D"https=
://bugs.freedesktop.org/show_bug.cgi?id=3D111827" target=3D"_blank">fdo#111=
827</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-a-edp-1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7986/shard-iclb2/igt@kms_color@ctm-0-75@pipe-a-edp-1.ht=
ml" target=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/315" target=3D"_blank">i915#315</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/6946" target=3D"_blank">i915#6946</a>=
) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-c-edp-1:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7986/shard-tglb1/igt@kms_color@ctm-0-75@pipe-c-edp-1.ht=
ml" target=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/315" target=3D"_blank">i915#315</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/6946" target=3D"_blank">i915#6946</a>=
) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@ctm-0-25:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7986/shard-iclb1/igt@kms_color_chamelium@ctm-0-25.html"=
 target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D109284" target=3D"_blank">fdo#109284</a> / <a href=3D"https://b=
ugs.freedesktop.org/show_bug.cgi?id=3D111827" target=3D"_blank">fdo#111827<=
/a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@ctm-limited-range:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7986/shard-glk5/igt@kms_color_chamelium@ctm-limited-ran=
ge.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.or=
g/show_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D"h=
ttps://bugs.freedesktop.org/show_bug.cgi?id=3D111827" target=3D"_blank">fdo=
#111827</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7986/shard-tglb7/igt@kms_content_protection@legacy.html"=
 target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/7118" target=3D"_blank">i915#7118</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7986/shard-iclb3/igt@kms_content_protection@legacy.html"=
 target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/7118" target=3D"_blank">i915#7118</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-1:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7986/shard-apl8/igt@kms_content_protection@srm@pipe-a-d=
p-1.html" target=3D"_blank">INCOMPLETE</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/7121" target=3D"_blank">i915#7121</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/7173" target=3D"_blank"=
>i915#7173</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7986/shard-iclb7/igt@kms_cursor_crc@cursor-offscreen-51=
2x170.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop=
.org/show_bug.cgi?id=3D109279" target=3D"_blank">fdo#109279</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/3359" target=3D"_blank"=
>i915#3359</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x32:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7986/shard-apl3/igt@kms_cursor_crc@cursor-sliding-32x32=
.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a>) +249 similar is=
sues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa@atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7986/shard-tglb7/igt@kms_cursor_legacy@cursorb-vs-flipa=
@atomic-transitions-varying-size.html" target=3D"_blank">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109274" target=3D"_blank=
">fdo#109274</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111825" target=3D"_blank">fdo#111825</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7986/shard-iclb7/igt@kms_flip@2x-blocking-wf_vblank.html=
" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_=
bug.cgi?id=3D109274" target=3D"_blank">fdo#109274</a>) +7 similar issues</p=
>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7986/shard-tglb2/igt@kms_flip@2x-blocking-wf_vblank.html=
" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_=
bug.cgi?id=3D109274" target=3D"_blank">fdo#109274</a> / <a href=3D"https://=
bugs.freedesktop.org/show_bug.cgi?id=3D111825" target=3D"_blank">fdo#111825=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3637" tar=
get=3D"_blank">i915#3637</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7020/shard-apl2/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp=
1.html" target=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_7986/shard-apl2/igt@kms_flip@flip-vs-expired-vblank=
-interruptible@a-dp1.html" target=3D"_blank">FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/79" target=3D"_blank">i915#79</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@b-dp1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7020/shard-apl6/igt@kms_flip@flip-vs-suspend-interruptible@b-dp1.html"=
 target=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_7986/shard-apl8/igt@kms_flip@flip-vs-suspend-interruptible=
@b-dp1.html" target=3D"_blank">DMESG-WARN</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/180" target=3D"_blank">i915#180</a>) +4 simi=
lar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing@pipe-a-valid-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7986/shard-iclb1/igt@kms_flip_scaled_crc@flip-32bpp-4ti=
le-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html" target=3D"_bl=
ank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2=
587" target=3D"_blank">i915#2587</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/2672" target=3D"_blank">i915#2672</a>) +6 similar is=
sues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pi=
pe-a-valid-mode:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7986/shard-tglb3/igt@kms_flip_scaled_crc@flip-32bpp-yft=
ile-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html" target=3D"_blank">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2587" t=
arget=3D"_blank">i915#2587</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/2672" target=3D"_blank">i915#2672</a>) +3 similar issues</=
li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@p=
ipe-a-default-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7986/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-yti=
le-to-32bpp-ytileccs-downscaling@pipe-a-default-mode.html" target=3D"_blank=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3555=
" target=3D"_blank">i915#3555</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7986/shard-iclb3/igt@kms_flip_scaled_crc@flip-64bpp-yft=
ile-to-32bpp-yftile-upscaling@pipe-a-default-mode.html" target=3D"_blank">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2672" t=
arget=3D"_blank">i915#2672</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-cpu:=
</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7986/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-1p=
-primscrn-pri-indfb-draw-mmap-cpu.html" target=3D"_blank">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/6497" target=3D"_blank"=
>i915#6497</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7986/shard-iclb8/igt@kms_frontbuffer_tracking@psr-2p-pr=
imscrn-pri-indfb-draw-mmap-wc.html" target=3D"_blank">SKIP</a> (<a href=3D"=
https://bugs.freedesktop.org/show_bug.cgi?id=3D109280" target=3D"_blank">fd=
o#109280</a>) +27 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-gtt:</p=
>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7986/shard-tglb5/igt@kms_frontbuffer_tracking@psr-2p-pr=
imscrn-spr-indfb-draw-mmap-gtt.html" target=3D"_blank">SKIP</a> (<a href=3D=
"https://bugs.freedesktop.org/show_bug.cgi?id=3D109280" target=3D"_blank">f=
do#109280</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
11825" target=3D"_blank">fdo#111825</a>) +21 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7986/shard-glk9/igt@kms_plane_alpha_blend@constant-alph=
a-max@pipe-c-hdmi-a-1.html" target=3D"_blank">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/4573" target=3D"_blank">i915#4573</=
a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-b-=
edp-1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7986/shard-iclb7/igt@kms_plane_scaling@plane-downscale-=
with-modifiers-factor-0-25@pipe-b-edp-1.html" target=3D"_blank">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5176" target=3D"_=
blank">i915#5176</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-5@pipe-d-e=
dp-1:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7986/shard-tglb2/igt@kms_plane_scaling@plane-downscale-=
with-modifiers-factor-0-5@pipe-d-edp-1.html" target=3D"_blank">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5176" target=3D"_b=
lank">i915#5176</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-modeset-hybrid:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7986/shard-iclb2/igt@kms_prime@basic-modeset-hybrid.htm=
l" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/6524" target=3D"_blank">i915#6524</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7986/shard-apl2/igt@kms_psr2_sf@overlay-plane-move-cont=
inuous-sf.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedes=
ktop.org/show_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/658" target=3D"_blank=
">i915#658</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7986/shard-glk7/igt@kms_psr2_su@frontbuffer-xrgb8888.htm=
l" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show=
_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/intel/issues/658" target=3D"_blank">i915#658</a=
>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7986/shard-tglb7/igt@kms_psr2_su@frontbuffer-xrgb8888.ht=
ml" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/7037" target=3D"_blank">i915#7037</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_blt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7986/shard-iclb3/igt@kms_psr@psr2_cursor_blt.html" targ=
et=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109441" target=3D"_blank">fdo#109441</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_render:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7986/shard-tglb7/igt@kms_psr@psr2_cursor_render.html" t=
arget=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/132" target=3D"_blank">i915#132</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/3467" target=3D"_blank">i915#3467</a>) +3 =
similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_move:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7020/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html" target=3D"_b=
lank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_7986/shard-iclb6/igt@kms_psr@psr2_sprite_plane_move.html" target=3D"_bl=
ank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9441" target=3D"_blank">fdo#109441</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7020/shard-iclb6/igt@kms_psr_stress_test@invalidate-primary-flip-overl=
ay.html" target=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7986/shard-iclb7/igt@kms_psr_stress_test@invalidat=
e-primary-flip-overlay.html" target=3D"_blank">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/intel/issues/5519" target=3D"_blank">i915#5519<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-a-vga-1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7986/shard-snb2/igt@kms_setmode@basic@pipe-a-vga-1.html=
" target=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/5465" target=3D"_blank">i915#5465</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-query-idle-hang:</p>
<ul>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_7020/shard-glk6/igt@kms_vblank@pipe-b-query-idle-hang.html" target=3D"_=
blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_7986/shard-glk9/igt@kms_vblank@pipe-b-query-idle-hang.html" target=3D"=
_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271" target=3D"_blank">fdo#109271</a>)</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_7020/shard-apl8/igt@kms_vblank@pipe-b-query-idle-hang.html" target=3D"_=
blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_7986/shard-apl8/igt@kms_vblank@pipe-b-query-idle-hang.html" target=3D"=
_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271" target=3D"_blank">fdo#109271</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-query-forked-hang:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7986/shard-iclb8/igt@kms_vblank@pipe-d-query-forked-han=
g.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org=
/show_bug.cgi?id=3D109278" target=3D"_blank">fdo#109278</a>) +21 similar is=
sues</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7986/shard-iclb6/igt@kms_writeback@writeback-check-outpu=
t.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/2437" target=3D"_blank">i915#2437</a>)</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7986/shard-apl6/igt@kms_writeback@writeback-check-output=
.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/2437" target=3D"_blank">i915#2=
437</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7986/shard-tglb2/igt@kms_writeback@writeback-check-outpu=
t.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/2437" target=3D"_blank">i915#2437</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7986/shard-glk8/igt@kms_writeback@writeback-check-output=
.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/2437" target=3D"_blank">i915#2=
437</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@perf@per-context-mode-unprivileged:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7986/shard-tglb2/igt@perf@per-context-mode-unprivileged=
.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D109289" target=3D"_blank">fdo#109289</a>) +2 similar issu=
es</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@create:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7986/shard-iclb7/igt@sysfs_clients@create.html" target=
=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2994" target=3D"_blank">i915#2994</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@fair-0:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7986/shard-tglb5/igt@sysfs_clients@fair-0.html" target=
=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2994" target=3D"_blank">i915#2994</a>) +2 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7986/shard-glk1/igt@sysfs_clients@fair-0.html" target=3D=
"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/2994" target=3D"_blank">i915#2994</a>) +2 sim=
ilar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@fair-3:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7986/shard-apl6/igt@sysfs_clients@fair-3.html" target=
=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/intel/issues/2994" target=3D"_blank">i915#2994</a>) +3 s=
imilar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_ctx_exec@basic-nohangcheck:</p>
<ul>
<li>{shard-tglu}:       <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7020/shard-tglu-2/igt@gem_ctx_exec@basic-nohangcheck.html" target=3D"_=
blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/6268" target=3D"_blank">i915#6268</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_7986/shard-tglu-1/igt@gem_ctx_exec@basic-nohan=
gcheck.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-hang@blt:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7020/shard-rkl-5/igt@gem_ctx_persistence@legacy-engines-hang@blt.html"=
 target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/6252" target=3D"_blank">i915#6252</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-rkl-3/igt@gem_ctx_persi=
stence@legacy-engines-hang@blt.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-bb-first:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7020/shard-iclb6/igt@gem_exec_balancer@parallel-bb-first.html" target=
=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/4525" target=3D"_blank">i915#4525</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-iclb1/igt@gem_exec_balancer@pa=
rallel-bb-first.html" target=3D"_blank">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc-cpu-active:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7020/shard-rkl-3/igt@gem_exec_reloc@basic-wc-cpu-active.html" target=
=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/3281" target=3D"_blank">i915#3281</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-rkl-5/igt@gem_exec_reloc@basic=
-wc-cpu-active.html" target=3D"_blank">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_pread@snoop:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7020/shard-rkl-3/igt@gem_pread@snoop.html" target=3D"_blank">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3282" target=3D=
"_blank">i915#3282</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_7986/shard-rkl-5/igt@gem_pread@snoop.html" target=3D"_blank">P=
ASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-single-offset:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7020/shard-tglb2/igt@gem_softpin@evict-single-offset.html" target=3D"_=
blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/4171" target=3D"_blank">i915#4171</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_7986/shard-tglb5/igt@gem_softpin@evict-single-=
offset.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@shadow-peek:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7020/shard-rkl-4/igt@gen9_exec_parse@shadow-peek.html" target=3D"_blan=
k">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/252=
7" target=3D"_blank">i915#2527</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7986/shard-rkl-5/igt@gen9_exec_parse@shadow-peek.h=
tml" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_backlight@bad-brightness:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7020/shard-rkl-5/igt@i915_pm_backlight@bad-brightness.html" target=3D"=
_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/3012" target=3D"_blank">i915#3012</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_7986/shard-rkl-6/igt@i915_pm_backlight@bad-br=
ightness.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@pm-tiling:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7020/shard-rkl-3/igt@i915_pm_rpm@pm-tiling.html" target=3D"_blank">SKI=
P</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109308" ta=
rget=3D"_blank">fdo#109308</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7986/shard-rkl-6/igt@i915_pm_rpm@pm-tiling.html" targe=
t=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7020/shard-apl1/igt@i915_selftest@live@gt_heartbeat.html" target=3D"_b=
lank">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/5334" target=3D"_blank">i915#5334</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-apl6/igt@i915_selftest@live@gt=
_heartbeat.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-untiled:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7020/shard-rkl-4/igt@i915_suspend@fence-restore-untiled.html" target=
=3D"_blank">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D103375" target=3D"_blank">fdo#103375</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-rkl-3/igt@i915_suspend@fence=
-restore-untiled.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7020/shard-tglb7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180=
-async-flip.html" target=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/3743" target=3D"_blank">i915#3743</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-tglb3/=
igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html" targ=
et=3D"_blank">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7020/shard-rkl-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indf=
b-draw-blt.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/intel/issues/1849" target=3D"_blank">i915#1849</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/4098" target=3D"_blank=
">i915#4098</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_7986/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-ind=
fb-draw-blt.html" target=3D"_blank">PASS</a> +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>
<p>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_7020/shard-rkl-3/igt@kms_hdmi_inject@inject-audio.html" target=3D"_blan=
k">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/433=
" target=3D"_blank">i915#433</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_7986/shard-rkl-3/igt@kms_hdmi_inject@inject-audio.ht=
ml" target=3D"_blank">PASS</a></p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_7020/shard-tglb5/igt@kms_hdmi_inject@inject-audio.html" target=3D"_blan=
k">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/433=
" target=3D"_blank">i915#433</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_7986/shard-tglb7/igt@kms_hdmi_inject@inject-audio.ht=
ml" target=3D"_blank">PASS</a></p>
</li>
<li>
<p>{shard-tglu}:       <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_7020/shard-tglu-2/igt@kms_hdmi_inject@inject-audio.html" target=3D"_bla=
nk">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/43=
3" target=3D"_blank">i915#433</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_7986/shard-tglu-4/igt@kms_hdmi_inject@inject-audio.=
html" target=3D"_blank">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7020/shard-apl2/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-=
b-planes.html" target=3D"_blank">DMESG-WARN</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/180" target=3D"_blank">i915#180</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-apl6/=
igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes.html" target=
=3D"_blank">PASS</a> +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-5@pipe-=
b-edp-1:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7020/shard-iclb2/igt@kms_plane_scaling@plane-downscale-with-pixel-form=
at-factor-0-5@pipe-b-edp-1.html" target=3D"_blank">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/5176" target=3D"_blank">i915#5=
176</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_79=
86/shard-iclb7/igt@kms_plane_scaling@plane-downscale-with-pixel-format-fact=
or-0-5@pipe-b-edp-1.html" target=3D"_blank">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-c-e=
dp-1:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7020/shard-iclb2/igt@kms_plane_scaling@planes-unity-scaling-downscale-=
factor-0-5@pipe-c-edp-1.html" target=3D"_blank">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/5235" target=3D"_blank">i915#5235=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/=
shard-iclb6/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5=
@pipe-c-edp-1.html" target=3D"_blank">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@no_drrs:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7020/shard-rkl-4/igt@kms_psr@no_drrs.html" target=3D"_blank">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1072" target=3D=
"_blank">i915#1072</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_7986/shard-rkl-6/igt@kms_psr@no_drrs.html" target=3D"_blank">P=
ASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak-pipe-a:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7020/shard-rkl-1/igt@kms_universal_plane@cursor-fb-leak-pipe-a.html" t=
arget=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/1845" target=3D"_blank">i915#1845</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/intel/issues/4070" target=3D"_blank">i915#4070</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4098" target=3D"=
_blank">i915#4098</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_7986/shard-rkl-6/igt@kms_universal_plane@cursor-fb-leak-pipe-a.=
html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-query-forked:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7020/shard-rkl-3/igt@kms_vblank@pipe-b-query-forked.html" target=3D"_b=
lank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
1845" target=3D"_blank">i915#1845</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/4098" target=3D"_blank">i915#4098</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-rkl-6/igt@km=
s_vblank@pipe-b-query-forked.html" target=3D"_blank">PASS</a> +17 similar i=
ssues</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7020/shard-apl3/igt@gem_pwrite@basic-exhaustion.html" target=3D"_blank=
">WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2658=
" target=3D"_blank">i915#2658</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_7986/shard-apl2/igt@gem_pwrite@basic-exhaustion.htm=
l" target=3D"_blank">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/7248" target=3D"_blank">i915#7248</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei_interface:</p>
<ul>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_7020/shard-tglb7/igt@kms_content_protection@mei_interface.html" target=
=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/7118" target=3D"_blank">i915#7118</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-tglb2/igt@kms_content_protecti=
on@mei_interface.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.=
freedesktop.org/show_bug.cgi?id=3D109300" target=3D"_blank">fdo#109300</a>)=
</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_7020/shard-iclb2/igt@kms_content_protection@mei_interface.html" target=
=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/7118" target=3D"_blank">i915#7118</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-iclb7/igt@kms_content_protecti=
on@mei_interface.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.=
freedesktop.org/show_bug.cgi?id=3D109300" target=3D"_blank">fdo#109300</a>)=
</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-update-sf:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7020/shard-iclb2/igt@kms_psr2_sf@cursor-plane-update-sf.html" target=
=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2920" target=3D"_blank">i915#2920</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_7986/shard-iclb6/igt@kms_psr2_sf@cursor-p=
lane-update-sf.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.fr=
eedesktop.org/show_bug.cgi?id=3D111068" target=3D"_blank">fdo#111068</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/658" target=3D"_=
blank">i915#658</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br>
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7020 -&gt; IGTPW_7986</li>
</ul>
<p>CI-20190529: 20190529<br>
  CI_DRM_12261: 41447224fdfbfbfd1e9ffa5fabc9d277f9c02f8a @ git://<a href=3D=
"http://anongit.freedesktop.org/gfx-ci/linux" target=3D"_blank">anongit.fre=
edesktop.org/gfx-ci/linux</a><br>
  IGTPW_7986: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_798=
6/index.html" target=3D"_blank">https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_7986/index.html</a><br>
  IGT_7020: 05b7eaf9ade2216d17c069c89439015757ee25f7 @ <a href=3D"https://g=
itlab.freedesktop.org/drm/igt-gpu-tools.git" target=3D"_blank">https://gitl=
ab.freedesktop.org/drm/igt-gpu-tools.git</a></p>

</div>

</div></blockquote></div>

--0000000000008b9bc105eb77f09f--
