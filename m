Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05A06C5475B
	for <igt-dev@archiver.kernel.org>; Wed,  6 Mar 2024 05:12:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7199B112ED4;
	Wed,  6 Mar 2024 05:12:15 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97B08112ED4;
 Wed,  6 Mar 2024 05:12:13 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0604683160278220378=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBAT=3A_failure_for_series_starting_with_=5Bi-g?=
 =?utf-8?q?-t=2Cv4=2C1/4=5D_lib/igt=5Fsysfs=3A_Use_same_var_for_sizeof=28=29?=
 =?utf-8?q?_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 06 Mar 2024 05:12:13 -0000
Message-ID: <170970193361.524851.27587750844279414@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240228223134.3908035-1-lucas.demarchi@intel.com>
In-Reply-To: <20240228223134.3908035-1-lucas.demarchi@intel.com>
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

--===============0604683160278220378==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,v4,1/4] lib/igt_sysfs: Use same var for sizeof() (rev3)
URL   : https://patchwork.freedesktop.org/series/130530/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_14395 -> IGTPW_10783
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_10783 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_10783, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10783/index.html

Participating hosts (41 -> 39)
------------------------------

  Missing    (2): fi-apl-guc fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_10783:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_module_load@load:
    - bat-arls-2:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14395/bat-arls-2/igt@i915_module_load@load.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10783/bat-arls-2/igt@i915_module_load@load.html

  * igt@i915_selftest@live@gt_heartbeat:
    - bat-dg2-8:          [PASS][3] -> [ABORT][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14395/bat-dg2-8/igt@i915_selftest@live@gt_heartbeat.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10783/bat-dg2-8/igt@i915_selftest@live@gt_heartbeat.html

  
Known issues
------------

  Here are the changes found in IGTPW_10783 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@i915_selftest@live@guc_hang:
    - bat-arls-3:         [DMESG-FAIL][5] ([i915#10262]) -> [PASS][6] +12 other tests pass
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14395/bat-arls-3/igt@i915_selftest@live@guc_hang.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10783/bat-arls-3/igt@i915_selftest@live@guc_hang.html

  
  [i915#10262]: https://gitlab.freedesktop.org/drm/intel/issues/10262


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7746 -> IGTPW_10783

  CI-20190529: 20190529
  CI_DRM_14395: dd08fd912fdc1b72984a39852fdbee49b97b8ce4 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10783: 10783
  IGT_7746: 7746

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10783/index.html

--===============0604683160278220378==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,v4,1/4] lib/igt_sysfs: Use same var for sizeof() (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/130530/">https://patchwork.freedesktop.org/series/130530/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10783/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10783/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_14395 -&gt; IGTPW_10783</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_10783 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_10783, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10783/index.html</p>
<h2>Participating hosts (41 -&gt; 39)</h2>
<p>Missing    (2): fi-apl-guc fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_10783:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>bat-arls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14395/bat-arls-2/igt@i915_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10783/bat-arls-2/igt@i915_module_load@load.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14395/bat-dg2-8/igt@i915_selftest@live@gt_heartbeat.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10783/bat-dg2-8/igt@i915_selftest@live@gt_heartbeat.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10783 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live@guc_hang:<ul>
<li>bat-arls-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14395/bat-arls-3/igt@i915_selftest@live@guc_hang.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10262">i915#10262</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10783/bat-arls-3/igt@i915_selftest@live@guc_hang.html">PASS</a> +12 other tests pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7746 -&gt; IGTPW_10783</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14395: dd08fd912fdc1b72984a39852fdbee49b97b8ce4 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10783: 10783<br />
  IGT_7746: 7746</p>

</body>
</html>

--===============0604683160278220378==--
