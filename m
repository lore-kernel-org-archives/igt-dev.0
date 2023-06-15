Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9ED110E183
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Jun 2023 11:27:54 +0000 (UTC)
Date: Thu, 15 Jun 2023 13:27:49 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230615112749.kx74qxszr4kpci6d@kamilkon-desk1>
References: <20230615034143.1319444-1-yipeng.chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230615034143.1319444-1-yipeng.chen@amd.com>
Subject: Re: [igt-dev] [PATCH] From: Jasber Chen <yipeng.chen@amd.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Jasber Chen <yipeng.chen@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Jasber,

please subscribe to igt-dev mailing list, visit

https://lists.freedesktop.org/mailman/listinfo/igt-dev

On 2023-06-15 at 11:41:43 +0800, Jasber Chen wrote:
> tests/amdgpu skips query-timestamp-while-idle test on raven/raven2 asic.
- ^^^^^^^^^^^^ --------------------------------------------------------- ^
This should be in subject of your e-mail.
For sending patches to igt I suggest you will use command:

git send-email

Here you should write in subject: 

tests/amdgpu: skip query-timestamp-while-idle test on raven/raven2

No dot at end.

> Querying GPU clocks can not work as expected when GPU is idling.
> 
> Change-Id: If2c6e9e358ce826a5e5d5f909819285b6ada821e
- ^^^^^^^^^
Drop this, it is not available for open-access.

Put here Cc: for people who can potientially review your code,
like:

Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
Cc: Christian König <christian.koenig@amd.com>
> Signed-off-by: Jasber Chen <yipeng.chen@amd.com>
> ---
>  tests/amdgpu/amd_info.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/tests/amdgpu/amd_info.c b/tests/amdgpu/amd_info.c
> index d6aea827..644c370f 100644
> --- a/tests/amdgpu/amd_info.c
> +++ b/tests/amdgpu/amd_info.c
> @@ -28,6 +28,8 @@
>  #include <amdgpu.h>
>  #include <amdgpu_drm.h>
>  
> +#include "lib/amdgpu/amdgpu_asic_addr.h"
> +
>  static amdgpu_device_handle dev;
>  
>  static void query_firmware_version_test(void)
> @@ -121,9 +123,12 @@ static void query_timestamp_test(uint32_t sleep_time, int sample_count)
>  
>  IGT_TEST_DESCRIPTION("Test the consistency of the data provided through the "
>  		     "DRM_AMDGPU_INFO IOCTL");
> +

Avoid style changes when submitting patches, for small ones it
maybe ok bit for large one not.

>  igt_main
>  {
>  	int fd = -1;
> +	int r = -1;
> +	struct amdgpu_gpu_info gpu_info = {0};
>  
>  	igt_fixture {
>  		uint32_t major, minor;
> @@ -136,6 +141,9 @@ igt_main
>  
>  		igt_info("Initialized amdgpu, driver version %d.%d\n",
>  			 major, minor);
> +
> +		r = amdgpu_query_gpu_info(dev, &gpu_info);
> +		igt_assert_eq(r, 0);
>  	}
>  
>  	igt_describe("Make sure we can retrieve the firmware version");
> @@ -150,7 +158,13 @@ igt_main
>  	igt_describe("Check that the GPU time keeps on ticking, even during "
>  		     "long idle times which could lead to clock/power gating");
>  	igt_subtest("query-timestamp-while-idle")
> +	/* Skip query-timestamp-while-idle test on Raven / Raven2 */
> +	/* GPU clocks may not work as expected when GPU is idling */
> +	if(!ASICREV_IS_RAVEN(gpu_info.chip_external_rev) &&
> +	   !ASICREV_IS_RAVEN2(gpu_info.chip_external_rev) )
> +	{
>  		query_timestamp_test(7000000, 1);
> +	}

Where is the skip ? imho better:

  	igt_subtest("query-timestamp-while-idle") {
		igt_skip_on(ASICREV_IS_RAVEN(gpu_info.chip_external_rev) ||
			    ASICREV_IS_RAVEN2(gpu_info.chip_external_rev),
			    "GPU clocks when idle on Raven/Raven2 may not work as expected\n");

 		query_timestamp_test(7000000, 1);
	}

Regards,
Kamil

>  
>  	igt_fixture {
>  		amdgpu_device_deinitialize(dev);
> -- 
> 2.25.1
> 
