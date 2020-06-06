Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sat, 06 Jun 2020 10:09:55 -0000
Message-ID: <159143819568.20631.192091632408132637@emeril.freedesktop.org>
References: <20200606090858.2137564-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200606090858.2137564-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fhuc=5Fcopy=3A_Enable_a_HuC_copy_test?=
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
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: i915/gem_huc_copy: Enable a HuC copy test
URL   : https://patchwork.freedesktop.org/series/78063/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8596 -> IGTPW_4654
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4654/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4654:

### IGT changes ###

#### Possible regressions ####

  * {igt@gem_huc_copy@huc_copy} (NEW):
    - fi-cml-u2:          NOTRUN -> [SKIP][1] +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4654/fi-cml-u2/igt@gem_huc_copy@huc_copy.html
    - {fi-tgl-u}:         NOTRUN -> [SKIP][2] +1 similar issue
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4654/fi-tgl-u/igt@gem_huc_copy@huc_copy.html
    - fi-icl-u2:          NOTRUN -> [SKIP][3] +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4654/fi-icl-u2/igt@gem_huc_copy@huc_copy.html

  * {igt@gem_huc_copy@huc_load} (NEW):
    - fi-cml-s:           NOTRUN -> [SKIP][4] +1 similar issue
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4654/fi-cml-s/igt@gem_huc_copy@huc_load.html
    - fi-icl-guc:         NOTRUN -> [SKIP][5] +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4654/fi-icl-guc/igt@gem_huc_copy@huc_load.html
    - {fi-ehl-1}:         NOTRUN -> [SKIP][6] +1 similar issue
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4654/fi-ehl-1/igt@gem_huc_copy@huc_load.html
    - fi-icl-y:           NOTRUN -> [SKIP][7] +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4654/fi-icl-y/igt@gem_huc_copy@huc_load.html
    - {fi-tgl-dsi}:       NOTRUN -> [SKIP][8] +1 similar issue
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4654/fi-tgl-dsi/igt@gem_huc_copy@huc_load.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8596 and IGTPW_4654:

### New IGT tests (2) ###

  * igt@gem_huc_copy@huc_copy:
    - Statuses : 40 skip(s)
    - Exec time: [0.0] s

  * igt@gem_huc_copy@huc_load:
    - Statuses : 40 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_4654 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@debugfs_test@read_all_entries:
    - fi-bsw-nick:        [PASS][9] -> [INCOMPLETE][10] ([i915#1250] / [i915#1436])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8596/fi-bsw-nick/igt@debugfs_test@read_all_entries.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4654/fi-bsw-nick/igt@debugfs_test@read_all_entries.html

  
#### Possible fixes ####

  * igt@i915_module_load@reload:
    - {fi-tgl-dsi}:       [DMESG-WARN][11] ([i915#1982]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8596/fi-tgl-dsi/igt@i915_module_load@reload.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4654/fi-tgl-dsi/igt@i915_module_load@reload.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:
    - fi-icl-guc:         [DMESG-WARN][13] ([i915#1982]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8596/fi-icl-guc/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4654/fi-icl-guc/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html

  * {igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1}:
    - fi-icl-u2:          [DMESG-WARN][15] ([i915#1982]) -> [PASS][16] +2 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8596/fi-icl-u2/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4654/fi-icl-u2/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html

  
#### Warnings ####

  * igt@i915_pm_rpm@module-reload:
    - fi-kbl-x1275:       [SKIP][17] ([fdo#109271]) -> [DMESG-FAIL][18] ([i915#62])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8596/fi-kbl-x1275/igt@i915_pm_rpm@module-reload.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4654/fi-kbl-x1275/igt@i915_pm_rpm@module-reload.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:
    - fi-kbl-x1275:       [DMESG-WARN][19] ([i915#62] / [i915#92]) -> [DMESG-WARN][20] ([i915#62] / [i915#92] / [i915#95]) +2 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8596/fi-kbl-x1275/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4654/fi-kbl-x1275/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-atomic:
    - fi-kbl-x1275:       [DMESG-WARN][21] ([i915#62] / [i915#92] / [i915#95]) -> [DMESG-WARN][22] ([i915#62] / [i915#92]) +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8596/fi-kbl-x1275/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4654/fi-kbl-x1275/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#1250]: https://gitlab.freedesktop.org/drm/intel/issues/1250
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#62]: https://gitlab.freedesktop.org/drm/intel/issues/62
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (49 -> 42)
------------------------------

  Missing    (7): fi-ilk-m540 fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-kbl-7560u fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5695 -> IGTPW_4654

  CI-20190529: 20190529
  CI_DRM_8596: ac91b8351ce380da73dbe8b87d1e4f95aa0c4409 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4654: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4654/index.html
  IGT_5695: 53e8c878a6fb5708e63c99403691e8960b86ea9c @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@gem_huc_copy@huc-copy
+igt@gem_huc_copy@huc-load

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4654/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
