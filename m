Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB6C8C4345F
	for <igt-dev@archiver.kernel.org>; Fri, 19 Apr 2024 18:59:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 454F810FFD5;
	Fri, 19 Apr 2024 18:59:05 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA44C10F0B9;
 Fri, 19 Apr 2024 18:59:04 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3276051924133819666=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_Update_compression_check_based?=
 =?utf-8?q?_on_platform?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Akshata Jahagirdar" <akshata.jahagirdar@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 19 Apr 2024 18:59:04 -0000
Message-ID: <171355314469.1521185.2662372535803566588@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <cover.1713584014.git.akshata.jahagirdar@intel.com>
In-Reply-To: <cover.1713584014.git.akshata.jahagirdar@intel.com>
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

--===============3276051924133819666==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Update compression check based on platform
URL   : https://patchwork.freedesktop.org/series/132654/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7814_BAT -> XEIGTPW_11044_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (5 -> 4)
------------------------------

  Missing    (1): bat-lnl-1 

Known issues
------------

  Here are the changes found in XEIGTPW_11044_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:
    - bat-dg2-oem2:       [TIMEOUT][1] ([Intel XE#1259] / [Intel XE#1473]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7814/bat-dg2-oem2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11044/bat-dg2-oem2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html

  
  [Intel XE#1259]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1259
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473


Build changes
-------------

  * IGT: IGT_7814 -> IGTPW_11044
  * Linux: xe-1120-915273abf8b69731107af5c86fc8c6014d2b4f21 -> xe-1127-ed8769c8940fb84e54f6fd238b3f9b6ac01ceb93

  IGTPW_11044: 1928f39b081dfb7d4ce4e83cab0dbc81ca6a261c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7814: 7814
  xe-1120-915273abf8b69731107af5c86fc8c6014d2b4f21: 915273abf8b69731107af5c86fc8c6014d2b4f21
  xe-1127-ed8769c8940fb84e54f6fd238b3f9b6ac01ceb93: ed8769c8940fb84e54f6fd238b3f9b6ac01ceb93

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11044/index.html

--===============3276051924133819666==
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
<tr><td><b>Series:</b></td><td>Update compression check based on platform</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/132654/">https://patchwork.freedesktop.org/series/132654/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11044/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11044/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7814_BAT -&gt; XEIGTPW_11044_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 4)</h2>
<p>Missing    (1): bat-lnl-1 </p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11044_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7814/bat-dg2-oem2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1259">Intel XE#1259</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11044/bat-dg2-oem2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7814 -&gt; IGTPW_11044</li>
<li>Linux: xe-1120-915273abf8b69731107af5c86fc8c6014d2b4f21 -&gt; xe-1127-ed8769c8940fb84e54f6fd238b3f9b6ac01ceb93</li>
</ul>
<p>IGTPW_11044: 1928f39b081dfb7d4ce4e83cab0dbc81ca6a261c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7814: 7814<br />
  xe-1120-915273abf8b69731107af5c86fc8c6014d2b4f21: 915273abf8b69731107af5c86fc8c6014d2b4f21<br />
  xe-1127-ed8769c8940fb84e54f6fd238b3f9b6ac01ceb93: ed8769c8940fb84e54f6fd238b3f9b6ac01ceb93</p>

</body>
</html>

--===============3276051924133819666==--
