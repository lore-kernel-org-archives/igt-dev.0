Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0400FC48260
	for <igt-dev@archiver.kernel.org>; Fri, 16 Feb 2024 10:47:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D8BD10EAFB;
	Fri, 16 Feb 2024 10:47:30 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4531E10EAFB;
 Fri, 16 Feb 2024 10:47:29 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5565319458785183754=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_tests/kms=5Funiversal=5Fplane?=
 =?utf-8?q?=3A_Re-work_expectations_for_non-intel_hw_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rob Clark" <robdclark@gmail.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 16 Feb 2024 10:47:29 -0000
Message-ID: <170808044928.36543.13203972479434155731@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240215222034.327548-1-robdclark@gmail.com>
In-Reply-To: <20240215222034.327548-1-robdclark@gmail.com>
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

--===============5565319458785183754==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_universal_plane: Re-work expectations for non-intel hw (rev2)
URL   : https://patchwork.freedesktop.org/series/128450/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7715_BAT -> XEIGTPW_10683_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_10683_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_exec_threads@threads-mixed-fd-basic:
    - bat-dg2-oem2:       [TIMEOUT][1] ([Intel XE#1167]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7715/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-fd-basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10683/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-fd-basic.html

  
  [Intel XE#1167]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1167


Build changes
-------------

  * IGT: IGT_7715 -> IGTPW_10683
  * Linux: xe-787-6d3abf8f7f55420cf53e9ed344872c459ecfd0ed -> xe-788-f9855a4be31b723fe67e9b6f6cfb0df7760cd6d8

  IGTPW_10683: 10683
  IGT_7715: 7715
  xe-787-6d3abf8f7f55420cf53e9ed344872c459ecfd0ed: 6d3abf8f7f55420cf53e9ed344872c459ecfd0ed
  xe-788-f9855a4be31b723fe67e9b6f6cfb0df7760cd6d8: f9855a4be31b723fe67e9b6f6cfb0df7760cd6d8

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10683/index.html

--===============5565319458785183754==
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
<tr><td><b>Series:</b></td><td>tests/kms_universal_plane: Re-work expectations for non-intel hw (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/128450/">https://patchwork.freedesktop.org/series/128450/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10683/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10683/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7715_BAT -&gt; XEIGTPW_10683_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_10683_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_exec_threads@threads-mixed-fd-basic:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7715/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-fd-basic.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1167">Intel XE#1167</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10683/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-fd-basic.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7715 -&gt; IGTPW_10683</li>
<li>Linux: xe-787-6d3abf8f7f55420cf53e9ed344872c459ecfd0ed -&gt; xe-788-f9855a4be31b723fe67e9b6f6cfb0df7760cd6d8</li>
</ul>
<p>IGTPW_10683: 10683<br />
  IGT_7715: 7715<br />
  xe-787-6d3abf8f7f55420cf53e9ed344872c459ecfd0ed: 6d3abf8f7f55420cf53e9ed344872c459ecfd0ed<br />
  xe-788-f9855a4be31b723fe67e9b6f6cfb0df7760cd6d8: f9855a4be31b723fe67e9b6f6cfb0df7760cd6d8</p>

</body>
</html>

--===============5565319458785183754==--
