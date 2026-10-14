Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FCF1CC6B27
	for <igt-dev@archiver.kernel.org>; Wed, 14 Oct 2026 08:05:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4838A10E8EC;
	Wed, 14 Oct 2026 08:05:25 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FA6810E8EC;
 Wed, 14 Oct 2026 08:03:53 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2690288736636442673=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Fsync=5Ff?=
 =?utf-8?q?ile=3A_Fix_driver=5Fname_expectation_in_sync=5Ffile=5Frace?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 14 Oct 2026 08:03:53 -0000
Message-ID: <179196503331.22244.9211973878929064593@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261014061138.1748313-2-tejas.upadhyay@intel.com>
In-Reply-To: <20261014061138.1748313-2-tejas.upadhyay@intel.com>
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

--===============2690288736636442673==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_sync_file: Fix driver_name expectation in sync_file_race
URL   : https://patchwork.freedesktop.org/series/176099/
State : success

== Summary ==

CI Bug Log - changes from IGT_9145 -> IGTPW_15984
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15984/index.html

Participating hosts (38 -> 38)
------------------------------

  Additional (1): fi-glk-j4005 
  Missing    (1): bat-dg2-13 

Known issues
------------

  Here are the changes found in IGTPW_15984 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_huc_copy@huc-copy:
    - fi-glk-j4005:       NOTRUN -> [SKIP][1] ([i915#2190])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15984/fi-glk-j4005/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - fi-glk-j4005:       NOTRUN -> [SKIP][2] ([i915#4613]) +3 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15984/fi-glk-j4005/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@kms_psr@psr-primary-page-flip:
    - fi-glk-j4005:       NOTRUN -> [SKIP][3] +11 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15984/fi-glk-j4005/igt@kms_psr@psr-primary-page-flip.html

  
#### Possible fixes ####

  * igt@i915_pm_rpm@module-reload:
    - bat-adlp-6:         [DMESG-WARN][4] ([i915#15673]) -> [PASS][5] +78 other tests pass
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9145/bat-adlp-6/igt@i915_pm_rpm@module-reload.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15984/bat-adlp-6/igt@i915_pm_rpm@module-reload.html

  
  [i915#15673]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15673
  [i915#2190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9145 -> IGTPW_15984
  * Linux: CI_DRM_19334 -> CI_DRM_19336

  CI-20190529: 20190529
  CI_DRM_19334: 9c288c4ff8029788ae0bd13bb1f875bf3d9dc4f6 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_19336: c06d7623a198463e9aa2d09a3c33d96fe66ea662 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15984: 0579a5d020cddc1b0b9fbf30a25725a3a1ec7605 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9145: 05c13a14f7f8bcda7bff83b8aa033c3c47a4b1fb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15984/index.html

--===============2690288736636442673==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_sync_file: Fix driver_name expectation in sync_file_race</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/176099/">https://patchwork.freedesktop.org/series/176099/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15984/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15984/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_9145 -&gt; IGTPW_15984</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15984/index.html</p>
<h2>Participating hosts (38 -&gt; 38)</h2>
<p>Additional (1): fi-glk-j4005 <br />
  Missing    (1): bat-dg2-13 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_15984 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15984/fi-glk-j4005/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15984/fi-glk-j4005/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15984/fi-glk-j4005/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> +11 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_pm_rpm@module-reload:<ul>
<li>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9145/bat-adlp-6/igt@i915_pm_rpm@module-reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15673">i915#15673</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15984/bat-adlp-6/igt@i915_pm_rpm@module-reload.html">PASS</a> +78 other tests pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9145 -&gt; IGTPW_15984</li>
<li>Linux: CI_DRM_19334 -&gt; CI_DRM_19336</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19334: 9c288c4ff8029788ae0bd13bb1f875bf3d9dc4f6 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_19336: c06d7623a198463e9aa2d09a3c33d96fe66ea662 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15984: 0579a5d020cddc1b0b9fbf30a25725a3a1ec7605 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9145: 05c13a14f7f8bcda7bff83b8aa033c3c47a4b1fb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============2690288736636442673==--
