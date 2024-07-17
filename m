Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0C11C3DA4B
	for <igt-dev@archiver.kernel.org>; Wed, 17 Jul 2024 15:24:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E16410E112;
	Wed, 17 Jul 2024 15:24:28 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DE8110E112;
 Wed, 17 Jul 2024 15:24:26 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0456361952512794597=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_tests/intel/kms=5Fpm=5Fdc=3A_I?=
 =?utf-8?q?mprovise_the_deep-pkgc?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Naladala Ramanaidu" <ramanaidu.naladala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 17 Jul 2024 15:24:26 -0000
Message-ID: <172122986644.270702.2926523804211992307@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240717140225.640086-1-ramanaidu.naladala@intel.com>
In-Reply-To: <20240717140225.640086-1-ramanaidu.naladala@intel.com>
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

--===============0456361952512794597==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/kms_pm_dc: Improvise the deep-pkgc
URL   : https://patchwork.freedesktop.org/series/136194/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7928_BAT -> XEIGTPW_11419_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (7 -> 7)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_11419_BAT:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_pm_dc@deep-pkgc:
    - {bat-bmg-1}:        NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11419/bat-bmg-1/igt@kms_pm_dc@deep-pkgc.html
    - {bat-lnl-2}:        NOTRUN -> [SKIP][2]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11419/bat-lnl-2/igt@kms_pm_dc@deep-pkgc.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_11419_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_pm_dc@deep-pkgc:
    - bat-pvc-2:          NOTRUN -> [SKIP][3] ([Intel XE#1024])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11419/bat-pvc-2/igt@kms_pm_dc@deep-pkgc.html
    - bat-dg2-oem2:       NOTRUN -> [SKIP][4] ([Intel XE#2007])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11419/bat-dg2-oem2/igt@kms_pm_dc@deep-pkgc.html
    - bat-atsm-2:         NOTRUN -> [SKIP][5] ([Intel XE#1024])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11419/bat-atsm-2/igt@kms_pm_dc@deep-pkgc.html
    - bat-adlp-7:         NOTRUN -> [SKIP][6] ([Intel XE#2007])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11419/bat-adlp-7/igt@kms_pm_dc@deep-pkgc.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1024]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024
  [Intel XE#2007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2007


Build changes
-------------

  * IGT: IGT_7928 -> IGTPW_11419

  IGTPW_11419: b39d8a1c80416ec9369b35627d76df2ac3dee848 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7928: 294a7a487aab103c54b0deeb1559fcba371232d9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1619-cf52b34c47ed2a05c46193f0b9807ffd8838dbd8: cf52b34c47ed2a05c46193f0b9807ffd8838dbd8

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11419/index.html

--===============0456361952512794597==
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
<tr><td><b>Series:</b></td><td>tests/intel/kms_pm_dc: Improvise the deep-pkgc</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/136194/">https://patchwork.freedesktop.org/series/136194/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11419/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11419/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7928_BAT -&gt; XEIGTPW_11419_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_11419_BAT:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@kms_pm_dc@deep-pkgc:<ul>
<li>{bat-bmg-1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11419/bat-bmg-1/igt@kms_pm_dc@deep-pkgc.html">SKIP</a></li>
<li>{bat-lnl-2}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11419/bat-lnl-2/igt@kms_pm_dc@deep-pkgc.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11419_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_pm_dc@deep-pkgc:<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11419/bat-pvc-2/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a>)</li>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11419/bat-dg2-oem2/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2007">Intel XE#2007</a>)</li>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11419/bat-atsm-2/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a>)</li>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11419/bat-adlp-7/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2007">Intel XE#2007</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7928 -&gt; IGTPW_11419</li>
</ul>
<p>IGTPW_11419: b39d8a1c80416ec9369b35627d76df2ac3dee848 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7928: 294a7a487aab103c54b0deeb1559fcba371232d9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1619-cf52b34c47ed2a05c46193f0b9807ffd8838dbd8: cf52b34c47ed2a05c46193f0b9807ffd8838dbd8</p>

</body>
</html>

--===============0456361952512794597==--
