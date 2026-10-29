Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 271D3606A31A
	for <igt-dev@archiver.kernel.org>; Thu, 29 Oct 2026 16:26:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF1D910E152;
	Thu, 29 Oct 2026 16:26:54 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 054F810E43C;
 Thu, 29 Oct 2026 16:26:00 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0774796614086162030=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_Xe3P_GPU_Error_Injection_?=
 =?utf-8?q?Test_Suite_with_DRM_RAS_Netlink_Support_=28rev9=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ravi Kishore Koppuravuri" <ravi.kishore.koppuravuri@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 29 Oct 2026 16:26:00 -0000
Message-ID: <179329116001.89899.1598532373492317824@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261029085955.1232163-1-ravi.kishore.koppuravuri@intel.com>
In-Reply-To: <20261029085955.1232163-1-ravi.kishore.koppuravuri@intel.com>
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
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============0774796614086162030==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Xe3P GPU Error Injection Test Suite with DRM RAS Netlink Support (rev9)
URL   : https://patchwork.freedesktop.org/series/171275/
State : success

== Summary ==

CI Bug Log - changes from IGT_9171 -> IGTPW_16070
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16070/index.html

Participating hosts (39 -> 39)
------------------------------

  Additional (1): fi-bsw-nick 
  Missing    (1): bat-dg2-13 

Known issues
------------

  Here are the changes found in IGTPW_16070 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@info:
    - fi-bsw-nick:        NOTRUN -> [SKIP][1] ([i915#1849])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16070/fi-bsw-nick/igt@fbdev@info.html

  * igt@fbdev@read:
    - fi-bsw-nick:        NOTRUN -> [SKIP][2] ([i915#17464]) +3 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16070/fi-bsw-nick/igt@fbdev@read.html

  * igt@gem_huc_copy@huc-copy:
    - fi-bsw-nick:        NOTRUN -> [SKIP][3] ([i915#17468])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16070/fi-bsw-nick/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - fi-bsw-nick:        NOTRUN -> [SKIP][4] ([i915#11671]) +3 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16070/fi-bsw-nick/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@intel_hwmon@hwmon-write:
    - fi-bsw-nick:        NOTRUN -> [SKIP][5] ([i915#11680]) +1 other test skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16070/fi-bsw-nick/igt@intel_hwmon@hwmon-write.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - fi-bsw-nick:        NOTRUN -> [SKIP][6] ([i915#17469])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16070/fi-bsw-nick/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - fi-bsw-nick:        NOTRUN -> [SKIP][7] ([i915#3637]) +3 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16070/fi-bsw-nick/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_force_connector_basic@force-load-detect:
    - fi-bsw-nick:        NOTRUN -> [SKIP][8] ([i915#17465])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16070/fi-bsw-nick/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_frontbuffer_tracking@basic:
    - fi-bsw-nick:        NOTRUN -> [SKIP][9] ([i915#17466])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16070/fi-bsw-nick/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence:
    - fi-bsw-nick:        NOTRUN -> [SKIP][10] ([i915#11190]) +16 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16070/fi-bsw-nick/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html

  * igt@kms_pm_backlight@basic-brightness:
    - fi-bsw-nick:        NOTRUN -> [SKIP][11] ([i915#17462])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16070/fi-bsw-nick/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - fi-bsw-nick:        NOTRUN -> [SKIP][12] ([i915#9732]) +3 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16070/fi-bsw-nick/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - fi-bsw-nick:        NOTRUN -> [SKIP][13] ([i915#17463])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16070/fi-bsw-nick/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@prime_vgem@basic-fence-flip:
    - fi-bsw-nick:        NOTRUN -> [SKIP][14] ([i915#17467])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16070/fi-bsw-nick/igt@prime_vgem@basic-fence-flip.html

  
#### Possible fixes ####

  * igt@kms_pm_rpm@basic-rte:
    - bat-rpls-4:         [DMESG-WARN][15] ([i915#13400]) -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9171/bat-rpls-4/igt@kms_pm_rpm@basic-rte.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16070/bat-rpls-4/igt@kms_pm_rpm@basic-rte.html

  
  [i915#11190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190
  [i915#11671]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11671
  [i915#11680]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11680
  [i915#13400]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13400
  [i915#17462]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17462
  [i915#17463]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17463
  [i915#17464]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17464
  [i915#17465]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17465
  [i915#17466]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17466
  [i915#17467]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17467
  [i915#17468]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17468
  [i915#17469]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17469
  [i915#1849]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849
  [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9171 -> IGTPW_16070

  CI-20190529: 20190529
  CI_DRM_19415: e650cd4c5bd5d3b068ed7a1eb3c55cde4386b355 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_16070: 16070
  IGT_9171: 9171

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16070/index.html

--===============0774796614086162030==
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
<tr><td><b>Series:</b></td><td>Xe3P GPU Error Injection Test Suite with DRM RAS Netlink Support (rev9)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/171275/">https://patchwork.freedesktop.org/series/171275/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16070/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16070/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_9171 -&gt; IGTPW_16070</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16070/index.html</p>
<h2>Participating hosts (39 -&gt; 39)</h2>
<p>Additional (1): fi-bsw-nick <br />
  Missing    (1): bat-dg2-13 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_16070 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16070/fi-bsw-nick/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16070/fi-bsw-nick/igt@fbdev@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17464">i915#17464</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16070/fi-bsw-nick/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17468">i915#17468</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16070/fi-bsw-nick/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11671">i915#11671</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16070/fi-bsw-nick/igt@intel_hwmon@hwmon-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11680">i915#11680</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16070/fi-bsw-nick/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17469">i915#17469</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16070/fi-bsw-nick/igt@kms_flip@basic-flip-vs-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16070/fi-bsw-nick/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17465">i915#17465</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16070/fi-bsw-nick/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17466">i915#17466</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence:</p>
<ul>
<li>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16070/fi-bsw-nick/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190">i915#11190</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16070/fi-bsw-nick/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17462">i915#17462</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16070/fi-bsw-nick/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16070/fi-bsw-nick/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17463">i915#17463</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16070/fi-bsw-nick/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17467">i915#17467</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_pm_rpm@basic-rte:<ul>
<li>bat-rpls-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9171/bat-rpls-4/igt@kms_pm_rpm@basic-rte.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13400">i915#13400</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16070/bat-rpls-4/igt@kms_pm_rpm@basic-rte.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9171 -&gt; IGTPW_16070</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19415: e650cd4c5bd5d3b068ed7a1eb3c55cde4386b355 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_16070: 16070<br />
  IGT_9171: 9171</p>

</body>
</html>

--===============0774796614086162030==--
