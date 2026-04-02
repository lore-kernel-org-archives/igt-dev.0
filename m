Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A32F3CC6B37
	for <igt-dev@archiver.kernel.org>; Thu,  2 Apr 2026 08:58:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4012E10F1DA;
	Thu,  2 Apr 2026 08:58:50 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 716D110F1D4;
 Thu,  2 Apr 2026 08:58:41 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0225022041694741501=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_tests/intel/kms=5Ffrontbuf?=
 =?utf-8?q?fer=5Ftracking=3A_Improve_skip_message?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sowmiya S" <sowmiya.s@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 02 Apr 2026 08:58:41 -0000
Message-ID: <177512032143.427876.1702345776591888211@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260402043702.914845-1-sowmiya.s@intel.com>
In-Reply-To: <20260402043702.914845-1-sowmiya.s@intel.com>
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

--===============0225022041694741501==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/kms_frontbuffer_tracking: Improve skip message
URL   : https://patchwork.freedesktop.org/series/164269/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8841_FULL -> XEIGTPW_14915_FULL
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

  Here are the changes found in XEIGTPW_14915_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_pm_dc@dc6-dpms:
    - shard-lnl:          [PASS][1] -> [FAIL][2] ([Intel XE#7340])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8841/shard-lnl-8/igt@kms_pm_dc@dc6-dpms.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14915/shard-lnl-2/igt@kms_pm_dc@dc6-dpms.html

  * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma:
    - shard-lnl:          [PASS][3] -> [FAIL][4] ([Intel XE#5625])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8841/shard-lnl-2/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14915/shard-lnl-5/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html

  
#### Possible fixes ####

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [FAIL][5] ([Intel XE#7340]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8841/shard-lnl-5/igt@kms_pm_dc@dc6-psr.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14915/shard-lnl-4/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [FAIL][7] ([Intel XE#4459]) -> [PASS][8] +1 other test pass
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8841/shard-lnl-3/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14915/shard-lnl-1/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
    - shard-lnl:          [FAIL][9] ([Intel XE#2142]) -> [PASS][10] +1 other test pass
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8841/shard-lnl-7/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14915/shard-lnl-5/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html

  
  [Intel XE#2142]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142
  [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
  [Intel XE#5625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625
  [Intel XE#7340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340


Build changes
-------------

  * IGT: IGT_8841 -> IGTPW_14915
  * Linux: xe-4835-3bc4b20741a977a593763678ab6d5b23c3e10d6c -> xe-4837-35370a958ae250844fbacb7a26230032a4fa661c

  IGTPW_14915: ba79595f4d6c344d5067fc40b712544c584e1f37 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8841: 8841
  xe-4835-3bc4b20741a977a593763678ab6d5b23c3e10d6c: 3bc4b20741a977a593763678ab6d5b23c3e10d6c
  xe-4837-35370a958ae250844fbacb7a26230032a4fa661c: 35370a958ae250844fbacb7a26230032a4fa661c

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14915/index.html

--===============0225022041694741501==
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
<tr><td><b>Series:</b></td><td>tests/intel/kms_frontbuffer_tracking: Improve skip message</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/164269/">https://patchwork.freedesktop.org/series/164269/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14915/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14915/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8841_FULL -&gt; XEIGTPW_14915_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14915_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8841/shard-lnl-8/igt@kms_pm_dc@dc6-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14915/shard-lnl-2/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340">Intel XE#7340</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8841/shard-lnl-2/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14915/shard-lnl-5/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625">Intel XE#5625</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8841/shard-lnl-5/igt@kms_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340">Intel XE#7340</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14915/shard-lnl-4/igt@kms_pm_dc@dc6-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8841/shard-lnl-3/igt@kms_vrr@cmrr@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459">Intel XE#4459</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14915/shard-lnl-1/igt@kms_vrr@cmrr@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8841/shard-lnl-7/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142">Intel XE#2142</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14915/shard-lnl-5/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8841 -&gt; IGTPW_14915</li>
<li>Linux: xe-4835-3bc4b20741a977a593763678ab6d5b23c3e10d6c -&gt; xe-4837-35370a958ae250844fbacb7a26230032a4fa661c</li>
</ul>
<p>IGTPW_14915: ba79595f4d6c344d5067fc40b712544c584e1f37 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8841: 8841<br />
  xe-4835-3bc4b20741a977a593763678ab6d5b23c3e10d6c: 3bc4b20741a977a593763678ab6d5b23c3e10d6c<br />
  xe-4837-35370a958ae250844fbacb7a26230032a4fa661c: 35370a958ae250844fbacb7a26230032a4fa661c</p>

</body>
</html>

--===============0225022041694741501==--
