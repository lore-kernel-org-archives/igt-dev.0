Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C542C4345F
	for <igt-dev@archiver.kernel.org>; Thu, 18 Apr 2024 11:04:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 930F310E131;
	Thu, 18 Apr 2024 11:04:04 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC50B10E131;
 Thu, 18 Apr 2024 11:04:03 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4941190170120829976=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBAT=3A_failure_for_Force_joiner_support_in_big?=
 =?utf-8?q?joiner_checks_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 18 Apr 2024 11:04:03 -0000
Message-ID: <171343824370.1500740.16313789972207357070@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240418091959.781560-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20240418091959.781560-1-bhanuprakash.modem@intel.com>
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

--===============4941190170120829976==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Force joiner support in bigjoiner checks (rev3)
URL   : https://patchwork.freedesktop.org/series/132557/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_14599 -> IGTPW_11038
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_11038 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_11038, please notify your bug team (&quot;I915-ci-infra@lists.freedesktop.org&quot;) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11038/index.html

Participating hosts (41 -> 35)
------------------------------

  Missing    (6): bat-kbl-2 fi-bsw-n3050 fi-snb-2520m fi-glk-j4005 fi-elk-e7500 bat-arls-3 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_11038:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_addfb_basic@addfb25-yf-tiled-legacy:
    - bat-arls-2:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14599/bat-arls-2/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11038/bat-arls-2/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html

  * igt@kms_flip@basic-flip-vs-dpms:
    - fi-cfl-guc:         NOTRUN -> [INCOMPLETE][3] +3 other tests incomplete
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11038/fi-cfl-guc/igt@kms_flip@basic-flip-vs-dpms.html
    - bat-adls-6:         NOTRUN -> [INCOMPLETE][4] +3 other tests incomplete
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11038/bat-adls-6/igt@kms_flip@basic-flip-vs-dpms.html

  * igt@kms_flip@basic-flip-vs-modeset:
    - fi-pnv-d510:        NOTRUN -> [INCOMPLETE][5] +3 other tests incomplete
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11038/fi-pnv-d510/igt@kms_flip@basic-flip-vs-modeset.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - fi-cfl-8700k:       NOTRUN -> [INCOMPLETE][6] +3 other tests incomplete
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11038/fi-cfl-8700k/igt@kms_flip@basic-flip-vs-wf_vblank.html
    - fi-blb-e6850:       NOTRUN -> [INCOMPLETE][7] +3 other tests incomplete
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11038/fi-blb-e6850/igt@kms_flip@basic-flip-vs-wf_vblank.html
    - bat-dg2-14:         NOTRUN -> [INCOMPLETE][8] +3 other tests incomplete
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11038/bat-dg2-14/igt@kms_flip@basic-flip-vs-wf_vblank.html
    - fi-bsw-nick:        NOTRUN -> [INCOMPLETE][9] +3 other tests incomplete
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11038/fi-bsw-nick/igt@kms_flip@basic-flip-vs-wf_vblank.html
    - fi-apl-guc:         NOTRUN -> [INCOMPLETE][10] +3 other tests incomplete
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11038/fi-apl-guc/igt@kms_flip@basic-flip-vs-wf_vblank.html
    - bat-dg2-11:         NOTRUN -> [INCOMPLETE][11] +3 other tests incomplete
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11038/bat-dg2-11/igt@kms_flip@basic-flip-vs-wf_vblank.html
    - fi-kbl-7567u:       NOTRUN -> [INCOMPLETE][12] +3 other tests incomplete
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11038/fi-kbl-7567u/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_flip@basic-plain-flip:
    - fi-ivb-3770:        NOTRUN -> [INCOMPLETE][13] +3 other tests incomplete
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11038/fi-ivb-3770/igt@kms_flip@basic-plain-flip.html
    - fi-ilk-650:         NOTRUN -> [INCOMPLETE][14] +3 other tests incomplete
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11038/fi-ilk-650/igt@kms_flip@basic-plain-flip.html
    - fi-tgl-1115g4:      NOTRUN -> [INCOMPLETE][15] +3 other tests incomplete
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11038/fi-tgl-1115g4/igt@kms_flip@basic-plain-flip.html
    - bat-arls-1:         NOTRUN -> [INCOMPLETE][16] +3 other tests incomplete
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11038/bat-arls-1/igt@kms_flip@basic-plain-flip.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24:
    - bat-dg2-11:         NOTRUN -> [FAIL][17] +2 other tests fail
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11038/bat-dg2-11/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html

  * igt@kms_pipe_crc_basic@hang-read-crc:
    - fi-tgl-1115g4:      NOTRUN -> [FAIL][18] +6 other tests fail
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11038/fi-tgl-1115g4/igt@kms_pipe_crc_basic@hang-read-crc.html
    - fi-cfl-guc:         NOTRUN -> [FAIL][19] +6 other tests fail
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11038/fi-cfl-guc/igt@kms_pipe_crc_basic@hang-read-crc.html

  * igt@kms_pipe_crc_basic@nonblocking-crc:
    - fi-apl-guc:         NOTRUN -> [FAIL][20] +6 other tests fail
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11038/fi-apl-guc/igt@kms_pipe_crc_basic@nonblocking-crc.html
    - fi-pnv-d510:        NOTRUN -> [FAIL][21] +6 other tests fail
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11038/fi-pnv-d510/igt@kms_pipe_crc_basic@nonblocking-crc.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
    - fi-kbl-7567u:       NOTRUN -> [FAIL][22] +6 other tests fail
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11038/fi-kbl-7567u/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html
    - fi-cfl-8700k:       NOTRUN -> [FAIL][23] +6 other tests fail
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11038/fi-cfl-8700k/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html

  * igt@kms_pipe_crc_basic@read-crc:
    - fi-ivb-3770:        NOTRUN -> [FAIL][24] +6 other tests fail
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11038/fi-ivb-3770/igt@kms_pipe_crc_basic@read-crc.html
    - bat-adls-6:         NOTRUN -> [FAIL][25] +6 other tests fail
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11038/bat-adls-6/igt@kms_pipe_crc_basic@read-crc.html
    - fi-ilk-650:         NOTRUN -> [FAIL][26] +6 other tests fail
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11038/fi-ilk-650/igt@kms_pipe_crc_basic@read-crc.html
    - bat-arls-1:         NOTRUN -> [FAIL][27] +6 other tests fail
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11038/bat-arls-1/igt@kms_pipe_crc_basic@read-crc.html
    - fi-blb-e6850:       NOTRUN -> [FAIL][28] +6 other tests fail
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11038/fi-blb-e6850/igt@kms_pipe_crc_basic@read-crc.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence:
    - bat-dg2-14:         NOTRUN -> [FAIL][29] +6 other tests fail
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11038/bat-dg2-14/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html
    - fi-bsw-nick:        NOTRUN -> [FAIL][30] +6 other tests fail
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11038/fi-bsw-nick/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html

  
#### Warnings ####

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
    - bat-dg2-11:         [SKIP][31] ([i915#9197]) -> [FAIL][32] +3 other tests fail
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14599/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11038/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-dp1:
    - {bat-rpls-4}:       [PASS][33] -> [FAIL][34] +11 other tests fail
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14599/bat-rpls-4/igt@kms_flip@basic-flip-vs-wf_vblank@c-dp1.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11038/bat-rpls-4/igt@kms_flip@basic-flip-vs-wf_vblank@c-dp1.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
    - {bat-rpls-4}:       NOTRUN -> [FAIL][35] +6 other tests fail
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11038/bat-rpls-4/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html

  
Known issues
------------

  Here are the changes found in IGTPW_11038 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_lmem_swapping@basic@lmem0:
    - bat-dg2-8:          [PASS][36] -> [FAIL][37] ([i915#10378])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14599/bat-dg2-8/igt@gem_lmem_swapping@basic@lmem0.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11038/bat-dg2-8/igt@gem_lmem_swapping@basic@lmem0.html

  * igt@i915_selftest@live@gt_timelines:
    - bat-dg2-11:         [PASS][38] -> [ABORT][39] ([i915#10366])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14599/bat-dg2-11/igt@i915_selftest@live@gt_timelines.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11038/bat-dg2-11/igt@i915_selftest@live@gt_timelines.html

  * igt@i915_selftest@live@hangcheck:
    - bat-adlp-11:        [PASS][40] -> [INCOMPLETE][41] ([i915#9413])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14599/bat-adlp-11/igt@i915_selftest@live@hangcheck.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11038/bat-adlp-11/igt@i915_selftest@live@hangcheck.html

  * igt@runner@aborted:
    - bat-arls-2:         NOTRUN -> [FAIL][42] ([i915#10690])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11038/bat-arls-2/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@migrate:
    - bat-dg2-9:          [ABORT][43] ([i915#10366] / [i915#10677]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14599/bat-dg2-9/igt@i915_selftest@live@migrate.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11038/bat-dg2-9/igt@i915_selftest@live@migrate.html

  * igt@i915_selftest@live@vma:
    - bat-dg2-8:          [ABORT][45] ([i915#10366]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14599/bat-dg2-8/igt@i915_selftest@live@vma.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11038/bat-dg2-8/igt@i915_selftest@live@vma.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10366]: https://gitlab.freedesktop.org/drm/intel/issues/10366
  [i915#10378]: https://gitlab.freedesktop.org/drm/intel/issues/10378
  [i915#10677]: https://gitlab.freedesktop.org/drm/intel/issues/10677
  [i915#10690]: https://gitlab.freedesktop.org/drm/intel/issues/10690
  [i915#9197]: https://gitlab.freedesktop.org/drm/intel/issues/9197
  [i915#9413]: https://gitlab.freedesktop.org/drm/intel/issues/9413


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7812 -> IGTPW_11038

  CI-20190529: 20190529
  CI_DRM_14599: 5e3d5d12bf65b0df480204b53228cbe419a2430c @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_11038: 49cc010187c9d25be851d9f1570d1bd11a919427 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7812: 7812

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11038/index.html

--===============4941190170120829976==
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
<tr><td><b>Series:</b></td><td>Force joiner support in bigjoiner checks (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/132557/">https://patchwork.freedesktop.org/series/132557/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11038/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11038/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_14599 -&gt; IGTPW_11038</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_11038 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_11038, please notify your bug team (&quot;I915-ci-infra@lists.freedesktop.org&quot;) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11038/index.html</p>
<h2>Participating hosts (41 -&gt; 35)</h2>
<p>Missing    (6): bat-kbl-2 fi-bsw-n3050 fi-snb-2520m fi-glk-j4005 fi-elk-e7500 bat-arls-3 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_11038:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-yf-tiled-legacy:</p>
<ul>
<li>bat-arls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14599/bat-arls-2/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11038/bat-arls-2/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms:</p>
<ul>
<li>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11038/fi-cfl-guc/igt@kms_flip@basic-flip-vs-dpms.html">INCOMPLETE</a> +3 other tests incomplete</li>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11038/bat-adls-6/igt@kms_flip@basic-flip-vs-dpms.html">INCOMPLETE</a> +3 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11038/fi-pnv-d510/igt@kms_flip@basic-flip-vs-modeset.html">INCOMPLETE</a> +3 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11038/fi-cfl-8700k/igt@kms_flip@basic-flip-vs-wf_vblank.html">INCOMPLETE</a> +3 other tests incomplete</li>
<li>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11038/fi-blb-e6850/igt@kms_flip@basic-flip-vs-wf_vblank.html">INCOMPLETE</a> +3 other tests incomplete</li>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11038/bat-dg2-14/igt@kms_flip@basic-flip-vs-wf_vblank.html">INCOMPLETE</a> +3 other tests incomplete</li>
<li>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11038/fi-bsw-nick/igt@kms_flip@basic-flip-vs-wf_vblank.html">INCOMPLETE</a> +3 other tests incomplete</li>
<li>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11038/fi-apl-guc/igt@kms_flip@basic-flip-vs-wf_vblank.html">INCOMPLETE</a> +3 other tests incomplete</li>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11038/bat-dg2-11/igt@kms_flip@basic-flip-vs-wf_vblank.html">INCOMPLETE</a> +3 other tests incomplete</li>
<li>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11038/fi-kbl-7567u/igt@kms_flip@basic-flip-vs-wf_vblank.html">INCOMPLETE</a> +3 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip:</p>
<ul>
<li>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11038/fi-ivb-3770/igt@kms_flip@basic-plain-flip.html">INCOMPLETE</a> +3 other tests incomplete</li>
<li>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11038/fi-ilk-650/igt@kms_flip@basic-plain-flip.html">INCOMPLETE</a> +3 other tests incomplete</li>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11038/fi-tgl-1115g4/igt@kms_flip@basic-plain-flip.html">INCOMPLETE</a> +3 other tests incomplete</li>
<li>bat-arls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11038/bat-arls-1/igt@kms_flip@basic-plain-flip.html">INCOMPLETE</a> +3 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11038/bat-dg2-11/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc:</p>
<ul>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11038/fi-tgl-1115g4/igt@kms_pipe_crc_basic@hang-read-crc.html">FAIL</a> +6 other tests fail</li>
<li>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11038/fi-cfl-guc/igt@kms_pipe_crc_basic@hang-read-crc.html">FAIL</a> +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc:</p>
<ul>
<li>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11038/fi-apl-guc/igt@kms_pipe_crc_basic@nonblocking-crc.html">FAIL</a> +6 other tests fail</li>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11038/fi-pnv-d510/igt@kms_pipe_crc_basic@nonblocking-crc.html">FAIL</a> +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:</p>
<ul>
<li>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11038/fi-kbl-7567u/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html">FAIL</a> +6 other tests fail</li>
<li>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11038/fi-cfl-8700k/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html">FAIL</a> +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc:</p>
<ul>
<li>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11038/fi-ivb-3770/igt@kms_pipe_crc_basic@read-crc.html">FAIL</a> +6 other tests fail</li>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11038/bat-adls-6/igt@kms_pipe_crc_basic@read-crc.html">FAIL</a> +6 other tests fail</li>
<li>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11038/fi-ilk-650/igt@kms_pipe_crc_basic@read-crc.html">FAIL</a> +6 other tests fail</li>
<li>bat-arls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11038/bat-arls-1/igt@kms_pipe_crc_basic@read-crc.html">FAIL</a> +6 other tests fail</li>
<li>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11038/fi-blb-e6850/igt@kms_pipe_crc_basic@read-crc.html">FAIL</a> +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence:</p>
<ul>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11038/bat-dg2-14/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html">FAIL</a> +6 other tests fail</li>
<li>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11038/fi-bsw-nick/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html">FAIL</a> +6 other tests fail</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:<ul>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14599/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9197">i915#9197</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11038/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@c-dp1:</p>
<ul>
<li>{bat-rpls-4}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14599/bat-rpls-4/igt@kms_flip@basic-flip-vs-wf_vblank@c-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11038/bat-rpls-4/igt@kms_flip@basic-flip-vs-wf_vblank@c-dp1.html">FAIL</a> +11 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:</p>
<ul>
<li>{bat-rpls-4}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11038/bat-rpls-4/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html">FAIL</a> +6 other tests fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11038 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_lmem_swapping@basic@lmem0:</p>
<ul>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14599/bat-dg2-8/igt@gem_lmem_swapping@basic@lmem0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11038/bat-dg2-8/igt@gem_lmem_swapping@basic@lmem0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10378">i915#10378</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_timelines:</p>
<ul>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14599/bat-dg2-11/igt@i915_selftest@live@gt_timelines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11038/bat-dg2-11/igt@i915_selftest@live@gt_timelines.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10366">i915#10366</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14599/bat-adlp-11/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11038/bat-adlp-11/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9413">i915#9413</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>bat-arls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11038/bat-arls-2/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10690">i915#10690</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@migrate:</p>
<ul>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14599/bat-dg2-9/igt@i915_selftest@live@migrate.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10366">i915#10366</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/10677">i915#10677</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11038/bat-dg2-9/igt@i915_selftest@live@migrate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@vma:</p>
<ul>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14599/bat-dg2-8/igt@i915_selftest@live@vma.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10366">i915#10366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11038/bat-dg2-8/igt@i915_selftest@live@vma.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7812 -&gt; IGTPW_11038</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14599: 5e3d5d12bf65b0df480204b53228cbe419a2430c @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_11038: 49cc010187c9d25be851d9f1570d1bd11a919427 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7812: 7812</p>

</body>
</html>

--===============4941190170120829976==--
