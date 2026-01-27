Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50EC6D2FED7
	for <igt-dev@archiver.kernel.org>; Tue, 27 Jan 2026 18:27:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0745710E5B3;
	Tue, 27 Jan 2026 18:27:27 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D15E810E5B5;
 Tue, 27 Jan 2026 18:27:25 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2456006453379115264=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel/kms=5Fjoiner=3A?=
 =?utf-8?q?_Fix_var_usage?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kamil Konieczny" <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 27 Jan 2026 18:27:25 -0000
Message-ID: <176953844585.197236.2969116711016563954@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260127164018.63157-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20260127164018.63157-1-kamil.konieczny@linux.intel.com>
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

--===============2456006453379115264==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/kms_joiner: Fix var usage
URL   : https://patchwork.freedesktop.org/series/160713/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8720_BAT -> XEIGTPW_14429_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (11 -> 12)
------------------------------

  Additional (1): bat-bmg-3 

Known issues
------------

  Here are the changes found in XEIGTPW_14429_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_peer2peer@read@read-gpua-vram01-gpub-vram01-p2p:
    - bat-bmg-3:          NOTRUN -> [SKIP][1] ([Intel XE#6566]) +3 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14429/bat-bmg-3/igt@xe_peer2peer@read@read-gpua-vram01-gpub-vram01-p2p.html

  
  [Intel XE#6566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6566


Build changes
-------------

  * IGT: IGT_8720 -> IGTPW_14429
  * Linux: xe-4452-1a13a943d42ab743e72246f5d765f31cbd609e27 -> xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24

  IGTPW_14429: 0310a1feeebd6497a0cfd0186385ac71ffc47750 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8720: b37a4d70080afd7426cb249787545df75f762dc0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4452-1a13a943d42ab743e72246f5d765f31cbd609e27: 1a13a943d42ab743e72246f5d765f31cbd609e27
  xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24: 1d48b83aca95e25996b1a212f5d3035f38233a24

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14429/index.html

--===============2456006453379115264==
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
<tr><td><b>Series:</b></td><td>tests/intel/kms_joiner: Fix var usage</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/160713/">https://patchwork.freedesktop.org/series/160713/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14429/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14429/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8720_BAT -&gt; XEIGTPW_14429_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 12)</h2>
<p>Additional (1): bat-bmg-3 </p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14429_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_peer2peer@read@read-gpua-vram01-gpub-vram01-p2p:<ul>
<li>bat-bmg-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14429/bat-bmg-3/igt@xe_peer2peer@read@read-gpua-vram01-gpub-vram01-p2p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6566">Intel XE#6566</a>) +3 other tests skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8720 -&gt; IGTPW_14429</li>
<li>Linux: xe-4452-1a13a943d42ab743e72246f5d765f31cbd609e27 -&gt; xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24</li>
</ul>
<p>IGTPW_14429: 0310a1feeebd6497a0cfd0186385ac71ffc47750 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8720: b37a4d70080afd7426cb249787545df75f762dc0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4452-1a13a943d42ab743e72246f5d765f31cbd609e27: 1a13a943d42ab743e72246f5d765f31cbd609e27<br />
  xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24: 1d48b83aca95e25996b1a212f5d3035f38233a24</p>

</body>
</html>

--===============2456006453379115264==--
