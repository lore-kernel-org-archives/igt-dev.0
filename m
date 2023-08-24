Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============4141622873406616376=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Swati Sharma" <swati2.sharma@intel.com>
Date: Thu, 24 Aug 2023 15:03:37 -0000
Message-ID: <169288941724.13344.11036718706250580929@emeril.freedesktop.org>
References: <20230824140519.1171540-1-swati2.sharma@intel.com>
In-Reply-To: <20230824140519.1171540-1-swati2.sharma@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_series_s?=
 =?utf-8?q?tarting_with_=5Bi-g-t=2C1/2=5D_tests/xe/xe=5Fmodule=5Fload=3A_l?=
 =?utf-8?q?oad_snd=5Fhda=5Fintel_module?=
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

--===============4141622873406616376==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,1/2] tests/xe/xe_module_load: load snd_hda_intel module
URL   : https://patchwork.freedesktop.org/series/122843/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7451_BAT -> XEIGTPW_9648_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_9648_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_9648_BAT, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_9648_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_hdmi_inject@inject-audio:
    - bat-atsm-2:         NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9648/bat-atsm-2/igt@kms_hdmi_inject@inject-audio.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_9648_BAT that come from known issues:

### IGT changes ###

#### Warnings ####

  * igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:
    - bat-atsm-2:         [SKIP][2] ([Intel XE#274]) -> [SKIP][3] ([Intel XE#274] / [Intel XE#539]) +5 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7451/bat-atsm-2/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9648/bat-atsm-2/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24:
    - bat-atsm-2:         [SKIP][4] ([i915#1836]) -> [SKIP][5] ([Intel XE#537] / [i915#1836]) +6 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7451/bat-atsm-2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9648/bat-atsm-2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html

  
  [Intel XE#274]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/274
  [Intel XE#537]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/537
  [Intel XE#539]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/539
  [i915#1836]: https://gitlab.freedesktop.org/drm/intel/issues/1836


Build changes
-------------

  * IGT: IGT_7451 -> IGTPW_9648
  * Linux: xe-330-3a964d06598874329aab6f8db7fd52840135d568 -> xe-339-24894376b6f6c1cf08ed5a7eb2760a9b0b43c3ef

  IGTPW_9648: 9648
  IGT_7451: 5d48d1fb231f449fe2f80cda14ea7a1ecfda59fa @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-330-3a964d06598874329aab6f8db7fd52840135d568: 3a964d06598874329aab6f8db7fd52840135d568
  xe-339-24894376b6f6c1cf08ed5a7eb2760a9b0b43c3ef: 24894376b6f6c1cf08ed5a7eb2760a9b0b43c3ef



--===============4141622873406616376==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,1/2] tests/xe/xe_module_load: load snd_hda_intel module</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/122843/">https://patchwork.freedesktop.org/series/122843/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7451_BAT -&gt; XEIGTPW_9648_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_9648_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_9648_BAT, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_9648_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_hdmi_inject@inject-audio:<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9648/bat-atsm-2/igt@kms_hdmi_inject@inject-audio.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_9648_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7451/bat-atsm-2/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/274">Intel XE#274</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9648/bat-atsm-2/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/274">Intel XE#274</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/539">Intel XE#539</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7451/bat-atsm-2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1836">i915#1836</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9648/bat-atsm-2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/537">Intel XE#537</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1836">i915#1836</a>) +6 similar issues</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7451 -&gt; IGTPW_9648</li>
<li>Linux: xe-330-3a964d06598874329aab6f8db7fd52840135d568 -&gt; xe-339-24894376b6f6c1cf08ed5a7eb2760a9b0b43c3ef</li>
</ul>
<p>IGTPW_9648: 9648<br />
  IGT_7451: 5d48d1fb231f449fe2f80cda14ea7a1ecfda59fa @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-330-3a964d06598874329aab6f8db7fd52840135d568: 3a964d06598874329aab6f8db7fd52840135d568<br />
  xe-339-24894376b6f6c1cf08ed5a7eb2760a9b0b43c3ef: 24894376b6f6c1cf08ed5a7eb2760a9b0b43c3ef</p>

</body>
</html>

--===============4141622873406616376==--
