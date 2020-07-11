Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sat, 11 Jul 2020 18:40:56 -0000
Message-ID: <159449285680.9233.15108268602528393695@emeril.freedesktop.org>
References: <20200711180457.1824-1-mohammed.khajapasha@intel.com>
In-Reply-To: <20200711180457.1824-1-mohammed.khajapasha@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgbGliL2ln?=
 =?utf-8?q?t=5Fkms=3A_Add_support_for_display_with_=28rev6=29?=
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

Series: lib/igt_kms: Add support for display with (rev6)
URL   : https://patchwork.freedesktop.org/series/78482/
State : success

== Summary ==

CI Bug Log - changes from IGT_5733 -> IGTPW_4756
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4756/index.html

Known issues
------------

  Here are the changes found in IGTPW_4756 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_module_load@reload:
    - fi-tgl-u2:          [PASS][1] -> [DMESG-WARN][2] ([i915#402])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/fi-tgl-u2/igt@i915_module_load@reload.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4756/fi-tgl-u2/igt@i915_module_load@reload.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@gt_timelines:
    - fi-tgl-u2:          [DMESG-FAIL][3] -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/fi-tgl-u2/igt@i915_selftest@live@gt_timelines.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4756/fi-tgl-u2/igt@i915_selftest@live@gt_timelines.html

  * igt@kms_chamelium@dp-crc-fast:
    - fi-icl-u2:          [FAIL][5] ([i915#262]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/fi-icl-u2/igt@kms_chamelium@dp-crc-fast.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4756/fi-icl-u2/igt@kms_chamelium@dp-crc-fast.html

  
#### Warnings ####

  * igt@debugfs_test@read_all_entries:
    - fi-kbl-x1275:       [DMESG-WARN][7] ([i915#62] / [i915#92] / [i915#95]) -> [DMESG-WARN][8] ([i915#62] / [i915#92]) +4 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/fi-kbl-x1275/igt@debugfs_test@read_all_entries.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4756/fi-kbl-x1275/igt@debugfs_test@read_all_entries.html

  * igt@kms_force_connector_basic@force-edid:
    - fi-kbl-x1275:       [DMESG-WARN][9] ([i915#62] / [i915#92]) -> [DMESG-WARN][10] ([i915#62] / [i915#92] / [i915#95]) +2 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5733/fi-kbl-x1275/igt@kms_force_connector_basic@force-edid.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4756/fi-kbl-x1275/igt@kms_force_connector_basic@force-edid.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#262]: https://gitlab.freedesktop.org/drm/intel/issues/262
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#62]: https://gitlab.freedesktop.org/drm/intel/issues/62
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (41 -> 34)
------------------------------

  Missing    (7): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5733 -> IGTPW_4756

  CI-20190529: 20190529
  CI_DRM_8732: 4c05e94181f1a8ea4c91a5bd90e81f3275b51332 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4756: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4756/index.html
  IGT_5733: b793b4b40e42300f165dd3fdd670c2a85bd657c6 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4756/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
