Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B82CAD12667
	for <igt-dev@archiver.kernel.org>; Tue,  5 Nov 2024 08:17:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58B8710E533;
	Tue,  5 Nov 2024 08:17:25 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BCC810E2B4;
 Tue,  5 Nov 2024 08:17:25 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5636911309041474947=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_lib/igt=5Fkmod=3A_Drop_lega?=
 =?utf-8?q?cy_kunit_integration_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 05 Nov 2024 08:17:25 -0000
Message-ID: <173079464510.1410776.6119276903433737914@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241105055255.2466236-1-lucas.demarchi@intel.com>
In-Reply-To: <20241105055255.2466236-1-lucas.demarchi@intel.com>
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

--===============5636911309041474947==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/igt_kmod: Drop legacy kunit integration (rev2)
URL   : https://patchwork.freedesktop.org/series/140746/
State : success

== Summary ==

CI Bug Log - changes from IGT_8097 -> IGTPW_12030
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12030/index.html

Participating hosts (45 -> 44)
------------------------------

  Missing    (1): fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_12030 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@i915_selftest@live:
    - bat-arls-2:         [ABORT][1] ([i915#12133]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8097/bat-arls-2/igt@i915_selftest@live.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12030/bat-arls-2/igt@i915_selftest@live.html

  * igt@i915_selftest@live@gt_tlb:
    - bat-apl-1:          [ABORT][3] ([i915#12133]) -> [PASS][4] +1 other test pass
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8097/bat-apl-1/igt@i915_selftest@live@gt_tlb.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12030/bat-apl-1/igt@i915_selftest@live@gt_tlb.html

  * igt@i915_selftest@live@workarounds:
    - bat-arls-2:         [ABORT][5] ([i915#12061]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8097/bat-arls-2/igt@i915_selftest@live@workarounds.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12030/bat-arls-2/igt@i915_selftest@live@workarounds.html

  
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12133]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12133


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8097 -> IGTPW_12030
  * Linux: CI_DRM_15628 -> CI_DRM_15630

  CI-20190529: 20190529
  CI_DRM_15628: a4532bcf5eea0cfdb56fbdc3195a2d15d193727b @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_15630: 2a8c91b14ad6a40f367e5bf658227771dad1faa9 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12030: 4b805fcd35faf83f81eee1c6f26f91c2150ff2b0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8097: 2e7c8e4b88a50e33e10d6c13286818aa833bef9b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12030/index.html

--===============5636911309041474947==
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
<tr><td><b>Series:</b></td><td>lib/igt_kmod: Drop legacy kunit integration (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/140746/">https://patchwork.freedesktop.org/series/140746/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12030/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12030/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8097 -&gt; IGTPW_12030</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12030/index.html</p>
<h2>Participating hosts (45 -&gt; 44)</h2>
<p>Missing    (1): fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_12030 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-arls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8097/bat-arls-2/igt@i915_selftest@live.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12133">i915#12133</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12030/bat-arls-2/igt@i915_selftest@live.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_tlb:</p>
<ul>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8097/bat-apl-1/igt@i915_selftest@live@gt_tlb.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12133">i915#12133</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12030/bat-apl-1/igt@i915_selftest@live@gt_tlb.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-arls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8097/bat-arls-2/igt@i915_selftest@live@workarounds.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12030/bat-arls-2/igt@i915_selftest@live@workarounds.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8097 -&gt; IGTPW_12030</li>
<li>Linux: CI_DRM_15628 -&gt; CI_DRM_15630</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_15628: a4532bcf5eea0cfdb56fbdc3195a2d15d193727b @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_15630: 2a8c91b14ad6a40f367e5bf658227771dad1faa9 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_12030: 4b805fcd35faf83f81eee1c6f26f91c2150ff2b0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8097: 2e7c8e4b88a50e33e10d6c13286818aa833bef9b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============5636911309041474947==--
