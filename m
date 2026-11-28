Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 700E4606A31C
	for <igt-dev@archiver.kernel.org>; Sat, 28 Nov 2026 01:53:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A8B710E688;
	Sat, 28 Nov 2026 01:53:58 +0000 (UTC)
Received: from 8b00d9f022d5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CC9C10E688;
 Sat, 28 Nov 2026 01:52:56 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2495170017438394703=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_series_starting_with_=5Bi?=
 =?utf-8?q?-g-t=2C1/9=5D_lib/igt=5Fdrm=5Fras=5Fnl=3A_Add_node_and_error_coun?=
 =?utf-8?q?ter_listing?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sat, 28 Nov 2026 01:52:56 -0000
Message-ID: <179583077624.3164.12117986539126317021@8b00d9f022d5>
X-Patchwork-Hint: ignore
References: <20261127181133.801215-10-rodrigo.vivi@intel.com>
In-Reply-To: <20261127181133.801215-10-rodrigo.vivi@intel.com>
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

--===============2495170017438394703==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,1/9] lib/igt_drm_ras_nl: Add node and error counter listing
URL   : https://patchwork.freedesktop.org/series/179900/
State : failure

== Summary ==

CI Bug Log - changes from IGT_9210 -> IGTPW_16237
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_16237 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_16237, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16237/index.html

Participating hosts (40 -> 39)
------------------------------

  Missing    (1): bat-dg2-13 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_16237:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live:
    - fi-bsw-nick:        [PASS][1] -> [ABORT][2] +1 other test abort
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9210/fi-bsw-nick/igt@i915_selftest@live.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16237/fi-bsw-nick/igt@i915_selftest@live.html

  
Known issues
------------

  Here are the changes found in IGTPW_16237 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_pm_rpm@module-reload:
    - bat-arls-6:         [PASS][3] -> [SKIP][4] ([i915#17751])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9210/bat-arls-6/igt@i915_pm_rpm@module-reload.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16237/bat-arls-6/igt@i915_pm_rpm@module-reload.html
    - bat-arls-5:         [PASS][5] -> [SKIP][6] ([i915#17751])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9210/bat-arls-5/igt@i915_pm_rpm@module-reload.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16237/bat-arls-5/igt@i915_pm_rpm@module-reload.html
    - bat-jsl-5:          [PASS][7] -> [FAIL][8] ([i915#17751])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9210/bat-jsl-5/igt@i915_pm_rpm@module-reload.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16237/bat-jsl-5/igt@i915_pm_rpm@module-reload.html

  * igt@vgem_basic@unload:
    - bat-rpls-4:         [PASS][9] -> [DMESG-WARN][10] ([i915#13400])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9210/bat-rpls-4/igt@vgem_basic@unload.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16237/bat-rpls-4/igt@vgem_basic@unload.html

  
  [i915#13400]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13400
  [i915#17751]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17751


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9210 -> IGTPW_16237
  * Linux: CI_DRM_19626 -> CI_DRM_19627

  CI-20190529: 20190529
  CI_DRM_19626: 994d8de7b77818fa55d1b7fc0a06dfd8eff8a595 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_19627: e6fdf86e5b6ee6e33eaa2872df4b64d3ee991138 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_16237: 16237
  IGT_9210: 9210

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16237/index.html

--===============2495170017438394703==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,1/9] lib/igt_drm_ras_nl: Add node and error counter listing</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/179900/">https://patchwork.freedesktop.org/series/179900/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16237/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16237/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_9210 -&gt; IGTPW_16237</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_16237 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_16237, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16237/index.html</p>
<h2>Participating hosts (40 -&gt; 39)</h2>
<p>Missing    (1): bat-dg2-13 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_16237:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_selftest@live:<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9210/fi-bsw-nick/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16237/fi-bsw-nick/igt@i915_selftest@live.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_16237 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>bat-arls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9210/bat-arls-6/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16237/bat-arls-6/igt@i915_pm_rpm@module-reload.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17751">i915#17751</a>)</li>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9210/bat-arls-5/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16237/bat-arls-5/igt@i915_pm_rpm@module-reload.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17751">i915#17751</a>)</li>
<li>bat-jsl-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9210/bat-jsl-5/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16237/bat-jsl-5/igt@i915_pm_rpm@module-reload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17751">i915#17751</a>)</li>
</ul>
</li>
<li>
<p>igt@vgem_basic@unload:</p>
<ul>
<li>bat-rpls-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9210/bat-rpls-4/igt@vgem_basic@unload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16237/bat-rpls-4/igt@vgem_basic@unload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13400">i915#13400</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9210 -&gt; IGTPW_16237</li>
<li>Linux: CI_DRM_19626 -&gt; CI_DRM_19627</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19626: 994d8de7b77818fa55d1b7fc0a06dfd8eff8a595 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_19627: e6fdf86e5b6ee6e33eaa2872df4b64d3ee991138 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_16237: 16237<br />
  IGT_9210: 9210</p>

</body>
</html>

--===============2495170017438394703==--
