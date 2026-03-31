Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31A3DFF60C5
	for <igt-dev@archiver.kernel.org>; Tue, 31 Mar 2026 04:11:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C86F310E24A;
	Tue, 31 Mar 2026 04:11:42 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EE8710E24A;
 Tue, 31 Mar 2026 04:11:35 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============9002611148692615904=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Fpmu=3A_Gua?=
 =?utf-8?q?rd_engine_accuracy_tests_against_busy_DRM_clients?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Soham Purkait" <soham.purkait@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 31 Mar 2026 04:11:35 -0000
Message-ID: <177493029557.415443.9113263499670729130@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260330153916.2474178-1-soham.purkait@intel.com>
In-Reply-To: <20260330153916.2474178-1-soham.purkait@intel.com>
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

--===============9002611148692615904==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_pmu: Guard engine accuracy tests against busy DRM clients
URL   : https://patchwork.freedesktop.org/series/164106/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8836_BAT -> XEIGTPW_14887_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (12 -> 12)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_14887_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_pmu@engine-activity-accuracy-2@engine-drm_xe_engine_class_video_enhance1:
    - bat-bmg-2:          NOTRUN -> [DMESG-WARN][1] ([Intel XE#7433]) +5 other tests dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14887/bat-bmg-2/igt@xe_pmu@engine-activity-accuracy-2@engine-drm_xe_engine_class_video_enhance1.html

  * igt@xe_pmu@engine-activity-accuracy-90:
    - bat-bmg-1:          NOTRUN -> [DMESG-WARN][2] ([Intel XE#7433]) +5 other tests dmesg-warn
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14887/bat-bmg-1/igt@xe_pmu@engine-activity-accuracy-90.html

  
  [Intel XE#7433]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7433


Build changes
-------------

  * IGT: IGT_8836 -> IGTPW_14887
  * Linux: xe-4822-169e5b6f809026c4a0cb3a736b48378ca8e8fecb -> xe-4824-8d31b64e763bc1c7b508ae3dc01b4dfcab973729

  IGTPW_14887: 14887
  IGT_8836: 8836
  xe-4822-169e5b6f809026c4a0cb3a736b48378ca8e8fecb: 169e5b6f809026c4a0cb3a736b48378ca8e8fecb
  xe-4824-8d31b64e763bc1c7b508ae3dc01b4dfcab973729: 8d31b64e763bc1c7b508ae3dc01b4dfcab973729

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14887/index.html

--===============9002611148692615904==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_pmu: Guard engine accuracy tests against busy DRM clients</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/164106/">https://patchwork.freedesktop.org/series/164106/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14887/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14887/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8836_BAT -&gt; XEIGTPW_14887_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14887_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_pmu@engine-activity-accuracy-2@engine-drm_xe_engine_class_video_enhance1:</p>
<ul>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14887/bat-bmg-2/igt@xe_pmu@engine-activity-accuracy-2@engine-drm_xe_engine_class_video_enhance1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7433">Intel XE#7433</a>) +5 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-accuracy-90:</p>
<ul>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14887/bat-bmg-1/igt@xe_pmu@engine-activity-accuracy-90.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7433">Intel XE#7433</a>) +5 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8836 -&gt; IGTPW_14887</li>
<li>Linux: xe-4822-169e5b6f809026c4a0cb3a736b48378ca8e8fecb -&gt; xe-4824-8d31b64e763bc1c7b508ae3dc01b4dfcab973729</li>
</ul>
<p>IGTPW_14887: 14887<br />
  IGT_8836: 8836<br />
  xe-4822-169e5b6f809026c4a0cb3a736b48378ca8e8fecb: 169e5b6f809026c4a0cb3a736b48378ca8e8fecb<br />
  xe-4824-8d31b64e763bc1c7b508ae3dc01b4dfcab973729: 8d31b64e763bc1c7b508ae3dc01b4dfcab973729</p>

</body>
</html>

--===============9002611148692615904==--
