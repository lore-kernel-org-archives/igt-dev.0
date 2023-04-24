Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============2270710057420843169=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Date: Mon, 24 Apr 2023 11:01:46 -0000
Message-ID: <168233410693.1233.13970516421566269358@emeril.freedesktop.org>
References: <20230424080233.2016931-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20230424080233.2016931-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHM6?=
 =?utf-8?q?_New_dir_structure_for_intel_specific_tests?=
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

--===============2270710057420843169==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests: New dir structure for intel specific tests
URL   : https://patchwork.freedesktop.org/series/116874/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_13052 -> IGTPW_8843
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8843/index.html

Participating hosts (38 -> 35)
------------------------------

  Missing    (3): fi-kbl-soraka bat-mtlp-8 fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_8843 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@gt_heartbeat:
    - fi-apl-guc:         [PASS][1] -> [DMESG-FAIL][2] ([i915#5334])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13052/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8843/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html

  * igt@i915_selftest@live@slpc:
    - bat-rpls-1:         NOTRUN -> [DMESG-FAIL][3] ([i915#6367] / [i915#7996])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8843/bat-rpls-1/igt@i915_selftest@live@slpc.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - bat-jsl-3:          NOTRUN -> [SKIP][4] ([i915#7828])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8843/bat-jsl-3/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
    - bat-rpls-1:         NOTRUN -> [SKIP][5] ([i915#7828])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8843/bat-rpls-1/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_pipe_crc_basic@read-crc:
    - bat-adlp-9:         NOTRUN -> [SKIP][6] ([i915#3546]) +1 similar issue
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8843/bat-adlp-9/igt@kms_pipe_crc_basic@read-crc.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - bat-rpls-1:         NOTRUN -> [SKIP][7] ([i915#1845])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8843/bat-rpls-1/igt@kms_pipe_crc_basic@suspend-read-crc.html

  
#### Possible fixes ####

  * igt@dmabuf@all-tests@sanitycheck:
    - bat-jsl-3:          [INCOMPLETE][8] ([i915#8144]) -> [PASS][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13052/bat-jsl-3/igt@dmabuf@all-tests@sanitycheck.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8843/bat-jsl-3/igt@dmabuf@all-tests@sanitycheck.html

  * igt@i915_selftest@live@reset:
    - bat-rpls-1:         [ABORT][10] ([i915#4983] / [i915#8384]) -> [PASS][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13052/bat-rpls-1/igt@i915_selftest@live@reset.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8843/bat-rpls-1/igt@i915_selftest@live@reset.html

  
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
  [i915#6367]: https://gitlab.freedesktop.org/drm/intel/issues/6367
  [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
  [i915#7996]: https://gitlab.freedesktop.org/drm/intel/issues/7996
  [i915#8144]: https://gitlab.freedesktop.org/drm/intel/issues/8144
  [i915#8384]: https://gitlab.freedesktop.org/drm/intel/issues/8384


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7266 -> IGTPW_8843

  CI-20190529: 20190529
  CI_DRM_13052: 04154f5c718e377bd30449c425a34de089a99d35 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8843: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8843/index.html
  IGT_7266: 94411dd85f9ad6d76fb7b2097197122703a3914c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


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

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8843/index.html

--===============2270710057420843169==
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
<tr><td><b>Series:</b></td><td>tests: New dir structure for intel specific tests</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/116874/">https://patchwork.freedesktop.org/series/116874/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8843/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8843/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13052 -&gt; IGTPW_8843</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8843/index.html</p>
<h2>Participating hosts (38 -&gt; 35)</h2>
<p>Missing    (3): fi-kbl-soraka bat-mtlp-8 fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8843 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13052/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8843/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5334">i915#5334</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@slpc:</p>
<ul>
<li>bat-rpls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8843/bat-rpls-1/igt@i915_selftest@live@slpc.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6367">i915#6367</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7996">i915#7996</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>
<p>bat-jsl-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8843/bat-jsl-3/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>)</p>
</li>
<li>
<p>bat-rpls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8843/bat-rpls-1/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc:</p>
<ul>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8843/bat-adlp-9/igt@kms_pipe_crc_basic@read-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3546">i915#3546</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>bat-rpls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8843/bat-rpls-1/igt@kms_pipe_crc_basic@suspend-read-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@dmabuf@all-tests@sanitycheck:</p>
<ul>
<li>bat-jsl-3:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13052/bat-jsl-3/igt@dmabuf@all-tests@sanitycheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8144">i915#8144</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8843/bat-jsl-3/igt@dmabuf@all-tests@sanitycheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@reset:</p>
<ul>
<li>bat-rpls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13052/bat-rpls-1/igt@i915_selftest@live@reset.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4983">i915#4983</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8384">i915#8384</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8843/bat-rpls-1/igt@i915_selftest@live@reset.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7266 -&gt; IGTPW_8843</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13052: 04154f5c718e377bd30449c425a34de089a99d35 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8843: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8843/index.html<br />
  IGT_7266: 94411dd85f9ad6d76fb7b2097197122703a3914c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
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

--===============2270710057420843169==--
