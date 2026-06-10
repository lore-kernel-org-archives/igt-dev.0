Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E91C8CD98C5
	for <igt-dev@archiver.kernel.org>; Wed, 10 Jun 2026 22:44:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6943710E1DE;
	Wed, 10 Jun 2026 22:44:45 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8570510E1DE;
 Wed, 10 Jun 2026 22:44:20 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============9002829078660542876=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_tests/intel/kms=5Fpsr2=5F?=
 =?utf-8?q?sf=3A_Restrict_ET_validation_to_eDP_only?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Naladala Ramanaidu" <ramanaidu.naladala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 10 Jun 2026 22:44:20 -0000
Message-ID: <178113146053.66528.558696500432410958@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260610093215.979237-1-ramanaidu.naladala@intel.com>
In-Reply-To: <20260610093215.979237-1-ramanaidu.naladala@intel.com>
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

--===============9002829078660542876==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/kms_psr2_sf: Restrict ET validation to eDP only
URL   : https://patchwork.freedesktop.org/series/168234/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8958 -> IGTPW_15337
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_15337 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_15337, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15337/index.html

Participating hosts (42 -> 40)
------------------------------

  Missing    (2): bat-dg2-13 fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_15337:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live@gt_mocs:
    - bat-atsm-1:         [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8958/bat-atsm-1/igt@i915_selftest@live@gt_mocs.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15337/bat-atsm-1/igt@i915_selftest@live@gt_mocs.html

  
New tests
---------

  New tests have been introduced between IGT_8958 and IGTPW_15337:

### New IGT tests (3) ###

  * igt@i915_selftest@basic-with_one_bo_two_files:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@module-reload:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_selftest@unbind-rebind:
    - Statuses :
    - Exec time: [None] s

  

Known issues
------------

  Here are the changes found in IGTPW_15337 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live:
    - bat-atsm-1:         [PASS][3] -> [ABORT][4] ([i915#14564])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8958/bat-atsm-1/igt@i915_selftest@live.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15337/bat-atsm-1/igt@i915_selftest@live.html

  
  [i915#14564]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14564


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8958 -> IGTPW_15337

  CI-20190529: 20190529
  CI_DRM_18657: 10db0c83b0ccc3211990b54235475abb9d383851 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15337: cdc286c5a0a7d0f32e7220c6c32251ad69119a19 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8958: 8958

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15337/index.html

--===============9002829078660542876==
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
<tr><td><b>Series:</b></td><td>tests/intel/kms_psr2_sf: Restrict ET validation to eDP only</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/168234/">https://patchwork.freedesktop.org/series/168234/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15337/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15337/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8958 -&gt; IGTPW_15337</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_15337 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_15337, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15337/index.html</p>
<h2>Participating hosts (42 -&gt; 40)</h2>
<p>Missing    (2): bat-dg2-13 fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_15337:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_selftest@live@gt_mocs:<ul>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8958/bat-atsm-1/igt@i915_selftest@live@gt_mocs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15337/bat-atsm-1/igt@i915_selftest@live@gt_mocs.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_8958 and IGTPW_15337:</p>
<h3>New IGT tests (3)</h3>
<ul>
<li>
<p>igt@i915_selftest@basic-with_one_bo_two_files:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@module-reload:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@unbind-rebind:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_15337 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@i915_selftest@live:<ul>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8958/bat-atsm-1/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15337/bat-atsm-1/igt@i915_selftest@live.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14564">i915#14564</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8958 -&gt; IGTPW_15337</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18657: 10db0c83b0ccc3211990b54235475abb9d383851 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15337: cdc286c5a0a7d0f32e7220c6c32251ad69119a19 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8958: 8958</p>

</body>
</html>

--===============9002829078660542876==--
