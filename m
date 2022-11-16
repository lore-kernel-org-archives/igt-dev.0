Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============0216039821406464755=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Date: Wed, 16 Nov 2022 18:55:06 -0000
Message-ID: <166862490676.29190.15323984224246019383@emeril.freedesktop.org>
References: <20221115103424.109524-1-matthew.auld@intel.com>
In-Reply-To: <20221115103424.109524-1-matthew.auld@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/madvise=3A_verify_async_eviction_with_madvise_=28rev2=29?=
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

--===============0216039821406464755==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/i915/madvise: verify async eviction with madvise (rev2)
URL   : https://patchwork.freedesktop.org/series/110908/
State : success

== Summary ==

CI Bug Log - changes from IGT_7062 -> IGTPW_8119
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8119/index.html

Participating hosts (38 -> 38)
------------------------------

  Additional (3): bat-kbl-2 fi-snb-2520m bat-jsl-3 
  Missing    (3): fi-kbl-soraka fi-hsw-4770 bat-dg1-6 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_8119:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-2:
    - {bat-dg2-11}:       [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7062/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-2.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8119/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-2.html

  
Known issues
------------

  Here are the changes found in IGTPW_8119 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_suspend@basic-s3@smem:
    - fi-rkl-11600:       NOTRUN -> [FAIL][3] ([fdo#103375])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8119/fi-rkl-11600/igt@gem_exec_suspend@basic-s3@smem.html

  * igt@i915_selftest@live@gt_heartbeat:
    - fi-bxt-dsi:         [PASS][4] -> [DMESG-FAIL][5] ([i915#5334])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7062/fi-bxt-dsi/igt@i915_selftest@live@gt_heartbeat.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8119/fi-bxt-dsi/igt@i915_selftest@live@gt_heartbeat.html

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-rkl-11600:       NOTRUN -> [SKIP][6] ([fdo#111827])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8119/fi-rkl-11600/igt@kms_chamelium@common-hpd-after-suspend.html

  * igt@kms_chamelium@hdmi-crc-fast:
    - fi-snb-2520m:       NOTRUN -> [SKIP][7] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8119/fi-snb-2520m/igt@kms_chamelium@hdmi-crc-fast.html

  * igt@prime_vgem@basic-fence-flip:
    - fi-snb-2520m:       NOTRUN -> [SKIP][8] ([fdo#109271]) +22 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8119/fi-snb-2520m/igt@prime_vgem@basic-fence-flip.html

  
#### Possible fixes ####

  * igt@gem_exec_gttfill@basic:
    - fi-pnv-d510:        [FAIL][9] ([i915#7229]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7062/fi-pnv-d510/igt@gem_exec_gttfill@basic.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8119/fi-pnv-d510/igt@gem_exec_gttfill@basic.html

  * igt@i915_module_load@load:
    - {bat-dg2-8}:        [FAIL][11] ([i915#7328]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7062/bat-dg2-8/igt@i915_module_load@load.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8119/bat-dg2-8/igt@i915_module_load@load.html

  * igt@i915_suspend@basic-s3-without-i915:
    - fi-rkl-11600:       [INCOMPLETE][13] ([i915#4817]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7062/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8119/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1155]: https://gitlab.freedesktop.org/drm/intel/issues/1155
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#3003]: https://gitlab.freedesktop.org/drm/intel/issues/3003
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#4215]: https://gitlab.freedesktop.org/drm/intel/issues/4215
  [i915#4579]: https://gitlab.freedesktop.org/drm/intel/issues/4579
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4817]: https://gitlab.freedesktop.org/drm/intel/issues/4817
  [i915#4873]: https://gitlab.freedesktop.org/drm/intel/issues/4873
  [i915#5190]: https://gitlab.freedesktop.org/drm/intel/issues/5190
  [i915#5274]: https://gitlab.freedesktop.org/drm/intel/issues/5274
  [i915#5278]: https://gitlab.freedesktop.org/drm/intel/issues/5278
  [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
  [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
  [i915#6434]: https://gitlab.freedesktop.org/drm/intel/issues/6434
  [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
  [i915#6645]: https://gitlab.freedesktop.org/drm/intel/issues/6645
  [i915#7229]: https://gitlab.freedesktop.org/drm/intel/issues/7229
  [i915#7328]: https://gitlab.freedesktop.org/drm/intel/issues/7328
  [i915#7346]: https://gitlab.freedesktop.org/drm/intel/issues/7346
  [i915#7456]: https://gitlab.freedesktop.org/drm/intel/issues/7456
  [i915#7498]: https://gitlab.freedesktop.org/drm/intel/issues/7498


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7062 -> IGTPW_8119

  CI-20190529: 20190529
  CI_DRM_12389: 3eb60fea7cd44530f85bd9362508647aceea1dea @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8119: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8119/index.html
  IGT_7062: 6539ea5fe17fce683133c45f07fac316593ee1f7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@gem_madvise@dontneed-evict-race

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8119/index.html

--===============0216039821406464755==
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
<tr><td><b>Series:</b></td><td>tests/i915/madvise: verify async eviction with madvise (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/110908/">https://patchwork.freedesktop.org/series/110908/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8119/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8119/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7062 -&gt; IGTPW_8119</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8119/index.html</p>
<h2>Participating hosts (38 -&gt; 38)</h2>
<p>Additional (3): bat-kbl-2 fi-snb-2520m bat-jsl-3 <br />
  Missing    (3): fi-kbl-soraka fi-hsw-4770 bat-dg1-6 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_8119:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-2:<ul>
<li>{bat-dg2-11}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7062/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8119/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-2.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8119 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s3@smem:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8119/fi-rkl-11600/igt@gem_exec_suspend@basic-s3@smem.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=103375">fdo#103375</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>fi-bxt-dsi:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7062/fi-bxt-dsi/igt@i915_selftest@live@gt_heartbeat.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8119/fi-bxt-dsi/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5334">i915#5334</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@common-hpd-after-suspend:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8119/fi-rkl-11600/igt@kms_chamelium@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-crc-fast:</p>
<ul>
<li>fi-snb-2520m:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8119/fi-snb-2520m/igt@kms_chamelium@hdmi-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>fi-snb-2520m:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8119/fi-snb-2520m/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +22 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_gttfill@basic:</p>
<ul>
<li>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7062/fi-pnv-d510/igt@gem_exec_gttfill@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7229">i915#7229</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8119/fi-pnv-d510/igt@gem_exec_gttfill@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>{bat-dg2-8}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7062/bat-dg2-8/igt@i915_module_load@load.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7328">i915#7328</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8119/bat-dg2-8/igt@i915_module_load@load.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7062/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4817">i915#4817</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8119/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7062 -&gt; IGTPW_8119</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12389: 3eb60fea7cd44530f85bd9362508647aceea1dea @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8119: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8119/index.html<br />
  IGT_7062: 6539ea5fe17fce683133c45f07fac316593ee1f7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@gem_madvise@dontneed-evict-race</p>

</body>
</html>

--===============0216039821406464755==--
