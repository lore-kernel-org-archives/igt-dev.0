Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD4D8C4725D
	for <igt-dev@archiver.kernel.org>; Fri, 19 Jan 2024 18:19:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 675BE10EA20;
	Fri, 19 Jan 2024 18:19:00 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31DF110E1DA;
 Fri, 19 Jan 2024 18:18:59 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6621030905912824584=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_Couple_of_fixes_to_guc=5Fpc_te?=
 =?utf-8?q?sts_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Badal Nilawar" <badal.nilawar@intel.com>
Date: Fri, 19 Jan 2024 18:18:59 -0000
Message-ID: <170568833920.592635.13475093901234263215@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240119170448.1889777-1-badal.nilawar@intel.com>
In-Reply-To: <20240119170448.1889777-1-badal.nilawar@intel.com>
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
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

--===============6621030905912824584==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Couple of fixes to guc_pc tests (rev3)
URL   : https://patchwork.freedesktop.org/series/126869/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7683_BAT -> XEIGTPW_10565_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_10565_BAT:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@xe_gt_freq@freq_basic_api}:
    - bat-adlp-7:         [PASS][1] -> [SKIP][2] +2 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7683/bat-adlp-7/igt@xe_gt_freq@freq_basic_api.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10565/bat-adlp-7/igt@xe_gt_freq@freq_basic_api.html
    - bat-pvc-2:          [PASS][3] -> [SKIP][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7683/bat-pvc-2/igt@xe_gt_freq@freq_basic_api.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10565/bat-pvc-2/igt@xe_gt_freq@freq_basic_api.html
    - bat-dg2-oem2:       [PASS][5] -> [SKIP][6] +2 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7683/bat-dg2-oem2/igt@xe_gt_freq@freq_basic_api.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10565/bat-dg2-oem2/igt@xe_gt_freq@freq_basic_api.html

  * {igt@xe_gt_freq@freq_fixed_idle}:
    - bat-atsm-2:         [PASS][7] -> [SKIP][8] +2 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7683/bat-atsm-2/igt@xe_gt_freq@freq_fixed_idle.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10565/bat-atsm-2/igt@xe_gt_freq@freq_fixed_idle.html

  * {igt@xe_gt_freq@freq_range_idle}:
    - bat-pvc-2:          [SKIP][9] ([Intel XE#1021]) -> [SKIP][10] +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7683/bat-pvc-2/igt@xe_gt_freq@freq_range_idle.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10565/bat-pvc-2/igt@xe_gt_freq@freq_range_idle.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1021


Build changes
-------------

  * IGT: IGT_7683 -> IGTPW_10565
  * Linux: xe-644-238e8655c184b7cf16731690b59da560641a07ad -> xe-655-e6ff162529c0239058b009085071878ef2d4e420

  IGTPW_10565: 10565
  IGT_7683: 7683
  xe-644-238e8655c184b7cf16731690b59da560641a07ad: 238e8655c184b7cf16731690b59da560641a07ad
  xe-655-e6ff162529c0239058b009085071878ef2d4e420: e6ff162529c0239058b009085071878ef2d4e420

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10565/index.html

--===============6621030905912824584==
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
<tr><td><b>Series:</b></td><td>Couple of fixes to guc_pc tests (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/126869/">https://patchwork.freedesktop.org/series/126869/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10565/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10565/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7683_BAT -&gt; XEIGTPW_10565_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_10565_BAT:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>{igt@xe_gt_freq@freq_basic_api}:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7683/bat-adlp-7/igt@xe_gt_freq@freq_basic_api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10565/bat-adlp-7/igt@xe_gt_freq@freq_basic_api.html">SKIP</a> +2 other tests skip</li>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7683/bat-pvc-2/igt@xe_gt_freq@freq_basic_api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10565/bat-pvc-2/igt@xe_gt_freq@freq_basic_api.html">SKIP</a></li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7683/bat-dg2-oem2/igt@xe_gt_freq@freq_basic_api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10565/bat-dg2-oem2/igt@xe_gt_freq@freq_basic_api.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@xe_gt_freq@freq_fixed_idle}:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7683/bat-atsm-2/igt@xe_gt_freq@freq_fixed_idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10565/bat-atsm-2/igt@xe_gt_freq@freq_fixed_idle.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@xe_gt_freq@freq_range_idle}:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7683/bat-pvc-2/igt@xe_gt_freq@freq_range_idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1021">Intel XE#1021</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10565/bat-pvc-2/igt@xe_gt_freq@freq_range_idle.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7683 -&gt; IGTPW_10565</li>
<li>Linux: xe-644-238e8655c184b7cf16731690b59da560641a07ad -&gt; xe-655-e6ff162529c0239058b009085071878ef2d4e420</li>
</ul>
<p>IGTPW_10565: 10565<br />
  IGT_7683: 7683<br />
  xe-644-238e8655c184b7cf16731690b59da560641a07ad: 238e8655c184b7cf16731690b59da560641a07ad<br />
  xe-655-e6ff162529c0239058b009085071878ef2d4e420: e6ff162529c0239058b009085071878ef2d4e420</p>

</body>
</html>

--===============6621030905912824584==--
