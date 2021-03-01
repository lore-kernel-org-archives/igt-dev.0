Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 01 Mar 2021 17:09:00 -0000
Message-ID: <161461854071.9387.8230259615677211630@emeril.freedesktop.org>
References: <20210301161403.98278-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210301161403.98278-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgSW50cm9k?=
 =?utf-8?q?uce_IGT_allocator_=28rev22=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0755060401=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0755060401==
Content-Type: multipart/alternative;
 boundary="===============2650828779810514425=="

--===============2650828779810514425==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Introduce IGT allocator (rev22)
URL   : https://patchwork.freedesktop.org/series/82954/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9818_full -> IGTPW_5559_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5559/index.html

New tests
---------

  New tests have been introduced between CI_DRM_9818_full and IGTPW_5559_full:

### New IGT tests (37) ###

  * igt@api_intel_allocator@alloc-simple:
    - Statuses :
    - Exec time: [None] s

  * igt@api_intel_allocator@execbuf-with-allocator:
    - Statuses :
    - Exec time: [None] s

  * igt@api_intel_allocator@fork-simple-once:
    - Statuses :
    - Exec time: [None] s

  * igt@api_intel_allocator@fork-simple-stress:
    - Statuses :
    - Exec time: [None] s

  * igt@api_intel_allocator@fork-simple-stress-signal:
    - Statuses :
    - Exec time: [None] s

  * igt@api_intel_allocator@open-vm:
    - Statuses :
    - Exec time: [None] s

  * igt@api_intel_allocator@print-random:
    - Statuses :
    - Exec time: [None] s

  * igt@api_intel_allocator@print-simple:
    - Statuses :
    - Exec time: [None] s

  * igt@api_intel_allocator@random-allocator:
    - Statuses :
    - Exec time: [None] s

  * igt@api_intel_allocator@reopen:
    - Statuses :
    - Exec time: [None] s

  * igt@api_intel_allocator@reopen-fork:
    - Statuses :
    - Exec time: [None] s

  * igt@api_intel_allocator@reserve:
    - Statuses :
    - Exec time: [None] s

  * igt@api_intel_allocator@reserve-simple:
    - Statuses :
    - Exec time: [None] s

  * igt@api_intel_allocator@reuse:
    - Statuses :
    - Exec time: [None] s

  * igt@api_intel_allocator@simple-allocator:
    - Statuses :
    - Exec time: [None] s

  * igt@api_intel_allocator@two-level-inception:
    - Statuses :
    - Exec time: [None] s

  * igt@api_intel_allocator@two-level-inception-interruptible:
    - Statuses :
    - Exec time: [None] s

  * igt@api_intel_bb@add-remove-objects:
    - Statuses :
    - Exec time: [None] s

  * igt@api_intel_bb@bb-with-allocator:
    - Statuses :
    - Exec time: [None] s

  * igt@api_intel_bb@bb-with-vm:
    - Statuses :
    - Exec time: [None] s

  * igt@api_intel_bb@blit-noreloc-keep-cache-random:
    - Statuses :
    - Exec time: [None] s

  * igt@api_intel_bb@blit-noreloc-purge-cache-random:
    - Statuses :
    - Exec time: [None] s

  * igt@api_intel_bb@destroy-bb:
    - Statuses :
    - Exec time: [None] s

  * igt@api_intel_bb@last-page:
    - Statuses :
    - Exec time: [None] s

  * igt@api_intel_bb@object-noreloc-keep-cache-random:
    - Statuses :
    - Exec time: [None] s

  * igt@api_intel_bb@object-noreloc-keep-cache-simple:
    - Statuses :
    - Exec time: [None] s

  * igt@api_intel_bb@object-noreloc-purge-cache-random:
    - Statuses :
    - Exec time: [None] s

  * igt@api_intel_bb@object-noreloc-purge-cache-simple:
    - Statuses :
    - Exec time: [None] s

  * igt@api_intel_bb@object-reloc-keep-cache:
    - Statuses :
    - Exec time: [None] s

  * igt@api_intel_bb@object-reloc-purge-cache:
    - Statuses :
    - Exec time: [None] s

  * igt@api_intel_bb@purge-bb:
    - Statuses :
    - Exec time: [None] s

  * igt@api_intel_bb@reset-bb:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_softpin@allocator-basic:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_softpin@allocator-basic-reserve:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_softpin@allocator-fork:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_softpin@allocator-nopin:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_softpin@allocator-nopin-reserve:
    - Statuses :
    - Exec time: [None] s

  


Changes
-------

  No changes found


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-kbl-iris pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6016 -> IGTPW_5559
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_9818: fb3b93df7979b1cf6b69ac801d1703c0bf1dde66 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5559: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5559/index.html
  IGT_6016: 2107b0a53692fb329175bc16169c3699712187aa @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5559/index.html

--===============2650828779810514425==
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
<tr><td><b>Series:</b></td><td>Introduce IGT allocator (rev22)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/82954/">https://patchwork.freedesktop.org/series/82954/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5559/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5559/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9818_full -&gt; IGTPW_5559_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5559/index.html</p>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_9818_full and IGTPW_5559_full:</p>
<h3>New IGT tests (37)</h3>
<ul>
<li>
<p>igt@api_intel_allocator@alloc-simple:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_allocator@execbuf-with-allocator:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_allocator@fork-simple-once:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_allocator@fork-simple-stress:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_allocator@fork-simple-stress-signal:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_allocator@open-vm:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_allocator@print-random:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_allocator@print-simple:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_allocator@random-allocator:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_allocator@reopen:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_allocator@reopen-fork:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_allocator@reserve:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_allocator@reserve-simple:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_allocator@reuse:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_allocator@simple-allocator:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_allocator@two-level-inception:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_allocator@two-level-inception-interruptible:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@add-remove-objects:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@bb-with-allocator:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@bb-with-vm:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@blit-noreloc-keep-cache-random:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@blit-noreloc-purge-cache-random:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@destroy-bb:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@last-page:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@object-noreloc-keep-cache-random:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@object-noreloc-keep-cache-simple:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@object-noreloc-purge-cache-random:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@object-noreloc-purge-cache-simple:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@object-reloc-keep-cache:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@object-reloc-purge-cache:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@purge-bb:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@reset-bb:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@allocator-basic:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@allocator-basic-reserve:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@allocator-fork:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@allocator-nopin:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@allocator-nopin-reserve:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
</ul>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Participating hosts (10 -&gt; 8)</h2>
<p>Missing    (2): pig-kbl-iris pig-icl-1065g7 </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6016 -&gt; IGTPW_5559</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9818: fb3b93df7979b1cf6b69ac801d1703c0bf1dde66 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5559: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5559/index.html<br />
  IGT_6016: 2107b0a53692fb329175bc16169c3699712187aa @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============2650828779810514425==--

--===============0755060401==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0755060401==--
