Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============0191597909150300312=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 27 Oct 2021 13:33:22 -0000
Message-ID: <163534160255.4635.10462632736243565861@emeril.freedesktop.org>
References: <20211027105530.6570-1-jouni.hogander@intel.com>
In-Reply-To: <20211027105530.6570-1-jouni.hogander@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fpsr2=5Fsu=3A_add_biplanar_selective_update_tests_=28rev3?=
 =?utf-8?q?=29?=
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
To: "Hogander, Jouni" <jouni.hogander@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0191597909150300312==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_psr2_su: add biplanar selective update tests (rev3)
URL   : https://patchwork.freedesktop.org/series/96110/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_10796 -> IGTPW_6355
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6355/index.html

Participating hosts (39 -> 35)
------------------------------

  Missing    (4): fi-bsw-cyan bat-adlp-4 bat-dg1-6 bat-dg1-5 

Known issues
------------

  Here are the changes found in IGTPW_6355 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_suspend@basic-s0:
    - fi-kbl-soraka:      [PASS][1] -> [INCOMPLETE][2] ([i915#4221])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10796/fi-kbl-soraka/igt@gem_exec_suspend@basic-s0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6355/fi-kbl-soraka/igt@gem_exec_suspend@basic-s0.html

  * igt@kms_frontbuffer_tracking@basic:
    - fi-cml-u2:          [PASS][3] -> [DMESG-WARN][4] ([i915#4269])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10796/fi-cml-u2/igt@kms_frontbuffer_tracking@basic.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6355/fi-cml-u2/igt@kms_frontbuffer_tracking@basic.html

  
#### Possible fixes ####

  * igt@kms_frontbuffer_tracking@basic:
    - {fi-hsw-gt1}:       [DMESG-WARN][5] ([i915#4290]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10796/fi-hsw-gt1/igt@kms_frontbuffer_tracking@basic.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6355/fi-hsw-gt1/igt@kms_frontbuffer_tracking@basic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#4221]: https://gitlab.freedesktop.org/drm/intel/issues/4221
  [i915#4269]: https://gitlab.freedesktop.org/drm/intel/issues/4269
  [i915#4290]: https://gitlab.freedesktop.org/drm/intel/issues/4290


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6262 -> IGTPW_6355

  CI-20190529: 20190529
  CI_DRM_10796: c2698ab428a9398c02ef1ee3a03f51608cf97a86 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6355: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6355/index.html
  IGT_6262: d1c793b26e31cc6ae3f9fa3239805a9bbcc749fb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git



== Testlist changes ==

+igt@kms_psr2_su@frontbuffer-xrgb8888
+igt@kms_psr2_su@page_flip-nv12
+igt@kms_psr2_su@page_flip-p010
+igt@kms_psr2_su@page_flip-xrgb8888
-igt@kms_psr2_su@frontbuffer
-igt@kms_psr2_su@page_flip

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6355/index.html

--===============0191597909150300312==
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
<tr><td><b>Series:</b></td><td>tests/kms_psr2_su: add biplanar selective update tests (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/96110/">https://patchwork.freedesktop.org/series/96110/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6355/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6355/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10796 -&gt; IGTPW_6355</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6355/index.html</p>
<h2>Participating hosts (39 -&gt; 35)</h2>
<p>Missing    (4): fi-bsw-cyan bat-adlp-4 bat-dg1-6 bat-dg1-5 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6355 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s0:</p>
<ul>
<li>fi-kbl-soraka:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10796/fi-kbl-soraka/igt@gem_exec_suspend@basic-s0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6355/fi-kbl-soraka/igt@gem_exec_suspend@basic-s0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4221">i915#4221</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>fi-cml-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10796/fi-cml-u2/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6355/fi-cml-u2/igt@kms_frontbuffer_tracking@basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4269">i915#4269</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_frontbuffer_tracking@basic:<ul>
<li>{fi-hsw-gt1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10796/fi-hsw-gt1/igt@kms_frontbuffer_tracking@basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4290">i915#4290</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6355/fi-hsw-gt1/igt@kms_frontbuffer_tracking@basic.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6262 -&gt; IGTPW_6355</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_10796: c2698ab428a9398c02ef1ee3a03f51608cf97a86 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_6355: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6355/index.html<br />
  IGT_6262: d1c793b26e31cc6ae3f9fa3239805a9bbcc749fb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<p>== Testlist changes ==</p>
<p>+igt@kms_psr2_su@frontbuffer-xrgb8888<br />
+igt@kms_psr2_su@page_flip-nv12<br />
+igt@kms_psr2_su@page_flip-p010<br />
+igt@kms_psr2_su@page_flip-xrgb8888<br />
-igt@kms_psr2_su@frontbuffer<br />
-igt@kms_psr2_su@page_flip</p>

</body>
</html>

--===============0191597909150300312==--
