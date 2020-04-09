Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 09 Apr 2020 13:27:17 -0000
Message-ID: <158643883794.11552.5516580693250916885@emeril.freedesktop.org>
References: <20200409121812.9029-1-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20200409121812.9029-1-janusz.krzysztofik@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHM6?=
 =?utf-8?q?_Add_a_test_for_device_hot_unplug_=28rev2=29?=
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
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests: Add a test for device hot unplug (rev2)
URL   : https://patchwork.freedesktop.org/series/75692/
State : success

== Summary ==

CI Bug Log - changes from IGT_5586 -> IGTPW_4440
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/index.html

Known issues
------------

  Here are the changes found in IGTPW_4440 that come from known issues:

### IGT changes ###

#### Warnings ####

  * igt@i915_pm_rpm@basic-pci-d3-state:
    - fi-kbl-guc:         [SKIP][1] ([fdo#109271]) -> [FAIL][2] ([i915#138])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5586/fi-kbl-guc/igt@i915_pm_rpm@basic-pci-d3-state.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/fi-kbl-guc/igt@i915_pm_rpm@basic-pci-d3-state.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#138]: https://gitlab.freedesktop.org/drm/intel/issues/138


Participating hosts (54 -> 47)
------------------------------

  Missing    (7): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5586 -> IGTPW_4440

  CI-20190529: 20190529
  CI_DRM_8283: a6f4f55d343fea03e11e754b1094dda8cf2538ac @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4440: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/index.html
  IGT_5586: 29fad328e6a1b105c8d688cafe19b1b5c19ad0c8 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@core_hotunplug@hotunbind-lateclose
+igt@core_hotunplug@hotunplug-lateclose
+igt@core_hotunplug@unbind-rebind
+igt@core_hotunplug@unplug-rescan

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4440/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
