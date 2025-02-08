Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66ECFC0219E
	for <igt-dev@archiver.kernel.org>; Sat,  8 Feb 2025 01:24:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0314610EBB5;
	Sat,  8 Feb 2025 01:24:51 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8E7F10EBB5;
 Sat,  8 Feb 2025 01:22:46 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0960683627136896567=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_Verify_VF_configuration_dat?=
 =?utf-8?q?a_against_provisioned_values_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lukasz Laguna" <lukasz.laguna@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sat, 08 Feb 2025 01:22:46 -0000
Message-ID: <173897776666.2953281.15920095996250356349@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250207094031.15942-1-lukasz.laguna@intel.com>
In-Reply-To: <20250207094031.15942-1-lukasz.laguna@intel.com>
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

--===============0960683627136896567==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Verify VF configuration data against provisioned values (rev2)
URL   : https://patchwork.freedesktop.org/series/143918/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8227_BAT -> XEIGTPW_12561_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_12561_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_12561_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_12561_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_live_ktest@xe_migrate:
    - bat-adlp-vf:        [PASS][1] -> [DMESG-FAIL][2] +1 other test dmesg-fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8227/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12561/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html

  


Build changes
-------------

  * IGT: IGT_8227 -> IGTPW_12561
  * Linux: xe-2620-e886a5edb53ade13f69b5809cbe03d7aa73885a7 -> xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085

  IGTPW_12561: 6911e6d889026bffd48219d003881d1662292bbc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8227: 8227
  xe-2620-e886a5edb53ade13f69b5809cbe03d7aa73885a7: e886a5edb53ade13f69b5809cbe03d7aa73885a7
  xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085: 4f934139887fd60bd4ac9027b7eec3e86ade8085

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12561/index.html

--===============0960683627136896567==
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
<tr><td><b>Series:</b></td><td>Verify VF configuration data against provisioned values (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/143918/">https://patchwork.freedesktop.org/series/143918/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12561/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12561/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8227_BAT -&gt; XEIGTPW_12561_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_12561_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_12561_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_12561_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_live_ktest@xe_migrate:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8227/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12561/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html">DMESG-FAIL</a> +1 other test dmesg-fail</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8227 -&gt; IGTPW_12561</li>
<li>Linux: xe-2620-e886a5edb53ade13f69b5809cbe03d7aa73885a7 -&gt; xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085</li>
</ul>
<p>IGTPW_12561: 6911e6d889026bffd48219d003881d1662292bbc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8227: 8227<br />
  xe-2620-e886a5edb53ade13f69b5809cbe03d7aa73885a7: e886a5edb53ade13f69b5809cbe03d7aa73885a7<br />
  xe-2621-4f934139887fd60bd4ac9027b7eec3e86ade8085: 4f934139887fd60bd4ac9027b7eec3e86ade8085</p>

</body>
</html>

--===============0960683627136896567==--
