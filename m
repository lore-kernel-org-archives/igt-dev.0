Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B257AC46CD2
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jan 2024 15:36:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 077F910F8ED;
	Tue, 30 Jan 2024 15:36:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70ECA10F160
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jan 2024 15:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706629007; x=1738165007;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Vw/i17k7PLijRQMr2jkgmhvacIRe30gtZS/GpOYLcmw=;
 b=V1Vuk95XaGiU/Em6jFt9jTnOnLX0yPN9o+An141ySvHIvqh96z4jiFsp
 6FlU1SkriZk4PYsBzz3qRUjgi0TOKu7ny/8KZHtsq7MpOCCY3Z730UZOH
 YZ47zOdE/RCPf9UsgUB3SP1K07Y3VkG5YhaHbF3druJnzDxvnYnVAR1A/
 NjELlbWsrnXTBrYbNLx60Oal/4Zdkl1gAgtquTL1mMzGNPS4dfpiafCPE
 fLoGFd06RzwyeUJGWCFFJqXRLtHHMVzLW+/c1Q1LGKqr2caCvHiUs5cTq
 KA3On4MbCtBspFAt7JukTf/FYPYsdGUyreA49NamIrQtLENrG+6dKftid Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="9957977"
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; 
   d="scan'208";a="9957977"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2024 07:36:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; 
   d="scan'208";a="3711183"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Jan 2024 07:36:47 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 30 Jan 2024 07:36:46 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 30 Jan 2024 07:36:46 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 30 Jan 2024 07:36:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B695PMq2JIazfze6CVQ+ZZUW3sd6bAZpTkLXGoQxfs2Abja9hbkFWK0G+2t3rWi4sHD+gSvTZN+Nbg3PVOxfVy6+m+BTfcXQbwNKoafkNC/83nE9D2GqtKvSLYaRgq9gc1g2AmsKLJBc5SSD8Yir7oe15H/g0avbq8WHuzaLMDu49XTzeS5gIdMks+evjUIxjfxT6fxw6Ytf9fbycZOoM86hMs0rJPl2IOFbq/asnDsR9/PL8KDu5WZup4SowP7lwmOxz5ApM1H1d3vN5o7ORtJoMbhy5r1d68JOeW7KHuYVXLnQFkyI58vIbvOvpPdKvQPSt/+pMvm1UnspKPnDcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TlXclhMi78f02BGS0w7yWqGUKqDBEK4A9UcTGjeIRCQ=;
 b=akiGhn2FTSuSKu+bT77NCIFMZ07KQbz6wxzDuF+MRGhxRUYNREEECv54XmLkTodabw4wLHGIRkMyk92umC+f5MIzeWsXT2jMtBhV3OwTPDPgKxc6GMI7fBia5IELPH593cxTjLeG7G+/kOZkQ1GLLYm2cCknn5RALk1mRnH5jYc3HWRC4ry6OQg3jKByQwHwD85tWgednHijfSZew8vQ8I5pPRoL3NQTuahrNRMhwe5ZncM4Zv13SHW0OJaiCNfVrNE0BRlkIAb7oTb62z8z1CBFQmEwYX7ieRl3P0gl9C/FNmk3CJ805szPNzKIBzbCwagVyL8RvACWBTp5Fc7cEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5719.namprd11.prod.outlook.com (2603:10b6:8:10::6) by
 CH3PR11MB8344.namprd11.prod.outlook.com (2603:10b6:610:17f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34; Tue, 30 Jan
 2024 15:36:44 +0000
Received: from DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::ef1e:146:d198:adbb]) by DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::ef1e:146:d198:adbb%3]) with mapi id 15.20.7249.017; Tue, 30 Jan 2024
 15:36:44 +0000
Message-ID: <e7e734d4-9ef0-4a44-9e01-7a8bf60c7188@intel.com>
Date: Tue, 30 Jan 2024 21:06:28 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t V2] lib/igt_draw: Fix the usage of FB width & height
To: "B, Jeevan" <jeevan.b@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
References: <20240130113727.721365-1-bhanuprakash.modem@intel.com>
 <DM4PR11MB6312FA1F866732BC8436A42C907D2@DM4PR11MB6312.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <DM4PR11MB6312FA1F866732BC8436A42C907D2@DM4PR11MB6312.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0077.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::18) To DM8PR11MB5719.namprd11.prod.outlook.com
 (2603:10b6:8:10::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5719:EE_|CH3PR11MB8344:EE_
X-MS-Office365-Filtering-Correlation-Id: af985205-d076-4466-b245-08dc21a94325
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QkfktUqncguYCk4HFDXiOc2Mk6enw4uwOHHa6gbqMrfeEJ2PTVyvGF42D2jRg2ClxB8102UZ0RxtG05BqzBHqt55zhLHTZ8MmURk0ZxLBaIzAvhhxgFYDWSE79e8fDmTFS2nQtgbV3EVx/+HcfGgDqTVIBMmDFgl4e3D6iV5iQGBbBk4BUwhFS6vqpGLa+M/LiCzLrONRSFy9RoX/Ji1jJ9+Fzs63N2g33IcNyxE4ttbH02XZ7xu0T0nwAOEN1KS+yt9qdLsnwm/Ph72EAp2fra2U6by80S5jUR62r5+xdJ9xHerIhlSvWXI77mmulhcz5yDLrepcGRa4sp1jtUTDd+k/3Yzgm+Dbj3h1ZhA5ZT/V8jEb5OVvKXRiLa80gAgfebCaa4eVUMqsv5FTy4y/WSnUdFGmRc0EU3Ml6g6CppOzm7wqXm6jfCG3kCoUiHhsnYWZmdsKjIGvBVwtJjCMHae+IBQqxSkZYImzadlmNjZFNgHuTJZwfMjIf/AfXeAvN20GEpUZftN/AWjLR+M0qQcHnfj9e7V/KLWPnHd8mmthIYjh2T4dBjSnuNoiXGNklPGFivYA3wfz3ET6WKMqdlWhLm/xYCjhPZd2z7RydVYHOA+Qfa7qc9jjo5tra1lgVQa2/C04CKLx0nIB2gu9w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5719.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(136003)(396003)(376002)(39860400002)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(31686004)(53546011)(6512007)(6506007)(66574015)(26005)(83380400001)(6666004)(36756003)(8936002)(86362001)(31696002)(82960400001)(41300700001)(478600001)(66946007)(5660300002)(4326008)(8676002)(38100700002)(6486002)(110136005)(66476007)(316002)(2906002)(66556008)(2616005)(966005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YWZtd2EvSnN6cVZ0cHJMbVpBT01JbjVzU29sV2hhR0xEeTVYT2QvSkZ2ZDhI?=
 =?utf-8?B?RnJJRXE5SEpwYUx4dkJQTWFNVjh1TGZ4bE91Z3RhVEZNTWR2YUdhZkN2Z2R1?=
 =?utf-8?B?eXN1OGV2SUxhSGIvSlRyL0VzRWZ2NTJJa0ZiV0JpWXY0ZGIybDlvcjc3RFRL?=
 =?utf-8?B?QXhqNk1zeHpBaXA5TnVUZTMweGNHL1ZURmh6TXJleThucWIvQ0JQdVNGZmsv?=
 =?utf-8?B?SXF4a3VvREgyUEdOUE9ha0c2c21iRGpkM2xGUktxZFVJTTg1S1oxbWxOVmx1?=
 =?utf-8?B?akNLWmhPYkVlWjZndHExU1podFczTjJqZUs4eklVKzJnWnNBTDNYcytmMjJp?=
 =?utf-8?B?dG5ZTldndjBlb0N0QjBZc1ljamVqRVBDR1FCQkJGNTFJdVhwdlRBUVExZ3hI?=
 =?utf-8?B?b0hjVFhaK0RXNFE5VEY2d3puUmZoTnkxeTZMWmdkSXh3b1Z0b0ZUcUpwUkgr?=
 =?utf-8?B?YUtzV3c1b2I3ZWRpYXFOR0xITENwRHRPSm4zVU0wekZDZWdZYTROUTYzWVdo?=
 =?utf-8?B?UC9kR1drMGFOVDZUWnVjMXNhcnZtNkdUSUl5RzVmWGVGd1llME5yL0QwWWhE?=
 =?utf-8?B?R0UwU2ZOanJiam1zZWlWbXRyTjY1cXRJR0FrRnhmNDlLZlBGYUE0NnF6cHpO?=
 =?utf-8?B?MFdMdk8xOWUzdzR1Y0wwbmp5SVFoVUxLblFlTkZjL2NiUmRkRDZRWDZpTUFw?=
 =?utf-8?B?ZEhaa0c3aWg4UWk5R3NRai9wNGpCMjVRM01icmxYQkltWDJEWUpzTlFRUlFz?=
 =?utf-8?B?TjZVbE1XTXdFdE5FdDFhKzlpYW94UFZwVDZLNEJFRXJZb1dpN09FRzY1bWpY?=
 =?utf-8?B?NTZtNkJKV05NOEZJZWMrU3d5UitvUlI5U3ZpL3pTSUVmUWV1Z1RYUmowNHM1?=
 =?utf-8?B?M3ZjY29KbGZCbXl1WnpnWG4wWkZrQ3NBZEVQQ1V5QXJoSllYODZnRUQyTU0v?=
 =?utf-8?B?K3dTTG5jVktZZGk3ZjMvZEVMbTlvUWduL3JYQ0NqZG5lUnJqaEhSeFFya0FX?=
 =?utf-8?B?ZTdKRlF3QzMwNU5jaTRqS2FYOHNPRjlJaHBXOGxNM2pGOVp5S0JjMGhXcTAw?=
 =?utf-8?B?SjBEVjlmWkpXR2VNM0ZkK2F5bG84aXRXaUpYMXhTU0JPMklWSkhYaWI1VE9X?=
 =?utf-8?B?OGtBSVJxckdzbi9zVVFQNGxoM3ZHMFdWZ3VDQTV4cXRyV3Y4ZUUvQ0Qxc21K?=
 =?utf-8?B?QVJ6bzRKdVkrMEpmRFc4UUE2d1FGN1V1QlRNYWpIU0c5Z0pwNDJWVDRiUEpp?=
 =?utf-8?B?SGhmTHJ4c2J1a2xQa2djV2JjUkJ1SlBHYWplSVhOd1hzUDY3RjdvaTB2Y1Fl?=
 =?utf-8?B?cEY5VlRrck5YTDVoVTcvL09kRDI0TWhZMVN0OGo0NmhlcUhNaEFWek5YaUsy?=
 =?utf-8?B?Z3YwV0QrbmdpR0h4ZHlkeHFheC9wb1g4bmFBSkZQVFNXYUV5WWF5ZHFDNFdu?=
 =?utf-8?B?TzVuUE1VckQ1YXoxRkRUeWpHd1VaUGloUVlIQlY0dUtoYjVjQjlVMDh5SFYx?=
 =?utf-8?B?Sk9zVHZacEpPcUZiOEY1Z01VUjdUVlRpcmZxM09FSW1VeTRnWXlXcjJwcUJv?=
 =?utf-8?B?dEhDb0tSd2M1NnFkRldCK1JmTTVqajdhSGxsWkRYRkdJTC9YdTRPSmN0cmpD?=
 =?utf-8?B?ZTExcVhEMjJIVzY4THc3ZEZxYk1xUWI1dFpNRXVUUk8wSjFwTEVOS2dHWW9j?=
 =?utf-8?B?THNxejQvbG9CRGREK3pqTzBTci8wUStuSVVlVDBHZHViYXhFZkJFZ2tkTXQ3?=
 =?utf-8?B?K1BLRGYxendrMHlJYUJvMEFkWWJ0RjRBWkNQaHhyS2JScmlQUkZhYnBSOTJP?=
 =?utf-8?B?YUdiNWU4Y1daa29URnFrWlBaSkJ5VkNQc2tVMFRuRElyZ1hkTWhrUlN2cWdL?=
 =?utf-8?B?R0wzdHI3QXRFeEloL2RvcHZhNzlIYzZEbjY4SDVnZk9jdVFZcDZEdHY5Z1U5?=
 =?utf-8?B?MlRNMFdKTUpmQ1FMQUx6QlU5aVZ4SUxveWU5Z3hmemFvbDB0REtYNEkvdlYz?=
 =?utf-8?B?ekZlMXRuNldDclQ1NG42bGkxMDZnZURMRjN5b1picXV6NHZuTnlDNU5aKzJV?=
 =?utf-8?B?VFNYdVpuUWRTRVh1TXA3dzR0M0lXc2w2alo5QWE4TUlEN0Z6akJwdmxnVTBS?=
 =?utf-8?B?OEpPdXkyaTRiTTB5akdSanBwT2R0SGZPOGxwcmx3UjJWUlpkT0drN0RSRHBj?=
 =?utf-8?B?dlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: af985205-d076-4466-b245-08dc21a94325
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2024 15:36:44.0423 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0ONrkYVQXl9eSBRPVc3pT6nZEVPnTtPsnqSGxxKB6BISB5NsE6rEAmaBfDk2mYeuLjuz8Cwi/WRK+nWjJOIBcWILOoenDuihowNXCOld6Mg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8344
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
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Hi Jeevan,

On 30-01-2024 08:51 pm, B, Jeevan wrote:
>> -----Original Message-----
>> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
>> Bhanuprakash Modem
>> Sent: Tuesday, January 30, 2024 5:07 PM
>> To: igt-dev@lists.freedesktop.org
>> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
>> Subject: [i-g-t V2] lib/igt_draw: Fix the usage of FB width & height
>>
>> Aliging to xe default alignment is causing the mismatch in derived height from
>> framebuffer size (height = size/ stride). Instead use the original width & height
>> from the created fb.
>>
>> V2: - Fix issues in CI
>>
>> Fixes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/608
>> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
>> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
>> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
>> ---
>>   lib/igt_draw.c                         | 16 +++++++++++++---
>>   lib/igt_draw.h                         |  1 +
>>   tests/intel/kms_big_fb.c               |  7 +++----
>>   tests/intel/kms_frontbuffer_tracking.c |  1 +
>>   4 files changed, 18 insertions(+), 7 deletions(-)
>>
>> diff --git a/lib/igt_draw.c b/lib/igt_draw.c index 637b9ba76..0757e9801 100644
>> --- a/lib/igt_draw.c
>> +++ b/lib/igt_draw.c
>> @@ -75,6 +75,8 @@ struct buf_data {
>>   	uint32_t handle;
>>   	uint32_t size;
>>   	uint32_t stride;
>> +	int width;
>> +	int height;
>>   	int bpp;
>>   	uint8_t pat_index;
>>   };
>> @@ -648,8 +650,8 @@ static struct intel_buf *create_buf(int fd, struct buf_ops
>> *bops,
>>   	uint64_t region = driver == INTEL_DRIVER_XE ? vram_if_possible(fd, 0) : -
>> 1;
>>   	uint64_t size = from->size;
>>
>> -	width = from->stride / (from->bpp / 8);
>> -	height = from->size / from->stride;
>> +	width = from->width;
>> +	height = from->height;
>>   	if (driver == INTEL_DRIVER_XE)
>>   		size = ALIGN(size, xe_get_default_alignment(fd));
>>
>> @@ -686,7 +688,7 @@ static void draw_rect_blt(int fd, struct cmd_data
>> *cmd_data,
>>   	intel_bb_add_intel_buf(ibb, dst, true);
>>
>>   	if (HAS_4TILE(intel_get_drm_devid(fd))) {
>> -		int buf_height = buf->size / buf->stride;
>> +		int buf_height = buf->height;
>>
>>   		switch (buf->bpp) {
>>   		case 8:
>> @@ -807,6 +809,8 @@ static void draw_rect_render(int fd, struct cmd_data
>> *cmd_data,
>>
>>   	tmp.stride = rect->w * pixel_size;
>>   	tmp.bpp = buf->bpp;
>> +	tmp.width = rect->w;
>> +	tmp.height = rect->h;
> 
> Is this required ? I think these are not required.
> Please correct me if I am wrong.

This is required, otherwise create_buf() [*] may fail due to the garbage 
values of width & height.

[*]: https://cgit.freedesktop.org/drm/igt-gpu-tools/tree/lib/igt_draw.c#n817

- Bhanu

> 
>>   	if (is_i915_device(fd))
>>   		draw_rect_mmap_cpu(fd, &tmp, &(struct rect){0, 0, rect->w,
>> rect->h},
>>   				   I915_TILING_NONE,
>> I915_BIT_6_SWIZZLE_NONE, color); @@ -834,6 +838,8 @@ static void
>> draw_rect_render(int fd, struct cmd_data *cmd_data,
>>    * @buf_handle: the handle of the buffer where you're going to draw to
>>    * @buf_size: the size of the buffer
>>    * @buf_stride: the stride of the buffer
>> + * @buf_width: the width of the buffer
>> + * @buf_height: the height of the buffer
>>    * @tiling: the tiling of the buffer
>>    * @method: method you're going to use to write to the buffer
>>    * @rect_x: horizontal position on the buffer where your rectangle starts @@ -
>> 848,6 +854,7 @@ static void draw_rect_render(int fd, struct cmd_data
>> *cmd_data,
>>    */
>>   void igt_draw_rect(int fd, struct buf_ops *bops, uint32_t ctx,
>>   		   uint32_t buf_handle, uint32_t buf_size, uint32_t buf_stride,
>> +		   int buf_width, int buf_height,
>>   		   uint32_t tiling, enum igt_draw_method method,
>>   		   int rect_x, int rect_y, int rect_w, int rect_h,
>>   		   uint32_t color, int bpp)
>> @@ -862,6 +869,8 @@ void igt_draw_rect(int fd, struct buf_ops *bops, uint32_t
>> ctx,
>>   		.handle = buf_handle,
>>   		.size = buf_size,
>>   		.stride = buf_stride,
>> +		.width = buf_width,
>> +		.height = buf_height,
>>   		.bpp = bpp,
>>   		.pat_index = intel_get_pat_idx_uc(fd),
>>   	};
>> @@ -925,6 +934,7 @@ void igt_draw_rect_fb(int fd, struct buf_ops *bops,
>>   		      int rect_w, int rect_h, uint32_t color)  {
>>   	igt_draw_rect(fd, bops, ctx, fb->gem_handle, fb->size, fb->strides[0],
>> +		      fb->width, fb->height,
>>   		      igt_fb_mod_to_tiling(fb->modifier), method,
>>   		      rect_x, rect_y, rect_w, rect_h, color,
>>   		      igt_drm_format_to_bpp(fb->drm_format));
>> diff --git a/lib/igt_draw.h b/lib/igt_draw.h index fe7531b79..1dec95e86 100644
>> --- a/lib/igt_draw.h
>> +++ b/lib/igt_draw.h
>> @@ -54,6 +54,7 @@ bool igt_draw_supports_method(int fd, enum
>> igt_draw_method method);
>>
>>   void igt_draw_rect(int fd, struct buf_ops *bops, uint32_t ctx,
>>   		   uint32_t buf_handle, uint32_t buf_size, uint32_t buf_stride,
>> +		   int buf_width, int buf_height,
>>   		   uint32_t tiling, enum igt_draw_method method,
>>   		   int rect_x, int rect_y, int rect_w, int rect_h,
>>   		   uint32_t color, int bpp);
>> diff --git a/tests/intel/kms_big_fb.c b/tests/intel/kms_big_fb.c index
>> 3eb43515a..0bd79394b 100644
>> --- a/tests/intel/kms_big_fb.c
>> +++ b/tests/intel/kms_big_fb.c
>> @@ -189,18 +189,17 @@ static struct intel_buf *init_buf(data_t *data,  {
>>   	struct intel_buf *buf;
>>   	enum intel_driver driver = buf_ops_get_driver(data->bops);
>> -	uint32_t name, handle, tiling, stride, width, height, bpp, size;
>> +	uint32_t name, handle, tiling, width, height, bpp, size;
>>   	uint64_t region = driver == INTEL_DRIVER_XE ?
>>   				vram_if_possible(data->drm_fd, 0) : -1;
>>
>>   	igt_assert_eq(fb->offsets[0], 0);
>>
>>   	tiling = igt_fb_mod_to_tiling(fb->modifier);
>> -	stride = fb->strides[0];
>>   	bpp = fb->plane_bpp[0];
>>   	size = fb->size;
>> -	width = stride / (bpp / 8);
>> -	height = size / stride;
>> +	width = fb->width;
>> +	height = fb->height;
>>
>>   	name = gem_flink(data->drm_fd, fb->gem_handle);
>>   	handle = gem_open(data->drm_fd, name); diff --git
>> a/tests/intel/kms_frontbuffer_tracking.c
>> b/tests/intel/kms_frontbuffer_tracking.c
>> index 2a2690d18..912cca3f8 100644
>> --- a/tests/intel/kms_frontbuffer_tracking.c
>> +++ b/tests/intel/kms_frontbuffer_tracking.c
>> @@ -2242,6 +2242,7 @@ static void *busy_thread_func(void *data)
>>   	while (!busy_thread.stop)
>>   		igt_draw_rect(drm.fd, drm.bops, 0, busy_thread.handle,
>>   			      busy_thread.size, busy_thread.stride,
>> +			      busy_thread.width, busy_thread.height,
>>   			      busy_thread.tiling, IGT_DRAW_BLT, 0, 0,
>>   			      busy_thread.width, busy_thread.height,
>>   			      busy_thread.color, busy_thread.bpp);
>> --
>> 2.43.0
> 
