Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 10 Feb 2020 11:37:40 -0000
Message-ID: <158133466077.3100.5470860427534685005@emeril.freedesktop.org>
References: <20200210101135.420500-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200210101135.420500-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgaW50ZWwt?=
 =?utf-8?q?ci=3A_Enable_gem=5Fexec=5Fwhisper?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: intel-ci: Enable gem_exec_whisper
URL   : https://patchwork.freedesktop.org/series/73232/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7897 -> IGTPW_4118
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4118/index.html

Known issues
------------

  Here are the changes found in IGTPW_4118 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_close_race@basic-threads:
    - fi-byt-n2820:       [PASS][1] -> [INCOMPLETE][2] ([i915#45])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/fi-byt-n2820/igt@gem_close_race@basic-threads.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4118/fi-byt-n2820/igt@gem_close_race@basic-threads.html

  * igt@i915_pm_rpm@module-reload:
    - fi-skl-6770hq:      [PASS][3] -> [FAIL][4] ([i915#178])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/fi-skl-6770hq/igt@i915_pm_rpm@module-reload.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4118/fi-skl-6770hq/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live_execlists:
    - fi-icl-y:           [PASS][5] -> [DMESG-FAIL][6] ([fdo#108569])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/fi-icl-y/igt@i915_selftest@live_execlists.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4118/fi-icl-y/igt@i915_selftest@live_execlists.html

  
#### Possible fixes ####

  * igt@i915_selftest@live_active:
    - fi-skl-lmem:        [DMESG-FAIL][7] ([i915#666]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/fi-skl-lmem/igt@i915_selftest@live_active.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4118/fi-skl-lmem/igt@i915_selftest@live_active.html

  * igt@i915_selftest@live_gem_contexts:
    - fi-cml-s:           [DMESG-FAIL][9] ([i915#877]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/fi-cml-s/igt@i915_selftest@live_gem_contexts.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4118/fi-cml-s/igt@i915_selftest@live_gem_contexts.html

  
#### Warnings ####

  * igt@gem_close_race@basic-threads:
    - fi-byt-j1900:       [TIMEOUT][11] ([fdo#112271] / [i915#1084] / [i915#816]) -> [INCOMPLETE][12] ([i915#45])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7897/fi-byt-j1900/igt@gem_close_race@basic-threads.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4118/fi-byt-j1900/igt@gem_close_race@basic-threads.html

  
  [fdo#108569]: https://bugs.freedesktop.org/show_bug.cgi?id=108569
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#1084]: https://gitlab.freedesktop.org/drm/intel/issues/1084
  [i915#178]: https://gitlab.freedesktop.org/drm/intel/issues/178
  [i915#45]: https://gitlab.freedesktop.org/drm/intel/issues/45
  [i915#666]: https://gitlab.freedesktop.org/drm/intel/issues/666
  [i915#816]: https://gitlab.freedesktop.org/drm/intel/issues/816
  [i915#877]: https://gitlab.freedesktop.org/drm/intel/issues/877


Participating hosts (46 -> 48)
------------------------------

  Additional (5): fi-kbl-7560u fi-bsw-n3050 fi-gdg-551 fi-bsw-kefka fi-blb-e6850 
  Missing    (3): fi-ilk-m540 fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5431 -> IGTPW_4118

  CI-20190529: 20190529
  CI_DRM_7897: b1c4983a1cff9719019abfb5da7d142f23b7834d @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4118: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4118/index.html
  IGT_5431: 33c7f2c0a2b238bb55d3c5b3a3006d965125cf76 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@gem_exec_whisper@basic-contexts
+igt@gem_exec_whisper@basic-contexts-all
+igt@gem_exec_whisper@basic-contexts-forked
+igt@gem_exec_whisper@basic-contexts-forked-all
+igt@gem_exec_whisper@basic-contexts-priority
+igt@gem_exec_whisper@basic-contexts-priority-all
+igt@gem_exec_whisper@basic-fds
+igt@gem_exec_whisper@basic-fds-all
+igt@gem_exec_whisper@basic-fds-forked
+igt@gem_exec_whisper@basic-fds-forked-all
+igt@gem_exec_whisper@basic-fds-priority
+igt@gem_exec_whisper@basic-fds-priority-all
+igt@gem_exec_whisper@basic-forked
+igt@gem_exec_whisper@basic-forked-all
+igt@gem_exec_whisper@basic-normal
+igt@gem_exec_whisper@basic-normal-all
+igt@gem_exec_whisper@basic-queues
+igt@gem_exec_whisper@basic-queues-all
+igt@gem_exec_whisper@basic-queues-forked
+igt@gem_exec_whisper@basic-queues-forked-all
+igt@gem_exec_whisper@basic-queues-priority
+igt@gem_exec_whisper@basic-queues-priority-all
+igt@gem_exec_whisper@basic-sync
+igt@gem_exec_whisper@basic-sync-all
-igt@gem_exec_whisper@contexts
-igt@gem_exec_whisper@contexts-all
-igt@gem_exec_whisper@contexts-forked
-igt@gem_exec_whisper@contexts-forked-all
-igt@gem_exec_whisper@contexts-priority
-igt@gem_exec_whisper@contexts-priority-all
-igt@gem_exec_whisper@fds
-igt@gem_exec_whisper@fds-all
-igt@gem_exec_whisper@fds-forked
-igt@gem_exec_whisper@fds-forked-all
-igt@gem_exec_whisper@fds-priority
-igt@gem_exec_whisper@fds-priority-all
-igt@gem_exec_whisper@forked
-igt@gem_exec_whisper@forked-all
-igt@gem_exec_whisper@normal
-igt@gem_exec_whisper@normal-all
-igt@gem_exec_whisper@queues
-igt@gem_exec_whisper@queues-all
-igt@gem_exec_whisper@queues-forked
-igt@gem_exec_whisper@queues-forked-all
-igt@gem_exec_whisper@queues-priority
-igt@gem_exec_whisper@queues-priority-all
-igt@gem_exec_whisper@sync
-igt@gem_exec_whisper@sync-all

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4118/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
