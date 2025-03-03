Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BBCBC282C6
	for <igt-dev@archiver.kernel.org>; Mon,  3 Mar 2025 08:33:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5861C10E375;
	Mon,  3 Mar 2025 08:33:50 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7C2910E375;
 Mon,  3 Mar 2025 08:33:48 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8541262387113853879=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_tests/kms=5Fdisplay=5Fmod?=
 =?utf-8?q?es=3A_Remove_negative_test_for_extended_display_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mohammed Thasleem" <mohammed.thasleem@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 03 Mar 2025 08:33:48 -0000
Message-ID: <174099082893.61154.16884789451653936562@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250220103640.44879-1-mohammed.thasleem@intel.com>
In-Reply-To: <20250220103640.44879-1-mohammed.thasleem@intel.com>
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

--===============8541262387113853879==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_display_modes: Remove negative test for extended display (rev3)
URL   : https://patchwork.freedesktop.org/series/145161/
State : success

== Summary ==

CI Bug Log - changes from IGT_8255 -> IGTPW_12688
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12688/index.html

Participating hosts (44 -> 41)
------------------------------

  Missing    (3): fi-glk-j4005 bat-dg2-9 bat-atsm-1 

Known issues
------------

  Here are the changes found in IGTPW_12688 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@i915_selftest@live@workarounds:
    - bat-mtlp-9:         [DMESG-FAIL][1] ([i915#12061]) -> [PASS][2] +1 other test pass
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8255/bat-mtlp-9/igt@i915_selftest@live@workarounds.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12688/bat-mtlp-9/igt@i915_selftest@live@workarounds.html

  * igt@kms_chamelium_edid@hdmi-edid-read:
    - bat-dg2-13:         [DMESG-WARN][3] ([i915#13733]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8255/bat-dg2-13/igt@kms_chamelium_edid@hdmi-edid-read.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12688/bat-dg2-13/igt@kms_chamelium_edid@hdmi-edid-read.html

  
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#13733]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13733


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8255 -> IGTPW_12688
  * Linux: CI_DRM_16205 -> CI_DRM_16210

  CI-20190529: 20190529
  CI_DRM_16205: ca9d01b66c70413a62a1a28fbf8709d2e8440c1c @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_16210: 60b234fe25a41a2678a21d545477e22e0550faba @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12688: 12688
  IGT_8255: 4ef742fae97d2f4af680f9e29f7ea45920f939b7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12688/index.html

--===============8541262387113853879==
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
<tr><td><b>Series:</b></td><td>tests/kms_display_modes: Remove negative test for extended display (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/145161/">https://patchwork.freedesktop.org/series/145161/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12688/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12688/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8255 -&gt; IGTPW_12688</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12688/index.html</p>
<h2>Participating hosts (44 -&gt; 41)</h2>
<p>Missing    (3): fi-glk-j4005 bat-dg2-9 bat-atsm-1 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_12688 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-mtlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8255/bat-mtlp-9/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12688/bat-mtlp-9/igt@i915_selftest@live@workarounds.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-read:</p>
<ul>
<li>bat-dg2-13:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8255/bat-dg2-13/igt@kms_chamelium_edid@hdmi-edid-read.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13733">i915#13733</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12688/bat-dg2-13/igt@kms_chamelium_edid@hdmi-edid-read.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8255 -&gt; IGTPW_12688</li>
<li>Linux: CI_DRM_16205 -&gt; CI_DRM_16210</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_16205: ca9d01b66c70413a62a1a28fbf8709d2e8440c1c @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_16210: 60b234fe25a41a2678a21d545477e22e0550faba @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_12688: 12688<br />
  IGT_8255: 4ef742fae97d2f4af680f9e29f7ea45920f939b7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============8541262387113853879==--
