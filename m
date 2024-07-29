Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9732CC3DA4A
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jul 2024 14:39:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 503C310E3FE;
	Mon, 29 Jul 2024 14:39:08 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DF5810E3FE;
 Mon, 29 Jul 2024 14:39:06 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4676629977048432295=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_tests/intel/xe=5Fsysfs=5Fpreem?=
 =?utf-8?q?pt=5Ftimeout=3A_Porting_sysfs_preempt_test_in_xe_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: nakshtra.goyal@intel.com
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 29 Jul 2024 14:39:06 -0000
Message-ID: <172226394657.424799.6488749931949870905@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240729125847.3620366-1-nakshtra.goyal@intel.com>
In-Reply-To: <20240729125847.3620366-1-nakshtra.goyal@intel.com>
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

--===============4676629977048432295==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_sysfs_preempt_timeout: Porting sysfs preempt test in xe (rev2)
URL   : https://patchwork.freedesktop.org/series/136449/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7940_BAT -> XEIGTPW_11485_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (7 -> 7)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_11485_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-bmg-1:          [PASS][1] -> [ABORT][2] ([Intel XE#2418])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7940/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11485/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html
    - bat-adlp-7:         [PASS][3] -> [ABORT][4] ([Intel XE#2418])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7940/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11485/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html
    - bat-lnl-1:          [PASS][5] -> [ABORT][6] ([Intel XE#2418])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7940/bat-lnl-1/igt@core_hotunplug@unbind-rebind.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11485/bat-lnl-1/igt@core_hotunplug@unbind-rebind.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [PASS][7] -> [DMESG-FAIL][8] ([Intel XE#324])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7940/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11485/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  * igt@runner@aborted:
    - bat-pvc-2:          NOTRUN -> [FAIL][9] ([Intel XE#2103])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11485/bat-pvc-2/igt@runner@aborted.html
    - bat-dg2-oem2:       NOTRUN -> [FAIL][10] ([Intel XE#2103])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11485/bat-dg2-oem2/igt@runner@aborted.html
    - bat-atsm-2:         NOTRUN -> [FAIL][11] ([Intel XE#2103])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11485/bat-atsm-2/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#2103]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2103
  [Intel XE#2418]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2418
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324


Build changes
-------------

  * IGT: IGT_7940 -> IGTPW_11485
  * Linux: xe-1672-220554a8ef7ac26fbfc4f141816679d742a0d232 -> xe-1682-ec9c8ca911f54dec90f736f284b7128668deeb0d

  IGTPW_11485: 9caebc564bb0ac76a0c60af12ff24c8094b51f0e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7940: 2a73158fa69a2b8e20d5a0bdf773ee194bfe13c2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1672-220554a8ef7ac26fbfc4f141816679d742a0d232: 220554a8ef7ac26fbfc4f141816679d742a0d232
  xe-1682-ec9c8ca911f54dec90f736f284b7128668deeb0d: ec9c8ca911f54dec90f736f284b7128668deeb0d

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11485/index.html

--===============4676629977048432295==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_sysfs_preempt_timeout: Porting sysfs preempt test in xe (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/136449/">https://patchwork.freedesktop.org/series/136449/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11485/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11485/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7940_BAT -&gt; XEIGTPW_11485_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11485_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7940/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11485/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2418">Intel XE#2418</a>)</li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7940/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11485/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2418">Intel XE#2418</a>)</li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7940/bat-lnl-1/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11485/bat-lnl-1/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2418">Intel XE#2418</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7940/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11485/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11485/bat-pvc-2/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2103">Intel XE#2103</a>)</li>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11485/bat-dg2-oem2/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2103">Intel XE#2103</a>)</li>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11485/bat-atsm-2/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2103">Intel XE#2103</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7940 -&gt; IGTPW_11485</li>
<li>Linux: xe-1672-220554a8ef7ac26fbfc4f141816679d742a0d232 -&gt; xe-1682-ec9c8ca911f54dec90f736f284b7128668deeb0d</li>
</ul>
<p>IGTPW_11485: 9caebc564bb0ac76a0c60af12ff24c8094b51f0e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7940: 2a73158fa69a2b8e20d5a0bdf773ee194bfe13c2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1672-220554a8ef7ac26fbfc4f141816679d742a0d232: 220554a8ef7ac26fbfc4f141816679d742a0d232<br />
  xe-1682-ec9c8ca911f54dec90f736f284b7128668deeb0d: ec9c8ca911f54dec90f736f284b7128668deeb0d</p>

</body>
</html>

--===============4676629977048432295==--
