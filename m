Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 126FFCA0ED1
	for <igt-dev@archiver.kernel.org>; Mon, 18 Aug 2025 11:47:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B87A010E437;
	Mon, 18 Aug 2025 11:47:35 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DA8F10E431;
 Mon, 18 Aug 2025 11:47:34 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7795955648953423770=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFull=3A_success_for_Shaders_migration_to_separ?=
 =?utf-8?q?ate_headers_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 18 Aug 2025 11:47:34 -0000
Message-ID: <175551765463.243606.9848321752733220728@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250818073114.1014041-6-zbigniew.kempczynski@intel.com>
In-Reply-To: <20250818073114.1014041-6-zbigniew.kempczynski@intel.com>
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

--===============7795955648953423770==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Shaders migration to separate headers (rev2)
URL   : https://patchwork.freedesktop.org/series/152864/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8495_FULL -> XEIGTPW_13587_FULL
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 3)
------------------------------

  Missing    (1): shard-adlp 

Known issues
------------

  Here are the changes found in XEIGTPW_13587_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@runner@aborted:
    - shard-bmg:          NOTRUN -> ([FAIL][1], [FAIL][2], [FAIL][3], [FAIL][4], [FAIL][5], [FAIL][6], [FAIL][7], [FAIL][8], [FAIL][9], [FAIL][10], [FAIL][11], [FAIL][12], [FAIL][13], [FAIL][14], [FAIL][15], [FAIL][16], [FAIL][17], [FAIL][18], [FAIL][19], [FAIL][20], [FAIL][21], [FAIL][22], [FAIL][23], [FAIL][24], [FAIL][25]) ([Intel XE#5945])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/shard-bmg-5/igt@runner@aborted.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/shard-bmg-4/igt@runner@aborted.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/shard-bmg-4/igt@runner@aborted.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/shard-bmg-4/igt@runner@aborted.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/shard-bmg-4/igt@runner@aborted.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/shard-bmg-8/igt@runner@aborted.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/shard-bmg-8/igt@runner@aborted.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/shard-bmg-1/igt@runner@aborted.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/shard-bmg-1/igt@runner@aborted.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/shard-bmg-1/igt@runner@aborted.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/shard-bmg-1/igt@runner@aborted.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/shard-bmg-7/igt@runner@aborted.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/shard-bmg-7/igt@runner@aborted.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/shard-bmg-2/igt@runner@aborted.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/shard-bmg-2/igt@runner@aborted.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/shard-bmg-2/igt@runner@aborted.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/shard-bmg-2/igt@runner@aborted.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/shard-bmg-6/igt@runner@aborted.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/shard-bmg-6/igt@runner@aborted.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/shard-bmg-3/igt@runner@aborted.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/shard-bmg-3/igt@runner@aborted.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/shard-bmg-3/igt@runner@aborted.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/shard-bmg-5/igt@runner@aborted.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/shard-bmg-5/igt@runner@aborted.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/shard-bmg-5/igt@runner@aborted.html
    - shard-lnl:          NOTRUN -> ([FAIL][26], [FAIL][27], [FAIL][28], [FAIL][29], [FAIL][30], [FAIL][31], [FAIL][32], [FAIL][33], [FAIL][34], [FAIL][35], [FAIL][36], [FAIL][37], [FAIL][38], [FAIL][39], [FAIL][40], [FAIL][41], [FAIL][42], [FAIL][43], [FAIL][44], [FAIL][45], [FAIL][46], [FAIL][47], [FAIL][48], [FAIL][49], [FAIL][50]) ([Intel XE#5945])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/shard-lnl-1/igt@runner@aborted.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/shard-lnl-1/igt@runner@aborted.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/shard-lnl-1/igt@runner@aborted.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/shard-lnl-8/igt@runner@aborted.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/shard-lnl-8/igt@runner@aborted.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/shard-lnl-8/igt@runner@aborted.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/shard-lnl-8/igt@runner@aborted.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/shard-lnl-4/igt@runner@aborted.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/shard-lnl-4/igt@runner@aborted.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/shard-lnl-4/igt@runner@aborted.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/shard-lnl-4/igt@runner@aborted.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/shard-lnl-3/igt@runner@aborted.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/shard-lnl-3/igt@runner@aborted.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/shard-lnl-3/igt@runner@aborted.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/shard-lnl-2/igt@runner@aborted.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/shard-lnl-2/igt@runner@aborted.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/shard-lnl-2/igt@runner@aborted.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/shard-lnl-2/igt@runner@aborted.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/shard-lnl-7/igt@runner@aborted.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/shard-lnl-7/igt@runner@aborted.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/shard-lnl-7/igt@runner@aborted.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/shard-lnl-5/igt@runner@aborted.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/shard-lnl-5/igt@runner@aborted.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/shard-lnl-5/igt@runner@aborted.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/shard-lnl-5/igt@runner@aborted.html

  
#### Warnings ####

  * igt@runner@aborted:
    - shard-dg2-set2:     [FAIL][51] -> ([FAIL][52], [FAIL][53], [FAIL][54], [FAIL][55], [FAIL][56], [FAIL][57], [FAIL][58], [FAIL][59], [FAIL][60], [FAIL][61], [FAIL][62], [FAIL][63], [FAIL][64], [FAIL][65], [FAIL][66], [FAIL][67], [FAIL][68], [FAIL][69], [FAIL][70], [FAIL][71], [FAIL][72], [FAIL][73], [FAIL][74], [FAIL][75], [FAIL][76]) ([Intel XE#5945])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8495/shard-dg2-463/igt@runner@aborted.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/shard-dg2-434/igt@runner@aborted.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/shard-dg2-434/igt@runner@aborted.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/shard-dg2-434/igt@runner@aborted.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/shard-dg2-434/igt@runner@aborted.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/shard-dg2-464/igt@runner@aborted.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/shard-dg2-464/igt@runner@aborted.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/shard-dg2-464/igt@runner@aborted.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/shard-dg2-464/igt@runner@aborted.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/shard-dg2-433/igt@runner@aborted.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/shard-dg2-433/igt@runner@aborted.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/shard-dg2-433/igt@runner@aborted.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/shard-dg2-463/igt@runner@aborted.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/shard-dg2-463/igt@runner@aborted.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/shard-dg2-463/igt@runner@aborted.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/shard-dg2-463/igt@runner@aborted.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/shard-dg2-466/igt@runner@aborted.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/shard-dg2-466/igt@runner@aborted.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/shard-dg2-466/igt@runner@aborted.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/shard-dg2-466/igt@runner@aborted.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/shard-dg2-435/igt@runner@aborted.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/shard-dg2-435/igt@runner@aborted.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/shard-dg2-435/igt@runner@aborted.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/shard-dg2-432/igt@runner@aborted.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/shard-dg2-432/igt@runner@aborted.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/shard-dg2-432/igt@runner@aborted.html

  
  [Intel XE#5945]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5945


Build changes
-------------

  * IGT: IGT_8495 -> IGTPW_13587
  * Linux: xe-3551-7582d01b3cb80604bd700c37237effb7b5c6fe6e -> xe-3567-2109e38df4c111216f291cde8fd0f7eede4ebd62

  IGTPW_13587: 13587
  IGT_8495: b412b144685feadfd5675f3108de3d6820a4d1db @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3551-7582d01b3cb80604bd700c37237effb7b5c6fe6e: 7582d01b3cb80604bd700c37237effb7b5c6fe6e
  xe-3567-2109e38df4c111216f291cde8fd0f7eede4ebd62: 2109e38df4c111216f291cde8fd0f7eede4ebd62

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/index.html

--===============7795955648953423770==
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
<tr><td><b>Series:</b></td><td>Shaders migration to separate headers (rev2)=
</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/152864/">https://patchwork.freedesktop.org/series/152864/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_13587/index.html">https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_13587/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8495_FULL -&gt; XEIGTPW_13587_FULL<=
/h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 3)</h2>
<p>Missing    (1): shard-adlp </p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_13587_FULL that come from known is=
sues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@runner@aborted:<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13587/shard-bmg-5/igt@runner@aborted.html">FAIL</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/shard-bmg-=
4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13587/shard-bmg-4/igt@runner@aborted.html">FAIL</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/shard-bmg-4=
/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_13587/shard-bmg-4/igt@runner@aborted.html">FAIL</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/shard-bmg-8/=
igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_13587/shard-bmg-8/igt@runner@aborted.html">FAIL</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/shard-bmg-1/i=
gt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_13587/shard-bmg-1/igt@runner@aborted.html">FAIL</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/shard-bmg-1/ig=
t@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_13587/shard-bmg-1/igt@runner@aborted.html">FAIL</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/shard-bmg-7/igt=
@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_13587/shard-bmg-7/igt@runner@aborted.html">FAIL</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/shard-bmg-2/igt@=
runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_13587/shard-bmg-2/igt@runner@aborted.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/shard-bmg-2/igt@r=
unner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_13587/shard-bmg-2/igt@runner@aborted.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/shard-bmg-6/igt@r=
unner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_13587/shard-bmg-6/igt@runner@aborted.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/shard-bmg-3/igt@r=
unner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_13587/shard-bmg-3/igt@runner@aborted.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/shard-bmg-3/igt@r=
unner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_13587/shard-bmg-5/igt@runner@aborted.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/shard-bmg-5/igt@r=
unner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_13587/shard-bmg-5/igt@runner@aborted.html">FAIL</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5945">Intel XE#5945=
</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13587/shard-lnl-1/igt@runner@aborted.html">FAIL</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/shard-lnl-=
1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13587/shard-lnl-1/igt@runner@aborted.html">FAIL</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/shard-lnl-8=
/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_13587/shard-lnl-8/igt@runner@aborted.html">FAIL</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/shard-lnl-8/=
igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_13587/shard-lnl-8/igt@runner@aborted.html">FAIL</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/shard-lnl-4/i=
gt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_13587/shard-lnl-4/igt@runner@aborted.html">FAIL</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/shard-lnl-4/ig=
t@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_13587/shard-lnl-4/igt@runner@aborted.html">FAIL</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/shard-lnl-3/igt=
@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_13587/shard-lnl-3/igt@runner@aborted.html">FAIL</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/shard-lnl-3/igt@=
runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_13587/shard-lnl-2/igt@runner@aborted.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/shard-lnl-2/igt@r=
unner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_13587/shard-lnl-2/igt@runner@aborted.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/shard-lnl-2/igt@r=
unner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_13587/shard-lnl-7/igt@runner@aborted.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/shard-lnl-7/igt@r=
unner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_13587/shard-lnl-7/igt@runner@aborted.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/shard-lnl-5/igt@r=
unner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_13587/shard-lnl-5/igt@runner@aborted.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/shard-lnl-5/igt@r=
unner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_13587/shard-lnl-5/igt@runner@aborted.html">FAIL</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5945">Intel XE#5945=
</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@runner@aborted:<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8495/shard-dg2-463/igt@runner@aborted.html">FAIL</a> -&gt; (<a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/shard-dg2-434/igt=
@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_13587/shard-dg2-434/igt@runner@aborted.html">FAIL</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/shard-dg2-434/=
igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_13587/shard-dg2-434/igt@runner@aborted.html">FAIL</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/shard-dg2-4=
64/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13587/shard-dg2-464/igt@runner@aborted.html">FAIL</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/shard-dg=
2-464/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_13587/shard-dg2-464/igt@runner@aborted.html">FAIL<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/shard=
-dg2-433/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_13587/shard-dg2-433/igt@runner@aborted.html">FA=
IL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/sh=
ard-dg2-433/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_13587/shard-dg2-463/igt@runner@aborted.html"=
>FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587=
/shard-dg2-463/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_13587/shard-dg2-463/igt@runner@aborted.ht=
ml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13=
587/shard-dg2-463/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/shard-dg2-466/igt@runner@aborted=
.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_13587/shard-dg2-466/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/shard-dg2-466/igt@runner@abor=
ted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_13587/shard-dg2-466/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/shard-dg2-435/igt@runner@a=
borted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_13587/shard-dg2-435/igt@runner@aborted.html">FAIL</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/shard-dg2-435/igt@runne=
r@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_13587/shard-dg2-432/igt@runner@aborted.html">FAIL</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13587/shard-dg2-432/igt@ru=
nner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_13587/shard-dg2-432/igt@runner@aborted.html">FAIL</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5945">Intel XE#594=
5</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8495 -&gt; IGTPW_13587</li>
<li>Linux: xe-3551-7582d01b3cb80604bd700c37237effb7b5c6fe6e -&gt; xe-3567-2=
109e38df4c111216f291cde8fd0f7eede4ebd62</li>
</ul>
<p>IGTPW_13587: 13587<br />
  IGT_8495: b412b144685feadfd5675f3108de3d6820a4d1db @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  xe-3551-7582d01b3cb80604bd700c37237effb7b5c6fe6e: 7582d01b3cb80604bd700c3=
7237effb7b5c6fe6e<br />
  xe-3567-2109e38df4c111216f291cde8fd0f7eede4ebd62: 2109e38df4c111216f291cd=
e8fd0f7eede4ebd62</p>

</body>
</html>

--===============7795955648953423770==--
