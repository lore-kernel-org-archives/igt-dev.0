Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B6BDD39417
	for <igt-dev@archiver.kernel.org>; Thu,  2 Apr 2026 11:30:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 007AF10E032;
	Thu,  2 Apr 2026 11:30:45 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDA7E10F1FB;
 Thu,  2 Apr 2026 11:30:35 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4595462802813373462=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_kms=5Fflip=3A_limit_number_?=
 =?utf-8?q?of_subtests_run_=28rev13=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Micha=C5=82_Grzelak?= <michal.grzelak@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 02 Apr 2026 11:30:35 -0000
Message-ID: <177512943582.427876.6019466520467645002@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260330075508.1003899-1-michal.grzelak@intel.com>
In-Reply-To: <20260330075508.1003899-1-michal.grzelak@intel.com>
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

--===============4595462802813373462==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: kms_flip: limit number of subtests run (rev13)
URL   : https://patchwork.freedesktop.org/series/161389/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8842_BAT -> XEIGTPW_14918_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (14 -> 13)
------------------------------

  Missing    (1): bat-ptl-vm 

Known issues
------------

  Here are the changes found in XEIGTPW_14918_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1:
    - bat-adlp-7:         [PASS][1] -> [DMESG-WARN][2] ([Intel XE#7483])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8842/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14918/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html

  
#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1:
    - bat-adlp-7:         [DMESG-WARN][3] ([Intel XE#7483]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8842/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14918/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html

  * igt@sriov_basic@enable-vfs-autoprobe-on:
    - bat-bmg-2:          [DMESG-WARN][5] ([Intel XE#7433]) -> [PASS][6] +3 other tests pass
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8842/bat-bmg-2/igt@sriov_basic@enable-vfs-autoprobe-on.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14918/bat-bmg-2/igt@sriov_basic@enable-vfs-autoprobe-on.html
    - bat-bmg-1:          [DMESG-WARN][7] ([Intel XE#7433]) -> [PASS][8] +3 other tests pass
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8842/bat-bmg-1/igt@sriov_basic@enable-vfs-autoprobe-on.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14918/bat-bmg-1/igt@sriov_basic@enable-vfs-autoprobe-on.html

  * igt@xe_module_load@load:
    - bat-bmg-3:          [DMESG-WARN][9] ([Intel XE#7433]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8842/bat-bmg-3/igt@xe_module_load@load.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14918/bat-bmg-3/igt@xe_module_load@load.html

  * igt@xe_waitfence@engine:
    - bat-dg2-oem2:       [FAIL][11] ([Intel XE#6519]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8842/bat-dg2-oem2/igt@xe_waitfence@engine.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14918/bat-dg2-oem2/igt@xe_waitfence@engine.html

  
  [Intel XE#6519]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519
  [Intel XE#7433]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7433
  [Intel XE#7483]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7483


Build changes
-------------

  * IGT: IGT_8842 -> IGTPW_14918
  * Linux: xe-4837-35370a958ae250844fbacb7a26230032a4fa661c -> xe-4841-7b7e57c49dffb4329964027a09420a3e9998e65a

  IGTPW_14918: b91b8ff819ce4f63a3b67b1dc6a4bca115891f33 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8842: 8842
  xe-4837-35370a958ae250844fbacb7a26230032a4fa661c: 35370a958ae250844fbacb7a26230032a4fa661c
  xe-4841-7b7e57c49dffb4329964027a09420a3e9998e65a: 7b7e57c49dffb4329964027a09420a3e9998e65a

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14918/index.html

--===============4595462802813373462==
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
<tr><td><b>Series:</b></td><td>kms_flip: limit number of subtests run (rev13)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/161389/">https://patchwork.freedesktop.org/series/161389/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14918/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14918/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8842_BAT -&gt; XEIGTPW_14918_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (14 -&gt; 13)</h2>
<p>Missing    (1): bat-ptl-vm </p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14918_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8842/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14918/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7483">Intel XE#7483</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8842/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7483">Intel XE#7483</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14918/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-on:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8842/bat-bmg-2/igt@sriov_basic@enable-vfs-autoprobe-on.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7433">Intel XE#7433</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14918/bat-bmg-2/igt@sriov_basic@enable-vfs-autoprobe-on.html">PASS</a> +3 other tests pass</li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8842/bat-bmg-1/igt@sriov_basic@enable-vfs-autoprobe-on.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7433">Intel XE#7433</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14918/bat-bmg-1/igt@sriov_basic@enable-vfs-autoprobe-on.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8842/bat-bmg-3/igt@xe_module_load@load.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7433">Intel XE#7433</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14918/bat-bmg-3/igt@xe_module_load@load.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@engine:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8842/bat-dg2-oem2/igt@xe_waitfence@engine.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519">Intel XE#6519</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14918/bat-dg2-oem2/igt@xe_waitfence@engine.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8842 -&gt; IGTPW_14918</li>
<li>Linux: xe-4837-35370a958ae250844fbacb7a26230032a4fa661c -&gt; xe-4841-7b7e57c49dffb4329964027a09420a3e9998e65a</li>
</ul>
<p>IGTPW_14918: b91b8ff819ce4f63a3b67b1dc6a4bca115891f33 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8842: 8842<br />
  xe-4837-35370a958ae250844fbacb7a26230032a4fa661c: 35370a958ae250844fbacb7a26230032a4fa661c<br />
  xe-4841-7b7e57c49dffb4329964027a09420a3e9998e65a: 7b7e57c49dffb4329964027a09420a3e9998e65a</p>

</body>
</html>

--===============4595462802813373462==--
