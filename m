Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBF19109E540
	for <igt-dev@archiver.kernel.org>; Thu, 26 Mar 2026 03:05:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7908510E20F;
	Thu, 26 Mar 2026 03:05:59 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4DDC10E20F;
 Thu, 26 Mar 2026 03:05:53 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5124305095140098916=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_series_starting_with_=5Bi-?=
 =?utf-8?q?g-t=2Cv1=2C1/1=5D_lib/igt=5Fcore=3A_flush_output_on_each_line?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jan Sokolowski" <jan.sokolowski@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 26 Mar 2026 03:05:53 -0000
Message-ID: <177449435364.399092.15156511049818728424@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260325114901.256229-1-jan.sokolowski@intel.com>
In-Reply-To: <20260325114901.256229-1-jan.sokolowski@intel.com>
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

--===============5124305095140098916==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,v1,1/1] lib/igt_core: flush output on each line
URL   : https://patchwork.freedesktop.org/series/163839/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8827_FULL -> XEIGTPW_14852_FULL
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

  Here are the changes found in XEIGTPW_14852_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [PASS][1] -> [FAIL][2] ([Intel XE#301]) +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8827/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14852/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [PASS][3] -> [FAIL][4] ([Intel XE#7340])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8827/shard-lnl-4/igt@kms_pm_dc@dc6-psr.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14852/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html

  * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma:
    - shard-lnl:          [PASS][5] -> [FAIL][6] ([Intel XE#5625])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8827/shard-lnl-4/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14852/shard-lnl-6/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html

  
#### Possible fixes ####

  * igt@kms_pm_dc@dc5-psr:
    - shard-lnl:          [FAIL][7] ([Intel XE#7340]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8827/shard-lnl-6/igt@kms_pm_dc@dc5-psr.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14852/shard-lnl-1/igt@kms_pm_dc@dc5-psr.html

  
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#5625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625
  [Intel XE#7340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340


Build changes
-------------

  * IGT: IGT_8827 -> IGTPW_14852

  IGTPW_14852: 14852
  IGT_8827: 8827
  xe-4784-cfe3d5f3eb5cf3b8aff1710c1c5c1d666f932aa8: cfe3d5f3eb5cf3b8aff1710c1c5c1d666f932aa8

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14852/index.html

--===============5124305095140098916==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,v1,1/1] lib/igt_core: flush output on each line</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/163839/">https://patchwork.freedesktop.org/series/163839/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14852/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14852/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8827_FULL -&gt; XEIGTPW_14852_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14852_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8827/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14852/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8827/shard-lnl-4/igt@kms_pm_dc@dc6-psr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14852/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340">Intel XE#7340</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8827/shard-lnl-4/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14852/shard-lnl-6/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625">Intel XE#5625</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_pm_dc@dc5-psr:<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8827/shard-lnl-6/igt@kms_pm_dc@dc5-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340">Intel XE#7340</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14852/shard-lnl-1/igt@kms_pm_dc@dc5-psr.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8827 -&gt; IGTPW_14852</li>
</ul>
<p>IGTPW_14852: 14852<br />
  IGT_8827: 8827<br />
  xe-4784-cfe3d5f3eb5cf3b8aff1710c1c5c1d666f932aa8: cfe3d5f3eb5cf3b8aff1710c1c5c1d666f932aa8</p>

</body>
</html>

--===============5124305095140098916==--
