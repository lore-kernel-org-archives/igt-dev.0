Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A500CC6B34
	for <igt-dev@archiver.kernel.org>; Thu, 15 Oct 2026 10:12:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F8D310EBB9;
	Thu, 15 Oct 2026 10:12:49 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4426410EBBF;
 Thu, 15 Oct 2026 10:12:02 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0139169398792373487=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_series_starting_with_=5B1/3?=
 =?utf-8?q?=5D_lib/amdgpu=3A_add_MES_reset_test_helpers?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: vitaly.prosyak@amd.com
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 15 Oct 2026 10:12:02 -0000
Message-ID: <179205912227.28772.11669898841707430868@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261015040236.112017-1-vitaly.prosyak@amd.com>
In-Reply-To: <20261015040236.112017-1-vitaly.prosyak@amd.com>
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

--===============0139169398792373487==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/3] lib/amdgpu: add MES reset test helpers
URL   : https://patchwork.freedesktop.org/series/176166/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_9146_BAT -> XEIGTPW_15989_BAT
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

  Here are the changes found in XEIGTPW_15989_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-bmg-2:          [ABORT][1] ([Intel XE#9463]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9146/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15989/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html
    - bat-nvls-1:         [DMESG-WARN][3] ([Intel XE#8762] / [Intel XE#9069]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9146/bat-nvls-1/igt@core_hotunplug@unbind-rebind.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15989/bat-nvls-1/igt@core_hotunplug@unbind-rebind.html

  
  [Intel XE#8762]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8762
  [Intel XE#9069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9069
  [Intel XE#9463]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9463


Build changes
-------------

  * IGT: IGT_9146 -> IGTPW_15989
  * Linux: xe-5946-c06d7623a198463e9aa2d09a3c33d96fe66ea662 -> xe-5950-ea0d7e7169afc7f6dfdc72e2e5e44e8710dabda3

  IGTPW_15989: 4d44937acee5e59fd0bac3a67085b011701ea88b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9146: 9e6040664f13f0767bb4d1028b422b7ee00425dc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5946-c06d7623a198463e9aa2d09a3c33d96fe66ea662: c06d7623a198463e9aa2d09a3c33d96fe66ea662
  xe-5950-ea0d7e7169afc7f6dfdc72e2e5e44e8710dabda3: ea0d7e7169afc7f6dfdc72e2e5e44e8710dabda3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15989/index.html

--===============0139169398792373487==
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
<tr><td><b>Series:</b></td><td>series starting with [1/3] lib/amdgpu: add MES reset test helpers</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/176166/">https://patchwork.freedesktop.org/series/176166/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15989/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15989/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9146_BAT -&gt; XEIGTPW_15989_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_15989_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@core_hotunplug@unbind-rebind:<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9146/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9463">Intel XE#9463</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15989/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">PASS</a></li>
<li>bat-nvls-1:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9146/bat-nvls-1/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8762">Intel XE#8762</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9069">Intel XE#9069</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15989/bat-nvls-1/igt@core_hotunplug@unbind-rebind.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9146 -&gt; IGTPW_15989</li>
<li>Linux: xe-5946-c06d7623a198463e9aa2d09a3c33d96fe66ea662 -&gt; xe-5950-ea0d7e7169afc7f6dfdc72e2e5e44e8710dabda3</li>
</ul>
<p>IGTPW_15989: 4d44937acee5e59fd0bac3a67085b011701ea88b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9146: 9e6040664f13f0767bb4d1028b422b7ee00425dc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5946-c06d7623a198463e9aa2d09a3c33d96fe66ea662: c06d7623a198463e9aa2d09a3c33d96fe66ea662<br />
  xe-5950-ea0d7e7169afc7f6dfdc72e2e5e44e8710dabda3: ea0d7e7169afc7f6dfdc72e2e5e44e8710dabda3</p>

</body>
</html>

--===============0139169398792373487==--
