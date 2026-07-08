Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CBC5C44501
	for <igt-dev@archiver.kernel.org>; Wed,  8 Jul 2026 23:29:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D42A110E9C9;
	Wed,  8 Jul 2026 23:29:39 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3425F10E9C9;
 Wed,  8 Jul 2026 23:29:09 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7581468380026216962=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_lib/igt=5Fdebugfs=3A_Add_?=
 =?utf-8?q?=22errno=22_to_debug_print?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ngai-Mint Kwan" <ngai-mint.kwan@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 08 Jul 2026 23:29:09 -0000
Message-ID: <178355334920.167178.11767195852829304594@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260708225223.866079-1-ngai-mint.kwan@linux.intel.com>
In-Reply-To: <20260708225223.866079-1-ngai-mint.kwan@linux.intel.com>
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

--===============7581468380026216962==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/igt_debugfs: Add "errno" to debug print
URL   : https://patchwork.freedesktop.org/series/170041/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8994_BAT -> XEIGTPW_15494_BAT
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

  Here are the changes found in XEIGTPW_15494_BAT that come from known issues:

### IGT changes ###

#### Warnings ####

  * igt@xe_evict@evict-beng-small-cm:
    - bat-lnl-1:          [SKIP][1] ([Intel XE#6540] / [Intel XE#688]) -> [SKIP][2] ([Intel XE#6540]) +11 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8994/bat-lnl-1/igt@xe_evict@evict-beng-small-cm.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15494/bat-lnl-1/igt@xe_evict@evict-beng-small-cm.html

  * igt@xe_evict@evict-beng-small-external:
    - bat-lnl-2:          [SKIP][3] ([Intel XE#6540] / [Intel XE#688]) -> [SKIP][4] ([Intel XE#6540]) +9 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8994/bat-lnl-2/igt@xe_evict@evict-beng-small-external.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15494/bat-lnl-2/igt@xe_evict@evict-beng-small-external.html

  
  [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688


Build changes
-------------

  * IGT: IGT_8994 -> IGTPW_15494
  * Linux: xe-5368-d2b771941e0c8aec7b6648b0c47d81161136944d -> xe-5370-ab9c4156ab48d805163a92976fabf872e4ddcd4d

  IGTPW_15494: 15494
  IGT_8994: 59469572ae481848d6bd469242aef7c5333b39ad @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5368-d2b771941e0c8aec7b6648b0c47d81161136944d: d2b771941e0c8aec7b6648b0c47d81161136944d
  xe-5370-ab9c4156ab48d805163a92976fabf872e4ddcd4d: ab9c4156ab48d805163a92976fabf872e4ddcd4d

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15494/index.html

--===============7581468380026216962==
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
<tr><td><b>Series:</b></td><td>lib/igt_debugfs: Add &quot;errno&quot; to debug print</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/170041/">https://patchwork.freedesktop.org/series/170041/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15494/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15494/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8994_BAT -&gt; XEIGTPW_15494_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_15494_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@xe_evict@evict-beng-small-cm:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8994/bat-lnl-1/igt@xe_evict@evict-beng-small-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540">Intel XE#6540</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15494/bat-lnl-1/igt@xe_evict@evict-beng-small-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540">Intel XE#6540</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-external:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8994/bat-lnl-2/igt@xe_evict@evict-beng-small-external.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540">Intel XE#6540</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15494/bat-lnl-2/igt@xe_evict@evict-beng-small-external.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540">Intel XE#6540</a>) +9 other tests skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8994 -&gt; IGTPW_15494</li>
<li>Linux: xe-5368-d2b771941e0c8aec7b6648b0c47d81161136944d -&gt; xe-5370-ab9c4156ab48d805163a92976fabf872e4ddcd4d</li>
</ul>
<p>IGTPW_15494: 15494<br />
  IGT_8994: 59469572ae481848d6bd469242aef7c5333b39ad @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5368-d2b771941e0c8aec7b6648b0c47d81161136944d: d2b771941e0c8aec7b6648b0c47d81161136944d<br />
  xe-5370-ab9c4156ab48d805163a92976fabf872e4ddcd4d: ab9c4156ab48d805163a92976fabf872e4ddcd4d</p>

</body>
</html>

--===============7581468380026216962==--
