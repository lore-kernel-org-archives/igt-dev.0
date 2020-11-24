Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 24 Nov 2020 17:47:33 -0000
Message-ID: <160624005362.10863.2872229005459514637@emeril.freedesktop.org>
References: <20201124133836.30669-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20201124133836.30669-1-juhapekka.heikkila@gmail.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/2=5D_tests/kms=5Fplane=3A_optimize_?=
 =?utf-8?q?pixel_format_tests?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0505862717=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0505862717==
Content-Type: multipart/alternative;
 boundary="===============3819859450107440230=="

--===============3819859450107440230==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,1/2] tests/kms_plane: optimize pixel format tests
URL   : https://patchwork.freedesktop.org/series/84218/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_9382_full -> IGTPW_5218_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5218_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5218_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5218/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5218_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_eio@execbuf:
    - shard-iclb:         NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5218/shard-iclb5/igt@gem_eio@execbuf.html

  * igt@gem_eio@in-flight-internal-immediate:
    - shard-glk:          NOTRUN -> [FAIL][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5218/shard-glk7/igt@gem_eio@in-flight-internal-immediate.html

  * igt@gem_exec_fence@syncobj-repeat:
    - shard-snb:          [PASS][3] -> [FAIL][4] +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-snb4/igt@gem_exec_fence@syncobj-repeat.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5218/shard-snb2/igt@gem_exec_fence@syncobj-repeat.html

  * igt@gem_exec_store@cachelines:
    - shard-snb:          NOTRUN -> [TIMEOUT][5] +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5218/shard-snb4/igt@gem_exec_store@cachelines.html

  * igt@gem_exec_whisper@basic-contexts-priority-all:
    - shard-tglb:         [PASS][6] -> [SKIP][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-tglb6/igt@gem_exec_whisper@basic-contexts-priority-all.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5218/shard-tglb2/igt@gem_exec_whisper@basic-contexts-priority-all.html
    - shard-iclb:         [PASS][8] -> [SKIP][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-iclb3/igt@gem_exec_whisper@basic-contexts-priority-all.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5218/shard-iclb6/igt@gem_exec_whisper@basic-contexts-priority-all.html

  * igt@gem_workarounds@basic-read:
    - shard-snb:          [PASS][10] -> [TIMEOUT][11] +1 similar issue
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-snb7/igt@gem_workarounds@basic-read.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5218/shard-snb4/igt@gem_workarounds@basic-read.html

  * igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy:
    - shard-hsw:          [PASS][12] -> [FAIL][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-hsw1/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5218/shard-hsw2/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff:
    - shard-glk:          [PASS][14] -> [FAIL][15] +2 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-glk5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5218/shard-glk4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:
    - shard-iclb:         [PASS][16] -> [FAIL][17]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-iclb4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5218/shard-iclb1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html
    - shard-tglb:         NOTRUN -> [FAIL][18]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5218/shard-tglb2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_plane@pixel-format-pipe-b-planes-source-clamping:
    - shard-tglb:         [PASS][19] -> [FAIL][20] +5 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-tglb1/igt@kms_plane@pixel-format-pipe-b-planes-source-clamping.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5218/shard-tglb2/igt@kms_plane@pixel-format-pipe-b-planes-source-clamping.html

  
#### Warnings ####

  * igt@gen7_exec_parse@cmd-crossing-page:
    - shard-tglb:         [SKIP][21] ([fdo#109289]) -> [SKIP][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-tglb3/igt@gen7_exec_parse@cmd-crossing-page.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5218/shard-tglb7/igt@gen7_exec_parse@cmd-crossing-page.html
    - shard-iclb:         [SKIP][23] ([fdo#109289]) -> [SKIP][24]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-iclb8/igt@gen7_exec_parse@cmd-crossing-page.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5218/shard-iclb4/igt@gen7_exec_parse@cmd-crossing-page.html

  * igt@kms_color_chamelium@pipe-b-ctm-blue-to-red:
    - shard-snb:          [SKIP][25] ([fdo#109271] / [fdo#111827]) -> [TIMEOUT][26]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-snb6/igt@kms_color_chamelium@pipe-b-ctm-blue-to-red.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5218/shard-snb4/igt@kms_color_chamelium@pipe-b-ctm-blue-to-red.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt:
    - shard-snb:          [SKIP][27] ([fdo#109271]) -> [TIMEOUT][28] +2 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-snb7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5218/shard-snb4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@gem_userptr_blits@vma-merge}:
    - shard-snb:          [FAIL][29] ([i915#1635]) -> [FAIL][30]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-snb5/igt@gem_userptr_blits@vma-merge.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5218/shard-snb6/igt@gem_userptr_blits@vma-merge.html

  
Known issues
------------

  Here are the changes found in IGTPW_5218_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_whisper@basic-contexts-priority-all:
    - shard-kbl:          [PASS][31] -> [SKIP][32] ([fdo#109271]) +2 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-kbl7/igt@gem_exec_whisper@basic-contexts-priority-all.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5218/shard-kbl3/igt@gem_exec_whisper@basic-contexts-priority-all.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-tglb:         [PASS][33] -> [WARN][34] ([i915#2681])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-tglb7/igt@i915_pm_rc6_residency@rc6-fence.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5218/shard-tglb2/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_pm_rpm@gem-evict-pwrite:
    - shard-hsw:          [PASS][35] -> [SKIP][36] ([fdo#109271]) +2 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-hsw2/igt@i915_pm_rpm@gem-evict-pwrite.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5218/shard-hsw1/igt@i915_pm_rpm@gem-evict-pwrite.html

  * igt@i915_pm_rpm@system-suspend-execbuf:
    - shard-iclb:         [PASS][37] -> [SKIP][38] ([i915#579]) +1 similar issue
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-iclb3/igt@i915_pm_rpm@system-suspend-execbuf.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5218/shard-iclb4/igt@i915_pm_rpm@system-suspend-execbuf.html
    - shard-apl:          [PASS][39] -> [SKIP][40] ([fdo#109271] / [i915#1635]) +2 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-apl1/igt@i915_pm_rpm@system-suspend-execbuf.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5218/shard-apl2/igt@i915_pm_rpm@system-suspend-execbuf.html
    - shard-glk:          [PASS][41] -> [SKIP][42] ([fdo#109271]) +2 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-glk7/igt@i915_pm_rpm@system-suspend-execbuf.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5218/shard-glk4/igt@i915_pm_rpm@system-suspend-execbuf.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-sliding:
    - shard-apl:          [PASS][43] -> [FAIL][44] ([i915#1635] / [i915#54])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-apl6/igt@kms_cursor_crc@pipe-a-cursor-64x21-sliding.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5218/shard-apl7/igt@kms_cursor_crc@pipe-a-cursor-64x21-sliding.html
    - shard-kbl:          [PASS][45] -> [FAIL][46] ([i915#54])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-64x21-sliding.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5218/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-64x21-sliding.html

  * igt@kms_flip@modeset-vs-vblank-race-interruptible@a-hdmi-a1:
    - shard-glk:          [PASS][47] -> [DMESG-WARN][48] ([i915#1982]) +4 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-glk8/igt@kms_flip@modeset-vs-vblank-race-interruptible@a-hdmi-a1.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5218/shard-glk8/igt@kms_flip@modeset-vs-vblank-race-interruptible@a-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu:
    - shard-kbl:          [PASS][49] -> [DMESG-WARN][50] ([i915#1982]) +3 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5218/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-glk:          [PASS][51] -> [FAIL][52] ([i915#49])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-glk5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5218/shard-glk1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-pwrite:
    - shard-tglb:         [PASS][53] -> [DMESG-WARN][54] ([i915#1982]) +3 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-tglb2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-pwrite.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5218/shard-tglb5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-pwrite.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [PASS][55] -> [SKIP][56] ([fdo#109642] / [fdo#111068])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-iclb2/igt@kms_psr2_su@frontbuffer.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5218/shard-iclb7/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_basic:
    - shard-iclb:         [PASS][57] -> [SKIP][58] ([fdo#109441])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-iclb2/igt@kms_psr@psr2_basic.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5218/shard-iclb7/igt@kms_psr@psr2_basic.html

  * igt@kms_universal_plane@universal-plane-pipe-a-sanity:
    - shard-apl:          [PASS][59] -> [DMESG-WARN][60] ([i915#1635] / [i915#1982]) +1 similar issue
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-apl2/igt@kms_universal_plane@universal-plane-pipe-a-sanity.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5218/shard-apl1/igt@kms_universal_plane@universal-plane-pipe-a-sanity.html

  * igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend:
    - shard-hsw:          [PASS][61] -> [INCOMPLETE][62] ([i915#2637])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-hsw4/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5218/shard-hsw4/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html
    - shard-kbl:          [PASS][63] -> [INCOMPLETE][64] ([i915#155])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-kbl1/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5218/shard-kbl3/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html
    - shard-iclb:         [PASS][65] -> [INCOMPLETE][66] ([i915#1185])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-iclb7/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5218/shard-iclb5/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html
    - shard-apl:          [PASS][67] -> [INCOMPLETE][68] ([i915#1635] / [i915#2635])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-apl2/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5218/shard-apl3/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html
    - shard-glk:          [PASS][69] -> [INCOMPLETE][70] ([i915#2635])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-glk1/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5218/shard-glk6/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html

  * igt@perf@polling-parameterized:
    - shard-tglb:         [PASS][71] -> [FAIL][72] ([i915#1542])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-tglb6/igt@perf@polling-parameterized.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5218/shard-tglb5/igt@perf@polling-parameterized.html

  
#### Possible fixes ####

  * igt@feature_discovery@psr2:
    - shard-iclb:         [SKIP][73] ([i915#658]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-iclb8/igt@feature_discovery@psr2.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5218/shard-iclb2/igt@feature_discovery@psr2.html

  * igt@gem_ctx_isolation@preservation-s3@vecs0:
    - shard-kbl:          [DMESG-WARN][75] ([i915#180]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-kbl1/igt@gem_ctx_isolation@preservation-s3@vecs0.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5218/shard-kbl1/igt@gem_ctx_isolation@preservation-s3@vecs0.html

  * igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled:
    - shard-apl:          [SKIP][77] ([fdo#109271] / [i915#1635]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-apl4/igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5218/shard-apl7/igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled.html
    - shard-iclb:         [SKIP][79] -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-iclb6/igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5218/shard-iclb5/igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled.html
    - shard-glk:          [SKIP][81] ([fdo#109271]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-glk4/igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5218/shard-glk1/igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled.html
    - shard-kbl:          [SKIP][83] ([fdo#109271]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-kbl1/igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5218/shard-kbl2/igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled.html
    - shard-tglb:         [SKIP][85] -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-tglb2/igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5218/shard-tglb2/igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled.html

  * igt@i915_hangman@error-state-basic:
    - shard-snb:          [TIMEOUT][87] -> [PASS][88] +2 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-snb2/igt@i915_hangman@error-state-basic.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5218/shard-snb6/igt@i915_hangman@error-state-basic.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][89] ([i915#454]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-iclb6/igt@i915_pm_dc@dc6-psr.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5218/shard-iclb6/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_cursor_edge_walk@pipe-b-64x64-right-edge:
    - shard-glk:          [DMESG-WARN][91] ([i915#1982]) -> [PASS][92] +5 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-glk2/igt@kms_cursor_edge_walk@pipe-b-64x64-right-edge.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5218/shard-glk7/igt@kms_cursor_edge_walk@pipe-b-64x64-right-edge.html

  * igt@kms_flip@absolute-wf_vblank-interruptible@a-dp1:
    - shard-apl:          [DMESG-WARN][93] ([i915#1635] / [i915#1982]) -> [PASS][94] +4 similar issues
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-apl1/igt@kms_flip@absolute-wf_vblank-interruptible@a-dp1.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5218/shard-apl7/igt@kms_flip@absolute-wf_vblank-interruptible@a-dp1.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp1:
    - shard-kbl:          [DMESG-WARN][95] ([i915#1982]) -> [PASS][96] +4 similar issues
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-kbl7/igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp1.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5218/shard-kbl4/igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-stridechange:
    - shard-tglb:         [DMESG-WARN][97] ([i915#1982]) -> [PASS][98] +1 similar issue
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-tglb1/igt@kms_frontbuffer_tracking@fbc-stridechange.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5218/shard-tglb3/igt@kms_frontbuffer_tracking@fbc-stridechange.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt:
    - shard-tglb:         [FAIL][99] -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5218/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt.html
    - shard-iclb:         [FAIL][101] -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-iclb4/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5218/shard-iclb5/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-b-frame-sequence:
    - shard-hsw:          [DMESG-WARN][103] ([i915#1982]) -> [PASS][104] +1 similar issue
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-hsw6/igt@kms_pipe_crc_basic@read-crc-pipe-b-frame-sequence.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5218/shard-hsw6/igt@kms_pipe_crc_basic@read-crc-pipe-b-frame-sequence.html

  * igt@kms_plane@pixel-format-pipe-b-planes:
    - shard-hsw:          [DMESG-FAIL][105] ([IGT#6]) -> [PASS][106]
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-hsw6/igt@kms_plane@pixel-format-pipe-b-planes.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5218/shard-hsw2/igt@kms_plane@pixel-format-pipe-b-planes.html

  * igt@kms_plane@pixel-format-pipe-b-planes-source-clamping:
    - shard-hsw:          [DMESG-FAIL][107] ([IGT#6] / [i915#1982]) -> [PASS][108]
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-hsw6/igt@kms_plane@pixel-format-pipe-b-planes-source-clamping.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5218/shard-hsw4/igt@kms_plane@pixel-format-pipe-b-planes-source-clamping.html

  * igt@kms_plane@pixel-format-pipe-c-planes:
    - shard-glk:          [INCOMPLETE][109] ([i915#2554]) -> [PASS][110]
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-glk8/igt@kms_plane@pixel-format-pipe-c-planes.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5218/shard-glk7/igt@kms_plane@pixel-format-pipe-c-planes.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [SKIP][111] ([fdo#109441]) -> [PASS][112] +1 similar issue
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-iclb6/igt@kms_psr@psr2_primary_mmap_cpu.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5218/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@perf@disabled-read-error:
    - shard-hsw:          [SKIP][113] ([fdo#109271]) -> [PASS][114]
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-hsw1/igt@perf@disabled-read-error.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5218/shard-hsw4/igt@perf@disabled-read-error.html

  
#### Warnings ####

  * igt@gem_eio@in-flight-suspend:
    - shard-tglb:         [DMESG-FAIL][115] ([i915#2411]) -> [DMESG-WARN][116] ([i915#2411])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-tglb2/igt@gem_eio@in-flight-suspend.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5218/shard-tglb1/igt@gem_eio@in-flight-suspend.html

  * igt@gem_exec_schedule@preempt-queue:
    - shard-snb:          [TIMEOUT][117] -> [SKIP][118] ([fdo#109271]) +2 similar issues
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-snb2/igt@gem_exec_schedule@preempt-queue.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5218/shard-snb7/igt@gem_exec_schedule@preempt-queue.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-iclb:         [WARN][119] ([i915#2681]) -> [WARN][120] ([i915#1804])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-iclb1/igt@i915_pm_rc6_residency@rc6-idle.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5218/shard-iclb4/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_pm_rpm@gem-evict-pwrite:
    - shard-tglb:         [DMESG-WARN][121] ([i915#2411]) -> [SKIP][122] ([i915#579]) +1 similar issue
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-tglb8/igt@i915_pm_rpm@gem-evict-pwrite.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5218/shard-tglb7/igt@i915_pm_rpm@gem-evict-pwrite.html

  * igt@i915_suspend@sysfs-reader:
    - shard-tglb:         [INCOMPLETE][123] ([i915#1436] / [i915#1602] / [i915#1887] / [i915#2411] / [i915#456]) -> [DMESG-WARN][124] ([i915#2411]) +1 similar issue
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-tglb7/igt@i915_suspend@sysfs-reader.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5218/shard-tglb6/igt@i915_suspend@sysfs-reader.html

  * igt@kms_color_chamelium@pipe-b-ctm-negative:
    - shard-snb:          [TIMEOUT][125] -> [SKIP][126] ([fdo#109271] / [fdo#111827])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-snb2/igt@kms_color_chamelium@pipe-b-ctm-negative.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5218/shard-snb6/igt@kms_color_chamelium@pipe-b-ctm-negative.html

  * igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend:
    - shard-tglb:         [DMESG-WARN][127] ([i915#2411]) -> [INCOMPLETE][128] ([i915#1436] / [i915#1602] / [i915#1798] / [i915#1887] / [i915#1982] / [i915#2411] / [i915#456])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-tglb1/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5218/shard-tglb2/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html

  * igt@runner@aborted:
    - shard-kbl:          [FAIL][129] ([i915#2295]) -> [FAIL][130] ([i915#2295] / [i915#483])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-kbl7/igt@runner@aborted.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5218/shard-kbl1/igt@runner@aborted.html
    - shard-iclb:         ([FAIL][131], [FAIL][132]) ([i915#2295] / [i915#483]) -> ([FAIL][133], [FAIL][134], [FAIL][135]) ([i915#1814] / [i915#2295] / [i915#483])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-iclb1/igt@runner@aborted.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-iclb3/igt@runner@aborted.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5218/shard-iclb5/igt@runner@aborted.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5218/shard-iclb4/igt@runner@aborted.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5218/shard-iclb5/igt@runner@aborted.html
    - shard-apl:          [FAIL][136] ([i915#1635] / [i915#2295]) -> ([FAIL][137], [FAIL][138], [FAIL][139]) ([i915#1635] / [i915#1814] / [i915#2295])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-apl1/igt@runner@aborted.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5218/shard-apl3/igt@runner@aborted.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5218/shard-apl8/igt@runner@aborted.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5218/shard-apl3/igt@runner@aborted.html
    - shard-glk:          ([FAIL][140], [FAIL][141]) ([i915#1814] / [i915#2295] / [i915#483] / [k.org#202321]) -> ([FAIL][142], [FAIL][143]) ([i915#1814] / [i915#2295] / [k.org#202321])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-glk7/igt@runner@aborted.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-glk8/igt@runner@aborted.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5218/shard-glk6/igt@runner@aborted.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5218/shard-glk2/igt@runner@aborted.html
    - shard-tglb:         ([FAIL][144], [FAIL][145], [FAIL][146], [FAIL][147]) ([i915#1602] / [i915#1814] / [i915#2295] / [i915#2426] / [i915#409]) -> ([FAIL][148], [FAIL][149], [FAIL][150]) ([i915#1602] / [i915#2295])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-tglb5/igt@runner@aborted.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-tglb6/igt@runner@aborted.html
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-tglb1/igt@runner@aborted.html
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-tglb7/igt@runner@aborted.html
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5218/shard-tglb7/igt@runner@aborted.html
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5218/shard-tglb2/igt@runner@aborted.html
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5218/shard-tglb3/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [CI#80]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/80
  [IGT#6]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/6
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1185]: https://gitlab.freedesktop.org/drm/intel/issues/1185
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#1798]: https://gitlab.freedesktop.org/drm/intel/issues/1798
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1804]: https://gitlab.freedesktop.org/drm/intel/issues/1804
  [i915#1814]: https://gitlab.freedesktop.org/drm/intel/issues/1814
  [i915#1887]: https://gitlab.freedesktop.org/drm/intel/issues/1887
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2295]: https://gitlab.freedesktop.org/drm/intel/issues/2295
  [i915#2369]: https://gitlab.freedesktop.org/drm/intel/issues/2369
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#2426]: https://gitlab.freedesktop.org/drm/intel/issues/2426
  [i915#2554]: https://gitlab.freedesktop.org/drm/intel/issues/2554
  [i915#2559]: https://gitlab.freedesktop.org/drm/intel/issues/2559
  [i915#2624]: https://gitlab.freedesktop.org/drm/intel/issues/2624
  [i915#2635]: https://gitlab.freedesktop.org/drm/intel/issues/2635
  [i915#2637]: https://gitlab.freedesktop.org/drm/intel/issues/2637
  [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
  [i915#409]: https://gitlab.freedesktop.org/drm/intel/issues/409
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#483]: https://gitlab.freedesktop.org/drm/intel/issues/483
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5218/index.html

--===============3819859450107440230==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


<!DOCTYPE html>
<html xmlns=3D"http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8"/>
  <title>Project List - Patchwork</title>
  <style id=3D"css-table-select" type=3D"text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,1/2] tests/kms_p=
lane: optimize pixel format tests</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/84218/">https://patchwork.freedesktop.org/series/84218/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5218/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5218/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9382_full -&gt; IGTPW_5218_full</h=
1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5218_full absolutely need to b=
e<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_5218_full, please notify your bug team to allow them<=
br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5218/index.=
html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5218=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_eio@execbuf:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5218/shard-iclb5/igt@gem_eio@execbuf.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-internal-immediate:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5218/shard-glk7/igt@gem_eio@in-flight-internal-immediat=
e.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@syncobj-repeat:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-snb4/igt@gem_exec_fence@syncobj-repeat.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5218/shard-sn=
b2/igt@gem_exec_fence@syncobj-repeat.html">FAIL</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_store@cachelines:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5218/shard-snb4/igt@gem_exec_store@cachelines.html">TIM=
EOUT</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-contexts-priority-all:</p>
<ul>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9382/shard-tglb6/igt@gem_exec_whisper@basic-contexts-priority-all.ht=
ml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_5218/shard-tglb2/igt@gem_exec_whisper@basic-contexts-priority-all.html">S=
KIP</a></p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9382/shard-iclb3/igt@gem_exec_whisper@basic-contexts-priority-all.ht=
ml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_5218/shard-iclb6/igt@gem_exec_whisper@basic-contexts-priority-all.html">S=
KIP</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@basic-read:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-snb7/igt@gem_workarounds@basic-read.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5218/shard-snb4/=
igt@gem_workarounds@basic-read.html">TIMEOUT</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-hsw1/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legac=
y.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_5218/shard-hsw2/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy.=
html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-glk5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-in=
dfb-onoff.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_5218/shard-glk4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-=
spr-indfb-onoff.html">FAIL</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9382/shard-iclb4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-in=
dfb-draw-blt.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_5218/shard-iclb1/igt@kms_frontbuffer_tracking@psr-1p-prims=
crn-cur-indfb-draw-blt.html">FAIL</a></p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5218/shard-tglb2/igt@kms_frontbuffer_tracking@psr-1p-pri=
mscrn-cur-indfb-draw-blt.html">FAIL</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-pipe-b-planes-source-clamping:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-tglb1/igt@kms_plane@pixel-format-pipe-b-planes-source-cl=
amping.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_5218/shard-tglb2/igt@kms_plane@pixel-format-pipe-b-planes-source=
-clamping.html">FAIL</a> +5 similar issues</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gen7_exec_parse@cmd-crossing-page:</p>
<ul>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9382/shard-tglb3/igt@gen7_exec_parse@cmd-crossing-page.html">SKIP</a=
> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109289">fdo#10=
9289</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
218/shard-tglb7/igt@gen7_exec_parse@cmd-crossing-page.html">SKIP</a></p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9382/shard-iclb8/igt@gen7_exec_parse@cmd-crossing-page.html">SKIP</a=
> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109289">fdo#10=
9289</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
218/shard-iclb4/igt@gen7_exec_parse@cmd-crossing-page.html">SKIP</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-b-ctm-blue-to-red:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-snb6/igt@kms_color_chamelium@pipe-b-ctm-blue-to-red.html=
">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10927=
1">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111827">fdo#111827</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_5218/shard-snb4/igt@kms_color_chamelium@pipe-b-ctm-blue-to-=
red.html">TIMEOUT</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-snb7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-ind=
fb-pgflip-blt.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_=
bug.cgi?id=3D109271">fdo#109271</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_5218/shard-snb4/igt@kms_frontbuffer_tracking@fbcp=
sr-1p-primscrn-indfb-pgflip-blt.html">TIMEOUT</a> +2 similar issues</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>{igt@gem_userptr_blits@vma-merge}:<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-snb5/igt@gem_userptr_blits@vma-merge.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5218/shar=
d-snb6/igt@gem_userptr_blits@vma-merge.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5218_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_whisper@basic-contexts-priority-all:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-kbl7/igt@gem_exec_whisper@basic-contexts-priority-all.ht=
ml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_5218/shard-kbl3/igt@gem_exec_whisper@basic-contexts-priority-all.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">f=
do#109271</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-tglb7/igt@i915_pm_rc6_residency@rc6-fence.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5218/shard=
-tglb2/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/intel/issues/2681">i915#2681</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-evict-pwrite:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-hsw2/igt@i915_pm_rpm@gem-evict-pwrite.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5218/shard-hsw=
1/igt@i915_pm_rpm@gem-evict-pwrite.html">SKIP</a> (<a href=3D"https://bugs.=
freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +2 similar issues=
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend-execbuf:</p>
<ul>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9382/shard-iclb3/igt@i915_pm_rpm@system-suspend-execbuf.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5218/sha=
rd-iclb4/igt@i915_pm_rpm@system-suspend-execbuf.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/579">i915#579</a>) +1 simil=
ar issue</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9382/shard-apl1/igt@i915_pm_rpm@system-suspend-execbuf.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5218/shar=
d-apl2/igt@i915_pm_rpm@system-suspend-execbuf.html">SKIP</a> (<a href=3D"ht=
tps://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) =
+2 similar issues</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9382/shard-glk7/igt@i915_pm_rpm@system-suspend-execbuf.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5218/shar=
d-glk4/igt@i915_pm_rpm@system-suspend-execbuf.html">SKIP</a> (<a href=3D"ht=
tps://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +2 sim=
ilar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-64x21-sliding:</p>
<ul>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9382/shard-apl6/igt@kms_cursor_crc@pipe-a-cursor-64x21-sliding.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
218/shard-apl7/igt@kms_cursor_crc@pipe-a-cursor-64x21-sliding.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#16=
35</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/54">i91=
5#54</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9382/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-64x21-sliding.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
218/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-64x21-sliding.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</=
a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@modeset-vs-vblank-race-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-glk8/igt@kms_flip@modeset-vs-vblank-race-interruptible@a=
-hdmi-a1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_5218/shard-glk8/igt@kms_flip@modeset-vs-vblank-race-interrupti=
ble@a-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/1982">i915#1982</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-in=
dfb-draw-mmap-cpu.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_5218/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-1p-o=
ffscren-pri-indfb-draw-mmap-cpu.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +3 similar issue=
s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-glk5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-in=
dfb-onoff.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_5218/shard-glk1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-=
spr-indfb-onoff.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/49">i915#49</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-tglb2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-s=
hrfb-draw-pwrite.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_5218/shard-tglb5/igt@kms_frontbuffer_tracking@psr-1p-p=
rimscrn-pri-shrfb-draw-pwrite.html">DMESG-WARN</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +3 similar issues<=
/li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-iclb2/igt@kms_psr2_su@frontbuffer.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5218/shard-iclb7/i=
gt@kms_psr2_su@frontbuffer.html">SKIP</a> (<a href=3D"https://bugs.freedesk=
top.org/show_bug.cgi?id=3D109642">fdo#109642</a> / <a href=3D"https://bugs.=
freedesktop.org/show_bug.cgi?id=3D111068">fdo#111068</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_basic:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-iclb2/igt@kms_psr@psr2_basic.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5218/shard-iclb7/igt@km=
s_psr@psr2_basic.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D109441">fdo#109441</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-pipe-a-sanity:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-apl2/igt@kms_universal_plane@universal-plane-pipe-a-sani=
ty.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_5218/shard-apl1/igt@kms_universal_plane@universal-plane-pipe-a-sanit=
y.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/1635">i915#1635</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/1982">i915#1982</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend:</p>
<ul>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9382/shard-hsw4/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.h=
tml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_5218/shard-hsw4/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html"=
>INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/2637">i915#2637</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9382/shard-kbl1/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.h=
tml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_5218/shard-kbl3/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html"=
>INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/155">i915#155</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9382/shard-iclb7/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_5218/shard-iclb5/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.htm=
l">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/1185">i915#1185</a>)</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9382/shard-apl2/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.h=
tml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_5218/shard-apl3/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html"=
>INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/1635">i915#1635</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/2635">i915#2635</a>)</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9382/shard-glk1/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.h=
tml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_5218/shard-glk6/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html"=
>INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/2635">i915#2635</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@perf@polling-parameterized:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-tglb6/igt@perf@polling-parameterized.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5218/shard-tglb=
5/igt@perf@polling-parameterized.html">FAIL</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/1542">i915#1542</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@feature_discovery@psr2:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-iclb8/igt@feature_discovery@psr2.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/">i915#658</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5218/shard-iclb2/i=
gt@feature_discovery@psr2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@vecs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-kbl1/igt@gem_ctx_isolation@preservation-s3@vecs0.html">D=
MESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1=
80">i915#180</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_5218/shard-kbl1/igt@gem_ctx_isolation@preservation-s3@vecs0.html">PA=
SS</a></li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled:</p>
<ul>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9382/shard-apl4/igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">=
fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/1635">i915#1635</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_5218/shard-apl7/igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled.htm=
l">PASS</a></p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9382/shard-iclb6/igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled.html">=
SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_52=
18/shard-iclb5/igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled.html">PASS</a><=
/p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9382/shard-glk4/igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">=
fdo#109271</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_5218/shard-glk1/igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled.html">PAS=
S</a></p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9382/shard-kbl1/igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">=
fdo#109271</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_5218/shard-kbl2/igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled.html">PAS=
S</a></p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9382/shard-tglb2/igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled.html">=
SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_52=
18/shard-tglb2/igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled.html">PASS</a><=
/p>
</li>
</ul>
</li>
<li>
<p>igt@i915_hangman@error-state-basic:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-snb2/igt@i915_hangman@error-state-basic.html">TIMEOUT</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5218/shar=
d-snb6/igt@i915_hangman@error-state-basic.html">PASS</a> +2 similar issues<=
/li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-iclb6/igt@i915_pm_dc@dc6-psr.html">FAIL</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/454">i915#454</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5218/shard-iclb6/ig=
t@i915_pm_dc@dc6-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-b-64x64-right-edge:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-glk2/igt@kms_cursor_edge_walk@pipe-b-64x64-right-edge.ht=
ml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/1982">i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_5218/shard-glk7/igt@kms_cursor_edge_walk@pipe-b-64x64-right-e=
dge.html">PASS</a> +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@absolute-wf_vblank-interruptible@a-dp1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-apl1/igt@kms_flip@absolute-wf_vblank-interruptible@a-dp1=
.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/1635">i915#1635</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/1982">i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_5218/shard-apl7/igt@kms_flip@absolute-wf_vblank-inte=
rruptible@a-dp1.html">PASS</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-kbl7/igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp1.html"=
>DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/1982">i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_5218/shard-kbl4/igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp1.ht=
ml">PASS</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-stridechange:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-tglb1/igt@kms_frontbuffer_tracking@fbc-stridechange.html=
">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/1982">i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_5218/shard-tglb3/igt@kms_frontbuffer_tracking@fbc-stridechange.=
html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt:</p>
<ul>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9382/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt=
.html">FAIL</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_5218/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt.h=
tml">PASS</a></p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9382/shard-iclb4/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt=
.html">FAIL</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_5218/shard-iclb5/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt.h=
tml">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-pipe-b-frame-sequence:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-hsw6/igt@kms_pipe_crc_basic@read-crc-pipe-b-frame-sequen=
ce.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/1982">i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5218/shard-hsw6/igt@kms_pipe_crc_basic@read-crc-pipe-b-f=
rame-sequence.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-pipe-b-planes:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-hsw6/igt@kms_plane@pixel-format-pipe-b-planes.html">DMES=
G-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/igt-gpu-tools/iss=
ues/6">IGT#6</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_5218/shard-hsw2/igt@kms_plane@pixel-format-pipe-b-planes.html">PASS<=
/a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-pipe-b-planes-source-clamping:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-hsw6/igt@kms_plane@pixel-format-pipe-b-planes-source-cla=
mping.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
gt-gpu-tools/issues/6">IGT#6</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_5218/shard-hsw4/igt@kms_plane@pixel-format-pip=
e-b-planes-source-clamping.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-pipe-c-planes:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-glk8/igt@kms_plane@pixel-format-pipe-c-planes.html">INCO=
MPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2554=
">i915#2554</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_5218/shard-glk7/igt@kms_plane@pixel-format-pipe-c-planes.html">PASS</=
a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_cpu:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-iclb6/igt@kms_psr@psr2_primary_mmap_cpu.html">SKIP</a> (=
<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#10944=
1</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5218=
/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html">PASS</a> +1 similar is=
sue</li>
</ul>
</li>
<li>
<p>igt@perf@disabled-read-error:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-hsw1/igt@perf@disabled-read-error.html">SKIP</a> (<a hre=
f=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5218/shard=
-hsw4/igt@perf@disabled-read-error.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_eio@in-flight-suspend:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-tglb2/igt@gem_eio@in-flight-suspend.html">DMESG-FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#241=
1</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5218=
/shard-tglb1/igt@gem_eio@in-flight-suspend.html">DMESG-WARN</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-queue:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-snb2/igt@gem_exec_schedule@preempt-queue.html">TIMEOUT</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5218/sha=
rd-snb7/igt@gem_exec_schedule@preempt-queue.html">SKIP</a> (<a href=3D"http=
s://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +2 simil=
ar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-iclb1/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2681">i915#2681=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5218/=
shard-iclb4/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/intel/issues/1804">i915#1804</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-evict-pwrite:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-tglb8/igt@i915_pm_rpm@gem-evict-pwrite.html">DMESG-WARN<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#=
2411</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
218/shard-tglb7/igt@i915_pm_rpm@gem-evict-pwrite.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/579">i915#579</a>) +1 simi=
lar issue</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@sysfs-reader:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-tglb7/igt@i915_suspend@sysfs-reader.html">INCOMPLETE</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#143=
6</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1602">i9=
15#1602</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/18=
87">i915#1887</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/2411">i915#2411</a> / <a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/456">i915#456</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_5218/shard-tglb6/igt@i915_suspend@sysfs-reader.html">DMES=
G-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2411=
">i915#2411</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-b-ctm-negative:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-snb2/igt@kms_color_chamelium@pipe-b-ctm-negative.html">T=
IMEOUT</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
5218/shard-snb6/igt@kms_color_chamelium@pipe-b-ctm-negative.html">SKIP</a> =
(<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#1092=
71</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111827">=
fdo#111827</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-tglb1/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend=
.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/2411">i915#2411</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_5218/shard-tglb2/igt@kms_vblank@pipe-b-ts-continuation-dpm=
s-suspend.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/1436">i915#1436</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/1602">i915#1602</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/1798">i915#1798</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/1887">i915#1887</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/456">i915#456</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9382/shard-kbl7/igt@runner@aborted.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5218/shard-kbl1/igt@run=
ner@aborted.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/483">i915#483</a>)</p>
</li>
<li>
<p>shard-iclb:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-iclb1/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-iclb3/igt@runner@abo=
rted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/483">i915#483</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_5218/shard-iclb5/igt@runner@aborted.html">FAIL</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5218/shard-iclb4/ig=
t@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_5218/shard-iclb5/igt@runner@aborted.html">FAIL</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/1814">i915#1814</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/483">i915#=
483</a>)</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9382/shard-apl1/igt@runner@aborted.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a>) -&gt; =
(<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5218/shard-apl3/=
igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_5218/shard-apl8/igt@runner@aborted.html">FAIL</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5218/shard-apl3/igt@run=
ner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/1635">i915#1635</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/1814">i915#1814</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/2295">i915#2295</a>)</p>
</li>
<li>
<p>shard-glk:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-glk7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-glk8/igt@runner@abort=
ed.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/1814">i915#1814</a> / <a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/483">i915#483</a> / [k.org#202321]) -&gt; (<a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5218/shard-glk6/igt@runner@aborte=
d.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5218/shard-glk2/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/1814">i915#1814</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / [k.org#202=
321])</p>
</li>
<li>
<p>shard-tglb:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9382/shard-tglb5/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-tglb6/igt@runner@abo=
rted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI=
_DRM_9382/shard-tglb1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9382/shard-tglb7/igt@runner@aborte=
d.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/1602">i915#1602</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/1814">i915#1814</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/2426">i915#2426</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/409">i915#409</a>) -&gt; (<a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_5218/shard-tglb7/igt@runner@aborted.htm=
l">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5218=
/shard-tglb2/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_5218/shard-tglb3/igt@runner@aborted.html">FA=
IL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1602">i=
915#1602</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2=
295">i915#2295</a>)</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>

</body>
</html>

--===============3819859450107440230==--

--===============0505862717==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0505862717==--
