Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A38F6C6FD1F
	for <igt-dev@archiver.kernel.org>; Fri, 22 Mar 2024 10:26:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A9A410F2B2;
	Fri, 22 Mar 2024 10:26:50 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A16E610F434;
 Fri, 22 Mar 2024 10:26:48 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2040722376653414849=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_tests/intel/kms=5Fdsc=3A_Use_h?=
 =?utf-8?q?igh_resolution_mode_for_output_format_subtests?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 22 Mar 2024 10:26:48 -0000
Message-ID: <171110320866.960914.17847629904066900990@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240322081442.4120318-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20240322081442.4120318-1-ankit.k.nautiyal@intel.com>
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

--===============2040722376653414849==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/kms_dsc: Use high resolution mode for output format subtests
URL   : https://patchwork.freedesktop.org/series/131478/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7777_BAT -> XEIGTPW_10882_BAT
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

  Here are the changes found in XEIGTPW_10882_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [FAIL][1] ([Intel XE#616]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7777/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10882/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616


Build changes
-------------

  * IGT: IGT_7777 -> IGTPW_10882
  * Linux: xe-975-236ae2b6b695ecedc3cf4453a1679d53b2e06f32 -> xe-976-3d5d23573ab7e4244935bb8dd93d385a9f5c8f4a

  IGTPW_10882: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10882/index.html
  IGT_7777: 7777
  xe-975-236ae2b6b695ecedc3cf4453a1679d53b2e06f32: 236ae2b6b695ecedc3cf4453a1679d53b2e06f32
  xe-976-3d5d23573ab7e4244935bb8dd93d385a9f5c8f4a: 3d5d23573ab7e4244935bb8dd93d385a9f5c8f4a

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10882/index.html

--===============2040722376653414849==
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
<tr><td><b>Series:</b></td><td>tests/intel/kms_dsc: Use high resolution mode for output format subtests</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/131478/">https://patchwork.freedesktop.org/series/131478/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10882/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10882/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7777_BAT -&gt; XEIGTPW_10882_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_10882_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_frontbuffer_tracking@basic:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7777/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10882/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7777 -&gt; IGTPW_10882</li>
<li>Linux: xe-975-236ae2b6b695ecedc3cf4453a1679d53b2e06f32 -&gt; xe-976-3d5d23573ab7e4244935bb8dd93d385a9f5c8f4a</li>
</ul>
<p>IGTPW_10882: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10882/index.html<br />
  IGT_7777: 7777<br />
  xe-975-236ae2b6b695ecedc3cf4453a1679d53b2e06f32: 236ae2b6b695ecedc3cf4453a1679d53b2e06f32<br />
  xe-976-3d5d23573ab7e4244935bb8dd93d385a9f5c8f4a: 3d5d23573ab7e4244935bb8dd93d385a9f5c8f4a</p>

</body>
</html>

--===============2040722376653414849==--
