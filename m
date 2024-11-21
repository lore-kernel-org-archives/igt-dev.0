Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 923CAE64004
	for <igt-dev@archiver.kernel.org>; Thu, 21 Nov 2024 18:57:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BC7710EA55;
	Thu, 21 Nov 2024 18:57:38 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BB3210EA40;
 Thu, 21 Nov 2024 18:57:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_Force_connector/crtc_att?=
 =?utf-8?q?rs_to_default_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 21 Nov 2024 18:57:36 -0000
Message-ID: <173221545665.1305580.14251533161323811576@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241118095948.2017893-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20241118095948.2017893-1-bhanuprakash.modem@intel.com>
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
Reply-To: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

== Series Details ==

Series: Force connector/crtc attrs to default (rev5)
URL   : https://patchwork.freedesktop.org/series/137234/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_15721_full -> IGTPW_12138_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12138_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12138_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/index.html

Participating hosts (10 -> 12)
------------------------------

  Additional (2): shard-snb-0 shard-dg2-set2 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12138_full:

### IGT changes ###

#### Possible regressions ####

  * igt@core_setmaster@master-drop-set-root:
    - shard-dg2:          [PASS][1] -> ([PASS][2], [FAIL][3])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15721/shard-dg2-1/igt@core_setmaster@master-drop-set-root.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-3/igt@core_setmaster@master-drop-set-root.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-11/igt@core_setmaster@master-drop-set-root.html

  * igt@core_setmaster@master-drop-set-shared-fd:
    - shard-dg2:          [PASS][4] -> ([PASS][5], [SKIP][6]) +7 other tests ( 1 pass, 1 skip )
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15721/shard-dg2-2/igt@core_setmaster@master-drop-set-shared-fd.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-4/igt@core_setmaster@master-drop-set-shared-fd.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-11/igt@core_setmaster@master-drop-set-shared-fd.html

  * igt@gem_ctx_isolation@preservation-s3:
    - shard-mtlp:         [PASS][7] -> [INCOMPLETE][8] +1 other test incomplete
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15721/shard-mtlp-3/igt@gem_ctx_isolation@preservation-s3.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-mtlp-5/igt@gem_ctx_isolation@preservation-s3.html

  * igt@gem_exercise_blt@fast-copy-emit:
    - shard-rkl:          [PASS][9] -> ([PASS][10], [DMESG-WARN][11]) +5 other tests ( 1 dmesg-warn, 1 pass )
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15721/shard-rkl-1/igt@gem_exercise_blt@fast-copy-emit.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-rkl-4/igt@gem_exercise_blt@fast-copy-emit.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-rkl-5/igt@gem_exercise_blt@fast-copy-emit.html

  * igt@i915_pm_rpm@gem-evict-pwrite:
    - shard-dg2:          NOTRUN -> ([SKIP][12], [SKIP][13]) ([i915#4077])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-11/igt@i915_pm_rpm@gem-evict-pwrite.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-5/igt@i915_pm_rpm@gem-evict-pwrite.html

  * igt@i915_pm_rpm@system-suspend:
    - shard-dg2:          NOTRUN -> [SKIP][14] +2 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-11/igt@i915_pm_rpm@system-suspend.html

  * igt@i915_selftest@live@gt_pm:
    - shard-rkl:          [PASS][15] -> ([DMESG-FAIL][16], [DMESG-FAIL][17])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15721/shard-rkl-5/igt@i915_selftest@live@gt_pm.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-rkl-1/igt@i915_selftest@live@gt_pm.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-rkl-7/igt@i915_selftest@live@gt_pm.html

  * igt@kms_atomic_transition@plane-primary-toggle-with-vblank-wait@pipe-a-hdmi-a-2:
    - shard-rkl:          [PASS][18] -> [DMESG-WARN][19] +14 other tests dmesg-warn
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15721/shard-rkl-1/igt@kms_atomic_transition@plane-primary-toggle-with-vblank-wait@pipe-a-hdmi-a-2.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-rkl-1/igt@kms_atomic_transition@plane-primary-toggle-with-vblank-wait@pipe-a-hdmi-a-2.html

  * igt@kms_color@ctm-0-50:
    - shard-tglu:         [PASS][20] -> ([ABORT][21], [PASS][22]) +1 other test ( 1 abort, 1 pass )
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15721/shard-tglu-9/igt@kms_color@ctm-0-50.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-tglu-7/igt@kms_color@ctm-0-50.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-tglu-8/igt@kms_color@ctm-0-50.html

  * igt@kms_cursor_legacy@torture-move:
    - shard-dg1:          [PASS][23] -> ([DMESG-WARN][24], [PASS][25]) +1 other test ( 1 dmesg-warn, 1 pass )
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15721/shard-dg1-13/igt@kms_cursor_legacy@torture-move.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg1-13/igt@kms_cursor_legacy@torture-move.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg1-12/igt@kms_cursor_legacy@torture-move.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-dg2:          NOTRUN -> ([SKIP][26], [SKIP][27])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-modeset:
    - shard-dg2:          NOTRUN -> ([SKIP][28], [SKIP][29]) ([i915#2575]) +2 other tests ( 2 skip )
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-2/igt@kms_flip@2x-flip-vs-modeset.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-11/igt@kms_flip@2x-flip-vs-modeset.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-hdmi-a1:
    - shard-rkl:          NOTRUN -> ([DMESG-WARN][30], [DMESG-WARN][31]) +5 other tests ( 2 dmesg-warn )
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-rkl-2/igt@kms_flip@basic-flip-vs-wf_vblank@a-hdmi-a1.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-rkl-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:
    - shard-dg2:          [PASS][32] -> ([PASS][33], [CRASH][34])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15721/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-dg2:          [PASS][35] -> ([SKIP][36], [SKIP][37]) ([i915#2575])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15721/shard-dg2-8/igt@kms_hdmi_inject@inject-audio.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-1/igt@kms_hdmi_inject@inject-audio.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-11/igt@kms_hdmi_inject@inject-audio.html
    - shard-rkl:          [PASS][38] -> ([SKIP][39], [SKIP][40])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15721/shard-rkl-3/igt@kms_hdmi_inject@inject-audio.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-rkl-1/igt@kms_hdmi_inject@inject-audio.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-rkl-4/igt@kms_hdmi_inject@inject-audio.html
    - shard-dg1:          [PASS][41] -> [SKIP][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15721/shard-dg1-12/igt@kms_hdmi_inject@inject-audio.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg1-12/igt@kms_hdmi_inject@inject-audio.html
    - shard-tglu:         [PASS][43] -> ([SKIP][44], [SKIP][45])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15721/shard-tglu-6/igt@kms_hdmi_inject@inject-audio.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-tglu-5/igt@kms_hdmi_inject@inject-audio.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-tglu-8/igt@kms_hdmi_inject@inject-audio.html
    - shard-mtlp:         [PASS][46] -> [SKIP][47]
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15721/shard-mtlp-1/igt@kms_hdmi_inject@inject-audio.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-mtlp-8/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5:
    - shard-rkl:          NOTRUN -> ([PASS][48], [DMESG-WARN][49]) +1 other test ( 1 dmesg-warn, 1 pass )
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-rkl-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-rkl-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html

  * igt@kms_pm_dc@dc5-dpms-negative:
    - shard-rkl:          [PASS][50] -> ([DMESG-WARN][51], [DMESG-WARN][52]) +43 other tests ( 2 dmesg-warn )
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15721/shard-rkl-4/igt@kms_pm_dc@dc5-dpms-negative.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-rkl-1/igt@kms_pm_dc@dc5-dpms-negative.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-rkl-7/igt@kms_pm_dc@dc5-dpms-negative.html

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - shard-dg2:          [PASS][53] -> [SKIP][54] +5 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15721/shard-dg2-6/igt@kms_pm_rpm@basic-pci-d3-state.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-11/igt@kms_pm_rpm@basic-pci-d3-state.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-dg2:          NOTRUN -> ([SKIP][55], [SKIP][56]) ([i915#9519])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-11/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-6/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_sequence@get-forked-busy@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][57] +10 other tests dmesg-warn
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-rkl-5/igt@kms_sequence@get-forked-busy@pipe-b-hdmi-a-2.html

  * igt@perf_pmu@init-wait:
    - shard-dg2:          NOTRUN -> ([PASS][58], [SKIP][59]) +3 other tests ( 1 pass, 1 skip )
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-5/igt@perf_pmu@init-wait.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-11/igt@perf_pmu@init-wait.html

  
#### Warnings ####

  * igt@device_reset@unbind-reset-rebind:
    - shard-dg2:          [SKIP][60] -> ([SKIP][61], [PASS][62]) +3 other tests ( 1 pass, 1 skip )
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15721/shard-dg2-11/igt@device_reset@unbind-reset-rebind.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-11/igt@device_reset@unbind-reset-rebind.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-1/igt@device_reset@unbind-reset-rebind.html

  * igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:
    - shard-rkl:          [SKIP][63] ([i915#4270]) -> ([TIMEOUT][64], [TIMEOUT][65]) +1 other test ( 2 timeout )
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15721/shard-rkl-5/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-rkl-4/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-rkl-5/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html

  * igt@gem_tiled_swapping@non-threaded:
    - shard-rkl:          [DMESG-FAIL][66] ([i915#12964]) -> ([FAIL][67], [FAIL][68])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15721/shard-rkl-4/igt@gem_tiled_swapping@non-threaded.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-rkl-5/igt@gem_tiled_swapping@non-threaded.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-rkl-7/igt@gem_tiled_swapping@non-threaded.html
    - shard-snb:          [FAIL][69] ([i915#12941]) -> [FAIL][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15721/shard-snb7/igt@gem_tiled_swapping@non-threaded.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-snb2/igt@gem_tiled_swapping@non-threaded.html
    - shard-tglu:         [FAIL][71] ([i915#12941]) -> ([FAIL][72], [FAIL][73])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15721/shard-tglu-4/igt@gem_tiled_swapping@non-threaded.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-tglu-6/igt@gem_tiled_swapping@non-threaded.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-tglu-5/igt@gem_tiled_swapping@non-threaded.html
    - shard-glk:          [FAIL][74] ([i915#12941]) -> [FAIL][75]
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15721/shard-glk3/igt@gem_tiled_swapping@non-threaded.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-glk5/igt@gem_tiled_swapping@non-threaded.html

  * igt@kms_flip@2x-absolute-wf_vblank:
    - shard-dg2:          [SKIP][76] ([i915#5354]) -> ([SKIP][77], [SKIP][78]) ([i915#2575]) +6 other tests ( 2 skip )
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15721/shard-dg2-2/igt@kms_flip@2x-absolute-wf_vblank.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-2/igt@kms_flip@2x-absolute-wf_vblank.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-11/igt@kms_flip@2x-absolute-wf_vblank.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-dg2:          [SKIP][79] ([i915#5354]) -> [SKIP][80] +7 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15721/shard-dg2-7/igt@kms_flip@2x-modeset-vs-vblank-race.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-8/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-dg2:          [SKIP][81] ([i915#2575]) -> ([SKIP][82], [SKIP][83]) +4 other tests ( 2 skip )
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15721/shard-dg2-11/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-10/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-5/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-dg2:          [SKIP][84] ([i915#5354]) -> ([SKIP][85], [SKIP][86]) +5 other tests ( 2 skip )
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15721/shard-dg2-3/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-2/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-5/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
    - shard-dg2:          [SKIP][87] ([i915#2575]) -> [SKIP][88] +1 other test skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15721/shard-dg2-11/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-7/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html

  * igt@perf@non-zero-reason:
    - shard-dg2:          [FAIL][89] ([i915#7484]) -> ([FAIL][90], [SKIP][91]) ([i915#9100])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15721/shard-dg2-6/igt@perf@non-zero-reason.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-3/igt@perf@non-zero-reason.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-11/igt@perf@non-zero-reason.html

  * igt@sysfs_heartbeat_interval@mixed:
    - shard-dg2:          [SKIP][92] ([i915#2575]) -> ([INCOMPLETE][93], [PASS][94])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15721/shard-dg2-11/igt@sysfs_heartbeat_interval@mixed.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-2/igt@sysfs_heartbeat_interval@mixed.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-5/igt@sysfs_heartbeat_interval@mixed.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_flip@2x-flip-vs-wf_vblank:
    - {shard-dg2-9}:      NOTRUN -> [SKIP][95] +8 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-9/igt@kms_flip@2x-flip-vs-wf_vblank.html

  
New tests
---------

  New tests have been introduced between CI_DRM_15721_full and IGTPW_12138_full:

### New IGT tests (4) ###

  * igt@kms_cursor_crc@cursor-onscreen-128x42@pipe-a-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [2.83] s

  * igt@kms_cursor_crc@cursor-random-64x21@pipe-a-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [4.61] s

  * igt@kms_dirtyfb@default-dirtyfb-ioctl@a-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [1.44] s

  * igt@kms_panel_fitting:
    - Statuses :
    - Exec time: [None] s

  

Known issues
------------

  Here are the changes found in IGTPW_12138_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_allocator@default-alignment:
    - shard-dg2:          [PASS][96] -> ([SKIP][97], [PASS][98]) +38 other tests ( 1 pass, 1 skip )
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15721/shard-dg2-1/igt@api_intel_allocator@default-alignment.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-11/igt@api_intel_allocator@default-alignment.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-3/igt@api_intel_allocator@default-alignment.html

  * igt@api_intel_allocator@gem-pool:
    - shard-dg2:          NOTRUN -> ([SKIP][99], [PASS][100]) +5 other tests ( 1 pass, 1 skip )
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-11/igt@api_intel_allocator@gem-pool.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-2/igt@api_intel_allocator@gem-pool.html

  * igt@api_intel_bb@blit-reloc-purge-cache:
    - shard-dg2:          NOTRUN -> ([SKIP][101], [SKIP][102]) ([i915#8411])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-10/igt@api_intel_bb@blit-reloc-purge-cache.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-8/igt@api_intel_bb@blit-reloc-purge-cache.html
    - shard-mtlp:         NOTRUN -> [SKIP][103] ([i915#8411])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-mtlp-6/igt@api_intel_bb@blit-reloc-purge-cache.html

  * igt@api_intel_bb@crc32:
    - shard-tglu-1:       NOTRUN -> [SKIP][104] ([i915#6230])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-tglu-1/igt@api_intel_bb@crc32.html
    - shard-dg1:          NOTRUN -> [SKIP][105] ([i915#6230])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg1-14/igt@api_intel_bb@crc32.html
    - shard-tglu:         NOTRUN -> [SKIP][106] ([i915#6230])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-tglu-7/igt@api_intel_bb@crc32.html

  * igt@debugfs_test@basic-hwmon:
    - shard-mtlp:         NOTRUN -> [SKIP][107] ([i915#9318])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-mtlp-3/igt@debugfs_test@basic-hwmon.html
    - shard-rkl:          NOTRUN -> [SKIP][108] ([i915#9318])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-rkl-3/igt@debugfs_test@basic-hwmon.html

  * igt@device_reset@cold-reset-bound:
    - shard-dg1:          NOTRUN -> [SKIP][109] ([i915#11078])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg1-13/igt@device_reset@cold-reset-bound.html

  * igt@drm_fdinfo@all-busy-idle-check-all:
    - shard-dg1:          NOTRUN -> [SKIP][110] ([i915#8414]) +2 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg1-17/igt@drm_fdinfo@all-busy-idle-check-all.html

  * igt@drm_fdinfo@busy:
    - shard-dg2:          NOTRUN -> ([SKIP][111], [SKIP][112]) ([i915#12506] / [i915#8414])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-2/igt@drm_fdinfo@busy.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-11/igt@drm_fdinfo@busy.html

  * igt@drm_fdinfo@busy-check-all@ccs0:
    - shard-mtlp:         NOTRUN -> [SKIP][113] ([i915#8414]) +14 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-mtlp-6/igt@drm_fdinfo@busy-check-all@ccs0.html

  * igt@drm_fdinfo@busy@ccs0:
    - shard-dg2:          NOTRUN -> [SKIP][114] ([i915#8414]) +15 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-2/igt@drm_fdinfo@busy@ccs0.html

  * igt@drm_fdinfo@busy@vcs1:
    - shard-dg1:          NOTRUN -> ([SKIP][115], [SKIP][116]) ([i915#8414]) +23 other tests ( 2 skip )
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg1-12/igt@drm_fdinfo@busy@vcs1.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg1-14/igt@drm_fdinfo@busy@vcs1.html

  * igt@drm_fdinfo@memory-info-purgeable:
    - shard-dg2:          [PASS][117] -> [SKIP][118] ([i915#12506]) +2 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15721/shard-dg2-2/igt@drm_fdinfo@memory-info-purgeable.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-11/igt@drm_fdinfo@memory-info-purgeable.html

  * igt@drm_fdinfo@virtual-busy-idle:
    - shard-dg2:          NOTRUN -> ([SKIP][119], [SKIP][120]) ([i915#8414]) +7 other tests ( 2 skip )
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-8/igt@drm_fdinfo@virtual-busy-idle.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-10/igt@drm_fdinfo@virtual-busy-idle.html

  * igt@fbdev@unaligned-read:
    - shard-dg2:          NOTRUN -> ([SKIP][121], [PASS][122]) ([i915#2582])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-11/igt@fbdev@unaligned-read.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-1/igt@fbdev@unaligned-read.html

  * igt@gem_basic@multigpu-create-close:
    - shard-tglu-1:       NOTRUN -> [SKIP][123] ([i915#7697]) +1 other test skip
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-tglu-1/igt@gem_basic@multigpu-create-close.html

  * igt@gem_caching@read-writes:
    - shard-mtlp:         NOTRUN -> [SKIP][124] ([i915#4873])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-mtlp-8/igt@gem_caching@read-writes.html

  * igt@gem_ccs@block-multicopy-compressed:
    - shard-rkl:          NOTRUN -> ([SKIP][125], [SKIP][126]) ([i915#9323])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-rkl-5/igt@gem_ccs@block-multicopy-compressed.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-rkl-1/igt@gem_ccs@block-multicopy-compressed.html
    - shard-dg1:          NOTRUN -> [SKIP][127] ([i915#9323])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg1-17/igt@gem_ccs@block-multicopy-compressed.html
    - shard-tglu:         NOTRUN -> ([SKIP][128], [SKIP][129]) ([i915#9323])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-tglu-5/igt@gem_ccs@block-multicopy-compressed.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-tglu-6/igt@gem_ccs@block-multicopy-compressed.html
    - shard-mtlp:         NOTRUN -> [SKIP][130] ([i915#9323])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-mtlp-8/igt@gem_ccs@block-multicopy-compressed.html

  * igt@gem_ccs@ctrl-surf-copy:
    - shard-tglu:         NOTRUN -> ([SKIP][131], [SKIP][132]) ([i915#3555] / [i915#9323]) +1 other test ( 2 skip )
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-tglu-10/igt@gem_ccs@ctrl-surf-copy.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-tglu-3/igt@gem_ccs@ctrl-surf-copy.html

  * igt@gem_ccs@ctrl-surf-copy-new-ctx:
    - shard-tglu-1:       NOTRUN -> [SKIP][133] ([i915#9323])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-tglu-1/igt@gem_ccs@ctrl-surf-copy-new-ctx.html

  * igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0:
    - shard-dg2:          [PASS][134] -> [INCOMPLETE][135] ([i915#12392] / [i915#7297])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15721/shard-dg2-4/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-5/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0.html

  * igt@gem_close_race@multigpu-basic-process:
    - shard-dg1:          NOTRUN -> [SKIP][136] ([i915#7697])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg1-12/igt@gem_close_race@multigpu-basic-process.html

  * igt@gem_create@create-ext-cpu-access-big:
    - shard-tglu:         NOTRUN -> ([SKIP][137], [SKIP][138]) ([i915#6335])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-tglu-8/igt@gem_create@create-ext-cpu-access-big.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-tglu-10/igt@gem_create@create-ext-cpu-access-big.html

  * igt@gem_create@create-ext-cpu-access-sanity-check:
    - shard-tglu-1:       NOTRUN -> [SKIP][139] ([i915#6335])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-tglu-1/igt@gem_create@create-ext-cpu-access-sanity-check.html

  * igt@gem_create@create-ext-set-pat:
    - shard-tglu-1:       NOTRUN -> [SKIP][140] ([i915#8562])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-tglu-1/igt@gem_create@create-ext-set-pat.html
    - shard-tglu:         NOTRUN -> [SKIP][141] ([i915#8562])
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-tglu-4/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_persistence@engines-mixed:
    - shard-snb:          NOTRUN -> ([SKIP][142], [SKIP][143]) ([i915#1099])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-snb6/igt@gem_ctx_persistence@engines-mixed.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-snb2/igt@gem_ctx_persistence@engines-mixed.html

  * igt@gem_ctx_persistence@heartbeat-close:
    - shard-dg1:          NOTRUN -> ([SKIP][144], [SKIP][145]) ([i915#8555])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg1-14/igt@gem_ctx_persistence@heartbeat-close.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg1-17/igt@gem_ctx_persistence@heartbeat-close.html

  * igt@gem_ctx_persistence@heartbeat-hostile:
    - shard-dg2:          NOTRUN -> ([SKIP][146], [SKIP][147]) ([i915#8555])
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-2/igt@gem_ctx_persistence@heartbeat-hostile.html
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-5/igt@gem_ctx_persistence@heartbeat-hostile.html

  * igt@gem_ctx_persistence@legacy-engines-hostile:
    - shard-snb:          NOTRUN -> [SKIP][148] ([i915#1099])
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-snb2/igt@gem_ctx_persistence@legacy-engines-hostile.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-tglu:         NOTRUN -> [SKIP][149] ([i915#280])
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-tglu-9/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-dg2:          NOTRUN -> ([SKIP][150], [SKIP][151]) ([i915#2575] / [i915#280])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-11/igt@gem_ctx_sseu@mmap-args.html
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-4/igt@gem_ctx_sseu@mmap-args.html
    - shard-tglu-1:       NOTRUN -> [SKIP][152] ([i915#280])
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-tglu-1/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_eio@hibernate:
    - shard-dg1:          NOTRUN -> [ABORT][153] ([i915#7975] / [i915#8213])
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg1-14/igt@gem_eio@hibernate.html

  * igt@gem_eio@kms:
    - shard-dg2:          [PASS][154] -> [FAIL][155] ([i915#5784])
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15721/shard-dg2-5/igt@gem_eio@kms.html
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-7/igt@gem_eio@kms.html
    - shard-dg1:          NOTRUN -> ([FAIL][156], [FAIL][157]) ([i915#5784])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg1-12/igt@gem_eio@kms.html
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg1-17/igt@gem_eio@kms.html

  * igt@gem_exec_balancer@bonded-pair:
    - shard-dg1:          NOTRUN -> ([SKIP][158], [SKIP][159]) ([i915#4771])
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg1-12/igt@gem_exec_balancer@bonded-pair.html
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg1-14/igt@gem_exec_balancer@bonded-pair.html

  * igt@gem_exec_balancer@invalid-bonds:
    - shard-dg2:          NOTRUN -> ([SKIP][160], [SKIP][161]) ([i915#2575] / [i915#4036])
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-11/igt@gem_exec_balancer@invalid-bonds.html
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-4/igt@gem_exec_balancer@invalid-bonds.html

  * igt@gem_exec_fence@concurrent:
    - shard-mtlp:         NOTRUN -> [SKIP][162] ([i915#4812])
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-mtlp-4/igt@gem_exec_fence@concurrent.html
    - shard-dg2:          NOTRUN -> ([SKIP][163], [SKIP][164]) ([i915#2575] / [i915#4812])
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-4/igt@gem_exec_fence@concurrent.html
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-11/igt@gem_exec_fence@concurrent.html

  * igt@gem_exec_fence@submit3:
    - shard-dg2:          NOTRUN -> ([SKIP][165], [SKIP][166]) ([i915#4812])
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-2/igt@gem_exec_fence@submit3.html
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-10/igt@gem_exec_fence@submit3.html

  * igt@gem_exec_flush@basic-batch-kernel-default-wb:
    - shard-dg1:          NOTRUN -> [SKIP][167] ([i915#3539] / [i915#4852]) +3 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg1-17/igt@gem_exec_flush@basic-batch-kernel-default-wb.html

  * igt@gem_exec_flush@basic-uc-prw-default:
    - shard-dg1:          NOTRUN -> [SKIP][168] ([i915#3539])
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg1-12/igt@gem_exec_flush@basic-uc-prw-default.html

  * igt@gem_exec_flush@basic-wb-prw-default:
    - shard-dg2:          NOTRUN -> [SKIP][169] ([i915#3539] / [i915#4852])
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-6/igt@gem_exec_flush@basic-wb-prw-default.html

  * igt@gem_exec_params@invalid-bsd-ring:
    - shard-dg2:          NOTRUN -> ([SKIP][170], [PASS][171]) ([i915#2575]) +54 other tests ( 1 pass, 1 skip )
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-11/igt@gem_exec_params@invalid-bsd-ring.html
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-2/igt@gem_exec_params@invalid-bsd-ring.html

  * igt@gem_exec_reloc@basic-cpu-read-active:
    - shard-dg2:          NOTRUN -> ([SKIP][172], [SKIP][173]) ([i915#2575] / [i915#3281])
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-11/igt@gem_exec_reloc@basic-cpu-read-active.html
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-6/igt@gem_exec_reloc@basic-cpu-read-active.html

  * igt@gem_exec_reloc@basic-cpu-wc-active:
    - shard-mtlp:         NOTRUN -> [SKIP][174] ([i915#3281]) +3 other tests skip
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-mtlp-2/igt@gem_exec_reloc@basic-cpu-wc-active.html

  * igt@gem_exec_reloc@basic-gtt-active:
    - shard-dg2:          NOTRUN -> [SKIP][175] ([i915#3281]) +1 other test skip
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-6/igt@gem_exec_reloc@basic-gtt-active.html

  * igt@gem_exec_reloc@basic-gtt-cpu-active:
    - shard-dg2:          NOTRUN -> ([SKIP][176], [SKIP][177]) ([i915#3281]) +3 other tests ( 2 skip )
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-3/igt@gem_exec_reloc@basic-gtt-cpu-active.html
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-1/igt@gem_exec_reloc@basic-gtt-cpu-active.html
    - shard-rkl:          NOTRUN -> [SKIP][178] ([i915#3281])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-rkl-3/igt@gem_exec_reloc@basic-gtt-cpu-active.html

  * igt@gem_exec_reloc@basic-range-active:
    - shard-dg1:          NOTRUN -> [SKIP][179] ([i915#3281]) +7 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg1-18/igt@gem_exec_reloc@basic-range-active.html

  * igt@gem_exec_reloc@basic-softpin:
    - shard-rkl:          NOTRUN -> ([SKIP][180], [SKIP][181]) ([i915#3281])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-rkl-5/igt@gem_exec_reloc@basic-softpin.html
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-rkl-7/igt@gem_exec_reloc@basic-softpin.html

  * igt@gem_exec_reloc@basic-wc-gtt-noreloc:
    - shard-dg1:          NOTRUN -> ([SKIP][182], [SKIP][183]) ([i915#3281]) +8 other tests ( 2 skip )
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg1-17/igt@gem_exec_reloc@basic-wc-gtt-noreloc.html
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg1-18/igt@gem_exec_reloc@basic-wc-gtt-noreloc.html

  * igt@gem_exec_schedule@preempt-queue:
    - shard-dg1:          NOTRUN -> ([SKIP][184], [SKIP][185]) ([i915#4812]) +1 other test ( 2 skip )
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg1-13/igt@gem_exec_schedule@preempt-queue.html
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg1-18/igt@gem_exec_schedule@preempt-queue.html
    - shard-mtlp:         NOTRUN -> [SKIP][186] ([i915#4537] / [i915#4812])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-mtlp-7/igt@gem_exec_schedule@preempt-queue.html
    - shard-dg2:          NOTRUN -> [SKIP][187] ([i915#4537] / [i915#4812])
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-4/igt@gem_exec_schedule@preempt-queue.html

  * igt@gem_exec_schedule@preempt-self:
    - shard-dg2:          [PASS][188] -> ([SKIP][189], [PASS][190]) ([i915#2575]) +196 other tests ( 1 pass, 1 skip )
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15721/shard-dg2-10/igt@gem_exec_schedule@preempt-self.html
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-11/igt@gem_exec_schedule@preempt-self.html
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-1/igt@gem_exec_schedule@preempt-self.html

  * igt@gem_exec_schedule@semaphore-power:
    - shard-dg1:          NOTRUN -> [SKIP][191] ([i915#4812]) +3 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg1-13/igt@gem_exec_schedule@semaphore-power.html

  * igt@gem_exec_suspend@basic-s4-devices:
    - shard-dg2:          [PASS][192] -> [ABORT][193] ([i915#7975] / [i915#8213]) +1 other test abort
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15721/shard-dg2-5/igt@gem_exec_suspend@basic-s4-devices.html
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-6/igt@gem_exec_suspend@basic-s4-devices.html

  * igt@gem_fenced_exec_thrash@no-spare-fences:
    - shard-dg1:          NOTRUN -> ([SKIP][194], [SKIP][195]) ([i915#4860]) +1 other test ( 2 skip )
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg1-13/igt@gem_fenced_exec_thrash@no-spare-fences.html
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg1-14/igt@gem_fenced_exec_thrash@no-spare-fences.html
    - shard-mtlp:         NOTRUN -> [SKIP][196] ([i915#4860]) +1 other test skip
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-mtlp-3/igt@gem_fenced_exec_thrash@no-spare-fences.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-interruptible:
    - shard-dg2:          NOTRUN -> ([SKIP][197], [SKIP][198]) ([i915#4860]) +1 other test ( 2 skip )
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-10/igt@gem_fenced_exec_thrash@no-spare-fences-interruptible.html
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-2/igt@gem_fenced_exec_thrash@no-spare-fences-interruptible.html

  * igt@gem_lmem_evict@dontneed-evict-race:
    - shard-tglu-1:       NOTRUN -> [SKIP][199] ([i915#4613] / [i915#7582])
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-tglu-1/igt@gem_lmem_evict@dontneed-evict-race.html

  * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
    - shard-dg2:          NOTRUN -> ([SKIP][200], [PASS][201]) ([i915#12936])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-11/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-3/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html

  * igt@gem_lmem_swapping@heavy-verify-random-ccs:
    - shard-rkl:          NOTRUN -> ([SKIP][202], [SKIP][203]) ([i915#4613]) +1 other test ( 2 skip )
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-rkl-5/igt@gem_lmem_swapping@heavy-verify-random-ccs.html
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-rkl-4/igt@gem_lmem_swapping@heavy-verify-random-ccs.html
    - shard-tglu:         NOTRUN -> ([SKIP][204], [SKIP][205]) ([i915#4613]) +5 other tests ( 2 skip )
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-tglu-2/igt@gem_lmem_swapping@heavy-verify-random-ccs.html
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-tglu-4/igt@gem_lmem_swapping@heavy-verify-random-ccs.html

  * igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0:
    - shard-dg1:          NOTRUN -> ([SKIP][206], [SKIP][207]) ([i915#4565]) +1 other test ( 2 skip )
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg1-18/igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0.html
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg1-13/igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0.html

  * igt@gem_lmem_swapping@massive-random:
    - shard-dg2:          [PASS][208] -> [SKIP][209] ([i915#12936]) +1 other test skip
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15721/shard-dg2-10/igt@gem_lmem_swapping@massive-random.html
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-7/igt@gem_lmem_swapping@massive-random.html

  * igt@gem_lmem_swapping@parallel-multi:
    - shard-dg2:          [PASS][210] -> ([PASS][211], [SKIP][212]) ([i915#12936]) +3 other tests ( 1 pass, 1 skip )
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15721/shard-dg2-1/igt@gem_lmem_swapping@parallel-multi.html
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-4/igt@gem_lmem_swapping@parallel-multi.html
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-11/igt@gem_lmem_swapping@parallel-multi.html
    - shard-tglu-1:       NOTRUN -> [SKIP][213] ([i915#4613]) +2 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-tglu-1/igt@gem_lmem_swapping@parallel-multi.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - shard-glk:          NOTRUN -> [SKIP][214] ([i915#4613])
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-glk1/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@gem_lmem_swapping@parallel-random-verify-ccs:
    - shard-dg1:          NOTRUN -> ([SKIP][215], [SKIP][216]) ([i915#12193]) +1 other test ( 2 skip )
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg1-13/igt@gem_lmem_swapping@parallel-random-verify-ccs.html
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg1-12/igt@gem_lmem_swapping@parallel-random-verify-ccs.html
    - shard-mtlp:         NOTRUN -> [SKIP][217] ([i915#4613]) +1 other test skip
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-mtlp-4/igt@gem_lmem_swapping@parallel-random-verify-ccs.html

  * igt@gem_lmem_swapping@smem-oom@lmem0:
    - shard-dg1:          NOTRUN -> [TIMEOUT][218] ([i915#5493]) +1 other test timeout
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg1-13/igt@gem_lmem_swapping@smem-oom@lmem0.html

  * igt@gem_lmem_swapping@verify:
    - shard-dg2:          [PASS][219] -> ([SKIP][220], [SKIP][221]) ([i915#12936])
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15721/shard-dg2-6/igt@gem_lmem_swapping@verify.html
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-10/igt@gem_lmem_swapping@verify.html
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-8/igt@gem_lmem_swapping@verify.html

  * igt@gem_media_vme:
    - shard-tglu:         NOTRUN -> [SKIP][222] ([i915#284])
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-tglu-9/igt@gem_media_vme.html

  * igt@gem_mmap@basic-small-bo:
    - shard-mtlp:         NOTRUN -> [SKIP][223] ([i915#4083])
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-mtlp-2/igt@gem_mmap@basic-small-bo.html

  * igt@gem_mmap@short-mmap:
    - shard-dg1:          NOTRUN -> [SKIP][224] ([i915#4083]) +2 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg1-14/igt@gem_mmap@short-mmap.html

  * igt@gem_mmap_gtt@basic:
    - shard-dg1:          NOTRUN -> [SKIP][225] ([i915#4077]) +4 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg1-18/igt@gem_mmap_gtt@basic.html

  * igt@gem_mmap_gtt@big-bo-tiledy:
    - shard-mtlp:         NOTRUN -> [SKIP][226] ([i915#4077]) +7 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-mtlp-6/igt@gem_mmap_gtt@big-bo-tiledy.html

  * igt@gem_mmap_gtt@cpuset-big-copy:
    - shard-dg2:          NOTRUN -> ([SKIP][227], [SKIP][228]) ([i915#4077]) +3 other tests ( 2 skip )
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-3/igt@gem_mmap_gtt@cpuset-big-copy.html
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-1/igt@gem_mmap_gtt@cpuset-big-copy.html

  * igt@gem_mmap_gtt@cpuset-big-copy-odd:
    - shard-dg2:          NOTRUN -> ([SKIP][229], [SKIP][230]) ([i915#2575] / [i915#4077]) +3 other tests ( 2 skip )
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-5/igt@gem_mmap_gtt@cpuset-big-copy-odd.html
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-11/igt@gem_mmap_gtt@cpuset-big-copy-odd.html

  * igt@gem_mmap_gtt@zero-extend:
    - shard-dg2:          NOTRUN -> [SKIP][231] ([i915#4077]) +2 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-6/igt@gem_mmap_gtt@zero-extend.html

  * igt@gem_mmap_wc@copy:
    - shard-dg1:          NOTRUN -> ([SKIP][232], [SKIP][233]) ([i915#4083]) +3 other tests ( 2 skip )
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg1-18/igt@gem_mmap_wc@copy.html
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg1-13/igt@gem_mmap_wc@copy.html

  * igt@gem_mmap_wc@fault-concurrent:
    - shard-dg2:          NOTRUN -> ([SKIP][234], [SKIP][235]) ([i915#4083])
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-5/igt@gem_mmap_wc@fault-concurrent.html
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-2/igt@gem_mmap_wc@fault-concurrent.html

  * igt@gem_pread@snoop:
    - shard-dg2:          NOTRUN -> ([SKIP][236], [SKIP][237]) ([i915#3282]) +1 other test ( 2 skip )
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-2/igt@gem_pread@snoop.html
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-3/igt@gem_pread@snoop.html
    - shard-rkl:          NOTRUN -> ([SKIP][238], [SKIP][239]) ([i915#3282])
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-rkl-7/igt@gem_pread@snoop.html
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-rkl-1/igt@gem_pread@snoop.html
    - shard-dg1:          NOTRUN -> ([SKIP][240], [SKIP][241]) ([i915#3282]) +7 other tests ( 2 skip )
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg1-18/igt@gem_pread@snoop.html
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg1-13/igt@gem_pread@snoop.html
    - shard-mtlp:         NOTRUN -> [SKIP][242] ([i915#3282]) +2 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-mtlp-2/igt@gem_pread@snoop.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-tglu:         NOTRUN -> ([WARN][243], [WARN][244]) ([i915#2658])
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-tglu-3/igt@gem_pwrite@basic-exhaustion.html
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-tglu-10/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pxp@display-protected-crc:
    - shard-dg1:          NOTRUN -> ([SKIP][245], [SKIP][246]) ([i915#4270]) +3 other tests ( 2 skip )
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg1-17/igt@gem_pxp@display-protected-crc.html
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg1-12/igt@gem_pxp@display-protected-crc.html
    - shard-tglu:         [PASS][247] -> ([SKIP][248], [SKIP][249]) ([i915#4270]) +3 other tests ( 2 skip )
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15721/shard-tglu-2/igt@gem_pxp@display-protected-crc.html
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-tglu-3/igt@gem_pxp@display-protected-crc.html
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-tglu-10/igt@gem_pxp@display-protected-crc.html

  * igt@gem_pxp@protected-encrypted-src-copy-not-readible:
    - shard-dg2:          NOTRUN -> [SKIP][250] ([i915#4270])
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-4/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html
    - shard-rkl:          NOTRUN -> ([TIMEOUT][251], [TIMEOUT][252]) ([i915#12917])
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-rkl-4/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-rkl-1/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html

  * igt@gem_pxp@protected-raw-src-copy-not-readible:
    - shard-dg2:          NOTRUN -> ([SKIP][253], [SKIP][254]) ([i915#4270]) +1 other test ( 2 skip )
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-2/igt@gem_pxp@protected-raw-src-copy-not-readible.html
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-10/igt@gem_pxp@protected-raw-src-copy-not-readible.html

  * igt@gem_pxp@reject-modify-context-protection-on:
    - shard-rkl:          NOTRUN -> ([SKIP][255], [SKIP][256]) ([i915#4270])
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-rkl-1/igt@gem_pxp@reject-modify-context-protection-on.html
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-rkl-2/igt@gem_pxp@reject-modify-context-protection-on.html

  * igt@gem_pxp@verify-pxp-stale-buf-optout-execution:
    - shard-dg1:          NOTRUN -> [SKIP][257] ([i915#4270])
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg1-12/igt@gem_pxp@verify-pxp-stale-buf-optout-execution.html

  * igt@gem_readwrite@beyond-eob:
    - shard-dg2:          NOTRUN -> [SKIP][258] ([i915#3282])
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-4/igt@gem_readwrite@beyond-eob.html

  * igt@gem_readwrite@read-bad-handle:
    - shard-dg2:          NOTRUN -> ([SKIP][259], [SKIP][260]) ([i915#2575] / [i915#3282]) +1 other test ( 2 skip )
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-11/igt@gem_readwrite@read-bad-handle.html
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-2/igt@gem_readwrite@read-bad-handle.html

  * igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs:
    - shard-glk:          NOTRUN -> [SKIP][261] +143 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-glk1/igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs.html
    - shard-dg2:          NOTRUN -> ([SKIP][262], [SKIP][263]) ([i915#5190] / [i915#8428]) +6 other tests ( 2 skip )
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-4/igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs.html
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-7/igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs.html

  * igt@gem_render_copy@y-tiled-to-vebox-y-tiled:
    - shard-dg2:          NOTRUN -> ([SKIP][264], [SKIP][265]) ([i915#2575] / [i915#5190] / [i915#8428]) +1 other test ( 2 skip )
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-6/igt@gem_render_copy@y-tiled-to-vebox-y-tiled.html
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-11/igt@gem_render_copy@y-tiled-to-vebox-y-tiled.html

  * igt@gem_render_copy@yf-tiled-ccs-to-linear:
    - shard-dg2:          NOTRUN -> [SKIP][266] ([i915#5190] / [i915#8428]) +1 other test skip
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-10/igt@gem_render_copy@yf-tiled-ccs-to-linear.html

  * igt@gem_render_copy@yf-tiled-ccs-to-y-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][267] ([i915#2575] / [i915#5190]) +3 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-11/igt@gem_render_copy@yf-tiled-ccs-to-y-tiled.html

  * igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][268] ([i915#8428]) +6 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-mtlp-4/igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled.html

  * igt@gem_render_tiled_blits@basic:
    - shard-dg1:          NOTRUN -> [SKIP][269] ([i915#4079]) +1 other test skip
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg1-17/igt@gem_render_tiled_blits@basic.html

  * igt@gem_softpin@evict-snoop:
    - shard-dg1:          NOTRUN -> [SKIP][270] ([i915#4885]) +1 other test skip
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg1-14/igt@gem_softpin@evict-snoop.html
    - shard-mtlp:         NOTRUN -> [SKIP][271] ([i915#4885]) +1 other test skip
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-mtlp-2/igt@gem_softpin@evict-snoop.html

  * igt@gem_softpin@evict-snoop-interruptible:
    - shard-dg2:          NOTRUN -> ([SKIP][272], [SKIP][273]) ([i915#2575] / [i915#4885])
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-3/igt@gem_softpin@evict-snoop-interruptible.html
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-11/igt@gem_softpin@evict-snoop-interruptible.html

  * igt@gem_tiled_pread_basic:
    - shard-dg1:          NOTRUN -> ([SKIP][274], [SKIP][275]) ([i915#4079])
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg1-12/igt@gem_tiled_pread_basic.html
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg1-14/igt@gem_tiled_pread_basic.html

  * igt@gem_tiled_pread_pwrite:
    - shard-dg2:          NOTRUN -> [SKIP][276] ([i915#4079])
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-8/igt@gem_tiled_pread_pwrite.html

  * igt@gem_userptr_blits@create-destroy-unsync:
    - shard-dg1:          NOTRUN -> ([SKIP][277], [SKIP][278]) ([i915#3297]) +1 other test ( 2 skip )
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg1-13/igt@gem_userptr_blits@create-destroy-unsync.html
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg1-18/igt@gem_userptr_blits@create-destroy-unsync.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-tglu:         NOTRUN -> ([SKIP][279], [SKIP][280]) ([i915#3297] / [i915#3323])
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-tglu-10/igt@gem_userptr_blits@dmabuf-sync.html
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-tglu-8/igt@gem_userptr_blits@dmabuf-sync.html
    - shard-mtlp:         NOTRUN -> [SKIP][281] ([i915#3297]) +2 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-mtlp-4/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-dg2:          NOTRUN -> ([SKIP][282], [SKIP][283]) ([i915#3297])
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-10/igt@gem_userptr_blits@dmabuf-unsync.html
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-5/igt@gem_userptr_blits@dmabuf-unsync.html
    - shard-rkl:          NOTRUN -> ([SKIP][284], [SKIP][285]) ([i915#3297]) +1 other test ( 2 skip )
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-rkl-5/igt@gem_userptr_blits@dmabuf-unsync.html
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-rkl-4/igt@gem_userptr_blits@dmabuf-unsync.html
    - shard-dg1:          NOTRUN -> [SKIP][286] ([i915#3297]) +2 other tests skip
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg1-13/igt@gem_userptr_blits@dmabuf-unsync.html
    - shard-tglu:         NOTRUN -> ([SKIP][287], [SKIP][288]) ([i915#3297]) +2 other tests ( 2 skip )
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-tglu-5/igt@gem_userptr_blits@dmabuf-unsync.html
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-tglu-2/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_userptr_blits@forbidden-operations:
    - shard-dg1:          NOTRUN -> ([SKIP][289], [SKIP][290]) ([i915#3282] / [i915#3297])
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg1-13/igt@gem_userptr_blits@forbidden-operations.html
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg1-18/igt@gem_userptr_blits@forbidden-operations.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
    - shard-dg1:          NOTRUN -> ([SKIP][291], [SKIP][292]) ([i915#3297] / [i915#4880])
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg1-17/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg1-12/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html

  * igt@gem_userptr_blits@unsync-overlap:
    - shard-tglu-1:       NOTRUN -> [SKIP][293] ([i915#3297]) +1 other test skip
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-tglu-1/igt@gem_userptr_blits@unsync-overlap.html

  * igt@gem_userptr_blits@unsync-unmap-cycles:
    - shard-dg2:          NOTRUN -> [SKIP][294] ([i915#3297]) +1 other test skip
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-8/igt@gem_userptr_blits@unsync-unmap-cycles.html

  * igt@gem_watchdog@default-physical:
    - shard-tglu:         NOTRUN -> ([SKIP][295], [SKIP][296]) ([i915#12961])
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-tglu-6/igt@gem_watchdog@default-physical.html
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-tglu-3/igt@gem_watchdog@default-physical.html
    - shard-dg2:          NOTRUN -> ([SKIP][297], [SKIP][298]) ([i915#12961])
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-8/igt@gem_watchdog@default-physical.html
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-10/igt@gem_watchdog@default-physical.html

  * igt@gem_watchdog@default-virtual:
    - shard-tglu-1:       NOTRUN -> [SKIP][299] ([i915#12961])
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-tglu-1/igt@gem_watchdog@default-virtual.html

  * igt@gen7_exec_parse@basic-rejected:
    - shard-dg2:          NOTRUN -> ([SKIP][300], [SKIP][301]) ([i915#2575]) +1 other test ( 2 skip )
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-2/igt@gen7_exec_parse@basic-rejected.html
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-11/igt@gen7_exec_parse@basic-rejected.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-dg1:          NOTRUN -> ([SKIP][302], [SKIP][303]) ([i915#2527]) +2 other tests ( 2 skip )
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg1-13/igt@gen9_exec_parse@allowed-single.html
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg1-12/igt@gen9_exec_parse@allowed-single.html

  * igt@gen9_exec_parse@basic-rejected-ctx-param:
    - shard-mtlp:         NOTRUN -> [SKIP][304] ([i915#2856]) +1 other test skip
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-mtlp-5/igt@gen9_exec_parse@basic-rejected-ctx-param.html

  * igt@gen9_exec_parse@bb-large:
    - shard-tglu:         NOTRUN -> [SKIP][305] ([i915#2527] / [i915#2856]) +1 other test skip
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-tglu-9/igt@gen9_exec_parse@bb-large.html

  * igt@gen9_exec_parse@bb-start-cmd:
    - shard-tglu-1:       NOTRUN -> [SKIP][306] ([i915#2527] / [i915#2856]) +3 other tests skip
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-tglu-1/igt@gen9_exec_parse@bb-start-cmd.html

  * igt@gen9_exec_parse@bb-start-param:
    - shard-rkl:          NOTRUN -> ([SKIP][307], [SKIP][308]) ([i915#2527]) +1 other test ( 2 skip )
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-rkl-3/igt@gen9_exec_parse@bb-start-param.html
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-rkl-2/igt@gen9_exec_parse@bb-start-param.html
    - shard-dg1:          NOTRUN -> [SKIP][309] ([i915#2527]) +3 other tests skip
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg1-12/igt@gen9_exec_parse@bb-start-param.html

  * igt@gen9_exec_parse@cmd-crossing-page:
    - shard-tglu:         NOTRUN -> ([SKIP][310], [SKIP][311]) ([i915#2527] / [i915#2856]) +2 other tests ( 2 skip )
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-tglu-5/igt@gen9_exec_parse@cmd-crossing-page.html
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-tglu-2/igt@gen9_exec_parse@cmd-crossing-page.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-rkl:          [PASS][312] -> ([ABORT][313], [ABORT][314]) ([i915#9820])
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15721/shard-rkl-7/igt@i915_module_load@reload-with-fault-injection.html
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-rkl-3/igt@i915_module_load@reload-with-fault-injection.html
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-rkl-2/igt@i915_module_load@reload-with-fault-injection.html
    - shard-tglu:         [PASS][315] -> ([PASS][316], [ABORT][317]) ([i915#12817] / [i915#9820])
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15721/shard-tglu-10/igt@i915_module_load@reload-with-fault-injection.html
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-tglu-5/igt@i915_module_load@reload-with-fault-injection.html
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-tglu-2/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_module_load@resize-bar:
    - shard-tglu-1:       NOTRUN -> [SKIP][318] ([i915#6412])
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-tglu-1/igt@i915_module_load@resize-bar.html
    - shard-dg1:          NOTRUN -> [SKIP][319] ([i915#7178])
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg1-12/igt@i915_module_load@resize-bar.html

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0:
    - shard-dg1:          [PASS][320] -> [FAIL][321] ([i915#12739] / [i915#3591])
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15721/shard-dg1-14/igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0.html
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg1-13/igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0.html

  * igt@i915_pm_rps@thresholds-idle-park:
    - shard-dg1:          NOTRUN -> [SKIP][322] ([i915#11681]) +1 other test skip
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg1-14/igt@i915_pm_rps@thresholds-idle-park.html

  * igt@i915_pm_sseu@full-enable:
    - shard-dg1:          NOTRUN -> ([SKIP][323], [SKIP][324]) ([i915#4387])
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg1-18/igt@i915_pm_sseu@full-enable.html
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg1-13/igt@i915_pm_sseu@full-enable.html

  * igt@i915_query@test-query-geometry-subslices:
    - shard-dg1:          NOTRUN -> [SKIP][325] ([i915#5723])
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg1-13/igt@i915_query@test-query-geometry-subslices.html

  * igt@i915_selftest@mock@memory_region:
    - shard-tglu:         NOTRUN -> ([DMESG-WARN][326], [DMESG-WARN][327]) ([i915#9311])
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-tglu-3/igt@i915_selftest@mock@memory_region.html
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-tglu-10/igt@i915_selftest@mock@memory_region.html

  * igt@kms_addfb_basic@addfb25-x-tiled-legacy:
    - shard-mtlp:         NOTRUN -> [SKIP][328] ([i915#4212]) +1 other test skip
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-mtlp-3/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html

  * igt@kms_addfb_basic@addfb25-y-tiled-legacy:
    - shard-dg2:          [PASS][329] -> ([PASS][330], [SKIP][331]) ([i915#2575] / [i915#5190])
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15721/shard-dg2-4/igt@kms_addfb_basic@addfb25-y-tiled-legacy.html
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-3/igt@kms_addfb_basic@addfb25-y-tiled-legacy.html
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-11/igt@kms_addfb_basic@addfb25-y-tiled-legacy.html

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - shard-dg1:          NOTRUN -> ([SKIP][332], [SKIP][333]) ([i915#4215])
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg1-17/igt@kms_addfb_basic@basic-y-tiled-legacy.html
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg1-18/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_addfb_basic@clobberred-modifier:
    - shard-dg2:          NOTRUN -> ([SKIP][334], [SKIP][335]) ([i915#2575] / [i915#4212]) +2 other tests ( 2 skip )
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-5/igt@kms_addfb_basic@clobberred-modifier.html
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-11/igt@kms_addfb_basic@clobberred-modifier.html

  * igt@kms_addfb_basic@tile-pitch-mismatch:
    - shard-dg1:          NOTRUN -> ([SKIP][336], [SKIP][337]) ([i915#4212]) +2 other tests ( 2 skip )
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg1-14/igt@kms_addfb_basic@tile-pitch-mismatch.html
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg1-13/igt@kms_addfb_basic@tile-pitch-mismatch.html
    - shard-dg2:          NOTRUN -> ([SKIP][338], [SKIP][339]) ([i915#4212])
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-1/igt@kms_addfb_basic@tile-pitch-mismatch.html
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-3/igt@kms_addfb_basic@tile-pitch-mismatch.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-y-rc-ccs-cc:
    - shard-rkl:          NOTRUN -> [SKIP][340] ([i915#8709]) +3 other tests skip
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-rkl-5/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-y-rc-ccs-cc.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-rkl:          NOTRUN -> ([SKIP][341], [SKIP][342]) ([i915#1769] / [i915#3555])
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-rkl-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-rkl-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
    - shard-tglu:         NOTRUN -> ([SKIP][343], [SKIP][344]) ([i915#1769] / [i915#3555])
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-tglu-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-tglu-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-0:
    - shard-tglu-1:       NOTRUN -> [SKIP][345] ([i915#5286]) +6 other tests skip
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-tglu-1/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-0:
    - shard-rkl:          NOTRUN -> ([SKIP][346], [SKIP][347]) ([i915#5286]) +3 other tests ( 2 skip )
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-rkl-7/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-rkl-1/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-180:
    - shard-tglu:         NOTRUN -> [SKIP][348] ([i915#5286]) +2 other tests skip
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-tglu-9/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:
    - shard-tglu:         NOTRUN -> ([SKIP][349], [SKIP][350]) ([i915#5286]) +4 other tests ( 2 skip )
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-tglu-8/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-tglu-10/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html
    - shard-dg1:          NOTRUN -> [SKIP][351] ([i915#5286])
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg1-18/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-dg1:          NOTRUN -> ([SKIP][352], [SKIP][353]) ([i915#4538] / [i915#5286]) +3 other tests ( 2 skip )
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg1-13/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg1-18/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-dg1:          NOTRUN -> [SKIP][354] ([i915#4538] / [i915#5286]) +2 other tests skip
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg1-13/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
    - shard-mtlp:         [PASS][355] -> [FAIL][356] ([i915#5138])
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15721/shard-mtlp-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-mtlp-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-dg1:          NOTRUN -> ([SKIP][357], [SKIP][358]) ([i915#3638]) +2 other tests ( 2 skip )
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg1-17/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg1-12/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-dg2:          NOTRUN -> ([SKIP][359], [SKIP][360]) +5 other tests ( 2 skip )
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-2/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-5/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
    - shard-dg1:          NOTRUN -> [SKIP][361] ([i915#3638]) +2 other tests skip
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg1-12/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-rkl:          NOTRUN -> ([SKIP][362], [SKIP][363]) ([i915#3638])
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-rkl-1/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-rkl-5/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-dg2:          NOTRUN -> [SKIP][364] ([i915#5190]) +2 other tests skip
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-11/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-dg2:          NOTRUN -> ([SKIP][365], [SKIP][366]) ([i915#4538] / [i915#5190]) +2 other tests ( 2 skip )
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180.html
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-5/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
    - shard-rkl:          NOTRUN -> ([SKIP][367], [SKIP][368]) +11 other tests ( 2 skip )
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-rkl-5/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-rkl-7/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-90:
    - shard-dg2:          NOTRUN -> [SKIP][369] ([i915#4538] / [i915#5190]) +3 other tests skip
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-1/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-mtlp:         NOTRUN -> [SKIP][370] ([i915#6187])
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-mtlp-3/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-dg1:          NOTRUN -> ([SKIP][371], [SKIP][372]) ([i915#4538]) +4 other tests ( 2 skip )
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg1-13/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg1-18/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-dg1:          NOTRUN -> [SKIP][373] ([i915#4538]) +4 other tests skip
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg1-12/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-snb:          NOTRUN -> ([SKIP][374], [SKIP][375]) +50 other tests ( 2 skip )
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-snb6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-snb4/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
    - shard-mtlp:         NOTRUN -> [SKIP][376] +11 other tests skip
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-mtlp-8/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][377] ([i915#6095]) +69 other tests skip
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-tglu-1/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-3:
    - shard-dg2:          NOTRUN -> ([SKIP][378], [SKIP][379]) ([i915#10307] / [i915#6095]) +23 other tests ( 2 skip )
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-1/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-3.html
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-3/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-3.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][380] ([i915#6095]) +113 other tests skip
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-rkl-1/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:
    - shard-tglu:         NOTRUN -> ([SKIP][381], [SKIP][382]) ([i915#6095]) +79 other tests ( 2 skip )
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-tglu-6/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1.html
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-tglu-3/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
    - shard-dg1:          NOTRUN -> ([SKIP][383], [SKIP][384]) ([i915#12313])
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg1-14/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg1-12/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-1:
    - shard-rkl:          NOTRUN -> ([SKIP][385], [SKIP][386]) ([i915#6095]) +24 other tests ( 2 skip )
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-rkl-7/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-1.html
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-rkl-2/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-ccs:
    - shard-dg1:          NOTRUN -> ([SKIP][387], [SKIP][388]) ([i915#6095]) +60 other tests ( 2 skip )
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg1-17/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg1-14/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc:
    - shard-tglu:         NOTRUN -> [SKIP][389] ([i915#6095]) +9 other tests skip
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-tglu-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
    - shard-rkl:          NOTRUN -> ([SKIP][390], [SKIP][391]) ([i915#12313])
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-rkl-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-rkl-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html
    - shard-tglu-1:       NOTRUN -> [SKIP][392] ([i915#12313])
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-tglu-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html
    - shard-dg1:          NOTRUN -> [SKIP][393] ([i915#12313])
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg1-12/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html
    - shard-tglu:         NOTRUN -> [SKIP][394] ([i915#12313])
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-tglu-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-dg1:          NOTRUN -> ([SKIP][395], [SKIP][396]) ([i915#12805])
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg1-13/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg1-18/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
    - shard-tglu:         NOTRUN -> ([SKIP][397], [SKIP][398]) ([i915#12805])
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-tglu-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-tglu-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-d-hdmi-a-3:
    - shard-dg2:          NOTRUN -> ([SKIP][399], [SKIP][400]) ([i915#6095]) +4 other tests ( 2 skip )
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-3/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-d-hdmi-a-3.html
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-2/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][401] ([i915#6095]) +13 other tests skip
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-4/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-d-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][402] ([i915#6095]) +46 other tests skip
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-mtlp-5/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-d-edp-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][403] ([i915#10307] / [i915#6095]) +168 other tests skip
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][404] ([i915#10307] / [i915#10434] / [i915#6095]) +8 other tests skip
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-4/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-dg2:          NOTRUN -> ([SKIP][405], [SKIP][406]) ([i915#12313])
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-4/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-7/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
    - shard-mtlp:         NOTRUN -> [SKIP][407] ([i915#12313])
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-mtlp-4/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-tglu:         NOTRUN -> ([SKIP][408], [SKIP][409]) ([i915#12313]) +1 other test ( 2 skip )
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-tglu-2/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-tglu-4/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
    - shard-dg2:          NOTRUN -> [SKIP][410] ([i915#12313])
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-1/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [SKIP][411] ([i915#6095]) +207 other tests skip
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg1-13/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-3.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg1:          NOTRUN -> ([SKIP][412], [SKIP][413]) ([i915#3742])
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg1-13/igt@kms_cdclk@mode-transition-all-outputs.html
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg1-14/igt@kms_cdclk@mode-transition-all-outputs.html
    - shard-tglu:         NOTRUN -> ([SKIP][414], [SKIP][415]) ([i915#3742])
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-tglu-3/igt@kms_cdclk@mode-transition-all-outputs.html
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-tglu-10/igt@kms_cdclk@mode-transition-all-outputs.html
    - shard-mtlp:         NOTRUN -> [SKIP][416] ([i915#7213] / [i915#9010])
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-mtlp-3/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@plane-scaling:
    - shard-dg1:          NOTRUN -> [SKIP][417] ([i915#3742])
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg1-17/igt@kms_cdclk@plane-scaling.html

  * igt@kms_cdclk@plane-scaling@pipe-c-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][418] ([i915#4087]) +3 other tests skip
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-3/igt@kms_cdclk@plane-scaling@pipe-c-hdmi-a-3.html

  * igt@kms_chamelium_edid@dp-edid-change-during-suspend:
    - shard-dg2:          NOTRUN -> [SKIP][419] ([i915#7828]) +3 other tests skip
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-4/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html

  * igt@kms_chamelium_edid@hdmi-edid-read:
    - shard-tglu:         NOTRUN -> [SKIP][420] ([i915#7828]) +3 other tests skip
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-tglu-4/igt@kms_chamelium_edid@hdmi-edid-read.html

  * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k:
    - shard-tglu:         NOTRUN -> ([SKIP][421], [SKIP][422]) ([i915#7828]) +8 other tests ( 2 skip )
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-tglu-2/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-tglu-4/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html

  * igt@kms_chamelium_frames@dp-crc-fast:
    - shard-dg2:          NOTRUN -> ([SKIP][423], [SKIP][424]) ([i915#2575] / [i915#7828]) +1 other test ( 2 skip )
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-6/igt@kms_chamelium_frames@dp-crc-fast.html
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-11/igt@kms_chamelium_frames@dp-crc-fast.html

  * igt@kms_chamelium_hpd@dp-hpd-storm:
    - shard-dg2:          NOTRUN -> ([SKIP][425], [SKIP][426]) ([i915#7828]) +4 other tests ( 2 skip )
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-2/igt@kms_chamelium_hpd@dp-hpd-storm.html
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-5/igt@kms_chamelium_hpd@dp-hpd-storm.html
    - shard-rkl:          NOTRUN -> [SKIP][427] ([i915#7828])
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-rkl-3/igt@kms_chamelium_hpd@dp-hpd-storm.html

  * igt@kms_chamelium_hpd@dp-hpd-storm-disable:
    - shard-dg1:          NOTRUN -> ([SKIP][428], [SKIP][429]) ([i915#7828]) +6 other tests ( 2 skip )
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg1-17/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg1-12/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html

  * igt@kms_chamelium_hpd@vga-hpd-fast:
    - shard-tglu-1:       NOTRUN -> [SKIP][430] ([i915#7828]) +7 other tests skip
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-tglu-1/igt@kms_chamelium_hpd@vga-hpd-fast.html
    - shard-dg1:          NOTRUN -> [SKIP][431] ([i915#7828]) +9 other tests skip
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg1-14/igt@kms_chamelium_hpd@vga-hpd-fast.html

  * igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:
    - shard-rkl:          NOTRUN -> ([SKIP][432], [SKIP][433]) ([i915#7828]) +2 other tests ( 2 skip )
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-rkl-5/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-rkl-4/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html
    - shard-mtlp:         NOTRUN -> [SKIP][434] ([i915#7828]) +3 other tests skip
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-mtlp-3/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-tglu:         NOTRUN -> ([SKIP][435], [SKIP][436]) ([i915#3116] / [i915#3299])
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-tglu-7/igt@kms_content_protection@dp-mst-lic-type-0.html
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-tglu-2/igt@kms_content_protection@dp-mst-lic-type-0.html
    - shard-mtlp:         NOTRUN -> [SKIP][437] ([i915#3299])
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-mtlp-7/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg1:          NOTRUN -> ([SKIP][438], [SKIP][439]) ([i915#3299]) +1 other test ( 2 skip )
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg1-13/igt@kms_content_protection@dp-mst-type-0.html
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg1-12/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][440] ([i915#3116] / [i915#3299])
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-tglu-1/igt@kms_content_protection@dp-mst-type-1.html
    - shard-tglu:         NOTRUN -> [SKIP][441] ([i915#3116] / [i915#3299])
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-tglu-7/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@lic-type-0:
    - shard-tglu:         NOTRUN -> ([SKIP][442], [SKIP][443]) ([i915#6944] / [i915#9424]) +2 other tests ( 2 skip )
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-tglu-10/igt@kms_content_protection@lic-type-0.html
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-tglu-3/igt@kms_content_protection@lic-type-0.html
    - shard-dg1:          NOTRUN -> ([SKIP][444], [SKIP][445]) ([i915#9424])
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg1-12/igt@kms_content_protection@lic-type-0.html
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg1-17/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@lic-type-1:
    - shard-mtlp:         NOTRUN -> [SKIP][446] ([i915#6944] / [i915#9424])
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-mtlp-3/igt@kms_content_protection@lic-type-1.html
    - shard-dg2:          NOTRUN -> ([SKIP][447], [SKIP][448]) ([i915#9424])
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-5/igt@kms_content_protection@lic-type-1.html
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-10/igt@kms_content_protection@lic-type-1.html
    - shard-rkl:          NOTRUN -> ([SKIP][449], [SKIP][450]) ([i915#9424])
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-rkl-5/igt@kms_content_protection@lic-type-1.html
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-rkl-4/igt@kms_content_protection@lic-type-1.html
    - shard-dg1:          NOTRUN -> [SKIP][451] ([i915#9424])
   [451]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg1-13/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@srm:
    - shard-dg2:          NOTRUN -> [SKIP][452] ([i915#2575]) +41 other tests skip
   [452]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-11/igt@kms_content_protection@srm.html
    - shard-dg1:          NOTRUN -> ([SKIP][453], [SKIP][454]) ([i915#7116])
   [453]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg1-17/igt@kms_content_protection@srm.html
   [454]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg1-14/igt@kms_content_protection@srm.html
    - shard-mtlp:         NOTRUN -> [SKIP][455] ([i915#6944])
   [455]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-mtlp-2/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@uevent:
    - shard-dg1:          NOTRUN -> ([SKIP][456], [SKIP][457]) ([i915#7116] / [i915#9424])
   [456]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg1-14/igt@kms_content_protection@uevent.html
   [457]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg1-13/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2:          NOTRUN -> ([SKIP][458], [SKIP][459]) ([i915#11453] / [i915#2575])
   [458]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-11/igt@kms_cursor_crc@cursor-offscreen-512x512.html
   [459]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-4/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-offscreen-max-size:
    - shard-dg2:          NOTRUN -> ([SKIP][460], [SKIP][461]) ([i915#2575] / [i915#3555])
   [460]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-11/igt@kms_cursor_crc@cursor-offscreen-max-size.html
   [461]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-2/igt@kms_cursor_crc@cursor-offscreen-max-size.html

  * igt@kms_cursor_crc@cursor-onscreen-max-size:
    - shard-dg2:          NOTRUN -> ([SKIP][462], [SKIP][463]) ([i915#3555])
   [462]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-10/igt@kms_cursor_crc@cursor-onscreen-max-size.html
   [463]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-5/igt@kms_cursor_crc@cursor-onscreen-max-size.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-tglu-1:       NOTRUN -> [SKIP][464] ([i915#11453]) +1 other test skip
   [464]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-tglu-1/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-random-max-size:
    - shard-tglu:         NOTRUN -> ([SKIP][465], [SKIP][466]) ([i915#3555]) +4 other tests ( 2 skip )
   [465]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-tglu-5/igt@kms_cursor_crc@cursor-random-max-size.html
   [466]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-tglu-6/igt@kms_cursor_crc@cursor-random-max-size.html

  * igt@kms_cursor_crc@cursor-rapid-movement-256x85:
    - shard-mtlp:         NOTRUN -> [SKIP][467] ([i915#8814])
   [467]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-mtlp-4/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
    - shard-dg2:          NOTRUN -> [SKIP][468] ([i915#3555])
   [468]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-1/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-tglu:         NOTRUN -> ([SKIP][469], [SKIP][470]) ([i915#11453])
   [469]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-tglu-5/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
   [470]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-tglu-6/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-32x10:
    - shard-dg1:          NOTRUN -> ([SKIP][471], [SKIP][472]) ([i915#3555]) +7 other tests ( 2 skip )
   [471]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg1-18/igt@kms_cursor_crc@cursor-sliding-32x10.html
   [472]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg1-13/igt@kms_cursor_crc@cursor-sliding-32x10.html
    - shard-mtlp:         NOTRUN -> [SKIP][473] ([i915#3555] / [i915#8814])
   [473]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-mtlp-2/igt@kms_cursor_crc@cursor-sliding-32x10.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-rkl:          NOTRUN -> ([SKIP][474], [SKIP][475]) ([i915#11453])
   [474]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-rkl-5/igt@kms_cursor_crc@cursor-sliding-512x512.html
   [475]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-rkl-4/igt@kms_cursor_crc@cursor-sliding-512x512.html
    - shard-dg1:          NOTRUN -> ([SKIP][476], [SKIP][477]) ([i915#11453]) +1 other test ( 2 skip )
   [476]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg1-17/igt@kms_cursor_crc@cursor-sliding-512x512.html
   [477]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg1-18/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-dg1:          NOTRUN -> ([SKIP][478], [SKIP][479]) ([i915#4103] / [i915#4213])
   [478]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg1-17/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
   [479]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg1-14/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-dg2:          NOTRUN -> ([SKIP][480], [SKIP][481]) ([i915#2575] / [i915#5354]) +2 other tests ( 2 skip )
   [480]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [481]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-11/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-mtlp:         NOTRUN -> [SKIP][482] ([i915#9809]) +5 other tests skip
   [482]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-mtlp-7/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-snb:          [PASS][483] -> ([PASS][484], [FAIL][485]) ([i915#2346])
   [483]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15721/shard-snb5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [484]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-snb2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [485]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-snb6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
    - shard-snb:          [PASS][486] -> [FAIL][487] ([i915#2346])
   [486]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15721/shard-snb7/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
   [487]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-snb5/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html

  * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
    - shard-dg1:          NOTRUN -> ([SKIP][488], [SKIP][489]) ([i915#9067])
   [488]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg1-12/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html
   [489]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg1-17/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg2:          NOTRUN -> ([SKIP][490], [SKIP][491]) ([i915#2575] / [i915#4103] / [i915#4213])
   [490]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-11/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
   [491]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
    - shard-dg1:          NOTRUN -> [SKIP][492] ([i915#4103] / [i915#4213])
   [492]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg1-13/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
    - shard-mtlp:         NOTRUN -> [SKIP][493] ([i915#4213])
   [493]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-mtlp-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-tglu-1:       NOTRUN -> [SKIP][494] ([i915#4103])
   [494]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-tglu-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-mtlp:         NOTRUN -> [SKIP][495] ([i915#3555] / [i915#8827])
   [495]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-mtlp-5/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-dg1:          NOTRUN -> ([SKIP][496], [SKIP][497]) ([i915#8588])
   [496]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg1-13/igt@kms_display_modes@mst-extended-mode-negative.html
   [497]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg1-18/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-dg2:          [PASS][498] -> ([SKIP][499], [SKIP][500]) ([i915#2575] / [i915#3555])
   [498]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15721/shard-dg2-10/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [499]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-11/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [500]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-dg2-2/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
    - shard-tglu:         NOTRUN -> ([SKIP][501], [SKIP][502]) ([i915#1769] / [i915#3555] / [i915#3804])
   [501]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-tglu-10/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [502]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-tglu-8/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:
    - shard-tglu:         NOTRUN -> ([SKIP][503], [SKIP][504]) ([i915#3804])
   [503]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-tglu-10/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html
   [504]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-tglu-8/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][505] ([i915#3804])
   [505]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-rkl-5/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html

  * igt@kms_dp_aux_dev:
    - shard-tglu-1:       NOTRUN -> [SKIP][506] ([i915#1257])
   [506]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/shard-tglu-1/igt@kms_dp_aux_dev.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-tglu:         NOTRUN -> [SKIP][507] ([i915#3840])
   [507]: https://intel-gfx-ci.01.org/tree/drm-ti

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12138/index.html
