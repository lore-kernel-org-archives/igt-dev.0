Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2488F10A1E77
	for <igt-dev@archiver.kernel.org>; Thu, 26 Mar 2026 11:17:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE80610E265;
	Thu, 26 Mar 2026 11:17:54 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A84C910E2B9;
 Thu, 26 Mar 2026 11:17:48 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0806923442773507283=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Add_fault-injection_tests_f?=
 =?utf-8?q?or_Freq_Throttle_Reasons?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ravi Kishore Koppuravuri" <ravi.kishore.koppuravuri@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 26 Mar 2026 11:17:48 -0000
Message-ID: <177452386866.401031.5346417118889216791@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260326052917.2511216-1-ravi.kishore.koppuravuri@intel.com>
In-Reply-To: <20260326052917.2511216-1-ravi.kishore.koppuravuri@intel.com>
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

--===============0806923442773507283==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add fault-injection tests for Freq Throttle Reasons
URL   : https://patchwork.freedesktop.org/series/163889/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8833_BAT -> XEIGTPW_14860_BAT
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

  Here are the changes found in XEIGTPW_14860_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_waitfence@abstime:
    - bat-dg2-oem2:       [PASS][1] -> [TIMEOUT][2] ([Intel XE#6506])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8833/bat-dg2-oem2/igt@xe_waitfence@abstime.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14860/bat-dg2-oem2/igt@xe_waitfence@abstime.html

  * igt@xe_waitfence@engine:
    - bat-dg2-oem2:       [PASS][3] -> [FAIL][4] ([Intel XE#6519])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8833/bat-dg2-oem2/igt@xe_waitfence@engine.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14860/bat-dg2-oem2/igt@xe_waitfence@engine.html

  
#### Possible fixes ####

  * igt@xe_waitfence@reltime:
    - bat-dg2-oem2:       [FAIL][5] ([Intel XE#6520]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8833/bat-dg2-oem2/igt@xe_waitfence@reltime.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14860/bat-dg2-oem2/igt@xe_waitfence@reltime.html

  
#### Warnings ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-bmg-2:          [DMESG-WARN][7] ([Intel XE#7433]) -> [ABORT][8] ([Intel XE#7249] / [Intel XE#7578])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8833/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14860/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html

  
  [Intel XE#6506]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506
  [Intel XE#6519]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519
  [Intel XE#6520]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520
  [Intel XE#7249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7249
  [Intel XE#7433]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7433
  [Intel XE#7578]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7578


Build changes
-------------

  * IGT: IGT_8833 -> IGTPW_14860
  * Linux: xe-4791-ddf93a5c967d452d7c3ab937818c20b95498842d -> xe-4792-bff01d5de5118e98342ba4531ae5ac39eb9d9875

  IGTPW_14860: abffe96110150468ab70eaf0dd2a94a39e2a7a4a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8833: 8833
  xe-4791-ddf93a5c967d452d7c3ab937818c20b95498842d: ddf93a5c967d452d7c3ab937818c20b95498842d
  xe-4792-bff01d5de5118e98342ba4531ae5ac39eb9d9875: bff01d5de5118e98342ba4531ae5ac39eb9d9875

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14860/index.html

--===============0806923442773507283==
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
<tr><td><b>Series:</b></td><td>Add fault-injection tests for Freq Throttle Reasons</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/163889/">https://patchwork.freedesktop.org/series/163889/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14860/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14860/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8833_BAT -&gt; XEIGTPW_14860_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (14 -&gt; 14)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14860_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_waitfence@abstime:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8833/bat-dg2-oem2/igt@xe_waitfence@abstime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14860/bat-dg2-oem2/igt@xe_waitfence@abstime.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506">Intel XE#6506</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@engine:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8833/bat-dg2-oem2/igt@xe_waitfence@engine.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14860/bat-dg2-oem2/igt@xe_waitfence@engine.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519">Intel XE#6519</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_waitfence@reltime:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8833/bat-dg2-oem2/igt@xe_waitfence@reltime.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520">Intel XE#6520</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14860/bat-dg2-oem2/igt@xe_waitfence@reltime.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@core_hotunplug@unbind-rebind:<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8833/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7433">Intel XE#7433</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14860/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7249">Intel XE#7249</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7578">Intel XE#7578</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8833 -&gt; IGTPW_14860</li>
<li>Linux: xe-4791-ddf93a5c967d452d7c3ab937818c20b95498842d -&gt; xe-4792-bff01d5de5118e98342ba4531ae5ac39eb9d9875</li>
</ul>
<p>IGTPW_14860: abffe96110150468ab70eaf0dd2a94a39e2a7a4a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8833: 8833<br />
  xe-4791-ddf93a5c967d452d7c3ab937818c20b95498842d: ddf93a5c967d452d7c3ab937818c20b95498842d<br />
  xe-4792-bff01d5de5118e98342ba4531ae5ac39eb9d9875: bff01d5de5118e98342ba4531ae5ac39eb9d9875</p>

</body>
</html>

--===============0806923442773507283==--
