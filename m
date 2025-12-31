Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED736EE57E5
	for <igt-dev@archiver.kernel.org>; Wed, 31 Dec 2025 08:23:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BBFC10E085;
	Wed, 31 Dec 2025 08:23:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YqvsQKo/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1894910E085
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Dec 2025 08:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767169381; x=1798705381;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Qsl8/gZ8YL1rOUVWsEYFa9jT0xYBGwpMt6DS83VuoJk=;
 b=YqvsQKo/69wwIEjTG/PjiV5XdSbDGib6R7UKwpkSj8m+7M8prxE5YXMb
 Jiujkp4irt+PxD/jjCFf8bcWRHYrYTY8uFPPWWUfsmqU1FUicMahnHeVT
 eJ2ODiQpvL1opSKHmS2D3VBry7Ro1KqUJV7ZALKmY9VBlVmqc27VEtKGs
 5V2QhE6a9n/xZMEIGZ1iRoGHtzxVOZhz6AOpKWAPCH8PrF6ZYf/53cNBw
 VCXJNK8Vr6AYOYyTCrH+lCRmuaQnd87M/Xg4Dii5h7klq6/Ut77UcvUdI
 ky2WDjnvEnIfNaWDVo3a8RwbnNUe8+gupH8qVGj0XDPUTZx0JRs8906Rk Q==;
X-CSE-ConnectionGUID: E2S1Om2BSY6QxJv//abImw==
X-CSE-MsgGUID: DmdUKiDZR8iUYZpiPcNHuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11657"; a="68785249"
X-IronPort-AV: E=Sophos;i="6.21,191,1763452800"; d="scan'208";a="68785249"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Dec 2025 00:23:00 -0800
X-CSE-ConnectionGUID: OTglUhYnSpaIHAz1RDDozA==
X-CSE-MsgGUID: vpNVSKVuTDWjSD6Kdnnbqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,191,1763452800"; d="scan'208";a="200603177"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Dec 2025 00:22:59 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 31 Dec 2025 00:22:58 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 31 Dec 2025 00:22:58 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.65)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 31 Dec 2025 00:22:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h6PcNcGNCOOC7lsSk0Sx40rW+yoKpAhrFzpKIOBqwBwZDGay8Oh/WvaPFnoT2u4te2DoW4YDrFdPV7x3pgrQ8gvZYWNkHnX5dX1ObuppITpmmf0S3ZbaXvkc6fkWljpyn7XYzar5zcsjaQJx0QnJxMjAqww9OApQJgXsvRwsRhjjjix1WZCtKdqlS/SvqXIIGq+sGny+3H8wHtJaDziXDxbTjtZ4N/q0wHzOvaluwmcyty+wYxSfopnW3jw7s/AdO9VzJzsw03GKs7YHxPfZ84/p/y60ivdI/uei+SLBWdio+gYt82LoMuPGUZhON674U9suIT6/4pCLU1aY4GxauA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bfzb5nQ+6xVya2dwNH3Poqr0Rc+Ab62w9aY42vZFEfE=;
 b=y+Gisv/DNd5KzUJjU7z/0+WqwTxwk3ofXt+V4TA+5G8XCz/gKowGBmEWqj5MUmbRJr9IbKjNp4VVYdfhEFN0dMxMjpub7wLrXlNx2n4itLs8F7WbGiC39EY7HIPBLEwwkbl0H8wFU9RToUM95r/WCh6JqzAoA+kovr3/g71aApuhvRtOZXnJJYXNS82hPPxJg8qFBBsAfzxC/U5tAHLXubCKr/aSuAWfKVVQ0HYsUzAnrvZqnUG4dihMHSN6BhtvPHNr8+qeAfZQ40mCnhcSvH3LU+rZ46A5dijHBLGnRsLLrw3D2Jho6uaa2UXMqIK0MqK+0k5+59Lo08tKpA79Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by SJ2PR11MB8348.namprd11.prod.outlook.com (2603:10b6:a03:53a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 31 Dec
 2025 08:22:51 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c%6]) with mapi id 15.20.9478.004; Wed, 31 Dec 2025
 08:22:51 +0000
Message-ID: <93697088-0703-4d67-bec3-3cca3fafd8c1@intel.com>
Date: Wed, 31 Dec 2025 13:52:44 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/3] tests/intel/kms_frontbuffer_tracking: Add HDR
 feature support
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, <chaitanya.kumar.borah@intel.com>
References: <20251203090836.1164827-1-swati2.sharma@intel.com>
 <20251203090836.1164827-3-swati2.sharma@intel.com>
 <20251209133522.pwc6djxzvwefu2uf@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20251209133522.pwc6djxzvwefu2uf@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0004.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:174::6) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|SJ2PR11MB8348:EE_
X-MS-Office365-Filtering-Correlation-Id: 358383d9-75ee-487e-b43f-08de4845c9b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WDhiZ2t2cW04U0xJK2FKTFFhdnVVNE94ckdIc1NQNWQ3OU5VQzVnUjQ4M2Fq?=
 =?utf-8?B?NFdsbTZIaUt6RWNWSDBFempPZitvVGxMeGZzMTl5anJwVGNVdC8rWlRKaWV1?=
 =?utf-8?B?NGg0UG0ranNXQjZMN3ZsNnF3bUdpWmxKMm5DOHdvaWZ5cDR4ZFVoZjV3UmRO?=
 =?utf-8?B?RC9IbmkxMEl5cTAvSXRJK3ZUbEw3dnN0d1J1QWNoUGtTSGRUSGQrMjJvVk43?=
 =?utf-8?B?NXhuNkxtQm0vc21mMlVtNFZ6WHNSaTlGNXcyNUNKcGczYzUzaE96Y3A0THJl?=
 =?utf-8?B?dFhFZXUzajJRTDhBZFEyZ1RPRXJUMUVkclVIenNrMUZrWkhKYW45cUZoRVdt?=
 =?utf-8?B?R2cwa1dKclkxTysyWnNiNmpaZUE0V3pneW5OTExnOHBvUlc4dFQrYmpmUXB3?=
 =?utf-8?B?aUkxbFJJNHhzYVYzczFiU2RpZzllYnV3SGZCOUpEeWw5dnBrUDgzcWRFTXNw?=
 =?utf-8?B?aGVoMXdmWW14WGhsWTRhNFNTY1lXcTYrWi9pMG1Pa2duT2pzanFxaXFXYUZY?=
 =?utf-8?B?M2ZuL243ejBLMWt6YWpxQitjUDA5QUxBN2lDWUowUERub2wxT01iNCtseW5D?=
 =?utf-8?B?TzV0dEo5eWo3YnRLSU5GMXllSUxxa2JUaTFiYjdjeXBNTXk4V3Ewait4M2Ur?=
 =?utf-8?B?eE1vSzYrQ3pIRllqUDlRMDE1SWU5ZEdyekVMemo4Z3ZRMjRnYVBETTArdnZ5?=
 =?utf-8?B?Y1RIT0hqdG1LcmlBQXhFVUhoWmlPVDNLQWZZZnlxMzRTeVpabHZzN2dJMDFT?=
 =?utf-8?B?Qk9EREF5YW10ZUpHZXh0ZDRlMWFtN2dQTnFkUkRoTElGMXBhQXpoY2Zidnhq?=
 =?utf-8?B?Yll4V0NBbWp1dkVnZVZaRVNTSmVXZWFnREZPdnNGcUlTRlNGc0lRRmtkVldV?=
 =?utf-8?B?NS8xUlpPcnlOZEVlTnFiZXB3OHhLa0ZGdGo1TTl5dzRDb2ZKcVVpZ3FHdUhl?=
 =?utf-8?B?OXBQYTBLV001VjdpMm9GNkZQUjhsQlZkTjhqN09OWE1adm81eVNoUWk4WUJT?=
 =?utf-8?B?QU9RdmUxNXluWUo2SFVIMTA4THoyTkw4bUZ5RmpWald2WFZ5Sk0wN3FDSzhJ?=
 =?utf-8?B?QlNwSEtSdkI1aE1OcWhOYTArbkNycFJJL25GU0hKY3JhRnQ4UnRSKzdKWTdn?=
 =?utf-8?B?eHZXR3VkMHBKMzF5cHE2N2lrZlhWdU5sU1lHYXhNSFFpak42SVUwWlhDeDJ2?=
 =?utf-8?B?UExUMjEzY01vbDduTkYyTDd0WVZXS0M1RFhZSjRWL3ROdkFocmN5RnhraFZ4?=
 =?utf-8?B?SUJwdWVtTVBRem5CenFRTEFWSnpLYzdRR3NMajhVeUIwT21XVXBiUmJ1VWEy?=
 =?utf-8?B?cGRweHd3TkRQeHRPT3BqdG5OWWI0RVQ5SWI2dURYNVZoRnBmcTc3VVpTRm5l?=
 =?utf-8?B?Uk1aV0J3NkE0WHo4Y0JhcUJRcjBQUk9lRUlEZENDZC9OSk94dzhqZXV5VnZV?=
 =?utf-8?B?Tk9wbkVHNEZqNzg2dysrTXJ3czMvbnkzSkV1T1pBSlc2MmJXZ2psTmFqTnlK?=
 =?utf-8?B?QXBXYnRUUW5tdHR5cWVoSVpwd05XVHRPMThFclpkaVRWM3FHakpONEZnSkxK?=
 =?utf-8?B?ZDYyMU15bFBVd2NrK0tKa01JYWNMU2twQTFNZm5FbnI1eE4vQ095ZFlaa2kw?=
 =?utf-8?B?OWNxRCs2SXRUOTV0ZldLTHdGK1IwZDdJa3V2U1RYV2ovTTFmTVFMK1h5L2xz?=
 =?utf-8?B?dXE2eUZwR1NPQjNkbisxQlBCb3g1MzYxZllWL3QrNEdyVy9PNVY1RjJraVEy?=
 =?utf-8?B?L2pLWVNTb1dCeXN3UWVkbCt2SWVSOEZnL25TTkVsTTRhbWIrVCtQR0tMcEpr?=
 =?utf-8?B?c1k3Nk5QQ2NKZjBkMFQ0dHMwT0QwUkRWc1N5VnN4N1Rsc1hoVENZT2E4dnUy?=
 =?utf-8?B?UnpnNjV3MXY1K1V4cU90TnJuNGY4UVhOczlGS09QQ2RpMnZNU2xTZ3J2R1Nl?=
 =?utf-8?Q?EBCFMjKhZhAUesj32eGTYP0LMruEE/Y6?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?LzNhb2daeTF5d21zcERUUWxKY1VtemliYXVYMWZHbU5hOEVGNkZhdDRod2x4?=
 =?utf-8?B?WVUwd1dWTWE0L01hSDZrdlduNE5IdlArYjlqRVV0VmtvZ2JHWVFGTjlBNHBn?=
 =?utf-8?B?VXZZTG9WNjBldG9wVUxaL2NmaWd4VjRzSmZ5WWJjbDcyTENRMGR2TTNESzNJ?=
 =?utf-8?B?c2R2eUUwYjAyYmkzOXoyZmZMcXA4MmZwb3plY0pZb0dOVUh6RXVqaDlNdWwr?=
 =?utf-8?B?eWpvMnFuTWN6ZkZ4SjhvNWUweEMrK2dxNTdWbCtYVFNJOEJGbFNXR3dpMmo3?=
 =?utf-8?B?T05oMmI4MUNERmw1V2FiOTljdWR5T0hZNUJOVFgvVDVPMHByclM4ZklEaDBV?=
 =?utf-8?B?ZDZqRDVuOHJ3azMzRFJoRjhBc2tVT2RUaGNRaHp6MVRaSEVPMkdjTER5YnRU?=
 =?utf-8?B?NWNpa1p0bjVmL0VVU1F5L1RsM0d3anVUOCs5SUhBOG9KYStYSFpNbU8zSVR0?=
 =?utf-8?B?N1ZvMllpcFQvb3c5TXFiNHlSMXphTFRLZEtaT0trRnVxMC8yd25NNGJrSHp4?=
 =?utf-8?B?Y1FudzJLR0Npb2ttR3V0MENwekVEQnV3TTY3NHowM0lQRVpyMVQxTnRuaWsy?=
 =?utf-8?B?RmU2WFF0eFVIbXdYdnIyeGVmekYzZ1MxZHVqdXBkOUhEY3hwUUwzK0pzb0pu?=
 =?utf-8?B?UTg4RGxvdnlZRGV3WmhxbTVVUTlhaWJhdVA1T0llSVA4cUVmK2tIbTRXM3Nt?=
 =?utf-8?B?bHh1SmhIS0VBNWN5UjRSM09NNlJHNXk1OTRFM2ZhckxrcGJ0dG1QT25XS0Zk?=
 =?utf-8?B?SjBqem5zU3FYNHlVbVBTUWd0Uko2VEttOWM4TmJvSHZLYmJPWmQwb2owZlli?=
 =?utf-8?B?VGhOSzYxbzlzclJSVjd4K2tMUUtEdEZuV20zTEg2WjFZQnluajJqQ3IrcHht?=
 =?utf-8?B?Tk1VWlhMUm5DamZXeFFDNDhQdmlkZlBkcGVtc1AxSzh6VDMyU0ZIMnQvUmxN?=
 =?utf-8?B?Qkt1Q05BWFY2QjZQdlRPSFRwOEhrUWhJa3A4M2o1cFdVa1pQK1l6dG90cnZv?=
 =?utf-8?B?eFBVMGNsalhuODVPVEZMMExZblB5TWMyU2QxWmFvNDdISHJyQUg2REFoYWRX?=
 =?utf-8?B?b0lRR1QvTTJaODlXYmhReDZLUXRUVisxMk9TUEVQU3RvTExjZ1lHKy9vYnZT?=
 =?utf-8?B?cG40RE83ZDlIdnMxSnovUkwrMXAzelpaMUpxNGVwb004Uk1UYWE3eGoxVllC?=
 =?utf-8?B?NnZFc1YxK0FPNEh6c29vY05WOHlHcUpmRC9pcEY3UFh6ZEdibkl0RjZEdjQr?=
 =?utf-8?B?V0ZLY3RJNUpwdHY0MEpZaURHaWtYU0t4aGQ4eEYwbmV6Z1V1NGMxUXBMSXU3?=
 =?utf-8?B?SWdrV3pvTm5zVlpmUXJ5K1JON092d3I3OVIweHdZTlVaN25Cb3hOdUVDWnZ2?=
 =?utf-8?B?V2dITVBkTm9DbUFCNDJuWEp0c29DMndHb3YxNVpFY0Q5RWtBMjBabnJPT3VQ?=
 =?utf-8?B?TE56T2RTYno5MUhDditDVVJFUGVmcjQyU2x1TVZQcndvQlJYV3dIWmxtVFla?=
 =?utf-8?B?WUtlaWNiTW44RjZsQ2lzMEJxUkJLY2JQYk55Z0dla2ZKQ1hET25CMTBxM3R0?=
 =?utf-8?B?VkEwc1liWDJIWUptS3NiUjJOU3RKSnZBa1RCZmdXb0J3WW4rYStPRVVkVDdW?=
 =?utf-8?B?VWFDMlE2Sk11NC9ZNWNiYjVEbU9PaTArUzdMWG5SQlU0elY0YytqQTRlYmE2?=
 =?utf-8?B?aHc3YUV2WWhLQzJGdEF1UWVkeFprSzk0NENsWWhpbkRFSllwNjdiOFhvZVBK?=
 =?utf-8?B?RlB1Z0ZDNWFqd3BvYkwyRzRUK3dXSGtrNHZlRGJZSkw2bCs4bnpJeDdsM0Ri?=
 =?utf-8?B?blVYeUkzOTMxSytmdEtlaERhUVJrbzlGdStQZTRYOExaVzZVcW8rbllBWkxX?=
 =?utf-8?B?RlZNeHpZYVF0ZkZoZWJIOG5lcEl0eDBuVWVSUkVld0MrWmxjS3doVWNBU012?=
 =?utf-8?B?UzZWb2FSZXUwYTIxQm8vWXpTUDdJZjUyT04wczlJMFVCWXZiL1NRR1pLMHpD?=
 =?utf-8?B?SnV3L05COVUybG00aGk0N085ZldvTVNBMUd1TWt1ZUJ1M29xMFdvK012RVdo?=
 =?utf-8?B?TFNvNWVBcUUwTThJb0I2em12a3ZmdU9RZ3JnMm1HYW9IUnRpcytkbTBxY1hy?=
 =?utf-8?B?U29NTEcyQzhnc1B6aEZ4QUdVbkpUUThlVUlMKzhIQmU5SGlXbXVsVlJhRGpM?=
 =?utf-8?B?MHNBazAvLzZCVDFKSUNOSWNwRHNxWGt6bC9NSXZWM2RZK2ZGZUJiZXp4UVRO?=
 =?utf-8?B?b2xlY2M3YjdLb1UrM1RKdmR2VThSeEhuU2lBSWtnMGowNm1YTndreVNXeWJK?=
 =?utf-8?B?eHM4dnJ1V3FrSWt5ZWN6TEpsSHRtb2ExOFFiSGsyK3ZJc1kxMC9wdz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 358383d9-75ee-487e-b43f-08de4845c9b5
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2025 08:22:51.0863 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7A7IaSLF/WvpFr1WS8gAKrngveXdsunzQTIU1rbhbuv3ffRlyQ/VnNdF29iHea3/3t+mGf3D5eNdtCjUFB9etg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8348
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
Thanks for the review.

On 09-12-2025 07:05 pm, Kamil Konieczny wrote:
> Hi Swati,
> On 2025-12-03 at 14:38:35 +0530, Swati Sharma wrote:
>> Add FEATURE_HDR and extend feature_str() to cover all feature mask
>> combinations.
>>
>> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
>> ---
>>   tests/intel/kms_frontbuffer_tracking.c | 35 ++++++++++++++++++++++----
>>   1 file changed, 30 insertions(+), 5 deletions(-)
>>
>> diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
>> index 0f162d9a5..eda97f7df 100644
>> --- a/tests/intel/kms_frontbuffer_tracking.c
>> +++ b/tests/intel/kms_frontbuffer_tracking.c
>> @@ -855,8 +855,9 @@ struct test_mode {
>>   		FEATURE_FBC   = 1,
>>   		FEATURE_PSR   = 2,
>>   		FEATURE_DRRS  = 4,
>> -		FEATURE_COUNT = 8,
>> -		FEATURE_DEFAULT = 8,
>> +		FEATURE_HDR   = 8,
>> +		FEATURE_COUNT = 16,
>> +		FEATURE_DEFAULT = 16,
>>   	} feature;
>>   
>>   	/* Possible pixel formats. We just use FORMAT_DEFAULT for most tests and
>> @@ -3987,12 +3988,36 @@ static const char *feature_str(int feature)
>>   		return "fbc";
>>   	case FEATURE_PSR:
>>   		return "psr";
>> -	case FEATURE_FBC | FEATURE_PSR:
>> -		return "fbcpsr";
>>   	case FEATURE_DRRS:
>>   		return "drrs";
>> +	case FEATURE_HDR:
>> +		return "hdr";
>> +	case FEATURE_FBC | FEATURE_PSR:
>> +		return "fbcpsr";
> Can it be splitted by '-'? imho better: "fbc-psr".
> Same comment to all or-ed strings below.
Though this is doable, and a good suggestion. However, it will require 
to change existing code
plus documentation which is not intended in the series. Can take this as 
a followup?
> Regards,
> Kamil
>
>>   	case FEATURE_FBC | FEATURE_DRRS:
>> -		return "fbcdrrs";
>> +	        return "fbcdrrs";
>> +	case FEATURE_FBC | FEATURE_HDR:
>> +	        return "fbchdr";
>> +
>> +	case FEATURE_PSR | FEATURE_DRRS:
>> +		return "psrdrrs";
>> +	case FEATURE_PSR | FEATURE_HDR:
>> +	        return "hdrpsr";
>> +	case FEATURE_DRRS | FEATURE_HDR:
>> +	        return "hdrdrrs";
>> +
>> +	case FEATURE_FBC | FEATURE_PSR | FEATURE_DRRS:
>> +		return "fbcpsrdrrs";
>> +	case FEATURE_FBC | FEATURE_PSR | FEATURE_HDR:
>> +		return "hdrfbcpsr";
>> +	case FEATURE_FBC | FEATURE_DRRS | FEATURE_HDR:
>> +		return "hdrfbcdrrs";
>> +	case FEATURE_PSR | FEATURE_DRRS | FEATURE_HDR:
>> +		return "hdrpsrdrrs";
>> +
>> +	case FEATURE_FBC | FEATURE_PSR | FEATURE_DRRS | FEATURE_HDR:
>> +		return "hdrfbcpsrdrrs";
>> +
>>   	default:
>>   		igt_assert(false);
>>   	}
>> -- 
>> 2.25.1
>>

