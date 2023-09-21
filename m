Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============1192159219932041760=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sharma, Swati2" <swati2.sharma@intel.com>
Date: Thu, 21 Sep 2023 06:57:31 -0000
Message-ID: <169527945172.7233.13130053140891618941@emeril.freedesktop.org>
References: <20230918143754.263696-1-swati2.sharma@intel.com>
In-Reply-To: <20230918143754.263696-1-swati2.sharma@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fconcurrent=3A_remove_pipe_dependency_in_subtest_name?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--===============1192159219932041760==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_concurrent: remove pipe dependency in subtest name
URL   : https://patchwork.freedesktop.org/series/123865/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_13651_full -> IGTPW_9822_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_9822_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_9822_full, please notify your bug team (lgci.bug.filing@intel.com) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9822/index.html

Participating hosts (9 -> 6)
------------------------------

  ERROR: It appears as if the changes made in IGTPW_9822_full prevented too many machines from booting.

  Additional (2): shard-rkl0 shard-tglu0 
  Missing    (5): shard-tglu shard-dg1 shard-mtlp shard-rkl shard-dg2 

New tests
---------

  New tests have been introduced between CI_DRM_13651_full and IGTPW_9822_full:

### New IGT tests (1) ###

  * igt@kms_concurrent@multi-plane-atomic-resolution:
    - Statuses :
    - Exec time: [None] s

  


Changes
-------

  No changes found


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7493 -> IGTPW_9822
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_13651: 61b71c3f061a44a6ab1dcf756918886aa03a5480 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_9822: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9822/index.html
  IGT_7493: 2517e42d612e0c1ca096acf8b5f6177f7ef4bce7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9822/index.html

--===============1192159219932041760==
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
<tr><td><b>Series:</b></td><td>tests/kms_concurrent: remove pipe dependency in subtest name</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/123865/">https://patchwork.freedesktop.org/series/123865/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9822/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9822/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13651_full -&gt; IGTPW_9822_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_9822_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_9822_full, please notify your bug team (lgci.bug.filing@intel.com) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9822/index.html</p>
<h2>Participating hosts (9 -&gt; 6)</h2>
<p>ERROR: It appears as if the changes made in IGTPW_9822_full prevented too many machines from booting.</p>
<p>Additional (2): shard-rkl0 shard-tglu0 <br />
  Missing    (5): shard-tglu shard-dg1 shard-mtlp shard-rkl shard-dg2 </p>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_13651_full and IGTPW_9822_full:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@kms_concurrent@multi-plane-atomic-resolution:<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
</ul>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7493 -&gt; IGTPW_9822</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13651: 61b71c3f061a44a6ab1dcf756918886aa03a5480 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_9822: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9822/index.html<br />
  IGT_7493: 2517e42d612e0c1ca096acf8b5f6177f7ef4bce7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============1192159219932041760==--
