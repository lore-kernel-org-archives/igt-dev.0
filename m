Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFD8ED64098
	for <igt-dev@archiver.kernel.org>; Fri,  8 Nov 2024 22:11:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9416E10E137;
	Fri,  8 Nov 2024 22:11:39 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B9D310E137;
 Fri,  8 Nov 2024 22:11:38 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3500274488814920814=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_Ignore_more_warns_in_xe=5Fwedg?=
 =?utf-8?q?ed_tests_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kamil Konieczny" <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 08 Nov 2024 22:11:38 -0000
Message-ID: <173110389850.1446338.2638567048463638976@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241108201839.119079-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20241108201839.119079-1-kamil.konieczny@linux.intel.com>
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

--===============3500274488814920814==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Ignore more warns in xe_wedged tests (rev3)
URL   : https://patchwork.freedesktop.org/series/140511/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8101_BAT -> XEIGTPW_12072_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_12072_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_12072_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_12072_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-lnl-1:          [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8101/bat-lnl-1/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12072/bat-lnl-1/igt@core_hotunplug@unbind-rebind.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24:
    - bat-adlp-7:         [PASS][3] -> [INCOMPLETE][4] +5 other tests incomplete
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8101/bat-adlp-7/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12072/bat-adlp-7/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1:
    - bat-adlp-7:         [PASS][5] -> [DMESG-WARN][6] +1 other test dmesg-warn
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8101/bat-adlp-7/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12072/bat-adlp-7/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - bat-adlp-vf:        NOTRUN -> [ABORT][7]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12072/bat-adlp-vf/igt@xe_wedged@wedged-at-any-timeout.html
    - bat-pvc-2:          NOTRUN -> [ABORT][8]
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12072/bat-pvc-2/igt@xe_wedged@wedged-at-any-timeout.html
    - bat-bmg-2:          NOTRUN -> [ABORT][9]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12072/bat-bmg-2/igt@xe_wedged@wedged-at-any-timeout.html
    - bat-bmg-1:          NOTRUN -> [ABORT][10]
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12072/bat-bmg-1/igt@xe_wedged@wedged-at-any-timeout.html
    - bat-dg2-oem2:       NOTRUN -> [ABORT][11]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12072/bat-dg2-oem2/igt@xe_wedged@wedged-at-any-timeout.html
    - bat-atsm-2:         NOTRUN -> [ABORT][12]
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12072/bat-atsm-2/igt@xe_wedged@wedged-at-any-timeout.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_12072_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - bat-lnl-1:          [PASS][13] -> [FAIL][14] ([Intel XE#886]) +1 other test fail
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8101/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12072/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@xe_live_ktest@xe_bo:
    - bat-lnl-1:          [PASS][15] -> [SKIP][16] ([Intel XE#1192]) +2 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8101/bat-lnl-1/igt@xe_live_ktest@xe_bo.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12072/bat-lnl-1/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_migrate:
    - bat-lnl-2:          [PASS][17] -> [SKIP][18] ([Intel XE#1192]) +2 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8101/bat-lnl-2/igt@xe_live_ktest@xe_migrate.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12072/bat-lnl-2/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_wedged@basic-wedged:
    - bat-adlp-vf:        NOTRUN -> [DMESG-WARN][19] ([Intel XE#2919])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12072/bat-adlp-vf/igt@xe_wedged@basic-wedged.html
    - bat-lnl-1:          NOTRUN -> [DMESG-WARN][20] ([Intel XE#2919] / [Intel XE#3119])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12072/bat-lnl-1/igt@xe_wedged@basic-wedged.html
    - bat-bmg-2:          NOTRUN -> [DMESG-WARN][21] ([Intel XE#2919])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12072/bat-bmg-2/igt@xe_wedged@basic-wedged.html
    - bat-bmg-1:          NOTRUN -> [DMESG-WARN][22] ([Intel XE#2919])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12072/bat-bmg-1/igt@xe_wedged@basic-wedged.html
    - bat-adlp-7:         NOTRUN -> [DMESG-WARN][23] ([Intel XE#2919])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12072/bat-adlp-7/igt@xe_wedged@basic-wedged.html
    - bat-dg2-oem2:       NOTRUN -> [DMESG-WARN][24] ([Intel XE#2919])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12072/bat-dg2-oem2/igt@xe_wedged@basic-wedged.html

  
#### Possible fixes ####

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [FAIL][25] ([Intel XE#1861]) -> [PASS][26]
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8101/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12072/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#2919]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919
  [Intel XE#3119]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3119
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886


Build changes
-------------

  * IGT: IGT_8101 -> IGTPW_12072
  * Linux: xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25 -> xe-2193-5d94c05a3b9625a569b92a4ed208ce04e241f122

  IGTPW_12072: ba67f6a70cd24baa8b58795c7bd22bd2b8028525 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8101: 1235576931b5abdcb2c755672d194fb540fa6fb1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25: 5521311ecd7ffbb0adf016dbf83bd0165fc94d25
  xe-2193-5d94c05a3b9625a569b92a4ed208ce04e241f122: 5d94c05a3b9625a569b92a4ed208ce04e241f122

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12072/index.html

--===============3500274488814920814==
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
<tr><td><b>Series:</b></td><td>Ignore more warns in xe_wedged tests (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/140511/">https://patchwork.freedesktop.org/series/140511/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12072/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12072/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8101_BAT -&gt; XEIGTPW_12072_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_12072_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_12072_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_12072_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8101/bat-lnl-1/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12072/bat-lnl-1/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8101/bat-adlp-7/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12072/bat-adlp-7/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html">INCOMPLETE</a> +5 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8101/bat-adlp-7/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12072/bat-adlp-7/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12072/bat-adlp-vf/igt@xe_wedged@wedged-at-any-timeout.html">ABORT</a></li>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12072/bat-pvc-2/igt@xe_wedged@wedged-at-any-timeout.html">ABORT</a></li>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12072/bat-bmg-2/igt@xe_wedged@wedged-at-any-timeout.html">ABORT</a></li>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12072/bat-bmg-1/igt@xe_wedged@wedged-at-any-timeout.html">ABORT</a></li>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12072/bat-dg2-oem2/igt@xe_wedged@wedged-at-any-timeout.html">ABORT</a></li>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12072/bat-atsm-2/igt@xe_wedged@wedged-at-any-timeout.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12072_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8101/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12072/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8101/bat-lnl-1/igt@xe_live_ktest@xe_bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12072/bat-lnl-1/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8101/bat-lnl-2/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12072/bat-lnl-2/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged:</p>
<ul>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12072/bat-adlp-vf/igt@xe_wedged@basic-wedged.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919">Intel XE#2919</a>)</li>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12072/bat-lnl-1/igt@xe_wedged@basic-wedged.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919">Intel XE#2919</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3119">Intel XE#3119</a>)</li>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12072/bat-bmg-2/igt@xe_wedged@basic-wedged.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919">Intel XE#2919</a>)</li>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12072/bat-bmg-1/igt@xe_wedged@basic-wedged.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919">Intel XE#2919</a>)</li>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12072/bat-adlp-7/igt@xe_wedged@basic-wedged.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919">Intel XE#2919</a>)</li>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12072/bat-dg2-oem2/igt@xe_wedged@basic-wedged.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919">Intel XE#2919</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_frontbuffer_tracking@basic:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8101/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12072/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8101 -&gt; IGTPW_12072</li>
<li>Linux: xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25 -&gt; xe-2193-5d94c05a3b9625a569b92a4ed208ce04e241f122</li>
</ul>
<p>IGTPW_12072: ba67f6a70cd24baa8b58795c7bd22bd2b8028525 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8101: 1235576931b5abdcb2c755672d194fb540fa6fb1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2190-5521311ecd7ffbb0adf016dbf83bd0165fc94d25: 5521311ecd7ffbb0adf016dbf83bd0165fc94d25<br />
  xe-2193-5d94c05a3b9625a569b92a4ed208ce04e241f122: 5d94c05a3b9625a569b92a4ed208ce04e241f122</p>

</body>
</html>

--===============3500274488814920814==--
