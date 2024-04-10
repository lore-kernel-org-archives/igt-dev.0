Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DA54CD11C2
	for <igt-dev@archiver.kernel.org>; Wed, 10 Apr 2024 07:20:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30D2A113216;
	Wed, 10 Apr 2024 07:20:51 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DED3311320F;
 Wed, 10 Apr 2024 07:20:48 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7739995713911912045=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_enhancements_for_forcing_debug?=
 =?utf-8?q?fs_of_connector?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Joshi, Kunal1" <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 10 Apr 2024 07:20:48 -0000
Message-ID: <171273364890.1319548.1021090843632916921@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240410064426.1968399-1-kunal1.joshi@intel.com>
In-Reply-To: <20240410064426.1968399-1-kunal1.joshi@intel.com>
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

--===============7739995713911912045==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: enhancements for forcing debugfs of connector
URL   : https://patchwork.freedesktop.org/series/132249/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7803_BAT -> XEIGTPW_10996_BAT
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

  Here are the unknown changes that may have been introduced in XEIGTPW_10996_BAT:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_pipe_crc_basic@nonblocking-crc:
    - {bat-lnl-1}:        [PASS][1] -> [DMESG-WARN][2] +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7803/bat-lnl-1/igt@kms_pipe_crc_basic@nonblocking-crc.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10996/bat-lnl-1/igt@kms_pipe_crc_basic@nonblocking-crc.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_10996_BAT that come from known issues:

### IGT changes ###

  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886


Build changes
-------------

  * IGT: IGT_7803 -> IGTPW_10996
  * Linux: xe-1063-7be27f645de2f00384b862d2812a90675e8392fa -> xe-1064-057ec21a54cddd595a7725fa8731eb4c5bd5abff

  IGTPW_10996: 10996
  IGT_7803: 9669a17ae56f1dcd22ba4c5cb39b3cd334a46862 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1063-7be27f645de2f00384b862d2812a90675e8392fa: 7be27f645de2f00384b862d2812a90675e8392fa
  xe-1064-057ec21a54cddd595a7725fa8731eb4c5bd5abff: 057ec21a54cddd595a7725fa8731eb4c5bd5abff

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10996/index.html

--===============7739995713911912045==
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
<tr><td><b>Series:</b></td><td>enhancements for forcing debugfs of connector</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/132249/">https://patchwork.freedesktop.org/series/132249/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10996/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10996/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7803_BAT -&gt; XEIGTPW_10996_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_10996_BAT:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@kms_pipe_crc_basic@nonblocking-crc:<ul>
<li>{bat-lnl-1}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7803/bat-lnl-1/igt@kms_pipe_crc_basic@nonblocking-crc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10996/bat-lnl-1/igt@kms_pipe_crc_basic@nonblocking-crc.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_10996_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7803 -&gt; IGTPW_10996</li>
<li>Linux: xe-1063-7be27f645de2f00384b862d2812a90675e8392fa -&gt; xe-1064-057ec21a54cddd595a7725fa8731eb4c5bd5abff</li>
</ul>
<p>IGTPW_10996: 10996<br />
  IGT_7803: 9669a17ae56f1dcd22ba4c5cb39b3cd334a46862 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1063-7be27f645de2f00384b862d2812a90675e8392fa: 7be27f645de2f00384b862d2812a90675e8392fa<br />
  xe-1064-057ec21a54cddd595a7725fa8731eb4c5bd5abff: 057ec21a54cddd595a7725fa8731eb4c5bd5abff</p>

</body>
</html>

--===============7739995713911912045==--
