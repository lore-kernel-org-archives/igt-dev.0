Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96D54C47DAF
	for <igt-dev@archiver.kernel.org>; Fri, 19 Jan 2024 14:16:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2892D10E0EA;
	Fri, 19 Jan 2024 14:16:09 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D501410E0EA;
 Fri, 19 Jan 2024 14:16:07 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1075829107065236101=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBAT=3A_failure_for_tests/intel/xe=5Fexec=5Fato?=
 =?utf-8?q?mic=3A_Skip_early_on_unsupported_platform_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Date: Fri, 19 Jan 2024 14:16:07 -0000
Message-ID: <170567376787.592636.12774795529644504594@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240119101844.15898-1-nirmoy.das@intel.com>
In-Reply-To: <20240119101844.15898-1-nirmoy.das@intel.com>
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
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

--===============1075829107065236101==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_exec_atomic: Skip early on unsupported platform (rev2)
URL   : https://patchwork.freedesktop.org/series/128977/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_14146 -> IGTPW_10563
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_10563 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_10563, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10563/index.html

Participating hosts (37 -> 36)
------------------------------

  Additional (1): fi-bsw-nick 
  Missing    (2): bat-mtlp-8 fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_10563:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live@workarounds:
    - bat-adlm-1:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14146/bat-adlm-1/igt@i915_selftest@live@workarounds.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10563/bat-adlm-1/igt@i915_selftest@live@workarounds.html

  
Known issues
------------

  Here are the changes found in IGTPW_10563 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_lmem_swapping@parallel-random-engines:
    - fi-bsw-nick:        NOTRUN -> [SKIP][3] ([fdo#109271]) +15 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10563/fi-bsw-nick/igt@gem_lmem_swapping@parallel-random-engines.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@hangcheck:
    - {bat-rpls-3}:       [DMESG-WARN][4] ([i915#5591]) -> [PASS][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14146/bat-rpls-3/igt@i915_selftest@live@hangcheck.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10563/bat-rpls-3/igt@i915_selftest@live@hangcheck.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#5591]: https://gitlab.freedesktop.org/drm/intel/issues/5591


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7683 -> IGTPW_10563

  CI-20190529: 20190529
  CI_DRM_14146: 873aee20af09054189670092b2d6fe03824777b5 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10563: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10563/index.html
  IGT_7683: 7683


Testlist changes
----------------

-igt@xe_pm@d3-mmap-system
-igt@xe_pm@d3-mmap-vram

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10563/index.html

--===============1075829107065236101==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_exec_atomic: Skip early on unsupported platform (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/128977/">https://patchwork.freedesktop.org/series/128977/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10563/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10563/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_14146 -&gt; IGTPW_10563</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_10563 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_10563, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10563/index.html</p>
<h2>Participating hosts (37 -&gt; 36)</h2>
<p>Additional (1): fi-bsw-nick <br />
  Missing    (2): bat-mtlp-8 fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_10563:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_selftest@live@workarounds:<ul>
<li>bat-adlm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14146/bat-adlm-1/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10563/bat-adlm-1/igt@i915_selftest@live@workarounds.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10563 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@gem_lmem_swapping@parallel-random-engines:<ul>
<li>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10563/fi-bsw-nick/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +15 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live@hangcheck:<ul>
<li>{bat-rpls-3}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14146/bat-rpls-3/igt@i915_selftest@live@hangcheck.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5591">i915#5591</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10563/bat-rpls-3/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7683 -&gt; IGTPW_10563</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14146: 873aee20af09054189670092b2d6fe03824777b5 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10563: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10563/index.html<br />
  IGT_7683: 7683</p>
<h2>Testlist changes</h2>
<p>-igt@xe_pm@d3-mmap-system<br />
-igt@xe_pm@d3-mmap-vram</p>

</body>
</html>

--===============1075829107065236101==--
