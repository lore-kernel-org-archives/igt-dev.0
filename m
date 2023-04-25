Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============5142040459721826716=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Date: Tue, 25 Apr 2023 19:53:05 -0000
Message-ID: <168245238556.25939.9163158956165098998@emeril.freedesktop.org>
References: <20230425153940.768619-1-lucas.demarchi@intel.com>
In-Reply-To: <20230425153940.768619-1-lucas.demarchi@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgaW50ZWwt?=
 =?utf-8?q?gfx-fw-info=3A_Make_it_compatible_with_HuC_via_GSC_=28rev2=29?=
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

--===============5142040459721826716==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: intel-gfx-fw-info: Make it compatible with HuC via GSC (rev2)
URL   : https://patchwork.freedesktop.org/series/116500/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_13062 -> IGTPW_8857
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_8857 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_8857, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8857/index.html

Participating hosts (39 -> 37)
------------------------------

  Missing    (2): fi-kbl-soraka fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_8857:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_suspend@basic-s3@smem:
    - bat-rpls-1:         NOTRUN -> [ABORT][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8857/bat-rpls-1/igt@gem_exec_suspend@basic-s3@smem.html

  * igt@i915_selftest@live@slpc:
    - bat-rpls-1:         NOTRUN -> [FAIL][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8857/bat-rpls-1/igt@i915_selftest@live@slpc.html

  
#### Warnings ####

  * igt@i915_suspend@basic-s3-without-i915:
    - fi-tgl-1115g4:      [INCOMPLETE][3] ([i915#7443]) -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13062/fi-tgl-1115g4/igt@i915_suspend@basic-s3-without-i915.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8857/fi-tgl-1115g4/igt@i915_suspend@basic-s3-without-i915.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@i915_selftest@live@slpc:
    - {bat-mtlp-8}:       NOTRUN -> [FAIL][5] +2 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8857/bat-mtlp-8/igt@i915_selftest@live@slpc.html

  
Known issues
------------

  Here are the changes found in IGTPW_8857 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_suspend@basic-s3-without-i915:
    - bat-adls-5:         [PASS][6] -> [FAIL][7] ([fdo#103375]) +7 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13062/bat-adls-5/igt@i915_suspend@basic-s3-without-i915.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8857/bat-adls-5/igt@i915_suspend@basic-s3-without-i915.html

  * igt@kms_pipe_crc_basic@read-crc:
    - bat-dg2-11:         NOTRUN -> [SKIP][8] ([i915#5354])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8857/bat-dg2-11/igt@kms_pipe_crc_basic@read-crc.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@requests:
    - {bat-mtlp-8}:       [ABORT][9] -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13062/bat-mtlp-8/igt@i915_selftest@live@requests.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8857/bat-mtlp-8/igt@i915_selftest@live@requests.html

  * igt@i915_selftest@live@reset:
    - bat-rpls-1:         [ABORT][11] ([i915#8384]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13062/bat-rpls-1/igt@i915_selftest@live@reset.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8857/bat-rpls-1/igt@i915_selftest@live@reset.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
  [i915#6645]: https://gitlab.freedesktop.org/drm/intel/issues/6645
  [i915#7443]: https://gitlab.freedesktop.org/drm/intel/issues/7443
  [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
  [i915#8384]: https://gitlab.freedesktop.org/drm/intel/issues/8384


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7270 -> IGTPW_8857

  CI-20190529: 20190529
  CI_DRM_13062: 5a0333cf630a335d7e8f60fd2b8526ed0895900c @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8857: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8857/index.html
  IGT_7270: 3bd8bf9bca97bbfb7b4b408f9fccd0cf6f742d4c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

-igt@xe_gpgpu_fill@basic
-igt@xe_intel_bb@add-remove-objects
-igt@xe_intel_bb@bb-with-allocator
-igt@xe_intel_bb@blit-reloc
-igt@xe_intel_bb@blit-simple
-igt@xe_intel_bb@create-in-region
-igt@xe_intel_bb@delta-check
-igt@xe_intel_bb@destroy-bb
-igt@xe_intel_bb@full-batch
-igt@xe_intel_bb@intel-bb-blit-none
-igt@xe_intel_bb@intel-bb-blit-x
-igt@xe_intel_bb@intel-bb-blit-y
-igt@xe_intel_bb@lot-of-buffers
-igt@xe_intel_bb@offset-control
-igt@xe_intel_bb@purge-bb
-igt@xe_intel_bb@render
-igt@xe_intel_bb@reset-bb
-igt@xe_intel_bb@simple-bb
-igt@xe_intel_bb@simple-bb-ctx

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8857/index.html

--===============5142040459721826716==
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
<tr><td><b>Series:</b></td><td>intel-gfx-fw-info: Make it compatible with HuC via GSC (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/116500/">https://patchwork.freedesktop.org/series/116500/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8857/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8857/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13062 -&gt; IGTPW_8857</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_8857 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_8857, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8857/index.html</p>
<h2>Participating hosts (39 -&gt; 37)</h2>
<p>Missing    (2): fi-kbl-soraka fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_8857:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s3@smem:</p>
<ul>
<li>bat-rpls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8857/bat-rpls-1/igt@gem_exec_suspend@basic-s3@smem.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@slpc:</p>
<ul>
<li>bat-rpls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8857/bat-rpls-1/igt@i915_selftest@live@slpc.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@i915_suspend@basic-s3-without-i915:<ul>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13062/fi-tgl-1115g4/igt@i915_suspend@basic-s3-without-i915.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7443">i915#7443</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8857/fi-tgl-1115g4/igt@i915_suspend@basic-s3-without-i915.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@i915_selftest@live@slpc:<ul>
<li>{bat-mtlp-8}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8857/bat-mtlp-8/igt@i915_selftest@live@slpc.html">FAIL</a> +2 similar issues</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8857 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>bat-adls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13062/bat-adls-5/igt@i915_suspend@basic-s3-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8857/bat-adls-5/igt@i915_suspend@basic-s3-without-i915.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=103375">fdo#103375</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8857/bat-dg2-11/igt@kms_pipe_crc_basic@read-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>{bat-mtlp-8}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13062/bat-mtlp-8/igt@i915_selftest@live@requests.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8857/bat-mtlp-8/igt@i915_selftest@live@requests.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@reset:</p>
<ul>
<li>bat-rpls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13062/bat-rpls-1/igt@i915_selftest@live@reset.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8384">i915#8384</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8857/bat-rpls-1/igt@i915_selftest@live@reset.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7270 -&gt; IGTPW_8857</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13062: 5a0333cf630a335d7e8f60fd2b8526ed0895900c @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8857: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8857/index.html<br />
  IGT_7270: 3bd8bf9bca97bbfb7b4b408f9fccd0cf6f742d4c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>-igt@xe_gpgpu_fill@basic<br />
-igt@xe_intel_bb@add-remove-objects<br />
-igt@xe_intel_bb@bb-with-allocator<br />
-igt@xe_intel_bb@blit-reloc<br />
-igt@xe_intel_bb@blit-simple<br />
-igt@xe_intel_bb@create-in-region<br />
-igt@xe_intel_bb@delta-check<br />
-igt@xe_intel_bb@destroy-bb<br />
-igt@xe_intel_bb@full-batch<br />
-igt@xe_intel_bb@intel-bb-blit-none<br />
-igt@xe_intel_bb@intel-bb-blit-x<br />
-igt@xe_intel_bb@intel-bb-blit-y<br />
-igt@xe_intel_bb@lot-of-buffers<br />
-igt@xe_intel_bb@offset-control<br />
-igt@xe_intel_bb@purge-bb<br />
-igt@xe_intel_bb@render<br />
-igt@xe_intel_bb@reset-bb<br />
-igt@xe_intel_bb@simple-bb<br />
-igt@xe_intel_bb@simple-bb-ctx</p>

</body>
</html>

--===============5142040459721826716==--
