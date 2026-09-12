Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3838C88E56
	for <igt-dev@archiver.kernel.org>; Sat, 12 Sep 2026 20:45:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6566E10E00B;
	Sat, 12 Sep 2026 20:45:11 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F309510E00B;
 Sat, 12 Sep 2026 20:44:29 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7020453965428859251=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_Add_CMRR_subtests_=28rev7?=
 =?utf-8?q?=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Naladala Ramanaidu" <ramanaidu.naladala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sat, 12 Sep 2026 20:44:29 -0000
Message-ID: <178924586998.155742.6133115858439846736@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260912200945.3263106-1-ramanaidu.naladala@intel.com>
In-Reply-To: <20260912200945.3263106-1-ramanaidu.naladala@intel.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
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

--===============7020453965428859251==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add CMRR subtests (rev7)
URL   : https://patchwork.freedesktop.org/series/171615/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_9093_BAT -> XEIGTPW_15838_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_15838_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_15838_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (15 -> 15)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_15838_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_vrr@cmrr-desktop-mode (NEW):
    - bat-wcl-1:          NOTRUN -> [SKIP][1] +1 other test skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15838/bat-wcl-1/igt@kms_vrr@cmrr-desktop-mode.html
    - bat-ptl-2:          NOTRUN -> [SKIP][2] +1 other test skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15838/bat-ptl-2/igt@kms_vrr@cmrr-desktop-mode.html

  * igt@kms_vrr@cmrr-video-mode (NEW):
    - bat-bmg-1:          NOTRUN -> [SKIP][3] +1 other test skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15838/bat-bmg-1/igt@kms_vrr@cmrr-video-mode.html
    - bat-wcl-2:          NOTRUN -> [SKIP][4] +1 other test skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15838/bat-wcl-2/igt@kms_vrr@cmrr-video-mode.html

  * igt@kms_vrr@cmrr-video-mode@pipe-a-edp-1 (NEW):
    - bat-lnl-1:          NOTRUN -> [SKIP][5] +3 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15838/bat-lnl-1/igt@kms_vrr@cmrr-video-mode@pipe-a-edp-1.html

  
New tests
---------

  New tests have been introduced between XEIGT_9093_BAT and XEIGTPW_15838_BAT:

### New IGT tests (4) ###

  * igt@kms_vrr@cmrr-desktop-mode:
    - Statuses : 12 skip(s)
    - Exec time: [0.0, 0.68] s

  * igt@kms_vrr@cmrr-desktop-mode@pipe-a-edp-1:
    - Statuses : 3 skip(s)
    - Exec time: [0.02, 0.30] s

  * igt@kms_vrr@cmrr-video-mode:
    - Statuses : 2 pass(s) 10 skip(s)
    - Exec time: [0.0, 12.33] s

  * igt@kms_vrr@cmrr-video-mode@pipe-a-edp-1:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.01, 11.94] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_15838_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-bmg-2:          [PASS][6] -> [ABORT][7] ([Intel XE#8007])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9093/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15838/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html

  * igt@kms_vrr@cmrr-desktop-mode (NEW):
    - bat-bmg-2:          NOTRUN -> [SKIP][8] ([Intel XE#3419]) +1 other test skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15838/bat-bmg-2/igt@kms_vrr@cmrr-desktop-mode.html
    - bat-nvls-1:         NOTRUN -> [SKIP][9] ([Intel XE#9076]) +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15838/bat-nvls-1/igt@kms_vrr@cmrr-desktop-mode.html
    - bat-ptl-1:          NOTRUN -> [SKIP][10] ([Intel XE#5766]) +1 other test skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15838/bat-ptl-1/igt@kms_vrr@cmrr-desktop-mode.html
    - bat-adlp-7:         NOTRUN -> [SKIP][11] ([Intel XE#455]) +1 other test skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15838/bat-adlp-7/igt@kms_vrr@cmrr-desktop-mode.html

  * igt@kms_vrr@cmrr-video-mode (NEW):
    - bat-lnl-2:          NOTRUN -> [SKIP][12] ([Intel XE#2235]) +1 other test skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15838/bat-lnl-2/igt@kms_vrr@cmrr-video-mode.html
    - bat-nvls-2:         NOTRUN -> [SKIP][13] ([Intel XE#8755]) +1 other test skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15838/bat-nvls-2/igt@kms_vrr@cmrr-video-mode.html
    - bat-atsm-2:         NOTRUN -> [SKIP][14] ([Intel XE#1024] / [Intel XE#947]) +1 other test skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15838/bat-atsm-2/igt@kms_vrr@cmrr-video-mode.html

  * igt@xe_waitfence@reltime:
    - bat-wcl-2:          [PASS][15] -> [FAIL][16] ([Intel XE#9115])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9093/bat-wcl-2/igt@xe_waitfence@reltime.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15838/bat-wcl-2/igt@xe_waitfence@reltime.html
    - bat-wcl-1:          [PASS][17] -> [FAIL][18] ([Intel XE#9115])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9093/bat-wcl-1/igt@xe_waitfence@reltime.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15838/bat-wcl-1/igt@xe_waitfence@reltime.html

  
  [Intel XE#1024]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024
  [Intel XE#2235]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235
  [Intel XE#3419]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3419
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#5766]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5766
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8755]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8755
  [Intel XE#9076]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9076
  [Intel XE#9115]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9115
  [Intel XE#947]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/947


Build changes
-------------

  * IGT: IGT_9093 -> IGTPW_15838
  * Linux: xe-5736-d9e9da243a3d5fa370e267ee800471a5d1946778 -> xe-5738-d0f49187686a810b5b83216805c07814ad7542dc

  IGTPW_15838: 15838
  IGT_9093: 932327f15c92ecb52266ced8c0fbe72931a75880 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5736-d9e9da243a3d5fa370e267ee800471a5d1946778: d9e9da243a3d5fa370e267ee800471a5d1946778
  xe-5738-d0f49187686a810b5b83216805c07814ad7542dc: d0f49187686a810b5b83216805c07814ad7542dc

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15838/index.html

--===============7020453965428859251==
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
<tr><td><b>Series:</b></td><td>Add CMRR subtests (rev7)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/171615/">https://patchwork.freedesktop.org/series/171615/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15838/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15838/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9093_BAT -&gt; XEIGTPW_15838_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_15838_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_15838_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_15838_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_vrr@cmrr-desktop-mode (NEW):</p>
<ul>
<li>bat-wcl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15838/bat-wcl-1/igt@kms_vrr@cmrr-desktop-mode.html">SKIP</a> +1 other test skip</li>
<li>bat-ptl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15838/bat-ptl-2/igt@kms_vrr@cmrr-desktop-mode.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr-video-mode (NEW):</p>
<ul>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15838/bat-bmg-1/igt@kms_vrr@cmrr-video-mode.html">SKIP</a> +1 other test skip</li>
<li>bat-wcl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15838/bat-wcl-2/igt@kms_vrr@cmrr-video-mode.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr-video-mode@pipe-a-edp-1 (NEW):</p>
<ul>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15838/bat-lnl-1/igt@kms_vrr@cmrr-video-mode@pipe-a-edp-1.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_9093_BAT and XEIGTPW_15838_BAT:</p>
<h3>New IGT tests (4)</h3>
<ul>
<li>
<p>igt@kms_vrr@cmrr-desktop-mode:</p>
<ul>
<li>Statuses : 12 skip(s)</li>
<li>Exec time: [0.0, 0.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr-desktop-mode@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.02, 0.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr-video-mode:</p>
<ul>
<li>Statuses : 2 pass(s) 10 skip(s)</li>
<li>Exec time: [0.0, 12.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr-video-mode@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.01, 11.94] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_15838_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9093/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15838/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr-desktop-mode (NEW):</p>
<ul>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15838/bat-bmg-2/igt@kms_vrr@cmrr-desktop-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3419">Intel XE#3419</a>) +1 other test skip</li>
<li>bat-nvls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15838/bat-nvls-1/igt@kms_vrr@cmrr-desktop-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9076">Intel XE#9076</a>) +1 other test skip</li>
<li>bat-ptl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15838/bat-ptl-1/igt@kms_vrr@cmrr-desktop-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5766">Intel XE#5766</a>) +1 other test skip</li>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15838/bat-adlp-7/igt@kms_vrr@cmrr-desktop-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr-video-mode (NEW):</p>
<ul>
<li>bat-lnl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15838/bat-lnl-2/igt@kms_vrr@cmrr-video-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235">Intel XE#2235</a>) +1 other test skip</li>
<li>bat-nvls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15838/bat-nvls-2/igt@kms_vrr@cmrr-video-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8755">Intel XE#8755</a>) +1 other test skip</li>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15838/bat-atsm-2/igt@kms_vrr@cmrr-video-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/947">Intel XE#947</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@reltime:</p>
<ul>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9093/bat-wcl-2/igt@xe_waitfence@reltime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15838/bat-wcl-2/igt@xe_waitfence@reltime.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9115">Intel XE#9115</a>)</li>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9093/bat-wcl-1/igt@xe_waitfence@reltime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15838/bat-wcl-1/igt@xe_waitfence@reltime.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9115">Intel XE#9115</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9093 -&gt; IGTPW_15838</li>
<li>Linux: xe-5736-d9e9da243a3d5fa370e267ee800471a5d1946778 -&gt; xe-5738-d0f49187686a810b5b83216805c07814ad7542dc</li>
</ul>
<p>IGTPW_15838: 15838<br />
  IGT_9093: 932327f15c92ecb52266ced8c0fbe72931a75880 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5736-d9e9da243a3d5fa370e267ee800471a5d1946778: d9e9da243a3d5fa370e267ee800471a5d1946778<br />
  xe-5738-d0f49187686a810b5b83216805c07814ad7542dc: d0f49187686a810b5b83216805c07814ad7542dc</p>

</body>
</html>

--===============7020453965428859251==--
