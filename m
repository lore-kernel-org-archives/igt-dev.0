Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63D9010E3E2
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Dec 2023 12:44:49 +0000 (UTC)
Date: Mon, 11 Dec 2023 13:44:44 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH] tests/kms_sysfs_edid_timing: increase thresholds
Message-ID: <20231211124444.f62euqvbg7posuxn@kamilkon-desk.igk.intel.com>
References: <20231208224205.3428717-1-charlton.lin@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231208224205.3428717-1-charlton.lin@intel.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Charlton Lin <charlton.lin@intel.com>,
 Khaled Almahallawy <khaled.almahallawy@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Charlton,
On 2023-12-08 at 14:42:05 -0800, Charlton Lin wrote:

Please subscribe to igt-dev list, also when sending igt patches
add i-g-t after PATCH:

[PATCH i-g-t] tests/kms_sysfs_edid_timing: increase thresholds

> A customer panel consistently exceeds 150ms. Additionally, the
> timing may be impacted by certain power states.
> 
> Increase all thresholds to accommodate.
> 
> Cc: Sharma, Swati2 <swati2.sharma@intel.com>
----- ^^^^^^^^^^^^^^
This breaks your git send-email, correct is:

Cc: Swati Sharma <swati2.sharma@intel.com>

> Cc: Khaled Almahallawy <khaled.almahallawy@intel.com>
> Cc: Mark Yacoub <markyacoub@chromium.org>

I don't see this in header? Added to cc.

> Signed-off-by: Charlton Lin <charlton.lin@intel.com>
> ---
>  tests/kms_sysfs_edid_timing.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/kms_sysfs_edid_timing.c b/tests/kms_sysfs_edid_timing.c
> index 775211089f81..582133ea002e 100644
> --- a/tests/kms_sysfs_edid_timing.c
> +++ b/tests/kms_sysfs_edid_timing.c
> @@ -26,9 +26,9 @@
>  #include <fcntl.h>
>  #include <sys/stat.h>
>  
> -#define THRESHOLD_PER_CONNECTOR		150
> -#define THRESHOLD_PER_CONNECTOR_MEAN	140
> -#define THRESHOLD_ALL_CONNECTORS_MEAN	100
> +#define THRESHOLD_PER_CONNECTOR		1500
> +#define THRESHOLD_PER_CONNECTOR_MEAN	1400
> +#define THRESHOLD_ALL_CONNECTORS_MEAN	1000

This is like increasing it ten times, add this to description.
I am not KMS nor panel expert but is it really that long?

Regards,
Kamil

>  #define CHECK_TIMES			15
>  
>  IGT_TEST_DESCRIPTION("This test checks the time it takes to reprobe each "
> -- 
> 2.25.1
> 
