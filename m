Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3302C43458
	for <igt-dev@archiver.kernel.org>; Tue,  7 Jul 2026 09:35:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93C4710EC10;
	Tue,  7 Jul 2026 09:35:45 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93C4710EC10;
 Tue,  7 Jul 2026 09:35:15 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5260184907514520314=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/kms=5Fdisplay=5Fmodes?=
 =?utf-8?q?=3A_Skip_mirrored_pipe_combinations_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jeevan B" <jeevan.b@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 07 Jul 2026 09:35:15 -0000
Message-ID: <178341691559.159280.9579872107483195736@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260707041113.3997991-1-jeevan.b@intel.com>
In-Reply-To: <20260707041113.3997991-1-jeevan.b@intel.com>
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

--===============5260184907514520314==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_display_modes: Skip mirrored pipe combinations (rev2)
URL   : https://patchwork.freedesktop.org/series/169829/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8991_BAT -> XEIGTPW_15477_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 12)
------------------------------

  Missing    (1): bat-bmg-2 

Known issues
------------

  Here are the changes found in XEIGTPW_15477_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_live_ktest@xe_dma_buf:
    - bat-bmg-vm:         [PASS][1] -> [ABORT][2] ([Intel XE#8007] / [Intel XE#8023]) +1 other test abort
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8991/bat-bmg-vm/igt@xe_live_ktest@xe_dma_buf.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15477/bat-bmg-vm/igt@xe_live_ktest@xe_dma_buf.html

  
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8023]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8023


Build changes
-------------

  * IGT: IGT_8991 -> IGTPW_15477
  * Linux: xe-5352-6085bbba363b5c5b1f0e0420a9d7ecfd8ccea907 -> xe-5354-96e9ac36699d58791b67aea5e1d258074ea63165

  IGTPW_15477: 15477
  IGT_8991: c5721520bb6611ab8fcbe27db0c120b72d25b99e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5352-6085bbba363b5c5b1f0e0420a9d7ecfd8ccea907: 6085bbba363b5c5b1f0e0420a9d7ecfd8ccea907
  xe-5354-96e9ac36699d58791b67aea5e1d258074ea63165: 96e9ac36699d58791b67aea5e1d258074ea63165

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15477/index.html

--===============5260184907514520314==
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
<tr><td><b>Series:</b></td><td>tests/kms_display_modes: Skip mirrored pipe combinations (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/169829/">https://patchwork.freedesktop.org/series/169829/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15477/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15477/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8991_BAT -&gt; XEIGTPW_15477_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 12)</h2>
<p>Missing    (1): bat-bmg-2 </p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_15477_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_live_ktest@xe_dma_buf:<ul>
<li>bat-bmg-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8991/bat-bmg-vm/igt@xe_live_ktest@xe_dma_buf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15477/bat-bmg-vm/igt@xe_live_ktest@xe_dma_buf.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8023">Intel XE#8023</a>) +1 other test abort</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8991 -&gt; IGTPW_15477</li>
<li>Linux: xe-5352-6085bbba363b5c5b1f0e0420a9d7ecfd8ccea907 -&gt; xe-5354-96e9ac36699d58791b67aea5e1d258074ea63165</li>
</ul>
<p>IGTPW_15477: 15477<br />
  IGT_8991: c5721520bb6611ab8fcbe27db0c120b72d25b99e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5352-6085bbba363b5c5b1f0e0420a9d7ecfd8ccea907: 6085bbba363b5c5b1f0e0420a9d7ecfd8ccea907<br />
  xe-5354-96e9ac36699d58791b67aea5e1d258074ea63165: 96e9ac36699d58791b67aea5e1d258074ea63165</p>

</body>
</html>

--===============5260184907514520314==--
