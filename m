Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 24 Mar 2020 09:09:28 -0000
Message-ID: <158504096895.5747.7268612159521776214@emeril.freedesktop.org>
References: <20200324083848.1023708-1-arkadiusz.hiler@intel.com>
In-Reply-To: <20200324083848.1023708-1-arkadiusz.hiler@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgY2hhbWVs?=
 =?utf-8?q?ium=3A_Retry_XMLRPC_call_when_chamelond_fails_talking_with_a_re?=
 =?utf-8?q?ceiver?=
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
To: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: chamelium: Retry XMLRPC call when chamelond fails talking with a receiver
URL   : https://patchwork.freedesktop.org/series/74999/
State : success

== Summary ==

CI Bug Log - changes from IGT_5532 -> IGTPW_4344
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4344/index.html

Known issues
------------

  Here are the changes found in IGTPW_4344 that come from known issues:

### IGT changes ###

#### Warnings ####

  * igt@i915_selftest@live@gem_contexts:
    - fi-cfl-8700k:       [INCOMPLETE][1] ([i915#424]) -> [DMESG-FAIL][2] ([i915#481])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5532/fi-cfl-8700k/igt@i915_selftest@live@gem_contexts.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4344/fi-cfl-8700k/igt@i915_selftest@live@gem_contexts.html
    - fi-cfl-guc:         [DMESG-FAIL][3] ([i915#481]) -> [DMESG-FAIL][4] ([i915#730] / [i915#933])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5532/fi-cfl-guc/igt@i915_selftest@live@gem_contexts.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4344/fi-cfl-guc/igt@i915_selftest@live@gem_contexts.html
    - fi-skl-lmem:        [DMESG-FAIL][5] ([i915#933]) -> [DMESG-FAIL][6] ([i915#481])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5532/fi-skl-lmem/igt@i915_selftest@live@gem_contexts.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4344/fi-skl-lmem/igt@i915_selftest@live@gem_contexts.html

  * igt@kms_chamelium@dp-crc-fast:
    - fi-cml-u2:          [FAIL][7] ([i915#217]) -> [FAIL][8] ([i915#262])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5532/fi-cml-u2/igt@kms_chamelium@dp-crc-fast.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4344/fi-cml-u2/igt@kms_chamelium@dp-crc-fast.html

  * igt@kms_chamelium@vga-hpd-fast:
    - fi-cml-u2:          [FAIL][9] ([i915#217]) -> [SKIP][10] ([fdo#109309])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5532/fi-cml-u2/igt@kms_chamelium@vga-hpd-fast.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4344/fi-cml-u2/igt@kms_chamelium@vga-hpd-fast.html

  
  [fdo#109309]: https://bugs.freedesktop.org/show_bug.cgi?id=109309
  [i915#217]: https://gitlab.freedesktop.org/drm/intel/issues/217
  [i915#262]: https://gitlab.freedesktop.org/drm/intel/issues/262
  [i915#424]: https://gitlab.freedesktop.org/drm/intel/issues/424
  [i915#481]: https://gitlab.freedesktop.org/drm/intel/issues/481
  [i915#730]: https://gitlab.freedesktop.org/drm/intel/issues/730
  [i915#933]: https://gitlab.freedesktop.org/drm/intel/issues/933


Participating hosts (48 -> 43)
------------------------------

  Missing    (5): fi-hsw-4200u fi-bsw-cyan fi-icl-u2 fi-ctg-p8600 fi-byt-clapper 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5532 -> IGTPW_4344

  CI-20190529: 20190529
  CI_DRM_8182: e5245084567cd7f6f93b07baaebf8a2b4d914620 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4344: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4344/index.html
  IGT_5532: 6098e286e0999eb2ad9dcd1aa714468f1412a2ef @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4344/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
