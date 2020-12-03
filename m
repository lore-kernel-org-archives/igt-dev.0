Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 03 Dec 2020 10:12:31 -0000
Message-ID: <160699035147.31153.11171731114436880937@emeril.freedesktop.org>
References: <20201203061733.8058-1-nidhi1.gupta@intel.com>
In-Reply-To: <20201203061733.8058-1-nidhi1.gupta@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fatomic=5Ftransition=3Areduce_execution_time?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0810567887=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: nidhi1.gupta@intel.com
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0810567887==
Content-Type: multipart/alternative;
 boundary="===============6617984833456414080=="

--===============6617984833456414080==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_atomic_transition:reduce execution time
URL   : https://patchwork.freedesktop.org/series/84516/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9430_full -> IGTPW_5245_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5245/index.html

Known issues
------------

  Here are the changes found in IGTPW_5245_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - shard-tglb:         [PASS][1] -> [INCOMPLETE][2] ([i915#1602])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9430/shard-tglb1/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5245/shard-tglb2/igt@core_hotunplug@unbind-rebind.html
    - shard-apl:          [PASS][3] -> [INCOMPLETE][4] ([i915#2283])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9430/shard-apl4/igt@core_hotunplug@unbind-rebind.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5245/shard-apl7/igt@core_hotunplug@unbind-rebind.html
    - shard-glk:          [PASS][5] -> [INCOMPLETE][6] ([i915#2283])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9430/shard-glk9/igt@core_hotunplug@unbind-rebind.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5245/shard-glk3/igt@core_hotunplug@unbind-rebind.html
    - shard-kbl:          [PASS][7] -> [INCOMPLETE][8] ([i915#2283])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9430/shard-kbl2/igt@core_hotunplug@unbind-rebind.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5245/shard-kbl4/igt@core_hotunplug@unbind-rebind.html
    - shard-iclb:         [PASS][9] -> [INCOMPLETE][10] ([i915#2283])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9430/shard-iclb4/igt@core_hotunplug@unbind-rebind.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5245/shard-iclb5/igt@core_hotunplug@unbind-rebind.html

  * igt@i915_pm_rpm@i2c:
    - shard-tglb:         [PASS][11] -> [SKIP][12] ([i915#579])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9430/shard-tglb3/igt@i915_pm_rpm@i2c.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5245/shard-tglb2/igt@i915_pm_rpm@i2c.html
    - shard-glk:          [PASS][13] -> [SKIP][14] ([fdo#109271])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9430/shard-glk4/igt@i915_pm_rpm@i2c.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5245/shard-glk3/igt@i915_pm_rpm@i2c.html
    - shard-hsw:          [PASS][15] -> [SKIP][16] ([fdo#109271])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9430/shard-hsw1/igt@i915_pm_rpm@i2c.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5245/shard-hsw7/igt@i915_pm_rpm@i2c.html
    - shard-kbl:          [PASS][17] -> [SKIP][18] ([fdo#109271])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9430/shard-kbl7/igt@i915_pm_rpm@i2c.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5245/shard-kbl4/igt@i915_pm_rpm@i2c.html
    - shard-iclb:         [PASS][19] -> [SKIP][20] ([i915#579])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9430/shard-iclb3/igt@i915_pm_rpm@i2c.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5245/shard-iclb5/igt@i915_pm_rpm@i2c.html
    - shard-apl:          [PASS][21] -> [SKIP][22] ([fdo#109271])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9430/shard-apl8/igt@i915_pm_rpm@i2c.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5245/shard-apl7/igt@i915_pm_rpm@i2c.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-untiled:
    - shard-glk:          [PASS][23] -> [FAIL][24] ([i915#177] / [i915#52] / [i915#54])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9430/shard-glk7/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-untiled.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5245/shard-glk8/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-untiled.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1:
    - shard-tglb:         [PASS][25] -> [FAIL][26] ([i915#2122])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9430/shard-tglb5/igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5245/shard-tglb5/igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-tglb:         [PASS][27] -> [FAIL][28] ([i915#2598])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9430/shard-tglb7/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5245/shard-tglb3/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip@flip-vs-suspend@a-dp1:
    - shard-kbl:          [PASS][29] -> [INCOMPLETE][30] ([i915#155] / [i915#180])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9430/shard-kbl6/igt@kms_flip@flip-vs-suspend@a-dp1.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5245/shard-kbl4/igt@kms_flip@flip-vs-suspend@a-dp1.html

  * igt@kms_psr@psr2_sprite_blt:
    - shard-iclb:         [PASS][31] -> [SKIP][32] ([fdo#109441])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9430/shard-iclb2/igt@kms_psr@psr2_sprite_blt.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5245/shard-iclb4/igt@kms_psr@psr2_sprite_blt.html

  * igt@kms_vblank@pipe-c-accuracy-idle:
    - shard-glk:          [PASS][33] -> [FAIL][34] ([i915#43])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9430/shard-glk5/igt@kms_vblank@pipe-c-accuracy-idle.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5245/shard-glk4/igt@kms_vblank@pipe-c-accuracy-idle.html

  
#### Possible fixes ####

  * igt@gem_exec_reloc@basic-many-active@rcs0:
    - shard-apl:          [FAIL][35] ([i915#2389]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9430/shard-apl7/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5245/shard-apl4/igt@gem_exec_reloc@basic-many-active@rcs0.html

  * igt@gem_fenced_exec_thrash@no-spare-fences:
    - shard-hsw:          [INCOMPLETE][37] -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9430/shard-hsw1/igt@gem_fenced_exec_thrash@no-spare-fences.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5245/shard-hsw6/igt@gem_fenced_exec_thrash@no-spare-fences.html

  * igt@i915_pm_rpm@system-suspend-execbuf:
    - shard-iclb:         [SKIP][39] ([i915#579]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9430/shard-iclb8/igt@i915_pm_rpm@system-suspend-execbuf.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5245/shard-iclb3/igt@i915_pm_rpm@system-suspend-execbuf.html
    - shard-kbl:          [SKIP][41] ([fdo#109271]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9430/shard-kbl1/igt@i915_pm_rpm@system-suspend-execbuf.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5245/shard-kbl4/igt@i915_pm_rpm@system-suspend-execbuf.html
    - shard-apl:          [SKIP][43] ([fdo#109271]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9430/shard-apl1/igt@i915_pm_rpm@system-suspend-execbuf.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5245/shard-apl3/igt@i915_pm_rpm@system-suspend-execbuf.html
    - shard-tglb:         [SKIP][45] ([i915#579]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9430/shard-tglb5/igt@i915_pm_rpm@system-suspend-execbuf.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5245/shard-tglb6/igt@i915_pm_rpm@system-suspend-execbuf.html
    - shard-glk:          [SKIP][47] ([fdo#109271]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9430/shard-glk1/igt@i915_pm_rpm@system-suspend-execbuf.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5245/shard-glk8/igt@i915_pm_rpm@system-suspend-execbuf.html

  * igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@edp-1-pipe-d:
    - shard-tglb:         [INCOMPLETE][49] -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9430/shard-tglb6/igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@edp-1-pipe-d.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5245/shard-tglb7/igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@edp-1-pipe-d.html

  * igt@kms_plane_lowres@pipe-c-tiling-y:
    - shard-kbl:          [DMESG-WARN][51] ([i915#165] / [i915#180] / [i915#78]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9430/shard-kbl2/igt@kms_plane_lowres@pipe-c-tiling-y.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5245/shard-kbl4/igt@kms_plane_lowres@pipe-c-tiling-y.html

  * igt@kms_psr@psr2_primary_render:
    - shard-iclb:         [SKIP][53] ([fdo#109441]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9430/shard-iclb8/igt@kms_psr@psr2_primary_render.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5245/shard-iclb2/igt@kms_psr@psr2_primary_render.html

  * igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm:
    - shard-hsw:          [SKIP][55] ([fdo#109271]) -> [PASS][56] +2 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9430/shard-hsw2/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5245/shard-hsw7/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html

  
#### Warnings ####

  * igt@core_hotunplug@unbind-rebind:
    - shard-hsw:          [WARN][57] ([i915#2283]) -> [INCOMPLETE][58] ([i915#2283])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9430/shard-hsw2/igt@core_hotunplug@unbind-rebind.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5245/shard-hsw7/igt@core_hotunplug@unbind-rebind.html

  * igt@gem_exec_reloc@basic-wide-active@rcs0:
    - shard-hsw:          [FAIL][59] ([i915#2389]) -> [FAIL][60] ([i915#1888] / [i915#2389])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9430/shard-hsw7/igt@gem_exec_reloc@basic-wide-active@rcs0.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5245/shard-hsw7/igt@gem_exec_reloc@basic-wide-active@rcs0.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-iclb:         [WARN][61] ([i915#1804] / [i915#2684]) -> [WARN][62] ([i915#2681] / [i915#2684])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9430/shard-iclb6/igt@i915_pm_rc6_residency@rc6-fence.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5245/shard-iclb1/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-iclb:         [WARN][63] ([i915#1804] / [i915#2684]) -> [FAIL][64] ([i915#2680])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9430/shard-iclb3/igt@i915_pm_rc6_residency@rc6-idle.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5245/shard-iclb3/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@runner@aborted:
    - shard-kbl:          [FAIL][65] ([i915#2295] / [i915#2722]) -> ([FAIL][66], [FAIL][67], [FAIL][68]) ([i915#2283] / [i915#2295] / [i915#2722] / [i915#483])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9430/shard-kbl7/igt@runner@aborted.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5245/shard-kbl4/igt@runner@aborted.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5245/shard-kbl7/igt@runner@aborted.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5245/shard-kbl4/igt@runner@aborted.html
    - shard-iclb:         ([FAIL][69], [FAIL][70]) ([i915#2295] / [i915#2722] / [i915#483]) -> ([FAIL][71], [FAIL][72]) ([i915#2283] / [i915#2295] / [i915#2722] / [i915#483])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9430/shard-iclb8/igt@runner@aborted.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9430/shard-iclb5/igt@runner@aborted.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5245/shard-iclb2/igt@runner@aborted.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5245/shard-iclb5/igt@runner@aborted.html
    - shard-apl:          ([FAIL][73], [FAIL][74]) ([i915#2295] / [i915#2722]) -> ([FAIL][75], [FAIL][76]) ([i915#2283] / [i915#2295] / [i915#2722])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9430/shard-apl1/igt@runner@aborted.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9430/shard-apl1/igt@runner@aborted.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5245/shard-apl8/igt@runner@aborted.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5245/shard-apl7/igt@runner@aborted.html
    - shard-glk:          ([FAIL][77], [FAIL][78]) ([i915#2295] / [i915#2722] / [k.org#202321]) -> ([FAIL][79], [FAIL][80]) ([i915#2283] / [i915#2295] / [i915#2722] / [i915#483] / [k.org#202321])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9430/shard-glk1/igt@runner@aborted.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9430/shard-glk1/igt@runner@aborted.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5245/shard-glk6/igt@runner@aborted.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5245/shard-glk3/igt@runner@aborted.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#165]: https://gitlab.freedesktop.org/drm/intel/issues/165
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1804]: https://gitlab.freedesktop.org/drm/intel/issues/1804
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#2122]: https://gitlab.freedesktop.org/drm/intel/issues/2122
  [i915#2283]: https://gitlab.freedesktop.org/drm/intel/issues/2283
  [i915#2295]: https://gitlab.freedesktop.org/drm/intel/issues/2295
  [i915#2389]: https://gitlab.freedesktop.org/drm/intel/issues/2389
  [i915#2598]: https://gitlab.freedesktop.org/drm/intel/issues/2598
  [i915#2680]: https://gitlab.freedesktop.org/drm/intel/issues/2680
  [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
  [i915#2684]: https://gitlab.freedesktop.org/drm/intel/issues/2684
  [i915#2722]: https://gitlab.freedesktop.org/drm/intel/issues/2722
  [i915#43]: https://gitlab.freedesktop.org/drm/intel/issues/43
  [i915#483]: https://gitlab.freedesktop.org/drm/intel/issues/483
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579
  [i915#78]: https://gitlab.freedesktop.org/drm/intel/issues/78
  [k.org#202321]: https://bugzilla.kernel.org/show_bug.cgi?id=202321


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5878 -> IGTPW_5245
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_9430: 88c5c7135da4f61235fe3dbf4a67b2121b893fca @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5245: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5245/index.html
  IGT_5878: e96c0d8e6952d892bcbbcdf004999880a4dfb42e @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5245/index.html

--===============6617984833456414080==
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
<tr><td><b>Series:</b></td><td>tests/kms_atomic_transition:reduce execution=
 time</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/84516/">https://patchwork.freedesktop.org/series/84516/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5245/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5245/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9430_full -&gt; IGTPW_5245_full</h=
1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5245/index.=
html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5245_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9430/shard-tglb1/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5245/shard-tgl=
b2/igt@core_hotunplug@unbind-rebind.html">INCOMPLETE</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a>)</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9430/shard-apl4/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5245/shard-apl7=
/igt@core_hotunplug@unbind-rebind.html">INCOMPLETE</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/2283">i915#2283</a>)</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9430/shard-glk9/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5245/shard-glk3=
/igt@core_hotunplug@unbind-rebind.html">INCOMPLETE</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/2283">i915#2283</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9430/shard-kbl2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5245/shard-kbl4=
/igt@core_hotunplug@unbind-rebind.html">INCOMPLETE</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/2283">i915#2283</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9430/shard-iclb4/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5245/shard-icl=
b5/igt@core_hotunplug@unbind-rebind.html">INCOMPLETE</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/2283">i915#2283</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@i2c:</p>
<ul>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9430/shard-tglb3/igt@i915_pm_rpm@i2c.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5245/shard-tglb2/igt@i915_p=
m_rpm@i2c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/579">i915#579</a>)</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9430/shard-glk4/igt@i915_pm_rpm@i2c.html">PASS</a> -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5245/shard-glk3/igt@i915_pm_=
rpm@i2c.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9430/shard-hsw1/igt@i915_pm_rpm@i2c.html">PASS</a> -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5245/shard-hsw7/igt@i915_pm_=
rpm@i2c.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9430/shard-kbl7/igt@i915_pm_rpm@i2c.html">PASS</a> -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5245/shard-kbl4/igt@i915_pm_=
rpm@i2c.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9430/shard-iclb3/igt@i915_pm_rpm@i2c.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5245/shard-iclb5/igt@i915_p=
m_rpm@i2c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/579">i915#579</a>)</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9430/shard-apl8/igt@i915_pm_rpm@i2c.html">PASS</a> -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5245/shard-apl7/igt@i915_pm_=
rpm@i2c.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109271">fdo#109271</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-untiled:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9430/shard-glk7/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-u=
ntiled.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_5245/shard-glk8/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gt=
t-untiled.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/177">i915#177</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/52">i915#52</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/54">i915#54</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9430/shard-tglb5/igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5245/shard-tglb5/igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2122">i915=
#2122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9430/shard-tglb7/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_524=
5/shard-tglb3/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2598">i915#2598</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9430/shard-kbl6/igt@kms_flip@flip-vs-suspend@a-dp1.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5245/shard-k=
bl4/igt@kms_flip@flip-vs-suspend@a-dp1.html">INCOMPLETE</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/155">i915#155</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_blt:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9430/shard-iclb2/igt@kms_psr@psr2_sprite_blt.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5245/shard-iclb4/i=
gt@kms_psr@psr2_sprite_blt.html">SKIP</a> (<a href=3D"https://bugs.freedesk=
top.org/show_bug.cgi?id=3D109441">fdo#109441</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-accuracy-idle:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9430/shard-glk5/igt@kms_vblank@pipe-c-accuracy-idle.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5245/shard-=
glk4/igt@kms_vblank@pipe-c-accuracy-idle.html">FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/intel/issues/43">i915#43</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_reloc@basic-many-active@rcs0:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9430/shard-apl7/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2389">i91=
5#2389</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5245/shard-apl4/igt@gem_exec_reloc@basic-many-active@rcs0.html">PASS</a></=
li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@no-spare-fences:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9430/shard-hsw1/igt@gem_fenced_exec_thrash@no-spare-fences.html">IN=
COMPLETE</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_5245/shard-hsw6/igt@gem_fenced_exec_thrash@no-spare-fences.html">PASS</a>=
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend-execbuf:</p>
<ul>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9430/shard-iclb8/igt@i915_pm_rpm@system-suspend-execbuf.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/579">i915#57=
9</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5245=
/shard-iclb3/igt@i915_pm_rpm@system-suspend-execbuf.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9430/shard-kbl1/igt@i915_pm_rpm@system-suspend-execbuf.html">SKIP</a=
> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#10=
9271</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
245/shard-kbl4/igt@i915_pm_rpm@system-suspend-execbuf.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9430/shard-apl1/igt@i915_pm_rpm@system-suspend-execbuf.html">SKIP</a=
> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#10=
9271</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
245/shard-apl3/igt@i915_pm_rpm@system-suspend-execbuf.html">PASS</a></p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9430/shard-tglb5/igt@i915_pm_rpm@system-suspend-execbuf.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/579">i915#57=
9</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5245=
/shard-tglb6/igt@i915_pm_rpm@system-suspend-execbuf.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9430/shard-glk1/igt@i915_pm_rpm@system-suspend-execbuf.html">SKIP</a=
> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#10=
9271</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
245/shard-glk8/igt@i915_pm_rpm@system-suspend-execbuf.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@edp-1=
-pipe-d:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9430/shard-tglb6/igt@kms_atomic_transition@plane-all-transition-non=
blocking-fencing@edp-1-pipe-d.html">INCOMPLETE</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5245/shard-tglb7/igt@kms_atomic_tra=
nsition@plane-all-transition-nonblocking-fencing@edp-1-pipe-d.html">PASS</a=
></li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-c-tiling-y:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9430/shard-kbl2/igt@kms_plane_lowres@pipe-c-tiling-y.html">DMESG-WA=
RN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/165">i91=
5#165</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180"=
>i915#180</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
78">i915#78</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_5245/shard-kbl4/igt@kms_plane_lowres@pipe-c-tiling-y.html">PASS</a></=
li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_render:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9430/shard-iclb8/igt@kms_psr@psr2_primary_render.html">SKIP</a> (<a=
 href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5245/s=
hard-iclb2/igt@kms_psr@psr2_primary_render.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9430/shard-hsw2/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9271">fdo#109271</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_5245/shard-hsw7/igt@kms_vblank@pipe-c-ts-continuation-modeset-rp=
m.html">PASS</a> +2 similar issues</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9430/shard-hsw2/igt@core_hotunplug@unbind-rebind.html">WARN</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2283">i915#2283</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5245/sha=
rd-hsw7/igt@core_hotunplug@unbind-rebind.html">INCOMPLETE</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/intel/issues/2283">i915#2283</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wide-active@rcs0:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9430/shard-hsw7/igt@gem_exec_reloc@basic-wide-active@rcs0.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2389">i91=
5#2389</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5245/shard-hsw7/igt@gem_exec_reloc@basic-wide-active@rcs0.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1888">i915#1888<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2389">i915=
#2389</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9430/shard-iclb6/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1804">i915#180=
4</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2684">i9=
15#2684</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_5245/shard-iclb1/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/2681">i915#2681</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2684">i915#268=
4</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9430/shard-iclb3/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1804">i915#1804=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2684">i91=
5#2684</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5245/shard-iclb3/igt@i915_pm_rc6_residency@rc6-idle.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/2680">i915#2680</a>)</=
li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9430/shard-kbl7/igt@runner@aborted.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/2722">i915#2722</a>) -&gt; =
(<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5245/shard-kbl4/=
igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_5245/shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5245/shard-kbl4/igt@run=
ner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/2283">i915#2283</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/2722">i915#2722</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/483">i915#483</a>)</p>
</li>
<li>
<p>shard-iclb:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9430/shard-iclb8/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9430/shard-iclb5/igt@runner@abo=
rted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/2722">i915#2722</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/483">i915#483</a>) -&gt; (<a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_5245/shard-iclb2/igt@runner@aborted.html">FAIL</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5245/shard-ic=
lb5/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/2283">i915#2283</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/2722">i915#2722</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/483">i915#483</a>)</p>
</li>
<li>
<p>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9430/shard-apl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9430/shard-apl1/igt@runner@abort=
ed.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/2722">i915#2722</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_5245/shard-apl8/igt@runner@aborted.html">FAIL</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5245/shard-apl7/igt@=
runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/2283">i915#2283</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/2722">i915#2722</a>)</p>
</li>
<li>
<p>shard-glk:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9430/shard-glk1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9430/shard-glk1/igt@runner@abort=
ed.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/2722">i915#2722</a> / <a href=3D"https://bugzilla.kernel.org/show=
_bug.cgi?id=3D202321">k.org#202321</a>) -&gt; (<a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_5245/shard-glk6/igt@runner@aborted.html">FAIL=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5245/shard-=
glk3/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/2283">i915#2283</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/2722">i915#2722</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/intel/issues/483">i915#483</a> / <a href=3D"h=
ttps://bugzilla.kernel.org/show_bug.cgi?id=3D202321">k.org#202321</a>)</p>
</li>
</ul>
</li>
</ul>
<h2>Participating hosts (10 -&gt; 8)</h2>
<p>Missing    (2): pig-skl-6260u pig-glk-j5005 </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5878 -&gt; IGTPW_5245</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9430: 88c5c7135da4f61235fe3dbf4a67b2121b893fca @ git://anongit.fre=
edesktop.org/gfx-ci/linux<br />
  IGTPW_5245: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5245/index.htm=
l<br />
  IGT_5878: e96c0d8e6952d892bcbbcdf004999880a4dfb42e @ git://anongit.freede=
sktop.org/xorg/app/intel-gpu-tools<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============6617984833456414080==--

--===============0810567887==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0810567887==--
