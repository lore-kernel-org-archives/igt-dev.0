Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E0C606A324
	for <igt-dev@archiver.kernel.org>; Wed, 11 Nov 2026 15:42:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20FE010F856;
	Wed, 11 Nov 2026 15:42:08 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1E7910F856;
 Wed, 11 Nov 2026 15:41:12 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0853591385345539779=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_tests/intel/i915=5Fpm=5Fr?=
 =?utf-8?q?pm=3A_Print_reason_for_skipping_PC8_subtest_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Hiresh Kumar Yadav" <hiresh.kumar.yadav@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 11 Nov 2026 15:41:12 -0000
Message-ID: <179441167278.10308.9237770251513682092@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261111100742.1983913-1-hiresh.kumar.yadav@intel.com>
In-Reply-To: <20261111100742.1983913-1-hiresh.kumar.yadav@intel.com>
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

--===============0853591385345539779==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/i915_pm_rpm: Print reason for skipping PC8 subtest (rev3)
URL   : https://patchwork.freedesktop.org/series/177832/
State : success

== Summary ==

CI Bug Log - changes from IGT_9186 -> IGTPW_16134
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/index.html

Participating hosts (40 -> 39)
------------------------------

  Missing    (1): bat-dg2-13 

Known issues
------------

  Here are the changes found in IGTPW_16134 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@info:
    - fi-hsw-4770:        [PASS][1] -> [SKIP][2] ([i915#1849] / [i915#2582])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9186/fi-hsw-4770/igt@fbdev@info.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/fi-hsw-4770/igt@fbdev@info.html

  * igt@fbdev@nullptr:
    - fi-hsw-4770:        [PASS][3] -> [SKIP][4] ([i915#2582]) +3 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9186/fi-hsw-4770/igt@fbdev@nullptr.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/fi-hsw-4770/igt@fbdev@nullptr.html

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - bat-rpls-4:         [PASS][5] -> [DMESG-WARN][6] ([i915#13400])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9186/bat-rpls-4/igt@kms_pm_rpm@basic-pci-d3-state.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/bat-rpls-4/igt@kms_pm_rpm@basic-pci-d3-state.html

  
#### Possible fixes ####

  * igt@vgem_basic@unload:
    - bat-rpls-4:         [DMESG-WARN][7] ([i915#13400]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9186/bat-rpls-4/igt@vgem_basic@unload.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/bat-rpls-4/igt@vgem_basic@unload.html

  
  [i915#13400]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13400
  [i915#1849]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849
  [i915#2582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9186 -> IGTPW_16134
  * Linux: CI_DRM_19484 -> CI_DRM_19493

  CI-20190529: 20190529
  CI_DRM_19484: c8d0fb6110b86aa64eb59502df08b529e221f232 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_19493: 1434742f20cf3d14b493e40c453536b5414b9762 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_16134: 50e6445e73fd7050afd90c18ac26d57f8d0838e7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9186: 9186

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/index.html

--===============0853591385345539779==
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
<tr><td><b>Series:</b></td><td>tests/intel/i915_pm_rpm: Print reason for skipping PC8 subtest (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/177832/">https://patchwork.freedesktop.org/series/177832/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_9186 -&gt; IGTPW_16134</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/index.html</p>
<h2>Participating hosts (40 -&gt; 39)</h2>
<p>Missing    (1): bat-dg2-13 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_16134 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9186/fi-hsw-4770/igt@fbdev@info.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/fi-hsw-4770/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582">i915#2582</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9186/fi-hsw-4770/igt@fbdev@nullptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/fi-hsw-4770/igt@fbdev@nullptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582">i915#2582</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>bat-rpls-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9186/bat-rpls-4/igt@kms_pm_rpm@basic-pci-d3-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/bat-rpls-4/igt@kms_pm_rpm@basic-pci-d3-state.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13400">i915#13400</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@vgem_basic@unload:<ul>
<li>bat-rpls-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9186/bat-rpls-4/igt@vgem_basic@unload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13400">i915#13400</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16134/bat-rpls-4/igt@vgem_basic@unload.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9186 -&gt; IGTPW_16134</li>
<li>Linux: CI_DRM_19484 -&gt; CI_DRM_19493</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19484: c8d0fb6110b86aa64eb59502df08b529e221f232 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_19493: 1434742f20cf3d14b493e40c453536b5414b9762 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_16134: 50e6445e73fd7050afd90c18ac26d57f8d0838e7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9186: 9186</p>

</body>
</html>

--===============0853591385345539779==--
