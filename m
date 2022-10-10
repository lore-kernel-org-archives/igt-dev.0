Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============0963377429273163388=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Niranjana Vishwanathapura" <niranjana.vishwanathapura@intel.com>
Date: Mon, 10 Oct 2022 07:37:13 -0000
Message-ID: <166538743324.29672.2960071616523624914@emeril.freedesktop.org>
References: <20221010065929.32110-1-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20221010065929.32110-1-niranjana.vishwanathapura@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3Igdm1fYmlu?=
 =?utf-8?q?d=3A_Add_VM=5FBIND_validation_support_=28rev7=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--===============0963377429273163388==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: vm_bind: Add VM_BIND validation support (rev7)
URL   : https://patchwork.freedesktop.org/series/105881/
State : success

== Summary ==

CI Bug Log - changes from IGT_7005 -> IGTPW_7934
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/index.html

Participating hosts (43 -> 42)
------------------------------

  Additional (1): bat-jsl-1 
  Missing    (2): fi-ctg-p8600 fi-tgl-dsi 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_7934:

### IGT changes ###

#### Possible regressions ####

  * {igt@gem_exec3_basic@basic} (NEW):
    - fi-bdw-gvtdvm:      NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-bdw-gvtdvm/igt@gem_exec3_basic@basic.html
    - fi-snb-2520m:       NOTRUN -> [FAIL][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-snb-2520m/igt@gem_exec3_basic@basic.html
    - fi-rkl-guc:         NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-rkl-guc/igt@gem_exec3_basic@basic.html
    - fi-skl-guc:         NOTRUN -> [FAIL][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-skl-guc/igt@gem_exec3_basic@basic.html
    - {bat-dg2-11}:       NOTRUN -> [FAIL][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/bat-dg2-11/igt@gem_exec3_basic@basic.html
    - fi-cfl-8700k:       NOTRUN -> [FAIL][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-cfl-8700k/igt@gem_exec3_basic@basic.html
    - {fi-tgl-mst}:       NOTRUN -> [FAIL][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-tgl-mst/igt@gem_exec3_basic@basic.html
    - fi-elk-e7500:       NOTRUN -> [FAIL][8]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-elk-e7500/igt@gem_exec3_basic@basic.html
    - fi-bsw-nick:        NOTRUN -> [FAIL][9]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-bsw-nick/igt@gem_exec3_basic@basic.html
    - {bat-adlm-1}:       NOTRUN -> [FAIL][10]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/bat-adlm-1/igt@gem_exec3_basic@basic.html
    - fi-hsw-g3258:       NOTRUN -> [FAIL][11]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-hsw-g3258/igt@gem_exec3_basic@basic.html
    - {bat-jsl-3}:        NOTRUN -> [FAIL][12]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/bat-jsl-3/igt@gem_exec3_basic@basic.html
    - fi-hsw-4770:        NOTRUN -> [FAIL][13]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-hsw-4770/igt@gem_exec3_basic@basic.html
    - bat-adlp-4:         NOTRUN -> [FAIL][14]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/bat-adlp-4/igt@gem_exec3_basic@basic.html
    - fi-ivb-3770:        NOTRUN -> [FAIL][15]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-ivb-3770/igt@gem_exec3_basic@basic.html
    - {bat-dg2-8}:        NOTRUN -> [FAIL][16]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/bat-dg2-8/igt@gem_exec3_basic@basic.html
    - fi-kbl-guc:         NOTRUN -> [FAIL][17]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-kbl-guc/igt@gem_exec3_basic@basic.html
    - fi-snb-2600:        NOTRUN -> [FAIL][18]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-snb-2600/igt@gem_exec3_basic@basic.html
    - {bat-jsl-1}:        NOTRUN -> [FAIL][19]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/bat-jsl-1/igt@gem_exec3_basic@basic.html
    - fi-bxt-dsi:         NOTRUN -> [FAIL][20]
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-bxt-dsi/igt@gem_exec3_basic@basic.html
    - {fi-jsl-1}:         NOTRUN -> [FAIL][21]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-jsl-1/igt@gem_exec3_basic@basic.html
    - bat-dg1-5:          NOTRUN -> [FAIL][22]
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/bat-dg1-5/igt@gem_exec3_basic@basic.html
    - fi-pnv-d510:        NOTRUN -> [FAIL][23]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-pnv-d510/igt@gem_exec3_basic@basic.html
    - fi-glk-j4005:       NOTRUN -> [FAIL][24]
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-glk-j4005/igt@gem_exec3_basic@basic.html
    - fi-skl-6700k2:      NOTRUN -> [FAIL][25]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-skl-6700k2/igt@gem_exec3_basic@basic.html
    - fi-kbl-7567u:       NOTRUN -> [FAIL][26]
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-kbl-7567u/igt@gem_exec3_basic@basic.html
    - {bat-adln-1}:       NOTRUN -> [FAIL][27]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/bat-adln-1/igt@gem_exec3_basic@basic.html
    - fi-kbl-8809g:       NOTRUN -> [FAIL][28]
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-kbl-8809g/igt@gem_exec3_basic@basic.html
    - {bat-rplp-1}:       NOTRUN -> [FAIL][29]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/bat-rplp-1/igt@gem_exec3_basic@basic.html
    - fi-rkl-11600:       NOTRUN -> [FAIL][30]
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-rkl-11600/igt@gem_exec3_basic@basic.html
    - fi-adl-ddr5:        NOTRUN -> [FAIL][31]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-adl-ddr5/igt@gem_exec3_basic@basic.html
    - fi-cfl-guc:         NOTRUN -> [FAIL][32]
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-cfl-guc/igt@gem_exec3_basic@basic.html
    - {bat-dg2-9}:        NOTRUN -> [FAIL][33]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/bat-dg2-9/igt@gem_exec3_basic@basic.html
    - fi-bdw-5557u:       NOTRUN -> [FAIL][34]
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-bdw-5557u/igt@gem_exec3_basic@basic.html
    - fi-cfl-8109u:       NOTRUN -> [FAIL][35]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-cfl-8109u/igt@gem_exec3_basic@basic.html
    - {bat-rpls-2}:       NOTRUN -> [FAIL][36]
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/bat-rpls-2/igt@gem_exec3_basic@basic.html
    - fi-ilk-650:         NOTRUN -> [FAIL][37]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-ilk-650/igt@gem_exec3_basic@basic.html
    - fi-blb-e6850:       NOTRUN -> [FAIL][38]
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-blb-e6850/igt@gem_exec3_basic@basic.html
    - {bat-adlp-6}:       NOTRUN -> [FAIL][39]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/bat-adlp-6/igt@gem_exec3_basic@basic.html
    - fi-skl-6600u:       NOTRUN -> [FAIL][40]
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-skl-6600u/igt@gem_exec3_basic@basic.html
    - {fi-ehl-2}:         NOTRUN -> [FAIL][41]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-ehl-2/igt@gem_exec3_basic@basic.html
    - fi-apl-guc:         NOTRUN -> [FAIL][42]
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-apl-guc/igt@gem_exec3_basic@basic.html

  * {igt@i915_vm_bind_basic@basic-smem} (NEW):
    - {fi-tgl-mst}:       NOTRUN -> [SKIP][43] +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-tgl-mst/igt@i915_vm_bind_basic@basic-smem.html
    - {bat-adlm-1}:       NOTRUN -> [SKIP][44] +1 similar issue
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/bat-adlm-1/igt@i915_vm_bind_basic@basic-smem.html
    - bat-adlp-4:         NOTRUN -> [SKIP][45] +1 similar issue
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/bat-adlp-4/igt@i915_vm_bind_basic@basic-smem.html
    - {bat-dg2-8}:        NOTRUN -> [SKIP][46] +1 similar issue
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/bat-dg2-8/igt@i915_vm_bind_basic@basic-smem.html
    - {bat-jsl-1}:        NOTRUN -> [SKIP][47] +1 similar issue
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/bat-jsl-1/igt@i915_vm_bind_basic@basic-smem.html
    - {fi-jsl-1}:         NOTRUN -> [SKIP][48] +1 similar issue
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-jsl-1/igt@i915_vm_bind_basic@basic-smem.html

  * {igt@i915_vm_bind_sanity@basic-smem} (NEW):
    - {bat-rplp-1}:       NOTRUN -> [SKIP][49] +1 similar issue
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/bat-rplp-1/igt@i915_vm_bind_sanity@basic-smem.html
    - fi-rkl-11600:       NOTRUN -> [SKIP][50] +1 similar issue
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-rkl-11600/igt@i915_vm_bind_sanity@basic-smem.html
    - bat-dg1-5:          NOTRUN -> [SKIP][51] +1 similar issue
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/bat-dg1-5/igt@i915_vm_bind_sanity@basic-smem.html
    - {bat-dg2-9}:        NOTRUN -> [SKIP][52] +1 similar issue
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/bat-dg2-9/igt@i915_vm_bind_sanity@basic-smem.html
    - {bat-adln-1}:       NOTRUN -> [SKIP][53] +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/bat-adln-1/igt@i915_vm_bind_sanity@basic-smem.html
    - fi-adl-ddr5:        NOTRUN -> [SKIP][54] +1 similar issue
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-adl-ddr5/igt@i915_vm_bind_sanity@basic-smem.html
    - {fi-ehl-2}:         NOTRUN -> [SKIP][55] +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-ehl-2/igt@i915_vm_bind_sanity@basic-smem.html
    - {bat-rpls-2}:       NOTRUN -> [SKIP][56] +1 similar issue
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/bat-rpls-2/igt@i915_vm_bind_sanity@basic-smem.html
    - fi-rkl-guc:         NOTRUN -> [SKIP][57] +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-rkl-guc/igt@i915_vm_bind_sanity@basic-smem.html
    - {bat-adlp-6}:       NOTRUN -> [SKIP][58] +1 similar issue
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/bat-adlp-6/igt@i915_vm_bind_sanity@basic-smem.html
    - {bat-jsl-3}:        NOTRUN -> [SKIP][59] +1 similar issue
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/bat-jsl-3/igt@i915_vm_bind_sanity@basic-smem.html
    - {bat-dg2-11}:       NOTRUN -> [SKIP][60] +1 similar issue
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/bat-dg2-11/igt@i915_vm_bind_sanity@basic-smem.html

  
New tests
---------

  New tests have been introduced between IGT_7005 and IGTPW_7934:

### New IGT tests (3) ###

  * igt@gem_exec3_basic@basic:
    - Statuses : 42 fail(s)
    - Exec time: [0.0] s

  * igt@i915_vm_bind_basic@basic-smem:
    - Statuses : 42 skip(s)
    - Exec time: [0.0] s

  * igt@i915_vm_bind_sanity@basic-smem:
    - Statuses : 42 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_7934 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * {igt@i915_vm_bind_basic@basic-smem} (NEW):
    - fi-cfl-8700k:       NOTRUN -> [SKIP][61] ([fdo#109271]) +1 similar issue
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-cfl-8700k/igt@i915_vm_bind_basic@basic-smem.html
    - fi-elk-e7500:       NOTRUN -> [SKIP][62] ([fdo#109271]) +1 similar issue
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-elk-e7500/igt@i915_vm_bind_basic@basic-smem.html
    - fi-bsw-nick:        NOTRUN -> [SKIP][63] ([fdo#109271]) +1 similar issue
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-bsw-nick/igt@i915_vm_bind_basic@basic-smem.html
    - fi-hsw-g3258:       NOTRUN -> [SKIP][64] ([fdo#109271]) +1 similar issue
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-hsw-g3258/igt@i915_vm_bind_basic@basic-smem.html
    - fi-hsw-4770:        NOTRUN -> [SKIP][65] ([fdo#109271]) +1 similar issue
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-hsw-4770/igt@i915_vm_bind_basic@basic-smem.html
    - fi-ivb-3770:        NOTRUN -> [SKIP][66] ([fdo#109271]) +1 similar issue
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-ivb-3770/igt@i915_vm_bind_basic@basic-smem.html
    - fi-kbl-guc:         NOTRUN -> [SKIP][67] ([fdo#109271]) +1 similar issue
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-kbl-guc/igt@i915_vm_bind_basic@basic-smem.html
    - fi-bxt-dsi:         NOTRUN -> [SKIP][68] ([fdo#109271]) +1 similar issue
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-bxt-dsi/igt@i915_vm_bind_basic@basic-smem.html

  * {igt@i915_vm_bind_sanity@basic-smem} (NEW):
    - fi-pnv-d510:        NOTRUN -> [SKIP][69] ([fdo#109271]) +1 similar issue
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-pnv-d510/igt@i915_vm_bind_sanity@basic-smem.html
    - fi-glk-j4005:       NOTRUN -> [SKIP][70] ([fdo#109271]) +1 similar issue
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-glk-j4005/igt@i915_vm_bind_sanity@basic-smem.html
    - fi-snb-2600:        NOTRUN -> [SKIP][71] ([fdo#109271]) +1 similar issue
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-snb-2600/igt@i915_vm_bind_sanity@basic-smem.html
    - fi-skl-6700k2:      NOTRUN -> [SKIP][72] ([fdo#109271]) +1 similar issue
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-skl-6700k2/igt@i915_vm_bind_sanity@basic-smem.html
    - fi-cfl-8109u:       NOTRUN -> [SKIP][73] ([fdo#109271]) +1 similar issue
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-cfl-8109u/igt@i915_vm_bind_sanity@basic-smem.html
    - fi-kbl-7567u:       NOTRUN -> [SKIP][74] ([fdo#109271]) +1 similar issue
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-kbl-7567u/igt@i915_vm_bind_sanity@basic-smem.html
    - fi-kbl-8809g:       NOTRUN -> [SKIP][75] ([fdo#109271]) +1 similar issue
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-kbl-8809g/igt@i915_vm_bind_sanity@basic-smem.html
    - fi-ilk-650:         NOTRUN -> [SKIP][76] ([fdo#109271]) +1 similar issue
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-ilk-650/igt@i915_vm_bind_sanity@basic-smem.html
    - fi-cfl-guc:         NOTRUN -> [SKIP][77] ([fdo#109271]) +1 similar issue
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-cfl-guc/igt@i915_vm_bind_sanity@basic-smem.html
    - fi-skl-6600u:       NOTRUN -> [SKIP][78] ([fdo#109271]) +1 similar issue
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-skl-6600u/igt@i915_vm_bind_sanity@basic-smem.html
    - fi-bdw-5557u:       NOTRUN -> [SKIP][79] ([fdo#109271]) +1 similar issue
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-bdw-5557u/igt@i915_vm_bind_sanity@basic-smem.html
    - fi-skl-guc:         NOTRUN -> [SKIP][80] ([fdo#109271]) +1 similar issue
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-skl-guc/igt@i915_vm_bind_sanity@basic-smem.html
    - fi-blb-e6850:       NOTRUN -> [SKIP][81] ([fdo#109271]) +1 similar issue
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-blb-e6850/igt@i915_vm_bind_sanity@basic-smem.html
    - fi-apl-guc:         NOTRUN -> [SKIP][82] ([fdo#109271]) +1 similar issue
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-apl-guc/igt@i915_vm_bind_sanity@basic-smem.html
    - fi-bdw-gvtdvm:      NOTRUN -> [SKIP][83] ([fdo#109271]) +1 similar issue
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-bdw-gvtdvm/igt@i915_vm_bind_sanity@basic-smem.html
    - fi-snb-2520m:       NOTRUN -> [SKIP][84] ([fdo#109271]) +1 similar issue
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-snb-2520m/igt@i915_vm_bind_sanity@basic-smem.html

  * igt@kms_chamelium@common-hpd-after-suspend:
    - bat-dg1-5:          NOTRUN -> [SKIP][85] ([fdo#111827])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/bat-dg1-5/igt@kms_chamelium@common-hpd-after-suspend.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - bat-dg1-5:          NOTRUN -> [SKIP][86] ([i915#4078])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/bat-dg1-5/igt@kms_pipe_crc_basic@suspend-read-crc.html

  
#### Possible fixes ####

  * igt@gem_exec_suspend@basic-s3@lmem0:
    - {bat-dg2-11}:       [DMESG-WARN][87] ([i915#6816]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7005/bat-dg2-11/igt@gem_exec_suspend@basic-s3@lmem0.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/bat-dg2-11/igt@gem_exec_suspend@basic-s3@lmem0.html

  * igt@gem_exec_suspend@basic-s3@smem:
    - {bat-adlm-1}:       [DMESG-WARN][89] ([i915#2867]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7005/bat-adlm-1/igt@gem_exec_suspend@basic-s3@smem.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/bat-adlm-1/igt@gem_exec_suspend@basic-s3@smem.html

  * igt@gem_huc_copy@huc-copy:
    - {bat-dg2-8}:        [FAIL][91] ([i915#7029]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7005/bat-dg2-8/igt@gem_huc_copy@huc-copy.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/bat-dg2-8/igt@gem_huc_copy@huc-copy.html

  * igt@i915_module_load@load:
    - {bat-dg2-8}:        [DMESG-WARN][93] ([i915#7031]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7005/bat-dg2-8/igt@i915_module_load@load.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/bat-dg2-8/igt@i915_module_load@load.html

  * igt@i915_module_load@reload:
    - {bat-rpls-2}:       [DMESG-WARN][95] ([i915#5537]) -> [PASS][96] +1 similar issue
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7005/bat-rpls-2/igt@i915_module_load@reload.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/bat-rpls-2/igt@i915_module_load@reload.html

  * igt@i915_selftest@live@gt_engines:
    - bat-dg1-5:          [INCOMPLETE][97] ([i915#4418]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7005/bat-dg1-5/igt@i915_selftest@live@gt_engines.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/bat-dg1-5/igt@i915_selftest@live@gt_engines.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#2867]: https://gitlab.freedesktop.org/drm/intel/issues/2867
  [i915#3003]: https://gitlab.freedesktop.org/drm/intel/issues/3003
  [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3987]: https://gitlab.freedesktop.org/drm/intel/issues/3987
  [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4418]: https://gitlab.freedesktop.org/drm/intel/issues/4418
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#5122]: https://gitlab.freedesktop.org/drm/intel/issues/5122
  [i915#5537]: https://gitlab.freedesktop.org/drm/intel/issues/5537
  [i915#6367]: https://gitlab.freedesktop.org/drm/intel/issues/6367
  [i915#6434]: https://gitlab.freedesktop.org/drm/intel/issues/6434
  [i915#6816]: https://gitlab.freedesktop.org/drm/intel/issues/6816
  [i915#6997]: https://gitlab.freedesktop.org/drm/intel/issues/6997
  [i915#7029]: https://gitlab.freedesktop.org/drm/intel/issues/7029
  [i915#7031]: https://gitlab.freedesktop.org/drm/intel/issues/7031


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7005 -> IGTPW_7934

  CI-20190529: 20190529
  CI_DRM_12227: 74e2443e7681e4d442b45f551ddf12d09a6f00c3 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7934: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/index.html
  IGT_7005: 41bf1f94200fef79486d2a7d24c31de1042094e3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@gem_exec3_balancer@parallel-ordering
+igt@gem_exec3_basic@basic
+igt@gem_lmem_swapping@vm_bind
+igt@i915_vm_bind_basic@2m-lmem
+igt@i915_vm_bind_basic@2m-smem
+igt@i915_vm_bind_basic@2m-userptr
+igt@i915_vm_bind_basic@64k-lmem
+igt@i915_vm_bind_basic@64k-smem
+igt@i915_vm_bind_basic@64k-userptr
+igt@i915_vm_bind_basic@basic-lmem
+igt@i915_vm_bind_basic@basic-smem
+igt@i915_vm_bind_basic@basic-userptr
+igt@i915_vm_bind_basic@multi_cmds-lmem
+igt@i915_vm_bind_basic@multi_cmds-smem
+igt@i915_vm_bind_basic@multi_cmds-userptr
+igt@i915_vm_bind_basic@multi_ctxts-lmem
+igt@i915_vm_bind_basic@multi_ctxts-smem
+igt@i915_vm_bind_basic@multi_ctxts-userptr
+igt@i915_vm_bind_basic@share_vm-lmem
+igt@i915_vm_bind_basic@share_vm-smem
+igt@i915_vm_bind_basic@share_vm-userptr
+igt@i915_vm_bind_basic@skip_copy-lmem
+igt@i915_vm_bind_basic@skip_copy-smem
+igt@i915_vm_bind_basic@skip_copy-userptr
+igt@i915_vm_bind_basic@skip_unbind-lmem
+igt@i915_vm_bind_basic@skip_unbind-smem
+igt@i915_vm_bind_basic@skip_unbind-userptr
+igt@i915_vm_bind_sanity@basic-lmem
+igt@i915_vm_bind_sanity@basic-smem

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/index.html

--===============0963377429273163388==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <title>Project List - Patchwork</title>
  <style id="css-table-select" type="text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>vm_bind: Add VM_BIND validation support (rev7)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/105881/">https://patchwork.freedesktop.org/series/105881/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7005 -&gt; IGTPW_7934</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/index.html</p>
<h2>Participating hosts (43 -&gt; 42)</h2>
<p>Additional (1): bat-jsl-1 <br />
  Missing    (2): fi-ctg-p8600 fi-tgl-dsi </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7934:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@gem_exec3_basic@basic} (NEW):</p>
<ul>
<li>
<p>fi-bdw-gvtdvm:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-bdw-gvtdvm/igt@gem_exec3_basic@basic.html">FAIL</a></p>
</li>
<li>
<p>fi-snb-2520m:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-snb-2520m/igt@gem_exec3_basic@basic.html">FAIL</a></p>
</li>
<li>
<p>fi-rkl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-rkl-guc/igt@gem_exec3_basic@basic.html">FAIL</a></p>
</li>
<li>
<p>fi-skl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-skl-guc/igt@gem_exec3_basic@basic.html">FAIL</a></p>
</li>
<li>
<p>{bat-dg2-11}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/bat-dg2-11/igt@gem_exec3_basic@basic.html">FAIL</a></p>
</li>
<li>
<p>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-cfl-8700k/igt@gem_exec3_basic@basic.html">FAIL</a></p>
</li>
<li>
<p>{fi-tgl-mst}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-tgl-mst/igt@gem_exec3_basic@basic.html">FAIL</a></p>
</li>
<li>
<p>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-elk-e7500/igt@gem_exec3_basic@basic.html">FAIL</a></p>
</li>
<li>
<p>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-bsw-nick/igt@gem_exec3_basic@basic.html">FAIL</a></p>
</li>
<li>
<p>{bat-adlm-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/bat-adlm-1/igt@gem_exec3_basic@basic.html">FAIL</a></p>
</li>
<li>
<p>fi-hsw-g3258:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-hsw-g3258/igt@gem_exec3_basic@basic.html">FAIL</a></p>
</li>
<li>
<p>{bat-jsl-3}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/bat-jsl-3/igt@gem_exec3_basic@basic.html">FAIL</a></p>
</li>
<li>
<p>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-hsw-4770/igt@gem_exec3_basic@basic.html">FAIL</a></p>
</li>
<li>
<p>bat-adlp-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/bat-adlp-4/igt@gem_exec3_basic@basic.html">FAIL</a></p>
</li>
<li>
<p>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-ivb-3770/igt@gem_exec3_basic@basic.html">FAIL</a></p>
</li>
<li>
<p>{bat-dg2-8}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/bat-dg2-8/igt@gem_exec3_basic@basic.html">FAIL</a></p>
</li>
<li>
<p>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-kbl-guc/igt@gem_exec3_basic@basic.html">FAIL</a></p>
</li>
<li>
<p>fi-snb-2600:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-snb-2600/igt@gem_exec3_basic@basic.html">FAIL</a></p>
</li>
<li>
<p>{bat-jsl-1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/bat-jsl-1/igt@gem_exec3_basic@basic.html">FAIL</a></p>
</li>
<li>
<p>fi-bxt-dsi:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-bxt-dsi/igt@gem_exec3_basic@basic.html">FAIL</a></p>
</li>
<li>
<p>{fi-jsl-1}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-jsl-1/igt@gem_exec3_basic@basic.html">FAIL</a></p>
</li>
<li>
<p>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/bat-dg1-5/igt@gem_exec3_basic@basic.html">FAIL</a></p>
</li>
<li>
<p>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-pnv-d510/igt@gem_exec3_basic@basic.html">FAIL</a></p>
</li>
<li>
<p>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-glk-j4005/igt@gem_exec3_basic@basic.html">FAIL</a></p>
</li>
<li>
<p>fi-skl-6700k2:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-skl-6700k2/igt@gem_exec3_basic@basic.html">FAIL</a></p>
</li>
<li>
<p>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-kbl-7567u/igt@gem_exec3_basic@basic.html">FAIL</a></p>
</li>
<li>
<p>{bat-adln-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/bat-adln-1/igt@gem_exec3_basic@basic.html">FAIL</a></p>
</li>
<li>
<p>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-kbl-8809g/igt@gem_exec3_basic@basic.html">FAIL</a></p>
</li>
<li>
<p>{bat-rplp-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/bat-rplp-1/igt@gem_exec3_basic@basic.html">FAIL</a></p>
</li>
<li>
<p>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-rkl-11600/igt@gem_exec3_basic@basic.html">FAIL</a></p>
</li>
<li>
<p>fi-adl-ddr5:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-adl-ddr5/igt@gem_exec3_basic@basic.html">FAIL</a></p>
</li>
<li>
<p>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-cfl-guc/igt@gem_exec3_basic@basic.html">FAIL</a></p>
</li>
<li>
<p>{bat-dg2-9}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/bat-dg2-9/igt@gem_exec3_basic@basic.html">FAIL</a></p>
</li>
<li>
<p>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-bdw-5557u/igt@gem_exec3_basic@basic.html">FAIL</a></p>
</li>
<li>
<p>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-cfl-8109u/igt@gem_exec3_basic@basic.html">FAIL</a></p>
</li>
<li>
<p>{bat-rpls-2}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/bat-rpls-2/igt@gem_exec3_basic@basic.html">FAIL</a></p>
</li>
<li>
<p>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-ilk-650/igt@gem_exec3_basic@basic.html">FAIL</a></p>
</li>
<li>
<p>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-blb-e6850/igt@gem_exec3_basic@basic.html">FAIL</a></p>
</li>
<li>
<p>{bat-adlp-6}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/bat-adlp-6/igt@gem_exec3_basic@basic.html">FAIL</a></p>
</li>
<li>
<p>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-skl-6600u/igt@gem_exec3_basic@basic.html">FAIL</a></p>
</li>
<li>
<p>{fi-ehl-2}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-ehl-2/igt@gem_exec3_basic@basic.html">FAIL</a></p>
</li>
<li>
<p>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-apl-guc/igt@gem_exec3_basic@basic.html">FAIL</a></p>
</li>
</ul>
</li>
<li>
<p>{igt@i915_vm_bind_basic@basic-smem} (NEW):</p>
<ul>
<li>
<p>{fi-tgl-mst}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-tgl-mst/igt@i915_vm_bind_basic@basic-smem.html">SKIP</a> +1 similar issue</p>
</li>
<li>
<p>{bat-adlm-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/bat-adlm-1/igt@i915_vm_bind_basic@basic-smem.html">SKIP</a> +1 similar issue</p>
</li>
<li>
<p>bat-adlp-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/bat-adlp-4/igt@i915_vm_bind_basic@basic-smem.html">SKIP</a> +1 similar issue</p>
</li>
<li>
<p>{bat-dg2-8}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/bat-dg2-8/igt@i915_vm_bind_basic@basic-smem.html">SKIP</a> +1 similar issue</p>
</li>
<li>
<p>{bat-jsl-1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/bat-jsl-1/igt@i915_vm_bind_basic@basic-smem.html">SKIP</a> +1 similar issue</p>
</li>
<li>
<p>{fi-jsl-1}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-jsl-1/igt@i915_vm_bind_basic@basic-smem.html">SKIP</a> +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>{igt@i915_vm_bind_sanity@basic-smem} (NEW):</p>
<ul>
<li>
<p>{bat-rplp-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/bat-rplp-1/igt@i915_vm_bind_sanity@basic-smem.html">SKIP</a> +1 similar issue</p>
</li>
<li>
<p>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-rkl-11600/igt@i915_vm_bind_sanity@basic-smem.html">SKIP</a> +1 similar issue</p>
</li>
<li>
<p>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/bat-dg1-5/igt@i915_vm_bind_sanity@basic-smem.html">SKIP</a> +1 similar issue</p>
</li>
<li>
<p>{bat-dg2-9}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/bat-dg2-9/igt@i915_vm_bind_sanity@basic-smem.html">SKIP</a> +1 similar issue</p>
</li>
<li>
<p>{bat-adln-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/bat-adln-1/igt@i915_vm_bind_sanity@basic-smem.html">SKIP</a> +1 similar issue</p>
</li>
<li>
<p>fi-adl-ddr5:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-adl-ddr5/igt@i915_vm_bind_sanity@basic-smem.html">SKIP</a> +1 similar issue</p>
</li>
<li>
<p>{fi-ehl-2}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-ehl-2/igt@i915_vm_bind_sanity@basic-smem.html">SKIP</a> +1 similar issue</p>
</li>
<li>
<p>{bat-rpls-2}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/bat-rpls-2/igt@i915_vm_bind_sanity@basic-smem.html">SKIP</a> +1 similar issue</p>
</li>
<li>
<p>fi-rkl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-rkl-guc/igt@i915_vm_bind_sanity@basic-smem.html">SKIP</a> +1 similar issue</p>
</li>
<li>
<p>{bat-adlp-6}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/bat-adlp-6/igt@i915_vm_bind_sanity@basic-smem.html">SKIP</a> +1 similar issue</p>
</li>
<li>
<p>{bat-jsl-3}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/bat-jsl-3/igt@i915_vm_bind_sanity@basic-smem.html">SKIP</a> +1 similar issue</p>
</li>
<li>
<p>{bat-dg2-11}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/bat-dg2-11/igt@i915_vm_bind_sanity@basic-smem.html">SKIP</a> +1 similar issue</p>
</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_7005 and IGTPW_7934:</p>
<h3>New IGT tests (3)</h3>
<ul>
<li>
<p>igt@gem_exec3_basic@basic:</p>
<ul>
<li>Statuses : 42 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_vm_bind_basic@basic-smem:</p>
<ul>
<li>Statuses : 42 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_vm_bind_sanity@basic-smem:</p>
<ul>
<li>Statuses : 42 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7934 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>{igt@i915_vm_bind_basic@basic-smem} (NEW):</p>
<ul>
<li>
<p>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-cfl-8700k/igt@i915_vm_bind_basic@basic-smem.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-elk-e7500/igt@i915_vm_bind_basic@basic-smem.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-bsw-nick/igt@i915_vm_bind_basic@basic-smem.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-hsw-g3258:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-hsw-g3258/igt@i915_vm_bind_basic@basic-smem.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-hsw-4770/igt@i915_vm_bind_basic@basic-smem.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-ivb-3770/igt@i915_vm_bind_basic@basic-smem.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-kbl-guc/igt@i915_vm_bind_basic@basic-smem.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-bxt-dsi:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-bxt-dsi/igt@i915_vm_bind_basic@basic-smem.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>{igt@i915_vm_bind_sanity@basic-smem} (NEW):</p>
<ul>
<li>
<p>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-pnv-d510/igt@i915_vm_bind_sanity@basic-smem.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-glk-j4005/igt@i915_vm_bind_sanity@basic-smem.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-snb-2600:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-snb-2600/igt@i915_vm_bind_sanity@basic-smem.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-skl-6700k2:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-skl-6700k2/igt@i915_vm_bind_sanity@basic-smem.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-cfl-8109u/igt@i915_vm_bind_sanity@basic-smem.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-kbl-7567u/igt@i915_vm_bind_sanity@basic-smem.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-kbl-8809g/igt@i915_vm_bind_sanity@basic-smem.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-ilk-650/igt@i915_vm_bind_sanity@basic-smem.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-cfl-guc/igt@i915_vm_bind_sanity@basic-smem.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-skl-6600u/igt@i915_vm_bind_sanity@basic-smem.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-bdw-5557u/igt@i915_vm_bind_sanity@basic-smem.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-skl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-skl-guc/igt@i915_vm_bind_sanity@basic-smem.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-blb-e6850/igt@i915_vm_bind_sanity@basic-smem.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-apl-guc/igt@i915_vm_bind_sanity@basic-smem.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-bdw-gvtdvm:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-bdw-gvtdvm/igt@i915_vm_bind_sanity@basic-smem.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-snb-2520m:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/fi-snb-2520m/igt@i915_vm_bind_sanity@basic-smem.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@common-hpd-after-suspend:</p>
<ul>
<li>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/bat-dg1-5/igt@kms_chamelium@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/bat-dg1-5/igt@kms_pipe_crc_basic@suspend-read-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4078">i915#4078</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s3@lmem0:</p>
<ul>
<li>{bat-dg2-11}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7005/bat-dg2-11/igt@gem_exec_suspend@basic-s3@lmem0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6816">i915#6816</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/bat-dg2-11/igt@gem_exec_suspend@basic-s3@lmem0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3@smem:</p>
<ul>
<li>{bat-adlm-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7005/bat-adlm-1/igt@gem_exec_suspend@basic-s3@smem.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2867">i915#2867</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/bat-adlm-1/igt@gem_exec_suspend@basic-s3@smem.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>{bat-dg2-8}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7005/bat-dg2-8/igt@gem_huc_copy@huc-copy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7029">i915#7029</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/bat-dg2-8/igt@gem_huc_copy@huc-copy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>{bat-dg2-8}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7005/bat-dg2-8/igt@i915_module_load@load.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7031">i915#7031</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/bat-dg2-8/igt@i915_module_load@load.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>{bat-rpls-2}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7005/bat-rpls-2/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5537">i915#5537</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/bat-rpls-2/igt@i915_module_load@reload.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_engines:</p>
<ul>
<li>bat-dg1-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7005/bat-dg1-5/igt@i915_selftest@live@gt_engines.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4418">i915#4418</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/bat-dg1-5/igt@i915_selftest@live@gt_engines.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7005 -&gt; IGTPW_7934</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12227: 74e2443e7681e4d442b45f551ddf12d09a6f00c3 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_7934: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7934/index.html<br />
  IGT_7005: 41bf1f94200fef79486d2a7d24c31de1042094e3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@gem_exec3_balancer@parallel-ordering<br />
+igt@gem_exec3_basic@basic<br />
+igt@gem_lmem_swapping@vm_bind<br />
+igt@i915_vm_bind_basic@2m-lmem<br />
+igt@i915_vm_bind_basic@2m-smem<br />
+igt@i915_vm_bind_basic@2m-userptr<br />
+igt@i915_vm_bind_basic@64k-lmem<br />
+igt@i915_vm_bind_basic@64k-smem<br />
+igt@i915_vm_bind_basic@64k-userptr<br />
+igt@i915_vm_bind_basic@basic-lmem<br />
+igt@i915_vm_bind_basic@basic-smem<br />
+igt@i915_vm_bind_basic@basic-userptr<br />
+igt@i915_vm_bind_basic@multi_cmds-lmem<br />
+igt@i915_vm_bind_basic@multi_cmds-smem<br />
+igt@i915_vm_bind_basic@multi_cmds-userptr<br />
+igt@i915_vm_bind_basic@multi_ctxts-lmem<br />
+igt@i915_vm_bind_basic@multi_ctxts-smem<br />
+igt@i915_vm_bind_basic@multi_ctxts-userptr<br />
+igt@i915_vm_bind_basic@share_vm-lmem<br />
+igt@i915_vm_bind_basic@share_vm-smem<br />
+igt@i915_vm_bind_basic@share_vm-userptr<br />
+igt@i915_vm_bind_basic@skip_copy-lmem<br />
+igt@i915_vm_bind_basic@skip_copy-smem<br />
+igt@i915_vm_bind_basic@skip_copy-userptr<br />
+igt@i915_vm_bind_basic@skip_unbind-lmem<br />
+igt@i915_vm_bind_basic@skip_unbind-smem<br />
+igt@i915_vm_bind_basic@skip_unbind-userptr<br />
+igt@i915_vm_bind_sanity@basic-lmem<br />
+igt@i915_vm_bind_sanity@basic-smem</p>

</body>
</html>

--===============0963377429273163388==--
