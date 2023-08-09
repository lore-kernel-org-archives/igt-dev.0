Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5EE010E245
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Aug 2023 08:22:16 +0000 (UTC)
Message-ID: <52a876d9-db4c-194f-0b8f-6cee4b041d16@intel.com>
Date: Wed, 9 Aug 2023 13:52:11 +0530
MIME-Version: 1.0
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20230629144910.3055377-1-bhanuprakash.modem@intel.com>
 <20230629144910.3055377-75-bhanuprakash.modem@intel.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20230629144910.3055377-75-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [V5 i-g-t 74/81] tests/kms_sysfs_edid_timing:
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

On 29-Jun-23 8:19 PM, Bhanuprakash Modem wrote:
> Add documentation for all kms tests which is used by IGT testplan
> documentation.
> 
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   tests/kms_sysfs_edid_timing.c | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
> 
> diff --git a/tests/kms_sysfs_edid_timing.c b/tests/kms_sysfs_edid_timing.c
> index 775211089..e185eaf6d 100644
> --- a/tests/kms_sysfs_edid_timing.c
> +++ b/tests/kms_sysfs_edid_timing.c
> @@ -25,6 +25,27 @@
>   #include <dirent.h>
>   #include <fcntl.h>
>   #include <sys/stat.h>
> +/**
> + * TEST: kms sysfs edid timing
> + * Category: Display
> + * Description: This test checks the time it takes to reprobe each connector and
> + *              fails if either the time it takes for one reprobe is too long or
> + *              if the mean time it takes to reprobe one connector is too long.
> + *              Additionally, make sure that the mean time for all connectors is
> + *              not too long.
> + *
> + * SUBTEST:

There is no subtest defined in this test, still we are duplicating same 
description for test and subtest. Is this okay?

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
