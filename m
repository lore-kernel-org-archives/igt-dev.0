Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 042EECCF9F8
	for <igt-dev@archiver.kernel.org>; Thu,  6 Nov 2025 06:51:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E87810E820;
	Thu,  6 Nov 2025 06:51:55 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2A7E10E133;
 Thu,  6 Nov 2025 06:51:54 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2452347477458298539=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/kms=5Fvrr=3A_Fix_pote?=
 =?utf-8?q?ntial_NULL_dereference_in_test=5Fcleanup_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Naladala Ramanaidu" <ramanaidu.naladala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 06 Nov 2025 06:51:54 -0000
Message-ID: <176241191478.23832.8651605568192621406@10055242dc62>
X-Patchwork-Hint: ignore
References: <20251106044103.1502264-1-ramanaidu.naladala@intel.com>
In-Reply-To: <20251106044103.1502264-1-ramanaidu.naladala@intel.com>
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

--===============2452347477458298539==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_vrr: Fix potential NULL dereference in test_cleanup (rev3)
URL   : https://patchwork.freedesktop.org/series/157017/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8610_BAT -> XEIGTPW_14006_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (12 -> 10)
------------------------------

  Missing    (2): bat-adlp-vm bat-ptl-vm 

Known issues
------------

  Here are the changes found in XEIGTPW_14006_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_vrr@cmrr:
    - bat-ptl-1:          NOTRUN -> [SKIP][1] ([Intel XE#5766]) +11 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14006/bat-ptl-1/igt@kms_vrr@cmrr.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - bat-lnl-1:          NOTRUN -> [FAIL][2] ([Intel XE#4459]) +1 other test fail
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14006/bat-lnl-1/igt@kms_vrr@cmrr@pipe-a-edp-1.html
    - bat-ptl-2:          NOTRUN -> [FAIL][3] ([Intel XE#4459]) +1 other test fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14006/bat-ptl-2/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@kms_vrr@flip-basic:
    - bat-bmg-1:          NOTRUN -> [SKIP][4] ([Intel XE#1499]) +9 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14006/bat-bmg-1/igt@kms_vrr@flip-basic.html

  * igt@kms_vrr@flip-basic-fastset:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][5] ([Intel XE#455]) +8 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14006/bat-dg2-oem2/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@flipline:
    - bat-ptl-2:          NOTRUN -> [FAIL][6] ([Intel XE#4227]) +3 other tests fail
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14006/bat-ptl-2/igt@kms_vrr@flipline.html

  * igt@kms_vrr@lobf:
    - bat-bmg-2:          NOTRUN -> [SKIP][7] ([Intel XE#3419]) +11 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14006/bat-bmg-2/igt@kms_vrr@lobf.html
    - bat-adlp-7:         NOTRUN -> [SKIP][8] ([Intel XE#2168]) +1 other test skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14006/bat-adlp-7/igt@kms_vrr@lobf.html
    - bat-bmg-1:          NOTRUN -> [SKIP][9] ([Intel XE#2168]) +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14006/bat-bmg-1/igt@kms_vrr@lobf.html
    - bat-lnl-1:          NOTRUN -> [FAIL][10] ([Intel XE#6390]) +1 other test fail
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14006/bat-lnl-1/igt@kms_vrr@lobf.html
    - bat-ptl-2:          NOTRUN -> [FAIL][11] ([Intel XE#6390]) +1 other test fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14006/bat-ptl-2/igt@kms_vrr@lobf.html
    - bat-dg2-oem2:       NOTRUN -> [SKIP][12] ([Intel XE#2168]) +1 other test skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14006/bat-dg2-oem2/igt@kms_vrr@lobf.html

  * igt@kms_vrr@negative-basic:
    - bat-atsm-2:         NOTRUN -> [SKIP][13] ([Intel XE#1024]) +11 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14006/bat-atsm-2/igt@kms_vrr@negative-basic.html
    - bat-ptl-2:          NOTRUN -> [SKIP][14] ([Intel XE#5949])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14006/bat-ptl-2/igt@kms_vrr@negative-basic.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - bat-lnl-1:          NOTRUN -> [SKIP][15] ([Intel XE#1499]) +2 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14006/bat-lnl-1/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
    - bat-ptl-2:          NOTRUN -> [FAIL][16] ([Intel XE#5862]) +1 other test fail
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14006/bat-ptl-2/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - bat-adlp-7:         NOTRUN -> [SKIP][17] ([Intel XE#455]) +8 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14006/bat-adlp-7/igt@kms_vrr@seamless-rr-switch-vrr.html
    - bat-lnl-2:          NOTRUN -> [SKIP][18] ([Intel XE#2235]) +11 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14006/bat-lnl-2/igt@kms_vrr@seamless-rr-switch-vrr.html
    - bat-ptl-2:          NOTRUN -> [SKIP][19] ([Intel XE#5948]) +1 other test skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14006/bat-ptl-2/igt@kms_vrr@seamless-rr-switch-vrr.html

  
  [Intel XE#1024]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2235]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235
  [Intel XE#3419]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3419
  [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
  [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#5766]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5766
  [Intel XE#5862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5862
  [Intel XE#5948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5948
  [Intel XE#5949]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5949
  [Intel XE#6390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6390


Build changes
-------------

  * IGT: IGT_8610 -> IGTPW_14006

  IGTPW_14006: 14006
  IGT_8610: 8610
  xe-4055-893c123d23de1f19f4b609970cfe56caabd9ff96: 893c123d23de1f19f4b609970cfe56caabd9ff96

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14006/index.html

--===============2452347477458298539==
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
<tr><td><b>Series:</b></td><td>tests/kms_vrr: Fix potential NULL dereference in test_cleanup (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/157017/">https://patchwork.freedesktop.org/series/157017/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14006/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14006/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8610_BAT -&gt; XEIGTPW_14006_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 10)</h2>
<p>Missing    (2): bat-adlp-vm bat-ptl-vm </p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14006_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>bat-ptl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14006/bat-ptl-1/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5766">Intel XE#5766</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14006/bat-lnl-1/igt@kms_vrr@cmrr@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459">Intel XE#4459</a>) +1 other test fail</li>
<li>bat-ptl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14006/bat-ptl-2/igt@kms_vrr@cmrr@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459">Intel XE#4459</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14006/bat-bmg-1/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14006/bat-dg2-oem2/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>bat-ptl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14006/bat-ptl-2/igt@kms_vrr@flipline.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227">Intel XE#4227</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14006/bat-bmg-2/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3419">Intel XE#3419</a>) +11 other tests skip</li>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14006/bat-adlp-7/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>) +1 other test skip</li>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14006/bat-bmg-1/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>) +1 other test skip</li>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14006/bat-lnl-1/igt@kms_vrr@lobf.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6390">Intel XE#6390</a>) +1 other test fail</li>
<li>bat-ptl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14006/bat-ptl-2/igt@kms_vrr@lobf.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6390">Intel XE#6390</a>) +1 other test fail</li>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14006/bat-dg2-oem2/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14006/bat-atsm-2/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a>) +11 other tests skip</li>
<li>bat-ptl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14006/bat-ptl-2/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5949">Intel XE#5949</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14006/bat-lnl-1/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:</p>
<ul>
<li>bat-ptl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14006/bat-ptl-2/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5862">Intel XE#5862</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14006/bat-adlp-7/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +8 other tests skip</li>
<li>bat-lnl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14006/bat-lnl-2/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235">Intel XE#2235</a>) +11 other tests skip</li>
<li>bat-ptl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14006/bat-ptl-2/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5948">Intel XE#5948</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8610 -&gt; IGTPW_14006</li>
</ul>
<p>IGTPW_14006: 14006<br />
  IGT_8610: 8610<br />
  xe-4055-893c123d23de1f19f4b609970cfe56caabd9ff96: 893c123d23de1f19f4b609970cfe56caabd9ff96</p>

</body>
</html>

--===============2452347477458298539==--
