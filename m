Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ADE4C6FD1F
	for <igt-dev@archiver.kernel.org>; Tue,  2 Apr 2024 15:42:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C904F10FDF8;
	Tue,  2 Apr 2024 15:42:48 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76C0F10FDF8;
 Tue,  2 Apr 2024 15:42:47 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7138711074620027687=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_tests/xe=5Fexec=5Fthreads?=
 =?utf-8?q?=3A_Make_hang_tests_reset_domain_aware?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 02 Apr 2024 15:42:47 -0000
Message-ID: <171207256748.1154935.6780967129138803930@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240402122223.643413-1-tejas.upadhyay@intel.com>
In-Reply-To: <20240402122223.643413-1-tejas.upadhyay@intel.com>
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

--===============7138711074620027687==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/xe_exec_threads: Make hang tests reset domain aware
URL   : https://patchwork.freedesktop.org/series/131938/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_14516 -> IGTPW_10965
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10965/index.html

Participating hosts (37 -> 37)
------------------------------

  Additional (1): fi-kbl-8809g 
  Missing    (1): fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_10965 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_force_connector_basic@force-edid:
    - bat-dg2-8:          [PASS][1] -> [INCOMPLETE][2] ([i915#10583] / [i915#2295])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14516/bat-dg2-8/igt@kms_force_connector_basic@force-edid.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10965/bat-dg2-8/igt@kms_force_connector_basic@force-edid.html
    - bat-dg2-9:          [PASS][3] -> [INCOMPLETE][4] ([i915#10583] / [i915#2295])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14516/bat-dg2-9/igt@kms_force_connector_basic@force-edid.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10965/bat-dg2-9/igt@kms_force_connector_basic@force-edid.html

  * igt@runner@aborted:
    - fi-kbl-8809g:       NOTRUN -> [FAIL][5] ([i915#4991])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10965/fi-kbl-8809g/igt@runner@aborted.html

  
  [i915#10583]: https://gitlab.freedesktop.org/drm/intel/issues/10583
  [i915#2295]: https://gitlab.freedesktop.org/drm/intel/issues/2295
  [i915#4991]: https://gitlab.freedesktop.org/drm/intel/issues/4991


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7796 -> IGTPW_10965

  CI-20190529: 20190529
  CI_DRM_14516: 5100fcc57dc5d45b246a0aeb068f4f8062d29b09 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10965: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10965/index.html
  IGT_7796: 2cfed18f6aa776c1593d7cc328d23225dd61bdf9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10965/index.html

--===============7138711074620027687==
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
<tr><td><b>Series:</b></td><td>tests/xe_exec_threads: Make hang tests reset domain aware</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/131938/">https://patchwork.freedesktop.org/series/131938/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10965/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10965/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_14516 -&gt; IGTPW_10965</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10965/index.html</p>
<h2>Participating hosts (37 -&gt; 37)</h2>
<p>Additional (1): fi-kbl-8809g <br />
  Missing    (1): fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10965 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_force_connector_basic@force-edid:</p>
<ul>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14516/bat-dg2-8/igt@kms_force_connector_basic@force-edid.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10965/bat-dg2-8/igt@kms_force_connector_basic@force-edid.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10583">i915#10583</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a>)</li>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14516/bat-dg2-9/igt@kms_force_connector_basic@force-edid.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10965/bat-dg2-9/igt@kms_force_connector_basic@force-edid.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10583">i915#10583</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10965/fi-kbl-8809g/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4991">i915#4991</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7796 -&gt; IGTPW_10965</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14516: 5100fcc57dc5d45b246a0aeb068f4f8062d29b09 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10965: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10965/index.html<br />
  IGT_7796: 2cfed18f6aa776c1593d7cc328d23225dd61bdf9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============7138711074620027687==--
