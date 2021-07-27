Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 27 Jul 2021 15:41:24 -0000
Message-ID: <162740048454.18664.4626984876661486835@emeril.freedesktop.org>
References: <20210727152202.9527-1-matthew.brost@intel.com>
In-Reply-To: <20210727152202.9527-1-matthew.brost@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgVXBkYXRl?=
 =?utf-8?q?s_for_GuC_=26_parallel_submission?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============2145077481=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Matthew Brost <matthew.brost@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============2145077481==
Content-Type: multipart/alternative;
 boundary="===============0232070656496892681=="

--===============0232070656496892681==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Updates for GuC & parallel submission
URL   : https://patchwork.freedesktop.org/series/93071/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_10404 -> IGTPW_6064
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6064/index.html


Changes
-------

  No changes found


Participating hosts (40 -> 35)
------------------------------

  Missing    (5): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan bat-jsl-1 fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6153 -> IGTPW_6064

  CI-20190529: 20190529
  CI_DRM_10404: 371bd54db63fdd99356a1a3d0fdc9b76616eddcb @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6064: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6064/index.html
  IGT_6153: a5dffe7499a2f7189718ddf1ccf49060b7c1529d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git



== Testlist changes ==

+igt@gem_exec_balancer@parallel
+igt@gem_exec_balancer@parallel-balancer
+igt@gem_exec_balancer@parallel-bb-first
+igt@gem_exec_balancer@parallel-contexts
+igt@gem_exec_balancer@parallel-keep-in-fence
+igt@gem_exec_balancer@parallel-keep-submit-fence
+igt@gem_exec_balancer@parallel-ordering
+igt@gem_exec_balancer@parallel-out-fence

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6064/index.html

--===============0232070656496892681==
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
<tr><td><b>Series:</b></td><td>Updates for GuC &amp; parallel submission</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/93071/">https://patchwork.freedesktop.org/series/93071/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6064/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6064/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10404 -&gt; IGTPW_6064</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6064/index.html</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Participating hosts (40 -&gt; 35)</h2>
<p>Missing    (5): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan bat-jsl-1 fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6153 -&gt; IGTPW_6064</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_10404: 371bd54db63fdd99356a1a3d0fdc9b76616eddcb @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_6064: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6064/index.html<br />
  IGT_6153: a5dffe7499a2f7189718ddf1ccf49060b7c1529d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<p>== Testlist changes ==</p>
<p>+igt@gem_exec_balancer@parallel<br />
+igt@gem_exec_balancer@parallel-balancer<br />
+igt@gem_exec_balancer@parallel-bb-first<br />
+igt@gem_exec_balancer@parallel-contexts<br />
+igt@gem_exec_balancer@parallel-keep-in-fence<br />
+igt@gem_exec_balancer@parallel-keep-submit-fence<br />
+igt@gem_exec_balancer@parallel-ordering<br />
+igt@gem_exec_balancer@parallel-out-fence</p>

</body>
</html>

--===============0232070656496892681==--

--===============2145077481==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============2145077481==--
