Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E703C3ABC3
	for <igt-dev@archiver.kernel.org>; Fri,  9 May 2025 07:48:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CED8210E9D3;
	Fri,  9 May 2025 07:48:49 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9165B10E9D3;
 Fri,  9 May 2025 07:48:48 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0489874875606163648=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/kms=5Fsetmode=3A_Chec?=
 =?utf-8?q?k_timing_twice_before_asserting_igt=40kms=5Fsetmode=40basic?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jeevan B" <jeevan.b@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 09 May 2025 07:48:48 -0000
Message-ID: <174677692859.62749.16552109535039208532@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250509064634.809197-1-jeevan.b@intel.com>
In-Reply-To: <20250509064634.809197-1-jeevan.b@intel.com>
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

--===============0489874875606163648==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_setmode: Check timing twice before asserting igt@kms_setmode@basic
URL   : https://patchwork.freedesktop.org/series/148797/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8359_BAT -> XEIGTPW_13102_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_13102_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_vm@shared-pte-page:
    - bat-adlp-vf:        [PASS][1] -> [ABORT][2] ([Intel XE#3970])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8359/bat-adlp-vf/igt@xe_vm@shared-pte-page.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13102/bat-adlp-vf/igt@xe_vm@shared-pte-page.html

  
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970


Build changes
-------------

  * IGT: IGT_8359 -> IGTPW_13102
  * Linux: xe-3051-2862c51f227a36e59ee4a9bb90b690c9855a6246 -> xe-3057-0a4534e5a7d58144a24c64c722c771ec80b1fe32

  IGTPW_13102: 13102
  IGT_8359: 807f0cbcc771d1d0bb0d27a78231a5f92dc02126 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3051-2862c51f227a36e59ee4a9bb90b690c9855a6246: 2862c51f227a36e59ee4a9bb90b690c9855a6246
  xe-3057-0a4534e5a7d58144a24c64c722c771ec80b1fe32: 0a4534e5a7d58144a24c64c722c771ec80b1fe32

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13102/index.html

--===============0489874875606163648==
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
<tr><td><b>Series:</b></td><td>tests/kms_setmode: Check timing twice before asserting igt@kms_setmode@basic</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/148797/">https://patchwork.freedesktop.org/series/148797/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13102/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13102/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8359_BAT -&gt; XEIGTPW_13102_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_13102_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_vm@shared-pte-page:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8359/bat-adlp-vf/igt@xe_vm@shared-pte-page.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13102/bat-adlp-vf/igt@xe_vm@shared-pte-page.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8359 -&gt; IGTPW_13102</li>
<li>Linux: xe-3051-2862c51f227a36e59ee4a9bb90b690c9855a6246 -&gt; xe-3057-0a4534e5a7d58144a24c64c722c771ec80b1fe32</li>
</ul>
<p>IGTPW_13102: 13102<br />
  IGT_8359: 807f0cbcc771d1d0bb0d27a78231a5f92dc02126 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3051-2862c51f227a36e59ee4a9bb90b690c9855a6246: 2862c51f227a36e59ee4a9bb90b690c9855a6246<br />
  xe-3057-0a4534e5a7d58144a24c64c722c771ec80b1fe32: 0a4534e5a7d58144a24c64c722c771ec80b1fe32</p>

</body>
</html>

--===============0489874875606163648==--
