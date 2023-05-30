Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 642A810E3DE
 for <igt-dev@lists.freedesktop.org>; Tue, 30 May 2023 16:40:17 +0000 (UTC)
Message-ID: <307d2734-8d72-5c7e-cce4-bcb6dd06736e@intel.com>
Date: Tue, 30 May 2023 22:10:11 +0530
MIME-Version: 1.0
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20230529052835.860047-1-bhanuprakash.modem@intel.com>
 <20230529052835.860047-76-bhanuprakash.modem@intel.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20230529052835.860047-76-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [i-g-t V4 75/82] tests/kms_sysfs_edid_timing:
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

On 29-May-23 10:58 AM, Bhanuprakash Modem wrote:
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

No subtest in this test and test description and subtest description is 
redundant.

>   
>   #define THRESHOLD_PER_CONNECTOR		150
>   #define THRESHOLD_PER_CONNECTOR_MEAN	140
