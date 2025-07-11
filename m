Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE294C8303C
	for <igt-dev@archiver.kernel.org>; Fri, 11 Jul 2025 07:50:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6901E10E9C2;
	Fri, 11 Jul 2025 07:50:42 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE3A110E9C2;
 Fri, 11 Jul 2025 07:50:40 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7324251245944723328=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tools/intel=5Fdp=5Fcomplian?=
 =?utf-8?q?ce=3A_Enabling_XE_driver_support_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Disantkumar Mistry" <disantkumar.isvarbhai.mistry@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 11 Jul 2025 07:50:40 -0000
Message-ID: <175222024076.153497.6936141414467297782@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250711065645.3074530-1-disantkumar.isvarbhai.mistry@intel.com>
In-Reply-To: <20250711065645.3074530-1-disantkumar.isvarbhai.mistry@intel.com>
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

--===============7324251245944723328==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tools/intel_dp_compliance: Enabling XE driver support (rev2)
URL   : https://patchwork.freedesktop.org/series/151364/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8451_BAT -> XEIGTPW_13451_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_13451_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries:
    - bat-lnl-2:          [PASS][1] -> [ABORT][2] ([Intel XE#4624] / [Intel XE#4966] / [Intel XE#5456])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8451/bat-lnl-2/igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13451/bat-lnl-2/igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries.html

  
#### Possible fixes ####

  * igt@kms_flip@basic-plain-flip@c-edp1:
    - bat-adlp-7:         [DMESG-WARN][3] ([Intel XE#4543]) -> [PASS][4] +1 other test pass
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8451/bat-adlp-7/igt@kms_flip@basic-plain-flip@c-edp1.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13451/bat-adlp-7/igt@kms_flip@basic-plain-flip@c-edp1.html

  
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#4624]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4624
  [Intel XE#4966]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4966
  [Intel XE#5456]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5456


Build changes
-------------

  * IGT: IGT_8451 -> IGTPW_13451
  * Linux: xe-3390-ad02e528d11b8cdc56daaa647aed319ba1d1ff03 -> xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459

  IGTPW_13451: 13451
  IGT_8451: 8451
  xe-3390-ad02e528d11b8cdc56daaa647aed319ba1d1ff03: ad02e528d11b8cdc56daaa647aed319ba1d1ff03
  xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459: e1d8a6230d710e3e59a23520a0690115ad57b459

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13451/index.html

--===============7324251245944723328==
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
<tr><td><b>Series:</b></td><td>tools/intel_dp_compliance: Enabling XE driver support (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/151364/">https://patchwork.freedesktop.org/series/151364/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13451/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13451/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8451_BAT -&gt; XEIGTPW_13451_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_13451_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries:<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8451/bat-lnl-2/igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13451/bat-lnl-2/igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4624">Intel XE#4624</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4966">Intel XE#4966</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5456">Intel XE#5456</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_flip@basic-plain-flip@c-edp1:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8451/bat-adlp-7/igt@kms_flip@basic-plain-flip@c-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13451/bat-adlp-7/igt@kms_flip@basic-plain-flip@c-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8451 -&gt; IGTPW_13451</li>
<li>Linux: xe-3390-ad02e528d11b8cdc56daaa647aed319ba1d1ff03 -&gt; xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459</li>
</ul>
<p>IGTPW_13451: 13451<br />
  IGT_8451: 8451<br />
  xe-3390-ad02e528d11b8cdc56daaa647aed319ba1d1ff03: ad02e528d11b8cdc56daaa647aed319ba1d1ff03<br />
  xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459: e1d8a6230d710e3e59a23520a0690115ad57b459</p>

</body>
</html>

--===============7324251245944723328==--
