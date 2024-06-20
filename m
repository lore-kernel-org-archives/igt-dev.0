Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3847BC2BA1A
	for <igt-dev@archiver.kernel.org>; Thu, 20 Jun 2024 18:58:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8320C10E07D;
	Thu, 20 Jun 2024 18:58:26 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13FA810E07D;
 Thu, 20 Jun 2024 18:58:25 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8169956254688789619=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_series_starting_with_=5Bi-g?=
 =?utf-8?q?-t=2C1/2=5D_tests/kms=5Fvrr=3A_Skip_low_RR_mode_check_for_seamles?=
 =?utf-8?q?s-virtual_subtest_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 20 Jun 2024 18:58:25 -0000
Message-ID: <171890990507.127624.2931293808132953914@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240620082834.4169435-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20240620082834.4169435-1-bhanuprakash.modem@intel.com>
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

--===============8169956254688789619==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,1/2] tests/kms_vrr: Skip low RR mode check for seamless-virtual subtest (rev2)
URL   : https://patchwork.freedesktop.org/series/135102/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_14981 -> IGTPW_11289
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11289/index.html

Participating hosts (42 -> 35)
------------------------------

  Additional (1): fi-glk-j4005 
  Missing    (8): bat-kbl-2 fi-bsw-n3050 fi-snb-2520m fi-kbl-8809g fi-cfl-8109u fi-elk-e7500 bat-dg2-11 bat-jsl-3 

Known issues
------------

  Here are the changes found in IGTPW_11289 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_huc_copy@huc-copy:
    - fi-glk-j4005:       NOTRUN -> [SKIP][1] ([i915#2190])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11289/fi-glk-j4005/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@basic:
    - fi-glk-j4005:       NOTRUN -> [SKIP][2] ([i915#4613]) +3 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11289/fi-glk-j4005/igt@gem_lmem_swapping@basic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - fi-glk-j4005:       NOTRUN -> [SKIP][3] +10 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11289/fi-glk-j4005/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  
#### Possible fixes ####

  * igt@i915_pm_rpm@module-reload:
    - {bat-mtlp-9}:       [SKIP][4] -> [PASS][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14981/bat-mtlp-9/igt@i915_pm_rpm@module-reload.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11289/bat-mtlp-9/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live@hangcheck:
    - {bat-mtlp-9}:       [DMESG-WARN][6] ([i915#11349]) -> [PASS][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14981/bat-mtlp-9/igt@i915_selftest@live@hangcheck.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11289/bat-mtlp-9/igt@i915_selftest@live@hangcheck.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-arls-2:         [DMESG-WARN][8] ([i915#7507]) -> [PASS][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14981/bat-arls-2/igt@kms_frontbuffer_tracking@basic.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11289/bat-arls-2/igt@kms_frontbuffer_tracking@basic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#11009]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11009
  [i915#11349]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11349
  [i915#2190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#7507]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7507


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7894 -> IGTPW_11289

  CI-20190529: 20190529
  CI_DRM_14981: 300968fc8a02f50ce96efdc9be4f1f17f3a486d4 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_11289: 8f7de65afb408b374890c1578d9beee58e48bbf1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7894: 7894

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11289/index.html

--===============8169956254688789619==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,1/2] tests/kms_vrr: Skip low RR mode check for seamless-virtual subtest (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/135102/">https://patchwork.freedesktop.org/series/135102/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11289/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11289/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_14981 -&gt; IGTPW_11289</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11289/index.html</p>
<h2>Participating hosts (42 -&gt; 35)</h2>
<p>Additional (1): fi-glk-j4005 <br />
  Missing    (8): bat-kbl-2 fi-bsw-n3050 fi-snb-2520m fi-kbl-8809g fi-cfl-8109u fi-elk-e7500 bat-dg2-11 bat-jsl-3 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11289 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11289/fi-glk-j4005/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11289/fi-glk-j4005/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11289/fi-glk-j4005/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> +10 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>{bat-mtlp-9}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14981/bat-mtlp-9/igt@i915_pm_rpm@module-reload.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11289/bat-mtlp-9/igt@i915_pm_rpm@module-reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>{bat-mtlp-9}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14981/bat-mtlp-9/igt@i915_selftest@live@hangcheck.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11349">i915#11349</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11289/bat-mtlp-9/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-arls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14981/bat-arls-2/igt@kms_frontbuffer_tracking@basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7507">i915#7507</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11289/bat-arls-2/igt@kms_frontbuffer_tracking@basic.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7894 -&gt; IGTPW_11289</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14981: 300968fc8a02f50ce96efdc9be4f1f17f3a486d4 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_11289: 8f7de65afb408b374890c1578d9beee58e48bbf1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7894: 7894</p>

</body>
</html>

--===============8169956254688789619==--
