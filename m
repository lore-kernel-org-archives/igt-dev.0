Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEE1ECAC582
	for <igt-dev@archiver.kernel.org>; Tue,  9 Sep 2025 23:54:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3652310E280;
	Tue,  9 Sep 2025 23:54:08 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A1BE10E280;
 Tue,  9 Sep 2025 23:54:06 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5870025042776724578=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_runner=3A_Add_new_option_?=
 =?utf-8?q?--disk-limit-per-run_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kamil Konieczny" <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 09 Sep 2025 23:54:06 -0000
Message-ID: <175746204647.319532.9324174819802370388@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250909124651.173431-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20250909124651.173431-1-kamil.konieczny@linux.intel.com>
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

--===============5870025042776724578==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: runner: Add new option --disk-limit-per-run (rev2)
URL   : https://patchwork.freedesktop.org/series/154203/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8528 -> IGTPW_13713
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_13713 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_13713, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13713/index.html

Participating hosts (44 -> 43)
------------------------------

  Missing    (1): fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_13713:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_pm_rpm@module-reload:
    - fi-cfl-8109u:       [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8528/fi-cfl-8109u/igt@i915_pm_rpm@module-reload.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13713/fi-cfl-8109u/igt@i915_pm_rpm@module-reload.html
    - fi-tgl-1115g4:      [PASS][3] -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8528/fi-tgl-1115g4/igt@i915_pm_rpm@module-reload.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13713/fi-tgl-1115g4/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live:
    - bat-mtlp-8:         [PASS][5] -> [INCOMPLETE][6] +1 other test incomplete
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8528/bat-mtlp-8/igt@i915_selftest@live.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13713/bat-mtlp-8/igt@i915_selftest@live.html
    - bat-adls-6:         [PASS][7] -> [INCOMPLETE][8] +1 other test incomplete
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8528/bat-adls-6/igt@i915_selftest@live.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13713/bat-adls-6/igt@i915_selftest@live.html
    - bat-dg1-7:          [PASS][9] -> [INCOMPLETE][10] +1 other test incomplete
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8528/bat-dg1-7/igt@i915_selftest@live.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13713/bat-dg1-7/igt@i915_selftest@live.html
    - bat-adlp-9:         [PASS][11] -> [ABORT][12] +1 other test abort
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8528/bat-adlp-9/igt@i915_selftest@live.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13713/bat-adlp-9/igt@i915_selftest@live.html
    - bat-twl-1:          [PASS][13] -> [INCOMPLETE][14] +1 other test incomplete
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8528/bat-twl-1/igt@i915_selftest@live.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13713/bat-twl-1/igt@i915_selftest@live.html
    - fi-cfl-guc:         [PASS][15] -> [INCOMPLETE][16] +1 other test incomplete
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8528/fi-cfl-guc/igt@i915_selftest@live.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13713/fi-cfl-guc/igt@i915_selftest@live.html
    - bat-twl-2:          [PASS][17] -> [INCOMPLETE][18] +1 other test incomplete
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8528/bat-twl-2/igt@i915_selftest@live.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13713/bat-twl-2/igt@i915_selftest@live.html

  * igt@i915_selftest@live@active:
    - bat-dg2-8:          [PASS][19] -> [INCOMPLETE][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8528/bat-dg2-8/igt@i915_selftest@live@active.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13713/bat-dg2-8/igt@i915_selftest@live@active.html

  * igt@i915_selftest@live@client:
    - bat-mtlp-9:         [PASS][21] -> [INCOMPLETE][22] +1 other test incomplete
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8528/bat-mtlp-9/igt@i915_selftest@live@client.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13713/bat-mtlp-9/igt@i915_selftest@live@client.html

  * igt@i915_selftest@live@dmabuf:
    - bat-dg2-11:         [PASS][23] -> [INCOMPLETE][24]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8528/bat-dg2-11/igt@i915_selftest@live@dmabuf.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13713/bat-dg2-11/igt@i915_selftest@live@dmabuf.html

  * igt@i915_selftest@live@gem:
    - bat-arls-5:         [PASS][25] -> [INCOMPLETE][26]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8528/bat-arls-5/igt@i915_selftest@live@gem.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13713/bat-arls-5/igt@i915_selftest@live@gem.html

  * igt@i915_selftest@live@gt_heartbeat:
    - bat-arlh-3:         [PASS][27] -> [INCOMPLETE][28]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8528/bat-arlh-3/igt@i915_selftest@live@gt_heartbeat.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13713/bat-arlh-3/igt@i915_selftest@live@gt_heartbeat.html

  * igt@i915_selftest@live@requests:
    - bat-dg2-9:          [PASS][29] -> [INCOMPLETE][30]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8528/bat-dg2-9/igt@i915_selftest@live@requests.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13713/bat-dg2-9/igt@i915_selftest@live@requests.html

  * igt@i915_selftest@live@ring_submission:
    - bat-rplp-1:         [PASS][31] -> [INCOMPLETE][32] +1 other test incomplete
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8528/bat-rplp-1/igt@i915_selftest@live@ring_submission.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13713/bat-rplp-1/igt@i915_selftest@live@ring_submission.html

  * igt@i915_selftest@live@vma:
    - bat-arls-6:         [PASS][33] -> [INCOMPLETE][34] +1 other test incomplete
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8528/bat-arls-6/igt@i915_selftest@live@vma.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13713/bat-arls-6/igt@i915_selftest@live@vma.html

  * igt@kms_hdmi_inject@inject-audio:
    - fi-tgl-1115g4:      [PASS][35] -> [FAIL][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8528/fi-tgl-1115g4/igt@kms_hdmi_inject@inject-audio.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13713/fi-tgl-1115g4/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_pipe_crc_basic@hang-read-crc:
    - bat-adlp-6:         [PASS][37] -> [INCOMPLETE][38] +1 other test incomplete
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8528/bat-adlp-6/igt@kms_pipe_crc_basic@hang-read-crc.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13713/bat-adlp-6/igt@kms_pipe_crc_basic@hang-read-crc.html

  
#### Warnings ####

  * igt@i915_selftest@live:
    - bat-dg2-8:          [ABORT][39] ([i915#14201]) -> [INCOMPLETE][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8528/bat-dg2-8/igt@i915_selftest@live.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13713/bat-dg2-8/igt@i915_selftest@live.html

  
Known issues
------------

  Here are the changes found in IGTPW_13713 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live:
    - bat-arls-5:         [PASS][41] -> [INCOMPLETE][42] ([i915#14818])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8528/bat-arls-5/igt@i915_selftest@live.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13713/bat-arls-5/igt@i915_selftest@live.html
    - bat-dg2-11:         [PASS][43] -> [INCOMPLETE][44] ([i915#12061])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8528/bat-dg2-11/igt@i915_selftest@live.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13713/bat-dg2-11/igt@i915_selftest@live.html

  * igt@i915_selftest@live@workarounds:
    - bat-arls-5:         [PASS][45] -> [DMESG-FAIL][46] ([i915#12061])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8528/bat-arls-5/igt@i915_selftest@live@workarounds.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13713/bat-arls-5/igt@i915_selftest@live@workarounds.html
    - bat-dg2-11:         [PASS][47] -> [DMESG-FAIL][48] ([i915#12061])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8528/bat-dg2-11/igt@i915_selftest@live@workarounds.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13713/bat-dg2-11/igt@i915_selftest@live@workarounds.html

  
#### Possible fixes ####

  * igt@dmabuf@all-tests@dma_fence_chain:
    - fi-bsw-nick:        [ABORT][49] ([i915#12904]) -> [PASS][50] +1 other test pass
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8528/fi-bsw-nick/igt@dmabuf@all-tests@dma_fence_chain.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13713/fi-bsw-nick/igt@dmabuf@all-tests@dma_fence_chain.html
    - fi-bsw-n3050:       [ABORT][51] ([i915#12904]) -> [PASS][52] +1 other test pass
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8528/fi-bsw-n3050/igt@dmabuf@all-tests@dma_fence_chain.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13713/fi-bsw-n3050/igt@dmabuf@all-tests@dma_fence_chain.html

  * igt@i915_selftest@live@workarounds:
    - bat-arlh-3:         [DMESG-FAIL][53] ([i915#12061]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8528/bat-arlh-3/igt@i915_selftest@live@workarounds.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13713/bat-arlh-3/igt@i915_selftest@live@workarounds.html
    - bat-dg2-14:         [DMESG-FAIL][55] ([i915#12061]) -> [PASS][56] +1 other test pass
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8528/bat-dg2-14/igt@i915_selftest@live@workarounds.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13713/bat-dg2-14/igt@i915_selftest@live@workarounds.html

  
#### Warnings ####

  * igt@i915_selftest@live:
    - bat-arlh-3:         [DMESG-FAIL][57] ([i915#12061]) -> [INCOMPLETE][58] ([i915#14764] / [i915#14837])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8528/bat-arlh-3/igt@i915_selftest@live.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13713/bat-arlh-3/igt@i915_selftest@live.html
    - bat-dg2-9:          [DMESG-FAIL][59] ([i915#12061]) -> [INCOMPLETE][60] ([i915#12061] / [i915#14201])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8528/bat-dg2-9/igt@i915_selftest@live.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13713/bat-dg2-9/igt@i915_selftest@live.html

  
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12904]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12904
  [i915#14201]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14201
  [i915#14764]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14764
  [i915#14818]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14818
  [i915#14837]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14837


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8528 -> IGTPW_13713

  CI-20190529: 20190529
  CI_DRM_17164: b3bf929e6bb3fefb6ff8ebdbddbeee61d03bb671 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_13713: 13713
  IGT_8528: 9252073bde221857c96656b6c96749c444aa1890 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13713/index.html

--===============5870025042776724578==
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
<tr><td><b>Series:</b></td><td>runner: Add new option --disk-limit-per-run (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/154203/">https://patchwork.freedesktop.org/series/154203/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13713/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13713/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8528 -&gt; IGTPW_13713</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_13713 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_13713, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13713/index.html</p>
<h2>Participating hosts (44 -&gt; 43)</h2>
<p>Missing    (1): fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_13713:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8528/fi-cfl-8109u/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13713/fi-cfl-8109u/igt@i915_pm_rpm@module-reload.html">FAIL</a></li>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8528/fi-tgl-1115g4/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13713/fi-tgl-1115g4/igt@i915_pm_rpm@module-reload.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8528/bat-mtlp-8/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13713/bat-mtlp-8/igt@i915_selftest@live.html">INCOMPLETE</a> +1 other test incomplete</li>
<li>bat-adls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8528/bat-adls-6/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13713/bat-adls-6/igt@i915_selftest@live.html">INCOMPLETE</a> +1 other test incomplete</li>
<li>bat-dg1-7:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8528/bat-dg1-7/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13713/bat-dg1-7/igt@i915_selftest@live.html">INCOMPLETE</a> +1 other test incomplete</li>
<li>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8528/bat-adlp-9/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13713/bat-adlp-9/igt@i915_selftest@live.html">ABORT</a> +1 other test abort</li>
<li>bat-twl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8528/bat-twl-1/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13713/bat-twl-1/igt@i915_selftest@live.html">INCOMPLETE</a> +1 other test incomplete</li>
<li>fi-cfl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8528/fi-cfl-guc/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13713/fi-cfl-guc/igt@i915_selftest@live.html">INCOMPLETE</a> +1 other test incomplete</li>
<li>bat-twl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8528/bat-twl-2/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13713/bat-twl-2/igt@i915_selftest@live.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@active:</p>
<ul>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8528/bat-dg2-8/igt@i915_selftest@live@active.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13713/bat-dg2-8/igt@i915_selftest@live@active.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@client:</p>
<ul>
<li>bat-mtlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8528/bat-mtlp-9/igt@i915_selftest@live@client.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13713/bat-mtlp-9/igt@i915_selftest@live@client.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@dmabuf:</p>
<ul>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8528/bat-dg2-11/igt@i915_selftest@live@dmabuf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13713/bat-dg2-11/igt@i915_selftest@live@dmabuf.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gem:</p>
<ul>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8528/bat-arls-5/igt@i915_selftest@live@gem.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13713/bat-arls-5/igt@i915_selftest@live@gem.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8528/bat-arlh-3/igt@i915_selftest@live@gt_heartbeat.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13713/bat-arlh-3/igt@i915_selftest@live@gt_heartbeat.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8528/bat-dg2-9/igt@i915_selftest@live@requests.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13713/bat-dg2-9/igt@i915_selftest@live@requests.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@ring_submission:</p>
<ul>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8528/bat-rplp-1/igt@i915_selftest@live@ring_submission.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13713/bat-rplp-1/igt@i915_selftest@live@ring_submission.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@vma:</p>
<ul>
<li>bat-arls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8528/bat-arls-6/igt@i915_selftest@live@vma.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13713/bat-arls-6/igt@i915_selftest@live@vma.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8528/fi-tgl-1115g4/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13713/fi-tgl-1115g4/igt@kms_hdmi_inject@inject-audio.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc:</p>
<ul>
<li>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8528/bat-adlp-6/igt@kms_pipe_crc_basic@hang-read-crc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13713/bat-adlp-6/igt@kms_pipe_crc_basic@hang-read-crc.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@i915_selftest@live:<ul>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8528/bat-dg2-8/igt@i915_selftest@live.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14201">i915#14201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13713/bat-dg2-8/igt@i915_selftest@live.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_13713 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8528/bat-arls-5/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13713/bat-arls-5/igt@i915_selftest@live.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14818">i915#14818</a>)</li>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8528/bat-dg2-11/igt@i915_selftest@live.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13713/bat-dg2-11/igt@i915_selftest@live.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-arls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8528/bat-arls-5/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13713/bat-arls-5/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>)</li>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8528/bat-dg2-11/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13713/bat-dg2-11/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@dmabuf@all-tests@dma_fence_chain:</p>
<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8528/fi-bsw-nick/igt@dmabuf@all-tests@dma_fence_chain.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12904">i915#12904</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13713/fi-bsw-nick/igt@dmabuf@all-tests@dma_fence_chain.html">PASS</a> +1 other test pass</li>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8528/fi-bsw-n3050/igt@dmabuf@all-tests@dma_fence_chain.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12904">i915#12904</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13713/fi-bsw-n3050/igt@dmabuf@all-tests@dma_fence_chain.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8528/bat-arlh-3/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13713/bat-arlh-3/igt@i915_selftest@live@workarounds.html">PASS</a></li>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8528/bat-dg2-14/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13713/bat-dg2-14/igt@i915_selftest@live@workarounds.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@i915_selftest@live:<ul>
<li>bat-arlh-3:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8528/bat-arlh-3/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13713/bat-arlh-3/igt@i915_selftest@live.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14764">i915#14764</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14837">i915#14837</a>)</li>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8528/bat-dg2-9/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13713/bat-dg2-9/igt@i915_selftest@live.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14201">i915#14201</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8528 -&gt; IGTPW_13713</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_17164: b3bf929e6bb3fefb6ff8ebdbddbeee61d03bb671 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_13713: 13713<br />
  IGT_8528: 9252073bde221857c96656b6c96749c444aa1890 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============5870025042776724578==--
