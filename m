Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B0BAC4345F
	for <igt-dev@archiver.kernel.org>; Wed, 24 Apr 2024 00:24:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1E1510F56B;
	Wed, 24 Apr 2024 00:24:36 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4967110F4FD;
 Wed, 24 Apr 2024 00:24:35 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3038790406767645404=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBAT=3A_failure_for_series_starting_with_=5Bi-g?=
 =?utf-8?q?-t=2C1/4=5D_tests/intel/xe=5Fwedged=3A_Introduce_a_new_test_for_X?=
 =?utf-8?q?e_device_wedged_state?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 24 Apr 2024 00:24:35 -0000
Message-ID: <171391827529.1610961.6688357556192677636@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240423222220.1285742-1-rodrigo.vivi@intel.com>
In-Reply-To: <20240423222220.1285742-1-rodrigo.vivi@intel.com>
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

--===============3038790406767645404==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,1/4] tests/intel/xe_wedged: Introduce a new test for Xe device wedged state
URL   : https://patchwork.freedesktop.org/series/132799/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_14637 -> IGTPW_11062
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_11062 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_11062, please notify your bug team (&#x27;I915-ci-infra@lists.freedesktop.org&#x27;) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11062/index.html

Participating hosts (39 -> 37)
------------------------------

  Missing    (2): fi-apl-guc fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_11062:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_fence@nb-await:
    - bat-arls-2:         NOTRUN -> [TIMEOUT][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11062/bat-arls-2/igt@gem_exec_fence@nb-await.html

  * igt@gem_exec_gttfill@basic:
    - bat-arls-2:         [PASS][2] -> [TIMEOUT][3] +1 other test timeout
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14637/bat-arls-2/igt@gem_exec_gttfill@basic.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11062/bat-arls-2/igt@gem_exec_gttfill@basic.html

  * igt@gem_exec_parallel@engines:
    - bat-arls-2:         NOTRUN -> [ABORT][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11062/bat-arls-2/igt@gem_exec_parallel@engines.html

  
Known issues
------------

  Here are the changes found in IGTPW_11062 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@i915_selftest@live@execlists:
    - fi-bsw-nick:        [ABORT][5] ([i915#10594]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14637/fi-bsw-nick/igt@i915_selftest@live@execlists.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11062/fi-bsw-nick/igt@i915_selftest@live@execlists.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10594]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10594
  [i915#10911]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10911


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7819 -> IGTPW_11062

  CI-20190529: 20190529
  CI_DRM_14637: b5b592a3902a51cc5747c625aa1898768d4ce79a @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_11062: a72f03b3feb0591c8cf0260253a8a04b9f6ea779 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7819: 98e0d03839ce31141328a2935eb193361eca61e3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11062/index.html

--===============3038790406767645404==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,1/4] tests/intel/xe_wedged: Introduce a new test for Xe device wedged state</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/132799/">https://patchwork.freedesktop.org/series/132799/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11062/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11062/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_14637 -&gt; IGTPW_11062</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_11062 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_11062, please notify your bug team (&#x27;I915-ci-infra@lists.freedesktop.org&#x27;) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11062/index.html</p>
<h2>Participating hosts (39 -&gt; 37)</h2>
<p>Missing    (2): fi-apl-guc fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_11062:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_exec_fence@nb-await:</p>
<ul>
<li>bat-arls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11062/bat-arls-2/igt@gem_exec_fence@nb-await.html">TIMEOUT</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_gttfill@basic:</p>
<ul>
<li>bat-arls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14637/bat-arls-2/igt@gem_exec_gttfill@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11062/bat-arls-2/igt@gem_exec_gttfill@basic.html">TIMEOUT</a> +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@gem_exec_parallel@engines:</p>
<ul>
<li>bat-arls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11062/bat-arls-2/igt@gem_exec_parallel@engines.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11062 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live@execlists:<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14637/fi-bsw-nick/igt@i915_selftest@live@execlists.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10594">i915#10594</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11062/fi-bsw-nick/igt@i915_selftest@live@execlists.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7819 -&gt; IGTPW_11062</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14637: b5b592a3902a51cc5747c625aa1898768d4ce79a @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_11062: a72f03b3feb0591c8cf0260253a8a04b9f6ea779 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7819: 98e0d03839ce31141328a2935eb193361eca61e3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============3038790406767645404==--
