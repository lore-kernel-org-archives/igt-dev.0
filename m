Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB8A5C25B74
	for <igt-dev@archiver.kernel.org>; Thu, 16 May 2024 05:28:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62AD310E023;
	Thu, 16 May 2024 05:28:00 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAAD010E023;
 Thu, 16 May 2024 05:27:58 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4908454456527580049=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_tests/intel/kms=5Fbig=5Ffb?=
 =?utf-8?q?=3A_Introducing_this_restriction_to_optimize_the_test_execution_t?=
 =?utf-8?q?ime_on_simulation?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Pranay Samala" <pranay.samala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 16 May 2024 05:27:58 -0000
Message-ID: <171583727895.2120091.1392005044227781723@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240516041610.409576-1-pranay.samala@intel.com>
In-Reply-To: <20240516041610.409576-1-pranay.samala@intel.com>
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

--===============4908454456527580049==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/kms_big_fb: Introducing this restriction to optimize the test execution time on simulation
URL   : https://patchwork.freedesktop.org/series/133675/
State : success

== Summary ==

CI Bug Log - changes from IGT_7858 -> IGTPW_11149
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11149/index.html

Participating hosts (42 -> 41)
------------------------------

  Additional (1): fi-kbl-8809g 
  Missing    (2): fi-snb-2520m fi-bsw-n3050 

Known issues
------------

  Here are the changes found in IGTPW_11149 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_huc_copy@huc-copy:
    - fi-kbl-8809g:       NOTRUN -> [SKIP][1] ([i915#2190])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11149/fi-kbl-8809g/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - fi-kbl-8809g:       NOTRUN -> [SKIP][2] ([i915#4613]) +3 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11149/fi-kbl-8809g/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@i915_selftest@live@active:
    - fi-bsw-nick:        [PASS][3] -> [DMESG-FAIL][4] ([i915#10676])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7858/fi-bsw-nick/igt@i915_selftest@live@active.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11149/fi-bsw-nick/igt@i915_selftest@live@active.html

  * igt@i915_selftest@live@execlists:
    - fi-bsw-nick:        [PASS][5] -> [ABORT][6] ([i915#10594])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7858/fi-bsw-nick/igt@i915_selftest@live@execlists.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11149/fi-bsw-nick/igt@i915_selftest@live@execlists.html

  * igt@kms_dsc@dsc-basic:
    - fi-kbl-8809g:       NOTRUN -> [SKIP][7] +30 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11149/fi-kbl-8809g/igt@kms_dsc@dsc-basic.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@dmabuf:
    - {bat-arls-4}:       [DMESG-FAIL][8] ([i915#11035]) -> [PASS][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7858/bat-arls-4/igt@i915_selftest@live@dmabuf.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11149/bat-arls-4/igt@i915_selftest@live@dmabuf.html

  * igt@kms_flip@basic-flip-vs-dpms@a-dp7:
    - {bat-mtlp-9}:       [DMESG-WARN][10] ([i915#10435]) -> [PASS][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7858/bat-mtlp-9/igt@kms_flip@basic-flip-vs-dpms@a-dp7.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11149/bat-mtlp-9/igt@kms_flip@basic-flip-vs-dpms@a-dp7.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-dp-7:
    - {bat-mtlp-9}:       [DMESG-FAIL][12] ([i915#4229]) -> [PASS][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7858/bat-mtlp-9/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-dp-7.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11149/bat-mtlp-9/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-dp-7.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-6:
    - {bat-mtlp-9}:       [FAIL][14] -> [PASS][15] +1 other test pass
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7858/bat-mtlp-9/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-6.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11149/bat-mtlp-9/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-6.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dp-6:
    - {bat-mtlp-9}:       [FAIL][16] ([i915#10979]) -> [PASS][17]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7858/bat-mtlp-9/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dp-6.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11149/bat-mtlp-9/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dp-6.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10435]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10435
  [i915#10594]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10594
  [i915#10676]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10676
  [i915#10979]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10979
  [i915#11035]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11035
  [i915#2190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190
  [i915#4229]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4229
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7858 -> IGTPW_11149

  CI-20190529: 20190529
  CI_DRM_14773: 220fb645d6cd4ce4155b5ccfdf52b35d6a7942c3 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_11149: 11149
  IGT_7858: 133c90d6aabcd90871e36946317c90ee83c2f847 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11149/index.html

--===============4908454456527580049==
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
<tr><td><b>Series:</b></td><td>tests/intel/kms_big_fb: Introducing this restriction to optimize the test execution time on simulation</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/133675/">https://patchwork.freedesktop.org/series/133675/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11149/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11149/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7858 -&gt; IGTPW_11149</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11149/index.html</p>
<h2>Participating hosts (42 -&gt; 41)</h2>
<p>Additional (1): fi-kbl-8809g <br />
  Missing    (2): fi-snb-2520m fi-bsw-n3050 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11149 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11149/fi-kbl-8809g/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11149/fi-kbl-8809g/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@active:</p>
<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7858/fi-bsw-nick/igt@i915_selftest@live@active.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11149/fi-bsw-nick/igt@i915_selftest@live@active.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10676">i915#10676</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7858/fi-bsw-nick/igt@i915_selftest@live@execlists.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11149/fi-bsw-nick/igt@i915_selftest@live@execlists.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10594">i915#10594</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11149/fi-kbl-8809g/igt@kms_dsc@dsc-basic.html">SKIP</a> +30 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@dmabuf:</p>
<ul>
<li>{bat-arls-4}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7858/bat-arls-4/igt@i915_selftest@live@dmabuf.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11035">i915#11035</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11149/bat-arls-4/igt@i915_selftest@live@dmabuf.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@a-dp7:</p>
<ul>
<li>{bat-mtlp-9}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7858/bat-mtlp-9/igt@kms_flip@basic-flip-vs-dpms@a-dp7.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10435">i915#10435</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11149/bat-mtlp-9/igt@kms_flip@basic-flip-vs-dpms@a-dp7.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-dp-7:</p>
<ul>
<li>{bat-mtlp-9}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7858/bat-mtlp-9/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-dp-7.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4229">i915#4229</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11149/bat-mtlp-9/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-dp-7.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-6:</p>
<ul>
<li>{bat-mtlp-9}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7858/bat-mtlp-9/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-6.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11149/bat-mtlp-9/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-6.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dp-6:</p>
<ul>
<li>{bat-mtlp-9}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7858/bat-mtlp-9/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dp-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10979">i915#10979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11149/bat-mtlp-9/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dp-6.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7858 -&gt; IGTPW_11149</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14773: 220fb645d6cd4ce4155b5ccfdf52b35d6a7942c3 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_11149: 11149<br />
  IGT_7858: 133c90d6aabcd90871e36946317c90ee83c2f847 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============4908454456527580049==--
