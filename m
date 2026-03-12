Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BAA5106ACF3
	for <igt-dev@archiver.kernel.org>; Thu, 12 Mar 2026 22:57:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAC7110E0E5;
	Thu, 12 Mar 2026 22:57:26 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B257810E0E5;
 Thu, 12 Mar 2026 22:57:23 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5818979285693433860=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_lib/tests=3A_Fix_gamma_2=2E?=
 =?utf-8?q?2_naming_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Alex Hung" <alex.hung@amd.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 12 Mar 2026 22:57:23 -0000
Message-ID: <177335624371.353004.14107942208139781879@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260311212502.2487982-1-alex.hung@amd.com>
In-Reply-To: <20260311212502.2487982-1-alex.hung@amd.com>
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

--===============5818979285693433860==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/tests: Fix gamma 2.2 naming (rev2)
URL   : https://patchwork.freedesktop.org/series/163062/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8799_BAT -> XEIGTPW_14753_BAT
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

  Here are the changes found in XEIGTPW_14753_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-bmg-2:          [DMESG-WARN][1] ([Intel XE#7433]) -> [PASS][2] +1 other test pass
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8799/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14753/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html
    - bat-bmg-1:          [DMESG-WARN][3] ([Intel XE#7433]) -> [PASS][4] +1 other test pass
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8799/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14753/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html

  * igt@xe_module_load@load:
    - bat-bmg-3:          [DMESG-WARN][5] ([Intel XE#7433]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8799/bat-bmg-3/igt@xe_module_load@load.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14753/bat-bmg-3/igt@xe_module_load@load.html

  
  [Intel XE#7433]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7433


Build changes
-------------

  * IGT: IGT_8799 -> IGTPW_14753
  * Linux: xe-4707-3ccc0e3404591e404d0dee79406cd013f377356a -> xe-4709-3fb8dfc6a69ee530c365c36f13bb79ef7f35af1d

  IGTPW_14753: 14753
  IGT_8799: 8799
  xe-4707-3ccc0e3404591e404d0dee79406cd013f377356a: 3ccc0e3404591e404d0dee79406cd013f377356a
  xe-4709-3fb8dfc6a69ee530c365c36f13bb79ef7f35af1d: 3fb8dfc6a69ee530c365c36f13bb79ef7f35af1d

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14753/index.html

--===============5818979285693433860==
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
<tr><td><b>Series:</b></td><td>lib/tests: Fix gamma 2.2 naming (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/163062/">https://patchwork.freedesktop.org/series/163062/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14753/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14753/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8799_BAT -&gt; XEIGTPW_14753_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (14 -&gt; 14)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14753_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8799/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7433">Intel XE#7433</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14753/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">PASS</a> +1 other test pass</li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8799/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7433">Intel XE#7433</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14753/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8799/bat-bmg-3/igt@xe_module_load@load.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7433">Intel XE#7433</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14753/bat-bmg-3/igt@xe_module_load@load.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8799 -&gt; IGTPW_14753</li>
<li>Linux: xe-4707-3ccc0e3404591e404d0dee79406cd013f377356a -&gt; xe-4709-3fb8dfc6a69ee530c365c36f13bb79ef7f35af1d</li>
</ul>
<p>IGTPW_14753: 14753<br />
  IGT_8799: 8799<br />
  xe-4707-3ccc0e3404591e404d0dee79406cd013f377356a: 3ccc0e3404591e404d0dee79406cd013f377356a<br />
  xe-4709-3fb8dfc6a69ee530c365c36f13bb79ef7f35af1d: 3fb8dfc6a69ee530c365c36f13bb79ef7f35af1d</p>

</body>
</html>

--===============5818979285693433860==--
