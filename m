Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13849D41C2F
	for <igt-dev@archiver.kernel.org>; Wed, 13 Nov 2024 10:30:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67D4810E6C9;
	Wed, 13 Nov 2024 10:30:02 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D3B08949C;
 Wed, 13 Nov 2024 10:29:55 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0027441136855145280=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBAT=3A_failure_for_series_starting_with_=5Bi-g?=
 =?utf-8?q?-t=2C1/3=5D_drm-uapi-experimental/xe=5Fdrm=5Feudebug=3A_Sync_afte?=
 =?utf-8?q?r_exec=5Fqueue_placement_event_addition=2E?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dominik Grzegorzek" <dominik.grzegorzek@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 13 Nov 2024 10:29:55 -0000
Message-ID: <173149379511.3508171.10485236376693076837@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241113085155.209198-1-dominik.grzegorzek@intel.com>
In-Reply-To: <20241113085155.209198-1-dominik.grzegorzek@intel.com>
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

--===============0027441136855145280==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,1/3] drm-uapi-experimental/xe_drm_eudebug: Sync after exec_queue placement event addition.
URL   : https://patchwork.freedesktop.org/series/141273/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8105 -> IGTPW_12085
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12085 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12085, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12085/index.html

Participating hosts (45 -> 45)
------------------------------

  Additional (1): fi-blb-e6850 
  Missing    (1): fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12085:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live@vma:
    - bat-jsl-3:          [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8105/bat-jsl-3/igt@i915_selftest@live@vma.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12085/bat-jsl-3/igt@i915_selftest@live@vma.html

  
Known issues
------------

  Here are the changes found in IGTPW_12085 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_pm_rpm@module-reload:
    - fi-blb-e6850:       NOTRUN -> [SKIP][3] +33 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12085/fi-blb-e6850/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live:
    - bat-mtlp-8:         [PASS][4] -> [ABORT][5] ([i915#12061]) +1 other test abort
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8105/bat-mtlp-8/igt@i915_selftest@live.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12085/bat-mtlp-8/igt@i915_selftest@live.html
    - bat-jsl-3:          [PASS][6] -> [DMESG-WARN][7] ([i915#12668])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8105/bat-jsl-3/igt@i915_selftest@live.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12085/bat-jsl-3/igt@i915_selftest@live.html

  
#### Possible fixes ####

  * igt@fbdev@eof:
    - bat-arls-5:         [SKIP][8] ([i915#11191] / [i915#11345]) -> [PASS][9] +3 other tests pass
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8105/bat-arls-5/igt@fbdev@eof.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12085/bat-arls-5/igt@fbdev@eof.html

  * igt@fbdev@info:
    - bat-arls-5:         [SKIP][10] ([i915#1849]) -> [PASS][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8105/bat-arls-5/igt@fbdev@info.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12085/bat-arls-5/igt@fbdev@info.html

  * igt@i915_selftest@live:
    - bat-arlh-3:         [ABORT][12] ([i915#10341]) -> [PASS][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8105/bat-arlh-3/igt@i915_selftest@live.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12085/bat-arlh-3/igt@i915_selftest@live.html

  * igt@i915_selftest@live@execlists:
    - {bat-arls-6}:       [DMESG-WARN][14] ([i915#10341]) -> [PASS][15] +5 other tests pass
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8105/bat-arls-6/igt@i915_selftest@live@execlists.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12085/bat-arls-6/igt@i915_selftest@live@execlists.html

  * igt@i915_selftest@live@gem_contexts:
    - {bat-arls-6}:       [DMESG-WARN][16] ([i915#12727]) -> [PASS][17] +32 other tests pass
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8105/bat-arls-6/igt@i915_selftest@live@gem_contexts.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12085/bat-arls-6/igt@i915_selftest@live@gem_contexts.html

  * igt@i915_selftest@live@gt_heartbeat:
    - bat-arls-5:         [DMESG-WARN][18] ([i915#12727]) -> [PASS][19] +33 other tests pass
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8105/bat-arls-5/igt@i915_selftest@live@gt_heartbeat.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12085/bat-arls-5/igt@i915_selftest@live@gt_heartbeat.html

  * igt@i915_selftest@live@gt_mocs:
    - {bat-arls-6}:       [DMESG-WARN][20] ([i915#10341] / [i915#12727]) -> [PASS][21] +1 other test pass
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8105/bat-arls-6/igt@i915_selftest@live@gt_mocs.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12085/bat-arls-6/igt@i915_selftest@live@gt_mocs.html

  * igt@i915_selftest@live@sanitycheck:
    - bat-arls-5:         [DMESG-WARN][22] ([i915#10341]) -> [PASS][23] +5 other tests pass
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8105/bat-arls-5/igt@i915_selftest@live@sanitycheck.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12085/bat-arls-5/igt@i915_selftest@live@sanitycheck.html

  * igt@i915_selftest@live@workarounds:
    - bat-arlh-3:         [ABORT][24] ([i915#12061]) -> [PASS][25]
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8105/bat-arlh-3/igt@i915_selftest@live@workarounds.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12085/bat-arlh-3/igt@i915_selftest@live@workarounds.html
    - bat-arls-5:         [DMESG-WARN][26] ([i915#10341] / [i915#12727]) -> [PASS][27] +1 other test pass
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8105/bat-arls-5/igt@i915_selftest@live@workarounds.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12085/bat-arls-5/igt@i915_selftest@live@workarounds.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - bat-arls-5:         [SKIP][28] ([i915#3637]) -> [PASS][29] +3 other tests pass
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8105/bat-arls-5/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12085/bat-arls-5/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-arls-5:         [SKIP][30] ([i915#4342] / [i915#5354]) -> [PASS][31]
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8105/bat-arls-5/igt@kms_frontbuffer_tracking@basic.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12085/bat-arls-5/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_pipe_crc_basic@nonblocking-crc:
    - bat-arls-5:         [SKIP][32] ([i915#12732]) -> [PASS][33] +13 other tests pass
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8105/bat-arls-5/igt@kms_pipe_crc_basic@nonblocking-crc.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12085/bat-arls-5/igt@kms_pipe_crc_basic@nonblocking-crc.html

  * igt@prime_vgem@basic-fence-flip:
    - bat-arls-5:         [SKIP][34] ([i915#12732] / [i915#3708]) -> [PASS][35]
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8105/bat-arls-5/igt@prime_vgem@basic-fence-flip.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12085/bat-arls-5/igt@prime_vgem@basic-fence-flip.html

  
#### Warnings ####

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - bat-arls-5:         [SKIP][36] ([i915#12732]) -> [SKIP][37] ([i915#10202]) +1 other test skip
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8105/bat-arls-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12085/bat-arls-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_dsc@dsc-basic:
    - bat-arls-5:         [SKIP][38] ([i915#12732]) -> [SKIP][39] ([i915#9886])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8105/bat-arls-5/igt@kms_dsc@dsc-basic.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12085/bat-arls-5/igt@kms_dsc@dsc-basic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10202]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10202
  [i915#10341]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10341
  [i915#11191]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11191
  [i915#11345]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11345
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12668]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12668
  [i915#12727]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12727
  [i915#12732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12732
  [i915#1849]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849
  [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
  [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
  [i915#4342]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4342
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#9886]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9886


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8105 -> IGTPW_12085
  * Linux: CI_DRM_15686 -> CI_DRM_15687

  CI-20190529: 20190529
  CI_DRM_15686: 26f5fe99791def93b32e27e79e71dbd0666c117b @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_15687: cf3872e462498611b17e5f80f0b1d0900580da20 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12085: 12085
  IGT_8105: 8105

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12085/index.html

--===============0027441136855145280==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,1/3] drm-uapi-experimental/xe_drm_eudebug: Sync after exec_queue placement event addition.</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/141273/">https://patchwork.freedesktop.org/series/141273/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12085/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12085/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8105 -&gt; IGTPW_12085</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_12085 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_12085, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12085/index.html</p>
<h2>Participating hosts (45 -&gt; 45)</h2>
<p>Additional (1): fi-blb-e6850 <br />
  Missing    (1): fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_12085:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_selftest@live@vma:<ul>
<li>bat-jsl-3:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8105/bat-jsl-3/igt@i915_selftest@live@vma.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12085/bat-jsl-3/igt@i915_selftest@live@vma.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_12085 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12085/fi-blb-e6850/igt@i915_pm_rpm@module-reload.html">SKIP</a> +33 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8105/bat-mtlp-8/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12085/bat-mtlp-8/igt@i915_selftest@live.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test abort</li>
<li>bat-jsl-3:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8105/bat-jsl-3/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12085/bat-jsl-3/igt@i915_selftest@live.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12668">i915#12668</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8105/bat-arls-5/igt@fbdev@eof.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11191">i915#11191</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11345">i915#11345</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12085/bat-arls-5/igt@fbdev@eof.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8105/bat-arls-5/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12085/bat-arls-5/igt@fbdev@info.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8105/bat-arlh-3/igt@i915_selftest@live.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10341">i915#10341</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12085/bat-arlh-3/igt@i915_selftest@live.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>{bat-arls-6}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8105/bat-arls-6/igt@i915_selftest@live@execlists.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10341">i915#10341</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12085/bat-arls-6/igt@i915_selftest@live@execlists.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gem_contexts:</p>
<ul>
<li>{bat-arls-6}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8105/bat-arls-6/igt@i915_selftest@live@gem_contexts.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12727">i915#12727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12085/bat-arls-6/igt@i915_selftest@live@gem_contexts.html">PASS</a> +32 other tests pass</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8105/bat-arls-5/igt@i915_selftest@live@gt_heartbeat.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12727">i915#12727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12085/bat-arls-5/igt@i915_selftest@live@gt_heartbeat.html">PASS</a> +33 other tests pass</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_mocs:</p>
<ul>
<li>{bat-arls-6}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8105/bat-arls-6/igt@i915_selftest@live@gt_mocs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10341">i915#10341</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12727">i915#12727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12085/bat-arls-6/igt@i915_selftest@live@gt_mocs.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@sanitycheck:</p>
<ul>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8105/bat-arls-5/igt@i915_selftest@live@sanitycheck.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10341">i915#10341</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12085/bat-arls-5/igt@i915_selftest@live@sanitycheck.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8105/bat-arlh-3/igt@i915_selftest@live@workarounds.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12085/bat-arlh-3/igt@i915_selftest@live@workarounds.html">PASS</a></li>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8105/bat-arls-5/igt@i915_selftest@live@workarounds.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10341">i915#10341</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12727">i915#12727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12085/bat-arls-5/igt@i915_selftest@live@workarounds.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8105/bat-arls-5/igt@kms_flip@basic-flip-vs-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12085/bat-arls-5/igt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8105/bat-arls-5/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4342">i915#4342</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12085/bat-arls-5/igt@kms_frontbuffer_tracking@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc:</p>
<ul>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8105/bat-arls-5/igt@kms_pipe_crc_basic@nonblocking-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12732">i915#12732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12085/bat-arls-5/igt@kms_pipe_crc_basic@nonblocking-crc.html">PASS</a> +13 other tests pass</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8105/bat-arls-5/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12732">i915#12732</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12085/bat-arls-5/igt@prime_vgem@basic-fence-flip.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8105/bat-arls-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12732">i915#12732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12085/bat-arls-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10202">i915#10202</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8105/bat-arls-5/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12732">i915#12732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12085/bat-arls-5/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9886">i915#9886</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8105 -&gt; IGTPW_12085</li>
<li>Linux: CI_DRM_15686 -&gt; CI_DRM_15687</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_15686: 26f5fe99791def93b32e27e79e71dbd0666c117b @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_15687: cf3872e462498611b17e5f80f0b1d0900580da20 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_12085: 12085<br />
  IGT_8105: 8105</p>

</body>
</html>

--===============0027441136855145280==--
