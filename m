Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB473CD5BC9
	for <igt-dev@archiver.kernel.org>; Wed, 27 May 2026 23:40:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6201810E0D9;
	Wed, 27 May 2026 23:40:53 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E5A710E0D9;
 Wed, 27 May 2026 23:40:33 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3764568827425857331=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_tests/kms=5Fcolorop=3A_As?=
 =?utf-8?q?sorted_fixes_and_support_for_i915/Xe_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "John Harrison" <john.harrison@igalia.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 27 May 2026 23:40:33 -0000
Message-ID: <177992523324.18056.15970639131963694383@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260527193612.651624-1-John.Harrison@Igalia.com>
In-Reply-To: <20260527193612.651624-1-John.Harrison@Igalia.com>
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

--===============3764568827425857331==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_colorop: Assorted fixes and support for i915/Xe (rev2)
URL   : https://patchwork.freedesktop.org/series/167234/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8939 -> IGTPW_15264
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_15264 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_15264, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15264/index.html

Participating hosts (41 -> 8)
------------------------------

  ERROR: It appears as if the changes made in IGTPW_15264 prevented too many machines from booting.

  Missing    (33): fi-rkl-11600 bat-adlp-6 fi-snb-2520m fi-pnv-d510 fi-skl-6600u bat-mtlp-9 fi-bsw-n3050 bat-dg2-8 bat-dg2-9 fi-ilk-650 fi-hsw-4770 bat-atsm-1 fi-ivb-3770 fi-elk-e7500 bat-rplp-1 bat-rpls-4 bat-twl-1 bat-arls-5 fi-bsw-nick bat-arlh-2 bat-twl-2 bat-dg1-7 bat-arlh-3 bat-adlp-9 fi-cfl-8700k bat-dg1-6 bat-arls-6 bat-mtlp-8 bat-adlp-11 fi-cfl-guc fi-kbl-x1275 bat-dg2-14 bat-dg2-13 


Changes
-------

  No changes found


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8939 -> IGTPW_15264
  * Linux: CI_DRM_18562 -> CI_DRM_18563

  CI-20190529: 20190529
  CI_DRM_18562: 11a8456527f00d86dc8b23035c324da194fbbadb @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_18563: 7570b524ddecbe5db4af0c493a047e21bab6b3d6 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15264: 15264
  IGT_8939: 8939

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15264/index.html

--===============3764568827425857331==
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
<tr><td><b>Series:</b></td><td>tests/kms_colorop: Assorted fixes and support for i915/Xe (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/167234/">https://patchwork.freedesktop.org/series/167234/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15264/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15264/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8939 -&gt; IGTPW_15264</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_15264 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_15264, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15264/index.html</p>
<h2>Participating hosts (41 -&gt; 8)</h2>
<p>ERROR: It appears as if the changes made in IGTPW_15264 prevented too many machines from booting.</p>
<p>Missing    (33): fi-rkl-11600 bat-adlp-6 fi-snb-2520m fi-pnv-d510 fi-skl-6600u bat-mtlp-9 fi-bsw-n3050 bat-dg2-8 bat-dg2-9 fi-ilk-650 fi-hsw-4770 bat-atsm-1 fi-ivb-3770 fi-elk-e7500 bat-rplp-1 bat-rpls-4 bat-twl-1 bat-arls-5 fi-bsw-nick bat-arlh-2 bat-twl-2 bat-dg1-7 bat-arlh-3 bat-adlp-9 fi-cfl-8700k bat-dg1-6 bat-arls-6 bat-mtlp-8 bat-adlp-11 fi-cfl-guc fi-kbl-x1275 bat-dg2-14 bat-dg2-13 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8939 -&gt; IGTPW_15264</li>
<li>Linux: CI_DRM_18562 -&gt; CI_DRM_18563</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18562: 11a8456527f00d86dc8b23035c324da194fbbadb @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_18563: 7570b524ddecbe5db4af0c493a047e21bab6b3d6 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15264: 15264<br />
  IGT_8939: 8939</p>

</body>
</html>

--===============3764568827425857331==--
