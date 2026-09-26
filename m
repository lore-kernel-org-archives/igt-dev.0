Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E900C9830E
	for <igt-dev@archiver.kernel.org>; Sat, 26 Sep 2026 01:30:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28F5610E02A;
	Sat, 26 Sep 2026 01:30:02 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C38C610E02A;
 Sat, 26 Sep 2026 01:29:17 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1068566302878414691=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Ftlb=3A_Wai?=
 =?utf-8?q?t_for_the_rebind_before_the_second_exec?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Shuicheng Lin" <shuicheng.lin@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sat, 26 Sep 2026 01:29:17 -0000
Message-ID: <179038615779.208168.10798350112639665570@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260925234448.936777-1-shuicheng.lin@intel.com>
In-Reply-To: <20260925234448.936777-1-shuicheng.lin@intel.com>
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

--===============1068566302878414691==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_tlb: Wait for the rebind before the second exec
URL   : https://patchwork.freedesktop.org/series/175025/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_9113_BAT -> XEIGTPW_15907_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (15 -> 15)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_15907_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-nvls-1:         [PASS][1] -> [DMESG-WARN][2] ([Intel XE#8762] / [Intel XE#9069])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9113/bat-nvls-1/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15907/bat-nvls-1/igt@core_hotunplug@unbind-rebind.html

  
  [Intel XE#8762]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8762
  [Intel XE#9069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9069


Build changes
-------------

  * IGT: IGT_9113 -> IGTPW_15907
  * Linux: xe-5825-f44eaea74cc54b667ac438cfda0c7ee39cfa556a -> xe-5828-54f4f12a67b91ec733ce92716450060001532681

  IGTPW_15907: 5cda8f0e40ab1691aea091629cb815b3244fb587 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9113: 691cc6fd50d5a3f6f2b5805c9698af1df28f6830 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5825-f44eaea74cc54b667ac438cfda0c7ee39cfa556a: f44eaea74cc54b667ac438cfda0c7ee39cfa556a
  xe-5828-54f4f12a67b91ec733ce92716450060001532681: 54f4f12a67b91ec733ce92716450060001532681

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15907/index.html

--===============1068566302878414691==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_tlb: Wait for the rebind before the second exec</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/175025/">https://patchwork.freedesktop.org/series/175025/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15907/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15907/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9113_BAT -&gt; XEIGTPW_15907_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_15907_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@core_hotunplug@unbind-rebind:<ul>
<li>bat-nvls-1:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9113/bat-nvls-1/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15907/bat-nvls-1/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8762">Intel XE#8762</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9069">Intel XE#9069</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9113 -&gt; IGTPW_15907</li>
<li>Linux: xe-5825-f44eaea74cc54b667ac438cfda0c7ee39cfa556a -&gt; xe-5828-54f4f12a67b91ec733ce92716450060001532681</li>
</ul>
<p>IGTPW_15907: 5cda8f0e40ab1691aea091629cb815b3244fb587 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9113: 691cc6fd50d5a3f6f2b5805c9698af1df28f6830 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5825-f44eaea74cc54b667ac438cfda0c7ee39cfa556a: f44eaea74cc54b667ac438cfda0c7ee39cfa556a<br />
  xe-5828-54f4f12a67b91ec733ce92716450060001532681: 54f4f12a67b91ec733ce92716450060001532681</p>

</body>
</html>

--===============1068566302878414691==--
