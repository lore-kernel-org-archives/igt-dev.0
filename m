Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDF29CA101F
	for <igt-dev@archiver.kernel.org>; Wed, 10 Sep 2025 11:04:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D9E610E2D5;
	Wed, 10 Sep 2025 11:04:26 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87EDA10E2D5;
 Wed, 10 Sep 2025 11:04:25 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4888695435243670100=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Reduce_simulation_runtime?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Swati Sharma" <swati2.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 10 Sep 2025 11:04:25 -0000
Message-ID: <175750226555.321411.14437761196509920859@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250910090059.351698-1-swati2.sharma@intel.com>
In-Reply-To: <20250910090059.351698-1-swati2.sharma@intel.com>
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

--===============4888695435243670100==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Reduce simulation runtime
URL   : https://patchwork.freedesktop.org/series/154316/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8530_BAT -> XEIGTPW_13719_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_13719_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-plain-flip@d-edp1:
    - bat-adlp-7:         [PASS][1] -> [DMESG-WARN][2] ([Intel XE#4543]) +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8530/bat-adlp-7/igt@kms_flip@basic-plain-flip@d-edp1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13719/bat-adlp-7/igt@kms_flip@basic-plain-flip@d-edp1.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#5783]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5783


Build changes
-------------

  * IGT: IGT_8530 -> IGTPW_13719
  * Linux: xe-3716-0c2a2d0297af2a2a439b63b1e56e4d57c039dabb -> xe-3717-7e108295b43fdb2cd8faa3f992fdabafcaf7d2d5

  IGTPW_13719: 13719
  IGT_8530: 8530
  xe-3716-0c2a2d0297af2a2a439b63b1e56e4d57c039dabb: 0c2a2d0297af2a2a439b63b1e56e4d57c039dabb
  xe-3717-7e108295b43fdb2cd8faa3f992fdabafcaf7d2d5: 7e108295b43fdb2cd8faa3f992fdabafcaf7d2d5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13719/index.html

--===============4888695435243670100==
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
<tr><td><b>Series:</b></td><td>Reduce simulation runtime</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/154316/">https://patchwork.freedesktop.org/series/154316/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13719/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13719/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8530_BAT -&gt; XEIGTPW_13719_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_13719_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_flip@basic-plain-flip@d-edp1:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8530/bat-adlp-7/igt@kms_flip@basic-plain-flip@d-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13719/bat-adlp-7/igt@kms_flip@basic-plain-flip@d-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8530 -&gt; IGTPW_13719</li>
<li>Linux: xe-3716-0c2a2d0297af2a2a439b63b1e56e4d57c039dabb -&gt; xe-3717-7e108295b43fdb2cd8faa3f992fdabafcaf7d2d5</li>
</ul>
<p>IGTPW_13719: 13719<br />
  IGT_8530: 8530<br />
  xe-3716-0c2a2d0297af2a2a439b63b1e56e4d57c039dabb: 0c2a2d0297af2a2a439b63b1e56e4d57c039dabb<br />
  xe-3717-7e108295b43fdb2cd8faa3f992fdabafcaf7d2d5: 7e108295b43fdb2cd8faa3f992fdabafcaf7d2d5</p>

</body>
</html>

--===============4888695435243670100==--
