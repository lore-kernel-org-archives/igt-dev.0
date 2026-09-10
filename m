Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDA62C79FBF
	for <igt-dev@archiver.kernel.org>; Thu, 10 Sep 2026 16:22:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B35410E211;
	Thu, 10 Sep 2026 16:22:55 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1180710E2B0;
 Thu, 10 Sep 2026 16:22:06 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6774314435049446537=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_lib/rendercopy=3A_Use_the_X?=
 =?utf-8?q?e2+_depth_buffer_packet?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jan Maslak" <jan.maslak@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 10 Sep 2026 16:22:06 -0000
Message-ID: <178905732601.147924.12887987345191468288@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260910123935.4183522-1-jan.maslak@intel.com>
In-Reply-To: <20260910123935.4183522-1-jan.maslak@intel.com>
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

--===============6774314435049446537==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/rendercopy: Use the Xe2+ depth buffer packet
URL   : https://patchwork.freedesktop.org/series/173791/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_9090_BAT -> XEIGTPW_15825_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (15 -> 13)
------------------------------

  Missing    (2): bat-bmg-1 bat-bmg-vm 

Known issues
------------

  Here are the changes found in XEIGTPW_15825_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-bmg-2:          [PASS][1] -> [ABORT][2] ([Intel XE#8007])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9090/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15825/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html

  * igt@xe_waitfence@abstime:
    - bat-ptl-2:          [PASS][3] -> [TIMEOUT][4] ([Intel XE#9152])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9090/bat-ptl-2/igt@xe_waitfence@abstime.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15825/bat-ptl-2/igt@xe_waitfence@abstime.html

  
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#9152]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9152


Build changes
-------------

  * IGT: IGT_9090 -> IGTPW_15825
  * Linux: xe-5721-2aafa4e382d7609b0db012bc568d65d36217587a -> xe-5722-b8885acadfe9e40109912dd45986112b007b0d98

  IGTPW_15825: 15825
  IGT_9090: 9090
  xe-5721-2aafa4e382d7609b0db012bc568d65d36217587a: 2aafa4e382d7609b0db012bc568d65d36217587a
  xe-5722-b8885acadfe9e40109912dd45986112b007b0d98: b8885acadfe9e40109912dd45986112b007b0d98

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15825/index.html

--===============6774314435049446537==
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
<tr><td><b>Series:</b></td><td>lib/rendercopy: Use the Xe2+ depth buffer packet</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/173791/">https://patchwork.freedesktop.org/series/173791/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15825/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15825/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9090_BAT -&gt; XEIGTPW_15825_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 13)</h2>
<p>Missing    (2): bat-bmg-1 bat-bmg-vm </p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_15825_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9090/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15825/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@abstime:</p>
<ul>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9090/bat-ptl-2/igt@xe_waitfence@abstime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15825/bat-ptl-2/igt@xe_waitfence@abstime.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9152">Intel XE#9152</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9090 -&gt; IGTPW_15825</li>
<li>Linux: xe-5721-2aafa4e382d7609b0db012bc568d65d36217587a -&gt; xe-5722-b8885acadfe9e40109912dd45986112b007b0d98</li>
</ul>
<p>IGTPW_15825: 15825<br />
  IGT_9090: 9090<br />
  xe-5721-2aafa4e382d7609b0db012bc568d65d36217587a: 2aafa4e382d7609b0db012bc568d65d36217587a<br />
  xe-5722-b8885acadfe9e40109912dd45986112b007b0d98: b8885acadfe9e40109912dd45986112b007b0d98</p>

</body>
</html>

--===============6774314435049446537==--
