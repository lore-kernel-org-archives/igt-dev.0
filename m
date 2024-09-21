Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00B27CF9C5C
	for <igt-dev@archiver.kernel.org>; Sat, 21 Sep 2024 01:35:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0C7910E124;
	Sat, 21 Sep 2024 01:35:38 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A03DB10E124;
 Sat, 21 Sep 2024 01:35:37 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4224244396326197435=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_tests/intel/oa=3A_Check_exe?=
 =?utf-8?q?c=5Fqueue_is_usable_after_closing_OA_stream?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ashutosh Dixit" <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sat, 21 Sep 2024 01:35:37 -0000
Message-ID: <172688253764.1052506.560774421175894237@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240921004506.3280863-1-ashutosh.dixit@intel.com>
In-Reply-To: <20240921004506.3280863-1-ashutosh.dixit@intel.com>
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

--===============4224244396326197435==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/oa: Check exec_queue is usable after closing OA stream
URL   : https://patchwork.freedesktop.org/series/138937/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_15443 -> IGTPW_11779
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11779/index.html

Participating hosts (37 -> 32)
------------------------------

  Missing    (5): bat-dg1-7 bat-kbl-2 fi-snb-2520m fi-elk-e7500 bat-mtlp-6 

Known issues
------------

  Here are the changes found in IGTPW_11779 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
    - bat-dg2-11:         [PASS][1] -> [SKIP][2] ([i915#9197]) +3 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15443/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11779/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html

  
#### Possible fixes ####

  * igt@i915_selftest@live:
    - bat-arls-1:         [DMESG-FAIL][3] ([i915#10262] / [i915#10341]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15443/bat-arls-1/igt@i915_selftest@live.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11779/bat-arls-1/igt@i915_selftest@live.html
    - bat-twl-1:          [INCOMPLETE][5] ([i915#9413]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15443/bat-twl-1/igt@i915_selftest@live.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11779/bat-twl-1/igt@i915_selftest@live.html

  * igt@i915_selftest@live@evict:
    - bat-arls-1:         [DMESG-WARN][7] ([i915#10341]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15443/bat-arls-1/igt@i915_selftest@live@evict.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11779/bat-arls-1/igt@i915_selftest@live@evict.html

  * igt@i915_selftest@live@execlists:
    - bat-arls-1:         [DMESG-FAIL][9] ([i915#10262]) -> [PASS][10] +14 other tests pass
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15443/bat-arls-1/igt@i915_selftest@live@execlists.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11779/bat-arls-1/igt@i915_selftest@live@execlists.html

  * igt@i915_selftest@live@gt_lrc:
    - bat-twl-2:          [INCOMPLETE][11] ([i915#9413]) -> [PASS][12] +1 other test pass
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15443/bat-twl-2/igt@i915_selftest@live@gt_lrc.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11779/bat-twl-2/igt@i915_selftest@live@gt_lrc.html
    - bat-twl-1:          [INCOMPLETE][13] ([i915#10886] / [i915#9413]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15443/bat-twl-1/igt@i915_selftest@live@gt_lrc.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11779/bat-twl-1/igt@i915_selftest@live@gt_lrc.html

  
  [i915#10262]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10262
  [i915#10341]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10341
  [i915#10886]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10886
  [i915#9197]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9197
  [i915#9413]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9413


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8031 -> IGTPW_11779

  CI-20190529: 20190529
  CI_DRM_15443: abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_11779: 11779
  IGT_8031: 27ba1f4756f12a3694dce6d456aed947f22a8e34 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11779/index.html

--===============4224244396326197435==
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
<tr><td><b>Series:</b></td><td>tests/intel/oa: Check exec_queue is usable after closing OA stream</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/138937/">https://patchwork.freedesktop.org/series/138937/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11779/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11779/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_15443 -&gt; IGTPW_11779</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11779/index.html</p>
<h2>Participating hosts (37 -&gt; 32)</h2>
<p>Missing    (5): bat-dg1-7 bat-kbl-2 fi-snb-2520m fi-elk-e7500 bat-mtlp-6 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11779 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:<ul>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15443/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11779/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9197">i915#9197</a>) +3 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-arls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15443/bat-arls-1/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10262">i915#10262</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10341">i915#10341</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11779/bat-arls-1/igt@i915_selftest@live.html">PASS</a></li>
<li>bat-twl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15443/bat-twl-1/igt@i915_selftest@live.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9413">i915#9413</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11779/bat-twl-1/igt@i915_selftest@live.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@evict:</p>
<ul>
<li>bat-arls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15443/bat-arls-1/igt@i915_selftest@live@evict.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10341">i915#10341</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11779/bat-arls-1/igt@i915_selftest@live@evict.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>bat-arls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15443/bat-arls-1/igt@i915_selftest@live@execlists.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10262">i915#10262</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11779/bat-arls-1/igt@i915_selftest@live@execlists.html">PASS</a> +14 other tests pass</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_lrc:</p>
<ul>
<li>bat-twl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15443/bat-twl-2/igt@i915_selftest@live@gt_lrc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9413">i915#9413</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11779/bat-twl-2/igt@i915_selftest@live@gt_lrc.html">PASS</a> +1 other test pass</li>
<li>bat-twl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15443/bat-twl-1/igt@i915_selftest@live@gt_lrc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10886">i915#10886</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9413">i915#9413</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11779/bat-twl-1/igt@i915_selftest@live@gt_lrc.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8031 -&gt; IGTPW_11779</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_15443: abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_11779: 11779<br />
  IGT_8031: 27ba1f4756f12a3694dce6d456aed947f22a8e34 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============4224244396326197435==--
