Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF8EEC27C4F
	for <igt-dev@archiver.kernel.org>; Sun, 30 Jun 2024 23:26:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 407A610E080;
	Sun, 30 Jun 2024 23:26:52 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 056A110E080;
 Sun, 30 Jun 2024 23:26:51 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4385386931644990773=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_Intel_Xe_OA_IGT=27s_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sun, 30 Jun 2024 23:26:51 -0000
Message-ID: <171979001101.459.5463021010035965440@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240630225634.2404840-1-ashutosh.dixit@intel.com>
In-Reply-To: <20240630225634.2404840-1-ashutosh.dixit@intel.com>
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

--===============4385386931644990773==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Intel Xe OA IGT's (rev5)
URL   : https://patchwork.freedesktop.org/series/130033/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7908_BAT -> XEIGTPW_11341_BAT
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

  Here are the unknown changes that may have been introduced in XEIGTPW_11341_BAT:

### IGT changes ###

#### Possible regressions ####

  * {igt@xe_oa@mi-rpc} (NEW):
    - bat-dg2-oem2:       NOTRUN -> [INCOMPLETE][1] +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11341/bat-dg2-oem2/igt@xe_oa@mi-rpc.html

  * {igt@xe_oa@mi-rpc@ccs-0} (NEW):
    - bat-atsm-2:         NOTRUN -> [INCOMPLETE][2] +1 other test incomplete
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11341/bat-atsm-2/igt@xe_oa@mi-rpc@ccs-0.html

  * {igt@xe_oa@non-zero-reason} (NEW):
    - bat-dg2-oem2:       NOTRUN -> [FAIL][3] +1 other test fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11341/bat-dg2-oem2/igt@xe_oa@non-zero-reason.html

  * {igt@xe_oa@oa-tlb-invalidate} (NEW):
    - {bat-lnl-1}:        NOTRUN -> [SKIP][4] +2 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11341/bat-lnl-1/igt@xe_oa@oa-tlb-invalidate.html

  * {igt@xe_oa@polling-small-buf} (NEW):
    - bat-atsm-2:         NOTRUN -> [FAIL][5] +2 other tests fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11341/bat-atsm-2/igt@xe_oa@polling-small-buf.html

  * {igt@xe_oa@rc6-disable} (NEW):
    - bat-atsm-2:         NOTRUN -> [SKIP][6] +1 other test skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11341/bat-atsm-2/igt@xe_oa@rc6-disable.html

  * {igt@xe_oa@whitelisted-registers-userspace-config} (NEW):
    - bat-pvc-2:          NOTRUN -> [FAIL][7] +35 other tests fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11341/bat-pvc-2/igt@xe_oa@whitelisted-registers-userspace-config.html

  * {igt@xe_oa@xe-ref-count} (NEW):
    - bat-adlp-7:         NOTRUN -> [SKIP][8] +1 other test skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11341/bat-adlp-7/igt@xe_oa@xe-ref-count.html
    - bat-pvc-2:          NOTRUN -> [SKIP][9]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11341/bat-pvc-2/igt@xe_oa@xe-ref-count.html
    - bat-dg2-oem2:       NOTRUN -> [SKIP][10]
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11341/bat-dg2-oem2/igt@xe_oa@xe-ref-count.html

  
New tests
---------

  New tests have been introduced between XEIGT_7908_BAT and XEIGTPW_11341_BAT:

### New IGT tests (71) ###

  * igt@xe_oa@blocking:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [0.0, 1.03] s

  * igt@xe_oa@blocking@ccs-0:
    - Statuses : 3 pass(s)
    - Exec time: [1.02, 1.03] s

  * igt@xe_oa@blocking@rcs-0:
    - Statuses : 1 pass(s)
    - Exec time: [1.03] s

  * igt@xe_oa@buffer-fill:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [0.0, 6.89] s

  * igt@xe_oa@buffer-fill@rcs-0:
    - Statuses : 4 pass(s)
    - Exec time: [1.00, 6.89] s

  * igt@xe_oa@closed-fd-and-unmapped-access:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [0.0, 0.10] s

  * igt@xe_oa@closed-fd-and-unmapped-access@ccs-0:
    - Statuses : 2 pass(s)
    - Exec time: [0.10] s

  * igt@xe_oa@closed-fd-and-unmapped-access@rcs-0:
    - Statuses : 2 pass(s)
    - Exec time: [0.10] s

  * igt@xe_oa@create-destroy-userspace-config:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_oa@disabled-read-error:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_oa@enable-disable:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [0.0, 4.83] s

  * igt@xe_oa@enable-disable@rcs-0:
    - Statuses : 4 pass(s)
    - Exec time: [0.98, 4.83] s

  * igt@xe_oa@invalid-create-userspace-config:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_oa@invalid-map-oa-buffer:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_oa@invalid-map-oa-buffer@rcs-0:
    - Statuses : 4 pass(s)
    - Exec time: [0.01] s

  * igt@xe_oa@invalid-oa-exponent:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_oa@invalid-oa-format-id:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_oa@invalid-oa-metric-set-id:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_oa@invalid-remove-userspace-config:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_oa@map-oa-buffer:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [0.0, 0.10] s

  * igt@xe_oa@map-oa-buffer@ccs-0:
    - Statuses : 1 pass(s)
    - Exec time: [0.10] s

  * igt@xe_oa@map-oa-buffer@rcs-0:
    - Statuses : 3 pass(s)
    - Exec time: [0.10] s

  * igt@xe_oa@mi-rpc:
    - Statuses : 1 fail(s) 2 incomplete(s) 2 pass(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_oa@mi-rpc@ccs-0:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  * igt@xe_oa@mi-rpc@rcs-0:
    - Statuses : 1 incomplete(s) 2 pass(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_oa@missing-sample-flags:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [0.0] s

  * igt@xe_oa@mmio-triggered-reports:
    - Statuses : 1 fail(s) 3 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_oa@mmio-triggered-reports@ccs-0:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_oa@mmio-triggered-reports@rcs-0:
    - Statuses : 2 pass(s)
    - Exec time: [0.01, 0.03] s

  * igt@xe_oa@non-privileged-access-vaddr:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [0.0, 0.07] s

  * igt@xe_oa@non-privileged-access-vaddr@ccs-0:
    - Statuses : 1 pass(s)
    - Exec time: [0.07] s

  * igt@xe_oa@non-privileged-access-vaddr@rcs-0:
    - Statuses : 3 pass(s)
    - Exec time: [0.02, 0.03] s

  * igt@xe_oa@non-privileged-map-oa-buffer:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [0.0, 0.06] s

  * igt@xe_oa@non-privileged-map-oa-buffer@ccs-0:
    - Statuses : 1 pass(s)
    - Exec time: [0.06] s

  * igt@xe_oa@non-privileged-map-oa-buffer@rcs-0:
    - Statuses : 3 pass(s)
    - Exec time: [0.02] s

  * igt@xe_oa@non-sampling-read-error:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_oa@non-system-wide-paranoid:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [0.0, 0.10] s

  * igt@xe_oa@non-zero-reason:
    - Statuses : 2 fail(s) 3 pass(s)
    - Exec time: [0.0, 8.76] s

  * igt@xe_oa@non-zero-reason@ccs-0:
    - Statuses : 1 fail(s) 1 pass(s)
    - Exec time: [2.74, 8.75] s

  * igt@xe_oa@non-zero-reason@rcs-0:
    - Statuses : 2 pass(s)
    - Exec time: [2.86, 7.48] s

  * igt@xe_oa@oa-exponents:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [0.0, 3.44] s

  * igt@xe_oa@oa-exponents@ccs-0:
    - Statuses : 2 pass(s)
    - Exec time: [1.92, 2.82] s

  * igt@xe_oa@oa-exponents@rcs-0:
    - Statuses : 2 pass(s)
    - Exec time: [3.41, 3.44] s

  * igt@xe_oa@oa-formats:
    - Statuses : 2 fail(s) 3 pass(s)
    - Exec time: [0.0, 0.14] s

  * igt@xe_oa@oa-formats@rcs-0:
    - Statuses : 1 fail(s) 3 pass(s)
    - Exec time: [0.01, 0.14] s

  * igt@xe_oa@oa-regs-whitelisted:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [0.0, 0.27] s

  * igt@xe_oa@oa-regs-whitelisted@ccs-0:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@xe_oa@oa-regs-whitelisted@rcs-0:
    - Statuses : 3 pass(s)
    - Exec time: [0.01, 0.27] s

  * igt@xe_oa@oa-tlb-invalidate:
    - Statuses : 1 fail(s) 3 pass(s) 1 skip(s)
    - Exec time: [0.0, 10.05] s

  * igt@xe_oa@oa-tlb-invalidate@ccs-0:
    - Statuses : 1 pass(s)
    - Exec time: [10.05] s

  * igt@xe_oa@oa-tlb-invalidate@rcs-0:
    - Statuses : 2 pass(s)
    - Exec time: [10.03] s

  * igt@xe_oa@oa-unit-concurrent-oa-buffer-read:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [0.0, 1.04] s

  * igt@xe_oa@oa-unit-exclusive-stream-exec-q:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_oa@oa-unit-exclusive-stream-sample-oa:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_oa@polling:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [0.0, 1.04] s

  * igt@xe_oa@polling-small-buf:
    - Statuses : 2 fail(s) 3 pass(s)
    - Exec time: [0.0, 0.10] s

  * igt@xe_oa@polling@ccs-0:
    - Statuses : 1 pass(s)
    - Exec time: [1.03] s

  * igt@xe_oa@polling@rcs-0:
    - Statuses : 3 pass(s)
    - Exec time: [1.02, 1.04] s

  * igt@xe_oa@privileged-forked-access-vaddr:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [0.0, 0.06] s

  * igt@xe_oa@privileged-forked-access-vaddr@ccs-0:
    - Statuses : 2 pass(s)
    - Exec time: [0.03, 0.06] s

  * igt@xe_oa@privileged-forked-access-vaddr@rcs-0:
    - Statuses : 2 pass(s)
    - Exec time: [0.02] s

  * igt@xe_oa@rc6-disable:
    - Statuses : 1 fail(s) 3 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.17] s

  * igt@xe_oa@short-reads:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_oa@stress-open-close:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [0.0, 2.24] s

  * igt@xe_oa@stress-open-close@ccs-0:
    - Statuses : 1 pass(s)
    - Exec time: [2.21] s

  * igt@xe_oa@stress-open-close@rcs-0:
    - Statuses : 3 pass(s)
    - Exec time: [2.17, 2.24] s

  * igt@xe_oa@sysctl-defaults:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@xe_oa@unprivileged-single-ctx-counters:
    - Statuses : 1 fail(s) 3 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_oa@unprivileged-single-ctx-counters@rcs-0:
    - Statuses : 3 pass(s)
    - Exec time: [0.01, 0.05] s

  * igt@xe_oa@whitelisted-registers-userspace-config:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_oa@xe-ref-count:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_11341_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [PASS][11] -> [DMESG-FAIL][12] ([Intel XE#324])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7908/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11341/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  
#### Possible fixes ####

  * igt@xe_exec_compute_mode@twice-userptr-invalidate:
    - {bat-lnl-1}:        [FAIL][13] ([Intel XE#1069]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7908/bat-lnl-1/igt@xe_exec_compute_mode@twice-userptr-invalidate.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11341/bat-lnl-1/igt@xe_exec_compute_mode@twice-userptr-invalidate.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324


Build changes
-------------

  * IGT: IGT_7908 -> IGTPW_11341
  * Linux: xe-1546-886eeb6d89b58f914ee5045fcac54b59a73d8299 -> xe-1548-886eeb6d89b58f914ee5045fcac54b59a73d8299

  IGTPW_11341: 11341
  IGT_7908: 7908
  xe-1546-886eeb6d89b58f914ee5045fcac54b59a73d8299: 886eeb6d89b58f914ee5045fcac54b59a73d8299
  xe-1548-886eeb6d89b58f914ee5045fcac54b59a73d8299: 886eeb6d89b58f914ee5045fcac54b59a73d8299

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11341/index.html

--===============4385386931644990773==
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
<tr><td><b>Series:</b></td><td>Intel Xe OA IGT&#x27;s (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/130033/">https://patchwork.freedesktop.org/series/130033/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11341/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11341/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7908_BAT -&gt; XEIGTPW_11341_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_11341_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@xe_oa@mi-rpc} (NEW):</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11341/bat-dg2-oem2/igt@xe_oa@mi-rpc.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>{igt@xe_oa@mi-rpc@ccs-0} (NEW):</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11341/bat-atsm-2/igt@xe_oa@mi-rpc@ccs-0.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>{igt@xe_oa@non-zero-reason} (NEW):</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11341/bat-dg2-oem2/igt@xe_oa@non-zero-reason.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>{igt@xe_oa@oa-tlb-invalidate} (NEW):</p>
<ul>
<li>{bat-lnl-1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11341/bat-lnl-1/igt@xe_oa@oa-tlb-invalidate.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@xe_oa@polling-small-buf} (NEW):</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11341/bat-atsm-2/igt@xe_oa@polling-small-buf.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@xe_oa@rc6-disable} (NEW):</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11341/bat-atsm-2/igt@xe_oa@rc6-disable.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>{igt@xe_oa@whitelisted-registers-userspace-config} (NEW):</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11341/bat-pvc-2/igt@xe_oa@whitelisted-registers-userspace-config.html">FAIL</a> +35 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@xe_oa@xe-ref-count} (NEW):</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11341/bat-adlp-7/igt@xe_oa@xe-ref-count.html">SKIP</a> +1 other test skip</li>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11341/bat-pvc-2/igt@xe_oa@xe-ref-count.html">SKIP</a></li>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11341/bat-dg2-oem2/igt@xe_oa@xe-ref-count.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_7908_BAT and XEIGTPW_11341_BAT:</p>
<h3>New IGT tests (71)</h3>
<ul>
<li>
<p>igt@xe_oa@blocking:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s)</li>
<li>Exec time: [0.0, 1.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@blocking@ccs-0:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.02, 1.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@blocking@rcs-0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@buffer-fill:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s)</li>
<li>Exec time: [0.0, 6.89] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@buffer-fill@rcs-0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [1.00, 6.89] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@closed-fd-and-unmapped-access:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s)</li>
<li>Exec time: [0.0, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@closed-fd-and-unmapped-access@ccs-0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@closed-fd-and-unmapped-access@rcs-0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@create-destroy-userspace-config:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@disabled-read-error:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@enable-disable:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s)</li>
<li>Exec time: [0.0, 4.83] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@enable-disable@rcs-0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.98, 4.83] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-create-userspace-config:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-map-oa-buffer:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-map-oa-buffer@rcs-0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-oa-exponent:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-oa-format-id:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-oa-metric-set-id:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-remove-userspace-config:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@map-oa-buffer:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s)</li>
<li>Exec time: [0.0, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@map-oa-buffer@ccs-0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@map-oa-buffer@rcs-0:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mi-rpc:</p>
<ul>
<li>Statuses : 1 fail(s) 2 incomplete(s) 2 pass(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mi-rpc@ccs-0:</p>
<ul>
<li>Statuses : 1 incomplete(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mi-rpc@rcs-0:</p>
<ul>
<li>Statuses : 1 incomplete(s) 2 pass(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@missing-sample-flags:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mmio-triggered-reports:</p>
<ul>
<li>Statuses : 1 fail(s) 3 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mmio-triggered-reports@ccs-0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mmio-triggered-reports@rcs-0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.01, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-privileged-access-vaddr:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s)</li>
<li>Exec time: [0.0, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-privileged-access-vaddr@ccs-0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-privileged-access-vaddr@rcs-0:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-privileged-map-oa-buffer:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s)</li>
<li>Exec time: [0.0, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-privileged-map-oa-buffer@ccs-0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.06] s</li>
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
<li>Statuses : 1 fail(s) 4 pass(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-system-wide-paranoid:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s)</li>
<li>Exec time: [0.0, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-zero-reason:</p>
<ul>
<li>Statuses : 2 fail(s) 3 pass(s)</li>
<li>Exec time: [0.0, 8.76] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-zero-reason@ccs-0:</p>
<ul>
<li>Statuses : 1 fail(s) 1 pass(s)</li>
<li>Exec time: [2.74, 8.75] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-zero-reason@rcs-0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.86, 7.48] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-exponents:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s)</li>
<li>Exec time: [0.0, 3.44] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-exponents@ccs-0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.92, 2.82] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-exponents@rcs-0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.41, 3.44] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-formats:</p>
<ul>
<li>Statuses : 2 fail(s) 3 pass(s)</li>
<li>Exec time: [0.0, 0.14] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-formats@rcs-0:</p>
<ul>
<li>Statuses : 1 fail(s) 3 pass(s)</li>
<li>Exec time: [0.01, 0.14] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-regs-whitelisted:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s)</li>
<li>Exec time: [0.0, 0.27] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-regs-whitelisted@ccs-0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-regs-whitelisted@rcs-0:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.01, 0.27] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-tlb-invalidate:</p>
<ul>
<li>Statuses : 1 fail(s) 3 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 10.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-tlb-invalidate@ccs-0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-tlb-invalidate@rcs-0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [10.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-unit-concurrent-oa-buffer-read:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s)</li>
<li>Exec time: [0.0, 1.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-unit-exclusive-stream-exec-q:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-unit-exclusive-stream-sample-oa:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@polling:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s)</li>
<li>Exec time: [0.0, 1.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@polling-small-buf:</p>
<ul>
<li>Statuses : 2 fail(s) 3 pass(s)</li>
<li>Exec time: [0.0, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@polling@ccs-0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@polling@rcs-0:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.02, 1.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@privileged-forked-access-vaddr:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s)</li>
<li>Exec time: [0.0, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@privileged-forked-access-vaddr@ccs-0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.03, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@privileged-forked-access-vaddr@rcs-0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@rc6-disable:</p>
<ul>
<li>Statuses : 1 fail(s) 3 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@short-reads:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@stress-open-close:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s)</li>
<li>Exec time: [0.0, 2.24] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@stress-open-close@ccs-0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.21] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@stress-open-close@rcs-0:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [2.17, 2.24] s</li>
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
<li>Statuses : 1 fail(s) 3 pass(s) 1 skip(s)</li>
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
<li>Statuses : 1 fail(s) 4 pass(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@xe-ref-count:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11341_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_frontbuffer_tracking@basic:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7908/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11341/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_exec_compute_mode@twice-userptr-invalidate:<ul>
<li>{bat-lnl-1}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7908/bat-lnl-1/igt@xe_exec_compute_mode@twice-userptr-invalidate.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069">Intel XE#1069</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11341/bat-lnl-1/igt@xe_exec_compute_mode@twice-userptr-invalidate.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7908 -&gt; IGTPW_11341</li>
<li>Linux: xe-1546-886eeb6d89b58f914ee5045fcac54b59a73d8299 -&gt; xe-1548-886eeb6d89b58f914ee5045fcac54b59a73d8299</li>
</ul>
<p>IGTPW_11341: 11341<br />
  IGT_7908: 7908<br />
  xe-1546-886eeb6d89b58f914ee5045fcac54b59a73d8299: 886eeb6d89b58f914ee5045fcac54b59a73d8299<br />
  xe-1548-886eeb6d89b58f914ee5045fcac54b59a73d8299: 886eeb6d89b58f914ee5045fcac54b59a73d8299</p>

</body>
</html>

--===============4385386931644990773==--
