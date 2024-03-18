Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09BA5C54E5D
	for <igt-dev@archiver.kernel.org>; Mon, 18 Mar 2024 05:39:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABDE110EED6;
	Mon, 18 Mar 2024 05:39:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ehb8gfkI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50BA410EED6
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Mar 2024 05:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710740344; x=1742276344;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yqubvb5j1q9UY3tUEi3b3wFxoEvaZ4hr0oSeTvP8YFY=;
 b=Ehb8gfkI1zsUUJ+OqtvOmO3/G48jO98AvLhoVDZUXahxWV+FA8H/MC+f
 LZgn8HOI7a5fgeOG+xaSsNdAKBKifeWVJhvS2AoZSBWdGNifWQV3GzJ1L
 CWJLDiD1Yw+tqkSdoC6SREnVjBXQ7dvrSqf7PLJEklTz0wm0K6pP2q6Fq
 Ur46oywmwKaXBFokcqMnbwPtqgwHBUYBb/MMh0Eio9iEU8tlaDQ3NaFKI
 JnD7pU5Raw1g3mkfX0QlACAVrAnSPPG/ybDc6Y8vuNP0qu4+l90oK9tPs
 +xnCqLKmmK0+4NikLT5r7jujgJNrUOMzV9+WnpnKOv9y1MtbWVfrrv7W+ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11016"; a="28014882"
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; d="scan'208";a="28014882"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2024 22:39:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; d="scan'208";a="17842060"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Mar 2024 22:39:03 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 17 Mar 2024 22:39:02 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 17 Mar 2024 22:39:02 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 17 Mar 2024 22:39:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vy3vaUwZ5gPfKCPARYE26LAAPTMKb3qj4HzBnmnLETKHg5BvqB0JFLOesL0CBDLys57Qpj6RQW1vdwYxNgHJQnOrYSySUZFyC1P9wk+CFknfcVm5QuFTj32RbIXP4lsSza5cYpLPSv9qlQeZ0BIyjXDOWc4tiKNfkl+Hz/XcPLkt9a+4szpyAdieSvES7Q5EKK7IWzDcxq2Ppcmb2AxVBB0FuZhy48nRa9TrfiLObFUsKsQdL5/zo0BVJWZDxXgphzisGl1wyGO+Hsqn2LI3mhVtPWjzrohfazWLNnrRaRdpnMabNPWE42HBNnkDE/QneOUdqBgLCNvf22Lwi0hMOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gfng5nYpIsAWhKZJCXw/au2WfsBQ+m7nTypvKURb76E=;
 b=kZLKJuhJXprE+4Wyj0xBPZkvpzuuTRrVNKQjlPTIcWpeL1Ojx/+Qd30Gyfi0tvTor6c0PWTblfzo+ceGGrX3EAAKAaSLZ3M0CDJ/Vm21s5WLO+sVc8dlw1x6b0zC5n4WSHJbrVMJUjNlfg/v2DR1aDitOJ6TKmrLKC3qJ89XAOAWPH1hIShpc8+eAs4VJZ66ZHaabl9HqIWWLpmQIfv27KcY8o17XKpeaH6jGOBN5nemlzdr9NXZqJwBssdpnlcnEwo4aefuXPqaIaYIfBulOhkNM75n0lQhJokYYAvnhl4i8mBGyiEo/bxgP57jVey3CHeuIKseG4boZ+wErTsDjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB6889.namprd11.prod.outlook.com (2603:10b6:930:5e::9)
 by CY8PR11MB7060.namprd11.prod.outlook.com (2603:10b6:930:50::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.11; Mon, 18 Mar
 2024 05:39:00 +0000
Received: from CY8PR11MB6889.namprd11.prod.outlook.com
 ([fe80::c4f4:e3f2:80a1:51e6]) by CY8PR11MB6889.namprd11.prod.outlook.com
 ([fe80::c4f4:e3f2:80a1:51e6%4]) with mapi id 15.20.7409.010; Mon, 18 Mar 2024
 05:39:00 +0000
Message-ID: <6636e3b2-5cc6-421c-99de-3ae4de91d699@intel.com>
Date: Mon, 18 Mar 2024 11:08:53 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/4] lib/igt_kms: move bigjoiner_mode_found to lib
Content-Language: en-US
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>, Karthik B S
 <karthik.b.s@intel.com>, Bhanuprakash Modem <bhanuprakash.modem@intel.com>
References: <20240310142721.874315-1-kunal1.joshi@intel.com>
 <20240310142721.874315-2-kunal1.joshi@intel.com>
 <0507ad7b-4f1f-4c66-9109-5d6903f93634@intel.com>
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <0507ad7b-4f1f-4c66-9109-5d6903f93634@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0051.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:22::26) To CY8PR11MB6889.namprd11.prod.outlook.com
 (2603:10b6:930:5e::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB6889:EE_|CY8PR11MB7060:EE_
X-MS-Office365-Filtering-Correlation-Id: 26ab45d6-0a3f-4ea6-2ca3-08dc470db655
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KEJZCQ9DY57Gew0tGhUxlIQNbfKtb60Ztrxi5fpZkKtmMl3YvFjF0LRXXF2ivwYk16uJ4SLywfP8LcD2M015Z8uKW7HJOxaqou8SJye35V+/KzGI5n3JuOcojoAqmHmEyYzE7JDqOQ2sKxGFFLFA7Fn17YSKnadVv7FODSG1IY66/RyRlpabjiZnsatGWnGSQzhXqxHGFCE+hTzLtcVQh/cgLly6jmap4cyor/8kjJVZJ9vtj7iAAkKc5f43aYCpT9BTwPVdAe7tDF2xRwWsH/ULAIfpTdjaHrqR4g+BD0lunedtZRGNIkWAs12hiMvEvL/tm4HK/hn/KBdq8SskS6xb7tobTkNyWultOS/24LComQcKT1MAoHzRSUN1G6V/QGqXhV1QCSka5HzcZrYNJoz1xG8sxVSjJHOMiVJdeAeQSFSTRI1o1omAUdt62DFRSgjRC4PEN7JMa4hEUV2G9esfBKCs0dvnhNemdiKTgxigpzZwARFJjDJrjpfxvVdcw3/atn5qU7VYVW0rwNW8Rf15UMdgsAMJ4lX6U3FgiuN7NWwbAI+m8aVp0DYcKn5q8ftG+8zPwey+KrAT3DiAtYBiv+Tw6yT3/y5/Y7rQz+zRU5V6Dq6plQbnDYTWPYVX8pL05cislL42oHRevjwmXTSkutnuDLBw7mH0gyc2JTQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB6889.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UWNBSGNsQm5DYStxcW1kUTlZaytLVzBzcHBxL3NSQ0k0cFhHL2NBOFJJUUgr?=
 =?utf-8?B?SXJpcVRZSkVORDd6TlNaTmxVVUo1dnMvY2lvZzU2Z3ltS1pMM2VaMkZ2Rkd6?=
 =?utf-8?B?am9kU0RMTnlzOXpjbkh1V0xURCs5T2V6ZWhNN2ZIS1R3NE5QTHN0Q2pqNFl3?=
 =?utf-8?B?VURNZWo2ZnNoQlRMRzdnVVRBNi9KeEdRSkdzVkFtRllxNGM1djVvaUY4ZDBE?=
 =?utf-8?B?NFpqZTJyb0k2Zkd1d0hYRzRGc1VtUm51TkJoNHg2MStJWCtyQ2h4c2FQNVhV?=
 =?utf-8?B?S25DdHFDUm54cjhPWjdJWmdoZlJHM0QxbEo2NlRpby92bUFpS1lpMXppOVBy?=
 =?utf-8?B?eEFJSUVCbzhjRzVyOW43SmpPV3pZNDYvZGJjMmpyMUdFdmpjN0UxT0wyQlNR?=
 =?utf-8?B?bVBTNkora096Wi9HYlBDb1lDNkR6bjNibGMrYzNubENScFdSSVYzNTYzM0lQ?=
 =?utf-8?B?VWRKMk5yUGpabURlYkdwWGVEK0U5Qjd1VmZNa3lEa3lKbG9zeUZWNFIwYjV2?=
 =?utf-8?B?cGtOeTVVdmhnemFWMTNmaXI1M1BuTksyU0tFenN2VDJWejEzZ205dk00YmFL?=
 =?utf-8?B?eEczaXBLWVNvVHRkd1R3YTJiU2djV1BwTlBmY2psdExyMncyRmhMZ1prN1JC?=
 =?utf-8?B?d1pPMlFzcElTd1IrUXFMdGF5aEw0Wk1iU2l0aWFSZ3lzblVBa0FFUmhQRHVG?=
 =?utf-8?B?SW9FUndjVm50ampoSGRhUGRmeGttNHBzWXo0ZlVxdjIrSFh5N3NyTEVoV3cr?=
 =?utf-8?B?aFNyUG5YZEFYMWs0UERyVlREWnd4dmZVTDNHM0lQZVFpazdTdjFvUTNJNGVQ?=
 =?utf-8?B?RXl5R0dadjZRVHV5YXpCMDBLM3B0ekVCRU5rK05NS0FVeDhGNGFIMGhGUnpl?=
 =?utf-8?B?czBpYXNObGIraThsQ0FuRWExNjYyY2RCVXg5ZXljVW9pZE9KZ01naFlYOEI4?=
 =?utf-8?B?TTZTWlpOWHYvTW5oZ0N3QVZaVWQyU0lxbFBudlNVcGF4SWViVi9sRjdZd0lD?=
 =?utf-8?B?cTJpOGpHWXdDYzdRN1pHNnJJQ29weVI2OSs0TklxdHBPaEdzQTl0UDMxVFpG?=
 =?utf-8?B?bFBHTmNETjhTb1pncXY5dVhGYkRFZklaenNUQWx1OTlFVTFhU0hjaXZDUXJy?=
 =?utf-8?B?TFRWRjIxbHZWbytsT0VGaThWWXkxV0tjaWVsc1dMSG1YWFhSZzNvUDBEK1cy?=
 =?utf-8?B?MG9DN2tXUWdmbU5sZ1ZReXM2YVhnRkFSM2VDZFRpV0pqY09NMFBpOHVTeFJx?=
 =?utf-8?B?Z3phbnlrR0krb0lnc1pIUjBvcXNWYzJJRENBWFlkREFQTjMzNFBYV3lLS0Iw?=
 =?utf-8?B?dGxwM2lPSnp1QnZmaGgyK2F2cW1ieVBQdEkvZFQvYUR0cTh4Y3k1aTg2MTZV?=
 =?utf-8?B?VkxUTGhpOE1qbFpFZEllNjcxOC9XNG9KZk1tVkFiN2xJbGdrNFJoU3U5K2kz?=
 =?utf-8?B?eG52QlRJTnhieXYrSXlTTWdKcFQ5elh2Zkt6d0VXTmlhTngzeXFlMTg2c3R0?=
 =?utf-8?B?LzZvR2FsWi9qMWdoU1dXZlpNL25GOUhlN3pXQjFMNVBsQUxCdFFnckpNT0Vv?=
 =?utf-8?B?c3Jkd0xaY0R0T3ZvbVRjcTdrQ0ljcG03SXU2eVFKS25SbEc1aDd1OERJTVFB?=
 =?utf-8?B?UTUyU1FtekdRdDJvOE1UbnFwR2dQU0x6TmYrdWRCb1VtQUpwQU80aWZ3K3l2?=
 =?utf-8?B?REl3dE5IcmxXVEFjcnRRKzFTcXMveWdvbGozZkxYQkZlWDE2ZzdiQ3NqZW4z?=
 =?utf-8?B?VytncWt6TmltdGs0MDdGMVA4OTVucGk4NDlobS9ZUy82aTlzS3I2MUtSVlAx?=
 =?utf-8?B?VGp1WlprbnJqUkFKR24yZHVjM3VqQjkrN3JZZlUzU01sYlR3QVIxYyswQ1di?=
 =?utf-8?B?Rnh3SlEyczA4YTkrbkVFQmx2R1lBWUxMZFFnbjRZN2x3ZTgrUXhQM2Zwb1NY?=
 =?utf-8?B?bTRObXhNNEhNeEt5ZDJ3T2htOGdnVjNlWFA0Ly95Mjc0V2wyNEZlRkwyK1BG?=
 =?utf-8?B?ZlhNY1FOSFh2Z1VId0U2bFgvUG5FZ2dFWU8wWGs2M2F4d2tSRy83Z3JuZmR4?=
 =?utf-8?B?TVVDVmg1a2M5dFl0ZG9HZnc2SGQ5YUhTUG9SRzB3RUNMTnBTOTRlTGY2MWs1?=
 =?utf-8?B?V0VoS2JYY0NUSU0vL3NNTHl4NWdwV1FwV1djVU56WDZOd2Zod0llMDhaZEE2?=
 =?utf-8?B?ZWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 26ab45d6-0a3f-4ea6-2ca3-08dc470db655
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB6889.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2024 05:39:00.2095 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FGbeSwNwR5NrPQAg3IVgVYglCpfBBW04UR/4Sklna125NWyWYKH1dSmbHTc7JkIvhytZUX/8Sb5FRW2M2o2iPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7060
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

On 3/15/2024 9:40 AM, Nautiyal, Ankit K wrote:
>
> On 3/10/2024 7:57 PM, Kunal Joshi wrote:
>> move bigjoiner_mode_found to lib
>>
>> Cc: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
>> Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>> Cc: Karthik B S <karthik.b.s@intel.com>
>> Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
>> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
>> ---
>>   lib/igt_kms.c                | 25 +++++++++++++++++++++++++
>>   lib/igt_kms.h                |  2 ++
>>   tests/intel/kms_big_joiner.c | 14 +-------------
>>   3 files changed, 28 insertions(+), 13 deletions(-)
>>
>> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
>> index e18f6fe59..63c8045c7 100644
>> --- a/lib/igt_kms.c
>> +++ b/lib/igt_kms.c
>> @@ -6143,6 +6143,31 @@ bool igt_bigjoiner_possible(drmModeModeInfo 
>> *mode, int max_dotclock)
>>           mode->clock > max_dotclock);
>>   }
>>   +/**
>> + * bigjoiner_mode_found:
>> + * @connector: libdrm connector
>> + * @sort_method: comparator method
>> + * @mode: libdrm mode
>> + *
>
> This is incorrect.
>
>
>> + * Bigjoiner will come in to the picture when the
>> + * resolution > 5K or clock > max-dot-clock.
>> + *
>> + * Returns: True if big joiner found in connector modes
>> + */
>> +bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
>> +              int max_dotclock)
>> +{
>> +    bool found = false;
>> +
>> +    igt_sort_connector_modes(connector, sort_drm_modes_by_res_dsc);
>> +    found = igt_bigjoiner_possible(&connector->modes[0], max_dotclock);
>> +    if (!found) {
>> +        igt_sort_connector_modes(connector, sort_drm_modes_by_clk_dsc);
>> +        found = igt_bigjoiner_possible(&connector->modes[0], 
>> max_dotclock);
>> +    }
>> +    return found;
>> +}
>> +
>>   /**
>>    * igt_check_bigjoiner_support:
>>    * @display: a pointer to an #igt_display_t structure
>> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
>> index b3882808b..bab8487d3 100644
>> --- a/lib/igt_kms.h
>> +++ b/lib/igt_kms.h
>> @@ -1212,6 +1212,8 @@ bool igt_max_bpc_constraint(igt_display_t 
>> *display, enum pipe pipe,
>>           igt_output_t *output, int bpc);
>>   int igt_get_max_dotclock(int fd);
>>   bool igt_bigjoiner_possible(drmModeModeInfo *mode, int max_dotclock);
>> +bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
>> +              int max_dotclock);
>>   bool igt_check_bigjoiner_support(igt_display_t *display);
>>   bool igt_parse_mode_string(const char *mode_string, drmModeModeInfo 
>> *mode);
>>   bool intel_pipe_output_combo_valid(igt_display_t *display);
>> diff --git a/tests/intel/kms_big_joiner.c b/tests/intel/kms_big_joiner.c
>> index aba2adfbe..28678b958 100644
>> --- a/tests/intel/kms_big_joiner.c
>> +++ b/tests/intel/kms_big_joiner.c
>> @@ -199,16 +199,6 @@ static void test_dual_display(data_t *data)
>>       igt_display_commit2(display, COMMIT_ATOMIC);
>>   }
>>   -static bool bigjoiner_mode_found(drmModeConnector *connector,
>> -                 int (*sort_method)(const void *, const void*),
>> -                 drmModeModeInfo *mode)
>> -{
>> -    igt_sort_connector_modes(connector, sort_method);
>> -    *mode = connector->modes[0];
>> -
>> -    return igt_bigjoiner_possible(mode, max_dotclock);
>> -}
>> -
>>   igt_main
>>   {
>>       data_t data;
>> @@ -235,9 +225,7 @@ igt_main
>>                * Bigjoiner will come in to the picture when the
>>                * resolution > 5K or clock > max-dot-clock.
>>                */
>> -            found = (bigjoiner_mode_found(connector, 
>> sort_drm_modes_by_res_dsc, &mode) ||
>> -                 bigjoiner_mode_found(connector, 
>> sort_drm_modes_by_clk_dsc, &mode)) ?
>> -                    true : false;
>> +            found = bigjoiner_mode_found(data.drm_fd, connector, 
>> max_dotclock);
>
>
> How does this work? Earlier mode was filled by the 
> bigjoiner_mode_found().
Currently it works as we will have the connector modes sorted.
But as you state for better readability will have a mode parameter.
>
> Now mode is not getting filled at all.
>
> Regards,
>
> Ankit
>
>>                 if (found) {
>>                   data.output[count].output_id = output->id;
Thanks and Regards
Kunal Joshi
