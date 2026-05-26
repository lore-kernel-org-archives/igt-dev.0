Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97AF2CD5BB4
	for <igt-dev@archiver.kernel.org>; Tue, 26 May 2026 08:24:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AB3110E603;
	Tue, 26 May 2026 08:24:05 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 031E510E603;
 Tue, 26 May 2026 08:23:44 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6069757692322138690=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_Enable_and_Add_new_tests_?=
 =?utf-8?q?for_DC3CO?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "B, Jeevan" <jeevan.b@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 26 May 2026 08:23:44 -0000
Message-ID: <177978382400.8764.8817626373822168506@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260526064105.1818876-1-jeevan.b@intel.com>
In-Reply-To: <20260526064105.1818876-1-jeevan.b@intel.com>
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

--===============6069757692322138690==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Enable and Add new tests for DC3CO
URL   : https://patchwork.freedesktop.org/series/167247/
State : success

== Summary ==

CI Bug Log - changes from IGT_8937 -> IGTPW_15242
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15242/index.html

Participating hosts (41 -> 39)
------------------------------

  Missing    (2): bat-dg2-13 fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_15242 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@dmabuf@all-tests:
    - fi-bsw-nick:        NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15242/fi-bsw-nick/igt@dmabuf@all-tests.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@late_gt_pm:
    - fi-cfl-8109u:       [DMESG-WARN][2] ([i915#13735]) -> [PASS][3] +80 other tests pass
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8937/fi-cfl-8109u/igt@i915_selftest@live@late_gt_pm.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15242/fi-cfl-8109u/igt@i915_selftest@live@late_gt_pm.html
    - fi-bsw-nick:        [ABORT][4] ([i915#16257]) -> [PASS][5] +1 other test pass
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8937/fi-bsw-nick/igt@i915_selftest@live@late_gt_pm.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15242/fi-bsw-nick/igt@i915_selftest@live@late_gt_pm.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1:
    - fi-skl-6600u:       [DMESG-WARN][6] ([i915#16258]) -> [PASS][7] +1 other test pass
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8937/fi-skl-6600u/igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15242/fi-skl-6600u/igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1.html

  * igt@kms_pipe_crc_basic@read-crc:
    - fi-cfl-8109u:       [DMESG-WARN][8] ([i915#13735] / [i915#15673]) -> [PASS][9] +49 other tests pass
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8937/fi-cfl-8109u/igt@kms_pipe_crc_basic@read-crc.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15242/fi-cfl-8109u/igt@kms_pipe_crc_basic@read-crc.html

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - fi-kbl-7567u:       [DMESG-WARN][10] ([i915#15673]) -> [PASS][11] +51 other tests pass
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8937/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15242/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html

  
  [i915#13735]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735
  [i915#15673]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15673
  [i915#16257]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16257
  [i915#16258]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16258


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8937 -> IGTPW_15242
  * Linux: CI_DRM_18548 -> CI_DRM_18551

  CI-20190529: 20190529
  CI_DRM_18548: 04d475020800d0a1033ca89a0d6d5fc638ddc65b @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_18551: 6b6931ea69504481efd3df1cc99765141feb178c @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15242: 2a6009d0f6455a5cfff84796621c34b8d21c8d89 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8937: 8937

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15242/index.html

--===============6069757692322138690==
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
<tr><td><b>Series:</b></td><td>Enable and Add new tests for DC3CO</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/167247/">https://patchwork.freedesktop.org/series/167247/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15242/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15242/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8937 -&gt; IGTPW_15242</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15242/index.html</p>
<h2>Participating hosts (41 -&gt; 39)</h2>
<p>Missing    (2): bat-dg2-13 fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_15242 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@dmabuf@all-tests:<ul>
<li>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15242/fi-bsw-nick/igt@dmabuf@all-tests.html">SKIP</a></li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@late_gt_pm:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8937/fi-cfl-8109u/igt@i915_selftest@live@late_gt_pm.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735">i915#13735</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15242/fi-cfl-8109u/igt@i915_selftest@live@late_gt_pm.html">PASS</a> +80 other tests pass</li>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8937/fi-bsw-nick/igt@i915_selftest@live@late_gt_pm.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16257">i915#16257</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15242/fi-bsw-nick/igt@i915_selftest@live@late_gt_pm.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1:</p>
<ul>
<li>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8937/fi-skl-6600u/igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16258">i915#16258</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15242/fi-skl-6600u/igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8937/fi-cfl-8109u/igt@kms_pipe_crc_basic@read-crc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735">i915#13735</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15673">i915#15673</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15242/fi-cfl-8109u/igt@kms_pipe_crc_basic@read-crc.html">PASS</a> +49 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8937/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15673">i915#15673</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15242/fi-kbl-7567u/igt@kms_pm_rpm@basic-pci-d3-state.html">PASS</a> +51 other tests pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8937 -&gt; IGTPW_15242</li>
<li>Linux: CI_DRM_18548 -&gt; CI_DRM_18551</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18548: 04d475020800d0a1033ca89a0d6d5fc638ddc65b @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_18551: 6b6931ea69504481efd3df1cc99765141feb178c @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15242: 2a6009d0f6455a5cfff84796621c34b8d21c8d89 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8937: 8937</p>

</body>
</html>

--===============6069757692322138690==--
