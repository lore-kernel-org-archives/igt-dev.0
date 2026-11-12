Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 962B5606A323
	for <igt-dev@archiver.kernel.org>; Thu, 12 Nov 2026 20:39:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11D0C10E4E4;
	Thu, 12 Nov 2026 20:39:33 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A98B410E4E4;
 Thu, 12 Nov 2026 20:38:29 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6655047893832318443=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_tests/kms=5Fatomic=5Frese?=
 =?utf-8?q?t=3A_Add_tests_for_DRM=5FMODE=5FATOMIC=5FRESET_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maxime Ripard" <mripard@kernel.org>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 12 Nov 2026 20:38:29 -0000
Message-ID: <179451590968.17167.551914666408300684@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261112162147.766264-1-mripard@kernel.org>
In-Reply-To: <20261112162147.766264-1-mripard@kernel.org>
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

--===============6655047893832318443==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_atomic_reset: Add tests for DRM_MODE_ATOMIC_RESET (rev4)
URL   : https://patchwork.freedesktop.org/series/174250/
State : success

== Summary ==

CI Bug Log - changes from IGT_9189 -> IGTPW_16142
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16142/index.html

Participating hosts (39 -> 38)
------------------------------

  Additional (1): fi-kbl-x1275 
  Missing    (2): bat-dg2-13 bat-arls-5 

Known issues
------------

  Here are the changes found in IGTPW_16142 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@eof:
    - fi-kbl-x1275:       NOTRUN -> [SKIP][1] ([i915#17464]) +3 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16142/fi-kbl-x1275/igt@fbdev@eof.html

  * igt@fbdev@info:
    - fi-kbl-x1275:       NOTRUN -> [SKIP][2] ([i915#1849])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16142/fi-kbl-x1275/igt@fbdev@info.html

  * igt@gem_huc_copy@huc-copy:
    - fi-kbl-x1275:       NOTRUN -> [SKIP][3] ([i915#17456] / [i915#2190])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16142/fi-kbl-x1275/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@verify-random:
    - fi-kbl-x1275:       NOTRUN -> [SKIP][4] ([i915#11671] / [i915#4613]) +3 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16142/fi-kbl-x1275/igt@gem_lmem_swapping@verify-random.html

  * igt@intel_hwmon@hwmon-read:
    - fi-kbl-x1275:       NOTRUN -> [SKIP][5] ([i915#11680]) +1 other test skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16142/fi-kbl-x1275/igt@intel_hwmon@hwmon-read.html

  * igt@kms_flip@basic-flip-vs-dpms:
    - fi-kbl-x1275:       NOTRUN -> [SKIP][6] ([i915#3637]) +3 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16142/fi-kbl-x1275/igt@kms_flip@basic-flip-vs-dpms.html

  * igt@kms_force_connector_basic@force-load-detect:
    - fi-kbl-x1275:       NOTRUN -> [SKIP][7] ([i915#17465])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16142/fi-kbl-x1275/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_frontbuffer_tracking@basic:
    - fi-kbl-x1275:       NOTRUN -> [SKIP][8] ([i915#17466])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16142/fi-kbl-x1275/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_hdmi_inject@inject-audio:
    - fi-kbl-x1275:       NOTRUN -> [SKIP][9] ([i915#17472])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16142/fi-kbl-x1275/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_pipe_crc_basic@read-crc:
    - fi-kbl-x1275:       NOTRUN -> [SKIP][10] ([i915#11190]) +16 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16142/fi-kbl-x1275/igt@kms_pipe_crc_basic@read-crc.html

  * igt@kms_pm_backlight@basic-brightness:
    - fi-kbl-x1275:       NOTRUN -> [SKIP][11] ([i915#17462])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16142/fi-kbl-x1275/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_psr@psr-primary-page-flip:
    - fi-kbl-x1275:       NOTRUN -> [SKIP][12] ([i915#9732]) +3 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16142/fi-kbl-x1275/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - fi-kbl-x1275:       NOTRUN -> [SKIP][13] ([i915#17463])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16142/fi-kbl-x1275/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@prime_vgem@basic-fence-flip:
    - fi-kbl-x1275:       NOTRUN -> [SKIP][14] ([i915#17467])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16142/fi-kbl-x1275/igt@prime_vgem@basic-fence-flip.html

  
  [i915#11190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190
  [i915#11671]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11671
  [i915#11680]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11680
  [i915#17456]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17456
  [i915#17462]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17462
  [i915#17463]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17463
  [i915#17464]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17464
  [i915#17465]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17465
  [i915#17466]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17466
  [i915#17467]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17467
  [i915#17472]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17472
  [i915#1849]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849
  [i915#2190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190
  [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9189 -> IGTPW_16142
  * Linux: CI_DRM_19508 -> CI_DRM_19509

  CI-20190529: 20190529
  CI_DRM_19508: 4e611eca8b09c3d1e84cea736aa33f89a8321364 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_19509: ff450c62bc560177d72d0520f53ed445bbf704f6 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_16142: 16142
  IGT_9189: 9189

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16142/index.html

--===============6655047893832318443==
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
<tr><td><b>Series:</b></td><td>tests/kms_atomic_reset: Add tests for DRM_MODE_ATOMIC_RESET (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/174250/">https://patchwork.freedesktop.org/series/174250/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16142/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16142/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_9189 -&gt; IGTPW_16142</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16142/index.html</p>
<h2>Participating hosts (39 -&gt; 38)</h2>
<p>Additional (1): fi-kbl-x1275 <br />
  Missing    (2): bat-dg2-13 bat-arls-5 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_16142 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16142/fi-kbl-x1275/igt@fbdev@eof.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17464">i915#17464</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16142/fi-kbl-x1275/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16142/fi-kbl-x1275/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17456">i915#17456</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random:</p>
<ul>
<li>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16142/fi-kbl-x1275/igt@gem_lmem_swapping@verify-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11671">i915#11671</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16142/fi-kbl-x1275/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11680">i915#11680</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms:</p>
<ul>
<li>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16142/fi-kbl-x1275/igt@kms_flip@basic-flip-vs-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16142/fi-kbl-x1275/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17465">i915#17465</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16142/fi-kbl-x1275/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17466">i915#17466</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16142/fi-kbl-x1275/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17472">i915#17472</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc:</p>
<ul>
<li>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16142/fi-kbl-x1275/igt@kms_pipe_crc_basic@read-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190">i915#11190</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16142/fi-kbl-x1275/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17462">i915#17462</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16142/fi-kbl-x1275/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16142/fi-kbl-x1275/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17463">i915#17463</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16142/fi-kbl-x1275/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17467">i915#17467</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9189 -&gt; IGTPW_16142</li>
<li>Linux: CI_DRM_19508 -&gt; CI_DRM_19509</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19508: 4e611eca8b09c3d1e84cea736aa33f89a8321364 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_19509: ff450c62bc560177d72d0520f53ed445bbf704f6 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_16142: 16142<br />
  IGT_9189: 9189</p>

</body>
</html>

--===============6655047893832318443==--
