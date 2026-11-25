Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E59C606A323
	for <igt-dev@archiver.kernel.org>; Wed, 25 Nov 2026 22:35:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BF6810E2F9;
	Wed, 25 Nov 2026 22:35:08 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DA4510E2F9;
 Wed, 25 Nov 2026 22:34:07 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1463383156216227875=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_series_starting_with_=5Bi-g?=
 =?utf-8?q?-t=2Cv2=2C1/2=5D_tests/kms=5Fsetmode=3A_Fix_previous_crtc_mode_lo?=
 =?utf-8?q?okup_in_joiner_check?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karthik B S" <karthik.b.s@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 25 Nov 2026 22:34:07 -0000
Message-ID: <179564604744.87820.9121533073281930762@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261125102352.1905996-1-karthik.b.s@intel.com>
In-Reply-To: <20261125102352.1905996-1-karthik.b.s@intel.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-1.0 required=3.0 tests=BAYES_00,HTML_MESSAGE,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============1463383156216227875==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,v2,1/2] tests/kms_setmode: Fix previous crtc mode lookup in joiner check
URL   : https://patchwork.freedesktop.org/series/179626/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_9204_BAT -> XEIGTPW_16216_BAT
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

  Here are the changes found in XEIGTPW_16216_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-bmg-1:          [PASS][1] -> [ABORT][2] ([Intel XE#9841])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9204/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16216/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html

  
  [Intel XE#9841]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9841


Build changes
-------------

  * IGT: IGT_9204 -> IGTPW_16216
  * Linux: xe-6232-ad6614dbc84cd68a4bff21a5d166f2894db7ae2b -> xe-6236-01f73ffa8189526c8c33d591371ea89803fa6e2e

  IGTPW_16216: 16216
  IGT_9204: 52e9317c945f97f29fbec75be29280fc7b00cf32 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-6232-ad6614dbc84cd68a4bff21a5d166f2894db7ae2b: ad6614dbc84cd68a4bff21a5d166f2894db7ae2b
  xe-6236-01f73ffa8189526c8c33d591371ea89803fa6e2e: 01f73ffa8189526c8c33d591371ea89803fa6e2e

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16216/index.html

--===============1463383156216227875==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,v2,1/2] tests/kms_setmode: Fix previous crtc mode lookup in joiner check</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/179626/">https://patchwork.freedesktop.org/series/179626/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16216/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16216/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9204_BAT -&gt; XEIGTPW_16216_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (14 -&gt; 14)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_16216_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@core_hotunplug@unbind-rebind:<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9204/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16216/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9841">Intel XE#9841</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9204 -&gt; IGTPW_16216</li>
<li>Linux: xe-6232-ad6614dbc84cd68a4bff21a5d166f2894db7ae2b -&gt; xe-6236-01f73ffa8189526c8c33d591371ea89803fa6e2e</li>
</ul>
<p>IGTPW_16216: 16216<br />
  IGT_9204: 52e9317c945f97f29fbec75be29280fc7b00cf32 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-6232-ad6614dbc84cd68a4bff21a5d166f2894db7ae2b: ad6614dbc84cd68a4bff21a5d166f2894db7ae2b<br />
  xe-6236-01f73ffa8189526c8c33d591371ea89803fa6e2e: 01f73ffa8189526c8c33d591371ea89803fa6e2e</p>

</body>
</html>

--===============1463383156216227875==--
