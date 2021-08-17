Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============6450128060426964948=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 17 Aug 2021 18:03:07 -0000
Message-ID: <162922338721.22607.360640800385399909@emeril.freedesktop.org>
References: <20210817172439.2159386-1-lucas.demarchi@intel.com>
In-Reply-To: <20210817172439.2159386-1-lucas.demarchi@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgaTkxNS9p?=
 =?utf-8?q?915=5Fpm=5Frps=3A_ensure_array_size_matches_loop_method?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============6450128060426964948==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: i915/i915_pm_rps: ensure array size matches loop method
URL   : https://patchwork.freedesktop.org/series/93755/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_10490 -> IGTPW_6130
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_6130 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_6130, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6130/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_6130:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_pm_rps@basic-api:
    - fi-kbl-guc:         [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10490/fi-kbl-guc/igt@i915_pm_rps@basic-api.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6130/fi-kbl-guc/igt@i915_pm_rps@basic-api.html
    - fi-cfl-8109u:       [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10490/fi-cfl-8109u/igt@i915_pm_rps@basic-api.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6130/fi-cfl-8109u/igt@i915_pm_rps@basic-api.html
    - fi-rkl-guc:         [PASS][5] -> [FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10490/fi-rkl-guc/igt@i915_pm_rps@basic-api.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6130/fi-rkl-guc/igt@i915_pm_rps@basic-api.html
    - fi-bsw-nick:        [PASS][7] -> [FAIL][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10490/fi-bsw-nick/igt@i915_pm_rps@basic-api.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6130/fi-bsw-nick/igt@i915_pm_rps@basic-api.html
    - fi-kbl-7500u:       [PASS][9] -> [FAIL][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10490/fi-kbl-7500u/igt@i915_pm_rps@basic-api.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6130/fi-kbl-7500u/igt@i915_pm_rps@basic-api.html
    - fi-kbl-8809g:       [PASS][11] -> [FAIL][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10490/fi-kbl-8809g/igt@i915_pm_rps@basic-api.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6130/fi-kbl-8809g/igt@i915_pm_rps@basic-api.html
    - fi-bsw-kefka:       [PASS][13] -> [FAIL][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10490/fi-bsw-kefka/igt@i915_pm_rps@basic-api.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6130/fi-bsw-kefka/igt@i915_pm_rps@basic-api.html
    - fi-glk-dsi:         [PASS][15] -> [FAIL][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10490/fi-glk-dsi/igt@i915_pm_rps@basic-api.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6130/fi-glk-dsi/igt@i915_pm_rps@basic-api.html
    - fi-cfl-guc:         [PASS][17] -> [FAIL][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10490/fi-cfl-guc/igt@i915_pm_rps@basic-api.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6130/fi-cfl-guc/igt@i915_pm_rps@basic-api.html
    - fi-ivb-3770:        [PASS][19] -> [FAIL][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10490/fi-ivb-3770/igt@i915_pm_rps@basic-api.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6130/fi-ivb-3770/igt@i915_pm_rps@basic-api.html
    - fi-cml-u2:          [PASS][21] -> [FAIL][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10490/fi-cml-u2/igt@i915_pm_rps@basic-api.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6130/fi-cml-u2/igt@i915_pm_rps@basic-api.html
    - fi-icl-u2:          [PASS][23] -> [FAIL][24]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10490/fi-icl-u2/igt@i915_pm_rps@basic-api.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6130/fi-icl-u2/igt@i915_pm_rps@basic-api.html
    - fi-skl-6700k2:      [PASS][25] -> [FAIL][26]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10490/fi-skl-6700k2/igt@i915_pm_rps@basic-api.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6130/fi-skl-6700k2/igt@i915_pm_rps@basic-api.html
    - fi-bxt-dsi:         [PASS][27] -> [FAIL][28]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10490/fi-bxt-dsi/igt@i915_pm_rps@basic-api.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6130/fi-bxt-dsi/igt@i915_pm_rps@basic-api.html
    - fi-cfl-8700k:       [PASS][29] -> [FAIL][30]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10490/fi-cfl-8700k/igt@i915_pm_rps@basic-api.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6130/fi-cfl-8700k/igt@i915_pm_rps@basic-api.html
    - fi-hsw-4770:        [PASS][31] -> [FAIL][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10490/fi-hsw-4770/igt@i915_pm_rps@basic-api.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6130/fi-hsw-4770/igt@i915_pm_rps@basic-api.html
    - fi-snb-2520m:       [PASS][33] -> [FAIL][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10490/fi-snb-2520m/igt@i915_pm_rps@basic-api.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6130/fi-snb-2520m/igt@i915_pm_rps@basic-api.html
    - fi-tgl-1115g4:      [PASS][35] -> [FAIL][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10490/fi-tgl-1115g4/igt@i915_pm_rps@basic-api.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6130/fi-tgl-1115g4/igt@i915_pm_rps@basic-api.html
    - fi-kbl-7567u:       [PASS][37] -> [FAIL][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10490/fi-kbl-7567u/igt@i915_pm_rps@basic-api.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6130/fi-kbl-7567u/igt@i915_pm_rps@basic-api.html
    - fi-bdw-5557u:       NOTRUN -> [FAIL][39]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6130/fi-bdw-5557u/igt@i915_pm_rps@basic-api.html
    - fi-skl-guc:         [PASS][40] -> [FAIL][41]
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10490/fi-skl-guc/igt@i915_pm_rps@basic-api.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6130/fi-skl-guc/igt@i915_pm_rps@basic-api.html
    - fi-icl-y:           [PASS][42] -> [FAIL][43]
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10490/fi-icl-y/igt@i915_pm_rps@basic-api.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6130/fi-icl-y/igt@i915_pm_rps@basic-api.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@i915_pm_rps@basic-api:
    - {fi-ehl-2}:         [PASS][44] -> [FAIL][45]
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10490/fi-ehl-2/igt@i915_pm_rps@basic-api.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6130/fi-ehl-2/igt@i915_pm_rps@basic-api.html
    - {fi-jsl-1}:         [PASS][46] -> [FAIL][47]
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10490/fi-jsl-1/igt@i915_pm_rps@basic-api.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6130/fi-jsl-1/igt@i915_pm_rps@basic-api.html
    - {fi-tgl-dsi}:       [PASS][48] -> [FAIL][49]
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10490/fi-tgl-dsi/igt@i915_pm_rps@basic-api.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6130/fi-tgl-dsi/igt@i915_pm_rps@basic-api.html
    - {fi-hsw-gt1}:       [PASS][50] -> [FAIL][51]
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10490/fi-hsw-gt1/igt@i915_pm_rps@basic-api.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6130/fi-hsw-gt1/igt@i915_pm_rps@basic-api.html

  
Known issues
------------

  Here are the changes found in IGTPW_6130 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@amdgpu/amd_basic@semaphore:
    - fi-bdw-5557u:       NOTRUN -> [SKIP][52] ([fdo#109271]) +27 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6130/fi-bdw-5557u/igt@amdgpu/amd_basic@semaphore.html

  * igt@core_hotunplug@unbind-rebind:
    - fi-bdw-5557u:       NOTRUN -> [WARN][53] ([i915#3718])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6130/fi-bdw-5557u/igt@core_hotunplug@unbind-rebind.html

  * igt@kms_chamelium@dp-crc-fast:
    - fi-bdw-5557u:       NOTRUN -> [SKIP][54] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6130/fi-bdw-5557u/igt@kms_chamelium@dp-crc-fast.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#3718]: https://gitlab.freedesktop.org/drm/intel/issues/3718


Participating hosts (36 -> 33)
------------------------------

  Missing    (3): fi-kbl-soraka fi-bsw-cyan fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6177 -> IGTPW_6130

  CI-20190529: 20190529
  CI_DRM_10490: 3bd74b377986fcb89cf4563629f97c5b3199ca6f @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6130: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6130/index.html
  IGT_6177: f474644e7226dd319195ca03b3cde82ad10ac54c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6130/index.html

--===============6450128060426964948==
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
<tr><td><b>Series:</b></td><td>i915/i915_pm_rps: ensure array size matches loop method</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/93755/">https://patchwork.freedesktop.org/series/93755/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6130/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6130/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10490 -&gt; IGTPW_6130</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_6130 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_6130, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6130/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_6130:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>
<p>fi-kbl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10490/fi-kbl-guc/igt@i915_pm_rps@basic-api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6130/fi-kbl-guc/igt@i915_pm_rps@basic-api.html">FAIL</a></p>
</li>
<li>
<p>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10490/fi-cfl-8109u/igt@i915_pm_rps@basic-api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6130/fi-cfl-8109u/igt@i915_pm_rps@basic-api.html">FAIL</a></p>
</li>
<li>
<p>fi-rkl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10490/fi-rkl-guc/igt@i915_pm_rps@basic-api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6130/fi-rkl-guc/igt@i915_pm_rps@basic-api.html">FAIL</a></p>
</li>
<li>
<p>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10490/fi-bsw-nick/igt@i915_pm_rps@basic-api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6130/fi-bsw-nick/igt@i915_pm_rps@basic-api.html">FAIL</a></p>
</li>
<li>
<p>fi-kbl-7500u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10490/fi-kbl-7500u/igt@i915_pm_rps@basic-api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6130/fi-kbl-7500u/igt@i915_pm_rps@basic-api.html">FAIL</a></p>
</li>
<li>
<p>fi-kbl-8809g:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10490/fi-kbl-8809g/igt@i915_pm_rps@basic-api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6130/fi-kbl-8809g/igt@i915_pm_rps@basic-api.html">FAIL</a></p>
</li>
<li>
<p>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10490/fi-bsw-kefka/igt@i915_pm_rps@basic-api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6130/fi-bsw-kefka/igt@i915_pm_rps@basic-api.html">FAIL</a></p>
</li>
<li>
<p>fi-glk-dsi:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10490/fi-glk-dsi/igt@i915_pm_rps@basic-api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6130/fi-glk-dsi/igt@i915_pm_rps@basic-api.html">FAIL</a></p>
</li>
<li>
<p>fi-cfl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10490/fi-cfl-guc/igt@i915_pm_rps@basic-api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6130/fi-cfl-guc/igt@i915_pm_rps@basic-api.html">FAIL</a></p>
</li>
<li>
<p>fi-ivb-3770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10490/fi-ivb-3770/igt@i915_pm_rps@basic-api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6130/fi-ivb-3770/igt@i915_pm_rps@basic-api.html">FAIL</a></p>
</li>
<li>
<p>fi-cml-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10490/fi-cml-u2/igt@i915_pm_rps@basic-api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6130/fi-cml-u2/igt@i915_pm_rps@basic-api.html">FAIL</a></p>
</li>
<li>
<p>fi-icl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10490/fi-icl-u2/igt@i915_pm_rps@basic-api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6130/fi-icl-u2/igt@i915_pm_rps@basic-api.html">FAIL</a></p>
</li>
<li>
<p>fi-skl-6700k2:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10490/fi-skl-6700k2/igt@i915_pm_rps@basic-api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6130/fi-skl-6700k2/igt@i915_pm_rps@basic-api.html">FAIL</a></p>
</li>
<li>
<p>fi-bxt-dsi:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10490/fi-bxt-dsi/igt@i915_pm_rps@basic-api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6130/fi-bxt-dsi/igt@i915_pm_rps@basic-api.html">FAIL</a></p>
</li>
<li>
<p>fi-cfl-8700k:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10490/fi-cfl-8700k/igt@i915_pm_rps@basic-api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6130/fi-cfl-8700k/igt@i915_pm_rps@basic-api.html">FAIL</a></p>
</li>
<li>
<p>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10490/fi-hsw-4770/igt@i915_pm_rps@basic-api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6130/fi-hsw-4770/igt@i915_pm_rps@basic-api.html">FAIL</a></p>
</li>
<li>
<p>fi-snb-2520m:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10490/fi-snb-2520m/igt@i915_pm_rps@basic-api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6130/fi-snb-2520m/igt@i915_pm_rps@basic-api.html">FAIL</a></p>
</li>
<li>
<p>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10490/fi-tgl-1115g4/igt@i915_pm_rps@basic-api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6130/fi-tgl-1115g4/igt@i915_pm_rps@basic-api.html">FAIL</a></p>
</li>
<li>
<p>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10490/fi-kbl-7567u/igt@i915_pm_rps@basic-api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6130/fi-kbl-7567u/igt@i915_pm_rps@basic-api.html">FAIL</a></p>
</li>
<li>
<p>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6130/fi-bdw-5557u/igt@i915_pm_rps@basic-api.html">FAIL</a></p>
</li>
<li>
<p>fi-skl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10490/fi-skl-guc/igt@i915_pm_rps@basic-api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6130/fi-skl-guc/igt@i915_pm_rps@basic-api.html">FAIL</a></p>
</li>
<li>
<p>fi-icl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10490/fi-icl-y/igt@i915_pm_rps@basic-api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6130/fi-icl-y/igt@i915_pm_rps@basic-api.html">FAIL</a></p>
</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>
<p>{fi-ehl-2}:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10490/fi-ehl-2/igt@i915_pm_rps@basic-api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6130/fi-ehl-2/igt@i915_pm_rps@basic-api.html">FAIL</a></p>
</li>
<li>
<p>{fi-jsl-1}:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10490/fi-jsl-1/igt@i915_pm_rps@basic-api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6130/fi-jsl-1/igt@i915_pm_rps@basic-api.html">FAIL</a></p>
</li>
<li>
<p>{fi-tgl-dsi}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10490/fi-tgl-dsi/igt@i915_pm_rps@basic-api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6130/fi-tgl-dsi/igt@i915_pm_rps@basic-api.html">FAIL</a></p>
</li>
<li>
<p>{fi-hsw-gt1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10490/fi-hsw-gt1/igt@i915_pm_rps@basic-api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6130/fi-hsw-gt1/igt@i915_pm_rps@basic-api.html">FAIL</a></p>
</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6130 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@amdgpu/amd_basic@semaphore:</p>
<ul>
<li>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6130/fi-bdw-5557u/igt@amdgpu/amd_basic@semaphore.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +27 similar issues</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6130/fi-bdw-5557u/igt@core_hotunplug@unbind-rebind.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3718">i915#3718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-crc-fast:</p>
<ul>
<li>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6130/fi-bdw-5557u/igt@kms_chamelium@dp-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (36 -&gt; 33)</h2>
<p>Missing    (3): fi-kbl-soraka fi-bsw-cyan fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6177 -&gt; IGTPW_6130</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_10490: 3bd74b377986fcb89cf4563629f97c5b3199ca6f @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_6130: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6130/index.html<br />
  IGT_6177: f474644e7226dd319195ca03b3cde82ad10ac54c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============6450128060426964948==--
