Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94524C624DE
	for <igt-dev@archiver.kernel.org>; Thu,  3 Sep 2026 22:13:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34A2E10F7D0;
	Thu,  3 Sep 2026 22:13:30 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FDDE10F7D0;
 Thu,  3 Sep 2026 22:12:45 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8321569492525890932=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_series_starting_with_=5Bi-g?=
 =?utf-8?q?-t=2Cv2=2C1/2=5D_tests/amdgpu/amd=5Fdp=5Fdsc=3A_Do_not_disable_DS?=
 =?utf-8?q?C_for_high_bw_panels?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "George Zhang" <george.zhang@amd.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 03 Sep 2026 22:12:45 -0000
Message-ID: <178847356551.121110.13480728193401213564@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260903192458.1149302-1-george.zhang@amd.com>
In-Reply-To: <20260903192458.1149302-1-george.zhang@amd.com>
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

--===============8321569492525890932==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,v2,1/2] tests/amdgpu/amd_dp_dsc: Do not disable DSC for high bw panels
URL   : https://patchwork.freedesktop.org/series/173331/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_9084_BAT -> XEIGTPW_15782_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 11)
------------------------------

  Missing    (2): bat-bmg-2 bat-nvls-1 

Known issues
------------

  Here are the changes found in XEIGTPW_15782_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_waitfence@engine:
    - bat-ptl-2:          [PASS][1] -> [FAIL][2] ([Intel XE#9109])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9084/bat-ptl-2/igt@xe_waitfence@engine.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15782/bat-ptl-2/igt@xe_waitfence@engine.html

  
  [Intel XE#9109]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9109


Build changes
-------------

  * IGT: IGT_9084 -> IGTPW_15782
  * Linux: xe-5687-78e2bb86709699d886be71a6f9c9dc41e4bf9aab -> xe-5689-96ca9b9870504c4a80addae1da9454c8c704a826

  IGTPW_15782: 15782
  IGT_9084: 9084
  xe-5687-78e2bb86709699d886be71a6f9c9dc41e4bf9aab: 78e2bb86709699d886be71a6f9c9dc41e4bf9aab
  xe-5689-96ca9b9870504c4a80addae1da9454c8c704a826: 96ca9b9870504c4a80addae1da9454c8c704a826

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15782/index.html

--===============8321569492525890932==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,v2,1/2] tests/amdgpu/amd_dp_dsc: Do not disable DSC for high bw panels</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/173331/">https://patchwork.freedesktop.org/series/173331/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15782/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15782/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9084_BAT -&gt; XEIGTPW_15782_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 11)</h2>
<p>Missing    (2): bat-bmg-2 bat-nvls-1 </p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_15782_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_waitfence@engine:<ul>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9084/bat-ptl-2/igt@xe_waitfence@engine.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15782/bat-ptl-2/igt@xe_waitfence@engine.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9109">Intel XE#9109</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9084 -&gt; IGTPW_15782</li>
<li>Linux: xe-5687-78e2bb86709699d886be71a6f9c9dc41e4bf9aab -&gt; xe-5689-96ca9b9870504c4a80addae1da9454c8c704a826</li>
</ul>
<p>IGTPW_15782: 15782<br />
  IGT_9084: 9084<br />
  xe-5687-78e2bb86709699d886be71a6f9c9dc41e4bf9aab: 78e2bb86709699d886be71a6f9c9dc41e4bf9aab<br />
  xe-5689-96ca9b9870504c4a80addae1da9454c8c704a826: 96ca9b9870504c4a80addae1da9454c8c704a826</p>

</body>
</html>

--===============8321569492525890932==--
