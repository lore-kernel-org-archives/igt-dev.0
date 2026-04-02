Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78EF8D6AAEC
	for <igt-dev@archiver.kernel.org>; Thu,  2 Apr 2026 17:30:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED2F510F045;
	Thu,  2 Apr 2026 17:30:09 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FBA610F045;
 Thu,  2 Apr 2026 17:30:01 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3264394621924575501=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Guard_gt-c6-idle_test_again?=
 =?utf-8?q?st_busy_DRM_clients?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Soham Purkait" <soham.purkait@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 02 Apr 2026 17:30:01 -0000
Message-ID: <177515100137.429438.8563601909830714979@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260402130026.2687520-1-soham.purkait@intel.com>
In-Reply-To: <20260402130026.2687520-1-soham.purkait@intel.com>
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

--===============3264394621924575501==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Guard gt-c6-idle test against busy DRM clients
URL   : https://patchwork.freedesktop.org/series/164296/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8845_BAT -> XEIGTPW_14921_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (14 -> 14)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_14921_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_pmu@gt-c6-idle:
    - bat-ptl-vm:         NOTRUN -> [SKIP][1] ([Intel XE#6007] / [Intel XE#6052])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14921/bat-ptl-vm/igt@xe_pmu@gt-c6-idle.html
    - bat-adlp-vm:        NOTRUN -> [SKIP][2] ([Intel XE#6007])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14921/bat-adlp-vm/igt@xe_pmu@gt-c6-idle.html

  * igt@xe_waitfence@abstime:
    - bat-dg2-oem2:       [PASS][3] -> [TIMEOUT][4] ([Intel XE#6506])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8845/bat-dg2-oem2/igt@xe_waitfence@abstime.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14921/bat-dg2-oem2/igt@xe_waitfence@abstime.html

  * igt@xe_waitfence@reltime:
    - bat-dg2-oem2:       [PASS][5] -> [FAIL][6] ([Intel XE#6520])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8845/bat-dg2-oem2/igt@xe_waitfence@reltime.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14921/bat-dg2-oem2/igt@xe_waitfence@reltime.html

  
  [Intel XE#6007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6007
  [Intel XE#6052]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6052
  [Intel XE#6506]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506
  [Intel XE#6520]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520


Build changes
-------------

  * IGT: IGT_8845 -> IGTPW_14921

  IGTPW_14921: ba18d9f8bdb6ca848dc654022874f25366e3f4a6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8845: bdaaf0b253471f6018f93e5c63f5415aa0c96bcb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4843-dba2251b00d3faac3be7fc15431ffb9c4d60232b: dba2251b00d3faac3be7fc15431ffb9c4d60232b

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14921/index.html

--===============3264394621924575501==
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
<tr><td><b>Series:</b></td><td>Guard gt-c6-idle test against busy DRM clients</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/164296/">https://patchwork.freedesktop.org/series/164296/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14921/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14921/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8845_BAT -&gt; XEIGTPW_14921_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (14 -&gt; 14)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14921_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_pmu@gt-c6-idle:</p>
<ul>
<li>bat-ptl-vm:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14921/bat-ptl-vm/igt@xe_pmu@gt-c6-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6007">Intel XE#6007</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6052">Intel XE#6052</a>)</li>
<li>bat-adlp-vm:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14921/bat-adlp-vm/igt@xe_pmu@gt-c6-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6007">Intel XE#6007</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@abstime:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8845/bat-dg2-oem2/igt@xe_waitfence@abstime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14921/bat-dg2-oem2/igt@xe_waitfence@abstime.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506">Intel XE#6506</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@reltime:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8845/bat-dg2-oem2/igt@xe_waitfence@reltime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14921/bat-dg2-oem2/igt@xe_waitfence@reltime.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520">Intel XE#6520</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8845 -&gt; IGTPW_14921</li>
</ul>
<p>IGTPW_14921: ba18d9f8bdb6ca848dc654022874f25366e3f4a6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8845: bdaaf0b253471f6018f93e5c63f5415aa0c96bcb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4843-dba2251b00d3faac3be7fc15431ffb9c4d60232b: dba2251b00d3faac3be7fc15431ffb9c4d60232b</p>

</body>
</html>

--===============3264394621924575501==--
