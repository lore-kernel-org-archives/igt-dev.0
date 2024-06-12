Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31853C27C53
	for <igt-dev@archiver.kernel.org>; Wed, 12 Jun 2024 12:31:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89A2D89ABE;
	Wed, 12 Jun 2024 12:31:56 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99EA689ABE;
 Wed, 12 Jun 2024 12:31:54 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6789236016030479181=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_Early_Transport_Support_=28rev?=
 =?utf-8?q?2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "B, Jeevan" <jeevan.b@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 12 Jun 2024 12:31:54 -0000
Message-ID: <171819551462.70996.8354670723275848444@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240612110645.1110374-1-jeevan.b@intel.com>
In-Reply-To: <20240612110645.1110374-1-jeevan.b@intel.com>
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

--===============6789236016030479181==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Early Transport Support (rev2)
URL   : https://patchwork.freedesktop.org/series/133804/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7883_BAT -> XEIGTPW_11253_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (5 -> 4)
------------------------------

  Missing    (1): bat-adlp-7 

Known issues
------------

  Here are the changes found in XEIGTPW_11253_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - {bat-lnl-1}:        [FAIL][1] ([Intel XE#886]) -> [PASS][2] +1 other test pass
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7883/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11253/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886


Build changes
-------------

  * IGT: IGT_7883 -> IGTPW_11253

  IGTPW_11253: 11253
  IGT_7883: ac1fbf274cec6210363758b76455a59dc5d89751 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1448-09046e0a510c58c3af08532a4af43668911b3826: 09046e0a510c58c3af08532a4af43668911b3826

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11253/index.html

--===============6789236016030479181==
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
<tr><td><b>Series:</b></td><td>Early Transport Support (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/133804/">https://patchwork.freedesktop.org/series/133804/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11253/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11253/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7883_BAT -&gt; XEIGTPW_11253_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 4)</h2>
<p>Missing    (1): bat-adlp-7 </p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11253_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-wf_vblank:<ul>
<li>{bat-lnl-1}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7883/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11253/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7883 -&gt; IGTPW_11253</li>
</ul>
<p>IGTPW_11253: 11253<br />
  IGT_7883: ac1fbf274cec6210363758b76455a59dc5d89751 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1448-09046e0a510c58c3af08532a4af43668911b3826: 09046e0a510c58c3af08532a4af43668911b3826</p>

</body>
</html>

--===============6789236016030479181==--
