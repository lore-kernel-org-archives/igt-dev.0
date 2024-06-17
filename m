Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AA01C2BB85
	for <igt-dev@archiver.kernel.org>; Mon, 17 Jun 2024 17:38:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6D4710E0D9;
	Mon, 17 Jun 2024 17:38:41 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9F1810E0D9;
 Mon, 17 Jun 2024 17:38:40 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2294877136143874352=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_add_subtest_in_kms=5Fbw_for_co?=
 =?utf-8?q?nnected_outputs_only_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kunal Joshi" <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 17 Jun 2024 17:38:40 -0000
Message-ID: <171864592075.97967.14626448211838236426@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240617161052.1113250-1-kunal1.joshi@intel.com>
In-Reply-To: <20240617161052.1113250-1-kunal1.joshi@intel.com>
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

--===============2294877136143874352==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: add subtest in kms_bw for connected outputs only (rev2)
URL   : https://patchwork.freedesktop.org/series/134822/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7890_BAT -> XEIGTPW_11266_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (5 -> 5)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_11266_BAT:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p} (NEW):
    - bat-adlp-7:         NOTRUN -> [SKIP][1] +11 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11266/bat-adlp-7/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
    - bat-dg2-oem2:       NOTRUN -> [SKIP][2] +11 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11266/bat-dg2-oem2/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * {igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p} (NEW):
    - {bat-lnl-1}:        NOTRUN -> [SKIP][3] +11 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11266/bat-lnl-1/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html

  
New tests
---------

  New tests have been introduced between XEIGT_7890_BAT and XEIGTPW_11266_BAT:

### New IGT tests (16) ###

  * igt@kms_bw@connected-linear-tiling-1-displays-1920x1080p:
    - Statuses : 3 pass(s) 2 skip(s)
    - Exec time: [0.0, 0.48] s

  * igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p:
    - Statuses : 3 pass(s) 2 skip(s)
    - Exec time: [0.0, 0.49] s

  * igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p:
    - Statuses : 3 pass(s) 2 skip(s)
    - Exec time: [0.0, 0.50] s

  * igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p:
    - Statuses : 3 pass(s) 2 skip(s)
    - Exec time: [0.0, 0.56] s

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_11266_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * {igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p} (NEW):
    - bat-atsm-2:         NOTRUN -> [SKIP][4] ([Intel XE#1024]) +31 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11266/bat-atsm-2/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
    - bat-adlp-7:         NOTRUN -> [SKIP][5] ([Intel XE#367]) +8 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11266/bat-adlp-7/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-3840x2160p:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][6] ([Intel XE#367]) +15 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11266/bat-dg2-oem2/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-4-displays-1920x1080p:
    - bat-pvc-2:          NOTRUN -> [SKIP][7] ([Intel XE#1024]) +31 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11266/bat-pvc-2/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html

  
#### Possible fixes ####

  * igt@xe_intel_bb@blit-simple:
    - bat-atsm-2:         [DMESG-WARN][8] ([Intel XE#2110]) -> [PASS][9]
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/bat-atsm-2/igt@xe_intel_bb@blit-simple.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11266/bat-atsm-2/igt@xe_intel_bb@blit-simple.html

  * igt@xe_live_ktest@xe_migrate:
    - bat-atsm-2:         [SKIP][10] ([Intel XE#2109]) -> [PASS][11] +2 other tests pass
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11266/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1024]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#2109]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2109
  [Intel XE#2110]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2110
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367


Build changes
-------------

  * IGT: IGT_7890 -> IGTPW_11266
  * Linux: xe-1482-c00c421245452a4a82a893cd2e1bfd9663a761fb -> xe-1484-3b4eab7e82c7a1429e257890553ad571f320b8a3

  IGTPW_11266: 11266
  IGT_7890: a137e386eba9f46f838315f5d93b87561691d45e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1482-c00c421245452a4a82a893cd2e1bfd9663a761fb: c00c421245452a4a82a893cd2e1bfd9663a761fb
  xe-1484-3b4eab7e82c7a1429e257890553ad571f320b8a3: 3b4eab7e82c7a1429e257890553ad571f320b8a3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11266/index.html

--===============2294877136143874352==
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
<tr><td><b>Series:</b></td><td>add subtest in kms_bw for connected outputs only (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/134822/">https://patchwork.freedesktop.org/series/134822/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11266/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11266/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7890_BAT -&gt; XEIGTPW_11266_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_11266_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p} (NEW):</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11266/bat-adlp-7/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> +11 other tests skip</li>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11266/bat-dg2-oem2/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> +11 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p} (NEW):</p>
<ul>
<li>{bat-lnl-1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11266/bat-lnl-1/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html">SKIP</a> +11 other tests skip</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_7890_BAT and XEIGTPW_11266_BAT:</p>
<h3>New IGT tests (16)</h3>
<ul>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>Statuses : 3 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p:</p>
<ul>
<li>Statuses : 3 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>Statuses : 3 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p:</p>
<ul>
<li>Statuses : 3 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11266_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>{igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p} (NEW):</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11266/bat-atsm-2/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a>) +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11266/bat-adlp-7/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11266/bat-dg2-oem2/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11266/bat-pvc-2/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a>) +31 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@xe_intel_bb@blit-simple:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/bat-atsm-2/igt@xe_intel_bb@blit-simple.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2110">Intel XE#2110</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11266/bat-atsm-2/igt@xe_intel_bb@blit-simple.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7890/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2109">Intel XE#2109</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11266/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7890 -&gt; IGTPW_11266</li>
<li>Linux: xe-1482-c00c421245452a4a82a893cd2e1bfd9663a761fb -&gt; xe-1484-3b4eab7e82c7a1429e257890553ad571f320b8a3</li>
</ul>
<p>IGTPW_11266: 11266<br />
  IGT_7890: a137e386eba9f46f838315f5d93b87561691d45e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1482-c00c421245452a4a82a893cd2e1bfd9663a761fb: c00c421245452a4a82a893cd2e1bfd9663a761fb<br />
  xe-1484-3b4eab7e82c7a1429e257890553ad571f320b8a3: 3b4eab7e82c7a1429e257890553ad571f320b8a3</p>

</body>
</html>

--===============2294877136143874352==--
