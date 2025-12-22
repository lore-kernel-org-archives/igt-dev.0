Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FB66E6ADF9
	for <igt-dev@archiver.kernel.org>; Mon, 22 Dec 2025 21:11:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E278110E1BF;
	Mon, 22 Dec 2025 21:11:40 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74CB910E08C;
 Mon, 22 Dec 2025 21:11:40 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5183809915655364979=="
MIME-Version: 1.0
Subject: =?utf-8?b?4pyTIGk5MTUuQ0kuQkFUOiBzdWNjZXNzIGZvciBsaWIva21zOiBDYXJ2ZSB1cCBp?=
 =?utf-8?b?Z3RfZGlzcGxheV9yZXF1aXJlKCkgKHJldjUp?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 22 Dec 2025 21:11:40 -0000
Message-ID: <176643790047.112879.1860050450307758365@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251219203327.16573-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20251219203327.16573-1-ville.syrjala@linux.intel.com>
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

--===============5183809915655364979==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/kms: Carve up igt_display_require() (rev5)
URL   : https://patchwork.freedesktop.org/series/159165/
State : success

== Summary ==

CI Bug Log - changes from IGT_8674 -> IGTPW_14258
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14258/index.html

Participating hosts (43 -> 40)
------------------------------

  Missing    (3): bat-dg2-13 fi-snb-2520m bat-adls-6 

Known issues
------------

  Here are the changes found in IGTPW_14258 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@i915_selftest@live:
    - bat-mtlp-8:         [DMESG-FAIL][1] ([i915#12061]) -> [PASS][2] +1 other test pass
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8674/bat-mtlp-8/igt@i915_selftest@live.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14258/bat-mtlp-8/igt@i915_selftest@live.html

  * igt@i915_selftest@live@sanitycheck:
    - bat-apl-1:          [DMESG-WARN][3] ([i915#13735]) -> [PASS][4] +77 other tests pass
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8674/bat-apl-1/igt@i915_selftest@live@sanitycheck.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14258/bat-apl-1/igt@i915_selftest@live@sanitycheck.html

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - bat-apl-1:          [DMESG-WARN][5] ([i915#13735] / [i915#180]) -> [PASS][6] +49 other tests pass
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8674/bat-apl-1/igt@kms_pm_rpm@basic-pci-d3-state.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14258/bat-apl-1/igt@kms_pm_rpm@basic-pci-d3-state.html

  
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#13735]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735
  [i915#180]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8674 -> IGTPW_14258
  * Linux: CI_DRM_17706 -> CI_DRM_17732

  CI-20190529: 20190529
  CI_DRM_17706: e0eb6ad399f8369d978ca40f07cbf5c6c16647d7 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_17732: f101d56dc32350daa45c130ff7a6d46512f614a9 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_14258: 4e1abea34ca2efb47d68eeb8139714a0d1c9fae6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8674: f38f4d8e9c65aff45ac807e646d06e38bc3193a2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14258/index.html

--===============5183809915655364979==
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
<tr><td><b>Series:</b></td><td>lib/kms: Carve up igt_display_require() (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/159165/">https://patchwork.freedesktop.org/series/159165/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14258/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14258/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8674 -&gt; IGTPW_14258</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14258/index.html</p>
<h2>Participating hosts (43 -&gt; 40)</h2>
<p>Missing    (3): bat-dg2-13 fi-snb-2520m bat-adls-6 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_14258 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8674/bat-mtlp-8/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14258/bat-mtlp-8/igt@i915_selftest@live.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@sanitycheck:</p>
<ul>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8674/bat-apl-1/igt@i915_selftest@live@sanitycheck.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735">i915#13735</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14258/bat-apl-1/igt@i915_selftest@live@sanitycheck.html">PASS</a> +77 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8674/bat-apl-1/igt@kms_pm_rpm@basic-pci-d3-state.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735">i915#13735</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14258/bat-apl-1/igt@kms_pm_rpm@basic-pci-d3-state.html">PASS</a> +49 other tests pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8674 -&gt; IGTPW_14258</li>
<li>Linux: CI_DRM_17706 -&gt; CI_DRM_17732</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_17706: e0eb6ad399f8369d978ca40f07cbf5c6c16647d7 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_17732: f101d56dc32350daa45c130ff7a6d46512f614a9 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_14258: 4e1abea34ca2efb47d68eeb8139714a0d1c9fae6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8674: f38f4d8e9c65aff45ac807e646d06e38bc3193a2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============5183809915655364979==--
