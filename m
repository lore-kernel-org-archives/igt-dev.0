Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4325FCCF9FE
	for <igt-dev@archiver.kernel.org>; Mon,  3 Nov 2025 04:42:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CBA110E04A;
	Mon,  3 Nov 2025 04:42:22 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BC9B10E04A;
 Mon,  3 Nov 2025 04:42:20 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4194488337011859437=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_Multi-CCS_support_in_IGT_?=
 =?utf-8?q?=28rev8=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: nishit.sharma@intel.com
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 03 Nov 2025 04:42:20 -0000
Message-ID: <176214494056.9998.7546543013349474803@10055242dc62>
X-Patchwork-Hint: ignore
References: <20251103034533.24895-1-nishit.sharma@intel.com>
In-Reply-To: <20251103034533.24895-1-nishit.sharma@intel.com>
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

--===============4194488337011859437==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Multi-CCS support in IGT (rev8)
URL   : https://patchwork.freedesktop.org/series/153115/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8605_BAT -> XEIGTPW_13977_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_13977_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_13977_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (12 -> 12)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_13977_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_compute@compute-square:
    - bat-ptl-1:          [PASS][1] -> [SKIP][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8605/bat-ptl-1/igt@xe_compute@compute-square.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13977/bat-ptl-1/igt@xe_compute@compute-square.html
    - bat-bmg-2:          [PASS][3] -> [SKIP][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8605/bat-bmg-2/igt@xe_compute@compute-square.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13977/bat-bmg-2/igt@xe_compute@compute-square.html
    - bat-bmg-1:          [PASS][5] -> [SKIP][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8605/bat-bmg-1/igt@xe_compute@compute-square.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13977/bat-bmg-1/igt@xe_compute@compute-square.html
    - bat-adlp-7:         [PASS][7] -> [SKIP][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8605/bat-adlp-7/igt@xe_compute@compute-square.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13977/bat-adlp-7/igt@xe_compute@compute-square.html
    - bat-ptl-2:          [PASS][9] -> [SKIP][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8605/bat-ptl-2/igt@xe_compute@compute-square.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13977/bat-ptl-2/igt@xe_compute@compute-square.html
    - bat-dg2-oem2:       [PASS][11] -> [SKIP][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8605/bat-dg2-oem2/igt@xe_compute@compute-square.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13977/bat-dg2-oem2/igt@xe_compute@compute-square.html
    - bat-adlp-vm:        [PASS][13] -> [SKIP][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8605/bat-adlp-vm/igt@xe_compute@compute-square.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13977/bat-adlp-vm/igt@xe_compute@compute-square.html
    - bat-atsm-2:         [PASS][15] -> [SKIP][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8605/bat-atsm-2/igt@xe_compute@compute-square.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13977/bat-atsm-2/igt@xe_compute@compute-square.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_13977_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-plain-flip@b-edp1:
    - bat-adlp-7:         [PASS][17] -> [DMESG-WARN][18] ([Intel XE#4543]) +1 other test dmesg-warn
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8605/bat-adlp-7/igt@kms_flip@basic-plain-flip@b-edp1.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13977/bat-adlp-7/igt@kms_flip@basic-plain-flip@b-edp1.html

  
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543


Build changes
-------------

  * IGT: IGT_8605 -> IGTPW_13977
  * Linux: xe-4026-203c9c05c014fd3a624e9cb07d86820b3ad63bf9 -> xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515

  IGTPW_13977: 13977
  IGT_8605: 8605
  xe-4026-203c9c05c014fd3a624e9cb07d86820b3ad63bf9: 203c9c05c014fd3a624e9cb07d86820b3ad63bf9
  xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515: b9356481c8ac3cba317f6c7af88db25452b0e515

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13977/index.html

--===============4194488337011859437==
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
<tr><td><b>Series:</b></td><td>Multi-CCS support in IGT (rev8)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/153115/">https://patchwork.freedesktop.org/series/153115/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13977/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13977/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8605_BAT -&gt; XEIGTPW_13977_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_13977_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_13977_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_13977_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_compute@compute-square:<ul>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8605/bat-ptl-1/igt@xe_compute@compute-square.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13977/bat-ptl-1/igt@xe_compute@compute-square.html">SKIP</a></li>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8605/bat-bmg-2/igt@xe_compute@compute-square.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13977/bat-bmg-2/igt@xe_compute@compute-square.html">SKIP</a></li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8605/bat-bmg-1/igt@xe_compute@compute-square.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13977/bat-bmg-1/igt@xe_compute@compute-square.html">SKIP</a></li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8605/bat-adlp-7/igt@xe_compute@compute-square.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13977/bat-adlp-7/igt@xe_compute@compute-square.html">SKIP</a></li>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8605/bat-ptl-2/igt@xe_compute@compute-square.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13977/bat-ptl-2/igt@xe_compute@compute-square.html">SKIP</a></li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8605/bat-dg2-oem2/igt@xe_compute@compute-square.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13977/bat-dg2-oem2/igt@xe_compute@compute-square.html">SKIP</a></li>
<li>bat-adlp-vm:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8605/bat-adlp-vm/igt@xe_compute@compute-square.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13977/bat-adlp-vm/igt@xe_compute@compute-square.html">SKIP</a></li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8605/bat-atsm-2/igt@xe_compute@compute-square.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13977/bat-atsm-2/igt@xe_compute@compute-square.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_13977_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_flip@basic-plain-flip@b-edp1:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8605/bat-adlp-7/igt@kms_flip@basic-plain-flip@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13977/bat-adlp-7/igt@kms_flip@basic-plain-flip@b-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8605 -&gt; IGTPW_13977</li>
<li>Linux: xe-4026-203c9c05c014fd3a624e9cb07d86820b3ad63bf9 -&gt; xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515</li>
</ul>
<p>IGTPW_13977: 13977<br />
  IGT_8605: 8605<br />
  xe-4026-203c9c05c014fd3a624e9cb07d86820b3ad63bf9: 203c9c05c014fd3a624e9cb07d86820b3ad63bf9<br />
  xe-4030-b9356481c8ac3cba317f6c7af88db25452b0e515: b9356481c8ac3cba317f6c7af88db25452b0e515</p>

</body>
</html>

--===============4194488337011859437==--
