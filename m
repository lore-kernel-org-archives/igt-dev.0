Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============2896113768208152651=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Date: Thu, 29 Sep 2022 13:33:03 -0000
Message-ID: <166445838397.11951.17291784169730373382@emeril.freedesktop.org>
References: <20220929111223.11925-1-nirmoy.das@intel.com>
In-Reply-To: <20220929111223.11925-1-nirmoy.das@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fringfill=3A_Create_dynamic_subtest_=28rev2=29?=
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

--===============2896113768208152651==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: i915/gem_ringfill: Create dynamic subtest (rev2)
URL   : https://patchwork.freedesktop.org/series/109054/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_12198 -> IGTPW_7887
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with IGTPW_7887 need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_7887, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7887/index.html

Participating hosts (49 -> 44)
------------------------------

  Missing    (5): fi-ilk-m540 fi-hsw-4200u fi-icl-u2 fi-ctg-p8600 fi-bdw-samus 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_7887:

### IGT changes ###

#### Warnings ####

  * igt@runner@aborted:
    - fi-kbl-x1275:       [FAIL][1] ([i915#6641]) -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12198/fi-kbl-x1275/igt@runner@aborted.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7887/fi-kbl-x1275/igt@runner@aborted.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@i915_selftest@live@slpc:
    - {bat-adln-1}:       [PASS][3] -> [DMESG-FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12198/bat-adln-1/igt@i915_selftest@live@slpc.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7887/bat-adln-1/igt@i915_selftest@live@slpc.html

  
New tests
---------

  New tests have been introduced between CI_DRM_12198 and IGTPW_7887:

### New IGT tests (10) ###

  * igt@gem_ringfill@basic-all@bcs0:
    - Statuses : 34 pass(s)
    - Exec time: [1.08, 1.19] s

  * igt@gem_ringfill@basic-all@ccs0:
    - Statuses : 2 pass(s)
    - Exec time: [1.15, 1.22] s

  * igt@gem_ringfill@basic-all@ccs1:
    - Statuses : 1 pass(s)
    - Exec time: [1.17] s

  * igt@gem_ringfill@basic-all@ccs2:
    - Statuses : 1 pass(s)
    - Exec time: [1.14] s

  * igt@gem_ringfill@basic-all@ccs3:
    - Statuses : 1 pass(s)
    - Exec time: [1.15] s

  * igt@gem_ringfill@basic-all@rcs0:
    - Statuses : 38 pass(s)
    - Exec time: [1.09, 1.19] s

  * igt@gem_ringfill@basic-all@vcs0:
    - Statuses : 34 pass(s)
    - Exec time: [1.08, 1.16] s

  * igt@gem_ringfill@basic-all@vcs1:
    - Statuses : 12 pass(s)
    - Exec time: [1.08, 1.16] s

  * igt@gem_ringfill@basic-all@vecs0:
    - Statuses : 31 pass(s)
    - Exec time: [1.08, 1.17] s

  * igt@gem_ringfill@basic-all@vecs1:
    - Statuses : 2 pass(s)
    - Exec time: [1.15] s

  

Known issues
------------

  Here are the changes found in IGTPW_7887 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@gem_exec_suspend@basic-s3@lmem0:
    - {bat-dg2-11}:       [DMESG-WARN][5] ([i915#6816]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12198/bat-dg2-11/igt@gem_exec_suspend@basic-s3@lmem0.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7887/bat-dg2-11/igt@gem_exec_suspend@basic-s3@lmem0.html

  * igt@i915_selftest@live@reset:
    - {bat-rpls-1}:       [DMESG-FAIL][7] ([i915#4983]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12198/bat-rpls-1/igt@i915_selftest@live@reset.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7887/bat-rpls-1/igt@i915_selftest@live@reset.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-dp-2:
    - {bat-dg2-11}:       [FAIL][9] ([i915#6818]) -> [PASS][10] +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12198/bat-dg2-11/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-dp-2.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7887/bat-dg2-11/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-dp-2.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#2867]: https://gitlab.freedesktop.org/drm/intel/issues/2867
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#6367]: https://gitlab.freedesktop.org/drm/intel/issues/6367
  [i915#6641]: https://gitlab.freedesktop.org/drm/intel/issues/6641
  [i915#6816]: https://gitlab.freedesktop.org/drm/intel/issues/6816
  [i915#6818]: https://gitlab.freedesktop.org/drm/intel/issues/6818


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6669 -> IGTPW_7887

  CI-20190529: 20190529
  CI_DRM_12198: 4c88fe47b0b231e7b7830573f47d9e2ea443b8c6 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7887: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7887/index.html
  IGT_6669: 3d2df081c14c251e0269e3510ddc4e9d26ffe925 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7887/index.html

--===============2896113768208152651==
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
<tr><td><b>Series:</b></td><td>i915/gem_ringfill: Create dynamic subtest (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/109054/">https://patchwork.freedesktop.org/series/109054/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7887/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7887/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12198 -&gt; IGTPW_7887</h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with IGTPW_7887 need to be verified<br />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_7887, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7887/index.html</p>
<h2>Participating hosts (49 -&gt; 44)</h2>
<p>Missing    (5): fi-ilk-m540 fi-hsw-4200u fi-icl-u2 fi-ctg-p8600 fi-bdw-samus </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7887:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>igt@runner@aborted:<ul>
<li>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12198/fi-kbl-x1275/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6641">i915#6641</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7887/fi-kbl-x1275/igt@runner@aborted.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@i915_selftest@live@slpc:<ul>
<li>{bat-adln-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12198/bat-adln-1/igt@i915_selftest@live@slpc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7887/bat-adln-1/igt@i915_selftest@live@slpc.html">DMESG-FAIL</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_12198 and IGTPW_7887:</p>
<h3>New IGT tests (10)</h3>
<ul>
<li>
<p>igt@gem_ringfill@basic-all@bcs0:</p>
<ul>
<li>Statuses : 34 pass(s)</li>
<li>Exec time: [1.08, 1.19] s</li>
</ul>
</li>
<li>
<p>igt@gem_ringfill@basic-all@ccs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.15, 1.22] s</li>
</ul>
</li>
<li>
<p>igt@gem_ringfill@basic-all@ccs1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.17] s</li>
</ul>
</li>
<li>
<p>igt@gem_ringfill@basic-all@ccs2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.14] s</li>
</ul>
</li>
<li>
<p>igt@gem_ringfill@basic-all@ccs3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.15] s</li>
</ul>
</li>
<li>
<p>igt@gem_ringfill@basic-all@rcs0:</p>
<ul>
<li>Statuses : 38 pass(s)</li>
<li>Exec time: [1.09, 1.19] s</li>
</ul>
</li>
<li>
<p>igt@gem_ringfill@basic-all@vcs0:</p>
<ul>
<li>Statuses : 34 pass(s)</li>
<li>Exec time: [1.08, 1.16] s</li>
</ul>
</li>
<li>
<p>igt@gem_ringfill@basic-all@vcs1:</p>
<ul>
<li>Statuses : 12 pass(s)</li>
<li>Exec time: [1.08, 1.16] s</li>
</ul>
</li>
<li>
<p>igt@gem_ringfill@basic-all@vecs0:</p>
<ul>
<li>Statuses : 31 pass(s)</li>
<li>Exec time: [1.08, 1.17] s</li>
</ul>
</li>
<li>
<p>igt@gem_ringfill@basic-all@vecs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.15] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7887 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s3@lmem0:</p>
<ul>
<li>{bat-dg2-11}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12198/bat-dg2-11/igt@gem_exec_suspend@basic-s3@lmem0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6816">i915#6816</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7887/bat-dg2-11/igt@gem_exec_suspend@basic-s3@lmem0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@reset:</p>
<ul>
<li>{bat-rpls-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12198/bat-rpls-1/igt@i915_selftest@live@reset.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4983">i915#4983</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7887/bat-rpls-1/igt@i915_selftest@live@reset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-dp-2:</p>
<ul>
<li>{bat-dg2-11}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12198/bat-dg2-11/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6818">i915#6818</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7887/bat-dg2-11/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-dp-2.html">PASS</a> +1 similar issue</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6669 -&gt; IGTPW_7887</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12198: 4c88fe47b0b231e7b7830573f47d9e2ea443b8c6 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_7887: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7887/index.html<br />
  IGT_6669: 3d2df081c14c251e0269e3510ddc4e9d26ffe925 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============2896113768208152651==--
