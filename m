Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 045EFD60D0D
	for <igt-dev@archiver.kernel.org>; Tue, 19 Nov 2024 03:02:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A609810E15C;
	Tue, 19 Nov 2024 03:02:00 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78CAF10E15C;
 Tue, 19 Nov 2024 03:01:59 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7310451687928824445=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBAT=3A_failure_for_Add_pci=5Fmembarrier_test_i?=
 =?utf-8?q?n_xe=5Fmmap_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 19 Nov 2024 03:01:59 -0000
Message-ID: <173198531951.107714.10444746123556242618@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241118173137.1512581-1-tejas.upadhyay@intel.com>
In-Reply-To: <20241118173137.1512581-1-tejas.upadhyay@intel.com>
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

--===============7310451687928824445==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add pci_membarrier test in xe_mmap (rev5)
URL   : https://patchwork.freedesktop.org/series/141296/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8115 -> IGTPW_12129
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12129 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12129, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12129/index.html

Participating hosts (46 -> 45)
------------------------------

  Missing    (1): fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12129:

### IGT changes ###

#### Possible regressions ####

  * igt@dmabuf@all-tests@dma_fence_chain:
    - fi-bsw-nick:        [PASS][1] -> [INCOMPLETE][2] +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8115/fi-bsw-nick/igt@dmabuf@all-tests@dma_fence_chain.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12129/fi-bsw-nick/igt@dmabuf@all-tests@dma_fence_chain.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-dp7:
    - {bat-mtlp-9}:       [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8115/bat-mtlp-9/igt@kms_flip@basic-flip-vs-wf_vblank@c-dp7.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12129/bat-mtlp-9/igt@kms_flip@basic-flip-vs-wf_vblank@c-dp7.html

  
Known issues
------------

  Here are the changes found in IGTPW_12129 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
    - bat-dg2-11:         [PASS][5] -> [SKIP][6] ([i915#9197]) +3 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8115/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12129/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html

  * igt@runner@aborted:
    - bat-dg2-13:         NOTRUN -> [FAIL][7] ([i915#12658])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12129/bat-dg2-13/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@i915_selftest@live:
    - bat-mtlp-6:         [ABORT][8] ([i915#12829]) -> [PASS][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8115/bat-mtlp-6/igt@i915_selftest@live.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12129/bat-mtlp-6/igt@i915_selftest@live.html

  * igt@i915_selftest@live@workarounds:
    - bat-mtlp-6:         [ABORT][10] -> [PASS][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8115/bat-mtlp-6/igt@i915_selftest@live@workarounds.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12129/bat-mtlp-6/igt@i915_selftest@live@workarounds.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12658
  [i915#12829]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12829
  [i915#2122]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2122
  [i915#9197]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9197


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8115 -> IGTPW_12129
  * Linux: CI_DRM_15716 -> CI_DRM_15717

  CI-20190529: 20190529
  CI_DRM_15716: 6abefc8e3bf638090d5277bc3e6fd02bb25579a4 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_15717: 1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12129: 12129
  IGT_8115: 4942fc57c20f9cb2195e70991c4e4df03dd3db21 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12129/index.html

--===============7310451687928824445==
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
<tr><td><b>Series:</b></td><td>Add pci_membarrier test in xe_mmap (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/141296/">https://patchwork.freedesktop.org/series/141296/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12129/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12129/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8115 -&gt; IGTPW_12129</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_12129 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_12129, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12129/index.html</p>
<h2>Participating hosts (46 -&gt; 45)</h2>
<p>Missing    (1): fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_12129:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@dmabuf@all-tests@dma_fence_chain:<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8115/fi-bsw-nick/igt@dmabuf@all-tests@dma_fence_chain.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12129/fi-bsw-nick/igt@dmabuf@all-tests@dma_fence_chain.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@kms_flip@basic-flip-vs-wf_vblank@c-dp7:<ul>
<li>{bat-mtlp-9}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8115/bat-mtlp-9/igt@kms_flip@basic-flip-vs-wf_vblank@c-dp7.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12129/bat-mtlp-9/igt@kms_flip@basic-flip-vs-wf_vblank@c-dp7.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_12129 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:</p>
<ul>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8115/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12129/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9197">i915#9197</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>bat-dg2-13:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12129/bat-dg2-13/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12658">i915#12658</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8115/bat-mtlp-6/igt@i915_selftest@live.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12829">i915#12829</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12129/bat-mtlp-6/igt@i915_selftest@live.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8115/bat-mtlp-6/igt@i915_selftest@live@workarounds.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12129/bat-mtlp-6/igt@i915_selftest@live@workarounds.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8115 -&gt; IGTPW_12129</li>
<li>Linux: CI_DRM_15716 -&gt; CI_DRM_15717</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_15716: 6abefc8e3bf638090d5277bc3e6fd02bb25579a4 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_15717: 1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_12129: 12129<br />
  IGT_8115: 4942fc57c20f9cb2195e70991c4e4df03dd3db21 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============7310451687928824445==--
