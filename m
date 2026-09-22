Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98724C982FE
	for <igt-dev@archiver.kernel.org>; Tue, 22 Sep 2026 06:33:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3563B10E3F3;
	Tue, 22 Sep 2026 06:33:50 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9EB710EB82;
 Tue, 22 Sep 2026 06:33:03 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2097040839048225060=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_intel-ci=3A_blocklist_mul?=
 =?utf-8?q?ti-queue_tests_on_BMG=2C_LNL=2C_PTL_and_WCL_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: shivtej.eknath.patil@intel.com
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 22 Sep 2026 06:33:03 -0000
Message-ID: <179005878395.190466.464676077125711186@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260922051921.24701-1-shivtej.eknath.patil@intel.com>
In-Reply-To: <20260922051921.24701-1-shivtej.eknath.patil@intel.com>
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

--===============2097040839048225060==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: intel-ci: blocklist multi-queue tests on BMG, LNL, PTL and WCL (rev2)
URL   : https://patchwork.freedesktop.org/series/174557/
State : success

== Summary ==

CI Bug Log - changes from IGT_9105 -> IGTPW_15879
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15879/index.html

Participating hosts (39 -> 37)
------------------------------

  Missing    (2): bat-dg2-13 fi-glk-j4005 

Known issues
------------

  Here are the changes found in IGTPW_15879 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@i915_selftest@live@sanitycheck:
    - fi-kbl-7567u:       [DMESG-WARN][1] ([i915#13735]) -> [PASS][2] +79 other tests pass
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9105/fi-kbl-7567u/igt@i915_selftest@live@sanitycheck.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15879/fi-kbl-7567u/igt@i915_selftest@live@sanitycheck.html
    - bat-apl-1:          [DMESG-WARN][3] ([i915#13735]) -> [PASS][4] +77 other tests pass
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9105/bat-apl-1/igt@i915_selftest@live@sanitycheck.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15879/bat-apl-1/igt@i915_selftest@live@sanitycheck.html

  * igt@kms_busy@basic@flip:
    - fi-kbl-7567u:       [DMESG-WARN][5] ([i915#13735] / [i915#180]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9105/fi-kbl-7567u/igt@kms_busy@basic@flip.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15879/fi-kbl-7567u/igt@kms_busy@basic@flip.html

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - fi-kbl-7567u:       [DMESG-WARN][7] ([i915#13735] / [i915#15673] / [i915#180]) -> [PASS][8] +52 other tests pass
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9105/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15879/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html
    - bat-apl-1:          [DMESG-WARN][9] ([i915#13735] / [i915#180]) -> [PASS][10] +49 other tests pass
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9105/bat-apl-1/igt@kms_pm_rpm@basic-pci-d3-state.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15879/bat-apl-1/igt@kms_pm_rpm@basic-pci-d3-state.html

  
  [i915#13735]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735
  [i915#15673]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15673
  [i915#180]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9105 -> IGTPW_15879
  * Linux: CI_DRM_19196 -> CI_DRM_19197

  CI-20190529: 20190529
  CI_DRM_19196: e18dbf3ff12d594198c65b22eadcae577e638866 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_19197: dfe5a8188de9aaddd4e46b0f2410d0bccd5c1c04 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15879: 15879
  IGT_9105: 9105

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15879/index.html

--===============2097040839048225060==
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
<tr><td><b>Series:</b></td><td>intel-ci: blocklist multi-queue tests on BMG, LNL, PTL and WCL (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/174557/">https://patchwork.freedesktop.org/series/174557/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15879/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15879/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_9105 -&gt; IGTPW_15879</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15879/index.html</p>
<h2>Participating hosts (39 -&gt; 37)</h2>
<p>Missing    (2): bat-dg2-13 fi-glk-j4005 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_15879 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@sanitycheck:</p>
<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9105/fi-kbl-7567u/igt@i915_selftest@live@sanitycheck.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735">i915#13735</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15879/fi-kbl-7567u/igt@i915_selftest@live@sanitycheck.html">PASS</a> +79 other tests pass</li>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9105/bat-apl-1/igt@i915_selftest@live@sanitycheck.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735">i915#13735</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15879/bat-apl-1/igt@i915_selftest@live@sanitycheck.html">PASS</a> +77 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic@flip:</p>
<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9105/fi-kbl-7567u/igt@kms_busy@basic@flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735">i915#13735</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15879/fi-kbl-7567u/igt@kms_busy@basic@flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9105/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735">i915#13735</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15673">i915#15673</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15879/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html">PASS</a> +52 other tests pass</li>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9105/bat-apl-1/igt@kms_pm_rpm@basic-pci-d3-state.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735">i915#13735</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15879/bat-apl-1/igt@kms_pm_rpm@basic-pci-d3-state.html">PASS</a> +49 other tests pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9105 -&gt; IGTPW_15879</li>
<li>Linux: CI_DRM_19196 -&gt; CI_DRM_19197</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19196: e18dbf3ff12d594198c65b22eadcae577e638866 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_19197: dfe5a8188de9aaddd4e46b0f2410d0bccd5c1c04 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15879: 15879<br />
  IGT_9105: 9105</p>

</body>
</html>

--===============2097040839048225060==--
