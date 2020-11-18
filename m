Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 18 Nov 2020 04:53:43 -0000
Message-ID: <160567522304.24800.5829816225134588285@emeril.freedesktop.org>
References: <20201117223507.1970938-1-chris@chris-wilson.co.uk>
In-Reply-To: <20201117223507.1970938-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fflink=5Frace=3A_Show_range_of_races_between_threads?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1238653533=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1238653533==
Content-Type: multipart/alternative;
 boundary="===============7575048434364588431=="

--===============7575048434364588431==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: i915/gem_flink_race: Show range of races between threads
URL   : https://patchwork.freedesktop.org/series/83996/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_9350_full -> IGTPW_5183_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5183_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5183_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5183/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5183_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_whisper@basic-fds-all:
    - shard-hsw:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-hsw2/igt@gem_exec_whisper@basic-fds-all.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5183/shard-hsw8/igt@gem_exec_whisper@basic-fds-all.html

  * igt@gem_flink_race@flink_name:
    - shard-tglb:         [PASS][3] -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-tglb6/igt@gem_flink_race@flink_name.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5183/shard-tglb1/igt@gem_flink_race@flink_name.html
    - shard-glk:          [PASS][5] -> [INCOMPLETE][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-glk5/igt@gem_flink_race@flink_name.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5183/shard-glk3/igt@gem_flink_race@flink_name.html
    - shard-hsw:          [PASS][7] -> [INCOMPLETE][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-hsw8/igt@gem_flink_race@flink_name.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5183/shard-hsw1/igt@gem_flink_race@flink_name.html
    - shard-kbl:          [PASS][9] -> [INCOMPLETE][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-kbl7/igt@gem_flink_race@flink_name.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5183/shard-kbl1/igt@gem_flink_race@flink_name.html
    - shard-snb:          [PASS][11] -> [INCOMPLETE][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-snb4/igt@gem_flink_race@flink_name.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5183/shard-snb2/igt@gem_flink_race@flink_name.html
    - shard-iclb:         [PASS][13] -> [INCOMPLETE][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-iclb6/igt@gem_flink_race@flink_name.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5183/shard-iclb7/igt@gem_flink_race@flink_name.html

  
Known issues
------------

  Here are the changes found in IGTPW_5183_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_create@forked:
    - shard-tglb:         [PASS][15] -> [INCOMPLETE][16] ([i915#2583])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-tglb1/igt@gem_exec_create@forked.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5183/shard-tglb6/igt@gem_exec_create@forked.html

  * igt@gem_exec_reloc@basic-many-active@rcs0:
    - shard-hsw:          [PASS][17] -> [FAIL][18] ([i915#2389])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-hsw8/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5183/shard-hsw7/igt@gem_exec_reloc@basic-many-active@rcs0.html

  * igt@gem_exec_whisper@basic-fds-priority-all:
    - shard-glk:          [PASS][19] -> [DMESG-WARN][20] ([i915#118] / [i915#95]) +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-glk5/igt@gem_exec_whisper@basic-fds-priority-all.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5183/shard-glk4/igt@gem_exec_whisper@basic-fds-priority-all.html

  * igt@gem_flink_race@flink_name:
    - shard-apl:          [PASS][21] -> [INCOMPLETE][22] ([i915#1635])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-apl8/igt@gem_flink_race@flink_name.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5183/shard-apl8/igt@gem_flink_race@flink_name.html

  * igt@i915_pm_rpm@drm-resources-equal:
    - shard-hsw:          [PASS][23] -> [SKIP][24] ([fdo#109271]) +2 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-hsw4/igt@i915_pm_rpm@drm-resources-equal.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5183/shard-hsw2/igt@i915_pm_rpm@drm-resources-equal.html

  * igt@i915_pm_rpm@gem-execbuf:
    - shard-kbl:          [PASS][25] -> [SKIP][26] ([fdo#109271]) +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-kbl1/igt@i915_pm_rpm@gem-execbuf.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5183/shard-kbl2/igt@i915_pm_rpm@gem-execbuf.html
    - shard-iclb:         [PASS][27] -> [SKIP][28] ([i915#579])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-iclb4/igt@i915_pm_rpm@gem-execbuf.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5183/shard-iclb5/igt@i915_pm_rpm@gem-execbuf.html

  * igt@i915_pm_rpm@modeset-non-lpsp:
    - shard-apl:          [PASS][29] -> [SKIP][30] ([fdo#109271] / [i915#1635]) +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-apl7/igt@i915_pm_rpm@modeset-non-lpsp.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5183/shard-apl7/igt@i915_pm_rpm@modeset-non-lpsp.html
    - shard-glk:          [PASS][31] -> [SKIP][32] ([fdo#109271]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-glk2/igt@i915_pm_rpm@modeset-non-lpsp.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5183/shard-glk4/igt@i915_pm_rpm@modeset-non-lpsp.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-sliding:
    - shard-apl:          [PASS][33] -> [FAIL][34] ([i915#1635] / [i915#54])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-apl7/igt@kms_cursor_crc@pipe-a-cursor-64x21-sliding.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5183/shard-apl1/igt@kms_cursor_crc@pipe-a-cursor-64x21-sliding.html
    - shard-kbl:          [PASS][35] -> [FAIL][36] ([i915#54])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-64x21-sliding.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5183/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-64x21-sliding.html

  * igt@kms_cursor_edge_walk@pipe-c-64x64-top-edge:
    - shard-apl:          [PASS][37] -> [DMESG-WARN][38] ([i915#1635] / [i915#1982]) +3 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-apl8/igt@kms_cursor_edge_walk@pipe-c-64x64-top-edge.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5183/shard-apl3/igt@kms_cursor_edge_walk@pipe-c-64x64-top-edge.html

  * igt@kms_cursor_legacy@cursor-vs-flip-varying-size:
    - shard-hsw:          [PASS][39] -> [FAIL][40] ([i915#2370])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-hsw4/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5183/shard-hsw6/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-hsw:          [PASS][41] -> [DMESG-WARN][42] ([i915#1982])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-hsw6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5183/shard-hsw1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-tglb:         [PASS][43] -> [FAIL][44] ([i915#2346])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-tglb5/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5183/shard-tglb2/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          [PASS][45] -> [DMESG-WARN][46] ([i915#1982]) +4 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-glk7/igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ab-hdmi-a1-hdmi-a2.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5183/shard-glk4/igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@dpms-vs-vblank-race-interruptible@b-hdmi-a1:
    - shard-glk:          [PASS][47] -> [FAIL][48] ([i915#407])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-glk6/igt@kms_flip@dpms-vs-vblank-race-interruptible@b-hdmi-a1.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5183/shard-glk4/igt@kms_flip@dpms-vs-vblank-race-interruptible@b-hdmi-a1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:
    - shard-tglb:         [PASS][49] -> [FAIL][50] ([i915#2598])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-tglb8/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5183/shard-tglb7/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html

  * igt@kms_flip@flip-vs-suspend@c-hdmi-a1:
    - shard-hsw:          [PASS][51] -> [INCOMPLETE][52] ([i915#2055]) +1 similar issue
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-hsw6/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5183/shard-hsw4/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt:
    - shard-kbl:          [PASS][53] -> [DMESG-WARN][54] ([i915#1982])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5183/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-pwrite:
    - shard-iclb:         [PASS][55] -> [DMESG-WARN][56] ([i915#1982])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-iclb5/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-pwrite.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5183/shard-iclb5/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbc-stridechange:
    - shard-tglb:         [PASS][57] -> [DMESG-WARN][58] ([i915#1982]) +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-tglb5/igt@kms_frontbuffer_tracking@fbc-stridechange.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5183/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-stridechange.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [PASS][59] -> [SKIP][60] ([fdo#109642] / [fdo#111068])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-iclb2/igt@kms_psr2_su@frontbuffer.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5183/shard-iclb5/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [PASS][61] -> [SKIP][62] ([fdo#109441])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-iclb2/igt@kms_psr@psr2_cursor_render.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5183/shard-iclb4/igt@kms_psr@psr2_cursor_render.html

  * igt@perf@invalid-create-userspace-config:
    - shard-kbl:          [PASS][63] -> [SKIP][64] ([fdo#109271] / [i915#1354])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-kbl1/igt@perf@invalid-create-userspace-config.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5183/shard-kbl3/igt@perf@invalid-create-userspace-config.html
    - shard-apl:          [PASS][65] -> [SKIP][66] ([fdo#109271] / [i915#1354] / [i915#1635])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-apl4/igt@perf@invalid-create-userspace-config.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5183/shard-apl6/igt@perf@invalid-create-userspace-config.html
    - shard-glk:          [PASS][67] -> [SKIP][68] ([fdo#109271] / [i915#1354])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-glk6/igt@perf@invalid-create-userspace-config.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5183/shard-glk1/igt@perf@invalid-create-userspace-config.html
    - shard-iclb:         [PASS][69] -> [SKIP][70] ([i915#1354])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-iclb4/igt@perf@invalid-create-userspace-config.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5183/shard-iclb7/igt@perf@invalid-create-userspace-config.html
    - shard-tglb:         [PASS][71] -> [SKIP][72] ([i915#1354])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-tglb7/igt@perf@invalid-create-userspace-config.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5183/shard-tglb3/igt@perf@invalid-create-userspace-config.html

  
#### Possible fixes ####

  * igt@gem_exec_suspend@basic-s3:
    - shard-glk:          [FAIL][73] -> [PASS][74] +1 similar issue
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-glk6/igt@gem_exec_suspend@basic-s3.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5183/shard-glk1/igt@gem_exec_suspend@basic-s3.html
    - shard-kbl:          [DMESG-WARN][75] ([i915#180]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-kbl2/igt@gem_exec_suspend@basic-s3.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5183/shard-kbl2/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_softpin@noreloc-s3:
    - shard-iclb:         [INCOMPLETE][77] ([i915#1373] / [i915#2405]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-iclb4/igt@gem_softpin@noreloc-s3.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5183/shard-iclb5/igt@gem_softpin@noreloc-s3.html
    - shard-apl:          [INCOMPLETE][79] ([i915#1635] / [i915#2405] / [i915#2635]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-apl4/igt@gem_softpin@noreloc-s3.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5183/shard-apl7/igt@gem_softpin@noreloc-s3.html
    - shard-glk:          [INCOMPLETE][81] ([i915#2199] / [i915#2405] / [i915#2635]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-glk6/igt@gem_softpin@noreloc-s3.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5183/shard-glk2/igt@gem_softpin@noreloc-s3.html
    - shard-hsw:          [INCOMPLETE][83] ([i915#2405] / [i915#2637]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-hsw1/igt@gem_softpin@noreloc-s3.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5183/shard-hsw6/igt@gem_softpin@noreloc-s3.html
    - shard-kbl:          [INCOMPLETE][85] ([i915#2405]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-kbl1/igt@gem_softpin@noreloc-s3.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5183/shard-kbl7/igt@gem_softpin@noreloc-s3.html

  * {igt@kms_async_flips@alternate-sync-async-flip}:
    - shard-tglb:         [FAIL][87] ([i915#2521]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-tglb2/igt@kms_async_flips@alternate-sync-async-flip.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5183/shard-tglb6/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions:
    - shard-snb:          [FAIL][89] -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-snb6/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5183/shard-snb7/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-untiled:
    - shard-apl:          [DMESG-WARN][91] ([i915#1635] / [i915#1982]) -> [PASS][92] +6 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-apl7/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-untiled.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5183/shard-apl1/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-untiled.html
    - shard-glk:          [DMESG-WARN][93] ([i915#1982]) -> [PASS][94] +5 similar issues
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-glk6/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-untiled.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5183/shard-glk4/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-untiled.html

  * igt@kms_flip@dpms-off-confusion@a-vga1:
    - shard-hsw:          [DMESG-WARN][95] ([i915#1982]) -> [PASS][96] +1 similar issue
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-hsw6/igt@kms_flip@dpms-off-confusion@a-vga1.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5183/shard-hsw2/igt@kms_flip@dpms-off-confusion@a-vga1.html

  * igt@kms_frontbuffer_tracking@fbc-badstride:
    - shard-iclb:         [DMESG-WARN][97] ([i915#1982]) -> [PASS][98] +1 similar issue
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-iclb3/igt@kms_frontbuffer_tracking@fbc-badstride.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5183/shard-iclb8/igt@kms_frontbuffer_tracking@fbc-badstride.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-blt:
    - shard-tglb:         [DMESG-WARN][99] ([i915#1982]) -> [PASS][100] +3 similar issues
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-tglb2/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-blt.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5183/shard-tglb2/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-blt.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [SKIP][101] ([i915#433]) -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-tglb5/igt@kms_hdmi_inject@inject-audio.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5183/shard-tglb2/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_plane@plane-position-hole-dpms-pipe-b-planes:
    - shard-kbl:          [FAIL][103] ([i915#2472]) -> [PASS][104]
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-kbl3/igt@kms_plane@plane-position-hole-dpms-pipe-b-planes.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5183/shard-kbl2/igt@kms_plane@plane-position-hole-dpms-pipe-b-planes.html
    - shard-apl:          [FAIL][105] ([i915#1635] / [i915#2472]) -> [PASS][106]
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-apl3/igt@kms_plane@plane-position-hole-dpms-pipe-b-planes.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5183/shard-apl3/igt@kms_plane@plane-position-hole-dpms-pipe-b-planes.html

  * igt@kms_psr@psr2_no_drrs:
    - shard-iclb:         [SKIP][107] ([fdo#109441]) -> [PASS][108] +3 similar issues
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-iclb5/igt@kms_psr@psr2_no_drrs.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5183/shard-iclb2/igt@kms_psr@psr2_no_drrs.html

  * igt@kms_setmode@basic:
    - shard-hsw:          [FAIL][109] ([i915#31]) -> [PASS][110]
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-hsw1/igt@kms_setmode@basic.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5183/shard-hsw1/igt@kms_setmode@basic.html

  * igt@perf@oa-exponents:
    - shard-tglb:         [SKIP][111] ([i915#1354]) -> [PASS][112]
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-tglb8/igt@perf@oa-exponents.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5183/shard-tglb2/igt@perf@oa-exponents.html
    - shard-glk:          [SKIP][113] ([fdo#109271] / [i915#1354]) -> [PASS][114]
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-glk5/igt@perf@oa-exponents.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5183/shard-glk8/igt@perf@oa-exponents.html
    - shard-apl:          [SKIP][115] ([fdo#109271] / [i915#1354] / [i915#1635]) -> [PASS][116]
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-apl8/igt@perf@oa-exponents.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5183/shard-apl1/igt@perf@oa-exponents.html
    - shard-kbl:          [SKIP][117] ([fdo#109271] / [i915#1354]) -> [PASS][118]
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-kbl1/igt@perf@oa-exponents.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5183/shard-kbl6/igt@perf@oa-exponents.html
    - shard-iclb:         [SKIP][119] ([i915#1354]) -> [PASS][120]
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-iclb5/igt@perf@oa-exponents.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5183/shard-iclb4/igt@perf@oa-exponents.html
    - shard-hsw:          [SKIP][121] ([fdo#109271]) -> [PASS][122]
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-hsw6/igt@perf@oa-exponents.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5183/shard-hsw4/igt@perf@oa-exponents.html

  
#### Warnings ####

  * igt@gem_eio@kms:
    - shard-hsw:          [INCOMPLETE][123] ([i915#1888] / [i915#2244]) -> [INCOMPLETE][124] ([i915#2244])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-hsw2/igt@gem_eio@kms.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5183/shard-hsw4/igt@gem_eio@kms.html

  * igt@gem_softpin@noreloc-s3:
    - shard-tglb:         [DMESG-WARN][125] ([i915#1436]) -> [DMESG-WARN][126] ([i915#2411])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-tglb7/igt@gem_softpin@noreloc-s3.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5183/shard-tglb6/igt@gem_softpin@noreloc-s3.html

  * igt@i915_pm_rpm@gem-execbuf:
    - shard-tglb:         [DMESG-WARN][127] ([i915#2411]) -> [SKIP][128] ([i915#579])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-tglb8/igt@i915_pm_rpm@gem-execbuf.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5183/shard-tglb8/igt@i915_pm_rpm@gem-execbuf.html

  * igt@i915_pm_rpm@modeset-non-lpsp:
    - shard-iclb:         [SKIP][129] ([fdo#110892]) -> [SKIP][130] ([i915#579])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-iclb7/igt@i915_pm_rpm@modeset-non-lpsp.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5183/shard-iclb5/igt@i915_pm_rpm@modeset-non-lpsp.html
    - shard-tglb:         [SKIP][131] ([fdo#111644] / [i915#1397] / [i915#2411]) -> [SKIP][132] ([i915#579])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-tglb5/igt@i915_pm_rpm@modeset-non-lpsp.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5183/shard-tglb8/igt@i915_pm_rpm@modeset-non-lpsp.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [DMESG-WARN][133] ([i915#1226]) -> [SKIP][134] ([fdo#109349])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5183/shard-iclb8/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@runner@aborted:
    - shard-iclb:         ([FAIL][135], [FAIL][136]) ([i915#2295] / [i915#2439] / [i915#483]) -> [FAIL][137] ([i915#2295] / [i915#2439])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-iclb5/igt@runner@aborted.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-iclb4/igt@runner@aborted.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5183/shard-iclb2/igt@runner@aborted.html
    - shard-glk:          ([FAIL][138], [FAIL][139]) ([i915#1611] / [i915#2295] / [i915#2439] / [i915#86] / [k.org#202321]) -> [FAIL][140] ([i915#1611] / [i915#2295] / [i915#2439] / [i915#483] / [k.org#202321])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-glk2/igt@runner@aborted.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-glk6/igt@runner@aborted.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5183/shard-glk7/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110892]: https://bugs.freedesktop.org/show_bug.cgi?id=110892
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1226]: https://gitlab.freedesktop.org/drm/intel/issues/1226
  [i915#1354]: https://gitlab.freedesktop.org/drm/intel/issues/1354
  [i915#1373]: https://gitlab.freedesktop.org/drm/intel/issues/1373
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1611]: https://gitlab.freedesktop.org/drm/intel/issues/1611
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2055]: https://gitlab.freedesktop.org/drm/intel/issues/2055
  [i915#2199]: https://gitlab.freedesktop.org/drm/intel/issues/2199
  [i915#2244]: https://gitlab.freedesktop.org/drm/intel/issues/2244
  [i915#2295]: https://gitlab.freedesktop.org/drm/intel/issues/2295
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2370]: https://gitlab.freedesktop.org/drm/intel/issues/2370
  [i915#2389]: https://gitlab.freedesktop.org/drm/intel/issues/2389
  [i915#2405]: https://gitlab.freedesktop.org/drm/intel/issues/2405
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#2439]: https://gitlab.freedesktop.org/drm/intel/issues/2439
  [i915#2472]: https://gitlab.freedesktop.org/drm/intel/issues/2472
  [i915#2521]: https://gitlab.freedesktop.org/drm/intel/issues/2521
  [i915#2583]: https://gitlab.freedesktop.org/drm/intel/issues/2583
  [i915#2598]: https://gitlab.freedesktop.org/drm/intel/issues/2598
  [i915#2635]: https://gitlab.freedesktop.org/drm/intel/issues/2635
  [i915#2637]: https://gitlab.freedesktop.org/drm/intel/issues/2637
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#407]: https://gitlab.freedesktop.org/drm/intel/issues/407
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#483]: https://gitlab.freedesktop.org/drm/intel/issues/483
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579
  [i915#86]: https://gitlab.freedesktop.org/drm/intel/issues/86
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [k.org#202321]: https://bugzilla.kernel.org/show_bug.cgi?id=202321


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5855 -> IGTPW_5183
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_9350: 3161d1b26b7e1a7cb9146e3f8bd613f901ff5b38 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5183: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5183/index.html
  IGT_5855: d9b3c7058efe41e5224dd1e43fac05dc6d049380 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5183/index.html

--===============7575048434364588431==
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
<tr><td><b>Series:</b></td><td>i915/gem_flink_race: Show range of races bet=
ween threads</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/83996/">https://patchwork.freedesktop.org/series/83996/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5183/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5183/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9350_full -&gt; IGTPW_5183_full</h=
1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5183_full absolutely need to b=
e<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_5183_full, please notify your bug team to allow them<=
br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5183/index.=
html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5183=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_exec_whisper@basic-fds-all:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9350/shard-hsw2/igt@gem_exec_whisper@basic-fds-all.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5183/shard-h=
sw8/igt@gem_exec_whisper@basic-fds-all.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@gem_flink_race@flink_name:</p>
<ul>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9350/shard-tglb6/igt@gem_flink_race@flink_name.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5183/shard-tglb1/=
igt@gem_flink_race@flink_name.html">INCOMPLETE</a></p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9350/shard-glk5/igt@gem_flink_race@flink_name.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5183/shard-glk3/ig=
t@gem_flink_race@flink_name.html">INCOMPLETE</a></p>
</li>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9350/shard-hsw8/igt@gem_flink_race@flink_name.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5183/shard-hsw1/ig=
t@gem_flink_race@flink_name.html">INCOMPLETE</a></p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9350/shard-kbl7/igt@gem_flink_race@flink_name.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5183/shard-kbl1/ig=
t@gem_flink_race@flink_name.html">INCOMPLETE</a></p>
</li>
<li>
<p>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9350/shard-snb4/igt@gem_flink_race@flink_name.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5183/shard-snb2/ig=
t@gem_flink_race@flink_name.html">INCOMPLETE</a></p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9350/shard-iclb6/igt@gem_flink_race@flink_name.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5183/shard-iclb7/=
igt@gem_flink_race@flink_name.html">INCOMPLETE</a></p>
</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5183_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_create@forked:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9350/shard-tglb1/igt@gem_exec_create@forked.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5183/shard-tglb6/ig=
t@gem_exec_create@forked.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/2583">i915#2583</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-many-active@rcs0:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9350/shard-hsw8/igt@gem_exec_reloc@basic-many-active@rcs0.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5183/=
shard-hsw7/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/2389">i915#2389</a>)</=
li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-fds-priority-all:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9350/shard-glk5/igt@gem_exec_whisper@basic-fds-priority-all.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_518=
3/shard-glk4/igt@gem_exec_whisper@basic-fds-priority-all.html">DMESG-WARN</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/118">i915#11=
8</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/95">i915=
#95</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_flink_race@flink_name:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9350/shard-apl8/igt@gem_flink_race@flink_name.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5183/shard-apl8/i=
gt@gem_flink_race@flink_name.html">INCOMPLETE</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/intel/issues/1635">i915#1635</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@drm-resources-equal:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9350/shard-hsw4/igt@i915_pm_rpm@drm-resources-equal.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5183/shard-=
hsw2/igt@i915_pm_rpm@drm-resources-equal.html">SKIP</a> (<a href=3D"https:/=
/bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +2 similar =
issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9350/shard-kbl1/igt@i915_pm_rpm@gem-execbuf.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5183/shard-kbl2/igt@=
i915_pm_rpm@gem-execbuf.html">SKIP</a> (<a href=3D"https://bugs.freedesktop=
.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9350/shard-iclb4/igt@i915_pm_rpm@gem-execbuf.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5183/shard-iclb5/ig=
t@i915_pm_rpm@gem-execbuf.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/579">i915#579</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9350/shard-apl7/igt@i915_pm_rpm@modeset-non-lpsp.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5183/shard-apl7=
/igt@i915_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a href=3D"https://bugs.f=
reedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) +1 similar i=
ssue</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9350/shard-glk2/igt@i915_pm_rpm@modeset-non-lpsp.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5183/shard-glk4=
/igt@i915_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a href=3D"https://bugs.f=
reedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +1 similar issue</=
p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-64x21-sliding:</p>
<ul>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9350/shard-apl7/igt@kms_cursor_crc@pipe-a-cursor-64x21-sliding.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
183/shard-apl1/igt@kms_cursor_crc@pipe-a-cursor-64x21-sliding.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#16=
35</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/54">i91=
5#54</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9350/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-64x21-sliding.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
183/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-64x21-sliding.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</=
a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-c-64x64-top-edge:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9350/shard-apl8/igt@kms_cursor_edge_walk@pipe-c-64x64-top-edge.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
5183/shard-apl3/igt@kms_cursor_edge_walk@pipe-c-64x64-top-edge.html">DMESG-=
WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635">=
i915#1635</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
1982">i915#1982</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-varying-size:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9350/shard-hsw4/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.h=
tml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_5183/shard-hsw6/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html">=
FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2370">=
i915#2370</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9350/shard-hsw6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-trans=
itions-varying-size.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_5183/shard-hsw1/igt@kms_cursor_legacy@cursorb-vs-fl=
ipb-atomic-transitions-varying-size.html">DMESG-WARN</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9350/shard-tglb5/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_51=
83/shard-tglb2/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ab-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9350/shard-glk7/igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ab-hdmi-=
a1-hdmi-a2.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_5183/shard-glk4/igt@kms_flip@2x-flip-vs-absolute-wf_vblank@a=
b-hdmi-a1-hdmi-a2.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/1982">i915#1982</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-vs-vblank-race-interruptible@b-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9350/shard-glk6/igt@kms_flip@dpms-vs-vblank-race-interruptible@b-hd=
mi-a1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_5183/shard-glk4/igt@kms_flip@dpms-vs-vblank-race-interruptible@b-=
hdmi-a1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/407">i915#407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9350/shard-tglb8/igt@kms_flip@flip-vs-expired-vblank-interruptible@=
a-edp1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_5183/shard-tglb7/igt@kms_flip@flip-vs-expired-vblank-interruptib=
le@a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/2598">i915#2598</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9350/shard-hsw6/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5183/sha=
rd-hsw4/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html">INCOMPLETE</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/2055">i915#2055</a>) +=
1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9350/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-in=
dfb-draw-blt.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_5183/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-1p-offscr=
en-pri-indfb-draw-blt.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-pwrite:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9350/shard-iclb5/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-s=
hrfb-draw-pwrite.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_5183/shard-iclb5/igt@kms_frontbuffer_tracking@fbc-1p-o=
ffscren-pri-shrfb-draw-pwrite.html">DMESG-WARN</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-stridechange:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9350/shard-tglb5/igt@kms_frontbuffer_tracking@fbc-stridechange.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
5183/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-stridechange.html">DMESG-=
WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1982">=
i915#1982</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9350/shard-iclb2/igt@kms_psr2_su@frontbuffer.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5183/shard-iclb5/i=
gt@kms_psr2_su@frontbuffer.html">SKIP</a> (<a href=3D"https://bugs.freedesk=
top.org/show_bug.cgi?id=3D109642">fdo#109642</a> / <a href=3D"https://bugs.=
freedesktop.org/show_bug.cgi?id=3D111068">fdo#111068</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_render:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9350/shard-iclb2/igt@kms_psr@psr2_cursor_render.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5183/shard-iclb=
4/igt@kms_psr@psr2_cursor_render.html">SKIP</a> (<a href=3D"https://bugs.fr=
eedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@invalid-create-userspace-config:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9350/shard-kbl1/igt@perf@invalid-create-userspace-config.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5183/sh=
ard-kbl3/igt@perf@invalid-create-userspace-config.html">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354=
</a>)</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9350/shard-apl4/igt@perf@invalid-create-userspace-config.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5183/sh=
ard-apl6/igt@perf@invalid-create-userspace-config.html">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635">i91=
5#1635</a>)</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9350/shard-glk6/igt@perf@invalid-create-userspace-config.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5183/sh=
ard-glk1/igt@perf@invalid-create-userspace-config.html">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354=
</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9350/shard-iclb4/igt@perf@invalid-create-userspace-config.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5183/s=
hard-iclb7/igt@perf@invalid-create-userspace-config.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>)</p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9350/shard-tglb7/igt@perf@invalid-create-userspace-config.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5183/s=
hard-tglb3/igt@perf@invalid-create-userspace-config.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9350/shard-glk6/igt@gem_exec_suspend@basic-s3.html">FAIL</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5183/shard-glk1/ig=
t@gem_exec_suspend@basic-s3.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9350/shard-kbl2/igt@gem_exec_suspend@basic-s3.html">DMESG-WARN</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5183/sha=
rd-kbl2/igt@gem_exec_suspend@basic-s3.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@noreloc-s3:</p>
<ul>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9350/shard-iclb4/igt@gem_softpin@noreloc-s3.html">INCOMPLETE</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1373">i915#1373</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2405">i915#2=
405</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_51=
83/shard-iclb5/igt@gem_softpin@noreloc-s3.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9350/shard-apl4/igt@gem_softpin@noreloc-s3.html">INCOMPLETE</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2405">i915#24=
05</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2635">i=
915#2635</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_5183/shard-apl7/igt@gem_softpin@noreloc-s3.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9350/shard-glk6/igt@gem_softpin@noreloc-s3.html">INCOMPLETE</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2199">i915#2199</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2405">i915#24=
05</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2635">i=
915#2635</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_5183/shard-glk2/igt@gem_softpin@noreloc-s3.html">PASS</a></p>
</li>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9350/shard-hsw1/igt@gem_softpin@noreloc-s3.html">INCOMPLETE</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2405">i915#2405</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2637">i915#26=
37</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_518=
3/shard-hsw6/igt@gem_softpin@noreloc-s3.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9350/shard-kbl1/igt@gem_softpin@noreloc-s3.html">INCOMPLETE</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2405">i915#2405</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5183/shar=
d-kbl7/igt@gem_softpin@noreloc-s3.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_async_flips@alternate-sync-async-flip}:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9350/shard-tglb2/igt@kms_async_flips@alternate-sync-async-flip.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2521=
">i915#2521</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_5183/shard-tglb6/igt@kms_async_flips@alternate-sync-async-flip.html">=
PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9350/shard-snb6/igt@kms_cursor_legacy@short-flip-after-cursor-atomi=
c-transitions.html">FAIL</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_5183/shard-snb7/igt@kms_cursor_legacy@short-flip-after-cu=
rsor-atomic-transitions.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-untiled:</p>
<ul>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9350/shard-apl7/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-un=
tiled.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/1635">i915#1635</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_5183/shard-apl1/igt@kms_draw_crc@draw-method-xr=
gb2101010-mmap-gtt-untiled.html">PASS</a> +6 similar issues</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9350/shard-glk6/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-un=
tiled.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/1982">i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_5183/shard-glk4/igt@kms_draw_crc@draw-method-xrgb2101=
010-mmap-gtt-untiled.html">PASS</a> +5 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-off-confusion@a-vga1:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9350/shard-hsw6/igt@kms_flip@dpms-off-confusion@a-vga1.html">DMESG-=
WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1982">=
i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_5183/shard-hsw2/igt@kms_flip@dpms-off-confusion@a-vga1.html">PASS</a> +=
1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-badstride:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9350/shard-iclb3/igt@kms_frontbuffer_tracking@fbc-badstride.html">D=
MESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1=
982">i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_5183/shard-iclb8/igt@kms_frontbuffer_tracking@fbc-badstride.html">=
PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-blt:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9350/shard-tglb2/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-bl=
t.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/1982">i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_5183/shard-tglb2/igt@kms_frontbuffer_tracking@psr-rgb1010=
10-draw-blt.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9350/shard-tglb5/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/433">i915#433</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5183/shar=
d-tglb2/igt@kms_hdmi_inject@inject-audio.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole-dpms-pipe-b-planes:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9350/shard-kbl3/igt@kms_plane@plane-position-hole-dpms-pipe-b-planes=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/2472">i915#2472</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_5183/shard-kbl2/igt@kms_plane@plane-position-hole-dpms-pipe-b-pl=
anes.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9350/shard-apl3/igt@kms_plane@plane-position-hole-dpms-pipe-b-planes=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/1635">i915#1635</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/2472">i915#2472</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_5183/shard-apl3/igt@kms_plane@plane-position-hole-dpms-pip=
e-b-planes.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_no_drrs:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9350/shard-iclb5/igt@kms_psr@psr2_no_drrs.html">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5183/shard-=
iclb2/igt@kms_psr@psr2_no_drrs.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9350/shard-hsw1/igt@kms_setmode@basic.html">FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/31">i915#31</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5183/shard-hsw1/igt@kms=
_setmode@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf@oa-exponents:</p>
<ul>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9350/shard-tglb8/igt@perf@oa-exponents.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5183/shard-tglb2/ig=
t@perf@oa-exponents.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9350/shard-glk5/igt@perf@oa-exponents.html">SKIP</a> (<a href=3D"htt=
ps://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5183/shard-g=
lk8/igt@perf@oa-exponents.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9350/shard-apl8/igt@perf@oa-exponents.html">SKIP</a> (<a href=3D"htt=
ps://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5183/s=
hard-apl1/igt@perf@oa-exponents.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9350/shard-kbl1/igt@perf@oa-exponents.html">SKIP</a> (<a href=3D"htt=
ps://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5183/shard-k=
bl6/igt@perf@oa-exponents.html">PASS</a></p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9350/shard-iclb5/igt@perf@oa-exponents.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5183/shard-iclb4/ig=
t@perf@oa-exponents.html">PASS</a></p>
</li>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9350/shard-hsw6/igt@perf@oa-exponents.html">SKIP</a> (<a href=3D"htt=
ps://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5183/shard-hsw4/ig=
t@perf@oa-exponents.html">PASS</a></p>
</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_eio@kms:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9350/shard-hsw2/igt@gem_eio@kms.html">INCOMPLETE</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/1888">i915#1888</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2244">i915#2244</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5183/shard-hs=
w4/igt@gem_eio@kms.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/2244">i915#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@noreloc-s3:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9350/shard-tglb7/igt@gem_softpin@noreloc-s3.html">DMESG-WARN</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5183/sh=
ard-tglb6/igt@gem_softpin@noreloc-s3.html">DMESG-WARN</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9350/shard-tglb8/igt@i915_pm_rpm@gem-execbuf.html">DMESG-WARN</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5183/s=
hard-tglb8/igt@i915_pm_rpm@gem-execbuf.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/579">i915#579</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9350/shard-iclb7/igt@i915_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a=
 href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110892">fdo#110892<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5183/s=
hard-iclb5/igt@i915_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/579">i915#579</a>)</p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9350/shard-tglb5/igt@i915_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a=
 href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111644">fdo#111644<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1397">i915=
#1397</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2411=
">i915#2411</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_5183/shard-tglb8/igt@i915_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/579">i915#579</a>)<=
/p>
</li>
</ul>
</li>
<li>
<p>igt@kms_dp_dsc@basic-dsc-enable-edp:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9350/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html">DMESG-WA=
RN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1226">i9=
15#1226</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_5183/shard-iclb8/igt@kms_dp_dsc@basic-dsc-enable-edp.html">SKIP</a> (<a h=
ref=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109349">fdo#109349</a=
>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-iclb:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9350/shard-iclb5/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-iclb4/igt@runner@abo=
rted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/2439">i915#2439</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/483">i915#483</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_5183/shard-iclb2/igt@runner@aborted.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#22=
95</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2439">i=
915#2439</a>)</p>
</li>
<li>
<p>shard-glk:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9350/shard-glk2/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9350/shard-glk6/igt@runner@abort=
ed.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/1611">i915#1611</a> / <a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/2439">i915#2439</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/86">i915#86</a> / <a href=3D"https://bugzilla.kernel.=
org/show_bug.cgi?id=3D202321">k.org#202321</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_5183/shard-glk7/igt@runner@aborted.htm=
l">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/161=
1">i915#1611</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/2295">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/2439">i915#2439</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/483">i915#483</a> / <a href=3D"https://bugzilla.kernel.org/s=
how_bug.cgi?id=3D202321">k.org#202321</a>)</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (10 -&gt; 8)</h2>
<p>Missing    (2): pig-skl-6260u pig-glk-j5005 </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5855 -&gt; IGTPW_5183</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9350: 3161d1b26b7e1a7cb9146e3f8bd613f901ff5b38 @ git://anongit.fre=
edesktop.org/gfx-ci/linux<br />
  IGTPW_5183: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5183/index.htm=
l<br />
  IGT_5855: d9b3c7058efe41e5224dd1e43fac05dc6d049380 @ git://anongit.freede=
sktop.org/xorg/app/intel-gpu-tools<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============7575048434364588431==--

--===============1238653533==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1238653533==--
