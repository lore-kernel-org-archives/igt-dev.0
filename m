Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8D24C25B10
	for <igt-dev@archiver.kernel.org>; Mon, 13 May 2024 14:52:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DA9510E19B;
	Mon, 13 May 2024 14:52:01 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1BE810E0DB;
 Mon, 13 May 2024 14:51:59 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0471405580326035516=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBAT=3A_failure_for_series_starting_with_=5Bi-g?=
 =?utf-8?q?-t=2C1/2=5D_tests/amdgpu=3A_support_jpeg_test_on_gfx940?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sathishkumar S" <sathishkumar.sundararaju@amd.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 13 May 2024 14:51:59 -0000
Message-ID: <171561191998.2095830.14917336101853323410@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240513135705.2399645-1-sathishkumar.sundararaju@amd.com>
In-Reply-To: <20240513135705.2399645-1-sathishkumar.sundararaju@amd.com>
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

--===============0471405580326035516==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,1/2] tests/amdgpu: support jpeg test on gfx940
URL   : https://patchwork.freedesktop.org/series/133544/
State : failure

== Summary ==

CI Bug Log - changes from IGT_7848 -> IGTPW_11133
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_11133 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_11133, please notify your bug team (&#x27;I915-ci-infra@lists.freedesktop.org&#x27;) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11133/index.html

Participating hosts (43 -> 40)
------------------------------

  Additional (1): bat-mtlp-9 
  Missing    (4): bat-mtlp-8 bat-arls-2 bat-jsl-1 fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_11133:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live@active:
    - fi-glk-j4005:       [PASS][1] -> [DMESG-FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7848/fi-glk-j4005/igt@i915_selftest@live@active.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11133/fi-glk-j4005/igt@i915_selftest@live@active.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-a-dp-6:
    - {bat-mtlp-9}:       NOTRUN -> [FAIL][3] +2 other tests fail
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11133/bat-mtlp-9/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-a-dp-6.html

  
Known issues
------------

  Here are the changes found in IGTPW_11133 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_lmem_swapping@basic@lmem0:
    - bat-dg2-9:          [PASS][4] -> [FAIL][5] ([i915#10378])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7848/bat-dg2-9/igt@gem_lmem_swapping@basic@lmem0.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11133/bat-dg2-9/igt@gem_lmem_swapping@basic@lmem0.html

  * igt@i915_module_load@load:
    - bat-arls-3:         [PASS][6] -> [ABORT][7] ([i915#11041])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7848/bat-arls-3/igt@i915_module_load@load.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11133/bat-arls-3/igt@i915_module_load@load.html

  * igt@i915_selftest@live@execlists:
    - fi-bsw-nick:        [PASS][8] -> [ABORT][9] ([i915#10594])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7848/fi-bsw-nick/igt@i915_selftest@live@execlists.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11133/fi-bsw-nick/igt@i915_selftest@live@execlists.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10216]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10216
  [i915#10378]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10378
  [i915#10580]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10580
  [i915#10594]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10594
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#10911]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10911
  [i915#11009]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11009
  [i915#11041]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11041
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
  [i915#3840]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840
  [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
  [i915#4212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
  [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#6621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621
  [i915#8809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8809
  [i915#9159]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9159
  [i915#9318]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9318
  [i915#9673]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9673
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
  [i915#9970]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9970


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7848 -> IGTPW_11133

  CI-20190529: 20190529
  CI_DRM_14754: 7def831e1e6b6d95c92e0a4fad9539a95141403d @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_11133: 11133
  IGT_7848: dc2d7fb4f978048b87707ea9ec32da748b01b378 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11133/index.html

--===============0471405580326035516==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,1/2] tests/amdgpu: support jpeg test on gfx940</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/133544/">https://patchwork.freedesktop.org/series/133544/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11133/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11133/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7848 -&gt; IGTPW_11133</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_11133 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_11133, please notify your bug team (&#x27;I915-ci-infra@lists.freedesktop.org&#x27;) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11133/index.html</p>
<h2>Participating hosts (43 -&gt; 40)</h2>
<p>Additional (1): bat-mtlp-9 <br />
  Missing    (4): bat-mtlp-8 bat-arls-2 bat-jsl-1 fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_11133:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_selftest@live@active:<ul>
<li>fi-glk-j4005:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7848/fi-glk-j4005/igt@i915_selftest@live@active.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11133/fi-glk-j4005/igt@i915_selftest@live@active.html">DMESG-FAIL</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-a-dp-6:<ul>
<li>{bat-mtlp-9}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11133/bat-mtlp-9/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-a-dp-6.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11133 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_lmem_swapping@basic@lmem0:</p>
<ul>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7848/bat-dg2-9/igt@gem_lmem_swapping@basic@lmem0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11133/bat-dg2-9/igt@gem_lmem_swapping@basic@lmem0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10378">i915#10378</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>bat-arls-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7848/bat-arls-3/igt@i915_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11133/bat-arls-3/igt@i915_module_load@load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11041">i915#11041</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7848/fi-bsw-nick/igt@i915_selftest@live@execlists.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11133/fi-bsw-nick/igt@i915_selftest@live@execlists.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10594">i915#10594</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7848 -&gt; IGTPW_11133</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14754: 7def831e1e6b6d95c92e0a4fad9539a95141403d @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_11133: 11133<br />
  IGT_7848: dc2d7fb4f978048b87707ea9ec32da748b01b378 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============0471405580326035516==--
