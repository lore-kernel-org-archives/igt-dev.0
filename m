Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 168B8C0218B
	for <igt-dev@archiver.kernel.org>; Tue, 21 Jan 2025 10:48:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD12710E555;
	Tue, 21 Jan 2025 10:48:26 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B01410E55D;
 Tue, 21 Jan 2025 10:48:25 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6421346260916838812=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Make_igt=5Ffacts=5Ftest_nor?=
 =?utf-8?q?eturn_and_cleanup?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gurram, Pravalika" <pravalika.gurram@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 21 Jan 2025 10:48:25 -0000
Message-ID: <173745650542.2564997.6052121051058954154@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250121063207.71737-1-pravalika.gurram@intel.com>
In-Reply-To: <20250121063207.71737-1-pravalika.gurram@intel.com>
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

--===============6421346260916838812==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Make igt_facts_test noreturn and cleanup
URL   : https://patchwork.freedesktop.org/series/143776/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8201_BAT -> XEIGTPW_12472_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_12472_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_pipe_crc_basic@hang-read-crc:
    - bat-bmg-1:          [PASS][1] -> [DMESG-WARN][2] ([Intel XE#877]) +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8201/bat-bmg-1/igt@kms_pipe_crc_basic@hang-read-crc.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12472/bat-bmg-1/igt@kms_pipe_crc_basic@hang-read-crc.html

  
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877


Build changes
-------------

  * IGT: IGT_8201 -> IGTPW_12472

  IGTPW_12472: d00a9eb6fbffafc283fff85eab99cf7352de3c54 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8201: dcc73646ce05a91bb4537e50ee6fa7ac5e8ff4ed @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2517-e48abf2c0aa4813a4629aeebd0547eb86f0f1a91: e48abf2c0aa4813a4629aeebd0547eb86f0f1a91

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12472/index.html

--===============6421346260916838812==
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
<tr><td><b>Series:</b></td><td>Make igt_facts_test noreturn and cleanup</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/143776/">https://patchwork.freedesktop.org/series/143776/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12472/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12472/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8201_BAT -&gt; XEIGTPW_12472_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12472_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_pipe_crc_basic@hang-read-crc:<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8201/bat-bmg-1/igt@kms_pipe_crc_basic@hang-read-crc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12472/bat-bmg-1/igt@kms_pipe_crc_basic@hang-read-crc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8201 -&gt; IGTPW_12472</li>
</ul>
<p>IGTPW_12472: d00a9eb6fbffafc283fff85eab99cf7352de3c54 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8201: dcc73646ce05a91bb4537e50ee6fa7ac5e8ff4ed @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2517-e48abf2c0aa4813a4629aeebd0547eb86f0f1a91: e48abf2c0aa4813a4629aeebd0547eb86f0f1a91</p>

</body>
</html>

--===============6421346260916838812==--
