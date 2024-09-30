Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A76ACEB2C2
	for <igt-dev@archiver.kernel.org>; Mon, 30 Sep 2024 21:03:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1589F10E2F6;
	Mon, 30 Sep 2024 21:03:30 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40CEE10E59E;
 Mon, 30 Sep 2024 21:03:29 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3012137975271945946=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_tests/intel/xe=5Fpm=5Fresidenc?=
 =?utf-8?q?y=3A_Add_an_assertion_on_MI=5FSTORE_execution_time_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karthik Poosa" <karthik.poosa@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 30 Sep 2024 21:03:29 -0000
Message-ID: <172773020925.1139070.10405495262747140111@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240924080357.1961472-1-karthik.poosa@intel.com>
In-Reply-To: <20240924080357.1961472-1-karthik.poosa@intel.com>
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

--===============3012137975271945946==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_pm_residency: Add an assertion on MI_STORE execution time (rev3)
URL   : https://patchwork.freedesktop.org/series/139006/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8043_BAT -> XEIGTPW_11841_BAT
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

  Here are the changes found in XEIGTPW_11841_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_psr@psr-primary-page-flip@edp-1:
    - bat-lnl-1:          [FAIL][1] ([Intel XE#1649]) -> [PASS][2] +5 other tests pass
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8043/bat-lnl-1/igt@kms_psr@psr-primary-page-flip@edp-1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11841/bat-lnl-1/igt@kms_psr@psr-primary-page-flip@edp-1.html

  
  [Intel XE#1649]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1649


Build changes
-------------

  * IGT: IGT_8043 -> IGTPW_11841
  * Linux: xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f -> xe-1993-4e4d7873ac763aa0bd9207ea9ec2b89bb52a6fe1

  IGTPW_11841: 11841
  IGT_8043: 8043
  xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f: 8a36a5499f143dc694afe235c6a1773421d2bd4f
  xe-1993-4e4d7873ac763aa0bd9207ea9ec2b89bb52a6fe1: 4e4d7873ac763aa0bd9207ea9ec2b89bb52a6fe1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11841/index.html

--===============3012137975271945946==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_pm_residency: Add an assertion on MI_STORE execution time (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/139006/">https://patchwork.freedesktop.org/series/139006/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11841/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11841/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8043_BAT -&gt; XEIGTPW_11841_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11841_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_psr@psr-primary-page-flip@edp-1:<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8043/bat-lnl-1/igt@kms_psr@psr-primary-page-flip@edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1649">Intel XE#1649</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11841/bat-lnl-1/igt@kms_psr@psr-primary-page-flip@edp-1.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8043 -&gt; IGTPW_11841</li>
<li>Linux: xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f -&gt; xe-1993-4e4d7873ac763aa0bd9207ea9ec2b89bb52a6fe1</li>
</ul>
<p>IGTPW_11841: 11841<br />
  IGT_8043: 8043<br />
  xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f: 8a36a5499f143dc694afe235c6a1773421d2bd4f<br />
  xe-1993-4e4d7873ac763aa0bd9207ea9ec2b89bb52a6fe1: 4e4d7873ac763aa0bd9207ea9ec2b89bb52a6fe1</p>

</body>
</html>

--===============3012137975271945946==--
