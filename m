Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B04FECD343F
	for <igt-dev@archiver.kernel.org>; Wed, 13 May 2026 00:11:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AA2310E027;
	Wed, 13 May 2026 00:11:13 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F3F810E027;
 Wed, 13 May 2026 00:10:57 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3963703859526334753=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_lib/kms=3A_Clean_up_format+?=
 =?utf-8?q?mod_stuff?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 13 May 2026 00:10:57 -0000
Message-ID: <177863105738.64915.16332115378683835815@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260512122143.11013-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20260512122143.11013-1-ville.syrjala@linux.intel.com>
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

--===============3963703859526334753==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/kms: Clean up format+mod stuff
URL   : https://patchwork.freedesktop.org/series/166415/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8907_BAT -> XEIGTPW_15165_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_15165_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_15165_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_15165_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_addfb_basic@addfb25-4-tiled:
    - bat-wcl-1:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8907/bat-wcl-1/igt@kms_addfb_basic@addfb25-4-tiled.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15165/bat-wcl-1/igt@kms_addfb_basic@addfb25-4-tiled.html
    - bat-ptl-1:          [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8907/bat-ptl-1/igt@kms_addfb_basic@addfb25-4-tiled.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15165/bat-ptl-1/igt@kms_addfb_basic@addfb25-4-tiled.html
    - bat-lnl-1:          [PASS][5] -> [FAIL][6] +1 other test fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8907/bat-lnl-1/igt@kms_addfb_basic@addfb25-4-tiled.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15165/bat-lnl-1/igt@kms_addfb_basic@addfb25-4-tiled.html
    - bat-ptl-2:          [PASS][7] -> [FAIL][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8907/bat-ptl-2/igt@kms_addfb_basic@addfb25-4-tiled.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15165/bat-ptl-2/igt@kms_addfb_basic@addfb25-4-tiled.html
    - bat-wcl-2:          [PASS][9] -> [FAIL][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8907/bat-wcl-2/igt@kms_addfb_basic@addfb25-4-tiled.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15165/bat-wcl-2/igt@kms_addfb_basic@addfb25-4-tiled.html

  * igt@kms_addfb_basic@addfb25-x-tiled-legacy:
    - bat-bmg-2:          [PASS][11] -> [FAIL][12] +1 other test fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8907/bat-bmg-2/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15165/bat-bmg-2/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html
    - bat-adlp-7:         [PASS][13] -> [FAIL][14] +1 other test fail
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8907/bat-adlp-7/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15165/bat-adlp-7/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html
    - bat-lnl-2:          [PASS][15] -> [FAIL][16] +1 other test fail
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8907/bat-lnl-2/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15165/bat-lnl-2/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html
    - bat-bmg-1:          [PASS][17] -> [FAIL][18] +1 other test fail
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8907/bat-bmg-1/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15165/bat-bmg-1/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-adlp-7:         [PASS][19] -> [SKIP][20]
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8907/bat-adlp-7/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15165/bat-adlp-7/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  


Build changes
-------------

  * IGT: IGT_8907 -> IGTPW_15165
  * Linux: xe-5050-9cb559e83f7f3c02c8c6566d3446cd37ecc56e86 -> xe-5051-45be122deb2eaa1280d6496153c7661438ab8cdf

  IGTPW_15165: 8a5f70a8bb58bc0f7c83d44fdc65890ad56d03b8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8907: 6b305d78c65768c09cc7c0e902273bf409bbd218 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5050-9cb559e83f7f3c02c8c6566d3446cd37ecc56e86: 9cb559e83f7f3c02c8c6566d3446cd37ecc56e86
  xe-5051-45be122deb2eaa1280d6496153c7661438ab8cdf: 45be122deb2eaa1280d6496153c7661438ab8cdf

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15165/index.html

--===============3963703859526334753==
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
<tr><td><b>Series:</b></td><td>lib/kms: Clean up format+mod stuff</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/166415/">https://patchwork.freedesktop.org/series/166415/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15165/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15165/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8907_BAT -&gt; XEIGTPW_15165_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_15165_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_15165_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_15165_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-4-tiled:</p>
<ul>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8907/bat-wcl-1/igt@kms_addfb_basic@addfb25-4-tiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15165/bat-wcl-1/igt@kms_addfb_basic@addfb25-4-tiled.html">FAIL</a></li>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8907/bat-ptl-1/igt@kms_addfb_basic@addfb25-4-tiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15165/bat-ptl-1/igt@kms_addfb_basic@addfb25-4-tiled.html">FAIL</a></li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8907/bat-lnl-1/igt@kms_addfb_basic@addfb25-4-tiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15165/bat-lnl-1/igt@kms_addfb_basic@addfb25-4-tiled.html">FAIL</a> +1 other test fail</li>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8907/bat-ptl-2/igt@kms_addfb_basic@addfb25-4-tiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15165/bat-ptl-2/igt@kms_addfb_basic@addfb25-4-tiled.html">FAIL</a></li>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8907/bat-wcl-2/igt@kms_addfb_basic@addfb25-4-tiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15165/bat-wcl-2/igt@kms_addfb_basic@addfb25-4-tiled.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-x-tiled-legacy:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8907/bat-bmg-2/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15165/bat-bmg-2/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html">FAIL</a> +1 other test fail</li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8907/bat-adlp-7/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15165/bat-adlp-7/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html">FAIL</a> +1 other test fail</li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8907/bat-lnl-2/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15165/bat-lnl-2/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html">FAIL</a> +1 other test fail</li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8907/bat-bmg-1/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15165/bat-bmg-1/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8907/bat-adlp-7/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15165/bat-adlp-7/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8907 -&gt; IGTPW_15165</li>
<li>Linux: xe-5050-9cb559e83f7f3c02c8c6566d3446cd37ecc56e86 -&gt; xe-5051-45be122deb2eaa1280d6496153c7661438ab8cdf</li>
</ul>
<p>IGTPW_15165: 8a5f70a8bb58bc0f7c83d44fdc65890ad56d03b8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8907: 6b305d78c65768c09cc7c0e902273bf409bbd218 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5050-9cb559e83f7f3c02c8c6566d3446cd37ecc56e86: 9cb559e83f7f3c02c8c6566d3446cd37ecc56e86<br />
  xe-5051-45be122deb2eaa1280d6496153c7661438ab8cdf: 45be122deb2eaa1280d6496153c7661438ab8cdf</p>

</body>
</html>

--===============3963703859526334753==--
