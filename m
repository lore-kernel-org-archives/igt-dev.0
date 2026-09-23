Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D307C98302
	for <igt-dev@archiver.kernel.org>; Wed, 23 Sep 2026 00:45:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC8CD10EED3;
	Wed, 23 Sep 2026 00:45:39 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CA8110EEC9;
 Wed, 23 Sep 2026 00:44:52 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4733023826286833518=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Support_test_execution_with?=
 =?utf-8?q?_pre-enabled_VFs_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lukasz Laguna" <lukasz.laguna@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 23 Sep 2026 00:44:52 -0000
Message-ID: <179012429263.195328.17834863354802471919@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260922070940.3006983-1-lukasz.laguna@intel.com>
In-Reply-To: <20260922070940.3006983-1-lukasz.laguna@intel.com>
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

--===============4733023826286833518==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Support test execution with pre-enabled VFs (rev2)
URL   : https://patchwork.freedesktop.org/series/172734/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_9109_BAT -> XEIGTPW_15881_BAT
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

  Here are the changes found in XEIGTPW_15881_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_exec_system_allocator@many-execqueues-free:
    - bat-bmg-vm:         [PASS][1] -> [DMESG-WARN][2] ([Intel XE#9331])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9109/bat-bmg-vm/igt@xe_exec_system_allocator@many-execqueues-free.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15881/bat-bmg-vm/igt@xe_exec_system_allocator@many-execqueues-free.html

  
#### Possible fixes ####

  * igt@xe_exec_system_allocator@many-execqueues-malloc:
    - bat-bmg-vm:         [DMESG-WARN][3] ([Intel XE#9331]) -> [PASS][4] +1 other test pass
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9109/bat-bmg-vm/igt@xe_exec_system_allocator@many-execqueues-malloc.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15881/bat-bmg-vm/igt@xe_exec_system_allocator@many-execqueues-malloc.html

  
  [Intel XE#9331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9331


Build changes
-------------

  * IGT: IGT_9109 -> IGTPW_15881
  * Linux: xe-5807-3413ca5893855693d3cc12697713842547261439 -> xe-5809-3413ca5893855693d3cc12697713842547261439

  IGTPW_15881: adf9c9bc61564994e84d5e6328dae8298843c5af @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9109: 65f84b280be2caf8ce376295d97987a808affdee @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5807-3413ca5893855693d3cc12697713842547261439: 3413ca5893855693d3cc12697713842547261439
  xe-5809-3413ca5893855693d3cc12697713842547261439: 3413ca5893855693d3cc12697713842547261439

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15881/index.html

--===============4733023826286833518==
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
<tr><td><b>Series:</b></td><td>Support test execution with pre-enabled VFs (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/172734/">https://patchwork.freedesktop.org/series/172734/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15881/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15881/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9109_BAT -&gt; XEIGTPW_15881_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (14 -&gt; 14)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_15881_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_exec_system_allocator@many-execqueues-free:<ul>
<li>bat-bmg-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9109/bat-bmg-vm/igt@xe_exec_system_allocator@many-execqueues-free.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15881/bat-bmg-vm/igt@xe_exec_system_allocator@many-execqueues-free.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9331">Intel XE#9331</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_exec_system_allocator@many-execqueues-malloc:<ul>
<li>bat-bmg-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9109/bat-bmg-vm/igt@xe_exec_system_allocator@many-execqueues-malloc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9331">Intel XE#9331</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15881/bat-bmg-vm/igt@xe_exec_system_allocator@many-execqueues-malloc.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9109 -&gt; IGTPW_15881</li>
<li>Linux: xe-5807-3413ca5893855693d3cc12697713842547261439 -&gt; xe-5809-3413ca5893855693d3cc12697713842547261439</li>
</ul>
<p>IGTPW_15881: adf9c9bc61564994e84d5e6328dae8298843c5af @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9109: 65f84b280be2caf8ce376295d97987a808affdee @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5807-3413ca5893855693d3cc12697713842547261439: 3413ca5893855693d3cc12697713842547261439<br />
  xe-5809-3413ca5893855693d3cc12697713842547261439: 3413ca5893855693d3cc12697713842547261439</p>

</body>
</html>

--===============4733023826286833518==--
