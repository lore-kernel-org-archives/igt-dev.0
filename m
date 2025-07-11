Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D3C5C83F1B
	for <igt-dev@archiver.kernel.org>; Fri, 11 Jul 2025 20:01:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE73110E3C7;
	Fri, 11 Jul 2025 20:01:28 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 881A810E3C7;
 Fri, 11 Jul 2025 20:01:27 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4158042206730972916=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/kms=5Fvblank=3A_Skip_?=
 =?utf-8?q?timing_check_in_simulation_to_avoid_false_negatives?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Naladala Ramanaidu" <ramanaidu.naladala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 11 Jul 2025 20:01:27 -0000
Message-ID: <175226408755.155881.1831817722162948167@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250711180740.145938-1-ramanaidu.naladala@intel.com>
In-Reply-To: <20250711180740.145938-1-ramanaidu.naladala@intel.com>
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

--===============4158042206730972916==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_vblank: Skip timing check in simulation to avoid false negatives
URL   : https://patchwork.freedesktop.org/series/151516/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8454_BAT -> XEIGTPW_13456_BAT
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

  Here are the changes found in XEIGTPW_13456_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_pat@pat-index-xe2@render:
    - bat-bmg-2:          [FAIL][1] -> [PASS][2] +1 other test pass
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8454/bat-bmg-2/igt@xe_pat@pat-index-xe2@render.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13456/bat-bmg-2/igt@xe_pat@pat-index-xe2@render.html

  


Build changes
-------------

  * IGT: IGT_8454 -> IGTPW_13456
  * Linux: xe-3399-0384e5b49a7b0bddca4018a6d42472e13ccd8bba -> xe-3402-63c7eef609dde585843b5aa6b8f078c211a556fb

  IGTPW_13456: 9375015cab61c180ca11f79f0fda8002c141f638 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8454: 67f8a0cc3a159bf6f912c08c030dfed5a85af328 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3399-0384e5b49a7b0bddca4018a6d42472e13ccd8bba: 0384e5b49a7b0bddca4018a6d42472e13ccd8bba
  xe-3402-63c7eef609dde585843b5aa6b8f078c211a556fb: 63c7eef609dde585843b5aa6b8f078c211a556fb

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13456/index.html

--===============4158042206730972916==
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
<tr><td><b>Series:</b></td><td>tests/kms_vblank: Skip timing check in simulation to avoid false negatives</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/151516/">https://patchwork.freedesktop.org/series/151516/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13456/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13456/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8454_BAT -&gt; XEIGTPW_13456_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_13456_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_pat@pat-index-xe2@render:<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8454/bat-bmg-2/igt@xe_pat@pat-index-xe2@render.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13456/bat-bmg-2/igt@xe_pat@pat-index-xe2@render.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8454 -&gt; IGTPW_13456</li>
<li>Linux: xe-3399-0384e5b49a7b0bddca4018a6d42472e13ccd8bba -&gt; xe-3402-63c7eef609dde585843b5aa6b8f078c211a556fb</li>
</ul>
<p>IGTPW_13456: 9375015cab61c180ca11f79f0fda8002c141f638 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8454: 67f8a0cc3a159bf6f912c08c030dfed5a85af328 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3399-0384e5b49a7b0bddca4018a6d42472e13ccd8bba: 0384e5b49a7b0bddca4018a6d42472e13ccd8bba<br />
  xe-3402-63c7eef609dde585843b5aa6b8f078c211a556fb: 63c7eef609dde585843b5aa6b8f078c211a556fb</p>

</body>
</html>

--===============4158042206730972916==--
