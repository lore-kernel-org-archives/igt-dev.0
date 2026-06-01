Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73807CD5BD1
	for <igt-dev@archiver.kernel.org>; Mon,  1 Jun 2026 13:27:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEB1010E7C3;
	Mon,  1 Jun 2026 13:27:17 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC60710E7C3;
 Mon,  1 Jun 2026 13:26:57 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2494147301321048683=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_Add_attachments_support_?=
 =?utf-8?q?=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 01 Jun 2026 13:26:57 -0000
Message-ID: <178032041789.30505.6128715031353832952@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260601075143.187633-6-zbigniew.kempczynski@intel.com>
In-Reply-To: <20260601075143.187633-6-zbigniew.kempczynski@intel.com>
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

--===============2494147301321048683==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add attachments support (rev3)
URL   : https://patchwork.freedesktop.org/series/165230/
State : success

== Summary ==

CI Bug Log - changes from IGT_8943 -> IGTPW_15276
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15276/index.html

Participating hosts (42 -> 39)
------------------------------

  Missing    (3): fi-hsw-4770 fi-snb-2520m bat-dg2-13 

Known issues
------------

  Here are the changes found in IGTPW_15276 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@i915_selftest@live:
    - bat-apl-1:          [DMESG-FAIL][1] ([i915#14808]) -> [PASS][2] +1 other test pass
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8943/bat-apl-1/igt@i915_selftest@live.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15276/bat-apl-1/igt@i915_selftest@live.html

  
  [i915#14808]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14808


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8943 -> IGTPW_15276
  * Linux: CI_DRM_18580 -> CI_DRM_18595

  CI-20190529: 20190529
  CI_DRM_18580: 0b693fa10a961c6e08ade3a6f41069b18baf2a63 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_18595: 8133a9f4c4fd407e81df71530490836a1170bb2f @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15276: ba33fc53234676e1dd0014d57095b0f052a53d9d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8943: 8943

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15276/index.html

--===============2494147301321048683==
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
<tr><td><b>Series:</b></td><td>Add attachments support (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/165230/">https://patchwork.freedesktop.org/series/165230/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15276/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15276/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8943 -&gt; IGTPW_15276</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15276/index.html</p>
<h2>Participating hosts (42 -&gt; 39)</h2>
<p>Missing    (3): fi-hsw-4770 fi-snb-2520m bat-dg2-13 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_15276 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live:<ul>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8943/bat-apl-1/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14808">i915#14808</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15276/bat-apl-1/igt@i915_selftest@live.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8943 -&gt; IGTPW_15276</li>
<li>Linux: CI_DRM_18580 -&gt; CI_DRM_18595</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18580: 0b693fa10a961c6e08ade3a6f41069b18baf2a63 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_18595: 8133a9f4c4fd407e81df71530490836a1170bb2f @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15276: ba33fc53234676e1dd0014d57095b0f052a53d9d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8943: 8943</p>

</body>
</html>

--===============2494147301321048683==--
