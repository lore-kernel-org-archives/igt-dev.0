Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F2EE1093190
	for <igt-dev@archiver.kernel.org>; Fri, 20 Mar 2026 09:10:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8CA410E4B8;
	Fri, 20 Mar 2026 09:10:51 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48CCF10E4B8;
 Fri, 20 Mar 2026 09:10:47 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1281555906213665008=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_tests/kms=5Fcolor=3A_Add_?=
 =?utf-8?q?10-bit_color_depth_support_to_gamma_test_for_MediaTek?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jay Liu" <jay.liu@mediatek.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 20 Mar 2026 09:10:47 -0000
Message-ID: <177399784727.379015.11326769438187810666@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260320073409.17337-1-jay.liu@mediatek.com>
In-Reply-To: <20260320073409.17337-1-jay.liu@mediatek.com>
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

--===============1281555906213665008==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_color: Add 10-bit color depth support to gamma test for MediaTek
URL   : https://patchwork.freedesktop.org/series/163563/
State : success

== Summary ==

CI Bug Log - changes from IGT_8813 -> IGTPW_14818
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14818/index.html

Participating hosts (42 -> 39)
------------------------------

  Missing    (3): bat-dg2-13 fi-snb-2520m bat-adls-6 

Known issues
------------

  Here are the changes found in IGTPW_14818 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@guc_multi_lrc:
    - fi-kbl-7567u:       [PASS][1] -> [DMESG-WARN][2] ([i915#13735]) +8 other tests dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8813/fi-kbl-7567u/igt@i915_selftest@live@guc_multi_lrc.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14818/fi-kbl-7567u/igt@i915_selftest@live@guc_multi_lrc.html

  
#### Warnings ####

  * igt@kms_pm_backlight@basic-brightness:
    - bat-arlh-2:         [SKIP][3] ([i915#11346]) -> [SKIP][4] ([i915#11346] / [i915#15860])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8813/bat-arlh-2/igt@kms_pm_backlight@basic-brightness.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14818/bat-arlh-2/igt@kms_pm_backlight@basic-brightness.html

  
  [i915#11346]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346
  [i915#13735]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735
  [i915#15860]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15860


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8813 -> IGTPW_14818

  CI-20190529: 20190529
  CI_DRM_18178: 4ae9f18564e78a5447be68aa1e9232a4f2c37b5a @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_14818: 8857df80b5494f86a7beaaaa088343fd2e12e7d3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8813: 89e32100ca0e4ca343dd32408dacf1e879e8ed02 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14818/index.html

--===============1281555906213665008==
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
<tr><td><b>Series:</b></td><td>tests/kms_color: Add 10-bit color depth support to gamma test for MediaTek</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/163563/">https://patchwork.freedesktop.org/series/163563/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14818/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14818/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8813 -&gt; IGTPW_14818</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14818/index.html</p>
<h2>Participating hosts (42 -&gt; 39)</h2>
<p>Missing    (3): bat-dg2-13 fi-snb-2520m bat-adls-6 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_14818 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@i915_selftest@live@guc_multi_lrc:<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8813/fi-kbl-7567u/igt@i915_selftest@live@guc_multi_lrc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14818/fi-kbl-7567u/igt@i915_selftest@live@guc_multi_lrc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735">i915#13735</a>) +8 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_pm_backlight@basic-brightness:<ul>
<li>bat-arlh-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8813/bat-arlh-2/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14818/bat-arlh-2/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15860">i915#15860</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8813 -&gt; IGTPW_14818</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18178: 4ae9f18564e78a5447be68aa1e9232a4f2c37b5a @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_14818: 8857df80b5494f86a7beaaaa088343fd2e12e7d3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8813: 89e32100ca0e4ca343dd32408dacf1e879e8ed02 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============1281555906213665008==--
