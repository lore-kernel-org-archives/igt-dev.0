Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1D45C54E67
	for <igt-dev@archiver.kernel.org>; Tue, 26 Mar 2024 17:21:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66F4410F11F;
	Tue, 26 Mar 2024 17:21:49 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D32A610F11F;
 Tue, 26 Mar 2024 17:21:47 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7003086002914727108=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_meson=3A_Turn_on_few_warns_=28?=
 =?utf-8?q?rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 26 Mar 2024 17:21:47 -0000
Message-ID: <171147370785.1049124.12664254940667964902@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240326102612.746321-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20240326102612.746321-1-bhanuprakash.modem@intel.com>
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

--===============7003086002914727108==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: meson: Turn on few warns (rev2)
URL   : https://patchwork.freedesktop.org/series/131560/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7784_BAT -> XEIGTPW_10916_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 5)
------------------------------

  Additional (1): bat-lnl-1 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_10916_BAT:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@xe_evict@evict-mixed-threads-small-multi-vm:
    - {bat-lnl-1}:        NOTRUN -> [SKIP][1] +18 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10916/bat-lnl-1/igt@xe_evict@evict-mixed-threads-small-multi-vm.html

  * igt@xe_gt_freq@freq_fixed_idle:
    - {bat-lnl-1}:        NOTRUN -> [FAIL][2]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10916/bat-lnl-1/igt@xe_gt_freq@freq_fixed_idle.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_10916_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_evict@evict-mixed-threads-small:
    - bat-dg2-oem2:       NOTRUN -> [INCOMPLETE][3] ([Intel XE#804])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10916/bat-dg2-oem2/igt@xe_evict@evict-mixed-threads-small.html

  
#### Warnings ####

  * igt@xe_evict@evict-cm-threads-small:
    - bat-dg2-oem2:       [INCOMPLETE][4] ([Intel XE#804]) -> [INCOMPLETE][5] ([Intel XE#1027] / [Intel XE#804])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7784/bat-dg2-oem2/igt@xe_evict@evict-cm-threads-small.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10916/bat-dg2-oem2/igt@xe_evict@evict-cm-threads-small.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1027]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1027
  [Intel XE#804]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/804


Build changes
-------------

  * IGT: IGT_7784 -> IGTPW_10916
  * Linux: xe-993-5c9e5d1880d47d51de6d0b2def39c509bc18aaff -> xe-995-79a0d94585cad50ad2446ebdf3f1317b7d18157c

  IGTPW_10916: 10916
  IGT_7784: 7784
  xe-993-5c9e5d1880d47d51de6d0b2def39c509bc18aaff: 5c9e5d1880d47d51de6d0b2def39c509bc18aaff
  xe-995-79a0d94585cad50ad2446ebdf3f1317b7d18157c: 79a0d94585cad50ad2446ebdf3f1317b7d18157c

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10916/index.html

--===============7003086002914727108==
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
<tr><td><b>Series:</b></td><td>meson: Turn on few warns (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/131560/">https://patchwork.freedesktop.org/series/131560/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10916/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10916/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7784_BAT -&gt; XEIGTPW_10916_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 5)</h2>
<p>Additional (1): bat-lnl-1 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_10916_BAT:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@xe_evict@evict-mixed-threads-small-multi-vm:</p>
<ul>
<li>{bat-lnl-1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10916/bat-lnl-1/igt@xe_evict@evict-mixed-threads-small-multi-vm.html">SKIP</a> +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_fixed_idle:</p>
<ul>
<li>{bat-lnl-1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10916/bat-lnl-1/igt@xe_gt_freq@freq_fixed_idle.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_10916_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_evict@evict-mixed-threads-small:<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10916/bat-dg2-oem2/igt@xe_evict@evict-mixed-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/804">Intel XE#804</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_evict@evict-cm-threads-small:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7784/bat-dg2-oem2/igt@xe_evict@evict-cm-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/804">Intel XE#804</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10916/bat-dg2-oem2/igt@xe_evict@evict-cm-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1027">Intel XE#1027</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/804">Intel XE#804</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7784 -&gt; IGTPW_10916</li>
<li>Linux: xe-993-5c9e5d1880d47d51de6d0b2def39c509bc18aaff -&gt; xe-995-79a0d94585cad50ad2446ebdf3f1317b7d18157c</li>
</ul>
<p>IGTPW_10916: 10916<br />
  IGT_7784: 7784<br />
  xe-993-5c9e5d1880d47d51de6d0b2def39c509bc18aaff: 5c9e5d1880d47d51de6d0b2def39c509bc18aaff<br />
  xe-995-79a0d94585cad50ad2446ebdf3f1317b7d18157c: 79a0d94585cad50ad2446ebdf3f1317b7d18157c</p>

</body>
</html>

--===============7003086002914727108==--
