Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 511D6CCA470
	for <igt-dev@archiver.kernel.org>; Tue,  7 Oct 2025 12:59:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA81210E18C;
	Tue,  7 Oct 2025 12:59:45 +0000 (UTC)
Received: from 6aec98b87f92 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52FEC10E18C;
 Tue,  7 Oct 2025 12:59:44 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8427019379974950921=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Fsriov=5Fvr?=
 =?utf-8?q?am=3A_Add_test_checking_VF_access_to_VRAM?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lukasz Laguna" <lukasz.laguna@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 07 Oct 2025 12:59:44 -0000
Message-ID: <175984198433.13876.3344744373083797734@6aec98b87f92>
X-Patchwork-Hint: ignore
References: <20251007104525.15500-1-lukasz.laguna@intel.com>
In-Reply-To: <20251007104525.15500-1-lukasz.laguna@intel.com>
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

--===============8427019379974950921==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_sriov_vram: Add test checking VF access to VRAM
URL   : https://patchwork.freedesktop.org/series/155526/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8575_BAT -> XEIGTPW_13864_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (11 -> 10)
------------------------------

  Missing    (1): bat-dg2-oem2 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8575 -> IGTPW_13864
  * Linux: xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf -> xe-3881-7a5ff57e5407d9eb2e746b9031fff58dce7af5f3

  IGTPW_13864: 96f210c083126333ad622975b65932f3db37e23a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8575: 7efc313da1339df43a1b11bba57fef6c1257e65f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf: 5d520fdf951167ca881c7ebf831dedff629e6ccf
  xe-3881-7a5ff57e5407d9eb2e746b9031fff58dce7af5f3: 7a5ff57e5407d9eb2e746b9031fff58dce7af5f3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13864/index.html

--===============8427019379974950921==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_sriov_vram: Add test checking VF access to VRAM</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/155526/">https://patchwork.freedesktop.org/series/155526/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13864/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13864/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8575_BAT -&gt; XEIGTPW_13864_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 10)</h2>
<p>Missing    (1): bat-dg2-oem2 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8575 -&gt; IGTPW_13864</li>
<li>Linux: xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf -&gt; xe-3881-7a5ff57e5407d9eb2e746b9031fff58dce7af5f3</li>
</ul>
<p>IGTPW_13864: 96f210c083126333ad622975b65932f3db37e23a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8575: 7efc313da1339df43a1b11bba57fef6c1257e65f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3872-5d520fdf951167ca881c7ebf831dedff629e6ccf: 5d520fdf951167ca881c7ebf831dedff629e6ccf<br />
  xe-3881-7a5ff57e5407d9eb2e746b9031fff58dce7af5f3: 7a5ff57e5407d9eb2e746b9031fff58dce7af5f3</p>

</body>
</html>

--===============8427019379974950921==--
