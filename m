Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A1B7CD4F54
	for <igt-dev@archiver.kernel.org>; Wed, 20 May 2026 03:05:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E30AB10E625;
	Wed, 20 May 2026 03:05:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fV8SEidM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CADCC10EECE
 for <igt-dev@lists.freedesktop.org>; Wed, 20 May 2026 03:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779246309; x=1810782309;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gApowY3Whv2ZTjmzDmMrZ+eqJ+eXScEWLzIHWiVIWgI=;
 b=fV8SEidMQ43jblURI4CoQ/HgT+o2cBqWNPE/nACBYfMpqCQglhtVfaNF
 2TtKO5+N/OtPru7pJNcW7uaIz9u7dBQs/0KzeB0cHJLBdHF2BM4H1iplW
 p9ODHI3cVbmvHXgTbmFW3ypCcKaUjt4ovLjuYLLuKTeGpCPdN61YWPC92
 QK1fACTRIydJ6bMj07nz8RUuOMDq1qkuQ5UuydaGnKvXP8yJQO0svMeba
 4VJ8xhvffBXOc2bGA+E9XPUSZnP7TqT+cavPlHzO481WBFHZ9uoSSIFfz
 T3VVVaM2x37X+HcVdJFvrD4Pl2k3ePpzhHh19lu4b1w12vEQhSyRSzt/o Q==;
X-CSE-ConnectionGUID: QNQc39Q1SsaLMwZrI36B6w==
X-CSE-MsgGUID: FGbIncWbTVykzzVKMlt/Ig==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="79986549"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="79986549"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2026 20:05:08 -0700
X-CSE-ConnectionGUID: PjRRuxkHSIqtyz7ijRpgQA==
X-CSE-MsgGUID: 0BYu1ieJSYa0L1wtaDxXYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="270340987"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2026 20:05:08 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 19 May 2026 20:05:07 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 19 May 2026 20:05:07 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.63) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 19 May 2026 20:05:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OtKlILZRSe9LJ6r3smNQuIkZn3EM9l/zSdWTXVGLFbuvELGEjd0gteH3wXBRM0WG9SvvlQAdOHLeZAGcCDw55d+fsy3hoBIagSKY5oTf0q4RAm88LjILihUEPP95j4ZHVtNVJw6pnDOssAwfE1PWbxxlxvbGporDLKEoPq/lP4k4Mt1lUuu+7OYp7j3K+LtuB8HmCuTsLt4ds/qoK8t5qwFGkTDwkhjYsSqnauhPkolrBYYyfBO/KH1Ypxqy03MjDurUXLOfbjL+zfxCj4dKgxNheuUqaGjBD9iaoBHdd++6PjbNREeHx0sKBacVllbmgLNzQ9XLmdwdP9IqvUxeag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t8V6GqGweJ6+4nKGexM2GeQ+UiQO2gayR1RIj5I4Vp4=;
 b=KKSlAVIkUMxUcDGT3whZR16hw/MMKAr/Xa20jUP/Ac4X7vfUm6NI2DdXvHeaBlCneGxx00Kjl8omzE8DiSuZnX48kYidtckoH1Tkm58ROoOqfoYbnl6xB4C1kWHpBI6aegYavnpfZDHk+sCdCwhrjKD/zSDn+j1x4kwcsBmiOo0XgXEFVpLEONZiDmhrFzgHFM7oAIoqZdvmu/AFs8/bKSYZBUFaHrUWozhCvNCj8m+Wp9SoKKDUpe9Ata0o1UcJoU4vaagJBaTR09sHn5lW6U2qPHV614RMDDfzdmLSDicngBsgesIJjEYI4WcO4F36mvukg1KtRikEyMS4XONBsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by PH7PR11MB7097.namprd11.prod.outlook.com (2603:10b6:510:20c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.21; Wed, 20 May
 2026 03:05:04 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%7]) with mapi id 15.21.0048.013; Wed, 20 May 2026
 03:05:03 +0000
Message-ID: <2d5fe5d1-af91-47ec-9779-c0ef1e76a58a@intel.com>
Date: Wed, 20 May 2026 08:34:56 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/3] Revert "tests/kms_hdr: Move capability checks
 inside dynamic subtests"
To: Pranay Samala <pranay.samala@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <sameer.lattannavar@intel.com>
References: <20260518040353.212734-1-pranay.samala@intel.com>
 <20260518040353.212734-2-pranay.samala@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20260518040353.212734-2-pranay.samala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0189.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b6::11) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|PH7PR11MB7097:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f7174e3-3f31-4371-f16d-08deb61c9658
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|42112799006|376014|366016|3023799007|11063799006|22082099003|56012099003|4143699003|18002099003;
X-Microsoft-Antispam-Message-Info: Havo2B3VIoEzSfSKNwcQMI21vaL74VISgWTcR5LdevmVJQeV6L1xwglnMmsEqkrqSvzVZLtEr7lfHR5dlFXWeGUckJM5gBluEhIDZPJkXb87r80oiBIb7+WK90rDHn1X59wOdE3yyG/SIvw4Pgl7RPwdu9b07bWp82y6/fMrJ6iNMa9FeehtsB4Bta7JxT6/ZIdDFYJZ7rz4UjZgfprr1Q31gL4hPSk0IlKzAt4ErEDYRGxmQ2Lj4DnaMH9O+GXfpsE2zWJiqCERYcot3HtMig07uHMFeTuivgyIw/JYZpdn6m56a9jPCsr8C1k8ojv0dNz5y6xE95L4nBRLm/FSN5KUlPXDvQrViob9BlwcUt9KOLm0vI4EC/WyjT4ahLNfh1guX3BJwNxQWH6iipUp1i/Mr3YeFmBhx4r7NdKmV3NzuW9704FlOIFpmRkOvqRMy6Iv/VExC5/mKD00xOh0T4APlIcwwIDbuXeCBmaSwlICUlmayErdRp6maviY5O0O5+Pv7HuBs1NBcikGE4DLY0HNfqnBVoEM0WrppQmQjg82MDj84snZ/hO4Sjsuk4qEo1bm8insmgy65ZY1+ZI1fKZj9pKzDh/QgMkStVf/nKu5F8GWi2qx7YDzSQa37VC8Nb3kiInpXTsRUzGzmbJdfIkwHLpkPykW1thgJSppdxgjKMAaj7qNbstf8VDNcb1I
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(42112799006)(376014)(366016)(3023799007)(11063799006)(22082099003)(56012099003)(4143699003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MTZoTktxUWgxa01Jc1Q4dXlXYjlEVVo4UWR3ZU5YaStiK3VFdE1hbVZYcU5V?=
 =?utf-8?B?VEZzTnNrR09Wb2FiZDYzM1dxTFFhaUJtOWt0em1HcVVuLzF2OUl3YzFhc0lj?=
 =?utf-8?B?WHc5QUNxcmN0SmkrR0lnZWJFTUNsZCsvRndtUE5wem5FRm94SDIwSHlmR21z?=
 =?utf-8?B?VjEyNWlOcDVyRm1CeG9JTlFxenRGZG81enl2OEJibE80dWtOZVNjRWFIdG4z?=
 =?utf-8?B?TEVteXNpa2QxVDFYa0ZWbHRMcWpTNFRHa3Q2T2tUVjdtTlNobEhleFMvTG8x?=
 =?utf-8?B?YUt2a1dsWnNDcUxHQlkxVlFpRi9VeGpmaU14N21kOFZteXVIclc0WW5IbnF4?=
 =?utf-8?B?OUpkUFNtbE9vTjkrVURvMTJOWEhWNkNVTjk1cDZMQVovcS9Nb0NSQnJ6SjBo?=
 =?utf-8?B?OGtyVUhkUVpaYzRuUnVoRHN5UnJPZ3NpcDB0ekRla1FRUzJvWm9UbUZVUDRO?=
 =?utf-8?B?MXYvY0pPNGJjVE40OFAwZVlGUjRMMHU3NENBWGhQSS9XOUlFTHBON2M3a242?=
 =?utf-8?B?aGtWNEtnTDdZTEdXZmlWY1lxdHJmSVh3Y1pRM2NXOFhSL05GdmhpOGppTGly?=
 =?utf-8?B?R3Q5L3pvWVhXWSs4K2tFM1lkQnBqY1VHeGNGN0pGTUpXdjhBZHhRUDJBRVBv?=
 =?utf-8?B?NmlacDhLajAzYmVITkZhK1BGQWZJMWxQTGZoL0dNV0U4cUJNRnhjV25FV0Zt?=
 =?utf-8?B?YmxXWmFob2lQazY5NUFwNWVia3pxR25oNnNIWVNxVVBXN3puMHFEWDVyYjd0?=
 =?utf-8?B?YUF0TDRKOGNxcXJIa1JxZHVUVWVJY0NNanZwNzJpZHo0Vmw5UXVYRXF3V3V2?=
 =?utf-8?B?SmhLejhzTHlDdzV2OEJIVXk2bUowcW5WNlZBYTkwL0JvYmUrN3grSzhMYUN4?=
 =?utf-8?B?dlBUZW9TRHhpdWRhVkVXYnZEMkluQklyNG1LdUp1UDVSSTBpK0ZrNTBybzdw?=
 =?utf-8?B?L0E3WGlzTzhuc3E1WW84UWEvNG1Ia0FCQ3dER00yam5WSlBIQk4zVWRlbXRG?=
 =?utf-8?B?N01ISXNkTWFSOG1MaUoxeTY3b0c0VE5ZU1dNWnNRcEo1cXNoMk9pbTNBWjBr?=
 =?utf-8?B?dGFoaWt4VVdSUjhsWUl4aGsyQWlOZlpWenJFN25xTHZWQm9WeVRnQnh2b3p0?=
 =?utf-8?B?bUNuYWtwcll1em1tOU4yTzdHQlc2b0xOUW80aWkrcWh2T1JLZDNPa2ZRdTBI?=
 =?utf-8?B?VFhVcVJFYkFzK1laQ0J6dWovMHoxclVPS0tqQ3pva0dFQ0czc0FRWkRqZUtH?=
 =?utf-8?B?NjU1aTBZNG42clk2TDFVa3pCUkdxSHh2c3prV0FUUFhLMHhNVjBkQXUrLys2?=
 =?utf-8?B?TGRjUFhVRmVBYU5VRDIvcGpyTlA5UUMrYmtxWCsxRnA4NzgwelU4eFp0REMz?=
 =?utf-8?B?QnVwWEtPcnYwbVp3T0ZlQ1R4ODdZT0xjaHNlL1BIVzY3TmFvNVJUY2Y0ZXJv?=
 =?utf-8?B?ZmwrbHZLL011VXBwd2RSbVFtdDM2aGhndzlpSTNTajFJQ0QrelArbEZVY3Bp?=
 =?utf-8?B?N3NLZVl3WkI4ZFJpR2dzWUp3TnJnMVJYYjluaFZuVlRWWXRRMU50RmJGNDRw?=
 =?utf-8?B?Zk9YRTNZQWVVUGkyVlBFNjQ4bmxTM2RIMlhCRVIrTXpxcDJOK0twRUJRSGdq?=
 =?utf-8?B?OHFGTURpejFiY0h4a2ozVGJRNE1qWTROdmdYRDJaS3V6bU5LNVlOUXRLRk9l?=
 =?utf-8?B?NnVUaFRxTlUvczNqWXZRaFNNYVhTZXZoWmIwZmRDRE5IK1NHTzEwb3hXM1Rw?=
 =?utf-8?B?VWgrVDZCUGYwTWZ6Qk5FaVMwRGM0QWk1TmRXd3ZwYzN4VmFIYnl0ZUZvbWN0?=
 =?utf-8?B?M2lWZG9Mc1lnaTdMMW9nNllxb1ZTNS9ORG5MT2MyZFduNUNrZTFMeGZzWjNx?=
 =?utf-8?B?emM3Nzl2WEw2YTMyTnlDU3p4NWw4dkdiWGZodWZ0dnI5eE1FYVJDSjJvOWUv?=
 =?utf-8?B?QkQ3c1g4V0oxQXc5OVlwTk4xanUzRmdtZmdGV01ZbGo4dU5MWjJncGU3dHJr?=
 =?utf-8?B?YmlzU013YVpOalNwOWxiQ2VlcmJDWS9VNENwL2NwaU1sRHk0Q2hXQm93bm5Y?=
 =?utf-8?B?djRjN1dkNXNvbW5HTGlQTytpMm5xNng0TWVSWDM2YjZkcis1L01NZHdvMXND?=
 =?utf-8?B?ZlZNcXR5MTBtVW9BZmlPNzdRQ3J3dlFkSEE1S054aXMrVG5XZkdIU1cyWVUz?=
 =?utf-8?B?YkhYMjNwR3VZWjZpR24zNzFGb2k5NkFtT3FqLzVEMkR6bUFSZUlLa0JPeXNT?=
 =?utf-8?B?eitxVXVLR1c5MGJtUkF3UTUvMWZOWmtLNzExeXdFclhCSVdhNXNwZEliT0w2?=
 =?utf-8?B?c0psZUxtMWl5bGtVWFpmOHlEaTk1ZXhqMG5YOWhJM1hKSm5CbXE5QT09?=
X-Exchange-RoutingPolicyChecked: fHS1cf5MKdjwoXQq8ftGfuzd5w8kKokxKQ8oGwCcqEKUlzNp53pnOf3RQQjhsmukTKgvghDbMjszpYEpO6LOfWHty4lnQQd+gUzcefw6eIO07CGDPDmvu3yl30iXm5S5FpS/tl1D1vhIuVWPt9BdnqHIamOY7gWWtUZYghViF7b424c/jxuloho0DIDDM98vwyQVhypaAf786nsI3XPGrO5glTXkcAEpwDbmg58aT0q241knyYI4ZDqekdathWEzUxYNzs1g2lQGFaiYHVfOIKfwECYKS47BS+0k7cWcueDAVU5okKcLi7p1JooJHor1WnaXnO/QF0oWqn1867tkfQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f7174e3-3f31-4371-f16d-08deb61c9658
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 03:05:03.5983 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kw57a6kwEPOXD+pdyZ7PLjY2aS8X630P63Nnm8MXEb6JHM5TVOz++mr4ZZ+aJLEYNZzSpfxWzjlnvSttBVrMNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7097
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

Hi Pranay,

On 5/18/2026 9:33 AM, Pranay Samala wrote:
> This reverts commit d9667a6fd6468adcdb5542d741ac423339a20556.
>
> Move output capability checks back outside dynamic subtests to
> restore the previous behavior while backing out this change.

Please mention why we're going for the revert.

Thanks and Regards,
Karthik.B.S
>
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
> ---
>   tests/kms_hdr.c | 157 +++++++++++++++++++++++++++---------------------
>   1 file changed, 88 insertions(+), 69 deletions(-)
>
> diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
> index d50f87787..bcc912d15 100644
> --- a/tests/kms_hdr.c
> +++ b/tests/kms_hdr.c
> @@ -255,6 +255,17 @@ static void test_bpc_switch(data_t *data, uint32_t flags)
>   	for_each_connected_output(display, output) {
>   		igt_crtc_t *crtc;
>   
> +		if (!has_max_bpc(output)) {
> +			igt_info("%s: Doesn't support IGT_CONNECTOR_MAX_BPC.\n",
> +				 igt_output_name(output));
> +			continue;
> +		}
> +
> +		if (igt_get_output_max_bpc(output) < 10) {
> +			igt_info("%s: Doesn't support 10 bpc.\n", igt_output_name(output));
> +			continue;
> +		}
> +
>   		for_each_crtc(display, crtc) {
>   			igt_output_set_crtc(output,
>   					    crtc);
> @@ -266,29 +277,25 @@ static void test_bpc_switch(data_t *data, uint32_t flags)
>   			for (int i = 0; i < ARRAY_SIZE(hdr_test_formats); i++) {
>   				prepare_test(data, output, crtc);
>   
> +				if (is_intel_device(data->fd) &&
> +				    !igt_max_bpc_constraint(display, crtc, output, 10)) {
> +					igt_info("%s: No suitable mode found to use 10 bpc.\n",
> +						 igt_output_name(output));
> +
> +					test_fini(data);
> +					break;
> +				}
> +
>   				data->mode = igt_output_get_mode(output);
>   				data->w = data->mode->hdisplay;
>   				data->h = data->mode->vdisplay;
>   
>   				igt_dynamic_f("pipe-%s-%s-%s",
>   					      igt_crtc_name(crtc), output->name,
> -					      igt_format_str(hdr_test_formats[i])) {
> -					igt_require_f(has_max_bpc(output),
> -						      "%s: Doesn't support IGT_CONNECTOR_MAX_BPC.\n",
> -						      igt_output_name(output));
> -
> -					igt_require_f(igt_get_output_max_bpc(output) >= 10,
> -						      "%s: Doesn't support 10 bpc.\n",
> -						      igt_output_name(output));
> -
> -					igt_require_f(!is_intel_device(data->fd) ||
> -						      igt_max_bpc_constraint(display, crtc, output, 10),
> -						      "%s: No suitable mode found to use 10 bpc.\n",
> -						      igt_output_name(output));
> -
> +					      igt_format_str(hdr_test_formats[i]))
>   					test_bpc_switch_on_output(data, crtc, output,
> -								  hdr_test_formats[i], flags);
> -				}
> +								  hdr_test_formats[i],
> +								  flags);
>   
>   				test_fini(data);
>   			}
> @@ -526,6 +533,40 @@ static void test_hdr(data_t *data, uint32_t flags)
>   	for_each_connected_output(display, output) {
>   		igt_crtc_t *crtc;
>   
> +		/* To test HDR, 10 bpc is required, so we need to
> +		 * set MAX_BPC property to 10bpc prior to setting
> +		 * HDR metadata property. Therefore, checking.
> +		 */
> +		if (!has_max_bpc(output) || !igt_output_supports_hdr(output)) {
> +			igt_info("%s: Doesn't support IGT_CONNECTOR_MAX_BPC or IGT_CONNECTOR_HDR_OUTPUT_METADATA.\n",
> +				 igt_output_name(output));
> +			continue;
> +		}
> +
> +		/* For negative test, panel should be non-hdr. */
> +		if ((flags & TEST_INVALID_HDR) && igt_is_panel_hdr(data->fd, output)) {
> +			igt_info("%s: Can't run negative test on HDR panel.\n",
> +				 igt_output_name(output));
> +			continue;
> +		}
> +
> +		if ((flags & ~TEST_INVALID_HDR) && !igt_is_panel_hdr(data->fd, output)) {
> +			igt_info("%s: Can't run HDR tests on non-HDR panel.\n",
> +				 igt_output_name(output));
> +			continue;
> +		}
> +
> +		if (igt_get_output_max_bpc(output) < 10) {
> +			igt_info("%s: Doesn't support 10 bpc.\n", igt_output_name(output));
> +			continue;
> +		}
> +
> +		if ((flags & TEST_BRIGHTNESS) && !output_is_internal_panel(output)) {
> +			igt_info("%s: Can't run brightness test on non-internal panel.\n",
> +				 igt_output_name(output));
> +			continue;
> +		}
> +
>   		for_each_crtc(display, crtc) {
>   			igt_output_set_crtc(output, crtc);
>   			if (!intel_pipe_output_combo_valid(display)) {
> @@ -537,64 +578,42 @@ static void test_hdr(data_t *data, uint32_t flags)
>   				prepare_test(data, output,
>   					     crtc);
>   
> +				/* Signal HDR requirement via metadata */
> +				igt_hdr_fill_st2084(&hdr);
> +				igt_hdr_set_metadata(data->output, &hdr);
> +				if (igt_display_try_commit2(display, display->is_atomic ?
> +							    COMMIT_ATOMIC : COMMIT_LEGACY)) {
> +					igt_info("%s: Couldn't set HDR metadata\n",
> +						 igt_output_name(output));
> +					test_fini(data);
> +					break;
> +				}
> +
> +				if (is_intel_device(data->fd) &&
> +				    !igt_max_bpc_constraint(display, crtc, output, 10)) {
> +					igt_info("%s: No suitable mode found to use 10 bpc.\n",
> +						 igt_output_name(output));
> +
> +					test_fini(data);
> +					break;
> +				}
> +
> +				if (igt_is_dsc_enabled(data->fd, output->name))
> +					flags |= TEST_NEEDS_DSC;
> +				else
> +					flags &= ~TEST_NEEDS_DSC;
> +
> +				igt_hdr_set_metadata(data->output, NULL);
> +				igt_display_commit2(display, display->is_atomic ?
> +						    COMMIT_ATOMIC : COMMIT_LEGACY);
> +
>   				data->mode = igt_output_get_mode(output);
>   				data->w = data->mode->hdisplay;
>   				data->h = data->mode->vdisplay;
>   
> -				igt_dynamic_f("pipe-%s-%s-%s", igt_crtc_name(crtc), output->name,
> +				igt_dynamic_f("pipe-%s-%s-%s",
> +					      igt_crtc_name(crtc), output->name,
>   					      igt_format_str(hdr_test_formats[i])) {
> -					igt_require_f(has_max_bpc(output) &&
> -						      igt_output_supports_hdr(output),
> -						      "%s: Doesn't support IGT_CONNECTOR_MAX_BPC "
> -						      "or IGT_CONNECTOR_HDR_OUTPUT_METADATA.\n",
> -						      igt_output_name(output));
> -
> -					if (flags & TEST_INVALID_HDR)
> -						igt_require_f(!igt_is_panel_hdr(data->fd, output),
> -							      "%s: Can't run negative test on "
> -							      "HDR panel.\n",
> -							      igt_output_name(output));
> -
> -					if (!(flags & TEST_INVALID_HDR))
> -						igt_require_f(igt_is_panel_hdr(data->fd, output),
> -							      "%s: Can't run HDR tests on "
> -							      "non-HDR panel.\n",
> -							      igt_output_name(output));
> -
> -					igt_require_f(igt_get_output_max_bpc(output) >= 10,
> -						      "%s: Doesn't support 10 bpc.\n",
> -						      igt_output_name(output));
> -
> -					if (flags & TEST_BRIGHTNESS)
> -						igt_require_f(output_is_internal_panel(output),
> -							      "%s: Can't run brightness test on "
> -							      "non-internal panel.\n",
> -							      igt_output_name(output));
> -
> -					/* Signal HDR requirement via metadata */
> -					igt_hdr_fill_st2084(&hdr);
> -					igt_hdr_set_metadata(data->output, &hdr);
> -					igt_require_f(!igt_display_try_commit2(display,
> -									       display->is_atomic ?
> -									       COMMIT_ATOMIC :
> -									       COMMIT_LEGACY),
> -						      "%s: Couldn't set HDR metadata\n",
> -						      igt_output_name(output));
> -
> -					igt_require_f(!is_intel_device(data->fd) ||
> -						      igt_max_bpc_constraint(display, crtc, output, 10),
> -						      "%s: No suitable mode found to use 10 bpc.\n",
> -						      igt_output_name(output));
> -
> -					if (igt_is_dsc_enabled(data->fd, output->name))
> -						flags |= TEST_NEEDS_DSC;
> -					else
> -						flags &= ~TEST_NEEDS_DSC;
> -
> -					igt_hdr_set_metadata(data->output, NULL);
> -					igt_display_commit2(display, display->is_atomic ?
> -							    COMMIT_ATOMIC : COMMIT_LEGACY);
> -
>   					if (flags & (TEST_NONE | TEST_DPMS | TEST_SUSPEND |
>   						     TEST_INVALID_HDR | TEST_BRIGHTNESS))
>   						test_static_toggle(data,
