Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFB14D6DDD7
	for <igt-dev@archiver.kernel.org>; Fri, 15 Nov 2024 06:38:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A3A610E3A1;
	Fri, 15 Nov 2024 06:38:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KDF+9VeG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5BF510E3A1
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Nov 2024 06:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731652701; x=1763188701;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=/OztFgt/Xr/ENhGIbm/57zXHzjAKExbtGyFpbPERkQY=;
 b=KDF+9VeGQdyTK8G45DhOWK4XSFrSQla+r1auIUMMAMJstkqJcNmbuL4w
 zATOLpRwLO36x+uPGY/Wqak89XpeBx5h19MN0TwDenYzImVA7vFGg+Xck
 CQcv3inc8tCNpFQz8YsPd3UnvvppQa3B21F3inLDfpvu2ztQ4QoHZ7dEw
 IB2mjrGjS4E9SyE1X6wF9zn5LpW0XiwganEUsVn2n0anh6H3xxPwg/8Sx
 1ReZ8PT4mf0++nwqUU5DOmtzIrpt8MmquiS1bX75ukk4ItUfCyIXofvUE
 55otsS0OMEAZUnqT9y96JTeu68etPV97EcXLqU+M6cs9hYNwbBbISfJnQ A==;
X-CSE-ConnectionGUID: 5XCjBgOURPeLDDx5x15bKA==
X-CSE-MsgGUID: 9v9M7xCLTzSHR5VamAqPQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="54139017"
X-IronPort-AV: E=Sophos;i="6.12,156,1728975600"; d="scan'208";a="54139017"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 14:23:44 -0800
X-CSE-ConnectionGUID: S5FtoCGsSMqNCJcxuMrH5w==
X-CSE-MsgGUID: fw2BaPiMSqC1tjzldujf2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; d="scan'208";a="88474697"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2024 14:23:43 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 14 Nov 2024 14:23:42 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 14 Nov 2024 14:23:42 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.49) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 14 Nov 2024 14:23:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kR5toaA4+rPtcdKot6vXURKoR0kgo3RQ1o+TSDjDgBVvt681LRTAjqYW5B6JFKO9Kf0aDg0oZsOeOeSHN7BxqT9LOHjhPqi4qoTautVtCJ0UjV5A4XMVs8cZ3xTM1aikuXrFTjdS7botkXinEpUfP3j7Qt8IlJxZE0ABGfEhTwNKtsP6rlAMwE3lKy8yU/Mv6V2X9hKZ2NY/rqEk+UiVslGzR+Fv856q9zINjYhmcGQYI7wauhOjBDkPGOa5roj+6sDr3sB2Q4NOAA2jKwWxS8wKNRy4hFHlfiyeFu69DQQSKXF1ACIm/WxU/qufy2AIHXBo8yW4RhIEZBAhD4rZIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i/4bFeMt//4Jb+G5bHaOA4ZEv9m52UTMYHdTKFgYvBY=;
 b=VnR6utM+hj2jR7aNoSdazO3tIGLBWizI7lHEVWZGVFuTxDbIZsx/6/Zag9xpfCdpA9Q1ngfThiFNf6C9ilgJ9BjbRXXKbwKC/lBjMh82QIi5zqffrJc9O37//+IXb2wLxKj5vozKvvtaAsTa1kvytUz1ViRWIwxdsNJuNldc/uzwt7qi3WOQWdGYpX3420zo050uG1m7HMdENcTXu2khJrzS8jmChmOKlQ82iW0l1HDdihU0kErenuMpoObucOT2V+xhHjrOiv03DKVy1HuHswbbDpjM1KxICdtzvv+fU8+mbLyTxuRvzETJvHZ8jqSv6wvWMg08lwdcTDa/JySHEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by SJ0PR11MB5166.namprd11.prod.outlook.com (2603:10b6:a03:2d8::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.18; Thu, 14 Nov
 2024 22:23:34 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%6]) with mapi id 15.20.8158.013; Thu, 14 Nov 2024
 22:23:34 +0000
Message-ID: <533ff0ae-6eb3-402f-b6df-aeae10da75d4@intel.com>
Date: Thu, 14 Nov 2024 17:23:30 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4 1/1] tests/intel/xe_exec_capture: Add
 xe_exec_capture test
To: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
References: <20241022163324.383145-1-zhanjun.dong@intel.com>
 <20241022163324.383145-2-zhanjun.dong@intel.com>
 <aa2b9b6f3286a4d150b4bc3f2cd18a6b87a9e327.camel@intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <aa2b9b6f3286a4d150b4bc3f2cd18a6b87a9e327.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0183.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::8) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|SJ0PR11MB5166:EE_
X-MS-Office365-Filtering-Correlation-Id: d2ea2dba-bda6-44e0-3bc8-08dd04faf9ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SkVwU1BvcnkvNWovbTVlREFpZmc0ektOMUdBTHZmMERBLytPTG9UT2RaOEN2?=
 =?utf-8?B?Tmc3b2NTMUc5UG9KZHVTNFhqZkEvTDQ3MDU0TjgzdmhLZVZ1amV0UWN0c0Yw?=
 =?utf-8?B?bjNnaStaa0haT3pnQ2czZjJ2VXdWMzJDRmxnaWJxbXZCcmlMajNxejVwbUpY?=
 =?utf-8?B?d3IxOExqa28rYXlqaVVZcklUV3NIQzQvR3lwcEo5bUR4MStVTlhYSFZBWUZo?=
 =?utf-8?B?UUJobzFlbnV0aU9OOXhJajBsRkNoR0V6VkoyYVUvcHpqOFFBNzlHN3NVMkpU?=
 =?utf-8?B?R1ZYKy9PSy9wN2tGWndBUVdKa3hhU1pFdWxHM0x4a2QzdjJJbkNWREhXTVlP?=
 =?utf-8?B?U0F4WjBDb2ZzK3l5SWNFem9CSDlBQmV4OXFyL3QvTjFpcjBKZjlsbEVRRDZQ?=
 =?utf-8?B?NUN0RU5nNit1SHZXd2dyMnhSSE9QZklhejgzdWVjODV0WWRCUm42K0dtaW9W?=
 =?utf-8?B?NHplYUNObEtxOFgzdTBnS3RsUFV4YlhUUm5oaG9XQmRxTUcrV2dBWmtWTDFp?=
 =?utf-8?B?eC9GTU9YZ0xFT1lxWFNpNUFHZ3RoRjJWLytUTHhVYzRhcklsTXBsVUdiaXMv?=
 =?utf-8?B?bjVsenZ2bms5MGNxdEhqb2RWNHQwMDB1QVpqb01RQUZ1OVJWeXNiM253dFkw?=
 =?utf-8?B?WUp2QXVmL3V6YXBIL1lLbWlEK2RaTFpoRFd5SlZhdEpjMmpxSlhuY2xKWS9w?=
 =?utf-8?B?bkIxcGorblZsekU2ZUg4OFBJZHFvRHROdFppYzBFTVp3eVdKVHFBZS93SXRJ?=
 =?utf-8?B?bDhBR1NUd2FjbDcrYkdwTkVWeE9xZVpYTkJKcWVTbnhOUUhMMDE5RVNGOEQz?=
 =?utf-8?B?eFNuQkprOWNiemVSOFc2RXorV2x2NW9wSk9kQmY3Ym5ScVIwT1lDUkJIN3py?=
 =?utf-8?B?aFJPc05MdWlEVnowRjN1UGY5bC93VldjVWxZeHkzemV4NWVrQi8wbFYxREwx?=
 =?utf-8?B?bUpGSjIzNGRRZyswa001TzNHTUYrYms1T3kxQ3d3bE11U09RQmZCUXNER3hP?=
 =?utf-8?B?Nm5BUHVIUEpBak9weTI4RFhHZXBZNXFUd0FwMVJYR3duenYrMTZ0Q0E5UGRh?=
 =?utf-8?B?dCtmOTlJZ21rV1pDRllSQmd0a1Z6UTNieWdMWENZS1JoV1VHelI5Q1BmaGdI?=
 =?utf-8?B?K3hLc1lZK09wNjZaZmdueTVkUXBwamp1b05hMUxMUm8rRjRRUDNRY1VGWXZH?=
 =?utf-8?B?TGtyYk9Zam1PVDliME9uZ2tjeEJsdUsxSDMwZnBLQ2pqOFVMaGR2U2k0MTZP?=
 =?utf-8?B?TXRNVEdwbW92bjVhRERYM01OZlVlWUl4NkpNTFpkck5xTjgxMHlYZFhqSzhO?=
 =?utf-8?B?WU80d1JveTZaZGx6eE5keVY5MXJrZXcxTFNJUmx0bkpFUUYvdFVCblZ1STFq?=
 =?utf-8?B?WFVoRisrVUZnRkJDaGgwcXJLb3krWDk3VkMrUys1L2dBL2UwMGl6RkdZeGMx?=
 =?utf-8?B?ZG9IQ2FGZTU2akt0cXRGTUR1aUlBV0NLSWd0VUFPVlhaM2Yxb2NOMGFva2Rr?=
 =?utf-8?B?WVNkZExYM3c1TVJqNGwrVUExbU95M1Z3SVByeGZrTlVCVmUyMFFWamdUWVNR?=
 =?utf-8?B?RjFrTFlmQlZMQlJXbFU2dU5DQkVodDlzT3U0K1ZVZ1lqVGxOR2paaUFUUThn?=
 =?utf-8?B?R3FuM1lGVjF3TWxrVjRFWGd6YW9rdlRyNld6ZzRFbmtxYkVkQ3I5S1Ivd0dX?=
 =?utf-8?B?NHRPWFFET2g3SG12YnZadkFzdlB0N3g3T0tZWGRaZVZ1ZmptU20ramdPQkQ0?=
 =?utf-8?Q?dLvMMCcQqN/FF1Rz4KqoippxTllOArF8WXllsYl?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eFJlOUNUYWtES3RMdkFCNmxWMVdkNlVWUzlMUzRuWWFpcUNockNUNmJRMk01?=
 =?utf-8?B?Sytma3ZWSmM5VXpNdlo2cEdqcEhBMkVuMDZjL0l1TU1aSmk2bmUxTEM5YkZP?=
 =?utf-8?B?QTNkSEppMVRyQlhwWjJUa1FBRUdqRHh0NVlZV0diS1hxN0pWc1FrYnYzdmNX?=
 =?utf-8?B?enpGVC8wenFrZ0R5SXFtMVBpckdOSVZqbzdsZ29xWlJucUlGZnByUmV3WkNr?=
 =?utf-8?B?aHVIcm5nOGxvL25LeTFrWjVLS2wwOUM5d0VaTUZFS0JERWVUMlZlL0lZbU9G?=
 =?utf-8?B?NHQzWmNZaG5VbUNrTDZSTEFYanNUVUg4bGNHcjYzdm9yU045bjg5cHRnRVBi?=
 =?utf-8?B?MldCQ05IdFhLTVdJWlNNMlNxQTVHcVJqbE1wSi9OazRhODgyclp5M2pVUStU?=
 =?utf-8?B?RURaUnhTaTkwYUxESDVLRTFUR015M3JBWTVhMmwyZmRma0RINk9DbUJJZzBS?=
 =?utf-8?B?bW8yRFNJTFJtSjJnVWRGSzVBSzJiVU9TQVQyUTZFTVVPRGJudEhWTzllZTJy?=
 =?utf-8?B?TmNDdWtVemVBbWswWkI1NFhBNUZCc2cvWTdrSDJGeGp2bW5XbzZKUjRVeHJJ?=
 =?utf-8?B?T2xoZU1jbm9iRG1jc0ZyM3Vtejc1bjdSNWJYd2JvekVZNktwVTlNZXZpVnpE?=
 =?utf-8?B?dlNoZ2FqV2tNL2ZUNkFHbmh4YnMzMk9Wc1pTalFaczkzeUxZSFhNUWxTZkdj?=
 =?utf-8?B?SWhRd3FpQ0duNlducS9KOCsyR0p1T0h4bUExeWl0Q2RoOWZJbTc5MDdCSXgy?=
 =?utf-8?B?Z0hvU1JaY0QyZU9vcUl4d0pYcm83L0huUnl4NTRveUttamI0LzVMNkdZRjQ1?=
 =?utf-8?B?YmgzR0RqVERYSy9ZTWtwVEg0WHhOV2M0d005bm0vTDVodDFtaEFhYll3Yjkw?=
 =?utf-8?B?UWFKZjBKUy82QTRRNUpiVXZPSlhmWGVqOEZEREFrZkZ5cEVTekgrMU5DRGRm?=
 =?utf-8?B?ZE9OUGEzWUh6cWVIckJNVjQrUFNPc0FJSWxUaEEwNXJFNERGR3lpREhNTlJN?=
 =?utf-8?B?QnRDUXIwTmJqeDcvWVpIYnNMOVNHanNBb3VEVjFvaEhZVGtPSk5iYXVlejc0?=
 =?utf-8?B?Ym5tTW9TTWhWaGh5NVpPaFNiYkFCbm52eklKalMrYUUwRWxzM2dzNXNQUHFN?=
 =?utf-8?B?QkFCVnFzWHdJL1NtazloZU1OYy9vK050dkZwQjRwSWptVFN6cVcxalpkM2p0?=
 =?utf-8?B?OW9TbkhDTUNhcFNib2l2QXlhanZCVWkwZjRSeHVuK2plaFlBdS9VN1BQZm01?=
 =?utf-8?B?bTJmdTRGQ2tBOWx3N1hHRGhmdS9RWlpyT2RaR3g2aXpJa3h1OW9GamtNa3R5?=
 =?utf-8?B?Rk5EWjM3bUF2aWFCYXVjampWQXp4RlQvZjMzd0hMQkR4Y0luVlBCUUVVOG9Y?=
 =?utf-8?B?cERPVk5rUnJiS29qYm5GVmtjeHRWTy9pL1BKYzlhaFdSQkJaNWNLM0VNMkor?=
 =?utf-8?B?S1FNNjV1M2o2c0pMclN2MEZpYldIck5EVmRHTXN1ZXBLWWtrRVZDTVF5aUpS?=
 =?utf-8?B?bFpVZDIyVGc5TDNnd2V3UjFJalpFTGNteG41bDVWZmk4M2dlK3hiWnRIVXlj?=
 =?utf-8?B?ZUQyZm5oTW9zaXAxN040blhyWjRPd3VhNCtSelk4ZXdYSnJHNU5DTUI2eUwy?=
 =?utf-8?B?aTR2YktZTlVCbW1US2VpTll1elVyNUp0Rk1vSmhJOVNZcHJZUU1BZTZ1eWFz?=
 =?utf-8?B?TGVhYW83TXRuYkhpR3dmRmNiY1R1ZFhORDZJL2ZzcXlCMDZvK1NZMnYyeDk0?=
 =?utf-8?B?c0cxRE80eXNxQk9uRGh4YWY3MlRHZXQvRitHZHUrTFJXTmdWZGRxZEROaWVR?=
 =?utf-8?B?M1IydE9xNEJYWk5TQWJ0UVNmQU9GTWlVNzg1dDFxZVEzMXVPZ242NUdJY2U5?=
 =?utf-8?B?eFRJcWxINTZIenh0dVd4R0FWcS9lUEJyYVZUc2k1WllsdkhPRXFDMk9TVS9a?=
 =?utf-8?B?SmRhbnpxNzBNNmpQaTB1MmFEUlltMkdwWFJrcHYzOGo5aklxQ1oyVmFtZFJX?=
 =?utf-8?B?aXB0cHRvek5mdFZCY0hROEx4eWtqdFYzZzhOMHROdUx0NFJydUl5Q05LTkFm?=
 =?utf-8?B?RlNyUEJpd2xFbUZocWxhUUVMTDg2czZ4Rm9taGg3NFc0WTVzcVFQRUs3eFNt?=
 =?utf-8?Q?NhXZEv8dr2dk3fl1mnXDZTEmz?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d2ea2dba-bda6-44e0-3bc8-08dd04faf9ed
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2024 22:23:34.2588 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E/ULtbnH4g/xfZYvUbWI7ADsycoQaAuOWdo6+qVBXXAc3l7GhfuXVhUAk7dNFw7H5rZZN/hd0ln9Cnfh97uevA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5166
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

Please see my comments inline below.

Regards,
Zhanjun Dong

On 2024-11-13 2:48 a.m., Teres Alexis, Alan Previn wrote:
> On Tue, 2024-10-22 at 09:33 -0700, Zhanjun Dong wrote:
>> Test with GuC reset, check if devcoredump register dump is within the
> alan: nit: more clarification? -> "Submit cmds to the GPU that result in a GuC engine reset and check that devcoredump
> register dump is generated, by the GuC, and includes the full register range"?
sure
>> range.
>>
>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>> ---
>>   tests/intel/xe_exec_capture.c | 365 ++++++++++++++++++++++++++++++++++
>>   tests/meson.build             |   1 +
>>   2 files changed, 366 insertions(+)
>>   create mode 100644 tests/intel/xe_exec_capture.c
>>
>> diff --git a/tests/intel/xe_exec_capture.c b/tests/intel/xe_exec_capture.c
>> new file mode 100644
>> index 000000000..3a8fa68f2
>> --- /dev/null
>> +++ b/tests/intel/xe_exec_capture.c
>> @@ -0,0 +1,365 @@
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
>> +#include <stdio.h>
>> +#include <regex.h>
> alan:nit: alphabetical? (I'm not sure if this is a hard rule for std headers)
sure, to be reversed
>> +
>> +#include "igt.h"
>> +#include "igt_device.h"
>> +#include "lib/igt_syncobj.h"
>> +#include "lib/intel_reg.h"
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
>> +
>> +#define BASE_ADDRESS                   0x1a0000
>> +/* Batch buffer element count, in number of dwords(uint32_t) */
>> +#define BATCH_DW_COUNT                 16
>> +
>> +#define MAX_PATH_NAME_LEN              512
>> +#define MAX_LINES                      4096
>> +/* Keep line content up to this length */
>> +#define MAX_LINE_LEN                   1024
>> +#define MAIN_BUF_SIZE                  (MAX_LINES * MAX_LINE_LEN * sizeof(char))
>> +/* Buffer size to read a line */
>> +#define LINE_BUF_SIZE                  (64 * 1024)
>> +
> alan: the above set of definitions are being used for the sole purpose of
> trying to get all of the devcoredump file into a buffer that you can then go through
> an find some specific keywords using strstr in get_coredump_item. However, instead
> of using all these definitions and creating alloc_lines_buffer, load_all and get_coredump_item,
> why not reuse igt_sysfs_get function? is there a reason we are not using that?
Yes, that idea comes from previous version review comments.
By load all into line buffers, then lines buffer index is the 
line_number, make debug easier.
> 
> Alternatively, i am wondering if we can consider the top part of the devcoredump layout
> is persistent and so maybe we dont even need to load so much of the devcoredump?
> i.e. if we dont get any variable length printouts or buffer object dumps
> before the guc error capture then we could simply read the minimal buffer size needed
> to get the initial keywords of the guc error capture dump.
That looks like what I do in V3: only data content between
"**** Job ****"
and
"**** VM state ****"
will be load into buffer and parsed

> 
> 
>> +#define DUMP_PATH                      "/sys/class/drm/card%d/device/devcoredump/data"
>> +#define START_TAG                      "**** Job ****"
>> +#define REGEX_KEY_VALUE_PAIR           "^[ \t]*([^:]+):[ \t]*([^ \t]+)[ \t]*$"
>> +#define REGEX_KEY_INDEX                        1
>> +#define REGEX_VALUE_INDEX              2
>> +#define REGEX_KEY_VALUE_GROUP_COUNT    3
>> +
>> +static void
>> +test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci,
>> +                int n_exec_queues, int n_execs, unsigned int flags)
>> +
> alan: just a question: why are you calling it "test_legacy_mode"?
> i know you are re-using this function from other tests,
> but I'm curious on the history of this name.
Yes, this function is pretty much copy from xe_exec_reset. Keep the same 
name will make reviwer easy to connect it with other test code.

> 
> alan: future follow up: As a side note, we should create a separate task
> item to consolidate the multiple instances of this function currently
> being used by other tests and re-purpose it as an xe library helper.
> This will sure require additional in-out params more input validations
> However, since we need this test to ensure we get guc-error-capture tested
> in CI a little urgently, create a separete internal task for that.
Sounds good for me to do in next step.

>> {
>> +       uint32_t vm;
>> +       const uint64_t addr = BASE_ADDRESS;
>> +       struct drm_xe_sync sync[2] = {
>> +               { .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
>> +               { .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
>> +       };
>> +       struct drm_xe_exec exec = {
>> +               .num_batch_buffer = 1,
>> +               .num_syncs = 2,
>> +               .syncs = to_user_pointer(sync),
>> +       };
>> +       uint32_t exec_queues[MAX_N_EXECQUEUES];
>> +       uint32_t syncobjs[MAX_N_EXECQUEUES];
>> +       size_t bo_size;
>> +       uint32_t bo = 0;
>> +       struct {
>> +               struct xe_spin spin;
>> +               uint32_t batch[BATCH_DW_COUNT];
>> +               uint64_t pad;
>> +               uint32_t data;
>> +       } *data;
>> +       struct xe_spin_opts spin_opts = { .preempt = false };
>> +       int i, b;
>> +
>> +       igt_assert(n_exec_queues <= MAX_N_EXECQUEUES);
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
> alan: nit so you can ignore, but it would be really nice if the flow is
> summarized in a concise comment. Perhaps better to do that when we get
> to doing the conslidation into a helper in future.
> 
>> +       for (i = 0; i < n_execs; i++) {
>> +               uint64_t base_addr = addr;
> alan: i see that for every single batch on all engines (as per the caller that loops
> calling this "test_legacy_mode" per engine, we always use the same batch address.
> 
> However, with the same batch address across all runs of this loop, it means that
> we have no way to catch the following:
> 
> 1. if we encounter a case where the devcoredump retrieved contained a guc-error-capture
> that didnt correlate with the batch we were expecting to get reset on (i.e. the first
> batch of a given current needs to be one getting reset, but we end up with another one),
> then we need to flag that as a warning or failure. (I'm assuming the execution of batches
> on a given queue is guaranteed to be in order).
> 
> 2. if we encounter a case where the devcoredump retrieved contained a guc-error-capture
> of some other engine such as the prior engine that was being tested that we should also
> flag that as a warning or failure.
> 
> That said, i think the batch base address really should be never consistent for any
> two engines and never consistent for any two batches. so maybe... ->
> 
> 	const uint64_t addr = BASE_ADDRESS + (engine_id * (0x100));
> 
> 	... then in the loop...
> 	int e = i % n_exec_queues;
> 	uint64_t base_addr = addr + e * 0x8;
> 
> this way, when we get a devcoredump, we should ensure that the batch address
> matches the engine_id we just tested and ensure its last nibble is always 0x8?

Good idea, I will make the addr different each time when run the test, 
therefor, when we pick up devcoredump, we could ensure the address in 
devcoredump is not from either other engine or from previous run.

> 
>> +               uint64_t batch_offset = (char *)&data[i].batch - (char *)data;
>> +               uint64_t batch_addr = base_addr + batch_offset;
>> +               uint64_t spin_offset = (char *)&data[i].spin - (char *)data;
>> +               uint64_t sdi_offset = (char *)&data[i].data - (char *)data;
>> +               uint64_t sdi_addr = base_addr + sdi_offset;
>> +               uint64_t exec_addr;
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
> alan: so this code is new to me - so to help me understand, can you explain
> if i got this right in terms of what above loop and below sync-waits are doing?:
> 1. so e send n_execs number of batches across n_exec_queues number of queues (on the same engine)
> 2. then, below, we wait on each one of those batches to start.
> 3. And finally we wait for the vm to unbind?
> 
> However, i notice from the caller that you are only doing count batch of one and queue count of one.
> That said, i am kinda wondering that if the batch buffer is doing a spinner, and if this igt
> test coule potentially be running alone without any other workloads, then how would a reset be
> triggered? i thought if we only have 1 workload running with nothing else being queued, then
> the GuC wont have a reason to preempt the work. I also thought we dont have heartbeat in xe...
> am i mistaken? how do we guarantee that an engine reset occurs?
> 
> lets connect offline as i am a bit lost in some of these codes.
I see your reply on this part. We can follow up at later time for 
concerns like set a shorter timeout, sounds like not a blocker.

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
> 
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
>> +static void load_all(FILE *fd, char **lines, char *buf)
>> +{
>> +       int i = 0;
>> +
>> +       memset(lines[0], 0, MAIN_BUF_SIZE);
>> +       while (!feof(fd) && i < MAX_LINES) {
>> +               /*
>> +                * Devcoredump might have long lines, load up to
>> +                * LINE_BUF_SIZE for a single line, buffer reused
>> +                */
>> +               fgets(buf, LINE_BUF_SIZE, fd);
>> +               /* Only save up to MAX_LINE_LEN to buffer */
>> +               strncpy(lines[i++], buf, MAX_LINE_LEN);
>> +       }
>> +}
>> +
>> +static bool access_devcoredump(char *path, char **lines, char *line_buf)
>> +{
>> +       FILE *fd = fopen(path, "r");
>> +
>> +       if (!fd)
>> +               return false;
>> +
>> +       igt_debug("Devcoredump found: %s\n", path);
>> +
>> +       /* Clear memory before load file */
>> +       if (lines)
>> +               load_all(fd, lines, line_buf);
>> +
>> +       fclose(fd);
>> +       return true;
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
>> +static char *get_coredump_item(regex_t *regex, char **lines, const char *tag)
>> +{
>> +       int i;
>> +       regmatch_t match[REGEX_KEY_VALUE_GROUP_COUNT];
>> +
>> +       for (i = 0; i < MAX_LINES; i++) {
>> +               char *line = lines[i];
>> +
>> +               /* Skip lines without tag */
>> +               if (!strstr(line, tag))
>> +                       continue;
>> +
>> +               if (regexec(regex, line, REGEX_KEY_VALUE_GROUP_COUNT, match, 0) == 0) {
>> +                       char *key, *value;
>> +
>> +                       key = &line[match[REGEX_KEY_INDEX].rm_so];
>> +                       line[match[REGEX_KEY_INDEX].rm_eo] = '\0';
>> +                       value = &line[match[REGEX_VALUE_INDEX].rm_so];
>> +                       line[match[REGEX_VALUE_INDEX].rm_eo] = '\0';
>> +
>> +                       if (strcmp(tag, key) == 0)
>> +                               return value;
>> +                       /* if key != tag,  keep searching and loop to next line */
>> +               }
>> +       }
>> +
>> +       return NULL;
>> +}
>> +
>> +static void check_item_u64(regex_t *regex, char **lines, const char *tag, uint64_t addr_lo,
>> +                          uint64_t addr_hi)
>> +{
>> +       uint64_t result;
>> +       char *output;
>> +
>> +       igt_assert_f(output = get_coredump_item(regex, lines, tag), "Target not found:%s", tag);
>> +       result = strtoul(output, NULL, 16);
>> +       igt_debug("Compare %s: %s vs [0x%lX-0x%lX]\n", tag, output, addr_lo, addr_hi);
>> +       igt_assert_f((addr_lo <= result) && (result <= addr_hi),
>> +                    "value %lX out of range[0x%lX-0x%lX]\n", result, addr_lo, addr_hi);
>> +}
>> +
>> +static void check_item_str(regex_t *regex, char **lines, const char *tag, const char *target)
>> +{
>> +       char *output;
>> +
>> +       igt_assert_f(output = get_coredump_item(regex, lines, tag), "Target not found:%s", tag);
>> +       igt_debug("Compare %s: %s vs %s\n", tag, output, target);
>> +       igt_assert_f(!strcmp(output, target), "Expected value:%s, received:%s\n", target, output);
>> +}
>> +
>> +static void check_capture_out(regex_t *regex, char **lines)
>> +{
>> +       check_item_str(regex, lines, "Capture_source", "GuC");
>> +       check_item_u64(regex, lines, "ACTHD", BASE_ADDRESS,
>> +                      BASE_ADDRESS + BATCH_DW_COUNT * sizeof(uint32_t));
>> +       check_item_u64(regex, lines, "RING_BBADDR", BASE_ADDRESS,
>> +                      BASE_ADDRESS + BATCH_DW_COUNT * sizeof(uint32_t));
> alan: why are we not checking the engine instance - ensure the drm_queue's engine (the one we just
> tested to hang) matches what  the devcoredump dumped?
Good idea, will check engine name in next rev.
> 
>> +}
>> +
>> +/**
>> + * SUBTEST: reset
>> + * Description: Reset GuC, check devcoredump output values
>> + */
>> +static void test_card(int fd)
> alan: nit: maybe rename from "test_card" to some a bit more descriptive like
> "trigger_hwe_resets_and_verify_devcoredump"?
Ok, np
>> +{
>> +       struct drm_xe_engine_class_instance *hwe;
>> +       regex_t regex;
>> +       char **lines;
>> +       char *single_line_buf =  (char *)malloc(LINE_BUF_SIZE);
>> +       char path[MAX_PATH_NAME_LEN];
>> +
>> +       igt_assert_f(single_line_buf, "Out of memory.\n");
>> +
>> +       regcomp(&regex, REGEX_KEY_VALUE_PAIR, REG_EXTENDED | REG_NEWLINE);
>> +       get_devcoredump_path(igt_device_get_card_index(fd), path);
>> +       lines = alloc_lines_buffer();
>> +
>> +       /* clear old devcoredump, if any */
>> +       rm_devcoredump(path);
>> +
>> +       xe_for_each_engine(fd, hwe) {
>> +               igt_debug("Running on engine class: %x instance: %x\n", hwe->engine_class,
>> +                         hwe->engine_instance);
>> +               test_legacy_mode(fd, hwe, 1, 1, 0);
> alan: nit: maybe rename test_legacy_mode to trigger_reset?
> actually i wonder if this entire subtest can reuse the
I think is better to keep the same name if we copy the most code from 
other test.
>> +
>> +               /* assert devcoredump created */
>> +               igt_assert_f(access_devcoredump(path, lines, single_line_buf),
>> +                            "Devcoredump not exist, errno=%d.\n", errno);
>> +
>> +               check_capture_out(&regex, lines);
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
> alan: if we want to fork, then we ought to ensure that any igt_debug/warn/error/print functions
> that report important info (during the batch buffer execution and retrieval + verification of
> the devcoredumps) contain a way to differentiate which fd we are refering to.
> Please ignore this comment if in fact igt_debug already has that built-in.
Yes, igt_debug already has it built-in, output example from ATSM:

(xe_exec_capture:4189) <g:1> DEBUG: Running on engine class: 4 instance: 0
(xe_exec_capture:4189) <g:1> DEBUG: Devcoredump found: 
/sys/class/drm/card2/device/devcoredump/data
(xe_exec_capture:4189) <g:1> DEBUG: Compare Capture_source: GuC vs GuC
(xe_exec_capture:4189) <g:1> DEBUG: Compare ACTHD: 0x00000700001a0020 vs 
[0x700001A0000-0x700001A0040]
(xe_exec_capture:4189) <g:1> DEBUG: Compare RING_BBADDR: 
0x00000700001a0001 vs [0x700001A0000-0x700001A0040]
(xe_exec_capture:4189) <g:1> DEBUG: Clearing devcoredump.
(xe_exec_capture:4187) <g:0> drmtest-DEBUG: Opened GPU0 card: /dev/dri/card1
(xe_exec_capture:4187) <g:0> drmtest-DEBUG: Opened previously opened 
device: /dev/dri/card1
(xe_exec_capture:4187) <g:0> DEBUG: Running on engine class: 0 instance: 0

Messages differentiated by "<g:x>", x increase per forked children, due 
to 1 forcked thread open 1 fd, so no mixed info here.

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
>> index 2d8cb87d5..b724a7c6d 100644
>> --- a/tests/meson.build
>> +++ b/tests/meson.build
>> @@ -284,6 +284,7 @@ intel_xe_progs = [
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

