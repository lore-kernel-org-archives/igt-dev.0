Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61326CCF9F8
	for <igt-dev@archiver.kernel.org>; Sat,  8 Nov 2025 01:29:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16E7610E1E3;
	Sat,  8 Nov 2025 01:29:18 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EDCD10E1E3;
 Sat,  8 Nov 2025 01:29:16 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4203347862468307684=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Fpmu=3A_Tie?=
 =?utf-8?q?_preempt_timeout_to_exec_quantum_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sat, 08 Nov 2025 01:29:16 -0000
Message-ID: <176256535664.31057.17531719072982274912@10055242dc62>
X-Patchwork-Hint: ignore
References: <20251107151251.6323-2-jonathan.cavitt@intel.com>
In-Reply-To: <20251107151251.6323-2-jonathan.cavitt@intel.com>
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

--===============4203347862468307684==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_pmu: Tie preempt timeout to exec quantum (rev3)
URL   : https://patchwork.freedesktop.org/series/157194/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8614_BAT -> XEIGTPW_14025_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_14025_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_waitfence@reltime:
    - bat-dg2-oem2:       [FAIL][1] ([Intel XE#6520]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8614/bat-dg2-oem2/igt@xe_waitfence@reltime.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14025/bat-dg2-oem2/igt@xe_waitfence@reltime.html

  
  [Intel XE#6520]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520


Build changes
-------------

  * IGT: IGT_8614 -> IGTPW_14025
  * Linux: xe-4073-4dff427fe8bbfd0bdbf7935d23a2aba0c350ab2d -> xe-4074-2bc418aa7efaae562e49d84e8b28f799cf624745

  IGTPW_14025: 14025
  IGT_8614: 8614
  xe-4073-4dff427fe8bbfd0bdbf7935d23a2aba0c350ab2d: 4dff427fe8bbfd0bdbf7935d23a2aba0c350ab2d
  xe-4074-2bc418aa7efaae562e49d84e8b28f799cf624745: 2bc418aa7efaae562e49d84e8b28f799cf624745

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14025/index.html

--===============4203347862468307684==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_pmu: Tie preempt timeout to exec quantum (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/157194/">https://patchwork.freedesktop.org/series/157194/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14025/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14025/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8614_BAT -&gt; XEIGTPW_14025_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14025_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_waitfence@reltime:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8614/bat-dg2-oem2/igt@xe_waitfence@reltime.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520">Intel XE#6520</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14025/bat-dg2-oem2/igt@xe_waitfence@reltime.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8614 -&gt; IGTPW_14025</li>
<li>Linux: xe-4073-4dff427fe8bbfd0bdbf7935d23a2aba0c350ab2d -&gt; xe-4074-2bc418aa7efaae562e49d84e8b28f799cf624745</li>
</ul>
<p>IGTPW_14025: 14025<br />
  IGT_8614: 8614<br />
  xe-4073-4dff427fe8bbfd0bdbf7935d23a2aba0c350ab2d: 4dff427fe8bbfd0bdbf7935d23a2aba0c350ab2d<br />
  xe-4074-2bc418aa7efaae562e49d84e8b28f799cf624745: 2bc418aa7efaae562e49d84e8b28f799cf624745</p>

</body>
</html>

--===============4203347862468307684==--
