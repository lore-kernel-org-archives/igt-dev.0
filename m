Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F5E8606A31E
	for <igt-dev@archiver.kernel.org>; Wed, 28 Oct 2026 08:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SVXGmGJP
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5C6710FA2E;
	Wed, 28 Oct 2026 08:15:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F5B710E56C
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Oct 2026 08:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793175250; x=1824711250;
 h=message-id:date:mime-version:from:subject:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=EX78Hn0Tjtsa45IL1KcITEE0I9Cci50/hZJqqpCkkYw=;
 b=SVXGmGJP2/jL3EA4HTQSBt0KXBDnbkuKzV6n4Z0sXyz4iH42sS1ikCgc
 RJwPjLA3DrdFvekk4iXBBi5OuLmq8UeYKhOneM0uMV5FYRizcthoireTl
 A/Lr7J1BsgNq1T3MdrN8G+zIcW9JBZLe4xa/6e2ihH8kryc0a1aBYWyBo
 C6E7Q74MgmQ9E4xTjLrHPo6UHb9O3/svaba6kMOY6TtkA0YWQpQ3gL6k/
 Rwl2/CY9Wl40vNQKef8DNbtnIKkX1FYJEkfdQYFI3vJOWWN9QsbzqmfYY
 BIEhQv8t6ptsSUq9dzfqHg6lh1zX5AT4s3pJPfkLubGfdeMw2wceF1UhT g==;
X-CSE-ConnectionGUID: LejpLlZuRsmMy1eQGGpJ4g==
X-CSE-MsgGUID: mPnKrwyrT7KDvBxJwcrFWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1796803"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1796803"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 01:13:59 -0700
X-CSE-ConnectionGUID: S1KYNhblRAOscXBGYjbShA==
X-CSE-MsgGUID: H55aVHWIS7mfCB3E1++utQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="4865087"
Received: from dbhadane-mobl1.gar.corp.intel.com (HELO [10.66.117.203])
 ([10.66.117.203])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 01:13:57 -0700
Message-ID: <fd707ea6-f501-4b2c-82e8-c3ad9055138a@Intel.com>
Date: Wed, 28 Oct 2026 13:43:48 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@Intel.com>
Subject: Re: [PATCH i-g-t 3/3] tests/intel/xe_survivability: Reload audio
 driver on exit
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: "Anirban, Sk" <sk.anirban@intel.com>,
 "Grzelak, Michal" <michal.grzelak@intel.com>, "B, Jeevan"
 <jeevan.b@intel.com>, "Sharma, Swati2" <swati2.sharma@intel.com>
References: <20261015140035.2686997-1-chaitanya.kumar.borah@intel.com>
 <20261015140035.2686997-3-chaitanya.kumar.borah@intel.com>
 <BL1PR11MB5413188823D4E12C92070E0FE2642@BL1PR11MB5413.namprd11.prod.outlook.com>
 <BL1PR11MB5413239E7CA4C069551AD3A8E2642@BL1PR11MB5413.namprd11.prod.outlook.com>
 <0dca3537-6ec6-4412-aa87-a4002712b144@intel.com>
Content-Language: en-US
Organization: intel
In-Reply-To: <0dca3537-6ec6-4412-aa87-a4002712b144@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 27-Oct-26 4:25 PM, Borah, Chaitanya Kumar wrote:
> 
> 
> On 10/23/2026 10:58 AM, Bhadane, Dnyaneshwar wrote:
>>
>>
>>> -----Original Message-----
>>> From: Bhadane, Dnyaneshwar
>>> Sent: Friday, October 23, 2026 10:32 AM
>>> To: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>; igt-
>>> dev@lists.freedesktop.org
>>> Cc: Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>; 
>>> Anirban, Sk
>>> <sk.anirban@intel.com>; Grzelak, Michal <michal.grzelak@intel.com>; 
>>> B, Jeevan
>>> <Jeevan.B@intel.com>; Sharma, Swati2 <swati2.sharma@intel.com>
>>> Subject: RE: [PATCH i-g-t 3/3] tests/intel/xe_survivability: Reload 
>>> audio driver on
>>> exit
>>>
>>>
>>>
>>>> -----Original Message-----
>>>> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
>>>> Chaitanya Kumar Borah
>>>> Sent: Thursday, October 15, 2026 7:31 PM
>>>> To: igt-dev@lists.freedesktop.org
>>>> Cc: Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>; Anirban,
>>>> Sk <sk.anirban@intel.com>; Grzelak, Michal <michal.grzelak@intel.com>;
>>>> B, Jeevan <jeevan.b@intel.com>; Sharma, Swati2
>>>> <swati2.sharma@intel.com>
>>>> Subject: [PATCH i-g-t 3/3] tests/intel/xe_survivability: Reload audio
>>>> driver on exit
>>>>
>>>> Commit 117e9ecbdd1d ("xe/igt_kmod_unbind: release audio before
>>>> unbinding
>>>> xe") made igt_audio_driver_unload() be called before unbinding xe to
>>>> avoid the audio-component bind warnings/errors that happen if xe is
>>>> unbound while snd_hda_intel is still attached. Both call sites in this
>>>> file passed NULL for the unloaded driver name, so it was never
>>>> tracked, and nothing ever reloaded it afterwards.
>>>>
>>>> As a result snd_hda_intel/snd_hdmi_lpe_audio is left unloaded for the
>>>> rest of the boot even when every subtest passes, since xe always ends
>>>> up rebound by
>>>> restore() but audio never does.
>>>>
>>>> Capture the unloaded driver name and reload it wherever xe gets bound
>>>> again in restore().
>>>>
>>>> Cc: Sk Anirban <sk.anirban@intel.com>
>>>> Cc: Michał Grzelak <michal.grzelak@intel.com>
>>>> Cc: Jeevan B <jeevan.b@intel.com>
>>>> Cc: Swati Sharma <swati2.sharma@intel.com>
>>>> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
>>>> ---
>>>>   tests/intel/xe_survivability.c | 11 +++++++++--
>>>>   1 file changed, 9 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/tests/intel/xe_survivability.c
>>>> b/tests/intel/xe_survivability.c index
>>>> bae9eca27..2be8e9ec0 100644
>>>> --- a/tests/intel/xe_survivability.c
>>>> +++ b/tests/intel/xe_survivability.c
>>>> @@ -39,6 +39,7 @@
>>>>    */
>>>>
>>>>   static char bus_addr[NAME_MAX];
>>>> +static char *snd_driver;
>>>>
>>>>   static void ignore_wedged_in_dmesg(void)  { @@ -158,7 +159,7 @@
>>>> static void restore(int sig)  {
>>>>       int configfs_fd;
>>>>
>>>> -    igt_audio_driver_unload(NULL);
>>>> +    igt_audio_driver_unload(&snd_driver);
>>>>       igt_kmod_unbind("xe", bus_addr);
>>>>
>>>>       configfs_fd = igt_configfs_open("xe"); @@ -167,11 +168,17 @@ 
>>>> static
>>>> void restore(int sig)
>>>>       close(configfs_fd);
>>>>
>>>>       igt_kmod_bind("xe", bus_addr);
>>>> +
>>>> +    if (snd_driver) {
>>>> +        igt_kmod_load(snd_driver, NULL);
>>> Hello Chaitanya,
>>>
>>> Would it be possible to have a helper like igt_audio_driver_load(), 
>>> so we don't
>>> have to maintain the driver's name in multiple files ?
>> Something like default to "snd_hda_intel" if passed with NULL.
>> int igt_audio_driver_load(const char *who)
>> {
>>     const char *drv = who ? who : "snd_hda_intel";
>>     int ret;
>>
>>     if (igt_kmod_is_loaded(drv))
>>         return 0;
>>
>>     ret = igt_kmod_load(drv, NULL);
>>     if (ret)
>>         igt_debug("Could not load audio driver %s (%s)\n",
>>               drv, strerror(-ret));
>>
>>     return ret;
>> }
> 
> I would prefer keeping the exposure of the change to per file/test. I 
> think "load back what I unloaded" is a good semantics to have instead of 
> maintaining the driver name globally somewhere.
> 
> But I would agree that there is a scope for a helper which can help get 
> rid of the repeated if (snd_driver) {...} code block.
> 
> I am thinking of something like.
> 
> int igt_audio_driver_load(char **who)
> {
>      int ret;
> 
>      if (!who || !*who)
>          return 0;
> 
>      ret = igt_kmod_load(*who, NULL);
>      if (ret)
>          igt_warn("Could not load audio driver %s (%s)\n", *who, 
> strerror(-ret));
> 
>      free(*who);
Hi,
Unwanted behavior if the order is igt_audio_driver_load(snd_driver) -> 
igt_audio_driver_unload(snd_driver).  Freeing this will loose the audio 
driver name.  Let testcase decide when they want to free this 
'snd_driver' mostly on testcase cleanup on exist.



Dnyaneshwar,

 >      *who = NULL;
> 
>      return ret;
> }
> 
> ==
> Chaitanya
> 
> 
>>
>> Br,
>> Dnyaneshwar,
>>>
>>> Br,
>>> Dnyaneshwar
>>>> +        free(snd_driver);
>>>> +        snd_driver = NULL;
>>>> +    }
>>>>   }
>>>>
>>>>   static void set_survivability_mode(int configfs_device_fd, bool 
>>>> value)  {
>>>> -    igt_audio_driver_unload(NULL);
>>>> +    igt_audio_driver_unload(&snd_driver);
>>>>       igt_kmod_unbind("xe", bus_addr);
>>>>       igt_sysfs_set_boolean(configfs_device_fd, 
>>>> "survivability_mode", value);
>>>>       igt_kmod_bind("xe", bus_addr);
>>>> -- 
>>>> 2.50.1
>>
> 

