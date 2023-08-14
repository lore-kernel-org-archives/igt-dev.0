Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CD4A10E14B
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Aug 2023 08:23:54 +0000 (UTC)
Message-ID: <1d7bff81-b1f9-7995-1cb9-e6fb917bb6e8@intel.com>
Date: Mon, 14 Aug 2023 13:53:49 +0530
MIME-Version: 1.0
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20230811184655.157060-1-bhanuprakash.modem@intel.com>
 <20230811184655.157060-65-bhanuprakash.modem@intel.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20230811184655.157060-65-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [i-g-t V6 64/81] tests/kms_prime: Document each
 subtest for testplan
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

Shouldn't we have some functionality as "hybrid" for these tests?

On 12-Aug-23 12:16 AM, Bhanuprakash Modem wrote:
> Add documentation for all kms tests which is used by IGT testplan
> documentation.
> 
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/kms_prime.c | 35 +++++++++++++++++++++++++++++++++++
>   1 file changed, 35 insertions(+)
> 
> diff --git a/tests/kms_prime.c b/tests/kms_prime.c
> index dedbf6233..421cf9a21 100644
> --- a/tests/kms_prime.c
> +++ b/tests/kms_prime.c
> @@ -30,6 +30,41 @@
>   #include <sys/ioctl.h>
>   #include <sys/poll.h>
>   #include <time.h>
> +/**
> + * TEST: kms prime
> + * Category: Display
> + * Description: Prime tests, focusing on KMS side
> + *
> + * SUBTEST: D3hot
> + * Description: Validate pci state of dGPU when dGPU is idle and  scanout is on iGPU
> + * Driver requirement: any
> + * Functionality: kms_gem_interop
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: basic-modeset-hybrid
> + * Description: Basic modeset on the one device when the other device is active
> + * Driver requirement: any
> + * Functionality: kms_gem_interop
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: basic-crc-%s
> + * Description: Make a dumb color buffer, export to another device and compare
> + *              the CRCs with a buffer native to that device
> + * Driver requirement: any
> + * Functionality: kms_gem_interop
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * arg[1]:
> + *
> + * @hybrid:
> + * @vgem:
> + */
>   
>   #define KMS_HELPER "/sys/module/drm_kms_helper/parameters/"
>   #define KMS_POLL_DISABLE 0
