Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 18 Mar 2021 00:14:59 -0000
Message-ID: <161602649951.12740.5861493687603480954@emeril.freedesktop.org>
References: <20210317224222.447100-1-lyude@redhat.com>
In-Reply-To: <20210317224222.447100-1-lyude@redhat.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fcolor=3A_Fixup_for_nouveau?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0174506786=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Lyude Paul <lyude@redhat.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0174506786==
Content-Type: multipart/alternative;
 boundary="===============8709400523369215265=="

--===============8709400523369215265==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_color: Fixup for nouveau
URL   : https://patchwork.freedesktop.org/series/88075/
State : success

== Summary ==

CI Bug Log - changes from IGT_6035 -> IGTPW_5613
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5613/index.html

Known issues
------------

  Here are the changes found in IGTPW_5613 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@amdgpu/amd_basic@query-info:
    - fi-bsw-kefka:       NOTRUN -> [SKIP][1] ([fdo#109271]) +17 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5613/fi-bsw-kefka/igt@amdgpu/amd_basic@query-info.html

  * igt@amdgpu/amd_cs_nop@sync-fork-compute0:
    - fi-snb-2600:        NOTRUN -> [SKIP][2] ([fdo#109271]) +17 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5613/fi-snb-2600/igt@amdgpu/amd_cs_nop@sync-fork-compute0.html

  * igt@amdgpu/amd_prime@amd-to-i915:
    - fi-kbl-8809g:       NOTRUN -> [DMESG-WARN][3] ([i915#2947])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5613/fi-kbl-8809g/igt@amdgpu/amd_prime@amd-to-i915.html

  * igt@runner@aborted:
    - fi-kbl-8809g:       NOTRUN -> [FAIL][4] ([i915#2947])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5613/fi-kbl-8809g/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@gem_exec_gttfill@basic:
    - fi-kbl-8809g:       [TIMEOUT][5] ([i915#3145]) -> [PASS][6] +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6035/fi-kbl-8809g/igt@gem_exec_gttfill@basic.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5613/fi-kbl-8809g/igt@gem_exec_gttfill@basic.html

  * igt@gem_linear_blits@basic:
    - fi-kbl-8809g:       [TIMEOUT][7] ([i915#2502] / [i915#3145]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6035/fi-kbl-8809g/igt@gem_linear_blits@basic.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5613/fi-kbl-8809g/igt@gem_linear_blits@basic.html

  * igt@i915_selftest@live@execlists:
    - fi-bsw-kefka:       [INCOMPLETE][9] ([i915#2940]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6035/fi-bsw-kefka/igt@i915_selftest@live@execlists.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5613/fi-bsw-kefka/igt@i915_selftest@live@execlists.html

  * igt@i915_selftest@live@hangcheck:
    - fi-snb-2600:        [INCOMPLETE][11] ([i915#2782]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6035/fi-snb-2600/igt@i915_selftest@live@hangcheck.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5613/fi-snb-2600/igt@i915_selftest@live@hangcheck.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#2502]: https://gitlab.freedesktop.org/drm/intel/issues/2502
  [i915#2782]: https://gitlab.freedesktop.org/drm/intel/issues/2782
  [i915#2940]: https://gitlab.freedesktop.org/drm/intel/issues/2940
  [i915#2947]: https://gitlab.freedesktop.org/drm/intel/issues/2947
  [i915#3145]: https://gitlab.freedesktop.org/drm/intel/issues/3145


Participating hosts (46 -> 40)
------------------------------

  Missing    (6): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-ctg-p8600 fi-dg1-1 fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6035 -> IGTPW_5613

  CI-20190529: 20190529
  CI_DRM_9867: 5f7383f6c1c95be9758792da71084f8f2c0c5953 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5613: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5613/index.html
  IGT_6035: ad5eb02eb3f10a41d0f1feba7efc02db87cd06b8 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5613/index.html

--===============8709400523369215265==
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
<tr><td><b>Series:</b></td><td>tests/kms_color: Fixup for nouveau</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/88075/">https://patchwork.freedesktop.org/series/88075/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5613/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5613/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_6035 -&gt; IGTPW_5613</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5613/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5613 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@amdgpu/amd_basic@query-info:</p>
<ul>
<li>fi-bsw-kefka:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5613/fi-bsw-kefka/igt@amdgpu/amd_basic@query-info.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@amdgpu/amd_cs_nop@sync-fork-compute0:</p>
<ul>
<li>fi-snb-2600:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5613/fi-snb-2600/igt@amdgpu/amd_cs_nop@sync-fork-compute0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@amdgpu/amd_prime@amd-to-i915:</p>
<ul>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5613/fi-kbl-8809g/igt@amdgpu/amd_prime@amd-to-i915.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2947">i915#2947</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5613/fi-kbl-8809g/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2947">i915#2947</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_gttfill@basic:</p>
<ul>
<li>fi-kbl-8809g:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6035/fi-kbl-8809g/igt@gem_exec_gttfill@basic.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3145">i915#3145</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5613/fi-kbl-8809g/igt@gem_exec_gttfill@basic.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_linear_blits@basic:</p>
<ul>
<li>fi-kbl-8809g:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6035/fi-kbl-8809g/igt@gem_linear_blits@basic.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2502">i915#2502</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3145">i915#3145</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5613/fi-kbl-8809g/igt@gem_linear_blits@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6035/fi-bsw-kefka/igt@i915_selftest@live@execlists.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2940">i915#2940</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5613/fi-bsw-kefka/igt@i915_selftest@live@execlists.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>fi-snb-2600:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6035/fi-snb-2600/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2782">i915#2782</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5613/fi-snb-2600/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Participating hosts (46 -&gt; 40)</h2>
<p>Missing    (6): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-ctg-p8600 fi-dg1-1 fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6035 -&gt; IGTPW_5613</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9867: 5f7383f6c1c95be9758792da71084f8f2c0c5953 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5613: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5613/index.html<br />
  IGT_6035: ad5eb02eb3f10a41d0f1feba7efc02db87cd06b8 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>

</body>
</html>

--===============8709400523369215265==--

--===============0174506786==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0174506786==--
