Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56516C5B572
	for <igt-dev@archiver.kernel.org>; Thu, 13 Aug 2026 21:26:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9095010E058;
	Thu, 13 Aug 2026 21:26:53 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5F8410F53E;
 Thu, 13 Aug 2026 21:26:09 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7146835091890991438=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/unigraf=5Flt=3A_Optim?=
 =?utf-8?q?ize_DP_lane_count_validations?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mark Yacoub" <markyacoub@google.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 13 Aug 2026 21:26:09 -0000
Message-ID: <178665636980.49493.10836521483424005208@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260813175955.2450321-1-markyacoub@google.com>
In-Reply-To: <20260813175955.2450321-1-markyacoub@google.com>
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

--===============7146835091890991438==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/unigraf_lt: Optimize DP lane count validations
URL   : https://patchwork.freedesktop.org/series/172170/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_9055_BAT -> XEIGTPW_15679_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (12 -> 11)
------------------------------

  Missing    (1): bat-nvls-1 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_9055 -> IGTPW_15679
  * Linux: xe-5593-12a74df2314c42325731297e95b9aafd9329a20d -> xe-5594-1f159dc3afe658eaaea3c77d3018705de6b1a31e

  IGTPW_15679: 56f8823820addd586715839150cf22bc52e3488a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9055: 8484e14a094150b500aeeb9bfb0db2ee0de862ea @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5593-12a74df2314c42325731297e95b9aafd9329a20d: 12a74df2314c42325731297e95b9aafd9329a20d
  xe-5594-1f159dc3afe658eaaea3c77d3018705de6b1a31e: 1f159dc3afe658eaaea3c77d3018705de6b1a31e

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15679/index.html

--===============7146835091890991438==
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
<tr><td><b>Series:</b></td><td>tests/unigraf_lt: Optimize DP lane count validations</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/172170/">https://patchwork.freedesktop.org/series/172170/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15679/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15679/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9055_BAT -&gt; XEIGTPW_15679_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 11)</h2>
<p>Missing    (1): bat-nvls-1 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9055 -&gt; IGTPW_15679</li>
<li>Linux: xe-5593-12a74df2314c42325731297e95b9aafd9329a20d -&gt; xe-5594-1f159dc3afe658eaaea3c77d3018705de6b1a31e</li>
</ul>
<p>IGTPW_15679: 56f8823820addd586715839150cf22bc52e3488a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9055: 8484e14a094150b500aeeb9bfb0db2ee0de862ea @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5593-12a74df2314c42325731297e95b9aafd9329a20d: 12a74df2314c42325731297e95b9aafd9329a20d<br />
  xe-5594-1f159dc3afe658eaaea3c77d3018705de6b1a31e: 1f159dc3afe658eaaea3c77d3018705de6b1a31e</p>

</body>
</html>

--===============7146835091890991438==--
