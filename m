Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EA16C2BA18
	for <igt-dev@archiver.kernel.org>; Thu, 20 Jun 2024 20:36:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89F4A10E250;
	Thu, 20 Jun 2024 20:36:22 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E84810E250;
 Thu, 20 Jun 2024 20:36:21 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7179747785319945908=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_Intel_Xe_OA_IGT=27s_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ashutosh Dixit" <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 20 Jun 2024 20:36:21 -0000
Message-ID: <171891578144.127478.8972270853436371298@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240620200054.3550653-1-ashutosh.dixit@intel.com>
In-Reply-To: <20240620200054.3550653-1-ashutosh.dixit@intel.com>
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

--===============7179747785319945908==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Intel Xe OA IGT's (rev4)
URL   : https://patchwork.freedesktop.org/series/130033/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7894_BAT -> XEIGTPW_11290_BAT
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

  Here are the unknown changes that may have been introduced in XEIGTPW_11290_BAT:

### IGT changes ###

#### Possible regressions ####

  * {igt@xe_oa@mi-rpc} (NEW):
    - bat-dg2-oem2:       NOTRUN -> [INCOMPLETE][1] +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11290/bat-dg2-oem2/igt@xe_oa@mi-rpc.html

  * {igt@xe_oa@mi-rpc@ccs-0} (NEW):
    - bat-atsm-2:         NOTRUN -> [INCOMPLETE][2] +1 other test incomplete
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11290/bat-atsm-2/igt@xe_oa@mi-rpc@ccs-0.html

  * {igt@xe_oa@mmio-triggered-reports} (NEW):
    - bat-adlp-7:         NOTRUN -> [SKIP][3]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11290/bat-adlp-7/igt@xe_oa@mmio-triggered-reports.html

  * {igt@xe_oa@oa-formats@rcs-0} (NEW):
    - bat-dg2-oem2:       NOTRUN -> [FAIL][4] +3 other tests fail
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11290/bat-dg2-oem2/igt@xe_oa@oa-formats@rcs-0.html

  * {igt@xe_oa@polling-small-buf} (NEW):
    - bat-atsm-2:         NOTRUN -> [FAIL][5]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11290/bat-atsm-2/igt@xe_oa@polling-small-buf.html

  * {igt@xe_oa@rc6-disable} (NEW):
    - bat-atsm-2:         NOTRUN -> [SKIP][6]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11290/bat-atsm-2/igt@xe_oa@rc6-disable.html

  * {igt@xe_oa@unprivileged-single-ctx-counters} (NEW):
    - {bat-lnl-1}:        NOTRUN -> [SKIP][7]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11290/bat-lnl-1/igt@xe_oa@unprivileged-single-ctx-counters.html

  * {igt@xe_oa@whitelisted-registers-userspace-config} (NEW):
    - bat-pvc-2:          NOTRUN -> [FAIL][8] +36 other tests fail
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11290/bat-pvc-2/igt@xe_oa@whitelisted-registers-userspace-config.html

  * {igt@xe_oa@xe-ref-count} (NEW):
    - {bat-lnl-1}:        NOTRUN -> [INCOMPLETE][9]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11290/bat-lnl-1/igt@xe_oa@xe-ref-count.html

  
New tests
---------

  New tests have been introduced between XEIGT_7894_BAT and XEIGTPW_11290_BAT:

### New IGT tests (70) ###

  * igt@xe_oa@blocking:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [0.0, 1.03] s

  * igt@xe_oa@blocking@ccs-0:
    - Statuses : 2 pass(s)
    - Exec time: [1.01, 1.03] s

  * igt@xe_oa@blocking@rcs-0:
    - Statuses : 2 pass(s)
    - Exec time: [1.03] s

  * igt@xe_oa@buffer-fill:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [0.0, 6.74] s

  * igt@xe_oa@buffer-fill@ccs-0:
    - Statuses : 3 pass(s)
    - Exec time: [1.00, 6.74] s

  * igt@xe_oa@buffer-fill@rcs-0:
    - Statuses : 1 pass(s)
    - Exec time: [2.28] s

  * igt@xe_oa@closed-fd-and-unmapped-access:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [0.0, 0.10] s

  * igt@xe_oa@closed-fd-and-unmapped-access@rcs-0:
    - Statuses : 4 pass(s)
    - Exec time: [0.10] s

  * igt@xe_oa@create-destroy-userspace-config:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_oa@disabled-read-error:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [0.0, 0.03] s

  * igt@xe_oa@enable-disable:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [0.0, 4.79] s

  * igt@xe_oa@enable-disable@ccs-0:
    - Statuses : 3 pass(s)
    - Exec time: [0.98, 4.79] s

  * igt@xe_oa@enable-disable@rcs-0:
    - Statuses : 1 pass(s)
    - Exec time: [2.22] s

  * igt@xe_oa@invalid-create-userspace-config:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_oa@invalid-map-oa-buffer:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_oa@invalid-map-oa-buffer@ccs-0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_oa@invalid-map-oa-buffer@rcs-0:
    - Statuses : 3 pass(s)
    - Exec time: [0.01] s

  * igt@xe_oa@invalid-oa-exponent:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_oa@invalid-oa-format-id:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_oa@invalid-oa-metric-set-id:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_oa@invalid-remove-userspace-config:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [0.0, 0.05] s

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
    - Exec time: [0.0, 0.05] s

  * igt@xe_oa@mmio-triggered-reports@ccs-0:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@xe_oa@mmio-triggered-reports@rcs-0:
    - Statuses : 2 pass(s)
    - Exec time: [0.01, 0.03] s

  * igt@xe_oa@non-privileged-access-vaddr:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_oa@non-privileged-access-vaddr@ccs-0:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@xe_oa@non-privileged-access-vaddr@rcs-0:
    - Statuses : 3 pass(s)
    - Exec time: [0.02] s

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
    - Exec time: [0.0, 0.09] s

  * igt@xe_oa@non-zero-reason:
    - Statuses : 2 fail(s) 3 pass(s)
    - Exec time: [0.0, 8.81] s

  * igt@xe_oa@non-zero-reason@ccs-0:
    - Statuses : 1 pass(s)
    - Exec time: [8.81] s

  * igt@xe_oa@non-zero-reason@rcs-0:
    - Statuses : 1 fail(s) 2 pass(s)
    - Exec time: [2.76, 7.46] s

  * igt@xe_oa@oa-exponents:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [0.0, 3.38] s

  * igt@xe_oa@oa-exponents@rcs-0:
    - Statuses : 4 pass(s)
    - Exec time: [1.94, 3.38] s

  * igt@xe_oa@oa-formats:
    - Statuses : 2 fail(s) 3 pass(s)
    - Exec time: [0.0, 0.12] s

  * igt@xe_oa@oa-formats@rcs-0:
    - Statuses : 1 fail(s) 3 pass(s)
    - Exec time: [0.01, 0.12] s

  * igt@xe_oa@oa-regs-whitelisted:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [0.0, 0.24] s

  * igt@xe_oa@oa-regs-whitelisted@rcs-0:
    - Statuses : 4 pass(s)
    - Exec time: [0.01, 0.24] s

  * igt@xe_oa@oa-tlb-invalidate:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [0.0, 10.05] s

  * igt@xe_oa@oa-tlb-invalidate@ccs-0:
    - Statuses : 1 pass(s)
    - Exec time: [10.04] s

  * igt@xe_oa@oa-tlb-invalidate@rcs-0:
    - Statuses : 3 pass(s)
    - Exec time: [10.03, 10.04] s

  * igt@xe_oa@oa-unit-concurrent-oa-buffer-read:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [0.0, 1.05] s

  * igt@xe_oa@oa-unit-exclusive-stream-exec-q:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_oa@oa-unit-exclusive-stream-sample-oa:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_oa@polling:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [0.0, 1.03] s

  * igt@xe_oa@polling-small-buf:
    - Statuses : 2 fail(s) 3 pass(s)
    - Exec time: [0.0, 0.10] s

  * igt@xe_oa@polling@ccs-0:
    - Statuses : 2 pass(s)
    - Exec time: [1.02] s

  * igt@xe_oa@polling@rcs-0:
    - Statuses : 2 pass(s)
    - Exec time: [1.03] s

  * igt@xe_oa@privileged-forked-access-vaddr:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [0.0, 0.06] s

  * igt@xe_oa@privileged-forked-access-vaddr@rcs-0:
    - Statuses : 4 pass(s)
    - Exec time: [0.02, 0.06] s

  * igt@xe_oa@rc6-disable:
    - Statuses : 1 fail(s) 3 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.16] s

  * igt@xe_oa@short-reads:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_oa@stress-open-close:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [0.0, 2.29] s

  * igt@xe_oa@stress-open-close@ccs-0:
    - Statuses : 1 pass(s)
    - Exec time: [2.18] s

  * igt@xe_oa@stress-open-close@rcs-0:
    - Statuses : 3 pass(s)
    - Exec time: [2.17, 2.29] s

  * igt@xe_oa@sysctl-defaults:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@xe_oa@unprivileged-single-ctx-counters:
    - Statuses : 1 fail(s) 3 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_oa@unprivileged-single-ctx-counters@rcs-0:
    - Statuses : 3 pass(s)
    - Exec time: [0.01, 0.04] s

  * igt@xe_oa@whitelisted-registers-userspace-config:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [0.0] s

  * igt@xe_oa@xe-ref-count:
    - Statuses : 1 fail(s) 1 incomplete(s) 3 pass(s)
    - Exec time: [0.0, 0.04] s

  

  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).



Build changes
-------------

  * IGT: IGT_7894 -> IGTPW_11290
  * Linux: xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357 -> xe-1508-300968fc8a02f50ce96efdc9be4f1f17f3a486d4

  IGTPW_11290: 11290
  IGT_7894: 7894
  xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357: 65ef303b3a8a20609f394e0a823ade01cb4f1357
  xe-1508-300968fc8a02f50ce96efdc9be4f1f17f3a486d4: 300968fc8a02f50ce96efdc9be4f1f17f3a486d4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11290/index.html

--===============7179747785319945908==
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
<tr><td><b>Series:</b></td><td>Intel Xe OA IGT&#x27;s (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/130033/">https://patchwork.freedesktop.org/series/130033/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11290/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11290/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7894_BAT -&gt; XEIGTPW_11290_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_11290_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@xe_oa@mi-rpc} (NEW):</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11290/bat-dg2-oem2/igt@xe_oa@mi-rpc.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>{igt@xe_oa@mi-rpc@ccs-0} (NEW):</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11290/bat-atsm-2/igt@xe_oa@mi-rpc@ccs-0.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>{igt@xe_oa@mmio-triggered-reports} (NEW):</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11290/bat-adlp-7/igt@xe_oa@mmio-triggered-reports.html">SKIP</a></li>
</ul>
</li>
<li>
<p>{igt@xe_oa@oa-formats@rcs-0} (NEW):</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11290/bat-dg2-oem2/igt@xe_oa@oa-formats@rcs-0.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@xe_oa@polling-small-buf} (NEW):</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11290/bat-atsm-2/igt@xe_oa@polling-small-buf.html">FAIL</a></li>
</ul>
</li>
<li>
<p>{igt@xe_oa@rc6-disable} (NEW):</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11290/bat-atsm-2/igt@xe_oa@rc6-disable.html">SKIP</a></li>
</ul>
</li>
<li>
<p>{igt@xe_oa@unprivileged-single-ctx-counters} (NEW):</p>
<ul>
<li>{bat-lnl-1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11290/bat-lnl-1/igt@xe_oa@unprivileged-single-ctx-counters.html">SKIP</a></li>
</ul>
</li>
<li>
<p>{igt@xe_oa@whitelisted-registers-userspace-config} (NEW):</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11290/bat-pvc-2/igt@xe_oa@whitelisted-registers-userspace-config.html">FAIL</a> +36 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@xe_oa@xe-ref-count} (NEW):</p>
<ul>
<li>{bat-lnl-1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11290/bat-lnl-1/igt@xe_oa@xe-ref-count.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_7894_BAT and XEIGTPW_11290_BAT:</p>
<h3>New IGT tests (70)</h3>
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
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.01, 1.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@blocking@rcs-0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@buffer-fill:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s)</li>
<li>Exec time: [0.0, 6.74] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@buffer-fill@ccs-0:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.00, 6.74] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@buffer-fill@rcs-0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.28] s</li>
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
<p>igt@xe_oa@closed-fd-and-unmapped-access@rcs-0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
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
<li>Exec time: [0.0, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@enable-disable:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s)</li>
<li>Exec time: [0.0, 4.79] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@enable-disable@ccs-0:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.98, 4.79] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@enable-disable@rcs-0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.22] s</li>
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
<p>igt@xe_oa@invalid-map-oa-buffer@ccs-0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
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
<li>Statuses : 1 fail(s) 4 pass(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-oa-format-id:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
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
<li>Exec time: [0.0, 0.05] s</li>
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
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mmio-triggered-reports@ccs-0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
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
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-privileged-access-vaddr@ccs-0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
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
<li>Exec time: [0.0, 0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-zero-reason:</p>
<ul>
<li>Statuses : 2 fail(s) 3 pass(s)</li>
<li>Exec time: [0.0, 8.81] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-zero-reason@ccs-0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [8.81] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-zero-reason@rcs-0:</p>
<ul>
<li>Statuses : 1 fail(s) 2 pass(s)</li>
<li>Exec time: [2.76, 7.46] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-exponents:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s)</li>
<li>Exec time: [0.0, 3.38] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-exponents@rcs-0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [1.94, 3.38] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-formats:</p>
<ul>
<li>Statuses : 2 fail(s) 3 pass(s)</li>
<li>Exec time: [0.0, 0.12] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-formats@rcs-0:</p>
<ul>
<li>Statuses : 1 fail(s) 3 pass(s)</li>
<li>Exec time: [0.01, 0.12] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-regs-whitelisted:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s)</li>
<li>Exec time: [0.0, 0.24] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-regs-whitelisted@rcs-0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.01, 0.24] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-tlb-invalidate:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s)</li>
<li>Exec time: [0.0, 10.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-tlb-invalidate@ccs-0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-tlb-invalidate@rcs-0:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [10.03, 10.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-unit-concurrent-oa-buffer-read:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s)</li>
<li>Exec time: [0.0, 1.05] s</li>
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
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@polling:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s)</li>
<li>Exec time: [0.0, 1.03] s</li>
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
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@polling@rcs-0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.03] s</li>
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
<p>igt@xe_oa@privileged-forked-access-vaddr@rcs-0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.02, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@rc6-disable:</p>
<ul>
<li>Statuses : 1 fail(s) 3 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.16] s</li>
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
<li>Exec time: [0.0, 2.29] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@stress-open-close@ccs-0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.18] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@stress-open-close@rcs-0:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [2.17, 2.29] s</li>
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
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@unprivileged-single-ctx-counters@rcs-0:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.01, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@whitelisted-registers-userspace-config:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@xe-ref-count:</p>
<ul>
<li>Statuses : 1 fail(s) 1 incomplete(s) 3 pass(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7894 -&gt; IGTPW_11290</li>
<li>Linux: xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357 -&gt; xe-1508-300968fc8a02f50ce96efdc9be4f1f17f3a486d4</li>
</ul>
<p>IGTPW_11290: 11290<br />
  IGT_7894: 7894<br />
  xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357: 65ef303b3a8a20609f394e0a823ade01cb4f1357<br />
  xe-1508-300968fc8a02f50ce96efdc9be4f1f17f3a486d4: 300968fc8a02f50ce96efdc9be4f1f17f3a486d4</p>

</body>
</html>

--===============7179747785319945908==--
