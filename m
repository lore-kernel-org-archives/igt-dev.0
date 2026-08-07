Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAEE1C2A09B
	for <igt-dev@archiver.kernel.org>; Fri,  7 Aug 2026 20:04:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 619D710E24A;
	Fri,  7 Aug 2026 20:04:15 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9559410E24A;
 Fri,  7 Aug 2026 20:03:42 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3750914743272901349=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/amdgpu=3A_add_SVM_=28?=
 =?utf-8?q?shared_virtual_memory=29_test_suite?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Junhua Shen" <junhua.shen@amd.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 07 Aug 2026 20:03:42 -0000
Message-ID: <178613302260.30430.12317290123537165443@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260807045620.31954-1-Junhua.Shen@amd.com>
In-Reply-To: <20260807045620.31954-1-Junhua.Shen@amd.com>
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

--===============3750914743272901349==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/amdgpu: add SVM (shared virtual memory) test suite
URL   : https://patchwork.freedesktop.org/series/171787/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_9046_BAT -> XEIGTPW_15645_BAT
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

  Here are the changes found in XEIGTPW_15645_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_debugfs@read-all-entries:
    - bat-wcl-1:          [PASS][1] -> [TIMEOUT][2] ([Intel XE#8646])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9046/bat-wcl-1/igt@core_debugfs@read-all-entries.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15645/bat-wcl-1/igt@core_debugfs@read-all-entries.html

  * igt@xe_module_load@load:
    - bat-wcl-1:          [PASS][3] -> [DMESG-WARN][4] ([Intel XE#8551])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9046/bat-wcl-1/igt@xe_module_load@load.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15645/bat-wcl-1/igt@xe_module_load@load.html

  
  [Intel XE#8551]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8551
  [Intel XE#8646]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8646


Build changes
-------------

  * IGT: IGT_9046 -> IGTPW_15645

  IGTPW_15645: 15645
  IGT_9046: 9046
  xe-5560-01d30c194951b8794c33f0d7f559bc4a1c9b7630: 01d30c194951b8794c33f0d7f559bc4a1c9b7630

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15645/index.html

--===============3750914743272901349==
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
<tr><td><b>Series:</b></td><td>tests/amdgpu: add SVM (shared virtual memory) test suite</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/171787/">https://patchwork.freedesktop.org/series/171787/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15645/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15645/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9046_BAT -&gt; XEIGTPW_15645_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (14 -&gt; 14)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_15645_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_debugfs@read-all-entries:</p>
<ul>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9046/bat-wcl-1/igt@core_debugfs@read-all-entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15645/bat-wcl-1/igt@core_debugfs@read-all-entries.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8646">Intel XE#8646</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9046/bat-wcl-1/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15645/bat-wcl-1/igt@xe_module_load@load.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8551">Intel XE#8551</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9046 -&gt; IGTPW_15645</li>
</ul>
<p>IGTPW_15645: 15645<br />
  IGT_9046: 9046<br />
  xe-5560-01d30c194951b8794c33f0d7f559bc4a1c9b7630: 01d30c194951b8794c33f0d7f559bc4a1c9b7630</p>

</body>
</html>

--===============3750914743272901349==--
