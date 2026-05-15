Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14D33CD343F
	for <igt-dev@archiver.kernel.org>; Fri, 15 May 2026 16:09:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FCBD10F57E;
	Fri, 15 May 2026 16:08:59 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3126210F58A;
 Fri, 15 May 2026 16:08:41 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2603620806014659674=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Revert_HDCP_per_crtc_infras?=
 =?utf-8?q?tructure_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 15 May 2026 16:08:41 -0000
Message-ID: <177886132119.74821.8037534621096797818@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260515084935.697125-1-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20260515084935.697125-1-santhosh.reddy.guddati@intel.com>
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

--===============2603620806014659674==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Revert HDCP per crtc infrastructure (rev2)
URL   : https://patchwork.freedesktop.org/series/166566/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8917_BAT -> XEIGTPW_15193_BAT
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

  Here are the changes found in XEIGTPW_15193_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_waitfence@reltime:
    - bat-bmg-2:          [FAIL][1] -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8917/bat-bmg-2/igt@xe_waitfence@reltime.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15193/bat-bmg-2/igt@xe_waitfence@reltime.html

  


Build changes
-------------

  * IGT: IGT_8917 -> IGTPW_15193
  * Linux: xe-5067-b9819223b7e92173091b674c2212252b99ea6c4b -> xe-5068-25de7fb53bca724e7864b6bd8280aa1ec59429e3

  IGTPW_15193: 15193
  IGT_8917: 65d691069f26fc2a42c79e2364241320b85d48bc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5067-b9819223b7e92173091b674c2212252b99ea6c4b: b9819223b7e92173091b674c2212252b99ea6c4b
  xe-5068-25de7fb53bca724e7864b6bd8280aa1ec59429e3: 25de7fb53bca724e7864b6bd8280aa1ec59429e3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15193/index.html

--===============2603620806014659674==
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
<tr><td><b>Series:</b></td><td>Revert HDCP per crtc infrastructure (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/166566/">https://patchwork.freedesktop.org/series/166566/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15193/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15193/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8917_BAT -&gt; XEIGTPW_15193_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_15193_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_waitfence@reltime:<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8917/bat-bmg-2/igt@xe_waitfence@reltime.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15193/bat-bmg-2/igt@xe_waitfence@reltime.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8917 -&gt; IGTPW_15193</li>
<li>Linux: xe-5067-b9819223b7e92173091b674c2212252b99ea6c4b -&gt; xe-5068-25de7fb53bca724e7864b6bd8280aa1ec59429e3</li>
</ul>
<p>IGTPW_15193: 15193<br />
  IGT_8917: 65d691069f26fc2a42c79e2364241320b85d48bc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5067-b9819223b7e92173091b674c2212252b99ea6c4b: b9819223b7e92173091b674c2212252b99ea6c4b<br />
  xe-5068-25de7fb53bca724e7864b6bd8280aa1ec59429e3: 25de7fb53bca724e7864b6bd8280aa1ec59429e3</p>

</body>
</html>

--===============2603620806014659674==--
