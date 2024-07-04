Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05AB5C30653
	for <igt-dev@archiver.kernel.org>; Thu,  4 Jul 2024 13:41:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0F4210EAF2;
	Thu,  4 Jul 2024 13:41:42 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E98710EAF2;
 Thu,  4 Jul 2024 13:41:41 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4563267390809631194=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_Intel_Xe_OA_IGT=27s_=28rev9=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 04 Jul 2024 13:41:41 -0000
Message-ID: <172010050164.27753.9809007551092652551@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240704011142.2618968-1-ashutosh.dixit@intel.com>
In-Reply-To: <20240704011142.2618968-1-ashutosh.dixit@intel.com>
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

--===============4563267390809631194==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Intel Xe OA IGT's (rev9)
URL   : https://patchwork.freedesktop.org/series/130033/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7916_BAT -> XEIGTPW_11363_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (5 -> 5)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_11363_BAT:

### IGT changes ###

#### Possible regressions ####

  * {igt@xe_oa@mi-rpc} (NEW):
    - bat-dg2-oem2:       NOTRUN -> [INCOMPLETE][1] +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11363/bat-dg2-oem2/igt@xe_oa@mi-rpc.html

  * {igt@xe_oa@mi-rpc@ccs-0} (NEW):
    - bat-pvc-2:          NOTRUN -> [INCOMPLETE][2] +1 other test incomplete
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11363/bat-pvc-2/igt@xe_oa@mi-rpc@ccs-0.html
    - bat-atsm-2:         NOTRUN -> [INCOMPLETE][3] +1 other test incomplete
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11363/bat-atsm-2/igt@xe_oa@mi-rpc@ccs-0.html

  * {igt@xe_oa@mmio-triggered-reports} (NEW):
    - bat-adlp-7:         NOTRUN -> [SKIP][4]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11363/bat-adlp-7/igt@xe_oa@mmio-triggered-reports.html

  * {igt@xe_oa@non-zero-reason} (NEW):
    - bat-pvc-2:          NOTRUN -> [FAIL][5] +6 other tests fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11363/bat-pvc-2/igt@xe_oa@non-zero-reason.html
    - bat-atsm-2:         NOTRUN -> [FAIL][6] +1 other test fail
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11363/bat-atsm-2/igt@xe_oa@non-zero-reason.html

  * {igt@xe_oa@oa-formats} (NEW):
    - bat-pvc-2:          NOTRUN -> [TIMEOUT][7] +1 other test timeout
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11363/bat-pvc-2/igt@xe_oa@oa-formats.html

  * {igt@xe_oa@oa-formats@rcs-0} (NEW):
    - bat-dg2-oem2:       NOTRUN -> [FAIL][8] +3 other tests fail
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11363/bat-dg2-oem2/igt@xe_oa@oa-formats@rcs-0.html

  * {igt@xe_oa@oa-tlb-invalidate} (NEW):
    - {bat-lnl-1}:        NOTRUN -> [SKIP][9] +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11363/bat-lnl-1/igt@xe_oa@oa-tlb-invalidate.html
    - bat-pvc-2:          NOTRUN -> [SKIP][10] +1 other test skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11363/bat-pvc-2/igt@xe_oa@oa-tlb-invalidate.html

  * {igt@xe_oa@rc6-disable} (NEW):
    - bat-atsm-2:         NOTRUN -> [SKIP][11]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11363/bat-atsm-2/igt@xe_oa@rc6-disable.html

  
New tests
---------

  New tests have been introduced between XEIGT_7916_BAT and XEIGTPW_11363_BAT:

### New IGT tests (73) ###

  * igt@xe_oa@blocking:
    - Statuses : 5 pass(s)
    - Exec time: [1.01, 1.03] s

  * igt@xe_oa@blocking@ccs-0:
    - Statuses : 1 pass(s)
    - Exec time: [1.02] s

  * igt@xe_oa@blocking@rcs-0:
    - Statuses : 4 pass(s)
    - Exec time: [1.01, 1.03] s

  * igt@xe_oa@buffer-fill:
    - Statuses : 5 pass(s)
    - Exec time: [0.99, 6.81] s

  * igt@xe_oa@buffer-fill@ccs-0:
    - Statuses : 1 pass(s)
    - Exec time: [5.11] s

  * igt@xe_oa@buffer-fill@rcs-0:
    - Statuses : 4 pass(s)
    - Exec time: [0.99, 6.80] s

  * igt@xe_oa@closed-fd-and-unmapped-access:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [0.08, 0.11] s

  * igt@xe_oa@closed-fd-and-unmapped-access@ccs-0:
    - Statuses : 1 fail(s)
    - Exec time: [0.08] s

  * igt@xe_oa@closed-fd-and-unmapped-access@rcs-0:
    - Statuses : 4 pass(s)
    - Exec time: [0.10, 0.11] s

  * igt@xe_oa@create-destroy-userspace-config:
    - Statuses : 5 pass(s)
    - Exec time: [0.02, 0.07] s

  * igt@xe_oa@disabled-read-error:
    - Statuses : 5 pass(s)
    - Exec time: [0.01, 0.02] s

  * igt@xe_oa@enable-disable:
    - Statuses : 5 pass(s)
    - Exec time: [0.98, 5.72] s

  * igt@xe_oa@enable-disable@ccs-0:
    - Statuses : 3 pass(s)
    - Exec time: [0.98, 5.72] s

  * igt@xe_oa@enable-disable@rcs-0:
    - Statuses : 2 pass(s)
    - Exec time: [2.25, 4.62] s

  * igt@xe_oa@invalid-create-userspace-config:
    - Statuses : 5 pass(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_oa@invalid-map-oa-buffer:
    - Statuses : 5 pass(s)
    - Exec time: [0.01] s

  * igt@xe_oa@invalid-map-oa-buffer@ccs-0:
    - Statuses : 2 pass(s)
    - Exec time: [0.01] s

  * igt@xe_oa@invalid-map-oa-buffer@rcs-0:
    - Statuses : 3 pass(s)
    - Exec time: [0.01] s

  * igt@xe_oa@invalid-oa-exponent:
    - Statuses : 5 pass(s)
    - Exec time: [0.01, 0.03] s

  * igt@xe_oa@invalid-oa-format-id:
    - Statuses : 5 pass(s)
    - Exec time: [0.01, 0.02] s

  * igt@xe_oa@invalid-oa-metric-set-id:
    - Statuses : 5 pass(s)
    - Exec time: [0.01, 0.02] s

  * igt@xe_oa@invalid-remove-userspace-config:
    - Statuses : 5 pass(s)
    - Exec time: [0.01, 0.04] s

  * igt@xe_oa@map-oa-buffer:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [0.09, 0.10] s

  * igt@xe_oa@map-oa-buffer@ccs-0:
    - Statuses : 1 fail(s) 1 pass(s)
    - Exec time: [0.09, 0.10] s

  * igt@xe_oa@map-oa-buffer@rcs-0:
    - Statuses : 3 pass(s)
    - Exec time: [0.09, 0.10] s

  * igt@xe_oa@mi-rpc:
    - Statuses : 3 incomplete(s) 2 pass(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_oa@mi-rpc@ccs-0:
    - Statuses : 2 incomplete(s) 1 pass(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_oa@mi-rpc@rcs-0:
    - Statuses : 1 incomplete(s) 1 pass(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_oa@missing-sample-flags:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@xe_oa@mmio-triggered-reports:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_oa@mmio-triggered-reports@ccs-0:
    - Statuses : 3 pass(s)
    - Exec time: [0.01, 0.03] s

  * igt@xe_oa@mmio-triggered-reports@rcs-0:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_oa@non-privileged-access-vaddr:
    - Statuses : 5 pass(s)
    - Exec time: [0.02, 0.05] s

  * igt@xe_oa@non-privileged-access-vaddr@ccs-0:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.05] s

  * igt@xe_oa@non-privileged-access-vaddr@rcs-0:
    - Statuses : 3 pass(s)
    - Exec time: [0.02] s

  * igt@xe_oa@non-privileged-map-oa-buffer:
    - Statuses : 5 pass(s)
    - Exec time: [0.02, 0.04] s

  * igt@xe_oa@non-privileged-map-oa-buffer@ccs-0:
    - Statuses : 2 pass(s)
    - Exec time: [0.02, 0.04] s

  * igt@xe_oa@non-privileged-map-oa-buffer@rcs-0:
    - Statuses : 3 pass(s)
    - Exec time: [0.02] s

  * igt@xe_oa@non-sampling-read-error:
    - Statuses : 5 pass(s)
    - Exec time: [0.01] s

  * igt@xe_oa@non-system-wide-paranoid:
    - Statuses : 5 pass(s)
    - Exec time: [0.03, 0.09] s

  * igt@xe_oa@non-zero-reason:
    - Statuses : 3 fail(s) 2 pass(s)
    - Exec time: [2.04, 7.46] s

  * igt@xe_oa@non-zero-reason@ccs-0:
    - Statuses : 3 fail(s)
    - Exec time: [2.04, 2.85] s

  * igt@xe_oa@non-zero-reason@rcs-0:
    - Statuses : 2 pass(s)
    - Exec time: [2.83, 7.46] s

  * igt@xe_oa@oa-exponents:
    - Statuses : 5 pass(s)
    - Exec time: [1.89, 5.80] s

  * igt@xe_oa@oa-exponents@ccs-0:
    - Statuses : 2 pass(s)
    - Exec time: [3.43, 5.80] s

  * igt@xe_oa@oa-exponents@rcs-0:
    - Statuses : 3 pass(s)
    - Exec time: [1.89, 3.42] s

  * igt@xe_oa@oa-formats:
    - Statuses : 1 fail(s) 3 pass(s) 1 timeout(s)
    - Exec time: [0.0, 0.15] s

  * igt@xe_oa@oa-formats@rcs-0:
    - Statuses : 1 fail(s) 3 pass(s)
    - Exec time: [0.01, 0.15] s

  * igt@xe_oa@oa-regs-whitelisted:
    - Statuses : 5 pass(s)
    - Exec time: [0.01, 0.19] s

  * igt@xe_oa@oa-regs-whitelisted@ccs-0:
    - Statuses : 1 pass(s)
    - Exec time: [0.17] s

  * igt@xe_oa@oa-regs-whitelisted@rcs-0:
    - Statuses : 4 pass(s)
    - Exec time: [0.01, 0.19] s

  * igt@xe_oa@oa-tlb-invalidate:
    - Statuses : 3 pass(s) 2 skip(s)
    - Exec time: [0.0, 10.06] s

  * igt@xe_oa@oa-tlb-invalidate@ccs-0:
    - Statuses : 1 pass(s)
    - Exec time: [10.06] s

  * igt@xe_oa@oa-tlb-invalidate@rcs-0:
    - Statuses : 2 pass(s)
    - Exec time: [10.04] s

  * igt@xe_oa@oa-unit-concurrent-oa-buffer-read:
    - Statuses : 5 pass(s)
    - Exec time: [1.02, 1.07] s

  * igt@xe_oa@oa-unit-exclusive-stream-exec-q:
    - Statuses : 5 pass(s)
    - Exec time: [0.01] s

  * igt@xe_oa@oa-unit-exclusive-stream-sample-oa:
    - Statuses : 5 pass(s)
    - Exec time: [0.01] s

  * igt@xe_oa@polling:
    - Statuses : 5 pass(s)
    - Exec time: [1.02, 1.03] s

  * igt@xe_oa@polling-small-buf:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [0.09] s

  * igt@xe_oa@polling@ccs-0:
    - Statuses : 3 pass(s)
    - Exec time: [1.01, 1.02] s

  * igt@xe_oa@polling@rcs-0:
    - Statuses : 2 pass(s)
    - Exec time: [1.02, 1.03] s

  * igt@xe_oa@privileged-forked-access-vaddr:
    - Statuses : 5 pass(s)
    - Exec time: [0.02, 0.07] s

  * igt@xe_oa@privileged-forked-access-vaddr@ccs-0:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_oa@privileged-forked-access-vaddr@rcs-0:
    - Statuses : 4 pass(s)
    - Exec time: [0.02, 0.07] s

  * igt@xe_oa@rc6-disable:
    - Statuses : 3 pass(s) 2 skip(s)
    - Exec time: [0.05, 0.17] s

  * igt@xe_oa@short-reads:
    - Statuses : 5 pass(s)
    - Exec time: [0.01] s

  * igt@xe_oa@stress-open-close:
    - Statuses : 5 pass(s)
    - Exec time: [2.17, 5.71] s

  * igt@xe_oa@stress-open-close@ccs-0:
    - Statuses : 3 pass(s)
    - Exec time: [2.21, 5.71] s

  * igt@xe_oa@stress-open-close@rcs-0:
    - Statuses : 2 pass(s)
    - Exec time: [2.17] s

  * igt@xe_oa@sysctl-defaults:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@xe_oa@unprivileged-single-ctx-counters:
    - Statuses : 3 pass(s) 1 skip(s) 1 timeout(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_oa@unprivileged-single-ctx-counters@rcs-0:
    - Statuses : 3 pass(s)
    - Exec time: [0.01, 0.05] s

  * igt@xe_oa@whitelisted-registers-userspace-config:
    - Statuses : 5 pass(s)
    - Exec time: [0.0, 0.00] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_11363_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [DMESG-FAIL][12] ([Intel XE#324]) -> [PASS][13]
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7916/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11363/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  * igt@xe_gt_freq@freq_basic_api:
    - bat-adlp-7:         [FAIL][14] -> [PASS][15]
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7916/bat-adlp-7/igt@xe_gt_freq@freq_basic_api.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11363/bat-adlp-7/igt@xe_gt_freq@freq_basic_api.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886


Build changes
-------------

  * IGT: IGT_7916 -> IGTPW_11363

  IGTPW_11363: 11363
  IGT_7916: 971cfc9d6afc8242db25d1eabd4ae00890d9144a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1562-2bf4c5214910654a6a50082c90f0f4596ea6b0c6: 2bf4c5214910654a6a50082c90f0f4596ea6b0c6

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11363/index.html

--===============4563267390809631194==
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
<tr><td><b>Series:</b></td><td>Intel Xe OA IGT&#x27;s (rev9)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/130033/">https://patchwork.freedesktop.org/series/130033/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11363/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11363/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7916_BAT -&gt; XEIGTPW_11363_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_11363_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@xe_oa@mi-rpc} (NEW):</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11363/bat-dg2-oem2/igt@xe_oa@mi-rpc.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>{igt@xe_oa@mi-rpc@ccs-0} (NEW):</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11363/bat-pvc-2/igt@xe_oa@mi-rpc@ccs-0.html">INCOMPLETE</a> +1 other test incomplete</li>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11363/bat-atsm-2/igt@xe_oa@mi-rpc@ccs-0.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>{igt@xe_oa@mmio-triggered-reports} (NEW):</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11363/bat-adlp-7/igt@xe_oa@mmio-triggered-reports.html">SKIP</a></li>
</ul>
</li>
<li>
<p>{igt@xe_oa@non-zero-reason} (NEW):</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11363/bat-pvc-2/igt@xe_oa@non-zero-reason.html">FAIL</a> +6 other tests fail</li>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11363/bat-atsm-2/igt@xe_oa@non-zero-reason.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>{igt@xe_oa@oa-formats} (NEW):</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11363/bat-pvc-2/igt@xe_oa@oa-formats.html">TIMEOUT</a> +1 other test timeout</li>
</ul>
</li>
<li>
<p>{igt@xe_oa@oa-formats@rcs-0} (NEW):</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11363/bat-dg2-oem2/igt@xe_oa@oa-formats@rcs-0.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@xe_oa@oa-tlb-invalidate} (NEW):</p>
<ul>
<li>{bat-lnl-1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11363/bat-lnl-1/igt@xe_oa@oa-tlb-invalidate.html">SKIP</a> +1 other test skip</li>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11363/bat-pvc-2/igt@xe_oa@oa-tlb-invalidate.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>{igt@xe_oa@rc6-disable} (NEW):</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11363/bat-atsm-2/igt@xe_oa@rc6-disable.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_7916_BAT and XEIGTPW_11363_BAT:</p>
<h3>New IGT tests (73)</h3>
<ul>
<li>
<p>igt@xe_oa@blocking:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [1.01, 1.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@blocking@ccs-0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@blocking@rcs-0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [1.01, 1.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@buffer-fill:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.99, 6.81] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@buffer-fill@ccs-0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.11] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@buffer-fill@rcs-0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.99, 6.80] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@closed-fd-and-unmapped-access:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s)</li>
<li>Exec time: [0.08, 0.11] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@closed-fd-and-unmapped-access@ccs-0:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@closed-fd-and-unmapped-access@rcs-0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.10, 0.11] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@create-destroy-userspace-config:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.02, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@disabled-read-error:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@enable-disable:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.98, 5.72] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@enable-disable@ccs-0:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.98, 5.72] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@enable-disable@rcs-0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.25, 4.62] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-create-userspace-config:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-map-oa-buffer:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-map-oa-buffer@ccs-0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-map-oa-buffer@rcs-0:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-oa-exponent:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.01, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-oa-format-id:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-oa-metric-set-id:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-remove-userspace-config:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.01, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@map-oa-buffer:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s)</li>
<li>Exec time: [0.09, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@map-oa-buffer@ccs-0:</p>
<ul>
<li>Statuses : 1 fail(s) 1 pass(s)</li>
<li>Exec time: [0.09, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@map-oa-buffer@rcs-0:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.09, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mi-rpc:</p>
<ul>
<li>Statuses : 3 incomplete(s) 2 pass(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mi-rpc@ccs-0:</p>
<ul>
<li>Statuses : 2 incomplete(s) 1 pass(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mi-rpc@rcs-0:</p>
<ul>
<li>Statuses : 1 incomplete(s) 1 pass(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@missing-sample-flags:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mmio-triggered-reports:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mmio-triggered-reports@ccs-0:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.01, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mmio-triggered-reports@rcs-0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-privileged-access-vaddr:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.02, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-privileged-access-vaddr@ccs-0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-privileged-access-vaddr@rcs-0:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-privileged-map-oa-buffer:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.02, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-privileged-map-oa-buffer@ccs-0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-privileged-map-oa-buffer@rcs-0:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-sampling-read-error:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-system-wide-paranoid:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.03, 0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-zero-reason:</p>
<ul>
<li>Statuses : 3 fail(s) 2 pass(s)</li>
<li>Exec time: [2.04, 7.46] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-zero-reason@ccs-0:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [2.04, 2.85] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-zero-reason@rcs-0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.83, 7.46] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-exponents:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [1.89, 5.80] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-exponents@ccs-0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.43, 5.80] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-exponents@rcs-0:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.89, 3.42] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-formats:</p>
<ul>
<li>Statuses : 1 fail(s) 3 pass(s) 1 timeout(s)</li>
<li>Exec time: [0.0, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-formats@rcs-0:</p>
<ul>
<li>Statuses : 1 fail(s) 3 pass(s)</li>
<li>Exec time: [0.01, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-regs-whitelisted:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.01, 0.19] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-regs-whitelisted@ccs-0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-regs-whitelisted@rcs-0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.01, 0.19] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-tlb-invalidate:</p>
<ul>
<li>Statuses : 3 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 10.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-tlb-invalidate@ccs-0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-tlb-invalidate@rcs-0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [10.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-unit-concurrent-oa-buffer-read:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [1.02, 1.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-unit-exclusive-stream-exec-q:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-unit-exclusive-stream-sample-oa:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@polling:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [1.02, 1.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@polling-small-buf:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s)</li>
<li>Exec time: [0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@polling@ccs-0:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.01, 1.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@polling@rcs-0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.02, 1.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@privileged-forked-access-vaddr:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.02, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@privileged-forked-access-vaddr@ccs-0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@privileged-forked-access-vaddr@rcs-0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.02, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@rc6-disable:</p>
<ul>
<li>Statuses : 3 pass(s) 2 skip(s)</li>
<li>Exec time: [0.05, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@short-reads:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@stress-open-close:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [2.17, 5.71] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@stress-open-close@ccs-0:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [2.21, 5.71] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@stress-open-close@rcs-0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.17] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@sysctl-defaults:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@unprivileged-single-ctx-counters:</p>
<ul>
<li>Statuses : 3 pass(s) 1 skip(s) 1 timeout(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@unprivileged-single-ctx-counters@rcs-0:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.01, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@whitelisted-registers-userspace-config:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11363_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7916/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11363/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_basic_api:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7916/bat-adlp-7/igt@xe_gt_freq@freq_basic_api.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11363/bat-adlp-7/igt@xe_gt_freq@freq_basic_api.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7916 -&gt; IGTPW_11363</li>
</ul>
<p>IGTPW_11363: 11363<br />
  IGT_7916: 971cfc9d6afc8242db25d1eabd4ae00890d9144a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1562-2bf4c5214910654a6a50082c90f0f4596ea6b0c6: 2bf4c5214910654a6a50082c90f0f4596ea6b0c6</p>

</body>
</html>

--===============4563267390809631194==--
