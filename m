Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4FA7C3271E
	for <igt-dev@archiver.kernel.org>; Fri,  5 Jul 2024 19:19:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9240C10E2B8;
	Fri,  5 Jul 2024 19:19:30 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92FB210E2B8;
 Fri,  5 Jul 2024 19:19:29 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5206416331258738017=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_Intel_Xe_OA_IGT=27s_=28rev10?=
 =?utf-8?q?=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ashutosh Dixit" <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 05 Jul 2024 19:19:29 -0000
Message-ID: <172020716959.31975.7201993609305263082@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240705182637.2679730-1-ashutosh.dixit@intel.com>
In-Reply-To: <20240705182637.2679730-1-ashutosh.dixit@intel.com>
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

--===============5206416331258738017==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Intel Xe OA IGT's (rev10)
URL   : https://patchwork.freedesktop.org/series/130033/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7917_BAT -> XEIGTPW_11378_BAT
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

  Here are the unknown changes that may have been introduced in XEIGTPW_11378_BAT:

### IGT changes ###

#### Possible regressions ####

  * {igt@xe_oa@invalid-oa-metric-set-id} (NEW):
    - bat-atsm-2:         NOTRUN -> [SKIP][1] +36 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11378/bat-atsm-2/igt@xe_oa@invalid-oa-metric-set-id.html

  * {igt@xe_oa@rc6-disable} (NEW):
    - bat-adlp-7:         NOTRUN -> [SKIP][2] +36 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11378/bat-adlp-7/igt@xe_oa@rc6-disable.html

  * {igt@xe_oa@whitelisted-registers-userspace-config} (NEW):
    - {bat-lnl-1}:        NOTRUN -> [SKIP][3] +36 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11378/bat-lnl-1/igt@xe_oa@whitelisted-registers-userspace-config.html
    - bat-pvc-2:          NOTRUN -> [SKIP][4] +36 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11378/bat-pvc-2/igt@xe_oa@whitelisted-registers-userspace-config.html
    - bat-dg2-oem2:       NOTRUN -> [SKIP][5] +36 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11378/bat-dg2-oem2/igt@xe_oa@whitelisted-registers-userspace-config.html

  
New tests
---------

  New tests have been introduced between XEIGT_7917_BAT and XEIGTPW_11378_BAT:

### New IGT tests (37) ###

  * igt@xe_oa@blocking:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_oa@buffer-fill:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_oa@closed-fd-and-unmapped-access:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_oa@create-destroy-userspace-config:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_oa@disabled-read-error:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_oa@enable-disable:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_oa@invalid-create-userspace-config:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_oa@invalid-map-oa-buffer:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_oa@invalid-oa-exponent:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_oa@invalid-oa-format-id:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_oa@invalid-oa-metric-set-id:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_oa@invalid-remove-userspace-config:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_oa@map-oa-buffer:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_oa@mi-rpc:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_oa@missing-sample-flags:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_oa@mmio-triggered-reports:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_oa@non-privileged-access-vaddr:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_oa@non-privileged-map-oa-buffer:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_oa@non-sampling-read-error:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_oa@non-system-wide-paranoid:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_oa@non-zero-reason:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_oa@oa-exponents:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_oa@oa-formats:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_oa@oa-regs-whitelisted:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_oa@oa-tlb-invalidate:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_oa@oa-unit-concurrent-oa-buffer-read:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_oa@oa-unit-exclusive-stream-exec-q:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_oa@oa-unit-exclusive-stream-sample-oa:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_oa@polling:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_oa@polling-small-buf:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_oa@privileged-forked-access-vaddr:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_oa@rc6-disable:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_oa@short-reads:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_oa@stress-open-close:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_oa@sysctl-defaults:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_oa@unprivileged-single-ctx-counters:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_oa@whitelisted-registers-userspace-config:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_11378_BAT that come from known issues:

### IGT changes ###

  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886


Build changes
-------------

  * IGT: IGT_7917 -> IGTPW_11378

  IGTPW_11378: 11378
  IGT_7917: a1743ac7ed91ce40d742a351b1600da4f75972b1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1567-cdd1a80a2d16d5213af20a29eb7570a7651db7dc: cdd1a80a2d16d5213af20a29eb7570a7651db7dc

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11378/index.html

--===============5206416331258738017==
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
<tr><td><b>Series:</b></td><td>Intel Xe OA IGT&#x27;s (rev10)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/130033/">https://patchwork.freedesktop.org/series/130033/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11378/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11378/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7917_BAT -&gt; XEIGTPW_11378_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_11378_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@xe_oa@invalid-oa-metric-set-id} (NEW):</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11378/bat-atsm-2/igt@xe_oa@invalid-oa-metric-set-id.html">SKIP</a> +36 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@xe_oa@rc6-disable} (NEW):</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11378/bat-adlp-7/igt@xe_oa@rc6-disable.html">SKIP</a> +36 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@xe_oa@whitelisted-registers-userspace-config} (NEW):</p>
<ul>
<li>{bat-lnl-1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11378/bat-lnl-1/igt@xe_oa@whitelisted-registers-userspace-config.html">SKIP</a> +36 other tests skip</li>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11378/bat-pvc-2/igt@xe_oa@whitelisted-registers-userspace-config.html">SKIP</a> +36 other tests skip</li>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11378/bat-dg2-oem2/igt@xe_oa@whitelisted-registers-userspace-config.html">SKIP</a> +36 other tests skip</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_7917_BAT and XEIGTPW_11378_BAT:</p>
<h3>New IGT tests (37)</h3>
<ul>
<li>
<p>igt@xe_oa@blocking:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@buffer-fill:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@closed-fd-and-unmapped-access:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@create-destroy-userspace-config:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@disabled-read-error:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@enable-disable:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-create-userspace-config:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-map-oa-buffer:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-oa-exponent:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-oa-format-id:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-oa-metric-set-id:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-remove-userspace-config:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@map-oa-buffer:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mi-rpc:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@missing-sample-flags:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mmio-triggered-reports:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-privileged-access-vaddr:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-privileged-map-oa-buffer:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-sampling-read-error:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-system-wide-paranoid:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-zero-reason:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-exponents:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-formats:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-regs-whitelisted:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
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
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-unit-exclusive-stream-exec-q:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-unit-exclusive-stream-sample-oa:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@polling:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@polling-small-buf:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@privileged-forked-access-vaddr:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@rc6-disable:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@short-reads:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@stress-open-close:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_oa@sysctl-defaults:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11378_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7917 -&gt; IGTPW_11378</li>
</ul>
<p>IGTPW_11378: 11378<br />
  IGT_7917: a1743ac7ed91ce40d742a351b1600da4f75972b1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1567-cdd1a80a2d16d5213af20a29eb7570a7651db7dc: cdd1a80a2d16d5213af20a29eb7570a7651db7dc</p>

</body>
</html>

--===============5206416331258738017==--
