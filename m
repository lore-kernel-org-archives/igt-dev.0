Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6C1FCD98F2
	for <igt-dev@archiver.kernel.org>; Tue, 23 Jun 2026 17:00:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91E3D10EBF3;
	Tue, 23 Jun 2026 17:00:08 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C45D10EBF3;
 Tue, 23 Jun 2026 16:59:42 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6032224488789970472=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_lib/igt=5Famd=3A_don=27t_re?=
 =?utf-8?q?ly_on_NUL_separators_parsing_link=5Fsettings?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Harry Wentland" <harry.wentland@amd.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 23 Jun 2026 16:59:42 -0000
Message-ID: <178223398250.106801.13194148408971535614@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260623155541.32145-1-harry.wentland@amd.com>
In-Reply-To: <20260623155541.32145-1-harry.wentland@amd.com>
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

--===============6032224488789970472==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/igt_amd: don't rely on NUL separators parsing link_settings
URL   : https://patchwork.freedesktop.org/series/169032/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8980_BAT -> XEIGTPW_15431_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (12 -> 12)
------------------------------

  No changes in participating hosts

New tests
---------

  New tests have been introduced between XEIGT_8980_BAT and XEIGTPW_15431_BAT:

### New IGT tests (1) ###

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.41, 1.49] s

  


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8980 -> IGTPW_15431

  IGTPW_15431: 15431
  IGT_8980: 65d820119e86b017bf801c8f2bb500e557b29d1c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5290-60326b17f877e12846167bf8ef83680b9875218a: 60326b17f877e12846167bf8ef83680b9875218a

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15431/index.html

--===============6032224488789970472==
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
<tr><td><b>Series:</b></td><td>lib/igt_amd: don&#x27;t rely on NUL separators parsing link_settings</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/169032/">https://patchwork.freedesktop.org/series/169032/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15431/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15431/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8980_BAT -&gt; XEIGTPW_15431_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_8980_BAT and XEIGTPW_15431_BAT:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-edp-1:<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.41, 1.49] s</li>
</ul>
</li>
</ul>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8980 -&gt; IGTPW_15431</li>
</ul>
<p>IGTPW_15431: 15431<br />
  IGT_8980: 65d820119e86b017bf801c8f2bb500e557b29d1c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5290-60326b17f877e12846167bf8ef83680b9875218a: 60326b17f877e12846167bf8ef83680b9875218a</p>

</body>
</html>

--===============6032224488789970472==--
