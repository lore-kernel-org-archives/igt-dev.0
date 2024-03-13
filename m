Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0CD7C54791
	for <igt-dev@archiver.kernel.org>; Wed, 13 Mar 2024 05:27:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EB1C10F60B;
	Wed, 13 Mar 2024 05:27:03 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C2C010F60A;
 Wed, 13 Mar 2024 05:27:02 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1639476152303726910=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_tests/intel/xe=5Fevict=3A_Skip?=
 =?utf-8?q?_test_if_smem_less_than_lmem_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: priyanka.dandamudi@intel.com
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 13 Mar 2024 05:27:02 -0000
Message-ID: <171030762230.715418.3515379159348359981@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240313043221.2240088-1-priyanka.dandamudi@intel.com>
In-Reply-To: <20240313043221.2240088-1-priyanka.dandamudi@intel.com>
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

--===============1639476152303726910==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_evict: Skip test if smem less than lmem (rev2)
URL   : https://patchwork.freedesktop.org/series/131007/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7757_BAT -> XEIGTPW_10819_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (3 -> 4)
------------------------------

  Additional (1): bat-adlp-7 

Known issues
------------

  Here are the changes found in XEIGTPW_10819_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_dsc@dsc-basic:
    - bat-adlp-7:         NOTRUN -> [SKIP][1] ([Intel XE#455])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10819/bat-adlp-7/igt@kms_dsc@dsc-basic.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         NOTRUN -> [FAIL][2] ([Intel XE#616])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10819/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_hdmi_inject@inject-audio:
    - bat-adlp-7:         NOTRUN -> [SKIP][3] ([Intel XE#417])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10819/bat-adlp-7/igt@kms_hdmi_inject@inject-audio.html

  * igt@xe_evict@evict-small-cm:
    - bat-adlp-7:         NOTRUN -> [SKIP][4] ([Intel XE#261] / [Intel XE#688]) +15 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10819/bat-adlp-7/igt@xe_evict@evict-small-cm.html

  * igt@xe_evict_ccs@evict-overcommit-simple:
    - bat-adlp-7:         NOTRUN -> [SKIP][5] ([Intel XE#688]) +1 other test skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10819/bat-adlp-7/igt@xe_evict_ccs@evict-overcommit-simple.html

  * igt@xe_exec_balancer@twice-cm-virtual-basic:
    - bat-dg2-oem2:       [PASS][6] -> [ABORT][7] ([Intel XE#1304])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7757/bat-dg2-oem2/igt@xe_exec_balancer@twice-cm-virtual-basic.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10819/bat-dg2-oem2/igt@xe_exec_balancer@twice-cm-virtual-basic.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:
    - bat-adlp-7:         NOTRUN -> [SKIP][8] ([Intel XE#288]) +22 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10819/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html

  * igt@xe_mmap@vram:
    - bat-adlp-7:         NOTRUN -> [SKIP][9] ([Intel XE#1008])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10819/bat-adlp-7/igt@xe_mmap@vram.html

  * igt@xe_pat@pat-index-xe2:
    - bat-adlp-7:         NOTRUN -> [SKIP][10] ([Intel XE#977])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10819/bat-adlp-7/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xehpc:
    - bat-adlp-7:         NOTRUN -> [SKIP][11] ([Intel XE#979]) +1 other test skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10819/bat-adlp-7/igt@xe_pat@pat-index-xehpc.html

  
  [Intel XE#1008]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008
  [Intel XE#1304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1304
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/417
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979


Build changes
-------------

  * IGT: IGT_7757 -> IGTPW_10819
  * Linux: xe-931-0b257cd261329938024149c9416346e016ab5f09 -> xe-932-8762453258673794e13e4d59cb9df1042b97ba01

  IGTPW_10819: 10819
  IGT_7757: 7757
  xe-931-0b257cd261329938024149c9416346e016ab5f09: 0b257cd261329938024149c9416346e016ab5f09
  xe-932-8762453258673794e13e4d59cb9df1042b97ba01: 8762453258673794e13e4d59cb9df1042b97ba01

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10819/index.html

--===============1639476152303726910==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_evict: Skip test if smem less than lmem (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/131007/">https://patchwork.freedesktop.org/series/131007/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10819/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10819/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7757_BAT -&gt; XEIGTPW_10819_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (3 -&gt; 4)</h2>
<p>Additional (1): bat-adlp-7 </p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_10819_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10819/bat-adlp-7/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10819/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10819/bat-adlp-7/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/417">Intel XE#417</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-cm:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10819/bat-adlp-7/igt@xe_evict@evict-small-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-simple:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10819/bat-adlp-7/igt@xe_evict_ccs@evict-overcommit-simple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-cm-virtual-basic:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7757/bat-dg2-oem2/igt@xe_exec_balancer@twice-cm-virtual-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10819/bat-dg2-oem2/igt@xe_exec_balancer@twice-cm-virtual-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1304">Intel XE#1304</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10819/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10819/bat-adlp-7/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008">Intel XE#1008</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10819/bat-adlp-7/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10819/bat-adlp-7/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7757 -&gt; IGTPW_10819</li>
<li>Linux: xe-931-0b257cd261329938024149c9416346e016ab5f09 -&gt; xe-932-8762453258673794e13e4d59cb9df1042b97ba01</li>
</ul>
<p>IGTPW_10819: 10819<br />
  IGT_7757: 7757<br />
  xe-931-0b257cd261329938024149c9416346e016ab5f09: 0b257cd261329938024149c9416346e016ab5f09<br />
  xe-932-8762453258673794e13e4d59cb9df1042b97ba01: 8762453258673794e13e4d59cb9df1042b97ba01</p>

</body>
</html>

--===============1639476152303726910==--
