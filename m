Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E333010E45E
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Aug 2023 11:39:10 +0000 (UTC)
Date: Thu, 17 Aug 2023 13:39:07 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230817113907.n3sqsbpm2huq7l7l@zkempczy-mobl2>
References: <20230817094652.40243-1-zbigniew.kempczynski@intel.com>
 <169227171312.12433.6248390657663255973@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <169227171312.12433.6248390657663255973@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?q?=E2=97=8B_CI=2ExeBAT=3A_info_for_Extend_comp?=
 =?utf-8?q?ute_square_to_i915_and_Xe?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Aug 17, 2023 at 11:28:33AM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series: Extend compute square to i915 and Xe             
>    URL:    https://patchwork.freedesktop.org/series/122568/ 
>    State:  info                                             
> 
>    Participating hosts:
>    bat-atsm-2
>    bat-dg2-oem2
>    bat-adlp-7
>    Missing hosts results[0]:
>    Results: IGTPW_9610

First run on DG2 fails on Xe, second works fine.

# ./xe_compute
IGT-Version: 1.27.1-NO-GIT (x86_64) (Linux: 6.4.0-xe+ x86_64)
Opened device: /dev/dri/card0
Starting subtest: compute-square
(xe_compute:8206) intel_compute-CRITICAL: Test assertion failure function xehp_compute_exec, file ../lib/intel_compute.c:873:
(xe_compute:8206) intel_compute-CRITICAL: Failed assertion: f1 == f2 * f2
Stack trace:
  #0 ../lib/igt_core.c:2203 __igt_fail_assert()
  #1 ../lib/intel_compute.c:866 xehp_compute_exec()
  #2 ../lib/intel_compute.c:923 run_compute_kernel()
  #3 ../tests/xe/xe_compute.c:31 test_compute_square()
  #4 ../tests/xe/xe_compute.c:41 __igt_unique____real_main34()
  #5 ../tests/xe/xe_compute.c:34 main()
  #6 ../sysdeps/nptl/libc_start_call_main.h:58 __libc_start_call_main()
  #7 ../csu/libc-start.c:128 __libc_start_main@@GLIBC_2.34()
  #8 [_start+0x25]
Subtest compute-square failed.
**** DEBUG ****
(xe_compute:8206) intel_compute-DEBUG: [i:  0 name:     instr state base] data: 0x55d40ac90000, addr:        18ffef000, size: 1000
(xe_compute:8206) intel_compute-DEBUG: [i:  1 name:   dynamic state base] data: 0x7fe3dff90000, addr:           500000, size: 100000
(xe_compute:8206) intel_compute-DEBUG: [i:  2 name:   surface state base] data: 0x55d40aca0000, addr:           400000, size: 1000
(xe_compute:8206) intel_compute-DEBUG: [i:  3 name: indirect object base] data: 0x55d40acb0000, addr:        17ffdf000, size: 1000
(xe_compute:8206) intel_compute-DEBUG: [i:  4 name:           addr input] data: 0x55d40acc0000, addr:           200000, size: 1000
(xe_compute:8206) intel_compute-DEBUG: [i:  5 name:          addr output] data: 0x55d40acd0000, addr:           300000, size: 1000
(xe_compute:8206) intel_compute-DEBUG: [i:  6 name:   general state base] data: 0x7fe3dfe70000, addr:         80000000, size: 100000
(xe_compute:8206) intel_compute-DEBUG: [i:  7 name:        binding table] data: 0x55d40ace0000, addr:           401000, size: 1000
(xe_compute:8206) intel_compute-DEBUG: [i:  8 name:                batch] data: 0x55d40acf0000, addr:           100000, size: 1000
(xe_compute:8206) intel_compute-DEBUG: general   state base: 80000000
(xe_compute:8206) intel_compute-DEBUG: surface   state base: 400000
(xe_compute:8206) intel_compute-DEBUG: dynamic   state base: 500000
(xe_compute:8206) intel_compute-DEBUG: instruct   base addr: 90000000
(xe_compute:8206) intel_compute-DEBUG: bindless   base addr: 400000
(xe_compute:8206) intel_compute-DEBUG: offset indirect addr: fffdf000
(xe_compute:8206) intel_compute-DEBUG: kernel start pointer: fffef000
(xe_compute:8206) intel_compute-DEBUG: [   0] f1: 0.000000 != 0.563194
(xe_compute:8206) intel_compute-CRITICAL: Test assertion failure function xehp_compute_exec, file ../lib/intel_compute.c:873:
(xe_compute:8206) intel_compute-CRITICAL: Failed assertion: f1 == f2 * f2
(xe_compute:8206) igt_core-INFO: Stack trace:
(xe_compute:8206) igt_core-INFO:   #0 ../lib/igt_core.c:2203 __igt_fail_assert()
(xe_compute:8206) igt_core-INFO:   #1 ../lib/intel_compute.c:866 xehp_compute_exec()
(xe_compute:8206) igt_core-INFO:   #2 ../lib/intel_compute.c:923 run_compute_kernel()
(xe_compute:8206) igt_core-INFO:   #3 ../tests/xe/xe_compute.c:31 test_compute_square()
(xe_compute:8206) igt_core-INFO:   #4 ../tests/xe/xe_compute.c:41 __igt_unique____real_main34()
(xe_compute:8206) igt_core-INFO:   #5 ../tests/xe/xe_compute.c:34 main()
(xe_compute:8206) igt_core-INFO:   #6 ../sysdeps/nptl/libc_start_call_main.h:58 __libc_start_call_main()
(xe_compute:8206) igt_core-INFO:   #7 ../csu/libc-start.c:128 __libc_start_main@@GLIBC_2.34()
(xe_compute:8206) igt_core-INFO:   #8 [_start+0x25]
****  END  ****
Subtest compute-square: FAIL (5.119s)



# ./xe_compute
IGT-Version: 1.27.1-NO-GIT (x86_64) (Linux: 6.4.0-xe+ x86_64)
Opened device: /dev/dri/card0
Starting subtest: compute-square
Subtest compute-square: SUCCESS (0.003s)

--
Zbigniew
