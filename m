Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 17 Mar 2020 05:58:04 -0000
Message-ID: <158442468402.5178.7907210898106048418@emeril.freedesktop.org>
References: <20200317053247.14489-1-priyanka.dandamudi@intel.com>
In-Reply-To: <20200317053247.14489-1-priyanka.dandamudi@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fring=5Fsync=5Fcopy=3A_Removal_of_test?=
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
To: priyanka.dandamudi@intel.com
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: i915/gem_ring_sync_copy: Removal of test
URL   : https://patchwork.freedesktop.org/series/74760/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8139 -> IGTPW_4313
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4313/index.html

Known issues
------------

  Here are the changes found in IGTPW_4313 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@gem_contexts:
    - fi-cfl-guc:         [PASS][1] -> [DMESG-FAIL][2] ([i915#943])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8139/fi-cfl-guc/igt@i915_selftest@live@gem_contexts.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4313/fi-cfl-guc/igt@i915_selftest@live@gem_contexts.html

  
#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-dpms:
    - fi-skl-6770hq:      [SKIP][3] ([fdo#109271]) -> [PASS][4] +24 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8139/fi-skl-6770hq/igt@kms_flip@basic-flip-vs-dpms.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4313/fi-skl-6770hq/igt@kms_flip@basic-flip-vs-dpms.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#943]: https://gitlab.freedesktop.org/drm/intel/issues/943


Participating hosts (43 -> 39)
------------------------------

  Additional (3): fi-kbl-soraka fi-gdg-551 fi-bsw-nick 
  Missing    (7): fi-tgl-dsi fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-cfl-8109u fi-kbl-7560u fi-byt-clapper 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5512 -> IGTPW_4313

  CI-20190529: 20190529
  CI_DRM_8139: 1516ff1b2279ede916d81b1978da0428414705f8 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4313: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4313/index.html
  IGT_5512: f6fef7eff6f121e5e89afd7e70116f471ccd5b8b @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

-igt@gem_ring_sync_copy@sync-blitter-render-read-write
-igt@gem_ring_sync_copy@sync-blitter-render-write-read
-igt@gem_ring_sync_copy@sync-blitter-render-write-write
-igt@gem_ring_sync_copy@sync-render-blitter-read-write
-igt@gem_ring_sync_copy@sync-render-blitter-write-read
-igt@gem_ring_sync_copy@sync-render-blitter-write-write

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4313/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
