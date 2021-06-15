Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2053.outbound.protection.outlook.com [40.107.243.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 894626E2C7
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jun 2021 13:43:54 +0000 (UTC)
References: <20210614164135.1519746-1-markyacoub@chromium.org>
 <20210615131254.5x5u2fjyy7p3uctf@outlook.office365.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <e89fb09e-40c2-3b55-ae27-ed13c234bad7@amd.com>
Date: Tue, 15 Jun 2021 15:43:45 +0200
In-Reply-To: <20210615131254.5x5u2fjyy7p3uctf@outlook.office365.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH] tests/kms_prime: Filter out devices that
 can't import buffers.
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Mark Yacoub <markyacoub@chromium.org>, "Deucher, Alexander" <Alexander.Deucher@amd.com>
Cc: igt-dev@lists.freedesktop.org, Anson.Jacob@amd.com, seanpaul@chromium.org, petri.latvala@intel.com, markyacoub@google.com
List-ID: <igt-dev@lists.freedesktop.org>

Hi guys,

first of all thanks Rodrigo for bringing this to my attention.

Mark, as the DMA-buf maintainer I unfortunately have to reject this patch.

Direct scanout from imported surfaces is not something supported with 
DMA-buf in general at the moment.

We do have some support for this between AMD GPUs in A+A laptops, and it 
might work with i915 and some of the drivers used on ARM.

But all of this is completely vendor specific since there are some very 
low level and hardware specific limitations to take account into.

Regards,
Christian.

Am 15.06.21 um 15:12 schrieb Rodrigo Siqueira:
> Hi Alex and Christian,
>
> This patch is related to prime, but I'm not familiar with this part of
> our driver. Could you take a look at that?
>
> Thanks
>
> On 06/14, Mark Yacoub wrote:
>> Some devices such as amdgpu do not support imported buffers.
>> Filter out those devices.
>> Tested on Zork with chromeos-kernel-5_4.
>>
>> Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
>> ---
>>   tests/kms_prime.c | 14 ++++++++++++--
>>   1 file changed, 12 insertions(+), 2 deletions(-)
>>
>> diff --git a/tests/kms_prime.c b/tests/kms_prime.c
>> index 8cb2ca2a..480c7eb4 100644
>> --- a/tests/kms_prime.c
>> +++ b/tests/kms_prime.c
>> @@ -249,6 +249,16 @@ static void test_crc(int exporter_fd, int importer_fd)
>>   	igt_display_fini(&display);
>>   }
>>   
>> +/* The test attempts to import the buffer object from one device to another.
>> + * Filter out devices that aren't capable of doing this.
>> + */
>> +bool does_device_support_dmabuf_import(int fd) {
>> +	/* AMDGPU uses VRAM. Any use of the fb will migrate it to VRAM, which is not sensible for
>> +	 * an imported dma-buf.
>> +	 */
>> +	return !is_amdgpu_device(fd);
>> +}
>> +
>>   igt_main
>>   {
>>   	igt_fixture
>> @@ -262,10 +272,10 @@ igt_main
>>   
>>   		/* ANY = anything that is not VGEM */
>>   		first_fd = __drm_open_driver_another(0, DRIVER_ANY | DRIVER_VGEM);
>> -		igt_require(first_fd >= 0);
>> +		igt_require(first_fd >= 0 && does_device_support_dmabuf_import(first_fd));
>>   
>>   		second_fd = __drm_open_driver_another(1, DRIVER_ANY | DRIVER_VGEM);
>> -		igt_require(second_fd >= 0);
>> +		igt_require(second_fd >= 0 && does_device_support_dmabuf_import(second_fd));
>>   
>>   		if (has_prime_export(first_fd) &&
>>   		    has_prime_import(second_fd))
>> -- 
>> 2.32.0.272.g935e593368-goog
>>

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
