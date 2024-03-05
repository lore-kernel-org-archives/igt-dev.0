Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53206C54798
	for <igt-dev@archiver.kernel.org>; Tue,  5 Mar 2024 13:24:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6F6A10E059;
	Tue,  5 Mar 2024 13:24:57 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF09010E059;
 Tue,  5 Mar 2024 13:24:56 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5227368226688640276=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBAT=3A_failure_for_Add_xe=5Frender=5Fcopy_test?=
 =?utf-8?q?s_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 05 Mar 2024 13:24:56 -0000
Message-ID: <170964509697.524851.10466587080653815272@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240305054056.139691-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20240305054056.139691-1-zbigniew.kempczynski@intel.com>
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

--===============5227368226688640276==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add xe_render_copy tests (rev2)
URL   : https://patchwork.freedesktop.org/series/130707/
State : failure

== Summary ==

CI Bug Log - changes from IGT_7746 -> IGTPW_10777
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_10777 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_10777, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10777/index.html

Participating hosts (40 -> 38)
------------------------------

  Additional (1): bat-kbl-2 
  Missing    (3): bat-jsl-1 fi-snb-2520m fi-bsw-n3050 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_10777:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live@gt_pm:
    - bat-arls-2:         [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7746/bat-arls-2/igt@i915_selftest@live@gt_pm.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10777/bat-arls-2/igt@i915_selftest@live@gt_pm.html

  
Known issues
------------

  Here are the changes found in IGTPW_10777 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@eof:
    - fi-kbl-7567u:       [PASS][3] -> [SKIP][4] ([fdo#109271]) +3 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7746/fi-kbl-7567u/igt@fbdev@eof.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10777/fi-kbl-7567u/igt@fbdev@eof.html

  * igt@fbdev@info:
    - fi-kbl-7567u:       [PASS][5] -> [SKIP][6] ([fdo#109271] / [i915#1849])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7746/fi-kbl-7567u/igt@fbdev@info.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10777/fi-kbl-7567u/igt@fbdev@info.html
    - bat-kbl-2:          NOTRUN -> [SKIP][7] ([fdo#109271] / [i915#1849])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10777/bat-kbl-2/igt@fbdev@info.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - bat-kbl-2:          NOTRUN -> [SKIP][8] ([fdo#109271]) +39 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10777/bat-kbl-2/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@i915_selftest@live@ring_submission:
    - bat-arls-2:         [PASS][9] -> [DMESG-FAIL][10] ([i915#10262]) +27 other tests dmesg-fail
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7746/bat-arls-2/igt@i915_selftest@live@ring_submission.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10777/bat-arls-2/igt@i915_selftest@live@ring_submission.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-dp-1:
    - fi-kbl-7567u:       NOTRUN -> [SKIP][11] ([fdo#109271])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10777/fi-kbl-7567u/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-dp-1.html

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - bat-dg2-11:         [PASS][12] -> [ABORT][13] ([i915#10367])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7746/bat-dg2-11/igt@kms_pm_rpm@basic-pci-d3-state.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10777/bat-dg2-11/igt@kms_pm_rpm@basic-pci-d3-state.html

  
#### Warnings ####

  * igt@kms_chamelium_edid@dp-edid-read:
    - bat-dg2-13:         [FAIL][14] ([i915#10293]) -> [SKIP][15] ([Intel XE#484])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7746/bat-dg2-13/igt@kms_chamelium_edid@dp-edid-read.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10777/bat-dg2-13/igt@kms_chamelium_edid@dp-edid-read.html

  
  [Intel XE#484]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/484
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#10262]: https://gitlab.freedesktop.org/drm/intel/issues/10262
  [i915#10293]: https://gitlab.freedesktop.org/drm/intel/issues/10293
  [i915#10367]: https://gitlab.freedesktop.org/drm/intel/issues/10367
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7746 -> IGTPW_10777

  CI-20190529: 20190529
  CI_DRM_14388: 1d6fe19a74ebc7356b6cbed32aa1dedb215b4aff @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10777: 10777
  IGT_7746: 7746


Testlist changes
----------------

+igt@xe_render_copy@render-full
+igt@xe_render_copy@render-hstripes
+igt@xe_render_copy@render-random
+igt@xe_render_copy@render-square
+igt@xe_render_copy@render-vstripes

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10777/index.html

--===============5227368226688640276==
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
<tr><td><b>Series:</b></td><td>Add xe_render_copy tests (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/130707/">https://patchwork.freedesktop.org/series/130707/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10777/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10777/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7746 -&gt; IGTPW_10777</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_10777 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_10777, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10777/index.html</p>
<h2>Participating hosts (40 -&gt; 38)</h2>
<p>Additional (1): bat-kbl-2 <br />
  Missing    (3): bat-jsl-1 fi-snb-2520m fi-bsw-n3050 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_10777:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_selftest@live@gt_pm:<ul>
<li>bat-arls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7746/bat-arls-2/igt@i915_selftest@live@gt_pm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10777/bat-arls-2/igt@i915_selftest@live@gt_pm.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10777 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7746/fi-kbl-7567u/igt@fbdev@eof.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10777/fi-kbl-7567u/igt@fbdev@eof.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7746/fi-kbl-7567u/igt@fbdev@info.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10777/fi-kbl-7567u/igt@fbdev@info.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a>)</li>
<li>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10777/bat-kbl-2/igt@fbdev@info.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10777/bat-kbl-2/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +39 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@ring_submission:</p>
<ul>
<li>bat-arls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7746/bat-arls-2/igt@i915_selftest@live@ring_submission.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10777/bat-arls-2/igt@i915_selftest@live@ring_submission.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10262">i915#10262</a>) +27 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-dp-1:</p>
<ul>
<li>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10777/fi-kbl-7567u/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-dp-1.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7746/bat-dg2-11/igt@kms_pm_rpm@basic-pci-d3-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10777/bat-dg2-11/igt@kms_pm_rpm@basic-pci-d3-state.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10367">i915#10367</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_chamelium_edid@dp-edid-read:<ul>
<li>bat-dg2-13:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7746/bat-dg2-13/igt@kms_chamelium_edid@dp-edid-read.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10293">i915#10293</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10777/bat-dg2-13/igt@kms_chamelium_edid@dp-edid-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/484">Intel XE#484</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7746 -&gt; IGTPW_10777</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14388: 1d6fe19a74ebc7356b6cbed32aa1dedb215b4aff @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10777: 10777<br />
  IGT_7746: 7746</p>
<h2>Testlist changes</h2>
<p>+igt@xe_render_copy@render-full<br />
+igt@xe_render_copy@render-hstripes<br />
+igt@xe_render_copy@render-random<br />
+igt@xe_render_copy@render-square<br />
+igt@xe_render_copy@render-vstripes</p>

</body>
</html>

--===============5227368226688640276==--
