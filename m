Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F1EB606A31C
	for <igt-dev@archiver.kernel.org>; Mon, 16 Nov 2026 03:46:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CF5210E06D;
	Mon, 16 Nov 2026 03:46:09 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5354D10E09E;
 Mon, 16 Nov 2026 03:45:07 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3673483740464229185=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_tests/amdgpu/amd=5Freplay?=
 =?utf-8?q?=3A_Fix_state_and_sink_status_checks_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ray Wu" <ray.wu@amd.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 16 Nov 2026 03:45:07 -0000
Message-ID: <179480070733.27504.4700507332405838398@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261116022447.3981877-1-ray.wu@amd.com>
In-Reply-To: <20261116022447.3981877-1-ray.wu@amd.com>
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
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============3673483740464229185==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/amdgpu/amd_replay: Fix state and sink status checks (rev2)
URL   : https://patchwork.freedesktop.org/series/178454/
State : failure

== Summary ==

CI Bug Log - changes from IGT_9192 -> IGTPW_16148
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_16148 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_16148, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16148/index.html

Participating hosts (39 -> 38)
------------------------------

  Missing    (1): bat-dg2-13 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_16148:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_addfb_basic@invalid-set-prop-any:
    - bat-dg2-9:          [PASS][1] -> [DMESG-WARN][2] +41 other tests dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9192/bat-dg2-9/igt@kms_addfb_basic@invalid-set-prop-any.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16148/bat-dg2-9/igt@kms_addfb_basic@invalid-set-prop-any.html

  
Known issues
------------

  Here are the changes found in IGTPW_16148 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@eof:
    - bat-dg2-9:          [PASS][3] -> [SKIP][4] ([i915#2582]) +3 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9192/bat-dg2-9/igt@fbdev@eof.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16148/bat-dg2-9/igt@fbdev@eof.html

  * igt@fbdev@info:
    - bat-dg2-9:          [PASS][5] -> [SKIP][6] ([i915#1849] / [i915#2582])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9192/bat-dg2-9/igt@fbdev@info.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16148/bat-dg2-9/igt@fbdev@info.html

  * igt@kms_flip@basic-flip-vs-dpms:
    - bat-dg2-9:          [PASS][7] -> [SKIP][8] ([i915#5354]) +3 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9192/bat-dg2-9/igt@kms_flip@basic-flip-vs-dpms.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16148/bat-dg2-9/igt@kms_flip@basic-flip-vs-dpms.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-dg2-9:          [PASS][9] -> [SKIP][10] ([i915#16708] / [i915#5354])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9192/bat-dg2-9/igt@kms_frontbuffer_tracking@basic.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16148/bat-dg2-9/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_pipe_crc_basic@hang-read-crc:
    - bat-dg2-9:          [PASS][11] -> [SKIP][12] ([i915#11190]) +14 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9192/bat-dg2-9/igt@kms_pipe_crc_basic@hang-read-crc.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16148/bat-dg2-9/igt@kms_pipe_crc_basic@hang-read-crc.html

  * igt@vgem_basic@unload:
    - bat-rpls-4:         [PASS][13] -> [DMESG-WARN][14] ([i915#13400])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9192/bat-rpls-4/igt@vgem_basic@unload.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16148/bat-rpls-4/igt@vgem_basic@unload.html

  
#### Warnings ####

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - bat-dg2-9:          [SKIP][15] ([i915#4103]) -> [SKIP][16] ([i915#11190]) +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9192/bat-dg2-9/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16148/bat-dg2-9/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  
  [i915#11190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190
  [i915#13400]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13400
  [i915#16708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708
  [i915#1849]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849
  [i915#2582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582
  [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9192 -> IGTPW_16148
  * Linux: CI_DRM_19517 -> CI_DRM_19526

  CI-20190529: 20190529
  CI_DRM_19517: 2b4f99da078af1e9a391d4a4ff51550e30b711f2 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_19526: 1e689143b673f45c712bacde9b1c4b8c360efdca @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_16148: 16148
  IGT_9192: 9192

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16148/index.html

--===============3673483740464229185==
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
<tr><td><b>Series:</b></td><td>tests/amdgpu/amd_replay: Fix state and sink status checks (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/178454/">https://patchwork.freedesktop.org/series/178454/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16148/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16148/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_9192 -&gt; IGTPW_16148</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_16148 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_16148, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16148/index.html</p>
<h2>Participating hosts (39 -&gt; 38)</h2>
<p>Missing    (1): bat-dg2-13 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_16148:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_addfb_basic@invalid-set-prop-any:<ul>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9192/bat-dg2-9/igt@kms_addfb_basic@invalid-set-prop-any.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16148/bat-dg2-9/igt@kms_addfb_basic@invalid-set-prop-any.html">DMESG-WARN</a> +41 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_16148 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9192/bat-dg2-9/igt@fbdev@eof.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16148/bat-dg2-9/igt@fbdev@eof.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582">i915#2582</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9192/bat-dg2-9/igt@fbdev@info.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16148/bat-dg2-9/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582">i915#2582</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms:</p>
<ul>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9192/bat-dg2-9/igt@kms_flip@basic-flip-vs-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16148/bat-dg2-9/igt@kms_flip@basic-flip-vs-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9192/bat-dg2-9/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16148/bat-dg2-9/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16708">i915#16708</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc:</p>
<ul>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9192/bat-dg2-9/igt@kms_pipe_crc_basic@hang-read-crc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16148/bat-dg2-9/igt@kms_pipe_crc_basic@hang-read-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190">i915#11190</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@vgem_basic@unload:</p>
<ul>
<li>bat-rpls-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9192/bat-rpls-4/igt@vgem_basic@unload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16148/bat-rpls-4/igt@vgem_basic@unload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13400">i915#13400</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:<ul>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9192/bat-dg2-9/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16148/bat-dg2-9/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190">i915#11190</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9192 -&gt; IGTPW_16148</li>
<li>Linux: CI_DRM_19517 -&gt; CI_DRM_19526</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19517: 2b4f99da078af1e9a391d4a4ff51550e30b711f2 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_19526: 1e689143b673f45c712bacde9b1c4b8c360efdca @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_16148: 16148<br />
  IGT_9192: 9192</p>

</body>
</html>

--===============3673483740464229185==--
