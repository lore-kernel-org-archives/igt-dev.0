Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2074.outbound.protection.outlook.com [40.107.243.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E53C10E25A
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Jun 2023 06:00:53 +0000 (UTC)
Message-ID: <cdfb2fdd-7b01-78e8-fed7-580176d82b95@amd.com>
Date: Tue, 20 Jun 2023 08:00:45 +0200
Content-Language: en-US
To: Jasber Chen <yipeng.chen@amd.com>, igt-dev@lists.freedesktop.org
References: <20230619025836.1514883-1-yipeng.chen@amd.com>
 <20230620022028.1533754-1-yipeng.chen@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230620022028.1533754-1-yipeng.chen@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] tests/amdgpu: skips query-timestamp-while-idle test
 on raven/raven2
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

Am 20.06.23 um 04:20 schrieb Jasber Chen:
> tests/amdgpu: skips query-timestamp-while-idle test on raven/raven2.
> Querying GPU clocks can not work as expected when GPU is idling.

You need to give an explanation why they can't work here.

Christian.

>
> Signed-off-by: Jasber Chen <yipeng.chen@amd.com>
> ---
>   tests/amdgpu/amd_info.c | 12 +++++++++++-
>   1 file changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/tests/amdgpu/amd_info.c b/tests/amdgpu/amd_info.c
> index d6aea827..8e14e511 100644
> --- a/tests/amdgpu/amd_info.c
> +++ b/tests/amdgpu/amd_info.c
> @@ -27,6 +27,7 @@
>   
>   #include <amdgpu.h>
>   #include <amdgpu_drm.h>
> +#include "lib/amdgpu/amdgpu_asic_addr.h"
>   
>   static amdgpu_device_handle dev;
>   
> @@ -124,6 +125,8 @@ IGT_TEST_DESCRIPTION("Test the consistency of the data provided through the "
>   igt_main
>   {
>   	int fd = -1;
> +	int r = -1;
> +	struct amdgpu_gpu_info gpu_info = {0};
>   
>   	igt_fixture {
>   		uint32_t major, minor;
> @@ -136,6 +139,9 @@ igt_main
>   
>   		igt_info("Initialized amdgpu, driver version %d.%d\n",
>   			 major, minor);
> +
> +		r = amdgpu_query_gpu_info(dev, &gpu_info);
> +		igt_assert_eq(r, 0);
>   	}
>   
>   	igt_describe("Make sure we can retrieve the firmware version");
> @@ -149,8 +155,12 @@ igt_main
>   
>   	igt_describe("Check that the GPU time keeps on ticking, even during "
>   		     "long idle times which could lead to clock/power gating");
> -	igt_subtest("query-timestamp-while-idle")
> +	igt_subtest("query-timestamp-while-idle") {
> +		igt_skip_on(ASICREV_IS_RAVEN(gpu_info.chip_external_rev) ||
> +			    ASICREV_IS_RAVEN2(gpu_info.chip_external_rev));
>   		query_timestamp_test(7000000, 1);
> +	}
>   
>   	igt_fixture {
>   		amdgpu_device_deinitialize(dev);
