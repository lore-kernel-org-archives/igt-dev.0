Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 21 Oct 2020 11:10:53 -0000
Message-ID: <160327865394.17472.15962111451748782285@emeril.freedesktop.org>
References: <20201021085956.5bgbdcmoh357v3tx@smtp.gmail.com>
In-Reply-To: <20201021085956.5bgbdcmoh357v3tx@smtp.gmail.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fcursor=5Fcrc=3A_refactoring_cursor-alpha_subtests_=28rev2?=
 =?utf-8?q?=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1078726366=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Melissa Wen <melissa.srw@gmail.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1078726366==
Content-Type: multipart/alternative;
 boundary="===============0517779861081996321=="

--===============0517779861081996321==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_cursor_crc: refactoring cursor-alpha subtests (rev2)
URL   : https://patchwork.freedesktop.org/series/81060/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_9174_full -> IGTPW_5080_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5080_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5080_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5080_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_flush@basic-wb-ro-before-default:
    - shard-snb:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9174/shard-snb5/igt@gem_exec_flush@basic-wb-ro-before-default.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/shard-snb4/igt@gem_exec_flush@basic-wb-ro-before-default.html

  * igt@kms_big_fb@linear-16bpp-rotate-0:
    - shard-glk:          [PASS][3] -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9174/shard-glk8/igt@kms_big_fb@linear-16bpp-rotate-0.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/shard-glk4/igt@kms_big_fb@linear-16bpp-rotate-0.html

  * {igt@kms_cursor_crc@pipe-c-cursor-alpha} (NEW):
    - shard-glk:          NOTRUN -> [FAIL][5] +2 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/shard-glk6/igt@kms_cursor_crc@pipe-c-cursor-alpha.html

  
New tests
---------

  New tests have been introduced between CI_DRM_9174_full and IGTPW_5080_full:

### New IGT tests (4) ###

  * igt@kms_cursor_crc@pipe-a-cursor-alpha:
    - Statuses : 1 fail(s) 6 pass(s)
    - Exec time: [0.55, 0.86] s

  * igt@kms_cursor_crc@pipe-b-cursor-alpha:
    - Statuses : 1 fail(s) 6 pass(s)
    - Exec time: [0.61, 1.98] s

  * igt@kms_cursor_crc@pipe-c-cursor-alpha:
    - Statuses : 1 fail(s) 5 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.99] s

  * igt@kms_cursor_crc@pipe-d-cursor-alpha:
    - Statuses : 1 pass(s) 6 skip(s)
    - Exec time: [0.0, 1.82] s

  

Known issues
------------

  Here are the changes found in IGTPW_5080_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_setmaster@master-drop-set-user:
    - shard-iclb:         [PASS][6] -> [FAIL][7] ([i915#2247])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9174/shard-iclb6/igt@core_setmaster@master-drop-set-user.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/shard-iclb8/igt@core_setmaster@master-drop-set-user.html
    - shard-kbl:          [PASS][8] -> [FAIL][9] ([i915#2247])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9174/shard-kbl1/igt@core_setmaster@master-drop-set-user.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/shard-kbl4/igt@core_setmaster@master-drop-set-user.html
    - shard-snb:          [PASS][10] -> [FAIL][11] ([i915#2247])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9174/shard-snb2/igt@core_setmaster@master-drop-set-user.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/shard-snb2/igt@core_setmaster@master-drop-set-user.html
    - shard-tglb:         [PASS][12] -> [FAIL][13] ([i915#2247])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9174/shard-tglb8/igt@core_setmaster@master-drop-set-user.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/shard-tglb5/igt@core_setmaster@master-drop-set-user.html
    - shard-apl:          [PASS][14] -> [FAIL][15] ([i915#1635] / [i915#2247])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9174/shard-apl7/igt@core_setmaster@master-drop-set-user.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/shard-apl7/igt@core_setmaster@master-drop-set-user.html
    - shard-glk:          [PASS][16] -> [FAIL][17] ([i915#2247])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9174/shard-glk7/igt@core_setmaster@master-drop-set-user.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/shard-glk3/igt@core_setmaster@master-drop-set-user.html
    - shard-hsw:          [PASS][18] -> [FAIL][19] ([i915#2247])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9174/shard-hsw8/igt@core_setmaster@master-drop-set-user.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/shard-hsw5/igt@core_setmaster@master-drop-set-user.html

  * igt@feature_discovery@psr2:
    - shard-iclb:         [PASS][20] -> [SKIP][21] ([i915#658])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9174/shard-iclb2/igt@feature_discovery@psr2.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/shard-iclb5/igt@feature_discovery@psr2.html

  * igt@gem_exec_reloc@basic-many-active@rcs0:
    - shard-hsw:          [PASS][22] -> [FAIL][23] ([i915#2389])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9174/shard-hsw8/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/shard-hsw7/igt@gem_exec_reloc@basic-many-active@rcs0.html

  * igt@gem_exec_reloc@basic-range:
    - shard-glk:          [PASS][24] -> [INCOMPLETE][25] ([i915#1888])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9174/shard-glk9/igt@gem_exec_reloc@basic-range.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/shard-glk4/igt@gem_exec_reloc@basic-range.html

  * igt@gem_exec_whisper@basic-queues-forked-all:
    - shard-glk:          [PASS][26] -> [FAIL][27] ([i915#2547])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9174/shard-glk5/igt@gem_exec_whisper@basic-queues-forked-all.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/shard-glk4/igt@gem_exec_whisper@basic-queues-forked-all.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-display:
    - shard-hsw:          [PASS][28] -> [FAIL][29] ([i915#1888])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9174/shard-hsw8/igt@gem_partial_pwrite_pread@writes-after-reads-display.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/shard-hsw5/igt@gem_partial_pwrite_pread@writes-after-reads-display.html
    - shard-snb:          [PASS][30] -> [INCOMPLETE][31] ([i915#82])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9174/shard-snb2/igt@gem_partial_pwrite_pread@writes-after-reads-display.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/shard-snb5/igt@gem_partial_pwrite_pread@writes-after-reads-display.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-kbl:          [PASS][32] -> [TIMEOUT][33] ([i915#1288])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9174/shard-kbl1/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/shard-kbl6/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
    - shard-apl:          [PASS][34] -> [TIMEOUT][35] ([i915#1288] / [i915#1635])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9174/shard-apl2/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/shard-apl6/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2:
    - shard-glk:          [PASS][36] -> [FAIL][37] ([i915#79])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9174/shard-glk5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/shard-glk3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc:
    - shard-snb:          [PASS][38] -> [FAIL][39] ([i915#2546])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9174/shard-snb5/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/shard-snb5/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:
    - shard-tglb:         [PASS][40] -> [DMESG-WARN][41] ([i915#1982]) +5 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9174/shard-tglb6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/shard-tglb2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         [PASS][42] -> [SKIP][43] ([fdo#109441]) +2 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9174/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/shard-iclb1/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@kms_vblank@pipe-b-wait-idle:
    - shard-kbl:          [PASS][44] -> [DMESG-WARN][45] ([i915#1982]) +3 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9174/shard-kbl1/igt@kms_vblank@pipe-b-wait-idle.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/shard-kbl4/igt@kms_vblank@pipe-b-wait-idle.html

  * igt@perf@invalid-oa-format-id:
    - shard-kbl:          [PASS][46] -> [SKIP][47] ([fdo#109271] / [i915#1354])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9174/shard-kbl2/igt@perf@invalid-oa-format-id.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/shard-kbl1/igt@perf@invalid-oa-format-id.html
    - shard-hsw:          [PASS][48] -> [SKIP][49] ([fdo#109271])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9174/shard-hsw2/igt@perf@invalid-oa-format-id.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/shard-hsw6/igt@perf@invalid-oa-format-id.html
    - shard-tglb:         [PASS][50] -> [SKIP][51] ([i915#1354])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9174/shard-tglb3/igt@perf@invalid-oa-format-id.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/shard-tglb2/igt@perf@invalid-oa-format-id.html
    - shard-iclb:         [PASS][52] -> [SKIP][53] ([i915#1354])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9174/shard-iclb1/igt@perf@invalid-oa-format-id.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/shard-iclb4/igt@perf@invalid-oa-format-id.html
    - shard-apl:          [PASS][54] -> [SKIP][55] ([fdo#109271] / [i915#1354] / [i915#1635])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9174/shard-apl1/igt@perf@invalid-oa-format-id.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/shard-apl4/igt@perf@invalid-oa-format-id.html

  
#### Possible fixes ####

  * igt@gem_exec_reloc@basic-many-active@vecs0:
    - shard-glk:          [FAIL][56] ([i915#2389]) -> [PASS][57] +2 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9174/shard-glk7/igt@gem_exec_reloc@basic-many-active@vecs0.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/shard-glk5/igt@gem_exec_reloc@basic-many-active@vecs0.html

  * igt@gem_exec_whisper@basic-forked-all:
    - shard-glk:          [DMESG-WARN][58] ([i915#118] / [i915#95]) -> [PASS][59] +1 similar issue
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9174/shard-glk9/igt@gem_exec_whisper@basic-forked-all.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/shard-glk2/igt@gem_exec_whisper@basic-forked-all.html

  * igt@gem_exec_whisper@basic-queues-priority-all:
    - shard-glk:          [FAIL][60] -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9174/shard-glk6/igt@gem_exec_whisper@basic-queues-priority-all.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/shard-glk2/igt@gem_exec_whisper@basic-queues-priority-all.html

  * igt@i915_suspend@debugfs-reader:
    - shard-kbl:          [INCOMPLETE][62] ([i915#155]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9174/shard-kbl4/igt@i915_suspend@debugfs-reader.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/shard-kbl4/igt@i915_suspend@debugfs-reader.html

  * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind@vga-1-pipe-a:
    - shard-hsw:          [DMESG-WARN][64] ([i915#1982]) -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9174/shard-hsw6/igt@kms_atomic_transition@plane-use-after-nonblocking-unbind@vga-1-pipe-a.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/shard-hsw7/igt@kms_atomic_transition@plane-use-after-nonblocking-unbind@vga-1-pipe-a.html

  * igt@kms_big_fb@linear-32bpp-rotate-180:
    - shard-glk:          [DMESG-FAIL][66] ([i915#118] / [i915#95]) -> [PASS][67]
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9174/shard-glk4/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/shard-glk8/igt@kms_big_fb@linear-32bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding:
    - shard-apl:          [FAIL][68] ([i915#1635] / [i915#54]) -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9174/shard-apl4/igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/shard-apl4/igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding.html
    - shard-kbl:          [FAIL][70] ([i915#54]) -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9174/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-blt-untiled:
    - shard-snb:          [FAIL][72] ([i915#54]) -> [PASS][73]
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9174/shard-snb2/igt@kms_draw_crc@draw-method-xrgb2101010-blt-untiled.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/shard-snb7/igt@kms_draw_crc@draw-method-xrgb2101010-blt-untiled.html

  * igt@kms_flip@blocking-wf_vblank@a-edp1:
    - shard-tglb:         [DMESG-WARN][74] ([i915#1982]) -> [PASS][75] +5 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9174/shard-tglb3/igt@kms_flip@blocking-wf_vblank@a-edp1.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/shard-tglb2/igt@kms_flip@blocking-wf_vblank@a-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a2:
    - shard-glk:          [FAIL][76] ([i915#79]) -> [PASS][77]
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9174/shard-glk2/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a2.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/shard-glk2/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a2.html

  * igt@kms_psr@psr2_no_drrs:
    - shard-iclb:         [SKIP][78] ([fdo#109441]) -> [PASS][79] +2 similar issues
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9174/shard-iclb4/igt@kms_psr@psr2_no_drrs.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/shard-iclb2/igt@kms_psr@psr2_no_drrs.html

  * igt@kms_setmode@basic:
    - shard-glk:          [FAIL][80] ([i915#31]) -> [PASS][81]
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9174/shard-glk1/igt@kms_setmode@basic.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/shard-glk9/igt@kms_setmode@basic.html

  * igt@kms_universal_plane@universal-plane-gen9-features-pipe-a:
    - shard-kbl:          [DMESG-WARN][82] ([i915#1982]) -> [PASS][83]
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9174/shard-kbl2/igt@kms_universal_plane@universal-plane-gen9-features-pipe-a.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/shard-kbl7/igt@kms_universal_plane@universal-plane-gen9-features-pipe-a.html

  * igt@perf@polling:
    - shard-glk:          [SKIP][84] ([fdo#109271] / [i915#1354]) -> [PASS][85]
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9174/shard-glk6/igt@perf@polling.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/shard-glk9/igt@perf@polling.html
    - shard-tglb:         [SKIP][86] ([i915#1354]) -> [PASS][87]
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9174/shard-tglb2/igt@perf@polling.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/shard-tglb5/igt@perf@polling.html
    - shard-apl:          [SKIP][88] ([fdo#109271] / [i915#1354] / [i915#1635]) -> [PASS][89]
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9174/shard-apl8/igt@perf@polling.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/shard-apl2/igt@perf@polling.html
    - shard-kbl:          [SKIP][90] ([fdo#109271] / [i915#1354]) -> [PASS][91]
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9174/shard-kbl1/igt@perf@polling.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/shard-kbl7/igt@perf@polling.html
    - shard-hsw:          [SKIP][92] ([fdo#109271]) -> [PASS][93]
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9174/shard-hsw8/igt@perf@polling.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/shard-hsw8/igt@perf@polling.html
    - shard-iclb:         [SKIP][94] ([i915#1354]) -> [PASS][95]
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9174/shard-iclb5/igt@perf@polling.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/shard-iclb1/igt@perf@polling.html

  * igt@perf_pmu@module-unload:
    - shard-apl:          [DMESG-WARN][96] ([i915#1635] / [i915#1982]) -> [PASS][97]
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9174/shard-apl1/igt@perf_pmu@module-unload.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/shard-apl3/igt@perf_pmu@module-unload.html

  * igt@prime_vgem@coherency-blt:
    - shard-snb:          [FAIL][98] -> [PASS][99]
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9174/shard-snb2/igt@prime_vgem@coherency-blt.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/shard-snb7/igt@prime_vgem@coherency-blt.html
    - shard-hsw:          [FAIL][100] -> [PASS][101]
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9174/shard-hsw8/igt@prime_vgem@coherency-blt.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/shard-hsw7/igt@prime_vgem@coherency-blt.html

  
#### Warnings ####

  * igt@kms_content_protection@atomic-dpms:
    - shard-apl:          [TIMEOUT][102] ([i915#1319] / [i915#1635]) -> [FAIL][103] ([fdo#110321] / [fdo#110336] / [i915#1635])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9174/shard-apl6/igt@kms_content_protection@atomic-dpms.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/shard-apl2/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@lic:
    - shard-apl:          [TIMEOUT][104] ([i915#1319] / [i915#1635]) -> [FAIL][105] ([fdo#110321] / [i915#1635])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9174/shard-apl1/igt@kms_content_protection@lic.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/shard-apl8/igt@kms_content_protection@lic.html

  * igt@kms_frontbuffer_tracking@fbcpsr-suspend:
    - shard-tglb:         [DMESG-WARN][106] ([i915#1982] / [i915#2411]) -> [DMESG-WARN][107] ([i915#2411])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9174/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1288]: https://gitlab.freedesktop.org/drm/intel/issues/1288
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1354]: https://gitlab.freedesktop.org/drm/intel/issues/1354
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2247]: https://gitlab.freedesktop.org/drm/intel/issues/2247
  [i915#2389]: https://gitlab.freedesktop.org/drm/intel/issues/2389
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#2521]: https://gitlab.freedesktop.org/drm/intel/issues/2521
  [i915#2546]: https://gitlab.freedesktop.org/drm/intel/issues/2546
  [i915#2547]: https://gitlab.freedesktop.org/drm/intel/issues/2547
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5822 -> IGTPW_5080
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_9174: 66ac51120c329a9f93352cf480f5098adab24af8 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5080: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/index.html
  IGT_5822: b4bcf05cb9839037128905deda7146434155cc41 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/index.html

--===============0517779861081996321==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <title>Project List - Patchwork</title>
  <style id="css-table-select" type="text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>tests/kms_cursor_crc: refactoring cursor-alpha subtests (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/81060/">https://patchwork.freedesktop.org/series/81060/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9174_full -&gt; IGTPW_5080_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5080_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5080_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5080_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_exec_flush@basic-wb-ro-before-default:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9174/shard-snb5/igt@gem_exec_flush@basic-wb-ro-before-default.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/shard-snb4/igt@gem_exec_flush@basic-wb-ro-before-default.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9174/shard-glk8/igt@kms_big_fb@linear-16bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/shard-glk4/igt@kms_big_fb@linear-16bpp-rotate-0.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>{igt@kms_cursor_crc@pipe-c-cursor-alpha} (NEW):</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/shard-glk6/igt@kms_cursor_crc@pipe-c-cursor-alpha.html">FAIL</a> +2 similar issues</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_9174_full and IGTPW_5080_full:</p>
<h3>New IGT tests (4)</h3>
<ul>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-alpha:</p>
<ul>
<li>Statuses : 1 fail(s) 6 pass(s)</li>
<li>Exec time: [0.55, 0.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-alpha:</p>
<ul>
<li>Statuses : 1 fail(s) 6 pass(s)</li>
<li>Exec time: [0.61, 1.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-alpha:</p>
<ul>
<li>Statuses : 1 fail(s) 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-alpha:</p>
<ul>
<li>Statuses : 1 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 1.82] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5080_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_setmaster@master-drop-set-user:</p>
<ul>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9174/shard-iclb6/igt@core_setmaster@master-drop-set-user.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/shard-iclb8/igt@core_setmaster@master-drop-set-user.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2247">i915#2247</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9174/shard-kbl1/igt@core_setmaster@master-drop-set-user.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/shard-kbl4/igt@core_setmaster@master-drop-set-user.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2247">i915#2247</a>)</p>
</li>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9174/shard-snb2/igt@core_setmaster@master-drop-set-user.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/shard-snb2/igt@core_setmaster@master-drop-set-user.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2247">i915#2247</a>)</p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9174/shard-tglb8/igt@core_setmaster@master-drop-set-user.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/shard-tglb5/igt@core_setmaster@master-drop-set-user.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2247">i915#2247</a>)</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9174/shard-apl7/igt@core_setmaster@master-drop-set-user.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/shard-apl7/igt@core_setmaster@master-drop-set-user.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2247">i915#2247</a>)</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9174/shard-glk7/igt@core_setmaster@master-drop-set-user.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/shard-glk3/igt@core_setmaster@master-drop-set-user.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2247">i915#2247</a>)</p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9174/shard-hsw8/igt@core_setmaster@master-drop-set-user.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/shard-hsw5/igt@core_setmaster@master-drop-set-user.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2247">i915#2247</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@feature_discovery@psr2:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9174/shard-iclb2/igt@feature_discovery@psr2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/shard-iclb5/igt@feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-many-active@rcs0:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9174/shard-hsw8/igt@gem_exec_reloc@basic-many-active@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/shard-hsw7/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2389">i915#2389</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-range:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9174/shard-glk9/igt@gem_exec_reloc@basic-range.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/shard-glk4/igt@gem_exec_reloc@basic-range.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1888">i915#1888</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues-forked-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9174/shard-glk5/igt@gem_exec_whisper@basic-queues-forked-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/shard-glk4/igt@gem_exec_whisper@basic-queues-forked-all.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2547">i915#2547</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads-display:</p>
<ul>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9174/shard-hsw8/igt@gem_partial_pwrite_pread@writes-after-reads-display.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/shard-hsw5/igt@gem_partial_pwrite_pread@writes-after-reads-display.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1888">i915#1888</a>)</p>
</li>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9174/shard-snb2/igt@gem_partial_pwrite_pread@writes-after-reads-display.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/shard-snb5/igt@gem_partial_pwrite_pread@writes-after-reads-display.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/82">i915#82</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9174/shard-kbl1/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/shard-kbl6/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1288">i915#1288</a>)</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9174/shard-apl2/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/shard-apl6/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1288">i915#1288</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9174/shard-glk5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/shard-glk3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/79">i915#79</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9174/shard-snb5/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/shard-snb5/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2546">i915#2546</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9174/shard-tglb6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/shard-tglb2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_mmap_cpu:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9174/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/shard-iclb1/igt@kms_psr@psr2_cursor_mmap_cpu.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-wait-idle:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9174/shard-kbl1/igt@kms_vblank@pipe-b-wait-idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/shard-kbl4/igt@kms_vblank@pipe-b-wait-idle.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf@invalid-oa-format-id:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9174/shard-kbl2/igt@perf@invalid-oa-format-id.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/shard-kbl1/igt@perf@invalid-oa-format-id.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>)</p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9174/shard-hsw2/igt@perf@invalid-oa-format-id.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/shard-hsw6/igt@perf@invalid-oa-format-id.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9174/shard-tglb3/igt@perf@invalid-oa-format-id.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/shard-tglb2/igt@perf@invalid-oa-format-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9174/shard-iclb1/igt@perf@invalid-oa-format-id.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/shard-iclb4/igt@perf@invalid-oa-format-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>)</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9174/shard-apl1/igt@perf@invalid-oa-format-id.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/shard-apl4/igt@perf@invalid-oa-format-id.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_reloc@basic-many-active@vecs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9174/shard-glk7/igt@gem_exec_reloc@basic-many-active@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2389">i915#2389</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/shard-glk5/igt@gem_exec_reloc@basic-many-active@vecs0.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-forked-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9174/shard-glk9/igt@gem_exec_whisper@basic-forked-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/shard-glk2/igt@gem_exec_whisper@basic-forked-all.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues-priority-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9174/shard-glk6/igt@gem_exec_whisper@basic-queues-priority-all.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/shard-glk2/igt@gem_exec_whisper@basic-queues-priority-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@debugfs-reader:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9174/shard-kbl4/igt@i915_suspend@debugfs-reader.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/155">i915#155</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/shard-kbl4/igt@i915_suspend@debugfs-reader.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-use-after-nonblocking-unbind@vga-1-pipe-a:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9174/shard-hsw6/igt@kms_atomic_transition@plane-use-after-nonblocking-unbind@vga-1-pipe-a.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/shard-hsw7/igt@kms_atomic_transition@plane-use-after-nonblocking-unbind@vga-1-pipe-a.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-180:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9174/shard-glk4/igt@kms_big_fb@linear-32bpp-rotate-180.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/shard-glk8/igt@kms_big_fb@linear-32bpp-rotate-180.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9174/shard-apl4/igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/shard-apl4/igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9174/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-blt-untiled:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9174/shard-snb2/igt@kms_draw_crc@draw-method-xrgb2101010-blt-untiled.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/shard-snb7/igt@kms_draw_crc@draw-method-xrgb2101010-blt-untiled.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9174/shard-tglb3/igt@kms_flip@blocking-wf_vblank@a-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/shard-tglb2/igt@kms_flip@blocking-wf_vblank@a-edp1.html">PASS</a> +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9174/shard-glk2/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/79">i915#79</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/shard-glk2/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_no_drrs:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9174/shard-iclb4/igt@kms_psr@psr2_no_drrs.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/shard-iclb2/igt@kms_psr@psr2_no_drrs.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9174/shard-glk1/igt@kms_setmode@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/31">i915#31</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/shard-glk9/igt@kms_setmode@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-gen9-features-pipe-a:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9174/shard-kbl2/igt@kms_universal_plane@universal-plane-gen9-features-pipe-a.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/shard-kbl7/igt@kms_universal_plane@universal-plane-gen9-features-pipe-a.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf@polling:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9174/shard-glk6/igt@perf@polling.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/shard-glk9/igt@perf@polling.html">PASS</a></p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9174/shard-tglb2/igt@perf@polling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/shard-tglb5/igt@perf@polling.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9174/shard-apl8/igt@perf@polling.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/shard-apl2/igt@perf@polling.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9174/shard-kbl1/igt@perf@polling.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/shard-kbl7/igt@perf@polling.html">PASS</a></p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9174/shard-hsw8/igt@perf@polling.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/shard-hsw8/igt@perf@polling.html">PASS</a></p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9174/shard-iclb5/igt@perf@polling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/shard-iclb1/igt@perf@polling.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@module-unload:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9174/shard-apl1/igt@perf_pmu@module-unload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/shard-apl3/igt@perf_pmu@module-unload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@prime_vgem@coherency-blt:</p>
<ul>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9174/shard-snb2/igt@prime_vgem@coherency-blt.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/shard-snb7/igt@prime_vgem@coherency-blt.html">PASS</a></p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9174/shard-hsw8/igt@prime_vgem@coherency-blt.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/shard-hsw7/igt@prime_vgem@coherency-blt.html">PASS</a></p>
</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9174/shard-apl6/igt@kms_content_protection@atomic-dpms.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1319">i915#1319</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/shard-apl2/igt@kms_content_protection@atomic-dpms.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110321">fdo#110321</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=110336">fdo#110336</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9174/shard-apl1/igt@kms_content_protection@lic.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1319">i915#1319</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/shard-apl8/igt@kms_content_protection@lic.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110321">fdo#110321</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-suspend:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9174/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (11 -&gt; 8)</h2>
<p>Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5822 -&gt; IGTPW_5080</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9174: 66ac51120c329a9f93352cf480f5098adab24af8 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5080: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5080/index.html<br />
  IGT_5822: b4bcf05cb9839037128905deda7146434155cc41 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============0517779861081996321==--

--===============1078726366==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1078726366==--
