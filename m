Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 02 Mar 2021 19:03:37 -0000
Message-ID: <161471181707.3592.9502237522766365783@emeril.freedesktop.org>
References: <20210302183003.16374-1-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20210302183003.16374-1-umesh.nerlige.ramappa@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgaTkxNS9w?=
 =?utf-8?q?erf=3A_Add_test_to_query_CS_timestamp?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1118113287=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1118113287==
Content-Type: multipart/alternative;
 boundary="===============8536052671802590832=="

--===============8536052671802590832==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: i915/perf: Add test to query CS timestamp
URL   : https://patchwork.freedesktop.org/series/87553/
State : failure

== Summary ==

CI Bug Log - changes from IGT_6019 -> IGTPW_5564
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5564 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5564, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5564/index.html

Known issues
------------

  Here are the changes found in IGTPW_5564 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_linear_blits@basic:
    - fi-kbl-8809g:       [PASS][1] -> [TIMEOUT][2] ([i915#2502])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6019/fi-kbl-8809g/igt@gem_linear_blits@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5564/fi-kbl-8809g/igt@gem_linear_blits@basic.html

  
#### Possible fixes ####

  * igt@gem_exec_gttfill@basic:
    - fi-kbl-8809g:       [TIMEOUT][3] ([i915#3145]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6019/fi-kbl-8809g/igt@gem_exec_gttfill@basic.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5564/fi-kbl-8809g/igt@gem_exec_gttfill@basic.html

  
  [i915#2502]: https://gitlab.freedesktop.org/drm/intel/issues/2502
  [i915#3145]: https://gitlab.freedesktop.org/drm/intel/issues/3145


Participating hosts (45 -> 14)
------------------------------

  ERROR: It appears as if the changes made in IGTPW_5564 prevented too many machines from booting.

  Missing    (31): fi-kbl-soraka fi-icl-y fi-skl-6600u fi-cml-u2 fi-cml-s fi-bsw-n3050 fi-byt-j1900 fi-tgl-u2 fi-glk-dsi fi-ctg-p8600 fi-hsw-4770 fi-elk-e7500 fi-tgl-y fi-bsw-nick fi-ilk-m540 fi-ehl-1 fi-tgl-dsi fi-skl-guc fi-cfl-8700k fi-dg1-1 fi-ehl-2 fi-hsw-gt1 fi-jsl-1 fi-rkl-11500t fi-bsw-cyan fi-cfl-guc fi-kbl-guc fi-kbl-x1275 fi-cfl-8109u fi-bsw-kefka fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6019 -> IGTPW_5564

  CI-20190529: 20190529
  CI_DRM_9821: 2eaa470f08c2bc15cc2c17da08c232ac46721e54 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5564: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5564/index.html
  IGT_6019: 970aae7166c50851b62ed94f02964f402fa4b701 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@i915_query@cs-cycles
+igt@i915_query@cs-cycles-invalid

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5564/index.html

--===============8536052671802590832==
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
<tr><td><b>Series:</b></td><td>i915/perf: Add test to query CS timestamp</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/87553/">https://patchwork.freedesktop.org/series/87553/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5564/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5564/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_6019 -&gt; IGTPW_5564</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5564 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5564, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5564/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5564 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@gem_linear_blits@basic:<ul>
<li>fi-kbl-8809g:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6019/fi-kbl-8809g/igt@gem_linear_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5564/fi-kbl-8809g/igt@gem_linear_blits@basic.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2502">i915#2502</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@gem_exec_gttfill@basic:<ul>
<li>fi-kbl-8809g:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6019/fi-kbl-8809g/igt@gem_exec_gttfill@basic.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3145">i915#3145</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5564/fi-kbl-8809g/igt@gem_exec_gttfill@basic.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Participating hosts (45 -&gt; 14)</h2>
<p>ERROR: It appears as if the changes made in IGTPW_5564 prevented too many machines from booting.</p>
<p>Missing    (31): fi-kbl-soraka fi-icl-y fi-skl-6600u fi-cml-u2 fi-cml-s fi-bsw-n3050 fi-byt-j1900 fi-tgl-u2 fi-glk-dsi fi-ctg-p8600 fi-hsw-4770 fi-elk-e7500 fi-tgl-y fi-bsw-nick fi-ilk-m540 fi-ehl-1 fi-tgl-dsi fi-skl-guc fi-cfl-8700k fi-dg1-1 fi-ehl-2 fi-hsw-gt1 fi-jsl-1 fi-rkl-11500t fi-bsw-cyan fi-cfl-guc fi-kbl-guc fi-kbl-x1275 fi-cfl-8109u fi-bsw-kefka fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6019 -&gt; IGTPW_5564</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9821: 2eaa470f08c2bc15cc2c17da08c232ac46721e54 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5564: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5564/index.html<br />
  IGT_6019: 970aae7166c50851b62ed94f02964f402fa4b701 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>
<p>== Testlist changes ==</p>
<p>+igt@i915_query@cs-cycles<br />
+igt@i915_query@cs-cycles-invalid</p>

</body>
</html>

--===============8536052671802590832==--

--===============1118113287==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1118113287==--
