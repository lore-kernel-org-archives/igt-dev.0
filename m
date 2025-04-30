Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30941C3ABA9
	for <igt-dev@archiver.kernel.org>; Wed, 30 Apr 2025 14:01:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C644910E0EC;
	Wed, 30 Apr 2025 14:01:16 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98A1E10E0EC;
 Wed, 30 Apr 2025 14:01:15 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3469583817165952675=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Foa=3A_Add_?=
 =?utf-8?q?a_new_mmio_triggered_test_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sai Teja Pottumuttu" <sai.teja.pottumuttu@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 30 Apr 2025 14:01:15 -0000
Message-ID: <174602167562.30497.15464350861125549937@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250430091655.603509-1-sai.teja.pottumuttu@intel.com>
In-Reply-To: <20250430091655.603509-1-sai.teja.pottumuttu@intel.com>
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

--===============3469583817165952675==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_oa: Add a new mmio triggered test (rev2)
URL   : https://patchwork.freedesktop.org/series/148347/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8345_BAT -> XEIGTPW_13070_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_13070_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_exec_basic@twice-bindexecqueue-userptr-rebind:
    - bat-adlp-vf:        [PASS][1] -> [ABORT][2] ([Intel XE#3970])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8345/bat-adlp-vf/igt@xe_exec_basic@twice-bindexecqueue-userptr-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13070/bat-adlp-vf/igt@xe_exec_basic@twice-bindexecqueue-userptr-rebind.html

  
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970


Build changes
-------------

  * IGT: IGT_8345 -> IGTPW_13070

  IGTPW_13070: 60cc9aa0badd2356924f1d03c72b501dad4c889a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8345: b0aa259fb34bc85fd27a2a710a862e6ebea02d30 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3012-fc3ad08303990b2481cc45a6103ed79935dd3797: fc3ad08303990b2481cc45a6103ed79935dd3797

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13070/index.html

--===============3469583817165952675==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_oa: Add a new mmio triggered test (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/148347/">https://patchwork.freedesktop.org/series/148347/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13070/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13070/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8345_BAT -&gt; XEIGTPW_13070_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_13070_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_exec_basic@twice-bindexecqueue-userptr-rebind:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8345/bat-adlp-vf/igt@xe_exec_basic@twice-bindexecqueue-userptr-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13070/bat-adlp-vf/igt@xe_exec_basic@twice-bindexecqueue-userptr-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8345 -&gt; IGTPW_13070</li>
</ul>
<p>IGTPW_13070: 60cc9aa0badd2356924f1d03c72b501dad4c889a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8345: b0aa259fb34bc85fd27a2a710a862e6ebea02d30 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3012-fc3ad08303990b2481cc45a6103ed79935dd3797: fc3ad08303990b2481cc45a6103ed79935dd3797</p>

</body>
</html>

--===============3469583817165952675==--
