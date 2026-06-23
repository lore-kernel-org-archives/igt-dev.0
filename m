Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45453CDB46F
	for <igt-dev@archiver.kernel.org>; Tue, 23 Jun 2026 15:37:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3DEC10E19E;
	Tue, 23 Jun 2026 15:37:40 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A101A10E19E;
 Tue, 23 Jun 2026 15:37:14 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7937303072805067901=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_Rename_MultiQ_to_Multi-Qu?=
 =?utf-8?q?eue_in_docs_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: priyanka.dandamudi@intel.com
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 23 Jun 2026 15:37:14 -0000
Message-ID: <178222903465.106260.15725082973481220811@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260623111510.1651747-4-priyanka.dandamudi@intel.com>
In-Reply-To: <20260623111510.1651747-4-priyanka.dandamudi@intel.com>
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

--===============7937303072805067901==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Rename MultiQ to Multi-Queue in docs (rev2)
URL   : https://patchwork.freedesktop.org/series/168674/
State : success

== Summary ==

CI Bug Log - changes from IGT_8980 -> IGTPW_15428
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15428/index.html

Participating hosts (41 -> 39)
------------------------------

  Missing    (2): bat-dg2-13 fi-snb-2520m 

New tests
---------

  New tests have been introduced between IGT_8980 and IGTPW_15428:

### New IGT tests (10) ###

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-dp-2:
    - Statuses : 2 pass(s)
    - Exec time: [1.20, 1.36] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-d-edp-1:
    - Statuses : 3 pass(s)
    - Exec time: [2.79, 2.99] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-dp-2:
    - Statuses : 2 pass(s)
    - Exec time: [0.63, 0.68] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-edp-1:
    - Statuses : 3 pass(s)
    - Exec time: [1.48, 1.60] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-dp-2:
    - Statuses : 2 pass(s)
    - Exec time: [0.63, 0.67] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-edp-1:
    - Statuses : 3 pass(s)
    - Exec time: [1.50, 1.51] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-dp-2:
    - Statuses : 2 pass(s)
    - Exec time: [0.56, 0.62] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1:
    - Statuses : 3 pass(s)
    - Exec time: [1.39, 1.41] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-b-dp-2:
    - Statuses : 2 pass(s)
    - Exec time: [0.56, 0.61] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-d-edp-1:
    - Statuses : 3 pass(s)
    - Exec time: [1.40, 1.48] s

  


Changes
-------

  No changes found


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8980 -> IGTPW_15428

  CI-20190529: 20190529
  CI_DRM_18709: 60326b17f877e12846167bf8ef83680b9875218a @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15428: 15428
  IGT_8980: 65d820119e86b017bf801c8f2bb500e557b29d1c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15428/index.html

--===============7937303072805067901==
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
<tr><td><b>Series:</b></td><td>Rename MultiQ to Multi-Queue in docs (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/168674/">https://patchwork.freedesktop.org/series/168674/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15428/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15428/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8980 -&gt; IGTPW_15428</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15428/index.html</p>
<h2>Participating hosts (41 -&gt; 39)</h2>
<p>Missing    (2): bat-dg2-13 fi-snb-2520m </p>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_8980 and IGTPW_15428:</p>
<h3>New IGT tests (10)</h3>
<ul>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-dp-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.20, 1.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [2.79, 2.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-dp-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.63, 0.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.48, 1.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-dp-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.63, 0.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.50, 1.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-dp-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.56, 0.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.39, 1.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-b-dp-2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.56, 0.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.40, 1.48] s</li>
</ul>
</li>
</ul>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8980 -&gt; IGTPW_15428</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18709: 60326b17f877e12846167bf8ef83680b9875218a @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15428: 15428<br />
  IGT_8980: 65d820119e86b017bf801c8f2bb500e557b29d1c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============7937303072805067901==--
