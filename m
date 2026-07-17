Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70990C4451B
	for <igt-dev@archiver.kernel.org>; Fri, 17 Jul 2026 14:57:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D50D10F5A0;
	Fri, 17 Jul 2026 14:57:03 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0720F10F5A0;
 Fri, 17 Jul 2026 14:56:33 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1184561163920123346=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_tests/sriov=5Fbasic=3A_Va?=
 =?utf-8?q?lidate_PF_unbind_with_VFs_enabled?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lukasz Laguna" <lukasz.laguna@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 17 Jul 2026 14:56:33 -0000
Message-ID: <178430019302.202172.2636898914716646177@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260717134406.2627519-1-lukasz.laguna@intel.com>
In-Reply-To: <20260717134406.2627519-1-lukasz.laguna@intel.com>
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

--===============1184561163920123346==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/sriov_basic: Validate PF unbind with VFs enabled
URL   : https://patchwork.freedesktop.org/series/170644/
State : success

== Summary ==

CI Bug Log - changes from IGT_9013 -> IGTPW_15556
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15556/index.html

Participating hosts (42 -> 40)
------------------------------

  Missing    (2): bat-dg2-13 fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_15556 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@i915_module_load@reload:
    - fi-kbl-7567u:       [DMESG-WARN][1] -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9013/fi-kbl-7567u/igt@i915_module_load@reload.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15556/fi-kbl-7567u/igt@i915_module_load@reload.html

  


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9013 -> IGTPW_15556

  CI-20190529: 20190529
  CI_DRM_18842: 22852552aa1b7198931842ddf824af4dd09e2814 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15556: 12e7531b951786957427c98e567dc74944ac5aa4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9013: 10626f13bd71fd21fcbc0421404252766fcfecaf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15556/index.html

--===============1184561163920123346==
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
<tr><td><b>Series:</b></td><td>tests/sriov_basic: Validate PF unbind with VFs enabled</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/170644/">https://patchwork.freedesktop.org/series/170644/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15556/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15556/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_9013 -&gt; IGTPW_15556</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15556/index.html</p>
<h2>Participating hosts (42 -&gt; 40)</h2>
<p>Missing    (2): bat-dg2-13 fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_15556 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_module_load@reload:<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9013/fi-kbl-7567u/igt@i915_module_load@reload.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15556/fi-kbl-7567u/igt@i915_module_load@reload.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9013 -&gt; IGTPW_15556</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18842: 22852552aa1b7198931842ddf824af4dd09e2814 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15556: 12e7531b951786957427c98e567dc74944ac5aa4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9013: 10626f13bd71fd21fcbc0421404252766fcfecaf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============1184561163920123346==--
