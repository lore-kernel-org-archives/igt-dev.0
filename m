Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF6EFD37496
	for <igt-dev@archiver.kernel.org>; Fri,  5 Dec 2025 19:58:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A49CF10EBAD;
	Fri,  5 Dec 2025 19:58:20 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 317E510EBAC;
 Fri,  5 Dec 2025 19:58:20 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6758083516654325613=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_OA=3A_Run_MMIO_trigger_te?=
 =?utf-8?q?sts_on_all_OA_units_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 05 Dec 2025 19:58:20 -0000
Message-ID: <176496470019.62152.10434857016875690166@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251205000528.720706-1-ashutosh.dixit@intel.com>
In-Reply-To: <20251205000528.720706-1-ashutosh.dixit@intel.com>
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

--===============6758083516654325613==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: OA: Run MMIO trigger tests on all OA units (rev2)
URL   : https://patchwork.freedesktop.org/series/158083/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8657 -> IGTPW_14162
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_14162 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_14162, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14162/index.html

Participating hosts (45 -> 19)
------------------------------

  ERROR: It appears as if the changes made in IGTPW_14162 prevented too many machines from booting.

  Missing    (26): fi-snb-2520m bat-adlp-6 fi-skl-6600u bat-mtlp-9 fi-bsw-n3050 bat-dg2-8 bat-dg2-9 bat-twl-1 bat-rplp-1 bat-apl-1 bat-dg2-11 bat-arls-5 fi-bsw-nick bat-twl-2 bat-dg1-7 bat-arlh-3 bat-adlp-9 fi-glk-j4005 bat-dg1-6 bat-arls-6 bat-jsl-1 bat-mtlp-8 bat-adlp-11 bat-jsl-5 fi-kbl-x1275 bat-dg2-14 

Known issues
------------

  Here are the changes found in IGTPW_14162 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_pm_rpm@basic-rte:
    - bat-rpls-4:         [PASS][1] -> [DMESG-WARN][2] ([i915#13400])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8657/bat-rpls-4/igt@kms_pm_rpm@basic-rte.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14162/bat-rpls-4/igt@kms_pm_rpm@basic-rte.html

  
#### Warnings ####

  * igt@i915_selftest@live:
    - bat-atsm-1:         [DMESG-FAIL][3] ([i915#12061] / [i915#13929]) -> [DMESG-FAIL][4] ([i915#12061] / [i915#14204])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8657/bat-atsm-1/igt@i915_selftest@live.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14162/bat-atsm-1/igt@i915_selftest@live.html

  * igt@i915_selftest@live@mman:
    - bat-atsm-1:         [DMESG-FAIL][5] ([i915#13929]) -> [DMESG-FAIL][6] ([i915#14204])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8657/bat-atsm-1/igt@i915_selftest@live@mman.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14162/bat-atsm-1/igt@i915_selftest@live@mman.html

  
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#13400]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13400
  [i915#13929]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13929
  [i915#14204]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14204


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8657 -> IGTPW_14162

  CI-20190529: 20190529
  CI_DRM_17641: abc20a831a03dc608256340159c23e01ee6b6ead @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_14162: 1b560d5d0542bc2e385c92a61bb9985e810c9c8d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8657: 71c70567a9a965cb2942f01832e0b23aca4672f0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14162/index.html

--===============6758083516654325613==
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
<tr><td><b>Series:</b></td><td>OA: Run MMIO trigger tests on all OA units (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/158083/">https://patchwork.freedesktop.org/series/158083/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14162/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14162/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8657 -&gt; IGTPW_14162</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_14162 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_14162, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14162/index.html</p>
<h2>Participating hosts (45 -&gt; 19)</h2>
<p>ERROR: It appears as if the changes made in IGTPW_14162 prevented too many machines from booting.</p>
<p>Missing    (26): fi-snb-2520m bat-adlp-6 fi-skl-6600u bat-mtlp-9 fi-bsw-n3050 bat-dg2-8 bat-dg2-9 bat-twl-1 bat-rplp-1 bat-apl-1 bat-dg2-11 bat-arls-5 fi-bsw-nick bat-twl-2 bat-dg1-7 bat-arlh-3 bat-adlp-9 fi-glk-j4005 bat-dg1-6 bat-arls-6 bat-jsl-1 bat-mtlp-8 bat-adlp-11 bat-jsl-5 fi-kbl-x1275 bat-dg2-14 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_14162 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_pm_rpm@basic-rte:<ul>
<li>bat-rpls-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8657/bat-rpls-4/igt@kms_pm_rpm@basic-rte.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14162/bat-rpls-4/igt@kms_pm_rpm@basic-rte.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13400">i915#13400</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8657/bat-atsm-1/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13929">i915#13929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14162/bat-atsm-1/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14204">i915#14204</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@mman:</p>
<ul>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8657/bat-atsm-1/igt@i915_selftest@live@mman.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13929">i915#13929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14162/bat-atsm-1/igt@i915_selftest@live@mman.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14204">i915#14204</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8657 -&gt; IGTPW_14162</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_17641: abc20a831a03dc608256340159c23e01ee6b6ead @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_14162: 1b560d5d0542bc2e385c92a61bb9985e810c9c8d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8657: 71c70567a9a965cb2942f01832e0b23aca4672f0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============6758083516654325613==--
