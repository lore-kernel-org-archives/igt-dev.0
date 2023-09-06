Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27A2610E1B5
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Sep 2023 09:11:47 +0000 (UTC)
Date: Wed, 6 Sep 2023 11:11:30 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Katarzyna Dec <katarzyna.dec@intel.com>
Message-ID: <20230906111130.45e6250d@maurocar-mobl2>
In-Reply-To: <20230906085628.59915-2-katarzyna.dec@intel.com>
References: <20230906085628.59915-1-katarzyna.dec@intel.com>
 <20230906085628.59915-2-katarzyna.dec@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t v2 1/2] tests/intel: Add missing
 documentation fields for tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, Gandi Ramadevi <ramadevi.gandi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed,  6 Sep 2023 08:56:27 +0000
Katarzyna Dec <katarzyna.dec@intel.com> wrote:

> Adding missing documentation for tests that show warnings during building
> IGTs.
> 
> v2" s/Full/FULL in xe_sysfs_tile & xe_uevent tests
> 
> Signed-off-by: Katarzyna Dec <katarzyna.dec@intel.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>

LGTM.

Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>

> Cc: Gandi Ramadevi <ramadevi.gandi@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tests/intel/xe_pm.c              | 1 +
>  tests/intel/xe_sysfs_scheduler.c | 1 +
>  tests/intel/xe_sysfs_tile.c      | 3 +++
>  tests/intel/xe_uevent.c          | 3 +++
>  tests/intel/xe_vm.c              | 1 +
>  5 files changed, 9 insertions(+)
> 
> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
> index 2ec108d14..d31049d19 100644
> --- a/tests/intel/xe_pm.c
> +++ b/tests/intel/xe_pm.c
> @@ -366,6 +366,7 @@ NULL));
>  
>  /**
>   * SUBTEST: vram-d3cold-threshold
> + * Functionality: pm - d3cold
>   * Description:
>   *	Validate whether card is limited to d3hot while vram used
>   *	is greater than vram_d3cold_threshold.
> diff --git a/tests/intel/xe_sysfs_scheduler.c b/tests/intel/xe_sysfs_scheduler.c
> index 0315ce915..ec2190113 100644
> --- a/tests/intel/xe_sysfs_scheduler.c
> +++ b/tests/intel/xe_sysfs_scheduler.c
> @@ -5,6 +5,7 @@
>  
>  /**
>   * TEST: xe sysfs scheduler
> + * Category: Software building block
>   * Sub-category: sysman
>   * Functionality: scheduler control interface
>   * Test category: functionality test
> diff --git a/tests/intel/xe_sysfs_tile.c b/tests/intel/xe_sysfs_tile.c
> index 3be9c93f7..a7203e2b3 100644
> --- a/tests/intel/xe_sysfs_tile.c
> +++ b/tests/intel/xe_sysfs_tile.c
> @@ -5,9 +5,12 @@
>  
>  /**
>   * TEST: Verify physical_vram_size_bytes of each tiles
> + * Category: Software building block
>   * SUBTEST: physical_vram_size_bytes
>   * Functionality: Vram
>   * Sub-category: Total vram per tile
> + * Run type: FULL
> + * Test category: functionality test
>   * Description:
>   *             Read sysfs entry for physical_vram_size_bytes and compare with
>   *             vram size. physical_vram_size_bytes should be more than vram size.
> diff --git a/tests/intel/xe_uevent.c b/tests/intel/xe_uevent.c
> index 4dc49057c..b8a92b698 100644
> --- a/tests/intel/xe_uevent.c
> +++ b/tests/intel/xe_uevent.c
> @@ -5,9 +5,12 @@
>  
>  /**
>   * TEST: cause fake gt reset failure and listen uevent from KMD
> + * Category: Software building block
>   * SUBTEST:fake_reset_uevent_listener
>   * Functionality: uevent
>   * Sub-category: GT reset failure uevent
> + * Run type: FULL
> + * Test category: functionality test
>   * Description:
>   *		Test creates uevent listener and causes fake reset failure for gt0
>   *		and returns success if uevent is sent by driver and listened by listener.
> diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
> index e42c04e33..e48715aed 100644
> --- a/tests/intel/xe_vm.c
> +++ b/tests/intel/xe_vm.c
> @@ -1628,6 +1628,7 @@ try_again_after_invalidate:
>  /**
>   * SUBTEST: mmap-style-bind-%s
>   * Description: Test mmap style unbind with %arg[1]
> + * Functionality: bind
>   * Run type: FULL
>   * TODO: change ``'Run type' == FULL`` to a better category
>   *
