Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B990C10E508
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Jan 2024 16:09:05 +0000 (UTC)
Message-ID: <1a6e1b73-a1dd-4ad6-a3c7-e9f41778c618@intel.com>
Date: Thu, 4 Jan 2024 21:38:03 +0530
MIME-Version: 1.0
Subject: Re: [i-g-t 1/2] tests/kms_feature_discovery: Add basic sanity test
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240104055106.1949767-1-bhanuprakash.modem@intel.com>
 <20240104055106.1949767-2-bhanuprakash.modem@intel.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20240104055106.1949767-2-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Hi Bhanu,

As discussed offline, we need to differentiate between server and client 
platforms for this test. In both the cases, this test will pass.
Either we skip this test for server platform or we need to think of 
something else.

On 04-Jan-24 11:21 AM, Bhanuprakash Modem wrote:
> Add basic sanity test to make sure DRM_IOCTL_MODE_GETRESOURCES is
> working fine.
> 
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   tests/kms_feature_discovery.c | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 
> diff --git a/tests/kms_feature_discovery.c b/tests/kms_feature_discovery.c
> index 5bca9ad76..eb762928f 100644
> --- a/tests/kms_feature_discovery.c
> +++ b/tests/kms_feature_discovery.c
> @@ -44,6 +44,9 @@
>   #include "igt_types.h"
>   
>   /**
> + * SUBTEST: basic-rte
> + * Description: Basic sanity test to make sure DRM_IOCTL_MODE_GETRESOURCES is working fine.
> + *
>    * SUBTEST: display
>    * Description: Make sure that we have display support.
>    *
> @@ -87,6 +90,17 @@ igt_main {
>   		debugfs_fd = igt_debugfs_dir(fd);
>   	}
>   
> +	igt_describe("Basic sanity test to make sure DRM_IOCTL_MODE_GETRESOURCES is working fine.");
> +	igt_subtest("basic-rte") {
> +		drmModeResPtr resources = drmModeGetResources(fd);
> +
> +		/* Operation not supported on non-display platforms. */
> +		if (!resources)
> +			igt_assert_eq(errno, EOPNOTSUPP);
> +
> +		drmModeFreeResources(resources);
> +	}
> +
>   	igt_subtest_group {
>   		igt_fixture {
>   			igt_display_require(&display, fd);
