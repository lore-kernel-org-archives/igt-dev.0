Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79935C02198
	for <igt-dev@archiver.kernel.org>; Tue, 18 Feb 2025 14:05:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C0F210E071;
	Tue, 18 Feb 2025 14:05:38 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5CF910E071;
 Tue, 18 Feb 2025 14:05:36 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2458255595441628571=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_tests/intel/kms=5Fdsc=3A_?=
 =?utf-8?q?Store_valid_DSC_outputs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Swati Sharma" <swati2.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 18 Feb 2025 14:05:36 -0000
Message-ID: <173988753673.3581391.14190537609410346016@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250218130337.431624-1-swati2.sharma@intel.com>
In-Reply-To: <20250218130337.431624-1-swati2.sharma@intel.com>
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

--===============2458255595441628571==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/kms_dsc: Store valid DSC outputs
URL   : https://patchwork.freedesktop.org/series/145015/
State : success

== Summary ==

CI Bug Log - changes from IGT_8236 -> IGTPW_12623
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with IGTPW_12623 need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12623, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12623/index.html

Participating hosts (42 -> 41)
------------------------------

  Additional (1): fi-pnv-d510 
  Missing    (2): fi-glk-j4005 fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12623:

### IGT changes ###

#### Warnings ####

  * igt@kms_dsc@dsc-basic:
    - bat-rpls-4:         [SKIP][1] ([i915#3555] / [i915#3840] / [i915#9886]) -> [SKIP][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8236/bat-rpls-4/igt@kms_dsc@dsc-basic.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12623/bat-rpls-4/igt@kms_dsc@dsc-basic.html
    - bat-twl-1:          [SKIP][3] ([i915#9886]) -> [SKIP][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8236/bat-twl-1/igt@kms_dsc@dsc-basic.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12623/bat-twl-1/igt@kms_dsc@dsc-basic.html
    - bat-arls-5:         [SKIP][5] ([i915#9886]) -> [SKIP][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8236/bat-arls-5/igt@kms_dsc@dsc-basic.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12623/bat-arls-5/igt@kms_dsc@dsc-basic.html
    - bat-rplp-1:         [SKIP][7] ([i915#3555] / [i915#3840]) -> [SKIP][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8236/bat-rplp-1/igt@kms_dsc@dsc-basic.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12623/bat-rplp-1/igt@kms_dsc@dsc-basic.html
    - fi-rkl-11600:       [SKIP][9] ([i915#3555] / [i915#3840]) -> [SKIP][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8236/fi-rkl-11600/igt@kms_dsc@dsc-basic.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12623/fi-rkl-11600/igt@kms_dsc@dsc-basic.html
    - fi-tgl-1115g4:      [SKIP][11] ([i915#3555] / [i915#3840]) -> [SKIP][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8236/fi-tgl-1115g4/igt@kms_dsc@dsc-basic.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12623/fi-tgl-1115g4/igt@kms_dsc@dsc-basic.html
    - bat-adlp-6:         [SKIP][13] ([i915#3555] / [i915#3840]) -> [SKIP][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8236/bat-adlp-6/igt@kms_dsc@dsc-basic.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12623/bat-adlp-6/igt@kms_dsc@dsc-basic.html
    - bat-jsl-3:          [SKIP][15] ([i915#3555] / [i915#9886]) -> [SKIP][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8236/bat-jsl-3/igt@kms_dsc@dsc-basic.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12623/bat-jsl-3/igt@kms_dsc@dsc-basic.html
    - bat-twl-2:          [SKIP][17] ([i915#9886]) -> [SKIP][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8236/bat-twl-2/igt@kms_dsc@dsc-basic.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12623/bat-twl-2/igt@kms_dsc@dsc-basic.html
    - bat-dg2-11:         [SKIP][19] ([i915#3555] / [i915#3840]) -> [SKIP][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8236/bat-dg2-11/igt@kms_dsc@dsc-basic.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12623/bat-dg2-11/igt@kms_dsc@dsc-basic.html
    - bat-dg2-14:         [SKIP][21] ([i915#3555] / [i915#3840]) -> [SKIP][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8236/bat-dg2-14/igt@kms_dsc@dsc-basic.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12623/bat-dg2-14/igt@kms_dsc@dsc-basic.html
    - bat-mtlp-9:         [SKIP][23] ([i915#3555] / [i915#3840] / [i915#9159]) -> [SKIP][24]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8236/bat-mtlp-9/igt@kms_dsc@dsc-basic.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12623/bat-mtlp-9/igt@kms_dsc@dsc-basic.html
    - bat-arls-6:         [SKIP][25] ([i915#9886]) -> [SKIP][26]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8236/bat-arls-6/igt@kms_dsc@dsc-basic.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12623/bat-arls-6/igt@kms_dsc@dsc-basic.html
    - bat-adls-6:         [SKIP][27] ([i915#3555] / [i915#3840]) -> [SKIP][28]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8236/bat-adls-6/igt@kms_dsc@dsc-basic.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12623/bat-adls-6/igt@kms_dsc@dsc-basic.html
    - bat-jsl-1:          [SKIP][29] ([i915#3555] / [i915#9886]) -> [SKIP][30]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8236/bat-jsl-1/igt@kms_dsc@dsc-basic.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12623/bat-jsl-1/igt@kms_dsc@dsc-basic.html
    - bat-arlh-3:         [SKIP][31] ([i915#9886]) -> [SKIP][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8236/bat-arlh-3/igt@kms_dsc@dsc-basic.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12623/bat-arlh-3/igt@kms_dsc@dsc-basic.html
    - bat-dg1-7:          [SKIP][33] ([i915#3555] / [i915#3840]) -> [SKIP][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8236/bat-dg1-7/igt@kms_dsc@dsc-basic.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12623/bat-dg1-7/igt@kms_dsc@dsc-basic.html
    - bat-adlp-9:         [SKIP][35] ([i915#3555] / [i915#3840]) -> [SKIP][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8236/bat-adlp-9/igt@kms_dsc@dsc-basic.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12623/bat-adlp-9/igt@kms_dsc@dsc-basic.html

  
Known issues
------------

  Here are the changes found in IGTPW_12623 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@dmabuf@all-tests:
    - bat-apl-1:          [PASS][37] -> [INCOMPLETE][38] ([i915#12904]) +1 other test incomplete
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8236/bat-apl-1/igt@dmabuf@all-tests.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12623/bat-apl-1/igt@dmabuf@all-tests.html

  * igt@kms_psr@psr-primary-mmap-gtt:
    - fi-pnv-d510:        NOTRUN -> [SKIP][39] +33 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12623/fi-pnv-d510/igt@kms_psr@psr-primary-mmap-gtt.html

  
#### Possible fixes ####

  * igt@i915_selftest@live:
    - bat-adlp-9:         [ABORT][40] -> [PASS][41]
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8236/bat-adlp-9/igt@i915_selftest@live.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12623/bat-adlp-9/igt@i915_selftest@live.html
    - bat-jsl-3:          [INCOMPLETE][42] ([i915#12445] / [i915#13241]) -> [PASS][43]
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8236/bat-jsl-3/igt@i915_selftest@live.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12623/bat-jsl-3/igt@i915_selftest@live.html

  * igt@i915_selftest@live@guc:
    - bat-adlp-9:         [ABORT][44] ([i915#13696]) -> [PASS][45]
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8236/bat-adlp-9/igt@i915_selftest@live@guc.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12623/bat-adlp-9/igt@i915_selftest@live@guc.html

  * igt@i915_selftest@live@workarounds:
    - bat-arlh-2:         [DMESG-FAIL][46] ([i915#12061]) -> [PASS][47] +1 other test pass
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8236/bat-arlh-2/igt@i915_selftest@live@workarounds.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12623/bat-arlh-2/igt@i915_selftest@live@workarounds.html
    - bat-mtlp-6:         [DMESG-FAIL][48] ([i915#12061]) -> [PASS][49] +1 other test pass
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8236/bat-mtlp-6/igt@i915_selftest@live@workarounds.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12623/bat-mtlp-6/igt@i915_selftest@live@workarounds.html
    - bat-arls-6:         [DMESG-FAIL][50] ([i915#12061]) -> [PASS][51] +1 other test pass
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8236/bat-arls-6/igt@i915_selftest@live@workarounds.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12623/bat-arls-6/igt@i915_selftest@live@workarounds.html

  
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12445]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12445
  [i915#12904]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12904
  [i915#13241]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13241
  [i915#13696]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13696
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#3840]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840
  [i915#9159]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9159
  [i915#9886]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9886


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8236 -> IGTPW_12623

  CI-20190529: 20190529
  CI_DRM_16149: 4587c05996666a92af63f86ba410bae1dc940794 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12623: a149c183c629ca236b4515b474aa2b84ca86c7de @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8236: 8236

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12623/index.html

--===============2458255595441628571==
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
<tr><td><b>Series:</b></td><td>tests/intel/kms_dsc: Store valid DSC outputs</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/145015/">https://patchwork.freedesktop.org/series/145015/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12623/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12623/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8236 -&gt; IGTPW_12623</h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with IGTPW_12623 need to be verified<br />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_12623, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12623/index.html</p>
<h2>Participating hosts (42 -&gt; 41)</h2>
<p>Additional (1): fi-pnv-d510 <br />
  Missing    (2): fi-glk-j4005 fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_12623:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>igt@kms_dsc@dsc-basic:<ul>
<li>bat-rpls-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8236/bat-rpls-4/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9886">i915#9886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12623/bat-rpls-4/igt@kms_dsc@dsc-basic.html">SKIP</a></li>
<li>bat-twl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8236/bat-twl-1/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9886">i915#9886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12623/bat-twl-1/igt@kms_dsc@dsc-basic.html">SKIP</a></li>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8236/bat-arls-5/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9886">i915#9886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12623/bat-arls-5/igt@kms_dsc@dsc-basic.html">SKIP</a></li>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8236/bat-rplp-1/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12623/bat-rplp-1/igt@kms_dsc@dsc-basic.html">SKIP</a></li>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8236/fi-rkl-11600/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12623/fi-rkl-11600/igt@kms_dsc@dsc-basic.html">SKIP</a></li>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8236/fi-tgl-1115g4/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12623/fi-tgl-1115g4/igt@kms_dsc@dsc-basic.html">SKIP</a></li>
<li>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8236/bat-adlp-6/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12623/bat-adlp-6/igt@kms_dsc@dsc-basic.html">SKIP</a></li>
<li>bat-jsl-3:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8236/bat-jsl-3/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9886">i915#9886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12623/bat-jsl-3/igt@kms_dsc@dsc-basic.html">SKIP</a></li>
<li>bat-twl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8236/bat-twl-2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9886">i915#9886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12623/bat-twl-2/igt@kms_dsc@dsc-basic.html">SKIP</a></li>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8236/bat-dg2-11/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12623/bat-dg2-11/igt@kms_dsc@dsc-basic.html">SKIP</a></li>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8236/bat-dg2-14/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12623/bat-dg2-14/igt@kms_dsc@dsc-basic.html">SKIP</a></li>
<li>bat-mtlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8236/bat-mtlp-9/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9159">i915#9159</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12623/bat-mtlp-9/igt@kms_dsc@dsc-basic.html">SKIP</a></li>
<li>bat-arls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8236/bat-arls-6/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9886">i915#9886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12623/bat-arls-6/igt@kms_dsc@dsc-basic.html">SKIP</a></li>
<li>bat-adls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8236/bat-adls-6/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12623/bat-adls-6/igt@kms_dsc@dsc-basic.html">SKIP</a></li>
<li>bat-jsl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8236/bat-jsl-1/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9886">i915#9886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12623/bat-jsl-1/igt@kms_dsc@dsc-basic.html">SKIP</a></li>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8236/bat-arlh-3/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9886">i915#9886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12623/bat-arlh-3/igt@kms_dsc@dsc-basic.html">SKIP</a></li>
<li>bat-dg1-7:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8236/bat-dg1-7/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12623/bat-dg1-7/igt@kms_dsc@dsc-basic.html">SKIP</a></li>
<li>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8236/bat-adlp-9/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12623/bat-adlp-9/igt@kms_dsc@dsc-basic.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_12623 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@dmabuf@all-tests:</p>
<ul>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8236/bat-apl-1/igt@dmabuf@all-tests.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12623/bat-apl-1/igt@dmabuf@all-tests.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12904">i915#12904</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-mmap-gtt:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12623/fi-pnv-d510/igt@kms_psr@psr-primary-mmap-gtt.html">SKIP</a> +33 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8236/bat-adlp-9/igt@i915_selftest@live.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12623/bat-adlp-9/igt@i915_selftest@live.html">PASS</a></li>
<li>bat-jsl-3:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8236/bat-jsl-3/igt@i915_selftest@live.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12445">i915#12445</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13241">i915#13241</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12623/bat-jsl-3/igt@i915_selftest@live.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@guc:</p>
<ul>
<li>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8236/bat-adlp-9/igt@i915_selftest@live@guc.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13696">i915#13696</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12623/bat-adlp-9/igt@i915_selftest@live@guc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-arlh-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8236/bat-arlh-2/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12623/bat-arlh-2/igt@i915_selftest@live@workarounds.html">PASS</a> +1 other test pass</li>
<li>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8236/bat-mtlp-6/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12623/bat-mtlp-6/igt@i915_selftest@live@workarounds.html">PASS</a> +1 other test pass</li>
<li>bat-arls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8236/bat-arls-6/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12623/bat-arls-6/igt@i915_selftest@live@workarounds.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8236 -&gt; IGTPW_12623</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_16149: 4587c05996666a92af63f86ba410bae1dc940794 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_12623: a149c183c629ca236b4515b474aa2b84ca86c7de @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8236: 8236</p>

</body>
</html>

--===============2458255595441628571==--
