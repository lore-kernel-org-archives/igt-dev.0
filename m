Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40C29FF6E7E
	for <igt-dev@archiver.kernel.org>; Tue, 17 Mar 2026 20:54:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB09810E2BD;
	Tue, 17 Mar 2026 20:54:11 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E15010E2BD;
 Tue, 17 Mar 2026 20:54:07 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7367226784186571853=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel/kms=5Fdirtyfb?=
 =?utf-8?q?=3A_Pass_output_to_PSR_helpers?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jeevan B" <jeevan.b@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 17 Mar 2026 20:54:07 -0000
Message-ID: <177378084751.368405.16910890181408248376@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260317083603.63589-1-jeevan.b@intel.com>
In-Reply-To: <20260317083603.63589-1-jeevan.b@intel.com>
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

--===============7367226784186571853==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/kms_dirtyfb: Pass output to PSR helpers
URL   : https://patchwork.freedesktop.org/series/163363/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8807_BAT -> XEIGTPW_14790_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (12 -> 13)
------------------------------

  Additional (1): bat-bmg-3 

Known issues
------------

  Here are the changes found in XEIGTPW_14790_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:
    - bat-bmg-3:          NOTRUN -> [SKIP][1] ([Intel XE#6566]) +3 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14790/bat-bmg-3/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html

  * igt@xe_waitfence@abstime:
    - bat-dg2-oem2:       [PASS][2] -> [TIMEOUT][3] ([Intel XE#6506])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/bat-dg2-oem2/igt@xe_waitfence@abstime.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14790/bat-dg2-oem2/igt@xe_waitfence@abstime.html

  * igt@xe_waitfence@reltime:
    - bat-dg2-oem2:       [PASS][4] -> [FAIL][5] ([Intel XE#6520])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/bat-dg2-oem2/igt@xe_waitfence@reltime.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14790/bat-dg2-oem2/igt@xe_waitfence@reltime.html

  
  [Intel XE#6506]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506
  [Intel XE#6520]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520
  [Intel XE#6566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6566


Build changes
-------------

  * IGT: IGT_8807 -> IGTPW_14790
  * Linux: xe-4735-113073d07f958385b5b80d29b62e10d2cf0181d6 -> xe-4738-90a49598c224945b556bee26d693fade1b8bdb3a

  IGTPW_14790: 9a888540b9bfa1438aeafcf979ead717c778ba72 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8807: 7f44d96d705f1583d689f1f8c2275b685b4ca11d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4735-113073d07f958385b5b80d29b62e10d2cf0181d6: 113073d07f958385b5b80d29b62e10d2cf0181d6
  xe-4738-90a49598c224945b556bee26d693fade1b8bdb3a: 90a49598c224945b556bee26d693fade1b8bdb3a

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14790/index.html

--===============7367226784186571853==
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
<tr><td><b>Series:</b></td><td>tests/intel/kms_dirtyfb: Pass output to PSR helpers</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/163363/">https://patchwork.freedesktop.org/series/163363/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14790/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14790/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8807_BAT -&gt; XEIGTPW_14790_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 13)</h2>
<p>Additional (1): bat-bmg-3 </p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14790_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>bat-bmg-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14790/bat-bmg-3/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6566">Intel XE#6566</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@abstime:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/bat-dg2-oem2/igt@xe_waitfence@abstime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14790/bat-dg2-oem2/igt@xe_waitfence@abstime.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506">Intel XE#6506</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@reltime:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8807/bat-dg2-oem2/igt@xe_waitfence@reltime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14790/bat-dg2-oem2/igt@xe_waitfence@reltime.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520">Intel XE#6520</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8807 -&gt; IGTPW_14790</li>
<li>Linux: xe-4735-113073d07f958385b5b80d29b62e10d2cf0181d6 -&gt; xe-4738-90a49598c224945b556bee26d693fade1b8bdb3a</li>
</ul>
<p>IGTPW_14790: 9a888540b9bfa1438aeafcf979ead717c778ba72 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8807: 7f44d96d705f1583d689f1f8c2275b685b4ca11d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4735-113073d07f958385b5b80d29b62e10d2cf0181d6: 113073d07f958385b5b80d29b62e10d2cf0181d6<br />
  xe-4738-90a49598c224945b556bee26d693fade1b8bdb3a: 90a49598c224945b556bee26d693fade1b8bdb3a</p>

</body>
</html>

--===============7367226784186571853==--
