Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A655C4450A
	for <igt-dev@archiver.kernel.org>; Thu, 16 Jul 2026 13:17:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0394010E16D;
	Thu, 16 Jul 2026 13:17:43 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E780710F316;
 Thu, 16 Jul 2026 13:17:10 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2009795649525289429=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/kms=5Fhdr=3A_Skip_uns?=
 =?utf-8?q?upported_formats_in_bpc-switch_test_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?b?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <jason-jh.lin@mediatek.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 16 Jul 2026 13:17:10 -0000
Message-ID: <178420783094.195794.4299669608647579696@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260709073913.1645371-1-jason-jh.lin@mediatek.com>
In-Reply-To: <20260709073913.1645371-1-jason-jh.lin@mediatek.com>
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

--===============2009795649525289429==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_hdr: Skip unsupported formats in bpc-switch test (rev4)
URL   : https://patchwork.freedesktop.org/series/166923/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_9008_BAT -> XEIGTPW_15541_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts

New tests
---------

  New tests have been introduced between XEIGT_9008_BAT and XEIGTPW_15541_BAT:

### New IGT tests (36) ###

  * igt@xe_ccs@block-copy-compressed:
    - Statuses : 11 pass(s) 1 skip(s)
    - Exec time: [0.01, 1.33] s

  * igt@xe_ccs@block-copy-compressed@linear-compressed-compfmt0-system-vram01:
    - Statuses : 4 pass(s)
    - Exec time: [0.02, 0.14] s

  * igt@xe_ccs@block-copy-compressed@linear-compressed-compfmt0-vram01-vram01:
    - Statuses : 4 pass(s)
    - Exec time: [0.09, 0.20] s

  * igt@xe_ccs@block-copy-compressed@tile4-compressed-compfmt0-system-vram01:
    - Statuses : 4 pass(s)
    - Exec time: [0.01, 0.10] s

  * igt@xe_ccs@block-copy-compressed@tile4-compressed-compfmt0-vram01-vram01:
    - Statuses : 4 pass(s)
    - Exec time: [0.09, 0.19] s

  * igt@xe_ccs@block-copy-compressed@tile64-compressed-compfmt0-system-vram01:
    - Statuses : 4 pass(s)
    - Exec time: [0.01, 0.10] s

  * igt@xe_ccs@block-copy-compressed@tile64-compressed-compfmt0-vram01-vram01:
    - Statuses : 4 pass(s)
    - Exec time: [0.09, 0.19] s

  * igt@xe_ccs@block-copy-compressed@xmajor-compressed-compfmt0-system-vram01:
    - Statuses : 4 pass(s)
    - Exec time: [0.02, 0.11] s

  * igt@xe_ccs@block-copy-compressed@xmajor-compressed-compfmt0-vram01-vram01:
    - Statuses : 4 pass(s)
    - Exec time: [0.09, 0.19] s

  * igt@xe_ccs@ctrl-surf-copy:
    - Statuses : 11 pass(s) 1 skip(s)
    - Exec time: [0.02, 1.72] s

  * igt@xe_ccs@ctrl-surf-copy@linear-compressed-compfmt0-system-vram01:
    - Statuses : 4 pass(s)
    - Exec time: [0.02, 0.11] s

  * igt@xe_ccs@ctrl-surf-copy@linear-compressed-compfmt0-vram01-vram01:
    - Statuses : 4 pass(s)
    - Exec time: [0.16, 0.29] s

  * igt@xe_ccs@ctrl-surf-copy@tile4-compressed-compfmt0-system-vram01:
    - Statuses : 4 pass(s)
    - Exec time: [0.02, 0.12] s

  * igt@xe_ccs@ctrl-surf-copy@tile4-compressed-compfmt0-vram01-vram01:
    - Statuses : 4 pass(s)
    - Exec time: [0.16, 0.28] s

  * igt@xe_ccs@ctrl-surf-copy@tile64-compressed-compfmt0-system-vram01:
    - Statuses : 4 pass(s)
    - Exec time: [0.02, 0.12] s

  * igt@xe_ccs@ctrl-surf-copy@tile64-compressed-compfmt0-vram01-vram01:
    - Statuses : 4 pass(s)
    - Exec time: [0.16, 0.28] s

  * igt@xe_ccs@ctrl-surf-copy@xmajor-compressed-compfmt0-system-vram01:
    - Statuses : 4 pass(s)
    - Exec time: [0.02, 0.12] s

  * igt@xe_ccs@ctrl-surf-copy@xmajor-compressed-compfmt0-vram01-vram01:
    - Statuses : 4 pass(s)
    - Exec time: [0.16, 0.28] s

  * igt@xe_exercise_blt@fast-copy:
    - Statuses : 12 pass(s)
    - Exec time: [0.08, 2.43] s

  * igt@xe_exercise_blt@fast-copy@linear-system-system:
    - Statuses : 12 pass(s)
    - Exec time: [0.02, 0.09] s

  * igt@xe_exercise_blt@fast-copy@linear-system-vram01:
    - Statuses : 4 pass(s)
    - Exec time: [0.02, 0.09] s

  * igt@xe_exercise_blt@fast-copy@linear-vram01-system:
    - Statuses : 4 pass(s)
    - Exec time: [0.10, 0.21] s

  * igt@xe_exercise_blt@fast-copy@linear-vram01-vram01:
    - Statuses : 4 pass(s)
    - Exec time: [0.10, 0.22] s

  * igt@xe_exercise_blt@fast-copy@tile4-system-system:
    - Statuses : 12 pass(s)
    - Exec time: [0.01, 0.09] s

  * igt@xe_exercise_blt@fast-copy@tile4-system-vram01:
    - Statuses : 4 pass(s)
    - Exec time: [0.01, 0.10] s

  * igt@xe_exercise_blt@fast-copy@tile4-vram01-system:
    - Statuses : 4 pass(s)
    - Exec time: [0.09, 0.17] s

  * igt@xe_exercise_blt@fast-copy@tile4-vram01-vram01:
    - Statuses : 4 pass(s)
    - Exec time: [0.09, 0.17] s

  * igt@xe_exercise_blt@fast-copy@tile64-system-system:
    - Statuses : 12 pass(s)
    - Exec time: [0.01, 0.09] s

  * igt@xe_exercise_blt@fast-copy@tile64-system-vram01:
    - Statuses : 4 pass(s)
    - Exec time: [0.01, 0.09] s

  * igt@xe_exercise_blt@fast-copy@tile64-vram01-system:
    - Statuses : 4 pass(s)
    - Exec time: [0.09, 0.18] s

  * igt@xe_exercise_blt@fast-copy@tile64-vram01-vram01:
    - Statuses : 4 pass(s)
    - Exec time: [0.08, 0.17] s

  * igt@xe_exercise_blt@fast-copy@xmajor-system-system:
    - Statuses : 11 pass(s)
    - Exec time: [0.01, 0.09] s

  * igt@xe_exercise_blt@fast-copy@xmajor-system-vram01:
    - Statuses : 4 pass(s)
    - Exec time: [0.02, 0.09] s

  * igt@xe_exercise_blt@fast-copy@xmajor-vram01-system:
    - Statuses : 4 pass(s)
    - Exec time: [0.11, 0.21] s

  * igt@xe_exercise_blt@fast-copy@xmajor-vram01-vram01:
    - Statuses : 4 pass(s)
    - Exec time: [0.10, 0.18] s

  * igt@xe_exercise_blt@fast-copy@ymajor-system-system:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_9008 -> IGTPW_15541

  IGTPW_15541: 15541
  IGT_9008: 9008
  xe-5417-fcaba3bc017906059b910ece3f83185e93010581: fcaba3bc017906059b910ece3f83185e93010581

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15541/index.html

--===============2009795649525289429==
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
<tr><td><b>Series:</b></td><td>tests/kms_hdr: Skip unsupported formats in bpc-switch test (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/166923/">https://patchwork.freedesktop.org/series/166923/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15541/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15541/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9008_BAT -&gt; XEIGTPW_15541_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_9008_BAT and XEIGTPW_15541_BAT:</p>
<h3>New IGT tests (36)</h3>
<ul>
<li>
<p>igt@xe_ccs@block-copy-compressed:</p>
<ul>
<li>Statuses : 11 pass(s) 1 skip(s)</li>
<li>Exec time: [0.01, 1.33] s</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@block-copy-compressed@linear-compressed-compfmt0-system-vram01:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.02, 0.14] s</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@block-copy-compressed@linear-compressed-compfmt0-vram01-vram01:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.09, 0.20] s</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@block-copy-compressed@tile4-compressed-compfmt0-system-vram01:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.01, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@block-copy-compressed@tile4-compressed-compfmt0-vram01-vram01:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.09, 0.19] s</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@block-copy-compressed@tile64-compressed-compfmt0-system-vram01:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.01, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@block-copy-compressed@tile64-compressed-compfmt0-vram01-vram01:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.09, 0.19] s</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@block-copy-compressed@xmajor-compressed-compfmt0-system-vram01:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.02, 0.11] s</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@block-copy-compressed@xmajor-compressed-compfmt0-vram01-vram01:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.09, 0.19] s</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@ctrl-surf-copy:</p>
<ul>
<li>Statuses : 11 pass(s) 1 skip(s)</li>
<li>Exec time: [0.02, 1.72] s</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@ctrl-surf-copy@linear-compressed-compfmt0-system-vram01:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.02, 0.11] s</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@ctrl-surf-copy@linear-compressed-compfmt0-vram01-vram01:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.16, 0.29] s</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@ctrl-surf-copy@tile4-compressed-compfmt0-system-vram01:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.02, 0.12] s</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@ctrl-surf-copy@tile4-compressed-compfmt0-vram01-vram01:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.16, 0.28] s</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@ctrl-surf-copy@tile64-compressed-compfmt0-system-vram01:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.02, 0.12] s</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@ctrl-surf-copy@tile64-compressed-compfmt0-vram01-vram01:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.16, 0.28] s</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@ctrl-surf-copy@xmajor-compressed-compfmt0-system-vram01:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.02, 0.12] s</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@ctrl-surf-copy@xmajor-compressed-compfmt0-vram01-vram01:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.16, 0.28] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy:</p>
<ul>
<li>Statuses : 12 pass(s)</li>
<li>Exec time: [0.08, 2.43] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy@linear-system-system:</p>
<ul>
<li>Statuses : 12 pass(s)</li>
<li>Exec time: [0.02, 0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy@linear-system-vram01:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.02, 0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy@linear-vram01-system:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.10, 0.21] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy@linear-vram01-vram01:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.10, 0.22] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy@tile4-system-system:</p>
<ul>
<li>Statuses : 12 pass(s)</li>
<li>Exec time: [0.01, 0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy@tile4-system-vram01:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.01, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy@tile4-vram01-system:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.09, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy@tile4-vram01-vram01:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.09, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy@tile64-system-system:</p>
<ul>
<li>Statuses : 12 pass(s)</li>
<li>Exec time: [0.01, 0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy@tile64-system-vram01:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.01, 0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy@tile64-vram01-system:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.09, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy@tile64-vram01-vram01:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.08, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy@xmajor-system-system:</p>
<ul>
<li>Statuses : 11 pass(s)</li>
<li>Exec time: [0.01, 0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy@xmajor-system-vram01:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.02, 0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy@xmajor-vram01-system:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.11, 0.21] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy@xmajor-vram01-vram01:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.10, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy@ymajor-system-system:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
</ul>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9008 -&gt; IGTPW_15541</li>
</ul>
<p>IGTPW_15541: 15541<br />
  IGT_9008: 9008<br />
  xe-5417-fcaba3bc017906059b910ece3f83185e93010581: fcaba3bc017906059b910ece3f83185e93010581</p>

</body>
</html>

--===============2009795649525289429==--
