Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 775DBCA5FED
	for <igt-dev@archiver.kernel.org>; Tue,  6 Oct 2026 04:01:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22FB610E09E;
	Tue,  6 Oct 2026 04:01:45 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68A0910E09E;
 Tue,  6 Oct 2026 04:00:58 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8200896003334391576=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_add_coverage_for_xe=5Fpxp?=
 =?utf-8?q?=5Fdebugfs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: shivtej.eknath.patil@intel.com
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 06 Oct 2026 04:00:58 -0000
Message-ID: <179125925842.242416.15719580312571303109@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20261006031031.30938-1-shivtej.eknath.patil@intel.com>
In-Reply-To: <20261006031031.30938-1-shivtej.eknath.patil@intel.com>
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

--===============8200896003334391576==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: add coverage for xe_pxp_debugfs
URL   : https://patchwork.freedesktop.org/series/175588/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_9130_BAT -> XEIGTPW_15944_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (15 -> 15)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_15944_BAT:

### IGT changes ###

#### Possible regressions ####

  * {igt@xe_pxp@pxp-debugfs-info} (NEW):
    - bat-nvls-1:         NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15944/bat-nvls-1/igt@xe_pxp@pxp-debugfs-info.html
    - bat-nvls-2:         NOTRUN -> [SKIP][2]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15944/bat-nvls-2/igt@xe_pxp@pxp-debugfs-info.html
    - bat-ptl-vm:         NOTRUN -> [SKIP][3]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15944/bat-ptl-vm/igt@xe_pxp@pxp-debugfs-info.html
    - bat-atsm-2:         NOTRUN -> [SKIP][4]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15944/bat-atsm-2/igt@xe_pxp@pxp-debugfs-info.html

  
New tests
---------

  New tests have been introduced between XEIGT_9130_BAT and XEIGTPW_15944_BAT:

### New IGT tests (1) ###

  * igt@xe_pxp@pxp-debugfs-info:
    - Statuses : 6 pass(s) 8 skip(s)
    - Exec time: [0.0, 0.06] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_15944_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * {igt@xe_pxp@pxp-debugfs-info} (NEW):
    - bat-bmg-1:          NOTRUN -> [SKIP][5] ([Intel XE#4733])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15944/bat-bmg-1/igt@xe_pxp@pxp-debugfs-info.html
    - bat-bmg-vm:         NOTRUN -> [SKIP][6] ([Intel XE#4733])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15944/bat-bmg-vm/igt@xe_pxp@pxp-debugfs-info.html
    - bat-bmg-2:          NOTRUN -> [SKIP][7] ([Intel XE#4733])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15944/bat-bmg-2/igt@xe_pxp@pxp-debugfs-info.html
    - bat-adlp-7:         NOTRUN -> [SKIP][8] ([Intel XE#4733])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15944/bat-adlp-7/igt@xe_pxp@pxp-debugfs-info.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733


Build changes
-------------

  * IGT: IGT_9130 -> IGTPW_15944
  * Linux: xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b -> xe-5893-475230f9a51fc19f5097ddcbf94ebf3906d623d5

  IGTPW_15944: 15944
  IGT_9130: 9130
  xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b: c1341b7b7cec27ca50f287ec497e41a8cc88f22b
  xe-5893-475230f9a51fc19f5097ddcbf94ebf3906d623d5: 475230f9a51fc19f5097ddcbf94ebf3906d623d5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15944/index.html

--===============8200896003334391576==
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
<tr><td><b>Series:</b></td><td>add coverage for xe_pxp_debugfs</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/175588/">https://patchwork.freedesktop.org/series/175588/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15944/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15944/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9130_BAT -&gt; XEIGTPW_15944_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_15944_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>{igt@xe_pxp@pxp-debugfs-info} (NEW):<ul>
<li>bat-nvls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15944/bat-nvls-1/igt@xe_pxp@pxp-debugfs-info.html">SKIP</a></li>
<li>bat-nvls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15944/bat-nvls-2/igt@xe_pxp@pxp-debugfs-info.html">SKIP</a></li>
<li>bat-ptl-vm:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15944/bat-ptl-vm/igt@xe_pxp@pxp-debugfs-info.html">SKIP</a></li>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15944/bat-atsm-2/igt@xe_pxp@pxp-debugfs-info.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_9130_BAT and XEIGTPW_15944_BAT:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@xe_pxp@pxp-debugfs-info:<ul>
<li>Statuses : 6 pass(s) 8 skip(s)</li>
<li>Exec time: [0.0, 0.06] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_15944_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>{igt@xe_pxp@pxp-debugfs-info} (NEW):<ul>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15944/bat-bmg-1/igt@xe_pxp@pxp-debugfs-info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>)</li>
<li>bat-bmg-vm:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15944/bat-bmg-vm/igt@xe_pxp@pxp-debugfs-info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>)</li>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15944/bat-bmg-2/igt@xe_pxp@pxp-debugfs-info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>)</li>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15944/bat-adlp-7/igt@xe_pxp@pxp-debugfs-info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9130 -&gt; IGTPW_15944</li>
<li>Linux: xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b -&gt; xe-5893-475230f9a51fc19f5097ddcbf94ebf3906d623d5</li>
</ul>
<p>IGTPW_15944: 15944<br />
  IGT_9130: 9130<br />
  xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b: c1341b7b7cec27ca50f287ec497e41a8cc88f22b<br />
  xe-5893-475230f9a51fc19f5097ddcbf94ebf3906d623d5: 475230f9a51fc19f5097ddcbf94ebf3906d623d5</p>

</body>
</html>

--===============8200896003334391576==--
