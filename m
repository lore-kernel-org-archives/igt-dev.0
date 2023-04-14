Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============2037016881710038141=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Date: Fri, 14 Apr 2023 11:39:00 -0000
Message-ID: <168147234020.26684.6533504494595132959@emeril.freedesktop.org>
References: <20230414083703.1219101-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20230414083703.1219101-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgRml4IEJp?=
 =?utf-8?q?gjoiner_checks_=28rev5=29?=
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

--===============2037016881710038141==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Fix Bigjoiner checks (rev5)
URL   : https://patchwork.freedesktop.org/series/115712/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_13006 -> IGTPW_8804
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with IGTPW_8804 need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_8804, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8804/index.html

Participating hosts (37 -> 36)
------------------------------

  Missing    (1): fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_8804:

### IGT changes ###

#### Warnings ####

  * igt@kms_flip@basic-plain-flip:
    - bat-atsm-1:         [SKIP][1] ([i915#6166]) -> [FAIL][2] +3 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13006/bat-atsm-1/igt@kms_flip@basic-plain-flip.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8804/bat-atsm-1/igt@kms_flip@basic-plain-flip.html

  
Known issues
------------

  Here are the changes found in IGTPW_8804 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_suspend@basic-s3@smem:
    - bat-rpls-1:         NOTRUN -> [ABORT][3] ([i915#6687] / [i915#7978])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8804/bat-rpls-1/igt@gem_exec_suspend@basic-s3@smem.html

  * igt@i915_pm_rps@basic-api:
    - bat-dg2-11:         [PASS][4] -> [FAIL][5] ([i915#8308])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13006/bat-dg2-11/igt@i915_pm_rps@basic-api.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8804/bat-dg2-11/igt@i915_pm_rps@basic-api.html

  * igt@i915_selftest@live@gt_lrc:
    - bat-adln-1:         [PASS][6] -> [INCOMPLETE][7] ([i915#4983] / [i915#7609])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13006/bat-adln-1/igt@i915_selftest@live@gt_lrc.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8804/bat-adln-1/igt@i915_selftest@live@gt_lrc.html

  * igt@i915_selftest@live@slpc:
    - bat-rpls-1:         NOTRUN -> [DMESG-FAIL][8] ([i915#6367])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8804/bat-rpls-1/igt@i915_selftest@live@slpc.html

  * igt@kms_pipe_crc_basic@read-crc:
    - bat-dg2-11:         NOTRUN -> [SKIP][9] ([i915#5354])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8804/bat-dg2-11/igt@kms_pipe_crc_basic@read-crc.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@reset:
    - bat-rpls-1:         [ABORT][10] ([i915#4983]) -> [PASS][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13006/bat-rpls-1/igt@i915_selftest@live@reset.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8804/bat-rpls-1/igt@i915_selftest@live@reset.html

  * igt@i915_suspend@basic-s3-without-i915:
    - {bat-kbl-2}:        [INCOMPLETE][12] ([i915#4817]) -> [PASS][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13006/bat-kbl-2/igt@i915_suspend@basic-s3-without-i915.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8804/bat-kbl-2/igt@i915_suspend@basic-s3-without-i915.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#4817]: https://gitlab.freedesktop.org/drm/intel/issues/4817
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
  [i915#6166]: https://gitlab.freedesktop.org/drm/intel/issues/6166
  [i915#6367]: https://gitlab.freedesktop.org/drm/intel/issues/6367
  [i915#6687]: https://gitlab.freedesktop.org/drm/intel/issues/6687
  [i915#7609]: https://gitlab.freedesktop.org/drm/intel/issues/7609
  [i915#7978]: https://gitlab.freedesktop.org/drm/intel/issues/7978
  [i915#8308]: https://gitlab.freedesktop.org/drm/intel/issues/8308


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7254 -> IGTPW_8804

  CI-20190529: 20190529
  CI_DRM_13006: 24274f6f20ef82b4e14e106b68922152794de8b5 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8804: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8804/index.html
  IGT_7254: 7fab01340a3f360abacd7914015be1ad485363d7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8804/index.html

--===============2037016881710038141==
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
<tr><td><b>Series:</b></td><td>Fix Bigjoiner checks (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/115712/">https://patchwork.freedesktop.org/series/115712/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8804/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8804/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13006 -&gt; IGTPW_8804</h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with IGTPW_8804 need to be verified<br />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_8804, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8804/index.html</p>
<h2>Participating hosts (37 -&gt; 36)</h2>
<p>Missing    (1): fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_8804:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>igt@kms_flip@basic-plain-flip:<ul>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13006/bat-atsm-1/igt@kms_flip@basic-plain-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6166">i915#6166</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8804/bat-atsm-1/igt@kms_flip@basic-plain-flip.html">FAIL</a> +3 similar issues</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8804 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s3@smem:</p>
<ul>
<li>bat-rpls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8804/bat-rpls-1/igt@gem_exec_suspend@basic-s3@smem.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6687">i915#6687</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7978">i915#7978</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13006/bat-dg2-11/igt@i915_pm_rps@basic-api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8804/bat-dg2-11/igt@i915_pm_rps@basic-api.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8308">i915#8308</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_lrc:</p>
<ul>
<li>bat-adln-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13006/bat-adln-1/igt@i915_selftest@live@gt_lrc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8804/bat-adln-1/igt@i915_selftest@live@gt_lrc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4983">i915#4983</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7609">i915#7609</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@slpc:</p>
<ul>
<li>bat-rpls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8804/bat-rpls-1/igt@i915_selftest@live@slpc.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6367">i915#6367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8804/bat-dg2-11/igt@kms_pipe_crc_basic@read-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@reset:</p>
<ul>
<li>bat-rpls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13006/bat-rpls-1/igt@i915_selftest@live@reset.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4983">i915#4983</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8804/bat-rpls-1/igt@i915_selftest@live@reset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>{bat-kbl-2}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13006/bat-kbl-2/igt@i915_suspend@basic-s3-without-i915.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4817">i915#4817</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8804/bat-kbl-2/igt@i915_suspend@basic-s3-without-i915.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7254 -&gt; IGTPW_8804</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13006: 24274f6f20ef82b4e14e106b68922152794de8b5 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8804: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8804/index.html<br />
  IGT_7254: 7fab01340a3f360abacd7914015be1ad485363d7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============2037016881710038141==--
