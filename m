Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B95A1D6AAF4
	for <igt-dev@archiver.kernel.org>; Thu,  2 Apr 2026 16:59:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65F0310E05C;
	Thu,  2 Apr 2026 16:59:20 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F01310E05C;
 Thu,  2 Apr 2026 16:59:12 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5914074092392585759=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_tests/amdgpu/amd=5Ffuzzing?=
 =?utf-8?q?=3A_Remove_unused_variable?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karthik B S" <karthik.b.s@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 02 Apr 2026 16:59:12 -0000
Message-ID: <177514915205.429438.4727013590499991876@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260402085039.1655070-1-karthik.b.s@intel.com>
In-Reply-To: <20260402085039.1655070-1-karthik.b.s@intel.com>
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

--===============5914074092392585759==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/amdgpu/amd_fuzzing: Remove unused variable
URL   : https://patchwork.freedesktop.org/series/164283/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8842_FULL -> XEIGTPW_14917_FULL
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_14917_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma:
    - shard-lnl:          [PASS][1] -> [FAIL][2] ([Intel XE#5625])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8842/shard-lnl-6/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14917/shard-lnl-2/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html

  
#### Possible fixes ####

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [FAIL][3] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][4] +1 other test pass
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8842/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14917/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#5625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625


Build changes
-------------

  * IGT: IGT_8842 -> IGTPW_14917
  * Linux: xe-4837-35370a958ae250844fbacb7a26230032a4fa661c -> xe-4840-5ab3838428d9d2baa881cb9b23a30cc77e5c893c

  IGTPW_14917: 958bcb525cd315525b0919da7eb380008edbaf21 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8842: 8842
  xe-4837-35370a958ae250844fbacb7a26230032a4fa661c: 35370a958ae250844fbacb7a26230032a4fa661c
  xe-4840-5ab3838428d9d2baa881cb9b23a30cc77e5c893c: 5ab3838428d9d2baa881cb9b23a30cc77e5c893c

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14917/index.html

--===============5914074092392585759==
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
<tr><td><b>Series:</b></td><td>tests/amdgpu/amd_fuzzing: Remove unused variable</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/164283/">https://patchwork.freedesktop.org/series/164283/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14917/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14917/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8842_FULL -&gt; XEIGTPW_14917_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14917_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma:<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8842/shard-lnl-6/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14917/shard-lnl-2/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625">Intel XE#5625</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_flip@flip-vs-expired-vblank-interruptible:<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8842/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14917/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8842 -&gt; IGTPW_14917</li>
<li>Linux: xe-4837-35370a958ae250844fbacb7a26230032a4fa661c -&gt; xe-4840-5ab3838428d9d2baa881cb9b23a30cc77e5c893c</li>
</ul>
<p>IGTPW_14917: 958bcb525cd315525b0919da7eb380008edbaf21 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8842: 8842<br />
  xe-4837-35370a958ae250844fbacb7a26230032a4fa661c: 35370a958ae250844fbacb7a26230032a4fa661c<br />
  xe-4840-5ab3838428d9d2baa881cb9b23a30cc77e5c893c: 5ab3838428d9d2baa881cb9b23a30cc77e5c893c</p>

</body>
</html>

--===============5914074092392585759==--
