Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 20 May 2020 18:17:36 -0000
Message-ID: <158999865653.30687.17992603596719341776@emeril.freedesktop.org>
References: <20200520162946.2602017-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200520162946.2602017-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fexec=5Fschedule=3A_Verify_timeslicing_between_submit-fence?=
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

Series: i915/gem_exec_schedule: Verify timeslicing between submit-fence
URL   : https://patchwork.freedesktop.org/series/77485/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8514 -> IGTPW_4602
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4602/index.html

Known issues
------------

  Here are the changes found in IGTPW_4602 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@i915_selftest@live@execlists:
    - fi-cfl-8109u:       [INCOMPLETE][1] ([i915#1874]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8514/fi-cfl-8109u/igt@i915_selftest@live@execlists.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4602/fi-cfl-8109u/igt@i915_selftest@live@execlists.html

  
  [i915#1874]: https://gitlab.freedesktop.org/drm/intel/issues/1874


Participating hosts (47 -> 42)
------------------------------

  Additional (1): fi-kbl-r 
  Missing    (6): fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-hsw-4770 fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5664 -> IGTPW_4602

  CI-20190529: 20190529
  CI_DRM_8514: c98b2ef26a5a946fd22839fce7dc4cc868f565fb @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4602: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4602/index.html
  IGT_5664: 404e2fa06b9c5986dec3fa210234fe8b034b157e @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@gem_exec_schedule@submit-early-slice
+igt@gem_exec_schedule@submit-golden-slice
+igt@gem_exec_schedule@submit-late-slice

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4602/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
