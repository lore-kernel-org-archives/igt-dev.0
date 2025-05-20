Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EB1CC3ABDD
	for <igt-dev@archiver.kernel.org>; Tue, 20 May 2025 06:30:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B984A10E401;
	Tue, 20 May 2025 06:30:24 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5420610E3F8;
 Tue, 20 May 2025 06:30:23 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2690844869136711883=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_series_starting_with_=5Bi-g?=
 =?utf-8?q?-t=2Cv2=2C1/2=5D_tests/amdgpu=3A_userq_skip_waiting_for_signal_fe?=
 =?utf-8?q?nce?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Yogesh Mohan Marimuthu" <yogesh.mohanmarimuthu@amd.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 20 May 2025 06:30:23 -0000
Message-ID: <174772262333.2960.12017804474733154517@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250520053728.1703-1-yogesh.mohanmarimuthu@amd.com>
In-Reply-To: <20250520053728.1703-1-yogesh.mohanmarimuthu@amd.com>
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

--===============2690844869136711883==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,v2,1/2] tests/amdgpu: userq skip waiting for signal fence
URL   : https://patchwork.freedesktop.org/series/149218/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8368_BAT -> XEIGTPW_13148_BAT
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with XEIGTPW_13148_BAT need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_13148_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_13148_BAT:

### IGT changes ###

#### Warnings ####

  * igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries:
    - bat-lnl-2:          [DMESG-WARN][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8368/bat-lnl-2/igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13148/bat-lnl-2/igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries.html

  


Build changes
-------------

  * IGT: IGT_8368 -> IGTPW_13148
  * Linux: xe-3110-9ef3b3ca5fada31ee49be0882e69fd516f29e070 -> xe-3112-956a742459cff150a14f1d2f44b6294e646f208a

  IGTPW_13148: ece0ac8a591e61ee0d4284294f0865cd294561a5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8368: 8368
  xe-3110-9ef3b3ca5fada31ee49be0882e69fd516f29e070: 9ef3b3ca5fada31ee49be0882e69fd516f29e070
  xe-3112-956a742459cff150a14f1d2f44b6294e646f208a: 956a742459cff150a14f1d2f44b6294e646f208a

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13148/index.html

--===============2690844869136711883==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,v2,1/2] tests/amdgpu: userq skip waiting for signal fence</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/149218/">https://patchwork.freedesktop.org/series/149218/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13148/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13148/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8368_BAT -&gt; XEIGTPW_13148_BAT</h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with XEIGTPW_13148_BAT need to be verified<br />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_13148_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_13148_BAT:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries:<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8368/bat-lnl-2/igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13148/bat-lnl-2/igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8368 -&gt; IGTPW_13148</li>
<li>Linux: xe-3110-9ef3b3ca5fada31ee49be0882e69fd516f29e070 -&gt; xe-3112-956a742459cff150a14f1d2f44b6294e646f208a</li>
</ul>
<p>IGTPW_13148: ece0ac8a591e61ee0d4284294f0865cd294561a5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8368: 8368<br />
  xe-3110-9ef3b3ca5fada31ee49be0882e69fd516f29e070: 9ef3b3ca5fada31ee49be0882e69fd516f29e070<br />
  xe-3112-956a742459cff150a14f1d2f44b6294e646f208a: 956a742459cff150a14f1d2f44b6294e646f208a</p>

</body>
</html>

--===============2690844869136711883==--
