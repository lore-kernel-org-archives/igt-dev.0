Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8CAED66B85
	for <igt-dev@archiver.kernel.org>; Wed, 17 Dec 2025 20:36:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45DBC10E1BA;
	Wed, 17 Dec 2025 20:36:13 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC96410E1BA;
 Wed, 17 Dec 2025 20:36:11 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6155263659647838814=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_lib/kms=3A_Carve_up_igt=5Fd?=
 =?utf-8?q?isplay=5Frequire=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 17 Dec 2025 20:36:11 -0000
Message-ID: <176600377189.97606.5464168846684501662@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251217153758.9369-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20251217153758.9369-1-ville.syrjala@linux.intel.com>
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

--===============6155263659647838814==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/kms: Carve up igt_display_require()
URL   : https://patchwork.freedesktop.org/series/159165/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8670_BAT -> XEIGTPW_14230_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_14230_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_14230_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (12 -> 12)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_14230_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_addfb_basic@addfb25-yf-tiled-legacy:
    - bat-dg2-oem2:       [PASS][1] -> [FAIL][2] +29 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html

  * igt@kms_addfb_basic@bo-too-small:
    - bat-bmg-2:          [PASS][3] -> [FAIL][4] +11 other tests fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/bat-bmg-2/igt@kms_addfb_basic@bo-too-small.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/bat-bmg-2/igt@kms_addfb_basic@bo-too-small.html

  * igt@kms_addfb_basic@size-max:
    - bat-lnl-2:          [PASS][5] -> [FAIL][6] +10 other tests fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/bat-lnl-2/igt@kms_addfb_basic@size-max.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/bat-lnl-2/igt@kms_addfb_basic@size-max.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:
    - bat-lnl-1:          [PASS][7] -> [FAIL][8] +31 other tests fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/bat-lnl-1/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/bat-lnl-1/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html

  * igt@kms_psr@psr-cursor-plane-move:
    - bat-adlp-7:         [PASS][9] -> [FAIL][10] +33 other tests fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html

  
#### Warnings ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-lnl-1:          [SKIP][11] ([Intel XE#1466]) -> [FAIL][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/bat-lnl-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/bat-lnl-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - bat-bmg-2:          [SKIP][13] ([Intel XE#2233]) -> [FAIL][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/bat-bmg-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/bat-bmg-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - bat-lnl-2:          [SKIP][15] ([Intel XE#1466] / [Intel XE#2235]) -> [FAIL][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/bat-lnl-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/bat-lnl-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - bat-dg2-oem2:       [SKIP][17] ([Intel XE#623]) -> [FAIL][18]
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:
    - bat-bmg-2:          [SKIP][19] ([Intel XE#2489] / [Intel XE#3419]) -> [FAIL][20] +13 other tests fail
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/bat-bmg-2/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/bat-bmg-2/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html

  * igt@kms_dsc@dsc-basic:
    - bat-lnl-1:          [SKIP][21] ([Intel XE#2244]) -> [FAIL][22]
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/bat-lnl-1/igt@kms_dsc@dsc-basic.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/bat-lnl-1/igt@kms_dsc@dsc-basic.html
    - bat-adlp-7:         [SKIP][23] ([Intel XE#455]) -> [FAIL][24]
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/bat-adlp-7/igt@kms_dsc@dsc-basic.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/bat-adlp-7/igt@kms_dsc@dsc-basic.html
    - bat-dg2-oem2:       [SKIP][25] ([Intel XE#455]) -> [FAIL][26]
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html

  * igt@kms_flip@basic-flip-vs-dpms:
    - bat-lnl-2:          [SKIP][27] ([Intel XE#2235] / [Intel XE#2482]) -> [FAIL][28] +3 other tests fail
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/bat-lnl-2/igt@kms_flip@basic-flip-vs-dpms.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/bat-lnl-2/igt@kms_flip@basic-flip-vs-dpms.html

  * igt@kms_flip@basic-flip-vs-modeset:
    - bat-bmg-2:          [SKIP][29] ([Intel XE#2482]) -> [FAIL][30] +3 other tests fail
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/bat-bmg-2/igt@kms_flip@basic-flip-vs-modeset.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/bat-bmg-2/igt@kms_flip@basic-flip-vs-modeset.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-bmg-2:          [SKIP][31] ([Intel XE#2434] / [Intel XE#2548]) -> [FAIL][32]
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/bat-bmg-2/igt@kms_frontbuffer_tracking@basic.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/bat-bmg-2/igt@kms_frontbuffer_tracking@basic.html
    - bat-lnl-2:          [SKIP][33] ([Intel XE#2235] / [Intel XE#2548]) -> [FAIL][34]
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/bat-lnl-2/igt@kms_frontbuffer_tracking@basic.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/bat-lnl-2/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24:
    - bat-lnl-2:          [SKIP][35] ([Intel XE#2235]) -> [FAIL][36] +13 other tests fail
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/bat-lnl-2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/bat-lnl-2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html

  * igt@kms_psr@psr-cursor-plane-move:
    - bat-lnl-2:          [SKIP][37] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) -> [FAIL][38] +2 other tests fail
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/bat-lnl-2/igt@kms_psr@psr-cursor-plane-move.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/bat-lnl-2/igt@kms_psr@psr-cursor-plane-move.html
    - bat-dg2-oem2:       [SKIP][39] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) -> [FAIL][40] +2 other tests fail
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - bat-bmg-2:          [SKIP][41] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) -> [FAIL][42] +2 other tests fail
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/bat-bmg-2/igt@kms_psr@psr-sprite-plane-onoff.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/bat-bmg-2/igt@kms_psr@psr-sprite-plane-onoff.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_14230_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_module_load@load:
    - bat-bmg-1:          [PASS][43] -> [ABORT][44] ([Intel XE#6887])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/bat-bmg-1/igt@xe_module_load@load.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/bat-bmg-1/igt@xe_module_load@load.html

  * igt@xe_waitfence@reltime:
    - bat-dg2-oem2:       [PASS][45] -> [FAIL][46] ([Intel XE#6520])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/bat-dg2-oem2/igt@xe_waitfence@reltime.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/bat-dg2-oem2/igt@xe_waitfence@reltime.html

  
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1466
  [Intel XE#2233]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2235]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2434]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2434
  [Intel XE#2482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482
  [Intel XE#2489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2489
  [Intel XE#2548]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#3419]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3419
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#6520]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520
  [Intel XE#6887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6887
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929


Build changes
-------------

  * IGT: IGT_8670 -> IGTPW_14230

  IGTPW_14230: 14230
  IGT_8670: 8670
  xe-4259-605176fe40c828b491a1532367df157529895b87: 605176fe40c828b491a1532367df157529895b87

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/index.html

--===============6155263659647838814==
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
<tr><td><b>Series:</b></td><td>lib/kms: Carve up igt_display_require()</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/159165/">https://patchwork.freedesktop.org/series/159165/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8670_BAT -&gt; XEIGTPW_14230_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_14230_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_14230_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_14230_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-yf-tiled-legacy:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html">FAIL</a> +29 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bo-too-small:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/bat-bmg-2/igt@kms_addfb_basic@bo-too-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/bat-bmg-2/igt@kms_addfb_basic@bo-too-small.html">FAIL</a> +11 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@size-max:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/bat-lnl-2/igt@kms_addfb_basic@size-max.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/bat-lnl-2/igt@kms_addfb_basic@size-max.html">FAIL</a> +10 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/bat-lnl-1/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/bat-lnl-1/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">FAIL</a> +31 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html">FAIL</a> +33 other tests fail</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/bat-lnl-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1466">Intel XE#1466</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/bat-lnl-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">FAIL</a></li>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/bat-bmg-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233">Intel XE#2233</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/bat-bmg-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">FAIL</a></li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/bat-lnl-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1466">Intel XE#1466</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235">Intel XE#2235</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/bat-lnl-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">FAIL</a></li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/623">Intel XE#623</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/bat-bmg-2/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2489">Intel XE#2489</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3419">Intel XE#3419</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/bat-bmg-2/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html">FAIL</a> +13 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/bat-lnl-1/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/bat-lnl-1/igt@kms_dsc@dsc-basic.html">FAIL</a></li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/bat-adlp-7/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/bat-adlp-7/igt@kms_dsc@dsc-basic.html">FAIL</a></li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/bat-lnl-2/igt@kms_flip@basic-flip-vs-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235">Intel XE#2235</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482">Intel XE#2482</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/bat-lnl-2/igt@kms_flip@basic-flip-vs-dpms.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/bat-bmg-2/igt@kms_flip@basic-flip-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482">Intel XE#2482</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/bat-bmg-2/igt@kms_flip@basic-flip-vs-modeset.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/bat-bmg-2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2434">Intel XE#2434</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/bat-bmg-2/igt@kms_frontbuffer_tracking@basic.html">FAIL</a></li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/bat-lnl-2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235">Intel XE#2235</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/bat-lnl-2/igt@kms_frontbuffer_tracking@basic.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/bat-lnl-2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235">Intel XE#2235</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/bat-lnl-2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html">FAIL</a> +13 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/bat-lnl-2/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/bat-lnl-2/igt@kms_psr@psr-cursor-plane-move.html">FAIL</a> +2 other tests fail</li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/bat-bmg-2/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/bat-bmg-2/igt@kms_psr@psr-sprite-plane-onoff.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14230_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/bat-bmg-1/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/bat-bmg-1/igt@xe_module_load@load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6887">Intel XE#6887</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@reltime:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/bat-dg2-oem2/igt@xe_waitfence@reltime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14230/bat-dg2-oem2/igt@xe_waitfence@reltime.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520">Intel XE#6520</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8670 -&gt; IGTPW_14230</li>
</ul>
<p>IGTPW_14230: 14230<br />
  IGT_8670: 8670<br />
  xe-4259-605176fe40c828b491a1532367df157529895b87: 605176fe40c828b491a1532367df157529895b87</p>

</body>
</html>

--===============6155263659647838814==--
