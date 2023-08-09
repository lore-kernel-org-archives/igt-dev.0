Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8053D10E0EB
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Aug 2023 03:13:34 +0000 (UTC)
Message-ID: <d833173c-a53d-7db9-b14e-cd41c9b152c5@intel.com>
Date: Wed, 9 Aug 2023 08:42:56 +0530
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20230629144910.3055377-1-bhanuprakash.modem@intel.com>
 <20230629144910.3055377-66-bhanuprakash.modem@intel.com>
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20230629144910.3055377-66-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [V5 i-g-t 65/81] tests/kms_prime: Document each
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


On 6/29/2023 8:18 PM, Bhanuprakash Modem wrote:
> Add documentation for all kms tests which is used by IGT testplan
> documentation.
>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/kms_prime.c | 35 +++++++++++++++++++++++++++++++++++
>   1 file changed, 35 insertions(+)
>
> diff --git a/tests/kms_prime.c b/tests/kms_prime.c
> index 52f587961..3e46aafb9 100644
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
