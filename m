Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4759C36010
	for <igt-dev@archiver.kernel.org>; Fri, 11 Apr 2025 13:36:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 659AF10E031;
	Fri, 11 Apr 2025 13:36:07 +0000 (UTC)
Received: from 32c37dd7f93d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11B7310E031;
 Fri, 11 Apr 2025 13:36:06 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6715437994757598289=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel/kms=5Fjoiner=3A?=
 =?utf-8?q?_Fix_mode_handling_invalid_joiner_subtest?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Santhosh Reddy Guddati" <santhosh.reddy.guddati@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 11 Apr 2025 13:36:06 -0000
Message-ID: <174437856606.4396.15753084845426937015@32c37dd7f93d>
X-Patchwork-Hint: ignore
References: <20250411075225.2855770-1-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20250411075225.2855770-1-santhosh.reddy.guddati@intel.com>
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

--===============6715437994757598289==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/kms_joiner: Fix mode handling invalid joiner subtest
URL   : https://patchwork.freedesktop.org/series/147574/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8315_BAT -> XEIGTPW_12961_BAT
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with XEIGTPW_12961_BAT need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_12961_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_12961_BAT:

### IGT changes ###

#### Warnings ####

  * igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries:
    - bat-adlp-vf:        [ABORT][1] ([Intel XE#4747]) -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8315/bat-adlp-vf/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12961/bat-adlp-vf/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries.html

  
  [Intel XE#4747]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4747


Build changes
-------------

  * IGT: IGT_8315 -> IGTPW_12961
  * Linux: xe-2932-c56353870b17912f7d08fee2736fe7a740421b07 -> xe-2938-c44d660167f9445a3762810c9816f1bb80c32170

  IGTPW_12961: 12961
  IGT_8315: c85ef0df47b498f999b43dad6a5cc509228f953a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2932-c56353870b17912f7d08fee2736fe7a740421b07: c56353870b17912f7d08fee2736fe7a740421b07
  xe-2938-c44d660167f9445a3762810c9816f1bb80c32170: c44d660167f9445a3762810c9816f1bb80c32170

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12961/index.html

--===============6715437994757598289==
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
<tr><td><b>Series:</b></td><td>tests/intel/kms_joiner: Fix mode handling invalid joiner subtest</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/147574/">https://patchwork.freedesktop.org/series/147574/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12961/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12961/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8315_BAT -&gt; XEIGTPW_12961_BAT</h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with XEIGTPW_12961_BAT need to be verified<br />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_12961_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_12961_BAT:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8315/bat-adlp-vf/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4747">Intel XE#4747</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12961/bat-adlp-vf/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8315 -&gt; IGTPW_12961</li>
<li>Linux: xe-2932-c56353870b17912f7d08fee2736fe7a740421b07 -&gt; xe-2938-c44d660167f9445a3762810c9816f1bb80c32170</li>
</ul>
<p>IGTPW_12961: 12961<br />
  IGT_8315: c85ef0df47b498f999b43dad6a5cc509228f953a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2932-c56353870b17912f7d08fee2736fe7a740421b07: c56353870b17912f7d08fee2736fe7a740421b07<br />
  xe-2938-c44d660167f9445a3762810c9816f1bb80c32170: c44d660167f9445a3762810c9816f1bb80c32170</p>

</body>
</html>

--===============6715437994757598289==--
