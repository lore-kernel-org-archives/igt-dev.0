Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54C8ACD4855
	for <igt-dev@archiver.kernel.org>; Tue, 12 May 2026 07:01:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AA3B10E97E;
	Tue, 12 May 2026 07:01:43 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A5C610E97E;
 Tue, 12 May 2026 07:01:25 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8680331353979950349=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_lib/intel=5Fpat=3A_skip_U?=
 =?utf-8?q?C_compression_when_FlatCCS_unavailable?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: nishit.sharma@intel.com
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 12 May 2026 07:01:25 -0000
Message-ID: <177856928523.60085.2460117157927204870@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260512033504.3665416-1-nishit.sharma@intel.com>
In-Reply-To: <20260512033504.3665416-1-nishit.sharma@intel.com>
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

--===============8680331353979950349==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/intel_pat: skip UC compression when FlatCCS unavailable
URL   : https://patchwork.freedesktop.org/series/166372/
State : success

== Summary ==

CI Bug Log - changes from IGT_8903 -> IGTPW_15157
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15157/index.html

Participating hosts (42 -> 40)
------------------------------

  Missing    (2): bat-dg2-13 fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_15157 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@workarounds:
    - bat-arls-6:         [PASS][1] -> [DMESG-FAIL][2] ([i915#12061]) +1 other test dmesg-fail
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8903/bat-arls-6/igt@i915_selftest@live@workarounds.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15157/bat-arls-6/igt@i915_selftest@live@workarounds.html

  
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8903 -> IGTPW_15157
  * Linux: CI_DRM_18467 -> CI_DRM_18470

  CI-20190529: 20190529
  CI_DRM_18467: f8ee23694aa6be213355905a78f79bb1b0861565 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_18470: 767b83aa80c6d7eaa1204a866b287b56a1a33122 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15157: 13b7ae6e01465713df3bb71d7666f56784bf230d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8903: 6f88532e2fe22529195cc2f8cabff93d994688f8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15157/index.html

--===============8680331353979950349==
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
<tr><td><b>Series:</b></td><td>lib/intel_pat: skip UC compression when FlatCCS unavailable</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/166372/">https://patchwork.freedesktop.org/series/166372/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15157/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15157/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8903 -&gt; IGTPW_15157</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15157/index.html</p>
<h2>Participating hosts (42 -&gt; 40)</h2>
<p>Missing    (2): bat-dg2-13 fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_15157 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@i915_selftest@live@workarounds:<ul>
<li>bat-arls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8903/bat-arls-6/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15157/bat-arls-6/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8903 -&gt; IGTPW_15157</li>
<li>Linux: CI_DRM_18467 -&gt; CI_DRM_18470</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18467: f8ee23694aa6be213355905a78f79bb1b0861565 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_18470: 767b83aa80c6d7eaa1204a866b287b56a1a33122 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15157: 13b7ae6e01465713df3bb71d7666f56784bf230d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8903: 6f88532e2fe22529195cc2f8cabff93d994688f8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============8680331353979950349==--
