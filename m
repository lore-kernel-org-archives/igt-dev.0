Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41D16606A322
	for <igt-dev@archiver.kernel.org>; Mon, 26 Oct 2026 17:22:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBC9D10E1FD;
	Mon, 26 Oct 2026 17:22:40 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 290B910E336;
 Mon, 26 Oct 2026 17:21:47 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6769011860410635591=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_lib/igt=5Feld=3A_Avoid_as?=
 =?utf-8?q?serting_on_malformed_SAD_fields_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Chaitanya Kumar Borah" <chaitanya.kumar.borah@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 26 Oct 2026 17:21:47 -0000
Message-ID: <179303530715.71969.16114015818454357353@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261026075429.2796932-1-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20261026075429.2796932-1-chaitanya.kumar.borah@intel.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,HTML_MESSAGE,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============6769011860410635591==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/igt_eld: Avoid asserting on malformed SAD fields (rev2)
URL   : https://patchwork.freedesktop.org/series/176529/
State : success

== Summary ==

CI Bug Log - changes from IGT_9164 -> IGTPW_16046
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16046/index.html

Participating hosts (40 -> 39)
------------------------------

  Missing    (1): bat-dg2-13 

Known issues
------------

  Here are the changes found in IGTPW_16046 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_pm_rpm@basic-rte:
    - bat-rpls-4:         [DMESG-WARN][1] ([i915#13400]) -> [PASS][2] +1 other test pass
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/bat-rpls-4/igt@kms_pm_rpm@basic-rte.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16046/bat-rpls-4/igt@kms_pm_rpm@basic-rte.html

  
#### Warnings ####

  * igt@gem_huc_copy@huc-copy:
    - fi-kbl-7567u:       [SKIP][3] ([i915#2190]) -> [SKIP][4] ([i915#17456] / [i915#2190])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/fi-kbl-7567u/igt@gem_huc_copy@huc-copy.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16046/fi-kbl-7567u/igt@gem_huc_copy@huc-copy.html
    - fi-kbl-8809g:       [SKIP][5] ([i915#2190]) -> [SKIP][6] ([i915#17456] / [i915#2190])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/fi-kbl-8809g/igt@gem_huc_copy@huc-copy.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16046/fi-kbl-8809g/igt@gem_huc_copy@huc-copy.html
    - fi-kbl-x1275:       [SKIP][7] ([i915#2190]) -> [SKIP][8] ([i915#17456] / [i915#2190])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/fi-kbl-x1275/igt@gem_huc_copy@huc-copy.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16046/fi-kbl-x1275/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - fi-glk-j4005:       [SKIP][9] ([i915#4613]) -> [SKIP][10] ([i915#17503] / [i915#4613]) +3 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/fi-glk-j4005/igt@gem_lmem_swapping@parallel-random-engines.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16046/fi-glk-j4005/igt@gem_lmem_swapping@parallel-random-engines.html
    - fi-kbl-7567u:       [SKIP][11] ([i915#4613]) -> [SKIP][12] ([i915#11671] / [i915#4613]) +3 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/fi-kbl-7567u/igt@gem_lmem_swapping@parallel-random-engines.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16046/fi-kbl-7567u/igt@gem_lmem_swapping@parallel-random-engines.html
    - fi-kbl-8809g:       [SKIP][13] ([i915#4613]) -> [SKIP][14] ([i915#11671] / [i915#4613]) +3 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/fi-kbl-8809g/igt@gem_lmem_swapping@parallel-random-engines.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16046/fi-kbl-8809g/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@gem_lmem_swapping@verify-random:
    - fi-kbl-x1275:       [SKIP][15] ([i915#4613]) -> [SKIP][16] ([i915#11671] / [i915#4613]) +3 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/fi-kbl-x1275/igt@gem_lmem_swapping@verify-random.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16046/fi-kbl-x1275/igt@gem_lmem_swapping@verify-random.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:
    - fi-ivb-3770:        [SKIP][17] ([i915#17460]) -> [SKIP][18] ([i915#17460] / [i915#17461]) +1 other test skip
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/fi-ivb-3770/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16046/fi-ivb-3770/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html
    - fi-elk-e7500:       [SKIP][19] ([i915#17460]) -> [SKIP][20] ([i915#17460] / [i915#17461])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/fi-elk-e7500/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16046/fi-elk-e7500/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-vga-1:
    - fi-ilk-650:         [SKIP][21] ([i915#17460]) -> [SKIP][22] ([i915#17460] / [i915#17461]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/fi-ilk-650/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-vga-1.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16046/fi-ilk-650/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-vga-1.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-dp-1:
    - bat-apl-1:          [SKIP][23] ([i915#17460]) -> [SKIP][24] ([i915#17460] / [i915#17461]) +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/bat-apl-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-dp-1.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16046/bat-apl-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-dp-1.html

  * igt@kms_psr@psr-primary-page-flip:
    - fi-glk-j4005:       [SKIP][25] ([i915#9732]) -> [SKIP][26] ([i915#17480] / [i915#9732]) +3 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/fi-glk-j4005/igt@kms_psr@psr-primary-page-flip.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16046/fi-glk-j4005/igt@kms_psr@psr-primary-page-flip.html

  
  [i915#11671]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11671
  [i915#13400]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13400
  [i915#17456]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17456
  [i915#17460]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17460
  [i915#17461]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17461
  [i915#17480]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17480
  [i915#17503]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17503
  [i915#2190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9164 -> IGTPW_16046
  * Linux: CI_DRM_19394 -> CI_DRM_19396

  CI-20190529: 20190529
  CI_DRM_19394: d56ff005f0d16ec136ee31fe3238eb447fefdc1a @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_19396: 3543fd9d737a3f30b44d036b5de64c379d1c376f @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_16046: 16046
  IGT_9164: 9164

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16046/index.html

--===============6769011860410635591==
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
<tr><td><b>Series:</b></td><td>lib/igt_eld: Avoid asserting on malformed SAD fields (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/176529/">https://patchwork.freedesktop.org/series/176529/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16046/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16046/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_9164 -&gt; IGTPW_16046</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16046/index.html</p>
<h2>Participating hosts (40 -&gt; 39)</h2>
<p>Missing    (1): bat-dg2-13 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_16046 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_pm_rpm@basic-rte:<ul>
<li>bat-rpls-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/bat-rpls-4/igt@kms_pm_rpm@basic-rte.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13400">i915#13400</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16046/bat-rpls-4/igt@kms_pm_rpm@basic-rte.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/fi-kbl-7567u/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190">i915#2190</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16046/fi-kbl-7567u/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17456">i915#17456</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190">i915#2190</a>)</li>
<li>fi-kbl-8809g:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/fi-kbl-8809g/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190">i915#2190</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16046/fi-kbl-8809g/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17456">i915#17456</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190">i915#2190</a>)</li>
<li>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/fi-kbl-x1275/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190">i915#2190</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16046/fi-kbl-x1275/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17456">i915#17456</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>fi-glk-j4005:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/fi-glk-j4005/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16046/fi-glk-j4005/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17503">i915#17503</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/fi-kbl-7567u/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16046/fi-kbl-7567u/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11671">i915#11671</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
<li>fi-kbl-8809g:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/fi-kbl-8809g/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16046/fi-kbl-8809g/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11671">i915#11671</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random:</p>
<ul>
<li>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/fi-kbl-x1275/igt@gem_lmem_swapping@verify-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16046/fi-kbl-x1275/igt@gem_lmem_swapping@verify-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11671">i915#11671</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:</p>
<ul>
<li>fi-ivb-3770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/fi-ivb-3770/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17460">i915#17460</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16046/fi-ivb-3770/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17460">i915#17460</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17461">i915#17461</a>) +1 other test skip</li>
<li>fi-elk-e7500:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/fi-elk-e7500/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17460">i915#17460</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16046/fi-elk-e7500/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17460">i915#17460</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17461">i915#17461</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-vga-1:</p>
<ul>
<li>fi-ilk-650:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/fi-ilk-650/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-vga-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17460">i915#17460</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16046/fi-ilk-650/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-vga-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17460">i915#17460</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17461">i915#17461</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-dp-1:</p>
<ul>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/bat-apl-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-dp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17460">i915#17460</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16046/bat-apl-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-dp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17460">i915#17460</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17461">i915#17461</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>fi-glk-j4005:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9164/fi-glk-j4005/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16046/fi-glk-j4005/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17480">i915#17480</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +3 other tests skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9164 -&gt; IGTPW_16046</li>
<li>Linux: CI_DRM_19394 -&gt; CI_DRM_19396</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19394: d56ff005f0d16ec136ee31fe3238eb447fefdc1a @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_19396: 3543fd9d737a3f30b44d036b5de64c379d1c376f @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_16046: 16046<br />
  IGT_9164: 9164</p>

</body>
</html>

--===============6769011860410635591==--
