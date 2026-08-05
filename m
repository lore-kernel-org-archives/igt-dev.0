Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A04ACC5AC6F
	for <igt-dev@archiver.kernel.org>; Wed,  5 Aug 2026 23:20:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DCAE10F04C;
	Wed,  5 Aug 2026 23:20:28 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6A8210E042;
 Wed,  5 Aug 2026 23:19:51 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1746810307989352462=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_kms=5Fdp=5Flinktrain=5Ffa?=
 =?utf-8?q?llback=3A_Add_UHBR-to-HBR_fallback_subtest?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sowmiya S" <sowmiya.s@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 05 Aug 2026 23:19:51 -0000
Message-ID: <178597199180.22834.12529663227043805231@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260805084428.708501-1-sowmiya.s@intel.com>
In-Reply-To: <20260805084428.708501-1-sowmiya.s@intel.com>
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

--===============1746810307989352462==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: kms_dp_linktrain_fallback: Add UHBR-to-HBR fallback subtest
URL   : https://patchwork.freedesktop.org/series/171645/
State : success

== Summary ==

CI Bug Log - changes from IGT_9038 -> IGTPW_15635
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15635/index.html

Participating hosts (41 -> 37)
------------------------------

  Missing    (4): bat-dg2-13 fi-glk-j4005 fi-snb-2520m bat-adls-6 

Known issues
------------

  Here are the changes found in IGTPW_15635 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_pm_rpm@basic-rte:
    - bat-rpls-4:         [PASS][1] -> [DMESG-WARN][2] ([i915#13400])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9038/bat-rpls-4/igt@kms_pm_rpm@basic-rte.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15635/bat-rpls-4/igt@kms_pm_rpm@basic-rte.html

  
#### Possible fixes ####

  * igt@i915_pm_rpm@module-reload:
    - bat-adlp-6:         [DMESG-WARN][3] ([i915#15673]) -> [PASS][4] +78 other tests pass
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9038/bat-adlp-6/igt@i915_pm_rpm@module-reload.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15635/bat-adlp-6/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live:
    - bat-adlp-9:         [DMESG-WARN][5] ([i915#16404]) -> [PASS][6] +1 other test pass
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9038/bat-adlp-9/igt@i915_selftest@live.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15635/bat-adlp-9/igt@i915_selftest@live.html

  * igt@kms_hdmi_inject@inject-audio:
    - fi-tgl-1115g4:      [SKIP][7] ([i915#13030]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9038/fi-tgl-1115g4/igt@kms_hdmi_inject@inject-audio.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15635/fi-tgl-1115g4/igt@kms_hdmi_inject@inject-audio.html

  
  [i915#13030]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13030
  [i915#13400]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13400
  [i915#15673]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15673
  [i915#16404]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16404


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9038 -> IGTPW_15635
  * Linux: CI_DRM_18945 -> CI_DRM_18948

  CI-20190529: 20190529
  CI_DRM_18945: 814bd7de7f09446c4b9401eecb8b30c3285af78b @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_18948: 4c13a67db118ee0019231dbc1362bcb8115ac660 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15635: 15635
  IGT_9038: 9038

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15635/index.html

--===============1746810307989352462==
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
<tr><td><b>Series:</b></td><td>kms_dp_linktrain_fallback: Add UHBR-to-HBR fallback subtest</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/171645/">https://patchwork.freedesktop.org/series/171645/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15635/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15635/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_9038 -&gt; IGTPW_15635</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15635/index.html</p>
<h2>Participating hosts (41 -&gt; 37)</h2>
<p>Missing    (4): bat-dg2-13 fi-glk-j4005 fi-snb-2520m bat-adls-6 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_15635 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_pm_rpm@basic-rte:<ul>
<li>bat-rpls-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9038/bat-rpls-4/igt@kms_pm_rpm@basic-rte.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15635/bat-rpls-4/igt@kms_pm_rpm@basic-rte.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13400">i915#13400</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9038/bat-adlp-6/igt@i915_pm_rpm@module-reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15673">i915#15673</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15635/bat-adlp-6/igt@i915_pm_rpm@module-reload.html">PASS</a> +78 other tests pass</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9038/bat-adlp-9/igt@i915_selftest@live.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16404">i915#16404</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15635/bat-adlp-9/igt@i915_selftest@live.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9038/fi-tgl-1115g4/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13030">i915#13030</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15635/fi-tgl-1115g4/igt@kms_hdmi_inject@inject-audio.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9038 -&gt; IGTPW_15635</li>
<li>Linux: CI_DRM_18945 -&gt; CI_DRM_18948</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18945: 814bd7de7f09446c4b9401eecb8b30c3285af78b @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_18948: 4c13a67db118ee0019231dbc1362bcb8115ac660 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15635: 15635<br />
  IGT_9038: 9038</p>

</body>
</html>

--===============1746810307989352462==--
