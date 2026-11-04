Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F124606A32E
	for <igt-dev@archiver.kernel.org>; Wed,  4 Nov 2026 17:41:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F00210E15D;
	Wed,  4 Nov 2026 17:41:50 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D60A10E285;
 Wed,  4 Nov 2026 17:40:51 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0913284415612078648=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Fbo=5Fshr?=
 =?utf-8?q?ink=3A_Add_a_user-space_shrinker_test_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 04 Nov 2026 17:40:51 -0000
Message-ID: <179381405104.118679.4242331557006797088@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261104163351.2417-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20261104163351.2417-1-thomas.hellstrom@linux.intel.com>
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

--===============0913284415612078648==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_bo_shrink: Add a user-space shrinker test (rev2)
URL   : https://patchwork.freedesktop.org/series/176563/
State : success

== Summary ==

CI Bug Log - changes from IGT_9177 -> IGTPW_16104
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16104/index.html

Participating hosts (40 -> 39)
------------------------------

  Missing    (1): bat-dg2-13 

Known issues
------------

  Here are the changes found in IGTPW_16104 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@sanitycheck:
    - bat-apl-1:          [PASS][1] -> [DMESG-WARN][2] ([i915#13735]) +77 other tests dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/bat-apl-1/igt@i915_selftest@live@sanitycheck.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16104/bat-apl-1/igt@i915_selftest@live@sanitycheck.html

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - bat-apl-1:          [PASS][3] -> [DMESG-WARN][4] ([i915#13735] / [i915#180]) +49 other tests dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/bat-apl-1/igt@kms_pm_rpm@basic-pci-d3-state.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16104/bat-apl-1/igt@kms_pm_rpm@basic-pci-d3-state.html

  
  [i915#13735]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735
  [i915#180]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9177 -> IGTPW_16104
  * Linux: CI_DRM_19443 -> CI_DRM_19444

  CI-20190529: 20190529
  CI_DRM_19443: d11bbfdac0f3d443b367857ffe683ae6bb80d560 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_19444: c0cb7e7c00c9563d72c1e1b08fac139a57fd0ebf @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_16104: 16104
  IGT_9177: 9177

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16104/index.html

--===============0913284415612078648==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_bo_shrink: Add a user-space shrinker test (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/176563/">https://patchwork.freedesktop.org/series/176563/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16104/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16104/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_9177 -&gt; IGTPW_16104</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16104/index.html</p>
<h2>Participating hosts (40 -&gt; 39)</h2>
<p>Missing    (1): bat-dg2-13 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_16104 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live@sanitycheck:</p>
<ul>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/bat-apl-1/igt@i915_selftest@live@sanitycheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16104/bat-apl-1/igt@i915_selftest@live@sanitycheck.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735">i915#13735</a>) +77 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9177/bat-apl-1/igt@kms_pm_rpm@basic-pci-d3-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16104/bat-apl-1/igt@kms_pm_rpm@basic-pci-d3-state.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735">i915#13735</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180">i915#180</a>) +49 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9177 -&gt; IGTPW_16104</li>
<li>Linux: CI_DRM_19443 -&gt; CI_DRM_19444</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19443: d11bbfdac0f3d443b367857ffe683ae6bb80d560 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_19444: c0cb7e7c00c9563d72c1e1b08fac139a57fd0ebf @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_16104: 16104<br />
  IGT_9177: 9177</p>

</body>
</html>

--===============0913284415612078648==--
