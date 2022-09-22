Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com
 [IPv6:2607:f8b0:4864:20::b2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2866910EB9C
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Sep 2022 14:28:20 +0000 (UTC)
Received: by mail-yb1-xb2f.google.com with SMTP id 198so13080290ybc.1
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Sep 2022 07:28:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220921193629.244296-1-markyacoub@chromium.org>
 <166385542185.19670.9017767315819497653@emeril.freedesktop.org>
In-Reply-To: <166385542185.19670.9017767315819497653@emeril.freedesktop.org>
From: Mark Yacoub <markyacoub@chromium.org>
Date: Thu, 22 Sep 2022 10:28:07 -0400
Message-ID: <CAJUqKUp_rMu--0T+WVvEsCRnC-RLPotz_HNvFco_BQaBr2axig@mail.gmail.com>
To: "Vudum, Lakshminarayana" <lakshminarayana.vudum@intel.com>
Content-Type: multipart/alternative; boundary="000000000000624fe105e944df90"
Subject: Re: [igt-dev]
	=?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgQ2hhbWVs?=
	=?utf-8?q?ium=3A_Make_autodiscover_discover_connectors_one_at_a_ti?=
	=?utf-8?b?bWUu?=
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

--000000000000624fe105e944df90
Content-Type: text/plain; charset="UTF-8"

Hi Lakshminarayana, the error seems irrelevant, can i get a rerun?

On Thu, Sep 22, 2022 at 10:03 AM Patchwork <patchwork@emeril.freedesktop.org>
wrote:

> *Patch Details*
> *Series:* Chamelium: Make autodiscover discover connectors one at a time.
> *URL:* https://patchwork.freedesktop.org/series/108846/
> *State:* failure
> *Details:* https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7815/index.html CI
> Bug Log - changes from IGT_6660_full -> IGTPW_7815_full Summary
>
> *FAILURE*
>
> Serious unknown changes coming with IGTPW_7815_full absolutely need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_7815_full, please notify your bug team to allow them
> to document this new failure mode, which will reduce false positives in CI.
>
> External URL:
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7815/index.html
> Participating hosts (8 -> 8)
>
> No changes in participating hosts
> Possible new issues
>
> Here are the unknown changes that may have been introduced in
> IGTPW_7815_full:
> IGT changes Possible regressions
>
>    - igt@perf_pmu@busy-double-start@vcs0:
>       - shard-tglb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6660/shard-tglb2/igt@perf_pmu@busy-double-start@vcs0.html>
>       -> INCOMPLETE
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7815/shard-tglb8/igt@perf_pmu@busy-double-start@vcs0.html>
>
> Suppressed
>
> The following results come from untrusted machines, tests, or statuses.
> They do not affect the overall result.
>
>    -
>
>    igt@kms_color@ctm-0-75@pipe-a-edp-1:
>    - {shard-rkl}: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7815/shard-rkl-6/igt@kms_color@ctm-0-75@pipe-a-edp-1.html>
>       +1 similar issue
>    -
>
>    igt@kms_flip@flip-vs-suspend@a-hdmi-a1:
>    - {shard-tglu}: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6660/shard-tglu-1/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html>
>       -> INCOMPLETE
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7815/shard-tglu-1/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html>
>
> New tests
>
> New tests have been introduced between IGT_6660_full and IGTPW_7815_full:
> New IGT tests (16)
>
>    -
>
>    igt@kms_flip_event_leak@basic@pipe-a-dp-1:
>    - Statuses : 1 pass(s)
>       - Exec time: [0.25] s
>    -
>
>    igt@kms_flip_event_leak@basic@pipe-a-edp-1:
>    - Statuses : 2 pass(s)
>       - Exec time: [0.44, 0.54] s
>    -
>
>    igt@kms_flip_event_leak@basic@pipe-a-hdmi-a-1:
>    - Statuses : 2 pass(s)
>       - Exec time: [0.13, 0.55] s
>    -
>
>    igt@kms_flip_event_leak@basic@pipe-a-hdmi-a-2:
>    - Statuses : 1 pass(s)
>       - Exec time: [0.35] s
>    -
>
>    igt@kms_flip_event_leak@basic@pipe-a-vga-1:
>    - Statuses : 1 pass(s)
>       - Exec time: [0.12] s
>    -
>
>    igt@kms_flip_event_leak@basic@pipe-b-dp-1:
>    - Statuses : 1 pass(s)
>       - Exec time: [0.35] s
>    -
>
>    igt@kms_flip_event_leak@basic@pipe-b-edp-1:
>    - Statuses : 2 pass(s)
>       - Exec time: [1.21, 1.27] s
>    -
>
>    igt@kms_flip_event_leak@basic@pipe-b-hdmi-a-1:
>    - Statuses : 2 pass(s)
>       - Exec time: [0.11, 0.31] s
>    -
>
>    igt@kms_flip_event_leak@basic@pipe-b-hdmi-a-2:
>    - Statuses : 1 pass(s)
>       - Exec time: [0.32] s
>    -
>
>    igt@kms_flip_event_leak@basic@pipe-b-vga-1:
>    - Statuses : 1 pass(s)
>       - Exec time: [0.14] s
>    -
>
>    igt@kms_flip_event_leak@basic@pipe-c-dp-1:
>    - Statuses : 1 pass(s)
>       - Exec time: [0.37] s
>    -
>
>    igt@kms_flip_event_leak@basic@pipe-c-edp-1:
>    - Statuses : 2 pass(s)
>       - Exec time: [1.19, 1.28] s
>    -
>
>    igt@kms_flip_event_leak@basic@pipe-c-hdmi-a-1:
>    - Statuses : 2 pass(s)
>       - Exec time: [0.10, 0.43] s
>    -
>
>    igt@kms_flip_event_leak@basic@pipe-c-hdmi-a-2:
>    - Statuses : 1 pass(s)
>       - Exec time: [0.34] s
>    -
>
>    igt@kms_flip_event_leak@basic@pipe-d-edp-1:
>    - Statuses : 1 pass(s)
>       - Exec time: [1.22] s
>    -
>
>    igt@kms_flip_event_leak@basic@pipe-d-hdmi-a-1:
>    - Statuses : 1 pass(s)
>       - Exec time: [0.10] s
>
> Known issues
>
> Here are the changes found in IGTPW_7815_full that come from known issues:
> IGT changes Issues hit
>
>    -
>
>    igt@feature_discovery@psr2:
>    - shard-iclb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6660/shard-iclb2/igt@feature_discovery@psr2.html>
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7815/shard-iclb6/igt@feature_discovery@psr2.html>
>       (i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>)
>    -
>
>    igt@gem_busy@close-race:
>    - shard-snb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6660/shard-snb5/igt@gem_busy@close-race.html>
>       -> TIMEOUT
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7815/shard-snb4/igt@gem_busy@close-race.html>
>       (i915#5748 <https://gitlab.freedesktop.org/drm/intel/issues/5748>)
>    -
>
>    igt@gem_ctx_sseu@invalid-args:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7815/shard-tglb7/igt@gem_ctx_sseu@invalid-args.html>
>       (i915#280 <https://gitlab.freedesktop.org/drm/intel/issues/280>)
>    -
>
>    igt@gem_eio@in-flight-suspend:
>    - shard-apl: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6660/shard-apl6/igt@gem_eio@in-flight-suspend.html>
>       -> DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7815/shard-apl3/igt@gem_eio@in-flight-suspend.html>
>       (i915#180 <https://gitlab.freedesktop.org/drm/intel/issues/180>) +1
>       similar issue
>    -
>
>    igt@gem_exec_balancer@parallel-bb-first:
>    - shard-iclb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6660/shard-iclb2/igt@gem_exec_balancer@parallel-bb-first.html>
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7815/shard-iclb3/igt@gem_exec_balancer@parallel-bb-first.html>
>       (i915#4525 <https://gitlab.freedesktop.org/drm/intel/issues/4525>)
>       +2 similar issues
>    -
>
>    igt@gem_exec_balancer@parallel-contexts:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7815/shard-iclb5/igt@gem_exec_balancer@parallel-contexts.html>
>       (i915#4525 <https://gitlab.freedesktop.org/drm/intel/issues/4525>)
>    -
>
>    igt@gem_exec_fair@basic-none-solo@rcs0:
>    - shard-apl: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6660/shard-apl1/igt@gem_exec_fair@basic-none-solo@rcs0.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7815/shard-apl8/igt@gem_exec_fair@basic-none-solo@rcs0.html>
>       (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
>       +1 similar issue
>    -
>
>    igt@gem_exec_fair@basic-none@bcs0:
>    - shard-tglb: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7815/shard-tglb2/igt@gem_exec_fair@basic-none@bcs0.html>
>       (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
>       +4 similar issues
>    -
>
>    igt@gem_exec_fair@basic-none@rcs0:
>    - shard-glk: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7815/shard-glk3/igt@gem_exec_fair@basic-none@rcs0.html>
>       (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
>    -
>
>    igt@gem_exec_fair@basic-none@vecs0:
>    - shard-iclb: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7815/shard-iclb8/igt@gem_exec_fair@basic-none@vecs0.html>
>       (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
>       +3 similar issues
>    -
>
>    igt@gem_exec_fair@basic-pace-share@rcs0:
>    - shard-tglb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6660/shard-tglb7/igt@gem_exec_fair@basic-pace-share@rcs0.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7815/shard-tglb7/igt@gem_exec_fair@basic-pace-share@rcs0.html>
>       (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
>    -
>
>    igt@gem_lmem_swapping@basic:
>    - shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7815/shard-apl1/igt@gem_lmem_swapping@basic.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#4613 <https://gitlab.freedesktop.org/drm/intel/issues/4613>)
>    -
>
>    igt@gem_pxp@create-regular-context-2:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7815/shard-iclb2/igt@gem_pxp@create-regular-context-2.html>
>       (i915#4270 <https://gitlab.freedesktop.org/drm/intel/issues/4270>)
>    -
>
>    igt@gem_pxp@fail-invalid-protected-context:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7815/shard-tglb8/igt@gem_pxp@fail-invalid-protected-context.html>
>       (i915#4270 <https://gitlab.freedesktop.org/drm/intel/issues/4270>)
>       +1 similar issue
>    -
>
>    igt@gem_render_copy@y-tiled-mc-ccs-to-y-tiled-ccs:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7815/shard-iclb3/igt@gem_render_copy@y-tiled-mc-ccs-to-y-tiled-ccs.html>
>       (i915#768 <https://gitlab.freedesktop.org/drm/intel/issues/768>)
>    -
>
>    igt@gen7_exec_parse@basic-offset:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7815/shard-iclb2/igt@gen7_exec_parse@basic-offset.html>
>       (fdo#109289 <https://bugs.freedesktop.org/show_bug.cgi?id=109289>)
>       +2 similar issues
>    -
>
>    igt@gen7_exec_parse@load-register-reg:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7815/shard-tglb7/igt@gen7_exec_parse@load-register-reg.html>
>       (fdo#109289 <https://bugs.freedesktop.org/show_bug.cgi?id=109289>)
>       +2 similar issues
>    -
>
>    igt@gen9_exec_parse@bb-start-param:
>    -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7815/shard-iclb6/igt@gen9_exec_parse@bb-start-param.html>
>       (i915#2856 <https://gitlab.freedesktop.org/drm/intel/issues/2856>)
>       -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7815/shard-tglb3/igt@gen9_exec_parse@bb-start-param.html>
>       (i915#2527 <https://gitlab.freedesktop.org/drm/intel/issues/2527> /
>       i915#2856 <https://gitlab.freedesktop.org/drm/intel/issues/2856>)
>       -
>
>    igt@i915_pm_rpm@dpms-non-lpsp:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7815/shard-tglb5/igt@i915_pm_rpm@dpms-non-lpsp.html>
>       (fdo#111644 <https://bugs.freedesktop.org/show_bug.cgi?id=111644> /
>       i915#1397 <https://gitlab.freedesktop.org/drm/intel/issues/1397> /
>       i915#2411 <https://gitlab.freedesktop.org/drm/intel/issues/2411>)
>    -
>
>    igt@kms_big_fb@4-tiled-8bpp-rotate-180:
>    -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7815/shard-tglb5/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html>
>       (i915#5286 <https://gitlab.freedesktop.org/drm/intel/issues/5286>)
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7815/shard-iclb4/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html>
>       (i915#5286 <https://gitlab.freedesktop.org/drm/intel/issues/5286>)
>       -
>
>    igt@kms_big_fb@yf-tiled-8bpp-rotate-90:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7815/shard-iclb4/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html>
>       (fdo#110723 <https://bugs.freedesktop.org/show_bug.cgi?id=110723>)
>    -
>
>    igt@kms_big_fb@yf-tiled-addfb:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7815/shard-tglb5/igt@kms_big_fb@yf-tiled-addfb.html>
>       (fdo#111615 <https://bugs.freedesktop.org/show_bug.cgi?id=111615>)
>       +1 similar issue
>    -
>
>    igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_ccs:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7815/shard-tglb8/igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_ccs.html>
>       (i915#3689 <https://gitlab.freedesktop.org/drm/intel/issues/3689>)
>       +2 similar issues
>    -
>
>    igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_mc_ccs:
>    - shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7815/shard-apl6/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#3886 <https://gitlab.freedesktop.org/drm/intel/issues/3886>)
>       +3 similar issues
>    -
>
>    igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:
>    -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7815/shard-iclb7/igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html>
>       (fdo#109278 <https://bugs.freedesktop.org/show_bug.cgi?id=109278> /
>       i915#3886 <https://gitlab.freedesktop.org/drm/intel/issues/3886>)
>       +1 similar issue
>       -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7815/shard-tglb5/igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html>
>       (i915#3689 <https://gitlab.freedesktop.org/drm/intel/issues/3689> /
>       i915#3886 <https://gitlab.freedesktop.org/drm/intel/issues/3886>)
>       -
>
>       shard-glk: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7815/shard-glk6/igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#3886 <https://gitlab.freedesktop.org/drm/intel/issues/3886>)
>       +1 similar issue
>       -
>
>    igt@kms_ccs@pipe-c-crc-primary-rotation-180-yf_tiled_ccs:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7815/shard-tglb1/igt@kms_ccs@pipe-c-crc-primary-rotation-180-yf_tiled_ccs.html>
>       (fdo#111615 <https://bugs.freedesktop.org/show_bug.cgi?id=111615> /
>       i915#3689 <https://gitlab.freedesktop.org/drm/intel/issues/3689>)
>       +1 similar issue
>    -
>
>    igt@kms_chamelium@hdmi-crc-fast:
>    -
>
>       shard-glk: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7815/shard-glk6/igt@kms_chamelium@hdmi-crc-fast.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>)
>       +1 similar issue
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7815/shard-iclb1/igt@kms_chamelium@hdmi-crc-fast.html>
>       (fdo#109284 <https://bugs.freedesktop.org/show_bug.cgi?id=109284> /
>       fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>)
>       +1 similar issue
>       -
>
>    igt@kms_chamelium@vga-hpd-fast:
>    -
>
>       shard-snb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7815/shard-snb2/igt@kms_chamelium@vga-hpd-fast.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>)
>       +1 similar issue
>       -
>
>       shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7815/shard-apl3/igt@kms_chamelium@vga-hpd-fast.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>)
>       +2 similar issues
>       -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7815/shard-tglb8/igt@kms_chamelium@vga-hpd-fast.html>
>       (fdo#109284 <https://bugs.freedesktop.org/show_bug.cgi?id=109284> /
>       fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>)
>       +1 similar issue
>       -
>
>    igt@kms_color@ctm-0-25@pipe-b-dp-1:
>    - shard-apl: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7815/shard-apl7/igt@kms_color@ctm-0-25@pipe-b-dp-1.html>
>       (i915#315 <https://gitlab.freedesktop.org/drm/intel/issues/315>) +2
>       similar issues
>    -
>
>    igt@kms_content_protection@dp-mst-lic-type-1:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7815/shard-tglb7/igt@kms_content_protection@dp-mst-lic-type-1.html>
>       (i915#3116 <https://gitlab.freedesktop.org/drm/intel/issues/3116> /
>       i915#3299 <https://gitlab.freedesktop.org/drm/intel/issues/3299>)
>    -
>
>    igt@kms_cursor_crc@cursor-offscreen-32x32:
>    -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7815/shard-tglb2/igt@kms_cursor_crc@cursor-offscreen-32x32.html>
>       (i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555>)
>       +1 similar issue
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7815/shard-iclb6/igt@kms_cursor_crc@cursor-offscreen-32x32.html>
>       (i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555>)
>       +2 similar issues
>       -
>
>    igt@kms_fbcon_fbt@fbc-suspend:
>    - shard-apl: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6660/shard-apl7/igt@kms_fbcon_fbt@fbc-suspend.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7815/shard-apl1/igt@kms_fbcon_fbt@fbc-suspend.html>
>       (i915#4767 <https://gitlab.freedesktop.org/drm/intel/issues/4767>)
>    -
>
>    igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7815/shard-tglb5/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html>
>       (fdo#109274 <https://bugs.freedesktop.org/show_bug.cgi?id=109274> /
>       fdo#111825 <https://bugs.freedesktop.org/show_bug.cgi?id=111825> /
>       i915#3637 <https://gitlab.freedesktop.org/drm/intel/issues/3637>)
>       +2 similar issues
>    -
>
>    igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7815/shard-iclb2/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html>
>       (fdo#109274 <https://bugs.freedesktop.org/show_bug.cgi?id=109274>)
>       +3 similar issues
>    -
>
>    igt@kms_flip@2x-plain-flip-fb-recreate:
>    - shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7815/shard-apl6/igt@kms_flip@2x-plain-flip-fb-recreate.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>)
>       +110 similar issues
>    -
>
>    igt@kms_flip_scaled_crc
>    @flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-default-mode:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7815/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-default-mode.html>
>       (i915#2672 <https://gitlab.freedesktop.org/drm/intel/issues/2672>)
>       +4 similar issues
>    -
>
>    igt@kms_flip_scaled_crc
>    @flip-64bpp-yftile-to-16bpp-yftile-downscaling@pipe-a-valid-mode:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7815/shard-tglb8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling@pipe-a-valid-mode.html>
>       (i915#2587 <https://gitlab.freedesktop.org/drm/intel/issues/2587> /
>       i915#2672 <https://gitlab.freedesktop.org/drm/intel/issues/2672>)
>    -
>
>    igt@kms_flip_scaled_crc
>    @flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7815/shard-iclb4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode.html>
>       (i915#2587 <https://gitlab.freedesktop.org/drm/intel/issues/2587> /
>       i915#2672 <https://gitlab.freedesktop.org/drm/intel/issues/2672>)
>    -
>
>    igt@kms_frontbuffer_tracking
>    @fbcpsr-1p-primscrn-pri-indfb-draw-mmap-cpu:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7815/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-cpu.html>
>       (i915#6497 <https://gitlab.freedesktop.org/drm/intel/issues/6497>)
>       +5 similar issues
>    -
>
>    igt@kms_frontbuffer_tracking
>    @fbcpsr-2p-primscrn-pri-indfb-draw-mmap-cpu:
>    - shard-snb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7815/shard-snb4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-cpu.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>)
>       +77 similar issues
>    -
>
>    igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7815/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc.html>
>       (fdo#109280 <https://bugs.freedesktop.org/show_bug.cgi?id=109280> /
>       fdo#111825 <https://bugs.freedesktop.org/show_bug.cgi?id=111825>)
>       +8 similar issues
>    -
>
>    igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc:
>    -
>
>       shard-glk: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7815/shard-glk6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>)
>       +43 similar issues
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7815/shard-iclb4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc.html>
>       (fdo#109280 <https://bugs.freedesktop.org/show_bug.cgi?id=109280>)
>       +6 similar issues
>       -
>
>    igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max:
>    - shard-apl: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7815/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max.html>
>       (fdo#108145 <https://bugs.freedesktop.org/show_bug.cgi?id=108145> /
>       i915#265 <https://gitlab.freedesktop.org/drm/intel/issues/265>) +1
>       similar issue
>    -
>
>    igt@kms_plane_scaling
>    @planes-upscale-20x20-downscale-factor-0-5@pipe-b-edp-1:
>    - shard-iclb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6660/shard-iclb1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b-edp-1.html>
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7815/shard-iclb2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b-edp-1.html>
>       (i915#5235 <https://gitlab.freedesktop.org/drm/intel/issues/5235>)
>       +2 similar issues
>    -
>
>    igt@kms_prime@basic-modeset-hybrid:
>    -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7815/shard-tglb7/igt@kms_prime@basic-modeset-hybrid.html>
>       (i915#6524 <https://gitlab.freedesktop.org/drm/intel/issues/6524>)
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7815/shard-iclb1/igt@kms_prime@basic-modeset-hybrid.html>
>       (i915#6524 <https://gitlab.freedesktop.org/drm/intel/issues/6524>)
>       -
>
>    igt@kms_psr2_sf@cursor-plane-update-sf:
>    -
>
>       shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7815/shard-apl6/igt@kms_psr2_sf@cursor-plane-update-sf.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>) +1
>       similar issue
>       -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7815/shard-tglb5/igt@kms_psr2_sf@cursor-plane-update-sf.html>
>       (i915#2920 <https://gitlab.freedesktop.org/drm/intel/issues/2920>)
>       -
>
>       shard-glk: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7815/shard-glk5/igt@kms_psr2_sf@cursor-plane-update-sf.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>)
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7815/shard-iclb4/igt@kms_psr2_sf@cursor-plane-update-sf.html>
>       (fdo#111068 <https://bugs.freedesktop.org/show_bug.cgi?id=111068> /
>       i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>)
>       -
>
>    igt@kms_psr2_su@page_flip-xrgb8888:
>    - shard-iclb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6660/shard-iclb2/igt@kms_psr2_su@page_flip-xrgb8888.html>
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7815/shard-iclb7/igt@kms_psr2_su@page_flip-xrgb8888.html>
>       (fdo#109642 <https://bugs.freedesktop.org/show_bug.cgi?id=109642> /
>       fdo#111068 <https://bugs.freedesktop.org/show_bug.cgi?id=111068> /
>       i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>)
>    -
>
>    igt@kms_psr@psr2_cursor_mmap_gtt:
>    -
>
>       shard-tglb: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7815/shard-tglb5/igt@kms_psr@psr2_cursor_mmap_gtt.html>
>       (i915#132 <https://gitlab.freedesktop.org/drm/intel/issues/132> /
>       i915#3467 <https://gitlab.freedesktop.org/drm/intel/issues/3467>)
>       +1 similar issue
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7815/shard-iclb4/igt@kms_psr@psr2_cursor_mmap_gtt.html>
>       (fdo#109441 <https://bugs.freedesktop.org/show_bug.cgi?id=109441>)
>       -
>
>    igt@kms_psr@psr2_sprite_render:
>    - shard-iclb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6660/shard-iclb2/igt@kms_psr@psr2_sprite_render.html>
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7815/shard-iclb7/igt@kms_psr@psr2_sprite_render.html>
>       (fdo#109441 <https://bugs.freedesktop.org/show_bug.cgi?id=109441>)
>       +3 similar issues
>    -
>
>    igt@kms_vblank@pipe-d-query-forked-hang:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7815/shard-iclb7/igt@kms_vblank@pipe-d-query-forked-hang.html>
>       (fdo#109278 <https://bugs.freedesktop.org/show_bug.cgi?id=109278>)
>       +7 similar issues
>    -
>
>    igt@nouveau_crc@pipe-c-ctx-flip-detection:
>    -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7815/shard-iclb8/igt@nouveau_crc@pipe-c-ctx-flip-detection.html>
>       (i915#2530 <https://gitlab.freedesktop.org/drm/intel/issues/2530>)
>       -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7815/shard-tglb2/igt@nouveau_crc@pipe-c-ctx-flip-detection.html>
>       (i915#2530 <https://gitlab.freedesktop.org/drm/intel/issues/2530>)
>       +1 similar issue
>       -
>
>    igt@prime_nv_api@i915_nv_import_twice:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7815/shard-tglb3/igt@prime_nv_api@i915_nv_import_twice.html>
>       (fdo#109291 <https://bugs.freedesktop.org/show_bug.cgi?id=109291>)
>       +2 similar issues
>    -
>
>    igt@prime_nv_test@i915_import_pread_pwrite:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7815/shard-iclb4/igt@prime_nv_test@i915_import_pread_pwrite.html>
>       (fdo#109291 <https://bugs.freedesktop.org/show_bug.cgi?id=109291>)
>       +2 similar issues
>    -
>
>    igt@prime_vgem@fence-write-hang:
>    -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7815/shard-iclb6/igt@prime_vgem@fence-write-hang.html>
>       (fdo#109295 <https://bugs.freedesktop.org/show_bug.cgi?id=109295>)
>       -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7815/shard-tglb3/igt@prime_vgem@fence-write-hang.html>
>       (fdo#109295 <https://bugs.freedesktop.org/show_bug.cgi?id=109295>)
>       -
>
>    igt@sysfs_clients@busy:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7815/shard-tglb1/igt@sysfs_clients@busy.html>
>       (i915#2994 <https://gitlab.freedesktop.org/drm/intel/issues/2994>)
>    -
>
>    igt@sysfs_clients@split-50:
>    - shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7815/shard-apl7/igt@sysfs_clients@split-50.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#2994 <https://gitlab.freedesktop.org/drm/intel/issues/2994>)
>
> Possible fixes
>
>    -
>
>    igt@gem_bad_reloc@negative-reloc-lut:
>    - {shard-rkl}: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6660/shard-rkl-2/igt@gem_bad_reloc@negative-reloc-lut.html>
>       (i915#3281 <https://gitlab.freedesktop.org/drm/intel/issues/3281>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7815/shard-rkl-5/igt@gem_bad_reloc@negative-reloc-lut.html>
>       +8 similar issues
>    -
>
>    igt@gem_eio@reset-stress:
>    - shard-tglb: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6660/shard-tglb3/igt@gem_eio@reset-stress.html>
>       (i915#5784 <https://gitlab.freedesktop.org/drm/intel/issues/5784>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7815/shard-tglb8/igt@gem_eio@reset-stress.html>
>    -
>
>    igt@gem_exec_fair@basic-none-share@rcs0:
>    -
>
>       shard-glk: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6660/shard-glk6/igt@gem_exec_fair@basic-none-share@rcs0.html>
>       (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7815/shard-glk9/igt@gem_exec_fair@basic-none-share@rcs0.html>
>       -
>
>       shard-iclb: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6660/shard-iclb3/igt@gem_exec_fair@basic-none-share@rcs0.html>
>       (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7815/shard-iclb3/igt@gem_exec_fair@basic-none-share@rcs0.html>
>       -
>
>    igt@gem_exec_schedule@semaphore-power:
>    - {shard-rkl}: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6660/shard-rkl-6/igt@gem_exec_schedule@semaphore-power.html>
>       (fdo#110254 <https://bugs.freedesktop.org/show_bug.cgi?id=110254>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7815/shard-rkl-5/igt@gem_exec_schedule@semaphore-power.html>
>    -
>
>    igt@gem_mmap_gtt@coherency:
>    - {shard-rkl}: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6660/shard-rkl-1/igt@gem_mmap_gtt@coherency.html>
>       (fdo#111656 <https://bugs.freedesktop.org/show_bug.cgi?id=111656>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7815/shard-rkl-5/igt@gem_mmap_gtt@coherency.html>
>    -
>
>    igt@gem_set_tiling_vs_pwrite:
>    - {shard-rkl}: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6660/shard-rkl-6/igt@gem_set_tiling_vs_pwrite.html>
>       (i915#3282 <https://gitlab.freedesktop.org/drm/intel/issues/3282>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7815/shard-rkl-5/igt@gem_set_tiling_vs_pwrite.html>
>       +3 similar issues
>    -
>
>    igt@gen9_exec_parse@shadow-peek:
>    - {shard-rkl}: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6660/shard-rkl-1/igt@gen9_exec_parse@shadow-peek.html>
>       (i915#2527 <https://gitlab.freedesktop.org/drm/intel/issues/2527>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7815/shard-rkl-5/igt@gen9_exec_parse@shadow-peek.html>
>       +2 similar issues
>    -
>
>    igt@i915_pm_dc@dc9-dpms:
>    - {shard-tglu}: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6660/shard-tglu-3/igt@i915_pm_dc@dc9-dpms.html>
>       (i915#4281 <https://gitlab.freedesktop.org/drm/intel/issues/4281>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7815/shard-tglu-2/igt@i915_pm_dc@dc9-dpms.html>
>    -
>
>    igt@i915_pm_rps@waitboost:
>    - {shard-rkl}: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6660/shard-rkl-1/igt@i915_pm_rps@waitboost.html>
>       (i915#4016 <https://gitlab.freedesktop.org/drm/intel/issues/4016>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7815/shard-rkl-1/igt@i915_pm_rps@waitboost.html>
>    -
>
>    igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
>    - {shard-rkl}: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6660/shard-rkl-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html>
>       (i915#1845 <https://gitlab.freedesktop.org/drm/intel/issues/1845> /
>       i915#4098 <https://gitlab.freedesktop.org/drm/intel/issues/4098>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7815/shard-rkl-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html>
>       +13 similar issues
>    -
>
>    igt@kms_flip@flip-vs-suspend-interruptible@c-dp1:
>    - shard-apl: DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6660/shard-apl8/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html>
>       (i915#180 <https://gitlab.freedesktop.org/drm/intel/issues/180>) ->
>       PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7815/shard-apl7/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html>
>       +1 similar issue
>    -
>
>    igt@kms_flip_scaled_crc
>    @flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-default-mode:
>    - shard-iclb: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6660/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-default-mode.html>
>       (i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7815/shard-iclb3/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-default-mode.html>
>       +1 similar issue
>    -
>
>    igt@kms_frontbuffer_tracking@fbc-modesetfrombusy:
>    - {shard-rkl}: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6660/shard-rkl-1/igt@kms_frontbuffer_tracking@fbc-modesetfrombusy.html>
>       (i915#1849 <https://gitlab.freedesktop.org/drm/intel/issues/1849> /
>       i915#4098 <https://gitlab.freedesktop.org/drm/intel/issues/4098>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7815/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-modesetfrombusy.html>
>       +7 similar issues
>    -
>
>    igt@kms_hdmi_inject@inject-audio:
>    -
>
>       shard-tglb: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6660/shard-tglb3/igt@kms_hdmi_inject@inject-audio.html>
>       (i915#433 <https://gitlab.freedesktop.org/drm/intel/issues/433>) ->
>       PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7815/shard-tglb3/igt@kms_hdmi_inject@inject-audio.html>
>       -
>
>       {shard-tglu}: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6660/shard-tglu-6/igt@kms_hdmi_inject@inject-audio.html>
>       (i915#433 <https://gitlab.freedesktop.org/drm/intel/issues/433>) ->
>       PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7815/shard-tglu-6/igt@kms_hdmi_inject@inject-audio.html>
>       -
>
>    igt@kms_plane_alpha_blend@pipe-b-alpha-7efc:
>    - {shard-rkl}: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6660/shard-rkl-1/igt@kms_plane_alpha_blend@pipe-b-alpha-7efc.html>
>       (i915#1849 <https://gitlab.freedesktop.org/drm/intel/issues/1849> /
>       i915#3546 <https://gitlab.freedesktop.org/drm/intel/issues/3546> /
>       i915#4070 <https://gitlab.freedesktop.org/drm/intel/issues/4070> /
>       i915#4098 <https://gitlab.freedesktop.org/drm/intel/issues/4098>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7815/shard-rkl-6/igt@kms_plane_alpha_blend@pipe-b-alpha-7efc.html>
>    -
>
>    igt@kms_plane_scaling
>    @planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a-edp-1:
>    - shard-iclb: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6660/shard-iclb2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a-edp-1.html>
>       (i915#5235 <https://gitlab.freedesktop.org/drm/intel/issues/5235>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7815/shard-iclb3/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a-edp-1.html>
>       +2 similar issues
>    -
>
>    igt@kms_properties@plane-properties-legacy:
>    - {shard-rkl}: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6660/shard-rkl-5/igt@kms_properties@plane-properties-legacy.html>
>       (i915#1849 <https://gitlab.freedesktop.org/drm/intel/issues/1849>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7815/shard-rkl-6/igt@kms_properties@plane-properties-legacy.html>
>    -
>
>    igt@kms_psr@psr2_no_drrs:
>    - shard-iclb: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6660/shard-iclb4/igt@kms_psr@psr2_no_drrs.html>
>       (fdo#109441 <https://bugs.freedesktop.org/show_bug.cgi?id=109441>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7815/shard-iclb2/igt@kms_psr@psr2_no_drrs.html>
>       +2 similar issues
>    -
>
>    igt@kms_psr@sprite_mmap_gtt:
>    - {shard-rkl}: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6660/shard-rkl-1/igt@kms_psr@sprite_mmap_gtt.html>
>       (i915#1072 <https://gitlab.freedesktop.org/drm/intel/issues/1072>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7815/shard-rkl-6/igt@kms_psr@sprite_mmap_gtt.html>
>       +1 similar issue
>    -
>
>    igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
>    - shard-iclb: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6660/shard-iclb1/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html>
>       (i915#5519 <https://gitlab.freedesktop.org/drm/intel/issues/5519>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7815/shard-iclb3/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html>
>    -
>
>    igt@perf@polling-parameterized:
>    - {shard-rkl}: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6660/shard-rkl-1/igt@perf@polling-parameterized.html>
>       (i915#5639 <https://gitlab.freedesktop.org/drm/intel/issues/5639>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7815/shard-rkl-2/igt@perf@polling-parameterized.html>
>
> Warnings
>
>    -
>
>    igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf:
>    - shard-iclb: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6660/shard-iclb3/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html>
>       (i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>) ->
>       SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7815/shard-iclb2/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html>
>       (i915#2920 <https://gitlab.freedesktop.org/drm/intel/issues/2920>)
>    -
>
>    igt@kms_psr2_sf@overlay-plane-move-continuous-sf:
>    - shard-iclb: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6660/shard-iclb2/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html>
>       (i915#2920 <https://gitlab.freedesktop.org/drm/intel/issues/2920>)
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7815/shard-iclb6/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html>
>       (i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>)
>
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> Build changes
>
>    - CI: CI-20190529 -> None
>    - IGT: IGT_6660 -> IGTPW_7815
>
> CI-20190529: 20190529
> CI_DRM_12166: 3e89f6dc5d22dcc4f56bed3abade8107c95815b3 @ git://
> anongit.freedesktop.org/gfx-ci/linux
> IGTPW_7815: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7815/index.html
> IGT_6660: 129bea58b9424f0a0da995311a219fdf57732594 @
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>

--000000000000624fe105e944df90
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Lakshminarayana, the error seems irrelevant, can i get =
a rerun?</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmai=
l_attr">On Thu, Sep 22, 2022 at 10:03 AM Patchwork &lt;<a href=3D"mailto:pa=
tchwork@emeril.freedesktop.org">patchwork@emeril.freedesktop.org</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div class=
=3D"msg-2992517707368379509">
<u></u>

=20
 =20
 =20
 =20

<div>


<b>Patch Details</b>
<table>
<tbody><tr><td><b>Series:</b></td><td>Chamelium: Make autodiscover discover=
 connectors one at a time.</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/108846/" target=3D"_blank">https://patchwork.freedesktop.org/series/10=
8846/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7815/index.html" target=3D"_blank">https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_7815/index.html</a></td></tr>

</tbody></table>


    <h1>CI Bug Log - changes from IGT_6660_full -&gt; IGTPW_7815_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_7815_full absolutely need to b=
e<br>
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
>
  introduced in IGTPW_7815_full, please notify your bug team to allow them<=
br>
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7815/index.html" target=3D"_blank">https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_7815/index.html</a></p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7815=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@perf_pmu@busy-double-start@vcs0:<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6660/shard-tglb2/igt@perf_pmu@busy-double-start@vcs0.html" target=3D"_=
blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_7815/shard-tglb8/igt@perf_pmu@busy-double-start@vcs0.html" target=3D"_=
blank">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br>
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_color@ctm-0-75@pipe-a-edp-1:</p>
<ul>
<li>{shard-rkl}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7815/shard-rkl-6/igt@kms_color@ctm-0-75@pipe-a-edp-1.ht=
ml" target=3D"_blank">FAIL</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-hdmi-a1:</p>
<ul>
<li>{shard-tglu}:       <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6660/shard-tglu-1/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html" target=
=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_7815/shard-tglu-1/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html" ta=
rget=3D"_blank">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_6660_full and IGTPW_7815_full=
:</p>
<h3>New IGT tests (16)</h3>
<ul>
<li>
<p>igt@kms_flip_event_leak@basic@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_event_leak@basic@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.44, 0.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_event_leak@basic@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.13, 0.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_event_leak@basic@pipe-a-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_event_leak@basic@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_event_leak@basic@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_event_leak@basic@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.21, 1.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_event_leak@basic@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.11, 0.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_event_leak@basic@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_event_leak@basic@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_event_leak@basic@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_event_leak@basic@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.19, 1.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_event_leak@basic@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.10, 0.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_event_leak@basic@pipe-c-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_event_leak@basic@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_event_leak@basic@pipe-d-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.10] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7815_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@feature_discovery@psr2:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6660/shard-iclb2/igt@feature_discovery@psr2.html" target=3D"_blank">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7815=
/shard-iclb6/igt@feature_discovery@psr2.html" target=3D"_blank">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/658" target=3D"_b=
lank">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_busy@close-race:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6660/shard-snb5/igt@gem_busy@close-race.html" target=3D"_blank">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7815/sha=
rd-snb4/igt@gem_busy@close-race.html" target=3D"_blank">TIMEOUT</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/5748" target=3D"_blank=
">i915#5748</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-args:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7815/shard-tglb7/igt@gem_ctx_sseu@invalid-args.html" ta=
rget=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/280" target=3D"_blank">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-suspend:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6660/shard-apl6/igt@gem_eio@in-flight-suspend.html" target=3D"_blank">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_78=
15/shard-apl3/igt@gem_eio@in-flight-suspend.html" target=3D"_blank">DMESG-W=
ARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180" ta=
rget=3D"_blank">i915#180</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-bb-first:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6660/shard-iclb2/igt@gem_exec_balancer@parallel-bb-first.html" target=
=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_7815/shard-iclb3/igt@gem_exec_balancer@parallel-bb-first.html" ta=
rget=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/4525" target=3D"_blank">i915#4525</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-contexts:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7815/shard-iclb5/igt@gem_exec_balancer@parallel-context=
s.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/4525" target=3D"_blank">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6660/shard-apl1/igt@gem_exec_fair@basic-none-solo@rcs0.html" target=3D=
"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_7815/shard-apl8/igt@gem_exec_fair@basic-none-solo@rcs0.html" target=
=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2842" target=3D"_blank">i915#2842</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@bcs0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7815/shard-tglb2/igt@gem_exec_fair@basic-none@bcs0.html=
" target=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/2842" target=3D"_blank">i915#2842</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@rcs0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7815/shard-glk3/igt@gem_exec_fair@basic-none@rcs0.html"=
 target=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/2842" target=3D"_blank">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vecs0:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7815/shard-iclb8/igt@gem_exec_fair@basic-none@vecs0.htm=
l" target=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/2842" target=3D"_blank">i915#2842</a>) +3 similar issues</li=
>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6660/shard-tglb7/igt@gem_exec_fair@basic-pace-share@rcs0.html" target=
=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_7815/shard-tglb7/igt@gem_exec_fair@basic-pace-share@rcs0.html" ta=
rget=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/2842" target=3D"_blank">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7815/shard-apl1/igt@gem_lmem_swapping@basic.html" targe=
t=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/4613" target=3D"_blank">i915#4613</a>)</li=
>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-regular-context-2:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7815/shard-iclb2/igt@gem_pxp@create-regular-context-2.h=
tml" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/4270" target=3D"_blank">i915#4270</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@fail-invalid-protected-context:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7815/shard-tglb8/igt@gem_pxp@fail-invalid-protected-con=
text.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/4270" target=3D"_blank">i915#4270</a>) +1 similar is=
sue</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-mc-ccs-to-y-tiled-ccs:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7815/shard-iclb3/igt@gem_render_copy@y-tiled-mc-ccs-to-=
y-tiled-ccs.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/768" target=3D"_blank">i915#768</a>)</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-offset:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7815/shard-iclb2/igt@gen7_exec_parse@basic-offset.html"=
 target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D109289" target=3D"_blank">fdo#109289</a>) +2 similar issues</li=
>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@load-register-reg:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7815/shard-tglb7/igt@gen7_exec_parse@load-register-reg.=
html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D109289" target=3D"_blank">fdo#109289</a>) +2 similar issue=
s</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-param:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7815/shard-iclb6/igt@gen9_exec_parse@bb-start-param.html=
" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/2856" target=3D"_blank">i915#2856</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7815/shard-tglb3/igt@gen9_exec_parse@bb-start-param.html=
" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/2527" target=3D"_blank">i915#2527</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/2856" target=3D"_blank">i915#2856</a>=
)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7815/shard-tglb5/igt@i915_pm_rpm@dpms-non-lpsp.html" ta=
rget=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D111644" target=3D"_blank">fdo#111644</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/1397" target=3D"_blank">i915#1397</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2411" target=3D=
"_blank">i915#2411</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-180:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7815/shard-tglb5/igt@kms_big_fb@4-tiled-8bpp-rotate-180.=
html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/5286" target=3D"_blank">i915#5286</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7815/shard-iclb4/igt@kms_big_fb@4-tiled-8bpp-rotate-180.=
html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/5286" target=3D"_blank">i915#5286</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7815/shard-iclb4/igt@kms_big_fb@yf-tiled-8bpp-rotate-90=
.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D110723" target=3D"_blank">fdo#110723</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7815/shard-tglb5/igt@kms_big_fb@yf-tiled-addfb.html" ta=
rget=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D111615" target=3D"_blank">fdo#111615</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7815/shard-tglb8/igt@kms_ccs@pipe-c-bad-aux-stride-y_ti=
led_ccs.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/3689" target=3D"_blank">i915#3689</a>) +2 similar=
 issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7815/shard-apl6/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_=
tiled_gen12_mc_ccs.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bug=
s.freedesktop.org/show_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3886" target=
=3D"_blank">i915#3886</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7815/shard-iclb7/igt@kms_ccs@pipe-c-crc-primary-rotation=
-180-y_tiled_gen12_mc_ccs.html" target=3D"_blank">SKIP</a> (<a href=3D"http=
s://bugs.freedesktop.org/show_bug.cgi?id=3D109278" target=3D"_blank">fdo#10=
9278</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3886"=
 target=3D"_blank">i915#3886</a>) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7815/shard-tglb5/igt@kms_ccs@pipe-c-crc-primary-rotation=
-180-y_tiled_gen12_mc_ccs.html" target=3D"_blank">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/3689" target=3D"_blank">i915#36=
89</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3886" t=
arget=3D"_blank">i915#3886</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7815/shard-glk6/igt@kms_ccs@pipe-c-crc-primary-rotation-=
180-y_tiled_gen12_mc_ccs.html" target=3D"_blank">SKIP</a> (<a href=3D"https=
://bugs.freedesktop.org/show_bug.cgi?id=3D109271" target=3D"_blank">fdo#109=
271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3886" =
target=3D"_blank">i915#3886</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-primary-rotation-180-yf_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7815/shard-tglb1/igt@kms_ccs@pipe-c-crc-primary-rotatio=
n-180-yf_tiled_ccs.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bug=
s.freedesktop.org/show_bug.cgi?id=3D111615" target=3D"_blank">fdo#111615</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3689" target=
=3D"_blank">i915#3689</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-crc-fast:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7815/shard-glk6/igt@kms_chamelium@hdmi-crc-fast.html" ta=
rget=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D"https://bugs=
.freedesktop.org/show_bug.cgi?id=3D111827" target=3D"_blank">fdo#111827</a>=
) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7815/shard-iclb1/igt@kms_chamelium@hdmi-crc-fast.html" t=
arget=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug=
.cgi?id=3D109284" target=3D"_blank">fdo#109284</a> / <a href=3D"https://bug=
s.freedesktop.org/show_bug.cgi?id=3D111827" target=3D"_blank">fdo#111827</a=
>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-fast:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7815/shard-snb2/igt@kms_chamelium@vga-hpd-fast.html" tar=
get=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D"https://bugs.=
freedesktop.org/show_bug.cgi?id=3D111827" target=3D"_blank">fdo#111827</a>)=
 +1 similar issue</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7815/shard-apl3/igt@kms_chamelium@vga-hpd-fast.html" tar=
get=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D"https://bugs.=
freedesktop.org/show_bug.cgi?id=3D111827" target=3D"_blank">fdo#111827</a>)=
 +2 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7815/shard-tglb8/igt@kms_chamelium@vga-hpd-fast.html" ta=
rget=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D109284" target=3D"_blank">fdo#109284</a> / <a href=3D"https://bugs=
.freedesktop.org/show_bug.cgi?id=3D111827" target=3D"_blank">fdo#111827</a>=
) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-b-dp-1:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7815/shard-apl7/igt@kms_color@ctm-0-25@pipe-b-dp-1.html=
" target=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/315" target=3D"_blank">i915#315</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7815/shard-tglb7/igt@kms_content_protection@dp-mst-lic-=
type-1.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/3116" target=3D"_blank">i915#3116</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/3299" target=3D"_blank">i9=
15#3299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x32:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7815/shard-tglb2/igt@kms_cursor_crc@cursor-offscreen-32x=
32.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/3555" target=3D"_blank">i915#3555</a>) +1 similar issu=
e</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7815/shard-iclb6/igt@kms_cursor_crc@cursor-offscreen-32x=
32.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/3555" target=3D"_blank">i915#3555</a>) +2 similar issu=
es</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6660/shard-apl7/igt@kms_fbcon_fbt@fbc-suspend.html" target=3D"_blank">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_78=
15/shard-apl1/igt@kms_fbcon_fbt@fbc-suspend.html" target=3D"_blank">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4767" target=
=3D"_blank">i915#4767</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7815/shard-tglb5/igt@kms_flip@2x-flip-vs-absolute-wf_vb=
lank.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.=
org/show_bug.cgi?id=3D109274" target=3D"_blank">fdo#109274</a> / <a href=3D=
"https://bugs.freedesktop.org/show_bug.cgi?id=3D111825" target=3D"_blank">f=
do#111825</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
3637" target=3D"_blank">i915#3637</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7815/shard-iclb2/igt@kms_flip@2x-flip-vs-wf_vblank-inte=
rruptible.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedes=
ktop.org/show_bug.cgi?id=3D109274" target=3D"_blank">fdo#109274</a>) +3 sim=
ilar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7815/shard-apl6/igt@kms_flip@2x-plain-flip-fb-recreate.=
html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a>) +110 similar iss=
ues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pi=
pe-a-default-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7815/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-yft=
ile-to-64bpp-yftile-downscaling@pipe-a-default-mode.html" target=3D"_blank"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2672"=
 target=3D"_blank">i915#2672</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling@pi=
pe-a-valid-mode:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7815/shard-tglb8/igt@kms_flip_scaled_crc@flip-64bpp-yft=
ile-to-16bpp-yftile-downscaling@pipe-a-valid-mode.html" target=3D"_blank">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2587" t=
arget=3D"_blank">i915#2587</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/2672" target=3D"_blank">i915#2672</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pi=
pe-a-valid-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7815/shard-iclb4/igt@kms_flip_scaled_crc@flip-64bpp-yft=
ile-to-32bpp-yftile-downscaling@pipe-a-valid-mode.html" target=3D"_blank">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2587" t=
arget=3D"_blank">i915#2587</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/2672" target=3D"_blank">i915#2672</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-cpu:=
</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7815/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-1p=
-primscrn-pri-indfb-draw-mmap-cpu.html" target=3D"_blank">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/6497" target=3D"_blank"=
>i915#6497</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-cpu:=
</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7815/shard-snb4/igt@kms_frontbuffer_tracking@fbcpsr-2p-=
primscrn-pri-indfb-draw-mmap-cpu.html" target=3D"_blank">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271" target=3D"_blank=
">fdo#109271</a>) +77 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7815/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-2p=
-primscrn-spr-indfb-draw-mmap-wc.html" target=3D"_blank">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109280" target=3D"_blank=
">fdo#109280</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111825" target=3D"_blank">fdo#111825</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7815/shard-glk6/igt@kms_frontbuffer_tracking@fbcpsr-2p-s=
cndscrn-spr-indfb-draw-mmap-wc.html" target=3D"_blank">SKIP</a> (<a href=3D=
"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271" target=3D"_blank">f=
do#109271</a>) +43 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7815/shard-iclb4/igt@kms_frontbuffer_tracking@fbcpsr-2p-=
scndscrn-spr-indfb-draw-mmap-wc.html" target=3D"_blank">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109280" target=3D"_blank=
">fdo#109280</a>) +6 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7815/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-consta=
nt-alpha-max.html" target=3D"_blank">FAIL</a> (<a href=3D"https://bugs.free=
desktop.org/show_bug.cgi?id=3D108145" target=3D"_blank">fdo#108145</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/265" target=3D"_bl=
ank">i915#265</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b-e=
dp-1:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6660/shard-iclb1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-=
factor-0-5@pipe-b-edp-1.html" target=3D"_blank">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7815/shard-iclb2/igt@kms_plan=
e_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b-edp-1.html" targ=
et=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/5235" target=3D"_blank">i915#5235</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-modeset-hybrid:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7815/shard-tglb7/igt@kms_prime@basic-modeset-hybrid.html=
" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/6524" target=3D"_blank">i915#6524</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7815/shard-iclb1/igt@kms_prime@basic-modeset-hybrid.html=
" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/6524" target=3D"_blank">i915#6524</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-update-sf:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7815/shard-apl6/igt@kms_psr2_sf@cursor-plane-update-sf.h=
tml" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/intel/issues/658" target=3D"_blank">i915#658<=
/a>) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7815/shard-tglb5/igt@kms_psr2_sf@cursor-plane-update-sf.=
html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/2920" target=3D"_blank">i915#2920</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7815/shard-glk5/igt@kms_psr2_sf@cursor-plane-update-sf.h=
tml" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/intel/issues/658" target=3D"_blank">i915#658<=
/a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7815/shard-iclb4/igt@kms_psr2_sf@cursor-plane-update-sf.=
html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D111068" target=3D"_blank">fdo#111068</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/658" target=3D"_blank">i915#658=
</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6660/shard-iclb2/igt@kms_psr2_su@page_flip-xrgb8888.html" target=3D"_b=
lank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_7815/shard-iclb7/igt@kms_psr2_su@page_flip-xrgb8888.html" target=3D"_bl=
ank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9642" target=3D"_blank">fdo#109642</a> / <a href=3D"https://bugs.freedeskto=
p.org/show_bug.cgi?id=3D111068" target=3D"_blank">fdo#111068</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/658" target=3D"_blank">=
i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_mmap_gtt:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7815/shard-tglb5/igt@kms_psr@psr2_cursor_mmap_gtt.html" =
target=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/132" target=3D"_blank">i915#132</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/3467" target=3D"_blank">i915#3467</a>) +1=
 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7815/shard-iclb4/igt@kms_psr@psr2_cursor_mmap_gtt.html" =
target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D109441" target=3D"_blank">fdo#109441</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_render:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6660/shard-iclb2/igt@kms_psr@psr2_sprite_render.html" target=3D"_blank=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7815/shard-iclb7/igt@kms_psr@psr2_sprite_render.html" target=3D"_blank">SKI=
P</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441" ta=
rget=3D"_blank">fdo#109441</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-query-forked-hang:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7815/shard-iclb7/igt@kms_vblank@pipe-d-query-forked-han=
g.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org=
/show_bug.cgi?id=3D109278" target=3D"_blank">fdo#109278</a>) +7 similar iss=
ues</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-c-ctx-flip-detection:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7815/shard-iclb8/igt@nouveau_crc@pipe-c-ctx-flip-detecti=
on.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/2530" target=3D"_blank">i915#2530</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7815/shard-tglb2/igt@nouveau_crc@pipe-c-ctx-flip-detecti=
on.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/2530" target=3D"_blank">i915#2530</a>) +1 similar issu=
e</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@i915_nv_import_twice:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7815/shard-tglb3/igt@prime_nv_api@i915_nv_import_twice.=
html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D109291" target=3D"_blank">fdo#109291</a>) +2 similar issue=
s</li>
</ul>
</li>
<li>
<p>igt@prime_nv_test@i915_import_pread_pwrite:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7815/shard-iclb4/igt@prime_nv_test@i915_import_pread_pw=
rite.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.=
org/show_bug.cgi?id=3D109291" target=3D"_blank">fdo#109291</a>) +2 similar =
issues</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-write-hang:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7815/shard-iclb6/igt@prime_vgem@fence-write-hang.html" t=
arget=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug=
.cgi?id=3D109295" target=3D"_blank">fdo#109295</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7815/shard-tglb3/igt@prime_vgem@fence-write-hang.html" t=
arget=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug=
.cgi?id=3D109295" target=3D"_blank">fdo#109295</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@busy:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7815/shard-tglb1/igt@sysfs_clients@busy.html" target=3D=
"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/2994" target=3D"_blank">i915#2994</a>)</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@split-50:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7815/shard-apl7/igt@sysfs_clients@split-50.html" target=
=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/intel/issues/2994" target=3D"_blank">i915#2994</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_bad_reloc@negative-reloc-lut:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6660/shard-rkl-2/igt@gem_bad_reloc@negative-reloc-lut.html" target=3D"=
_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/3281" target=3D"_blank">i915#3281</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_7815/shard-rkl-5/igt@gem_bad_reloc@negative-r=
eloc-lut.html" target=3D"_blank">PASS</a> +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_eio@reset-stress:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6660/shard-tglb3/igt@gem_eio@reset-stress.html" target=3D"_blank">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5784" targ=
et=3D"_blank">i915#5784</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_7815/shard-tglb8/igt@gem_eio@reset-stress.html" target=3D=
"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_6660/shard-glk6/igt@gem_exec_fair@basic-none-share@rcs0.html" target=3D=
"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/2842" target=3D"_blank">i915#2842</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_7815/shard-glk9/igt@gem_exec_fair@basic-none=
-share@rcs0.html" target=3D"_blank">PASS</a></p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_6660/shard-iclb3/igt@gem_exec_fair@basic-none-share@rcs0.html" target=
=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2842" target=3D"_blank">i915#2842</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_7815/shard-iclb3/igt@gem_exec_fair@basic-=
none-share@rcs0.html" target=3D"_blank">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@semaphore-power:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6660/shard-rkl-6/igt@gem_exec_schedule@semaphore-power.html" target=3D=
"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D110254" target=3D"_blank">fdo#110254</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_7815/shard-rkl-5/igt@gem_exec_schedule@se=
maphore-power.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@coherency:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6660/shard-rkl-1/igt@gem_mmap_gtt@coherency.html" target=3D"_blank">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111656" t=
arget=3D"_blank">fdo#111656</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_7815/shard-rkl-5/igt@gem_mmap_gtt@coherency.html" tar=
get=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_pwrite:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6660/shard-rkl-6/igt@gem_set_tiling_vs_pwrite.html" target=3D"_blank">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3282" =
target=3D"_blank">i915#3282</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_7815/shard-rkl-5/igt@gem_set_tiling_vs_pwrite.html" t=
arget=3D"_blank">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@shadow-peek:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6660/shard-rkl-1/igt@gen9_exec_parse@shadow-peek.html" target=3D"_blan=
k">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/252=
7" target=3D"_blank">i915#2527</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7815/shard-rkl-5/igt@gen9_exec_parse@shadow-peek.h=
tml" target=3D"_blank">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>{shard-tglu}:       <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6660/shard-tglu-3/igt@i915_pm_dc@dc9-dpms.html" target=3D"_blank">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4281" targ=
et=3D"_blank">i915#4281</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_7815/shard-tglu-2/igt@i915_pm_dc@dc9-dpms.html" target=3D=
"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@waitboost:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6660/shard-rkl-1/igt@i915_pm_rps@waitboost.html" target=3D"_blank">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4016" tar=
get=3D"_blank">i915#4016</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7815/shard-rkl-1/igt@i915_pm_rps@waitboost.html" target=
=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6660/shard-rkl-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180=
-hflip.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/1845" target=3D"_blank">i915#1845</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/4098" target=3D"_blank">i9=
15#4098</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_7815/shard-rkl-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hf=
lip.html" target=3D"_blank">PASS</a> +13 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-dp1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6660/shard-apl8/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html"=
 target=3D"_blank">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/180" target=3D"_blank">i915#180</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7815/shard-apl7/igt@kms_flip@f=
lip-vs-suspend-interruptible@c-dp1.html" target=3D"_blank">PASS</a> +1 simi=
lar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pi=
pe-a-default-mode:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6660/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-li=
near-downscaling@pipe-a-default-mode.html" target=3D"_blank">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/3555" target=3D"_bla=
nk">i915#3555</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7815/shard-iclb3/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp=
-linear-downscaling@pipe-a-default-mode.html" target=3D"_blank">PASS</a> +1=
 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-modesetfrombusy:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6660/shard-rkl-1/igt@kms_frontbuffer_tracking@fbc-modesetfrombusy.html=
" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/1849" target=3D"_blank">i915#1849</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/4098" target=3D"_blank">i915#4098</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7815/shar=
d-rkl-6/igt@kms_frontbuffer_tracking@fbc-modesetfrombusy.html" target=3D"_b=
lank">PASS</a> +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_6660/shard-tglb3/igt@kms_hdmi_inject@inject-audio.html" target=3D"_blan=
k">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/433=
" target=3D"_blank">i915#433</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_7815/shard-tglb3/igt@kms_hdmi_inject@inject-audio.ht=
ml" target=3D"_blank">PASS</a></p>
</li>
<li>
<p>{shard-tglu}:       <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_6660/shard-tglu-6/igt@kms_hdmi_inject@inject-audio.html" target=3D"_bla=
nk">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/43=
3" target=3D"_blank">i915#433</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_7815/shard-tglu-6/igt@kms_hdmi_inject@inject-audio.=
html" target=3D"_blank">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-7efc:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6660/shard-rkl-1/igt@kms_plane_alpha_blend@pipe-b-alpha-7efc.html" tar=
get=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/1849" target=3D"_blank">i915#1849</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/3546" target=3D"_blank">i915#3546</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4070" target=3D"_b=
lank">i915#4070</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/4098" target=3D"_blank">i915#4098</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_7815/shard-rkl-6/igt@kms_plane_alpha_blen=
d@pipe-b-alpha-7efc.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pi=
pe-a-edp-1:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6660/shard-iclb2/igt@kms_plane_scaling@planes-upscale-factor-0-25-down=
scale-factor-0-5@pipe-a-edp-1.html" target=3D"_blank">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/5235" target=3D"_blank">i91=
5#5235</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7815/shard-iclb3/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscal=
e-factor-0-5@pipe-a-edp-1.html" target=3D"_blank">PASS</a> +2 similar issue=
s</li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-legacy:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6660/shard-rkl-5/igt@kms_properties@plane-properties-legacy.html" targ=
et=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/1849" target=3D"_blank">i915#1849</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_7815/shard-rkl-6/igt@kms_properties@pla=
ne-properties-legacy.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_no_drrs:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6660/shard-iclb4/igt@kms_psr@psr2_no_drrs.html" target=3D"_blank">SKIP=
</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441" tar=
get=3D"_blank">fdo#109441</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7815/shard-iclb2/igt@kms_psr@psr2_no_drrs.html" target=
=3D"_blank">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@sprite_mmap_gtt:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6660/shard-rkl-1/igt@kms_psr@sprite_mmap_gtt.html" target=3D"_blank">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1072" t=
arget=3D"_blank">i915#1072</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7815/shard-rkl-6/igt@kms_psr@sprite_mmap_gtt.html" tar=
get=3D"_blank">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6660/shard-iclb1/igt@kms_psr_stress_test@flip-primary-invalidate-overl=
ay.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/5519" target=3D"_blank">i915#5519</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7815/shard-iclb3/igt@kms=
_psr_stress_test@flip-primary-invalidate-overlay.html" target=3D"_blank">PA=
SS</a></li>
</ul>
</li>
<li>
<p>igt@perf@polling-parameterized:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6660/shard-rkl-1/igt@perf@polling-parameterized.html" target=3D"_blank=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5639=
" target=3D"_blank">i915#5639</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_7815/shard-rkl-2/igt@perf@polling-parameterized.htm=
l" target=3D"_blank">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6660/shard-iclb3/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-f=
ully-sf.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/658" target=3D"_blank">i915#658</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7815/shard-iclb2/igt@km=
s_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html" target=3D"_bla=
nk">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/29=
20" target=3D"_blank">i915#2920</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6660/shard-iclb2/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html=
" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/2920" target=3D"_blank">i915#2920</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7815/shard-iclb6/igt@kms_psr2_sf@=
overlay-plane-move-continuous-sf.html" target=3D"_blank">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/658" target=3D"_blank">=
i915#658</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br>
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6660 -&gt; IGTPW_7815</li>
</ul>
<p>CI-20190529: 20190529<br>
  CI_DRM_12166: 3e89f6dc5d22dcc4f56bed3abade8107c95815b3 @ git://<a href=3D=
"http://anongit.freedesktop.org/gfx-ci/linux" target=3D"_blank">anongit.fre=
edesktop.org/gfx-ci/linux</a><br>
  IGTPW_7815: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_781=
5/index.html" target=3D"_blank">https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_7815/index.html</a><br>
  IGT_6660: 129bea58b9424f0a0da995311a219fdf57732594 @ <a href=3D"https://g=
itlab.freedesktop.org/drm/igt-gpu-tools.git" target=3D"_blank">https://gitl=
ab.freedesktop.org/drm/igt-gpu-tools.git</a></p>

</div>

</div></blockquote></div>

--000000000000624fe105e944df90--
