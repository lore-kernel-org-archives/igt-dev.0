Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11B0DCD4F4A
	for <igt-dev@archiver.kernel.org>; Wed,  4 Sep 2024 23:39:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6F1810E051;
	Wed,  4 Sep 2024 23:39:44 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 646AF10E051;
 Wed,  4 Sep 2024 23:39:43 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6465562375982510962=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_tests/intel/xe=5Fdrm=5Ffdinfo?=
 =?utf-8?q?=3A_Virtual_and_parallel?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 04 Sep 2024 23:39:43 -0000
Message-ID: <172549318338.949084.16004083013812978183@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240904225746.2857448-1-lucas.demarchi@intel.com>
In-Reply-To: <20240904225746.2857448-1-lucas.demarchi@intel.com>
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

--===============6465562375982510962==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_drm_fdinfo: Virtual and parallel
URL   : https://patchwork.freedesktop.org/series/138225/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8005_BAT -> XEIGTPW_11698_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_11698_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - bat-lnl-1:          [PASS][1] -> [FAIL][2] ([Intel XE#886]) +2 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8005/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11698/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html

  
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886


Build changes
-------------

  * IGT: IGT_8005 -> IGTPW_11698
  * Linux: xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea -> xe-1891-8b1096500fd6fae573f7d9c4416778d6442e985d

  IGTPW_11698: 11698
  IGT_8005: fc3113c8c1e99797b2d4769aaf02265be64a7589 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea: c72d3ffc0308b71024de6f80c3596668991c67ea
  xe-1891-8b1096500fd6fae573f7d9c4416778d6442e985d: 8b1096500fd6fae573f7d9c4416778d6442e985d

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11698/index.html

--===============6465562375982510962==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_drm_fdinfo: Virtual and parallel</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/138225/">https://patchwork.freedesktop.org/series/138225/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11698/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11698/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8005_BAT -&gt; XEIGTPW_11698_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11698_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-wf_vblank:<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8005/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11698/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +2 other tests fail</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8005 -&gt; IGTPW_11698</li>
<li>Linux: xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea -&gt; xe-1891-8b1096500fd6fae573f7d9c4416778d6442e985d</li>
</ul>
<p>IGTPW_11698: 11698<br />
  IGT_8005: fc3113c8c1e99797b2d4769aaf02265be64a7589 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea: c72d3ffc0308b71024de6f80c3596668991c67ea<br />
  xe-1891-8b1096500fd6fae573f7d9c4416778d6442e985d: 8b1096500fd6fae573f7d9c4416778d6442e985d</p>

</body>
</html>

--===============6465562375982510962==--
