Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============2148731274828166936=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Swati Sharma" <swati2.sharma@intel.com>
Date: Wed, 01 Mar 2023 12:39:25 -0000
Message-ID: <167767436501.6632.16806707783399796754@emeril.freedesktop.org>
References: <20230301114220.15941-1-swati2.sharma@intel.com>
In-Reply-To: <20230301114220.15941-1-swati2.sharma@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgVmFsaWRh?=
 =?utf-8?q?te_max_source_size_=28rev8=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--===============2148731274828166936==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Validate max source size (rev8)
URL   : https://patchwork.freedesktop.org/series/114059/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_12795 -> IGTPW_8544
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_8544 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_8544, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8544/index.html

Participating hosts (38 -> 38)
------------------------------

  Additional (1): bat-kbl-2 
  Missing    (1): fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_8544:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_pm_rpm@module-reload:
    - bat-adlm-1:         [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12795/bat-adlm-1/igt@i915_pm_rpm@module-reload.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8544/bat-adlm-1/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live@slpc:
    - bat-dg2-11:         [PASS][3] -> [DMESG-WARN][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12795/bat-dg2-11/igt@i915_selftest@live@slpc.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8544/bat-dg2-11/igt@i915_selftest@live@slpc.html

  * {igt@kms_plane_scaling@i915-max-source-size} (NEW):
    - bat-adlm-1:         NOTRUN -> [SKIP][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8544/bat-adlm-1/igt@kms_plane_scaling@i915-max-source-size.html
    - bat-rplp-1:         NOTRUN -> [SKIP][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8544/bat-rplp-1/igt@kms_plane_scaling@i915-max-source-size.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8544/fi-tgl-1115g4/igt@kms_plane_scaling@i915-max-source-size.html
    - bat-rpls-2:         NOTRUN -> [SKIP][8]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8544/bat-rpls-2/igt@kms_plane_scaling@i915-max-source-size.html
    - bat-jsl-1:          NOTRUN -> [SKIP][9]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8544/bat-jsl-1/igt@kms_plane_scaling@i915-max-source-size.html
    - bat-rpls-1:         NOTRUN -> [SKIP][10]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8544/bat-rpls-1/igt@kms_plane_scaling@i915-max-source-size.html
    - fi-rkl-11600:       NOTRUN -> [SKIP][11]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8544/fi-rkl-11600/igt@kms_plane_scaling@i915-max-source-size.html
    - bat-dg1-5:          NOTRUN -> [SKIP][12]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8544/bat-dg1-5/igt@kms_plane_scaling@i915-max-source-size.html
    - bat-dg1-7:          NOTRUN -> [SKIP][13]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8544/bat-dg1-7/igt@kms_plane_scaling@i915-max-source-size.html
    - bat-jsl-3:          NOTRUN -> [SKIP][14]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8544/bat-jsl-3/igt@kms_plane_scaling@i915-max-source-size.html
    - bat-adlp-9:         NOTRUN -> [SKIP][15]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8544/bat-adlp-9/igt@kms_plane_scaling@i915-max-source-size.html

  
New tests
---------

  New tests have been introduced between CI_DRM_12795 and IGTPW_8544:

### New IGT tests (2) ###

  * igt@kms_plane_scaling@i915-max-source-size:
    - Statuses : 31 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_scaling@i915-max-source-size@max-src-size:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_8544 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_gttfill@basic:
    - fi-pnv-d510:        [PASS][16] -> [FAIL][17] ([i915#7229])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12795/fi-pnv-d510/igt@gem_exec_gttfill@basic.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8544/fi-pnv-d510/igt@gem_exec_gttfill@basic.html

  * igt@gem_lmem_swapping@basic:
    - fi-apl-guc:         NOTRUN -> [SKIP][18] ([fdo#109271] / [i915#4613]) +3 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8544/fi-apl-guc/igt@gem_lmem_swapping@basic.html

  * igt@i915_selftest@live@execlists:
    - fi-bsw-nick:        [PASS][19] -> [ABORT][20] ([i915#7911] / [i915#7913])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12795/fi-bsw-nick/igt@i915_selftest@live@execlists.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8544/fi-bsw-nick/igt@i915_selftest@live@execlists.html

  * igt@i915_selftest@live@gt_heartbeat:
    - bat-jsl-1:          [PASS][21] -> [DMESG-FAIL][22] ([i915#5334])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12795/bat-jsl-1/igt@i915_selftest@live@gt_heartbeat.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8544/bat-jsl-1/igt@i915_selftest@live@gt_heartbeat.html

  * igt@i915_selftest@live@mman:
    - bat-rpls-1:         [PASS][23] -> [TIMEOUT][24] ([i915#6794])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12795/bat-rpls-1/igt@i915_selftest@live@mman.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8544/bat-rpls-1/igt@i915_selftest@live@mman.html

  * igt@i915_suspend@basic-s2idle-without-i915:
    - bat-adlm-1:         [PASS][25] -> [DMESG-WARN][26] ([i915#2867]) +8 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12795/bat-adlm-1/igt@i915_suspend@basic-s2idle-without-i915.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8544/bat-adlm-1/igt@i915_suspend@basic-s2idle-without-i915.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - fi-apl-guc:         NOTRUN -> [SKIP][27] ([fdo#109271]) +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8544/fi-apl-guc/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_pipe_crc_basic@read-crc:
    - bat-adlp-9:         NOTRUN -> [SKIP][28] ([i915#3546]) +1 similar issue
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8544/bat-adlp-9/igt@kms_pipe_crc_basic@read-crc.html

  * {igt@kms_plane_scaling@i915-max-source-size} (NEW):
    - fi-ivb-3770:        NOTRUN -> [SKIP][29] ([fdo#109271])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8544/fi-ivb-3770/igt@kms_plane_scaling@i915-max-source-size.html
    - fi-elk-e7500:       NOTRUN -> [SKIP][30] ([fdo#109271])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8544/fi-elk-e7500/igt@kms_plane_scaling@i915-max-source-size.html
    - fi-bsw-nick:        NOTRUN -> [SKIP][31] ([fdo#109271])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8544/fi-bsw-nick/igt@kms_plane_scaling@i915-max-source-size.html
    - fi-kbl-guc:         NOTRUN -> [SKIP][32] ([fdo#109271])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8544/fi-kbl-guc/igt@kms_plane_scaling@i915-max-source-size.html
    - fi-ilk-650:         NOTRUN -> [SKIP][33] ([fdo#109271])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8544/fi-ilk-650/igt@kms_plane_scaling@i915-max-source-size.html
    - fi-bsw-n3050:       NOTRUN -> [SKIP][34] ([fdo#109271])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8544/fi-bsw-n3050/igt@kms_plane_scaling@i915-max-source-size.html
    - fi-cfl-guc:         NOTRUN -> [SKIP][35] ([fdo#109271])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8544/fi-cfl-guc/igt@kms_plane_scaling@i915-max-source-size.html
    - fi-kbl-x1275:       NOTRUN -> [SKIP][36] ([fdo#109271])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8544/fi-kbl-x1275/igt@kms_plane_scaling@i915-max-source-size.html
    - fi-hsw-4770:        NOTRUN -> [SKIP][37] ([fdo#109271])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8544/fi-hsw-4770/igt@kms_plane_scaling@i915-max-source-size.html
    - fi-blb-e6850:       NOTRUN -> [SKIP][38] ([fdo#109271])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8544/fi-blb-e6850/igt@kms_plane_scaling@i915-max-source-size.html
    - {bat-kbl-2}:        NOTRUN -> [SKIP][39] ([fdo#109271])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8544/bat-kbl-2/igt@kms_plane_scaling@i915-max-source-size.html
    - fi-skl-6600u:       NOTRUN -> [SKIP][40] ([fdo#109271])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8544/fi-skl-6600u/igt@kms_plane_scaling@i915-max-source-size.html
    - fi-pnv-d510:        NOTRUN -> [SKIP][41] ([fdo#109271])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8544/fi-pnv-d510/igt@kms_plane_scaling@i915-max-source-size.html
    - bat-atsm-1:         NOTRUN -> [SKIP][42] ([i915#6078])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8544/bat-atsm-1/igt@kms_plane_scaling@i915-max-source-size.html
    - fi-glk-j4005:       NOTRUN -> [SKIP][43] ([fdo#109271])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8544/fi-glk-j4005/igt@kms_plane_scaling@i915-max-source-size.html
    - fi-skl-guc:         NOTRUN -> [SKIP][44] ([fdo#109271])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8544/fi-skl-guc/igt@kms_plane_scaling@i915-max-source-size.html
    - fi-cfl-8109u:       NOTRUN -> [SKIP][45] ([fdo#109271])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8544/fi-cfl-8109u/igt@kms_plane_scaling@i915-max-source-size.html
    - fi-kbl-7567u:       NOTRUN -> [SKIP][46] ([fdo#109271])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8544/fi-kbl-7567u/igt@kms_plane_scaling@i915-max-source-size.html
    - fi-cfl-8700k:       NOTRUN -> [SKIP][47] ([fdo#109271])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8544/fi-cfl-8700k/igt@kms_plane_scaling@i915-max-source-size.html

  
#### Possible fixes ####

  * igt@i915_module_load@reload:
    - fi-apl-guc:         [ABORT][48] -> [PASS][49]
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12795/fi-apl-guc/igt@i915_module_load@reload.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8544/fi-apl-guc/igt@i915_module_load@reload.html

  
#### Warnings ####

  * igt@i915_selftest@live@slpc:
    - bat-rpls-2:         [DMESG-FAIL][50] ([i915#6367] / [i915#6997] / [i915#7913]) -> [DMESG-FAIL][51] ([i915#6367] / [i915#7913])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12795/bat-rpls-2/igt@i915_selftest@live@slpc.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8544/bat-rpls-2/igt@i915_selftest@live@slpc.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#2867]: https://gitlab.freedesktop.org/drm/intel/issues/2867
  [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
  [i915#6078]: https://gitlab.freedesktop.org/drm/intel/issues/6078
  [i915#6367]: https://gitlab.freedesktop.org/drm/intel/issues/6367
  [i915#6794]: https://gitlab.freedesktop.org/drm/intel/issues/6794
  [i915#6997]: https://gitlab.freedesktop.org/drm/intel/issues/6997
  [i915#7229]: https://gitlab.freedesktop.org/drm/intel/issues/7229
  [i915#7911]: https://gitlab.freedesktop.org/drm/intel/issues/7911
  [i915#7913]: https://gitlab.freedesktop.org/drm/intel/issues/7913


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7177 -> IGTPW_8544

  CI-20190529: 20190529
  CI_DRM_12795: bd5c88295192d4f0345e44fa0261a88c06dc4840 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8544: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8544/index.html
  IGT_7177: 0cdc4a676cd9f9e495ad3ae441ed3322f1e14a88 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@kms_plane_scaling@i915-max-source-size
-igt@kms_plane@invalid-pixel-format-settings

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8544/index.html

--===============2148731274828166936==
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
<tr><td><b>Series:</b></td><td>Validate max source size (rev8)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/114059/">https://patchwork.freedesktop.org/series/114059/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8544/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8544/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12795 -&gt; IGTPW_8544</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_8544 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_8544, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8544/index.html</p>
<h2>Participating hosts (38 -&gt; 38)</h2>
<p>Additional (1): bat-kbl-2 <br />
  Missing    (1): fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_8544:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>bat-adlm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12795/bat-adlm-1/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8544/bat-adlm-1/igt@i915_pm_rpm@module-reload.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@slpc:</p>
<ul>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12795/bat-dg2-11/igt@i915_selftest@live@slpc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8544/bat-dg2-11/igt@i915_selftest@live@slpc.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>{igt@kms_plane_scaling@i915-max-source-size} (NEW):</p>
<ul>
<li>
<p>bat-adlm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8544/bat-adlm-1/igt@kms_plane_scaling@i915-max-source-size.html">SKIP</a></p>
</li>
<li>
<p>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8544/bat-rplp-1/igt@kms_plane_scaling@i915-max-source-size.html">SKIP</a></p>
</li>
<li>
<p>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8544/fi-tgl-1115g4/igt@kms_plane_scaling@i915-max-source-size.html">SKIP</a></p>
</li>
<li>
<p>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8544/bat-rpls-2/igt@kms_plane_scaling@i915-max-source-size.html">SKIP</a></p>
</li>
<li>
<p>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8544/bat-jsl-1/igt@kms_plane_scaling@i915-max-source-size.html">SKIP</a></p>
</li>
<li>
<p>bat-rpls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8544/bat-rpls-1/igt@kms_plane_scaling@i915-max-source-size.html">SKIP</a></p>
</li>
<li>
<p>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8544/fi-rkl-11600/igt@kms_plane_scaling@i915-max-source-size.html">SKIP</a></p>
</li>
<li>
<p>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8544/bat-dg1-5/igt@kms_plane_scaling@i915-max-source-size.html">SKIP</a></p>
</li>
<li>
<p>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8544/bat-dg1-7/igt@kms_plane_scaling@i915-max-source-size.html">SKIP</a></p>
</li>
<li>
<p>bat-jsl-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8544/bat-jsl-3/igt@kms_plane_scaling@i915-max-source-size.html">SKIP</a></p>
</li>
<li>
<p>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8544/bat-adlp-9/igt@kms_plane_scaling@i915-max-source-size.html">SKIP</a></p>
</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_12795 and IGTPW_8544:</p>
<h3>New IGT tests (2)</h3>
<ul>
<li>
<p>igt@kms_plane_scaling@i915-max-source-size:</p>
<ul>
<li>Statuses : 31 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@i915-max-source-size@max-src-size:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8544 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_gttfill@basic:</p>
<ul>
<li>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12795/fi-pnv-d510/igt@gem_exec_gttfill@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8544/fi-pnv-d510/igt@gem_exec_gttfill@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7229">i915#7229</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8544/fi-apl-guc/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12795/fi-bsw-nick/igt@i915_selftest@live@execlists.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8544/fi-bsw-nick/igt@i915_selftest@live@execlists.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7911">i915#7911</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>bat-jsl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12795/bat-jsl-1/igt@i915_selftest@live@gt_heartbeat.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8544/bat-jsl-1/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5334">i915#5334</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@mman:</p>
<ul>
<li>bat-rpls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12795/bat-rpls-1/igt@i915_selftest@live@mman.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8544/bat-rpls-1/igt@i915_selftest@live@mman.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6794">i915#6794</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s2idle-without-i915:</p>
<ul>
<li>bat-adlm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12795/bat-adlm-1/igt@i915_suspend@basic-s2idle-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8544/bat-adlm-1/igt@i915_suspend@basic-s2idle-without-i915.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2867">i915#2867</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8544/fi-apl-guc/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc:</p>
<ul>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8544/bat-adlp-9/igt@kms_pipe_crc_basic@read-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3546">i915#3546</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>{igt@kms_plane_scaling@i915-max-source-size} (NEW):</p>
<ul>
<li>
<p>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8544/fi-ivb-3770/igt@kms_plane_scaling@i915-max-source-size.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8544/fi-elk-e7500/igt@kms_plane_scaling@i915-max-source-size.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8544/fi-bsw-nick/igt@kms_plane_scaling@i915-max-source-size.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8544/fi-kbl-guc/igt@kms_plane_scaling@i915-max-source-size.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8544/fi-ilk-650/igt@kms_plane_scaling@i915-max-source-size.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8544/fi-bsw-n3050/igt@kms_plane_scaling@i915-max-source-size.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8544/fi-cfl-guc/igt@kms_plane_scaling@i915-max-source-size.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8544/fi-kbl-x1275/igt@kms_plane_scaling@i915-max-source-size.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8544/fi-hsw-4770/igt@kms_plane_scaling@i915-max-source-size.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8544/fi-blb-e6850/igt@kms_plane_scaling@i915-max-source-size.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>{bat-kbl-2}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8544/bat-kbl-2/igt@kms_plane_scaling@i915-max-source-size.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8544/fi-skl-6600u/igt@kms_plane_scaling@i915-max-source-size.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8544/fi-pnv-d510/igt@kms_plane_scaling@i915-max-source-size.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8544/bat-atsm-1/igt@kms_plane_scaling@i915-max-source-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6078">i915#6078</a>)</p>
</li>
<li>
<p>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8544/fi-glk-j4005/igt@kms_plane_scaling@i915-max-source-size.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-skl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8544/fi-skl-guc/igt@kms_plane_scaling@i915-max-source-size.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8544/fi-cfl-8109u/igt@kms_plane_scaling@i915-max-source-size.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8544/fi-kbl-7567u/igt@kms_plane_scaling@i915-max-source-size.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8544/fi-cfl-8700k/igt@kms_plane_scaling@i915-max-source-size.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_module_load@reload:<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12795/fi-apl-guc/igt@i915_module_load@reload.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8544/fi-apl-guc/igt@i915_module_load@reload.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@i915_selftest@live@slpc:<ul>
<li>bat-rpls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12795/bat-rpls-2/igt@i915_selftest@live@slpc.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6367">i915#6367</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6997">i915#6997</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8544/bat-rpls-2/igt@i915_selftest@live@slpc.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6367">i915#6367</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7177 -&gt; IGTPW_8544</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12795: bd5c88295192d4f0345e44fa0261a88c06dc4840 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8544: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8544/index.html<br />
  IGT_7177: 0cdc4a676cd9f9e495ad3ae441ed3322f1e14a88 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@kms_plane_scaling@i915-max-source-size<br />
-igt@kms_plane@invalid-pixel-format-settings</p>

</body>
</html>

--===============2148731274828166936==--
