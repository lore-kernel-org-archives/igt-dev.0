Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82B42C5CFDB
	for <igt-dev@archiver.kernel.org>; Thu, 13 Aug 2026 21:42:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0898F10F553;
	Thu, 13 Aug 2026 21:42:40 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD6C310F553;
 Thu, 13 Aug 2026 21:41:53 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8641846985830973340=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_tests/unigraf=3A_Hoist_st?=
 =?utf-8?q?atic_DP_link_rate_bounds_and_purge_eDP_rate?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mark Yacoub" <markyacoub@google.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 13 Aug 2026 21:41:53 -0000
Message-ID: <178665731382.49494.7607867046386867649@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260813182924.2508072-1-markyacoub@google.com>
In-Reply-To: <20260813182924.2508072-1-markyacoub@google.com>
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

--===============8641846985830973340==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/unigraf: Hoist static DP link rate bounds and purge eDP rate
URL   : https://patchwork.freedesktop.org/series/172172/
State : success

== Summary ==

CI Bug Log - changes from IGT_9055 -> IGTPW_15680
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15680/index.html

Participating hosts (37 -> 35)
------------------------------

  Missing    (2): bat-dg2-13 fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_15680 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@i915_selftest@live:
    - fi-tgl-1115g4:      [DMESG-FAIL][1] ([i915#14808]) -> [PASS][2] +1 other test pass
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9055/fi-tgl-1115g4/igt@i915_selftest@live.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15680/fi-tgl-1115g4/igt@i915_selftest@live.html

  * igt@kms_pm_rpm@basic-rte:
    - bat-rpls-4:         [DMESG-WARN][3] ([i915#13400]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9055/bat-rpls-4/igt@kms_pm_rpm@basic-rte.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15680/bat-rpls-4/igt@kms_pm_rpm@basic-rte.html

  
  [i915#13400]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13400
  [i915#14808]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14808


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9055 -> IGTPW_15680
  * Linux: CI_DRM_18994 -> CI_DRM_18995

  CI-20190529: 20190529
  CI_DRM_18994: 12a74df2314c42325731297e95b9aafd9329a20d @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_18995: 1f159dc3afe658eaaea3c77d3018705de6b1a31e @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15680: 90c934482f7c0c15faa078891b555f25fce835e7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9055: 8484e14a094150b500aeeb9bfb0db2ee0de862ea @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15680/index.html

--===============8641846985830973340==
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
<tr><td><b>Series:</b></td><td>tests/unigraf: Hoist static DP link rate bounds and purge eDP rate</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/172172/">https://patchwork.freedesktop.org/series/172172/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15680/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15680/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_9055 -&gt; IGTPW_15680</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15680/index.html</p>
<h2>Participating hosts (37 -&gt; 35)</h2>
<p>Missing    (2): bat-dg2-13 fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_15680 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9055/fi-tgl-1115g4/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14808">i915#14808</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15680/fi-tgl-1115g4/igt@i915_selftest@live.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-rte:</p>
<ul>
<li>bat-rpls-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9055/bat-rpls-4/igt@kms_pm_rpm@basic-rte.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13400">i915#13400</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15680/bat-rpls-4/igt@kms_pm_rpm@basic-rte.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9055 -&gt; IGTPW_15680</li>
<li>Linux: CI_DRM_18994 -&gt; CI_DRM_18995</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18994: 12a74df2314c42325731297e95b9aafd9329a20d @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_18995: 1f159dc3afe658eaaea3c77d3018705de6b1a31e @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15680: 90c934482f7c0c15faa078891b555f25fce835e7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9055: 8484e14a094150b500aeeb9bfb0db2ee0de862ea @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============8641846985830973340==--
