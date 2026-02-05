Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB097ECD983
	for <igt-dev@archiver.kernel.org>; Thu,  5 Feb 2026 16:50:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47FA410E394;
	Thu,  5 Feb 2026 16:50:03 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E74310E394;
 Thu,  5 Feb 2026 16:50:02 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7616185588892592272=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/kms=3A_Convert_remain?=
 =?utf-8?q?ing_for=5Feach=5Fpipe=28=29_to_for=5Feach=5Fcrtc=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 05 Feb 2026 16:50:02 -0000
Message-ID: <177031020242.228376.1591886790489685603@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260205133019.9161-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20260205133019.9161-1-ville.syrjala@linux.intel.com>
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

--===============7616185588892592272==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms: Convert remaining for_each_pipe() to for_each_crtc()
URL   : https://patchwork.freedesktop.org/series/161196/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8739_BAT -> XEIGTPW_14506_BAT
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

  Here are the changes found in XEIGTPW_14506_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_waitfence@abstime:
    - bat-dg2-oem2:       [PASS][1] -> [TIMEOUT][2] ([Intel XE#6506])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8739/bat-dg2-oem2/igt@xe_waitfence@abstime.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14506/bat-dg2-oem2/igt@xe_waitfence@abstime.html

  
  [Intel XE#6506]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506


Build changes
-------------

  * IGT: IGT_8739 -> IGTPW_14506
  * Linux: xe-4506-05230cfcdb1abc225c8e085cd4de470c4b97232f -> xe-4508-7fc41c69853312d5cb58afe7efd7943b6dfb092f

  IGTPW_14506: 14506
  IGT_8739: 8739
  xe-4506-05230cfcdb1abc225c8e085cd4de470c4b97232f: 05230cfcdb1abc225c8e085cd4de470c4b97232f
  xe-4508-7fc41c69853312d5cb58afe7efd7943b6dfb092f: 7fc41c69853312d5cb58afe7efd7943b6dfb092f

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14506/index.html

--===============7616185588892592272==
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
<tr><td><b>Series:</b></td><td>tests/kms: Convert remaining for_each_pipe() to for_each_crtc()</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/161196/">https://patchwork.freedesktop.org/series/161196/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14506/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14506/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8739_BAT -&gt; XEIGTPW_14506_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14506_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_waitfence@abstime:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8739/bat-dg2-oem2/igt@xe_waitfence@abstime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14506/bat-dg2-oem2/igt@xe_waitfence@abstime.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506">Intel XE#6506</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8739 -&gt; IGTPW_14506</li>
<li>Linux: xe-4506-05230cfcdb1abc225c8e085cd4de470c4b97232f -&gt; xe-4508-7fc41c69853312d5cb58afe7efd7943b6dfb092f</li>
</ul>
<p>IGTPW_14506: 14506<br />
  IGT_8739: 8739<br />
  xe-4506-05230cfcdb1abc225c8e085cd4de470c4b97232f: 05230cfcdb1abc225c8e085cd4de470c4b97232f<br />
  xe-4508-7fc41c69853312d5cb58afe7efd7943b6dfb092f: 7fc41c69853312d5cb58afe7efd7943b6dfb092f</p>

</body>
</html>

--===============7616185588892592272==--
