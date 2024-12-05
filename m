Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2006E77170
	for <igt-dev@archiver.kernel.org>; Thu,  5 Dec 2024 19:44:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6126110EF99;
	Thu,  5 Dec 2024 19:44:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C8WQbw/v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88C1A10EF99
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Dec 2024 19:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733427864; x=1764963864;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rWBeAjh5WexaQsZBllHa0VlJV1s6b44bKeemzj1B3E4=;
 b=C8WQbw/vh1Okaf4j+FcOmjCKrhD6VxAOUkJyu7u/xKAWop3LE+c2PLso
 aQMicvIFALcHRQePuFawZojwDQ8CTWAQFRHLP72tMxtrVa7yMy8vtWN4/
 JfDYEqBumfYK1CtFHfd9rqLkxaag9nVPGtUtmBJ1C6Qs1iQgPsKme0g4/
 IllXHjk+Htn97YQfSzNe52oCcZRkPrprXJ2lfA8B43j23sfGSu2v+YjV+
 UqG5v1c0lolwuB5MnrQk2M0rp806wrPwKHIGtpryQm8gbofUn1KwA8yq4
 tO//wUqn3lDkjl9WmbhrRxGwsRqK6reuAt9z8rim+fAMzt+OCT2xccuXV w==;
X-CSE-ConnectionGUID: 5KCjqG3rSdCLBAhGEJ8A+A==
X-CSE-MsgGUID: RbntYweTQT6ZbmYU2Wf12A==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="33909025"
X-IronPort-AV: E=Sophos;i="6.12,211,1728975600"; d="scan'208";a="33909025"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 11:44:23 -0800
X-CSE-ConnectionGUID: QxvqnS2JRBmtTHN7vCknxQ==
X-CSE-MsgGUID: sOwatFguQNu3XqK9j1Owow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="99238513"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Dec 2024 11:44:23 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 5 Dec 2024 11:44:22 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 5 Dec 2024 11:44:22 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 5 Dec 2024 11:44:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bggRQNwNnDbfH7kVxf/PzdhjwW/S6Kk8BkaCEIJL7F7lqDW7EQJ5ho/+hcM9tIcYXoPHBHy92YHfPa+PMOD+FvAQ5vo/XX2NwJ49U/xYUJZS+Yady0pgEfkRsD5XPNRhloktBRQWafMx6aVee3empjfZN6l2iC5Rd+mYJI+AQmOrwAVFaZhXw+obEKA6RkOqo8bde9yfhcfVaem6j6OljcbLvXW4QsO79KnUxExQi/Kfr2Yr8Kd7Nu9ZvAwr6HRT010uWC6WRYJoRFacju4gcHb/SZec3Mgj5OSo90IZB/L8LvgV2ZQjyqs6ydpwsUQO/bbabwnIiwEN+sNttIY4CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2PE8oOq+yxwrDyf+bPyMvSrtoasG3HPUSGZiNuBfvd0=;
 b=ov9aKTsI9jTMKFZX7UadMm/W7VgUODNfmIOwOiCxD58xwiptg4sjzBJQq6gP+QMaNvG27CUsUGWsHLycTzohs4J7//ywOVNovy6TsEDxR4YaLYv1uimhW71dXgu1gqOmRc3d1OPpcZa76pfkoCHJqf/o/TzA6BsufOwODVykKXPImgy0i8wqDhjwnjsfceWjp+Ls5mSP+4w0XzvfOy06EofpXGWiszbCkq39Sx22HuF4mT3OUE+kIwFUvD8uNYB/OwqTRRm7Pg6SRB46jT/2i3GfLSmuUXNSrelKFlWuD4cXyW+RCDnWjOnB7Wjf4uW4iHA9W8fHgpj5PUwKMwcnaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by SJ0PR11MB5937.namprd11.prod.outlook.com (2603:10b6:a03:42c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.17; Thu, 5 Dec
 2024 19:44:17 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%5]) with mapi id 15.20.8207.017; Thu, 5 Dec 2024
 19:44:15 +0000
Message-ID: <86233b83-7556-494a-9883-4c2241442d37@intel.com>
Date: Thu, 5 Dec 2024 14:44:13 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] tests/intel/xe_exec_capture: Add xe_exec_capture test
To: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Senna, Peter" <peter.senna@intel.com>, "kamil.konieczny@linux.intel.com"
 <kamil.konieczny@linux.intel.com>
References: <20241205143924.190169-1-zhanjun.dong@intel.com>
 <3708c2a6e6c9b57f8e8b622ce11c43591bbaec67.camel@intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <3708c2a6e6c9b57f8e8b622ce11c43591bbaec67.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR01CA0049.prod.exchangelabs.com (2603:10b6:a03:94::26)
 To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|SJ0PR11MB5937:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ed9a1ec-d72a-4384-3fa2-08dd15653381
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b0QxVzFjRjFxbE1aOFp2aTF1TnN0aEdXdDg0R2phOGNTYXExM3FMUzNCellD?=
 =?utf-8?B?bDNWcHRsc1k3TWlaS0tLOTF2Uk9zNEFQeXU0L3lLYUtyNFpEYlV4ektpZ1Bt?=
 =?utf-8?B?RTVOL2dGZXlUZE9oZVl4Zjc0aEV4NlhPWEtVQkE1U0Z2Qk1Ob2hpR0NSd1NB?=
 =?utf-8?B?SFE0WWZlekxTei9rVkdDTDhtZEZjMVl2RFd3VG1pbmtEd3BNVTZhNjRyOEpO?=
 =?utf-8?B?WGRDVTdNNitzbGlxUjBEak1xdHNVTXJBK0dlRzBjbjJvdTh0YzRpd0c0bktF?=
 =?utf-8?B?TzA1ZmNzWU1YanFyZEQrYTlPTmZLVWpJTnR3eHMwK2U3MksvMzFvZ3hIYlBh?=
 =?utf-8?B?Mi9Eb0RiZmc3SjY2Rm16Y0RpaVBoVGNFVmRBN0lkalBiN2g5YnNVYXo2NkFn?=
 =?utf-8?B?N1l4bFRCaTlYOUVrc0FSOHhnTEtLWTNaS1FESzBNOXVpVTdYUmFPUXB3Y28x?=
 =?utf-8?B?MlRPM0hxcXNPOWN2TzJWWXpJRUV1UTd6dE9DZEFwakZYZkdJZGFud2JoT3Q3?=
 =?utf-8?B?R0JNb0psSjRGa1FSYU1tK1kwUkdZVVA3TVNSNmFkaVlIbU1XZndkWWNnSDk2?=
 =?utf-8?B?QVBCWUZiYk1LY3d0MzFNOHRINzI3aW11Rk5waC9ra1E3bnlvVzhxcUZVY00y?=
 =?utf-8?B?SFhyUzlTNVRQM0hNd3pjeGZDMUplMFc2aGM3ODBYcDhPOHlHTkVMbDNzZVFi?=
 =?utf-8?B?ZFg2Z3NCUDllblFWbHdqa2FkKzdZUzBnK2Z5MkxIb3REVVdyMjdCRC9YUFMy?=
 =?utf-8?B?bVpnTDhjRG93M21ZY04zU1dRdi96YVJoMkswdlVjTnI1N05RQkhYQXhFbFBQ?=
 =?utf-8?B?OGxld3BIWFMxb1dXT2pDdWZ2SlRXMithbEhxUHdDc1VtSDkzQ0k5K3ROZTI3?=
 =?utf-8?B?TnB1RmxOeGhOdC82WWtOT0xtelpxbjJhVXdOUDQ1b09uL0VJOG0zRWk0OUVp?=
 =?utf-8?B?blI3bCtBaWUzQ1FxejEvaTNXS0U1SHgvY1d2ODdRRnpITG1iOU01TWRhZ09k?=
 =?utf-8?B?emEzNGdtRkY2a2oxMEFnWkUzNG1iUEVma0p1Uk1SNlpRN1UzYk5SZ2Z3NUcw?=
 =?utf-8?B?ZXFYenNzL3VzbERibEFmNTBndlFybFg3R2RzOUU0UjJKOG9IUjJ0clhOZjE1?=
 =?utf-8?B?VEFiRDJST3lxaGtyM1hiQ3V2cXJYSlZUOHMzeEpyZFhhaXUzMEYvMWtSQ1Er?=
 =?utf-8?B?dmRRU2Y2Kzc4cWx5WE1mTms1cG00dXlDVzVuaDhVaDR3c3kwcVJ0ZnFaS2N5?=
 =?utf-8?B?VjlxS0NhR1BnN2VIeGU4Tnd1QWY3aWlhY1NnN3N1eTVYOFlmbWpqZm9FR3V5?=
 =?utf-8?B?VG5ZRVFQdnJudS9RSElaWk5WaXNLMU5pNFZ4ZVI5a1J6NXYxKzZVRi9nRTdt?=
 =?utf-8?B?RWFsWE5JdlBSUHpqQklwazZiRTJ5Z3BjSU9uV3BtRG9FbTRhWm9EODNzKzJM?=
 =?utf-8?B?UXFUK05ISXVBODRiZjRCZjh0RGd1T2lyNVlNKzJ4clNZWGNIN2NZblUxcGdF?=
 =?utf-8?B?L2RPNnYxNm1mVmZtNkVESm9CaXNLOGNUTWJVVDBOS0tKekNSTlRFNzluMTRQ?=
 =?utf-8?B?dTF4Nit2azhUbXFreWwwM09jeUg3dzZ0bXloR2ExQ3lBY0gwUFR0czNoUm5T?=
 =?utf-8?B?ajdGRnM5LzVsV25Md2oxSUo3dTVsZDlpRHl3WmxMaWxwUE5CeE5FQ01zNkZH?=
 =?utf-8?B?WlNsVk0yTEx6QTJiZWozL29xNytJVGx5M1RkeHc0eVZBM2dtaEs5WHBHV2lS?=
 =?utf-8?B?U2ZyTWNLRWpVeGhIdEZtaFRHVkY3bVFVREhHN0VBR2RvYWFReG5XcytSdVR5?=
 =?utf-8?B?TGJKakowcU5BbE1SZWRBdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bVpVdlNHeXlxUmhyU3g2M0U4WHd0YStIRnZLMGhBMWc1TlNoNkJ0QlBrRlE0?=
 =?utf-8?B?cVBEemUyUDIzak5pUitDSDRRdDZ3U1ltbVZ4NTMzZWVKNjJ3N29mZnp6UzVK?=
 =?utf-8?B?VVExd0hpREpqc0k2Y0c3YTBLVStzMjdkZG54bTN1Nmh5eCtpcld2azV0OHc3?=
 =?utf-8?B?a1haUWhyM2NFeVl3cnlmcndWMzlCYXlmVEltQWJSL0haWmNEZG9ucmFDeEtC?=
 =?utf-8?B?bTlDU1hUSnpiQzBNWXkrb0c3UnY5SjE3aThhS1pQdjBoc1hMZjJqbVFGZlZT?=
 =?utf-8?B?ckRSVWxEd28rY2RFQksrQmRUcjNFS2VKblRNTEVCZkFtenBRcHF2Ri9RZDhs?=
 =?utf-8?B?Sk82OVJRQjBiamp1OERQd1M3M1hPYitJMTBqdXpyOGZUd010aFVKRVZ5N0kr?=
 =?utf-8?B?elJCNWJsZmIxdWFkcFEvaFdjMHIxa0FBcDdCQU1qTHZ6dkkvVEJPMXBESXNr?=
 =?utf-8?B?OXN4T2E5OGhncktQOWt6N1QvSTZ6WTRrbW1GUG5EQ2xrd3VJY2UvMWlzYjZ6?=
 =?utf-8?B?YkpINno2LzZmQlVqRXRBMVBhVnRxb3RPd2RoWGNRem1IeFZCcDI5MFF3OE11?=
 =?utf-8?B?dkxpY3c2WEVWdEp6S3c5aS9pZjhGQlVnYVpuaFhmVUswcXBQTVlOS1RJbmRO?=
 =?utf-8?B?Zkxka2FZTC9JRDl2UWkrWGF1YldZeE1OUnJnWkd2Rm1WelFNWmNKdlVlWFVp?=
 =?utf-8?B?WjNHZitpbElFSHRaanU2OEpxSnBkM2xuRHVTUCtvb2ZpQklieEI0ZmFueXRz?=
 =?utf-8?B?UVZ5Y3h1R0tBSDd5a0tHYmtUc0VjY3pVa0tOTC9TeUZENDBkc2VxR0tMbkxU?=
 =?utf-8?B?a2FBOVJqS2lKMDFLbmtWVy9ReHgySjB4SWoxZWgvZDhMSFBzeVlsMWp4dTNz?=
 =?utf-8?B?ZUMvMWJYQ2taT2Y5ZUQyMW1ndVhJNUkreUtFUFVvSTY3elF6TzQzQzQzL1Ax?=
 =?utf-8?B?UTlYa3UxQk85L2lBaEtQTENBVXdibmRldHFRY1lKOVkxR083S2RsR2w3TXVM?=
 =?utf-8?B?c0ttRWo0bDJ6b2JpU0hKOXp5bVFCVU14ME9vazlRYktqM3pGaUJtd3RiVVF6?=
 =?utf-8?B?TzhYaFQ2N0tZcFExdzhDdkFNL0xERWhlNTlzZ2t0L2h3MzZiaE5kbVk5c2Ra?=
 =?utf-8?B?SlhZUytjRnFVZHZuWGZkQ0orNHMwS0IrVjIzeTMwb1dZb2RXeHFzR2NudkV2?=
 =?utf-8?B?MjZlcHpRaGlnZ25SNWwrOWllMTBSUW44TW9EamVZcFpWZ200Z0phVkRBUGRE?=
 =?utf-8?B?aml5UWdTSUplUjR5OFNET2x0VlJncWYwQys2YkpRMmZteHl2a1Q1eWdjWWM2?=
 =?utf-8?B?TGZzTkVNVFVxTEQ3cTd2YjYxaGh6NzlSbmJpZXRiaTdpcDdMNjNaNEdJQ050?=
 =?utf-8?B?YllCdGRuNnlpTFlFZ3hxMlZ3RTV5V3gyb3BIZlFJZG96ZXNXaE1HTGhqck9u?=
 =?utf-8?B?VGUwTzk0ekQ0S1cvSHQyYXJ3K2JVdHJrWXJXUDhaQ2RKcXBJYnJ6djN2WkJ2?=
 =?utf-8?B?aVhtQ2xEWGI4SHZqUDRuZUZnTkJYSGdCRWVtMEZTQXJOWlo4eGFKcW9Vdy9q?=
 =?utf-8?B?enQyNlpaYk84dEJpVjdNVUtGRDM2UXNUbDdpYjUrM28yN3pIWVpmWXd2RExm?=
 =?utf-8?B?RkxOcmcrUExySUE0d2pOazA2TzQwblhvb0ZGYTRZY1BKKzViODNxV2RwRkM3?=
 =?utf-8?B?UWFKcUZ1azFYQTlwL0FTUkk4WmN4Sll5WjMyT1lqS2lJZHV6Z2huamRxTVAz?=
 =?utf-8?B?SGlGdm8rbWxRRzFqRGh5c3RwYkZxaGlkUjg5SkkrSGlBSWJGbWJRdDB5RjFo?=
 =?utf-8?B?aWY0aHlvZmdlOHEvdnJTTXR5VkU4VVdDSTJsQ3crbk94Skg3b01XVVMydGJY?=
 =?utf-8?B?SGNscWplRkhiQkRVd1dqYUpKL0YvNjZBU0Z2WGt3ZWhMOXIyNnE0azd0Nmt0?=
 =?utf-8?B?VWFSTlN5RDg2Y0cyTUdZNTcyUHlKYk96amZuUTRHSkF1ajdmNjNDU29IYzRp?=
 =?utf-8?B?cmhyVTl3a2c5RHZsR2NUWEZWd1hFSjJHQ3JwdUplQjh1NmM2OFJHQmtwcmU3?=
 =?utf-8?B?MWpWN0pYb3VLVGJ3MEtUcjF1Unp5RUVXRjFuMlVKK0NUYjNab1hNY25nbGR3?=
 =?utf-8?Q?pjYyV9eQ84rANiox1rvjoLgPe?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ed9a1ec-d72a-4384-3fa2-08dd15653381
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2024 19:44:15.8672 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q2V3WZ1PUJrQS6TFO11HWkpacvRwC4Yn2XPTq5dkmn7cmALkeBgrYxWjVnPULdsgCRMt9YNSY95C9ZWBqUA41g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5937
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

Thanks for review, next rev is on the way.

Regards,
Zhanjun Dong

On 2024-12-05 12:50 p.m., Teres Alexis, Alan Previn wrote:
> I missed couple of additional things from my prior review - see below.
> However, this is trival so I'll provide conditional R-b as long as you fix these.
> 
> Reviewed-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> 
> P.S. - one question, when you've tested this, are we getting unique batch addresses for each run/engine/test and subtest
> gets the match right (as per the last rev change intent)?
> 
> On Thu, 2024-12-05 at 06:39 -0800, Zhanjun Dong wrote:
>> Submit cmds to the GPU that result in a GuC engine reset and check that
>> devcoredump register dump is generated, by the GuC, and includes the
>> full register range.
>>
>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
>> Cc: Peter Senna Tschudin <peter.senna@intel.com>
>> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>>
>> Changes from prior revs:
>>   v6:-  Adjust start_line to start from 0
>>         Use 7 bit engine_cid, start with random number
>>         Add ioerror detect on fgets
>>         Reorgnize the regular expression
>>         Remove unnecessary radom seed init
>>   v5:-  Detect devcoredump matches the testing engine
>>         Engine will run with random cid
>>   v4:-  Support runs on multiple GPU
>>         Load all devcoredump content to buffer
>>         Alloc line buffer dynamic vs static global memory
>>         Changed to igt_assert_f to provide more info if failed
>>   v3:-  Remove call to bash and awk
>>         Add regular express parse
>>         Detect devcoredump through card index
>>         Add devcoredump removal check
>>   v2:-  Fix CI.build error
>>         Add multiple GPU card support
>> ---
>>   tests/intel/xe_exec_capture.c | 481 ++++++++++++++++++++++++++++++++++
>>   tests/meson.build             |   1 +
>>   2 files changed, 482 insertions(+)
>>   create mode 100644 tests/intel/xe_exec_capture.c
>>
>> diff --git a/tests/intel/xe_exec_capture.c b/tests/intel/xe_exec_capture.c
>> new file mode 100644
>> index 000000000..2c39de595
>> --- /dev/null
>> +++ b/tests/intel/xe_exec_capture.c
>> @@ -0,0 +1,481 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2024 Intel Corporation
>> + */
>> +
>> +/**
>> + * TEST: Basic tests for GuC based register capture
>> + * Category: Core
>> + * Mega feature: General Core features
>> + * Sub-category: CMD submission
>> + * Functionality: Debug
>> + * Test category: functionality test
>> + */
>> +
>> +#include <ctype.h>
>> +#include <fcntl.h>
>> +#include <regex.h>
>> +#include <stdio.h>
>> +#include <string.h>
>> +
>> +#include "igt.h"
>> +#include "igt_device.h"
>> +#include "lib/igt_syncobj.h"
>> +#include "lib/intel_reg.h"
>> +#include "linux_scaffold.h"
>> +#include "xe_drm.h"
>> +#include "xe/xe_ioctl.h"
>> +#include "xe/xe_query.h"
>> +#include "xe/xe_spin.h"
>> +
>> +#define MAX_N_EXECQUEUES               16
>> +#define MAX_INSTANCE                   9
>> +#define GT_RESET                       (0x1 << 0)
>> +#define CLOSE_FD                       (0x1 << 1)
>> +#define CLOSE_EXEC_QUEUES              (0x1 << 2)
>> +#define VIRTUAL                                (0x1 << 3)
>> +#define PARALLEL                       (0x1 << 4)
>> +#define CAT_ERROR                      (0x1 << 5)
> alan: i notice you do not use the GT_RESET -> CAT_ERROR #defines.
Thanks, actully, the above defines, from MAX_INSTANCE to CAT_ERROR are 
not use. To be removed.

>> +
>> +#define BASE_ADDRESS                   0x1a0000
>> +#define ADDRESS_SHIFT                  39
>> +#define CID_ADDRESS_MASK               0x7F
>> +/* Batch buffer element count, in number of dwords(u32) */
>> +#define BATCH_DW_COUNT                 16
>> +
>> +#define MAX_TEMP_LEN                   80
>> +#define MAX_SYSFS_PATH_LEN             128
>> +#define MAX_LINES                      4096
>> +/* Max line buffer size (includes last '\0') */
>> +#define MAX_LINE_LEN                   1024
>> +#define MAIN_BUF_SIZE                  (MAX_LINES * MAX_LINE_LEN * sizeof(char))
>> +/*
>> + * Devcoredump might have long line this test don't care.
>> + * This buffer size used when load dump content
>> + */
>> +#define LINE_BUF_SIZE                  (64 * 1024)
>> +
>> +#define DUMP_PATH                      "/sys/class/drm/card%d/device/devcoredump/data"
>> +#define START_TAG                      "**** Job ****"
>> +#define END_TAG                                "**** VM state ****"
>> +
>> +/* Optional Space */
>> +#define SPC_O                  "[ \t]*"
>> +/* Required Space */
>> +#define SPC                    "[ \t]+"
>> +/* Optional Non-Space */
>> +#define NSPC_O                 "([^ \t]*)"
>> +/* Required Non-Space */
>> +#define NSPC                   "([^ \t]+)"
>> +#define BEG                    "^" SPC_O
>> +#define REQ_FIELD              NSPC SPC
>> +#define REQ_FIELD_LAST         NSPC SPC_O
>> +#define OPT_FIELD              NSPC_O SPC_O
>> +#define END                    SPC_O "$"
>> +
>> +#define REGEX_NON_SPACE_GROUPS BEG REQ_FIELD REQ_FIELD_LAST OPT_FIELD OPT_FIELD OPT_FIELD END
>> +#define REGEX_NON_SPACE_GROUPS_COUNT   6
>> +
>> +#define INDEX_KEY                      1
>> +#define INDEX_VLAUE                    2
> alan: spelling of value
To be fixed.

>> +#define INDEX_ENGINE_PHYSICAL          2
>> +#define INDEX_ENGINE_NAME              1
>> +#define INDEX_ENGINE_INSTANCE          4
>> +
>> +static char *safe_strncpy(char *dst, const char *src, int n)
>> +{
>> +       char *s;
>> +
>> +       igt_assert(n > 0);
>> +       igt_assert(dst && src);
>> +
>> +       s = strncpy(dst, src, n - 1);
>> +       s[n - 1] = '\0';
>> +
>> +       return s;
>> +}
>> +
>> +static const char *xe_engine_class_name(u32 engine_class)
>> +{
>> +       switch (engine_class) {
>> +       case DRM_XE_ENGINE_CLASS_RENDER:
>> +               return "rcs";
>> +       case DRM_XE_ENGINE_CLASS_COPY:
>> +               return "bcs";
>> +       case DRM_XE_ENGINE_CLASS_VIDEO_DECODE:
>> +               return "vcs";
>> +       case DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE:
>> +               return "vecs";
>> +       case DRM_XE_ENGINE_CLASS_COMPUTE:
>> +               return "ccs";
>> +       default:
>> +               igt_warn("Engine class 0x%x unknown\n", engine_class);
>> +               return "unknown";
>> +       }
>> +}
>> +
>> +static void
>> +test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci, int n_exec_queues, int n_execs,
>> +                unsigned int flags, u64 addr)
>> +{
>> +       u32 vm;
>> +       struct drm_xe_sync sync[2] = {
>> +               { .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
>> +               { .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
>> +       };
>> +       struct drm_xe_exec exec = {
>> +               .num_batch_buffer = 1,
>> +               .num_syncs = 2,
>> +               .syncs = to_user_pointer(sync),
>> +       };
>> +       u32 exec_queues[MAX_N_EXECQUEUES];
>> +       u32 syncobjs[MAX_N_EXECQUEUES];
>> +       size_t bo_size;
>> +       u32 bo = 0;
>> +       struct {
>> +               struct xe_spin spin;
>> +               u32 batch[BATCH_DW_COUNT];
>> +               u64 pad;
>> +               u32 data;
>> +       } *data;
>> +       struct xe_spin_opts spin_opts = { .preempt = false };
>> +       int i, b;
>> +
>> +       igt_assert_lte(n_exec_queues, MAX_N_EXECQUEUES);
>> +
>> +       vm = xe_vm_create(fd, 0, 0);
>> +       bo_size = sizeof(*data) * n_execs;
>> +       bo_size = xe_bb_size(fd, bo_size);
>> +
>> +       bo = xe_bo_create(fd, vm, bo_size,
>> +                         vram_if_possible(fd, eci->gt_id),
>> +                         DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>> +       data = xe_bo_map(fd, bo, bo_size);
>> +
>> +       for (i = 0; i < n_exec_queues; i++) {
>> +               exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
>> +               syncobjs[i] = syncobj_create(fd, 0);
>> +       };
>> +
>> +       sync[0].handle = syncobj_create(fd, 0);
>> +       xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, sync, 1);
>> +
>> +       for (i = 0; i < n_execs; i++) {
>> +               u64 base_addr = addr;
>> +               u64 batch_offset = (char *)&data[i].batch - (char *)data;
>> +               u64 batch_addr = base_addr + batch_offset;
>> +               u64 spin_offset = (char *)&data[i].spin - (char *)data;
>> +               u64 sdi_offset = (char *)&data[i].data - (char *)data;
>> +               u64 sdi_addr = base_addr + sdi_offset;
>> +               u64 exec_addr;
>> +               int e = i % n_exec_queues;
>> +
>> +               if (!i) {
>> +                       spin_opts.addr = base_addr + spin_offset;
>> +                       xe_spin_init(&data[i].spin, &spin_opts);
>> +                       exec_addr = spin_opts.addr;
>> +               } else {
>> +                       b = 0;
>> +                       data[i].batch[b++] = MI_STORE_DWORD_IMM_GEN4;
>> +                       data[i].batch[b++] = sdi_addr;
>> +                       data[i].batch[b++] = sdi_addr >> 32;
>> +                       data[i].batch[b++] = 0xc0ffee;
>> +                       data[i].batch[b++] = MI_BATCH_BUFFER_END;
>> +                       igt_assert(b <= ARRAY_SIZE(data[i].batch));
>> +
>> +                       exec_addr = batch_addr;
>> +               }
>> +
>> +               sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
>> +               sync[1].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
>> +               sync[1].handle = syncobjs[e];
>> +
>> +               exec.exec_queue_id = exec_queues[e];
>> +               exec.address = exec_addr;
>> +               if (e != i)
>> +                       syncobj_reset(fd, &syncobjs[e], 1);
>> +               xe_exec(fd, &exec);
>> +       }
>> +
>> +       for (i = 0; i < n_exec_queues && n_execs; i++)
>> +               igt_assert(syncobj_wait(fd, &syncobjs[i], 1, INT64_MAX, 0,
>> +                                       NULL));
>> +       igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
>> +
>> +       sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
>> +       xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
>> +       igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
>> +
>> +       syncobj_destroy(fd, sync[0].handle);
>> +       for (i = 0; i < n_exec_queues; i++) {
>> +               syncobj_destroy(fd, syncobjs[i]);
>> +               xe_exec_queue_destroy(fd, exec_queues[i]);
>> +       }
>> +
>> +       munmap(data, bo_size);
>> +       gem_close(fd, bo);
>> +       xe_vm_destroy(fd, vm);
>> +}
>> +
>> +static char **alloc_lines_buffer(void)
>> +{
>> +       int i;
>> +       char **lines = (char **)malloc(MAX_LINES * sizeof(char *));
>> +       char *main_buf =  (char *)malloc(MAIN_BUF_SIZE);
>> +
>> +       igt_assert_f(lines, "Out of memory.\n");
>> +       igt_assert_f(main_buf, "Out of memory.\n");
>> +
>> +       /* set string array pointers */
>> +       for (i = 0; i < MAX_LINES; i++)
>> +               lines[i] = main_buf + i * MAX_LINE_LEN;
>> +
>> +       return lines;
>> +}
>> +
>> +static char *get_devcoredump_path(int card_id, char *buf)
>> +{
>> +       sprintf(buf, DUMP_PATH, card_id);
>> +       return buf;
>> +}
>> +
>> +static int load_all(FILE *fd, char **lines, char *buf)
>> +{
>> +       int start_line = 0, i = 0;
>> +       bool skip = true;
>> +
>> +       memset(lines[0], 0, MAIN_BUF_SIZE);
>> +       while (!feof(fd) && i < MAX_LINES) {
>> +               /*
>> +                * Devcoredump might have long lines, load up to
>> +                * LINE_BUF_SIZE for a single line
>> +                */
>> +               if (!fgets(buf, LINE_BUF_SIZE, fd))
>> +                       if (ferror(fd) != 0) {
>> +                               igt_warn("Failed to read devcoredump file, error: %d\n",
>> +                                        ferror(fd));
>> +                               break;
>> +                       }
>> +
>> +               if (skip) {
>> +                       start_line++;
>> +                       /* Skip all lines before START_TAG */
>> +                       if (strncmp(START_TAG, buf, strlen(START_TAG)))
>> +                               continue;
>> +                       else
>> +                               skip = false;
>> +               }
>> +
>> +               /* Only save up to MAX_LINE_LEN to buffer */
>> +               safe_strncpy(lines[i++], buf, MAX_LINE_LEN);
>> +
>> +               /* Stop on END_TAG */
>> +               if (!strncmp(END_TAG, buf, strlen(END_TAG)))
>> +                       break;
>> +       }
>> +       return start_line;
>> +}
>> +
>> +static int access_devcoredump(char *path, char **lines, char *line_buf)
>> +{
>> +       int start_line = -1;
>> +       FILE *fd = fopen(path, "r");
>> +
>> +       if (!fd)
>> +               return false;
>> +
>> +       igt_debug("Devcoredump found: %s\n", path);
>> +
>> +       /* Clear memory before load file */
>> +       if (lines)
>> +               start_line = load_all(fd, lines, line_buf);
>> +
>> +       fclose(fd);
>> +       return start_line;
>> +}
>> +
>> +static bool rm_devcoredump(char *path)
>> +{
>> +       int fd = open(path, O_WRONLY);
>> +
>> +       if (fd != -1) {
>> +               igt_debug("Clearing devcoredump.\n");
>> +               write(fd, "0", 1);
>> +               close(fd);
>> +               return true;
>> +       }
>> +
>> +       return false;
>> +}
>> +
>> +static char
>> +*get_coredump_item(regex_t *regex, char **lines, const char *tag, int tag_index, int target_index)
>> +{
>> +       int i;
>> +       regmatch_t match[REGEX_NON_SPACE_GROUPS_COUNT];
>> +
>> +       for (i = 0; i < MAX_LINES; i++) {
>> +               char *line = lines[i];
>> +
>> +               /* Skip lines without tag */
>> +               if (!strstr(line, tag))
>> +                       continue;
>> +
>> +               if ((regexec(regex, line, REGEX_NON_SPACE_GROUPS_COUNT, match, 0)) == 0) {
>> +                       char *key = NULL, *value = NULL;
>> +
>> +                       if (match[tag_index].rm_so >= 0) {
>> +                               key = &line[match[tag_index].rm_so];
>> +                               line[match[tag_index].rm_eo] = '\0';
>> +                       }
>> +                       if (match[target_index].rm_so >= 0) {
>> +                               value = &line[match[target_index].rm_so];
>> +                               line[match[target_index].rm_eo] = '\0';
>> +                       }
>> +
>> +                       if (key && value && strcmp(tag, key) == 0)
>> +                               return value;
>> +                       /* if key != tag,  keep searching and loop to next line */
>> +               }
>> +       }
>> +
>> +       return NULL;
>> +}
>> +
>> +static void
>> +check_item_u64(regex_t *regex, char **lines, const char *tag, u64 addr_lo, u64 addr_hi)
>> +{
>> +       u64 result;
>> +       char *output;
>> +
>> +       igt_assert_f((output = get_coredump_item(regex, lines, tag, INDEX_KEY, INDEX_VLAUE)),
>> +                    "Target not found:%s\n", tag);
>> +       result = strtoul(output, NULL, 16);
>> +       igt_debug("Compare %s %s vs [0x%lX-0x%lX]\n", tag, output, addr_lo, addr_hi);
>> +       igt_assert_f((addr_lo <= result) && (result <= addr_hi),
>> +                    "value %lX out of range[0x%lX-0x%lX]\n", result, addr_lo, addr_hi);
>> +}
>> +
>> +static void
>> +check_item_str(regex_t *regex, char **lines, const char *tag, int tag_index, int target_index,
>> +              const char *target, bool up_to_target_len)
>> +{
>> +       char buf[MAX_TEMP_LEN] = {0};
>> +       char *output;
>> +       int code;
>> +
>> +       igt_assert_f(output = get_coredump_item(regex, lines, tag, tag_index, target_index),
>> +                    "Target not found:%s\n", tag);
>> +
>> +       if (up_to_target_len) {
>> +               igt_assert_f(strlen(target) < MAX_TEMP_LEN, "Target too long.\n");
>> +               safe_strncpy(buf, output, MAX_TEMP_LEN);
>> +               buf[strlen(target)] = 0;
>> +               output = buf;
>> +       }
>> +       code = strncmp(output, target, strlen(target));
>> +       igt_debug("From tag '%s' found %s vs %s\n", tag, output, target);
>> +       igt_assert_f(code == 0, "Expected value:%s, received:%s\n", target, output);
>> +}
>> +
>> +/**
>> + * SUBTEST: reset
>> + * Description: Reset GuC, check devcoredump output values
>> + */
>> +static void test_card(int fd)
>> +{
>> +       struct drm_xe_engine_class_instance *hwe;
>> +       regex_t regex;
>> +       int start_line;
>> +       int engine_cid = rand();
>> +       char **lines;
>> +       char *single_line_buf =  (char *)malloc(LINE_BUF_SIZE);
>> +       char temp[MAX_TEMP_LEN];
>> +       char path[MAX_SYSFS_PATH_LEN];
>> +
>> +       igt_assert_f(single_line_buf, "Out of memory.\n");
>> +
>> +       regcomp(&regex, REGEX_NON_SPACE_GROUPS, REG_EXTENDED | REG_NEWLINE);
>> +       get_devcoredump_path(igt_device_get_card_index(fd), path);
>> +       lines = alloc_lines_buffer();
>> +
>> +       /* clear old devcoredump, if any */
>> +       rm_devcoredump(path);
>> +
>> +       xe_for_each_engine(fd, hwe) {
>> +               /*
>> +                * To test devcoredump register data, the test batch address is
>> +                * used to compare with the dump, address bit 40 to 46 act as
>> +                * context id, which start with an random number, increased 1
>> +                * per engine. By this way, the address is unique for each
>> +                * engine, and start with an random number on each run.
>> +                */
>> +               const u64 addr = BASE_ADDRESS | ((u64)(engine_cid++ % CID_ADDRESS_MASK) <<
>> +                                                ADDRESS_SHIFT);
>> +
>> +               igt_debug("Running on engine class: %x instance: %x\n", hwe->engine_class,
>> +                         hwe->engine_instance);
>> +
>> +               test_legacy_mode(fd, hwe, 1, 1, 0, addr);
>> +
>> +               /* assert devcoredump created */
>> +               igt_assert_f((start_line = access_devcoredump(path, lines, single_line_buf)) > 0,
>> +                            "Devcoredump not exist, errno=%d.\n", errno);
>> +
>> +               sprintf(temp, "instance=%d", hwe->engine_instance);
>> +               check_item_str(&regex, lines, "(physical),", INDEX_ENGINE_PHYSICAL,
>> +                              INDEX_ENGINE_INSTANCE, temp, false);
>> +               check_item_str(&regex, lines, "(physical),", INDEX_ENGINE_PHYSICAL,
>> +                              INDEX_ENGINE_NAME, xe_engine_class_name(hwe->engine_class), true);
>> +
>> +               check_item_str(&regex, lines, "Capture_source:", INDEX_KEY, INDEX_VLAUE,
>> +                              "GuC", false);
>> +               check_item_u64(&regex, lines, "ACTHD:", addr,
>> +                              addr + BATCH_DW_COUNT * sizeof(u32));
>> +               check_item_u64(&regex, lines, "RING_BBADDR:", addr,
>> +                              addr + BATCH_DW_COUNT * sizeof(u32));
>> +
>> +               /* clear devcoredump */
>> +               rm_devcoredump(path);
>> +               sleep(1);
>> +               /* Assert devcoredump removed */
>> +               igt_assert_f(!access_devcoredump(path, NULL, NULL), "Devcoredump not removed\n");
>> +       }
>> +       /* Free lines buffer */
>> +       free(lines);
>> +       free(single_line_buf);
>> +       regfree(&regex);
>> +}
>> +
>> +igt_main
>> +{
>> +       int xe;
>> +
>> +       igt_fixture
>> +               xe = drm_open_driver(DRIVER_XE);
>> +
>> +       igt_subtest("reset") {
>> +               int gpu_count = drm_prepare_filtered_multigpu(DRIVER_XE);
>> +
>> +               igt_require(xe > 0);
>> +               if (gpu_count >= 2) {
>> +                       igt_multi_fork(child, gpu_count) {
>> +                               int gpu_fd;
>> +
>> +                               gpu_fd = drm_open_filtered_card(child);
>> +                               igt_assert_f(gpu_fd > 0, "cannot open gpu-%d, errno=%d\n", child,
>> +                                            errno);
>> +                               igt_assert(is_xe_device(gpu_fd));
>> +
>> +                               test_card(gpu_fd);
>> +                               drm_close_driver(gpu_fd);
>> +                       }
>> +                       igt_waitchildren();
>> +               } else {
>> +                       test_card(xe);
>> +               }
>> +       }
>> +
>> +       igt_fixture
>> +               drm_close_driver(xe);
>> +}
>> diff --git a/tests/meson.build b/tests/meson.build
>> index 2724c7a9a..a6750d523 100644
>> --- a/tests/meson.build
>> +++ b/tests/meson.build
>> @@ -285,6 +285,7 @@ intel_xe_progs = [
>>          'xe_exec_atomic',
>>          'xe_exec_balancer',
>>          'xe_exec_basic',
>> +       'xe_exec_capture',
>>          'xe_exec_compute_mode',
>>          'xe_exec_fault_mode',
>>          'xe_exec_mix_modes',
>> -- 
>> 2.34.1
>>
> 

