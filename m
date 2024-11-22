Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4547AD75E4F
	for <igt-dev@archiver.kernel.org>; Fri, 22 Nov 2024 14:10:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E159D10EBAE;
	Fri, 22 Nov 2024 14:10:12 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EE8410EBAE;
 Fri, 22 Nov 2024 14:10:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_vmtb=3A_Introduce_SR-IOV?=
 =?utf-8?q?_VM-level_testing_tool_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Adam Miszczak" <adam.miszczak@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 22 Nov 2024 14:10:12 -0000
Message-ID: <173228461260.1720483.18348027078856291212@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241119074704.3175277-1-adam.miszczak@linux.intel.com>
In-Reply-To: <20241119074704.3175277-1-adam.miszczak@linux.intel.com>
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

Series: vmtb: Introduce SR-IOV VM-level testing tool (rev2)
URL   : https://patchwork.freedesktop.org/series/141049/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_15722_full -> IGTPW_12139_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12139_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12139_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/index.html

Participating hosts (12 -> 12)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12139_full:

### IGT changes ###

#### Possible regressions ####

  * igt@core_hotunplug@unbind-rebind:
    - shard-dg2:          NOTRUN -> ([PASS][1], [SKIP][2])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-7/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-11/igt@core_hotunplug@unbind-rebind.html

  * igt@gem_ccs@large-ctrl-surf-copy:
    - shard-dg1:          NOTRUN -> [SKIP][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg1-17/igt@gem_ccs@large-ctrl-surf-copy.html

  * igt@gem_eio@kms:
    - shard-tglu:         ([PASS][4], [PASS][5]) -> ([DMESG-WARN][6], [DMESG-WARN][7])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-tglu-8/igt@gem_eio@kms.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-tglu-6/igt@gem_eio@kms.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-tglu-6/igt@gem_eio@kms.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-tglu-8/igt@gem_eio@kms.html

  * igt@gem_eio@wait-10ms:
    - shard-mtlp:         NOTRUN -> [ABORT][8]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-mtlp-4/igt@gem_eio@wait-10ms.html

  * igt@gem_exec_nop@basic-parallel:
    - shard-dg1:          [PASS][9] -> [INCOMPLETE][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-dg1-12/igt@gem_exec_nop@basic-parallel.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg1-14/igt@gem_exec_nop@basic-parallel.html

  * igt@gem_exec_suspend@basic-s3-devices:
    - shard-rkl:          ([PASS][11], [PASS][12]) -> ([DMESG-WARN][13], [DMESG-WARN][14]) +18 other tests ( 2 dmesg-warn )
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-rkl-2/igt@gem_exec_suspend@basic-s3-devices.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-rkl-4/igt@gem_exec_suspend@basic-s3-devices.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-rkl-3/igt@gem_exec_suspend@basic-s3-devices.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-rkl-7/igt@gem_exec_suspend@basic-s3-devices.html

  * igt@gem_exec_suspend@basic-s3@lmem0:
    - shard-dg1:          ([PASS][15], [PASS][16]) -> ([INCOMPLETE][17], [PASS][18]) +1 other test ( 1 incomplete, 1 pass )
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-dg1-12/igt@gem_exec_suspend@basic-s3@lmem0.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-dg1-17/igt@gem_exec_suspend@basic-s3@lmem0.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg1-12/igt@gem_exec_suspend@basic-s3@lmem0.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg1-17/igt@gem_exec_suspend@basic-s3@lmem0.html

  * igt@gem_exec_whisper@basic-fds-forked:
    - shard-dg2:          ([PASS][19], [PASS][20]) -> [INCOMPLETE][21]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-dg2-6/igt@gem_exec_whisper@basic-fds-forked.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-dg2-5/igt@gem_exec_whisper@basic-fds-forked.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-3/igt@gem_exec_whisper@basic-fds-forked.html

  * igt@gem_media_fill@media-fill:
    - shard-rkl:          ([PASS][22], [PASS][23]) -> ([DMESG-WARN][24], [PASS][25]) +1 other test ( 1 dmesg-warn, 1 pass )
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-rkl-4/igt@gem_media_fill@media-fill.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-rkl-1/igt@gem_media_fill@media-fill.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-rkl-4/igt@gem_media_fill@media-fill.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-rkl-5/igt@gem_media_fill@media-fill.html

  * igt@i915_pm_rpm@gem-evict-pwrite:
    - shard-dg2:          NOTRUN -> [SKIP][26] +4 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-11/igt@i915_pm_rpm@gem-evict-pwrite.html

  * igt@i915_pm_rpm@gem-execbuf:
    - shard-dg2:          ([PASS][27], [PASS][28]) -> ([PASS][29], [SKIP][30]) +1 other test ( 1 pass, 1 skip )
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-dg2-10/igt@i915_pm_rpm@gem-execbuf.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-dg2-4/igt@i915_pm_rpm@gem-execbuf.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-7/igt@i915_pm_rpm@gem-execbuf.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-11/igt@i915_pm_rpm@gem-execbuf.html

  * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
    - shard-rkl:          NOTRUN -> ([SKIP][31], [SKIP][32])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-rkl-4/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-rkl-5/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html

  * igt@i915_pm_rpm@system-suspend:
    - shard-rkl:          NOTRUN -> ([DMESG-WARN][33], [DMESG-WARN][34]) +4 other tests ( 2 dmesg-warn )
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-rkl-4/igt@i915_pm_rpm@system-suspend.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-rkl-7/igt@i915_pm_rpm@system-suspend.html

  * igt@i915_selftest@live@gt_pm:
    - shard-rkl:          ([PASS][35], [PASS][36]) -> ([DMESG-FAIL][37], [DMESG-FAIL][38]) +1 other test ( 2 dmesg-fail )
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-rkl-3/igt@i915_selftest@live@gt_pm.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-rkl-2/igt@i915_selftest@live@gt_pm.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-rkl-5/igt@i915_selftest@live@gt_pm.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-rkl-7/igt@i915_selftest@live@gt_pm.html

  * igt@i915_selftest@live@sanitycheck:
    - shard-tglu:         ([PASS][39], [PASS][40]) -> ([ABORT][41], [ABORT][42]) +1 other test ( 2 abort )
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-tglu-3/igt@i915_selftest@live@sanitycheck.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-tglu-8/igt@i915_selftest@live@sanitycheck.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-tglu-4/igt@i915_selftest@live@sanitycheck.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-tglu-6/igt@i915_selftest@live@sanitycheck.html

  * igt@i915_suspend@basic-s2idle-without-i915:
    - shard-dg2:          NOTRUN -> [WARN][43]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-11/igt@i915_suspend@basic-s2idle-without-i915.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-snb:          ([PASS][44], [PASS][45]) -> ([PASS][46], [INCOMPLETE][47])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-snb2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-snb7/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-snb7/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-snb5/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2:          [PASS][48] -> [INCOMPLETE][49]
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-dg2-3/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-10/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][50]
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-10/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html

  * igt@kms_cursor_edge_walk@256x256-top-bottom:
    - shard-rkl:          ([PASS][51], [PASS][52]) -> [DMESG-WARN][53] +5 other tests dmesg-warn
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-rkl-7/igt@kms_cursor_edge_walk@256x256-top-bottom.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-rkl-2/igt@kms_cursor_edge_walk@256x256-top-bottom.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-rkl-1/igt@kms_cursor_edge_walk@256x256-top-bottom.html

  * igt@kms_cursor_edge_walk@256x256-top-bottom@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][54] +5 other tests dmesg-warn
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-rkl-1/igt@kms_cursor_edge_walk@256x256-top-bottom@pipe-a-hdmi-a-2.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-dg2:          NOTRUN -> ([SKIP][55], [SKIP][56]) +2 other tests ( 2 skip )
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-10/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-5/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-dg2:          NOTRUN -> ([SKIP][57], [SKIP][58]) ([i915#2575]) +1 other test ( 2 skip )
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-6/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-11/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1:
    - shard-mtlp:         ([PASS][59], [PASS][60], [PASS][61], [PASS][62], [PASS][63]) -> [FAIL][64]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-mtlp-8/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-mtlp-3/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-mtlp-5/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-mtlp-2/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-mtlp-6/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-mtlp-8/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1.html

  * igt@kms_flip@modeset-vs-vblank-race-interruptible@a-hdmi-a4:
    - shard-dg1:          ([PASS][65], [PASS][66]) -> [FAIL][67]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-dg1-14/igt@kms_flip@modeset-vs-vblank-race-interruptible@a-hdmi-a4.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-dg1-18/igt@kms_flip@modeset-vs-vblank-race-interruptible@a-hdmi-a4.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg1-14/igt@kms_flip@modeset-vs-vblank-race-interruptible@a-hdmi-a4.html

  * igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:
    - shard-dg2:          ([PASS][68], [PASS][69]) -> ([CRASH][70], [SKIP][71])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-4/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render:
    - shard-dg2:          ([PASS][72], [PASS][73]) -> ([PASS][74], [INCOMPLETE][75])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-rkl:          ([PASS][76], [PASS][77]) -> ([SKIP][78], [SKIP][79])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-rkl-1/igt@kms_hdmi_inject@inject-audio.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-rkl-4/igt@kms_hdmi_inject@inject-audio.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-rkl-3/igt@kms_hdmi_inject@inject-audio.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-rkl-7/igt@kms_hdmi_inject@inject-audio.html
    - shard-tglu-1:       NOTRUN -> [SKIP][80]
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-tglu-1/igt@kms_hdmi_inject@inject-audio.html
    - shard-tglu:         ([PASS][81], [PASS][82]) -> [SKIP][83]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-tglu-9/igt@kms_hdmi_inject@inject-audio.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-tglu-5/igt@kms_hdmi_inject@inject-audio.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-tglu-8/igt@kms_hdmi_inject@inject-audio.html
    - shard-mtlp:         ([PASS][84], [PASS][85], [PASS][86], [PASS][87], [PASS][88], [PASS][89]) -> [SKIP][90]
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-mtlp-2/igt@kms_hdmi_inject@inject-audio.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-mtlp-3/igt@kms_hdmi_inject@inject-audio.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-mtlp-4/igt@kms_hdmi_inject@inject-audio.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-mtlp-6/igt@kms_hdmi_inject@inject-audio.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-mtlp-5/igt@kms_hdmi_inject@inject-audio.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-mtlp-8/igt@kms_hdmi_inject@inject-audio.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-mtlp-6/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_pipe_crc_basic@disable-crc-after-crtc:
    - shard-mtlp:         ([PASS][91], [PASS][92], [PASS][93], [PASS][94]) -> [INCOMPLETE][95] +1 other test incomplete
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-mtlp-4/igt@kms_pipe_crc_basic@disable-crc-after-crtc.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-mtlp-6/igt@kms_pipe_crc_basic@disable-crc-after-crtc.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-mtlp-2/igt@kms_pipe_crc_basic@disable-crc-after-crtc.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-mtlp-7/igt@kms_pipe_crc_basic@disable-crc-after-crtc.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-mtlp-7/igt@kms_pipe_crc_basic@disable-crc-after-crtc.html

  * igt@kms_plane@pixel-format@pipe-b-plane-3:
    - shard-rkl:          [PASS][96] -> ([DMESG-WARN][97], [DMESG-WARN][98]) +10 other tests ( 2 dmesg-warn )
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-rkl-5/igt@kms_plane@pixel-format@pipe-b-plane-3.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-rkl-3/igt@kms_plane@pixel-format@pipe-b-plane-3.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-rkl-1/igt@kms_plane@pixel-format@pipe-b-plane-3.html

  * igt@kms_psr@psr2-sprite-blt:
    - shard-mtlp:         ([PASS][99], [PASS][100], [PASS][101], [PASS][102], [PASS][103], [PASS][104]) -> [FAIL][105]
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-mtlp-8/igt@kms_psr@psr2-sprite-blt.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-mtlp-5/igt@kms_psr@psr2-sprite-blt.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-mtlp-2/igt@kms_psr@psr2-sprite-blt.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-mtlp-3/igt@kms_psr@psr2-sprite-blt.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-mtlp-6/igt@kms_psr@psr2-sprite-blt.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-mtlp-4/igt@kms_psr@psr2-sprite-blt.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-mtlp-3/igt@kms_psr@psr2-sprite-blt.html

  * igt@perf_pmu@semaphore-busy@vcs0:
    - shard-rkl:          [PASS][106] -> [DMESG-WARN][107] +16 other tests dmesg-warn
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-rkl-5/igt@perf_pmu@semaphore-busy@vcs0.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-rkl-1/igt@perf_pmu@semaphore-busy@vcs0.html

  
#### Warnings ####

  * igt@gem_pxp@create-valid-protected-context:
    - shard-rkl:          [SKIP][108] ([i915#4270]) -> ([TIMEOUT][109], [TIMEOUT][110])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-rkl-5/igt@gem_pxp@create-valid-protected-context.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-rkl-7/igt@gem_pxp@create-valid-protected-context.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-rkl-3/igt@gem_pxp@create-valid-protected-context.html

  * igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:
    - shard-rkl:          ([SKIP][111], [SKIP][112]) ([i915#4270]) -> [TIMEOUT][113]
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-rkl-3/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-rkl-2/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-rkl-2/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html

  * igt@gem_pxp@hw-rejects-pxp-context:
    - shard-rkl:          ([TIMEOUT][114], [TIMEOUT][115]) ([i915#12917]) -> ([FAIL][116], [FAIL][117])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-rkl-1/igt@gem_pxp@hw-rejects-pxp-context.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-rkl-4/igt@gem_pxp@hw-rejects-pxp-context.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-rkl-4/igt@gem_pxp@hw-rejects-pxp-context.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-rkl-7/igt@gem_pxp@hw-rejects-pxp-context.html

  * igt@gem_tiled_swapping@non-threaded:
    - shard-rkl:          ([DMESG-FAIL][118], [DMESG-FAIL][119]) ([i915#12964]) -> ([FAIL][120], [FAIL][121])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-rkl-3/igt@gem_tiled_swapping@non-threaded.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-rkl-2/igt@gem_tiled_swapping@non-threaded.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-rkl-7/igt@gem_tiled_swapping@non-threaded.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-rkl-4/igt@gem_tiled_swapping@non-threaded.html
    - shard-tglu:         ([PASS][122], [FAIL][123]) ([i915#12971]) -> ([FAIL][124], [FAIL][125])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-tglu-4/igt@gem_tiled_swapping@non-threaded.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-tglu-7/igt@gem_tiled_swapping@non-threaded.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-tglu-6/igt@gem_tiled_swapping@non-threaded.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-tglu-8/igt@gem_tiled_swapping@non-threaded.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-rkl:          [ABORT][126] ([i915#9820]) -> ([DMESG-WARN][127], [ABORT][128]) ([i915#9820])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-rkl-5/igt@i915_module_load@reload-with-fault-injection.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-rkl-1/igt@i915_module_load@reload-with-fault-injection.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-rkl-4/igt@i915_module_load@reload-with-fault-injection.html
    - shard-tglu:         ([ABORT][129], [PASS][130]) ([i915#12817] / [i915#9820]) -> ([ABORT][131], [ABORT][132]) ([i915#12817] / [i915#9820])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-tglu-9/igt@i915_module_load@reload-with-fault-injection.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-tglu-5/igt@i915_module_load@reload-with-fault-injection.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-tglu-2/igt@i915_module_load@reload-with-fault-injection.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-tglu-9/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_module_load@resize-bar:
    - shard-dg2:          ([PASS][133], [SKIP][134]) -> ([SKIP][135], [SKIP][136])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-dg2-1/igt@i915_module_load@resize-bar.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-dg2-11/igt@i915_module_load@resize-bar.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-11/igt@i915_module_load@resize-bar.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-4/igt@i915_module_load@resize-bar.html

  * igt@kms_flip@2x-busy-flip:
    - shard-dg2:          [SKIP][137] -> ([SKIP][138], [SKIP][139]) ([i915#2575])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-dg2-7/igt@kms_flip@2x-busy-flip.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-7/igt@kms_flip@2x-busy-flip.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-11/igt@kms_flip@2x-busy-flip.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
    - shard-dg2:          [SKIP][140] ([i915#2575]) -> ([SKIP][141], [SKIP][142]) +1 other test ( 2 skip )
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-dg2-11/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-7/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-1/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-dg2:          ([SKIP][143], [SKIP][144]) -> ([SKIP][145], [SKIP][146]) ([i915#2575])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-dg2-4/igt@kms_flip@2x-flip-vs-dpms.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-dg2-2/igt@kms_flip@2x-flip-vs-dpms.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-4/igt@kms_flip@2x-flip-vs-dpms.html
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-11/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-dg2:          ([SKIP][147], [SKIP][148]) ([i915#2575]) -> ([SKIP][149], [SKIP][150]) +1 other test ( 2 skip )
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-dg2-1/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-dg2-11/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-7/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-1/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-rkl:          ([FAIL][151], [FAIL][152]) ([i915#2122]) -> [DMESG-WARN][153]
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-rkl-3/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-rkl-2/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-rkl-1/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a2:
    - shard-rkl:          [FAIL][154] ([i915#11989]) -> [DMESG-WARN][155] +1 other test dmesg-warn
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-rkl-3/igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a2.html
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-rkl-1/igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a2.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-rkl:          ([SKIP][156], [PASS][157]) ([i915#9519]) -> [SKIP][158]
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-rkl-2/igt@kms_pm_rpm@modeset-non-lpsp.html
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-rkl-3/igt@kms_pm_rpm@modeset-non-lpsp.html
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-rkl-1/igt@kms_pm_rpm@modeset-non-lpsp.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
    - {shard-dg2-9}:      NOTRUN -> [SKIP][159] +3 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-9/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html

  
New tests
---------

  New tests have been introduced between CI_DRM_15722_full and IGTPW_12139_full:

### New IGT tests (3) ###

  * igt@kms_cursor_crc@cursor-onscreen-128x42@pipe-a-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [2.78] s

  * igt@kms_cursor_crc@cursor-random-64x21@pipe-a-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [4.08] s

  * igt@kms_dirtyfb@default-dirtyfb-ioctl@a-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [1.47] s

  

Known issues
------------

  Here are the changes found in IGTPW_12139_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_allocator@default-alignment:
    - shard-dg2:          [PASS][160] -> ([PASS][161], [SKIP][162]) +7 other tests ( 1 pass, 1 skip )
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-dg2-7/igt@api_intel_allocator@default-alignment.html
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-4/igt@api_intel_allocator@default-alignment.html
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-11/igt@api_intel_allocator@default-alignment.html

  * igt@api_intel_bb@blit-reloc-keep-cache:
    - shard-dg1:          NOTRUN -> [SKIP][163] ([i915#8411])
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg1-14/igt@api_intel_bb@blit-reloc-keep-cache.html

  * igt@api_intel_bb@crc32:
    - shard-rkl:          NOTRUN -> ([SKIP][164], [SKIP][165]) ([i915#6230])
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-rkl-5/igt@api_intel_bb@crc32.html
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-rkl-7/igt@api_intel_bb@crc32.html

  * igt@debugfs_test@basic-hwmon:
    - shard-mtlp:         NOTRUN -> [SKIP][166] ([i915#9318])
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-mtlp-6/igt@debugfs_test@basic-hwmon.html
    - shard-rkl:          NOTRUN -> ([SKIP][167], [SKIP][168]) ([i915#9318])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-rkl-3/igt@debugfs_test@basic-hwmon.html
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-rkl-7/igt@debugfs_test@basic-hwmon.html
    - shard-tglu-1:       NOTRUN -> [SKIP][169] ([i915#9318])
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-tglu-1/igt@debugfs_test@basic-hwmon.html

  * igt@drm_fdinfo@all-busy-check-all:
    - shard-dg2:          NOTRUN -> ([SKIP][170], [SKIP][171]) ([i915#12506] / [i915#8414])
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-11/igt@drm_fdinfo@all-busy-check-all.html
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-4/igt@drm_fdinfo@all-busy-check-all.html

  * igt@drm_fdinfo@isolation:
    - shard-dg1:          NOTRUN -> [SKIP][172] ([i915#8414]) +6 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg1-17/igt@drm_fdinfo@isolation.html

  * igt@drm_fdinfo@virtual-busy:
    - shard-dg1:          NOTRUN -> ([SKIP][173], [SKIP][174]) ([i915#8414])
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg1-14/igt@drm_fdinfo@virtual-busy.html
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg1-18/igt@drm_fdinfo@virtual-busy.html

  * igt@gem_basic@multigpu-create-close:
    - shard-dg2:          NOTRUN -> ([SKIP][175], [SKIP][176]) ([i915#7697])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-7/igt@gem_basic@multigpu-create-close.html
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-5/igt@gem_basic@multigpu-create-close.html

  * igt@gem_caching@read-writes:
    - shard-mtlp:         NOTRUN -> [SKIP][177] ([i915#4873])
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-mtlp-7/igt@gem_caching@read-writes.html

  * igt@gem_caching@writes:
    - shard-rkl:          NOTRUN -> ([DMESG-WARN][178], [DMESG-WARN][179]) ([i915#12917])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-rkl-4/igt@gem_caching@writes.html
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-rkl-3/igt@gem_caching@writes.html

  * igt@gem_ccs@block-multicopy-compressed:
    - shard-rkl:          NOTRUN -> ([SKIP][180], [SKIP][181]) ([i915#9323])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-rkl-4/igt@gem_ccs@block-multicopy-compressed.html
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-rkl-2/igt@gem_ccs@block-multicopy-compressed.html
    - shard-dg1:          NOTRUN -> ([SKIP][182], [SKIP][183]) ([i915#9323])
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg1-14/igt@gem_ccs@block-multicopy-compressed.html
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg1-12/igt@gem_ccs@block-multicopy-compressed.html
    - shard-tglu:         NOTRUN -> ([SKIP][184], [SKIP][185]) ([i915#9323])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-tglu-8/igt@gem_ccs@block-multicopy-compressed.html
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-tglu-5/igt@gem_ccs@block-multicopy-compressed.html
    - shard-mtlp:         NOTRUN -> [SKIP][186] ([i915#9323])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-mtlp-2/igt@gem_ccs@block-multicopy-compressed.html

  * igt@gem_ccs@ctrl-surf-copy:
    - shard-tglu:         NOTRUN -> ([SKIP][187], [SKIP][188]) ([i915#3555] / [i915#9323]) +1 other test ( 2 skip )
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-tglu-8/igt@gem_ccs@ctrl-surf-copy.html
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-tglu-5/igt@gem_ccs@ctrl-surf-copy.html

  * igt@gem_ccs@ctrl-surf-copy-new-ctx:
    - shard-tglu-1:       NOTRUN -> [SKIP][189] ([i915#9323])
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-tglu-1/igt@gem_ccs@ctrl-surf-copy-new-ctx.html

  * igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-lmem0-lmem0:
    - shard-dg2:          [PASS][190] -> [INCOMPLETE][191] ([i915#12392] / [i915#7297])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-dg2-10/igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-lmem0-lmem0.html
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-2/igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-lmem0-lmem0.html

  * igt@gem_create@create-ext-cpu-access-big:
    - shard-tglu-1:       NOTRUN -> [SKIP][192] ([i915#6335])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-tglu-1/igt@gem_create@create-ext-cpu-access-big.html
    - shard-tglu:         NOTRUN -> [SKIP][193] ([i915#6335])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-tglu-10/igt@gem_create@create-ext-cpu-access-big.html

  * igt@gem_create@create-ext-set-pat:
    - shard-tglu:         NOTRUN -> ([SKIP][194], [SKIP][195]) ([i915#8562])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-tglu-8/igt@gem_create@create-ext-set-pat.html
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-tglu-6/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_freq@sysfs:
    - shard-dg2:          NOTRUN -> ([FAIL][196], [SKIP][197]) ([i915#2575] / [i915#9561])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-4/igt@gem_ctx_freq@sysfs.html
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-11/igt@gem_ctx_freq@sysfs.html

  * igt@gem_ctx_freq@sysfs@gt0:
    - shard-dg2:          NOTRUN -> [FAIL][198] ([i915#9561])
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-4/igt@gem_ctx_freq@sysfs@gt0.html

  * igt@gem_ctx_param@invalid-param-set:
    - shard-dg2:          ([PASS][199], [PASS][200]) -> ([SKIP][201], [PASS][202]) ([i915#2575]) +66 other tests ( 1 pass, 1 skip )
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-dg2-8/igt@gem_ctx_param@invalid-param-set.html
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-dg2-10/igt@gem_ctx_param@invalid-param-set.html
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-11/igt@gem_ctx_param@invalid-param-set.html
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-6/igt@gem_ctx_param@invalid-param-set.html

  * igt@gem_ctx_persistence@engines-mixed:
    - shard-snb:          NOTRUN -> ([SKIP][203], [SKIP][204]) ([i915#1099]) +1 other test ( 2 skip )
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-snb6/igt@gem_ctx_persistence@engines-mixed.html
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-snb7/igt@gem_ctx_persistence@engines-mixed.html

  * igt@gem_ctx_persistence@hostile:
    - shard-tglu:         NOTRUN -> ([FAIL][205], [FAIL][206]) ([i915#11980] / [i915#12580])
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-tglu-4/igt@gem_ctx_persistence@hostile.html
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-tglu-10/igt@gem_ctx_persistence@hostile.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-dg2:          NOTRUN -> [SKIP][207] ([i915#280])
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-2/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_eio@hibernate:
    - shard-dg1:          NOTRUN -> [ABORT][208] ([i915#7975] / [i915#8213])
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg1-14/igt@gem_eio@hibernate.html
    - shard-dg2:          NOTRUN -> [ABORT][209] ([i915#10030] / [i915#7975] / [i915#8213])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-1/igt@gem_eio@hibernate.html

  * igt@gem_eio@kms:
    - shard-dg1:          NOTRUN -> ([PASS][210], [FAIL][211]) ([i915#5784])
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg1-17/igt@gem_eio@kms.html
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg1-18/igt@gem_eio@kms.html

  * igt@gem_eio@reset-stress:
    - shard-dg1:          NOTRUN -> [FAIL][212] ([i915#12543] / [i915#5784])
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg1-13/igt@gem_eio@reset-stress.html

  * igt@gem_eio@unwedge-stress:
    - shard-dg1:          NOTRUN -> [FAIL][213] ([i915#12714] / [i915#5784])
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg1-14/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_balancer@bonded-pair:
    - shard-dg1:          NOTRUN -> [SKIP][214] ([i915#4771])
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg1-18/igt@gem_exec_balancer@bonded-pair.html

  * igt@gem_exec_balancer@invalid-bonds:
    - shard-dg2:          NOTRUN -> ([SKIP][215], [SKIP][216]) ([i915#4036])
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-1/igt@gem_exec_balancer@invalid-bonds.html
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-7/igt@gem_exec_balancer@invalid-bonds.html

  * igt@gem_exec_balancer@smoke:
    - shard-dg2:          NOTRUN -> [SKIP][217] ([i915#2575]) +45 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-11/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_capture@capture-invisible@lmem0:
    - shard-dg2:          NOTRUN -> [SKIP][218] ([i915#6334]) +1 other test skip
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-6/igt@gem_exec_capture@capture-invisible@lmem0.html

  * igt@gem_exec_fence@concurrent:
    - shard-mtlp:         NOTRUN -> [SKIP][219] ([i915#4812]) +1 other test skip
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-mtlp-7/igt@gem_exec_fence@concurrent.html

  * igt@gem_exec_fence@submit:
    - shard-dg2:          NOTRUN -> ([SKIP][220], [SKIP][221]) ([i915#4812])
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-5/igt@gem_exec_fence@submit.html
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-10/igt@gem_exec_fence@submit.html
    - shard-dg1:          NOTRUN -> ([SKIP][222], [SKIP][223]) ([i915#4812]) +1 other test ( 2 skip )
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg1-18/igt@gem_exec_fence@submit.html
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg1-17/igt@gem_exec_fence@submit.html

  * igt@gem_exec_flush@basic-uc-ro-default:
    - shard-dg1:          NOTRUN -> [SKIP][224] ([i915#3539] / [i915#4852]) +1 other test skip
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg1-14/igt@gem_exec_flush@basic-uc-ro-default.html

  * igt@gem_exec_flush@basic-wb-prw-default:
    - shard-dg2:          NOTRUN -> ([SKIP][225], [SKIP][226]) ([i915#3539] / [i915#4852])
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-7/igt@gem_exec_flush@basic-wb-prw-default.html
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-5/igt@gem_exec_flush@basic-wb-prw-default.html
    - shard-dg1:          NOTRUN -> ([SKIP][227], [SKIP][228]) ([i915#3539] / [i915#4852]) +1 other test ( 2 skip )
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg1-18/igt@gem_exec_flush@basic-wb-prw-default.html
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg1-14/igt@gem_exec_flush@basic-wb-prw-default.html

  * igt@gem_exec_parallel@userptr:
    - shard-rkl:          ([PASS][229], [PASS][230]) -> ([DMESG-WARN][231], [DMESG-WARN][232]) ([i915#12964]) +2 other tests ( 2 dmesg-warn )
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-rkl-2/igt@gem_exec_parallel@userptr.html
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-rkl-3/igt@gem_exec_parallel@userptr.html
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-rkl-4/igt@gem_exec_parallel@userptr.html
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-rkl-7/igt@gem_exec_parallel@userptr.html

  * igt@gem_exec_reloc@basic-gtt-cpu:
    - shard-rkl:          NOTRUN -> ([SKIP][233], [SKIP][234]) ([i915#3281]) +3 other tests ( 2 skip )
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-rkl-2/igt@gem_exec_reloc@basic-gtt-cpu.html
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-rkl-4/igt@gem_exec_reloc@basic-gtt-cpu.html

  * igt@gem_exec_reloc@basic-gtt-wc:
    - shard-dg2:          NOTRUN -> ([SKIP][235], [SKIP][236]) ([i915#2575] / [i915#3281]) +1 other test ( 2 skip )
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-7/igt@gem_exec_reloc@basic-gtt-wc.html
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-11/igt@gem_exec_reloc@basic-gtt-wc.html

  * igt@gem_exec_reloc@basic-softpin:
    - shard-mtlp:         NOTRUN -> [SKIP][237] ([i915#3281])
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-mtlp-4/igt@gem_exec_reloc@basic-softpin.html

  * igt@gem_exec_reloc@basic-wc:
    - shard-dg2:          NOTRUN -> ([SKIP][238], [SKIP][239]) ([i915#3281]) +4 other tests ( 2 skip )
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-3/igt@gem_exec_reloc@basic-wc.html
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-7/igt@gem_exec_reloc@basic-wc.html

  * igt@gem_exec_reloc@basic-wc-gtt-noreloc:
    - shard-dg1:          NOTRUN -> ([SKIP][240], [SKIP][241]) ([i915#3281]) +6 other tests ( 2 skip )
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg1-12/igt@gem_exec_reloc@basic-wc-gtt-noreloc.html
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg1-17/igt@gem_exec_reloc@basic-wc-gtt-noreloc.html

  * igt@gem_exec_reloc@basic-write-wc-active:
    - shard-dg1:          NOTRUN -> [SKIP][242] ([i915#3281]) +1 other test skip
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg1-13/igt@gem_exec_reloc@basic-write-wc-active.html

  * igt@gem_exec_schedule@preempt-queue:
    - shard-mtlp:         NOTRUN -> [SKIP][243] ([i915#4537] / [i915#4812])
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-mtlp-2/igt@gem_exec_schedule@preempt-queue.html

  * igt@gem_exec_schedule@preempt-queue-chain:
    - shard-dg2:          NOTRUN -> [SKIP][244] ([i915#4537] / [i915#4812]) +1 other test skip
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-8/igt@gem_exec_schedule@preempt-queue-chain.html

  * igt@gem_exec_schedule@preempt-queue-contexts:
    - shard-dg1:          NOTRUN -> [SKIP][245] ([i915#4812]) +1 other test skip
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg1-14/igt@gem_exec_schedule@preempt-queue-contexts.html

  * igt@gem_exec_suspend@basic-s4-devices@lmem0:
    - shard-dg2:          NOTRUN -> [ABORT][246] ([i915#7975] / [i915#8213])
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-8/igt@gem_exec_suspend@basic-s4-devices@lmem0.html

  * igt@gem_fence_thrash@bo-write-verify-none:
    - shard-dg2:          NOTRUN -> ([SKIP][247], [SKIP][248]) ([i915#4860])
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-5/igt@gem_fence_thrash@bo-write-verify-none.html
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-10/igt@gem_fence_thrash@bo-write-verify-none.html

  * igt@gem_fenced_exec_thrash@no-spare-fences:
    - shard-mtlp:         NOTRUN -> [SKIP][249] ([i915#4860])
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-mtlp-4/igt@gem_fenced_exec_thrash@no-spare-fences.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-busy:
    - shard-dg1:          NOTRUN -> [SKIP][250] ([i915#4860])
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg1-13/igt@gem_fenced_exec_thrash@no-spare-fences-busy.html

  * igt@gem_lmem_swapping@heavy-verify-random:
    - shard-dg2:          NOTRUN -> [SKIP][251] ([i915#12936]) +1 other test skip
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-11/igt@gem_lmem_swapping@heavy-verify-random.html

  * igt@gem_lmem_swapping@heavy-verify-random-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][252] ([i915#12193])
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg1-17/igt@gem_lmem_swapping@heavy-verify-random-ccs.html
    - shard-tglu:         NOTRUN -> ([SKIP][253], [SKIP][254]) ([i915#4613]) +3 other tests ( 2 skip )
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-tglu-3/igt@gem_lmem_swapping@heavy-verify-random-ccs.html
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-tglu-5/igt@gem_lmem_swapping@heavy-verify-random-ccs.html
    - shard-mtlp:         NOTRUN -> [SKIP][255] ([i915#4613])
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-mtlp-5/igt@gem_lmem_swapping@heavy-verify-random-ccs.html
    - shard-glk:          NOTRUN -> [SKIP][256] ([i915#4613])
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-glk8/igt@gem_lmem_swapping@heavy-verify-random-ccs.html
    - shard-dg2:          NOTRUN -> ([SKIP][257], [SKIP][258]) ([i915#12936])
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-6/igt@gem_lmem_swapping@heavy-verify-random-ccs.html
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-4/igt@gem_lmem_swapping@heavy-verify-random-ccs.html

  * igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][259] ([i915#4565])
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg1-17/igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0.html

  * igt@gem_lmem_swapping@massive:
    - shard-dg2:          [PASS][260] -> [SKIP][261] ([i915#12936]) +1 other test skip
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-dg2-7/igt@gem_lmem_swapping@massive.html
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-11/igt@gem_lmem_swapping@massive.html

  * igt@gem_lmem_swapping@massive-random:
    - shard-dg2:          [PASS][262] -> ([PASS][263], [SKIP][264]) ([i915#12936]) +1 other test ( 1 pass, 1 skip )
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-dg2-3/igt@gem_lmem_swapping@massive-random.html
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-7/igt@gem_lmem_swapping@massive-random.html
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-11/igt@gem_lmem_swapping@massive-random.html

  * igt@gem_lmem_swapping@parallel-random:
    - shard-dg2:          ([PASS][265], [PASS][266]) -> [SKIP][267] ([i915#12936])
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-dg2-8/igt@gem_lmem_swapping@parallel-random.html
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-dg2-10/igt@gem_lmem_swapping@parallel-random.html
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-6/igt@gem_lmem_swapping@parallel-random.html

  * igt@gem_lmem_swapping@parallel-random-verify:
    - shard-tglu-1:       NOTRUN -> [SKIP][268] ([i915#4613]) +2 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-tglu-1/igt@gem_lmem_swapping@parallel-random-verify.html

  * igt@gem_lmem_swapping@parallel-random-verify-ccs:
    - shard-rkl:          NOTRUN -> ([SKIP][269], [SKIP][270]) ([i915#4613]) +2 other tests ( 2 skip )
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-rkl-3/igt@gem_lmem_swapping@parallel-random-verify-ccs.html
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-rkl-5/igt@gem_lmem_swapping@parallel-random-verify-ccs.html

  * igt@gem_lmem_swapping@random-engines:
    - shard-tglu:         NOTRUN -> [SKIP][271] ([i915#4613])
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-tglu-2/igt@gem_lmem_swapping@random-engines.html

  * igt@gem_lmem_swapping@smem-oom@lmem0:
    - shard-dg2:          NOTRUN -> ([TIMEOUT][272], [PASS][273]) ([i915#5493])
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-4/igt@gem_lmem_swapping@smem-oom@lmem0.html
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-10/igt@gem_lmem_swapping@smem-oom@lmem0.html

  * igt@gem_media_vme:
    - shard-tglu:         NOTRUN -> ([SKIP][274], [SKIP][275]) ([i915#284])
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-tglu-5/igt@gem_media_vme.html
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-tglu-8/igt@gem_media_vme.html

  * igt@gem_mmap@basic-small-bo:
    - shard-dg2:          NOTRUN -> ([SKIP][276], [SKIP][277]) ([i915#2575] / [i915#4083])
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-11/igt@gem_mmap@basic-small-bo.html
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-7/igt@gem_mmap@basic-small-bo.html
    - shard-mtlp:         NOTRUN -> [SKIP][278] ([i915#4083]) +1 other test skip
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-mtlp-2/igt@gem_mmap@basic-small-bo.html

  * igt@gem_mmap_gtt@basic-read-write:
    - shard-dg2:          NOTRUN -> [SKIP][279] ([i915#4077])
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-10/igt@gem_mmap_gtt@basic-read-write.html

  * igt@gem_mmap_gtt@basic-write-read-distinct:
    - shard-mtlp:         NOTRUN -> [SKIP][280] ([i915#4077]) +4 other tests skip
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-mtlp-1/igt@gem_mmap_gtt@basic-write-read-distinct.html

  * igt@gem_mmap_gtt@cpuset-big-copy-odd:
    - shard-dg2:          NOTRUN -> ([SKIP][281], [SKIP][282]) ([i915#4077]) +5 other tests ( 2 skip )
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-10/igt@gem_mmap_gtt@cpuset-big-copy-odd.html
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-1/igt@gem_mmap_gtt@cpuset-big-copy-odd.html
    - shard-dg1:          NOTRUN -> [SKIP][283] ([i915#4077]) +5 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg1-13/igt@gem_mmap_gtt@cpuset-big-copy-odd.html

  * igt@gem_mmap_wc@close:
    - shard-dg1:          NOTRUN -> ([SKIP][284], [SKIP][285]) ([i915#4083]) +2 other tests ( 2 skip )
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg1-14/igt@gem_mmap_wc@close.html
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg1-12/igt@gem_mmap_wc@close.html

  * igt@gem_mmap_wc@copy:
    - shard-dg1:          NOTRUN -> [SKIP][286] ([i915#4083]) +3 other tests skip
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg1-17/igt@gem_mmap_wc@copy.html

  * igt@gem_mmap_wc@fault-concurrent:
    - shard-dg2:          NOTRUN -> [SKIP][287] ([i915#4083])
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-8/igt@gem_mmap_wc@fault-concurrent.html

  * igt@gem_partial_pwrite_pread@reads:
    - shard-rkl:          NOTRUN -> [SKIP][288] ([i915#3282])
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-rkl-5/igt@gem_partial_pwrite_pread@reads.html

  * igt@gem_partial_pwrite_pread@write-display:
    - shard-dg1:          NOTRUN -> [SKIP][289] ([i915#3282]) +2 other tests skip
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg1-13/igt@gem_partial_pwrite_pread@write-display.html

  * igt@gem_pread@display:
    - shard-dg2:          NOTRUN -> [SKIP][290] ([i915#3282]) +1 other test skip
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-2/igt@gem_pread@display.html

  * igt@gem_pread@snoop:
    - shard-rkl:          NOTRUN -> ([SKIP][291], [SKIP][292]) ([i915#3282])
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-rkl-1/igt@gem_pread@snoop.html
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-rkl-4/igt@gem_pread@snoop.html
    - shard-dg1:          NOTRUN -> ([SKIP][293], [SKIP][294]) ([i915#3282]) +1 other test ( 2 skip )
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg1-12/igt@gem_pread@snoop.html
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg1-17/igt@gem_pread@snoop.html
    - shard-mtlp:         NOTRUN -> [SKIP][295] ([i915#3282]) +1 other test skip
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-mtlp-8/igt@gem_pread@snoop.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-tglu:         NOTRUN -> ([WARN][296], [WARN][297]) ([i915#2658])
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-tglu-8/igt@gem_pwrite@basic-exhaustion.html
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-tglu-5/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pwrite@basic-self:
    - shard-dg2:          NOTRUN -> ([SKIP][298], [SKIP][299]) ([i915#3282])
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-3/igt@gem_pwrite@basic-self.html
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-5/igt@gem_pwrite@basic-self.html

  * igt@gem_pxp@create-protected-buffer:
    - shard-dg2:          NOTRUN -> ([SKIP][300], [SKIP][301]) ([i915#4270])
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-5/igt@gem_pxp@create-protected-buffer.html
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-10/igt@gem_pxp@create-protected-buffer.html

  * igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:
    - shard-dg1:          NOTRUN -> ([SKIP][302], [SKIP][303]) ([i915#4270]) +2 other tests ( 2 skip )
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg1-12/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg1-14/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html

  * igt@gem_pxp@protected-encrypted-src-copy-not-readible:
    - shard-dg2:          NOTRUN -> ([SKIP][304], [SKIP][305]) ([i915#2575] / [i915#4270])
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-11/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-6/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html
    - shard-rkl:          NOTRUN -> ([TIMEOUT][306], [TIMEOUT][307]) ([i915#12917]) +1 other test ( 2 timeout )
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-rkl-4/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-rkl-1/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html

  * igt@gem_pxp@verify-pxp-execution-after-suspend-resume:
    - shard-dg1:          NOTRUN -> [SKIP][308] ([i915#4270]) +1 other test skip
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg1-13/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html

  * igt@gem_readwrite@beyond-eob:
    - shard-dg2:          NOTRUN -> ([SKIP][309], [SKIP][310]) ([i915#2575] / [i915#3282])
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-6/igt@gem_readwrite@beyond-eob.html
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-11/igt@gem_readwrite@beyond-eob.html

  * igt@gem_render_copy@linear-to-vebox-yf-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][311] ([i915#2575] / [i915#5190]) +1 other test skip
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-11/igt@gem_render_copy@linear-to-vebox-yf-tiled.html

  * igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][312] ([i915#5190] / [i915#8428]) +1 other test skip
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-8/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled.html

  * igt@gem_render_copy@yf-tiled-ccs-to-y-tiled:
    - shard-dg2:          NOTRUN -> ([SKIP][313], [SKIP][314]) ([i915#5190] / [i915#8428]) +4 other tests ( 2 skip )
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-7/igt@gem_render_copy@yf-tiled-ccs-to-y-tiled.html
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-1/igt@gem_render_copy@yf-tiled-ccs-to-y-tiled.html

  * igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][315] ([i915#8428]) +6 other tests skip
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-mtlp-2/igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled.html

  * igt@gem_render_copy@yf-tiled-to-vebox-x-tiled:
    - shard-dg2:          NOTRUN -> ([SKIP][316], [SKIP][317]) ([i915#2575] / [i915#5190] / [i915#8428]) +1 other test ( 2 skip )
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-11/igt@gem_render_copy@yf-tiled-to-vebox-x-tiled.html
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-6/igt@gem_render_copy@yf-tiled-to-vebox-x-tiled.html

  * igt@gem_softpin@evict-snoop-interruptible:
    - shard-dg1:          NOTRUN -> ([SKIP][318], [SKIP][319]) ([i915#4885])
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg1-18/igt@gem_softpin@evict-snoop-interruptible.html
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg1-13/igt@gem_softpin@evict-snoop-interruptible.html
    - shard-mtlp:         NOTRUN -> [SKIP][320] ([i915#4885])
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-mtlp-3/igt@gem_softpin@evict-snoop-interruptible.html

  * igt@gem_userptr_blits@coherency-sync:
    - shard-dg1:          NOTRUN -> ([SKIP][321], [SKIP][322]) ([i915#3297])
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg1-13/igt@gem_userptr_blits@coherency-sync.html
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg1-18/igt@gem_userptr_blits@coherency-sync.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-tglu:         NOTRUN -> [SKIP][323] ([i915#3297] / [i915#3323])
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-tglu-2/igt@gem_userptr_blits@dmabuf-sync.html
    - shard-rkl:          NOTRUN -> ([SKIP][324], [SKIP][325]) ([i915#3297] / [i915#3323])
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-rkl-1/igt@gem_userptr_blits@dmabuf-sync.html
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-rkl-4/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-dg2:          NOTRUN -> ([SKIP][326], [SKIP][327]) ([i915#3297])
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-10/igt@gem_userptr_blits@dmabuf-unsync.html
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-1/igt@gem_userptr_blits@dmabuf-unsync.html
    - shard-rkl:          NOTRUN -> [SKIP][328] ([i915#3297])
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-rkl-5/igt@gem_userptr_blits@dmabuf-unsync.html
    - shard-tglu-1:       NOTRUN -> [SKIP][329] ([i915#3297]) +1 other test skip
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-tglu-1/igt@gem_userptr_blits@dmabuf-unsync.html
    - shard-dg1:          NOTRUN -> [SKIP][330] ([i915#3297]) +1 other test skip
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg1-13/igt@gem_userptr_blits@dmabuf-unsync.html
    - shard-tglu:         NOTRUN -> [SKIP][331] ([i915#3297])
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-tglu-10/igt@gem_userptr_blits@dmabuf-unsync.html
    - shard-mtlp:         NOTRUN -> [SKIP][332] ([i915#3297]) +1 other test skip
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-mtlp-3/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy:
    - shard-dg2:          NOTRUN -> ([SKIP][333], [SKIP][334]) ([i915#3297] / [i915#4880])
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-3/igt@gem_userptr_blits@map-fixed-invalidate-busy.html
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-5/igt@gem_userptr_blits@map-fixed-invalidate-busy.html
    - shard-dg1:          NOTRUN -> ([SKIP][335], [SKIP][336]) ([i915#3297] / [i915#4880]) +1 other test ( 2 skip )
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg1-18/igt@gem_userptr_blits@map-fixed-invalidate-busy.html
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg1-12/igt@gem_userptr_blits@map-fixed-invalidate-busy.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
    - shard-dg2:          NOTRUN -> ([SKIP][337], [SKIP][338]) ([i915#2575] / [i915#3297] / [i915#4880])
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-7/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-11/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html

  * igt@gem_userptr_blits@unsync-unmap-cycles:
    - shard-dg2:          NOTRUN -> [SKIP][339] ([i915#3297])
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-2/igt@gem_userptr_blits@unsync-unmap-cycles.html
    - shard-rkl:          NOTRUN -> ([SKIP][340], [SKIP][341]) ([i915#3297])
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-rkl-5/igt@gem_userptr_blits@unsync-unmap-cycles.html
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-rkl-7/igt@gem_userptr_blits@unsync-unmap-cycles.html

  * igt@gem_watchdog@default-virtual:
    - shard-dg2:          NOTRUN -> [SKIP][342] ([i915#12961])
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-8/igt@gem_watchdog@default-virtual.html

  * igt@gen7_exec_parse@basic-rejected:
    - shard-dg2:          NOTRUN -> ([SKIP][343], [SKIP][344]) +2 other tests ( 2 skip )
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-7/igt@gen7_exec_parse@basic-rejected.html
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-5/igt@gen7_exec_parse@basic-rejected.html

  * igt@gen9_exec_parse@bb-start-cmd:
    - shard-dg2:          NOTRUN -> ([SKIP][345], [SKIP][346]) ([i915#2856])
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-5/igt@gen9_exec_parse@bb-start-cmd.html
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-3/igt@gen9_exec_parse@bb-start-cmd.html

  * igt@gen9_exec_parse@bb-start-param:
    - shard-dg2:          NOTRUN -> ([SKIP][347], [SKIP][348]) ([i915#2575] / [i915#2856])
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-6/igt@gen9_exec_parse@bb-start-param.html
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-11/igt@gen9_exec_parse@bb-start-param.html
    - shard-rkl:          NOTRUN -> ([SKIP][349], [SKIP][350]) ([i915#2527]) +1 other test ( 2 skip )
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-rkl-1/igt@gen9_exec_parse@bb-start-param.html
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-rkl-4/igt@gen9_exec_parse@bb-start-param.html
    - shard-dg1:          NOTRUN -> ([SKIP][351], [SKIP][352]) ([i915#2527]) +2 other tests ( 2 skip )
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg1-17/igt@gen9_exec_parse@bb-start-param.html
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg1-18/igt@gen9_exec_parse@bb-start-param.html
    - shard-mtlp:         NOTRUN -> [SKIP][353] ([i915#2856])
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-mtlp-4/igt@gen9_exec_parse@bb-start-param.html

  * igt@gen9_exec_parse@cmd-crossing-page:
    - shard-tglu:         NOTRUN -> ([SKIP][354], [SKIP][355]) ([i915#2527] / [i915#2856]) +3 other tests ( 2 skip )
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-tglu-9/igt@gen9_exec_parse@cmd-crossing-page.html
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-tglu-2/igt@gen9_exec_parse@cmd-crossing-page.html

  * igt@gen9_exec_parse@secure-batches:
    - shard-dg1:          NOTRUN -> [SKIP][356] ([i915#2527]) +1 other test skip
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg1-18/igt@gen9_exec_parse@secure-batches.html

  * igt@gen9_exec_parse@valid-registers:
    - shard-tglu-1:       NOTRUN -> [SKIP][357] ([i915#2527] / [i915#2856]) +2 other tests skip
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-tglu-1/igt@gen9_exec_parse@valid-registers.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-dg1:          [PASS][358] -> ([ABORT][359], [PASS][360]) ([i915#9820])
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-dg1-13/igt@i915_module_load@reload-with-fault-injection.html
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg1-12/igt@i915_module_load@reload-with-fault-injection.html
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg1-17/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_module_load@resize-bar:
    - shard-dg1:          NOTRUN -> [SKIP][361] ([i915#7178])
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg1-14/igt@i915_module_load@resize-bar.html

  * igt@i915_pm_freq_api@freq-reset:
    - shard-tglu-1:       NOTRUN -> [SKIP][362] ([i915#8399])
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-tglu-1/igt@i915_pm_freq_api@freq-reset.html

  * igt@i915_pm_freq_api@freq-suspend:
    - shard-dg2:          NOTRUN -> ([SKIP][363], [INCOMPLETE][364]) ([i915#12455] / [i915#2575])
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-11/igt@i915_pm_freq_api@freq-suspend.html
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-7/igt@i915_pm_freq_api@freq-suspend.html

  * igt@i915_pm_freq_api@freq-suspend@gt0:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][365] ([i915#12455])
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-7/igt@i915_pm_freq_api@freq-suspend@gt0.html

  * igt@i915_pm_rc6_residency@media-rc6-accuracy:
    - shard-rkl:          NOTRUN -> ([SKIP][366], [SKIP][367]) +8 other tests ( 2 skip )
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-rkl-3/igt@i915_pm_rc6_residency@media-rc6-accuracy.html
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-rkl-4/igt@i915_pm_rc6_residency@media-rc6-accuracy.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-tglu-1:       NOTRUN -> [WARN][368] ([i915#2681]) +1 other test warn
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-tglu-1/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0:
    - shard-dg1:          ([PASS][369], [PASS][370]) -> ([PASS][371], [FAIL][372]) ([i915#12548] / [i915#3591])
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-dg1-14/igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0.html
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-dg1-18/igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0.html
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg1-17/igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0.html
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg1-18/igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0.html

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0:
    - shard-dg1:          ([PASS][373], [PASS][374]) -> ([PASS][375], [FAIL][376]) ([i915#12739] / [i915#3591])
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-dg1-18/igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0.html
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-dg1-14/igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0.html
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg1-18/igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0.html
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg1-17/igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0.html

  * igt@i915_pm_rps@min-max-config-idle:
    - shard-dg2:          NOTRUN -> ([SKIP][377], [SKIP][378]) ([i915#11681] / [i915#6621])
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-1/igt@i915_pm_rps@min-max-config-idle.html
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-4/igt@i915_pm_rps@min-max-config-idle.html

  * igt@i915_pm_sseu@full-enable:
    - shard-dg1:          NOTRUN -> [SKIP][379] ([i915#4387])
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg1-17/igt@i915_pm_sseu@full-enable.html

  * igt@i915_selftest@mock@memory_region:
    - shard-tglu:         NOTRUN -> ([DMESG-WARN][380], [DMESG-WARN][381]) ([i915#9311])
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-tglu-6/igt@i915_selftest@mock@memory_region.html
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-tglu-4/igt@i915_selftest@mock@memory_region.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-rkl:          ([PASS][382], [PASS][383]) -> ([PASS][384], [INCOMPLETE][385]) ([i915#4817])
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-rkl-7/igt@i915_suspend@basic-s3-without-i915.html
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-rkl-1/igt@i915_suspend@basic-s3-without-i915.html
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-rkl-1/igt@i915_suspend@basic-s3-without-i915.html
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-rkl-3/igt@i915_suspend@basic-s3-without-i915.html

  * igt@intel_hwmon@hwmon-write:
    - shard-tglu-1:       NOTRUN -> [SKIP][386] ([i915#7707])
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-tglu-1/igt@intel_hwmon@hwmon-write.html

  * igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling:
    - shard-mtlp:         NOTRUN -> [SKIP][387] ([i915#4212])
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-mtlp-8/igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling.html
    - shard-dg1:          NOTRUN -> ([SKIP][388], [SKIP][389]) ([i915#4212])
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg1-17/igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling.html
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg1-12/igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling.html

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - shard-dg1:          NOTRUN -> ([SKIP][390], [SKIP][391]) ([i915#4215])
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg1-12/igt@kms_addfb_basic@basic-y-tiled-legacy.html
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg1-14/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_addfb_basic@tile-pitch-mismatch:
    - shard-dg1:          NOTRUN -> [SKIP][392] ([i915#4212])
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg1-18/igt@kms_addfb_basic@tile-pitch-mismatch.html

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-dg1:          [PASS][393] -> ([DMESG-WARN][394], [PASS][395]) ([i915#4423]) +1 other test ( 1 dmesg-warn, 1 pass )
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-dg1-17/igt@kms_async_flips@alternate-sync-async-flip.html
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg1-18/igt@kms_async_flips@alternate-sync-async-flip.html
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg1-17/igt@kms_async_flips@alternate-sync-async-flip.html
    - shard-dg2:          [PASS][396] -> [FAIL][397] ([i915#10991] / [i915#12766])
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-dg2-3/igt@kms_async_flips@alternate-sync-async-flip.html
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-10/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-b-dp-4:
    - shard-dg2:          NOTRUN -> [FAIL][398] ([i915#10991])
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-10/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-dp-4.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y-rc-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][399] ([i915#8709]) +7 other tests skip
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-tglu-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y-rc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-3-4-mc-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][400] ([i915#8709]) +23 other tests skip
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-3-4-mc-ccs.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-rkl:          NOTRUN -> ([SKIP][401], [SKIP][402]) ([i915#1769] / [i915#3555])
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-rkl-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-rkl-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
    - shard-dg1:          NOTRUN -> ([SKIP][403], [SKIP][404]) ([i915#1769] / [i915#3555])
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg1-14/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg1-18/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
    - shard-tglu:         NOTRUN -> ([SKIP][405], [SKIP][406]) ([i915#1769] / [i915#3555])
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-tglu-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-tglu-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@pipe-b-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][407] ([i915#12964])
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-rkl-4/igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@pipe-b-hdmi-a-1.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
    - shard-rkl:          NOTRUN -> ([SKIP][408], [SKIP][409]) ([i915#5286]) +2 other tests ( 2 skip )
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-rkl-2/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-rkl-4/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-addfb:
    - shard-tglu:         NOTRUN -> ([SKIP][410], [SKIP][411]) ([i915#5286]) +1 other test ( 2 skip )
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-tglu-2/igt@kms_big_fb@4-tiled-addfb.html
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-tglu-9/igt@kms_big_fb@4-tiled-addfb.html

  * igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:
    - shard-tglu:         NOTRUN -> [SKIP][412] ([i915#5286]) +2 other tests skip
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-tglu-3/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html
    - shard-dg1:          NOTRUN -> [SKIP][413] ([i915#5286])
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg1-17/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-dg1:          NOTRUN -> [SKIP][414] ([i915#4538] / [i915#5286]) +2 other tests skip
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg1-13/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-rkl:          NOTRUN -> [SKIP][415] ([i915#5286]) +1 other test skip
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-rkl-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-tglu-1:       NOTRUN -> [SKIP][416] ([i915#5286]) +4 other tests skip
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-tglu-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-dg1:          NOTRUN -> ([SKIP][417], [SKIP][418]) ([i915#4538] / [i915#5286])
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg1-18/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg1-13/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-dg1:          NOTRUN -> ([SKIP][419], [SKIP][420]) ([i915#3638]) +1 other test ( 2 skip )
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg1-14/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg1-18/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-dg1:          NOTRUN -> [SKIP][421] ([i915#3638]) +1 other test skip
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg1-14/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-addfb:
    - shard-dg2:          NOTRUN -> ([SKIP][422], [PASS][423]) +3 other tests ( 1 pass, 1 skip )
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-11/igt@kms_big_fb@x-tiled-addfb.html
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-6/igt@kms_big_fb@x-tiled-addfb.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-dg2:          ([PASS][424], [PASS][425]) -> ([PASS][426], [SKIP][427]) +8 other tests ( 1 pass, 1 skip )
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-dg2-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-dg2-7/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-11/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-dg2:          NOTRUN -> [SKIP][428] ([i915#5190]) +1 other test skip
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-11/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-180:
    - shard-dg2:          NOTRUN -> ([SKIP][429], [SKIP][430]) ([i915#4538] / [i915#5190]) +6 other tests ( 2 skip )
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-11/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-7/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2:          NOTRUN -> ([SKIP][431], [SKIP][432]) ([i915#5190])
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-11/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-6/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][433]
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-rkl-2/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html
    - shard-dg1:          NOTRUN -> ([SKIP][434], [SKIP][435]) ([i915#4538]) +2 other tests ( 2 skip )
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg1-18/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg1-13/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-mtlp:         NOTRUN -> [SKIP][436] ([i915#6187])
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-mtlp-5/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-dg1:          NOTRUN -> [SKIP][437] ([i915#4538]) +3 other tests skip
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg1-18/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html
    - shard-dg2:          NOTRUN -> [SKIP][438] ([i915#4538] / [i915#5190])
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-mtlp:         NOTRUN -> [SKIP][439] +9 other tests skip
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-mtlp-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][440] ([i915#10307] / [i915#6095]) +149 other tests skip
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-5/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-3.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][441] ([i915#6095]) +152 other tests skip
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg1-17/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-c-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][442] ([i915#6095]) +29 other tests skip
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-mtlp-7/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-c-edp-1.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][443] ([i915#10307] / [i915#10434] / [i915#6095]) +2 other tests skip
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-8/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-dg1:          NOTRUN -> ([SKIP][444], [SKIP][445]) ([i915#12313])
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg1-12/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg1-17/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
    - shard-rkl:          NOTRUN -> ([SKIP][446], [SKIP][447]) ([i915#12313])
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-rkl-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-rkl-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html
    - shard-tglu-1:       NOTRUN -> [SKIP][448] ([i915#12313])
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-tglu-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html
    - shard-tglu:         NOTRUN -> [SKIP][449] ([i915#12313])
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-tglu-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][450] ([i915#12805])
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg1-14/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
    - shard-tglu:         NOTRUN -> ([SKIP][451], [SKIP][452]) ([i915#12805])
   [451]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-tglu-9/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [452]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-tglu-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1:
    - shard-tglu:         NOTRUN -> ([SKIP][453], [SKIP][454]) ([i915#6095]) +39 other tests ( 2 skip )
   [453]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-tglu-3/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1.html
   [454]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-tglu-8/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][455] ([i915#6095]) +64 other tests skip
   [455]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-tglu-1/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][456] ([i915#12805])
   [456]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-tglu-1/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-3:
    - shard-dg2:          NOTRUN -> ([SKIP][457], [SKIP][458]) ([i915#6095]) +9 other tests ( 2 skip )
   [457]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-3.html
   [458]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-3/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][459] ([i915#6095]) +7 other tests skip
   [459]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-5/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-3.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][460] ([i915#6095]) +42 other tests skip
   [460]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-rkl-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][461] ([i915#6095]) +24 other tests skip
   [461]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-tglu-2/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-dg2:          NOTRUN -> ([SKIP][462], [SKIP][463]) ([i915#12313]) +1 other test ( 2 skip )
   [462]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-4/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
   [463]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-6/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
    - shard-tglu:         NOTRUN -> ([SKIP][464], [SKIP][465]) ([i915#12313])
   [464]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-tglu-5/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
   [465]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-tglu-3/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-y-tiled-ccs:
    - shard-dg1:          NOTRUN -> ([SKIP][466], [SKIP][467]) ([i915#6095]) +18 other tests ( 2 skip )
   [466]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg1-18/igt@kms_ccs@random-ccs-data-y-tiled-ccs.html
   [467]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg1-17/igt@kms_ccs@random-ccs-data-y-tiled-ccs.html

  * igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-b-hdmi-a-1:
    - shard-rkl:          NOTRUN -> ([SKIP][468], [SKIP][469]) ([i915#6095]) +10 other tests ( 2 skip )
   [468]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-rkl-4/igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-b-hdmi-a-1.html
   [469]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-rkl-7/igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-3:
    - shard-dg2:          NOTRUN -> ([SKIP][470], [SKIP][471]) ([i915#10307] / [i915#6095]) +39 other tests ( 2 skip )
   [470]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-3/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-3.html
   [471]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-5/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-3.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-rkl:          NOTRUN -> ([SKIP][472], [SKIP][473]) ([i915#3742])
   [472]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-rkl-4/igt@kms_cdclk@mode-transition-all-outputs.html
   [473]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-rkl-2/igt@kms_cdclk@mode-transition-all-outputs.html
    - shard-tglu:         NOTRUN -> ([SKIP][474], [SKIP][475]) ([i915#3742])
   [474]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-tglu-5/igt@kms_cdclk@mode-transition-all-outputs.html
   [475]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-tglu-8/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@plane-scaling@pipe-c-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][476] ([i915#4087]) +4 other tests skip
   [476]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-2/igt@kms_cdclk@plane-scaling@pipe-c-hdmi-a-3.html

  * igt@kms_chamelium_edid@hdmi-edid-read:
    - shard-tglu:         NOTRUN -> ([SKIP][477], [SKIP][478]) ([i915#7828]) +4 other tests ( 2 skip )
   [477]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-tglu-6/igt@kms_chamelium_edid@hdmi-edid-read.html
   [478]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-tglu-8/igt@kms_chamelium_edid@hdmi-edid-read.html

  * igt@kms_chamelium_frames@dp-crc-fast:
    - shard-dg2:          NOTRUN -> ([SKIP][479], [SKIP][480]) ([i915#7828]) +4 other tests ( 2 skip )
   [479]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-7/igt@kms_chamelium_frames@dp-crc-fast.html
   [480]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-1/igt@kms_chamelium_frames@dp-crc-fast.html

  * igt@kms_chamelium_frames@dp-crc-single:
    - shard-dg1:          NOTRUN -> [SKIP][481] ([i915#7828]) +8 other tests skip
   [481]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg1-13/igt@kms_chamelium_frames@dp-crc-single.html

  * igt@kms_chamelium_frames@dp-frame-dump:
    - shard-dg2:          NOTRUN -> [SKIP][482] ([i915#7828]) +1 other test skip
   [482]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-6/igt@kms_chamelium_frames@dp-frame-dump.html

  * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
    - shard-dg1:          NOTRUN -> ([SKIP][483], [SKIP][484]) ([i915#7828]) +1 other test ( 2 skip )
   [483]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg1-18/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html
   [484]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg1-14/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html

  * igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
    - shard-dg2:          NOTRUN -> ([SKIP][485], [SKIP][486]) ([i915#2575] / [i915#7828])
   [485]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-11/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html
   [486]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-4/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html

  * igt@kms_chamelium_hpd@dp-hpd-storm:
    - shard-rkl:          NOTRUN -> ([SKIP][487], [SKIP][488]) ([i915#7828]) +3 other tests ( 2 skip )
   [487]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-rkl-1/igt@kms_chamelium_hpd@dp-hpd-storm.html
   [488]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-rkl-3/igt@kms_chamelium_hpd@dp-hpd-storm.html

  * igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:
    - shard-rkl:          NOTRUN -> [SKIP][489] ([i915#7828])
   [489]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-rkl-5/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html
    - shard-tglu-1:       NOTRUN -> [SKIP][490] ([i915#7828]) +8 other tests skip
   [490]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-tglu-1/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html
    - shard-tglu:         NOTRUN -> [SKIP][491] ([i915#7828]) +3 other tests skip
   [491]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-tglu-10/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html
    - shard-mtlp:         NOTRUN -> [SKIP][492] ([i915#7828]) +3 other tests skip
   [492]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-mtlp-3/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html

  * igt@kms_color@invalid-gamma-lut-sizes:
    - shard-dg2:          ([PASS][493], [PASS][494]) -> [SKIP][495] ([i915#2575]) +51 other tests skip
   [493]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-dg2-6/igt@kms_color@invalid-gamma-lut-sizes.html
   [494]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-dg2-5/igt@kms_color@invalid-gamma-lut-sizes.html
   [495]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-11/igt@kms_color@invalid-gamma-lut-sizes.html

  * igt@kms_content_protection@atomic@pipe-a-dp-4:
    - shard-dg2:          NOTRUN -> [TIMEOUT][496] ([i915#7173])
   [496]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-10/igt@kms_content_protection@atomic@pipe-a-dp-4.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-tglu:         NOTRUN -> [SKIP][497] ([i915#3116] / [i915#3299]) +1 other test skip
   [497]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-tglu-10/igt@kms_content_protection@dp-mst-lic-type-0.html
    - shard-mtlp:         NOTRUN -> [SKIP][498] ([i915#3299])
   [498]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-mtlp-3/igt@kms_content_protection@dp-mst-lic-type-0.html
    - shard-dg2:          NOTRUN -> ([SKIP][499], [SKIP][500]) ([i915#3299])
   [499]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-1/igt@kms_content_protection@dp-mst-lic-type-0.html
   [500]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-10/igt@kms_content_protection@dp-mst-lic-type-0.html
    - shard-dg1:          NOTRUN -> [SKIP][501] ([i915#3299])
   [501]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg1-13/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-dg1:          NOTRUN -> ([SKIP][502], [SKIP][503]) ([i915#3299]) +1 other test ( 2 skip )
   [502]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg1-14/igt@kms_content_protection@dp-mst-lic-type-1.html
   [503]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg1-12/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][504] ([i915#3116] / [i915#3299]) +1 other test skip
   [504]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-tglu-1/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@lic-type-0:
    - shard-tglu:         NOTRUN -> ([SKIP][505], [SKIP][506]) ([i915#6944] / [i915#9424])
   [505]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-tglu-10/igt@kms_content_protection@lic-type-0.html
   [506]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-tglu-2/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@lic-type-1:
    - shard-mtlp:         NOTRUN -> [SKIP][507] ([i915#6944] / [i915#9424])
   [507]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-mtlp-7/igt@kms_content_protection@lic-type-1.html
    - shard-dg2:          NOTRUN -> [SKIP][508] ([i915#9424])
   [508]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-2/igt@kms_content_protection@lic-type-1.html
    - shard-rkl:          NOTRUN -> [SKIP][509] ([i915#9424])
   [509]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-rkl-2/igt@kms_content_protection@lic-type-1.html
    - shard-dg1:          NOTRUN -> ([SKIP][510], [SKIP][511]) ([i915#9424])
   [510]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg1-12/igt@kms_content_protection@lic-type-1.html
   [511]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg1-14/igt@kms_content_protection@lic-type-1.html
    - shard-tglu:         NOTRUN -> [SKIP][512] ([i915#6944] / [i915#9424])
   [512]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-tglu-9/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@srm:
    - shard-tglu:         NOTRUN -> ([SKIP][513], [SKIP][514]) ([i915#6944] / [i915#7116] / [i915#7118])
   [513]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-tglu-5/igt@kms_content_protection@srm.html
   [514]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-tglu-3/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@uevent:
    - shard-dg1:          NOTRUN -> ([SKIP][515], [SKIP][516]) ([i915#7116] / [i915#9424])
   [515]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg1-17/igt@kms_content_protection@uevent.html
   [516]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg1-18/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2:          NOTRUN -> ([SKIP][517], [SKIP][518]) ([i915#12976] / [i915#2575])
   [517]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-11/igt@kms_cursor_crc@cursor-offscreen-512x512.html
   [518]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg2-4/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-32x10:
    - shard-dg1:          NOTRUN -> ([SKIP][519], [SKIP][520]) ([i915#3555])
   [519]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg1-12/igt@kms_cursor_crc@cursor-onscreen-32x10.html
   [520]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg1-18/igt@kms_cursor_crc@cursor-onscreen-32x10.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-tglu-1:       NOTRUN -> [SKIP][521] ([i915#12976]) +1 other test skip
   [521]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-tglu-1/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-256x256:
    - shard-dg1:          [PASS][522] -> [DMESG-WARN][523] ([i915#4423])
   [522]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15722/shard-dg1-14/igt@kms_cursor_crc@cursor-random-256x256.html
   [523]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/shard-dg1-14/igt@kms_cursor_crc@cursor-random-256x256.html

  * igt@kms_cursor_crc@cursor-random-32x10:
    - shard-tglu:         NOTRUN -> ([

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12139/index.html
