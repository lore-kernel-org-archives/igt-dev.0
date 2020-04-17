Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 17 Apr 2020 20:28:00 -0000
Message-ID: <158715528041.10467.7452945442734359193@emeril.freedesktop.org>
References: <20200417194931.39774-1-lyude@redhat.com>
In-Reply-To: <20200417194931.39774-1-lyude@redhat.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgQWRkIG5v?=
 =?utf-8?q?uveau-crc_tests_=28rev2=29?=
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

Series: Add nouveau-crc tests (rev2)
URL   : https://patchwork.freedesktop.org/series/74811/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8319 -> IGTPW_4484
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4484/index.html

Known issues
------------

  Here are the changes found in IGTPW_4484 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_pm_rpm@module-reload:
    - fi-skl-lmem:        [PASS][1] -> [INCOMPLETE][2] ([i915#151])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8319/fi-skl-lmem/igt@i915_pm_rpm@module-reload.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4484/fi-skl-lmem/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live@hangcheck:
    - fi-icl-y:           [PASS][3] -> [INCOMPLETE][4] ([i915#1580])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8319/fi-icl-y/igt@i915_selftest@live@hangcheck.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4484/fi-icl-y/igt@i915_selftest@live@hangcheck.html

  
  [i915#151]: https://gitlab.freedesktop.org/drm/intel/issues/151
  [i915#1580]: https://gitlab.freedesktop.org/drm/intel/issues/1580


Participating hosts (51 -> 46)
------------------------------

  Additional (1): fi-kbl-7560u 
  Missing    (6): fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5599 -> IGTPW_4484

  CI-20190529: 20190529
  CI_DRM_8319: 18043327e8a9cba095bca9f80cdc70900a51f92c @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4484: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4484/index.html
  IGT_5599: cdb07101dda33e2fcb0f4c2aa199c47159d88f35 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



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

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4484/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
