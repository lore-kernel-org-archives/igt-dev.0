Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 15 Apr 2020 14:25:11 -0000
Message-ID: <158696071133.21013.515130988392559564@emeril.freedesktop.org>
References: <20200415131515.7507-1-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20200415131515.7507-1-janusz.krzysztofik@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHM6?=
 =?utf-8?q?_Add_a_test_for_device_hot_unplug_=28rev4=29?=
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

Series: tests: Add a test for device hot unplug (rev4)
URL   : https://patchwork.freedesktop.org/series/75692/
State : success

== Summary ==

CI Bug Log - changes from IGT_5591 -> IGTPW_4468
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4468/index.html

Known issues
------------

  Here are the changes found in IGTPW_4468 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@hangcheck:
    - fi-bwr-2160:        [PASS][1] -> [INCOMPLETE][2] ([i915#489])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5591/fi-bwr-2160/igt@i915_selftest@live@hangcheck.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4468/fi-bwr-2160/igt@i915_selftest@live@hangcheck.html

  
  [i915#489]: https://gitlab.freedesktop.org/drm/intel/issues/489


Participating hosts (52 -> 45)
------------------------------

  Missing    (7): fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-kbl-7560u fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5591 -> IGTPW_4468

  CI-20190529: 20190529
  CI_DRM_8301: 7d2bdd2df0d18945bb274de8bc7560e14779e346 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4468: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4468/index.html
  IGT_5591: f57b7fdbe8d04ce3edf0433a03c7d9d5c3d96680 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@core_hotunplug@hotunbind-lateclose
+igt@core_hotunplug@hotunplug-lateclose
+igt@core_hotunplug@unbind-rebind
+igt@core_hotunplug@unplug-rescan

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4468/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
