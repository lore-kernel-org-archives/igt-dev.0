Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E32D3C6FD1F
	for <igt-dev@archiver.kernel.org>; Tue, 26 Mar 2024 19:15:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80FAB10F212;
	Tue, 26 Mar 2024 19:15:56 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2E1C10F212;
 Tue, 26 Mar 2024 19:15:55 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6481496961472681542=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBAT=3A_failure_for_lib/pci=3A_Add_new_and_miss?=
 =?utf-8?q?ing_PCI_IDs_to_DG2_platform?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ravi Kumar Vodapalli" <ravi.kumar.vodapalli@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 26 Mar 2024 19:15:55 -0000
Message-ID: <171148055599.1049124.10450981325192701515@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240326134843.3841519-1-ravi.kumar.vodapalli@intel.com>
In-Reply-To: <20240326134843.3841519-1-ravi.kumar.vodapalli@intel.com>
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

--===============6481496961472681542==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/pci: Add new and missing PCI IDs to DG2 platform
URL   : https://patchwork.freedesktop.org/series/131633/
State : failure

== Summary ==

CI Bug Log - changes from IGT_7785 -> IGTPW_10918
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_10918 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_10918, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10918/index.html

Participating hosts (37 -> 37)
------------------------------

  Additional (2): bat-kbl-2 fi-kbl-8809g 
  Missing    (2): fi-cfl-8109u fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_10918:

### IGT changes ###

#### Possible regressions ####

  * igt@core_auth@basic-auth:
    - fi-kbl-7567u:       [PASS][1] -> [DMESG-WARN][2] +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7785/fi-kbl-7567u/igt@core_auth@basic-auth.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10918/fi-kbl-7567u/igt@core_auth@basic-auth.html

  
Known issues
------------

  Here are the changes found in IGTPW_10918 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@info:
    - bat-kbl-2:          NOTRUN -> [SKIP][3] ([i915#1849])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10918/bat-kbl-2/igt@fbdev@info.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - bat-kbl-2:          NOTRUN -> [SKIP][4] +39 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10918/bat-kbl-2/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@i915_selftest@live@guc_multi_lrc:
    - bat-dg2-9:          [PASS][5] -> [ABORT][6] ([i915#10366])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7785/bat-dg2-9/igt@i915_selftest@live@guc_multi_lrc.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10918/bat-dg2-9/igt@i915_selftest@live@guc_multi_lrc.html

  * igt@kms_addfb_basic@invalid-set-prop:
    - fi-kbl-7567u:       [PASS][7] -> [DMESG-WARN][8] ([i915#8585]) +38 other tests dmesg-warn
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7785/fi-kbl-7567u/igt@kms_addfb_basic@invalid-set-prop.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10918/fi-kbl-7567u/igt@kms_addfb_basic@invalid-set-prop.html

  * igt@kms_busy@basic@modeset:
    - fi-kbl-7567u:       [PASS][9] -> [INCOMPLETE][10] ([i915#10056])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7785/fi-kbl-7567u/igt@kms_busy@basic@modeset.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10918/fi-kbl-7567u/igt@kms_busy@basic@modeset.html

  * igt@runner@aborted:
    - fi-kbl-8809g:       NOTRUN -> [FAIL][11] ([i915#4991])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10918/fi-kbl-8809g/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@mman:
    - bat-dg2-14:         [ABORT][12] ([i915#10366]) -> [PASS][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7785/bat-dg2-14/igt@i915_selftest@live@mman.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10918/bat-dg2-14/igt@i915_selftest@live@mman.html

  
  [i915#10056]: https://gitlab.freedesktop.org/drm/intel/issues/10056
  [i915#10366]: https://gitlab.freedesktop.org/drm/intel/issues/10366
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#4991]: https://gitlab.freedesktop.org/drm/intel/issues/4991
  [i915#8585]: https://gitlab.freedesktop.org/drm/intel/issues/8585


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7785 -> IGTPW_10918

  CI-20190529: 20190529
  CI_DRM_14486: 79a0d94585cad50ad2446ebdf3f1317b7d18157c @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10918: 10918
  IGT_7785: 7785

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10918/index.html

--===============6481496961472681542==
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
<tr><td><b>Series:</b></td><td>lib/pci: Add new and missing PCI IDs to DG2 platform</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/131633/">https://patchwork.freedesktop.org/series/131633/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10918/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10918/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7785 -&gt; IGTPW_10918</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_10918 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_10918, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10918/index.html</p>
<h2>Participating hosts (37 -&gt; 37)</h2>
<p>Additional (2): bat-kbl-2 fi-kbl-8809g <br />
  Missing    (2): fi-cfl-8109u fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_10918:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@core_auth@basic-auth:<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7785/fi-kbl-7567u/igt@core_auth@basic-auth.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10918/fi-kbl-7567u/igt@core_auth@basic-auth.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10918 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10918/bat-kbl-2/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10918/bat-kbl-2/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> +39 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@guc_multi_lrc:</p>
<ul>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7785/bat-dg2-9/igt@i915_selftest@live@guc_multi_lrc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10918/bat-dg2-9/igt@i915_selftest@live@guc_multi_lrc.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10366">i915#10366</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-set-prop:</p>
<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7785/fi-kbl-7567u/igt@kms_addfb_basic@invalid-set-prop.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10918/fi-kbl-7567u/igt@kms_addfb_basic@invalid-set-prop.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8585">i915#8585</a>) +38 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic@modeset:</p>
<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7785/fi-kbl-7567u/igt@kms_busy@basic@modeset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10918/fi-kbl-7567u/igt@kms_busy@basic@modeset.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10056">i915#10056</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10918/fi-kbl-8809g/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4991">i915#4991</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live@mman:<ul>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7785/bat-dg2-14/igt@i915_selftest@live@mman.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10366">i915#10366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10918/bat-dg2-14/igt@i915_selftest@live@mman.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7785 -&gt; IGTPW_10918</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14486: 79a0d94585cad50ad2446ebdf3f1317b7d18157c @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10918: 10918<br />
  IGT_7785: 7785</p>

</body>
</html>

--===============6481496961472681542==--
