Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7FB2C982ED
	for <igt-dev@archiver.kernel.org>; Mon, 21 Sep 2026 20:36:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BAC510EAC6;
	Mon, 21 Sep 2026 20:36:08 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7F8710EAC6;
 Mon, 21 Sep 2026 20:35:22 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3996773994836083973=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_lib/igt=5Fcore=3A_Make_bu?=
 =?utf-8?q?ild_reproducible_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kamil Konieczny" <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 21 Sep 2026 20:35:22 -0000
Message-ID: <179002292294.188435.348951557947320157@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260921135515.137949-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20260921135515.137949-1-kamil.konieczny@linux.intel.com>
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

--===============3996773994836083973==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/igt_core: Make build reproducible (rev5)
URL   : https://patchwork.freedesktop.org/series/173723/
State : failure

== Summary ==

CI Bug Log - changes from IGT_9104 -> IGTPW_15874
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_15874 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_15874, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15874/index.html

Participating hosts (39 -> 38)
------------------------------

  Missing    (1): bat-dg2-13 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_15874:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live@reset:
    - bat-twl-2:          [PASS][1] -> [ABORT][2] +1 other test abort
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9104/bat-twl-2/igt@i915_selftest@live@reset.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15874/bat-twl-2/igt@i915_selftest@live@reset.html

  
Known issues
------------

  Here are the changes found in IGTPW_15874 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@too-high:
    - bat-apl-1:          [PASS][3] -> [DMESG-WARN][4] ([i915#13735]) +37 other tests dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9104/bat-apl-1/igt@kms_addfb_basic@too-high.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15874/bat-apl-1/igt@kms_addfb_basic@too-high.html

  * igt@kms_flip@basic-flip-vs-modeset@c-dp1:
    - bat-apl-1:          [PASS][5] -> [DMESG-WARN][6] ([i915#13735] / [i915#180]) +21 other tests dmesg-warn
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9104/bat-apl-1/igt@kms_flip@basic-flip-vs-modeset@c-dp1.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15874/bat-apl-1/igt@kms_flip@basic-flip-vs-modeset@c-dp1.html

  
  [i915#13735]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735
  [i915#180]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9104 -> IGTPW_15874
  * Linux: CI_DRM_19193 -> CI_DRM_19195

  CI-20190529: 20190529
  CI_DRM_19193: ab82471ddff094939d9981e0647332562c7e1c9b @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_19195: 42735b6937d60963dd302128231fb74a18164a60 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15874: 6652228e6112eff7ccbb18f5985b9a1413dd29e3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9104: a89d58dad0dd62228269a6049b39fc39ae6cf698 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15874/index.html

--===============3996773994836083973==
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
<tr><td><b>Series:</b></td><td>lib/igt_core: Make build reproducible (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/173723/">https://patchwork.freedesktop.org/series/173723/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15874/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15874/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_9104 -&gt; IGTPW_15874</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_15874 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_15874, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15874/index.html</p>
<h2>Participating hosts (39 -&gt; 38)</h2>
<p>Missing    (1): bat-dg2-13 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_15874:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_selftest@live@reset:<ul>
<li>bat-twl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9104/bat-twl-2/igt@i915_selftest@live@reset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15874/bat-twl-2/igt@i915_selftest@live@reset.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_15874 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@too-high:</p>
<ul>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9104/bat-apl-1/igt@kms_addfb_basic@too-high.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15874/bat-apl-1/igt@kms_addfb_basic@too-high.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735">i915#13735</a>) +37 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@c-dp1:</p>
<ul>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9104/bat-apl-1/igt@kms_flip@basic-flip-vs-modeset@c-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15874/bat-apl-1/igt@kms_flip@basic-flip-vs-modeset@c-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735">i915#13735</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180">i915#180</a>) +21 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9104 -&gt; IGTPW_15874</li>
<li>Linux: CI_DRM_19193 -&gt; CI_DRM_19195</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19193: ab82471ddff094939d9981e0647332562c7e1c9b @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_19195: 42735b6937d60963dd302128231fb74a18164a60 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15874: 6652228e6112eff7ccbb18f5985b9a1413dd29e3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9104: a89d58dad0dd62228269a6049b39fc39ae6cf698 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============3996773994836083973==--
