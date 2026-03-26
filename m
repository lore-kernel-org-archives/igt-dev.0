Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6803FEA800
	for <igt-dev@archiver.kernel.org>; Thu, 26 Mar 2026 03:48:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D37C10E8FD;
	Thu, 26 Mar 2026 03:48:20 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 286E810E8FD;
 Thu, 26 Mar 2026 03:48:13 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7582872759736043134=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Fix_PSR_handling_for_multi-?=
 =?utf-8?q?eDP_systems_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jeevan B" <jeevan.b@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 26 Mar 2026 03:48:13 -0000
Message-ID: <177449689313.399092.9423337520863842103@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260325165140.115520-1-jeevan.b@intel.com>
In-Reply-To: <20260325165140.115520-1-jeevan.b@intel.com>
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

--===============7582872759736043134==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Fix PSR handling for multi-eDP systems (rev3)
URL   : https://patchwork.freedesktop.org/series/163667/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8831_BAT -> XEIGTPW_14857_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (14 -> 14)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_14857_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1:
    - bat-adlp-7:         [PASS][1] -> [DMESG-WARN][2] ([Intel XE#7483])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8831/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14857/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html

  
#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1:
    - bat-adlp-7:         [DMESG-WARN][3] ([Intel XE#7483]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8831/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14857/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html

  
  [Intel XE#7483]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7483


Build changes
-------------

  * IGT: IGT_8831 -> IGTPW_14857
  * Linux: xe-4787-3239a1a0a30dea3fe135700010ee4e41841877bc -> xe-4788-817e894dd8588c9eee61b1fbd743859ddba35f78

  IGTPW_14857: 81d37eabb59c5bd988f1f73bfe561c48b7e90b86 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8831: 8831
  xe-4787-3239a1a0a30dea3fe135700010ee4e41841877bc: 3239a1a0a30dea3fe135700010ee4e41841877bc
  xe-4788-817e894dd8588c9eee61b1fbd743859ddba35f78: 817e894dd8588c9eee61b1fbd743859ddba35f78

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14857/index.html

--===============7582872759736043134==
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
<tr><td><b>Series:</b></td><td>Fix PSR handling for multi-eDP systems (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/163667/">https://patchwork.freedesktop.org/series/163667/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14857/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14857/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8831_BAT -&gt; XEIGTPW_14857_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (14 -&gt; 14)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14857_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8831/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14857/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7483">Intel XE#7483</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8831/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7483">Intel XE#7483</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14857/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8831 -&gt; IGTPW_14857</li>
<li>Linux: xe-4787-3239a1a0a30dea3fe135700010ee4e41841877bc -&gt; xe-4788-817e894dd8588c9eee61b1fbd743859ddba35f78</li>
</ul>
<p>IGTPW_14857: 81d37eabb59c5bd988f1f73bfe561c48b7e90b86 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8831: 8831<br />
  xe-4787-3239a1a0a30dea3fe135700010ee4e41841877bc: 3239a1a0a30dea3fe135700010ee4e41841877bc<br />
  xe-4788-817e894dd8588c9eee61b1fbd743859ddba35f78: 817e894dd8588c9eee61b1fbd743859ddba35f78</p>

</body>
</html>

--===============7582872759736043134==--
