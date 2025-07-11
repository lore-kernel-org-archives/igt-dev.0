Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26B7DC83F1B
	for <igt-dev@archiver.kernel.org>; Fri, 11 Jul 2025 21:27:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA18210E2E4;
	Fri, 11 Jul 2025 21:27:22 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2672510E2E4;
 Fri, 11 Jul 2025 21:27:22 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3138184876668383645=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel-ci=3A_Add_unsup?=
 =?utf-8?q?ported_downscaling_tests_to_blacklist_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Naladala Ramanaidu" <ramanaidu.naladala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 11 Jul 2025 21:27:22 -0000
Message-ID: <175226924214.155936.12270809279059975376@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250707192209.783141-1-ramanaidu.naladala@intel.com>
In-Reply-To: <20250707192209.783141-1-ramanaidu.naladala@intel.com>
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

--===============3138184876668383645==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel-ci: Add unsupported downscaling tests to blacklist (rev2)
URL   : https://patchwork.freedesktop.org/series/151291/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8454_BAT -> XEIGTPW_13457_BAT
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

  Here are the changes found in XEIGTPW_13457_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_pat@pat-index-xe2@render:
    - bat-bmg-2:          [FAIL][1] -> [PASS][2] +1 other test pass
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8454/bat-bmg-2/igt@xe_pat@pat-index-xe2@render.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13457/bat-bmg-2/igt@xe_pat@pat-index-xe2@render.html

  


Build changes
-------------

  * IGT: IGT_8454 -> IGTPW_13457
  * Linux: xe-3399-0384e5b49a7b0bddca4018a6d42472e13ccd8bba -> xe-3403-9f1c50aa2358b47480008da45c785d88b0b27ba3

  IGTPW_13457: abaa9298784b3ebecd42dc6be42eba9b2b70d76b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8454: 67f8a0cc3a159bf6f912c08c030dfed5a85af328 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3399-0384e5b49a7b0bddca4018a6d42472e13ccd8bba: 0384e5b49a7b0bddca4018a6d42472e13ccd8bba
  xe-3403-9f1c50aa2358b47480008da45c785d88b0b27ba3: 9f1c50aa2358b47480008da45c785d88b0b27ba3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13457/index.html

--===============3138184876668383645==
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
<tr><td><b>Series:</b></td><td>tests/intel-ci: Add unsupported downscaling tests to blacklist (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/151291/">https://patchwork.freedesktop.org/series/151291/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13457/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13457/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8454_BAT -&gt; XEIGTPW_13457_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_13457_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_pat@pat-index-xe2@render:<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8454/bat-bmg-2/igt@xe_pat@pat-index-xe2@render.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13457/bat-bmg-2/igt@xe_pat@pat-index-xe2@render.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8454 -&gt; IGTPW_13457</li>
<li>Linux: xe-3399-0384e5b49a7b0bddca4018a6d42472e13ccd8bba -&gt; xe-3403-9f1c50aa2358b47480008da45c785d88b0b27ba3</li>
</ul>
<p>IGTPW_13457: abaa9298784b3ebecd42dc6be42eba9b2b70d76b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8454: 67f8a0cc3a159bf6f912c08c030dfed5a85af328 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3399-0384e5b49a7b0bddca4018a6d42472e13ccd8bba: 0384e5b49a7b0bddca4018a6d42472e13ccd8bba<br />
  xe-3403-9f1c50aa2358b47480008da45c785d88b0b27ba3: 9f1c50aa2358b47480008da45c785d88b0b27ba3</p>

</body>
</html>

--===============3138184876668383645==--
