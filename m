Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F12FC48286
	for <igt-dev@archiver.kernel.org>; Thu,  1 Feb 2024 19:03:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0086410F2C6;
	Thu,  1 Feb 2024 19:03:45 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA9CF10F2C2;
 Thu,  1 Feb 2024 19:03:43 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5836296815791299803=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_lib/rendercopy=5Fgen9=3A_Fi?=
 =?utf-8?q?x_Xe2_missing_pixels_on_non-modulo-16_surfaces_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 01 Feb 2024 19:03:43 -0000
Message-ID: <170681422383.895526.11162031212596897433@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240201171840.412905-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20240201171840.412905-1-zbigniew.kempczynski@intel.com>
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

--===============5836296815791299803==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/rendercopy_gen9: Fix Xe2 missing pixels on non-modulo-16 surfaces (rev2)
URL   : https://patchwork.freedesktop.org/series/129417/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_14209 -> IGTPW_10628
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10628/index.html

Participating hosts (39 -> 37)
------------------------------

  Additional (1): fi-pnv-d510 
  Missing    (3): bat-mtlp-8 bat-jsl-1 fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_10628:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@gem_exec_parallel@engines@contexts:
    - {bat-arls-2}:       [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14209/bat-arls-2/igt@gem_exec_parallel@engines@contexts.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10628/bat-arls-2/igt@gem_exec_parallel@engines@contexts.html

  
Known issues
------------

  Here are the changes found in IGTPW_10628 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_lmem_swapping@basic:
    - fi-pnv-d510:        NOTRUN -> [SKIP][3] ([fdo#109271]) +31 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10628/fi-pnv-d510/igt@gem_lmem_swapping@basic.html

  * igt@i915_selftest@live@hangcheck:
    - bat-dg2-8:          [PASS][4] -> [ABORT][5] ([i915#9840])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14209/bat-dg2-8/igt@i915_selftest@live@hangcheck.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10628/bat-dg2-8/igt@i915_selftest@live@hangcheck.html

  
#### Possible fixes ####

  * igt@i915_module_load@reload:
    - fi-apl-guc:         [DMESG-WARN][6] ([i915#180] / [i915#1982] / [i915#8585]) -> [PASS][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14209/fi-apl-guc/igt@i915_module_load@reload.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10628/fi-apl-guc/igt@i915_module_load@reload.html

  * igt@i915_selftest@live@hangcheck:
    - bat-adlp-9:         [ABORT][8] ([i915#10021]) -> [PASS][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14209/bat-adlp-9/igt@i915_selftest@live@hangcheck.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10628/bat-adlp-9/igt@i915_selftest@live@hangcheck.html

  * igt@i915_selftest@live@reset:
    - fi-apl-guc:         [DMESG-WARN][10] ([i915#9730]) -> [PASS][11] +36 other tests pass
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14209/fi-apl-guc/igt@i915_selftest@live@reset.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10628/fi-apl-guc/igt@i915_selftest@live@reset.html

  * igt@kms_addfb_basic@addfb25-4-tiled:
    - fi-apl-guc:         [DMESG-WARN][12] -> [PASS][13] +40 other tests pass
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14209/fi-apl-guc/igt@kms_addfb_basic@addfb25-4-tiled.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10628/fi-apl-guc/igt@kms_addfb_basic@addfb25-4-tiled.html

  * igt@kms_flip@basic-flip-vs-dpms@c-dp1:
    - fi-apl-guc:         [DMESG-WARN][14] ([i915#180]) -> [PASS][15] +27 other tests pass
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14209/fi-apl-guc/igt@kms_flip@basic-flip-vs-dpms@c-dp1.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10628/fi-apl-guc/igt@kms_flip@basic-flip-vs-dpms@c-dp1.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1:
    - fi-apl-guc:         [DMESG-WARN][16] ([i915#180] / [i915#1982]) -> [PASS][17]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14209/fi-apl-guc/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10628/fi-apl-guc/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-1:
    - fi-apl-guc:         [DMESG-WARN][18] ([i915#180] / [i915#8585]) -> [PASS][19] +8 other tests pass
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14209/fi-apl-guc/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-1.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10628/fi-apl-guc/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-1.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#10021]: https://gitlab.freedesktop.org/drm/intel/issues/10021
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#8585]: https://gitlab.freedesktop.org/drm/intel/issues/8585
  [i915#9730]: https://gitlab.freedesktop.org/drm/intel/issues/9730
  [i915#9840]: https://gitlab.freedesktop.org/drm/intel/issues/9840


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7700 -> IGTPW_10628

  CI-20190529: 20190529
  CI_DRM_14209: 3e58a4940c44430f20cad20ead5e1b77ed209cde @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10628: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10628/index.html
  IGT_7700: 7700


Testlist changes
----------------

+igt@kms_plane@planar-pixel-format-settings
-igt@kms_plane@test-odd-size-with-yuv

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10628/index.html

--===============5836296815791299803==
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
<tr><td><b>Series:</b></td><td>lib/rendercopy_gen9: Fix Xe2 missing pixels on non-modulo-16 surfaces (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/129417/">https://patchwork.freedesktop.org/series/129417/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10628/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10628/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_14209 -&gt; IGTPW_10628</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10628/index.html</p>
<h2>Participating hosts (39 -&gt; 37)</h2>
<p>Additional (1): fi-pnv-d510 <br />
  Missing    (3): bat-mtlp-8 bat-jsl-1 fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_10628:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@gem_exec_parallel@engines@contexts:<ul>
<li>{bat-arls-2}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14209/bat-arls-2/igt@gem_exec_parallel@engines@contexts.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10628/bat-arls-2/igt@gem_exec_parallel@engines@contexts.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10628 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10628/fi-pnv-d510/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14209/bat-dg2-8/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10628/bat-dg2-8/igt@i915_selftest@live@hangcheck.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9840">i915#9840</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14209/fi-apl-guc/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8585">i915#8585</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10628/fi-apl-guc/igt@i915_module_load@reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14209/bat-adlp-9/igt@i915_selftest@live@hangcheck.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10021">i915#10021</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10628/bat-adlp-9/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@reset:</p>
<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14209/fi-apl-guc/igt@i915_selftest@live@reset.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9730">i915#9730</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10628/fi-apl-guc/igt@i915_selftest@live@reset.html">PASS</a> +36 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-4-tiled:</p>
<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14209/fi-apl-guc/igt@kms_addfb_basic@addfb25-4-tiled.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10628/fi-apl-guc/igt@kms_addfb_basic@addfb25-4-tiled.html">PASS</a> +40 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@c-dp1:</p>
<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14209/fi-apl-guc/igt@kms_flip@basic-flip-vs-dpms@c-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10628/fi-apl-guc/igt@kms_flip@basic-flip-vs-dpms@c-dp1.html">PASS</a> +27 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1:</p>
<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14209/fi-apl-guc/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10628/fi-apl-guc/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-1:</p>
<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14209/fi-apl-guc/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8585">i915#8585</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10628/fi-apl-guc/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-1.html">PASS</a> +8 other tests pass</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7700 -&gt; IGTPW_10628</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14209: 3e58a4940c44430f20cad20ead5e1b77ed209cde @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10628: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10628/index.html<br />
  IGT_7700: 7700</p>
<h2>Testlist changes</h2>
<p>+igt@kms_plane@planar-pixel-format-settings<br />
-igt@kms_plane@test-odd-size-with-yuv</p>

</body>
</html>

--===============5836296815791299803==--
