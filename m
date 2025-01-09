Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A573AE77197
	for <igt-dev@archiver.kernel.org>; Thu,  9 Jan 2025 09:20:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 474E210E0D7;
	Thu,  9 Jan 2025 09:20:12 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C382E10E0D7;
 Thu,  9 Jan 2025 09:20:10 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4016975824437487139=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_drm-uapi/xe=3A_Sync_with_?=
 =?utf-8?q?OA_uapi_updates_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 09 Jan 2025 09:20:10 -0000
Message-ID: <173641441078.1573907.12487558546331095290@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250109032331.2774067-1-ashutosh.dixit@intel.com>
In-Reply-To: <20250109032331.2774067-1-ashutosh.dixit@intel.com>
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

--===============4016975824437487139==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm-uapi/xe: Sync with OA uapi updates (rev2)
URL   : https://patchwork.freedesktop.org/series/143297/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8182 -> IGTPW_12413
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12413 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12413, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12413/index.html

Participating hosts (38 -> 37)
------------------------------

  Missing    (1): fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12413:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_pm_rpm@module-reload:
    - bat-rpls-4:         [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8182/bat-rpls-4/igt@i915_pm_rpm@module-reload.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12413/bat-rpls-4/igt@i915_pm_rpm@module-reload.html

  
Known issues
------------

  Here are the changes found in IGTPW_12413 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_chamelium_edid@hdmi-edid-read:
    - bat-dg2-13:         [PASS][3] -> [DMESG-WARN][4] ([i915#12253])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8182/bat-dg2-13/igt@kms_chamelium_edid@hdmi-edid-read.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12413/bat-dg2-13/igt@kms_chamelium_edid@hdmi-edid-read.html

  * igt@kms_chamelium_frames@dp-crc-fast:
    - bat-dg2-13:         [PASS][5] -> [FAIL][6] ([i915#12440])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8182/bat-dg2-13/igt@kms_chamelium_frames@dp-crc-fast.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12413/bat-dg2-13/igt@kms_chamelium_frames@dp-crc-fast.html

  
#### Possible fixes ####

  * igt@i915_selftest@live:
    - bat-twl-2:          [ABORT][7] ([i915#12919] / [i915#13397]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8182/bat-twl-2/igt@i915_selftest@live.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12413/bat-twl-2/igt@i915_selftest@live.html

  * igt@i915_selftest@live@gt_mocs:
    - bat-twl-2:          [ABORT][9] ([i915#12919]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8182/bat-twl-2/igt@i915_selftest@live@gt_mocs.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12413/bat-twl-2/igt@i915_selftest@live@gt_mocs.html

  * igt@i915_selftest@live@workarounds:
    - {bat-mtlp-9}:       [DMESG-FAIL][11] ([i915#13393]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8182/bat-mtlp-9/igt@i915_selftest@live@workarounds.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12413/bat-mtlp-9/igt@i915_selftest@live@workarounds.html
    - {bat-arls-6}:       [DMESG-FAIL][13] ([i915#13393]) -> [PASS][14] +1 other test pass
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8182/bat-arls-6/igt@i915_selftest@live@workarounds.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12413/bat-arls-6/igt@i915_selftest@live@workarounds.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#11989]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11989
  [i915#12253]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12253
  [i915#12440]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12440
  [i915#12919]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12919
  [i915#13393]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13393
  [i915#13397]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13397


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8182 -> IGTPW_12413
  * Linux: CI_DRM_15924 -> CI_DRM_15927

  CI-20190529: 20190529
  CI_DRM_15924: 9cbe590862ef629f35ce9f4c2dc5c0a6a4553f48 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_15927: 9e5828f71dbb3bf6dff6a2bcfaa761d048344b2a @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12413: 12413
  IGT_8182: 8911eff2c6c06d2929c6072f3ba72d2d991985ea @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12413/index.html

--===============4016975824437487139==
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
<tr><td><b>Series:</b></td><td>drm-uapi/xe: Sync with OA uapi updates (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/143297/">https://patchwork.freedesktop.org/series/143297/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12413/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12413/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8182 -&gt; IGTPW_12413</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_12413 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_12413, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12413/index.html</p>
<h2>Participating hosts (38 -&gt; 37)</h2>
<p>Missing    (1): fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_12413:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_pm_rpm@module-reload:<ul>
<li>bat-rpls-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8182/bat-rpls-4/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12413/bat-rpls-4/igt@i915_pm_rpm@module-reload.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_12413 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-read:</p>
<ul>
<li>bat-dg2-13:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8182/bat-dg2-13/igt@kms_chamelium_edid@hdmi-edid-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12413/bat-dg2-13/igt@kms_chamelium_edid@hdmi-edid-read.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12253">i915#12253</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-fast:</p>
<ul>
<li>bat-dg2-13:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8182/bat-dg2-13/igt@kms_chamelium_frames@dp-crc-fast.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12413/bat-dg2-13/igt@kms_chamelium_frames@dp-crc-fast.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12440">i915#12440</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-twl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8182/bat-twl-2/igt@i915_selftest@live.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12919">i915#12919</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13397">i915#13397</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12413/bat-twl-2/igt@i915_selftest@live.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_mocs:</p>
<ul>
<li>bat-twl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8182/bat-twl-2/igt@i915_selftest@live@gt_mocs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12919">i915#12919</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12413/bat-twl-2/igt@i915_selftest@live@gt_mocs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>{bat-mtlp-9}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8182/bat-mtlp-9/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13393">i915#13393</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12413/bat-mtlp-9/igt@i915_selftest@live@workarounds.html">PASS</a></li>
<li>{bat-arls-6}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8182/bat-arls-6/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13393">i915#13393</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12413/bat-arls-6/igt@i915_selftest@live@workarounds.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8182 -&gt; IGTPW_12413</li>
<li>Linux: CI_DRM_15924 -&gt; CI_DRM_15927</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_15924: 9cbe590862ef629f35ce9f4c2dc5c0a6a4553f48 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_15927: 9e5828f71dbb3bf6dff6a2bcfaa761d048344b2a @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_12413: 12413<br />
  IGT_8182: 8911eff2c6c06d2929c6072f3ba72d2d991985ea @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============4016975824437487139==--
