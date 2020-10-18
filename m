Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sun, 18 Oct 2020 17:58:42 -0000
Message-ID: <160304392200.4852.5504113430087551149@emeril.freedesktop.org>
References: <20201018162548.2445717-1-apoorva1.singh@intel.com>
In-Reply-To: <20201018162548.2445717-1-apoorva1.singh@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fctx=5Fclone=3A_Added_test_description_for_test_case?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1001629203=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: apoorva1.singh@intel.com
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1001629203==
Content-Type: multipart/alternative;
 boundary="===============9064261512518419983=="

--===============9064261512518419983==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: i915/gem_ctx_clone: Added test description for test case
URL   : https://patchwork.freedesktop.org/series/82799/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_9159_full -> IGTPW_5072_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5072_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5072_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5072/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5072_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_workarounds@reset:
    - shard-snb:          [PASS][1] -> [TIMEOUT][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9159/shard-snb4/igt@gem_workarounds@reset.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5072/shard-snb7/igt@gem_workarounds@reset.html

  
Known issues
------------

  Here are the changes found in IGTPW_5072_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - shard-iclb:         [PASS][3] -> [DMESG-WARN][4] ([i915#1982])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9159/shard-iclb5/igt@core_hotunplug@unbind-rebind.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5072/shard-iclb5/igt@core_hotunplug@unbind-rebind.html

  * igt@gem_exec_suspend@basic-s0:
    - shard-hsw:          [PASS][5] -> [FAIL][6] ([i915#1888])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9159/shard-hsw7/igt@gem_exec_suspend@basic-s0.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5072/shard-hsw2/igt@gem_exec_suspend@basic-s0.html
    - shard-snb:          [PASS][7] -> [INCOMPLETE][8] ([i915#82])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9159/shard-snb7/igt@gem_exec_suspend@basic-s0.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5072/shard-snb5/igt@gem_exec_suspend@basic-s0.html
    - shard-glk:          [PASS][9] -> [FAIL][10] ([i915#1888])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9159/shard-glk9/igt@gem_exec_suspend@basic-s0.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5072/shard-glk2/igt@gem_exec_suspend@basic-s0.html

  * igt@gem_exec_whisper@basic-forked-all:
    - shard-glk:          [PASS][11] -> [DMESG-WARN][12] ([i915#118] / [i915#95]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9159/shard-glk4/igt@gem_exec_whisper@basic-forked-all.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5072/shard-glk5/igt@gem_exec_whisper@basic-forked-all.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-ytiled:
    - shard-apl:          [PASS][13] -> [DMESG-WARN][14] ([i915#1635] / [i915#1982]) +1 similar issue
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9159/shard-apl6/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-ytiled.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5072/shard-apl2/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-ytiled.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-gtt:
    - shard-tglb:         [PASS][15] -> [DMESG-WARN][16] ([i915#1982]) +4 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9159/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-gtt.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5072/shard-tglb3/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-gtt.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         [PASS][17] -> [SKIP][18] ([fdo#109441])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9159/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5072/shard-iclb7/igt@kms_psr@psr2_primary_page_flip.html

  * igt@perf@non-sampling-read-error:
    - shard-tglb:         [PASS][19] -> [SKIP][20] ([i915#1354]) +2 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9159/shard-tglb1/igt@perf@non-sampling-read-error.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5072/shard-tglb7/igt@perf@non-sampling-read-error.html
    - shard-apl:          [PASS][21] -> [SKIP][22] ([fdo#109271] / [i915#1354] / [i915#1635]) +2 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9159/shard-apl6/igt@perf@non-sampling-read-error.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5072/shard-apl3/igt@perf@non-sampling-read-error.html
    - shard-glk:          [PASS][23] -> [SKIP][24] ([fdo#109271] / [i915#1354]) +2 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9159/shard-glk6/igt@perf@non-sampling-read-error.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5072/shard-glk9/igt@perf@non-sampling-read-error.html
    - shard-hsw:          [PASS][25] -> [SKIP][26] ([fdo#109271]) +2 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9159/shard-hsw4/igt@perf@non-sampling-read-error.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5072/shard-hsw1/igt@perf@non-sampling-read-error.html
    - shard-iclb:         [PASS][27] -> [SKIP][28] ([i915#1354]) +2 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9159/shard-iclb7/igt@perf@non-sampling-read-error.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5072/shard-iclb2/igt@perf@non-sampling-read-error.html

  * igt@perf@polling-parameterized:
    - shard-iclb:         [PASS][29] -> [FAIL][30] ([i915#1542])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9159/shard-iclb1/igt@perf@polling-parameterized.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5072/shard-iclb5/igt@perf@polling-parameterized.html

  * igt@perf@polling-small-buf:
    - shard-iclb:         [PASS][31] -> [FAIL][32] ([i915#1722])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9159/shard-iclb5/igt@perf@polling-small-buf.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5072/shard-iclb2/igt@perf@polling-small-buf.html

  * igt@perf@whitelisted-registers-userspace-config:
    - shard-kbl:          [PASS][33] -> [SKIP][34] ([fdo#109271] / [i915#1354]) +2 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9159/shard-kbl6/igt@perf@whitelisted-registers-userspace-config.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5072/shard-kbl4/igt@perf@whitelisted-registers-userspace-config.html

  * igt@testdisplay:
    - shard-kbl:          [PASS][35] -> [DMESG-WARN][36] ([i915#165] / [i915#78])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9159/shard-kbl1/igt@testdisplay.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5072/shard-kbl2/igt@testdisplay.html

  
#### Possible fixes ####

  * igt@core_hotunplug@hotrebind-lateclose:
    - shard-iclb:         [INCOMPLETE][37] -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9159/shard-iclb4/igt@core_hotunplug@hotrebind-lateclose.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5072/shard-iclb2/igt@core_hotunplug@hotrebind-lateclose.html
    - shard-tglb:         [INCOMPLETE][39] ([i915#1602]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9159/shard-tglb7/igt@core_hotunplug@hotrebind-lateclose.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5072/shard-tglb7/igt@core_hotunplug@hotrebind-lateclose.html
    - shard-apl:          [INCOMPLETE][41] ([i915#1635]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9159/shard-apl3/igt@core_hotunplug@hotrebind-lateclose.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5072/shard-apl3/igt@core_hotunplug@hotrebind-lateclose.html
    - shard-glk:          [INCOMPLETE][43] -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9159/shard-glk1/igt@core_hotunplug@hotrebind-lateclose.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5072/shard-glk9/igt@core_hotunplug@hotrebind-lateclose.html
    - shard-kbl:          [INCOMPLETE][45] -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9159/shard-kbl3/igt@core_hotunplug@hotrebind-lateclose.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5072/shard-kbl4/igt@core_hotunplug@hotrebind-lateclose.html

  * igt@gem_busy@parallel@bcs0:
    - shard-snb:          [FAIL][47] ([i915#2021]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9159/shard-snb4/igt@gem_busy@parallel@bcs0.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5072/shard-snb2/igt@gem_busy@parallel@bcs0.html

  * igt@gem_eio@in-flight-contexts-10ms:
    - shard-hsw:          [TIMEOUT][49] ([i915#1976]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9159/shard-hsw4/igt@gem_eio@in-flight-contexts-10ms.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5072/shard-hsw1/igt@gem_eio@in-flight-contexts-10ms.html

  * igt@gem_exec_reloc@basic-many-active@rcs0:
    - shard-apl:          [FAIL][51] ([i915#1635] / [i915#2389]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9159/shard-apl1/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5072/shard-apl3/igt@gem_exec_reloc@basic-many-active@rcs0.html

  * igt@gem_exec_whisper@basic-normal:
    - shard-glk:          [DMESG-WARN][53] ([i915#118] / [i915#95]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9159/shard-glk4/igt@gem_exec_whisper@basic-normal.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5072/shard-glk1/igt@gem_exec_whisper@basic-normal.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy-gup@uc:
    - shard-hsw:          [FAIL][55] ([i915#1888]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9159/shard-hsw4/igt@gem_userptr_blits@map-fixed-invalidate-busy-gup@uc.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5072/shard-hsw2/igt@gem_userptr_blits@map-fixed-invalidate-busy-gup@uc.html

  * {igt@kms_async_flips@async-flip-with-page-flip-events}:
    - shard-kbl:          [FAIL][57] ([i915#2521]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9159/shard-kbl4/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5072/shard-kbl4/igt@kms_async_flips@async-flip-with-page-flip-events.html
    - shard-glk:          [FAIL][59] ([i915#2521]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9159/shard-glk7/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5072/shard-glk8/igt@kms_async_flips@async-flip-with-page-flip-events.html

  * igt@kms_flip@2x-plain-flip-interruptible@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          [DMESG-WARN][61] ([i915#1982]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9159/shard-glk3/igt@kms_flip@2x-plain-flip-interruptible@ab-hdmi-a1-hdmi-a2.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5072/shard-glk5/igt@kms_flip@2x-plain-flip-interruptible@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@blocking-wf_vblank@a-edp1:
    - shard-tglb:         [DMESG-WARN][63] ([i915#1982]) -> [PASS][64] +3 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9159/shard-tglb5/igt@kms_flip@blocking-wf_vblank@a-edp1.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5072/shard-tglb2/igt@kms_flip@blocking-wf_vblank@a-edp1.html

  * igt@kms_flip@flip-vs-suspend@c-hdmi-a1:
    - shard-hsw:          [INCOMPLETE][65] ([i915#2055]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9159/shard-hsw2/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5072/shard-hsw1/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html

  * igt@kms_flip@wf_vblank-ts-check@a-dp1:
    - shard-kbl:          [DMESG-WARN][67] ([i915#1982]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9159/shard-kbl7/igt@kms_flip@wf_vblank-ts-check@a-dp1.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5072/shard-kbl2/igt@kms_flip@wf_vblank-ts-check@a-dp1.html

  * igt@kms_mmap_write_crc@main:
    - shard-kbl:          [DMESG-WARN][69] ([i915#165]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9159/shard-kbl2/igt@kms_mmap_write_crc@main.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5072/shard-kbl6/igt@kms_mmap_write_crc@main.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [SKIP][71] ([fdo#109441]) -> [PASS][72] +1 similar issue
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9159/shard-iclb4/igt@kms_psr@psr2_sprite_plane_move.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5072/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_vblank@pipe-c-wait-idle:
    - shard-apl:          [DMESG-WARN][73] ([i915#1635] / [i915#1982]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9159/shard-apl3/igt@kms_vblank@pipe-c-wait-idle.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5072/shard-apl4/igt@kms_vblank@pipe-c-wait-idle.html

  * igt@perf@invalid-oa-format-id:
    - shard-kbl:          [SKIP][75] ([fdo#109271] / [i915#1354]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9159/shard-kbl4/igt@perf@invalid-oa-format-id.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5072/shard-kbl6/igt@perf@invalid-oa-format-id.html
    - shard-hsw:          [SKIP][77] ([fdo#109271]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9159/shard-hsw4/igt@perf@invalid-oa-format-id.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5072/shard-hsw2/igt@perf@invalid-oa-format-id.html
    - shard-tglb:         [SKIP][79] ([i915#1354]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9159/shard-tglb6/igt@perf@invalid-oa-format-id.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5072/shard-tglb7/igt@perf@invalid-oa-format-id.html
    - shard-iclb:         [SKIP][81] ([i915#1354]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9159/shard-iclb5/igt@perf@invalid-oa-format-id.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5072/shard-iclb8/igt@perf@invalid-oa-format-id.html
    - shard-glk:          [SKIP][83] ([fdo#109271] / [i915#1354]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9159/shard-glk7/igt@perf@invalid-oa-format-id.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5072/shard-glk2/igt@perf@invalid-oa-format-id.html
    - shard-apl:          [SKIP][85] ([fdo#109271] / [i915#1354] / [i915#1635]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9159/shard-apl8/igt@perf@invalid-oa-format-id.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5072/shard-apl3/igt@perf@invalid-oa-format-id.html

  * igt@perf_pmu@module-unload:
    - shard-iclb:         [DMESG-WARN][87] ([i915#1982]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9159/shard-iclb3/igt@perf_pmu@module-unload.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5072/shard-iclb4/igt@perf_pmu@module-unload.html

  * igt@prime_mmap_coherency@ioctl-errors:
    - shard-snb:          [FAIL][89] -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9159/shard-snb5/igt@prime_mmap_coherency@ioctl-errors.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5072/shard-snb5/igt@prime_mmap_coherency@ioctl-errors.html

  
#### Warnings ####

  * igt@gem_exec_reloc@basic-many-active@rcs0:
    - shard-snb:          [FAIL][91] ([i915#2389]) -> [INCOMPLETE][92] ([i915#82])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9159/shard-snb4/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5072/shard-snb5/igt@gem_exec_reloc@basic-many-active@rcs0.html

  * igt@gem_exec_reloc@basic-many-active@vcs0:
    - shard-hsw:          [FAIL][93] ([i915#2389]) -> [FAIL][94] ([i915#1888] / [i915#2389]) +3 similar issues
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9159/shard-hsw1/igt@gem_exec_reloc@basic-many-active@vcs0.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5072/shard-hsw1/igt@gem_exec_reloc@basic-many-active@vcs0.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-iclb:         [SKIP][95] ([i915#588]) -> [SKIP][96] ([i915#658])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9159/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5072/shard-iclb7/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-apl:          [FAIL][97] ([fdo#110321] / [fdo#110336] / [i915#1635]) -> [TIMEOUT][98] ([i915#1319] / [i915#1635])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9159/shard-apl7/igt@kms_content_protection@atomic-dpms.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5072/shard-apl4/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [SKIP][99] ([fdo#109349]) -> [DMESG-WARN][100] ([i915#1226])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9159/shard-iclb1/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5072/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1226]: https://gitlab.freedesktop.org/drm/intel/issues/1226
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1354]: https://gitlab.freedesktop.org/drm/intel/issues/1354
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#165]: https://gitlab.freedesktop.org/drm/intel/issues/165
  [i915#1722]: https://gitlab.freedesktop.org/drm/intel/issues/1722
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#1976]: https://gitlab.freedesktop.org/drm/intel/issues/1976
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2021]: https://gitlab.freedesktop.org/drm/intel/issues/2021
  [i915#2055]: https://gitlab.freedesktop.org/drm/intel/issues/2055
  [i915#2389]: https://gitlab.freedesktop.org/drm/intel/issues/2389
  [i915#2521]: https://gitlab.freedesktop.org/drm/intel/issues/2521
  [i915#588]: https://gitlab.freedesktop.org/drm/intel/issues/588
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#78]: https://gitlab.freedesktop.org/drm/intel/issues/78
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5821 -> IGTPW_5072
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_9159: ef4453096ca6d298a3cb6c4706ea855f9b8776fd @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5072: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5072/index.html
  IGT_5821: 2bf22b1cff7905f7e214c0707941929a09450257 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5072/index.html

--===============9064261512518419983==
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
<tr><td><b>Series:</b></td><td>i915/gem_ctx_clone: Added test description for test case</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/82799/">https://patchwork.freedesktop.org/series/82799/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5072/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5072/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9159_full -&gt; IGTPW_5072_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5072_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5072_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5072/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5072_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@gem_workarounds@reset:<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9159/shard-snb4/igt@gem_workarounds@reset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5072/shard-snb7/igt@gem_workarounds@reset.html">TIMEOUT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5072_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9159/shard-iclb5/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5072/shard-iclb5/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s0:</p>
<ul>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9159/shard-hsw7/igt@gem_exec_suspend@basic-s0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5072/shard-hsw2/igt@gem_exec_suspend@basic-s0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1888">i915#1888</a>)</p>
</li>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9159/shard-snb7/igt@gem_exec_suspend@basic-s0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5072/shard-snb5/igt@gem_exec_suspend@basic-s0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/82">i915#82</a>)</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9159/shard-glk9/igt@gem_exec_suspend@basic-s0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5072/shard-glk2/igt@gem_exec_suspend@basic-s0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1888">i915#1888</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-forked-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9159/shard-glk4/igt@gem_exec_whisper@basic-forked-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5072/shard-glk5/igt@gem_exec_whisper@basic-forked-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-ytiled:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9159/shard-apl6/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-ytiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5072/shard-apl2/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-ytiled.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-gtt:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9159/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-gtt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5072/shard-tglb3/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-gtt.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_page_flip:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9159/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5072/shard-iclb7/igt@kms_psr@psr2_primary_page_flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@non-sampling-read-error:</p>
<ul>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9159/shard-tglb1/igt@perf@non-sampling-read-error.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5072/shard-tglb7/igt@perf@non-sampling-read-error.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) +2 similar issues</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9159/shard-apl6/igt@perf@non-sampling-read-error.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5072/shard-apl3/igt@perf@non-sampling-read-error.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) +2 similar issues</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9159/shard-glk6/igt@perf@non-sampling-read-error.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5072/shard-glk9/igt@perf@non-sampling-read-error.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) +2 similar issues</p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9159/shard-hsw4/igt@perf@non-sampling-read-error.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5072/shard-hsw1/igt@perf@non-sampling-read-error.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9159/shard-iclb7/igt@perf@non-sampling-read-error.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5072/shard-iclb2/igt@perf@non-sampling-read-error.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@perf@polling-parameterized:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9159/shard-iclb1/igt@perf@polling-parameterized.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5072/shard-iclb5/igt@perf@polling-parameterized.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1542">i915#1542</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@polling-small-buf:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9159/shard-iclb5/igt@perf@polling-small-buf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5072/shard-iclb2/igt@perf@polling-small-buf.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1722">i915#1722</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@whitelisted-registers-userspace-config:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9159/shard-kbl6/igt@perf@whitelisted-registers-userspace-config.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5072/shard-kbl4/igt@perf@whitelisted-registers-userspace-config.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@testdisplay:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9159/shard-kbl1/igt@testdisplay.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5072/shard-kbl2/igt@testdisplay.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/165">i915#165</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/78">i915#78</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind-lateclose:</p>
<ul>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9159/shard-iclb4/igt@core_hotunplug@hotrebind-lateclose.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5072/shard-iclb2/igt@core_hotunplug@hotrebind-lateclose.html">PASS</a></p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9159/shard-tglb7/igt@core_hotunplug@hotrebind-lateclose.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5072/shard-tglb7/igt@core_hotunplug@hotrebind-lateclose.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9159/shard-apl3/igt@core_hotunplug@hotrebind-lateclose.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5072/shard-apl3/igt@core_hotunplug@hotrebind-lateclose.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9159/shard-glk1/igt@core_hotunplug@hotrebind-lateclose.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5072/shard-glk9/igt@core_hotunplug@hotrebind-lateclose.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9159/shard-kbl3/igt@core_hotunplug@hotrebind-lateclose.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5072/shard-kbl4/igt@core_hotunplug@hotrebind-lateclose.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_busy@parallel@bcs0:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9159/shard-snb4/igt@gem_busy@parallel@bcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2021">i915#2021</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5072/shard-snb2/igt@gem_busy@parallel@bcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-contexts-10ms:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9159/shard-hsw4/igt@gem_eio@in-flight-contexts-10ms.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1976">i915#1976</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5072/shard-hsw1/igt@gem_eio@in-flight-contexts-10ms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-many-active@rcs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9159/shard-apl1/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2389">i915#2389</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5072/shard-apl3/igt@gem_exec_reloc@basic-many-active@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-normal:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9159/shard-glk4/igt@gem_exec_whisper@basic-normal.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5072/shard-glk1/igt@gem_exec_whisper@basic-normal.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate-busy-gup@uc:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9159/shard-hsw4/igt@gem_userptr_blits@map-fixed-invalidate-busy-gup@uc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1888">i915#1888</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5072/shard-hsw2/igt@gem_userptr_blits@map-fixed-invalidate-busy-gup@uc.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@kms_async_flips@async-flip-with-page-flip-events}:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9159/shard-kbl4/igt@kms_async_flips@async-flip-with-page-flip-events.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2521">i915#2521</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5072/shard-kbl4/igt@kms_async_flips@async-flip-with-page-flip-events.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9159/shard-glk7/igt@kms_async_flips@async-flip-with-page-flip-events.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2521">i915#2521</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5072/shard-glk8/igt@kms_async_flips@async-flip-with-page-flip-events.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-interruptible@ab-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9159/shard-glk3/igt@kms_flip@2x-plain-flip-interruptible@ab-hdmi-a1-hdmi-a2.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5072/shard-glk5/igt@kms_flip@2x-plain-flip-interruptible@ab-hdmi-a1-hdmi-a2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9159/shard-tglb5/igt@kms_flip@blocking-wf_vblank@a-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5072/shard-tglb2/igt@kms_flip@blocking-wf_vblank@a-edp1.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9159/shard-hsw2/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2055">i915#2055</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5072/shard-hsw1/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9159/shard-kbl7/igt@kms_flip@wf_vblank-ts-check@a-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5072/shard-kbl2/igt@kms_flip@wf_vblank-ts-check@a-dp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_mmap_write_crc@main:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9159/shard-kbl2/igt@kms_mmap_write_crc@main.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/165">i915#165</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5072/shard-kbl6/igt@kms_mmap_write_crc@main.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_move:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9159/shard-iclb4/igt@kms_psr@psr2_sprite_plane_move.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5072/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-wait-idle:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9159/shard-apl3/igt@kms_vblank@pipe-c-wait-idle.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5072/shard-apl4/igt@kms_vblank@pipe-c-wait-idle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf@invalid-oa-format-id:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9159/shard-kbl4/igt@perf@invalid-oa-format-id.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5072/shard-kbl6/igt@perf@invalid-oa-format-id.html">PASS</a></p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9159/shard-hsw4/igt@perf@invalid-oa-format-id.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5072/shard-hsw2/igt@perf@invalid-oa-format-id.html">PASS</a></p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9159/shard-tglb6/igt@perf@invalid-oa-format-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5072/shard-tglb7/igt@perf@invalid-oa-format-id.html">PASS</a></p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9159/shard-iclb5/igt@perf@invalid-oa-format-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5072/shard-iclb8/igt@perf@invalid-oa-format-id.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9159/shard-glk7/igt@perf@invalid-oa-format-id.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5072/shard-glk2/igt@perf@invalid-oa-format-id.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9159/shard-apl8/igt@perf@invalid-oa-format-id.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5072/shard-apl3/igt@perf@invalid-oa-format-id.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@module-unload:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9159/shard-iclb3/igt@perf_pmu@module-unload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5072/shard-iclb4/igt@perf_pmu@module-unload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@prime_mmap_coherency@ioctl-errors:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9159/shard-snb5/igt@prime_mmap_coherency@ioctl-errors.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5072/shard-snb5/igt@prime_mmap_coherency@ioctl-errors.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_reloc@basic-many-active@rcs0:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9159/shard-snb4/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2389">i915#2389</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5072/shard-snb5/igt@gem_exec_reloc@basic-many-active@rcs0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/82">i915#82</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-many-active@vcs0:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9159/shard-hsw1/igt@gem_exec_reloc@basic-many-active@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2389">i915#2389</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5072/shard-hsw1/igt@gem_exec_reloc@basic-many-active@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1888">i915#1888</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2389">i915#2389</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9159/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/588">i915#588</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5072/shard-iclb7/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9159/shard-apl7/igt@kms_content_protection@atomic-dpms.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110321">fdo#110321</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=110336">fdo#110336</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5072/shard-apl4/igt@kms_content_protection@atomic-dpms.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1319">i915#1319</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_dsc@basic-dsc-enable-edp:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9159/shard-iclb1/igt@kms_dp_dsc@basic-dsc-enable-edp.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109349">fdo#109349</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5072/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1226">i915#1226</a>)</li>
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
<li>IGT: IGT_5821 -&gt; IGTPW_5072</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9159: ef4453096ca6d298a3cb6c4706ea855f9b8776fd @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5072: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5072/index.html<br />
  IGT_5821: 2bf22b1cff7905f7e214c0707941929a09450257 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============9064261512518419983==--

--===============1001629203==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1001629203==--
