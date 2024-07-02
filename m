Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2B73C30658
	for <igt-dev@archiver.kernel.org>; Tue,  2 Jul 2024 19:46:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F33410E676;
	Tue,  2 Jul 2024 19:46:44 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90D2110E676;
 Tue,  2 Jul 2024 19:46:42 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1538088646715714080=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBAT=3A_failure_for_lib=3A_igt=5Ffb/rendercopy_?=
 =?utf-8?q?fixes/cleanups_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?b?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 02 Jul 2024 19:46:42 -0000
Message-ID: <171994960257.21226.5300439045966257280@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240625174032.10398-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20240625174032.10398-1-ville.syrjala@linux.intel.com>
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

--===============1538088646715714080==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib: igt_fb/rendercopy fixes/cleanups (rev5)
URL   : https://patchwork.freedesktop.org/series/135374/
State : failure

== Summary ==

CI Bug Log - changes from IGT_7910 -> IGTPW_11350
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_11350 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_11350, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11350/index.html

Participating hosts (41 -> 39)
------------------------------

  Additional (1): fi-elk-e7500 
  Missing    (3): bat-kbl-2 fi-snb-2520m bat-jsl-3 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_11350:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live@memory_region:
    - bat-arls-2:         NOTRUN -> [DMESG-WARN][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11350/bat-arls-2/igt@i915_selftest@live@memory_region.html

  
Known issues
------------

  Here are the changes found in IGTPW_11350 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - fi-elk-e7500:       NOTRUN -> [SKIP][2] +24 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11350/fi-elk-e7500/igt@kms_pm_rpm@basic-pci-d3-state.html

  
#### Possible fixes ####

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-dp-1:
    - bat-dg2-8:          [FAIL][3] ([i915#11379]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7910/bat-dg2-8/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-dp-1.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11350/bat-dg2-8/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-dp-1.html

  
  [i915#11379]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11379


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7910 -> IGTPW_11350

  CI-20190529: 20190529
  CI_DRM_15013: 0318a12ff6fb8c321458aa2b373e9322896ee951 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_11350: 11350
  IGT_7910: f61ff748b6f615e43668ddd4fee67d2ad2f52e75 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11350/index.html

--===============1538088646715714080==
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
<tr><td><b>Series:</b></td><td>lib: igt_fb/rendercopy fixes/cleanups (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/135374/">https://patchwork.freedesktop.org/series/135374/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11350/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11350/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7910 -&gt; IGTPW_11350</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_11350 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_11350, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11350/index.html</p>
<h2>Participating hosts (41 -&gt; 39)</h2>
<p>Additional (1): fi-elk-e7500 <br />
  Missing    (3): bat-kbl-2 fi-snb-2520m bat-jsl-3 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_11350:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_selftest@live@memory_region:<ul>
<li>bat-arls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11350/bat-arls-2/igt@i915_selftest@live@memory_region.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11350 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_pm_rpm@basic-pci-d3-state:<ul>
<li>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11350/fi-elk-e7500/igt@kms_pm_rpm@basic-pci-d3-state.html">SKIP</a> +24 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-dp-1:<ul>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7910/bat-dg2-8/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-dp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11379">i915#11379</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11350/bat-dg2-8/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-dp-1.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7910 -&gt; IGTPW_11350</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_15013: 0318a12ff6fb8c321458aa2b373e9322896ee951 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_11350: 11350<br />
  IGT_7910: f61ff748b6f615e43668ddd4fee67d2ad2f52e75 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============1538088646715714080==--
