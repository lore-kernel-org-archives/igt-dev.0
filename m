Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 08 Jul 2020 13:08:25 -0000
Message-ID: <159421370543.3840.16033482686690392480@emeril.freedesktop.org>
References: <20200708115933.5662-1-adam.miszczak@intel.com>
In-Reply-To: <20200708115933.5662-1-adam.miszczak@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fpartial=5Fpwrite=5Fpread=3A_Remove_libdrm_dependency?=
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
To: "Miszczak, Adam" <adam.miszczak@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: i915/gem_partial_pwrite_pread: Remove libdrm dependency
URL   : https://patchwork.freedesktop.org/series/79244/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8715 -> IGTPW_4747
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4747/index.html

Known issues
------------

  Here are the changes found in IGTPW_4747 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_suspend@basic-s3:
    - fi-tgl-u2:          [PASS][1] -> [FAIL][2] ([i915#1888]) +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/fi-tgl-u2/igt@gem_exec_suspend@basic-s3.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4747/fi-tgl-u2/igt@gem_exec_suspend@basic-s3.html

  * igt@i915_module_load@reload:
    - fi-tgl-y:           [PASS][3] -> [DMESG-WARN][4] ([i915#1982])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/fi-tgl-y/igt@i915_module_load@reload.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4747/fi-tgl-y/igt@i915_module_load@reload.html

  * igt@kms_busy@basic@flip:
    - fi-kbl-x1275:       [PASS][5] -> [DMESG-WARN][6] ([i915#62] / [i915#92] / [i915#95])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/fi-kbl-x1275/igt@kms_busy@basic@flip.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4747/fi-kbl-x1275/igt@kms_busy@basic@flip.html

  * igt@vgem_basic@dmabuf-fence-before:
    - fi-tgl-y:           [PASS][7] -> [DMESG-WARN][8] ([i915#402]) +2 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/fi-tgl-y/igt@vgem_basic@dmabuf-fence-before.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4747/fi-tgl-y/igt@vgem_basic@dmabuf-fence-before.html

  
#### Possible fixes ####

  * igt@gem_exec_store@basic:
    - fi-tgl-y:           [DMESG-WARN][9] ([i915#402]) -> [PASS][10] +2 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/fi-tgl-y/igt@gem_exec_store@basic.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4747/fi-tgl-y/igt@gem_exec_store@basic.html

  * igt@i915_pm_rpm@module-reload:
    - fi-glk-dsi:         [DMESG-WARN][11] ([i915#1982]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/fi-glk-dsi/igt@i915_pm_rpm@module-reload.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4747/fi-glk-dsi/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live@gem_contexts:
    - fi-tgl-u2:          [INCOMPLETE][13] ([i915#1932] / [i915#2045]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/fi-tgl-u2/igt@i915_selftest@live@gem_contexts.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4747/fi-tgl-u2/igt@i915_selftest@live@gem_contexts.html

  * igt@kms_flip@basic-flip-vs-modeset@b-dsi1:
    - {fi-tgl-dsi}:       [DMESG-WARN][15] ([i915#1982]) -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/fi-tgl-dsi/igt@kms_flip@basic-flip-vs-modeset@b-dsi1.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4747/fi-tgl-dsi/igt@kms_flip@basic-flip-vs-modeset@b-dsi1.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1:
    - fi-icl-u2:          [DMESG-WARN][17] ([i915#1982]) -> [PASS][18] +2 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/fi-icl-u2/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4747/fi-icl-u2/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html

  
#### Warnings ####

  * igt@debugfs_test@read_all_entries:
    - fi-kbl-x1275:       [DMESG-WARN][19] ([i915#62] / [i915#92]) -> [DMESG-WARN][20] ([i915#62] / [i915#92] / [i915#95]) +5 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/fi-kbl-x1275/igt@debugfs_test@read_all_entries.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4747/fi-kbl-x1275/igt@debugfs_test@read_all_entries.html

  * igt@i915_module_load@reload:
    - fi-tgl-u2:          [DMESG-WARN][21] ([i915#1982]) -> [DMESG-WARN][22] ([i915#402])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/fi-tgl-u2/igt@i915_module_load@reload.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4747/fi-tgl-u2/igt@i915_module_load@reload.html

  * igt@kms_force_connector_basic@force-edid:
    - fi-kbl-x1275:       [DMESG-WARN][23] ([i915#62] / [i915#92] / [i915#95]) -> [DMESG-WARN][24] ([i915#62] / [i915#92]) +4 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/fi-kbl-x1275/igt@kms_force_connector_basic@force-edid.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4747/fi-kbl-x1275/igt@kms_force_connector_basic@force-edid.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#1932]: https://gitlab.freedesktop.org/drm/intel/issues/1932
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2045]: https://gitlab.freedesktop.org/drm/intel/issues/2045
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#62]: https://gitlab.freedesktop.org/drm/intel/issues/62
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (44 -> 37)
------------------------------

  Missing    (7): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5728 -> IGTPW_4747

  CI-20190529: 20190529
  CI_DRM_8715: 76c2d43437601608d75f61a9eb6cf3a7aae5e02b @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4747: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4747/index.html
  IGT_5728: 6988eebf78e9ce9746b8c2b7d21cb4174d6623a9 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4747/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
