Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com
 [IPv6:2607:f8b0:4864:20::b2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFE2210E876
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Nov 2022 16:02:49 +0000 (UTC)
Received: by mail-yb1-xb2f.google.com with SMTP id j2so6319620ybb.6
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Nov 2022 08:02:49 -0800 (PST)
MIME-Version: 1.0
References: <20221107171845.3663446-1-markyacoub@chromium.org>
 <166811470735.16949.16061977014906227105@emeril.freedesktop.org>
In-Reply-To: <166811470735.16949.16061977014906227105@emeril.freedesktop.org>
From: Mark Yacoub <markyacoub@chromium.org>
Date: Fri, 11 Nov 2022 11:02:37 -0500
Message-ID: <CAJUqKUrv2E+ik3XTLbjz3Xg3oeS3GU5+7MSjLKfYMNK=r2tocw@mail.gmail.com>
To: "Vudum, Lakshminarayana" <lakshminarayana.vudum@intel.com>
Content-Type: multipart/alternative; boundary="0000000000006b3e2f05ed340550"
Subject: Re: [igt-dev]
	=?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgQ2hhbWVs?=
	=?utf-8?q?ium=3A_Add_new_EDID_Resolution_List_test_=28rev2=29?=
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

--0000000000006b3e2f05ed340550
Content-Type: text/plain; charset="UTF-8"

Hi Lakshminarayana, it looks unrelated, can I get a rerun?

On Thu, Nov 10, 2022 at 4:11 PM Patchwork <patchwork@emeril.freedesktop.org>
wrote:

> *Patch Details*
> *Series:* Chamelium: Add new EDID Resolution List test (rev2)
> *URL:* https://patchwork.freedesktop.org/series/110614/
> *State:* failure
> *Details:* https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/index.html CI
> Bug Log - changes from CI_DRM_12365_full -> IGTPW_8084_full Summary
>
> *FAILURE*
>
> Serious unknown changes coming with IGTPW_8084_full absolutely need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_8084_full, please notify your bug team to allow them
> to document this new failure mode, which will reduce false positives in CI.
>
> External URL:
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/index.html
> Participating hosts (11 -> 8)
>
> Missing (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005
> Possible new issues
>
> Here are the unknown changes that may have been introduced in
> IGTPW_8084_full:
> IGT changes Possible regressions
>
>    -
>
>    igt@kms_atomic_transition
>    @plane-all-modeset-transition-fencing@pipe-b-hdmi-a-1:
>    - shard-glk: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12365/shard-glk8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-b-hdmi-a-1.html>
>       -> INCOMPLETE
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/shard-glk9/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-b-hdmi-a-1.html>
>    -
>
>    igt@kms_vblank@pipe-d-ts-continuation-dpms-rpm:
>    - shard-tglb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12365/shard-tglb3/igt@kms_vblank@pipe-d-ts-continuation-dpms-rpm.html>
>       -> INCOMPLETE
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/shard-tglb8/igt@kms_vblank@pipe-d-ts-continuation-dpms-rpm.html>
>       +2 similar issues
>
> Warnings
>
>    - igt@kms_plane_alpha_blend@alpha-basic@pipe-c-dp-1:
>       - shard-apl: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12365/shard-apl1/igt@kms_plane_alpha_blend@alpha-basic@pipe-c-dp-1.html>
>       (i915#4573 <https://gitlab.freedesktop.org/drm/intel/issues/4573>)
>       -> DMESG-FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/shard-apl8/igt@kms_plane_alpha_blend@alpha-basic@pipe-c-dp-1.html>
>       +1 similar issue
>
> Suppressed
>
> The following results come from untrusted machines, tests, or statuses.
> They do not affect the overall result.
>
>    - igt@kms_invalid_mode@int-max-clock:
>       - {shard-rkl}: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/shard-rkl-1/igt@kms_invalid_mode@int-max-clock.html>
>
> New tests
>
> New tests have been introduced between CI_DRM_12365_full and
> IGTPW_8084_full:
> New IGT tests (1)
>
>    - igt@kms_chamelium@dp-edid-resolution-list:
>       - Statuses :
>       - Exec time: [None] s
>
> Known issues
>
> Here are the changes found in IGTPW_8084_full that come from known issues:
> IGT changes Issues hit
>
>    -
>
>    igt@gem_create@create-massive:
>    - shard-snb: NOTRUN -> DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/shard-snb4/igt@gem_create@create-massive.html>
>       (i915#4991 <https://gitlab.freedesktop.org/drm/intel/issues/4991>)
>    -
>
>    igt@gem_ctx_sseu@invalid-args:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/shard-tglb1/igt@gem_ctx_sseu@invalid-args.html>
>       (i915#280 <https://gitlab.freedesktop.org/drm/intel/issues/280>)
>    -
>
>    igt@gem_exec_balancer@parallel-contexts:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/shard-iclb8/igt@gem_exec_balancer@parallel-contexts.html>
>       (i915#4525 <https://gitlab.freedesktop.org/drm/intel/issues/4525>)
>    -
>
>    igt@gem_exec_balancer@parallel-out-fence:
>    - shard-iclb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12365/shard-iclb2/igt@gem_exec_balancer@parallel-out-fence.html>
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/shard-iclb7/igt@gem_exec_balancer@parallel-out-fence.html>
>       (i915#4525 <https://gitlab.freedesktop.org/drm/intel/issues/4525>)
>    -
>
>    igt@gem_exec_fair@basic-pace@rcs0:
>    - shard-glk: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12365/shard-glk3/igt@gem_exec_fair@basic-pace@rcs0.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/shard-glk5/igt@gem_exec_fair@basic-pace@rcs0.html>
>       (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
>       +1 similar issue
>    -
>
>    igt@gem_exec_fair@basic-pace@vcs1:
>    - shard-iclb: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/shard-iclb2/igt@gem_exec_fair@basic-pace@vcs1.html>
>       (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
>    -
>
>    igt@gem_exec_schedule@preempt-user:
>    - shard-snb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/shard-snb4/igt@gem_exec_schedule@preempt-user.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>)
>       +23 similar issues
>    -
>
>    igt@gem_exec_whisper@basic-fds-priority:
>    - shard-iclb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12365/shard-iclb6/igt@gem_exec_whisper@basic-fds-priority.html>
>       -> INCOMPLETE
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/shard-iclb1/igt@gem_exec_whisper@basic-fds-priority.html>
>       (i915#6755 <https://gitlab.freedesktop.org/drm/intel/issues/6755>)
>    -
>
>    igt@gem_lmem_swapping@heavy-verify-random:
>    - shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/shard-apl3/igt@gem_lmem_swapping@heavy-verify-random.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#4613 <https://gitlab.freedesktop.org/drm/intel/issues/4613>)
>    -
>
>    igt@gem_userptr_blits@readonly-unsync:
>    -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/shard-iclb7/igt@gem_userptr_blits@readonly-unsync.html>
>       (i915#3297 <https://gitlab.freedesktop.org/drm/intel/issues/3297>)
>       -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/shard-tglb8/igt@gem_userptr_blits@readonly-unsync.html>
>       (i915#3297 <https://gitlab.freedesktop.org/drm/intel/issues/3297>)
>       -
>
>    igt@i915_module_load@resize-bar:
>    -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/shard-iclb8/igt@i915_module_load@resize-bar.html>
>       (i915#6412 <https://gitlab.freedesktop.org/drm/intel/issues/6412>)
>       -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/shard-tglb1/igt@i915_module_load@resize-bar.html>
>       (i915#6412 <https://gitlab.freedesktop.org/drm/intel/issues/6412>)
>       -
>
>    igt@i915_pm_dc@dc5-psr:
>    -
>
>       shard-iclb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12365/shard-iclb6/igt@i915_pm_dc@dc5-psr.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/shard-iclb3/igt@i915_pm_dc@dc5-psr.html>
>       (i915#3989 <https://gitlab.freedesktop.org/drm/intel/issues/3989>)
>       -
>
>       shard-tglb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12365/shard-tglb6/igt@i915_pm_dc@dc5-psr.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/shard-tglb7/igt@i915_pm_dc@dc5-psr.html>
>       (i915#3989 <https://gitlab.freedesktop.org/drm/intel/issues/3989>)
>       -
>
>    igt@i915_suspend@debugfs-reader:
>    - shard-apl: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12365/shard-apl8/igt@i915_suspend@debugfs-reader.html>
>       -> DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/shard-apl8/igt@i915_suspend@debugfs-reader.html>
>       (i915#180 <https://gitlab.freedesktop.org/drm/intel/issues/180>) +1
>       similar issue
>    -
>
>    igt@kms_big_fb@4-tiled-32bpp-rotate-90:
>    - shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/shard-apl3/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>)
>       +28 similar issues
>    -
>
>    igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:
>    -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/shard-tglb6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html>
>       (i915#5286 <https://gitlab.freedesktop.org/drm/intel/issues/5286>)
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/shard-iclb5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html>
>       (i915#5286 <https://gitlab.freedesktop.org/drm/intel/issues/5286>)
>       -
>
>    igt@kms_big_fb@y-tiled-32bpp-rotate-270:
>    - shard-glk: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12365/shard-glk8/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/shard-glk1/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html>
>       (i915#5138 <https://gitlab.freedesktop.org/drm/intel/issues/5138>)
>    -
>
>    igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_mc_ccs:
>    - shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/shard-apl8/igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_mc_ccs.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#3886 <https://gitlab.freedesktop.org/drm/intel/issues/3886>)
>       +4 similar issues
>    -
>
>    igt@kms_ccs@pipe-a-crc-primary-rotation-180-4_tiled_dg2_rc_ccs_cc:
>    -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/shard-iclb5/igt@kms_ccs@pipe-a-crc-primary-rotation-180-4_tiled_dg2_rc_ccs_cc.html>
>       (fdo#109278 <https://bugs.freedesktop.org/show_bug.cgi?id=109278>)
>       +1 similar issue
>       -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/shard-tglb8/igt@kms_ccs@pipe-a-crc-primary-rotation-180-4_tiled_dg2_rc_ccs_cc.html>
>       (i915#3689 <https://gitlab.freedesktop.org/drm/intel/issues/3689> /
>       i915#6095 <https://gitlab.freedesktop.org/drm/intel/issues/6095>)
>       -
>
>    igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_mc_ccs:
>    -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/shard-tglb1/igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_mc_ccs.html>
>       (i915#3689 <https://gitlab.freedesktop.org/drm/intel/issues/3689> /
>       i915#3886 <https://gitlab.freedesktop.org/drm/intel/issues/3886>)
>       -
>
>       shard-glk: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/shard-glk1/igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_mc_ccs.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#3886 <https://gitlab.freedesktop.org/drm/intel/issues/3886>)
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/shard-iclb8/igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_mc_ccs.html>
>       (fdo#109278 <https://bugs.freedesktop.org/show_bug.cgi?id=109278> /
>       i915#3886 <https://gitlab.freedesktop.org/drm/intel/issues/3886>)
>       -
>
>    igt@kms_ccs@pipe-d-bad-rotation-90-4_tiled_dg2_mc_ccs:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/shard-tglb5/igt@kms_ccs@pipe-d-bad-rotation-90-4_tiled_dg2_mc_ccs.html>
>       (i915#3689 <https://gitlab.freedesktop.org/drm/intel/issues/3689>)
>       +1 similar issue
>    -
>
>    igt@kms_chamelium@dp-hpd-fast:
>    -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/shard-tglb5/igt@kms_chamelium@dp-hpd-fast.html>
>       (fdo#109284 <https://bugs.freedesktop.org/show_bug.cgi?id=109284> /
>       fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>)
>       +1 similar issue
>       -
>
>       shard-glk: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/shard-glk8/igt@kms_chamelium@dp-hpd-fast.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>)
>       +1 similar issue
>       -
>
>    igt@kms_chamelium@dp-hpd-with-enabled-mode:
>    - shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/shard-apl3/igt@kms_chamelium@dp-hpd-with-enabled-mode.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>)
>       +2 similar issues
>    -
>
>    igt@kms_chamelium@hdmi-hpd-with-enabled-mode:
>    -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/shard-iclb5/igt@kms_chamelium@hdmi-hpd-with-enabled-mode.html>
>       (fdo#109284 <https://bugs.freedesktop.org/show_bug.cgi?id=109284> /
>       fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>)
>       +1 similar issue
>       -
>
>       shard-snb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/shard-snb5/igt@kms_chamelium@hdmi-hpd-with-enabled-mode.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>)
>       +1 similar issue
>       -
>
>    igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
>    -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/shard-tglb2/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html>
>       (fdo#109274 <https://bugs.freedesktop.org/show_bug.cgi?id=109274> /
>       fdo#111825 <https://bugs.freedesktop.org/show_bug.cgi?id=111825>)
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/shard-iclb2/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html>
>       (fdo#109274 <https://bugs.freedesktop.org/show_bug.cgi?id=109274>)
>       -
>
>    igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-hdmi-a1-hdmi-a2
>    :
>    - shard-glk: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12365/shard-glk5/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-hdmi-a1-hdmi-a2.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/shard-glk5/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-hdmi-a1-hdmi-a2.html>
>       (i915#2122 <https://gitlab.freedesktop.org/drm/intel/issues/2122>)
>    -
>
>    igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a2:
>    - shard-glk: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12365/shard-glk8/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a2.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/shard-glk3/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a2.html>
>       (i915#79 <https://gitlab.freedesktop.org/drm/intel/issues/79>) +1
>       similar issue
>    -
>
>    igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp1:
>    - shard-apl: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12365/shard-apl7/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp1.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/shard-apl8/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp1.html>
>       (i915#79 <https://gitlab.freedesktop.org/drm/intel/issues/79>)
>    -
>
>    igt@kms_flip@flip-vs-panning-vs-hang@c-dp1:
>    - shard-apl: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12365/shard-apl8/igt@kms_flip@flip-vs-panning-vs-hang@c-dp1.html>
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/shard-apl1/igt@kms_flip@flip-vs-panning-vs-hang@c-dp1.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>)
>       +1 similar issue
>    -
>
>    igt@kms_flip@flip-vs-panning-vs-hang@c-hdmi-a1:
>    - shard-glk: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12365/shard-glk6/igt@kms_flip@flip-vs-panning-vs-hang@c-hdmi-a1.html>
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/shard-glk2/igt@kms_flip@flip-vs-panning-vs-hang@c-hdmi-a1.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>)
>       +3 similar issues
>    -
>
>    igt@kms_flip_scaled_crc
>    @flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-default-mode:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-default-mode.html>
>       (i915#6375 <https://gitlab.freedesktop.org/drm/intel/issues/6375>)
>    -
>
>    igt@kms_flip_scaled_crc
>    @flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-default-mode:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-default-mode.html>
>       (i915#2672 <https://gitlab.freedesktop.org/drm/intel/issues/2672>)
>       +2 similar issues
>    -
>
>    igt@kms_flip_scaled_crc
>    @flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/shard-iclb8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html>
>       (i915#2587 <https://gitlab.freedesktop.org/drm/intel/issues/2587> /
>       i915#2672 <https://gitlab.freedesktop.org/drm/intel/issues/2672>)
>       +1 similar issue
>    -
>
>    igt@kms_flip_scaled_crc
>    @flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-default-mode:
>    - shard-iclb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12365/shard-iclb3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-default-mode.html>
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-default-mode.html>
>       (i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555>)
>    -
>
>    igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt:
>    -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/shard-iclb2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html>
>       (fdo#109280 <https://bugs.freedesktop.org/show_bug.cgi?id=109280>)
>       -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/shard-tglb6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html>
>       (fdo#109280 <https://bugs.freedesktop.org/show_bug.cgi?id=109280> /
>       fdo#111825 <https://bugs.freedesktop.org/show_bug.cgi?id=111825>)
>       -
>
>    igt@kms_frontbuffer_tracking@psr-rgb101010-draw-blt:
>    - shard-glk: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/shard-glk1/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-blt.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>)
>       +9 similar issues
>    -
>
>    igt@kms_plane_lowres@tiling-yf:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/shard-tglb8/igt@kms_plane_lowres@tiling-yf.html>
>       (fdo#112054 <https://bugs.freedesktop.org/show_bug.cgi?id=112054> /
>       i915#5288 <https://gitlab.freedesktop.org/drm/intel/issues/5288>)
>    -
>
>    igt@kms_plane_lowres@tiling-yf@pipe-b-edp-1:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/shard-iclb7/igt@kms_plane_lowres@tiling-yf@pipe-b-edp-1.html>
>       (i915#3536 <https://gitlab.freedesktop.org/drm/intel/issues/3536>)
>       +2 similar issues
>    -
>
>    igt@kms_plane_scaling
>    @planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a-edp-1:
>    - shard-iclb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12365/shard-iclb5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a-edp-1.html>
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/shard-iclb2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a-edp-1.html>
>       (i915#5235 <https://gitlab.freedesktop.org/drm/intel/issues/5235>)
>       +2 similar issues
>    -
>
>    igt@kms_psr2_su@page_flip-nv12:
>    -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/shard-tglb5/igt@kms_psr2_su@page_flip-nv12.html>
>       (i915#7037 <https://gitlab.freedesktop.org/drm/intel/issues/7037>)
>       -
>
>       shard-glk: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/shard-glk5/igt@kms_psr2_su@page_flip-nv12.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>)
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/shard-iclb7/igt@kms_psr2_su@page_flip-nv12.html>
>       (fdo#109642 <https://bugs.freedesktop.org/show_bug.cgi?id=109642> /
>       fdo#111068 <https://bugs.freedesktop.org/show_bug.cgi?id=111068> /
>       i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>)
>       -
>
>    igt@kms_psr@psr2_sprite_render:
>    - shard-iclb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12365/shard-iclb2/igt@kms_psr@psr2_sprite_render.html>
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/shard-iclb6/igt@kms_psr@psr2_sprite_render.html>
>       (fdo#109441 <https://bugs.freedesktop.org/show_bug.cgi?id=109441>)
>       +1 similar issue
>    -
>
>    igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
>    -
>
>       shard-tglb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12365/shard-tglb7/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html>
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/shard-tglb6/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html>
>       (i915#5519 <https://gitlab.freedesktop.org/drm/intel/issues/5519>)
>       -
>
>       shard-iclb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12365/shard-iclb6/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html>
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/shard-iclb5/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html>
>       (i915#5519 <https://gitlab.freedesktop.org/drm/intel/issues/5519>)
>       -
>
>    igt@kms_rotation_crc@cursor-rotation-180:
>    - shard-glk: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12365/shard-glk3/igt@kms_rotation_crc@cursor-rotation-180.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/shard-glk8/igt@kms_rotation_crc@cursor-rotation-180.html>
>       (i915#5852 <https://gitlab.freedesktop.org/drm/intel/issues/5852>)
>    -
>
>    igt@sysfs_clients@fair-1:
>    - shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/shard-apl6/igt@sysfs_clients@fair-1.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#2994 <https://gitlab.freedesktop.org/drm/intel/issues/2994>)
>
> Possible fixes
>
>    -
>
>    igt@gem_ctx_persistence@legacy-engines-hang@blt:
>    - {shard-rkl}: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12365/shard-rkl-5/igt@gem_ctx_persistence@legacy-engines-hang@blt.html>
>       (i915#6252 <https://gitlab.freedesktop.org/drm/intel/issues/6252>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/shard-rkl-6/igt@gem_ctx_persistence@legacy-engines-hang@blt.html>
>    -
>
>    igt@gem_ctx_persistence@smoketest:
>    - shard-iclb: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12365/shard-iclb2/igt@gem_ctx_persistence@smoketest.html>
>       (i915#5099 <https://gitlab.freedesktop.org/drm/intel/issues/5099>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/shard-iclb7/igt@gem_ctx_persistence@smoketest.html>
>    -
>
>    igt@gem_exec_fair@basic-none-share@rcs0:
>    - shard-glk: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12365/shard-glk2/igt@gem_exec_fair@basic-none-share@rcs0.html>
>       (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/shard-glk8/igt@gem_exec_fair@basic-none-share@rcs0.html>
>    -
>
>    igt@gem_exec_fair@basic-none-solo@rcs0:
>    - shard-apl: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12365/shard-apl7/igt@gem_exec_fair@basic-none-solo@rcs0.html>
>       (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/shard-apl7/igt@gem_exec_fair@basic-none-solo@rcs0.html>
>    -
>
>    igt@gem_exec_fair@basic-none@bcs0:
>    - shard-iclb: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12365/shard-iclb6/igt@gem_exec_fair@basic-none@bcs0.html>
>       (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/shard-iclb7/igt@gem_exec_fair@basic-none@bcs0.html>
>    -
>
>    igt@gem_exec_reloc@basic-gtt-wc-noreloc:
>    - {shard-rkl}: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12365/shard-rkl-4/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html>
>       (i915#3281 <https://gitlab.freedesktop.org/drm/intel/issues/3281>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/shard-rkl-5/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html>
>       +5 similar issues
>    -
>
>    igt@gem_mmap_gtt@coherency:
>    - {shard-rkl}: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12365/shard-rkl-4/igt@gem_mmap_gtt@coherency.html>
>       (fdo#111656 <https://bugs.freedesktop.org/show_bug.cgi?id=111656>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/shard-rkl-5/igt@gem_mmap_gtt@coherency.html>
>    -
>
>    igt@gem_pwrite@basic-self:
>    - {shard-rkl}: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12365/shard-rkl-4/igt@gem_pwrite@basic-self.html>
>       (i915#3282 <https://gitlab.freedesktop.org/drm/intel/issues/3282>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/shard-rkl-5/igt@gem_pwrite@basic-self.html>
>       +2 similar issues
>    -
>
>    igt@gen9_exec_parse@bb-start-far:
>    - {shard-rkl}: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12365/shard-rkl-1/igt@gen9_exec_parse@bb-start-far.html>
>       (i915#2527 <https://gitlab.freedesktop.org/drm/intel/issues/2527>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/shard-rkl-5/igt@gen9_exec_parse@bb-start-far.html>
>       +1 similar issue
>    -
>
>    igt@i915_pm_rps@engine-order:
>    - {shard-rkl}: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12365/shard-rkl-5/igt@i915_pm_rps@engine-order.html>
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/shard-rkl-4/igt@i915_pm_rps@engine-order.html>
>    -
>
>    igt@i915_selftest@perf@engine_cs:
>    - shard-snb: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12365/shard-snb2/igt@i915_selftest@perf@engine_cs.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/shard-snb2/igt@i915_selftest@perf@engine_cs.html>
>    -
>
>    igt@kms_async_flips@alternate-sync-async-flip@pipe-b-dp-1:
>    - shard-apl: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12365/shard-apl3/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-dp-1.html>
>       (i915#2521 <https://gitlab.freedesktop.org/drm/intel/issues/2521>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/shard-apl7/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-dp-1.html>
>    -
>
>    igt@kms_async_flips@alternate-sync-async-flip@pipe-b-edp-1:
>    - shard-iclb: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12365/shard-iclb8/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-edp-1.html>
>       (i915#2521 <https://gitlab.freedesktop.org/drm/intel/issues/2521>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/shard-iclb6/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-edp-1.html>
>    -
>
>    igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1:
>    - shard-glk: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12365/shard-glk1/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1.html>
>       (i915#79 <https://gitlab.freedesktop.org/drm/intel/issues/79>) ->
>       PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/shard-glk5/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1.html>
>    -
>
>    igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-pwrite:
>    - {shard-rkl}: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12365/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-pwrite.html>
>       (i915#1849 <https://gitlab.freedesktop.org/drm/intel/issues/1849> /
>       i915#4098 <https://gitlab.freedesktop.org/drm/intel/issues/4098>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-pwrite.html>
>       +7 similar issues
>    -
>
>    igt@kms_frontbuffer_tracking@fbc-suspend:
>    - shard-apl: DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12365/shard-apl3/igt@kms_frontbuffer_tracking@fbc-suspend.html>
>       (i915#180 <https://gitlab.freedesktop.org/drm/intel/issues/180>) ->
>       PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/shard-apl6/igt@kms_frontbuffer_tracking@fbc-suspend.html>
>    -
>
>    igt@kms_psr@primary_render:
>    - {shard-rkl}: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12365/shard-rkl-2/igt@kms_psr@primary_render.html>
>       (i915#1072 <https://gitlab.freedesktop.org/drm/intel/issues/1072>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/shard-rkl-6/igt@kms_psr@primary_render.html>
>       +2 similar issues
>    -
>
>    igt@kms_psr@psr2_primary_page_flip:
>    - shard-iclb: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12365/shard-iclb7/igt@kms_psr@psr2_primary_page_flip.html>
>       (fdo#109441 <https://bugs.freedesktop.org/show_bug.cgi?id=109441>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html>
>       +1 similar issue
>    -
>
>    igt@kms_rotation_crc@exhaust-fences:
>    - {shard-rkl}: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12365/shard-rkl-1/igt@kms_rotation_crc@exhaust-fences.html>
>       (i915#1845 <https://gitlab.freedesktop.org/drm/intel/issues/1845> /
>       i915#4098 <https://gitlab.freedesktop.org/drm/intel/issues/4098>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/shard-rkl-6/igt@kms_rotation_crc@exhaust-fences.html>
>       +12 similar issues
>    -
>
>    igt@perf@polling-small-buf:
>    - {shard-rkl}: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12365/shard-rkl-1/igt@perf@polling-small-buf.html>
>       (i915#1722 <https://gitlab.freedesktop.org/drm/intel/issues/1722>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/shard-rkl-2/igt@perf@polling-small-buf.html>
>    -
>
>    igt@perf_pmu@all-busy-idle-check-all:
>    - {shard-dg1}: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12365/shard-dg1-15/igt@perf_pmu@all-busy-idle-check-all.html>
>       (i915#5234 <https://gitlab.freedesktop.org/drm/intel/issues/5234>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/shard-dg1-13/igt@perf_pmu@all-busy-idle-check-all.html>
>    -
>
>    igt@perf_pmu@busy-double-start@rcs0:
>    - {shard-dg1}: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12365/shard-dg1-19/igt@perf_pmu@busy-double-start@rcs0.html>
>       (i915#4349 <https://gitlab.freedesktop.org/drm/intel/issues/4349>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/shard-dg1-18/igt@perf_pmu@busy-double-start@rcs0.html>
>
> Warnings
>
>    -
>
>    igt@gem_exec_balancer@parallel-ordering:
>    - shard-iclb: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12365/shard-iclb1/igt@gem_exec_balancer@parallel-ordering.html>
>       (i915#6117 <https://gitlab.freedesktop.org/drm/intel/issues/6117>)
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/shard-iclb7/igt@gem_exec_balancer@parallel-ordering.html>
>       (i915#4525 <https://gitlab.freedesktop.org/drm/intel/issues/4525>)
>    -
>
>    igt@gem_pwrite@basic-exhaustion:
>    - shard-tglb: INCOMPLETE
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12365/shard-tglb5/igt@gem_pwrite@basic-exhaustion.html>
>       (i915#7248 <https://gitlab.freedesktop.org/drm/intel/issues/7248>)
>       -> WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/shard-tglb3/igt@gem_pwrite@basic-exhaustion.html>
>       (i915#2658 <https://gitlab.freedesktop.org/drm/intel/issues/2658>)
>    -
>
>    igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:
>    - shard-iclb: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12365/shard-iclb8/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html>
>       (i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>) ->
>       SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/shard-iclb2/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html>
>       (i915#2920 <https://gitlab.freedesktop.org/drm/intel/issues/2920>)
>    -
>
>    igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
>    - shard-iclb: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12365/shard-iclb3/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html>
>       (fdo#111068 <https://bugs.freedesktop.org/show_bug.cgi?id=111068> /
>       i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>) ->
>       SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html>
>       (i915#2920 <https://gitlab.freedesktop.org/drm/intel/issues/2920>)
>    -
>
>    igt@kms_psr2_sf@primary-plane-update-sf-dmg-area:
>    - shard-iclb: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12365/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html>
>       (i915#2920 <https://gitlab.freedesktop.org/drm/intel/issues/2920>)
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/shard-iclb7/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html>
>       (fdo#111068 <https://bugs.freedesktop.org/show_bug.cgi?id=111068> /
>       i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>)
>    -
>
>    igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:
>    - shard-iclb: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12365/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html>
>       (i915#2920 <https://gitlab.freedesktop.org/drm/intel/issues/2920>)
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/shard-iclb8/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html>
>       (i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>)
>    -
>
>    igt@runner@aborted:
>    - shard-apl: (FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12365/shard-apl2/igt@runner@aborted.html>,
>       FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12365/shard-apl6/igt@runner@aborted.html>,
>       FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12365/shard-apl3/igt@runner@aborted.html>)
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#3002 <https://gitlab.freedesktop.org/drm/intel/issues/3002> /
>       i915#4312 <https://gitlab.freedesktop.org/drm/intel/issues/4312>)
>       -> (FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/shard-apl8/igt@runner@aborted.html>,
>       FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/shard-apl7/igt@runner@aborted.html>,
>       FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/shard-apl3/igt@runner@aborted.html>,
>       FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/shard-apl1/igt@runner@aborted.html>)
>       (i915#180 <https://gitlab.freedesktop.org/drm/intel/issues/180> /
>       i915#3002 <https://gitlab.freedesktop.org/drm/intel/issues/3002> /
>       i915#4312 <https://gitlab.freedesktop.org/drm/intel/issues/4312>)
>
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> Build changes
>
>    - CI: CI-20190529 -> None
>    - IGT: IGT_7050 -> IGTPW_8084
>    - Piglit: piglit_4509 -> None
>
> CI-20190529: 20190529
> CI_DRM_12365: 1bda5b0abc8a0d9d53d9fec1a390dc93e2b0ba57 @ git://
> anongit.freedesktop.org/gfx-ci/linux
> IGTPW_8084: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/index.html
> IGT_7050: 42839a7c2bab78bc6cda8c949d8545606f377735 @
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://
> anongit.freedesktop.org/piglit
>

--0000000000006b3e2f05ed340550
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Lakshminarayana, it looks unrelated, can I get a rerun?=
</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=
On Thu, Nov 10, 2022 at 4:11 PM Patchwork &lt;<a href=3D"mailto:patchwork@e=
meril.freedesktop.org">patchwork@emeril.freedesktop.org</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex"><div class=3D"msg-29=
30096382189300494">
<u></u>

=20
 =20
 =20
 =20

<div>


<b>Patch Details</b>
<table>
<tbody><tr><td><b>Series:</b></td><td>Chamelium: Add new EDID Resolution Li=
st test (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/110614/" target=3D"_blank">https://patchwork.freedesktop.org/series/11=
0614/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8084/index.html" target=3D"_blank">https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_8084/index.html</a></td></tr>

</tbody></table>


    <h1>CI Bug Log - changes from CI_DRM_12365_full -&gt; IGTPW_8084_full</=
h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_8084_full absolutely need to b=
e<br>
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
>
  introduced in IGTPW_8084_full, please notify your bug team to allow them<=
br>
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
8084/index.html" target=3D"_blank">https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_8084/index.html</a></p>
<h2>Participating hosts (11 -&gt; 8)</h2>
<p>Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_8084=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-b-hd=
mi-a-1:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12365/shard-glk8/igt@kms_atomic_transition@plane-all-modeset-transi=
tion-fencing@pipe-b-hdmi-a-1.html" target=3D"_blank">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/shard-glk9/igt@kms_=
atomic_transition@plane-all-modeset-transition-fencing@pipe-b-hdmi-a-1.html=
" target=3D"_blank">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-ts-continuation-dpms-rpm:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12365/shard-tglb3/igt@kms_vblank@pipe-d-ts-continuation-dpms-rpm.ht=
ml" target=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8084/shard-tglb8/igt@kms_vblank@pipe-d-ts-continuation-=
dpms-rpm.html" target=3D"_blank">INCOMPLETE</a> +2 similar issues</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_plane_alpha_blend@alpha-basic@pipe-c-dp-1:<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12365/shard-apl1/igt@kms_plane_alpha_blend@alpha-basic@pipe-c-dp-1.=
html" target=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/4573" target=3D"_blank">i915#4573</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/shard-apl8/igt@kms_plane=
_alpha_blend@alpha-basic@pipe-c-dp-1.html" target=3D"_blank">DMESG-FAIL</a>=
 +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br>
  They do not affect the overall result.</p>
<ul>
<li>igt@kms_invalid_mode@int-max-clock:<ul>
<li>{shard-rkl}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8084/shard-rkl-1/igt@kms_invalid_mode@int-max-clock.htm=
l" target=3D"_blank">SKIP</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_12365_full and IGTPW_8084_=
full:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@kms_chamelium@dp-edid-resolution-list:<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8084_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_create@create-massive:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8084/shard-snb4/igt@gem_create@create-massive.html" tar=
get=3D"_blank">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/4991" target=3D"_blank">i915#4991</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-args:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8084/shard-tglb1/igt@gem_ctx_sseu@invalid-args.html" ta=
rget=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/280" target=3D"_blank">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-contexts:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8084/shard-iclb8/igt@gem_exec_balancer@parallel-context=
s.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/4525" target=3D"_blank">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-out-fence:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12365/shard-iclb2/igt@gem_exec_balancer@parallel-out-fence.html" ta=
rget=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_8084/shard-iclb7/igt@gem_exec_balancer@parallel-out-fence.htm=
l" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/4525" target=3D"_blank">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12365/shard-glk3/igt@gem_exec_fair@basic-pace@rcs0.html" target=3D"=
_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_8084/shard-glk5/igt@gem_exec_fair@basic-pace@rcs0.html" target=3D"_bl=
ank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2=
842" target=3D"_blank">i915#2842</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8084/shard-iclb2/igt@gem_exec_fair@basic-pace@vcs1.html=
" target=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/2842" target=3D"_blank">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-user:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8084/shard-snb4/igt@gem_exec_schedule@preempt-user.html=
" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_=
bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a>) +23 similar issues</=
li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-fds-priority:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12365/shard-iclb6/igt@gem_exec_whisper@basic-fds-priority.html" tar=
get=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_8084/shard-iclb1/igt@gem_exec_whisper@basic-fds-priority.html"=
 target=3D"_blank">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/6755" target=3D"_blank">i915#6755</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8084/shard-apl3/igt@gem_lmem_swapping@heavy-verify-rand=
om.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.or=
g/show_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/intel/issues/4613" target=3D"_blank">i915=
#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-unsync:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8084/shard-iclb7/igt@gem_userptr_blits@readonly-unsync.h=
tml" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/3297" target=3D"_blank">i915#3297</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8084/shard-tglb8/igt@gem_userptr_blits@readonly-unsync.h=
tml" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/3297" target=3D"_blank">i915#3297</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@resize-bar:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8084/shard-iclb8/igt@i915_module_load@resize-bar.html" t=
arget=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/6412" target=3D"_blank">i915#6412</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8084/shard-tglb1/igt@i915_module_load@resize-bar.html" t=
arget=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/6412" target=3D"_blank">i915#6412</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc5-psr:</p>
<ul>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_12365/shard-iclb6/igt@i915_pm_dc@dc5-psr.html" target=3D"_blank">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/=
shard-iclb3/igt@i915_pm_dc@dc5-psr.html" target=3D"_blank">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/3989" target=3D"_blank=
">i915#3989</a>)</p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_12365/shard-tglb6/igt@i915_pm_dc@dc5-psr.html" target=3D"_blank">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/=
shard-tglb7/igt@i915_pm_dc@dc5-psr.html" target=3D"_blank">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/3989" target=3D"_blank=
">i915#3989</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@debugfs-reader:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12365/shard-apl8/igt@i915_suspend@debugfs-reader.html" target=3D"_b=
lank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_8084/shard-apl8/igt@i915_suspend@debugfs-reader.html" target=3D"_blank"=
>DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/180" target=3D"_blank">i915#180</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8084/shard-apl3/igt@kms_big_fb@4-tiled-32bpp-rotate-90.=
html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a>) +28 similar issu=
es</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8084/shard-tglb6/igt@kms_big_fb@4-tiled-max-hw-stride-32=
bpp-rotate-0.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/5286" target=3D"_blank">i915#5286</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8084/shard-iclb5/igt@kms_big_fb@4-tiled-max-hw-stride-32=
bpp-rotate-0.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/5286" target=3D"_blank">i915#5286</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12365/shard-glk8/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html" targ=
et=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_8084/shard-glk1/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html" t=
arget=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/5138" target=3D"_blank">i915#5138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8084/shard-apl8/igt@kms_ccs@pipe-a-bad-aux-stride-y_til=
ed_gen12_mc_ccs.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.f=
reedesktop.org/show_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3886" target=3D=
"_blank">i915#3886</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-primary-rotation-180-4_tiled_dg2_rc_ccs_cc:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8084/shard-iclb5/igt@kms_ccs@pipe-a-crc-primary-rotation=
-180-4_tiled_dg2_rc_ccs_cc.html" target=3D"_blank">SKIP</a> (<a href=3D"htt=
ps://bugs.freedesktop.org/show_bug.cgi?id=3D109278" target=3D"_blank">fdo#1=
09278</a>) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8084/shard-tglb8/igt@kms_ccs@pipe-a-crc-primary-rotation=
-180-4_tiled_dg2_rc_ccs_cc.html" target=3D"_blank">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/3689" target=3D"_blank">i915#3=
689</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6095" =
target=3D"_blank">i915#6095</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8084/shard-tglb1/igt@kms_ccs@pipe-b-bad-aux-stride-y_til=
ed_gen12_mc_ccs.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/3689" target=3D"_blank">i915#3689</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3886" target=3D"_=
blank">i915#3886</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8084/shard-glk1/igt@kms_ccs@pipe-b-bad-aux-stride-y_tile=
d_gen12_mc_ccs.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.fr=
eedesktop.org/show_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3886" target=3D"=
_blank">i915#3886</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8084/shard-iclb8/igt@kms_ccs@pipe-b-bad-aux-stride-y_til=
ed_gen12_mc_ccs.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.f=
reedesktop.org/show_bug.cgi?id=3D109278" target=3D"_blank">fdo#109278</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3886" target=3D=
"_blank">i915#3886</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-rotation-90-4_tiled_dg2_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8084/shard-tglb5/igt@kms_ccs@pipe-d-bad-rotation-90-4_t=
iled_dg2_mc_ccs.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/3689" target=3D"_blank">i915#3689</a>) +1=
 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-hpd-fast:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8084/shard-tglb5/igt@kms_chamelium@dp-hpd-fast.html" tar=
get=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109284" target=3D"_blank">fdo#109284</a> / <a href=3D"https://bugs.=
freedesktop.org/show_bug.cgi?id=3D111827" target=3D"_blank">fdo#111827</a>)=
 +1 similar issue</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8084/shard-glk8/igt@kms_chamelium@dp-hpd-fast.html" targ=
et=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D"https://bugs.f=
reedesktop.org/show_bug.cgi?id=3D111827" target=3D"_blank">fdo#111827</a>) =
+1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-hpd-with-enabled-mode:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8084/shard-apl3/igt@kms_chamelium@dp-hpd-with-enabled-m=
ode.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.o=
rg/show_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D"=
https://bugs.freedesktop.org/show_bug.cgi?id=3D111827" target=3D"_blank">fd=
o#111827</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8084/shard-iclb5/igt@kms_chamelium@hdmi-hpd-with-enabled=
-mode.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop=
.org/show_bug.cgi?id=3D109284" target=3D"_blank">fdo#109284</a> / <a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111827" target=3D"_blank=
">fdo#111827</a>) +1 similar issue</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8084/shard-snb5/igt@kms_chamelium@hdmi-hpd-with-enabled-=
mode.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.=
org/show_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D=
"https://bugs.freedesktop.org/show_bug.cgi?id=3D111827" target=3D"_blank">f=
do#111827</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8084/shard-tglb2/igt@kms_cursor_legacy@2x-long-cursor-vs=
-flip-legacy.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.free=
desktop.org/show_bug.cgi?id=3D109274" target=3D"_blank">fdo#109274</a> / <a=
 href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111825" target=3D"_=
blank">fdo#111825</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8084/shard-iclb2/igt@kms_cursor_legacy@2x-long-cursor-vs=
-flip-legacy.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.free=
desktop.org/show_bug.cgi?id=3D109274" target=3D"_blank">fdo#109274</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-hdmi-a1-hdmi-a2:=
</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12365/shard-glk5/igt@kms_flip@2x-plain-flip-fb-recreate-interruptib=
le@ab-hdmi-a1-hdmi-a2.html" target=3D"_blank">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/shard-glk5/igt@kms_flip@2x=
-plain-flip-fb-recreate-interruptible@ab-hdmi-a1-hdmi-a2.html" target=3D"_b=
lank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
2122" target=3D"_blank">i915#2122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12365/shard-glk8/igt@kms_flip@flip-vs-expired-vblank-interruptible@=
b-hdmi-a2.html" target=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_8084/shard-glk3/igt@kms_flip@flip-vs-expire=
d-vblank-interruptible@b-hdmi-a2.html" target=3D"_blank">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/79" target=3D"_blank">i=
915#79</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12365/shard-apl7/igt@kms_flip@flip-vs-expired-vblank-interruptible@=
c-dp1.html" target=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_8084/shard-apl8/igt@kms_flip@flip-vs-expired-vb=
lank-interruptible@c-dp1.html" target=3D"_blank">FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/intel/issues/79" target=3D"_blank">i915#79</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning-vs-hang@c-dp1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12365/shard-apl8/igt@kms_flip@flip-vs-panning-vs-hang@c-dp1.html" t=
arget=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_8084/shard-apl1/igt@kms_flip@flip-vs-panning-vs-hang@c-dp1.h=
tml" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a>) +1 similar issue<=
/li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning-vs-hang@c-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12365/shard-glk6/igt@kms_flip@flip-vs-panning-vs-hang@c-hdmi-a1.htm=
l" target=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8084/shard-glk2/igt@kms_flip@flip-vs-panning-vs-hang@c-h=
dmi-a1.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedeskto=
p.org/show_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a>) +3 simila=
r issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling=
@pipe-a-default-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8084/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-yft=
ile-to-32bpp-yftileccs-downscaling@pipe-a-default-mode.html" target=3D"_bla=
nk">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/63=
75" target=3D"_blank">i915#6375</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a=
-default-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8084/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-4ti=
le-to-16bpp-4tile-upscaling@pipe-a-default-mode.html" target=3D"_blank">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2672" tar=
get=3D"_blank">i915#2672</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8084/shard-iclb8/igt@kms_flip_scaled_crc@flip-64bpp-yft=
ile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html" target=3D"_blank">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2587" tar=
get=3D"_blank">i915#2587</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/2672" target=3D"_blank">i915#2672</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12365/shard-iclb3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp=
-ytile-downscaling@pipe-a-default-mode.html" target=3D"_blank">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/shard-icl=
b2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe=
-a-default-mode.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/3555" target=3D"_blank">i915#3555</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8084/shard-iclb2/igt@kms_frontbuffer_tracking@fbc-2p-scn=
dscrn-cur-indfb-draw-blt.html" target=3D"_blank">SKIP</a> (<a href=3D"https=
://bugs.freedesktop.org/show_bug.cgi?id=3D109280" target=3D"_blank">fdo#109=
280</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8084/shard-tglb6/igt@kms_frontbuffer_tracking@fbc-2p-scn=
dscrn-cur-indfb-draw-blt.html" target=3D"_blank">SKIP</a> (<a href=3D"https=
://bugs.freedesktop.org/show_bug.cgi?id=3D109280" target=3D"_blank">fdo#109=
280</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111825"=
 target=3D"_blank">fdo#111825</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-blt:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8084/shard-glk1/igt@kms_frontbuffer_tracking@psr-rgb101=
010-draw-blt.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.free=
desktop.org/show_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a>) +9 =
similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8084/shard-tglb8/igt@kms_plane_lowres@tiling-yf.html" t=
arget=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug=
.cgi?id=3D112054" target=3D"_blank">fdo#112054</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/5288" target=3D"_blank">i915#5288</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf@pipe-b-edp-1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8084/shard-iclb7/igt@kms_plane_lowres@tiling-yf@pipe-b-=
edp-1.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/3536" target=3D"_blank">i915#3536</a>) +2 similar i=
ssues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pi=
pe-a-edp-1:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12365/shard-iclb5/igt@kms_plane_scaling@planes-upscale-factor-0-25-=
downscale-factor-0-5@pipe-a-edp-1.html" target=3D"_blank">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/shard-iclb2/ig=
t@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a-=
edp-1.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/5235" target=3D"_blank">i915#5235</a>) +2 similar i=
ssues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8084/shard-tglb5/igt@kms_psr2_su@page_flip-nv12.html" ta=
rget=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/7037" target=3D"_blank">i915#7037</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8084/shard-glk5/igt@kms_psr2_su@page_flip-nv12.html" tar=
get=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/intel/issues/658" target=3D"_blank">i915#658</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8084/shard-iclb7/igt@kms_psr2_su@page_flip-nv12.html" ta=
rget=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D109642" target=3D"_blank">fdo#109642</a> / <a href=3D"https://bugs=
.freedesktop.org/show_bug.cgi?id=3D111068" target=3D"_blank">fdo#111068</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/658" target=
=3D"_blank">i915#658</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_render:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12365/shard-iclb2/igt@kms_psr@psr2_sprite_render.html" target=3D"_b=
lank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_8084/shard-iclb6/igt@kms_psr@psr2_sprite_render.html" target=3D"_blank"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441=
" target=3D"_blank">fdo#109441</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_12365/shard-tglb7/igt@kms_psr_stress_test@flip-primary-invalidate-ov=
erlay.html" target=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_8084/shard-tglb6/igt@kms_psr_stress_test@flip-p=
rimary-invalidate-overlay.html" target=3D"_blank">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/5519" target=3D"_blank">i915#55=
19</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_12365/shard-iclb6/igt@kms_psr_stress_test@flip-primary-invalidate-ov=
erlay.html" target=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_8084/shard-iclb5/igt@kms_psr_stress_test@flip-p=
rimary-invalidate-overlay.html" target=3D"_blank">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/5519" target=3D"_blank">i915#55=
19</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@cursor-rotation-180:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12365/shard-glk3/igt@kms_rotation_crc@cursor-rotation-180.html" tar=
get=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_8084/shard-glk8/igt@kms_rotation_crc@cursor-rotation-180.html"=
 target=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/5852" target=3D"_blank">i915#5852</a>)</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@fair-1:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8084/shard-apl6/igt@sysfs_clients@fair-1.html" target=
=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/intel/issues/2994" target=3D"_blank">i915#2994</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-hang@blt:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12365/shard-rkl-5/igt@gem_ctx_persistence@legacy-engines-hang@blt.h=
tml" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/6252" target=3D"_blank">i915#6252</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/shard-rkl-6/igt@gem_ctx_p=
ersistence@legacy-engines-hang@blt.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@smoketest:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12365/shard-iclb2/igt@gem_ctx_persistence@smoketest.html" target=3D=
"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/5099" target=3D"_blank">i915#5099</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_8084/shard-iclb7/igt@gem_ctx_persistence@smo=
ketest.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12365/shard-glk2/igt@gem_exec_fair@basic-none-share@rcs0.html" targ=
et=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/2842" target=3D"_blank">i915#2842</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/shard-glk8/igt@gem_exec_fair@basic=
-none-share@rcs0.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12365/shard-apl7/igt@gem_exec_fair@basic-none-solo@rcs0.html" targe=
t=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/2842" target=3D"_blank">i915#2842</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/shard-apl7/igt@gem_exec_fair@basic-=
none-solo@rcs0.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@bcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12365/shard-iclb6/igt@gem_exec_fair@basic-none@bcs0.html" target=3D=
"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/2842" target=3D"_blank">i915#2842</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_8084/shard-iclb7/igt@gem_exec_fair@basic-non=
e@bcs0.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-wc-noreloc:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12365/shard-rkl-4/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html" tar=
get=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/3281" target=3D"_blank">i915#3281</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/shard-rkl-5/igt@gem_exec_reloc@ba=
sic-gtt-wc-noreloc.html" target=3D"_blank">PASS</a> +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@coherency:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12365/shard-rkl-4/igt@gem_mmap_gtt@coherency.html" target=3D"_blank=
">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D11165=
6" target=3D"_blank">fdo#111656</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_8084/shard-rkl-5/igt@gem_mmap_gtt@coherency.html"=
 target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-self:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12365/shard-rkl-4/igt@gem_pwrite@basic-self.html" target=3D"_blank"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3282"=
 target=3D"_blank">i915#3282</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_8084/shard-rkl-5/igt@gem_pwrite@basic-self.html" tar=
get=3D"_blank">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-far:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12365/shard-rkl-1/igt@gen9_exec_parse@bb-start-far.html" target=3D"=
_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/2527" target=3D"_blank">i915#2527</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_8084/shard-rkl-5/igt@gen9_exec_parse@bb-start=
-far.html" target=3D"_blank">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@engine-order:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12365/shard-rkl-5/igt@i915_pm_rps@engine-order.html" target=3D"_bla=
nk">FAIL</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_8084/shard-rkl-4/igt@i915_pm_rps@engine-order.html" target=3D"_blank">PAS=
S</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@perf@engine_cs:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12365/shard-snb2/igt@i915_selftest@perf@engine_cs.html" target=3D"_=
blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109271" target=3D"_blank">fdo#109271</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_8084/shard-snb2/igt@i915_selftest@perf@engin=
e_cs.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-b-dp-1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12365/shard-apl3/igt@kms_async_flips@alternate-sync-async-flip@pipe=
-b-dp-1.html" target=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/2521" target=3D"_blank">i915#2521</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/shard-apl7/igt@k=
ms_async_flips@alternate-sync-async-flip@pipe-b-dp-1.html" target=3D"_blank=
">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-b-edp-1:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12365/shard-iclb8/igt@kms_async_flips@alternate-sync-async-flip@pip=
e-b-edp-1.html" target=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/2521" target=3D"_blank">i915#2521</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/shard-iclb6/ig=
t@kms_async_flips@alternate-sync-async-flip@pipe-b-edp-1.html" target=3D"_b=
lank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12365/shard-glk1/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1.html=
" target=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/79" target=3D"_blank">i915#79</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/shard-glk5/igt@kms_flip@flip-vs-=
expired-vblank@c-hdmi-a1.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-pwrite:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12365/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-=
shrfb-draw-pwrite.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/1849" target=3D"_blank">i915#1849</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4098" target=3D=
"_blank">i915#4098</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_8084/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-=
pri-shrfb-draw-pwrite.html" target=3D"_blank">PASS</a> +7 similar issues</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12365/shard-apl3/igt@kms_frontbuffer_tracking@fbc-suspend.html" tar=
get=3D"_blank">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/180" target=3D"_blank">i915#180</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/shard-apl6/igt@kms_frontbuffe=
r_tracking@fbc-suspend.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_render:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12365/shard-rkl-2/igt@kms_psr@primary_render.html" target=3D"_blank=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1072=
" target=3D"_blank">i915#1072</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_8084/shard-rkl-6/igt@kms_psr@primary_render.html" t=
arget=3D"_blank">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_page_flip:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12365/shard-iclb7/igt@kms_psr@psr2_primary_page_flip.html" target=
=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109441" target=3D"_blank">fdo#109441</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/shard-iclb2/igt@kms_psr@psr2_prima=
ry_page_flip.html" target=3D"_blank">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@exhaust-fences:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12365/shard-rkl-1/igt@kms_rotation_crc@exhaust-fences.html" target=
=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/1845" target=3D"_blank">i915#1845</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/4098" target=3D"_blank">i915#4098</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/shard-rkl-6/=
igt@kms_rotation_crc@exhaust-fences.html" target=3D"_blank">PASS</a> +12 si=
milar issues</li>
</ul>
</li>
<li>
<p>igt@perf@polling-small-buf:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12365/shard-rkl-1/igt@perf@polling-small-buf.html" target=3D"_blank=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1722=
" target=3D"_blank">i915#1722</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_8084/shard-rkl-2/igt@perf@polling-small-buf.html" t=
arget=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@all-busy-idle-check-all:</p>
<ul>
<li>{shard-dg1}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12365/shard-dg1-15/igt@perf_pmu@all-busy-idle-check-all.html" targe=
t=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/5234" target=3D"_blank">i915#5234</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/shard-dg1-13/igt@perf_pmu@all-busy-=
idle-check-all.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@rcs0:</p>
<ul>
<li>{shard-dg1}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12365/shard-dg1-19/igt@perf_pmu@busy-double-start@rcs0.html" target=
=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/4349" target=3D"_blank">i915#4349</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/shard-dg1-18/igt@perf_pmu@busy-doubl=
e-start@rcs0.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_balancer@parallel-ordering:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12365/shard-iclb1/igt@gem_exec_balancer@parallel-ordering.html" tar=
get=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/6117" target=3D"_blank">i915#6117</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/shard-iclb7/igt@gem_exec_balancer=
@parallel-ordering.html" target=3D"_blank">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/4525" target=3D"_blank">i915#4525</a>)=
</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12365/shard-tglb5/igt@gem_pwrite@basic-exhaustion.html" target=3D"_=
blank">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/7248" target=3D"_blank">i915#7248</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/shard-tglb3/igt@gem_pwrite@basic-ex=
haustion.html" target=3D"_blank">WARN</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/2658" target=3D"_blank">i915#2658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12365/shard-iclb8/igt@kms_psr2_sf@cursor-plane-move-continuous-exce=
ed-sf.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/658" target=3D"_blank">i915#658</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/shard-iclb2/igt@kms=
_psr2_sf@cursor-plane-move-continuous-exceed-sf.html" target=3D"_blank">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2920" tar=
get=3D"_blank">i915#2920</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12365/shard-iclb3/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.=
html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D111068" target=3D"_blank">fdo#111068</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/658" target=3D"_blank">i915#658=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/=
shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html" target=
=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2920" target=3D"_blank">i915#2920</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12365/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.=
html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/2920" target=3D"_blank">i915#2920</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/shard-iclb7/igt@kms_psr2=
_sf@primary-plane-update-sf-dmg-area.html" target=3D"_blank">SKIP</a> (<a h=
ref=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111068" target=3D"_bl=
ank">fdo#111068</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/658" target=3D"_blank">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12365/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-=
big-fb.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/2920" target=3D"_blank">i915#2920</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/shard-iclb8/igt@k=
ms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html" target=3D"_blank">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/658" t=
arget=3D"_blank">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_12365/shard-apl2/igt@runner@aborted.html" target=3D"_blank">FAIL</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12365/shard-=
apl6/igt@runner@aborted.html" target=3D"_blank">FAIL</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12365/shard-apl3/igt@runner@abort=
ed.html" target=3D"_blank">FAIL</a>) (<a href=3D"https://bugs.freedesktop.o=
rg/show_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/3002" target=3D"_blank">i91=
5#3002</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/431=
2" target=3D"_blank">i915#4312</a>) -&gt; (<a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_8084/shard-apl8/igt@runner@aborted.html" target=
=3D"_blank">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_8084/shard-apl7/igt@runner@aborted.html" target=3D"_blank">FAIL</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/shard-apl3/ig=
t@runner@aborted.html" target=3D"_blank">FAIL</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_8084/shard-apl1/igt@runner@aborted.html" =
target=3D"_blank">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/180" target=3D"_blank">i915#180</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/intel/issues/3002" target=3D"_blank">i915#3002</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4312" target=3D"=
_blank">i915#4312</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br>
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7050 -&gt; IGTPW_8084</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br>
  CI_DRM_12365: 1bda5b0abc8a0d9d53d9fec1a390dc93e2b0ba57 @ git://<a href=3D=
"http://anongit.freedesktop.org/gfx-ci/linux" target=3D"_blank">anongit.fre=
edesktop.org/gfx-ci/linux</a><br>
  IGTPW_8084: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_808=
4/index.html" target=3D"_blank">https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_8084/index.html</a><br>
  IGT_7050: 42839a7c2bab78bc6cda8c949d8545606f377735 @ <a href=3D"https://g=
itlab.freedesktop.org/drm/igt-gpu-tools.git" target=3D"_blank">https://gitl=
ab.freedesktop.org/drm/igt-gpu-tools.git</a><br>
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://<a href=3D"=
http://anongit.freedesktop.org/piglit" target=3D"_blank">anongit.freedeskto=
p.org/piglit</a></p>

</div>

</div></blockquote></div>

--0000000000006b3e2f05ed340550--
