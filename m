Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8004C4828F
	for <igt-dev@archiver.kernel.org>; Fri,  9 Feb 2024 13:26:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ECDF10F416;
	Fri,  9 Feb 2024 13:26:19 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C218A10F3F3;
 Fri,  9 Feb 2024 13:26:17 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7540127773868595055=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_Fix_several_issues_when_pro?=
 =?utf-8?q?ducing_Intel_CI_testlists_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mauro Carvalho Chehab" <mauro.chehab@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 09 Feb 2024 13:26:17 -0000
Message-ID: <170748517779.1129552.4914188081504093978@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240209123543.289204-1-mauro.chehab@linux.intel.com>
In-Reply-To: <20240209123543.289204-1-mauro.chehab@linux.intel.com>
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

--===============7540127773868595055==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Fix several issues when producing Intel CI testlists (rev3)
URL   : https://patchwork.freedesktop.org/series/129708/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_14248 -> IGTPW_10657
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10657/index.html

Participating hosts (36 -> 36)
------------------------------

  Additional (2): fi-glk-j4005 fi-apl-guc 
  Missing    (2): bat-kbl-2 fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_10657:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@gem_exec_gttfill@basic:
    - {bat-arls-2}:       [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14248/bat-arls-2/igt@gem_exec_gttfill@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10657/bat-arls-2/igt@gem_exec_gttfill@basic.html

  
Known issues
------------

  Here are the changes found in IGTPW_10657 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_huc_copy@huc-copy:
    - fi-glk-j4005:       NOTRUN -> [SKIP][3] ([fdo#109271] / [i915#2190])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10657/fi-glk-j4005/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@basic:
    - fi-apl-guc:         NOTRUN -> [SKIP][4] ([fdo#109271] / [i915#4613]) +3 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10657/fi-apl-guc/igt@gem_lmem_swapping@basic.html
    - fi-glk-j4005:       NOTRUN -> [SKIP][5] ([fdo#109271] / [i915#4613]) +3 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10657/fi-glk-j4005/igt@gem_lmem_swapping@basic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - fi-glk-j4005:       NOTRUN -> [SKIP][6] ([fdo#109271]) +6 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10657/fi-glk-j4005/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_hdmi_inject@inject-audio:
    - fi-apl-guc:         NOTRUN -> [SKIP][7] ([fdo#109271]) +13 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10657/fi-apl-guc/igt@kms_hdmi_inject@inject-audio.html

  
#### Possible fixes ####

  * igt@gem_exec_fence@basic-busy@ccs0:
    - {bat-arls-1}:       [DMESG-WARN][8] ([i915#10194]) -> [PASS][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14248/bat-arls-1/igt@gem_exec_fence@basic-busy@ccs0.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10657/bat-arls-1/igt@gem_exec_fence@basic-busy@ccs0.html

  * igt@i915_selftest@live@hangcheck:
    - bat-mtlp-8:         [DMESG-WARN][10] -> [PASS][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14248/bat-mtlp-8/igt@i915_selftest@live@hangcheck.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10657/bat-mtlp-8/igt@i915_selftest@live@hangcheck.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#10194]: https://gitlab.freedesktop.org/drm/intel/issues/10194
  [i915#10197]: https://gitlab.freedesktop.org/drm/intel/issues/10197
  [i915#10206]: https://gitlab.freedesktop.org/drm/intel/issues/10206
  [i915#10211]: https://gitlab.freedesktop.org/drm/intel/issues/10211
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7708 -> IGTPW_10657

  CI-20190529: 20190529
  CI_DRM_14248: c7d234dd2d329f223f56699636248a609dbe2267 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10657: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10657/index.html
  IGT_7708: c2ecf4ba307d3342682745de6f608d307a06782c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

-igt@kms_ccs@pipe-a-bad-rotation-90-4-tiled-xe2-ccs
-igt@kms_ccs@pipe-a-crc-primary-basic-4-tiled-xe2-ccs
-igt@kms_ccs@pipe-a-crc-primary-rotation-180-4-tiled-xe2-ccs
-igt@kms_ccs@pipe-a-crc-sprite-planes-basic-4-tiled-xe2-ccs
-igt@kms_ccs@pipe-a-random-ccs-data-4-tiled-xe2-ccs
-igt@kms_ccs@pipe-b-bad-rotation-90-4-tiled-xe2-ccs
-igt@kms_ccs@pipe-b-crc-primary-basic-4-tiled-xe2-ccs
-igt@kms_ccs@pipe-b-crc-primary-rotation-180-4-tiled-xe2-ccs
-igt@kms_ccs@pipe-b-crc-sprite-planes-basic-4-tiled-xe2-ccs
-igt@kms_ccs@pipe-b-random-ccs-data-4-tiled-xe2-ccs
-igt@kms_ccs@pipe-c-bad-rotation-90-4-tiled-xe2-ccs
-igt@kms_ccs@pipe-c-crc-primary-basic-4-tiled-xe2-ccs
-igt@kms_ccs@pipe-c-crc-primary-rotation-180-4-tiled-xe2-ccs
-igt@kms_ccs@pipe-c-crc-sprite-planes-basic-4-tiled-xe2-ccs
-igt@kms_ccs@pipe-c-random-ccs-data-4-tiled-xe2-ccs
-igt@kms_ccs@pipe-d-bad-rotation-90-4-tiled-xe2-ccs
-igt@kms_ccs@pipe-d-crc-primary-basic-4-tiled-xe2-ccs
-igt@kms_ccs@pipe-d-crc-primary-rotation-180-4-tiled-xe2-ccs
-igt@kms_ccs@pipe-d-crc-sprite-planes-basic-4-tiled-xe2-ccs
-igt@kms_ccs@pipe-d-random-ccs-data-4-tiled-xe2-ccs
-igt@kms_ccs@pipe-e-bad-rotation-90-4-tiled-xe2-ccs
-igt@kms_ccs@pipe-e-crc-primary-basic-4-tiled-xe2-ccs
-igt@kms_ccs@pipe-e-crc-primary-rotation-180-4-tiled-xe2-ccs
-igt@kms_ccs@pipe-e-crc-sprite-planes-basic-4-tiled-xe2-ccs
-igt@kms_ccs@pipe-e-random-ccs-data-4-tiled-xe2-ccs
-igt@kms_ccs@pipe-f-bad-rotation-90-4-tiled-xe2-ccs
-igt@kms_ccs@pipe-f-crc-primary-basic-4-tiled-xe2-ccs
-igt@kms_ccs@pipe-f-crc-primary-rotation-180-4-tiled-xe2-ccs
-igt@kms_ccs@pipe-f-crc-sprite-planes-basic-4-tiled-xe2-ccs
-igt@kms_ccs@pipe-f-random-ccs-data-4-tiled-xe2-ccs
-igt@kms_ccs@pipe-g-bad-rotation-90-4-tiled-xe2-ccs
-igt@kms_ccs@pipe-g-crc-primary-basic-4-tiled-xe2-ccs
-igt@kms_ccs@pipe-g-crc-primary-rotation-180-4-tiled-xe2-ccs
-igt@kms_ccs@pipe-g-crc-sprite-planes-basic-4-tiled-xe2-ccs
-igt@kms_ccs@pipe-g-random-ccs-data-4-tiled-xe2-ccs
-igt@kms_ccs@pipe-h-bad-rotation-90-4-tiled-xe2-ccs
-igt@kms_ccs@pipe-h-crc-primary-basic-4-tiled-xe2-ccs
-igt@kms_ccs@pipe-h-crc-primary-rotation-180-4-tiled-xe2-ccs
-igt@kms_ccs@pipe-h-crc-sprite-planes-basic-4-tiled-xe2-ccs
-igt@kms_ccs@pipe-h-random-ccs-data-4-tiled-xe2-ccs
-igt@kms_ccs@pipe-i-bad-rotation-90-4-tiled-xe2-ccs
-igt@kms_ccs@pipe-i-crc-primary-basic-4-tiled-xe2-ccs
-igt@kms_ccs@pipe-i-crc-primary-rotation-180-4-tiled-xe2-ccs
-igt@kms_ccs@pipe-i-crc-sprite-planes-basic-4-tiled-xe2-ccs
-igt@kms_ccs@pipe-i-random-ccs-data-4-tiled-xe2-ccs
-igt@kms_ccs@pipe-j-bad-rotation-90-4-tiled-xe2-ccs
-igt@kms_ccs@pipe-j-crc-primary-basic-4-tiled-xe2-ccs
-igt@kms_ccs@pipe-j-crc-primary-rotation-180-4-tiled-xe2-ccs
-igt@kms_ccs@pipe-j-crc-sprite-planes-basic-4-tiled-xe2-ccs
-igt@kms_ccs@pipe-j-random-ccs-data-4-tiled-xe2-ccs
-igt@kms_ccs@pipe-k-bad-rotation-90-4-tiled-xe2-ccs
-igt@kms_ccs@pipe-k-crc-primary-basic-4-tiled-xe2-ccs
-igt@kms_ccs@pipe-k-crc-primary-rotation-180-4-tiled-xe2-ccs
-igt@kms_ccs@pipe-k-crc-sprite-planes-basic-4-tiled-xe2-ccs
-igt@kms_ccs@pipe-k-random-ccs-data-4-tiled-xe2-ccs
-igt@kms_ccs@pipe-l-bad-rotation-90-4-tiled-xe2-ccs
-igt@kms_ccs@pipe-l-crc-primary-basic-4-tiled-xe2-ccs
-igt@kms_ccs@pipe-l-crc-primary-rotation-180-4-tiled-xe2-ccs
-igt@kms_ccs@pipe-l-crc-sprite-planes-basic-4-tiled-xe2-ccs
-igt@kms_ccs@pipe-l-random-ccs-data-4-tiled-xe2-ccs
-igt@kms_ccs@pipe-m-bad-rotation-90-4-tiled-xe2-ccs
-igt@kms_ccs@pipe-m-crc-primary-basic-4-tiled-xe2-ccs
-igt@kms_ccs@pipe-m-crc-primary-rotation-180-4-tiled-xe2-ccs
-igt@kms_ccs@pipe-m-crc-sprite-planes-basic-4-tiled-xe2-ccs
-igt@kms_ccs@pipe-m-random-ccs-data-4-tiled-xe2-ccs
-igt@kms_ccs@pipe-n-bad-rotation-90-4-tiled-xe2-ccs
-igt@kms_ccs@pipe-n-crc-primary-basic-4-tiled-xe2-ccs
-igt@kms_ccs@pipe-n-crc-primary-rotation-180-4-tiled-xe2-ccs
-igt@kms_ccs@pipe-n-crc-sprite-planes-basic-4-tiled-xe2-ccs
-igt@kms_ccs@pipe-n-random-ccs-data-4-tiled-xe2-ccs
-igt@kms_ccs@pipe-o-bad-rotation-90-4-tiled-xe2-ccs
-igt@kms_ccs@pipe-o-crc-primary-basic-4-tiled-xe2-ccs
-igt@kms_ccs@pipe-o-crc-primary-rotation-180-4-tiled-xe2-ccs
-igt@kms_ccs@pipe-o-crc-sprite-planes-basic-4-tiled-xe2-ccs
-igt@kms_ccs@pipe-o-random-ccs-data-4-tiled-xe2-ccs
-igt@kms_ccs@pipe-p-bad-rotation-90-4-tiled-xe2-ccs
-igt@kms_ccs@pipe-p-crc-primary-basic-4-tiled-xe2-ccs
-igt@kms_ccs@pipe-p-crc-primary-rotation-180-4-tiled-xe2-ccs
-igt@kms_ccs@pipe-p-crc-sprite-planes-basic-4-tiled-xe2-ccs
-igt@kms_ccs@pipe-p-random-ccs-data-4-tiled-xe2-ccs

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10657/index.html

--===============7540127773868595055==
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
<tr><td><b>Series:</b></td><td>Fix several issues when producing Intel CI testlists (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/129708/">https://patchwork.freedesktop.org/series/129708/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10657/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10657/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_14248 -&gt; IGTPW_10657</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10657/index.html</p>
<h2>Participating hosts (36 -&gt; 36)</h2>
<p>Additional (2): fi-glk-j4005 fi-apl-guc <br />
  Missing    (2): bat-kbl-2 fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_10657:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@gem_exec_gttfill@basic:<ul>
<li>{bat-arls-2}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14248/bat-arls-2/igt@gem_exec_gttfill@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10657/bat-arls-2/igt@gem_exec_gttfill@basic.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10657 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10657/fi-glk-j4005/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10657/fi-apl-guc/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 other tests skip</li>
<li>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10657/fi-glk-j4005/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10657/fi-glk-j4005/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10657/fi-apl-guc/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +13 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_fence@basic-busy@ccs0:</p>
<ul>
<li>{bat-arls-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14248/bat-arls-1/igt@gem_exec_fence@basic-busy@ccs0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10194">i915#10194</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10657/bat-arls-1/igt@gem_exec_fence@basic-busy@ccs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14248/bat-mtlp-8/igt@i915_selftest@live@hangcheck.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10657/bat-mtlp-8/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7708 -&gt; IGTPW_10657</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14248: c7d234dd2d329f223f56699636248a609dbe2267 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10657: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10657/index.html<br />
  IGT_7708: c2ecf4ba307d3342682745de6f608d307a06782c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>-igt@kms_ccs@pipe-a-bad-rotation-90-4-tiled-xe2-ccs<br />
-igt@kms_ccs@pipe-a-crc-primary-basic-4-tiled-xe2-ccs<br />
-igt@kms_ccs@pipe-a-crc-primary-rotation-180-4-tiled-xe2-ccs<br />
-igt@kms_ccs@pipe-a-crc-sprite-planes-basic-4-tiled-xe2-ccs<br />
-igt@kms_ccs@pipe-a-random-ccs-data-4-tiled-xe2-ccs<br />
-igt@kms_ccs@pipe-b-bad-rotation-90-4-tiled-xe2-ccs<br />
-igt@kms_ccs@pipe-b-crc-primary-basic-4-tiled-xe2-ccs<br />
-igt@kms_ccs@pipe-b-crc-primary-rotation-180-4-tiled-xe2-ccs<br />
-igt@kms_ccs@pipe-b-crc-sprite-planes-basic-4-tiled-xe2-ccs<br />
-igt@kms_ccs@pipe-b-random-ccs-data-4-tiled-xe2-ccs<br />
-igt@kms_ccs@pipe-c-bad-rotation-90-4-tiled-xe2-ccs<br />
-igt@kms_ccs@pipe-c-crc-primary-basic-4-tiled-xe2-ccs<br />
-igt@kms_ccs@pipe-c-crc-primary-rotation-180-4-tiled-xe2-ccs<br />
-igt@kms_ccs@pipe-c-crc-sprite-planes-basic-4-tiled-xe2-ccs<br />
-igt@kms_ccs@pipe-c-random-ccs-data-4-tiled-xe2-ccs<br />
-igt@kms_ccs@pipe-d-bad-rotation-90-4-tiled-xe2-ccs<br />
-igt@kms_ccs@pipe-d-crc-primary-basic-4-tiled-xe2-ccs<br />
-igt@kms_ccs@pipe-d-crc-primary-rotation-180-4-tiled-xe2-ccs<br />
-igt@kms_ccs@pipe-d-crc-sprite-planes-basic-4-tiled-xe2-ccs<br />
-igt@kms_ccs@pipe-d-random-ccs-data-4-tiled-xe2-ccs<br />
-igt@kms_ccs@pipe-e-bad-rotation-90-4-tiled-xe2-ccs<br />
-igt@kms_ccs@pipe-e-crc-primary-basic-4-tiled-xe2-ccs<br />
-igt@kms_ccs@pipe-e-crc-primary-rotation-180-4-tiled-xe2-ccs<br />
-igt@kms_ccs@pipe-e-crc-sprite-planes-basic-4-tiled-xe2-ccs<br />
-igt@kms_ccs@pipe-e-random-ccs-data-4-tiled-xe2-ccs<br />
-igt@kms_ccs@pipe-f-bad-rotation-90-4-tiled-xe2-ccs<br />
-igt@kms_ccs@pipe-f-crc-primary-basic-4-tiled-xe2-ccs<br />
-igt@kms_ccs@pipe-f-crc-primary-rotation-180-4-tiled-xe2-ccs<br />
-igt@kms_ccs@pipe-f-crc-sprite-planes-basic-4-tiled-xe2-ccs<br />
-igt@kms_ccs@pipe-f-random-ccs-data-4-tiled-xe2-ccs<br />
-igt@kms_ccs@pipe-g-bad-rotation-90-4-tiled-xe2-ccs<br />
-igt@kms_ccs@pipe-g-crc-primary-basic-4-tiled-xe2-ccs<br />
-igt@kms_ccs@pipe-g-crc-primary-rotation-180-4-tiled-xe2-ccs<br />
-igt@kms_ccs@pipe-g-crc-sprite-planes-basic-4-tiled-xe2-ccs<br />
-igt@kms_ccs@pipe-g-random-ccs-data-4-tiled-xe2-ccs<br />
-igt@kms_ccs@pipe-h-bad-rotation-90-4-tiled-xe2-ccs<br />
-igt@kms_ccs@pipe-h-crc-primary-basic-4-tiled-xe2-ccs<br />
-igt@kms_ccs@pipe-h-crc-primary-rotation-180-4-tiled-xe2-ccs<br />
-igt@kms_ccs@pipe-h-crc-sprite-planes-basic-4-tiled-xe2-ccs<br />
-igt@kms_ccs@pipe-h-random-ccs-data-4-tiled-xe2-ccs<br />
-igt@kms_ccs@pipe-i-bad-rotation-90-4-tiled-xe2-ccs<br />
-igt@kms_ccs@pipe-i-crc-primary-basic-4-tiled-xe2-ccs<br />
-igt@kms_ccs@pipe-i-crc-primary-rotation-180-4-tiled-xe2-ccs<br />
-igt@kms_ccs@pipe-i-crc-sprite-planes-basic-4-tiled-xe2-ccs<br />
-igt@kms_ccs@pipe-i-random-ccs-data-4-tiled-xe2-ccs<br />
-igt@kms_ccs@pipe-j-bad-rotation-90-4-tiled-xe2-ccs<br />
-igt@kms_ccs@pipe-j-crc-primary-basic-4-tiled-xe2-ccs<br />
-igt@kms_ccs@pipe-j-crc-primary-rotation-180-4-tiled-xe2-ccs<br />
-igt@kms_ccs@pipe-j-crc-sprite-planes-basic-4-tiled-xe2-ccs<br />
-igt@kms_ccs@pipe-j-random-ccs-data-4-tiled-xe2-ccs<br />
-igt@kms_ccs@pipe-k-bad-rotation-90-4-tiled-xe2-ccs<br />
-igt@kms_ccs@pipe-k-crc-primary-basic-4-tiled-xe2-ccs<br />
-igt@kms_ccs@pipe-k-crc-primary-rotation-180-4-tiled-xe2-ccs<br />
-igt@kms_ccs@pipe-k-crc-sprite-planes-basic-4-tiled-xe2-ccs<br />
-igt@kms_ccs@pipe-k-random-ccs-data-4-tiled-xe2-ccs<br />
-igt@kms_ccs@pipe-l-bad-rotation-90-4-tiled-xe2-ccs<br />
-igt@kms_ccs@pipe-l-crc-primary-basic-4-tiled-xe2-ccs<br />
-igt@kms_ccs@pipe-l-crc-primary-rotation-180-4-tiled-xe2-ccs<br />
-igt@kms_ccs@pipe-l-crc-sprite-planes-basic-4-tiled-xe2-ccs<br />
-igt@kms_ccs@pipe-l-random-ccs-data-4-tiled-xe2-ccs<br />
-igt@kms_ccs@pipe-m-bad-rotation-90-4-tiled-xe2-ccs<br />
-igt@kms_ccs@pipe-m-crc-primary-basic-4-tiled-xe2-ccs<br />
-igt@kms_ccs@pipe-m-crc-primary-rotation-180-4-tiled-xe2-ccs<br />
-igt@kms_ccs@pipe-m-crc-sprite-planes-basic-4-tiled-xe2-ccs<br />
-igt@kms_ccs@pipe-m-random-ccs-data-4-tiled-xe2-ccs<br />
-igt@kms_ccs@pipe-n-bad-rotation-90-4-tiled-xe2-ccs<br />
-igt@kms_ccs@pipe-n-crc-primary-basic-4-tiled-xe2-ccs<br />
-igt@kms_ccs@pipe-n-crc-primary-rotation-180-4-tiled-xe2-ccs<br />
-igt@kms_ccs@pipe-n-crc-sprite-planes-basic-4-tiled-xe2-ccs<br />
-igt@kms_ccs@pipe-n-random-ccs-data-4-tiled-xe2-ccs<br />
-igt@kms_ccs@pipe-o-bad-rotation-90-4-tiled-xe2-ccs<br />
-igt@kms_ccs@pipe-o-crc-primary-basic-4-tiled-xe2-ccs<br />
-igt@kms_ccs@pipe-o-crc-primary-rotation-180-4-tiled-xe2-ccs<br />
-igt@kms_ccs@pipe-o-crc-sprite-planes-basic-4-tiled-xe2-ccs<br />
-igt@kms_ccs@pipe-o-random-ccs-data-4-tiled-xe2-ccs<br />
-igt@kms_ccs@pipe-p-bad-rotation-90-4-tiled-xe2-ccs<br />
-igt@kms_ccs@pipe-p-crc-primary-basic-4-tiled-xe2-ccs<br />
-igt@kms_ccs@pipe-p-crc-primary-rotation-180-4-tiled-xe2-ccs<br />
-igt@kms_ccs@pipe-p-crc-sprite-planes-basic-4-tiled-xe2-ccs<br />
-igt@kms_ccs@pipe-p-random-ccs-data-4-tiled-xe2-ccs</p>

</body>
</html>

--===============7540127773868595055==--
