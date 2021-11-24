Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============1622439461482879077=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 24 Nov 2021 21:57:14 -0000
Message-ID: <163779103419.25293.888517557791389313@emeril.freedesktop.org>
References: <20211124211002.114989-1-jose.souza@intel.com>
In-Reply-To: <20211124211002.114989-1-jose.souza@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fcursor=5Flegacy=3A_Disable_Intel=27s_PSR2_selective_fetch?=
 =?utf-8?q?_in_this_test_=28rev3=29?=
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
To: =?utf-8?q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1622439461482879077==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_cursor_legacy: Disable Intel's PSR2 selective fetch in this test (rev3)
URL   : https://patchwork.freedesktop.org/series/97212/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_10924 -> IGTPW_6433
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6433/index.html

Participating hosts (48 -> 34)
------------------------------

  Missing    (14): fi-kbl-soraka fi-ilk-m540 bat-dg1-6 bat-dg1-5 fi-hsw-4200u fi-skl-guc fi-icl-u2 fi-bsw-cyan bat-adlp-6 bat-adlp-4 fi-ctg-p8600 fi-bdw-samus bat-jsl-2 bat-jsl-1 

Known issues
------------

  Here are the changes found in IGTPW_6433 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_suspend@basic-s0:
    - fi-tgl-u2:          [PASS][1] -> [FAIL][2] ([i915#1888])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10924/fi-tgl-u2/igt@gem_exec_suspend@basic-s0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6433/fi-tgl-u2/igt@gem_exec_suspend@basic-s0.html
    - fi-tgl-1115g4:      [PASS][3] -> [FAIL][4] ([i915#1888])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10924/fi-tgl-1115g4/igt@gem_exec_suspend@basic-s0.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6433/fi-tgl-1115g4/igt@gem_exec_suspend@basic-s0.html

  * igt@gem_exec_suspend@basic-s3:
    - fi-bdw-5557u:       [PASS][5] -> [INCOMPLETE][6] ([i915#146])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10924/fi-bdw-5557u/igt@gem_exec_suspend@basic-s3.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6433/fi-bdw-5557u/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_flink_basic@bad-flink:
    - fi-skl-6600u:       NOTRUN -> [FAIL][7] ([i915#4547])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6433/fi-skl-6600u/igt@gem_flink_basic@bad-flink.html

  * igt@kms_frontbuffer_tracking@basic:
    - fi-cml-u2:          [PASS][8] -> [DMESG-WARN][9] ([i915#4269])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10924/fi-cml-u2/igt@kms_frontbuffer_tracking@basic.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6433/fi-cml-u2/igt@kms_frontbuffer_tracking@basic.html

  * igt@runner@aborted:
    - fi-skl-6600u:       NOTRUN -> [FAIL][10] ([i915#3363] / [i915#4312])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6433/fi-skl-6600u/igt@runner@aborted.html
    - fi-bsw-nick:        NOTRUN -> [FAIL][11] ([i915#3690])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6433/fi-bsw-nick/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@gem_exec_suspend@basic-s3:
    - fi-skl-6600u:       [INCOMPLETE][12] ([i915#198]) -> [PASS][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10924/fi-skl-6600u/igt@gem_exec_suspend@basic-s3.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6433/fi-skl-6600u/igt@gem_exec_suspend@basic-s3.html

  
  [i915#146]: https://gitlab.freedesktop.org/drm/intel/issues/146
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#198]: https://gitlab.freedesktop.org/drm/intel/issues/198
  [i915#3363]: https://gitlab.freedesktop.org/drm/intel/issues/3363
  [i915#3690]: https://gitlab.freedesktop.org/drm/intel/issues/3690
  [i915#4269]: https://gitlab.freedesktop.org/drm/intel/issues/4269
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4547]: https://gitlab.freedesktop.org/drm/intel/issues/4547


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6288 -> IGTPW_6433

  CI-20190529: 20190529
  CI_DRM_10924: ba551d92d19db25d085cde572852bf6c08c7e750 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6433: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6433/index.html
  IGT_6288: a5ac2c3e67bc9a9c8d3f440a0324ee2c5d49eb49 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6433/index.html

--===============1622439461482879077==
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
<tr><td><b>Series:</b></td><td>tests/kms_cursor_legacy: Disable Intel&#39;s PSR2 selective fetch in this test (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/97212/">https://patchwork.freedesktop.org/series/97212/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6433/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6433/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10924 -&gt; IGTPW_6433</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6433/index.html</p>
<h2>Participating hosts (48 -&gt; 34)</h2>
<p>Missing    (14): fi-kbl-soraka fi-ilk-m540 bat-dg1-6 bat-dg1-5 fi-hsw-4200u fi-skl-guc fi-icl-u2 fi-bsw-cyan bat-adlp-6 bat-adlp-4 fi-ctg-p8600 fi-bdw-samus bat-jsl-2 bat-jsl-1 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6433 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s0:</p>
<ul>
<li>
<p>fi-tgl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10924/fi-tgl-u2/igt@gem_exec_suspend@basic-s0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6433/fi-tgl-u2/igt@gem_exec_suspend@basic-s0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1888">i915#1888</a>)</p>
</li>
<li>
<p>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10924/fi-tgl-1115g4/igt@gem_exec_suspend@basic-s0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6433/fi-tgl-1115g4/igt@gem_exec_suspend@basic-s0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1888">i915#1888</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>fi-bdw-5557u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10924/fi-bdw-5557u/igt@gem_exec_suspend@basic-s3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6433/fi-bdw-5557u/igt@gem_exec_suspend@basic-s3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/146">i915#146</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_flink_basic@bad-flink:</p>
<ul>
<li>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6433/fi-skl-6600u/igt@gem_flink_basic@bad-flink.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4547">i915#4547</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>fi-cml-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10924/fi-cml-u2/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6433/fi-cml-u2/igt@kms_frontbuffer_tracking@basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4269">i915#4269</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6433/fi-skl-6600u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</p>
</li>
<li>
<p>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6433/fi-bsw-nick/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3690">i915#3690</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@gem_exec_suspend@basic-s3:<ul>
<li>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10924/fi-skl-6600u/igt@gem_exec_suspend@basic-s3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/198">i915#198</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6433/fi-skl-6600u/igt@gem_exec_suspend@basic-s3.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6288 -&gt; IGTPW_6433</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_10924: ba551d92d19db25d085cde572852bf6c08c7e750 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_6433: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6433/index.html<br />
  IGT_6288: a5ac2c3e67bc9a9c8d3f440a0324ee2c5d49eb49 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============1622439461482879077==--
