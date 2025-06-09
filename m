Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0255CC61DB2
	for <igt-dev@archiver.kernel.org>; Mon,  9 Jun 2025 08:34:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A063010E02A;
	Mon,  9 Jun 2025 08:34:38 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0225910E0AA;
 Mon,  9 Jun 2025 08:34:37 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4455039861057397885=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_lib/meson=3A_Enable_userq?=
 =?utf-8?q?ueues_based_on_libdrm_version?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sunil Khatri" <sunil.khatri@amd.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 09 Jun 2025 08:34:36 -0000
Message-ID: <174945807698.58987.3147396795538994106@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250609073311.715013-1-sunil.khatri@amd.com>
In-Reply-To: <20250609073311.715013-1-sunil.khatri@amd.com>
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

--===============4455039861057397885==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/meson: Enable userqueues based on libdrm version
URL   : https://patchwork.freedesktop.org/series/149976/
State : success

== Summary ==

CI Bug Log - changes from IGT_8401 -> IGTPW_13259
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13259/index.html

Participating hosts (43 -> 40)
------------------------------

  Missing    (3): bat-apl-1 bat-atsm-1 fi-snb-2520m 

New tests
---------

  New tests have been introduced between IGT_8401 and IGTPW_13259:

### New IGT tests (4) ###

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-dp-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.74] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-d-dp-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.73] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-b-dp-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.73] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-d-dp-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.71] s

  

Known issues
------------

  Here are the changes found in IGTPW_13259 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live:
    - bat-dg2-11:         [PASS][1] -> [ABORT][2] ([i915#12061])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8401/bat-dg2-11/igt@i915_selftest@live.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13259/bat-dg2-11/igt@i915_selftest@live.html

  * igt@i915_selftest@live@guc_multi_lrc:
    - bat-dg2-11:         [PASS][3] -> [ABORT][4] ([i915#14201])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8401/bat-dg2-11/igt@i915_selftest@live@guc_multi_lrc.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13259/bat-dg2-11/igt@i915_selftest@live@guc_multi_lrc.html

  * igt@i915_selftest@live@workarounds:
    - bat-dg2-11:         [PASS][5] -> [DMESG-FAIL][6] ([i915#12061])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8401/bat-dg2-11/igt@i915_selftest@live@workarounds.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13259/bat-dg2-11/igt@i915_selftest@live@workarounds.html
    - bat-mtlp-9:         [PASS][7] -> [DMESG-FAIL][8] ([i915#12061]) +1 other test dmesg-fail
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8401/bat-mtlp-9/igt@i915_selftest@live@workarounds.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13259/bat-mtlp-9/igt@i915_selftest@live@workarounds.html

  
#### Possible fixes ####

  * igt@dmabuf@all-tests@dma_fence_chain:
    - fi-bsw-n3050:       [INCOMPLETE][9] ([i915#12904]) -> [PASS][10] +1 other test pass
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8401/fi-bsw-n3050/igt@dmabuf@all-tests@dma_fence_chain.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13259/fi-bsw-n3050/igt@dmabuf@all-tests@dma_fence_chain.html

  * igt@i915_selftest@live:
    - bat-arlh-3:         [DMESG-FAIL][11] ([i915#14243]) -> [PASS][12] +1 other test pass
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8401/bat-arlh-3/igt@i915_selftest@live.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13259/bat-arlh-3/igt@i915_selftest@live.html

  * igt@i915_selftest@live@guc_multi_lrc:
    - bat-twl-2:          [INCOMPLETE][13] ([i915#14096]) -> [PASS][14] +1 other test pass
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8401/bat-twl-2/igt@i915_selftest@live@guc_multi_lrc.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13259/bat-twl-2/igt@i915_selftest@live@guc_multi_lrc.html

  
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12904]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12904
  [i915#14096]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14096
  [i915#14201]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14201
  [i915#14243]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14243


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8401 -> IGTPW_13259
  * Linux: CI_DRM_16662 -> CI_DRM_16665

  CI-20190529: 20190529
  CI_DRM_16662: 2f92a5cfa1b06e29699d63b805ce3e4aab6c4f77 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_16665: b8f759deb9abbafcb01468baecf33aee93ace35f @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_13259: ce8e73e5452d834190efc728dec0b72914192da0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8401: 8401

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13259/index.html

--===============4455039861057397885==
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
<tr><td><b>Series:</b></td><td>lib/meson: Enable userqueues based on libdrm version</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/149976/">https://patchwork.freedesktop.org/series/149976/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13259/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13259/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8401 -&gt; IGTPW_13259</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13259/index.html</p>
<h2>Participating hosts (43 -&gt; 40)</h2>
<p>Missing    (3): bat-apl-1 bat-atsm-1 fi-snb-2520m </p>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_8401 and IGTPW_13259:</p>
<h3>New IGT tests (4)</h3>
<ul>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-dp-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-d-dp-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-b-dp-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-d-dp-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.71] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_13259 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8401/bat-dg2-11/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13259/bat-dg2-11/igt@i915_selftest@live.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@guc_multi_lrc:</p>
<ul>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8401/bat-dg2-11/igt@i915_selftest@live@guc_multi_lrc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13259/bat-dg2-11/igt@i915_selftest@live@guc_multi_lrc.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14201">i915#14201</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8401/bat-dg2-11/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13259/bat-dg2-11/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>)</li>
<li>bat-mtlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8401/bat-mtlp-9/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13259/bat-mtlp-9/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@dmabuf@all-tests@dma_fence_chain:</p>
<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8401/fi-bsw-n3050/igt@dmabuf@all-tests@dma_fence_chain.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12904">i915#12904</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13259/fi-bsw-n3050/igt@dmabuf@all-tests@dma_fence_chain.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8401/bat-arlh-3/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14243">i915#14243</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13259/bat-arlh-3/igt@i915_selftest@live.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@guc_multi_lrc:</p>
<ul>
<li>bat-twl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8401/bat-twl-2/igt@i915_selftest@live@guc_multi_lrc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14096">i915#14096</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13259/bat-twl-2/igt@i915_selftest@live@guc_multi_lrc.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8401 -&gt; IGTPW_13259</li>
<li>Linux: CI_DRM_16662 -&gt; CI_DRM_16665</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_16662: 2f92a5cfa1b06e29699d63b805ce3e4aab6c4f77 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_16665: b8f759deb9abbafcb01468baecf33aee93ace35f @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_13259: ce8e73e5452d834190efc728dec0b72914192da0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8401: 8401</p>

</body>
</html>

--===============4455039861057397885==--
