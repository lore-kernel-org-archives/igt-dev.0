Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13CF7EED627
	for <igt-dev@archiver.kernel.org>; Thu, 12 Sep 2024 17:06:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7588B10EBEA;
	Thu, 12 Sep 2024 17:06:33 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9750210EBEA;
 Thu, 12 Sep 2024 17:06:32 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0505711139372021126=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_relax_doc_generation_for_non-c?=
 =?utf-8?q?ompiled_tests?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kamil Konieczny" <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 12 Sep 2024 17:06:32 -0000
Message-ID: <172616079261.992849.12968754012595747792@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240912140401.137060-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20240912140401.137060-1-kamil.konieczny@linux.intel.com>
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

--===============0505711139372021126==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: relax doc generation for non-compiled tests
URL   : https://patchwork.freedesktop.org/series/138584/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8014_BAT -> XEIGTPW_11733_BAT
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

  Here are the changes found in XEIGTPW_11733_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - bat-lnl-1:          [PASS][1] -> [FAIL][2] ([Intel XE#886]) +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8014/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11733/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html

  
#### Possible fixes ####

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [FAIL][3] ([Intel XE#1861]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8014/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11733/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886


Build changes
-------------

  * IGT: IGT_8014 -> IGTPW_11733
  * Linux: xe-1937-33996ab92ebe57dd8b2c984fa7d0b0e622b32a03 -> xe-1938-7fc279c7cf796102479291b06b2969d3c27deeb8

  IGTPW_11733: c42d108b0d13af728ed563d1ee3c825572e7d086 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8014: 98173eeaa9d688090abe1e180f855f47e5bad9c0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1937-33996ab92ebe57dd8b2c984fa7d0b0e622b32a03: 33996ab92ebe57dd8b2c984fa7d0b0e622b32a03
  xe-1938-7fc279c7cf796102479291b06b2969d3c27deeb8: 7fc279c7cf796102479291b06b2969d3c27deeb8

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11733/index.html

--===============0505711139372021126==
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
<tr><td><b>Series:</b></td><td>relax doc generation for non-compiled tests</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/138584/">https://patchwork.freedesktop.org/series/138584/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11733/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11733/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8014_BAT -&gt; XEIGTPW_11733_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11733_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-wf_vblank:<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8014/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11733/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +1 other test fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_frontbuffer_tracking@basic:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8014/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11733/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8014 -&gt; IGTPW_11733</li>
<li>Linux: xe-1937-33996ab92ebe57dd8b2c984fa7d0b0e622b32a03 -&gt; xe-1938-7fc279c7cf796102479291b06b2969d3c27deeb8</li>
</ul>
<p>IGTPW_11733: c42d108b0d13af728ed563d1ee3c825572e7d086 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8014: 98173eeaa9d688090abe1e180f855f47e5bad9c0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1937-33996ab92ebe57dd8b2c984fa7d0b0e622b32a03: 33996ab92ebe57dd8b2c984fa7d0b0e622b32a03<br />
  xe-1938-7fc279c7cf796102479291b06b2969d3c27deeb8: 7fc279c7cf796102479291b06b2969d3c27deeb8</p>

</body>
</html>

--===============0505711139372021126==--
