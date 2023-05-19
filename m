Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68D8910E4CD
 for <igt-dev@lists.freedesktop.org>; Fri, 19 May 2023 15:37:19 +0000 (UTC)
Date: Fri, 19 May 2023 17:37:14 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230519153714.zaghwp2ougcxzoj4@kamilkon-desk1>
References: <20230517151110.1710407-1-mauro.chehab@linux.intel.com>
 <20230517151110.1710407-2-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230517151110.1710407-2-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/6] tests: better document core_* tests
 used for i915 validation
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

Hi Mauro,

thank you for splitting this into smaller pieces.

On 2023-05-17 at 17:11:05 +0200, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> Merge data from some ancillary internal documentation to improve
> core test descriptions.
> 
> This patch was auto-generated via script.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

--
Kamil

> ---
>  tests/core_auth.c              | 4 ++++
>  tests/core_getclient.c         | 4 ++++
>  tests/core_getstats.c          | 4 ++++
>  tests/core_getversion.c        | 4 ++++
>  tests/core_hotunplug.c         | 2 ++
>  tests/core_setmaster.c         | 4 ++++
>  tests/core_setmaster_vs_auth.c | 4 ++++
>  7 files changed, 26 insertions(+)
> 
> diff --git a/tests/core_auth.c b/tests/core_auth.c
> index ee7fbaabfa92..ed736e1ae39f 100644
> --- a/tests/core_auth.c
> +++ b/tests/core_auth.c
> @@ -44,8 +44,12 @@
>  #include "drm.h"
>  /**
>   * TEST: core auth
> + * Category: Desktop client
>   * Description: Call drmGetMagic() and drmAuthMagic() and see if it behaves.
>   * Feature: core
> + * Functionality: permission management for clients
> + * Sub-category: DRM
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: basic-auth
>   * Description: Test magic numbers for master and slave.
> diff --git a/tests/core_getclient.c b/tests/core_getclient.c
> index 1ab56e9f304c..993801ead5a0 100644
> --- a/tests/core_getclient.c
> +++ b/tests/core_getclient.c
> @@ -33,9 +33,13 @@
>  
>  /**
>   * TEST: core getclient
> + * Category: Desktop client
>   * Description: Tests the DRM_IOCTL_GET_CLIENT ioctl.
>   * Feature: core
> + * Functionality: permission management for clients
>   * Run type: FULL
> + * Sub-category: DRM
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST:
>   */
> diff --git a/tests/core_getstats.c b/tests/core_getstats.c
> index f2b1abac738e..fef12258356e 100644
> --- a/tests/core_getstats.c
> +++ b/tests/core_getstats.c
> @@ -34,9 +34,13 @@
>  
>  /**
>   * TEST: core getstats
> + * Category: Desktop client
>   * Description: Tests the DRM_IOCTL_GET_STATS ioctl.
>   * Feature: core
> + * Functionality: permission management for clients
>   * Run type: FULL
> + * Sub-category: DRM
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST:
>   */
> diff --git a/tests/core_getversion.c b/tests/core_getversion.c
> index ae6fc8f8d7d9..36ba01b865c5 100644
> --- a/tests/core_getversion.c
> +++ b/tests/core_getversion.c
> @@ -30,9 +30,13 @@
>  #include <sys/ioctl.h>
>  /**
>   * TEST: core getversion
> + * Category: Desktop client
>   * Description: Tests the DRM_IOCTL_GET_VERSION ioctl and libdrm's drmGetVersion() interface to it.
>   * Feature: core
> + * Functionality: permission management for clients
>   * Run type: FULL
> + * Sub-category: DRM
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST:
>   */
> diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
> index 472e9237ddc2..9a027bfdf5a8 100644
> --- a/tests/core_hotunplug.c
> +++ b/tests/core_hotunplug.c
> @@ -43,6 +43,8 @@
>   * TEST: core hotunplug
>   * Description: Examine behavior of a driver on device hot unplug
>   * Feature: SMI, core
> + * Functionality: device hotplug
> + * Test category: SysMan
>   *
>   * SUBTEST: hotrebind
>   * Description:
> diff --git a/tests/core_setmaster.c b/tests/core_setmaster.c
> index 95a131a4d3c9..621bc24696a8 100644
> --- a/tests/core_setmaster.c
> +++ b/tests/core_setmaster.c
> @@ -40,9 +40,13 @@
>  #include <sys/stat.h>
>  /**
>   * TEST: core setmaster
> + * Category: Desktop client
>   * Description: Check that Drop/SetMaster behaves correctly wrt root/user access
>   * Feature: core
> + * Functionality: permission management for clients
>   * Run type: FULL
> + * Sub-category: DRM
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: master-drop-set-root
>   * Description: Ensure that root can Set/DropMaster
> diff --git a/tests/core_setmaster_vs_auth.c b/tests/core_setmaster_vs_auth.c
> index 37bb378ab011..adca1c1117d3 100644
> --- a/tests/core_setmaster_vs_auth.c
> +++ b/tests/core_setmaster_vs_auth.c
> @@ -42,9 +42,13 @@
>  #include "igt_device.h"
>  /**
>   * TEST: core setmaster vs auth
> + * Category: Desktop client
>   * Description: Check that drop/setMaster correctly transfer master state
>   * Feature: core
> + * Functionality: permission management for clients
>   * Run type: FULL
> + * Sub-category: DRM
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST:
>   */
> -- 
> 2.40.1
> 

