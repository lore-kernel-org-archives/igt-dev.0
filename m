Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============5189134340154816416=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 25 Aug 2021 06:26:35 -0000
Message-ID: <162987279589.17672.8099019382459642999@emeril.freedesktop.org>
References: <20210825053109.336142-1-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20210825053109.336142-1-alan.previn.teres.alexis@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgSW50cm9k?=
 =?utf-8?q?uce_PXP_Test_=28rev7=29?=
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
To: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============5189134340154816416==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Introduce PXP Test (rev7)
URL   : https://patchwork.freedesktop.org/series/87570/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_10519 -> IGTPW_6151
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6151/index.html

Known issues
------------

  Here are the changes found in IGTPW_6151 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@execlists:
    - fi-bsw-n3050:       [PASS][1] -> [INCOMPLETE][2] ([i915#2940])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10519/fi-bsw-n3050/igt@i915_selftest@live@execlists.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6151/fi-bsw-n3050/igt@i915_selftest@live@execlists.html

  * igt@runner@aborted:
    - fi-bsw-n3050:       NOTRUN -> [FAIL][3] ([fdo#109271] / [i915#1436] / [i915#2722])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6151/fi-bsw-n3050/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence:
    - fi-rkl-11600:       [SKIP][4] ([i915#3919]) -> [PASS][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10519/fi-rkl-11600/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6151/fi-rkl-11600/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#2722]: https://gitlab.freedesktop.org/drm/intel/issues/2722
  [i915#2940]: https://gitlab.freedesktop.org/drm/intel/issues/2940
  [i915#3919]: https://gitlab.freedesktop.org/drm/intel/issues/3919


Participating hosts (40 -> 33)
------------------------------

  Missing    (7): fi-ilk-m540 bat-adls-5 fi-hsw-4200u fi-tgl-1115g4 fi-bsw-cyan fi-bdw-samus bat-jsl-1 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6185 -> IGTPW_6151

  CI-20190529: 20190529
  CI_DRM_10519: 3edb12bf2c3cd732bc930e3e418e4aeaaaf32ffa @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6151: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6151/index.html
  IGT_6185: 5dca04416f50576f464ebbd9aea96edccd7e4eab @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git



== Testlist changes ==

+igt@gem_pxp@create-protected-buffer
+igt@gem_pxp@create-regular-buffer
+igt@gem_pxp@create-regular-context-1
+igt@gem_pxp@create-regular-context-2
+igt@gem_pxp@create-valid-protected-context
+igt@gem_pxp@display-protected-crc
+igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted
+igt@gem_pxp@fail-invalid-protected-context
+igt@gem_pxp@hw-rejects-pxp-buffer
+igt@gem_pxp@hw-rejects-pxp-context
+igt@gem_pxp@protected-encrypted-src-copy-not-readible
+igt@gem_pxp@protected-raw-src-copy-not-readible
+igt@gem_pxp@regular-baseline-src-copy-readible
+igt@gem_pxp@reject-modify-context-protection-off-1
+igt@gem_pxp@reject-modify-context-protection-off-2
+igt@gem_pxp@reject-modify-context-protection-off-3
+igt@gem_pxp@reject-modify-context-protection-on
+igt@gem_pxp@verify-pxp-execution-after-suspend-resume
+igt@gem_pxp@verify-pxp-key-change-after-suspend-resume
+igt@gem_pxp@verify-pxp-stale-buf-execution
+igt@gem_pxp@verify-pxp-stale-buf-optout-execution
+igt@gem_pxp@verify-pxp-stale-ctx-execution

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6151/index.html

--===============5189134340154816416==
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
<tr><td><b>Series:</b></td><td>Introduce PXP Test (rev7)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/87570/">https://patchwork.freedesktop.org/series/87570/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6151/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6151/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10519 -&gt; IGTPW_6151</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6151/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6151 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10519/fi-bsw-n3050/igt@i915_selftest@live@execlists.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6151/fi-bsw-n3050/igt@i915_selftest@live@execlists.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2940">i915#2940</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6151/fi-bsw-n3050/igt@runner@aborted.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2722">i915#2722</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence:<ul>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10519/fi-rkl-11600/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3919">i915#3919</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6151/fi-rkl-11600/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Participating hosts (40 -&gt; 33)</h2>
<p>Missing    (7): fi-ilk-m540 bat-adls-5 fi-hsw-4200u fi-tgl-1115g4 fi-bsw-cyan fi-bdw-samus bat-jsl-1 </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6185 -&gt; IGTPW_6151</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_10519: 3edb12bf2c3cd732bc930e3e418e4aeaaaf32ffa @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_6151: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6151/index.html<br />
  IGT_6185: 5dca04416f50576f464ebbd9aea96edccd7e4eab @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<p>== Testlist changes ==</p>
<p>+igt@gem_pxp@create-protected-buffer<br />
+igt@gem_pxp@create-regular-buffer<br />
+igt@gem_pxp@create-regular-context-1<br />
+igt@gem_pxp@create-regular-context-2<br />
+igt@gem_pxp@create-valid-protected-context<br />
+igt@gem_pxp@display-protected-crc<br />
+igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted<br />
+igt@gem_pxp@fail-invalid-protected-context<br />
+igt@gem_pxp@hw-rejects-pxp-buffer<br />
+igt@gem_pxp@hw-rejects-pxp-context<br />
+igt@gem_pxp@protected-encrypted-src-copy-not-readible<br />
+igt@gem_pxp@protected-raw-src-copy-not-readible<br />
+igt@gem_pxp@regular-baseline-src-copy-readible<br />
+igt@gem_pxp@reject-modify-context-protection-off-1<br />
+igt@gem_pxp@reject-modify-context-protection-off-2<br />
+igt@gem_pxp@reject-modify-context-protection-off-3<br />
+igt@gem_pxp@reject-modify-context-protection-on<br />
+igt@gem_pxp@verify-pxp-execution-after-suspend-resume<br />
+igt@gem_pxp@verify-pxp-key-change-after-suspend-resume<br />
+igt@gem_pxp@verify-pxp-stale-buf-execution<br />
+igt@gem_pxp@verify-pxp-stale-buf-optout-execution<br />
+igt@gem_pxp@verify-pxp-stale-ctx-execution</p>

</body>
</html>

--===============5189134340154816416==--
