Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1378C4345F
	for <igt-dev@archiver.kernel.org>; Wed,  1 May 2024 18:23:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74C7110F259;
	Wed,  1 May 2024 18:23:57 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3E9210F255;
 Wed,  1 May 2024 18:23:55 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4825641570358109509=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_Minor_gputop_improvements?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 01 May 2024 18:23:55 -0000
Message-ID: <171458783586.1793171.9685442155915792614@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240501173303.115737-1-lucas.demarchi@intel.com>
In-Reply-To: <20240501173303.115737-1-lucas.demarchi@intel.com>
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

--===============4825641570358109509==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Minor gputop improvements
URL   : https://patchwork.freedesktop.org/series/133119/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_14686 -> IGTPW_11090
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11090/index.html

Participating hosts (41 -> 41)
------------------------------

  Additional (1): fi-apl-guc 
  Missing    (1): fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_11090 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_lmem_swapping@basic:
    - fi-apl-guc:         NOTRUN -> [SKIP][1] ([i915#4613]) +3 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11090/fi-apl-guc/igt@gem_lmem_swapping@basic.html

  * igt@kms_hdmi_inject@inject-audio:
    - fi-apl-guc:         NOTRUN -> [SKIP][2] +17 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11090/fi-apl-guc/igt@kms_hdmi_inject@inject-audio.html

  
#### Possible fixes ####

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-3:
    - bat-arls-3:         [FAIL][3] -> [PASS][4] +2 other tests pass
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14686/bat-arls-3/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-3.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11090/bat-arls-3/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-3.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10435]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10435
  [i915#10911]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10911
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7828 -> IGTPW_11090

  CI-20190529: 20190529
  CI_DRM_14686: 3eb5461bdf6aae10ba7ecf7958765f263beb6136 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_11090: 11090
  IGT_7828: 68a055ff91b91dadb01d9501cd8670f654b5b952 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11090/index.html

--===============4825641570358109509==
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
<tr><td><b>Series:</b></td><td>Minor gputop improvements</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/133119/">https://patchwork.freedesktop.org/series/133119/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11090/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11090/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_14686 -&gt; IGTPW_11090</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11090/index.html</p>
<h2>Participating hosts (41 -&gt; 41)</h2>
<p>Additional (1): fi-apl-guc <br />
  Missing    (1): fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11090 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11090/fi-apl-guc/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11090/fi-apl-guc/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> +17 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-3:<ul>
<li>bat-arls-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14686/bat-arls-3/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-3.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11090/bat-arls-3/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-3.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7828 -&gt; IGTPW_11090</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14686: 3eb5461bdf6aae10ba7ecf7958765f263beb6136 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_11090: 11090<br />
  IGT_7828: 68a055ff91b91dadb01d9501cd8670f654b5b952 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============4825641570358109509==--
