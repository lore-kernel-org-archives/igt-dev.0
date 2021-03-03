Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 03 Mar 2021 16:12:00 -0000
Message-ID: <161478792091.23598.8626702740866388761@emeril.freedesktop.org>
References: <20210302225334.361966-1-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20210302225334.361966-1-alan.previn.teres.alexis@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgSW50cm9k?=
 =?utf-8?q?uce_PXP_Test?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1615939733=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1615939733==
Content-Type: multipart/alternative;
 boundary="===============2854784131435177238=="

--===============2854784131435177238==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Introduce PXP Test
URL   : https://patchwork.freedesktop.org/series/87570/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9823 -> IGTPW_5567
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5567/index.html

Known issues
------------

  Here are the changes found in IGTPW_5567 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@amdgpu/amd_cs_nop@nop-compute0:
    - fi-cml-s:           NOTRUN -> [SKIP][1] ([fdo#109315]) +17 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5567/fi-cml-s/igt@amdgpu/amd_cs_nop@nop-compute0.html

  * igt@amdgpu/amd_cs_nop@sync-fork-compute0:
    - fi-snb-2600:        NOTRUN -> [SKIP][2] ([fdo#109271]) +17 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5567/fi-snb-2600/igt@amdgpu/amd_cs_nop@sync-fork-compute0.html

  * igt@gem_exec_fence@basic-wait@bcs0:
    - fi-cml-s:           NOTRUN -> [SKIP][3] ([i915#1208]) +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5567/fi-cml-s/igt@gem_exec_fence@basic-wait@bcs0.html

  * igt@gem_huc_copy@huc-copy:
    - fi-cml-s:           NOTRUN -> [SKIP][4] ([i915#2190])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5567/fi-cml-s/igt@gem_huc_copy@huc-copy.html

  * igt@kms_chamelium@dp-hpd-fast:
    - fi-cml-s:           NOTRUN -> [SKIP][5] ([fdo#109284] / [fdo#111827]) +8 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5567/fi-cml-s/igt@kms_chamelium@dp-hpd-fast.html

  * igt@kms_force_connector_basic@force-load-detect:
    - fi-cml-s:           NOTRUN -> [SKIP][6] ([fdo#109285])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5567/fi-cml-s/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
    - fi-cml-s:           NOTRUN -> [SKIP][7] ([fdo#109278] / [i915#533])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5567/fi-cml-s/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@client:
    - fi-glk-dsi:         [DMESG-FAIL][8] ([i915#3047]) -> [PASS][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9823/fi-glk-dsi/igt@i915_selftest@live@client.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5567/fi-glk-dsi/igt@i915_selftest@live@client.html

  * igt@i915_selftest@live@hangcheck:
    - fi-snb-2600:        [INCOMPLETE][10] ([i915#2782]) -> [PASS][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9823/fi-snb-2600/igt@i915_selftest@live@hangcheck.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5567/fi-snb-2600/igt@i915_selftest@live@hangcheck.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1208]: https://gitlab.freedesktop.org/drm/intel/issues/1208
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2782]: https://gitlab.freedesktop.org/drm/intel/issues/2782
  [i915#3047]: https://gitlab.freedesktop.org/drm/intel/issues/3047
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533


Participating hosts (38 -> 32)
------------------------------

  Additional (1): fi-cml-s 
  Missing    (7): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-ctg-p8600 fi-dg1-1 fi-cml-drallion fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6020 -> IGTPW_5567

  CI-20190529: 20190529
  CI_DRM_9823: d559dcad6da00e498bb2c41967a9e5487545b8ba @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5567: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5567/index.html
  IGT_6020: 8382d9e87bba39ecc6fa879b2491e28c7fb2e3c7 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@i915_pxp@create-protected-buffer
+igt@i915_pxp@create-regular-buffer
+igt@i915_pxp@create-regular-context-1
+igt@i915_pxp@create-regular-context-2
+igt@i915_pxp@create-valid-protected-context
+igt@i915_pxp@fail-invalid-protected-context
+igt@i915_pxp@hw-rejects-pxp-buffer
+igt@i915_pxp@hw-rejects-pxp-context
+igt@i915_pxp@protected-encrypted-src-copy-not-readible
+igt@i915_pxp@protected-raw-src-copy-not-readible
+igt@i915_pxp@regular-baseline-src-copy-readible
+igt@i915_pxp@reject-modify-context-protection-off-1
+igt@i915_pxp@reject-modify-context-protection-off-2
+igt@i915_pxp@reject-modify-context-protection-off-3
+igt@i915_pxp@reject-modify-context-protection-on
+igt@i915_pxp@reject-old-buffer-execution-after-suspend-resume
+igt@i915_pxp@reject-old-context-execution-after-suspend-resume
+igt@i915_pxp@verify-pxp-key-change-after-suspend-resume

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5567/index.html

--===============2854784131435177238==
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
<tr><td><b>Series:</b></td><td>Introduce PXP Test</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/87570/">https://patchwork.freedesktop.org/series/87570/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5567/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5567/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9823 -&gt; IGTPW_5567</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5567/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5567 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@amdgpu/amd_cs_nop@nop-compute0:</p>
<ul>
<li>fi-cml-s:           NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5567/fi-cml-s/igt@amdgpu/amd_cs_nop@nop-compute0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a>) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@amdgpu/amd_cs_nop@sync-fork-compute0:</p>
<ul>
<li>fi-snb-2600:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5567/fi-snb-2600/igt@amdgpu/amd_cs_nop@sync-fork-compute0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-wait@bcs0:</p>
<ul>
<li>fi-cml-s:           NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5567/fi-cml-s/igt@gem_exec_fence@basic-wait@bcs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1208">i915#1208</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-cml-s:           NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5567/fi-cml-s/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-hpd-fast:</p>
<ul>
<li>fi-cml-s:           NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5567/fi-cml-s/igt@kms_chamelium@dp-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109284">fdo#109284</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>fi-cml-s:           NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5567/fi-cml-s/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:</p>
<ul>
<li>fi-cml-s:           NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5567/fi-cml-s/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@client:</p>
<ul>
<li>fi-glk-dsi:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9823/fi-glk-dsi/igt@i915_selftest@live@client.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3047">i915#3047</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5567/fi-glk-dsi/igt@i915_selftest@live@client.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>fi-snb-2600:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9823/fi-snb-2600/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2782">i915#2782</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5567/fi-snb-2600/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Participating hosts (38 -&gt; 32)</h2>
<p>Additional (1): fi-cml-s <br />
  Missing    (7): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-ctg-p8600 fi-dg1-1 fi-cml-drallion fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6020 -&gt; IGTPW_5567</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9823: d559dcad6da00e498bb2c41967a9e5487545b8ba @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5567: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5567/index.html<br />
  IGT_6020: 8382d9e87bba39ecc6fa879b2491e28c7fb2e3c7 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>
<p>== Testlist changes ==</p>
<p>+igt@i915_pxp@create-protected-buffer<br />
+igt@i915_pxp@create-regular-buffer<br />
+igt@i915_pxp@create-regular-context-1<br />
+igt@i915_pxp@create-regular-context-2<br />
+igt@i915_pxp@create-valid-protected-context<br />
+igt@i915_pxp@fail-invalid-protected-context<br />
+igt@i915_pxp@hw-rejects-pxp-buffer<br />
+igt@i915_pxp@hw-rejects-pxp-context<br />
+igt@i915_pxp@protected-encrypted-src-copy-not-readible<br />
+igt@i915_pxp@protected-raw-src-copy-not-readible<br />
+igt@i915_pxp@regular-baseline-src-copy-readible<br />
+igt@i915_pxp@reject-modify-context-protection-off-1<br />
+igt@i915_pxp@reject-modify-context-protection-off-2<br />
+igt@i915_pxp@reject-modify-context-protection-off-3<br />
+igt@i915_pxp@reject-modify-context-protection-on<br />
+igt@i915_pxp@reject-old-buffer-execution-after-suspend-resume<br />
+igt@i915_pxp@reject-old-context-execution-after-suspend-resume<br />
+igt@i915_pxp@verify-pxp-key-change-after-suspend-resume</p>

</body>
</html>

--===============2854784131435177238==--

--===============1615939733==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1615939733==--
