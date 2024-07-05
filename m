Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BAABC3271E
	for <igt-dev@archiver.kernel.org>; Fri,  5 Jul 2024 22:38:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BB3410E277;
	Fri,  5 Jul 2024 22:38:41 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E15210E277;
 Fri,  5 Jul 2024 22:38:39 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8670026959648736679=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_Intel_Xe_OA_IGT=27s_=28rev11?=
 =?utf-8?q?=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ashutosh Dixit" <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 05 Jul 2024 22:38:39 -0000
Message-ID: <172021911905.32173.16954875305903027918@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240705214316.2695090-1-ashutosh.dixit@intel.com>
In-Reply-To: <20240705214316.2695090-1-ashutosh.dixit@intel.com>
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

--===============8670026959648736679==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Intel Xe OA IGT's (rev11)
URL   : https://patchwork.freedesktop.org/series/130033/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7917_BAT -> XEIGTPW_11380_BAT
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

  Here are the unknown changes that may have been introduced in XEIGTPW_11380_BAT:

### IGT changes ###

#### Possible regressions ####

  * {igt@xe_oa@invalid-oa-metric-set-id} (NEW):
    - bat-atsm-2:         NOTRUN -> [SKIP][1] +35 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11380/bat-atsm-2/igt@xe_oa@invalid-oa-metric-set-id.html

  * {igt@xe_oa@oa-tlb-invalidate} (NEW):
    - {bat-lnl-1}:        NOTRUN -> [SKIP][2] +1 other test skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11380/bat-lnl-1/igt@xe_oa@oa-tlb-invalidate.html

  * {igt@xe_oa@rc6-disable} (NEW):
    - bat-adlp-7:         NOTRUN -> [SKIP][3] +35 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11380/bat-adlp-7/igt@xe_oa@rc6-disable.html

  * {igt@xe_oa@whitelisted-registers-userspace-config} (NEW):
    - bat-pvc-2:          NOTRUN -> [SKIP][4] +35 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11380/bat-pvc-2/igt@xe_oa@whitelisted-registers-userspace-config.html
    - bat-dg2-oem2:       NOTRUN -> [SKIP][5] +35 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11380/bat-dg2-oem2/igt@xe_oa@whitelisted-registers-userspace-config.html

  
New tests
---------

  New tests have been introduced between XEIGT_7917_BAT and XEIGTPW_11380_BAT:

### New IGT tests (54) ###

  * igt@xe_oa@blocking:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 1.02] s

  * igt@xe_oa@blocking@rcs-0:
    - Statuses : 1 pass(s)
    - Exec time: [1.02] s

  * igt@xe_oa@buffer-fill:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.99] s

  * igt@xe_oa@buffer-fill@ccs-0:
    - Statuses : 1 pass(s)
    - Exec time: [0.99] s

  * igt@xe_oa@closed-fd-and-unmapped-access:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.10] s

  * igt@xe_oa@closed-fd-and-unmapped-access@rcs-0:
    - Statuses : 1 pass(s)
    - Exec time: [0.10] s

  * igt@xe_oa@create-destroy-userspace-config:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_oa@disabled-read-error:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_oa@enable-disable:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.98] s

  * igt@xe_oa@enable-disable@rcs-0:
    - Statuses : 1 pass(s)
    - Exec time: [0.98] s

  * igt@xe_oa@invalid-create-userspace-config:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_oa@invalid-map-oa-buffer:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_oa@invalid-map-oa-buffer@rcs-0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_oa@invalid-oa-exponent:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_oa@invalid-oa-format-id:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_oa@invalid-oa-metric-set-id:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_oa@invalid-remove-userspace-config:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_oa@map-oa-buffer:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.10] s

  * igt@xe_oa@map-oa-buffer@rcs-0:
    - Statuses : 1 pass(s)
    - Exec time: [0.10] s

  * igt@xe_oa@mi-rpc:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_oa@mi-rpc@rcs-0:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_oa@missing-sample-flags:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0] s

  * igt@xe_oa@mmio-triggered-reports:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.03] s

  * igt@xe_oa@mmio-triggered-reports@rcs-0:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_oa@non-privileged-access-vaddr:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_oa@non-privileged-access-vaddr@rcs-0:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@xe_oa@non-privileged-map-oa-buffer:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_oa@non-privileged-map-oa-buffer@rcs-0:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@xe_oa@non-sampling-read-error:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_oa@non-system-wide-paranoid:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.03] s

  * igt@xe_oa@non-zero-reason:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 2.83] s

  * igt@xe_oa@non-zero-reason@rcs-0:
    - Statuses : 1 pass(s)
    - Exec time: [2.83] s

  * igt@xe_oa@oa-exponents:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 3.49] s

  * igt@xe_oa@oa-exponents@ccs-0:
    - Statuses : 1 pass(s)
    - Exec time: [3.49] s

  * igt@xe_oa@oa-formats:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.13] s

  * igt@xe_oa@oa-formats@rcs-0:
    - Statuses : 1 pass(s)
    - Exec time: [0.12] s

  * igt@xe_oa@oa-regs-whitelisted:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_oa@oa-regs-whitelisted@rcs-0:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@xe_oa@oa-tlb-invalidate:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_oa@oa-unit-concurrent-oa-buffer-read:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 1.02] s

  * igt@xe_oa@oa-unit-exclusive-stream-exec-q:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_oa@oa-unit-exclusive-stream-sample-oa:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_oa@polling:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 1.03] s

  * igt@xe_oa@polling-small-buf:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.09] s

  * igt@xe_oa@polling@rcs-0:
    - Statuses : 1 pass(s)
    - Exec time: [1.02] s

  * igt@xe_oa@privileged-forked-access-vaddr:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_oa@privileged-forked-access-vaddr@rcs-0:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@xe_oa@rc6-disable:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.17] s

  * igt@xe_oa@short-reads:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_oa@stress-open-close:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0, 2.17] s

  * igt@xe_oa@stress-open-close@ccs-0:
    - Statuses : 1 pass(s)
    - Exec time: [2.17] s

  * igt@xe_oa@sysctl-defaults:
    - Statuses : 5 pass(s)
    - Exec time: [0.0] s

  * igt@xe_oa@unprivileged-single-ctx-counters:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_oa@whitelisted-registers-userspace-config:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.0] s

  

  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).



Build changes
-------------

  * IGT: IGT_7917 -> IGTPW_11380

  IGTPW_11380: 11380
  IGT_7917: a1743ac7ed91ce40d742a351b1600da4f75972b1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1567-cdd1a80a2d16d5213af20a29eb7570a7651db7dc: cdd1a80a2d16d5213af20a29eb7570a7651db7dc

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11380/index.html

--===============8670026959648736679==
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
<tr><td><b>Series:</b></td><td>Intel Xe OA IGT&#x27;s (rev11)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/130033/">https://patchwork.freedesktop.org/series/130033/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11380/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11380/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7917_BAT -&gt; XEIGTPW_11380_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_11380_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@xe_oa@invalid-oa-metric-set-id} (NEW):</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11380/bat-atsm-2/igt@xe_oa@invalid-oa-metric-set-id.html">SKIP</a> +35 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@xe_oa@oa-tlb-invalidate} (NEW):</p>
<ul>
<li>{bat-lnl-1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11380/bat-lnl-1/igt@xe_oa@oa-tlb-invalidate.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>{igt@xe_oa@rc6-disable} (NEW):</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11380/bat-adlp-7/igt@xe_oa@rc6-disable.html">SKIP</a> +35 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@xe_oa@whitelisted-registers-userspace-config} (NEW):</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11380/bat-pvc-2/igt@xe_oa@whitelisted-registers-userspace-config.html">SKIP</a> +35 other tests skip</li>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11380/bat-dg2-oem2/igt@xe_oa@whitelisted-registers-userspace-config.html">SKIP</a> +35 other tests skip</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_7917_BAT and XEIGTPW_11380_BAT:</p>
<h3>New IGT tests (54)</h3>
<ul>
<li>
<p>igt@xe_oa@blocking:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 1.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@blocking@rcs-0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@buffer-fill:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.99] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@buffer-fill@ccs-0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.99] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@closed-fd-and-unmapped-access:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@closed-fd-and-unmapped-access@rcs-0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@create-destroy-userspace-config:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@disabled-read-error:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@enable-disable:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.98] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@enable-disable@rcs-0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.98] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-create-userspace-config:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-map-oa-buffer:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-map-oa-buffer@rcs-0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-oa-exponent:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-oa-format-id:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-oa-metric-set-id:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-remove-userspace-config:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@map-oa-buffer:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@map-oa-buffer@rcs-0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mi-rpc:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mi-rpc@rcs-0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@missing-sample-flags:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mmio-triggered-reports:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.03] s</li>
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
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-privileged-access-vaddr@rcs-0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-privileged-map-oa-buffer:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-privileged-map-oa-buffer@rcs-0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-sampling-read-error:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-system-wide-paranoid:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-zero-reason:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 2.83] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-zero-reason@rcs-0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.83] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-exponents:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 3.49] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-exponents@ccs-0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.49] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-formats:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-formats@rcs-0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.12] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-regs-whitelisted:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-regs-whitelisted@rcs-0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-tlb-invalidate:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-unit-concurrent-oa-buffer-read:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 1.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-unit-exclusive-stream-exec-q:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-unit-exclusive-stream-sample-oa:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@polling:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 1.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@polling-small-buf:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@polling@rcs-0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@privileged-forked-access-vaddr:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@privileged-forked-access-vaddr@rcs-0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@rc6-disable:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@short-reads:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@stress-open-close:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 2.17] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@stress-open-close@ccs-0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
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
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@whitelisted-registers-userspace-config:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7917 -&gt; IGTPW_11380</li>
</ul>
<p>IGTPW_11380: 11380<br />
  IGT_7917: a1743ac7ed91ce40d742a351b1600da4f75972b1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1567-cdd1a80a2d16d5213af20a29eb7570a7651db7dc: cdd1a80a2d16d5213af20a29eb7570a7651db7dc</p>

</body>
</html>

--===============8670026959648736679==--
