Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CF9DC8303C
	for <igt-dev@archiver.kernel.org>; Mon,  7 Jul 2025 04:07:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7284F10E304;
	Mon,  7 Jul 2025 04:07:49 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFEB010E304;
 Mon,  7 Jul 2025 04:07:47 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8461769906070036386=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_Refactor_DRM_Debug_Severi?=
 =?utf-8?q?ty_Handling_for_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Pranay Samala" <pranay.samala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 07 Jul 2025 04:07:47 -0000
Message-ID: <175186126790.138531.8878667357488226961@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250707033246.751156-1-pranay.samala@intel.com>
In-Reply-To: <20250707033246.751156-1-pranay.samala@intel.com>
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

--===============8461769906070036386==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Refactor DRM Debug Severity Handling for (rev3)
URL   : https://patchwork.freedesktop.org/series/147049/
State : success

== Summary ==

CI Bug Log - changes from IGT_8443 -> IGTPW_13415
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13415/index.html

Participating hosts (44 -> 43)
------------------------------

  Missing    (1): fi-snb-2520m 

New tests
---------

  New tests have been introduced between IGT_8443 and IGTPW_13415:

### New IGT tests (17) ###

  * igt@i915_selftest@live@migrate:
    - Statuses : 42 pass(s)
    - Exec time: [1.62, 10.75] s

  * igt@kms_flip@basic-flip-vs-dpms@a-dp3:
    - Statuses : 1 dmesg-warn(s) 1 pass(s)
    - Exec time: [0.86, 0.92] s

  * igt@kms_flip@basic-flip-vs-dpms@b-dp3:
    - Statuses : 1 dmesg-warn(s) 1 pass(s)
    - Exec time: [0.78, 0.84] s

  * igt@kms_flip@basic-flip-vs-dpms@c-dp3:
    - Statuses : 1 dmesg-warn(s) 1 pass(s)
    - Exec time: [0.76, 0.77] s

  * igt@kms_flip@basic-flip-vs-dpms@d-dp3:
    - Statuses : 1 dmesg-warn(s) 1 pass(s)
    - Exec time: [0.77, 0.78] s

  * igt@kms_flip@basic-flip-vs-modeset@a-dp3:
    - Statuses : 1 dmesg-warn(s) 1 pass(s)
    - Exec time: [0.90, 0.95] s

  * igt@kms_flip@basic-flip-vs-modeset@b-dp3:
    - Statuses : 1 dmesg-warn(s) 1 pass(s)
    - Exec time: [0.82, 0.86] s

  * igt@kms_flip@basic-flip-vs-modeset@c-dp3:
    - Statuses : 1 dmesg-warn(s) 1 pass(s)
    - Exec time: [0.79, 0.82] s

  * igt@kms_flip@basic-flip-vs-modeset@d-dp3:
    - Statuses : 1 dmesg-warn(s) 1 pass(s)
    - Exec time: [0.79, 0.81] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-dp3:
    - Statuses : 1 dmesg-warn(s) 1 pass(s)
    - Exec time: [1.14, 2.17] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@b-dp3:
    - Statuses : 1 dmesg-warn(s) 1 pass(s)
    - Exec time: [1.11, 1.96] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-dp3:
    - Statuses : 1 dmesg-warn(s) 1 pass(s)
    - Exec time: [1.09, 1.97] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@d-dp3:
    - Statuses : 1 dmesg-warn(s) 1 pass(s)
    - Exec time: [1.09, 1.97] s

  * igt@kms_flip@basic-plain-flip@a-dp3:
    - Statuses : 1 dmesg-warn(s) 1 pass(s)
    - Exec time: [0.88, 1.14] s

  * igt@kms_flip@basic-plain-flip@b-dp3:
    - Statuses : 1 dmesg-warn(s) 1 pass(s)
    - Exec time: [0.84, 0.92] s

  * igt@kms_flip@basic-plain-flip@c-dp3:
    - Statuses : 1 dmesg-warn(s) 1 pass(s)
    - Exec time: [0.81, 0.93] s

  * igt@kms_flip@basic-plain-flip@d-dp3:
    - Statuses : 1 dmesg-warn(s) 1 pass(s)
    - Exec time: [0.81, 0.92] s

  

Known issues
------------

  Here are the changes found in IGTPW_13415 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_auth@basic-auth:
    - bat-adlp-6:         [PASS][1] -> [DMESG-WARN][2] ([i915#13890])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8443/bat-adlp-6/igt@core_auth@basic-auth.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13415/bat-adlp-6/igt@core_auth@basic-auth.html

  * igt@dmabuf@all-tests@dma_fence_chain:
    - fi-bsw-n3050:       [PASS][3] -> [ABORT][4] ([i915#14592]) +1 other test abort
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8443/fi-bsw-n3050/igt@dmabuf@all-tests@dma_fence_chain.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13415/fi-bsw-n3050/igt@dmabuf@all-tests@dma_fence_chain.html

  * igt@i915_selftest@live:
    - bat-dg2-11:         [PASS][5] -> [ABORT][6] ([i915#12061] / [i915#14556])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8443/bat-dg2-11/igt@i915_selftest@live.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13415/bat-dg2-11/igt@i915_selftest@live.html

  * igt@i915_selftest@live@guc_multi_lrc:
    - bat-dg2-11:         [PASS][7] -> [ABORT][8] ([i915#14201])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8443/bat-dg2-11/igt@i915_selftest@live@guc_multi_lrc.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13415/bat-dg2-11/igt@i915_selftest@live@guc_multi_lrc.html

  * igt@i915_selftest@live@workarounds:
    - bat-dg2-9:          [PASS][9] -> [DMESG-FAIL][10] ([i915#12061]) +1 other test dmesg-fail
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8443/bat-dg2-9/igt@i915_selftest@live@workarounds.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13415/bat-dg2-9/igt@i915_selftest@live@workarounds.html
    - bat-dg2-11:         [PASS][11] -> [DMESG-FAIL][12] ([i915#12061])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8443/bat-dg2-11/igt@i915_selftest@live@workarounds.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13415/bat-dg2-11/igt@i915_selftest@live@workarounds.html
    - bat-arls-6:         [PASS][13] -> [DMESG-FAIL][14] ([i915#12061]) +1 other test dmesg-fail
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8443/bat-arls-6/igt@i915_selftest@live@workarounds.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13415/bat-arls-6/igt@i915_selftest@live@workarounds.html

  
#### Possible fixes ####

  * igt@fbdev@eof:
    - bat-adlp-6:         [DMESG-WARN][15] ([i915#13890]) -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8443/bat-adlp-6/igt@fbdev@eof.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13415/bat-adlp-6/igt@fbdev@eof.html

  * igt@gem_exec_fence@basic-wait:
    - bat-rpls-4:         [DMESG-WARN][17] -> [PASS][18] +1 other test pass
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8443/bat-rpls-4/igt@gem_exec_fence@basic-wait.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13415/bat-rpls-4/igt@gem_exec_fence@basic-wait.html

  * igt@i915_module_load@load:
    - bat-mtlp-9:         [DMESG-WARN][19] ([i915#13494]) -> [PASS][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8443/bat-mtlp-9/igt@i915_module_load@load.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13415/bat-mtlp-9/igt@i915_module_load@load.html

  * igt@i915_selftest@live:
    - bat-dg2-8:          [DMESG-FAIL][21] ([i915#12061]) -> [PASS][22] +1 other test pass
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8443/bat-dg2-8/igt@i915_selftest@live.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13415/bat-dg2-8/igt@i915_selftest@live.html

  
#### Warnings ####

  * igt@i915_selftest@live:
    - bat-atsm-1:         [DMESG-FAIL][23] ([i915#12061] / [i915#13929]) -> [DMESG-FAIL][24] ([i915#12061] / [i915#14204])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8443/bat-atsm-1/igt@i915_selftest@live.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13415/bat-atsm-1/igt@i915_selftest@live.html

  * igt@i915_selftest@live@mman:
    - bat-atsm-1:         [DMESG-FAIL][25] ([i915#13929]) -> [DMESG-FAIL][26] ([i915#14204])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8443/bat-atsm-1/igt@i915_selftest@live@mman.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13415/bat-atsm-1/igt@i915_selftest@live@mman.html

  
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#13494]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13494
  [i915#13890]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13890
  [i915#13929]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13929
  [i915#14201]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14201
  [i915#14204]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14204
  [i915#14556]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14556
  [i915#14592]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14592


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8443 -> IGTPW_13415

  CI-20190529: 20190529
  CI_DRM_16801: bf8cb3609bc5e03d788964e62c5d1f2c3e141e80 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_13415: 13415
  IGT_8443: 8443

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13415/index.html

--===============8461769906070036386==
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
<tr><td><b>Series:</b></td><td>Refactor DRM Debug Severity Handling for (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/147049/">https://patchwork.freedesktop.org/series/147049/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13415/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13415/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8443 -&gt; IGTPW_13415</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13415/index.html</p>
<h2>Participating hosts (44 -&gt; 43)</h2>
<p>Missing    (1): fi-snb-2520m </p>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_8443 and IGTPW_13415:</p>
<h3>New IGT tests (17)</h3>
<ul>
<li>
<p>igt@i915_selftest@live@migrate:</p>
<ul>
<li>Statuses : 42 pass(s)</li>
<li>Exec time: [1.62, 10.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@a-dp3:</p>
<ul>
<li>Statuses : 1 dmesg-warn(s) 1 pass(s)</li>
<li>Exec time: [0.86, 0.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@b-dp3:</p>
<ul>
<li>Statuses : 1 dmesg-warn(s) 1 pass(s)</li>
<li>Exec time: [0.78, 0.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@c-dp3:</p>
<ul>
<li>Statuses : 1 dmesg-warn(s) 1 pass(s)</li>
<li>Exec time: [0.76, 0.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@d-dp3:</p>
<ul>
<li>Statuses : 1 dmesg-warn(s) 1 pass(s)</li>
<li>Exec time: [0.77, 0.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@a-dp3:</p>
<ul>
<li>Statuses : 1 dmesg-warn(s) 1 pass(s)</li>
<li>Exec time: [0.90, 0.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@b-dp3:</p>
<ul>
<li>Statuses : 1 dmesg-warn(s) 1 pass(s)</li>
<li>Exec time: [0.82, 0.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@c-dp3:</p>
<ul>
<li>Statuses : 1 dmesg-warn(s) 1 pass(s)</li>
<li>Exec time: [0.79, 0.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@d-dp3:</p>
<ul>
<li>Statuses : 1 dmesg-warn(s) 1 pass(s)</li>
<li>Exec time: [0.79, 0.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@a-dp3:</p>
<ul>
<li>Statuses : 1 dmesg-warn(s) 1 pass(s)</li>
<li>Exec time: [1.14, 2.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@b-dp3:</p>
<ul>
<li>Statuses : 1 dmesg-warn(s) 1 pass(s)</li>
<li>Exec time: [1.11, 1.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@c-dp3:</p>
<ul>
<li>Statuses : 1 dmesg-warn(s) 1 pass(s)</li>
<li>Exec time: [1.09, 1.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@d-dp3:</p>
<ul>
<li>Statuses : 1 dmesg-warn(s) 1 pass(s)</li>
<li>Exec time: [1.09, 1.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@a-dp3:</p>
<ul>
<li>Statuses : 1 dmesg-warn(s) 1 pass(s)</li>
<li>Exec time: [0.88, 1.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@b-dp3:</p>
<ul>
<li>Statuses : 1 dmesg-warn(s) 1 pass(s)</li>
<li>Exec time: [0.84, 0.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@c-dp3:</p>
<ul>
<li>Statuses : 1 dmesg-warn(s) 1 pass(s)</li>
<li>Exec time: [0.81, 0.93] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@d-dp3:</p>
<ul>
<li>Statuses : 1 dmesg-warn(s) 1 pass(s)</li>
<li>Exec time: [0.81, 0.92] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_13415 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_auth@basic-auth:</p>
<ul>
<li>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8443/bat-adlp-6/igt@core_auth@basic-auth.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13415/bat-adlp-6/igt@core_auth@basic-auth.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13890">i915#13890</a>)</li>
</ul>
</li>
<li>
<p>igt@dmabuf@all-tests@dma_fence_chain:</p>
<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8443/fi-bsw-n3050/igt@dmabuf@all-tests@dma_fence_chain.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13415/fi-bsw-n3050/igt@dmabuf@all-tests@dma_fence_chain.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14592">i915#14592</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8443/bat-dg2-11/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13415/bat-dg2-11/igt@i915_selftest@live.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14556">i915#14556</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@guc_multi_lrc:</p>
<ul>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8443/bat-dg2-11/igt@i915_selftest@live@guc_multi_lrc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13415/bat-dg2-11/igt@i915_selftest@live@guc_multi_lrc.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14201">i915#14201</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8443/bat-dg2-9/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13415/bat-dg2-9/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8443/bat-dg2-11/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13415/bat-dg2-11/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>)</li>
<li>bat-arls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8443/bat-arls-6/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13415/bat-arls-6/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8443/bat-adlp-6/igt@fbdev@eof.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13890">i915#13890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13415/bat-adlp-6/igt@fbdev@eof.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-wait:</p>
<ul>
<li>bat-rpls-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8443/bat-rpls-4/igt@gem_exec_fence@basic-wait.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13415/bat-rpls-4/igt@gem_exec_fence@basic-wait.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>bat-mtlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8443/bat-mtlp-9/igt@i915_module_load@load.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13494">i915#13494</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13415/bat-mtlp-9/igt@i915_module_load@load.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8443/bat-dg2-8/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13415/bat-dg2-8/igt@i915_selftest@live.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8443/bat-atsm-1/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13929">i915#13929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13415/bat-atsm-1/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14204">i915#14204</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@mman:</p>
<ul>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8443/bat-atsm-1/igt@i915_selftest@live@mman.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13929">i915#13929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13415/bat-atsm-1/igt@i915_selftest@live@mman.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14204">i915#14204</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8443 -&gt; IGTPW_13415</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_16801: bf8cb3609bc5e03d788964e62c5d1f2c3e141e80 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_13415: 13415<br />
  IGT_8443: 8443</p>

</body>
</html>

--===============8461769906070036386==--
