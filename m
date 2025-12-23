Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E402E6FE24
	for <igt-dev@archiver.kernel.org>; Tue, 23 Dec 2025 17:59:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACD8B10E008;
	Tue, 23 Dec 2025 17:59:36 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1B5E10E008;
 Tue, 23 Dec 2025 17:59:35 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============9077479957874939145=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Fpat=3A_add?=
 =?utf-8?q?_helper_funtion_to_read_PAT_table_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Xin Wang" <x.wang@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 23 Dec 2025 17:59:35 -0000
Message-ID: <176651277572.114809.297472953402678696@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251219234615.90213-1-x.wang@intel.com>
In-Reply-To: <20251219234615.90213-1-x.wang@intel.com>
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

--===============9077479957874939145==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_pat: add helper funtion to read PAT table (rev3)
URL   : https://patchwork.freedesktop.org/series/159328/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8677_BAT -> XEIGTPW_14269_BAT
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

  Here are the changes found in XEIGTPW_14269_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_peer2peer@read@read-gpua-vram01-gpub-vram01-p2p:
    - bat-bmg-3:          NOTRUN -> [SKIP][1] ([Intel XE#6566]) +3 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14269/bat-bmg-3/igt@xe_peer2peer@read@read-gpua-vram01-gpub-vram01-p2p.html

  * igt@xe_waitfence@engine:
    - bat-dg2-oem2:       [PASS][2] -> [FAIL][3] ([Intel XE#6519])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8677/bat-dg2-oem2/igt@xe_waitfence@engine.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14269/bat-dg2-oem2/igt@xe_waitfence@engine.html

  
  [Intel XE#6519]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519
  [Intel XE#6566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6566


Build changes
-------------

  * IGT: IGT_8677 -> IGTPW_14269
  * Linux: xe-4296-cab246648fd89efbe8d20ed4c86e7fcebd7606da -> xe-4297-98fdf8a438c3a1d9de8d5804cdcda94e097d53a0

  IGTPW_14269: 847b8855f67afab5476ffc447757da34b3978f41 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8677: 8677
  xe-4296-cab246648fd89efbe8d20ed4c86e7fcebd7606da: cab246648fd89efbe8d20ed4c86e7fcebd7606da
  xe-4297-98fdf8a438c3a1d9de8d5804cdcda94e097d53a0: 98fdf8a438c3a1d9de8d5804cdcda94e097d53a0

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14269/index.html

--===============9077479957874939145==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_pat: add helper funtion to read PAT table (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/159328/">https://patchwork.freedesktop.org/series/159328/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14269/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14269/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8677_BAT -&gt; XEIGTPW_14269_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 12)</h2>
<p>Additional (1): bat-bmg-3 </p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14269_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_peer2peer@read@read-gpua-vram01-gpub-vram01-p2p:</p>
<ul>
<li>bat-bmg-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14269/bat-bmg-3/igt@xe_peer2peer@read@read-gpua-vram01-gpub-vram01-p2p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6566">Intel XE#6566</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@engine:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8677/bat-dg2-oem2/igt@xe_waitfence@engine.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14269/bat-dg2-oem2/igt@xe_waitfence@engine.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519">Intel XE#6519</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8677 -&gt; IGTPW_14269</li>
<li>Linux: xe-4296-cab246648fd89efbe8d20ed4c86e7fcebd7606da -&gt; xe-4297-98fdf8a438c3a1d9de8d5804cdcda94e097d53a0</li>
</ul>
<p>IGTPW_14269: 847b8855f67afab5476ffc447757da34b3978f41 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8677: 8677<br />
  xe-4296-cab246648fd89efbe8d20ed4c86e7fcebd7606da: cab246648fd89efbe8d20ed4c86e7fcebd7606da<br />
  xe-4297-98fdf8a438c3a1d9de8d5804cdcda94e097d53a0: 98fdf8a438c3a1d9de8d5804cdcda94e097d53a0</p>

</body>
</html>

--===============9077479957874939145==--
