Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E8CED12671
	for <igt-dev@archiver.kernel.org>; Tue,  5 Nov 2024 09:50:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF74C10E549;
	Tue,  5 Nov 2024 09:50:37 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5067010E07A;
 Tue,  5 Nov 2024 09:50:36 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2789391006243929762=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Fgt=5Ffreq?=
 =?utf-8?q?=3A_Change_basic_throttle_API_test_criteria?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Raag Jadav" <raag.jadav@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 05 Nov 2024 09:50:36 -0000
Message-ID: <173080023632.1411133.13523469509343843356@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241105063228.452559-1-raag.jadav@intel.com>
In-Reply-To: <20241105063228.452559-1-raag.jadav@intel.com>
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

--===============2789391006243929762==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_gt_freq: Change basic throttle API test criteria
URL   : https://patchwork.freedesktop.org/series/140921/
State : success

== Summary ==

CI Bug Log - changes from IGT_8097 -> IGTPW_12032
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12032/index.html

Participating hosts (45 -> 45)
------------------------------

  Additional (1): bat-mtlp-9 
  Missing    (1): fi-snb-2520m 

New tests
---------

  New tests have been introduced between IGT_8097 and IGTPW_12032:

### New IGT tests (34) ###

  * igt@kms_flip@basic-flip-vs-dpms@a-dp6:
    - Statuses : 1 pass(s)
    - Exec time: [2.95] s

  * igt@kms_flip@basic-flip-vs-dpms@a-dp7:
    - Statuses : 1 pass(s)
    - Exec time: [2.98] s

  * igt@kms_flip@basic-flip-vs-dpms@b-dp6:
    - Statuses : 1 pass(s)
    - Exec time: [1.99] s

  * igt@kms_flip@basic-flip-vs-dpms@b-dp7:
    - Statuses : 1 pass(s)
    - Exec time: [2.90] s

  * igt@kms_flip@basic-flip-vs-dpms@c-dp6:
    - Statuses : 1 pass(s)
    - Exec time: [3.02] s

  * igt@kms_flip@basic-flip-vs-dpms@c-dp7:
    - Statuses : 1 pass(s)
    - Exec time: [2.94] s

  * igt@kms_flip@basic-flip-vs-dpms@d-dp6:
    - Statuses : 1 pass(s)
    - Exec time: [2.92] s

  * igt@kms_flip@basic-flip-vs-dpms@d-dp7:
    - Statuses : 1 pass(s)
    - Exec time: [2.97] s

  * igt@kms_flip@basic-flip-vs-modeset@a-dp6:
    - Statuses : 1 pass(s)
    - Exec time: [2.91] s

  * igt@kms_flip@basic-flip-vs-modeset@a-dp7:
    - Statuses : 1 pass(s)
    - Exec time: [1.96] s

  * igt@kms_flip@basic-flip-vs-modeset@b-dp6:
    - Statuses : 1 pass(s)
    - Exec time: [2.89] s

  * igt@kms_flip@basic-flip-vs-modeset@b-dp7:
    - Statuses : 1 pass(s)
    - Exec time: [1.96] s

  * igt@kms_flip@basic-flip-vs-modeset@c-dp6:
    - Statuses : 1 pass(s)
    - Exec time: [2.89] s

  * igt@kms_flip@basic-flip-vs-modeset@c-dp7:
    - Statuses : 1 pass(s)
    - Exec time: [2.96] s

  * igt@kms_flip@basic-flip-vs-modeset@d-dp6:
    - Statuses : 1 pass(s)
    - Exec time: [1.93] s

  * igt@kms_flip@basic-flip-vs-modeset@d-dp7:
    - Statuses : 1 pass(s)
    - Exec time: [2.16] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-dp6:
    - Statuses : 1 pass(s)
    - Exec time: [1.46] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@b-dp6:
    - Statuses : 1 pass(s)
    - Exec time: [1.42] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-dp6:
    - Statuses : 1 pass(s)
    - Exec time: [1.34] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@d-dp6:
    - Statuses : 1 pass(s)
    - Exec time: [1.33] s

  * igt@kms_flip@basic-plain-flip@a-dp6:
    - Statuses : 1 pass(s)
    - Exec time: [1.16] s

  * igt@kms_flip@basic-plain-flip@a-dp7:
    - Statuses : 1 pass(s)
    - Exec time: [1.13] s

  * igt@kms_flip@basic-plain-flip@b-dp6:
    - Statuses : 1 pass(s)
    - Exec time: [1.06] s

  * igt@kms_flip@basic-plain-flip@b-dp7:
    - Statuses : 1 pass(s)
    - Exec time: [1.06] s

  * igt@kms_flip@basic-plain-flip@c-dp6:
    - Statuses : 1 pass(s)
    - Exec time: [1.45] s

  * igt@kms_flip@basic-plain-flip@c-dp7:
    - Statuses : 1 pass(s)
    - Exec time: [1.06] s

  * igt@kms_flip@basic-plain-flip@d-dp6:
    - Statuses : 1 pass(s)
    - Exec time: [1.06] s

  * igt@kms_flip@basic-plain-flip@d-dp7:
    - Statuses : 1 pass(s)
    - Exec time: [1.04] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-dp-6:
    - Statuses : 1 pass(s)
    - Exec time: [3.04] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-dp-7:
    - Statuses : 1 pass(s)
    - Exec time: [3.04] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-dp-6:
    - Statuses : 1 pass(s)
    - Exec time: [1.46] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-dp-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.89] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-dp-6:
    - Statuses : 1 pass(s)
    - Exec time: [1.47] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-b-dp-6:
    - Statuses : 1 pass(s)
    - Exec time: [1.40] s

  

Known issues
------------

  Here are the changes found in IGTPW_12032 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_auth@basic-auth:
    - bat-apl-1:          [PASS][1] -> [DMESG-WARN][2] ([i915#11621] / [i915#1982])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8097/bat-apl-1/igt@core_auth@basic-auth.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12032/bat-apl-1/igt@core_auth@basic-auth.html

  * igt@i915_module_load@reload:
    - bat-apl-1:          [PASS][3] -> [DMESG-WARN][4] ([i915#180]) +1 other test dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8097/bat-apl-1/igt@i915_module_load@reload.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12032/bat-apl-1/igt@i915_module_load@reload.html

  * igt@i915_selftest@live:
    - bat-mtlp-8:         [PASS][5] -> [ABORT][6] ([i915#12061] / [i915#12133])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8097/bat-mtlp-8/igt@i915_selftest@live.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12032/bat-mtlp-8/igt@i915_selftest@live.html

  * igt@i915_selftest@live@evict:
    - bat-apl-1:          NOTRUN -> [DMESG-WARN][7] ([i915#11621] / [i915#12133]) +14 other tests dmesg-warn
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12032/bat-apl-1/igt@i915_selftest@live@evict.html

  * igt@i915_selftest@live@hugepages:
    - bat-apl-1:          NOTRUN -> [DMESG-WARN][8] ([i915#11621]) +10 other tests dmesg-warn
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12032/bat-apl-1/igt@i915_selftest@live@hugepages.html

  * igt@i915_selftest@live@sanitycheck:
    - bat-apl-1:          [PASS][9] -> [DMESG-WARN][10] ([i915#11621]) +15 other tests dmesg-warn
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8097/bat-apl-1/igt@i915_selftest@live@sanitycheck.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12032/bat-apl-1/igt@i915_selftest@live@sanitycheck.html

  * igt@i915_selftest@live@uncore:
    - bat-apl-1:          [PASS][11] -> [DMESG-WARN][12] ([i915#11621] / [i915#12133]) +5 other tests dmesg-warn
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8097/bat-apl-1/igt@i915_selftest@live@uncore.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12032/bat-apl-1/igt@i915_selftest@live@uncore.html

  * igt@i915_selftest@live@workarounds:
    - bat-mtlp-8:         [PASS][13] -> [ABORT][14] ([i915#12061])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8097/bat-mtlp-8/igt@i915_selftest@live@workarounds.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12032/bat-mtlp-8/igt@i915_selftest@live@workarounds.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - bat-apl-1:          [PASS][15] -> [DMESG-WARN][16] ([i915#11621] / [i915#180] / [i915#1982]) +1 other test dmesg-warn
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8097/bat-apl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12032/bat-apl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - bat-apl-1:          [PASS][17] -> [DMESG-WARN][18] ([i915#11621] / [i915#180]) +38 other tests dmesg-warn
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8097/bat-apl-1/igt@kms_pm_rpm@basic-pci-d3-state.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12032/bat-apl-1/igt@kms_pm_rpm@basic-pci-d3-state.html

  
#### Possible fixes ####

  * igt@i915_selftest@live:
    - bat-arls-2:         [ABORT][19] ([i915#12133]) -> [PASS][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8097/bat-arls-2/igt@i915_selftest@live.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12032/bat-arls-2/igt@i915_selftest@live.html

  * igt@i915_selftest@live@workarounds:
    - bat-arls-2:         [ABORT][21] ([i915#12061]) -> [PASS][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8097/bat-arls-2/igt@i915_selftest@live@workarounds.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12032/bat-arls-2/igt@i915_selftest@live@workarounds.html

  
#### Warnings ####

  * igt@i915_selftest@live@gt_tlb:
    - bat-apl-1:          [ABORT][23] ([i915#12133]) -> [DMESG-WARN][24] ([i915#11621] / [i915#12133]) +1 other test dmesg-warn
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8097/bat-apl-1/igt@i915_selftest@live@gt_tlb.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12032/bat-apl-1/igt@i915_selftest@live@gt_tlb.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10216]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10216
  [i915#11621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11621
  [i915#11681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12133]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12133
  [i915#180]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180
  [i915#1982]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
  [i915#3840]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840
  [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
  [i915#4212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
  [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274
  [i915#6621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621
  [i915#8809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8809
  [i915#9159]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9159
  [i915#9318]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9318
  [i915#9688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8097 -> IGTPW_12032
  * Linux: CI_DRM_15628 -> CI_DRM_15631

  CI-20190529: 20190529
  CI_DRM_15628: a4532bcf5eea0cfdb56fbdc3195a2d15d193727b @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_15631: 2af747587f44530eae7e5c7cee1f24c34613d61b @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12032: 7cb8434d0ae97d3543e7dd08e509f64a9dd472e9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8097: 2e7c8e4b88a50e33e10d6c13286818aa833bef9b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12032/index.html

--===============2789391006243929762==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_gt_freq: Change basic throttle API test criteria</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/140921/">https://patchwork.freedesktop.org/series/140921/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12032/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12032/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8097 -&gt; IGTPW_12032</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12032/index.html</p>
<h2>Participating hosts (45 -&gt; 45)</h2>
<p>Additional (1): bat-mtlp-9 <br />
  Missing    (1): fi-snb-2520m </p>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_8097 and IGTPW_12032:</p>
<h3>New IGT tests (34)</h3>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@a-dp6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@a-dp7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@b-dp6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@b-dp7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@c-dp6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@c-dp7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.94] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@d-dp6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@d-dp7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@a-dp6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@a-dp7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@b-dp6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@b-dp7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@c-dp6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@c-dp7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@d-dp6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.93] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@d-dp7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@a-dp6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@b-dp6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@c-dp6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@d-dp6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@a-dp6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@a-dp7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@b-dp6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@b-dp7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@c-dp6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@c-dp7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@d-dp6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@d-dp7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-dp-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-dp-7:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-dp-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-dp-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-dp-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-b-dp-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.40] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_12032 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_auth@basic-auth:</p>
<ul>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8097/bat-apl-1/igt@core_auth@basic-auth.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12032/bat-apl-1/igt@core_auth@basic-auth.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11621">i915#11621</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8097/bat-apl-1/igt@i915_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12032/bat-apl-1/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180">i915#180</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8097/bat-mtlp-8/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12032/bat-mtlp-8/igt@i915_selftest@live.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12133">i915#12133</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@evict:</p>
<ul>
<li>bat-apl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12032/bat-apl-1/igt@i915_selftest@live@evict.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11621">i915#11621</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12133">i915#12133</a>) +14 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hugepages:</p>
<ul>
<li>bat-apl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12032/bat-apl-1/igt@i915_selftest@live@hugepages.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11621">i915#11621</a>) +10 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@sanitycheck:</p>
<ul>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8097/bat-apl-1/igt@i915_selftest@live@sanitycheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12032/bat-apl-1/igt@i915_selftest@live@sanitycheck.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11621">i915#11621</a>) +15 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@uncore:</p>
<ul>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8097/bat-apl-1/igt@i915_selftest@live@uncore.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12032/bat-apl-1/igt@i915_selftest@live@uncore.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11621">i915#11621</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12133">i915#12133</a>) +5 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8097/bat-mtlp-8/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12032/bat-mtlp-8/igt@i915_selftest@live@workarounds.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8097/bat-apl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12032/bat-apl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11621">i915#11621</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180">i915#180</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982">i915#1982</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8097/bat-apl-1/igt@kms_pm_rpm@basic-pci-d3-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12032/bat-apl-1/igt@kms_pm_rpm@basic-pci-d3-state.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11621">i915#11621</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180">i915#180</a>) +38 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-arls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8097/bat-arls-2/igt@i915_selftest@live.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12133">i915#12133</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12032/bat-arls-2/igt@i915_selftest@live.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-arls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8097/bat-arls-2/igt@i915_selftest@live@workarounds.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12032/bat-arls-2/igt@i915_selftest@live@workarounds.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@i915_selftest@live@gt_tlb:<ul>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8097/bat-apl-1/igt@i915_selftest@live@gt_tlb.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12133">i915#12133</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12032/bat-apl-1/igt@i915_selftest@live@gt_tlb.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11621">i915#11621</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12133">i915#12133</a>) +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8097 -&gt; IGTPW_12032</li>
<li>Linux: CI_DRM_15628 -&gt; CI_DRM_15631</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_15628: a4532bcf5eea0cfdb56fbdc3195a2d15d193727b @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_15631: 2af747587f44530eae7e5c7cee1f24c34613d61b @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_12032: 7cb8434d0ae97d3543e7dd08e509f64a9dd472e9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8097: 2e7c8e4b88a50e33e10d6c13286818aa833bef9b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============2789391006243929762==--
