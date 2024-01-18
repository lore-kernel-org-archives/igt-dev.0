Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAB62C4707B
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jan 2024 09:15:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FA1110E192;
	Thu, 18 Jan 2024 09:15:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C4BB10E192
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jan 2024 09:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705569300; x=1737105300;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=XEG46MYx+WGp9l4UMKmBHNEw6PA2YDCAiVYkvqQZmh4=;
 b=OSWOhTICOTtr2k1vHrC02FgoqhMaUnHepEJDyhcrHpTacDg6BtIWhlF+
 tZl/bdlMO+wX4e+F5YYs4/2qsfHIFMdC4a5XKAiRk+S329o2rxFz+MukI
 7MaSvEFsatRzpFbYALQMx0a8RSeAYZGeckAxRq16N8EslkQM3mbELQUE6
 BYAzCDskksL3ftBHxDOB428aLaizJ5tFY9KPxiUwBzaj8Jva0j9cTPZUo
 YUnmcxysFO5Z5B/rcHzon+cG6IurK50B/PxvTYSwfJAfEoLT//I+56qsw
 HEFfWekFHURctwoNFi8zAF0cs1TmxaiZGhUIwIkJ8o0FjR4eOTIiMWP4e w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="404161272"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; d="scan'208";a="404161272"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2024 01:14:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="928068997"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; d="scan'208";a="928068997"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Jan 2024 01:14:59 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Jan 2024 01:14:58 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Jan 2024 01:14:58 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 18 Jan 2024 01:14:58 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 18 Jan 2024 01:14:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lr6yVC5HmnDi0hGH7pyQxiwDWAlBm2mJOaxvCKm5Qhf6irU7a1jAo+ITzfimNCYs73N9gWmBEjEU53JRLFQr710jqpbBYeaKNr2NAM4gKJBI4bXrYgnUkygrq41gwC6s9q2GdiZQrs4RIFa9Fs/kEqZ84B55eQ3aOXsY4i53EIcZZLwgjcy1UU1NxMSpzdDQjKhdejEu+ZVsmRMC/jJtIgKnTpx9JYIXr0vaZsm3n3cJ84fS9Q63/BbyWbYig+6/Goq+mS0nk08//0g/a3Y2Axqru1+pxNwrHcOL6+UKcnCbykLDjUfK8Cd5J1y+2+TFtEYTkuD2c/4OSyk41+imBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4NgNX4xM9h8ZpL6kDJFzUKkZ8cB1p9zOCZ2qKj+m4ac=;
 b=Wdyr/qsZVpICBrFsBV/9cKgCZO5KId/HoAhNn5SL85XlsoQAaFZLHNS1m6oEKG7IlxQDyYQw6m6qyTqln4OEdhoJ4zMb4UOv7GDyWhLSxDKZclM9XdTvTT8Qmharb0xx4mcUCciPRUxt16VAUmm9DDmvXrkvTPoVng6vYy8IY0CgWXGmnAOj3/qlrujQ0L712ckYdN9LWLcvUO9jL3S4sZXOvu8gnjsB3nBol/mTU7IIWMhcQ1oTcxoCf+lIimP5N8uPrPKE/lPTpK22TvaKSan4jyi+3LRmDfoyF3hXPfpqqH4K+vSja8cmZT+PBS8Seimoup+LuytAmcSBTt13aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB6889.namprd11.prod.outlook.com (2603:10b6:930:5e::9)
 by SA0PR11MB4656.namprd11.prod.outlook.com (2603:10b6:806:96::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24; Thu, 18 Jan
 2024 09:14:55 +0000
Received: from CY8PR11MB6889.namprd11.prod.outlook.com
 ([fe80::bf71:4b0e:6d66:e035]) by CY8PR11MB6889.namprd11.prod.outlook.com
 ([fe80::bf71:4b0e:6d66:e035%3]) with mapi id 15.20.7181.019; Thu, 18 Jan 2024
 09:14:55 +0000
Message-ID: <dac7774b-b91c-4cb4-87f9-a4d59d77e878@intel.com>
Date: Thu, 18 Jan 2024 14:44:47 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/2] lib/igt_kms: add support for choosing big
 joiner mode
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>, "Sharma, Swati2"
 <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20240115105854.827266-1-kunal1.joshi@intel.com>
 <20240115105854.827266-3-kunal1.joshi@intel.com>
 <b5389ad8-8b98-4c04-b337-e39e7d20f5cb@intel.com>
 <0173fd3b-cf12-4aa1-977e-a994af9c91b0@intel.com>
 <6f95475b-1d5c-43ba-9fe3-310475ef7898@intel.com>
 <8fbaa612-67e2-4d7d-9f0b-eefd394ddf93@intel.com>
 <407a6e9e-b0be-4b67-bbde-94f51a46fe52@intel.com>
 <c5ebf27a-ef80-4ebc-b1d5-95ddd7a629d7@intel.com>
 <29fe498d-56b7-4d65-b3e4-42172c17f404@intel.com>
Content-Language: en-US
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <29fe498d-56b7-4d65-b3e4-42172c17f404@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0124.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:6::9) To CY8PR11MB6889.namprd11.prod.outlook.com
 (2603:10b6:930:5e::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB6889:EE_|SA0PR11MB4656:EE_
X-MS-Office365-Filtering-Correlation-Id: 964027d0-6f64-482c-f7a5-08dc1805ef34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e6uVROiIwzfj/Vf0S/x6N+VO8n8NWiiR1lyQ/N6GYma1LleWHUwlcRi90+0xwXXrBc1cN4qI9aKehmtQlhPaCtPGsEcKFB1dmXl5ULnFO0SpqlwLYA3AX8USW8jPtbj3DFp2VhxXAJZ7H2mNCPyraUuPJ+AqNFzo23jx7jqXjKoYDSIOWmD35KTwKHjAdc+lKk8DxDPj9fb33dYCl+AbsZKmxTkCBqk0jxjOS9u5pGn5wrTQEaScXxd16lauCK7V7OqCk+gBXx6IDBrsrcu77QGq0wBZN/GS0xrZPfji2V/A1QQu7FGMkEgZitaFtXxvwb3kdCPtUb60Tpd9yQRg8awJE5VS1CoOnI5IyDyjTEie+B3sjY3rS5EO83MiMm7PgFC316e5SXsP95JK2mrZ68wS3ydueBCMk+AA1Y/2gCFqncU5RYYjkG/G0x4K0Vr1rP9E1nT8TraBftnCVJCpCtwStPVIrBGzq30eNcklfQitFXyAl7VPQ+GUEzMST1m+hJCad0LbT2Rm3Hbu3YS7qSmLfwVa3GRVUMpWbDM/BCHTOHn5igIhdPYgBk6Eh4pkTHyogN75EoP4nTVhs66yEDlE1NyvlVKmwK3Dk9wVUn2wBetfzaLz7+7GW6J7cL/MVug8E5OeSXUv7VDSWSZYDQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB6889.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(376002)(346002)(396003)(136003)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(8936002)(8676002)(5660300002)(36756003)(26005)(31686004)(31696002)(110136005)(66946007)(66556008)(66476007)(6506007)(53546011)(6666004)(2906002)(6486002)(478600001)(316002)(86362001)(82960400001)(83380400001)(2616005)(6512007)(41300700001)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ajRWbFUxSkRublFqRTJudkpMWTZwWVBpVks1N21sa2VXZkx5SzNjdlVIc3N1?=
 =?utf-8?B?MmdoRmFlTU53L1VZcjNSQlRQY3hzY016VVh5MjF3cGNraExaRW8valI2Ykk1?=
 =?utf-8?B?cndnMEgwaThSamhrRy9CdUpVVVpkYTl4R3ZMZm5VRGxtZlNUTVU2ekZaQ1Rs?=
 =?utf-8?B?ZlZnZG9wTzk0QXBGM0xXd25ZTFYzZGwyM2oyeVhGRnNtTkxQVjg0VkFSeXRT?=
 =?utf-8?B?emhSbHcvT1d3TFlJU1MyY1ljeW5UV2JVa2hiOTg3ckZ2dmZ4bDFRcDNlN2lG?=
 =?utf-8?B?eHF6VFZ2UHZBQ3Rzd0lVcGVNYmY0bzR2MFpvQUhvaDRlYTJ3VGlFNFQyNXM5?=
 =?utf-8?B?bE1EbGxxRjdtdGRBL3ZpVXd3eHhlRTRsNDFVM05DaUJmWGRhMktMZzNOZEU1?=
 =?utf-8?B?L3NqNWd0Q0t2cE1ncXdUcENBelBGdWVGQTNvWnBkSEdMUlh1Zk15eVF1Y1h0?=
 =?utf-8?B?eFJ5RmdQUC8rUkplZkxDbWVsWit4M0pnTTN4ekVmR2lJM1QrQlRDZVVVakhV?=
 =?utf-8?B?OWNrR3BWclB5eENseUl1d3o0NktVa1VPVzFnYllKZjlqMlh1dmJpeEVLQjBm?=
 =?utf-8?B?dXU2bEMxaXpsaDd6OTRid2RiUWZrQnJlSVlLZGlvaFRwZTdmUnQxU1hSb2Yv?=
 =?utf-8?B?cFg4bkk0UjhLNlY4NThBOTFkdWFQWGdkd0VjaTVsRjdVZEw0VlZGWlRpUnF3?=
 =?utf-8?B?SE4zREFwMlUzd3ZSS0Y4c0VndTBSeWltMjg4ZmxUdVlldDBQdjNsZTdFajJo?=
 =?utf-8?B?NFMwbnNEZThUWnd5UkdnQ29mNmc1bEo0VzJrMG1oMFpEOWw0MzJla1A1ZXY2?=
 =?utf-8?B?V3h4ZDdMb1JkNWkxRXBtRmtFeHZPYTNVUzFPLy81WC9HYml3VWF5TDllL0pu?=
 =?utf-8?B?NS9naHdTcjBFa0d6dzRDaE1RbDhtZUNxVEl4RzVQdG1WdEo4OENWVkRvNmhN?=
 =?utf-8?B?cCs1TUV4V2RMcDNRbTE2bWVFVStKRGhPMktMV2Joa1I5a1BXU0JYY2lCMnFL?=
 =?utf-8?B?d1c3OWVqaHpua21oYWJJa2Fhd2pVNGdoRFhLeGxldEhaMGMwazFxZldKUDdC?=
 =?utf-8?B?OFM4eituYThQa3l0Z0ltbXNpM3MwSThDeEZudEV1cUVCU0RWM1pLL3FHczZY?=
 =?utf-8?B?Q3lMVU5VdXJ3OTExRjdlUFFtOEtvaW9QVTl1cnAwcXRoUnM1QzcxblpCOE8y?=
 =?utf-8?B?MkIvRXJrTmM0NTZuYm9WVUdIQXVnUG5PUWRYV3pGQ2xOc1JXRGRJT3JrOTV5?=
 =?utf-8?B?a0V4Q3FQT0RPUVZjODA2K2ZCZ3JhTkU3YmdiVW5ibkpiZUI3U3ZXbW9GYVpR?=
 =?utf-8?B?dDh2b3E2bmN3aUUvOUNLclcxZlJqTE8yanlTWWhTL2FsREc5eTBhaFRBRGdE?=
 =?utf-8?B?d3Z4Nll2S1RZdU9HTFVlWDhyWm04dlZaMzNTbWJIT0RRNDh0QlhtNGMyS3Zk?=
 =?utf-8?B?ZnZ0Tm1sUWs4U2NqV2V4S2lwK01lRUhXNDZlRE16T0V4Wld3UitObFAyREU4?=
 =?utf-8?B?bjlTK3lyR3JZSVcrYUhLc0w1bGZlVmtkRzYzSWxZUXVhemNSejhsZWc5OGg1?=
 =?utf-8?B?ekF4WDBRSkcraG1EcE1XTUxhK2Y0YUdFM2JYb05UblJNWjBsTE1FZEV5cWFN?=
 =?utf-8?B?VzA0SkNZNzZiOVUxMXNaQ3kyRTJmdkdUcld5Q3VST2c0NkpESE56eVUvd1VB?=
 =?utf-8?B?T3QwaCtublBCMDd4d1EvNlI3ZEljU29Va3dVck5tdFE0Y0FWY2JUc2FxSmtp?=
 =?utf-8?B?dUoxdGNaeW0vR2J5MFZtL3dUNEUvNzNIT05zMVAzYnN1dHM2WVpMaldlS2k0?=
 =?utf-8?B?aGo5dDBwcXhiU1MvUmt2Z004Z3FnVExuOXpCRFJ6RHBoUk1ENzRneHJ6MU9w?=
 =?utf-8?B?RVF0djJObWQydkhUaDNwdUx1QURHZzU2VE9xSUFhTDZaYy9aajF6WnE1QUFa?=
 =?utf-8?B?TXZYUm9pZWdyaUkzTVQ3ZHhGRHQ1aVRKSHVvVEYxVGR2MWxmdTZWRFhsSFM5?=
 =?utf-8?B?aWxMeEQ0Qm9RcElQazI2d095OGxnTVc5czdrb3o4S1d0VytScVlZNzc5dXkw?=
 =?utf-8?B?RjJHZVNnU21aR0dQYmQ0QndMQVpDQWV3NTh0bUhpS1k5bjFsbkFHeHp2c3kr?=
 =?utf-8?B?ZnM2d29OeGQ1UkhFam9za0VSdHlPdGowY2Y2ZnRiaEIxMjFrZExocmhUaUwy?=
 =?utf-8?B?RUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 964027d0-6f64-482c-f7a5-08dc1805ef34
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB6889.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2024 09:14:55.2078 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rQsDTkYogt8BKOYDfnzSdNWLQWSTJyzRFigao6u/vaEL1vJQGynSUHDlXJa+2S0ZXGeDnZWsN2MBe4SLJECalg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4656
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

Hello Bhanu,

On 1/18/2024 2:40 PM, Modem, Bhanuprakash wrote:
>
> On 17-01-2024 02:44 pm, Joshi, Kunal1 wrote:
>> Hello Swati and Bhanu,
>>
>> On 1/17/2024 2:25 PM, Sharma, Swati2 wrote:
>>> Hi Kunal,
>>>
>>> On 17-Jan-24 11:14 AM, Joshi, Kunal1 wrote:
>>>> Hello Swati,
>>>>
>>>> On 1/16/2024 5:33 PM, Sharma, Swati2 wrote:
>>>>> Hi Kunal,
>>>>>
>>>>> On 16-Jan-24 5:29 PM, Joshi, Kunal1 wrote:
>>>>>> Hello Swati,
>>>>>>
>>>>>> On 1/16/2024 4:34 PM, Sharma, Swati2 wrote:
>>>>>>> Hi Kunal,
>>>>>>>
>>>>>>> On 15-Jan-24 4:28 PM, Kunal Joshi wrote:
>>>>>>>> add support to choose big joiner mode with environment
>>>>>>>> variable, use mode with highest clock if no mode with big joiner
>>>>>>>> found.
>>>>>>>>
>>>>>>>> v2: reuse bigjoiner_mode_found (Bhanu)
>>>>>>>> v3: avoid returning from multiple places (Bhanu)
>>>>>>>>      avoid frequent debugfs reads (Bhanu)
>>>>>>>>
>>>>>>>> Cc: Karthik B S <karthik.b.s@intel.com>
>>>>>>>> Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
>>>>>>>> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
>>>>>>>> ---
>>>>>>>>   lib/igt_kms.c | 24 +++++++++++++++++++-----
>>>>>>>>   1 file changed, 19 insertions(+), 5 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
>>>>>>>> index cb6d57c2d..2c4210d4b 100644
>>>>>>>> --- a/lib/igt_kms.c
>>>>>>>> +++ b/lib/igt_kms.c
>>>>>>>> @@ -1771,8 +1771,9 @@ void 
>>>>>>>> igt_sort_connector_modes(drmModeConnector *connector,
>>>>>>>>   bool kmstest_get_connector_default_mode(int drm_fd, 
>>>>>>>> drmModeConnector *connector,
>>>>>>>>                       drmModeModeInfo *mode)
>>>>>>>>   {
>>>>>>>> +    bool found;
>>>>>>>>       char *env;
>>>>>>>> -    int i;
>>>>>>>> +    int i, max_dotclock;
>>>>>>>>         if (!connector->count_modes) {
>>>>>>>>           igt_warn("no modes for connector %d\n",
>>>>>>>> @@ -1781,21 +1782,34 @@ bool 
>>>>>>>> kmstest_get_connector_default_mode(int drm_fd, drmModeConnector 
>>>>>>>> *connector,
>>>>>>>>       }
>>>>>>>>         env = getenv("IGT_KMS_RESOLUTION");
>>>>>>>> +    max_dotclock = igt_get_max_dotclock(drm_fd);
>>>>>>>>       if (env) {
>>>>>>>>           /*
>>>>>>>> -         * Only (0 or 1) and (lowest or highest) are allowed.
>>>>>>>> +         * Only (0 or 1 or 2) and (lowest or highest or 
>>>>>>>> joiner) are allowed.
>>>>>>>>            *
>>>>>>>>            * 0/lowest: Choose connector mode with lowest 
>>>>>>>> possible resolution.
>>>>>>>>            * 1/highest: Choose connector mode with highest 
>>>>>>>> possible resolution.
>>>>>>>> +         * 2/joiner: Choose connector mode with bigjoiner 
>>>>>>>> support or with
>>>>>>>> +                 highest clock if can't support big joiner
>>>>>>>
>>>>>>> Shouldn't this be only joiner mode?
>>>>>>>
>>>>>>>
>>>>>> You mean can be named as joiner mode because same can be used for 
>>>>>> big joiner / ultra joiner?
>>>>>
>>>>> I guess this should be bigjoiner mode only. For ultra there might 
>>>>> be other restrictions which we need to look at.
>>>>>
>>>>>> or
>>>>>> We are returning the highest clock mode if no big joiner mode found?
>>>>>
>>>>> Yes, this is my query here. Why are we returning highest clock 
>>>>> mode if no big joiner mode found?
>>>>>
>>>> We can return either with highest clock or highest resolution or 
>>>> default mode,
>>>> Since we have the other two already covered used highest clock.
>>>
>>> But why we need to return something if bigjoiner mode not found?
>>> If its not found, then we won't get to know only bigjoiner mode not 
>>> found and we are falling back to default mode.
>>> @bhanu what you suggest here?
>>>
>> Consider a setup with two display's with one having mode with big 
>> joiner support and other doesn't have any mode
>> for enabling big joiner.
>>
>> In such case we expect the tests to run.
>> We can discuss on what mode to use on the display (highest_clock, 
>> highest_res, default) which doesn't support big joiner, but we need 
>> to have a mode there is
>> what i understand.
>
> IMHO, We should fall back to default mode if there is no bigjoiner 
> supported mode available.
>
> As per my understanding, Pick the mode that exercises the max 
> bandwidth if there is no bigjoiner mode available is the expectation 
> from Kunal.
>
> - Bhanu
Will select default_mode in case of no big joiner mode found.
Will have separate parameter for the bandwidth.

>
>
>>>>>>>>            */
>>>>>>>> -        if (!strcmp(env, "highest") || !strcmp(env, "1"))
>>>>>>>> +        if (!strcmp(env, "joiner") || !strcmp(env, "2"))
>>>>>>>> +            found = bigjoiner_mode_found(drm_fd, connector,
>>>>>>>> + sort_drm_modes_by_clk_dsc,mode,
>>>>>>>> +                             max_dotclock) ||
>>>>>>>> +                bigjoiner_mode_found(drm_fd, connector,
>>>>>>>> + sort_drm_modes_by_res_dsc, mode,
>>>>>>>> +                             max_dotclock) ||
>>>>>>>> +                bigjoiner_mode_found(drm_fd, connector,
>>>>>>>> + sort_drm_modes_by_clk_dsc, mode,
>>>>>>>> +                             max_dotclock);
>>>>>>>> +        else if (!strcmp(env, "highest") || !strcmp(env, "1"))
>>>>>>>>               igt_sort_connector_modes(connector, 
>>>>>>>> sort_drm_modes_by_res_dsc);
>>>>>>>>           else if (!strcmp(env, "lowest") || !strcmp(env, "0"))
>>>>>>>>               igt_sort_connector_modes(connector, 
>>>>>>>> sort_drm_modes_by_res_asc);
>>>>>>>>           else
>>>>>>>>               goto default_mode;
>>>>>>>> -
>>>>>>>> -        *mode = connector->modes[0];
>>>>>>>> +        if (!found)
>>>>>>>> +            *mode = connector->modes[0];
>>>>>>>>           return true;
>>>>>>>>       }
>> Thanks and Regards
>> Kunal Joshi
