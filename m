Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D46E1106F2FC
	for <igt-dev@archiver.kernel.org>; Thu, 26 Mar 2026 08:37:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8649010E9EE;
	Thu, 26 Mar 2026 08:37:47 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0466910E95A;
 Thu, 26 Mar 2026 08:37:40 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8651792198855198750=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_intel-ci=3A_Blocklist_BMG_?=
 =?utf-8?q?specific_modifiers_on_NVL/PTL_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sharma, Swati2" <swati2.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 26 Mar 2026 08:37:39 -0000
Message-ID: <177451425999.400391.7517337407393411765@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260325123237.692836-1-swati2.sharma@intel.com>
In-Reply-To: <20260325123237.692836-1-swati2.sharma@intel.com>
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

--===============8651792198855198750==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: intel-ci: Blocklist BMG specific modifiers on NVL/PTL (rev2)
URL   : https://patchwork.freedesktop.org/series/163029/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8829_FULL -> XEIGTPW_14854_FULL
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_14854_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_pm_dc@deep-pkgc:
    - shard-lnl:          [PASS][1] -> [FAIL][2] ([Intel XE#2029] / [Intel XE#7395])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8829/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14854/shard-lnl-7/igt@kms_pm_dc@deep-pkgc.html

  * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma:
    - shard-lnl:          [PASS][3] -> [FAIL][4] ([Intel XE#5625])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8829/shard-lnl-3/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14854/shard-lnl-2/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html

  
#### Possible fixes ####

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [FAIL][5] ([Intel XE#301]) -> [PASS][6] +2 other tests pass
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8829/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14854/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-lnl:          [FAIL][7] ([Intel XE#7340]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8829/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14854/shard-lnl-6/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_setmode@basic@pipe-a-edp-1:
    - shard-lnl:          [FAIL][9] ([Intel XE#6361]) -> [PASS][10] +2 other tests pass
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8829/shard-lnl-3/igt@kms_setmode@basic@pipe-a-edp-1.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14854/shard-lnl-5/igt@kms_setmode@basic@pipe-a-edp-1.html

  
#### Warnings ####

  * igt@xe_module_load@load:
    - shard-bmg:          ([DMESG-WARN][11], [DMESG-WARN][12], [DMESG-WARN][13], [DMESG-WARN][14], [DMESG-WARN][15], [DMESG-WARN][16], [DMESG-WARN][17], [DMESG-WARN][18], [DMESG-WARN][19], [DMESG-WARN][20], [DMESG-WARN][21], [DMESG-WARN][22], [DMESG-WARN][23], [DMESG-WARN][24], [DMESG-WARN][25], [DMESG-WARN][26], [DMESG-WARN][27], [DMESG-WARN][28], [DMESG-WARN][29], [DMESG-WARN][30], [DMESG-WARN][31], [DMESG-WARN][32], [DMESG-WARN][33], [DMESG-WARN][34], [DMESG-WARN][35]) ([Intel XE#7433]) -> ([DMESG-WARN][36], [DMESG-WARN][37], [DMESG-WARN][38], [DMESG-WARN][39], [DMESG-WARN][40], [DMESG-WARN][41], [DMESG-WARN][42], [DMESG-WARN][43], [DMESG-WARN][44], [DMESG-WARN][45], [DMESG-WARN][46], [DMESG-WARN][47], [DMESG-WARN][48], [DMESG-WARN][49], [DMESG-WARN][50], [DMESG-WARN][51], [DMESG-WARN][52], [DMESG-FAIL][53], [DMESG-WARN][54], [DMESG-WARN][55], [DMESG-WARN][56], [DMESG-WARN][57], [DMESG-WARN][58], [DMESG-WARN][59], [DMESG-WARN][60]) ([Intel XE#5545] / [Intel XE#7433])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8829/shard-bmg-1/igt@xe_module_load@load.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8829/shard-bmg-5/igt@xe_module_load@load.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8829/shard-bmg-5/igt@xe_module_load@load.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8829/shard-bmg-5/igt@xe_module_load@load.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8829/shard-bmg-3/igt@xe_module_load@load.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8829/shard-bmg-3/igt@xe_module_load@load.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8829/shard-bmg-3/igt@xe_module_load@load.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8829/shard-bmg-6/igt@xe_module_load@load.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8829/shard-bmg-6/igt@xe_module_load@load.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8829/shard-bmg-8/igt@xe_module_load@load.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8829/shard-bmg-8/igt@xe_module_load@load.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8829/shard-bmg-4/igt@xe_module_load@load.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8829/shard-bmg-4/igt@xe_module_load@load.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8829/shard-bmg-4/igt@xe_module_load@load.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8829/shard-bmg-2/igt@xe_module_load@load.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8829/shard-bmg-2/igt@xe_module_load@load.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8829/shard-bmg-2/igt@xe_module_load@load.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8829/shard-bmg-9/igt@xe_module_load@load.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8829/shard-bmg-9/igt@xe_module_load@load.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8829/shard-bmg-9/igt@xe_module_load@load.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8829/shard-bmg-7/igt@xe_module_load@load.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8829/shard-bmg-10/igt@xe_module_load@load.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8829/shard-bmg-10/igt@xe_module_load@load.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8829/shard-bmg-1/igt@xe_module_load@load.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8829/shard-bmg-7/igt@xe_module_load@load.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14854/shard-bmg-5/igt@xe_module_load@load.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14854/shard-bmg-8/igt@xe_module_load@load.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14854/shard-bmg-8/igt@xe_module_load@load.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14854/shard-bmg-8/igt@xe_module_load@load.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14854/shard-bmg-10/igt@xe_module_load@load.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14854/shard-bmg-10/igt@xe_module_load@load.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14854/shard-bmg-10/igt@xe_module_load@load.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14854/shard-bmg-1/igt@xe_module_load@load.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14854/shard-bmg-1/igt@xe_module_load@load.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14854/shard-bmg-7/igt@xe_module_load@load.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14854/shard-bmg-7/igt@xe_module_load@load.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14854/shard-bmg-9/igt@xe_module_load@load.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14854/shard-bmg-9/igt@xe_module_load@load.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14854/shard-bmg-9/igt@xe_module_load@load.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14854/shard-bmg-2/igt@xe_module_load@load.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14854/shard-bmg-4/igt@xe_module_load@load.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14854/shard-bmg-4/igt@xe_module_load@load.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14854/shard-bmg-2/igt@xe_module_load@load.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14854/shard-bmg-2/igt@xe_module_load@load.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14854/shard-bmg-4/igt@xe_module_load@load.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14854/shard-bmg-3/igt@xe_module_load@load.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14854/shard-bmg-3/igt@xe_module_load@load.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14854/shard-bmg-6/igt@xe_module_load@load.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14854/shard-bmg-6/igt@xe_module_load@load.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14854/shard-bmg-5/igt@xe_module_load@load.html

  
  [Intel XE#2029]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#5625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625
  [Intel XE#6361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6361
  [Intel XE#7340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340
  [Intel XE#7395]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7395
  [Intel XE#7433]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7433


Build changes
-------------

  * IGT: IGT_8829 -> IGTPW_14854

  IGTPW_14854: 14854
  IGT_8829: 8829
  xe-4785-ec0484d20b9f962d04a62ff1feb03676c3ce7611: ec0484d20b9f962d04a62ff1feb03676c3ce7611

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14854/index.html

--===============8651792198855198750==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


<!DOCTYPE html>
<html xmlns=3D"http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8"/>
  <title>Project List - Patchwork</title>
  <style id=3D"css-table-select" type=3D"text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>intel-ci: Blocklist BMG specific modifiers o=
n NVL/PTL (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/163029/">https://patchwork.freedesktop.org/series/163029/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_14854/index.html">https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_14854/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8829_FULL -&gt; XEIGTPW_14854_FULL<=
/h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14854_FULL that come from known is=
sues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8829/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14854/shard-lnl-7/igt@k=
ms_pm_dc@deep-pkgc.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2029">Intel XE#2029</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/7395">Intel XE#7395</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8829/shard-lnl-3/igt@xe_exec_system_allocator@pat-index-madvise-pat-i=
dx-uc-multi-vma.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14854/shard-lnl-2/igt@xe_exec_system_allocator@pat-ind=
ex-madvise-pat-idx-uc-multi-vma.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/5625">Intel XE#5625</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8829/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-=
edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/301">Intel XE#301</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14854/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank=
-interruptible@b-edp1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8829/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/7340">Intel XE#7340</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14854/shar=
d-lnl-6/igt@kms_pm_dc@dc6-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8829/shard-lnl-3/igt@kms_setmode@basic@pipe-a-edp-1.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6361">Intel X=
E#6361</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_14854/shard-lnl-5/igt@kms_setmode@basic@pipe-a-edp-1.html">PASS</a> +2 ot=
her tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_module_load@load:<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGT_8829/shard-bmg-1/igt@xe_module_load@load.html">DMESG-WARN</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8829/shard-bmg-5/igt@xe=
_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGT_8829/shard-bmg-5/igt@xe_module_load@load.html">DMESG-=
WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8829/sha=
rd-bmg-5/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGT_8829/shard-bmg-3/igt@xe_module_load@lo=
ad.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGT_8829/shard-bmg-3/igt@xe_module_load@load.html">DMESG-WARN</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8829/shard-bmg-3/igt@xe=
_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGT_8829/shard-bmg-6/igt@xe_module_load@load.html">DMESG-=
WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8829/sha=
rd-bmg-6/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGT_8829/shard-bmg-8/igt@xe_module_load@lo=
ad.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGT_8829/shard-bmg-8/igt@xe_module_load@load.html">DMESG-WARN</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8829/shard-bmg-4/igt@xe=
_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGT_8829/shard-bmg-4/igt@xe_module_load@load.html">DMESG-=
WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8829/sha=
rd-bmg-4/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGT_8829/shard-bmg-2/igt@xe_module_load@lo=
ad.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGT_8829/shard-bmg-2/igt@xe_module_load@load.html">DMESG-WARN</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8829/shard-bmg-2/igt@xe=
_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGT_8829/shard-bmg-9/igt@xe_module_load@load.html">DMESG-=
WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8829/sha=
rd-bmg-9/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGT_8829/shard-bmg-9/igt@xe_module_load@lo=
ad.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGT_8829/shard-bmg-7/igt@xe_module_load@load.html">DMESG-WARN</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8829/shard-bmg-10/igt@x=
e_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGT_8829/shard-bmg-10/igt@xe_module_load@load.html">DMES=
G-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8829/s=
hard-bmg-1/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGT_8829/shard-bmg-7/igt@xe_module_load@=
load.html">DMESG-WARN</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/7433">Intel XE#7433</a>) -&gt; (<a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_14854/shard-bmg-5/igt@xe_module_load@load.h=
tml">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_14854/shard-bmg-8/igt@xe_module_load@load.html">DMESG-WARN</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14854/shard-bmg-8/igt@=
xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_14854/shard-bmg-8/igt@xe_module_load@load.html">D=
MESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
4854/shard-bmg-10/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14854/shard-bmg-10/igt@xe_m=
odule_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14854/shard-bmg-10/igt@xe_module_load@load.html">DMES=
G-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1485=
4/shard-bmg-1/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14854/shard-bmg-1/igt@xe_module=
_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_14854/shard-bmg-7/igt@xe_module_load@load.html">DMESG-WARN=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14854/shar=
d-bmg-7/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_14854/shard-bmg-9/igt@xe_module_load@=
load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_14854/shard-bmg-9/igt@xe_module_load@load.html">DMESG-WARN</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14854/shard-bmg-=
9/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_14854/shard-bmg-2/igt@xe_module_load@load.h=
tml">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_14854/shard-bmg-4/igt@xe_module_load@load.html">DMESG-WARN</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14854/shard-bmg-4/igt@=
xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_14854/shard-bmg-2/igt@xe_module_load@load.html">D=
MESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
4854/shard-bmg-2/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14854/shard-bmg-4/igt@xe_mod=
ule_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_14854/shard-bmg-3/igt@xe_module_load@load.html">DMESG-W=
ARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14854/s=
hard-bmg-3/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14854/shard-bmg-6/igt@xe_module_lo=
ad@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_14854/shard-bmg-6/igt@xe_module_load@load.html">DMESG-WARN</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14854/shard-b=
mg-5/igt@xe_module_load@load.html">DMESG-WARN</a>) (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7433">Intel XE#7433=
</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8829 -&gt; IGTPW_14854</li>
</ul>
<p>IGTPW_14854: 14854<br />
  IGT_8829: 8829<br />
  xe-4785-ec0484d20b9f962d04a62ff1feb03676c3ce7611: ec0484d20b9f962d04a62ff=
1feb03676c3ce7611</p>

</body>
</html>

--===============8651792198855198750==--
