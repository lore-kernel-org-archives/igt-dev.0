Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE3CCC54756
	for <igt-dev@archiver.kernel.org>; Thu, 22 May 2025 04:46:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1259395662;
	Thu, 22 May 2025 03:58:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iJ9VoFHr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE81F91EB7
 for <igt-dev@lists.freedesktop.org>; Thu, 22 May 2025 03:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747884878; x=1779420878;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=q1GD5G6nAwW/dfYKr9tFuYWYqm93/XfxywaSCg85fdc=;
 b=iJ9VoFHrV9TLxrF8m3sObEL8Jm4T4d158QtOjIGNkyqJxyl3JXSLwuus
 ozcVSDnOiMD76D4e7PcdqBR2FPAFq+Vp2NKkP3BXw2asqdCMbkbnsPNDs
 yo90hhMg0D+CGC2BAmCmRNqvr00voh9t1u6O+1CZTH402EVwJJZhlnB6M
 KGiwdgDslmFQVdRQVd8NVziPRnFs2K30kn/66JiBlfoqz5IqjaKsfR34e
 GF3mIvbzWtr2aKESwaz7ldxzI6iR+6bx0T4eFLhY8I0z5BWG8N8oCUNq1
 928s8Zrzy9cZleuDlNjimAsISKD5pqTY5iK0jsXR05wV6hjokc3gCfVU1 g==;
X-CSE-ConnectionGUID: RtU1LocFQ2qyKq4qUtGhmg==
X-CSE-MsgGUID: eXcoAWfHSa25k4ac/HAvXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="49794146"
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; d="scan'208";a="49794146"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 20:34:35 -0700
X-CSE-ConnectionGUID: EyixlcONRTmpW+ZGCEhKvQ==
X-CSE-MsgGUID: fH1MwGX3RdOEo8ivcxB6nQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; d="scan'208";a="177547464"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 20:34:34 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 21 May 2025 20:34:34 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 21 May 2025 20:34:34 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 21 May 2025 20:34:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lCX+b1jNGvqus9ESTPxvVktBhvYJeTw2FIZomodnPmiAdwXW5r6uYhjFlMXT8gxox//A4MSa+Qcld29AjHYXoebgqE4XameVtZD6GGHBEKd3DBDCvfbsqCg3TE5lcg1BhK44KR5s1uODJ9znUUtHRjfklweG2W1f70j2C3S3GGL70kKi/C+TTxA6Sw0ThoDOswkxSOU/OvuXahBvJKorOmisLLxulgtFjF3eg85ZD1hBfpOs5k0UkM6iPhxryDvm4NoKtmqVsrNBUFNARsLjkO7ec4MezqVqS63R7EIsFbs9vvNO7/auntar7MU/zKbHxkNiCfQ7aI0TgjW4Xom6WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BgUgwXYJWTxz7Qak28/YdhWeNPkrdtZYIlpTZ9ppXkI=;
 b=li1R4/DF1X0ofwuwZQ4rL3h1FnAguDoklrjzah98CnBZwCEzD/qGxlee37Ev1sDRW9W4ulPc8j2iE9HgjmnLBX1wV6DMukLsYTlEmPC2nX8SB+VI49CWexi3bzxC7U3OeU6CYJxGfgHGPk3g5/zrpRHosGXgUKF+5pSWOX7WMQgwHMeoEzn/VFdsBMBcmc5Tj04HcDL49XEgzWuJTxD7ziNJT4EcGbL0xSTqxiYioPi8McPFVS4ZRyYMkmwwqyJ5Tg8C8AfbDRUATprrkltQMswjUBxbXtaOP90Kcy04S6617JEEAL9zKICY1Fnx2I6ucf2Scil8z0o4Sk/zUnb2Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SJ0PR11MB6719.namprd11.prod.outlook.com (2603:10b6:a03:478::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Thu, 22 May
 2025 03:34:31 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%4]) with mapi id 15.20.8769.019; Thu, 22 May 2025
 03:34:31 +0000
Message-ID: <a2a6c9d7-ba95-4553-9f72-e76491ef1c5c@intel.com>
Date: Thu, 22 May 2025 09:04:23 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t,1/2] tests/i915/pm_rc6_residency: Use sysfs to achieve
 peak frequency
To: <sk.anirban@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>
References: <20250513183726.2118105-1-sk.anirban@intel.com>
 <20250513183726.2118105-2-sk.anirban@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20250513183726.2118105-2-sk.anirban@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0P287CA0003.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::20) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SJ0PR11MB6719:EE_
X-MS-Office365-Filtering-Correlation-Id: afa585c8-1b91-4d01-82bc-08dd98e18fe0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c0dyTTBCR1NlL0toWVNINVQ5bUNEeStnekJId3BjTkM4MnNmT0xjSXUxTmNt?=
 =?utf-8?B?UEhWMWI3VzBsWkxZL0xBVlhtNVovWlRFa2g4UDZvdXZNamhRYXB0V0VUSnBO?=
 =?utf-8?B?bVFEUnFKZTNSaTdIZ1BNS1ZyRERJdzBsTXJEWGl4cW1keW52c1lud29QWGt1?=
 =?utf-8?B?aGRocWRFK2FtY0ZyNGJJSk8wUVg5dzhSRTlPMlJ5SEIyS1NNK0NLV1o0b2U3?=
 =?utf-8?B?Z3g5bTRDL2gweS8yUS93SWo2aVR0QnpNcldTWkVFakgyZ0hQZVdoaTh0a1Rt?=
 =?utf-8?B?SzE3U0hBUjVuWFVIRlNtaEJ4UnF6V1ByNkw5d3V0ZWgwclV1YVBQRkQyY1Bk?=
 =?utf-8?B?NXh0K1lwRjNIVjdTbmJkZTFYUUtXOUVtbUdZWTgxUWZpUzM5VG5VRC9IV1J3?=
 =?utf-8?B?NHhYQ0VydVA1VEVMKzU0cHY1VWI5b3JlTHpGaktibTk5STBUM3hjM3A3Wm5j?=
 =?utf-8?B?UTZQVzlyTUpyK0NmT2ZtOGhIcmRlVWVXZVlEZUJQUGt3WFZ0Q0ZVd2x5WTRx?=
 =?utf-8?B?NUk1OUhGU0tnQlN5RUlST2FBTnQwV3FhdVFxd3dNNThQaG5lRFBsY2RkOHBK?=
 =?utf-8?B?SHlaWHY1Z3NNQ25WYTJBaTI1YXBOSFNhVmFaa2tIT2RQcHhYbWUwZjN4NkxL?=
 =?utf-8?B?OHVBYWpkcVNQMDFYNzlnczlraXVRenF4MDhkZ2hONjh4YURXaUljcGRFRkhy?=
 =?utf-8?B?WWZkS3p0YkVTaUN6NHNlY2JadC9lVFZsWk10TmcyZndsYks0bUVMUUhCY2lY?=
 =?utf-8?B?NndmeUo1cGFkdEhrc3IvQlZXWDI0bm9QK3pkSWRETjNmMlgvSnByaTN1eTgx?=
 =?utf-8?B?bFEzNmxSR0VMZytGSzN3TGJSc1ZoSlhDUThTRUhEU3ZmMDBFOTZ6WGlkN2g5?=
 =?utf-8?B?SExTTlVsbkF3aTJYbHVBQnZTc0laMzY4d01VVmoyeHRQV2V1anpFOTVsTW1j?=
 =?utf-8?B?SW1GOERLMUZjUVhscHV5eWhBQ2s2SHRCNFVJRytFdDVESENQMHVueVpXbnBX?=
 =?utf-8?B?ZWxYa3VrZlpzUEQvTTQvdmRXQSticUtoMU0vOFBJRzhka0gyNFFGUE9QMDNa?=
 =?utf-8?B?ZHY1d0xqdXNESnlSZE9YTXpwNTBZNm84QWNQMVlIMFNZbWRlL3dLQzQxVGVm?=
 =?utf-8?B?bHY3bEM4M2JHQUxUN0tkR0RhKzd1aXdJUjZOenhKQVlnU1c1S28vYnF6N1ha?=
 =?utf-8?B?N01sRElsVlRaaXVKWmhKMzhjcHM5QkNERWhvYkd2ME8vbG9OVW01ZHp6dG5x?=
 =?utf-8?B?REd6ZWxpTHkvWkVqbUc0N0lXazdHbGo2dFRiY2FJTnczTGkxeTA4K1NFeW94?=
 =?utf-8?B?QkVhWlVTV2lMdUowVmtDZFNYUzZmeEV1cFNIMXlsNm4yMm1yRjc2dGdJRVpr?=
 =?utf-8?B?WUFyYW1PSzdXOUVOMGJPYTBVdDlLL1FneVFHVW9KVXp0by9jNjRTM05tU2JI?=
 =?utf-8?B?SU1wNlFLNnRtSEwwZmNxS1czT0k1KzZIdkRCOUZHZmhoQnhDcnF0VTMrMXBv?=
 =?utf-8?B?ekkvc3IrYzJveURXdkJWbXU5a1l3MjhMWEFmMTlZcmVGVm95YXJDczVvZEVl?=
 =?utf-8?B?SnhvbUdqOGZIN3RQakR6L01UVXN0OENLNnZtQlRSMlo0dk81N3RXV3lmV0dT?=
 =?utf-8?B?b3g5UE1iMjVHaWdGb3gydnU3Q0FZZDMxaHRpWFh4ZTdSSXNvN0VKaldCL3VR?=
 =?utf-8?B?RVZDNktLOUtXN3F0eGFEQVdyT0lHNEpOTHZpSXJXTHA3eWRrbUNBY3NOc0E0?=
 =?utf-8?B?SC80Z0tWbjZGSWIwSVRZSGhjM1NBc3MrQloxQmU0V2NESFlsN251ektLREQ3?=
 =?utf-8?B?T0RZM1plMGlGL1V4VEtITG4vQUVRNUlhNHdUSFNkL3JQM1hyNnk3YTI1TnBx?=
 =?utf-8?B?WlJPY0ViUXBUTEc3YjIwZ2ZiZWN3cVhYVWlPd2h3OXhtTnc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?azlkN2dmUUk1L3hzTUJuMHRkTkt1WDUwWVF6c09vKzgwbGQ0SWxQK2txb0Zp?=
 =?utf-8?B?TkExTkxpaGUvbk96d2NHZzY3WElrdXRRSXBrUkJVR1lvNHBCbms5VU12K3Fu?=
 =?utf-8?B?V3ZVd2RvcTE4c0p3TEJ3WkVLa3JucjZ1NlVrVVBKT1ZjSm5jVDIyYU54a2Rk?=
 =?utf-8?B?YWhXVFV3SGdHa2p3QkxHMHM1SkVsUlhUVEpQRmlmTGtobjRaa2k1Uk04a0I3?=
 =?utf-8?B?eHpld3pNZmtrQmxXN3VXWS9KMFFLK250T25scTd1dFVIMGx5cDlzK1d1RE14?=
 =?utf-8?B?dDBDbGVJa1RFcjBuV2FwTDdUNVNrcnRSbVNqaUZDNlcxeDh3aUtORXhkTXNW?=
 =?utf-8?B?bzRDUVVxalNwNFoxUW5OeFBOTll3YXpCNVpkZU9JMVZlbkEwVmZVbWF1bm5y?=
 =?utf-8?B?NjV3SmY2cFNMdXRqNmhBQ1p0SWhjMGtRRGZ5WUtNZzM5NWFyQmRWZFJRc1ZQ?=
 =?utf-8?B?NmUrZnNBSTJPWmJ1WlZVRUlFMFBWV0M4Z3hOYjFobWRiM2gwMmxRUHkrTFNZ?=
 =?utf-8?B?RFBxNXQvWlN5RXJIeGhEVkNES0pkN0ZJY3R5UGxmRExUNFR4UTM2L2Q5RkNI?=
 =?utf-8?B?OTVoU2R4YjJOd3hiYmhwcXk0cStCcUhEaUJEVENySklyYy91bUZZT3Vkam05?=
 =?utf-8?B?YkRoMm1tUFNVRm90VjAvUW1LNk9pVkUzelpUbCsrRTFOcDkvTUhrdUpEUi9Q?=
 =?utf-8?B?Z3hCNTdpTVhRVWkxcmFJQVFJWUJCcWx4STV1VStxNGZWNGRpWmlpQVU2VmNP?=
 =?utf-8?B?algvb3dJYWp3NFBnaDR6VXpMUU1kUk5vN3FqMHdkOXRMMjltNHZGNWsxMWhN?=
 =?utf-8?B?QU42RnJxSUZUT1VxYkgyOFNvaU9INGNEak85Z1JxYTJubDJlZWpUOU1QY3JR?=
 =?utf-8?B?aXhOWmdqbWRoS3RxU2VLN1pxTlpaRU1PWlBNaGZscDJrVndaMGprOTZDaW00?=
 =?utf-8?B?N2dVUEpIVk9JUmZlci9nQmQwNjhRWGRiUGJDNWFEUEpMMkFxZzkzRlExdFc3?=
 =?utf-8?B?elU2SGhQK1g5eDdPVHIvT2lZVVA2dHpUUFJMa3o0SDN0T1YrU1R1ZjVIV1Jr?=
 =?utf-8?B?NkJqSm1CbGRldk5SbGZMUGlpcHAzR1RqT0prd1d0QW9Ncituai9jNXNqZnBE?=
 =?utf-8?B?UUxGL04yaUt1eENQYW1kNlhMVHdpT0ZXQXl4QVlmWGdtSHYxK1hCWWFtUFpu?=
 =?utf-8?B?d1dqbDk2WFJkdGxudC9RT0tHTDFtZkVNWFhyQ0tZa3FnamNuMnNNMk9XbFhV?=
 =?utf-8?B?eU1VVzlwdk9BSlVrNTNIVVFGallnWjdyUlZBcVNGalRrL29WTXNlejlTTkZW?=
 =?utf-8?B?UkJreUpwZlFQQ3JoMVBJbkJhRm5FbndvUWFGK1NhaXNhYitCUERkUmlySmsx?=
 =?utf-8?B?T29pNHFFM2ZmNHZoVkcwem5FVmRRZFpRaGhoZTluTHpaTk9OdUtMeUZUTnI4?=
 =?utf-8?B?b0hsU0ZhQnBhWXAxYVF3NGhjNVgxejBsWFpDK1ZhVXlCVUdmdzh1VXNPemZX?=
 =?utf-8?B?a2EvU1kvU21GVm9tVUQ4MWJNeVhUSGYxaGlKdlJZWFB3RlVXN3VLZ3hoNXl6?=
 =?utf-8?B?NUhoWllCSHpaZ1p4Ni94bWUveDdoajNidDA4QThtQWVVWFRZRmhmY2NZYlQv?=
 =?utf-8?B?R0RTejBJNmU3R2hTaUVOb2FhakF5SzlYUlVwNVQwWHYvSDlobkhJaXNqTDVy?=
 =?utf-8?B?SE0xSXRnUHlZMDNFT3BUN3ZNS1czU3BEZkczY3phbEhFa25jS1kyRTJiRFJn?=
 =?utf-8?B?U0lKbHMwMzBqSXd2MHV4dkVjc0kvODZFTHdacUNpU3J2bHcrWDUzMTJaK2Fh?=
 =?utf-8?B?Wm92bi92UVIrMHdXWUdXeC9lb09USkVva05CNHJ6NWNNNWUrUk1TU05aR0VG?=
 =?utf-8?B?UVl4VW1DYXVGSWtHQjRsU0dGTGNVdkpqRThKU2NvU1luMmlhYWx6eGwvQmNW?=
 =?utf-8?B?eFFna1hXTHhpeWlQTGtDZnVBT2Rvb0dGay9wdFRBZ2hGbngyVVozUDRVa2Q4?=
 =?utf-8?B?eGJ2cTgwMUpRQ3JTUG1pZ0FyUE9QS3ZmbDI3Q00vOGNYaGVxTHR1MEdib0o3?=
 =?utf-8?B?ODVvR0x0aXRYNjZ2MHF1d3ZUVUM3UkpsM3RYWTJzbWYvb1hpK2dWWGpQQ3Aw?=
 =?utf-8?Q?4CwsrWDIGqHM9FVyvg+4MCxE/?=
X-MS-Exchange-CrossTenant-Network-Message-Id: afa585c8-1b91-4d01-82bc-08dd98e18fe0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 03:34:30.9647 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 37ZZ4P7EooRzPtN3ePAAv9aA3eqkhZx9Oq6dqF7L7tbhcUwzrORPFjTVUqq68bC+Wd52Eosh9xNVKiRRAAApUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6719
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

Hi Anirban

On 5/14/2025 12:07 AM, sk.anirban@intel.com wrote:
> From: Sk Anirban <sk.anirban@intel.com>
> 
> Leverage IGT spinner to trigger frequency scaling and
> set RPS minimum frequency to RP0 for achieving peak frequency.
> This method replaces the existing waitboost mechanism used
> to reach maximum frequency.
> 
> v2:
>   - Disable power consumption check for dgfx
> 
> v3:
>   - Implement igt exit handler
> 
> v4:
>   - Cosmetic changes (Riana)
> 
> v5:
>   - Limit the power consumption test to GT0 only
> 
> v6:
>   - Fix frequency restoration (Riana)
> 
> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
> ---
>   tests/intel/i915_pm_rc6_residency.c | 136 +++++++++++++++++++---------
>   1 file changed, 91 insertions(+), 45 deletions(-)
> 
> diff --git a/tests/intel/i915_pm_rc6_residency.c b/tests/intel/i915_pm_rc6_residency.c
> index c9128481d..b400460c7 100644
> --- a/tests/intel/i915_pm_rc6_residency.c
> +++ b/tests/intel/i915_pm_rc6_residency.c
> @@ -264,17 +264,6 @@ static bool __pmu_wait_for_rc6(int fd)
>   	return false;
>   }
>   
> -static uint32_t batch_create(int fd)
> -{
> -	const uint32_t bbe = MI_BATCH_BUFFER_END;
> -	uint32_t handle;
> -
> -	handle = gem_create(fd, 4096);
> -	gem_write(fd, handle, 0, &bbe, sizeof(bbe));
> -
> -	return handle;
> -}
> -
>   static int open_pmu(int i915, uint64_t config)
>   {
>   	int fd;
> @@ -286,45 +275,88 @@ static int open_pmu(int i915, uint64_t config)
>   	return fd;
>   }
>   
> -#define WAITBOOST 0x1
> +#define FREQUENT_BOOST 0x1
>   #define ONCE 0x2
>   
>   static void sighandler(int sig)
>   {
>   }
>   
> -static void bg_load(int i915, uint32_t ctx_id, uint64_t engine_flags, unsigned int flags, unsigned long *ctl)
> +static uint32_t get_freq(int dirfd, uint8_t id)
> +{
> +	uint32_t val;
> +
> +	igt_assert(igt_sysfs_rps_scanf(dirfd, id, "%u", &val) == 1);
> +
> +	return val;
> +}
> +
> +static int set_freq(int dirfd, uint8_t id, uint32_t val)
> +{
> +	return igt_sysfs_rps_printf(dirfd, id, "%u", val);
> +}
> +
> +uint32_t stash_min;
> +int i915 = -1;
> +
> +static void restore_freq(int sig)
> +{
> +	int dirfd;
> +	int gt = 0;
> +
> +	i915 = drm_open_driver(DRIVER_INTEL);

Why open again. The reason for making it static was re-use
Is i915 not open when exit handler is run?

Rest of the code looks good.

Also respond on the BAT failures as the test is same and are legacy issues

Thanks
Riana

> +	dirfd = igt_sysfs_gt_open(i915, 0);
> +	igt_sysfs_gt_open(i915, gt);
> +
> +	igt_assert_lt(0, set_freq(dirfd, RPS_MIN_FREQ_MHZ, stash_min));
> +
> +	drm_close_driver(i915);
> +	close(dirfd);
> +}
> +
> +static void bg_load(const intel_ctx_t *ctx, int dirfd, uint64_t engine_flags,
> +		    unsigned int flags, unsigned long *ctl, unsigned int gt)
>   {
>   	const bool has_execlists = intel_gen(intel_get_drm_devid(i915)) >= 8;
> -	struct drm_i915_gem_exec_object2 obj = {
> -		.handle = batch_create(i915),
> -	};
> -	struct drm_i915_gem_execbuffer2 execbuf = {
> -		.buffers_ptr = to_user_pointer(&obj),
> -		.buffer_count = 1,
> -		.flags = engine_flags,
> -		.rsvd1 = ctx_id,
> -	};
>   	struct sigaction act = {
>   		.sa_handler = sighandler
>   	};
> +	int64_t timeout = 1;
> +	uint64_t ahnd;
> +	int rp0;
>   
> +	ahnd = get_reloc_ahnd(i915, ctx->id);
> +	rp0 = get_freq(dirfd, RPS_RP0_FREQ_MHZ);
>   	sigaction(SIGINT, &act, NULL);
>   	do {
>   		uint64_t submit, wait, elapsed;
>   		struct timespec tv = {};
> +		igt_spin_t *spin;
>   
>   		igt_nsec_elapsed(&tv);
> -
> -		gem_execbuf(i915, &execbuf);
> +		spin = igt_spin_new(i915,
> +				    .ahnd = ahnd,
> +				    .ctx = ctx,
> +				    .engine = engine_flags);
>   		submit = igt_nsec_elapsed(&tv);
> -		if (flags & WAITBOOST) {
> -			gem_sync(i915, obj.handle);
> +		if (flags & FREQUENT_BOOST) {
> +			/* Set MIN freq to RP0 to achieve the peak freq */
> +			igt_assert_lt(0, set_freq(dirfd, RPS_MIN_FREQ_MHZ, rp0));
> +			igt_assert(gem_bo_busy(i915, spin->handle));
> +			gem_wait(i915, spin->handle, &timeout);
> +
> +			/* Restore the MIN freq back to default */
> +			igt_assert_lt(0, set_freq(dirfd, RPS_MIN_FREQ_MHZ, stash_min));
> +			igt_spin_end(spin);
> +			igt_spin_free(i915, spin);
> +			gem_quiescent_gpu(i915);
>   			if (flags & ONCE)
> -				flags &= ~WAITBOOST;
> +				flags &= ~FREQUENT_BOOST;
>   		} else  {
> -			while (gem_bo_busy(i915, obj.handle))
> -				usleep(0);
> +			igt_assert(gem_bo_busy(i915, spin->handle));
> +			igt_spin_end(spin);
> +			igt_spin_free(i915, spin);
> +			gem_quiescent_gpu(i915);
>   		}
>   		wait = igt_nsec_elapsed(&tv);
>   
> @@ -350,6 +382,7 @@ static void bg_load(int i915, uint32_t ctx_id, uint64_t engine_flags, unsigned i
>   		/* aim for ~1% busy */
>   		usleep(min_t(elapsed, elapsed / 10, 50 * 1000));
>   	} while (!READ_ONCE(*ctl));
> +	put_ahnd(ahnd);
>   }
>   
>   static void kill_children(int sig)
> @@ -361,9 +394,9 @@ static void kill_children(int sig)
>   	signal(sig, old);
>   }
>   
> -static void rc6_idle(int i915, uint32_t ctx_id, uint64_t flags, unsigned int gt)
> +static void rc6_idle(const intel_ctx_t *ctx, uint64_t flags, unsigned int gt)
>   {
> -	const int64_t duration_ns = SLEEP_DURATION * (int64_t)NSEC_PER_SEC;
> +	const int64_t duration_ns = 2 * SLEEP_DURATION * (int64_t)NSEC_PER_SEC;
>   	const int tolerance = 20; /* Some RC6 is better than none! */
>   	const unsigned int gen = intel_gen(intel_get_drm_devid(i915));
>   	struct {
> @@ -371,10 +404,11 @@ static void rc6_idle(int i915, uint32_t ctx_id, uint64_t flags, unsigned int gt)
>   		unsigned int flags;
>   		double power;
>   	} phases[] = {
> +		{ "once", FREQUENT_BOOST | ONCE },
>   		{ "normal", 0 },
> -		{ "boost", WAITBOOST },
> -		{ "once", WAITBOOST | ONCE },
> +		{ "boost", FREQUENT_BOOST }
>   	};
> +	int dirfd = igt_sysfs_gt_open(i915, gt);
>   	struct power_sample sample[2];
>   	unsigned long slept, cycles;
>   	unsigned long *done;
> @@ -407,12 +441,21 @@ static void rc6_idle(int i915, uint32_t ctx_id, uint64_t flags, unsigned int gt)
>   
>   	assert_within_epsilon_debug(rc6, ts[1] - ts[0], 5, drpc);
>   
> +	if (gt) {
> +		close(fd);
> +		close(dirfd);
> +		igt_power_close(&gpu);
> +		return;
> +	}
> +
>   	done = mmap(0, 4096, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
>   
> +	stash_min = get_freq(dirfd, RPS_MIN_FREQ_MHZ);
> +
>   	for (int p = 0; p < ARRAY_SIZE(phases); p++) {
>   		memset(done, 0, 2 * sizeof(*done));
>   		igt_fork(child, 1) /* Setup up a very light load */
> -			bg_load(i915, ctx_id, flags, phases[p].flags, done);
> +			bg_load(ctx, dirfd, flags, phases[p].flags, done, gt);
>   
>   		igt_power_get_energy(&gpu, &sample[0]);
>   		cycles = -READ_ONCE(done[1]);
> @@ -451,19 +494,20 @@ static void rc6_idle(int i915, uint32_t ctx_id, uint64_t flags, unsigned int gt)
>   
>   	munmap(done, 4096);
>   	close(fd);
> +	close(dirfd);
>   
>   	igt_power_close(&gpu);
>   
> -	if (phases[1].power - phases[0].power > 10) {
> -		igt_assert_f(2 * phases[2].power - phases[0].power <= phases[1].power,
> +	if (phases[2].power - phases[1].power > 20 && !gem_has_lmem(i915)) {
> +		igt_assert_f(2 * phases[0].power - phases[1].power <= phases[2].power,
>   			     "Exceeded energy expectations for single busy wait load\n"
>   			     "Used %.1fmW, min %.1fmW, max %.1fmW, expected less than %.1fmW\n",
> -			     phases[2].power, phases[0].power, phases[1].power,
> -			     phases[0].power + (phases[1].power - phases[0].power) / 2);
> +			     phases[0].power, phases[1].power, phases[2].power,
> +			     phases[1].power + (phases[2].power - phases[1].power) / 2);
>   	}
>   }
>   
> -static void rc6_fence(int i915, unsigned int gt)
> +static void rc6_fence(unsigned int gt)
>   {
>   	const int64_t duration_ns = SLEEP_DURATION * (int64_t)NSEC_PER_SEC;
>   	const int tolerance = 20; /* Some RC6 is better than none! */
> @@ -557,7 +601,7 @@ static void rc6_fence(int i915, unsigned int gt)
>   	close(fd);
>   }
>   
> -static unsigned int rc6_enabled_mask(int i915, int dirfd)
> +static unsigned int rc6_enabled_mask(int dirfd)
>   {
>   	igt_require(has_rc6_residency(dirfd, RC6_RESIDENCY_MS));
>   
> @@ -570,7 +614,6 @@ static unsigned int rc6_enabled_mask(int i915, int dirfd)
>   
>   igt_main
>   {
> -	int i915 = -1;
>   	unsigned int dirfd, gt;
>   	const intel_ctx_t *ctx;
>   
> @@ -582,19 +625,22 @@ igt_main
>   	igt_subtest_with_dynamic("rc6-idle") {
>   		const struct intel_execution_engine2 *e;
>   
> +		igt_install_exit_handler(restore_freq);
>   		igt_require_gem(i915);
>   		gem_quiescent_gpu(i915);
> +		intel_allocator_multiprocess_start();
>   
>   		i915_for_each_gt(i915, dirfd, gt) {
>   			ctx = intel_ctx_create_for_gt(i915, gt);
>   			for_each_ctx_engine(i915, ctx, e) {
>   				if (e->instance == 0) {
>   					igt_dynamic_f("gt%u-%s", gt, e->name)
> -						rc6_idle(i915, ctx->id, e->flags, gt);
> +						rc6_idle(ctx, e->flags, gt);
>   				}
>   			}
>   			intel_ctx_destroy(i915, ctx);
>   		}
> +		intel_allocator_multiprocess_stop();
>   	}
>   
>   	igt_subtest_with_dynamic("rc6-fence") {
> @@ -603,7 +649,7 @@ igt_main
>   
>   		i915_for_each_gt(i915, dirfd, gt)
>   			igt_dynamic_f("gt%u", gt)
> -				rc6_fence(i915, gt);
> +				rc6_fence(gt);
>   	}
>   
>   	igt_subtest_group {
> @@ -621,7 +667,7 @@ igt_main
>   				igt_dynamic_f("gt%u", gt) {
>   					struct residencies res;
>   
> -					rc6_enabled = rc6_enabled_mask(i915, dirfd);
> +					rc6_enabled = rc6_enabled_mask(dirfd);
>   					igt_require(rc6_enabled & RC6_ENABLED);
>   
>   					measure_residencies(devid, dirfd, rc6_enabled, &res);
> @@ -635,7 +681,7 @@ igt_main
>   
>   			igt_require(IS_VALLEYVIEW(devid) || IS_CHERRYVIEW(devid));
>   
> -			rc6_enabled = rc6_enabled_mask(i915, sysfs);
> +			rc6_enabled = rc6_enabled_mask(sysfs);
>   			igt_require(rc6_enabled & RC6_ENABLED);
>   
>   			measure_residencies(devid, sysfs, rc6_enabled, &res);

