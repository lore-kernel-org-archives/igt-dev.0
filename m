Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD035D1AD47
	for <igt-dev@archiver.kernel.org>; Wed, 16 Oct 2024 11:05:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B7EE10E10B;
	Wed, 16 Oct 2024 11:05:28 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C01A10E10B;
 Wed, 16 Oct 2024 11:05:27 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1485812326301408076=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBAT=3A_failure_for_xe=5Ffind=5Fengine=5Fby=5Fc?=
 =?utf-8?q?lass_helper_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Pravalika Gurram" <pravalika.gurram@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 16 Oct 2024 11:05:27 -0000
Message-ID: <172907672704.1273487.16695431482103966925@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241016101933.4191790-1-pravalika.gurram@intel.com>
In-Reply-To: <20241016101933.4191790-1-pravalika.gurram@intel.com>
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

--===============1485812326301408076==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: xe_find_engine_by_class helper (rev2)
URL   : https://patchwork.freedesktop.org/series/140001/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8077 -> IGTPW_11921
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_11921 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_11921, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11921/index.html

Participating hosts (44 -> 43)
------------------------------

  Missing    (1): fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_11921:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_chamelium_edid@hdmi-edid-read:
    - bat-dg2-13:         [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8077/bat-dg2-13/igt@kms_chamelium_edid@hdmi-edid-read.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11921/bat-dg2-13/igt@kms_chamelium_edid@hdmi-edid-read.html

  
Known issues
------------

  Here are the changes found in IGTPW_11921 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@i915_selftest@live:
    - fi-bsw-n3050:       [DMESG-FAIL][3] ([i915#12172]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8077/fi-bsw-n3050/igt@i915_selftest@live.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11921/fi-bsw-n3050/igt@i915_selftest@live.html

  * igt@i915_selftest@live@active:
    - fi-bsw-n3050:       [DMESG-FAIL][5] ([i915#12435]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8077/fi-bsw-n3050/igt@i915_selftest@live@active.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11921/fi-bsw-n3050/igt@i915_selftest@live@active.html

  
  [i915#12172]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12172
  [i915#12435]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12435


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8077 -> IGTPW_11921

  CI-20190529: 20190529
  CI_DRM_15540: 12e4970af1ecdeb76e94df2daf51a9c3d6b9f519 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_11921: 3fe31edf1e9ef420e80c408980c13b30fb81070b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8077: 42f9e9702f74a4993318adea936baaa186084689 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11921/index.html

--===============1485812326301408076==
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
<tr><td><b>Series:</b></td><td>xe_find_engine_by_class helper (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/140001/">https://patchwork.freedesktop.org/series/140001/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11921/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11921/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8077 -&gt; IGTPW_11921</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_11921 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_11921, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11921/index.html</p>
<h2>Participating hosts (44 -&gt; 43)</h2>
<p>Missing    (1): fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_11921:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_chamelium_edid@hdmi-edid-read:<ul>
<li>bat-dg2-13:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8077/bat-dg2-13/igt@kms_chamelium_edid@hdmi-edid-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11921/bat-dg2-13/igt@kms_chamelium_edid@hdmi-edid-read.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11921 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8077/fi-bsw-n3050/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12172">i915#12172</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11921/fi-bsw-n3050/igt@i915_selftest@live.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@active:</p>
<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8077/fi-bsw-n3050/igt@i915_selftest@live@active.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12435">i915#12435</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11921/fi-bsw-n3050/igt@i915_selftest@live@active.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8077 -&gt; IGTPW_11921</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_15540: 12e4970af1ecdeb76e94df2daf51a9c3d6b9f519 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_11921: 3fe31edf1e9ef420e80c408980c13b30fb81070b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8077: 42f9e9702f74a4993318adea936baaa186084689 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============1485812326301408076==--
