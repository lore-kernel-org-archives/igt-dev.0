Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 035CBEE6450
	for <igt-dev@archiver.kernel.org>; Thu, 12 Sep 2024 12:40:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B12BD10E231;
	Thu, 12 Sep 2024 12:40:55 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C2F210E229;
 Thu, 12 Sep 2024 12:40:55 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8065481602219490476=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_tests/intel/kms=5Fpsr=3A_DP2?=
 =?utf-8?q?=2E1_PR_IGT_Fixes_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Naladala Ramanaidu" <ramanaidu.naladala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 12 Sep 2024 12:40:55 -0000
Message-ID: <172614485530.991649.9354504199885020771@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240911202408.1665929-1-ramanaidu.naladala@intel.com>
In-Reply-To: <20240911202408.1665929-1-ramanaidu.naladala@intel.com>
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

--===============8065481602219490476==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/kms_psr: DP2.1 PR IGT Fixes (rev5)
URL   : https://patchwork.freedesktop.org/series/138157/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8013_BAT -> XEIGTPW_11731_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_11731_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate:
    - bat-lnl-1:          [FAIL][1] ([Intel XE#1069]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8013/bat-lnl-1/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11731/bat-lnl-1/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html

  
  [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069


Build changes
-------------

  * IGT: IGT_8013 -> IGTPW_11731
  * Linux: xe-1929-45bec37c098c2f6232d233c8116236f09327d2b8 -> xe-1935-5c43f7fc693a421b6bd029a255d5c940c0072187

  IGTPW_11731: 11731
  IGT_8013: 8013
  xe-1929-45bec37c098c2f6232d233c8116236f09327d2b8: 45bec37c098c2f6232d233c8116236f09327d2b8
  xe-1935-5c43f7fc693a421b6bd029a255d5c940c0072187: 5c43f7fc693a421b6bd029a255d5c940c0072187

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11731/index.html

--===============8065481602219490476==
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
<tr><td><b>Series:</b></td><td>tests/intel/kms_psr: DP2.1 PR IGT Fixes (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/138157/">https://patchwork.freedesktop.org/series/138157/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11731/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11731/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8013_BAT -&gt; XEIGTPW_11731_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11731_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate:<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8013/bat-lnl-1/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069">Intel XE#1069</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11731/bat-lnl-1/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8013 -&gt; IGTPW_11731</li>
<li>Linux: xe-1929-45bec37c098c2f6232d233c8116236f09327d2b8 -&gt; xe-1935-5c43f7fc693a421b6bd029a255d5c940c0072187</li>
</ul>
<p>IGTPW_11731: 11731<br />
  IGT_8013: 8013<br />
  xe-1929-45bec37c098c2f6232d233c8116236f09327d2b8: 45bec37c098c2f6232d233c8116236f09327d2b8<br />
  xe-1935-5c43f7fc693a421b6bd029a255d5c940c0072187: 5c43f7fc693a421b6bd029a255d5c940c0072187</p>

</body>
</html>

--===============8065481602219490476==--
