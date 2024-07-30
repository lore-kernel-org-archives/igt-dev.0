Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE69DC3DA49
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jul 2024 16:55:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8038610E22E;
	Tue, 30 Jul 2024 16:55:44 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9414210E05F;
 Tue, 30 Jul 2024 16:55:42 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0746885793126990028=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_tests/intel/xe=5Fsysfs=5Fpreem?=
 =?utf-8?q?pt=5Ftimeout=3A_Porting_sysfs_preempt_test_in_xe_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: nakshtra.goyal@intel.com
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 30 Jul 2024 16:55:42 -0000
Message-ID: <172235854260.431178.18310488048447798553@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240730133145.3627346-1-nakshtra.goyal@intel.com>
In-Reply-To: <20240730133145.3627346-1-nakshtra.goyal@intel.com>
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

--===============0746885793126990028==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_sysfs_preempt_timeout: Porting sysfs preempt test in xe (rev3)
URL   : https://patchwork.freedesktop.org/series/136449/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7942_BAT -> XEIGTPW_11496_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (7 -> 7)
------------------------------

  No changes in participating hosts

New tests
---------

  New tests have been introduced between XEIGT_7942_BAT and XEIGTPW_11496_BAT:

### New IGT tests (6) ###

  * igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout:
    - Statuses : 4 pass(s)
    - Exec time: [11.51, 14.16] s

  * igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout@bcs:
    - Statuses : 4 pass(s)
    - Exec time: [1.45, 3.22] s

  * igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout@ccs:
    - Statuses : 3 pass(s)
    - Exec time: [2.06, 2.70] s

  * igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout@rcs:
    - Statuses : 4 pass(s)
    - Exec time: [2.44, 3.22] s

  * igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout@vcs:
    - Statuses : 4 pass(s)
    - Exec time: [2.44, 3.22] s

  * igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout@vecs:
    - Statuses : 4 pass(s)
    - Exec time: [2.59, 3.08] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_11496_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_intel_bb@blit-simple:
    - {bat-lnl-2}:        [DMESG-WARN][1] ([Intel XE#1705]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/bat-lnl-2/igt@xe_intel_bb@blit-simple.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11496/bat-lnl-2/igt@xe_intel_bb@blit-simple.html

  
#### Warnings ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-bmg-1:          [ABORT][3] ([Intel XE#2418]) -> [ABORT][4] ([Intel XE#2418] / [Intel XE#2421])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11496/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html
    - bat-adlp-7:         [ABORT][5] ([Intel XE#2418]) -> [ABORT][6] ([Intel XE#2418] / [Intel XE#2421])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11496/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html
    - bat-lnl-1:          [ABORT][7] ([Intel XE#2418]) -> [ABORT][8] ([Intel XE#2418] / [Intel XE#2421])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/bat-lnl-1/igt@core_hotunplug@unbind-rebind.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11496/bat-lnl-1/igt@core_hotunplug@unbind-rebind.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1705
  [Intel XE#2418]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2418
  [Intel XE#2421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2421


Build changes
-------------

  * IGT: IGT_7942 -> IGTPW_11496
  * Linux: xe-1684-3a93d4a1f4872fbdfe43e9b7f1a7dfd9236a642d -> xe-1691-acd846e309e206a4dbc83e4b857b6604aa0741af

  IGTPW_11496: 11496
  IGT_7942: 0f02dc176959e6296866b1bafd3982e277a5e44b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1684-3a93d4a1f4872fbdfe43e9b7f1a7dfd9236a642d: 3a93d4a1f4872fbdfe43e9b7f1a7dfd9236a642d
  xe-1691-acd846e309e206a4dbc83e4b857b6604aa0741af: acd846e309e206a4dbc83e4b857b6604aa0741af

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11496/index.html

--===============0746885793126990028==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_sysfs_preempt_timeout: Porting sysfs preempt test in xe (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/136449/">https://patchwork.freedesktop.org/series/136449/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11496/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11496/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7942_BAT -&gt; XEIGTPW_11496_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>No changes in participating hosts</p>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_7942_BAT and XEIGTPW_11496_BAT:</p>
<h3>New IGT tests (6)</h3>
<ul>
<li>
<p>igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [11.51, 14.16] s</li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout@bcs:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [1.45, 3.22] s</li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout@ccs:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [2.06, 2.70] s</li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout@rcs:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [2.44, 3.22] s</li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout@vcs:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [2.44, 3.22] s</li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout@vecs:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [2.59, 3.08] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11496_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_intel_bb@blit-simple:<ul>
<li>{bat-lnl-2}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/bat-lnl-2/igt@xe_intel_bb@blit-simple.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1705">Intel XE#1705</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11496/bat-lnl-2/igt@xe_intel_bb@blit-simple.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@core_hotunplug@unbind-rebind:<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2418">Intel XE#2418</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11496/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2418">Intel XE#2418</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2421">Intel XE#2421</a>)</li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2418">Intel XE#2418</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11496/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2418">Intel XE#2418</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2421">Intel XE#2421</a>)</li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/bat-lnl-1/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2418">Intel XE#2418</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11496/bat-lnl-1/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2418">Intel XE#2418</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2421">Intel XE#2421</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7942 -&gt; IGTPW_11496</li>
<li>Linux: xe-1684-3a93d4a1f4872fbdfe43e9b7f1a7dfd9236a642d -&gt; xe-1691-acd846e309e206a4dbc83e4b857b6604aa0741af</li>
</ul>
<p>IGTPW_11496: 11496<br />
  IGT_7942: 0f02dc176959e6296866b1bafd3982e277a5e44b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1684-3a93d4a1f4872fbdfe43e9b7f1a7dfd9236a642d: 3a93d4a1f4872fbdfe43e9b7f1a7dfd9236a642d<br />
  xe-1691-acd846e309e206a4dbc83e4b857b6604aa0741af: acd846e309e206a4dbc83e4b857b6604aa0741af</p>

</body>
</html>

--===============0746885793126990028==--
