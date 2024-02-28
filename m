Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0708DC47DD9
	for <igt-dev@archiver.kernel.org>; Wed, 28 Feb 2024 06:58:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B685E10E660;
	Wed, 28 Feb 2024 06:58:54 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA40310E660;
 Wed, 28 Feb 2024 06:58:53 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7433295655641578198=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_series_starting_with_=5Bi-g-t?=
 =?utf-8?q?=2Cv3=2C1/3=5D_lib/igt=5Fsysfs=3A_Use_same_var_for_sizeof=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 28 Feb 2024 06:58:53 -0000
Message-ID: <170910353395.356522.7075280389713451954@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240228063211.3662862-1-lucas.demarchi@intel.com>
In-Reply-To: <20240228063211.3662862-1-lucas.demarchi@intel.com>
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

--===============7433295655641578198==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,v3,1/3] lib/igt_sysfs: Use same var for sizeof()
URL   : https://patchwork.freedesktop.org/series/130475/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7731_BAT -> XEIGTPW_10746_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_10746_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_10746_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_10746_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_sysfs_scheduler@job_timeout_ms-invalid@bcs:
    - bat-pvc-2:          [PASS][1] -> [FAIL][2] +18 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7731/bat-pvc-2/igt@xe_sysfs_scheduler@job_timeout_ms-invalid@bcs.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10746/bat-pvc-2/igt@xe_sysfs_scheduler@job_timeout_ms-invalid@bcs.html

  * igt@xe_sysfs_scheduler@job_timeout_ms-min-max@rcs:
    - bat-dg2-oem2:       [PASS][3] -> [FAIL][4] +38 other tests fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7731/bat-dg2-oem2/igt@xe_sysfs_scheduler@job_timeout_ms-min-max@rcs.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10746/bat-dg2-oem2/igt@xe_sysfs_scheduler@job_timeout_ms-min-max@rcs.html

  * igt@xe_sysfs_scheduler@preempt_timeout_us-min-max@vcs:
    - bat-atsm-2:         [PASS][5] -> [FAIL][6] +38 other tests fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7731/bat-atsm-2/igt@xe_sysfs_scheduler@preempt_timeout_us-min-max@vcs.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10746/bat-atsm-2/igt@xe_sysfs_scheduler@preempt_timeout_us-min-max@vcs.html

  * igt@xe_sysfs_scheduler@preempt_timeout_us-min-max@vecs:
    - bat-adlp-7:         [PASS][7] -> [FAIL][8] +32 other tests fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7731/bat-adlp-7/igt@xe_sysfs_scheduler@preempt_timeout_us-min-max@vecs.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10746/bat-adlp-7/igt@xe_sysfs_scheduler@preempt_timeout_us-min-max@vecs.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_10746_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:
    - bat-dg2-oem2:       [DMESG-WARN][9] ([Intel XE#1009]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7731/bat-dg2-oem2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10746/bat-dg2-oem2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html

  * igt@xe_exec_threads@threads-basic:
    - bat-dg2-oem2:       [DMESG-WARN][11] ([Intel XE#1232]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7731/bat-dg2-oem2/igt@xe_exec_threads@threads-basic.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10746/bat-dg2-oem2/igt@xe_exec_threads@threads-basic.html

  * igt@xe_live_ktest@xe_migrate:
    - bat-dg2-oem2:       [SKIP][13] ([Intel XE#1192]) -> [PASS][14] +2 other tests pass
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7731/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10746/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html

  
  [Intel XE#1009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1009
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1232]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1232


Build changes
-------------

  * IGT: IGT_7731 -> IGTPW_10746
  * Linux: xe-851-3ffcc68ae900bd09bba64d4c9e0a9290ff4452b5 -> xe-863-269ea0ff7988bc743e1f66a928e778950eabf59c

  IGTPW_10746: 10746
  IGT_7731: 17f897a81868fb35c6a7033a8b07256659742248 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-851-3ffcc68ae900bd09bba64d4c9e0a9290ff4452b5: 3ffcc68ae900bd09bba64d4c9e0a9290ff4452b5
  xe-863-269ea0ff7988bc743e1f66a928e778950eabf59c: 269ea0ff7988bc743e1f66a928e778950eabf59c

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10746/index.html

--===============7433295655641578198==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,v3,1/3] lib/igt_sysfs: Use same var for sizeof()</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/130475/">https://patchwork.freedesktop.org/series/130475/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10746/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10746/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7731_BAT -&gt; XEIGTPW_10746_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_10746_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_10746_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_10746_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_sysfs_scheduler@job_timeout_ms-invalid@bcs:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7731/bat-pvc-2/igt@xe_sysfs_scheduler@job_timeout_ms-invalid@bcs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10746/bat-pvc-2/igt@xe_sysfs_scheduler@job_timeout_ms-invalid@bcs.html">FAIL</a> +18 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_scheduler@job_timeout_ms-min-max@rcs:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7731/bat-dg2-oem2/igt@xe_sysfs_scheduler@job_timeout_ms-min-max@rcs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10746/bat-dg2-oem2/igt@xe_sysfs_scheduler@job_timeout_ms-min-max@rcs.html">FAIL</a> +38 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_scheduler@preempt_timeout_us-min-max@vcs:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7731/bat-atsm-2/igt@xe_sysfs_scheduler@preempt_timeout_us-min-max@vcs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10746/bat-atsm-2/igt@xe_sysfs_scheduler@preempt_timeout_us-min-max@vcs.html">FAIL</a> +38 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_scheduler@preempt_timeout_us-min-max@vecs:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7731/bat-adlp-7/igt@xe_sysfs_scheduler@preempt_timeout_us-min-max@vecs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10746/bat-adlp-7/igt@xe_sysfs_scheduler@preempt_timeout_us-min-max@vecs.html">FAIL</a> +32 other tests fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_10746_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7731/bat-dg2-oem2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1009">Intel XE#1009</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10746/bat-dg2-oem2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-basic:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7731/bat-dg2-oem2/igt@xe_exec_threads@threads-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1232">Intel XE#1232</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10746/bat-dg2-oem2/igt@xe_exec_threads@threads-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7731/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10746/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7731 -&gt; IGTPW_10746</li>
<li>Linux: xe-851-3ffcc68ae900bd09bba64d4c9e0a9290ff4452b5 -&gt; xe-863-269ea0ff7988bc743e1f66a928e778950eabf59c</li>
</ul>
<p>IGTPW_10746: 10746<br />
  IGT_7731: 17f897a81868fb35c6a7033a8b07256659742248 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-851-3ffcc68ae900bd09bba64d4c9e0a9290ff4452b5: 3ffcc68ae900bd09bba64d4c9e0a9290ff4452b5<br />
  xe-863-269ea0ff7988bc743e1f66a928e778950eabf59c: 269ea0ff7988bc743e1f66a928e778950eabf59c</p>

</body>
</html>

--===============7433295655641578198==--
