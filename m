Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76F37C54E71
	for <igt-dev@archiver.kernel.org>; Fri, 22 Mar 2024 07:07:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED61910E547;
	Fri, 22 Mar 2024 07:07:24 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1B7310E00B;
 Fri, 22 Mar 2024 07:07:23 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2307397765447572977=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_tests/kms=5Fprime=3A_Add_XE_su?=
 =?utf-8?q?pport_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nidhi Gupta" <nidhi1.gupta@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 22 Mar 2024 07:07:23 -0000
Message-ID: <171109124372.959940.11005241784711761998@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240322064354.14129-1-nidhi1.gupta@intel.com>
In-Reply-To: <20240322064354.14129-1-nidhi1.gupta@intel.com>
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

--===============2307397765447572977==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_prime: Add XE support (rev6)
URL   : https://patchwork.freedesktop.org/series/128045/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7776_BAT -> XEIGTPW_10881_BAT
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

  Here are the changes found in XEIGTPW_10881_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_exec_threads@threads-mixed-fd-basic:
    - bat-dg2-oem2:       [TIMEOUT][1] ([Intel XE#1167]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7776/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-fd-basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10881/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-fd-basic.html

  
  [Intel XE#1167]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1167


Build changes
-------------

  * IGT: IGT_7776 -> IGTPW_10881
  * Linux: xe-973-ad4a10c6d0e21df4bd830c20c96b795ae2d03962 -> xe-975-236ae2b6b695ecedc3cf4453a1679d53b2e06f32

  IGTPW_10881: 10881
  IGT_7776: 7776
  xe-973-ad4a10c6d0e21df4bd830c20c96b795ae2d03962: ad4a10c6d0e21df4bd830c20c96b795ae2d03962
  xe-975-236ae2b6b695ecedc3cf4453a1679d53b2e06f32: 236ae2b6b695ecedc3cf4453a1679d53b2e06f32

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10881/index.html

--===============2307397765447572977==
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
<tr><td><b>Series:</b></td><td>tests/kms_prime: Add XE support (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/128045/">https://patchwork.freedesktop.org/series/128045/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10881/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10881/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7776_BAT -&gt; XEIGTPW_10881_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_10881_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_exec_threads@threads-mixed-fd-basic:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7776/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-fd-basic.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1167">Intel XE#1167</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10881/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-fd-basic.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7776 -&gt; IGTPW_10881</li>
<li>Linux: xe-973-ad4a10c6d0e21df4bd830c20c96b795ae2d03962 -&gt; xe-975-236ae2b6b695ecedc3cf4453a1679d53b2e06f32</li>
</ul>
<p>IGTPW_10881: 10881<br />
  IGT_7776: 7776<br />
  xe-973-ad4a10c6d0e21df4bd830c20c96b795ae2d03962: ad4a10c6d0e21df4bd830c20c96b795ae2d03962<br />
  xe-975-236ae2b6b695ecedc3cf4453a1679d53b2e06f32: 236ae2b6b695ecedc3cf4453a1679d53b2e06f32</p>

</body>
</html>

--===============2307397765447572977==--
