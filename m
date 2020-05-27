Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 27 May 2020 11:40:53 -0000
Message-ID: <159057965312.345.3743432017596738789@emeril.freedesktop.org>
References: <20200527110507.16902-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20200527110507.16902-1-ankit.k.nautiyal@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fcontent=5Fprotection=3A_Enhancements?=
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
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/kms_content_protection: Enhancements
URL   : https://patchwork.freedesktop.org/series/77694/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8542 -> IGTPW_4616
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4616/index.html

Known issues
------------

  Here are the changes found in IGTPW_4616 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@i915_selftest@live@active:
    - fi-kbl-soraka:      [DMESG-FAIL][1] ([i915#666]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8542/fi-kbl-soraka/igt@i915_selftest@live@active.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4616/fi-kbl-soraka/igt@i915_selftest@live@active.html

  
#### Warnings ####

  * igt@i915_pm_rpm@module-reload:
    - fi-kbl-x1275:       [SKIP][3] ([fdo#109271]) -> [FAIL][4] ([i915#62])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8542/fi-kbl-x1275/igt@i915_pm_rpm@module-reload.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4616/fi-kbl-x1275/igt@i915_pm_rpm@module-reload.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#62]: https://gitlab.freedesktop.org/drm/intel/issues/62
  [i915#666]: https://gitlab.freedesktop.org/drm/intel/issues/666


Participating hosts (51 -> 43)
------------------------------

  Missing    (8): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-kbl-7560u fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5680 -> IGTPW_4616

  CI-20190529: 20190529
  CI_DRM_8542: 547d23ff9379bfa0f65c53721f63e688c5356b68 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4616: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4616/index.html
  IGT_5680: f7e3772175c53f0c910f4513831791cb5bdcab04 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@kms_content_protection@hdcp-1_4
+igt@kms_content_protection@hdcp-2_2
-igt@kms_content_protection@atomic
-igt@kms_content_protection@atomic-dpms
-igt@kms_content_protection@content_type_change
-igt@kms_content_protection@legacy
-igt@kms_content_protection@lic
-igt@kms_content_protection@mei_interface
-igt@kms_content_protection@srm
-igt@kms_content_protection@type1
-igt@kms_content_protection@uevent

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4616/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
