Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 672E410E0E2
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Jun 2023 05:58:19 +0000 (UTC)
Message-ID: <a3bdd24b-2dc2-0f61-e317-a7689d2eff30@intel.com>
Date: Fri, 9 Jun 2023 11:27:52 +0530
Content-Language: en-US
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20230606080208.2683342-1-kunal1.joshi@intel.com>
 <20230606080208.2683342-5-kunal1.joshi@intel.com>
 <be055777-75da-6d71-15d7-2262c54d2e83@intel.com>
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <be055777-75da-6d71-15d7-2262c54d2e83@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 4/5] RFC lib/ioctl_wrappers:
 GEM_SET_DOMAIN ioctl not supported on xe
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


On 6/8/2023 5:12 PM, Modem, Bhanuprakash wrote:
> Hi Kunal,
>
> On Tue-06-06-2023 01:32 pm, Kunal Joshi wrote:
>> xe doesn't support GEM_SET_DOMAIN ioctl
>>
>> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
>> ---
>>   lib/ioctl_wrappers.c | 7 ++++++-
>>   1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/lib/ioctl_wrappers.c b/lib/ioctl_wrappers.c
>> index ebd8a2f3..1180d4c6 100644
>> --- a/lib/ioctl_wrappers.c
>> +++ b/lib/ioctl_wrappers.c
>> @@ -534,7 +534,12 @@ int __gem_set_domain(int fd, uint32_t handle, 
>> uint32_t read, uint32_t write)
>>    */
>>   void gem_set_domain(int fd, uint32_t handle, uint32_t read, 
>> uint32_t write)
>>   {
>> -    int ret = __gem_set_domain(fd, handle, read, write);
>> +    int ret;
>> +
>> +    if (is_xe_device(fd))
>> +        return;
>> +
>> +    ret = __gem_set_domain(fd, handle, read, write);
>
> I think this must be handled in test level. Instead of modifying the 
> helper don't call it in case of Xe.
>     igt_assert_eq(gem_wait(fd, handle, 0), 0);


I think it will be good if we can place it here

Also some library helpers calls this i think will have to
place checks there too

But let me know your thoughts

Thanks and Regards
Kunal Joshi


