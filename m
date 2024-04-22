Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48E03C4345F
	for <igt-dev@archiver.kernel.org>; Mon, 22 Apr 2024 15:26:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAA80112BE6;
	Mon, 22 Apr 2024 15:25:59 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02224112BE6;
 Mon, 22 Apr 2024 15:25:58 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1971967589492024227=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_tests/intel/gem=5Fexec=5Fca?=
 =?utf-8?q?pture=3A_Fix_many-*_subtests_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Peter Senna Tschudin" <me@petersenna.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 22 Apr 2024 15:25:58 -0000
Message-ID: <171379955800.1571015.12815460146974673899@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240410174031.5840-1-me@petersenna.com>
In-Reply-To: <20240410174031.5840-1-me@petersenna.com>
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

--===============1971967589492024227==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/gem_exec_capture: Fix many-* subtests (rev3)
URL   : https://patchwork.freedesktop.org/series/132291/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_14625 -> IGTPW_11049
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11049/index.html

Participating hosts (35 -> 34)
------------------------------

  Additional (3): fi-kbl-8809g fi-bsw-nick fi-bsw-n3050 
  Missing    (4): bat-rplp-1 bat-kbl-2 fi-cfl-8109u bat-adlp-9 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_11049:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@i915_pm_rpm@module-reload:
    - {bat-mtlp-9}:       [WARN][1] ([i915#10436]) -> [CRASH][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14625/bat-mtlp-9/igt@i915_pm_rpm@module-reload.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11049/bat-mtlp-9/igt@i915_pm_rpm@module-reload.html

  
Known issues
------------

  Here are the changes found in IGTPW_11049 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_huc_copy@huc-copy:
    - fi-kbl-8809g:       NOTRUN -> [SKIP][3] ([i915#2190])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11049/fi-kbl-8809g/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@basic:
    - fi-kbl-8809g:       NOTRUN -> [SKIP][4] ([i915#4613]) +3 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11049/fi-kbl-8809g/igt@gem_lmem_swapping@basic.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - fi-bsw-nick:        NOTRUN -> [SKIP][5] +19 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11049/fi-bsw-nick/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@gem_lmem_swapping@random-engines:
    - fi-bsw-n3050:       NOTRUN -> [SKIP][6] +19 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11049/fi-bsw-n3050/igt@gem_lmem_swapping@random-engines.html

  * igt@i915_module_load@reload:
    - fi-apl-guc:         [PASS][7] -> [DMESG-WARN][8] ([i915#10636] / [i915#180] / [i915#1982] / [i915#8585])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14625/fi-apl-guc/igt@i915_module_load@reload.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11049/fi-apl-guc/igt@i915_module_load@reload.html

  * igt@i915_selftest@live@execlists:
    - fi-bsw-nick:        NOTRUN -> [ABORT][9] ([i915#10594])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11049/fi-bsw-nick/igt@i915_selftest@live@execlists.html

  * igt@i915_selftest@live@reset:
    - fi-apl-guc:         [PASS][10] -> [DMESG-WARN][11] ([i915#10636]) +36 other tests dmesg-warn
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14625/fi-apl-guc/igt@i915_selftest@live@reset.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11049/fi-apl-guc/igt@i915_selftest@live@reset.html

  * igt@kms_force_connector_basic@force-load-detect:
    - fi-kbl-8809g:       NOTRUN -> [SKIP][12] +30 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11049/fi-kbl-8809g/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-dp-1:
    - fi-apl-guc:         [PASS][13] -> [DMESG-WARN][14] ([i915#180]) +2 other tests dmesg-warn
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14625/fi-apl-guc/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-dp-1.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11049/fi-apl-guc/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-dp-1.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-1:
    - fi-apl-guc:         [PASS][15] -> [DMESG-WARN][16] ([i915#180] / [i915#8585]) +8 other tests dmesg-warn
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14625/fi-apl-guc/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-1.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11049/fi-apl-guc/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-1.html

  * igt@prime_vgem@basic-fence-flip:
    - fi-apl-guc:         [PASS][17] -> [DMESG-WARN][18] ([i915#10512])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14625/fi-apl-guc/igt@prime_vgem@basic-fence-flip.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11049/fi-apl-guc/igt@prime_vgem@basic-fence-flip.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@gt_contexts:
    - {bat-arls-4}:       [ABORT][19] -> [PASS][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14625/bat-arls-4/igt@i915_selftest@live@gt_contexts.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11049/bat-arls-4/igt@i915_selftest@live@gt_contexts.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10436]: https://gitlab.freedesktop.org/drm/intel/issues/10436
  [i915#10512]: https://gitlab.freedesktop.org/drm/intel/issues/10512
  [i915#10594]: https://gitlab.freedesktop.org/drm/intel/issues/10594
  [i915#10636]: https://gitlab.freedesktop.org/drm/intel/issues/10636
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#8585]: https://gitlab.freedesktop.org/drm/intel/issues/8585


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7815 -> IGTPW_11049

  CI-20190529: 20190529
  CI_DRM_14625: 7fb8042f224fd84650e556b13e2560d8f86a1914 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_11049: 11049
  IGT_7815: d5d516bfdf77898e934b4c7ed947a43711cfb226 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11049/index.html

--===============1971967589492024227==
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
<tr><td><b>Series:</b></td><td>tests/intel/gem_exec_capture: Fix many-* subtests (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/132291/">https://patchwork.freedesktop.org/series/132291/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11049/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11049/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_14625 -&gt; IGTPW_11049</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11049/index.html</p>
<h2>Participating hosts (35 -&gt; 34)</h2>
<p>Additional (3): fi-kbl-8809g fi-bsw-nick fi-bsw-n3050 <br />
  Missing    (4): bat-rplp-1 bat-kbl-2 fi-cfl-8109u bat-adlp-9 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_11049:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@i915_pm_rpm@module-reload:<ul>
<li>{bat-mtlp-9}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14625/bat-mtlp-9/igt@i915_pm_rpm@module-reload.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10436">i915#10436</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11049/bat-mtlp-9/igt@i915_pm_rpm@module-reload.html">CRASH</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11049 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11049/fi-kbl-8809g/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11049/fi-kbl-8809g/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11049/fi-bsw-nick/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random-engines:</p>
<ul>
<li>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11049/fi-bsw-n3050/igt@gem_lmem_swapping@random-engines.html">SKIP</a> +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14625/fi-apl-guc/igt@i915_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11049/fi-apl-guc/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10636">i915#10636</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8585">i915#8585</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11049/fi-bsw-nick/igt@i915_selftest@live@execlists.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10594">i915#10594</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@reset:</p>
<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14625/fi-apl-guc/igt@i915_selftest@live@reset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11049/fi-apl-guc/igt@i915_selftest@live@reset.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10636">i915#10636</a>) +36 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11049/fi-kbl-8809g/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-dp-1:</p>
<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14625/fi-apl-guc/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-dp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11049/fi-apl-guc/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-dp-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-1:</p>
<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14625/fi-apl-guc/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11049/fi-apl-guc/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8585">i915#8585</a>) +8 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14625/fi-apl-guc/igt@prime_vgem@basic-fence-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11049/fi-apl-guc/igt@prime_vgem@basic-fence-flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10512">i915#10512</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live@gt_contexts:<ul>
<li>{bat-arls-4}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14625/bat-arls-4/igt@i915_selftest@live@gt_contexts.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11049/bat-arls-4/igt@i915_selftest@live@gt_contexts.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7815 -&gt; IGTPW_11049</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14625: 7fb8042f224fd84650e556b13e2560d8f86a1914 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_11049: 11049<br />
  IGT_7815: d5d516bfdf77898e934b4c7ed947a43711cfb226 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============1971967589492024227==--
