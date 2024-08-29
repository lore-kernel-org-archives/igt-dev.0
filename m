Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B74FBC7115E
	for <igt-dev@archiver.kernel.org>; Thu, 29 Aug 2024 03:56:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69F1210E303;
	Thu, 29 Aug 2024 03:56:23 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20E5C10E00B;
 Thu, 29 Aug 2024 03:56:22 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7839646399276264418=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_tests/kms=5Fwriteback=3A_Add_c?=
 =?utf-8?q?lone_mode_subtest_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jessica Zhang" <quic_jesszhan@quicinc.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 29 Aug 2024 03:56:22 -0000
Message-ID: <172490378212.829836.2003022757325306880@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240828-igt-cwb-v2-0-7b255c730c55@quicinc.com>
In-Reply-To: <20240828-igt-cwb-v2-0-7b255c730c55@quicinc.com>
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

--===============7839646399276264418==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_writeback: Add clone mode subtest (rev2)
URL   : https://patchwork.freedesktop.org/series/137933/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7996_BAT -> XEIGTPW_11657_BAT
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

  Here are the changes found in XEIGTPW_11657_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1:
    - bat-lnl-1:          [FAIL][1] ([Intel XE#886]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7996/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11657/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html

  
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886


Build changes
-------------

  * IGT: IGT_7996 -> IGTPW_11657

  IGTPW_11657: b239bf89185fd814f0ba7a317c75fa2b4c832df6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7996: 0eb26907b747c34903e9ae482ea19bc263a8eeed @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1852-6b66ec881f7ae385f90fe6ad8c6ebef112873a17: 6b66ec881f7ae385f90fe6ad8c6ebef112873a17

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11657/index.html

--===============7839646399276264418==
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
<tr><td><b>Series:</b></td><td>tests/kms_writeback: Add clone mode subtest (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/137933/">https://patchwork.freedesktop.org/series/137933/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11657/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11657/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7996_BAT -&gt; XEIGTPW_11657_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11657_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1:<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7996/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11657/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7996 -&gt; IGTPW_11657</li>
</ul>
<p>IGTPW_11657: b239bf89185fd814f0ba7a317c75fa2b4c832df6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7996: 0eb26907b747c34903e9ae482ea19bc263a8eeed @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1852-6b66ec881f7ae385f90fe6ad8c6ebef112873a17: 6b66ec881f7ae385f90fe6ad8c6ebef112873a17</p>

</body>
</html>

--===============7839646399276264418==--
