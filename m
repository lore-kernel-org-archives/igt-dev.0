Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCAC7EE6B68
	for <igt-dev@archiver.kernel.org>; Fri,  6 Feb 2026 23:42:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72AAC10E15A;
	Fri,  6 Feb 2026 23:42:17 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 241AA10E15A;
 Fri,  6 Feb 2026 23:42:16 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0024532304921530288=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_xe/igt=5Fkmod=5Funbind=3A_r?=
 =?utf-8?q?elease_audio_before_unbinding_xe?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Micha=C5=82_Grzelak?= <michal.grzelak@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 06 Feb 2026 23:42:16 -0000
Message-ID: <177042133611.235304.5269314933988770857@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260206224106.3845768-1-michal.grzelak@intel.com>
In-Reply-To: <20260206224106.3845768-1-michal.grzelak@intel.com>
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

--===============0024532304921530288==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: xe/igt_kmod_unbind: release audio before unbinding xe
URL   : https://patchwork.freedesktop.org/series/161305/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8742_BAT -> XEIGTPW_14510_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (12 -> 11)
------------------------------

  Missing    (1): bat-bmg-3 

Known issues
------------

  Here are the changes found in XEIGTPW_14510_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_waitfence@abstime:
    - bat-dg2-oem2:       [PASS][1] -> [TIMEOUT][2] ([Intel XE#6506])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8742/bat-dg2-oem2/igt@xe_waitfence@abstime.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14510/bat-dg2-oem2/igt@xe_waitfence@abstime.html

  
#### Possible fixes ####

  * igt@xe_waitfence@engine:
    - bat-dg2-oem2:       [FAIL][3] ([Intel XE#6519]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8742/bat-dg2-oem2/igt@xe_waitfence@engine.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14510/bat-dg2-oem2/igt@xe_waitfence@engine.html

  
  [Intel XE#6506]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506
  [Intel XE#6519]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519


Build changes
-------------

  * IGT: IGT_8742 -> IGTPW_14510
  * Linux: xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04 -> xe-4520-ab5b6da7d4879640bce3197597e0bc707bd60ab5

  IGTPW_14510: 3c323b4446cf7fd189399d5398bbe3b55c8292e9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8742: 8742
  xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04: d9124a6be3c7bdaeb14c3629013dde27929dbf04
  xe-4520-ab5b6da7d4879640bce3197597e0bc707bd60ab5: ab5b6da7d4879640bce3197597e0bc707bd60ab5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14510/index.html

--===============0024532304921530288==
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
<tr><td><b>Series:</b></td><td>xe/igt_kmod_unbind: release audio before unbinding xe</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/161305/">https://patchwork.freedesktop.org/series/161305/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14510/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14510/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8742_BAT -&gt; XEIGTPW_14510_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 11)</h2>
<p>Missing    (1): bat-bmg-3 </p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14510_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_waitfence@abstime:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8742/bat-dg2-oem2/igt@xe_waitfence@abstime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14510/bat-dg2-oem2/igt@xe_waitfence@abstime.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506">Intel XE#6506</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_waitfence@engine:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8742/bat-dg2-oem2/igt@xe_waitfence@engine.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519">Intel XE#6519</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14510/bat-dg2-oem2/igt@xe_waitfence@engine.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8742 -&gt; IGTPW_14510</li>
<li>Linux: xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04 -&gt; xe-4520-ab5b6da7d4879640bce3197597e0bc707bd60ab5</li>
</ul>
<p>IGTPW_14510: 3c323b4446cf7fd189399d5398bbe3b55c8292e9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8742: 8742<br />
  xe-4519-d9124a6be3c7bdaeb14c3629013dde27929dbf04: d9124a6be3c7bdaeb14c3629013dde27929dbf04<br />
  xe-4520-ab5b6da7d4879640bce3197597e0bc707bd60ab5: ab5b6da7d4879640bce3197597e0bc707bd60ab5</p>

</body>
</html>

--===============0024532304921530288==--
