Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 21 Apr 2020 18:08:22 -0000
Message-ID: <158749250259.17662.4257517236841965746@emeril.freedesktop.org>
References: <20200421161725.12249-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20200421161725.12249-1-juhapekka.heikkila@gmail.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgVXNlIGRl?=
 =?utf-8?q?vice_dependant_module_parameters_=28rev4=29?=
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
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: Use device dependant module parameters (rev4)
URL   : https://patchwork.freedesktop.org/series/76163/
State : success

== Summary ==

CI Bug Log - changes from IGT_5604 -> IGTPW_4496
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4496/index.html

Known issues
------------

  Here are the changes found in IGTPW_4496 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@active:
    - fi-bwr-2160:        [PASS][1] -> [INCOMPLETE][2] ([i915#489])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5604/fi-bwr-2160/igt@i915_selftest@live@active.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4496/fi-bwr-2160/igt@i915_selftest@live@active.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@gt_heartbeat:
    - fi-kbl-soraka:      [DMESG-FAIL][3] ([i915#541]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5604/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4496/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html

  * igt@i915_selftest@live@gt_mocs:
    - fi-snb-2600:        [FAIL][5] ([i915#1763]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5604/fi-snb-2600/igt@i915_selftest@live@gt_mocs.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4496/fi-snb-2600/igt@i915_selftest@live@gt_mocs.html

  
#### Warnings ####

  * igt@runner@aborted:
    - fi-bwr-2160:        [FAIL][7] -> [FAIL][8] ([i915#489])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5604/fi-bwr-2160/igt@runner@aborted.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4496/fi-bwr-2160/igt@runner@aborted.html

  
  [i915#1763]: https://gitlab.freedesktop.org/drm/intel/issues/1763
  [i915#489]: https://gitlab.freedesktop.org/drm/intel/issues/489
  [i915#541]: https://gitlab.freedesktop.org/drm/intel/issues/541


Participating hosts (49 -> 43)
------------------------------

  Additional (1): fi-kbl-7560u 
  Missing    (7): fi-cml-u2 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5604 -> IGTPW_4496

  CI-20190529: 20190529
  CI_DRM_8345: e1fa8774e58e663bec8257f678c2f8fd17088292 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4496: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4496/index.html
  IGT_5604: 18cc19ece602ba552a8386222b49e7e82820f9aa @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4496/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
