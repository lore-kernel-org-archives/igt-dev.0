Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0168CD6E6E
	for <igt-dev@archiver.kernel.org>; Thu,  4 Jun 2026 21:11:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A272113FB7;
	Thu,  4 Jun 2026 21:11:09 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63A99113FB7;
 Thu,  4 Jun 2026 21:10:48 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6348265528355965466=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_Add_dsc+bigjoiner_subtest?=
 =?utf-8?q?_=28rev10=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Swati Sharma" <swati2.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 04 Jun 2026 21:10:48 -0000
Message-ID: <178060744839.44886.5851150624617853872@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260604201102.2583200-1-swati2.sharma@intel.com>
In-Reply-To: <20260604201102.2583200-1-swati2.sharma@intel.com>
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

--===============6348265528355965466==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add dsc+bigjoiner subtest (rev10)
URL   : https://patchwork.freedesktop.org/series/128266/
State : success

== Summary ==

CI Bug Log - changes from IGT_8948 -> IGTPW_15306
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with IGTPW_15306 need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_15306, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15306/index.html

Participating hosts (42 -> 40)
------------------------------

  Missing    (2): bat-dg2-13 fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_15306:

### IGT changes ###

#### Warnings ####

  * igt@kms_dsc@dsc-basic:
    - bat-rpls-4:         [SKIP][1] ([i915#3555] / [i915#3840] / [i915#9886]) -> [SKIP][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8948/bat-rpls-4/igt@kms_dsc@dsc-basic.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15306/bat-rpls-4/igt@kms_dsc@dsc-basic.html
    - bat-twl-1:          [SKIP][3] ([i915#9886]) -> [SKIP][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8948/bat-twl-1/igt@kms_dsc@dsc-basic.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15306/bat-twl-1/igt@kms_dsc@dsc-basic.html
    - bat-jsl-5:          [SKIP][5] ([i915#3555] / [i915#9886]) -> [SKIP][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8948/bat-jsl-5/igt@kms_dsc@dsc-basic.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15306/bat-jsl-5/igt@kms_dsc@dsc-basic.html
    - bat-arls-5:         [SKIP][7] ([i915#9886]) -> [SKIP][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8948/bat-arls-5/igt@kms_dsc@dsc-basic.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15306/bat-arls-5/igt@kms_dsc@dsc-basic.html
    - bat-rplp-1:         [SKIP][9] ([i915#3555] / [i915#3840]) -> [SKIP][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8948/bat-rplp-1/igt@kms_dsc@dsc-basic.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15306/bat-rplp-1/igt@kms_dsc@dsc-basic.html
    - fi-tgl-1115g4:      [SKIP][11] ([i915#3555] / [i915#3840]) -> [SKIP][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8948/fi-tgl-1115g4/igt@kms_dsc@dsc-basic.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15306/fi-tgl-1115g4/igt@kms_dsc@dsc-basic.html
    - bat-twl-2:          [SKIP][13] ([i915#9886]) -> [SKIP][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8948/bat-twl-2/igt@kms_dsc@dsc-basic.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15306/bat-twl-2/igt@kms_dsc@dsc-basic.html
    - bat-dg2-14:         [SKIP][15] ([i915#3555] / [i915#3840]) -> [SKIP][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8948/bat-dg2-14/igt@kms_dsc@dsc-basic.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15306/bat-dg2-14/igt@kms_dsc@dsc-basic.html
    - bat-mtlp-9:         [SKIP][17] ([i915#3555] / [i915#3840] / [i915#9159]) -> [SKIP][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8948/bat-mtlp-9/igt@kms_dsc@dsc-basic.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15306/bat-mtlp-9/igt@kms_dsc@dsc-basic.html
    - bat-arls-6:         [SKIP][19] ([i915#9886]) -> [SKIP][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8948/bat-arls-6/igt@kms_dsc@dsc-basic.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15306/bat-arls-6/igt@kms_dsc@dsc-basic.html
    - bat-mtlp-8:         [SKIP][21] ([i915#3555] / [i915#3840] / [i915#9159]) -> [SKIP][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8948/bat-mtlp-8/igt@kms_dsc@dsc-basic.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15306/bat-mtlp-8/igt@kms_dsc@dsc-basic.html
    - bat-adls-6:         [SKIP][23] ([i915#3555] / [i915#3840]) -> [SKIP][24]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8948/bat-adls-6/igt@kms_dsc@dsc-basic.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15306/bat-adls-6/igt@kms_dsc@dsc-basic.html
    - bat-arlh-3:         [SKIP][25] ([i915#9886]) -> [SKIP][26]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8948/bat-arlh-3/igt@kms_dsc@dsc-basic.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15306/bat-arlh-3/igt@kms_dsc@dsc-basic.html
    - bat-dg1-7:          [SKIP][27] ([i915#3555] / [i915#3840]) -> [SKIP][28]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8948/bat-dg1-7/igt@kms_dsc@dsc-basic.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15306/bat-dg1-7/igt@kms_dsc@dsc-basic.html

  
New tests
---------

  New tests have been introduced between IGT_8948 and IGTPW_15306:

### New IGT tests (15) ###

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-dp-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.54] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-dp-2:
    - Statuses : 2 pass(s)
    - Exec time: [0.54, 0.63] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-dp-3:
    - Statuses : 2 pass(s)
    - Exec time: [0.54, 0.61] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-vga-1:
    - Statuses : 4 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-dp-3:
    - Statuses : 2 pass(s)
    - Exec time: [0.52, 0.60] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-vga-1:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-d-dp-3:
    - Statuses : 2 pass(s)
    - Exec time: [0.52, 0.59] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-a-dp-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.48] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-b-dp-2:
    - Statuses : 2 pass(s)
    - Exec time: [0.44, 0.50] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-b-dp-3:
    - Statuses : 2 pass(s)
    - Exec time: [0.46, 0.50] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-b-vga-1:
    - Statuses : 4 pass(s)
    - Exec time: [0.29, 0.58] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-c-dp-3:
    - Statuses : 2 pass(s)
    - Exec time: [0.45, 0.47] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-c-vga-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.29, 0.30] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-d-dp-3:
    - Statuses : 2 pass(s)
    - Exec time: [0.46, 0.47] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-d-hdmi-a-2:
    - Statuses : 3 pass(s)
    - Exec time: [0.43, 0.47] s

  

  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#3840]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840
  [i915#9159]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9159
  [i915#9886]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9886


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8948 -> IGTPW_15306
  * Linux: CI_DRM_18625 -> CI_DRM_18629

  CI-20190529: 20190529
  CI_DRM_18625: 70c7b363fab8198549bb9b82134bda0f6bda9452 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_18629: 406f3120fc73b6e2bd23e1884ca5e8dc05ccf9d3 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15306: 69a9b8385ec48291d5c534d45cd570c84b490e47 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8948: 8948

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15306/index.html

--===============6348265528355965466==
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
<tr><td><b>Series:</b></td><td>Add dsc+bigjoiner subtest (rev10)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/128266/">https://patchwork.freedesktop.org/series/128266/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15306/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15306/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8948 -&gt; IGTPW_15306</h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with IGTPW_15306 need to be verified<br />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_15306, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15306/index.html</p>
<h2>Participating hosts (42 -&gt; 40)</h2>
<p>Missing    (2): bat-dg2-13 fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_15306:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>igt@kms_dsc@dsc-basic:<ul>
<li>bat-rpls-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8948/bat-rpls-4/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9886">i915#9886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15306/bat-rpls-4/igt@kms_dsc@dsc-basic.html">SKIP</a></li>
<li>bat-twl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8948/bat-twl-1/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9886">i915#9886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15306/bat-twl-1/igt@kms_dsc@dsc-basic.html">SKIP</a></li>
<li>bat-jsl-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8948/bat-jsl-5/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9886">i915#9886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15306/bat-jsl-5/igt@kms_dsc@dsc-basic.html">SKIP</a></li>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8948/bat-arls-5/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9886">i915#9886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15306/bat-arls-5/igt@kms_dsc@dsc-basic.html">SKIP</a></li>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8948/bat-rplp-1/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15306/bat-rplp-1/igt@kms_dsc@dsc-basic.html">SKIP</a></li>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8948/fi-tgl-1115g4/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15306/fi-tgl-1115g4/igt@kms_dsc@dsc-basic.html">SKIP</a></li>
<li>bat-twl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8948/bat-twl-2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9886">i915#9886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15306/bat-twl-2/igt@kms_dsc@dsc-basic.html">SKIP</a></li>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8948/bat-dg2-14/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15306/bat-dg2-14/igt@kms_dsc@dsc-basic.html">SKIP</a></li>
<li>bat-mtlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8948/bat-mtlp-9/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9159">i915#9159</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15306/bat-mtlp-9/igt@kms_dsc@dsc-basic.html">SKIP</a></li>
<li>bat-arls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8948/bat-arls-6/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9886">i915#9886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15306/bat-arls-6/igt@kms_dsc@dsc-basic.html">SKIP</a></li>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8948/bat-mtlp-8/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9159">i915#9159</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15306/bat-mtlp-8/igt@kms_dsc@dsc-basic.html">SKIP</a></li>
<li>bat-adls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8948/bat-adls-6/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15306/bat-adls-6/igt@kms_dsc@dsc-basic.html">SKIP</a></li>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8948/bat-arlh-3/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9886">i915#9886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15306/bat-arlh-3/igt@kms_dsc@dsc-basic.html">SKIP</a></li>
<li>bat-dg1-7:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8948/bat-dg1-7/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15306/bat-dg1-7/igt@kms_dsc@dsc-basic.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_8948 and IGTPW_15306:</p>
<h3>New IGT tests (15)</h3>
<ul>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-dp-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-dp-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.54, 0.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-dp-3:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.54, 0.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-dp-3:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.52, 0.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-vga-1:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-d-dp-3:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.52, 0.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-a-dp-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-b-dp-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.44, 0.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-b-dp-3:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.46, 0.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.29, 0.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-c-dp-3:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.45, 0.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-c-vga-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.29, 0.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-d-dp-3:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.46, 0.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-d-hdmi-a-2:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.43, 0.47] s</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8948 -&gt; IGTPW_15306</li>
<li>Linux: CI_DRM_18625 -&gt; CI_DRM_18629</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18625: 70c7b363fab8198549bb9b82134bda0f6bda9452 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_18629: 406f3120fc73b6e2bd23e1884ca5e8dc05ccf9d3 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15306: 69a9b8385ec48291d5c534d45cd570c84b490e47 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8948: 8948</p>

</body>
</html>

--===============6348265528355965466==--
