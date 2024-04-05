Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9C10CD11C2
	for <igt-dev@archiver.kernel.org>; Fri,  5 Apr 2024 12:03:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8714F10E51F;
	Fri,  5 Apr 2024 12:03:01 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3FED10E51F;
 Fri,  5 Apr 2024 12:02:55 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4496759384551638669=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_tests/intel-ci=3A_Addback_e?=
 =?utf-8?q?vict_=26_threads_tests_to_BAT?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: himanshu.girotra@intel.com
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 05 Apr 2024 12:02:55 -0000
Message-ID: <171231857573.1228986.12368593947512960746@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240405104159.14617-1-himanshu.girotra@intel.com>
In-Reply-To: <20240405104159.14617-1-himanshu.girotra@intel.com>
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

--===============4496759384551638669==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel-ci: Addback evict & threads tests to BAT
URL   : https://patchwork.freedesktop.org/series/132070/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_14533 -> IGTPW_10982
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10982/index.html

Participating hosts (38 -> 35)
------------------------------

  Missing    (3): fi-bsw-nick fi-snb-2520m fi-kbl-8809g 

Known issues
------------

  Here are the changes found in IGTPW_10982 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@i915_selftest@live@slpc:
    - bat-dg2-8:          [ABORT][1] ([i915#10366]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14533/bat-dg2-8/igt@i915_selftest@live@slpc.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10982/bat-dg2-8/igt@i915_selftest@live@slpc.html

  
#### Warnings ####

  * igt@i915_selftest@live@gem:
    - bat-atsm-1:         [ABORT][3] ([i915#10182] / [i915#10564]) -> [INCOMPLETE][4] ([i915#10182])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14533/bat-atsm-1/igt@i915_selftest@live@gem.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10982/bat-atsm-1/igt@i915_selftest@live@gem.html

  
  [i915#10182]: https://gitlab.freedesktop.org/drm/intel/issues/10182
  [i915#10366]: https://gitlab.freedesktop.org/drm/intel/issues/10366
  [i915#10564]: https://gitlab.freedesktop.org/drm/intel/issues/10564


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7800 -> IGTPW_10982

  CI-20190529: 20190529
  CI_DRM_14533: 019010dd870216d30458836f988b4461674a051a @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10982: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10982/index.html
  IGT_7800: 7800


Testlist changes
----------------

-igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tilemtlrcccs-downscaling
-igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tilemtlrcccs-upscaling

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10982/index.html

--===============4496759384551638669==
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
<tr><td><b>Series:</b></td><td>tests/intel-ci: Addback evict &amp; threads tests to BAT</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/132070/">https://patchwork.freedesktop.org/series/132070/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10982/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10982/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_14533 -&gt; IGTPW_10982</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10982/index.html</p>
<h2>Participating hosts (38 -&gt; 35)</h2>
<p>Missing    (3): fi-bsw-nick fi-snb-2520m fi-kbl-8809g </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10982 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live@slpc:<ul>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14533/bat-dg2-8/igt@i915_selftest@live@slpc.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10366">i915#10366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10982/bat-dg2-8/igt@i915_selftest@live@slpc.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@i915_selftest@live@gem:<ul>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14533/bat-atsm-1/igt@i915_selftest@live@gem.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10182">i915#10182</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/10564">i915#10564</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10982/bat-atsm-1/igt@i915_selftest@live@gem.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10182">i915#10182</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7800 -&gt; IGTPW_10982</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14533: 019010dd870216d30458836f988b4461674a051a @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10982: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10982/index.html<br />
  IGT_7800: 7800</p>
<h2>Testlist changes</h2>
<p>-igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tilemtlrcccs-downscaling<br />
-igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tilemtlrcccs-upscaling</p>

</body>
</html>

--===============4496759384551638669==--
