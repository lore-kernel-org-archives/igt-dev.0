Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BB8AC3DA41
	for <igt-dev@archiver.kernel.org>; Wed, 10 Jul 2024 12:38:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F090D10E77F;
	Wed, 10 Jul 2024 12:38:04 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A915E10E77B;
 Wed, 10 Jul 2024 12:38:04 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0794880702024212708=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_Runtime_alteration_of_debuglog?=
 =?utf-8?q?_level_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Pranay Samala" <pranay.samala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 10 Jul 2024 12:38:04 -0000
Message-ID: <172061508468.105350.9033373909840456776@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240710084358.744278-1-pranay.samala@intel.com>
In-Reply-To: <20240710084358.744278-1-pranay.samala@intel.com>
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

--===============0794880702024212708==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Runtime alteration of debuglog level (rev2)
URL   : https://patchwork.freedesktop.org/series/135823/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7921_BAT -> XEIGTPW_11391_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (7 -> 7)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_11391_BAT:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@xe_evict@evict-small-cm:
    - {bat-lnl-2}:        [SKIP][1] ([Intel XE#688]) -> [SKIP][2] +15 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7921/bat-lnl-2/igt@xe_evict@evict-small-cm.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11391/bat-lnl-2/igt@xe_evict@evict-small-cm.html

  * igt@xe_pat@pat-index-xelp:
    - {bat-bmg-1}:        [SKIP][3] ([Intel XE#2237]) -> [SKIP][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7921/bat-bmg-1/igt@xe_pat@pat-index-xelp.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11391/bat-bmg-1/igt@xe_pat@pat-index-xelp.html
    - {bat-lnl-2}:        [SKIP][5] ([Intel XE#2237]) -> [SKIP][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7921/bat-lnl-2/igt@xe_pat@pat-index-xelp.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11391/bat-lnl-2/igt@xe_pat@pat-index-xelp.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_11391_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [DMESG-FAIL][7] ([Intel XE#324]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7921/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11391/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#2237]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2237
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688


Build changes
-------------

  * IGT: IGT_7921 -> IGTPW_11391
  * Linux: xe-1586-b6ed1eaff9eef6a887583c6beccf426c06a61aa7 -> xe-1588-dcbd1ba3189efd3be0e0dacfdc37cada014c38eb

  IGTPW_11391: 11391
  IGT_7921: f547de980dca43c6630ced36e98af7f2a9c70ae7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1586-b6ed1eaff9eef6a887583c6beccf426c06a61aa7: b6ed1eaff9eef6a887583c6beccf426c06a61aa7
  xe-1588-dcbd1ba3189efd3be0e0dacfdc37cada014c38eb: dcbd1ba3189efd3be0e0dacfdc37cada014c38eb

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11391/index.html

--===============0794880702024212708==
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
<tr><td><b>Series:</b></td><td>Runtime alteration of debuglog level (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/135823/">https://patchwork.freedesktop.org/series/135823/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11391/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11391/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7921_BAT -&gt; XEIGTPW_11391_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_11391_BAT:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@xe_evict@evict-small-cm:</p>
<ul>
<li>{bat-lnl-2}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7921/bat-lnl-2/igt@xe_evict@evict-small-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11391/bat-lnl-2/igt@xe_evict@evict-small-cm.html">SKIP</a> +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>{bat-bmg-1}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7921/bat-bmg-1/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2237">Intel XE#2237</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11391/bat-bmg-1/igt@xe_pat@pat-index-xelp.html">SKIP</a></li>
<li>{bat-lnl-2}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7921/bat-lnl-2/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2237">Intel XE#2237</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11391/bat-lnl-2/igt@xe_pat@pat-index-xelp.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11391_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_frontbuffer_tracking@basic:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7921/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11391/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7921 -&gt; IGTPW_11391</li>
<li>Linux: xe-1586-b6ed1eaff9eef6a887583c6beccf426c06a61aa7 -&gt; xe-1588-dcbd1ba3189efd3be0e0dacfdc37cada014c38eb</li>
</ul>
<p>IGTPW_11391: 11391<br />
  IGT_7921: f547de980dca43c6630ced36e98af7f2a9c70ae7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1586-b6ed1eaff9eef6a887583c6beccf426c06a61aa7: b6ed1eaff9eef6a887583c6beccf426c06a61aa7<br />
  xe-1588-dcbd1ba3189efd3be0e0dacfdc37cada014c38eb: dcbd1ba3189efd3be0e0dacfdc37cada014c38eb</p>

</body>
</html>

--===============0794880702024212708==--
