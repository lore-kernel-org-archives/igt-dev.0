Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D23CEC48BF6
	for <igt-dev@archiver.kernel.org>; Mon, 26 Feb 2024 09:36:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FC0610E40E;
	Mon, 26 Feb 2024 09:36:26 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B64510E40E;
 Mon, 26 Feb 2024 09:36:25 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2845031417978548672=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_tests/kms=5Fvrr=3A_Modify_kms?=
 =?utf-8?q?=5Fvrr_to_allow_flicker_profiling_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 26 Feb 2024 09:36:25 -0000
Message-ID: <170894018517.299440.5699314000618135527@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240226072035.2620383-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20240226072035.2620383-1-bhanuprakash.modem@intel.com>
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

--===============2845031417978548672==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_vrr: Modify kms_vrr to allow flicker profiling (rev7)
URL   : https://patchwork.freedesktop.org/series/125479/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7729_BAT -> XEIGTPW_10732_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

New tests
---------

  New tests have been introduced between XEIGT_7729_BAT and XEIGTPW_10732_BAT:

### New IGT tests (2) ###

  * igt@kms_vrr@max-min:
    - Statuses : 1 pass(s) 3 skip(s)
    - Exec time: [0.0, 5.50] s

  * igt@kms_vrr@max-min@pipe-a-dp-3:
    - Statuses : 1 pass(s)
    - Exec time: [5.39] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_10732_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_vrr@flip-basic-fastset:
    - bat-pvc-2:          NOTRUN -> [SKIP][1] ([Intel XE#1024]) +6 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10732/bat-pvc-2/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@negative-basic:
    - bat-atsm-2:         NOTRUN -> [SKIP][2] ([Intel XE#1024]) +6 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10732/bat-atsm-2/igt@kms_vrr@negative-basic.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - bat-adlp-7:         NOTRUN -> [SKIP][3] ([Intel XE#455]) +5 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10732/bat-adlp-7/igt@kms_vrr@seamless-rr-switch-vrr.html
    - bat-dg2-oem2:       NOTRUN -> [SKIP][4] ([Intel XE#455]) +2 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10732/bat-dg2-oem2/igt@kms_vrr@seamless-rr-switch-vrr.html

  
#### Possible fixes ####

  * {igt@xe_exec_queue_property@invalid-property}:
    - bat-pvc-2:          [FAIL][5] ([Intel XE#1276]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7729/bat-pvc-2/igt@xe_exec_queue_property@invalid-property.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10732/bat-pvc-2/igt@xe_exec_queue_property@invalid-property.html
    - bat-dg2-oem2:       [FAIL][7] ([Intel XE#1276]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7729/bat-dg2-oem2/igt@xe_exec_queue_property@invalid-property.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10732/bat-dg2-oem2/igt@xe_exec_queue_property@invalid-property.html
    - bat-atsm-2:         [FAIL][9] ([Intel XE#1276]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7729/bat-atsm-2/igt@xe_exec_queue_property@invalid-property.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10732/bat-atsm-2/igt@xe_exec_queue_property@invalid-property.html
    - bat-adlp-7:         [FAIL][11] ([Intel XE#1276]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7729/bat-adlp-7/igt@xe_exec_queue_property@invalid-property.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10732/bat-adlp-7/igt@xe_exec_queue_property@invalid-property.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1024]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024
  [Intel XE#1276]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1276
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455


Build changes
-------------

  * IGT: IGT_7729 -> IGTPW_10732
  * Linux: xe-835-115d0ed85f58e87d2d7a057426350fec5b217cc9 -> xe-843-784877c5f30ec2000d8c2986b8464144c87f24f4

  IGTPW_10732: 10732
  IGT_7729: 7729
  xe-835-115d0ed85f58e87d2d7a057426350fec5b217cc9: 115d0ed85f58e87d2d7a057426350fec5b217cc9
  xe-843-784877c5f30ec2000d8c2986b8464144c87f24f4: 784877c5f30ec2000d8c2986b8464144c87f24f4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10732/index.html

--===============2845031417978548672==
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
<tr><td><b>Series:</b></td><td>tests/kms_vrr: Modify kms_vrr to allow flicker profiling (rev7)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/125479/">https://patchwork.freedesktop.org/series/125479/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10732/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10732/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7729_BAT -&gt; XEIGTPW_10732_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_7729_BAT and XEIGTPW_10732_BAT:</p>
<h3>New IGT tests (2)</h3>
<ul>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>Statuses : 1 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 5.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min@pipe-a-dp-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.39] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_10732_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10732/bat-pvc-2/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10732/bat-atsm-2/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10732/bat-adlp-7/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +5 other tests skip</li>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10732/bat-dg2-oem2/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +2 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>{igt@xe_exec_queue_property@invalid-property}:<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7729/bat-pvc-2/igt@xe_exec_queue_property@invalid-property.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1276">Intel XE#1276</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10732/bat-pvc-2/igt@xe_exec_queue_property@invalid-property.html">PASS</a></li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7729/bat-dg2-oem2/igt@xe_exec_queue_property@invalid-property.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1276">Intel XE#1276</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10732/bat-dg2-oem2/igt@xe_exec_queue_property@invalid-property.html">PASS</a></li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7729/bat-atsm-2/igt@xe_exec_queue_property@invalid-property.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1276">Intel XE#1276</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10732/bat-atsm-2/igt@xe_exec_queue_property@invalid-property.html">PASS</a></li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7729/bat-adlp-7/igt@xe_exec_queue_property@invalid-property.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1276">Intel XE#1276</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10732/bat-adlp-7/igt@xe_exec_queue_property@invalid-property.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7729 -&gt; IGTPW_10732</li>
<li>Linux: xe-835-115d0ed85f58e87d2d7a057426350fec5b217cc9 -&gt; xe-843-784877c5f30ec2000d8c2986b8464144c87f24f4</li>
</ul>
<p>IGTPW_10732: 10732<br />
  IGT_7729: 7729<br />
  xe-835-115d0ed85f58e87d2d7a057426350fec5b217cc9: 115d0ed85f58e87d2d7a057426350fec5b217cc9<br />
  xe-843-784877c5f30ec2000d8c2986b8464144c87f24f4: 784877c5f30ec2000d8c2986b8464144c87f24f4</p>

</body>
</html>

--===============2845031417978548672==--
