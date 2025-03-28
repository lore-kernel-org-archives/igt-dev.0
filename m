Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37265C28B20
	for <igt-dev@archiver.kernel.org>; Fri, 28 Mar 2025 06:22:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCAD610E988;
	Fri, 28 Mar 2025 06:22:23 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 456F710E982;
 Fri, 28 Mar 2025 06:22:23 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1459438986783243058=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Bucketize_refresh_rate_tole?=
 =?utf-8?q?rance_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mitul Golani" <mitulkumar.ajitkumar.golani@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 28 Mar 2025 06:22:23 -0000
Message-ID: <174314294326.13734.11472019975593367475@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250328050959.659508-1-mitulkumar.ajitkumar.golani@intel.com>
In-Reply-To: <20250328050959.659508-1-mitulkumar.ajitkumar.golani@intel.com>
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

--===============1459438986783243058==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Bucketize refresh rate tolerance (rev2)
URL   : https://patchwork.freedesktop.org/series/146850/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8291_BAT -> XEIGTPW_12866_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_12866_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_vrr@flip-basic:
    - bat-bmg-2:          NOTRUN -> [SKIP][1] ([Intel XE#3419]) +5 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12866/bat-bmg-2/igt@kms_vrr@flip-basic.html
    - bat-bmg-1:          NOTRUN -> [SKIP][2] ([Intel XE#1499]) +5 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12866/bat-bmg-1/igt@kms_vrr@flip-basic.html
    - bat-adlp-7:         NOTRUN -> [SKIP][3] ([Intel XE#455]) +5 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12866/bat-adlp-7/igt@kms_vrr@flip-basic.html
    - bat-lnl-2:          NOTRUN -> [SKIP][4] ([Intel XE#2235]) +5 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12866/bat-lnl-2/igt@kms_vrr@flip-basic.html

  * igt@kms_vrr@flip-basic-fastset:
    - bat-pvc-2:          NOTRUN -> [SKIP][5] ([Intel XE#1024]) +5 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12866/bat-pvc-2/igt@kms_vrr@flip-basic-fastset.html
    - bat-dg2-oem2:       NOTRUN -> [SKIP][6] ([Intel XE#455]) +5 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12866/bat-dg2-oem2/igt@kms_vrr@flip-basic-fastset.html
    - bat-atsm-2:         NOTRUN -> [SKIP][7] ([Intel XE#1024]) +5 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12866/bat-atsm-2/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@flipline:
    - bat-adlp-vf:        NOTRUN -> [SKIP][8] ([Intel XE#2463]) +5 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12866/bat-adlp-vf/igt@kms_vrr@flipline.html

  
  [Intel XE#1024]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#2235]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235
  [Intel XE#2463]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2463
  [Intel XE#3419]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3419
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455


Build changes
-------------

  * IGT: IGT_8291 -> IGTPW_12866
  * Linux: xe-2863-274d97eed4e8376b7a66b8904066baed6a1ae874 -> xe-2867-f823caa91ed490160b8e87792d3bb26ae3e87de0

  IGTPW_12866: 12866
  IGT_8291: a1809bc9d786d9b37a22e3e5e4810c6a0c84480b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2863-274d97eed4e8376b7a66b8904066baed6a1ae874: 274d97eed4e8376b7a66b8904066baed6a1ae874
  xe-2867-f823caa91ed490160b8e87792d3bb26ae3e87de0: f823caa91ed490160b8e87792d3bb26ae3e87de0

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12866/index.html

--===============1459438986783243058==
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
<tr><td><b>Series:</b></td><td>Bucketize refresh rate tolerance (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/146850/">https://patchwork.freedesktop.org/series/146850/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12866/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12866/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8291_BAT -&gt; XEIGTPW_12866_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12866_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12866/bat-bmg-2/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3419">Intel XE#3419</a>) +5 other tests skip</li>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12866/bat-bmg-1/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) +5 other tests skip</li>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12866/bat-adlp-7/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +5 other tests skip</li>
<li>bat-lnl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12866/bat-lnl-2/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235">Intel XE#2235</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12866/bat-pvc-2/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a>) +5 other tests skip</li>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12866/bat-dg2-oem2/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +5 other tests skip</li>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12866/bat-atsm-2/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12866/bat-adlp-vf/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2463">Intel XE#2463</a>) +5 other tests skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8291 -&gt; IGTPW_12866</li>
<li>Linux: xe-2863-274d97eed4e8376b7a66b8904066baed6a1ae874 -&gt; xe-2867-f823caa91ed490160b8e87792d3bb26ae3e87de0</li>
</ul>
<p>IGTPW_12866: 12866<br />
  IGT_8291: a1809bc9d786d9b37a22e3e5e4810c6a0c84480b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2863-274d97eed4e8376b7a66b8904066baed6a1ae874: 274d97eed4e8376b7a66b8904066baed6a1ae874<br />
  xe-2867-f823caa91ed490160b8e87792d3bb26ae3e87de0: f823caa91ed490160b8e87792d3bb26ae3e87de0</p>

</body>
</html>

--===============1459438986783243058==--
