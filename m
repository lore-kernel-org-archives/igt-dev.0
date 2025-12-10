Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A87CD3C902
	for <igt-dev@archiver.kernel.org>; Wed, 10 Dec 2025 13:34:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 272AD89B30;
	Wed, 10 Dec 2025 13:34:51 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C901789B30;
 Wed, 10 Dec 2025 13:34:49 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6362154400564565159=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_lib/kms=3A_Move_towards_usi?=
 =?utf-8?q?ng_=27crtcs=27_instead_of_=27pipes=27?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?b?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 10 Dec 2025 13:34:49 -0000
Message-ID: <176537368981.74043.1234052542779995324@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251210093903.15934-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20251210093903.15934-1-ville.syrjala@linux.intel.com>
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

--===============6362154400564565159==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/kms: Move towards using 'crtcs' instead of 'pipes'
URL   : https://patchwork.freedesktop.org/series/158749/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8662_BAT -> XEIGTPW_14182_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (12 -> 12)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_14182_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_waitfence@abstime:
    - bat-dg2-oem2:       [PASS][1] -> [TIMEOUT][2] ([Intel XE#6506])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8662/bat-dg2-oem2/igt@xe_waitfence@abstime.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14182/bat-dg2-oem2/igt@xe_waitfence@abstime.html

  * igt@xe_waitfence@engine:
    - bat-dg2-oem2:       [PASS][3] -> [FAIL][4] ([Intel XE#6519])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8662/bat-dg2-oem2/igt@xe_waitfence@engine.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14182/bat-dg2-oem2/igt@xe_waitfence@engine.html

  
  [Intel XE#6506]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506
  [Intel XE#6519]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519


Build changes
-------------

  * IGT: IGT_8662 -> IGTPW_14182
  * Linux: xe-4211-12271f632915efe0c5d4171b9c0e90f57ecdfe01 -> xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985

  IGTPW_14182: 14182
  IGT_8662: 9410b6926f317e8bf824502394e09ee8753ff65e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4211-12271f632915efe0c5d4171b9c0e90f57ecdfe01: 12271f632915efe0c5d4171b9c0e90f57ecdfe01
  xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985: 2a9deeb5c3fd4dddbed361f10b26ce567072a985

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14182/index.html

--===============6362154400564565159==
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
<tr><td><b>Series:</b></td><td>lib/kms: Move towards using &#x27;crtcs&#x27; instead of &#x27;pipes&#x27;</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/158749/">https://patchwork.freedesktop.org/series/158749/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14182/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14182/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8662_BAT -&gt; XEIGTPW_14182_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14182_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_waitfence@abstime:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8662/bat-dg2-oem2/igt@xe_waitfence@abstime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14182/bat-dg2-oem2/igt@xe_waitfence@abstime.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506">Intel XE#6506</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@engine:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8662/bat-dg2-oem2/igt@xe_waitfence@engine.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14182/bat-dg2-oem2/igt@xe_waitfence@engine.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519">Intel XE#6519</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8662 -&gt; IGTPW_14182</li>
<li>Linux: xe-4211-12271f632915efe0c5d4171b9c0e90f57ecdfe01 -&gt; xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985</li>
</ul>
<p>IGTPW_14182: 14182<br />
  IGT_8662: 9410b6926f317e8bf824502394e09ee8753ff65e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4211-12271f632915efe0c5d4171b9c0e90f57ecdfe01: 12271f632915efe0c5d4171b9c0e90f57ecdfe01<br />
  xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985: 2a9deeb5c3fd4dddbed361f10b26ce567072a985</p>

</body>
</html>

--===============6362154400564565159==--
