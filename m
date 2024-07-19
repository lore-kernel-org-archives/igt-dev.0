Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD78FC3DA5D
	for <igt-dev@archiver.kernel.org>; Fri, 19 Jul 2024 09:01:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E18810EB7C;
	Fri, 19 Jul 2024 09:01:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f/7/MlwX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7CD410EB7C
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Jul 2024 09:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721379691; x=1752915691;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SW8Vbej1xVDUIYimlkTCuMJ3SkyPMhx+bbEv1ySFHJo=;
 b=f/7/MlwXLDXIVDItH6Qx1LKOnEP555DIL3bXaJ8iIwfNSiPUDAAtiTwE
 h/X6YHyHm8HJU91KDdZ25a20QqqDrpZzlVNYYML7b0uyt1D3AJD4o/clR
 5ILQQRaHpzfQUBBVYx0rJutO93HdMWZM3P3wwjzLCrqx1SLDg48LnqkHT
 292Z5MzT+qi5nuv/WYFXX1tgq95YyIjVer7QBNoguZMeT1gNdVyWb1g3q
 B0NQse5kcDrVZzPBgNv8nNQ9VQIyBDq+DRryrncjaYwH9ZWiS4O3ve1Jk
 thK3qMuwKLRvPbK93vu9A49XW93wARrgPdTQv3DX5pc3vKCjDZU/UjkV0 g==;
X-CSE-ConnectionGUID: LYsyLaySSguWJYAuulF3eA==
X-CSE-MsgGUID: sHRh0r0sQN2GZdjHId2y3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11137"; a="30401026"
X-IronPort-AV: E=Sophos;i="6.09,220,1716274800"; d="scan'208";a="30401026"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2024 02:01:22 -0700
X-CSE-ConnectionGUID: 1rgPOXF0Sbm6+Lk9vyMEbw==
X-CSE-MsgGUID: Y/PdsnyoQT+f+lHrS0FD7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,220,1716274800"; d="scan'208";a="55578833"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Jul 2024 02:01:22 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 19 Jul 2024 02:01:22 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 19 Jul 2024 02:01:22 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 19 Jul 2024 02:01:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kgu66nSMWcWzm1teWneWCnkpX2yTIcbNkgd9sRZ59uRjjqsAj//u0WzH/3lbK5YoK466WTO8HomZNWYYt97l/2oda2eYLG7Rk3y7qkG+dVE4oQ3JPRg1mUXJtzuz15zNiM+7ZNcNpN243c4TIhcJnqdZkZ37wz+FEiIcxK4Gtyotuv4Pdfh5aa1c/DOS9wJ+mPB/QTR3WU5CB5/45ZrcR12CB0yktl6v5wqxqTQkdoPWYn9jgwLNiQVdv263XH2T+eXXJUlPrqLwDD6AaLiHVmPYT0GIBPNUFIqy+H6tA6I7/Nai3Fx3HV3vV+uCRCevzMUYUYhNy0HNOYmUonOEng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ps2PItYBoJx4DRE8PAm5ky96YHuxVC40+6OwArD/uGI=;
 b=c+YgsIdqr2MAqQ3FkfnnZjNXpFBefDXesF9eEQN2N55cQe8ZFRrAwiWdKIibF5/Vj4taXjyvlr99xsWziJ+14zBXjq4KPKpZXB1XNzIPVv7QKBCQiBEAp0YA8MOrzr5pwDN1xCCcmk9OyrRkh6FYdtip7Ox5vj1QqWtNwDM6HGfYPcD7FeKtAqfGoCmh+5lqIJ8bcokRbU+ZeZbntHQ5+2iVZScRVGjULVT3W8zyH4EY5YSnj+fCPDLw3wNSIWlIBdOkdGzwhjetRBP2JKoRosbmDbpDT4ti2rCtshqUm6dCXbhDVbJJexTRSWZzwSUAeSZV8AIhh5S/bR3xXljjdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 PH8PR11MB7093.namprd11.prod.outlook.com (2603:10b6:510:217::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28; Fri, 19 Jul
 2024 09:00:35 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245%5]) with mapi id 15.20.7784.017; Fri, 19 Jul 2024
 09:00:35 +0000
Message-ID: <dfd9e002-f155-4757-aa97-961f72d1cbf8@intel.com>
Date: Fri, 19 Jul 2024 14:30:27 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/xe_pm_residency: convert all tests to
 dynamic subtests
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Nilawar, Badal" <badal.nilawar@intel.com>
References: <20240717100057.4186183-1-riana.tauro@intel.com>
 <CY5PR11MB6211FC8FF92CA7DF6846080495AD2@CY5PR11MB6211.namprd11.prod.outlook.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <CY5PR11MB6211FC8FF92CA7DF6846080495AD2@CY5PR11MB6211.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0121.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::11) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|PH8PR11MB7093:EE_
X-MS-Office365-Filtering-Correlation-Id: f0f3f36d-610a-4f85-1658-08dca7d14081
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OUI3MFFYKzVkVEozTFpYREFDOWd3RGxQRUhScFhSOVk4TWtNUXBiWklia2hx?=
 =?utf-8?B?RVJGVlY2ZGwvOFFKZXFMUlB4VGdubkdUTHQwNmhEd1lUNXY0enFqa2JoNXQ2?=
 =?utf-8?B?d0F2YW5jc1FCWUREdHh6SG5VK3IyWit1Ulk1OXJWMHRxWFEwNG53WFdHRHps?=
 =?utf-8?B?S2RSWW5xWE4yYWZzWmFGbFBtMkJVSUJsQTBMdkZvczJrV1ZyMkNIN2lTcEdL?=
 =?utf-8?B?ZnNYNWtEY2dxSk9ibDhRQjZZeGszczAvMHh0WGpHUExFdkY2MXFpY0VGbGhV?=
 =?utf-8?B?Tlc0Yms1aEhzenY3a052K0plUFdsNnd3ZmtJc01hWVhST092bGdraUh6V05Q?=
 =?utf-8?B?TEhMSnJZM2prcWFibzEwdERIenZYQlBlL1hkcEJSbEprVG4zeUpDU2FxVUY5?=
 =?utf-8?B?SWxvYmlETU1ObHNOeHpKbHJsSXNEUnVXQUtSYkROZ0pFdzlST2poMzJQTGVw?=
 =?utf-8?B?eEJZR25Md2ZrRS9oclNMVUVOSWRydWxRN0c0ZS92U2hvUTNoQ0FWNit3R0g2?=
 =?utf-8?B?c1IrYTVrdVRPOHd6NDRQVlBRaDkvWGRJbmF0OGlBdDlTWUVtOTFGeU43V2Y1?=
 =?utf-8?B?VHJUVUhUMjAyV0lSUHpSTGZZdkxMbzZNWG1BK1lzM2tQQ3RlUjZ2akw5SzRs?=
 =?utf-8?B?NmdYR0ZsdWYreWNjbE03bk5LWVVaZE5aZFYyWUF3WGxjVDhqbWt6SGw3QXpT?=
 =?utf-8?B?YjFYUkJDY2JUaGsvaEI0djlqOEpBL1JUdi94U1JJYmRVQnNodUZjY3NBUzNj?=
 =?utf-8?B?cFdEWjU0WWZxazRpNnJPMElPelBac0xKeU9ENTRxdWlKeVFLeTQreEg1azc1?=
 =?utf-8?B?czZtOEpEdzBjVEFGUTFGVUQxMDdsMkxyTUxHZ0hxMzFEN1R4RW5nd1hEYTZV?=
 =?utf-8?B?dTNxaFdXMURkY1BzUmFTQ25aek9zQnlZZ1V3TzU5STg3Z0pTNHA4THBkS2NR?=
 =?utf-8?B?UG5qWVI3YVhsV0ZoQnlhWGhzeEJvam1ROTN0bW0vYWw3TkRoVXd1R3JhU2wx?=
 =?utf-8?B?T0FIdjczbkVXZnJ3R25SNzFhT0haT0Q0SzlGcHRLZ0kyekdVRWhMWnBZOTFi?=
 =?utf-8?B?R2JXWXM4clVrWkRlcE5lczZOc3V6NWZPOFJPR3FJTkV6c3Z1eWJMR2VVWlFr?=
 =?utf-8?B?RkpGdDhuN205WE5WRG9Qa0FCNkkrVEQ3aGJWem96MzJHRXhDbFFyQXJCdTc5?=
 =?utf-8?B?VXZ5QWJWQkhYNEVwemlYMkwzNmZXVElMQld4T2hmWFd6TlVRdzY2OWRWMGth?=
 =?utf-8?B?dUMrMGxjcU53RlBPbjlObGdyTG1Kb0ZTWTFCWmcvbUZnc2d1RktwbkltaEFM?=
 =?utf-8?B?Ynp0bXJML1h2SUh0UTNnVzl6bjc2dDJLdFdkU2lXR2l1UlM0b0tZMGc3eERu?=
 =?utf-8?B?SGg4bkJzYzVZM0x6QXRMM3FZMWdXODF1UUV0MlNzY2F6TkhQZk5tNTk5Nk9G?=
 =?utf-8?B?Z0xLVGJYK3BON2RJY2RTSkZJQ05wVnhtVEErUCtha3ZhaVhPS2tieHlqSFB4?=
 =?utf-8?B?OEl5SWQyNCsxK2VLcThaLzl1YllrUXlUU3ROTVA5NGtFeVBsQlVjZG54S09N?=
 =?utf-8?B?cXFFS2FGQnNxZUl0STlDdUdCemYrM045c2VuSXlvRGhFUE9TSitlODRkbkxQ?=
 =?utf-8?B?bkNwOGloVGc2cmt4UCtGZ1Q0UnVqVXk4cFRGVVI0OXNXUm1ocnptM21acjFN?=
 =?utf-8?B?d0Jod2Y5b3VkTGZjMi9OenlzSU56aWUyOE1mV2ZNaEM3WGlweWJpUEhPemgy?=
 =?utf-8?B?VXdXc09YU1hZRzBXQ2ZMbC9ERGhiYlhQYm40UHZteldZZkh2ZXRuQXozekQ3?=
 =?utf-8?B?ME1NeGozRDJ4cHFhRUxjZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OXlFd2RSaE9ZR0pGUGZNc293N0lBSkpsWWZTa08zUHRZeFNCRVRvWW5NcEFX?=
 =?utf-8?B?bTV6RHo0SGtzT095VEFlUFlzaCtndXh4S3NoQjI2K2htQzlNY0tsc3FodGR6?=
 =?utf-8?B?N0NaMk85a2pEUk5oeDlnbVBzNmVqaWZoVldvTXBHUUR2QXZ4SHB1eWFEQ3R3?=
 =?utf-8?B?QXh6alU5VXJaNFF0QWhZM1oxTVhPNWp3ZFRBaUwvLzVnaFFrZ0F0VWg4UHhE?=
 =?utf-8?B?OFo5N0p4T1d1akdTSkNxNUtIamwzQU8ySVdldVpQeWxFZXR3dzBCVXZ6ZG4y?=
 =?utf-8?B?UkFSQUlRcDBoaEVESUdTdFBUNDVOaWNKOUZuYmQ3N2tqc0N3SHlhOGhud09J?=
 =?utf-8?B?NFM3OGdkdWRJZE1Ca1JBRWZUMjJNdWZRb2tnZGlLcWV5ejRFL2hQWWpURzZy?=
 =?utf-8?B?cHQ3MmJqR0JiV1RlYytxYUUwK1I5SVJaRjRtTk1IK3hCNTdrczl4RjdYWTBK?=
 =?utf-8?B?M1Y0c1BBUzMzc3BnK29lNVFra1VLbHRpYk1jd3ZpL2VnTGtnZWtsb1ZqYmZJ?=
 =?utf-8?B?N0laUmtFRHlONkRqYWhNUWZab0E1QzJoVkp5VGRkcmJ0MWhrZEhlU290WUF6?=
 =?utf-8?B?ejRkeVpKODM1djA5MDB1YVE0akJrQ05iY01ZZXZCNHUzRVh3a3pBdWhDOEo5?=
 =?utf-8?B?Skw3NmJ1ZEVpc3RHVXlTcVlSNG1lTGEvVTVCTzZJVHpTZHZ2Q0tpcXkzRTV1?=
 =?utf-8?B?c3JUWjBFQjIrMWkrVVUwTGVLVk5PSFZ3MUMwWUtkVTV4dXJ4K1lkVGhlVDdy?=
 =?utf-8?B?cjZWSUtkWnVPTXpOWnRkNGVsc2VDRHZ2RUgwMTFXbHdzR254S2dQUUt3d3Zk?=
 =?utf-8?B?M0pSMFRPK3BhY25tTVJQUE1QMUs5M2F2VDl5YmlMaG9HY3JPVXhtc1pUNVZv?=
 =?utf-8?B?Vk5rT1lrN3grVnJ4TGRpYUtMMDYxRTV3blV0NkY0bmNkaTBFVTBzMnVtRDZL?=
 =?utf-8?B?ZTlEaEprbVIyVmU2c2pEU3lzWGg5UDRDN01aVmdTN0hPWThEOSsyeEo2Tk5L?=
 =?utf-8?B?UkNmT3AvOC9LTGljRVdXUjBFc0t4NmVSWmo5M0szSytDblRkR0VSOVZISndI?=
 =?utf-8?B?Tk9FcUI4VWh0RWgxWHZ1ZWZWVzJyUFlBMG80WFJYUUQwNUhqTTB0U1hGRUpD?=
 =?utf-8?B?Vy8zNlovOUxLYkhOQU1ONTM1cEhIek9qSldXRExuVVQ1Y2QyOG1oMXNzLzIr?=
 =?utf-8?B?a3dpN0V1UjRWWFVrUzFOVmVGbCtFdm9YY2pMWThGRUlSMjhqR1VNZ1QvYUFD?=
 =?utf-8?B?L256NExYTzJWQ0tnWmFkcFZSNHhJbjJ5cVVqa0IrOXhxc0g5NS8wMlBIOXVX?=
 =?utf-8?B?cVRmeGhqSnVQQXFRR1hqRTJzVXFlT0xmSFZNdFVtRDZPalZIZEdZWDdmTlJv?=
 =?utf-8?B?cDF6WTd6aXpvbys0czRKd3pTa3lTVkFzUG1MVTlUZXV3WFpqK3FzTllZUWt1?=
 =?utf-8?B?SG56d0wrUEo1UTVwcWRlNjBMSG96MThZNm4xclJYb0NUQjY3eUFZOC9rS2d3?=
 =?utf-8?B?OW0zVGFYY2Z0YnhNTXBHUk8xYVBLOU5BUFNhUEpJQVZ3SW1ON0lNWnJObFZL?=
 =?utf-8?B?MGt1VkZhQk5LNUs3d1ZBR3VFMERDV2tUSDQ2ZXE0emZ6bWVyUUdpeGkyaDJL?=
 =?utf-8?B?Z080OVZTcjdKd1Q4WURIUVVXZ0x1TDBOOXB2alBjSXVZRkZ3dnhSWTk0YkNZ?=
 =?utf-8?B?RDA2RnBpaUU4b2kvK25Ib1BSQVRqZVNERTVwWFpLK3NLTlpMT0RQUWxoK2Qr?=
 =?utf-8?B?NWZ6b3A4enE2OFpPTE5HVjcrdTYrWkQzTHZxeGZidFNOR3ZkUHYzcGN5TWdh?=
 =?utf-8?B?SmRkZGlhb2s0VnRWS1BqS0l4L1VjdVVYZUczeWtVZlJNc3krOTY4YXJ5MDZW?=
 =?utf-8?B?UG9UTElUUlFmdVlnWWlFQU8yU3pqS0pXenpSZmNiRkhYbEdaUk5XallWamMx?=
 =?utf-8?B?dXZrVmhXU2NoM3ZZT2FlWXZsU1NiRGlvUm1XaWFBVHdBYW9sZUYrVEY0Qlla?=
 =?utf-8?B?azVPOUVlbHVJUEhFQUMybDZqTS9OMXdEUG42M3hTVzJ6T01RUkJDMTA5bXg3?=
 =?utf-8?B?RVdNWFFobjZra2dUZVdsbUxOZTY0aTJqc3BuQmM1V1l4ejdSSk9qMWpnNjYr?=
 =?utf-8?Q?bjn2KNAMJ4/UmoRZI/0wmHfbL?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f0f3f36d-610a-4f85-1658-08dca7d14081
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2024 09:00:35.3137 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v53IxCU8ZmtZM+PllaqNquCSWnqhaTgec3iP+L6zuzFTGGqbSpzIeah0cfQbHGDjCdXvh7VvBPrGwkYQLW5MIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7093
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



On 7/19/2024 2:16 PM, Gupta, Anshuman wrote:
> 
> 
>> -----Original Message-----
>> From: Tauro, Riana <riana.tauro@intel.com>
>> Sent: Wednesday, July 17, 2024 3:31 PM
>> To: igt-dev@lists.freedesktop.org
>> Cc: Tauro, Riana <riana.tauro@intel.com>; Gupta, Anshuman
>> <anshuman.gupta@intel.com>; Nilawar, Badal <badal.nilawar@intel.com>
>> Subject: [PATCH i-g-t] tests/intel/xe_pm_residency: convert all tests to
>> dynamic subtests
>>
>> Convert all tests to dynamic subtests to identify which GT the tests are
>> running on.
>>
>> No functional changes
> LGTM.
> Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
> Do you need to add the new test to our test list ?

No change required. Test names are retained. They are only converted to 
dynamic subtests.

The tests have run in BAT in patchwork CI

Thanks,
Riana
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   tests/intel/xe_pm_residency.c | 31 ++++++++++++++++++++-----------
>>   1 file changed, 20 insertions(+), 11 deletions(-)
>>
>> diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
>> index 367b1027c..51735d887 100644
>> --- a/tests/intel/xe_pm_residency.c
>> +++ b/tests/intel/xe_pm_residency.c
>> @@ -233,8 +233,8 @@ static void idle_residency_on_exec(int fd, struct
>> drm_xe_engine_class_instance *
>>   	unsigned long end, start;
>>   	unsigned long elapsed_ms, residency_end, residency_start;
>>
>> -	igt_debug("Running on %s:%d\n",
>> -		  xe_engine_class_string(hwe->engine_class), hwe-
>>> engine_instance);
>> +	igt_info("Running on %s:%d\n",
>> +		 xe_engine_class_string(hwe->engine_class), hwe-
>>> engine_instance);
>>   	done = mmap(0, 4096, PROT_WRITE, MAP_SHARED | MAP_ANON, -1,
>> 0);
>>   	igt_assert(done != MAP_FAILED);
>>   	memset(done, 0, 4096);
>> @@ -321,35 +321,44 @@ igt_main
>>   	}
>>
>>   	igt_describe("Validate GT C6 on idle");
>> -	igt_subtest("gt-c6-on-idle")
>> +	igt_subtest_with_dynamic("gt-c6-on-idle") {
>>   		xe_for_each_gt(fd, gt)
>> -			igt_assert_f(igt_wait(xe_is_gt_in_c6(fd, gt), 1000, 1),
>> "GT %d not in C6\n", gt);
>> +			igt_dynamic_f("gt%u", gt)
>> +				igt_assert_f(igt_wait(xe_is_gt_in_c6(fd, gt),
>> 1000, 1),
>> +					     "GT %d not in C6\n", gt);
>> +	}
>>
>>   	igt_describe("Validate idle residency measured over suspend cycle is
>> within the tolerance");
>> -	igt_subtest("gt-c6-freeze") {
>> +	igt_subtest_with_dynamic("gt-c6-freeze") {
>>   		if (xe_has_vram(fd)) {
>>   			igt_device_get_pci_slot_name(fd, pci_slot_name);
>>   			igt_pm_get_d3cold_allowed(pci_slot_name,
>> &d3cold_allowed);
>>   			igt_pm_set_d3cold_allowed(pci_slot_name, 0);
>>   		}
>>   		xe_for_each_gt(fd, gt)
>> -			test_idle_residency(fd, gt, TEST_S2IDLE);
>> +			igt_dynamic_f("gt%u", gt)
>> +				test_idle_residency(fd, gt, TEST_S2IDLE);
>>
>>   		if (xe_has_vram(fd))
>>   			igt_pm_set_d3cold_allowed(pci_slot_name,
>> d3cold_allowed);
>>   	}
>>
>>   	igt_describe("Validate idle residency measured over a time interval is
>> within the tolerance");
>> -	igt_subtest("idle-residency")
>> +	igt_subtest_with_dynamic("idle-residency") {
>>   		xe_for_each_gt(fd, gt)
>> -			test_idle_residency(fd, gt, TEST_IDLE);
>> +			igt_dynamic_f("gt%u", gt)
>> +				test_idle_residency(fd, gt, TEST_IDLE);
>> +	}
>>
>>   	igt_describe("Validate idle residency on exec");
>> -	igt_subtest("idle-residency-on-exec") {
>> +	igt_subtest_with_dynamic("idle-residency-on-exec") {
>>   		xe_for_each_gt(fd, gt) {
>>   			xe_for_each_engine(fd, hwe) {
>> -				if (gt == hwe->gt_id && !hwe-
>>> engine_instance)
>> -					idle_residency_on_exec(fd, hwe);
>> +				if (gt == hwe->gt_id && !hwe-
>>> engine_instance) {
>> +					igt_dynamic_f("gt%u-engine-%s", gt,
>> +
>> xe_engine_class_string(hwe->engine_class))
>> +						idle_residency_on_exec(fd,
>> hwe);
>> +				}
>>   			}
>>   		}
>>   	}
>> --
>> 2.40.0
> 
