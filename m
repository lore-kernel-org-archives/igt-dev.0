Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E371C5516E
	for <igt-dev@archiver.kernel.org>; Thu, 30 Jul 2026 18:22:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE6BB10F019;
	Thu, 30 Jul 2026 18:22:03 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 423EB10F019;
 Thu, 30 Jul 2026 18:21:29 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6823154964679299903=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_tests/intel/hwmon=3A_Add_?=
 =?utf-8?q?fan_control_test_coverage?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karthik Poosa" <karthik.poosa@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 30 Jul 2026 18:21:29 -0000
Message-ID: <178543568926.6317.6083743498573434464@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260730170752.3750843-1-karthik.poosa@intel.com>
In-Reply-To: <20260730170752.3750843-1-karthik.poosa@intel.com>
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

--===============6823154964679299903==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/hwmon: Add fan control test coverage
URL   : https://patchwork.freedesktop.org/series/171363/
State : success

== Summary ==

CI Bug Log - changes from IGT_9034 -> IGTPW_15612
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/index.html

Participating hosts (41 -> 39)
------------------------------

  Missing    (2): bat-dg2-13 fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_15612:

### IGT changes ###

#### Possible regressions ####

  * {igt@intel_hwmon@fan-negative-tests} (NEW):
    - bat-arlh-3:         NOTRUN -> [SKIP][1] +8 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/bat-arlh-3/igt@intel_hwmon@fan-negative-tests.html

  * {igt@intel_hwmon@fan-pwm-enable-modes} (NEW):
    - bat-dg1-6:          NOTRUN -> [SKIP][2] +8 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/bat-dg1-6/igt@intel_hwmon@fan-pwm-enable-modes.html
    - bat-twl-2:          NOTRUN -> [SKIP][3] +8 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/bat-twl-2/igt@intel_hwmon@fan-pwm-enable-modes.html
    - bat-dg2-14:         NOTRUN -> [SKIP][4] +8 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/bat-dg2-14/igt@intel_hwmon@fan-pwm-enable-modes.html

  * {igt@intel_hwmon@fan-suspend-resume-with-user-table-disk} (NEW):
    - bat-dg1-7:          NOTRUN -> [SKIP][5] +8 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/bat-dg1-7/igt@intel_hwmon@fan-suspend-resume-with-user-table-disk.html
    - bat-dg2-9:          NOTRUN -> [SKIP][6] +8 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/bat-dg2-9/igt@intel_hwmon@fan-suspend-resume-with-user-table-disk.html
    - bat-adlp-11:        NOTRUN -> [SKIP][7] +8 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/bat-adlp-11/igt@intel_hwmon@fan-suspend-resume-with-user-table-disk.html
    - bat-rpls-4:         NOTRUN -> [SKIP][8] +8 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/bat-rpls-4/igt@intel_hwmon@fan-suspend-resume-with-user-table-disk.html
    - bat-jsl-5:          NOTRUN -> [SKIP][9] +8 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/bat-jsl-5/igt@intel_hwmon@fan-suspend-resume-with-user-table-disk.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][10] +8 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/fi-tgl-1115g4/igt@intel_hwmon@fan-suspend-resume-with-user-table-disk.html

  * {igt@intel_hwmon@fan-suspend-resume-with-user-table-freeze} (NEW):
    - bat-mtlp-8:         NOTRUN -> [SKIP][11] +8 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/bat-mtlp-8/igt@intel_hwmon@fan-suspend-resume-with-user-table-freeze.html
    - bat-dg2-8:          NOTRUN -> [SKIP][12] +8 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/bat-dg2-8/igt@intel_hwmon@fan-suspend-resume-with-user-table-freeze.html

  * {igt@intel_hwmon@fan-suspend-resume-with-user-table-mem} (NEW):
    - bat-mtlp-9:         NOTRUN -> [SKIP][13] +8 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/bat-mtlp-9/igt@intel_hwmon@fan-suspend-resume-with-user-table-mem.html
    - bat-arls-6:         NOTRUN -> [SKIP][14] +8 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/bat-arls-6/igt@intel_hwmon@fan-suspend-resume-with-user-table-mem.html
    - bat-adls-6:         NOTRUN -> [SKIP][15] +8 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/bat-adls-6/igt@intel_hwmon@fan-suspend-resume-with-user-table-mem.html

  * {igt@intel_hwmon@fan-suspend-resume-without-user-table-disk} (NEW):
    - bat-adlp-6:         NOTRUN -> [SKIP][16] +8 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/bat-adlp-6/igt@intel_hwmon@fan-suspend-resume-without-user-table-disk.html
    - bat-atsm-1:         NOTRUN -> [SKIP][17] +8 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/bat-atsm-1/igt@intel_hwmon@fan-suspend-resume-without-user-table-disk.html

  * {igt@intel_hwmon@fan-suspend-resume-without-user-table-mem} (NEW):
    - bat-adlp-9:         NOTRUN -> [SKIP][18] +8 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/bat-adlp-9/igt@intel_hwmon@fan-suspend-resume-without-user-table-mem.html
    - bat-twl-1:          NOTRUN -> [SKIP][19] +8 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/bat-twl-1/igt@intel_hwmon@fan-suspend-resume-without-user-table-mem.html
    - bat-rplp-1:         NOTRUN -> [SKIP][20] +8 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/bat-rplp-1/igt@intel_hwmon@fan-suspend-resume-without-user-table-mem.html
    - fi-rkl-11600:       NOTRUN -> [SKIP][21] +8 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/fi-rkl-11600/igt@intel_hwmon@fan-suspend-resume-without-user-table-mem.html

  
New tests
---------

  New tests have been introduced between IGT_9034 and IGTPW_15612:

### New IGT tests (9) ###

  * igt@intel_hwmon@fan-curve-setup:
    - Statuses : 39 skip(s)
    - Exec time: [0.0, 0.06] s

  * igt@intel_hwmon@fan-negative-tests:
    - Statuses : 39 skip(s)
    - Exec time: [0.0, 0.06] s

  * igt@intel_hwmon@fan-pwm-enable-modes:
    - Statuses : 39 skip(s)
    - Exec time: [0.0, 0.06] s

  * igt@intel_hwmon@fan-suspend-resume-with-user-table-disk:
    - Statuses : 39 skip(s)
    - Exec time: [0.0, 0.06] s

  * igt@intel_hwmon@fan-suspend-resume-with-user-table-freeze:
    - Statuses : 39 skip(s)
    - Exec time: [0.0, 0.06] s

  * igt@intel_hwmon@fan-suspend-resume-with-user-table-mem:
    - Statuses : 39 skip(s)
    - Exec time: [0.0, 0.06] s

  * igt@intel_hwmon@fan-suspend-resume-without-user-table-disk:
    - Statuses : 39 skip(s)
    - Exec time: [0.0, 0.06] s

  * igt@intel_hwmon@fan-suspend-resume-without-user-table-freeze:
    - Statuses : 39 skip(s)
    - Exec time: [0.0, 0.06] s

  * igt@intel_hwmon@fan-suspend-resume-without-user-table-mem:
    - Statuses : 39 skip(s)
    - Exec time: [0.0, 0.06] s

  

Known issues
------------

  Here are the changes found in IGTPW_15612 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * {igt@intel_hwmon@fan-curve-setup} (NEW):
    - fi-hsw-4770:        NOTRUN -> [SKIP][22] +8 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/fi-hsw-4770/igt@intel_hwmon@fan-curve-setup.html

  * {igt@intel_hwmon@fan-negative-tests} (NEW):
    - fi-bsw-n3050:       NOTRUN -> [SKIP][23] +8 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/fi-bsw-n3050/igt@intel_hwmon@fan-negative-tests.html

  * {igt@intel_hwmon@fan-pwm-enable-modes} (NEW):
    - fi-cfl-8700k:       NOTRUN -> [SKIP][24] +8 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/fi-cfl-8700k/igt@intel_hwmon@fan-pwm-enable-modes.html
    - bat-kbl-2:          NOTRUN -> [SKIP][25] +8 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/bat-kbl-2/igt@intel_hwmon@fan-pwm-enable-modes.html

  * {igt@intel_hwmon@fan-suspend-resume-with-user-table-disk} (NEW):
    - fi-kbl-x1275:       NOTRUN -> [SKIP][26] +8 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/fi-kbl-x1275/igt@intel_hwmon@fan-suspend-resume-with-user-table-disk.html
    - fi-cfl-8109u:       NOTRUN -> [SKIP][27] +8 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/fi-cfl-8109u/igt@intel_hwmon@fan-suspend-resume-with-user-table-disk.html
    - fi-kbl-7567u:       NOTRUN -> [SKIP][28] +8 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/fi-kbl-7567u/igt@intel_hwmon@fan-suspend-resume-with-user-table-disk.html
    - fi-kbl-8809g:       NOTRUN -> [SKIP][29] +8 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/fi-kbl-8809g/igt@intel_hwmon@fan-suspend-resume-with-user-table-disk.html
    - fi-ilk-650:         NOTRUN -> [SKIP][30] +8 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/fi-ilk-650/igt@intel_hwmon@fan-suspend-resume-with-user-table-disk.html
    - fi-cfl-guc:         NOTRUN -> [SKIP][31] +8 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/fi-cfl-guc/igt@intel_hwmon@fan-suspend-resume-with-user-table-disk.html
    - fi-skl-6600u:       NOTRUN -> [SKIP][32] +8 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/fi-skl-6600u/igt@intel_hwmon@fan-suspend-resume-with-user-table-disk.html

  * {igt@intel_hwmon@fan-suspend-resume-with-user-table-freeze} (NEW):
    - fi-ivb-3770:        NOTRUN -> [SKIP][33] +8 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/fi-ivb-3770/igt@intel_hwmon@fan-suspend-resume-with-user-table-freeze.html
    - fi-elk-e7500:       NOTRUN -> [SKIP][34] +8 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/fi-elk-e7500/igt@intel_hwmon@fan-suspend-resume-with-user-table-freeze.html
    - fi-bsw-nick:        NOTRUN -> [SKIP][35] +8 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/fi-bsw-nick/igt@intel_hwmon@fan-suspend-resume-with-user-table-freeze.html

  * {igt@intel_hwmon@fan-suspend-resume-with-user-table-mem} (NEW):
    - fi-pnv-d510:        NOTRUN -> [SKIP][36] +8 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/fi-pnv-d510/igt@intel_hwmon@fan-suspend-resume-with-user-table-mem.html

  * {igt@intel_hwmon@fan-suspend-resume-without-user-table-freeze} (NEW):
    - fi-glk-j4005:       NOTRUN -> [SKIP][37] +8 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/fi-glk-j4005/igt@intel_hwmon@fan-suspend-resume-without-user-table-freeze.html

  * {igt@intel_hwmon@fan-suspend-resume-without-user-table-mem} (NEW):
    - bat-apl-1:          NOTRUN -> [SKIP][38] +8 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/bat-apl-1/igt@intel_hwmon@fan-suspend-resume-without-user-table-mem.html
    - bat-arlh-2:         NOTRUN -> [SKIP][39] ([i915#11346]) +8 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/bat-arlh-2/igt@intel_hwmon@fan-suspend-resume-without-user-table-mem.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#11346]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9034 -> IGTPW_15612

  CI-20190529: 20190529
  CI_DRM_18925: 5e24f68d311764bf343f9def49b752b509dfd5fd @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15612: 15612
  IGT_9034: be1d1af352dbd4ca4557202a8ed0d6d60f95e0bf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/index.html

--===============6823154964679299903==
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
<tr><td><b>Series:</b></td><td>tests/intel/hwmon: Add fan control test coverage</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/171363/">https://patchwork.freedesktop.org/series/171363/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_9034 -&gt; IGTPW_15612</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/index.html</p>
<h2>Participating hosts (41 -&gt; 39)</h2>
<p>Missing    (2): bat-dg2-13 fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_15612:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@intel_hwmon@fan-negative-tests} (NEW):</p>
<ul>
<li>bat-arlh-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/bat-arlh-3/igt@intel_hwmon@fan-negative-tests.html">SKIP</a> +8 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@intel_hwmon@fan-pwm-enable-modes} (NEW):</p>
<ul>
<li>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/bat-dg1-6/igt@intel_hwmon@fan-pwm-enable-modes.html">SKIP</a> +8 other tests skip</li>
<li>bat-twl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/bat-twl-2/igt@intel_hwmon@fan-pwm-enable-modes.html">SKIP</a> +8 other tests skip</li>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/bat-dg2-14/igt@intel_hwmon@fan-pwm-enable-modes.html">SKIP</a> +8 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@intel_hwmon@fan-suspend-resume-with-user-table-disk} (NEW):</p>
<ul>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/bat-dg1-7/igt@intel_hwmon@fan-suspend-resume-with-user-table-disk.html">SKIP</a> +8 other tests skip</li>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/bat-dg2-9/igt@intel_hwmon@fan-suspend-resume-with-user-table-disk.html">SKIP</a> +8 other tests skip</li>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/bat-adlp-11/igt@intel_hwmon@fan-suspend-resume-with-user-table-disk.html">SKIP</a> +8 other tests skip</li>
<li>bat-rpls-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/bat-rpls-4/igt@intel_hwmon@fan-suspend-resume-with-user-table-disk.html">SKIP</a> +8 other tests skip</li>
<li>bat-jsl-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/bat-jsl-5/igt@intel_hwmon@fan-suspend-resume-with-user-table-disk.html">SKIP</a> +8 other tests skip</li>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/fi-tgl-1115g4/igt@intel_hwmon@fan-suspend-resume-with-user-table-disk.html">SKIP</a> +8 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@intel_hwmon@fan-suspend-resume-with-user-table-freeze} (NEW):</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/bat-mtlp-8/igt@intel_hwmon@fan-suspend-resume-with-user-table-freeze.html">SKIP</a> +8 other tests skip</li>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/bat-dg2-8/igt@intel_hwmon@fan-suspend-resume-with-user-table-freeze.html">SKIP</a> +8 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@intel_hwmon@fan-suspend-resume-with-user-table-mem} (NEW):</p>
<ul>
<li>bat-mtlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/bat-mtlp-9/igt@intel_hwmon@fan-suspend-resume-with-user-table-mem.html">SKIP</a> +8 other tests skip</li>
<li>bat-arls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/bat-arls-6/igt@intel_hwmon@fan-suspend-resume-with-user-table-mem.html">SKIP</a> +8 other tests skip</li>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/bat-adls-6/igt@intel_hwmon@fan-suspend-resume-with-user-table-mem.html">SKIP</a> +8 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@intel_hwmon@fan-suspend-resume-without-user-table-disk} (NEW):</p>
<ul>
<li>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/bat-adlp-6/igt@intel_hwmon@fan-suspend-resume-without-user-table-disk.html">SKIP</a> +8 other tests skip</li>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/bat-atsm-1/igt@intel_hwmon@fan-suspend-resume-without-user-table-disk.html">SKIP</a> +8 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@intel_hwmon@fan-suspend-resume-without-user-table-mem} (NEW):</p>
<ul>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/bat-adlp-9/igt@intel_hwmon@fan-suspend-resume-without-user-table-mem.html">SKIP</a> +8 other tests skip</li>
<li>bat-twl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/bat-twl-1/igt@intel_hwmon@fan-suspend-resume-without-user-table-mem.html">SKIP</a> +8 other tests skip</li>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/bat-rplp-1/igt@intel_hwmon@fan-suspend-resume-without-user-table-mem.html">SKIP</a> +8 other tests skip</li>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/fi-rkl-11600/igt@intel_hwmon@fan-suspend-resume-without-user-table-mem.html">SKIP</a> +8 other tests skip</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_9034 and IGTPW_15612:</p>
<h3>New IGT tests (9)</h3>
<ul>
<li>
<p>igt@intel_hwmon@fan-curve-setup:</p>
<ul>
<li>Statuses : 39 skip(s)</li>
<li>Exec time: [0.0, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@fan-negative-tests:</p>
<ul>
<li>Statuses : 39 skip(s)</li>
<li>Exec time: [0.0, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@fan-pwm-enable-modes:</p>
<ul>
<li>Statuses : 39 skip(s)</li>
<li>Exec time: [0.0, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@fan-suspend-resume-with-user-table-disk:</p>
<ul>
<li>Statuses : 39 skip(s)</li>
<li>Exec time: [0.0, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@fan-suspend-resume-with-user-table-freeze:</p>
<ul>
<li>Statuses : 39 skip(s)</li>
<li>Exec time: [0.0, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@fan-suspend-resume-with-user-table-mem:</p>
<ul>
<li>Statuses : 39 skip(s)</li>
<li>Exec time: [0.0, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@fan-suspend-resume-without-user-table-disk:</p>
<ul>
<li>Statuses : 39 skip(s)</li>
<li>Exec time: [0.0, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@fan-suspend-resume-without-user-table-freeze:</p>
<ul>
<li>Statuses : 39 skip(s)</li>
<li>Exec time: [0.0, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@fan-suspend-resume-without-user-table-mem:</p>
<ul>
<li>Statuses : 39 skip(s)</li>
<li>Exec time: [0.0, 0.06] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_15612 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>{igt@intel_hwmon@fan-curve-setup} (NEW):</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/fi-hsw-4770/igt@intel_hwmon@fan-curve-setup.html">SKIP</a> +8 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@intel_hwmon@fan-negative-tests} (NEW):</p>
<ul>
<li>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/fi-bsw-n3050/igt@intel_hwmon@fan-negative-tests.html">SKIP</a> +8 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@intel_hwmon@fan-pwm-enable-modes} (NEW):</p>
<ul>
<li>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/fi-cfl-8700k/igt@intel_hwmon@fan-pwm-enable-modes.html">SKIP</a> +8 other tests skip</li>
<li>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/bat-kbl-2/igt@intel_hwmon@fan-pwm-enable-modes.html">SKIP</a> +8 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@intel_hwmon@fan-suspend-resume-with-user-table-disk} (NEW):</p>
<ul>
<li>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/fi-kbl-x1275/igt@intel_hwmon@fan-suspend-resume-with-user-table-disk.html">SKIP</a> +8 other tests skip</li>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/fi-cfl-8109u/igt@intel_hwmon@fan-suspend-resume-with-user-table-disk.html">SKIP</a> +8 other tests skip</li>
<li>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/fi-kbl-7567u/igt@intel_hwmon@fan-suspend-resume-with-user-table-disk.html">SKIP</a> +8 other tests skip</li>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/fi-kbl-8809g/igt@intel_hwmon@fan-suspend-resume-with-user-table-disk.html">SKIP</a> +8 other tests skip</li>
<li>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/fi-ilk-650/igt@intel_hwmon@fan-suspend-resume-with-user-table-disk.html">SKIP</a> +8 other tests skip</li>
<li>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/fi-cfl-guc/igt@intel_hwmon@fan-suspend-resume-with-user-table-disk.html">SKIP</a> +8 other tests skip</li>
<li>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/fi-skl-6600u/igt@intel_hwmon@fan-suspend-resume-with-user-table-disk.html">SKIP</a> +8 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@intel_hwmon@fan-suspend-resume-with-user-table-freeze} (NEW):</p>
<ul>
<li>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/fi-ivb-3770/igt@intel_hwmon@fan-suspend-resume-with-user-table-freeze.html">SKIP</a> +8 other tests skip</li>
<li>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/fi-elk-e7500/igt@intel_hwmon@fan-suspend-resume-with-user-table-freeze.html">SKIP</a> +8 other tests skip</li>
<li>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/fi-bsw-nick/igt@intel_hwmon@fan-suspend-resume-with-user-table-freeze.html">SKIP</a> +8 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@intel_hwmon@fan-suspend-resume-with-user-table-mem} (NEW):</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/fi-pnv-d510/igt@intel_hwmon@fan-suspend-resume-with-user-table-mem.html">SKIP</a> +8 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@intel_hwmon@fan-suspend-resume-without-user-table-freeze} (NEW):</p>
<ul>
<li>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/fi-glk-j4005/igt@intel_hwmon@fan-suspend-resume-without-user-table-freeze.html">SKIP</a> +8 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@intel_hwmon@fan-suspend-resume-without-user-table-mem} (NEW):</p>
<ul>
<li>bat-apl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/bat-apl-1/igt@intel_hwmon@fan-suspend-resume-without-user-table-mem.html">SKIP</a> +8 other tests skip</li>
<li>bat-arlh-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15612/bat-arlh-2/igt@intel_hwmon@fan-suspend-resume-without-user-table-mem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a>) +8 other tests skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9034 -&gt; IGTPW_15612</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18925: 5e24f68d311764bf343f9def49b752b509dfd5fd @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15612: 15612<br />
  IGT_9034: be1d1af352dbd4ca4557202a8ed0d6d60f95e0bf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============6823154964679299903==--
