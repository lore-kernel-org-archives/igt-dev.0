Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FD32C48BF6
	for <igt-dev@archiver.kernel.org>; Mon, 26 Feb 2024 20:39:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E34C10E58A;
	Mon, 26 Feb 2024 20:39:20 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CC9310E4DC;
 Mon, 26 Feb 2024 20:39:18 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1093401791588154525=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_benchmarks/kms=5Ffb=5Fstres?=
 =?utf-8?q?s=3A_Add_command-line_options_to_change_the_planes_and_writeback_?=
 =?utf-8?q?formats?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arthur Grillo" <arthurgrillo@riseup.net>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 26 Feb 2024 20:39:18 -0000
Message-ID: <170897995817.299097.796489751771878781@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240226-kms_fb_stress-dev-v1-0-1c14942b1244@riseup.net>
In-Reply-To: <20240226-kms_fb_stress-dev-v1-0-1c14942b1244@riseup.net>
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

--===============1093401791588154525==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: benchmarks/kms_fb_stress: Add command-line options to change the planes and writeback formats
URL   : https://patchwork.freedesktop.org/series/130399/
State : success

== Summary ==

CI Bug Log - changes from IGT_7731 -> IGTPW_10737
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10737/index.html

Participating hosts (40 -> 39)
------------------------------

  Missing    (1): fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_10737 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_create@basic@smem:
    - bat-arls-1:         [PASS][1] -> [DMESG-WARN][2] ([i915#10194])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7731/bat-arls-1/igt@gem_exec_create@basic@smem.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10737/bat-arls-1/igt@gem_exec_create@basic@smem.html

  * igt@i915_selftest@live@evict:
    - bat-mtlp-8:         [PASS][3] -> [INCOMPLETE][4] ([i915#10137])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7731/bat-mtlp-8/igt@i915_selftest@live@evict.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10737/bat-mtlp-8/igt@i915_selftest@live@evict.html

  * igt@i915_selftest@live@ring_submission:
    - bat-arls-1:         NOTRUN -> [DMESG-WARN][5] ([i915#10194])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10737/bat-arls-1/igt@i915_selftest@live@ring_submission.html

  * igt@kms_pipe_crc_basic@read-crc:
    - bat-dg2-11:         NOTRUN -> [SKIP][6] ([i915#9197])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10737/bat-dg2-11/igt@kms_pipe_crc_basic@read-crc.html

  
#### Possible fixes ####

  * igt@gem_exec_fence@basic-busy@ccs0:
    - bat-arls-1:         [DMESG-WARN][7] ([i915#10194]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7731/bat-arls-1/igt@gem_exec_fence@basic-busy@ccs0.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10737/bat-arls-1/igt@gem_exec_fence@basic-busy@ccs0.html

  
  [i915#10137]: https://gitlab.freedesktop.org/drm/intel/issues/10137
  [i915#10194]: https://gitlab.freedesktop.org/drm/intel/issues/10194
  [i915#9197]: https://gitlab.freedesktop.org/drm/intel/issues/9197


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7731 -> IGTPW_10737

  CI-20190529: 20190529
  CI_DRM_14344: c815c7fa9257eb8ff4433c43058dd292b16347eb @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10737: 10737
  IGT_7731: 17f897a81868fb35c6a7033a8b07256659742248 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10737/index.html

--===============1093401791588154525==
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
<tr><td><b>Series:</b></td><td>benchmarks/kms_fb_stress: Add command-line options to change the planes and writeback formats</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/130399/">https://patchwork.freedesktop.org/series/130399/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10737/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10737/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7731 -&gt; IGTPW_10737</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10737/index.html</p>
<h2>Participating hosts (40 -&gt; 39)</h2>
<p>Missing    (1): fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10737 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_create@basic@smem:</p>
<ul>
<li>bat-arls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7731/bat-arls-1/igt@gem_exec_create@basic@smem.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10737/bat-arls-1/igt@gem_exec_create@basic@smem.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10194">i915#10194</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@evict:</p>
<ul>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7731/bat-mtlp-8/igt@i915_selftest@live@evict.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10737/bat-mtlp-8/igt@i915_selftest@live@evict.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10137">i915#10137</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@ring_submission:</p>
<ul>
<li>bat-arls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10737/bat-arls-1/igt@i915_selftest@live@ring_submission.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10194">i915#10194</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10737/bat-dg2-11/igt@kms_pipe_crc_basic@read-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9197">i915#9197</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@gem_exec_fence@basic-busy@ccs0:<ul>
<li>bat-arls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7731/bat-arls-1/igt@gem_exec_fence@basic-busy@ccs0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10194">i915#10194</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10737/bat-arls-1/igt@gem_exec_fence@basic-busy@ccs0.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7731 -&gt; IGTPW_10737</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14344: c815c7fa9257eb8ff4433c43058dd292b16347eb @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10737: 10737<br />
  IGT_7731: 17f897a81868fb35c6a7033a8b07256659742248 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============1093401791588154525==--
