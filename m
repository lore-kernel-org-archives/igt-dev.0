Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A30A8CD0417
	for <igt-dev@archiver.kernel.org>; Tue,  6 Jan 2026 04:37:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4608710E1C6;
	Tue,  6 Jan 2026 04:37:06 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF9EE10E1C6;
 Tue,  6 Jan 2026 04:37:04 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6130663389500768740=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_intel-ci=3A_Update_displa?=
 =?utf-8?q?y_blocklist?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jeevan B" <jeevan.b@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 06 Jan 2026 04:37:04 -0000
Message-ID: <176767422497.128107.5093310826848075260@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260106032440.30128-1-jeevan.b@intel.com>
In-Reply-To: <20260106032440.30128-1-jeevan.b@intel.com>
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

--===============6130663389500768740==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: intel-ci: Update display blocklist
URL   : https://patchwork.freedesktop.org/series/159672/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8684 -> IGTPW_14292
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_14292 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_14292, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14292/index.html

Participating hosts (44 -> 40)
------------------------------

  Missing    (4): bat-dg2-13 fi-glk-j4005 fi-snb-2520m bat-adls-6 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_14292:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_force_connector_basic@prune-stale-modes:
    - fi-skl-6600u:       [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8684/fi-skl-6600u/igt@kms_force_connector_basic@prune-stale-modes.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14292/fi-skl-6600u/igt@kms_force_connector_basic@prune-stale-modes.html

  
Known issues
------------

  Here are the changes found in IGTPW_14292 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@workarounds:
    - bat-dg2-11:         [PASS][3] -> [DMESG-FAIL][4] ([i915#12061]) +1 other test dmesg-fail
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8684/bat-dg2-11/igt@i915_selftest@live@workarounds.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14292/bat-dg2-11/igt@i915_selftest@live@workarounds.html
    - bat-mtlp-9:         [PASS][5] -> [DMESG-FAIL][6] ([i915#12061]) +1 other test dmesg-fail
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8684/bat-mtlp-9/igt@i915_selftest@live@workarounds.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14292/bat-mtlp-9/igt@i915_selftest@live@workarounds.html

  
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8684 -> IGTPW_14292
  * Linux: CI_DRM_17769 -> CI_DRM_17770

  CI-20190529: 20190529
  CI_DRM_17769: 9081abc2c80b75a0c38ba2880f867904acd13a04 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_17770: b3845fe8af5ec5c1d4b26e40ac6b4c7370e5fa35 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_14292: cc6f0e6f6a1b5b0503c8515a5e03efef25cd45f1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8684: 8684

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14292/index.html

--===============6130663389500768740==
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
<tr><td><b>Series:</b></td><td>intel-ci: Update display blocklist</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/159672/">https://patchwork.freedesktop.org/series/159672/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14292/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14292/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8684 -&gt; IGTPW_14292</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_14292 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_14292, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14292/index.html</p>
<h2>Participating hosts (44 -&gt; 40)</h2>
<p>Missing    (4): bat-dg2-13 fi-glk-j4005 fi-snb-2520m bat-adls-6 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_14292:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_force_connector_basic@prune-stale-modes:<ul>
<li>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8684/fi-skl-6600u/igt@kms_force_connector_basic@prune-stale-modes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14292/fi-skl-6600u/igt@kms_force_connector_basic@prune-stale-modes.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_14292 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@i915_selftest@live@workarounds:<ul>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8684/bat-dg2-11/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14292/bat-dg2-11/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
<li>bat-mtlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8684/bat-mtlp-9/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14292/bat-mtlp-9/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8684 -&gt; IGTPW_14292</li>
<li>Linux: CI_DRM_17769 -&gt; CI_DRM_17770</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_17769: 9081abc2c80b75a0c38ba2880f867904acd13a04 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_17770: b3845fe8af5ec5c1d4b26e40ac6b4c7370e5fa35 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_14292: cc6f0e6f6a1b5b0503c8515a5e03efef25cd45f1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8684: 8684</p>

</body>
</html>

--===============6130663389500768740==--
