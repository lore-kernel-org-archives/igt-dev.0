Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EBD9C47DDF
	for <igt-dev@archiver.kernel.org>; Thu,  1 Feb 2024 13:06:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A05310EDCC;
	Thu,  1 Feb 2024 13:06:35 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78B0B10ED9A;
 Thu,  1 Feb 2024 13:06:34 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1393891428868921219=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_series_starting_with_=5Bi-g?=
 =?utf-8?q?-t=2Cv2=2C1/3=5D_lib/intel=5Fdevice=5Finfo=3A_set_has=5Fflatccs_o?=
 =?utf-8?q?n_LNL?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 01 Feb 2024 13:06:34 -0000
Message-ID: <170679279448.894913.9855251752882784214@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240201103017.321466-1-matthew.auld@intel.com>
In-Reply-To: <20240201103017.321466-1-matthew.auld@intel.com>
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

--===============1393891428868921219==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,v2,1/3] lib/intel_device_info: set has_flatccs on LNL
URL   : https://patchwork.freedesktop.org/series/129412/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_14209 -> IGTPW_10623
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10623/index.html

Participating hosts (39 -> 39)
------------------------------

  Additional (1): fi-pnv-d510 
  Missing    (1): fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_10623:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@kms_psr@psr-cursor-plane-move@edp-1}:
    - {bat-arls-2}:       [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14209/bat-arls-2/igt@kms_psr@psr-cursor-plane-move@edp-1.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10623/bat-arls-2/igt@kms_psr@psr-cursor-plane-move@edp-1.html

  
Known issues
------------

  Here are the changes found in IGTPW_10623 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_lmem_swapping@basic:
    - fi-pnv-d510:        NOTRUN -> [SKIP][3] ([fdo#109271]) +31 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10623/fi-pnv-d510/igt@gem_lmem_swapping@basic.html

  * igt@i915_hangman@error-state-basic:
    - bat-mtlp-6:         [PASS][4] -> [ABORT][5] ([i915#9414])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14209/bat-mtlp-6/igt@i915_hangman@error-state-basic.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10623/bat-mtlp-6/igt@i915_hangman@error-state-basic.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@hangcheck:
    - bat-adlp-9:         [ABORT][6] ([i915#10021]) -> [PASS][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14209/bat-adlp-9/igt@i915_selftest@live@hangcheck.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10623/bat-adlp-9/igt@i915_selftest@live@hangcheck.html

  
#### Warnings ####

  * igt@core_hotunplug@unbind-rebind:
    - fi-apl-guc:         [DMESG-WARN][8] ([i915#180] / [i915#8585]) -> [DMESG-WARN][9] ([i915#180] / [i915#1982] / [i915#8585])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14209/fi-apl-guc/igt@core_hotunplug@unbind-rebind.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10623/fi-apl-guc/igt@core_hotunplug@unbind-rebind.html

  * igt@kms_busy@basic@flip:
    - fi-apl-guc:         [DMESG-WARN][10] ([i915#180]) -> [DMESG-WARN][11] ([i915#180] / [i915#1982])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14209/fi-apl-guc/igt@kms_busy@basic@flip.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10623/fi-apl-guc/igt@kms_busy@basic@flip.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#10021]: https://gitlab.freedesktop.org/drm/intel/issues/10021
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#8585]: https://gitlab.freedesktop.org/drm/intel/issues/8585
  [i915#9414]: https://gitlab.freedesktop.org/drm/intel/issues/9414


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7700 -> IGTPW_10623

  CI-20190529: 20190529
  CI_DRM_14209: 3e58a4940c44430f20cad20ead5e1b77ed209cde @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10623: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10623/index.html
  IGT_7700: 7700

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10623/index.html

--===============1393891428868921219==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,v2,1/3] lib/intel_device_info: set has_flatccs on LNL</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/129412/">https://patchwork.freedesktop.org/series/129412/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10623/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10623/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_14209 -&gt; IGTPW_10623</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10623/index.html</p>
<h2>Participating hosts (39 -&gt; 39)</h2>
<p>Additional (1): fi-pnv-d510 <br />
  Missing    (1): fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_10623:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>{igt@kms_psr@psr-cursor-plane-move@edp-1}:<ul>
<li>{bat-arls-2}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14209/bat-arls-2/igt@kms_psr@psr-cursor-plane-move@edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10623/bat-arls-2/igt@kms_psr@psr-cursor-plane-move@edp-1.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10623 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10623/fi-pnv-d510/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_hangman@error-state-basic:</p>
<ul>
<li>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14209/bat-mtlp-6/igt@i915_hangman@error-state-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10623/bat-mtlp-6/igt@i915_hangman@error-state-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9414">i915#9414</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live@hangcheck:<ul>
<li>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14209/bat-adlp-9/igt@i915_selftest@live@hangcheck.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10021">i915#10021</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10623/bat-adlp-9/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14209/fi-apl-guc/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8585">i915#8585</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10623/fi-apl-guc/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8585">i915#8585</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic@flip:</p>
<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14209/fi-apl-guc/igt@kms_busy@basic@flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10623/fi-apl-guc/igt@kms_busy@basic@flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7700 -&gt; IGTPW_10623</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14209: 3e58a4940c44430f20cad20ead5e1b77ed209cde @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10623: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10623/index.html<br />
  IGT_7700: 7700</p>

</body>
</html>

--===============1393891428868921219==--
