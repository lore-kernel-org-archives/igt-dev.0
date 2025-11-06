Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24EBACCFA18
	for <igt-dev@archiver.kernel.org>; Thu,  6 Nov 2025 00:28:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A20A110E0F9;
	Thu,  6 Nov 2025 00:28:51 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C6E510E0F9;
 Thu,  6 Nov 2025 00:28:50 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3435253081524070752=="
MIME-Version: 1.0
Subject: =?utf-8?b?4pyTIFhlLkNJLkJBVDogc3VjY2VzcyBmb3Igc2VyaWVzIHN0YXJ0aW5nIHdpdGgg?=
 =?utf-8?b?W2ktZy10LHYzLDEvMl0gbGliL2lvY3Rfd3JhcHBlcnM6IGFkZCBfX3ByaW1lX2Zk?=
 =?utf-8?b?X3RvX2hhbmRsZSgp?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 06 Nov 2025 00:28:50 -0000
Message-ID: <176238893055.20673.12143733112212321559@10055242dc62>
X-Patchwork-Hint: ignore
References: <20251105115132.97222-3-matthew.auld@intel.com>
In-Reply-To: <20251105115132.97222-3-matthew.auld@intel.com>
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

--===============3435253081524070752==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,v3,1/2] lib/ioct_wrappers: add __prime_fd_to_handle()
URL   : https://patchwork.freedesktop.org/series/157061/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8608_BAT -> XEIGTPW_13999_BAT
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with XEIGTPW_13999_BAT need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_13999_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (12 -> 12)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_13999_BAT:

### IGT changes ###

#### Warnings ####

  * igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:
    - bat-bmg-3:          [FAIL][1] ([Intel XE#6433]) -> [SKIP][2] +1 other test skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8608/bat-bmg-3/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13999/bat-bmg-3/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@xe_peer2peer@read@read-gpua-vram01-gpub-vram01-p2p}:
    - bat-bmg-3:          [FAIL][3] ([Intel XE#6433]) -> [SKIP][4] +1 other test skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8608/bat-bmg-3/igt@xe_peer2peer@read@read-gpua-vram01-gpub-vram01-p2p.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13999/bat-bmg-3/igt@xe_peer2peer@read@read-gpua-vram01-gpub-vram01-p2p.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_13999_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_peer2peer@read:
    - bat-bmg-3:          [FAIL][5] ([Intel XE#6433]) -> [PASS][6] +1 other test pass
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8608/bat-bmg-3/igt@xe_peer2peer@read.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13999/bat-bmg-3/igt@xe_peer2peer@read.html

  * igt@xe_waitfence@abstime:
    - bat-dg2-oem2:       [TIMEOUT][7] ([Intel XE#6506]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8608/bat-dg2-oem2/igt@xe_waitfence@abstime.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13999/bat-dg2-oem2/igt@xe_waitfence@abstime.html

  * igt@xe_waitfence@reltime:
    - bat-dg2-oem2:       [FAIL][9] -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8608/bat-dg2-oem2/igt@xe_waitfence@reltime.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13999/bat-dg2-oem2/igt@xe_waitfence@reltime.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#6433]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6433
  [Intel XE#6506]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506


Build changes
-------------

  * IGT: IGT_8608 -> IGTPW_13999
  * Linux: xe-4050-695cfd228beb5b8816553e7002a2d61d381327a8 -> xe-4052-4247aae08afc576bbe58c7998b5e2f6a2ea982ad

  IGTPW_13999: 13999
  IGT_8608: 42ea0108ec47e4a00aed97d6f98e5339847c7331 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4050-695cfd228beb5b8816553e7002a2d61d381327a8: 695cfd228beb5b8816553e7002a2d61d381327a8
  xe-4052-4247aae08afc576bbe58c7998b5e2f6a2ea982ad: 4247aae08afc576bbe58c7998b5e2f6a2ea982ad

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13999/index.html

--===============3435253081524070752==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,v3,1/2] lib/ioct_wrappers: add __prime_fd_to_handle()</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/157061/">https://patchwork.freedesktop.org/series/157061/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13999/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13999/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8608_BAT -&gt; XEIGTPW_13999_BAT</h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with XEIGTPW_13999_BAT need to be verified<br />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_13999_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_13999_BAT:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:<ul>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8608/bat-bmg-3/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6433">Intel XE#6433</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13999/bat-bmg-3/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>{igt@xe_peer2peer@read@read-gpua-vram01-gpub-vram01-p2p}:<ul>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8608/bat-bmg-3/igt@xe_peer2peer@read@read-gpua-vram01-gpub-vram01-p2p.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6433">Intel XE#6433</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13999/bat-bmg-3/igt@xe_peer2peer@read@read-gpua-vram01-gpub-vram01-p2p.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_13999_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8608/bat-bmg-3/igt@xe_peer2peer@read.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6433">Intel XE#6433</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13999/bat-bmg-3/igt@xe_peer2peer@read.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@abstime:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8608/bat-dg2-oem2/igt@xe_waitfence@abstime.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506">Intel XE#6506</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13999/bat-dg2-oem2/igt@xe_waitfence@abstime.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@reltime:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8608/bat-dg2-oem2/igt@xe_waitfence@reltime.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13999/bat-dg2-oem2/igt@xe_waitfence@reltime.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8608 -&gt; IGTPW_13999</li>
<li>Linux: xe-4050-695cfd228beb5b8816553e7002a2d61d381327a8 -&gt; xe-4052-4247aae08afc576bbe58c7998b5e2f6a2ea982ad</li>
</ul>
<p>IGTPW_13999: 13999<br />
  IGT_8608: 42ea0108ec47e4a00aed97d6f98e5339847c7331 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4050-695cfd228beb5b8816553e7002a2d61d381327a8: 695cfd228beb5b8816553e7002a2d61d381327a8<br />
  xe-4052-4247aae08afc576bbe58c7998b5e2f6a2ea982ad: 4247aae08afc576bbe58c7998b5e2f6a2ea982ad</p>

</body>
</html>

--===============3435253081524070752==--
