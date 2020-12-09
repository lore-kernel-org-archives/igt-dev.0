Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 09 Dec 2020 17:15:40 -0000
Message-ID: <160753414002.4255.4614370695312277558@emeril.freedesktop.org>
References: <20201209160642.6317-1-anshuman.gupta@intel.com>
In-Reply-To: <20201209160642.6317-1-anshuman.gupta@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgUEMgc3Rh?=
 =?utf-8?q?te_igt_test?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1252958756=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Anshuman Gupta <anshuman.gupta@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1252958756==
Content-Type: multipart/alternative;
 boundary="===============4466360865736208530=="

--===============4466360865736208530==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: PC state igt test
URL   : https://patchwork.freedesktop.org/series/84737/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_9464 -> IGTPW_5264
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5264 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5264, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5264/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5264:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_pm_rpm@basic-rte:
    - fi-cfl-8109u:       [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9464/fi-cfl-8109u/igt@i915_pm_rpm@basic-rte.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5264/fi-cfl-8109u/igt@i915_pm_rpm@basic-rte.html

  * igt@i915_pm_rpm@module-reload:
    - fi-skl-6600u:       [PASS][3] -> [WARN][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9464/fi-skl-6600u/igt@i915_pm_rpm@module-reload.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5264/fi-skl-6600u/igt@i915_pm_rpm@module-reload.html
    - fi-cfl-8700k:       [PASS][5] -> [WARN][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9464/fi-cfl-8700k/igt@i915_pm_rpm@module-reload.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5264/fi-cfl-8700k/igt@i915_pm_rpm@module-reload.html
    - fi-bsw-kefka:       [PASS][7] -> [WARN][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9464/fi-bsw-kefka/igt@i915_pm_rpm@module-reload.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5264/fi-bsw-kefka/igt@i915_pm_rpm@module-reload.html
    - fi-kbl-x1275:       [PASS][9] -> [WARN][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9464/fi-kbl-x1275/igt@i915_pm_rpm@module-reload.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5264/fi-kbl-x1275/igt@i915_pm_rpm@module-reload.html
    - fi-tgl-u2:          [PASS][11] -> [WARN][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9464/fi-tgl-u2/igt@i915_pm_rpm@module-reload.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5264/fi-tgl-u2/igt@i915_pm_rpm@module-reload.html
    - fi-skl-guc:         [PASS][13] -> [WARN][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9464/fi-skl-guc/igt@i915_pm_rpm@module-reload.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5264/fi-skl-guc/igt@i915_pm_rpm@module-reload.html
    - fi-bsw-n3050:       [PASS][15] -> [WARN][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9464/fi-bsw-n3050/igt@i915_pm_rpm@module-reload.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5264/fi-bsw-n3050/igt@i915_pm_rpm@module-reload.html
    - fi-skl-6700k2:      [PASS][17] -> [WARN][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9464/fi-skl-6700k2/igt@i915_pm_rpm@module-reload.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5264/fi-skl-6700k2/igt@i915_pm_rpm@module-reload.html
    - fi-cfl-guc:         [PASS][19] -> [WARN][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9464/fi-cfl-guc/igt@i915_pm_rpm@module-reload.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5264/fi-cfl-guc/igt@i915_pm_rpm@module-reload.html
    - fi-icl-y:           [PASS][21] -> [WARN][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9464/fi-icl-y/igt@i915_pm_rpm@module-reload.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5264/fi-icl-y/igt@i915_pm_rpm@module-reload.html
    - fi-cml-s:           [PASS][23] -> [WARN][24]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9464/fi-cml-s/igt@i915_pm_rpm@module-reload.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5264/fi-cml-s/igt@i915_pm_rpm@module-reload.html
    - fi-bxt-dsi:         [PASS][25] -> [WARN][26]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9464/fi-bxt-dsi/igt@i915_pm_rpm@module-reload.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5264/fi-bxt-dsi/igt@i915_pm_rpm@module-reload.html
    - fi-cml-u2:          [PASS][27] -> [WARN][28]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9464/fi-cml-u2/igt@i915_pm_rpm@module-reload.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5264/fi-cml-u2/igt@i915_pm_rpm@module-reload.html
    - fi-kbl-7500u:       [PASS][29] -> [WARN][30]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9464/fi-kbl-7500u/igt@i915_pm_rpm@module-reload.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5264/fi-kbl-7500u/igt@i915_pm_rpm@module-reload.html
    - fi-hsw-4770:        [PASS][31] -> [WARN][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9464/fi-hsw-4770/igt@i915_pm_rpm@module-reload.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5264/fi-hsw-4770/igt@i915_pm_rpm@module-reload.html
    - fi-kbl-soraka:      [PASS][33] -> [WARN][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9464/fi-kbl-soraka/igt@i915_pm_rpm@module-reload.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5264/fi-kbl-soraka/igt@i915_pm_rpm@module-reload.html
    - fi-bdw-5557u:       [PASS][35] -> [WARN][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9464/fi-bdw-5557u/igt@i915_pm_rpm@module-reload.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5264/fi-bdw-5557u/igt@i915_pm_rpm@module-reload.html
    - fi-kbl-r:           [PASS][37] -> [WARN][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9464/fi-kbl-r/igt@i915_pm_rpm@module-reload.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5264/fi-kbl-r/igt@i915_pm_rpm@module-reload.html
    - fi-apl-guc:         [PASS][39] -> [WARN][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9464/fi-apl-guc/igt@i915_pm_rpm@module-reload.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5264/fi-apl-guc/igt@i915_pm_rpm@module-reload.html
    - fi-bsw-nick:        [PASS][41] -> [WARN][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9464/fi-bsw-nick/igt@i915_pm_rpm@module-reload.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5264/fi-bsw-nick/igt@i915_pm_rpm@module-reload.html
    - fi-glk-dsi:         [PASS][43] -> [WARN][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9464/fi-glk-dsi/igt@i915_pm_rpm@module-reload.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5264/fi-glk-dsi/igt@i915_pm_rpm@module-reload.html
    - fi-icl-u2:          [PASS][45] -> [WARN][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9464/fi-icl-u2/igt@i915_pm_rpm@module-reload.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5264/fi-icl-u2/igt@i915_pm_rpm@module-reload.html

  
#### Warnings ####

  * igt@i915_pm_rpm@module-reload:
    - fi-byt-j1900:       [INCOMPLETE][47] ([i915#142] / [i915#2405]) -> [WARN][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9464/fi-byt-j1900/igt@i915_pm_rpm@module-reload.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5264/fi-byt-j1900/igt@i915_pm_rpm@module-reload.html
    - fi-kbl-guc:         [FAIL][49] ([i915#579]) -> [WARN][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9464/fi-kbl-guc/igt@i915_pm_rpm@module-reload.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5264/fi-kbl-guc/igt@i915_pm_rpm@module-reload.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@i915_pm_rpm@module-reload:
    - {fi-ehl-1}:         [PASS][51] -> [WARN][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9464/fi-ehl-1/igt@i915_pm_rpm@module-reload.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5264/fi-ehl-1/igt@i915_pm_rpm@module-reload.html

  
Known issues
------------

  Here are the changes found in IGTPW_5264 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@amdgpu/amd_basic@userptr:
    - fi-byt-j1900:       NOTRUN -> [SKIP][53] ([fdo#109271]) +17 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5264/fi-byt-j1900/igt@amdgpu/amd_basic@userptr.html

  * igt@i915_pm_rpm@module-reload:
    - fi-tgl-y:           [PASS][54] -> [WARN][55] ([i915#2411])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9464/fi-tgl-y/igt@i915_pm_rpm@module-reload.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5264/fi-tgl-y/igt@i915_pm_rpm@module-reload.html

  * igt@vgem_basic@setversion:
    - fi-tgl-y:           [PASS][56] -> [DMESG-WARN][57] ([i915#402]) +2 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9464/fi-tgl-y/igt@vgem_basic@setversion.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5264/fi-tgl-y/igt@vgem_basic@setversion.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@gt_lrc:
    - fi-bsw-n3050:       [DMESG-FAIL][58] ([i915#2675]) -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9464/fi-bsw-n3050/igt@i915_selftest@live@gt_lrc.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5264/fi-bsw-n3050/igt@i915_selftest@live@gt_lrc.html

  * igt@i915_selftest@live@sanitycheck:
    - fi-kbl-7500u:       [DMESG-WARN][60] ([i915#2605]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9464/fi-kbl-7500u/igt@i915_selftest@live@sanitycheck.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5264/fi-kbl-7500u/igt@i915_selftest@live@sanitycheck.html

  * igt@vgem_basic@create:
    - fi-tgl-y:           [DMESG-WARN][62] ([i915#402]) -> [PASS][63] +2 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9464/fi-tgl-y/igt@vgem_basic@create.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5264/fi-tgl-y/igt@vgem_basic@create.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#142]: https://gitlab.freedesktop.org/drm/intel/issues/142
  [i915#2405]: https://gitlab.freedesktop.org/drm/intel/issues/2405
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#2605]: https://gitlab.freedesktop.org/drm/intel/issues/2605
  [i915#2675]: https://gitlab.freedesktop.org/drm/intel/issues/2675
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579


Participating hosts (43 -> 39)
------------------------------

  Missing    (4): fi-ilk-m540 fi-dg1-1 fi-bdw-samus fi-hsw-4200u 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5885 -> IGTPW_5264

  CI-20190529: 20190529
  CI_DRM_9464: a2561d7ce07920c1fc05013c87d21d3c8b05149f @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5264: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5264/index.html
  IGT_5885: d99f644b1868b9c92435b05ebfafa230721cd677 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@i915_pm_rpm@pc8-residency-display-off
+igt@i915_pm_rpm@pc8-residency-display-on
+igt@i915_pm_rpm@pc10-residency-display-off
+igt@i915_pm_rpm@pc10-residency-display-on
-igt@i915_pm_rpm@pc8-residency

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5264/index.html

--===============4466360865736208530==
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
<tr><td><b>Series:</b></td><td>PC state igt test</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/84737/">https://patchwork.freedesktop.org/series/84737/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5264/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5264/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9464 -&gt; IGTPW_5264</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5264 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5264, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5264/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5264:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@i915_pm_rpm@basic-rte:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9464/fi-cfl-8109u/igt@i915_pm_rpm@basic-rte.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5264/fi-cfl-8109u/igt@i915_pm_rpm@basic-rte.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>
<p>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9464/fi-skl-6600u/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5264/fi-skl-6600u/igt@i915_pm_rpm@module-reload.html">WARN</a></p>
</li>
<li>
<p>fi-cfl-8700k:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9464/fi-cfl-8700k/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5264/fi-cfl-8700k/igt@i915_pm_rpm@module-reload.html">WARN</a></p>
</li>
<li>
<p>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9464/fi-bsw-kefka/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5264/fi-bsw-kefka/igt@i915_pm_rpm@module-reload.html">WARN</a></p>
</li>
<li>
<p>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9464/fi-kbl-x1275/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5264/fi-kbl-x1275/igt@i915_pm_rpm@module-reload.html">WARN</a></p>
</li>
<li>
<p>fi-tgl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9464/fi-tgl-u2/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5264/fi-tgl-u2/igt@i915_pm_rpm@module-reload.html">WARN</a></p>
</li>
<li>
<p>fi-skl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9464/fi-skl-guc/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5264/fi-skl-guc/igt@i915_pm_rpm@module-reload.html">WARN</a></p>
</li>
<li>
<p>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9464/fi-bsw-n3050/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5264/fi-bsw-n3050/igt@i915_pm_rpm@module-reload.html">WARN</a></p>
</li>
<li>
<p>fi-skl-6700k2:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9464/fi-skl-6700k2/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5264/fi-skl-6700k2/igt@i915_pm_rpm@module-reload.html">WARN</a></p>
</li>
<li>
<p>fi-cfl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9464/fi-cfl-guc/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5264/fi-cfl-guc/igt@i915_pm_rpm@module-reload.html">WARN</a></p>
</li>
<li>
<p>fi-icl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9464/fi-icl-y/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5264/fi-icl-y/igt@i915_pm_rpm@module-reload.html">WARN</a></p>
</li>
<li>
<p>fi-cml-s:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9464/fi-cml-s/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5264/fi-cml-s/igt@i915_pm_rpm@module-reload.html">WARN</a></p>
</li>
<li>
<p>fi-bxt-dsi:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9464/fi-bxt-dsi/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5264/fi-bxt-dsi/igt@i915_pm_rpm@module-reload.html">WARN</a></p>
</li>
<li>
<p>fi-cml-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9464/fi-cml-u2/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5264/fi-cml-u2/igt@i915_pm_rpm@module-reload.html">WARN</a></p>
</li>
<li>
<p>fi-kbl-7500u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9464/fi-kbl-7500u/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5264/fi-kbl-7500u/igt@i915_pm_rpm@module-reload.html">WARN</a></p>
</li>
<li>
<p>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9464/fi-hsw-4770/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5264/fi-hsw-4770/igt@i915_pm_rpm@module-reload.html">WARN</a></p>
</li>
<li>
<p>fi-kbl-soraka:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9464/fi-kbl-soraka/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5264/fi-kbl-soraka/igt@i915_pm_rpm@module-reload.html">WARN</a></p>
</li>
<li>
<p>fi-bdw-5557u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9464/fi-bdw-5557u/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5264/fi-bdw-5557u/igt@i915_pm_rpm@module-reload.html">WARN</a></p>
</li>
<li>
<p>fi-kbl-r:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9464/fi-kbl-r/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5264/fi-kbl-r/igt@i915_pm_rpm@module-reload.html">WARN</a></p>
</li>
<li>
<p>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9464/fi-apl-guc/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5264/fi-apl-guc/igt@i915_pm_rpm@module-reload.html">WARN</a></p>
</li>
<li>
<p>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9464/fi-bsw-nick/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5264/fi-bsw-nick/igt@i915_pm_rpm@module-reload.html">WARN</a></p>
</li>
<li>
<p>fi-glk-dsi:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9464/fi-glk-dsi/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5264/fi-glk-dsi/igt@i915_pm_rpm@module-reload.html">WARN</a></p>
</li>
<li>
<p>fi-icl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9464/fi-icl-u2/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5264/fi-icl-u2/igt@i915_pm_rpm@module-reload.html">WARN</a></p>
</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>
<p>fi-byt-j1900:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9464/fi-byt-j1900/igt@i915_pm_rpm@module-reload.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/142">i915#142</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2405">i915#2405</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5264/fi-byt-j1900/igt@i915_pm_rpm@module-reload.html">WARN</a></p>
</li>
<li>
<p>fi-kbl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9464/fi-kbl-guc/igt@i915_pm_rpm@module-reload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/579">i915#579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5264/fi-kbl-guc/igt@i915_pm_rpm@module-reload.html">WARN</a></p>
</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@i915_pm_rpm@module-reload:<ul>
<li>{fi-ehl-1}:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9464/fi-ehl-1/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5264/fi-ehl-1/igt@i915_pm_rpm@module-reload.html">WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5264 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@amdgpu/amd_basic@userptr:</p>
<ul>
<li>fi-byt-j1900:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5264/fi-byt-j1900/igt@amdgpu/amd_basic@userptr.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9464/fi-tgl-y/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5264/fi-tgl-y/igt@i915_pm_rpm@module-reload.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a>)</li>
</ul>
</li>
<li>
<p>igt@vgem_basic@setversion:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9464/fi-tgl-y/igt@vgem_basic@setversion.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5264/fi-tgl-y/igt@vgem_basic@setversion.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) +2 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@gt_lrc:</p>
<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9464/fi-bsw-n3050/igt@i915_selftest@live@gt_lrc.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2675">i915#2675</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5264/fi-bsw-n3050/igt@i915_selftest@live@gt_lrc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@sanitycheck:</p>
<ul>
<li>fi-kbl-7500u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9464/fi-kbl-7500u/igt@i915_selftest@live@sanitycheck.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2605">i915#2605</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5264/fi-kbl-7500u/igt@i915_selftest@live@sanitycheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@vgem_basic@create:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9464/fi-tgl-y/igt@vgem_basic@create.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5264/fi-tgl-y/igt@vgem_basic@create.html">PASS</a> +2 similar issues</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (43 -&gt; 39)</h2>
<p>Missing    (4): fi-ilk-m540 fi-dg1-1 fi-bdw-samus fi-hsw-4200u </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5885 -&gt; IGTPW_5264</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9464: a2561d7ce07920c1fc05013c87d21d3c8b05149f @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5264: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5264/index.html<br />
  IGT_5885: d99f644b1868b9c92435b05ebfafa230721cd677 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>
<p>== Testlist changes ==</p>
<p>+igt@i915_pm_rpm@pc8-residency-display-off<br />
+igt@i915_pm_rpm@pc8-residency-display-on<br />
+igt@i915_pm_rpm@pc10-residency-display-off<br />
+igt@i915_pm_rpm@pc10-residency-display-on<br />
-igt@i915_pm_rpm@pc8-residency</p>

</body>
</html>

--===============4466360865736208530==--

--===============1252958756==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1252958756==--
