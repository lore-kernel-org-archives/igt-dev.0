Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71191D44D4C
	for <igt-dev@archiver.kernel.org>; Wed,  6 Nov 2024 11:15:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C89210E1CF;
	Wed,  6 Nov 2024 11:15:16 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC50D10E1CF;
 Wed,  6 Nov 2024 11:15:14 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5822494732528389187=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBAT=3A_failure_for_igt-runner_fact_checking_?=
 =?utf-8?q?=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Peter Senna Tschudin" <peter.senna@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 06 Nov 2024 11:15:14 -0000
Message-ID: <173089171489.1416295.6843591743832508124@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <136a49f8-8173-47a8-ac5d-e62e972e1005@linux.intel.com>
In-Reply-To: <136a49f8-8173-47a8-ac5d-e62e972e1005@linux.intel.com>
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

--===============5822494732528389187==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: igt-runner fact checking (rev2)
URL   : https://patchwork.freedesktop.org/series/140841/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8099 -> IGTPW_12046
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12046 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12046, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12046/index.html

Participating hosts (46 -> 45)
------------------------------

  Missing    (1): fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12046:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_fence@basic-await@vcs0:
    - bat-twl-1:          [PASS][1] -> [FAIL][2] +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8099/bat-twl-1/igt@gem_exec_fence@basic-await@vcs0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12046/bat-twl-1/igt@gem_exec_fence@basic-await@vcs0.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_flip@basic-plain-flip:
    - {bat-mtlp-9}:       [PASS][3] -> [WARN][4] +1 other test warn
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8099/bat-mtlp-9/igt@kms_flip@basic-plain-flip.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12046/bat-mtlp-9/igt@kms_flip@basic-plain-flip.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24:
    - {bat-mtlp-9}:       [PASS][5] -> [FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8099/bat-mtlp-9/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12046/bat-mtlp-9/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-d-edp-1:
    - {bat-mtlp-9}:       NOTRUN -> [FAIL][7] +1 other test fail
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12046/bat-mtlp-9/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-d-edp-1.html

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-a-edp-1:
    - {bat-mtlp-9}:       [PASS][8] -> [ABORT][9] +1 other test abort
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8099/bat-mtlp-9/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-a-edp-1.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12046/bat-mtlp-9/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-a-edp-1.html

  
Known issues
------------

  Here are the changes found in IGTPW_12046 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live:
    - bat-mtlp-6:         [PASS][10] -> [ABORT][11] ([i915#12061] / [i915#12133])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8099/bat-mtlp-6/igt@i915_selftest@live.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12046/bat-mtlp-6/igt@i915_selftest@live.html
    - bat-twl-2:          [PASS][12] -> [INCOMPLETE][13] ([i915#12133] / [i915#9413])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8099/bat-twl-2/igt@i915_selftest@live.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12046/bat-twl-2/igt@i915_selftest@live.html

  * igt@i915_selftest@live@gt_lrc:
    - bat-twl-2:          [PASS][14] -> [INCOMPLETE][15] ([i915#12445] / [i915#9413])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8099/bat-twl-2/igt@i915_selftest@live@gt_lrc.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12046/bat-twl-2/igt@i915_selftest@live@gt_lrc.html

  * igt@i915_selftest@live@workarounds:
    - bat-mtlp-6:         [PASS][16] -> [ABORT][17] ([i915#12061])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8099/bat-mtlp-6/igt@i915_selftest@live@workarounds.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12046/bat-mtlp-6/igt@i915_selftest@live@workarounds.html

  
#### Possible fixes ####

  * igt@i915_selftest@live:
    - bat-mtlp-8:         [DMESG-FAIL][18] ([i915#12697]) -> [PASS][19] +1 other test pass
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8099/bat-mtlp-8/igt@i915_selftest@live.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12046/bat-mtlp-8/igt@i915_selftest@live.html
    - bat-arlh-3:         [ABORT][20] ([i915#12133]) -> [PASS][21]
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8099/bat-arlh-3/igt@i915_selftest@live.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12046/bat-arlh-3/igt@i915_selftest@live.html

  * igt@i915_selftest@live@workarounds:
    - bat-arlh-3:         [ABORT][22] ([i915#12061]) -> [PASS][23]
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8099/bat-arlh-3/igt@i915_selftest@live@workarounds.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12046/bat-arlh-3/igt@i915_selftest@live@workarounds.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12133]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12133
  [i915#12445]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12445
  [i915#12695]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12695
  [i915#12697]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12697
  [i915#9413]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9413


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8099 -> IGTPW_12046
  * Linux: CI_DRM_15638 -> CI_DRM_15642

  CI-20190529: 20190529
  CI_DRM_15638: 2b31f47649daecf2da6611c70072dfbe4914c22a @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_15642: e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12046: e132a6d9d48fe45b98f6a002d27ce3ec23d3070e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8099: 27be46dee80b6b0de80f9fa3cd9bb5f55edccaf8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12046/index.html

--===============5822494732528389187==
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
<tr><td><b>Series:</b></td><td>igt-runner fact checking (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/140841/">https://patchwork.freedesktop.org/series/140841/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12046/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12046/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8099 -&gt; IGTPW_12046</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_12046 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_12046, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12046/index.html</p>
<h2>Participating hosts (46 -&gt; 45)</h2>
<p>Missing    (1): fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_12046:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@gem_exec_fence@basic-await@vcs0:<ul>
<li>bat-twl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8099/bat-twl-1/igt@gem_exec_fence@basic-await@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12046/bat-twl-1/igt@gem_exec_fence@basic-await@vcs0.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_flip@basic-plain-flip:</p>
<ul>
<li>{bat-mtlp-9}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8099/bat-mtlp-9/igt@kms_flip@basic-plain-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12046/bat-mtlp-9/igt@kms_flip@basic-plain-flip.html">WARN</a> +1 other test warn</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24:</p>
<ul>
<li>{bat-mtlp-9}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8099/bat-mtlp-9/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12046/bat-mtlp-9/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-d-edp-1:</p>
<ul>
<li>{bat-mtlp-9}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12046/bat-mtlp-9/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-d-edp-1.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-a-edp-1:</p>
<ul>
<li>{bat-mtlp-9}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8099/bat-mtlp-9/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12046/bat-mtlp-9/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-a-edp-1.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_12046 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8099/bat-mtlp-6/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12046/bat-mtlp-6/igt@i915_selftest@live.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12133">i915#12133</a>)</li>
<li>bat-twl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8099/bat-twl-2/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12046/bat-twl-2/igt@i915_selftest@live.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12133">i915#12133</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9413">i915#9413</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_lrc:</p>
<ul>
<li>bat-twl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8099/bat-twl-2/igt@i915_selftest@live@gt_lrc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12046/bat-twl-2/igt@i915_selftest@live@gt_lrc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12445">i915#12445</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9413">i915#9413</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8099/bat-mtlp-6/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12046/bat-mtlp-6/igt@i915_selftest@live@workarounds.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8099/bat-mtlp-8/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12697">i915#12697</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12046/bat-mtlp-8/igt@i915_selftest@live.html">PASS</a> +1 other test pass</li>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8099/bat-arlh-3/igt@i915_selftest@live.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12133">i915#12133</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12046/bat-arlh-3/igt@i915_selftest@live.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8099/bat-arlh-3/igt@i915_selftest@live@workarounds.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12046/bat-arlh-3/igt@i915_selftest@live@workarounds.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8099 -&gt; IGTPW_12046</li>
<li>Linux: CI_DRM_15638 -&gt; CI_DRM_15642</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_15638: 2b31f47649daecf2da6611c70072dfbe4914c22a @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_15642: e6ccd1b8868ec5bc1569c0dbd0dbbd46148cc541 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_12046: e132a6d9d48fe45b98f6a002d27ce3ec23d3070e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8099: 27be46dee80b6b0de80f9fa3cd9bb5f55edccaf8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============5822494732528389187==--
