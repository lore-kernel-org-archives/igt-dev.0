Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F32C8606A323
	for <igt-dev@archiver.kernel.org>; Fri, 27 Nov 2026 07:56:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D2E01127CC;
	Fri, 27 Nov 2026 07:56:27 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31F671127DB;
 Fri, 27 Nov 2026 07:55:17 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4590233770388051661=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Enable_TG_preemption_testin?=
 =?utf-8?q?g_on_CRI?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himanshu Girotra" <himanshu.girotra@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 27 Nov 2026 07:55:17 -0000
Message-ID: <179576611719.97655.15052613839886555048@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261127044504.4119774-1-himanshu.girotra@intel.com>
In-Reply-To: <20261127044504.4119774-1-himanshu.girotra@intel.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-1.0 required=3.0 tests=BAYES_00,HTML_MESSAGE,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============4590233770388051661==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Enable TG preemption testing on CRI
URL   : https://patchwork.freedesktop.org/series/179816/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_9206_BAT -> XEIGTPW_16227_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (15 -> 14)
------------------------------

  Missing    (1): bat-bmg-vm 

Known issues
------------

  Here are the changes found in XEIGTPW_16227_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-bmg-1:          [ABORT][1] ([Intel XE#9841]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9206/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16227/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html

  
  [Intel XE#9841]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9841


Build changes
-------------

  * IGT: IGT_9206 -> IGTPW_16227

  IGTPW_16227: e8c1b61ee3066cf8a308a0e2f28b42a808ebc80d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9206: 9206
  xe-6246-17f7eb2368b0eed1dfda22b10966fa181d9b2c83: 17f7eb2368b0eed1dfda22b10966fa181d9b2c83

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16227/index.html

--===============4590233770388051661==
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
<tr><td><b>Series:</b></td><td>Enable TG preemption testing on CRI</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/179816/">https://patchwork.freedesktop.org/series/179816/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16227/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16227/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9206_BAT -&gt; XEIGTPW_16227_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 14)</h2>
<p>Missing    (1): bat-bmg-vm </p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_16227_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@core_hotunplug@unbind-rebind:<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9206/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9841">Intel XE#9841</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16227/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9206 -&gt; IGTPW_16227</li>
</ul>
<p>IGTPW_16227: e8c1b61ee3066cf8a308a0e2f28b42a808ebc80d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9206: 9206<br />
  xe-6246-17f7eb2368b0eed1dfda22b10966fa181d9b2c83: 17f7eb2368b0eed1dfda22b10966fa181d9b2c83</p>

</body>
</html>

--===============4590233770388051661==--
