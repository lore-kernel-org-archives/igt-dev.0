Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EB66CD5BA4
	for <igt-dev@archiver.kernel.org>; Thu, 21 May 2026 11:51:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34A6110E49A;
	Thu, 21 May 2026 11:51:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZC94V0CO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61F3D10E4B4
 for <igt-dev@lists.freedesktop.org>; Thu, 21 May 2026 11:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779364266; x=1810900266;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=UoZL6w2olyg1WAGhMwxkMjZU+tUVxfD+2OHZyUzrcdQ=;
 b=ZC94V0COcMJr4zx9UiijmXZ/lufmRcgdXxD/4RhgYGYVXsTOcZrB30En
 PPA6P1hCs29GuxIQ6AU2txpqQRc94rXzNHe6vkWDj+y0kANVX0EBs0W2f
 jGNxOH1hu+qMIHSqAbdIxs2kQIZ0plXCZoTWuXkVVGuA2qsGRs91TGbO/
 vWiWQ7xNmxebOC/KBgqUx0E3ueRaThaemNFvNoIsbq8d+dcpbGyhA0n6f
 PbYvGmUwOn+4wUxnbFRThGjS/bZHsrvpssgyXUPiS1PC3AFV9lXRerYHy
 +55a4m2lVsD8+hYhDttGyEwZO0/Ns7PnGF1NTxmxE1CvEcy/CnF09zY4J w==;
X-CSE-ConnectionGUID: lTtlGd1nRbWK2XPdD7/sdA==
X-CSE-MsgGUID: QRSZPpjFQ+KAb1W8m7lIYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="80458629"
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; d="scan'208";a="80458629"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 04:51:05 -0700
X-CSE-ConnectionGUID: j56Xq1ifQ0qlkM53NG8t0Q==
X-CSE-MsgGUID: LIu1apa9RY2ANCKuk8SaLg==
X-ExtLoop1: 1
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 04:51:05 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 21 May 2026 04:51:04 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 21 May 2026 04:51:04 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.36) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 21 May 2026 04:51:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P0Aw99JaRW2K9yumZ7Ua2FaxoKiTYLPxmPmIPN7Sga0ZzPSTVba52bVARgbG7agNznV0u32a0AAOvVLioiMwxY9RL0eqyItK6IhgoyDiP7LOmerzFCHuZYSy3ZYqm1iYlpvDxZCtEZTD98CG0pWadIvKum0sPVOvEDyspUBJyQeTB25nzDSe4Y6GuLZJy9IpuK2DNhzf/ZLrfRMtoqnat+G+poXbInN1vPqpX0eRgqcB5mjP4XS/tzs9WsLxiAnugZpk1XmKkdsOSYxh/k96a4gfLFZGgfI2Qvk0Q3esfgc4i7sNb91VfKcTBbE2KxKPJFGbO7I0HoT3xy4+oobVPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lj32DaavD6LHRGlbkq4iRtCDZC4zFuJdTvdypTrYr7g=;
 b=FdSm4SJH9W6umVMCIBuCCgMxGvj6yIT2V6h6DjmBU7WE6YwBSGmwTEqXZTt5ETwWRbuXYnEcLulyw7ushg+jg+1mitrxsANqmXtL1ZhbolJSN4tpySSo9qCb9AmneC37BjpCUNcMhi1QZxJ9ouiPo0P82iovtk7+34bExjMNB76M8SoAUCYiBI6yDpNDwdOyb6uK0X7YFnnsjTzu5XWUltyvoejng8GSZOMGyc+HHgFbwl6T99lqLiP6JMKjIFmwrhBtetuFEXIginM4M2MJ7bcXXfw/FeOBN7lMir/lwy+CteXr+n9eRECygVjpS1PtMgHrUJ9sZTkXLFsIFM4LWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5880.namprd11.prod.outlook.com (2603:10b6:510:143::14)
 by IA0PR11MB7259.namprd11.prod.outlook.com (2603:10b6:208:43c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Thu, 21 May
 2026 11:50:36 +0000
Received: from PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd]) by PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd%5]) with mapi id 15.21.0025.020; Thu, 21 May 2026
 11:50:36 +0000
Message-ID: <799f0c4b-c399-42da-89c8-2d2cc7d7a361@intel.com>
Date: Thu, 21 May 2026 17:20:30 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/kms_frontbuffer_tracking: Fix duplicate
 documentation descriptions
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20260520123010.2482801-1-swati2.sharma@intel.com>
 <20260521104717.xt5nuw62uo4aijvi@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20260521104717.xt5nuw62uo4aijvi@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0011.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:176::8) To PH0PR11MB5880.namprd11.prod.outlook.com
 (2603:10b6:510:143::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5880:EE_|IA0PR11MB7259:EE_
X-MS-Office365-Filtering-Correlation-Id: 598adb4c-34fe-4877-be95-08deb72f2bc3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|22082099003|56012099003|18002099003|18092099006|3023799007|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: YtAhJodASmfrKJ2N5iFZZWgZD5x5yR2oaKlVXgk8MaTxsbYC2P7aDnxbncAlcm2hjTOOGm+yrhACycIpFyGh25EpPIxC8uHFKrWvBToAx1MyYTIlN29gX2bR4lPWyoh3+kxTq6aUf4LPols+NXM7k+r0jBjHM+ycnsfqw3dNso/n0O5mCxoMSqY4e3T289gH4z+R2Uqybj5X1BEHe50NPLduoRZ964Qlk0IRjlIKDVAu3famEfXpO7dS0iywn1WCvjTaQirwe8E160sDV0Ru6r+0jq9q6cKyjkJlHyE4RX9gd/qI9a8W9H2fMxPZboKshIbsBpx6fg/Y1PHNWd00+lzwue3h1352isa8vSYUirqVKjR3hrBFGkLf0FODWSvmpweiThWieGB2Q8y1tnbt1QIAhK/15MtfjV+ibG4n8UnTi23aH6qPN6LjfywX4+Z+HGGdkx+XyCVgtptIdNceZkYBexsBwCQSjVz/Q4lFjTwf4ug98QXtdccpMSM7xU4Mou8ipBsInx8IXpaXR3ownx0mPDaqDElQU0iTXbMIN50+db3NyGiLIyQcm6ODYYmkOacSsEvOx5jbK3pQDR6+1gtB/AeTUid9gZsBBuqXSyvUSfDWNu0aEu86cektncKMbmYnrVlTBdTA0/5Cd8SnjTTR/czlo/GMz5fuhhiPNLa9Tw144rGVou09B0HOz2gB
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5880.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(56012099003)(18002099003)(18092099006)(3023799007)(4143699003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z0dqRmlHdDBwNzJTSTREZzhJd3drVXpYN3FMUHBxL2orb0p0T25zK1QveDZx?=
 =?utf-8?B?bUh0YU9oOCt2QmcrMTBEL3JpNnBadGg4dkJodTJJNzJ2cHJES2N6cFNScUwx?=
 =?utf-8?B?NENDa1hDa1pGV1kzdldseS9CWkRDZW0xYlROWXR0NXpseU9kUE0yenZhbUpJ?=
 =?utf-8?B?MlIyQmxBZEZOQXZNMmJaeFN2VUVuOTZpbU42TmZpUEVmanRKM0R0R0V3ZW5R?=
 =?utf-8?B?WXAzcHhRY2NFMmRGRWQ3TXI1SVhEcFBlbnc5WVNHSUdxRTRuNS8vS0FXYzdX?=
 =?utf-8?B?bFFNeW8xYTU0TndTV1ovOUQ5SlRSZGpHSFliUWxQenBHVmJsTWZkai9IZVBy?=
 =?utf-8?B?MEVWMXVoNG9kNUdkZmk2NStoenpQNnZIWHB2bXpVZldzTGNGVk0zeXRxNFFS?=
 =?utf-8?B?R3RMOWxsekc3NjUzU1RMVVIweWkvU3J1Q2ZjaEg3U24vVmZjdGZYa2h6Zmhv?=
 =?utf-8?B?Z0djVnNkaTFSWCt1RTlSNUs0SVpLZ1NxU3NYUUpqZmgyMlo4emtyYkYzOHgy?=
 =?utf-8?B?R2dlK3JpSXFuVEhoeW5CMWp0a0IvMTREZ0s0Vm1IY1dpVFpleE80djRvVGRJ?=
 =?utf-8?B?c0RBcUJzWm56NnJhbHNCRzNhalpxbkJDNXYzNHBvWmFKN01yVXZjQUc2WGtw?=
 =?utf-8?B?bTgxenNOTkw2WTFEcU5lWk81c1VKWnY0S2c1a04vYmQxZEN3cXNRUzBVcnlF?=
 =?utf-8?B?KzNWMXIrTGFGWFgzK0ZHTFFySGRycENocTQyYjZhcWtmbHZFbTJ1VmFjTy9k?=
 =?utf-8?B?UkFaZG9YNlpkVnB5ZndzQ1RadEljN2VaRnFUWkxuUDFwVk4rSjFlQmxENC81?=
 =?utf-8?B?ZGxsaE1GNkl3M1UzQThzYlpSdHhDTDF3c2o3WE1SelorU1B1WXo4MEIvWjVs?=
 =?utf-8?B?WE94cndBK3Y5c0pqZFRqZUdWSG1wNE9lK1A3QUJEcnVRZW5hSXdkREdvOHdN?=
 =?utf-8?B?MTErTXp3QndzVUVyb2NpaDViRTNZdXB1ZmZZaW5nakFKbnlCclZaWTVqRDdr?=
 =?utf-8?B?MTVrdi9LTE83RDFWRlBHTVFYb0dHRzNSRldOeFR2ZzcvUE1iNXJxaU9UQnJr?=
 =?utf-8?B?Wjc0empyelRDeVpmaGpqSFJ4MUhBY3RSMENIOUg1amc0ZFBnMkZZb1p1OENX?=
 =?utf-8?B?UEd2cTQ4RVVzWkg5VmNpSXN4WWxwdGM1cTFFNHg2UGpBVk1XMmNxblN3ZitC?=
 =?utf-8?B?bEpIb3ludUpUOXdhaXpwYjE5aktlVXRHVDhaL2xvZ1YyZTlSR0FzSnBPNWUy?=
 =?utf-8?B?RzFka2lqSVZxL1pQVy9qS0ZibE9oSlljWG9XV1lOY3pqNkZMUEl5V24wenYx?=
 =?utf-8?B?cEJkcW9kYStXV3c3eGVwOUJtSzg4bnNuSnhVTnFRY2hGOEM1RFRtWnRpbFdM?=
 =?utf-8?B?L0RvZlB2MHUyOTZwNCs0UFhCMksxQzVlaFJSK3lpS2VlSzl5K2F1Z0ZvM296?=
 =?utf-8?B?SGpOaU5JbEFQTmZuU1pOZFIzdnVqM21VQ3JkazV2ajVtYUlhY3J4NzY2V1lv?=
 =?utf-8?B?OWJYVERPRFBEQjhnWTZ4YnRsaWRrUjdNdC94U2hIeTVuNnVYbmNsaml3UDR2?=
 =?utf-8?B?VjNEdFdwelFPQldHbldiWHl6Szl5VjBGSmRDYkJ4c2JBSDVZTnZHdU11R1JM?=
 =?utf-8?B?ZTJibTV6SUx5Y1ZUVEUwbzFXZVh0cC9Rdzk1RVdKSW0vbkxQNDdrWXk1Ylox?=
 =?utf-8?B?aUl4Ym9hMUZkU1Foa3RrV1d3Rk1FVnlmdDNhcG1VNTR6RUI2c2J3Rk5oMnYx?=
 =?utf-8?B?Y3E1NDdxamJSQTlUck1XNGlSR2xYOEg4eXVwRUhJeTZEUmdLTUV6Zk5LaVpY?=
 =?utf-8?B?U3ZXeXVLZWkxOUppZzAyNmo1K3NmdHVaUkJ3VzlFcElGc01UQWdpNFlEazU1?=
 =?utf-8?B?MTEwVXYzMGpYQVhhS1NOMkNOTlJRN0VqZTFneXpxUStES1g4Wm53WXlIMXYy?=
 =?utf-8?B?cjVNZjhUTGcrdUppWVJ0RWd0a00rVkNacmt3WjNVWGRiNHRyanEwelhvQ0Nk?=
 =?utf-8?B?K0o1b3NEcEV2SjdHRGxiUFlKWVZZUmE3VUVKcnNLcFF2ZWYyUzUzTzUyQ1Ur?=
 =?utf-8?B?dmxkUFFBdi9heDFrT3RtaU5Ob0trYUpyMWFIb25OOFJ2NThFT3k4UXZkUGw0?=
 =?utf-8?B?V25vRlJpeVNnQkJrZzdSTVhoOU5rVUxBUFVTVThodFJ2c3NTT20zV0ttTWtT?=
 =?utf-8?B?amdQWTY3T0FuaFN5Y1dpYkdRUCtaL1ZNZ2NEWGh6NmRTNENGb1FMRHh3dGhs?=
 =?utf-8?B?QTNSZ0ZHS3diRGZrUnBoaHFpS2Q0anU2bFV3SndUZlhRUXBLcVdmR0ZlVnhL?=
 =?utf-8?B?Y1kwZ0tUaTZyczRoQTE5OWRBOFpOaEhuOW5DN2VqWlhra3R2VERZS2xJZGx2?=
 =?utf-8?Q?Ryp9n/ErFXfDEg5w=3D?=
X-Exchange-RoutingPolicyChecked: nEbOHHugPkTQRbmTwvB+n/v4E7XnGSl1sxfriCl3ZycDL7JbN0CODkS4AhXQ9qFlD1PxJWEek1yc5iVQ6maxcUcAJoypnLgShgSnE1jjTEf/XN+bNdV4rYads+FT2IaaorXdzplLtno1gb4OySFB/25VSSqip9vIRDFGD0rku2hOc/Vm0WeuqXa958/cHfwMUOh4oP0mh6XFy9TIV/MEMDt5hAOdJLJ3tvWr9cWcKNiLg1g2Rr9RtbaFmJTJW44A6sHeG8J66J+ibRor+hPhiLFCI6HlB60vZNJYJhn+16ZBePlKwFcNpAJqmyWDtmRf8USi2COmXLPASDpfDFN8oA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 598adb4c-34fe-4877-be95-08deb72f2bc3
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5880.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 11:50:36.2535 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 01ZLR7PK49VxTQN02k7ocubAAaCbtZq8sTKq60pvS+Q1S6x2MThF0ueGsQY4GPrd8UnM5I0ld1XwHrD/vnS+rg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7259
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

Hi Kamil

On 21-05-2026 04:17 pm, Kamil Konieczny wrote:
> Hi Swati,
> On 2026-05-20 at 18:00:10 +0530, Swati Sharma wrote:
>> Multiple SUBTEST entries shared identical descriptions across different
>> test scenarios (offscreen, primary screen, secondary screen).
>>
>> Fix by consolidating feature variants into arg[] parameters and
>> updating descriptions to include scenario context (screen, plane,
>> fb type, panel count, draw method).
>>
>> This reduces documentation SUBTEST entries from 315 to 33.
> I did a check with new and old, using:
> old-build/build/tests/kms_frontbuffer_tracking --l > aold
> new-build/build/tests/kms_frontbuffer_tracking --l > anew
> diff -u aold anew
>
> and results looks correct.
>
> imho you can reduce it even more, see below.
>
>> v2: Addressed review comments - made descriptions shorter (Kamil)
>>
>> Co-developed-by: Claude Opus 4.6
>> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
>> ---
>>   tests/intel/kms_frontbuffer_tracking.c | 1432 ++++++++----------------
>>   1 file changed, 468 insertions(+), 964 deletions(-)
>>
>> diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
>> index e7bb3fa18..37706cab5 100644
>> --- a/tests/intel/kms_frontbuffer_tracking.c
>> +++ b/tests/intel/kms_frontbuffer_tracking.c
>> @@ -27,7 +27,7 @@
>>   /**
>>    * TEST: kms frontbuffer tracking
>>    * Category: Display
>> - * Description: Test the Kernel's frontbuffer tracking mechanism and its related features: FBC, PSR and DRRS
>> + * Description: Test the Kernel's frontbuffer tracking mechanism and its related features: FBC, PSR, HDR and DRRS
>>    * Driver requirement: i915, xe
>>    * Mega feature: General Display Features
>>    */
>> @@ -59,82 +59,51 @@
>>    * SUBTEST: pipe-fbc-rte
>>    * Description: Sanity test to enable FBC on each pipe.
>>    *
>> - * SUBTEST: drrs-%dp-rte
>> - * Description: Sanity test to enable DRRS with %arg[1] panels.
>> + * SUBTEST: %s-%dp-rte
>> + * Description: Sanity test to enable %arg[1] with %arg[2] panels.
>>    *
>> - * SUBTEST: fbc-%dp-rte
>> - * Description: Sanity test to enable FBC with %arg[1] panels.
>> - *
>> - * SUBTEST: psr-%dp-rte
>> - * Description: Sanity test to enable PSR with %arg[1] panels.
>> - *
>> - * SUBTEST: hdr-%dp-rte
>> - * Description: Sanity test to enable PSR with %arg[1] panels.
>> - *
>> - * SUBTEST: fbcdrrs-%dp-rte
>> - * Description: Sanity test to enable FBC & DRRS with %arg[1] panels.
>> - *
>> - * SUBTEST: fbcpsr-%dp-rte
>> - * Description: Sanity test to enable FBC & PSR with %arg[1] panels.
>> - *
>> - * SUBTEST: fbchdr-%dp-rte
>> - * Description: Sanity test to enable FBC & HDR with %arg[1] panels.
>> - *
>> - * SUBTEST: drrshdr-%dp-rte
>> - * Description: Sanity test to enable HDR & DRRS with %arg[1] panels.
>> - *
>> - * SUBTEST: psrhdr-%dp-rte
>> - * Description: Sanity test to enable HDR & PSR with %arg[1] panels.
>> - *
>> - * SUBTEST: fbcdrrshdr-%dp-rte
>> - * Description: Sanity test to enable HDR, FBC & DRRS with %arg[1] panels.
>> - *
>> - * SUBTEST: fbcpsrhdr-%dp-rte
>> - * Description: Sanity test to enable HDR, FBC & PSR with %arg[1] panels.
>> + * arg[1]:
>>    *
>> - * arg[1].values:   1, 2
>> + * @drrs:       DRRS
>> + * @fbc:        FBC
>> + * @psr:        PSR
>> + * @hdr:        HDR
>> + * @fbcdrrs:    FBC & DRRS
>> + * @fbcpsr:     FBC & PSR
>> + * @fbchdr:     FBC & HDR
>> + * @drrshdr:    DRRS & HDR
>> + * @psrhdr:     PSR & HDR
>> + * @fbcdrrshdr: FBC, DRRS & HDR
>> + * @fbcpsrhdr:  FBC, PSR & HDR
>> + *
>> + * arg[2].values:   1, 2
>>    */
>>   
>>   /**
>> - * SUBTEST: drrs-1p-offscreen-pri-%s-draw-%s
>> - * Description: Draw a set of rectangles on the screen using the provided method
>> - *
>> - * SUBTEST: fbc-1p-offscreen-pri-%s-draw-%s
>> - * Description: Draw a set of rectangles on the screen using the provided method
>> - *
>> - * SUBTEST: psr-1p-offscreen-pri-%s-draw-%s
>> - * Description: Draw a set of rectangles on the screen using the provided method
>> + * SUBTEST: %s-1p-offscreen-pri-%s-draw-%s
>> + * Description: Draw a set of rectangles targeting offscreen buffer using %arg[3] method
>> + * 		with %arg[1], using %arg[2]
>>    *
>> - * SUBTEST: hdr-1p-offscreen-pri-%s-draw-%s
>> - * Description: Draw a set of rectangles on the screen using the provided method
>> - *
>> - * SUBTEST: fbcdrrs-1p-offscreen-pri-%s-draw-%s
>> - * Description: Draw a set of rectangles on the screen using the provided method
>> - *
>> - * SUBTEST: fbcpsr-1p-offscreen-pri-%s-draw-%s
>> - * Description: Draw a set of rectangles on the screen using the provided method
>> - *
>> - * SUBTEST: fbchdr-1p-offscreen-pri-%s-draw-%s
>> - * Description: Draw a set of rectangles on the screen using the provided method
>> - *
>> - * SUBTEST: drrshdr-1p-offscreen-pri-%s-draw-%s
>> - * Description: Draw a set of rectangles on the screen using the provided method
>> - *
>> - * SUBTEST: psrhdr-1p-offscreen-pri-%s-draw-%s
>> - * Description: Draw a set of rectangles on the screen using the provided method
>> - *
>> - * SUBTEST: fbcpsrhdr-1p-offscreen-pri-%s-draw-%s
>> - * Description: Draw a set of rectangles on the screen using the provided method
>> + * arg[1]:
>>    *
>> - * SUBTEST: fbcdrrshdr-1p-offscreen-pri-%s-draw-%s
>> - * Description: Draw a set of rectangles on the screen using the provided method
>> + * @drrs:       DRRS
>> + * @fbc:        FBC
>> + * @psr:        PSR
>> + * @hdr:        HDR
>> + * @fbcdrrs:    FBC & DRRS
>> + * @fbcpsr:     FBC & PSR
>> + * @fbchdr:     FBC & HDR
>> + * @drrshdr:    DRRS & HDR
>> + * @psrhdr:     PSR & HDR
>> + * @fbcdrrshdr: FBC, DRRS & HDR
>> + * @fbcpsrhdr:  FBC, PSR & HDR
>>    *
>> - * arg[1]:
>> + * arg[2]:
>>    *
>>    * @indfb:          Individual fb
>>    * @shrfb:          Shared fb
>>    *
>> - * arg[2]:
>> + * arg[3]:
>>    *
>>    * @blt:            Blitter
>>    * @mmap-wc:        MMAP-WC
>> @@ -142,51 +111,31 @@
>>    */
>>   
>>   /**
>> - * SUBTEST: drrs-1p-offscreen-pri-%s-draw-%s
> Note that name here is the same as in previous hunk:
> %s-1p-offscreen-pri-%s-draw-%s

Yes indeed, but check driver reqt too. Previous one is for i915/xe both.

This one only for i915. That's why splitting is required.

>> - * Description: Draw a set of rectangles on the screen using the provided method
>> - * Driver requirement: i915
>> - *
>> - * SUBTEST: fbc-1p-offscreen-pri-%s-draw-%s
>> - * Description: Draw a set of rectangles on the screen using the provided method
>> - * Driver requirement: i915
>> - *
>> - * SUBTEST: psr-1p-offscreen-pri-%s-draw-%s
>> - * Description: Draw a set of rectangles on the screen using the provided method
>> - * Driver requirement: i915
>> - *
>> - * SUBTEST: hdr-1p-offscreen-pri-%s-draw-%s
>> - * Description: Draw a set of rectangles on the screen using the provided method
>> - * Driver requirement: i915
>> - *
>> - * SUBTEST: fbcdrrs-1p-offscreen-pri-%s-draw-%s
>> - * Description: Draw a set of rectangles on the screen using the provided method
>> - * Driver requirement: i915
>> - *
>> - * SUBTEST: fbcpsr-1p-offscreen-pri-%s-draw-%s
>> - * Description: Draw a set of rectangles on the screen using the provided method
>> + * SUBTEST: %s-1p-offscreen-pri-%s-draw-%s
>> + * Description: Draw a set of rectangles targeting offscreen buffer using %arg[3] method
>> + * 		with %arg[1], using %arg[2]
>>    * Driver requirement: i915
>>    *
>> - * SUBTEST: fbchdr-1p-offscreen-pri-%s-draw-%s
>> - * Description: Draw a set of rectangles on the screen using the provided method
>> - *
>> - * SUBTEST: drrshdr-1p-offscreen-pri-%s-draw-%s
>> - * Description: Draw a set of rectangles on the screen using the provided method
>> - *
>> - * SUBTEST: psrhdr-1p-offscreen-pri-%s-draw-%s
>> - * Description: Draw a set of rectangles on the screen using the provided method
>> - *
>> - * SUBTEST: fbcdrrshdr-1p-offscreen-pri-%s-draw-%s
>> - * Description: Draw a set of rectangles on the screen using the provided method
>> + * arg[1]:
>>    *
>> - * SUBTEST: fbcpsrhdr-1p-offscreen-pri-%s-draw-%s
>> - * Description: Draw a set of rectangles on the screen using the provided method
>> + * @drrs:       DRRS
>> + * @fbc:        FBC
>> + * @psr:        PSR
>> + * @hdr:        HDR
>> + * @fbcdrrs:    FBC & DRRS
>> + * @fbcpsr:     FBC & PSR
>> + * @fbchdr:     FBC & HDR
>> + * @drrshdr:    DRRS & HDR
>> + * @psrhdr:     PSR & HDR
>> + * @fbcdrrshdr: FBC, DRRS & HDR
>> + * @fbcpsrhdr:  FBC, PSR & HDR
>>    *
>> - * arg[1]:
>> + * arg[2]:
>>    *
>>    * @indfb:          Individual fb
>>    * @shrfb:          Shared fb
>>    *
>> - * arg[2]:
>> + * arg[3]:
>>    *
>>    * @mmap-cpu:       MMAP-CPU
>>    * @mmap-gtt:       MMAP-GTT
> imho you can add these two lines to previous description
> and drop this hunk.
>
>> @@ -194,59 +143,34 @@
>>    */
>>   
>>   /**
>> - * SUBTEST: drrs-%dp-primscrn-%s-indfb-draw-%s
>> - * Description: Draw a set of rectangles on the screen using the provided method
>> - * Driver requirement: i915
>> - *
>> - * SUBTEST: fbc-%dp-primscrn-%s-indfb-draw-%s
>> - * Description: Draw a set of rectangles on the screen using the provided method
>> - * Driver requirement: i915
>> - *
>> - * SUBTEST: psr-%dp-primscrn-%s-indfb-draw-%s
>> - * Description: Draw a set of rectangles on the screen using the provided method
>> + * SUBTEST: %s-%dp-primscrn-%s-indfb-draw-%s
>> + * Description: Draw a set of rectangles on primary screen using %arg[4] method on %arg[3]
>> + * 		with %arg[1], %arg[2] panel(s) and individual fb
>>    * Driver requirement: i915
>>    *
>> - * SUBTEST: hdr-%dp-primscrn-%s-indfb-draw-%s
>> - * Description: Draw a set of rectangles on the screen using the provided method
>> - * Driver requirement: i915
>> - *
>> - * SUBTEST: fbcdrrs-%dp-primscrn-%s-indfb-draw-%s
>> - * Description: Draw a set of rectangles on the screen using the provided method
>> - * Driver requirement: i915
>> - *
>> - * SUBTEST: fbcpsr-%dp-primscrn-%s-indfb-draw-%s
>> - * Description: Draw a set of rectangles on the screen using the provided method
>> - * Driver requirement: i915
>> - *
>> - * SUBTEST: fbchdr-%dp-primscrn-%s-indfb-draw-%s
>> - * Description: Draw a set of rectangles on the screen using the provided method
>> - * Driver requirement: i915
>> - *
>> - * SUBTEST: drrshdr-%dp-primscrn-%s-indfb-draw-%s
>> - * Description: Draw a set of rectangles on the screen using the provided method
>> - * Driver requirement: i915
>> - *
>> - * SUBTEST: psrhdr-%dp-primscrn-%s-indfb-draw-%s
>> - * Description: Draw a set of rectangles on the screen using the provided method
>> - * Driver requirement: i915
>> - *
>> - * SUBTEST: fbcdrrshdr-%dp-primscrn-%s-indfb-draw-%s
>> - * Description: Draw a set of rectangles on the screen using the provided method
>> - * Driver requirement: i915
>> + * arg[1]:
>>    *
>> - * SUBTEST: fbcpsrhdr-%dp-primscrn-%s-indfb-draw-%s
>> - * Description: Draw a set of rectangles on the screen using the provided method
>> - * Driver requirement: i915
>> + * @drrs:       DRRS
>> + * @fbc:        FBC
>> + * @psr:        PSR
>> + * @hdr:        HDR
>> + * @fbcdrrs:    FBC & DRRS
>> + * @fbcpsr:     FBC & PSR
>> + * @fbchdr:     FBC & HDR
>> + * @drrshdr:    DRRS & HDR
>> + * @psrhdr:     PSR & HDR
>> + * @fbcdrrshdr: FBC, DRRS & HDR
>> + * @fbcpsrhdr:  FBC, PSR & HDR
>>    *
>> - * arg[1].values:   1, 2
>> + * arg[2].values:   1, 2
>>    *
>> - * arg[2]:
>> + * arg[3]:
>>    *
>>    * @cur:            Cursor plane
>>    * @pri:            Primary plane
>>    * @spr:            Sprite plane
>>    *
>> - * arg[3]:
>> + * arg[4]:
>>    *
>>    * @mmap-cpu:       MMAP-CPU
>>    * @mmap-gtt:       MMAP-GTT
>> @@ -254,48 +178,33 @@
>>    */
>>   
>>   /**
>> - * SUBTEST: drrs-%dp-primscrn-%s-indfb-draw-%s
> Same name as in previous hunk:
> %s-%dp-primscrn-%s-indfb-draw-%s
>
>> - * Description: Draw a set of rectangles on the screen using the provided method
>> - *
>> - * SUBTEST: fbc-%dp-primscrn-%s-indfb-draw-%s
>> - * Description: Draw a set of rectangles on the screen using the provided method
>> - *
>> - * SUBTEST: psr-%dp-primscrn-%s-indfb-draw-%s
>> - * Description: Draw a set of rectangles on the screen using the provided method
>> - *
>> - * SUBTEST: hdr-%dp-primscrn-%s-indfb-draw-%s
>> - * Description: Draw a set of rectangles on the screen using the provided method
>> + * SUBTEST: %s-%dp-primscrn-%s-indfb-draw-%s
>> + * Description: Draw a set of rectangles on primary screen using %arg[4] method on %arg[3]
>> + * 		with %arg[1], %arg[2] panel(s) and individual fb
>>    *
>> - * SUBTEST: fbcdrrs-%dp-primscrn-%s-indfb-draw-%s
>> - * Description: Draw a set of rectangles on the screen using the provided method
>> - *
>> - * SUBTEST: fbcpsr-%dp-primscrn-%s-indfb-draw-%s
>> - * Description: Draw a set of rectangles on the screen using the provided method
>> - *
>> - * SUBTEST: fbchdr-%dp-primscrn-%s-indfb-draw-%s
>> - * Description: Draw a set of rectangles on the screen using the provided method
>> - *
>> - * SUBTEST: drrshdr-%dp-primscrn-%s-indfb-draw-%s
>> - * Description: Draw a set of rectangles on the screen using the provided method
>> - *
>> - * SUBTEST: psrhdr-%dp-primscrn-%s-indfb-draw-%s
>> - * Description: Draw a set of rectangles on the screen using the provided method
>> - *
>> - * SUBTEST: fbcdrrshdr-%dp-primscrn-%s-indfb-draw-%s
>> - * Description: Draw a set of rectangles on the screen using the provided method
>> + * arg[1]:
>>    *
>> - * SUBTEST: fbcpsrhdr-%dp-primscrn-%s-indfb-draw-%s
>> - * Description: Draw a set of rectangles on the screen using the provided method
>> + * @drrs:       DRRS
>> + * @fbc:        FBC
>> + * @psr:        PSR
>> + * @hdr:        HDR
>> + * @fbcdrrs:    FBC & DRRS
>> + * @fbcpsr:     FBC & PSR
>> + * @fbchdr:     FBC & HDR
>> + * @drrshdr:    DRRS & HDR
>> + * @psrhdr:     PSR & HDR
>> + * @fbcdrrshdr: FBC, DRRS & HDR
>> + * @fbcpsrhdr:  FBC, PSR & HDR
>>    *
>> - * arg[1].values:   1, 2
>> + * arg[2].values:   1, 2
>>    *
>> - * arg[2]:
>> + * arg[3]:
>>    *
>>    * @cur:            Cursor plane
>>    * @pri:            Primary plane
>>    * @spr:            Sprite plane
>>    *
>> - * arg[3]:
>> + * arg[4]:
>>    *
>>    * @blt:            Blitter
>>    * @mmap-wc:        MMAP-WC
> Same here, add these two to previous and drop hunk.
>
>> @@ -303,42 +212,27 @@
>>    */
>>   
>>   /**
>> - * SUBTEST: drrs-%dp-primscrn-pri-shrfb-draw-%s
>> - * Description: Draw a set of rectangles on the screen using the provided method
>> - *
>> - * SUBTEST: fbc-%dp-primscrn-pri-shrfb-draw-%s
>> - * Description: Draw a set of rectangles on the screen using the provided method
>> - *
>> - * SUBTEST: psr-%dp-primscrn-pri-shrfb-draw-%s
>> - * Description: Draw a set of rectangles on the screen using the provided method
>> - *
>> - * SUBTEST: hdr-%dp-primscrn-pri-shrfb-draw-%s
>> - * Description: Draw a set of rectangles on the screen using the provided method
>> + * SUBTEST: %s-%dp-primscrn-pri-shrfb-draw-%s
>> + * Description: Draw a set of rectangles on primary screen on primary plane using %arg[3] method
>> + * 		with %arg[1], %arg[2] panel(s) and shared fb
>>    *
>> - * SUBTEST: fbcdrrs-%dp-primscrn-pri-shrfb-draw-%s
>> - * Description: Draw a set of rectangles on the screen using the provided method
>> - *
>> - * SUBTEST: fbcpsr-%dp-primscrn-pri-shrfb-draw-%s
>> - * Description: Draw a set of rectangles on the screen using the provided method
>> - *
>> - * SUBTEST: fbchdr-%dp-primscrn-pri-shrfb-draw-%s
>> - * Description: Draw a set of rectangles on the screen using the provided method
>> - *
>> - * SUBTEST: drrshdr-%dp-primscrn-pri-shrfb-draw-%s
>> - * Description: Draw a set of rectangles on the screen using the provided method
>> - *
>> - * SUBTEST: psrhdr-%dp-primscrn-pri-shrfb-draw-%s
>> - * Description: Draw a set of rectangles on the screen using the provided method
>> - *
>> - * SUBTEST: fbcdrrshdr-%dp-primscrn-pri-shrfb-draw-%s
>> - * Description: Draw a set of rectangles on the screen using the provided method
>> + * arg[1]:
>>    *
>> - * SUBTEST: fbcpsrhdr-%dp-primscrn-pri-shrfb-draw-%s
>> - * Description: Draw a set of rectangles on the screen using the provided method
>> + * @drrs:       DRRS
>> + * @fbc:        FBC
>> + * @psr:        PSR
>> + * @hdr:        HDR
>> + * @fbcdrrs:    FBC & DRRS
>> + * @fbcpsr:     FBC & PSR
>> + * @fbchdr:     FBC & HDR
>> + * @drrshdr:    DRRS & HDR
>> + * @psrhdr:     PSR & HDR
>> + * @fbcdrrshdr: FBC, DRRS & HDR
>> + * @fbcpsrhdr:  FBC, PSR & HDR
>>    *
>> - * arg[1].values:   1, 2
>> + * arg[2].values:   1, 2
>>    *
>> - * arg[2]:
>> + * arg[3]:
>>    *
>>    * @blt:            Blitter
>>    * @mmap-wc:        MMAP-WC
>> @@ -346,53 +240,28 @@
>>    */
>>   
>>   /**
>> - * SUBTEST: drrs-%dp-primscrn-pri-shrfb-draw-%s
> Same name as in previous hunk:
> %s-%dp-primscrn-pri-shrfb-draw-%s
>
>> - * Description: Draw a set of rectangles on the screen using the provided method
>> - * Driver requirement: i915
>> - *
>> - * SUBTEST: fbc-%dp-primscrn-pri-shrfb-draw-%s
>> - * Description: Draw a set of rectangles on the screen using the provided method
>> - * Driver requirement: i915
>> - *
>> - * SUBTEST: psr-%dp-primscrn-pri-shrfb-draw-%s
>> - * Description: Draw a set of rectangles on the screen using the provided method
>> - * Driver requirement: i915
>> - *
>> - * SUBTEST: hdr-%dp-primscrn-pri-shrfb-draw-%s
>> - * Description: Draw a set of rectangles on the screen using the provided method
>> - * Driver requirement: i915
>> - *
>> - * SUBTEST: fbcdrrs-%dp-primscrn-pri-shrfb-draw-%s
>> - * Description: Draw a set of rectangles on the screen using the provided method
>> - * Driver requirement: i915
>> - *
>> - * SUBTEST: fbcpsr-%dp-primscrn-pri-shrfb-draw-%s
>> - * Description: Draw a set of rectangles on the screen using the provided method
>> - * Driver requirement: i915
>> - *
>> - * SUBTEST: fbchdr-%dp-primscrn-pri-shrfb-draw-%s
>> - * Description: Draw a set of rectangles on the screen using the provided method
>> - * Driver requirement: i915
>> - *
>> - * SUBTEST: drrshdr-%dp-primscrn-pri-shrfb-draw-%s
>> - * Description: Draw a set of rectangles on the screen using the provided method
>> - * Driver requirement: i915
>> - *
>> - * SUBTEST: psrhdr-%dp-primscrn-pri-shrfb-draw-%s
>> - * Description: Draw a set of rectangles on the screen using the provided method
>> + * SUBTEST: %s-%dp-primscrn-pri-shrfb-draw-%s
>> + * Description: Draw a set of rectangles on primary screen on primary plane using %arg[3] method
>> + * 		with %arg[1], %arg[2] panel(s) and shared fb
>>    * Driver requirement: i915
>>    *
>> - * SUBTEST: fbcdrrshdr-%dp-primscrn-pri-shrfb-draw-%s
>> - * Description: Draw a set of rectangles on the screen using the provided method
>> - * Driver requirement: i915
>> + * arg[1]:
>>    *
>> - * SUBTEST: fbcpsrhdr-%dp-primscrn-pri-shrfb-draw-%s
>> - * Description: Draw a set of rectangles on the screen using the provided method
>> - * Driver requirement: i915
>> + * @drrs:       DRRS
>> + * @fbc:        FBC
>> + * @psr:        PSR
>> + * @hdr:        HDR
>> + * @fbcdrrs:    FBC & DRRS
>> + * @fbcpsr:     FBC & PSR
>> + * @fbchdr:     FBC & HDR
>> + * @drrshdr:    DRRS & HDR
>> + * @psrhdr:     PSR & HDR
>> + * @fbcdrrshdr: FBC, DRRS & HDR
>> + * @fbcpsrhdr:  FBC, PSR & HDR
>>    *
>> - * arg[1].values:   1, 2
>> + * arg[2].values:   1, 2
>>    *
>> - * arg[2]:
>> + * arg[3]:
>>    *
>>    * @mmap-cpu:       MMAP-CPU
>>    * @mmap-gtt:       MMAP-GTT
> Same here, move these two and drop hunk.
>
>> @@ -400,46 +269,31 @@
>>    */
>>   
>>   /**
>> - * SUBTEST: drrs-2p-scndscrn-%s-indfb-draw-%s
>> - * Description: Draw a set of rectangles on the screen using the provided method
>> + * SUBTEST: %s-2p-scndscrn-%s-indfb-draw-%s
>> + * Description: Draw a set of rectangles on secondary screen using %arg[3] method on %arg[2]
>> + * 		with %arg[1] and individual fb
>>    *
>> - * SUBTEST: fbc-2p-scndscrn-%s-indfb-draw-%s
>> - * Description: Draw a set of rectangles on the screen using the provided method
>> - *
>> - * SUBTEST: psr-2p-scndscrn-%s-indfb-draw-%s
>> - * Description: Draw a set of rectangles on the screen using the provided method
>> - *
>> - * SUBTEST: hdr-2p-scndscrn-%s-indfb-draw-%s
>> - * Description: Draw a set of rectangles on the screen using the provided method
>> - *
>> - * SUBTEST: fbcdrrs-2p-scndscrn-%s-indfb-draw-%s
>> - * Description: Draw a set of rectangles on the screen using the provided method
>> - *
>> - * SUBTEST: fbcpsr-2p-scndscrn-%s-indfb-draw-%s
>> - * Description: Draw a set of rectangles on the screen using the provided method
>> - *
>> - * SUBTEST: fbchdr-2p-scndscrn-%s-indfb-draw-%s
>> - * Description: Draw a set of rectangles on the screen using the provided method
>> - *
>> - * SUBTEST: drrshdr-2p-scndscrn-%s-indfb-draw-%s
>> - * Description: Draw a set of rectangles on the screen using the provided method
>> - *
>> - * SUBTEST: psrhdr-2p-scndscrn-%s-indfb-draw-%s
>> - * Description: Draw a set of rectangles on the screen using the provided method
>> - *
>> - * SUBTEST: fbcdrrshdr-2p-scndscrn-%s-indfb-draw-%s
>> - * Description: Draw a set of rectangles on the screen using the provided method
>> + * arg[1]:
>>    *
>> - * SUBTEST: fbcpsrhdr-2p-scndscrn-%s-indfb-draw-%s
>> - * Description: Draw a set of rectangles on the screen using the provided method
>> + * @drrs:       DRRS
>> + * @fbc:        FBC
>> + * @psr:        PSR
>> + * @hdr:        HDR
>> + * @fbcdrrs:    FBC & DRRS
>> + * @fbcpsr:     FBC & PSR
>> + * @fbchdr:     FBC & HDR
>> + * @drrshdr:    DRRS & HDR
>> + * @psrhdr:     PSR & HDR
>> + * @fbcdrrshdr: FBC, DRRS & HDR
>> + * @fbcpsrhdr:  FBC, PSR & HDR
>>    *
>> - * arg[1]:
>> + * arg[2]:
>>    *
>>    * @cur:            Cursor plane
>>    * @pri:            Primary plane
>>    * @spr:            Sprite plane
>>    *
>> - * arg[2]:
>> + * arg[3]:
>>    *
>>    * @blt:            Blitter
>>    * @mmap-wc:        MMAP-WC
>> @@ -447,57 +301,32 @@
>>    */
>>   
>>   /**
>> - * SUBTEST: drrs-2p-scndscrn-%s-indfb-draw-%s
> Same name as in prev:
>
> %s-2p-scndscrn-%s-indfb-draw-%s
>
>> - * Description: Draw a set of rectangles on the screen using the provided method
>> - * Driver requirement: i915
>> - *
>> - * SUBTEST: fbc-2p-scndscrn-%s-indfb-draw-%s
>> - * Description: Draw a set of rectangles on the screen using the provided method
>> - * Driver requirement: i915
>> - *
>> - * SUBTEST: psr-2p-scndscrn-%s-indfb-draw-%s
>> - * Description: Draw a set of rectangles on the screen using the provided method
>> - * Driver requirement: i915
>> - *
>> - * SUBTEST: hdr-2p-scndscrn-%s-indfb-draw-%s
>> - * Description: Draw a set of rectangles on the screen using the provided method
>> - * Driver requirement: i915
>> - *
>> - * SUBTEST: fbcdrrs-2p-scndscrn-%s-indfb-draw-%s
>> - * Description: Draw a set of rectangles on the screen using the provided method
>> - * Driver requirement: i915
>> - *
>> - * SUBTEST: fbcpsr-2p-scndscrn-%s-indfb-draw-%s
>> - * Description: Draw a set of rectangles on the screen using the provided method
>> - * Driver requirement: i915
>> - *
>> - * SUBTEST: fbchdr-2p-scndscrn-%s-indfb-draw-%s
>> - * Description: Draw a set of rectangles on the screen using the provided method
>> - * Driver requirement: i915
>> - *
>> - * SUBTEST: drrshdr-2p-scndscrn-%s-indfb-draw-%s
>> - * Description: Draw a set of rectangles on the screen using the provided method
>> + * SUBTEST: %s-2p-scndscrn-%s-indfb-draw-%s
>> + * Description: Draw a set of rectangles on secondary screen using %arg[3] method on %arg[2]
>> + * 		with %arg[1] and individual fb
>>    * Driver requirement: i915
>>    *
>> - * SUBTEST: psrhdr-2p-scndscrn-%s-indfb-draw-%s
>> - * Description: Draw a set of rectangles on the screen using the provided method
>> - * Driver requirement: i915
>> - *
>> - * SUBTEST: fbcdrrshdr-2p-scndscrn-%s-indfb-draw-%s
>> - * Description: Draw a set of rectangles on the screen using the provided method
>> - * Driver requirement: i915
>> + * arg[1]:
>>    *
>> - * SUBTEST: fbcpsrhdr-2p-scndscrn-%s-indfb-draw-%s
>> - * Description: Draw a set of rectangles on the screen using the provided method
>> - * Driver requirement: i915
>> + * @drrs:       DRRS
>> + * @fbc:        FBC
>> + * @psr:        PSR
>> + * @hdr:        HDR
>> + * @fbcdrrs:    FBC & DRRS
>> + * @fbcpsr:     FBC & PSR
>> + * @fbchdr:     FBC & HDR
>> + * @drrshdr:    DRRS & HDR
>> + * @psrhdr:     PSR & HDR
>> + * @fbcdrrshdr: FBC, DRRS & HDR
>> + * @fbcpsrhdr:  FBC, PSR & HDR
>>    *
>> - * arg[1]:
>> + * arg[2]:
>>    *
>>    * @cur:            Cursor plane
>>    * @pri:            Primary plane
>>    * @spr:            Sprite plane
>>    *
>> - * arg[2]:
>> + * arg[3]:
>>    *
>>    * @mmap-cpu:       MMAP-CPU
>>    * @mmap-gtt:       MMAP-GTT
> Same here, move these two and drop hunk.
>
>> @@ -505,40 +334,25 @@
>>    */
>>   
>>   /**
>> - * SUBTEST: drrs-2p-scndscrn-pri-shrfb-draw-%s
>> - * Description: Draw a set of rectangles on the screen using the provided method
>> + * SUBTEST: %s-2p-scndscrn-pri-shrfb-draw-%s
>> + * Description: Draw a set of rectangles on secondary screen on primary plane using %arg[2] method
>> + * 		with %arg[1] and shared fb
>>    *
>> - * SUBTEST: fbc-2p-scndscrn-pri-shrfb-draw-%s
>> - * Description: Draw a set of rectangles on the screen using the provided method
>> - *
>> - * SUBTEST: psr-2p-scndscrn-pri-shrfb-draw-%s
>> - * Description: Draw a set of rectangles on the screen using the provided method
>> - *
>> - * SUBTEST: hdr-2p-scndscrn-pri-shrfb-draw-%s
>> - * Description: Draw a set of rectangles on the screen using the provided method
>> - *
>> - * SUBTEST: fbcdrrs-2p-scndscrn-pri-shrfb-draw-%s
>> - * Description: Draw a set of rectangles on the screen using the provided method
>> - *
>> - * SUBTEST: fbcpsr-2p-scndscrn-pri-shrfb-draw-%s
>> - * Description: Draw a set of rectangles on the screen using the provided method
>> - *
>> - * SUBTEST: fbchdr-2p-scndscrn-pri-shrfb-draw-%s
>> - * Description: Draw a set of rectangles on the screen using the provided method
>> - *
>> - * SUBTEST: drrshdr-2p-scndscrn-pri-shrfb-draw-%s
>> - * Description: Draw a set of rectangles on the screen using the provided method
>> - *
>> - * SUBTEST: psrhdr-2p-scndscrn-pri-shrfb-draw-%s
>> - * Description: Draw a set of rectangles on the screen using the provided method
>> - *
>> - * SUBTEST: fbcdrrshdr-2p-scndscrn-pri-shrfb-draw-%s
>> - * Description: Draw a set of rectangles on the screen using the provided method
>> + * arg[1]:
>>    *
>> - * SUBTEST: fbcpsrhdr-2p-scndscrn-pri-shrfb-draw-%s
>> - * Description: Draw a set of rectangles on the screen using the provided method
>> + * @drrs:       DRRS
>> + * @fbc:        FBC
>> + * @psr:        PSR
>> + * @hdr:        HDR
>> + * @fbcdrrs:    FBC & DRRS
>> + * @fbcpsr:     FBC & PSR
>> + * @fbchdr:     FBC & HDR
>> + * @drrshdr:    DRRS & HDR
>> + * @psrhdr:     PSR & HDR
>> + * @fbcdrrshdr: FBC, DRRS & HDR
>> + * @fbcpsrhdr:  FBC, PSR & HDR
>>    *
>> - * arg[1]:
>> + * arg[2]:
>>    *
>>    * @blt:            Blitter
>>    * @mmap-wc:        MMAP-WC
>> @@ -546,51 +360,26 @@
>>    */
>>   
>>   /**
>> - * SUBTEST: drrs-2p-scndscrn-pri-shrfb-draw-%s
> Same name as above:
> %s-2p-scndscrn-pri-shrfb-draw-%s
>
>> - * Description: Draw a set of rectangles on the screen using the provided method
>> - * Driver requirement: i915
>> - *
>> - * SUBTEST: fbc-2p-scndscrn-pri-shrfb-draw-%s
>> - * Description: Draw a set of rectangles on the screen using the provided method
>> - * Driver requirement: i915
>> - *
>> - * SUBTEST: psr-2p-scndscrn-pri-shrfb-draw-%s
>> - * Description: Draw a set of rectangles on the screen using the provided method
>> - * Driver requirement: i915
>> - *
>> - * SUBTEST: hdr-2p-scndscrn-pri-shrfb-draw-%s
>> - * Description: Draw a set of rectangles on the screen using the provided method
>> - * Driver requirement: i915
>> - *
>> - * SUBTEST: fbcdrrs-2p-scndscrn-pri-shrfb-draw-%s
>> - * Description: Draw a set of rectangles on the screen using the provided method
>> - * Driver requirement: i915
>> - *
>> - * SUBTEST: fbcpsr-2p-scndscrn-pri-shrfb-draw-%s
>> - * Description: Draw a set of rectangles on the screen using the provided method
>> + * SUBTEST: %s-2p-scndscrn-pri-shrfb-draw-%s
>> + * Description: Draw a set of rectangles on secondary screen on primary plane using %arg[2] method
>> + * 		with %arg[1] and shared fb
>>    * Driver requirement: i915
>>    *
>> - * SUBTEST: fbchdr-2p-scndscrn-pri-shrfb-draw-%s
>> - * Description: Draw a set of rectangles on the screen using the provided method
>> - * Driver requirement: i915
>> - *
>> - * SUBTEST: drrshdr-2p-scndscrn-pri-shrfb-draw-%s
>> - * Description: Draw a set of rectangles on the screen using the provided method
>> - * Driver requirement: i915
>> - *
>> - * SUBTEST: psrhdr-2p-scndscrn-pri-shrfb-draw-%s
>> - * Description: Draw a set of rectangles on the screen using the provided method
>> - * Driver requirement: i915
>> - *
>> - * SUBTEST: fbcdrrshdr-2p-scndscrn-pri-shrfb-draw-%s
>> - * Description: Draw a set of rectangles on the screen using the provided method
>> - * Driver requirement: i915
>> + * arg[1]:
>>    *
>> - * SUBTEST: fbcpsrhdr-2p-scndscrn-pri-shrfb-draw-%s
>> - * Description: Draw a set of rectangles on the screen using the provided method
>> - * Driver requirement: i915
>> + * @drrs:       DRRS
>> + * @fbc:        FBC
>> + * @psr:        PSR
>> + * @hdr:        HDR
>> + * @fbcdrrs:    FBC & DRRS
>> + * @fbcpsr:     FBC & PSR
>> + * @fbchdr:     FBC & HDR
>> + * @drrshdr:    DRRS & HDR
>> + * @psrhdr:     PSR & HDR
>> + * @fbcdrrshdr: FBC, DRRS & HDR
>> + * @fbcpsrhdr:  FBC, PSR & HDR
>>    *
>> - * arg[1]:
>> + * arg[2]:
>>    *
>>    * @mmap-cpu:       MMAP-CPU
>>    * @mmap-gtt:       MMAP-GTT
> Move these two and drop hunk.
>
>> @@ -598,84 +387,53 @@
>>    */
>>   
>>   /**
>> - * SUBTEST: drrs-%dp-pri-indfb-multidraw
>> - * Description: Draw a set of rectangles on the screen using alternated drawing methods
>> - *
>> - * SUBTEST: fbc-%dp-pri-indfb-multidraw
>> - * Description: Draw a set of rectangles on the screen using alternated drawing methods
>> - *
>> - * SUBTEST: psr-%dp-pri-indfb-multidraw
>> - * Description: Draw a set of rectangles on the screen using alternated drawing methods
>> - *
>> - * SUBTEST: hdr-%dp-pri-indfb-multidraw
>> - * Description: Draw a set of rectangles on the screen using alternated drawing methods
>> - *
>> - * SUBTEST: fbcdrrs-%dp-pri-indfb-multidraw
>> - * Description: Draw a set of rectangles on the screen using alternated drawing methods
>> + * SUBTEST: %s-%dp-pri-indfb-multidraw
>> + * Description: Draw a set of rectangles on primary plane using alternated drawing methods
>> + * 		with %arg[1], %arg[2] panel(s) and individual fb
>>    *
>> - * SUBTEST: fbcpsr-%dp-pri-indfb-multidraw
>> - * Description: Draw a set of rectangles on the screen using alternated drawing methods
>> - *
>> - * SUBTEST: fbchdr-%dp-pri-indfb-multidraw
>> - * Description: Draw a set of rectangles on the screen using alternated drawing methods
>> - *
>> - * SUBTEST: drrshdr-%dp-pri-indfb-multidraw
>> - * Description: Draw a set of rectangles on the screen using alternated drawing methods
>> - *
>> - * SUBTEST: psrhdr-%dp-pri-indfb-multidraw
>> - * Description: Draw a set of rectangles on the screen using alternated drawing methods
>> - *
>> - * SUBTEST: fbcdrrshdr-%dp-pri-indfb-multidraw
>> - * Description: Draw a set of rectangles on the screen using alternated drawing methods
>> - *
>> - * SUBTEST: fbcpsrhdr-%dp-pri-indfb-multidraw
>> - * Description: Draw a set of rectangles on the screen using alternated drawing methods
>> + * arg[1]:
>>    *
>> - * arg[1].values:   1, 2
>> + * @drrs:       DRRS
>> + * @fbc:        FBC
>> + * @psr:        PSR
>> + * @hdr:        HDR
>> + * @fbcdrrs:    FBC & DRRS
>> + * @fbcpsr:     FBC & PSR
>> + * @fbchdr:     FBC & HDR
>> + * @drrshdr:    DRRS & HDR
>> + * @psrhdr:     PSR & HDR
>> + * @fbcdrrshdr: FBC, DRRS & HDR
>> + * @fbcpsrhdr:  FBC, PSR & HDR
>> + *
>> + * arg[2].values:   1, 2
>>    */
>>   
>>   /**
>> - * SUBTEST: drrs-%s-draw-%s
>> - * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
>> - *
>> - * SUBTEST: fbc-%s-draw-%s
>> - * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
>> - *
>> - * SUBTEST: psr-%s-draw-%s
>> - * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
>> - *
>> - * SUBTEST: hdr-%s-draw-%s
>> - * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
>> - *
>> - * SUBTEST: fbcdrrs-%s-draw-%s
>> - * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
>> - *
>> - * SUBTEST: fbcpsr-%s-draw-%s
>> - * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
>> + * SUBTEST: %s-%s-draw-%s
>> + * Description: Test pixel formats (%arg[2]) that are not FORMAT_DEFAULT using %arg[3] method with %arg[1]
>>    *
>> - * SUBTEST: fbchdr-%s-draw-%s
>> - * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
>> - *
>> - * SUBTEST: drrshdr-%s-draw-%s
>> - * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
>> - *
>> - * SUBTEST: psrhdr-%s-draw-%s
>> - * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
>> - *
>> - * SUBTEST: fbcdrrshdr-%s-draw-%s
>> - * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
>> + * arg[1]:
>>    *
>> - * SUBTEST: fbcpsrhdr-%s-draw-%s
>> - * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
>> + * @drrs:       DRRS
>> + * @fbc:        FBC
>> + * @psr:        PSR
>> + * @hdr:        HDR
>> + * @fbcdrrs:    FBC & DRRS
>> + * @fbcpsr:     FBC & PSR
>> + * @fbchdr:     FBC & HDR
>> + * @drrshdr:    DRRS & HDR
>> + * @psrhdr:     PSR & HDR
>> + * @fbcdrrshdr: FBC, DRRS & HDR
>> + * @fbcpsrhdr:  FBC, PSR & HDR
>>    *
>> - * arg[1]:
>> + * arg[2]:
>>    *
>>    * @rgb101010:      FORMAT_RGB101010
>>    * @rgb565:         FORMAT_RGB565
>>    * @argb161616f:    FORMAT_ARGB161616F
>>    * @abgr161616f:    FORMAT_ABGR161616F
>>    *
>> - * arg[2]:
>> + * arg[3]:
>>    *
>>    * @blt:            Blitter
>>    * @mmap-wc:        MMAP-WC
>> @@ -683,58 +441,32 @@
>>    */
>>   
>>   /**
>> - * SUBTEST: drrs-%s-draw-%s
> Same name:
> %s-%s-draw-%s
>
>> - * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
>> - * Driver requirement: i915
>> - *
>> - * SUBTEST: fbc-%s-draw-%s
>> - * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
>> - * Driver requirement: i915
>> - *
>> - * SUBTEST: psr-%s-draw-%s
>> - * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
>> - * Driver requirement: i915
>> - *
>> - * SUBTEST: hdr-%s-draw-%s
>> - * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
>> - * Driver requirement: i915
>> - *
>> - * SUBTEST: fbcdrrs-%s-draw-%s
>> - * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
>> - * Driver requirement: i915
>> - *
>> - * SUBTEST: fbcpsr-%s-draw-%s
>> - * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
>> - * Driver requirement: i915
>> - *
>> - * SUBTEST: fbchdr-%s-draw-%s
>> - * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
>> - * Driver requirement: i915
>> - *
>> - * SUBTEST: drrshdr-%s-draw-%s
>> - * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
>> - * Driver requirement: i915
>> - *
>> - * SUBTEST: psrhdr-%s-draw-%s
>> - * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
>> + * SUBTEST: %s-%s-draw-%s
>> + * Description: Test pixel formats (%arg[2]) that are not FORMAT_DEFAULT using %arg[3] method with %arg[1]
>>    * Driver requirement: i915
>>    *
>> - * SUBTEST: fbcdrrshdr-%s-draw-%s
>> - * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
>> - * Driver requirement: i915
>> + * arg[1]:
>>    *
>> - * SUBTEST: fbcpsrhdr-%s-draw-%s
>> - * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
>> - * Driver requirement: i915
>> + * @drrs:       DRRS
>> + * @fbc:        FBC
>> + * @psr:        PSR
>> + * @hdr:        HDR
>> + * @fbcdrrs:    FBC & DRRS
>> + * @fbcpsr:     FBC & PSR
>> + * @fbchdr:     FBC & HDR
>> + * @drrshdr:    DRRS & HDR
>> + * @psrhdr:     PSR & HDR
>> + * @fbcdrrshdr: FBC, DRRS & HDR
>> + * @fbcpsrhdr:  FBC, PSR & HDR
>>    *
>> - * arg[1]:
>> + * arg[2]:
>>    *
>>    * @rgb101010:      FORMAT_RGB101010
>>    * @rgb565:         FORMAT_RGB565
>>    * @argb161616f:    FORMAT_ARGB161616F
>>    * @abgr161616f:    FORMAT_ABGR161616F
>>    *
>> - * arg[2]:
>> + * arg[3]:
>>    *
>>    * @mmap-cpu:       MMAP-CPU
>>    * @mmap-gtt:       MMAP-GTT
> Move these two and drop hunk.
>
> Regards,
> Kamil
>
>> @@ -742,73 +474,49 @@
>>    */
>>   
>>   /**
>> - * SUBTEST: drrs-slowdraw
>> - * Description: Sleep a little bit between drawing operations with DRRS
>> - *
>> - * SUBTEST: psr-slowdraw
>> - * Description: Sleep a little bit between drawing operations with PSR
>> - *
>> - * SUBTEST: fbcdrrs-slowdraw
>> - * Description: Sleep a little bit between drawing operations with FBC & DRRS
>> + * SUBTEST: %s-slowdraw
>> + * Description: Sleep a little bit between drawing operations with %arg[1]
>>    *
>> - * SUBTEST: fbcpsr-slowdraw
>> - * Description: Sleep a little bit between drawing operations with FBC & PSR
>> - *
>> - * SUBTEST: drrshdr-slowdraw
>> - * Description: Sleep a little bit between drawing operations with DRRS & HDR
>> - *
>> - * SUBTEST: psrhdr-slowdraw
>> - * Description: Sleep a little bit between drawing operations with PSR & HDR
>> + * arg[1]:
>>    *
>> - * SUBTEST: fbcdrrshdr-slowdraw
>> - * Description: Sleep a little bit between drawing operations with DRRS, HDR & FBC
>> + * @drrs:       DRRS
>> + * @psr:        PSR
>> + * @fbcdrrs:    FBC & DRRS
>> + * @fbcpsr:     FBC & PSR
>> + * @drrshdr:    DRRS & HDR
>> + * @psrhdr:     PSR & HDR
>> + * @fbcdrrshdr: FBC, DRRS & HDR
>> + * @fbcpsrhdr:  FBC, PSR & HDR
>>    *
>> - * SUBTEST: fbcpsrhdr-slowdraw
>> - * Description: Sleep a little bit between drawing operations with PSR, HDR & FBC
>>    */
>>   
>>   /**
>> - * SUBTEST: drrs-%dp-primscrn-%s-%sflip-blt
>> - * Description: Just exercise page flips with the patterns we have
>> + * SUBTEST: %s-%dp-primscrn-%s-%sflip-blt
>> + * Description: Exercise %arg[4] page flips on primary screen with %arg[1],
>> + * 		%arg[2] panel(s) and %arg[3] fb
>>    *
>> - * SUBTEST: fbc-%dp-primscrn-%s-%sflip-blt
>> - * Description: Just exercise page flips with the patterns we have
>> - *
>> - * SUBTEST: psr-%dp-primscrn-%s-%sflip-blt
>> - * Description: Just exercise page flips with the patterns we have
>> - *
>> - * SUBTEST: hdr-%dp-primscrn-%s-%sflip-blt
>> - * Description: Just exercise page flips with the patterns we have
>> - *
>> - * SUBTEST: fbcdrrs-%dp-primscrn-%s-%sflip-blt
>> - * Description: Just exercise page flips with the patterns we have
>> - *
>> - * SUBTEST: fbcpsr-%dp-primscrn-%s-%sflip-blt
>> - * Description: Just exercise page flips with the patterns we have
>> - *
>> - * SUBTEST: fbchdr-%dp-primscrn-%s-%sflip-blt
>> - * Description: Just exercise page flips with the patterns we have
>> - *
>> - * SUBTEST: drrshdr-%dp-primscrn-%s-%sflip-blt
>> - * Description: Just exercise page flips with the patterns we have
>> - *
>> - * SUBTEST: psrhdr-%dp-primscrn-%s-%sflip-blt
>> - * Description: Just exercise page flips with the patterns we have
>> - *
>> - * SUBTEST: fbcdrrshdr-%dp-primscrn-%s-%sflip-blt
>> - * Description: Just exercise page flips with the patterns we have
>> + * arg[1]:
>>    *
>> - * SUBTEST: fbcpsrhdr-%dp-primscrn-%s-%sflip-blt
>> - * Description: Just exercise page flips with the patterns we have
>> + * @drrs:       DRRS
>> + * @fbc:        FBC
>> + * @psr:        PSR
>> + * @hdr:        HDR
>> + * @fbcdrrs:    FBC & DRRS
>> + * @fbcpsr:     FBC & PSR
>> + * @fbchdr:     FBC & HDR
>> + * @drrshdr:    DRRS & HDR
>> + * @psrhdr:     PSR & HDR
>> + * @fbcdrrshdr: FBC, DRRS & HDR
>> + * @fbcpsrhdr:  FBC, PSR & HDR
>>    *
>> - * arg[1].values:   1, 2
>> + * arg[2].values:   1, 2
>>    *
>> - * arg[2]:
>> + * arg[3]:
>>    *
>>    * @indfb:          Individual fb
>>    * @shrfb:          Shared fb
>>    *
>> - * arg[3]:
>> + * arg[4]:
>>    *
>>    * @ms:             Modeset
>>    * @pg:             Page flip
>> @@ -816,45 +524,30 @@
>>    */
>>   
>>   /**
>> - * SUBTEST: drrs-2p-scndscrn-%s-%sflip-blt
>> - * Description: Just exercise page flips with the patterns we have
>> + * SUBTEST: %s-2p-scndscrn-%s-%sflip-blt
>> + * Description: Exercise %arg[3] page flips on secondary screen with %arg[1]
>> + * 		and %arg[2] fb
>>    *
>> - * SUBTEST: fbc-2p-scndscrn-%s-%sflip-blt
>> - * Description: Just exercise page flips with the patterns we have
>> - *
>> - * SUBTEST: psr-2p-scndscrn-%s-%sflip-blt
>> - * Description: Just exercise page flips with the patterns we have
>> - *
>> - * SUBTEST: hdr-2p-scndscrn-%s-%sflip-blt
>> - * Description: Just exercise page flips with the patterns we have
>> - *
>> - * SUBTEST: fbcdrrs-2p-scndscrn-%s-%sflip-blt
>> - * Description: Just exercise page flips with the patterns we have
>> - *
>> - * SUBTEST: fbcpsr-2p-scndscrn-%s-%sflip-blt
>> - * Description: Just exercise page flips with the patterns we have
>> - *
>> - * SUBTEST: fbchdr-2p-scndscrn-%s-%sflip-blt
>> - * Description: Just exercise page flips with the patterns we have
>> - *
>> - * SUBTEST: drrshdr-2p-scndscrn-%s-%sflip-blt
>> - * Description: Just exercise page flips with the patterns we have
>> - *
>> - * SUBTEST: psrhdr-2p-scndscrn-%s-%sflip-blt
>> - * Description: Just exercise page flips with the patterns we have
>> - *
>> - * SUBTEST: fbcdrrshdr-2p-scndscrn-%s-%sflip-blt
>> - * Description: Just exercise page flips with the patterns we have
>> + * arg[1]:
>>    *
>> - * SUBTEST: fbcpsrhdr-2p-scndscrn-%s-%sflip-blt
>> - * Description: Just exercise page flips with the patterns we have
>> + * @drrs:       DRRS
>> + * @fbc:        FBC
>> + * @psr:        PSR
>> + * @hdr:        HDR
>> + * @fbcdrrs:    FBC & DRRS
>> + * @fbcpsr:     FBC & PSR
>> + * @fbchdr:     FBC & HDR
>> + * @drrshdr:    DRRS & HDR
>> + * @psrhdr:     PSR & HDR
>> + * @fbcdrrshdr: FBC, DRRS & HDR
>> + * @fbcpsrhdr:  FBC, PSR & HDR
>>    *
>> - * arg[1]:
>> + * arg[2]:
>>    *
>>    * @indfb:          Individual fb
>>    * @shrfb:          Shared fb
>>    *
>> - * arg[2]:
>> + * arg[3]:
>>    *
>>    * @ms:             Modeset
>>    * @pg:             Page flip
>> @@ -862,474 +555,285 @@
>>    */
>>   
>>   /**
>> - * SUBTEST: fbc-%dp-%s-fliptrack-mmap-gtt
>> - * Description: Check if the hardware tracking works after page flips
>> - * Driver requirement: i915
>> - *
>> - * SUBTEST: fbcdrrs-%dp-%s-fliptrack-mmap-gtt
>> - * Description: Check if the hardware tracking works after page flips
>> - * Driver requirement: i915
>> - *
>> - * SUBTEST: fbcpsr-%dp-%s-fliptrack-mmap-gtt
>> - * Description: Check if the hardware tracking works after page flips
>> - * Driver requirement: i915
>> - *
>> - * SUBTEST: fbchdr-%dp-%s-fliptrack-mmap-gtt
>> - * Description: Check if the hardware tracking works after page flips
>> + * SUBTEST: %s-%dp-%s-fliptrack-mmap-gtt
>> + * Description: Check if the hardware tracking works after page flips with %arg[1],
>> + * 		%arg[2] panel(s) and %arg[3] fb
>>    * Driver requirement: i915
>>    *
>> - * SUBTEST: fbcdrrshdr-%dp-%s-fliptrack-mmap-gtt
>> - * Description: Check if the hardware tracking works after page flips
>> - * Driver requirement: i915
>> + * arg[1]:
>>    *
>> - * SUBTEST: fbcpsrhdr-%dp-%s-fliptrack-mmap-gtt
>> - * Description: Check if the hardware tracking works after page flips
>> - * Driver requirement: i915
>> + * @fbc:        FBC
>> + * @fbcdrrs:    FBC & DRRS
>> + * @fbcpsr:     FBC & PSR
>> + * @fbchdr:     FBC & HDR
>> + * @fbcdrrshdr: FBC, DRRS & HDR
>> + * @fbcpsrhdr:  FBC, PSR & HDR
>>    *
>> - * arg[1].values:   1, 2
>> + * arg[2].values:   1, 2
>>    *
>> - * arg[2]:
>> + * arg[3]:
>>    *
>>    * @indfb:          Individual fb
>>    * @shrfb:          Shared fb
>>    */
>>   
>>   /**
>> - * SUBTEST: drrs-%dp-primscrn-%s-indfb-move
>> - * Description: Just move the %arg[2] around
>> + * SUBTEST: %s-%dp-primscrn-%s-indfb-move
>> + * Description: Move %arg[3] around on primary screen with %arg[1],
>> + * 		%arg[2] panel(s) and individual fb
>>    *
>> - * SUBTEST: fbc-%dp-primscrn-%s-indfb-move
>> - * Description: Just move the %arg[2] around
>> - *
>> - * SUBTEST: psr-%dp-primscrn-%s-indfb-move
>> - * Description: Just move the %arg[2] around
>> - *
>> - * SUBTEST: hdr-%dp-primscrn-%s-indfb-move
>> - * Description: Just move the %arg[2] around
>> - *
>> - * SUBTEST: fbcdrrs-%dp-primscrn-%s-indfb-move
>> - * Description: Just move the %arg[2] around
>> - *
>> - * SUBTEST: fbcpsr-%dp-primscrn-%s-indfb-move
>> - * Description: Just move the %arg[2] around
>> - *
>> - * SUBTEST: fbchdr-%dp-primscrn-%s-indfb-move
>> - * Description: Just move the %arg[2] around
>> - *
>> - * SUBTEST: drrshdr-%dp-primscrn-%s-indfb-move
>> - * Description: Just move the %arg[2] around
>> - *
>> - * SUBTEST: psrhdr-%dp-primscrn-%s-indfb-move
>> - * Description: Just move the %arg[2] around
>> - *
>> - * SUBTEST: fbcdrrshdr-%dp-primscrn-%s-indfb-move
>> - * Description: Just move the %arg[2] around
>> + * arg[1]:
>>    *
>> - * SUBTEST: fbcpsrhdr-%dp-primscrn-%s-indfb-move
>> - * Description: Just move the %arg[2] around
>> + * @drrs:       DRRS
>> + * @fbc:        FBC
>> + * @psr:        PSR
>> + * @hdr:        HDR
>> + * @fbcdrrs:    FBC & DRRS
>> + * @fbcpsr:     FBC & PSR
>> + * @fbchdr:     FBC & HDR
>> + * @drrshdr:    DRRS & HDR
>> + * @psrhdr:     PSR & HDR
>> + * @fbcdrrshdr: FBC, DRRS & HDR
>> + * @fbcpsrhdr:  FBC, PSR & HDR
>>    *
>> - * arg[1].values:   1, 2
>> + * arg[2].values:   1, 2
>>    *
>> - * arg[2]:
>> + * arg[3]:
>>    *
>>    * @spr:            Sprite plane
>>    * @cur:            Cursor plane
>>    */
>>   
>>   /**
>> - * SUBTEST: drrs-2p-scndscrn-%s-indfb-move
>> - * Description: Just move the %arg[1] around
>> - *
>> - * SUBTEST: fbc-2p-scndscrn-%s-indfb-move
>> - * Description: Just move the %arg[1] around
>> + * SUBTEST: %s-2p-scndscrn-%s-indfb-move
>> + * Description: Move %arg[2] around on secondary screen with %arg[1] and individual fb
>>    *
>> - * SUBTEST: psr-2p-scndscrn-%s-indfb-move
>> - * Description: Just move the %arg[1] around
>> - *
>> - * SUBTEST: hdr-2p-scndscrn-%s-indfb-move
>> - * Description: Just move the %arg[1] around
>> - *
>> - * SUBTEST: fbcdrrs-2p-scndscrn-%s-indfb-move
>> - * Description: Just move the %arg[1] around
>> - *
>> - * SUBTEST: fbcpsr-2p-scndscrn-%s-indfb-move
>> - * Description: Just move the %arg[1] around
>> - *
>> - * SUBTEST: fbchdr-2p-scndscrn-%s-indfb-move
>> - * Description: Just move the %arg[1] around
>> - *
>> - * SUBTEST: drrshdr-2p-scndscrn-%s-indfb-move
>> - * Description: Just move the %arg[1] around
>> - *
>> - * SUBTEST: psrhdr-2p-scndscrn-%s-indfb-move
>> - * Description: Just move the %arg[1] around
>> - *
>> - * SUBTEST: fbcdrrshdr-2p-scndscrn-%s-indfb-move
>> - * Description: Just move the %arg[1] around
>> + * arg[1]:
>>    *
>> - * SUBTEST: fbcpsrhdr-2p-scndscrn-%s-indfb-move
>> - * Description: Just move the %arg[1] around
>> + * @drrs:       DRRS
>> + * @fbc:        FBC
>> + * @psr:        PSR
>> + * @hdr:        HDR
>> + * @fbcdrrs:    FBC & DRRS
>> + * @fbcpsr:     FBC & PSR
>> + * @fbchdr:     FBC & HDR
>> + * @drrshdr:    DRRS & HDR
>> + * @psrhdr:     PSR & HDR
>> + * @fbcdrrshdr: FBC, DRRS & HDR
>> + * @fbcpsrhdr:  FBC, PSR & HDR
>>    *
>> - * arg[1]:
>> + * arg[2]:
>>    *
>>    * @spr:            Sprite plane
>>    * @cur:            Cursor plane
>>    */
>>   
>>   /**
>> - * SUBTEST: drrs-%dp-primscrn-%s-indfb-onoff
>> - * Description: Just enable and disable the %arg[2] a few times
>> - *
>> - * SUBTEST: fbc-%dp-primscrn-%s-indfb-onoff
>> - * Description: Just enable and disable the %arg[2] a few times
>> + * SUBTEST: %s-%dp-primscrn-%s-indfb-onoff
>> + * Description: Enable and disable %arg[3] a few times on primary screen with %arg[1],
>> + * 		%arg[2] panel(s) and individual fb
>>    *
>> - * SUBTEST: psr-%dp-primscrn-%s-indfb-onoff
>> - * Description: Just enable and disable the %arg[2] a few times
>> - *
>> - * SUBTEST: hdr-%dp-primscrn-%s-indfb-onoff
>> - * Description: Just enable and disable the %arg[2] a few times
>> - *
>> - * SUBTEST: fbcdrrs-%dp-primscrn-%s-indfb-onoff
>> - * Description: Just enable and disable the %arg[2] a few times
>> - *
>> - * SUBTEST: fbcpsr-%dp-primscrn-%s-indfb-onoff
>> - * Description: Just enable and disable the %arg[2] a few times
>> - *
>> - * SUBTEST: fbchdr-%dp-primscrn-%s-indfb-onoff
>> - * Description: Just enable and disable the %arg[2] a few times
>> - *
>> - * SUBTEST: drrshdr-%dp-primscrn-%s-indfb-onoff
>> - * Description: Just enable and disable the %arg[2] a few times
>> - *
>> - * SUBTEST: psrhdr-%dp-primscrn-%s-indfb-onoff
>> - * Description: Just enable and disable the %arg[2] a few times
>> - *
>> - * SUBTEST: fbcdrrshdr-%dp-primscrn-%s-indfb-onoff
>> - * Description: Just enable and disable the %arg[2] a few times
>> + * arg[1]:
>>    *
>> - * SUBTEST: fbcpsrhdr-%dp-primscrn-%s-indfb-onoff
>> - * Description: Just enable and disable the %arg[2] a few times
>> + * @drrs:       DRRS
>> + * @fbc:        FBC
>> + * @psr:        PSR
>> + * @hdr:        HDR
>> + * @fbcdrrs:    FBC & DRRS
>> + * @fbcpsr:     FBC & PSR
>> + * @fbchdr:     FBC & HDR
>> + * @drrshdr:    DRRS & HDR
>> + * @psrhdr:     PSR & HDR
>> + * @fbcdrrshdr: FBC, DRRS & HDR
>> + * @fbcpsrhdr:  FBC, PSR & HDR
>>    *
>> - * arg[1].values:   1, 2
>> + * arg[2].values:   1, 2
>>    *
>> - * arg[2]:
>> + * arg[3]:
>>    *
>>    * @spr:            Sprite plane
>>    * @cur:            Cursor plane
>>    */
>>   
>>   /**
>> - * SUBTEST: drrs-2p-scndscrn-%s-indfb-onoff
>> - * Description: Just enable and disable the %arg[1] a few times
>> - *
>> - * SUBTEST: fbc-2p-scndscrn-%s-indfb-onoff
>> - * Description: Just enable and disable the %arg[1] a few times
>> - *
>> - * SUBTEST: psr-2p-scndscrn-%s-indfb-onoff
>> - * Description: Just enable and disable the %arg[1] a few times
>> + * SUBTEST: %s-2p-scndscrn-%s-indfb-onoff
>> + * Description: Enable and disable %arg[2] a few times on secondary screen with %arg[1] and individual fb
>>    *
>> - * SUBTEST: hdr-2p-scndscrn-%s-indfb-onoff
>> - * Description: Just enable and disable the %arg[1] a few times
>> - *
>> - * SUBTEST: fbcdrrs-2p-scndscrn-%s-indfb-onoff
>> - * Description: Just enable and disable the %arg[1] a few times
>> - *
>> - * SUBTEST: fbcpsr-2p-scndscrn-%s-indfb-onoff
>> - * Description: Just enable and disable the %arg[1] a few times
>> - *
>> - * SUBTEST: fbchdr-2p-scndscrn-%s-indfb-onoff
>> - * Description: Just enable and disable the %arg[1] a few times
>> - *
>> - * SUBTEST: drrshdr-2p-scndscrn-%s-indfb-onoff
>> - * Description: Just enable and disable the %arg[1] a few times
>> - *
>> - * SUBTEST: psrhdr-2p-scndscrn-%s-indfb-onoff
>> - * Description: Just enable and disable the %arg[1] a few times
>> - *
>> - * SUBTEST: fbcdrrshdr-2p-scndscrn-%s-indfb-onoff
>> - * Description: Just enable and disable the %arg[1] a few times
>> + * arg[1]:
>>    *
>> - * SUBTEST: fbcpsrhdr-2p-scndscrn-%s-indfb-onoff
>> - * Description: Just enable and disable the %arg[1] a few times
>> + * @drrs:       DRRS
>> + * @fbc:        FBC
>> + * @psr:        PSR
>> + * @hdr:        HDR
>> + * @fbcdrrs:    FBC & DRRS
>> + * @fbcpsr:     FBC & PSR
>> + * @fbchdr:     FBC & HDR
>> + * @drrshdr:    DRRS & HDR
>> + * @psrhdr:     PSR & HDR
>> + * @fbcdrrshdr: FBC, DRRS & HDR
>> + * @fbcpsrhdr:  FBC, PSR & HDR
>>    *
>> - * arg[1]:
>> + * arg[2]:
>>    *
>>    * @spr:            Sprite plane
>>    * @cur:            Cursor plane
>>    */
>>   
>>   /**
>> - * SUBTEST: drrs-%dp-primscrn-spr-indfb-fullscreen
>> - * Description: Put a fullscreen plane covering the whole screen
>> - *
>> - * SUBTEST: fbc-%dp-primscrn-spr-indfb-fullscreen
>> - * Description: Put a fullscreen plane covering the whole screen
>> - *
>> - * SUBTEST: psr-%dp-primscrn-spr-indfb-fullscreen
>> - * Description: Put a fullscreen plane covering the whole screen
>> - *
>> - * SUBTEST: hdr-%dp-primscrn-spr-indfb-fullscreen
>> - * Description: Put a fullscreen plane covering the whole screen
>> + * SUBTEST: %s-%dp-primscrn-spr-indfb-fullscreen
>> + * Description: Put a fullscreen sprite plane covering the primary screen with %arg[1],
>> + * 		%arg[2] panel(s) and individual fb
>>    *
>> - * SUBTEST: fbcdrrs-%dp-primscrn-spr-indfb-fullscreen
>> - * Description: Put a fullscreen plane covering the whole screen
>> - *
>> - * SUBTEST: fbcpsr-%dp-primscrn-spr-indfb-fullscreen
>> - * Description: Put a fullscreen plane covering the whole screen
>> - *
>> - * SUBTEST: fbchdr-%dp-primscrn-spr-indfb-fullscreen
>> - * Description: Put a fullscreen plane covering the whole screen
>> - *
>> - * SUBTEST: drrshdr-%dp-primscrn-spr-indfb-fullscreen
>> - * Description: Put a fullscreen plane covering the whole screen
>> - *
>> - * SUBTEST: psrhdr-%dp-primscrn-spr-indfb-fullscreen
>> - * Description: Put a fullscreen plane covering the whole screen
>> - *
>> - * SUBTEST: fbcdrrshdr-%dp-primscrn-spr-indfb-fullscreen
>> - * Description: Put a fullscreen plane covering the whole screen
>> - *
>> - * SUBTEST: fbcpsrhdr-%dp-primscrn-spr-indfb-fullscreen
>> - * Description: Put a fullscreen plane covering the whole screen
>> - *
>> - * SUBTEST: drrs-2p-scndscrn-spr-indfb-fullscreen
>> - * Description: Put a fullscreen plane covering the whole screen
>> - *
>> - * SUBTEST: fbc-2p-scndscrn-spr-indfb-fullscreen
>> - * Description: Put a fullscreen plane covering the whole screen
>> - *
>> - * SUBTEST: psr-2p-scndscrn-spr-indfb-fullscreen
>> - * Description: Put a fullscreen plane covering the whole screen
>> - *
>> - * SUBTEST: hdr-2p-scndscrn-spr-indfb-fullscreen
>> - * Description: Put a fullscreen plane covering the whole screen
>> - *
>> - * SUBTEST: fbcdrrs-2p-scndscrn-spr-indfb-fullscreen
>> - * Description: Put a fullscreen plane covering the whole screen
>> - *
>> - * SUBTEST: fbcpsr-2p-scndscrn-spr-indfb-fullscreen
>> - * Description: Put a fullscreen plane covering the whole screen
>> - *
>> - * SUBTEST: fbchdr-2p-scndscrn-spr-indfb-fullscreen
>> - * Description: Put a fullscreen plane covering the whole screen
>> - *
>> - * SUBTEST: drrshdr-2p-scndscrn-spr-indfb-fullscreen
>> - * Description: Put a fullscreen plane covering the whole screen
>> - *
>> - * SUBTEST: psrhdr-2p-scndscrn-spr-indfb-fullscreen
>> - * Description: Put a fullscreen plane covering the whole screen
>> + * arg[1]:
>>    *
>> - * SUBTEST: fbcdrrshdr-2p-scndscrn-spr-indfb-fullscreen
>> - * Description: Put a fullscreen plane covering the whole screen
>> + * @drrs:       DRRS
>> + * @fbc:        FBC
>> + * @psr:        PSR
>> + * @hdr:        HDR
>> + * @fbcdrrs:    FBC & DRRS
>> + * @fbcpsr:     FBC & PSR
>> + * @fbchdr:     FBC & HDR
>> + * @drrshdr:    DRRS & HDR
>> + * @psrhdr:     PSR & HDR
>> + * @fbcdrrshdr: FBC, DRRS & HDR
>> + * @fbcpsrhdr:  FBC, PSR & HDR
>> + *
>> + * arg[2].values:   1, 2
>> + * SUBTEST: %s-2p-scndscrn-spr-indfb-fullscreen
>> + * Description: Put a fullscreen sprite plane covering the secondary screen with %arg[1] and individual fb
>>    *
>> - * SUBTEST: fbcpsrhdr-2p-scndscrn-spr-indfb-fullscreen
>> - * Description: Put a fullscreen plane covering the whole screen
>> + * arg[1]:
>>    *
>> - * arg[1].values:   1, 2
>> + * @drrs:       DRRS
>> + * @fbc:        FBC
>> + * @psr:        PSR
>> + * @hdr:        HDR
>> + * @fbcdrrs:    FBC & DRRS
>> + * @fbcpsr:     FBC & PSR
>> + * @fbchdr:     FBC & HDR
>> + * @drrshdr:    DRRS & HDR
>> + * @psrhdr:     PSR & HDR
>> + * @fbcdrrshdr: FBC, DRRS & HDR
>> + * @fbcpsrhdr:  FBC, PSR & HDR
>> + *
>> + * arg[2].values:   1, 2
>>    */
>>   
>>   /**
>> - * SUBTEST: drrs-%s-scaledprimary
>> - * Description: Try different primary plane scaling strategies
>> - *
>> - * SUBTEST: fbc-%s-scaledprimary
>> - * Description: Try different primary plane scaling strategies
>> - *
>> - * SUBTEST: psr-%s-scaledprimary
>> - * Description: Try different primary plane scaling strategies
>> - *
>> - * SUBTEST: hdr-%s-scaledprimary
>> - * Description: Try different primary plane scaling strategies
>> - *
>> - * SUBTEST: fbcdrrs-%s-scaledprimary
>> - * Description: Try different primary plane scaling strategies
>> - *
>> - * SUBTEST: fbcpsr-%s-scaledprimary
>> - * Description: Try different primary plane scaling strategies
>> - *
>> - * SUBTEST: fbchdr-%s-scaledprimary
>> - * Description: Try different primary plane scaling strategies
>> - *
>> - * SUBTEST: drrshdr-%s-scaledprimary
>> - * Description: Try different primary plane scaling strategies
>> + * SUBTEST: %s-%s-scaledprimary
>> + * Description: Try different primary plane scaling strategies with %arg[1] and %arg[2] fb
>>    *
>> - * SUBTEST: psrhdr-%s-scaledprimary
>> - * Description: Try different primary plane scaling strategies
>> - *
>> - * SUBTEST: fbcdrrshdr-%s-scaledprimary
>> - * Description: Try different primary plane scaling strategies
>> + * arg[1]:
>>    *
>> - * SUBTEST: fbcpsrhdr-%s-scaledprimary
>> - * Description: Try different primary plane scaling strategies
>> + * @drrs:       DRRS
>> + * @fbc:        FBC
>> + * @psr:        PSR
>> + * @hdr:        HDR
>> + * @fbcdrrs:    FBC & DRRS
>> + * @fbcpsr:     FBC & PSR
>> + * @fbchdr:     FBC & HDR
>> + * @drrshdr:    DRRS & HDR
>> + * @psrhdr:     PSR & HDR
>> + * @fbcdrrshdr: FBC, DRRS & HDR
>> + * @fbcpsrhdr:  FBC, PSR & HDR
>>    *
>> - * arg[1]:
>> + * arg[2]:
>>    *
>>    * @indfb:          Individual fb
>>    * @shrfb:          Shared fb
>>    */
>>   
>>   /**
>> - * SUBTEST: drrs-modesetfrombusy
>> - * Description: Modeset from a busy buffer to a non-busy buffer with DRRS
>> - *
>> - * SUBTEST: fbc-modesetfrombusy
>> - * Description: Modeset from a busy buffer to a non-busy buffer with FBC
>> - *
>> - * SUBTEST: psr-modesetfrombusy
>> - * Description: Modeset from a busy buffer to a non-busy buffer with PSR
>> + * SUBTEST: %s-modesetfrombusy
>> + * Description: Modeset from a busy buffer to a non-busy buffer with %arg[1]
>>    *
>> - * SUBTEST: hdr-modesetfrombusy
>> - * Description: Modeset from a busy buffer to a non-busy buffer with HDR
>> - *
>> - * SUBTEST: fbcdrrs-modesetfrombusy
>> - * Description: Modeset from a busy buffer to a non-busy buffer with FBC & DRRS
>> - *
>> - * SUBTEST: fbcpsr-modesetfrombusy
>> - * Description: Modeset from a busy buffer to a non-busy buffer with FBC & PSR
>> - *
>> - * SUBTEST: fbchdr-modesetfrombusy
>> - * Description: Modeset from a busy buffer to a non-busy buffer with FBC & HDR
>> - *
>> - * SUBTEST: drrshdr-modesetfrombusy
>> - * Description: Modeset from a busy buffer to a non-busy buffer with DRRS & HDR
>> - *
>> - * SUBTEST: psrhdr-modesetfrombusy
>> - * Description: Modeset from a busy buffer to a non-busy buffer with HDR & PSR
>> + * arg[1]:
>>    *
>> - * SUBTEST: fbcdrrshdr-modesetfrombusy
>> - * Description: Modeset from a busy buffer to a non-busy buffer with DRRS, HDR & FBC
>> + * @drrs:       DRRS
>> + * @fbc:        FBC
>> + * @psr:        PSR
>> + * @hdr:        HDR
>> + * @fbcdrrs:    FBC & DRRS
>> + * @fbcpsr:     FBC & PSR
>> + * @fbchdr:     FBC & HDR
>> + * @drrshdr:    DRRS & HDR
>> + * @psrhdr:     PSR & HDR
>> + * @fbcdrrshdr: FBC, DRRS & HDR
>> + * @fbcpsrhdr:  FBC, PSR & HDR
>>    *
>> - * SUBTEST: fbcpsrhdr-modesetfrombusy
>> - * Description: Modeset from a busy buffer to a non-busy buffer with HDR, PSR & FBC
>>    */
>>   
>>   /**
>> - * SUBTEST: drrs-suspend
>> - * Description: Make sure suspend/resume keeps us on the same state of DRRS
>> + * SUBTEST: %s-suspend
>> + * Description: Make sure suspend/resume keeps us on the same state of %arg[1]
>>    *
>> - * SUBTEST: fbc-suspend
>> - * Description: Make sure suspend/resume keeps us on the same state of FBC
>> - *
>> - * SUBTEST: psr-suspend
>> - * Description: Make sure suspend/resume keeps us on the same state of PSR
>> - *
>> - * SUBTEST: hdr-suspend
>> - * Description: Make sure suspend/resume keeps us on the same state of HDR
>> - *
>> - * SUBTEST: fbcdrrs-suspend
>> - * Description: Make sure suspend/resume keeps us on the same state of FBC & DRRS
>> - *
>> - * SUBTEST: fbcpsr-suspend
>> - * Description: Make sure suspend/resume keeps us on the same state of FBC & PSR
>> - *
>> - * SUBTEST: fbchdr-suspend
>> - * Description: Make sure suspend/resume keeps us on the same state of FBC & HDR
>> - *
>> - * SUBTEST: drrshdr-suspend
>> - * Description: Make sure suspend/resume keeps us on the same state of HDR & DRRS
>> - *
>> - * SUBTEST: psrhdr-suspend
>> - * Description: Make sure suspend/resume keeps us on the same state of HDR & PSR
>> + * arg[1]:
>>    *
>> - * SUBTEST: fbcdrrshdr-suspend
>> - * Description: Make sure suspend/resume keeps us on the same state of HDR, DRRS & FBC
>> + * @drrs:       DRRS
>> + * @fbc:        FBC
>> + * @psr:        PSR
>> + * @hdr:        HDR
>> + * @fbcdrrs:    FBC & DRRS
>> + * @fbcpsr:     FBC & PSR
>> + * @fbchdr:     FBC & HDR
>> + * @drrshdr:    DRRS & HDR
>> + * @psrhdr:     PSR & HDR
>> + * @fbcdrrshdr: FBC, DRRS & HDR
>> + * @fbcpsrhdr:  FBC, PSR & HDR
>>    *
>> - * SUBTEST: fbcpsrhdr-suspend
>> - * Description: Make sure suspend/resume keeps us on the same state of HDR, PSR & FBC
>>    */
>>   
>>   /**
>> - * SUBTEST: drrs-farfromfence-mmap-gtt
>> - * Description: Test drawing as far from the fence start as possible
>> - * Driver requirement: i915
>> - *
>> - * SUBTEST: fbc-farfromfence-mmap-gtt
>> - * Description: Test drawing as far from the fence start as possible
>> - * Driver requirement: i915
>> - *
>> - * SUBTEST: psr-farfromfence-mmap-gtt
>> - * Description: Test drawing as far from the fence start as possible
>> + * SUBTEST: %s-farfromfence-mmap-gtt
>> + * Description: Test drawing as far from the fence start as possible with %arg[1]
>>    * Driver requirement: i915
>>    *
>> - * SUBTEST: hdr-farfromfence-mmap-gtt
>> - * Description: Test drawing as far from the fence start as possible
>> - * Driver requirement: i915
>> - *
>> - * SUBTEST: fbcdrrs-farfromfence-mmap-gtt
>> - * Description: Test drawing as far from the fence start as possible
>> - * Driver requirement: i915
>> - *
>> - * SUBTEST: fbcpsr-farfromfence-mmap-gtt
>> - * Description: Test drawing as far from the fence start as possible
>> - * Driver requirement: i915
>> - *
>> - * SUBTEST: fbchdr-farfromfence-mmap-gtt
>> - * Description: Test drawing as far from the fence start as possible
>> - * Driver requirement: i915
>> - *
>> - * SUBTEST: drrshdr-farfromfence-mmap-gtt
>> - * Description: Test drawing as far from the fence start as possible
>> - * Driver requirement: i915
>> + * arg[1]:
>>    *
>> - * SUBTEST: psrhdr-farfromfence-mmap-gtt
>> - * Description: Test drawing as far from the fence start as possible
>> - * Driver requirement: i915
>> + * @drrs:       DRRS
>> + * @fbc:        FBC
>> + * @psr:        PSR
>> + * @hdr:        HDR
>> + * @fbcdrrs:    FBC & DRRS
>> + * @fbcpsr:     FBC & PSR
>> + * @fbchdr:     FBC & HDR
>> + * @drrshdr:    DRRS & HDR
>> + * @psrhdr:     PSR & HDR
>> + * @fbcdrrshdr: FBC, DRRS & HDR
>> + * @fbcpsrhdr:  FBC, PSR & HDR
>>    *
>> - * SUBTEST: fbcdrrshdr-farfromfence-mmap-gtt
>> - * Description: Test drawing as far from the fence start as possible
>> - * Driver requirement: i915
>> - *
>> - * SUBTEST: fbcpsrhdr-farfromfence-mmap-gtt
>> - * Description: Test drawing as far from the fence start as possible
>> - * Driver requirement: i915
>>    */
>>   
>>   /**
>> - * SUBTEST: fbc-stridechange
>> - * Description: Change the frontbuffer stride by doing a modeset
>> - *
>> - * SUBTEST: fbcdrrs-stridechange
>> - * Description: Change the frontbuffer stride by doing a modeset
>> + * SUBTEST: %s-stridechange
>> + * Description: Change the frontbuffer stride by doing a modeset with %arg[1]
>>    *
>> - * SUBTEST: fbcpsr-stridechange
>> - * Description: Change the frontbuffer stride by doing a modeset
>> - *
>> - * SUBTEST: fbchdr-stridechange
>> - * Description: Change the frontbuffer stride by doing a modeset
>> + * arg[1]:
>>    *
>> - * SUBTEST: fbcdrrshdr-stridechange
>> - * Description: Change the frontbuffer stride by doing a modeset
>> + * @fbc:        FBC
>> + * @fbcdrrs:    FBC & DRRS
>> + * @fbcpsr:     FBC & PSR
>> + * @fbchdr:     FBC & HDR
>> + * @fbcdrrshdr: FBC, DRRS & HDR
>> + * @fbcpsrhdr:  FBC, PSR & HDR
>>    *
>> - * SUBTEST: fbcpsrhdr-stridechange
>> - * Description: Change the frontbuffer stride by doing a modeset
>>    */
>>   
>>   /**
>> - * SUBTEST: fbc-tiling-%s
>> - * Description: Test %arg[1] formats, if the tiling format supports FBC do the
>> - *              basic drawing test, else set the mode & test if FBC is disabled
>> - *
>> - * SUBTEST: fbcdrrs-tiling-%s
>> - * Description: Test %arg[1] formats, if the tiling format supports FBC do the
>> - *              basic drawing test, else set the mode & test if FBC is disabled
>> + * SUBTEST: %s-tiling-%s
>> + * Description: Test %arg[2] formats with %arg[1], if the tiling format supports
>> + * 		FBC do the basic drawing test, else set the mode & test if FBC is disabled
>>    *
>> - * SUBTEST: fbcpsr-tiling-%s
>> - * Description: Test %arg[1] formats, if the tiling format supports FBC do the
>> - *              basic drawing test, else set the mode & test if FBC is disabled
>> - *
>> - * SUBTEST: fbchdr-tiling-%s
>> - * Description: Test %arg[1] formats, if the tiling format supports FBC do the
>> - *              basic drawing test, else set the mode & test if FBC is disabled
>> - *
>> - * SUBTEST: fbcdrrshdr-tiling-%s
>> - * Description: Test %arg[1] formats, if the tiling format supports FBC do the
>> - *              basic drawing test, else set the mode & test if FBC is disabled
>> + * arg[1]:
>>    *
>> - * SUBTEST: fbcpsrhdr-tiling-%s
>> - * Description: Test %arg[1] formats, if the tiling format supports FBC do the
>> - *              basic drawing test, else set the mode & test if FBC is disabled
>> + * @fbc:        FBC
>> + * @fbcdrrs:    FBC & DRRS
>> + * @fbcpsr:     FBC & PSR
>> + * @fbchdr:     FBC & HDR
>> + * @fbcdrrshdr: FBC, DRRS & HDR
>> + * @fbcpsrhdr:  FBC, PSR & HDR
>>    *
>> - * arg[1]:
>> + * arg[2]:
>>    *
>>    * @4:              4 tiling
>>    * @linear:         Linear tiling
>> -- 
>> 2.25.1
>>
