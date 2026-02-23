Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86759EA4FBA
	for <igt-dev@archiver.kernel.org>; Mon, 23 Feb 2026 13:08:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04AFA10E39E;
	Mon, 23 Feb 2026 13:08:20 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13F3310E39E;
 Mon, 23 Feb 2026 13:08:19 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6250622156005409394=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Add_helper_to_select_non-jo?=
 =?utf-8?q?iner_mode?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Pranay Samala" <pranay.samala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 23 Feb 2026 13:08:19 -0000
Message-ID: <177185209905.275446.17141746629215119950@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260223093443.1797078-1-pranay.samala@intel.com>
In-Reply-To: <20260223093443.1797078-1-pranay.samala@intel.com>
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

--===============6250622156005409394==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add helper to select non-joiner mode
URL   : https://patchwork.freedesktop.org/series/161951/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8765_BAT -> XEIGTPW_14593_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (14 -> 13)
------------------------------

  Missing    (1): bat-bmg-3 

Known issues
------------

  Here are the changes found in XEIGTPW_14593_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_waitfence@abstime:
    - bat-dg2-oem2:       [PASS][1] -> [TIMEOUT][2] ([Intel XE#6506])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8765/bat-dg2-oem2/igt@xe_waitfence@abstime.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14593/bat-dg2-oem2/igt@xe_waitfence@abstime.html

  
  [Intel XE#6506]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506


Build changes
-------------

  * IGT: IGT_8765 -> IGTPW_14593
  * Linux: xe-4585-f8bde45966c329f3025862c5fc462e4b13f52ca8 -> xe-4590-616fe8160929511b0679615cda09751043490b18

  IGTPW_14593: 8d4635225427fa6957f22f6d6fd5529c3a213295 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8765: 8765
  xe-4585-f8bde45966c329f3025862c5fc462e4b13f52ca8: f8bde45966c329f3025862c5fc462e4b13f52ca8
  xe-4590-616fe8160929511b0679615cda09751043490b18: 616fe8160929511b0679615cda09751043490b18

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14593/index.html

--===============6250622156005409394==
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
<tr><td><b>Series:</b></td><td>Add helper to select non-joiner mode</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/161951/">https://patchwork.freedesktop.org/series/161951/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14593/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14593/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8765_BAT -&gt; XEIGTPW_14593_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (14 -&gt; 13)</h2>
<p>Missing    (1): bat-bmg-3 </p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14593_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_waitfence@abstime:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8765/bat-dg2-oem2/igt@xe_waitfence@abstime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14593/bat-dg2-oem2/igt@xe_waitfence@abstime.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506">Intel XE#6506</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8765 -&gt; IGTPW_14593</li>
<li>Linux: xe-4585-f8bde45966c329f3025862c5fc462e4b13f52ca8 -&gt; xe-4590-616fe8160929511b0679615cda09751043490b18</li>
</ul>
<p>IGTPW_14593: 8d4635225427fa6957f22f6d6fd5529c3a213295 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8765: 8765<br />
  xe-4585-f8bde45966c329f3025862c5fc462e4b13f52ca8: f8bde45966c329f3025862c5fc462e4b13f52ca8<br />
  xe-4590-616fe8160929511b0679615cda09751043490b18: 616fe8160929511b0679615cda09751043490b18</p>

</body>
</html>

--===============6250622156005409394==--
