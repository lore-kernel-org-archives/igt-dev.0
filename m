Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C7FA10E1D9
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Mar 2023 09:33:59 +0000 (UTC)
Message-ID: <fa901d87-21a7-9b2f-7b02-f14571b84baf@intel.com>
Date: Mon, 6 Mar 2023 10:33:56 +0100
Content-Language: en-US
To: <igt-dev@lists.freedesktop.org>
References: <20230301120905.1019314-1-karolina.stolarek@intel.com>
 <167808872422.4160.4573498019695348578@emeril.freedesktop.org>
From: Karolina Stolarek <karolina.stolarek@intel.com>
In-Reply-To: <167808872422.4160.4573498019695348578@emeril.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?gem=5Fexercise=5Fblt=3A_Don=27t_allow_hangs?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Sai Nandan Yedireswarapu <saix.nandan.yedireswarapu@intel.com>, "Vudum,
 Lakshminarayana" <lakshminarayana.vudum@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 6.03.2023 08:45, Patchwork wrote:
> *Patch Details*
> *Series:*	tests/gem_exercise_blt: Don't allow hangs
> *URL:*	https://patchwork.freedesktop.org/series/114513/ 
> <https://patchwork.freedesktop.org/series/114513/>
> *State:*	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8545/index.html 
> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8545/index.html>
> 
> 
>   CI Bug Log - changes from CI_DRM_12796_full -> IGTPW_8545_full
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with IGTPW_8545_full absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_8545_full, please notify your bug team to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8545/index.html
> 
> 
>     Participating hosts (21 -> 20)
> 
> Additional (1): shard-dg1
> Missing (2): shard-dg2-2 shard-dg2-4
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in 
> IGTPW_8545_full:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   * igt@i915_pm_rpm@modeset-non-lpsp-stress:
>       o shard-apl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12796/shard-apl1/igt@i915_pm_rpm@modeset-non-lpsp-stress.html> -> TIMEOUT <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8545/shard-apl1/igt@i915_pm_rpm@modeset-non-lpsp-stress.html>
> 

Unrelated to my change.

Thanks,
Karolina

> 
>         Suppressed
> 
> The following results come from untrusted machines, tests, or statuses.
> They do not affect the overall result.
> 
>   *
> 
>     igt@gem_create@create-ext-cpu-access-big:
> 
>       o {shard-dg2-6}: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8545/shard-dg2-6/igt@gem_create@create-ext-cpu-access-big.html>
>   *
> 
>     igt@kms_async_flips@crc@pipe-b-dp-2:
> 
>       o {shard-dg2-12}: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8545/shard-dg2-12/igt@kms_async_flips@crc@pipe-b-dp-2.html> +3 similar issues
>   *
> 
>     igt@kms_content_protection@legacy@pipe-a-dp-4:
> 
>       o {shard-dg2-11}: NOTRUN -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8545/shard-dg2-11/igt@kms_content_protection@legacy@pipe-a-dp-4.html> +1 similar issue
>   *
> 
>     igt@kms_flip@2x-dpms-vs-vblank-race@ab-dp1-dp3:
> 
>       o {shard-dg2-11}: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8545/shard-dg2-11/igt@kms_flip@2x-dpms-vs-vblank-race@ab-dp1-dp3.html> +13 similar issues
>   *
> 
>     igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a3:
> 
>       o {shard-dg2-1}: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12796/shard-dg2-1/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a3.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8545/shard-dg2-1/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a3.html>
> 
> 
>     New tests
> 
> New tests have been introduced between CI_DRM_12796_full and 
> IGTPW_8545_full:
> 
> 
>       New IGT tests (66)
> 
>   *
> 
>     igt@kms_cursor_crc@cursor-alpha-transparent@pipe-d-dp-4:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.0] s
>   *
> 
>     igt@kms_cursor_crc@cursor-onscreen-64x21@pipe-d-dp-4:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.0] s
>   *
> 
>     igt@kms_cursor_edge_walk@256x256-right-edge@pipe-a-dp-2:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.0] s
>   *
> 
>     igt@kms_cursor_edge_walk@256x256-right-edge@pipe-d-dp-2:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.0] s
>   *
> 
>     igt@kms_flip@2x-dpms-vs-vblank-race@ab-dp2-dp3:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.0] s
>   *
> 
>     igt@kms_flip@2x-dpms-vs-vblank-race@ab-dp2-dp4:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.0] s
>   *
> 
>     igt@kms_flip@2x-dpms-vs-vblank-race@ab-dp3-dp4:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.0] s
>   *
> 
>     igt@kms_flip@2x-dpms-vs-vblank-race@ac-dp2-dp3:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.0] s
>   *
> 
>     igt@kms_flip@2x-dpms-vs-vblank-race@ac-dp2-dp4:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.0] s
>   *
> 
>     igt@kms_flip@2x-dpms-vs-vblank-race@ac-dp3-dp4:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.0] s
>   *
> 
>     igt@kms_flip@2x-dpms-vs-vblank-race@ad-dp2-dp3:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.0] s
>   *
> 
>     igt@kms_flip@2x-dpms-vs-vblank-race@ad-dp2-dp4:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.0] s
>   *
> 
>     igt@kms_flip@2x-dpms-vs-vblank-race@ad-dp3-dp4:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.0] s
>   *
> 
>     igt@kms_flip@2x-dpms-vs-vblank-race@bc-dp2-dp3:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.0] s
>   *
> 
>     igt@kms_flip@2x-dpms-vs-vblank-race@bc-dp2-dp4:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.0] s
>   *
> 
>     igt@kms_flip@2x-dpms-vs-vblank-race@bc-dp3-dp4:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.0] s
>   *
> 
>     igt@kms_flip@2x-dpms-vs-vblank-race@bd-dp2-dp3:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.0] s
>   *
> 
>     igt@kms_flip@2x-dpms-vs-vblank-race@bd-dp2-dp4:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.0] s
>   *
> 
>     igt@kms_flip@2x-dpms-vs-vblank-race@bd-dp3-dp4:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.0] s
>   *
> 
>     igt@kms_flip@2x-dpms-vs-vblank-race@cd-dp2-dp3:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.0] s
>   *
> 
>     igt@kms_flip@2x-dpms-vs-vblank-race@cd-dp2-dp4:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.0] s
>   *
> 
>     igt@kms_flip@2x-dpms-vs-vblank-race@cd-dp3-dp4:
> 
>       o Statuses : 1 dmesg-warn(s)
>       o Exec time: [0.0] s
>   *
> 
>     igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ab-dp2-dp3:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.0] s
>   *
> 
>     igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ab-dp2-dp4:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.0] s
>   *
> 
>     igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ab-dp3-dp4:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.0] s
>   *
> 
>     igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ac-dp2-dp3:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.0] s
>   *
> 
>     igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ac-dp2-dp4:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.0] s
>   *
> 
>     igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ac-dp3-dp4:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.0] s
>   *
> 
>     igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ad-dp2-dp3:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.0] s
>   *
> 
>     igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ad-dp2-dp4:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.0] s
>   *
> 
>     igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ad-dp3-dp4:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.0] s
>   *
> 
>     igt@kms_flip@2x-flip-vs-blocking-wf-vblank@bc-dp2-dp3:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.0] s
>   *
> 
>     igt@kms_flip@2x-flip-vs-blocking-wf-vblank@bc-dp2-dp4:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.0] s
>   *
> 
>     igt@kms_flip@2x-flip-vs-blocking-wf-vblank@bc-dp3-dp4:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.0] s
>   *
> 
>     igt@kms_flip@2x-flip-vs-blocking-wf-vblank@bd-dp2-dp3:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.0] s
>   *
> 
>     igt@kms_flip@2x-flip-vs-blocking-wf-vblank@bd-dp2-dp4:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.0] s
>   *
> 
>     igt@kms_flip@2x-flip-vs-blocking-wf-vblank@bd-dp3-dp4:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.0] s
>   *
> 
>     igt@kms_flip@2x-flip-vs-blocking-wf-vblank@cd-dp2-dp3:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.0] s
>   *
> 
>     igt@kms_flip@2x-flip-vs-blocking-wf-vblank@cd-dp2-dp4:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.0] s
>   *
> 
>     igt@kms_flip@2x-flip-vs-blocking-wf-vblank@cd-dp3-dp4:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.0] s
>   *
> 
>     igt@kms_flip@2x-plain-flip@ab-dp2-dp3:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.0] s
>   *
> 
>     igt@kms_flip@2x-plain-flip@ab-dp2-dp4:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.0] s
>   *
> 
>     igt@kms_flip@2x-plain-flip@ab-dp3-dp4:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.0] s
>   *
> 
>     igt@kms_flip@2x-plain-flip@ac-dp2-dp3:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.0] s
>   *
> 
>     igt@kms_flip@2x-plain-flip@ac-dp2-dp4:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.0] s
>   *
> 
>     igt@kms_flip@2x-plain-flip@ac-dp3-dp4:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.0] s
>   *
> 
>     igt@kms_flip@2x-plain-flip@ad-dp2-dp3:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.0] s
>   *
> 
>     igt@kms_flip@2x-plain-flip@ad-dp2-dp4:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.0] s
>   *
> 
>     igt@kms_flip@2x-plain-flip@ad-dp3-dp4:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.0] s
>   *
> 
>     igt@kms_flip@2x-plain-flip@bc-dp2-dp3:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.0] s
>   *
> 
>     igt@kms_flip@2x-plain-flip@bc-dp2-dp4:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.0] s
>   *
> 
>     igt@kms_flip@2x-plain-flip@bc-dp3-dp4:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.0] s
>   *
> 
>     igt@kms_flip@2x-plain-flip@bd-dp2-dp3:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.0] s
>   *
> 
>     igt@kms_flip@2x-plain-flip@bd-dp2-dp4:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.0] s
>   *
> 
>     igt@kms_flip@2x-plain-flip@bd-dp3-dp4:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.0] s
>   *
> 
>     igt@kms_flip@2x-plain-flip@cd-dp2-dp3:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.0] s
>   *
> 
>     igt@kms_flip@2x-plain-flip@cd-dp2-dp4:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.0] s
>   *
> 
>     igt@kms_flip@2x-plain-flip@cd-dp3-dp4:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.0] s
>   *
> 
>     igt@kms_flip@modeset-vs-vblank-race-interruptible@d-dp4:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.0] s
>   *
> 
>     igt@kms_plane_lowres@tiling-4@pipe-a-hdmi-a-1:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.0] s
>   *
> 
>     igt@kms_plane_lowres@tiling-4@pipe-b-hdmi-a-1:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.0] s
>   *
> 
>     igt@kms_plane_lowres@tiling-4@pipe-c-hdmi-a-1:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.0] s
>   *
> 
>     igt@kms_plane_lowres@tiling-4@pipe-d-hdmi-a-1:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.0] s
>   *
> 
>     igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-a-dp-2:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.0] s
>   *
> 
>     igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-c-dp-2:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.0] s
>   *
> 
>     igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-d-dp-2:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.0] s
> 
> 
>     Known issues
> 
> Here are the changes found in IGTPW_8545_full that come from known issues:
> 
> 
>       IGT changes
> 
> 
>         Issues hit
> 
>   *
> 
>     igt@api_intel_bb@crc32:
> 
>       o shard-tglu-10: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8545/shard-tglu-10/igt@api_intel_bb@crc32.html> (i915#6230 <https://gitlab.freedesktop.org/drm/intel/issues/6230>)
>   *
> 
>     igt@gem_ccs@block-copy-compressed:
> 
>       o shard-tglu-10: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8545/shard-tglu-10/igt@gem_ccs@block-copy-compressed.html> (i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555> / i915#5325 <https://gitlab.freedesktop.org/drm/intel/issues/5325>)
>   *
> 
>     igt@gem_create@create-ext-cpu-access-sanity-check:
> 
>       o shard-tglu-10: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8545/shard-tglu-10/igt@gem_create@create-ext-cpu-access-sanity-check.html> (i915#6335 <https://gitlab.freedesktop.org/drm/intel/issues/6335>) +1 similar issue
>   *
> 
>     igt@gem_ctx_persistence@engines-mixed-process:
> 
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8545/shard-snb4/igt@gem_ctx_persistence@engines-mixed-process.html> (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> / i915#1099 <https://gitlab.freedesktop.org/drm/intel/issues/1099>) +4 similar issues
>   *
> 
>     igt@gem_exec_capture@capture-recoverable:
> 
>       o shard-tglu-10: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8545/shard-tglu-10/igt@gem_exec_capture@capture-recoverable.html> (i915#6344 <https://gitlab.freedesktop.org/drm/intel/issues/6344>)
>   *
> 
>     igt@gem_exec_fair@basic-none-solo@rcs0:
> 
>       o shard-tglu-10: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8545/shard-tglu-10/igt@gem_exec_fair@basic-none-solo@rcs0.html> (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>) +1 similar issue
>   *
> 
>     igt@gem_exec_fair@basic-pace-share@rcs0:
> 
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12796/shard-glk8/igt@gem_exec_fair@basic-pace-share@rcs0.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8545/shard-glk7/igt@gem_exec_fair@basic-pace-share@rcs0.html> (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
>   *
> 
>     igt@gem_exec_fair@basic-pace-solo@rcs0:
> 
>       o shard-tglu-9: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8545/shard-tglu-9/igt@gem_exec_fair@basic-pace-solo@rcs0.html> (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
>   *
> 
>     igt@gem_exec_params@rsvd2-dirt:
> 
>       o shard-tglu-10: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8545/shard-tglu-10/igt@gem_exec_params@rsvd2-dirt.html> (fdo#109283 <https://bugs.freedesktop.org/show_bug.cgi?id=109283>)
>   *
> 
>     igt@gem_exec_params@secure-non-root:
> 
>       o shard-tglu-10: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8545/shard-tglu-10/igt@gem_exec_params@secure-non-root.html> (fdo#112283 <https://bugs.freedesktop.org/show_bug.cgi?id=112283>)
>   *
> 
>     igt@gem_exec_schedule@thriceslice:
> 
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8545/shard-snb4/igt@gem_exec_schedule@thriceslice.html> (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +452 similar issues
>   *
> 
>     igt@gem_lmem_swapping@parallel-random:
> 
>       o shard-tglu-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8545/shard-tglu-9/igt@gem_lmem_swapping@parallel-random.html> (i915#4613 <https://gitlab.freedesktop.org/drm/intel/issues/4613>)
>   *
> 
>     igt@gem_lmem_swapping@verify-random:
> 
>       o shard-tglu-10: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8545/shard-tglu-10/igt@gem_lmem_swapping@verify-random.html> (i915#4613 <https://gitlab.freedesktop.org/drm/intel/issues/4613>)
>   *
> 
>     igt@gem_pwrite@basic-exhaustion:
> 
>       o shard-snb: NOTRUN -> WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8545/shard-snb4/igt@gem_pwrite@basic-exhaustion.html> (i915#2658 <https://gitlab.freedesktop.org/drm/intel/issues/2658>)
>   *
> 
>     igt@gem_pxp@create-regular-context-1:
> 
>       o shard-tglu-10: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8545/shard-tglu-10/igt@gem_pxp@create-regular-context-1.html> (i915#4270 <https://gitlab.freedesktop.org/drm/intel/issues/4270>) +4 similar issues
>   *
> 
>     igt@gem_pxp@protected-raw-src-copy-not-readible:
> 
>       o shard-tglu-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8545/shard-tglu-9/igt@gem_pxp@protected-raw-src-copy-not-readible.html> (i915#4270 <https://gitlab.freedesktop.org/drm/intel/issues/4270>)
>   *
> 
>     igt@gem_userptr_blits@invalid-mmap-offset-unsync:
> 
>       o shard-tglu-10: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8545/shard-tglu-10/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html> (i915#3297 <https://gitlab.freedesktop.org/drm/intel/issues/3297>) +2 similar issues
>   *
> 
>     igt@gen7_exec_parse@basic-offset:
> 
>       o shard-tglu-10: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8545/shard-tglu-10/igt@gen7_exec_parse@basic-offset.html> (fdo#109289 <https://bugs.freedesktop.org/show_bug.cgi?id=109289>) +1 similar issue
>   *
> 
>     igt@gen9_exec_parse@allowed-single:
> 
>       o shard-apl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12796/shard-apl4/igt@gen9_exec_parse@allowed-single.html> -> ABORT <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8545/shard-apl6/igt@gen9_exec_parse@allowed-single.html> (i915#5566 <https://gitlab.freedesktop.org/drm/intel/issues/5566>)
>   *
> 
>     igt@gen9_exec_parse@bb-chained:
> 
>       o shard-tglu-10: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8545/shard-tglu-10/igt@gen9_exec_parse@bb-chained.html> (i915#2527 <https://gitlab.freedesktop.org/drm/intel/issues/2527> / i915#2856 <https://gitlab.freedesktop.org/drm/intel/issues/2856>) +5 similar issues
>   *
> 
>     igt@i915_hwmon@hwmon-read:
> 
>       o shard-tglu-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8545/shard-tglu-9/igt@i915_hwmon@hwmon-read.html> (i915#7707 <https://gitlab.freedesktop.org/drm/intel/issues/7707>)
>   *
> 
>     igt@i915_pm_backlight@basic-brightness:
> 
>       o shard-tglu-10: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8545/shard-tglu-10/igt@i915_pm_backlight@basic-brightness.html> (i915#7561 <https://gitlab.freedesktop.org/drm/intel/issues/7561>)
>   *
> 
>     igt@i915_pm_dc@dc9-dpms:
> 
>       o shard-tglu-10: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8545/shard-tglu-10/igt@i915_pm_dc@dc9-dpms.html> (i915#4281 <https://gitlab.freedesktop.org/drm/intel/issues/4281>)
>   *
> 
>     igt@i915_pm_rpm@drm-resources-equal:
> 
>       o shard-tglu-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8545/shard-tglu-9/igt@i915_pm_rpm@drm-resources-equal.html> (i915#3547 <https://gitlab.freedesktop.org/drm/intel/issues/3547>)
>   *
> 
>     igt@i915_query@hwconfig_table:
> 
>       o shard-tglu-10: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8545/shard-tglu-10/igt@i915_query@hwconfig_table.html> (i915#6245 <https://gitlab.freedesktop.org/drm/intel/issues/6245>)
>   *
> 
>     igt@kms_big_fb@4-tiled-16bpp-rotate-270:
> 
>       o shard-tglu-10: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8545/shard-tglu-10/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html> (i915#5286 <https://gitlab.freedesktop.org/drm/intel/issues/5286>) +5 similar issues
>   *
> 
>     igt@kms_big_fb@x-tiled-16bpp-rotate-270:
> 
>       o shard-tglu-10: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8545/shard-tglu-10/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html> (fdo#111614 <https://bugs.freedesktop.org/show_bug.cgi?id=111614>) +4 similar issues
>   *
> 
>     igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
> 
>       o shard-tglu-10: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8545/shard-tglu-10/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html> (fdo#111615 <https://bugs.freedesktop.org/show_bug.cgi?id=111615>) +5 similar issues
>   *
> 
>     igt@kms_big_joiner@2x-modeset:
> 
>       o shard-tglu-10: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8545/shard-tglu-10/igt@kms_big_joiner@2x-modeset.html> (i915#2705 <https://gitlab.freedesktop.org/drm/intel/issues/2705>)
>   *
> 
>     igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_mc_ccs:
> 
>       o shard-tglu-10: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8545/shard-tglu-10/igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_mc_ccs.html> (i915#3689 <https://gitlab.freedesktop.org/drm/intel/issues/3689> / i915#3886 <https://gitlab.freedesktop.org/drm/intel/issues/3886>) +1 similar issue
>   *
> 
>     igt@kms_ccs@pipe-b-bad-aux-stride-yf_tiled_ccs:
> 
>       o shard-tglu-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8545/shard-tglu-9/igt@kms_ccs@pipe-b-bad-aux-stride-yf_tiled_ccs.html> (fdo#111615 <https://bugs.freedesktop.org/show_bug.cgi?id=111615> / i915#1845 <https://gitlab.freedesktop.org/drm/intel/issues/1845> / i915#7651 <https://gitlab.freedesktop.org/drm/intel/issues/7651>) +1 similar issue
>   *
> 
>     igt@kms_ccs@pipe-b-crc-primary-basic-4_tiled_dg2_mc_ccs:
> 
>       o shard-tglu-10: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8545/shard-tglu-10/igt@kms_ccs@pipe-b-crc-primary-basic-4_tiled_dg2_mc_ccs.html> (i915#6095 <https://gitlab.freedesktop.org/drm/intel/issues/6095>) +2 similar issues
>   *
> 
>     igt@kms_ccs@pipe-c-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs:
> 
>       o shard-tglu-10: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8545/shard-tglu-10/igt@kms_ccs@pipe-c-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs.html> (i915#3689 <https://gitlab.freedesktop.org/drm/intel/issues/3689> / i915#6095 <https://gitlab.freedesktop.org/drm/intel/issues/6095>) +5 similar issues
>   *
> 
>     igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_ccs:
> 
>       o shard-tglu-10: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8545/shard-tglu-10/igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_ccs.html> (i915#3689 <https://gitlab.freedesktop.org/drm/intel/issues/3689>) +9 similar issues
>   *
> 
>     igt@kms_ccs@pipe-d-ccs-on-another-bo-yf_tiled_ccs:
> 
>       o shard-tglu-10: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8545/shard-tglu-10/igt@kms_ccs@pipe-d-ccs-on-another-bo-yf_tiled_ccs.html> (fdo#111615 <https://bugs.freedesktop.org/show_bug.cgi?id=111615> / i915#3689 <https://gitlab.freedesktop.org/drm/intel/issues/3689>) +4 similar issues
>   *
> 
>     igt@kms_cdclk@plane-scaling:
> 
>       o shard-tglu-10: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8545/shard-tglu-10/igt@kms_cdclk@plane-scaling.html> (i915#3742 <https://gitlab.freedesktop.org/drm/intel/issues/3742>)
>   *
> 
>     igt@kms_chamelium_color@ctm-0-75:
> 
>       o shard-tglu-10: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8545/shard-tglu-10/igt@kms_chamelium_color@ctm-0-75.html> (fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>)
>   *
> 
>     igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:
> 
>       o shard-tglu-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8545/shard-tglu-9/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html> (i915#7828 <https://gitlab.freedesktop.org/drm/intel/issues/7828>) +1 similar issue
>   *
> 
>     igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:
> 
>       o shard-tglu-10: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8545/shard-tglu-10/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html> (i915#7828 <https://gitlab.freedesktop.org/drm/intel/issues/7828>) +6 similar issues
>   *
> 
>     igt@kms_color@ctm-0-75@pipe-c-hdmi-a-1:
> 
>       o shard-tglu-10: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8545/shard-tglu-10/igt@kms_color@ctm-0-75@pipe-c-hdmi-a-1.html> (i915#315 <https://gitlab.freedesktop.org/drm/intel/issues/315> / i915#6946 <https://gitlab.freedesktop.org/drm/intel/issues/6946>) +3 similar issues
>   *
> 
>     igt@kms_content_protection@lic:
> 
>       o shard-tglu-10: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8545/shard-tglu-10/igt@kms_content_protection@lic.html> (i915#6944 <https://gitlab.freedesktop.org/drm/intel/issues/6944> / i915#7116 <https://gitlab.freedesktop.org/drm/intel/issues/7116> / i915#7118 <https://gitlab.freedesktop.org/drm/intel/issues/7118>) +1 similar issue
>   *
> 
>     igt@kms_cursor_crc@cursor-onscreen-max-size:
> 
>       o shard-tglu-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8545/shard-tglu-9/igt@kms_cursor_crc@cursor-onscreen-max-size.html> (i915#1845 <https://gitlab.freedesktop.org/drm/intel/issues/1845>) +3 similar issues
>   *
> 
>     igt@kms_cursor_crc@cursor-rapid-movement-32x10:
> 
>       o shard-tglu-10: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8545/shard-tglu-10/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html> (i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555>) +2 similar issues
>   *
> 
>     igt@kms_cursor_crc@cursor-rapid-movement-512x170:
> 
>       o shard-tglu-10: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8545/shard-tglu-10/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html> (i915#3359 <https://gitlab.freedesktop.org/drm/intel/issues/3359>) +2 similar issues
>   *
> 
>     igt@kms_cursor_crc@cursor-suspend:
> 
>       o shard-tglu-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8545/shard-tglu-9/igt@kms_cursor_crc@cursor-suspend.html> (i915#1845 <https://gitlab.freedesktop.org/drm/intel/issues/1845> / i915#7651 <https://gitlab.freedesktop.org/drm/intel/issues/7651>) +20 similar issues
>   *
> 
>     igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:
> 
>       o shard-tglu-10: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8545/shard-tglu-10/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html> (fdo#109274 <https://bugs.freedesktop.org/show_bug.cgi?id=109274>) +5 similar issues
>   *
> 
>     igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
> 
>       o
> 
>         shard-apl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12796/shard-apl1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8545/shard-apl3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html> (i915#2346 <https://gitlab.freedesktop.org/drm/intel/issues/2346>)
> 
>       o
> 
>         shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12796/shard-glk5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8545/shard-glk5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html> (i915#2346 <https://gitlab.freedesktop.org/drm/intel/issues/2346>)
> 
>   *
> 
>     igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
> 
>       o shard-tglu-10: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8545/shard-tglu-10/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html> (i915#4103 <https://gitlab.freedesktop.org/drm/intel/issues/4103>)
>   *
> 
>     igt@kms_fbcon_fbt@psr:
> 
>       o shard-tglu-10: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8545/shard-tglu-10/igt@kms_fbcon_fbt@psr.html> (i915#3469 <https://gitlab.freedesktop.org/drm/intel/issues/3469>)
>   *
> 
>     {igt@kms_flip@2x-dpms-vs-vblank-race@cd-dp3-dp4} (NEW):
> 
>       o {shard-dg2-11}: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8545/shard-dg2-11/igt@kms_flip@2x-dpms-vs-vblank-race@cd-dp3-dp4.html> (i915#7507 <https://gitlab.freedesktop.org/drm/intel/issues/7507>)
>   *
> 
>     igt@kms_flip@2x-flip-vs-modeset-vs-hang:
> 
>       o shard-tglu-10: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8545/shard-tglu-10/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html> (fdo#109274 <https://bugs.freedesktop.org/show_bug.cgi?id=109274> / i915#3637 <https://gitlab.freedesktop.org/drm/intel/issues/3637>) +5 similar issues
>   *
> 
>     igt@kms_flip@flip-vs-blocking-wf-vblank:
> 
>       o shard-tglu-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8545/shard-tglu-9/igt@kms_flip@flip-vs-blocking-wf-vblank.html> (i915#3637 <https://gitlab.freedesktop.org/drm/intel/issues/3637>)
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode:
> 
>       o shard-tglu-10: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8545/shard-tglu-10/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html> (i915#2587 <https://gitlab.freedesktop.org/drm/intel/issues/2587> / i915#2672 <https://gitlab.freedesktop.org/drm/intel/issues/2672>) +2 similar issues
>   *
> 
>     igt@kms_force_connector_basic@force-load-detect:
> 
>       o shard-tglu-10: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8545/shard-tglu-10/igt@kms_force_connector_basic@force-load-detect.html> (fdo#109285 <https://bugs.freedesktop.org/show_bug.cgi?id=109285>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt:
> 
>       o shard-tglu-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8545/shard-tglu-9/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt.html> (i915#1849 <https://gitlab.freedesktop.org/drm/intel/issues/1849>) +17 similar issues
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-pwrite:
> 
>       o shard-tglu-10: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8545/shard-tglu-10/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-pwrite.html> (fdo#110189 <https://bugs.freedesktop.org/show_bug.cgi?id=110189>) +29 similar issues
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
> 
>       o shard-tglu-10: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8545/shard-tglu-10/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html> (fdo#109280 <https://bugs.freedesktop.org/show_bug.cgi?id=109280>) +46 similar issues
>   *
> 
>     igt@kms_plane_alpha_blend@alpha-basic:
> 
>       o shard-tglu-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8545/shard-tglu-9/igt@kms_plane_alpha_blend@alpha-basic.html> (i915#7128 <https://gitlab.freedesktop.org/drm/intel/issues/7128> / i915#7294 <https://gitlab.freedesktop.org/drm/intel/issues/7294>)
>   *
> 
>     igt@kms_plane_lowres@tiling-4:
> 
>       o shard-tglu-10: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8545/shard-tglu-10/igt@kms_plane_lowres@tiling-4.html> (fdo#112054 <https://bugs.freedesktop.org/show_bug.cgi?id=112054> / i915#5288 <https://gitlab.freedesktop.org/drm/intel/issues/5288>)
>   *
> 
>     igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-5:
> 
>       o shard-tglu-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8545/shard-tglu-9/igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-5.html> (i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555>) +5 similar issues
>   *
> 
>     igt@kms_plane_scaling@plane-upscale-with-rotation-20x20@pipe-c-hdmi-a-1:
> 
>       o shard-tglu-10: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8545/shard-tglu-10/igt@kms_plane_scaling@plane-upscale-with-rotation-20x20@pipe-c-hdmi-a-1.html> (i915#5176 <https://gitlab.freedesktop.org/drm/intel/issues/5176>) +7 similar issues
>   *
> 
>     igt@kms_plane_scaling@planes-upscale-factor-0-25:
> 
>       o shard-tglu-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8545/shard-tglu-9/igt@kms_plane_scaling@planes-upscale-factor-0-25.html> (i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555> / i915#6953 <https://gitlab.freedesktop.org/drm/intel/issues/6953>)
>   *
> 
>     igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf:
> 
>       o shard-tglu-10: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8545/shard-tglu-10/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf.html> (i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>) +2 similar issues
>   *
> 
>     igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
> 
>       o shard-tglu-10: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8545/shard-tglu-10/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html> (fdo#111068 <https://bugs.freedesktop.org/show_bug.cgi?id=111068> / i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>) +1 similar issue
>   *
> 
>     igt@kms_psr@psr2_no_drrs:
> 
>       o shard-tglu-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8545/shard-tglu-9/igt@kms_psr@psr2_no_drrs.html> (fdo#110189 <https://bugs.freedesktop.org/show_bug.cgi?id=110189>) +2 similar issues
>   *
> 
>     igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
> 
>       o shard-tglu-10: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8545/shard-tglu-10/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html> (i915#5289 <https://gitlab.freedesktop.org/drm/intel/issues/5289>)
>   *
> 
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
> 
>       o shard-tglu-10: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8545/shard-tglu-10/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html> (fdo#111615 <https://bugs.freedesktop.org/show_bug.cgi?id=111615> / i915#5289 <https://gitlab.freedesktop.org/drm/intel/issues/5289>)
>   *
> 
>     igt@kms_selftest@all-tests:
> 
>       o shard-tglu-10: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8545/shard-tglu-10/igt@kms_selftest@all-tests.html> (i915#6433 <https://gitlab.freedesktop.org/drm/intel/issues/6433>) +1 similar issue
>   *
> 
>     igt@kms_setmode@basic@pipe-a-vga-1:
> 
>       o shard-snb: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8545/shard-snb4/igt@kms_setmode@basic@pipe-a-vga-1.html> (i915#5465 <https://gitlab.freedesktop.org/drm/intel/issues/5465>) +1 similar issue
>   *
> 
>     igt@prime_vgem@basic-userptr:
> 
>       o shard-tglu-10: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8545/shard-tglu-10/igt@prime_vgem@basic-userptr.html> (fdo#109295 <https://bugs.freedesktop.org/show_bug.cgi?id=109295> / i915#3301 <https://gitlab.freedesktop.org/drm/intel/issues/3301>)
>   *
> 
>     igt@prime_vgem@coherency-gtt:
> 
>       o shard-tglu-10: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8545/shard-tglu-10/igt@prime_vgem@coherency-gtt.html> (fdo#109295 <https://bugs.freedesktop.org/show_bug.cgi?id=109295> / fdo#111656 <https://bugs.freedesktop.org/show_bug.cgi?id=111656>)
>   *
> 
>     igt@tools_test@sysfs_l3_parity:
> 
>       o shard-tglu-10: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8545/shard-tglu-10/igt@tools_test@sysfs_l3_parity.html> (fdo#109307 <https://bugs.freedesktop.org/show_bug.cgi?id=109307>)
>   *
> 
>     igt@v3d/v3d_perfmon@destroy-invalid-perfmon:
> 
>       o shard-tglu-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8545/shard-tglu-9/igt@v3d/v3d_perfmon@destroy-invalid-perfmon.html> (fdo#109315 <https://bugs.freedesktop.org/show_bug.cgi?id=109315> / i915#2575 <https://gitlab.freedesktop.org/drm/intel/issues/2575>)
>   *
> 
>     igt@v3d/v3d_perfmon@destroy-valid-perfmon:
> 
>       o shard-tglu-10: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8545/shard-tglu-10/igt@v3d/v3d_perfmon@destroy-valid-perfmon.html> (fdo#109315 <https://bugs.freedesktop.org/show_bug.cgi?id=109315> / i915#2575 <https://gitlab.freedesktop.org/drm/intel/issues/2575>) +3 similar issues
>   *
> 
>     igt@vc4/vc4_wait_bo@unused-bo-0ns:
> 
>       o shard-tglu-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8545/shard-tglu-9/igt@vc4/vc4_wait_bo@unused-bo-0ns.html> (i915#2575 <https://gitlab.freedesktop.org/drm/intel/issues/2575>) +2 similar issues
>   *
> 
>     igt@vc4/vc4_wait_seqno@bad-seqno-0ns:
> 
>       o shard-tglu-10: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8545/shard-tglu-10/igt@vc4/vc4_wait_seqno@bad-seqno-0ns.html> (i915#2575 <https://gitlab.freedesktop.org/drm/intel/issues/2575>) +5 similar issues
> 
> 
>         Possible fixes
> 
>   *
> 
>     igt@gem_exec_fair@basic-none-solo@rcs0:
> 
>       o shard-apl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12796/shard-apl3/igt@gem_exec_fair@basic-none-solo@rcs0.html> (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8545/shard-apl7/igt@gem_exec_fair@basic-none-solo@rcs0.html> +2 similar issues
>   *
> 
>     igt@gem_exec_reloc@basic-cpu-read-noreloc:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12796/shard-rkl-4/igt@gem_exec_reloc@basic-cpu-read-noreloc.html> (i915#3281 <https://gitlab.freedesktop.org/drm/intel/issues/3281>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8545/shard-rkl-5/igt@gem_exec_reloc@basic-cpu-read-noreloc.html> +3 similar issues
>   *
> 
>     igt@gem_partial_pwrite_pread@write:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12796/shard-rkl-2/igt@gem_partial_pwrite_pread@write.html> (i915#3282 <https://gitlab.freedesktop.org/drm/intel/issues/3282>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8545/shard-rkl-5/igt@gem_partial_pwrite_pread@write.html>
>   *
> 
>     igt@i915_pm_dc@dc6-dpms:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12796/shard-rkl-5/igt@i915_pm_dc@dc6-dpms.html> (i915#3361 <https://gitlab.freedesktop.org/drm/intel/issues/3361>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8545/shard-rkl-4/igt@i915_pm_dc@dc6-dpms.html>
>   *
> 
>     igt@i915_suspend@sysfs-reader:
> 
>       o {shard-rkl}: ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12796/shard-rkl-4/igt@i915_suspend@sysfs-reader.html> (i915#5122 <https://gitlab.freedesktop.org/drm/intel/issues/5122>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8545/shard-rkl-2/igt@i915_suspend@sysfs-reader.html>
>   *
> 
>     igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0:
> 
>       o {shard-tglu}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12796/shard-tglu-6/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0.html> (i915#1845 <https://gitlab.freedesktop.org/drm/intel/issues/1845> / i915#7651 <https://gitlab.freedesktop.org/drm/intel/issues/7651>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8545/shard-tglu-7/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0.html>
>   *
> 
>     igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions:
> 
>       o {shard-tglu}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12796/shard-tglu-6/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html> (i915#1845 <https://gitlab.freedesktop.org/drm/intel/issues/1845>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8545/shard-tglu-7/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html>
>   *
> 
>     igt@kms_fbcon_fbt@fbc:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12796/shard-rkl-5/igt@kms_fbcon_fbt@fbc.html> (i915#1849 <https://gitlab.freedesktop.org/drm/intel/issues/1849> / i915#4098 <https://gitlab.freedesktop.org/drm/intel/issues/4098>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8545/shard-rkl-6/igt@kms_fbcon_fbt@fbc.html> +11 similar issues
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-tiling-y:
> 
>       o {shard-tglu}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12796/shard-tglu-6/igt@kms_frontbuffer_tracking@fbc-tiling-y.html> (i915#1849 <https://gitlab.freedesktop.org/drm/intel/issues/1849>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8545/shard-tglu-7/igt@kms_frontbuffer_tracking@fbc-tiling-y.html>
>   *
> 
>     igt@kms_psr@cursor_plane_onoff:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12796/shard-rkl-5/igt@kms_psr@cursor_plane_onoff.html> (i915#1072 <https://gitlab.freedesktop.org/drm/intel/issues/1072>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8545/shard-rkl-6/igt@kms_psr@cursor_plane_onoff.html> +1 similar issue
>   *
> 
>     igt@kms_rotation_crc@exhaust-fences:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12796/shard-rkl-5/igt@kms_rotation_crc@exhaust-fences.html> (i915#1845 <https://gitlab.freedesktop.org/drm/intel/issues/1845> / i915#4098 <https://gitlab.freedesktop.org/drm/intel/issues/4098>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8545/shard-rkl-6/igt@kms_rotation_crc@exhaust-fences.html> +19 similar issues
>   *
> 
>     igt@perf@gen12-unprivileged-single-ctx-counters:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12796/shard-rkl-5/igt@perf@gen12-unprivileged-single-ctx-counters.html> (fdo#109289 <https://bugs.freedesktop.org/show_bug.cgi?id=109289>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8545/shard-rkl-2/igt@perf@gen12-unprivileged-single-ctx-counters.html>
>   *
> 
>     igt@perf@gen8-unprivileged-single-ctx-counters:
> 
>       o {shard-rkl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12796/shard-rkl-2/igt@perf@gen8-unprivileged-single-ctx-counters.html> (i915#2436 <https://gitlab.freedesktop.org/drm/intel/issues/2436>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8545/shard-rkl-5/igt@perf@gen8-unprivileged-single-ctx-counters.html>
> 
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> 
>     Build changes
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7177 -> IGTPW_8545
>   * Piglit: piglit_4509 -> None
> 
> CI-20190529: 20190529
> CI_DRM_12796: 56c017efe176b9f3ab1700b80d3d20970c851414 @ 
> git://anongit.freedesktop.org/gfx-ci/linux
> IGTPW_8545: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8545/index.html
> IGT_7177: 0cdc4a676cd9f9e495ad3ae441ed3322f1e14a88 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ 
> git://anongit.freedesktop.org/piglit
> 
