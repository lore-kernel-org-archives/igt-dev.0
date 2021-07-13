Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 13 Jul 2021 16:39:30 -0000
Message-ID: <162619437086.712.8382783174994311294@emeril.freedesktop.org>
References: <20210527140732.5762-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20210527140732.5762-1-daniel.vetter@ffwll.ch>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?vgem=5Fbasic=3A_Fix_unload_testcase_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0423795162=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0423795162==
Content-Type: multipart/alternative;
 boundary="===============3264790374125663312=="

--===============3264790374125663312==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/vgem_basic: Fix unload testcase (rev2)
URL   : https://patchwork.freedesktop.org/series/90669/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_10341 -> IGTPW_6018
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_6018 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_6018, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6018/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_6018:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_parallel@engines@userptr:
    - fi-bsw-kefka:       [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10341/fi-bsw-kefka/igt@gem_exec_parallel@engines@userptr.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6018/fi-bsw-kefka/igt@gem_exec_parallel@engines@userptr.html

  * igt@vgem_basic@unload:
    - fi-kbl-7567u:       [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10341/fi-kbl-7567u/igt@vgem_basic@unload.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6018/fi-kbl-7567u/igt@vgem_basic@unload.html
    - fi-elk-e7500:       [PASS][5] -> [FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10341/fi-elk-e7500/igt@vgem_basic@unload.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6018/fi-elk-e7500/igt@vgem_basic@unload.html
    - fi-skl-6700k2:      [PASS][7] -> [FAIL][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10341/fi-skl-6700k2/igt@vgem_basic@unload.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6018/fi-skl-6700k2/igt@vgem_basic@unload.html
    - fi-skl-guc:         [PASS][9] -> [FAIL][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10341/fi-skl-guc/igt@vgem_basic@unload.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6018/fi-skl-guc/igt@vgem_basic@unload.html
    - fi-cfl-guc:         [PASS][11] -> [FAIL][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10341/fi-cfl-guc/igt@vgem_basic@unload.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6018/fi-cfl-guc/igt@vgem_basic@unload.html
    - fi-hsw-4770:        [PASS][13] -> [FAIL][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10341/fi-hsw-4770/igt@vgem_basic@unload.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6018/fi-hsw-4770/igt@vgem_basic@unload.html
    - fi-ilk-650:         [PASS][15] -> [FAIL][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10341/fi-ilk-650/igt@vgem_basic@unload.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6018/fi-ilk-650/igt@vgem_basic@unload.html
    - fi-cml-u2:          [PASS][17] -> [FAIL][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10341/fi-cml-u2/igt@vgem_basic@unload.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6018/fi-cml-u2/igt@vgem_basic@unload.html
    - fi-bxt-dsi:         [PASS][19] -> [FAIL][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10341/fi-bxt-dsi/igt@vgem_basic@unload.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6018/fi-bxt-dsi/igt@vgem_basic@unload.html
    - fi-kbl-soraka:      [PASS][21] -> [FAIL][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10341/fi-kbl-soraka/igt@vgem_basic@unload.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6018/fi-kbl-soraka/igt@vgem_basic@unload.html
    - fi-cfl-8109u:       [PASS][23] -> [FAIL][24]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10341/fi-cfl-8109u/igt@vgem_basic@unload.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6018/fi-cfl-8109u/igt@vgem_basic@unload.html
    - fi-bsw-nick:        [PASS][25] -> [FAIL][26]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10341/fi-bsw-nick/igt@vgem_basic@unload.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6018/fi-bsw-nick/igt@vgem_basic@unload.html
    - fi-bdw-5557u:       [PASS][27] -> [FAIL][28]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10341/fi-bdw-5557u/igt@vgem_basic@unload.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6018/fi-bdw-5557u/igt@vgem_basic@unload.html
    - fi-kbl-8809g:       [PASS][29] -> [FAIL][30]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10341/fi-kbl-8809g/igt@vgem_basic@unload.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6018/fi-kbl-8809g/igt@vgem_basic@unload.html
    - fi-bwr-2160:        [PASS][31] -> [FAIL][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10341/fi-bwr-2160/igt@vgem_basic@unload.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6018/fi-bwr-2160/igt@vgem_basic@unload.html
    - fi-bsw-kefka:       [PASS][33] -> [FAIL][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10341/fi-bsw-kefka/igt@vgem_basic@unload.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6018/fi-bsw-kefka/igt@vgem_basic@unload.html
    - fi-kbl-guc:         [PASS][35] -> [FAIL][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10341/fi-kbl-guc/igt@vgem_basic@unload.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6018/fi-kbl-guc/igt@vgem_basic@unload.html
    - fi-kbl-7500u:       [PASS][37] -> [FAIL][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10341/fi-kbl-7500u/igt@vgem_basic@unload.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6018/fi-kbl-7500u/igt@vgem_basic@unload.html
    - fi-kbl-x1275:       [PASS][39] -> [FAIL][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10341/fi-kbl-x1275/igt@vgem_basic@unload.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6018/fi-kbl-x1275/igt@vgem_basic@unload.html
    - fi-pnv-d510:        [PASS][41] -> [FAIL][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10341/fi-pnv-d510/igt@vgem_basic@unload.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6018/fi-pnv-d510/igt@vgem_basic@unload.html
    - fi-tgl-y:           [PASS][43] -> [FAIL][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10341/fi-tgl-y/igt@vgem_basic@unload.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6018/fi-tgl-y/igt@vgem_basic@unload.html
    - fi-icl-y:           [PASS][45] -> [FAIL][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10341/fi-icl-y/igt@vgem_basic@unload.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6018/fi-icl-y/igt@vgem_basic@unload.html
    - fi-cfl-8700k:       [PASS][47] -> [FAIL][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10341/fi-cfl-8700k/igt@vgem_basic@unload.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6018/fi-cfl-8700k/igt@vgem_basic@unload.html
    - fi-snb-2520m:       [PASS][49] -> [FAIL][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10341/fi-snb-2520m/igt@vgem_basic@unload.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6018/fi-snb-2520m/igt@vgem_basic@unload.html
    - fi-ivb-3770:        [PASS][51] -> [FAIL][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10341/fi-ivb-3770/igt@vgem_basic@unload.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6018/fi-ivb-3770/igt@vgem_basic@unload.html
    - fi-glk-dsi:         [PASS][53] -> [FAIL][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10341/fi-glk-dsi/igt@vgem_basic@unload.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6018/fi-glk-dsi/igt@vgem_basic@unload.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@vgem_basic@unload:
    - {fi-ehl-2}:         [PASS][55] -> [FAIL][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10341/fi-ehl-2/igt@vgem_basic@unload.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6018/fi-ehl-2/igt@vgem_basic@unload.html
    - {fi-jsl-1}:         [PASS][57] -> [FAIL][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10341/fi-jsl-1/igt@vgem_basic@unload.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6018/fi-jsl-1/igt@vgem_basic@unload.html
    - {fi-tgl-1115g4}:    [PASS][59] -> [FAIL][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10341/fi-tgl-1115g4/igt@vgem_basic@unload.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6018/fi-tgl-1115g4/igt@vgem_basic@unload.html
    - {fi-hsw-gt1}:       [PASS][61] -> [FAIL][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10341/fi-hsw-gt1/igt@vgem_basic@unload.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6018/fi-hsw-gt1/igt@vgem_basic@unload.html
    - {fi-tgl-dsi}:       [PASS][63] -> [FAIL][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10341/fi-tgl-dsi/igt@vgem_basic@unload.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6018/fi-tgl-dsi/igt@vgem_basic@unload.html

  
Known issues
------------

  Here are the changes found in IGTPW_6018 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@amdgpu/amd_prime@amd-to-i915:
    - fi-tgl-y:           NOTRUN -> [SKIP][65] ([fdo#109315] / [i915#2575])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6018/fi-tgl-y/igt@amdgpu/amd_prime@amd-to-i915.html

  * igt@i915_selftest@live@execlists:
    - fi-kbl-soraka:      [PASS][66] -> [INCOMPLETE][67] ([i915#2782] / [i915#794])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10341/fi-kbl-soraka/igt@i915_selftest@live@execlists.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6018/fi-kbl-soraka/igt@i915_selftest@live@execlists.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
  [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
  [i915#2782]: https://gitlab.freedesktop.org/drm/intel/issues/2782
  [i915#3717]: https://gitlab.freedesktop.org/drm/intel/issues/3717
  [i915#794]: https://gitlab.freedesktop.org/drm/intel/issues/794


Participating hosts (39 -> 36)
------------------------------

  Missing    (3): fi-ilk-m540 fi-bdw-samus fi-hsw-4200u 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6137 -> IGTPW_6018

  CI-20190529: 20190529
  CI_DRM_10341: 72a4e94d9585ff89a8c85bd1436fb05b60dad2f8 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6018: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6018/index.html
  IGT_6137: 2fee489255f7a8cd6a584373c30e3d44a07a78ea @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6018/index.html

--===============3264790374125663312==
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
<tr><td><b>Series:</b></td><td>tests/vgem_basic: Fix unload testcase (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/90669/">https://patchwork.freedesktop.org/series/90669/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6018/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6018/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10341 -&gt; IGTPW_6018</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_6018 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_6018, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6018/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_6018:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_exec_parallel@engines@userptr:</p>
<ul>
<li>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10341/fi-bsw-kefka/igt@gem_exec_parallel@engines@userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6018/fi-bsw-kefka/igt@gem_exec_parallel@engines@userptr.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@vgem_basic@unload:</p>
<ul>
<li>
<p>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10341/fi-kbl-7567u/igt@vgem_basic@unload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6018/fi-kbl-7567u/igt@vgem_basic@unload.html">FAIL</a></p>
</li>
<li>
<p>fi-elk-e7500:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10341/fi-elk-e7500/igt@vgem_basic@unload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6018/fi-elk-e7500/igt@vgem_basic@unload.html">FAIL</a></p>
</li>
<li>
<p>fi-skl-6700k2:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10341/fi-skl-6700k2/igt@vgem_basic@unload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6018/fi-skl-6700k2/igt@vgem_basic@unload.html">FAIL</a></p>
</li>
<li>
<p>fi-skl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10341/fi-skl-guc/igt@vgem_basic@unload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6018/fi-skl-guc/igt@vgem_basic@unload.html">FAIL</a></p>
</li>
<li>
<p>fi-cfl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10341/fi-cfl-guc/igt@vgem_basic@unload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6018/fi-cfl-guc/igt@vgem_basic@unload.html">FAIL</a></p>
</li>
<li>
<p>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10341/fi-hsw-4770/igt@vgem_basic@unload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6018/fi-hsw-4770/igt@vgem_basic@unload.html">FAIL</a></p>
</li>
<li>
<p>fi-ilk-650:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10341/fi-ilk-650/igt@vgem_basic@unload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6018/fi-ilk-650/igt@vgem_basic@unload.html">FAIL</a></p>
</li>
<li>
<p>fi-cml-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10341/fi-cml-u2/igt@vgem_basic@unload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6018/fi-cml-u2/igt@vgem_basic@unload.html">FAIL</a></p>
</li>
<li>
<p>fi-bxt-dsi:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10341/fi-bxt-dsi/igt@vgem_basic@unload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6018/fi-bxt-dsi/igt@vgem_basic@unload.html">FAIL</a></p>
</li>
<li>
<p>fi-kbl-soraka:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10341/fi-kbl-soraka/igt@vgem_basic@unload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6018/fi-kbl-soraka/igt@vgem_basic@unload.html">FAIL</a></p>
</li>
<li>
<p>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10341/fi-cfl-8109u/igt@vgem_basic@unload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6018/fi-cfl-8109u/igt@vgem_basic@unload.html">FAIL</a></p>
</li>
<li>
<p>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10341/fi-bsw-nick/igt@vgem_basic@unload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6018/fi-bsw-nick/igt@vgem_basic@unload.html">FAIL</a></p>
</li>
<li>
<p>fi-bdw-5557u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10341/fi-bdw-5557u/igt@vgem_basic@unload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6018/fi-bdw-5557u/igt@vgem_basic@unload.html">FAIL</a></p>
</li>
<li>
<p>fi-kbl-8809g:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10341/fi-kbl-8809g/igt@vgem_basic@unload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6018/fi-kbl-8809g/igt@vgem_basic@unload.html">FAIL</a></p>
</li>
<li>
<p>fi-bwr-2160:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10341/fi-bwr-2160/igt@vgem_basic@unload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6018/fi-bwr-2160/igt@vgem_basic@unload.html">FAIL</a></p>
</li>
<li>
<p>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10341/fi-bsw-kefka/igt@vgem_basic@unload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6018/fi-bsw-kefka/igt@vgem_basic@unload.html">FAIL</a></p>
</li>
<li>
<p>fi-kbl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10341/fi-kbl-guc/igt@vgem_basic@unload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6018/fi-kbl-guc/igt@vgem_basic@unload.html">FAIL</a></p>
</li>
<li>
<p>fi-kbl-7500u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10341/fi-kbl-7500u/igt@vgem_basic@unload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6018/fi-kbl-7500u/igt@vgem_basic@unload.html">FAIL</a></p>
</li>
<li>
<p>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10341/fi-kbl-x1275/igt@vgem_basic@unload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6018/fi-kbl-x1275/igt@vgem_basic@unload.html">FAIL</a></p>
</li>
<li>
<p>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10341/fi-pnv-d510/igt@vgem_basic@unload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6018/fi-pnv-d510/igt@vgem_basic@unload.html">FAIL</a></p>
</li>
<li>
<p>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10341/fi-tgl-y/igt@vgem_basic@unload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6018/fi-tgl-y/igt@vgem_basic@unload.html">FAIL</a></p>
</li>
<li>
<p>fi-icl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10341/fi-icl-y/igt@vgem_basic@unload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6018/fi-icl-y/igt@vgem_basic@unload.html">FAIL</a></p>
</li>
<li>
<p>fi-cfl-8700k:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10341/fi-cfl-8700k/igt@vgem_basic@unload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6018/fi-cfl-8700k/igt@vgem_basic@unload.html">FAIL</a></p>
</li>
<li>
<p>fi-snb-2520m:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10341/fi-snb-2520m/igt@vgem_basic@unload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6018/fi-snb-2520m/igt@vgem_basic@unload.html">FAIL</a></p>
</li>
<li>
<p>fi-ivb-3770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10341/fi-ivb-3770/igt@vgem_basic@unload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6018/fi-ivb-3770/igt@vgem_basic@unload.html">FAIL</a></p>
</li>
<li>
<p>fi-glk-dsi:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10341/fi-glk-dsi/igt@vgem_basic@unload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6018/fi-glk-dsi/igt@vgem_basic@unload.html">FAIL</a></p>
</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@vgem_basic@unload:</p>
<ul>
<li>
<p>{fi-ehl-2}:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10341/fi-ehl-2/igt@vgem_basic@unload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6018/fi-ehl-2/igt@vgem_basic@unload.html">FAIL</a></p>
</li>
<li>
<p>{fi-jsl-1}:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10341/fi-jsl-1/igt@vgem_basic@unload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6018/fi-jsl-1/igt@vgem_basic@unload.html">FAIL</a></p>
</li>
<li>
<p>{fi-tgl-1115g4}:    <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10341/fi-tgl-1115g4/igt@vgem_basic@unload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6018/fi-tgl-1115g4/igt@vgem_basic@unload.html">FAIL</a></p>
</li>
<li>
<p>{fi-hsw-gt1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10341/fi-hsw-gt1/igt@vgem_basic@unload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6018/fi-hsw-gt1/igt@vgem_basic@unload.html">FAIL</a></p>
</li>
<li>
<p>{fi-tgl-dsi}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10341/fi-tgl-dsi/igt@vgem_basic@unload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6018/fi-tgl-dsi/igt@vgem_basic@unload.html">FAIL</a></p>
</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6018 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@amdgpu/amd_prime@amd-to-i915:</p>
<ul>
<li>fi-tgl-y:           NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6018/fi-tgl-y/igt@amdgpu/amd_prime@amd-to-i915.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>fi-kbl-soraka:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10341/fi-kbl-soraka/igt@i915_selftest@live@execlists.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6018/fi-kbl-soraka/igt@i915_selftest@live@execlists.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2782">i915#2782</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/794">i915#794</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (39 -&gt; 36)</h2>
<p>Missing    (3): fi-ilk-m540 fi-bdw-samus fi-hsw-4200u </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6137 -&gt; IGTPW_6018</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_10341: 72a4e94d9585ff89a8c85bd1436fb05b60dad2f8 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_6018: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6018/index.html<br />
  IGT_6137: 2fee489255f7a8cd6a584373c30e3d44a07a78ea @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============3264790374125663312==--

--===============0423795162==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0423795162==--
