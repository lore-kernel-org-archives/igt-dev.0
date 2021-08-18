Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============1700797856309527529=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 18 Aug 2021 14:51:32 -0000
Message-ID: <162929829298.16675.14691696698047708264@emeril.freedesktop.org>
References: <20210818140651.819205-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20210818140651.819205-1-thomas.hellstrom@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Flmem=5Fswapping=3A_Add_the_gem=5Flmem=5Fswapping_tes?=
 =?utf-8?q?t_=28rev2=29?=
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
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1700797856309527529==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/i915/gem_lmem_swapping: Add the gem_lmem_swapping test (rev2)
URL   : https://patchwork.freedesktop.org/series/93584/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_10495 -> IGTPW_6134
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_6134 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_6134, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6134/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_6134:

### IGT changes ###

#### Possible regressions ####

  * igt@core_auth@basic-auth:
    - fi-kbl-8809g:       [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10495/fi-kbl-8809g/igt@core_auth@basic-auth.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6134/fi-kbl-8809g/igt@core_auth@basic-auth.html

  
Known issues
------------

  Here are the changes found in IGTPW_6134 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@amdgpu/amd_basic@semaphore:
    - fi-icl-y:           NOTRUN -> [SKIP][3] ([fdo#109315]) +17 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6134/fi-icl-y/igt@amdgpu/amd_basic@semaphore.html
    - fi-bdw-5557u:       NOTRUN -> [SKIP][4] ([fdo#109271]) +27 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6134/fi-bdw-5557u/igt@amdgpu/amd_basic@semaphore.html

  * igt@core_hotunplug@unbind-rebind:
    - fi-bdw-5557u:       NOTRUN -> [WARN][5] ([i915#3718])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6134/fi-bdw-5557u/igt@core_hotunplug@unbind-rebind.html

  * igt@kms_chamelium@dp-crc-fast:
    - fi-bdw-5557u:       NOTRUN -> [SKIP][6] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6134/fi-bdw-5557u/igt@kms_chamelium@dp-crc-fast.html

  * igt@runner@aborted:
    - fi-kbl-8809g:       NOTRUN -> [FAIL][7] ([i915#3363])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6134/fi-kbl-8809g/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@coherency:
    - fi-icl-y:           [INCOMPLETE][8] -> [PASS][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10495/fi-icl-y/igt@i915_selftest@live@coherency.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6134/fi-icl-y/igt@i915_selftest@live@coherency.html

  * igt@i915_selftest@live@gt_lrc:
    - fi-rkl-guc:         [DMESG-WARN][10] ([i915#3958]) -> [PASS][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10495/fi-rkl-guc/igt@i915_selftest@live@gt_lrc.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6134/fi-rkl-guc/igt@i915_selftest@live@gt_lrc.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#3363]: https://gitlab.freedesktop.org/drm/intel/issues/3363
  [i915#3718]: https://gitlab.freedesktop.org/drm/intel/issues/3718
  [i915#3958]: https://gitlab.freedesktop.org/drm/intel/issues/3958


Participating hosts (35 -> 34)
------------------------------

  Missing    (1): fi-bsw-cyan 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6178 -> IGTPW_6134

  CI-20190529: 20190529
  CI_DRM_10495: 63052a17b50710a64ac3c5064d3aa7d92d82a6b9 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6134: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6134/index.html
  IGT_6178: 146260200f9a6d4536e48a195e2ab49a07d4f0c1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git



== Testlist changes ==

+igt@gem_lmem_swapping@basic
+igt@gem_lmem_swapping@heavy-multi
+igt@gem_lmem_swapping@heavy-random
+igt@gem_lmem_swapping@heavy-verify-multi
+igt@gem_lmem_swapping@heavy-verify-random
+igt@gem_lmem_swapping@parallel-multi
+igt@gem_lmem_swapping@parallel-random
+igt@gem_lmem_swapping@parallel-random-engines
+igt@gem_lmem_swapping@parallel-random-verify
+igt@gem_lmem_swapping@random
+igt@gem_lmem_swapping@random-engines
+igt@gem_lmem_swapping@smem-oom
+igt@gem_lmem_swapping@verify
+igt@gem_lmem_swapping@verify-random

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6134/index.html

--===============1700797856309527529==
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
<tr><td><b>Series:</b></td><td>tests/i915/gem_lmem_swapping: Add the gem_lmem_swapping test (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/93584/">https://patchwork.freedesktop.org/series/93584/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6134/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6134/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10495 -&gt; IGTPW_6134</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_6134 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_6134, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6134/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_6134:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@core_auth@basic-auth:<ul>
<li>fi-kbl-8809g:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10495/fi-kbl-8809g/igt@core_auth@basic-auth.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6134/fi-kbl-8809g/igt@core_auth@basic-auth.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6134 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@amdgpu/amd_basic@semaphore:</p>
<ul>
<li>
<p>fi-icl-y:           NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6134/fi-icl-y/igt@amdgpu/amd_basic@semaphore.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a>) +17 similar issues</p>
</li>
<li>
<p>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6134/fi-bdw-5557u/igt@amdgpu/amd_basic@semaphore.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +27 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6134/fi-bdw-5557u/igt@core_hotunplug@unbind-rebind.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3718">i915#3718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-crc-fast:</p>
<ul>
<li>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6134/fi-bdw-5557u/igt@kms_chamelium@dp-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6134/fi-kbl-8809g/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@coherency:</p>
<ul>
<li>fi-icl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10495/fi-icl-y/igt@i915_selftest@live@coherency.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6134/fi-icl-y/igt@i915_selftest@live@coherency.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_lrc:</p>
<ul>
<li>fi-rkl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10495/fi-rkl-guc/igt@i915_selftest@live@gt_lrc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3958">i915#3958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6134/fi-rkl-guc/igt@i915_selftest@live@gt_lrc.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Participating hosts (35 -&gt; 34)</h2>
<p>Missing    (1): fi-bsw-cyan </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6178 -&gt; IGTPW_6134</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_10495: 63052a17b50710a64ac3c5064d3aa7d92d82a6b9 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_6134: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6134/index.html<br />
  IGT_6178: 146260200f9a6d4536e48a195e2ab49a07d4f0c1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<p>== Testlist changes ==</p>
<p>+igt@gem_lmem_swapping@basic<br />
+igt@gem_lmem_swapping@heavy-multi<br />
+igt@gem_lmem_swapping@heavy-random<br />
+igt@gem_lmem_swapping@heavy-verify-multi<br />
+igt@gem_lmem_swapping@heavy-verify-random<br />
+igt@gem_lmem_swapping@parallel-multi<br />
+igt@gem_lmem_swapping@parallel-random<br />
+igt@gem_lmem_swapping@parallel-random-engines<br />
+igt@gem_lmem_swapping@parallel-random-verify<br />
+igt@gem_lmem_swapping@random<br />
+igt@gem_lmem_swapping@random-engines<br />
+igt@gem_lmem_swapping@smem-oom<br />
+igt@gem_lmem_swapping@verify<br />
+igt@gem_lmem_swapping@verify-random</p>

</body>
</html>

--===============1700797856309527529==--
