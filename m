Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============5678777937098053435=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nidhi Gupta" <nidhi1.gupta@intel.com>
Date: Mon, 28 Feb 2022 11:59:45 -0000
Message-ID: <164604958597.6631.9374264640646350043@emeril.freedesktop.org>
References: <20220228104623.12757-1-nidhi1.gupta@intel.com>
In-Reply-To: <20220228104623.12757-1-nidhi1.gupta@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgSUdUIGNs?=
 =?utf-8?q?eanup_=28rev2=29?=
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

--===============5678777937098053435==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: IGT cleanup (rev2)
URL   : https://patchwork.freedesktop.org/series/100801/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_11296 -> IGTPW_6713
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6713/index.html

Participating hosts (43 -> 41)
------------------------------

  Additional (1): fi-pnv-d510 
  Missing    (3): fi-bsw-cyan shard-tglu fi-bdw-samus 

Known issues
------------

  Here are the changes found in IGTPW_6713 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_flink_basic@bad-flink:
    - fi-skl-6600u:       [PASS][1] -> [INCOMPLETE][2] ([i915#4547])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11296/fi-skl-6600u/igt@gem_flink_basic@bad-flink.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6713/fi-skl-6600u/igt@gem_flink_basic@bad-flink.html

  * igt@i915_pm_rps@basic-api:
    - bat-dg1-5:          [PASS][3] -> [FAIL][4] ([i915#4032])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11296/bat-dg1-5/igt@i915_pm_rps@basic-api.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6713/bat-dg1-5/igt@i915_pm_rps@basic-api.html

  * igt@i915_selftest@live@execlists:
    - fi-bsw-nick:        [PASS][5] -> [INCOMPLETE][6] ([i915#2940])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11296/fi-bsw-nick/igt@i915_selftest@live@execlists.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6713/fi-bsw-nick/igt@i915_selftest@live@execlists.html

  * igt@i915_selftest@live@hangcheck:
    - fi-snb-2600:        [PASS][7] -> [INCOMPLETE][8] ([i915#3921])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11296/fi-snb-2600/igt@i915_selftest@live@hangcheck.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6713/fi-snb-2600/igt@i915_selftest@live@hangcheck.html

  * igt@prime_vgem@basic-userptr:
    - fi-pnv-d510:        NOTRUN -> [SKIP][9] ([fdo#109271]) +57 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6713/fi-pnv-d510/igt@prime_vgem@basic-userptr.html

  * igt@runner@aborted:
    - fi-bsw-nick:        NOTRUN -> [FAIL][10] ([fdo#109271] / [i915#1436] / [i915#3428] / [i915#4312])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6713/fi-bsw-nick/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@i915_pm_rpm@module-reload:
    - fi-kbl-guc:         [SKIP][11] ([fdo#109271]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11296/fi-kbl-guc/igt@i915_pm_rpm@module-reload.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6713/fi-kbl-guc/igt@i915_pm_rpm@module-reload.html

  
#### Warnings ####

  * igt@i915_selftest@live@hangcheck:
    - bat-dg1-5:          [DMESG-FAIL][13] ([i915#4957]) -> [DMESG-FAIL][14] ([i915#4494] / [i915#4957])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11296/bat-dg1-5/igt@i915_selftest@live@hangcheck.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6713/bat-dg1-5/igt@i915_selftest@live@hangcheck.html
    - bat-dg1-6:          [DMESG-FAIL][15] ([i915#4957]) -> [DMESG-FAIL][16] ([i915#4494] / [i915#4957])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11296/bat-dg1-6/igt@i915_selftest@live@hangcheck.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6713/bat-dg1-6/igt@i915_selftest@live@hangcheck.html

  * igt@runner@aborted:
    - fi-skl-6600u:       [FAIL][17] ([i915#4312]) -> [FAIL][18] ([i915#2722] / [i915#4312])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11296/fi-skl-6600u/igt@runner@aborted.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6713/fi-skl-6600u/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#2722]: https://gitlab.freedesktop.org/drm/intel/issues/2722
  [i915#2940]: https://gitlab.freedesktop.org/drm/intel/issues/2940
  [i915#3428]: https://gitlab.freedesktop.org/drm/intel/issues/3428
  [i915#3576]: https://gitlab.freedesktop.org/drm/intel/issues/3576
  [i915#3921]: https://gitlab.freedesktop.org/drm/intel/issues/3921
  [i915#4032]: https://gitlab.freedesktop.org/drm/intel/issues/4032
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4494]: https://gitlab.freedesktop.org/drm/intel/issues/4494
  [i915#4547]: https://gitlab.freedesktop.org/drm/intel/issues/4547
  [i915#4957]: https://gitlab.freedesktop.org/drm/intel/issues/4957


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6359 -> IGTPW_6713

  CI-20190529: 20190529
  CI_DRM_11296: 8dae787ba8b9f6d29baaa82902f4d50af94ae058 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6713: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6713/index.html
  IGT_6359: 57049558c452272b27eeb099fac07e55a924bbf9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6713/index.html

--===============5678777937098053435==
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
<tr><td><b>Series:</b></td><td>IGT cleanup (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/100801/">https://patchwork.freedesktop.org/series/100801/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6713/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6713/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11296 -&gt; IGTPW_6713</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6713/index.html</p>
<h2>Participating hosts (43 -&gt; 41)</h2>
<p>Additional (1): fi-pnv-d510 <br />
  Missing    (3): fi-bsw-cyan shard-tglu fi-bdw-samus </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6713 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_flink_basic@bad-flink:</p>
<ul>
<li>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11296/fi-skl-6600u/igt@gem_flink_basic@bad-flink.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6713/fi-skl-6600u/igt@gem_flink_basic@bad-flink.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4547">i915#4547</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>bat-dg1-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11296/bat-dg1-5/igt@i915_pm_rps@basic-api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6713/bat-dg1-5/igt@i915_pm_rps@basic-api.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4032">i915#4032</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11296/fi-bsw-nick/igt@i915_selftest@live@execlists.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6713/fi-bsw-nick/igt@i915_selftest@live@execlists.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2940">i915#2940</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>fi-snb-2600:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11296/fi-snb-2600/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6713/fi-snb-2600/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3921">i915#3921</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-userptr:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6713/fi-pnv-d510/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +57 similar issues</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6713/fi-bsw-nick/igt@runner@aborted.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3428">i915#3428</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_pm_rpm@module-reload:<ul>
<li>fi-kbl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11296/fi-kbl-guc/igt@i915_pm_rpm@module-reload.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6713/fi-kbl-guc/igt@i915_pm_rpm@module-reload.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>
<p>bat-dg1-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11296/bat-dg1-5/igt@i915_selftest@live@hangcheck.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4957">i915#4957</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6713/bat-dg1-5/igt@i915_selftest@live@hangcheck.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4494">i915#4494</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4957">i915#4957</a>)</p>
</li>
<li>
<p>bat-dg1-6:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11296/bat-dg1-6/igt@i915_selftest@live@hangcheck.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4957">i915#4957</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6713/bat-dg1-6/igt@i915_selftest@live@hangcheck.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4494">i915#4494</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4957">i915#4957</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11296/fi-skl-6600u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6713/fi-skl-6600u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2722">i915#2722</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6359 -&gt; IGTPW_6713</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11296: 8dae787ba8b9f6d29baaa82902f4d50af94ae058 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_6713: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6713/index.html<br />
  IGT_6359: 57049558c452272b27eeb099fac07e55a924bbf9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============5678777937098053435==--
