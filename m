Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 930DCE95363
	for <igt-dev@archiver.kernel.org>; Wed,  4 Feb 2026 09:46:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3532910E5B3;
	Wed,  4 Feb 2026 09:46:51 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EC8510E5AF;
 Wed,  4 Feb 2026 09:46:50 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4937480188452791237=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_tests/kms=5Fplane=3A_Refi?=
 =?utf-8?q?ne_clamping_and_modifier_skips?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Pranay Samala" <pranay.samala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 04 Feb 2026 09:46:50 -0000
Message-ID: <177019841065.223013.11336437689234831941@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260204083913.1048566-1-pranay.samala@intel.com>
In-Reply-To: <20260204083913.1048566-1-pranay.samala@intel.com>
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

--===============4937480188452791237==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_plane: Refine clamping and modifier skips
URL   : https://patchwork.freedesktop.org/series/161133/
State : success

== Summary ==

CI Bug Log - changes from IGT_8732 -> IGTPW_14486
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14486/index.html

Participating hosts (43 -> 40)
------------------------------

  Missing    (3): bat-dg2-13 bat-atsm-1 fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_14486 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@i915_selftest@live:
    - bat-jsl-1:          [DMESG-FAIL][1] ([i915#15394]) -> [PASS][2] +1 other test pass
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8732/bat-jsl-1/igt@i915_selftest@live.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14486/bat-jsl-1/igt@i915_selftest@live.html

  
  [i915#15394]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15394


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8732 -> IGTPW_14486
  * Linux: CI_DRM_17928 -> CI_DRM_17930

  CI-20190529: 20190529
  CI_DRM_17928: ff449f153b0966cfd7a7291670c927f6b6971d2a @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_17930: 241994730989320c926da9f2d0a5ec80b48f993d @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_14486: 14486
  IGT_8732: 020b7f0da24d0772e73338791288901d717d95f2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14486/index.html

--===============4937480188452791237==
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
<tr><td><b>Series:</b></td><td>tests/kms_plane: Refine clamping and modifier skips</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/161133/">https://patchwork.freedesktop.org/series/161133/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14486/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14486/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8732 -&gt; IGTPW_14486</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14486/index.html</p>
<h2>Participating hosts (43 -&gt; 40)</h2>
<p>Missing    (3): bat-dg2-13 bat-atsm-1 fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_14486 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live:<ul>
<li>bat-jsl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8732/bat-jsl-1/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15394">i915#15394</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14486/bat-jsl-1/igt@i915_selftest@live.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8732 -&gt; IGTPW_14486</li>
<li>Linux: CI_DRM_17928 -&gt; CI_DRM_17930</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_17928: ff449f153b0966cfd7a7291670c927f6b6971d2a @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_17930: 241994730989320c926da9f2d0a5ec80b48f993d @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_14486: 14486<br />
  IGT_8732: 020b7f0da24d0772e73338791288901d717d95f2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============4937480188452791237==--
