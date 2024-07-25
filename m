Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6F1DC3DA5D
	for <igt-dev@archiver.kernel.org>; Thu, 25 Jul 2024 08:51:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AC7B10E03F;
	Thu, 25 Jul 2024 08:51:29 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C09F10E03F;
 Thu, 25 Jul 2024 08:51:28 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3068686513478389838=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_series_starting_with_=5Bi-g-t?=
 =?utf-8?q?=2CV2=2C1/2=5D_lib/drmtest=3A_Ensure_the_XE_driver_is_idle_before?=
 =?utf-8?q?_starting_a_test_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 25 Jul 2024 08:51:28 -0000
Message-ID: <172189748804.380868.14156054654636644317@2413ebb6fbb6>
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

--===============3068686513478389838==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,V2,1/2] lib/drmtest: Ensure the XE driver is idle before starting a test (rev3)
URL   : https://patchwork.freedesktop.org/series/136408/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7937_BAT -> XEIGTPW_11455_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_11455_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_11455_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (7 -> 7)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_11455_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_huc_copy@huc_copy:
    - bat-lnl-1:          [PASS][1] -> [DMESG-WARN][2] +139 other tests dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7937/bat-lnl-1/igt@xe_huc_copy@huc_copy.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11455/bat-lnl-1/igt@xe_huc_copy@huc_copy.html

  * igt@xe_pm_residency@gt-c6-on-idle:
    - bat-lnl-1:          [PASS][3] -> [DMESG-FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7937/bat-lnl-1/igt@xe_pm_residency@gt-c6-on-idle.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11455/bat-lnl-1/igt@xe_pm_residency@gt-c6-on-idle.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_rmfb@rmfb-ioctl:
    - {bat-lnl-2}:        NOTRUN -> [SKIP][5] +1 other test skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11455/bat-lnl-2/igt@kms_rmfb@rmfb-ioctl.html

  * igt@xe_exec_balancer@no-exec-virtual-basic:
    - {bat-lnl-2}:        [PASS][6] -> [DMESG-WARN][7] +135 other tests dmesg-warn
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7937/bat-lnl-2/igt@xe_exec_balancer@no-exec-virtual-basic.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11455/bat-lnl-2/igt@xe_exec_balancer@no-exec-virtual-basic.html

  * igt@xe_gt_freq@freq_basic_api:
    - {bat-lnl-2}:        [PASS][8] -> [DMESG-FAIL][9] +2 other tests dmesg-fail
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7937/bat-lnl-2/igt@xe_gt_freq@freq_basic_api.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11455/bat-lnl-2/igt@xe_gt_freq@freq_basic_api.html

  * {igt@xe_intel_bb@render@render-tile64-256}:
    - bat-lnl-1:          [PASS][10] -> [DMESG-WARN][11]
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7937/bat-lnl-1/igt@xe_intel_bb@render@render-tile64-256.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11455/bat-lnl-1/igt@xe_intel_bb@render@render-tile64-256.html

  * igt@xe_pat@pat-index-xe2@render:
    - {bat-bmg-1}:        [PASS][12] -> [DMESG-WARN][13] +1 other test dmesg-warn
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7937/bat-bmg-1/igt@xe_pat@pat-index-xe2@render.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11455/bat-bmg-1/igt@xe_pat@pat-index-xe2@render.html

  * {igt@xe_pm_residency@gt-c6-on-idle@gt1}:
    - bat-lnl-1:          [PASS][14] -> [DMESG-FAIL][15]
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7937/bat-lnl-1/igt@xe_pm_residency@gt-c6-on-idle@gt1.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11455/bat-lnl-1/igt@xe_pm_residency@gt-c6-on-idle@gt1.html

  
New tests
---------

  New tests have been introduced between XEIGT_7937_BAT and XEIGTPW_11455_BAT:

### New IGT tests (4) ###

  * igt@kms_rmfb@close-fd@pipe-b-dp-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.24] s

  * igt@kms_rmfb@close-fd@pipe-d-dp-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.23] s

  * igt@kms_rmfb@rmfb-ioctl@pipe-b-dp-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.24] s

  * igt@kms_rmfb@rmfb-ioctl@pipe-d-dp-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.24] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_11455_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_rmfb@rmfb-ioctl:
    - bat-pvc-2:          NOTRUN -> [SKIP][16] ([Intel XE#1024]) +1 other test skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11455/bat-pvc-2/igt@kms_rmfb@rmfb-ioctl.html
    - bat-atsm-2:         NOTRUN -> [SKIP][17] ([Intel XE#1024]) +1 other test skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11455/bat-atsm-2/igt@kms_rmfb@rmfb-ioctl.html

  * igt@xe_exec_compute_mode@twice-basic:
    - bat-lnl-1:          [PASS][18] -> [DMESG-FAIL][19] ([Intel XE#1069]) +4 other tests dmesg-fail
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7937/bat-lnl-1/igt@xe_exec_compute_mode@twice-basic.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11455/bat-lnl-1/igt@xe_exec_compute_mode@twice-basic.html

  * igt@xe_gt_freq@freq_range_idle:
    - bat-lnl-1:          [PASS][20] -> [SKIP][21] ([Intel XE#1462]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7937/bat-lnl-1/igt@xe_gt_freq@freq_range_idle.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11455/bat-lnl-1/igt@xe_gt_freq@freq_range_idle.html

  * igt@xe_live_ktest@xe_migrate:
    - bat-lnl-1:          [PASS][22] -> [SKIP][23] ([Intel XE#1192]) +2 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7937/bat-lnl-1/igt@xe_live_ktest@xe_migrate.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11455/bat-lnl-1/igt@xe_live_ktest@xe_migrate.html

  
#### Possible fixes ####

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [DMESG-FAIL][24] ([Intel XE#324]) -> [PASS][25]
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7937/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11455/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1024]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024
  [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1462]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1462
  [Intel XE#2109]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2109
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324


Build changes
-------------

  * IGT: IGT_7937 -> IGTPW_11455

  IGTPW_11455: 11455
  IGT_7937: eba69333dfe8c295d053997367e395d7bde2b4b4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1664-724a2a53988a57709d7f9dcd5c58dd5737d45cb2: 724a2a53988a57709d7f9dcd5c58dd5737d45cb2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11455/index.html

--===============3068686513478389838==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,V2,1/2] lib/drmtest: Ensure the XE driver is idle before starting a test (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/136408/">https://patchwork.freedesktop.org/series/136408/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11455/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11455/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7937_BAT -&gt; XEIGTPW_11455_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_11455_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_11455_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_11455_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7937/bat-lnl-1/igt@xe_huc_copy@huc_copy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11455/bat-lnl-1/igt@xe_huc_copy@huc_copy.html">DMESG-WARN</a> +139 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-on-idle:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7937/bat-lnl-1/igt@xe_pm_residency@gt-c6-on-idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11455/bat-lnl-1/igt@xe_pm_residency@gt-c6-on-idle.html">DMESG-FAIL</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_rmfb@rmfb-ioctl:</p>
<ul>
<li>{bat-lnl-2}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11455/bat-lnl-2/igt@kms_rmfb@rmfb-ioctl.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-virtual-basic:</p>
<ul>
<li>{bat-lnl-2}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7937/bat-lnl-2/igt@xe_exec_balancer@no-exec-virtual-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11455/bat-lnl-2/igt@xe_exec_balancer@no-exec-virtual-basic.html">DMESG-WARN</a> +135 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_basic_api:</p>
<ul>
<li>{bat-lnl-2}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7937/bat-lnl-2/igt@xe_gt_freq@freq_basic_api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11455/bat-lnl-2/igt@xe_gt_freq@freq_basic_api.html">DMESG-FAIL</a> +2 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>{igt@xe_intel_bb@render@render-tile64-256}:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7937/bat-lnl-1/igt@xe_intel_bb@render@render-tile64-256.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11455/bat-lnl-1/igt@xe_intel_bb@render@render-tile64-256.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2@render:</p>
<ul>
<li>{bat-bmg-1}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7937/bat-bmg-1/igt@xe_pat@pat-index-xe2@render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11455/bat-bmg-1/igt@xe_pat@pat-index-xe2@render.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>{igt@xe_pm_residency@gt-c6-on-idle@gt1}:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7937/bat-lnl-1/igt@xe_pm_residency@gt-c6-on-idle@gt1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11455/bat-lnl-1/igt@xe_pm_residency@gt-c6-on-idle@gt1.html">DMESG-FAIL</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_7937_BAT and XEIGTPW_11455_BAT:</p>
<h3>New IGT tests (4)</h3>
<ul>
<li>
<p>igt@kms_rmfb@close-fd@pipe-b-dp-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_rmfb@close-fd@pipe-d-dp-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_rmfb@rmfb-ioctl@pipe-b-dp-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_rmfb@rmfb-ioctl@pipe-d-dp-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.24] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11455_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_rmfb@rmfb-ioctl:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11455/bat-pvc-2/igt@kms_rmfb@rmfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a>) +1 other test skip</li>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11455/bat-atsm-2/igt@kms_rmfb@rmfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-basic:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7937/bat-lnl-1/igt@xe_exec_compute_mode@twice-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11455/bat-lnl-1/igt@xe_exec_compute_mode@twice-basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069">Intel XE#1069</a>) +4 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_range_idle:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7937/bat-lnl-1/igt@xe_gt_freq@freq_range_idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11455/bat-lnl-1/igt@xe_gt_freq@freq_range_idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1462">Intel XE#1462</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7937/bat-lnl-1/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11455/bat-lnl-1/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +2 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_frontbuffer_tracking@basic:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7937/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11455/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7937 -&gt; IGTPW_11455</li>
</ul>
<p>IGTPW_11455: 11455<br />
  IGT_7937: eba69333dfe8c295d053997367e395d7bde2b4b4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1664-724a2a53988a57709d7f9dcd5c58dd5737d45cb2: 724a2a53988a57709d7f9dcd5c58dd5737d45cb2</p>

</body>
</html>

--===============3068686513478389838==--
