Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56B0CC25B77
	for <igt-dev@archiver.kernel.org>; Fri, 17 May 2024 12:28:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC6DC10EE84;
	Fri, 17 May 2024 12:28:52 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5117B10EE89;
 Fri, 17 May 2024 12:28:51 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8277595684967937069=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_lib/igt=5Fpsr=3A_Handle_PR=5FM?=
 =?utf-8?q?ODE2=5FSEL=5FFETCH_and_eDP_PR=5F*_in_psr_active_check?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 17 May 2024 12:28:51 -0000
Message-ID: <171594893132.2142370.2176544855289822421@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240517113138.2579843-1-jouni.hogander@intel.com>
In-Reply-To: <20240517113138.2579843-1-jouni.hogander@intel.com>
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

--===============8277595684967937069==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/igt_psr: Handle PR_MODE2_SEL_FETCH and eDP PR_* in psr active check
URL   : https://patchwork.freedesktop.org/series/133745/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7860_BAT -> XEIGTPW_11154_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (5 -> 5)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_11154_BAT that come from known issues:

### IGT changes ###

#### Warnings ####

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [FAIL][1] ([Intel XE#1861]) -> [DMESG-FAIL][2] ([Intel XE#324])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7860/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11154/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324


Build changes
-------------

  * IGT: IGT_7860 -> IGTPW_11154
  * Linux: xe-1302-f5b1f5e83aca888ada6cf909735023349a73d3df -> xe-1305-8ef53c10d150679e3ff5db00d128417dfffb7798

  IGTPW_11154: 11154
  IGT_7860: 05b3f5540c6dcaacdf2169dc730c126df9ffd7e2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1302-f5b1f5e83aca888ada6cf909735023349a73d3df: f5b1f5e83aca888ada6cf909735023349a73d3df
  xe-1305-8ef53c10d150679e3ff5db00d128417dfffb7798: 8ef53c10d150679e3ff5db00d128417dfffb7798

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11154/index.html

--===============8277595684967937069==
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
<tr><td><b>Series:</b></td><td>lib/igt_psr: Handle PR_MODE2_SEL_FETCH and eDP PR_* in psr active check</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/133745/">https://patchwork.freedesktop.org/series/133745/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11154/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11154/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7860_BAT -&gt; XEIGTPW_11154_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11154_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>igt@kms_frontbuffer_tracking@basic:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7860/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11154/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7860 -&gt; IGTPW_11154</li>
<li>Linux: xe-1302-f5b1f5e83aca888ada6cf909735023349a73d3df -&gt; xe-1305-8ef53c10d150679e3ff5db00d128417dfffb7798</li>
</ul>
<p>IGTPW_11154: 11154<br />
  IGT_7860: 05b3f5540c6dcaacdf2169dc730c126df9ffd7e2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1302-f5b1f5e83aca888ada6cf909735023349a73d3df: f5b1f5e83aca888ada6cf909735023349a73d3df<br />
  xe-1305-8ef53c10d150679e3ff5db00d128417dfffb7798: 8ef53c10d150679e3ff5db00d128417dfffb7798</p>

</body>
</html>

--===============8277595684967937069==--
