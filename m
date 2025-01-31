Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A85FC0218F
	for <igt-dev@archiver.kernel.org>; Fri, 31 Jan 2025 19:40:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C98EF10E1D1;
	Fri, 31 Jan 2025 19:40:15 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF87C10E1D1;
 Fri, 31 Jan 2025 19:40:14 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7829349680873417161=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/kms=5Fatomic=3A_Free_?=
 =?utf-8?q?up_CRC_resources?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Naladala Ramanaidu" <ramanaidu.naladala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 31 Jan 2025 19:40:14 -0000
Message-ID: <173835241484.3301340.4636648693136986886@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250131191613.447979-1-ramanaidu.naladala@intel.com>
In-Reply-To: <20250131191613.447979-1-ramanaidu.naladala@intel.com>
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

--===============7829349680873417161==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_atomic: Free up CRC resources
URL   : https://patchwork.freedesktop.org/series/144203/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8219_BAT -> XEIGTPW_12529_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts

New tests
---------

  New tests have been introduced between XEIGT_8219_BAT and XEIGTPW_12529_BAT:

### New IGT tests (1) ###

  * igt@kms_atomic@plane-immutable-zpos@pipe-a-dp-3:
    - Statuses : 1 pass(s)
    - Exec time: [1.73] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_12529_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_atomic@plane-immutable-zpos:
    - bat-adlp-vf:        NOTRUN -> [SKIP][1] ([Intel XE#2463])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12529/bat-adlp-vf/igt@kms_atomic@plane-immutable-zpos.html
    - bat-atsm-2:         NOTRUN -> [SKIP][2] ([Intel XE#1024])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12529/bat-atsm-2/igt@kms_atomic@plane-immutable-zpos.html
    - bat-bmg-2:          NOTRUN -> [SKIP][3] ([Intel XE#3419])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12529/bat-bmg-2/igt@kms_atomic@plane-immutable-zpos.html
    - bat-lnl-2:          NOTRUN -> [SKIP][4] ([Intel XE#2235])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12529/bat-lnl-2/igt@kms_atomic@plane-immutable-zpos.html
    - bat-pvc-2:          NOTRUN -> [SKIP][5] ([Intel XE#1024])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12529/bat-pvc-2/igt@kms_atomic@plane-immutable-zpos.html

  
  [Intel XE#1024]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024
  [Intel XE#2235]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235
  [Intel XE#2463]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2463
  [Intel XE#3419]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3419


Build changes
-------------

  * IGT: IGT_8219 -> IGTPW_12529

  IGTPW_12529: eada2b49181e06e8d3ed1916acea2728b8ffc878 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8219: d92c8eadff2a4e5b4d90cf8c8c52936263d29394 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2583-12fb3dcbf0667f1ed3c3caff321de4a1ad3d4a7a: 12fb3dcbf0667f1ed3c3caff321de4a1ad3d4a7a

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12529/index.html

--===============7829349680873417161==
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
<tr><td><b>Series:</b></td><td>tests/kms_atomic: Free up CRC resources</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/144203/">https://patchwork.freedesktop.org/series/144203/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12529/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12529/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8219_BAT -&gt; XEIGTPW_12529_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_8219_BAT and XEIGTPW_12529_BAT:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@kms_atomic@plane-immutable-zpos@pipe-a-dp-3:<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.73] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12529_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_atomic@plane-immutable-zpos:<ul>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12529/bat-adlp-vf/igt@kms_atomic@plane-immutable-zpos.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2463">Intel XE#2463</a>)</li>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12529/bat-atsm-2/igt@kms_atomic@plane-immutable-zpos.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a>)</li>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12529/bat-bmg-2/igt@kms_atomic@plane-immutable-zpos.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3419">Intel XE#3419</a>)</li>
<li>bat-lnl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12529/bat-lnl-2/igt@kms_atomic@plane-immutable-zpos.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235">Intel XE#2235</a>)</li>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12529/bat-pvc-2/igt@kms_atomic@plane-immutable-zpos.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8219 -&gt; IGTPW_12529</li>
</ul>
<p>IGTPW_12529: eada2b49181e06e8d3ed1916acea2728b8ffc878 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8219: d92c8eadff2a4e5b4d90cf8c8c52936263d29394 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2583-12fb3dcbf0667f1ed3c3caff321de4a1ad3d4a7a: 12fb3dcbf0667f1ed3c3caff321de4a1ad3d4a7a</p>

</body>
</html>

--===============7829349680873417161==--
