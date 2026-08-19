Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A53A1C5B572
	for <igt-dev@archiver.kernel.org>; Wed, 19 Aug 2026 20:45:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 465F610E183;
	Wed, 19 Aug 2026 20:45:56 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1438A10E183;
 Wed, 19 Aug 2026 20:45:12 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6594334125709307715=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_tests/intel/gem=5Fexec=5F?=
 =?utf-8?q?params=3A_add_invalid-offset-multiple-buffers_test_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Krzysztof Niemiec" <krzysztof.niemiec@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 19 Aug 2026 20:45:12 -0000
Message-ID: <178717231207.68440.8678317449643366959@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260819152108.58688-2-krzysztof.niemiec@intel.com>
In-Reply-To: <20260819152108.58688-2-krzysztof.niemiec@intel.com>
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

--===============6594334125709307715==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/gem_exec_params: add invalid-offset-multiple-buffers test (rev2)
URL   : https://patchwork.freedesktop.org/series/172083/
State : success

== Summary ==

CI Bug Log - changes from IGT_9063 -> IGTPW_15708
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15708/index.html

Participating hosts (39 -> 37)
------------------------------

  Missing    (2): bat-dg2-13 fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_15708 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@i915_selftest@live@requests:
    - bat-atsm-1:         [ABORT][1] ([i915#14564]) -> [PASS][2] +1 other test pass
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9063/bat-atsm-1/igt@i915_selftest@live@requests.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15708/bat-atsm-1/igt@i915_selftest@live@requests.html

  * igt@kms_hdmi_inject@inject-audio:
    - fi-cfl-guc:         [SKIP][3] -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9063/fi-cfl-guc/igt@kms_hdmi_inject@inject-audio.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15708/fi-cfl-guc/igt@kms_hdmi_inject@inject-audio.html

  
  [i915#14564]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14564


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9063 -> IGTPW_15708
  * Linux: CI_DRM_19015 -> CI_DRM_19018

  CI-20190529: 20190529
  CI_DRM_19015: 291141d363710c4ac7ef9ab71153459d746ed50c @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_19018: 8aa5d62d83ea79c3dae24446614ea31453bc2ca6 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15708: 15708
  IGT_9063: 9063

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15708/index.html

--===============6594334125709307715==
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
<tr><td><b>Series:</b></td><td>tests/intel/gem_exec_params: add invalid-offset-multiple-buffers test (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/172083/">https://patchwork.freedesktop.org/series/172083/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15708/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15708/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_9063 -&gt; IGTPW_15708</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15708/index.html</p>
<h2>Participating hosts (39 -&gt; 37)</h2>
<p>Missing    (2): bat-dg2-13 fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_15708 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9063/bat-atsm-1/igt@i915_selftest@live@requests.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14564">i915#14564</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15708/bat-atsm-1/igt@i915_selftest@live@requests.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>fi-cfl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9063/fi-cfl-guc/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15708/fi-cfl-guc/igt@kms_hdmi_inject@inject-audio.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9063 -&gt; IGTPW_15708</li>
<li>Linux: CI_DRM_19015 -&gt; CI_DRM_19018</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19015: 291141d363710c4ac7ef9ab71153459d746ed50c @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_19018: 8aa5d62d83ea79c3dae24446614ea31453bc2ca6 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15708: 15708<br />
  IGT_9063: 9063</p>

</body>
</html>

--===============6594334125709307715==--
