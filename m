Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C92F760A2605
	for <igt-dev@archiver.kernel.org>; Tue, 10 Nov 2026 01:21:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7964810E5E7;
	Tue, 10 Nov 2026 01:21:39 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21CB910E5E7;
 Tue, 10 Nov 2026 01:20:44 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3828184753673881620=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_tests/intel/kms=5Flink=5F?=
 =?utf-8?q?m=5Fn=3A_Add_DisplayPort_Link_M/N_ratio_validation_tests_=28rev2?=
 =?utf-8?q?=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Naladala Ramanaidu" <ramanaidu.naladala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 10 Nov 2026 01:20:44 -0000
Message-ID: <179427364412.12.1278921262784351945@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261016180358.2224883-1-ramanaidu.naladala@intel.com>
In-Reply-To: <20261016180358.2224883-1-ramanaidu.naladala@intel.com>
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

--===============3828184753673881620==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/kms_link_m_n: Add DisplayPort Link M/N ratio validation tests (rev2)
URL   : https://patchwork.freedesktop.org/series/176310/
State : success

== Summary ==

CI Bug Log - changes from IGT_9182 -> IGTPW_16122
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16122/index.html

Participating hosts (40 -> 38)
------------------------------

  Missing    (2): bat-dg2-13 bat-adls-6 

Known issues
------------

  Here are the changes found in IGTPW_16122 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_pm_rpm@module-reload:
    - fi-tgl-1115g4:      [PASS][1] -> [FAIL][2] ([i915#17751])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9182/fi-tgl-1115g4/igt@i915_pm_rpm@module-reload.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16122/fi-tgl-1115g4/igt@i915_pm_rpm@module-reload.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@vma:
    - bat-mtlp-9:         [INCOMPLETE][3] ([i915#16229]) -> [PASS][4] +1 other test pass
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9182/bat-mtlp-9/igt@i915_selftest@live@vma.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16122/bat-mtlp-9/igt@i915_selftest@live@vma.html

  
  [i915#16229]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16229
  [i915#17751]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17751


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9182 -> IGTPW_16122
  * Linux: CI_DRM_19475 -> CI_DRM_19477

  CI-20190529: 20190529
  CI_DRM_19475: d72707a042b6aff601449a9cf87e5fe55decbc5c @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_19477: 808930035a8f606c1e19906bf8f2704b77c08e27 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_16122: 16122
  IGT_9182: 9182

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16122/index.html

--===============3828184753673881620==
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
<tr><td><b>Series:</b></td><td>tests/intel/kms_link_m_n: Add DisplayPort Link M/N ratio validation tests (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/176310/">https://patchwork.freedesktop.org/series/176310/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16122/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16122/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_9182 -&gt; IGTPW_16122</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16122/index.html</p>
<h2>Participating hosts (40 -&gt; 38)</h2>
<p>Missing    (2): bat-dg2-13 bat-adls-6 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_16122 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@i915_pm_rpm@module-reload:<ul>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9182/fi-tgl-1115g4/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16122/fi-tgl-1115g4/igt@i915_pm_rpm@module-reload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17751">i915#17751</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live@vma:<ul>
<li>bat-mtlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9182/bat-mtlp-9/igt@i915_selftest@live@vma.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16229">i915#16229</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16122/bat-mtlp-9/igt@i915_selftest@live@vma.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9182 -&gt; IGTPW_16122</li>
<li>Linux: CI_DRM_19475 -&gt; CI_DRM_19477</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19475: d72707a042b6aff601449a9cf87e5fe55decbc5c @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_19477: 808930035a8f606c1e19906bf8f2704b77c08e27 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_16122: 16122<br />
  IGT_9182: 9182</p>

</body>
</html>

--===============3828184753673881620==--
