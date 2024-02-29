Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F934C48BF6
	for <igt-dev@archiver.kernel.org>; Thu, 29 Feb 2024 20:56:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22DD110E607;
	Thu, 29 Feb 2024 20:56:05 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E020410E090;
 Thu, 29 Feb 2024 20:56:03 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8324028693439688350=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBAT=3A_failure_for_More_updates_for_MTL_workar?=
 =?utf-8?q?ounds_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: john.c.harrison@intel.com
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 29 Feb 2024 20:56:03 -0000
Message-ID: <170924016391.397863.5137876921927961076@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240229193930.2933130-1-John.C.Harrison@Intel.com>
In-Reply-To: <20240229193930.2933130-1-John.C.Harrison@Intel.com>
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

--===============8324028693439688350==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: More updates for MTL workarounds (rev2)
URL   : https://patchwork.freedesktop.org/series/130416/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_14369 -> IGTPW_10759
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_10759 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_10759, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10759/index.html

Participating hosts (42 -> 40)
------------------------------

  Missing    (2): fi-snb-2520m fi-bsw-n3050 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_10759:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-edp-1:
    - bat-arls-2:         [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14369/bat-arls-2/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-edp-1.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10759/bat-arls-2/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-edp-1.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-d-dp-2:
    - {bat-rpls-3}:       [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14369/bat-rpls-3/igt@kms_pipe_crc_basic@hang-read-crc@pipe-d-dp-2.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10759/bat-rpls-3/igt@kms_pipe_crc_basic@hang-read-crc@pipe-d-dp-2.html

  
Known issues
------------

  Here are the changes found in IGTPW_10759 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_lmem_swapping@basic:
    - fi-apl-guc:         NOTRUN -> [SKIP][5] ([fdo#109271] / [i915#4613]) +3 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10759/fi-apl-guc/igt@gem_lmem_swapping@basic.html

  * igt@i915_pm_rpm@module-reload:
    - fi-kbl-7567u:       [PASS][6] -> [CRASH][7] ([i915#9947])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14369/fi-kbl-7567u/igt@i915_pm_rpm@module-reload.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10759/fi-kbl-7567u/igt@i915_pm_rpm@module-reload.html

  * igt@kms_hdmi_inject@inject-audio:
    - fi-apl-guc:         NOTRUN -> [SKIP][8] ([fdo#109271]) +17 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10759/fi-apl-guc/igt@kms_hdmi_inject@inject-audio.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#10262]: https://gitlab.freedesktop.org/drm/intel/issues/10262
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#9947]: https://gitlab.freedesktop.org/drm/intel/issues/9947
  [i915#9980]: https://gitlab.freedesktop.org/drm/intel/issues/9980


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7738 -> IGTPW_10759

  CI-20190529: 20190529
  CI_DRM_14369: 879fd254f581ab57486aae46f4a027e92642feb6 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10759: 10759
  IGT_7738: 7738


Testlist changes
----------------

+igt@kms_big_joiner@2x-modeset
-igt@kms_big_joiner@force-joiner-basic
-igt@kms_big_joiner@force-joiner-invalid-modeset

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10759/index.html

--===============8324028693439688350==
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
<tr><td><b>Series:</b></td><td>More updates for MTL workarounds (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/130416/">https://patchwork.freedesktop.org/series/130416/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10759/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10759/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_14369 -&gt; IGTPW_10759</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_10759 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_10759, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10759/index.html</p>
<h2>Participating hosts (42 -&gt; 40)</h2>
<p>Missing    (2): fi-snb-2520m fi-bsw-n3050 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_10759:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-edp-1:<ul>
<li>bat-arls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14369/bat-arls-2/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10759/bat-arls-2/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-edp-1.html">ABORT</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@kms_pipe_crc_basic@hang-read-crc@pipe-d-dp-2:<ul>
<li>{bat-rpls-3}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14369/bat-rpls-3/igt@kms_pipe_crc_basic@hang-read-crc@pipe-d-dp-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10759/bat-rpls-3/igt@kms_pipe_crc_basic@hang-read-crc@pipe-d-dp-2.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10759 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10759/fi-apl-guc/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14369/fi-kbl-7567u/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10759/fi-kbl-7567u/igt@i915_pm_rpm@module-reload.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9947">i915#9947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10759/fi-apl-guc/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +17 other tests skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7738 -&gt; IGTPW_10759</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14369: 879fd254f581ab57486aae46f4a027e92642feb6 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10759: 10759<br />
  IGT_7738: 7738</p>
<h2>Testlist changes</h2>
<p>+igt@kms_big_joiner@2x-modeset<br />
-igt@kms_big_joiner@force-joiner-basic<br />
-igt@kms_big_joiner@force-joiner-invalid-modeset</p>

</body>
</html>

--===============8324028693439688350==--
