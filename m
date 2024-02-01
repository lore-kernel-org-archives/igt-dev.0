Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BC88C47DDF
	for <igt-dev@archiver.kernel.org>; Thu,  1 Feb 2024 11:43:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88E7F10E9DE;
	Thu,  1 Feb 2024 11:43:29 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDD5C10EC3C;
 Thu,  1 Feb 2024 11:43:27 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8995749205489628772=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_Fill_block-copy_test_gap_for_u?=
 =?utf-8?q?naligned_sizes_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Thu, 01 Feb 2024 11:43:27 -0000
Message-ID: <170678780799.894913.1728553957190074525@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240201100724.257845-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20240201100724.257845-1-zbigniew.kempczynski@intel.com>
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
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

--===============8995749205489628772==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Fill block-copy test gap for unaligned sizes (rev4)
URL   : https://patchwork.freedesktop.org/series/129362/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7700_BAT -> XEIGTPW_10621_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_10621_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dp-3:
    - bat-dg2-oem2:       [PASS][1] -> [FAIL][2] ([Intel XE#400] / [Intel XE#616]) +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7700/bat-dg2-oem2/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dp-3.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10621/bat-dg2-oem2/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dp-3.html

  
  [Intel XE#400]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/400
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616


Build changes
-------------

  * IGT: IGT_7700 -> IGTPW_10621
  * Linux: xe-712-cba66c6a2af4df1b9b420fbad0a9ac1e68f14030 -> xe-714-bc72404452d402682457b998a9884af537adddd2

  IGTPW_10621: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10621/index.html
  IGT_7700: 7700
  xe-712-cba66c6a2af4df1b9b420fbad0a9ac1e68f14030: cba66c6a2af4df1b9b420fbad0a9ac1e68f14030
  xe-714-bc72404452d402682457b998a9884af537adddd2: bc72404452d402682457b998a9884af537adddd2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10621/index.html

--===============8995749205489628772==
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
<tr><td><b>Series:</b></td><td>Fill block-copy test gap for unaligned sizes (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/129362/">https://patchwork.freedesktop.org/series/129362/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10621/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10621/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7700_BAT -&gt; XEIGTPW_10621_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_10621_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dp-3:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7700/bat-dg2-oem2/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dp-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10621/bat-dg2-oem2/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dp-3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/400">Intel XE#400</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +1 other test fail</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7700 -&gt; IGTPW_10621</li>
<li>Linux: xe-712-cba66c6a2af4df1b9b420fbad0a9ac1e68f14030 -&gt; xe-714-bc72404452d402682457b998a9884af537adddd2</li>
</ul>
<p>IGTPW_10621: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10621/index.html<br />
  IGT_7700: 7700<br />
  xe-712-cba66c6a2af4df1b9b420fbad0a9ac1e68f14030: cba66c6a2af4df1b9b420fbad0a9ac1e68f14030<br />
  xe-714-bc72404452d402682457b998a9884af537adddd2: bc72404452d402682457b998a9884af537adddd2</p>

</body>
</html>

--===============8995749205489628772==--
