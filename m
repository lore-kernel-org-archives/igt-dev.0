Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 529B7606A32C
	for <igt-dev@archiver.kernel.org>; Fri,  6 Nov 2026 10:23:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2AB510E194;
	Fri,  6 Nov 2026 10:23:48 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C034010E220;
 Fri,  6 Nov 2026 10:22:54 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7962291965975178436=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EFull=3A_success_for_Multi-queue_CGP=5FSYNC_r?=
 =?utf-8?q?eplay_coverage_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jagmeet Randhawa" <jagmeet.randhawa@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 06 Nov 2026 10:22:54 -0000
Message-ID: <179396057475.131618.5802811877790453172@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261105184242.14910-1-jagmeet.randhawa@intel.com>
In-Reply-To: <20261105184242.14910-1-jagmeet.randhawa@intel.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

--===============7962291965975178436==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Multi-queue CGP_SYNC replay coverage (rev3)
URL   : https://patchwork.freedesktop.org/series/177781/
State : success

== Summary ==

CI Bug Log - changes from IGT_9180_full -> IGTPW_16112_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/index.html

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in IGTPW_16112_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-noreloc-keep-cache:
    - shard-snb:          NOTRUN -> [SKIP][1] ([i915#17667])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb1/igt@api_intel_bb@blit-noreloc-keep-cache.html

  * igt@api_intel_bb@crc32:
    - shard-glk:          NOTRUN -> [SKIP][2] ([i915#17576])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk1/igt@api_intel_bb@crc32.html

  * igt@api_intel_bb@object-reloc-purge-cache:
    - shard-dg1:          NOTRUN -> [SKIP][3] ([i915#8411])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg1-19/igt@api_intel_bb@object-reloc-purge-cache.html

  * igt@api_intel_bb@render-ccs:
    - shard-snb:          NOTRUN -> [SKIP][4] ([i915#17685])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb7/igt@api_intel_bb@render-ccs.html

  * igt@device_reset@cold-reset-bound:
    - shard-dg1:          NOTRUN -> [SKIP][5] ([i915#11078])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg1-14/igt@device_reset@cold-reset-bound.html
    - shard-tglu:         NOTRUN -> [SKIP][6] ([i915#11078])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-tglu-3/igt@device_reset@cold-reset-bound.html
    - shard-rkl:          NOTRUN -> [SKIP][7] ([i915#11078])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-8/igt@device_reset@cold-reset-bound.html

  * igt@device_reset@unbind-reset-rebind:
    - shard-snb:          NOTRUN -> [SKIP][8] ([i915#17620])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb1/igt@device_reset@unbind-reset-rebind.html

  * igt@gem_basic@multigpu-create-close:
    - shard-rkl:          NOTRUN -> [SKIP][9] ([i915#7697])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-8/igt@gem_basic@multigpu-create-close.html

  * igt@gem_ccs@block-multicopy-inplace:
    - shard-dg1:          NOTRUN -> [SKIP][10] ([i915#3555] / [i915#9323])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg1-16/igt@gem_ccs@block-multicopy-inplace.html

  * igt@gem_ccs@ctrl-surf-copy:
    - shard-tglu:         NOTRUN -> [SKIP][11] ([i915#3555] / [i915#9323])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-tglu-10/igt@gem_ccs@ctrl-surf-copy.html

  * igt@gem_ccs@ctrl-surf-copy-new-ctx:
    - shard-dg1:          NOTRUN -> [SKIP][12] ([i915#9323]) +1 other test skip
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg1-18/igt@gem_ccs@ctrl-surf-copy-new-ctx.html
    - shard-glk10:        NOTRUN -> [SKIP][13] ([i915#17499])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk10/igt@gem_ccs@ctrl-surf-copy-new-ctx.html

  * igt@gem_ccs@suspend-resume:
    - shard-rkl:          NOTRUN -> [SKIP][14] ([i915#9323]) +1 other test skip
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-4/igt@gem_ccs@suspend-resume.html
    - shard-snb:          NOTRUN -> [SKIP][15] ([i915#17499])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb4/igt@gem_ccs@suspend-resume.html
    - shard-glk:          NOTRUN -> [SKIP][16] ([i915#17499])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk5/igt@gem_ccs@suspend-resume.html

  * igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][17] ([i915#13356] / [i915#16348])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg2-3/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0.html

  * igt@gem_close_race@multigpu-basic-threads:
    - shard-dg1:          NOTRUN -> [SKIP][18] ([i915#7697])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg1-14/igt@gem_close_race@multigpu-basic-threads.html

  * igt@gem_create@create-ext-cpu-access-sanity-check:
    - shard-snb:          NOTRUN -> [SKIP][19] ([i915#17513])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb7/igt@gem_create@create-ext-cpu-access-sanity-check.html
    - shard-tglu:         NOTRUN -> [SKIP][20] ([i915#6335])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-tglu-4/igt@gem_create@create-ext-cpu-access-sanity-check.html
    - shard-mtlp:         NOTRUN -> [SKIP][21] ([i915#6335])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-mtlp-6/igt@gem_create@create-ext-cpu-access-sanity-check.html
    - shard-glk:          NOTRUN -> [SKIP][22] ([i915#17513])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk3/igt@gem_create@create-ext-cpu-access-sanity-check.html
    - shard-rkl:          NOTRUN -> [SKIP][23] ([i915#6335])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-3/igt@gem_create@create-ext-cpu-access-sanity-check.html

  * igt@gem_create@create-ext-set-pat:
    - shard-glk10:        NOTRUN -> [SKIP][24] ([i915#17530])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk10/igt@gem_create@create-ext-set-pat.html
    - shard-tglu:         NOTRUN -> [SKIP][25] ([i915#8562])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-tglu-9/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_isolation@nonpriv:
    - shard-snb:          NOTRUN -> [SKIP][26] ([i915#17639]) +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb1/igt@gem_ctx_isolation@nonpriv.html

  * igt@gem_ctx_isolation@preservation-s3@vcs1:
    - shard-mtlp:         [PASS][27] -> [FAIL][28] ([i915#17176]) +1 other test fail
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9180/shard-mtlp-1/igt@gem_ctx_isolation@preservation-s3@vcs1.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-mtlp-1/igt@gem_ctx_isolation@preservation-s3@vcs1.html

  * igt@gem_ctx_param@set-priority-not-supported:
    - shard-glk10:        NOTRUN -> [SKIP][29] ([i915#17535])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk10/igt@gem_ctx_param@set-priority-not-supported.html
    - shard-rkl:          NOTRUN -> [SKIP][30] ([i915#17444])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-1/igt@gem_ctx_param@set-priority-not-supported.html

  * igt@gem_ctx_persistence@engines-hang@bcs0:
    - shard-glk10:        NOTRUN -> [SKIP][31] ([i915#17527])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk10/igt@gem_ctx_persistence@engines-hang@bcs0.html

  * igt@gem_ctx_persistence@hang:
    - shard-glk:          NOTRUN -> [SKIP][32] ([i915#17527])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk8/igt@gem_ctx_persistence@hang.html

  * igt@gem_ctx_persistence@heartbeat-hostile:
    - shard-dg1:          NOTRUN -> [SKIP][33] ([i915#8555]) +2 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg1-15/igt@gem_ctx_persistence@heartbeat-hostile.html

  * igt@gem_ctx_persistence@heartbeat-many:
    - shard-snb:          NOTRUN -> [SKIP][34] ([i915#17621])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb1/igt@gem_ctx_persistence@heartbeat-many.html
    - shard-mtlp:         NOTRUN -> [SKIP][35] ([i915#8555])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-mtlp-2/igt@gem_ctx_persistence@heartbeat-many.html

  * igt@gem_ctx_persistence@legacy-engines-mixed:
    - shard-snb:          NOTRUN -> [SKIP][36] ([i915#1099]) +7 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb5/igt@gem_ctx_persistence@legacy-engines-mixed.html

  * igt@gem_ctx_shared@q-smoketest-all:
    - shard-snb:          NOTRUN -> [SKIP][37] ([i915#17342]) +4 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb5/igt@gem_ctx_shared@q-smoketest-all.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-rkl:          NOTRUN -> [SKIP][38] ([i915#280]) +1 other test skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-7/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_eio@in-flight-suspend:
    - shard-glk10:        NOTRUN -> [INCOMPLETE][39] ([i915#13356] / [i915#13390])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk10/igt@gem_eio@in-flight-suspend.html

  * igt@gem_eio@unwedge-stress:
    - shard-snb:          NOTRUN -> [FAIL][40] ([i915#8898]) +1 other test fail
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb1/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_balancer@bonded-dual:
    - shard-dg1:          NOTRUN -> [SKIP][41] ([i915#4771]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg1-18/igt@gem_exec_balancer@bonded-dual.html

  * igt@gem_exec_balancer@bonded-false-hang:
    - shard-dg2:          NOTRUN -> [SKIP][42] ([i915#4812]) +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg2-4/igt@gem_exec_balancer@bonded-false-hang.html
    - shard-dg1:          NOTRUN -> [SKIP][43] ([i915#4812]) +2 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg1-19/igt@gem_exec_balancer@bonded-false-hang.html

  * igt@gem_exec_balancer@bonded-pair:
    - shard-dg2:          NOTRUN -> [SKIP][44] ([i915#4771])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg2-5/igt@gem_exec_balancer@bonded-pair.html

  * igt@gem_exec_balancer@invalid-bonds:
    - shard-dg1:          NOTRUN -> [SKIP][45] ([i915#4036])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg1-16/igt@gem_exec_balancer@invalid-bonds.html

  * igt@gem_exec_balancer@noheartbeat:
    - shard-dg2:          NOTRUN -> [SKIP][46] ([i915#8555]) +1 other test skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg2-3/igt@gem_exec_balancer@noheartbeat.html

  * igt@gem_exec_balancer@parallel:
    - shard-snb:          NOTRUN -> [SKIP][47] ([i915#17587]) +9 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb7/igt@gem_exec_balancer@parallel.html
    - shard-glk11:        NOTRUN -> [SKIP][48] ([i915#17547])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk11/igt@gem_exec_balancer@parallel.html

  * igt@gem_exec_balancer@parallel-balancer:
    - shard-rkl:          NOTRUN -> [SKIP][49] ([i915#4525]) +4 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-2/igt@gem_exec_balancer@parallel-balancer.html

  * igt@gem_exec_balancer@parallel-bb-first:
    - shard-tglu:         NOTRUN -> [SKIP][50] ([i915#4525]) +1 other test skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-tglu-5/igt@gem_exec_balancer@parallel-bb-first.html

  * igt@gem_exec_balancer@parallel-keep-submit-fence:
    - shard-glk:          NOTRUN -> [SKIP][51] ([i915#17547]) +2 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk1/igt@gem_exec_balancer@parallel-keep-submit-fence.html

  * igt@gem_exec_big@single:
    - shard-tglu:         NOTRUN -> [FAIL][52] ([i915#15816])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-tglu-8/igt@gem_exec_big@single.html

  * igt@gem_exec_capture@capture-invisible:
    - shard-glk10:        NOTRUN -> [SKIP][53] ([i915#6334]) +1 other test skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk10/igt@gem_exec_capture@capture-invisible.html

  * igt@gem_exec_capture@capture-invisible@smem0:
    - shard-tglu:         NOTRUN -> [SKIP][54] ([i915#6334]) +1 other test skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-tglu-9/igt@gem_exec_capture@capture-invisible@smem0.html

  * igt@gem_exec_capture@pi:
    - shard-snb:          NOTRUN -> [SKIP][55] ([i915#17610]) +2 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb7/igt@gem_exec_capture@pi.html

  * igt@gem_exec_fence@submit3:
    - shard-snb:          NOTRUN -> [SKIP][56] ([i915#17599]) +2 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb5/igt@gem_exec_fence@submit3.html

  * igt@gem_exec_flush@basic-batch-kernel-default-cmd:
    - shard-dg1:          NOTRUN -> [SKIP][57] ([i915#3539] / [i915#4852]) +2 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg1-15/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html

  * igt@gem_exec_flush@basic-uc-rw-default:
    - shard-dg2:          NOTRUN -> [SKIP][58] ([i915#3539] / [i915#4852]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg2-3/igt@gem_exec_flush@basic-uc-rw-default.html

  * igt@gem_exec_params@rsvd2-dirt:
    - shard-rkl:          NOTRUN -> [SKIP][59] ([i915#17453])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-7/igt@gem_exec_params@rsvd2-dirt.html

  * igt@gem_exec_params@secure-non-master:
    - shard-rkl:          NOTRUN -> [SKIP][60] ([i915#17416])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-7/igt@gem_exec_params@secure-non-master.html
    - shard-dg1:          NOTRUN -> [SKIP][61] ([i915#17416]) +2 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg1-19/igt@gem_exec_params@secure-non-master.html
    - shard-snb:          NOTRUN -> [SKIP][62] ([i915#17523]) +1 other test skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb6/igt@gem_exec_params@secure-non-master.html

  * igt@gem_exec_params@secure-non-root:
    - shard-glk:          NOTRUN -> [SKIP][63] ([i915#17523]) +1 other test skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk3/igt@gem_exec_params@secure-non-root.html

  * igt@gem_exec_reloc@basic-gtt-cpu-active:
    - shard-rkl:          NOTRUN -> [SKIP][64] ([i915#14544] / [i915#3281])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-cpu-active.html

  * igt@gem_exec_reloc@basic-gtt-noreloc:
    - shard-mtlp:         NOTRUN -> [SKIP][65] ([i915#3281]) +5 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-mtlp-8/igt@gem_exec_reloc@basic-gtt-noreloc.html

  * igt@gem_exec_reloc@basic-gtt-read:
    - shard-dg2:          NOTRUN -> [SKIP][66] ([i915#3281]) +10 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg2-5/igt@gem_exec_reloc@basic-gtt-read.html

  * igt@gem_exec_reloc@basic-gtt-wc-noreloc:
    - shard-rkl:          NOTRUN -> [SKIP][67] ([i915#3281]) +20 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-4/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html

  * igt@gem_exec_reloc@basic-write-cpu-active:
    - shard-dg1:          NOTRUN -> [SKIP][68] ([i915#3281]) +16 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg1-18/igt@gem_exec_reloc@basic-write-cpu-active.html

  * igt@gem_exec_schedule@smoketest-all:
    - shard-snb:          NOTRUN -> [SKIP][69] ([i915#17590]) +11 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb5/igt@gem_exec_schedule@smoketest-all.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-glk11:        NOTRUN -> [INCOMPLETE][70] ([i915#13196] / [i915#13356]) +1 other test incomplete
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk11/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_exec_suspend@basic-s3@smem:
    - shard-snb:          NOTRUN -> [ABORT][71] ([i915#15840]) +11 other tests abort
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb4/igt@gem_exec_suspend@basic-s3@smem.html

  * igt@gem_exec_suspend@basic-s4-devices:
    - shard-rkl:          [PASS][72] -> [ABORT][73] ([i915#15542] / [i915#7975]) +1 other test abort
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9180/shard-rkl-3/igt@gem_exec_suspend@basic-s4-devices.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-1/igt@gem_exec_suspend@basic-s4-devices.html

  * igt@gem_exec_whisper@basic-queues-priority:
    - shard-snb:          NOTRUN -> [SKIP][74] ([i915#17628]) +1 other test skip
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb7/igt@gem_exec_whisper@basic-queues-priority.html

  * igt@gem_exercise_blt@fast-copy:
    - shard-snb:          NOTRUN -> [SKIP][75] ([i915#17622])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb1/igt@gem_exercise_blt@fast-copy.html

  * igt@gem_fence_thrash@bo-write-verify-none:
    - shard-mtlp:         NOTRUN -> [SKIP][76] ([i915#4860])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-mtlp-6/igt@gem_fence_thrash@bo-write-verify-none.html

  * igt@gem_fenced_exec_thrash@no-spare-fences:
    - shard-dg1:          NOTRUN -> [SKIP][77] ([i915#4860])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg1-17/igt@gem_fenced_exec_thrash@no-spare-fences.html
    - shard-dg2:          NOTRUN -> [SKIP][78] ([i915#4860])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg2-7/igt@gem_fenced_exec_thrash@no-spare-fences.html

  * igt@gem_gpgpu_fill@basic:
    - shard-snb:          NOTRUN -> [SKIP][79] ([i915#17608])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb6/igt@gem_gpgpu_fill@basic.html

  * igt@gem_huc_copy@huc-copy:
    - shard-rkl:          NOTRUN -> [SKIP][80] ([i915#2190])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-8/igt@gem_huc_copy@huc-copy.html
    - shard-tglu:         NOTRUN -> [SKIP][81] ([i915#2190])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-tglu-7/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][82] ([i915#14544] / [i915#4613]) +3 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-6/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html

  * igt@gem_lmem_swapping@parallel-multi:
    - shard-rkl:          NOTRUN -> [SKIP][83] ([i915#4613]) +2 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-5/igt@gem_lmem_swapping@parallel-multi.html

  * igt@gem_lmem_swapping@parallel-random-verify:
    - shard-glk11:        NOTRUN -> [SKIP][84] ([i915#17503]) +2 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk11/igt@gem_lmem_swapping@parallel-random-verify.html

  * igt@gem_lmem_swapping@parallel-random-verify-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][85] ([i915#12193]) +1 other test skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg1-14/igt@gem_lmem_swapping@parallel-random-verify-ccs.html

  * igt@gem_lmem_swapping@random-engines:
    - shard-glk:          NOTRUN -> [SKIP][86] ([i915#17503] / [i915#4613]) +7 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk9/igt@gem_lmem_swapping@random-engines.html

  * igt@gem_lmem_swapping@smem-oom:
    - shard-snb:          NOTRUN -> [SKIP][87] ([i915#17503]) +8 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb7/igt@gem_lmem_swapping@smem-oom.html
    - shard-tglu:         NOTRUN -> [SKIP][88] ([i915#4613]) +3 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-tglu-9/igt@gem_lmem_swapping@smem-oom.html
    - shard-mtlp:         NOTRUN -> [SKIP][89] ([i915#4613]) +3 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-mtlp-1/igt@gem_lmem_swapping@smem-oom.html

  * igt@gem_lmem_swapping@verify-ccs@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][90] ([i915#4565]) +1 other test skip
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg1-17/igt@gem_lmem_swapping@verify-ccs@lmem0.html

  * igt@gem_media_fill@media-fill:
    - shard-mtlp:         NOTRUN -> [SKIP][91] ([i915#8289])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-mtlp-2/igt@gem_media_fill@media-fill.html
    - shard-dg2:          NOTRUN -> [SKIP][92] ([i915#8289])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg2-8/igt@gem_media_fill@media-fill.html

  * igt@gem_mmap@big-bo:
    - shard-mtlp:         NOTRUN -> [SKIP][93] ([i915#4083]) +2 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-mtlp-2/igt@gem_mmap@big-bo.html

  * igt@gem_mmap_gtt@coherency:
    - shard-rkl:          NOTRUN -> [SKIP][94] ([i915#17429])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-4/igt@gem_mmap_gtt@coherency.html
    - shard-tglu:         NOTRUN -> [SKIP][95] ([i915#17429])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-tglu-2/igt@gem_mmap_gtt@coherency.html

  * igt@gem_mmap_gtt@flink-race:
    - shard-dg1:          NOTRUN -> [SKIP][96] ([i915#4077]) +11 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg1-15/igt@gem_mmap_gtt@flink-race.html

  * igt@gem_mmap_gtt@medium-copy-odd:
    - shard-dg2:          NOTRUN -> [SKIP][97] ([i915#4077]) +4 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg2-6/igt@gem_mmap_gtt@medium-copy-odd.html

  * igt@gem_mmap_gtt@medium-copy-xy:
    - shard-mtlp:         NOTRUN -> [SKIP][98] ([i915#4077]) +2 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-mtlp-2/igt@gem_mmap_gtt@medium-copy-xy.html

  * igt@gem_mmap_wc@close:
    - shard-dg2:          NOTRUN -> [SKIP][99] ([i915#4083]) +2 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg2-8/igt@gem_mmap_wc@close.html

  * igt@gem_mmap_wc@copy:
    - shard-dg1:          NOTRUN -> [SKIP][100] ([i915#4083]) +5 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg1-18/igt@gem_mmap_wc@copy.html

  * igt@gem_partial_pwrite_pread@writes-after-reads:
    - shard-rkl:          NOTRUN -> [SKIP][101] ([i915#3282]) +7 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-7/igt@gem_partial_pwrite_pread@writes-after-reads.html
    - shard-dg1:          NOTRUN -> [SKIP][102] ([i915#3282]) +5 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg1-17/igt@gem_partial_pwrite_pread@writes-after-reads.html
    - shard-mtlp:         NOTRUN -> [SKIP][103] ([i915#3282])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-mtlp-5/igt@gem_partial_pwrite_pread@writes-after-reads.html

  * igt@gem_ppgtt@shrink-vs-evict-any:
    - shard-snb:          NOTRUN -> [SKIP][104] ([i915#17615])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb4/igt@gem_ppgtt@shrink-vs-evict-any.html

  * igt@gem_pxp@display-protected-crc:
    - shard-dg1:          NOTRUN -> [SKIP][105] ([i915#4270]) +2 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg1-15/igt@gem_pxp@display-protected-crc.html

  * igt@gem_pxp@fail-invalid-protected-context:
    - shard-glk11:        NOTRUN -> [SKIP][106] ([i915#17521]) +1 other test skip
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk11/igt@gem_pxp@fail-invalid-protected-context.html

  * igt@gem_pxp@hw-rejects-pxp-buffer:
    - shard-tglu:         NOTRUN -> [SKIP][107] ([i915#13398])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-tglu-7/igt@gem_pxp@hw-rejects-pxp-buffer.html
    - shard-mtlp:         NOTRUN -> [SKIP][108] ([i915#13398])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-mtlp-2/igt@gem_pxp@hw-rejects-pxp-buffer.html

  * igt@gem_pxp@hw-rejects-pxp-context:
    - shard-rkl:          NOTRUN -> [SKIP][109] ([i915#13717])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-8/igt@gem_pxp@hw-rejects-pxp-context.html

  * igt@gem_pxp@protected-encrypted-src-copy-not-readible:
    - shard-dg2:          NOTRUN -> [SKIP][110] ([i915#4270]) +1 other test skip
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg2-7/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html
    - shard-snb:          NOTRUN -> [SKIP][111] ([i915#17521]) +2 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb6/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html

  * igt@gem_pxp@reject-modify-context-protection-off-1:
    - shard-glk:          NOTRUN -> [SKIP][112] ([i915#17521]) +5 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk5/igt@gem_pxp@reject-modify-context-protection-off-1.html

  * igt@gem_pxp@reject-modify-context-protection-off-3:
    - shard-rkl:          [PASS][113] -> [SKIP][114] ([i915#4270])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9180/shard-rkl-3/igt@gem_pxp@reject-modify-context-protection-off-3.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-8/igt@gem_pxp@reject-modify-context-protection-off-3.html

  * igt@gem_readwrite@write-bad-handle:
    - shard-dg2:          NOTRUN -> [SKIP][115] ([i915#3282]) +2 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg2-5/igt@gem_readwrite@write-bad-handle.html

  * igt@gem_render_copy@y-tiled-to-vebox-linear:
    - shard-snb:          NOTRUN -> [SKIP][116] ([i915#17492]) +1 other test skip
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb1/igt@gem_render_copy@y-tiled-to-vebox-linear.html

  * igt@gem_render_copy@y-tiled-to-vebox-yf-tiled:
    - shard-glk11:        NOTRUN -> [SKIP][117] ([i915#17492]) +2 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk11/igt@gem_render_copy@y-tiled-to-vebox-yf-tiled.html

  * igt@gem_render_copy@yf-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][118] ([i915#8428]) +2 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-mtlp-3/igt@gem_render_copy@yf-tiled.html

  * igt@gem_render_copy@yf-tiled-ccs-to-y-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][119] ([i915#5190] / [i915#8428]) +3 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg2-7/igt@gem_render_copy@yf-tiled-ccs-to-y-tiled.html

  * igt@gem_render_copy@yf-tiled-ccs-to-y-tiled-ccs:
    - shard-snb:          NOTRUN -> [SKIP][120] ([i915#17591]) +9 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb4/igt@gem_render_copy@yf-tiled-ccs-to-y-tiled-ccs.html

  * igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled:
    - shard-glk:          NOTRUN -> [SKIP][121] ([i915#17492]) +1 other test skip
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk3/igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled.html

  * igt@gem_set_tiling_vs_blt@tiled-to-untiled:
    - shard-rkl:          NOTRUN -> [SKIP][122] ([i915#8411])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-7/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html

  * igt@gem_softpin@evict-snoop:
    - shard-rkl:          NOTRUN -> [SKIP][123] ([i915#17430]) +1 other test skip
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-8/igt@gem_softpin@evict-snoop.html
    - shard-glk:          NOTRUN -> [SKIP][124] ([i915#17551]) +1 other test skip
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk9/igt@gem_softpin@evict-snoop.html

  * igt@gem_softpin@safe-alignment:
    - shard-snb:          NOTRUN -> [SKIP][125] ([i915#17471]) +7 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb6/igt@gem_softpin@safe-alignment.html

  * igt@gem_userptr_blits@coherency-sync:
    - shard-tglu:         NOTRUN -> [SKIP][126] ([i915#17433] / [i915#3297])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-tglu-4/igt@gem_userptr_blits@coherency-sync.html
    - shard-glk:          NOTRUN -> [SKIP][127] ([i915#16871])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk3/igt@gem_userptr_blits@coherency-sync.html

  * igt@gem_userptr_blits@coherency-unsync:
    - shard-dg1:          NOTRUN -> [SKIP][128] ([i915#3297]) +2 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg1-17/igt@gem_userptr_blits@coherency-unsync.html

  * igt@gem_userptr_blits@create-destroy-unsync:
    - shard-rkl:          NOTRUN -> [SKIP][129] ([i915#3297]) +3 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-4/igt@gem_userptr_blits@create-destroy-unsync.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-glk:          NOTRUN -> [SKIP][130] ([i915#17507] / [i915#3323])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk9/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@map-fixed-invalidate:
    - shard-dg2:          NOTRUN -> [SKIP][131] ([i915#3297] / [i915#4880])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg2-6/igt@gem_userptr_blits@map-fixed-invalidate.html
    - shard-mtlp:         NOTRUN -> [SKIP][132] ([i915#3297])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-mtlp-8/igt@gem_userptr_blits@map-fixed-invalidate.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap:
    - shard-dg1:          NOTRUN -> [SKIP][133] ([i915#3297] / [i915#4880]) +2 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg1-15/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html

  * igt@gem_userptr_blits@sd-probe:
    - shard-dg1:          NOTRUN -> [SKIP][134] ([i915#3297] / [i915#4958])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg1-19/igt@gem_userptr_blits@sd-probe.html

  * igt@gem_userptr_blits@unsync-overlap:
    - shard-snb:          NOTRUN -> [SKIP][135] ([i915#17507]) +4 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb1/igt@gem_userptr_blits@unsync-overlap.html

  * igt@gem_userptr_blits@unsync-unmap:
    - shard-glk:          NOTRUN -> [SKIP][136] ([i915#17507]) +3 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk5/igt@gem_userptr_blits@unsync-unmap.html

  * igt@gem_userptr_blits@unsync-unmap-after-close:
    - shard-tglu:         NOTRUN -> [SKIP][137] ([i915#3297])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-tglu-3/igt@gem_userptr_blits@unsync-unmap-after-close.html

  * igt@gem_userptr_blits@unsync-unmap-cycles:
    - shard-glk11:        NOTRUN -> [SKIP][138] ([i915#17507]) +3 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk11/igt@gem_userptr_blits@unsync-unmap-cycles.html

  * igt@gem_vm_create@create-ext:
    - shard-snb:          NOTRUN -> [SKIP][139] ([i915#17596]) +1 other test skip
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb6/igt@gem_vm_create@create-ext.html

  * igt@gem_watchdog@default-physical:
    - shard-snb:          NOTRUN -> [SKIP][140] ([i915#17669])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb4/igt@gem_watchdog@default-physical.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-glk:          NOTRUN -> [INCOMPLETE][141] ([i915#13356] / [i915#14586])
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk6/igt@gem_workarounds@suspend-resume-fd.html

  * igt@gen3_render_linear_blits:
    - shard-snb:          NOTRUN -> [SKIP][142] ([i915#17555])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb5/igt@gen3_render_linear_blits.html
    - shard-glk10:        NOTRUN -> [SKIP][143] ([i915#17555])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk10/igt@gen3_render_linear_blits.html

  * igt@gen3_render_mixed_blits:
    - shard-glk:          NOTRUN -> [SKIP][144] ([i915#17532])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk9/igt@gen3_render_mixed_blits.html
    - shard-snb:          NOTRUN -> [SKIP][145] ([i915#17532])
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb1/igt@gen3_render_mixed_blits.html

  * igt@gen7_exec_parse@basic-allocation:
    - shard-glk11:        NOTRUN -> [SKIP][146] ([i915#17505])
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk11/igt@gen7_exec_parse@basic-allocation.html

  * igt@gen7_exec_parse@basic-allowed:
    - shard-snb:          NOTRUN -> [SKIP][147] ([i915#17505])
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb4/igt@gen7_exec_parse@basic-allowed.html

  * igt@gen7_exec_parse@basic-rejected:
    - shard-dg1:          NOTRUN -> [SKIP][148] ([i915#17455]) +3 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg1-19/igt@gen7_exec_parse@basic-rejected.html

  * igt@gen7_exec_parse@batch-without-end:
    - shard-rkl:          NOTRUN -> [SKIP][149] ([i915#14544] / [i915#17455])
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-6/igt@gen7_exec_parse@batch-without-end.html

  * igt@gen7_exec_parse@chained-batch:
    - shard-glk:          NOTRUN -> [SKIP][150] ([i915#17505]) +3 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk1/igt@gen7_exec_parse@chained-batch.html

  * igt@gen7_exec_parse@oacontrol-tracking:
    - shard-tglu:         NOTRUN -> [SKIP][151] ([i915#17455]) +3 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-tglu-2/igt@gen7_exec_parse@oacontrol-tracking.html

  * igt@gen9_exec_parse@basic-rejected:
    - shard-tglu:         NOTRUN -> [SKIP][152] ([i915#2527] / [i915#2856]) +2 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-tglu-4/igt@gen9_exec_parse@basic-rejected.html
    - shard-mtlp:         NOTRUN -> [SKIP][153] ([i915#2856]) +1 other test skip
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-mtlp-6/igt@gen9_exec_parse@basic-rejected.html
    - shard-dg2:          NOTRUN -> [SKIP][154] ([i915#2856]) +1 other test skip
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg2-6/igt@gen9_exec_parse@basic-rejected.html

  * igt@gen9_exec_parse@bb-oversize:
    - shard-rkl:          NOTRUN -> [SKIP][155] ([i915#2527]) +6 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-8/igt@gen9_exec_parse@bb-oversize.html

  * igt@gen9_exec_parse@bb-start-cmd:
    - shard-snb:          NOTRUN -> [SKIP][156] ([i915#17597]) +3 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb1/igt@gen9_exec_parse@bb-start-cmd.html

  * igt@gen9_exec_parse@shadow-peek:
    - shard-dg1:          NOTRUN -> [SKIP][157] ([i915#2527]) +4 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg1-15/igt@gen9_exec_parse@shadow-peek.html

  * igt@i915_drm_fdinfo@all-busy-check-all:
    - shard-dg1:          NOTRUN -> [SKIP][158] ([i915#14123])
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg1-17/igt@i915_drm_fdinfo@all-busy-check-all.html

  * igt@i915_drm_fdinfo@busy-hang@ccs0:
    - shard-mtlp:         NOTRUN -> [SKIP][159] ([i915#14073]) +6 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-mtlp-8/igt@i915_drm_fdinfo@busy-hang@ccs0.html

  * igt@i915_drm_fdinfo@busy-hang@vcs0:
    - shard-dg2:          NOTRUN -> [SKIP][160] ([i915#14073]) +7 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg2-6/igt@i915_drm_fdinfo@busy-hang@vcs0.html
    - shard-dg1:          NOTRUN -> [SKIP][161] ([i915#14073]) +5 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg1-16/igt@i915_drm_fdinfo@busy-hang@vcs0.html

  * igt@i915_drm_fdinfo@memory-info-purgeable:
    - shard-snb:          NOTRUN -> [SKIP][162] ([i915#17603]) +6 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb7/igt@i915_drm_fdinfo@memory-info-purgeable.html

  * igt@i915_drm_fdinfo@virtual-busy-idle:
    - shard-dg1:          NOTRUN -> [SKIP][163] ([i915#14118])
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg1-16/igt@i915_drm_fdinfo@virtual-busy-idle.html

  * igt@i915_fb_tiling@basic-x-tiling:
    - shard-mtlp:         NOTRUN -> [SKIP][164] ([i915#13786])
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-mtlp-7/igt@i915_fb_tiling@basic-x-tiling.html

  * igt@i915_hangman@gt-engine-error@bcs0:
    - shard-glk:          NOTRUN -> [SKIP][165] ([i915#17580])
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk5/igt@i915_hangman@gt-engine-error@bcs0.html

  * igt@i915_hangman@hangcheck-unterminated:
    - shard-snb:          NOTRUN -> [SKIP][166] ([i915#17607])
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb4/igt@i915_hangman@hangcheck-unterminated.html

  * igt@i915_module_load@reload-no-display:
    - shard-tglu:         [PASS][167] -> [ABORT][168] ([i915#16996])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9180/shard-tglu-4/igt@i915_module_load@reload-no-display.html
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-tglu-3/igt@i915_module_load@reload-no-display.html

  * igt@i915_module_load@resize-bar:
    - shard-rkl:          NOTRUN -> [SKIP][169] ([i915#14544] / [i915#6412])
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-6/igt@i915_module_load@resize-bar.html
    - shard-dg1:          NOTRUN -> [SKIP][170] ([i915#7178])
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg1-18/igt@i915_module_load@resize-bar.html
    - shard-snb:          NOTRUN -> [SKIP][171] ([i915#17566])
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb5/igt@i915_module_load@resize-bar.html
    - shard-glk:          NOTRUN -> [SKIP][172] ([i915#17566])
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk3/igt@i915_module_load@resize-bar.html

  * igt@i915_pm_freq_api@freq-basic-api:
    - shard-glk:          NOTRUN -> [SKIP][173] ([i915#17526])
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk8/igt@i915_pm_freq_api@freq-basic-api.html
    - shard-rkl:          NOTRUN -> [SKIP][174] ([i915#8399])
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-2/igt@i915_pm_freq_api@freq-basic-api.html
    - shard-snb:          NOTRUN -> [SKIP][175] ([i915#17526])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb4/igt@i915_pm_freq_api@freq-basic-api.html

  * igt@i915_pm_freq_mult@media-freq:
    - shard-glk:          NOTRUN -> [SKIP][176] ([i915#17699]) +1 other test skip
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk6/igt@i915_pm_freq_mult@media-freq.html

  * igt@i915_pm_freq_mult@media-freq@gt0:
    - shard-rkl:          NOTRUN -> [SKIP][177] ([i915#6590]) +1 other test skip
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-8/igt@i915_pm_freq_mult@media-freq@gt0.html
    - shard-dg1:          NOTRUN -> [SKIP][178] ([i915#6590]) +1 other test skip
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg1-14/igt@i915_pm_freq_mult@media-freq@gt0.html
    - shard-snb:          NOTRUN -> [SKIP][179] ([i915#17624]) +1 other test skip
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb4/igt@i915_pm_freq_mult@media-freq@gt0.html

  * igt@i915_pm_rc6_residency@media-rc6-accuracy:
    - shard-glk:          NOTRUN -> [SKIP][180] ([i915#17541])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk9/igt@i915_pm_rc6_residency@media-rc6-accuracy.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-tglu:         NOTRUN -> [WARN][181] ([i915#13790] / [i915#2681]) +1 other test warn
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-tglu-8/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-tglu:         NOTRUN -> [SKIP][182] ([i915#14498])
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-tglu-4/igt@i915_pm_rc6_residency@rc6-idle.html
    - shard-glk:          NOTRUN -> [SKIP][183] ([i915#17690])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk3/igt@i915_pm_rc6_residency@rc6-idle.html
    - shard-snb:          NOTRUN -> [SKIP][184] ([i915#17690])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb7/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
    - shard-glk:          NOTRUN -> [SKIP][185] ([i915#17706])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk9/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html
    - shard-rkl:          NOTRUN -> [SKIP][186] ([i915#17434] / [i915#17450])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-5/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html

  * igt@i915_pm_rps@min-max-config-idle:
    - shard-dg1:          NOTRUN -> [SKIP][187] ([i915#11681] / [i915#6621]) +1 other test skip
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg1-15/igt@i915_pm_rps@min-max-config-idle.html

  * igt@i915_pm_rps@thresholds-idle-park:
    - shard-mtlp:         NOTRUN -> [SKIP][188] ([i915#11681])
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-mtlp-5/igt@i915_pm_rps@thresholds-idle-park.html

  * igt@i915_power@sanity:
    - shard-mtlp:         [PASS][189] -> [SKIP][190] ([i915#7984])
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9180/shard-mtlp-6/igt@i915_power@sanity.html
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-mtlp-8/igt@i915_power@sanity.html
    - shard-rkl:          NOTRUN -> [SKIP][191] ([i915#7984])
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-3/igt@i915_power@sanity.html

  * igt@i915_query@hwconfig_table:
    - shard-snb:          NOTRUN -> [SKIP][192] ([i915#17584])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb5/igt@i915_query@hwconfig_table.html
    - shard-glk10:        NOTRUN -> [SKIP][193] ([i915#17584])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk10/igt@i915_query@hwconfig_table.html

  * igt@i915_query@query-topology-coherent-slice-mask:
    - shard-mtlp:         NOTRUN -> [SKIP][194] ([i915#6188])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-mtlp-2/igt@i915_query@query-topology-coherent-slice-mask.html
    - shard-dg2:          NOTRUN -> [SKIP][195] ([i915#6188])
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg2-8/igt@i915_query@query-topology-coherent-slice-mask.html

  * igt@i915_query@query-topology-garbage-items:
    - shard-snb:          NOTRUN -> [SKIP][196] ([i915#17629])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb1/igt@i915_query@query-topology-garbage-items.html

  * igt@i915_query@query-topology-known-pci-ids:
    - shard-dg1:          NOTRUN -> [SKIP][197] ([i915#16109])
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg1-17/igt@i915_query@query-topology-known-pci-ids.html
    - shard-mtlp:         NOTRUN -> [SKIP][198] ([i915#16109])
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-mtlp-5/igt@i915_query@query-topology-known-pci-ids.html

  * igt@i915_query@test-query-geometry-subslices:
    - shard-tglu:         NOTRUN -> [SKIP][199] ([i915#5723])
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-tglu-3/igt@i915_query@test-query-geometry-subslices.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-tglu:         NOTRUN -> [INCOMPLETE][200] ([i915#4817] / [i915#7443])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-tglu-8/igt@i915_suspend@basic-s3-without-i915.html

  * igt@i915_suspend@forcewake:
    - shard-glk:          NOTRUN -> [INCOMPLETE][201] ([i915#13356] / [i915#16182] / [i915#4817])
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk3/igt@i915_suspend@forcewake.html

  * igt@intel_hwmon@hwmon-write:
    - shard-rkl:          NOTRUN -> [SKIP][202] ([i915#7707])
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-5/igt@intel_hwmon@hwmon-write.html
    - shard-snb:          NOTRUN -> [SKIP][203] ([i915#17674])
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb6/igt@intel_hwmon@hwmon-write.html

  * igt@kms_addfb_basic@bo-too-small-due-to-tiling:
    - shard-dg1:          NOTRUN -> [SKIP][204] ([i915#4212]) +2 other tests skip
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg1-16/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html
    - shard-mtlp:         NOTRUN -> [SKIP][205] ([i915#4212]) +1 other test skip
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-mtlp-8/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-glk:          NOTRUN -> [SKIP][206] ([i915#17668])
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk5/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
    - shard-snb:          NOTRUN -> [SKIP][207] ([i915#17668])
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb7/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_addfb_basic@tile-pitch-mismatch:
    - shard-dg2:          NOTRUN -> [SKIP][208] ([i915#4212])
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg2-4/igt@kms_addfb_basic@tile-pitch-mismatch.html

  * igt@kms_async_flips@async-flip-dpms@pipe-a-vga-1:
    - shard-snb:          NOTRUN -> [SKIP][209] ([i915#17644]) +2 other tests skip
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb1/igt@kms_async_flips@async-flip-dpms@pipe-a-vga-1.html

  * igt@kms_async_flips@async-flip-dpms@pipe-b-hdmi-a-1:
    - shard-snb:          NOTRUN -> [SKIP][210] ([i915#17613]) +3 other tests skip
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb1/igt@kms_async_flips@async-flip-dpms@pipe-b-hdmi-a-1.html

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-mtlp:         [PASS][211] -> [INCOMPLETE][212] ([i915#17037]) +1 other test incomplete
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9180/shard-mtlp-6/igt@kms_async_flips@async-flip-suspend-resume.html
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-mtlp-8/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-b-edp-1:
    - shard-mtlp:         [PASS][213] -> [FAIL][214] ([i915#17150])
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9180/shard-mtlp-6/igt@kms_async_flips@async-flip-suspend-resume@pipe-b-edp-1.html
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-mtlp-8/igt@kms_async_flips@async-flip-suspend-resume@pipe-b-edp-1.html

  * igt@kms_async_flips@invalid-async-flip@pipe-a-hdmi-a-1:
    - shard-snb:          NOTRUN -> [SKIP][215] ([i915#17614]) +2 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb6/igt@kms_async_flips@invalid-async-flip@pipe-a-hdmi-a-1.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-mtlp:         NOTRUN -> [SKIP][216] ([i915#3555])
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-mtlp-4/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-dg1:          NOTRUN -> [SKIP][217] ([i915#1769] / [i915#3555])
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg1-19/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-90:
    - shard-tglu:         NOTRUN -> [SKIP][218] ([i915#17432] / [i915#5286]) +6 other tests skip
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-tglu-9/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-0:
    - shard-dg1:          NOTRUN -> [SKIP][219] ([i915#4538] / [i915#5286]) +2 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg1-15/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
    - shard-glk11:        NOTRUN -> [SKIP][220] ([i915#17478]) +4 other tests skip
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk11/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-addfb:
    - shard-rkl:          NOTRUN -> [SKIP][221] ([i915#5286]) +1 other test skip
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-7/igt@kms_big_fb@4-tiled-addfb.html

  * igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:
    - shard-dg1:          NOTRUN -> [SKIP][222] ([i915#5286])
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg1-14/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-glk10:        NOTRUN -> [SKIP][223] ([i915#17478])
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk10/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-glk:          NOTRUN -> [SKIP][224] ([i915#17478]) +13 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-rkl:          NOTRUN -> [SKIP][225] ([i915#14544] / [i915#4538] / [i915#5286])
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-mtlp:         [PASS][226] -> [FAIL][227] ([i915#15733] / [i915#5138])
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9180/shard-mtlp-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-mtlp-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-rkl:          NOTRUN -> [SKIP][228] ([i915#4538] / [i915#5286]) +8 other tests skip
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-dg2:          NOTRUN -> [SKIP][229] ([i915#17431])
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg2-5/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-glk:          NOTRUN -> [SKIP][230] ([i915#17500]) +12 other tests skip
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk9/igt@kms_big_fb@linear-16bpp-rotate-90.html
    - shard-snb:          NOTRUN -> [SKIP][231] ([i915#17500]) +5 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb1/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@linear-64bpp-rotate-270:
    - shard-glk11:        NOTRUN -> [SKIP][232] ([i915#17500]) +3 other tests skip
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk11/igt@kms_big_fb@linear-64bpp-rotate-270.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-tglu:         NOTRUN -> [SKIP][233] ([i915#17431]) +4 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-tglu-3/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-glk11:        NOTRUN -> [SKIP][234] ([i915#17524])
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk11/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-snb:          NOTRUN -> [SKIP][235] ([i915#17524])
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb1/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html
    - shard-mtlp:         NOTRUN -> [SKIP][236] ([i915#3828]) +2 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-mtlp-1/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-dg2:          NOTRUN -> [SKIP][237] ([i915#3828]) +1 other test skip
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg2-8/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html
    - shard-tglu:         NOTRUN -> [SKIP][238] ([i915#3828])
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-tglu-3/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-dg1:          NOTRUN -> [SKIP][239] ([i915#3828])
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg1-19/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][240] ([i915#17431] / [i915#3638]) +4 other tests skip
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-5/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
    - shard-mtlp:         NOTRUN -> [SKIP][241] ([i915#17431])
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-mtlp-8/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
    - shard-dg1:          NOTRUN -> [SKIP][242] ([i915#3638]) +3 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg1-15/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-90:
    - shard-dg2:          NOTRUN -> [SKIP][243] ([i915#4538] / [i915#5190]) +2 other tests skip
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg2-6/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-snb:          NOTRUN -> [SKIP][244] ([i915#17557]) +1 other test skip
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb7/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
    - shard-mtlp:         NOTRUN -> [SKIP][245] ([i915#6187]) +1 other test skip
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-mtlp-6/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-tglu:         NOTRUN -> [SKIP][246] ([i915#17432]) +7 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-tglu-10/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
    - shard-mtlp:         NOTRUN -> [SKIP][247] ([i915#17432]) +5 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-mtlp-8/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-rkl:          NOTRUN -> [SKIP][248] ([i915#4538]) +7 other tests skip
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
    - shard-dg1:          NOTRUN -> [SKIP][249] ([i915#4538]) +6 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg1-16/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-snb:          NOTRUN -> [SKIP][250] ([i915#17478]) +29 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_busy@extended-modeset-hang-newfb-with-reset:
    - shard-tglu:         [PASS][251] -> [DMESG-WARN][252] ([i915#13363])
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9180/shard-tglu-8/igt@kms_busy@extended-modeset-hang-newfb-with-reset.html
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-tglu-3/igt@kms_busy@extended-modeset-hang-newfb-with-reset.html

  * igt@kms_busy@extended-modeset-hang-newfb-with-reset@pipe-a:
    - shard-tglu:         [PASS][253] -> [DMESG-WARN][254] ([i915#17147])
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9180/shard-tglu-8/igt@kms_busy@extended-modeset-hang-newfb-with-reset@pipe-a.html
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-tglu-3/igt@kms_busy@extended-modeset-hang-newfb-with-reset@pipe-a.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][255] ([i915#6095]) +156 other tests skip
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg1-17/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][256] ([i915#6095]) +29 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-mtlp-2/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-2:
    - shard-glk:          NOTRUN -> [SKIP][257] ([i915#17491]) +97 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk9/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-ccs@pipe-c-hdmi-a-2:
    - shard-glk10:        NOTRUN -> [SKIP][258] ([i915#17491]) +18 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk10/igt@kms_ccs@bad-pixel-format-y-tiled-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][259] ([i915#12313] / [i915#14544])
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][260] ([i915#10307] / [i915#10434] / [i915#6095])
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg2-4/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2:
    - shard-glk:          NOTRUN -> [SKIP][261] ([i915#17490] / [i915#17491]) +35 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk1/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][262] ([i915#6095]) +79 other tests skip
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-tglu-10/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-2:
    - shard-glk11:        NOTRUN -> [SKIP][263] ([i915#17490] / [i915#17491]) +15 other tests skip
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk11/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][264] ([i915#12313])
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-tglu-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][265] ([i915#12313])
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg2-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html
    - shard-rkl:          NOTRUN -> [SKIP][266] ([i915#12313]) +1 other test skip
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html
    - shard-mtlp:         NOTRUN -> [SKIP][267] ([i915#12313])
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-mtlp-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-glk:          NOTRUN -> [SKIP][268] ([i915#17525]) +3 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk3/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][269] ([i915#6095]) +7 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg2-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][270] ([i915#14544] / [i915#6095])
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][271] ([i915#14098] / [i915#14544] / [i915#6095])
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][272] ([i915#14098] / [i915#6095]) +63 other tests skip
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-4/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][273] ([i915#12313]) +2 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg1-14/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2:
    - shard-glk11:        NOTRUN -> [SKIP][274] ([i915#17491]) +43 other tests skip
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk11/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-glk10:        NOTRUN -> [SKIP][275] ([i915#17525])
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk10/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][276] ([i915#10307] / [i915#6095]) +87 other tests skip
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg2-4/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-2:
    - shard-glk10:        NOTRUN -> [SKIP][277] ([i915#17490] / [i915#17491]) +5 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk10/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-glk11:        NOTRUN -> [SKIP][278] ([i915#17525])
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk11/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][279] ([i915#6095]) +84 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-7/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@random-ccs-data-y-tiled-ccs:
    - shard-snb:          NOTRUN -> [SKIP][280] ([i915#17594]) +28 other tests skip
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb1/igt@kms_ccs@random-ccs-data-y-tiled-ccs.html

  * igt@kms_cdclk@mode-rejected-max-dotclock:
    - shard-rkl:          NOTRUN -> [SKIP][281] ([i915#17099])
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-8/igt@kms_cdclk@mode-rejected-max-dotclock.html

  * igt@kms_cdclk@mode-transition:
    - shard-glk:          NOTRUN -> [SKIP][282] ([i915#17550]) +1 other test skip
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk4/igt@kms_cdclk@mode-transition.html
    - shard-snb:          NOTRUN -> [SKIP][283] ([i915#17550]) +1 other test skip
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb5/igt@kms_cdclk@mode-transition.html
    - shard-tglu:         NOTRUN -> [SKIP][284] ([i915#3742])
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-tglu-10/igt@kms_cdclk@mode-transition.html

  * igt@kms_chamelium_audio@dp-audio-after-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][285] ([i915#11151]) +1 other test skip
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-tglu-2/igt@kms_chamelium_audio@dp-audio-after-suspend.html

  * igt@kms_chamelium_audio@hdmi-audio:
    - shard-glk10:        NOTRUN -> [SKIP][286] ([i915#17483]) +1 other test skip
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk10/igt@kms_chamelium_audio@hdmi-audio.html

  * igt@kms_chamelium_audio@hdmi-audio-after-suspend:
    - shard-dg1:          NOTRUN -> [SKIP][287] ([i915#11151]) +1 other test skip
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg1-18/igt@kms_chamelium_audio@hdmi-audio-after-suspend.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-rkl:          NOTRUN -> [SKIP][288] ([i915#14544] / [i915#17427])
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-6/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-tglu:         NOTRUN -> [SKIP][289] ([i915#17427]) +3 other tests skip
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-tglu-4/igt@kms_chamelium_color@ctm-limited-range.html
    - shard-glk:          NOTRUN -> [SKIP][290] ([i915#17489])
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk3/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-snb:          NOTRUN -> [SKIP][291] ([i915#17489]) +1 other test skip
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb6/igt@kms_chamelium_color@ctm-max.html
    - shard-glk11:        NOTRUN -> [SKIP][292] ([i915#17489])
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk11/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_color@degamma:
    - shard-dg1:          NOTRUN -> [SKIP][293] ([i915#17427]) +5 other tests skip
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg1-18/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_color_pipeline@plane-ctm3x4:
    - shard-glk11:        NOTRUN -> [SKIP][294] ([i915#17497]) +1 other test skip
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk11/igt@kms_chamelium_color_pipeline@plane-ctm3x4.html

  * igt@kms_chamelium_color_pipeline@plane-ctm3x4-lut1d:
    - shard-dg2:          NOTRUN -> [SKIP][295] ([i915#16471] / [i915#17427])
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg2-5/igt@kms_chamelium_color_pipeline@plane-ctm3x4-lut1d.html
    - shard-dg1:          NOTRUN -> [SKIP][296] ([i915#16471] / [i915#17427])
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg1-14/igt@kms_chamelium_color_pipeline@plane-ctm3x4-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020:
    - shard-glk:          NOTRUN -> [SKIP][297] ([i915#17497]) +4 other tests skip
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk3/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020.html

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d:
    - shard-dg2:          NOTRUN -> [SKIP][298] ([i915#17427]) +1 other test skip
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg2-3/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d.html
    - shard-rkl:          NOTRUN -> [SKIP][299] ([i915#17427]) +3 other tests skip
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-2/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d.html
    - shard-mtlp:         NOTRUN -> [SKIP][300] ([i915#17427]) +3 other tests skip
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-mtlp-3/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d:
    - shard-snb:          NOTRUN -> [SKIP][301] ([i915#17497]) +5 other tests skip
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb7/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d:
    - shard-rkl:          NOTRUN -> [SKIP][302] ([i915#16471] / [i915#17427]) +2 other tests skip
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-4/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d.html
    - shard-tglu:         NOTRUN -> [SKIP][303] ([i915#16471] / [i915#17427]) +2 other tests skip
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-tglu-2/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4:
    - shard-glk10:        NOTRUN -> [SKIP][304] ([i915#17497]) +1 other test skip
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk10/igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4.html

  * igt@kms_chamelium_edid@hdmi-edid-read:
    - shard-snb:          NOTRUN -> [SKIP][305] ([i915#17483]) +18 other tests skip
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb1/igt@kms_chamelium_edid@hdmi-edid-read.html

  * igt@kms_chamelium_frames@dp-crc-fast:
    - shard-mtlp:         NOTRUN -> [SKIP][306] ([i915#11151] / [i915#7828]) +5 other tests skip
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-mtlp-4/igt@kms_chamelium_frames@dp-crc-fast.html

  * igt@kms_chamelium_frames@dp-crc-single:
    - shard-dg1:          NOTRUN -> [SKIP][307] ([i915#11151] / [i915#7828]) +14 other tests skip
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg1-17/igt@kms_chamelium_frames@dp-crc-single.html

  * igt@kms_chamelium_frames@hdmi-cmp-planar-formats:
    - shard-dg2:          NOTRUN -> [SKIP][308] ([i915#11151] / [i915#7828]) +7 other tests skip
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg2-7/igt@kms_chamelium_frames@hdmi-cmp-planar-formats.html

  * igt@kms_chamelium_frames@vga-frame-dump:
    - shard-rkl:          NOTRUN -> [SKIP][309] ([i915#11151] / [i915#14544] / [i915#7828])
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-6/igt@kms_chamelium_frames@vga-frame-dump.html

  * igt@kms_chamelium_hpd@dp-hpd-after-runtime-suspend-d3hot:
    - shard-dg2:          NOTRUN -> [SKIP][310] ([i915#11151])
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg2-7/igt@kms_chamelium_hpd@dp-hpd-after-runtime-suspend-d3hot.html
    - shard-rkl:          NOTRUN -> [SKIP][311] ([i915#11151])
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-2/igt@kms_chamelium_hpd@dp-hpd-after-runtime-suspend-d3hot.html

  * igt@kms_chamelium_hpd@dp-hpd-after-suspend:
    - shard-glk11:        NOTRUN -> [SKIP][312] ([i915#17483]) +5 other tests skip
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk11/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@hdmi-hpd-after-runtime-suspend-d3hot:
    - shard-mtlp:         NOTRUN -> [SKIP][313] ([i915#11151])
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-mtlp-4/igt@kms_chamelium_hpd@hdmi-hpd-after-runtime-suspend-d3hot.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-glk:          NOTRUN -> [SKIP][314] ([i915#17483]) +11 other tests skip
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk3/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_chamelium_hpd@vga-hpd-fast:
    - shard-rkl:          NOTRUN -> [SKIP][315] ([i915#11151] / [i915#7828]) +16 other tests skip
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-8/igt@kms_chamelium_hpd@vga-hpd-fast.html

  * igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:
    - shard-tglu:         NOTRUN -> [SKIP][316] ([i915#11151] / [i915#7828]) +9 other tests skip
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-tglu-3/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html

  * igt@kms_color@background-color@pipe-a-background-color:
    - shard-glk:          NOTRUN -> [FAIL][317] ([i915#17133]) +3 other tests fail
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk8/igt@kms_color@background-color@pipe-a-background-color.html
    - shard-snb:          NOTRUN -> [SKIP][318] ([i915#17663])
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb4/igt@kms_color@background-color@pipe-a-background-color.html

  * igt@kms_color@background-color@pipe-b-background-color:
    - shard-snb:          NOTRUN -> [SKIP][319] ([i915#17656]) +1 other test skip
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb4/igt@kms_color@background-color@pipe-b-background-color.html

  * igt@kms_color_pipeline@plane-ctm3x4:
    - shard-snb:          NOTRUN -> [SKIP][320] ([i915#17510]) +3 other tests skip
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb4/igt@kms_color_pipeline@plane-ctm3x4.html
    - shard-glk11:        NOTRUN -> [SKIP][321] ([i915#17510]) +2 other tests skip
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk11/igt@kms_color_pipeline@plane-ctm3x4.html

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601:
    - shard-glk:          NOTRUN -> [SKIP][322] ([i915#17510]) +2 other tests skip
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk5/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601.html

  * igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709:
    - shard-glk10:        NOTRUN -> [SKIP][323] ([i915#17510])
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk10/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709.html

  * igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d@pipe-d-plane-3:
    - shard-tglu:         NOTRUN -> [SKIP][324] ([i915#16990]) +31 other tests skip
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-tglu-4/igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d@pipe-d-plane-3.html

  * igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-b-plane-4:
    - shard-dg1:          NOTRUN -> [SKIP][325] ([i915#16990]) +31 other tests skip
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg1-14/igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-b-plane-4.html

  * igt@kms_content_protection@atomic-dpms-hdcp14:
    - shard-rkl:          NOTRUN -> [SKIP][326] ([i915#14544] / [i915#15865])
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-6/igt@kms_content_protection@atomic-dpms-hdcp14.html

  * igt@kms_content_protection@content-type-change:
    - shard-dg2:          NOTRUN -> [SKIP][327] ([i915#15865]) +2 other tests skip
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg2-6/igt@kms_content_protection@content-type-change.html
    - shard-mtlp:         NOTRUN -> [SKIP][328] ([i915#15865])
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-mtlp-6/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-rkl:          NOTRUN -> [SKIP][329] ([i915#15330] / [i915#3116])
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-7/igt@kms_content_protection@dp-mst-lic-type-1.html
    - shard-glk11:        NOTRUN -> [SKIP][330] ([i915#17502])
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk11/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-glk:          NOTRUN -> [SKIP][331] ([i915#17502])
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk4/igt@kms_content_protection@dp-mst-type-0.html
    - shard-snb:          NOTRUN -> [SKIP][332] ([i915#17502]) +1 other test skip
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb5/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@dp-mst-type-0-hdcp14:
    - shard-dg1:          NOTRUN -> [SKIP][333] ([i915#15330])
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg1-19/igt@kms_content_protection@dp-mst-type-0-hdcp14.html

  * igt@kms_content_protection@dp-mst-type-0-suspend-resume:
    - shard-rkl:          NOTRUN -> [SKIP][334] ([i915#15330])
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-5/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-dg1:          NOTRUN -> [SKIP][335] ([i915#15330] / [i915#3299])
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg1-15/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@legacy-hdcp14:
    - shard-glk:          NOTRUN -> [SKIP][336] ([i915#17508]) +6 other tests skip
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk3/igt@kms_content_protection@legacy-hdcp14.html
    - shard-rkl:          NOTRUN -> [SKIP][337] ([i915#15865]) +4 other tests skip
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-3/igt@kms_content_protection@legacy-hdcp14.html
    - shard-dg1:          NOTRUN -> [SKIP][338] ([i915#15865]) +3 other tests skip
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg1-18/igt@kms_content_protection@legacy-hdcp14.html
    - shard-snb:          NOTRUN -> [SKIP][339] ([i915#17508]) +5 other tests skip
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb7/igt@kms_content_protection@legacy-hdcp14.html

  * igt@kms_content_protection@srm:
    - shard-tglu:         NOTRUN -> [SKIP][340] ([i915#15865]) +3 other tests skip
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-tglu-3/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@suspend-resume:
    - shard-glk11:        NOTRUN -> [SKIP][341] ([i915#17508]) +1 other test skip
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk11/igt@kms_content_protection@suspend-resume.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-glk:          NOTRUN -> [SKIP][342] ([i915#17533]) +3 other tests skip
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk9/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-offscreen-max-size:
    - shard-glk:          NOTRUN -> [SKIP][343] ([i915#17504]) +2 other tests skip
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk9/igt@kms_cursor_crc@cursor-offscreen-max-size.html

  * igt@kms_cursor_crc@cursor-onscreen-32x32:
    - shard-rkl:          NOTRUN -> [SKIP][344] ([i915#3555]) +8 other tests skip
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-2/igt@kms_cursor_crc@cursor-onscreen-32x32.html
    - shard-dg1:          NOTRUN -> [SKIP][345] ([i915#3555]) +10 other tests skip
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg1-17/igt@kms_cursor_crc@cursor-onscreen-32x32.html
    - shard-snb:          NOTRUN -> [SKIP][346] ([i915#17504]) +8 other tests skip
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb6/igt@kms_cursor_crc@cursor-onscreen-32x32.html
    - shard-glk11:        NOTRUN -> [SKIP][347] ([i915#17504])
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk11/igt@kms_cursor_crc@cursor-onscreen-32x32.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-mtlp:         NOTRUN -> [SKIP][348] ([i915#13049] / [i915#3359]) +2 other tests skip
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-mtlp-3/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-128x42:
    - shard-rkl:          [PASS][349] -> [FAIL][350] ([i915#13566])
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9180/shard-rkl-2/igt@kms_cursor_crc@cursor-random-128x42.html
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-6/igt@kms_cursor_crc@cursor-random-128x42.html

  * igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1:
    - shard-tglu:         [PASS][351] -> [FAIL][352] ([i915#13566]) +1 other test fail
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9180/shard-tglu-2/igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1.html
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-tglu-10/igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [FAIL][353] ([i915#13566]) +4 other tests fail
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-7/igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-2.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-dg2:          NOTRUN -> [SKIP][354] ([i915#13049]) +2 other tests skip
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg2-7/igt@kms_cursor_crc@cursor-random-512x512.html
    - shard-rkl:          NOTRUN -> [SKIP][355] ([i915#13049]) +2 other tests skip
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-4/igt@kms_cursor_crc@cursor-random-512x512.html
    - shard-dg1:          NOTRUN -> [SKIP][356] ([i915#13049]) +5 other tests skip
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg1-17/igt@kms_cursor_crc@cursor-random-512x512.html
    - shard-glk11:        NOTRUN -> [SKIP][357] ([i915#17533]) +1 other test skip
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk11/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-snb:          NOTRUN -> [SKIP][358] ([i915#17533]) +4 other tests skip
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb1/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
    - shard-tglu:         NOTRUN -> [SKIP][359] ([i915#13049]) +3 other tests skip
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-tglu-7/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-64x21:
    - shard-mtlp:         NOTRUN -> [SKIP][360] ([i915#8814]) +2 other tests skip
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-mtlp-1/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html

  * igt@kms_cursor_crc@cursor-sliding-32x10:
    - shard-dg2:          NOTRUN -> [SKIP][361] ([i915#3555]) +3 other tests skip
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg2-4/igt@kms_cursor_crc@cursor-sliding-32x10.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-rkl:          NOTRUN -> [SKIP][362] ([i915#4103]) +2 other tests skip
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
    - shard-dg1:          NOTRUN -> [SKIP][363] ([i915#4103]) +1 other test skip
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg1-16/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
    - shard-snb:          NOTRUN -> [SKIP][364] ([i915#17457]) +2 other tests skip
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-mtlp:         NOTRUN -> [SKIP][365] ([i915#17428] / [i915#9809]) +1 other test skip
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-mtlp-3/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
    - shard-dg2:          NOTRUN -> [SKIP][366] ([i915#13046] / [i915#17454] / [i915#5354])
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg2-3/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
    - shard-dg2:          NOTRUN -> [SKIP][367] ([i915#9067])
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg2-3/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html
    - shard-rkl:          NOTRUN -> [SKIP][368] ([i915#9067])
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-2/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html
    - shard-dg1:          NOTRUN -> [SKIP][369] ([i915#9067])
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg1-15/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html
    - shard-tglu:         NOTRUN -> [SKIP][370] ([i915#9067])
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-tglu-9/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html
    - shard-mtlp:         NOTRUN -> [SKIP][371] ([i915#9067])
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-mtlp-1/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-glk:          NOTRUN -> [SKIP][372] ([i915#17457]) +1 other test skip
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk9/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg2:          NOTRUN -> [SKIP][373] ([i915#4103])
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg2-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-glk11:        NOTRUN -> [SKIP][374] ([i915#17457])
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk11/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-glk11:        NOTRUN -> [SKIP][375] ([i915#17515])
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk11/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
    - shard-snb:          NOTRUN -> [SKIP][376] ([i915#17515])
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb6/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-glk:          NOTRUN -> [SKIP][377] ([i915#17515])
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk3/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-rkl:          NOTRUN -> [SKIP][378] ([i915#3555] / [i915#3804])
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-8/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][379] ([i915#3804])
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-8/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html

  * igt@kms_dither@fb-8bpc-vs-panel-8bpc:
    - shard-snb:          NOTRUN -> [SKIP][380] ([i915#17486]) +1 other test skip
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb4/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html

  * igt@kms_dp_aux_dev@basic:
    - shard-tglu:         NOTRUN -> [SKIP][381] ([i915#1257])
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-tglu-4/igt@kms_dp_aux_dev@basic.html

  * igt@kms_dp_link_training@non-uhbr-mst-direct-train:
    - shard-tglu:         NOTRUN -> [SKIP][382] ([i915#17287])
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-tglu-3/igt@kms_dp_link_training@non-uhbr-mst-direct-train.html
    - shard-mtlp:         NOTRUN -> [SKIP][383] ([i915#17287])
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-mtlp-7/igt@kms_dp_link_training@non-uhbr-mst-direct-train.html
    - shard-dg2:          NOTRUN -> [SKIP][384] ([i915#17287])
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg2-3/igt@kms_dp_link_training@non-uhbr-mst-direct-train.html
    - shard-rkl:          NOTRUN -> [SKIP][385] ([i915#17287])
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-7/igt@kms_dp_link_training@non-uhbr-mst-direct-train.html

  * igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train:
    - shard-glk:          NOTRUN -> [SKIP][386] ([i915#17531])
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk5/igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train.html
    - shard-snb:          NOTRUN -> [SKIP][387] ([i915#17531])
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb6/igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train.html

  * igt@kms_dp_link_training@uhbr-mst-direct-train:
    - shard-glk:          NOTRUN -> [SKIP][388] ([i915#17477])
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk3/igt@kms_dp_link_training@uhbr-mst-direct-train.html
    - shard-dg2:          NOTRUN -> [SKIP][389] ([i915#17285])
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg2-6/igt@kms_dp_link_training@uhbr-mst-direct-train.html
    - shard-rkl:          NOTRUN -> [SKIP][390] ([i915#17285])
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-3/igt@kms_dp_link_training@uhbr-mst-direct-train.html
    - shard-snb:          NOTRUN -> [SKIP][391] ([i915#17477])
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb7/igt@kms_dp_link_training@uhbr-mst-direct-train.html

  * igt@kms_dp_link_training@uhbr-mst-tbtalt-train:
    - shard-glk10:        NOTRUN -> [SKIP][392] ([i915#17477])
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk10/igt@kms_dp_link_training@uhbr-mst-tbtalt-train.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-dg1:          NOTRUN -> [SKIP][393] ([i915#13748])
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg1-19/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_dp_link_training@uhbr-sst-tbtalt-train:
    - shard-dg1:          NOTRUN -> [SKIP][394] ([i915#17285]) +1 other test skip
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg1-14/igt@kms_dp_link_training@uhbr-sst-tbtalt-train.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-glk:          NOTRUN -> [SKIP][395] ([i915#17625])
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk4/igt@kms_dp_linktrain_fallback@dp-fallback.html
    - shard-rkl:          NOTRUN -> [SKIP][396] ([i915#14544] / [i915#16867])
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-6/igt@kms_dp_linktrain_fallback@dp-fallback.html
    - shard-snb:          NOTRUN -> [SKIP][397] ([i915#17625])
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb5/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback:
    - shard-tglu:         NOTRUN -> [SKIP][398] ([i915#16870])
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-tglu-4/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.html

  * igt@kms_draw_crc@draw-method-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][399] ([i915#8812])
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg1-17/igt@kms_draw_crc@draw-method-mmap-gtt.html
    - shard-mtlp:         NOTRUN -> [SKIP][400] ([i915#3555] / [i915#8812])
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-mtlp-4/igt@kms_draw_crc@draw-method-mmap-gtt.html
    - shard-dg2:          NOTRUN -> [SKIP][401] ([i915#8812])
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg2-7/igt@kms_draw_crc@draw-method-mmap-gtt.html

  * igt@kms_dsc@dsc-basic-bigjoiner:
    - shard-glk11:        NOTRUN -> [SKIP][402] ([i915#17458])
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk11/igt@kms_dsc@dsc-basic-bigjoiner.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-dg1:          NOTRUN -> [SKIP][403] ([i915#16361]) +3 other tests skip
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg1-14/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_dsc@dsc-fractional-bpp-ultrajoiner:
    - shard-glk:          NOTRUN -> [SKIP][404] ([i915#17458]) +5 other tests skip
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk4/igt@kms_dsc@dsc-fractional-bpp-ultrajoiner.html

  * igt@kms_dsc@dsc-with-bpc-bigjoiner:
    - shard-snb:          NOTRUN -> [SKIP][405] ([i915#17458]) +6 other tests skip
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb7/igt@kms_dsc@dsc-with-bpc-bigjoiner.html
    - shard-tglu:         NOTRUN -> [SKIP][406] ([i915#16361]) +4 other tests skip
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-tglu-3/igt@kms_dsc@dsc-with-bpc-bigjoiner.html
    - shard-mtlp:         NOTRUN -> [SKIP][407] ([i915#16361]) +2 other tests skip
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-mtlp-7/igt@kms_dsc@dsc-with-bpc-bigjoiner.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-dg2:          NOTRUN -> [SKIP][408] ([i915#16361]) +3 other tests skip
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg2-6/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_dsc@dsc-with-output-formats-ultrajoiner:
    - shard-glk10:        NOTRUN -> [SKIP][409] ([i915#17458])
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk10/igt@kms_dsc@dsc-with-output-formats-ultrajoiner.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner:
    - shard-rkl:          NOTRUN -> [SKIP][410] ([i915#16361]) +5 other tests skip
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-3/igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner.html

  * igt@kms_fbcon_fbt@psr:
    - shard-snb:          NOTRUN -> [SKIP][411] ([i915#17516])
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb4/igt@kms_fbcon_fbt@psr.html
    - shard-glk11:        NOTRUN -> [SKIP][412] ([i915#17516])
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk11/igt@kms_fbcon_fbt@psr.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][413] ([i915#16680]) +1 other test skip
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-4/igt@kms_fbcon_fbt@psr-suspend.html
    - shard-tglu:         NOTRUN -> [SKIP][414] ([i915#16680])
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-tglu-2/igt@kms_fbcon_fbt@psr-suspend.html
    - shard-glk:          NOTRUN -> [SKIP][415] ([i915#17516])
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk5/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@chamelium:
    - shard-snb:          NOTRUN -> [SKIP][416] ([i915#17581])
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb7/igt@kms_feature_discovery@chamelium.html
    - shard-tglu:         NOTRUN -> [SKIP][417] ([i915#2065])
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-tglu-4/igt@kms_feature_discovery@chamelium.html
    - shard-glk:          NOTRUN -> [SKIP][418] ([i915#17581])
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk3/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-3x:
    - shard-tglu:         NOTRUN -> [SKIP][419] ([i915#16081]) +1 other test skip
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-tglu-7/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@psr1:
    - shard-snb:          NOTRUN -> [SKIP][420] ([i915#17707])
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb1/igt@kms_feature_discovery@psr1.html
    - shard-glk:          NOTRUN -> [SKIP][421] ([i915#17707])
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk3/igt@kms_feature_discovery@psr1.html
    - shard-rkl:          NOTRUN -> [SKIP][422] ([i915#658])
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-3/igt@kms_feature_discovery@psr1.html
    - shard-dg1:          NOTRUN -> [SKIP][423] ([i915#658])
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg1-16/igt@kms_feature_discovery@psr1.html

  * igt@kms_feature_discovery@vrr:
    - shard-glk11:        NOTRUN -> [SKIP][424] ([i915#17539])
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk11/igt@kms_feature_discovery@vrr.html
    - shard-rkl:          NOTRUN -> [SKIP][425] ([i915#16600]) +1 other test skip
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-4/igt@kms_feature_discovery@vrr.html

  * igt@kms_fence_pin_leak:
    - shard-dg2:          NOTRUN -> [SKIP][426] ([i915#4881])
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg2-7/igt@kms_fence_pin_leak.html
    - shard-dg1:          NOTRUN -> [SKIP][427] ([i915#4881])
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg1-17/igt@kms_fence_pin_leak.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
    - shard-tglu:         NOTRUN -> [SKIP][428] ([i915#3637] / [i915#9934]) +7 other tests skip
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-tglu-7/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html
    - shard-mtlp:         NOTRUN -> [SKIP][429] ([i915#3637] / [i915#9934]) +3 other tests skip
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-mtlp-2/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-fences:
    - shard-dg1:          NOTRUN -> [SKIP][430] ([i915#8381]) +1 other test skip
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg1-15/igt@kms_flip@2x-flip-vs-fences.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][431] ([i915#12745] / [i915#13356] / [i915#17183] / [i915#4839] / [i915#6113])
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk1/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@2x-flip-vs-suspend@ac-hdmi-a1-hdmi-a2:
    - shard-glk:          NOTRUN -> [INCOMPLETE][432] ([i915#12745] / [i915#13356] / [i915#17183])
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk1/igt@kms_flip@2x-flip-vs-suspend@ac-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][433] ([i915#9934]) +3 other tests skip
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg2-3/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html
    - shard-rkl:          NOTRUN -> [SKIP][434] ([i915#9934]) +8 other tests skip
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-4/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][435] ([i915#9934]) +5 other tests skip
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg1-19/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-rkl:          NOTRUN -> [SKIP][436] ([i915#14544] / [i915#9934]) +1 other test skip
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-6/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-glk:          NOTRUN -> [INCOMPLETE][437] ([i915#12314] / [i915#12745] / [i915#13356] / [i915#17183] / [i915#4839] / [i915#6113])
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk5/igt@kms_flip@flip-vs-suspend-interruptible.html
    - shard-rkl:          [PASS][438] -> [INCOMPLETE][439] ([i915#16276] / [i915#6113])
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9180/shard-rkl-2/igt@kms_flip@flip-vs-suspend-interruptible.html
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-3/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][440] ([i915#12314] / [i915#12745] / [i915#13356] / [i915#17183])
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk5/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a2:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][441] ([i915#16276] / [i915#6113])
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-3/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a2.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][442] ([i915#3555] / [i915#8810] / [i915#8813]) +1 other test skip
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-mtlp-1/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-snb:          NOTRUN -> [SKIP][443] ([i915#17593]) +10 other tests skip
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][444] ([i915#15643] / [i915#5190]) +2 other tests skip
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg2-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-glk:          NOTRUN -> [SKIP][445] ([i915#17493])
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:
    - shard-tglu:         NOTRUN -> [SKIP][446] ([i915#15643]) +3 other tests skip
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-tglu-10/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-rkl:          NOTRUN -> [SKIP][447] ([i915#15643]) +3 other tests skip
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][448] ([i915#15643]) +2 other tests skip
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling:
    - shard-glk:          NOTRUN -> [SKIP][449] ([i915#17522]) +3 other tests skip
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk6/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-dg1:          NOTRUN -> [SKIP][450] ([i915#15643]) +4 other tests skip
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg1-17/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
    - shard-glk11:        NOTRUN -> [SKIP][451] ([i915#17484]) +2 other tests skip
   [451]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk11/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
    - shard-glk:          NOTRUN -> [SKIP][452] ([i915#17484]) +2 other tests skip
   [452]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-glk11:        NOTRUN -> [SKIP][453] ([i915#17493])
   [453]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk11/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_force_connector_basic@force-load-detect:
    - shard-tglu:         NOTRUN -> [SKIP][454] ([i915#17452])
   [454]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-tglu-9/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-mtlp:         [PASS][455] -> [SKIP][456] ([i915#15672])
   [455]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9180/shard-mtlp-4/igt@kms_force_connector_basic@prune-stale-modes.html
   [456]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-mtlp-1/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][457] ([i915#15991] / [i915#5354]) +22 other tests skip
   [457]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][458] ([i915#15990] / [i915#8708]) +6 other tests skip
   [458]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-dg1:          NOTRUN -> [SKIP][459] ([i915#17428]) +103 other tests skip
   [459]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg1-15/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-cpu:
    - shard-mtlp:         NOTRUN -> [SKIP][460] ([i915#15991] / [i915#17428] / [i915#1825]) +15 other tests skip
   [460]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-mtlp-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-gtt:
    - shard-snb:          NOTRUN -> [SKIP][461] ([i915#17588]) +145 other tests skip
   [461]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb1/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-gtt.html
    - shard-mtlp:         NOTRUN -> [SKIP][462] ([i915#15990] / [i915#8708]) +3 other tests skip
   [462]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-glk11:        NOTRUN -> [SKIP][463] ([i915#17559]) +1 other test skip
   [463]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk11/igt@kms_frontbuffer_tracking@fbc-tiling-4.html
    - shard-snb:          NOTRUN -> [SKIP][464] ([i915#17559]) +1 other test skip
   [464]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb7/igt@kms_frontbuffer_tracking@fbc-tiling-4.html
    - shard-tglu:         NOTRUN -> [SKIP][465] ([i915#5439])
   [465]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-tglu-4/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-pwrite:
    - shard-tglu:         NOTRUN -> [SKIP][466] ([i915#15989]) +25 other tests skip
   [466]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-tglu-7/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-onoff:
    - shard-rkl:          NOTRUN -> [SKIP][467] ([i915#15989]) +28 other tests skip
   [467]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-2/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-move:
    - shard-glk:          NOTRUN -> [SKIP][468] ([i915#17517]) +57 other tests skip
   [468]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk3/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][469] ([i915#15989]) +13 other tests skip
   [469]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg2-5/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-tiling-y:
    - shard-rkl:          [PASS][470] -> [SKIP][471] ([i915#15989]) +3 other tests skip
   [470]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9180/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-tiling-y.html
   [471]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-3/igt@kms_frontbuffer_tracking@fbchdr-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][472] ([i915#17428] / [i915#1825]) +7 other tests skip
   [472]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][473] ([i915#14544] / [i915#17428] / [i915#1825])
   [473]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][474] ([i915#15990]) +18 other tests skip
   [474]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg2-5/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-shrfb-draw-mmap-cpu:
    - shard-dg1:          NOTRUN -> [SKIP][475] ([i915#15102]) +50 other tests skip
   [475]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg1-19/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][476] ([i915#14544] / [i915#15102]) +3 other tests skip
   [476]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-cur-indfb-draw-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][477] ([i915#15990]) +31 other tests skip
   [477]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg1-19/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb565-draw-render:
    - shard-dg2:          NOTRUN -> [SKIP][478] ([i915#15102]) +18 other tests skip
   [478]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg2-5/igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4:
    - shard-dg1:          NOTRUN -> [SKIP][479] ([i915#5439])
   [479]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg1-14/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y:
    - shard-snb:          NOTRUN -> [SKIP][480] ([i915#17609]) +1 other test skip
   [480]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb1/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y.html
    - shard-dg2:          NOTRUN -> [SKIP][481] ([i915#10055])
   [481]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y.html

  * igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-blt:
    - shard-dg1:          NOTRUN -> [SKIP][482] ([i915#15989]) +27 other tests skip
   [482]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg1-14/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-shrfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][483] ([i915#15990]) +7 other tests skip
   [483]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-mtlp-5/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-indfb-draw-pwrite:
    - shard-glk11:        NOTRUN -> [SKIP][484] ([i915#17517]) +6 other tests skip
   [484]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk11/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@hdr-2p-primscrn-shrfb-msflip-blt:
    - shard-snb:          NOTRUN -> [SKIP][485] ([i915#17517]) +36 other tests skip
   [485]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb7/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-fullscreen:
    - shard-dg2:          NOTRUN -> [SKIP][486] ([i915#15991]) +24 other tests skip
   [486]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg2-6/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-cur-indfb-draw-render:
    - shard-glk:          [PASS][487] -> [SKIP][488] ([i915#17517]) +6 other tests skip
   [487]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9180/shard-glk8/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-cur-indfb-draw-render.html
   [488]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk9/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-rkl:          NOTRUN -> [SKIP][489] ([i915#14544] / [i915#17428]) +19 other tests skip
   [489]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-6/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@hdr-indfb-scaledprimary:
    - shard-snb:          NOTRUN -> [SKIP][490] ([i915#17606]) +3 other tests skip
   [490]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb6/igt@kms_frontbuffer_tracking@hdr-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@hdr-suspend:
    - shard-glk10:        NOTRUN -> [INCOMPLETE][491] ([i915#13356] / [i915#16056] / [i915#16593])
   [491]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk10/igt@kms_frontbuffer_tracking@hdr-suspend.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-rkl:          NOTRUN -> [SKIP][492] ([i915#9766])
   [492]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-8/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][493] ([i915#15102]) +66 other tests skip
   [493]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-gtt.html
    - shard-dg1:          NOTRUN -> [SKIP][494] ([i915#15104] / [i915#15990]) +2 other tests skip
   [494]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg1-17/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-gtt.html
    - shard-dg2:          NOTRUN -> [SKIP][495] ([i915#15104] / [i915#15990])
   [495]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-pwrite:
    - shard-glk10:        NOTRUN -> [SKIP][496] ([i915#17482]) +18 other tests skip
   [496]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk10/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw:
    - shard-glk:          NOTRUN -> [SKIP][497] ([i915#17482]) +141 other tests skip
   [497]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk9/igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][498] ([i915#15990] / [i915#8708]) +17 other tests skip
   [498]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg1-15/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move:
    - shard-tglu:         NOTRUN -> [SKIP][499] ([i915#15102]) +54 other tests skip
   [499]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-tglu-10/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-tglu:         NOTRUN -> [SKIP][500] ([i915#17428]) +97 other tests skip
   [500]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-tglu-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-suspend:
    - shard-mtlp:         [PASS][501] -> [FAIL][502] ([i915#17276])
   [501]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9180/shard-mtlp-7/igt@kms_frontbuffer_tracking@psr-suspend.html
   [502]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-mtlp-8/igt@kms_frontbuffer_tracking@psr-suspend.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-indfb-draw-render:
    - shard-mtlp:         NOTRUN -> [SKIP][503] ([i915#15989]) +22 other tests skip
   [503]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-mtlp-8/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-shrfb-draw-render:
    - shard-glk11:        NOTRUN -> [SKIP][504] ([i915#17482]) +48 other tests skip
   [504]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk11/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-shrfb-plflip-blt:
    - shard-snb:          NOTRUN -> [SKIP][505] ([i915#17482]) +70 other tests skip
   [505]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb1/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-pri-indfb-draw-pwrite:
    - shard-mtlp:         NOTRUN -> [SKIP][506] ([i915#15991] / [i915#17428]) +25 other tests skip
   [506]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-mtlp-4/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-move:
    - shard-rkl:          NOTRUN -> [SKIP][507] ([i915#17428]) +104 other tests skip
   [507]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-2/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-move.html

  * igt@kms_getfb@getfb-reject-nv12:
    - shard-snb:          NOTRUN -> [SKIP][508] ([i915#17636])
   [508]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb7/igt@kms_getfb@getfb-reject-nv12.html

  * igt@kms_getfb@getfb2-accept-nv12:
    - shard-snb:          NOTRUN -> [SKIP][509] ([i915#17658])
   [509]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb6/igt@kms_getfb@getfb2-accept-nv12.html

  * igt@kms_hdmi_audio_bw@audio-bw-hblank160:
    - shard-snb:          NOTRUN -> [FAIL][510] ([i915#17104])
   [510]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb7/igt@kms_hdmi_audio_bw@audio-bw-hblank160.html
    - shard-glk11:        NOTRUN -> [FAIL][511] ([i915#17102])
   [511]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk11/igt@kms_hdmi_audio_bw@audio-bw-hblank160.html

  * igt@kms_hdr@bpc-switch:
    - shard-dg1:          NOTRUN -> [SKIP][512] ([i915#3555] / [i915#8228])
   [512]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg1-18/igt@kms_hdr@bpc-switch.html

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-glk:          NOTRUN -> [SKIP][513] ([i915#17498]) +1 other test skip
   [513]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk8/igt@kms_hdr@bpc-switch-dpms.html
    - shard-snb:          NOTRUN -> [SKIP][514] ([i915#17498])
   [514]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb4/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][515] ([i915#3555] / [i915#8228]) +2 other tests skip
   [515]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-tglu-4/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_hdr@static-swap:
    - shard-rkl:          NOTRUN -> [SKIP][516] ([i915#16644] / [i915#3555] / [i915#8228]) +1 other test skip
   [516]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-8/igt@kms_hdr@static-swap.html

  * igt@kms_hdr@static-toggle:
    - shard-glk10:        NOTRUN -> [SKIP][517] ([i915#17498]) +1 other test skip
   [517]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk10/igt@kms_hdr@static-toggle.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-dg2:          NOTRUN -> [SKIP][518] ([i915#16518] / [i915#3555] / [i915#8228])
   [518]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg2-8/igt@kms_hdr@static-toggle-suspend.html
    - shard-rkl:          NOTRUN -> [INCOMPLETE][519] ([i915#15436]) +1 other test incomplete
   [519]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-6/igt@kms_hdr@static-toggle-suspend.html
    - shard-mtlp:         NOTRUN -> [SKIP][520] ([i915#12713] / [i915#16490] / [i915#3555] / [i915#8228]) +1 other test skip
   [520]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-mtlp-7/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-glk:          NOTRUN -> [SKIP][521] ([i915#17678])
   [521]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk2/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-dg1:          NOTRUN -> [SKIP][522] ([i915#15458])
   [522]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg1-18/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-glk11:        NOTRUN -> [SKIP][523] ([i915#17575])
   [523]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk11/igt@kms_joiner@basic-max-non-joiner.html
    - shard-dg2:          NOTRUN -> [SKIP][524] ([i915#13688])
   [524]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg2-6/igt@kms_joiner@basic-max-non-joiner.html
    - shard-rkl:          NOTRUN -> [SKIP][525] ([i915#13688])
   [525]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-7/igt@kms_joiner@basic-max-non-joiner.html
    - shard-dg1:          NOTRUN -> [SKIP][526] ([i915#13688])
   [526]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg1-17/igt@kms_joiner@basic-max-non-joiner.html
    - shard-snb:          NOTRUN -> [SKIP][527] ([i915#17575])
   [527]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb4/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-glk:          NOTRUN -> [SKIP][528] ([i915#17567])
   [528]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk4/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][529] ([i915#15459])
   [529]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-5/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-snb:          NOTRUN -> [SKIP][530] ([i915#17567]) +1 other test skip
   [530]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb6/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
    - shard-glk11:        NOTRUN -> [SKIP][531] ([i915#17567])
   [531]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk11/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][532] ([i915#15458]) +1 other test skip
   [532]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-tglu-2/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_mst@mst-suspend-read-crc:
    - shard-dg1:          NOTRUN -> [SKIP][533] ([i915#16451])
   [533]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg1-16/igt@kms_mst@mst-suspend-read-crc.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-glk10:        NOTRUN -> [SKIP][534] ([i915#17701])
   [534]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk10/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
    - shard-rkl:          NOTRUN -> [SKIP][535] ([i915#15815])
   [535]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-1/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-rkl:          NOTRUN -> [SKIP][536] ([i915#6301])
   [536]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-8/igt@kms_panel_fitting@atomic-fastset.html
    - shard-dg1:          NOTRUN -> [SKIP][537] ([i915#6301])
   [537]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg1-19/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_panel_fitting@legacy:
    - shard-snb:          NOTRUN -> [SKIP][538] ([i915#17577])
   [538]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb4/igt@kms_panel_fitting@legacy.html
    - shard-glk:          NOTRUN -> [SKIP][539] ([i915#17577])
   [539]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk5/igt@kms_panel_fitting@legacy.html

  * igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes:
    - shard-rkl:          NOTRUN -> [SKIP][540] ([i915#17455]) +1 other test skip
   [540]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-3/igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes.html

  * igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c:
    - shard-snb:          NOTRUN -> [SKIP][541] ([i915#17540])
   [541]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb1/igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-rkl:          [PASS][542] -> [INCOMPLETE][543] ([i915#12756] / [i915#13476])
   [542]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9180/shard-rkl-8/igt@kms_pipe_crc_basic@suspend-read-crc.html
   [543]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-3/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][544] ([i915#13476])
   [544]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-3/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-2.html

  * igt@kms_pipe_stress@stress-xrgb8888-4tiled:
    - shard-glk11:        NOTRUN -> [SKIP][545] ([i915#17601])
   [545]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk11/igt@kms_pipe_stress@stress-xrgb8888-4tiled.html
    - shard-dg1:          NOTRUN -> [SKIP][546] ([i915#14712])
   [546]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg1-17/igt@kms_pipe_stress@stress-xrgb8888-4tiled.html
    - shard-snb:          NOTRUN -> [SKIP][547] ([i915#17601])
   [547]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb7/igt@kms_pipe_stress@stress-xrgb8888-4tiled.html

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier:
    - shard-glk11:        NOTRUN -> [SKIP][548] ([i915#17479]) +2 other tests skip
   [548]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk11/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier:
    - shard-glk:          NOTRUN -> [SKIP][549] ([i915#17479]) +4 other tests skip
   [549]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk3/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping:
    - shard-tglu:         NOTRUN -> [SKIP][550] ([i915#15709]) +3 other tests skip
   [550]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-tglu-9/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping.html
    - shard-mtlp:         NOTRUN -> [SKIP][551] ([i915#15709]) +3 other tests skip
   [551]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-mtlp-1/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier@pipe-a-plane-5:
    - shard-dg2:          NOTRUN -> [SKIP][552] ([i915#16386]) +1 other test skip
   [552]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg2-6/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier@pipe-a-plane-5.html

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping:
    - shard-rkl:          NOTRUN -> [SKIP][553] ([i915#15709]) +9 other tests skip
   [553]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-4/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping.html
    - shard-glk10:        NOTRUN -> [SKIP][554] ([i915#17479]) +2 other tests skip
   [554]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk10/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping:
    - shard-rkl:          NOTRUN -> [SKIP][555] ([i915#14544] / [i915#15709])
   [555]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping:
    - shard-dg2:          NOTRUN -> [SKIP][556] ([i915#15709])
   [556]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg2-7/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-2:
    - shard-snb:          NOTRUN -> [SKIP][557] ([i915#17494]) +1 other test skip
   [557]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb5/igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-2.html

  * igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-4:
    - shard-glk:          NOTRUN -> [SKIP][558] ([i915#17494]) +3 other tests skip
   [558]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk3/igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-4.html

  * igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-5:
    - shard-rkl:          NOTRUN -> [SKIP][559] ([i915#16386]) +1 other test skip
   [559]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-6/igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-5.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-a-plane-7:
    - shard-tglu:         NOTRUN -> [SKIP][560] ([i915#16386]) +1 other test skip
   [560]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-tglu-9/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-a-plane-7.html

  * igt@kms_plane@pixel-format-y-tiled-modifier@pipe-b-plane-4:
    - shard-glk11:        NOTRUN -> [SKIP][561] ([i915#17494]) +1 other test skip
   [561]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk11/igt@kms_plane@pixel-format-y-tiled-modifier@pipe-b-plane-4.html

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping:
    - shard-dg1:          NOTRUN -> [SKIP][562] ([i915#15709]) +6 other tests skip
   [562]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg1-16/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping.html
    - shard-snb:          NOTRUN -> [SKIP][563] ([i915#17479]) +11 other tests skip
   [563]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb1/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping.html

  * igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y:
    - shard-glk11:        NOTRUN -> [SKIP][564] ([i915#17700])
   [564]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk11/igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y.html

  * igt@kms_plane_alpha_blend@alpha-basic:
    - shard-snb:          NOTRUN -> [SKIP][565] ([i915#17595]) +1 other test skip
   [565]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb1/igt@kms_plane_alpha_blend@alpha-basic.html
    - shard-glk:          NOTRUN -> [FAIL][566] ([i915#12178])
   [566]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk9/igt@kms_plane_alpha_blend@alpha-basic.html

  * igt@kms_plane_alpha_blend@alpha-basic@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [FAIL][567] ([i915#7862]) +1 other test fail
   [567]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk9/igt@kms_plane_alpha_blend@alpha-basic@pipe-a-hdmi-a-1.html

  * igt@kms_plane_alpha_blend@alpha-transparent-fb:
    - shard-glk11:        NOTRUN -> [FAIL][568] ([i915#10647] / [i915#12177])
   [568]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk11/igt@kms_plane_alpha_blend@alpha-transparent-fb.html

  * igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-a-hdmi-a-1:
    - shard-glk11:        NOTRUN -> [FAIL][569] ([i915#10647]) +1 other test fail
   [569]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk11/igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-a-hdmi-a-1.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-dg2:          NOTRUN -> [SKIP][570] ([i915#3555] / [i915#8821])
   [570]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg2-4/igt@kms_plane_lowres@tiling-yf.html
    - shard-rkl:          NOTRUN -> [SKIP][571] ([i915#14544] / [i915#3555]) +1 other test skip
   [571]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-6/igt@kms_plane_lowres@tiling-yf.html
    - shard-snb:          NOTRUN -> [SKIP][572] ([i915#17509])
   [572]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb5/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-tglu:         NOTRUN -> [SKIP][573] ([i915#13958])
   [573]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-tglu-3/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-dg1:          NOTRUN -> [SKIP][574] ([i915#13958])
   [574]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg1-18/igt@kms_plane_multiple@2x-tiling-yf.html
    - shard-snb:          NOTRUN -> [SKIP][575] ([i915#17586])
   [575]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb7/igt@kms_plane_multiple@2x-tiling-yf.html
    - shard-dg2:          NOTRUN -> [SKIP][576] ([i915#13958])
   [576]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg2-6/igt@kms_plane_multiple@2x-tiling-yf.html
    - shard-rkl:          NOTRUN -> [SKIP][577] ([i915#13958])
   [577]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-3/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-dg1:          NOTRUN -> [SKIP][578] ([i915#14259])
   [578]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg1-17/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-tglu:         NOTRUN -> [SKIP][579] ([i915#17428] / [i915#17454]) +2 other tests skip
   [579]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-tglu-2/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-rkl:          NOTRUN -> [SKIP][580] ([i915#6953])
   [580]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-7/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@invalid-parameters:
    - shard-snb:          NOTRUN -> [SKIP][581] ([i915#17626])
   [581]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb5/igt@kms_plane_scaling@invalid-parameters.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format:
    - shard-snb:          NOTRUN -> [SKIP][582] ([i915#17528]) +17 other tests skip
   [582]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb7/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-b:
    - shard-glk10:        NOTRUN -> [SKIP][583] ([i915#17529]) +1 other test skip
   [583]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk10/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-b.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c:
    - shard-glk10:        NOTRUN -> [SKIP][584] ([i915#17528]) +1 other test skip
   [584]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk10/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b:
    - shard-glk:          NOTRUN -> [SKIP][585] ([i915#17529]) +3 other tests skip
   [585]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk4/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:
    - shard-dg1:          NOTRUN -> [SKIP][586] ([i915#15329] / [i915#3555])
   [586]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg1-16/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation:
    - shard-glk:          NOTRUN -> [SKIP][587] ([i915#17528]) +3 other tests skip
   [587]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk3/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:
    - shard-snb:          NOTRUN -> [SKIP][588] ([i915#17529]) +8 other tests skip
   [588]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb5/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-b:
    - shard-snb:          NOTRUN -> [SKIP][589] ([i915#17528] / [i915#17529])
   [589]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb5/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-b.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d:
    - shard-dg1:          NOTRUN -> [SKIP][590] ([i915#15329]) +13 other tests skip
   [590]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg1-14/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d.html

  * igt@kms_pm_backlight@fade:
    - shard-rkl:          NOTRUN -> [SKIP][591] ([i915#12343] / [i915#5354])
   [591]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-4/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-glk:          NOTRUN -> [SKIP][592] ([i915#17462]) +2 other tests skip
   [592]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk4/igt@kms_pm_backlight@fade-with-suspend.html
    - shard-tglu:         NOTRUN -> [SKIP][593] ([i915#12343] / [i915#9812])
   [593]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-tglu-10/igt@kms_pm_backlight@fade-with-suspend.html
    - shard-mtlp:         [PASS][594] -> [INCOMPLETE][595] ([i915#17032])
   [594]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9180/shard-mtlp-2/igt@kms_pm_backlight@fade-with-suspend.html
   [595]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-mtlp-8/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc5-dpms-negative:
    - shard-snb:          NOTRUN -> [SKIP][596] ([i915#17602]) +3 other tests skip
   [596]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb1/igt@kms_pm_dc@dc5-dpms-negative.html

  * igt@kms_pm_dc@dc5-pageflip-negative:
    - shard-rkl:          NOTRUN -> [SKIP][597] ([i915#9685])
   [597]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-8/igt@kms_pm_dc@dc5-pageflip-negative.html
    - shard-dg1:          NOTRUN -> [SKIP][598] ([i915#9685])
   [598]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg1-19/igt@kms_pm_dc@dc5-pageflip-negative.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-rkl:          NOTRUN -> [SKIP][599] ([i915#3828])
   [599]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-3/igt@kms_pm_dc@dc5-retention-flops.html
    - shard-glk:          NOTRUN -> [SKIP][600] ([i915#17553])
   [600]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk3/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-tglu:         NOTRUN -> [SKIP][601] ([i915#15948])
   [601]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-tglu-9/igt@kms_pm_dc@dc6-psr.html
    - shard-glk10:        NOTRUN -> [SKIP][602] ([i915#17564])
   [602]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk10/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-glk11:        NOTRUN -> [SKIP][603] ([i915#17702])
   [603]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk11/igt@kms_pm_lpsp@kms-lpsp.html
    - shard-dg2:          NOTRUN -> [SKIP][604] ([i915#9340])
   [604]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg2-6/igt@kms_pm_lpsp@kms-lpsp.html
    - shard-rkl:          NOTRUN -> [SKIP][605] ([i915#9340])
   [605]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-7/igt@kms_pm_lpsp@kms-lpsp.html
    - shard-dg1:          NOTRUN -> [SKIP][606] ([i915#9340])
   [606]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg1-17/igt@kms_pm_lpsp@kms-lpsp.html
    - shard-snb:          NOTRUN -> [SKIP][607] ([i915#17618])
   [607]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb4/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_lpsp@screens-disabled:
    - shard-dg2:          NOTRUN -> [SKIP][608] ([i915#8430])
   [608]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg2-3/igt@kms_pm_lpsp@screens-disabled.html
    - shard-rkl:          NOTRUN -> [SKIP][609] ([i915#8430])
   [609]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-7/igt@kms_pm_lpsp@screens-disabled.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-dg2:          [PASS][610] -> [SKIP][611] ([i915#15073])
   [610]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9180/shard-dg2-6/igt@kms_pm_rpm@dpms-non-lpsp.html
   [611]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg2-4/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@fences:
    - shard-snb:          NOTRUN -> [SKIP][612] ([i915#17473]) +9 other tests skip
   [612]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb6/igt@kms_pm_rpm@fences.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-glk:          NOTRUN -> [SKIP][613] ([i915#15073]) +1 other test skip
   [613]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk9/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-rkl:          [PASS][614] -> [SKIP][615] ([i915#14544] / [i915#15073])
   [614]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9180/shard-rkl-8/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
   [615]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-6/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
    - shard-dg1:          [PASS][616] -> [SKIP][617] ([i915#15073])
   [616]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9180/shard-dg1-14/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
   [617]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg1-18/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-rkl:          NOTRUN -> [SKIP][618] ([i915#15073])
   [618]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-5/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
    - shard-dg1:          NOTRUN -> [SKIP][619] ([i915#15073])
   [619]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg1-14/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@modeset-pc8-residency-stress:
    - shard-glk11:        NOTRUN -> [SKIP][620] ([i915#17709])
   [620]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk11/igt@kms_pm_rpm@modeset-pc8-residency-stress.html

  * igt@kms_pm_rpm@pc8-residency:
    - shard-dg1:          NOTRUN -> [SKIP][621] ([i915#17434] / [i915#17450])
   [621]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg1-15/igt@kms_pm_rpm@pc8-residency.html

  * igt@kms_pm_rpm@system-suspend-idle:
    - shard-dg2:          [PASS][622] -> [INCOMPLETE][623] ([i915#14419])
   [622]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9180/shard-dg2-8/igt@kms_pm_rpm@system-suspend-idle.html
   [623]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg2-5/igt@kms_pm_rpm@system-suspend-idle.html

  * igt@kms_prime@basic-crc-hybrid:
    - shard-dg2:          NOTRUN -> [SKIP][624] ([i915#6524] / [i915#6805])
   [624]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg2-6/igt@kms_prime@basic-crc-hybrid.html
    - shard-rkl:          NOTRUN -> [SKIP][625] ([i915#14544] / [i915#6524])
   [625]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-6/igt@kms_prime@basic-crc-hybrid.html
    - shard-dg1:          NOTRUN -> [SKIP][626] ([i915#6524])
   [626]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg1-16/igt@kms_prime@basic-crc-hybrid.html
    - shard-snb:          NOTRUN -> [SKIP][627] ([i915#17569]) +1 other test skip
   [627]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb5/igt@kms_prime@basic-crc-hybrid.html
    - shard-tglu:         NOTRUN -> [SKIP][628] ([i915#6524]) +1 other test skip
   [628]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-tglu-10/igt@kms_prime@basic-crc-hybrid.html
    - shard-mtlp:         NOTRUN -> [SKIP][629] ([i915#6524]) +1 other test skip
   [629]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-mtlp-8/igt@kms_prime@basic-crc-hybrid.html
    - shard-glk:          NOTRUN -> [SKIP][630] ([i915#17569])
   [630]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk4/igt@kms_prime@basic-crc-hybrid.html

  * igt@kms_prime@d3hot:
    - shard-glk11:        NOTRUN -> [SKIP][631] ([i915#17569])
   [631]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk11/igt@kms_prime@d3hot.html

  * igt@kms_properties@colorop-properties-atomic:
    - shard-snb:          NOTRUN -> [SKIP][632] ([i915#17481])
   [632]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb6/igt@kms_properties@colorop-properties-atomic.html
    - shard-glk11:        NOTRUN -> [SKIP][633] ([i915#17481])
   [633]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk11/igt@kms_properties@colorop-properties-atomic.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-dg2:          NOTRUN -> [SKIP][634] ([i915#11520]) +5 other tests skip
   [634]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg2-7/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html
    - shard-rkl:          NOTRUN -> [SKIP][635] ([i915#11520]) +13 other tests skip
   [635]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-3/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:
    - shard-glk10:        NOTRUN -> [SKIP][636] ([i915#11520]) +2 other tests skip
   [636]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk10/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-snb:          NOTRUN -> [SKIP][637] ([i915#11520]) +13 other tests skip
   [637]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb5/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][638] ([i915#11520]) +12 other tests skip
   [638]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk3/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][639] ([i915#9808])
   [639]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-mtlp-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf:
    - shard-mtlp:         NOTRUN -> [SKIP][640] ([i915#12316]) +5 other tests skip
   [640]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-mtlp-3/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-tglu:         NOTRUN -> [SKIP][641] ([i915#11520]) +12 other tests skip
   [641]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-tglu-4/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf:
    - shard-rkl:          NOTRUN -> [SKIP][642] ([i915#11520] / [i915#14544]) +1 other test skip
   [642]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-6/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-glk11:        NOTRUN -> [SKIP][643] ([i915#11520]) +2 other tests skip
   [643]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk11/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
    - shard-dg1:          NOTRUN -> [SKIP][644] ([i915#11520]) +11 other tests skip
   [644]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg1-19/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-rkl:          NOTRUN -> [SKIP][645] ([i915#9683])
   [645]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-3/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-glk:          NOTRUN -> [SKIP][646] ([i915#17546])
   [646]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk4/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-pr-cursor-blt:
    - shard-glk11:        NOTRUN -> [SKIP][647] ([i915#17480]) +13 other tests skip
   [647]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk11/igt@kms_psr@fbc-pr-cursor-blt.html

  * igt@kms_psr@fbc-pr-dpms:
    - shard-glk:          NOTRUN -> [SKIP][648] ([i915#17480]) +26 other tests skip
   [648]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk3/igt@kms_psr@fbc-pr-dpms.html

  * igt@kms_psr@fbc-pr-sprite-render:
    - shard-snb:          NOTRUN -> [SKIP][649] ([i915#17480]) +22 other tests skip
   [649]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb5/igt@kms_psr@fbc-pr-sprite-render.html
    - shard-dg1:          NOTRUN -> [SKIP][650] ([i915#1072] / [i915#9732]) +28 other tests skip
   [650]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg1-16/igt@kms_psr@fbc-pr-sprite-render.html

  * igt@kms_psr@fbc-psr-no-drrs:
    - shard-tglu:         NOTRUN -> [SKIP][651] ([i915#9732]) +21 other tests skip
   [651]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-tglu-4/igt@kms_psr@fbc-psr-no-drrs.html

  * igt@kms_psr@fbc-psr-primary-blt:
    - shard-dg2:          NOTRUN -> [SKIP][652] ([i915#1072] / [i915#9732]) +9 other tests skip
   [652]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg2-5/igt@kms_psr@fbc-psr-primary-blt.html

  * igt@kms_psr@fbc-psr2-cursor-plane-onoff:
    - shard-mtlp:         NOTRUN -> [SKIP][653] ([i915#9688]) +10 other tests skip
   [653]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-mtlp-5/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-glk10:        NOTRUN -> [SKIP][654] ([i915#17480]) +2 other tests skip
   [654]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk10/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_psr@psr-primary-page-flip:
    - shard-glk11:        NOTRUN -> [SKIP][655] ([i915#17480] / [i915#9732])
   [655]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk11/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_psr@psr-sprite-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][656] ([i915#1072] / [i915#14544] / [i915#9732]) +3 other tests skip
   [656]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-6/igt@kms_psr@psr-sprite-mmap-gtt.html

  * igt@kms_psr@psr-sprite-mmap-gtt@edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][657] ([i915#4077] / [i915#9688]) +1 other test skip
   [657]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-mtlp-7/igt@kms_psr@psr-sprite-mmap-gtt@edp-1.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - shard-rkl:          NOTRUN -> [SKIP][658] ([i915#1072] / [i915#9732]) +29 other tests skip
   [658]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-8/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@kms_rotation_crc@exhaust-fences:
    - shard-snb:          NOTRUN -> [SKIP][659] ([i915#17676])
   [659]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb1/igt@kms_rotation_crc@exhaust-fences.html

  * igt@kms_rotation_crc@multiplane-rotation:
    - shard-snb:          NOTRUN -> [SKIP][660] ([i915#17634]) +1 other test skip
   [660]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb5/igt@kms_rotation_crc@multiplane-rotation.html

  * igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:
    - shard-glk:          NOTRUN -> [INCOMPLETE][661] ([i915#15500] / [i915#16184])
   [661]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk9/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html

  * igt@kms_rotation_crc@multiplane-rotation-cropping-top:
    - shard-glk:          NOTRUN -> [INCOMPLETE][662] ([i915#15492] / [i915#16184])
   [662]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk4/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
    - shard-glk:          NOTRUN -> [SKIP][663] ([i915#17488]) +1 other test skip
   [663]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk8/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
    - shard-glk10:        NOTRUN -> [SKIP][664] ([i915#17488])
   [664]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk10/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-snb:          NOTRUN -> [SKIP][665] ([i915#17488]) +3 other tests skip
   [665]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb7/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
    - shard-glk11:        NOTRUN -> [SKIP][666] ([i915#17488]) +2 other tests skip
   [666]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk11/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2:          NOTRUN -> [SKIP][667] ([i915#12755] / [i915#15867] / [i915#5190])
   [667]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg2-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-tglu:         NOTRUN -> [SKIP][668] ([i915#17432] / [i915#5289]) +1 other test skip
   [668]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-tglu-9/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-mtlp:         NOTRUN -> [SKIP][669] ([i915#15867])
   [669]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-mtlp-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_scaling_modes@scaling-mode-none:
    - shard-snb:          NOTRUN -> [SKIP][670] ([i915#17501])
   [670]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb7/igt@kms_scaling_modes@scaling-mode-none.html
    - shard-tglu:         NOTRUN -> [SKIP][671] ([i915#3555]) +3 other tests skip
   [671]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-tglu-4/igt@kms_scaling_modes@scaling-mode-none.html
    - shard-mtlp:         NOTRUN -> [SKIP][672] ([i915#3555] / [i915#5030] / [i915#9041])
   [672]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-mtlp-6/igt@kms_scaling_modes@scaling-mode-none.html
    - shard-glk:          NOTRUN -> [SKIP][673] ([i915#17501])
   [673]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk3/igt@kms_scaling_modes@scaling-mode-none.html

  * igt@kms_scaling_modes@scaling-mode-none@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][674] ([i915#5030]) +2 other tests skip
   [674]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-mtlp-6/igt@kms_scaling_modes@scaling-mode-none@pipe-a-edp-1.html

  * igt@kms_scaling_modes@scaling-mode-none@pipe-d-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][675] ([i915#5030] / [i915#9041])
   [675]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-mtlp-6/igt@kms_scaling_modes@scaling-mode-none@pipe-d-edp-1.html

  * igt@kms_selftest@drm_framebuffer:
    - shard-tglu:         NOTRUN -> [ABORT][676] ([i915#13179]) +1 other test abort
   [676]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-tglu-2/igt@kms_selftest@drm_framebuffer.html

  * igt@kms_setmode@invalid-clone-exclusive-crtc:
    - shard-glk11:        NOTRUN -> [SKIP][677] ([i915#17463]) +1 other test skip
   [677]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk11/igt@kms_setmode@invalid-clone-exclusive-crtc.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-tglu:         NOTRUN -> [SKIP][678] ([i915#8623])
   [678]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-tglu-3/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-rkl:          NOTRUN -> [SKIP][679] ([i915#8623])
   [679]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
    - shard-dg1:          NOTRUN -> [SKIP][680] ([i915#8623])
   [680]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg1-15/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-dg1:          NOTRUN -> [SKIP][681] ([i915#17445])
   [681]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg1-18/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][682] ([i915#12276] / [i915#13356]) +1 other test incomplete
   [682]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk6/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html
    - shard-snb:          NOTRUN -> [DMESG-WARN][683] ([i915#15840] / [i915#17752])
   [683]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb4/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-b-vga-1:
    - shard-snb:          NOTRUN -> [DMESG-WARN][684] ([i915#17752]) +2 other tests dmesg-warn
   [684]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb4/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-b-vga-1.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-mtlp:         [PASS][685] -> [INCOMPLETE][686] ([i915#12276]) +1 other test incomplete
   [685]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9180/shard-mtlp-5/igt@kms_vblank@ts-continuation-suspend.html
   [686]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-mtlp-2/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_vblank@ts-continuation-suspend@pipe-a-edp-1:
    - shard-mtlp:         [PASS][687] -> [FAIL][688] ([i915#17209])
   [687]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9180/shard-mtlp-5/igt@kms_vblank@ts-continuation-suspend@pipe-a-edp-1.html
   [688]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-mtlp-2/igt@kms_vblank@ts-continuation-suspend@pipe-a-edp-1.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-rkl:          NOTRUN -> [SKIP][689] ([i915#9906])
   [689]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-7/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@flip-dpms:
    - shard-dg2:          NOTRUN -> [SKIP][690] ([i915#15243] / [i915#3555])
   [690]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg2-6/igt@kms_vrr@flip-dpms.html
    - shard-rkl:          NOTRUN -> [SKIP][691] ([i915#14544] / [i915#15243] / [i915#3555])
   [691]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-6/igt@kms_vrr@flip-dpms.html
    - shard-snb:          NOTRUN -> [SKIP][692] ([i915#17520]) +1 other test skip
   [692]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb5/igt@kms_vrr@flip-dpms.html

  * igt@kms_vrr@flip-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][693] ([i915#15243] / [i915#3555])
   [693]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-4/igt@kms_vrr@flip-suspend.html

  * igt@kms_vrr@negative-basic:
    - shard-glk11:        NOTRUN -> [SKIP][694] ([i915#17520])
   [694]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk11/igt@kms_vrr@negative-basic.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-glk:          NOTRUN -> [SKIP][695] ([i915#17520]) +1 other test skip
   [695]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk3/igt@kms_vrr@seamless-rr-switch-drrs.html
    - shard-dg2:          NOTRUN -> [SKIP][696] ([i915#9906])
   [696]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg2-4/igt@kms_vrr@seamless-rr-switch-drrs.html
    - shard-rkl:          NOTRUN -> [SKIP][697] ([i915#14544] / [i915#9906])
   [697]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-6/igt@kms_vrr@seamless-rr-switch-drrs.html
    - shard-dg1:          NOTRUN -> [SKIP][698] ([i915#9906])
   [698]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg1-18/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@perf@gen12-group-exclusive-stream-ctx-handle:
    - shard-glk:          NOTRUN -> [SKIP][699] ([i915#17536])
   [699]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk9/igt@perf@gen12-group-exclusive-stream-ctx-handle.html

  * igt@perf@gen8-unprivileged-single-ctx-counters:
    - shard-mtlp:         NOTRUN -> [SKIP][700] ([i915#17455]) +1 other test skip
   [700]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-mtlp-1/igt@perf@gen8-unprivileged-single-ctx-counters.html
    - shard-dg2:          NOTRUN -> [SKIP][701] ([i915#2436])
   [701]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg2-3/igt@perf@gen8-unprivileged-single-ctx-counters.html
    - shard-rkl:          NOTRUN -> [SKIP][702] ([i915#2436])
   [702]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-2/igt@perf@gen8-unprivileged-single-ctx-counters.html

  * igt@perf@mi-rpc:
    - shard-dg1:          NOTRUN -> [SKIP][703] ([i915#2434])
   [703]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg1-14/igt@perf@mi-rpc.html

  * igt@perf@non-zero-reason@0-rcs0:
    - shard-dg2:          NOTRUN -> [FAIL][704] ([i915#9100]) +1 other test fail
   [704]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg2-8/igt@perf@non-zero-reason@0-rcs0.html

  * igt@perf@per-context-mode-unprivileged:
    - shard-glk11:        NOTRUN -> [SKIP][705] ([i915#17704])
   [705]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk11/igt@perf@per-context-mode-unprivileged.html

  * igt@perf@unprivileged-single-ctx-counters:
    - shard-snb:          NOTRUN -> [SKIP][706] ([i915#17592]) +10 other tests skip
   [706]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb1/igt@perf@unprivileged-single-ctx-counters.html

  * igt@perf_pmu@busy-accuracy-50@bcs0:
    - shard-snb:          NOTRUN -> [SKIP][707] ([i915#17651]) +1 other test skip
   [707]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb6/igt@perf_pmu@busy-accuracy-50@bcs0.html

  * igt@perf_pmu@busy-double-start@rcs0:
    - shard-mtlp:         [PASS][708] -> [FAIL][709] ([i915#4349]) +1 other test fail
   [708]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9180/shard-mtlp-8/igt@perf_pmu@busy-double-start@rcs0.html
   [709]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-mtlp-4/igt@perf_pmu@busy-double-start@rcs0.html

  * igt@perf_pmu@enable-race@bcs0:
    - shard-snb:          NOTRUN -> [SKIP][710] ([i915#17638]) +1 other test skip
   [710]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb6/igt@perf_pmu@enable-race@bcs0.html

  * igt@perf_pmu@rc6-all-gts:
    - shard-glk11:        NOTRUN -> [SKIP][711] ([i915#17583])
   [711]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk11/igt@perf_pmu@rc6-all-gts.html
    - shard-dg1:          NOTRUN -> [SKIP][712] ([i915#8516])
   [712]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg1-17/igt@perf_pmu@rc6-all-gts.html

  * igt@perf_pmu@rc6-suspend:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][713] ([i915#13520])
   [713]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-6/igt@perf_pmu@rc6-suspend.html

  * igt@perf_pmu@rc6@other-idle-gt0:
    - shard-glk:          NOTRUN -> [SKIP][714] ([i915#17583])
   [714]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk8/igt@perf_pmu@rc6@other-idle-gt0.html

  * igt@perf_pmu@semaphore-busy@bcs0:
    - shard-snb:          NOTRUN -> [SKIP][715] ([i915#17683]) +1 other test skip
   [715]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb1/igt@perf_pmu@semaphore-busy@bcs0.html

  * igt@perf_pmu@semaphore-wait-idle@bcs0:
    - shard-snb:          NOTRUN -> [SKIP][716] ([i915#17648]) +1 other test skip
   [716]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb1/igt@perf_pmu@semaphore-wait-idle@bcs0.html

  * igt@perf_pmu@semaphore-wait-idle@vcs0:
    - shard-snb:          NOTRUN -> [SKIP][717] ([i915#17637]) +7 other tests skip
   [717]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb1/igt@perf_pmu@semaphore-wait-idle@vcs0.html

  * igt@prime_udl@share-import:
    - shard-glk:          NOTRUN -> [SKIP][718] ([i915#16420])
   [718]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk5/igt@prime_udl@share-import.html

  * igt@prime_udl@share-import-addfb:
    - shard-glk11:        NOTRUN -> [SKIP][719] ([i915#16420])
   [719]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk11/igt@prime_udl@share-import-addfb.html
    - shard-dg1:          NOTRUN -> [SKIP][720] ([i915#16420])
   [720]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg1-17/igt@prime_udl@share-import-addfb.html

  * igt@prime_vgem@basic-fence-flip:
    - shard-dg1:          NOTRUN -> [SKIP][721] ([i915#3708]) +1 other test skip
   [721]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg1-14/igt@prime_vgem@basic-fence-flip.html

  * igt@prime_vgem@basic-read:
    - shard-mtlp:         NOTRUN -> [SKIP][722] ([i915#3708]) +1 other test skip
   [722]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-mtlp-2/igt@prime_vgem@basic-read.html
    - shard-rkl:          NOTRUN -> [SKIP][723] ([i915#17448] / [i915#3291] / [i915#3708])
   [723]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-4/igt@prime_vgem@basic-read.html

  * igt@prime_vgem@coherency-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][724] ([i915#3708] / [i915#4077]) +1 other test skip
   [724]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg1-16/igt@prime_vgem@coherency-gtt.html

  * igt@prime_vgem@fence-flip-hang:
    - shard-dg2:          NOTRUN -> [SKIP][725] ([i915#3708]) +1 other test skip
   [725]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg2-8/igt@prime_vgem@fence-flip-hang.html
    - shard-rkl:          NOTRUN -> [SKIP][726] ([i915#17448] / [i915#3708])
   [726]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-7/igt@prime_vgem@fence-flip-hang.html

  * igt@prime_vgem@fence-read-hang:
    - shard-tglu:         NOTRUN -> [SKIP][727] ([i915#17448])
   [727]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-tglu-3/igt@prime_vgem@fence-read-hang.html

  * igt@sysfs_heartbeat_interval@mixed:
    - shard-snb:          NOTRUN -> [SKIP][728] ([i915#17642]) +3 other tests skip
   [728]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb6/igt@sysfs_heartbeat_interval@mixed.html

  * igt@sysfs_heartbeat_interval@mixed@bcs0:
    - shard-snb:          NOTRUN -> [SKIP][729] ([i915#17643]) +3 other tests skip
   [729]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb6/igt@sysfs_heartbeat_interval@mixed@bcs0.html

  * igt@sysfs_preempt_timeout@idempotent:
    - shard-snb:          NOTRUN -> [SKIP][730] ([i915#17631]) +1 other test skip
   [730]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb6/igt@sysfs_preempt_timeout@idempotent.html

  * igt@sysfs_preempt_timeout@idempotent@bcs0:
    - shard-snb:          NOTRUN -> [SKIP][731] ([i915#17632]) +1 other test skip
   [731]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-snb6/igt@sysfs_preempt_timeout@idempotent@bcs0.html

  * igt@tools_test@sysfs_l3_parity:
    - shard-rkl:          NOTRUN -> [SKIP][732] ([i915#17447])
   [732]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-8/igt@tools_test@sysfs_l3_parity.html
    - shard-mtlp:         NOTRUN -> [SKIP][733] ([i915#4818])
   [733]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-mtlp-2/igt@tools_test@sysfs_l3_parity.html

  
#### Possible fixes ####

  * igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0:
    - shard-dg2:          [INCOMPLETE][734] ([i915#13356] / [i915#16348]) -> [PASS][735]
   [734]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9180/shard-dg2-4/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html
   [735]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg2-3/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html

  * igt@gem_ctx_isolation@preservation-s3:
    - shard-rkl:          [ABORT][736] ([i915#15131]) -> [PASS][737] +1 other test pass
   [736]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9180/shard-rkl-1/igt@gem_ctx_isolation@preservation-s3.html
   [737]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-2/igt@gem_ctx_isolation@preservation-s3.html

  * igt@gem_eio@kms:
    - shard-rkl:          [DMESG-WARN][738] ([i915#13363]) -> [PASS][739]
   [738]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9180/shard-rkl-5/igt@gem_eio@kms.html
   [739]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-4/igt@gem_eio@kms.html

  * igt@i915_suspend@forcewake:
    - shard-tglu:         [ABORT][740] ([i915#15840]) -> [PASS][741]
   [740]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9180/shard-tglu-4/igt@i915_suspend@forcewake.html
   [741]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-tglu-10/igt@i915_suspend@forcewake.html

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-rkl:          [INCOMPLETE][742] ([i915#12761]) -> [PASS][743]
   [742]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9180/shard-rkl-6/igt@kms_async_flips@async-flip-suspend-resume.html
   [743]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-8/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
    - shard-mtlp:         [FAIL][744] ([i915#15733] / [i915#5138]) -> [PASS][745]
   [744]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9180/shard-mtlp-1/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
   [745]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-mtlp-5/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:
    - shard-mtlp:         [INCOMPLETE][746] ([i915#15582]) -> [PASS][747] +1 other test pass
   [746]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9180/shard-mtlp-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html
   [747]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-mtlp-8/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-edp-1:
    - shard-mtlp:         [FAIL][748] ([i915#17158]) -> [PASS][749]
   [748]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9180/shard-mtlp-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-edp-1.html
   [749]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-mtlp-8/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-edp-1.html

  * igt@kms_cursor_crc@cursor-onscreen-128x42:
    - shard-tglu:         [FAIL][750] ([i915#13566]) -> [PASS][751] +1 other test pass
   [750]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9180/shard-tglu-9/igt@kms_cursor_crc@cursor-onscreen-128x42.html
   [751]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-tglu-3/igt@kms_cursor_crc@cursor-onscreen-128x42.html

  * igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1:
    - shard-rkl:          [FAIL][752] ([i915#13566]) -> [PASS][753] +2 other tests pass
   [752]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9180/shard-rkl-5/igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1.html
   [753]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-5/igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1:
    - shard-mtlp:         [FAIL][754] ([i915#17157]) -> [PASS][755]
   [754]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9180/shard-mtlp-1/igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1.html
   [755]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-mtlp-2/igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-rkl:          [INCOMPLETE][756] ([i915#16276] / [i915#6113]) -> [PASS][757] +1 other test pass
   [756]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9180/shard-rkl-7/igt@kms_flip@flip-vs-suspend.html
   [757]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-7/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-move:
    - shard-glk:          [SKIP][758] ([i915#17517]) -> [PASS][759] +2 other tests pass
   [758]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9180/shard-glk6/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-move.html
   [759]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk8/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-blt:
    - shard-rkl:          [SKIP][760] ([i915#15989]) -> [PASS][761] +11 other tests pass
   [760]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9180/shard-rkl-8/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-blt.html
   [761]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-6/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_hdr@bpc-switch:
    - shard-rkl:          [SKIP][762] ([i915#16644] / [i915#3555] / [i915#8228]) -> [PASS][763]
   [762]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9180/shard-rkl-4/igt@kms_hdr@bpc-switch.html
   [763]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-1/igt@kms_hdr@bpc-switch.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-glk:          [DMESG-FAIL][764] ([i915#118]) -> [PASS][765]
   [764]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9180/shard-glk4/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
   [765]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk1/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a:
    - shard-rkl:          [INCOMPLETE][766] ([i915#14412]) -> [PASS][767] +1 other test pass
   [766]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9180/shard-rkl-3/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html
   [767]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-5/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-rkl:          [SKIP][768] ([i915#15073]) -> [PASS][769]
   [768]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9180/shard-rkl-4/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [769]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-2/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-dg2:          [SKIP][770] ([i915#15073]) -> [PASS][771]
   [770]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9180/shard-dg2-4/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [771]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg2-7/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@perf_pmu@all-busy-idle-check-all:
    - shard-dg2:          [FAIL][772] -> [PASS][773]
   [772]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9180/shard-dg2-5/igt@perf_pmu@all-busy-idle-check-all.html
   [773]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg2-5/igt@perf_pmu@all-busy-idle-check-all.html
    - shard-mtlp:         [FAIL][774] -> [PASS][775]
   [774]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9180/shard-mtlp-6/igt@perf_pmu@all-busy-idle-check-all.html
   [775]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-mtlp-5/igt@perf_pmu@all-busy-idle-check-all.html

  * igt@perf_pmu@semaphore-busy@bcs0:
    - shard-dg2:          [FAIL][776] ([i915#4349]) -> [PASS][777] +5 other tests pass
   [776]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9180/shard-dg2-5/igt@perf_pmu@semaphore-busy@bcs0.html
   [777]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg2-8/igt@perf_pmu@semaphore-busy@bcs0.html

  * igt@perf_pmu@semaphore-busy@vcs1:
    - shard-mtlp:         [FAIL][778] ([i915#4349]) -> [PASS][779] +4 other tests pass
   [778]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9180/shard-mtlp-6/igt@perf_pmu@semaphore-busy@vcs1.html
   [779]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-mtlp-2/igt@perf_pmu@semaphore-busy@vcs1.html

  
#### Warnings ####

  * igt@gem_ccs@ctrl-surf-copy:
    - shard-rkl:          [SKIP][780] ([i915#3555] / [i915#9323]) -> [SKIP][781] ([i915#14544] / [i915#3555] / [i915#9323]) +1 other test skip
   [780]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9180/shard-rkl-5/igt@gem_ccs@ctrl-surf-copy.html
   [781]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-6/igt@gem_ccs@ctrl-surf-copy.html

  * igt@gem_exec_params@secure-non-root:
    - shard-rkl:          [SKIP][782] ([i915#17416]) -> [SKIP][783] ([i915#14544] / [i915#17416])
   [782]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9180/shard-rkl-3/igt@gem_exec_params@secure-non-root.html
   [783]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-6/igt@gem_exec_params@secure-non-root.html

  * igt@gem_exec_reloc@basic-gtt-wc:
    - shard-rkl:          [SKIP][784] ([i915#14544] / [i915#3281]) -> [SKIP][785] ([i915#3281])
   [784]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9180/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-wc.html
   [785]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-4/igt@gem_exec_reloc@basic-gtt-wc.html

  * igt@gem_exec_reloc@basic-range-active:
    - shard-rkl:          [SKIP][786] ([i915#3281]) -> [SKIP][787] ([i915#14544] / [i915#3281]) +3 other tests skip
   [786]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9180/shard-rkl-2/igt@gem_exec_reloc@basic-range-active.html
   [787]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-6/igt@gem_exec_reloc@basic-range-active.html

  * igt@gem_pxp@hw-rejects-pxp-buffer:
    - shard-rkl:          [FAIL][788] -> [SKIP][789] ([i915#13717])
   [788]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9180/shard-rkl-8/igt@gem_pxp@hw-rejects-pxp-buffer.html
   [789]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-8/igt@gem_pxp@hw-rejects-pxp-buffer.html

  * igt@gem_readwrite@new-obj:
    - shard-rkl:          [SKIP][790] ([i915#3282]) -> [SKIP][791] ([i915#14544] / [i915#3282])
   [790]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9180/shard-rkl-4/igt@gem_readwrite@new-obj.html
   [791]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-6/igt@gem_readwrite@new-obj.html

  * igt@gen7_exec_parse@chained-batch:
    - shard-rkl:          [SKIP][792] ([i915#17455]) -> [SKIP][793] ([i915#14544] / [i915#17455])
   [792]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9180/shard-rkl-2/igt@gen7_exec_parse@chained-batch.html
   [793]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-6/igt@gen7_exec_parse@chained-batch.html

  * igt@gen9_exec_parse@basic-rejected-ctx-param:
    - shard-rkl:          [SKIP][794] ([i915#14544] / [i915#2527]) -> [SKIP][795] ([i915#2527])
   [794]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9180/shard-rkl-6/igt@gen9_exec_parse@basic-rejected-ctx-param.html
   [795]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-1/igt@gen9_exec_parse@basic-rejected-ctx-param.html

  * igt@gen9_exec_parse@unaligned-jump:
    - shard-rkl:          [SKIP][796] ([i915#2527]) -> [SKIP][797] ([i915#14544] / [i915#2527])
   [796]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9180/shard-rkl-3/igt@gen9_exec_parse@unaligned-jump.html
   [797]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-6/igt@gen9_exec_parse@unaligned-jump.html

  * igt@i915_pm_freq_api@freq-reset-multiple:
    - shard-rkl:          [SKIP][798] ([i915#8399]) -> [SKIP][799] ([i915#14544] / [i915#8399])
   [798]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9180/shard-rkl-4/igt@i915_pm_freq_api@freq-reset-multiple.html
   [799]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-6/igt@i915_pm_freq_api@freq-reset-multiple.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-rkl:          [SKIP][800] ([i915#4538] / [i915#5286]) -> [SKIP][801] ([i915#14544] / [i915#4538] / [i915#5286])
   [800]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9180/shard-rkl-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [801]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-rkl:          [SKIP][802] ([i915#14544] / [i915#4538] / [i915#5286]) -> [SKIP][803] ([i915#4538] / [i915#5286])
   [802]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9180/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [803]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-rkl:          [SKIP][804] ([i915#4538]) -> [SKIP][805] ([i915#14544] / [i915#4538]) +2 other tests skip
   [804]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9180/shard-rkl-5/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
   [805]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-6/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-rkl:          [SKIP][806] ([i915#14544] / [i915#4538]) -> [SKIP][807] ([i915#4538])
   [806]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9180/shard-rkl-6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [807]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:
    - shard-rkl:          [SKIP][808] ([i915#14098] / [i915#6095]) -> [SKIP][809] ([i915#14098] / [i915#14544] / [i915#6095]) +4 other tests skip
   [808]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9180/shard-rkl-7/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html
   [809]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-6/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2:
    - shard-rkl:          [SKIP][810] ([i915#6095]) -> [SKIP][811] ([i915#14544] / [i915#6095]) +3 other tests skip
   [810]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9180/shard-rkl-7/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2.html
   [811]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-6/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
    - shard-rkl:          [SKIP][812] ([i915#12313]) -> [SKIP][813] ([i915#12313] / [i915#14544]) +2 other tests skip
   [812]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9180/shard-rkl-8/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html
   [813]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-6/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          [SKIP][814] ([i915#14544] / [i915#6095]) -> [SKIP][815] ([i915#6095]) +1 other test skip
   [814]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9180/shard-rkl-6/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-b-hdmi-a-2.html
   [815]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-7/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:
    - shard-rkl:          [SKIP][816] ([i915#14098] / [i915#14544] / [i915#6095]) -> [SKIP][817] ([i915#14098] / [i915#6095]) +2 other tests skip
   [816]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9180/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html
   [817]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-8/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-rkl:          [SKIP][818] ([i915#12805]) -> [SKIP][819] ([i915#12805] / [i915#14544])
   [818]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9180/shard-rkl-2/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
   [819]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-glk:          [INCOMPLETE][820] ([i915#13356] / [i915#15582]) -> [INCOMPLETE][821] ([i915#13356] / [i915#14694] / [i915#15582]) +1 other test incomplete
   [820]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9180/shard-glk5/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html
   [821]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk1/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-rkl:          [SKIP][822] ([i915#12313] / [i915#14544]) -> [SKIP][823] ([i915#12313])
   [822]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9180/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
   [823]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_cdclk@mode-transition:
    - shard-rkl:          [SKIP][824] ([i915#3742]) -> [SKIP][825] ([i915#14544] / [i915#3742])
   [824]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9180/shard-rkl-8/igt@kms_cdclk@mode-transition.html
   [825]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-6/igt@kms_cdclk@mode-transition.html

  * igt@kms_chamelium_audio@hdmi-audio-after-suspend:
    - shard-rkl:          [SKIP][826] ([i915#11151]) -> [SKIP][827] ([i915#11151] / [i915#14544])
   [826]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9180/shard-rkl-4/igt@kms_chamelium_audio@hdmi-audio-after-suspend.html
   [827]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-6/igt@kms_chamelium_audio@hdmi-audio-after-suspend.html

  * igt@kms_chamelium_color@degamma:
    - shard-rkl:          [SKIP][828] ([i915#17427]) -> [SKIP][829] ([i915#14544] / [i915#17427])
   [828]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9180/shard-rkl-4/igt@kms_chamelium_color@degamma.html
   [829]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-6/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_hpd@vga-hpd-after-suspend:
    - shard-rkl:          [SKIP][830] ([i915#11151] / [i915#7828]) -> [SKIP][831] ([i915#11151] / [i915#14544] / [i915#7828]) +1 other test skip
   [830]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9180/shard-rkl-2/igt@kms_chamelium_hpd@vga-hpd-after-suspend.html
   [831]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-6/igt@kms_chamelium_hpd@vga-hpd-after-suspend.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-rkl:          [SKIP][832] ([i915#15330] / [i915#3116]) -> [SKIP][833] ([i915#14544] / [i915#15330] / [i915#3116])
   [832]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9180/shard-rkl-3/igt@kms_content_protection@dp-mst-type-0.html
   [833]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-6/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@srm:
    - shard-rkl:          [SKIP][834] ([i915#15865]) -> [SKIP][835] ([i915#14544] / [i915#15865])
   [834]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9180/shard-rkl-2/igt@kms_content_protection@srm.html
   [835]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-6/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@suspend-resume:
    - shard-rkl:          [SKIP][836] ([i915#14544] / [i915#15865]) -> [SKIP][837] ([i915#15865])
   [836]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9180/shard-rkl-6/igt@kms_content_protection@suspend-resume.html
   [837]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-4/igt@kms_content_protection@suspend-resume.html

  * igt@kms_cursor_crc@cursor-onscreen-32x10:
    - shard-rkl:          [SKIP][838] ([i915#3555]) -> [SKIP][839] ([i915#14544] / [i915#3555])
   [838]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9180/shard-rkl-4/igt@kms_cursor_crc@cursor-onscreen-32x10.html
   [839]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-32x10.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-mtlp:         [INCOMPLETE][840] ([i915#12358] / [i915#17317]) -> [FAIL][841] ([i915#17157]) +1 other test fail
   [840]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9180/shard-mtlp-1/igt@kms_cursor_crc@cursor-suspend.html
   [841]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-mtlp-2/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
    - shard-rkl:          [SKIP][842] ([i915#17428]) -> [SKIP][843] ([i915#14544] / [i915#17428]) +21 other tests skip
   [842]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9180/shard-rkl-4/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html
   [843]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-6/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html

  * igt@kms_dsc@dsc-fractional-bpp-bigjoiner:
    - shard-rkl:          [SKIP][844] ([i915#14544] / [i915#16361]) -> [SKIP][845] ([i915#16361])
   [844]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9180/shard-rkl-6/igt@kms_dsc@dsc-fractional-bpp-bigjoiner.html
   [845]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-8/igt@kms_dsc@dsc-fractional-bpp-bigjoiner.html

  * igt@kms_dsc@dsc-fractional-bpp-ultrajoiner:
    - shard-rkl:          [SKIP][846] ([i915#16361]) -> [SKIP][847] ([i915#14544] / [i915#16361]) +1 other test skip
   [846]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9180/shard-rkl-8/igt@kms_dsc@dsc-fractional-bpp-ultrajoiner.html
   [847]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-6/igt@kms_dsc@dsc-fractional-bpp-ultrajoiner.html

  * igt@kms_feature_discovery@psr2:
    - shard-rkl:          [SKIP][848] ([i915#14544] / [i915#658]) -> [SKIP][849] ([i915#658])
   [848]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9180/shard-rkl-6/igt@kms_feature_discovery@psr2.html
   [849]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-2/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-flip-vs-panning-vs-hang:
    - shard-rkl:          [SKIP][850] ([i915#9934]) -> [SKIP][851] ([i915#14544] / [i915#9934]) +3 other tests skip
   [850]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9180/shard-rkl-4/igt@kms_flip@2x-flip-vs-panning-vs-hang.html
   [851]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-6/igt@kms_flip@2x-flip-vs-panning-vs-hang.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-glk:          [INCOMPLETE][852] ([i915#12745] / [i915#13356] / [i915#17183] / [i915#4839] / [i915#6113]) -> [INCOMPLETE][853] ([i915#12745] / [i915#13356] / [i915#17183] / [i915#4839])
   [852]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9180/shard-glk3/igt@kms_flip@flip-vs-suspend.html
   [853]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk4/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a1:
    - shard-glk:          [INCOMPLETE][854] ([i915#12745] / [i915#13356] / [i915#17183] / [i915#6113]) -> [INCOMPLETE][855] ([i915#12745] / [i915#13356] / [i915#17183])
   [854]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9180/shard-glk3/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html
   [855]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk4/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-rkl:          [SKIP][856] ([i915#15643]) -> [SKIP][857] ([i915#14544] / [i915#15643]) +3 other tests skip
   [856]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9180/shard-rkl-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html
   [857]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_force_connector_basic@force-load-detect:
    - shard-mtlp:         [SKIP][858] ([i915#17452]) -> [SKIP][859] ([i915#15672])
   [858]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9180/shard-mtlp-8/igt@kms_force_connector_basic@force-load-detect.html
   [859]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-mtlp-1/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_frontbuffer_tracking@fbchdr-suspend:
    - shard-rkl:          [INCOMPLETE][860] ([i915#16056]) -> [SKIP][861] ([i915#15989])
   [860]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9180/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-suspend.html
   [861]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-8/igt@kms_frontbuffer_tracking@fbchdr-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt:
    - shard-rkl:          [SKIP][862] ([i915#14544] / [i915#17428] / [i915#1825]) -> [SKIP][863] ([i915#17428] / [i915#1825])
   [862]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9180/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt.html
   [863]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-mmap-gtt:
    - shard-rkl:          [SKIP][864] ([i915#14544] / [i915#17428]) -> [SKIP][865] ([i915#17428]) +5 other tests skip
   [864]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9180/shard-rkl-6/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html
   [865]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-5/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-rkl:          [SKIP][866] ([i915#17428] / [i915#1825]) -> [SKIP][867] ([i915#14544] / [i915#17428] / [i915#1825]) +1 other test skip
   [866]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9180/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [867]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt:
    - shard-rkl:          [SKIP][868] ([i915#14544] / [i915#15102]) -> [SKIP][869] ([i915#15102]) +2 other tests skip
   [868]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9180/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt.html
   [869]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-3/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-suspend:
    - shard-rkl:          [SKIP][870] ([i915#15102]) -> [SKIP][871] ([i915#14544] / [i915#15102]) +16 other tests skip
   [870]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9180/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-suspend.html
   [871]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-suspend.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-rkl:          [SKIP][872] ([i915#1187] / [i915#12713] / [i915#16644]) -> [SKIP][873] ([i915#12713] / [i915#16644])
   [872]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9180/shard-rkl-3/igt@kms_hdr@brightness-with-hdr.html
   [873]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-5/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-rkl:          [SKIP][874] ([i915#15458]) -> [SKIP][875] ([i915#14544] / [i915#15458])
   [874]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9180/shard-rkl-2/igt@kms_joiner@basic-ultra-joiner.html
   [875]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-6/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c:
    - shard-rkl:          [SKIP][876] ([i915#14544] / [i915#17455]) -> [SKIP][877] ([i915#17455])
   [876]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9180/shard-rkl-6/igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c.html
   [877]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-5/igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c.html

  * igt@kms_pipe_stress@stress-xrgb8888-untiled:
    - shard-glk:          [DMESG-FAIL][878] ([i915#118]) -> [DMESG-WARN][879] ([i915#118])
   [878]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9180/shard-glk4/igt@kms_pipe_stress@stress-xrgb8888-untiled.html
   [879]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk8/igt@kms_pipe_stress@stress-xrgb8888-untiled.html

  * igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping:
    - shard-rkl:          [SKIP][880] ([i915#14544] / [i915#15709]) -> [SKIP][881] ([i915#15709])
   [880]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9180/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping.html
   [881]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-8/igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping.html

  * igt@kms_plane_multiple@2x-tiling-x:
    - shard-rkl:          [SKIP][882] ([i915#13958]) -> [SKIP][883] ([i915#13958] / [i915#14544])
   [882]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9180/shard-rkl-8/igt@kms_plane_multiple@2x-tiling-x.html
   [883]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-6/igt@kms_plane_multiple@2x-tiling-x.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:
    - shard-rkl:          [SKIP][884] ([i915#15329]) -> [SKIP][885] ([i915#14544] / [i915#15329]) +7 other tests skip
   [884]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9180/shard-rkl-7/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html
   [885]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-rkl:          [SKIP][886] ([i915#12343] / [i915#5354]) -> [SKIP][887] ([i915#12343] / [i915#14544] / [i915#5354])
   [886]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9180/shard-rkl-7/igt@kms_pm_backlight@fade-with-suspend.html
   [887]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-6/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_rpm@pc8-residency:
    - shard-tglu:         [SKIP][888] -> [SKIP][889] ([i915#17434] / [i915#17450])
   [888]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9180/shard-tglu-4/igt@kms_pm_rpm@pc8-residency.html
   [889]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-tglu-9/igt@kms_pm_rpm@pc8-residency.html

  * igt@kms_pm_rpm@system-suspend-idle:
    - shard-rkl:          [INCOMPLETE][890] ([i915#14419]) -> [ABORT][891] ([i915#15132])
   [890]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9180/shard-rkl-6/igt@kms_pm_rpm@system-suspend-idle.html
   [891]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-1/igt@kms_pm_rpm@system-suspend-idle.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:
    - shard-rkl:          [SKIP][892] ([i915#11520]) -> [SKIP][893] ([i915#11520] / [i915#14544]) +3 other tests skip
   [892]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9180/shard-rkl-8/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html
   [893]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-rkl:          [SKIP][894] ([i915#9683]) -> [SKIP][895] ([i915#14544] / [i915#9683])
   [894]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9180/shard-rkl-2/igt@kms_psr2_su@page_flip-xrgb8888.html
   [895]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-6/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-pr-cursor-render:
    - shard-rkl:          [SKIP][896] ([i915#1072] / [i915#14544] / [i915#9732]) -> [SKIP][897] ([i915#1072] / [i915#9732]) +2 other tests skip
   [896]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9180/shard-rkl-6/igt@kms_psr@fbc-pr-cursor-render.html
   [897]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-8/igt@kms_psr@fbc-pr-cursor-render.html

  * igt@kms_psr@pr-cursor-plane-onoff:
    - shard-rkl:          [SKIP][898] ([i915#1072] / [i915#9732]) -> [SKIP][899] ([i915#1072] / [i915#14544] / [i915#9732]) +5 other tests skip
   [898]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9180/shard-rkl-4/igt@kms_psr@pr-cursor-plane-onoff.html
   [899]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-6/igt@kms_psr@pr-cursor-plane-onoff.html

  * igt@perf@per-context-mode-unprivileged:
    - shard-rkl:          [SKIP][900] ([i915#14544] / [i915#2435]) -> [SKIP][901] ([i915#2435])
   [900]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9180/shard-rkl-6/igt@perf@per-context-mode-unprivileged.html
   [901]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-7/igt@perf@per-context-mode-unprivileged.html

  * igt@perf_pmu@rc6-suspend:
    - shard-mtlp:         [DMESG-WARN][902] ([i915#17198]) -> [FAIL][903] ([i915#17245])
   [902]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9180/shard-mtlp-6/igt@perf_pmu@rc6-suspend.html
   [903]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-mtlp-8/igt@perf_pmu@rc6-suspend.html

  
  [i915#10055]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10055
  [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
  [i915#10434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434
  [i915#10647]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#1099]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099
  [i915#11078]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078
  [i915#11151]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151
  [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
  [i915#11681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
  [i915#118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/118
  [i915#1187]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1187
  [i915#12177]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12177
  [i915#12178]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12178
  [i915#12193]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12193
  [i915#12276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12276
  [i915#12313]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313
  [i915#12314]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12314
  [i915#12316]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316
  [i915#12343]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343
  [i915#12358]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12358
  [i915#1257]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257
  [i915#12713]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713
  [i915#12745]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745
  [i915#12755]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755
  [i915#12756]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12756
  [i915#12761]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12761
  [i915#12805]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805
  [i915#13046]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046
  [i915#13049]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049
  [i915#13179]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13179
  [i915#13196]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13196
  [i915#13356]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356
  [i915#13363]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13363
  [i915#13390]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13390
  [i915#13398]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13398
  [i915#13476]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13476
  [i915#13520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13520
  [i915#13566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566
  [i915#13688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13688
  [i915#13717]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13717
  [i915#13748]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748
  [i915#13786]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13786
  [i915#13790]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13790
  [i915#13958]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958
  [i915#14073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14073
  [i915#14098]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098
  [i915#14118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14118
  [i915#14123]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14123
  [i915#14259]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259
  [i915#14412]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14412
  [i915#14419]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14419
  [i915#14498]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14498
  [i915#14544]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544
  [i915#14586]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14586
  [i915#14694]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14694
  [i915#14712]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712
  [i915#15073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073
  [i915#15102]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102
  [i915#15104]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104
  [i915#15131]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15131
  [i915#15132]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15132
  [i915#15243]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243
  [i915#15329]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329
  [i915#15330]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330
  [i915#15436]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15436
  [i915#15458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458
  [i915#15459]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15459
  [i915#15492]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15492
  [i915#15500]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15500
  [i915#15542]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15542
  [i915#15582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582
  [i915#15643]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643
  [i915#15672]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15672
  [i915#15709]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709
  [i915#15733]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15733
  [i915#15815]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15815
  [i915#15816]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15816
  [i915#15840]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15840
  [i915#15865]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865
  [i915#15867]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867
  [i915#15948]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15948
  [i915#15989]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989
  [i915#15990]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990
  [i915#15991]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991
  [i915#16056]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16056
  [i915#16081]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16081
  [i915#16109]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16109
  [i915#16182]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16182
  [i915#16184]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16184
  [i915#16276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16276
  [i915#16348]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16348
  [i915#16361]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361
  [i915#16386]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16386
  [i915#16420]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16420
  [i915#16451]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16451
  [i915#16471]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16471
  [i915#16490]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16490
  [i915#16518]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16518
  [i915#16593]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16593
  [i915#16600]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16600
  [i915#16644]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16644
  [i915#16680]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16680
  [i915#16867]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16867
  [i915#16870]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16870
  [i915#16871]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16871
  [i915#16990]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16990
  [i915#16996]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16996
  [i915#17032]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17032
  [i915#17037]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17037
  [i915#17099]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17099
  [i915#17102]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17102
  [i915#17104]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17104
  [i915#17133]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17133
  [i915#17147]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17147
  [i915#17150]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17150
  [i915#17157]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17157
  [i915#17158]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17158
  [i915#17176]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17176
  [i915#17183]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17183
  [i915#17198]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17198
  [i915#17209]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17209
  [i915#17245]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17245
  [i915#17276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17276
  [i915#17285]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17285
  [i915#17287]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17287
  [i915#17317]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17317
  [i915#17342]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17342
  [i915#17416]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17416
  [i915#17427]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427
  [i915#17428]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428
  [i915#17429]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17429
  [i915#17430]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17430
  [i915#17431]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17431
  [i915#17432]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17432
  [i915#17433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17433
  [i915#17434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17434
  [i915#17444]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17444
  [i915#17445]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17445
  [i915#17447]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17447
  [i915#17448]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17448
  [i915#17450]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17450
  [i915#17452]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17452
  [i915#17453]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17453
  [i915#17454]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17454
  [i915#17455]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17455
  [i915#17457]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17457
  [i915#17458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17458
  [i915#17462]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17462
  [i915#17463]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17463
  [i915#17471]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17471
  [i915#17473]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17473
  [i915#17477]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17477
  [i915#17478]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17478
  [i915#17479]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17479
  [i915#17480]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17480
  [i915#17481]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17481
  [i915#17482]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17482
  [i915#17483]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17483
  [i915#17484]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17484
  [i915#17486]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17486
  [i915#17488]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17488
  [i915#17489]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17489
  [i915#17490]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17490
  [i915#17491]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17491
  [i915#17492]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17492
  [i915#17493]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17493
  [i915#17494]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17494
  [i915#17497]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17497
  [i915#17498]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17498
  [i915#17499]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17499
  [i915#17500]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17500
  [i915#17501]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17501
  [i915#17502]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17502
  [i915#17503]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17503
  [i915#17504]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17504
  [i915#17505]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17505
  [i915#17507]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17507
  [i915#17508]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17508
  [i915#17509]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17509
  [i915#17510]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17510
  [i915#17513]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17513
  [i915#17515]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17515
  [i915#17516]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17516
  [i915#17517]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17517
  [i915#17520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17520
  [i915#17521]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17521
  [i915#17522]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17522
  [i915#17523]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17523
  [i915#17524]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17524
  [i915#17525]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17525
  [i915#17526]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17526
  [i915#17527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17527
  [i915#17528]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17528
  [i915#17529]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17529
  [i915#17530]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17530
  [i915#17531]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17531
  [i915#17532]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17532
  [i915#17533]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17533
  [i915#17535]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17535
  [i915#17536]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17536
  [i915#17539]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17539
  [i915#17540]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17540
  [i915#17541]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17541
  [i915#17546]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17546
  [i915#17547]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17547
  [i915#17550]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17550
  [i915#17551]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17551
  [i915#17553]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17553
  [i915#17555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17555
  [i915#17557]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17557
  [i915#17559]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17559
  [i915#17564]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17564
  [i915#17566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17566
  [i915#17567]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17567
  [i915#17569]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17569
  [i915#17575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17575
  [i915#17576]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17576
  [i915#17577]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17577
  [i915#17580]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17580
  [i915#17581]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17581
  [i915#17583]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17583
  [i915#17584]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17584
  [i915#17586]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17586
  [i915#17587]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17587
  [i915#17588]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17588
  [i915#17590]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17590
  [i915#17591]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17591
  [i915#17592]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17592
  [i915#17593]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17593
  [i915#17594]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17594
  [i915#17595]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17595
  [i915#17596]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17596
  [i915#17597]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17597
  [i915#17599]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17599
  [i915#17601]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17601
  [i915#17602]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17602
  [i915#17603]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17603
  [i915#17606]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17606
  [i915#17607]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17607
  [i915#17608]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17608
  [i915#17609]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17609
  [i915#17610]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17610
  [i915#17613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17613
  [i915#17614]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17614
  [i915#17615]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17615
  [i915#17618]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17618
  [i915#17620]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17620
  [i915#17621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17621
  [i915#17622]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17622
  [i915#17624]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17624
  [i915#17625]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17625
  [i915#17626]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17626
  [i915#17628]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17628
  [i915#17629]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17629
  [i915#17631]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17631
  [i915#17632]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17632
  [i915#17634]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17634
  [i915#17636]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17636
  [i915#17637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17637
  [i915#17638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17638
  [i915#17639]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17639
  [i915#17642]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17642
  [i915#17643]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17643
  [i915#17644]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17644
  [i915#17648]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17648
  [i915#17651]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17651
  [i915#17656]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17656
  [i915#17658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17658
  [i915#17663]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17663
  [i915#17667]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17667
  [i915#17668]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17668
  [i915#17669]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17669
  [i915#17674]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17674
  [i915#17676]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17676
  [i915#17678]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17678
  [i915#17683]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17683
  [i915#17685]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17685
  [i915#1769]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769
  [i915#17690]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17690
  [i915#17699]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17699
  [i915#17700]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17700
  [i915#17701]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17701
  [i915#17702]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17702
  [i915#17704]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17704
  [i915#17706]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17706
  [i915#17707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17707
  [i915#17709]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17709
  [i915#17752]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17752
  [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
  [i915#2065]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2065
  [i915#2190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190
  [i915#2434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2434
  [i915#2435]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2435
  [i915#2436]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2436
  [i915#2527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527
  [i915#2681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2681
  [i915#280]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280
  [i915#2856]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856
  [i915#3116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116
  [i915#3281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291
  [i915#3297]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299
  [i915#3323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3323
  [i915#3359]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3359
  [i915#3539]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638
  [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
  [i915#3742]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
  [i915#3828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828
  [i915#4036]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4036
  [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
  [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
  [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212
  [i915#4270]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270
  [i915#4349]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349
  [i915#4525]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525
  [i915#4538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538
  [i915#4565]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4565
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#4771]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4771
  [i915#4812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812
  [i915#4817]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817
  [i915#4818]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4818
  [i915#4839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839
  [i915#4852]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852
  [i915#4860]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860
  [i915#4880]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4880
  [i915#4881]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4881
  [i915#4958]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4958
  [i915#5030]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5030
  [i915#5138]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5138
  [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
  [i915#5286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286
  [i915#5289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#5439]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439
  [i915#5723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5723
  [i915#6095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095
  [i915#6113]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113
  [i915#6187]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6187
  [i915#6188]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6188
  [i915#6301]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301
  [i915#6334]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334
  [i915#6335]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335
  [i915#6412]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6412
  [i915#6524]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524
  [i915#658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658
  [i915#6590]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6590
  [i915#6621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621
  [i915#6805]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6805
  [i915#6953]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953
  [i915#7178]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7178
  [i915#7443]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7443
  [i915#7697]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697
  [i915#7707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707
  [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
  [i915#7862]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7862
  [i915#7975]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7975
  [i915#7984]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7984
  [i915#8228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228
  [i915#8289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8289
  [i915#8381]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381
  [i915#8399]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399
  [i915#8411]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411
  [i915#8428]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428
  [i915#8430]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430
  [i915#8516]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516
  [i915#8555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555
  [i915#8562]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8562
  [i915#8623]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623
  [i915#8708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708
  [i915#8810]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8810
  [i915#8812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8812
  [i915#8813]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813
  [i915#8814]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814
  [i915#8821]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8821
  [i915#8898]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8898
  [i915#9041]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9041
  [i915#9067]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9067
  [i915#9100]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9100
  [i915#9323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323
  [i915#9340]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340
  [i915#9683]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683
  [i915#9685]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685
  [i915#9688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
  [i915#9766]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9766
  [i915#9808]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9808
  [i915#9809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809
  [i915#9812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812
  [i915#9906]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906
  [i915#9934]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9180 -> IGTPW_16112

  CI-20190529: 20190529
  CI_DRM_19458: be7a4fe8d1795219f7d033830ec4cf6e8ca1ecdb @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_16112: 16112
  IGT_9180: 9180

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/index.html

--===============7962291965975178436==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


<!DOCTYPE html>
<html xmlns=3D"http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8"/>
  <title>Project List - Patchwork</title>
  <style id=3D"css-table-select" type=3D"text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>Multi-queue CGP_SYNC replay coverage (rev3)<=
/td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/177781/">https://patchwork.freedesktop.org/series/177781/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_16112/index.html">https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_16112/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_9180_full -&gt; IGTPW_16112_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/index=
.html</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_16112_full that come from known issu=
es:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@blit-noreloc-keep-cache:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb1/igt@api_intel_bb@blit-noreloc-keep-cac=
he.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17667">i915#17667</a>)</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@crc32:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk1/igt@api_intel_bb@crc32.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17576">=
i915#17576</a>)</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@object-reloc-purge-cache:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg1-19/igt@api_intel_bb@object-reloc-purge-=
cache.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@render-ccs:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb7/igt@api_intel_bb@render-ccs.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17=
685">i915#17685</a>)</li>
</ul>
</li>
<li>
<p>igt@device_reset@cold-reset-bound:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg1-14/igt@device_reset@cold-reset-bound.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/11078">i915#11078</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-tglu-3/igt@device_reset@cold-reset-bound.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/11078">i915#11078</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-rkl-8/igt@device_reset@cold-reset-bound.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/11078">i915#11078</a>)</li>
</ul>
</li>
<li>
<p>igt@device_reset@unbind-reset-rebind:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb1/igt@device_reset@unbind-reset-rebind.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/17620">i915#17620</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_basic@multigpu-create-close:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-rkl-8/igt@gem_basic@multigpu-create-close.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/7697">i915#7697</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-multicopy-inplace:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg1-16/igt@gem_ccs@block-multicopy-inplace.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-tglu-10/igt@gem_ccs@ctrl-surf-copy.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy-new-ctx:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg1-18/igt@gem_ccs@ctrl-surf-copy-new-ctx.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/9323">i915#9323</a>) +1 other test skip</li>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk10/igt@gem_ccs@ctrl-surf-copy-new-ctx.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17499">i915#17499</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-rkl-4/igt@gem_ccs@suspend-resume.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/93=
23">i915#9323</a>) +1 other test skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb4/igt@gem_ccs@suspend-resume.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/174=
99">i915#17499</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk5/igt@gem_ccs@suspend-resume.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/174=
99">i915#17499</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg2-3/igt@gem_ccs@suspend-resume@linear-com=
pressed-compfmt0-lmem0-lmem0.html">INCOMPLETE</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16348">i915#163=
48</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-threads:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg1-14/igt@gem_close_race@multigpu-basic-th=
reads.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/7697">i915#7697</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-sanity-check:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb7/igt@gem_create@create-ext-cpu-access-s=
anity-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/17513">i915#17513</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-tglu-4/igt@gem_create@create-ext-cpu-access=
-sanity-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/6335">i915#6335</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-mtlp-6/igt@gem_create@create-ext-cpu-access=
-sanity-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/6335">i915#6335</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk3/igt@gem_create@create-ext-cpu-access-s=
anity-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/17513">i915#17513</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-rkl-3/igt@gem_create@create-ext-cpu-access-=
sanity-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/6335">i915#6335</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-set-pat:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk10/igt@gem_create@create-ext-set-pat.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17530">i915#17530</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-tglu-9/igt@gem_create@create-ext-set-pat.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/8562">i915#8562</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@nonpriv:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb1/igt@gem_ctx_isolation@nonpriv.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
17639">i915#17639</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@vcs1:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9180/shard-mtlp-1/igt@gem_ctx_isolation@preservation-s3@vcs1.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112=
/shard-mtlp-1/igt@gem_ctx_isolation@preservation-s3@vcs1.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17176">i91=
5#17176</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_param@set-priority-not-supported:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk10/igt@gem_ctx_param@set-priority-not-su=
pported.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/17535">i915#17535</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-rkl-1/igt@gem_ctx_param@set-priority-not-su=
pported.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/17444">i915#17444</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@engines-hang@bcs0:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk10/igt@gem_ctx_persistence@engines-hang@=
bcs0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/17527">i915#17527</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@hang:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk8/igt@gem_ctx_persistence@hang.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
7527">i915#17527</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-hostile:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg1-15/igt@gem_ctx_persistence@heartbeat-ho=
stile.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/8555">i915#8555</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-many:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb1/igt@gem_ctx_persistence@heartbeat-many=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17621">i915#17621</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-mtlp-2/igt@gem_ctx_persistence@heartbeat-ma=
ny.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/8555">i915#8555</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-mixed:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb5/igt@gem_ctx_persistence@legacy-engines=
-mixed.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/1099">i915#1099</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_shared@q-smoketest-all:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb5/igt@gem_ctx_shared@q-smoketest-all.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17342">i915#17342</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-sseu:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-rkl-7/igt@gem_ctx_sseu@invalid-sseu.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/280">i915#280</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-suspend:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk10/igt@gem_eio@in-flight-suspend.html">I=
NCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/13356">i915#13356</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/13390">i915#13390</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb1/igt@gem_eio@unwedge-stress.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/889=
8">i915#8898</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-dual:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg1-18/igt@gem_exec_balancer@bonded-dual.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/4771">i915#4771</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-false-hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg2-4/igt@gem_exec_balancer@bonded-false-ha=
ng.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/4812">i915#4812</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg1-19/igt@gem_exec_balancer@bonded-false-h=
ang.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/4812">i915#4812</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-pair:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg2-5/igt@gem_exec_balancer@bonded-pair.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/4771">i915#4771</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@invalid-bonds:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg1-16/igt@gem_exec_balancer@invalid-bonds.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/4036">i915#4036</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@noheartbeat:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg2-3/igt@gem_exec_balancer@noheartbeat.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/8555">i915#8555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb7/igt@gem_exec_balancer@parallel.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17587">i915#17587</a>) +9 other tests skip</li>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk11/igt@gem_exec_balancer@parallel.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/17547">i915#17547</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-balancer:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-rkl-2/igt@gem_exec_balancer@parallel-balanc=
er.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/4525">i915#4525</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-bb-first:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-tglu-5/igt@gem_exec_balancer@parallel-bb-fi=
rst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/4525">i915#4525</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-submit-fence:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk1/igt@gem_exec_balancer@parallel-keep-su=
bmit-fence.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/17547">i915#17547</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_big@single:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-tglu-8/igt@gem_exec_big@single.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1581=
6">i915#15816</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-invisible:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk10/igt@gem_exec_capture@capture-invisibl=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/6334">i915#6334</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-invisible@smem0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-tglu-9/igt@gem_exec_capture@capture-invisib=
le@smem0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/6334">i915#6334</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@pi:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb7/igt@gem_exec_capture@pi.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17610"=
>i915#17610</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@submit3:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb5/igt@gem_exec_fence@submit3.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/175=
99">i915#17599</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-batch-kernel-default-cmd:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg1-15/igt@gem_exec_flush@basic-batch-kerne=
l-default-cmd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/3539">i915#3539</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/4852">i915#4852</a>) +2 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-rw-default:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg2-3/igt@gem_exec_flush@basic-uc-rw-defaul=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3539">i915#3539</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/4852">i915#4852</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@rsvd2-dirt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-rkl-7/igt@gem_exec_params@rsvd2-dirt.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/17453">i915#17453</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-master:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-rkl-7/igt@gem_exec_params@secure-non-master=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17416">i915#17416</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg1-19/igt@gem_exec_params@secure-non-maste=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17416">i915#17416</a>) +2 other tests skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb6/igt@gem_exec_params@secure-non-master.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/17523">i915#17523</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-root:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk3/igt@gem_exec_params@secure-non-root.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17523">i915#17523</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-cpu-active:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-cpu-acti=
ve.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/3281">i915#3281</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-noreloc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-mtlp-8/igt@gem_exec_reloc@basic-gtt-noreloc=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/3281">i915#3281</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-read:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg2-5/igt@gem_exec_reloc@basic-gtt-read.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/3281">i915#3281</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-wc-noreloc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-rkl-4/igt@gem_exec_reloc@basic-gtt-wc-norel=
oc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3281">i915#3281</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-cpu-active:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg1-18/igt@gem_exec_reloc@basic-write-cpu-a=
ctive.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3281">i915#3281</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@smoketest-all:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb5/igt@gem_exec_schedule@smoketest-all.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17590">i915#17590</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk11/igt@gem_exec_suspend@basic-s3.html">I=
NCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/13196">i915#13196</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/13356">i915#13356</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3@smem:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb4/igt@gem_exec_suspend@basic-s3@smem.htm=
l">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/15840">i915#15840</a>) +11 other tests abort</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s4-devices:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9180/shard-rkl-3/igt@gem_exec_suspend@basic-s4-devices.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard=
-rkl-1/igt@gem_exec_suspend@basic-s4-devices.html">ABORT</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15542">i915#15542</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7975"=
>i915#7975</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues-priority:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb7/igt@gem_exec_whisper@basic-queues-prio=
rity.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/17628">i915#17628</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exercise_blt@fast-copy:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb1/igt@gem_exercise_blt@fast-copy.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17622">i915#17622</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_fence_thrash@bo-write-verify-none:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-mtlp-6/igt@gem_fence_thrash@bo-write-verify=
-none.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/4860">i915#4860</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@no-spare-fences:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg1-17/igt@gem_fenced_exec_thrash@no-spare-=
fences.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/4860">i915#4860</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg2-7/igt@gem_fenced_exec_thrash@no-spare-f=
ences.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/4860">i915#4860</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_gpgpu_fill@basic:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb6/igt@gem_gpgpu_fill@basic.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17608=
">i915#17608</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-rkl-8/igt@gem_huc_copy@huc-copy.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/219=
0">i915#2190</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-tglu-7/igt@gem_huc_copy@huc-copy.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/21=
90">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-rkl-6/igt@gem_lmem_swapping@heavy-verify-mu=
lti-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-multi:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-rkl-5/igt@gem_lmem_swapping@parallel-multi.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/4613">i915#4613</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk11/igt@gem_lmem_swapping@parallel-random=
-verify.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/17503">i915#17503</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify-ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg1-14/igt@gem_lmem_swapping@parallel-rando=
m-verify-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/12193">i915#12193</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random-engines:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk9/igt@gem_lmem_swapping@random-engines.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/17503">i915#17503</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/4613">i915#4613</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb7/igt@gem_lmem_swapping@smem-oom.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17503">i915#17503</a>) +8 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-tglu-9/igt@gem_lmem_swapping@smem-oom.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/4613">i915#4613</a>) +3 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-mtlp-1/igt@gem_lmem_swapping@smem-oom.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-ccs@lmem0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg1-17/igt@gem_lmem_swapping@verify-ccs@lme=
m0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/4565">i915#4565</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_media_fill@media-fill:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-mtlp-2/igt@gem_media_fill@media-fill.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/8289">i915#8289</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg2-8/igt@gem_media_fill@media-fill.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/8289">i915#8289</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@big-bo:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-mtlp-2/igt@gem_mmap@big-bo.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i9=
15#4083</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@coherency:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-rkl-4/igt@gem_mmap_gtt@coherency.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17=
429">i915#17429</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-tglu-2/igt@gem_mmap_gtt@coherency.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
7429">i915#17429</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@flink-race:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg1-15/igt@gem_mmap_gtt@flink-race.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
4077">i915#4077</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@medium-copy-odd:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg2-6/igt@gem_mmap_gtt@medium-copy-odd.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/4077">i915#4077</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@medium-copy-xy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-mtlp-2/igt@gem_mmap_gtt@medium-copy-xy.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/4077">i915#4077</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@close:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg2-8/igt@gem_mmap_wc@close.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i=
915#4083</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@copy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg1-18/igt@gem_mmap_wc@copy.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i=
915#4083</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-rkl-7/igt@gem_partial_pwrite_pread@writes-a=
fter-reads.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/3282">i915#3282</a>) +7 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg1-17/igt@gem_partial_pwrite_pread@writes-=
after-reads.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/3282">i915#3282</a>) +5 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-mtlp-5/igt@gem_partial_pwrite_pread@writes-=
after-reads.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/3282">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ppgtt@shrink-vs-evict-any:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb4/igt@gem_ppgtt@shrink-vs-evict-any.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/17615">i915#17615</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@display-protected-crc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg1-15/igt@gem_pxp@display-protected-crc.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/4270">i915#4270</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@fail-invalid-protected-context:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk11/igt@gem_pxp@fail-invalid-protected-co=
ntext.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/17521">i915#17521</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@hw-rejects-pxp-buffer:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-tglu-7/igt@gem_pxp@hw-rejects-pxp-buffer.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/13398">i915#13398</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-mtlp-2/igt@gem_pxp@hw-rejects-pxp-buffer.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/13398">i915#13398</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@hw-rejects-pxp-context:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-rkl-8/igt@gem_pxp@hw-rejects-pxp-context.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/13717">i915#13717</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@protected-encrypted-src-copy-not-readible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg2-7/igt@gem_pxp@protected-encrypted-src-c=
opy-not-readible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/4270">i915#4270</a>) +1 other test skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb6/igt@gem_pxp@protected-encrypted-src-co=
py-not-readible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/17521">i915#17521</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk5/igt@gem_pxp@reject-modify-context-prot=
ection-off-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/17521">i915#17521</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-3:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9180/shard-rkl-3/igt@gem_pxp@reject-modify-context-protection-off-3.ht=
ml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_16112/shard-rkl-8/igt@gem_pxp@reject-modify-context-protection-off-3.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/4270">i915#4270</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_readwrite@write-bad-handle:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg2-5/igt@gem_readwrite@write-bad-handle.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/3282">i915#3282</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-to-vebox-linear:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb1/igt@gem_render_copy@y-tiled-to-vebox-l=
inear.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/17492">i915#17492</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-to-vebox-yf-tiled:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk11/igt@gem_render_copy@y-tiled-to-vebox-=
yf-tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/17492">i915#17492</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-mtlp-3/igt@gem_render_copy@yf-tiled.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/8428">i915#8428</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-ccs-to-y-tiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg2-7/igt@gem_render_copy@yf-tiled-ccs-to-y=
-tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/5190">i915#5190</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/8428">i915#8428</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-ccs-to-y-tiled-ccs:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb4/igt@gem_render_copy@yf-tiled-ccs-to-y-=
tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/17591">i915#17591</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk3/igt@gem_render_copy@yf-tiled-to-vebox-=
yf-tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/17492">i915#17492</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@tiled-to-untiled:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-rkl-7/igt@gem_set_tiling_vs_blt@tiled-to-un=
tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-rkl-8/igt@gem_softpin@evict-snoop.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
7430">i915#17430</a>) +1 other test skip</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk9/igt@gem_softpin@evict-snoop.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17=
551">i915#17551</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@safe-alignment:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb6/igt@gem_softpin@safe-alignment.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17471">i915#17471</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-sync:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-tglu-4/igt@gem_userptr_blits@coherency-sync=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17433">i915#17433</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk3/igt@gem_userptr_blits@coherency-sync.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/16871">i915#16871</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-unsync:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg1-17/igt@gem_userptr_blits@coherency-unsy=
nc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3297">i915#3297</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@create-destroy-unsync:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-rkl-4/igt@gem_userptr_blits@create-destroy-=
unsync.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/3297">i915#3297</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk9/igt@gem_userptr_blits@dmabuf-sync.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/17507">i915#17507</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/3323">i915#3323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg2-6/igt@gem_userptr_blits@map-fixed-inval=
idate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3297">i915#3297</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/4880">i915#4880</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-mtlp-8/igt@gem_userptr_blits@map-fixed-inva=
lidate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate-overlap:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg1-15/igt@gem_userptr_blits@map-fixed-inva=
lidate-overlap.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/3297">i915#3297</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/4880">i915#4880</a>) +2 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@sd-probe:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg1-19/igt@gem_userptr_blits@sd-probe.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3297">i915#3297</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/4958">i915#4958</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-overlap:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb1/igt@gem_userptr_blits@unsync-overlap.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/17507">i915#17507</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk5/igt@gem_userptr_blits@unsync-unmap.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17507">i915#17507</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-after-close:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-tglu-3/igt@gem_userptr_blits@unsync-unmap-a=
fter-close.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-cycles:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk11/igt@gem_userptr_blits@unsync-unmap-cy=
cles.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/17507">i915#17507</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_vm_create@create-ext:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb6/igt@gem_vm_create@create-ext.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
7596">i915#17596</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_watchdog@default-physical:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb4/igt@gem_watchdog@default-physical.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/17669">i915#17669</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-fd:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk6/igt@gem_workarounds@suspend-resume-fd.=
html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/13356">i915#13356</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/14586">i915#14586</a>)</li>
</ul>
</li>
<li>
<p>igt@gen3_render_linear_blits:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb5/igt@gen3_render_linear_blits.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
7555">i915#17555</a>)</li>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk10/igt@gen3_render_linear_blits.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
17555">i915#17555</a>)</li>
</ul>
</li>
<li>
<p>igt@gen3_render_mixed_blits:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk9/igt@gen3_render_mixed_blits.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17=
532">i915#17532</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb1/igt@gen3_render_mixed_blits.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17=
532">i915#17532</a>)</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-allocation:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk11/igt@gen7_exec_parse@basic-allocation.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/17505">i915#17505</a>)</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-allowed:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb4/igt@gen7_exec_parse@basic-allowed.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/17505">i915#17505</a>)</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-rejected:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg1-19/igt@gen7_exec_parse@basic-rejected.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/17455">i915#17455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@batch-without-end:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-rkl-6/igt@gen7_exec_parse@batch-without-end=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/17455">i915#17455</a>)</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@chained-batch:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk1/igt@gen7_exec_parse@chained-batch.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/17505">i915#17505</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@oacontrol-tracking:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-tglu-2/igt@gen7_exec_parse@oacontrol-tracki=
ng.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17455">i915#17455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@basic-rejected:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-tglu-4/igt@gen9_exec_parse@basic-rejected.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/2527">i915#2527</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/2856">i915#2856</a>) +2 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-mtlp-6/igt@gen9_exec_parse@basic-rejected.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/2856">i915#2856</a>) +1 other test skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg2-6/igt@gen9_exec_parse@basic-rejected.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/2856">i915#2856</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-oversize:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-rkl-8/igt@gen9_exec_parse@bb-oversize.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/2527">i915#2527</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-cmd:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb1/igt@gen9_exec_parse@bb-start-cmd.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/17597">i915#17597</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@shadow-peek:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg1-15/igt@gen9_exec_parse@shadow-peek.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/2527">i915#2527</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@all-busy-check-all:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg1-17/igt@i915_drm_fdinfo@all-busy-check-a=
ll.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/14123">i915#14123</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy-hang@ccs0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-mtlp-8/igt@i915_drm_fdinfo@busy-hang@ccs0.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/14073">i915#14073</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy-hang@vcs0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg2-6/igt@i915_drm_fdinfo@busy-hang@vcs0.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/14073">i915#14073</a>) +7 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg1-16/igt@i915_drm_fdinfo@busy-hang@vcs0.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/14073">i915#14073</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@memory-info-purgeable:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb7/igt@i915_drm_fdinfo@memory-info-purgea=
ble.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17603">i915#17603</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@virtual-busy-idle:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg1-16/igt@i915_drm_fdinfo@virtual-busy-idl=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/14118">i915#14118</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_fb_tiling@basic-x-tiling:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-mtlp-7/igt@i915_fb_tiling@basic-x-tiling.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/13786">i915#13786</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_hangman@gt-engine-error@bcs0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk5/igt@i915_hangman@gt-engine-error@bcs0.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/17580">i915#17580</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_hangman@hangcheck-unterminated:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb4/igt@i915_hangman@hangcheck-unterminate=
d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17607">i915#17607</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-no-display:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9180/shard-tglu-4/igt@i915_module_load@reload-no-display.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/sha=
rd-tglu-3/igt@i915_module_load@reload-no-display.html">ABORT</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16996">i915#169=
96</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@resize-bar:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-rkl-6/igt@i915_module_load@resize-bar.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/6412">i915#6412</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg1-18/igt@i915_module_load@resize-bar.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/7178">i915#7178</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb5/igt@i915_module_load@resize-bar.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/17566">i915#17566</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk3/igt@i915_module_load@resize-bar.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/17566">i915#17566</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-basic-api:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk8/igt@i915_pm_freq_api@freq-basic-api.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17526">i915#17526</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-rkl-2/igt@i915_pm_freq_api@freq-basic-api.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/8399">i915#8399</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb4/igt@i915_pm_freq_api@freq-basic-api.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17526">i915#17526</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_mult@media-freq:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk6/igt@i915_pm_freq_mult@media-freq.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/17699">i915#17699</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_mult@media-freq@gt0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-rkl-8/igt@i915_pm_freq_mult@media-freq@gt0.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/6590">i915#6590</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg1-14/igt@i915_pm_freq_mult@media-freq@gt0=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/6590">i915#6590</a>) +1 other test skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb4/igt@i915_pm_freq_mult@media-freq@gt0.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/17624">i915#17624</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@media-rc6-accuracy:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk9/igt@i915_pm_rc6_residency@media-rc6-ac=
curacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17541">i915#17541</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-tglu-8/igt@i915_pm_rc6_residency@rc6-fence.=
html">WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/13790">i915#13790</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/2681">i915#2681</a>) +1 other test warn</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-tglu-4/igt@i915_pm_rc6_residency@rc6-idle.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/14498">i915#14498</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk3/igt@i915_pm_rc6_residency@rc6-idle.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17690">i915#17690</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb7/igt@i915_pm_rc6_residency@rc6-idle.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17690">i915#17690</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress-pc8:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk9/igt@i915_pm_rpm@gem-execbuf-stress-pc8=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17706">i915#17706</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-rkl-5/igt@i915_pm_rpm@gem-execbuf-stress-pc=
8.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17434">i915#17434</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/17450">i915#17450</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@min-max-config-idle:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg1-15/igt@i915_pm_rps@min-max-config-idle.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/11681">i915#11681</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/6621">i915#6621</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds-idle-park:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-mtlp-5/igt@i915_pm_rps@thresholds-idle-park=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/11681">i915#11681</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_power@sanity:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9180/shard-mtlp-6/igt@i915_power@sanity.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-mtlp-8/igt@i=
915_power@sanity.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/7984">i915#7984</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-rkl-3/igt@i915_power@sanity.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7984">i=
915#7984</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@hwconfig_table:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb5/igt@i915_query@hwconfig_table.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
17584">i915#17584</a>)</li>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk10/igt@i915_query@hwconfig_table.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17584">i915#17584</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-coherent-slice-mask:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-mtlp-2/igt@i915_query@query-topology-cohere=
nt-slice-mask.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/6188">i915#6188</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg2-8/igt@i915_query@query-topology-coheren=
t-slice-mask.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/6188">i915#6188</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-garbage-items:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb1/igt@i915_query@query-topology-garbage-=
items.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/17629">i915#17629</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-known-pci-ids:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg1-17/igt@i915_query@query-topology-known-=
pci-ids.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/16109">i915#16109</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-mtlp-5/igt@i915_query@query-topology-known-=
pci-ids.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/16109">i915#16109</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@test-query-geometry-subslices:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-tglu-3/igt@i915_query@test-query-geometry-s=
ubslices.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/5723">i915#5723</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-tglu-8/igt@i915_suspend@basic-s3-without-i9=
15.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/4817">i915#4817</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/7443">i915#7443</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@forcewake:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk3/igt@i915_suspend@forcewake.html">INCOM=
PLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/13356">i915#13356</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/16182">i915#16182</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/4817">i915#4817</a>)</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-rkl-5/igt@intel_hwmon@hwmon-write.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7=
707">i915#7707</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb6/igt@intel_hwmon@hwmon-write.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17=
674">i915#17674</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bo-too-small-due-to-tiling:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg1-16/igt@kms_addfb_basic@bo-too-small-due=
-to-tiling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/4212">i915#4212</a>) +2 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-mtlp-8/igt@kms_addfb_basic@bo-too-small-due=
-to-tiling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/4212">i915#4212</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk5/igt@kms_addfb_basic@invalid-smem-bo-on=
-discrete.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/17668">i915#17668</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb7/igt@kms_addfb_basic@invalid-smem-bo-on=
-discrete.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/17668">i915#17668</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@tile-pitch-mismatch:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg2-4/igt@kms_addfb_basic@tile-pitch-mismat=
ch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/4212">i915#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-dpms@pipe-a-vga-1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb1/igt@kms_async_flips@async-flip-dpms@pi=
pe-a-vga-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/17644">i915#17644</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-dpms@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb1/igt@kms_async_flips@async-flip-dpms@pi=
pe-b-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/17613">i915#17613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9180/shard-mtlp-6/igt@kms_async_flips@async-flip-suspend-resume.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16=
112/shard-mtlp-8/igt@kms_async_flips@async-flip-suspend-resume.html">INCOMP=
LETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/17037">i915#17037</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9180/shard-mtlp-6/igt@kms_async_flips@async-flip-suspend-resume@pipe-b=
-edp-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_16112/shard-mtlp-8/igt@kms_async_flips@async-flip-suspend-resume=
@pipe-b-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/17150">i915#17150</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb6/igt@kms_async_flips@invalid-async-flip=
@pipe-a-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/17614">i915#17614</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-mtlp-4/igt@kms_atomic@plane-primary-overlay=
-mutable-zpos.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-=
panels:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg1-19/igt@kms_atomic_transition@plane-all-=
modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915=
#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-tglu-9/igt@kms_big_fb@4-tiled-16bpp-rotate-=
90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17432">i915#17432</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/5286">i915#5286</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg1-15/igt@kms_big_fb@4-tiled-32bpp-rotate-=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/4538">i915#4538</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/5286">i915#5286</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk11/igt@kms_big_fb@4-tiled-64bpp-rotate-2=
70.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17478">i915#17478</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-rkl-7/igt@kms_big_fb@4-tiled-addfb.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
5286">i915#5286</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg1-14/igt@kms_big_fb@4-tiled-addfb-size-of=
fset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk10/igt@kms_big_fb@4-tiled-max-hw-stride-=
32bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/17478">i915#17478</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk5/igt@kms_big_fb@4-tiled-max-hw-stride-3=
2bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/17478">i915#17478</a>) +13 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-=
32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5=
286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9180/shard-mtlp-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-18=
0.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_16112/shard-mtlp-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-=
180.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/15733">i915#15733</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/5138">i915#5138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-rkl-4/igt@kms_big_fb@4-tiled-max-hw-stride-=
64bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +8 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg2-5/igt@kms_big_fb@linear-16bpp-rotate-27=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17431">i915#17431</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk9/igt@kms_big_fb@linear-16bpp-rotate-90.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/17500">i915#17500</a>) +12 other tests skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb1/igt@kms_big_fb@linear-16bpp-rotate-90.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/17500">i915#17500</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-270:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk11/igt@kms_big_fb@linear-64bpp-rotate-27=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17500">i915#17500</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-tglu-3/igt@kms_big_fb@linear-64bpp-rotate-9=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17431">i915#17431</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk11/igt@kms_big_fb@linear-max-hw-stride-3=
2bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/17524">i915#17524</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb1/igt@kms_big_fb@linear-max-hw-stride-32=
bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/17524">i915#17524</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-mtlp-1/igt@kms_big_fb@linear-max-hw-stride-=
32bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/3828">i915#3828</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg2-8/igt@kms_big_fb@linear-max-hw-stride-6=
4bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/3828">i915#3828</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-tglu-3/igt@kms_big_fb@linear-max-hw-stride-=
64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg1-19/igt@kms_big_fb@linear-max-hw-stride-=
64bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-rkl-5/igt@kms_big_fb@x-tiled-32bpp-rotate-2=
70.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17431">i915#17431</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/3638">i915#3638</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-mtlp-8/igt@kms_big_fb@x-tiled-64bpp-rotate-=
270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17431">i915#17431</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg1-15/igt@kms_big_fb@y-tiled-8bpp-rotate-2=
70.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3638">i915#3638</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg2-6/igt@kms_big_fb@y-tiled-8bpp-rotate-90=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/4538">i915#4538</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/5190">i915#5190</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb7/igt@kms_big_fb@y-tiled-addfb-size-offs=
et-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/17557">i915#17557</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-mtlp-6/igt@kms_big_fb@y-tiled-addfb-size-of=
fset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/6187">i915#6187</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</=
p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-tglu-10/igt@kms_big_fb@yf-tiled-max-hw-stri=
de-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/17432">i915#17432</a>) +7 other =
tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-mtlp-8/igt@kms_big_fb@yf-tiled-max-hw-strid=
e-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/17432">i915#17432</a>) +5 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-rkl-2/igt@kms_big_fb@yf-tiled-max-hw-stride=
-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a>) +7 other tests sk=
ip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg1-16/igt@kms_big_fb@yf-tiled-max-hw-strid=
e-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a>) +6 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb1/igt@kms_big_fb@yf-tiled-max-hw-stride-=
64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/17478">i915#17478</a>) +29 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_busy@extended-modeset-hang-newfb-with-reset:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9180/shard-tglu-8/igt@kms_busy@extended-modeset-hang-newfb-with-reset.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_16112/shard-tglu-3/igt@kms_busy@extended-modeset-hang-newfb-with-reset.=
html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/13363">i915#13363</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_busy@extended-modeset-hang-newfb-with-reset@pipe-a:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9180/shard-tglu-8/igt@kms_busy@extended-modeset-hang-newfb-with-reset@=
pipe-a.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_16112/shard-tglu-3/igt@kms_busy@extended-modeset-hang-newfb-with=
-reset@pipe-a.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/17147">i915#17147</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg1-17/igt@kms_ccs@bad-aux-stride-4-tiled-m=
tl-mc-ccs@pipe-a-hdmi-a-4.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +156 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-mtlp-2/igt@kms_ccs@bad-pixel-format-4-tiled=
-dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/6095">i915#6095</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk9/igt@kms_ccs@bad-pixel-format-4-tiled-d=
g2-rc-ccs@pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/17491">i915#17491</a>) +97 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk10/igt@kms_ccs@bad-pixel-format-y-tiled-=
ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/17491">i915#17491</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-b=
mg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/12313">i915#12313</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg2-4/igt@kms_ccs@bad-rotation-90-y-tiled-g=
en12-rc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434">i915#10434</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i=
915#6095</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk1/igt@kms_ccs@ccs-on-another-bo-4-tiled-=
mtl-mc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/17490">i915#17490</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17491">i915#17491</a>) +=
35 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-tglu-10/igt@kms_ccs@ccs-on-another-bo-y-til=
ed-gen12-mc-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +79 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk11/igt@kms_ccs@crc-primary-basic-4-tiled=
-mtl-rc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/17490">i915#17490</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17491">i915#17491</a>) =
+15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-tglu-4/igt@kms_ccs@crc-primary-rotation-180=
-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg2-3/igt@kms_ccs@crc-primary-rotation-180-=
4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-rkl-2/igt@kms_ccs@crc-primary-rotation-180-=
4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/12313">i915#12313</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-mtlp-3/igt@kms_ccs@crc-primary-rotation-180=
-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk3/igt@kms_ccs@crc-primary-suspend-4-tile=
d-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/17525">i915#17525</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg2-4/igt@kms_ccs@crc-primary-suspend-4-til=
ed-mtl-mc-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +7 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2:</=
p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-4-til=
ed-mtl-rc-ccs-cc@pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-2:</=
p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-4-til=
ed-mtl-rc-ccs-cc@pipe-c-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/60=
95">i915#6095</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-rkl-4/igt@kms_ccs@crc-primary-suspend-yf-ti=
led-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/14098">i915#14098</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +63 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg1-14/igt@kms_ccs@crc-sprite-planes-basic-=
4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/12313">i915#12313</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2:<=
/p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk11/igt@kms_ccs@crc-sprite-planes-basic-4=
-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/17491">i915#17491</a>) +43 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk10/igt@kms_ccs@crc-sprite-planes-basic-4=
-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/17525">i915#17525</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg2-4/igt@kms_ccs@missing-ccs-buffer-4-tile=
d-mtl-mc-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +=
87 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk10/igt@kms_ccs@missing-ccs-buffer-y-tile=
d-gen12-mc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/17490">i915#17490</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17491">i915#17491</a=
>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk11/igt@kms_ccs@random-ccs-data-4-tiled-l=
nl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17525">i915#17525</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-rkl-7/igt@kms_ccs@random-ccs-data-4-tiled-m=
tl-rc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +84 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-ccs:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb1/igt@kms_ccs@random-ccs-data-y-tiled-cc=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17594">i915#17594</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-rejected-max-dotclock:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-rkl-8/igt@kms_cdclk@mode-rejected-max-dotcl=
ock.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17099">i915#17099</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk4/igt@kms_cdclk@mode-transition.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
17550">i915#17550</a>) +1 other test skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb5/igt@kms_cdclk@mode-transition.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
17550">i915#17550</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-tglu-10/igt@kms_cdclk@mode-transition.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3742">i915#3742</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio-after-suspend:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-tglu-2/igt@kms_chamelium_audio@dp-audio-aft=
er-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/11151">i915#11151</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk10/igt@kms_chamelium_audio@hdmi-audio.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17483">i915#17483</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-after-suspend:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg1-18/igt@kms_chamelium_audio@hdmi-audio-a=
fter-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/11151">i915#11151</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-rkl-6/igt@kms_chamelium_color@ctm-blue-to-r=
ed.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/17427">i915#17427</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-tglu-4/igt@kms_chamelium_color@ctm-limited-=
range.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/17427">i915#17427</a>) +3 other tests skip</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk3/igt@kms_chamelium_color@ctm-limited-ra=
nge.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17489">i915#17489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb6/igt@kms_chamelium_color@ctm-max.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/17489">i915#17489</a>) +1 other test skip</li>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk11/igt@kms_chamelium_color@ctm-max.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/17489">i915#17489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg1-18/igt@kms_chamelium_color@degamma.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/17427">i915#17427</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-ctm3x4:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk11/igt@kms_chamelium_color_pipeline@plan=
e-ctm3x4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/17497">i915#17497</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-ctm3x4-lut1d:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg2-5/igt@kms_chamelium_color_pipeline@plan=
e-ctm3x4-lut1d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/16471">i915#16471</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg1-14/igt@kms_chamelium_color_pipeline@pla=
ne-ctm3x4-lut1d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/16471">i915#16471</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk3/igt@kms_chamelium_color_pipeline@plane=
-fixed-matrix-yuv-rgb-bt2020.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/17497">i915#17497</a>) +4 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lu=
t1d:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg2-3/igt@kms_chamelium_color_pipeline@plan=
e-fixed-matrix-yuv-rgb-bt601-lim-lut1d.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>) +1 ot=
her test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-rkl-2/igt@kms_chamelium_color_pipeline@plan=
e-fixed-matrix-yuv-rgb-bt601-lim-lut1d.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>) +3 ot=
her tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-mtlp-3/igt@kms_chamelium_color_pipeline@pla=
ne-fixed-matrix-yuv-rgb-bt601-lim-lut1d.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>) +3 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d:=
</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb7/igt@kms_chamelium_color_pipeline@plane=
-fixed-matrix-yuv-rgb-bt601-lut1d.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/17497">i915#17497</a>) +5 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-rkl-4/igt@kms_chamelium_color_pipeline@plan=
e-lut1d-ctm3x4-lut1d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/16471">i915#16471</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>) +2 othe=
r tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-tglu-2/igt@kms_chamelium_color_pipeline@pla=
ne-lut1d-ctm3x4-lut1d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/16471">i915#16471</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#17427</a>) +2 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk10/igt@kms_chamelium_color_pipeline@plan=
e-lut1d-post-ctm3x4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/17497">i915#17497</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-read:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb1/igt@kms_chamelium_edid@hdmi-edid-read.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/17483">i915#17483</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-fast:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-mtlp-4/igt@kms_chamelium_frames@dp-crc-fast=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/7828">i915#7828</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-single:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg1-17/igt@kms_chamelium_frames@dp-crc-sing=
le.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/7828">i915#7828</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-cmp-planar-formats:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg2-7/igt@kms_chamelium_frames@hdmi-cmp-pla=
nar-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +7 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@vga-frame-dump:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-rkl-6/igt@kms_chamelium_frames@vga-frame-du=
mp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-after-runtime-suspend-d3hot:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg2-7/igt@kms_chamelium_hpd@dp-hpd-after-ru=
ntime-suspend-d3hot.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/11151">i915#11151</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-rkl-2/igt@kms_chamelium_hpd@dp-hpd-after-ru=
ntime-suspend-d3hot.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/11151">i915#11151</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-after-suspend:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk11/igt@kms_chamelium_hpd@dp-hpd-after-su=
spend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/17483">i915#17483</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-after-runtime-suspend-d3hot:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-mtlp-4/igt@kms_chamelium_hpd@hdmi-hpd-after=
-runtime-suspend-d3hot.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/11151">i915#11151</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk3/igt@kms_chamelium_hpd@hdmi-hpd-with-en=
abled-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/17483">i915#17483</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-fast:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-rkl-8/igt@kms_chamelium_hpd@vga-hpd-fast.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/7828">i915#7828</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-tglu-3/igt@kms_chamelium_hpd@vga-hpd-for-ea=
ch-pipe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +9 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_color@background-color@pipe-a-background-color:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk8/igt@kms_color@background-color@pipe-a-=
background-color.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/17133">i915#17133</a>) +3 other tests fail</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb4/igt@kms_color@background-color@pipe-a-=
background-color.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/17663">i915#17663</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color@background-color@pipe-b-background-color:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb4/igt@kms_color@background-color@pipe-b-=
background-color.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/17656">i915#17656</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-ctm3x4:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb4/igt@kms_color_pipeline@plane-ctm3x4.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17510">i915#17510</a>) +3 other tests skip</li>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk11/igt@kms_color_pipeline@plane-ctm3x4.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/17510">i915#17510</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk5/igt@kms_color_pipeline@plane-fixed-mat=
rix-yuv-rgb-bt601.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/17510">i915#17510</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk10/igt@kms_color_pipeline@plane-fixed-ma=
trix-yuv-rgb-bt709.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/17510">i915#17510</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d@pipe-d-plane-3:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-tglu-4/igt@kms_color_pipeline@plane-lut1d-c=
tm3x4-lut1d@pipe-d-plane-3.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/16990">i915#16990</a>) +31 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-b-plane-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg1-14/igt@kms_color_pipeline@plane-lut1d-l=
ut1d@pipe-b-plane-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/16990">i915#16990</a>) +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms-hdcp14:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-rkl-6/igt@kms_content_protection@atomic-dpm=
s-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/15865">i915#15865</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg2-6/igt@kms_content_protection@content-ty=
pe-change.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/15865">i915#15865</a>) +2 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-mtlp-6/igt@kms_content_protection@content-t=
ype-change.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/15865">i915#15865</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-rkl-7/igt@kms_content_protection@dp-mst-lic=
-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/15330">i915#15330</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/3116">i915#3116</a>)</li>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk11/igt@kms_content_protection@dp-mst-lic=
-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/17502">i915#17502</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk4/igt@kms_content_protection@dp-mst-type=
-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17502">i915#17502</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb5/igt@kms_content_protection@dp-mst-type=
-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17502">i915#17502</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-hdcp14:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg1-19/igt@kms_content_protection@dp-mst-ty=
pe-0-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/15330">i915#15330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-suspend-resume:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-rkl-5/igt@kms_content_protection@dp-mst-typ=
e-0-suspend-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/15330">i915#15330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg1-15/igt@kms_content_protection@dp-mst-ty=
pe-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/15330">i915#15330</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/3299">i915#3299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy-hdcp14:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk3/igt@kms_content_protection@legacy-hdcp=
14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17508">i915#17508</a>) +6 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-rkl-3/igt@kms_content_protection@legacy-hdc=
p14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/15865">i915#15865</a>) +4 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg1-18/igt@kms_content_protection@legacy-hd=
cp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/15865">i915#15865</a>) +3 other tests skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb7/igt@kms_content_protection@legacy-hdcp=
14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17508">i915#17508</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-tglu-3/igt@kms_content_protection@srm.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/15865">i915#15865</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@suspend-resume:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk11/igt@kms_content_protection@suspend-re=
sume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/17508">i915#17508</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk9/igt@kms_cursor_crc@cursor-offscreen-51=
2x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/17533">i915#17533</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-max-size:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk9/igt@kms_cursor_crc@cursor-offscreen-ma=
x-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17504">i915#17504</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x32:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-rkl-2/igt@kms_cursor_crc@cursor-onscreen-32=
x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3555">i915#3555</a>) +8 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg1-17/igt@kms_cursor_crc@cursor-onscreen-3=
2x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/3555">i915#3555</a>) +10 other tests skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb6/igt@kms_cursor_crc@cursor-onscreen-32x=
32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17504">i915#17504</a>) +8 other tests skip</li>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk11/igt@kms_cursor_crc@cursor-onscreen-32=
x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17504">i915#17504</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-mtlp-3/igt@kms_cursor_crc@cursor-onscreen-5=
12x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/13049">i915#13049</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/3359">i915#3359</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-128x42:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9180/shard-rkl-2/igt@kms_cursor_crc@cursor-random-128x42.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/sha=
rd-rkl-6/igt@kms_cursor_crc@cursor-random-128x42.html">FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9180/shard-tglu-2/igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-=
a-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_16112/shard-tglu-10/igt@kms_cursor_crc@cursor-random-128x42@pipe-a-=
hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/13566">i915#13566</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-rkl-7/igt@kms_cursor_crc@cursor-random-256x=
85@pipe-a-hdmi-a-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/13566">i915#13566</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg2-7/igt@kms_cursor_crc@cursor-random-512x=
512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/13049">i915#13049</a>) +2 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-rkl-4/igt@kms_cursor_crc@cursor-random-512x=
512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/13049">i915#13049</a>) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg1-17/igt@kms_cursor_crc@cursor-random-512=
x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/13049">i915#13049</a>) +5 other tests skip</li>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk11/igt@kms_cursor_crc@cursor-random-512x=
512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17533">i915#17533</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb1/igt@kms_cursor_crc@cursor-rapid-moveme=
nt-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/17533">i915#17533</a>) +4 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-tglu-7/igt@kms_cursor_crc@cursor-rapid-move=
ment-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/13049">i915#13049</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-64x21:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-mtlp-1/igt@kms_cursor_crc@cursor-rapid-move=
ment-64x21.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/8814">i915#8814</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x10:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg2-4/igt@kms_cursor_crc@cursor-sliding-32x=
10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3555">i915#3555</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-rkl-2/igt@kms_cursor_legacy@basic-busy-flip=
-before-cursor-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) +2 other tests ski=
p</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg1-16/igt@kms_cursor_legacy@basic-busy-fli=
p-before-cursor-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) +1 other test ski=
p</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb4/igt@kms_cursor_legacy@basic-busy-flip-=
before-cursor-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/17457">i915#17457</a>) +2 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-mtlp-3/igt@kms_cursor_legacy@cursorb-vs-fli=
pa-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/17428">i915#17428</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/9809">i915#9809</a>) +1 other test skip</=
li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg2-3/igt@kms_cursor_legacy@cursorb-vs-flip=
a-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/13046">i915#13046</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/17454">i915#17454</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg2-3/igt@kms_cursor_legacy@modeset-atomic-=
cursor-hotspot.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/9067">i915#9067</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-rkl-2/igt@kms_cursor_legacy@modeset-atomic-=
cursor-hotspot.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/9067">i915#9067</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg1-15/igt@kms_cursor_legacy@modeset-atomic=
-cursor-hotspot.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/9067">i915#9067</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-tglu-9/igt@kms_cursor_legacy@modeset-atomic=
-cursor-hotspot.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/9067">i915#9067</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-mtlp-1/igt@kms_cursor_legacy@modeset-atomic=
-cursor-hotspot.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/9067">i915#9067</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:<=
/p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk9/igt@kms_cursor_legacy@short-busy-flip-=
before-cursor-atomic-transitions.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/17457">i915#17457</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-v=
arying-size:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg2-6/igt@kms_cursor_legacy@short-busy-flip=
-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk11/igt@kms_cursor_legacy@short-busy-flip=
-before-cursor-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/17457">i915#17457</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk11/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17515">i915#17515</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb6/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17515">i915#17515</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk3/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/17515">i915#17515</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-rkl-8/igt@kms_dither@fb-8bpc-vs-panel-6bpc.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-rkl-8/igt@kms_dither@fb-8bpc-vs-panel-6bpc@=
pipe-a-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-8bpc:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb4/igt@kms_dither@fb-8bpc-vs-panel-8bpc.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/17486">i915#17486</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev@basic:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-tglu-4/igt@kms_dp_aux_dev@basic.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/125=
7">i915#1257</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst-direct-train:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-tglu-3/igt@kms_dp_link_training@non-uhbr-ms=
t-direct-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/17287">i915#17287</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-mtlp-7/igt@kms_dp_link_training@non-uhbr-ms=
t-direct-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/17287">i915#17287</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg2-3/igt@kms_dp_link_training@non-uhbr-mst=
-direct-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/17287">i915#17287</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-rkl-7/igt@kms_dp_link_training@non-uhbr-mst=
-direct-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/17287">i915#17287</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk5/igt@kms_dp_link_training@non-uhbr-sst-=
tbtalt-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/17531">i915#17531</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb6/igt@kms_dp_link_training@non-uhbr-sst-=
tbtalt-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/17531">i915#17531</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst-direct-train:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk3/igt@kms_dp_link_training@uhbr-mst-dire=
ct-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/17477">i915#17477</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg2-6/igt@kms_dp_link_training@uhbr-mst-dir=
ect-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/17285">i915#17285</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-rkl-3/igt@kms_dp_link_training@uhbr-mst-dir=
ect-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/17285">i915#17285</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb7/igt@kms_dp_link_training@uhbr-mst-dire=
ct-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/17477">i915#17477</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst-tbtalt-train:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk10/igt@kms_dp_link_training@uhbr-mst-tbt=
alt-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/17477">i915#17477</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg1-19/igt@kms_dp_link_training@uhbr-sst.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/13748">i915#13748</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst-tbtalt-train:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg1-14/igt@kms_dp_link_training@uhbr-sst-tb=
talt-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/17285">i915#17285</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk4/igt@kms_dp_linktrain_fallback@dp-fallb=
ack.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17625">i915#17625</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-rkl-6/igt@kms_dp_linktrain_fallback@dp-fall=
back.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/16867">i915#16867</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb5/igt@kms_dp_linktrain_fallback@dp-fallb=
ack.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17625">i915#17625</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-tglu-4/igt@kms_dp_linktrain_fallback@uhbr-t=
o-hbr-fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/16870">i915#16870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg1-17/igt@kms_draw_crc@draw-method-mmap-gt=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/8812">i915#8812</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-mtlp-4/igt@kms_draw_crc@draw-method-mmap-gt=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/8812">i915#8812</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg2-7/igt@kms_draw_crc@draw-method-mmap-gtt=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/8812">i915#8812</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic-bigjoiner:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk11/igt@kms_dsc@dsc-basic-bigjoiner.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/17458">i915#17458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg1-14/igt@kms_dsc@dsc-fractional-bpp.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/16361">i915#16361</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-ultrajoiner:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk4/igt@kms_dsc@dsc-fractional-bpp-ultrajo=
iner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/17458">i915#17458</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-bigjoiner:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb7/igt@kms_dsc@dsc-with-bpc-bigjoiner.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17458">i915#17458</a>) +6 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-tglu-3/igt@kms_dsc@dsc-with-bpc-bigjoiner.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/16361">i915#16361</a>) +4 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-mtlp-7/igt@kms_dsc@dsc-with-bpc-bigjoiner.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/16361">i915#16361</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg2-6/igt@kms_dsc@dsc-with-bpc-formats.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/16361">i915#16361</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-ultrajoiner:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk10/igt@kms_dsc@dsc-with-output-formats-u=
ltrajoiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/17458">i915#17458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-rkl-3/igt@kms_dsc@dsc-with-output-formats-w=
ith-bpc-bigjoiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/16361">i915#16361</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb4/igt@kms_fbcon_fbt@psr.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17516">i=
915#17516</a>)</li>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk11/igt@kms_fbcon_fbt@psr.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17516">=
i915#17516</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-rkl-4/igt@kms_fbcon_fbt@psr-suspend.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/16680">i915#16680</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-tglu-2/igt@kms_fbcon_fbt@psr-suspend.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/16680">i915#16680</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk5/igt@kms_fbcon_fbt@psr-suspend.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
17516">i915#17516</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb7/igt@kms_feature_discovery@chamelium.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17581">i915#17581</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-tglu-4/igt@kms_feature_discovery@chamelium.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/2065">i915#2065</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk3/igt@kms_feature_discovery@chamelium.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17581">i915#17581</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-tglu-7/igt@kms_feature_discovery@display-3x=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/16081">i915#16081</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb1/igt@kms_feature_discovery@psr1.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17707">i915#17707</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk3/igt@kms_feature_discovery@psr1.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17707">i915#17707</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-rkl-3/igt@kms_feature_discovery@psr1.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/658">i915#658</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg1-16/igt@kms_feature_discovery@psr1.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@vrr:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk11/igt@kms_feature_discovery@vrr.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17539">i915#17539</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-rkl-4/igt@kms_feature_discovery@vrr.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/16600">i915#16600</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fence_pin_leak:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg2-7/igt@kms_fence_pin_leak.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4881">=
i915#4881</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg1-17/igt@kms_fence_pin_leak.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4881"=
>i915#4881</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-tglu-7/igt@kms_flip@2x-flip-vs-absolute-wf_=
vblank.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/3637">i915#3637</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +7 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-mtlp-2/igt@kms_flip@2x-flip-vs-absolute-wf_=
vblank.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/3637">i915#3637</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg1-15/igt@kms_flip@2x-flip-vs-fences.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/8381">i915#8381</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk1/igt@kms_flip@2x-flip-vs-suspend.html">=
INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/12745">i915#12745</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/13356">i915#13356</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/17183">i915#17183</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839">i915#4839</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113"=
>i915#6113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@ac-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk1/igt@kms_flip@2x-flip-vs-suspend@ac-hdm=
i-a1-hdmi-a2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/12745">i915#12745</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17183">i915#171=
83</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg2-3/igt@kms_flip@2x-flip-vs-wf_vblank-int=
erruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/9934">i915#9934</a>) +3 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-rkl-4/igt@kms_flip@2x-flip-vs-wf_vblank-int=
erruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/9934">i915#9934</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg1-19/igt@kms_flip@2x-plain-flip-fb-recrea=
te-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/9934">i915#9934</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:=
</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-rkl-6/igt@kms_flip@2x-single-buffer-flip-vs=
-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk5/igt@kms_flip@flip-vs-suspend-interrupt=
ible.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/12314">i915#12314</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17183">i=
915#17183</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/4839">i915#4839</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/6113">i915#6113</a>)</li>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9180/shard-rkl-2/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/=
shard-rkl-3/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16276"=
>i915#16276</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/6113">i915#6113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk5/igt@kms_flip@flip-vs-suspend-interrupt=
ible@a-hdmi-a1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/12314">i915#12314</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13=
356</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/17183">i915#17183</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-rkl-3/igt@kms_flip@flip-vs-suspend-interrup=
tible@a-hdmi-a2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/16276">i915#16276</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/6113">i915#6113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-mtlp-1/igt@kms_flip_scaled_crc@flip-32bpp-x=
tile-to-64bpp-xtile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8=
810">i915#8810</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/8813">i915#8813</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb1/igt@kms_flip_scaled_crc@flip-32bpp-yti=
le-to-32bpp-ytileccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/17593">i915#17593</a>) +10 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downsc=
aling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg2-3/igt@kms_flip_scaled_crc@flip-32bpp-yt=
ile-to-32bpp-ytilegen12rcccs-downscaling.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915=
#5190</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk4/igt@kms_flip_scaled_crc@flip-32bpp-yti=
le-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/17493">i915#17493</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-tglu-10/igt@kms_flip_scaled_crc@flip-64bpp-=
4tile-to-16bpp-4tile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +3 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-rkl-5/igt@kms_flip_scaled_crc@flip-64bpp-4t=
ile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +3 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-64bpp-4=
tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +2 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk6/igt@kms_flip_scaled_crc@flip-64bpp-lin=
ear-to-32bpp-linear-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/17522">i915#17522</a>) +3 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg1-17/igt@kms_flip_scaled_crc@flip-64bpp-y=
ftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +4 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk11/igt@kms_flip_scaled_crc@flip-64bpp-yf=
tile-to-16bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/17484">i915#17484</a>) +2 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk8/igt@kms_flip_scaled_crc@flip-64bpp-yft=
ile-to-32bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/17484">i915#17484</a>) +2 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk11/igt@kms_flip_scaled_crc@flip-64bpp-yt=
ile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/17493">i915#17493</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-tglu-9/igt@kms_force_connector_basic@force-=
load-detect.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/17452">i915#17452</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9180/shard-mtlp-4/igt@kms_force_connector_basic@prune-stale-modes.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
16112/shard-mtlp-1/igt@kms_force_connector_basic@prune-stale-modes.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
15672">i915#15672</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-2p-p=
rimscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +22=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-2p-p=
rimscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>)=
 +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg1-15/igt@kms_frontbuffer_tracking@fbc-2p-=
scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) +103 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-mtlp-4/igt@kms_frontbuffer_tracking@fbc-2p-=
scndscrn-pri-indfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/18=
25">i915#1825</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-gtt:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb1/igt@kms_frontbuffer_tracking@fbc-rgb56=
5-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/17588">i915#17588</a>) +145 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbc-rgb=
565-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +3 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk11/igt@kms_frontbuffer_tracking@fbc-tili=
ng-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/17559">i915#17559</a>) +1 other test skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb7/igt@kms_frontbuffer_tracking@fbc-tilin=
g-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17559">i915#17559</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-tglu-4/igt@kms_frontbuffer_tracking@fbc-til=
ing-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/5439">i915#5439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-pwrite:</=
p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-tglu-7/igt@kms_frontbuffer_tracking@fbchdr-=
1p-primscrn-cur-indfb-draw-pwrite.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +25 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-rkl-2/igt@kms_frontbuffer_tracking@fbchdr-1=
p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +28 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk3/igt@kms_frontbuffer_tracking@fbchdr-2p=
-primscrn-spr-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/17517">i915#17517</a>) +57 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg2-5/igt@kms_frontbuffer_tracking@fbchdr-r=
gb101010-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/15989">i915#15989</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-tiling-y:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9180/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-tiling-y.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1611=
2/shard-rkl-3/igt@kms_frontbuffer_tracking@fbchdr-tiling-y.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i=
915#15989</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt:=
</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-2=
p-primscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825=
</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-gtt:=
</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2=
p-scndscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#174=
28</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/1825">i915#1825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-mmap-=
gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg2-5/igt@kms_frontbuffer_tracking@fbcpsrhd=
r-1p-offscreen-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +18 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-shrfb-draw-mmap-c=
pu:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg1-19/igt@kms_frontbuffer_tracking@fbcpsrh=
dr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +50 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-mmap-g=
tt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhd=
r-1p-primscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#1=
5102</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-cur-indfb-draw-mmap-g=
tt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg1-19/igt@kms_frontbuffer_tracking@fbcpsrh=
dr-2p-primscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +31 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb565-draw-render:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg2-5/igt@kms_frontbuffer_tracking@fbcpsrhd=
r-rgb565-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +18 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg1-14/igt@kms_frontbuffer_tracking@fbcpsrh=
dr-tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/5439">i915#5439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb1/igt@kms_frontbuffer_tracking@fbcpsrhdr=
-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/17609">i915#17609</a>) +1 other test skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsrhd=
r-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/10055">i915#10055</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg1-14/igt@kms_frontbuffer_tracking@hdr-1p-=
offscreen-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +27 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-shrfb-draw-mmap-gtt:</=
p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-mtlp-5/igt@kms_frontbuffer_tracking@hdr-1p-=
offscreen-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +7 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-indfb-draw-pwrite:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk11/igt@kms_frontbuffer_tracking@hdr-1p-p=
rimscrn-pri-indfb-draw-pwrite.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/17517">i915#17517</a>) +6 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb7/igt@kms_frontbuffer_tracking@hdr-2p-pr=
imscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/17517">i915#17517</a>) +36 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg2-6/igt@kms_frontbuffer_tracking@hdr-2p-p=
rimscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a>) +24 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9180/shard-glk8/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-cur-indfb=
-draw-render.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_16112/shard-glk9/igt@kms_frontbuffer_tracking@hdr-2p-scnds=
crn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/17517">i915#17517</a>) +6 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-rkl-6/igt@kms_frontbuffer_tracking@hdr-2p-s=
cndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a=
>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-indfb-scaledprimary:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb6/igt@kms_frontbuffer_tracking@hdr-indfb=
-scaledprimary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/17606">i915#17606</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-suspend:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk10/igt@kms_frontbuffer_tracking@hdr-susp=
end.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/13356">i915#13356</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/16056">i915#16056</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/16593">i915#16593</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-rkl-8/igt@kms_frontbuffer_tracking@pipe-fbc=
-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/9766">i915#9766</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-gtt:</=
p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-1p-o=
ffscreen-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +66 other t=
ests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg1-17/igt@kms_frontbuffer_tracking@psr-1p-=
offscreen-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15104">i915#15104</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#159=
90</a>) +2 other tests skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-1p-o=
ffscreen-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15104">i915#15104</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-pwrite:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk10/igt@kms_frontbuffer_tracking@psr-1p-o=
ffscreen-pri-shrfb-draw-pwrite.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/17482">i915#17482</a>) +18 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk9/igt@kms_frontbuffer_tracking@psr-1p-pr=
i-indfb-multidraw.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/17482">i915#17482</a>) +141 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg1-15/igt@kms_frontbuffer_tracking@psr-1p-=
primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>=
) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-tglu-10/igt@kms_frontbuffer_tracking@psr-1p=
-primscrn-spr-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +54 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-tglu-7/igt@kms_frontbuffer_tracking@psr-2p-=
scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) +97 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-suspend:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9180/shard-mtlp-7/igt@kms_frontbuffer_tracking@psr-suspend.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/s=
hard-mtlp-8/igt@kms_frontbuffer_tracking@psr-suspend.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17276">i915#17=
276</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-indfb-draw-render:</=
p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-mtlp-8/igt@kms_frontbuffer_tracking@psrhdr-=
1p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +22 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-shrfb-draw-render:</=
p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk11/igt@kms_frontbuffer_tracking@psrhdr-1=
p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/17482">i915#17482</a>) +48 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb1/igt@kms_frontbuffer_tracking@psrhdr-1p=
-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/17482">i915#17482</a>) +70 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-pri-indfb-draw-pwrite:</=
p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-mtlp-4/igt@kms_frontbuffer_tracking@psrhdr-=
2p-primscrn-pri-indfb-draw-pwrite.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#174=
28</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-rkl-2/igt@kms_frontbuffer_tracking@psrhdr-2=
p-scndscrn-cur-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) +104 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-nv12:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb7/igt@kms_getfb@getfb-reject-nv12.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/17636">i915#17636</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb2-accept-nv12:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb6/igt@kms_getfb@getfb2-accept-nv12.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/17658">i915#17658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_audio_bw@audio-bw-hblank160:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb7/igt@kms_hdmi_audio_bw@audio-bw-hblank1=
60.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17104">i915#17104</a>)</li>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk11/igt@kms_hdmi_audio_bw@audio-bw-hblank=
160.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17102">i915#17102</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg1-18/igt@kms_hdr@bpc-switch.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555"=
>i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-dpms:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk8/igt@kms_hdr@bpc-switch-dpms.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17=
498">i915#17498</a>) +1 other test skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb4/igt@kms_hdr@bpc-switch-dpms.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17=
498">i915#17498</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-tglu-4/igt@kms_hdr@bpc-switch-suspend.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/8228">i915#8228</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-rkl-8/igt@kms_hdr@static-swap.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16644=
">i915#16644</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/8228">i915#8228</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk10/igt@kms_hdr@static-toggle.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/174=
98">i915#17498</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg2-8/igt@kms_hdr@static-toggle-suspend.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/16518">i915#16518</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-rkl-6/igt@kms_hdr@static-toggle-suspend.htm=
l">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/15436">i915#15436</a>) +1 other test incomplete</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-mtlp-7/igt@kms_hdr@static-toggle-suspend.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/12713">i915#12713</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/16490">i915#16490</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>) +1=
 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk2/igt@kms_joiner@basic-force-big-joiner.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/17678">i915#17678</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg1-18/igt@kms_joiner@basic-force-ultra-joi=
ner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/15458">i915#15458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk11/igt@kms_joiner@basic-max-non-joiner.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/17575">i915#17575</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg2-6/igt@kms_joiner@basic-max-non-joiner.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/13688">i915#13688</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-rkl-7/igt@kms_joiner@basic-max-non-joiner.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/13688">i915#13688</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg1-17/igt@kms_joiner@basic-max-non-joiner.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/13688">i915#13688</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb4/igt@kms_joiner@basic-max-non-joiner.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17575">i915#17575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk4/igt@kms_joiner@basic-ultra-joiner.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/17567">i915#17567</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-rkl-5/igt@kms_joiner@invalid-modeset-force-=
big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/15459">i915#15459</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb6/igt@kms_joiner@invalid-modeset-force-u=
ltra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/17567">i915#17567</a>) +1 other test skip</li>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk11/igt@kms_joiner@invalid-modeset-force-=
ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/17567">i915#17567</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-tglu-2/igt@kms_joiner@invalid-modeset-ultra=
-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/15458">i915#15458</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_mst@mst-suspend-read-crc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg1-16/igt@kms_mst@mst-suspend-read-crc.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/16451">i915#16451</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk10/igt@kms_multipipe_modeset@basic-max-p=
ipe-crc-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/17701">i915#17701</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-rkl-1/igt@kms_multipipe_modeset@basic-max-p=
ipe-crc-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/15815">i915#15815</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-rkl-8/igt@kms_panel_fitting@atomic-fastset.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/6301">i915#6301</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg1-19/igt@kms_panel_fitting@atomic-fastset=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/6301">i915#6301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb4/igt@kms_panel_fitting@legacy.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
7577">i915#17577</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk5/igt@kms_panel_fitting@legacy.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
7577">i915#17577</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-rkl-3/igt@kms_pipe_b_c_ivb@from-pipe-c-to-b=
-with-3-lanes.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/17455">i915#17455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb1/igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-m=
odeset-pipe-c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/17540">i915#17540</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9180/shard-rkl-8/igt@kms_pipe_crc_basic@suspend-read-crc.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/sha=
rd-rkl-3/igt@kms_pipe_crc_basic@suspend-read-crc.html">INCOMPLETE</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12756">i915#=
12756</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/13476">i915#13476</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-rkl-3/igt@kms_pipe_crc_basic@suspend-read-c=
rc@pipe-a-hdmi-a-2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/13476">i915#13476</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-4tiled:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk11/igt@kms_pipe_stress@stress-xrgb8888-4=
tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/17601">i915#17601</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg1-17/igt@kms_pipe_stress@stress-xrgb8888-=
4tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/14712">i915#14712</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb7/igt@kms_pipe_stress@stress-xrgb8888-4t=
iled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/17601">i915#17601</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk11/igt@kms_plane@pixel-format-4-tiled-bm=
g-ccs-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/17479">i915#17479</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk3/igt@kms_plane@pixel-format-4-tiled-dg2=
-mc-ccs-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/17479">i915#17479</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping:<=
/p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-tglu-9/igt@kms_plane@pixel-format-4-tiled-d=
g2-mc-ccs-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +3 other =
tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-mtlp-1/igt@kms_plane@pixel-format-4-tiled-d=
g2-mc-ccs-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +3 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier@pipe-a-plane-5:</=
p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg2-6/igt@kms_plane@pixel-format-4-tiled-dg=
2-mc-ccs-modifier@pipe-a-plane-5.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/16386">i915#16386</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-rkl-4/igt@kms_plane@pixel-format-4-tiled-ln=
l-ccs-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +9 other test=
s skip</li>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk10/igt@kms_plane@pixel-format-4-tiled-ln=
l-ccs-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/17479">i915#17479</a>) +2 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping:<=
/p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-mt=
l-mc-ccs-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#157=
09</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clampin=
g:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg2-7/igt@kms_plane@pixel-format-4-tiled-mt=
l-rc-ccs-cc-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-2:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb5/igt@kms_plane@pixel-format-x-tiled-mod=
ifier@pipe-b-plane-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/17494">i915#17494</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-4:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk3/igt@kms_plane@pixel-format-x-tiled-mod=
ifier@pipe-b-plane-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/17494">i915#17494</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-5:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-rkl-6/igt@kms_plane@pixel-format-x-tiled-mo=
difier@pipe-b-plane-5.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/16386">i915#16386</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-a-plane-7:=
</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-tglu-9/igt@kms_plane@pixel-format-y-tiled-g=
en12-rc-ccs-modifier@pipe-a-plane-7.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/16386">i915#16386</a>) +1 other=
 test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier@pipe-b-plane-4:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk11/igt@kms_plane@pixel-format-y-tiled-mo=
difier@pipe-b-plane-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/17494">i915#17494</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg1-16/igt@kms_plane@pixel-format-yf-tiled-=
ccs-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +6 other tests =
skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb1/igt@kms_plane@pixel-format-yf-tiled-cc=
s-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/17479">i915#17479</a>) +11 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk11/igt@kms_plane@planar-pixel-format-set=
tings@nv12-tile4-src-y.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/17700">i915#17700</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-basic:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb1/igt@kms_plane_alpha_blend@alpha-basic.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/17595">i915#17595</a>) +1 other test skip</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk9/igt@kms_plane_alpha_blend@alpha-basic.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/12178">i915#12178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-basic@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk9/igt@kms_plane_alpha_blend@alpha-basic@=
pipe-a-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/7862">i915#7862</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-transparent-fb:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk11/igt@kms_plane_alpha_blend@alpha-trans=
parent-fb.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/10647">i915#10647</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/12177">i915#12177</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk11/igt@kms_plane_alpha_blend@alpha-trans=
parent-fb@pipe-a-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/10647">i915#10647</a>) +1 other test fail=
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg2-4/igt@kms_plane_lowres@tiling-yf.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/8821">i915#8821</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-rkl-6/igt@kms_plane_lowres@tiling-yf.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb5/igt@kms_plane_lowres@tiling-yf.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17509">i915#17509</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-tglu-3/igt@kms_plane_multiple@2x-tiling-non=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/13958">i915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg1-18/igt@kms_plane_multiple@2x-tiling-yf.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/13958">i915#13958</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb7/igt@kms_plane_multiple@2x-tiling-yf.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17586">i915#17586</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg2-6/igt@kms_plane_multiple@2x-tiling-yf.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/13958">i915#13958</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-rkl-3/igt@kms_plane_multiple@2x-tiling-yf.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/13958">i915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg1-17/igt@kms_plane_multiple@tiling-yf.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/14259">i915#14259</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-tglu-2/igt@kms_plane_scaling@2x-scaler-mult=
i-pipe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17428">i915#17428</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/17454">i915#17454</a>) +2 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-rkl-7/igt@kms_plane_scaling@intel-max-src-s=
ize.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/6953">i915#6953</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-parameters:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb5/igt@kms_plane_scaling@invalid-paramete=
rs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17626">i915#17626</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb7/igt@kms_plane_scaling@plane-downscale-=
factor-0-5-with-pixel-format.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/17528">i915#17528</a>) +17 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-b:</=
p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk10/igt@kms_plane_scaling@plane-downscale=
-factor-0-5-with-rotation@pipe-b.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/17529">i915#17529</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c:</=
p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk10/igt@kms_plane_scaling@plane-downscale=
-factor-0-5-with-rotation@pipe-c.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/17528">i915#17528</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b:</=
p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk4/igt@kms_plane_scaling@plane-scaler-uni=
ty-scaling-with-rotation@pipe-b.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/17529">i915#17529</a>) +3 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg1-16/igt@kms_plane_scaling@plane-scaler-w=
ith-clipping-clamping-rotation.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-rotation:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk3/igt@kms_plane_scaling@plane-upscale-20=
x20-with-rotation.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/17528">i915#17528</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb5/igt@kms_plane_scaling@plane-upscale-20=
x20-with-rotation@pipe-a.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/17529">i915#17529</a>) +8 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-b:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb5/igt@kms_plane_scaling@plane-upscale-20=
x20-with-rotation@pipe-b.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/17528">i915#17528</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/17529">i915#17529</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg1-14/igt@kms_plane_scaling@plane-upscale-=
factor-0-25-with-rotation@pipe-d.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +13 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-rkl-4/igt@kms_pm_backlight@fade.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/123=
43">i915#12343</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk4/igt@kms_pm_backlight@fade-with-suspend=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17462">i915#17462</a>) +2 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-tglu-10/igt@kms_pm_backlight@fade-with-susp=
end.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/12343">i915#12343</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/9812">i915#9812</a>)</li>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9180/shard-mtlp-2/igt@kms_pm_backlight@fade-with-suspend.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/sha=
rd-mtlp-8/igt@kms_pm_backlight@fade-with-suspend.html">INCOMPLETE</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17032">i915#=
17032</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms-negative:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb1/igt@kms_pm_dc@dc5-dpms-negative.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/17602">i915#17602</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-pageflip-negative:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-rkl-8/igt@kms_pm_dc@dc5-pageflip-negative.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/9685">i915#9685</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg1-19/igt@kms_pm_dc@dc5-pageflip-negative.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/9685">i915#9685</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-rkl-3/igt@kms_pm_dc@dc5-retention-flops.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/3828">i915#3828</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk3/igt@kms_pm_dc@dc5-retention-flops.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/17553">i915#17553</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-tglu-9/igt@kms_pm_dc@dc6-psr.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15948"=
>i915#15948</a>)</li>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk10/igt@kms_pm_dc@dc6-psr.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17564">=
i915#17564</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk11/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1770=
2">i915#17702</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg2-6/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340=
">i915#9340</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-rkl-7/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340=
">i915#9340</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg1-17/igt@kms_pm_lpsp@kms-lpsp.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/934=
0">i915#9340</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb4/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17618=
">i915#17618</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@screens-disabled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg2-3/igt@kms_pm_lpsp@screens-disabled.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/8430">i915#8430</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-rkl-7/igt@kms_pm_lpsp@screens-disabled.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/8430">i915#8430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9180/shard-dg2-6/igt@kms_pm_rpm@dpms-non-lpsp.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg2-4/ig=
t@kms_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@fences:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb6/igt@kms_pm_rpm@fences.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17473">i=
915#17473</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk9/igt@kms_pm_rpm@modeset-lpsp.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15=
073">i915#15073</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9180/shard-rkl-8/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/=
shard-rkl-6/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#=
14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/15073">i915#15073</a>)</li>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9180/shard-dg1-14/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112=
/shard-dg1-18/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i91=
5#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-rkl-5/igt@kms_pm_rpm@modeset-non-lpsp-stres=
s-no-wait.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/15073">i915#15073</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg1-14/igt@kms_pm_rpm@modeset-non-lpsp-stre=
ss-no-wait.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-pc8-residency-stress:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk11/igt@kms_pm_rpm@modeset-pc8-residency-=
stress.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17709">i915#17709</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@pc8-residency:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg1-15/igt@kms_pm_rpm@pc8-residency.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17434">i915#17434</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/17450">i915#17450</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-idle:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9180/shard-dg2-8/igt@kms_pm_rpm@system-suspend-idle.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg=
2-5/igt@kms_pm_rpm@system-suspend-idle.html">INCOMPLETE</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14419">i915#14419</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc-hybrid:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg2-6/igt@kms_prime@basic-crc-hybrid.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/6524">i915#6524</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/6805">i915#6805</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-rkl-6/igt@kms_prime@basic-crc-hybrid.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/6524">i915#6524</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg1-16/igt@kms_prime@basic-crc-hybrid.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/6524">i915#6524</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb5/igt@kms_prime@basic-crc-hybrid.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17569">i915#17569</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-tglu-10/igt@kms_prime@basic-crc-hybrid.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/6524">i915#6524</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-mtlp-8/igt@kms_prime@basic-crc-hybrid.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/6524">i915#6524</a>) +1 other test skip</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk4/igt@kms_prime@basic-crc-hybrid.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17569">i915#17569</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prime@d3hot:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk11/igt@kms_prime@d3hot.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17569">i9=
15#17569</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_properties@colorop-properties-atomic:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb6/igt@kms_properties@colorop-properties-=
atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/17481">i915#17481</a>)</li>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk11/igt@kms_properties@colorop-properties=
-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/17481">i915#17481</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg2-7/igt@kms_psr2_sf@fbc-pr-cursor-plane-m=
ove-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +5 other test=
s skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-rkl-3/igt@kms_psr2_sf@fbc-pr-cursor-plane-m=
ove-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +13 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk10/igt@kms_psr2_sf@fbc-pr-cursor-plane-m=
ove-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +2 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb5/igt@kms_psr2_sf@fbc-pr-cursor-plane-mo=
ve-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/11520">i915#11520</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk3/igt@kms_psr2_sf@fbc-pr-overlay-plane-u=
pdate-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/11520">i915#11520</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pi=
pe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-mtlp-6/igt@kms_psr2_sf@fbc-psr2-cursor-plan=
e-move-continuous-exceed-fully-sf@pipe-a-edp-1.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9808">i915#9808</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-mtlp-3/igt@kms_psr2_sf@pr-cursor-plane-move=
-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/12316">i915#12316</a>) +5 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-tglu-4/igt@kms_psr2_sf@pr-overlay-plane-mov=
e-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +12 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-rkl-6/igt@kms_psr2_sf@psr2-cursor-plane-mov=
e-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/11520">i915#11520</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +1 other tes=
t skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk11/igt@kms_psr2_sf@psr2-overlay-plane-mo=
ve-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +2 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg1-19/igt@kms_psr2_sf@psr2-primary-plane-u=
pdate-sf-dmg-area-big-fb.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +11 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-rkl-3/igt@kms_psr2_su@page_flip-nv12.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/9683">i915#9683</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk4/igt@kms_psr2_su@page_flip-xrgb8888.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17546">i915#17546</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-blt:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk11/igt@kms_psr@fbc-pr-cursor-blt.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17480">i915#17480</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-dpms:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk3/igt@kms_psr@fbc-pr-dpms.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17480"=
>i915#17480</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-render:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb5/igt@kms_psr@fbc-pr-sprite-render.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/17480">i915#17480</a>) +22 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg1-16/igt@kms_psr@fbc-pr-sprite-render.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/9732">i915#9732</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-no-drrs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-tglu-4/igt@kms_psr@fbc-psr-no-drrs.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
9732">i915#9732</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg2-5/igt@kms_psr@fbc-psr-primary-blt.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/9732">i915#9732</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-onoff:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-mtlp-5/igt@kms_psr@fbc-psr2-cursor-plane-on=
off.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/9688">i915#9688</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk10/igt@kms_psr@fbc-psr2-primary-render.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/17480">i915#17480</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk11/igt@kms_psr@psr-primary-page-flip.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17480">i915#17480</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/9732">i915#9732</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-mmap-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-rkl-6/igt@kms_psr@psr-sprite-mmap-gtt.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +3 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-mmap-gtt@edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-mtlp-7/igt@kms_psr@psr-sprite-mmap-gtt@edp-=
1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/4077">i915#4077</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/9688">i915#9688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-rkl-8/igt@kms_psr@psr-sprite-plane-onoff.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/9732">i915#9732</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@exhaust-fences:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb1/igt@kms_rotation_crc@exhaust-fences.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17676">i915#17676</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb5/igt@kms_rotation_crc@multiplane-rotati=
on.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17634">i915#17634</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk9/igt@kms_rotation_crc@multiplane-rotati=
on-cropping-bottom.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/15500">i915#15500</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/16184">i915#16184</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation-cropping-top:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk4/igt@kms_rotation_crc@multiplane-rotati=
on-cropping-top.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/15492">i915#15492</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/16184">i915#16184</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk8/igt@kms_rotation_crc@primary-4-tiled-r=
eflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/17488">i915#17488</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk10/igt@kms_rotation_crc@primary-4-tiled-=
reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/17488">i915#17488</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb7/igt@kms_rotation_crc@primary-rotation-=
90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17488">i915#17488</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk11/igt@kms_rotation_crc@primary-y-tiled-=
reflect-x-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/17488">i915#17488</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg2-3/igt@kms_rotation_crc@primary-y-tiled-=
reflect-x-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/12755">i915#12755</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/15867">i915#15867</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-tglu-9/igt@kms_rotation_crc@primary-yf-tile=
d-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/17432">i915#17432</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>) +1 other test =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-mtlp-7/igt@kms_rotation_crc@primary-yf-tile=
d-reflect-x-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/15867">i915#15867</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb7/igt@kms_scaling_modes@scaling-mode-non=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17501">i915#17501</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-tglu-4/igt@kms_scaling_modes@scaling-mode-n=
one.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3555">i915#3555</a>) +3 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-mtlp-6/igt@kms_scaling_modes@scaling-mode-n=
one.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/5030">i915#5030</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/9041">i915#9041</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk3/igt@kms_scaling_modes@scaling-mode-non=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17501">i915#17501</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-mtlp-6/igt@kms_scaling_modes@scaling-mode-n=
one@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/5030">i915#5030</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-mtlp-6/igt@kms_scaling_modes@scaling-mode-n=
one@pipe-d-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/5030">i915#5030</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/9041">i915#9041</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_framebuffer:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-tglu-2/igt@kms_selftest@drm_framebuffer.htm=
l">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/13179">i915#13179</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk11/igt@kms_setmode@invalid-clone-exclusi=
ve-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/17463">i915#17463</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-tglu-3/igt@kms_tiled_display@basic-test-pat=
tern.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/8623">i915#8623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-rkl-2/igt@kms_tiled_display@basic-test-patt=
ern-with-chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/8623">i915#8623</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg1-15/igt@kms_tiled_display@basic-test-pat=
tern-with-chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/8623">i915#8623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg1-18/igt@kms_tv_load_detect@load-detect.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/17445">i915#17445</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk6/igt@kms_vblank@ts-continuation-dpms-su=
spend@pipe-a-hdmi-a-1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/12276">i915#12276</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) =
+1 other test incomplete</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb4/igt@kms_vblank@ts-continuation-dpms-su=
spend@pipe-a-hdmi-a-1.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/15840">i915#15840</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17752">i915#17752</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-b-vga-1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb4/igt@kms_vblank@ts-continuation-dpms-su=
spend@pipe-b-vga-1.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/17752">i915#17752</a>) +2 other tests dmes=
g-warn</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9180/shard-mtlp-5/igt@kms_vblank@ts-continuation-suspend.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/sha=
rd-mtlp-2/igt@kms_vblank@ts-continuation-suspend.html">INCOMPLETE</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12276">i915#=
12276</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9180/shard-mtlp-5/igt@kms_vblank@ts-continuation-suspend@pipe-a-edp-1.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_16112/shard-mtlp-2/igt@kms_vblank@ts-continuation-suspend@pipe-a-edp-1.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/17209">i915#17209</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-rkl-7/igt@kms_vrr@flip-basic-fastset.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg2-6/igt@kms_vrr@flip-dpms.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243">=
i915#15243</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/3555">i915#3555</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-rkl-6/igt@kms_vrr@flip-dpms.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">=
i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/15243">i915#15243</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb5/igt@kms_vrr@flip-dpms.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17520">i=
915#17520</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-rkl-4/igt@kms_vrr@flip-suspend.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1524=
3">i915#15243</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk11/igt@kms_vrr@negative-basic.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17=
520">i915#17520</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk3/igt@kms_vrr@seamless-rr-switch-drrs.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17520">i915#17520</a>) +1 other test skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg2-4/igt@kms_vrr@seamless-rr-switch-drrs.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/9906">i915#9906</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-rkl-6/igt@kms_vrr@seamless-rr-switch-drrs.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/9906">i915#9906</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg1-18/igt@kms_vrr@seamless-rr-switch-drrs.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@gen12-group-exclusive-stream-ctx-handle:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk9/igt@perf@gen12-group-exclusive-stream-=
ctx-handle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/17536">i915#17536</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@gen8-unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-mtlp-1/igt@perf@gen8-unprivileged-single-ct=
x-counters.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/17455">i915#17455</a>) +1 other test skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg2-3/igt@perf@gen8-unprivileged-single-ctx=
-counters.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/2436">i915#2436</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-rkl-2/igt@perf@gen8-unprivileged-single-ctx=
-counters.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/2436">i915#2436</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@mi-rpc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg1-14/igt@perf@mi-rpc.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2434">i915#2=
434</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@non-zero-reason@0-rcs0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg2-8/igt@perf@non-zero-reason@0-rcs0.html"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/9100">i915#9100</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@perf@per-context-mode-unprivileged:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk11/igt@perf@per-context-mode-unprivilege=
d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17704">i915#17704</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb1/igt@perf@unprivileged-single-ctx-count=
ers.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17592">i915#17592</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-accuracy-50@bcs0:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb6/igt@perf_pmu@busy-accuracy-50@bcs0.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17651">i915#17651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@rcs0:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9180/shard-mtlp-8/igt@perf_pmu@busy-double-start@rcs0.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-=
mtlp-4/igt@perf_pmu@busy-double-start@rcs0.html">FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349">i915#4349</a>) +1 =
other test fail</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@enable-race@bcs0:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb6/igt@perf_pmu@enable-race@bcs0.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
17638">i915#17638</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-all-gts:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk11/igt@perf_pmu@rc6-all-gts.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1758=
3">i915#17583</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg1-17/igt@perf_pmu@rc6-all-gts.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/851=
6">i915#8516</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-rkl-6/igt@perf_pmu@rc6-suspend.html">INCOMP=
LETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/13520">i915#13520</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6@other-idle-gt0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk8/igt@perf_pmu@rc6@other-idle-gt0.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/17583">i915#17583</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@semaphore-busy@bcs0:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb1/igt@perf_pmu@semaphore-busy@bcs0.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/17683">i915#17683</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@semaphore-wait-idle@bcs0:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb1/igt@perf_pmu@semaphore-wait-idle@bcs0.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/17648">i915#17648</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@semaphore-wait-idle@vcs0:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb1/igt@perf_pmu@semaphore-wait-idle@vcs0.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/17637">i915#17637</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@prime_udl@share-import:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk5/igt@prime_udl@share-import.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/164=
20">i915#16420</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_udl@share-import-addfb:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-glk11/igt@prime_udl@share-import-addfb.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/16420">i915#16420</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg1-17/igt@prime_udl@share-import-addfb.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/16420">i915#16420</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg1-14/igt@prime_vgem@basic-fence-flip.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/3708">i915#3708</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-read:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-mtlp-2/igt@prime_vgem@basic-read.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/37=
08">i915#3708</a>) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-rkl-4/igt@prime_vgem@basic-read.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/174=
48">i915#17448</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/3291">i915#3291</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@coherency-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg1-16/igt@prime_vgem@coherency-gtt.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/3708">i915#3708</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/4077">i915#4077</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-flip-hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-dg2-8/igt@prime_vgem@fence-flip-hang.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3708">i915#3708</a>) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-rkl-7/igt@prime_vgem@fence-flip-hang.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/17448">i915#17448</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-read-hang:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-tglu-3/igt@prime_vgem@fence-read-hang.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/17448">i915#17448</a>)</li>
</ul>
</li>
<li>
<p>igt@sysfs_heartbeat_interval@mixed:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb6/igt@sysfs_heartbeat_interval@mixed.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/17642">i915#17642</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@sysfs_heartbeat_interval@mixed@bcs0:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb6/igt@sysfs_heartbeat_interval@mixed@bcs=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17643">i915#17643</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@sysfs_preempt_timeout@idempotent:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb6/igt@sysfs_preempt_timeout@idempotent.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/17631">i915#17631</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@sysfs_preempt_timeout@idempotent@bcs0:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-snb6/igt@sysfs_preempt_timeout@idempotent@b=
cs0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17632">i915#17632</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@tools_test@sysfs_l3_parity:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-rkl-8/igt@tools_test@sysfs_l3_parity.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/17447">i915#17447</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-mtlp-2/igt@tools_test@sysfs_l3_parity.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/4818">i915#4818</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9180/shard-dg2-4/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0=
-smem-lmem0.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/16348">i915#16348</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-dg2-3/igt=
@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html">PASS</a=
></li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9180/shard-rkl-1/igt@gem_ctx_isolation@preservation-s3.html">ABORT</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15131"=
>i915#15131</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_16112/shard-rkl-2/igt@gem_ctx_isolation@preservation-s3.html">PASS</a=
> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@gem_eio@kms:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9180/shard-rkl-5/igt@gem_eio@kms.html">DMESG-WARN</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13363">i915#13363</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard=
-rkl-4/igt@gem_eio@kms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@forcewake:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9180/shard-tglu-4/igt@i915_suspend@forcewake.html">ABORT</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15840">i915#158=
40</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_161=
12/shard-tglu-10/igt@i915_suspend@forcewake.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9180/shard-rkl-6/igt@kms_async_flips@async-flip-suspend-resume.html">I=
NCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/12761">i915#12761</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_16112/shard-rkl-8/igt@kms_async_flips@async-flip-suspend=
-resume.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9180/shard-mtlp-1/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1573=
3">i915#15733</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/5138">i915#5138</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_16112/shard-mtlp-5/igt@kms_big_fb@4-tiled-64bpp-rotat=
e-180.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9180/shard-mtlp-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-c=
c.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/15582">i915#15582</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_16112/shard-mtlp-8/igt@kms_ccs@crc-primary-susp=
end-4-tiled-mtl-rc-ccs-cc.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9180/shard-mtlp-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-c=
c@pipe-c-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/17158">i915#17158</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-mtlp-8/igt@kms_ccs@crc-prima=
ry-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-128x42:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9180/shard-tglu-9/igt@kms_cursor_crc@cursor-onscreen-128x42.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13=
566">i915#13566</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_16112/shard-tglu-3/igt@kms_cursor_crc@cursor-onscreen-128x42.html=
">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9180/shard-rkl-5/igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-=
a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/13566">i915#13566</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_16112/shard-rkl-5/igt@kms_cursor_crc@cursor-sliding=
-128x42@pipe-a-hdmi-a-1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9180/shard-mtlp-1/igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1.html"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/17157">i915#17157</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_16112/shard-mtlp-2/igt@kms_cursor_crc@cursor-suspend@pipe-a-=
edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9180/shard-rkl-7/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16276">i91=
5#16276</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/6113">i915#6113</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_16112/shard-rkl-7/igt@kms_flip@flip-vs-suspend.html">PASS</=
a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9180/shard-glk6/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-in=
dfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/17517">i915#17517</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk8/igt@kms_frontbuffer_tracking@=
fbchdr-1p-primscrn-cur-indfb-move.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9180/shard-rkl-8/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indf=
b-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/15989">i915#15989</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-6/igt@kms_frontbuffer_tracki=
ng@hdr-1p-primscrn-spr-indfb-draw-blt.html">PASS</a> +11 other tests pass</=
li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9180/shard-rkl-4/igt@kms_hdr@bpc-switch.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16644">i915#16644</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">=
i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/8228">i915#8228</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_16112/shard-rkl-1/igt@kms_hdr@bpc-switch.html">PASS</a></=
li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9180/shard-glk4/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html">DMESG=
-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/118">i915#118</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_16112/shard-glk1/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html=
">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9180/shard-rkl-3/igt@kms_plane@plane-panning-bottom-right-suspend@pipe=
-a.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/14412">i915#14412</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-5/igt@kms_plane@plane-panning-=
bottom-right-suspend@pipe-a.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9180/shard-rkl-4/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i9=
15#15073</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_16112/shard-rkl-2/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9180/shard-dg2-4/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/15073">i915#15073</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_16112/shard-dg2-7/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-w=
ait.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@all-busy-idle-check-all:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9180/shard-dg2-5/igt@perf_pmu@all-busy-idle-check-all.html">FAIL</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-=
dg2-5/igt@perf_pmu@all-busy-idle-check-all.html">PASS</a></li>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9180/shard-mtlp-6/igt@perf_pmu@all-busy-idle-check-all.html">FAIL</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard=
-mtlp-5/igt@perf_pmu@all-busy-idle-check-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@semaphore-busy@bcs0:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9180/shard-dg2-5/igt@perf_pmu@semaphore-busy@bcs0.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349">i915#4=
349</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16=
112/shard-dg2-8/igt@perf_pmu@semaphore-busy@bcs0.html">PASS</a> +5 other te=
sts pass</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@semaphore-busy@vcs1:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9180/shard-mtlp-6/igt@perf_pmu@semaphore-busy@vcs1.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349">i915#=
4349</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1=
6112/shard-mtlp-2/igt@perf_pmu@semaphore-busy@vcs1.html">PASS</a> +4 other =
tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_ccs@ctrl-surf-copy:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9180/shard-rkl-5/igt@gem_ccs@ctrl-surf-copy.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323=
">i915#9323</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_16112/shard-rkl-6/igt@gem_ccs@ctrl-surf-copy.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/9323">i915#9323</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-root:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9180/shard-rkl-3/igt@gem_exec_params@secure-non-root.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17416">i9=
15#17416</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_16112/shard-rkl-6/igt@gem_exec_params@secure-non-root.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i91=
5#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/17416">i915#17416</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-wc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9180/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-wc.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#1=
4544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3281">i915#3281</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_16112/shard-rkl-4/igt@gem_exec_reloc@basic-gtt-wc.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281=
">i915#3281</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-range-active:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9180/shard-rkl-2/igt@gem_exec_reloc@basic-range-active.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i=
915#3281</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_16112/shard-rkl-6/igt@gem_exec_reloc@basic-range-active.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i=
915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/3281">i915#3281</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@hw-rejects-pxp-buffer:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9180/shard-rkl-8/igt@gem_pxp@hw-rejects-pxp-buffer.html">FAIL</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl=
-8/igt@gem_pxp@hw-rejects-pxp-buffer.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/13717">i915#13717</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_readwrite@new-obj:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9180/shard-rkl-4/igt@gem_readwrite@new-obj.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/sha=
rd-rkl-6/igt@gem_readwrite@new-obj.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282=
</a>)</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@chained-batch:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9180/shard-rkl-2/igt@gen7_exec_parse@chained-batch.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17455">i915=
#17455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_16112/shard-rkl-6/igt@gen7_exec_parse@chained-batch.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14=
544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/17455">i915#17455</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@basic-rejected-ctx-param:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9180/shard-rkl-6/igt@gen9_exec_parse@basic-rejected-ctx-param.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/2527">i915#2527</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_16112/shard-rkl-1/igt@gen9_exec_parse@basic-rejec=
ted-ctx-param.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/2527">i915#2527</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@unaligned-jump:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9180/shard-rkl-3/igt@gen9_exec_parse@unaligned-jump.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915=
#2527</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
16112/shard-rkl-6/igt@gen9_exec_parse@unaligned-jump.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14=
544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/2527">i915#2527</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-reset-multiple:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9180/shard-rkl-4/igt@i915_pm_freq_api@freq-reset-multiple.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399=
">i915#8399</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_16112/shard-rkl-6/igt@i915_pm_freq_api@freq-reset-multiple.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/8399">i915#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9180/shard-rkl-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-h=
flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/4538">i915#4538</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/5286">i915#5286</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-6/igt@kms_big_fb@4-til=
ed-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#45=
38</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9180/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180=
-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl=
-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/4538">i915#4538</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9180/shard-rkl-5/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538=
">i915#4538</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_16112/shard-rkl-6/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/4538">i915#4538</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:=
</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9180/shard-rkl-6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-18=
0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-2/igt@=
kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/4538">i915#4538</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9180/shard-rkl-7/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/14098">i915#14098</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-6/igt@kms_ccs@bad-pixel-for=
mat-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i91=
5#6095</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9180/shard-rkl-7/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pi=
pe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-6/igt@kms_ccs@bad-pixel-for=
mat-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i91=
5#6095</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9180/shard-rkl-8/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/12313">i915#12313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_16112/shard-rkl-6/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-cc=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/12313">i915#12313</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/14544">i915#14544</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9180/shard-rkl-6/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe=
-b-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-7/igt@kms_ccs=
@crc-primary-rotation-180-y-tiled-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#60=
95</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9180/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/14098">i915#14098</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-8/igt@kms_c=
cs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i91=
5#6095</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9180/shard-rkl-2/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/12805">i915#12805</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_16112/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-ln=
l-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/12805">i915#12805</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9180/shard-glk5/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">INC=
OMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/13356">i915#13356</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/15582">i915#15582</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk1/igt@kms_ccs@crc-primary-s=
uspend-yf-tiled-ccs.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/14694">i915#14694</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582">i9=
15#15582</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9180/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/12313">i915#12313</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-4/igt@kms_ccs@crc-sprite=
-planes-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9180/shard-rkl-8/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742">i915#3742=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112=
/shard-rkl-6/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742">i9=
15#3742</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-after-suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9180/shard-rkl-4/igt@kms_chamelium_audio@hdmi-audio-after-suspend.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/11151">i915#11151</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_16112/shard-rkl-6/igt@kms_chamelium_audio@hdmi-audio-after-=
suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9180/shard-rkl-4/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17427">i915#1=
7427</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1=
6112/shard-rkl-6/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17=
427">i915#17427</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-after-suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9180/shard-rkl-2/igt@kms_chamelium_hpd@vga-hpd-after-suspend.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
1151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/7828">i915#7828</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_16112/shard-rkl-6/igt@kms_chamelium_hpd@vga-hpd-af=
ter-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +1=
 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9180/shard-rkl-3/igt@kms_content_protection@dp-mst-type-0.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1533=
0">i915#15330</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3116">i915#3116</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_16112/shard-rkl-6/igt@kms_content_protection@dp-mst-t=
ype-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/15330">i915#15330</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/3116">i915#3116</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9180/shard-rkl-2/igt@kms_content_protection@srm.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15=
865</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16=
112/shard-rkl-6/igt@kms_content_protection@srm.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1586=
5">i915#15865</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@suspend-resume:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9180/shard-rkl-6/igt@kms_content_protection@suspend-resume.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/145=
44">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/15865">i915#15865</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_16112/shard-rkl-4/igt@kms_content_protection@suspe=
nd-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/15865">i915#15865</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x10:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9180/shard-rkl-4/igt@kms_cursor_crc@cursor-onscreen-32x10.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555=
">i915#3555</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_16112/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-32x10.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9180/shard-mtlp-1/igt@kms_cursor_crc@cursor-suspend.html">INCOMPLETE</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1235=
8">i915#12358</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/17317">i915#17317</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_16112/shard-mtlp-2/igt@kms_cursor_crc@cursor-suspen=
d.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/17157">i915#17157</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9180/shard-rkl-4/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/17428">i915#17428</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_16112/shard-rkl-6/igt@kms_cursor_legacy@cursorb-vs-flipb-legac=
y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/17428">i915#17428</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-bigjoiner:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9180/shard-rkl-6/igt@kms_dsc@dsc-fractional-bpp-bigjoiner.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1454=
4">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/16361">i915#16361</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_16112/shard-rkl-8/igt@kms_dsc@dsc-fractional-bpp-bi=
gjoiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/16361">i915#16361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-ultrajoiner:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9180/shard-rkl-8/igt@kms_dsc@dsc-fractional-bpp-ultrajoiner.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16=
361">i915#16361</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_16112/shard-rkl-6/igt@kms_dsc@dsc-fractional-bpp-ultrajoiner.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/16361">i915#16361</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9180/shard-rkl-6/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14=
544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/658">i915#658</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_16112/shard-rkl-2/igt@kms_feature_discovery@psr2.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658">i91=
5#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-vs-hang:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9180/shard-rkl-4/igt@kms_flip@2x-flip-vs-panning-vs-hang.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934"=
>i915#9934</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_16112/shard-rkl-6/igt@kms_flip@2x-flip-vs-panning-vs-hang.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1454=
4">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/9934">i915#9934</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9180/shard-glk3/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745">i915=
#12745</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/13356">i915#13356</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/17183">i915#17183</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/4839">i915#4839</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113">i915#6113</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-gl=
k4/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#1=
3356</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/17183">i915#17183</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/4839">i915#4839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9180/shard-glk3/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html">INCOMPLET=
E</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
2745">i915#12745</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/13356">i915#13356</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/17183">i915#17183</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/6113">i915#6113</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-glk4/i=
gt@kms_flip@flip-vs-suspend@a-hdmi-a1.html">INCOMPLETE</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">=
i915#13356</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/17183">i915#17183</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9180/shard-rkl-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yf=
tile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/15643">i915#15643</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-6/igt@kms_flip_scaled_cr=
c@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643=
">i915#15643</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9180/shard-mtlp-8/igt@kms_force_connector_basic@force-load-detect.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/17452">i915#17452</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_16112/shard-mtlp-1/igt@kms_force_connector_basic@force-load=
-detect.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/15672">i915#15672</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9180/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-suspend.html">INC=
OMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/16056">i915#16056</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_16112/shard-rkl-8/igt@kms_frontbuffer_tracking@fbchdr-susp=
end.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/15989">i915#15989</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt:=
</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9180/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-i=
ndfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112=
/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw=
-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/17428">i915#17428</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9180/shard-rkl-6/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrf=
b-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/17428">i915#17428</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-5/igt@k=
ms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/174=
28">i915#17428</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9180/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indf=
b-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/17428">i915#17428</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-6/igt@km=
s_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544=
">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/17428">i915#17428</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/1825">i915#1825</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9180/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-=
gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-3/igt@kms_frontbuff=
er_tracking@psr-rgb101010-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +2 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9180/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-suspend.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1510=
2">i915#15102</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_16112/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-suspend.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/15102">i915#15102</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9180/shard-rkl-3/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1187">i915#11=
87</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/12713">i915#12713</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/16644">i915#16644</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-5/igt@kms_hdr@brightness-with-=
hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/12713">i915#12713</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/16644">i915#16644</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9180/shard-rkl-2/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458">i915=
#15458</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_16112/shard-rkl-6/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14=
544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/15458">i915#15458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9180/shard-rkl-6/igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modes=
et-pipe-c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/17455">i915#17455</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-5/igt@kms_pip=
e_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17455">i915#174=
55</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-untiled:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9180/shard-glk4/igt@kms_pipe_stress@stress-xrgb8888-untiled.html">DMES=
G-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/118">i915#118</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_16112/shard-glk8/igt@kms_pipe_stress@stress-xrgb8888-untiled.ht=
ml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/118">i915#118</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9180/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-modifier-source-cl=
amping.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-8/igt@kms_plane@=
pixel-format-4-tiled-modifier-source-clamping.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9180/shard-rkl-8/igt@kms_plane_multiple@2x-tiling-x.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i91=
5#13958</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_16112/shard-rkl-6/igt@kms_plane_multiple@2x-tiling-x.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#=
13958</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9180/shard-rkl-7/igt@kms_plane_scaling@plane-upscale-20x20-with-rotati=
on@pipe-a.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/15329">i915#15329</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-6/igt@kms_plane_scaling@plane=
-upscale-20x20-with-rotation@pipe-a.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#153=
29</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9180/shard-rkl-7/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343"=
>i915#12343</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/5354">i915#5354</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-rkl-6/igt@kms_pm_backlight@fade-with-suspen=
d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/12343">i915#12343</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@pc8-residency:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9180/shard-tglu-4/igt@kms_pm_rpm@pc8-residency.html">SKIP</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-tglu-9/=
igt@kms_pm_rpm@pc8-residency.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/17434">i915#17434</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17450">i915#17450</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-idle:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9180/shard-rkl-6/igt@kms_pm_rpm@system-suspend-idle.html">INCOMPLETE</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1441=
9">i915#14419</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_16112/shard-rkl-1/igt@kms_pm_rpm@system-suspend-idle.html">ABORT</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15132=
">i915#15132</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9180/shard-rkl-8/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuou=
s-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/11520">i915#11520</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-6/igt@kms_psr2_sf@fbc-psr2-=
overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915=
#14544</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9180/shard-rkl-2/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683">i915=
#9683</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
16112/shard-rkl-6/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14=
544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/9683">i915#9683</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-render:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9180/shard-rkl-6/igt@kms_psr@fbc-pr-cursor-render.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1=
072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_16112/shard-rkl-8/igt@kms_psr@fbc-pr-cursor-ren=
der.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/9732">i915#9732</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-cursor-plane-onoff:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9180/shard-rkl-4/igt@kms_psr@pr-cursor-plane-onoff.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#=
1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/9732">i915#9732</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_16112/shard-rkl-6/igt@kms_psr@pr-cursor-plane-onoff.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10=
72">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/9732">i915#9732</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@perf@per-context-mode-unprivileged:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9180/shard-rkl-6/igt@perf@per-context-mode-unprivileged.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"=
>i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/2435">i915#2435</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_16112/shard-rkl-7/igt@perf@per-context-mode-unprivilege=
d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/2435">i915#2435</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-suspend:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9180/shard-mtlp-6/igt@perf_pmu@rc6-suspend.html">DMESG-WARN</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17198">i915#1=
7198</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1=
6112/shard-mtlp-8/igt@perf_pmu@rc6-suspend.html">FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17245">i915#17245</a>)</=
li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9180 -&gt; IGTPW_16112</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19458: be7a4fe8d1795219f7d033830ec4cf6e8ca1ecdb @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  IGTPW_16112: 16112<br />
  IGT_9180: 9180</p>

</body>
</html>

--===============7962291965975178436==--
