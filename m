Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 21 Jan 2021 03:07:57 -0000
Message-ID: <161119847701.14014.2737730220816677384@emeril.freedesktop.org>
References: <20210121022003.21536-1-ashutosh.dixit@intel.com>
In-Reply-To: <20210121022003.21536-1-ashutosh.dixit@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgbGliL2lv?=
 =?utf-8?q?ctl=5Fwrappers=3A_Handle_PREAD/PWRITE_ioctls_not_supported_in_g?=
 =?utf-8?q?em=5Fread/write_=28rev14=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1305573479=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1305573479==
Content-Type: multipart/alternative;
 boundary="===============6622061163123074848=="

--===============6622061163123074848==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/ioctl_wrappers: Handle PREAD/PWRITE ioctls not supported in gem_read/write (rev14)
URL   : https://patchwork.freedesktop.org/series/81152/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5961 -> IGTPW_5410
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5410 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5410, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5410/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5410:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_parallel@engines@userptr:
    - fi-kbl-r:           [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5961/fi-kbl-r/igt@gem_exec_parallel@engines@userptr.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5410/fi-kbl-r/igt@gem_exec_parallel@engines@userptr.html
    - fi-cfl-8109u:       [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5961/fi-cfl-8109u/igt@gem_exec_parallel@engines@userptr.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5410/fi-cfl-8109u/igt@gem_exec_parallel@engines@userptr.html
    - fi-bsw-nick:        [PASS][5] -> [FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5961/fi-bsw-nick/igt@gem_exec_parallel@engines@userptr.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5410/fi-bsw-nick/igt@gem_exec_parallel@engines@userptr.html
    - fi-bxt-dsi:         [PASS][7] -> [FAIL][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5961/fi-bxt-dsi/igt@gem_exec_parallel@engines@userptr.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5410/fi-bxt-dsi/igt@gem_exec_parallel@engines@userptr.html
    - fi-apl-guc:         [PASS][9] -> [FAIL][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5961/fi-apl-guc/igt@gem_exec_parallel@engines@userptr.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5410/fi-apl-guc/igt@gem_exec_parallel@engines@userptr.html
    - fi-icl-y:           [PASS][11] -> [FAIL][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5961/fi-icl-y/igt@gem_exec_parallel@engines@userptr.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5410/fi-icl-y/igt@gem_exec_parallel@engines@userptr.html
    - fi-snb-2520m:       [PASS][13] -> [FAIL][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5961/fi-snb-2520m/igt@gem_exec_parallel@engines@userptr.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5410/fi-snb-2520m/igt@gem_exec_parallel@engines@userptr.html
    - fi-cml-u2:          [PASS][15] -> [FAIL][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5961/fi-cml-u2/igt@gem_exec_parallel@engines@userptr.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5410/fi-cml-u2/igt@gem_exec_parallel@engines@userptr.html
    - fi-pnv-d510:        [PASS][17] -> [FAIL][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5961/fi-pnv-d510/igt@gem_exec_parallel@engines@userptr.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5410/fi-pnv-d510/igt@gem_exec_parallel@engines@userptr.html
    - fi-cfl-8700k:       [PASS][19] -> [FAIL][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5961/fi-cfl-8700k/igt@gem_exec_parallel@engines@userptr.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5410/fi-cfl-8700k/igt@gem_exec_parallel@engines@userptr.html
    - fi-icl-u2:          [PASS][21] -> [FAIL][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5961/fi-icl-u2/igt@gem_exec_parallel@engines@userptr.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5410/fi-icl-u2/igt@gem_exec_parallel@engines@userptr.html
    - fi-tgl-u2:          [PASS][23] -> [FAIL][24]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5961/fi-tgl-u2/igt@gem_exec_parallel@engines@userptr.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5410/fi-tgl-u2/igt@gem_exec_parallel@engines@userptr.html
    - fi-skl-6600u:       [PASS][25] -> [FAIL][26]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5961/fi-skl-6600u/igt@gem_exec_parallel@engines@userptr.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5410/fi-skl-6600u/igt@gem_exec_parallel@engines@userptr.html
    - fi-byt-j1900:       [PASS][27] -> [FAIL][28]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5961/fi-byt-j1900/igt@gem_exec_parallel@engines@userptr.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5410/fi-byt-j1900/igt@gem_exec_parallel@engines@userptr.html
    - fi-hsw-4770:        [PASS][29] -> [FAIL][30]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5961/fi-hsw-4770/igt@gem_exec_parallel@engines@userptr.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5410/fi-hsw-4770/igt@gem_exec_parallel@engines@userptr.html
    - fi-cml-s:           [PASS][31] -> [FAIL][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5961/fi-cml-s/igt@gem_exec_parallel@engines@userptr.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5410/fi-cml-s/igt@gem_exec_parallel@engines@userptr.html
    - fi-ilk-650:         [PASS][33] -> [FAIL][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5961/fi-ilk-650/igt@gem_exec_parallel@engines@userptr.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5410/fi-ilk-650/igt@gem_exec_parallel@engines@userptr.html
    - fi-elk-e7500:       [PASS][35] -> [FAIL][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5961/fi-elk-e7500/igt@gem_exec_parallel@engines@userptr.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5410/fi-elk-e7500/igt@gem_exec_parallel@engines@userptr.html
    - fi-cfl-guc:         [PASS][37] -> [FAIL][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5961/fi-cfl-guc/igt@gem_exec_parallel@engines@userptr.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5410/fi-cfl-guc/igt@gem_exec_parallel@engines@userptr.html
    - fi-kbl-soraka:      [PASS][39] -> [FAIL][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5961/fi-kbl-soraka/igt@gem_exec_parallel@engines@userptr.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5410/fi-kbl-soraka/igt@gem_exec_parallel@engines@userptr.html
    - fi-ivb-3770:        [PASS][41] -> [FAIL][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5961/fi-ivb-3770/igt@gem_exec_parallel@engines@userptr.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5410/fi-ivb-3770/igt@gem_exec_parallel@engines@userptr.html
    - fi-glk-dsi:         [PASS][43] -> [FAIL][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5961/fi-glk-dsi/igt@gem_exec_parallel@engines@userptr.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5410/fi-glk-dsi/igt@gem_exec_parallel@engines@userptr.html
    - fi-kbl-x1275:       [PASS][45] -> [FAIL][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5961/fi-kbl-x1275/igt@gem_exec_parallel@engines@userptr.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5410/fi-kbl-x1275/igt@gem_exec_parallel@engines@userptr.html
    - fi-snb-2600:        [PASS][47] -> [FAIL][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5961/fi-snb-2600/igt@gem_exec_parallel@engines@userptr.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5410/fi-snb-2600/igt@gem_exec_parallel@engines@userptr.html
    - fi-tgl-y:           [PASS][49] -> [FAIL][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5961/fi-tgl-y/igt@gem_exec_parallel@engines@userptr.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5410/fi-tgl-y/igt@gem_exec_parallel@engines@userptr.html
    - fi-kbl-7500u:       [PASS][51] -> [FAIL][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5961/fi-kbl-7500u/igt@gem_exec_parallel@engines@userptr.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5410/fi-kbl-7500u/igt@gem_exec_parallel@engines@userptr.html
    - fi-kbl-guc:         [PASS][53] -> [FAIL][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5961/fi-kbl-guc/igt@gem_exec_parallel@engines@userptr.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5410/fi-kbl-guc/igt@gem_exec_parallel@engines@userptr.html
    - fi-bsw-kefka:       [PASS][55] -> [FAIL][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5961/fi-bsw-kefka/igt@gem_exec_parallel@engines@userptr.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5410/fi-bsw-kefka/igt@gem_exec_parallel@engines@userptr.html
    - fi-bdw-gvtdvm:      [PASS][57] -> [FAIL][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5961/fi-bdw-gvtdvm/igt@gem_exec_parallel@engines@userptr.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5410/fi-bdw-gvtdvm/igt@gem_exec_parallel@engines@userptr.html
    - fi-skl-guc:         [PASS][59] -> [FAIL][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5961/fi-skl-guc/igt@gem_exec_parallel@engines@userptr.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5410/fi-skl-guc/igt@gem_exec_parallel@engines@userptr.html

  * igt@i915_selftest@live@hangcheck:
    - fi-byt-j1900:       [PASS][61] -> [DMESG-WARN][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5961/fi-byt-j1900/igt@i915_selftest@live@hangcheck.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5410/fi-byt-j1900/igt@i915_selftest@live@hangcheck.html

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-icl-u2:          [PASS][63] -> [DMESG-WARN][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5961/fi-icl-u2/igt@kms_chamelium@common-hpd-after-suspend.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5410/fi-icl-u2/igt@kms_chamelium@common-hpd-after-suspend.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@gem_exec_parallel@engines@userptr:
    - {fi-tgl-dsi}:       [PASS][65] -> [FAIL][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5961/fi-tgl-dsi/igt@gem_exec_parallel@engines@userptr.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5410/fi-tgl-dsi/igt@gem_exec_parallel@engines@userptr.html
    - {fi-ehl-1}:         [PASS][67] -> [FAIL][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5961/fi-ehl-1/igt@gem_exec_parallel@engines@userptr.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5410/fi-ehl-1/igt@gem_exec_parallel@engines@userptr.html

  
Known issues
------------

  Here are the changes found in IGTPW_5410 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@amdgpu/amd_cs_nop@sync-gfx0:
    - fi-bsw-n3050:       NOTRUN -> [SKIP][69] ([fdo#109271]) +17 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5410/fi-bsw-n3050/igt@amdgpu/amd_cs_nop@sync-gfx0.html

  * igt@i915_selftest@live@sanitycheck:
    - fi-kbl-7500u:       [PASS][70] -> [DMESG-WARN][71] ([i915#2605])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5961/fi-kbl-7500u/igt@i915_selftest@live@sanitycheck.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5410/fi-kbl-7500u/igt@i915_selftest@live@sanitycheck.html

  * igt@kms_chamelium@dp-crc-fast:
    - fi-kbl-7500u:       [PASS][72] -> [FAIL][73] ([i915#1161] / [i915#262])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5961/fi-kbl-7500u/igt@kms_chamelium@dp-crc-fast.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5410/fi-kbl-7500u/igt@kms_chamelium@dp-crc-fast.html

  * igt@prime_self_import@basic-with_one_bo_two_files:
    - fi-tgl-y:           [PASS][74] -> [DMESG-WARN][75] ([i915#402]) +1 similar issue
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5961/fi-tgl-y/igt@prime_self_import@basic-with_one_bo_two_files.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5410/fi-tgl-y/igt@prime_self_import@basic-with_one_bo_two_files.html

  
#### Possible fixes ####

  * igt@gem_exec_suspend@basic-s3:
    - fi-tgl-y:           [DMESG-WARN][76] ([i915#2411] / [i915#402]) -> [PASS][77]
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5961/fi-tgl-y/igt@gem_exec_suspend@basic-s3.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5410/fi-tgl-y/igt@gem_exec_suspend@basic-s3.html

  * igt@i915_selftest@live@execlists:
    - fi-bsw-n3050:       [INCOMPLETE][78] ([i915#2940]) -> [PASS][79]
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5961/fi-bsw-n3050/igt@i915_selftest@live@execlists.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5410/fi-bsw-n3050/igt@i915_selftest@live@execlists.html

  * igt@kms_chamelium@hdmi-edid-read:
    - fi-kbl-7500u:       [DMESG-FAIL][80] ([i915#165]) -> [PASS][81]
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5961/fi-kbl-7500u/igt@kms_chamelium@hdmi-edid-read.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5410/fi-kbl-7500u/igt@kms_chamelium@hdmi-edid-read.html

  * igt@prime_self_import@basic-with_two_bos:
    - fi-tgl-y:           [DMESG-WARN][82] ([i915#402]) -> [PASS][83]
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5961/fi-tgl-y/igt@prime_self_import@basic-with_two_bos.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5410/fi-tgl-y/igt@prime_self_import@basic-with_two_bos.html

  
#### Warnings ####

  * igt@runner@aborted:
    - fi-bdw-5557u:       [FAIL][84] ([i915#1602] / [i915#2029] / [i915#2369]) -> [FAIL][85] ([i915#2369] / [i915#2426])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5961/fi-bdw-5557u/igt@runner@aborted.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5410/fi-bdw-5557u/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#1161]: https://gitlab.freedesktop.org/drm/intel/issues/1161
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#165]: https://gitlab.freedesktop.org/drm/intel/issues/165
  [i915#2029]: https://gitlab.freedesktop.org/drm/intel/issues/2029
  [i915#2369]: https://gitlab.freedesktop.org/drm/intel/issues/2369
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#2426]: https://gitlab.freedesktop.org/drm/intel/issues/2426
  [i915#2605]: https://gitlab.freedesktop.org/drm/intel/issues/2605
  [i915#262]: https://gitlab.freedesktop.org/drm/intel/issues/262
  [i915#2940]: https://gitlab.freedesktop.org/drm/intel/issues/2940
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402


Participating hosts (43 -> 37)
------------------------------

  Missing    (6): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-ctg-p8600 fi-dg1-1 fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5961 -> IGTPW_5410

  CI-20190529: 20190529
  CI_DRM_9650: 3f989d1bb4cfd91e25549f9fd7a750412581dcc4 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5410: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5410/index.html
  IGT_5961: a74368c1d84783dee512f56ca34acae050fded0b @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5410/index.html

--===============6622061163123074848==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <title>Project List - Patchwork</title>
  <style id="css-table-select" type="text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>lib/ioctl_wrappers: Handle PREAD/PWRITE ioctls not supported in gem_read/write (rev14)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/81152/">https://patchwork.freedesktop.org/series/81152/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5410/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5410/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_5961 -&gt; IGTPW_5410</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5410 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5410, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5410/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5410:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_exec_parallel@engines@userptr:</p>
<ul>
<li>
<p>fi-kbl-r:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5961/fi-kbl-r/igt@gem_exec_parallel@engines@userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5410/fi-kbl-r/igt@gem_exec_parallel@engines@userptr.html">FAIL</a></p>
</li>
<li>
<p>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5961/fi-cfl-8109u/igt@gem_exec_parallel@engines@userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5410/fi-cfl-8109u/igt@gem_exec_parallel@engines@userptr.html">FAIL</a></p>
</li>
<li>
<p>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5961/fi-bsw-nick/igt@gem_exec_parallel@engines@userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5410/fi-bsw-nick/igt@gem_exec_parallel@engines@userptr.html">FAIL</a></p>
</li>
<li>
<p>fi-bxt-dsi:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5961/fi-bxt-dsi/igt@gem_exec_parallel@engines@userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5410/fi-bxt-dsi/igt@gem_exec_parallel@engines@userptr.html">FAIL</a></p>
</li>
<li>
<p>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5961/fi-apl-guc/igt@gem_exec_parallel@engines@userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5410/fi-apl-guc/igt@gem_exec_parallel@engines@userptr.html">FAIL</a></p>
</li>
<li>
<p>fi-icl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5961/fi-icl-y/igt@gem_exec_parallel@engines@userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5410/fi-icl-y/igt@gem_exec_parallel@engines@userptr.html">FAIL</a></p>
</li>
<li>
<p>fi-snb-2520m:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5961/fi-snb-2520m/igt@gem_exec_parallel@engines@userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5410/fi-snb-2520m/igt@gem_exec_parallel@engines@userptr.html">FAIL</a></p>
</li>
<li>
<p>fi-cml-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5961/fi-cml-u2/igt@gem_exec_parallel@engines@userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5410/fi-cml-u2/igt@gem_exec_parallel@engines@userptr.html">FAIL</a></p>
</li>
<li>
<p>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5961/fi-pnv-d510/igt@gem_exec_parallel@engines@userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5410/fi-pnv-d510/igt@gem_exec_parallel@engines@userptr.html">FAIL</a></p>
</li>
<li>
<p>fi-cfl-8700k:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5961/fi-cfl-8700k/igt@gem_exec_parallel@engines@userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5410/fi-cfl-8700k/igt@gem_exec_parallel@engines@userptr.html">FAIL</a></p>
</li>
<li>
<p>fi-icl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5961/fi-icl-u2/igt@gem_exec_parallel@engines@userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5410/fi-icl-u2/igt@gem_exec_parallel@engines@userptr.html">FAIL</a></p>
</li>
<li>
<p>fi-tgl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5961/fi-tgl-u2/igt@gem_exec_parallel@engines@userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5410/fi-tgl-u2/igt@gem_exec_parallel@engines@userptr.html">FAIL</a></p>
</li>
<li>
<p>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5961/fi-skl-6600u/igt@gem_exec_parallel@engines@userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5410/fi-skl-6600u/igt@gem_exec_parallel@engines@userptr.html">FAIL</a></p>
</li>
<li>
<p>fi-byt-j1900:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5961/fi-byt-j1900/igt@gem_exec_parallel@engines@userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5410/fi-byt-j1900/igt@gem_exec_parallel@engines@userptr.html">FAIL</a></p>
</li>
<li>
<p>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5961/fi-hsw-4770/igt@gem_exec_parallel@engines@userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5410/fi-hsw-4770/igt@gem_exec_parallel@engines@userptr.html">FAIL</a></p>
</li>
<li>
<p>fi-cml-s:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5961/fi-cml-s/igt@gem_exec_parallel@engines@userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5410/fi-cml-s/igt@gem_exec_parallel@engines@userptr.html">FAIL</a></p>
</li>
<li>
<p>fi-ilk-650:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5961/fi-ilk-650/igt@gem_exec_parallel@engines@userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5410/fi-ilk-650/igt@gem_exec_parallel@engines@userptr.html">FAIL</a></p>
</li>
<li>
<p>fi-elk-e7500:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5961/fi-elk-e7500/igt@gem_exec_parallel@engines@userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5410/fi-elk-e7500/igt@gem_exec_parallel@engines@userptr.html">FAIL</a></p>
</li>
<li>
<p>fi-cfl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5961/fi-cfl-guc/igt@gem_exec_parallel@engines@userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5410/fi-cfl-guc/igt@gem_exec_parallel@engines@userptr.html">FAIL</a></p>
</li>
<li>
<p>fi-kbl-soraka:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5961/fi-kbl-soraka/igt@gem_exec_parallel@engines@userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5410/fi-kbl-soraka/igt@gem_exec_parallel@engines@userptr.html">FAIL</a></p>
</li>
<li>
<p>fi-ivb-3770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5961/fi-ivb-3770/igt@gem_exec_parallel@engines@userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5410/fi-ivb-3770/igt@gem_exec_parallel@engines@userptr.html">FAIL</a></p>
</li>
<li>
<p>fi-glk-dsi:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5961/fi-glk-dsi/igt@gem_exec_parallel@engines@userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5410/fi-glk-dsi/igt@gem_exec_parallel@engines@userptr.html">FAIL</a></p>
</li>
<li>
<p>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5961/fi-kbl-x1275/igt@gem_exec_parallel@engines@userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5410/fi-kbl-x1275/igt@gem_exec_parallel@engines@userptr.html">FAIL</a></p>
</li>
<li>
<p>fi-snb-2600:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5961/fi-snb-2600/igt@gem_exec_parallel@engines@userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5410/fi-snb-2600/igt@gem_exec_parallel@engines@userptr.html">FAIL</a></p>
</li>
<li>
<p>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5961/fi-tgl-y/igt@gem_exec_parallel@engines@userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5410/fi-tgl-y/igt@gem_exec_parallel@engines@userptr.html">FAIL</a></p>
</li>
<li>
<p>fi-kbl-7500u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5961/fi-kbl-7500u/igt@gem_exec_parallel@engines@userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5410/fi-kbl-7500u/igt@gem_exec_parallel@engines@userptr.html">FAIL</a></p>
</li>
<li>
<p>fi-kbl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5961/fi-kbl-guc/igt@gem_exec_parallel@engines@userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5410/fi-kbl-guc/igt@gem_exec_parallel@engines@userptr.html">FAIL</a></p>
</li>
<li>
<p>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5961/fi-bsw-kefka/igt@gem_exec_parallel@engines@userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5410/fi-bsw-kefka/igt@gem_exec_parallel@engines@userptr.html">FAIL</a></p>
</li>
<li>
<p>fi-bdw-gvtdvm:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5961/fi-bdw-gvtdvm/igt@gem_exec_parallel@engines@userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5410/fi-bdw-gvtdvm/igt@gem_exec_parallel@engines@userptr.html">FAIL</a></p>
</li>
<li>
<p>fi-skl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5961/fi-skl-guc/igt@gem_exec_parallel@engines@userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5410/fi-skl-guc/igt@gem_exec_parallel@engines@userptr.html">FAIL</a></p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>fi-byt-j1900:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5961/fi-byt-j1900/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5410/fi-byt-j1900/igt@i915_selftest@live@hangcheck.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@common-hpd-after-suspend:</p>
<ul>
<li>fi-icl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5961/fi-icl-u2/igt@kms_chamelium@common-hpd-after-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5410/fi-icl-u2/igt@kms_chamelium@common-hpd-after-suspend.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@gem_exec_parallel@engines@userptr:</p>
<ul>
<li>
<p>{fi-tgl-dsi}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5961/fi-tgl-dsi/igt@gem_exec_parallel@engines@userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5410/fi-tgl-dsi/igt@gem_exec_parallel@engines@userptr.html">FAIL</a></p>
</li>
<li>
<p>{fi-ehl-1}:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5961/fi-ehl-1/igt@gem_exec_parallel@engines@userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5410/fi-ehl-1/igt@gem_exec_parallel@engines@userptr.html">FAIL</a></p>
</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5410 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@amdgpu/amd_cs_nop@sync-gfx0:</p>
<ul>
<li>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5410/fi-bsw-n3050/igt@amdgpu/amd_cs_nop@sync-gfx0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@sanitycheck:</p>
<ul>
<li>fi-kbl-7500u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5961/fi-kbl-7500u/igt@i915_selftest@live@sanitycheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5410/fi-kbl-7500u/igt@i915_selftest@live@sanitycheck.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2605">i915#2605</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-crc-fast:</p>
<ul>
<li>fi-kbl-7500u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5961/fi-kbl-7500u/igt@kms_chamelium@dp-crc-fast.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5410/fi-kbl-7500u/igt@kms_chamelium@dp-crc-fast.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1161">i915#1161</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/262">i915#262</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_self_import@basic-with_one_bo_two_files:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5961/fi-tgl-y/igt@prime_self_import@basic-with_one_bo_two_files.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5410/fi-tgl-y/igt@prime_self_import@basic-with_one_bo_two_files.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5961/fi-tgl-y/igt@gem_exec_suspend@basic-s3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5410/fi-tgl-y/igt@gem_exec_suspend@basic-s3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5961/fi-bsw-n3050/igt@i915_selftest@live@execlists.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2940">i915#2940</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5410/fi-bsw-n3050/igt@i915_selftest@live@execlists.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-edid-read:</p>
<ul>
<li>fi-kbl-7500u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5961/fi-kbl-7500u/igt@kms_chamelium@hdmi-edid-read.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/165">i915#165</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5410/fi-kbl-7500u/igt@kms_chamelium@hdmi-edid-read.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@prime_self_import@basic-with_two_bos:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5961/fi-tgl-y/igt@prime_self_import@basic-with_two_bos.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5410/fi-tgl-y/igt@prime_self_import@basic-with_two_bos.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@runner@aborted:<ul>
<li>fi-bdw-5557u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5961/fi-bdw-5557u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2029">i915#2029</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2369">i915#2369</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5410/fi-bdw-5557u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2369">i915#2369</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (43 -&gt; 37)</h2>
<p>Missing    (6): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-ctg-p8600 fi-dg1-1 fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5961 -&gt; IGTPW_5410</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9650: 3f989d1bb4cfd91e25549f9fd7a750412581dcc4 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5410: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5410/index.html<br />
  IGT_5961: a74368c1d84783dee512f56ca34acae050fded0b @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>

</body>
</html>

--===============6622061163123074848==--

--===============1305573479==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1305573479==--
