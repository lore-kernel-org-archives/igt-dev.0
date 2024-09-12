Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A83E6EE57CC
	for <igt-dev@archiver.kernel.org>; Thu, 12 Sep 2024 00:03:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E36510E95F;
	Thu, 12 Sep 2024 00:03:15 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C42110E905;
 Thu, 12 Sep 2024 00:03:15 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7514642156794053122=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_tests/intel/*=5Fquery=3A_Add_n?=
 =?utf-8?q?ew_hwconfig_table_entry?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Julia Filipchuk" <julia.filipchuk@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 12 Sep 2024 00:03:15 -0000
Message-ID: <172609939500.989142.10502978935111076316@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240910011238.254204-1-julia.filipchuk@intel.com>
In-Reply-To: <20240910011238.254204-1-julia.filipchuk@intel.com>
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

--===============7514642156794053122==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/*_query: Add new hwconfig table entry
URL   : https://patchwork.freedesktop.org/series/138436/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8013_BAT -> XEIGTPW_11715_BAT
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

  Here are the changes found in XEIGTPW_11715_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - bat-lnl-1:          [PASS][1] -> [FAIL][2] ([Intel XE#886]) +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8013/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11715/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html

  
#### Possible fixes ####

  * igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate:
    - bat-lnl-1:          [FAIL][3] ([Intel XE#1069]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8013/bat-lnl-1/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11715/bat-lnl-1/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html

  
  [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886


Build changes
-------------

  * IGT: IGT_8013 -> IGTPW_11715
  * Linux: xe-1929-45bec37c098c2f6232d233c8116236f09327d2b8 -> xe-1930-024375dea928f05b859b457ceaff8c2b33609121

  IGTPW_11715: 11715
  IGT_8013: 8013
  xe-1929-45bec37c098c2f6232d233c8116236f09327d2b8: 45bec37c098c2f6232d233c8116236f09327d2b8
  xe-1930-024375dea928f05b859b457ceaff8c2b33609121: 024375dea928f05b859b457ceaff8c2b33609121

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11715/index.html

--===============7514642156794053122==
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
<tr><td><b>Series:</b></td><td>tests/intel/*_query: Add new hwconfig table entry</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/138436/">https://patchwork.freedesktop.org/series/138436/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11715/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11715/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8013_BAT -&gt; XEIGTPW_11715_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11715_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-wf_vblank:<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8013/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11715/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +1 other test fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate:<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8013/bat-lnl-1/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069">Intel XE#1069</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11715/bat-lnl-1/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8013 -&gt; IGTPW_11715</li>
<li>Linux: xe-1929-45bec37c098c2f6232d233c8116236f09327d2b8 -&gt; xe-1930-024375dea928f05b859b457ceaff8c2b33609121</li>
</ul>
<p>IGTPW_11715: 11715<br />
  IGT_8013: 8013<br />
  xe-1929-45bec37c098c2f6232d233c8116236f09327d2b8: 45bec37c098c2f6232d233c8116236f09327d2b8<br />
  xe-1930-024375dea928f05b859b457ceaff8c2b33609121: 024375dea928f05b859b457ceaff8c2b33609121</p>

</body>
</html>

--===============7514642156794053122==--
