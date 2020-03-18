Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 18 Mar 2020 02:05:09 -0000
Message-ID: <158449710984.25102.2267655663508283555@emeril.freedesktop.org>
References: <20200318010047.237024-1-lyude@redhat.com>
In-Reply-To: <20200318010047.237024-1-lyude@redhat.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgQWRkIG5v?=
 =?utf-8?q?uveau-crc_tests?=
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
To: Lyude Paul <lyude@redhat.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: Add nouveau-crc tests
URL   : https://patchwork.freedesktop.org/series/74811/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8145 -> IGTPW_4317
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4317/index.html

Known issues
------------

  Here are the changes found in IGTPW_4317 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@gem_contexts:
    - fi-cml-s:           [PASS][1] -> [DMESG-FAIL][2] ([i915#877])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8145/fi-cml-s/igt@i915_selftest@live@gem_contexts.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4317/fi-cml-s/igt@i915_selftest@live@gem_contexts.html
    - fi-cfl-guc:         [PASS][3] -> [DMESG-FAIL][4] ([i915#943])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8145/fi-cfl-guc/igt@i915_selftest@live@gem_contexts.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4317/fi-cfl-guc/igt@i915_selftest@live@gem_contexts.html

  
#### Possible fixes ####

  * igt@gem_exec_parallel@fds:
    - fi-glk-dsi:         [INCOMPLETE][5] ([i915#529] / [i915#58] / [k.org#198133]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8145/fi-glk-dsi/igt@gem_exec_parallel@fds.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4317/fi-glk-dsi/igt@gem_exec_parallel@fds.html

  * igt@i915_selftest@live@gem_contexts:
    - fi-skl-lmem:        [INCOMPLETE][7] ([i915#424]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8145/fi-skl-lmem/igt@i915_selftest@live@gem_contexts.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4317/fi-skl-lmem/igt@i915_selftest@live@gem_contexts.html

  * igt@i915_selftest@live@hangcheck:
    - fi-bwr-2160:        [INCOMPLETE][9] ([i915#489]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8145/fi-bwr-2160/igt@i915_selftest@live@hangcheck.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4317/fi-bwr-2160/igt@i915_selftest@live@hangcheck.html

  
  [i915#424]: https://gitlab.freedesktop.org/drm/intel/issues/424
  [i915#489]: https://gitlab.freedesktop.org/drm/intel/issues/489
  [i915#529]: https://gitlab.freedesktop.org/drm/intel/issues/529
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#877]: https://gitlab.freedesktop.org/drm/intel/issues/877
  [i915#943]: https://gitlab.freedesktop.org/drm/intel/issues/943
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (46 -> 42)
------------------------------

  Missing    (4): fi-byt-clapper fi-byt-squawks fi-bsw-cyan fi-hsw-4200u 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5518 -> IGTPW_4317

  CI-20190529: 20190529
  CI_DRM_8145: 5e893da0b8c2bfec015c5eaa7981e1ffab1d7c9c @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4317: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4317/index.html
  IGT_5518: ee05a571255783837b18d626c4dff6cd9613cee2 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@nouveau_crc@ctx-flip-threshold-reset-after-capture
+igt@nouveau_crc@pipe-a-ctx-flip-detection
+igt@nouveau_crc@pipe-a-ctx-flip-skip-current-frame
+igt@nouveau_crc@pipe-a-source-outp-complete
+igt@nouveau_crc@pipe-a-source-outp-inactive
+igt@nouveau_crc@pipe-a-source-rg
+igt@nouveau_crc@pipe-b-ctx-flip-detection
+igt@nouveau_crc@pipe-b-ctx-flip-skip-current-frame
+igt@nouveau_crc@pipe-b-source-outp-complete
+igt@nouveau_crc@pipe-b-source-outp-inactive
+igt@nouveau_crc@pipe-b-source-rg
+igt@nouveau_crc@pipe-c-ctx-flip-detection
+igt@nouveau_crc@pipe-c-ctx-flip-skip-current-frame
+igt@nouveau_crc@pipe-c-source-outp-complete
+igt@nouveau_crc@pipe-c-source-outp-inactive
+igt@nouveau_crc@pipe-c-source-rg
+igt@nouveau_crc@pipe-d-ctx-flip-detection
+igt@nouveau_crc@pipe-d-ctx-flip-skip-current-frame
+igt@nouveau_crc@pipe-d-source-outp-complete
+igt@nouveau_crc@pipe-d-source-outp-inactive
+igt@nouveau_crc@pipe-d-source-rg
+igt@nouveau_crc@pipe-e-ctx-flip-detection
+igt@nouveau_crc@pipe-e-ctx-flip-skip-current-frame
+igt@nouveau_crc@pipe-e-source-outp-complete
+igt@nouveau_crc@pipe-e-source-outp-inactive
+igt@nouveau_crc@pipe-e-source-rg
+igt@nouveau_crc@pipe-f-ctx-flip-detection
+igt@nouveau_crc@pipe-f-ctx-flip-skip-current-frame
+igt@nouveau_crc@pipe-f-source-outp-complete
+igt@nouveau_crc@pipe-f-source-outp-inactive
+igt@nouveau_crc@pipe-f-source-rg

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4317/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
