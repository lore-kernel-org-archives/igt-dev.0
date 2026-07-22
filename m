Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43288C44536
	for <igt-dev@archiver.kernel.org>; Wed, 22 Jul 2026 13:10:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7E4710E2D6;
	Wed, 22 Jul 2026 13:10:10 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1F6F10E2D6;
 Wed, 22 Jul 2026 13:09:38 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6734654391605882765=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_series_starting_with_=5Bi?=
 =?utf-8?q?-g-t=2CV2=2C1/2=5D_tests/amdgpu/amd=5Fdeadlock=3A_add_gfx_user-qu?=
 =?utf-8?q?eue_clean-hang_reset_test?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jesse Zhang" <jesse.zhang@amd.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 22 Jul 2026 13:09:38 -0000
Message-ID: <178472577884.216306.9655952900977520055@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260722062137.3019454-1-Jesse.Zhang@amd.com>
In-Reply-To: <20260722062137.3019454-1-Jesse.Zhang@amd.com>
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

--===============6734654391605882765==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,V2,1/2] tests/amdgpu/amd_deadlock: add gfx user-queue clean-hang reset test
URL   : https://patchwork.freedesktop.org/series/170884/
State : success

== Summary ==

CI Bug Log - changes from IGT_9018 -> IGTPW_15579
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15579/index.html

Participating hosts (42 -> 38)
------------------------------

  Missing    (4): fi-ilk-650 bat-dg2-13 fi-snb-2520m fi-pnv-d510 

Known issues
------------

  Here are the changes found in IGTPW_15579 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@i915_selftest@live@sanitycheck:
    - fi-kbl-7567u:       [DMESG-WARN][1] ([i915#13735]) -> [PASS][2] +79 other tests pass
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9018/fi-kbl-7567u/igt@i915_selftest@live@sanitycheck.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15579/fi-kbl-7567u/igt@i915_selftest@live@sanitycheck.html

  * igt@kms_busy@basic@flip:
    - fi-kbl-7567u:       [DMESG-WARN][3] ([i915#13735] / [i915#180]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9018/fi-kbl-7567u/igt@kms_busy@basic@flip.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15579/fi-kbl-7567u/igt@kms_busy@basic@flip.html

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - fi-kbl-7567u:       [DMESG-WARN][5] ([i915#13735] / [i915#15673] / [i915#180]) -> [PASS][6] +52 other tests pass
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9018/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15579/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html

  
  [i915#13735]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735
  [i915#15673]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15673
  [i915#180]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9018 -> IGTPW_15579
  * Linux: CI_DRM_18871 -> CI_DRM_18874

  CI-20190529: 20190529
  CI_DRM_18871: 5726f9c4bde0290e5e60e636b9632bb03a57498c @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_18874: a2dbc8135f5db01ae8e10adbd7e47566806c5b15 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15579: 15579
  IGT_9018: f4345861cbd5d97fd50b73bf7af5fe3286fca056 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15579/index.html

--===============6734654391605882765==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,V2,1/2] tests/amdgpu/amd_deadlock: add gfx user-queue clean-hang reset test</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/170884/">https://patchwork.freedesktop.org/series/170884/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15579/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15579/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_9018 -&gt; IGTPW_15579</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15579/index.html</p>
<h2>Participating hosts (42 -&gt; 38)</h2>
<p>Missing    (4): fi-ilk-650 bat-dg2-13 fi-snb-2520m fi-pnv-d510 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_15579 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@sanitycheck:</p>
<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9018/fi-kbl-7567u/igt@i915_selftest@live@sanitycheck.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735">i915#13735</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15579/fi-kbl-7567u/igt@i915_selftest@live@sanitycheck.html">PASS</a> +79 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic@flip:</p>
<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9018/fi-kbl-7567u/igt@kms_busy@basic@flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735">i915#13735</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15579/fi-kbl-7567u/igt@kms_busy@basic@flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9018/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735">i915#13735</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15673">i915#15673</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15579/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html">PASS</a> +52 other tests pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9018 -&gt; IGTPW_15579</li>
<li>Linux: CI_DRM_18871 -&gt; CI_DRM_18874</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18871: 5726f9c4bde0290e5e60e636b9632bb03a57498c @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_18874: a2dbc8135f5db01ae8e10adbd7e47566806c5b15 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15579: 15579<br />
  IGT_9018: f4345861cbd5d97fd50b73bf7af5fe3286fca056 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============6734654391605882765==--
