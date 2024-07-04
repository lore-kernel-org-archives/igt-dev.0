Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 166D2C30653
	for <igt-dev@archiver.kernel.org>; Thu,  4 Jul 2024 18:51:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE4D610E9FA;
	Thu,  4 Jul 2024 18:51:39 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D96B10E9FA;
 Thu,  4 Jul 2024 18:51:39 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4247557052330948797=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_lib/igt=5Fdevice=5Fscan=3A_Ski?=
 =?utf-8?q?p_attributes_in_subdirectories?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Marcin Bernatowicz" <marcin.bernatowicz@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 04 Jul 2024 18:51:39 -0000
Message-ID: <172011909937.29744.8166999709863207375@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240704164437.1543161-1-marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20240704164437.1543161-1-marcin.bernatowicz@linux.intel.com>
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

--===============4247557052330948797==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/igt_device_scan: Skip attributes in subdirectories
URL   : https://patchwork.freedesktop.org/series/135769/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7916_BAT -> XEIGTPW_11372_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (5 -> 5)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_11372_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [DMESG-FAIL][1] ([Intel XE#324]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7916/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11372/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  * igt@xe_gt_freq@freq_basic_api:
    - bat-adlp-7:         [FAIL][3] -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7916/bat-adlp-7/igt@xe_gt_freq@freq_basic_api.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11372/bat-adlp-7/igt@xe_gt_freq@freq_basic_api.html

  
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324


Build changes
-------------

  * IGT: IGT_7916 -> IGTPW_11372
  * Linux: xe-1562-2bf4c5214910654a6a50082c90f0f4596ea6b0c6 -> xe-1565-55e18f9be7b75c5226a57eff4a3b3eb6110815c6

  IGTPW_11372: 11372
  IGT_7916: 971cfc9d6afc8242db25d1eabd4ae00890d9144a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1562-2bf4c5214910654a6a50082c90f0f4596ea6b0c6: 2bf4c5214910654a6a50082c90f0f4596ea6b0c6
  xe-1565-55e18f9be7b75c5226a57eff4a3b3eb6110815c6: 55e18f9be7b75c5226a57eff4a3b3eb6110815c6

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11372/index.html

--===============4247557052330948797==
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
<tr><td><b>Series:</b></td><td>lib/igt_device_scan: Skip attributes in subdirectories</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/135769/">https://patchwork.freedesktop.org/series/135769/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11372/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11372/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7916_BAT -&gt; XEIGTPW_11372_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11372_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7916/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11372/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_basic_api:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7916/bat-adlp-7/igt@xe_gt_freq@freq_basic_api.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11372/bat-adlp-7/igt@xe_gt_freq@freq_basic_api.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7916 -&gt; IGTPW_11372</li>
<li>Linux: xe-1562-2bf4c5214910654a6a50082c90f0f4596ea6b0c6 -&gt; xe-1565-55e18f9be7b75c5226a57eff4a3b3eb6110815c6</li>
</ul>
<p>IGTPW_11372: 11372<br />
  IGT_7916: 971cfc9d6afc8242db25d1eabd4ae00890d9144a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1562-2bf4c5214910654a6a50082c90f0f4596ea6b0c6: 2bf4c5214910654a6a50082c90f0f4596ea6b0c6<br />
  xe-1565-55e18f9be7b75c5226a57eff4a3b3eb6110815c6: 55e18f9be7b75c5226a57eff4a3b3eb6110815c6</p>

</body>
</html>

--===============4247557052330948797==--
