Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDF78D72A1B
	for <igt-dev@archiver.kernel.org>; Fri, 29 Nov 2024 21:21:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E28010E093;
	Fri, 29 Nov 2024 21:21:12 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FA7810E093;
 Fri, 29 Nov 2024 21:21:10 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5854431554257130793=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_Ignore_more_warns_in_xe=5Fw?=
 =?utf-8?q?edged_tests_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kamil Konieczny" <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 29 Nov 2024 21:21:10 -0000
Message-ID: <173291527052.408613.12396958612627047813@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241126181024.1398259-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20241126181024.1398259-1-kamil.konieczny@linux.intel.com>
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

--===============5854431554257130793==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Ignore more warns in xe_wedged tests (rev6)
URL   : https://patchwork.freedesktop.org/series/140511/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8132_BAT -> XEIGTPW_12222_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_12222_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_12222_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_12222_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-lnl-1:          [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/bat-lnl-1/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12222/bat-lnl-1/igt@core_hotunplug@unbind-rebind.html

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1:
    - bat-adlp-7:         [PASS][3] -> [DMESG-WARN][4] +3 other tests dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/bat-adlp-7/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12222/bat-adlp-7/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1.html

  * igt@kms_pipe_crc_basic@read-crc@pipe-a-dp-1:
    - bat-lnl-2:          [PASS][5] -> [DMESG-WARN][6] +37 other tests dmesg-warn
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/bat-lnl-2/igt@kms_pipe_crc_basic@read-crc@pipe-a-dp-1.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12222/bat-lnl-2/igt@kms_pipe_crc_basic@read-crc@pipe-a-dp-1.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - bat-adlp-vf:        NOTRUN -> [ABORT][7]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12222/bat-adlp-vf/igt@xe_wedged@wedged-at-any-timeout.html
    - bat-pvc-2:          NOTRUN -> [ABORT][8]
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12222/bat-pvc-2/igt@xe_wedged@wedged-at-any-timeout.html
    - bat-dg2-oem2:       NOTRUN -> [ABORT][9]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12222/bat-dg2-oem2/igt@xe_wedged@wedged-at-any-timeout.html
    - bat-atsm-2:         NOTRUN -> [ABORT][10]
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12222/bat-atsm-2/igt@xe_wedged@wedged-at-any-timeout.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_12222_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@read:
    - bat-bmg-1:          [PASS][11] -> [DMESG-WARN][12] ([Intel XE#3468])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/bat-bmg-1/igt@fbdev@read.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12222/bat-bmg-1/igt@fbdev@read.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-atomic:
    - bat-lnl-2:          [PASS][13] -> [DMESG-WARN][14] ([Intel XE#2705] / [Intel XE#324]) +1 other test dmesg-warn
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/bat-lnl-2/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12222/bat-lnl-2/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24:
    - bat-adlp-7:         [PASS][15] -> [INCOMPLETE][16] ([Intel XE#1727]) +5 other tests incomplete
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/bat-adlp-7/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12222/bat-adlp-7/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html

  * igt@kms_pipe_crc_basic@hang-read-crc:
    - bat-lnl-2:          [PASS][17] -> [DMESG-FAIL][18] ([Intel XE#324]) +2 other tests dmesg-fail
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/bat-lnl-2/igt@kms_pipe_crc_basic@hang-read-crc.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12222/bat-lnl-2/igt@kms_pipe_crc_basic@hang-read-crc.html

  * igt@kms_pipe_crc_basic@nonblocking-crc:
    - bat-lnl-2:          [PASS][19] -> [DMESG-WARN][20] ([Intel XE#2705])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/bat-lnl-2/igt@kms_pipe_crc_basic@nonblocking-crc.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12222/bat-lnl-2/igt@kms_pipe_crc_basic@nonblocking-crc.html

  * igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_video_enhance-instance-0-tile-1-system-memory:
    - bat-lnl-2:          [PASS][21] -> [DMESG-WARN][22] ([Intel XE#324]) +10 other tests dmesg-warn
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/bat-lnl-2/igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_video_enhance-instance-0-tile-1-system-memory.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12222/bat-lnl-2/igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_video_enhance-instance-0-tile-1-system-memory.html

  * igt@xe_live_ktest@xe_migrate:
    - bat-lnl-2:          [PASS][23] -> [SKIP][24] ([Intel XE#1192]) +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/bat-lnl-2/igt@xe_live_ktest@xe_migrate.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12222/bat-lnl-2/igt@xe_live_ktest@xe_migrate.html
    - bat-lnl-1:          [PASS][25] -> [SKIP][26] ([Intel XE#1192]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/bat-lnl-1/igt@xe_live_ktest@xe_migrate.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12222/bat-lnl-1/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_wedged@basic-wedged:
    - bat-adlp-vf:        NOTRUN -> [DMESG-WARN][27] ([Intel XE#2919])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12222/bat-adlp-vf/igt@xe_wedged@basic-wedged.html
    - bat-lnl-1:          NOTRUN -> [DMESG-WARN][28] ([Intel XE#2919] / [Intel XE#3119])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12222/bat-lnl-1/igt@xe_wedged@basic-wedged.html
    - bat-bmg-2:          NOTRUN -> [DMESG-WARN][29] ([Intel XE#2919])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12222/bat-bmg-2/igt@xe_wedged@basic-wedged.html
    - bat-bmg-1:          NOTRUN -> [DMESG-WARN][30] ([Intel XE#2919])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12222/bat-bmg-1/igt@xe_wedged@basic-wedged.html
    - bat-adlp-7:         NOTRUN -> [DMESG-WARN][31] ([Intel XE#2919])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12222/bat-adlp-7/igt@xe_wedged@basic-wedged.html
    - bat-lnl-2:          NOTRUN -> [DMESG-WARN][32] ([Intel XE#2919] / [Intel XE#3119])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12222/bat-lnl-2/igt@xe_wedged@basic-wedged.html
    - bat-dg2-oem2:       NOTRUN -> [DMESG-WARN][33] ([Intel XE#2919])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12222/bat-dg2-oem2/igt@xe_wedged@basic-wedged.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - bat-bmg-2:          NOTRUN -> [ABORT][34] ([Intel XE#3421])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12222/bat-bmg-2/igt@xe_wedged@wedged-at-any-timeout.html
    - bat-bmg-1:          NOTRUN -> [ABORT][35] ([Intel XE#3421] / [Intel XE#3467])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12222/bat-bmg-1/igt@xe_wedged@wedged-at-any-timeout.html

  
#### Possible fixes ####

  * igt@kms_addfb_basic@bad-pitch-0:
    - bat-adlp-7:         [DMESG-WARN][36] ([Intel XE#3429]) -> [PASS][37] +31 other tests pass
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/bat-adlp-7/igt@kms_addfb_basic@bad-pitch-0.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12222/bat-adlp-7/igt@kms_addfb_basic@bad-pitch-0.html

  
#### Warnings ####

  * igt@xe_live_ktest@xe_bo:
    - bat-lnl-1:          [SKIP][38] ([Intel XE#2229]) -> [SKIP][39] ([Intel XE#1192])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/bat-lnl-1/igt@xe_live_ktest@xe_bo.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12222/bat-lnl-1/igt@xe_live_ktest@xe_bo.html
    - bat-lnl-2:          [SKIP][40] ([Intel XE#2229]) -> [SKIP][41] ([Intel XE#1192])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/bat-lnl-2/igt@xe_live_ktest@xe_bo.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12222/bat-lnl-2/igt@xe_live_ktest@xe_bo.html

  
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2919]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919
  [Intel XE#3119]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3119
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#3421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3421
  [Intel XE#3429]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3429
  [Intel XE#3467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467
  [Intel XE#3468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468


Build changes
-------------

  * IGT: IGT_8132 -> IGTPW_12222

  IGTPW_12222: 12222
  IGT_8132: 7675e070cb74c6808050764367f978f6b74ebc36 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2295-108f610005f88de624c1a8c4f85d5cab9f530ddb: 108f610005f88de624c1a8c4f85d5cab9f530ddb

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12222/index.html

--===============5854431554257130793==
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
<tr><td><b>Series:</b></td><td>Ignore more warns in xe_wedged tests (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/140511/">https://patchwork.freedesktop.org/series/140511/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12222/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12222/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8132_BAT -&gt; XEIGTPW_12222_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_12222_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_12222_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_12222_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/bat-lnl-1/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12222/bat-lnl-1/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/bat-adlp-7/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12222/bat-adlp-7/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1.html">DMESG-WARN</a> +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-a-dp-1:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/bat-lnl-2/igt@kms_pipe_crc_basic@read-crc@pipe-a-dp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12222/bat-lnl-2/igt@kms_pipe_crc_basic@read-crc@pipe-a-dp-1.html">DMESG-WARN</a> +37 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12222/bat-adlp-vf/igt@xe_wedged@wedged-at-any-timeout.html">ABORT</a></li>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12222/bat-pvc-2/igt@xe_wedged@wedged-at-any-timeout.html">ABORT</a></li>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12222/bat-dg2-oem2/igt@xe_wedged@wedged-at-any-timeout.html">ABORT</a></li>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12222/bat-atsm-2/igt@xe_wedged@wedged-at-any-timeout.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12222_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/bat-bmg-1/igt@fbdev@read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12222/bat-bmg-1/igt@fbdev@read.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-atomic:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/bat-lnl-2/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12222/bat-lnl-2/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/bat-adlp-7/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12222/bat-adlp-7/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) +5 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/bat-lnl-2/igt@kms_pipe_crc_basic@hang-read-crc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12222/bat-lnl-2/igt@kms_pipe_crc_basic@hang-read-crc.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +2 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/bat-lnl-2/igt@kms_pipe_crc_basic@nonblocking-crc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12222/bat-lnl-2/igt@kms_pipe_crc_basic@nonblocking-crc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_video_enhance-instance-0-tile-1-system-memory:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/bat-lnl-2/igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_video_enhance-instance-0-tile-1-system-memory.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12222/bat-lnl-2/igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_video_enhance-instance-0-tile-1-system-memory.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +10 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/bat-lnl-2/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12222/bat-lnl-2/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +1 other test skip</li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/bat-lnl-1/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12222/bat-lnl-1/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged:</p>
<ul>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12222/bat-adlp-vf/igt@xe_wedged@basic-wedged.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919">Intel XE#2919</a>)</li>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12222/bat-lnl-1/igt@xe_wedged@basic-wedged.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919">Intel XE#2919</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3119">Intel XE#3119</a>)</li>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12222/bat-bmg-2/igt@xe_wedged@basic-wedged.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919">Intel XE#2919</a>)</li>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12222/bat-bmg-1/igt@xe_wedged@basic-wedged.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919">Intel XE#2919</a>)</li>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12222/bat-adlp-7/igt@xe_wedged@basic-wedged.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919">Intel XE#2919</a>)</li>
<li>bat-lnl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12222/bat-lnl-2/igt@xe_wedged@basic-wedged.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919">Intel XE#2919</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3119">Intel XE#3119</a>)</li>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12222/bat-dg2-oem2/igt@xe_wedged@basic-wedged.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919">Intel XE#2919</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12222/bat-bmg-2/igt@xe_wedged@wedged-at-any-timeout.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3421">Intel XE#3421</a>)</li>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12222/bat-bmg-1/igt@xe_wedged@wedged-at-any-timeout.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3421">Intel XE#3421</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_addfb_basic@bad-pitch-0:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/bat-adlp-7/igt@kms_addfb_basic@bad-pitch-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3429">Intel XE#3429</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12222/bat-adlp-7/igt@kms_addfb_basic@bad-pitch-0.html">PASS</a> +31 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_live_ktest@xe_bo:<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/bat-lnl-1/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12222/bat-lnl-1/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>)</li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/bat-lnl-2/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12222/bat-lnl-2/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8132 -&gt; IGTPW_12222</li>
</ul>
<p>IGTPW_12222: 12222<br />
  IGT_8132: 7675e070cb74c6808050764367f978f6b74ebc36 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2295-108f610005f88de624c1a8c4f85d5cab9f530ddb: 108f610005f88de624c1a8c4f85d5cab9f530ddb</p>

</body>
</html>

--===============5854431554257130793==--
