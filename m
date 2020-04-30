Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 30 Apr 2020 11:30:08 -0000
Message-ID: <158824620872.31921.16551615209367966265@emeril.freedesktop.org>
References: <20200430103612.12579-1-arjun.melkaveri@intel.com>
In-Reply-To: <20200430103612.12579-1-arjun.melkaveri@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fsync=3ACorrected_legacy_Dynamic_test_case_name?=
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
To: Arjun Melkaveri <arjun.melkaveri@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: i915/gem_sync:Corrected legacy Dynamic test case name
URL   : https://patchwork.freedesktop.org/series/76770/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8401 -> IGTPW_4519
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4519/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4519:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@debugfs_test@read_all_entries:
    - fi-kbl-7500u:       NOTRUN -> [{ABORT}][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4519/fi-kbl-7500u/igt@debugfs_test@read_all_entries.html

  
Known issues
------------

  Here are the changes found in IGTPW_4519 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@i915_selftest@live@gem_contexts:
    - fi-bwr-2160:        [INCOMPLETE][2] ([i915#489]) -> [PASS][3]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8401/fi-bwr-2160/igt@i915_selftest@live@gem_contexts.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4519/fi-bwr-2160/igt@i915_selftest@live@gem_contexts.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#489]: https://gitlab.freedesktop.org/drm/intel/issues/489


Participating hosts (50 -> 41)
------------------------------

  Missing    (9): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-kbl-x1275 fi-kbl-7560u fi-byt-clapper fi-bsw-nick 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5617 -> IGTPW_4519

  CI-20190529: 20190529
  CI_DRM_8401: 41fac0e3809be301af095c66e717eb9843b80212 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4519: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4519/index.html
  IGT_5617: 807b26292a3f21057ef7865a4028d22c512590df @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

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

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4519/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
