Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8ACAC79FB7
	for <igt-dev@archiver.kernel.org>; Thu, 10 Sep 2026 00:41:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 754D510E222;
	Thu, 10 Sep 2026 00:41:44 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE5EC10E1A7;
 Thu, 10 Sep 2026 00:40:57 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4701672665812210665=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_lib/igt=5Famd=3A_improve_?=
 =?utf-8?q?link=5Fsettings_parser_for_old_kernel_compatibility?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: roman.li@amd.com
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 10 Sep 2026 00:40:57 -0000
Message-ID: <178900085790.144085.531248815663696421@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260909204408.936021-1-Roman.Li@amd.com>
In-Reply-To: <20260909204408.936021-1-Roman.Li@amd.com>
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

--===============4701672665812210665==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/igt_amd: improve link_settings parser for old kernel compatibility
URL   : https://patchwork.freedesktop.org/series/173745/
State : failure

== Summary ==

CI Bug Log - changes from IGT_9088 -> IGTPW_15821
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_15821 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_15821, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15821/index.html

Participating hosts (39 -> 38)
------------------------------

  Missing    (1): bat-dg2-13 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_15821:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_busy@basic:
    - fi-skl-6600u:       [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9088/fi-skl-6600u/igt@kms_busy@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15821/fi-skl-6600u/igt@kms_busy@basic.html

  * igt@kms_flip@basic-flip-vs-dpms@b-dp1:
    - bat-rpls-4:         [PASS][3] -> [INCOMPLETE][4] +1 other test incomplete
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9088/bat-rpls-4/igt@kms_flip@basic-flip-vs-dpms@b-dp1.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15821/bat-rpls-4/igt@kms_flip@basic-flip-vs-dpms@b-dp1.html

  
Known issues
------------

  Here are the changes found in IGTPW_15821 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_busy@basic@modeset:
    - fi-skl-6600u:       [PASS][5] -> [INCOMPLETE][6] ([i915#10056])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9088/fi-skl-6600u/igt@kms_busy@basic@modeset.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15821/fi-skl-6600u/igt@kms_busy@basic@modeset.html

  
  [i915#10056]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10056


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9088 -> IGTPW_15821
  * Linux: CI_DRM_19108 -> CI_DRM_19115

  CI-20190529: 20190529
  CI_DRM_19108: dd822035c9dcd89e47cbfa75da6f3119617fbada @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_19115: a3a7d02f33d6dacc90d1cc9d0e3c2fa8f3d4611d @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15821: 15821
  IGT_9088: 55a88d20e327d5c440cd3f3d661684fb83f29027 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15821/index.html

--===============4701672665812210665==
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
<tr><td><b>Series:</b></td><td>lib/igt_amd: improve link_settings parser for old kernel compatibility</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/173745/">https://patchwork.freedesktop.org/series/173745/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15821/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15821/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_9088 -&gt; IGTPW_15821</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_15821 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_15821, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15821/index.html</p>
<h2>Participating hosts (39 -&gt; 38)</h2>
<p>Missing    (1): bat-dg2-13 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_15821:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_busy@basic:</p>
<ul>
<li>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9088/fi-skl-6600u/igt@kms_busy@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15821/fi-skl-6600u/igt@kms_busy@basic.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@b-dp1:</p>
<ul>
<li>bat-rpls-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9088/bat-rpls-4/igt@kms_flip@basic-flip-vs-dpms@b-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15821/bat-rpls-4/igt@kms_flip@basic-flip-vs-dpms@b-dp1.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_15821 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_busy@basic@modeset:<ul>
<li>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9088/fi-skl-6600u/igt@kms_busy@basic@modeset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15821/fi-skl-6600u/igt@kms_busy@basic@modeset.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10056">i915#10056</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9088 -&gt; IGTPW_15821</li>
<li>Linux: CI_DRM_19108 -&gt; CI_DRM_19115</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19108: dd822035c9dcd89e47cbfa75da6f3119617fbada @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_19115: a3a7d02f33d6dacc90d1cc9d0e3c2fa8f3d4611d @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15821: 15821<br />
  IGT_9088: 55a88d20e327d5c440cd3f3d661684fb83f29027 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============4701672665812210665==--
