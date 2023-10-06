Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============4046050187515773074=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Date: Fri, 06 Oct 2023 10:45:20 -0000
Message-ID: <169658912087.6467.14238297254422261422@emeril.freedesktop.org>
References: <20231006075819.3055887-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20231006075819.3055887-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIENJLnhlQkFUOiBmYWlsdXJlIGZvciBLTVM6IE1p?=
 =?utf-8?q?nor_cleanups?=
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

--===============4046050187515773074==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: KMS: Minor cleanups
URL   : https://patchwork.freedesktop.org/series/124702/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7518_BAT -> XEIGTPW_9938_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_9938_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_9938_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_9938_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_cursor_legacy@basic-flip-before-cursor-atomic:
    - bat-adlp-7:         [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7518/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9938/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_9938_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:
    - bat-dg2-oem2:       [FAIL][3] ([Intel XE#773]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7518/bat-dg2-oem2/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9938/bat-dg2-oem2/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html

  
  [Intel XE#773]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/773


Build changes
-------------

  * IGT: IGT_7518 -> IGTPW_9938

  IGTPW_9938: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/index.html
  IGT_7518: 2d4a57e28db0c2ccbf8b2e763074c9aa74a1ae52 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-417-b3daf7f07d6accbe43feafcadeb0b0498063761e: b3daf7f07d6accbe43feafcadeb0b0498063761e

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9938/index.html

--===============4046050187515773074==
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
<tr><td><b>Series:</b></td><td>KMS: Minor cleanups</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/124702/">https://patchwork.freedesktop.org/series/124702/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9938/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9938/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7518_BAT -&gt; XEIGTPW_9938_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_9938_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_9938_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_9938_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_cursor_legacy@basic-flip-before-cursor-atomic:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7518/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9938/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_9938_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7518/bat-dg2-oem2/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/773">Intel XE#773</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9938/bat-dg2-oem2/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7518 -&gt; IGTPW_9938</li>
</ul>
<p>IGTPW_9938: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9938/index.html<br />
  IGT_7518: 2d4a57e28db0c2ccbf8b2e763074c9aa74a1ae52 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-417-b3daf7f07d6accbe43feafcadeb0b0498063761e: b3daf7f07d6accbe43feafcadeb0b0498063761e</p>

</body>
</html>

--===============4046050187515773074==--
