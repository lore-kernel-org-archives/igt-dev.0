Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============8154717558654704397=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vikas Srivastava" <vikas.srivastava@intel.com>
Date: Fri, 21 Oct 2022 12:16:21 -0000
Message-ID: <166635458157.18265.2610887648065517987@emeril.freedesktop.org>
References: <20221021111919.3106764-1-vikas.srivastava@intel.com>
In-Reply-To: <20221021111919.3106764-1-vikas.srivastava@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Fctx=5Fengines=3A_Avoid_SET=5FCACHING_ioctl_during_fo?=
 =?utf-8?q?rk?=
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

--===============8154717558654704397==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/i915/gem_ctx_engines: Avoid SET_CACHING ioctl during fork
URL   : https://patchwork.freedesktop.org/series/109995/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_12273 -> IGTPW_7997
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7997/index.html

Participating hosts (43 -> 30)
------------------------------

  Additional (1): fi-tgl-dsi 
  Missing    (14): fi-bdw-samus bat-dg2-8 bat-adlm-1 fi-icl-u2 bat-dg2-9 bat-adlp-6 bat-adlp-4 fi-ctg-p8600 bat-adln-1 bat-rplp-1 bat-rpls-1 bat-rpls-2 bat-dg2-11 bat-jsl-1 

Known issues
------------

  Here are the changes found in IGTPW_7997 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@hangcheck:
    - fi-rkl-guc:         [PASS][1] -> [INCOMPLETE][2] ([i915#4983])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12273/fi-rkl-guc/igt@i915_selftest@live@hangcheck.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7997/fi-rkl-guc/igt@i915_selftest@live@hangcheck.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1759]: https://gitlab.freedesktop.org/drm/intel/issues/1759
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#5982]: https://gitlab.freedesktop.org/drm/intel/issues/5982


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7021 -> IGTPW_7997

  CI-20190529: 20190529
  CI_DRM_12273: d4f6ff09bc85377614f03acdbdb9ecf95e799616 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7997: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7997/index.html
  IGT_7021: b99f94fc3652f6838b8803032373a419372b17b1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

-igt@api_intel_bb@misplaced-blitter

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7997/index.html

--===============8154717558654704397==
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
<tr><td><b>Series:</b></td><td>tests/i915/gem_ctx_engines: Avoid SET_CACHING ioctl during fork</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/109995/">https://patchwork.freedesktop.org/series/109995/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7997/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7997/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12273 -&gt; IGTPW_7997</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7997/index.html</p>
<h2>Participating hosts (43 -&gt; 30)</h2>
<p>Additional (1): fi-tgl-dsi <br />
  Missing    (14): fi-bdw-samus bat-dg2-8 bat-adlm-1 fi-icl-u2 bat-dg2-9 bat-adlp-6 bat-adlp-4 fi-ctg-p8600 bat-adln-1 bat-rplp-1 bat-rpls-1 bat-rpls-2 bat-dg2-11 bat-jsl-1 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7997 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@i915_selftest@live@hangcheck:<ul>
<li>fi-rkl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12273/fi-rkl-guc/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7997/fi-rkl-guc/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4983">i915#4983</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7021 -&gt; IGTPW_7997</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12273: d4f6ff09bc85377614f03acdbdb9ecf95e799616 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_7997: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7997/index.html<br />
  IGT_7021: b99f94fc3652f6838b8803032373a419372b17b1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>-igt@api_intel_bb@misplaced-blitter</p>

</body>
</html>

--===============8154717558654704397==--
