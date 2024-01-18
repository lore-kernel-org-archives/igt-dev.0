Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 442A6C4707B
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jan 2024 11:28:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDCB410E760;
	Thu, 18 Jan 2024 11:28:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF14F10E782
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jan 2024 11:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705577309; x=1737113309;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=ZDvA3Nd9BNU5JQzb3mubSBwqfJl8hZnyMEskbYKPmEM=;
 b=F6BG1rX4mROLUmwkQxda0rrAyWaX/rc6VZut2/izxKT7+5K6xnXbMkEf
 FD1fg8l2BhYn9+l+XJmPNuic4pny+YvzP7ZbdyTyPRfxTMhN+W1mUD0NA
 r029acH+FoOYArRu61jEX51Dvbxtssz2lSIQWTREZEF+4E4hGVbbiB14+
 dtiFpqF8pKIIhsNtNs5Jp3I5AiEuon2Ro14x62MThCGRNKxakYjDrAYe8
 T77nhg7xQGkldeyvbPsj5giHm11zN88Vltu8QEWppRLKL9HZq+/fsIK+N
 Dwmy8lh6Omme88hSVvt6bXEKvzUu772fc88VQOc6P/BKV7TPcKmwapEHq g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="21903008"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; d="scan'208";a="21903008"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2024 03:28:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="1115935739"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; d="scan'208";a="1115935739"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Jan 2024 03:28:27 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Jan 2024 03:28:26 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 18 Jan 2024 03:28:26 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 18 Jan 2024 03:28:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d6ZTm59R3iI/kw4pGGoOW4+9OCchq5+SDVxYcsHPuCA82ymbnI2xire8kbkMo2S+WIdJ0TGurEXjqQr8VoN75ijyEl7BBkdt4wNhZUywzUdQP+FEVxla6Me++VpnsMyFSNCsaRBuAiNcFqCFdl4JK82KygLvuxmtkCS0NYFwjNJCAMJL5JuhS2dwiOzBq/zAAgx285/kbVjcQQrCvlZuL/A1p+UgHRAEIPaM6MdKdJmiYSE6jnKNSab3kzfwAwcl+J/3u80EkMGwE7NNwauPd6l5BkmUzZuiQP+gSyEfMtvRWZ89Zrd3xNv9wnx262yf2GhwVYbDvuKweqDT/vxifg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZxH9nTcjdRry09pkSCch+N6jex4NMiA0V5xYz2qSmoo=;
 b=Pf+lOg8cDYzpek8WJBvZR1EzL/QGpz6J2aGRUxqkup57aLFiXAVFgO0c3ABYM0yAJ+hm5lvkhu6YVQL0YB7gvXduf837kIaGHP+KpW0iwKdMXr9hCn/gjNBPx+HM03rUuaoGDGhSgcdSBLeDPc8xPI7J4xvm16EgKWORtIx6gnivUJ02ovYnWkxjvT1huWrpI+K/m8At3zJVMqdey3vI96/gdglXEWJP+1gyoCjoN2bX0Wonr+FZwm5Jilh8UitbqqnF9iZTZKad6HOCJ4DFx9MWocBXq3ji5YHGr0HtyBQmmiEVpEh8GmXNECa+qTWotDJW3F4tEDVM2gsrSrj+gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB6889.namprd11.prod.outlook.com (2603:10b6:930:5e::9)
 by IA1PR11MB6097.namprd11.prod.outlook.com (2603:10b6:208:3d7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.23; Thu, 18 Jan
 2024 11:28:24 +0000
Received: from CY8PR11MB6889.namprd11.prod.outlook.com
 ([fe80::bf71:4b0e:6d66:e035]) by CY8PR11MB6889.namprd11.prod.outlook.com
 ([fe80::bf71:4b0e:6d66:e035%3]) with mapi id 15.20.7181.019; Thu, 18 Jan 2024
 11:28:23 +0000
Message-ID: <cceca0a4-cc75-44f2-9f21-f09950249c98@intel.com>
Date: Thu, 18 Jan 2024 16:58:15 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/2] lib/igt_kms: add support for choosing big
 joiner mode
Content-Language: en-US
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>, "Modem, Bhanuprakash"
 <bhanuprakash.modem@intel.com>, "Sharma, Swati2" <swati2.sharma@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20240115105854.827266-1-kunal1.joshi@intel.com>
 <20240115105854.827266-3-kunal1.joshi@intel.com>
 <b5389ad8-8b98-4c04-b337-e39e7d20f5cb@intel.com>
 <0173fd3b-cf12-4aa1-977e-a994af9c91b0@intel.com>
 <6f95475b-1d5c-43ba-9fe3-310475ef7898@intel.com>
 <8fbaa612-67e2-4d7d-9f0b-eefd394ddf93@intel.com>
 <407a6e9e-b0be-4b67-bbde-94f51a46fe52@intel.com>
 <c5ebf27a-ef80-4ebc-b1d5-95ddd7a629d7@intel.com>
 <29fe498d-56b7-4d65-b3e4-42172c17f404@intel.com>
 <dac7774b-b91c-4cb4-87f9-a4d59d77e878@intel.com>
 <f9be4e23-d5d5-4f7e-bd62-a25739ec1266@intel.com>
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <f9be4e23-d5d5-4f7e-bd62-a25739ec1266@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0143.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:6::28) To CY8PR11MB6889.namprd11.prod.outlook.com
 (2603:10b6:930:5e::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB6889:EE_|IA1PR11MB6097:EE_
X-MS-Office365-Filtering-Correlation-Id: f7588465-f3cc-42f5-334d-08dc1818946c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9sjTjN061OS6k33k7dp0kaC9icMoTc1MrwCSKRWWDQNoJz59G7vumVeHpT/S72hf8Kh5HRI/72X0chgr+GuNvX2YjYaHnF0i4ZaEN59K8/9zCYyQ0f3favP3oow0Lbt59xDDnv0quqehC3MoSRNUzqaObZ5pQcGlcVCHOXjrSq2L4FLAYXcDlQajt0CRHwMu3DYxZJCMA4fn3XIox3yGdNzODZ90iPZmPYUNwLeyM10D/6dx8zJf/t6KdT6va/H3/h64Mr0l52HsAIy0ci2I0iZj0c2NyRV9ZnF7uGUeLzWThV8ua6623XeL4vQfwjwTsQC7iNRVdoMKIAFZm+XHxYeP6vsnO0h9CcMwfGWknAVrx+ztpyOFNXA0OewTAWHWk7Itj3oMGCG2wZUkmgwbXLSNXf26bPXweAjN7TdfBIT7ctLzYjYBS/fzAjhWOed5JIRezScBkO5npWwE0Mxidw1DD+/PNu3yAlwVJWfMA+alPnchiUBRI8MxZlR2ycByWxj4yfjqI5NPRnPdO4nADQVChnSeSF7eL0+DcT0qA9jbR2gpKYOJ7wqBvJO9z67joBMizVjqJodGMzV38GwMIUww5jnfocU47zvne8/GvKyIkdwsaV5pMeQWXMzQzjWDTbPy6hZ3sswoCABpHsJdtQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB6889.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(346002)(136003)(396003)(376002)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(83380400001)(53546011)(26005)(38100700002)(2616005)(8676002)(8936002)(478600001)(2906002)(41300700001)(110136005)(66946007)(66556008)(6512007)(6506007)(6666004)(6486002)(66476007)(316002)(5660300002)(82960400001)(31696002)(86362001)(36756003)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b2lBcnNYVjk4QW9FY1BmVWIwVDFjYWY0UDRWOEZjZGZTdE54ZnkvU0U4M2FM?=
 =?utf-8?B?MGlTb2cwYmxMVERJZEJQa1ExbjNJbndMd2xvclBEcFpjVDc0bExuaDZ2VTNo?=
 =?utf-8?B?R2pJQStqZm5yK0dvSHlkSGZrdk5TSCtTSXNXNDBveFpMTEUrQSt6Y0RLaUVD?=
 =?utf-8?B?Y01rdkpSWFZkdDNxVjg0cFJIQ2QvUHhpdEJrZGM2aVBlRTJ0M0Q1SzBtMjZz?=
 =?utf-8?B?bFhhT3FVU2ZmeU5TQnk1V0xnMDZES1hXemtNYUxJeU1aNTYrOU96RmRrWmp1?=
 =?utf-8?B?RHpIbi9mVmFuNmROek5Wbzd2K0hsRDd6RURMb2ZFUmI2QmpweUQyc2lUK0NJ?=
 =?utf-8?B?SHRsbm5YVUZuMStvNE9QUjY1ZmFhNjE5YkdXMlJCV2dGMlZDTzhJdlp2cThw?=
 =?utf-8?B?ajJGMXhhSmRLWjhqT0Q0cFljQUNGeGpTTnkzelUxMHJLa3BhQ3RBYjFpTnND?=
 =?utf-8?B?NlB6bFRBRGluanM3eWlFV0d2LzRwMjkyRy9XRkJ1OHpLVElQSktuL3dJSHVv?=
 =?utf-8?B?MkV6S2NralBvM0FVajNBL1RleWo3Y0ZUVnhwZTRLSFAxNmo2UHNnaDNmbGJm?=
 =?utf-8?B?RGljR29LQ2ZkdFQxNDRFMVpDeUgxTDcyUzBXVjZGcy82cnJoK1RMQnBkb2NM?=
 =?utf-8?B?MjdWWCtJcEM4M1ZjM2RYdEM0OXU3ZVhralJpM1RWQTdZditNMS9ScTB6T0cy?=
 =?utf-8?B?ek9uTCtQM0ZtL1VqREcwYVdlTVNSVW5xVUcxdFdseGpNZ2lLTCtBRDZlTlht?=
 =?utf-8?B?WXJRVS9mc1p6TmZKZVJHUlJUbjQ4Z1BHdHNFVUIvVkJzbzFENjhrK2wzSTVY?=
 =?utf-8?B?U09Vem5qRXA1aCtUUEFyZHg1eVdkOUdseWI2eUgxZGNPVlRBTXJybVE4c21J?=
 =?utf-8?B?clNFeTA5MTBUSTBhOVZZaHZSTW9WTVRuMlVGb041bGIyZ2FRcDVZWlhMaVZD?=
 =?utf-8?B?T0hKdFZJMllPSHFtUFhBNUJ5TVgwWmJkaXd5WUlEVkEzU2E0VHhWS3lneEVs?=
 =?utf-8?B?Z2dtUi83QnVPcE1TajZVU2txQkhrY1FMSlV3eEsvQTBGUFplcjZyK0dvaUpI?=
 =?utf-8?B?cHQ3QkhDVTNEd0NraG5lZ0g4RmRyb0pHcVZycGF5ejM4cG1yRjh4aE1SR3NN?=
 =?utf-8?B?bVpTWUZqUmtlSFhXRXNRTnJRU2RmYk14QmFHaHlwTnhjRTFJQjMwaHdJYmpo?=
 =?utf-8?B?WDM3THpRR3U4RDFiNFlRbXAyWVJNK1ArQUpFYTVObG9pcFdiWExpV24zZ0hq?=
 =?utf-8?B?ZUNHWHUxYTdlQUJuNUJxYjRNUHF1MmVqVkFWall1NUZkUGhLTXEyT01vS3VJ?=
 =?utf-8?B?R0cyT2lGdlpPOElRdzl0Sk44S2dINUZsYm9xVmV2RVlmeDlPMEUzS2pmMHgx?=
 =?utf-8?B?SnV1Z2E3b0tPVVJ5cVhMSFJaejhGVEtudi96VWJQN1J2aDBpTFJDeEZwa2hM?=
 =?utf-8?B?S3JmK2hSKzRMQVhNZzVZN0Q5QWpERCtJKzVzZDlvZUZna2kyckhDTVJkWGVF?=
 =?utf-8?B?UWNBVTZzNTBjc1VScmZpZEQ0VFlRYmN2cXF6YUJEb0J6c2ZuMnpCMXkvb3Vl?=
 =?utf-8?B?NXBGNTlWMjVpcDY0NEEvRWpWQlloMTUvWlVaMTUxb1Y3ZHIvd0dOM1FZbGhT?=
 =?utf-8?B?SjBZQzVNVm1ZOEtrMkJ5OS9MMk5zTUJWOHhuR1hCV1ZHWE8ySjhTcnNleW5y?=
 =?utf-8?B?VkRKaTJQOTdWcFlrRXEya0svYWdnaFRwY0VSa0xaOHRhUFFCU2R3eFhYM3BL?=
 =?utf-8?B?TUZERk5FSS9NZUVsNkkrUXpoMWpTa0xkYXNNMVZOZ2p2Vk5FMU5nZWR3VUpj?=
 =?utf-8?B?WTBITGFZMVRzZjY2OE9UUWE1T1hsTkE2bXZUZkpqd1h6OWREZDZZRk1TdStD?=
 =?utf-8?B?UlkrLzhQU1pJWURQVllZSFMybkF1RXRyR3p4enFQMDluVzJWaWtOcWZYc2Vy?=
 =?utf-8?B?M0U2YlFrUGhtRFZmdXczbWh5TDI5YUlhak8wNzRJd2VtbFg3ZFBKWWZoaFk2?=
 =?utf-8?B?eDBhQUZsZGV5TjQvUTZQWWRmRVVNS01iWVNlK1NvRlNyM3BhQ0VqZHp2UURx?=
 =?utf-8?B?bG10UGY0UHhJYlNwNytJRmxBOTBEWEorWlh5MnppenNlcWphQ1lqbEw5RWxv?=
 =?utf-8?Q?cQlqEPs7zJGL253fZdlh9jCen?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f7588465-f3cc-42f5-334d-08dc1818946c
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB6889.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2024 11:28:23.1477 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RAfuGDdDqz5lfcNvRsFz1Bl2KxjJfrHkuSsd+LsP5gwqsY8BrS2BfeinxTJHV25Asrp51VVCo1hLew38swiqSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6097
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

Hello Ankit,

On 1/18/2024 4:08 PM, Nautiyal, Ankit K wrote:
>
> On 1/18/2024 2:44 PM, Joshi, Kunal1 wrote:
>> Hello Bhanu,
>>
>> On 1/18/2024 2:40 PM, Modem, Bhanuprakash wrote:
>>>
>>> On 17-01-2024 02:44 pm, Joshi, Kunal1 wrote:
>>>> Hello Swati and Bhanu,
>>>>
>>>> On 1/17/2024 2:25 PM, Sharma, Swati2 wrote:
>>>>> Hi Kunal,
>>>>>
>>>>> On 17-Jan-24 11:14 AM, Joshi, Kunal1 wrote:
>>>>>> Hello Swati,
>>>>>>
>>>>>> On 1/16/2024 5:33 PM, Sharma, Swati2 wrote:
>>>>>>> Hi Kunal,
>>>>>>>
>>>>>>> On 16-Jan-24 5:29 PM, Joshi, Kunal1 wrote:
>>>>>>>> Hello Swati,
>>>>>>>>
>>>>>>>> On 1/16/2024 4:34 PM, Sharma, Swati2 wrote:
>>>>>>>>> Hi Kunal,
>>>>>>>>>
>>>>>>>>> On 15-Jan-24 4:28 PM, Kunal Joshi wrote:
>>>>>>>>>> add support to choose big joiner mode with environment
>>>>>>>>>> variable, use mode with highest clock if no mode with big joiner
>>>>>>>>>> found.
>>>>>>>>>>
>>>>>>>>>> v2: reuse bigjoiner_mode_found (Bhanu)
>>>>>>>>>> v3: avoid returning from multiple places (Bhanu)
>>>>>>>>>>      avoid frequent debugfs reads (Bhanu)
>>>>>>>>>>
>>>>>>>>>> Cc: Karthik B S <karthik.b.s@intel.com>
>>>>>>>>>> Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
>>>>>>>>>> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
>>>>>>>>>> ---
>>>>>>>>>>   lib/igt_kms.c | 24 +++++++++++++++++++-----
>>>>>>>>>>   1 file changed, 19 insertions(+), 5 deletions(-)
>>>>>>>>>>
>>>>>>>>>> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
>>>>>>>>>> index cb6d57c2d..2c4210d4b 100644
>>>>>>>>>> --- a/lib/igt_kms.c
>>>>>>>>>> +++ b/lib/igt_kms.c
>>>>>>>>>> @@ -1771,8 +1771,9 @@ void 
>>>>>>>>>> igt_sort_connector_modes(drmModeConnector *connector,
>>>>>>>>>>   bool kmstest_get_connector_default_mode(int drm_fd, 
>>>>>>>>>> drmModeConnector *connector,
>>>>>>>>>>                       drmModeModeInfo *mode)
>>>>>>>>>>   {
>>>>>>>>>> +    bool found;
>>>>>>>>>>       char *env;
>>>>>>>>>> -    int i;
>>>>>>>>>> +    int i, max_dotclock;
>>>>>>>>>>         if (!connector->count_modes) {
>>>>>>>>>>           igt_warn("no modes for connector %d\n",
>>>>>>>>>> @@ -1781,21 +1782,34 @@ bool 
>>>>>>>>>> kmstest_get_connector_default_mode(int drm_fd, 
>>>>>>>>>> drmModeConnector *connector,
>>>>>>>>>>       }
>>>>>>>>>>         env = getenv("IGT_KMS_RESOLUTION");
>>>>>>>>>> +    max_dotclock = igt_get_max_dotclock(drm_fd);
>>>>>>>>>>       if (env) {
>>>>>>>>>>           /*
>>>>>>>>>> -         * Only (0 or 1) and (lowest or highest) are allowed.
>>>>>>>>>> +         * Only (0 or 1 or 2) and (lowest or highest or 
>>>>>>>>>> joiner) are allowed.
>>>>>>>>>>            *
>>>>>>>>>>            * 0/lowest: Choose connector mode with lowest 
>>>>>>>>>> possible resolution.
>>>>>>>>>>            * 1/highest: Choose connector mode with highest 
>>>>>>>>>> possible resolution.
>>>>>>>>>> +         * 2/joiner: Choose connector mode with bigjoiner 
>>>>>>>>>> support or with
>>>>>>>>>> +                 highest clock if can't support big joiner
>>>>>>>>>
>>>>>>>>> Shouldn't this be only joiner mode?
>>>>>>>>>
>>>>>>>>>
>>>>>>>> You mean can be named as joiner mode because same can be used 
>>>>>>>> for big joiner / ultra joiner?
>>>>>>>
>>>>>>> I guess this should be bigjoiner mode only. For ultra there 
>>>>>>> might be other restrictions which we need to look at.
>>>>>>>
>>>>>>>> or
>>>>>>>> We are returning the highest clock mode if no big joiner mode 
>>>>>>>> found?
>>>>>>>
>>>>>>> Yes, this is my query here. Why are we returning highest clock 
>>>>>>> mode if no big joiner mode found?
>>>>>>>
>>>>>> We can return either with highest clock or highest resolution or 
>>>>>> default mode,
>>>>>> Since we have the other two already covered used highest clock.
>>>>>
>>>>> But why we need to return something if bigjoiner mode not found?
>>>>> If its not found, then we won't get to know only bigjoiner mode 
>>>>> not found and we are falling back to default mode.
>>>>> @bhanu what you suggest here?
>>>>>
>>>> Consider a setup with two display's with one having mode with big 
>>>> joiner support and other doesn't have any mode
>>>> for enabling big joiner.
>>>>
>>>> In such case we expect the tests to run.
>>>> We can discuss on what mode to use on the display (highest_clock, 
>>>> highest_res, default) which doesn't support big joiner, but we need 
>>>> to have a mode there is
>>>> what i understand.
>>>
>>> IMHO, We should fall back to default mode if there is no bigjoiner 
>>> supported mode available.
>>>
>>> As per my understanding, Pick the mode that exercises the max 
>>> bandwidth if there is no bigjoiner mode available is the expectation 
>>> from Kunal.
>>>
>>> - Bhanu
>> Will select default_mode in case of no big joiner mode found.
>> Will have separate parameter for the bandwidth.
>
> 'Highest' and 'lowest' make sense for any driver, but IMHO bigjoiner 
> is Intel-specific terminology, do we really need to have an 
> environment variable for that.
>
> For most purpose, highest itself should be sufficient, if the 
> test-setup has a panel that needs bigjoiner.
>
>
> Regards,
>
> Ankit
>
>
>>
>>>
>>>
>>>>>>>>>>            */
>>>>>>>>>> -        if (!strcmp(env, "highest") || !strcmp(env, "1"))
>>>>>>>>>> +        if (!strcmp(env, "joiner") || !strcmp(env, "2"))
How about
if (is_intel_device(drm_fd) && !strcmp(env, "joiner") || !strcmp(env, "2")
>>>>>>>>>> +            found = bigjoiner_mode_found(drm_fd, connector,
>>>>>>>>>> + sort_drm_modes_by_clk_dsc,mode,
>>>>>>>>>> +                             max_dotclock) ||
>>>>>>>>>> +                bigjoiner_mode_found(drm_fd, connector,
>>>>>>>>>> + sort_drm_modes_by_res_dsc, mode,
>>>>>>>>>> +                             max_dotclock) ||
>>>>>>>>>> +                bigjoiner_mode_found(drm_fd, connector,
>>>>>>>>>> + sort_drm_modes_by_clk_dsc, mode,
>>>>>>>>>> +                             max_dotclock);
>>>>>>>>>> +        else if (!strcmp(env, "highest") || !strcmp(env, "1"))
>>>>>>>>>> igt_sort_connector_modes(connector, sort_drm_modes_by_res_dsc);
>>>>>>>>>>           else if (!strcmp(env, "lowest") || !strcmp(env, "0"))
>>>>>>>>>> igt_sort_connector_modes(connector, sort_drm_modes_by_res_asc);
>>>>>>>>>>           else
>>>>>>>>>>               goto default_mode;
>>>>>>>>>> -
>>>>>>>>>> -        *mode = connector->modes[0];
>>>>>>>>>> +        if (!found)
>>>>>>>>>> +            *mode = connector->modes[0];
>>>>>>>>>>           return true;
>>>>>>>>>>       }
>>>> Thanks and Regards
>>>> Kunal Joshi
Thanks and Regards
Kunal Joshi
