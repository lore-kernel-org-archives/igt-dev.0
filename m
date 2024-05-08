Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 061EEC04FFE
	for <igt-dev@archiver.kernel.org>; Wed,  8 May 2024 21:32:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BA381129E9;
	Wed,  8 May 2024 21:32:12 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42B571129E9;
 Wed,  8 May 2024 21:32:11 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2921746187288660931=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_tests/sriov=5Fbasic=3A_Skip_te?=
 =?utf-8?q?sts_if_sriov=5Ftotalvfs_is_zero?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Marcin Bernatowicz" <marcin.bernatowicz@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 08 May 2024 21:32:11 -0000
Message-ID: <171520393126.2023341.16409935953917885816@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240508193258.4069853-1-marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20240508193258.4069853-1-marcin.bernatowicz@linux.intel.com>
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

--===============2921746187288660931==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/sriov_basic: Skip tests if sriov_totalvfs is zero
URL   : https://patchwork.freedesktop.org/series/133340/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7843_BAT -> XEIGTPW_11115_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 5)
------------------------------

  Additional (1): bat-lnl-1 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_11115_BAT:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_addfb_basic@addfb25-bad-modifier:
    - {bat-lnl-1}:        NOTRUN -> [INCOMPLETE][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11115/bat-lnl-1/igt@kms_addfb_basic@addfb25-bad-modifier.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).



Build changes
-------------

  * IGT: IGT_7843 -> IGTPW_11115
  * Linux: xe-1257-34d52122a69076639d526b035c8edd5b43201f84 -> xe-1259-8476ff943d5bc96e47fd38df01b1d2c632c2dda6

  IGTPW_11115: 1bc0ba5b7d24a6dc5b47378a6dd4f1f9b3ace128 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7843: 0df7b9b97f9da0e364f5ee30fe331004b8c86b56 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1257-34d52122a69076639d526b035c8edd5b43201f84: 34d52122a69076639d526b035c8edd5b43201f84
  xe-1259-8476ff943d5bc96e47fd38df01b1d2c632c2dda6: 8476ff943d5bc96e47fd38df01b1d2c632c2dda6

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11115/index.html

--===============2921746187288660931==
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
<tr><td><b>Series:</b></td><td>tests/sriov_basic: Skip tests if sriov_totalvfs is zero</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/133340/">https://patchwork.freedesktop.org/series/133340/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11115/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11115/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7843_BAT -&gt; XEIGTPW_11115_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 5)</h2>
<p>Additional (1): bat-lnl-1 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_11115_BAT:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@kms_addfb_basic@addfb25-bad-modifier:<ul>
<li>{bat-lnl-1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11115/bat-lnl-1/igt@kms_addfb_basic@addfb25-bad-modifier.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7843 -&gt; IGTPW_11115</li>
<li>Linux: xe-1257-34d52122a69076639d526b035c8edd5b43201f84 -&gt; xe-1259-8476ff943d5bc96e47fd38df01b1d2c632c2dda6</li>
</ul>
<p>IGTPW_11115: 1bc0ba5b7d24a6dc5b47378a6dd4f1f9b3ace128 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7843: 0df7b9b97f9da0e364f5ee30fe331004b8c86b56 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1257-34d52122a69076639d526b035c8edd5b43201f84: 34d52122a69076639d526b035c8edd5b43201f84<br />
  xe-1259-8476ff943d5bc96e47fd38df01b1d2c632c2dda6: 8476ff943d5bc96e47fd38df01b1d2c632c2dda6</p>

</body>
</html>

--===============2921746187288660931==--
