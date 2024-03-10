Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39436C54E58
	for <igt-dev@archiver.kernel.org>; Sun, 10 Mar 2024 14:56:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5934510E05C;
	Sun, 10 Mar 2024 14:56:44 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 285C610E05C;
 Sun, 10 Mar 2024 14:56:43 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1737500695615331739=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_revamp_big_joiner_test_=28r?=
 =?utf-8?q?ev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kunal Joshi" <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sun, 10 Mar 2024 14:56:43 -0000
Message-ID: <171008260316.630557.755892300008822605@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240310142721.874315-1-kunal1.joshi@intel.com>
In-Reply-To: <20240310142721.874315-1-kunal1.joshi@intel.com>
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

--===============1737500695615331739==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: revamp big joiner test (rev7)
URL   : https://patchwork.freedesktop.org/series/130572/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_14416 -> IGTPW_10799
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10799/index.html

Participating hosts (39 -> 28)
------------------------------

  Missing    (11): bat-kbl-2 fi-bsw-n3050 fi-apl-guc fi-snb-2520m fi-glk-j4005 bat-atsm-1 fi-cfl-8109u fi-pnv-d510 bat-jsl-1 bat-mtlp-8 bat-arls-3 

Known issues
------------

  Here are the changes found in IGTPW_10799 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_lmem_swapping@parallel-random-engines:
    - bat-adlm-1:         NOTRUN -> [SKIP][1] ([i915#4613]) +3 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10799/bat-adlm-1/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@gem_lmem_swapping@verify-random:
    - bat-mtlp-6:         NOTRUN -> [SKIP][2] ([i915#4613]) +3 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10799/bat-mtlp-6/igt@gem_lmem_swapping@verify-random.html

  * igt@i915_pm_rps@basic-api:
    - bat-dg2-8:          NOTRUN -> [SKIP][3] ([i915#6621])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10799/bat-dg2-8/igt@i915_pm_rps@basic-api.html
    - bat-adlm-1:         NOTRUN -> [SKIP][4] ([i915#6621])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10799/bat-adlm-1/igt@i915_pm_rps@basic-api.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][5] ([i915#6621])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10799/bat-mtlp-6/igt@i915_pm_rps@basic-api.html

  * igt@i915_selftest@live@client:
    - bat-dg2-14:         [PASS][6] -> [ABORT][7] ([i915#10366])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14416/bat-dg2-14/igt@i915_selftest@live@client.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10799/bat-dg2-14/igt@i915_selftest@live@client.html

  * igt@kms_force_connector_basic@force-load-detect:
    - bat-adlm-1:         NOTRUN -> [SKIP][8]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10799/bat-adlm-1/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - bat-mtlp-6:         NOTRUN -> [SKIP][9] ([i915#5274] / [i915#9792])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10799/bat-mtlp-6/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlm-1:         NOTRUN -> [SKIP][10] ([i915#1849] / [i915#4342])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10799/bat-adlm-1/igt@kms_frontbuffer_tracking@basic.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][11] ([i915#4342] / [i915#5354] / [i915#9792])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10799/bat-mtlp-6/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_pipe_crc_basic@hang-read-crc:
    - bat-adlm-1:         NOTRUN -> [SKIP][12] ([i915#9875] / [i915#9900]) +6 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10799/bat-adlm-1/igt@kms_pipe_crc_basic@hang-read-crc.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][13] ([i915#9792]) +7 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10799/bat-mtlp-6/igt@kms_pipe_crc_basic@hang-read-crc.html

  * igt@kms_pm_backlight@basic-brightness:
    - bat-adlm-1:         NOTRUN -> [SKIP][14] ([i915#5354])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10799/bat-adlm-1/igt@kms_pm_backlight@basic-brightness.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][15] ([i915#5354] / [i915#9792])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10799/bat-mtlp-6/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - bat-dg2-11:         [PASS][16] -> [ABORT][17] ([i915#10367])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14416/bat-dg2-11/igt@kms_pm_rpm@basic-pci-d3-state.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10799/bat-dg2-11/igt@kms_pm_rpm@basic-pci-d3-state.html

  * igt@kms_psr@psr-cursor-plane-move:
    - bat-mtlp-6:         NOTRUN -> [SKIP][18] ([i915#9673] / [i915#9732] / [i915#9792]) +3 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10799/bat-mtlp-6/igt@kms_psr@psr-cursor-plane-move.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - bat-dg2-8:          NOTRUN -> [SKIP][19] ([i915#9673] / [i915#9732]) +3 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10799/bat-dg2-8/igt@kms_psr@psr-sprite-plane-onoff.html
    - bat-adlm-1:         NOTRUN -> [SKIP][20] ([i915#9673] / [i915#9732]) +3 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10799/bat-adlm-1/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - bat-dg2-8:          NOTRUN -> [SKIP][21] ([i915#3555])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10799/bat-dg2-8/igt@kms_setmode@basic-clone-single-crtc.html
    - bat-adlm-1:         NOTRUN -> [SKIP][22] ([i915#3555])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10799/bat-adlm-1/igt@kms_setmode@basic-clone-single-crtc.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][23] ([i915#3555] / [i915#8809] / [i915#9792])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10799/bat-mtlp-6/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@prime_vgem@basic-fence-flip:
    - bat-dg2-8:          NOTRUN -> [SKIP][24] ([i915#3708])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10799/bat-dg2-8/igt@prime_vgem@basic-fence-flip.html
    - bat-adlm-1:         NOTRUN -> [SKIP][25] ([i915#3708] / [i915#9900])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10799/bat-adlm-1/igt@prime_vgem@basic-fence-flip.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][26] ([i915#3708] / [i915#9792])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10799/bat-mtlp-6/igt@prime_vgem@basic-fence-flip.html

  * igt@prime_vgem@basic-fence-mmap:
    - bat-dg2-8:          NOTRUN -> [SKIP][27] ([i915#3708] / [i915#4077]) +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10799/bat-dg2-8/igt@prime_vgem@basic-fence-mmap.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][28] ([i915#3708] / [i915#4077]) +1 other test skip
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10799/bat-mtlp-6/igt@prime_vgem@basic-fence-mmap.html

  * igt@prime_vgem@basic-write:
    - bat-dg2-8:          NOTRUN -> [SKIP][29] ([i915#3291] / [i915#3708]) +2 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10799/bat-dg2-8/igt@prime_vgem@basic-write.html
    - bat-adlm-1:         NOTRUN -> [SKIP][30] ([i915#3708]) +2 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10799/bat-adlm-1/igt@prime_vgem@basic-write.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][31] ([i915#3708]) +2 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10799/bat-mtlp-6/igt@prime_vgem@basic-write.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@gt_contexts:
    - bat-dg2-9:          [ABORT][32] ([i915#10366]) -> [PASS][33]
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14416/bat-dg2-9/igt@i915_selftest@live@gt_contexts.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10799/bat-dg2-9/igt@i915_selftest@live@gt_contexts.html

  * igt@kms_pm_rpm@basic-rte:
    - bat-dg2-8:          [ABORT][34] ([i915#10367]) -> [PASS][35]
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14416/bat-dg2-8/igt@kms_pm_rpm@basic-rte.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10799/bat-dg2-8/igt@kms_pm_rpm@basic-rte.html

  
  [i915#10366]: https://gitlab.freedesktop.org/drm/intel/issues/10366
  [i915#10367]: https://gitlab.freedesktop.org/drm/intel/issues/10367
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4342]: https://gitlab.freedesktop.org/drm/intel/issues/4342
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#5274]: https://gitlab.freedesktop.org/drm/intel/issues/5274
  [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
  [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
  [i915#8809]: https://gitlab.freedesktop.org/drm/intel/issues/8809
  [i915#9673]: https://gitlab.freedesktop.org/drm/intel/issues/9673
  [i915#9732]: https://gitlab.freedesktop.org/drm/intel/issues/9732
  [i915#9792]: https://gitlab.freedesktop.org/drm/intel/issues/9792
  [i915#9875]: https://gitlab.freedesktop.org/drm/intel/issues/9875
  [i915#9900]: https://gitlab.freedesktop.org/drm/intel/issues/9900


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7751 -> IGTPW_10799

  CI-20190529: 20190529
  CI_DRM_14416: 3fde6df89bac97416ce1c82b14237a1a67ce3285 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10799: 10799
  IGT_7751: 86173d01d4d3644237f781dc5f9890bd26c988de @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@kms_big_joiner@basic-bigjoiner
+igt@kms_big_joiner@basic-force-joiner
+igt@kms_big_joiner@invalid-modeset-bigjoiner
+igt@kms_big_joiner@invalid-modeset-force-joiner
-igt@kms_big_joiner@2x-modeset
-igt@kms_big_joiner@basic
-igt@kms_big_joiner@invalid-modeset

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10799/index.html

--===============1737500695615331739==
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
<tr><td><b>Series:</b></td><td>revamp big joiner test (rev7)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/130572/">https://patchwork.freedesktop.org/series/130572/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10799/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10799/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_14416 -&gt; IGTPW_10799</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10799/index.html</p>
<h2>Participating hosts (39 -&gt; 28)</h2>
<p>Missing    (11): bat-kbl-2 fi-bsw-n3050 fi-apl-guc fi-snb-2520m fi-glk-j4005 bat-atsm-1 fi-cfl-8109u fi-pnv-d510 bat-jsl-1 bat-mtlp-8 bat-arls-3 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10799 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>bat-adlm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10799/bat-adlm-1/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random:</p>
<ul>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10799/bat-mtlp-6/igt@gem_lmem_swapping@verify-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10799/bat-dg2-8/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6621">i915#6621</a>)</li>
<li>bat-adlm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10799/bat-adlm-1/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6621">i915#6621</a>)</li>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10799/bat-mtlp-6/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6621">i915#6621</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@client:</p>
<ul>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14416/bat-dg2-14/igt@i915_selftest@live@client.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10799/bat-dg2-14/igt@i915_selftest@live@client.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10366">i915#10366</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>bat-adlm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10799/bat-adlm-1/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10799/bat-mtlp-6/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5274">i915#5274</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9792">i915#9792</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-adlm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10799/bat-adlm-1/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4342">i915#4342</a>)</li>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10799/bat-mtlp-6/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4342">i915#4342</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9792">i915#9792</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc:</p>
<ul>
<li>bat-adlm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10799/bat-adlm-1/igt@kms_pipe_crc_basic@hang-read-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9875">i915#9875</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9900">i915#9900</a>) +6 other tests skip</li>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10799/bat-mtlp-6/igt@kms_pipe_crc_basic@hang-read-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9792">i915#9792</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>bat-adlm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10799/bat-adlm-1/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>)</li>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10799/bat-mtlp-6/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9792">i915#9792</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14416/bat-dg2-11/igt@kms_pm_rpm@basic-pci-d3-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10799/bat-dg2-11/igt@kms_pm_rpm@basic-pci-d3-state.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10367">i915#10367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10799/bat-mtlp-6/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9673">i915#9673</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9732">i915#9732</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9792">i915#9792</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10799/bat-dg2-8/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9673">i915#9673</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9732">i915#9732</a>) +3 other tests skip</li>
<li>bat-adlm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10799/bat-adlm-1/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9673">i915#9673</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9732">i915#9732</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10799/bat-dg2-8/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</li>
<li>bat-adlm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10799/bat-adlm-1/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</li>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10799/bat-mtlp-6/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8809">i915#8809</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9792">i915#9792</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10799/bat-dg2-8/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>)</li>
<li>bat-adlm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10799/bat-adlm-1/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9900">i915#9900</a>)</li>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10799/bat-mtlp-6/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9792">i915#9792</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-mmap:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10799/bat-dg2-8/igt@prime_vgem@basic-fence-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +1 other test skip</li>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10799/bat-mtlp-6/igt@prime_vgem@basic-fence-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10799/bat-dg2-8/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>) +2 other tests skip</li>
<li>bat-adlm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10799/bat-adlm-1/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>) +2 other tests skip</li>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10799/bat-mtlp-6/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>) +2 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@gt_contexts:</p>
<ul>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14416/bat-dg2-9/igt@i915_selftest@live@gt_contexts.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10366">i915#10366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10799/bat-dg2-9/igt@i915_selftest@live@gt_contexts.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-rte:</p>
<ul>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14416/bat-dg2-8/igt@kms_pm_rpm@basic-rte.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10367">i915#10367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10799/bat-dg2-8/igt@kms_pm_rpm@basic-rte.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7751 -&gt; IGTPW_10799</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14416: 3fde6df89bac97416ce1c82b14237a1a67ce3285 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10799: 10799<br />
  IGT_7751: 86173d01d4d3644237f781dc5f9890bd26c988de @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@kms_big_joiner@basic-bigjoiner<br />
+igt@kms_big_joiner@basic-force-joiner<br />
+igt@kms_big_joiner@invalid-modeset-bigjoiner<br />
+igt@kms_big_joiner@invalid-modeset-force-joiner<br />
-igt@kms_big_joiner@2x-modeset<br />
-igt@kms_big_joiner@basic<br />
-igt@kms_big_joiner@invalid-modeset</p>

</body>
</html>

--===============1737500695615331739==--
