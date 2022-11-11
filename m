Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============7461950750144724042=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tvrtko Ursulin" <tvrtko.ursulin@linux.intel.com>
Date: Fri, 11 Nov 2022 17:22:54 -0000
Message-ID: <166818737476.873.15580289073608659835@emeril.freedesktop.org>
References: <20221111155844.3290531-1-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20221111155844.3290531-1-tvrtko.ursulin@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgVmVuZG9y?=
 =?utf-8?q?_agnostic_gputop_=28rev4=29?=
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

--===============7461950750144724042==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Vendor agnostic gputop (rev4)
URL   : https://patchwork.freedesktop.org/series/102175/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_12371 -> IGTPW_8087
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8087/index.html

Participating hosts (41 -> 40)
------------------------------

  Missing    (1): fi-ctg-p8600 

Known issues
------------

  Here are the changes found in IGTPW_8087 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@gt_engines:
    - bat-dg1-6:          [PASS][1] -> [INCOMPLETE][2] ([i915#4418])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12371/bat-dg1-6/igt@i915_selftest@live@gt_engines.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8087/bat-dg1-6/igt@i915_selftest@live@gt_engines.html

  * igt@runner@aborted:
    - bat-dg1-6:          NOTRUN -> [FAIL][3] ([i915#4312])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8087/bat-dg1-6/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@fbdev@read:
    - {bat-rpls-2}:       [SKIP][4] ([i915#2582]) -> [PASS][5] +4 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12371/bat-rpls-2/igt@fbdev@read.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8087/bat-rpls-2/igt@fbdev@read.html

  * igt@gem_exec_suspend@basic-s0@smem:
    - {bat-rplp-1}:       [DMESG-WARN][6] ([i915#2867]) -> [PASS][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12371/bat-rplp-1/igt@gem_exec_suspend@basic-s0@smem.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8087/bat-rplp-1/igt@gem_exec_suspend@basic-s0@smem.html

  * igt@i915_module_load@load:
    - {bat-dg2-8}:        [FAIL][8] ([i915#7328]) -> [PASS][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12371/bat-dg2-8/igt@i915_module_load@load.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8087/bat-dg2-8/igt@i915_module_load@load.html

  * igt@i915_pm_rpm@module-reload:
    - {bat-rpls-2}:       [WARN][10] ([i915#7346]) -> [PASS][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12371/bat-rpls-2/igt@i915_pm_rpm@module-reload.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8087/bat-rpls-2/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live@slpc:
    - {bat-adln-1}:       [DMESG-FAIL][12] ([i915#6997]) -> [PASS][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12371/bat-adln-1/igt@i915_selftest@live@slpc.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8087/bat-adln-1/igt@i915_selftest@live@slpc.html

  * igt@i915_suspend@basic-s3-without-i915:
    - {bat-kbl-2}:        [INCOMPLETE][14] ([i915#4817]) -> [PASS][15]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12371/bat-kbl-2/igt@i915_suspend@basic-s3-without-i915.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8087/bat-kbl-2/igt@i915_suspend@basic-s3-without-i915.html

  * igt@kms_frontbuffer_tracking@basic:
    - {bat-rpls-2}:       [SKIP][16] ([i915#1849]) -> [PASS][17]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12371/bat-rpls-2/igt@kms_frontbuffer_tracking@basic.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8087/bat-rpls-2/igt@kms_frontbuffer_tracking@basic.html

  * igt@prime_vgem@basic-fence-flip:
    - {bat-rpls-2}:       [SKIP][18] ([fdo#109295] / [i915#1845] / [i915#3708]) -> [PASS][19]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12371/bat-rpls-2/igt@prime_vgem@basic-fence-flip.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8087/bat-rpls-2/igt@prime_vgem@basic-fence-flip.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1155]: https://gitlab.freedesktop.org/drm/intel/issues/1155
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#2867]: https://gitlab.freedesktop.org/drm/intel/issues/2867
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#4215]: https://gitlab.freedesktop.org/drm/intel/issues/4215
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4418]: https://gitlab.freedesktop.org/drm/intel/issues/4418
  [i915#4579]: https://gitlab.freedesktop.org/drm/intel/issues/4579
  [i915#4817]: https://gitlab.freedesktop.org/drm/intel/issues/4817
  [i915#4873]: https://gitlab.freedesktop.org/drm/intel/issues/4873
  [i915#5190]: https://gitlab.freedesktop.org/drm/intel/issues/5190
  [i915#5274]: https://gitlab.freedesktop.org/drm/intel/issues/5274
  [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
  [i915#6367]: https://gitlab.freedesktop.org/drm/intel/issues/6367
  [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
  [i915#6645]: https://gitlab.freedesktop.org/drm/intel/issues/6645
  [i915#6997]: https://gitlab.freedesktop.org/drm/intel/issues/6997
  [i915#7328]: https://gitlab.freedesktop.org/drm/intel/issues/7328
  [i915#7346]: https://gitlab.freedesktop.org/drm/intel/issues/7346
  [i915#7498]: https://gitlab.freedesktop.org/drm/intel/issues/7498


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7051 -> IGTPW_8087

  CI-20190529: 20190529
  CI_DRM_12371: 3abfcf048c08ca9c7bbaba0c57c699453fd37a2e @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8087: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8087/index.html
  IGT_7051: 7da9f813cdacb80d4471fc6ddb493bae9c46913d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8087/index.html

--===============7461950750144724042==
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
<tr><td><b>Series:</b></td><td>Vendor agnostic gputop (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/102175/">https://patchwork.freedesktop.org/series/102175/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8087/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8087/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12371 -&gt; IGTPW_8087</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8087/index.html</p>
<h2>Participating hosts (41 -&gt; 40)</h2>
<p>Missing    (1): fi-ctg-p8600 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8087 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live@gt_engines:</p>
<ul>
<li>bat-dg1-6:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12371/bat-dg1-6/igt@i915_selftest@live@gt_engines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8087/bat-dg1-6/igt@i915_selftest@live@gt_engines.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4418">i915#4418</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8087/bat-dg1-6/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>{bat-rpls-2}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12371/bat-rpls-2/igt@fbdev@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2582">i915#2582</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8087/bat-rpls-2/igt@fbdev@read.html">PASS</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s0@smem:</p>
<ul>
<li>{bat-rplp-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12371/bat-rplp-1/igt@gem_exec_suspend@basic-s0@smem.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2867">i915#2867</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8087/bat-rplp-1/igt@gem_exec_suspend@basic-s0@smem.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>{bat-dg2-8}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12371/bat-dg2-8/igt@i915_module_load@load.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7328">i915#7328</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8087/bat-dg2-8/igt@i915_module_load@load.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>{bat-rpls-2}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12371/bat-rpls-2/igt@i915_pm_rpm@module-reload.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7346">i915#7346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8087/bat-rpls-2/igt@i915_pm_rpm@module-reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@slpc:</p>
<ul>
<li>{bat-adln-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12371/bat-adln-1/igt@i915_selftest@live@slpc.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6997">i915#6997</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8087/bat-adln-1/igt@i915_selftest@live@slpc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>{bat-kbl-2}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12371/bat-kbl-2/igt@i915_suspend@basic-s3-without-i915.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4817">i915#4817</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8087/bat-kbl-2/igt@i915_suspend@basic-s3-without-i915.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>{bat-rpls-2}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12371/bat-rpls-2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8087/bat-rpls-2/igt@kms_frontbuffer_tracking@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>{bat-rpls-2}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12371/bat-rpls-2/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8087/bat-rpls-2/igt@prime_vgem@basic-fence-flip.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7051 -&gt; IGTPW_8087</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12371: 3abfcf048c08ca9c7bbaba0c57c699453fd37a2e @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8087: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8087/index.html<br />
  IGT_7051: 7da9f813cdacb80d4471fc6ddb493bae9c46913d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============7461950750144724042==--
