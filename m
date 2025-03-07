Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F04B1C19F32
	for <igt-dev@archiver.kernel.org>; Fri,  7 Mar 2025 07:42:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAD1910EA30;
	Fri,  7 Mar 2025 07:42:12 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8359F10EA30;
 Fri,  7 Mar 2025 07:42:11 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6597688408400596848=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Xe=3A_Add_tests_for_PXP_=28?=
 =?utf-8?q?rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 07 Mar 2025 07:42:11 -0000
Message-ID: <174133333153.380.3709250283392942920@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250305233951.3488609-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20250305233951.3488609-1-daniele.ceraolospurio@intel.com>
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

--===============6597688408400596848==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Xe: Add tests for PXP (rev6)
URL   : https://patchwork.freedesktop.org/series/142450/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8264_BAT -> XEIGTPW_12724_BAT
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

  Here are the changes found in XEIGTPW_12724_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_vm@munmap-style-unbind-userptr-front:
    - bat-adlp-vf:        [PASS][1] -> [ABORT][2] ([Intel XE#4491])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8264/bat-adlp-vf/igt@xe_vm@munmap-style-unbind-userptr-front.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12724/bat-adlp-vf/igt@xe_vm@munmap-style-unbind-userptr-front.html

  
  [Intel XE#4491]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4491


Build changes
-------------

  * IGT: IGT_8264 -> IGTPW_12724
  * Linux: xe-2769-6f2e5afc45e3ca8bf46427ae21a9c1029ea6cdb3 -> xe-2772-eee1c40efa14a88232f68ca31fc341f34fb7cf7b

  IGTPW_12724: 12724
  IGT_8264: 8264
  xe-2769-6f2e5afc45e3ca8bf46427ae21a9c1029ea6cdb3: 6f2e5afc45e3ca8bf46427ae21a9c1029ea6cdb3
  xe-2772-eee1c40efa14a88232f68ca31fc341f34fb7cf7b: eee1c40efa14a88232f68ca31fc341f34fb7cf7b

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12724/index.html

--===============6597688408400596848==
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
<tr><td><b>Series:</b></td><td>Xe: Add tests for PXP (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/142450/">https://patchwork.freedesktop.org/series/142450/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12724/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12724/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8264_BAT -&gt; XEIGTPW_12724_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12724_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_vm@munmap-style-unbind-userptr-front:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8264/bat-adlp-vf/igt@xe_vm@munmap-style-unbind-userptr-front.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12724/bat-adlp-vf/igt@xe_vm@munmap-style-unbind-userptr-front.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4491">Intel XE#4491</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8264 -&gt; IGTPW_12724</li>
<li>Linux: xe-2769-6f2e5afc45e3ca8bf46427ae21a9c1029ea6cdb3 -&gt; xe-2772-eee1c40efa14a88232f68ca31fc341f34fb7cf7b</li>
</ul>
<p>IGTPW_12724: 12724<br />
  IGT_8264: 8264<br />
  xe-2769-6f2e5afc45e3ca8bf46427ae21a9c1029ea6cdb3: 6f2e5afc45e3ca8bf46427ae21a9c1029ea6cdb3<br />
  xe-2772-eee1c40efa14a88232f68ca31fc341f34fb7cf7b: eee1c40efa14a88232f68ca31fc341f34fb7cf7b</p>

</body>
</html>

--===============6597688408400596848==--
