Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0B2FCE8E6A
	for <igt-dev@archiver.kernel.org>; Thu, 24 Oct 2024 18:37:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 425FD10E0AA;
	Thu, 24 Oct 2024 18:37:33 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 714E710E0AA;
 Thu, 24 Oct 2024 18:37:32 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6813231527647938370=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_intel=3A_igt=5Fdraw_and_intel?=
 =?utf-8?q?=5Fbufops_improvements_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 24 Oct 2024 18:37:32 -0000
Message-ID: <172979505243.1327227.17121379780103438631@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241004104121.32750-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20241004104121.32750-1-ville.syrjala@linux.intel.com>
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

--===============6813231527647938370==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: intel: igt_draw and intel_bufops improvements (rev3)
URL   : https://patchwork.freedesktop.org/series/139556/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8082_BAT -> XEIGTPW_11976_BAT
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

  Here are the changes found in XEIGTPW_11976_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-adlp-7:         [PASS][1] -> [DMESG-WARN][2] ([Intel XE#2871])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11976/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html

  * igt@kms_psr@psr-cursor-plane-move:
    - bat-adlp-7:         [PASS][3] -> [SKIP][4] ([Intel XE#455]) +3 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11976/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html

  * igt@kms_psr@psr-primary-page-flip@edp-1:
    - bat-adlp-7:         [PASS][5] -> [DMESG-FAIL][6] ([Intel XE#2871]) +1 other test dmesg-fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/bat-adlp-7/igt@kms_psr@psr-primary-page-flip@edp-1.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11976/bat-adlp-7/igt@kms_psr@psr-primary-page-flip@edp-1.html

  
#### Possible fixes ####

  * igt@kms_addfb_basic@bad-pitch-0:
    - bat-adlp-7:         [DMESG-WARN][7] ([Intel XE#2496]) -> [PASS][8] +31 other tests pass
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/bat-adlp-7/igt@kms_addfb_basic@bad-pitch-0.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11976/bat-adlp-7/igt@kms_addfb_basic@bad-pitch-0.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [FAIL][9] ([Intel XE#1861]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11976/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  * igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
    - bat-bmg-2:          [INCOMPLETE][11] ([Intel XE#2874] / [Intel XE#2998]) -> [PASS][12] +1 other test pass
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/bat-bmg-2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11976/bat-bmg-2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html

  
#### Warnings ####

  * igt@kms_dsc@dsc-basic:
    - bat-lnl-1:          [SKIP][13] ([Intel XE#599]) -> [SKIP][14] ([Intel XE#2244])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/bat-lnl-1/igt@kms_dsc@dsc-basic.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11976/bat-lnl-1/igt@kms_dsc@dsc-basic.html

  
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2496]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2496
  [Intel XE#2871]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2871
  [Intel XE#2874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2874
  [Intel XE#2998]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2998
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599


Build changes
-------------

  * IGT: IGT_8082 -> IGTPW_11976
  * Linux: xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52 -> xe-2116-1f26e15db2d2aa3422f9faa057d23a6558166a70

  IGTPW_11976: 2eeba9fd54f0c56bab309e16fd2364142670fda7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8082: c8379ec8b26f3c21bae5473706b23da78bd26ffa @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52: beaeaccd284ba3b69b6dbfdc18bb89441fc99a52
  xe-2116-1f26e15db2d2aa3422f9faa057d23a6558166a70: 1f26e15db2d2aa3422f9faa057d23a6558166a70

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11976/index.html

--===============6813231527647938370==
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
<tr><td><b>Series:</b></td><td>intel: igt_draw and intel_bufops improvements (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/139556/">https://patchwork.freedesktop.org/series/139556/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11976/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11976/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8082_BAT -&gt; XEIGTPW_11976_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11976_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11976/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2871">Intel XE#2871</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11976/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip@edp-1:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/bat-adlp-7/igt@kms_psr@psr-primary-page-flip@edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11976/bat-adlp-7/igt@kms_psr@psr-primary-page-flip@edp-1.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2871">Intel XE#2871</a>) +1 other test dmesg-fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@bad-pitch-0:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/bat-adlp-7/igt@kms_addfb_basic@bad-pitch-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2496">Intel XE#2496</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11976/bat-adlp-7/igt@kms_addfb_basic@bad-pitch-0.html">PASS</a> +31 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11976/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/bat-bmg-2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2874">Intel XE#2874</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2998">Intel XE#2998</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11976/bat-bmg-2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_dsc@dsc-basic:<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8082/bat-lnl-1/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11976/bat-lnl-1/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8082 -&gt; IGTPW_11976</li>
<li>Linux: xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52 -&gt; xe-2116-1f26e15db2d2aa3422f9faa057d23a6558166a70</li>
</ul>
<p>IGTPW_11976: 2eeba9fd54f0c56bab309e16fd2364142670fda7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8082: c8379ec8b26f3c21bae5473706b23da78bd26ffa @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52: beaeaccd284ba3b69b6dbfdc18bb89441fc99a52<br />
  xe-2116-1f26e15db2d2aa3422f9faa057d23a6558166a70: 1f26e15db2d2aa3422f9faa057d23a6558166a70</p>

</body>
</html>

--===============6813231527647938370==--
