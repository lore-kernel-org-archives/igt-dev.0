Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BEB0CF397B
	for <igt-dev@archiver.kernel.org>; Fri, 20 Sep 2024 01:13:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42B5910E2C7;
	Fri, 20 Sep 2024 01:13:23 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9A9610E781;
 Fri, 20 Sep 2024 01:13:21 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0173249229326833822=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_lib/igt=5Fkmod=3A_Rewrite_xe_u?=
 =?utf-8?q?nload_logic_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 20 Sep 2024 01:13:21 -0000
Message-ID: <172679480175.1048393.7640612822418661317@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240919151130.1410357-1-lucas.demarchi@intel.com>
In-Reply-To: <20240919151130.1410357-1-lucas.demarchi@intel.com>
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

--===============0173249229326833822==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/igt_kmod: Rewrite xe unload logic (rev2)
URL   : https://patchwork.freedesktop.org/series/138676/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8028_BAT -> XEIGTPW_11766_BAT
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

  Here are the changes found in XEIGTPW_11766_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - bat-lnl-1:          [FAIL][1] ([Intel XE#886]) -> [PASS][2] +1 other test pass
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8028/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11766/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html

  
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886


Build changes
-------------

  * IGT: IGT_8028 -> IGTPW_11766
  * Linux: xe-1971-2141344f9b4f0bcd6bb20a45afaef94209743c0d -> xe-1972-d4340c1de6d417c7b3edac187c3af011b146701a

  IGTPW_11766: 11766
  IGT_8028: 8028
  xe-1971-2141344f9b4f0bcd6bb20a45afaef94209743c0d: 2141344f9b4f0bcd6bb20a45afaef94209743c0d
  xe-1972-d4340c1de6d417c7b3edac187c3af011b146701a: d4340c1de6d417c7b3edac187c3af011b146701a

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11766/index.html

--===============0173249229326833822==
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
<tr><td><b>Series:</b></td><td>lib/igt_kmod: Rewrite xe unload logic (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/138676/">https://patchwork.freedesktop.org/series/138676/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11766/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11766/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8028_BAT -&gt; XEIGTPW_11766_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11766_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-wf_vblank:<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8028/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11766/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8028 -&gt; IGTPW_11766</li>
<li>Linux: xe-1971-2141344f9b4f0bcd6bb20a45afaef94209743c0d -&gt; xe-1972-d4340c1de6d417c7b3edac187c3af011b146701a</li>
</ul>
<p>IGTPW_11766: 11766<br />
  IGT_8028: 8028<br />
  xe-1971-2141344f9b4f0bcd6bb20a45afaef94209743c0d: 2141344f9b4f0bcd6bb20a45afaef94209743c0d<br />
  xe-1972-d4340c1de6d417c7b3edac187c3af011b146701a: d4340c1de6d417c7b3edac187c3af011b146701a</p>

</body>
</html>

--===============0173249229326833822==--
