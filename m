Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6730DC25B74
	for <igt-dev@archiver.kernel.org>; Tue, 21 May 2024 19:00:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D726710F09C;
	Tue, 21 May 2024 19:00:29 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C51A810F09C;
 Tue, 21 May 2024 19:00:26 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1757235029836278963=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_series_starting_with_=5BCI?=
 =?utf-8?q?=2C1/6=5D_treewide=3A_Rename_engine_busyness_variables?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 21 May 2024 19:00:26 -0000
Message-ID: <171631802680.2165162.1222029678078192486@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240521161525.159720-1-lucas.demarchi@intel.com>
In-Reply-To: <20240521161525.159720-1-lucas.demarchi@intel.com>
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

--===============1757235029836278963==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [CI,1/6] treewide: Rename engine busyness variables
URL   : https://patchwork.freedesktop.org/series/133885/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_14793 -> IGTPW_11172
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11172/index.html

Participating hosts (40 -> 38)
------------------------------

  Missing    (2): bat-kbl-2 fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_11172:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_busy@basic@flip:
    - {bat-apl-1}:        [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14793/bat-apl-1/igt@kms_busy@basic@flip.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11172/bat-apl-1/igt@kms_busy@basic@flip.html

  * igt@kms_busy@basic@modeset:
    - {bat-apl-1}:        [PASS][3] -> [DMESG-WARN][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14793/bat-apl-1/igt@kms_busy@basic@modeset.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11172/bat-apl-1/igt@kms_busy@basic@modeset.html

  
Known issues
------------

  Here are the changes found in IGTPW_11172 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_lmem_swapping@basic@lmem0:
    - bat-dg2-8:          [PASS][5] -> [FAIL][6] ([i915#10378])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14793/bat-dg2-8/igt@gem_lmem_swapping@basic@lmem0.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11172/bat-dg2-8/igt@gem_lmem_swapping@basic@lmem0.html

  
#### Possible fixes ####

  * igt@kms_busy@basic@modeset:
    - {bat-mtlp-9}:       [DMESG-FAIL][7] ([i915#11009]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14793/bat-mtlp-9/igt@kms_busy@basic@modeset.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11172/bat-mtlp-9/igt@kms_busy@basic@modeset.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10378]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10378
  [i915#10580]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10580
  [i915#11009]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11009
  [i915#4213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213
  [i915#6121]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6121


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7866 -> IGTPW_11172

  CI-20190529: 20190529
  CI_DRM_14793: e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_11172: a85841ffc80b7bfe3429bdf283c8e37b0762602d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7866: 2b7701838c3ebaa3c717b6521cafafe3b9ae4a4f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11172/index.html

--===============1757235029836278963==
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
<tr><td><b>Series:</b></td><td>series starting with [CI,1/6] treewide: Rename engine busyness variables</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/133885/">https://patchwork.freedesktop.org/series/133885/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11172/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11172/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_14793 -&gt; IGTPW_11172</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11172/index.html</p>
<h2>Participating hosts (40 -&gt; 38)</h2>
<p>Missing    (2): bat-kbl-2 fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_11172:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_busy@basic@flip:</p>
<ul>
<li>{bat-apl-1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14793/bat-apl-1/igt@kms_busy@basic@flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11172/bat-apl-1/igt@kms_busy@basic@flip.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic@modeset:</p>
<ul>
<li>{bat-apl-1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14793/bat-apl-1/igt@kms_busy@basic@modeset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11172/bat-apl-1/igt@kms_busy@basic@modeset.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11172 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@gem_lmem_swapping@basic@lmem0:<ul>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14793/bat-dg2-8/igt@gem_lmem_swapping@basic@lmem0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11172/bat-dg2-8/igt@gem_lmem_swapping@basic@lmem0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10378">i915#10378</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_busy@basic@modeset:<ul>
<li>{bat-mtlp-9}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14793/bat-mtlp-9/igt@kms_busy@basic@modeset.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11009">i915#11009</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11172/bat-mtlp-9/igt@kms_busy@basic@modeset.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7866 -&gt; IGTPW_11172</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14793: e02ad2901cb7d6ec505c8d61f12ea9a308bb94f6 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_11172: a85841ffc80b7bfe3429bdf283c8e37b0762602d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7866: 2b7701838c3ebaa3c717b6521cafafe3b9ae4a4f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============1757235029836278963==--
