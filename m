Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 25 Mar 2021 13:47:54 -0000
Message-ID: <161668007405.15544.3609394494400633510@emeril.freedesktop.org>
References: <20210325054549.465386-1-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20210325054549.465386-1-alan.previn.teres.alexis@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgSW50cm9k?=
 =?utf-8?q?uce_PXP_Test_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1082487481=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1082487481==
Content-Type: multipart/alternative;
 boundary="===============8532173947005177007=="

--===============8532173947005177007==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Introduce PXP Test (rev2)
URL   : https://patchwork.freedesktop.org/series/87570/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9892 -> IGTPW_5660
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5660/index.html

Known issues
------------

  Here are the changes found in IGTPW_5660 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@amdgpu/amd_basic@semaphore:
    - fi-bsw-nick:        NOTRUN -> [SKIP][1] ([fdo#109271]) +17 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5660/fi-bsw-nick/igt@amdgpu/amd_basic@semaphore.html

  * igt@gem_render_tiled_blits@basic:
    - fi-tgl-y:           [PASS][2] -> [DMESG-WARN][3] ([i915#402])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9892/fi-tgl-y/igt@gem_render_tiled_blits@basic.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5660/fi-tgl-y/igt@gem_render_tiled_blits@basic.html

  * igt@runner@aborted:
    - fi-bdw-5557u:       NOTRUN -> [FAIL][4] ([i915#1602] / [i915#2029])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5660/fi-bdw-5557u/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@gem_exec_suspend@basic-s3:
    - fi-tgl-y:           [DMESG-WARN][5] ([i915#2411] / [i915#402]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9892/fi-tgl-y/igt@gem_exec_suspend@basic-s3.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5660/fi-tgl-y/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_flink_basic@bad-open:
    - fi-tgl-y:           [DMESG-WARN][7] ([i915#402]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9892/fi-tgl-y/igt@gem_flink_basic@bad-open.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5660/fi-tgl-y/igt@gem_flink_basic@bad-open.html

  * igt@i915_selftest@live@execlists:
    - fi-bsw-nick:        [INCOMPLETE][9] ([i915#2782] / [i915#2940]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9892/fi-bsw-nick/igt@i915_selftest@live@execlists.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5660/fi-bsw-nick/igt@i915_selftest@live@execlists.html

  * igt@i915_selftest@live@hangcheck:
    - {fi-hsw-gt1}:       [DMESG-WARN][11] -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9892/fi-hsw-gt1/igt@i915_selftest@live@hangcheck.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5660/fi-hsw-gt1/igt@i915_selftest@live@hangcheck.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#2029]: https://gitlab.freedesktop.org/drm/intel/issues/2029
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#2782]: https://gitlab.freedesktop.org/drm/intel/issues/2782
  [i915#2940]: https://gitlab.freedesktop.org/drm/intel/issues/2940
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402


Participating hosts (47 -> 42)
------------------------------

  Missing    (5): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-dg1-1 fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6046 -> IGTPW_5660

  CI-20190529: 20190529
  CI_DRM_9892: 928f83ba052b80754da4bebdd37a1b17c1157f1b @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5660: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5660/index.html
  IGT_6046: e76039273b1524147c43dba061756f06003d56ae @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@gem_pxp@allow-regular-ctx-old-prot-buff-execution-after-suspend-resume
+igt@gem_pxp@create-protected-buffer
+igt@gem_pxp@create-regular-buffer
+igt@gem_pxp@create-regular-context-1
+igt@gem_pxp@create-regular-context-2
+igt@gem_pxp@create-valid-protected-context
+igt@gem_pxp@display-protected-crc-without-hdcp
+igt@gem_pxp@display-protected-crc-with-hdcp
+igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted
+igt@gem_pxp@fail-invalid-protected-context
+igt@gem_pxp@hw-rejects-pxp-buffer
+igt@gem_pxp@hw-rejects-pxp-context
+igt@gem_pxp@old-prot-context-reports-reset-stat-after-suspend-resume
+igt@gem_pxp@protected-encrypted-src-copy-not-readible
+igt@gem_pxp@protected-raw-src-copy-not-readible
+igt@gem_pxp@regular-baseline-src-copy-readible
+igt@gem_pxp@reject-modify-context-protection-off-1
+igt@gem_pxp@reject-modify-context-protection-off-2
+igt@gem_pxp@reject-modify-context-protection-off-3
+igt@gem_pxp@reject-modify-context-protection-on
+igt@gem_pxp@reject-old-prot-buffer-execution-after-suspend-resume
+igt@gem_pxp@reject-old-prot-context-execution-after-suspend-resume
+igt@gem_pxp@verify-pxp-key-change-after-suspend-resume

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5660/index.html

--===============8532173947005177007==
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
<tr><td><b>Series:</b></td><td>Introduce PXP Test (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/87570/">https://patchwork.freedesktop.org/series/87570/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5660/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5660/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9892 -&gt; IGTPW_5660</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5660/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5660 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@amdgpu/amd_basic@semaphore:</p>
<ul>
<li>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5660/fi-bsw-nick/igt@amdgpu/amd_basic@semaphore.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_render_tiled_blits@basic:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9892/fi-tgl-y/igt@gem_render_tiled_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5660/fi-tgl-y/igt@gem_render_tiled_blits@basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5660/fi-bdw-5557u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2029">i915#2029</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9892/fi-tgl-y/igt@gem_exec_suspend@basic-s3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5660/fi-tgl-y/igt@gem_exec_suspend@basic-s3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_flink_basic@bad-open:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9892/fi-tgl-y/igt@gem_flink_basic@bad-open.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5660/fi-tgl-y/igt@gem_flink_basic@bad-open.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9892/fi-bsw-nick/igt@i915_selftest@live@execlists.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2782">i915#2782</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2940">i915#2940</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5660/fi-bsw-nick/igt@i915_selftest@live@execlists.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>{fi-hsw-gt1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9892/fi-hsw-gt1/igt@i915_selftest@live@hangcheck.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5660/fi-hsw-gt1/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (47 -&gt; 42)</h2>
<p>Missing    (5): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-dg1-1 fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6046 -&gt; IGTPW_5660</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9892: 928f83ba052b80754da4bebdd37a1b17c1157f1b @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5660: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5660/index.html<br />
  IGT_6046: e76039273b1524147c43dba061756f06003d56ae @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>
<p>== Testlist changes ==</p>
<p>+igt@gem_pxp@allow-regular-ctx-old-prot-buff-execution-after-suspend-resume<br />
+igt@gem_pxp@create-protected-buffer<br />
+igt@gem_pxp@create-regular-buffer<br />
+igt@gem_pxp@create-regular-context-1<br />
+igt@gem_pxp@create-regular-context-2<br />
+igt@gem_pxp@create-valid-protected-context<br />
+igt@gem_pxp@display-protected-crc-without-hdcp<br />
+igt@gem_pxp@display-protected-crc-with-hdcp<br />
+igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted<br />
+igt@gem_pxp@fail-invalid-protected-context<br />
+igt@gem_pxp@hw-rejects-pxp-buffer<br />
+igt@gem_pxp@hw-rejects-pxp-context<br />
+igt@gem_pxp@old-prot-context-reports-reset-stat-after-suspend-resume<br />
+igt@gem_pxp@protected-encrypted-src-copy-not-readible<br />
+igt@gem_pxp@protected-raw-src-copy-not-readible<br />
+igt@gem_pxp@regular-baseline-src-copy-readible<br />
+igt@gem_pxp@reject-modify-context-protection-off-1<br />
+igt@gem_pxp@reject-modify-context-protection-off-2<br />
+igt@gem_pxp@reject-modify-context-protection-off-3<br />
+igt@gem_pxp@reject-modify-context-protection-on<br />
+igt@gem_pxp@reject-old-prot-buffer-execution-after-suspend-resume<br />
+igt@gem_pxp@reject-old-prot-context-execution-after-suspend-resume<br />
+igt@gem_pxp@verify-pxp-key-change-after-suspend-resume</p>

</body>
</html>

--===============8532173947005177007==--

--===============1082487481==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1082487481==--
