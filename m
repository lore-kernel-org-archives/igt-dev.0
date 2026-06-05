Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E0D4CD6E7B
	for <igt-dev@archiver.kernel.org>; Fri,  5 Jun 2026 19:16:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBF5F11AAC0;
	Fri,  5 Jun 2026 19:16:50 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32CBF11AABF;
 Fri,  5 Jun 2026 19:16:29 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5003710140824029921=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_extend_GT_reset_stress_cove?=
 =?utf-8?q?rage?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sharma, Nishit" <nishit.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 05 Jun 2026 19:16:29 -0000
Message-ID: <178068698920.49698.5705931227194208619@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260605143953.1122688-1-nishit.sharma@intel.com>
In-Reply-To: <20260605143953.1122688-1-nishit.sharma@intel.com>
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

--===============5003710140824029921==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: extend GT reset stress coverage
URL   : https://patchwork.freedesktop.org/series/167962/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8950_BAT -> XEIGTPW_15311_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_15311_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_15311_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_15311_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_force_connector_basic@prune-stale-modes:
    - bat-ptl-2:          [PASS][1] -> [SKIP][2] +3 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8950/bat-ptl-2/igt@kms_force_connector_basic@prune-stale-modes.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15311/bat-ptl-2/igt@kms_force_connector_basic@prune-stale-modes.html

  


Build changes
-------------

  * IGT: IGT_8950 -> IGTPW_15311
  * Linux: xe-5209-6be5b7e4d84efd8d8d3fbf91fcacbcb6a0df055c -> xe-5213-0ecb0a41cb32dfc7620a903629a6951ef1aaea52

  IGTPW_15311: 09eddb449aac8bd4f0ce3bbcc584fc1bb2b34719 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8950: 8950
  xe-5209-6be5b7e4d84efd8d8d3fbf91fcacbcb6a0df055c: 6be5b7e4d84efd8d8d3fbf91fcacbcb6a0df055c
  xe-5213-0ecb0a41cb32dfc7620a903629a6951ef1aaea52: 0ecb0a41cb32dfc7620a903629a6951ef1aaea52

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15311/index.html

--===============5003710140824029921==
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
<tr><td><b>Series:</b></td><td>extend GT reset stress coverage</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/167962/">https://patchwork.freedesktop.org/series/167962/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15311/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15311/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8950_BAT -&gt; XEIGTPW_15311_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_15311_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_15311_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_15311_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_force_connector_basic@prune-stale-modes:<ul>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8950/bat-ptl-2/igt@kms_force_connector_basic@prune-stale-modes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15311/bat-ptl-2/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8950 -&gt; IGTPW_15311</li>
<li>Linux: xe-5209-6be5b7e4d84efd8d8d3fbf91fcacbcb6a0df055c -&gt; xe-5213-0ecb0a41cb32dfc7620a903629a6951ef1aaea52</li>
</ul>
<p>IGTPW_15311: 09eddb449aac8bd4f0ce3bbcc584fc1bb2b34719 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8950: 8950<br />
  xe-5209-6be5b7e4d84efd8d8d3fbf91fcacbcb6a0df055c: 6be5b7e4d84efd8d8d3fbf91fcacbcb6a0df055c<br />
  xe-5213-0ecb0a41cb32dfc7620a903629a6951ef1aaea52: 0ecb0a41cb32dfc7620a903629a6951ef1aaea52</p>

</body>
</html>

--===============5003710140824029921==--
