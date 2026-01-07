Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2BDAD0D171
	for <igt-dev@archiver.kernel.org>; Wed,  7 Jan 2026 21:18:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A209410E115;
	Wed,  7 Jan 2026 21:18:53 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 953FF10E115;
 Wed,  7 Jan 2026 21:18:52 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0468186296161590785=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Fccs=3A_spl?=
 =?utf-8?q?it_block-multicopy_into_3_submissions?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jagmeet Randhawa" <jagmeet.randhawa@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 07 Jan 2026 21:18:52 -0000
Message-ID: <176782073260.134483.7755200856133331417@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <e2bd6e36919fb6d43e182f17eac21195d1d31e4e.1767814525.git.jagmeet.randhawa@intel.com>
In-Reply-To: <e2bd6e36919fb6d43e182f17eac21195d1d31e4e.1767814525.git.jagmeet.randhawa@intel.com>
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

--===============0468186296161590785==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_ccs: split block-multicopy into 3 submissions
URL   : https://patchwork.freedesktop.org/series/159767/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8692_BAT -> XEIGTPW_14310_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_14310_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_waitfence@reltime:
    - bat-dg2-oem2:       [FAIL][1] ([Intel XE#6520]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8692/bat-dg2-oem2/igt@xe_waitfence@reltime.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14310/bat-dg2-oem2/igt@xe_waitfence@reltime.html

  
  [Intel XE#6520]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520


Build changes
-------------

  * IGT: IGT_8692 -> IGTPW_14310
  * Linux: xe-4339-77ca0c5f244b2796408d20cf3c0741094304e09f -> xe-4341-89981c4f9f7c7e10f4eddb40ca0588743b6af19d

  IGTPW_14310: 62e7a3609990419d1cabac19a033daba5bf50772 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8692: 8692
  xe-4339-77ca0c5f244b2796408d20cf3c0741094304e09f: 77ca0c5f244b2796408d20cf3c0741094304e09f
  xe-4341-89981c4f9f7c7e10f4eddb40ca0588743b6af19d: 89981c4f9f7c7e10f4eddb40ca0588743b6af19d

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14310/index.html

--===============0468186296161590785==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_ccs: split block-multicopy into 3 submissions</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/159767/">https://patchwork.freedesktop.org/series/159767/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14310/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14310/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8692_BAT -&gt; XEIGTPW_14310_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14310_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_waitfence@reltime:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8692/bat-dg2-oem2/igt@xe_waitfence@reltime.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520">Intel XE#6520</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14310/bat-dg2-oem2/igt@xe_waitfence@reltime.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8692 -&gt; IGTPW_14310</li>
<li>Linux: xe-4339-77ca0c5f244b2796408d20cf3c0741094304e09f -&gt; xe-4341-89981c4f9f7c7e10f4eddb40ca0588743b6af19d</li>
</ul>
<p>IGTPW_14310: 62e7a3609990419d1cabac19a033daba5bf50772 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8692: 8692<br />
  xe-4339-77ca0c5f244b2796408d20cf3c0741094304e09f: 77ca0c5f244b2796408d20cf3c0741094304e09f<br />
  xe-4341-89981c4f9f7c7e10f4eddb40ca0588743b6af19d: 89981c4f9f7c7e10f4eddb40ca0588743b6af19d</p>

</body>
</html>

--===============0468186296161590785==--
