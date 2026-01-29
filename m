Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1964ED358D6
	for <igt-dev@archiver.kernel.org>; Thu, 29 Jan 2026 16:49:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9E2910E172;
	Thu, 29 Jan 2026 16:49:10 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7F6610E172;
 Thu, 29 Jan 2026 16:49:09 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5724840096014911561=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_lib/xe=5Fgt=3A_Handle_unkno?=
 =?utf-8?q?wn_C-state?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sk Anirban" <sk.anirban@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 29 Jan 2026 16:49:09 -0000
Message-ID: <176970534968.205652.17656630368287639080@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260129105938.1114574-2-sk.anirban@intel.com>
In-Reply-To: <20260129105938.1114574-2-sk.anirban@intel.com>
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

--===============5724840096014911561==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/xe_gt: Handle unknown C-state
URL   : https://patchwork.freedesktop.org/series/160834/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8725_BAT -> XEIGTPW_14448_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (12 -> 12)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_14448_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_waitfence@reltime:
    - bat-dg2-oem2:       [PASS][1] -> [FAIL][2] ([Intel XE#6520])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8725/bat-dg2-oem2/igt@xe_waitfence@reltime.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14448/bat-dg2-oem2/igt@xe_waitfence@reltime.html

  
  [Intel XE#6520]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520


Build changes
-------------

  * IGT: IGT_8725 -> IGTPW_14448
  * Linux: xe-4469-7d2c5f861ae9bbed1464e1a6aa39a9055139a4b0 -> xe-4470-da5f68358e5e6387a069de78a6c493b27df99ccc

  IGTPW_14448: 14448
  IGT_8725: 8725
  xe-4469-7d2c5f861ae9bbed1464e1a6aa39a9055139a4b0: 7d2c5f861ae9bbed1464e1a6aa39a9055139a4b0
  xe-4470-da5f68358e5e6387a069de78a6c493b27df99ccc: da5f68358e5e6387a069de78a6c493b27df99ccc

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14448/index.html

--===============5724840096014911561==
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
<tr><td><b>Series:</b></td><td>lib/xe_gt: Handle unknown C-state</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/160834/">https://patchwork.freedesktop.org/series/160834/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14448/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14448/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8725_BAT -&gt; XEIGTPW_14448_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14448_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_waitfence@reltime:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8725/bat-dg2-oem2/igt@xe_waitfence@reltime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14448/bat-dg2-oem2/igt@xe_waitfence@reltime.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520">Intel XE#6520</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8725 -&gt; IGTPW_14448</li>
<li>Linux: xe-4469-7d2c5f861ae9bbed1464e1a6aa39a9055139a4b0 -&gt; xe-4470-da5f68358e5e6387a069de78a6c493b27df99ccc</li>
</ul>
<p>IGTPW_14448: 14448<br />
  IGT_8725: 8725<br />
  xe-4469-7d2c5f861ae9bbed1464e1a6aa39a9055139a4b0: 7d2c5f861ae9bbed1464e1a6aa39a9055139a4b0<br />
  xe-4470-da5f68358e5e6387a069de78a6c493b27df99ccc: da5f68358e5e6387a069de78a6c493b27df99ccc</p>

</body>
</html>

--===============5724840096014911561==--
