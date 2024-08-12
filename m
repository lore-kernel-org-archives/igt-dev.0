Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FF04C3DA7F
	for <igt-dev@archiver.kernel.org>; Mon, 12 Aug 2024 12:44:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1066E10E1EC;
	Mon, 12 Aug 2024 12:44:21 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37BE910E1EC;
 Mon, 12 Aug 2024 12:44:19 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2017377004368020318=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_tests/amd=5Fqueue=5Freset=3A_f?=
 =?utf-8?q?ix_dynamic_subtest_issue_for_amd_queue_reset?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jesse.zhang@amd.com" <jesse.zhang@amd.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 12 Aug 2024 12:44:19 -0000
Message-ID: <172346665922.594790.8451820436541351928@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240812075051.2925305-1-jesse.zhang@amd.com>
In-Reply-To: <20240812075051.2925305-1-jesse.zhang@amd.com>
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

--===============2017377004368020318==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/amd_queue_reset: fix dynamic subtest issue for amd queue reset
URL   : https://patchwork.freedesktop.org/series/137149/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7966_BAT -> XEIGTPW_11557_BAT
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

  Here are the changes found in XEIGTPW_11557_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - bat-lnl-1:          [PASS][1] -> [FAIL][2] ([Intel XE#886]) +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11557/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html

  
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886


Build changes
-------------

  * IGT: IGT_7966 -> IGTPW_11557
  * Linux: xe-1747-a95e3e46063ddcea598b2ac865173debffba13fe -> xe-1751-1daf2018001da75c5522669aebdb68ba9a353ea6

  IGTPW_11557: 11557
  IGT_7966: f16c5f500adc5fa41bd52a3ef2a84165da4fb596 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1747-a95e3e46063ddcea598b2ac865173debffba13fe: a95e3e46063ddcea598b2ac865173debffba13fe
  xe-1751-1daf2018001da75c5522669aebdb68ba9a353ea6: 1daf2018001da75c5522669aebdb68ba9a353ea6

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11557/index.html

--===============2017377004368020318==
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
<tr><td><b>Series:</b></td><td>tests/amd_queue_reset: fix dynamic subtest issue for amd queue reset</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/137149/">https://patchwork.freedesktop.org/series/137149/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11557/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11557/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7966_BAT -&gt; XEIGTPW_11557_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11557_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-wf_vblank:<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7966/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11557/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +1 other test fail</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7966 -&gt; IGTPW_11557</li>
<li>Linux: xe-1747-a95e3e46063ddcea598b2ac865173debffba13fe -&gt; xe-1751-1daf2018001da75c5522669aebdb68ba9a353ea6</li>
</ul>
<p>IGTPW_11557: 11557<br />
  IGT_7966: f16c5f500adc5fa41bd52a3ef2a84165da4fb596 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1747-a95e3e46063ddcea598b2ac865173debffba13fe: a95e3e46063ddcea598b2ac865173debffba13fe<br />
  xe-1751-1daf2018001da75c5522669aebdb68ba9a353ea6: 1daf2018001da75c5522669aebdb68ba9a353ea6</p>

</body>
</html>

--===============2017377004368020318==--
