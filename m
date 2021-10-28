Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============2312302438508607491=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 28 Oct 2021 11:31:11 -0000
Message-ID: <163542067104.4340.13995173589313503127@emeril.freedesktop.org>
References: <20211028101819.17967-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20211028101819.17967-1-kamil.konieczny@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgQ2hhbmdl?=
 =?utf-8?q?_duplicate_names?=
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
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============2312302438508607491==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Change duplicate names
URL   : https://patchwork.freedesktop.org/series/96381/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_10806 -> IGTPW_6360
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_6360 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_6360, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6360/index.html

Participating hosts (35 -> 32)
------------------------------

  Additional (1): fi-pnv-d510 
  Missing    (4): bat-adlp-4 fi-kbl-8809g bat-dg1-6 bat-dg1-5 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_6360:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live@hangcheck:
    - fi-icl-u2:          [PASS][1] -> [DMESG-WARN][2] +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10806/fi-icl-u2/igt@i915_selftest@live@hangcheck.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6360/fi-icl-u2/igt@i915_selftest@live@hangcheck.html

  
Known issues
------------

  Here are the changes found in IGTPW_6360 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_pm_rpm@module-reload:
    - fi-icl-u2:          [PASS][3] -> [FAIL][4] ([i915#3049])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10806/fi-icl-u2/igt@i915_pm_rpm@module-reload.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6360/fi-icl-u2/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live@objects:
    - fi-icl-u2:          [PASS][5] -> [DMESG-WARN][6] ([i915#2867]) +3 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10806/fi-icl-u2/igt@i915_selftest@live@objects.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6360/fi-icl-u2/igt@i915_selftest@live@objects.html

  * igt@prime_vgem@basic-userptr:
    - fi-pnv-d510:        NOTRUN -> [SKIP][7] ([fdo#109271]) +53 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6360/fi-pnv-d510/igt@prime_vgem@basic-userptr.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#2867]: https://gitlab.freedesktop.org/drm/intel/issues/2867
  [i915#3049]: https://gitlab.freedesktop.org/drm/intel/issues/3049
  [i915#3303]: https://gitlab.freedesktop.org/drm/intel/issues/3303


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6262 -> IGTPW_6360

  CI-20190529: 20190529
  CI_DRM_10806: c5b79188b859e8ba29efe0637a3897f7cccd4f99 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6360: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6360/index.html
  IGT_6262: d1c793b26e31cc6ae3f9fa3239805a9bbcc749fb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git



== Testlist changes ==

+igt@gem_exec_whisper@contexts-engine
+igt@gem_exec_whisper@contexts-forked-engine
+igt@gem_exec_whisper@contexts-interruptible-engine
+igt@gem_exec_whisper@contexts-priority-engine
+igt@gem_exec_whisper@contexts-sync-engine
+igt@gem_exec_whisper@fds-engine
+igt@gem_exec_whisper@fds-forked-engine
+igt@gem_exec_whisper@fds-interruptible-engine
+igt@gem_exec_whisper@fds-priority-engine
+igt@gem_exec_whisper@fds-sync-engine
+igt@gem_exec_whisper@forked-engine
+igt@gem_exec_whisper@interruptible-engine
+igt@gem_exec_whisper@normal-engine
+igt@gem_exec_whisper@queues-engine
+igt@gem_exec_whisper@queues-forked-engine
+igt@gem_exec_whisper@queues-interruptible-engine
+igt@gem_exec_whisper@queues-priority-engine
+igt@gem_exec_whisper@queues-sync-engine
+igt@gem_exec_whisper@sync-engine
+igt@gem_sync@legacy-active
+igt@gem_sync@legacy-active-wakeup
+igt@gem_sync@legacy-default
+igt@gem_sync@legacy-double-wakeup
+igt@gem_sync@legacy-forked
+igt@gem_sync@legacy-forked-store
+igt@gem_sync@legacy-forked-switch
+igt@gem_sync@legacy-idle
+igt@gem_sync@legacy-many
+igt@gem_sync@legacy-store
+igt@gem_sync@legacy-switch
+igt@gem_sync@legacy-wakeup
-igt@gem_exec_whisper@contexts
-igt@gem_exec_whisper@contexts-forked
-igt@gem_exec_whisper@contexts-interruptible
-igt@gem_exec_whisper@contexts-priority
-igt@gem_exec_whisper@contexts-sync
-igt@gem_exec_whisper@fds
-igt@gem_exec_whisper@fds-forked
-igt@gem_exec_whisper@fds-interruptible
-igt@gem_exec_whisper@fds-priority
-igt@gem_exec_whisper@fds-sync
-igt@gem_exec_whisper@forked
-igt@gem_exec_whisper@interruptible
-igt@gem_exec_whisper@normal
-igt@gem_exec_whisper@queues
-igt@gem_exec_whisper@queues-forked
-igt@gem_exec_whisper@queues-interruptible
-igt@gem_exec_whisper@queues-priority
-igt@gem_exec_whisper@queues-sync
-igt@gem_exec_whisper@sync
-igt@gem_sync@active
-igt@gem_sync@active-wakeup
-igt@gem_sync@default
-igt@gem_sync@double-wakeup
-igt@gem_sync@forked
-igt@gem_sync@forked-store
-igt@gem_sync@forked-switch
-igt@gem_sync@idle
-igt@gem_sync@many
-igt@gem_sync@store
-igt@gem_sync@switch
-igt@gem_sync@wakeup

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6360/index.html

--===============2312302438508607491==
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
<tr><td><b>Series:</b></td><td>Change duplicate names</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/96381/">https://patchwork.freedesktop.org/series/96381/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6360/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6360/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10806 -&gt; IGTPW_6360</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_6360 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_6360, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6360/index.html</p>
<h2>Participating hosts (35 -&gt; 32)</h2>
<p>Additional (1): fi-pnv-d510 <br />
  Missing    (4): bat-adlp-4 fi-kbl-8809g bat-dg1-6 bat-dg1-5 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_6360:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_selftest@live@hangcheck:<ul>
<li>fi-icl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10806/fi-icl-u2/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6360/fi-icl-u2/igt@i915_selftest@live@hangcheck.html">DMESG-WARN</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6360 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>fi-icl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10806/fi-icl-u2/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6360/fi-icl-u2/igt@i915_pm_rpm@module-reload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3049">i915#3049</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@objects:</p>
<ul>
<li>fi-icl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10806/fi-icl-u2/igt@i915_selftest@live@objects.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6360/fi-icl-u2/igt@i915_selftest@live@objects.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2867">i915#2867</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-userptr:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6360/fi-pnv-d510/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +53 similar issues</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6262 -&gt; IGTPW_6360</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_10806: c5b79188b859e8ba29efe0637a3897f7cccd4f99 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_6360: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6360/index.html<br />
  IGT_6262: d1c793b26e31cc6ae3f9fa3239805a9bbcc749fb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<p>== Testlist changes ==</p>
<p>+igt@gem_exec_whisper@contexts-engine<br />
+igt@gem_exec_whisper@contexts-forked-engine<br />
+igt@gem_exec_whisper@contexts-interruptible-engine<br />
+igt@gem_exec_whisper@contexts-priority-engine<br />
+igt@gem_exec_whisper@contexts-sync-engine<br />
+igt@gem_exec_whisper@fds-engine<br />
+igt@gem_exec_whisper@fds-forked-engine<br />
+igt@gem_exec_whisper@fds-interruptible-engine<br />
+igt@gem_exec_whisper@fds-priority-engine<br />
+igt@gem_exec_whisper@fds-sync-engine<br />
+igt@gem_exec_whisper@forked-engine<br />
+igt@gem_exec_whisper@interruptible-engine<br />
+igt@gem_exec_whisper@normal-engine<br />
+igt@gem_exec_whisper@queues-engine<br />
+igt@gem_exec_whisper@queues-forked-engine<br />
+igt@gem_exec_whisper@queues-interruptible-engine<br />
+igt@gem_exec_whisper@queues-priority-engine<br />
+igt@gem_exec_whisper@queues-sync-engine<br />
+igt@gem_exec_whisper@sync-engine<br />
+igt@gem_sync@legacy-active<br />
+igt@gem_sync@legacy-active-wakeup<br />
+igt@gem_sync@legacy-default<br />
+igt@gem_sync@legacy-double-wakeup<br />
+igt@gem_sync@legacy-forked<br />
+igt@gem_sync@legacy-forked-store<br />
+igt@gem_sync@legacy-forked-switch<br />
+igt@gem_sync@legacy-idle<br />
+igt@gem_sync@legacy-many<br />
+igt@gem_sync@legacy-store<br />
+igt@gem_sync@legacy-switch<br />
+igt@gem_sync@legacy-wakeup<br />
-igt@gem_exec_whisper@contexts<br />
-igt@gem_exec_whisper@contexts-forked<br />
-igt@gem_exec_whisper@contexts-interruptible<br />
-igt@gem_exec_whisper@contexts-priority<br />
-igt@gem_exec_whisper@contexts-sync<br />
-igt@gem_exec_whisper@fds<br />
-igt@gem_exec_whisper@fds-forked<br />
-igt@gem_exec_whisper@fds-interruptible<br />
-igt@gem_exec_whisper@fds-priority<br />
-igt@gem_exec_whisper@fds-sync<br />
-igt@gem_exec_whisper@forked<br />
-igt@gem_exec_whisper@interruptible<br />
-igt@gem_exec_whisper@normal<br />
-igt@gem_exec_whisper@queues<br />
-igt@gem_exec_whisper@queues-forked<br />
-igt@gem_exec_whisper@queues-interruptible<br />
-igt@gem_exec_whisper@queues-priority<br />
-igt@gem_exec_whisper@queues-sync<br />
-igt@gem_exec_whisper@sync<br />
-igt@gem_sync@active<br />
-igt@gem_sync@active-wakeup<br />
-igt@gem_sync@default<br />
-igt@gem_sync@double-wakeup<br />
-igt@gem_sync@forked<br />
-igt@gem_sync@forked-store<br />
-igt@gem_sync@forked-switch<br />
-igt@gem_sync@idle<br />
-igt@gem_sync@many<br />
-igt@gem_sync@store<br />
-igt@gem_sync@switch<br />
-igt@gem_sync@wakeup</p>

</body>
</html>

--===============2312302438508607491==--
