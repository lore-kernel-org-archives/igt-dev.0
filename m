Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B600AC83013
	for <igt-dev@archiver.kernel.org>; Wed,  2 Jul 2025 09:16:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 443B010E188;
	Wed,  2 Jul 2025 09:16:39 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C8D210E188;
 Wed,  2 Jul 2025 09:16:38 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7783882930445320786=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_tests/kms=5Fcontent=5Fpro?=
 =?utf-8?q?tection=3A_Add_a_test_for_HDCP-MST_with_suspend_resume_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "B, Jeevan" <jeevan.b@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 02 Jul 2025 09:16:38 -0000
Message-ID: <175144779823.127473.1859338750452849469@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250702033750.711418-1-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20250702033750.711418-1-santhosh.reddy.guddati@intel.com>
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

--===============7783882930445320786==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_content_protection: Add a test for HDCP-MST with suspend resume (rev2)
URL   : https://patchwork.freedesktop.org/series/110262/
State : success

== Summary ==

CI Bug Log - changes from IGT_8432 -> IGTPW_13385
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13385/index.html

Participating hosts (45 -> 42)
------------------------------

  Missing    (3): bat-apl-1 fi-snb-2520m fi-pnv-d510 

Known issues
------------

  Here are the changes found in IGTPW_13385 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@eof:
    - fi-rkl-11600:       [PASS][1] -> [SKIP][2] ([i915#2582]) +3 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8432/fi-rkl-11600/igt@fbdev@eof.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13385/fi-rkl-11600/igt@fbdev@eof.html

  * igt@fbdev@info:
    - fi-rkl-11600:       [PASS][3] -> [SKIP][4] ([i915#1849] / [i915#2582])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8432/fi-rkl-11600/igt@fbdev@info.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13385/fi-rkl-11600/igt@fbdev@info.html

  * igt@i915_selftest@live:
    - bat-dg2-11:         [PASS][5] -> [DMESG-FAIL][6] ([i915#12061] / [i915#14556])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8432/bat-dg2-11/igt@i915_selftest@live.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13385/bat-dg2-11/igt@i915_selftest@live.html

  * igt@i915_selftest@live@client:
    - bat-dg2-9:          [PASS][7] -> [ABORT][8] ([i915#14201])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8432/bat-dg2-9/igt@i915_selftest@live@client.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13385/bat-dg2-9/igt@i915_selftest@live@client.html

  * igt@i915_selftest@live@workarounds:
    - bat-dg2-11:         [PASS][9] -> [DMESG-FAIL][10] ([i915#12061])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8432/bat-dg2-11/igt@i915_selftest@live@workarounds.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13385/bat-dg2-11/igt@i915_selftest@live@workarounds.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - fi-rkl-11600:       [PASS][11] -> [SKIP][12] ([i915#3637]) +3 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8432/fi-rkl-11600/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13385/fi-rkl-11600/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_frontbuffer_tracking@basic:
    - fi-rkl-11600:       [PASS][13] -> [SKIP][14] ([i915#1849] / [i915#5354])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8432/fi-rkl-11600/igt@kms_frontbuffer_tracking@basic.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13385/fi-rkl-11600/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24:
    - fi-rkl-11600:       [PASS][15] -> [SKIP][16] ([i915#11190]) +13 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8432/fi-rkl-11600/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13385/fi-rkl-11600/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html

  * igt@prime_vgem@basic-fence-flip:
    - fi-rkl-11600:       [PASS][17] -> [SKIP][18] ([i915#3708])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8432/fi-rkl-11600/igt@prime_vgem@basic-fence-flip.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13385/fi-rkl-11600/igt@prime_vgem@basic-fence-flip.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@execlists:
    - bat-dg2-14:         [ABORT][19] ([i915#14201]) -> [PASS][20] +1 other test pass
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8432/bat-dg2-14/igt@i915_selftest@live@execlists.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13385/bat-dg2-14/igt@i915_selftest@live@execlists.html

  * igt@i915_selftest@live@late_gt_pm:
    - fi-cfl-8109u:       [DMESG-WARN][21] ([i915#13735]) -> [PASS][22] +82 other tests pass
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8432/fi-cfl-8109u/igt@i915_selftest@live@late_gt_pm.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13385/fi-cfl-8109u/igt@i915_selftest@live@late_gt_pm.html

  * igt@kms_pipe_crc_basic@read-crc:
    - fi-cfl-8109u:       [DMESG-WARN][23] ([i915#13735] / [i915#13890]) -> [PASS][24] +49 other tests pass
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8432/fi-cfl-8109u/igt@kms_pipe_crc_basic@read-crc.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13385/fi-cfl-8109u/igt@kms_pipe_crc_basic@read-crc.html

  
#### Warnings ####

  * igt@i915_selftest@live:
    - bat-dg2-9:          [DMESG-FAIL][25] ([i915#12061]) -> [ABORT][26] ([i915#12061])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8432/bat-dg2-9/igt@i915_selftest@live.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13385/bat-dg2-9/igt@i915_selftest@live.html
    - bat-atsm-1:         [DMESG-FAIL][27] ([i915#12061] / [i915#14204]) -> [DMESG-FAIL][28] ([i915#12061] / [i915#13929])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8432/bat-atsm-1/igt@i915_selftest@live.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13385/bat-atsm-1/igt@i915_selftest@live.html

  * igt@i915_selftest@live@mman:
    - bat-atsm-1:         [DMESG-FAIL][29] ([i915#14204]) -> [DMESG-FAIL][30] ([i915#13929])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8432/bat-atsm-1/igt@i915_selftest@live@mman.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13385/bat-atsm-1/igt@i915_selftest@live@mman.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - fi-rkl-11600:       [SKIP][31] ([i915#4103]) -> [SKIP][32] ([i915#11190]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8432/fi-rkl-11600/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13385/fi-rkl-11600/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_dsc@dsc-basic:
    - fi-rkl-11600:       [SKIP][33] ([i915#3555] / [i915#3840]) -> [SKIP][34] ([i915#11190])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8432/fi-rkl-11600/igt@kms_dsc@dsc-basic.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13385/fi-rkl-11600/igt@kms_dsc@dsc-basic.html

  
  [i915#11190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#13735]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735
  [i915#13890]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13890
  [i915#13929]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13929
  [i915#14201]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14201
  [i915#14204]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14204
  [i915#14556]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14556
  [i915#1849]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849
  [i915#2582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
  [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
  [i915#3840]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840
  [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8432 -> IGTPW_13385
  * Linux: CI_DRM_16777 -> CI_DRM_16785

  CI-20190529: 20190529
  CI_DRM_16777: d9007d535ea106181346f9988c97aa73a9cdfb86 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_16785: 149b15e02e6496a37621cd5bf8a28f7d8c1869cd @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_13385: 13385
  IGT_8432: 4871829d8b7117553eb2dc1bdb9a0d18de428a98 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13385/index.html

--===============7783882930445320786==
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
<tr><td><b>Series:</b></td><td>tests/kms_content_protection: Add a test for HDCP-MST with suspend resume (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/110262/">https://patchwork.freedesktop.org/series/110262/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13385/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13385/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8432 -&gt; IGTPW_13385</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13385/index.html</p>
<h2>Participating hosts (45 -&gt; 42)</h2>
<p>Missing    (3): bat-apl-1 fi-snb-2520m fi-pnv-d510 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_13385 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8432/fi-rkl-11600/igt@fbdev@eof.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13385/fi-rkl-11600/igt@fbdev@eof.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582">i915#2582</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8432/fi-rkl-11600/igt@fbdev@info.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13385/fi-rkl-11600/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582">i915#2582</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8432/bat-dg2-11/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13385/bat-dg2-11/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14556">i915#14556</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@client:</p>
<ul>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8432/bat-dg2-9/igt@i915_selftest@live@client.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13385/bat-dg2-9/igt@i915_selftest@live@client.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14201">i915#14201</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8432/bat-dg2-11/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13385/bat-dg2-11/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8432/fi-rkl-11600/igt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13385/fi-rkl-11600/igt@kms_flip@basic-flip-vs-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8432/fi-rkl-11600/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13385/fi-rkl-11600/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24:</p>
<ul>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8432/fi-rkl-11600/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13385/fi-rkl-11600/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190">i915#11190</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8432/fi-rkl-11600/igt@prime_vgem@basic-fence-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13385/fi-rkl-11600/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8432/bat-dg2-14/igt@i915_selftest@live@execlists.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14201">i915#14201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13385/bat-dg2-14/igt@i915_selftest@live@execlists.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@late_gt_pm:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8432/fi-cfl-8109u/igt@i915_selftest@live@late_gt_pm.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735">i915#13735</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13385/fi-cfl-8109u/igt@i915_selftest@live@late_gt_pm.html">PASS</a> +82 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8432/fi-cfl-8109u/igt@kms_pipe_crc_basic@read-crc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735">i915#13735</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13890">i915#13890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13385/fi-cfl-8109u/igt@kms_pipe_crc_basic@read-crc.html">PASS</a> +49 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8432/bat-dg2-9/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13385/bat-dg2-9/igt@i915_selftest@live.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>)</li>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8432/bat-atsm-1/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14204">i915#14204</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13385/bat-atsm-1/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13929">i915#13929</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@mman:</p>
<ul>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8432/bat-atsm-1/igt@i915_selftest@live@mman.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14204">i915#14204</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13385/bat-atsm-1/igt@i915_selftest@live@mman.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13929">i915#13929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8432/fi-rkl-11600/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13385/fi-rkl-11600/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190">i915#11190</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8432/fi-rkl-11600/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13385/fi-rkl-11600/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190">i915#11190</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8432 -&gt; IGTPW_13385</li>
<li>Linux: CI_DRM_16777 -&gt; CI_DRM_16785</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_16777: d9007d535ea106181346f9988c97aa73a9cdfb86 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_16785: 149b15e02e6496a37621cd5bf8a28f7d8c1869cd @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_13385: 13385<br />
  IGT_8432: 4871829d8b7117553eb2dc1bdb9a0d18de428a98 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============7783882930445320786==--
