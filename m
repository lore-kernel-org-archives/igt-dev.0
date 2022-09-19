Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============2423216660057510129=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ananya Sharma" <ananya.sharma@intel.com>
Date: Mon, 19 Sep 2022 12:01:53 -0000
Message-ID: <166358891392.28330.13869147275733054193@emeril.freedesktop.org>
References: <20220919095442.666253-1-ananya.sharma@intel.com>
In-Reply-To: <20220919095442.666253-1-ananya.sharma@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgSUdUIGNs?=
 =?utf-8?q?ean-up_tasks_=28rev5=29?=
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

--===============2423216660057510129==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: IGT clean-up tasks (rev5)
URL   : https://patchwork.freedesktop.org/series/104318/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_12154 -> IGTPW_7798
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/index.html

Participating hosts (44 -> 42)
------------------------------

  Missing    (2): fi-ctg-p8600 fi-bdw-samus 

Known issues
------------

  Here are the changes found in IGTPW_7798 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@debugfs_test@read_all_entries:
    - fi-blb-e6850:       [PASS][1] -> [INCOMPLETE][2] ([i915#6863])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12154/fi-blb-e6850/igt@debugfs_test@read_all_entries.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/fi-blb-e6850/igt@debugfs_test@read_all_entries.html

  
#### Possible fixes ####

  * igt@fbdev@read:
    - {fi-tgl-mst}:       [SKIP][3] ([i915#2582]) -> [PASS][4] +3 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12154/fi-tgl-mst/igt@fbdev@read.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/fi-tgl-mst/igt@fbdev@read.html

  * igt@i915_selftest@live@reset:
    - {bat-rpls-1}:       [DMESG-FAIL][5] ([i915#4983]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12154/bat-rpls-1/igt@i915_selftest@live@reset.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/bat-rpls-1/igt@i915_selftest@live@reset.html

  
#### Warnings ####

  * igt@runner@aborted:
    - fi-blb-e6850:       [FAIL][7] ([fdo#109271] / [i915#2403] / [i915#4312]) -> [FAIL][8] ([i915#2403] / [i915#4312])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12154/fi-blb-e6850/igt@runner@aborted.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/fi-blb-e6850/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#2403]: https://gitlab.freedesktop.org/drm/intel/issues/2403
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#5537]: https://gitlab.freedesktop.org/drm/intel/issues/5537
  [i915#6106]: https://gitlab.freedesktop.org/drm/intel/issues/6106
  [i915#6367]: https://gitlab.freedesktop.org/drm/intel/issues/6367
  [i915#6599]: https://gitlab.freedesktop.org/drm/intel/issues/6599
  [i915#6863]: https://gitlab.freedesktop.org/drm/intel/issues/6863


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6656 -> IGTPW_7798

  CI-20190529: 20190529
  CI_DRM_12154: 3525875cb7903ed98c5b99d4f9d8b0b16b1d7f3f @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7798: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/index.html
  IGT_6656: 24100c4e181c50e3678aeca9c641b8a43555ad73 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@kms_universal_plane@cursor-fb-leak
+igt@kms_universal_plane@disable-primary-vs-flip
+igt@kms_universal_plane@universal-plane-functional
+igt@kms_universal_plane@universal-plane-pageflip-windowed
+igt@kms_universal_plane@universal-plane-sanity
-igt@kms_universal_plane@cursor-fb-leak-pipe-a
-igt@kms_universal_plane@cursor-fb-leak-pipe-b
-igt@kms_universal_plane@cursor-fb-leak-pipe-c
-igt@kms_universal_plane@cursor-fb-leak-pipe-d
-igt@kms_universal_plane@cursor-fb-leak-pipe-e
-igt@kms_universal_plane@cursor-fb-leak-pipe-f
-igt@kms_universal_plane@disable-primary-vs-flip-pipe-a
-igt@kms_universal_plane@disable-primary-vs-flip-pipe-b
-igt@kms_universal_plane@disable-primary-vs-flip-pipe-c
-igt@kms_universal_plane@disable-primary-vs-flip-pipe-d
-igt@kms_universal_plane@disable-primary-vs-flip-pipe-e
-igt@kms_universal_plane@disable-primary-vs-flip-pipe-f
-igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-a
-igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-b
-igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-c
-igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-d
-igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-e
-igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-f
-igt@kms_universal_plane@universal-plane-pipe-a-functional
-igt@kms_universal_plane@universal-plane-pipe-a-sanity
-igt@kms_universal_plane@universal-plane-pipe-b-functional
-igt@kms_universal_plane@universal-plane-pipe-b-sanity
-igt@kms_universal_plane@universal-plane-pipe-c-functional
-igt@kms_universal_plane@universal-plane-pipe-c-sanity
-igt@kms_universal_plane@universal-plane-pipe-d-functional
-igt@kms_universal_plane@universal-plane-pipe-d-sanity
-igt@kms_universal_plane@universal-plane-pipe-e-functional
-igt@kms_universal_plane@universal-plane-pipe-e-sanity
-igt@kms_universal_plane@universal-plane-pipe-f-functional
-igt@kms_universal_plane@universal-plane-pipe-f-sanity

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/index.html

--===============2423216660057510129==
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
<tr><td><b>Series:</b></td><td>IGT clean-up tasks (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/104318/">https://patchwork.freedesktop.org/series/104318/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12154 -&gt; IGTPW_7798</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/index.html</p>
<h2>Participating hosts (44 -&gt; 42)</h2>
<p>Missing    (2): fi-ctg-p8600 fi-bdw-samus </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7798 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@debugfs_test@read_all_entries:<ul>
<li>fi-blb-e6850:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12154/fi-blb-e6850/igt@debugfs_test@read_all_entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/fi-blb-e6850/igt@debugfs_test@read_all_entries.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6863">i915#6863</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>{fi-tgl-mst}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12154/fi-tgl-mst/igt@fbdev@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2582">i915#2582</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/fi-tgl-mst/igt@fbdev@read.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@reset:</p>
<ul>
<li>{bat-rpls-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12154/bat-rpls-1/igt@i915_selftest@live@reset.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4983">i915#4983</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/bat-rpls-1/igt@i915_selftest@live@reset.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@runner@aborted:<ul>
<li>fi-blb-e6850:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12154/fi-blb-e6850/igt@runner@aborted.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2403">i915#2403</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/fi-blb-e6850/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2403">i915#2403</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6656 -&gt; IGTPW_7798</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12154: 3525875cb7903ed98c5b99d4f9d8b0b16b1d7f3f @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_7798: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7798/index.html<br />
  IGT_6656: 24100c4e181c50e3678aeca9c641b8a43555ad73 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@kms_universal_plane@cursor-fb-leak<br />
+igt@kms_universal_plane@disable-primary-vs-flip<br />
+igt@kms_universal_plane@universal-plane-functional<br />
+igt@kms_universal_plane@universal-plane-pageflip-windowed<br />
+igt@kms_universal_plane@universal-plane-sanity<br />
-igt@kms_universal_plane@cursor-fb-leak-pipe-a<br />
-igt@kms_universal_plane@cursor-fb-leak-pipe-b<br />
-igt@kms_universal_plane@cursor-fb-leak-pipe-c<br />
-igt@kms_universal_plane@cursor-fb-leak-pipe-d<br />
-igt@kms_universal_plane@cursor-fb-leak-pipe-e<br />
-igt@kms_universal_plane@cursor-fb-leak-pipe-f<br />
-igt@kms_universal_plane@disable-primary-vs-flip-pipe-a<br />
-igt@kms_universal_plane@disable-primary-vs-flip-pipe-b<br />
-igt@kms_universal_plane@disable-primary-vs-flip-pipe-c<br />
-igt@kms_universal_plane@disable-primary-vs-flip-pipe-d<br />
-igt@kms_universal_plane@disable-primary-vs-flip-pipe-e<br />
-igt@kms_universal_plane@disable-primary-vs-flip-pipe-f<br />
-igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-a<br />
-igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-b<br />
-igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-c<br />
-igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-d<br />
-igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-e<br />
-igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-f<br />
-igt@kms_universal_plane@universal-plane-pipe-a-functional<br />
-igt@kms_universal_plane@universal-plane-pipe-a-sanity<br />
-igt@kms_universal_plane@universal-plane-pipe-b-functional<br />
-igt@kms_universal_plane@universal-plane-pipe-b-sanity<br />
-igt@kms_universal_plane@universal-plane-pipe-c-functional<br />
-igt@kms_universal_plane@universal-plane-pipe-c-sanity<br />
-igt@kms_universal_plane@universal-plane-pipe-d-functional<br />
-igt@kms_universal_plane@universal-plane-pipe-d-sanity<br />
-igt@kms_universal_plane@universal-plane-pipe-e-functional<br />
-igt@kms_universal_plane@universal-plane-pipe-e-sanity<br />
-igt@kms_universal_plane@universal-plane-pipe-f-functional<br />
-igt@kms_universal_plane@universal-plane-pipe-f-sanity</p>

</body>
</html>

--===============2423216660057510129==--
