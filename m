Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8BEBC4828D
	for <igt-dev@archiver.kernel.org>; Wed,  7 Feb 2024 15:01:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C277210EF4E;
	Wed,  7 Feb 2024 15:01:40 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A95010EF4E;
 Wed,  7 Feb 2024 15:01:39 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2801122188680191502=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_extend_psr2=5Fsf_test_for_p?=
 =?utf-8?q?r=5Fsf_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Joshi, Kunal1" <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 07 Feb 2024 15:01:39 -0000
Message-ID: <170731809956.1072289.6770965355642418815@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240207135319.1880229-1-kunal1.joshi@intel.com>
In-Reply-To: <20240207135319.1880229-1-kunal1.joshi@intel.com>
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

--===============2801122188680191502==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: extend psr2_sf test for pr_sf (rev3)
URL   : https://patchwork.freedesktop.org/series/129004/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_14239 -> IGTPW_10644
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10644/index.html

Participating hosts (37 -> 37)
------------------------------

  Additional (1): fi-pnv-d510 
  Missing    (1): fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_10644:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@gem_ctx_create@basic-files:
    - {bat-arls-2}:       [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14239/bat-arls-2/igt@gem_ctx_create@basic-files.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10644/bat-arls-2/igt@gem_ctx_create@basic-files.html

  * igt@gem_exec_fence@nb-await:
    - {bat-arls-2}:       NOTRUN -> [TIMEOUT][3] +6 other tests timeout
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10644/bat-arls-2/igt@gem_exec_fence@nb-await.html

  * igt@gem_exec_gttfill@basic:
    - {bat-arls-2}:       [PASS][4] -> [TIMEOUT][5] +2 other tests timeout
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14239/bat-arls-2/igt@gem_exec_gttfill@basic.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10644/bat-arls-2/igt@gem_exec_gttfill@basic.html

  
Known issues
------------

  Here are the changes found in IGTPW_10644 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_lmem_swapping@basic:
    - fi-apl-guc:         NOTRUN -> [SKIP][6] ([fdo#109271] / [i915#4613]) +3 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10644/fi-apl-guc/igt@gem_lmem_swapping@basic.html
    - fi-pnv-d510:        NOTRUN -> [SKIP][7] ([fdo#109271]) +28 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10644/fi-pnv-d510/igt@gem_lmem_swapping@basic.html

  * igt@kms_hdmi_inject@inject-audio:
    - fi-apl-guc:         NOTRUN -> [SKIP][8] ([fdo#109271]) +13 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10644/fi-apl-guc/igt@kms_hdmi_inject@inject-audio.html

  
#### Warnings ####

  * igt@i915_module_load@load:
    - fi-kbl-7567u:       [DMESG-WARN][9] ([i915#180] / [i915#8585]) -> [DMESG-WARN][10] ([i915#180] / [i915#1982] / [i915#8585])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14239/fi-kbl-7567u/igt@i915_module_load@load.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10644/fi-kbl-7567u/igt@i915_module_load@load.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#8585]: https://gitlab.freedesktop.org/drm/intel/issues/8585


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7705 -> IGTPW_10644

  CI-20190529: 20190529
  CI_DRM_14239: 473fff9e18e4e77aa4c1f1ae5484a6fb809a89e6 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10644: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10644/index.html
  IGT_7705: 45aef708b65772e54ee9a68b1f3885fa25140fdf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10644/index.html

--===============2801122188680191502==
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
<tr><td><b>Series:</b></td><td>extend psr2_sf test for pr_sf (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/129004/">https://patchwork.freedesktop.org/series/129004/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10644/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10644/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_14239 -&gt; IGTPW_10644</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10644/index.html</p>
<h2>Participating hosts (37 -&gt; 37)</h2>
<p>Additional (1): fi-pnv-d510 <br />
  Missing    (1): fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_10644:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@gem_ctx_create@basic-files:</p>
<ul>
<li>{bat-arls-2}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14239/bat-arls-2/igt@gem_ctx_create@basic-files.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10644/bat-arls-2/igt@gem_ctx_create@basic-files.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@nb-await:</p>
<ul>
<li>{bat-arls-2}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10644/bat-arls-2/igt@gem_exec_fence@nb-await.html">TIMEOUT</a> +6 other tests timeout</li>
</ul>
</li>
<li>
<p>igt@gem_exec_gttfill@basic:</p>
<ul>
<li>{bat-arls-2}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14239/bat-arls-2/igt@gem_exec_gttfill@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10644/bat-arls-2/igt@gem_exec_gttfill@basic.html">TIMEOUT</a> +2 other tests timeout</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10644 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10644/fi-apl-guc/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 other tests skip</li>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10644/fi-pnv-d510/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10644/fi-apl-guc/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +13 other tests skip</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@i915_module_load@load:<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14239/fi-kbl-7567u/igt@i915_module_load@load.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8585">i915#8585</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10644/fi-kbl-7567u/igt@i915_module_load@load.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8585">i915#8585</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7705 -&gt; IGTPW_10644</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14239: 473fff9e18e4e77aa4c1f1ae5484a6fb809a89e6 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10644: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10644/index.html<br />
  IGT_7705: 45aef708b65772e54ee9a68b1f3885fa25140fdf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============2801122188680191502==--
