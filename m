Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84BCACA0EEB
	for <igt-dev@archiver.kernel.org>; Thu, 21 Aug 2025 12:55:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DB7010E991;
	Thu, 21 Aug 2025 12:55:41 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5063810E991;
 Thu, 21 Aug 2025 12:55:40 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2356068901295096759=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/kms=5Fcursor=5Flegacy?=
 =?utf-8?q?=3A_don=27t_inhibit_pipe_CRC_calculation_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Micha=C5=82_Grzelak?= <michal.grzelak@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 21 Aug 2025 12:55:40 -0000
Message-ID: <175578094031.257269.2829213094175725526@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250818114207.2251823-1-michal.grzelak@intel.com>
In-Reply-To: <20250818114207.2251823-1-michal.grzelak@intel.com>
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

--===============2356068901295096759==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_cursor_legacy: don't inhibit pipe CRC calculation (rev4)
URL   : https://patchwork.freedesktop.org/series/151943/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8501_BAT -> XEIGTPW_13609_BAT
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

  Here are the changes found in XEIGTPW_13609_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-plain-flip@c-edp1:
    - bat-adlp-7:         [PASS][1] -> [DMESG-WARN][2] ([Intel XE#4543]) +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8501/bat-adlp-7/igt@kms_flip@basic-plain-flip@c-edp1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13609/bat-adlp-7/igt@kms_flip@basic-plain-flip@c-edp1.html

  
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543


Build changes
-------------

  * IGT: IGT_8501 -> IGTPW_13609
  * Linux: xe-3590-1f3c2c82c864322cfa8f79c10c00cf361c926d2f -> xe-3591-16e133c7e6922a9f224b272a48ac172cf06e3408

  IGTPW_13609: c5d02eb80b3a934cd1fb1f9758bc23b9c30222ca @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8501: 87027eb34ac38b8217351eeaa021aeae847b6b61 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3590-1f3c2c82c864322cfa8f79c10c00cf361c926d2f: 1f3c2c82c864322cfa8f79c10c00cf361c926d2f
  xe-3591-16e133c7e6922a9f224b272a48ac172cf06e3408: 16e133c7e6922a9f224b272a48ac172cf06e3408

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13609/index.html

--===============2356068901295096759==
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
<tr><td><b>Series:</b></td><td>tests/kms_cursor_legacy: don&#x27;t inhibit pipe CRC calculation (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/151943/">https://patchwork.freedesktop.org/series/151943/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13609/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13609/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8501_BAT -&gt; XEIGTPW_13609_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_13609_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_flip@basic-plain-flip@c-edp1:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8501/bat-adlp-7/igt@kms_flip@basic-plain-flip@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13609/bat-adlp-7/igt@kms_flip@basic-plain-flip@c-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8501 -&gt; IGTPW_13609</li>
<li>Linux: xe-3590-1f3c2c82c864322cfa8f79c10c00cf361c926d2f -&gt; xe-3591-16e133c7e6922a9f224b272a48ac172cf06e3408</li>
</ul>
<p>IGTPW_13609: c5d02eb80b3a934cd1fb1f9758bc23b9c30222ca @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8501: 87027eb34ac38b8217351eeaa021aeae847b6b61 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3590-1f3c2c82c864322cfa8f79c10c00cf361c926d2f: 1f3c2c82c864322cfa8f79c10c00cf361c926d2f<br />
  xe-3591-16e133c7e6922a9f224b272a48ac172cf06e3408: 16e133c7e6922a9f224b272a48ac172cf06e3408</p>

</body>
</html>

--===============2356068901295096759==--
