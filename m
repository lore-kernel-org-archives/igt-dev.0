Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3F62C4345F
	for <igt-dev@archiver.kernel.org>; Wed, 17 Apr 2024 12:58:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6187910F61B;
	Wed, 17 Apr 2024 12:58:04 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C37210F61B;
 Wed, 17 Apr 2024 12:58:02 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0141466343072640850=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_tests/intel/kms=5Fflip=5Fscale?=
 =?utf-8?q?d=5Fcrc=3A_Add_support_for_FP16_format_of_MTL_compressed_modifier?=
 =?utf-8?q?_=28rev18=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Melanie Lobo" <melanie.lobo@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 17 Apr 2024 12:58:02 -0000
Message-ID: <171335868263.1465187.7454580861091807324@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20231010134540.28485-1-melanie.lobo@intel.com>
In-Reply-To: <20231010134540.28485-1-melanie.lobo@intel.com>
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

--===============0141466343072640850==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/kms_flip_scaled_crc: Add support for FP16 format of MTL compressed modifier (rev18)
URL   : https://patchwork.freedesktop.org/series/124956/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7810_BAT -> XEIGTPW_11029_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (5 -> 5)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_7810 -> IGTPW_11029
  * Linux: xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4 -> xe-1105-75418ec1fe7737396419e6447005b10e666aeaec

  IGTPW_11029: a5bacc84edefecc661e74256554e66e0f366dc53 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7810: 189483744e9ff56ea573e07a049c5365404c7ecb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4: c577180c5a61220ef8db9a4a3cd4de66bf58eed4
  xe-1105-75418ec1fe7737396419e6447005b10e666aeaec: 75418ec1fe7737396419e6447005b10e666aeaec

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11029/index.html

--===============0141466343072640850==
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
<tr><td><b>Series:</b></td><td>tests/intel/kms_flip_scaled_crc: Add support for FP16 format of MTL compressed modifier (rev18)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/124956/">https://patchwork.freedesktop.org/series/124956/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11029/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11029/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7810_BAT -&gt; XEIGTPW_11029_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7810 -&gt; IGTPW_11029</li>
<li>Linux: xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4 -&gt; xe-1105-75418ec1fe7737396419e6447005b10e666aeaec</li>
</ul>
<p>IGTPW_11029: a5bacc84edefecc661e74256554e66e0f366dc53 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7810: 189483744e9ff56ea573e07a049c5365404c7ecb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1104-c577180c5a61220ef8db9a4a3cd4de66bf58eed4: c577180c5a61220ef8db9a4a3cd4de66bf58eed4<br />
  xe-1105-75418ec1fe7737396419e6447005b10e666aeaec: 75418ec1fe7737396419e6447005b10e666aeaec</p>

</body>
</html>

--===============0141466343072640850==--
