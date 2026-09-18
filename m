Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9C36C88E75
	for <igt-dev@archiver.kernel.org>; Fri, 18 Sep 2026 04:20:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4913510F171;
	Fri, 18 Sep 2026 04:20:21 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBBF110F171;
 Fri, 18 Sep 2026 04:19:37 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1794567257835950867=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/xe=5Fexec=5Fsystem=5F?=
 =?utf-8?q?allocator=3A_skip_huge-page_multi-process_tests_when_memory_is_lo?=
 =?utf-8?q?w?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jia Yao" <jia.yao@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 18 Sep 2026 04:19:37 -0000
Message-ID: <178970517782.177999.4042531718251601014@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260917230748.1825181-1-jia.yao@intel.com>
In-Reply-To: <20260917230748.1825181-1-jia.yao@intel.com>
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

--===============1794567257835950867==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/xe_exec_system_allocator: skip huge-page multi-process tests when memory is low
URL   : https://patchwork.freedesktop.org/series/174462/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_9100_BAT -> XEIGTPW_15862_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (15 -> 15)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_9100 -> IGTPW_15862
  * Linux: xe-5772-1687195a722fb2a8bfa0af9b739a0485034fefcb -> xe-5775-988199b4d1624a97ec2daa85bc5feb15a4166347

  IGTPW_15862: 5d6467786102c0b39887405f779ca5a8cd87931c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9100: 80e998fdbe300b1ca29901099f35316bd83781e4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5772-1687195a722fb2a8bfa0af9b739a0485034fefcb: 1687195a722fb2a8bfa0af9b739a0485034fefcb
  xe-5775-988199b4d1624a97ec2daa85bc5feb15a4166347: 988199b4d1624a97ec2daa85bc5feb15a4166347

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/index.html

--===============1794567257835950867==
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
<tr><td><b>Series:</b></td><td>tests/xe_exec_system_allocator: skip huge-page multi-process tests when memory is low</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/174462/">https://patchwork.freedesktop.org/series/174462/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9100_BAT -&gt; XEIGTPW_15862_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9100 -&gt; IGTPW_15862</li>
<li>Linux: xe-5772-1687195a722fb2a8bfa0af9b739a0485034fefcb -&gt; xe-5775-988199b4d1624a97ec2daa85bc5feb15a4166347</li>
</ul>
<p>IGTPW_15862: 5d6467786102c0b39887405f779ca5a8cd87931c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9100: 80e998fdbe300b1ca29901099f35316bd83781e4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5772-1687195a722fb2a8bfa0af9b739a0485034fefcb: 1687195a722fb2a8bfa0af9b739a0485034fefcb<br />
  xe-5775-988199b4d1624a97ec2daa85bc5feb15a4166347: 988199b4d1624a97ec2daa85bc5feb15a4166347</p>

</body>
</html>

--===============1794567257835950867==--
