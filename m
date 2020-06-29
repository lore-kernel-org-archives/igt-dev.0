Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 29 Jun 2020 18:17:41 -0000
Message-ID: <159345466184.745.14604667064890940641@emeril.freedesktop.org>
References: <20200629125948.8734-1-priyanka.dandamudi@intel.com>
In-Reply-To: <20200629125948.8734-1-priyanka.dandamudi@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Freg=5Fread=3A_Added_description_for_test_case?=
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
To: priyanka.dandamudi@intel.com
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: i915/gem_reg_read: Added description for test case
URL   : https://patchwork.freedesktop.org/series/78901/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8673 -> IGTPW_4712
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4712/index.html

Known issues
------------

  Here are the changes found in IGTPW_4712 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_module_load@reload:
    - fi-tgl-y:           [PASS][1] -> [DMESG-WARN][2] ([i915#1982])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/fi-tgl-y/igt@i915_module_load@reload.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4712/fi-tgl-y/igt@i915_module_load@reload.html

  * igt@i915_pm_rpm@module-reload:
    - fi-glk-dsi:         [PASS][3] -> [DMESG-WARN][4] ([i915#1982])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/fi-glk-dsi/igt@i915_pm_rpm@module-reload.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4712/fi-glk-dsi/igt@i915_pm_rpm@module-reload.html

  * igt@kms_addfb_basic@framebuffer-vs-set-tiling:
    - fi-tgl-y:           [PASS][5] -> [DMESG-WARN][6] ([i915#402])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/fi-tgl-y/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4712/fi-tgl-y/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - fi-icl-u2:          [PASS][7] -> [DMESG-WARN][8] ([i915#1982])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/fi-icl-u2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4712/fi-icl-u2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  
#### Possible fixes ####

  * igt@gem_exec_suspend@basic-s3:
    - fi-tgl-u2:          [FAIL][9] ([i915#1888]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/fi-tgl-u2/igt@gem_exec_suspend@basic-s3.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4712/fi-tgl-u2/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_flink_basic@double-flink:
    - fi-tgl-y:           [DMESG-WARN][11] ([i915#402]) -> [PASS][12] +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/fi-tgl-y/igt@gem_flink_basic@double-flink.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4712/fi-tgl-y/igt@gem_flink_basic@double-flink.html

  * igt@i915_module_load@reload:
    - fi-tgl-u2:          [DMESG-WARN][13] ([i915#402]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/fi-tgl-u2/igt@i915_module_load@reload.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4712/fi-tgl-u2/igt@i915_module_load@reload.html

  * igt@i915_pm_rpm@basic-pci-d3-state:
    - fi-byt-n2820:       [DMESG-WARN][15] ([i915#1982]) -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/fi-byt-n2820/igt@i915_pm_rpm@basic-pci-d3-state.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4712/fi-byt-n2820/igt@i915_pm_rpm@basic-pci-d3-state.html
    - fi-bsw-kefka:       [DMESG-WARN][17] ([i915#1982]) -> [PASS][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/fi-bsw-kefka/igt@i915_pm_rpm@basic-pci-d3-state.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4712/fi-bsw-kefka/igt@i915_pm_rpm@basic-pci-d3-state.html

  * igt@i915_selftest@live@coherency:
    - fi-gdg-551:         [DMESG-FAIL][19] ([i915#1748]) -> [PASS][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/fi-gdg-551/igt@i915_selftest@live@coherency.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4712/fi-gdg-551/igt@i915_selftest@live@coherency.html

  * igt@i915_selftest@live@gt_pm:
    - fi-icl-y:           [DMESG-FAIL][21] -> [PASS][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/fi-icl-y/igt@i915_selftest@live@gt_pm.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4712/fi-icl-y/igt@i915_selftest@live@gt_pm.html

  * igt@kms_busy@basic@flip:
    - fi-kbl-x1275:       [DMESG-WARN][23] ([i915#62] / [i915#92] / [i915#95]) -> [PASS][24]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/fi-kbl-x1275/igt@kms_busy@basic@flip.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4712/fi-kbl-x1275/igt@kms_busy@basic@flip.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:
    - fi-icl-u2:          [DMESG-WARN][25] ([i915#1982]) -> [PASS][26]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/fi-icl-u2/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4712/fi-icl-u2/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html

  * igt@kms_psr@primary_page_flip:
    - fi-tgl-y:           [DMESG-WARN][27] ([i915#1982]) -> [PASS][28] +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/fi-tgl-y/igt@kms_psr@primary_page_flip.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4712/fi-tgl-y/igt@kms_psr@primary_page_flip.html

  
#### Warnings ####

  * igt@gem_exec_suspend@basic-s0:
    - fi-kbl-x1275:       [DMESG-WARN][29] ([i915#62] / [i915#92] / [i915#95]) -> [DMESG-WARN][30] ([i915#62] / [i915#92]) +4 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/fi-kbl-x1275/igt@gem_exec_suspend@basic-s0.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4712/fi-kbl-x1275/igt@gem_exec_suspend@basic-s0.html

  * igt@i915_pm_rpm@module-reload:
    - fi-kbl-x1275:       [SKIP][31] ([fdo#109271]) -> [DMESG-FAIL][32] ([i915#62] / [i915#95])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/fi-kbl-x1275/igt@i915_pm_rpm@module-reload.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4712/fi-kbl-x1275/igt@i915_pm_rpm@module-reload.html

  * igt@kms_force_connector_basic@force-edid:
    - fi-kbl-x1275:       [DMESG-WARN][33] ([i915#62] / [i915#92]) -> [DMESG-WARN][34] ([i915#62] / [i915#92] / [i915#95]) +2 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8673/fi-kbl-x1275/igt@kms_force_connector_basic@force-edid.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4712/fi-kbl-x1275/igt@kms_force_connector_basic@force-edid.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#1748]: https://gitlab.freedesktop.org/drm/intel/issues/1748
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#62]: https://gitlab.freedesktop.org/drm/intel/issues/62
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (45 -> 39)
------------------------------

  Missing    (6): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-byt-clapper 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5718 -> IGTPW_4712

  CI-20190529: 20190529
  CI_DRM_8673: ae0a2b45fe022c02a2779c2ae8c83473763c1feb @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4712: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4712/index.html
  IGT_5718: af1ef32bfae90bcdbaf1b5d84c61ff4e04368505 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4712/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
