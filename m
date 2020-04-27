Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 27 Apr 2020 08:44:42 -0000
Message-ID: <158797708242.26355.8120982296337044717@emeril.freedesktop.org>
References: <20200427080601.19785-1-mika.kahola@intel.com>
In-Reply-To: <20200427080601.19785-1-mika.kahola@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fccs=3A_CCS_Clear_Color_test?=
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
To: Mika Kahola <mika.kahola@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/kms_ccs: CCS Clear Color test
URL   : https://patchwork.freedesktop.org/series/76536/
State : success

== Summary ==

CI Bug Log - changes from IGT_5612 -> IGTPW_4507
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4507/index.html

Known issues
------------

  Here are the changes found in IGTPW_4507 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@gt_pm:
    - fi-skl-6700k2:      [PASS][1] -> [DMESG-FAIL][2] ([i915#1791])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5612/fi-skl-6700k2/igt@i915_selftest@live@gt_pm.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4507/fi-skl-6700k2/igt@i915_selftest@live@gt_pm.html
    - fi-cfl-8109u:       [PASS][3] -> [DMESG-FAIL][4] ([i915#1791])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5612/fi-cfl-8109u/igt@i915_selftest@live@gt_pm.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4507/fi-cfl-8109u/igt@i915_selftest@live@gt_pm.html
    - fi-hsw-4770:        [PASS][5] -> [DMESG-FAIL][6] ([i915#1791])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5612/fi-hsw-4770/igt@i915_selftest@live@gt_pm.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4507/fi-hsw-4770/igt@i915_selftest@live@gt_pm.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@gt_pm:
    - fi-bdw-5557u:       [DMESG-FAIL][7] ([i915#1791]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5612/fi-bdw-5557u/igt@i915_selftest@live@gt_pm.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4507/fi-bdw-5557u/igt@i915_selftest@live@gt_pm.html

  
  [i915#1791]: https://gitlab.freedesktop.org/drm/intel/issues/1791


Participating hosts (45 -> 41)
------------------------------

  Additional (2): fi-icl-y fi-bxt-dsi 
  Missing    (6): fi-hsw-4200u fi-skl-guc fi-byt-squawks fi-bsw-cyan fi-kbl-7500u fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5612 -> IGTPW_4507

  CI-20190529: 20190529
  CI_DRM_8370: 1f3ffd7683d5457e14a1f879a8714a74b7b7faeb @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4507: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4507/index.html
  IGT_5612: c8dc1fd926a550308b971ca7d83fe0a927a38152 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@kms_ccs@pipe-a-clear-color
+igt@kms_ccs@pipe-b-clear-color
+igt@kms_ccs@pipe-c-clear-color
+igt@kms_ccs@pipe-d-clear-color
+igt@kms_ccs@pipe-e-clear-color
+igt@kms_ccs@pipe-f-clear-color

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4507/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
