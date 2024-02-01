Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05779C47DB3
	for <igt-dev@archiver.kernel.org>; Thu,  1 Feb 2024 03:08:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70BED10FE82;
	Thu,  1 Feb 2024 03:08:11 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC19E10FE81;
 Thu,  1 Feb 2024 03:08:10 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4311502651938871627=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_igt=5Fkmod_and_sysfs_fixes?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Date: Thu, 01 Feb 2024 03:08:10 -0000
Message-ID: <170675689089.878359.9893714453497910613@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240201005115.352192-1-lucas.demarchi@intel.com>
In-Reply-To: <20240201005115.352192-1-lucas.demarchi@intel.com>
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
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

--===============4311502651938871627==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: igt_kmod and sysfs fixes
URL   : https://patchwork.freedesktop.org/series/129398/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7699_BAT -> XEIGTPW_10617_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_10617_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_10617_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_10617_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_sysfs_scheduler@job_timeout_ms-min-max@rcs:
    - bat-dg2-oem2:       [PASS][1] -> [FAIL][2] +17 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-dg2-oem2/igt@xe_sysfs_scheduler@job_timeout_ms-min-max@rcs.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10617/bat-dg2-oem2/igt@xe_sysfs_scheduler@job_timeout_ms-min-max@rcs.html

  * igt@xe_sysfs_scheduler@preempt_timeout_us-min-max@ccs:
    - bat-pvc-2:          [PASS][3] -> [FAIL][4] +8 other tests fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-pvc-2/igt@xe_sysfs_scheduler@preempt_timeout_us-min-max@ccs.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10617/bat-pvc-2/igt@xe_sysfs_scheduler@preempt_timeout_us-min-max@ccs.html

  * igt@xe_sysfs_scheduler@preempt_timeout_us-min-max@vcs:
    - bat-atsm-2:         [PASS][5] -> [FAIL][6] +17 other tests fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-atsm-2/igt@xe_sysfs_scheduler@preempt_timeout_us-min-max@vcs.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10617/bat-atsm-2/igt@xe_sysfs_scheduler@preempt_timeout_us-min-max@vcs.html

  * igt@xe_sysfs_scheduler@preempt_timeout_us-min-max@vecs:
    - bat-adlp-7:         [PASS][7] -> [FAIL][8] +14 other tests fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-adlp-7/igt@xe_sysfs_scheduler@preempt_timeout_us-min-max@vecs.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10617/bat-adlp-7/igt@xe_sysfs_scheduler@preempt_timeout_us-min-max@vecs.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@xe_gt_freq@freq_basic_api}:
    - bat-adlp-7:         [PASS][9] -> [FAIL][10] +2 other tests fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-adlp-7/igt@xe_gt_freq@freq_basic_api.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10617/bat-adlp-7/igt@xe_gt_freq@freq_basic_api.html
    - bat-pvc-2:          [PASS][11] -> [FAIL][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-pvc-2/igt@xe_gt_freq@freq_basic_api.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10617/bat-pvc-2/igt@xe_gt_freq@freq_basic_api.html
    - bat-dg2-oem2:       [PASS][13] -> [FAIL][14] +2 other tests fail
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-dg2-oem2/igt@xe_gt_freq@freq_basic_api.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10617/bat-dg2-oem2/igt@xe_gt_freq@freq_basic_api.html

  * {igt@xe_gt_freq@freq_fixed_idle}:
    - bat-atsm-2:         [PASS][15] -> [FAIL][16] +2 other tests fail
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-atsm-2/igt@xe_gt_freq@freq_fixed_idle.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10617/bat-atsm-2/igt@xe_gt_freq@freq_fixed_idle.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_10617_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@invalid-set-prop:
    - bat-adlp-7:         [PASS][17] -> [SKIP][18] ([i915#6077]) +30 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-adlp-7/igt@kms_addfb_basic@invalid-set-prop.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10617/bat-adlp-7/igt@kms_addfb_basic@invalid-set-prop.html

  * igt@kms_flip@basic-flip-vs-dpms:
    - bat-adlp-7:         [PASS][19] -> [SKIP][20] ([Intel XE#1219]) +9 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10617/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms.html

  * igt@kms_force_connector_basic@force-connector-state:
    - bat-adlp-7:         [PASS][21] -> [SKIP][22] ([Intel XE#540]) +3 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-adlp-7/igt@kms_force_connector_basic@force-connector-state.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10617/bat-adlp-7/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
    - bat-adlp-7:         [PASS][23] -> [SKIP][24] ([Intel XE#829]) +6 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-adlp-7/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10617/bat-adlp-7/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html

  * igt@kms_prop_blob@basic:
    - bat-adlp-7:         [PASS][25] -> [SKIP][26] ([Intel XE#780])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-adlp-7/igt@kms_prop_blob@basic.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10617/bat-adlp-7/igt@kms_prop_blob@basic.html

  
#### Possible fixes ####

  * igt@xe_module_load@load:
    - bat-pvc-2:          [SKIP][27] ([Intel XE#378]) -> [PASS][28]
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-pvc-2/igt@xe_module_load@load.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10617/bat-pvc-2/igt@xe_module_load@load.html

  
#### Warnings ####

  * igt@kms_dsc@dsc-basic:
    - bat-adlp-7:         [SKIP][29] ([Intel XE#455]) -> [SKIP][30] ([Intel XE#1219])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-adlp-7/igt@kms_dsc@dsc-basic.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10617/bat-adlp-7/igt@kms_dsc@dsc-basic.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [DMESG-FAIL][31] ([Intel XE#1033]) -> [SKIP][32] ([Intel XE#783])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10617/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1219]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1219
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/540
  [Intel XE#780]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/780
  [Intel XE#783]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/783
  [Intel XE#829]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/829
  [i915#6077]: https://gitlab.freedesktop.org/drm/intel/issues/6077


Build changes
-------------

  * IGT: IGT_7699 -> IGTPW_10617
  * Linux: xe-699-c655e0fd28045dbaa581d04bf7cc266eec1c3457 -> xe-712-cba66c6a2af4df1b9b420fbad0a9ac1e68f14030

  IGTPW_10617: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/index.html
  IGT_7699: 7699
  xe-699-c655e0fd28045dbaa581d04bf7cc266eec1c3457: c655e0fd28045dbaa581d04bf7cc266eec1c3457
  xe-712-cba66c6a2af4df1b9b420fbad0a9ac1e68f14030: cba66c6a2af4df1b9b420fbad0a9ac1e68f14030

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10617/index.html

--===============4311502651938871627==
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
<tr><td><b>Series:</b></td><td>igt_kmod and sysfs fixes</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/129398/">https://patchwork.freedesktop.org/series/129398/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10617/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10617/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7699_BAT -&gt; XEIGTPW_10617_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_10617_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_10617_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_10617_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_sysfs_scheduler@job_timeout_ms-min-max@rcs:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-dg2-oem2/igt@xe_sysfs_scheduler@job_timeout_ms-min-max@rcs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10617/bat-dg2-oem2/igt@xe_sysfs_scheduler@job_timeout_ms-min-max@rcs.html">FAIL</a> +17 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_scheduler@preempt_timeout_us-min-max@ccs:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-pvc-2/igt@xe_sysfs_scheduler@preempt_timeout_us-min-max@ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10617/bat-pvc-2/igt@xe_sysfs_scheduler@preempt_timeout_us-min-max@ccs.html">FAIL</a> +8 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_scheduler@preempt_timeout_us-min-max@vcs:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-atsm-2/igt@xe_sysfs_scheduler@preempt_timeout_us-min-max@vcs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10617/bat-atsm-2/igt@xe_sysfs_scheduler@preempt_timeout_us-min-max@vcs.html">FAIL</a> +17 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_scheduler@preempt_timeout_us-min-max@vecs:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-adlp-7/igt@xe_sysfs_scheduler@preempt_timeout_us-min-max@vecs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10617/bat-adlp-7/igt@xe_sysfs_scheduler@preempt_timeout_us-min-max@vecs.html">FAIL</a> +14 other tests fail</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>{igt@xe_gt_freq@freq_basic_api}:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-adlp-7/igt@xe_gt_freq@freq_basic_api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10617/bat-adlp-7/igt@xe_gt_freq@freq_basic_api.html">FAIL</a> +2 other tests fail</li>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-pvc-2/igt@xe_gt_freq@freq_basic_api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10617/bat-pvc-2/igt@xe_gt_freq@freq_basic_api.html">FAIL</a></li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-dg2-oem2/igt@xe_gt_freq@freq_basic_api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10617/bat-dg2-oem2/igt@xe_gt_freq@freq_basic_api.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@xe_gt_freq@freq_fixed_idle}:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-atsm-2/igt@xe_gt_freq@freq_fixed_idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10617/bat-atsm-2/igt@xe_gt_freq@freq_fixed_idle.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_10617_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@invalid-set-prop:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-adlp-7/igt@kms_addfb_basic@invalid-set-prop.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10617/bat-adlp-7/igt@kms_addfb_basic@invalid-set-prop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6077">i915#6077</a>) +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10617/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1219">Intel XE#1219</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-adlp-7/igt@kms_force_connector_basic@force-connector-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10617/bat-adlp-7/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/540">Intel XE#540</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-adlp-7/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10617/bat-adlp-7/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_prop_blob@basic:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-adlp-7/igt@kms_prop_blob@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10617/bat-adlp-7/igt@kms_prop_blob@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/780">Intel XE#780</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_module_load@load:<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-pvc-2/igt@xe_module_load@load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10617/bat-pvc-2/igt@xe_module_load@load.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-adlp-7/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10617/bat-adlp-7/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1219">Intel XE#1219</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10617/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/783">Intel XE#783</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7699 -&gt; IGTPW_10617</li>
<li>Linux: xe-699-c655e0fd28045dbaa581d04bf7cc266eec1c3457 -&gt; xe-712-cba66c6a2af4df1b9b420fbad0a9ac1e68f14030</li>
</ul>
<p>IGTPW_10617: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10617/index.html<br />
  IGT_7699: 7699<br />
  xe-699-c655e0fd28045dbaa581d04bf7cc266eec1c3457: c655e0fd28045dbaa581d04bf7cc266eec1c3457<br />
  xe-712-cba66c6a2af4df1b9b420fbad0a9ac1e68f14030: cba66c6a2af4df1b9b420fbad0a9ac1e68f14030</p>

</body>
</html>

--===============4311502651938871627==--
