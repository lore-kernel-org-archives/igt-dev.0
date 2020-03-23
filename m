Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 23 Mar 2020 11:08:21 -0000
Message-ID: <158496170196.9807.14136947326326944622@emeril.freedesktop.org>
References: <20200323084828.20695-1-imre.deak@intel.com>
In-Reply-To: <20200323084828.20695-1-imre.deak@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fchamelium=3A_Fix_waiting_for_hotplug_uevents?=
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
To: Imre Deak <imre.deak@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/kms_chamelium: Fix waiting for hotplug uevents
URL   : https://patchwork.freedesktop.org/series/74966/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8175 -> IGTPW_4341
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4341/index.html

Known issues
------------

  Here are the changes found in IGTPW_4341 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - fi-bsw-n3050:       [PASS][1] -> [FAIL][2] ([i915#34])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8175/fi-bsw-n3050/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4341/fi-bsw-n3050/igt@kms_flip@basic-flip-vs-wf_vblank.html

  
  [i915#34]: https://gitlab.freedesktop.org/drm/intel/issues/34


Participating hosts (47 -> 41)
------------------------------

  Missing    (6): fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-gdg-551 fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5527 -> IGTPW_4341

  CI-20190529: 20190529
  CI_DRM_8175: 75b2b15f2ab26f5373a13ece8e5d40b472333d0e @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4341: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4341/index.html
  IGT_5527: 0ab05a51a059645d2e12e553a1de1d97451f57c5 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4341/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
