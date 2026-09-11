Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA693C88E41
	for <igt-dev@archiver.kernel.org>; Fri, 11 Sep 2026 01:10:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46C2F10E047;
	Fri, 11 Sep 2026 01:10:48 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 229C610E047;
 Fri, 11 Sep 2026 01:10:00 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8285996793340015259=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_lib/amdgpu=3A_add_asic_id_f?=
 =?utf-8?q?or_gfx1102?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: vitaly.prosyak@amd.com
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 11 Sep 2026 01:10:00 -0000
Message-ID: <178908900013.148519.4726669191399605185@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260910171148.29997-1-vitaly.prosyak@amd.com>
In-Reply-To: <20260910171148.29997-1-vitaly.prosyak@amd.com>
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

--===============8285996793340015259==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/amdgpu: add asic id for gfx1102
URL   : https://patchwork.freedesktop.org/series/173804/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_9091_BAT -> XEIGTPW_15829_BAT
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

  Here are the changes found in XEIGTPW_15829_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-nvls-1:         [DMESG-WARN][1] ([Intel XE#8762] / [Intel XE#9069]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9091/bat-nvls-1/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15829/bat-nvls-1/igt@core_hotunplug@unbind-rebind.html

  * igt@xe_waitfence@abstime:
    - bat-ptl-2:          [TIMEOUT][3] ([Intel XE#9152]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9091/bat-ptl-2/igt@xe_waitfence@abstime.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15829/bat-ptl-2/igt@xe_waitfence@abstime.html

  
  [Intel XE#8762]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8762
  [Intel XE#9069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9069
  [Intel XE#9152]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9152


Build changes
-------------

  * IGT: IGT_9091 -> IGTPW_15829

  IGTPW_15829: 2d3abe40d24a39377c6688227273f382510d02cf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9091: 9091
  xe-5726-cf3f6830cd1a44f792534b4f5695c5ca7a69943d: cf3f6830cd1a44f792534b4f5695c5ca7a69943d

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15829/index.html

--===============8285996793340015259==
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
<tr><td><b>Series:</b></td><td>lib/amdgpu: add asic id for gfx1102</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/173804/">https://patchwork.freedesktop.org/series/173804/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15829/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15829/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9091_BAT -&gt; XEIGTPW_15829_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_15829_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-nvls-1:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9091/bat-nvls-1/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8762">Intel XE#8762</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9069">Intel XE#9069</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15829/bat-nvls-1/igt@core_hotunplug@unbind-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@abstime:</p>
<ul>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9091/bat-ptl-2/igt@xe_waitfence@abstime.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9152">Intel XE#9152</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15829/bat-ptl-2/igt@xe_waitfence@abstime.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9091 -&gt; IGTPW_15829</li>
</ul>
<p>IGTPW_15829: 2d3abe40d24a39377c6688227273f382510d02cf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9091: 9091<br />
  xe-5726-cf3f6830cd1a44f792534b4f5695c5ca7a69943d: cf3f6830cd1a44f792534b4f5695c5ca7a69943d</p>

</body>
</html>

--===============8285996793340015259==--
