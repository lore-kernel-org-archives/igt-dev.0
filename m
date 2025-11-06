Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34373CCFA05
	for <igt-dev@archiver.kernel.org>; Thu,  6 Nov 2025 21:42:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC8A210E9DF;
	Thu,  6 Nov 2025 21:42:29 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B123110E9DF;
 Thu,  6 Nov 2025 21:42:28 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0289983246353529094=="
MIME-Version: 1.0
Subject: =?utf-8?b?4pyTIFhlLkNJLkJBVDogc3VjY2VzcyBmb3Igc2VyaWVzIHN0YXJ0aW5nIHdpdGgg?=
 =?utf-8?b?W2ktZy10LHY0LDEvMl0gbGliL2lvY3Rfd3JhcHBlcnM6IGFkZCBfX3ByaW1lX2Zk?=
 =?utf-8?b?X3RvX2hhbmRsZSgp?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 06 Nov 2025 21:42:28 -0000
Message-ID: <176246534871.27760.8658903549625806266@10055242dc62>
X-Patchwork-Hint: ignore
References: <20251106121831.150128-3-matthew.auld@intel.com>
In-Reply-To: <20251106121831.150128-3-matthew.auld@intel.com>
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

--===============0289983246353529094==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,v4,1/2] lib/ioct_wrappers: add __prime_fd_to_handle()
URL   : https://patchwork.freedesktop.org/series/157151/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8613_BAT -> XEIGTPW_14014_BAT
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with XEIGTPW_14014_BAT need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_14014_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_14014_BAT:

### IGT changes ###

#### Warnings ####

  * igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:
    - bat-bmg-3:          [FAIL][1] ([Intel XE#6433]) -> [SKIP][2] +1 other test skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/bat-bmg-3/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/bat-bmg-3/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@xe_peer2peer@read@read-gpua-vram01-gpub-vram01-p2p}:
    - bat-bmg-3:          [FAIL][3] ([Intel XE#6433]) -> [SKIP][4] +1 other test skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/bat-bmg-3/igt@xe_peer2peer@read@read-gpua-vram01-gpub-vram01-p2p.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/bat-bmg-3/igt@xe_peer2peer@read@read-gpua-vram01-gpub-vram01-p2p.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_14014_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_waitfence@abstime:
    - bat-dg2-oem2:       [PASS][5] -> [TIMEOUT][6] ([Intel XE#6506])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/bat-dg2-oem2/igt@xe_waitfence@abstime.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/bat-dg2-oem2/igt@xe_waitfence@abstime.html

  * igt@xe_waitfence@engine:
    - bat-dg2-oem2:       [PASS][7] -> [FAIL][8] ([Intel XE#6519])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/bat-dg2-oem2/igt@xe_waitfence@engine.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/bat-dg2-oem2/igt@xe_waitfence@engine.html

  * igt@xe_waitfence@reltime:
    - bat-dg2-oem2:       [PASS][9] -> [FAIL][10] ([Intel XE#6520])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/bat-dg2-oem2/igt@xe_waitfence@reltime.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/bat-dg2-oem2/igt@xe_waitfence@reltime.html

  
#### Possible fixes ####

  * igt@xe_peer2peer@read:
    - bat-bmg-3:          [FAIL][11] ([Intel XE#6433]) -> [PASS][12] +1 other test pass
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/bat-bmg-3/igt@xe_peer2peer@read.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/bat-bmg-3/igt@xe_peer2peer@read.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#6433]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6433
  [Intel XE#6506]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506
  [Intel XE#6519]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519
  [Intel XE#6520]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520


Build changes
-------------

  * IGT: IGT_8613 -> IGTPW_14014
  * Linux: xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad -> xe-4060-9deffe4baace482f9414f36f53f3385868533fd6

  IGTPW_14014: 14014
  IGT_8613: b542242f5b116e3b554b4068ef5dfa4451075b2b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad: 6aa8d62a50c33f091548cc961a713223d488d6ad
  xe-4060-9deffe4baace482f9414f36f53f3385868533fd6: 9deffe4baace482f9414f36f53f3385868533fd6

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/index.html

--===============0289983246353529094==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,v4,1/2] lib/ioct_wrappers: add __prime_fd_to_handle()</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/157151/">https://patchwork.freedesktop.org/series/157151/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8613_BAT -&gt; XEIGTPW_14014_BAT</h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with XEIGTPW_14014_BAT need to be verified<br />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_14014_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_14014_BAT:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:<ul>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/bat-bmg-3/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6433">Intel XE#6433</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/bat-bmg-3/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>{igt@xe_peer2peer@read@read-gpua-vram01-gpub-vram01-p2p}:<ul>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/bat-bmg-3/igt@xe_peer2peer@read@read-gpua-vram01-gpub-vram01-p2p.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6433">Intel XE#6433</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/bat-bmg-3/igt@xe_peer2peer@read@read-gpua-vram01-gpub-vram01-p2p.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14014_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_waitfence@abstime:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/bat-dg2-oem2/igt@xe_waitfence@abstime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/bat-dg2-oem2/igt@xe_waitfence@abstime.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506">Intel XE#6506</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@engine:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/bat-dg2-oem2/igt@xe_waitfence@engine.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/bat-dg2-oem2/igt@xe_waitfence@engine.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519">Intel XE#6519</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@reltime:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/bat-dg2-oem2/igt@xe_waitfence@reltime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/bat-dg2-oem2/igt@xe_waitfence@reltime.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520">Intel XE#6520</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_peer2peer@read:<ul>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8613/bat-bmg-3/igt@xe_peer2peer@read.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6433">Intel XE#6433</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14014/bat-bmg-3/igt@xe_peer2peer@read.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8613 -&gt; IGTPW_14014</li>
<li>Linux: xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad -&gt; xe-4060-9deffe4baace482f9414f36f53f3385868533fd6</li>
</ul>
<p>IGTPW_14014: 14014<br />
  IGT_8613: b542242f5b116e3b554b4068ef5dfa4451075b2b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad: 6aa8d62a50c33f091548cc961a713223d488d6ad<br />
  xe-4060-9deffe4baace482f9414f36f53f3385868533fd6: 9deffe4baace482f9414f36f53f3385868533fd6</p>

</body>
</html>

--===============0289983246353529094==--
