Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5A46D3A67B
	for <igt-dev@archiver.kernel.org>; Tue, 29 Oct 2024 18:54:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FC4A10E6DB;
	Tue, 29 Oct 2024 18:54:33 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D87A10E6DD;
 Tue, 29 Oct 2024 18:54:32 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7945375661088786139=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBAT=3A_failure_for_tests/kms=5Frotation=5Fcrc?=
 =?utf-8?q?=3A_Intel_display_version_20_onwards_doesn=27t_do_hflip_with_tile?=
 =?utf-8?q?4_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Juha-Pekka Heikkila" <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 29 Oct 2024 18:54:32 -0000
Message-ID: <173022807257.1361175.13074876894961671090@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241022094744.3884409-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20241022094744.3884409-1-juhapekka.heikkila@gmail.com>
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

--===============7945375661088786139==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_rotation_crc: Intel display version 20 onwards doesn't do hflip with tile4 (rev4)
URL   : https://patchwork.freedesktop.org/series/140302/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8087 -> IGTPW_11996
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_11996 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_11996, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11996/index.html

Participating hosts (47 -> 46)
------------------------------

  Missing    (1): fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_11996:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live:
    - fi-ivb-3770:        [PASS][1] -> [INCOMPLETE][2] +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8087/fi-ivb-3770/igt@i915_selftest@live.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11996/fi-ivb-3770/igt@i915_selftest@live.html

  
Known issues
------------

  Here are the changes found in IGTPW_11996 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live:
    - bat-dg2-11:         [PASS][3] -> [ABORT][4] ([i915#12133])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8087/bat-dg2-11/igt@i915_selftest@live.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11996/bat-dg2-11/igt@i915_selftest@live.html

  * igt@i915_selftest@live@sanitycheck:
    - bat-dg2-11:         [PASS][5] -> [ABORT][6] ([i915#12305])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8087/bat-dg2-11/igt@i915_selftest@live@sanitycheck.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11996/bat-dg2-11/igt@i915_selftest@live@sanitycheck.html

  
  [i915#12133]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12133
  [i915#12305]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12305


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8087 -> IGTPW_11996
  * Linux: CI_DRM_15604 -> CI_DRM_15605

  CI-20190529: 20190529
  CI_DRM_15604: 738c18d8599dce736da8b6958f96d2eac08a36ab @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_15605: 95fd9af8bb5389f9b5a639d567ef5c3e43e25682 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_11996: c76d55db99a5178aa02aa587b3f968635a2b5642 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8087: 7abd9c49a49a9ff1f3300d7c51a92a5af8a789f1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11996/index.html

--===============7945375661088786139==
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
<tr><td><b>Series:</b></td><td>tests/kms_rotation_crc: Intel display version 20 onwards doesn&#x27;t do hflip with tile4 (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/140302/">https://patchwork.freedesktop.org/series/140302/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11996/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11996/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8087 -&gt; IGTPW_11996</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_11996 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_11996, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11996/index.html</p>
<h2>Participating hosts (47 -&gt; 46)</h2>
<p>Missing    (1): fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_11996:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_selftest@live:<ul>
<li>fi-ivb-3770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8087/fi-ivb-3770/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11996/fi-ivb-3770/igt@i915_selftest@live.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11996 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8087/bat-dg2-11/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11996/bat-dg2-11/igt@i915_selftest@live.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12133">i915#12133</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@sanitycheck:</p>
<ul>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8087/bat-dg2-11/igt@i915_selftest@live@sanitycheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11996/bat-dg2-11/igt@i915_selftest@live@sanitycheck.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12305">i915#12305</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8087 -&gt; IGTPW_11996</li>
<li>Linux: CI_DRM_15604 -&gt; CI_DRM_15605</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_15604: 738c18d8599dce736da8b6958f96d2eac08a36ab @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_15605: 95fd9af8bb5389f9b5a639d567ef5c3e43e25682 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_11996: c76d55db99a5178aa02aa587b3f968635a2b5642 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8087: 7abd9c49a49a9ff1f3300d7c51a92a5af8a789f1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============7945375661088786139==--
