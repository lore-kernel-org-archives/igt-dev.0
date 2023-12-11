Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C701D10E3E9
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Dec 2023 12:49:27 +0000 (UTC)
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH] tests/kms_sysfs_edid_timing: increase thresholds
In-Reply-To: <20231211124444.f62euqvbg7posuxn@kamilkon-desk.igk.intel.com>
References: <20231208224205.3428717-1-charlton.lin@intel.com>
 <20231211124444.f62euqvbg7posuxn@kamilkon-desk.igk.intel.com>
Date: Mon, 11 Dec 2023 14:49:22 +0200
Message-ID: <87h6koykdp.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Mon, 11 Dec 2023, Kamil Konieczny <kamil.konieczny@linux.intel.com> wrote:
> On 2023-12-08 at 14:42:05 -0800, Charlton Lin wrote:
>> diff --git a/tests/kms_sysfs_edid_timing.c b/tests/kms_sysfs_edid_timing.c
>> index 775211089f81..582133ea002e 100644
>> --- a/tests/kms_sysfs_edid_timing.c
>> +++ b/tests/kms_sysfs_edid_timing.c
>> @@ -26,9 +26,9 @@
>>  #include <fcntl.h>
>>  #include <sys/stat.h>
>>  
>> -#define THRESHOLD_PER_CONNECTOR		150
>> -#define THRESHOLD_PER_CONNECTOR_MEAN	140
>> -#define THRESHOLD_ALL_CONNECTORS_MEAN	100
>> +#define THRESHOLD_PER_CONNECTOR		1500
>> +#define THRESHOLD_PER_CONNECTOR_MEAN	1400
>> +#define THRESHOLD_ALL_CONNECTORS_MEAN	1000
>
> This is like increasing it ten times, add this to description.
> I am not KMS nor panel expert but is it really that long?

Would be worth investigating *why* this specific panel takes so long,
instead of allowing *all* panels to do so. We might add a regression
that slows down probing and nobody would notice.

BR,
Jani.


-- 
Jani Nikula, Intel
