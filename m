Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============0488434514244937204=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jason Ekstrand" <jason@jlekstrand.net>
Date: Fri, 06 May 2022 17:54:50 -0000
Message-ID: <165185969033.18815.11261557807139017567@emeril.freedesktop.org>
References: <20220506171632.1438408-1-jason.ekstrand@collabora.com>
In-Reply-To: <20220506171632.1438408-1-jason.ekstrand@collabora.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?dmabuf=3A_Add_tests_for_sync=5Ffile_import/export_=28rev3=29?=
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

--===============0488434514244937204==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/dmabuf: Add tests for sync_file import/export (rev3)
URL   : https://patchwork.freedesktop.org/series/90490/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_11618 -> IGTPW_7056
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7056/index.html

Participating hosts (35 -> 33)
------------------------------

  Missing    (2): fi-bxt-dsi fi-bsw-cyan 

Known issues
------------

  Here are the changes found in IGTPW_7056 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@hangcheck:
    - fi-snb-2600:        [PASS][1] -> [INCOMPLETE][2] ([i915#3921])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11618/fi-snb-2600/igt@i915_selftest@live@hangcheck.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7056/fi-snb-2600/igt@i915_selftest@live@hangcheck.html

  
  [i915#3921]: https://gitlab.freedesktop.org/drm/intel/issues/3921


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6468 -> IGTPW_7056

  CI-20190529: 20190529
  CI_DRM_11618: 07c7d578e3b8a85c79e9a7f8dace075192d5fd91 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7056: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7056/index.html
  IGT_6468: cffa5fffe9acddf49565b4caeeb5e3355ff2ea44 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@dmabuf_sync_file@export-basic
+igt@dmabuf_sync_file@export-before-signal
+igt@dmabuf_sync_file@export-multiwait
+igt@dmabuf_sync_file@export-wait-after-attach
+igt@dmabuf_sync_file@import-basic
+igt@dmabuf_sync_file@import-multiple-read-only
+igt@dmabuf_sync_file@import-multiple-read-write

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7056/index.html

--===============0488434514244937204==
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
<tr><td><b>Series:</b></td><td>tests/dmabuf: Add tests for sync_file import/export (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/90490/">https://patchwork.freedesktop.org/series/90490/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7056/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7056/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11618 -&gt; IGTPW_7056</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7056/index.html</p>
<h2>Participating hosts (35 -&gt; 33)</h2>
<p>Missing    (2): fi-bxt-dsi fi-bsw-cyan </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7056 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@i915_selftest@live@hangcheck:<ul>
<li>fi-snb-2600:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11618/fi-snb-2600/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7056/fi-snb-2600/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3921">i915#3921</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6468 -&gt; IGTPW_7056</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11618: 07c7d578e3b8a85c79e9a7f8dace075192d5fd91 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_7056: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7056/index.html<br />
  IGT_6468: cffa5fffe9acddf49565b4caeeb5e3355ff2ea44 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@dmabuf_sync_file@export-basic<br />
+igt@dmabuf_sync_file@export-before-signal<br />
+igt@dmabuf_sync_file@export-multiwait<br />
+igt@dmabuf_sync_file@export-wait-after-attach<br />
+igt@dmabuf_sync_file@import-basic<br />
+igt@dmabuf_sync_file@import-multiple-read-only<br />
+igt@dmabuf_sync_file@import-multiple-read-write</p>

</body>
</html>

--===============0488434514244937204==--
