Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 160E610EE61
 for <igt-dev@lists.freedesktop.org>; Fri,  1 Apr 2022 02:11:32 +0000 (UTC)
Message-ID: <f5b445b0-18e6-898d-d451-86cab6ac3a9c@intel.com>
Date: Thu, 31 Mar 2022 19:11:23 -0700
Content-Language: en-US
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
References: <20220330183259.3003663-1-daniele.ceraolospurio@intel.com>
 <20220330183259.3003663-2-daniele.ceraolospurio@intel.com>
 <87r16hh868.wl-ashutosh.dixit@intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <87r16hh868.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] lib/igt_kmod: Wait for a kmod to
 finish its probe before unloding it.
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



On 3/31/2022 7:03 PM, Dixit, Ashutosh wrote:
> On Wed, 30 Mar 2022 11:32:58 -0700, Daniele Ceraolo Spurio wrote:
>> diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
>> index cf7a3b22..d2ac8a56 100644
>> --- a/lib/igt_kmod.c
>> +++ b/lib/igt_kmod.c
>> @@ -143,6 +143,12 @@ out:
>> 	return ret;
>>   }
>>
>> +static bool
>> +igt_kmod_is_loading(struct kmod_module *kmod)
>> +{
>> +	return kmod_module_get_initstate(kmod) == KMOD_MODULE_COMING;
> One idea would be to check for KMOD_MODULE_LIVE here which will basically
> invert the logic in the loop but will be a more exact check? But anyway
> it's equivalent so no need to change I guess.

I was undecided myself, but decided to go with "COMING" because that 
matches the exact case I was looking for (i.e. init in progress). I can 
flip it to check for KMOD_MODULE_LIVE  if you think that works better 
and/or is more generic.

>
>>   static int modprobe(struct kmod_module *kmod, const char *options)
>>   {
>> 	unsigned int flags;
>> @@ -289,6 +295,16 @@ igt_kmod_unload(const char *mod_name, unsigned int flags)
>> 		goto out;
>> 	}
>>
>> +	if (igt_kmod_is_loading(kmod)) {
>> +		igt_debug("%s still initializing\n", mod_name);
>> +		err = igt_wait(!igt_kmod_is_loading(kmod), 10000, 100);
>> +		if (err < 0) {
>> +			igt_debug("%s failed to complete init within the timeout\n",
>> +				  mod_name);
>> +			goto out;
>> +		}
>> +	}
>> +
>> 	err = igt_kmod_unload_r(kmod, flags);
> I think it's better to add this code to igt_kmod_unload_r() (instead of
> igt_kmod_unload()) since that calls itself recursively to remove dependent
> modules?

I'll move it there.

Daniele

>
> Also it seems strange that we should explicitly have to wait for module
> state to become LIVE and kmod_module_remove_module() (which in turn calls
> the delete_module syscall) doesn't handle this itself? But 'man
> delete_module' specifically mentions this:
>
>    ERRORS
>         EBUSY  The module is not "live" (i.e., it is still being initialized or
>                is already marked for removal) ...
>
> So a patch like this seems to be needed somewhere (in IGT or in
> libkmod). So adding it to IGT for now is fine.
