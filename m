Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDA46C79F99
	for <igt-dev@archiver.kernel.org>; Tue,  8 Sep 2026 18:55:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4847210E173;
	Tue,  8 Sep 2026 18:55:57 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C96CF10E173;
 Tue,  8 Sep 2026 18:55:09 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4875742038592225774=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_series_starting_with_=5Bi-g?=
 =?utf-8?q?-t=2Cv2=2C1/2=5D_tests/intel=3A_Add_kms=5Fhdmi=5Faudio=5Fbw_test?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sharma, Swati2" <swati2.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 08 Sep 2026 18:55:09 -0000
Message-ID: <178889370981.137411.831117745627898731@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260908062541.490631-1-swati2.sharma@intel.com>
In-Reply-To: <20260908062541.490631-1-swati2.sharma@intel.com>
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

--===============4875742038592225774==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,v2,1/2] tests/intel: Add kms_hdmi_audio_bw test
URL   : https://patchwork.freedesktop.org/series/173556/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_9086_BAT -> XEIGTPW_15806_BAT
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

  Here are the changes found in XEIGTPW_15806_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-bmg-2:          [PASS][1] -> [ABORT][2] ([Intel XE#8007])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9086/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15806/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html

  * igt@xe_waitfence@reltime:
    - bat-wcl-2:          [PASS][3] -> [FAIL][4] ([Intel XE#9115])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9086/bat-wcl-2/igt@xe_waitfence@reltime.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15806/bat-wcl-2/igt@xe_waitfence@reltime.html

  
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#9115]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9115


Build changes
-------------

  * IGT: IGT_9086 -> IGTPW_15806
  * Linux: xe-5707-761d71119125b00057aac2d8b43c28353c8b89be -> xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d

  IGTPW_15806: 8a59ea62dcde5ccc6dbe2e07ddd1d0c5d63ca741 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9086: a89061ecccede222b8da2f310f3bf71ed908c365 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5707-761d71119125b00057aac2d8b43c28353c8b89be: 761d71119125b00057aac2d8b43c28353c8b89be
  xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d: 5cb17454a3e04fcc1133d87451c9c582c297e92d

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15806/index.html

--===============4875742038592225774==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,v2,1/2] tests/intel: Add kms_hdmi_audio_bw test</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/173556/">https://patchwork.freedesktop.org/series/173556/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15806/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15806/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9086_BAT -&gt; XEIGTPW_15806_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (14 -&gt; 14)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_15806_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9086/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15806/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@reltime:</p>
<ul>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9086/bat-wcl-2/igt@xe_waitfence@reltime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15806/bat-wcl-2/igt@xe_waitfence@reltime.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9115">Intel XE#9115</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9086 -&gt; IGTPW_15806</li>
<li>Linux: xe-5707-761d71119125b00057aac2d8b43c28353c8b89be -&gt; xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d</li>
</ul>
<p>IGTPW_15806: 8a59ea62dcde5ccc6dbe2e07ddd1d0c5d63ca741 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9086: a89061ecccede222b8da2f310f3bf71ed908c365 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5707-761d71119125b00057aac2d8b43c28353c8b89be: 761d71119125b00057aac2d8b43c28353c8b89be<br />
  xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d: 5cb17454a3e04fcc1133d87451c9c582c297e92d</p>

</body>
</html>

--===============4875742038592225774==--
