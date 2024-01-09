Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============6192301407265573291=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_tests/intel/xe=5Fccs=3A_Fix_bl?=
 =?utf-8?q?ock-multicopy-inplace_subtest?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Akshata Jahagirdar" <akshata.jahagirdar@intel.com>
Date: Tue, 09 Jan 2024 22:32:20 -0000
Message-ID: <170483954085.240792.143901904481485998@5338d5abeb45>
References: <cover.1704874216.git.akshata.jahagirdar@intel.com>
In-Reply-To: <cover.1704874216.git.akshata.jahagirdar@intel.com>
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

--===============6192301407265573291==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_ccs: Fix block-multicopy-inplace subtest
URL   : https://patchwork.freedesktop.org/series/128391/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7664_BAT -> XEIGTPW_10497_BAT
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

  Here are the changes found in XEIGTPW_10497_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_create@create-execqueues-noleak:
    - bat-atsm-2:         [PASS][1] -> [FAIL][2] ([Intel XE#1099])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7664/bat-atsm-2/igt@xe_create@create-execqueues-noleak.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10497/bat-atsm-2/igt@xe_create@create-execqueues-noleak.html

  
#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@d-dp3:
    - bat-dg2-oem2:       [FAIL][3] ([Intel XE#480]) -> [PASS][4] +1 other test pass
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7664/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@d-dp3.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10497/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@d-dp3.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [DMESG-FAIL][5] ([Intel XE#1033]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7664/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10497/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1099]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1099
  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480


Build changes
-------------

  * IGT: IGT_7664 -> IGTPW_10497
  * Linux: xe-607-eacbcdb537a2774959d012206aba22848fdade26 -> xe-611-39df1f6b1259816cc42b5f2451ca5092fad340ce

  IGTPW_10497: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10497/index.html
  IGT_7664: 5b8a8dcca7711c73f9cfeb66b5deb27751290fb4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-607-eacbcdb537a2774959d012206aba22848fdade26: eacbcdb537a2774959d012206aba22848fdade26
  xe-611-39df1f6b1259816cc42b5f2451ca5092fad340ce: 39df1f6b1259816cc42b5f2451ca5092fad340ce

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10497/index.html

--===============6192301407265573291==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_ccs: Fix block-multicopy-inplace subtest</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/128391/">https://patchwork.freedesktop.org/series/128391/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10497/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10497/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7664_BAT -&gt; XEIGTPW_10497_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_10497_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_create@create-execqueues-noleak:<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7664/bat-atsm-2/igt@xe_create@create-execqueues-noleak.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10497/bat-atsm-2/igt@xe_create@create-execqueues-noleak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1099">Intel XE#1099</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@d-dp3:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7664/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@d-dp3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10497/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@d-dp3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7664/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10497/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7664 -&gt; IGTPW_10497</li>
<li>Linux: xe-607-eacbcdb537a2774959d012206aba22848fdade26 -&gt; xe-611-39df1f6b1259816cc42b5f2451ca5092fad340ce</li>
</ul>
<p>IGTPW_10497: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10497/index.html<br />
  IGT_7664: 5b8a8dcca7711c73f9cfeb66b5deb27751290fb4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-607-eacbcdb537a2774959d012206aba22848fdade26: eacbcdb537a2774959d012206aba22848fdade26<br />
  xe-611-39df1f6b1259816cc42b5f2451ca5092fad340ce: 39df1f6b1259816cc42b5f2451ca5092fad340ce</p>

</body>
</html>

--===============6192301407265573291==--
