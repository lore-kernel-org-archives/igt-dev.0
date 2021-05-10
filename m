Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 10 May 2021 14:00:03 -0000
Message-ID: <162065520323.9575.5100764562124858043@emeril.freedesktop.org>
References: <20210510131421.3777-1-venkata.sai.patnana@intel.com>
In-Reply-To: <20210510131421.3777-1-venkata.sai.patnana@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fplane=3A_Restrict_the_test_execution_to_two_pipes_=28rev2?=
 =?utf-8?q?=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1078909921=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Patnana, Venkata Sai" <venkata.sai.patnana@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1078909921==
Content-Type: multipart/alternative;
 boundary="===============3377985653601775726=="

--===============3377985653601775726==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_plane: Restrict the test execution to two pipes (rev2)
URL   : https://patchwork.freedesktop.org/series/89837/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_10061 -> IGTPW_5798
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5798/index.html

Known issues
------------

  Here are the changes found in IGTPW_5798 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@amdgpu/amd_cs_nop@sync-fork-compute0:
    - fi-snb-2600:        NOTRUN -> [SKIP][1] ([fdo#109271]) +17 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5798/fi-snb-2600/igt@amdgpu/amd_cs_nop@sync-fork-compute0.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@hangcheck:
    - fi-snb-2600:        [INCOMPLETE][2] ([i915#2782]) -> [PASS][3]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10061/fi-snb-2600/igt@i915_selftest@live@hangcheck.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5798/fi-snb-2600/igt@i915_selftest@live@hangcheck.html

  * igt@kms_frontbuffer_tracking@basic:
    - {fi-rkl-11500t}:    [SKIP][4] ([i915#1849] / [i915#3180]) -> [PASS][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10061/fi-rkl-11500t/igt@kms_frontbuffer_tracking@basic.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5798/fi-rkl-11500t/igt@kms_frontbuffer_tracking@basic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#2782]: https://gitlab.freedesktop.org/drm/intel/issues/2782
  [i915#3180]: https://gitlab.freedesktop.org/drm/intel/issues/3180
  [i915#3277]: https://gitlab.freedesktop.org/drm/intel/issues/3277
  [i915#3283]: https://gitlab.freedesktop.org/drm/intel/issues/3283


Participating hosts (42 -> 39)
------------------------------

  Missing    (3): fi-ilk-m540 fi-dg1-1 fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6081 -> IGTPW_5798

  CI-20190529: 20190529
  CI_DRM_10061: 0746f5cee77dbba4c95c48bdbe5adc899246dd76 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5798: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5798/index.html
  IGT_6081: fdff4bba7abf9cb7c8ea21abf14e36d344ebb8c1 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@kms_plane@pixel-format-planes
+igt@kms_plane@pixel-format-planes-source-clamping
+igt@kms_plane@plane-panning-bottom-right-planes
+igt@kms_plane@plane-panning-bottom-right-suspend-planes
+igt@kms_plane@plane-panning-top-left-planes
+igt@kms_plane@plane-position-covered-planes
+igt@kms_plane@plane-position-hole-dpms-planes
+igt@kms_plane@plane-position-hole-planes
-igt@kms_plane@pixel-format-pipe-a-planes
-igt@kms_plane@pixel-format-pipe-a-planes-source-clamping
-igt@kms_plane@pixel-format-pipe-b-planes
-igt@kms_plane@pixel-format-pipe-b-planes-source-clamping
-igt@kms_plane@pixel-format-pipe-c-planes
-igt@kms_plane@pixel-format-pipe-c-planes-source-clamping
-igt@kms_plane@pixel-format-pipe-d-planes
-igt@kms_plane@pixel-format-pipe-d-planes-source-clamping
-igt@kms_plane@pixel-format-pipe-e-planes
-igt@kms_plane@pixel-format-pipe-e-planes-source-clamping
-igt@kms_plane@pixel-format-pipe-f-planes
-igt@kms_plane@pixel-format-pipe-f-planes-source-clamping
-igt@kms_plane@plane-panning-bottom-right-pipe-a-planes
-igt@kms_plane@plane-panning-bottom-right-pipe-b-planes
-igt@kms_plane@plane-panning-bottom-right-pipe-c-planes
-igt@kms_plane@plane-panning-bottom-right-pipe-d-planes
-igt@kms_plane@plane-panning-bottom-right-pipe-e-planes
-igt@kms_plane@plane-panning-bottom-right-pipe-f-planes
-igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes
-igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes
-igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes
-igt@kms_plane@plane-panning-bottom-right-suspend-pipe-d-planes
-igt@kms_plane@plane-panning-bottom-right-suspend-pipe-e-planes
-igt@kms_plane@plane-panning-bottom-right-suspend-pipe-f-planes
-igt@kms_plane@plane-panning-top-left-pipe-a-planes
-igt@kms_plane@plane-panning-top-left-pipe-b-planes
-igt@kms_plane@plane-panning-top-left-pipe-c-planes
-igt@kms_plane@plane-panning-top-left-pipe-d-planes
-igt@kms_plane@plane-panning-top-left-pipe-e-planes
-igt@kms_plane@plane-panning-top-left-pipe-f-planes
-igt@kms_plane@plane-position-covered-pipe-a-planes
-igt@kms_plane@plane-position-covered-pipe-b-planes
-igt@kms_plane@plane-position-covered-pipe-c-planes
-igt@kms_plane@plane-position-covered-pipe-d-planes
-igt@kms_plane@plane-position-covered-pipe-e-planes
-igt@kms_plane@plane-position-covered-pipe-f-planes
-igt@kms_plane@plane-position-hole-dpms-pipe-a-planes
-igt@kms_plane@plane-position-hole-dpms-pipe-b-planes
-igt@kms_plane@plane-position-hole-dpms-pipe-c-planes
-igt@kms_plane@plane-position-hole-dpms-pipe-d-planes
-igt@kms_plane@plane-position-hole-dpms-pipe-e-planes
-igt@kms_plane@plane-position-hole-dpms-pipe-f-planes
-igt@kms_plane@plane-position-hole-pipe-a-planes
-igt@kms_plane@plane-position-hole-pipe-b-planes
-igt@kms_plane@plane-position-hole-pipe-c-planes
-igt@kms_plane@plane-position-hole-pipe-d-planes
-igt@kms_plane@plane-position-hole-pipe-e-planes
-igt@kms_plane@plane-position-hole-pipe-f-planes

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5798/index.html

--===============3377985653601775726==
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
<tr><td><b>Series:</b></td><td>tests/kms_plane: Restrict the test execution to two pipes (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/89837/">https://patchwork.freedesktop.org/series/89837/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5798/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5798/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10061 -&gt; IGTPW_5798</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5798/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5798 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@amdgpu/amd_cs_nop@sync-fork-compute0:<ul>
<li>fi-snb-2600:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5798/fi-snb-2600/igt@amdgpu/amd_cs_nop@sync-fork-compute0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +17 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>fi-snb-2600:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10061/fi-snb-2600/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2782">i915#2782</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5798/fi-snb-2600/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>{fi-rkl-11500t}:    <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10061/fi-rkl-11500t/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3180">i915#3180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5798/fi-rkl-11500t/igt@kms_frontbuffer_tracking@basic.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (42 -&gt; 39)</h2>
<p>Missing    (3): fi-ilk-m540 fi-dg1-1 fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6081 -&gt; IGTPW_5798</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_10061: 0746f5cee77dbba4c95c48bdbe5adc899246dd76 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5798: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5798/index.html<br />
  IGT_6081: fdff4bba7abf9cb7c8ea21abf14e36d344ebb8c1 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>
<p>== Testlist changes ==</p>
<p>+igt@kms_plane@pixel-format-planes<br />
+igt@kms_plane@pixel-format-planes-source-clamping<br />
+igt@kms_plane@plane-panning-bottom-right-planes<br />
+igt@kms_plane@plane-panning-bottom-right-suspend-planes<br />
+igt@kms_plane@plane-panning-top-left-planes<br />
+igt@kms_plane@plane-position-covered-planes<br />
+igt@kms_plane@plane-position-hole-dpms-planes<br />
+igt@kms_plane@plane-position-hole-planes<br />
-igt@kms_plane@pixel-format-pipe-a-planes<br />
-igt@kms_plane@pixel-format-pipe-a-planes-source-clamping<br />
-igt@kms_plane@pixel-format-pipe-b-planes<br />
-igt@kms_plane@pixel-format-pipe-b-planes-source-clamping<br />
-igt@kms_plane@pixel-format-pipe-c-planes<br />
-igt@kms_plane@pixel-format-pipe-c-planes-source-clamping<br />
-igt@kms_plane@pixel-format-pipe-d-planes<br />
-igt@kms_plane@pixel-format-pipe-d-planes-source-clamping<br />
-igt@kms_plane@pixel-format-pipe-e-planes<br />
-igt@kms_plane@pixel-format-pipe-e-planes-source-clamping<br />
-igt@kms_plane@pixel-format-pipe-f-planes<br />
-igt@kms_plane@pixel-format-pipe-f-planes-source-clamping<br />
-igt@kms_plane@plane-panning-bottom-right-pipe-a-planes<br />
-igt@kms_plane@plane-panning-bottom-right-pipe-b-planes<br />
-igt@kms_plane@plane-panning-bottom-right-pipe-c-planes<br />
-igt@kms_plane@plane-panning-bottom-right-pipe-d-planes<br />
-igt@kms_plane@plane-panning-bottom-right-pipe-e-planes<br />
-igt@kms_plane@plane-panning-bottom-right-pipe-f-planes<br />
-igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes<br />
-igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes<br />
-igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes<br />
-igt@kms_plane@plane-panning-bottom-right-suspend-pipe-d-planes<br />
-igt@kms_plane@plane-panning-bottom-right-suspend-pipe-e-planes<br />
-igt@kms_plane@plane-panning-bottom-right-suspend-pipe-f-planes<br />
-igt@kms_plane@plane-panning-top-left-pipe-a-planes<br />
-igt@kms_plane@plane-panning-top-left-pipe-b-planes<br />
-igt@kms_plane@plane-panning-top-left-pipe-c-planes<br />
-igt@kms_plane@plane-panning-top-left-pipe-d-planes<br />
-igt@kms_plane@plane-panning-top-left-pipe-e-planes<br />
-igt@kms_plane@plane-panning-top-left-pipe-f-planes<br />
-igt@kms_plane@plane-position-covered-pipe-a-planes<br />
-igt@kms_plane@plane-position-covered-pipe-b-planes<br />
-igt@kms_plane@plane-position-covered-pipe-c-planes<br />
-igt@kms_plane@plane-position-covered-pipe-d-planes<br />
-igt@kms_plane@plane-position-covered-pipe-e-planes<br />
-igt@kms_plane@plane-position-covered-pipe-f-planes<br />
-igt@kms_plane@plane-position-hole-dpms-pipe-a-planes<br />
-igt@kms_plane@plane-position-hole-dpms-pipe-b-planes<br />
-igt@kms_plane@plane-position-hole-dpms-pipe-c-planes<br />
-igt@kms_plane@plane-position-hole-dpms-pipe-d-planes<br />
-igt@kms_plane@plane-position-hole-dpms-pipe-e-planes<br />
-igt@kms_plane@plane-position-hole-dpms-pipe-f-planes<br />
-igt@kms_plane@plane-position-hole-pipe-a-planes<br />
-igt@kms_plane@plane-position-hole-pipe-b-planes<br />
-igt@kms_plane@plane-position-hole-pipe-c-planes<br />
-igt@kms_plane@plane-position-hole-pipe-d-planes<br />
-igt@kms_plane@plane-position-hole-pipe-e-planes<br />
-igt@kms_plane@plane-position-hole-pipe-f-planes</p>

</body>
</html>

--===============3377985653601775726==--

--===============1078909921==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1078909921==--
