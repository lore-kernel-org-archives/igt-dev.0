Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A251EE9128C
	for <igt-dev@archiver.kernel.org>; Thu,  5 Feb 2026 07:53:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CE5F10E175;
	Thu,  5 Feb 2026 07:53:33 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE9A910E175;
 Thu,  5 Feb 2026 07:53:31 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1679640795433452125=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/kms=5Fplane=3A_Refine?=
 =?utf-8?q?_clamping_and_modifier_skips_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Pranay Samala" <pranay.samala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 05 Feb 2026 07:53:31 -0000
Message-ID: <177027801170.227556.9245974191337530245@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260205044128.1052937-1-pranay.samala@intel.com>
In-Reply-To: <20260205044128.1052937-1-pranay.samala@intel.com>
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

--===============1679640795433452125==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_plane: Refine clamping and modifier skips (rev2)
URL   : https://patchwork.freedesktop.org/series/161133/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8738_BAT -> XEIGTPW_14500_BAT
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

  Here are the changes found in XEIGTPW_14500_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_pat@pat-index-xe2@render:
    - bat-ptl-vm:         [PASS][1] -> [DMESG-WARN][2] ([Intel XE#7110]) +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8738/bat-ptl-vm/igt@xe_pat@pat-index-xe2@render.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14500/bat-ptl-vm/igt@xe_pat@pat-index-xe2@render.html

  * igt@xe_waitfence@reltime:
    - bat-dg2-oem2:       [PASS][3] -> [FAIL][4] ([Intel XE#6520])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8738/bat-dg2-oem2/igt@xe_waitfence@reltime.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14500/bat-dg2-oem2/igt@xe_waitfence@reltime.html

  
  [Intel XE#6520]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520
  [Intel XE#7110]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7110


Build changes
-------------

  * IGT: IGT_8738 -> IGTPW_14500

  IGTPW_14500: 4797fc5e0fc91233a377c050b87b7b4e8d55e440 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8738: b3fc8fb534a27517f2a49e63ef993e7550b9b959 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4503-8883ec84c85819dacca94997b60371c3ed57ee29: 8883ec84c85819dacca94997b60371c3ed57ee29

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14500/index.html

--===============1679640795433452125==
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
<tr><td><b>Series:</b></td><td>tests/kms_plane: Refine clamping and modifier skips (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/161133/">https://patchwork.freedesktop.org/series/161133/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14500/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14500/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8738_BAT -&gt; XEIGTPW_14500_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14500_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_pat@pat-index-xe2@render:</p>
<ul>
<li>bat-ptl-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8738/bat-ptl-vm/igt@xe_pat@pat-index-xe2@render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14500/bat-ptl-vm/igt@xe_pat@pat-index-xe2@render.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7110">Intel XE#7110</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@reltime:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8738/bat-dg2-oem2/igt@xe_waitfence@reltime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14500/bat-dg2-oem2/igt@xe_waitfence@reltime.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520">Intel XE#6520</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8738 -&gt; IGTPW_14500</li>
</ul>
<p>IGTPW_14500: 4797fc5e0fc91233a377c050b87b7b4e8d55e440 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8738: b3fc8fb534a27517f2a49e63ef993e7550b9b959 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4503-8883ec84c85819dacca94997b60371c3ed57ee29: 8883ec84c85819dacca94997b60371c3ed57ee29</p>

</body>
</html>

--===============1679640795433452125==--
