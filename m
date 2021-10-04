Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============0403468579664914978=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 04 Oct 2021 20:25:19 -0000
Message-ID: <163337911982.1479.5100353026626955126@emeril.freedesktop.org>
References: <20211004192803.2821789-1-aurabindo.pillai@amd.com>
In-Reply-To: <20211004192803.2821789-1-aurabindo.pillai@amd.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fbw=3A_Add_generic_commit_test_for_bandwidth_validation?=
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
To: Aurabindo Pillai <aurabindo.pillai@amd.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0403468579664914978==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_bw: Add generic commit test for bandwidth validation
URL   : https://patchwork.freedesktop.org/series/95425/
State : success

== Summary ==

CI Bug Log - changes from IGT_6229 -> IGTPW_6281
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6281/index.html

Known issues
------------

  Here are the changes found in IGTPW_6281 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@amdgpu/amd_cs_nop@nop-compute0:
    - fi-ilk-650:         NOTRUN -> [SKIP][1] ([fdo#109271]) +35 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6281/fi-ilk-650/igt@amdgpu/amd_cs_nop@nop-compute0.html

  * igt@core_hotunplug@unbind-rebind:
    - fi-bdw-samus:       NOTRUN -> [WARN][2] ([i915#3718])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6281/fi-bdw-samus/igt@core_hotunplug@unbind-rebind.html

  * igt@i915_selftest@live@execlists:
    - fi-bsw-n3050:       [PASS][3] -> [INCOMPLETE][4] ([i915#2940])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/fi-bsw-n3050/igt@i915_selftest@live@execlists.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6281/fi-bsw-n3050/igt@i915_selftest@live@execlists.html

  * igt@kms_chamelium@dp-hpd-fast:
    - fi-ilk-650:         NOTRUN -> [SKIP][5] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6281/fi-ilk-650/igt@kms_chamelium@dp-hpd-fast.html

  * igt@kms_chamelium@hdmi-edid-read:
    - fi-bdw-samus:       NOTRUN -> [SKIP][6] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6281/fi-bdw-samus/igt@kms_chamelium@hdmi-edid-read.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
    - fi-bdw-samus:       NOTRUN -> [SKIP][7] ([fdo#109271]) +29 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6281/fi-bdw-samus/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html

  * igt@runner@aborted:
    - fi-bsw-n3050:       NOTRUN -> [FAIL][8] ([fdo#109271] / [i915#1436] / [i915#3428])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6281/fi-bsw-n3050/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@gem_exec_suspend@basic-s3:
    - fi-bdw-samus:       [INCOMPLETE][9] ([i915#146] / [i915#4173]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/fi-bdw-samus/igt@gem_exec_suspend@basic-s3.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6281/fi-bdw-samus/igt@gem_exec_suspend@basic-s3.html

  * igt@kms_chamelium@hdmi-edid-read:
    - fi-kbl-7500u:       [FAIL][11] ([i915#3449]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/fi-kbl-7500u/igt@kms_chamelium@hdmi-edid-read.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6281/fi-kbl-7500u/igt@kms_chamelium@hdmi-edid-read.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#146]: https://gitlab.freedesktop.org/drm/intel/issues/146
  [i915#2940]: https://gitlab.freedesktop.org/drm/intel/issues/2940
  [i915#3428]: https://gitlab.freedesktop.org/drm/intel/issues/3428
  [i915#3449]: https://gitlab.freedesktop.org/drm/intel/issues/3449
  [i915#3718]: https://gitlab.freedesktop.org/drm/intel/issues/3718
  [i915#4173]: https://gitlab.freedesktop.org/drm/intel/issues/4173


Participating hosts (33 -> 32)
------------------------------

  Additional (1): fi-ilk-650 
  Missing    (2): fi-tgl-1115g4 fi-bsw-cyan 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6229 -> IGTPW_6281

  CI-20190529: 20190529
  CI_DRM_10681: fe9b639a95a08713c8ee4ef110ce6a6388c9f9f2 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6281: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6281/index.html
  IGT_6229: dff598c339a2da647f15c86d0015e16378c7ea9b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git



== Testlist changes ==

+igt@kms_bw@linear-tiling-1-displays-1920x1080p
+igt@kms_bw@linear-tiling-1-displays-2560x1440p
+igt@kms_bw@linear-tiling-1-displays-3840x2160p
+igt@kms_bw@linear-tiling-2-displays-1920x1080p
+igt@kms_bw@linear-tiling-2-displays-2560x1440p
+igt@kms_bw@linear-tiling-2-displays-3840x2160p
+igt@kms_bw@linear-tiling-3-displays-1920x1080p
+igt@kms_bw@linear-tiling-3-displays-2560x1440p
+igt@kms_bw@linear-tiling-3-displays-3840x2160p
+igt@kms_bw@linear-tiling-4-displays-1920x1080p
+igt@kms_bw@linear-tiling-4-displays-2560x1440p
+igt@kms_bw@linear-tiling-4-displays-3840x2160p
+igt@kms_bw@linear-tiling-5-displays-1920x1080p
+igt@kms_bw@linear-tiling-5-displays-2560x1440p
+igt@kms_bw@linear-tiling-5-displays-3840x2160p
+igt@kms_bw@linear-tiling-6-displays-1920x1080p
+igt@kms_bw@linear-tiling-6-displays-2560x1440p
+igt@kms_bw@linear-tiling-6-displays-3840x2160p

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6281/index.html

--===============0403468579664914978==
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
<tr><td><b>Series:</b></td><td>tests/kms_bw: Add generic commit test for bandwidth validation</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/95425/">https://patchwork.freedesktop.org/series/95425/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6281/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6281/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_6229 -&gt; IGTPW_6281</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6281/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6281 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@amdgpu/amd_cs_nop@nop-compute0:</p>
<ul>
<li>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6281/fi-ilk-650/igt@amdgpu/amd_cs_nop@nop-compute0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +35 similar issues</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>fi-bdw-samus:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6281/fi-bdw-samus/igt@core_hotunplug@unbind-rebind.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3718">i915#3718</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/fi-bsw-n3050/igt@i915_selftest@live@execlists.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6281/fi-bsw-n3050/igt@i915_selftest@live@execlists.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2940">i915#2940</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-hpd-fast:</p>
<ul>
<li>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6281/fi-ilk-650/igt@kms_chamelium@dp-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-edid-read:</p>
<ul>
<li>fi-bdw-samus:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6281/fi-bdw-samus/igt@kms_chamelium@hdmi-edid-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:</p>
<ul>
<li>fi-bdw-samus:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6281/fi-bdw-samus/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +29 similar issues</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6281/fi-bsw-n3050/igt@runner@aborted.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3428">i915#3428</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>fi-bdw-samus:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/fi-bdw-samus/igt@gem_exec_suspend@basic-s3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/146">i915#146</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4173">i915#4173</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6281/fi-bdw-samus/igt@gem_exec_suspend@basic-s3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-edid-read:</p>
<ul>
<li>fi-kbl-7500u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/fi-kbl-7500u/igt@kms_chamelium@hdmi-edid-read.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3449">i915#3449</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6281/fi-kbl-7500u/igt@kms_chamelium@hdmi-edid-read.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Participating hosts (33 -&gt; 32)</h2>
<p>Additional (1): fi-ilk-650 <br />
  Missing    (2): fi-tgl-1115g4 fi-bsw-cyan </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6229 -&gt; IGTPW_6281</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_10681: fe9b639a95a08713c8ee4ef110ce6a6388c9f9f2 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_6281: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6281/index.html<br />
  IGT_6229: dff598c339a2da647f15c86d0015e16378c7ea9b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<p>== Testlist changes ==</p>
<p>+igt@kms_bw@linear-tiling-1-displays-1920x1080p<br />
+igt@kms_bw@linear-tiling-1-displays-2560x1440p<br />
+igt@kms_bw@linear-tiling-1-displays-3840x2160p<br />
+igt@kms_bw@linear-tiling-2-displays-1920x1080p<br />
+igt@kms_bw@linear-tiling-2-displays-2560x1440p<br />
+igt@kms_bw@linear-tiling-2-displays-3840x2160p<br />
+igt@kms_bw@linear-tiling-3-displays-1920x1080p<br />
+igt@kms_bw@linear-tiling-3-displays-2560x1440p<br />
+igt@kms_bw@linear-tiling-3-displays-3840x2160p<br />
+igt@kms_bw@linear-tiling-4-displays-1920x1080p<br />
+igt@kms_bw@linear-tiling-4-displays-2560x1440p<br />
+igt@kms_bw@linear-tiling-4-displays-3840x2160p<br />
+igt@kms_bw@linear-tiling-5-displays-1920x1080p<br />
+igt@kms_bw@linear-tiling-5-displays-2560x1440p<br />
+igt@kms_bw@linear-tiling-5-displays-3840x2160p<br />
+igt@kms_bw@linear-tiling-6-displays-1920x1080p<br />
+igt@kms_bw@linear-tiling-6-displays-2560x1440p<br />
+igt@kms_bw@linear-tiling-6-displays-3840x2160p</p>

</body>
</html>

--===============0403468579664914978==--
