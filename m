Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26058C04FFE
	for <igt-dev@archiver.kernel.org>; Sat, 18 May 2024 01:17:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52E7910E182;
	Sat, 18 May 2024 01:17:23 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 418A410E163;
 Sat, 18 May 2024 01:17:22 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3908358331635289636=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_tests/kms=5Fsysfs=5Fedid=5F?=
 =?utf-8?q?timing=3A_Skip_the_first_detect?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Khaled Almahallawy" <khaled.almahallawy@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sat, 18 May 2024 01:17:22 -0000
Message-ID: <171599504226.2144991.11454697751753197608@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240518003345.203255-1-khaled.almahallawy@intel.com>
In-Reply-To: <20240518003345.203255-1-khaled.almahallawy@intel.com>
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

--===============3908358331635289636==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_sysfs_edid_timing: Skip the first detect
URL   : https://patchwork.freedesktop.org/series/133778/
State : success

== Summary ==

CI Bug Log - changes from IGT_7862 -> IGTPW_11157
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11157/index.html

Participating hosts (42 -> 42)
------------------------------

  Additional (2): fi-cfl-8109u fi-elk-e7500 
  Missing    (2): fi-kbl-7567u fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_11157 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_huc_copy@huc-copy:
    - fi-cfl-8109u:       NOTRUN -> [SKIP][1] ([i915#2190])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11157/fi-cfl-8109u/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@basic@lmem0:
    - bat-dg2-11:         [PASS][2] -> [FAIL][3] ([i915#10378])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7862/bat-dg2-11/igt@gem_lmem_swapping@basic@lmem0.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11157/bat-dg2-11/igt@gem_lmem_swapping@basic@lmem0.html

  * igt@gem_lmem_swapping@verify-random:
    - fi-cfl-8109u:       NOTRUN -> [SKIP][4] ([i915#4613]) +3 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11157/fi-cfl-8109u/igt@gem_lmem_swapping@verify-random.html

  * igt@kms_dsc@dsc-basic:
    - fi-cfl-8109u:       NOTRUN -> [SKIP][5] +11 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11157/fi-cfl-8109u/igt@kms_dsc@dsc-basic.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-hdmi-a-1:
    - fi-elk-e7500:       NOTRUN -> [SKIP][6] +24 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11157/fi-elk-e7500/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-hdmi-a-1.html

  
#### Possible fixes ####

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-dp-6:
    - {bat-mtlp-9}:       [DMESG-FAIL][7] ([i915#11009]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7862/bat-mtlp-9/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-dp-6.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11157/bat-mtlp-9/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-dp-6.html

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-dp-6:
    - {bat-mtlp-9}:       [FAIL][9] ([i915#10979]) -> [PASS][10] +2 other tests pass
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7862/bat-mtlp-9/igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-dp-6.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11157/bat-mtlp-9/igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-dp-6.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10378]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10378
  [i915#10435]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10435
  [i915#10979]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10979
  [i915#11009]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11009
  [i915#2190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7862 -> IGTPW_11157

  CI-20190529: 20190529
  CI_DRM_14784: 5e9e7440f7d7efd64079148c738fc83600fb477b @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_11157: 11157
  IGT_7862: 29b73ddaf42dc4a41eaeabf0229aa900132a9af1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11157/index.html

--===============3908358331635289636==
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
<tr><td><b>Series:</b></td><td>tests/kms_sysfs_edid_timing: Skip the first detect</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/133778/">https://patchwork.freedesktop.org/series/133778/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11157/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11157/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7862 -&gt; IGTPW_11157</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11157/index.html</p>
<h2>Participating hosts (42 -&gt; 42)</h2>
<p>Additional (2): fi-cfl-8109u fi-elk-e7500 <br />
  Missing    (2): fi-kbl-7567u fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11157 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11157/fi-cfl-8109u/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic@lmem0:</p>
<ul>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7862/bat-dg2-11/igt@gem_lmem_swapping@basic@lmem0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11157/bat-dg2-11/igt@gem_lmem_swapping@basic@lmem0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10378">i915#10378</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random:</p>
<ul>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11157/fi-cfl-8109u/igt@gem_lmem_swapping@verify-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11157/fi-cfl-8109u/igt@kms_dsc@dsc-basic.html">SKIP</a> +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-hdmi-a-1:</p>
<ul>
<li>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11157/fi-elk-e7500/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-hdmi-a-1.html">SKIP</a> +24 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-dp-6:</p>
<ul>
<li>{bat-mtlp-9}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7862/bat-mtlp-9/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-dp-6.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11009">i915#11009</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11157/bat-mtlp-9/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-dp-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-dp-6:</p>
<ul>
<li>{bat-mtlp-9}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7862/bat-mtlp-9/igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-dp-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10979">i915#10979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11157/bat-mtlp-9/igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-dp-6.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7862 -&gt; IGTPW_11157</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14784: 5e9e7440f7d7efd64079148c738fc83600fb477b @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_11157: 11157<br />
  IGT_7862: 29b73ddaf42dc4a41eaeabf0229aa900132a9af1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============3908358331635289636==--
