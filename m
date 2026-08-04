Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D765CC55822
	for <igt-dev@archiver.kernel.org>; Tue,  4 Aug 2026 16:40:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CE9910E5DA;
	Tue,  4 Aug 2026 16:40:46 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D861C10E5DA;
 Tue,  4 Aug 2026 16:40:10 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0539744993308269066=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_xe=5Fexec=5Fsystem=5Falloca?=
 =?utf-8?q?tor=3A_fix_MADVISE=5FMULTI=5FVMA_and_PREFETCH=5FSAME=5FATTR_bo=5F?=
 =?utf-8?q?size_for_PVC?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jia Yao" <jia.yao@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 04 Aug 2026 16:40:10 -0000
Message-ID: <178586161087.18879.1241817979588240527@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260803212549.108737-1-jia.yao@intel.com>
In-Reply-To: <20260803212549.108737-1-jia.yao@intel.com>
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

--===============0539744993308269066==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: xe_exec_system_allocator: fix MADVISE_MULTI_VMA and PREFETCH_SAME_ATTR bo_size for PVC
URL   : https://patchwork.freedesktop.org/series/171532/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_9036_BAT -> XEIGTPW_15625_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (12 -> 14)
------------------------------

  Additional (2): bat-nvls-2 bat-nvls-1 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_15625_BAT:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_addfb_basic@bad-pitch-0:
    - {bat-nvls-1}:       NOTRUN -> [SKIP][1] +105 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15625/bat-nvls-1/igt@kms_addfb_basic@bad-pitch-0.html

  * igt@kms_pipe_crc_basic@nonblocking-crc:
    - {bat-nvls-2}:       NOTRUN -> [SKIP][2] +105 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15625/bat-nvls-2/igt@kms_pipe_crc_basic@nonblocking-crc.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).



Build changes
-------------

  * IGT: IGT_9036 -> IGTPW_15625
  * Linux: xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a -> xe-5541-11c46820ac5b8e1451b8d0c0b82d2b9b0b0f9e1e

  IGTPW_15625: f5175bc162e983bd1f4a956b209266296ba4a9fb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9036: 9036
  xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a: f9ef9f302ee01854066ec6da30550da6ea6cb03a
  xe-5541-11c46820ac5b8e1451b8d0c0b82d2b9b0b0f9e1e: 11c46820ac5b8e1451b8d0c0b82d2b9b0b0f9e1e

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15625/index.html

--===============0539744993308269066==
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
<tr><td><b>Series:</b></td><td>xe_exec_system_allocator: fix MADVISE_MULTI_VMA and PREFETCH_SAME_ATTR bo_size for PVC</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/171532/">https://patchwork.freedesktop.org/series/171532/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15625/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15625/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9036_BAT -&gt; XEIGTPW_15625_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 14)</h2>
<p>Additional (2): bat-nvls-2 bat-nvls-1 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_15625_BAT:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_addfb_basic@bad-pitch-0:</p>
<ul>
<li>{bat-nvls-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15625/bat-nvls-1/igt@kms_addfb_basic@bad-pitch-0.html">SKIP</a> +105 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc:</p>
<ul>
<li>{bat-nvls-2}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15625/bat-nvls-2/igt@kms_pipe_crc_basic@nonblocking-crc.html">SKIP</a> +105 other tests skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9036 -&gt; IGTPW_15625</li>
<li>Linux: xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a -&gt; xe-5541-11c46820ac5b8e1451b8d0c0b82d2b9b0b0f9e1e</li>
</ul>
<p>IGTPW_15625: f5175bc162e983bd1f4a956b209266296ba4a9fb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9036: 9036<br />
  xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a: f9ef9f302ee01854066ec6da30550da6ea6cb03a<br />
  xe-5541-11c46820ac5b8e1451b8d0c0b82d2b9b0b0f9e1e: 11c46820ac5b8e1451b8d0c0b82d2b9b0b0f9e1e</p>

</body>
</html>

--===============0539744993308269066==--
