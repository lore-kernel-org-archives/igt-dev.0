Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 867ABFEFB51
	for <igt-dev@archiver.kernel.org>; Fri, 27 Feb 2026 20:55:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 361B310E0FC;
	Fri, 27 Feb 2026 20:55:18 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41B5810E0FC;
 Fri, 27 Feb 2026 20:55:17 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2187469121009578491=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Feudebug=3A?=
 =?utf-8?q?_Add_basic-vm-bind-ufence-no-ack_test?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jan Maslak" <jan.maslak@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 27 Feb 2026 20:55:17 -0000
Message-ID: <177222571724.297701.17059729681176152689@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260227142638.3264013-1-jan.maslak@intel.com>
In-Reply-To: <20260227142638.3264013-1-jan.maslak@intel.com>
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

--===============2187469121009578491==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_eudebug: Add basic-vm-bind-ufence-no-ack test
URL   : https://patchwork.freedesktop.org/series/162325/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8775_BAT -> XEIGTPW_14635_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 14)
------------------------------

  Additional (1): bat-bmg-3 

Known issues
------------

  Here are the changes found in XEIGTPW_14635_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:
    - bat-bmg-3:          NOTRUN -> [SKIP][1] ([Intel XE#6566]) +3 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14635/bat-bmg-3/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html

  
#### Possible fixes ####

  * igt@xe_waitfence@abstime:
    - bat-atsm-2:         [TIMEOUT][2] ([Intel XE#6506]) -> [PASS][3]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8775/bat-atsm-2/igt@xe_waitfence@abstime.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14635/bat-atsm-2/igt@xe_waitfence@abstime.html

  
  [Intel XE#6506]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506
  [Intel XE#6566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6566


Build changes
-------------

  * IGT: IGT_8775 -> IGTPW_14635
  * Linux: xe-4632-568403859ba7182ce2a59553664b34d58467adeb -> xe-4635-a0a6a2fc5a08dc2e936c43e5d181dd0975a251a1

  IGTPW_14635: ab5f5a0261dd8a34760af1774d886162e843d728 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8775: 8775
  xe-4632-568403859ba7182ce2a59553664b34d58467adeb: 568403859ba7182ce2a59553664b34d58467adeb
  xe-4635-a0a6a2fc5a08dc2e936c43e5d181dd0975a251a1: a0a6a2fc5a08dc2e936c43e5d181dd0975a251a1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14635/index.html

--===============2187469121009578491==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_eudebug: Add basic-vm-bind-ufence-no-ack test</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/162325/">https://patchwork.freedesktop.org/series/162325/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14635/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14635/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8775_BAT -&gt; XEIGTPW_14635_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 14)</h2>
<p>Additional (1): bat-bmg-3 </p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14635_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:<ul>
<li>bat-bmg-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14635/bat-bmg-3/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6566">Intel XE#6566</a>) +3 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_waitfence@abstime:<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8775/bat-atsm-2/igt@xe_waitfence@abstime.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506">Intel XE#6506</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14635/bat-atsm-2/igt@xe_waitfence@abstime.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8775 -&gt; IGTPW_14635</li>
<li>Linux: xe-4632-568403859ba7182ce2a59553664b34d58467adeb -&gt; xe-4635-a0a6a2fc5a08dc2e936c43e5d181dd0975a251a1</li>
</ul>
<p>IGTPW_14635: ab5f5a0261dd8a34760af1774d886162e843d728 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8775: 8775<br />
  xe-4632-568403859ba7182ce2a59553664b34d58467adeb: 568403859ba7182ce2a59553664b34d58467adeb<br />
  xe-4635-a0a6a2fc5a08dc2e936c43e5d181dd0975a251a1: a0a6a2fc5a08dc2e936c43e5d181dd0975a251a1</p>

</body>
</html>

--===============2187469121009578491==--
