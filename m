Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85AEF10ED642
	for <igt-dev@archiver.kernel.org>; Fri, 27 Mar 2026 09:46:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3070E10ED3F;
	Fri, 27 Mar 2026 09:46:40 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB68810ED3F;
 Fri, 27 Mar 2026 09:46:33 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7083125666224106344=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_intel-ci=3A_Add_Xe_FULL_ch?=
 =?utf-8?q?amelium_run_type_and_testlist_improvements_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bilal, Mohammed" <mohammed.bilal@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 27 Mar 2026 09:46:33 -0000
Message-ID: <177460479363.405318.4814799471931206184@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260326090417.864673-1-sowmiya.s@intel.com>
In-Reply-To: <20260326090417.864673-1-sowmiya.s@intel.com>
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

--===============7083125666224106344==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: intel-ci: Add Xe FULL chamelium run type and testlist improvements (rev5)
URL   : https://patchwork.freedesktop.org/series/163129/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8834_FULL -> XEIGTPW_14863_FULL
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

  Here are the changes found in XEIGTPW_14863_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [PASS][1] -> [FAIL][2] ([Intel XE#7340])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8834/shard-lnl-8/igt@kms_pm_dc@dc6-psr.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14863/shard-lnl-8/igt@kms_pm_dc@dc6-psr.html

  
#### Possible fixes ####

  * igt@kms_pm_dc@dc5-dpms:
    - shard-lnl:          [FAIL][3] ([Intel XE#7340] / [Intel XE#7504]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8834/shard-lnl-6/igt@kms_pm_dc@dc5-dpms.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14863/shard-lnl-6/igt@kms_pm_dc@dc5-dpms.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [FAIL][5] ([Intel XE#4459]) -> [PASS][6] +1 other test pass
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8834/shard-lnl-6/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14863/shard-lnl-5/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  
#### Warnings ####

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-lnl:          [SKIP][7] ([Intel XE#7675]) -> [SKIP][8] ([Intel XE#7675] / [Intel XE#7679]) +7 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8834/shard-lnl-1/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14863/shard-lnl-3/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  
  [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
  [Intel XE#7340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340
  [Intel XE#7504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7504
  [Intel XE#7675]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7675
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679


Build changes
-------------

  * IGT: IGT_8834 -> IGTPW_14863
  * Linux: xe-4793-2ccc868c40a9048ecf287b7bb002d73b5d25c7bf -> xe-4797-bf67cb7fd0fedce12dc2d0fdf39ee070c1ead04b

  IGTPW_14863: 14863
  IGT_8834: 8834
  xe-4793-2ccc868c40a9048ecf287b7bb002d73b5d25c7bf: 2ccc868c40a9048ecf287b7bb002d73b5d25c7bf
  xe-4797-bf67cb7fd0fedce12dc2d0fdf39ee070c1ead04b: bf67cb7fd0fedce12dc2d0fdf39ee070c1ead04b

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14863/index.html

--===============7083125666224106344==
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
<tr><td><b>Series:</b></td><td>intel-ci: Add Xe FULL chamelium run type and testlist improvements (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/163129/">https://patchwork.freedesktop.org/series/163129/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14863/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14863/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8834_FULL -&gt; XEIGTPW_14863_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14863_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_pm_dc@dc6-psr:<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8834/shard-lnl-8/igt@kms_pm_dc@dc6-psr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14863/shard-lnl-8/igt@kms_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340">Intel XE#7340</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8834/shard-lnl-6/igt@kms_pm_dc@dc5-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340">Intel XE#7340</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7504">Intel XE#7504</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14863/shard-lnl-6/igt@kms_pm_dc@dc5-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8834/shard-lnl-6/igt@kms_vrr@cmrr@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459">Intel XE#4459</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14863/shard-lnl-5/igt@kms_vrr@cmrr@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8834/shard-lnl-1/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7675">Intel XE#7675</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14863/shard-lnl-3/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7675">Intel XE#7675</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>) +7 other tests skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8834 -&gt; IGTPW_14863</li>
<li>Linux: xe-4793-2ccc868c40a9048ecf287b7bb002d73b5d25c7bf -&gt; xe-4797-bf67cb7fd0fedce12dc2d0fdf39ee070c1ead04b</li>
</ul>
<p>IGTPW_14863: 14863<br />
  IGT_8834: 8834<br />
  xe-4793-2ccc868c40a9048ecf287b7bb002d73b5d25c7bf: 2ccc868c40a9048ecf287b7bb002d73b5d25c7bf<br />
  xe-4797-bf67cb7fd0fedce12dc2d0fdf39ee070c1ead04b: bf67cb7fd0fedce12dc2d0fdf39ee070c1ead04b</p>

</body>
</html>

--===============7083125666224106344==--
