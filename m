Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============7376656847040663764=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Marcin Bernatowicz" <marcin.bernatowicz@intel.com>
Date: Thu, 30 Nov 2023 17:01:57 -0000
Message-ID: <170136371759.15641.3547425182524207205@emeril.freedesktop.org>
References: <20231130134416.21220-1-marcin.bernatowicz@intel.com>
In-Reply-To: <20231130134416.21220-1-marcin.bernatowicz@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_add_crea?=
 =?utf-8?q?te-big-vram_subtest_=28rev2=29?=
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

--===============7376656847040663764==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: add create-big-vram subtest (rev2)
URL   : https://patchwork.freedesktop.org/series/126831/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7612_BAT -> XEIGTPW_10305_BAT
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

  Here are the changes found in XEIGTPW_10305_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:
    - bat-adlp-7:         [FAIL][1] ([i915#2346]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7612/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10305/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1:
    - bat-adlp-7:         [FAIL][3] ([Intel XE#480]) -> [PASS][4] +2 other tests pass
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7612/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10305/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#524]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/524
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346


Build changes
-------------

  * IGT: IGT_7612 -> IGTPW_10305
  * Linux: xe-538-afdc645350a4b30d1ba6c52deed4ecc11bf7c083 -> xe-539-00436a1a34afc0f8116f720f0666e9c62c82505c

  IGTPW_10305: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10305/index.html
  IGT_7612: b5c47966901ee1060bcb9d4bccdd3ccec9651ef4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-538-afdc645350a4b30d1ba6c52deed4ecc11bf7c083: afdc645350a4b30d1ba6c52deed4ecc11bf7c083
  xe-539-00436a1a34afc0f8116f720f0666e9c62c82505c: 00436a1a34afc0f8116f720f0666e9c62c82505c

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10305/index.html

--===============7376656847040663764==
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
<tr><td><b>Series:</b></td><td>add create-big-vram subtest (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/126831/">https://patchwork.freedesktop.org/series/126831/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10305/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10305/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7612_BAT -&gt; XEIGTPW_10305_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_10305_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7612/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10305/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7612/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10305/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7612 -&gt; IGTPW_10305</li>
<li>Linux: xe-538-afdc645350a4b30d1ba6c52deed4ecc11bf7c083 -&gt; xe-539-00436a1a34afc0f8116f720f0666e9c62c82505c</li>
</ul>
<p>IGTPW_10305: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10305/index.html<br />
  IGT_7612: b5c47966901ee1060bcb9d4bccdd3ccec9651ef4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-538-afdc645350a4b30d1ba6c52deed4ecc11bf7c083: afdc645350a4b30d1ba6c52deed4ecc11bf7c083<br />
  xe-539-00436a1a34afc0f8116f720f0666e9c62c82505c: 00436a1a34afc0f8116f720f0666e9c62c82505c</p>

</body>
</html>

--===============7376656847040663764==--
