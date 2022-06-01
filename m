Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8ACB10E9F2
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Jun 2022 10:22:57 +0000 (UTC)
Message-ID: <a596b88a-f6e5-1afd-2b89-e07ad65de0c3@intel.com>
Date: Wed, 1 Jun 2022 15:52:45 +0530
Content-Language: en-US
To: =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>
References: <20220531084929.28679-1-karthik.b.s@intel.com>
 <314ca5a8-4760-bd28-4703-aa32aebcce83@igalia.com>
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <314ca5a8-4760-bd28-4703-aa32aebcce83@igalia.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v7 0/2] tests/kms_async_flips: Cleanup
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 5/31/2022 8:10 PM, André Almeida wrote:
>
> Às 05:49 de 31/05/22, Karthik B S escreveu:
>> Series includes patches to:
>> -Convert tests to dynamic
>> -Cleanup the test
>>
>> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
>>
>> Karthik B S (2):
>>    tests/kms_async_flips: Convert tests to dynamic
>>    tests/kms_async_flips: Test Refactoring
>>
>>   tests/kms_async_flips.c | 235 +++++++++++++++++++++++++---------------
>>   1 file changed, 146 insertions(+), 89 deletions(-)
>>
>
> Reviewed-by: André Almeida <andrealmeid@igalia.com>
Thank you for the rb.
> Also, I've tested with an AMD GPU and everything seems to be working as
> before.

Thanks for trying this out.

Regards,
Karthik.B.S
