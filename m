Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32EB3606A321
	for <igt-dev@archiver.kernel.org>; Thu, 12 Nov 2026 07:36:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7D5210E9F3;
	Thu, 12 Nov 2026 07:36:08 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 096B810E523;
 Thu, 12 Nov 2026 07:35:12 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6842872586596723961=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_imagination=3A_Add_Firmwa?=
 =?utf-8?q?re_information_query_test_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Brajesh Gupta" <brajesh.gupta@imgtec.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 12 Nov 2026 07:35:12 -0000
Message-ID: <179446891203.13845.13886500337481869490@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261112-b4-fw_info-v3-0-70d20bd7bc28@imgtec.com>
In-Reply-To: <20261112-b4-fw_info-v3-0-70d20bd7bc28@imgtec.com>
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

--===============6842872586596723961==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: imagination: Add Firmware information query test (rev2)
URL   : https://patchwork.freedesktop.org/series/178265/
State : failure

== Summary ==

CI Bug Log - changes from IGT_9187 -> IGTPW_16141
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_16141 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_16141, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16141/index.html

Participating hosts (40 -> 39)
------------------------------

  Missing    (1): bat-dg2-13 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_16141:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live@gt_mocs:
    - bat-twl-2:          [PASS][1] -> [DMESG-WARN][2] +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9187/bat-twl-2/igt@i915_selftest@live@gt_mocs.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16141/bat-twl-2/igt@i915_selftest@live@gt_mocs.html

  
Known issues
------------

  Here are the changes found in IGTPW_16141 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@vgem_basic@unload:
    - bat-rpls-4:         [PASS][3] -> [DMESG-WARN][4] ([i915#13400])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9187/bat-rpls-4/igt@vgem_basic@unload.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16141/bat-rpls-4/igt@vgem_basic@unload.html

  
#### Possible fixes ####

  * igt@i915_selftest@live:
    - bat-adlp-9:         [DMESG-WARN][5] ([i915#17796]) -> [PASS][6] +1 other test pass
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9187/bat-adlp-9/igt@i915_selftest@live.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16141/bat-adlp-9/igt@i915_selftest@live.html

  
  [i915#13400]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13400
  [i915#17796]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17796


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9187 -> IGTPW_16141
  * Linux: CI_DRM_19498 -> CI_DRM_19499

  CI-20190529: 20190529
  CI_DRM_19498: f40cc5e715fe9e7a5e61f7cd44f63f68c1625f2c @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_19499: 38b6109d22c80ecef2229981ccb7a0a1ac22c329 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_16141: 16141
  IGT_9187: 9187

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16141/index.html

--===============6842872586596723961==
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
<tr><td><b>Series:</b></td><td>imagination: Add Firmware information query test (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/178265/">https://patchwork.freedesktop.org/series/178265/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16141/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16141/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_9187 -&gt; IGTPW_16141</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_16141 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_16141, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16141/index.html</p>
<h2>Participating hosts (40 -&gt; 39)</h2>
<p>Missing    (1): bat-dg2-13 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_16141:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_selftest@live@gt_mocs:<ul>
<li>bat-twl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9187/bat-twl-2/igt@i915_selftest@live@gt_mocs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16141/bat-twl-2/igt@i915_selftest@live@gt_mocs.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_16141 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@vgem_basic@unload:<ul>
<li>bat-rpls-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9187/bat-rpls-4/igt@vgem_basic@unload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16141/bat-rpls-4/igt@vgem_basic@unload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13400">i915#13400</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live:<ul>
<li>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9187/bat-adlp-9/igt@i915_selftest@live.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17796">i915#17796</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16141/bat-adlp-9/igt@i915_selftest@live.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9187 -&gt; IGTPW_16141</li>
<li>Linux: CI_DRM_19498 -&gt; CI_DRM_19499</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19498: f40cc5e715fe9e7a5e61f7cd44f63f68c1625f2c @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_19499: 38b6109d22c80ecef2229981ccb7a0a1ac22c329 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_16141: 16141<br />
  IGT_9187: 9187</p>

</body>
</html>

--===============6842872586596723961==--
