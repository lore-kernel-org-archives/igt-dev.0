Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 122B8FF60FB
	for <igt-dev@archiver.kernel.org>; Tue, 31 Mar 2026 10:55:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA5D710E7F0;
	Tue, 31 Mar 2026 10:55:12 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1300210E93B;
 Tue, 31 Mar 2026 10:55:06 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0432990452966842546=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_tests/intel/xe=5Foa=3A_Ext?=
 =?utf-8?q?end_enable-disable_to_read_after_disabling_stream_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 31 Mar 2026 10:55:06 -0000
Message-ID: <177495450605.416872.8439323421912725970@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260330201408.28421-1-ashutosh.dixit@intel.com>
In-Reply-To: <20260330201408.28421-1-ashutosh.dixit@intel.com>
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

--===============0432990452966842546==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_oa: Extend enable-disable to read after disabling stream (rev3)
URL   : https://patchwork.freedesktop.org/series/163414/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8836_FULL -> XEIGTPW_14889_FULL
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

  Here are the changes found in XEIGTPW_14889_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-lnl:          [PASS][1] -> [FAIL][2] ([Intel XE#3718] / [Intel XE#7265])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8836/shard-lnl-2/igt@kms_async_flips@alternate-sync-async-flip.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14889/shard-lnl-5/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-c-edp-1:
    - shard-lnl:          [PASS][3] -> [FAIL][4] ([Intel XE#7265])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8836/shard-lnl-2/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-edp-1.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14889/shard-lnl-5/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-edp-1.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-lnl:          [PASS][5] -> [FAIL][6] ([Intel XE#7340])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8836/shard-lnl-1/igt@kms_pm_dc@dc6-dpms.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14889/shard-lnl-8/igt@kms_pm_dc@dc6-dpms.html

  
#### Possible fixes ####

  * igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
    - shard-lnl:          [FAIL][7] ([Intel XE#2142]) -> [PASS][8] +1 other test pass
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8836/shard-lnl-8/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14889/shard-lnl-3/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html

  
#### Warnings ####

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][9], [DMESG-WARN][10], [DMESG-WARN][11], [DMESG-WARN][12], [DMESG-WARN][13], [DMESG-WARN][14], [DMESG-WARN][15], [DMESG-WARN][16], [DMESG-WARN][17], [DMESG-WARN][18], [DMESG-WARN][19], [DMESG-WARN][20], [DMESG-WARN][21], [DMESG-WARN][22], [DMESG-WARN][23], [DMESG-WARN][24], [DMESG-WARN][25], [DMESG-WARN][26], [DMESG-WARN][27], [DMESG-WARN][28], [DMESG-WARN][29], [DMESG-WARN][30], [DMESG-WARN][31], [DMESG-WARN][32], [PASS][33]) ([Intel XE#7433]) -> ([DMESG-WARN][34], [DMESG-WARN][35], [DMESG-WARN][36], [DMESG-WARN][37], [DMESG-WARN][38], [DMESG-WARN][39], [DMESG-WARN][40], [DMESG-WARN][41], [DMESG-WARN][42], [DMESG-WARN][43], [DMESG-WARN][44], [DMESG-WARN][45], [DMESG-WARN][46], [DMESG-WARN][47], [DMESG-WARN][48], [DMESG-WARN][49], [DMESG-WARN][50], [DMESG-WARN][51], [DMESG-WARN][52], [DMESG-WARN][53], [DMESG-WARN][54], [DMESG-WARN][55], [DMESG-WARN][56], [DMESG-WARN][57], [DMESG-WARN][58]) ([Intel XE#7433])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8836/shard-bmg-5/igt@xe_module_load@load.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8836/shard-bmg-8/igt@xe_module_load@load.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8836/shard-bmg-8/igt@xe_module_load@load.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8836/shard-bmg-4/igt@xe_module_load@load.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8836/shard-bmg-4/igt@xe_module_load@load.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8836/shard-bmg-10/igt@xe_module_load@load.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8836/shard-bmg-10/igt@xe_module_load@load.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8836/shard-bmg-10/igt@xe_module_load@load.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8836/shard-bmg-1/igt@xe_module_load@load.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8836/shard-bmg-1/igt@xe_module_load@load.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8836/shard-bmg-1/igt@xe_module_load@load.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8836/shard-bmg-7/igt@xe_module_load@load.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8836/shard-bmg-7/igt@xe_module_load@load.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8836/shard-bmg-9/igt@xe_module_load@load.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8836/shard-bmg-9/igt@xe_module_load@load.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8836/shard-bmg-9/igt@xe_module_load@load.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8836/shard-bmg-2/igt@xe_module_load@load.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8836/shard-bmg-2/igt@xe_module_load@load.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8836/shard-bmg-2/igt@xe_module_load@load.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8836/shard-bmg-3/igt@xe_module_load@load.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8836/shard-bmg-3/igt@xe_module_load@load.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8836/shard-bmg-3/igt@xe_module_load@load.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8836/shard-bmg-6/igt@xe_module_load@load.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8836/shard-bmg-6/igt@xe_module_load@load.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8836/shard-bmg-5/igt@xe_module_load@load.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14889/shard-bmg-10/igt@xe_module_load@load.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14889/shard-bmg-10/igt@xe_module_load@load.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14889/shard-bmg-6/igt@xe_module_load@load.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14889/shard-bmg-6/igt@xe_module_load@load.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14889/shard-bmg-3/igt@xe_module_load@load.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14889/shard-bmg-3/igt@xe_module_load@load.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14889/shard-bmg-3/igt@xe_module_load@load.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14889/shard-bmg-1/igt@xe_module_load@load.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14889/shard-bmg-1/igt@xe_module_load@load.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14889/shard-bmg-7/igt@xe_module_load@load.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14889/shard-bmg-7/igt@xe_module_load@load.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14889/shard-bmg-7/igt@xe_module_load@load.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14889/shard-bmg-9/igt@xe_module_load@load.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14889/shard-bmg-9/igt@xe_module_load@load.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14889/shard-bmg-8/igt@xe_module_load@load.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14889/shard-bmg-8/igt@xe_module_load@load.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14889/shard-bmg-9/igt@xe_module_load@load.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14889/shard-bmg-2/igt@xe_module_load@load.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14889/shard-bmg-2/igt@xe_module_load@load.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14889/shard-bmg-2/igt@xe_module_load@load.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14889/shard-bmg-4/igt@xe_module_load@load.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14889/shard-bmg-4/igt@xe_module_load@load.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14889/shard-bmg-8/igt@xe_module_load@load.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14889/shard-bmg-4/igt@xe_module_load@load.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14889/shard-bmg-10/igt@xe_module_load@load.html

  
  [Intel XE#2142]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#7265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7265
  [Intel XE#7340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340
  [Intel XE#7433]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7433


Build changes
-------------

  * IGT: IGT_8836 -> IGTPW_14889
  * Linux: xe-4822-169e5b6f809026c4a0cb3a736b48378ca8e8fecb -> xe-4824-8d31b64e763bc1c7b508ae3dc01b4dfcab973729

  IGTPW_14889: 14889
  IGT_8836: 8836
  xe-4822-169e5b6f809026c4a0cb3a736b48378ca8e8fecb: 169e5b6f809026c4a0cb3a736b48378ca8e8fecb
  xe-4824-8d31b64e763bc1c7b508ae3dc01b4dfcab973729: 8d31b64e763bc1c7b508ae3dc01b4dfcab973729

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14889/index.html

--===============0432990452966842546==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_oa: Extend enable-disable to =
read after disabling stream (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/163414/">https://patchwork.freedesktop.org/series/163414/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_14889/index.html">https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_14889/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8836_FULL -&gt; XEIGTPW_14889_FULL<=
/h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14889_FULL that come from known is=
sues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8836/shard-lnl-2/igt@kms_async_flips@alternate-sync-async-flip.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
4889/shard-lnl-5/igt@kms_async_flips@alternate-sync-async-flip.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718">In=
tel XE#3718</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/7265">Intel XE#7265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8836/shard-lnl-2/igt@kms_async_flips@alternate-sync-async-flip@pipe-c=
-edp-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_14889/shard-lnl-5/igt@kms_async_flips@alternate-sync-async-flip=
@pipe-c-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/7265">Intel XE#7265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8836/shard-lnl-1/igt@kms_pm_dc@dc6-dpms.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14889/shard-lnl-8/igt@k=
ms_pm_dc@dc6-dpms.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7340">Intel XE#7340</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8836/shard-lnl-8/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2142">Intel XE#2142</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_14889/shard-lnl-3/igt@kms_vrr@seamless-rr-switch-virtual=
@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_module_load@load:<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGT_8836/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8836/shard-bmg-8/igt@xe_modul=
e_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGT_8836/shard-bmg-8/igt@xe_module_load@load.html">DMESG-WARN</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8836/shard-bmg=
-4/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGT_8836/shard-bmg-4/igt@xe_module_load@load.htm=
l">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
_8836/shard-bmg-10/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8836/shard-bmg-10/igt@xe_mod=
ule_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGT_8836/shard-bmg-10/igt@xe_module_load@load.html">DMESG-WAR=
N</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8836/shard-=
bmg-1/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGT_8836/shard-bmg-1/igt@xe_module_load@load.=
html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGT_8836/shard-bmg-1/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8836/shard-bmg-7/igt@xe_m=
odule_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGT_8836/shard-bmg-7/igt@xe_module_load@load.html">DMESG-WA=
RN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8836/shard=
-bmg-9/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGT_8836/shard-bmg-9/igt@xe_module_load@load=
.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGT_8836/shard-bmg-9/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8836/shard-bmg-2/igt@xe_m=
odule_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGT_8836/shard-bmg-2/igt@xe_module_load@load.html">DMESG-WA=
RN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8836/shard=
-bmg-2/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGT_8836/shard-bmg-3/igt@xe_module_load@load=
.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGT_8836/shard-bmg-3/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8836/shard-bmg-3/igt@xe_m=
odule_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGT_8836/shard-bmg-6/igt@xe_module_load@load.html">DMESG-WA=
RN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8836/shard=
-bmg-6/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGT_8836/shard-bmg-5/igt@xe_module_load@load=
.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/7433">Intel XE#7433</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_14889/shard-bmg-10/igt@xe_module_load@load.html">DMES=
G-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1488=
9/shard-bmg-10/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14889/shard-bmg-6/igt@xe_modul=
e_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_14889/shard-bmg-6/igt@xe_module_load@load.html">DMESG-WAR=
N</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14889/sha=
rd-bmg-3/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_14889/shard-bmg-3/igt@xe_module_load=
@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_14889/shard-bmg-3/igt@xe_module_load@load.html">DMESG-WARN</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14889/shard-bmg=
-1/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_14889/shard-bmg-1/igt@xe_module_load@load.=
html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_14889/shard-bmg-7/igt@xe_module_load@load.html">DMESG-WARN</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14889/shard-bmg-7/igt=
@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_14889/shard-bmg-7/igt@xe_module_load@load.html">=
DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
14889/shard-bmg-9/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14889/shard-bmg-9/igt@xe_mo=
dule_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14889/shard-bmg-8/igt@xe_module_load@load.html">DMESG-=
WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14889/=
shard-bmg-8/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14889/shard-bmg-9/igt@xe_module_l=
oad@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_14889/shard-bmg-2/igt@xe_module_load@load.html">DMESG-WARN</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14889/shard-=
bmg-2/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_14889/shard-bmg-2/igt@xe_module_load@lo=
ad.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_14889/shard-bmg-4/igt@xe_module_load@load.html">DMESG-WARN</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14889/shard-bmg-4/=
igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_14889/shard-bmg-8/igt@xe_module_load@load.htm=
l">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_14889/shard-bmg-4/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14889/shard-bmg-10/igt@=
xe_module_load@load.html">DMESG-WARN</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7433">Intel XE#7433</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8836 -&gt; IGTPW_14889</li>
<li>Linux: xe-4822-169e5b6f809026c4a0cb3a736b48378ca8e8fecb -&gt; xe-4824-8=
d31b64e763bc1c7b508ae3dc01b4dfcab973729</li>
</ul>
<p>IGTPW_14889: 14889<br />
  IGT_8836: 8836<br />
  xe-4822-169e5b6f809026c4a0cb3a736b48378ca8e8fecb: 169e5b6f809026c4a0cb3a7=
36b48378ca8e8fecb<br />
  xe-4824-8d31b64e763bc1c7b508ae3dc01b4dfcab973729: 8d31b64e763bc1c7b508ae3=
dc01b4dfcab973729</p>

</body>
</html>

--===============0432990452966842546==--
