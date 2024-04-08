Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A54AC67861
	for <igt-dev@archiver.kernel.org>; Mon,  8 Apr 2024 21:37:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEF8310E034;
	Mon,  8 Apr 2024 21:37:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BIdkw+eV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D81B510E034
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Apr 2024 21:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712612258; x=1744148258;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=adMuDBiETAcgjkDQ0i4CgjbgmSY36pZcfTaaUuF9PvA=;
 b=BIdkw+eV8/ghBwPxhaljTOg7jdy0coLWTtM9b0XJoUI0SV0qjBw7KuDT
 0/NnKmHDhN1q51AVh2F+TWJMwmc1IGsRLe55MvTtMpCOKtoWohz4hfBuT
 lSQ9AFa3TQsxYXcYuDn3nB/73A19lgLQaNuHCmye9DJW1+NZcMIxiexOl
 HgCKbq3L4YD7oBETFL0815FmCNWD5gzEGP6i3dscb4JNZMGy1pgROkM9S
 yNO4x97X0iwUjtgYUr4HmlHWD97nreqrrzAYqXMIR3uDLeRpFNUJfZsro
 GGBDMUzvPviRcVT9dB9tAZ6NR4YCDbcNRfvCvoLbBp7l+DbXlV4m46HMd Q==;
X-CSE-ConnectionGUID: Wf3XOuN+SPG++MCF2aeTTw==
X-CSE-MsgGUID: Skc+9z9MSKmDjr0IC556EA==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="7782768"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="7782768"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 14:37:37 -0700
X-CSE-ConnectionGUID: 3whSr9eBSHeQOXEzs92iYw==
X-CSE-MsgGUID: PsxMtuEpRniqS9t3+IWq7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; d="scan'208";a="43191337"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Apr 2024 14:37:37 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 8 Apr 2024 14:37:36 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 8 Apr 2024 14:37:35 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 8 Apr 2024 14:37:35 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 8 Apr 2024 14:37:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C1Fmpe4dIl8AgzOPHyDOb7xZ6pGq7LvRRvqw1Itqh5Lwcbk9zFPwL5kALXRJZquTJb2izwlAhf3UTpKW95Urids68ChCKuc1+puqgbDcgRpHkWBB7XpZM7v77Ksv/PSGF7dmGEgAk728kiQwCgg8qqBuJXmyG7Pfgnz8o78kn45VXyZclO+8n++rBB5RP412OCvw5AzJT1RNLBJMyr4VlhVHrh5UYdtXW7hRw0l1c9+77V3MXjvrjd549Nc3GmCBwIuqDTzTgWGMx3ZWHJfo1PxF+sIDPWvs6XganZ6a4GukH/AVtbsn/4p1HT6LrF9J8MmiWoDIdh5a6EJx5Dcfpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1bybXN1ZmtMP3GH+qgElez1Ll29aCu9RgnHa+zor/Vc=;
 b=RO6uFZaEhpgvzr8Sw4F97xNk84FZ9jU6n+yFCvwgcxEm/Y/nPGzlyxzq8K+EQQZ/YeCNGtL/q197BYImAF+gJcg/M9AKWi7mVy52NbEphfNlDcRR7TWNrbgfp9H9/63C5FNEoDbCZJJ5sbm8WpRo3A55vx4Dq5ODQle6RSOytC7+yNGr/NIZfswtFr0/+4jpPCgMD7CvZwKeZl3nmt75iubnIMHEPz5WKNqpbiBEL8HoX9ZPPb1jqWK6UW6FwAd3EgaSpN1RRoAoBKuA51nMskm3ThJ5/x2GTg7b6LRTwKIwapyIxfWQC6nEYMxTGMpIm7a0cQglprlzEUxFcckC2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB7717.namprd11.prod.outlook.com (2603:10b6:510:2b8::8)
 by SN7PR11MB6727.namprd11.prod.outlook.com (2603:10b6:806:265::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Mon, 8 Apr
 2024 21:37:34 +0000
Received: from PH7PR11MB7717.namprd11.prod.outlook.com
 ([fe80::1d23:6882:9323:f273]) by PH7PR11MB7717.namprd11.prod.outlook.com
 ([fe80::1d23:6882:9323:f273%7]) with mapi id 15.20.7409.031; Mon, 8 Apr 2024
 21:37:34 +0000
Message-ID: <88af9288-e9eb-4d82-a2d1-445afade0f5c@intel.com>
Date: Mon, 8 Apr 2024 14:37:31 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/xe_vm: Fix Sync Issue between Unbind
 and Hammer Thread
To: Matthew Brost <matthew.brost@intel.com>
CC: <igt-dev@lists.freedesktop.org>
References: <f845a357442bd285ffb26cd0288a97819cd9d470.1712350676.git.jagmeet.randhawa@intel.com>
 <ZhBzlaOywBje1xeU@DUT025-TGLU.fm.intel.com>
Content-Language: en-US
From: "Randhawa, Jagmeet" <jagmeet.randhawa@intel.com>
In-Reply-To: <ZhBzlaOywBje1xeU@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR16CA0008.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::21) To PH7PR11MB7717.namprd11.prod.outlook.com
 (2603:10b6:510:2b8::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7717:EE_|SN7PR11MB6727:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Qr9AlRACay6zkokjWNBEe4ZfgUJerA2HnW6Qcoyky3TSiF4hr0b6K4upzQg3oU9rnPutv8GLSw7omK9t6Nr+qmgBhWNWyf9GqW49Tyl69/EWasIVtBDyTIlcOAXLtjMwW8/9TYcamb2fL39lv84bb90ix559TJDwaWqyJcsyzakZOQKlfoho/sn04TufknnD3ZWSbZdMkxpYcj1VFXQwQwuTueImDThvVKwoiSsgqeiuj7djXmWDX6vsYjVmUg03mVzmeehuHvmBCcM07JXz6wS7M9FADzrs6HpvZd0XQurkFtGsnptV7BdvQFOcxV2pH+D1n/ujcrHa8OXCwqfNt0l18NMVzc/PvoV5HKKYq2CpwPwnyo3BTJrSK9Ga0lhEDa3NyAChVLpgfhfD03Cptnaf67TnSZuwizfwJKAJ7+7JK7OUwPa8CRm3ZR0o9AKAt8CulatPp6dr8QD+dOMZb1o0pWSQYe5yRAUZ28ZH0mW3iuSQBxiUIFGox6XN0hRJn063YVgffWnvwyMO15GH0itbb5as5zPKoBP98ihU1rORhzvVCsaaUqhnA/cRLGMt4bqzaAbVIj16xJTFUR9X9FKTPG7buHknbo+mWVLSAFaIN0hQGleJ51v905Bp2SNPQLnnhDmd9l0Y009PG0QgyBBhf9RP826ExTA6neGYA9Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7717.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UTduNGNydzQ3dEZLMVhnakNzZHY5K3VkZTJZWWwrQ1ZLVU9RRmJhdmN1MmZw?=
 =?utf-8?B?NTJsamFYYWovRXI5TVFNbGJsblBqZ3pLdEdhYjY2RTdlVERsSTRJTVROOW8x?=
 =?utf-8?B?ZkExWGtBRnJFTnpVOG5MbTZQbVF6dlhwUi8xT2c5U3pKclRydUI1K0RkUjJh?=
 =?utf-8?B?K3F5S05RRkZXSndINXlqR2hoTVVHZGdjd2ZBOWhBMW1vWnJ6RHNKbHo0dERv?=
 =?utf-8?B?Sjl6Q0tyMW5rNTk0aityUk9DMi9nc3JhazNoL1BLTmNtNXowWld4OCtVVHZv?=
 =?utf-8?B?WE1paWJXSGNGQmFSTlJHaUpCeW1WVzcwRmN1QVBiMHF1ODJMQWxqTEF1NTVQ?=
 =?utf-8?B?NUlPeUkvRnJIVGNVcXRTb3VuN0JZMjJRVXpyalljOW51K0xJU0s4bFYwMUNi?=
 =?utf-8?B?bzZCbnc3Ui9USG9pc3lQUEFQaFNMYjl1eHNwTzFzVUh3a1hPY0M0Y2RJQWVR?=
 =?utf-8?B?N2VKcEJvcG4zSlQ4eUFXejVuVHF3Uk5LRDdUeXN1OHY3OFJmR3p3cXVlQVp1?=
 =?utf-8?B?blhuM3FsSU04am5HZ21UVVA3c2E0Ukk3b3g5K0F2OENlS2pvb3UrUmYxZC9H?=
 =?utf-8?B?NDArQ0pTSkZ2VEUzUUwwNEw0MW9YMEh5S1dPN0xZTkh4RjNTYVlXWmZ1VERv?=
 =?utf-8?B?UXVLWkFEZVFzN3FjWFhLWGlyNE9NRVE5K3UvaHloY3daM1UzOTVkN2dZektY?=
 =?utf-8?B?M0FONHpoL1l5bldLSGFoWUVpOElISUFTZXdMNDR0OEhxektxZTdYbCs5WXkv?=
 =?utf-8?B?WHl4UE51OERXbDl3MGdzU1lCQzkzdmJlS1FEUWl6TTZIOWRUMWZ5enFxZXlw?=
 =?utf-8?B?REx4R0tadDlRNVNOWG5KVFhGYmlMQWZHUGlTY3JTZ1V2UUlaVFBjVVJacm0r?=
 =?utf-8?B?d3ZQWHgxL3BPeHFhbnVsN1NPODN1QUxZbk1VbWdUQzdOWkl0N2JGZnVaWUM3?=
 =?utf-8?B?NzVFZGNsYUZCcDdkWExXS3ZLMWhtWjVkZVQ5RDRJaXNESkhOaW1XSzd5d241?=
 =?utf-8?B?WkJXYXgzMmhGOWt4L2JCR1o4cElubFI5ZG1RZitZS1dJbGRSNDZNd2FHYXRu?=
 =?utf-8?B?V3RBWHNDdEdHanJwT3RZbVZvMmdqei9lZHEzbGd4YjAzdjFXNmpuQ2VxM2Ix?=
 =?utf-8?B?NzlpK3l1Q214Tkx1clpoY2FxNURzVm85cFlBT1ZFNkh6RU5iaGpBdFhXYStZ?=
 =?utf-8?B?SmVlc0l6WGdjV2tHUGo0enRTWDZ0V283ZEo2UHhnSXhKeXlWK09CeGtueEFS?=
 =?utf-8?B?L3Yzd2FVdmdzZ2NDZUdCLzRUbGtmS1pJdUt1YWlISElDanVubC9sMUhWN1Bz?=
 =?utf-8?B?b2lBNUs1dDdwejdWSGx2L3ozbzgyZFBnNjAvV3VBQ01iY3dtZG1sZDEwNHRV?=
 =?utf-8?B?YzhKOHlJdlEvK01DUWQxY0FwK2JTZHcvQXZRQUlOS0NDOVRwSEFURW10eGdG?=
 =?utf-8?B?SE01L1gycFpVa1Vjd2UrTU1kVzdsU203Vm5iOTFQOVlPbytuNXFKbmQ2VXJi?=
 =?utf-8?B?cStLaUpCQ0k0UURoVWVIemlDcUFHZFRZOVVCKytKaVZuWktrdlF0dEc3WUJq?=
 =?utf-8?B?TnJLWUtzNCtxT1NRZ2x1eVFUSVllT1JNMkJ3NkdlMjg1ZkFtTWFENVhyb1VK?=
 =?utf-8?B?QWptV1daRmh0TU9HbUlZWkFTS1RMU2dlbDlhaUtwb3oyVGhtWnVXNi9ocmVE?=
 =?utf-8?B?U0Y0V3BUYm1kWGxjYnBkdVpUQytpRXZGcGFqTFRGdmEvamRJTWcxLzArN0xI?=
 =?utf-8?B?M1lDUjhCM0dJSThueXorQkZxbjJmZkh2cngreWNLalZzdkNkUkRMUWFLUzIy?=
 =?utf-8?B?TDdYdnRmc1FDNDFYdTJmZW1sY3l5cEMxemJyUERxa3BLcE9Nbm53eFZ2REU4?=
 =?utf-8?B?dkZZa3E5UWlQejhWYlZxNlIyQ201WnpMUy9NZWQ0dVlXNEErSTgxUzF6K1Nn?=
 =?utf-8?B?QkYxaWZyS0hSZHFOMHhvd21abmdXM0VNV2NiS0puc1pIMmRDdnBMV0Z3NU5X?=
 =?utf-8?B?elRDNlkrWUhhb0pKTm4yUW9pa3FEVk1zOXBnVEcwWVFrU2NYOTloTUttaTVK?=
 =?utf-8?B?UWlLbHNRdEFNN3lZMFY4cHZCUno0d2x6WDk1K01UdVJQMFpxWjBUM1c5M3Yr?=
 =?utf-8?B?bjh6SS9HTVJ0UVU4a2kxUG01a013V0p1WmRGMDVPTVozelFKcUl3UFRaeVIz?=
 =?utf-8?B?amc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 729f57f6-c90d-4ff6-f3e8-08dc58141a07
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7717.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2024 21:37:34.0192 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a5iojVwo5SDlEPE+nmbNR2NqmloNyznvJSEUQK4wpszMdnqOocCrg3M6d50UtFoAzfNpE11Fhh2LBxIjL4EAG17pIO62AuP8NZdWbCsfmn0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6727
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


On 4/5/2024 2:56 PM, Matthew Brost wrote:
> On Fri, Apr 05, 2024 at 02:06:08PM -0700, Jagmeet Randhawa wrote:
>> This patch addresses a critical synchronization issue
>> between the "test_munmap_style_unbind" function and
>> the "hammer_thread" function. Previously, "test_munmap_style_unbind"
>> would proceed with it's execution after launching
>> "hammer_thread". However, the "hammer_thread" in it's
>> initial iteration encountered an error during the syncobj_wait()
>> call halting its execution prematurely. So we never returned
>> back to the "hammer_thread" from "test_munmap_style_unbind".
>>
>> We resolved this error by adding a syncobj_signal() call in our
>> "hammer_thread" function, allowing "hammer_thread" to send the
>> signal to "test_munmap_style_unbind" therefore ensuring the
>> seamless operation of both threads and correct synchronization.
>>
> This explaination does make sense, see below.
>   
>> Cc: Matthew Auld <matthew.auld@intel.com>
>> Cc: Stuart Summers <stuart.summers@intel.com>
>> Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
>> ---
>> VLK-54352 and VLK-55620
>>
>>   tests/intel/xe_vm.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
>> index ecb2a783c..a25878cd8 100644
>> --- a/tests/intel/xe_vm.c
>> +++ b/tests/intel/xe_vm.c
>> @@ -1153,6 +1153,7 @@ static void *hammer_thread(void *tdata)
>>   		} else {
>>   			exec.num_syncs = 1;
>>   			err = __xe_exec(t->fd, &exec);
>> +			syncobj_signal(t->fd, &sync[0].handle, 1);
> This doesn't look right.
>
> This thread is doing execs as fast as possible waiting on every 32rd
> exec. The main thread (test_munmap_style_unbind) is modifying the VMs
> bindings in a way that creates scheduling dependencies between the
> threads. The KMD is designed to enforce these scheduling dependencies
> while both threads run fully async. If syncobj_wait hangs, there is
> likely an KMD or hardware issues here.
>
> This code signals the syncobj from every 32nd exec in software bypassing
> the hardware / KMD signaling the sync. This breaks the design of the
> tests and makes a likely KMD / hardware issue.
>
> Do the VLK failures occur on every engine instance / class?
>
> Matt

Thank you for the review. The KMD is enforcing the scheduling 
dependencies, so this patch is not addressing the real issue here, it is 
likely just masking it. We can probably discard this patch. The VLK 
failures have a requirement to run on non-copy engines, and seem to fail 
on every non-copy engine instance.

Jagmeet


>
>>   			igt_assert(syncobj_wait(t->fd, &sync[0].handle, 1,
>>   						INT64_MAX, 0, NULL));
>>   			syncobj_reset(t->fd, &sync[0].handle, 1);
>> -- 
>> 2.25.1
>>
