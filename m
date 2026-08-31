Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D8C2C624C6
	for <igt-dev@archiver.kernel.org>; Mon, 31 Aug 2026 17:22:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3EC410E292;
	Mon, 31 Aug 2026 17:22:29 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12EF510E323;
 Mon, 31 Aug 2026 17:21:50 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4727139698884505709=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel-ci=3A_blocklist?=
 =?utf-8?q?_xe=5Fexec=5Fthreads_multi-queue_tests_on_NVL_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: shivtej.eknath.patil@intel.com
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 31 Aug 2026 17:21:50 -0000
Message-ID: <178819691007.101634.134247086762662100@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260831143028.22534-1-shivtej.eknath.patil@intel.com>
In-Reply-To: <20260831143028.22534-1-shivtej.eknath.patil@intel.com>
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

--===============4727139698884505709==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel-ci: blocklist xe_exec_threads multi-queue tests on NVL (rev2)
URL   : https://patchwork.freedesktop.org/series/173069/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_9078_BAT -> XEIGTPW_15757_BAT
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

  Here are the changes found in XEIGTPW_15757_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-nvls-1:         [PASS][1] -> [DMESG-WARN][2] ([Intel XE#8762] / [Intel XE#9069])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9078/bat-nvls-1/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15757/bat-nvls-1/igt@core_hotunplug@unbind-rebind.html

  
  [Intel XE#8762]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8762
  [Intel XE#9069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9069


Build changes
-------------

  * IGT: IGT_9078 -> IGTPW_15757
  * Linux: xe-5656-108b145a702212f7cb6d40611f46c7ee7959d39e -> xe-5664-37b6bb1186b8170c2031b312e82205caa05e19d6

  IGTPW_15757: dfa1fbeb19f4fdd9a403ef979188df8a90af8675 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9078: 9078
  xe-5656-108b145a702212f7cb6d40611f46c7ee7959d39e: 108b145a702212f7cb6d40611f46c7ee7959d39e
  xe-5664-37b6bb1186b8170c2031b312e82205caa05e19d6: 37b6bb1186b8170c2031b312e82205caa05e19d6

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15757/index.html

--===============4727139698884505709==
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
<tr><td><b>Series:</b></td><td>tests/intel-ci: blocklist xe_exec_threads multi-queue tests on NVL (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/173069/">https://patchwork.freedesktop.org/series/173069/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15757/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15757/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9078_BAT -&gt; XEIGTPW_15757_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_15757_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@core_hotunplug@unbind-rebind:<ul>
<li>bat-nvls-1:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9078/bat-nvls-1/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15757/bat-nvls-1/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8762">Intel XE#8762</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9069">Intel XE#9069</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9078 -&gt; IGTPW_15757</li>
<li>Linux: xe-5656-108b145a702212f7cb6d40611f46c7ee7959d39e -&gt; xe-5664-37b6bb1186b8170c2031b312e82205caa05e19d6</li>
</ul>
<p>IGTPW_15757: dfa1fbeb19f4fdd9a403ef979188df8a90af8675 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9078: 9078<br />
  xe-5656-108b145a702212f7cb6d40611f46c7ee7959d39e: 108b145a702212f7cb6d40611f46c7ee7959d39e<br />
  xe-5664-37b6bb1186b8170c2031b312e82205caa05e19d6: 37b6bb1186b8170c2031b312e82205caa05e19d6</p>

</body>
</html>

--===============4727139698884505709==--
