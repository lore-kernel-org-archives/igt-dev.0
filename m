Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 352CC1098782
	for <igt-dev@archiver.kernel.org>; Fri, 20 Mar 2026 13:31:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D962510EA9B;
	Fri, 20 Mar 2026 13:31:50 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2786010EA9B;
 Fri, 20 Mar 2026 13:31:45 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1198098420328999229=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/kms=5Fplane=3A_Allow_?=
 =?utf-8?q?planar-pixel-format-settings_to_pass_on_VKMS_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Renjun Wang" <renjunw0@foxmail.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 20 Mar 2026 13:31:45 -0000
Message-ID: <177401350514.379016.4769210426388987344@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260320101606.22163-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20260320101606.22163-1-kamil.konieczny@linux.intel.com>
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

--===============1198098420328999229==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_plane: Allow planar-pixel-format-settings to pass on VKMS (rev3)
URL   : https://patchwork.freedesktop.org/series/161064/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8814_BAT -> XEIGTPW_14821_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (14 -> 14)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_14821_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_waitfence@reltime:
    - bat-dg2-oem2:       [FAIL][1] ([Intel XE#6520]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8814/bat-dg2-oem2/igt@xe_waitfence@reltime.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14821/bat-dg2-oem2/igt@xe_waitfence@reltime.html

  
  [Intel XE#6520]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520


Build changes
-------------

  * IGT: IGT_8814 -> IGTPW_14821
  * Linux: xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a -> xe-4752-7535044a2418d22b59be0eb64af0353971f16bd8

  IGTPW_14821: 7f4fa09560b109455b71ab5dcad559e83a4d3002 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8814: 8814
  xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a: 4ae9f18564e78a5447be68aa1e9232a4f2c37b5a
  xe-4752-7535044a2418d22b59be0eb64af0353971f16bd8: 7535044a2418d22b59be0eb64af0353971f16bd8

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14821/index.html

--===============1198098420328999229==
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
<tr><td><b>Series:</b></td><td>tests/kms_plane: Allow planar-pixel-format-settings to pass on VKMS (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/161064/">https://patchwork.freedesktop.org/series/161064/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14821/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14821/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8814_BAT -&gt; XEIGTPW_14821_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (14 -&gt; 14)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14821_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_waitfence@reltime:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8814/bat-dg2-oem2/igt@xe_waitfence@reltime.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520">Intel XE#6520</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14821/bat-dg2-oem2/igt@xe_waitfence@reltime.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8814 -&gt; IGTPW_14821</li>
<li>Linux: xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a -&gt; xe-4752-7535044a2418d22b59be0eb64af0353971f16bd8</li>
</ul>
<p>IGTPW_14821: 7f4fa09560b109455b71ab5dcad559e83a4d3002 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8814: 8814<br />
  xe-4749-4ae9f18564e78a5447be68aa1e9232a4f2c37b5a: 4ae9f18564e78a5447be68aa1e9232a4f2c37b5a<br />
  xe-4752-7535044a2418d22b59be0eb64af0353971f16bd8: 7535044a2418d22b59be0eb64af0353971f16bd8</p>

</body>
</html>

--===============1198098420328999229==--
