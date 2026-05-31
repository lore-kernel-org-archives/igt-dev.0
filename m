Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 802A4CD6E51
	for <igt-dev@archiver.kernel.org>; Sun, 31 May 2026 04:13:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01F3110E45C;
	Sun, 31 May 2026 04:13:55 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17A0110E45C;
 Sun, 31 May 2026 04:13:34 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5561667746534373047=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_tests/kms=5Fcolor=3A_Add_?=
 =?utf-8?q?10-bit_color_depth_support_to_gamma_test_for_MediaTek?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jay Liu" <jay.liu@mediatek.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sun, 31 May 2026 04:13:34 -0000
Message-ID: <178020081409.27827.287334700956509567@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260531031732.16600-1-jay.liu@mediatek.com>
In-Reply-To: <20260531031732.16600-1-jay.liu@mediatek.com>
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

--===============5561667746534373047==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_color: Add 10-bit color depth support to gamma test for MediaTek
URL   : https://patchwork.freedesktop.org/series/167597/
State : success

== Summary ==

CI Bug Log - changes from IGT_8943 -> IGTPW_15274
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15274/index.html

Participating hosts (42 -> 40)
------------------------------

  Missing    (2): bat-dg2-13 fi-snb-2520m 

New tests
---------

  New tests have been introduced between IGT_8943 and IGTPW_15274:

### New IGT tests (6) ###

  * igt@gem_exec_basic@basic@bcs0-smem:
    - Statuses : 37 pass(s)
    - Exec time: [0.0, 0.00] s

  * igt@gem_exec_basic@basic@rcs0-smem:
    - Statuses : 40 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@gem_exec_basic@basic@vcs0-smem:
    - Statuses : 39 pass(s)
    - Exec time: [0.0, 0.01] s

  * igt@gem_exec_basic@basic@vcs1-smem:
    - Statuses : 20 pass(s)
    - Exec time: [0.0, 0.00] s

  * igt@gem_exec_basic@basic@vecs0-smem:
    - Statuses : 36 pass(s)
    - Exec time: [0.0, 0.00] s

  * igt@i915_pciid:
    - Statuses : 40 pass(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_15274 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@i915_selftest@live:
    - bat-apl-1:          [DMESG-FAIL][1] ([i915#14808]) -> [PASS][2] +1 other test pass
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8943/bat-apl-1/igt@i915_selftest@live.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15274/bat-apl-1/igt@i915_selftest@live.html

  
  [i915#14808]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14808


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8943 -> IGTPW_15274
  * Linux: CI_DRM_18580 -> CI_DRM_18592

  CI-20190529: 20190529
  CI_DRM_18580: 0b693fa10a961c6e08ade3a6f41069b18baf2a63 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_18592: f4ba932abb4422a63c72a272b0386f745ce9a119 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15274: 15274
  IGT_8943: 8943

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15274/index.html

--===============5561667746534373047==
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
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/167597/">https://patchwork.freedesktop.org/series/167597/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15274/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15274/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8943 -&gt; IGTPW_15274</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15274/index.html</p>
<h2>Participating hosts (42 -&gt; 40)</h2>
<p>Missing    (2): bat-dg2-13 fi-snb-2520m </p>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_8943 and IGTPW_15274:</p>
<h3>New IGT tests (6)</h3>
<ul>
<li>
<p>igt@gem_exec_basic@basic@bcs0-smem:</p>
<ul>
<li>Statuses : 37 pass(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_basic@basic@rcs0-smem:</p>
<ul>
<li>Statuses : 40 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_basic@basic@vcs0-smem:</p>
<ul>
<li>Statuses : 39 pass(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_basic@basic@vcs1-smem:</p>
<ul>
<li>Statuses : 20 pass(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_basic@basic@vecs0-smem:</p>
<ul>
<li>Statuses : 36 pass(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@i915_pciid:</p>
<ul>
<li>Statuses : 40 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_15274 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live:<ul>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8943/bat-apl-1/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14808">i915#14808</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15274/bat-apl-1/igt@i915_selftest@live.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8943 -&gt; IGTPW_15274</li>
<li>Linux: CI_DRM_18580 -&gt; CI_DRM_18592</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18580: 0b693fa10a961c6e08ade3a6f41069b18baf2a63 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_18592: f4ba932abb4422a63c72a272b0386f745ce9a119 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15274: 15274<br />
  IGT_8943: 8943</p>

</body>
</html>

--===============5561667746534373047==--
