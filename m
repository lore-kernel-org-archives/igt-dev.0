Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F33CAC3DA64
	for <igt-dev@archiver.kernel.org>; Thu,  1 Aug 2024 08:18:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0D0D10E35B;
	Thu,  1 Aug 2024 08:18:10 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5E5610E314;
 Thu,  1 Aug 2024 08:18:09 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6881079390661909584=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_Apply_igt=2Ecocci_transform?=
 =?utf-8?q?s?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 01 Aug 2024 08:18:09 -0000
Message-ID: <172250028993.486669.5441191538968350565@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240801062602.2047179-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20240801062602.2047179-1-bhanuprakash.modem@intel.com>
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

--===============6881079390661909584==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Apply igt.cocci transforms
URL   : https://patchwork.freedesktop.org/series/136780/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_15166 -> IGTPW_11510
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11510/index.html

Participating hosts (37 -> 34)
------------------------------

  Missing    (3): fi-kbl-8809g bat-arls-1 bat-mtlp-6 

Known issues
------------

  Here are the changes found in IGTPW_11510 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@i915_selftest@live@gt_lrc:
    - bat-twl-2:          [INCOMPLETE][1] ([i915#9413]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15166/bat-twl-2/igt@i915_selftest@live@gt_lrc.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11510/bat-twl-2/igt@i915_selftest@live@gt_lrc.html

  
  [i915#9413]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9413


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7950 -> IGTPW_11510

  CI-20190529: 20190529
  CI_DRM_15166: f7c42ff589036adba187524259c726f75bec916a @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_11510: 11510
  IGT_7950: 7950

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11510/index.html

--===============6881079390661909584==
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
<tr><td><b>Series:</b></td><td>Apply igt.cocci transforms</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/136780/">https://patchwork.freedesktop.org/series/136780/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11510/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11510/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_15166 -&gt; IGTPW_11510</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11510/index.html</p>
<h2>Participating hosts (37 -&gt; 34)</h2>
<p>Missing    (3): fi-kbl-8809g bat-arls-1 bat-mtlp-6 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11510 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live@gt_lrc:<ul>
<li>bat-twl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15166/bat-twl-2/igt@i915_selftest@live@gt_lrc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9413">i915#9413</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11510/bat-twl-2/igt@i915_selftest@live@gt_lrc.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7950 -&gt; IGTPW_11510</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_15166: f7c42ff589036adba187524259c726f75bec916a @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_11510: 11510<br />
  IGT_7950: 7950</p>

</body>
</html>

--===============6881079390661909584==--
