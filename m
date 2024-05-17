Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 688FCC04FFE
	for <igt-dev@archiver.kernel.org>; Fri, 17 May 2024 12:48:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E10C10EE9B;
	Fri, 17 May 2024 12:48:25 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9A0A10EE9B;
 Fri, 17 May 2024 12:48:23 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0253980170262881939=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_lib/igt=5Fpsr=3A_Handle_PR?=
 =?utf-8?q?=5FMODE2=5FSEL=5FFETCH_and_eDP_PR=5F*_in_psr_active_check?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 17 May 2024 12:48:23 -0000
Message-ID: <171595010375.2143358.8302007111389591909@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240517113138.2579843-1-jouni.hogander@intel.com>
In-Reply-To: <20240517113138.2579843-1-jouni.hogander@intel.com>
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

--===============0253980170262881939==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/igt_psr: Handle PR_MODE2_SEL_FETCH and eDP PR_* in psr active check
URL   : https://patchwork.freedesktop.org/series/133745/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_14780 -> IGTPW_11154
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11154/index.html

Participating hosts (44 -> 38)
------------------------------

  Additional (1): fi-cfl-8109u 
  Missing    (7): bat-mtlp-8 bat-dg1-7 fi-snb-2520m fi-kbl-8809g bat-dg2-11 bat-jsl-1 bat-arls-3 

Known issues
------------

  Here are the changes found in IGTPW_11154 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_huc_copy@huc-copy:
    - fi-cfl-8109u:       NOTRUN -> [SKIP][1] ([i915#2190])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11154/fi-cfl-8109u/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@verify-random:
    - fi-cfl-8109u:       NOTRUN -> [SKIP][2] ([i915#4613]) +3 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11154/fi-cfl-8109u/igt@gem_lmem_swapping@verify-random.html

  * igt@kms_pm_backlight@basic-brightness:
    - fi-cfl-8109u:       NOTRUN -> [SKIP][3] +11 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11154/fi-cfl-8109u/igt@kms_pm_backlight@basic-brightness.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@dmabuf:
    - {bat-mtlp-9}:       [DMESG-FAIL][4] ([i915#11035]) -> [PASS][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14780/bat-mtlp-9/igt@i915_selftest@live@dmabuf.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11154/bat-mtlp-9/igt@i915_selftest@live@dmabuf.html

  * igt@i915_selftest@live@execlists:
    - fi-bsw-nick:        [ABORT][6] ([i915#10594]) -> [PASS][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14780/fi-bsw-nick/igt@i915_selftest@live@execlists.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11154/fi-bsw-nick/igt@i915_selftest@live@execlists.html

  * igt@kms_flip@basic-flip-vs-modeset@b-dp7:
    - {bat-mtlp-9}:       [DMESG-WARN][8] ([i915#10435]) -> [PASS][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14780/bat-mtlp-9/igt@kms_flip@basic-flip-vs-modeset@b-dp7.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11154/bat-mtlp-9/igt@kms_flip@basic-flip-vs-modeset@b-dp7.html

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-dp-1:
    - {bat-rpls-4}:       [DMESG-WARN][10] ([i915#9970]) -> [PASS][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14780/bat-rpls-4/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-dp-1.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11154/bat-rpls-4/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-dp-1.html

  
#### Warnings ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1:
    - fi-kbl-7567u:       [DMESG-WARN][12] ([i915#180] / [i915#8585] / [i915#9925]) -> [DMESG-WARN][13] ([i915#180] / [i915#1982] / [i915#8585] / [i915#9925])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14780/fi-kbl-7567u/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11154/fi-kbl-7567u/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10435]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10435
  [i915#10594]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10594
  [i915#11035]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11035
  [i915#180]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180
  [i915#1982]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982
  [i915#2190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#8585]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8585
  [i915#9157]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9157
  [i915#9925]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9925
  [i915#9970]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9970


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7860 -> IGTPW_11154

  CI-20190529: 20190529
  CI_DRM_14780: 8ef53c10d150679e3ff5db00d128417dfffb7798 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_11154: 11154
  IGT_7860: 05b3f5540c6dcaacdf2169dc730c126df9ffd7e2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11154/index.html

--===============0253980170262881939==
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
<tr><td><b>Series:</b></td><td>lib/igt_psr: Handle PR_MODE2_SEL_FETCH and eDP PR_* in psr active check</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/133745/">https://patchwork.freedesktop.org/series/133745/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11154/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11154/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_14780 -&gt; IGTPW_11154</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11154/index.html</p>
<h2>Participating hosts (44 -&gt; 38)</h2>
<p>Additional (1): fi-cfl-8109u <br />
  Missing    (7): bat-mtlp-8 bat-dg1-7 fi-snb-2520m fi-kbl-8809g bat-dg2-11 bat-jsl-1 bat-arls-3 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11154 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11154/fi-cfl-8109u/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random:</p>
<ul>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11154/fi-cfl-8109u/igt@gem_lmem_swapping@verify-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11154/fi-cfl-8109u/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> +11 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@dmabuf:</p>
<ul>
<li>{bat-mtlp-9}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14780/bat-mtlp-9/igt@i915_selftest@live@dmabuf.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11035">i915#11035</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11154/bat-mtlp-9/igt@i915_selftest@live@dmabuf.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14780/fi-bsw-nick/igt@i915_selftest@live@execlists.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10594">i915#10594</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11154/fi-bsw-nick/igt@i915_selftest@live@execlists.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@b-dp7:</p>
<ul>
<li>{bat-mtlp-9}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14780/bat-mtlp-9/igt@kms_flip@basic-flip-vs-modeset@b-dp7.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10435">i915#10435</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11154/bat-mtlp-9/igt@kms_flip@basic-flip-vs-modeset@b-dp7.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-dp-1:</p>
<ul>
<li>{bat-rpls-4}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14780/bat-rpls-4/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-dp-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9970">i915#9970</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11154/bat-rpls-4/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-dp-1.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1:<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14780/fi-kbl-7567u/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180">i915#180</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8585">i915#8585</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9925">i915#9925</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11154/fi-kbl-7567u/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180">i915#180</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982">i915#1982</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8585">i915#8585</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9925">i915#9925</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7860 -&gt; IGTPW_11154</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14780: 8ef53c10d150679e3ff5db00d128417dfffb7798 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_11154: 11154<br />
  IGT_7860: 05b3f5540c6dcaacdf2169dc730c126df9ffd7e2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============0253980170262881939==--
