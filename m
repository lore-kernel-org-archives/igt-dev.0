Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 29 Jan 2021 11:05:43 -0000
Message-ID: <161191834366.15524.12231845369540401117@emeril.freedesktop.org>
References: <20210129100934.3115085-1-chris@chris-wilson.co.uk>
In-Reply-To: <20210129100934.3115085-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgaTkxNS9z?=
 =?utf-8?q?ysfs=5Fclients=3A_Check_that_client_ids_are_cyclic_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1258309490=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1258309490==
Content-Type: multipart/alternative;
 boundary="===============2250610726967177744=="

--===============2250610726967177744==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: i915/sysfs_clients: Check that client ids are cyclic (rev2)
URL   : https://patchwork.freedesktop.org/series/86263/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9698 -> IGTPW_5444
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5444/index.html

Known issues
------------

  Here are the changes found in IGTPW_5444 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@amdgpu/amd_basic@memory-alloc:
    - fi-cml-u2:          NOTRUN -> [SKIP][1] ([fdo#109315]) +17 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5444/fi-cml-u2/igt@amdgpu/amd_basic@memory-alloc.html

  * igt@amdgpu/amd_basic@userptr:
    - fi-byt-j1900:       NOTRUN -> [SKIP][2] ([fdo#109271]) +17 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5444/fi-byt-j1900/igt@amdgpu/amd_basic@userptr.html

  * igt@gem_exec_fence@basic-busy@bcs0:
    - fi-cml-u2:          NOTRUN -> [SKIP][3] ([i915#1208]) +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5444/fi-cml-u2/igt@gem_exec_fence@basic-busy@bcs0.html

  * igt@gem_exec_suspend@basic-s3:
    - fi-tgl-u2:          [PASS][4] -> [FAIL][5] ([i915#1888]) +1 similar issue
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9698/fi-tgl-u2/igt@gem_exec_suspend@basic-s3.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5444/fi-tgl-u2/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_huc_copy@huc-copy:
    - fi-cml-u2:          NOTRUN -> [SKIP][6] ([i915#2190])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5444/fi-cml-u2/igt@gem_huc_copy@huc-copy.html

  * igt@i915_selftest@live@blt:
    - fi-snb-2600:        [PASS][7] -> [DMESG-FAIL][8] ([i915#1409])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9698/fi-snb-2600/igt@i915_selftest@live@blt.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5444/fi-snb-2600/igt@i915_selftest@live@blt.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-cml-u2:          NOTRUN -> [SKIP][9] ([i915#1004]) +2 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5444/fi-cml-u2/igt@kms_chamelium@hdmi-hpd-fast.html

  * igt@kms_chamelium@vga-edid-read:
    - fi-cml-u2:          NOTRUN -> [SKIP][10] ([fdo#109309]) +1 similar issue
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5444/fi-cml-u2/igt@kms_chamelium@vga-edid-read.html

  * igt@kms_force_connector_basic@force-load-detect:
    - fi-cml-u2:          NOTRUN -> [SKIP][11] ([fdo#109285])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5444/fi-cml-u2/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
    - fi-cml-u2:          NOTRUN -> [SKIP][12] ([fdo#109278] / [i915#533])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5444/fi-cml-u2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html

  
#### Possible fixes ####

  * igt@i915_pm_rpm@module-reload:
    - fi-byt-j1900:       [INCOMPLETE][13] ([i915#142] / [i915#2405]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9698/fi-byt-j1900/igt@i915_pm_rpm@module-reload.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5444/fi-byt-j1900/igt@i915_pm_rpm@module-reload.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109309]: https://bugs.freedesktop.org/show_bug.cgi?id=109309
  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
  [i915#1004]: https://gitlab.freedesktop.org/drm/intel/issues/1004
  [i915#1208]: https://gitlab.freedesktop.org/drm/intel/issues/1208
  [i915#1409]: https://gitlab.freedesktop.org/drm/intel/issues/1409
  [i915#142]: https://gitlab.freedesktop.org/drm/intel/issues/142
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2405]: https://gitlab.freedesktop.org/drm/intel/issues/2405
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533


Participating hosts (43 -> 37)
------------------------------

  Additional (1): fi-cml-u2 
  Missing    (7): fi-jsl-1 fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-dg1-1 fi-tgl-y fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5978 -> IGTPW_5444

  CI-20190529: 20190529
  CI_DRM_9698: 4917e86d5a4ca50e451247a3607e0f1eb81eedba @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5444: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5444/index.html
  IGT_5978: e1e5b3fea2baafdae0160940ecb8bf0242703840 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@sysfs_clients@recycle

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5444/index.html

--===============2250610726967177744==
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
<tr><td><b>Series:</b></td><td>i915/sysfs_clients: Check that client ids are cyclic (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/86263/">https://patchwork.freedesktop.org/series/86263/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5444/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5444/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9698 -&gt; IGTPW_5444</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5444/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5444 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@amdgpu/amd_basic@memory-alloc:</p>
<ul>
<li>fi-cml-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5444/fi-cml-u2/igt@amdgpu/amd_basic@memory-alloc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a>) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@amdgpu/amd_basic@userptr:</p>
<ul>
<li>fi-byt-j1900:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5444/fi-byt-j1900/igt@amdgpu/amd_basic@userptr.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-busy@bcs0:</p>
<ul>
<li>fi-cml-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5444/fi-cml-u2/igt@gem_exec_fence@basic-busy@bcs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1208">i915#1208</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>fi-tgl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9698/fi-tgl-u2/igt@gem_exec_suspend@basic-s3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5444/fi-tgl-u2/igt@gem_exec_suspend@basic-s3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1888">i915#1888</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-cml-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5444/fi-cml-u2/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@blt:</p>
<ul>
<li>fi-snb-2600:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9698/fi-snb-2600/igt@i915_selftest@live@blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5444/fi-snb-2600/igt@i915_selftest@live@blt.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1409">i915#1409</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-fast:</p>
<ul>
<li>fi-cml-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5444/fi-cml-u2/igt@kms_chamelium@hdmi-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1004">i915#1004</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-edid-read:</p>
<ul>
<li>fi-cml-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5444/fi-cml-u2/igt@kms_chamelium@vga-edid-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109309">fdo#109309</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>fi-cml-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5444/fi-cml-u2/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:</p>
<ul>
<li>fi-cml-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5444/fi-cml-u2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_pm_rpm@module-reload:<ul>
<li>fi-byt-j1900:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9698/fi-byt-j1900/igt@i915_pm_rpm@module-reload.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/142">i915#142</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2405">i915#2405</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5444/fi-byt-j1900/igt@i915_pm_rpm@module-reload.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Participating hosts (43 -&gt; 37)</h2>
<p>Additional (1): fi-cml-u2 <br />
  Missing    (7): fi-jsl-1 fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-dg1-1 fi-tgl-y fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5978 -&gt; IGTPW_5444</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9698: 4917e86d5a4ca50e451247a3607e0f1eb81eedba @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5444: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5444/index.html<br />
  IGT_5978: e1e5b3fea2baafdae0160940ecb8bf0242703840 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>
<p>== Testlist changes ==</p>
<p>+igt@sysfs_clients@recycle</p>

</body>
</html>

--===============2250610726967177744==--

--===============1258309490==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1258309490==--
