Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99B91C47258
	for <igt-dev@archiver.kernel.org>; Wed, 31 Jan 2024 21:00:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE36410FD19;
	Wed, 31 Jan 2024 21:00:41 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDCE910FCFF;
 Wed, 31 Jan 2024 21:00:39 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0711514123267780638=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_tests/amdgpu/amd=5Filr=3A_Fix_?=
 =?utf-8?q?psr_eDP_crc_read_timeout?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Hersen Wu" <hersenxs.wu@amd.com>
Date: Wed, 31 Jan 2024 21:00:39 -0000
Message-ID: <170673483997.878358.17389214968023131759@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240131194342.182455-1-hersenxs.wu@amd.com>
In-Reply-To: <20240131194342.182455-1-hersenxs.wu@amd.com>
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
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

--===============0711514123267780638==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/amdgpu/amd_ilr: Fix psr eDP crc read timeout
URL   : https://patchwork.freedesktop.org/series/129382/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7699_BAT -> XEIGTPW_10614_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_10614_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@invalid-set-prop:
    - bat-adlp-7:         [PASS][1] -> [SKIP][2] ([i915#6077]) +30 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-adlp-7/igt@kms_addfb_basic@invalid-set-prop.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10614/bat-adlp-7/igt@kms_addfb_basic@invalid-set-prop.html

  * igt@kms_flip@basic-flip-vs-dpms:
    - bat-adlp-7:         [PASS][3] -> [SKIP][4] ([Intel XE#1219]) +9 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10614/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms.html

  * igt@kms_force_connector_basic@force-connector-state:
    - bat-adlp-7:         [PASS][5] -> [SKIP][6] ([Intel XE#540]) +3 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-adlp-7/igt@kms_force_connector_basic@force-connector-state.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10614/bat-adlp-7/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
    - bat-adlp-7:         [PASS][7] -> [SKIP][8] ([Intel XE#829]) +6 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-adlp-7/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10614/bat-adlp-7/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html

  * igt@kms_prop_blob@basic:
    - bat-adlp-7:         [PASS][9] -> [SKIP][10] ([Intel XE#780])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-adlp-7/igt@kms_prop_blob@basic.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10614/bat-adlp-7/igt@kms_prop_blob@basic.html

  
#### Possible fixes ####

  * igt@xe_module_load@load:
    - bat-pvc-2:          [SKIP][11] ([Intel XE#378]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-pvc-2/igt@xe_module_load@load.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10614/bat-pvc-2/igt@xe_module_load@load.html

  
#### Warnings ####

  * igt@kms_dsc@dsc-basic:
    - bat-adlp-7:         [SKIP][13] ([Intel XE#455]) -> [SKIP][14] ([Intel XE#1219])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-adlp-7/igt@kms_dsc@dsc-basic.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10614/bat-adlp-7/igt@kms_dsc@dsc-basic.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [DMESG-FAIL][15] ([Intel XE#1033]) -> [SKIP][16] ([Intel XE#783])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10614/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1219]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1219
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/540
  [Intel XE#780]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/780
  [Intel XE#783]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/783
  [Intel XE#829]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/829
  [i915#6077]: https://gitlab.freedesktop.org/drm/intel/issues/6077


Build changes
-------------

  * IGT: IGT_7699 -> IGTPW_10614
  * Linux: xe-699-c655e0fd28045dbaa581d04bf7cc266eec1c3457 -> xe-711-8327dc2a5a26f82a8700035c6259f57e9299d6a2

  IGTPW_10614: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10614/index.html
  IGT_7699: 7699
  xe-699-c655e0fd28045dbaa581d04bf7cc266eec1c3457: c655e0fd28045dbaa581d04bf7cc266eec1c3457
  xe-711-8327dc2a5a26f82a8700035c6259f57e9299d6a2: 8327dc2a5a26f82a8700035c6259f57e9299d6a2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10614/index.html

--===============0711514123267780638==
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
<tr><td><b>Series:</b></td><td>tests/amdgpu/amd_ilr: Fix psr eDP crc read timeout</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/129382/">https://patchwork.freedesktop.org/series/129382/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10614/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10614/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7699_BAT -&gt; XEIGTPW_10614_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_10614_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@invalid-set-prop:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-adlp-7/igt@kms_addfb_basic@invalid-set-prop.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10614/bat-adlp-7/igt@kms_addfb_basic@invalid-set-prop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6077">i915#6077</a>) +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10614/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1219">Intel XE#1219</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-adlp-7/igt@kms_force_connector_basic@force-connector-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10614/bat-adlp-7/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/540">Intel XE#540</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-adlp-7/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10614/bat-adlp-7/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_prop_blob@basic:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-adlp-7/igt@kms_prop_blob@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10614/bat-adlp-7/igt@kms_prop_blob@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/780">Intel XE#780</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_module_load@load:<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-pvc-2/igt@xe_module_load@load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10614/bat-pvc-2/igt@xe_module_load@load.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-adlp-7/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10614/bat-adlp-7/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1219">Intel XE#1219</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7699/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10614/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/783">Intel XE#783</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7699 -&gt; IGTPW_10614</li>
<li>Linux: xe-699-c655e0fd28045dbaa581d04bf7cc266eec1c3457 -&gt; xe-711-8327dc2a5a26f82a8700035c6259f57e9299d6a2</li>
</ul>
<p>IGTPW_10614: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10614/index.html<br />
  IGT_7699: 7699<br />
  xe-699-c655e0fd28045dbaa581d04bf7cc266eec1c3457: c655e0fd28045dbaa581d04bf7cc266eec1c3457<br />
  xe-711-8327dc2a5a26f82a8700035c6259f57e9299d6a2: 8327dc2a5a26f82a8700035c6259f57e9299d6a2</p>

</body>
</html>

--===============0711514123267780638==--
