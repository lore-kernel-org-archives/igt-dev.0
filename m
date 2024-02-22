Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BE51C48BF8
	for <igt-dev@archiver.kernel.org>; Thu, 22 Feb 2024 20:23:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE95910EA5F;
	Thu, 22 Feb 2024 20:23:22 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 469CC10EA60;
 Thu, 22 Feb 2024 20:23:21 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5632732703954933727=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_series_starting_with_=5Bi-g?=
 =?utf-8?q?-t=2Cv2=2C1/2=5D_lib/igt=5Fsysfs=3A_Use_same_var_for_sizeof=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 22 Feb 2024 20:23:21 -0000
Message-ID: <170863340128.217031.4861385484400293140@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240222193326.3004623-1-lucas.demarchi@intel.com>
In-Reply-To: <20240222193326.3004623-1-lucas.demarchi@intel.com>
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

--===============5632732703954933727==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,v2,1/2] lib/igt_sysfs: Use same var for sizeof()
URL   : https://patchwork.freedesktop.org/series/130283/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_14319 -> IGTPW_10725
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10725/index.html

Participating hosts (38 -> 37)
------------------------------

  Missing    (1): fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_10725:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@i915_pm_rpm@module-reload:
    - {bat-arls-1}:       [DMESG-WARN][1] ([i915#10194] / [i915#10215]) -> [SKIP][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14319/bat-arls-1/igt@i915_pm_rpm@module-reload.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10725/bat-arls-1/igt@i915_pm_rpm@module-reload.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - {bat-dg2-13}:       [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14319/bat-dg2-13/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10725/bat-dg2-13/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  
Known issues
------------

  Here are the changes found in IGTPW_10725 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@execlists:
    - fi-bsw-nick:        [PASS][5] -> [ABORT][6] ([i915#7911])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14319/fi-bsw-nick/igt@i915_selftest@live@execlists.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10725/fi-bsw-nick/igt@i915_selftest@live@execlists.html

  
#### Possible fixes ####

  * igt@gem_exec_create@basic@smem:
    - {bat-arls-1}:       [DMESG-WARN][7] ([i915#10194]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14319/bat-arls-1/igt@gem_exec_create@basic@smem.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10725/bat-arls-1/igt@gem_exec_create@basic@smem.html

  * igt@i915_selftest@live@gt_mocs:
    - bat-jsl-3:          [INCOMPLETE][9] -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14319/bat-jsl-3/igt@i915_selftest@live@gt_mocs.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10725/bat-jsl-3/igt@i915_selftest@live@gt_mocs.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10194]: https://gitlab.freedesktop.org/drm/intel/issues/10194
  [i915#10196]: https://gitlab.freedesktop.org/drm/intel/issues/10196
  [i915#10200]: https://gitlab.freedesktop.org/drm/intel/issues/10200
  [i915#10202]: https://gitlab.freedesktop.org/drm/intel/issues/10202
  [i915#10206]: https://gitlab.freedesktop.org/drm/intel/issues/10206
  [i915#10207]: https://gitlab.freedesktop.org/drm/intel/issues/10207
  [i915#10208]: https://gitlab.freedesktop.org/drm/intel/issues/10208
  [i915#10209]: https://gitlab.freedesktop.org/drm/intel/issues/10209
  [i915#10212]: https://gitlab.freedesktop.org/drm/intel/issues/10212
  [i915#10213]: https://gitlab.freedesktop.org/drm/intel/issues/10213
  [i915#10214]: https://gitlab.freedesktop.org/drm/intel/issues/10214
  [i915#10215]: https://gitlab.freedesktop.org/drm/intel/issues/10215
  [i915#10216]: https://gitlab.freedesktop.org/drm/intel/issues/10216
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#7911]: https://gitlab.freedesktop.org/drm/intel/issues/7911
  [i915#8809]: https://gitlab.freedesktop.org/drm/intel/issues/8809
  [i915#9688]: https://gitlab.freedesktop.org/drm/intel/issues/9688
  [i915#9886]: https://gitlab.freedesktop.org/drm/intel/issues/9886


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7724 -> IGTPW_10725

  CI-20190529: 20190529
  CI_DRM_14319: 5dfa3c2da4803652582408bfb3c529970735f594 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10725: 10725
  IGT_7724: a7c03f7521f88f74fdf17c744fd847a775f9951f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10725/index.html

--===============5632732703954933727==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,v2,1/2] lib/igt_sysfs: Use same var for sizeof()</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/130283/">https://patchwork.freedesktop.org/series/130283/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10725/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10725/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_14319 -&gt; IGTPW_10725</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10725/index.html</p>
<h2>Participating hosts (38 -&gt; 37)</h2>
<p>Missing    (1): fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_10725:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>{bat-arls-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14319/bat-arls-1/igt@i915_pm_rpm@module-reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10194">i915#10194</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/10215">i915#10215</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10725/bat-arls-1/igt@i915_pm_rpm@module-reload.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>{bat-dg2-13}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14319/bat-dg2-13/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10725/bat-dg2-13/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10725 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@i915_selftest@live@execlists:<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14319/fi-bsw-nick/igt@i915_selftest@live@execlists.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10725/fi-bsw-nick/igt@i915_selftest@live@execlists.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7911">i915#7911</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_create@basic@smem:</p>
<ul>
<li>{bat-arls-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14319/bat-arls-1/igt@gem_exec_create@basic@smem.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10194">i915#10194</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10725/bat-arls-1/igt@gem_exec_create@basic@smem.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_mocs:</p>
<ul>
<li>bat-jsl-3:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14319/bat-jsl-3/igt@i915_selftest@live@gt_mocs.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10725/bat-jsl-3/igt@i915_selftest@live@gt_mocs.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7724 -&gt; IGTPW_10725</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14319: 5dfa3c2da4803652582408bfb3c529970735f594 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10725: 10725<br />
  IGT_7724: a7c03f7521f88f74fdf17c744fd847a775f9951f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============5632732703954933727==--
