Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C604C10F1A
	for <igt-dev@archiver.kernel.org>; Thu,  9 May 2024 20:36:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7CA810E91A;
	Thu,  9 May 2024 20:36:42 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1144D10E91A;
 Thu,  9 May 2024 20:36:41 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8728692359986779758=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBAT=3A_failure_for_Add_vmwgfx_prime_tests?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Zack Rusin" <zack.rusin@broadcom.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 09 May 2024 20:36:41 -0000
Message-ID: <171528700107.2039230.3336491968126555649@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240509191529.3783796-1-zack.rusin@broadcom.com>
In-Reply-To: <20240509191529.3783796-1-zack.rusin@broadcom.com>
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

--===============8728692359986779758==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add vmwgfx prime tests
URL   : https://patchwork.freedesktop.org/series/133402/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_14740 -> IGTPW_11121
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_11121 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_11121, please notify your bug team (&#x27;I915-ci-infra@lists.freedesktop.org&#x27;) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11121/index.html

Participating hosts (38 -> 37)
------------------------------

  Missing    (1): fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_11121:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_module_load@reload:
    - bat-atsm-1:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14740/bat-atsm-1/igt@i915_module_load@reload.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11121/bat-atsm-1/igt@i915_module_load@reload.html

  
Known issues
------------

  Here are the changes found in IGTPW_11121 that come from known issues:

### IGT changes ###

  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10911]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10911


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7846 -> IGTPW_11121

  CI-20190529: 20190529
  CI_DRM_14740: fa0763ee56bac0fea0c399b9f41f19439b07b616 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_11121: dede7eb874dc4abbb3449a6c02fc42e852e62485 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7846: 4a5fd4e7cb2798636f6464e2bd61399f3242b322 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11121/index.html

--===============8728692359986779758==
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
<tr><td><b>Series:</b></td><td>Add vmwgfx prime tests</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/133402/">https://patchwork.freedesktop.org/series/133402/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11121/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11121/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_14740 -&gt; IGTPW_11121</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_11121 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_11121, please notify your bug team (&#x27;I915-ci-infra@lists.freedesktop.org&#x27;) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11121/index.html</p>
<h2>Participating hosts (38 -&gt; 37)</h2>
<p>Missing    (1): fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_11121:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_module_load@reload:<ul>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14740/bat-atsm-1/igt@i915_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11121/bat-atsm-1/igt@i915_module_load@reload.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11121 that come from known issues:</p>
<h3>IGT changes</h3>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7846 -&gt; IGTPW_11121</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14740: fa0763ee56bac0fea0c399b9f41f19439b07b616 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_11121: dede7eb874dc4abbb3449a6c02fc42e852e62485 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7846: 4a5fd4e7cb2798636f6464e2bd61399f3242b322 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============8728692359986779758==--
