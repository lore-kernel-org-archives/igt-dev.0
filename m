Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9813CFD2F6
	for <igt-dev@archiver.kernel.org>; Thu, 27 Nov 2025 16:53:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62D5510E82C;
	Thu, 27 Nov 2025 16:53:12 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A099A10E82C;
 Thu, 27 Nov 2025 16:53:11 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3309020184942310471=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_Adjust_vblank_validation_?=
 =?utf-8?q?for_simulation?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Naladala Ramanaidu" <ramanaidu.naladala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 27 Nov 2025 16:53:11 -0000
Message-ID: <176426239164.36235.831655554388538252@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251127135348.2158579-1-ramanaidu.naladala@intel.com>
In-Reply-To: <20251127135348.2158579-1-ramanaidu.naladala@intel.com>
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

--===============3309020184942310471==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Adjust vblank validation for simulation
URL   : https://patchwork.freedesktop.org/series/158170/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8642 -> IGTPW_14125
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_14125 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_14125, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14125/index.html

Participating hosts (44 -> 44)
------------------------------

  Additional (1): fi-kbl-guc 
  Missing    (1): fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_14125:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_ctx_create@basic:
    - bat-twl-1:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8642/bat-twl-1/igt@gem_ctx_create@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14125/bat-twl-1/igt@gem_ctx_create@basic.html

  * igt@gem_tiled_fence_blits@basic:
    - fi-glk-j4005:       [PASS][3] -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8642/fi-glk-j4005/igt@gem_tiled_fence_blits@basic.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14125/fi-glk-j4005/igt@gem_tiled_fence_blits@basic.html

  * igt@kms_addfb_basic@bad-pitch-1024:
    - bat-dg2-8:          [PASS][5] -> [INCOMPLETE][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8642/bat-dg2-8/igt@kms_addfb_basic@bad-pitch-1024.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14125/bat-dg2-8/igt@kms_addfb_basic@bad-pitch-1024.html

  * igt@kms_busy@basic:
    - fi-ilk-650:         [PASS][7] -> [INCOMPLETE][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8642/fi-ilk-650/igt@kms_busy@basic.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14125/fi-ilk-650/igt@kms_busy@basic.html

  
New tests
---------

  New tests have been introduced between IGT_8642 and IGTPW_14125:

### New IGT tests (1) ###

  * igt@kms_addfb_basic:
    - Statuses :
    - Exec time: [None] s

  

Known issues
------------

  Here are the changes found in IGTPW_14125 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@info:
    - fi-kbl-guc:         NOTRUN -> [SKIP][9] ([i915#1849])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14125/fi-kbl-guc/igt@fbdev@info.html

  * igt@intel_hwmon@hwmon-read:
    - fi-kbl-guc:         NOTRUN -> [SKIP][10] +5 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14125/fi-kbl-guc/igt@intel_hwmon@hwmon-read.html

  
  [i915#1849]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8642 -> IGTPW_14125

  CI-20190529: 20190529
  CI_DRM_17596: 943d0e69375e5a9030238a697f7d850af0549000 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_14125: 5da5551c946a1189bb0d996193e2608caafc337d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8642: fa854cbfe25f3d64ad02bfd3f7804b5d7ccda71d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14125/index.html

--===============3309020184942310471==
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
<tr><td><b>Series:</b></td><td>Adjust vblank validation for simulation</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/158170/">https://patchwork.freedesktop.org/series/158170/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14125/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14125/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8642 -&gt; IGTPW_14125</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_14125 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_14125, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14125/index.html</p>
<h2>Participating hosts (44 -&gt; 44)</h2>
<p>Additional (1): fi-kbl-guc <br />
  Missing    (1): fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_14125:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_ctx_create@basic:</p>
<ul>
<li>bat-twl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8642/bat-twl-1/igt@gem_ctx_create@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14125/bat-twl-1/igt@gem_ctx_create@basic.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@gem_tiled_fence_blits@basic:</p>
<ul>
<li>fi-glk-j4005:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8642/fi-glk-j4005/igt@gem_tiled_fence_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14125/fi-glk-j4005/igt@gem_tiled_fence_blits@basic.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bad-pitch-1024:</p>
<ul>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8642/bat-dg2-8/igt@kms_addfb_basic@bad-pitch-1024.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14125/bat-dg2-8/igt@kms_addfb_basic@bad-pitch-1024.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic:</p>
<ul>
<li>fi-ilk-650:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8642/fi-ilk-650/igt@kms_busy@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14125/fi-ilk-650/igt@kms_busy@basic.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_8642 and IGTPW_14125:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@kms_addfb_basic:<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_14125 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14125/fi-kbl-guc/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a>)</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14125/fi-kbl-guc/igt@intel_hwmon@hwmon-read.html">SKIP</a> +5 other tests skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8642 -&gt; IGTPW_14125</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_17596: 943d0e69375e5a9030238a697f7d850af0549000 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_14125: 5da5551c946a1189bb0d996193e2608caafc337d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8642: fa854cbfe25f3d64ad02bfd3f7804b5d7ccda71d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============3309020184942310471==--
