Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DDB7C021B3
	for <igt-dev@archiver.kernel.org>; Fri, 21 Feb 2025 16:33:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E29DF892EA;
	Fri, 21 Feb 2025 16:33:19 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82BFA892EA;
 Fri, 21 Feb 2025 16:33:18 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1415056077556529801=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_xe=3A_Test_scratch_page_u?=
 =?utf-8?q?nder_fault_mode_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Oak Zeng" <oak.zeng@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 21 Feb 2025 16:33:18 -0000
Message-ID: <174015559852.512567.12512694409609989915@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250221155336.378911-1-oak.zeng@intel.com>
In-Reply-To: <20250221155336.378911-1-oak.zeng@intel.com>
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

--===============1415056077556529801==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: xe: Test scratch page under fault mode (rev4)
URL   : https://patchwork.freedesktop.org/series/144907/
State : success

== Summary ==

CI Bug Log - changes from IGT_8245 -> IGTPW_12649
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12649/index.html

Participating hosts (44 -> 41)
------------------------------

  Missing    (3): fi-rkl-11600 fi-snb-2520m bat-adls-6 

Known issues
------------

  Here are the changes found in IGTPW_12649 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live:
    - bat-twl-2:          [PASS][1] -> [ABORT][2] ([i915#12919] / [i915#13503])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8245/bat-twl-2/igt@i915_selftest@live.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12649/bat-twl-2/igt@i915_selftest@live.html

  * igt@i915_selftest@live@gt_engines:
    - bat-twl-2:          [PASS][3] -> [ABORT][4] ([i915#12919])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8245/bat-twl-2/igt@i915_selftest@live@gt_engines.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12649/bat-twl-2/igt@i915_selftest@live@gt_engines.html

  
  [i915#12919]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12919
  [i915#13503]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13503


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8245 -> IGTPW_12649
  * Linux: CI_DRM_16164 -> CI_DRM_16167

  CI-20190529: 20190529
  CI_DRM_16164: 8554d5b7b4fded481a85ab11d75eeb97443450e2 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_16167: a22ac320a08377d760e73fa530c27782f0b68b6d @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12649: 271236dac27a9991d20fdd105fd5a93d48901912 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8245: 822e95b2560133bc21aa3065f70d7148f23f87cf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12649/index.html

--===============1415056077556529801==
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
<tr><td><b>Series:</b></td><td>xe: Test scratch page under fault mode (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/144907/">https://patchwork.freedesktop.org/series/144907/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12649/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12649/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8245 -&gt; IGTPW_12649</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12649/index.html</p>
<h2>Participating hosts (44 -&gt; 41)</h2>
<p>Missing    (3): fi-rkl-11600 fi-snb-2520m bat-adls-6 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_12649 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-twl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8245/bat-twl-2/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12649/bat-twl-2/igt@i915_selftest@live.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12919">i915#12919</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13503">i915#13503</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_engines:</p>
<ul>
<li>bat-twl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8245/bat-twl-2/igt@i915_selftest@live@gt_engines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12649/bat-twl-2/igt@i915_selftest@live@gt_engines.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12919">i915#12919</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8245 -&gt; IGTPW_12649</li>
<li>Linux: CI_DRM_16164 -&gt; CI_DRM_16167</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_16164: 8554d5b7b4fded481a85ab11d75eeb97443450e2 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_16167: a22ac320a08377d760e73fa530c27782f0b68b6d @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_12649: 271236dac27a9991d20fdd105fd5a93d48901912 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8245: 822e95b2560133bc21aa3065f70d7148f23f87cf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============1415056077556529801==--
