Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 03 Jun 2020 21:29:59 -0000
Message-ID: <159121979934.12266.5495202590690186398@emeril.freedesktop.org>
References: <20200603210506.17185-1-mohammed.khajapasha@intel.com>
In-Reply-To: <20200603210506.17185-1-mohammed.khajapasha@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdC9r?=
 =?utf-8?q?ms=3A_Add_support_for_display_with_non-contiguous_pipes_=28rev3?=
 =?utf-8?q?=29?=
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
To: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: test/kms: Add support for display with non-contiguous pipes (rev3)
URL   : https://patchwork.freedesktop.org/series/74431/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8579 -> IGTPW_4647
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4647/index.html

Known issues
------------

  Here are the changes found in IGTPW_4647 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_pm_rpm@basic-pci-d3-state:
    - fi-bsw-kefka:       [PASS][1] -> [DMESG-WARN][2] ([i915#1982])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/fi-bsw-kefka/igt@i915_pm_rpm@basic-pci-d3-state.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4647/fi-bsw-kefka/igt@i915_pm_rpm@basic-pci-d3-state.html

  * igt@i915_pm_rpm@module-reload:
    - fi-byt-j1900:       [PASS][3] -> [DMESG-WARN][4] ([i915#1982])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/fi-byt-j1900/igt@i915_pm_rpm@module-reload.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4647/fi-byt-j1900/igt@i915_pm_rpm@module-reload.html
    - fi-skl-lmem:        [PASS][5] -> [INCOMPLETE][6] ([i915#151])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/fi-skl-lmem/igt@i915_pm_rpm@module-reload.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4647/fi-skl-lmem/igt@i915_pm_rpm@module-reload.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - fi-icl-u2:          [PASS][7] -> [DMESG-WARN][8] ([i915#1982])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/fi-icl-u2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4647/fi-icl-u2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  
#### Possible fixes ####

  * igt@i915_module_load@reload:
    - fi-byt-n2820:       [DMESG-WARN][9] ([i915#1982]) -> [PASS][10] +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/fi-byt-n2820/igt@i915_module_load@reload.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4647/fi-byt-n2820/igt@i915_module_load@reload.html

  * igt@i915_pm_backlight@basic-brightness:
    - fi-whl-u:           [DMESG-WARN][11] ([i915#95]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/fi-whl-u/igt@i915_pm_backlight@basic-brightness.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4647/fi-whl-u/igt@i915_pm_backlight@basic-brightness.html

  * igt@i915_pm_rpm@basic-pci-d3-state:
    - {fi-tgl-dsi}:       [DMESG-WARN][13] ([i915#1982]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/fi-tgl-dsi/igt@i915_pm_rpm@basic-pci-d3-state.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4647/fi-tgl-dsi/igt@i915_pm_rpm@basic-pci-d3-state.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - fi-tgl-y:           [DMESG-WARN][15] ([i915#1982]) -> [PASS][16] +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/fi-tgl-y/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4647/fi-tgl-y/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - fi-bsw-kefka:       [DMESG-WARN][17] ([i915#1982]) -> [PASS][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4647/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * {igt@kms_flip@basic-flip-vs-wf_vblank@b-dvi-d1}:
    - fi-bwr-2160:        [FAIL][19] ([i915#1928]) -> [PASS][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/fi-bwr-2160/igt@kms_flip@basic-flip-vs-wf_vblank@b-dvi-d1.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4647/fi-bwr-2160/igt@kms_flip@basic-flip-vs-wf_vblank@b-dvi-d1.html

  * {igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1}:
    - fi-icl-u2:          [DMESG-WARN][21] ([i915#1982]) -> [PASS][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/fi-icl-u2/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4647/fi-icl-u2/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html

  
#### Warnings ####

  * igt@debugfs_test@read_all_entries:
    - fi-kbl-x1275:       [DMESG-WARN][23] ([i915#62] / [i915#92]) -> [DMESG-WARN][24] ([i915#62] / [i915#92] / [i915#95]) +4 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/fi-kbl-x1275/igt@debugfs_test@read_all_entries.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4647/fi-kbl-x1275/igt@debugfs_test@read_all_entries.html

  * igt@gem_exec_suspend@basic-s0:
    - fi-kbl-x1275:       [DMESG-WARN][25] ([i915#62] / [i915#92] / [i915#95]) -> [DMESG-WARN][26] ([i915#1982] / [i915#62] / [i915#92] / [i915#95])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/fi-kbl-x1275/igt@gem_exec_suspend@basic-s0.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4647/fi-kbl-x1275/igt@gem_exec_suspend@basic-s0.html

  * igt@prime_vgem@basic-fence-flip:
    - fi-kbl-x1275:       [DMESG-WARN][27] ([i915#62] / [i915#92] / [i915#95]) -> [DMESG-WARN][28] ([i915#62] / [i915#92]) +2 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/fi-kbl-x1275/igt@prime_vgem@basic-fence-flip.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4647/fi-kbl-x1275/igt@prime_vgem@basic-fence-flip.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#151]: https://gitlab.freedesktop.org/drm/intel/issues/151
  [i915#1928]: https://gitlab.freedesktop.org/drm/intel/issues/1928
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#62]: https://gitlab.freedesktop.org/drm/intel/issues/62
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (51 -> 44)
------------------------------

  Missing    (7): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-kbl-7560u fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5694 -> IGTPW_4647

  CI-20190529: 20190529
  CI_DRM_8579: 289eb12c88c49a4ac8d325dc457d8878c7f5bdc0 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4647: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4647/index.html
  IGT_5694: a9b6c4c74bfddf7d3d2da3be08804fe315945cea @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@kms_plane_cursor@pipe-invalid-overlay-size-64
+igt@kms_plane_cursor@pipe-invalid-overlay-size-128
+igt@kms_plane_cursor@pipe-invalid-overlay-size-256
+igt@kms_plane_cursor@pipe-invalid-primary-size-64
+igt@kms_plane_cursor@pipe-invalid-primary-size-128
+igt@kms_plane_cursor@pipe-invalid-primary-size-256
+igt@kms_plane_cursor@pipe-invalid-viewport-size-64
+igt@kms_plane_cursor@pipe-invalid-viewport-size-128
+igt@kms_plane_cursor@pipe-invalid-viewport-size-256
-igt@kms_plane_cursor@pipe-a-overlay-size-64
-igt@kms_plane_cursor@pipe-a-overlay-size-128
-igt@kms_plane_cursor@pipe-a-overlay-size-256
-igt@kms_plane_cursor@pipe-a-primary-size-64
-igt@kms_plane_cursor@pipe-a-primary-size-128
-igt@kms_plane_cursor@pipe-a-primary-size-256
-igt@kms_plane_cursor@pipe-a-viewport-size-64
-igt@kms_plane_cursor@pipe-a-viewport-size-128
-igt@kms_plane_cursor@pipe-a-viewport-size-256
-igt@kms_plane_cursor@pipe-b-overlay-size-64
-igt@kms_plane_cursor@pipe-b-overlay-size-128
-igt@kms_plane_cursor@pipe-b-overlay-size-256
-igt@kms_plane_cursor@pipe-b-primary-size-64
-igt@kms_plane_cursor@pipe-b-primary-size-128
-igt@kms_plane_cursor@pipe-b-primary-size-256
-igt@kms_plane_cursor@pipe-b-viewport-size-64
-igt@kms_plane_cursor@pipe-b-viewport-size-128
-igt@kms_plane_cursor@pipe-b-viewport-size-256
-igt@kms_plane_cursor@pipe-c-overlay-size-64
-igt@kms_plane_cursor@pipe-c-overlay-size-128
-igt@kms_plane_cursor@pipe-c-overlay-size-256
-igt@kms_plane_cursor@pipe-c-primary-size-64
-igt@kms_plane_cursor@pipe-c-primary-size-128
-igt@kms_plane_cursor@pipe-c-primary-size-256
-igt@kms_plane_cursor@pipe-c-viewport-size-64
-igt@kms_plane_cursor@pipe-c-viewport-size-128
-igt@kms_plane_cursor@pipe-c-viewport-size-256
-igt@kms_plane_cursor@pipe-d-overlay-size-64
-igt@kms_plane_cursor@pipe-d-overlay-size-128
-igt@kms_plane_cursor@pipe-d-overlay-size-256
-igt@kms_plane_cursor@pipe-d-primary-size-64
-igt@kms_plane_cursor@pipe-d-primary-size-128
-igt@kms_plane_cursor@pipe-d-primary-size-256
-igt@kms_plane_cursor@pipe-d-viewport-size-64
-igt@kms_plane_cursor@pipe-d-viewport-size-128
-igt@kms_plane_cursor@pipe-d-viewport-size-256
-igt@kms_plane_cursor@pipe-e-overlay-size-64
-igt@kms_plane_cursor@pipe-e-overlay-size-128
-igt@kms_plane_cursor@pipe-e-overlay-size-256
-igt@kms_plane_cursor@pipe-e-primary-size-64
-igt@kms_plane_cursor@pipe-e-primary-size-128
-igt@kms_plane_cursor@pipe-e-primary-size-256
-igt@kms_plane_cursor@pipe-e-viewport-size-64
-igt@kms_plane_cursor@pipe-e-viewport-size-128
-igt@kms_plane_cursor@pipe-e-viewport-size-256
-igt@kms_plane_cursor@pipe-f-overlay-size-64
-igt@kms_plane_cursor@pipe-f-overlay-size-128
-igt@kms_plane_cursor@pipe-f-overlay-size-256
-igt@kms_plane_cursor@pipe-f-primary-size-64
-igt@kms_plane_cursor@pipe-f-primary-size-128
-igt@kms_plane_cursor@pipe-f-primary-size-256
-igt@kms_plane_cursor@pipe-f-viewport-size-64
-igt@kms_plane_cursor@pipe-f-viewport-size-128
-igt@kms_plane_cursor@pipe-f-viewport-size-256

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4647/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
