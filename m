Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E208510FCAC0
	for <igt-dev@archiver.kernel.org>; Wed,  1 Apr 2026 18:25:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9407B10E212;
	Wed,  1 Apr 2026 18:25:22 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB31410E212;
 Wed,  1 Apr 2026 18:25:13 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7700259558268946362=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_tests/kms=5Fproperties=3A?=
 =?utf-8?q?_Add_skip_on_headless_machines_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "sumit kishore" <sumit.kishore@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 01 Apr 2026 18:25:13 -0000
Message-ID: <177506791373.425443.13379391114642953113@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260401114244.410255-1-sumit.kishore@intel.com>
In-Reply-To: <20260401114244.410255-1-sumit.kishore@intel.com>
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

--===============7700259558268946362==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_properties: Add skip on headless machines (rev3)
URL   : https://patchwork.freedesktop.org/series/162630/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8840 -> IGTPW_14906
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_14906 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_14906, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14906/index.html

Participating hosts (42 -> 40)
------------------------------

  Missing    (2): bat-dg2-13 fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_14906:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live@gem_migrate:
    - bat-arlh-2:         [PASS][1] -> [INCOMPLETE][2] +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8840/bat-arlh-2/igt@i915_selftest@live@gem_migrate.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14906/bat-arlh-2/igt@i915_selftest@live@gem_migrate.html

  
Known issues
------------

  Here are the changes found in IGTPW_14906 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live:
    - bat-mtlp-8:         [PASS][3] -> [DMESG-FAIL][4] ([i915#12061]) +1 other test dmesg-fail
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8840/bat-mtlp-8/igt@i915_selftest@live.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14906/bat-mtlp-8/igt@i915_selftest@live.html

  * igt@i915_selftest@live@workarounds:
    - bat-arls-5:         [PASS][5] -> [DMESG-FAIL][6] ([i915#12061]) +1 other test dmesg-fail
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8840/bat-arls-5/igt@i915_selftest@live@workarounds.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14906/bat-arls-5/igt@i915_selftest@live@workarounds.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence:
    - bat-arls-6:         [PASS][7] -> [SKIP][8] ([i915#11190]) +2 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8840/bat-arls-6/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14906/bat-arls-6/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html

  * igt@prime_vgem@basic-fence-flip:
    - fi-pnv-d510:        [PASS][9] -> [ABORT][10] ([i915#15773])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8840/fi-pnv-d510/igt@prime_vgem@basic-fence-flip.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14906/fi-pnv-d510/igt@prime_vgem@basic-fence-flip.html

  
#### Possible fixes ####

  * igt@i915_selftest@live:
    - bat-dg2-8:          [DMESG-FAIL][11] ([i915#12061]) -> [PASS][12] +1 other test pass
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8840/bat-dg2-8/igt@i915_selftest@live.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14906/bat-dg2-8/igt@i915_selftest@live.html

  * igt@i915_selftest@live@workarounds:
    - bat-arlh-3:         [DMESG-FAIL][13] ([i915#12061]) -> [PASS][14] +1 other test pass
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8840/bat-arlh-3/igt@i915_selftest@live@workarounds.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14906/bat-arlh-3/igt@i915_selftest@live@workarounds.html

  
  [i915#11190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#15773]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15773


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8840 -> IGTPW_14906
  * Linux: CI_DRM_18262 -> CI_DRM_18263

  CI-20190529: 20190529
  CI_DRM_18262: 5d36e6d54e963f0c1137aaf2249d2baa781f08c2 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_18263: 35dad892ec87d448384f492ba061d0da7e3710a5 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_14906: 14906
  IGT_8840: 8840

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14906/index.html

--===============7700259558268946362==
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
<tr><td><b>Series:</b></td><td>tests/kms_properties: Add skip on headless machines (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/162630/">https://patchwork.freedesktop.org/series/162630/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14906/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14906/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8840 -&gt; IGTPW_14906</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_14906 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_14906, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14906/index.html</p>
<h2>Participating hosts (42 -&gt; 40)</h2>
<p>Missing    (2): bat-dg2-13 fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_14906:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_selftest@live@gem_migrate:<ul>
<li>bat-arlh-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8840/bat-arlh-2/igt@i915_selftest@live@gem_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14906/bat-arlh-2/igt@i915_selftest@live@gem_migrate.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_14906 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8840/bat-mtlp-8/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14906/bat-mtlp-8/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8840/bat-arls-5/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14906/bat-arls-5/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence:</p>
<ul>
<li>bat-arls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8840/bat-arls-6/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14906/bat-arls-6/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190">i915#11190</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8840/fi-pnv-d510/igt@prime_vgem@basic-fence-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14906/fi-pnv-d510/igt@prime_vgem@basic-fence-flip.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15773">i915#15773</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8840/bat-dg2-8/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14906/bat-dg2-8/igt@i915_selftest@live.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8840/bat-arlh-3/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14906/bat-arlh-3/igt@i915_selftest@live@workarounds.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8840 -&gt; IGTPW_14906</li>
<li>Linux: CI_DRM_18262 -&gt; CI_DRM_18263</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18262: 5d36e6d54e963f0c1137aaf2249d2baa781f08c2 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_18263: 35dad892ec87d448384f492ba061d0da7e3710a5 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_14906: 14906<br />
  IGT_8840: 8840</p>

</body>
</html>

--===============7700259558268946362==--
