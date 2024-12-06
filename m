Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19A2FE77173
	for <igt-dev@archiver.kernel.org>; Fri,  6 Dec 2024 22:30:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B72DE10F1D6;
	Fri,  6 Dec 2024 22:30:21 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9142E10F1C3;
 Fri,  6 Dec 2024 22:30:20 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3423896343086590622=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Initial_PTL_support_=28rev4?=
 =?utf-8?q?=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Clint Taylor" <clinton.a.taylor@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 06 Dec 2024 22:30:20 -0000
Message-ID: <173352422058.3465139.7470642239893452924@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241206212748.2101217-1-clinton.a.taylor@intel.com>
In-Reply-To: <20241206212748.2101217-1-clinton.a.taylor@intel.com>
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

--===============3423896343086590622==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Initial PTL support (rev4)
URL   : https://patchwork.freedesktop.org/series/141325/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8143_BAT -> XEIGTPW_12272_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_12272_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-flip-vs-dpms@a-edp1:
    - bat-lnl-1:          [PASS][1] -> [DMESG-WARN][2] ([Intel XE#3729]) +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8143/bat-lnl-1/igt@kms_flip@basic-flip-vs-dpms@a-edp1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12272/bat-lnl-1/igt@kms_flip@basic-flip-vs-dpms@a-edp1.html

  
  [Intel XE#3729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3729


Build changes
-------------

  * IGT: IGT_8143 -> IGTPW_12272
  * Linux: xe-2335-261a0301bda5af29477bd710465a8886e8609a4d -> xe-2336-21f6d267c4a3e02cd75de5641f8786e427ce8fa8

  IGTPW_12272: e26156877bc2dfd899a3b422c1abfe883836995a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8143: 515351a02a01f459212197f47ff91053551dcfab @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2335-261a0301bda5af29477bd710465a8886e8609a4d: 261a0301bda5af29477bd710465a8886e8609a4d
  xe-2336-21f6d267c4a3e02cd75de5641f8786e427ce8fa8: 21f6d267c4a3e02cd75de5641f8786e427ce8fa8

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12272/index.html

--===============3423896343086590622==
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
<tr><td><b>Series:</b></td><td>Initial PTL support (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/141325/">https://patchwork.freedesktop.org/series/141325/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12272/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12272/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8143_BAT -&gt; XEIGTPW_12272_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12272_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-dpms@a-edp1:<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8143/bat-lnl-1/igt@kms_flip@basic-flip-vs-dpms@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12272/bat-lnl-1/igt@kms_flip@basic-flip-vs-dpms@a-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3729">Intel XE#3729</a>) +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8143 -&gt; IGTPW_12272</li>
<li>Linux: xe-2335-261a0301bda5af29477bd710465a8886e8609a4d -&gt; xe-2336-21f6d267c4a3e02cd75de5641f8786e427ce8fa8</li>
</ul>
<p>IGTPW_12272: e26156877bc2dfd899a3b422c1abfe883836995a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8143: 515351a02a01f459212197f47ff91053551dcfab @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2335-261a0301bda5af29477bd710465a8886e8609a4d: 261a0301bda5af29477bd710465a8886e8609a4d<br />
  xe-2336-21f6d267c4a3e02cd75de5641f8786e427ce8fa8: 21f6d267c4a3e02cd75de5641f8786e427ce8fa8</p>

</body>
</html>

--===============3423896343086590622==--
