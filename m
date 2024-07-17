Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEBC4C3DA60
	for <igt-dev@archiver.kernel.org>; Wed, 17 Jul 2024 16:22:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54E3310E159;
	Wed, 17 Jul 2024 16:22:03 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7653610E2D2;
 Wed, 17 Jul 2024 16:22:00 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0916994518107191602=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_tests/kms=5Fproperties=3A_drop?=
 =?utf-8?q?_immutability_checks?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 17 Jul 2024 16:22:00 -0000
Message-ID: <172123332047.270805.13130013009008035430@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240717143947.28437-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20240717143947.28437-1-dmitry.baryshkov@linaro.org>
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

--===============0916994518107191602==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_properties: drop immutability checks
URL   : https://patchwork.freedesktop.org/series/136199/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7928_BAT -> XEIGTPW_11421_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_11421_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_11421_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (7 -> 7)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_11421_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_compute_mode@twice-bindexecqueue-userptr:
    - bat-pvc-2:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7928/bat-pvc-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11421/bat-pvc-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr.html

  


Build changes
-------------

  * IGT: IGT_7928 -> IGTPW_11421

  IGTPW_11421: a4d5d82f20da63d7155124558c7a300daf5295dc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7928: 294a7a487aab103c54b0deeb1559fcba371232d9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1619-cf52b34c47ed2a05c46193f0b9807ffd8838dbd8: cf52b34c47ed2a05c46193f0b9807ffd8838dbd8

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11421/index.html

--===============0916994518107191602==
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
<tr><td><b>Series:</b></td><td>tests/kms_properties: drop immutability checks</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/136199/">https://patchwork.freedesktop.org/series/136199/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11421/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11421/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7928_BAT -&gt; XEIGTPW_11421_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_11421_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_11421_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_11421_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_exec_compute_mode@twice-bindexecqueue-userptr:<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7928/bat-pvc-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11421/bat-pvc-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7928 -&gt; IGTPW_11421</li>
</ul>
<p>IGTPW_11421: a4d5d82f20da63d7155124558c7a300daf5295dc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7928: 294a7a487aab103c54b0deeb1559fcba371232d9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1619-cf52b34c47ed2a05c46193f0b9807ffd8838dbd8: cf52b34c47ed2a05c46193f0b9807ffd8838dbd8</p>

</body>
</html>

--===============0916994518107191602==--
