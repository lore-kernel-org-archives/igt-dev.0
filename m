Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00041C5321E
	for <igt-dev@archiver.kernel.org>; Sun, 25 Aug 2024 20:23:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95DED10E11F;
	Sun, 25 Aug 2024 20:23:45 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E27CD10E11F;
 Sun, 25 Aug 2024 20:23:43 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6517068597496233338=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_series_starting_with_=5Bi-g-t?=
 =?utf-8?q?=2C01/14=5D_lib/igt=5Fkms=3A_add_enum_for_link_rate_and_lane_coun?=
 =?utf-8?q?t?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kunal Joshi" <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sun, 25 Aug 2024 20:23:43 -0000
Message-ID: <172461742392.782809.11917557862227983167@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240825200612.4036178-1-kunal1.joshi@intel.com>
In-Reply-To: <20240825200612.4036178-1-kunal1.joshi@intel.com>
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

--===============6517068597496233338==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,01/14] lib/igt_kms: add enum for link rate and lane count
URL   : https://patchwork.freedesktop.org/series/137761/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7990_BAT -> XEIGTPW_11633_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_11633_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_11633_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_11633_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_fallback@dp-fallback (NEW):
    - {bat-bmg-2}:        NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11633/bat-bmg-2/igt@kms_fallback@dp-fallback.html
    - bat-adlp-7:         NOTRUN -> [SKIP][2]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11633/bat-adlp-7/igt@kms_fallback@dp-fallback.html
    - bat-bmg-1:          NOTRUN -> [SKIP][3]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11633/bat-bmg-1/igt@kms_fallback@dp-fallback.html
    - bat-lnl-2:          NOTRUN -> [SKIP][4]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11633/bat-lnl-2/igt@kms_fallback@dp-fallback.html
    - bat-adlp-vf:        NOTRUN -> [SKIP][5]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11633/bat-adlp-vf/igt@kms_fallback@dp-fallback.html
    - bat-lnl-1:          NOTRUN -> [SKIP][6]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11633/bat-lnl-1/igt@kms_fallback@dp-fallback.html

  
New tests
---------

  New tests have been introduced between XEIGT_7990_BAT and XEIGTPW_11633_BAT:

### New IGT tests (1) ###

  * igt@kms_fallback@dp-fallback:
    - Statuses : 1 pass(s) 8 skip(s)
    - Exec time: [0.0, 11.87] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_11633_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_fallback@dp-fallback (NEW):
    - bat-atsm-2:         NOTRUN -> [SKIP][7] ([Intel XE#1024])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11633/bat-atsm-2/igt@kms_fallback@dp-fallback.html
    - bat-pvc-2:          NOTRUN -> [SKIP][8] ([Intel XE#1024])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11633/bat-pvc-2/igt@kms_fallback@dp-fallback.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1024]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024


Build changes
-------------

  * IGT: IGT_7990 -> IGTPW_11633
  * Linux: xe-1822-411a047925bb7e169a075a2ddfb63ba96f26a8c8 -> xe-1823-5626fe5d6eeb0949727861375b27d67ee71feaa7

  IGTPW_11633: 11633
  IGT_7990: 9ca5ff0afa3636478b6ba5a97e5ba440cfb2e55e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1822-411a047925bb7e169a075a2ddfb63ba96f26a8c8: 411a047925bb7e169a075a2ddfb63ba96f26a8c8
  xe-1823-5626fe5d6eeb0949727861375b27d67ee71feaa7: 5626fe5d6eeb0949727861375b27d67ee71feaa7

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11633/index.html

--===============6517068597496233338==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,01/14] lib/igt_kms: add enum for link rate and lane count</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/137761/">https://patchwork.freedesktop.org/series/137761/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11633/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11633/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7990_BAT -&gt; XEIGTPW_11633_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_11633_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_11633_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_11633_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_fallback@dp-fallback (NEW):<ul>
<li>{bat-bmg-2}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11633/bat-bmg-2/igt@kms_fallback@dp-fallback.html">SKIP</a></li>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11633/bat-adlp-7/igt@kms_fallback@dp-fallback.html">SKIP</a></li>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11633/bat-bmg-1/igt@kms_fallback@dp-fallback.html">SKIP</a></li>
<li>bat-lnl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11633/bat-lnl-2/igt@kms_fallback@dp-fallback.html">SKIP</a></li>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11633/bat-adlp-vf/igt@kms_fallback@dp-fallback.html">SKIP</a></li>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11633/bat-lnl-1/igt@kms_fallback@dp-fallback.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_7990_BAT and XEIGTPW_11633_BAT:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@kms_fallback@dp-fallback:<ul>
<li>Statuses : 1 pass(s) 8 skip(s)</li>
<li>Exec time: [0.0, 11.87] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11633_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_fallback@dp-fallback (NEW):<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11633/bat-atsm-2/igt@kms_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a>)</li>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11633/bat-pvc-2/igt@kms_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7990 -&gt; IGTPW_11633</li>
<li>Linux: xe-1822-411a047925bb7e169a075a2ddfb63ba96f26a8c8 -&gt; xe-1823-5626fe5d6eeb0949727861375b27d67ee71feaa7</li>
</ul>
<p>IGTPW_11633: 11633<br />
  IGT_7990: 9ca5ff0afa3636478b6ba5a97e5ba440cfb2e55e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1822-411a047925bb7e169a075a2ddfb63ba96f26a8c8: 411a047925bb7e169a075a2ddfb63ba96f26a8c8<br />
  xe-1823-5626fe5d6eeb0949727861375b27d67ee71feaa7: 5626fe5d6eeb0949727861375b27d67ee71feaa7</p>

</body>
</html>

--===============6517068597496233338==--
