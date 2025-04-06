Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5207FC36002
	for <igt-dev@archiver.kernel.org>; Sun,  6 Apr 2025 16:07:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA79010E0FB;
	Sun,  6 Apr 2025 16:07:58 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 012FB10E0AD;
 Sun,  6 Apr 2025 16:07:58 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8746251353216965090=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_***_IGT_Test_code_handling?=
 =?utf-8?q?_error_string_for_xe=5Fsysfs=5Fscheduler=2Ec_***?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sobin Thomas" <sobin.thomas@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sun, 06 Apr 2025 16:07:57 -0000
Message-ID: <174395567797.41054.73084682718329076@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250326180312.1808192-1-sobin.thomas@intel.com>
In-Reply-To: <20250326180312.1808192-1-sobin.thomas@intel.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

--===============8746251353216965090==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

=3D=3D Series Details =3D=3D

Series: *** IGT Test code handling error string for xe_sysfs_scheduler.c ***
URL   : https://patchwork.freedesktop.org/series/146824/
State : failure

=3D=3D Summary =3D=3D

CI Bug Log - changes from XEIGT_8288_FULL -> XEIGTPW_12846_FULL
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_12846_FULL absolutely need to=
 be
  verified manually.
 =20
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_12846_FULL, please notify your bug team (I915-ci-in=
fra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in C=
I.

 =20

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_128=
46_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_plane_lowres@tiling-4:
    - shard-dg2-set2:     [PASS][1] -> ([INCOMPLETE][2], [PASS][3]) +1 othe=
r test ( 1 incomplete, 1 pass )
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-436/ig=
t@kms_plane_lowres@tiling-4.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-435=
/igt@kms_plane_lowres@tiling-4.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-436=
/igt@kms_plane_lowres@tiling-4.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_mmio_probe_early:
    - shard-lnl:          [PASS][4] -> ([ABORT][5], [PASS][6])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-5/igt@=
xe_fault_injection@inject-fault-probe-function-xe_mmio_probe_early.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-6/i=
gt@xe_fault_injection@inject-fault-probe-function-xe_mmio_probe_early.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-7/i=
gt@xe_fault_injection@inject-fault-probe-function-xe_mmio_probe_early.html

  * igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create:
    - shard-bmg:          [PASS][7] -> ([PASS][8], [ABORT][9])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-4/igt@=
xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-6/i=
gt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-6/i=
gt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html

 =20
New tests
---------

  New tests have been introduced between XEIGT_8288_FULL and XEIGTPW_12846_=
FULL:

### New IGT tests (18) ###

  * igt@xe_sysfs_scheduler@job_timeout_ms-invalid-string:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_sysfs_scheduler@job_timeout_ms-invalid-string@bcs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@xe_sysfs_scheduler@job_timeout_ms-invalid-string@ccs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@xe_sysfs_scheduler@job_timeout_ms-invalid-string@rcs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@xe_sysfs_scheduler@job_timeout_ms-invalid-string@vcs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@xe_sysfs_scheduler@job_timeout_ms-invalid-string@vecs:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@xe_sysfs_scheduler@preempt_timeout_us-invalid-string:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_sysfs_scheduler@preempt_timeout_us-invalid-string@bcs:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@xe_sysfs_scheduler@preempt_timeout_us-invalid-string@ccs:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@xe_sysfs_scheduler@preempt_timeout_us-invalid-string@rcs:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@xe_sysfs_scheduler@preempt_timeout_us-invalid-string@vcs:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@xe_sysfs_scheduler@preempt_timeout_us-invalid-string@vecs:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@xe_sysfs_scheduler@timeslice_duration_us-invalid-string:
    - Statuses : 3 pass(s)
    - Exec time: [0.00] s

  * igt@xe_sysfs_scheduler@timeslice_duration_us-invalid-string@bcs:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@xe_sysfs_scheduler@timeslice_duration_us-invalid-string@ccs:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@xe_sysfs_scheduler@timeslice_duration_us-invalid-string@rcs:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@xe_sysfs_scheduler@timeslice_duration_us-invalid-string@vcs:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@xe_sysfs_scheduler@timeslice_duration_us-invalid-string@vecs:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

 =20

Known issues
------------

  Here are the changes found in XEIGTPW_12846_FULL that come from known iss=
ues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-=
mc-ccs:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][10], [SKIP][11]) ([Intel XE#255=
0] / [Intel XE#3767]) +15 other tests ( 2 skip )
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-46=
6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc=
-ccs.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-43=
5/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc=
-ccs.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][12], [SKIP][13]) ([Intel XE#873=
])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-43=
3/igt@kms_async_flips@invalid-async-flip.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-46=
4/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_async_flips@test-cursor-atomic:
    - shard-lnl:          [PASS][14] -> ([SKIP][15], [SKIP][16]) ([Intel XE=
#664])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-6/igt=
@kms_async_flips@test-cursor-atomic.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-1/=
igt@kms_async_flips@test-cursor-atomic.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-2/=
igt@kms_async_flips@test-cursor-atomic.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][17], [SKIP][18]) ([Intel XE#316=
])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-43=
6/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-46=
4/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
    - shard-lnl:          [PASS][19] -> ([INCOMPLETE][20], [PASS][21]) ([In=
tel XE#3225])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-1/igt=
@kms_big_fb@4-tiled-64bpp-rotate-180.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-6/=
igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-5/=
igt@kms_big_fb@4-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-bmg:          NOTRUN -> ([SKIP][22], [SKIP][23]) ([Intel XE#232=
7]) +3 other tests ( 2 skip )
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-3/=
igt@kms_big_fb@linear-32bpp-rotate-270.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-2/=
igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@linear-8bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2327])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-7/=
igt@kms_big_fb@linear-8bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-lnl:          NOTRUN -> ([SKIP][25], [SKIP][26]) ([Intel XE#140=
7])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-7/=
igt@kms_big_fb@x-tiled-16bpp-rotate-270.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-7/=
igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-0:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][27] ([Intel XE#4543])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-adlp-1=
/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#316]) +2 other te=
sts skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-43=
5/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-0:
    - shard-lnl:          NOTRUN -> ([SKIP][29], [SKIP][30]) ([Intel XE#112=
4]) +3 other tests ( 2 skip )
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-6/=
igt@kms_big_fb@y-tiled-16bpp-rotate-0.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-1/=
igt@kms_big_fb@y-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-180:
    - shard-bmg:          NOTRUN -> ([SKIP][31], [SKIP][32]) ([Intel XE#112=
4]) +7 other tests ( 2 skip )
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-6/=
igt@kms_big_fb@y-tiled-16bpp-rotate-180.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-6/=
igt@kms_big_fb@y-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-270:
    - shard-adlp:         NOTRUN -> [SKIP][33] ([Intel XE#316])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-adlp-1=
/igt@kms_big_fb@y-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#1124])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-43=
4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-adlp:         [PASS][35] -> [DMESG-FAIL][36] ([Intel XE#4543]) =
+11 other tests dmesg-fail
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-2/ig=
t@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-adlp-6=
/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#1124]) +7 other t=
ests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-4/=
igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-0:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][38], [SKIP][39]) ([Intel XE#112=
4]) +7 other tests ( 2 skip )
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-43=
6/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-43=
4/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         NOTRUN -> [SKIP][40] ([Intel XE#1124]) +2 other t=
ests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-adlp-6=
/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
    - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#1124])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-1/=
igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
    - shard-bmg:          NOTRUN -> ([SKIP][42], [SKIP][43]) ([Intel XE#231=
4] / [Intel XE#2894])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-3/=
igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-1/=
igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html
    - shard-dg2-set2:     NOTRUN -> ([SKIP][44], [SKIP][45]) ([Intel XE#219=
1])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-46=
3/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-43=
6/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          NOTRUN -> ([SKIP][46], [SKIP][47]) ([Intel XE#367=
])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-7/=
igt@kms_bw@linear-tiling-2-displays-1920x1080p.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-8/=
igt@kms_bw@linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#367])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-8/=
igt@kms_bw@linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-3840x2160p:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][49], [SKIP][50]) ([Intel XE#367=
]) +1 other test ( 2 skip )
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-46=
6/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-46=
6/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-4-displays-1920x1080p:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#367]) +1 other te=
st skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-3/=
igt@kms_bw@linear-tiling-4-displays-1920x1080p.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][52] ([Intel XE#787]) +168 other =
tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-43=
2/igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-a-dp-2.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:
    - shard-bmg:          NOTRUN -> ([SKIP][53], [SKIP][54]) ([Intel XE#265=
2] / [Intel XE#787]) +8 other tests ( 2 skip )
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-8/=
igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-6/=
igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-c-dp-2:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][55], [SKIP][56]) ([Intel XE#787=
]) +93 other tests ( 2 skip )
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-43=
2/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-c-dp-2.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-43=
2/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-c-dp-2.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][57], [SKIP][58]) ([Intel XE#455=
] / [Intel XE#787]) +24 other tests ( 2 skip )
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-43=
2/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-2.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-43=
2/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-2.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#2887])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-8/=
igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-ccs:
    - shard-bmg:          NOTRUN -> ([SKIP][60], [SKIP][61]) ([Intel XE#288=
7]) +10 other tests ( 2 skip )
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-4/=
igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-8/=
igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html

  * igt@kms_ccs@crc-primary-basic-yf-tiled-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][62] ([Intel XE#455] / [Intel XE#=
787]) +1 other test skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-adlp-8=
/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs.html

  * igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][63] ([Intel XE#787]) +2 other te=
sts skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-adlp-8=
/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][64] ([Intel XE#2907])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-43=
2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-bmg:          NOTRUN -> ([SKIP][65], [SKIP][66]) ([Intel XE#343=
2]) +1 other test ( 2 skip )
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-6/=
igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-1/=
igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][67] ([Intel XE#3432])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-5/=
igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][68] ([Intel XE#2907])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-adlp-2=
/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> ([SKIP][69], [SKIP][70]) ([Intel XE#266=
9]) +3 other tests ( 2 skip )
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-1/=
igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-edp-1.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-6/=
igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-edp-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][71] ([Intel XE#455] / [Intel XE#=
787]) +33 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-43=
6/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#2887]) +2 other t=
ests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-6/=
igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [PASS][73] -> ([PASS][74], [INCOMPLETE][75]) ([In=
tel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-464/i=
gt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-46=
3/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-43=
6/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> ([SKIP][76], [SKIP][77]) ([Intel XE#288=
7]) +2 other tests ( 2 skip )
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-3/=
igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-7/=
igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4:
    - shard-dg2-set2:     [PASS][78] -> ([PASS][79], [INCOMPLETE][80]) ([In=
tel XE#2705] / [Intel XE#4212]) +1 other test ( 1 incomplete, 1 pass )
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-434/i=
gt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-46=
3/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-43=
3/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [PASS][81] -> ([PASS][82], [INCOMPLETE][83]) ([In=
tel XE#1727] / [Intel XE#3113] / [Intel XE#3124])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-464/i=
gt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-46=
3/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-43=
6/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][84], [SKIP][85]) ([Intel XE#290=
7])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-43=
3/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-43=
5/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][86] ([Intel XE#2652] / [Intel XE=
#787]) +12 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-2/=
igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][87], [SKIP][88]) ([Intel XE#441=
6]) +3 other tests ( 2 skip )
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-43=
4/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-43=
3/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-bmg:          NOTRUN -> ([SKIP][89], [SKIP][90]) ([Intel XE#232=
5]) +1 other test ( 2 skip )
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-2/=
igt@kms_chamelium_color@ctm-max.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-7/=
igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-bmg:          NOTRUN -> [SKIP][91] ([Intel XE#2325])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-2/=
igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_color@degamma:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][92], [SKIP][93]) ([Intel XE#306=
]) +1 other test ( 2 skip )
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-43=
2/igt@kms_chamelium_color@degamma.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-46=
6/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_color@gamma:
    - shard-lnl:          NOTRUN -> ([SKIP][94], [SKIP][95]) ([Intel XE#306=
])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-3/=
igt@kms_chamelium_color@gamma.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-3/=
igt@kms_chamelium_color@gamma.html
    - shard-adlp:         NOTRUN -> [SKIP][96] ([Intel XE#306])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-adlp-9=
/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_frames@hdmi-aspect-ratio:
    - shard-bmg:          NOTRUN -> [SKIP][97] ([Intel XE#2252]) +4 other t=
ests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-7/=
igt@kms_chamelium_frames@hdmi-aspect-ratio.html

  * igt@kms_chamelium_frames@hdmi-crc-fast:
    - shard-adlp:         NOTRUN -> [SKIP][98] ([Intel XE#373])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-adlp-2=
/igt@kms_chamelium_frames@hdmi-crc-fast.html
    - shard-lnl:          NOTRUN -> ([SKIP][99], [SKIP][100]) ([Intel XE#37=
3]) +1 other test ( 2 skip )
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-2/=
igt@kms_chamelium_frames@hdmi-crc-fast.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-5=
/igt@kms_chamelium_frames@hdmi-crc-fast.html

  * igt@kms_chamelium_frames@vga-frame-dump:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][101], [SKIP][102]) ([Intel XE#3=
73]) +2 other tests ( 2 skip )
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
34/igt@kms_chamelium_frames@vga-frame-dump.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
33/igt@kms_chamelium_frames@vga-frame-dump.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - shard-bmg:          NOTRUN -> ([SKIP][103], [SKIP][104]) ([Intel XE#2=
252]) +5 other tests ( 2 skip )
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-7=
/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-6=
/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
    - shard-lnl:          NOTRUN -> [SKIP][105] ([Intel XE#373])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-3=
/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][106] ([Intel XE#1178]) +2 other =
tests fail
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
32/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html

  * igt@kms_content_protection@atomic@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> ([FAIL][107], [FAIL][108]) ([Intel XE#1=
178])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-2=
/igt@kms_content_protection@atomic@pipe-a-dp-2.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-2=
/igt@kms_content_protection@atomic@pipe-a-dp-2.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-bmg:          NOTRUN -> ([SKIP][109], [SKIP][110]) ([Intel XE#2=
390])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-4=
/igt@kms_content_protection@dp-mst-lic-type-1.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-6=
/igt@kms_content_protection@dp-mst-lic-type-1.html
    - shard-adlp:         NOTRUN -> [SKIP][111] ([Intel XE#307])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-adlp-=
2/igt@kms_content_protection@dp-mst-lic-type-1.html
    - shard-lnl:          NOTRUN -> ([SKIP][112], [SKIP][113]) ([Intel XE#3=
07])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-8=
/igt@kms_content_protection@dp-mst-lic-type-1.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-5=
/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][114] ([Intel XE#3304])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
63/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html

  * igt@kms_content_protection@mei-interface:
    - shard-bmg:          NOTRUN -> ([SKIP][115], [SKIP][116]) ([Intel XE#2=
341])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-2=
/igt@kms_content_protection@mei-interface.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-8=
/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@uevent:
    - shard-bmg:          NOTRUN -> ([SKIP][117], [FAIL][118]) ([Intel XE#1=
188] / [Intel XE#2341])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-6=
/igt@kms_content_protection@uevent.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-2=
/igt@kms_content_protection@uevent.html

  * igt@kms_content_protection@uevent@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][119] ([Intel XE#1188])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-2=
/igt@kms_content_protection@uevent@pipe-a-dp-2.html

  * igt@kms_content_protection@uevent@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][120] ([Intel XE#1188])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
33/igt@kms_content_protection@uevent@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-offscreen-128x42:
    - shard-adlp:         [PASS][121] -> [DMESG-WARN][122] ([Intel XE#4173]=
) +12 other tests dmesg-warn
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-9/i=
gt@kms_cursor_crc@cursor-offscreen-128x42.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-adlp-=
8/igt@kms_cursor_crc@cursor-offscreen-128x42.html

  * igt@kms_cursor_crc@cursor-offscreen-256x85:
    - shard-bmg:          NOTRUN -> [SKIP][123] ([Intel XE#2320]) +2 other =
tests skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-6=
/igt@kms_cursor_crc@cursor-offscreen-256x85.html

  * igt@kms_cursor_crc@cursor-offscreen-32x32:
    - shard-lnl:          NOTRUN -> [SKIP][124] ([Intel XE#1424])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-8=
/igt@kms_cursor_crc@cursor-offscreen-32x32.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][125], [SKIP][126]) ([Intel XE#3=
08])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
33/igt@kms_cursor_crc@cursor-onscreen-512x512.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
35/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-bmg:          NOTRUN -> ([SKIP][127], [SKIP][128]) ([Intel XE#2=
320]) +1 other test ( 2 skip )
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-6=
/igt@kms_cursor_crc@cursor-random-32x32.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-8=
/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-random-max-size:
    - shard-lnl:          NOTRUN -> ([SKIP][129], [SKIP][130]) ([Intel XE#1=
424]) +1 other test ( 2 skip )
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-3=
/igt@kms_cursor_crc@cursor-random-max-size.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-5=
/igt@kms_cursor_crc@cursor-random-max-size.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-bmg:          NOTRUN -> [SKIP][131] ([Intel XE#2321]) +1 other =
test skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-8=
/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-bmg:          [PASS][132] -> ([PASS][133], [SKIP][134]) ([Intel=
 XE#2291]) +2 other tests ( 1 pass, 1 skip )
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-7/ig=
t@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-7=
/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-6=
/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-bmg:          NOTRUN -> ([SKIP][135], [SKIP][136]) ([Intel XE#2=
286])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-4=
/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-1=
/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][137], [SKIP][138]) ([Intel XE#3=
23])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
63/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
34/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-dg2-set2:     [PASS][139] -> ([SKIP][140], [PASS][141]) ([Intel=
 XE#309]) +4 other tests ( 1 pass, 1 skip )
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-432/=
igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
64/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
35/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
    - shard-bmg:          NOTRUN -> ([PASS][142], [SKIP][143]) ([Intel XE#2=
291])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-3=
/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-6=
/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-bmg:          NOTRUN -> [SKIP][144] ([Intel XE#2286])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-7=
/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> [SKIP][145] ([Intel XE#1508])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-7=
/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-bmg:          [PASS][146] -> ([PASS][147], [SKIP][148]) ([Intel=
 XE#1340])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-4/ig=
t@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-2=
/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-6=
/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> ([SKIP][149], [SKIP][150]) ([Intel XE#1=
340])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-2=
/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-6=
/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3.html

  * igt@kms_dp_aux_dev:
    - shard-bmg:          NOTRUN -> ([SKIP][151], [PASS][152]) ([Intel XE#3=
009])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-6=
/igt@kms_dp_aux_dev.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-7=
/igt@kms_dp_aux_dev.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-dg2-set2:     NOTRUN -> [SKIP][153] ([Intel XE#4331])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
64/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-bmg:          NOTRUN -> ([SKIP][154], [SKIP][155]) ([Intel XE#2=
244])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-8=
/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-7=
/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][156], [SKIP][157]) ([Intel XE#4=
55]) +13 other tests ( 2 skip )
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
34/igt@kms_dsc@dsc-with-bpc-formats.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
35/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][158], [SKIP][159]) ([Intel XE#4=
422])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
63/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
36/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
    - shard-adlp:         NOTRUN -> [SKIP][160] ([Intel XE#4422])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-adlp-=
2/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html
    - shard-bmg:          NOTRUN -> [SKIP][161] ([Intel XE#4422])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-6=
/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html
    - shard-lnl:          NOTRUN -> ([SKIP][162], [SKIP][163]) ([Intel XE#4=
422])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-5=
/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-6=
/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:
    - shard-bmg:          NOTRUN -> ([SKIP][164], [SKIP][165]) ([Intel XE#4=
422]) +1 other test ( 2 skip )
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-8=
/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-6=
/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html

  * igt@kms_flip@2x-absolute-wf_vblank:
    - shard-dg2-set2:     [PASS][166] -> [SKIP][167] ([Intel XE#310])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-432/=
igt@kms_flip@2x-absolute-wf_vblank.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
64/igt@kms_flip@2x-absolute-wf_vblank.html

  * igt@kms_flip@2x-absolute-wf_vblank-interruptible:
    - shard-dg2-set2:     [PASS][168] -> ([SKIP][169], [SKIP][170]) ([Intel=
 XE#310])
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-433/=
igt@kms_flip@2x-absolute-wf_vblank-interruptible.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
64/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
64/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html
    - shard-bmg:          NOTRUN -> [SKIP][171] ([Intel XE#2316])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-6=
/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
    - shard-bmg:          [PASS][172] -> [SKIP][173] ([Intel XE#2316]) +2 o=
ther tests skip
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-3/ig=
t@kms_flip@2x-flip-vs-blocking-wf-vblank.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-6=
/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-bmg:          NOTRUN -> ([PASS][174], [SKIP][175]) ([Intel XE#2=
316]) +2 other tests ( 1 pass, 1 skip )
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-2=
/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-6=
/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3:
    - shard-bmg:          [PASS][176] -> [FAIL][177] ([Intel XE#3321])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-2/ig=
t@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-7=
/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:
    - shard-bmg:          [PASS][178] -> ([FAIL][179], [PASS][180]) ([Intel=
 XE#3321])
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-1/ig=
t@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-3=
/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-3=
/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][181] -> ([PASS][182], [FAIL][183]) ([Intel=
 XE#301]) +1 other test ( 1 fail, 1 pass )
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-434/=
igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
66/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
63/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3:
    - shard-bmg:          [PASS][184] -> ([FAIL][185], [FAIL][186]) ([Intel=
 XE#3321])
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-1/ig=
t@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-3=
/igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-3=
/igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-modeset:
    - shard-dg2-set2:     [PASS][187] -> ([PASS][188], [SKIP][189]) ([Intel=
 XE#310]) +9 other tests ( 1 pass, 1 skip )
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-463/=
igt@kms_flip@2x-flip-vs-modeset.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
35/igt@kms_flip@2x-flip-vs-modeset.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
64/igt@kms_flip@2x-flip-vs-modeset.html

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
    - shard-lnl:          NOTRUN -> ([SKIP][190], [SKIP][191]) ([Intel XE#1=
421]) +5 other tests ( 2 skip )
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-6=
/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-2=
/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-lnl:          NOTRUN -> [SKIP][192] ([Intel XE#1421])
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-1=
/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@2x-plain-flip:
    - shard-bmg:          [PASS][193] -> ([SKIP][194], [PASS][195]) ([Intel=
 XE#2316]) +6 other tests ( 1 pass, 1 skip )
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-7/ig=
t@kms_flip@2x-plain-flip.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-4=
/igt@kms_flip@2x-plain-flip.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-7=
/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-bmg:          NOTRUN -> [FAIL][196] ([Intel XE#2882]) +1 other =
test fail
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-1=
/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ac-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][197] -> [FAIL][198] ([Intel XE#2882]) +3 o=
ther tests fail
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-433/=
igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ac-hdmi-a6-dp4.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
34/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ac-hdmi-a6-dp4.html

  * igt@kms_flip@2x-plain-flip-interruptible:
    - shard-bmg:          [PASS][199] -> ([SKIP][200], [SKIP][201]) ([Intel=
 XE#2316]) +2 other tests ( 2 skip )
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-3/ig=
t@kms_flip@2x-plain-flip-interruptible.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-6=
/igt@kms_flip@2x-plain-flip-interruptible.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-4=
/igt@kms_flip@2x-plain-flip-interruptible.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][202], [PASS][203]) ([Intel XE#3=
10])
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
64/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.=
html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
34/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.=
html

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
    - shard-adlp:         NOTRUN -> [SKIP][204] ([Intel XE#310]) +4 other t=
ests skip
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-adlp-=
2/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-lnl:          [PASS][205] -> ([PASS][206], [FAIL][207]) ([Intel=
 XE#886]) +3 other tests ( 1 fail, 1 pass )
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-4/ig=
t@kms_flip@flip-vs-absolute-wf_vblank.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-4=
/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-3=
/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank:
    - shard-dg2-set2:     [PASS][208] -> [INCOMPLETE][209] ([Intel XE#2049])
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-432/=
igt@kms_flip@flip-vs-blocking-wf-vblank.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
36/igt@kms_flip@flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][210] ([Intel XE#2049])
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
36/igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][211] ([Intel XE#301])
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
33/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a6:
    - shard-dg2-set2:     NOTRUN -> ([FAIL][212], [PASS][213]) ([Intel XE#3=
01])
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
64/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a6.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
33/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a6.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6:
    - shard-dg2-set2:     NOTRUN -> ([FAIL][214], [FAIL][215]) ([Intel XE#3=
01]) +1 other test ( 2 fail )
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
64/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
33/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6.html

  * igt@kms_flip@flip-vs-panning@c-dp4:
    - shard-dg2-set2:     [PASS][216] -> ([PASS][217], [INCOMPLETE][218]) (=
[Intel XE#2049]) +1 other test ( 1 incomplete, 1 pass )
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-434/=
igt@kms_flip@flip-vs-panning@c-dp4.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
66/igt@kms_flip@flip-vs-panning@c-dp4.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
34/igt@kms_flip@flip-vs-panning@c-dp4.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-bmg:          NOTRUN -> ([PASS][219], [INCOMPLETE][220]) ([Inte=
l XE#2049] / [Intel XE#2597]) +1 other test ( 1 incomplete, 1 pass )
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-7=
/igt@kms_flip@flip-vs-suspend-interruptible.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-3=
/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend@d-dp4:
    - shard-dg2-set2:     NOTRUN -> ([INCOMPLETE][221], [PASS][222]) ([Inte=
l XE#2049] / [Intel XE#2597]) +1 other test ( 1 incomplete, 1 pass )
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
33/igt@kms_flip@flip-vs-suspend@d-dp4.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
66/igt@kms_flip@flip-vs-suspend@d-dp4.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@a-dp2:
    - shard-bmg:          [PASS][223] -> ([PASS][224], [FAIL][225]) ([Intel=
 XE#2882]) +1 other test ( 1 fail, 1 pass )
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-4/ig=
t@kms_flip@wf_vblank-ts-check-interruptible@a-dp2.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-4=
/igt@kms_flip@wf_vblank-ts-check-interruptible@a-dp2.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-2=
/igt@kms_flip@wf_vblank-ts-check-interruptible@a-dp2.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-adlp:         NOTRUN -> [SKIP][226] ([Intel XE#455]) +3 other t=
ests skip
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-adlp-=
4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html
    - shard-bmg:          NOTRUN -> ([SKIP][227], [SKIP][228]) ([Intel XE#2=
293] / [Intel XE#2380]) +5 other tests ( 2 skip )
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-8=
/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-2=
/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html
    - shard-lnl:          NOTRUN -> ([SKIP][229], [SKIP][230]) ([Intel XE#1=
401] / [Intel XE#1745])
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-1=
/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-4=
/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pi=
pe-a-default-mode:
    - shard-lnl:          NOTRUN -> ([SKIP][231], [SKIP][232]) ([Intel XE#1=
401])
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-4=
/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-=
a-default-mode.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-1=
/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-=
a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upsca=
ling:
    - shard-bmg:          NOTRUN -> [SKIP][233] ([Intel XE#2293] / [Intel X=
E#2380])
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-2=
/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscalin=
g.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upsca=
ling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][234] ([Intel XE#2293])
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-2=
/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscalin=
g@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][235] ([Intel XE#455]) +2 other t=
ests skip
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
64/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.ht=
ml

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pip=
e-a-valid-mode:
    - shard-adlp:         [PASS][236] -> [DMESG-FAIL][237] ([Intel XE#324] =
/ [Intel XE#4543]) +3 other tests dmesg-fail
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-8/i=
gt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-v=
alid-mode.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-adlp-=
1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-=
a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upsca=
ling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> ([SKIP][238], [SKIP][239]) ([Intel XE#2=
293]) +5 other tests ( 2 skip )
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-7=
/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscalin=
g@pipe-a-valid-mode.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-1=
/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscalin=
g@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-plflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][240] ([Intel XE#651])
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-6=
/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> ([SKIP][241], [SKIP][242]) ([Intel XE#2=
312]) +1 other test ( 2 skip )
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-6=
/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-6=
/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][243] ([Intel XE#2312]) +3 other =
tests skip
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-4=
/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][244], [SKIP][245]) ([Intel XE#6=
51] / [Intel XE#656]) +2 other tests ( 2 skip )
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
36/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-blt.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
64/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> ([SKIP][246], [SKIP][247]) ([Intel XE#2=
311] / [Intel XE#2312]) +4 other tests ( 2 skip )
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-6=
/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-1=
/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move:
    - shard-adlp:         NOTRUN -> [SKIP][248] ([Intel XE#656]) +5 other t=
ests skip
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-adlp-=
9/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][249], [SKIP][250]) ([Intel XE#6=
51]) +9 other tests ( 2 skip )
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
36/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
32/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:
    - shard-lnl:          NOTRUN -> ([SKIP][251], [SKIP][252]) ([Intel XE#6=
56]) +7 other tests ( 2 skip )
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-3=
/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-8=
/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render:
    - shard-dg2-set2:     [PASS][253] -> ([PASS][254], [SKIP][255]) ([Intel=
 XE#656]) +7 other tests ( 1 pass, 1 skip )
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-435/=
igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
66/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
64/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     [PASS][256] -> ([SKIP][257], [SKIP][258]) ([Intel=
 XE#656]) +1 other test ( 2 skip )
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-435/=
igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
64/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
64/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt:
    - shard-dg2-set2:     [PASS][259] -> [SKIP][260] ([Intel XE#656]) +1 ot=
her test skip
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-466/=
igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
64/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> ([SKIP][261], [SKIP][262]) ([Intel XE#2=
312] / [Intel XE#4141])
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-2=
/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-6=
/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][263] ([Intel XE#4141]) +6 other =
tests skip
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-7=
/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-linear:
    - shard-bmg:          NOTRUN -> ([SKIP][264], [SKIP][265]) ([Intel XE#4=
141]) +7 other tests ( 2 skip )
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-4=
/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-4=
/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt:
    - shard-lnl:          NOTRUN -> ([SKIP][266], [SKIP][267]) ([Intel XE#6=
51]) +2 other tests ( 2 skip )
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-1=
/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-6=
/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][268] ([Intel XE#651]) +1 other t=
est skip
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-adlp-=
8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-render.ht=
ml

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][269] ([Intel XE#2311]) +8 other =
tests skip
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-2=
/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> ([SKIP][270], [SKIP][271]) ([Intel XE#2=
311]) +17 other tests ( 2 skip )
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-3=
/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.ht=
ml
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-2=
/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.ht=
ml

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][272] ([Intel XE#651]) +3 other t=
ests skip
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
35/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc.=
html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-fullscreen:
    - shard-adlp:         NOTRUN -> [SKIP][273] ([Intel XE#653]) +1 other t=
est skip
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-adlp-=
4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][274] ([Intel XE#2313]) +13 other=
 tests skip
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-8=
/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> ([SKIP][275], [SKIP][276]) ([Intel XE#2=
312] / [Intel XE#2313]) +4 other tests ( 2 skip )
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-6=
/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-3=
/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-suspend:
    - shard-lnl:          [PASS][277] -> ([DMESG-WARN][278], [PASS][279]) (=
[Intel XE#2932]) +6 other tests ( 1 dmesg-warn, 1 pass )
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-1/ig=
t@kms_frontbuffer_tracking@fbcpsr-suspend.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-1=
/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-8=
/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-adlp:         NOTRUN -> [SKIP][280] ([Intel XE#4439])
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-adlp-=
8/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
    - shard-bmg:          NOTRUN -> ([SKIP][281], [SKIP][282]) ([Intel XE#4=
439])
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-8=
/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-3=
/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][283], [SKIP][284]) ([Intel XE#6=
53]) +8 other tests ( 2 skip )
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
64/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
35/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][285] ([Intel XE#656]) +2 other t=
ests skip
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
64/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][286] ([Intel XE#656]) +1 other t=
est skip
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-8=
/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][287], [SKIP][288]) ([Intel XE#6=
53] / [Intel XE#656]) +2 other tests ( 2 skip )
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
64/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
66/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][289] ([Intel XE#653]) +4 other t=
ests skip
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
63/igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> ([SKIP][290], [SKIP][291]) ([Intel XE#2=
313]) +16 other tests ( 2 skip )
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-6=
/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-2=
/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [PASS][292] -> ([SKIP][293], [PASS][294]) ([Intel=
 XE#1503])
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-2/ig=
t@kms_hdr@invalid-hdr.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-1=
/igt@kms_hdr@invalid-hdr.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-2=
/igt@kms_hdr@invalid-hdr.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-dg2-set2:     [PASS][295] -> ([PASS][296], [SKIP][297]) ([Intel=
 XE#4328])
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-463/=
igt@kms_joiner@basic-force-big-joiner.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
32/igt@kms_joiner@basic-force-big-joiner.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
64/igt@kms_joiner@basic-force-big-joiner.html
    - shard-bmg:          [PASS][298] -> ([PASS][299], [SKIP][300]) ([Intel=
 XE#3012])
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-3/ig=
t@kms_joiner@basic-force-big-joiner.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-7=
/igt@kms_joiner@basic-force-big-joiner.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-6=
/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-bmg:          NOTRUN -> [SKIP][301] ([Intel XE#4329])
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-7=
/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-1-size-64:
    - shard-adlp:         [PASS][302] -> [FAIL][303] ([Intel XE#1471]) +1 o=
ther test fail
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-2/i=
gt@kms_plane_cursor@overlay@pipe-a-hdmi-a-1-size-64.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-adlp-=
1/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-1-size-64.html

  * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:
    - shard-dg2-set2:     [PASS][304] -> ([FAIL][305], [PASS][306]) ([Intel=
 XE#616]) +1 other test ( 1 fail, 1 pass )
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-434/=
igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
36/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
64/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-bmg:          [PASS][307] -> [SKIP][308] ([Intel XE#2571])
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-2/ig=
t@kms_plane_scaling@2x-scaler-multi-pipe.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-6=
/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
    - shard-dg2-set2:     [PASS][309] -> [SKIP][310] ([Intel XE#309]) +1 ot=
her test skip
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-432/=
igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
64/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-dg2-set2:     NOTRUN -> [ABORT][311] ([Intel XE#4540]) +1 other=
 test abort
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
32/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][312] ([Intel XE#4212])
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
32/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-2.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a:
    - shard-bmg:          NOTRUN -> ([SKIP][313], [SKIP][314]) ([Intel XE#2=
763]) +9 other tests ( 2 skip )
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-1=
/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-8=
/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b:
    - shard-bmg:          NOTRUN -> [SKIP][315] ([Intel XE#2763]) +4 other =
tests skip
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-8=
/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b.ht=
ml

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-bmg:          NOTRUN -> ([SKIP][316], [SKIP][317]) ([Intel XE#8=
70]) +1 other test ( 2 skip )
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-6=
/igt@kms_pm_backlight@fade-with-dpms.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-8=
/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-bmg:          NOTRUN -> ([SKIP][318], [SKIP][319]) ([Intel XE#2=
391])
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-4=
/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-8=
/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-dpms:
    - shard-lnl:          [PASS][320] -> ([FAIL][321], [PASS][322]) ([Intel=
 XE#718]) +1 other test ( 1 fail, 1 pass )
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-5/ig=
t@kms_pm_dc@dc5-dpms.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-6=
/igt@kms_pm_dc@dc5-dpms.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-6=
/igt@kms_pm_dc@dc5-dpms.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-bmg:          NOTRUN -> ([SKIP][323], [SKIP][324]) ([Intel XE#2=
505])
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-7=
/igt@kms_pm_dc@deep-pkgc.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-2=
/igt@kms_pm_dc@deep-pkgc.html
    - shard-dg2-set2:     NOTRUN -> ([SKIP][325], [SKIP][326]) ([Intel XE#9=
08])
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
32/igt@kms_pm_dc@deep-pkgc.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
33/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][327] ([Intel XE#1439] / [Intel X=
E#836])
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-7=
/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> ([SKIP][328], [SKIP][329]) ([Intel XE#1=
489]) +4 other tests ( 2 skip )
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-1=
/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-8=
/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:
    - shard-lnl:          NOTRUN -> [SKIP][330] ([Intel XE#2893])
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-2=
/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][331] ([Intel XE#1489]) +2 other =
tests skip
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-3=
/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][332] ([Intel XE#1489]) +1 other =
test skip
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
35/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
    - shard-lnl:          NOTRUN -> ([SKIP][333], [SKIP][334]) ([Intel XE#2=
893])
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-7=
/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-5=
/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html
    - shard-adlp:         NOTRUN -> [SKIP][335] ([Intel XE#1489]) +1 other =
test skip
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-adlp-=
4/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][336], [SKIP][337]) ([Intel XE#1=
489]) +1 other test ( 2 skip )
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
63/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
33/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr@fbc-psr-primary-render:
    - shard-adlp:         NOTRUN -> [SKIP][338] ([Intel XE#2850] / [Intel X=
E#929]) +3 other tests skip
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-adlp-=
2/igt@kms_psr@fbc-psr-primary-render.html
    - shard-bmg:          NOTRUN -> [SKIP][339] ([Intel XE#2234] / [Intel X=
E#2850]) +4 other tests skip
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-1=
/igt@kms_psr@fbc-psr-primary-render.html

  * igt@kms_psr@fbc-psr-sprite-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][340] ([Intel XE#2850] / [Intel X=
E#929]) +3 other tests skip
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
32/igt@kms_psr@fbc-psr-sprite-blt.html

  * igt@kms_psr@fbc-psr2-basic@edp-1:
    - shard-lnl:          NOTRUN -> ([FAIL][341], [FAIL][342]) ([Intel XE#4=
568]) +1 other test ( 2 fail )
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-1=
/igt@kms_psr@fbc-psr2-basic@edp-1.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-2=
/igt@kms_psr@fbc-psr2-basic@edp-1.html

  * igt@kms_psr@fbc-psr2-cursor-plane-move:
    - shard-bmg:          NOTRUN -> ([SKIP][343], [SKIP][344]) ([Intel XE#2=
234] / [Intel XE#2850]) +9 other tests ( 2 skip )
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-4=
/igt@kms_psr@fbc-psr2-cursor-plane-move.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-3=
/igt@kms_psr@fbc-psr2-cursor-plane-move.html

  * igt@kms_psr@fbc-psr2-dpms:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][345], [SKIP][346]) ([Intel XE#2=
850] / [Intel XE#929]) +7 other tests ( 2 skip )
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
36/igt@kms_psr@fbc-psr2-dpms.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
35/igt@kms_psr@fbc-psr2-dpms.html

  * igt@kms_psr@pr-primary-page-flip:
    - shard-lnl:          NOTRUN -> ([SKIP][347], [SKIP][348]) ([Intel XE#1=
406]) +1 other test ( 2 skip )
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-4=
/igt@kms_psr@pr-primary-page-flip.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-4=
/igt@kms_psr@pr-primary-page-flip.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-bmg:          NOTRUN -> ([SKIP][349], [SKIP][350]) ([Intel XE#2=
414])
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-6=
/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-3=
/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
    - shard-dg2-set2:     NOTRUN -> ([SKIP][351], [SKIP][352]) ([Intel XE#2=
939])
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
66/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
35/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-bmg:          NOTRUN -> ([SKIP][353], [SKIP][354]) ([Intel XE#3=
414] / [Intel XE#3904])
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-6=
/igt@kms_rotation_crc@bad-pixel-format.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-7=
/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-bmg:          NOTRUN -> [SKIP][355] ([Intel XE#1435]) +2 other =
tests skip
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-4=
/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-bmg:          [PASS][356] -> ([PASS][357], [SKIP][358]) ([Intel=
 XE#1435])
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-2/ig=
t@kms_setmode@invalid-clone-single-crtc-stealing.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-8=
/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-4=
/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
    - shard-dg2-set2:     [PASS][359] -> ([PASS][360], [SKIP][361]) ([Intel=
 XE#455])
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-432/=
igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
34/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
64/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          NOTRUN -> ([SKIP][362], [SKIP][363]) ([Intel XE#2=
426])
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-4=
/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-7=
/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
    - shard-lnl:          [PASS][364] -> ([FAIL][365], [FAIL][366]) ([Intel=
 XE#771] / [Intel XE#899])
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-5/ig=
t@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-8=
/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-3=
/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1:
    - shard-adlp:         [PASS][367] -> [FAIL][368] ([Intel XE#899])
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-4/i=
gt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-adlp-=
2/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [PASS][369] -> [FAIL][370] ([Intel XE#4459]) +1 o=
ther test fail
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-1/ig=
t@kms_vrr@cmrr@pipe-a-edp-1.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-5=
/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@kms_vrr@max-min:
    - shard-bmg:          NOTRUN -> [SKIP][371] ([Intel XE#1499])
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-8=
/igt@kms_vrr@max-min.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-lnl:          NOTRUN -> [SKIP][372] ([Intel XE#1499])
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-4=
/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@kms_writeback@writeback-check-output:
    - shard-bmg:          NOTRUN -> ([SKIP][373], [SKIP][374]) ([Intel XE#7=
56])
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-2=
/igt@kms_writeback@writeback-check-output.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-7=
/igt@kms_writeback@writeback-check-output.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-bmg:          NOTRUN -> [SKIP][375] ([Intel XE#756])
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-8=
/igt@kms_writeback@writeback-check-output-xrgb2101010.html
    - shard-dg2-set2:     NOTRUN -> ([SKIP][376], [SKIP][377]) ([Intel XE#7=
56])
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
36/igt@kms_writeback@writeback-check-output-xrgb2101010.html
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
34/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@xe_ccs@block-copy-compressed-inc-dimension:
    - shard-adlp:         NOTRUN -> [SKIP][378] ([Intel XE#455] / [Intel XE=
#488])
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-adlp-=
1/igt@xe_ccs@block-copy-compressed-inc-dimension.html

  * igt@xe_eudebug@basic-vm-access-parameters:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][379], [SKIP][380]) ([Intel XE#2=
905]) +4 other tests ( 2 skip )
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
66/igt@xe_eudebug@basic-vm-access-parameters.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
64/igt@xe_eudebug@basic-vm-access-parameters.html

  * igt@xe_eudebug@basic-vm-access-parameters-userptr:
    - shard-lnl:          NOTRUN -> ([SKIP][381], [SKIP][382]) ([Intel XE#2=
905] / [Intel XE#3889])
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-4=
/igt@xe_eudebug@basic-vm-access-parameters-userptr.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-8=
/igt@xe_eudebug@basic-vm-access-parameters-userptr.html

  * igt@xe_eudebug@discovery-race-sigint:
    - shard-bmg:          NOTRUN -> ([SKIP][383], [SKIP][384]) ([Intel XE#2=
905] / [Intel XE#4259])
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-4=
/igt@xe_eudebug@discovery-race-sigint.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-6=
/igt@xe_eudebug@discovery-race-sigint.html

  * igt@xe_eudebug@multigpu-basic-client-many:
    - shard-lnl:          NOTRUN -> [SKIP][385] ([Intel XE#2905])
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-1=
/igt@xe_eudebug@multigpu-basic-client-many.html
    - shard-adlp:         NOTRUN -> [SKIP][386] ([Intel XE#2905])
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-adlp-=
4/igt@xe_eudebug@multigpu-basic-client-many.html

  * igt@xe_eudebug@read-metadata:
    - shard-bmg:          NOTRUN -> [SKIP][387] ([Intel XE#2905]) +3 other =
tests skip
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-7=
/igt@xe_eudebug@read-metadata.html

  * igt@xe_eudebug_online@basic-breakpoint:
    - shard-bmg:          NOTRUN -> ([SKIP][388], [SKIP][389]) ([Intel XE#2=
905]) +5 other tests ( 2 skip )
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-6=
/igt@xe_eudebug_online@basic-breakpoint.html
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-7=
/igt@xe_eudebug_online@basic-breakpoint.html

  * igt@xe_eudebug_online@set-breakpoint-sigint-debugger:
    - shard-adlp:         NOTRUN -> [SKIP][390] ([Intel XE#4577])
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-adlp-=
4/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html
    - shard-bmg:          NOTRUN -> [SKIP][391] ([Intel XE#4577])
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-2=
/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html
    - shard-lnl:          NOTRUN -> ([SKIP][392], [SKIP][393]) ([Intel XE#4=
577])
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-4=
/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-6=
/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html

  * igt@xe_eudebug_sriov@deny-eudebug:
    - shard-lnl:          NOTRUN -> ([SKIP][394], [SKIP][395]) ([Intel XE#4=
518])
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-5=
/igt@xe_eudebug_sriov@deny-eudebug.html
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-8=
/igt@xe_eudebug_sriov@deny-eudebug.html
    - shard-adlp:         NOTRUN -> [SKIP][396] ([Intel XE#4519])
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-adlp-=
2/igt@xe_eudebug_sriov@deny-eudebug.html
    - shard-bmg:          NOTRUN -> ([SKIP][397], [SKIP][398]) ([Intel XE#4=
518])
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-4=
/igt@xe_eudebug_sriov@deny-eudebug.html
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-6=
/igt@xe_eudebug_sriov@deny-eudebug.html

  * igt@xe_eudebug_sriov@deny-sriov:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][399], [SKIP][400]) ([Intel XE#4=
518])
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
34/igt@xe_eudebug_sriov@deny-sriov.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
66/igt@xe_eudebug_sriov@deny-sriov.html

  * igt@xe_evict@evict-beng-large-external-cm:
    - shard-lnl:          NOTRUN -> ([SKIP][401], [SKIP][402]) ([Intel XE#6=
88])
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-6=
/igt@xe_evict@evict-beng-large-external-cm.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-8=
/igt@xe_evict@evict-beng-large-external-cm.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind:
    - shard-dg2-set2:     [PASS][403] -> ([SKIP][404], [SKIP][405]) ([Intel=
 XE#1392])
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-435/=
igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind.html
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
32/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind.=
html
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
32/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind.=
html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userpt=
r:
    - shard-bmg:          NOTRUN -> [SKIP][406] ([Intel XE#2322]) +3 other =
tests skip
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-2=
/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.h=
tml

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-r=
ace:
    - shard-dg2-set2:     [PASS][407] -> [SKIP][408] ([Intel XE#1392])
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-464/=
igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.=
html
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
32/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-ra=
ce.html

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:
    - shard-adlp:         NOTRUN -> [SKIP][409] ([Intel XE#1392])
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-adlp-=
6/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html
    - shard-lnl:          NOTRUN -> ([SKIP][410], [SKIP][411]) ([Intel XE#1=
392]) +1 other test ( 2 skip )
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-2=
/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-8=
/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:
    - shard-dg2-set2:     [PASS][412] -> ([PASS][413], [SKIP][414]) ([Intel=
 XE#1392]) +3 other tests ( 1 pass, 1 skip )
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-463/=
igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
66/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
32/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:
    - shard-dg2-set2:     NOTRUN -> ([PASS][415], [SKIP][416]) ([Intel XE#1=
392]) +1 other test ( 1 pass, 1 skip )
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
66/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
32/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html

  * igt@xe_exec_basic@multigpu-once-null-rebind:
    - shard-bmg:          NOTRUN -> ([SKIP][417], [SKIP][418]) ([Intel XE#2=
322]) +5 other tests ( 2 skip )
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-3=
/igt@xe_exec_basic@multigpu-once-null-rebind.html
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-1=
/igt@xe_exec_basic@multigpu-once-null-rebind.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][419] ([Intel XE#288]) +2 other t=
ests skip
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
63/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-prefetch:
    - shard-adlp:         NOTRUN -> [SKIP][420] ([Intel XE#288]) +3 other t=
ests skip
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-adlp-=
2/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-prefetch.html

  * igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-imm:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][421], [SKIP][422]) ([Intel XE#2=
88]) +13 other tests ( 2 skip )
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
36/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-imm.html
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
64/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-imm.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][423], [SKIP][424]) ([Intel XE#2=
360])
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
33/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
63/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html

  * igt@xe_exec_sip_eudebug@breakpoint-writesip-twice:
    - shard-dg2-set2:     NOTRUN -> [SKIP][425] ([Intel XE#2905]) +1 other =
test skip
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
66/igt@xe_exec_sip_eudebug@breakpoint-writesip-twice.html

  * igt@xe_huc_copy@huc_copy:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][426], [SKIP][427]) ([Intel XE#2=
55])
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
64/igt@xe_huc_copy@huc_copy.html
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
32/igt@xe_huc_copy@huc_copy.html

  * igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
    - shard-dg2-set2:     [PASS][428] -> ([FAIL][429], [FAIL][430]) ([Intel=
 XE#1999]) +2 other tests ( 2 fail )
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-432/=
igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
34/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
64/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html

  * igt@xe_media_fill@media-fill:
    - shard-bmg:          NOTRUN -> [SKIP][431] ([Intel XE#2459] / [Intel X=
E#2596])
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-1=
/igt@xe_media_fill@media-fill.html

  * igt@xe_module_load@load:
    - shard-lnl:          ([PASS][432], [PASS][433], [PASS][434], [PASS][43=
5], [PASS][436], [PASS][437], [PASS][438], [PASS][439], [PASS][440], [PASS]=
[441], [PASS][442], [PASS][443], [PASS][444], [PASS][445], [PASS][446], [PA=
SS][447], [PASS][448], [PASS][449], [PASS][450], [PASS][451], [PASS][452], =
[PASS][453], [PASS][454], [PASS][455], [PASS][456]) -> ([PASS][457], [PASS]=
[458], [PASS][459], [PASS][460], [PASS][461], [PASS][462], [SKIP][463], [PA=
SS][464], [PASS][465], [PASS][466], [PASS][467], [PASS][468], [PASS][469], =
[PASS][470], [PASS][471], [PASS][472], [PASS][473], [PASS][474], [PASS][475=
], [PASS][476], [PASS][477], [PASS][478], [PASS][479], [PASS][480], [PASS][=
481], [PASS][482], [PASS][483], [PASS][484], [PASS][485], [PASS][486], [PAS=
S][487], [SKIP][488], [PASS][489], [PASS][490], [PASS][491], [PASS][492], [=
PASS][493], [PASS][494], [PASS][495], [PASS][496], [PASS][497], [PASS][498]=
, [PASS][499], [PASS][500], [PASS][501], [PASS][502], [PASS][503], [PASS][5=
04], [PASS][505]) ([Intel XE#378])
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-5/ig=
t@xe_module_load@load.html
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-7/ig=
t@xe_module_load@load.html
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-6/ig=
t@xe_module_load@load.html
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-4/ig=
t@xe_module_load@load.html
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-4/ig=
t@xe_module_load@load.html
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-1/ig=
t@xe_module_load@load.html
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-5/ig=
t@xe_module_load@load.html
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-3/ig=
t@xe_module_load@load.html
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-8/ig=
t@xe_module_load@load.html
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-3/ig=
t@xe_module_load@load.html
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-1/ig=
t@xe_module_load@load.html
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-3/ig=
t@xe_module_load@load.html
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-6/ig=
t@xe_module_load@load.html
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-8/ig=
t@xe_module_load@load.html
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-2/ig=
t@xe_module_load@load.html
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-8/ig=
t@xe_module_load@load.html
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-7/ig=
t@xe_module_load@load.html
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-2/ig=
t@xe_module_load@load.html
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-4/ig=
t@xe_module_load@load.html
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-7/ig=
t@xe_module_load@load.html
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-3/ig=
t@xe_module_load@load.html
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-5/ig=
t@xe_module_load@load.html
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-6/ig=
t@xe_module_load@load.html
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-2/ig=
t@xe_module_load@load.html
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-1/ig=
t@xe_module_load@load.html
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-4=
/igt@xe_module_load@load.html
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-4=
/igt@xe_module_load@load.html
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-1=
/igt@xe_module_load@load.html
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-6=
/igt@xe_module_load@load.html
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-6=
/igt@xe_module_load@load.html
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-4=
/igt@xe_module_load@load.html
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-4=
/igt@xe_module_load@load.html
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-6=
/igt@xe_module_load@load.html
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-8=
/igt@xe_module_load@load.html
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-8=
/igt@xe_module_load@load.html
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-8=
/igt@xe_module_load@load.html
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-1=
/igt@xe_module_load@load.html
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-1=
/igt@xe_module_load@load.html
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-2=
/igt@xe_module_load@load.html
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-2=
/igt@xe_module_load@load.html
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-7=
/igt@xe_module_load@load.html
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-7=
/igt@xe_module_load@load.html
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-3=
/igt@xe_module_load@load.html
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-2=
/igt@xe_module_load@load.html
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-3=
/igt@xe_module_load@load.html
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-5=
/igt@xe_module_load@load.html
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-5=
/igt@xe_module_load@load.html
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-5=
/igt@xe_module_load@load.html
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-3=
/igt@xe_module_load@load.html
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-7=
/igt@xe_module_load@load.html
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-5=
/igt@xe_module_load@load.html
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-1=
/igt@xe_module_load@load.html
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-1=
/igt@xe_module_load@load.html
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-2=
/igt@xe_module_load@load.html
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-7=
/igt@xe_module_load@load.html
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-5=
/igt@xe_module_load@load.html
   [488]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-8=
/igt@xe_module_load@load.html
   [489]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-8=
/igt@xe_module_load@load.html
   [490]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-1=
/igt@xe_module_load@load.html
   [491]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-8=
/igt@xe_module_load@load.html
   [492]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-4=
/igt@xe_module_load@load.html
   [493]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-4=
/igt@xe_module_load@load.html
   [494]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-7=
/igt@xe_module_load@load.html
   [495]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-3=
/igt@xe_module_load@load.html
   [496]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-4=
/igt@xe_module_load@load.html
   [497]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-8=
/igt@xe_module_load@load.html
   [498]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-6=
/igt@xe_module_load@load.html
   [499]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-3=
/igt@xe_module_load@load.html
   [500]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-3=
/igt@xe_module_load@load.html
   [501]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-6=
/igt@xe_module_load@load.html
   [502]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-6=
/igt@xe_module_load@load.html
   [503]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-7=
/igt@xe_module_load@load.html
   [504]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-5=
/igt@xe_module_load@load.html
   [505]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-5=
/igt@xe_module_load@load.html
    - shard-bmg:          ([PASS][506], [PASS][507], [PASS][508], [PASS][50=
9], [PASS][510], [PASS][511], [PASS][512], [PASS][513], [PASS][514], [PASS]=
[515], [PASS][516], [PASS][517], [PASS][518], [PASS][519], [PASS][520], [PA=
SS][521], [PASS][522], [PASS][523], [PASS][524], [PASS][525]) -> ([PASS][52=
6], [PASS][527], [PASS][528], [PASS][529], [PASS][530], [PASS][531], [PASS]=
[532], [PASS][533], [PASS][534], [PASS][535], [PASS][536], [PASS][537], [PA=
SS][538], [PASS][539], [PASS][540], [PASS][541], [PASS][542], [PASS][543], =
[SKIP][544], [PASS][545], [PASS][546], [PASS][547], [PASS][548], [PASS][549=
], [PASS][550], [PASS][551], [PASS][552], [PASS][553], [PASS][554], [PASS][=
555], [PASS][556], [PASS][557], [PASS][558], [PASS][559], [PASS][560], [PAS=
S][561], [PASS][562], [PASS][563], [PASS][564], [PASS][565], [PASS][566], [=
PASS][567]) ([Intel XE#2457])
   [506]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-4/ig=
t@xe_module_load@load.html
   [507]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-4/ig=
t@xe_module_load@load.html
   [508]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-2/ig=
t@xe_module_load@load.html
   [509]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-3/ig=
t@xe_module_load@load.html
   [510]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-3/ig=
t@xe_module_load@load.html
   [511]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-2/ig=
t@xe_module_load@load.html
   [512]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-2/ig=
t@xe_module_load@load.html
   [513]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-6/ig=
t@xe_module_load@load.html
   [514]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-6/ig=
t@xe_module_load@load.html
   [515]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-6/ig=
t@xe_module_load@load.html
   [516]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-3/ig=
t@xe_module_load@load.html
   [517]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-7/ig=
t@xe_module_load@load.html
   [518]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-7/ig=
t@xe_module_load@load.html
   [519]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-8/ig=
t@xe_module_load@load.html
   [520]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-4/ig=
t@xe_module_load@load.html
   [521]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-1/ig=
t@xe_module_load@load.html
   [522]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-7/ig=
t@xe_module_load@load.html
   [523]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-8/ig=
t@xe_module_load@load.html
   [524]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-2/ig=
t@xe_module_load@load.html
   [525]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-8/ig=
t@xe_module_load@load.html
   [526]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-8=
/igt@xe_module_load@load.html
   [527]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-2=
/igt@xe_module_load@load.html
   [528]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-2=
/igt@xe_module_load@load.html
   [529]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-4=
/igt@xe_module_load@load.html
   [530]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-4=
/igt@xe_module_load@load.html
   [531]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-4=
/igt@xe_module_load@load.html
   [532]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-8=
/igt@xe_module_load@load.html
   [533]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-8=
/igt@xe_module_load@load.html
   [534]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-1=
/igt@xe_module_load@load.html
   [535]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-7=
/igt@xe_module_load@load.html
   [536]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-1=
/igt@xe_module_load@load.html
   [537]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-7=
/igt@xe_module_load@load.html
   [538]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-7=
/igt@xe_module_load@load.html
   [539]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-1=
/igt@xe_module_load@load.html
   [540]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-3=
/igt@xe_module_load@load.html
   [541]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-2=
/igt@xe_module_load@load.html
   [542]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-3=
/igt@xe_module_load@load.html
   [543]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-3=
/igt@xe_module_load@load.html
   [544]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-2=
/igt@xe_module_load@load.html
   [545]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-6=
/igt@xe_module_load@load.html
   [546]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-6=
/igt@xe_module_load@load.html
   [547]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-6=
/igt@xe_module_load@load.html
   [548]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-7=
/igt@xe_module_load@load.html
   [549]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-8=
/igt@xe_module_load@load.html
   [550]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-3=
/igt@xe_module_load@load.html
   [551]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-3=
/igt@xe_module_load@load.html
   [552]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-8=
/igt@xe_module_load@load.html
   [553]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-8=
/igt@xe_module_load@load.html
   [554]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-7=
/igt@xe_module_load@load.html
   [555]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-7=
/igt@xe_module_load@load.html
   [556]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-4=
/igt@xe_module_load@load.html
   [557]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-4=
/igt@xe_module_load@load.html
   [558]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-6=
/igt@xe_module_load@load.html
   [559]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-4=
/igt@xe_module_load@load.html
   [560]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-3=
/igt@xe_module_load@load.html
   [561]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-1=
/igt@xe_module_load@load.html
   [562]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-6=
/igt@xe_module_load@load.html
   [563]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-6=
/igt@xe_module_load@load.html
   [564]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-1=
/igt@xe_module_load@load.html
   [565]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-2=
/igt@xe_module_load@load.html
   [566]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-2=
/igt@xe_module_load@load.html
   [567]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-2=
/igt@xe_module_load@load.html
    - shard-adlp:         ([PASS][568], [PASS][569], [PASS][570], [PASS][57=
1], [PASS][572], [PASS][573], [PASS][574], [PASS][575], [PASS][576], [PASS]=
[577], [PASS][578], [PASS][579], [PASS][580], [PASS][581], [PASS][582], [PA=
SS][583], [PASS][584], [PASS][585], [PASS][586], [PASS][587], [PASS][588], =
[PASS][589], [PASS][590], [PASS][591], [PASS][592]) -> ([PASS][593], [PASS]=
[594], [PASS][595], [PASS][596], [PASS][597], [PASS][598], [PASS][599], [PA=
SS][600], [PASS][601], [PASS][602], [PASS][603], [PASS][604], [PASS][605], =
[PASS][606], [PASS][607], [PASS][608], [PASS][609], [PASS][610], [PASS][611=
], [PASS][612], [PASS][613], [PASS][614], [PASS][615], [SKIP][616], [PASS][=
617], [PASS][618]) ([Intel XE#378])
   [568]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-1/i=
gt@xe_module_load@load.html
   [569]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-6/i=
gt@xe_module_load@load.html
   [570]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-6/i=
gt@xe_module_load@load.html
   [571]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-6/i=
gt@xe_module_load@load.html
   [572]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-6/i=
gt@xe_module_load@load.html
   [573]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-1/i=
gt@xe_module_load@load.html
   [574]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-2/i=
gt@xe_module_load@load.html
   [575]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-2/i=
gt@xe_module_load@load.html
   [576]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-2/i=
gt@xe_module_load@load.html
   [577]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-9/i=
gt@xe_module_load@load.html
   [578]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-9/i=
gt@xe_module_load@load.html
   [579]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-9/i=
gt@xe_module_load@load.html
   [580]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-9/i=
gt@xe_module_load@load.html
   [581]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-2/i=
gt@xe_module_load@load.html
   [582]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-1/i=
gt@xe_module_load@load.html
   [583]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-1/i=
gt@xe_module_load@load.html
   [584]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-4/i=
gt@xe_module_load@load.html
   [585]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-4/i=
gt@xe_module_load@load.html
   [586]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-4/i=
gt@xe_module_load@load.html
   [587]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-8/i=
gt@xe_module_load@load.html
   [588]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-4/i=
gt@xe_module_load@load.html
   [589]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-8/i=
gt@xe_module_load@load.html
   [590]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-4/i=
gt@xe_module_load@load.html
   [591]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-8/i=
gt@xe_module_load@load.html
   [592]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-8/i=
gt@xe_module_load@load.html
   [593]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-adlp-=
8/igt@xe_module_load@load.html
   [594]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-adlp-=
8/igt@xe_module_load@load.html
   [595]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-adlp-=
8/igt@xe_module_load@load.html
   [596]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-adlp-=
6/igt@xe_module_load@load.html
   [597]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-adlp-=
6/igt@xe_module_load@load.html
   [598]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-adlp-=
6/igt@xe_module_load@load.html
   [599]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-adlp-=
8/igt@xe_module_load@load.html
   [600]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-adlp-=
6/igt@xe_module_load@load.html
   [601]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-adlp-=
6/igt@xe_module_load@load.html
   [602]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-adlp-=
9/igt@xe_module_load@load.html
   [603]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-adlp-=
9/igt@xe_module_load@load.html
   [604]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-adlp-=
1/igt@xe_module_load@load.html
   [605]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-adlp-=
2/igt@xe_module_load@load.html
   [606]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-adlp-=
2/igt@xe_module_load@load.html
   [607]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-adlp-=
1/igt@xe_module_load@load.html
   [608]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-adlp-=
2/igt@xe_module_load@load.html
   [609]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-adlp-=
4/igt@xe_module_load@load.html
   [610]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-adlp-=
4/igt@xe_module_load@load.html
   [611]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-adlp-=
4/igt@xe_module_load@load.html
   [612]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-adlp-=
1/igt@xe_module_load@load.html
   [613]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-adlp-=
1/igt@xe_module_load@load.html
   [614]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-adlp-=
2/igt@xe_module_load@load.html
   [615]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-adlp-=
2/igt@xe_module_load@load.html
   [616]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-adlp-=
4/igt@xe_module_load@load.html
   [617]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-adlp-=
4/igt@xe_module_load@load.html
   [618]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-adlp-=
4/igt@xe_module_load@load.html

  * igt@xe_module_load@many-reload:
    - shard-adlp:         [PASS][619] -> [DMESG-WARN][620] ([Intel XE#2953]=
 / [Intel XE#4173])
   [619]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-9/i=
gt@xe_module_load@many-reload.html
   [620]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-adlp-=
8/igt@xe_module_load@many-reload.html

  * igt@xe_oa@buffer-size:
    - shard-lnl:          [PASS][621] -> ([PASS][622], [FAIL][623]) ([Intel=
 XE#4541])
   [621]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-3/ig=
t@xe_oa@buffer-size.html
   [622]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-1=
/igt@xe_oa@buffer-size.html
   [623]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-5=
/igt@xe_oa@buffer-size.html

  * igt@xe_oa@buffer-size@rcs-0-128k:
    - shard-lnl:          NOTRUN -> [FAIL][624] ([Intel XE#4541])
   [624]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-5=
/igt@xe_oa@buffer-size@rcs-0-128k.html

  * igt@xe_oa@create-destroy-userspace-config:
    - shard-adlp:         NOTRUN -> [SKIP][625] ([Intel XE#2541] / [Intel X=
E#3573]) +1 other test skip
   [625]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-adlp-=
6/igt@xe_oa@create-destroy-userspace-config.html
    - shard-dg2-set2:     NOTRUN -> ([SKIP][626], [SKIP][627]) ([Intel XE#2=
541] / [Intel XE#3573]) +2 other tests ( 2 skip )
   [626]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
36/igt@xe_oa@create-destroy-userspace-config.html
   [627]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
36/igt@xe_oa@create-destroy-userspace-config.html

  * igt@xe_oa@privileged-forked-access-vaddr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][628] ([Intel XE#2541] / [Intel X=
E#3573]) +1 other test skip
   [628]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
64/igt@xe_oa@privileged-forked-access-vaddr.html

  * igt@xe_oa@syncs-syncobj-wait:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][629], [SKIP][630]) ([Intel XE#2=
541] / [Intel XE#3573] / [Intel XE#4501])
   [629]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
64/igt@xe_oa@syncs-syncobj-wait.html
   [630]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
34/igt@xe_oa@syncs-syncobj-wait.html

  * igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     NOTRUN -> [FAIL][631] ([Intel XE#1173])
   [631]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
66/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html

  * igt@xe_pm@d3cold-mocs:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][632], [SKIP][633]) ([Intel XE#2=
284])
   [632]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
35/igt@xe_pm@d3cold-mocs.html
   [633]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
35/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-bmg:          NOTRUN -> [SKIP][634] ([Intel XE#2284])
   [634]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-7=
/igt@xe_pm@s3-d3cold-basic-exec.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][635] ([Intel XE#2284] / [Intel X=
E#366])
   [635]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
64/igt@xe_pm@s3-d3cold-basic-exec.html

  * igt@xe_pm@s3-d3hot-basic-exec:
    - shard-lnl:          NOTRUN -> ([SKIP][636], [SKIP][637]) ([Intel XE#5=
84])
   [636]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-8=
/igt@xe_pm@s3-d3hot-basic-exec.html
   [637]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-4=
/igt@xe_pm@s3-d3hot-basic-exec.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-adlp:         [PASS][638] -> [ABORT][639] ([Intel XE#1794]) +1 =
other test abort
   [638]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-8/i=
gt@xe_pm@s4-multiple-execs.html
   [639]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-adlp-=
9/igt@xe_pm@s4-multiple-execs.html
    - shard-lnl:          [PASS][640] -> ([ABORT][641], [PASS][642]) ([Inte=
l XE#1794])
   [640]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-3/ig=
t@xe_pm@s4-multiple-execs.html
   [641]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-2=
/igt@xe_pm@s4-multiple-execs.html
   [642]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-5=
/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-bmg:          NOTRUN -> ([SKIP][643], [SKIP][644]) ([Intel XE#9=
44])
   [643]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-6=
/igt@xe_query@multigpu-query-invalid-extension.html
   [644]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-3=
/igt@xe_query@multigpu-query-invalid-extension.html
    - shard-adlp:         NOTRUN -> [SKIP][645] ([Intel XE#944])
   [645]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-adlp-=
1/igt@xe_query@multigpu-query-invalid-extension.html
    - shard-lnl:          NOTRUN -> ([SKIP][646], [SKIP][647]) ([Intel XE#9=
44]) +1 other test ( 2 skip )
   [646]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-5=
/igt@xe_query@multigpu-query-invalid-extension.html
   [647]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-3=
/igt@xe_query@multigpu-query-invalid-extension.html

  * igt@xe_query@multigpu-query-oa-units:
    - shard-bmg:          NOTRUN -> [SKIP][648] ([Intel XE#944])
   [648]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-7=
/igt@xe_query@multigpu-query-oa-units.html

  * igt@xe_query@multigpu-query-uc-fw-version-guc:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][649], [SKIP][650]) ([Intel XE#9=
44]) +1 other test ( 2 skip )
   [649]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
36/igt@xe_query@multigpu-query-uc-fw-version-guc.html
   [650]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
66/igt@xe_query@multigpu-query-uc-fw-version-guc.html

  * igt@xe_sriov_auto_provisioning@fair-allocation:
    - shard-lnl:          NOTRUN -> ([SKIP][651], [SKIP][652]) ([Intel XE#4=
130])
   [651]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-2=
/igt@xe_sriov_auto_provisioning@fair-allocation.html
   [652]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-5=
/igt@xe_sriov_auto_provisioning@fair-allocation.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-bmg:          NOTRUN -> ([SKIP][653], [SKIP][654]) ([Intel XE#3=
342])
   [653]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-1=
/igt@xe_sriov_flr@flr-vf1-clear.html
   [654]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-7=
/igt@xe_sriov_flr@flr-vf1-clear.html

  * igt@xe_sriov_scheduling@equal-throughput:
    - shard-bmg:          NOTRUN -> ([SKIP][655], [SKIP][656]) ([Intel XE#4=
351])
   [655]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-8=
/igt@xe_sriov_scheduling@equal-throughput.html
   [656]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-1=
/igt@xe_sriov_scheduling@equal-throughput.html

 =20
#### Possible fixes ####

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][657] ([Intel XE#2191]) -> ([PASS][658], [P=
ASS][659])
   [657]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-464/=
igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [658]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
33/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [659]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
66/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          [SKIP][660] ([Intel XE#2314] / [Intel XE#2894]) -=
> ([PASS][661], [PASS][662])
   [660]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-4/ig=
t@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [661]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-2=
/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [662]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-8=
/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][663] ([Intel XE#2705] / [Intel XE#42=
12] / [Intel XE#4345]) -> ([PASS][664], [PASS][665])
   [663]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-434/=
igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [664]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
32/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [665]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
32/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-dg2-set2:     [SKIP][666] ([Intel XE#309]) -> ([PASS][667], [PA=
SS][668]) +3 other tests ( 2 pass )
   [666]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-464/=
igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
   [667]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
36/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
   [668]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
63/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:
    - shard-bmg:          [SKIP][669] ([Intel XE#2291]) -> ([PASS][670], [P=
ASS][671])
   [669]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-6/ig=
t@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html
   [670]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-3=
/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html
   [671]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-7=
/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-bmg:          [SKIP][672] ([Intel XE#2291]) -> [PASS][673] +3 o=
ther tests pass
   [672]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-4/ig=
t@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
   [673]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-2=
/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-bmg:          [SKIP][674] ([Intel XE#4302]) -> ([PASS][675], [P=
ASS][676])
   [674]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-6/ig=
t@kms_display_modes@extended-mode-basic.html
   [675]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-2=
/igt@kms_display_modes@extended-mode-basic.html
   [676]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-1=
/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-dg2-set2:     [SKIP][677] ([Intel XE#455]) -> ([PASS][678], [PA=
SS][679])
   [677]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-464/=
igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [678]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
63/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [679]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
66/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_feature_discovery@display-2x:
    - shard-bmg:          [SKIP][680] ([Intel XE#2373]) -> [PASS][681]
   [680]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-4/ig=
t@kms_feature_discovery@display-2x.html
   [681]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-7=
/igt@kms_feature_discovery@display-2x.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][682] ([Intel XE#301]) -> [PASS][683]
   [682]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-434/=
igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4.html
   [683]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
34/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-bmg:          [SKIP][684] ([Intel XE#2316]) -> [PASS][685]
   [684]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-4/ig=
t@kms_flip@2x-modeset-vs-vblank-race.html
   [685]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-2=
/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@2x-plain-flip-ts-check:
    - shard-dg2-set2:     [SKIP][686] ([Intel XE#310]) -> [PASS][687]
   [686]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-464/=
igt@kms_flip@2x-plain-flip-ts-check.html
   [687]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
66/igt@kms_flip@2x-plain-flip-ts-check.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
    - shard-bmg:          [SKIP][688] ([Intel XE#2316]) -> ([PASS][689], [P=
ASS][690]) +1 other test ( 2 pass )
   [688]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-6/ig=
t@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html
   [689]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-8=
/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html
   [690]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-8=
/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@flip-vs-expired-vblank@a-dp4:
    - shard-dg2-set2:     [FAIL][691] ([Intel XE#301] / [Intel XE#3321]) ->=
 ([PASS][692], [PASS][693]) +1 other test ( 2 pass )
   [691]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-436/=
igt@kms_flip@flip-vs-expired-vblank@a-dp4.html
   [692]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
63/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html
   [693]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
36/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:
    - shard-dg2-set2:     [FAIL][694] ([Intel XE#301]) -> ([PASS][695], [PA=
SS][696]) +4 other tests ( 2 pass )
   [694]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-436/=
igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html
   [695]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
63/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html
   [696]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
36/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html

  * igt@kms_flip@flip-vs-suspend@c-dp4:
    - shard-dg2-set2:     [INCOMPLETE][697] ([Intel XE#2049] / [Intel XE#25=
97]) -> ([PASS][698], [PASS][699]) +1 other test ( 2 pass )
   [697]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-466/=
igt@kms_flip@flip-vs-suspend@c-dp4.html
   [698]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
33/igt@kms_flip@flip-vs-suspend@c-dp4.html
   [699]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
66/igt@kms_flip@flip-vs-suspend@c-dp4.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:
    - shard-adlp:         [DMESG-FAIL][700] ([Intel XE#4543]) -> [PASS][701=
] +7 other tests pass
   [700]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-4/i=
gt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html
   [701]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-adlp-=
8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-rte:
    - shard-adlp:         [DMESG-WARN][702] ([Intel XE#4173]) -> [PASS][703=
] +2 other tests pass
   [702]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-2/i=
gt@kms_frontbuffer_tracking@fbc-1p-rte.html
   [703]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-adlp-=
2/igt@kms_frontbuffer_tracking@fbc-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [SKIP][704] ([Intel XE#656]) -> ([PASS][705], [PA=
SS][706]) +4 other tests ( 2 pass )
   [704]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-464/=
igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render.html
   [705]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
33/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render.html
   [706]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
63/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-rte:
    - shard-dg2-set2:     [SKIP][707] ([Intel XE#656]) -> [PASS][708] +1 ot=
her test pass
   [707]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-464/=
igt@kms_frontbuffer_tracking@fbc-2p-rte.html
   [708]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
63/igt@kms_frontbuffer_tracking@fbc-2p-rte.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [SKIP][709] ([Intel XE#455]) -> [PASS][710]
   [709]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-433/=
igt@kms_hdr@invalid-hdr.html
   [710]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
63/igt@kms_hdr@invalid-hdr.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-dg2-set2:     [SKIP][711] ([Intel XE#4328]) -> [PASS][712]
   [711]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-464/=
igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [712]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
33/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_plane_cursor@viewport:
    - shard-adlp:         [FAIL][713] ([Intel XE#1471]) -> [PASS][714] +1 o=
ther test pass
   [713]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-1/i=
gt@kms_plane_cursor@viewport.html
   [714]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-adlp-=
6/igt@kms_plane_cursor@viewport.html
    - shard-dg2-set2:     [FAIL][715] ([Intel XE#616]) -> [PASS][716] +1 ot=
her test pass
   [715]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-464/=
igt@kms_plane_cursor@viewport.html
   [716]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
64/igt@kms_plane_cursor@viewport.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-dg2-set2:     [SKIP][717] ([Intel XE#836]) -> ([PASS][718], [PA=
SS][719])
   [717]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-464/=
igt@kms_pm_rpm@modeset-non-lpsp.html
   [718]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
33/igt@kms_pm_rpm@modeset-non-lpsp.html
   [719]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
34/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1:
    - shard-adlp:         [FAIL][720] ([Intel XE#771]) -> [PASS][721]
   [720]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-4/i=
gt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html
   [721]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-adlp-=
2/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-adlp:         [DMESG-WARN][722] ([Intel XE#2953] / [Intel XE#41=
73]) -> [PASS][723] +1 other test pass
   [722]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-6/i=
gt@kms_vblank@ts-continuation-suspend.html
   [723]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-adlp-=
8/igt@kms_vblank@ts-continuation-suspend.html

  * igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_=
compute:
    - shard-lnl:          [FAIL][724] ([Intel XE#4278]) -> [PASS][725] +1 o=
ther test pass
   [724]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-5/ig=
t@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_comput=
e.html
   [725]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-3=
/igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_com=
pute.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind:
    - shard-dg2-set2:     [SKIP][726] ([Intel XE#1392]) -> [PASS][727] +1 o=
ther test pass
   [726]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-432/=
igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html
   [727]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
34/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue:
    - shard-dg2-set2:     [SKIP][728] ([Intel XE#1392]) -> ([PASS][729], [P=
ASS][730]) +1 other test ( 2 pass )
   [728]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-432/=
igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue.html
   [729]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
36/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue.html
   [730]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
35/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-lnl:          [ABORT][731] ([Intel XE#1794]) -> ([PASS][732], [=
PASS][733])
   [731]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-2/ig=
t@xe_pm@s4-vm-bind-unbind-all.html
   [732]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-3=
/igt@xe_pm@s4-vm-bind-unbind-all.html
   [733]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-5=
/igt@xe_pm@s4-vm-bind-unbind-all.html

 =20
#### Warnings ####

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][734] ([Intel XE#787]) -> ([SKIP][735], [SK=
IP][736]) ([Intel XE#455] / [Intel XE#787]) +7 other tests ( 2 skip )
   [734]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-434/=
igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6.html
   [735]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
36/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6.html
   [736]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
64/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][737] ([Intel XE#455] / [Intel XE#787]) -> =
([SKIP][738], [SKIP][739]) ([Intel XE#787]) +2 other tests ( 2 skip )
   [737]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-464/=
igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6.html
   [738]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
33/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6.html
   [739]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
33/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][740] ([Intel XE#787]) -> [SKIP][741] ([Int=
el XE#455] / [Intel XE#787]) +3 other tests skip
   [740]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-463/=
igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-d-hdmi-a-6.html
   [741]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
64/igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][742] ([Intel XE#455] / [Intel XE#787]) -> =
[SKIP][743] ([Intel XE#787]) +3 other tests skip
   [742]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-464/=
igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html
   [743]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
36/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg2-set2:     [SKIP][744] ([Intel XE#4440]) -> ([SKIP][745], [S=
KIP][746]) ([Intel XE#4418] / [Intel XE#4440])
   [744]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-464/=
igt@kms_cdclk@mode-transition-all-outputs.html
   [745]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
64/igt@kms_cdclk@mode-transition-all-outputs.html
   [746]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
34/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          [SKIP][747] ([Intel XE#2341]) -> ([FAIL][748], [F=
AIL][749]) ([Intel XE#1178])
   [747]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-6/ig=
t@kms_content_protection@atomic.html
   [748]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-2=
/igt@kms_content_protection@atomic.html
   [749]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-2=
/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:
    - shard-bmg:          [FAIL][750] ([Intel XE#1178]) -> ([FAIL][751], [I=
NCOMPLETE][752]) ([Intel XE#1178] / [Intel XE#4132]) +1 other test ( 1 fail=
, 1 incomplete )
   [750]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-3/ig=
t@kms_content_protection@atomic-dpms@pipe-a-dp-2.html
   [751]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-4=
/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html
   [752]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-7=
/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html

  * igt@kms_content_protection@lic-type-0:
    - shard-dg2-set2:     [SKIP][753] ([Intel XE#455]) -> [FAIL][754] ([Int=
el XE#1178])
   [753]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-464/=
igt@kms_content_protection@lic-type-0.html
   [754]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
63/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@srm:
    - shard-dg2-set2:     [SKIP][755] ([Intel XE#455]) -> ([SKIP][756], [FA=
IL][757]) ([Intel XE#1178] / [Intel XE#455])
   [755]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-464/=
igt@kms_content_protection@srm.html
   [756]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
64/igt@kms_content_protection@srm.html
   [757]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
32/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@uevent:
    - shard-dg2-set2:     [SKIP][758] ([Intel XE#455]) -> ([FAIL][759], [SK=
IP][760]) ([Intel XE#1188] / [Intel XE#455])
   [758]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-464/=
igt@kms_content_protection@uevent.html
   [759]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
33/igt@kms_content_protection@uevent.html
   [760]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
64/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-bmg:          [SKIP][761] ([Intel XE#2291]) -> ([PASS][762], [S=
KIP][763]) ([Intel XE#2291])
   [761]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-6/ig=
t@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [762]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-8=
/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [763]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-6=
/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
    - shard-dg2-set2:     [SKIP][764] ([Intel XE#309]) -> ([PASS][765], [SK=
IP][766]) ([Intel XE#309])
   [764]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-464/=
igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html
   [765]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
35/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html
   [766]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
64/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][767] ([Intel XE#455] / [i915#3804]) -> ([S=
KIP][768], [SKIP][769]) ([i915#3804])
   [767]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-464/=
igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html
   [768]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
66/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html
   [769]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
63/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html

  * igt@kms_dp_aux_dev:
    - shard-dg2-set2:     [SKIP][770] ([Intel XE#3009]) -> ([SKIP][771], [P=
ASS][772]) ([Intel XE#3009])
   [770]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-464/=
igt@kms_dp_aux_dev.html
   [771]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
64/igt@kms_dp_aux_dev.html
   [772]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
32/igt@kms_dp_aux_dev.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][773] ([Intel XE#3321]) -> ([PASS][774], [F=
AIL][775]) ([Intel XE#3321]) +2 other tests ( 1 fail, 1 pass )
   [773]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-1/ig=
t@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html
   [774]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-3=
/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html
   [775]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-3=
/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][776] ([Intel XE#301]) -> ([PASS][777], [FA=
IL][778]) ([Intel XE#301]) +2 other tests ( 1 fail, 1 pass )
   [776]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-434/=
igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a6-dp4.html
   [777]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
66/igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a6-dp4.html
   [778]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
63/igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a6-dp4.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          [SKIP][779] ([Intel XE#2316]) -> ([PASS][780], [S=
KIP][781]) ([Intel XE#2316]) +1 other test ( 1 pass, 1 skip )
   [779]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-4/ig=
t@kms_flip@2x-plain-flip-fb-recreate.html
   [780]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-8=
/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [781]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-4=
/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [FAIL][782] ([Intel XE#301]) -> ([PASS][783], [FA=
IL][784]) ([Intel XE#301]) +3 other tests ( 1 fail, 1 pass )
   [782]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-7/ig=
t@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [783]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-8=
/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [784]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-7=
/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [FAIL][785] ([Intel XE#301] / [Intel XE#3149]) ->=
 ([PASS][786], [FAIL][787]) ([Intel XE#301] / [Intel XE#3149]) +1 other tes=
t ( 1 fail, 1 pass )
   [785]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-7/ig=
t@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [786]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-8=
/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [787]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-7=
/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [INCOMPLETE][788] ([Intel XE#2049] / [Intel XE#25=
97]) -> ([PASS][789], [INCOMPLETE][790]) ([Intel XE#2049] / [Intel XE#2597]=
) +1 other test ( 1 incomplete, 1 pass )
   [788]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-436/=
igt@kms_flip@flip-vs-suspend-interruptible.html
   [789]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
33/igt@kms_flip@flip-vs-suspend-interruptible.html
   [790]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
35/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
    - shard-adlp:         [DMESG-FAIL][791] ([Intel XE#4543]) -> [DMESG-FAI=
L][792] ([Intel XE#324] / [Intel XE#4543]) +1 other test dmesg-fail
   [791]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-6/i=
gt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html
   [792]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-adlp-=
4/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
    - shard-bmg:          [SKIP][793] ([Intel XE#2311]) -> ([SKIP][794], [S=
KIP][795]) ([Intel XE#2311] / [Intel XE#2312]) +13 other tests ( 2 skip )
   [793]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-7/ig=
t@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html
   [794]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-4=
/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html
   [795]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-2=
/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][796] ([Intel XE#656]) -> ([SKIP][797], [SK=
IP][798]) ([Intel XE#651] / [Intel XE#656]) +2 other tests ( 2 skip )
   [796]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-464/=
igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html
   [797]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
32/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html
   [798]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
64/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][799] ([Intel XE#651]) -> ([SKIP][800], [SK=
IP][801]) ([Intel XE#656])
   [799]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-463/=
igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt.html
   [800]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
64/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt.html
   [801]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
64/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][802] ([Intel XE#2312]) -> ([SKIP][803], [S=
KIP][804]) ([Intel XE#2311]) +5 other tests ( 2 skip )
   [802]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-6/ig=
t@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html
   [803]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-7=
/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html
   [804]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-2=
/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][805] ([Intel XE#651]) -> [SKIP][806] ([Int=
el XE#656]) +1 other test skip
   [805]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-434/=
igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [806]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
64/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt:
    - shard-bmg:          [SKIP][807] ([Intel XE#2312]) -> [SKIP][808] ([In=
tel XE#2311]) +5 other tests skip
   [807]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-4/ig=
t@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt.html
   [808]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-3=
/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][809] ([Intel XE#2311]) -> [SKIP][810] ([In=
tel XE#2312]) +6 other tests skip
   [809]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-2/ig=
t@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render.html
   [810]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-6=
/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][811] ([Intel XE#651]) -> ([SKIP][812], [SK=
IP][813]) ([Intel XE#651] / [Intel XE#656]) +14 other tests ( 2 skip )
   [811]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-436/=
igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
   [812]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
64/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
   [813]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
34/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw:
    - shard-bmg:          [SKIP][814] ([Intel XE#4141]) -> [SKIP][815] ([In=
tel XE#2312]) +1 other test skip
   [814]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-1/ig=
t@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html
   [815]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-6=
/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][816] ([Intel XE#2312]) -> ([SKIP][817], [S=
KIP][818]) ([Intel XE#4141]) +2 other tests ( 2 skip )
   [816]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-4/ig=
t@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [817]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-7=
/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [818]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-3=
/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][819] ([Intel XE#2312]) -> ([SKIP][820], [S=
KIP][821]) ([Intel XE#2312] / [Intel XE#4141]) +1 other test ( 2 skip )
   [819]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-4/ig=
t@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html
   [820]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-6=
/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html
   [821]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-7=
/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][822] ([Intel XE#4141]) -> ([SKIP][823], [S=
KIP][824]) ([Intel XE#2312])
   [822]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-8/ig=
t@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html
   [823]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-6=
/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html
   [824]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-6=
/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][825] ([Intel XE#4141]) -> ([SKIP][826], [S=
KIP][827]) ([Intel XE#2312] / [Intel XE#4141]) +8 other tests ( 2 skip )
   [825]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-2/ig=
t@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
   [826]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-4=
/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
   [827]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-3=
/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][828] ([Intel XE#2312]) -> [SKIP][829] ([In=
tel XE#4141]) +1 other test skip
   [828]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-6/ig=
t@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
   [829]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-2=
/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][830] ([Intel XE#656]) -> [SKIP][831] ([Int=
el XE#651]) +2 other tests skip
   [830]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-464/=
igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [831]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
63/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.=
html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][832] ([Intel XE#2312]) -> ([SKIP][833], [S=
KIP][834]) ([Intel XE#2311] / [Intel XE#2312]) +4 other tests ( 2 skip )
   [832]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-6/ig=
t@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [833]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-6=
/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-mmap-wc.ht=
ml
   [834]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-2=
/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-mmap-wc.ht=
ml

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][835] ([Intel XE#656]) -> ([SKIP][836], [SK=
IP][837]) ([Intel XE#651]) +6 other tests ( 2 skip )
   [835]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-464/=
igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html
   [836]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
32/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html
   [837]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
63/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][838] ([Intel XE#2311]) -> ([SKIP][839], [S=
KIP][840]) ([Intel XE#2312])
   [838]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-8/ig=
t@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff.html
   [839]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-6=
/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff.html
   [840]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-6=
/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][841] ([Intel XE#656]) -> ([SKIP][842], [SK=
IP][843]) ([Intel XE#653]) +7 other tests ( 2 skip )
   [841]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-464/=
igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc.html
   [842]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
63/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc.h=
tml
   [843]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
33/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc.h=
tml

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][844] ([Intel XE#2312]) -> ([SKIP][845], [S=
KIP][846]) ([Intel XE#2312] / [Intel XE#2313]) +6 other tests ( 2 skip )
   [844]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-6/ig=
t@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html
   [845]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-6=
/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html
   [846]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-7=
/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][847] ([Intel XE#656]) -> ([SKIP][848], [SK=
IP][849]) ([Intel XE#653] / [Intel XE#656])
   [847]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-464/=
igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
   [848]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
64/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
   [849]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
63/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][850] ([Intel XE#2313]) -> ([SKIP][851], [S=
KIP][852]) ([Intel XE#2312]) +1 other test ( 2 skip )
   [850]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-8/ig=
t@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render.html
   [851]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-6=
/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render.html
   [852]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-4=
/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][853] ([Intel XE#2313]) -> ([SKIP][854], [S=
KIP][855]) ([Intel XE#2312] / [Intel XE#2313]) +9 other tests ( 2 skip )
   [853]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-7/ig=
t@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
   [854]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-2=
/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
   [855]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-4=
/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][856] ([Intel XE#2312]) -> [SKIP][857] ([In=
tel XE#2313]) +7 other tests skip
   [856]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-6/ig=
t@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [857]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-3=
/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][858] ([Intel XE#653]) -> [SKIP][859] ([Int=
el XE#656]) +2 other tests skip
   [858]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-436/=
igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
   [859]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
64/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][860] ([Intel XE#653]) -> ([SKIP][861], [SK=
IP][862]) ([Intel XE#653] / [Intel XE#656]) +13 other tests ( 2 skip )
   [860]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-463/=
igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html
   [861]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
66/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html
   [862]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
64/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][863] ([Intel XE#656]) -> [SKIP][864] ([Int=
el XE#653]) +1 other test skip
   [863]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-464/=
igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render.html
   [864]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
34/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][865] ([Intel XE#2312]) -> ([SKIP][866], [S=
KIP][867]) ([Intel XE#2313]) +5 other tests ( 2 skip )
   [865]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-6/ig=
t@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [866]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-3=
/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [867]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-3=
/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][868] ([Intel XE#2313]) -> [SKIP][869] ([In=
tel XE#2312]) +3 other tests skip
   [868]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-1/ig=
t@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt.html
   [869]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-4=
/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-bmg:          [SKIP][870] ([Intel XE#4596]) -> [SKIP][871] ([In=
tel XE#2493])
   [870]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-4/ig=
t@kms_plane_multiple@2x-tiling-y.html
   [871]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-7=
/igt@kms_plane_multiple@2x-tiling-y.html
    - shard-dg2-set2:     [SKIP][872] ([Intel XE#4596]) -> [SKIP][873] ([In=
tel XE#455])
   [872]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-464/=
igt@kms_plane_multiple@2x-tiling-y.html
   [873]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
66/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-dg2-set2:     [SKIP][874] ([Intel XE#836]) -> ([SKIP][875], [PA=
SS][876]) ([Intel XE#836])
   [874]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-464/=
igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [875]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
64/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [876]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
35/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_setmode@basic@pipe-b-edp-1:
    - shard-lnl:          [FAIL][877] ([Intel XE#2883]) -> ([FAIL][878], [P=
ASS][879]) ([Intel XE#2883]) +2 other tests ( 1 fail, 1 pass )
   [877]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-3/ig=
t@kms_setmode@basic@pipe-b-edp-1.html
   [878]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-8=
/igt@kms_setmode@basic@pipe-b-edp-1.html
   [879]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-7=
/igt@kms_setmode@basic@pipe-b-edp-1.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-dg2-set2:     [SKIP][880] ([Intel XE#455]) -> ([SKIP][881], [PA=
SS][882]) ([Intel XE#455])
   [880]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-464/=
igt@kms_setmode@invalid-clone-single-crtc.html
   [881]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
64/igt@kms_setmode@invalid-clone-single-crtc.html
   [882]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
32/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [SKIP][883] ([Intel XE#362]) -> ([SKIP][884], [FA=
IL][885]) ([Intel XE#1729] / [Intel XE#362])
   [883]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-463/=
igt@kms_tiled_display@basic-test-pattern.html
   [884]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
64/igt@kms_tiled_display@basic-test-pattern.html
   [885]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
32/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][886] ([Intel XE#1500]) -> [SKIP][887] ([In=
tel XE#362])
   [886]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-434/=
igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [887]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
64/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-adlp:         [FAIL][888] ([Intel XE#771]) -> [FAIL][889] ([Int=
el XE#771] / [Intel XE#899])
   [888]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-4/i=
gt@kms_universal_plane@cursor-fb-leak.html
   [889]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-adlp-=
2/igt@kms_universal_plane@cursor-fb-leak.html
    - shard-lnl:          [FAIL][890] ([Intel XE#771]) -> ([FAIL][891], [FA=
IL][892]) ([Intel XE#771] / [Intel XE#899])
   [890]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-5/ig=
t@kms_universal_plane@cursor-fb-leak.html
   [891]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-8=
/igt@kms_universal_plane@cursor-fb-leak.html
   [892]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-3=
/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:
    - shard-lnl:          [FAIL][893] ([Intel XE#771]) -> ([PASS][894], [FA=
IL][895]) ([Intel XE#899]) +1 other test ( 1 fail, 1 pass )
   [893]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-5/ig=
t@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html
   [894]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-8=
/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html
   [895]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-3=
/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html

  * igt@xe_exec_basic@multigpu-once-null-defer-bind:
    - shard-dg2-set2:     [SKIP][896] ([Intel XE#1392]) -> ([PASS][897], [S=
KIP][898]) ([Intel XE#1392]) +1 other test ( 1 pass, 1 skip )
   [896]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-432/=
igt@xe_exec_basic@multigpu-once-null-defer-bind.html
   [897]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
34/igt@xe_exec_basic@multigpu-once-null-defer-bind.html
   [898]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
32/igt@xe_exec_basic@multigpu-once-null-defer-bind.html

  * igt@xe_peer2peer@read:
    - shard-dg2-set2:     [SKIP][899] ([Intel XE#1061]) -> ([FAIL][900], [S=
KIP][901]) ([Intel XE#1061] / [Intel XE#1173])
   [899]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-dg2-432/=
igt@xe_peer2peer@read.html
   [900]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
66/igt@xe_peer2peer@read.html
   [901]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-4=
32/igt@xe_peer2peer@read.html

 =20
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1471]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1471
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2459
  [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
  [Intel XE#2505]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#2550]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2550
  [Intel XE#2571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571
  [Intel XE#2596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2932]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2932
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3225]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3225
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3767]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3889]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4132]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4132
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4259]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4259
  [Intel XE#4278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4278
  [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
  [Intel XE#4328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4328
  [Intel XE#4329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329
  [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351
  [Intel XE#4416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4416
  [Intel XE#4418]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4418
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4439
  [Intel XE#4440]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4440
  [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
  [Intel XE#4501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501
  [Intel XE#4518]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518
  [Intel XE#4519]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4519
  [Intel XE#4540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4540
  [Intel XE#4541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4541
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4568]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4568
  [Intel XE#4577]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4577
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#664]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/664
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804


Build changes
-------------

  * IGT: IGT_8288 -> IGTPW_12846

  IGTPW_12846: 12846
  IGT_8288: 8288
  xe-2854-14c330bc015ded4a1f1dd1f5aeb8617077aaa7e8: 14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8

=3D=3D Logs =3D=3D

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846=
/index.html

--===============8746251353216965090==
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
<tr><td><b>Series:</b></td><td>*** IGT Test code handling error string for =
xe_sysfs_scheduler.c ***</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/146824/">https://patchwork.freedesktop.org/series/146824/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12846/index.html">https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12846/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8288_FULL -&gt; XEIGTPW_12846_FULL<=
/h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_12846_FULL absolutely need t=
o be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in XEIGTPW_12846_FULL, please notify your bug team (I915-ci-in=
fra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_12=
846_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_plane_lowres@tiling-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-436/igt@kms_plane_lowres@tiling-4.html">PASS</a> -&gt;=
 (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg=
2-435/igt@kms_plane_lowres@tiling-4.html">INCOMPLETE</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-436/igt@kms_plane=
_lowres@tiling-4.html">PASS</a>) +1 other test ( 1 incomplete, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_mmio_probe_early:<=
/p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-lnl-5/igt@xe_fault_injection@inject-fault-probe-function-x=
e_mmio_probe_early.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12846/shard-lnl-6/igt@xe_fault_injection@inject-fa=
ult-probe-function-xe_mmio_probe_early.html">ABORT</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-7/igt@xe_fault_inje=
ction@inject-fault-probe-function-xe_mmio_probe_early.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-4/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_op=
s_create.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12846/shard-bmg-6/igt@xe_fault_injection@vm-bind-fail-vm_bin=
d_ioctl_ops_create.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12846/shard-bmg-6/igt@xe_fault_injection@vm-bind-fail-vm=
_bind_ioctl_ops_create.html">ABORT</a>)</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_8288_FULL and XEIGTPW_12846=
_FULL:</p>
<h3>New IGT tests (18)</h3>
<ul>
<li>
<p>igt@xe_sysfs_scheduler@job_timeout_ms-invalid-string:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_scheduler@job_timeout_ms-invalid-string@bcs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_scheduler@job_timeout_ms-invalid-string@ccs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_scheduler@job_timeout_ms-invalid-string@rcs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_scheduler@job_timeout_ms-invalid-string@vcs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_scheduler@job_timeout_ms-invalid-string@vecs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_scheduler@preempt_timeout_us-invalid-string:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_scheduler@preempt_timeout_us-invalid-string@bcs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_scheduler@preempt_timeout_us-invalid-string@ccs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_scheduler@preempt_timeout_us-invalid-string@rcs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_scheduler@preempt_timeout_us-invalid-string@vcs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_scheduler@preempt_timeout_us-invalid-string@vecs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_scheduler@timeslice_duration_us-invalid-string:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_scheduler@timeslice_duration_us-invalid-string@bcs:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_scheduler@timeslice_duration_us-invalid-string@ccs:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_scheduler@timeslice_duration_us-invalid-string@rcs:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_scheduler@timeslice_duration_us-invalid-string@vcs:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_scheduler@timeslice_duration_us-invalid-string@vecs:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12846_FULL that come from known is=
sues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-m=
c-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-dg2-466/igt@kms_async_flips@async-flip-wi=
th-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html">SKIP</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-435/igt@kms_as=
ync_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html">S=
KIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/25=
50">Intel XE#2550</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3767">Intel XE#3767</a>) +15 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-dg2-433/igt@kms_async_flips@invalid-async=
-flip.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12846/shard-dg2-464/igt@kms_async_flips@invalid-async-flip.html">SKIP=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/873">=
Intel XE#873</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor-atomic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-lnl-6/igt@kms_async_flips@test-cursor-atomic.html">PASS</a=
> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/s=
hard-lnl-1/igt@kms_async_flips@test-cursor-atomic.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-2/igt@k=
ms_async_flips@test-cursor-atomic.html">SKIP</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/664">Intel XE#664</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-dg2-436/igt@kms_big_fb@4-tiled-32bpp-rota=
te-90.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12846/shard-dg2-464/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">=
Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-lnl-1/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">PASS</=
a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/=
shard-lnl-6/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">INCOMPLETE</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-5=
/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">PASS</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/3225">Intel XE#3225</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-bmg-3/igt@kms_big_fb@linear-32bpp-rotate-=
270.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12846/shard-bmg-2/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Int=
el XE#2327</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12846/shard-bmg-7/igt@kms_big_fb@linear-8bpp-rotate-90=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-lnl-7/igt@kms_big_fb@x-tiled-16bpp-rotate=
-270.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12846/shard-lnl-7/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</=
a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">I=
ntel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12846/shard-adlp-1/igt@kms_big_fb@x-tiled-64bpp-rotate=
-0.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12846/shard-dg2-435/igt@kms_big_fb@x-tiled-8bpp-rotate=
-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/316">Intel XE#316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-lnl-6/igt@kms_big_fb@y-tiled-16bpp-rotate=
-0.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12846/shard-lnl-1/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html">SKIP</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel=
 XE#1124</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-bmg-6/igt@kms_big_fb@y-tiled-16bpp-rotate=
-180.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12846/shard-bmg-6/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html">SKIP</=
a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">I=
ntel XE#1124</a>) +7 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12846/shard-adlp-1/igt@kms_big_fb@y-tiled-16bpp-rotate=
-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12846/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stri=
de-32bpp-rotate-0-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0=
-hflip.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12846/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-r=
otate-0-hflip.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +11 other tests dmesg-fail=
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12846/shard-bmg-4/igt@kms_big_fb@y-tiled-max-hw-stride=
-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +7 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-dg2-436/igt@kms_big_fb@yf-tiled-16bpp-rot=
ate-0.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12846/shard-dg2-434/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html">SKIP=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124"=
>Intel XE#1124</a>) +7 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12846/shard-adlp-6/igt@kms_big_fb@yf-tiled-max-hw-stri=
de-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests =
skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12846/shard-lnl-1/igt@kms_big_fb@yf-tiled-max-hw-strid=
e-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-bmg-3/igt@kms_bw@connected-linear-tiling-=
3-displays-2560x1440p.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-bmg-1/igt@kms_bw@connected-linear-tiling-=
3-displays-2560x1440p.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-dg2-463/igt@kms_bw@connected-linear-tilin=
g-3-displays-2560x1440p.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12846/shard-dg2-436/igt@kms_bw@connected-linear-til=
ing-3-displays-2560x1440p.html">SKIP</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-bmg-7/igt@kms_bw@linear-tiling-2-displays=
-1920x1080p.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12846/shard-bmg-8/igt@kms_bw@linear-tiling-2-displays-1920x1080=
p.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12846/shard-lnl-8/igt@kms_bw@linear-tiling-2-displays-=
2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-dg2-466/igt@kms_bw@linear-tiling-3-displa=
ys-3840x2160p.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12846/shard-dg2-466/igt@kms_bw@linear-tiling-3-displays-3840x=
2160p.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/367">Intel XE#367</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12846/shard-bmg-3/igt@kms_bw@linear-tiling-4-displays-=
1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12846/shard-dg2-432/igt@kms_ccs@bad-aux-stride-y-tiled=
-ccs@pipe-a-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/787">Intel XE#787</a>) +168 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-bmg-8/igt@kms_ccs@bad-rotation-90-4-tiled=
-lnl-ccs@pipe-d-hdmi-a-3.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12846/shard-bmg-6/igt@kms_ccs@bad-rotation-90-4-ti=
led-lnl-ccs@pipe-d-hdmi-a-3.html">SKIP</a>) (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +8 ot=
her tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-c-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-4-t=
iled-mtl-rc-ccs-cc@pipe-c-dp-2.html">SKIP</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-432/igt@kms_ccs@ccs-on-anoth=
er-bo-4-tiled-mtl-rc-ccs-cc@pipe-c-dp-2.html">SKIP</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +93 oth=
er tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-4-t=
iled-mtl-rc-ccs-cc@pipe-d-dp-2.html">SKIP</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-432/igt@kms_ccs@ccs-on-anoth=
er-bo-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-2.html">SKIP</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787<=
/a>) +24 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12846/shard-lnl-8/igt@kms_ccs@ccs-on-another-bo-y-tile=
d-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-bmg-4/igt@kms_ccs@crc-primary-basic-y-til=
ed-ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12846/shard-bmg-8/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html">SK=
IP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/288=
7">Intel XE#2887</a>) +10 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-yf-tiled-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12846/shard-adlp-8/igt@kms_ccs@crc-primary-basic-yf-ti=
led-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12846/shard-adlp-8/igt@kms_ccs@crc-primary-basic-yf-ti=
led-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12846/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-1=
80-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-t=
iled-dg2-mc-ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12846/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-d=
g2-mc-ccs.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/3432">Intel XE#3432</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12846/shard-lnl-5/igt@kms_ccs@crc-primary-suspend-4-ti=
led-mtl-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12846/shard-adlp-2/igt@kms_ccs@crc-sprite-planes-basic=
-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-lnl-1/igt@kms_ccs@crc-sprite-planes-basic=
-4-tiled-bmg-ccs@pipe-a-edp-1.html">SKIP</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-6/igt@kms_ccs@crc-sprite-plan=
es-basic-4-tiled-bmg-ccs@pipe-a-edp-1.html">SKIP</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2669">Intel XE#2669</a>) +3 othe=
r tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12846/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basi=
c-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +=
33 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12846/shard-bmg-6/igt@kms_ccs@missing-ccs-buffer-4-til=
ed-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2887">Intel XE#2887</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.htm=
l">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12846/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846=
/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPL=
ETE</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/17=
27">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3124">Intel XE#3124</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-lnl-3/igt@kms_ccs@random-ccs-data-4-tiled=
-dg2-rc-ccs-cc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12846/shard-lnl-7/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc=
-ccs-cc.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2887">Intel XE#2887</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@=
pipe-c-dp-4.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12846/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-d=
g2-rc-ccs-cc@pipe-c-dp-4.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12846/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-=
tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html">INCOMPLETE</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#421=
2</a>) +1 other test ( 1 incomplete, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pip=
e-c-hdmi-a-6.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12846/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-=
dg2-rc-ccs@pipe-c-hdmi-a-6.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12846/shard-dg2-436/igt@kms_ccs@random-ccs-data-=
4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html">INCOMPLETE</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#=
3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
124">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-til=
ed-lnl-ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12846/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.=
html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12846/shard-bmg-2/igt@kms_ccs@random-ccs-data-4-tiled-=
lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +12 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-dg2-434/igt@kms_cdclk@plane-scaling@pipe-=
b-dp-4.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12846/shard-dg2-433/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html">SK=
IP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/441=
6">Intel XE#4416</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-bmg-2/igt@kms_chamelium_color@ctm-max.htm=
l">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_128=
46/shard-bmg-7/igt@kms_chamelium_color@ctm-max.html">SKIP</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>=
) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12846/shard-bmg-2/igt@kms_chamelium_color@ctm-red-to-b=
lue.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-dg2-432/igt@kms_chamelium_color@degamma.h=
tml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2846/shard-dg2-466/igt@kms_chamelium_color@degamma.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</=
a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-lnl-3/igt@kms_chamelium_color@gamma.html"=
>SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846=
/shard-lnl-3/igt@kms_chamelium_color@gamma.html">SKIP</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12846/shard-adlp-9/igt@kms_chamelium_color@gamma.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
06">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-aspect-ratio:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12846/shard-bmg-7/igt@kms_chamelium_frames@hdmi-aspect=
-ratio.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2252">Intel XE#2252</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-fast:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12846/shard-adlp-2/igt@kms_chamelium_frames@hdmi-crc-f=
ast.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/373">Intel XE#373</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-lnl-2/igt@kms_chamelium_frames@hdmi-crc-f=
ast.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12846/shard-lnl-5/igt@kms_chamelium_frames@hdmi-crc-fast.html">SKIP</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Inte=
l XE#373</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@vga-frame-dump:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-dg2-434/igt@kms_chamelium_frames@vga-fram=
e-dump.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12846/shard-dg2-433/igt@kms_chamelium_frames@vga-frame-dump.html">SK=
IP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/373=
">Intel XE#373</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-bmg-7/igt@kms_chamelium_hpd@common-hpd-af=
ter-suspend.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12846/shard-bmg-6/igt@kms_chamelium_hpd@common-hpd-after-suspen=
d.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2252">Intel XE#2252</a>) +5 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12846/shard-lnl-3/igt@kms_chamelium_hpd@dp-hpd-enable-=
disable-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12846/shard-dg2-432/igt@kms_content_protection@atomic-=
dpms@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1178">Intel XE#1178</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-bmg-2/igt@kms_content_protection@atomic@p=
ipe-a-dp-2.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12846/shard-bmg-2/igt@kms_content_protection@atomic@pipe-a-dp-2.=
html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-bmg-4/igt@kms_content_protection@dp-mst-l=
ic-type-1.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12846/shard-bmg-6/igt@kms_content_protection@dp-mst-lic-type-1.ht=
ml">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2390">Intel XE#2390</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12846/shard-adlp-2/igt@kms_content_protection@dp-mst-l=
ic-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/307">Intel XE#307</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-lnl-8/igt@kms_content_protection@dp-mst-l=
ic-type-1.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12846/shard-lnl-5/igt@kms_content_protection@dp-mst-lic-type-1.ht=
ml">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12846/shard-dg2-463/igt@kms_content_protection@lic-typ=
e-0@pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3304">Intel XE#3304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-bmg-2/igt@kms_content_protection@mei-inte=
rface.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12846/shard-bmg-8/igt@kms_content_protection@mei-interface.html">SKIP=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341"=
>Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-bmg-6/igt@kms_content_protection@uevent.h=
tml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2846/shard-bmg-2/igt@kms_content_protection@uevent.html">FAIL</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341"=
>Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12846/shard-bmg-2/igt@kms_content_protection@uevent@pi=
pe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12846/shard-dg2-433/igt@kms_content_protection@uevent@=
pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x42:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-adlp-9/igt@kms_cursor_crc@cursor-offscreen-128x42.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_128=
46/shard-adlp-8/igt@kms_cursor_crc@cursor-offscreen-128x42.html">DMESG-WARN=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">=
Intel XE#4173</a>) +12 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-256x85:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12846/shard-bmg-6/igt@kms_cursor_crc@cursor-offscreen-=
256x85.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2320">Intel XE#2320</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x32:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12846/shard-lnl-8/igt@kms_cursor_crc@cursor-offscreen-=
32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-dg2-433/igt@kms_cursor_crc@cursor-onscree=
n-512x512.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12846/shard-dg2-435/igt@kms_cursor_crc@cursor-onscreen-512x512.ht=
ml">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-bmg-6/igt@kms_cursor_crc@cursor-random-32=
x32.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12846/shard-bmg-8/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Int=
el XE#2320</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-max-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-lnl-3/igt@kms_cursor_crc@cursor-random-ma=
x-size.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12846/shard-lnl-5/igt@kms_cursor_crc@cursor-random-max-size.html">SK=
IP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/142=
4">Intel XE#1424</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12846/shard-bmg-8/igt@kms_cursor_crc@cursor-sliding-51=
2x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2321">Intel XE#2321</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-7/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html"=
>PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12846/shard-bmg-7/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/sha=
rd-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a>) (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE=
#2291</a>) +2 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-bmg-4/igt@kms_cursor_legacy@basic-busy-fl=
ip-before-cursor-atomic.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12846/shard-bmg-1/igt@kms_cursor_legacy@basic-busy-=
flip-before-cursor-atomic.html">SKIP</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-dg2-463/igt@kms_cursor_legacy@basic-busy-=
flip-before-cursor-varying-size.html">SKIP</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-434/igt@kms_cursor_legacy@b=
asic-busy-flip-before-cursor-varying-size.html">SKIP</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-432/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-siz=
e.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12846/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-=
size.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12846/shard-dg2-435/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-siz=
e.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/309">Intel XE#309</a>) +4 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-fl=
ipb-legacy.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12846/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.=
html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12846/shard-bmg-7/igt@kms_cursor_legacy@short-busy-fli=
p-before-cursor-atomic-transitions.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12846/shard-bmg-7/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1508">Intel XE#1508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-4/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">PASS</a> =
-&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/sha=
rd-bmg-2/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-6/igt@kms_dit=
her@fb-8bpc-vs-panel-6bpc.html">SKIP</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1340">Intel XE#1340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-bmg-2/igt@kms_dither@fb-8bpc-vs-panel-6bp=
c@pipe-a-hdmi-a-3.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12846/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pi=
pe-a-hdmi-a-3.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1340">Intel XE#1340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-bmg-6/igt@kms_dp_aux_dev.html">SKIP</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-=
7/igt@kms_dp_aux_dev.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3009">Intel XE#3009</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12846/shard-dg2-464/igt@kms_dp_linktrain_fallback@dp-f=
allback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4331">Intel XE#4331</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-bmg-8/igt@kms_dsc@dsc-fractional-bpp-with=
-bpc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12846/shard-bmg-7/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</=
a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">I=
ntel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-dg2-434/igt@kms_dsc@dsc-with-bpc-formats.=
html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12846/shard-dg2-435/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455=
</a>) +13 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-dg2-463/igt@kms_fbc_dirty_rect@fbc-dirty-=
rectangle-different-formats.html">SKIP</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-436/igt@kms_fbc_dirty_rect@fbc-=
dirty-rectangle-different-formats.html">SKIP</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12846/shard-adlp-2/igt@kms_fbc_dirty_rect@fbc-dirty-re=
ctangle-dirtyfb-tests.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12846/shard-bmg-6/igt@kms_fbc_dirty_rect@fbc-dirty-rec=
tangle-dirtyfb-tests.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-lnl-5/igt@kms_fbc_dirty_rect@fbc-dirty-re=
ctangle-dirtyfb-tests.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-lnl-6/igt@kms_fbc_dirty_rect@fbc-dirty-re=
ctangle-dirtyfb-tests.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-bmg-8/igt@kms_fbc_dirty_rect@fbc-dirty-re=
ctangle-out-visible-area.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12846/shard-bmg-6/igt@kms_fbc_dirty_rect@fbc-dirty=
-rectangle-out-visible-area.html">SKIP</a>) (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>) +1 other test ( 2=
 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-432/igt@kms_flip@2x-absolute-wf_vblank.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shar=
d-dg2-464/igt@kms_flip@2x-absolute-wf_vblank.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-433/igt@kms_flip@2x-absolute-wf_vblank-interruptible.h=
tml">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12846/shard-dg2-464/igt@kms_flip@2x-absolute-wf_vblank-interruptible.h=
tml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2846/shard-dg2-464/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html">S=
KIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/31=
0">Intel XE#310</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12846/shard-bmg-6/igt@kms_flip@2x-absolute-wf_vblank-i=
nterruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-3/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1284=
6/shard-bmg-6/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE=
#2316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-bmg-2/igt@kms_flip@2x-flip-vs-dpms-off-vs=
-modeset-interruptible.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12846/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-off-v=
s-modeset-interruptible.html">SKIP</a>) (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +2 other tests ( 1 pa=
ss, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible=
@ab-dp2-hdmi-a3.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12846/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vbla=
nk-interruptible@ab-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a=
3.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12846/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdm=
i-a3.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12846/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a=
3.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-=
dp4.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12846/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdm=
i-a6-dp4.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12846/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi=
-a6-dp4.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/301">Intel XE#301</a>) +1 other test ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a=
3.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12846/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdm=
i-a3.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12846/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a=
3.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-463/igt@kms_flip@2x-flip-vs-modeset.html">PASS</a> -&g=
t; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-=
dg2-435/igt@kms_flip@2x-flip-vs-modeset.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-464/igt@kms_flip@2x=
-flip-vs-modeset.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/310">Intel XE#310</a>) +9 other tests ( 1 pass, 1 ski=
p )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-lnl-6/igt@kms_flip@2x-flip-vs-rmfb-interr=
uptible.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12846/shard-lnl-2/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html">=
SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
421">Intel XE#1421</a>) +5 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12846/shard-lnl-1/igt@kms_flip@2x-nonexisting-fb.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
421">Intel XE#1421</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-7/igt@kms_flip@2x-plain-flip.html">PASS</a> -&gt; (<a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-4/i=
gt@kms_flip@2x-plain-flip.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12846/shard-bmg-7/igt@kms_flip@2x-plain-flip.html=
">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2316">Intel XE#2316</a>) +6 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12846/shard-bmg-1/igt@kms_flip@2x-plain-flip-fb-recrea=
te-interruptible.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2882">Intel XE#2882</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ac-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-433/igt@kms_flip@2x-plain-flip-fb-recreate-interruptib=
le@ac-hdmi-a6-dp4.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12846/shard-dg2-434/igt@kms_flip@2x-plain-flip-fb-re=
create-interruptible@ac-hdmi-a6-dp4.html">FAIL</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) +3 other t=
ests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-3/igt@kms_flip@2x-plain-flip-interruptible.html">PASS<=
/a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846=
/shard-bmg-6/igt@kms_flip@2x-plain-flip-interruptible.html">SKIP</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-4/igt=
@kms_flip@2x-plain-flip-interruptible.html">SKIP</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +2 othe=
r tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-dg2-464/igt@kms_flip@2x-single-buffer-fli=
p-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-434/igt@kms_flip@2x-=
single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html">PASS</a>) (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#=
310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check-interruptible:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12846/shard-adlp-2/igt@kms_flip@2x-wf_vblank-ts-check-=
interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/310">Intel XE#310</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-lnl-4/igt@kms_flip@flip-vs-absolute-wf_vblank.html">PASS</=
a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/=
shard-lnl-4/igt@kms_flip@flip-vs-absolute-wf_vblank.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-3/igt@k=
ms_flip@flip-vs-absolute-wf_vblank.html">FAIL</a>) (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +3 other tes=
ts ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-432/igt@kms_flip@flip-vs-blocking-wf-vblank.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846=
/shard-dg2-436/igt@kms_flip@flip-vs-blocking-wf-vblank.html">INCOMPLETE</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Inte=
l XE#2049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12846/shard-dg2-436/igt@kms_flip@flip-vs-blocking-wf-v=
blank@a-dp4.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2049">Intel XE#2049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12846/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblan=
k-interruptible@a-dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-dg2-464/igt@kms_flip@flip-vs-expired-vbla=
nk-interruptible@b-hdmi-a6.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12846/shard-dg2-433/igt@kms_flip@flip-vs-expired=
-vblank-interruptible@b-hdmi-a6.html">PASS</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-dg2-464/igt@kms_flip@flip-vs-expired-vbla=
nk-interruptible@c-hdmi-a6.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12846/shard-dg2-433/igt@kms_flip@flip-vs-expired=
-vblank-interruptible@c-hdmi-a6.html">FAIL</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test (=
 2 fail )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning@c-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-434/igt@kms_flip@flip-vs-panning@c-dp4.html">PASS</a> =
-&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/sha=
rd-dg2-466/igt@kms_flip@flip-vs-panning@c-dp4.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-434/igt@kms_f=
lip@flip-vs-panning@c-dp4.html">INCOMPLETE</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>) +1 other test=
 ( 1 incomplete, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-bmg-7/igt@kms_flip@flip-vs-suspend-interr=
uptible.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12846/shard-bmg-3/igt@kms_flip@flip-vs-suspend-interruptible.html">=
INCOMPLETE</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2049">Intel XE#2049</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2597">Intel XE#2597</a>) +1 other test ( 1 incomplete, 1=
 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-dg2-433/igt@kms_flip@flip-vs-suspend@d-dp=
4.html">INCOMPLETE</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12846/shard-dg2-466/igt@kms_flip@flip-vs-suspend@d-dp4.html">PASS</=
a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">I=
ntel XE#2049</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2597">Intel XE#2597</a>) +1 other test ( 1 incomplete, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible@a-dp2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-4/igt@kms_flip@wf_vblank-ts-check-interruptible@a-dp2.=
html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12846/shard-bmg-4/igt@kms_flip@wf_vblank-ts-check-interruptible@a-dp2=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12846/shard-bmg-2/igt@kms_flip@wf_vblank-ts-check-interruptible@a-dp2.html=
">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2882">Intel XE#2882</a>) +1 other test ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12846/shard-adlp-4/igt@kms_flip_scaled_crc@flip-32bpp-=
ytile-to-32bpp-ytileccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests=
 skip</li>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-=
ytile-to-32bpp-ytileccs-upscaling.html">SKIP</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-2/igt@kms_flip_scaled_crc=
@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html">SKIP</a>) (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Inte=
l XE#2380</a>) +5 other tests ( 2 skip )</li>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-=
ytile-to-32bpp-ytileccs-upscaling.html">SKIP</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-4/igt@kms_flip_scaled_crc=
@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html">SKIP</a>) (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Inte=
l XE#1745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pip=
e-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-=
ytile-to-32bpp-ytileccs-upscaling@pipe-a-default-mode.html">SKIP</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-1/igt=
@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-de=
fault-mode.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1401">Intel XE#1401</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12846/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#23=
80</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12846/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel X=
E#2293</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12846/shard-dg2-464/igt@kms_flip_scaled_crc@flip-64bpp=
-yftile-to-32bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +2 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-y=
tile-downscaling@pipe-a-valid-mode.html">PASS</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-adlp-1/igt@kms_flip_sca=
led_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html"=
>DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/324">Intel XE#324</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4543">Intel XE#4543</a>) +3 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-=
ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-=
1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscali=
ng@pipe-a-valid-mode.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>) +5 other tests ( 2 skip =
)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12846/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-1p=
-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2=
p-primscrn-cur-indfb-draw-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-6/igt@kms_frontbuffer_trackin=
g@drrs-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +1 othe=
r test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12846/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p=
-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +3 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs=
-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-464/igt@kms_frontbuffer_tra=
cking@drrs-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#65=
6</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2=
p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-1/igt@kms_frontbuffer_tra=
cking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a>) (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Inte=
l XE#2312</a>) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12846/shard-adlp-9/igt@kms_frontbuffer_tracking@drrs-2=
p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +5 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs=
-rgb101010-draw-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12846/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-r=
gb101010-draw-blt.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/651">Intel XE#651</a>) +9 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-2p=
-primscrn-cur-indfb-move.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12846/shard-lnl-8/igt@kms_frontbuffer_tracking@fbc=
-2p-primscrn-cur-indfb-move.html">SKIP</a>) (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +7 other tests ( 2 =
skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-i=
ndfb-draw-render.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12846/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc=
-2p-primscrn-spr-indfb-draw-render.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-464/igt@kms_frontbuffer_=
tracking@fbc-2p-primscrn-spr-indfb-draw-render.html">SKIP</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) =
+7 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-i=
ndfb-draw-render.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12846/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc=
-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-464/igt@kms_frontbuffer_=
tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) =
+1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb=
-msflip-blt.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12846/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-sc=
ndscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p=
-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-6/igt@kms_frontbuffer_trac=
king@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel =
XE#4141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12846/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-=
scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +6 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-linear:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-ti=
ling-linear.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12846/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-tiling-linea=
r.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4141">Intel XE#4141</a>) +7 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrr=
s-1p-primscrn-indfb-msflip-blt.html">SKIP</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-6/igt@kms_frontbuffer_tracki=
ng@fbcdrrs-1p-primscrn-indfb-msflip-blt.html">SKIP</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 othe=
r tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-render:<=
/p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12846/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrr=
s-1p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other tes=
t skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12846/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs=
-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +8 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrr=
s-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-2/igt@kms_frontbuffer_=
tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#231=
1</a>) +17 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12846/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdr=
rs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12846/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr=
-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other test =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12846/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-=
2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +13 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr=
-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-3/igt@kms_frontbuffer_track=
ing@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE=
#2313</a>) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-suspend:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html">PA=
SS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
846/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html">DMESG-WAR=
N</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/sha=
rd-lnl-8/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html">PASS</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2932">Intel XE#29=
32</a>) +6 other tests ( 1 dmesg-warn, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12846/shard-adlp-8/igt@kms_frontbuffer_tracking@plane-=
fbc-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4439">Intel XE#4439</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-bmg-8/igt@kms_frontbuffer_tracking@plane-=
fbc-rte.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12846/shard-bmg-3/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">=
SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
439">Intel XE#4439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-=
1p-primscrn-pri-shrfb-draw-render.html">SKIP</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-435/igt@kms_frontbuffer_t=
racking@psr-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a>) (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +=
8 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12846/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2=
p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +2 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12846/shard-lnl-8/igt@kms_frontbuffer_tracking@psr-2p-=
scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +1 other test skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-=
2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-466/igt@kms_frontbuffer_=
tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a>) (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel=
 XE#656</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12846/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-r=
gb565-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/653">Intel XE#653</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-rg=
b565-draw-mmap-wc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12846/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-rgb565=
-draw-mmap-wc.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2313">Intel XE#2313</a>) +16 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-2/igt@kms_hdr@invalid-hdr.html">PASS</a> -&gt; (<a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-1/igt@=
kms_hdr@invalid-hdr.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12846/shard-bmg-2/igt@kms_hdr@invalid-hdr.html">PASS</a=
>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">In=
tel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-463/igt@kms_joiner@basic-force-big-joiner.html">PASS</=
a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/=
shard-dg2-432/igt@kms_joiner@basic-force-big-joiner.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-464/igt=
@kms_joiner@basic-force-big-joiner.html">SKIP</a>) (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4328">Intel XE#4328</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-3/igt@kms_joiner@basic-force-big-joiner.html">PASS</a>=
 -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/sh=
ard-bmg-7/igt@kms_joiner@basic-force-big-joiner.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-6/igt@kms_j=
oiner@basic-force-big-joiner.html">SKIP</a>) (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/3012">Intel XE#3012</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12846/shard-bmg-7/igt@kms_pipe_stress@stress-xrgb8888-=
ytiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4329">Intel XE#4329</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-1-size-64:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-adlp-2/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-1-size-6=
4.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12846/shard-adlp-1/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-1-size=
-64.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1471">Intel XE#1471</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-434/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-=
64.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12846/shard-dg2-436/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-s=
ize-64.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12846/shard-dg2-464/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-siz=
e-64.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/616">Intel XE#616</a>) +1 other test ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-2/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1284=
6/shard-bmg-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571">Intel XE=
#2571</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-432/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
846/shard-dg2-464/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel=
 XE#309</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12846/shard-dg2-432/igt@kms_plane_scaling@intel-max-sr=
c-size.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4540">Intel XE#4540</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12846/shard-dg2-432/igt@kms_plane_scaling@intel-max-sr=
c-size@pipe-a-dp-2.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4212">Intel XE#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-bmg-1/igt@kms_plane_scaling@planes-downsc=
ale-factor-0-75@pipe-a.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12846/shard-bmg-8/igt@kms_plane_scaling@planes-downs=
cale-factor-0-75@pipe-a.html">SKIP</a>) (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +9 other tests ( 2 sk=
ip )</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b:=
</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12846/shard-bmg-8/igt@kms_plane_scaling@planes-unity-s=
caling-downscale-factor-0-25@pipe-b.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +4 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-bmg-6/igt@kms_pm_backlight@fade-with-dpms=
.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12846/shard-bmg-8/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#8=
70</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-bmg-4/igt@kms_pm_dc@dc3co-vpb-simulation.=
html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12846/shard-bmg-8/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391">Intel XE#23=
91</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-lnl-5/igt@kms_pm_dc@dc5-dpms.html">PASS</a> -&gt; (<a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-6/igt@k=
ms_pm_dc@dc5-dpms.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12846/shard-lnl-6/igt@kms_pm_dc@dc5-dpms.html">PASS</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel =
XE#718</a>) +1 other test ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-bmg-7/igt@kms_pm_dc@deep-pkgc.html">SKIP<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard=
-bmg-2/igt@kms_pm_dc@deep-pkgc.html">SKIP</a>) (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2505">Intel XE#2505</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-dg2-432/igt@kms_pm_dc@deep-pkgc.html">SKI=
P</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/sha=
rd-dg2-433/igt@kms_pm_dc@deep-pkgc.html">SKIP</a>) (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12846/shard-bmg-7/igt@kms_pm_rpm@dpms-mode-unset-lpsp.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-bmg-1/igt@kms_psr2_sf@fbc-pr-cursor-plane=
-move-continuous-sf.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12846/shard-bmg-8/igt@kms_psr2_sf@fbc-pr-cursor-plane-m=
ove-continuous-sf.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +4 other tests ( 2 skip )</=
li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12846/shard-lnl-2/igt@kms_psr2_sf@fbc-pr-cursor-plane-=
update-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2893">Intel XE#2893</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12846/shard-bmg-3/igt@kms_psr2_sf@fbc-psr2-overlay-pla=
ne-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12846/shard-dg2-435/igt@kms_psr2_sf@fbc-psr2-primary-p=
lane-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-lnl-7/igt@kms_psr2_sf@pr-overlay-primary-=
update-sf-dmg-area.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12846/shard-lnl-5/igt@kms_psr2_sf@pr-overlay-primary-upd=
ate-sf-dmg-area.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2893">Intel XE#2893</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12846/shard-adlp-4/igt@kms_psr2_sf@pr-overlay-primary-=
update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-dg2-463/igt@kms_psr2_sf@psr2-primary-plan=
e-update-sf-dmg-area.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12846/shard-dg2-433/igt@kms_psr2_sf@psr2-primary-plane=
-update-sf-dmg-area.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test ( 2 skip )<=
/li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12846/shard-adlp-2/igt@kms_psr@fbc-psr-primary-render.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/929">Intel XE#929</a>) +3 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12846/shard-bmg-1/igt@kms_psr@fbc-psr-primary-render.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2850">Intel XE#2850</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12846/shard-dg2-432/igt@kms_psr@fbc-psr-sprite-blt.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/929">Intel XE#929</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-basic@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-lnl-1/igt@kms_psr@fbc-psr2-basic@edp-1.ht=
ml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
846/shard-lnl-2/igt@kms_psr@fbc-psr2-basic@edp-1.html">FAIL</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4568">Intel XE#4568=
</a>) +1 other test ( 2 fail )</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-bmg-4/igt@kms_psr@fbc-psr2-cursor-plane-m=
ove.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12846/shard-bmg-3/igt@kms_psr@fbc-psr2-cursor-plane-move.html">SKIP</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Int=
el XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2850">Intel XE#2850</a>) +9 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-dg2-436/igt@kms_psr@fbc-psr2-dpms.html">S=
KIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/s=
hard-dg2-435/igt@kms_psr@fbc-psr2-dpms.html">SKIP</a>) (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929=
</a>) +7 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-page-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-lnl-4/igt@kms_psr@pr-primary-page-flip.ht=
ml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
846/shard-lnl-4/igt@kms_psr@pr-primary-page-flip.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406=
</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-bmg-6/igt@kms_psr_stress_test@flip-primar=
y-invalidate-overlay.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12846/shard-bmg-3/igt@kms_psr_stress_test@flip-primary=
-invalidate-overlay.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2414">Intel XE#2414</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-dg2-466/igt@kms_psr_stress_test@flip-prim=
ary-invalidate-overlay.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12846/shard-dg2-435/igt@kms_psr_stress_test@flip-pri=
mary-invalidate-overlay.html">SKIP</a>) (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2939">Intel XE#2939</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-bmg-6/igt@kms_rotation_crc@bad-pixel-form=
at.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12846/shard-bmg-7/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel=
 XE#3414</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12846/shard-bmg-4/igt@kms_setmode@basic-clone-single-c=
rtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1435">Intel XE#1435</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-2/igt@kms_setmode@invalid-clone-single-crtc-stealing.h=
tml">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12846/shard-bmg-8/igt@kms_setmode@invalid-clone-single-crtc-stealing.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2846/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc-stealing.html">S=
KIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/14=
35">Intel XE#1435</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-432/igt@kms_setmode@invalid-clone-single-crtc-stealing=
.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12846/shard-dg2-434/igt@kms_setmode@invalid-clone-single-crtc-steali=
ng.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12846/shard-dg2-464/igt@kms_setmode@invalid-clone-single-crtc-stealing.h=
tml">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-bmg-4/igt@kms_tiled_display@basic-test-pa=
ttern-with-chamelium.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12846/shard-bmg-7/igt@kms_tiled_display@basic-test-pat=
tern-with-chamelium.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2426">Intel XE#2426</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.=
html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12846/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1=
.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12846/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html=
">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/771">Intel XE#771</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-=
a-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12846/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak@pipe-c-h=
dmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-lnl-1/igt@kms_vrr@cmrr@pipe-a-edp-1.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-5=
/igt@kms_vrr@cmrr@pipe-a-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4459">Intel XE#4459</a>) +1 other test f=
ail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12846/shard-bmg-8/igt@kms_vrr@max-min.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel =
XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12846/shard-lnl-4/igt@kms_vrr@seamless-rr-switch-vrr.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-bmg-2/igt@kms_writeback@writeback-check-o=
utput.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12846/shard-bmg-7/igt@kms_writeback@writeback-check-output.html">SKIP=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">=
Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12846/shard-bmg-8/igt@kms_writeback@writeback-check-ou=
tput-xrgb2101010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-dg2-436/igt@kms_writeback@writeback-check=
-output-xrgb2101010.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12846/shard-dg2-434/igt@kms_writeback@writeback-check-o=
utput-xrgb2101010.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@block-copy-compressed-inc-dimension:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12846/shard-adlp-1/igt@xe_ccs@block-copy-compressed-in=
c-dimension.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/488">Intel XE#488</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-parameters:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-dg2-466/igt@xe_eudebug@basic-vm-access-pa=
rameters.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12846/shard-dg2-464/igt@xe_eudebug@basic-vm-access-parameters.html=
">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2905">Intel XE#2905</a>) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-parameters-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-lnl-4/igt@xe_eudebug@basic-vm-access-para=
meters-userptr.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12846/shard-lnl-8/igt@xe_eudebug@basic-vm-access-parameters-=
userptr.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2905">Intel XE#2905</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3889">Intel XE#3889</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-race-sigint:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-bmg-4/igt@xe_eudebug@discovery-race-sigin=
t.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12846/shard-bmg-6/igt@xe_eudebug@discovery-race-sigint.html">SKIP</a>) (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel X=
E#2905</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4259">Intel XE#4259</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@multigpu-basic-client-many:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12846/shard-lnl-1/igt@xe_eudebug@multigpu-basic-client=
-many.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2905">Intel XE#2905</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12846/shard-adlp-4/igt@xe_eudebug@multigpu-basic-clien=
t-many.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2905">Intel XE#2905</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@read-metadata:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12846/shard-bmg-7/igt@xe_eudebug@read-metadata.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/290=
5">Intel XE#2905</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@basic-breakpoint:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-bmg-6/igt@xe_eudebug_online@basic-breakpo=
int.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12846/shard-bmg-7/igt@xe_eudebug_online@basic-breakpoint.html">SKIP</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Int=
el XE#2905</a>) +5 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@set-breakpoint-sigint-debugger:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12846/shard-adlp-4/igt@xe_eudebug_online@set-breakpoin=
t-sigint-debugger.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4577">Intel XE#4577</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12846/shard-bmg-2/igt@xe_eudebug_online@set-breakpoint=
-sigint-debugger.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4577">Intel XE#4577</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-lnl-4/igt@xe_eudebug_online@set-breakpoin=
t-sigint-debugger.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12846/shard-lnl-6/igt@xe_eudebug_online@set-breakpoint-si=
gint-debugger.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4577">Intel XE#4577</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-eudebug:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-lnl-5/igt@xe_eudebug_sriov@deny-eudebug.h=
tml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2846/shard-lnl-8/igt@xe_eudebug_sriov@deny-eudebug.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518">Intel XE#4518=
</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12846/shard-adlp-2/igt@xe_eudebug_sriov@deny-eudebug.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4519">Intel XE#4519</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-bmg-4/igt@xe_eudebug_sriov@deny-eudebug.h=
tml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2846/shard-bmg-6/igt@xe_eudebug_sriov@deny-eudebug.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518">Intel XE#4518=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-sriov:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-dg2-434/igt@xe_eudebug_sriov@deny-sriov.h=
tml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2846/shard-dg2-466/igt@xe_eudebug_sriov@deny-sriov.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518">Intel XE#4518=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-external-cm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-lnl-6/igt@xe_evict@evict-beng-large-exter=
nal-cm.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12846/shard-lnl-8/igt@xe_evict@evict-beng-large-external-cm.html">SK=
IP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/688=
">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind:=
</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-435/igt@xe_exec_basic@multigpu-many-execqueues-many-vm=
-bindexecqueue-rebind.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-432/igt@xe_exec_basic@multigpu-=
many-execqueues-many-vm-bindexecqueue-rebind.html">SKIP</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind.html">SKIP</a=
>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">In=
tel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12846/shard-bmg-2/igt@xe_exec_basic@multigpu-many-exec=
queues-many-vm-bindexecqueue-userptr.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +3 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-ra=
ce:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-464/igt@xe_exec_basic@multigpu-many-execqueues-many-vm=
-userptr-invalidate-race.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-432/igt@xe_exec_basic@multigp=
u-many-execqueues-many-vm-userptr-invalidate-race.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12846/shard-adlp-6/igt@xe_exec_basic@multigpu-no-exec-=
basic-defer-bind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-lnl-2/igt@xe_exec_basic@multigpu-no-exec-=
basic-defer-bind.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12846/shard-lnl-8/igt@xe_exec_basic@multigpu-no-exec-basic=
-defer-bind.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-463/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-u=
serptr-rebind.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12846/shard-dg2-466/igt@xe_exec_basic@multigpu-no-exec-=
bindexecqueue-userptr-rebind.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-432/igt@xe_exec_basic@multigpu=
-no-exec-bindexecqueue-userptr-rebind.html">SKIP</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +3 othe=
r tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-dg2-466/igt@xe_exec_basic@multigpu-no-exe=
c-null-defer-bind.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12846/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-nu=
ll-defer-bind.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test ( 1 pass, 1 skip =
)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-bmg-3/igt@xe_exec_basic@multigpu-once-nul=
l-rebind.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12846/shard-bmg-1/igt@xe_exec_basic@multigpu-once-null-rebind.html=
">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2322">Intel XE#2322</a>) +5 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12846/shard-dg2-463/igt@xe_exec_fault_mode@many-bindex=
ecqueue-userptr-imm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/288">Intel XE#288</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-prefetch:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12846/shard-adlp-2/igt@xe_exec_fault_mode@many-bindexe=
cqueue-userptr-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-dg2-436/igt@xe_exec_fault_mode@many-execq=
ueues-userptr-invalidate-imm.html">SKIP</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-464/igt@xe_exec_fault_mode@man=
y-execqueues-userptr-invalidate-imm.html">SKIP</a>) (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +13 other t=
ests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-dg2-433/igt@xe_exec_mix_modes@exec-spinne=
r-interrupted-lr.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12846/shard-dg2-463/igt@xe_exec_mix_modes@exec-spinner-int=
errupted-lr.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip_eudebug@breakpoint-writesip-twice:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12846/shard-dg2-466/igt@xe_exec_sip_eudebug@breakpoint=
-writesip-twice.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2905">Intel XE#2905</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-dg2-464/igt@xe_huc_copy@huc_copy.html">SK=
IP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/sh=
ard-dg2-432/igt@xe_huc_copy@huc_copy.html">SKIP</a>) (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-432/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kuni=
t.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12846/shard-dg2-434/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_k=
unit.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12846/shard-dg2-464/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kuni=
t.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1999">Intel XE#1999</a>) +2 other tests ( 2 fail )</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12846/shard-bmg-1/igt@xe_media_fill@media-fill.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/245=
9">Intel XE#2459</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2596">Intel XE#2596</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGT_8288/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-7/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGT_8288/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-4/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8288/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-1/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGT_8288/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-3/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGT_8288/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-3=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGT_8288/shard-lnl-1/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-ln=
l-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGT_8288/shard-lnl-6/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard=
-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-2/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/sh=
ard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-7/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288=
/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-4/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8=
288/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-3/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
T_8288/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-6/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGT_8288/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-lnl-1/igt@xe_module_=
load@load.html">PASS</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12846/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-=
4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12846/shard-lnl-1/igt@xe_module_load@load.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/s=
hard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-6/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12846/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-4/igt@xe_module=
_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12846/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-8/igt@=
xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12846/shard-lnl-8/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-l=
nl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-1/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1284=
6/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-2/igt@xe_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12846/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-7/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12846/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-3/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12846/shard-lnl-2/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shar=
d-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-5/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2846/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-5/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12846/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-7/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12846/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-ln=
l-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-1/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846=
/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-7/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12846/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-8/igt@xe_modu=
le_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12846/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-1/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-lnl-8/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard=
-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-4/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
846/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-3/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12846/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-8/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12846/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-3=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12846/shard-lnl-3/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/sh=
ard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-6/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12846/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-5/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12846/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378<=
/a>)</li>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGT_8288/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-4/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGT_8288/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-3/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8288/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-2/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGT_8288/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-6/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGT_8288/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-6=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGT_8288/shard-bmg-3/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bm=
g-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGT_8288/shard-bmg-7/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard=
-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-4/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/sh=
ard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-7/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288=
/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-bmg-2/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8=
288/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>) -&gt; (<a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-8/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12846/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-2/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12846/shard-bmg-4/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shar=
d-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-4/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2846/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-8/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12846/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-7/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12846/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bm=
g-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-7/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846=
/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-3/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12846/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-3/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12846/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-2/ig=
t@xe_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-bmg-6/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard=
-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-6/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
846/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-8/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12846/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-3/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_12846/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-8=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12846/shard-bmg-7/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/sh=
ard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-4/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12846/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-6/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12846/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-3/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12846/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bm=
g-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-6/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846=
/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-2/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12846/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-2/igt@xe_modu=
le_load@load.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2457">Intel XE#2457</a>)</li>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGT_8288/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-6/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGT_8288/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-6/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGT_8288/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-1/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGT_8288/shard-adlp-2/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-ad=
lp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGT_8288/shard-adlp-2/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/sha=
rd-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-9/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_828=
8/shard-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-9/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
T_8288/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-1/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGT_8288/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-4/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGT_8288/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-4/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGT_8288/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-adlp-4/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGT_8288/shard-adlp-8/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/shard-ad=
lp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGT_8288/shard-adlp-8/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8288/sha=
rd-adlp-8/igt@xe_module_load@load.html">PASS</a>) -&gt; (<a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-adlp-8/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12846/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-adlp-8/igt@=
xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12846/shard-adlp-6/igt@xe_module_load@load.html">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-=
adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12846/shard-adlp-6/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2846/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-adlp-6/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12846/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-adlp-9/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12846/shard-adlp-9/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard=
-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12846/shard-adlp-2/igt@xe_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12846/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-adlp-1/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12846/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-adlp-4/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-adlp-4/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shar=
d-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-adlp-1/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12846/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-adlp-2/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12846/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-adlp-4/i=
gt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12846/shard-adlp-4/igt@xe_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/sha=
rd-adlp-4/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-adlp-9/igt@xe_module_load@many-reload.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-adl=
p-8/igt@xe_module_load@many-reload.html">DMESG-WARN</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4=
173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@buffer-size:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-lnl-3/igt@xe_oa@buffer-size.html">PASS</a> -&gt; (<a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-1/igt@x=
e_oa@buffer-size.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12846/shard-lnl-5/igt@xe_oa@buffer-size.html">FAIL</a>) (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4541">Intel X=
E#4541</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@buffer-size@rcs-0-128k:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12846/shard-lnl-5/igt@xe_oa@buffer-size@rcs-0-128k.htm=
l">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4541">Intel XE#4541</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@create-destroy-userspace-config:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12846/shard-adlp-6/igt@xe_oa@create-destroy-userspace-=
config.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +1 other test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-dg2-436/igt@xe_oa@create-destroy-userspac=
e-config.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12846/shard-dg2-436/igt@xe_oa@create-destroy-userspace-config.html=
">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/3573">Intel XE#3573</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_oa@privileged-forked-access-vaddr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12846/shard-dg2-464/igt@xe_oa@privileged-forked-access=
-vaddr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-syncobj-wait:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-dg2-464/igt@xe_oa@syncs-syncobj-wait.html=
">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1284=
6/shard-dg2-434/igt@xe_oa@syncs-syncobj-wait.html">SKIP</a>) (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel=
 XE#3573</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4501">Intel XE#4501</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12846/shard-dg2-466/igt@xe_peer2peer@read@read-gpua-vr=
am01-gpub-system-p2p.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-dg2-435/igt@xe_pm@d3cold-mocs.html">SKIP<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard=
-dg2-435/igt@xe_pm@d3cold-mocs.html">SKIP</a>) (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12846/shard-bmg-7/igt@xe_pm@s3-d3cold-basic-exec.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
284">Intel XE#2284</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12846/shard-dg2-464/igt@xe_pm@s3-d3cold-basic-exec.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3hot-basic-exec:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-lnl-8/igt@xe_pm@s3-d3hot-basic-exec.html"=
>SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846=
/shard-lnl-4/igt@xe_pm@s3-d3hot-basic-exec.html">SKIP</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/584">Intel XE#584</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-adlp-8/igt@xe_pm@s4-multiple-execs.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-adlp-9=
/igt@xe_pm@s4-multiple-execs.html">ABORT</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) +1 other test ab=
ort</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-lnl-3/igt@xe_pm@s4-multiple-execs.html">PASS</a> -&gt; (<a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-2/=
igt@xe_pm@s4-multiple-execs.html">ABORT</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-5/igt@xe_pm@s4-multiple-execs.=
html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-bmg-6/igt@xe_query@multigpu-query-invalid=
-extension.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12846/shard-bmg-3/igt@xe_query@multigpu-query-invalid-extension.=
html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/944">Intel XE#944</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12846/shard-adlp-1/igt@xe_query@multigpu-query-invalid=
-extension.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/944">Intel XE#944</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-lnl-5/igt@xe_query@multigpu-query-invalid=
-extension.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12846/shard-lnl-3/igt@xe_query@multigpu-query-invalid-extension.=
html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/944">Intel XE#944</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-oa-units:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12846/shard-bmg-7/igt@xe_query@multigpu-query-oa-units=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-guc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-dg2-436/igt@xe_query@multigpu-query-uc-fw=
-version-guc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12846/shard-dg2-466/igt@xe_query@multigpu-query-uc-fw-version-=
guc.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/944">Intel XE#944</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@fair-allocation:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-lnl-2/igt@xe_sriov_auto_provisioning@fair=
-allocation.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12846/shard-lnl-5/igt@xe_sriov_auto_provisioning@fair-allocatio=
n.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-bmg-1/igt@xe_sriov_flr@flr-vf1-clear.html=
">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1284=
6/shard-bmg-7/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a>) (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@equal-throughput:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-bmg-8/igt@xe_sriov_scheduling@equal-throu=
ghput.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12846/shard-bmg-1/igt@xe_sriov_scheduling@equal-throughput.html">SKIP=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351"=
>Intel XE#4351</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-2160=
x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2191">Intel XE#2191</a>) -&gt; (<a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12846/shard-dg2-433/igt@kms_bw@connected-linear-=
tiling-2-displays-2160x1440p.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-466/igt@kms_bw@connected-linea=
r-tiling-2-displays-2160x1440p.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-2560x1=
440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; (<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-2/igt@kms_bw@connect=
ed-linear-tiling-2-displays-2560x1440p.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-8/igt@kms_bw@connect=
ed-linear-tiling-2-displays-2560x1440p.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.htm=
l">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2705">Intel XE#2705</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a>) -&gt; (<a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-432/igt=
@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-432/igt@kms_ccs=
@random-ccs-data-4-tiled-dg2-mc-ccs.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-464/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/309">Intel XE#309</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12846/shard-dg2-436/igt@kms_cursor_legacy@2x-cursor-vs-flip-=
legacy.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12846/shard-dg2-463/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.h=
tml">PASS</a>) +3 other tests ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-6/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs=
-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-3/igt@kms_cursor_legacy@=
2x-long-nonblocking-modeset-vs-cursor-atomic.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-7/igt@kms_curs=
or_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/22=
91">Intel XE#2291</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12846/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipb-toggl=
e.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302">=
Intel XE#4302</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12846/shard-bmg-2/igt@kms_display_modes@extended-mode-basic.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846=
/shard-bmg-1/igt@kms_display_modes@extended-mode-basic.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-464/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Inte=
l XE#455</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12846/shard-dg2-463/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-d=
g2-466/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-4/igt@kms_feature_discovery@display-2x.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373">Intel=
 XE#2373</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12846/shard-bmg-7/igt@kms_feature_discovery@display-2x.html">PASS</a></=
li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank-interruptib=
le@bc-hdmi-a6-dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-434/igt@kms_flip@2x-flip=
-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-4/igt@kms_flip@2x-modeset-vs-vblank-race.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Int=
el XE#2316</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_12846/shard-bmg-2/igt@kms_flip@2x-modeset-vs-vblank-race.html">PASS</=
a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-464/igt@kms_flip@2x-plain-flip-ts-check.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel=
 XE#310</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12846/shard-dg2-466/igt@kms_flip@2x-plain-flip-ts-check.html">PASS</a></=
li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-6/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-mo=
deset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2316">Intel XE#2316</a>) -&gt; (<a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_12846/shard-bmg-8/igt@kms_flip@2x-single-buffer-f=
lip-vs-dpms-off-vs-modeset.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12846/shard-bmg-8/igt@kms_flip@2x-single-buffer-=
flip-vs-dpms-off-vs-modeset.html">PASS</a>) +1 other test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301"=
>Intel XE#301</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/3321">Intel XE#3321</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_12846/shard-dg2-463/igt@kms_flip@flip-vs-expired-vb=
lank@a-dp4.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12846/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@a-dp4.ht=
ml">PASS</a>) +1 other test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
301">Intel XE#301</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12846/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank@b-hdm=
i-a6.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12846/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html=
">PASS</a>) +4 other tests ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-466/igt@kms_flip@flip-vs-suspend@c-dp4.html">INCOMPLET=
E</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049"=
>Intel XE#2049</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2597">Intel XE#2597</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12846/shard-dg2-433/igt@kms_flip@flip-vs-suspend@c=
-dp4.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12846/shard-dg2-466/igt@kms_flip@flip-vs-suspend@c-dp4.html">PASS</a>)=
 +1 other test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-sh=
rfb-draw-render.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-adlp-8/igt@kms_frontbu=
ffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html">PASS</a> +7 other=
 tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-rte:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-rte.html">DMESG=
-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
173">Intel XE#4173</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12846/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-rte.ht=
ml">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-s=
hrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-433/igt@kms_frontbuffer_=
tracking@fbc-2p-primscrn-pri-shrfb-draw-render.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-463/igt@kms_=
frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render.html">PASS</a>) =
+4 other tests ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-rte:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-rte.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">I=
ntel XE#656</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12846/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-rte.html">PA=
SS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-433/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/sha=
rd-dg2-463/igt@kms_hdr@invalid-hdr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-464/igt@kms_joiner@invalid-modeset-force-big-joiner.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4328">Intel XE#4328</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_12846/shard-dg2-433/igt@kms_joiner@invalid-modeset-force-b=
ig-joiner.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-adlp-1/igt@kms_plane_cursor@viewport.html">FAIL</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1471">Intel XE#14=
71</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12=
846/shard-adlp-6/igt@kms_plane_cursor@viewport.html">PASS</a> +1 other test=
 pass</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-464/igt@kms_plane_cursor@viewport.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#61=
6</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_128=
46/shard-dg2-464/igt@kms_plane_cursor@viewport.html">PASS</a> +1 other test=
 pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-464/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#=
836</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
12846/shard-dg2-433/igt@kms_pm_rpm@modeset-non-lpsp.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-434/igt=
@kms_pm_rpm@modeset-non-lpsp.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-=
a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/771">Intel XE#771</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12846/shard-adlp-2/igt@kms_universal_plane@cursor-fb-l=
eak@pipe-d-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-adlp-6/igt@kms_vblank@ts-continuation-suspend.html">DMESG-=
WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/29=
53">Intel XE#2953</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4173">Intel XE#4173</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_12846/shard-adlp-8/igt@kms_vblank@ts-continuatio=
n-suspend.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_c=
ompute:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-lnl-5/igt@xe_compute_preempt@compute-preempt-many@engine-d=
rm_xe_engine_class_compute.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4278">Intel XE#4278</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-3/igt@xe_comp=
ute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute.html">P=
ASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm=
-basic-defer-bind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-434/igt@xe_exec_basic@=
multigpu-many-execqueues-many-vm-basic-defer-bind.html">PASS</a> +1 other t=
est pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm=
-bindexecqueue.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-436/igt@xe_exec_basic@mu=
ltigpu-many-execqueues-many-vm-bindexecqueue.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-435/igt@xe_exe=
c_basic@multigpu-many-execqueues-many-vm-bindexecqueue.html">PASS</a>) +1 o=
ther test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html">ABORT</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#=
1794</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_12846/shard-lnl-3/igt@xe_pm@s4-vm-bind-unbind-all.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-5/igt@x=
e_pm@s4-vm-bind-unbind-all.html">PASS</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-434/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe=
-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/787">Intel XE#787</a>) -&gt; (<a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-436/igt@kms_ccs@bad-aux-strid=
e-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-464/igt@kms_ccs@bad-au=
x-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-6.html">SKIP</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#=
787</a>) +7 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-464/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc@p=
ipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; (<a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-433/igt@kms_cc=
s@bad-aux-stride-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6.html">SKIP</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-433/=
igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6.html">SKIP=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">=
Intel XE#787</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-463/igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-d-hdmi=
-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/787">Intel XE#787</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-dg2-464/igt@kms_ccs@bad-aux-stride-y-tile=
d-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-464/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@p=
ipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-436/igt@kms_ccs=
@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787=
</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-464/igt@kms_cdclk@mode-transition-all-outputs.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4440=
">Intel XE#4440</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_12846/shard-dg2-464/igt@kms_cdclk@mode-transition-all-outputs.h=
tml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2846/shard-dg2-434/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4418">Int=
el XE#4418</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4440">Intel XE#4440</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-6/igt@kms_content_protection@atomic.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE=
#2341</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12846/shard-bmg-2/igt@kms_content_protection@atomic.html">FAIL</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-2/igt=
@kms_content_protection@atomic.html">FAIL</a>) (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-3/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.h=
tml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1178">Intel XE#1178</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12846/shard-bmg-4/igt@kms_content_protection@atomic-dpms=
@pipe-a-dp-2.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12846/shard-bmg-7/igt@kms_content_protection@atomic-dpms@pipe-=
a-dp-2.html">INCOMPLETE</a>) (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1178">Intel XE#1178</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4132">Intel XE#4132</a>) +1 other test ( 1 =
fail, 1 incomplete )</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-464/igt@kms_content_protection@lic-type-0.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Int=
el XE#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12846/shard-dg2-463/igt@kms_content_protection@lic-type-0.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">In=
tel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-464/igt@kms_content_protection@srm.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#4=
55</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
2846/shard-dg2-464/igt@kms_content_protection@srm.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-432/igt=
@kms_content_protection@srm.html">FAIL</a>) (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-464/igt@kms_content_protection@uevent.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel X=
E#455</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12846/shard-dg2-433/igt@kms_content_protection@uevent.html">FAIL</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-464=
/igt@kms_content_protection@uevent.html">SKIP</a>) (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2291">Intel XE#2291</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_12846/shard-bmg-8/igt@kms_cursor_legacy@2x-long-flip-vs=
-cursor-legacy.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_12846/shard-bmg-6/igt@kms_cursor_legacy@2x-long-flip-vs-curs=
or-legacy.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
309">Intel XE#309</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_12846/shard-dg2-435/igt@kms_cursor_legacy@cursorb-vs-flipb-at=
omic.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12846/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html=
">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-464/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a=
-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/3804">i915#3804</a>) -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-466/igt@kms_dither@fb-8b=
pc-vs-panel-6bpc@pipe-a-hdmi-a-6.html">SKIP</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-463/igt@kms_dither@fb-8bpc=
-vs-panel-6bpc@pipe-a-hdmi-a-6.html">SKIP</a>) (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-464/igt@kms_dp_aux_dev.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/3009">Intel XE#3009</a>) -&=
gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard=
-dg2-464/igt@kms_dp_aux_dev.html">SKIP</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-432/igt@kms_dp_aux_dev.html">PA=
SS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/300=
9">Intel XE#3009</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a=
3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3321">Intel XE#3321</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vbl=
ank@ac-dp2-hdmi-a3.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_12846/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank=
@ac-dp2-hdmi-a3.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3321">Intel XE#3321</a>) +2 other tests ( 1 fail, 1 pa=
ss )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a6-=
dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/301">Intel XE#301</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_12846/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-v=
blank@ac-hdmi-a6-dp4.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12846/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vb=
lank@ac-hdmi-a6-dp4.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/301">Intel XE#301</a>) +2 other tests ( 1 fail, 1 =
pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Int=
el XE#2316</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_12846/shard-bmg-8/igt@kms_flip@2x-plain-flip-fb-recreate.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard=
-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate.html">SKIP</a>) (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)=
 +1 other test ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">=
Intel XE#301</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12846/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846=
/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAIL</a>) (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#=
301</a>) +3 other tests ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">=
Intel XE#301</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3149">Intel XE#3149</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12846/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblan=
k@c-edp1.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12846/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html"=
>FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
301">Intel XE#301</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3149">Intel XE#3149</a>) +1 other test ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-436/igt@kms_flip@flip-vs-suspend-interruptible.html">I=
NCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2049">Intel XE#2049</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2597">Intel XE#2597</a>) -&gt; (<a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-433/igt@kms_flip@flip-vs-s=
uspend-interruptible.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_12846/shard-dg2-435/igt@kms_flip@flip-vs-suspend-inter=
ruptible.html">INCOMPLETE</a>) (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) +1 other test ( =
1 incomplete, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-x=
tile-downscaling.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-adlp-4/igt@kms_flip_s=
caled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html">DMESG-FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel =
XE#324</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4543">Intel XE#4543</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multi=
draw.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2311">Intel XE#2311</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12846/shard-bmg-4/igt@kms_frontbuffer_tracking@drr=
s-2p-pri-indfb-multidraw.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12846/shard-bmg-2/igt@kms_frontbuffer_tracking@drr=
s-2p-pri-indfb-multidraw.html">SKIP</a>) (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +13 ot=
her tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-=
indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/656">Intel XE#656</a>) -&gt; (<a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-432/igt@kms_frontbuffer_track=
ing@drrs-2p-primscrn-cur-indfb-onoff.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-464/igt@kms_frontbuffe=
r_tracking@drrs-2p-primscrn-cur-indfb-onoff.html">SKIP</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#=
656</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indf=
b-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/651">Intel XE#651</a>) -&gt; (<a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-464/igt@kms_frontbuffer_trac=
king@drrs-2p-scndscrn-indfb-msflip-blt.html">SKIP</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-464/igt@kms_frontbuf=
fer_tracking@drrs-2p-scndscrn-indfb-msflip-blt.html">SKIP</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-=
pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-7/igt@kms_frontbuffer_tracki=
ng@drrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-2/igt@kms_frontbuffer_=
tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +5=
 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-=
indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-464/igt@kms_frontbuffer=
_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</=
a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-=
msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-3/igt@kms_frontbuffer_trackin=
g@drrs-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +5 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-in=
dfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-6/igt@kms_frontbuffer_tr=
acking@drrs-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) =
+6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-=
indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-464/igt@kms_frontbuffer_=
tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-434/igt@kms_=
frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel =
XE#651</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/656">Intel XE#656</a>) +14 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multid=
raw.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4141">Intel XE#4141</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_12846/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2=
p-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-ind=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-7/igt@kms_frontbuffer_t=
racking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-3/igt@kms_fr=
ontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a>) (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel =
XE#4141</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-ind=
fb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-6/igt@kms_frontbuffer_tr=
acking@fbc-2p-primscrn-cur-indfb-draw-render.html">SKIP</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#=
2312</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
141">Intel XE#4141</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-ind=
fb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-6/igt@kms_frontbuffer_tr=
acking@fbc-2p-primscrn-spr-indfb-draw-render.html">SKIP</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#=
2312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-ind=
fb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; (<a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-4/igt@kms_frontbuffer_tra=
cking@fbc-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-3/igt@kms_frontb=
uffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#231=
2</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141=
">Intel XE#4141</a>) +8 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-p=
gflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-2/igt@kms_frontbuffer_tracking=
@fbc-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +1 other tes=
t skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-p=
ri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-463/igt@kms_frontbuf=
fer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#6=
51</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri=
-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-6/igt@kms_frontbuff=
er_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-2/ig=
t@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-mmap-wc.html"=
>SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2311">Intel XE#2311</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2312">Intel XE#2312</a>) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-c=
ur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; (<a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-432/igt@kms_frontbuffer=
_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-463/igt@km=
s_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a=
>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Int=
el XE#651</a>) +6 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr=
-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; (<a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-6/igt@kms_frontbuffer_trac=
king@fbcdrrs-2p-scndscrn-spr-indfb-onoff.html">SKIP</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-6/igt@kms_frontbuf=
fer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-sp=
r-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; (<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-463/igt@kms_frontbuf=
fer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-433/=
igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc.html=
">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/653">Intel XE#653</a>) +7 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-=
indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-6/igt@kms_frontbuffer_track=
ing@fbcpsr-2p-primscrn-spr-indfb-onoff.html">SKIP</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-7/igt@kms_frontbuffe=
r_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html">SKIP</a>) (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Inte=
l XE#2313</a>) +6 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cu=
r-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-464/igt@kms_frontbuffer_=
tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-463/igt@kms_=
frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel =
XE#653</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-=
indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; (<a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-6/igt@kms_frontbuffer=
_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-4/igt@k=
ms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render.html">SKIP=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312"=
>Intel XE#2312</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrf=
b-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; (<a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-2/igt@kms_frontbuffer_trac=
king@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-4/igt@kms_frontbuf=
fer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313"=
>Intel XE#2313</a>) +9 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-p=
lflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-3/igt@kms_frontbuffer_tracking=
@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +7 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb=
-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/653">Intel XE#653</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-464/igt@kms_frontbuffer_tracki=
ng@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +2 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb=
-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/653">Intel XE#653</a>) -&gt; (<a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-466/igt@kms_frontbuffer_track=
ing@psr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-464/igt@kms_frontbuffe=
r_tracking@psr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#=
656</a>) +13 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-i=
ndfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-434/igt@kms_frontbuffer_t=
racking@psr-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1=
 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-ind=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; (<a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-3/igt@kms_frontbuffer_t=
racking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-3/igt@kms_fr=
ontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a>) (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel =
XE#2313</a>) +5 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-p=
lflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_12846/shard-bmg-4/igt@kms_frontbuffer_tracking=
@psr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +3 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel X=
E#4596</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_12846/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493">Intel XE#2=
493</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel=
 XE#4596</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_12846/shard-dg2-466/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel X=
E#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-464/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">I=
ntel XE#836</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_12846/shard-dg2-464/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">S=
KIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/s=
hard-dg2-435/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-lnl-3/igt@kms_setmode@basic@pipe-b-edp-1.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883">Intel X=
E#2883</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_12846/shard-lnl-8/igt@kms_setmode@basic@pipe-b-edp-1.html">FAIL</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-lnl-7/i=
gt@kms_setmode@basic@pipe-b-edp-1.html">PASS</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2883">Intel XE#2883</a>) +2 other te=
sts ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-464/igt@kms_setmode@invalid-clone-single-crtc.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"=
>Intel XE#455</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_12846/shard-dg2-464/igt@kms_setmode@invalid-clone-single-crtc.htm=
l">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_128=
46/shard-dg2-432/igt@kms_setmode@invalid-clone-single-crtc.html">PASS</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel =
XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">=
Intel XE#362</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_12846/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern.html"=
>SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846=
/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a>) (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE=
#1729</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern-with-cham=
elium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1500">Intel XE#1500</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_12846/shard-dg2-464/igt@kms_tiled_display@basic-te=
st-pattern-with-chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Int=
el XE#771</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12846/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Int=
el XE#771</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/899">Intel XE#899</a>)</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Inte=
l XE#771</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_12846/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-l=
nl-3/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#=
899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/771">Intel XE#771</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12846/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak@=
pipe-c-edp-1.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_12846/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-=
c-edp-1.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/899">Intel XE#899</a>) +1 other test ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-432/igt@xe_exec_basic@multigpu-once-null-defer-bind.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1392">Intel XE#1392</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_12846/shard-dg2-434/igt@xe_exec_basic@multigpu-once-null-=
defer-bind.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_12846/shard-dg2-432/igt@xe_exec_basic@multigpu-once-null-defer-b=
ind.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1392">Intel XE#1392</a>) +1 other test ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8288/shard-dg2-432/igt@xe_peer2peer@read.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a>)=
 -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12846/sh=
ard-dg2-466/igt@xe_peer2peer@read.html">FAIL</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_12846/shard-dg2-432/igt@xe_peer2peer@read=
.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1061">Intel XE#1061</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8288 -&gt; IGTPW_12846</li>
</ul>
<p>IGTPW_12846: 12846<br />
  IGT_8288: 8288<br />
  xe-2854-14c330bc015ded4a1f1dd1f5aeb8617077aaa7e8: 14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8</p>

</body>
</html>

--===============8746251353216965090==--
