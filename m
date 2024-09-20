Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F13BCF3973
	for <igt-dev@archiver.kernel.org>; Fri, 20 Sep 2024 00:33:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63A5510E07F;
	Fri, 20 Sep 2024 00:33:57 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44ED610E07F;
 Fri, 20 Sep 2024 00:33:56 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5235974124987226672=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_tests/intel/kms=5Fpsr2=5Fsf?=
 =?utf-8?q?=3A_Add_eDP_check_for_Early_Trasport?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jeevan B" <jeevan.b@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 20 Sep 2024 00:33:56 -0000
Message-ID: <172679243627.1048260.7839641361646476968@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240919095904.1136205-1-jeevan.b@intel.com>
In-Reply-To: <20240919095904.1136205-1-jeevan.b@intel.com>
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

--===============5235974124987226672==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/kms_psr2_sf: Add eDP check for Early Trasport
URL   : https://patchwork.freedesktop.org/series/138860/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_15440 -> IGTPW_11764
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11764/index.html

Participating hosts (39 -> 34)
------------------------------

  Additional (1): fi-bsw-n3050 
  Missing    (6): fi-kbl-7567u fi-snb-2520m fi-kbl-8809g bat-dg2-11 bat-arls-1 bat-arls-2 

Known issues
------------

  Here are the changes found in IGTPW_11764 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_lmem_swapping@random-engines:
    - fi-bsw-n3050:       NOTRUN -> [SKIP][1] +20 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11764/fi-bsw-n3050/igt@gem_lmem_swapping@random-engines.html

  
#### Possible fixes ####

  * igt@i915_selftest@live:
    - bat-mtlp-6:         [ABORT][2] ([i915#12061]) -> [PASS][3] +1 other test pass
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15440/bat-mtlp-6/igt@i915_selftest@live.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11764/bat-mtlp-6/igt@i915_selftest@live.html

  
#### Warnings ####

  * igt@i915_module_load@reload:
    - bat-apl-1:          [DMESG-WARN][4] ([i915#180]) -> [DMESG-WARN][5] ([i915#180] / [i915#1982])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15440/bat-apl-1/igt@i915_module_load@reload.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11764/bat-apl-1/igt@i915_module_load@reload.html
    - bat-arls-5:         [DMESG-WARN][6] ([i915#11637] / [i915#1982]) -> [DMESG-WARN][7] ([i915#11637])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15440/bat-arls-5/igt@i915_module_load@reload.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11764/bat-arls-5/igt@i915_module_load@reload.html

  
  [i915#11637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11637
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#180]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180
  [i915#1982]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8028 -> IGTPW_11764

  CI-20190529: 20190529
  CI_DRM_15440: d4340c1de6d417c7b3edac187c3af011b146701a @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_11764: 11764
  IGT_8028: 8028

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11764/index.html

--===============5235974124987226672==
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
<tr><td><b>Series:</b></td><td>tests/intel/kms_psr2_sf: Add eDP check for Early Trasport</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/138860/">https://patchwork.freedesktop.org/series/138860/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11764/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11764/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_15440 -&gt; IGTPW_11764</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11764/index.html</p>
<h2>Participating hosts (39 -&gt; 34)</h2>
<p>Additional (1): fi-bsw-n3050 <br />
  Missing    (6): fi-kbl-7567u fi-snb-2520m fi-kbl-8809g bat-dg2-11 bat-arls-1 bat-arls-2 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11764 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@gem_lmem_swapping@random-engines:<ul>
<li>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11764/fi-bsw-n3050/igt@gem_lmem_swapping@random-engines.html">SKIP</a> +20 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live:<ul>
<li>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15440/bat-mtlp-6/igt@i915_selftest@live.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11764/bat-mtlp-6/igt@i915_selftest@live.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@i915_module_load@reload:<ul>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15440/bat-apl-1/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11764/bat-apl-1/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180">i915#180</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982">i915#1982</a>)</li>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15440/bat-arls-5/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11637">i915#11637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11764/bat-arls-5/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11637">i915#11637</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8028 -&gt; IGTPW_11764</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_15440: d4340c1de6d417c7b3edac187c3af011b146701a @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_11764: 11764<br />
  IGT_8028: 8028</p>

</body>
</html>

--===============5235974124987226672==--
