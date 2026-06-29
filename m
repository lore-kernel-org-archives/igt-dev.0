Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75FE1C43458
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jun 2026 18:49:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21B7810E03E;
	Mon, 29 Jun 2026 18:49:52 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEDA810E03E;
 Mon, 29 Jun 2026 18:49:22 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1019592931712057537=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_tests/amdgpu/amd=5Fbasic?=
 =?utf-8?q?=3A_use_a_portable_spin-wait_CPU_hint?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ricardo Salveti" <ricardo.salveti@oss.qualcomm.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 29 Jun 2026 18:49:22 -0000
Message-ID: <178275896283.129857.13044590242910425147@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260626212743.16149-1-ricardo.salveti@oss.qualcomm.com>
In-Reply-To: <20260626212743.16149-1-ricardo.salveti@oss.qualcomm.com>
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

--===============1019592931712057537==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/amdgpu/amd_basic: use a portable spin-wait CPU hint
URL   : https://patchwork.freedesktop.org/series/169325/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8988 -> IGTPW_15443
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_15443 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_15443, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15443/index.html

Participating hosts (42 -> 40)
------------------------------

  Missing    (2): bat-dg2-13 fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_15443:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live:
    - bat-rpls-4:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8988/bat-rpls-4/igt@i915_selftest@live.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15443/bat-rpls-4/igt@i915_selftest@live.html
    - fi-skl-6600u:       [PASS][3] -> [INCOMPLETE][4] +1 other test incomplete
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8988/fi-skl-6600u/igt@i915_selftest@live.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15443/fi-skl-6600u/igt@i915_selftest@live.html

  
Known issues
------------

  Here are the changes found in IGTPW_15443 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@dmabuf@all-tests:
    - fi-kbl-8809g:       NOTRUN -> [SKIP][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15443/fi-kbl-8809g/igt@dmabuf@all-tests.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - fi-kbl-8809g:       NOTRUN -> [SKIP][6] ([i915#4613]) +3 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15443/fi-kbl-8809g/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@i915_selftest@live@hangcheck:
    - bat-rpls-4:         [PASS][7] -> [INCOMPLETE][8] ([i915#16139])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8988/bat-rpls-4/igt@i915_selftest@live@hangcheck.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15443/bat-rpls-4/igt@i915_selftest@live@hangcheck.html

  
#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - fi-kbl-8809g:       [ABORT][9] -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8988/fi-kbl-8809g/igt@core_hotunplug@unbind-rebind.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15443/fi-kbl-8809g/igt@core_hotunplug@unbind-rebind.html

  
  [i915#16139]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16139
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8988 -> IGTPW_15443
  * Linux: CI_DRM_18724 -> CI_DRM_18725

  CI-20190529: 20190529
  CI_DRM_18724: b9aebfff5a3c5049500a7bd4573815090a425f34 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_18725: 78c0a355e0dd70f31dba684bd172813fad9d79d2 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15443: 711002ce3fe90e8fcba7875139f337f59c994cec @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8988: 8988

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15443/index.html

--===============1019592931712057537==
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
<tr><td><b>Series:</b></td><td>tests/amdgpu/amd_basic: use a portable spin-wait CPU hint</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/169325/">https://patchwork.freedesktop.org/series/169325/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15443/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15443/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8988 -&gt; IGTPW_15443</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_15443 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_15443, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15443/index.html</p>
<h2>Participating hosts (42 -&gt; 40)</h2>
<p>Missing    (2): bat-dg2-13 fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_15443:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_selftest@live:<ul>
<li>bat-rpls-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8988/bat-rpls-4/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15443/bat-rpls-4/igt@i915_selftest@live.html">INCOMPLETE</a></li>
<li>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8988/fi-skl-6600u/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15443/fi-skl-6600u/igt@i915_selftest@live.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_15443 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@dmabuf@all-tests:</p>
<ul>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15443/fi-kbl-8809g/igt@dmabuf@all-tests.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15443/fi-kbl-8809g/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>bat-rpls-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8988/bat-rpls-4/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15443/bat-rpls-4/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16139">i915#16139</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@core_hotunplug@unbind-rebind:<ul>
<li>fi-kbl-8809g:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8988/fi-kbl-8809g/igt@core_hotunplug@unbind-rebind.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15443/fi-kbl-8809g/igt@core_hotunplug@unbind-rebind.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8988 -&gt; IGTPW_15443</li>
<li>Linux: CI_DRM_18724 -&gt; CI_DRM_18725</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18724: b9aebfff5a3c5049500a7bd4573815090a425f34 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_18725: 78c0a355e0dd70f31dba684bd172813fad9d79d2 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15443: 711002ce3fe90e8fcba7875139f337f59c994cec @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8988: 8988</p>

</body>
</html>

--===============1019592931712057537==--
