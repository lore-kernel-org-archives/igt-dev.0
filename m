Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4404810E667
 for <igt-dev@lists.freedesktop.org>; Thu, 31 Aug 2023 12:32:17 +0000 (UTC)
Date: Thu, 31 Aug 2023 14:32:09 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Katarzyna Dec <katarzyna.dec@intel.com>
Message-ID: <20230831143209.5eedf98c@maurocar-mobl2>
In-Reply-To: <20230831113936.4075130-2-katarzyna.dec@intel.com>
References: <20230831113936.4075130-1-katarzyna.dec@intel.com>
 <20230831113936.4075130-2-katarzyna.dec@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] tests/xe: Add missing documentation
 fields for tests
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

On Thu, 31 Aug 2023 11:39:35 +0000
Katarzyna Dec <katarzyna.dec@intel.com> wrote:

> Adding missing documentation for tests that show warnings during building
> IGTs.
> 
> Signed-off-by: Katarzyna Dec <katarzyna.dec@intel.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Gandi Ramadevi <ramadevi.gandi@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tests/xe/xe_pm.c              | 1 +
>  tests/xe/xe_sysfs_scheduler.c | 1 +
>  tests/xe/xe_sysfs_tile.c      | 2 ++
>  tests/xe/xe_uevent.c          | 2 ++
>  tests/xe/xe_vm.c              | 1 +
>  5 files changed, 7 insertions(+)
> 
> diff --git a/tests/xe/xe_pm.c b/tests/xe/xe_pm.c
> index 2ec108d14..d31049d19 100644
> --- a/tests/xe/xe_pm.c
> +++ b/tests/xe/xe_pm.c
> @@ -366,6 +366,7 @@ NULL));
>  
>  /**
>   * SUBTEST: vram-d3cold-threshold
> + * Functionality: pm - d3cold
>   * Description:
>   *	Validate whether card is limited to d3hot while vram used
>   *	is greater than vram_d3cold_threshold.
> diff --git a/tests/xe/xe_sysfs_scheduler.c b/tests/xe/xe_sysfs_scheduler.c
> index 0315ce915..ec2190113 100644
> --- a/tests/xe/xe_sysfs_scheduler.c
> +++ b/tests/xe/xe_sysfs_scheduler.c
> @@ -5,6 +5,7 @@
>  
>  /**
>   * TEST: xe sysfs scheduler
> + * Category: Software building block
>   * Sub-category: sysman
>   * Functionality: scheduler control interface
>   * Test category: functionality test
> diff --git a/tests/xe/xe_sysfs_tile.c b/tests/xe/xe_sysfs_tile.c
> index 3be9c93f7..63ba09091 100644
> --- a/tests/xe/xe_sysfs_tile.c
> +++ b/tests/xe/xe_sysfs_tile.c
> @@ -5,9 +5,11 @@
>  
>  /**
>   * TEST: Verify physical_vram_size_bytes of each tiles
> + * Category: Software building block
>   * SUBTEST: physical_vram_size_bytes
>   * Functionality: Vram
>   * Sub-category: Total vram per tile
> + * Run type: Full

Let's use the same case everywhere. So, please use FULL here.

>   * Description:
>   *             Read sysfs entry for physical_vram_size_bytes and compare with
>   *             vram size. physical_vram_size_bytes should be more than vram size.
> diff --git a/tests/xe/xe_uevent.c b/tests/xe/xe_uevent.c
> index 4dc49057c..3b1e991dd 100644
> --- a/tests/xe/xe_uevent.c
> +++ b/tests/xe/xe_uevent.c
> @@ -5,9 +5,11 @@
>  
>  /**
>   * TEST: cause fake gt reset failure and listen uevent from KMD
> + * Category: Software building block
>   * SUBTEST:fake_reset_uevent_listener
>   * Functionality: uevent
>   * Sub-category: GT reset failure uevent
> + * Run type: Full
>   * Description:
>   *		Test creates uevent listener and causes fake reset failure for gt0
>   *		and returns success if uevent is sent by driver and listened by listener.
> diff --git a/tests/xe/xe_vm.c b/tests/xe/xe_vm.c
> index e42c04e33..e48715aed 100644
> --- a/tests/xe/xe_vm.c
> +++ b/tests/xe/xe_vm.c
> @@ -1628,6 +1628,7 @@ try_again_after_invalidate:
>  /**
>   * SUBTEST: mmap-style-bind-%s
>   * Description: Test mmap style unbind with %arg[1]
> + * Functionality: bind
>   * Run type: FULL
>   * TODO: change ``'Run type' == FULL`` to a better category
>   *
