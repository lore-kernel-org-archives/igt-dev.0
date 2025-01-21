Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 684D2C02187
	for <igt-dev@archiver.kernel.org>; Tue, 21 Jan 2025 07:25:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2172810E4E3;
	Tue, 21 Jan 2025 07:25:18 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2817A10E4E0;
 Tue, 21 Jan 2025 07:25:17 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2343016482205241845=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_tests/amdgpu=3A_find_PCI_?=
 =?utf-8?q?bus=2C_device_and_function_and_use_it?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: vitaly.prosyak@amd.com
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 21 Jan 2025 07:25:17 -0000
Message-ID: <173744431715.2501559.975474842088640316@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250121044025.167761-1-vitaly.prosyak@amd.com>
In-Reply-To: <20250121044025.167761-1-vitaly.prosyak@amd.com>
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

--===============2343016482205241845==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/amdgpu: find PCI bus, device and function and use it
URL   : https://patchwork.freedesktop.org/series/143766/
State : success

== Summary ==

CI Bug Log - changes from IGT_8200 -> IGTPW_12471
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12471/index.html

Participating hosts (40 -> 40)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in IGTPW_12471 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@workarounds:
    - bat-arls-5:         [PASS][1] -> [DMESG-FAIL][2] ([i915#12061]) +1 other test dmesg-fail
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8200/bat-arls-5/igt@i915_selftest@live@workarounds.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12471/bat-arls-5/igt@i915_selftest@live@workarounds.html

  
#### Possible fixes ####

  * igt@i915_selftest@live:
    - bat-mtlp-8:         [DMESG-FAIL][3] ([i915#12061]) -> [PASS][4] +1 other test pass
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8200/bat-mtlp-8/igt@i915_selftest@live.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12471/bat-mtlp-8/igt@i915_selftest@live.html

  
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8200 -> IGTPW_12471
  * Linux: CI_DRM_15985 -> CI_DRM_15986

  CI-20190529: 20190529
  CI_DRM_15985: fb87b4e061d1844beaca66c8446cfcf60db99a23 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_15986: e48abf2c0aa4813a4629aeebd0547eb86f0f1a91 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12471: 8ee26c6c2c199488285311f882112bd9b6486b89 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8200: 5352b187076e89a9ff146cc1ecbd809aa20e4f91 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12471/index.html

--===============2343016482205241845==
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
<tr><td><b>Series:</b></td><td>tests/amdgpu: find PCI bus, device and function and use it</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/143766/">https://patchwork.freedesktop.org/series/143766/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12471/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12471/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8200 -&gt; IGTPW_12471</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12471/index.html</p>
<h2>Participating hosts (40 -&gt; 40)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_12471 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@i915_selftest@live@workarounds:<ul>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8200/bat-arls-5/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12471/bat-arls-5/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live:<ul>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8200/bat-mtlp-8/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12471/bat-mtlp-8/igt@i915_selftest@live.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8200 -&gt; IGTPW_12471</li>
<li>Linux: CI_DRM_15985 -&gt; CI_DRM_15986</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_15985: fb87b4e061d1844beaca66c8446cfcf60db99a23 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_15986: e48abf2c0aa4813a4629aeebd0547eb86f0f1a91 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_12471: 8ee26c6c2c199488285311f882112bd9b6486b89 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8200: 5352b187076e89a9ff146cc1ecbd809aa20e4f91 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============2343016482205241845==--
