Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 07 Jul 2020 16:07:32 -0000
Message-ID: <159413805258.7662.6101593132442131128@emeril.freedesktop.org>
References: <20200707145817.17415-1-marcin.bernatowicz@intel.com>
In-Reply-To: <20200707145817.17415-1-marcin.bernatowicz@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?device=5Freset=3A_Test_device_sysfs_reset_=28rev4=29?=
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
To: Marcin Bernatowicz <marcin.bernatowicz@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/device_reset: Test device sysfs reset (rev4)
URL   : https://patchwork.freedesktop.org/series/78849/
State : success

== Summary ==

CI Bug Log - changes from IGT_5727 -> IGTPW_4745
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4745/index.html

Known issues
------------

  Here are the changes found in IGTPW_4745 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@debugfs_test@read_all_entries:
    - fi-tgl-y:           [PASS][1] -> [DMESG-WARN][2] ([i915#1982]) +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5727/fi-tgl-y/igt@debugfs_test@read_all_entries.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4745/fi-tgl-y/igt@debugfs_test@read_all_entries.html

  * igt@gem_flink_basic@basic:
    - fi-tgl-y:           [PASS][3] -> [DMESG-WARN][4] ([i915#402]) +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5727/fi-tgl-y/igt@gem_flink_basic@basic.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4745/fi-tgl-y/igt@gem_flink_basic@basic.html

  * igt@i915_pm_backlight@basic-brightness:
    - fi-whl-u:           [PASS][5] -> [DMESG-WARN][6] ([i915#95])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5727/fi-whl-u/igt@i915_pm_backlight@basic-brightness.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4745/fi-whl-u/igt@i915_pm_backlight@basic-brightness.html

  * igt@kms_busy@basic@flip:
    - fi-kbl-x1275:       [PASS][7] -> [DMESG-WARN][8] ([i915#62] / [i915#92] / [i915#95])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5727/fi-kbl-x1275/igt@kms_busy@basic@flip.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4745/fi-kbl-x1275/igt@kms_busy@basic@flip.html

  
#### Possible fixes ####

  * igt@gem_exec_store@basic:
    - fi-tgl-y:           [DMESG-WARN][9] ([i915#402]) -> [PASS][10] +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5727/fi-tgl-y/igt@gem_exec_store@basic.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4745/fi-tgl-y/igt@gem_exec_store@basic.html

  * igt@gem_exec_suspend@basic-s3:
    - fi-tgl-u2:          [FAIL][11] ([i915#1888]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5727/fi-tgl-u2/igt@gem_exec_suspend@basic-s3.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4745/fi-tgl-u2/igt@gem_exec_suspend@basic-s3.html

  * igt@i915_pm_rpm@basic-pci-d3-state:
    - {fi-tgl-dsi}:       [DMESG-WARN][13] ([i915#1982]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5727/fi-tgl-dsi/igt@i915_pm_rpm@basic-pci-d3-state.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4745/fi-tgl-dsi/igt@i915_pm_rpm@basic-pci-d3-state.html

  * igt@i915_selftest@live@execlists:
    - fi-icl-u2:          [INCOMPLETE][15] ([i915#1580] / [i915#1684]) -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5727/fi-icl-u2/igt@i915_selftest@live@execlists.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4745/fi-icl-u2/igt@i915_selftest@live@execlists.html

  * igt@i915_selftest@live@gem_contexts:
    - fi-tgl-u2:          [INCOMPLETE][17] ([i915#1932] / [i915#2045]) -> [PASS][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5727/fi-tgl-u2/igt@i915_selftest@live@gem_contexts.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4745/fi-tgl-u2/igt@i915_selftest@live@gem_contexts.html

  
#### Warnings ####

  * igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:
    - fi-kbl-x1275:       [DMESG-WARN][19] ([i915#62] / [i915#92] / [i915#95]) -> [DMESG-WARN][20] ([i915#62] / [i915#92]) +4 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5727/fi-kbl-x1275/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4745/fi-kbl-x1275/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html

  * igt@kms_force_connector_basic@force-edid:
    - fi-kbl-x1275:       [DMESG-WARN][21] ([i915#62] / [i915#92]) -> [DMESG-WARN][22] ([i915#62] / [i915#92] / [i915#95]) +6 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5727/fi-kbl-x1275/igt@kms_force_connector_basic@force-edid.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4745/fi-kbl-x1275/igt@kms_force_connector_basic@force-edid.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#1580]: https://gitlab.freedesktop.org/drm/intel/issues/1580
  [i915#1684]: https://gitlab.freedesktop.org/drm/intel/issues/1684
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#1932]: https://gitlab.freedesktop.org/drm/intel/issues/1932
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2045]: https://gitlab.freedesktop.org/drm/intel/issues/2045
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#541]: https://gitlab.freedesktop.org/drm/intel/issues/541
  [i915#62]: https://gitlab.freedesktop.org/drm/intel/issues/62
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (42 -> 36)
------------------------------

  Missing    (6): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5727 -> IGTPW_4745

  CI-20190529: 20190529
  CI_DRM_8710: 274a7b2cbc164c0381a28cb30fd5d3ab93a36dee @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4745: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4745/index.html
  IGT_5727: 90254c14f4e68bec9d4a114ddf039075f3c1a30c @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@device_reset@reset-bound
+igt@device_reset@unbind-reset-rebind

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4745/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
