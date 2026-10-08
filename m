Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7323ECA6016
	for <igt-dev@archiver.kernel.org>; Thu,  8 Oct 2026 21:08:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E57110FD3F;
	Thu,  8 Oct 2026 21:08:29 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7706410FD7D;
 Thu,  8 Oct 2026 21:07:38 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3324901256424306159=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Fexec=5Fque?=
 =?utf-8?q?ue=5Fproperty=3A_Free_eq_and_vm_after_test?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jonathan Cavitt" <jonathan.cavitt@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 08 Oct 2026 21:07:38 -0000
Message-ID: <179149365848.211.6869514189767452628@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261008194203.126177-1-jonathan.cavitt@intel.com>
In-Reply-To: <20261008194203.126177-1-jonathan.cavitt@intel.com>
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

--===============3324901256424306159==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_exec_queue_property: Free eq and vm after test
URL   : https://patchwork.freedesktop.org/series/175779/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_9137_BAT -> XEIGTPW_15964_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (15 -> 14)
------------------------------

  Missing    (1): bat-adlp-7 

Known issues
------------

  Here are the changes found in XEIGTPW_15964_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-bmg-2:          [PASS][1] -> [ABORT][2] ([Intel XE#9463])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9137/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15964/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html

  
  [Intel XE#9463]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9463


Build changes
-------------

  * IGT: IGT_9137 -> IGTPW_15964
  * Linux: xe-5906-95bc52ddf34f72a3996b1f32e946304d3823be3c -> xe-5910-b51796fb74d179b7ccf4657efbf60f554fce191f

  IGTPW_15964: 31fc03c09a7c4178e78825af9d4eae79674afed8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9137: 125c0289617f3c7ba7ee376ea1d8aabd2ff5afdc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5906-95bc52ddf34f72a3996b1f32e946304d3823be3c: 95bc52ddf34f72a3996b1f32e946304d3823be3c
  xe-5910-b51796fb74d179b7ccf4657efbf60f554fce191f: b51796fb74d179b7ccf4657efbf60f554fce191f

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15964/index.html

--===============3324901256424306159==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_exec_queue_property: Free eq and vm after test</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/175779/">https://patchwork.freedesktop.org/series/175779/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15964/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15964/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9137_BAT -&gt; XEIGTPW_15964_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 14)</h2>
<p>Missing    (1): bat-adlp-7 </p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_15964_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@core_hotunplug@unbind-rebind:<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9137/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15964/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9463">Intel XE#9463</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9137 -&gt; IGTPW_15964</li>
<li>Linux: xe-5906-95bc52ddf34f72a3996b1f32e946304d3823be3c -&gt; xe-5910-b51796fb74d179b7ccf4657efbf60f554fce191f</li>
</ul>
<p>IGTPW_15964: 31fc03c09a7c4178e78825af9d4eae79674afed8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9137: 125c0289617f3c7ba7ee376ea1d8aabd2ff5afdc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5906-95bc52ddf34f72a3996b1f32e946304d3823be3c: 95bc52ddf34f72a3996b1f32e946304d3823be3c<br />
  xe-5910-b51796fb74d179b7ccf4657efbf60f554fce191f: b51796fb74d179b7ccf4657efbf60f554fce191f</p>

</body>
</html>

--===============3324901256424306159==--
