Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A12BC36002
	for <igt-dev@archiver.kernel.org>; Tue, 25 Mar 2025 03:42:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1EB110E36C;
	Tue, 25 Mar 2025 03:42:31 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2FAD10E36A;
 Tue, 25 Mar 2025 03:42:30 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4129854825174973793=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/kms=5Fasync=5Fflips?=
 =?utf-8?q?=3A_Add_psr_async_flip_subtest?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Santhosh Reddy Guddati" <santhosh.reddy.guddati@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 25 Mar 2025 03:42:30 -0000
Message-ID: <174287415099.75914.1462966919960581969@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250324161319.2691351-1-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20250324161319.2691351-1-santhosh.reddy.guddati@intel.com>
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

--===============4129854825174973793==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_async_flips: Add psr async flip subtest
URL   : https://patchwork.freedesktop.org/series/146675/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8281_BAT -> XEIGTPW_12824_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_12824_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_exec_basic@twice-bindexecqueue-rebind:
    - bat-adlp-vf:        [PASS][1] -> [ABORT][2] ([Intel XE#4491])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8281/bat-adlp-vf/igt@xe_exec_basic@twice-bindexecqueue-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12824/bat-adlp-vf/igt@xe_exec_basic@twice-bindexecqueue-rebind.html

  
  [Intel XE#4491]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4491


Build changes
-------------

  * IGT: IGT_8281 -> IGTPW_12824
  * Linux: xe-2842-9be2a7099019ef52d17cbc2b3e6ba15cd638ec2c -> xe-2844-9a42bdcde0f77b2c1e947e283cc3b267b1ce2056

  IGTPW_12824: 12824
  IGT_8281: 18c445bea641c03b637d7ed5bc3bd120b5d83b2a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2842-9be2a7099019ef52d17cbc2b3e6ba15cd638ec2c: 9be2a7099019ef52d17cbc2b3e6ba15cd638ec2c
  xe-2844-9a42bdcde0f77b2c1e947e283cc3b267b1ce2056: 9a42bdcde0f77b2c1e947e283cc3b267b1ce2056

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12824/index.html

--===============4129854825174973793==
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
<tr><td><b>Series:</b></td><td>tests/kms_async_flips: Add psr async flip subtest</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/146675/">https://patchwork.freedesktop.org/series/146675/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12824/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12824/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8281_BAT -&gt; XEIGTPW_12824_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12824_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_exec_basic@twice-bindexecqueue-rebind:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8281/bat-adlp-vf/igt@xe_exec_basic@twice-bindexecqueue-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12824/bat-adlp-vf/igt@xe_exec_basic@twice-bindexecqueue-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4491">Intel XE#4491</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8281 -&gt; IGTPW_12824</li>
<li>Linux: xe-2842-9be2a7099019ef52d17cbc2b3e6ba15cd638ec2c -&gt; xe-2844-9a42bdcde0f77b2c1e947e283cc3b267b1ce2056</li>
</ul>
<p>IGTPW_12824: 12824<br />
  IGT_8281: 18c445bea641c03b637d7ed5bc3bd120b5d83b2a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2842-9be2a7099019ef52d17cbc2b3e6ba15cd638ec2c: 9be2a7099019ef52d17cbc2b3e6ba15cd638ec2c<br />
  xe-2844-9a42bdcde0f77b2c1e947e283cc3b267b1ce2056: 9a42bdcde0f77b2c1e947e283cc3b267b1ce2056</p>

</body>
</html>

--===============4129854825174973793==--
