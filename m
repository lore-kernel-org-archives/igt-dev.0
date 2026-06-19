Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C5A7CD98F0
	for <igt-dev@archiver.kernel.org>; Fri, 19 Jun 2026 00:55:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D930310E0AE;
	Fri, 19 Jun 2026 00:55:13 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B23C10E0AE;
 Fri, 19 Jun 2026 00:54:47 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7652323326698873426=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_lib/intel=5Fchipset=3A_Ex?=
 =?utf-8?q?tend_intel=5Fget=5Fpci=5Fdevice_to_PCI_accelerator_class_=28rev5?=
 =?utf-8?q?=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 19 Jun 2026 00:54:47 -0000
Message-ID: <178183048716.94877.12798067205145100799@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260618235403.396430-1-ashutosh.dixit@intel.com>
In-Reply-To: <20260618235403.396430-1-ashutosh.dixit@intel.com>
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

--===============7652323326698873426==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/intel_chipset: Extend intel_get_pci_device to PCI accelerator class (rev5)
URL   : https://patchwork.freedesktop.org/series/168385/
State : success

== Summary ==

CI Bug Log - changes from IGT_8974 -> IGTPW_15403
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15403/index.html

Participating hosts (41 -> 39)
------------------------------

  Missing    (2): bat-dg2-13 fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_15403 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@i915_pm_rpm@module-reload:
    - bat-adlp-6:         [DMESG-WARN][1] ([i915#15673]) -> [PASS][2] +78 other tests pass
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8974/bat-adlp-6/igt@i915_pm_rpm@module-reload.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15403/bat-adlp-6/igt@i915_pm_rpm@module-reload.html

  
  [i915#15673]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15673


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8974 -> IGTPW_15403
  * Linux: CI_DRM_18702 -> CI_DRM_18703

  CI-20190529: 20190529
  CI_DRM_18702: 24209d838338d162bb25aadfd637b11747a357ca @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_18703: 1f50384666a6193297d506b8df628ca428a48d42 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15403: 9ea5bb1614123c1c69f3283da4903e4f7090f71d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8974: 8974

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15403/index.html

--===============7652323326698873426==
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
<tr><td><b>Series:</b></td><td>lib/intel_chipset: Extend intel_get_pci_device to PCI accelerator class (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/168385/">https://patchwork.freedesktop.org/series/168385/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15403/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15403/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8974 -&gt; IGTPW_15403</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15403/index.html</p>
<h2>Participating hosts (41 -&gt; 39)</h2>
<p>Missing    (2): bat-dg2-13 fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_15403 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_pm_rpm@module-reload:<ul>
<li>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8974/bat-adlp-6/igt@i915_pm_rpm@module-reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15673">i915#15673</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15403/bat-adlp-6/igt@i915_pm_rpm@module-reload.html">PASS</a> +78 other tests pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8974 -&gt; IGTPW_15403</li>
<li>Linux: CI_DRM_18702 -&gt; CI_DRM_18703</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18702: 24209d838338d162bb25aadfd637b11747a357ca @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_18703: 1f50384666a6193297d506b8df628ca428a48d42 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15403: 9ea5bb1614123c1c69f3283da4903e4f7090f71d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8974: 8974</p>

</body>
</html>

--===============7652323326698873426==--
