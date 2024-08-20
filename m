Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1104EC3DA4A
	for <igt-dev@archiver.kernel.org>; Tue, 20 Aug 2024 19:19:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A73A110E4E2;
	Tue, 20 Aug 2024 19:19:55 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB44B10E4DA;
 Tue, 20 Aug 2024 19:19:54 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4717715855317000267=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_tests/intel/xe=5Fgt=5Ffreq=3A_?=
 =?utf-8?q?Add_a_wait_after_gt_reset_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karthik Poosa" <karthik.poosa@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 20 Aug 2024 19:19:54 -0000
Message-ID: <172418159488.700411.1495125765935101890@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240820182324.3206155-1-karthik.poosa@intel.com>
In-Reply-To: <20240820182324.3206155-1-karthik.poosa@intel.com>
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

--===============4717715855317000267==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_gt_freq: Add a wait after gt reset (rev4)
URL   : https://patchwork.freedesktop.org/series/136675/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7980_BAT -> XEIGTPW_11604_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_11604_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_psr@psr-cursor-plane-move@edp-1:
    - bat-lnl-1:          [FAIL][1] -> [PASS][2] +1 other test pass
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7980/bat-lnl-1/igt@kms_psr@psr-cursor-plane-move@edp-1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11604/bat-lnl-1/igt@kms_psr@psr-cursor-plane-move@edp-1.html

  


Build changes
-------------

  * IGT: IGT_7980 -> IGTPW_11604

  IGTPW_11604: 2e4a4ce94975c4ffc557fac2c1fbebb78763a21d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7980: 76c81cac2f5108ebc2e7a82ea627aeffb907cf35 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1800-aadc820a10ab50bd57179c0feb238bedde6a9d3b: aadc820a10ab50bd57179c0feb238bedde6a9d3b

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11604/index.html

--===============4717715855317000267==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_gt_freq: Add a wait after gt reset (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/136675/">https://patchwork.freedesktop.org/series/136675/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11604/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11604/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7980_BAT -&gt; XEIGTPW_11604_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11604_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_psr@psr-cursor-plane-move@edp-1:<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7980/bat-lnl-1/igt@kms_psr@psr-cursor-plane-move@edp-1.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11604/bat-lnl-1/igt@kms_psr@psr-cursor-plane-move@edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7980 -&gt; IGTPW_11604</li>
</ul>
<p>IGTPW_11604: 2e4a4ce94975c4ffc557fac2c1fbebb78763a21d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7980: 76c81cac2f5108ebc2e7a82ea627aeffb907cf35 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1800-aadc820a10ab50bd57179c0feb238bedde6a9d3b: aadc820a10ab50bd57179c0feb238bedde6a9d3b</p>

</body>
</html>

--===============4717715855317000267==--
