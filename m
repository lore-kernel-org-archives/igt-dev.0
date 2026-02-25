Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52DDAEFD23A
	for <igt-dev@archiver.kernel.org>; Wed, 25 Feb 2026 09:56:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFA7D10E073;
	Wed, 25 Feb 2026 09:56:27 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C925B10E073;
 Wed, 25 Feb 2026 09:56:26 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7201825890205878186=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_tests/kms=5Fexplict=5Ffen?=
 =?utf-8?q?ce=3A_Add_Test_for_Explicit_Fencing_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sebinraj, S" <s.sebinraj@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 25 Feb 2026 09:56:26 -0000
Message-ID: <177201338680.284987.602086680754271564@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260217075953.3220732-1-s.sebinraj@intel.com>
In-Reply-To: <20260217075953.3220732-1-s.sebinraj@intel.com>
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

--===============7201825890205878186==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_explict_fence: Add Test for Explicit Fencing (rev5)
URL   : https://patchwork.freedesktop.org/series/160078/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8770 -> IGTPW_14612
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_14612 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_14612, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14612/index.html

Participating hosts (43 -> 41)
------------------------------

  Missing    (2): bat-dg2-13 fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_14612:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_lmem_swapping@parallel-random-engines:
    - bat-atsm-1:         [PASS][1] -> [ABORT][2] +1 other test abort
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8770/bat-atsm-1/igt@gem_lmem_swapping@parallel-random-engines.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14612/bat-atsm-1/igt@gem_lmem_swapping@parallel-random-engines.html

  
Known issues
------------

  Here are the changes found in IGTPW_14612 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@workarounds:
    - bat-dg2-9:          NOTRUN -> [DMESG-FAIL][3] ([i915#12061]) +1 other test dmesg-fail
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14612/bat-dg2-9/igt@i915_selftest@live@workarounds.html
    - bat-dg2-14:         [PASS][4] -> [DMESG-FAIL][5] ([i915#12061]) +1 other test dmesg-fail
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8770/bat-dg2-14/igt@i915_selftest@live@workarounds.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14612/bat-dg2-14/igt@i915_selftest@live@workarounds.html

  
#### Possible fixes ####

  * igt@gem_lmem_swapping@parallel-random-engines:
    - bat-dg2-9:          [ABORT][6] -> [PASS][7] +1 other test pass
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8770/bat-dg2-9/igt@gem_lmem_swapping@parallel-random-engines.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14612/bat-dg2-9/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@i915_selftest@live:
    - bat-arls-5:         [TIMEOUT][8] -> [PASS][9] +1 other test pass
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8770/bat-arls-5/igt@i915_selftest@live.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14612/bat-arls-5/igt@i915_selftest@live.html

  * igt@i915_selftest@live@sanitycheck:
    - bat-arls-5:         [DMESG-WARN][10] ([i915#15738]) -> [PASS][11] +17 other tests pass
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8770/bat-arls-5/igt@i915_selftest@live@sanitycheck.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14612/bat-arls-5/igt@i915_selftest@live@sanitycheck.html

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-dp-3:
    - bat-arls-5:         [DMESG-WARN][12] -> [PASS][13] +3 other tests pass
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8770/bat-arls-5/igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-dp-3.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14612/bat-arls-5/igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-dp-3.html

  
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#15738]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15738


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8770 -> IGTPW_14612
  * Linux: CI_DRM_18040 -> CI_DRM_18043

  CI-20190529: 20190529
  CI_DRM_18040: 4caa4c7d4ff7bd4d24bca8e795773e460eb8bbfe @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_18043: 5c29c0e4516d76d8072fe1bc65eea3b5a62d2e5d @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_14612: d8cad73c8884ed4f7a4f9bc43c703a6fd5762c75 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8770: 8770

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14612/index.html

--===============7201825890205878186==
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
<tr><td><b>Series:</b></td><td>tests/kms_explict_fence: Add Test for Explicit Fencing (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/160078/">https://patchwork.freedesktop.org/series/160078/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14612/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14612/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8770 -&gt; IGTPW_14612</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_14612 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_14612, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14612/index.html</p>
<h2>Participating hosts (43 -&gt; 41)</h2>
<p>Missing    (2): bat-dg2-13 fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_14612:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@gem_lmem_swapping@parallel-random-engines:<ul>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8770/bat-atsm-1/igt@gem_lmem_swapping@parallel-random-engines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14612/bat-atsm-1/igt@gem_lmem_swapping@parallel-random-engines.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_14612 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@i915_selftest@live@workarounds:<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14612/bat-dg2-9/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8770/bat-dg2-14/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14612/bat-dg2-14/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8770/bat-dg2-9/igt@gem_lmem_swapping@parallel-random-engines.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14612/bat-dg2-9/igt@gem_lmem_swapping@parallel-random-engines.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8770/bat-arls-5/igt@i915_selftest@live.html">TIMEOUT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14612/bat-arls-5/igt@i915_selftest@live.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@sanitycheck:</p>
<ul>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8770/bat-arls-5/igt@i915_selftest@live@sanitycheck.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15738">i915#15738</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14612/bat-arls-5/igt@i915_selftest@live@sanitycheck.html">PASS</a> +17 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-dp-3:</p>
<ul>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8770/bat-arls-5/igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-dp-3.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14612/bat-arls-5/igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-dp-3.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8770 -&gt; IGTPW_14612</li>
<li>Linux: CI_DRM_18040 -&gt; CI_DRM_18043</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18040: 4caa4c7d4ff7bd4d24bca8e795773e460eb8bbfe @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_18043: 5c29c0e4516d76d8072fe1bc65eea3b5a62d2e5d @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_14612: d8cad73c8884ed4f7a4f9bc43c703a6fd5762c75 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8770: 8770</p>

</body>
</html>

--===============7201825890205878186==--
