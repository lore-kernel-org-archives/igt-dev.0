Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============4317377619245356714=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Thu, 09 Nov 2023 19:38:55 -0000
Message-ID: <169955873530.26589.11773060583258592118@emeril.freedesktop.org>
References: <20231109171554.313952-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20231109171554.313952-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_tests/xe?=
 =?utf-8?q?=5Fevict=5Fccs=3A_Disable_compression_on_platforms_without_flat?=
 =?utf-8?q?ccs?=
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

--===============4317377619245356714==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/xe_evict_ccs: Disable compression on platforms without flatccs
URL   : https://patchwork.freedesktop.org/series/126210/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7580_BAT -> XEIGTPW_10154_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_10154_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_10154_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 0)
------------------------------

  ERROR: It appears as if the changes made in XEIGTPW_10154_BAT prevented too many machines from booting.

  Missing    (2): bat-pvc-2 bat-atsm-2 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_7580 -> IGTPW_10154
  * Linux: xe-481-7a0da606f1fcf4b59d7164419f1ccd1c48d366af -> xe-483-2096aea11094f62fea27af97d949423bea156686

  IGTPW_10154: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10154/index.html
  IGT_7580: 847ee1e7d365e2fb08bf4198d3bf5ee8a852649f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-481-7a0da606f1fcf4b59d7164419f1ccd1c48d366af: 7a0da606f1fcf4b59d7164419f1ccd1c48d366af
  xe-483-2096aea11094f62fea27af97d949423bea156686: 2096aea11094f62fea27af97d949423bea156686

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10154/index.html

--===============4317377619245356714==
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
<tr><td><b>Series:</b></td><td>tests/xe_evict_ccs: Disable compression on platforms without flatccs</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/126210/">https://patchwork.freedesktop.org/series/126210/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10154/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10154/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7580_BAT -&gt; XEIGTPW_10154_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_10154_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_10154_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 0)</h2>
<p>ERROR: It appears as if the changes made in XEIGTPW_10154_BAT prevented too many machines from booting.</p>
<p>Missing    (2): bat-pvc-2 bat-atsm-2 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7580 -&gt; IGTPW_10154</li>
<li>Linux: xe-481-7a0da606f1fcf4b59d7164419f1ccd1c48d366af -&gt; xe-483-2096aea11094f62fea27af97d949423bea156686</li>
</ul>
<p>IGTPW_10154: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10154/index.html<br />
  IGT_7580: 847ee1e7d365e2fb08bf4198d3bf5ee8a852649f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-481-7a0da606f1fcf4b59d7164419f1ccd1c48d366af: 7a0da606f1fcf4b59d7164419f1ccd1c48d366af<br />
  xe-483-2096aea11094f62fea27af97d949423bea156686: 2096aea11094f62fea27af97d949423bea156686</p>

</body>
</html>

--===============4317377619245356714==--
