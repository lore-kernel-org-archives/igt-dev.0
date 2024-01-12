Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============8550873103183040318=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBAT=3A_failure_for_add_support_for_choosing_bi?=
 =?utf-8?q?g_joiner_mode?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kunal Joshi" <kunal1.joshi@intel.com>
Date: Fri, 12 Jan 2024 09:32:31 -0000
Message-ID: <170505195139.332228.11412822670540433181@5338d5abeb45>
References: <20240112085547.673712-1-kunal1.joshi@intel.com>
In-Reply-To: <20240112085547.673712-1-kunal1.joshi@intel.com>
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

--===============8550873103183040318==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: add support for choosing big joiner mode
URL   : https://patchwork.freedesktop.org/series/128706/
State : failure

== Summary ==

CI Bug Log - changes from IGT_7671 -> IGTPW_10522
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_10522 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_10522, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10522/index.html

Participating hosts (39 -> 14)
------------------------------

  ERROR: It appears as if the changes made in IGTPW_10522 prevented too many machines from booting.

  Missing    (25): fi-rkl-11600 fi-snb-2520m bat-rpls-3 fi-pnv-d510 fi-blb-e6850 fi-skl-6600u fi-bsw-n3050 bat-adlm-1 fi-ilk-650 fi-ivb-3770 fi-elk-e7500 fi-bsw-nick fi-kbl-7567u bat-dg1-7 bat-kbl-2 bat-adlp-9 fi-cfl-8700k bat-mtlp-8 bat-jsl-1 fi-tgl-1115g4 fi-cfl-guc fi-kbl-guc fi-cfl-8109u bat-dg2-14 bat-dg2-13 

Known issues
------------

  Here are the changes found in IGTPW_10522 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@reset:
    - fi-apl-guc:         [PASS][1] -> [DMESG-WARN][2] ([i915#9730]) +31 other tests dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7671/fi-apl-guc/igt@i915_selftest@live@reset.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10522/fi-apl-guc/igt@i915_selftest@live@reset.html

  * igt@i915_suspend@basic-s2idle-without-i915:
    - fi-apl-guc:         [PASS][3] -> [DMESG-WARN][4] ([i915#180] / [i915#1982])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7671/fi-apl-guc/igt@i915_suspend@basic-s2idle-without-i915.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10522/fi-apl-guc/igt@i915_suspend@basic-s2idle-without-i915.html

  
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#9730]: https://gitlab.freedesktop.org/drm/intel/issues/9730


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7671 -> IGTPW_10522

  CI-20190529: 20190529
  CI_DRM_14116: 3b92a66f4bc89f4fa6e9e9369ac8243e23670030 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10522: 10522
  IGT_7671: 7671

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10522/index.html

--===============8550873103183040318==
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
<tr><td><b>Series:</b></td><td>add support for choosing big joiner mode</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/128706/">https://patchwork.freedesktop.org/series/128706/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10522/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10522/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7671 -&gt; IGTPW_10522</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_10522 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_10522, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10522/index.html</p>
<h2>Participating hosts (39 -&gt; 14)</h2>
<p>ERROR: It appears as if the changes made in IGTPW_10522 prevented too many machines from booting.</p>
<p>Missing    (25): fi-rkl-11600 fi-snb-2520m bat-rpls-3 fi-pnv-d510 fi-blb-e6850 fi-skl-6600u fi-bsw-n3050 bat-adlm-1 fi-ilk-650 fi-ivb-3770 fi-elk-e7500 fi-bsw-nick fi-kbl-7567u bat-dg1-7 bat-kbl-2 bat-adlp-9 fi-cfl-8700k bat-mtlp-8 bat-jsl-1 fi-tgl-1115g4 fi-cfl-guc fi-kbl-guc fi-cfl-8109u bat-dg2-14 bat-dg2-13 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10522 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live@reset:</p>
<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7671/fi-apl-guc/igt@i915_selftest@live@reset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10522/fi-apl-guc/igt@i915_selftest@live@reset.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9730">i915#9730</a>) +31 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s2idle-without-i915:</p>
<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7671/fi-apl-guc/igt@i915_suspend@basic-s2idle-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10522/fi-apl-guc/igt@i915_suspend@basic-s2idle-without-i915.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7671 -&gt; IGTPW_10522</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14116: 3b92a66f4bc89f4fa6e9e9369ac8243e23670030 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10522: 10522<br />
  IGT_7671: 7671</p>

</body>
</html>

--===============8550873103183040318==--
