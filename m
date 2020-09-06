Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sun, 06 Sep 2020 01:35:07 -0000
Message-ID: <159935610768.13721.7960478958163883024@emeril.freedesktop.org>
References: <20200905194023.21029-1-ashutosh.dixit@intel.com>
In-Reply-To: <20200905194023.21029-1-ashutosh.dixit@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgbGliL2lv?=
 =?utf-8?q?ctl=5Fwrappers=3A_Handle_PREAD/PWRITE_ioctls_not_supported_in_g?=
 =?utf-8?q?em=5Fread/write_=28rev11=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1739669285=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1739669285==
Content-Type: multipart/alternative;
 boundary="===============7936793525173666295=="

--===============7936793525173666295==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/ioctl_wrappers: Handle PREAD/PWRITE ioctls not supported in gem_read/write (rev11)
URL   : https://patchwork.freedesktop.org/series/81152/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8966_full -> IGTPW_4959_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4959_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4959_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4959/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4959_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_madvise@dontneed-before-exec:
    - shard-kbl:          [PASS][1] -> [FAIL][2] +2 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8966/shard-kbl1/igt@gem_madvise@dontneed-before-exec.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4959/shard-kbl7/igt@gem_madvise@dontneed-before-exec.html
    - shard-snb:          [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8966/shard-snb5/igt@gem_madvise@dontneed-before-exec.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4959/shard-snb4/igt@gem_madvise@dontneed-before-exec.html
    - shard-iclb:         [PASS][5] -> [FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8966/shard-iclb8/igt@gem_madvise@dontneed-before-exec.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4959/shard-iclb7/igt@gem_madvise@dontneed-before-exec.html
    - shard-hsw:          [PASS][7] -> [FAIL][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8966/shard-hsw4/igt@gem_madvise@dontneed-before-exec.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4959/shard-hsw4/igt@gem_madvise@dontneed-before-exec.html
    - shard-tglb:         [PASS][9] -> [FAIL][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8966/shard-tglb7/igt@gem_madvise@dontneed-before-exec.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4959/shard-tglb7/igt@gem_madvise@dontneed-before-exec.html

  * igt@gen9_exec_parse@batch-zero-length:
    - shard-glk:          [PASS][11] -> [FAIL][12] +2 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8966/shard-glk4/igt@gen9_exec_parse@batch-zero-length.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4959/shard-glk9/igt@gen9_exec_parse@batch-zero-length.html

  
Known issues
------------

  Here are the changes found in IGTPW_4959_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_reloc@basic-many-active@rcs0:
    - shard-hsw:          [PASS][13] -> [FAIL][14] ([i915#2389])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8966/shard-hsw6/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4959/shard-hsw4/igt@gem_exec_reloc@basic-many-active@rcs0.html

  * igt@gem_exec_whisper@basic-fds-all:
    - shard-glk:          [PASS][15] -> [DMESG-WARN][16] ([i915#118] / [i915#95])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8966/shard-glk6/igt@gem_exec_whisper@basic-fds-all.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4959/shard-glk8/igt@gem_exec_whisper@basic-fds-all.html

  * igt@gen7_exec_parse@basic-allocation:
    - shard-hsw:          [PASS][17] -> [TIMEOUT][18] ([i915#1958])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8966/shard-hsw4/igt@gen7_exec_parse@basic-allocation.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4959/shard-hsw6/igt@gen7_exec_parse@basic-allocation.html

  * igt@gen9_exec_parse@batch-invalid-length:
    - shard-apl:          [PASS][19] -> [FAIL][20] ([i915#1635]) +2 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8966/shard-apl7/igt@gen9_exec_parse@batch-invalid-length.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4959/shard-apl2/igt@gen9_exec_parse@batch-invalid-length.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-hsw:          [PASS][21] -> [WARN][22] ([i915#1519])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8966/shard-hsw6/igt@i915_pm_rc6_residency@rc6-fence.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4959/shard-hsw6/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@kms_cursor_crc@pipe-b-cursor-256x256-onscreen:
    - shard-apl:          [PASS][23] -> [FAIL][24] ([i915#1635] / [i915#54])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8966/shard-apl1/igt@kms_cursor_crc@pipe-b-cursor-256x256-onscreen.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4959/shard-apl7/igt@kms_cursor_crc@pipe-b-cursor-256x256-onscreen.html
    - shard-glk:          [PASS][25] -> [FAIL][26] ([i915#54])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8966/shard-glk9/igt@kms_cursor_crc@pipe-b-cursor-256x256-onscreen.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4959/shard-glk8/igt@kms_cursor_crc@pipe-b-cursor-256x256-onscreen.html
    - shard-kbl:          [PASS][27] -> [FAIL][28] ([i915#54])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8966/shard-kbl1/igt@kms_cursor_crc@pipe-b-cursor-256x256-onscreen.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4959/shard-kbl7/igt@kms_cursor_crc@pipe-b-cursor-256x256-onscreen.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-render-xtiled:
    - shard-kbl:          [PASS][29] -> [DMESG-WARN][30] ([i915#1982]) +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8966/shard-kbl7/igt@kms_draw_crc@draw-method-xrgb2101010-render-xtiled.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4959/shard-kbl4/igt@kms_draw_crc@draw-method-xrgb2101010-render-xtiled.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-kbl:          [PASS][31] -> [DMESG-WARN][32] ([i915#180]) +8 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8966/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4959/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_frontbuffer_tracking@psr-farfromfence:
    - shard-tglb:         [PASS][33] -> [DMESG-WARN][34] ([i915#1982]) +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8966/shard-tglb7/igt@kms_frontbuffer_tracking@psr-farfromfence.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4959/shard-tglb5/igt@kms_frontbuffer_tracking@psr-farfromfence.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [PASS][35] -> [SKIP][36] ([i915#433])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8966/shard-tglb3/igt@kms_hdmi_inject@inject-audio.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4959/shard-tglb1/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_psr@psr2_primary_mmap_gtt:
    - shard-iclb:         [PASS][37] -> [SKIP][38] ([fdo#109441])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8966/shard-iclb2/igt@kms_psr@psr2_primary_mmap_gtt.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4959/shard-iclb6/igt@kms_psr@psr2_primary_mmap_gtt.html

  * igt@kms_vblank@pipe-a-wait-forked:
    - shard-snb:          [PASS][39] -> [SKIP][40] ([fdo#109271])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8966/shard-snb5/igt@kms_vblank@pipe-a-wait-forked.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4959/shard-snb2/igt@kms_vblank@pipe-a-wait-forked.html

  * igt@syncobj_wait@single-wait-for-submit-unsubmitted:
    - shard-hsw:          [PASS][41] -> [DMESG-WARN][42] ([i915#1982])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8966/shard-hsw6/igt@syncobj_wait@single-wait-for-submit-unsubmitted.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4959/shard-hsw6/igt@syncobj_wait@single-wait-for-submit-unsubmitted.html

  
#### Possible fixes ####

  * igt@gem_exec_reloc@basic-many-active@vecs0:
    - shard-glk:          [FAIL][43] ([i915#2389]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8966/shard-glk3/igt@gem_exec_reloc@basic-many-active@vecs0.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4959/shard-glk1/igt@gem_exec_reloc@basic-many-active@vecs0.html

  * igt@gem_exec_whisper@basic-queues-forked-all:
    - shard-glk:          [DMESG-WARN][45] ([i915#118] / [i915#95]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8966/shard-glk3/igt@gem_exec_whisper@basic-queues-forked-all.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4959/shard-glk4/igt@gem_exec_whisper@basic-queues-forked-all.html

  * igt@gem_softpin@noreloc-s3:
    - shard-apl:          [INCOMPLETE][47] ([i915#1635]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8966/shard-apl8/igt@gem_softpin@noreloc-s3.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4959/shard-apl1/igt@gem_softpin@noreloc-s3.html

  * igt@i915_selftest@live@active:
    - shard-glk:          [DMESG-FAIL][49] ([i915#666] / [i915#765]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8966/shard-glk2/igt@i915_selftest@live@active.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4959/shard-glk2/igt@i915_selftest@live@active.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-0:
    - shard-kbl:          [DMESG-WARN][51] ([i915#1982]) -> [PASS][52] +3 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8966/shard-kbl4/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4959/shard-kbl7/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html

  * igt@kms_cursor_edge_walk@pipe-b-256x256-left-edge:
    - shard-glk:          [DMESG-WARN][53] ([i915#1982]) -> [PASS][54] +2 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8966/shard-glk2/igt@kms_cursor_edge_walk@pipe-b-256x256-left-edge.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4959/shard-glk7/igt@kms_cursor_edge_walk@pipe-b-256x256-left-edge.html
    - shard-apl:          [DMESG-WARN][55] ([i915#1635] / [i915#1982]) -> [PASS][56] +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8966/shard-apl2/igt@kms_cursor_edge_walk@pipe-b-256x256-left-edge.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4959/shard-apl4/igt@kms_cursor_edge_walk@pipe-b-256x256-left-edge.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-vga1:
    - shard-hsw:          [INCOMPLETE][57] ([i915#2055]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8966/shard-hsw4/igt@kms_flip@flip-vs-suspend-interruptible@a-vga1.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4959/shard-hsw6/igt@kms_flip@flip-vs-suspend-interruptible@a-vga1.html

  * igt@kms_flip@flip-vs-suspend@a-dp1:
    - shard-kbl:          [DMESG-WARN][59] ([i915#180]) -> [PASS][60] +7 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8966/shard-kbl7/igt@kms_flip@flip-vs-suspend@a-dp1.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4959/shard-kbl4/igt@kms_flip@flip-vs-suspend@a-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-pwrite:
    - shard-iclb:         [DMESG-WARN][61] ([i915#1982]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8966/shard-iclb5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-pwrite.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4959/shard-iclb3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
    - shard-glk:          [FAIL][63] ([i915#49]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8966/shard-glk6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4959/shard-glk4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-render:
    - shard-tglb:         [DMESG-WARN][65] ([i915#1982]) -> [PASS][66] +2 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8966/shard-tglb1/igt@kms_frontbuffer_tracking@psr-rgb565-draw-render.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4959/shard-tglb7/igt@kms_frontbuffer_tracking@psr-rgb565-draw-render.html

  * igt@kms_psr2_su@page_flip:
    - shard-tglb:         [SKIP][67] ([i915#1911]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8966/shard-tglb1/igt@kms_psr2_su@page_flip.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4959/shard-tglb7/igt@kms_psr2_su@page_flip.html
    - shard-iclb:         [SKIP][69] ([fdo#109642] / [fdo#111068]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8966/shard-iclb1/igt@kms_psr2_su@page_flip.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4959/shard-iclb2/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_sprite_mmap_cpu:
    - shard-iclb:         [SKIP][71] ([fdo#109441]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8966/shard-iclb6/igt@kms_psr@psr2_sprite_mmap_cpu.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4959/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_cpu.html

  
#### Warnings ####

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [SKIP][73] ([fdo#109349]) -> [DMESG-WARN][74] ([i915#1226])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8966/shard-iclb8/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4959/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1226]: https://gitlab.freedesktop.org/drm/intel/issues/1226
  [i915#1519]: https://gitlab.freedesktop.org/drm/intel/issues/1519
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1911]: https://gitlab.freedesktop.org/drm/intel/issues/1911
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2055]: https://gitlab.freedesktop.org/drm/intel/issues/2055
  [i915#2389]: https://gitlab.freedesktop.org/drm/intel/issues/2389
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#666]: https://gitlab.freedesktop.org/drm/intel/issues/666
  [i915#765]: https://gitlab.freedesktop.org/drm/intel/issues/765
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5779 -> IGTPW_4959
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8966: 62fbde8cd1525ed74aeaf40fb77d23d8a1b92d43 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4959: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4959/index.html
  IGT_5779: f52bf19b5f02d52fc3e201c6467ec3f511227fba @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4959/index.html

--===============7936793525173666295==
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
<tr><td><b>Series:</b></td><td>lib/ioctl_wrappers: Handle PREAD/PWRITE ioctls not supported in gem_read/write (rev11)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/81152/">https://patchwork.freedesktop.org/series/81152/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4959/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4959/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_8966_full -&gt; IGTPW_4959_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_4959_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_4959_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4959/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_4959_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_madvise@dontneed-before-exec:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8966/shard-kbl1/igt@gem_madvise@dontneed-before-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4959/shard-kbl7/igt@gem_madvise@dontneed-before-exec.html">FAIL</a> +2 similar issues</p>
</li>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8966/shard-snb5/igt@gem_madvise@dontneed-before-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4959/shard-snb4/igt@gem_madvise@dontneed-before-exec.html">FAIL</a></p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8966/shard-iclb8/igt@gem_madvise@dontneed-before-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4959/shard-iclb7/igt@gem_madvise@dontneed-before-exec.html">FAIL</a></p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8966/shard-hsw4/igt@gem_madvise@dontneed-before-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4959/shard-hsw4/igt@gem_madvise@dontneed-before-exec.html">FAIL</a></p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8966/shard-tglb7/igt@gem_madvise@dontneed-before-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4959/shard-tglb7/igt@gem_madvise@dontneed-before-exec.html">FAIL</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-zero-length:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8966/shard-glk4/igt@gen9_exec_parse@batch-zero-length.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4959/shard-glk9/igt@gen9_exec_parse@batch-zero-length.html">FAIL</a> +2 similar issues</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_4959_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_reloc@basic-many-active@rcs0:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8966/shard-hsw6/igt@gem_exec_reloc@basic-many-active@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4959/shard-hsw4/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2389">i915#2389</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-fds-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8966/shard-glk6/igt@gem_exec_whisper@basic-fds-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4959/shard-glk8/igt@gem_exec_whisper@basic-fds-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>)</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-allocation:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8966/shard-hsw4/igt@gen7_exec_parse@basic-allocation.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4959/shard-hsw6/igt@gen7_exec_parse@basic-allocation.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-invalid-length:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8966/shard-apl7/igt@gen9_exec_parse@batch-invalid-length.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4959/shard-apl2/igt@gen9_exec_parse@batch-invalid-length.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8966/shard-hsw6/igt@i915_pm_rc6_residency@rc6-fence.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4959/shard-hsw6/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1519">i915#1519</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-256x256-onscreen:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8966/shard-apl1/igt@kms_cursor_crc@pipe-b-cursor-256x256-onscreen.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4959/shard-apl7/igt@kms_cursor_crc@pipe-b-cursor-256x256-onscreen.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a>)</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8966/shard-glk9/igt@kms_cursor_crc@pipe-b-cursor-256x256-onscreen.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4959/shard-glk8/igt@kms_cursor_crc@pipe-b-cursor-256x256-onscreen.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8966/shard-kbl1/igt@kms_cursor_crc@pipe-b-cursor-256x256-onscreen.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4959/shard-kbl7/igt@kms_cursor_crc@pipe-b-cursor-256x256-onscreen.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-render-xtiled:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8966/shard-kbl7/igt@kms_draw_crc@draw-method-xrgb2101010-render-xtiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4959/shard-kbl4/igt@kms_draw_crc@draw-method-xrgb2101010-render-xtiled.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8966/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4959/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-farfromfence:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8966/shard-tglb7/igt@kms_frontbuffer_tracking@psr-farfromfence.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4959/shard-tglb5/igt@kms_frontbuffer_tracking@psr-farfromfence.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8966/shard-tglb3/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4959/shard-tglb1/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/433">i915#433</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_gtt:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8966/shard-iclb2/igt@kms_psr@psr2_primary_mmap_gtt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4959/shard-iclb6/igt@kms_psr@psr2_primary_mmap_gtt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-wait-forked:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8966/shard-snb5/igt@kms_vblank@pipe-a-wait-forked.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4959/shard-snb2/igt@kms_vblank@pipe-a-wait-forked.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>igt@syncobj_wait@single-wait-for-submit-unsubmitted:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8966/shard-hsw6/igt@syncobj_wait@single-wait-for-submit-unsubmitted.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4959/shard-hsw6/igt@syncobj_wait@single-wait-for-submit-unsubmitted.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_reloc@basic-many-active@vecs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8966/shard-glk3/igt@gem_exec_reloc@basic-many-active@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2389">i915#2389</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4959/shard-glk1/igt@gem_exec_reloc@basic-many-active@vecs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues-forked-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8966/shard-glk3/igt@gem_exec_whisper@basic-queues-forked-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4959/shard-glk4/igt@gem_exec_whisper@basic-queues-forked-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_softpin@noreloc-s3:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8966/shard-apl8/igt@gem_softpin@noreloc-s3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4959/shard-apl1/igt@gem_softpin@noreloc-s3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@active:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8966/shard-glk2/igt@i915_selftest@live@active.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/666">i915#666</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/765">i915#765</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4959/shard-glk2/igt@i915_selftest@live@active.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8966/shard-kbl4/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4959/shard-kbl7/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-b-256x256-left-edge:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8966/shard-glk2/igt@kms_cursor_edge_walk@pipe-b-256x256-left-edge.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4959/shard-glk7/igt@kms_cursor_edge_walk@pipe-b-256x256-left-edge.html">PASS</a> +2 similar issues</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8966/shard-apl2/igt@kms_cursor_edge_walk@pipe-b-256x256-left-edge.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4959/shard-apl4/igt@kms_cursor_edge_walk@pipe-b-256x256-left-edge.html">PASS</a> +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-vga1:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8966/shard-hsw4/igt@kms_flip@flip-vs-suspend-interruptible@a-vga1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2055">i915#2055</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4959/shard-hsw6/igt@kms_flip@flip-vs-suspend-interruptible@a-vga1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8966/shard-kbl7/igt@kms_flip@flip-vs-suspend@a-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4959/shard-kbl4/igt@kms_flip@flip-vs-suspend@a-dp1.html">PASS</a> +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8966/shard-iclb5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-pwrite.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4959/shard-iclb3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-pwrite.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8966/shard-glk6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/49">i915#49</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4959/shard-glk4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-render:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8966/shard-tglb1/igt@kms_frontbuffer_tracking@psr-rgb565-draw-render.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4959/shard-tglb7/igt@kms_frontbuffer_tracking@psr-rgb565-draw-render.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip:</p>
<ul>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8966/shard-tglb1/igt@kms_psr2_su@page_flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1911">i915#1911</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4959/shard-tglb7/igt@kms_psr2_su@page_flip.html">PASS</a></p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8966/shard-iclb1/igt@kms_psr2_su@page_flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109642">fdo#109642</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111068">fdo#111068</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4959/shard-iclb2/igt@kms_psr2_su@page_flip.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_mmap_cpu:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8966/shard-iclb6/igt@kms_psr@psr2_sprite_mmap_cpu.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4959/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_cpu.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_dp_dsc@basic-dsc-enable-edp:<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8966/shard-iclb8/igt@kms_dp_dsc@basic-dsc-enable-edp.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109349">fdo#109349</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4959/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1226">i915#1226</a>)</li>
</ul>
</li>
</ul>
<h2>Participating hosts (10 -&gt; 8)</h2>
<p>Missing    (2): pig-skl-6260u pig-glk-j5005 </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5779 -&gt; IGTPW_4959</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_8966: 62fbde8cd1525ed74aeaf40fb77d23d8a1b92d43 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_4959: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4959/index.html<br />
  IGT_5779: f52bf19b5f02d52fc3e201c6467ec3f511227fba @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============7936793525173666295==--

--===============1739669285==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1739669285==--
