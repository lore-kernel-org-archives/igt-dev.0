Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF65FFB5EBC
	for <igt-dev@archiver.kernel.org>; Tue, 17 Mar 2026 04:38:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AE2510E594;
	Tue, 17 Mar 2026 04:38:14 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 761B210E0CC;
 Tue, 17 Mar 2026 04:38:10 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8737620883083092976=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_series_starting_with_=5Bi-g?=
 =?utf-8?q?-t=2Cv1=2C1/2=5D_tests/intel/xe=5Fpmu=3A_Check_if_other_processes?=
 =?utf-8?q?_are_using_the_DRM_device?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Purkait, Soham" <soham.purkait@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 17 Mar 2026 04:38:10 -0000
Message-ID: <177372229044.364814.15860336167133056236@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260316092629.1337527-1-soham.purkait@intel.com>
In-Reply-To: <20260316092629.1337527-1-soham.purkait@intel.com>
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

--===============8737620883083092976==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,v1,1/2] tests/intel/xe_pmu: Check if other processes are using the DRM device
URL   : https://patchwork.freedesktop.org/series/163270/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8806_BAT -> XEIGTPW_14775_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (14 -> 14)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_14775_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-bmg-2:          [PASS][1] -> [ABORT][2] ([Intel XE#7249])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8806/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14775/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html

  * igt@xe_pmu@engine-activity-accuracy-2:
    - bat-adlp-vm:        NOTRUN -> [SKIP][3] ([Intel XE#455] / [Intel XE#6007]) +5 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14775/bat-adlp-vm/igt@xe_pmu@engine-activity-accuracy-2.html

  * igt@xe_pmu@engine-activity-accuracy-50:
    - bat-ptl-vm:         NOTRUN -> [SKIP][4] ([Intel XE#6007] / [Intel XE#6052]) +5 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14775/bat-ptl-vm/igt@xe_pmu@engine-activity-accuracy-50.html

  * igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_copy0:
    - bat-ptl-vm:         NOTRUN -> [SKIP][5] ([Intel XE#6007]) +11 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14775/bat-ptl-vm/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_copy0.html

  * igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_render0:
    - bat-adlp-vm:        NOTRUN -> [SKIP][6] ([Intel XE#6007]) +11 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14775/bat-adlp-vm/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_render0.html

  * igt@xe_waitfence@engine:
    - bat-dg2-oem2:       [PASS][7] -> [FAIL][8] ([Intel XE#6519])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8806/bat-dg2-oem2/igt@xe_waitfence@engine.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14775/bat-dg2-oem2/igt@xe_waitfence@engine.html

  
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#6007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6007
  [Intel XE#6052]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6052
  [Intel XE#6519]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519
  [Intel XE#7249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7249


Build changes
-------------

  * IGT: IGT_8806 -> IGTPW_14775
  * Linux: xe-4731-a25d8c583e1e52bde77d371081a7c3fcd0a2e820 -> xe-4732-72df5434544ebbfc63b3649354fb0276b9b4db6a

  IGTPW_14775: 14775
  IGT_8806: 8806
  xe-4731-a25d8c583e1e52bde77d371081a7c3fcd0a2e820: a25d8c583e1e52bde77d371081a7c3fcd0a2e820
  xe-4732-72df5434544ebbfc63b3649354fb0276b9b4db6a: 72df5434544ebbfc63b3649354fb0276b9b4db6a

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14775/index.html

--===============8737620883083092976==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,v1,1/2] tests/intel/xe_pmu: Check if other processes are using the DRM device</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/163270/">https://patchwork.freedesktop.org/series/163270/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14775/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14775/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8806_BAT -&gt; XEIGTPW_14775_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (14 -&gt; 14)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14775_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8806/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14775/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7249">Intel XE#7249</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-accuracy-2:</p>
<ul>
<li>bat-adlp-vm:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14775/bat-adlp-vm/igt@xe_pmu@engine-activity-accuracy-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6007">Intel XE#6007</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-accuracy-50:</p>
<ul>
<li>bat-ptl-vm:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14775/bat-ptl-vm/igt@xe_pmu@engine-activity-accuracy-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6007">Intel XE#6007</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6052">Intel XE#6052</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_copy0:</p>
<ul>
<li>bat-ptl-vm:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14775/bat-ptl-vm/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_copy0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6007">Intel XE#6007</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_render0:</p>
<ul>
<li>bat-adlp-vm:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14775/bat-adlp-vm/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_render0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6007">Intel XE#6007</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@engine:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8806/bat-dg2-oem2/igt@xe_waitfence@engine.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14775/bat-dg2-oem2/igt@xe_waitfence@engine.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519">Intel XE#6519</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8806 -&gt; IGTPW_14775</li>
<li>Linux: xe-4731-a25d8c583e1e52bde77d371081a7c3fcd0a2e820 -&gt; xe-4732-72df5434544ebbfc63b3649354fb0276b9b4db6a</li>
</ul>
<p>IGTPW_14775: 14775<br />
  IGT_8806: 8806<br />
  xe-4731-a25d8c583e1e52bde77d371081a7c3fcd0a2e820: a25d8c583e1e52bde77d371081a7c3fcd0a2e820<br />
  xe-4732-72df5434544ebbfc63b3649354fb0276b9b4db6a: 72df5434544ebbfc63b3649354fb0276b9b4db6a</p>

</body>
</html>

--===============8737620883083092976==--
