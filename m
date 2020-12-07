Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 07 Dec 2020 16:36:32 -0000
Message-ID: <160735899280.8717.15262972880399280872@emeril.freedesktop.org>
References: <20201207132830.269253-1-apoorva1.singh@intel.com>
In-Reply-To: <20201207132830.269253-1-apoorva1.singh@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fread=5Fread=5Fspeed=3A_Add_subtests_description?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============2084155209=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: apoorva1.singh@intel.com
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============2084155209==
Content-Type: multipart/alternative;
 boundary="===============4789315884649172159=="

--===============4789315884649172159==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: i915/gem_read_read_speed: Add subtests description
URL   : https://patchwork.freedesktop.org/series/84642/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5884_full -> IGTPW_5255_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5255_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5255_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5255/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5255_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_endless@dispatch@vcs0:
    - shard-iclb:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5884/shard-iclb4/igt@gem_exec_endless@dispatch@vcs0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5255/shard-iclb3/igt@gem_exec_endless@dispatch@vcs0.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-iclb:         [PASS][3] -> [DMESG-WARN][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5884/shard-iclb4/igt@gem_exec_suspend@basic-s3.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5255/shard-iclb6/igt@gem_exec_suspend@basic-s3.html
    - shard-kbl:          [PASS][5] -> [DMESG-WARN][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5884/shard-kbl3/igt@gem_exec_suspend@basic-s3.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5255/shard-kbl4/igt@gem_exec_suspend@basic-s3.html

  * igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size:
    - shard-hsw:          [PASS][7] -> [INCOMPLETE][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5884/shard-hsw7/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5255/shard-hsw4/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size.html

  
Known issues
------------

  Here are the changes found in IGTPW_5255_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_suspend@basic-s3:
    - shard-glk:          [PASS][9] -> [DMESG-WARN][10] ([i915#2635])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5884/shard-glk7/igt@gem_exec_suspend@basic-s3.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5255/shard-glk3/igt@gem_exec_suspend@basic-s3.html
    - shard-hsw:          [PASS][11] -> [DMESG-WARN][12] ([i915#2637])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5884/shard-hsw4/igt@gem_exec_suspend@basic-s3.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5255/shard-hsw7/igt@gem_exec_suspend@basic-s3.html
    - shard-tglb:         [PASS][13] -> [DMESG-WARN][14] ([i915#1436] / [i915#1602] / [i915#1887] / [i915#2411])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5884/shard-tglb6/igt@gem_exec_suspend@basic-s3.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5255/shard-tglb2/igt@gem_exec_suspend@basic-s3.html
    - shard-apl:          [PASS][15] -> [INCOMPLETE][16] ([i915#2369] / [i915#2635])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5884/shard-apl7/igt@gem_exec_suspend@basic-s3.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5255/shard-apl4/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglb:         [PASS][17] -> [SKIP][18] ([i915#2190])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5884/shard-tglb8/igt@gem_huc_copy@huc-copy.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5255/shard-tglb6/igt@gem_huc_copy@huc-copy.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-kbl:          [PASS][19] -> [DMESG-WARN][20] ([i915#1436] / [i915#716])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5884/shard-kbl6/igt@gen9_exec_parse@allowed-all.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5255/shard-kbl6/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_pm_rpm@i2c:
    - shard-tglb:         [PASS][21] -> [SKIP][22] ([i915#579])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5884/shard-tglb7/igt@i915_pm_rpm@i2c.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5255/shard-tglb2/igt@i915_pm_rpm@i2c.html
    - shard-glk:          [PASS][23] -> [SKIP][24] ([fdo#109271])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5884/shard-glk2/igt@i915_pm_rpm@i2c.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5255/shard-glk3/igt@i915_pm_rpm@i2c.html
    - shard-hsw:          [PASS][25] -> [SKIP][26] ([fdo#109271])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5884/shard-hsw6/igt@i915_pm_rpm@i2c.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5255/shard-hsw7/igt@i915_pm_rpm@i2c.html
    - shard-kbl:          [PASS][27] -> [SKIP][28] ([fdo#109271])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5884/shard-kbl3/igt@i915_pm_rpm@i2c.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5255/shard-kbl4/igt@i915_pm_rpm@i2c.html
    - shard-iclb:         [PASS][29] -> [SKIP][30] ([i915#579])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5884/shard-iclb6/igt@i915_pm_rpm@i2c.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5255/shard-iclb6/igt@i915_pm_rpm@i2c.html
    - shard-apl:          [PASS][31] -> [SKIP][32] ([fdo#109271])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5884/shard-apl2/igt@i915_pm_rpm@i2c.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5255/shard-apl4/igt@i915_pm_rpm@i2c.html

  * igt@kms_async_flips@test-time-stamp:
    - shard-tglb:         [PASS][33] -> [FAIL][34] ([i915#2574])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5884/shard-tglb3/igt@kms_async_flips@test-time-stamp.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5255/shard-tglb5/igt@kms_async_flips@test-time-stamp.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen:
    - shard-kbl:          [PASS][35] -> [FAIL][36] ([i915#54])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5884/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5255/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html
    - shard-apl:          [PASS][37] -> [FAIL][38] ([i915#54])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5884/shard-apl1/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5255/shard-apl2/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html

  * igt@kms_cursor_legacy@all-pipes-forked-move:
    - shard-hsw:          [PASS][39] -> [INCOMPLETE][40] ([i915#2369])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5884/shard-hsw8/igt@kms_cursor_legacy@all-pipes-forked-move.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5255/shard-hsw8/igt@kms_cursor_legacy@all-pipes-forked-move.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [PASS][41] -> [SKIP][42] ([fdo#109642] / [fdo#111068])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5884/shard-iclb2/igt@kms_psr2_su@page_flip.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5255/shard-iclb7/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_primary_mmap_gtt:
    - shard-iclb:         [PASS][43] -> [SKIP][44] ([fdo#109441])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5884/shard-iclb2/igt@kms_psr@psr2_primary_mmap_gtt.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5255/shard-iclb3/igt@kms_psr@psr2_primary_mmap_gtt.html

  * igt@kms_sequence@get-forked:
    - shard-kbl:          [PASS][45] -> [DMESG-WARN][46] ([i915#180]) +1 similar issue
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5884/shard-kbl6/igt@kms_sequence@get-forked.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5255/shard-kbl2/igt@kms_sequence@get-forked.html

  
#### Possible fixes ####

  * {igt@gem_ctx_exec@basic-close-race}:
    - shard-glk:          [DMESG-FAIL][47] -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5884/shard-glk7/igt@gem_ctx_exec@basic-close-race.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5255/shard-glk9/igt@gem_ctx_exec@basic-close-race.html
    - shard-apl:          [DMESG-FAIL][49] -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5884/shard-apl4/igt@gem_ctx_exec@basic-close-race.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5255/shard-apl2/igt@gem_ctx_exec@basic-close-race.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-iclb:         [FAIL][51] ([i915#454]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5884/shard-iclb1/igt@i915_pm_dc@dc6-dpms.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5255/shard-iclb1/igt@i915_pm_dc@dc6-dpms.html

  * igt@kms_cursor_crc@pipe-b-cursor-64x21-sliding:
    - shard-apl:          [FAIL][53] ([i915#54]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5884/shard-apl2/igt@kms_cursor_crc@pipe-b-cursor-64x21-sliding.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5255/shard-apl8/igt@kms_cursor_crc@pipe-b-cursor-64x21-sliding.html

  * igt@kms_cursor_crc@pipe-d-cursor-suspend:
    - shard-tglb:         [INCOMPLETE][55] ([i915#1436] / [i915#1982]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5884/shard-tglb8/igt@kms_cursor_crc@pipe-d-cursor-suspend.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5255/shard-tglb5/igt@kms_cursor_crc@pipe-d-cursor-suspend.html

  * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
    - shard-tglb:         [FAIL][57] ([i915#2346]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5884/shard-tglb8/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5255/shard-tglb3/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html

  * igt@kms_flip@2x-plain-flip-ts-check@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          [FAIL][59] ([i915#2122]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5884/shard-glk8/igt@kms_flip@2x-plain-flip-ts-check@ab-hdmi-a1-hdmi-a2.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5255/shard-glk7/igt@kms_flip@2x-plain-flip-ts-check@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-tglb:         [FAIL][61] ([i915#2598]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5884/shard-tglb3/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5255/shard-tglb7/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip@flip-vs-suspend@c-hdmi-a1:
    - shard-hsw:          [INCOMPLETE][63] ([i915#2055]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5884/shard-hsw1/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5255/shard-hsw4/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [SKIP][65] ([i915#433]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5884/shard-tglb7/igt@kms_hdmi_inject@inject-audio.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5255/shard-tglb8/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-hsw:          [DMESG-WARN][67] ([i915#2637]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5884/shard-hsw4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5255/shard-hsw7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_psr@psr2_sprite_mmap_gtt:
    - shard-iclb:         [SKIP][69] ([fdo#109441]) -> [PASS][70] +1 similar issue
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5884/shard-iclb3/igt@kms_psr@psr2_sprite_mmap_gtt.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5255/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc6-dpms:
    - shard-kbl:          [FAIL][71] -> [FAIL][72] ([i915#454])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5884/shard-kbl4/igt@i915_pm_dc@dc6-dpms.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5255/shard-kbl4/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-iclb:         [WARN][73] ([i915#2684]) -> [WARN][74] ([i915#1804] / [i915#2684])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5884/shard-iclb2/igt@i915_pm_rc6_residency@rc6-idle.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5255/shard-iclb6/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@runner@aborted:
    - shard-hsw:          [FAIL][75] ([i915#2295]) -> ([FAIL][76], [FAIL][77]) ([i915#2295] / [i915#2505])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5884/shard-hsw4/igt@runner@aborted.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5255/shard-hsw7/igt@runner@aborted.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5255/shard-hsw5/igt@runner@aborted.html
    - shard-kbl:          [FAIL][78] ([i915#2295] / [i915#2722]) -> ([FAIL][79], [FAIL][80], [FAIL][81]) ([fdo#109271] / [i915#1436] / [i915#2295] / [i915#2722] / [i915#483] / [i915#716])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5884/shard-kbl7/igt@runner@aborted.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5255/shard-kbl4/igt@runner@aborted.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5255/shard-kbl3/igt@runner@aborted.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5255/shard-kbl6/igt@runner@aborted.html
    - shard-glk:          ([FAIL][82], [FAIL][83]) ([i915#2295] / [i915#2722] / [k.org#202321]) -> ([FAIL][84], [FAIL][85]) ([i915#2295] / [i915#2722] / [i915#483] / [k.org#202321])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5884/shard-glk7/igt@runner@aborted.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5884/shard-glk4/igt@runner@aborted.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5255/shard-glk3/igt@runner@aborted.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5255/shard-glk5/igt@runner@aborted.html
    - shard-tglb:         ([FAIL][86], [FAIL][87]) ([i915#1602] / [i915#2295] / [i915#2722]) -> ([FAIL][88], [FAIL][89]) ([i915#2295] / [i915#2722])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5884/shard-tglb1/igt@runner@aborted.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5884/shard-tglb8/igt@runner@aborted.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5255/shard-tglb2/igt@runner@aborted.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5255/shard-tglb2/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1804]: https://gitlab.freedesktop.org/drm/intel/issues/1804
  [i915#1887]: https://gitlab.freedesktop.org/drm/intel/issues/1887
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2055]: https://gitlab.freedesktop.org/drm/intel/issues/2055
  [i915#2122]: https://gitlab.freedesktop.org/drm/intel/issues/2122
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2295]: https://gitlab.freedesktop.org/drm/intel/issues/2295
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2369]: https://gitlab.freedesktop.org/drm/intel/issues/2369
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#2505]: https://gitlab.freedesktop.org/drm/intel/issues/2505
  [i915#2574]: https://gitlab.freedesktop.org/drm/intel/issues/2574
  [i915#2598]: https://gitlab.freedesktop.org/drm/intel/issues/2598
  [i915#2635]: https://gitlab.freedesktop.org/drm/intel/issues/2635
  [i915#2637]: https://gitlab.freedesktop.org/drm/intel/issues/2637
  [i915#2684]: https://gitlab.freedesktop.org/drm/intel/issues/2684
  [i915#2722]: https://gitlab.freedesktop.org/drm/intel/issues/2722
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#483]: https://gitlab.freedesktop.org/drm/intel/issues/483
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [k.org#202321]: https://bugzilla.kernel.org/show_bug.cgi?id=202321


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5884 -> IGTPW_5255

  CI-20190529: 20190529
  CI_DRM_9453: 52e2ca46b7e2aa62c0509bce0be189d2f5a7325f @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5255: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5255/index.html
  IGT_5884: b1015a3267bbccb985b2fa7e3accb778c7bff0ed @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5255/index.html

--===============4789315884649172159==
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
<tr><td><b>Series:</b></td><td>i915/gem_read_read_speed: Add subtests descr=
iption</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/84642/">https://patchwork.freedesktop.org/series/84642/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5255/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5255/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_5884_full -&gt; IGTPW_5255_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5255_full absolutely need to b=
e<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_5255_full, please notify your bug team to allow them<=
br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5255/index.=
html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5255=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_exec_endless@dispatch@vcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5884/shard-iclb4/igt@gem_exec_endless@dispatch@vcs0.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5255/shard-icl=
b3/igt@gem_exec_endless@dispatch@vcs0.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5884/shard-iclb4/igt@gem_exec_suspend@basic-s3.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5255/shard-iclb6/igt=
@gem_exec_suspend@basic-s3.html">DMESG-WARN</a></p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5884/shard-kbl3/igt@gem_exec_suspend@basic-s3.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5255/shard-kbl4/igt@g=
em_exec_suspend@basic-s3.html">DMESG-WARN</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying=
-size:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5884/shard-hsw7/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-t=
ransitions-varying-size.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_5255/shard-hsw4/igt@kms_cursor_legacy@short-fli=
p-after-cursor-atomic-transitions-varying-size.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5255_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5884/shard-glk7/igt@gem_exec_suspend@basic-s3.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5255/shard-glk3/igt@g=
em_exec_suspend@basic-s3.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/2635">i915#2635</a>)</p>
</li>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5884/shard-hsw4/igt@gem_exec_suspend@basic-s3.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5255/shard-hsw7/igt@g=
em_exec_suspend@basic-s3.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/2637">i915#2637</a>)</p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5884/shard-tglb6/igt@gem_exec_suspend@basic-s3.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5255/shard-tglb2/igt=
@gem_exec_suspend@basic-s3.html">DMESG-WARN</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/1887">i915#1887</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a>)</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5884/shard-apl7/igt@gem_exec_suspend@basic-s3.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5255/shard-apl4/igt@g=
em_exec_suspend@basic-s3.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/2369">i915#2369</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/2635">i915#2635</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5884/shard-tglb8/igt@gem_huc_copy@huc-copy.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5255/shard-tglb6/igt@ge=
m_huc_copy@huc-copy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5884/shard-kbl6/igt@gen9_exec_parse@allowed-all.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5255/shard-kbl6/ig=
t@gen9_exec_parse@allowed-all.html">DMESG-WARN</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/716">i915#716</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@i2c:</p>
<ul>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5884/shard-tglb7/igt@i915_pm_rpm@i2c.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5255/shard-tglb2/igt@i915_pm_r=
pm@i2c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/579">i915#579</a>)</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5884/shard-glk2/igt@i915_pm_rpm@i2c.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5255/shard-glk3/igt@i915_pm_rpm=
@i2c.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5884/shard-hsw6/igt@i915_pm_rpm@i2c.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5255/shard-hsw7/igt@i915_pm_rpm=
@i2c.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5884/shard-kbl3/igt@i915_pm_rpm@i2c.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5255/shard-kbl4/igt@i915_pm_rpm=
@i2c.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5884/shard-iclb6/igt@i915_pm_rpm@i2c.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5255/shard-iclb6/igt@i915_pm_r=
pm@i2c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/579">i915#579</a>)</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5884/shard-apl2/igt@i915_pm_rpm@i2c.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5255/shard-apl4/igt@i915_pm_rpm=
@i2c.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D109271">fdo#109271</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5884/shard-tglb3/igt@kms_async_flips@test-time-stamp.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5255/shard-tg=
lb5/igt@kms_async_flips@test-time-stamp.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/2574">i915#2574</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5884/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_525=
5/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a=
>)</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5884/shard-apl1/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_525=
5/shard-apl2/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a=
>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@all-pipes-forked-move:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5884/shard-hsw8/igt@kms_cursor_legacy@all-pipes-forked-move.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5255/s=
hard-hsw8/igt@kms_cursor_legacy@all-pipes-forked-move.html">INCOMPLETE</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2369">i915#2369=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5884/shard-iclb2/igt@kms_psr2_su@page_flip.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5255/shard-iclb7/igt@km=
s_psr2_su@page_flip.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org=
/show_bug.cgi?id=3D109642">fdo#109642</a> / <a href=3D"https://bugs.freedes=
ktop.org/show_bug.cgi?id=3D111068">fdo#111068</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_gtt:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5884/shard-iclb2/igt@kms_psr@psr2_primary_mmap_gtt.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5255/shard-iclb=
3/igt@kms_psr@psr2_primary_mmap_gtt.html">SKIP</a> (<a href=3D"https://bugs=
.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-forked:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5884/shard-kbl6/igt@kms_sequence@get-forked.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5255/shard-kbl2/igt@km=
s_sequence@get-forked.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/180">i915#180</a>) +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>{igt@gem_ctx_exec@basic-close-race}:</p>
<ul>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5884/shard-glk7/igt@gem_ctx_exec@basic-close-race.html">DMESG-FAIL</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5255/shard-=
glk9/igt@gem_ctx_exec@basic-close-race.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5884/shard-apl4/igt@gem_ctx_exec@basic-close-race.html">DMESG-FAIL</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5255/shard-=
apl2/igt@gem_ctx_exec@basic-close-race.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5884/shard-iclb1/igt@i915_pm_dc@dc6-dpms.html">FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/454">i915#454</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5255/shard-iclb1/igt@=
i915_pm_dc@dc6-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-64x21-sliding:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5884/shard-apl2/igt@kms_cursor_crc@pipe-b-cursor-64x21-sliding.html">F=
AIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/54">i91=
5#54</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
255/shard-apl8/igt@kms_cursor_crc@pipe-b-cursor-64x21-sliding.html">PASS</a=
></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-suspend:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5884/shard-tglb8/igt@kms_cursor_crc@pipe-d-cursor-suspend.html">INCOMP=
LETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1436">=
i915#1436</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
1982">i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_5255/shard-tglb5/igt@kms_cursor_crc@pipe-d-cursor-suspend.html">P=
ASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-toggle:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5884/shard-tglb8/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2346">i91=
5#2346</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5255/shard-tglb3/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">PASS</a=
></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check@ab-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5884/shard-glk8/igt@kms_flip@2x-plain-flip-ts-check@ab-hdmi-a1-hdmi-a2=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/2122">i915#2122</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_5255/shard-glk7/igt@kms_flip@2x-plain-flip-ts-check@ab-hdmi-a1-h=
dmi-a2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5884/shard-tglb3/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2598">i915=
#2598</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
5255/shard-tglb7/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">PASS</a><=
/li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5884/shard-hsw1/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html">INCOMPLET=
E</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2055">i91=
5#2055</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5255/shard-hsw4/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5884/shard-tglb7/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/433">i915#433</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5255/shard-t=
glb8/igt@kms_hdmi_inject@inject-audio.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5884/shard-hsw4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-=
a-planes.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/2637">i915#2637</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_5255/shard-hsw7/igt@kms_plane@plane-panning-bottom=
-right-suspend-pipe-a-planes.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_mmap_gtt:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5884/shard-iclb3/igt@kms_psr@psr2_sprite_mmap_gtt.html">SKIP</a> (<a h=
ref=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5255/sha=
rd-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html">PASS</a> +1 similar issue</=
li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5884/shard-kbl4/igt@i915_pm_dc@dc6-dpms.html">FAIL</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5255/shard-kbl4/igt@i915=
_pm_dc@dc6-dpms.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/454">i915#454</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5884/shard-iclb2/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2684">i915#2684</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5255/sha=
rd-iclb6/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/1804">i915#1804</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2684">i915#2684</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5884/shard-hsw4/igt@runner@aborted.html">FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a>) -&gt; (<a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5255/shard-hsw7/igt@runn=
er@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_5255/shard-hsw5/igt@runner@aborted.html">FAIL</a>) (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2505">i915#2505</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5884/shard-kbl7/igt@runner@aborted.html">FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/2722">i915#2722</a>) -&gt; (<a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5255/shard-kbl4/igt=
@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_5255/shard-kbl3/igt@runner@aborted.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5255/shard-kbl6/igt@runn=
er@aborted.html">FAIL</a>) (<a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/1436">i915#1436</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/intel/issues/2722">i915#2722</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/483">i915#483</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/716">i915#716</a>)</p>
</li>
<li>
<p>shard-glk:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5884/shard-glk7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGT_5884/shard-glk4/igt@runner@aborted.htm=
l">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/22=
95">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/2722">i915#2722</a> / <a href=3D"https://bugzilla.kernel.org/show_bug.c=
gi?id=3D202321">k.org#202321</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_5255/shard-glk3/igt@runner@aborted.html">FAIL</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5255/shard-glk5/i=
gt@runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/2722">i915#2722</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/483">i915#483</a> / <a href=3D"https://bugzi=
lla.kernel.org/show_bug.cgi?id=3D202321">k.org#202321</a>)</p>
</li>
<li>
<p>shard-tglb:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5884/shard-tglb1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGT_5884/shard-tglb8/igt@runner@aborted.h=
tml">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
1602">i915#1602</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/2722">i915#2722</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_5255/shard-tglb2/igt@runner@aborted.html">FAIL</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5255/shard-tglb2/=
igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/2722">i915#2722</a>)</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5884 -&gt; IGTPW_5255</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9453: 52e2ca46b7e2aa62c0509bce0be189d2f5a7325f @ git://anongit.fre=
edesktop.org/gfx-ci/linux<br />
  IGTPW_5255: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5255/index.htm=
l<br />
  IGT_5884: b1015a3267bbccb985b2fa7e3accb778c7bff0ed @ git://anongit.freede=
sktop.org/xorg/app/intel-gpu-tools</p>

</body>
</html>

--===============4789315884649172159==--

--===============2084155209==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============2084155209==--
