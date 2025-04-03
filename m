Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8839C3601A
	for <igt-dev@archiver.kernel.org>; Thu,  3 Apr 2025 15:05:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AF8D10E250;
	Thu,  3 Apr 2025 15:05:36 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D17A10E250;
 Thu,  3 Apr 2025 15:05:35 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2323929313331820273=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_Fix_display=5Fmode_test_for?=
 =?utf-8?q?_joiner_output?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jeevan B" <jeevan.b@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 03 Apr 2025 15:05:35 -0000
Message-ID: <174369273524.33519.17156928106705520377@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250403104149.2033579-1-jeevan.b@intel.com>
In-Reply-To: <20250403104149.2033579-1-jeevan.b@intel.com>
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

--===============2323929313331820273==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Fix display_mode test for joiner output
URL   : https://patchwork.freedesktop.org/series/147204/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8303_BAT -> XEIGTPW_12913_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_12913_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_12913_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_12913_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:
    - bat-dg2-oem2:       [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8303/bat-dg2-oem2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12913/bat-dg2-oem2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_12913_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_pat@pat-index-xelp@render:
    - bat-adlp-vf:        NOTRUN -> [ABORT][3] ([Intel XE#3970]) +1 other test abort
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12913/bat-adlp-vf/igt@xe_pat@pat-index-xelp@render.html

  
#### Possible fixes ####

  * igt@xe_vm@shared-pte-page:
    - bat-adlp-vf:        [ABORT][4] ([Intel XE#3970]) -> [PASS][5]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8303/bat-adlp-vf/igt@xe_vm@shared-pte-page.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12913/bat-adlp-vf/igt@xe_vm@shared-pte-page.html

  
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970


Build changes
-------------

  * IGT: IGT_8303 -> IGTPW_12913

  IGTPW_12913: 6f5ac15f707cdfb740a03e5147daace020590337 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8303: 4030608e18806243e34ecd3b0b64494fc7d2f9fd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2901-71dac8dae6cc024b633bd6e584f4195c44c0dbc7: 71dac8dae6cc024b633bd6e584f4195c44c0dbc7

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12913/index.html

--===============2323929313331820273==
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
<tr><td><b>Series:</b></td><td>Fix display_mode test for joiner output</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/147204/">https://patchwork.freedesktop.org/series/147204/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12913/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12913/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8303_BAT -&gt; XEIGTPW_12913_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_12913_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_12913_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_12913_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8303/bat-dg2-oem2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12913/bat-dg2-oem2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12913_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_pat@pat-index-xelp@render:<ul>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12913/bat-adlp-vf/igt@xe_pat@pat-index-xelp@render.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a>) +1 other test abort</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_vm@shared-pte-page:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8303/bat-adlp-vf/igt@xe_vm@shared-pte-page.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12913/bat-adlp-vf/igt@xe_vm@shared-pte-page.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8303 -&gt; IGTPW_12913</li>
</ul>
<p>IGTPW_12913: 6f5ac15f707cdfb740a03e5147daace020590337 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8303: 4030608e18806243e34ecd3b0b64494fc7d2f9fd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2901-71dac8dae6cc024b633bd6e584f4195c44c0dbc7: 71dac8dae6cc024b633bd6e584f4195c44c0dbc7</p>

</body>
</html>

--===============2323929313331820273==--
