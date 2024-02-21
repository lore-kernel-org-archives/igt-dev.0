Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D82C6C5478A
	for <igt-dev@archiver.kernel.org>; Wed, 21 Feb 2024 18:07:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A7D810E57C;
	Wed, 21 Feb 2024 18:07:08 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DB2210E57C;
 Wed, 21 Feb 2024 18:07:07 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0608896736695949696=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_introduce_Xe_multigpu_and_othe?=
 =?utf-8?q?r_multi-GPU_helpers_=28rev10=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kamil Konieczny" <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 21 Feb 2024 18:07:07 -0000
Message-ID: <170853882731.178729.1712492659872742781@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240221164637.116048-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20240221164637.116048-1-kamil.konieczny@linux.intel.com>
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

--===============0608896736695949696==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: introduce Xe multigpu and other multi-GPU helpers (rev10)
URL   : https://patchwork.freedesktop.org/series/129101/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7719_BAT -> XEIGTPW_10714_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_10714_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:
    - bat-pvc-2:          [INCOMPLETE][1] ([Intel XE#392]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7719/bat-pvc-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10714/bat-pvc-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html

  
  [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392


Build changes
-------------

  * IGT: IGT_7719 -> IGTPW_10714
  * Linux: xe-807-e2b02e89746d8eff8c244f938eecd0f1db8eb805 -> xe-818-53c127ff2eda902ff59370f44526e5e8ae49dec0

  IGTPW_10714: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10714/index.html
  IGT_7719: 7719
  xe-807-e2b02e89746d8eff8c244f938eecd0f1db8eb805: e2b02e89746d8eff8c244f938eecd0f1db8eb805
  xe-818-53c127ff2eda902ff59370f44526e5e8ae49dec0: 53c127ff2eda902ff59370f44526e5e8ae49dec0

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10714/index.html

--===============0608896736695949696==
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
<tr><td><b>Series:</b></td><td>introduce Xe multigpu and other multi-GPU helpers (rev10)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/129101/">https://patchwork.freedesktop.org/series/129101/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10714/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10714/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7719_BAT -&gt; XEIGTPW_10714_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_10714_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7719/bat-pvc-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10714/bat-pvc-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7719 -&gt; IGTPW_10714</li>
<li>Linux: xe-807-e2b02e89746d8eff8c244f938eecd0f1db8eb805 -&gt; xe-818-53c127ff2eda902ff59370f44526e5e8ae49dec0</li>
</ul>
<p>IGTPW_10714: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10714/index.html<br />
  IGT_7719: 7719<br />
  xe-807-e2b02e89746d8eff8c244f938eecd0f1db8eb805: e2b02e89746d8eff8c244f938eecd0f1db8eb805<br />
  xe-818-53c127ff2eda902ff59370f44526e5e8ae49dec0: 53c127ff2eda902ff59370f44526e5e8ae49dec0</p>

</body>
</html>

--===============0608896736695949696==--
