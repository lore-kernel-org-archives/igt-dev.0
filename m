Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C423C48BEB
	for <igt-dev@archiver.kernel.org>; Thu, 22 Feb 2024 07:19:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D2A110E446;
	Thu, 22 Feb 2024 07:19:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ny5PvG7Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AC9C10E446
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Feb 2024 07:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708586364; x=1740122364;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=2HKGfiUZ0PYzaHShVKEHr4ko1oE/mX7e7k4cBtPNCPM=;
 b=ny5PvG7ZWiHum8TU+BOq1aoFqSs/V4owz83xvlI8qSaxYFZ1lNvtoIDm
 oiaBMSCPC82rckFSYkC4ThewONsXZB4ul21nWjwz1Lmraz0Gl7AY2y4Af
 KN+b5+tVsvIT5aWaiE+xSNGVFGu30ENTOWJk/E+u/yB5WYRFjWQUr19ec
 xJ0XBPc9Q0eeh5UUW2Dux34/tt0eQJT3gd2GU7QUl8NmaT1KxwwnuAaeV
 Ml3Vjp44JF4MQsdnwnTSvOh/OeBVfhoKOUGHb/Iayw4YUYjQW7HUiyoJ9
 WT5ErP/5UjlpCqLrAGmmF9B6nlJEysKfyqKkQSp33uhJppAh/x8lYv5xe g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="2933574"
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="2933574"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 23:19:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="5294392"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Feb 2024 23:19:23 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 21 Feb 2024 23:19:23 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 21 Feb 2024 23:19:23 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 21 Feb 2024 23:19:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KohKZH1NaR5/Ws5Utxo1afLOkcNkcKxhwS3GCF27IsS3bSb8wJ3UMRWt0kvSyF55L3dbBTauoghX51kteahYoYwU7nQfKVMNnl0bVZplYHJI65w5qnlPgEuUnfnxRZ4Y+hn9qZxIsFPkedvFAmYj2PTBND3bZTQHxTlpshAdJM13X0Z9ps4dwqngnX9TThr67Nir+Yh6k9MEk3yw+o0KwsCV6Hgr0nFYkhLtZ5r/fkaJoj3r+HkIWYqIFricCGd+7LacIqUofBxmsVBzuQeCa1twkdNvtgWVIkACiLkXwqsssJMR1xkVltdZJfOpS0l9TAsDWgRIs5Tnz+M+D+Xtjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6yY5QDby1d36HJMlMoaNqTuX0HtiNMUcHmi+9BzLiKI=;
 b=h1NfmAGTtF/g+8PeJLVPACRYglOLaOkQvweXEs2Lo5Wtzjp8jvaQhiDcP0/XRgZY913s30f7AjdzzaKH4SgvO1CRSDT+BT7aEPd31bBjmk8WHlCffP/FcF4CdMJdAcbXTiH0STJwgjMgry9reYkTm+VlDkM82YIBrnq42+sIm/oQQVLzYL4XQupDZPu4vsOu2Di9s736gRbhx9Jd65r8M8M5oiZJblSlUaSddYqnJ7WAxaiOmISI/8OHCAwQF2ppK1JNsZMnptu1XGIMD5Ev+Y65UnwwKN8CF2mLsEcF2nrEEGuydrDxUs5wjxrKkzzE58JwWIpAvmJEAAh7yXEmFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 PH7PR11MB6955.namprd11.prod.outlook.com (2603:10b6:510:206::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.39; Thu, 22 Feb
 2024 07:19:21 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::950a:155f:7cb1:b9a3]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::950a:155f:7cb1:b9a3%5]) with mapi id 15.20.7292.036; Thu, 22 Feb 2024
 07:19:20 +0000
Message-ID: <42bccfef-c5e1-48cd-a6ce-9f3bdc1efd30@intel.com>
Date: Thu, 22 Feb 2024 12:49:14 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t] tests/intel: Add tests to run suspend without display
Content-Language: en-US
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
References: <20240222070635.878953-1-sujaritha.sundaresan@intel.com>
 <cb29fe35-0e68-402e-ac9b-a18addd3a48c@intel.com>
 <CY5PR11MB62114DF7228979346319F8DB95562@CY5PR11MB6211.namprd11.prod.outlook.com>
From: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
In-Reply-To: <CY5PR11MB62114DF7228979346319F8DB95562@CY5PR11MB6211.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BM1P287CA0021.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:40::24) To DM8PR11MB5653.namprd11.prod.outlook.com
 (2603:10b6:8:25::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5653:EE_|PH7PR11MB6955:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d4abddc-eccb-4e42-9836-08dc33769698
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8/PgtfmXfYOna0zaTSeXalnb7N7lVUU8ywrzVieDvohozWyr3S8UPopxulLHHEFwdnjZwipLItGvja9j4oa0RWvgCFaT2X2goaMkHWuXCgujRlOo913t6DX4PbkbWAGLmdkudRJabPe6rfOBG467k24n90zO4IK3Da/VwEI0jUjA67Nwj0lAtTW4gMgV5gLDpYwEFCbDgCaBr4b1v1TMNPGxelTwNhvj91XijGtxtklXZ/LbuJt66qydOfbYwsq/Mahgim/XlYrCHImul8ktuSoR21IolhkV4EY/L8K/CVwg3lAJAWDwWq7/qQqQCoDPclXgZo+mp8mx2gsXIFuR5AHsA/80GqNIsUB826ZofXVHp7Pccc0HYN0wxPriW5GFEpLHM6vRWEBOCFBj6DzWq+zE3Lcv8x1hQ866kdtBfZDeNS1B3P2o8DWmexorWZUIY5aMU8/xpz20gWvD6RQE0OgtAnmESNIpgu5hQWS4xwiiwk924OSi63bJ9MQi+wZjyJpULlnICuJSuU0Mic5sI2hrpyIUsWXXrBnrRWf8uQk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5653.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NVVCck96ZHJmTUNNUG11OWdzQWtPNFBXcTdwM04yczNzUGdGTnZHejExSzVt?=
 =?utf-8?B?bFZvRHJydUxtY2g1QmRHUDJ0Wm5UM0dvMGZSZE1Vc1I0Niszd05US0M4OVdW?=
 =?utf-8?B?NmJvMkdqZEgyOUxnZnVuUE1NNlNMT05PRjFRbTFTY3hRNFBWTnRNU012Q0tX?=
 =?utf-8?B?R1FvWDlzNzdFVy9kTlEyRDUyY2I4aHNkRHFNcjlDaCs4dnBVaVNPbWRvYjhx?=
 =?utf-8?B?T2ZvdXR1TkpFYnovRjBOK2hFbDYxNVh5bmFZbm91OVFpU0dWb1k4Ti9mVnZZ?=
 =?utf-8?B?SnRwQjFrTWk1amQ2TG1FTUU3M01lKzBEVG12Z3ZCS3puUTJGYnVFbGxFdnNr?=
 =?utf-8?B?NGRXa0pwQnAwYm1PL2pseGxBT1BZT0NQWVA0YVZWc2hNWm9mYlBDaXlZYVc1?=
 =?utf-8?B?N1NNd2d1RUtqRm92S3J1ZzF6YlViclhxTTZkZk1FNzBmRXRHK3VLZDFhUXVE?=
 =?utf-8?B?cGNwaGVuR2VBUnZreStmYlFQT0xlUThVNlhMWGlFOUdvQ3BIUm93UUNraXpV?=
 =?utf-8?B?UUxQdVI4VFJkQzd5UzhobkwzNGx1MjUzaDhaUEkydzJpZEt3dmZBanpEaUQ0?=
 =?utf-8?B?Y0JKenBYWkh2d1NxMmxLWHBTVmIwalFOQkxvRm0zeFRHc3BwRXJMM1hLNHA5?=
 =?utf-8?B?bWt4TkNuT2xIZFZsS3VVNVBGRHdwT3NLaFNRNjQ4MFJwZUhqS1poN1Vpc2Vp?=
 =?utf-8?B?MTNJVG5kQjBiYkNERlY4R2lRUjNEaWNiTVh4alg4OTljUzRZOTJNTnNDczdm?=
 =?utf-8?B?bmkvTzYxZXR5L3pVVnNCZXQzMzZwWnF0TjhwUE1hR3d3R2o3WlZoUGhsRi9u?=
 =?utf-8?B?WFRMcXBvWEI4elJkaWF2LzczQUFpUWNMaWZ0TmV6R285M01hR3VOTHhHb1NQ?=
 =?utf-8?B?N1d2VTk4d1pVZ1kxaEVRNGFiK3N3c1JDNVdmTC9CK01id2NybVJxRzh2YVp6?=
 =?utf-8?B?djZodjNaWVZjVmhVSFJRMlhlckdkTG03dmFFbmlFWWxOL3l0Y0FFN1hrbkZI?=
 =?utf-8?B?dFFEaUtPTHM5TndtQm82M1M3QVEyU2RZS0FrQnFkb1lKa2ZhOTFZeHRLTita?=
 =?utf-8?B?bGFpbm1iSkpYVGwvc3piSUF2bFduN0xrRVdFOVFGSWNRaTFsVzhQVlQwVWRw?=
 =?utf-8?B?bElSWnlDYkVsdExMZ2pBaFYwRDB4YmpERy9QNGRNUVR0R2pYa1R4VFZPVTEw?=
 =?utf-8?B?dzB2OFJFTkZ1MEpOcE85N0laTCsrZXJEVENSdWl1SzVEcyszYjNKa2hKODRD?=
 =?utf-8?B?RWxLQzhzeWxGbExicGlXeUZxTjRvUzYwVFVjOEUwMitkbjNza3BGQ2kyRE1L?=
 =?utf-8?B?UjJlVUErcmk4UGlRZC9NdmN1cStQc09URy9pb3hXUFRzYStwZm5IdkFzTXdq?=
 =?utf-8?B?MlhyZ1ZpeXVIT0U4ZkhTR1A3T0xnemJScGF5d0hVYkVDRlpGOGVQSENRcm03?=
 =?utf-8?B?dm0raVZNc0NibS9lSVNOdmpGOXRFN2lHQ1ptRFIrRm4vVkIweVp0eHp3czBC?=
 =?utf-8?B?NzRrODBWcjVjNTlxbWJVVEtZM0hBVDdRVDlqYzBNa2Z5TkczLzBiemR2dzd1?=
 =?utf-8?B?K05QeC9vVmN3eTFrYURhdit2UHEwY1VEMjNBMzV5TjdNQ3ExS3VqOGFuMDJw?=
 =?utf-8?B?dVUrSWdSZ01QOVdybWRISVFYUjhTbG52UTg4SHMzN0RxNW1ZelIrNTFzcVhp?=
 =?utf-8?B?dW9Nc2diSVdHc2FCL3JEZWN4Qk14ZWVVOVJpbmgyakZmZmdyZWlta3A1aFZw?=
 =?utf-8?B?bjdNaGFsNEhWTlRHRERERk1wV1VHbDZnZEtnQS9rV0pwTTFsZkRYSGFRNWUz?=
 =?utf-8?B?c1BMK281eFd5TkRKT25sMHdSVGFVcWJDQTNBSlo0bnFjbkUwaDhlOWNlc3hi?=
 =?utf-8?B?TWhXNTZub2RnSitiVWRZSjdUK1dqY0pjZlRPSkNjMzJvSGVXQWFUdnd1V3hS?=
 =?utf-8?B?WkJUUFVhN25SQnJVLzJIcFVOblE3eklRb3NobVI0RXJ4T1ZESjlvMkRvS08x?=
 =?utf-8?B?WDVQYldhUzNwamcxNnBGMHpUdFR1Ymk5WUltRkt2aXlpUnV3TFpuaWtvQ2c5?=
 =?utf-8?B?dTNKRWdnWlRPeDQxUnNtRFpBVTRlVHppdkQ2K29RcWV0VnptaGc1REV5SUtF?=
 =?utf-8?B?OUwyOVB0b3JIUFQ0Z2hMOUsvclVjMkRIN0cwdjVMUVlSYVRndmFFakxpQ3V4?=
 =?utf-8?B?eXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d4abddc-eccb-4e42-9836-08dc33769698
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2024 07:19:20.8932 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mT7o415Lc+wytV1Ueijo/ssR9EjYqf90vsgKYWRFHlqFj30vpXyzZqPsrhloTBXRnipGaEivwlg3pLDy3u4BevAMoMVUPHxxKh9tzDnpOR4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6955
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>


On 2/22/2024 12:33 PM, Gupta, Anshuman wrote:
>
>> -----Original Message-----
>> From: Sundaresan, Sujaritha <sujaritha.sundaresan@intel.com>
>> Sent: Thursday, February 22, 2024 12:26 PM
>> To: igt-dev@lists.freedesktop.org
>> Cc: Gupta, Anshuman <anshuman.gupta@intel.com>
>> Subject: Re: [i-g-t] tests/intel: Add tests to run suspend without display
>>
>> Hi all,
>>
>> As a heads up to those reviewing the patch, the pre-merge testing for the
>> added subtests is likely to fail due to a known sporadic issue with unloading
>> and reloading the driver with no display.
>>
>> Thanks,
>>
>> Suja
>>
>> On 2/22/2024 12:36 PM, Sujaritha Sundaresan wrote:
>>> Add tests to validate basic execution suspend/resume cycle without
>>> display module to rule out display related issues from the
>>> suspend/resume stack.
>>>
>>> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
>>> ---
>>>    tests/intel/xe_pm.c | 22 ++++++++++++++++++++++
>>>    1 file changed, 22 insertions(+)
>>>
>>> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c index
>>> a0045da0b..e94835f0d 100644
>>> --- a/tests/intel/xe_pm.c
>>> +++ b/tests/intel/xe_pm.c
>>> @@ -16,6 +16,7 @@
>>>
>>>    #include "igt.h"
>>>    #include "lib/igt_device.h"
>>> +#include "lib/igt_kmod.h"
>>>    #include "lib/igt_pm.h"
>>>    #include "lib/igt_sysfs.h"
>>>    #include "lib/igt_syncobj.h"
>>> @@ -236,6 +237,10 @@ static void close_fw_handle(int sig)
>>>     * Description: suspend/autoresume on %arg[1] state and exec after RPM
>>>     * Functionality: pm - %arg[1]
>>>     *
>>> + * SUBTEST: %s-without-display
>>> + * Description: suspend/autoresume on %arg[1] state without display
>>> + * Functionality: pm - %arg[1]
>>> + *
>>>     * arg[1]:
>>>     *
>>>     * @s2idle:	s2idle
>>> @@ -618,6 +623,23 @@ igt_main
>>>    					  NO_RPM);
>>>    		}
>>>
>>> +		igt_subtest_f("%s-without-display", s->name) {
>>> +
>>> +			if (!drmModeGetResources(device.fd_xe))
>>> +				return;
>>> +
>>> +			xe_for_each_engine(device.fd_xe, hwe) {
>>> +				igt_kmsg(KMSG_INFO "Unloading Xe\n");
>>> +				igt_assert_eq(igt_xe_driver_unload(),0);
>>> +
>>> +				igt_kmsg(KMSG_INFO "Re-loading Xe without
>> display\n");
>>> +
>> 	igt_assert_eq(igt_xe_driver_load("enable_display=0"),0);
>>> +
>>> +				test_exec(device, hwe, 1, 2, s->state,
>>> +					  NO_RPM);
>>> +			}
>>> +		}
> We need to reload the driver with display as normal ?
> Anshuman.

Hmm maybe. That will need another unload and non-conditional re-load 
cycle right ?

Suja

>>> +
>>>    		for (const struct d_state *d = d_states; d->name; d++) {
>>>    			igt_subtest_f("%s-%s-basic-exec", s->name, d->name)
>> {
>>>    				igt_assert(setup_d3(device, d->state));
