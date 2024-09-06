Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CAA2CE7AA6
	for <igt-dev@archiver.kernel.org>; Fri,  6 Sep 2024 02:59:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2D6A10E8FF;
	Fri,  6 Sep 2024 02:59:08 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E887010E8A5;
 Fri,  6 Sep 2024 02:59:07 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4498247579981134025=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBAT=3A_failure_for_tests/amdgpu=3A_fix_concurr?=
 =?utf-8?q?ent_queue_test_issue_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jesse.zhang@amd.com" <jesse.zhang@amd.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 06 Sep 2024 02:59:07 -0000
Message-ID: <172559154794.952625.15339110407292379997@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240906021334.1085959-1-jesse.zhang@amd.com>
In-Reply-To: <20240906021334.1085959-1-jesse.zhang@amd.com>
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

--===============4498247579981134025==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/amdgpu: fix concurrent queue test issue (rev2)
URL   : https://patchwork.freedesktop.org/series/138238/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8007 -> IGTPW_11709
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_11709 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_11709, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11709/index.html

Participating hosts (42 -> 39)
------------------------------

  Additional (1): bat-arlh-3 
  Missing    (4): bat-dg2-11 fi-kbl-8809g fi-snb-2520m fi-bsw-n3050 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_11709:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live:
    - bat-mtlp-8:         [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8007/bat-mtlp-8/igt@i915_selftest@live.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11709/bat-mtlp-8/igt@i915_selftest@live.html
    - bat-arlh-2:         [PASS][3] -> [ABORT][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8007/bat-arlh-2/igt@i915_selftest@live.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11709/bat-arlh-2/igt@i915_selftest@live.html

  
Known issues
------------

  Here are the changes found in IGTPW_11709 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@info:
    - bat-arls-1:         [PASS][5] -> [DMESG-WARN][6] ([i915#12102])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8007/bat-arls-1/igt@fbdev@info.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11709/bat-arls-1/igt@fbdev@info.html

  * igt@i915_selftest@live:
    - bat-arls-5:         [PASS][7] -> [DMESG-FAIL][8] ([i915#10341])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8007/bat-arls-5/igt@i915_selftest@live.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11709/bat-arls-5/igt@i915_selftest@live.html

  * igt@i915_selftest@live@hangcheck:
    - bat-arls-5:         [PASS][9] -> [DMESG-FAIL][10] ([i915#9500])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8007/bat-arls-5/igt@i915_selftest@live@hangcheck.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11709/bat-arls-5/igt@i915_selftest@live@hangcheck.html

  * igt@i915_selftest@live@workarounds:
    - bat-arlh-2:         [PASS][11] -> [ABORT][12] ([i915#12061])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8007/bat-arlh-2/igt@i915_selftest@live@workarounds.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11709/bat-arlh-2/igt@i915_selftest@live@workarounds.html
    - bat-mtlp-8:         [PASS][13] -> [ABORT][14] ([i915#12061])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8007/bat-mtlp-8/igt@i915_selftest@live@workarounds.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11709/bat-mtlp-8/igt@i915_selftest@live@workarounds.html

  
#### Possible fixes ####

  * igt@fbdev@read:
    - bat-arls-1:         [DMESG-WARN][15] ([i915#12102]) -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8007/bat-arls-1/igt@fbdev@read.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11709/bat-arls-1/igt@fbdev@read.html

  * igt@i915_module_load@reload:
    - fi-kbl-7567u:       [DMESG-WARN][17] ([i915#180] / [i915#1982] / [i915#9925]) -> [PASS][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8007/fi-kbl-7567u/igt@i915_module_load@reload.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11709/fi-kbl-7567u/igt@i915_module_load@reload.html
    - bat-apl-1:          [DMESG-WARN][19] ([i915#180] / [i915#1982]) -> [PASS][20] +5 other tests pass
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8007/bat-apl-1/igt@i915_module_load@reload.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11709/bat-apl-1/igt@i915_module_load@reload.html

  * igt@i915_pm_rpm@module-reload:
    - fi-kbl-7567u:       [DMESG-WARN][21] ([i915#11621] / [i915#180] / [i915#1982] / [i915#9925]) -> [PASS][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8007/fi-kbl-7567u/igt@i915_pm_rpm@module-reload.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11709/fi-kbl-7567u/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live:
    - bat-arls-1:         [DMESG-WARN][23] ([i915#10341]) -> [PASS][24]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8007/bat-arls-1/igt@i915_selftest@live.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11709/bat-arls-1/igt@i915_selftest@live.html
    - bat-arls-2:         [DMESG-WARN][25] ([i915#10341]) -> [PASS][26]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8007/bat-arls-2/igt@i915_selftest@live.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11709/bat-arls-2/igt@i915_selftest@live.html

  * igt@i915_selftest@live@hangcheck:
    - bat-arls-1:         [DMESG-WARN][27] ([i915#11349]) -> [PASS][28]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8007/bat-arls-1/igt@i915_selftest@live@hangcheck.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11709/bat-arls-1/igt@i915_selftest@live@hangcheck.html
    - bat-arls-2:         [DMESG-WARN][29] ([i915#11349]) -> [PASS][30]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8007/bat-arls-2/igt@i915_selftest@live@hangcheck.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11709/bat-arls-2/igt@i915_selftest@live@hangcheck.html

  * igt@i915_selftest@live@sanitycheck:
    - fi-kbl-7567u:       [DMESG-WARN][31] ([i915#11621]) -> [PASS][32] +81 other tests pass
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8007/fi-kbl-7567u/igt@i915_selftest@live@sanitycheck.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11709/fi-kbl-7567u/igt@i915_selftest@live@sanitycheck.html
    - bat-apl-1:          [DMESG-WARN][33] ([i915#11621]) -> [PASS][34] +79 other tests pass
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8007/bat-apl-1/igt@i915_selftest@live@sanitycheck.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11709/bat-apl-1/igt@i915_selftest@live@sanitycheck.html

  * igt@kms_busy@basic@flip:
    - fi-kbl-7567u:       [DMESG-WARN][35] ([i915#180]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8007/fi-kbl-7567u/igt@kms_busy@basic@flip.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11709/fi-kbl-7567u/igt@kms_busy@basic@flip.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1:
    - bat-apl-1:          [DMESG-WARN][37] ([i915#11621] / [i915#180] / [i915#1982]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8007/bat-apl-1/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11709/bat-apl-1/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1.html

  * igt@kms_pipe_crc_basic@nonblocking-crc:
    - fi-kbl-7567u:       [DMESG-WARN][39] ([i915#180] / [i915#9925]) -> [PASS][40] +13 other tests pass
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8007/fi-kbl-7567u/igt@kms_pipe_crc_basic@nonblocking-crc.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11709/fi-kbl-7567u/igt@kms_pipe_crc_basic@nonblocking-crc.html
    - bat-apl-1:          [DMESG-WARN][41] ([i915#180]) -> [PASS][42] +8 other tests pass
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8007/bat-apl-1/igt@kms_pipe_crc_basic@nonblocking-crc.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11709/bat-apl-1/igt@kms_pipe_crc_basic@nonblocking-crc.html
    - bat-arls-5:         [INCOMPLETE][43] ([i915#11320]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8007/bat-arls-5/igt@kms_pipe_crc_basic@nonblocking-crc.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11709/bat-arls-5/igt@kms_pipe_crc_basic@nonblocking-crc.html

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - fi-kbl-7567u:       [DMESG-WARN][45] ([i915#11621] / [i915#180] / [i915#9925]) -> [PASS][46] +36 other tests pass
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8007/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11709/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html
    - bat-apl-1:          [DMESG-WARN][47] ([i915#11621] / [i915#180]) -> [PASS][48] +33 other tests pass
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8007/bat-apl-1/igt@kms_pm_rpm@basic-pci-d3-state.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11709/bat-apl-1/igt@kms_pm_rpm@basic-pci-d3-state.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10196]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10196
  [i915#10341]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10341
  [i915#11320]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11320
  [i915#11343]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11343
  [i915#11346]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346
  [i915#11349]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11349
  [i915#11621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11621
  [i915#11666]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11666
  [i915#11671]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11671
  [i915#11681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
  [i915#11723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11723
  [i915#11724]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11724
  [i915#11725]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11725
  [i915#11726]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11726
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12102]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12102
  [i915#180]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180
  [i915#1982]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982
  [i915#8809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8809
  [i915#9318]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9318
  [i915#9500]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9500
  [i915#9886]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9886
  [i915#9925]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9925


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8007 -> IGTPW_11709

  CI-20190529: 20190529
  CI_DRM_15369: 7f3ffaf88a3a1b3e29416488fb4e58fd551cd89d @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_11709: 2e116ddcb53a407192203f6185cc470db1df91ea @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8007: 8f9900c288f4cf1244d66baa71bc6d9355747cbd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11709/index.html

--===============4498247579981134025==
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
<tr><td><b>Series:</b></td><td>tests/amdgpu: fix concurrent queue test issue (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/138238/">https://patchwork.freedesktop.org/series/138238/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11709/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11709/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8007 -&gt; IGTPW_11709</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_11709 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_11709, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11709/index.html</p>
<h2>Participating hosts (42 -&gt; 39)</h2>
<p>Additional (1): bat-arlh-3 <br />
  Missing    (4): bat-dg2-11 fi-kbl-8809g fi-snb-2520m fi-bsw-n3050 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_11709:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_selftest@live:<ul>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8007/bat-mtlp-8/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11709/bat-mtlp-8/igt@i915_selftest@live.html">ABORT</a></li>
<li>bat-arlh-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8007/bat-arlh-2/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11709/bat-arlh-2/igt@i915_selftest@live.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11709 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>bat-arls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8007/bat-arls-1/igt@fbdev@info.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11709/bat-arls-1/igt@fbdev@info.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12102">i915#12102</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8007/bat-arls-5/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11709/bat-arls-5/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10341">i915#10341</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8007/bat-arls-5/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11709/bat-arls-5/igt@i915_selftest@live@hangcheck.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9500">i915#9500</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-arlh-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8007/bat-arlh-2/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11709/bat-arlh-2/igt@i915_selftest@live@workarounds.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>)</li>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8007/bat-mtlp-8/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11709/bat-mtlp-8/igt@i915_selftest@live@workarounds.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>bat-arls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8007/bat-arls-1/igt@fbdev@read.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12102">i915#12102</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11709/bat-arls-1/igt@fbdev@read.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8007/fi-kbl-7567u/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180">i915#180</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982">i915#1982</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9925">i915#9925</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11709/fi-kbl-7567u/igt@i915_module_load@reload.html">PASS</a></li>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8007/bat-apl-1/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180">i915#180</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11709/bat-apl-1/igt@i915_module_load@reload.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8007/fi-kbl-7567u/igt@i915_pm_rpm@module-reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11621">i915#11621</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180">i915#180</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982">i915#1982</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9925">i915#9925</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11709/fi-kbl-7567u/igt@i915_pm_rpm@module-reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-arls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8007/bat-arls-1/igt@i915_selftest@live.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10341">i915#10341</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11709/bat-arls-1/igt@i915_selftest@live.html">PASS</a></li>
<li>bat-arls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8007/bat-arls-2/igt@i915_selftest@live.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10341">i915#10341</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11709/bat-arls-2/igt@i915_selftest@live.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>bat-arls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8007/bat-arls-1/igt@i915_selftest@live@hangcheck.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11349">i915#11349</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11709/bat-arls-1/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
<li>bat-arls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8007/bat-arls-2/igt@i915_selftest@live@hangcheck.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11349">i915#11349</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11709/bat-arls-2/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@sanitycheck:</p>
<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8007/fi-kbl-7567u/igt@i915_selftest@live@sanitycheck.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11621">i915#11621</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11709/fi-kbl-7567u/igt@i915_selftest@live@sanitycheck.html">PASS</a> +81 other tests pass</li>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8007/bat-apl-1/igt@i915_selftest@live@sanitycheck.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11621">i915#11621</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11709/bat-apl-1/igt@i915_selftest@live@sanitycheck.html">PASS</a> +79 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic@flip:</p>
<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8007/fi-kbl-7567u/igt@kms_busy@basic@flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11709/fi-kbl-7567u/igt@kms_busy@basic@flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1:</p>
<ul>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8007/bat-apl-1/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11621">i915#11621</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180">i915#180</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11709/bat-apl-1/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc:</p>
<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8007/fi-kbl-7567u/igt@kms_pipe_crc_basic@nonblocking-crc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180">i915#180</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9925">i915#9925</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11709/fi-kbl-7567u/igt@kms_pipe_crc_basic@nonblocking-crc.html">PASS</a> +13 other tests pass</li>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8007/bat-apl-1/igt@kms_pipe_crc_basic@nonblocking-crc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11709/bat-apl-1/igt@kms_pipe_crc_basic@nonblocking-crc.html">PASS</a> +8 other tests pass</li>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8007/bat-arls-5/igt@kms_pipe_crc_basic@nonblocking-crc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11320">i915#11320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11709/bat-arls-5/igt@kms_pipe_crc_basic@nonblocking-crc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8007/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11621">i915#11621</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180">i915#180</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9925">i915#9925</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11709/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html">PASS</a> +36 other tests pass</li>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8007/bat-apl-1/igt@kms_pm_rpm@basic-pci-d3-state.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11621">i915#11621</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11709/bat-apl-1/igt@kms_pm_rpm@basic-pci-d3-state.html">PASS</a> +33 other tests pass</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8007 -&gt; IGTPW_11709</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_15369: 7f3ffaf88a3a1b3e29416488fb4e58fd551cd89d @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_11709: 2e116ddcb53a407192203f6185cc470db1df91ea @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8007: 8f9900c288f4cf1244d66baa71bc6d9355747cbd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============4498247579981134025==--
