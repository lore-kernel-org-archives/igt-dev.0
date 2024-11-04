Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC582D1BDE5
	for <igt-dev@archiver.kernel.org>; Mon,  4 Nov 2024 19:05:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6800610E4B6;
	Mon,  4 Nov 2024 19:05:34 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FC2810E3F7;
 Mon,  4 Nov 2024 19:05:33 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8968463581384471096=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBAT=3A_failure_for_lib/amdgpu=5Fpci=5Funplug?=
 =?utf-8?q?=3A_fix_bo_mapping_to_CPU?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: vitaly.prosyak@amd.com
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 04 Nov 2024 19:05:33 -0000
Message-ID: <173074713358.1408486.2607387145725785861@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241104035653.146383-1-vitaly.prosyak@amd.com>
In-Reply-To: <20241104035653.146383-1-vitaly.prosyak@amd.com>
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

--===============8968463581384471096==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/amdgpu_pci_unplug: fix bo mapping to CPU
URL   : https://patchwork.freedesktop.org/series/140852/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8094 -> IGTPW_12023
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12023 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12023, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12023/index.html

Participating hosts (45 -> 1)
------------------------------

  ERROR: It appears as if the changes made in IGTPW_12023 prevented too many machines from booting.

  Missing    (44): bat-adlp-6 fi-snb-2520m bat-atsm-1 fi-pnv-d510 fi-blb-e6850 bat-arls-1 bat-arls-2 fi-skl-6600u bat-dg2-8 bat-adlm-1 bat-dg2-9 fi-ilk-650 fi-hsw-4770 fi-ivb-3770 bat-rpls-4 fi-elk-e7500 bat-jsl-3 bat-rplp-1 bat-apl-1 bat-dg2-11 bat-twl-1 fi-bsw-nick bat-arlh-2 bat-twl-2 fi-kbl-7567u bat-dg1-7 bat-kbl-2 bat-arlh-3 bat-adlp-9 fi-cfl-8700k fi-glk-j4005 bat-dg1-6 bat-jsl-1 bat-mtlp-6 bat-mtlp-8 bat-adlp-11 fi-tgl-1115g4 fi-cfl-guc fi-kbl-guc fi-kbl-x1275 fi-cfl-8109u fi-kbl-8809g bat-dg2-14 bat-dg2-13 


Changes
-------

  No changes found


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8094 -> IGTPW_12023

  CI-20190529: 20190529
  CI_DRM_15627: 0a6cc4357ae4d824f909468ca1deed28ae5ac96f @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12023: a88bf191dcb28ca6b0cec89681d1ddc5f8f9d460 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8094: 19b8958a209f1ea14a3ae06b31d76179fed5733a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12023/index.html

--===============8968463581384471096==
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
<tr><td><b>Series:</b></td><td>lib/amdgpu_pci_unplug: fix bo mapping to CPU</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/140852/">https://patchwork.freedesktop.org/series/140852/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12023/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12023/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8094 -&gt; IGTPW_12023</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_12023 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_12023, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12023/index.html</p>
<h2>Participating hosts (45 -&gt; 1)</h2>
<p>ERROR: It appears as if the changes made in IGTPW_12023 prevented too many machines from booting.</p>
<p>Missing    (44): bat-adlp-6 fi-snb-2520m bat-atsm-1 fi-pnv-d510 fi-blb-e6850 bat-arls-1 bat-arls-2 fi-skl-6600u bat-dg2-8 bat-adlm-1 bat-dg2-9 fi-ilk-650 fi-hsw-4770 fi-ivb-3770 bat-rpls-4 fi-elk-e7500 bat-jsl-3 bat-rplp-1 bat-apl-1 bat-dg2-11 bat-twl-1 fi-bsw-nick bat-arlh-2 bat-twl-2 fi-kbl-7567u bat-dg1-7 bat-kbl-2 bat-arlh-3 bat-adlp-9 fi-cfl-8700k fi-glk-j4005 bat-dg1-6 bat-jsl-1 bat-mtlp-6 bat-mtlp-8 bat-adlp-11 fi-tgl-1115g4 fi-cfl-guc fi-kbl-guc fi-kbl-x1275 fi-cfl-8109u fi-kbl-8809g bat-dg2-14 bat-dg2-13 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8094 -&gt; IGTPW_12023</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_15627: 0a6cc4357ae4d824f909468ca1deed28ae5ac96f @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_12023: a88bf191dcb28ca6b0cec89681d1ddc5f8f9d460 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8094: 19b8958a209f1ea14a3ae06b31d76179fed5733a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============8968463581384471096==--
