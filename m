Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91A2610AB832
	for <igt-dev@archiver.kernel.org>; Fri, 27 Mar 2026 00:00:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 433DB10E180;
	Fri, 27 Mar 2026 00:00:36 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B5B710E180;
 Fri, 27 Mar 2026 00:00:29 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============9209660179317730961=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_Initial_dmem_cgroup_suppo?=
 =?utf-8?q?rt?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 27 Mar 2026 00:00:29 -0000
Message-ID: <177456962961.404029.15202089477165085556@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260326161007.39294-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20260326161007.39294-1-thomas.hellstrom@linux.intel.com>
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

--===============9209660179317730961==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Initial dmem cgroup support
URL   : https://patchwork.freedesktop.org/series/163935/
State : success

== Summary ==

CI Bug Log - changes from IGT_8834 -> IGTPW_14868
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14868/index.html

Participating hosts (41 -> 39)
------------------------------

  Missing    (2): bat-dg2-13 bat-mtlp-9 

Known issues
------------

  Here are the changes found in IGTPW_14868 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@hangcheck:
    - bat-arls-6:         [PASS][1] -> [DMESG-FAIL][2] ([i915#15861]) +1 other test dmesg-fail
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8834/bat-arls-6/igt@i915_selftest@live@hangcheck.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14868/bat-arls-6/igt@i915_selftest@live@hangcheck.html

  * igt@i915_selftest@live@mman:
    - bat-atsm-1:         [PASS][3] -> [DMESG-FAIL][4] ([i915#14204])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8834/bat-atsm-1/igt@i915_selftest@live@mman.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14868/bat-atsm-1/igt@i915_selftest@live@mman.html

  * igt@i915_selftest@live@sanitycheck:
    - fi-kbl-7567u:       [PASS][5] -> [DMESG-WARN][6] ([i915#13735]) +79 other tests dmesg-warn
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8834/fi-kbl-7567u/igt@i915_selftest@live@sanitycheck.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14868/fi-kbl-7567u/igt@i915_selftest@live@sanitycheck.html

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - fi-kbl-7567u:       [PASS][7] -> [DMESG-WARN][8] ([i915#13735] / [i915#180]) +53 other tests dmesg-warn
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8834/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14868/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html

  
#### Warnings ####

  * igt@i915_selftest@live:
    - bat-atsm-1:         [DMESG-FAIL][9] ([i915#12061]) -> [DMESG-FAIL][10] ([i915#12061] / [i915#14204])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8834/bat-atsm-1/igt@i915_selftest@live.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14868/bat-atsm-1/igt@i915_selftest@live.html

  
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#13735]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735
  [i915#14204]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14204
  [i915#15861]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15861
  [i915#180]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8834 -> IGTPW_14868
  * Linux: CI_DRM_18222 -> CI_DRM_18228

  CI-20190529: 20190529
  CI_DRM_18222: 2ccc868c40a9048ecf287b7bb002d73b5d25c7bf @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_18228: e7f370d78d32ed29cc3f100fbc3d1fe1a844978f @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_14868: 14868
  IGT_8834: 8834

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14868/index.html

--===============9209660179317730961==
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
<tr><td><b>Series:</b></td><td>Initial dmem cgroup support</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/163935/">https://patchwork.freedesktop.org/series/163935/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14868/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14868/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8834 -&gt; IGTPW_14868</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14868/index.html</p>
<h2>Participating hosts (41 -&gt; 39)</h2>
<p>Missing    (2): bat-dg2-13 bat-mtlp-9 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_14868 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>bat-arls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8834/bat-arls-6/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14868/bat-arls-6/igt@i915_selftest@live@hangcheck.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15861">i915#15861</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@mman:</p>
<ul>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8834/bat-atsm-1/igt@i915_selftest@live@mman.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14868/bat-atsm-1/igt@i915_selftest@live@mman.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14204">i915#14204</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@sanitycheck:</p>
<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8834/fi-kbl-7567u/igt@i915_selftest@live@sanitycheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14868/fi-kbl-7567u/igt@i915_selftest@live@sanitycheck.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735">i915#13735</a>) +79 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8834/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14868/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735">i915#13735</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180">i915#180</a>) +53 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@i915_selftest@live:<ul>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8834/bat-atsm-1/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14868/bat-atsm-1/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14204">i915#14204</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8834 -&gt; IGTPW_14868</li>
<li>Linux: CI_DRM_18222 -&gt; CI_DRM_18228</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18222: 2ccc868c40a9048ecf287b7bb002d73b5d25c7bf @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_18228: e7f370d78d32ed29cc3f100fbc3d1fe1a844978f @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_14868: 14868<br />
  IGT_8834: 8834</p>

</body>
</html>

--===============9209660179317730961==--
