Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============6556860940807934697=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Das, Nirmoy" <nirmoy.das@intel.com>
Date: Thu, 11 May 2023 19:38:58 -0000
Message-ID: <168383393860.29009.3981532439452384519@emeril.freedesktop.org>
References: <20230511152251.18043-1-nirmoy.das@intel.com>
In-Reply-To: <20230511152251.18043-1-nirmoy.das@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdC9w?=
 =?utf-8?q?rime=5Fvgem=3A_Remove_test=5Fuserptr_test_=28rev2=29?=
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

--===============6556860940807934697==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: test/prime_vgem: Remove test_userptr test (rev2)
URL   : https://patchwork.freedesktop.org/series/117633/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_13138 -> IGTPW_8944
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with IGTPW_8944 need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_8944, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8944/index.html

Participating hosts (41 -> 39)
------------------------------

  Missing    (2): fi-kbl-soraka fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_8944:

### IGT changes ###

#### Warnings ####

  * igt@prime_vgem@basic-userptr:
    - bat-dg2-9:          [SKIP][1] ([i915#3708] / [i915#4873]) -> [SKIP][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13138/bat-dg2-9/igt@prime_vgem@basic-userptr.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8944/bat-dg2-9/igt@prime_vgem@basic-userptr.html
    - bat-dg2-11:         [SKIP][3] ([i915#3708] / [i915#4873]) -> [SKIP][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13138/bat-dg2-11/igt@prime_vgem@basic-userptr.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8944/bat-dg2-11/igt@prime_vgem@basic-userptr.html
    - bat-dg2-8:          [SKIP][5] ([i915#3708] / [i915#4873]) -> [SKIP][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13138/bat-dg2-8/igt@prime_vgem@basic-userptr.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8944/bat-dg2-8/igt@prime_vgem@basic-userptr.html
    - bat-adlm-1:         [SKIP][7] ([i915#3708]) -> [SKIP][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13138/bat-adlm-1/igt@prime_vgem@basic-userptr.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8944/bat-adlm-1/igt@prime_vgem@basic-userptr.html
    - bat-dg1-5:          [SKIP][9] ([i915#3708] / [i915#4873]) -> [SKIP][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13138/bat-dg1-5/igt@prime_vgem@basic-userptr.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8944/bat-dg1-5/igt@prime_vgem@basic-userptr.html
    - bat-dg1-7:          [SKIP][11] ([i915#3708] / [i915#4873]) -> [SKIP][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13138/bat-dg1-7/igt@prime_vgem@basic-userptr.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8944/bat-dg1-7/igt@prime_vgem@basic-userptr.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@prime_vgem@basic-userptr:
    - {bat-mtlp-6}:       [FAIL][13] ([i915#8368]) -> [SKIP][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13138/bat-mtlp-6/igt@prime_vgem@basic-userptr.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8944/bat-mtlp-6/igt@prime_vgem@basic-userptr.html
    - {bat-mtlp-8}:       [FAIL][15] ([i915#8368]) -> [SKIP][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13138/bat-mtlp-8/igt@prime_vgem@basic-userptr.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8944/bat-mtlp-8/igt@prime_vgem@basic-userptr.html

  
Known issues
------------

  Here are the changes found in IGTPW_8944 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@migrate:
    - bat-dg2-11:         [PASS][17] -> [DMESG-WARN][18] ([i915#7699] / [i915#7953])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13138/bat-dg2-11/igt@i915_selftest@live@migrate.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8944/bat-dg2-11/igt@i915_selftest@live@migrate.html

  * igt@i915_selftest@live@requests:
    - bat-rpls-2:         [PASS][19] -> [ABORT][20] ([i915#4983] / [i915#7913])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13138/bat-rpls-2/igt@i915_selftest@live@requests.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8944/bat-rpls-2/igt@i915_selftest@live@requests.html

  * igt@i915_selftest@live@slpc:
    - bat-rpls-1:         [PASS][21] -> [DMESG-WARN][22] ([i915#6367] / [i915#7953])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13138/bat-rpls-1/igt@i915_selftest@live@slpc.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8944/bat-rpls-1/igt@i915_selftest@live@slpc.html

  
#### Possible fixes ####

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-1:
    - bat-dg2-8:          [FAIL][23] ([i915#7932]) -> [PASS][24]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13138/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-1.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8944/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-1.html

  
#### Warnings ####

  * igt@kms_setmode@basic-clone-single-crtc:
    - bat-rplp-1:         [SKIP][25] ([i915#3555] / [i915#4579]) -> [ABORT][26] ([i915#4579] / [i915#8260])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13138/bat-rplp-1/igt@kms_setmode@basic-clone-single-crtc.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8944/bat-rplp-1/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@prime_vgem@basic-userptr:
    - bat-rpls-2:         [SKIP][27] ([fdo#109295] / [i915#3708]) -> [SKIP][28] ([fdo#109295])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13138/bat-rpls-2/igt@prime_vgem@basic-userptr.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8944/bat-rpls-2/igt@prime_vgem@basic-userptr.html
    - fi-tgl-1115g4:      [SKIP][29] ([fdo#109295] / [i915#3301]) -> [SKIP][30] ([fdo#109295])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13138/fi-tgl-1115g4/igt@prime_vgem@basic-userptr.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8944/fi-tgl-1115g4/igt@prime_vgem@basic-userptr.html
    - bat-jsl-3:          [SKIP][31] ([fdo#109295] / [i915#3301]) -> [SKIP][32] ([fdo#109295] / [fdo#112080])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13138/bat-jsl-3/igt@prime_vgem@basic-userptr.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8944/bat-jsl-3/igt@prime_vgem@basic-userptr.html
    - bat-jsl-1:          [SKIP][33] ([fdo#109295] / [i915#3301]) -> [SKIP][34] ([fdo#109295] / [fdo#112080])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13138/bat-jsl-1/igt@prime_vgem@basic-userptr.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8944/bat-jsl-1/igt@prime_vgem@basic-userptr.html
    - bat-rpls-1:         [SKIP][35] ([fdo#109295] / [i915#3708]) -> [SKIP][36] ([fdo#109295])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13138/bat-rpls-1/igt@prime_vgem@basic-userptr.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8944/bat-rpls-1/igt@prime_vgem@basic-userptr.html
    - bat-adlp-9:         [SKIP][37] ([fdo#109295] / [i915#3301] / [i915#3708]) -> [SKIP][38] ([fdo#109295])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13138/bat-adlp-9/igt@prime_vgem@basic-userptr.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8944/bat-adlp-9/igt@prime_vgem@basic-userptr.html
    - fi-rkl-11600:       [SKIP][39] ([fdo#109295] / [i915#3301] / [i915#3708]) -> [SKIP][40] ([fdo#109295])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13138/fi-rkl-11600/igt@prime_vgem@basic-userptr.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8944/fi-rkl-11600/igt@prime_vgem@basic-userptr.html
    - bat-adls-5:         [SKIP][41] ([fdo#109295] / [i915#3301]) -> [SKIP][42] ([fdo#109295])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13138/bat-adls-5/igt@prime_vgem@basic-userptr.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8944/bat-adls-5/igt@prime_vgem@basic-userptr.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#4579]: https://gitlab.freedesktop.org/drm/intel/issues/4579
  [i915#4873]: https://gitlab.freedesktop.org/drm/intel/issues/4873
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#6367]: https://gitlab.freedesktop.org/drm/intel/issues/6367
  [i915#7699]: https://gitlab.freedesktop.org/drm/intel/issues/7699
  [i915#7913]: https://gitlab.freedesktop.org/drm/intel/issues/7913
  [i915#7932]: https://gitlab.freedesktop.org/drm/intel/issues/7932
  [i915#7953]: https://gitlab.freedesktop.org/drm/intel/issues/7953
  [i915#8260]: https://gitlab.freedesktop.org/drm/intel/issues/8260
  [i915#8368]: https://gitlab.freedesktop.org/drm/intel/issues/8368


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7285 -> IGTPW_8944

  CI-20190529: 20190529
  CI_DRM_13138: b35107d813ef012806df9eeeea1ff9f37adf0400 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8944: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8944/index.html
  IGT_7285: d1cbf2bad9c2664ab8bd3bd0946510a52800912f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

-igt@prime_vgem@basic-userptr

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8944/index.html

--===============6556860940807934697==
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
<tr><td><b>Series:</b></td><td>test/prime_vgem: Remove test_userptr test (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/117633/">https://patchwork.freedesktop.org/series/117633/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8944/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8944/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13138 -&gt; IGTPW_8944</h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with IGTPW_8944 need to be verified<br />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_8944, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8944/index.html</p>
<h2>Participating hosts (41 -&gt; 39)</h2>
<p>Missing    (2): fi-kbl-soraka fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_8944:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@prime_vgem@basic-userptr:</p>
<ul>
<li>
<p>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13138/bat-dg2-9/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4873">i915#4873</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8944/bat-dg2-9/igt@prime_vgem@basic-userptr.html">SKIP</a></p>
</li>
<li>
<p>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13138/bat-dg2-11/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4873">i915#4873</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8944/bat-dg2-11/igt@prime_vgem@basic-userptr.html">SKIP</a></p>
</li>
<li>
<p>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13138/bat-dg2-8/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4873">i915#4873</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8944/bat-dg2-8/igt@prime_vgem@basic-userptr.html">SKIP</a></p>
</li>
<li>
<p>bat-adlm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13138/bat-adlm-1/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8944/bat-adlm-1/igt@prime_vgem@basic-userptr.html">SKIP</a></p>
</li>
<li>
<p>bat-dg1-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13138/bat-dg1-5/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4873">i915#4873</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8944/bat-dg1-5/igt@prime_vgem@basic-userptr.html">SKIP</a></p>
</li>
<li>
<p>bat-dg1-7:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13138/bat-dg1-7/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4873">i915#4873</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8944/bat-dg1-7/igt@prime_vgem@basic-userptr.html">SKIP</a></p>
</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@prime_vgem@basic-userptr:</p>
<ul>
<li>
<p>{bat-mtlp-6}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13138/bat-mtlp-6/igt@prime_vgem@basic-userptr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8368">i915#8368</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8944/bat-mtlp-6/igt@prime_vgem@basic-userptr.html">SKIP</a></p>
</li>
<li>
<p>{bat-mtlp-8}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13138/bat-mtlp-8/igt@prime_vgem@basic-userptr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8368">i915#8368</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8944/bat-mtlp-8/igt@prime_vgem@basic-userptr.html">SKIP</a></p>
</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8944 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live@migrate:</p>
<ul>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13138/bat-dg2-11/igt@i915_selftest@live@migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8944/bat-dg2-11/igt@i915_selftest@live@migrate.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7699">i915#7699</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7953">i915#7953</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>bat-rpls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13138/bat-rpls-2/igt@i915_selftest@live@requests.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8944/bat-rpls-2/igt@i915_selftest@live@requests.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4983">i915#4983</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@slpc:</p>
<ul>
<li>bat-rpls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13138/bat-rpls-1/igt@i915_selftest@live@slpc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8944/bat-rpls-1/igt@i915_selftest@live@slpc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6367">i915#6367</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7953">i915#7953</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-1:<ul>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13138/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7932">i915#7932</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8944/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-1.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13138/bat-rplp-1/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8944/bat-rplp-1/igt@kms_setmode@basic-clone-single-crtc.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8260">i915#8260</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-userptr:</p>
<ul>
<li>
<p>bat-rpls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13138/bat-rpls-2/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8944/bat-rpls-2/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a>)</p>
</li>
<li>
<p>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13138/fi-tgl-1115g4/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3301">i915#3301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8944/fi-tgl-1115g4/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a>)</p>
</li>
<li>
<p>bat-jsl-3:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13138/bat-jsl-3/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3301">i915#3301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8944/bat-jsl-3/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=112080">fdo#112080</a>)</p>
</li>
<li>
<p>bat-jsl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13138/bat-jsl-1/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3301">i915#3301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8944/bat-jsl-1/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=112080">fdo#112080</a>)</p>
</li>
<li>
<p>bat-rpls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13138/bat-rpls-1/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8944/bat-rpls-1/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a>)</p>
</li>
<li>
<p>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13138/bat-adlp-9/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3301">i915#3301</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8944/bat-adlp-9/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a>)</p>
</li>
<li>
<p>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13138/fi-rkl-11600/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3301">i915#3301</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8944/fi-rkl-11600/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a>)</p>
</li>
<li>
<p>bat-adls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13138/bat-adls-5/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3301">i915#3301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8944/bat-adls-5/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a>)</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7285 -&gt; IGTPW_8944</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13138: b35107d813ef012806df9eeeea1ff9f37adf0400 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8944: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8944/index.html<br />
  IGT_7285: d1cbf2bad9c2664ab8bd3bd0946510a52800912f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>-igt@prime_vgem@basic-userptr</p>

</body>
</html>

--===============6556860940807934697==--
