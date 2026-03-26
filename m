Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8381810A88E5
	for <igt-dev@archiver.kernel.org>; Thu, 26 Mar 2026 16:39:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F21C10E96E;
	Thu, 26 Mar 2026 16:39:19 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B454A10E04A;
 Thu, 26 Mar 2026 16:39:12 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8435387989596416718=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_tests/intel/xe=5Fvm=3A_Add?=
 =?utf-8?q?_drm=5Fxe=5Fvm=5Fget=5Fproperty_tests?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jonathan Cavitt" <jonathan.cavitt@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 26 Mar 2026 16:39:12 -0000
Message-ID: <177454315270.402672.7684710141840545640@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260325212208.85743-6-jonathan.cavitt@intel.com>
In-Reply-To: <20260325212208.85743-6-jonathan.cavitt@intel.com>
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

--===============8435387989596416718==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_vm: Add drm_xe_vm_get_property tests
URL   : https://patchwork.freedesktop.org/series/163878/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8831_FULL -> XEIGTPW_14858_FULL
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

New tests
---------

  New tests have been introduced between XEIGT_8831_FULL and XEIGTPW_14858_FULL:

### New IGT tests (5) ###

  * igt@xe_vm@vm-get-property-exercise:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_vm@vm-get-property-invalid-property:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_vm@vm-get-property-invalid-reserved:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_vm@vm-get-property-invalid-size:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_vm@vm-get-property-invalid-vm-id:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_14858_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_pm_dc@dc5-psr:
    - shard-lnl:          [PASS][1] -> [FAIL][2] ([Intel XE#7340]) +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8831/shard-lnl-5/igt@kms_pm_dc@dc5-psr.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14858/shard-lnl-5/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
    - shard-lnl:          [PASS][3] -> [FAIL][4] ([Intel XE#2142]) +1 other test fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8831/shard-lnl-6/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14858/shard-lnl-3/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html

  
#### Possible fixes ####

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:
    - shard-lnl:          [FAIL][5] ([Intel XE#301]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8831/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14858/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [FAIL][7] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][8] +1 other test pass
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8831/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14858/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-lnl:          [FAIL][9] ([Intel XE#2029] / [Intel XE#7395]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8831/shard-lnl-5/igt@kms_pm_dc@deep-pkgc.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14858/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [FAIL][11] ([Intel XE#4459]) -> [PASS][12] +1 other test pass
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8831/shard-lnl-2/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14858/shard-lnl-3/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma:
    - shard-lnl:          [FAIL][13] ([Intel XE#5625]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8831/shard-lnl-3/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14858/shard-lnl-4/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html

  
  [Intel XE#2029]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029
  [Intel XE#2142]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
  [Intel XE#5625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625
  [Intel XE#7340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340
  [Intel XE#7395]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7395


Build changes
-------------

  * IGT: IGT_8831 -> IGTPW_14858
  * Linux: xe-4787-3239a1a0a30dea3fe135700010ee4e41841877bc -> xe-4788-817e894dd8588c9eee61b1fbd743859ddba35f78

  IGTPW_14858: 14858
  IGT_8831: 8831
  xe-4787-3239a1a0a30dea3fe135700010ee4e41841877bc: 3239a1a0a30dea3fe135700010ee4e41841877bc
  xe-4788-817e894dd8588c9eee61b1fbd743859ddba35f78: 817e894dd8588c9eee61b1fbd743859ddba35f78

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14858/index.html

--===============8435387989596416718==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_vm: Add drm_xe_vm_get_property tests</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/163878/">https://patchwork.freedesktop.org/series/163878/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14858/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14858/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8831_FULL -&gt; XEIGTPW_14858_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_8831_FULL and XEIGTPW_14858_FULL:</p>
<h3>New IGT tests (5)</h3>
<ul>
<li>
<p>igt@xe_vm@vm-get-property-exercise:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@vm-get-property-invalid-property:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@vm-get-property-invalid-reserved:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@vm-get-property-invalid-size:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@vm-get-property-invalid-vm-id:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14858_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8831/shard-lnl-5/igt@kms_pm_dc@dc5-psr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14858/shard-lnl-5/igt@kms_pm_dc@dc5-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340">Intel XE#7340</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8831/shard-lnl-6/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14858/shard-lnl-3/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142">Intel XE#2142</a>) +1 other test fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8831/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14858/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8831/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14858/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8831/shard-lnl-5/igt@kms_pm_dc@deep-pkgc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029">Intel XE#2029</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7395">Intel XE#7395</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14858/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8831/shard-lnl-2/igt@kms_vrr@cmrr@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459">Intel XE#4459</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14858/shard-lnl-3/igt@kms_vrr@cmrr@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8831/shard-lnl-3/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625">Intel XE#5625</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14858/shard-lnl-4/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8831 -&gt; IGTPW_14858</li>
<li>Linux: xe-4787-3239a1a0a30dea3fe135700010ee4e41841877bc -&gt; xe-4788-817e894dd8588c9eee61b1fbd743859ddba35f78</li>
</ul>
<p>IGTPW_14858: 14858<br />
  IGT_8831: 8831<br />
  xe-4787-3239a1a0a30dea3fe135700010ee4e41841877bc: 3239a1a0a30dea3fe135700010ee4e41841877bc<br />
  xe-4788-817e894dd8588c9eee61b1fbd743859ddba35f78: 817e894dd8588c9eee61b1fbd743859ddba35f78</p>

</body>
</html>

--===============8435387989596416718==--
