Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF207CD4F4C
	for <igt-dev@archiver.kernel.org>; Mon,  9 Sep 2024 05:38:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B17810E2B7;
	Mon,  9 Sep 2024 05:38:07 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8292610E2B7;
 Mon,  9 Sep 2024 05:38:06 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1547795739504965491=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_RFC_tests/intel/kms=5Ffrontbuf?=
 =?utf-8?q?fer=5Ftracking=3A_Introduce_plane-fbc-dr_test_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Santhosh Reddy Guddati" <santhosh.reddy.guddati@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 09 Sep 2024 05:38:06 -0000
Message-ID: <172586028652.972530.12674985153646441794@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240904161221.494423-1-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20240904161221.494423-1-santhosh.reddy.guddati@intel.com>
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

--===============1547795739504965491==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: RFC tests/intel/kms_frontbuffer_tracking: Introduce plane-fbc-dr test (rev2)
URL   : https://patchwork.freedesktop.org/series/138218/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8011_BAT -> XEIGTPW_11713_BAT
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

  Here are the changes found in XEIGTPW_11713_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_addfb_basic@addfb25-bad-modifier:
    - bat-bmg-1:          [DMESG-WARN][1] ([Intel XE#877]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/bat-bmg-1/igt@kms_addfb_basic@addfb25-bad-modifier.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/bat-bmg-1/igt@kms_addfb_basic@addfb25-bad-modifier.html

  
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877


Build changes
-------------

  * IGT: IGT_8011 -> IGTPW_11713
  * Linux: xe-1909-217031ad4c962ee8b1b7ac4b30323b4e2ac6d12a -> xe-1910-3d2b2701d3c250fff370f5057f5a9d88d8ba6ca6

  IGTPW_11713: 9107fbd6df3a209334b29eb73a82d393d61ad44d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8011: 26dca87f1252b7f6f0c0f833050256f0244d61e9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1909-217031ad4c962ee8b1b7ac4b30323b4e2ac6d12a: 217031ad4c962ee8b1b7ac4b30323b4e2ac6d12a
  xe-1910-3d2b2701d3c250fff370f5057f5a9d88d8ba6ca6: 3d2b2701d3c250fff370f5057f5a9d88d8ba6ca6

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/index.html

--===============1547795739504965491==
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
<tr><td><b>Series:</b></td><td>RFC tests/intel/kms_frontbuffer_tracking: Introduce plane-fbc-dr test (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/138218/">https://patchwork.freedesktop.org/series/138218/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8011_BAT -&gt; XEIGTPW_11713_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11713_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_addfb_basic@addfb25-bad-modifier:<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8011/bat-bmg-1/igt@kms_addfb_basic@addfb25-bad-modifier.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11713/bat-bmg-1/igt@kms_addfb_basic@addfb25-bad-modifier.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8011 -&gt; IGTPW_11713</li>
<li>Linux: xe-1909-217031ad4c962ee8b1b7ac4b30323b4e2ac6d12a -&gt; xe-1910-3d2b2701d3c250fff370f5057f5a9d88d8ba6ca6</li>
</ul>
<p>IGTPW_11713: 9107fbd6df3a209334b29eb73a82d393d61ad44d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8011: 26dca87f1252b7f6f0c0f833050256f0244d61e9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1909-217031ad4c962ee8b1b7ac4b30323b4e2ac6d12a: 217031ad4c962ee8b1b7ac4b30323b4e2ac6d12a<br />
  xe-1910-3d2b2701d3c250fff370f5057f5a9d88d8ba6ca6: 3d2b2701d3c250fff370f5057f5a9d88d8ba6ca6</p>

</body>
</html>

--===============1547795739504965491==--
