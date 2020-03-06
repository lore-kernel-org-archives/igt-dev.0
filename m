Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 06 Mar 2020 05:37:11 -0000
Message-ID: <158347303184.3081.2586198425092950593@emeril.freedesktop.org>
References: <20200305152256.13716-1-daniel.t.mrzyglod@intel.com>
In-Reply-To: <20200305152256.13716-1-daniel.t.mrzyglod@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgbGliOiBt?=
 =?utf-8?q?ove_upper=5F32=5Fbits=28=29_and_lower=5F32=5Fbits=28=29_to_libr?=
 =?utf-8?q?ary_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Daniel Mrzyglod <daniel.t.mrzyglod@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: lib: move upper_32_bits() and lower_32_bits() to library (rev2)
URL   : https://patchwork.freedesktop.org/series/74199/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8069_full -> IGTPW_4265_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4265/index.html

Known issues
------------

  Here are the changes found in IGTPW_4265_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@close-replace-race:
    - shard-apl:          [PASS][1] -> [INCOMPLETE][2] ([fdo#103927])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8069/shard-apl3/igt@gem_ctx_persistence@close-replace-race.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4265/shard-apl2/igt@gem_ctx_persistence@close-replace-race.html

  * igt@gem_exec_parallel@vcs1-fds:
    - shard-iclb:         [PASS][3] -> [SKIP][4] ([fdo#112080]) +5 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8069/shard-iclb1/igt@gem_exec_parallel@vcs1-fds.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4265/shard-iclb8/igt@gem_exec_parallel@vcs1-fds.html

  * igt@gem_exec_schedule@implicit-both-bsd:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([i915#677]) +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8069/shard-iclb7/igt@gem_exec_schedule@implicit-both-bsd.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4265/shard-iclb4/igt@gem_exec_schedule@implicit-both-bsd.html

  * igt@gem_exec_schedule@implicit-read-write-bsd2:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([fdo#109276] / [i915#677])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8069/shard-iclb2/igt@gem_exec_schedule@implicit-read-write-bsd2.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4265/shard-iclb5/igt@gem_exec_schedule@implicit-read-write-bsd2.html

  * igt@gem_exec_schedule@preempt-queue-bsd1:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([fdo#109276]) +11 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8069/shard-iclb2/igt@gem_exec_schedule@preempt-queue-bsd1.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4265/shard-iclb7/igt@gem_exec_schedule@preempt-queue-bsd1.html

  * igt@gem_exec_schedule@preempt-queue-chain-bsd:
    - shard-iclb:         [PASS][11] -> [SKIP][12] ([fdo#112146]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8069/shard-iclb5/igt@gem_exec_schedule@preempt-queue-chain-bsd.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4265/shard-iclb2/igt@gem_exec_schedule@preempt-queue-chain-bsd.html

  * igt@gem_exec_whisper@basic-queues-priority-all:
    - shard-glk:          [PASS][13] -> [DMESG-WARN][14] ([i915#118] / [i915#95])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8069/shard-glk2/igt@gem_exec_whisper@basic-queues-priority-all.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4265/shard-glk3/igt@gem_exec_whisper@basic-queues-priority-all.html

  * igt@i915_pm_rpm@debugfs-forcewake-user:
    - shard-hsw:          [PASS][15] -> [SKIP][16] ([fdo#109271]) +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8069/shard-hsw8/igt@i915_pm_rpm@debugfs-forcewake-user.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4265/shard-hsw8/igt@i915_pm_rpm@debugfs-forcewake-user.html
    - shard-iclb:         [PASS][17] -> [SKIP][18] ([i915#1316]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8069/shard-iclb4/igt@i915_pm_rpm@debugfs-forcewake-user.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4265/shard-iclb4/igt@i915_pm_rpm@debugfs-forcewake-user.html
    - shard-tglb:         [PASS][19] -> [SKIP][20] ([i915#1316]) +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8069/shard-tglb8/igt@i915_pm_rpm@debugfs-forcewake-user.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4265/shard-tglb8/igt@i915_pm_rpm@debugfs-forcewake-user.html

  * igt@i915_pm_rpm@gem-execbuf:
    - shard-glk:          [PASS][21] -> [SKIP][22] ([fdo#109271]) +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8069/shard-glk9/igt@i915_pm_rpm@gem-execbuf.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4265/shard-glk6/igt@i915_pm_rpm@gem-execbuf.html

  * igt@i915_pm_rps@waitboost:
    - shard-iclb:         [PASS][23] -> [FAIL][24] ([i915#413])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8069/shard-iclb3/igt@i915_pm_rps@waitboost.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4265/shard-iclb8/igt@i915_pm_rps@waitboost.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-apl:          [PASS][25] -> [DMESG-WARN][26] ([i915#180])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8069/shard-apl3/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4265/shard-apl2/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-glk:          [PASS][27] -> [FAIL][28] ([i915#72])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8069/shard-glk6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4265/shard-glk7/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_plane_lowres@pipe-a-tiling-x:
    - shard-glk:          [PASS][29] -> [FAIL][30] ([i915#899])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8069/shard-glk3/igt@kms_plane_lowres@pipe-a-tiling-x.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4265/shard-glk8/igt@kms_plane_lowres@pipe-a-tiling-x.html

  * igt@kms_psr@psr2_sprite_render:
    - shard-iclb:         [PASS][31] -> [SKIP][32] ([fdo#109441]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8069/shard-iclb2/igt@kms_psr@psr2_sprite_render.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4265/shard-iclb3/igt@kms_psr@psr2_sprite_render.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@vcs1-dirty-create:
    - shard-iclb:         [SKIP][33] ([fdo#112080]) -> [PASS][34] +4 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8069/shard-iclb3/igt@gem_ctx_isolation@vcs1-dirty-create.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4265/shard-iclb4/igt@gem_ctx_isolation@vcs1-dirty-create.html

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [SKIP][35] ([fdo#110854]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8069/shard-iclb5/igt@gem_exec_balancer@smoke.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4265/shard-iclb2/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_schedule@implicit-read-write-bsd1:
    - shard-iclb:         [SKIP][37] ([fdo#109276] / [i915#677]) -> [PASS][38] +2 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8069/shard-iclb6/igt@gem_exec_schedule@implicit-read-write-bsd1.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4265/shard-iclb4/igt@gem_exec_schedule@implicit-read-write-bsd1.html

  * igt@gem_exec_schedule@in-order-bsd:
    - shard-iclb:         [SKIP][39] ([fdo#112146]) -> [PASS][40] +5 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8069/shard-iclb4/igt@gem_exec_schedule@in-order-bsd.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4265/shard-iclb3/igt@gem_exec_schedule@in-order-bsd.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-glk:          [DMESG-WARN][41] ([i915#716]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8069/shard-glk4/igt@gen9_exec_parse@allowed-single.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4265/shard-glk8/igt@gen9_exec_parse@allowed-single.html

  * igt@i915_pm_rpm@dpms-non-lpsp:
    - shard-hsw:          [SKIP][43] ([fdo#109271]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8069/shard-hsw8/igt@i915_pm_rpm@dpms-non-lpsp.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4265/shard-hsw6/igt@i915_pm_rpm@dpms-non-lpsp.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-apl:          [DMESG-WARN][45] ([i915#180]) -> [PASS][46] +1 similar issue
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8069/shard-apl8/igt@kms_flip@flip-vs-suspend-interruptible.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4265/shard-apl3/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@nonexisting-fb:
    - shard-apl:          [DMESG-WARN][47] ([i915#1297]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8069/shard-apl4/igt@kms_flip@nonexisting-fb.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4265/shard-apl3/igt@kms_flip@nonexisting-fb.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [SKIP][49] ([i915#433]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8069/shard-tglb5/igt@kms_hdmi_inject@inject-audio.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4265/shard-tglb3/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-kbl:          [DMESG-WARN][51] ([i915#180]) -> [PASS][52] +2 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8069/shard-kbl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4265/shard-kbl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_psr@psr2_sprite_mmap_gtt:
    - shard-iclb:         [SKIP][53] ([fdo#109441]) -> [PASS][54] +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8069/shard-iclb6/igt@kms_psr@psr2_sprite_mmap_gtt.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4265/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html

  * igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm:
    - shard-glk:          [SKIP][55] ([fdo#109271]) -> [PASS][56] +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8069/shard-glk4/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4265/shard-glk9/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html
    - shard-tglb:         [SKIP][57] ([fdo#112015]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8069/shard-tglb8/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4265/shard-tglb3/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html

  * igt@perf@short-reads:
    - shard-apl:          [FAIL][59] ([i915#51]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8069/shard-apl6/igt@perf@short-reads.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4265/shard-apl7/igt@perf@short-reads.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [SKIP][61] ([fdo#109276]) -> [PASS][62] +17 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8069/shard-iclb3/igt@prime_busy@hang-bsd2.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4265/shard-iclb4/igt@prime_busy@hang-bsd2.html

  
#### Warnings ####

  * igt@gem_exec_schedule@pi-userfault-bsd2:
    - shard-iclb:         [SKIP][63] ([fdo#109276]) -> [INCOMPLETE][64] ([i915#1381])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8069/shard-iclb5/igt@gem_exec_schedule@pi-userfault-bsd2.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4265/shard-iclb2/igt@gem_exec_schedule@pi-userfault-bsd2.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [SKIP][65] ([i915#468]) -> [FAIL][66] ([i915#454])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8069/shard-tglb2/igt@i915_pm_dc@dc6-psr.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4265/shard-tglb3/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rpm@dpms-non-lpsp:
    - shard-tglb:         [SKIP][67] ([i915#1316]) -> [SKIP][68] ([fdo#111644])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8069/shard-tglb8/igt@i915_pm_rpm@dpms-non-lpsp.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4265/shard-tglb1/igt@i915_pm_rpm@dpms-non-lpsp.html
    - shard-iclb:         [SKIP][69] ([i915#1316]) -> [SKIP][70] ([fdo#110892])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8069/shard-iclb1/igt@i915_pm_rpm@dpms-non-lpsp.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4265/shard-iclb2/igt@i915_pm_rpm@dpms-non-lpsp.html

  * igt@runner@aborted:
    - shard-snb:          ([FAIL][71], [FAIL][72], [FAIL][73], [FAIL][74], [FAIL][75], [FAIL][76], [FAIL][77]) ([fdo#111870] / [i915#1077] / [i915#698]) -> ([FAIL][78], [FAIL][79], [FAIL][80], [FAIL][81], [FAIL][82], [FAIL][83], [FAIL][84]) ([fdo#111870] / [i915#1077])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8069/shard-snb5/igt@runner@aborted.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8069/shard-snb4/igt@runner@aborted.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8069/shard-snb4/igt@runner@aborted.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8069/shard-snb2/igt@runner@aborted.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8069/shard-snb4/igt@runner@aborted.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8069/shard-snb5/igt@runner@aborted.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8069/shard-snb5/igt@runner@aborted.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4265/shard-snb2/igt@runner@aborted.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4265/shard-snb5/igt@runner@aborted.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4265/shard-snb6/igt@runner@aborted.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4265/shard-snb6/igt@runner@aborted.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4265/shard-snb4/igt@runner@aborted.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4265/shard-snb5/igt@runner@aborted.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4265/shard-snb4/igt@runner@aborted.html

  
  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#110892]: https://bugs.freedesktop.org/show_bug.cgi?id=110892
  [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112015]: https://bugs.freedesktop.org/show_bug.cgi?id=112015
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#1077]: https://gitlab.freedesktop.org/drm/intel/issues/1077
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1297]: https://gitlab.freedesktop.org/drm/intel/issues/1297
  [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
  [i915#1381]: https://gitlab.freedesktop.org/drm/intel/issues/1381
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#51]: https://gitlab.freedesktop.org/drm/intel/issues/51
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#698]: https://gitlab.freedesktop.org/drm/intel/issues/698
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5494 -> IGTPW_4265
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8069: c8673f18b2ca3b343206c2ba65d6f1020a93614c @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4265: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4265/index.html
  IGT_5494: 48fa8e88bffa16b141d8c29a93638d795a2652c8 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4265/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
