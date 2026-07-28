Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E03F8C53219
	for <igt-dev@archiver.kernel.org>; Tue, 28 Jul 2026 06:55:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88B7B10E532;
	Tue, 28 Jul 2026 06:55:10 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E0F010E532;
 Tue, 28 Jul 2026 06:54:35 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6321035681430981218=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_Add_platform-specific_joi?=
 =?utf-8?q?ner_exception_mode_handling_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sowmiya S" <sowmiya.s@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 28 Jul 2026 06:54:35 -0000
Message-ID: <178522167524.229568.7012852056756221633@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260728060003.392870-1-sowmiya.s@intel.com>
In-Reply-To: <20260728060003.392870-1-sowmiya.s@intel.com>
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

--===============6321035681430981218==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add platform-specific joiner exception mode handling (rev2)
URL   : https://patchwork.freedesktop.org/series/170996/
State : failure

== Summary ==

CI Bug Log - changes from IGT_9027 -> IGTPW_15597
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_15597 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_15597, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15597/index.html

Participating hosts (41 -> 38)
------------------------------

  Missing    (3): bat-dg2-13 fi-glk-j4005 fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_15597:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1:
    - bat-jsl-5:          [PASS][1] -> [ABORT][2] +1 other test abort
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9027/bat-jsl-5/igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15597/bat-jsl-5/igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1.html

  


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9027 -> IGTPW_15597
  * Linux: CI_DRM_18902 -> CI_DRM_18909

  CI-20190529: 20190529
  CI_DRM_18902: 3cbfb56ee0481aaabc9369045a4b120a20dfccc4 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_18909: 28e3f47d47a61b5e28e7566944479e9c9715d41d @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15597: 15597
  IGT_9027: 9027

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15597/index.html

--===============6321035681430981218==
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
<tr><td><b>Series:</b></td><td>Add platform-specific joiner exception mode handling (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/170996/">https://patchwork.freedesktop.org/series/170996/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15597/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15597/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_9027 -&gt; IGTPW_15597</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_15597 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_15597, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15597/index.html</p>
<h2>Participating hosts (41 -&gt; 38)</h2>
<p>Missing    (3): bat-dg2-13 fi-glk-j4005 fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_15597:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1:<ul>
<li>bat-jsl-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9027/bat-jsl-5/igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15597/bat-jsl-5/igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9027 -&gt; IGTPW_15597</li>
<li>Linux: CI_DRM_18902 -&gt; CI_DRM_18909</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18902: 3cbfb56ee0481aaabc9369045a4b120a20dfccc4 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_18909: 28e3f47d47a61b5e28e7566944479e9c9715d41d @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15597: 15597<br />
  IGT_9027: 9027</p>

</body>
</html>

--===============6321035681430981218==--
