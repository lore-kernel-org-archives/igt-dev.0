Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0621D41C06
	for <igt-dev@archiver.kernel.org>; Wed, 13 Nov 2024 12:49:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8887810E33B;
	Wed, 13 Nov 2024 12:49:04 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE46C10E33B;
 Wed, 13 Nov 2024 12:49:02 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4581417612157530814=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBAT=3A_failure_for_tests/syncobj=5Fwait=3A_Upd?=
 =?utf-8?q?ate_invalid-wait-zero-handles_test_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Krzysztof Niemiec" <krzysztof.niemiec@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 13 Nov 2024 12:49:02 -0000
Message-ID: <173150214290.3583531.3014129577780208645@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241030144821.35043-2-krzysztof.niemiec@intel.com>
In-Reply-To: <20241030144821.35043-2-krzysztof.niemiec@intel.com>
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

--===============4581417612157530814==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/syncobj_wait: Update invalid-wait-zero-handles test (rev3)
URL   : https://patchwork.freedesktop.org/series/140727/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8106 -> IGTPW_12086
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12086 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12086, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12086/index.html

Participating hosts (47 -> 45)
------------------------------

  Missing    (2): bat-mtlp-9 fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12086:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live:
    - bat-rpls-4:         [PASS][1] -> [DMESG-FAIL][2] +1 other test dmesg-fail
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8106/bat-rpls-4/igt@i915_selftest@live.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12086/bat-rpls-4/igt@i915_selftest@live.html

  
Known issues
------------

  Here are the changes found in IGTPW_12086 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_chamelium_edid@hdmi-edid-read:
    - bat-dg2-13:         [PASS][3] -> [DMESG-WARN][4] ([i915#12253])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8106/bat-dg2-13/igt@kms_chamelium_edid@hdmi-edid-read.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12086/bat-dg2-13/igt@kms_chamelium_edid@hdmi-edid-read.html

  
#### Possible fixes ####

  * igt@kms_chamelium_frames@dp-crc-fast:
    - bat-dg2-13:         [FAIL][5] ([i915#12440]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8106/bat-dg2-13/igt@kms_chamelium_frames@dp-crc-fast.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12086/bat-dg2-13/igt@kms_chamelium_frames@dp-crc-fast.html

  
  [i915#12253]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12253
  [i915#12440]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12440


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8106 -> IGTPW_12086

  CI-20190529: 20190529
  CI_DRM_15689: 169c7cd31a373ed31054abb423981856eb5fb119 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12086: 24559ade644e7fe330d6a4b7596060fd989c1409 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8106: 05659c7f2840938c4977668143e6c60a46ca509d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12086/index.html

--===============4581417612157530814==
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
<tr><td><b>Series:</b></td><td>tests/syncobj_wait: Update invalid-wait-zero-handles test (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/140727/">https://patchwork.freedesktop.org/series/140727/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12086/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12086/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8106 -&gt; IGTPW_12086</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_12086 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_12086, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12086/index.html</p>
<h2>Participating hosts (47 -&gt; 45)</h2>
<p>Missing    (2): bat-mtlp-9 fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_12086:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_selftest@live:<ul>
<li>bat-rpls-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8106/bat-rpls-4/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12086/bat-rpls-4/igt@i915_selftest@live.html">DMESG-FAIL</a> +1 other test dmesg-fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_12086 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_chamelium_edid@hdmi-edid-read:<ul>
<li>bat-dg2-13:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8106/bat-dg2-13/igt@kms_chamelium_edid@hdmi-edid-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12086/bat-dg2-13/igt@kms_chamelium_edid@hdmi-edid-read.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12253">i915#12253</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_chamelium_frames@dp-crc-fast:<ul>
<li>bat-dg2-13:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8106/bat-dg2-13/igt@kms_chamelium_frames@dp-crc-fast.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12440">i915#12440</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12086/bat-dg2-13/igt@kms_chamelium_frames@dp-crc-fast.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8106 -&gt; IGTPW_12086</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_15689: 169c7cd31a373ed31054abb423981856eb5fb119 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_12086: 24559ade644e7fe330d6a4b7596060fd989c1409 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8106: 05659c7f2840938c4977668143e6c60a46ca509d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============4581417612157530814==--
