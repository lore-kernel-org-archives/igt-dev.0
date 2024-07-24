Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 810BCC3DA63
	for <igt-dev@archiver.kernel.org>; Wed, 24 Jul 2024 09:04:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F19CC10E567;
	Wed, 24 Jul 2024 09:04:51 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ADE310E567;
 Wed, 24 Jul 2024 09:04:49 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5806681322439625699=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_series_starting_with_=5Bi-g?=
 =?utf-8?q?-t=2C1/2=5D_lib/drmtest=3A_Ensure_the_XE_driver_is_idle_before_st?=
 =?utf-8?q?arting_a_test?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 24 Jul 2024 09:04:49 -0000
Message-ID: <172181188909.361450.2069751846744089022@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240724070544.1734040-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20240724070544.1734040-1-bhanuprakash.modem@intel.com>
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

--===============5806681322439625699==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,1/2] lib/drmtest: Ensure the XE driver is idle before starting a test
URL   : https://patchwork.freedesktop.org/series/136408/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_15121 -> IGTPW_11445
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11445/index.html

Participating hosts (43 -> 41)
------------------------------

  Missing    (2): bat-jsl-1 fi-snb-2520m 

New tests
---------

  New tests have been introduced between CI_DRM_15121 and IGTPW_11445:

### New IGT tests (9) ###

  * igt@kms_rmfb@close-fd@pipe-b-dp-3:
    - Statuses : 2 pass(s)
    - Exec time: [0.35, 0.56] s

  * igt@kms_rmfb@close-fd@pipe-b-vga-1:
    - Statuses : 4 pass(s)
    - Exec time: [0.15, 0.33] s

  * igt@kms_rmfb@close-fd@pipe-c-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.19] s

  * igt@kms_rmfb@close-fd@pipe-d-dp-3:
    - Statuses : 2 pass(s)
    - Exec time: [0.30, 0.34] s

  * igt@kms_rmfb@rmfb-ioctl@pipe-a-vga-1:
    - Statuses : 4 pass(s)
    - Exec time: [0.07, 0.12] s

  * igt@kms_rmfb@rmfb-ioctl@pipe-b-dp-3:
    - Statuses : 2 pass(s)
    - Exec time: [0.31, 0.57] s

  * igt@kms_rmfb@rmfb-ioctl@pipe-b-vga-1:
    - Statuses : 4 pass(s)
    - Exec time: [0.14, 0.31] s

  * igt@kms_rmfb@rmfb-ioctl@pipe-c-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.19] s

  * igt@kms_rmfb@rmfb-ioctl@pipe-d-dp-3:
    - Statuses : 2 pass(s)
    - Exec time: [0.31, 0.33] s

  

Known issues
------------

  Here are the changes found in IGTPW_11445 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_rmfb@close-fd:
    - bat-adlp-11:        NOTRUN -> [SKIP][1] ([i915#10470])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11445/bat-adlp-11/igt@kms_rmfb@close-fd.html

  * igt@kms_rmfb@rmfb-ioctl:
    - bat-kbl-2:          NOTRUN -> [SKIP][2] +1 other test skip
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11445/bat-kbl-2/igt@kms_rmfb@rmfb-ioctl.html
    - bat-atsm-1:         NOTRUN -> [SKIP][3] ([i915#6078]) +1 other test skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11445/bat-atsm-1/igt@kms_rmfb@rmfb-ioctl.html
    - fi-kbl-guc:         NOTRUN -> [SKIP][4] +1 other test skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11445/fi-kbl-guc/igt@kms_rmfb@rmfb-ioctl.html
    - bat-adlm-1:         NOTRUN -> [SKIP][5] ([i915#9900]) +1 other test skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11445/bat-adlm-1/igt@kms_rmfb@rmfb-ioctl.html
    - bat-arlh-2:         NOTRUN -> [SKIP][6] ([i915#11346]) +1 other test skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11445/bat-arlh-2/igt@kms_rmfb@rmfb-ioctl.html
    - bat-dg2-9:          NOTRUN -> [SKIP][7] ([i915#9197]) +1 other test skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11445/bat-dg2-9/igt@kms_rmfb@rmfb-ioctl.html
    - fi-kbl-x1275:       NOTRUN -> [SKIP][8] +1 other test skip
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11445/fi-kbl-x1275/igt@kms_rmfb@rmfb-ioctl.html
    - bat-adlp-11:        NOTRUN -> [SKIP][9] ([i915#10470] / [i915#10501])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11445/bat-adlp-11/igt@kms_rmfb@rmfb-ioctl.html
    - fi-kbl-8809g:       NOTRUN -> [SKIP][10] +1 other test skip
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11445/fi-kbl-8809g/igt@kms_rmfb@rmfb-ioctl.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][11] ([i915#9792]) +1 other test skip
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11445/bat-mtlp-6/igt@kms_rmfb@rmfb-ioctl.html

  
  [i915#10470]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10470
  [i915#10501]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10501
  [i915#11346]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346
  [i915#6078]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6078
  [i915#9197]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9197
  [i915#9792]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792
  [i915#9900]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9900


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7936 -> IGTPW_11445

  CI-20190529: 20190529
  CI_DRM_15121: 0083605e0d301daa8f687894b117cd35dace1bd1 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_11445: a496e395191a830024be2edee464e86363749249 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7936: 7936

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11445/index.html

--===============5806681322439625699==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,1/2] lib/drmtest: Ensure the XE driver is idle before starting a test</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/136408/">https://patchwork.freedesktop.org/series/136408/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11445/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11445/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_15121 -&gt; IGTPW_11445</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11445/index.html</p>
<h2>Participating hosts (43 -&gt; 41)</h2>
<p>Missing    (2): bat-jsl-1 fi-snb-2520m </p>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_15121 and IGTPW_11445:</p>
<h3>New IGT tests (9)</h3>
<ul>
<li>
<p>igt@kms_rmfb@close-fd@pipe-b-dp-3:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.35, 0.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_rmfb@close-fd@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.15, 0.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_rmfb@close-fd@pipe-c-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_rmfb@close-fd@pipe-d-dp-3:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.30, 0.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_rmfb@rmfb-ioctl@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.07, 0.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_rmfb@rmfb-ioctl@pipe-b-dp-3:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.31, 0.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_rmfb@rmfb-ioctl@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.14, 0.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_rmfb@rmfb-ioctl@pipe-c-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_rmfb@rmfb-ioctl@pipe-d-dp-3:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.31, 0.33] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11445 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_rmfb@close-fd:</p>
<ul>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11445/bat-adlp-11/igt@kms_rmfb@close-fd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10470">i915#10470</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rmfb@rmfb-ioctl:</p>
<ul>
<li>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11445/bat-kbl-2/igt@kms_rmfb@rmfb-ioctl.html">SKIP</a> +1 other test skip</li>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11445/bat-atsm-1/igt@kms_rmfb@rmfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6078">i915#6078</a>) +1 other test skip</li>
<li>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11445/fi-kbl-guc/igt@kms_rmfb@rmfb-ioctl.html">SKIP</a> +1 other test skip</li>
<li>bat-adlm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11445/bat-adlm-1/igt@kms_rmfb@rmfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9900">i915#9900</a>) +1 other test skip</li>
<li>bat-arlh-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11445/bat-arlh-2/igt@kms_rmfb@rmfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a>) +1 other test skip</li>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11445/bat-dg2-9/igt@kms_rmfb@rmfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9197">i915#9197</a>) +1 other test skip</li>
<li>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11445/fi-kbl-x1275/igt@kms_rmfb@rmfb-ioctl.html">SKIP</a> +1 other test skip</li>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11445/bat-adlp-11/igt@kms_rmfb@rmfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10470">i915#10470</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10501">i915#10501</a>)</li>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11445/fi-kbl-8809g/igt@kms_rmfb@rmfb-ioctl.html">SKIP</a> +1 other test skip</li>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11445/bat-mtlp-6/igt@kms_rmfb@rmfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792">i915#9792</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7936 -&gt; IGTPW_11445</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_15121: 0083605e0d301daa8f687894b117cd35dace1bd1 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_11445: a496e395191a830024be2edee464e86363749249 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7936: 7936</p>

</body>
</html>

--===============5806681322439625699==--
