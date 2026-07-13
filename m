Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95384C43458
	for <igt-dev@archiver.kernel.org>; Mon, 13 Jul 2026 20:05:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34F4F10E65A;
	Mon, 13 Jul 2026 20:05:19 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 918B1891D9;
 Mon, 13 Jul 2026 20:04:45 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8802852450365987059=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_tests/intel-ci=3A_Block_E?=
 =?utf-8?q?Udebug-related_tests_on_VF/VM_runs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jakub Kolakowski" <jakub1.kolakowski@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 13 Jul 2026 20:04:45 -0000
Message-ID: <178397308559.185196.17019917624198424771@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260713165312.413941-1-jakub1.kolakowski@intel.com>
In-Reply-To: <20260713165312.413941-1-jakub1.kolakowski@intel.com>
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

--===============8802852450365987059==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel-ci: Block EUdebug-related tests on VF/VM runs
URL   : https://patchwork.freedesktop.org/series/170330/
State : failure

== Summary ==

CI Bug Log - changes from IGT_9005 -> IGTPW_15522
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_15522 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_15522, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15522/index.html

Participating hosts (42 -> 40)
------------------------------

  Missing    (2): bat-dg2-13 fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_15522:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live:
    - bat-adls-6:         [PASS][1] -> [FAIL][2] +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9005/bat-adls-6/igt@i915_selftest@live.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15522/bat-adls-6/igt@i915_selftest@live.html

  


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9005 -> IGTPW_15522
  * Linux: CI_DRM_18810 -> CI_DRM_18814

  CI-20190529: 20190529
  CI_DRM_18810: 83d782d98f4ebb4a10b8ee107e3a389917e0b218 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_18814: b4ff3505d3eacce720d43e24651ce84f2a0d7f56 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15522: 15522
  IGT_9005: 5d0cdd6f2f5d3ad4992da1edf67f22622a8bb153 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15522/index.html

--===============8802852450365987059==
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
<tr><td><b>Series:</b></td><td>tests/intel-ci: Block EUdebug-related tests on VF/VM runs</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/170330/">https://patchwork.freedesktop.org/series/170330/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15522/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15522/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_9005 -&gt; IGTPW_15522</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_15522 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_15522, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15522/index.html</p>
<h2>Participating hosts (42 -&gt; 40)</h2>
<p>Missing    (2): bat-dg2-13 fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_15522:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_selftest@live:<ul>
<li>bat-adls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9005/bat-adls-6/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15522/bat-adls-6/igt@i915_selftest@live.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9005 -&gt; IGTPW_15522</li>
<li>Linux: CI_DRM_18810 -&gt; CI_DRM_18814</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18810: 83d782d98f4ebb4a10b8ee107e3a389917e0b218 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_18814: b4ff3505d3eacce720d43e24651ce84f2a0d7f56 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15522: 15522<br />
  IGT_9005: 5d0cdd6f2f5d3ad4992da1edf67f22622a8bb153 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============8802852450365987059==--
