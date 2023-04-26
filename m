Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C03BC10E0D6
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Apr 2023 13:53:09 +0000 (UTC)
Date: Wed, 26 Apr 2023 15:53:04 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230426135304.27xdfh3xq2wtxt4w@kamilkon-desk1>
References: <20230424080233.2016931-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230424080233.2016931-1-bhanuprakash.modem@intel.com>
Subject: Re: [igt-dev] [i-g-t] tests: New dir structure for intel specific
 tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Hi,

On 2023-04-24 at 13:32:33 +0530, Bhanuprakash Modem wrote:
> As we have many KMS tests those can support both i915 & XE, we
> can have new dir structure to place tests in a proper location.
> 
> Below is the new dir structure:
> - tests/intel/i915/ : All i915 specific tests should move here.
> - tests/intel/xe/   : All XE specific tests should move here.
> - tests/intel/      : Tests those supports both i915 & XE should
>                       move here. Example: kms_psr
> 
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

There are only few tests now so maybe just move only those ?
These will mean we will have also three folders in tests:

tests/i915/
tests/intel/ or intel_kms/
tests/xe/

[...]
>  tests/{ => intel}/i915/perf.c                 |  0
>  tests/{ => intel}/i915/perf_pmu.c             |  0
>  tests/{ => intel}/i915/sysfs_defaults.c       |  0
>  .../i915/sysfs_heartbeat_interval.c           |  0
>  .../{ => intel}/i915/sysfs_preempt_timeout.c  |  0
>  .../i915/sysfs_timeslice_duration.c           |  0
>  tests/{i915 => intel}/kms_psr.c               |  0
>  tests/{i915 => intel}/kms_psr2_sf.c           |  2 +-
>  tests/{i915 => intel}/kms_psr2_su.c           |  0
>  tests/{i915 => intel}/kms_psr_stress_test.c   |  0
>  tests/{ => intel}/xe/xe_compute.c             |  0
>  tests/{ => intel}/xe/xe_create.c              |  0
[...]

Regards,
Kamil

