Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 01 Sep 2020 14:15:28 -0000
Message-ID: <159896972890.31089.5864459992126573796@emeril.freedesktop.org>
References: <20200901015836.18127-1-ashutosh.dixit@intel.com>
In-Reply-To: <20200901015836.18127-1-ashutosh.dixit@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgbGliL2lv?=
 =?utf-8?q?ctl=5Fwrappers=3A_Handle_PREAD/PWRITE_ioctls_not_supported_in_g?=
 =?utf-8?q?em=5Fread/write_=28rev6=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1954407536=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1954407536==
Content-Type: multipart/alternative;
 boundary="===============4434851052986665588=="

--===============4434851052986665588==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/ioctl_wrappers: Handle PREAD/PWRITE ioctls not supported in gem_read/write (rev6)
URL   : https://patchwork.freedesktop.org/series/81152/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8948_full -> IGTPW_4933_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4933_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4933_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4933/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4933_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_parallel@engines@fds:
    - shard-tglb:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/shard-tglb5/igt@gem_exec_parallel@engines@fds.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4933/shard-tglb1/igt@gem_exec_parallel@engines@fds.html

  * igt@gem_madvise@dontneed-before-exec:
    - shard-kbl:          [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/shard-kbl1/igt@gem_madvise@dontneed-before-exec.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4933/shard-kbl7/igt@gem_madvise@dontneed-before-exec.html
    - shard-snb:          [PASS][5] -> [FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/shard-snb5/igt@gem_madvise@dontneed-before-exec.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4933/shard-snb4/igt@gem_madvise@dontneed-before-exec.html
    - shard-iclb:         [PASS][7] -> [FAIL][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/shard-iclb8/igt@gem_madvise@dontneed-before-exec.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4933/shard-iclb4/igt@gem_madvise@dontneed-before-exec.html
    - shard-glk:          [PASS][9] -> [FAIL][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/shard-glk6/igt@gem_madvise@dontneed-before-exec.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4933/shard-glk9/igt@gem_madvise@dontneed-before-exec.html
    - shard-hsw:          [PASS][11] -> [FAIL][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/shard-hsw1/igt@gem_madvise@dontneed-before-exec.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4933/shard-hsw6/igt@gem_madvise@dontneed-before-exec.html
    - shard-tglb:         [PASS][13] -> [FAIL][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/shard-tglb7/igt@gem_madvise@dontneed-before-exec.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4933/shard-tglb1/igt@gem_madvise@dontneed-before-exec.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@bc-vga1-hdmi-a1:
    - shard-hsw:          [PASS][15] -> [INCOMPLETE][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/shard-hsw1/igt@kms_flip@2x-flip-vs-suspend-interruptible@bc-vga1-hdmi-a1.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4933/shard-hsw6/igt@kms_flip@2x-flip-vs-suspend-interruptible@bc-vga1-hdmi-a1.html

  
Known issues
------------

  Here are the changes found in IGTPW_4933_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_isolation@preservation-s3@vcs0:
    - shard-kbl:          [PASS][17] -> [DMESG-WARN][18] ([i915#180]) +6 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/shard-kbl2/igt@gem_ctx_isolation@preservation-s3@vcs0.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4933/shard-kbl1/igt@gem_ctx_isolation@preservation-s3@vcs0.html

  * igt@gem_exec_create@forked:
    - shard-glk:          [PASS][19] -> [DMESG-WARN][20] ([i915#118] / [i915#95])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/shard-glk7/igt@gem_exec_create@forked.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4933/shard-glk8/igt@gem_exec_create@forked.html

  * igt@gem_exec_nop@basic-sequential:
    - shard-tglb:         [PASS][21] -> [TIMEOUT][22] ([i915#1958]) +2 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/shard-tglb8/igt@gem_exec_nop@basic-sequential.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4933/shard-tglb1/igt@gem_exec_nop@basic-sequential.html

  * igt@gem_exec_reloc@basic-concurrent16:
    - shard-apl:          [PASS][23] -> [TIMEOUT][24] ([i915#1635] / [i915#1958]) +1 similar issue
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/shard-apl1/igt@gem_exec_reloc@basic-concurrent16.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4933/shard-apl1/igt@gem_exec_reloc@basic-concurrent16.html

  * igt@gem_exec_whisper@basic-forked:
    - shard-iclb:         [PASS][25] -> [TIMEOUT][26] ([i915#1958])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/shard-iclb5/igt@gem_exec_whisper@basic-forked.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4933/shard-iclb6/igt@gem_exec_whisper@basic-forked.html
    - shard-kbl:          [PASS][27] -> [TIMEOUT][28] ([i915#1958])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/shard-kbl1/igt@gem_exec_whisper@basic-forked.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4933/shard-kbl1/igt@gem_exec_whisper@basic-forked.html

  * igt@gem_exec_whisper@basic-queues-forked:
    - shard-glk:          [PASS][29] -> [TIMEOUT][30] ([i915#1958]) +2 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/shard-glk6/igt@gem_exec_whisper@basic-queues-forked.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4933/shard-glk4/igt@gem_exec_whisper@basic-queues-forked.html

  * igt@gem_madvise@dontneed-before-exec:
    - shard-apl:          [PASS][31] -> [FAIL][32] ([i915#1635])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/shard-apl2/igt@gem_madvise@dontneed-before-exec.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4933/shard-apl2/igt@gem_madvise@dontneed-before-exec.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-apl:          [PASS][33] -> [FAIL][34] ([i915#1635] / [i915#644])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/shard-apl7/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4933/shard-apl6/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_sync@basic-store-all:
    - shard-kbl:          [PASS][35] -> [FAIL][36] ([i915#2356])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/shard-kbl4/igt@gem_sync@basic-store-all.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4933/shard-kbl4/igt@gem_sync@basic-store-all.html

  * igt@gen7_exec_parse@basic-allocation:
    - shard-hsw:          [PASS][37] -> [TIMEOUT][38] ([i915#1958])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/shard-hsw6/igt@gen7_exec_parse@basic-allocation.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4933/shard-hsw1/igt@gen7_exec_parse@basic-allocation.html

  * igt@i915_selftest@mock@contexts:
    - shard-apl:          [PASS][39] -> [INCOMPLETE][40] ([i915#1635] / [i915#2278])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/shard-apl1/igt@i915_selftest@mock@contexts.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4933/shard-apl4/igt@i915_selftest@mock@contexts.html

  * igt@kms_cursor_edge_walk@pipe-c-64x64-left-edge:
    - shard-glk:          [PASS][41] -> [DMESG-WARN][42] ([i915#1982])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/shard-glk6/igt@kms_cursor_edge_walk@pipe-c-64x64-left-edge.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4933/shard-glk1/igt@kms_cursor_edge_walk@pipe-c-64x64-left-edge.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-vga1-hdmi-a1:
    - shard-hsw:          [PASS][43] -> [DMESG-WARN][44] ([i915#1982])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/shard-hsw6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-vga1-hdmi-a1.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4933/shard-hsw6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-vga1-hdmi-a1.html

  * igt@kms_flip@blocking-wf_vblank@a-dp1:
    - shard-kbl:          [PASS][45] -> [DMESG-WARN][46] ([i915#1982]) +4 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/shard-kbl4/igt@kms_flip@blocking-wf_vblank@a-dp1.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4933/shard-kbl2/igt@kms_flip@blocking-wf_vblank@a-dp1.html

  * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1:
    - shard-glk:          [PASS][47] -> [FAIL][48] ([i915#79])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/shard-glk1/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4933/shard-glk4/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1:
    - shard-hsw:          [PASS][49] -> [INCOMPLETE][50] ([i915#2055])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/shard-hsw6/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4933/shard-hsw6/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt:
    - shard-apl:          [PASS][51] -> [FAIL][52] ([i915#1635] / [i915#49])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/shard-apl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4933/shard-apl8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html
    - shard-kbl:          [PASS][53] -> [FAIL][54] ([i915#49])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4933/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw:
    - shard-glk:          [PASS][55] -> [DMESG-FAIL][56] ([i915#118] / [i915#95])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/shard-glk8/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4933/shard-glk7/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-fullscreen:
    - shard-tglb:         [PASS][57] -> [DMESG-WARN][58] ([i915#1982]) +5 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/shard-tglb3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-fullscreen.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4933/shard-tglb7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_psr@psr2_sprite_mmap_gtt:
    - shard-iclb:         [PASS][59] -> [SKIP][60] ([fdo#109441]) +1 similar issue
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4933/shard-iclb4/igt@kms_psr@psr2_sprite_mmap_gtt.html

  * igt@kms_setmode@basic:
    - shard-kbl:          [PASS][61] -> [FAIL][62] ([i915#31])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/shard-kbl1/igt@kms_setmode@basic.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4933/shard-kbl7/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-b-wait-busy:
    - shard-apl:          [PASS][63] -> [DMESG-WARN][64] ([i915#1635] / [i915#1982]) +1 similar issue
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/shard-apl1/igt@kms_vblank@pipe-b-wait-busy.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4933/shard-apl2/igt@kms_vblank@pipe-b-wait-busy.html

  
#### Possible fixes ####

  * {igt@feature_discovery@psr2}:
    - shard-iclb:         [SKIP][65] ([i915#658]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/shard-iclb6/igt@feature_discovery@psr2.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4933/shard-iclb2/igt@feature_discovery@psr2.html

  * igt@gem_exec_gttfill@basic:
    - shard-glk:          [DMESG-WARN][67] ([i915#118] / [i915#95]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/shard-glk4/igt@gem_exec_gttfill@basic.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4933/shard-glk2/igt@gem_exec_gttfill@basic.html

  * igt@gem_exec_reloc@basic-many-active@rcs0:
    - shard-apl:          [FAIL][69] ([i915#1635] / [i915#2389]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/shard-apl8/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4933/shard-apl6/igt@gem_exec_reloc@basic-many-active@rcs0.html
    - shard-glk:          [FAIL][71] ([i915#2389]) -> [PASS][72] +3 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/shard-glk1/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4933/shard-glk5/igt@gem_exec_reloc@basic-many-active@rcs0.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-kbl:          [DMESG-WARN][73] ([i915#180]) -> [PASS][74] +3 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/shard-kbl7/igt@gem_exec_suspend@basic-s3.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4933/shard-kbl2/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_exec_whisper@basic-fds-forked-all:
    - shard-kbl:          [TIMEOUT][75] ([i915#1958]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/shard-kbl1/igt@gem_exec_whisper@basic-fds-forked-all.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4933/shard-kbl2/igt@gem_exec_whisper@basic-fds-forked-all.html

  * igt@gem_exec_whisper@basic-fds-priority:
    - shard-tglb:         [TIMEOUT][77] ([i915#1958]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/shard-tglb2/igt@gem_exec_whisper@basic-fds-priority.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4933/shard-tglb2/igt@gem_exec_whisper@basic-fds-priority.html

  * igt@gem_exec_whisper@basic-forked:
    - shard-apl:          [TIMEOUT][79] ([i915#1635] / [i915#1958]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/shard-apl8/igt@gem_exec_whisper@basic-forked.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4933/shard-apl8/igt@gem_exec_whisper@basic-forked.html
    - shard-glk:          [TIMEOUT][81] ([i915#1958]) -> [PASS][82] +1 similar issue
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/shard-glk5/igt@gem_exec_whisper@basic-forked.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4933/shard-glk2/igt@gem_exec_whisper@basic-forked.html

  * igt@gem_mmap_gtt@zero-extend:
    - shard-hsw:          [DMESG-WARN][83] ([i915#1982]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/shard-hsw6/igt@gem_mmap_gtt@zero-extend.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4933/shard-hsw6/igt@gem_mmap_gtt@zero-extend.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-kbl:          [INCOMPLETE][85] ([i915#155] / [i915#794]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/shard-kbl2/igt@i915_suspend@fence-restore-tiled2untiled.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4933/shard-kbl4/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_cursor_crc@pipe-b-cursor-64x21-onscreen:
    - shard-kbl:          [FAIL][87] ([i915#54]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/shard-kbl7/igt@kms_cursor_crc@pipe-b-cursor-64x21-onscreen.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4933/shard-kbl7/igt@kms_cursor_crc@pipe-b-cursor-64x21-onscreen.html
    - shard-apl:          [FAIL][89] ([i915#1635] / [i915#54]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/shard-apl8/igt@kms_cursor_crc@pipe-b-cursor-64x21-onscreen.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4933/shard-apl7/igt@kms_cursor_crc@pipe-b-cursor-64x21-onscreen.html
    - shard-glk:          [FAIL][91] ([i915#54]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/shard-glk1/igt@kms_cursor_crc@pipe-b-cursor-64x21-onscreen.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4933/shard-glk3/igt@kms_cursor_crc@pipe-b-cursor-64x21-onscreen.html

  * igt@kms_draw_crc@draw-method-rgb565-blt-xtiled:
    - shard-apl:          [DMESG-WARN][93] ([i915#1635] / [i915#1982]) -> [PASS][94] +1 similar issue
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/shard-apl7/igt@kms_draw_crc@draw-method-rgb565-blt-xtiled.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4933/shard-apl3/igt@kms_draw_crc@draw-method-rgb565-blt-xtiled.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:
    - shard-kbl:          [DMESG-WARN][95] ([i915#1982]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4933/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [INCOMPLETE][97] ([i915#155]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4933/shard-kbl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_plane@plane-panning-bottom-right-pipe-a-planes:
    - shard-glk:          [FAIL][99] ([i915#1036]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/shard-glk3/igt@kms_plane@plane-panning-bottom-right-pipe-a-planes.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4933/shard-glk4/igt@kms_plane@plane-panning-bottom-right-pipe-a-planes.html

  * igt@kms_plane_scaling@pipe-c-scaler-with-clipping-clamping:
    - shard-iclb:         [DMESG-WARN][101] ([i915#1982]) -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/shard-iclb3/igt@kms_plane_scaling@pipe-c-scaler-with-clipping-clamping.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4933/shard-iclb6/igt@kms_plane_scaling@pipe-c-scaler-with-clipping-clamping.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         [SKIP][103] ([fdo#109441]) -> [PASS][104] +1 similar issue
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/shard-iclb8/igt@kms_psr@psr2_primary_page_flip.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4933/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html

  * igt@kms_universal_plane@universal-plane-pipe-c-sanity:
    - shard-tglb:         [DMESG-WARN][105] ([i915#1982]) -> [PASS][106]
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/shard-tglb7/igt@kms_universal_plane@universal-plane-pipe-c-sanity.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4933/shard-tglb2/igt@kms_universal_plane@universal-plane-pipe-c-sanity.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [i915#1036]: https://gitlab.freedesktop.org/drm/intel/issues/1036
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2055]: https://gitlab.freedesktop.org/drm/intel/issues/2055
  [i915#2278]: https://gitlab.freedesktop.org/drm/intel/issues/2278
  [i915#2356]: https://gitlab.freedesktop.org/drm/intel/issues/2356
  [i915#2389]: https://gitlab.freedesktop.org/drm/intel/issues/2389
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#794]: https://gitlab.freedesktop.org/drm/intel/issues/794
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5774 -> IGTPW_4933
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8948: 4a551ee5aa0f402a647f797437b69af12ce78642 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4933: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4933/index.html
  IGT_5774: 2a5db9f60241383272aeec176e1b97b3f487209f @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4933/index.html

--===============4434851052986665588==
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
<tr><td><b>Series:</b></td><td>lib/ioctl_wrappers: Handle PREAD/PWRITE ioctls not supported in gem_read/write (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/81152/">https://patchwork.freedesktop.org/series/81152/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4933/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4933/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_8948_full -&gt; IGTPW_4933_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_4933_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_4933_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4933/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_4933_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_exec_parallel@engines@fds:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/shard-tglb5/igt@gem_exec_parallel@engines@fds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4933/shard-tglb1/igt@gem_exec_parallel@engines@fds.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@gem_madvise@dontneed-before-exec:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/shard-kbl1/igt@gem_madvise@dontneed-before-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4933/shard-kbl7/igt@gem_madvise@dontneed-before-exec.html">FAIL</a></p>
</li>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/shard-snb5/igt@gem_madvise@dontneed-before-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4933/shard-snb4/igt@gem_madvise@dontneed-before-exec.html">FAIL</a></p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/shard-iclb8/igt@gem_madvise@dontneed-before-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4933/shard-iclb4/igt@gem_madvise@dontneed-before-exec.html">FAIL</a></p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/shard-glk6/igt@gem_madvise@dontneed-before-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4933/shard-glk9/igt@gem_madvise@dontneed-before-exec.html">FAIL</a></p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/shard-hsw1/igt@gem_madvise@dontneed-before-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4933/shard-hsw6/igt@gem_madvise@dontneed-before-exec.html">FAIL</a></p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/shard-tglb7/igt@gem_madvise@dontneed-before-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4933/shard-tglb1/igt@gem_madvise@dontneed-before-exec.html">FAIL</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@bc-vga1-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/shard-hsw1/igt@kms_flip@2x-flip-vs-suspend-interruptible@bc-vga1-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4933/shard-hsw6/igt@kms_flip@2x-flip-vs-suspend-interruptible@bc-vga1-hdmi-a1.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_4933_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@vcs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/shard-kbl2/igt@gem_ctx_isolation@preservation-s3@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4933/shard-kbl1/igt@gem_ctx_isolation@preservation-s3@vcs0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_create@forked:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/shard-glk7/igt@gem_exec_create@forked.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4933/shard-glk8/igt@gem_exec_create@forked.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_nop@basic-sequential:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/shard-tglb8/igt@gem_exec_nop@basic-sequential.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4933/shard-tglb1/igt@gem_exec_nop@basic-sequential.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-concurrent16:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/shard-apl1/igt@gem_exec_reloc@basic-concurrent16.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4933/shard-apl1/igt@gem_exec_reloc@basic-concurrent16.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-forked:</p>
<ul>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/shard-iclb5/igt@gem_exec_whisper@basic-forked.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4933/shard-iclb6/igt@gem_exec_whisper@basic-forked.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/shard-kbl1/igt@gem_exec_whisper@basic-forked.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4933/shard-kbl1/igt@gem_exec_whisper@basic-forked.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues-forked:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/shard-glk6/igt@gem_exec_whisper@basic-queues-forked.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4933/shard-glk4/igt@gem_exec_whisper@basic-queues-forked.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_madvise@dontneed-before-exec:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/shard-apl2/igt@gem_madvise@dontneed-before-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4933/shard-apl2/igt@gem_madvise@dontneed-before-exec.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ppgtt@flink-and-close-vma-leak:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/shard-apl7/igt@gem_ppgtt@flink-and-close-vma-leak.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4933/shard-apl6/igt@gem_ppgtt@flink-and-close-vma-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/644">i915#644</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_sync@basic-store-all:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/shard-kbl4/igt@gem_sync@basic-store-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4933/shard-kbl4/igt@gem_sync@basic-store-all.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2356">i915#2356</a>)</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-allocation:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/shard-hsw6/igt@gen7_exec_parse@basic-allocation.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4933/shard-hsw1/igt@gen7_exec_parse@basic-allocation.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@mock@contexts:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/shard-apl1/igt@i915_selftest@mock@contexts.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4933/shard-apl4/igt@i915_selftest@mock@contexts.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2278">i915#2278</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-c-64x64-left-edge:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/shard-glk6/igt@kms_cursor_edge_walk@pipe-c-64x64-left-edge.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4933/shard-glk1/igt@kms_cursor_edge_walk@pipe-c-64x64-left-edge.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-vga1-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/shard-hsw6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-vga1-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4933/shard-hsw6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-vga1-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/shard-kbl4/igt@kms_flip@blocking-wf_vblank@a-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4933/shard-kbl2/igt@kms_flip@blocking-wf_vblank@a-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/shard-glk1/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4933/shard-glk4/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/79">i915#79</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/shard-hsw6/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4933/shard-hsw6/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2055">i915#2055</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/shard-apl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4933/shard-apl8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/49">i915#49</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4933/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/49">i915#49</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/shard-glk8/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4933/shard-glk7/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/shard-tglb3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-fullscreen.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4933/shard-tglb7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-fullscreen.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_mmap_gtt:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4933/shard-iclb4/igt@kms_psr@psr2_sprite_mmap_gtt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/shard-kbl1/igt@kms_setmode@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4933/shard-kbl7/igt@kms_setmode@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/31">i915#31</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-wait-busy:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/shard-apl1/igt@kms_vblank@pipe-b-wait-busy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4933/shard-apl2/igt@kms_vblank@pipe-b-wait-busy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>{igt@feature_discovery@psr2}:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/shard-iclb6/igt@feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4933/shard-iclb2/igt@feature_discovery@psr2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_gttfill@basic:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/shard-glk4/igt@gem_exec_gttfill@basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4933/shard-glk2/igt@gem_exec_gttfill@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-many-active@rcs0:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/shard-apl8/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2389">i915#2389</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4933/shard-apl6/igt@gem_exec_reloc@basic-many-active@rcs0.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/shard-glk1/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2389">i915#2389</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4933/shard-glk5/igt@gem_exec_reloc@basic-many-active@rcs0.html">PASS</a> +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/shard-kbl7/igt@gem_exec_suspend@basic-s3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4933/shard-kbl2/igt@gem_exec_suspend@basic-s3.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-fds-forked-all:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/shard-kbl1/igt@gem_exec_whisper@basic-fds-forked-all.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4933/shard-kbl2/igt@gem_exec_whisper@basic-fds-forked-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-fds-priority:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/shard-tglb2/igt@gem_exec_whisper@basic-fds-priority.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4933/shard-tglb2/igt@gem_exec_whisper@basic-fds-priority.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-forked:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/shard-apl8/igt@gem_exec_whisper@basic-forked.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4933/shard-apl8/igt@gem_exec_whisper@basic-forked.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/shard-glk5/igt@gem_exec_whisper@basic-forked.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4933/shard-glk2/igt@gem_exec_whisper@basic-forked.html">PASS</a> +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@zero-extend:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/shard-hsw6/igt@gem_mmap_gtt@zero-extend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4933/shard-hsw6/igt@gem_mmap_gtt@zero-extend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-tiled2untiled:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/shard-kbl2/igt@i915_suspend@fence-restore-tiled2untiled.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/155">i915#155</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/794">i915#794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4933/shard-kbl4/igt@i915_suspend@fence-restore-tiled2untiled.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-64x21-onscreen:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/shard-kbl7/igt@kms_cursor_crc@pipe-b-cursor-64x21-onscreen.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4933/shard-kbl7/igt@kms_cursor_crc@pipe-b-cursor-64x21-onscreen.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/shard-apl8/igt@kms_cursor_crc@pipe-b-cursor-64x21-onscreen.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4933/shard-apl7/igt@kms_cursor_crc@pipe-b-cursor-64x21-onscreen.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/shard-glk1/igt@kms_cursor_crc@pipe-b-cursor-64x21-onscreen.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4933/shard-glk3/igt@kms_cursor_crc@pipe-b-cursor-64x21-onscreen.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-blt-xtiled:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/shard-apl7/igt@kms_draw_crc@draw-method-rgb565-blt-xtiled.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4933/shard-apl3/igt@kms_draw_crc@draw-method-rgb565-blt-xtiled.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4933/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/155">i915#155</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4933/shard-kbl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-pipe-a-planes:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/shard-glk3/igt@kms_plane@plane-panning-bottom-right-pipe-a-planes.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1036">i915#1036</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4933/shard-glk4/igt@kms_plane@plane-panning-bottom-right-pipe-a-planes.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@pipe-c-scaler-with-clipping-clamping:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/shard-iclb3/igt@kms_plane_scaling@pipe-c-scaler-with-clipping-clamping.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4933/shard-iclb6/igt@kms_plane_scaling@pipe-c-scaler-with-clipping-clamping.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_page_flip:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/shard-iclb8/igt@kms_psr@psr2_primary_page_flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4933/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-pipe-c-sanity:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/shard-tglb7/igt@kms_universal_plane@universal-plane-pipe-c-sanity.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4933/shard-tglb2/igt@kms_universal_plane@universal-plane-pipe-c-sanity.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (10 -&gt; 8)</h2>
<p>Missing    (2): pig-skl-6260u pig-glk-j5005 </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5774 -&gt; IGTPW_4933</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_8948: 4a551ee5aa0f402a647f797437b69af12ce78642 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_4933: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4933/index.html<br />
  IGT_5774: 2a5db9f60241383272aeec176e1b97b3f487209f @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============4434851052986665588==--

--===============1954407536==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1954407536==--
