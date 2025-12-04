Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8C77D1D892
	for <igt-dev@archiver.kernel.org>; Thu,  4 Dec 2025 09:23:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FCC010E1C6;
	Thu,  4 Dec 2025 09:23:17 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42AE810E1C6;
 Thu,  4 Dec 2025 09:23:16 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3587551706756154544=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Madvise_feature_in_SVM_for_?=
 =?utf-8?q?Multi-GPU_configs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: nishit.sharma@intel.com
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 04 Dec 2025 09:23:16 -0000
Message-ID: <176484019626.56855.13571844810133814967@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251204085432.35023-1-nishit.sharma@intel.com>
In-Reply-To: <20251204085432.35023-1-nishit.sharma@intel.com>
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

--===============3587551706756154544==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Madvise feature in SVM for Multi-GPU configs
URL   : https://patchwork.freedesktop.org/series/158469/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8654_BAT -> XEIGTPW_14157_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (12 -> 12)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_14157_BAT:

### IGT changes ###

#### Possible regressions ####

  * {igt@xe_multigpu_svm@mgpu-pagefault-conflict} (NEW):
    - bat-bmg-3:          NOTRUN -> [FAIL][1] +20 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14157/bat-bmg-3/igt@xe_multigpu_svm@mgpu-pagefault-conflict.html

  
New tests
---------

  New tests have been introduced between XEIGT_8654_BAT and XEIGTPW_14157_BAT:

### New IGT tests (21) ###

  * igt@xe_multigpu_svm@mgpu-atomic-op-basic:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_multigpu_svm@mgpu-atomic-op-conflict:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_multigpu_svm@mgpu-atomic-op-prefetch:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_multigpu_svm@mgpu-coherency-basic:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_multigpu_svm@mgpu-coherency-conflict:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_multigpu_svm@mgpu-coherency-fail-basic:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_multigpu_svm@mgpu-coherency-fail-prefetch:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_multigpu_svm@mgpu-coherency-prefetch:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_multigpu_svm@mgpu-concurrent-access-basic:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_multigpu_svm@mgpu-concurrent-access-prefetch:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_multigpu_svm@mgpu-latency-basic:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_multigpu_svm@mgpu-latency-copy-basic:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_multigpu_svm@mgpu-latency-copy-prefetch:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_multigpu_svm@mgpu-latency-prefetch:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_multigpu_svm@mgpu-migration-basic:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_multigpu_svm@mgpu-migration-prefetch:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_multigpu_svm@mgpu-pagefault-basic:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_multigpu_svm@mgpu-pagefault-conflict:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_multigpu_svm@mgpu-pagefault-prefetch:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@xe_multigpu_svm@mgpu-xgpu-access-basic:
    - Statuses : 1 fail(s)
    - Exec time: [0.09] s

  * igt@xe_multigpu_svm@mgpu-xgpu-access-prefetch:
    - Statuses : 1 fail(s)
    - Exec time: [0.08] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_14157_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_waitfence@engine:
    - bat-dg2-oem2:       [FAIL][2] ([Intel XE#6519]) -> [PASS][3]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8654/bat-dg2-oem2/igt@xe_waitfence@engine.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14157/bat-dg2-oem2/igt@xe_waitfence@engine.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#6519]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519


Build changes
-------------

  * IGT: IGT_8654 -> IGTPW_14157

  IGTPW_14157: 14157
  IGT_8654: 38d9fde0432aa6f2bf6add062f1d4334ad467fbc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4193-2d16d4e1aef3cb501fcd37c8558dafeb579be813: 2d16d4e1aef3cb501fcd37c8558dafeb579be813

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14157/index.html

--===============3587551706756154544==
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
<tr><td><b>Series:</b></td><td>Madvise feature in SVM for Multi-GPU configs</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/158469/">https://patchwork.freedesktop.org/series/158469/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14157/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14157/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8654_BAT -&gt; XEIGTPW_14157_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_14157_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>{igt@xe_multigpu_svm@mgpu-pagefault-conflict} (NEW):<ul>
<li>bat-bmg-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14157/bat-bmg-3/igt@xe_multigpu_svm@mgpu-pagefault-conflict.html">FAIL</a> +20 other tests fail</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_8654_BAT and XEIGTPW_14157_BAT:</p>
<h3>New IGT tests (21)</h3>
<ul>
<li>
<p>igt@xe_multigpu_svm@mgpu-atomic-op-basic:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-atomic-op-conflict:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-atomic-op-prefetch:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-coherency-basic:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-coherency-conflict:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-coherency-fail-basic:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-coherency-fail-prefetch:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-coherency-prefetch:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-concurrent-access-basic:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-concurrent-access-prefetch:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-latency-basic:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-latency-copy-basic:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-latency-copy-prefetch:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-latency-prefetch:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-migration-basic:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-migration-prefetch:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-pagefault-basic:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-pagefault-conflict:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-pagefault-prefetch:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-xgpu-access-basic:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-xgpu-access-prefetch:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14157_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_waitfence@engine:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8654/bat-dg2-oem2/igt@xe_waitfence@engine.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519">Intel XE#6519</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14157/bat-dg2-oem2/igt@xe_waitfence@engine.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8654 -&gt; IGTPW_14157</li>
</ul>
<p>IGTPW_14157: 14157<br />
  IGT_8654: 38d9fde0432aa6f2bf6add062f1d4334ad467fbc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4193-2d16d4e1aef3cb501fcd37c8558dafeb579be813: 2d16d4e1aef3cb501fcd37c8558dafeb579be813</p>

</body>
</html>

--===============3587551706756154544==--
