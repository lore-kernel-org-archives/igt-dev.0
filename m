Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD71710F360
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Jul 2022 15:22:14 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id z22so3312672lfu.7
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Jul 2022 08:22:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220720151940.12723-1-markyacoub@chromium.org>
 <165836423704.29948.4657590563105526238@emeril.freedesktop.org>
In-Reply-To: <165836423704.29948.4657590563105526238@emeril.freedesktop.org>
From: Mark Yacoub <markyacoub@chromium.org>
Date: Thu, 21 Jul 2022 11:22:01 -0400
Message-ID: <CAJUqKUqoQPwwFbH8ChL_nezBg5kGoG-6dp_pkDqKzxTSB+o7Cw@mail.gmail.com>
To: igt-dev@lists.freedesktop.org,
 "Vudum, Lakshminarayana" <lakshminarayana.vudum@intel.com>
Content-Type: multipart/alternative; boundary="0000000000002648c705e4524852"
Subject: Re: [igt-dev]
	=?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgbGliL2No?=
	=?utf-8?q?amelium=3A_Support_MST_connectors_on_reprobe_by_using_co?=
	=?utf-8?q?nnector_name?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--0000000000002648c705e4524852
Content-Type: text/plain; charset="UTF-8"

Luckily it looks like the failures are unrelated, can i get a rerun? thanks!

On Wed, Jul 20, 2022 at 8:43 PM Patchwork <patchwork@emeril.freedesktop.org>
wrote:

> *Patch Details*
> *Series:* lib/chamelium: Support MST connectors on reprobe by using
> connector name
> *URL:* https://patchwork.freedesktop.org/series/106539/
> *State:* failure
> *Details:* https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/index.html CI
> Bug Log - changes from CI_DRM_11928_full -> IGTPW_7545_full Summary
>
> *FAILURE*
>
> Serious unknown changes coming with IGTPW_7545_full absolutely need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_7545_full, please notify your bug team to allow them
> to document this new failure mode, which will reduce false positives in CI.
>
> External URL:
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/index.html
> Participating hosts (13 -> 10)
>
> Missing (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005
> Possible new issues
>
> Here are the unknown changes that may have been introduced in
> IGTPW_7545_full:
> IGT changes Possible regressions
>
>    -
>
>    igt@gem_busy@close-race:
>    - shard-apl: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-apl3/igt@gem_busy@close-race.html>
>       -> DMESG-FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-apl6/igt@gem_busy@close-race.html>
>    -
>
>    igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-1:
>    - shard-kbl: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-kbl4/igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-1.html>
>       -> INCOMPLETE
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-kbl4/igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-1.html>
>
> New tests
>
> New tests have been introduced between CI_DRM_11928_full and
> IGTPW_7545_full:
> New IGT tests (6)
>
>    -
>
>    igt@kms_flip@flip-vs-panning-vs-hang@a-hdmi-a4:
>    - Statuses : 1 pass(s)
>       - Exec time: [30.13] s
>    -
>
>    igt@kms_flip@flip-vs-panning-vs-hang@d-hdmi-a4:
>    - Statuses : 1 pass(s)
>       - Exec time: [29.95] s
>    -
>
>    igt@kms_plane_scaling
>    @plane-upscale-with-modifiers-20x20@pipe-a-hdmi-a-4:
>    - Statuses : 1 pass(s)
>       - Exec time: [0.40] s
>    -
>
>    igt@kms_plane_scaling
>    @plane-upscale-with-modifiers-20x20@pipe-b-hdmi-a-4:
>    - Statuses : 1 pass(s)
>       - Exec time: [0.41] s
>    -
>
>    igt@kms_plane_scaling
>    @plane-upscale-with-modifiers-20x20@pipe-c-hdmi-a-4:
>    - Statuses : 1 pass(s)
>       - Exec time: [0.41] s
>    -
>
>    igt@kms_plane_scaling
>    @plane-upscale-with-modifiers-20x20@pipe-d-hdmi-a-4:
>    - Statuses : 1 pass(s)
>       - Exec time: [0.40] s
>
> Known issues
>
> Here are the changes found in IGTPW_7545_full that come from known issues:
> IGT changes Issues hit
>
>    -
>
>    igt@feature_discovery@psr2:
>    - shard-iclb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-iclb2/igt@feature_discovery@psr2.html>
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-iclb4/igt@feature_discovery@psr2.html>
>       (i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>)
>    -
>
>    igt@gem_ctx_isolation@preservation-s3@vcs0:
>    - shard-kbl: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-kbl6/igt@gem_ctx_isolation@preservation-s3@vcs0.html>
>       -> DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-kbl4/igt@gem_ctx_isolation@preservation-s3@vcs0.html>
>       (i915#180 <https://gitlab.freedesktop.org/drm/intel/issues/180>) +4
>       similar issues
>    -
>
>    igt@gem_ctx_persistence@engines-mixed:
>    - shard-snb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-snb4/igt@gem_ctx_persistence@engines-mixed.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#1099 <https://gitlab.freedesktop.org/drm/intel/issues/1099>)
>    -
>
>    igt@gem_eio@reset-stress:
>    - shard-snb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-snb2/igt@gem_eio@reset-stress.html>
>       -> TIMEOUT
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-snb5/igt@gem_eio@reset-stress.html>
>       (i915#3427 <https://gitlab.freedesktop.org/drm/intel/issues/3427>)
>    -
>
>    igt@gem_exec_balancer@parallel-contexts:
>    - shard-iclb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-iclb1/igt@gem_exec_balancer@parallel-contexts.html>
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-iclb5/igt@gem_exec_balancer@parallel-contexts.html>
>       (i915#4525 <https://gitlab.freedesktop.org/drm/intel/issues/4525>)
>       +1 similar issue
>    -
>
>    igt@gem_exec_fair@basic-none-share@rcs0:
>    - shard-tglb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-tglb1/igt@gem_exec_fair@basic-none-share@rcs0.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-tglb2/igt@gem_exec_fair@basic-none-share@rcs0.html>
>       (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
>       +1 similar issue
>    -
>
>    igt@gem_exec_fair@basic-none@vcs1:
>    - shard-kbl: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-kbl6/igt@gem_exec_fair@basic-none@vcs1.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-kbl1/igt@gem_exec_fair@basic-none@vcs1.html>
>       (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
>       +1 similar issue
>    -
>
>    igt@gem_exec_fair@basic-pace-share@rcs0:
>    - shard-glk: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-glk5/igt@gem_exec_fair@basic-pace-share@rcs0.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-glk6/igt@gem_exec_fair@basic-pace-share@rcs0.html>
>       (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
>    -
>
>    igt@gem_exec_fair@basic-pace@rcs0:
>    - shard-kbl: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-kbl1/igt@gem_exec_fair@basic-pace@rcs0.html>
>       (i915#2851 <https://gitlab.freedesktop.org/drm/intel/issues/2851>)
>    -
>
>    igt@gem_exec_fair@basic-pace@vecs0:
>    - shard-kbl: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-kbl1/igt@gem_exec_fair@basic-pace@vecs0.html>
>       (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
>       +2 similar issues
>    -
>
>    igt@gem_exec_fence@syncobj-backward-timeline-chain-engines:
>    - shard-snb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-snb2/igt@gem_exec_fence@syncobj-backward-timeline-chain-engines.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>)
>       +98 similar issues
>    -
>
>    igt@gem_huc_copy@huc-copy:
>    - shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-apl7/igt@gem_huc_copy@huc-copy.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#2190 <https://gitlab.freedesktop.org/drm/intel/issues/2190>)
>    -
>
>    igt@gem_lmem_swapping@parallel-random-verify:
>    -
>
>       shard-kbl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-kbl4/igt@gem_lmem_swapping@parallel-random-verify.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#4613 <https://gitlab.freedesktop.org/drm/intel/issues/4613>)
>       +1 similar issue
>       -
>
>       shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-apl3/igt@gem_lmem_swapping@parallel-random-verify.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#4613 <https://gitlab.freedesktop.org/drm/intel/issues/4613>)
>       -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-tglb5/igt@gem_lmem_swapping@parallel-random-verify.html>
>       (i915#4613 <https://gitlab.freedesktop.org/drm/intel/issues/4613>)
>       -
>
>       shard-glk: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-glk2/igt@gem_lmem_swapping@parallel-random-verify.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#4613 <https://gitlab.freedesktop.org/drm/intel/issues/4613>)
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-iclb6/igt@gem_lmem_swapping@parallel-random-verify.html>
>       (i915#4613 <https://gitlab.freedesktop.org/drm/intel/issues/4613>)
>       -
>
>    igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:
>    -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-tglb5/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html>
>       (i915#4270 <https://gitlab.freedesktop.org/drm/intel/issues/4270>)
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-iclb3/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html>
>       (i915#4270 <https://gitlab.freedesktop.org/drm/intel/issues/4270>)
>       -
>
>    igt@gem_render_copy@y-tiled-to-vebox-linear:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-iclb3/igt@gem_render_copy@y-tiled-to-vebox-linear.html>
>       (i915#768 <https://gitlab.freedesktop.org/drm/intel/issues/768>)
>    -
>
>    igt@gen7_exec_parse@bitmasks:
>    -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-tglb1/igt@gen7_exec_parse@bitmasks.html>
>       (fdo#109289 <https://bugs.freedesktop.org/show_bug.cgi?id=109289>)
>       +2 similar issues
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-iclb7/igt@gen7_exec_parse@bitmasks.html>
>       (fdo#109289 <https://bugs.freedesktop.org/show_bug.cgi?id=109289>)
>       +1 similar issue
>       -
>
>    igt@i915_pm_dc@dc6-dpms:
>    -
>
>       shard-tglb: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-tglb1/igt@i915_pm_dc@dc6-dpms.html>
>       (i915#3989 <https://gitlab.freedesktop.org/drm/intel/issues/3989> /
>       i915#454 <https://gitlab.freedesktop.org/drm/intel/issues/454>)
>       -
>
>       shard-kbl: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-kbl4/igt@i915_pm_dc@dc6-dpms.html>
>       (i915#454 <https://gitlab.freedesktop.org/drm/intel/issues/454>)
>       -
>
>    igt@i915_pm_dc@dc9-dpms:
>    - shard-apl: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-apl7/igt@i915_pm_dc@dc9-dpms.html>
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-apl6/igt@i915_pm_dc@dc9-dpms.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>)
>    -
>
>    igt@i915_pm_rc6_residency@rc6-idle@vcs0:
>    -
>
>       shard-apl: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-apl6/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html>
>       -> WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-apl8/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html>
>       (i915#6405 <https://gitlab.freedesktop.org/drm/intel/issues/6405>)
>       -
>
>       shard-glk: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-glk2/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html>
>       -> WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-glk5/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html>
>       (i915#6405 <https://gitlab.freedesktop.org/drm/intel/issues/6405>)
>       -
>
>    igt@i915_pm_rpm@pc8-residency:
>    -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-iclb2/igt@i915_pm_rpm@pc8-residency.html>
>       (fdo#109293 <https://bugs.freedesktop.org/show_bug.cgi?id=109293> /
>       fdo#109506 <https://bugs.freedesktop.org/show_bug.cgi?id=109506>)
>       -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-tglb8/igt@i915_pm_rpm@pc8-residency.html>
>       (fdo#109506 <https://bugs.freedesktop.org/show_bug.cgi?id=109506> /
>       i915#2411 <https://gitlab.freedesktop.org/drm/intel/issues/2411>)
>       -
>
>    igt@i915_query@query-topology-known-pci-ids:
>    -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-tglb1/igt@i915_query@query-topology-known-pci-ids.html>
>       (fdo#109303 <https://bugs.freedesktop.org/show_bug.cgi?id=109303>)
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-iclb3/igt@i915_query@query-topology-known-pci-ids.html>
>       (fdo#109303 <https://bugs.freedesktop.org/show_bug.cgi?id=109303>)
>       -
>
>    igt@i915_query@query-topology-unsupported:
>    -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-tglb3/igt@i915_query@query-topology-unsupported.html>
>       (fdo#109302 <https://bugs.freedesktop.org/show_bug.cgi?id=109302>)
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-iclb3/igt@i915_query@query-topology-unsupported.html>
>       (fdo#109302 <https://bugs.freedesktop.org/show_bug.cgi?id=109302>)
>       -
>
>    igt@kms_big_fb@4-tiled-64bpp-rotate-270:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-tglb5/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html>
>       (i915#5286 <https://gitlab.freedesktop.org/drm/intel/issues/5286>)
>       +1 similar issue
>    -
>
>    igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-iclb3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html>
>       (i915#5286 <https://gitlab.freedesktop.org/drm/intel/issues/5286>)
>       +1 similar issue
>    -
>
>    igt@kms_big_fb@linear-64bpp-rotate-270:
>    -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-tglb5/igt@kms_big_fb@linear-64bpp-rotate-270.html>
>       (fdo#111614 <https://bugs.freedesktop.org/show_bug.cgi?id=111614>)
>       +1 similar issue
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-iclb3/igt@kms_big_fb@linear-64bpp-rotate-270.html>
>       (fdo#110725 <https://bugs.freedesktop.org/show_bug.cgi?id=110725> /
>       fdo#111614 <https://bugs.freedesktop.org/show_bug.cgi?id=111614>)
>       +1 similar issue
>       -
>
>    igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-tglb3/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html>
>       (fdo#111615 <https://bugs.freedesktop.org/show_bug.cgi?id=111615>)
>       +1 similar issue
>    -
>
>    igt@kms_ccs@pipe-a-bad-pixel-format-4_tiled_dg2_rc_ccs:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-tglb8/igt@kms_ccs@pipe-a-bad-pixel-format-4_tiled_dg2_rc_ccs.html>
>       (i915#3689 <https://gitlab.freedesktop.org/drm/intel/issues/3689> /
>       i915#6095 <https://gitlab.freedesktop.org/drm/intel/issues/6095>)
>       +2 similar issues
>    -
>
>    igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:
>    -
>
>       shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-apl2/igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#3886 <https://gitlab.freedesktop.org/drm/intel/issues/3886>)
>       +6 similar issues
>       -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-tglb8/igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html>
>       (i915#3689 <https://gitlab.freedesktop.org/drm/intel/issues/3689> /
>       i915#3886 <https://gitlab.freedesktop.org/drm/intel/issues/3886>)
>       -
>
>    igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_gen12_rc_ccs_cc:
>    -
>
>       shard-glk: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-glk8/igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_gen12_rc_ccs_cc.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#3886 <https://gitlab.freedesktop.org/drm/intel/issues/3886>)
>       +4 similar issues
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-iclb4/igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_gen12_rc_ccs_cc.html>
>       (fdo#109278 <https://bugs.freedesktop.org/show_bug.cgi?id=109278> /
>       i915#3886 <https://gitlab.freedesktop.org/drm/intel/issues/3886>)
>       +4 similar issues
>       -
>
>    igt@kms_ccs@pipe-b-crc-primary-rotation-180-4_tiled_dg2_rc_ccs_cc:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-tglb2/igt@kms_ccs@pipe-b-crc-primary-rotation-180-4_tiled_dg2_rc_ccs_cc.html>
>       (i915#6095 <https://gitlab.freedesktop.org/drm/intel/issues/6095>)
>    -
>
>    igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_rc_ccs_cc:
>    - shard-kbl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-kbl6/igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_rc_ccs_cc.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#3886 <https://gitlab.freedesktop.org/drm/intel/issues/3886>)
>       +9 similar issues
>    -
>
>    igt@kms_ccs@pipe-d-crc-primary-basic-4_tiled_dg2_rc_ccs_cc:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-tglb5/igt@kms_ccs@pipe-d-crc-primary-basic-4_tiled_dg2_rc_ccs_cc.html>
>       (i915#3689 <https://gitlab.freedesktop.org/drm/intel/issues/3689>)
>       +1 similar issue
>    -
>
>    igt@kms_color_chamelium@pipe-a-ctm-red-to-blue:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-iclb1/igt@kms_color_chamelium@pipe-a-ctm-red-to-blue.html>
>       (fdo#109284 <https://bugs.freedesktop.org/show_bug.cgi?id=109284> /
>       fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>)
>       +3 similar issues
>    -
>
>    igt@kms_color_chamelium@pipe-c-ctm-0-75:
>    -
>
>       shard-kbl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-kbl7/igt@kms_color_chamelium@pipe-c-ctm-0-75.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>)
>       +4 similar issues
>       -
>
>       shard-snb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-snb4/igt@kms_color_chamelium@pipe-c-ctm-0-75.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>)
>       +5 similar issues
>       -
>
>    igt@kms_color_chamelium@pipe-d-ctm-limited-range:
>    -
>
>       shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-apl7/igt@kms_color_chamelium@pipe-d-ctm-limited-range.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>)
>       +5 similar issues
>       -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-tglb2/igt@kms_color_chamelium@pipe-d-ctm-limited-range.html>
>       (fdo#109284 <https://bugs.freedesktop.org/show_bug.cgi?id=109284> /
>       fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>)
>       +4 similar issues
>       -
>
>       shard-glk: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-glk3/igt@kms_color_chamelium@pipe-d-ctm-limited-range.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>)
>       +4 similar issues
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-iclb8/igt@kms_color_chamelium@pipe-d-ctm-limited-range.html>
>       (fdo#109278 <https://bugs.freedesktop.org/show_bug.cgi?id=109278> /
>       fdo#109284 <https://bugs.freedesktop.org/show_bug.cgi?id=109284> /
>       fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>)
>       -
>
>    igt@kms_content_protection@dp-mst-type-1:
>    -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-tglb5/igt@kms_content_protection@dp-mst-type-1.html>
>       (i915#3116 <https://gitlab.freedesktop.org/drm/intel/issues/3116> /
>       i915#3299 <https://gitlab.freedesktop.org/drm/intel/issues/3299>)
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-iclb6/igt@kms_content_protection@dp-mst-type-1.html>
>       (i915#3116 <https://gitlab.freedesktop.org/drm/intel/issues/3116>)
>       -
>
>    igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-tglb5/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html>
>       (fdo#109274 <https://bugs.freedesktop.org/show_bug.cgi?id=109274> /
>       fdo#111825 <https://bugs.freedesktop.org/show_bug.cgi?id=111825>)
>    -
>
>    igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions:
>    - shard-glk: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions.html>
>       (i915#2346 <https://gitlab.freedesktop.org/drm/intel/issues/2346>)
>       +1 similar issue
>    -
>
>    igt@kms_dsc@basic-dsc:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-iclb7/igt@kms_dsc@basic-dsc.html>
>       (i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555> /
>       i915#3828 <https://gitlab.freedesktop.org/drm/intel/issues/3828>)
>    -
>
>    igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a1-hdmi-a2:
>    - shard-glk: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-glk3/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a1-hdmi-a2.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-glk8/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a1-hdmi-a2.html>
>       (i915#79 <https://gitlab.freedesktop.org/drm/intel/issues/79>)
>    -
>
>    igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-iclb6/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html>
>       (fdo#109274 <https://bugs.freedesktop.org/show_bug.cgi?id=109274>)
>       +3 similar issues
>    -
>
>    igt@kms_flip@2x-nonexisting-fb:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-tglb3/igt@kms_flip@2x-nonexisting-fb.html>
>       (fdo#109274 <https://bugs.freedesktop.org/show_bug.cgi?id=109274> /
>       fdo#111825 <https://bugs.freedesktop.org/show_bug.cgi?id=111825> /
>       i915#3637 <https://gitlab.freedesktop.org/drm/intel/issues/3637>)
>       +2 similar issues
>    -
>
>    igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:
>    - shard-tglb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-tglb3/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-tglb3/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html>
>       (i915#79 <https://gitlab.freedesktop.org/drm/intel/issues/79>)
>    -
>
>    igt@kms_flip@flip-vs-suspend@c-dp1:
>    - shard-apl: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-apl7/igt@kms_flip@flip-vs-suspend@c-dp1.html>
>       -> DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-apl8/igt@kms_flip@flip-vs-suspend@c-dp1.html>
>       (i915#180 <https://gitlab.freedesktop.org/drm/intel/issues/180>) +1
>       similar issue
>    -
>
>    igt@kms_flip_scaled_crc
>    @flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-iclb6/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html>
>       (i915#2672 <https://gitlab.freedesktop.org/drm/intel/issues/2672>)
>       +7 similar issues
>    -
>
>    igt@kms_flip_scaled_crc
>    @flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-valid-mode:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-tglb8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-valid-mode.html>
>       (i915#2672 <https://gitlab.freedesktop.org/drm/intel/issues/2672>)
>    -
>
>    igt@kms_flip_scaled_crc
>    @flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-iclb1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html>
>       (i915#2672 <https://gitlab.freedesktop.org/drm/intel/issues/2672> /
>       i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555>)
>    -
>
>    igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-pgflip-blt:
>    - shard-tglb: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-pgflip-blt.html>
>       (i915#160 <https://gitlab.freedesktop.org/drm/intel/issues/160>) +4
>       similar issues
>    -
>
>    igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html>
>       (fdo#109280 <https://bugs.freedesktop.org/show_bug.cgi?id=109280> /
>       fdo#111825 <https://bugs.freedesktop.org/show_bug.cgi?id=111825>)
>       +10 similar issues
>    -
>
>    igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc:
>    - shard-glk: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-glk3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>)
>       +50 similar issues
>    -
>
>    igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff:
>    - shard-kbl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-kbl6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>)
>       +110 similar issues
>    -
>
>    igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-iclb4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc.html>
>       (fdo#109280 <https://bugs.freedesktop.org/show_bug.cgi?id=109280>)
>       +10 similar issues
>    -
>
>    igt@kms_hdr@bpc-switch@pipe-a-dp-1:
>    - shard-kbl: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-kbl1/igt@kms_hdr@bpc-switch@pipe-a-dp-1.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-kbl4/igt@kms_hdr@bpc-switch@pipe-a-dp-1.html>
>       (i915#1188 <https://gitlab.freedesktop.org/drm/intel/issues/1188>)
>    -
>
>    igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb:
>    - shard-apl: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-apl4/igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb.html>
>       (i915#265 <https://gitlab.freedesktop.org/drm/intel/issues/265>)
>    -
>
>    igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb:
>    - shard-kbl: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-kbl4/igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb.html>
>       (i915#265 <https://gitlab.freedesktop.org/drm/intel/issues/265>)
>    -
>
>    igt@kms_plane_multiple@atomic-pipe-d-tiling-none:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-iclb2/igt@kms_plane_multiple@atomic-pipe-d-tiling-none.html>
>       (fdo#109278 <https://bugs.freedesktop.org/show_bug.cgi?id=109278>)
>       +8 similar issues
>    -
>
>    igt@kms_plane_scaling
>    @plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-edp-1:
>    - shard-iclb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-iclb6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-edp-1.html>
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-iclb3/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-edp-1.html>
>       (i915#5176 <https://gitlab.freedesktop.org/drm/intel/issues/5176>)
>       +1 similar issue
>    -
>
>    igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf:
>    - shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-apl4/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>) +1
>       similar issue
>    -
>
>    igt@kms_psr2_su@frontbuffer-xrgb8888:
>    -
>
>       shard-glk: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-glk1/igt@kms_psr2_su@frontbuffer-xrgb8888.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>)
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-iclb4/igt@kms_psr2_su@frontbuffer-xrgb8888.html>
>       (fdo#109642 <https://bugs.freedesktop.org/show_bug.cgi?id=109642> /
>       fdo#111068 <https://bugs.freedesktop.org/show_bug.cgi?id=111068> /
>       i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>)
>       -
>
>       shard-kbl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-kbl7/igt@kms_psr2_su@frontbuffer-xrgb8888.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>) +2
>       similar issues
>       -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-tglb3/igt@kms_psr2_su@frontbuffer-xrgb8888.html>
>       (i915#1911 <https://gitlab.freedesktop.org/drm/intel/issues/1911>)
>       -
>
>    igt@kms_psr2_su@page_flip-xrgb8888:
>    - shard-iclb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-iclb2/igt@kms_psr2_su@page_flip-xrgb8888.html>
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-iclb6/igt@kms_psr2_su@page_flip-xrgb8888.html>
>       (fdo#109642 <https://bugs.freedesktop.org/show_bug.cgi?id=109642> /
>       fdo#111068 <https://bugs.freedesktop.org/show_bug.cgi?id=111068> /
>       i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>)
>    -
>
>    igt@kms_psr@primary_page_flip:
>    - shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-apl1/igt@kms_psr@primary_page_flip.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>)
>       +91 similar issues
>    -
>
>    igt@kms_psr@psr2_sprite_blt:
>    - shard-iclb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-iclb2/igt@kms_psr@psr2_sprite_blt.html>
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-iclb5/igt@kms_psr@psr2_sprite_blt.html>
>       (fdo#109441 <https://bugs.freedesktop.org/show_bug.cgi?id=109441>)
>       +1 similar issue
>    -
>
>    igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
>    - shard-iclb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-iclb4/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html>
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-iclb8/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html>
>       (i915#5519 <https://gitlab.freedesktop.org/drm/intel/issues/5519>)
>    -
>
>    igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-tglb8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html>
>       (fdo#111615 <https://bugs.freedesktop.org/show_bug.cgi?id=111615> /
>       i915#5289 <https://gitlab.freedesktop.org/drm/intel/issues/5289>)
>    -
>
>    igt@kms_writeback@writeback-check-output:
>    -
>
>       shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-apl7/igt@kms_writeback@writeback-check-output.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#2437 <https://gitlab.freedesktop.org/drm/intel/issues/2437>)
>       -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-tglb1/igt@kms_writeback@writeback-check-output.html>
>       (i915#2437 <https://gitlab.freedesktop.org/drm/intel/issues/2437>)
>       -
>
>       shard-glk: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-glk1/igt@kms_writeback@writeback-check-output.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#2437 <https://gitlab.freedesktop.org/drm/intel/issues/2437>)
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-iclb4/igt@kms_writeback@writeback-check-output.html>
>       (i915#2437 <https://gitlab.freedesktop.org/drm/intel/issues/2437>)
>       -
>
>    igt@kms_writeback@writeback-pixel-formats:
>    - shard-kbl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-kbl1/igt@kms_writeback@writeback-pixel-formats.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#2437 <https://gitlab.freedesktop.org/drm/intel/issues/2437>)
>       +1 similar issue
>    -
>
>    igt@nouveau_crc@pipe-b-source-outp-complete:
>    -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-iclb8/igt@nouveau_crc@pipe-b-source-outp-complete.html>
>       (i915#2530 <https://gitlab.freedesktop.org/drm/intel/issues/2530>)
>       -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-tglb2/igt@nouveau_crc@pipe-b-source-outp-complete.html>
>       (i915#2530 <https://gitlab.freedesktop.org/drm/intel/issues/2530>)
>       -
>
>    igt@prime_nv_api@i915_nv_import_twice_check_flink_name:
>    -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-tglb2/igt@prime_nv_api@i915_nv_import_twice_check_flink_name.html>
>       (fdo#109291 <https://bugs.freedesktop.org/show_bug.cgi?id=109291>)
>       +1 similar issue
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-iclb6/igt@prime_nv_api@i915_nv_import_twice_check_flink_name.html>
>       (fdo#109291 <https://bugs.freedesktop.org/show_bug.cgi?id=109291>)
>       +1 similar issue
>       -
>
>    igt@prime_vgem@coherency-gtt:
>    -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-iclb5/igt@prime_vgem@coherency-gtt.html>
>       (fdo#109292 <https://bugs.freedesktop.org/show_bug.cgi?id=109292> /
>       fdo#109295 <https://bugs.freedesktop.org/show_bug.cgi?id=109295>)
>       -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-tglb1/igt@prime_vgem@coherency-gtt.html>
>       (fdo#109295 <https://bugs.freedesktop.org/show_bug.cgi?id=109295> /
>       fdo#111656 <https://bugs.freedesktop.org/show_bug.cgi?id=111656>)
>       -
>
>    igt@sysfs_clients@busy:
>    -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-tglb5/igt@sysfs_clients@busy.html>
>       (i915#2994 <https://gitlab.freedesktop.org/drm/intel/issues/2994>)
>       +1 similar issue
>       -
>
>       shard-glk: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-glk1/igt@sysfs_clients@busy.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#2994 <https://gitlab.freedesktop.org/drm/intel/issues/2994>)
>       +1 similar issue
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-iclb7/igt@sysfs_clients@busy.html>
>       (i915#2994 <https://gitlab.freedesktop.org/drm/intel/issues/2994>)
>       +1 similar issue
>       -
>
>    igt@sysfs_clients@recycle-many:
>    - shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-apl7/igt@sysfs_clients@recycle-many.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#2994 <https://gitlab.freedesktop.org/drm/intel/issues/2994>)
>       +2 similar issues
>    -
>
>    igt@sysfs_clients@split-10:
>    - shard-kbl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-kbl7/igt@sysfs_clients@split-10.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#2994 <https://gitlab.freedesktop.org/drm/intel/issues/2994>)
>       +2 similar issues
>    -
>
>    igt@tools_test@sysfs_l3_parity:
>    -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-tglb5/igt@tools_test@sysfs_l3_parity.html>
>       (fdo#109307 <https://bugs.freedesktop.org/show_bug.cgi?id=109307>)
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-iclb2/igt@tools_test@sysfs_l3_parity.html>
>       (fdo#109307 <https://bugs.freedesktop.org/show_bug.cgi?id=109307>)
>
> Possible fixes
>
>    -
>
>    igt@fbdev@pan:
>    - {shard-rkl}: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-rkl-2/igt@fbdev@pan.html>
>       (i915#2582 <https://gitlab.freedesktop.org/drm/intel/issues/2582>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-rkl-6/igt@fbdev@pan.html>
>    -
>
>    igt@gem_ctx_persistence@smoketest:
>    - shard-tglb: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-tglb2/igt@gem_ctx_persistence@smoketest.html>
>       (i915#5099 <https://gitlab.freedesktop.org/drm/intel/issues/5099>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-tglb3/igt@gem_ctx_persistence@smoketest.html>
>    -
>
>    igt@gem_exec_balancer@parallel-keep-in-fence:
>    - shard-iclb: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-iclb6/igt@gem_exec_balancer@parallel-keep-in-fence.html>
>       (i915#4525 <https://gitlab.freedesktop.org/drm/intel/issues/4525>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-iclb4/igt@gem_exec_balancer@parallel-keep-in-fence.html>
>       +1 similar issue
>    -
>
>    igt@gem_exec_fair@basic-pace-solo@rcs0:
>    - shard-kbl: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-kbl7/igt@gem_exec_fair@basic-pace-solo@rcs0.html>
>       (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-kbl4/igt@gem_exec_fair@basic-pace-solo@rcs0.html>
>       +1 similar issue
>    -
>
>    igt@gem_exec_fair@basic-pace@rcs0:
>    - shard-glk: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-glk2/igt@gem_exec_fair@basic-pace@rcs0.html>
>       (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-glk5/igt@gem_exec_fair@basic-pace@rcs0.html>
>    -
>
>    igt@gem_exec_reloc@basic-gtt-wc-active:
>    - {shard-rkl}: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-rkl-2/igt@gem_exec_reloc@basic-gtt-wc-active.html>
>       (i915#3281 <https://gitlab.freedesktop.org/drm/intel/issues/3281>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-rkl-5/igt@gem_exec_reloc@basic-gtt-wc-active.html>
>       +3 similar issues
>    -
>
>    igt@gem_readwrite@read-write:
>    - {shard-rkl}: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-rkl-2/igt@gem_readwrite@read-write.html>
>       (i915#3282 <https://gitlab.freedesktop.org/drm/intel/issues/3282>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-rkl-5/igt@gem_readwrite@read-write.html>
>       +1 similar issue
>    -
>
>    igt@gem_workarounds@suspend-resume-fd:
>    - shard-kbl: DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-kbl7/igt@gem_workarounds@suspend-resume-fd.html>
>       (i915#180 <https://gitlab.freedesktop.org/drm/intel/issues/180>) ->
>       PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-kbl6/igt@gem_workarounds@suspend-resume-fd.html>
>    -
>
>    igt@gen9_exec_parse@bb-start-param:
>    - {shard-rkl}: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-rkl-1/igt@gen9_exec_parse@bb-start-param.html>
>       (i915#2527 <https://gitlab.freedesktop.org/drm/intel/issues/2527>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-rkl-5/igt@gen9_exec_parse@bb-start-param.html>
>    -
>
>    igt@i915_pm_backlight@bad-brightness:
>    - {shard-rkl}: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-rkl-1/igt@i915_pm_backlight@bad-brightness.html>
>       (i915#3012 <https://gitlab.freedesktop.org/drm/intel/issues/3012>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-rkl-6/igt@i915_pm_backlight@bad-brightness.html>
>    -
>
>    igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:
>    - {shard-dg1}: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-dg1-15/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html>
>       (i915#1937 <https://gitlab.freedesktop.org/drm/intel/issues/1937>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-dg1-18/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html>
>    -
>
>    igt@i915_pm_rc6_residency@rc6-idle@rcs0:
>    - {shard-tglu}: WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-tglu-6/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html>
>       (i915#2681 <https://gitlab.freedesktop.org/drm/intel/issues/2681>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-tglu-6/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html>
>    -
>
>    igt@i915_pm_rpm@fences-dpms:
>    - {shard-rkl}: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-rkl-1/igt@i915_pm_rpm@fences-dpms.html>
>       (i915#1849 <https://gitlab.freedesktop.org/drm/intel/issues/1849>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-rkl-6/igt@i915_pm_rpm@fences-dpms.html>
>       +1 similar issue
>    -
>
>    igt@i915_pm_rpm@modeset-lpsp:
>    - {shard-rkl}: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-rkl-1/igt@i915_pm_rpm@modeset-lpsp.html>
>       (i915#1397 <https://gitlab.freedesktop.org/drm/intel/issues/1397>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-rkl-6/igt@i915_pm_rpm@modeset-lpsp.html>
>    -
>
>    igt@i915_selftest@live@migrate:
>    - shard-iclb: DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-iclb5/igt@i915_selftest@live@migrate.html>
>       (i915#2867 <https://gitlab.freedesktop.org/drm/intel/issues/2867>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-iclb1/igt@i915_selftest@live@migrate.html>
>       +6 similar issues
>    -
>
>    igt@i915_suspend@basic-s3-without-i915:
>    - shard-snb: DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-snb7/igt@i915_suspend@basic-s3-without-i915.html>
>       (i915#4528 <https://gitlab.freedesktop.org/drm/intel/issues/4528>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-snb4/igt@i915_suspend@basic-s3-without-i915.html>
>    -
>
>    igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
>    - shard-glk: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-glk6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html>
>       (i915#72 <https://gitlab.freedesktop.org/drm/intel/issues/72>) ->
>       PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-glk5/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html>
>    -
>
>    igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled:
>    - {shard-rkl}: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-rkl-2/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html>
>       (fdo#111314 <https://bugs.freedesktop.org/show_bug.cgi?id=111314> /
>       i915#4098 <https://gitlab.freedesktop.org/drm/intel/issues/4098> /
>       i915#4369 <https://gitlab.freedesktop.org/drm/intel/issues/4369>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-rkl-6/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html>
>       +5 similar issues
>    -
>
>    igt@kms_flip@plain-flip-fb-recreate-interruptible@b-dp1:
>    -
>
>       shard-apl: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-apl8/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-dp1.html>
>       (i915#2122 <https://gitlab.freedesktop.org/drm/intel/issues/2122>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-apl4/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-dp1.html>
>       -
>
>       shard-kbl: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-kbl7/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-dp1.html>
>       (i915#2122 <https://gitlab.freedesktop.org/drm/intel/issues/2122>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-kbl1/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-dp1.html>
>       -
>
>    igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt:
>    - {shard-rkl}: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-rkl-1/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt.html>
>       (i915#1849 <https://gitlab.freedesktop.org/drm/intel/issues/1849> /
>       i915#4098 <https://gitlab.freedesktop.org/drm/intel/issues/4098>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt.html>
>       +13 similar issues
>    -
>
>    igt@kms_pipe_crc_basic@bad-source:
>    - {shard-rkl}: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-rkl-1/igt@kms_pipe_crc_basic@bad-source.html>
>       (i915#1845 <https://gitlab.freedesktop.org/drm/intel/issues/1845> /
>       i915#4098 <https://gitlab.freedesktop.org/drm/intel/issues/4098>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-rkl-6/igt@kms_pipe_crc_basic@bad-source.html>
>       +23 similar issues
>    -
>
>    igt@kms_plane@pixel-format@pipe-a-planes:
>    - {shard-rkl}: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-rkl-1/igt@kms_plane@pixel-format@pipe-a-planes.html>
>       (i915#3558 <https://gitlab.freedesktop.org/drm/intel/issues/3558>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-rkl-6/igt@kms_plane@pixel-format@pipe-a-planes.html>
>       +1 similar issue
>    -
>
>    igt@kms_plane_alpha_blend@pipe-b-coverage-vs-premult-vs-constant:
>    - {shard-rkl}: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-rkl-2/igt@kms_plane_alpha_blend@pipe-b-coverage-vs-premult-vs-constant.html>
>       (i915#1849 <https://gitlab.freedesktop.org/drm/intel/issues/1849> /
>       i915#3546 <https://gitlab.freedesktop.org/drm/intel/issues/3546> /
>       i915#4070 <https://gitlab.freedesktop.org/drm/intel/issues/4070> /
>       i915#4098 <https://gitlab.freedesktop.org/drm/intel/issues/4098>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-rkl-6/igt@kms_plane_alpha_blend@pipe-b-coverage-vs-premult-vs-constant.html>
>       +1 similar issue
>    -
>
>    igt@kms_plane_multiple@atomic-pipe-b-tiling-none:
>    - {shard-rkl}: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-rkl-2/igt@kms_plane_multiple@atomic-pipe-b-tiling-none.html>
>       (i915#1849 <https://gitlab.freedesktop.org/drm/intel/issues/1849> /
>       i915#3558 <https://gitlab.freedesktop.org/drm/intel/issues/3558> /
>       i915#4070 <https://gitlab.freedesktop.org/drm/intel/issues/4070>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-rkl-6/igt@kms_plane_multiple@atomic-pipe-b-tiling-none.html>
>       +1 similar issue
>    -
>
>    igt@kms_plane_scaling
>    @planes-upscale-20x20-downscale-factor-0-5@pipe-b-edp-1:
>    - shard-iclb: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-iclb2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b-edp-1.html>
>       (i915#5235 <https://gitlab.freedesktop.org/drm/intel/issues/5235>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-iclb5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b-edp-1.html>
>       +2 similar issues
>    -
>
>    igt@kms_psr@psr2_sprite_plane_move:
>    - shard-iclb: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-iclb8/igt@kms_psr@psr2_sprite_plane_move.html>
>       (fdo#109441 <https://bugs.freedesktop.org/show_bug.cgi?id=109441>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html>
>       +2 similar issues
>    -
>
>    igt@kms_psr@sprite_plane_onoff:
>    - {shard-rkl}: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-rkl-5/igt@kms_psr@sprite_plane_onoff.html>
>       (i915#1072 <https://gitlab.freedesktop.org/drm/intel/issues/1072>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-rkl-6/igt@kms_psr@sprite_plane_onoff.html>
>       +2 similar issues
>    -
>
>    igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
>    - {shard-rkl}: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-rkl-5/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html>
>       (i915#5461 <https://gitlab.freedesktop.org/drm/intel/issues/5461>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-rkl-6/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html>
>    -
>
>    igt@kms_universal_plane@disable-primary-vs-flip-pipe-b:
>    - {shard-rkl}: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-rkl-1/igt@kms_universal_plane@disable-primary-vs-flip-pipe-b.html>
>       (i915#1845 <https://gitlab.freedesktop.org/drm/intel/issues/1845> /
>       i915#4070 <https://gitlab.freedesktop.org/drm/intel/issues/4070> /
>       i915#4098 <https://gitlab.freedesktop.org/drm/intel/issues/4098>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-rkl-6/igt@kms_universal_plane@disable-primary-vs-flip-pipe-b.html>
>    -
>
>    igt@sysfs_heartbeat_interval@precise@vecs0:
>    - {shard-dg1}: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-dg1-19/igt@sysfs_heartbeat_interval@precise@vecs0.html>
>       (i915#1755 <https://gitlab.freedesktop.org/drm/intel/issues/1755>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-dg1-13/igt@sysfs_heartbeat_interval@precise@vecs0.html>
>       +2 similar issues
>
> Warnings
>
>    -
>
>    igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:
>    - shard-iclb: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-iclb3/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html>
>       (i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>) ->
>       SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-iclb2/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html>
>       (i915#2920 <https://gitlab.freedesktop.org/drm/intel/issues/2920>)
>    -
>
>    igt@kms_psr2_sf@overlay-plane-update-continuous-sf:
>    - shard-iclb: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11928/shard-iclb5/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html>
>       (fdo#111068 <https://bugs.freedesktop.org/show_bug.cgi?id=111068> /
>       i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>) ->
>       SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html>
>       (i915#2920 <https://gitlab.freedesktop.org/drm/intel/issues/2920>)
>
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> Build changes
>
>    - CI: CI-20190529 -> None
>    - IGT: IGT_6593 -> IGTPW_7545
>    - Piglit: piglit_4509 -> None
>
> CI-20190529: 20190529
> CI_DRM_11928: 8aa8753730556013fd562e01965e5dd571ae55ea @ git://
> anongit.freedesktop.org/gfx-ci/linux
> IGTPW_7545: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/index.html
> IGT_6593: 6ac554e19b3bb4232877367911e9185e5d35296f @
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://
> anongit.freedesktop.org/piglit
>

--0000000000002648c705e4524852
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Luckily it looks like the failures are unrelated, can i ge=
t a rerun? thanks!</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">On Wed, Jul 20, 2022 at 8:43 PM Patchwork &lt;<a href=3D"=
mailto:patchwork@emeril.freedesktop.org">patchwork@emeril.freedesktop.org</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<u></u>

=20
 =20
 =20
 =20

<div>


<b>Patch Details</b>
<table>
<tbody><tr><td><b>Series:</b></td><td>lib/chamelium: Support MST connectors=
 on reprobe by using connector name</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/106539/" target=3D"_blank">https://patchwork.freedesktop.org/series/10=
6539/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7545/index.html" target=3D"_blank">https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_7545/index.html</a></td></tr>

</tbody></table>


    <h1>CI Bug Log - changes from CI_DRM_11928_full -&gt; IGTPW_7545_full</=
h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_7545_full absolutely need to b=
e<br>
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
>
  introduced in IGTPW_7545_full, please notify your bug team to allow them<=
br>
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7545/index.html" target=3D"_blank">https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_7545/index.html</a></p>
<h2>Participating hosts (13 -&gt; 10)</h2>
<p>Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7545=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_busy@close-race:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11928/shard-apl3/igt@gem_busy@close-race.html" target=3D"_blank">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545=
/shard-apl6/igt@gem_busy@close-race.html" target=3D"_blank">DMESG-FAIL</a><=
/li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11928/shard-kbl4/igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-1.html=
" target=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_7545/shard-kbl4/igt@kms_cursor_crc@cursor-suspend@pipe-a-=
dp-1.html" target=3D"_blank">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_11928_full and IGTPW_7545_=
full:</p>
<h3>New IGT tests (6)</h3>
<ul>
<li>
<p>igt@kms_flip@flip-vs-panning-vs-hang@a-hdmi-a4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [30.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning-vs-hang@d-hdmi-a4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [29.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-with-modifiers-20x20@pipe-a-hdmi-a-4=
:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-with-modifiers-20x20@pipe-b-hdmi-a-4=
:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-with-modifiers-20x20@pipe-c-hdmi-a-4=
:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-with-modifiers-20x20@pipe-d-hdmi-a-4=
:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.40] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7545_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@feature_discovery@psr2:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11928/shard-iclb2/igt@feature_discovery@psr2.html" target=3D"_blank=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7545/shard-iclb4/igt@feature_discovery@psr2.html" target=3D"_blank">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/658" target=
=3D"_blank">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@vcs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11928/shard-kbl6/igt@gem_ctx_isolation@preservation-s3@vcs0.html" t=
arget=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_7545/shard-kbl4/igt@gem_ctx_isolation@preservation-s3@vcs0.h=
tml" target=3D"_blank">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/180" target=3D"_blank">i915#180</a>) +4 similar issu=
es</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@engines-mixed:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7545/shard-snb4/igt@gem_ctx_persistence@engines-mixed.h=
tml" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/intel/issues/1099" target=3D"_blank">i915#109=
9</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@reset-stress:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11928/shard-snb2/igt@gem_eio@reset-stress.html" target=3D"_blank">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_754=
5/shard-snb5/igt@gem_eio@reset-stress.html" target=3D"_blank">TIMEOUT</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3427" target=3D"=
_blank">i915#3427</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-contexts:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11928/shard-iclb1/igt@gem_exec_balancer@parallel-contexts.html" tar=
get=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_7545/shard-iclb5/igt@gem_exec_balancer@parallel-contexts.html"=
 target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/4525" target=3D"_blank">i915#4525</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11928/shard-tglb1/igt@gem_exec_fair@basic-none-share@rcs0.html" tar=
get=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_7545/shard-tglb2/igt@gem_exec_fair@basic-none-share@rcs0.html"=
 target=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/2842" target=3D"_blank">i915#2842</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11928/shard-kbl6/igt@gem_exec_fair@basic-none@vcs1.html" target=3D"=
_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_7545/shard-kbl1/igt@gem_exec_fair@basic-none@vcs1.html" target=3D"_bl=
ank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2=
842" target=3D"_blank">i915#2842</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11928/shard-glk5/igt@gem_exec_fair@basic-pace-share@rcs0.html" targ=
et=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_7545/shard-glk6/igt@gem_exec_fair@basic-pace-share@rcs0.html" t=
arget=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/2842" target=3D"_blank">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7545/shard-kbl1/igt@gem_exec_fair@basic-pace@rcs0.html"=
 target=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/2851" target=3D"_blank">i915#2851</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7545/shard-kbl1/igt@gem_exec_fair@basic-pace@vecs0.html=
" target=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/2842" target=3D"_blank">i915#2842</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@syncobj-backward-timeline-chain-engines:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7545/shard-snb2/igt@gem_exec_fence@syncobj-backward-tim=
eline-chain-engines.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bu=
gs.freedesktop.org/show_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</=
a>) +98 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7545/shard-apl7/igt@gem_huc_copy@huc-copy.html" target=
=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/intel/issues/2190" target=3D"_blank">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7545/shard-kbl4/igt@gem_lmem_swapping@parallel-random-ve=
rify.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.=
org/show_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/4613" target=3D"_blank">i9=
15#4613</a>) +1 similar issue</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7545/shard-apl3/igt@gem_lmem_swapping@parallel-random-ve=
rify.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.=
org/show_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/4613" target=3D"_blank">i9=
15#4613</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7545/shard-tglb5/igt@gem_lmem_swapping@parallel-random-v=
erify.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/4613" target=3D"_blank">i915#4613</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7545/shard-glk2/igt@gem_lmem_swapping@parallel-random-ve=
rify.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.=
org/show_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/4613" target=3D"_blank">i9=
15#4613</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7545/shard-iclb6/igt@gem_lmem_swapping@parallel-random-v=
erify.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/4613" target=3D"_blank">i915#4613</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7545/shard-tglb5/igt@gem_pxp@verify-pxp-key-change-after=
-suspend-resume.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/4270" target=3D"_blank">i915#4270</a>)</p=
>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7545/shard-iclb3/igt@gem_pxp@verify-pxp-key-change-after=
-suspend-resume.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/4270" target=3D"_blank">i915#4270</a>)</p=
>
</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-to-vebox-linear:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7545/shard-iclb3/igt@gem_render_copy@y-tiled-to-vebox-l=
inear.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/768" target=3D"_blank">i915#768</a>)</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@bitmasks:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7545/shard-tglb1/igt@gen7_exec_parse@bitmasks.html" targ=
et=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109289" target=3D"_blank">fdo#109289</a>) +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7545/shard-iclb7/igt@gen7_exec_parse@bitmasks.html" targ=
et=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109289" target=3D"_blank">fdo#109289</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-dpms:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7545/shard-tglb1/igt@i915_pm_dc@dc6-dpms.html" target=3D=
"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/3989" target=3D"_blank">i915#3989</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/454" target=3D"_blank">i915#454</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7545/shard-kbl4/igt@i915_pm_dc@dc6-dpms.html" target=3D"=
_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/454" target=3D"_blank">i915#454</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11928/shard-apl7/igt@i915_pm_dc@dc9-dpms.html" target=3D"_blank">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545=
/shard-apl6/igt@i915_pm_dc@dc9-dpms.html" target=3D"_blank">SKIP</a> (<a hr=
ef=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271" target=3D"_bla=
nk">fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@vcs0:</p>
<ul>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11928/shard-apl6/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html" targe=
t=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_7545/shard-apl8/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html" ta=
rget=3D"_blank">WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/6405" target=3D"_blank">i915#6405</a>)</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11928/shard-glk2/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html" targe=
t=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_7545/shard-glk5/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html" ta=
rget=3D"_blank">WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/6405" target=3D"_blank">i915#6405</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@pc8-residency:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7545/shard-iclb2/igt@i915_pm_rpm@pc8-residency.html" tar=
get=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109293" target=3D"_blank">fdo#109293</a> / <a href=3D"https://bugs.=
freedesktop.org/show_bug.cgi?id=3D109506" target=3D"_blank">fdo#109506</a>)=
</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7545/shard-tglb8/igt@i915_pm_rpm@pc8-residency.html" tar=
get=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109506" target=3D"_blank">fdo#109506</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/intel/issues/2411" target=3D"_blank">i915#2411</a>)</=
p>
</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-known-pci-ids:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7545/shard-tglb1/igt@i915_query@query-topology-known-pci=
-ids.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.=
org/show_bug.cgi?id=3D109303" target=3D"_blank">fdo#109303</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7545/shard-iclb3/igt@i915_query@query-topology-known-pci=
-ids.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.=
org/show_bug.cgi?id=3D109303" target=3D"_blank">fdo#109303</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-unsupported:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7545/shard-tglb3/igt@i915_query@query-topology-unsupport=
ed.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.or=
g/show_bug.cgi?id=3D109302" target=3D"_blank">fdo#109302</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7545/shard-iclb3/igt@i915_query@query-topology-unsupport=
ed.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.or=
g/show_bug.cgi?id=3D109302" target=3D"_blank">fdo#109302</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7545/shard-tglb5/igt@kms_big_fb@4-tiled-64bpp-rotate-27=
0.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/5286" target=3D"_blank">i915#5286</a>) +1 similar issue=
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7545/shard-iclb3/igt@kms_big_fb@4-tiled-max-hw-stride-6=
4bpp-rotate-0-hflip.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/5286" target=3D"_blank">i915#5286</a>=
) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-270:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7545/shard-tglb5/igt@kms_big_fb@linear-64bpp-rotate-270.=
html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D111614" target=3D"_blank">fdo#111614</a>) +1 similar issue=
</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7545/shard-iclb3/igt@kms_big_fb@linear-64bpp-rotate-270.=
html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D110725" target=3D"_blank">fdo#110725</a> / <a href=3D"http=
s://bugs.freedesktop.org/show_bug.cgi?id=3D111614" target=3D"_blank">fdo#11=
1614</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</=
p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7545/shard-tglb3/igt@kms_big_fb@yf-tiled-max-hw-stride-=
32bpp-rotate-0-hflip-async-flip.html" target=3D"_blank">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111615" target=3D"_blank=
">fdo#111615</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-pixel-format-4_tiled_dg2_rc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7545/shard-tglb8/igt@kms_ccs@pipe-a-bad-pixel-format-4_=
tiled_dg2_rc_ccs.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/intel/issues/3689" target=3D"_blank">i915#3689</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6095" target=3D"=
_blank">i915#6095</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7545/shard-apl2/igt@kms_ccs@pipe-a-crc-primary-rotation-=
180-y_tiled_gen12_mc_ccs.html" target=3D"_blank">SKIP</a> (<a href=3D"https=
://bugs.freedesktop.org/show_bug.cgi?id=3D109271" target=3D"_blank">fdo#109=
271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3886" =
target=3D"_blank">i915#3886</a>) +6 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7545/shard-tglb8/igt@kms_ccs@pipe-a-crc-primary-rotation=
-180-y_tiled_gen12_mc_ccs.html" target=3D"_blank">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/3689" target=3D"_blank">i915#36=
89</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3886" t=
arget=3D"_blank">i915#3886</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7545/shard-glk8/igt@kms_ccs@pipe-b-bad-rotation-90-y_til=
ed_gen12_rc_ccs_cc.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bug=
s.freedesktop.org/show_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3886" target=
=3D"_blank">i915#3886</a>) +4 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7545/shard-iclb4/igt@kms_ccs@pipe-b-bad-rotation-90-y_ti=
led_gen12_rc_ccs_cc.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bu=
gs.freedesktop.org/show_bug.cgi?id=3D109278" target=3D"_blank">fdo#109278</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3886" targe=
t=3D"_blank">i915#3886</a>) +4 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-primary-rotation-180-4_tiled_dg2_rc_ccs_cc:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7545/shard-tglb2/igt@kms_ccs@pipe-b-crc-primary-rotatio=
n-180-4_tiled_dg2_rc_ccs_cc.html" target=3D"_blank">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/6095" target=3D"_blank">i915#=
6095</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7545/shard-kbl6/igt@kms_ccs@pipe-c-bad-rotation-90-y_ti=
led_gen12_rc_ccs_cc.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bu=
gs.freedesktop.org/show_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3886" targe=
t=3D"_blank">i915#3886</a>) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-primary-basic-4_tiled_dg2_rc_ccs_cc:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7545/shard-tglb5/igt@kms_ccs@pipe-d-crc-primary-basic-4=
_tiled_dg2_rc_ccs_cc.html" target=3D"_blank">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/3689" target=3D"_blank">i915#3689</a=
>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-red-to-blue:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7545/shard-iclb1/igt@kms_color_chamelium@pipe-a-ctm-red=
-to-blue.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesk=
top.org/show_bug.cgi?id=3D109284" target=3D"_blank">fdo#109284</a> / <a hre=
f=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111827" target=3D"_blan=
k">fdo#111827</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-c-ctm-0-75:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7545/shard-kbl7/igt@kms_color_chamelium@pipe-c-ctm-0-75.=
html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D"http=
s://bugs.freedesktop.org/show_bug.cgi?id=3D111827" target=3D"_blank">fdo#11=
1827</a>) +4 similar issues</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7545/shard-snb4/igt@kms_color_chamelium@pipe-c-ctm-0-75.=
html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D"http=
s://bugs.freedesktop.org/show_bug.cgi?id=3D111827" target=3D"_blank">fdo#11=
1827</a>) +5 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-limited-range:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7545/shard-apl7/igt@kms_color_chamelium@pipe-d-ctm-limit=
ed-range.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesk=
top.org/show_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a> / <a hre=
f=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111827" target=3D"_blan=
k">fdo#111827</a>) +5 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7545/shard-tglb2/igt@kms_color_chamelium@pipe-d-ctm-limi=
ted-range.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedes=
ktop.org/show_bug.cgi?id=3D109284" target=3D"_blank">fdo#109284</a> / <a hr=
ef=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111827" target=3D"_bla=
nk">fdo#111827</a>) +4 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7545/shard-glk3/igt@kms_color_chamelium@pipe-d-ctm-limit=
ed-range.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesk=
top.org/show_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a> / <a hre=
f=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111827" target=3D"_blan=
k">fdo#111827</a>) +4 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7545/shard-iclb8/igt@kms_color_chamelium@pipe-d-ctm-limi=
ted-range.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedes=
ktop.org/show_bug.cgi?id=3D109278" target=3D"_blank">fdo#109278</a> / <a hr=
ef=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109284" target=3D"_bla=
nk">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D111827" target=3D"_blank">fdo#111827</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7545/shard-tglb5/igt@kms_content_protection@dp-mst-type-=
1.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/3116" target=3D"_blank">i915#3116</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/3299" target=3D"_blank">i915#32=
99</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7545/shard-iclb6/igt@kms_content_protection@dp-mst-type-=
1.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/3116" target=3D"_blank">i915#3116</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7545/shard-tglb5/igt@kms_cursor_legacy@2x-cursor-vs-fli=
p-atomic.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesk=
top.org/show_bug.cgi?id=3D109274" target=3D"_blank">fdo#109274</a> / <a hre=
f=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111825" target=3D"_blan=
k">fdo#111825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11928/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transi=
tions.html" target=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_7545/shard-glk3/igt@kms_cursor_legacy@flip-vs-c=
ursor@atomic-transitions.html" target=3D"_blank">FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/intel/issues/2346" target=3D"_blank">i915#234=
6</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@basic-dsc:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7545/shard-iclb7/igt@kms_dsc@basic-dsc.html" target=3D"=
_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/3555" target=3D"_blank">i915#3555</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/3828" target=3D"_blank">i915#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11928/shard-glk3/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a1-=
hdmi-a2.html" target=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_7545/shard-glk8/igt@kms_flip@2x-flip-vs-expir=
ed-vblank@bc-hdmi-a1-hdmi-a2.html" target=3D"_blank">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/intel/issues/79" target=3D"_blank">i915#7=
9</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7545/shard-iclb6/igt@kms_flip@2x-modeset-vs-vblank-race=
-interruptible.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.fr=
eedesktop.org/show_bug.cgi?id=3D109274" target=3D"_blank">fdo#109274</a>) +=
3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7545/shard-tglb3/igt@kms_flip@2x-nonexisting-fb.html" t=
arget=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug=
.cgi?id=3D109274" target=3D"_blank">fdo#109274</a> / <a href=3D"https://bug=
s.freedesktop.org/show_bug.cgi?id=3D111825" target=3D"_blank">fdo#111825</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3637" target=
=3D"_blank">i915#3637</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11928/shard-tglb3/igt@kms_flip@flip-vs-expired-vblank-interruptible=
@a-edp1.html" target=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_7545/shard-tglb3/igt@kms_flip@flip-vs-expired=
-vblank-interruptible@a-edp1.html" target=3D"_blank">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/intel/issues/79" target=3D"_blank">i915#7=
9</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-dp1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11928/shard-apl7/igt@kms_flip@flip-vs-suspend@c-dp1.html" target=3D=
"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_7545/shard-apl8/igt@kms_flip@flip-vs-suspend@c-dp1.html" target=3D"_=
blank">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/180" target=3D"_blank">i915#180</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@p=
ipe-a-valid-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7545/shard-iclb6/igt@kms_flip_scaled_crc@flip-32bpp-yft=
ileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html" target=3D"_blank">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2672" =
target=3D"_blank">i915#2672</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7545/shard-tglb8/igt@kms_flip_scaled_crc@flip-64bpp-4ti=
le-to-16bpp-4tile-downscaling@pipe-a-valid-mode.html" target=3D"_blank">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2672" tar=
get=3D"_blank">i915#2672</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing@pipe-a-valid-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7545/shard-iclb1/igt@kms_flip_scaled_crc@flip-64bpp-yti=
le-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html" target=3D"_bl=
ank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2=
672" target=3D"_blank">i915#2672</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/3555" target=3D"_blank">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7545/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-1p=
-primscrn-shrfb-pgflip-blt.html" target=3D"_blank">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/160" target=3D"_blank">i915#16=
0</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:</=
p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7545/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-2p=
-primscrn-pri-indfb-draw-render.html" target=3D"_blank">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109280" target=3D"_blank=
">fdo#109280</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111825" target=3D"_blank">fdo#111825</a>) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7545/shard-glk3/igt@kms_frontbuffer_tracking@fbcpsr-2p-=
scndscrn-spr-indfb-draw-mmap-wc.html" target=3D"_blank">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271" target=3D"_blank=
">fdo#109271</a>) +50 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7545/shard-kbl6/igt@kms_frontbuffer_tracking@fbcpsr-2p-=
scndscrn-spr-indfb-onoff.html" target=3D"_blank">SKIP</a> (<a href=3D"https=
://bugs.freedesktop.org/show_bug.cgi?id=3D109271" target=3D"_blank">fdo#109=
271</a>) +110 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7545/shard-iclb4/igt@kms_frontbuffer_tracking@psr-2p-pr=
imscrn-pri-indfb-draw-mmap-wc.html" target=3D"_blank">SKIP</a> (<a href=3D"=
https://bugs.freedesktop.org/show_bug.cgi?id=3D109280" target=3D"_blank">fd=
o#109280</a>) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch@pipe-a-dp-1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11928/shard-kbl1/igt@kms_hdr@bpc-switch@pipe-a-dp-1.html" target=3D=
"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_7545/shard-kbl4/igt@kms_hdr@bpc-switch@pipe-a-dp-1.html" target=3D"_=
blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/1188" target=3D"_blank">i915#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7545/shard-apl4/igt@kms_plane_alpha_blend@pipe-a-alpha-=
transparent-fb.html" target=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/265" target=3D"_blank">i915#265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7545/shard-kbl4/igt@kms_plane_alpha_blend@pipe-c-alpha-=
transparent-fb.html" target=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/265" target=3D"_blank">i915#265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@atomic-pipe-d-tiling-none:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7545/shard-iclb2/igt@kms_plane_multiple@atomic-pipe-d-t=
iling-none.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freede=
sktop.org/show_bug.cgi?id=3D109278" target=3D"_blank">fdo#109278</a>) +8 si=
milar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@=
pipe-b-edp-1:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11928/shard-iclb6/igt@kms_plane_scaling@plane-scaler-with-clipping-=
clamping-pixel-formats@pipe-b-edp-1.html" target=3D"_blank">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-iclb3/=
igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pip=
e-b-edp-1.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/5176" target=3D"_blank">i915#5176</a>) +1 simil=
ar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7545/shard-apl4/igt@kms_psr2_sf@cursor-plane-move-conti=
nuous-exceed-fully-sf.html" target=3D"_blank">SKIP</a> (<a href=3D"https://=
bugs.freedesktop.org/show_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/658" targ=
et=3D"_blank">i915#658</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7545/shard-glk1/igt@kms_psr2_su@frontbuffer-xrgb8888.htm=
l" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show=
_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/intel/issues/658" target=3D"_blank">i915#658</a=
>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7545/shard-iclb4/igt@kms_psr2_su@frontbuffer-xrgb8888.ht=
ml" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D109642" target=3D"_blank">fdo#109642</a> / <a href=3D"https:=
//bugs.freedesktop.org/show_bug.cgi?id=3D111068" target=3D"_blank">fdo#1110=
68</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/658" ta=
rget=3D"_blank">i915#658</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7545/shard-kbl7/igt@kms_psr2_su@frontbuffer-xrgb8888.htm=
l" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show=
_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/intel/issues/658" target=3D"_blank">i915#658</a=
>) +2 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7545/shard-tglb3/igt@kms_psr2_su@frontbuffer-xrgb8888.ht=
ml" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/1911" target=3D"_blank">i915#1911</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11928/shard-iclb2/igt@kms_psr2_su@page_flip-xrgb8888.html" target=
=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_7545/shard-iclb6/igt@kms_psr2_su@page_flip-xrgb8888.html" target=
=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109642" target=3D"_blank">fdo#109642</a> / <a href=3D"https://bugs.fre=
edesktop.org/show_bug.cgi?id=3D111068" target=3D"_blank">fdo#111068</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/658" target=3D"_b=
lank">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_page_flip:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7545/shard-apl1/igt@kms_psr@primary_page_flip.html" tar=
get=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109271" target=3D"_blank">fdo#109271</a>) +91 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_blt:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11928/shard-iclb2/igt@kms_psr@psr2_sprite_blt.html" target=3D"_blan=
k">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7545/shard-iclb5/igt@kms_psr@psr2_sprite_blt.html" target=3D"_blank">SKIP<=
/a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441" targ=
et=3D"_blank">fdo#109441</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11928/shard-iclb4/igt@kms_psr_stress_test@flip-primary-invalidate-o=
verlay.html" target=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_7545/shard-iclb8/igt@kms_psr_stress_test@flip-=
primary-invalidate-overlay.html" target=3D"_blank">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/5519" target=3D"_blank">i915#5=
519</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7545/shard-tglb8/igt@kms_rotation_crc@primary-yf-tiled-=
reflect-x-180.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.fre=
edesktop.org/show_bug.cgi?id=3D111615" target=3D"_blank">fdo#111615</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5289" target=3D"_=
blank">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7545/shard-apl7/igt@kms_writeback@writeback-check-output=
.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/2437" target=3D"_blank">i915#2=
437</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7545/shard-tglb1/igt@kms_writeback@writeback-check-outpu=
t.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/2437" target=3D"_blank">i915#2437</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7545/shard-glk1/igt@kms_writeback@writeback-check-output=
.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/2437" target=3D"_blank">i915#2=
437</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7545/shard-iclb4/igt@kms_writeback@writeback-check-outpu=
t.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/2437" target=3D"_blank">i915#2437</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7545/shard-kbl1/igt@kms_writeback@writeback-pixel-forma=
ts.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.or=
g/show_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/intel/issues/2437" target=3D"_blank">i915=
#2437</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-b-source-outp-complete:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7545/shard-iclb8/igt@nouveau_crc@pipe-b-source-outp-comp=
lete.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/2530" target=3D"_blank">i915#2530</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7545/shard-tglb2/igt@nouveau_crc@pipe-b-source-outp-comp=
lete.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/2530" target=3D"_blank">i915#2530</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@i915_nv_import_twice_check_flink_name:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7545/shard-tglb2/igt@prime_nv_api@i915_nv_import_twice_c=
heck_flink_name.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.f=
reedesktop.org/show_bug.cgi?id=3D109291" target=3D"_blank">fdo#109291</a>) =
+1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7545/shard-iclb6/igt@prime_nv_api@i915_nv_import_twice_c=
heck_flink_name.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.f=
reedesktop.org/show_bug.cgi?id=3D109291" target=3D"_blank">fdo#109291</a>) =
+1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@coherency-gtt:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7545/shard-iclb5/igt@prime_vgem@coherency-gtt.html" targ=
et=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109292" target=3D"_blank">fdo#109292</a> / <a href=3D"https://bugs.f=
reedesktop.org/show_bug.cgi?id=3D109295" target=3D"_blank">fdo#109295</a>)<=
/p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7545/shard-tglb1/igt@prime_vgem@coherency-gtt.html" targ=
et=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109295" target=3D"_blank">fdo#109295</a> / <a href=3D"https://bugs.f=
reedesktop.org/show_bug.cgi?id=3D111656" target=3D"_blank">fdo#111656</a>)<=
/p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@busy:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7545/shard-tglb5/igt@sysfs_clients@busy.html" target=3D"=
_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/2994" target=3D"_blank">i915#2994</a>) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7545/shard-glk1/igt@sysfs_clients@busy.html" target=3D"_=
blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109271" target=3D"_blank">fdo#109271</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/2994" target=3D"_blank">i915#2994</a>) +1 simila=
r issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7545/shard-iclb7/igt@sysfs_clients@busy.html" target=3D"=
_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/2994" target=3D"_blank">i915#2994</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@recycle-many:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7545/shard-apl7/igt@sysfs_clients@recycle-many.html" ta=
rget=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/2994" target=3D"_blank">i915#2994</a>) =
+2 similar issues</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@split-10:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7545/shard-kbl7/igt@sysfs_clients@split-10.html" target=
=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/intel/issues/2994" target=3D"_blank">i915#2994</a>) +2 s=
imilar issues</li>
</ul>
</li>
<li>
<p>igt@tools_test@sysfs_l3_parity:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7545/shard-tglb5/igt@tools_test@sysfs_l3_parity.html" ta=
rget=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D109307" target=3D"_blank">fdo#109307</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7545/shard-iclb2/igt@tools_test@sysfs_l3_parity.html" ta=
rget=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D109307" target=3D"_blank">fdo#109307</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@pan:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11928/shard-rkl-2/igt@fbdev@pan.html" target=3D"_blank">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2582" target=3D"_=
blank">i915#2582</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_7545/shard-rkl-6/igt@fbdev@pan.html" target=3D"_blank">PASS</a><=
/li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@smoketest:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11928/shard-tglb2/igt@gem_ctx_persistence@smoketest.html" target=3D=
"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/5099" target=3D"_blank">i915#5099</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_7545/shard-tglb3/igt@gem_ctx_persistence@smo=
ketest.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-in-fence:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11928/shard-iclb6/igt@gem_exec_balancer@parallel-keep-in-fence.html=
" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/4525" target=3D"_blank">i915#4525</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-iclb4/igt@gem_exec_bal=
ancer@parallel-keep-in-fence.html" target=3D"_blank">PASS</a> +1 similar is=
sue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11928/shard-kbl7/igt@gem_exec_fair@basic-pace-solo@rcs0.html" targe=
t=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/2842" target=3D"_blank">i915#2842</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-kbl4/igt@gem_exec_fair@basic-=
pace-solo@rcs0.html" target=3D"_blank">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11928/shard-glk2/igt@gem_exec_fair@basic-pace@rcs0.html" target=3D"=
_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/2842" target=3D"_blank">i915#2842</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_7545/shard-glk5/igt@gem_exec_fair@basic-pace@=
rcs0.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-wc-active:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11928/shard-rkl-2/igt@gem_exec_reloc@basic-gtt-wc-active.html" targ=
et=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/3281" target=3D"_blank">i915#3281</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-rkl-5/igt@gem_exec_reloc@bas=
ic-gtt-wc-active.html" target=3D"_blank">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_readwrite@read-write:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11928/shard-rkl-2/igt@gem_readwrite@read-write.html" target=3D"_bla=
nk">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/32=
82" target=3D"_blank">i915#3282</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_7545/shard-rkl-5/igt@gem_readwrite@read-write.htm=
l" target=3D"_blank">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-fd:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11928/shard-kbl7/igt@gem_workarounds@suspend-resume-fd.html" target=
=3D"_blank">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/180" target=3D"_blank">i915#180</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-kbl6/igt@gem_workarounds@s=
uspend-resume-fd.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-param:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11928/shard-rkl-1/igt@gen9_exec_parse@bb-start-param.html" target=
=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2527" target=3D"_blank">i915#2527</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-rkl-5/igt@gen9_exec_parse@bb-s=
tart-param.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_backlight@bad-brightness:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11928/shard-rkl-1/igt@i915_pm_backlight@bad-brightness.html" target=
=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/3012" target=3D"_blank">i915#3012</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-rkl-6/igt@i915_pm_backlight@ba=
d-brightness.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:</p>
<ul>
<li>{shard-dg1}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11928/shard-dg1-15/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html" =
target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/1937" target=3D"_blank">i915#1937</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-dg1-18/igt@i915_pm_lpsp@=
kms-lpsp@kms-lpsp-hdmi-a.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@rcs0:</p>
<ul>
<li>{shard-tglu}:       <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11928/shard-tglu-6/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html" ta=
rget=3D"_blank">WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/2681" target=3D"_blank">i915#2681</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-tglu-6/igt@i915_pm_rc6_res=
idency@rc6-idle@rcs0.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@fences-dpms:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11928/shard-rkl-1/igt@i915_pm_rpm@fences-dpms.html" target=3D"_blan=
k">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/184=
9" target=3D"_blank">i915#1849</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7545/shard-rkl-6/igt@i915_pm_rpm@fences-dpms.html"=
 target=3D"_blank">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-lpsp:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11928/shard-rkl-1/igt@i915_pm_rpm@modeset-lpsp.html" target=3D"_bla=
nk">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/13=
97" target=3D"_blank">i915#1397</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_7545/shard-rkl-6/igt@i915_pm_rpm@modeset-lpsp.htm=
l" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@migrate:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11928/shard-iclb5/igt@i915_selftest@live@migrate.html" target=3D"_b=
lank">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2867" target=3D"_blank">i915#2867</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-iclb1/igt@i915_selftest@live@m=
igrate.html" target=3D"_blank">PASS</a> +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11928/shard-snb7/igt@i915_suspend@basic-s3-without-i915.html" targe=
t=3D"_blank">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/4528" target=3D"_blank">i915#4528</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-snb4/igt@i915_suspend@b=
asic-s3-without-i915.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11928/shard-glk6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomi=
c.html" target=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/72" target=3D"_blank">i915#72</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-glk5/igt@kms_cursor_=
legacy@2x-long-flip-vs-cursor-atomic.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11928/shard-rkl-2/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-un=
tiled.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop=
.org/show_bug.cgi?id=3D111314" target=3D"_blank">fdo#111314</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/4098" target=3D"_blank"=
>i915#4098</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/4369" target=3D"_blank">i915#4369</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_7545/shard-rkl-6/igt@kms_draw_crc@draw-method-=
xrgb8888-mmap-gtt-untiled.html" target=3D"_blank">PASS</a> +5 similar issue=
s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@b-dp1:</p>
<ul>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11928/shard-apl8/igt@kms_flip@plain-flip-fb-recreate-interruptible@b=
-dp1.html" target=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/2122" target=3D"_blank">i915#2122</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-apl4/igt@kms_=
flip@plain-flip-fb-recreate-interruptible@b-dp1.html" target=3D"_blank">PAS=
S</a></p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11928/shard-kbl7/igt@kms_flip@plain-flip-fb-recreate-interruptible@b=
-dp1.html" target=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/2122" target=3D"_blank">i915#2122</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-kbl1/igt@kms_=
flip@plain-flip-fb-recreate-interruptible@b-dp1.html" target=3D"_blank">PAS=
S</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11928/shard-rkl-1/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-m=
map-gtt.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/1849" target=3D"_blank">i915#1849</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/4098" target=3D"_blank"=
>i915#4098</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_7545/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-=
gtt.html" target=3D"_blank">PASS</a> +13 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@bad-source:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11928/shard-rkl-1/igt@kms_pipe_crc_basic@bad-source.html" target=3D=
"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/1845" target=3D"_blank">i915#1845</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/4098" target=3D"_blank">i915#4098</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-rkl-6/igt=
@kms_pipe_crc_basic@bad-source.html" target=3D"_blank">PASS</a> +23 similar=
 issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format@pipe-a-planes:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11928/shard-rkl-1/igt@kms_plane@pixel-format@pipe-a-planes.html" ta=
rget=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/3558" target=3D"_blank">i915#3558</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-rkl-6/igt@kms_plane@pixel-=
format@pipe-a-planes.html" target=3D"_blank">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-coverage-vs-premult-vs-constant:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11928/shard-rkl-2/igt@kms_plane_alpha_blend@pipe-b-coverage-vs-prem=
ult-vs-constant.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/1849" target=3D"_blank">i915#1849</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3546" target=3D"_=
blank">i915#3546</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/4070" target=3D"_blank">i915#4070</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/4098" target=3D"_blank">i915#4098</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-rkl-6=
/igt@kms_plane_alpha_blend@pipe-b-coverage-vs-premult-vs-constant.html" tar=
get=3D"_blank">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@atomic-pipe-b-tiling-none:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11928/shard-rkl-2/igt@kms_plane_multiple@atomic-pipe-b-tiling-none.=
html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/1849" target=3D"_blank">i915#1849</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/3558" target=3D"_blank">i915#3558=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4070" tar=
get=3D"_blank">i915#4070</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7545/shard-rkl-6/igt@kms_plane_multiple@atomic-pipe-b-ti=
ling-none.html" target=3D"_blank">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b-e=
dp-1:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11928/shard-iclb2/igt@kms_plane_scaling@planes-upscale-20x20-downsc=
ale-factor-0-5@pipe-b-edp-1.html" target=3D"_blank">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/5235" target=3D"_blank">i915#=
5235</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
545/shard-iclb5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor=
-0-5@pipe-b-edp-1.html" target=3D"_blank">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_move:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11928/shard-iclb8/igt@kms_psr@psr2_sprite_plane_move.html" target=
=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109441" target=3D"_blank">fdo#109441</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-iclb2/igt@kms_psr@psr2_sprit=
e_plane_move.html" target=3D"_blank">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@sprite_plane_onoff:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11928/shard-rkl-5/igt@kms_psr@sprite_plane_onoff.html" target=3D"_b=
lank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
1072" target=3D"_blank">i915#1072</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_7545/shard-rkl-6/igt@kms_psr@sprite_plane_onoff=
.html" target=3D"_blank">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11928/shard-rkl-5/igt@kms_psr_stress_test@flip-primary-invalidate-o=
verlay.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/5461" target=3D"_blank">i915#5461</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-rkl-6/igt@k=
ms_psr_stress_test@flip-primary-invalidate-overlay.html" target=3D"_blank">=
PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@disable-primary-vs-flip-pipe-b:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11928/shard-rkl-1/igt@kms_universal_plane@disable-primary-vs-flip-p=
ipe-b.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/1845" target=3D"_blank">i915#1845</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/4070" target=3D"_blank">i91=
5#4070</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/409=
8" target=3D"_blank">i915#4098</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7545/shard-rkl-6/igt@kms_universal_plane@disable-p=
rimary-vs-flip-pipe-b.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@sysfs_heartbeat_interval@precise@vecs0:</p>
<ul>
<li>{shard-dg1}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11928/shard-dg1-19/igt@sysfs_heartbeat_interval@precise@vecs0.html"=
 target=3D"_blank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/1755" target=3D"_blank">i915#1755</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-dg1-13/igt@sysfs_heartb=
eat_interval@precise@vecs0.html" target=3D"_blank">PASS</a> +2 similar issu=
es</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11928/shard-iclb3/igt@kms_psr2_sf@cursor-plane-move-continuous-exce=
ed-sf.html" target=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/658" target=3D"_blank">i915#658</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7545/shard-iclb2/igt@kms=
_psr2_sf@cursor-plane-move-continuous-exceed-sf.html" target=3D"_blank">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2920" tar=
get=3D"_blank">i915#2920</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11928/shard-iclb5/igt@kms_psr2_sf@overlay-plane-update-continuous-s=
f.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org=
/show_bug.cgi?id=3D111068" target=3D"_blank">fdo#111068</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/658" target=3D"_blank">i915#6=
58</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_754=
5/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html" targ=
et=3D"_blank">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/2920" target=3D"_blank">i915#2920</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br>
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6593 -&gt; IGTPW_7545</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br>
  CI_DRM_11928: 8aa8753730556013fd562e01965e5dd571ae55ea @ git://<a href=3D=
"http://anongit.freedesktop.org/gfx-ci/linux" target=3D"_blank">anongit.fre=
edesktop.org/gfx-ci/linux</a><br>
  IGTPW_7545: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_754=
5/index.html" target=3D"_blank">https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_7545/index.html</a><br>
  IGT_6593: 6ac554e19b3bb4232877367911e9185e5d35296f @ <a href=3D"https://g=
itlab.freedesktop.org/drm/igt-gpu-tools.git" target=3D"_blank">https://gitl=
ab.freedesktop.org/drm/igt-gpu-tools.git</a><br>
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://<a href=3D"=
http://anongit.freedesktop.org/piglit" target=3D"_blank">anongit.freedeskto=
p.org/piglit</a></p>

</div>

</blockquote></div>

--0000000000002648c705e4524852--
