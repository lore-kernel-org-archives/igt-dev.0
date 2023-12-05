Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============1112280519418769025=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vivaik Balasubrawmanian" <vivaik.balasubrawmanian@intel.com>
Date: Tue, 05 Dec 2023 05:06:42 -0000
Message-ID: <170175280272.24283.1079665267908070596@emeril.freedesktop.org>
References: <20231205025537.1528864-1-vivaik.balasubrawmanian@intel.com>
In-Reply-To: <20231205025537.1528864-1-vivaik.balasubrawmanian@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_fixed_ma?=
 =?utf-8?q?lformed_pipectrl_command_in_PXP_IGT_tests?=
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

--===============1112280519418769025==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: fixed malformed pipectrl command in PXP IGT tests
URL   : https://patchwork.freedesktop.org/series/127336/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7618_BAT -> XEIGTPW_10334_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_10334_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:
    - bat-adlp-7:         [PASS][1] -> [FAIL][2] ([i915#2346])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7618/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10334/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [PASS][3] -> [DMESG-FAIL][4] ([Intel XE#282] / [i915#2017])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7618/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10334/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
  [Intel XE#524]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/524
  [i915#2017]: https://gitlab.freedesktop.org/drm/intel/issues/2017
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346


Build changes
-------------

  * IGT: IGT_7618 -> IGTPW_10334

  IGTPW_10334: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10334/index.html
  IGT_7618: 222d1bdf8c598bb12164deab127af5d8d7ddc070 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-547-3cf2df8b17f8be54008581a37361e6ec36dc3d87: 3cf2df8b17f8be54008581a37361e6ec36dc3d87

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10334/index.html

--===============1112280519418769025==
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
<tr><td><b>Series:</b></td><td>fixed malformed pipectrl command in PXP IGT tests</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/127336/">https://patchwork.freedesktop.org/series/127336/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10334/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10334/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7618_BAT -&gt; XEIGTPW_10334_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_10334_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7618/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10334/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7618/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10334/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2017">i915#2017</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7618 -&gt; IGTPW_10334</li>
</ul>
<p>IGTPW_10334: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10334/index.html<br />
  IGT_7618: 222d1bdf8c598bb12164deab127af5d8d7ddc070 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-547-3cf2df8b17f8be54008581a37361e6ec36dc3d87: 3cf2df8b17f8be54008581a37361e6ec36dc3d87</p>

</body>
</html>

--===============1112280519418769025==--
