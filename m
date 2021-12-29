Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============3536897891608288499=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 29 Dec 2021 15:12:20 -0000
Message-ID: <164079074048.17180.14279881593464916905@emeril.freedesktop.org>
References: <20211229114806.24218-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20211229114806.24218-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgQnVnZml4?=
 =?utf-8?q?_series_in_bufops_and_allocator_=28rev2=29?=
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
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============3536897891608288499==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Bugfix series in bufops and allocator (rev2)
URL   : https://patchwork.freedesktop.org/series/98401/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_11039 -> IGTPW_6521
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6521/index.html

Participating hosts (42 -> 35)
------------------------------

  Missing    (7): bat-dg1-6 fi-bsw-cyan bat-adlp-6 bat-adlp-4 bat-rpls-1 bat-jsl-2 fi-bdw-samus 

Known issues
------------

  Here are the changes found in IGTPW_6521 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@amdgpu/amd_basic@cs-gfx:
    - fi-hsw-4770:        NOTRUN -> [SKIP][1] ([fdo#109271] / [fdo#109315]) +17 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6521/fi-hsw-4770/igt@amdgpu/amd_basic@cs-gfx.html

  * igt@core_hotunplug@unbind-rebind:
    - fi-tgl-u2:          [PASS][2] -> [INCOMPLETE][3] ([i915#4006])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11039/fi-tgl-u2/igt@core_hotunplug@unbind-rebind.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6521/fi-tgl-u2/igt@core_hotunplug@unbind-rebind.html

  * igt@gem_flink_basic@bad-flink:
    - fi-skl-6600u:       [PASS][4] -> [INCOMPLETE][5] ([i915#4547])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11039/fi-skl-6600u/igt@gem_flink_basic@bad-flink.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6521/fi-skl-6600u/igt@gem_flink_basic@bad-flink.html

  * igt@i915_selftest@live@requests:
    - fi-blb-e6850:       [PASS][6] -> [DMESG-FAIL][7] ([i915#4610])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11039/fi-blb-e6850/igt@i915_selftest@live@requests.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6521/fi-blb-e6850/igt@i915_selftest@live@requests.html

  * igt@runner@aborted:
    - fi-skl-6600u:       NOTRUN -> [FAIL][8] ([i915#2722] / [i915#4312])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6521/fi-skl-6600u/igt@runner@aborted.html
    - fi-tgl-u2:          NOTRUN -> [FAIL][9] ([i915#2722] / [i915#4312])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6521/fi-tgl-u2/igt@runner@aborted.html
    - fi-blb-e6850:       NOTRUN -> [FAIL][10] ([fdo#109271] / [i915#2403] / [i915#2426] / [i915#4312])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6521/fi-blb-e6850/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@hangcheck:
    - fi-hsw-4770:        [INCOMPLETE][11] ([i915#3303]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11039/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6521/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
  [i915#2403]: https://gitlab.freedesktop.org/drm/intel/issues/2403
  [i915#2426]: https://gitlab.freedesktop.org/drm/intel/issues/2426
  [i915#2722]: https://gitlab.freedesktop.org/drm/intel/issues/2722
  [i915#3303]: https://gitlab.freedesktop.org/drm/intel/issues/3303
  [i915#4006]: https://gitlab.freedesktop.org/drm/intel/issues/4006
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4547]: https://gitlab.freedesktop.org/drm/intel/issues/4547
  [i915#4610]: https://gitlab.freedesktop.org/drm/intel/issues/4610


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6321 -> IGTPW_6521

  CI-20190529: 20190529
  CI_DRM_11039: c90264924b9988493890773248bde3173a4866b4 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6521: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6521/index.html
  IGT_6321: 85a5938090cd3da34e4fba8f541fbe240210b47d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6521/index.html

--===============3536897891608288499==
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
<tr><td><b>Series:</b></td><td>Bugfix series in bufops and allocator (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/98401/">https://patchwork.freedesktop.org/series/98401/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6521/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6521/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11039 -&gt; IGTPW_6521</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6521/index.html</p>
<h2>Participating hosts (42 -&gt; 35)</h2>
<p>Missing    (7): bat-dg1-6 fi-bsw-cyan bat-adlp-6 bat-adlp-4 bat-rpls-1 bat-jsl-2 fi-bdw-samus </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6521 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@amdgpu/amd_basic@cs-gfx:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6521/fi-hsw-4770/igt@amdgpu/amd_basic@cs-gfx.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a>) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>fi-tgl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11039/fi-tgl-u2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6521/fi-tgl-u2/igt@core_hotunplug@unbind-rebind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4006">i915#4006</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_flink_basic@bad-flink:</p>
<ul>
<li>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11039/fi-skl-6600u/igt@gem_flink_basic@bad-flink.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6521/fi-skl-6600u/igt@gem_flink_basic@bad-flink.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4547">i915#4547</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>fi-blb-e6850:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11039/fi-blb-e6850/igt@i915_selftest@live@requests.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6521/fi-blb-e6850/igt@i915_selftest@live@requests.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4610">i915#4610</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6521/fi-skl-6600u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2722">i915#2722</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</p>
</li>
<li>
<p>fi-tgl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6521/fi-tgl-u2/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2722">i915#2722</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</p>
</li>
<li>
<p>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6521/fi-blb-e6850/igt@runner@aborted.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2403">i915#2403</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live@hangcheck:<ul>
<li>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11039/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3303">i915#3303</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6521/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6321 -&gt; IGTPW_6521</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11039: c90264924b9988493890773248bde3173a4866b4 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_6521: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6521/index.html<br />
  IGT_6321: 85a5938090cd3da34e4fba8f541fbe240210b47d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============3536897891608288499==--
