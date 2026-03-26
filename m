Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA42B106F30F
	for <igt-dev@archiver.kernel.org>; Thu, 26 Mar 2026 09:19:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0D6710EA0F;
	Thu, 26 Mar 2026 09:19:32 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B113810E9E8;
 Thu, 26 Mar 2026 09:19:25 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2607945503883416448=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_tests/xe=3A_Add_purgeable_?=
 =?utf-8?q?memory_madvise_tests_for_system_allocator_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arvind Yadav" <arvind.yadav@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 26 Mar 2026 09:19:25 -0000
Message-ID: <177451676569.400391.7182477949768229258@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260325124426.3265234-1-arvind.yadav@intel.com>
In-Reply-To: <20260325124426.3265234-1-arvind.yadav@intel.com>
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

--===============2607945503883416448==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/xe: Add purgeable memory madvise tests for system allocator (rev6)
URL   : https://patchwork.freedesktop.org/series/160333/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8829_FULL -> XEIGTPW_14855_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_14855_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_14855_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_14855_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_system_allocator@eu-fault-64k-once-device-host:
    - shard-lnl:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8829/shard-lnl-5/igt@xe_exec_system_allocator@eu-fault-64k-once-device-host.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14855/shard-lnl-5/igt@xe_exec_system_allocator@eu-fault-64k-once-device-host.html

  * igt@xe_madvise@dontneed-before-exec (NEW):
    - shard-lnl:          NOTRUN -> [SKIP][3] +6 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14855/shard-lnl-5/igt@xe_madvise@dontneed-before-exec.html

  
New tests
---------

  New tests have been introduced between XEIGT_8829_FULL and XEIGTPW_14855_FULL:

### New IGT tests (7) ###

  * igt@xe_madvise@dontneed-after-exec:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_madvise@dontneed-after-mmap:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_madvise@dontneed-before-exec:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_madvise@dontneed-before-mmap:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_madvise@per-vma-protection:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_madvise@per-vma-tracking:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_madvise@purged-mmap-blocked:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_14855_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_pm_dc@dc5-dpms:
    - shard-lnl:          [PASS][4] -> [FAIL][5] ([Intel XE#7340] / [Intel XE#7504])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8829/shard-lnl-4/igt@kms_pm_dc@dc5-dpms.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14855/shard-lnl-5/igt@kms_pm_dc@dc5-dpms.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-lnl:          [PASS][6] -> [FAIL][7] ([Intel XE#2029] / [Intel XE#7395])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8829/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14855/shard-lnl-8/igt@kms_pm_dc@deep-pkgc.html

  
#### Possible fixes ####

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [FAIL][8] ([Intel XE#301]) -> [PASS][9] +2 other tests pass
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8829/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14855/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-lnl:          [FAIL][10] ([Intel XE#7340]) -> [PASS][11]
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8829/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14855/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_setmode@basic@pipe-a-edp-1:
    - shard-lnl:          [FAIL][12] ([Intel XE#6361]) -> [PASS][13] +2 other tests pass
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8829/shard-lnl-3/igt@kms_setmode@basic@pipe-a-edp-1.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14855/shard-lnl-1/igt@kms_setmode@basic@pipe-a-edp-1.html

  
  [Intel XE#2029]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#6361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6361
  [Intel XE#7340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340
  [Intel XE#7395]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7395
  [Intel XE#7504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7504


Build changes
-------------

  * IGT: IGT_8829 -> IGTPW_14855

  IGTPW_14855: 14855
  IGT_8829: 8829
  xe-4785-ec0484d20b9f962d04a62ff1feb03676c3ce7611: ec0484d20b9f962d04a62ff1feb03676c3ce7611

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14855/index.html

--===============2607945503883416448==
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
<tr><td><b>Series:</b></td><td>tests/xe: Add purgeable memory madvise tests for system allocator (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/160333/">https://patchwork.freedesktop.org/series/160333/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14855/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14855/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8829_FULL -&gt; XEIGTPW_14855_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_14855_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_14855_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_14855_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_exec_system_allocator@eu-fault-64k-once-device-host:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8829/shard-lnl-5/igt@xe_exec_system_allocator@eu-fault-64k-once-device-host.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14855/shard-lnl-5/igt@xe_exec_system_allocator@eu-fault-64k-once-device-host.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_madvise@dontneed-before-exec (NEW):</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14855/shard-lnl-5/igt@xe_madvise@dontneed-before-exec.html">SKIP</a> +6 other tests skip</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_8829_FULL and XEIGTPW_14855_FULL:</p>
<h3>New IGT tests (7)</h3>
<ul>
<li>
<p>igt@xe_madvise@dontneed-after-exec:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_madvise@dontneed-after-mmap:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_madvise@dontneed-before-exec:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_madvise@dontneed-before-mmap:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_madvise@per-vma-protection:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_madvise@per-vma-tracking:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_madvise@purged-mmap-blocked:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14855_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8829/shard-lnl-4/igt@kms_pm_dc@dc5-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14855/shard-lnl-5/igt@kms_pm_dc@dc5-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340">Intel XE#7340</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7504">Intel XE#7504</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8829/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14855/shard-lnl-8/igt@kms_pm_dc@deep-pkgc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029">Intel XE#2029</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7395">Intel XE#7395</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8829/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14855/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8829/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340">Intel XE#7340</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14855/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8829/shard-lnl-3/igt@kms_setmode@basic@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6361">Intel XE#6361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14855/shard-lnl-1/igt@kms_setmode@basic@pipe-a-edp-1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8829 -&gt; IGTPW_14855</li>
</ul>
<p>IGTPW_14855: 14855<br />
  IGT_8829: 8829<br />
  xe-4785-ec0484d20b9f962d04a62ff1feb03676c3ce7611: ec0484d20b9f962d04a62ff1feb03676c3ce7611</p>

</body>
</html>

--===============2607945503883416448==--
