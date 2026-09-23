Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EB93C98304
	for <igt-dev@archiver.kernel.org>; Wed, 23 Sep 2026 23:52:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CAF610E631;
	Wed, 23 Sep 2026 23:52:40 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0320810E631;
 Wed, 23 Sep 2026 23:51:55 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8721641602257607838=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/kms=5Fatomic=3A_skip_?=
 =?utf-8?q?missing_CRTC_props_in_state_snapshot?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Aurabindo Pillai" <aurabindo.pillai@amd.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 23 Sep 2026 23:51:55 -0000
Message-ID: <179020751500.198725.14380473848244402991@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260923152113.1513938-1-aurabindo.pillai@amd.com>
In-Reply-To: <20260923152113.1513938-1-aurabindo.pillai@amd.com>
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

--===============8721641602257607838==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_atomic: skip missing CRTC props in state snapshot
URL   : https://patchwork.freedesktop.org/series/174822/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_9111_BAT -> XEIGTPW_15890_BAT
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

  Here are the changes found in XEIGTPW_15890_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-bmg-2:          [PASS][1] -> [ABORT][2] ([Intel XE#8007])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9111/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15890/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html

  * igt@xe_waitfence@abstime:
    - bat-ptl-1:          [PASS][3] -> [TIMEOUT][4] ([Intel XE#9152])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9111/bat-ptl-1/igt@xe_waitfence@abstime.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15890/bat-ptl-1/igt@xe_waitfence@abstime.html

  
#### Possible fixes ####

  * igt@xe_waitfence@engine:
    - bat-ptl-2:          [FAIL][5] ([Intel XE#9109]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9111/bat-ptl-2/igt@xe_waitfence@engine.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15890/bat-ptl-2/igt@xe_waitfence@engine.html

  
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#9109]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9109
  [Intel XE#9152]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9152


Build changes
-------------

  * IGT: IGT_9111 -> IGTPW_15890

  IGTPW_15890: f0219c1f66edea612b4009d3f86b585e14f818cd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9111: 4aeabf104b136437d0ccc57caf32a752587d595c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5815-703cd271db3a35088460ab3fec0a96bd48e7fe04: 703cd271db3a35088460ab3fec0a96bd48e7fe04

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15890/index.html

--===============8721641602257607838==
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
<tr><td><b>Series:</b></td><td>tests/kms_atomic: skip missing CRTC props in state snapshot</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/174822/">https://patchwork.freedesktop.org/series/174822/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15890/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15890/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9111_BAT -&gt; XEIGTPW_15890_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_15890_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9111/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15890/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@abstime:</p>
<ul>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9111/bat-ptl-1/igt@xe_waitfence@abstime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15890/bat-ptl-1/igt@xe_waitfence@abstime.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9152">Intel XE#9152</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_waitfence@engine:<ul>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9111/bat-ptl-2/igt@xe_waitfence@engine.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9109">Intel XE#9109</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15890/bat-ptl-2/igt@xe_waitfence@engine.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9111 -&gt; IGTPW_15890</li>
</ul>
<p>IGTPW_15890: f0219c1f66edea612b4009d3f86b585e14f818cd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9111: 4aeabf104b136437d0ccc57caf32a752587d595c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5815-703cd271db3a35088460ab3fec0a96bd48e7fe04: 703cd271db3a35088460ab3fec0a96bd48e7fe04</p>

</body>
</html>

--===============8721641602257607838==--
