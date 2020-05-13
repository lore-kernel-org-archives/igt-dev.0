Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 13 May 2020 11:26:37 -0000
Message-ID: <158936919728.25405.9784956269492240249@emeril.freedesktop.org>
References: <20200513104715.792111-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200513104715.792111-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgaTkxNS9z?=
 =?utf-8?q?ysfs=5Fheartbeat=5Finterval=3A_Watch_out_for_CPU_scheduler_dela?=
 =?utf-8?q?ys?=
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

Series: i915/sysfs_heartbeat_interval: Watch out for CPU scheduler delays
URL   : https://patchwork.freedesktop.org/series/77218/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8471 -> IGTPW_4565
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4565/index.html

Known issues
------------

  Here are the changes found in IGTPW_4565 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@debugfs_test@read_all_entries:
    - fi-icl-u2:          [{ABORT}][1] ([i915#1814]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8471/fi-icl-u2/igt@debugfs_test@read_all_entries.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4565/fi-icl-u2/igt@debugfs_test@read_all_entries.html

  * igt@i915_selftest@live@objects:
    - fi-bwr-2160:        [INCOMPLETE][3] ([i915#489]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8471/fi-bwr-2160/igt@i915_selftest@live@objects.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4565/fi-bwr-2160/igt@i915_selftest@live@objects.html

  
  [i915#1814]: https://gitlab.freedesktop.org/drm/intel/issues/1814
  [i915#489]: https://gitlab.freedesktop.org/drm/intel/issues/489


Participating hosts (49 -> 36)
------------------------------

  Missing    (13): fi-ilk-m540 fi-cml-s fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-cfl-8700k fi-kbl-7500u fi-kbl-8809g fi-elk-e7500 fi-tgl-y fi-byt-clapper fi-bsw-nick fi-kbl-r 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5651 -> IGTPW_4565

  CI-20190529: 20190529
  CI_DRM_8471: 3c84a88ed50e99b200fac400a9b817a23d399c01 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4565: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4565/index.html
  IGT_5651: e54e2642f1967ca3c488db32264607df670d1dfb @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4565/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
