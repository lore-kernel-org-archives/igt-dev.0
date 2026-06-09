Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EEADCD8CAD
	for <igt-dev@archiver.kernel.org>; Tue,  9 Jun 2026 18:37:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8DF910E5D6;
	Tue,  9 Jun 2026 18:37:03 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5842B10E5CB;
 Tue,  9 Jun 2026 18:36:39 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3693503497464387773=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_tests/xe=5Fexec=5Freset?=
 =?utf-8?q?=3A_Replace_fixed_usleep_with_dynamic_GT_idle_wait_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Xin Wang" <x.wang@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 09 Jun 2026 18:36:39 -0000
Message-ID: <178103019935.61411.3739384020650094216@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260609162501.2182610-1-x.wang@intel.com>
In-Reply-To: <20260609162501.2182610-1-x.wang@intel.com>
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

--===============3693503497464387773==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/xe_exec_reset: Replace fixed usleep with dynamic GT idle wait (rev2)
URL   : https://patchwork.freedesktop.org/series/168132/
State : success

== Summary ==

CI Bug Log - changes from IGT_8956 -> IGTPW_15333
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15333/index.html

Participating hosts (42 -> 39)
------------------------------

  Missing    (3): bat-dg2-13 fi-snb-2520m bat-adls-6 

Known issues
------------

  Here are the changes found in IGTPW_15333 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@dmabuf@all-tests:
    - bat-arlh-3:         NOTRUN -> [SKIP][1] ([i915#15931])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15333/bat-arlh-3/igt@dmabuf@all-tests.html
    - bat-rpls-4:         NOTRUN -> [SKIP][2] ([i915#15931])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15333/bat-rpls-4/igt@dmabuf@all-tests.html

  * igt@gem_lmem_swapping@random-engines:
    - fi-skl-6600u:       NOTRUN -> [SKIP][3] ([i915#4613]) +3 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15333/fi-skl-6600u/igt@gem_lmem_swapping@random-engines.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - fi-skl-6600u:       NOTRUN -> [SKIP][4] +1 other test skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15333/fi-skl-6600u/igt@kms_setmode@basic-clone-single-crtc.html

  
#### Possible fixes ####

  * igt@i915_pm_rpm@module-reload:
    - bat-rpls-4:         [INCOMPLETE][5] -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8956/bat-rpls-4/igt@i915_pm_rpm@module-reload.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15333/bat-rpls-4/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live:
    - bat-arlh-3:         [INCOMPLETE][7] ([i915#16139]) -> [PASS][8] +1 other test pass
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8956/bat-arlh-3/igt@i915_selftest@live.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15333/bat-arlh-3/igt@i915_selftest@live.html

  * igt@i915_selftest@live@late_gt_pm:
    - fi-cfl-8109u:       [DMESG-WARN][9] ([i915#13735]) -> [PASS][10] +80 other tests pass
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8956/fi-cfl-8109u/igt@i915_selftest@live@late_gt_pm.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15333/fi-cfl-8109u/igt@i915_selftest@live@late_gt_pm.html

  * igt@kms_pipe_crc_basic@read-crc:
    - fi-cfl-8109u:       [DMESG-WARN][11] ([i915#13735] / [i915#15673]) -> [PASS][12] +49 other tests pass
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8956/fi-cfl-8109u/igt@kms_pipe_crc_basic@read-crc.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15333/fi-cfl-8109u/igt@kms_pipe_crc_basic@read-crc.html
    - fi-skl-6600u:       [INCOMPLETE][13] ([i915#10056]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8956/fi-skl-6600u/igt@kms_pipe_crc_basic@read-crc.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15333/fi-skl-6600u/igt@kms_pipe_crc_basic@read-crc.html

  * igt@kms_pipe_crc_basic@read-crc@pipe-a-edp-1:
    - fi-skl-6600u:       [INCOMPLETE][15] -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8956/fi-skl-6600u/igt@kms_pipe_crc_basic@read-crc@pipe-a-edp-1.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15333/fi-skl-6600u/igt@kms_pipe_crc_basic@read-crc@pipe-a-edp-1.html

  
  [i915#10056]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10056
  [i915#13735]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735
  [i915#15673]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15673
  [i915#15931]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15931
  [i915#16139]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16139
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8956 -> IGTPW_15333
  * Linux: CI_DRM_18648 -> CI_DRM_18650

  CI-20190529: 20190529
  CI_DRM_18648: 1e8798282ef0590ad21ca33d80e225208d9c7864 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_18650: 71a7a2a7c1c9271044945eabd9aa1b1b04c6ece3 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15333: 88964437c4428715a6065f3a48f1332cf53335dc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8956: 8956

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15333/index.html

--===============3693503497464387773==
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
<tr><td><b>Series:</b></td><td>tests/xe_exec_reset: Replace fixed usleep with dynamic GT idle wait (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/168132/">https://patchwork.freedesktop.org/series/168132/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15333/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15333/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8956 -&gt; IGTPW_15333</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15333/index.html</p>
<h2>Participating hosts (42 -&gt; 39)</h2>
<p>Missing    (3): bat-dg2-13 fi-snb-2520m bat-adls-6 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_15333 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@dmabuf@all-tests:</p>
<ul>
<li>bat-arlh-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15333/bat-arlh-3/igt@dmabuf@all-tests.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15931">i915#15931</a>)</li>
<li>bat-rpls-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15333/bat-rpls-4/igt@dmabuf@all-tests.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15931">i915#15931</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random-engines:</p>
<ul>
<li>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15333/fi-skl-6600u/igt@gem_lmem_swapping@random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15333/fi-skl-6600u/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>bat-rpls-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8956/bat-rpls-4/igt@i915_pm_rpm@module-reload.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15333/bat-rpls-4/igt@i915_pm_rpm@module-reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8956/bat-arlh-3/igt@i915_selftest@live.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16139">i915#16139</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15333/bat-arlh-3/igt@i915_selftest@live.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@late_gt_pm:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8956/fi-cfl-8109u/igt@i915_selftest@live@late_gt_pm.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735">i915#13735</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15333/fi-cfl-8109u/igt@i915_selftest@live@late_gt_pm.html">PASS</a> +80 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8956/fi-cfl-8109u/igt@kms_pipe_crc_basic@read-crc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735">i915#13735</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15673">i915#15673</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15333/fi-cfl-8109u/igt@kms_pipe_crc_basic@read-crc.html">PASS</a> +49 other tests pass</li>
<li>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8956/fi-skl-6600u/igt@kms_pipe_crc_basic@read-crc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10056">i915#10056</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15333/fi-skl-6600u/igt@kms_pipe_crc_basic@read-crc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-a-edp-1:</p>
<ul>
<li>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8956/fi-skl-6600u/igt@kms_pipe_crc_basic@read-crc@pipe-a-edp-1.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15333/fi-skl-6600u/igt@kms_pipe_crc_basic@read-crc@pipe-a-edp-1.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8956 -&gt; IGTPW_15333</li>
<li>Linux: CI_DRM_18648 -&gt; CI_DRM_18650</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18648: 1e8798282ef0590ad21ca33d80e225208d9c7864 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_18650: 71a7a2a7c1c9271044945eabd9aa1b1b04c6ece3 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15333: 88964437c4428715a6065f3a48f1332cf53335dc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8956: 8956</p>

</body>
</html>

--===============3693503497464387773==--
