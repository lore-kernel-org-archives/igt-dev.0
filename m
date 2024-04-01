Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC376CD1288
	for <igt-dev@archiver.kernel.org>; Mon,  1 Apr 2024 12:49:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44C4810F139;
	Mon,  1 Apr 2024 12:49:29 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ECE210F113;
 Mon,  1 Apr 2024 12:49:27 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7663875932072711843=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_tools/intel=5Fgpu=5Ffrequen?=
 =?utf-8?q?cy=3A_=60perror=60_when_opening_the_sysfs_node_fails?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: tranquillitycodes@proton.me
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 01 Apr 2024 12:49:27 -0000
Message-ID: <171197576738.1117021.1539998354530107160@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <cUWLB__vhgdDrNB2WYs-GB18a1SCXBKG1MVc_OVNMHezpXlQDnTW0IatOR2M7YzjUnXQYlsn5iVIm_YGCzpdekEZmO0igQex9N8kyJiII0M=@proton.me>
In-Reply-To: <cUWLB__vhgdDrNB2WYs-GB18a1SCXBKG1MVc_OVNMHezpXlQDnTW0IatOR2M7YzjUnXQYlsn5iVIm_YGCzpdekEZmO0igQex9N8kyJiII0M=@proton.me>
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

--===============7663875932072711843==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tools/intel_gpu_frequency: `perror` when opening the sysfs node fails
URL   : https://patchwork.freedesktop.org/series/131887/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_14511 -> IGTPW_10957
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10957/index.html

Participating hosts (33 -> 29)
------------------------------

  Missing    (4): bat-mtlp-8 bat-kbl-2 fi-cfl-8109u fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_10957 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@hangcheck:
    - bat-dg2-8:          [PASS][1] -> [ABORT][2] ([i915#10366])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14511/bat-dg2-8/igt@i915_selftest@live@hangcheck.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10957/bat-dg2-8/igt@i915_selftest@live@hangcheck.html

  
#### Possible fixes ####

  * igt@fbdev@info:
    - {bat-mtlp-9}:       [SKIP][3] ([i915#1849] / [i915#2582]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14511/bat-mtlp-9/igt@fbdev@info.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10957/bat-mtlp-9/igt@fbdev@info.html

  * igt@fbdev@nullptr:
    - {bat-mtlp-9}:       [SKIP][5] ([i915#2582]) -> [PASS][6] +3 other tests pass
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14511/bat-mtlp-9/igt@fbdev@nullptr.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10957/bat-mtlp-9/igt@fbdev@nullptr.html

  * igt@i915_selftest@live@vma:
    - bat-dg2-9:          [ABORT][7] ([i915#10366]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14511/bat-dg2-9/igt@i915_selftest@live@vma.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10957/bat-dg2-9/igt@i915_selftest@live@vma.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:
    - {bat-mtlp-9}:       [SKIP][9] ([i915#10580]) -> [PASS][10] +5 other tests pass
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14511/bat-mtlp-9/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10957/bat-mtlp-9/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html

  * igt@kms_frontbuffer_tracking@basic:
    - {bat-mtlp-9}:       [SKIP][11] ([i915#4342] / [i915#5354]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14511/bat-mtlp-9/igt@kms_frontbuffer_tracking@basic.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10957/bat-mtlp-9/igt@kms_frontbuffer_tracking@basic.html

  * igt@prime_vgem@basic-fence-flip:
    - {bat-mtlp-9}:       [SKIP][13] ([i915#3708]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14511/bat-mtlp-9/igt@prime_vgem@basic-fence-flip.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10957/bat-mtlp-9/igt@prime_vgem@basic-fence-flip.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10366]: https://gitlab.freedesktop.org/drm/intel/issues/10366
  [i915#10435]: https://gitlab.freedesktop.org/drm/intel/issues/10435
  [i915#10436]: https://gitlab.freedesktop.org/drm/intel/issues/10436
  [i915#10580]: https://gitlab.freedesktop.org/drm/intel/issues/10580
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
  [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
  [i915#4342]: https://gitlab.freedesktop.org/drm/intel/issues/4342
  [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
  [i915#9159]: https://gitlab.freedesktop.org/drm/intel/issues/9159
  [i915#9673]: https://gitlab.freedesktop.org/drm/intel/issues/9673
  [i915#9732]: https://gitlab.freedesktop.org/drm/intel/issues/9732


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7792 -> IGTPW_10957

  CI-20190529: 20190529
  CI_DRM_14511: a585b19932157f2c96293bf00288968ada86d435 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10957: 10957
  IGT_7792: 80ee6c6247595a92389a56d26d4905ee74e33c7c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10957/index.html

--===============7663875932072711843==
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
<tr><td><b>Series:</b></td><td>tools/intel_gpu_frequency: `perror` when opening the sysfs node fails</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/131887/">https://patchwork.freedesktop.org/series/131887/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10957/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10957/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_14511 -&gt; IGTPW_10957</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10957/index.html</p>
<h2>Participating hosts (33 -&gt; 29)</h2>
<p>Missing    (4): bat-mtlp-8 bat-kbl-2 fi-cfl-8109u fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10957 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@i915_selftest@live@hangcheck:<ul>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14511/bat-dg2-8/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10957/bat-dg2-8/igt@i915_selftest@live@hangcheck.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10366">i915#10366</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>{bat-mtlp-9}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14511/bat-mtlp-9/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2582">i915#2582</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10957/bat-mtlp-9/igt@fbdev@info.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>{bat-mtlp-9}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14511/bat-mtlp-9/igt@fbdev@nullptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2582">i915#2582</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10957/bat-mtlp-9/igt@fbdev@nullptr.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@vma:</p>
<ul>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14511/bat-dg2-9/igt@i915_selftest@live@vma.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10366">i915#10366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10957/bat-dg2-9/igt@i915_selftest@live@vma.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:</p>
<ul>
<li>{bat-mtlp-9}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14511/bat-mtlp-9/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10580">i915#10580</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10957/bat-mtlp-9/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>{bat-mtlp-9}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14511/bat-mtlp-9/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4342">i915#4342</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10957/bat-mtlp-9/igt@kms_frontbuffer_tracking@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>{bat-mtlp-9}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14511/bat-mtlp-9/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10957/bat-mtlp-9/igt@prime_vgem@basic-fence-flip.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7792 -&gt; IGTPW_10957</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14511: a585b19932157f2c96293bf00288968ada86d435 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10957: 10957<br />
  IGT_7792: 80ee6c6247595a92389a56d26d4905ee74e33c7c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============7663875932072711843==--
