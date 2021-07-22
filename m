Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 22 Jul 2021 09:50:43 -0000
Message-ID: <162694744312.30344.2001242643643297854@emeril.freedesktop.org>
References: <20210722083240.33453-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210722083240.33453-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgQWRkIGFs?=
 =?utf-8?q?locator_support_in_IGT?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0837551916=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0837551916==
Content-Type: multipart/alternative;
 boundary="===============3759682075821468084=="

--===============3759682075821468084==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add allocator support in IGT
URL   : https://patchwork.freedesktop.org/series/92881/
State : failure

== Summary ==

CI Bug Log - changes from IGT_6147 -> IGTPW_6044
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_6044 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_6044, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6044/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_6044:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_tiled_fence_blits@basic:
    - fi-elk-e7500:       [PASS][1] -> [FAIL][2] +2 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/fi-elk-e7500/igt@gem_tiled_fence_blits@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6044/fi-elk-e7500/igt@gem_tiled_fence_blits@basic.html

  * igt@gem_wait@busy@all:
    - fi-kbl-soraka:      [PASS][3] -> [INCOMPLETE][4] +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/fi-kbl-soraka/igt@gem_wait@busy@all.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6044/fi-kbl-soraka/igt@gem_wait@busy@all.html
    - fi-cfl-8109u:       [PASS][5] -> [INCOMPLETE][6] +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/fi-cfl-8109u/igt@gem_wait@busy@all.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6044/fi-cfl-8109u/igt@gem_wait@busy@all.html
    - fi-kbl-8809g:       [PASS][7] -> [INCOMPLETE][8] +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/fi-kbl-8809g/igt@gem_wait@busy@all.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6044/fi-kbl-8809g/igt@gem_wait@busy@all.html
    - fi-cfl-8700k:       [PASS][9] -> [INCOMPLETE][10] +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/fi-cfl-8700k/igt@gem_wait@busy@all.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6044/fi-cfl-8700k/igt@gem_wait@busy@all.html
    - fi-kbl-x1275:       [PASS][11] -> [INCOMPLETE][12] +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/fi-kbl-x1275/igt@gem_wait@busy@all.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6044/fi-kbl-x1275/igt@gem_wait@busy@all.html
    - fi-snb-2520m:       [PASS][13] -> [FAIL][14] +1 similar issue
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/fi-snb-2520m/igt@gem_wait@busy@all.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6044/fi-snb-2520m/igt@gem_wait@busy@all.html
    - fi-tgl-u2:          [PASS][15] -> [INCOMPLETE][16] +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/fi-tgl-u2/igt@gem_wait@busy@all.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6044/fi-tgl-u2/igt@gem_wait@busy@all.html
    - fi-ivb-3770:        [PASS][17] -> [FAIL][18] +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/fi-ivb-3770/igt@gem_wait@busy@all.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6044/fi-ivb-3770/igt@gem_wait@busy@all.html
    - fi-cml-u2:          [PASS][19] -> [INCOMPLETE][20] +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/fi-cml-u2/igt@gem_wait@busy@all.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6044/fi-cml-u2/igt@gem_wait@busy@all.html

  * igt@gem_wait@wait@all:
    - fi-bxt-dsi:         [PASS][21] -> [INCOMPLETE][22] +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/fi-bxt-dsi/igt@gem_wait@wait@all.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6044/fi-bxt-dsi/igt@gem_wait@wait@all.html
    - fi-hsw-4770:        [PASS][23] -> [FAIL][24] +1 similar issue
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/fi-hsw-4770/igt@gem_wait@wait@all.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6044/fi-hsw-4770/igt@gem_wait@wait@all.html
    - fi-skl-guc:         [PASS][25] -> [INCOMPLETE][26] +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/fi-skl-guc/igt@gem_wait@wait@all.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6044/fi-skl-guc/igt@gem_wait@wait@all.html
    - fi-kbl-7567u:       [PASS][27] -> [INCOMPLETE][28] +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/fi-kbl-7567u/igt@gem_wait@wait@all.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6044/fi-kbl-7567u/igt@gem_wait@wait@all.html
    - fi-bdw-5557u:       [PASS][29] -> [FAIL][30] +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/fi-bdw-5557u/igt@gem_wait@wait@all.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6044/fi-bdw-5557u/igt@gem_wait@wait@all.html
    - fi-icl-y:           [PASS][31] -> [INCOMPLETE][32] +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/fi-icl-y/igt@gem_wait@wait@all.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6044/fi-icl-y/igt@gem_wait@wait@all.html
    - fi-kbl-guc:         [PASS][33] -> [INCOMPLETE][34] +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/fi-kbl-guc/igt@gem_wait@wait@all.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6044/fi-kbl-guc/igt@gem_wait@wait@all.html
    - fi-bsw-nick:        [PASS][35] -> [FAIL][36] +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/fi-bsw-nick/igt@gem_wait@wait@all.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6044/fi-bsw-nick/igt@gem_wait@wait@all.html
    - fi-kbl-7500u:       [PASS][37] -> [INCOMPLETE][38] +1 similar issue
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/fi-kbl-7500u/igt@gem_wait@wait@all.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6044/fi-kbl-7500u/igt@gem_wait@wait@all.html
    - fi-bsw-kefka:       [PASS][39] -> [FAIL][40] +1 similar issue
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/fi-bsw-kefka/igt@gem_wait@wait@all.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6044/fi-bsw-kefka/igt@gem_wait@wait@all.html
    - fi-glk-dsi:         [PASS][41] -> [INCOMPLETE][42] +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/fi-glk-dsi/igt@gem_wait@wait@all.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6044/fi-glk-dsi/igt@gem_wait@wait@all.html
    - fi-cfl-guc:         [PASS][43] -> [INCOMPLETE][44] +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/fi-cfl-guc/igt@gem_wait@wait@all.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6044/fi-cfl-guc/igt@gem_wait@wait@all.html
    - fi-ilk-650:         [PASS][45] -> [FAIL][46] +1 similar issue
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/fi-ilk-650/igt@gem_wait@wait@all.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6044/fi-ilk-650/igt@gem_wait@wait@all.html
    - fi-skl-6700k2:      [PASS][47] -> [INCOMPLETE][48] +1 similar issue
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/fi-skl-6700k2/igt@gem_wait@wait@all.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6044/fi-skl-6700k2/igt@gem_wait@wait@all.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@gem_wait@busy@all:
    - {fi-tgl-dsi}:       [PASS][49] -> [INCOMPLETE][50] +1 similar issue
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/fi-tgl-dsi/igt@gem_wait@busy@all.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6044/fi-tgl-dsi/igt@gem_wait@busy@all.html

  * igt@gem_wait@wait@all:
    - {fi-hsw-gt1}:       [PASS][51] -> [FAIL][52] +1 similar issue
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/fi-hsw-gt1/igt@gem_wait@wait@all.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6044/fi-hsw-gt1/igt@gem_wait@wait@all.html
    - {fi-ehl-2}:         [PASS][53] -> [INCOMPLETE][54] +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/fi-ehl-2/igt@gem_wait@wait@all.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6044/fi-ehl-2/igt@gem_wait@wait@all.html
    - {fi-jsl-1}:         [PASS][55] -> [INCOMPLETE][56] +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/fi-jsl-1/igt@gem_wait@wait@all.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6044/fi-jsl-1/igt@gem_wait@wait@all.html
    - {fi-tgl-1115g4}:    [PASS][57] -> [INCOMPLETE][58] +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/fi-tgl-1115g4/igt@gem_wait@wait@all.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6044/fi-tgl-1115g4/igt@gem_wait@wait@all.html

  * igt@i915_selftest@live@gt_heartbeat:
    - {fi-ehl-2}:         [PASS][59] -> [DMESG-FAIL][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/fi-ehl-2/igt@i915_selftest@live@gt_heartbeat.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6044/fi-ehl-2/igt@i915_selftest@live@gt_heartbeat.html

  
Known issues
------------

  Here are the changes found in IGTPW_6044 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@execlists:
    - fi-kbl-soraka:      [PASS][61] -> [INCOMPLETE][62] ([i915#2782] / [i915#794])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/fi-kbl-soraka/igt@i915_selftest@live@execlists.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6044/fi-kbl-soraka/igt@i915_selftest@live@execlists.html

  
#### Possible fixes ####

  * igt@gem_exec_suspend@basic-s0:
    - {fi-tgl-1115g4}:    [FAIL][63] ([i915#1888]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/fi-tgl-1115g4/igt@gem_exec_suspend@basic-s0.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6044/fi-tgl-1115g4/igt@gem_exec_suspend@basic-s0.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [i915#1886]: https://gitlab.freedesktop.org/drm/intel/issues/1886
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#2782]: https://gitlab.freedesktop.org/drm/intel/issues/2782
  [i915#3717]: https://gitlab.freedesktop.org/drm/intel/issues/3717
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#794]: https://gitlab.freedesktop.org/drm/intel/issues/794


Participating hosts (38 -> 35)
------------------------------

  Missing    (3): fi-ilk-m540 fi-bdw-samus fi-hsw-4200u 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6147 -> IGTPW_6044

  CI-20190529: 20190529
  CI_DRM_10368: e7afa0ebe24f6a74724bad8bbefbefce534e466d @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6044: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6044/index.html
  IGT_6147: f3994c2cd99a1acfe991a8cc838a387dcb36598a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git



== Testlist changes ==

+igt@gem_softpin@allocator-evict
+igt@gem_softpin@allocator-evict-all-engines

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6044/index.html

--===============3759682075821468084==
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
<tr><td><b>Series:</b></td><td>Add allocator support in IGT</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/92881/">https://patchwork.freedesktop.org/series/92881/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6044/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6044/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_6147 -&gt; IGTPW_6044</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_6044 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_6044, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6044/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_6044:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_tiled_fence_blits@basic:</p>
<ul>
<li>fi-elk-e7500:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/fi-elk-e7500/igt@gem_tiled_fence_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6044/fi-elk-e7500/igt@gem_tiled_fence_blits@basic.html">FAIL</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_wait@busy@all:</p>
<ul>
<li>
<p>fi-kbl-soraka:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/fi-kbl-soraka/igt@gem_wait@busy@all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6044/fi-kbl-soraka/igt@gem_wait@busy@all.html">INCOMPLETE</a> +1 similar issue</p>
</li>
<li>
<p>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/fi-cfl-8109u/igt@gem_wait@busy@all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6044/fi-cfl-8109u/igt@gem_wait@busy@all.html">INCOMPLETE</a> +1 similar issue</p>
</li>
<li>
<p>fi-kbl-8809g:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/fi-kbl-8809g/igt@gem_wait@busy@all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6044/fi-kbl-8809g/igt@gem_wait@busy@all.html">INCOMPLETE</a> +1 similar issue</p>
</li>
<li>
<p>fi-cfl-8700k:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/fi-cfl-8700k/igt@gem_wait@busy@all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6044/fi-cfl-8700k/igt@gem_wait@busy@all.html">INCOMPLETE</a> +1 similar issue</p>
</li>
<li>
<p>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/fi-kbl-x1275/igt@gem_wait@busy@all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6044/fi-kbl-x1275/igt@gem_wait@busy@all.html">INCOMPLETE</a> +1 similar issue</p>
</li>
<li>
<p>fi-snb-2520m:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/fi-snb-2520m/igt@gem_wait@busy@all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6044/fi-snb-2520m/igt@gem_wait@busy@all.html">FAIL</a> +1 similar issue</p>
</li>
<li>
<p>fi-tgl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/fi-tgl-u2/igt@gem_wait@busy@all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6044/fi-tgl-u2/igt@gem_wait@busy@all.html">INCOMPLETE</a> +1 similar issue</p>
</li>
<li>
<p>fi-ivb-3770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/fi-ivb-3770/igt@gem_wait@busy@all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6044/fi-ivb-3770/igt@gem_wait@busy@all.html">FAIL</a> +1 similar issue</p>
</li>
<li>
<p>fi-cml-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/fi-cml-u2/igt@gem_wait@busy@all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6044/fi-cml-u2/igt@gem_wait@busy@all.html">INCOMPLETE</a> +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_wait@wait@all:</p>
<ul>
<li>
<p>fi-bxt-dsi:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/fi-bxt-dsi/igt@gem_wait@wait@all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6044/fi-bxt-dsi/igt@gem_wait@wait@all.html">INCOMPLETE</a> +1 similar issue</p>
</li>
<li>
<p>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/fi-hsw-4770/igt@gem_wait@wait@all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6044/fi-hsw-4770/igt@gem_wait@wait@all.html">FAIL</a> +1 similar issue</p>
</li>
<li>
<p>fi-skl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/fi-skl-guc/igt@gem_wait@wait@all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6044/fi-skl-guc/igt@gem_wait@wait@all.html">INCOMPLETE</a> +1 similar issue</p>
</li>
<li>
<p>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/fi-kbl-7567u/igt@gem_wait@wait@all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6044/fi-kbl-7567u/igt@gem_wait@wait@all.html">INCOMPLETE</a> +1 similar issue</p>
</li>
<li>
<p>fi-bdw-5557u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/fi-bdw-5557u/igt@gem_wait@wait@all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6044/fi-bdw-5557u/igt@gem_wait@wait@all.html">FAIL</a> +1 similar issue</p>
</li>
<li>
<p>fi-icl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/fi-icl-y/igt@gem_wait@wait@all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6044/fi-icl-y/igt@gem_wait@wait@all.html">INCOMPLETE</a> +1 similar issue</p>
</li>
<li>
<p>fi-kbl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/fi-kbl-guc/igt@gem_wait@wait@all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6044/fi-kbl-guc/igt@gem_wait@wait@all.html">INCOMPLETE</a> +1 similar issue</p>
</li>
<li>
<p>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/fi-bsw-nick/igt@gem_wait@wait@all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6044/fi-bsw-nick/igt@gem_wait@wait@all.html">FAIL</a> +1 similar issue</p>
</li>
<li>
<p>fi-kbl-7500u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/fi-kbl-7500u/igt@gem_wait@wait@all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6044/fi-kbl-7500u/igt@gem_wait@wait@all.html">INCOMPLETE</a> +1 similar issue</p>
</li>
<li>
<p>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/fi-bsw-kefka/igt@gem_wait@wait@all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6044/fi-bsw-kefka/igt@gem_wait@wait@all.html">FAIL</a> +1 similar issue</p>
</li>
<li>
<p>fi-glk-dsi:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/fi-glk-dsi/igt@gem_wait@wait@all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6044/fi-glk-dsi/igt@gem_wait@wait@all.html">INCOMPLETE</a> +1 similar issue</p>
</li>
<li>
<p>fi-cfl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/fi-cfl-guc/igt@gem_wait@wait@all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6044/fi-cfl-guc/igt@gem_wait@wait@all.html">INCOMPLETE</a> +1 similar issue</p>
</li>
<li>
<p>fi-ilk-650:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/fi-ilk-650/igt@gem_wait@wait@all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6044/fi-ilk-650/igt@gem_wait@wait@all.html">FAIL</a> +1 similar issue</p>
</li>
<li>
<p>fi-skl-6700k2:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/fi-skl-6700k2/igt@gem_wait@wait@all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6044/fi-skl-6700k2/igt@gem_wait@wait@all.html">INCOMPLETE</a> +1 similar issue</p>
</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@gem_wait@busy@all:</p>
<ul>
<li>{fi-tgl-dsi}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/fi-tgl-dsi/igt@gem_wait@busy@all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6044/fi-tgl-dsi/igt@gem_wait@busy@all.html">INCOMPLETE</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_wait@wait@all:</p>
<ul>
<li>
<p>{fi-hsw-gt1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/fi-hsw-gt1/igt@gem_wait@wait@all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6044/fi-hsw-gt1/igt@gem_wait@wait@all.html">FAIL</a> +1 similar issue</p>
</li>
<li>
<p>{fi-ehl-2}:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/fi-ehl-2/igt@gem_wait@wait@all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6044/fi-ehl-2/igt@gem_wait@wait@all.html">INCOMPLETE</a> +1 similar issue</p>
</li>
<li>
<p>{fi-jsl-1}:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/fi-jsl-1/igt@gem_wait@wait@all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6044/fi-jsl-1/igt@gem_wait@wait@all.html">INCOMPLETE</a> +1 similar issue</p>
</li>
<li>
<p>{fi-tgl-1115g4}:    <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/fi-tgl-1115g4/igt@gem_wait@wait@all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6044/fi-tgl-1115g4/igt@gem_wait@wait@all.html">INCOMPLETE</a> +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>{fi-ehl-2}:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/fi-ehl-2/igt@i915_selftest@live@gt_heartbeat.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6044/fi-ehl-2/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6044 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@i915_selftest@live@execlists:<ul>
<li>fi-kbl-soraka:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/fi-kbl-soraka/igt@i915_selftest@live@execlists.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6044/fi-kbl-soraka/igt@i915_selftest@live@execlists.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2782">i915#2782</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/794">i915#794</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@gem_exec_suspend@basic-s0:<ul>
<li>{fi-tgl-1115g4}:    <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/fi-tgl-1115g4/igt@gem_exec_suspend@basic-s0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1888">i915#1888</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6044/fi-tgl-1115g4/igt@gem_exec_suspend@basic-s0.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (38 -&gt; 35)</h2>
<p>Missing    (3): fi-ilk-m540 fi-bdw-samus fi-hsw-4200u </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6147 -&gt; IGTPW_6044</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_10368: e7afa0ebe24f6a74724bad8bbefbefce534e466d @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_6044: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6044/index.html<br />
  IGT_6147: f3994c2cd99a1acfe991a8cc838a387dcb36598a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<p>== Testlist changes ==</p>
<p>+igt@gem_softpin@allocator-evict<br />
+igt@gem_softpin@allocator-evict-all-engines</p>

</body>
</html>

--===============3759682075821468084==--

--===============0837551916==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0837551916==--
