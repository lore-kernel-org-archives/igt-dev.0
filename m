Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B90A9C3DA5D
	for <igt-dev@archiver.kernel.org>; Thu, 25 Jul 2024 16:15:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75D8310E22E;
	Thu, 25 Jul 2024 16:15:45 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13FD410E22E;
 Thu, 25 Jul 2024 16:15:44 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0578779793139039467=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_runner=3A_Allow_dynamically_ig?=
 =?utf-8?q?nore_dmesg_errors_or_warnings?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kamil Konieczny" <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 25 Jul 2024 16:15:44 -0000
Message-ID: <172192414407.382190.6476697091982394935@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240725125006.30041-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20240725125006.30041-1-kamil.konieczny@linux.intel.com>
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

--===============0578779793139039467==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: runner: Allow dynamically ignore dmesg errors or warnings
URL   : https://patchwork.freedesktop.org/series/136494/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7937_BAT -> XEIGTPW_11459_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_11459_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_11459_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (7 -> 7)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_11459_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-dg2-oem2:       [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7937/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11459/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html
    - bat-lnl-1:          [PASS][3] -> [DMESG-WARN][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7937/bat-lnl-1/igt@core_hotunplug@unbind-rebind.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11459/bat-lnl-1/igt@core_hotunplug@unbind-rebind.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24:
    - bat-adlp-7:         [PASS][5] -> [INCOMPLETE][6] +4 other tests incomplete
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7937/bat-adlp-7/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11459/bat-adlp-7/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1:
    - bat-adlp-7:         [PASS][7] -> [DMESG-WARN][8] +2 other tests dmesg-warn
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7937/bat-adlp-7/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11459/bat-adlp-7/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1.html

  * igt@xe_wedged@basic-wedged:
    - bat-atsm-2:         NOTRUN -> [DMESG-WARN][9]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11459/bat-atsm-2/igt@xe_wedged@basic-wedged.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@core_hotunplug@unbind-rebind:
    - {bat-bmg-1}:        [PASS][10] -> [DMESG-WARN][11]
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7937/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11459/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_11459_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_pipe_crc_basic@hang-read-crc:
    - bat-adlp-7:         [PASS][12] -> [INCOMPLETE][13] ([Intel XE#1150])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7937/bat-adlp-7/igt@kms_pipe_crc_basic@hang-read-crc.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11459/bat-adlp-7/igt@kms_pipe_crc_basic@hang-read-crc.html

  * igt@xe_live_ktest@xe_migrate:
    - bat-pvc-2:          [PASS][14] -> [SKIP][15] ([Intel XE#2109]) +2 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7937/bat-pvc-2/igt@xe_live_ktest@xe_migrate.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11459/bat-pvc-2/igt@xe_live_ktest@xe_migrate.html
    - bat-dg2-oem2:       [PASS][16] -> [SKIP][17] ([Intel XE#1192]) +2 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7937/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11459/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html
    - bat-atsm-2:         [PASS][18] -> [SKIP][19] ([Intel XE#2109]) +2 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7937/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11459/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html
    - bat-lnl-1:          [PASS][20] -> [SKIP][21] ([Intel XE#1192]) +2 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7937/bat-lnl-1/igt@xe_live_ktest@xe_migrate.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11459/bat-lnl-1/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_wedged@basic-wedged:
    - bat-pvc-2:          NOTRUN -> [DMESG-WARN][22] ([Intel XE#1705] / [Intel XE#1958])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11459/bat-pvc-2/igt@xe_wedged@basic-wedged.html
    - bat-dg2-oem2:       NOTRUN -> [DMESG-WARN][23] ([Intel XE#1760])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11459/bat-dg2-oem2/igt@xe_wedged@basic-wedged.html
    - bat-lnl-1:          NOTRUN -> [DMESG-WARN][24] ([Intel XE#1760])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11459/bat-lnl-1/igt@xe_wedged@basic-wedged.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - bat-adlp-7:         NOTRUN -> [DMESG-WARN][25] ([Intel XE#1760]) +1 other test dmesg-warn
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11459/bat-adlp-7/igt@xe_wedged@wedged-at-any-timeout.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1150]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1150
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1705
  [Intel XE#1760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
  [Intel XE#1958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1958
  [Intel XE#2109]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2109


Build changes
-------------

  * IGT: IGT_7937 -> IGTPW_11459
  * Linux: xe-1664-724a2a53988a57709d7f9dcd5c58dd5737d45cb2 -> xe-1667-9f8e597a1c39d7e316f9479e6f627c15dbc58e1d

  IGTPW_11459: f9331e291b9b8abbc09de451a17fcd8b121ba864 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7937: eba69333dfe8c295d053997367e395d7bde2b4b4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1664-724a2a53988a57709d7f9dcd5c58dd5737d45cb2: 724a2a53988a57709d7f9dcd5c58dd5737d45cb2
  xe-1667-9f8e597a1c39d7e316f9479e6f627c15dbc58e1d: 9f8e597a1c39d7e316f9479e6f627c15dbc58e1d

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11459/index.html

--===============0578779793139039467==
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
<tr><td><b>Series:</b></td><td>runner: Allow dynamically ignore dmesg errors or warnings</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/136494/">https://patchwork.freedesktop.org/series/136494/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11459/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11459/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7937_BAT -&gt; XEIGTPW_11459_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_11459_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_11459_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_11459_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7937/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11459/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a></li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7937/bat-lnl-1/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11459/bat-lnl-1/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7937/bat-adlp-7/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11459/bat-adlp-7/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html">INCOMPLETE</a> +4 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7937/bat-adlp-7/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11459/bat-adlp-7/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1.html">DMESG-WARN</a> +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11459/bat-atsm-2/igt@xe_wedged@basic-wedged.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@core_hotunplug@unbind-rebind:<ul>
<li>{bat-bmg-1}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7937/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11459/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11459_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7937/bat-adlp-7/igt@kms_pipe_crc_basic@hang-read-crc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11459/bat-adlp-7/igt@kms_pipe_crc_basic@hang-read-crc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1150">Intel XE#1150</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7937/bat-pvc-2/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11459/bat-pvc-2/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2109">Intel XE#2109</a>) +2 other tests skip</li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7937/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11459/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +2 other tests skip</li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7937/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11459/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2109">Intel XE#2109</a>) +2 other tests skip</li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7937/bat-lnl-1/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11459/bat-lnl-1/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11459/bat-pvc-2/igt@xe_wedged@basic-wedged.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1705">Intel XE#1705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1958">Intel XE#1958</a>)</li>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11459/bat-dg2-oem2/igt@xe_wedged@basic-wedged.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760">Intel XE#1760</a>)</li>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11459/bat-lnl-1/igt@xe_wedged@basic-wedged.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760">Intel XE#1760</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11459/bat-adlp-7/igt@xe_wedged@wedged-at-any-timeout.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760">Intel XE#1760</a>) +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7937 -&gt; IGTPW_11459</li>
<li>Linux: xe-1664-724a2a53988a57709d7f9dcd5c58dd5737d45cb2 -&gt; xe-1667-9f8e597a1c39d7e316f9479e6f627c15dbc58e1d</li>
</ul>
<p>IGTPW_11459: f9331e291b9b8abbc09de451a17fcd8b121ba864 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7937: eba69333dfe8c295d053997367e395d7bde2b4b4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1664-724a2a53988a57709d7f9dcd5c58dd5737d45cb2: 724a2a53988a57709d7f9dcd5c58dd5737d45cb2<br />
  xe-1667-9f8e597a1c39d7e316f9479e6f627c15dbc58e1d: 9f8e597a1c39d7e316f9479e6f627c15dbc58e1d</p>

</body>
</html>

--===============0578779793139039467==--
