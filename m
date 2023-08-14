Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10D0310E12B
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Aug 2023 07:34:50 +0000 (UTC)
Message-ID: <8edb8b17-5e0e-5114-2a09-65b2e6c31445@intel.com>
Date: Mon, 14 Aug 2023 13:04:35 +0530
MIME-Version: 1.0
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20230811184655.157060-1-bhanuprakash.modem@intel.com>
 <20230811184655.157060-74-bhanuprakash.modem@intel.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20230811184655.157060-74-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [i-g-t V6 73/81] tests/kms_sysfs_edid_timing:
 Document each subtest for testplan
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

LGTM
Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

On 12-Aug-23 12:16 AM, Bhanuprakash Modem wrote:
> Add documentation for all kms tests which is used by IGT testplan
> documentation.
> 
> V2: - Fix test description
> 
> Cc: Swati Sharma <swati2.sharma@intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   tests/kms_sysfs_edid_timing.c | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
> 
> diff --git a/tests/kms_sysfs_edid_timing.c b/tests/kms_sysfs_edid_timing.c
> index 775211089..0ee50cfe5 100644
> --- a/tests/kms_sysfs_edid_timing.c
> +++ b/tests/kms_sysfs_edid_timing.c
> @@ -25,6 +25,23 @@
>   #include <dirent.h>
>   #include <fcntl.h>
>   #include <sys/stat.h>
> +/**
> + * TEST: kms sysfs edid timing
> + * Category: Display
> + * Description: Test to check the time it takes to reprobe each connector.
> + *
> + * SUBTEST:
> + * Description: This test checks the time it takes to reprobe each connector and
> + *              fails if either the time it takes for one reprobe is too long or
> + *              if the mean time it takes to reprobe one connector is too long.
> + *              Additionally, make sure that the mean time for all connectors is
> + *              not too long.
> + * Driver requirement: any
> + * Functionality: kms_core
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + */
>   
>   #define THRESHOLD_PER_CONNECTOR		150
>   #define THRESHOLD_PER_CONNECTOR_MEAN	140
