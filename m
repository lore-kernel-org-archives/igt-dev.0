Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18663C021B1
	for <igt-dev@archiver.kernel.org>; Thu, 20 Feb 2025 17:48:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDE7D10E4D5;
	Thu, 20 Feb 2025 17:48:29 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C486B10E4D5;
 Thu, 20 Feb 2025 17:48:28 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0231702628497932463=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_tests/xe=5Foa=3A_Skip_whe?=
 =?utf-8?q?n_no_OA_units_available?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Marcin Bernatowicz" <marcin.bernatowicz@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 20 Feb 2025 17:48:28 -0000
Message-ID: <174007370879.248180.16190777558666506730@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250220130105.756157-1-marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20250220130105.756157-1-marcin.bernatowicz@linux.intel.com>
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

--===============0231702628497932463==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/xe_oa: Skip when no OA units available
URL   : https://patchwork.freedesktop.org/series/145174/
State : success

== Summary ==

CI Bug Log - changes from IGT_8244 -> IGTPW_12641
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12641/index.html

Participating hosts (44 -> 42)
------------------------------

  Missing    (2): bat-arlh-2 fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_12641 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@dmabuf@all-tests:
    - fi-pnv-d510:        NOTRUN -> [INCOMPLETE][1] ([i915#12904]) +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12641/fi-pnv-d510/igt@dmabuf@all-tests.html

  * igt@i915_selftest@live:
    - bat-twl-1:          [PASS][2] -> [ABORT][3] ([i915#12919] / [i915#13503])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8244/bat-twl-1/igt@i915_selftest@live.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12641/bat-twl-1/igt@i915_selftest@live.html

  * igt@i915_selftest@live@gt_lrc:
    - bat-twl-1:          [PASS][4] -> [ABORT][5] ([i915#12919])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8244/bat-twl-1/igt@i915_selftest@live@gt_lrc.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12641/bat-twl-1/igt@i915_selftest@live@gt_lrc.html

  
  [i915#12904]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12904
  [i915#12919]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12919
  [i915#13503]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13503


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8244 -> IGTPW_12641

  CI-20190529: 20190529
  CI_DRM_16164: 8554d5b7b4fded481a85ab11d75eeb97443450e2 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12641: 12641
  IGT_8244: 9db9c35186dc599dfa8bc2cee66301d5389dd217 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12641/index.html

--===============0231702628497932463==
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
<tr><td><b>Series:</b></td><td>tests/xe_oa: Skip when no OA units available</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/145174/">https://patchwork.freedesktop.org/series/145174/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12641/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12641/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8244 -&gt; IGTPW_12641</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12641/index.html</p>
<h2>Participating hosts (44 -&gt; 42)</h2>
<p>Missing    (2): bat-arlh-2 fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_12641 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@dmabuf@all-tests:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12641/fi-pnv-d510/igt@dmabuf@all-tests.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12904">i915#12904</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-twl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8244/bat-twl-1/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12641/bat-twl-1/igt@i915_selftest@live.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12919">i915#12919</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13503">i915#13503</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_lrc:</p>
<ul>
<li>bat-twl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8244/bat-twl-1/igt@i915_selftest@live@gt_lrc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12641/bat-twl-1/igt@i915_selftest@live@gt_lrc.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12919">i915#12919</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8244 -&gt; IGTPW_12641</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_16164: 8554d5b7b4fded481a85ab11d75eeb97443450e2 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_12641: 12641<br />
  IGT_8244: 9db9c35186dc599dfa8bc2cee66301d5389dd217 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============0231702628497932463==--
