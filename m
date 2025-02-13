Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A6CFC02198
	for <igt-dev@archiver.kernel.org>; Thu, 13 Feb 2025 01:58:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A60010E26B;
	Thu, 13 Feb 2025 01:58:22 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FF5E10E24D;
 Thu, 13 Feb 2025 01:58:21 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1902385630941936532=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Fexec=5Fcap?=
 =?utf-8?q?ture=3A_Enhance_test_to_check_with_DUMPABLE_flag_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "pravalika gurram" <pravalika.gurram@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 13 Feb 2025 01:58:21 -0000
Message-ID: <173941190164.1500430.1371142966586040923@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250212153252.790029-1-pravalika.gurram@intel.com>
In-Reply-To: <20250212153252.790029-1-pravalika.gurram@intel.com>
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

--===============1902385630941936532==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_exec_capture: Enhance test to check with DUMPABLE flag (rev3)
URL   : https://patchwork.freedesktop.org/series/144379/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8229_BAT -> XEIGTPW_12582_BAT
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

  Here are the changes found in XEIGTPW_12582_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_live_ktest@xe_migrate:
    - bat-adlp-vf:        [PASS][1] -> [DMESG-FAIL][2] ([Intel XE#3890]) +1 other test dmesg-fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8229/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12582/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html

  
  [Intel XE#3890]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3890


Build changes
-------------

  * IGT: IGT_8229 -> IGTPW_12582
  * Linux: xe-2652-b9696aa14a67620661572e94f4141df2a4b6b5cd -> xe-2654-4af00c2e09da0269f3f329e660b6417037041bea

  IGTPW_12582: a8eab2d21d605b75a573df0577bbe6c7ca55980c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8229: 8229
  xe-2652-b9696aa14a67620661572e94f4141df2a4b6b5cd: b9696aa14a67620661572e94f4141df2a4b6b5cd
  xe-2654-4af00c2e09da0269f3f329e660b6417037041bea: 4af00c2e09da0269f3f329e660b6417037041bea

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12582/index.html

--===============1902385630941936532==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_exec_capture: Enhance test to check with DUMPABLE flag (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/144379/">https://patchwork.freedesktop.org/series/144379/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12582/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12582/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8229_BAT -&gt; XEIGTPW_12582_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12582_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_live_ktest@xe_migrate:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8229/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12582/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3890">Intel XE#3890</a>) +1 other test dmesg-fail</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8229 -&gt; IGTPW_12582</li>
<li>Linux: xe-2652-b9696aa14a67620661572e94f4141df2a4b6b5cd -&gt; xe-2654-4af00c2e09da0269f3f329e660b6417037041bea</li>
</ul>
<p>IGTPW_12582: a8eab2d21d605b75a573df0577bbe6c7ca55980c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8229: 8229<br />
  xe-2652-b9696aa14a67620661572e94f4141df2a4b6b5cd: b9696aa14a67620661572e94f4141df2a4b6b5cd<br />
  xe-2654-4af00c2e09da0269f3f329e660b6417037041bea: 4af00c2e09da0269f3f329e660b6417037041bea</p>

</body>
</html>

--===============1902385630941936532==--
