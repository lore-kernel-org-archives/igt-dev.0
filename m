Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07A59D3569B
	for <igt-dev@archiver.kernel.org>; Wed, 28 Jan 2026 10:09:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74DB810E29B;
	Wed, 28 Jan 2026 10:09:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XBZcNyGs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5D3310E29B
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jan 2026 10:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769594972; x=1801130972;
 h=message-id:date:subject:to:references:cc:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=FWq7lsNYUyUohBXBcdj2EPybJ0hlaViCqwtPEmgYEgs=;
 b=XBZcNyGsHJk4U38c4C+uZR9c8ffkZWZ8QR8jF9PNEaaxuMMxRSouuqjX
 sE1CiJqRFzjLyqkhSEIDFibLhvsILyuvHHE7hC+cO8jeCHE+QQGWJza+D
 h2nOCCw1v7gh3rWYlWLYPPoKIX6sRVeni/AhG5tQjFgE+ii0NOEQyahJX
 GZNkTeH2WjPWaubkAOHCbKAXFyY+AdItYIBksgmTG4CFqRO7CVsvI6vmh
 8IQcG5mxJKhFCAhdppvwlgdv1LtGEciIvYr70RBWnT4ap3J2rp/BqLVG8
 876pukavpTu7leZVxIyGFE2T03opYs2Sda+2C/KiNENxujkoe5aPV4AaD A==;
X-CSE-ConnectionGUID: H9e7NTfxTUOTfHiJuxzTHg==
X-CSE-MsgGUID: yaCJ9CmySOu0WAnMVjpzJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="81912119"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="81912119"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 02:09:32 -0800
X-CSE-ConnectionGUID: 5ao94+/wSdWXX+smLhP6jg==
X-CSE-MsgGUID: cCRtfGzqRcazPJvSs249HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="239480350"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 02:09:32 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 28 Jan 2026 02:09:31 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 28 Jan 2026 02:09:31 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.38) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 28 Jan 2026 02:09:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B9h3cHhAniujz4qUQZ87F2Yz4HnL82gBr1OqChci2hbLSQ6t12PPnO1EDPhLzxc8s9lngZEVj8T/QfCZT7xm5qBICnJmmjckjOT6BSLpLCsV44gsJ7N9vygKGn17htuz61YWVAQY+0uhI8qejZQ5uG+zalx+E0EwKO1yLBiWp5sJlBPwucdefp466nIqjsYds9Xb43sWq9B6yFKEL1DcVPLqfEZWUbOu+Z2/GQtMCs5b0iXfALeQn1FKmUonEFZVmgQCKMwkFdpqHyPzLZwAQrFiRKxA3KXlaNYSpvnItwPNRT+aBJmUONEmlfugvF+rvBbWA07d14FuobloQHgS2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4SAGYxb4MdGJlGb94KfGT1JtihxX0oBX53jgqflsegk=;
 b=d9J7XTedejCpmUmfTb5Q7tRfHl5UDweQ10qsxzRCaaAQA7omw9aKgdundke59hBqq/a9TaVK0fRmQ4iScG8dbl5eq1slv4oQFUQM0pBaQPC9kZknyD/v0cbwbH67GGAFCCEDDHmLYNFF4M2NCgMOX/59V02KHxhCu5rD0nIGh0rwKB/SfwKqGUUrpFc+Hd2Oty+R7EW86+n9kn9fhQLZJsB8yJpmbQGktGhk6RPwbN/GrJs/u9AhmO/CmK0GdaPB3bQz4QI+P3HwTgbzeG2HKSmxlamyJywUCuxZtoFVZmrYRZxFQQZiu0vDANxBNf+bTAvmw5bQV9KwuN1k/KYR2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by DS7PR11MB7949.namprd11.prod.outlook.com (2603:10b6:8:eb::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.12; Wed, 28 Jan
 2026 10:09:28 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::7396:3750:f6eb:4765]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::7396:3750:f6eb:4765%5]) with mapi id 15.20.9564.007; Wed, 28 Jan 2026
 10:09:28 +0000
Message-ID: <b13185e5-340d-4947-b420-a24658abb39a@intel.com>
Date: Wed, 28 Jan 2026 11:09:24 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/1] tests/intel/xe_eudebug_online:
 test_interrupt_other wait fix
To: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
References: <20260123113523.262544-3-piotr.rudnicki@intel.com>
 <20260123113523.262544-4-piotr.rudnicki@intel.com>
 <DS0PR11MB726440BC41A7576D0F9958B7D990A@DS0PR11MB7264.namprd11.prod.outlook.com>
Content-Language: en-US
CC: <piotr.rudnicki@intel.com>
From: "Rudnicki, Piotr" <piotr.rudnicki@intel.com>
In-Reply-To: <DS0PR11MB726440BC41A7576D0F9958B7D990A@DS0PR11MB7264.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0006.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::14) To DM4PR11MB8179.namprd11.prod.outlook.com
 (2603:10b6:8:18e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB8179:EE_|DS7PR11MB7949:EE_
X-MS-Office365-Filtering-Correlation-Id: 86523fd0-d0a5-45d2-bb7e-08de5e555276
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7053199007|7142099003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M2V4b1pDdnA3aWVwQ0FZamQwT0llLzRoREFMZVc0R042dlFRdzhaRTNMbWds?=
 =?utf-8?B?RFRRSWQ5MDh4VXdsR0UrbVRCSGg2STNLdzB1bFZBRkVuaVo1YUQ2V0J1YWp4?=
 =?utf-8?B?OHczc3U5dHlTWWF2c1VUM0JxcVZFRTlLQ1QxVkR5WXVXa3hLQ1dGaGRoRlly?=
 =?utf-8?B?SzV4VlIrRGpNTWVwS0RyWU1Pd0JzTVEwd1A5Z2VzSSsxWENFTHhJWnlyallS?=
 =?utf-8?B?eU9hdFZxcjNBdk1IYWJFQzFJRmFVYnF1YUtaWWdYakpiNGNJUnhjWm5LZWp4?=
 =?utf-8?B?aXZBakpoMm5mbks4N3F1MXA5VkU1M21QNklic05OWEgrcXJ5TEJ1WTUzWHl6?=
 =?utf-8?B?Y1dwY0hjd015ZGwzODNxY1hMNnRDYW9HTyswcStyZE9rYVk4UjZYSTFRMlE5?=
 =?utf-8?B?alRCWnVLY1JiM1BsYlY1MEUvTUVSQklHaXFXbC96UHFyS2dKZmZDd3piTXpL?=
 =?utf-8?B?clUzUEFhb0hmKzZ4VmgwVEVXa0FkSnhXeFIvcFpqQmducmM0SkNQM25yaEN5?=
 =?utf-8?B?bU9PRlZBc1gwWXhyWit5OGtncXAxS3ZqVmhLakl4Q216Sk5NZHorcjZZenMv?=
 =?utf-8?B?M1hHZTdPWlQyUnpMYUU4VWQrTnFRTnQ2bEFwSTE3STlFMmt6NkxIR0dKd0dh?=
 =?utf-8?B?dmRhM1V1Ni9aZUhFeHhrUE8xNytiWWN1V1JVVzZMY1pDMHpKTXkvNWRFd0RM?=
 =?utf-8?B?MXF0MHBneXVSZGtvMEgreXhYUmQ2UzJ2Z1VNeG9CM1Vmb0YvK1Bkb0hiYmJt?=
 =?utf-8?B?QWQvanVHUldsRk9NVjZXNjM1em5JQnlJQ2FaRDZVWGd3K1B3cXVieW0yOWdh?=
 =?utf-8?B?RGNrV1F6clZlV01OM0hhUXVLZmxSajNPVmtING5FbnBHc1FZcTdXVnptdElO?=
 =?utf-8?B?WFlsTis5eCttNEp6Y3VxdUtSaVQxMTE1cWMyTGZ5S01yZTBPcCtJK0Z2K29C?=
 =?utf-8?B?QjFEOFdMTUhGbUJxOG1Gb21PR2VPSlUwRjVGaVk5UzVpYTBHNk5XQnFPVW5y?=
 =?utf-8?B?cHRZNHFrc1Y3TTgyaFMycFA0RVFTQ0pQeUtzeStYNUVBbkdXSCthZFNrVkVk?=
 =?utf-8?B?YWNVcENzZlFlNWNqeHJUakU4WkF3OGJVaWFQMGMxSU84ZG9iYVA0UTBncnRB?=
 =?utf-8?B?WXlRR05pZVNDSVJYRGFTL3JhVm1aR3k1TnhVU2FlR0ZpQ0VRRm5keUp0M3Js?=
 =?utf-8?B?eE1iOEJqYlRRU3JJelFhbTNDdlZ5VzBkUy9lMjZhc0RWNXBXNW1VNDBjV2Vu?=
 =?utf-8?B?d0xYY3N1dGRRU0dVdTExaGZkanIyY25wb2lDUVIvWWJJYTlpOWtVeHVYbUJm?=
 =?utf-8?B?MUdralE4bDNEZHQvQzg0R3ZoNXlrSUlTUnhUL2t3U3V4NW15UGo0VjFXVkZC?=
 =?utf-8?B?RDV4OTJnT3B3V0w1RVJxZ1NQcE9vQThEM3RRSkVKMFN4QnlHcGVmcjRhck9S?=
 =?utf-8?B?QTlicEZ5NmVoUVkvWWRUYndRUldpOTBXWWdJV0xEUWFmK0dNOVdDcFowbFJE?=
 =?utf-8?B?QnlHRDBlSmNXdjByd3luTHgrZ1dLYUxUajVwSVpQTC9NS3E1WXBGWlNWNU5I?=
 =?utf-8?B?dXdEeXAwaElMbzlkSkNnbndnWERyeGQzaU5ZTnM3RVNKTFRueDVmcVlSc0cy?=
 =?utf-8?B?V0I1eVNkRVpuOUZBZVVVK3hHR1pTT1FxQ042WEdDRC84d2VkdkRsTGZPc1J1?=
 =?utf-8?B?QUdSTzY3RGd2Z2UrTlYxSjdEa1FqR1RMNWtFNzJQNjhiMUpUdmFJWUl1WmF5?=
 =?utf-8?B?WDE5RkRDK1U4NVBzZkRVMnhubnVoWjgvcUthdHV4c3Z1T0ZnYmxoRlRWU0Ur?=
 =?utf-8?B?L3BKNmlCcDE4ekoyTGVzUERWVVpMQS93TmI4NDdXbTlnSFZoa0V0UnY2QTVr?=
 =?utf-8?B?TEJCOFRHdW9KQTdNU3U3dmtwVTVZQnlrQkFPRnB1YWFGQkxNOGdaRzJ5WERJ?=
 =?utf-8?B?OG1VZkw1dHB2NERQUWxKMldUeFkxTi82R0xjVUI2cFFzL203T01PUXU2L0xn?=
 =?utf-8?B?VzI0NVVsbDU0bVJjUVhHSGZ3UWZyWHg4dU9OSWFCeW9iVTB5cTlUalpEcS9j?=
 =?utf-8?B?dVFKb0tHQkZIUEl2SXpybHduNVV5YU9HODBhMStLNjZZVnUrYTViYXJ0TFNO?=
 =?utf-8?Q?/rYc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(7142099003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SHRiTW96aHhlZGN0dGd1cHlSSDlGUTBYckRlMTRWNUJTcENBK3RmaWo2a0Qy?=
 =?utf-8?B?eUExTmtKeE9KRkhlZTl6UE9jQXk4ODlVTGsvZFhZM3k3c01zNUltMmhXOFNH?=
 =?utf-8?B?VEhTVytGemdrTDMrdndlM2ZTZldNZXhCSkxVNFU5c24yVFZ2dVE2ak8xWHFm?=
 =?utf-8?B?TnRkNXlwY1BKaU9NUzJYRGJ4Yzh6RVBieXlpVFQxeGVQTmphK2RFOHplUlNs?=
 =?utf-8?B?REs4RytsS0M0eVo0YThXeEtUUU1pTU95eUdDV0hRN3lIOWdteVUwQkNnWmdU?=
 =?utf-8?B?WHNZREZtZ2RrU3pHd2RjK1RVN0YxQTBNWm9Ra0hYOHdLNDQ3YWs2QmJPTVo0?=
 =?utf-8?B?eWNKV2t1WW40a1laL1prU1lReCszdHFwVFkxUDNTT0Q0alJNOWdLMkR0R0k5?=
 =?utf-8?B?bmZhajk5K2lKQ25GRC9BSnlPZEdNa0dOVWRtUFBKV2J6Vko4S3FHR2hDR1RJ?=
 =?utf-8?B?S3JLWDg5NmsvaVE1cVVHMDJZNTkvYWVwdGRYMU5tSC9uQ3BlZnYxaVRUeHJU?=
 =?utf-8?B?cVRobjY5OUV3SkZmdGc0MUsrM0drMGdYbmdFMzROaWpYcUdxa0N4NjRrS0l1?=
 =?utf-8?B?ZEYwZm1JdHl0WHoyWWExSlFGaDBBQS83RFo0TUp4UnJOZHZQdWRnR3VOdU10?=
 =?utf-8?B?N1R0T0pZSGZ6QXlyRnhaVytuRkRIK2JjUjlhOGRDcGV0TDJWVndVZWFBMHZm?=
 =?utf-8?B?V3dNcDNGeE1RajVzVERZZkE3VWpiKzNQL1Jud0ZtbHFRd0hpR0lBVnVtRjJT?=
 =?utf-8?B?eWlxcGZBbEdZckpnVElBUW9lR2Z3V285WlFOMXR5NVlLYVdZT2dNZnJoQXNv?=
 =?utf-8?B?cXFUaFc3SVhtRVNSRXNKUGhGb3VBL1YzNDNzTmhTNDd0SWNKaG84Y0NNUVpt?=
 =?utf-8?B?cFhLaWdOdk95YmxGRXhWS1ZrcXAzUEE0T2ZacHdoL2pXUlJRUVhVS2FQTjJJ?=
 =?utf-8?B?TE1Pc1pFcDRIYkhia1JJSTNqQkJ0eUwrWW5tMlJhMDNSb2NqRHh0ZDBVRmo5?=
 =?utf-8?B?cUlEZlpyb3UxNnpoSUFpSjBHRnVBdWVsVW5oTUsybmU3bXp6UGZkT1JZTUZy?=
 =?utf-8?B?bWdmZlI2N283SzNiTjlQQmRoS09HYXM5UXlqSkxvZUpyaW93QWxWUm1uSlEy?=
 =?utf-8?B?ZDdKVDd3ZEVjVTJYaEpSRm0wWUJNN1FOM2hibW84NGdMMG5SU21vOGxIZFlu?=
 =?utf-8?B?RXp5VlhJR3pjdlBWYmhNa3BIS083VzgyZS9JKzZkbjVvYjN2d2NrZW9aaWk0?=
 =?utf-8?B?bDNQYWJMSm1zbU1TSkU0T1BZZnhuemNLNU5jeDRIS2tYTzNhaCtnb3BkTTBo?=
 =?utf-8?B?MTJTa2FoWVBXZkpod2s3RHBMMUl5bnNZQUF3RTlOVEhrMG83aGJTektWUnZN?=
 =?utf-8?B?eUNGL1FqL0ZkdnhvVkdnK2hvWGpYVXhwTHltbThwQWYxc1FwRzdYTUd1S3BW?=
 =?utf-8?B?YktUeHd2aFdnVTNhVTRYMnJtOVdUcWNMUlBVMEM1LzVSdnBoYlVZeXhwSmJT?=
 =?utf-8?B?WTZxdmVkaHZDSWFjM0UyTkJXbEZwd3FTWlZXMzF5Qi92ZWUwZ1hVTGFHMmlY?=
 =?utf-8?B?Ryt2Nk1qcmFMcTBROHl3NDdQZytPT1V1QzRJUXJ2N1pRMnRiUWlZbmYrZDRQ?=
 =?utf-8?B?MFc3bnZlekhNa3cxdUIvV09ZRmFNbmN2ZjU2YTgxdEEzMkd0dHVjM3QvNFQz?=
 =?utf-8?B?d0xBditnRWNVOEhXWTlmTWRYVVBsaHdJaDlsOVdlSTN0eTVhRlE3SzBDUUdw?=
 =?utf-8?B?SXppbmF2ZGRsbXluMzQ4WTJYa0dzenppOTBWR2dUdWgxTk9IeUFwVzNDZDZJ?=
 =?utf-8?B?ckVlTkczRXhNSGx5bHBMMXpZZ1VmQnNVTHdZZGxwNWJ4T25OMXN2alRGem03?=
 =?utf-8?B?dEw2dko2cWdoaGc5bjE3NDZra3RHeG0rWHo5aGlPY1hEUGhIbWZhTk9VcXBn?=
 =?utf-8?B?ZURDMlcySmF1UldrNkVmOUxkU2hRQW9nbXlyYzZ2dW5OZm90SWZZL3FxTGFp?=
 =?utf-8?B?eEZ4YWFIRlEvZTd1cHM1R0NGYjhWdXpNVXd4N005Qld3QVZwbko1azJQMVhD?=
 =?utf-8?B?eGN6N1lJV0FJdldFVEdxZndnSG1aSzVBOVlPS3pHZkRQUmlleW5NRHh2bVNO?=
 =?utf-8?B?Z0ZjRmVJU0xKU2lTcWZkc3h2TEpSNjZnaVA1RVY5MXRCOWZsK1hJVE11dTBK?=
 =?utf-8?B?STA4SlpvdDQ4cGc5OElkZnlMemU4WnZIc1NoNGRHRWZiVVJjOWVDVG1nOWp6?=
 =?utf-8?B?L0dicC9sSE1tTTMzWkZwOE9HWjh2bjlhaFUrYURDb1BOb3NNeDdQT2pFWXhH?=
 =?utf-8?B?dmxVQ1MxVmVPakdEQ2oybDZKUTFDNFNuaUtTUG1wRVQrVzlyTmpIRW9SeHQ5?=
 =?utf-8?Q?EVf9277/I3mKFiXA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 86523fd0-d0a5-45d2-bb7e-08de5e555276
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 10:09:28.4509 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NTmVmPE1/2DjT2aPEA68L3eUv/UAhBqfLAX3ZeJqqyrzftci1h990AnB8dDFhIHb724qh2t6aBcjOnQF/Bk8YPCh6wIKfIlVww2nwM9dnJM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7949
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

Hi Dominik,

On 1/27/2026 2:42 PM, Piatkowski, Dominik Karol wrote:
> Hi Piotr,
> 
>> -----Original Message-----
>> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Piotr
>> Rudnicki
>> Sent: Friday, January 23, 2026 12:35 PM
>> To: igt-dev@lists.freedesktop.org
>> Cc: Rudnicki, Piotr <piotr.rudnicki@intel.com>
>> Subject: [PATCH i-g-t 1/1] tests/intel/xe_eudebug_online:
>> test_interrupt_other wait fix
>>
>> The test was incorrectly waiting for debugee completion when the first
>> client should complete due to the reset. Fix the test to wait for the
>> correct client after reset and properly cleanup the debugee.
>>
>> Add pipe validation in pipe_signal() to prevent writes to closed pipes
>> after SIGKILL. Update pipe_close() to set descriptors to -1 after closing
>> to ensure the guard condition works correctly.
> 
> This commit does a lot of stuff. I'd split it into library and test parts.
> 

Good point. I'll split this into two commits.
Will send v2 with the split.

>>
>> Verify waitpid() return value to ensure the process was successfully
>> reaped before marking as done. Verify second workload started before
>> cleanup and skip session validation as SIGKILL causes incomplete event log.
>>
>> Signed-off-by: Piotr Rudnicki <piotr.rudnicki@intel.com>
>> ---
>>   lib/xe/xe_eudebug.c             | 16 ++++++++-----
>>   tests/intel/xe_eudebug_online.c | 40 +++++++++++++++++++++++++++-----
>> -
>>   2 files changed, 44 insertions(+), 12 deletions(-)
>>
>> diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
>> index 2abee7ba2..9f981d226 100644
>> --- a/lib/xe/xe_eudebug.c
>> +++ b/lib/xe/xe_eudebug.c
>> @@ -304,16 +304,22 @@ static int safe_pipe_read(int pipe[2], void *buf, int
>> nbytes, int timeout_ms)
>>
>>   static void pipe_signal(int pipe[2], uint64_t token)
>>   {
>> -	igt_assert(write(pipe[1], &token, sizeof(token)) == sizeof(token));
>> +	/* Skip signaling if pipe is closed (e.g., after SIGKILL) */
> 
> Are you sure that closing the pipe, especially with SIGKILL, changes the pipe value to negative?
> 

You're right.

SIGKILL terminates the child process and the OS closes its file 
descriptors, but the parent process's pipe array values remain unchanged.
The pipe[1] >= 0 check protects against pipes explicitly closed by 
pipe_close() (which sets them to -1), not pipes closed due to SIGKILL.

I will update the comment.

>> +	if (pipe[1] >= 0)
>> +		igt_assert(write(pipe[1], &token, sizeof(token)) ==
>> sizeof(token));
>>   }
>>
>>   static void pipe_close(int pipe[2])
>>   {
>> -	if (pipe[0] != -1)
>> -		close(pipe[0]);
>> +	if (pipe[0] >= 0) {
>> +		igt_assert_eq(close(pipe[0]), 0);
>> +		pipe[0] = -1;
>> +	}
>>
>> -	if (pipe[1] != -1)
>> -		close(pipe[1]);
>> +	if (pipe[1] >= 0) {
>> +		igt_assert_eq(close(pipe[1]), 0);
>> +		pipe[1] = -1;
>> +	}
>>   }
>>
>>   #define DEAD_CLIENT 0xccccdead
>> diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
>> index ff6c5ff19..1093df133 100644
>> --- a/tests/intel/xe_eudebug_online.c
>> +++ b/tests/intel/xe_eudebug_online.c
>> @@ -21,6 +21,7 @@
>>   #include "intel_pat.h"
>>   #include "intel_mocs.h"
>>   #include "gpgpu_shader.h"
>> +#include <sys/wait.h>
>>
>>   #define SHADER_NOP			(0 << 0)
>>   #define SHADER_BREAKPOINT		(1 << 0)
>> @@ -2014,7 +2015,7 @@ static void test_interrupt_other(int fd, struct
>> drm_xe_engine_class_instance *hw
>>   	xe_eudebug_debugger_start_worker(s->debugger);
>>   	xe_eudebug_client_start(s->client);
>>
>> -	/* wait for workload to start */
>> +	/* wait for the first client workload to start */
>>   	igt_for_milliseconds(STARTUP_TIMEOUT_MS) {
>>   		if (READ_ONCE(data->vm_fd) == -1 || READ_ONCE(data-
>>> target_size) == 0)
>>   			continue;
>> @@ -2034,6 +2035,7 @@ static void test_interrupt_other(int fd, struct
>> drm_xe_engine_class_instance *hw
>>   	igt_assert_eq(xe_eudebug_debugger_attach(s->debugger, debugee),
>> 0);
>>   	xe_eudebug_client_start(debugee);
>>
>> +	/* wait for the second client */
>>   	igt_for_milliseconds(STARTUP_TIMEOUT_MS) {
>>   		if (READ_ONCE(debugee_data->vm_fd) == -1 ||
>> READ_ONCE(debugee_data->target_size) == 0)
>>   			continue;
>> @@ -2044,8 +2046,8 @@ static void test_interrupt_other(int fd, struct
>> drm_xe_engine_class_instance *hw
>>   	igt_assert(debugee_data->exec_queue_handle != -1);
>>
>>   	/*
>> -	 * Interrupting the other client should return invalid state
>> -	 * as it is running in runalone mode
>> +	 * Interrupting the first client (currently running)
>> +	 * should return invalid state as it is running in runalone mode
>>   	 */
>>   	igt_assert_eq(__eu_ctl(s->debugger->fd, debugee_data-
>>> client_handle,
>>   		      debugee_data->exec_queue_handle, debugee_data-
>>> lrc_handle, NULL, 0,
>> @@ -2054,15 +2056,39 @@ static void test_interrupt_other(int fd, struct
>> drm_xe_engine_class_instance *hw
>>
>>   	xe_force_gt_reset_async(s->debugger->master_fd, debugee_data-
>>> hwe.gt_id);
>>
>> -	xe_eudebug_client_wait_done(debugee);
>> +	/* First client should complete because of the reset */
>> +	xe_eudebug_client_wait_done(s->client);
>> +
>> +	/* Check if second workload was started and is running */
> 
> Why not use the wait_for_workload_start?
> 
>> +	igt_for_milliseconds(STARTUP_TIMEOUT_MS) {
>> +		if (READ_ONCE(debugee_data->vm_fd) == -1 ||
>> +		    READ_ONCE(debugee_data->target_size) == 0)
>> +			continue;
>> +
>> +		if (pread(debugee_data->vm_fd, &val, sizeof(val),
>> +			  debugee_data->target_offset) == sizeof(val))
>> +			if (val != 0)
>> +				break;
>> +	}
>> +	igt_assert_f(val != 0, "Debugee workload execution is not yet
>> started\n");
>> +
>> +	/* Terminate debugee and mark it as cleaned up */
>> +	igt_assert_eq(kill(debugee->pid, 0), 0);
>> +	igt_assert_eq(debugee->done, 0);
> 
> What are these two asserts doing for the test case?
> 

These are sanity checks before terminating the debugee:
  igt_assert_eq(kill(debugee->pid, 0), 0)
  -> Verifies the process is still alive (signal 0 checks existence 
without killing)
  igt_assert_eq(debugee->done, 0)
  -> Verifies the debugee hasn't already been cleaned up

Both ensure we're in the expected state before SIGKILL.

They could be removed if you consider them redundant - the SIGKILL and 
waitpid would fail anyway if the process is already gone.

> Thanks,
> Dominik Karol
> 
>> +	kill(debugee->pid, SIGKILL);
>> +	igt_assert_eq(waitpid(debugee->pid, NULL, 0), debugee->pid);
>> +	debugee->done = 1;
>> +	debugee->pid = 0;
>> +
>>   	xe_eudebug_debugger_stop_worker(s->debugger);
>>
>>   	xe_eudebug_event_log_print(s->debugger->log, true);
>>   	xe_eudebug_event_log_print(debugee->log, true);
>>
>> -	xe_eudebug_session_check(s, true,
>> XE_EUDEBUG_FILTER_EVENT_VM_BIND |
>> -				 XE_EUDEBUG_FILTER_EVENT_VM_BIND_OP
>> |
>> -
>> XE_EUDEBUG_FILTER_EVENT_VM_BIND_UFENCE);
>> +	/*
>> +	 * Skip xe_eudebug_session_check() because we forcibly killed the
>> debugee
>> +	 * with SIGKILL, so its event log is incomplete and validation would fail.
>> +	 */
>>
>>   	xe_eudebug_client_destroy(debugee);
>>   	xe_eudebug_session_destroy(s);
>> --
>> 2.43.0
> 

