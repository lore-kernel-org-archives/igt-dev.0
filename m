Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DC8AC71135
	for <igt-dev@archiver.kernel.org>; Thu, 29 Aug 2024 09:32:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DB5C10E60B;
	Thu, 29 Aug 2024 09:32:10 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A82E310E60B;
 Thu, 29 Aug 2024 09:32:08 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8608809191537639266=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_lib/igt=5Fcore=3A_Refactor_?=
 =?utf-8?q?libpciaccess_init/cleanup_wrappers?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Marcin Bernatowicz" <marcin.bernatowicz@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 29 Aug 2024 09:32:08 -0000
Message-ID: <172492392868.830567.17753610374159084051@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240829075811.87076-1-marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20240829075811.87076-1-marcin.bernatowicz@linux.intel.com>
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

--===============8608809191537639266==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/igt_core: Refactor libpciaccess init/cleanup wrappers
URL   : https://patchwork.freedesktop.org/series/137949/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_15318 -> IGTPW_11661
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11661/index.html

Participating hosts (40 -> 37)
------------------------------

  Missing    (3): fi-glk-j4005 fi-snb-2520m bat-mtlp-6 

Known issues
------------

  Here are the changes found in IGTPW_11661 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_lmem_swapping@verify-random:
    - fi-cfl-8109u:       NOTRUN -> [SKIP][1] ([i915#4613]) +3 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11661/fi-cfl-8109u/igt@gem_lmem_swapping@verify-random.html

  * igt@kms_pm_backlight@basic-brightness:
    - fi-cfl-8109u:       NOTRUN -> [SKIP][2] +10 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11661/fi-cfl-8109u/igt@kms_pm_backlight@basic-brightness.html

  
#### Possible fixes ####

  * igt@gem_exec_parallel@engines@fds:
    - {bat-arlh-3}:       [INCOMPLETE][3] ([i915#11786]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15318/bat-arlh-3/igt@gem_exec_parallel@engines@fds.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11661/bat-arlh-3/igt@gem_exec_parallel@engines@fds.html

  * igt@kms_busy@basic@modeset:
    - fi-cfl-8109u:       [INCOMPLETE][5] ([i915#10056]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15318/fi-cfl-8109u/igt@kms_busy@basic@modeset.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11661/fi-cfl-8109u/igt@kms_busy@basic@modeset.html

  
#### Warnings ####

  * igt@fbdev@read:
    - bat-arls-1:         [DMESG-FAIL][7] ([i915#9157]) -> [DMESG-WARN][8] ([i915#9157])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15318/bat-arls-1/igt@fbdev@read.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11661/bat-arls-1/igt@fbdev@read.html

  * igt@i915_selftest@live@hangcheck:
    - bat-arls-2:         [DMESG-WARN][9] ([i915#11349]) -> [ABORT][10] ([i915#9500])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15318/bat-arls-2/igt@i915_selftest@live@hangcheck.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11661/bat-arls-2/igt@i915_selftest@live@hangcheck.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10056]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10056
  [i915#10196]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10196
  [i915#11343]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11343
  [i915#11346]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346
  [i915#11349]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11349
  [i915#11666]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11666
  [i915#11671]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11671
  [i915#11681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
  [i915#11723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11723
  [i915#11724]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11724
  [i915#11725]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11725
  [i915#11726]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11726
  [i915#11786]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11786
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#8809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8809
  [i915#9157]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9157
  [i915#9500]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9500
  [i915#9886]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9886


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7997 -> IGTPW_11661

  CI-20190529: 20190529
  CI_DRM_15318: 6d5d77a2ec2865053755f00bbdfc0d0bf765ee97 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_11661: a1d77f356ed3e37577149361583b6052797cc13a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7997: c70810080fa12a37859c45f16445797c5d849d4d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11661/index.html

--===============8608809191537639266==
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
<tr><td><b>Series:</b></td><td>lib/igt_core: Refactor libpciaccess init/cleanup wrappers</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/137949/">https://patchwork.freedesktop.org/series/137949/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11661/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11661/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_15318 -&gt; IGTPW_11661</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11661/index.html</p>
<h2>Participating hosts (40 -&gt; 37)</h2>
<p>Missing    (3): fi-glk-j4005 fi-snb-2520m bat-mtlp-6 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11661 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_lmem_swapping@verify-random:</p>
<ul>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11661/fi-cfl-8109u/igt@gem_lmem_swapping@verify-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11661/fi-cfl-8109u/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> +10 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_parallel@engines@fds:</p>
<ul>
<li>{bat-arlh-3}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15318/bat-arlh-3/igt@gem_exec_parallel@engines@fds.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11786">i915#11786</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11661/bat-arlh-3/igt@gem_exec_parallel@engines@fds.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic@modeset:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15318/fi-cfl-8109u/igt@kms_busy@basic@modeset.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10056">i915#10056</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11661/fi-cfl-8109u/igt@kms_busy@basic@modeset.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>bat-arls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15318/bat-arls-1/igt@fbdev@read.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9157">i915#9157</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11661/bat-arls-1/igt@fbdev@read.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9157">i915#9157</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>bat-arls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15318/bat-arls-2/igt@i915_selftest@live@hangcheck.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11349">i915#11349</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11661/bat-arls-2/igt@i915_selftest@live@hangcheck.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9500">i915#9500</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7997 -&gt; IGTPW_11661</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_15318: 6d5d77a2ec2865053755f00bbdfc0d0bf765ee97 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_11661: a1d77f356ed3e37577149361583b6052797cc13a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7997: c70810080fa12a37859c45f16445797c5d849d4d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============8608809191537639266==--
