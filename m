Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78F71C021AA
	for <igt-dev@archiver.kernel.org>; Fri, 21 Feb 2025 04:17:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E49810E211;
	Fri, 21 Feb 2025 04:17:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JD5w01ma";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B641E10E211
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Feb 2025 04:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740111461; x=1771647461;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=DqKZmqpn/45jMkky4r36e8A5M9+1/1m7mG09NGHXrlM=;
 b=JD5w01mac96T8+9/U9iyowg65Awfd+new2HyOu/1C0GcbTNfDhQ7C7+T
 nClSiGDoIYKjFCY7ld1y8IeS8CZQBS9OOn2hQXnNWe+IUv3uNF3zJSGDz
 20S0MgvfyyBjXaPWcZh/DTEzJo6dRCGWYY+T7C1mdlZUTXB31+SJTPz8P
 KhfJDO8SEbP4StxKElEUQHX+gHprX+XEymhZSTUyaJioxwR8HKwP8kwOE
 jlc3DPfsMSvwJiz82MaExE8IjEgJPQn2PkJmsUxFpxaBzJkAglzFi6v1m
 Aq9CdKfSgsTtuJTqNzS5CDN7RDc2bmbyFWigwCbDVL4Pbc2j7JOkx3WYx g==;
X-CSE-ConnectionGUID: kvEsMZOnRt+84auLOlKnvg==
X-CSE-MsgGUID: UM4Mj0+WQJCCmVbofkrQTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="40148580"
X-IronPort-AV: E=Sophos;i="6.13,303,1732608000"; d="scan'208";a="40148580"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 20:17:40 -0800
X-CSE-ConnectionGUID: 2KTT05AhQQWsQum7IK/hiQ==
X-CSE-MsgGUID: XILvcB4gTqO9QMyMntLP1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,303,1732608000"; d="scan'208";a="115790745"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 20:17:39 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 20 Feb 2025 20:17:39 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 20 Feb 2025 20:17:38 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 20 Feb 2025 20:17:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v7Xd4meiIis05IbEBfKNzg5kNck/AoNk+sNJ3WNq7BwWtD2YtvkUI91GtM/UYH4PeeoSR/WHSrXyJxZKBfKq7uqkAXArW7+C/HSjrwH78Yg0SZyZuxVThCh2d8VRzVi5x/ytkTeGYdWeUxjnqC7YdTnNXhM9u9Rq5W6VJKaToffiOyETQlqStGN8XbQfLVvfxo3WK9TKPwAbUch7yNqVOmdihyZK11ZOGWJA2p83hvs2Kd21cL5/pqit1saZC9XSpbgttMW5lt4tjg6TZ3MOziHX1h2KEGm22nGmGlWrJ0ixEff7kdvJsUL+d+7AT3+Ubscq7efOwWP6Yk8v/Htxlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HSFZ0cTb+/dlXDSztjgkfCcCQKfuK1uIhPgFUh3ens8=;
 b=D6Bzw8LoTQXTyGXzhLzbY4p63je6iCVSiaJMvUhKUfh3bQ5yKb0VB0h8imzxa4l2dJRvygcOe9sdBk1AFzYmnoTYBviCmW70hAjmYFWAB7kFaECF/dtBiIGHFCYIwLh9w5XDoM58+V9yyBU1Irp5ClMKNKCLTGzhTDeeh3S5YYE1NYFFMv6Y9wddSud6oMMMIv+AdeU9q0V6+9b8mQOiuNjtNw3ENFg8FFXXjKXpe1p9ItZN1nzt7o2vOL+OVg4H4u87uOPcDs7NrCq/CXUh8Upqz7WxRd6nVqM6QnzMuqYNQt6ibR2yZz7+dhGsHrBuJDRUIeLIVS2qIi7HQUuDDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by BY1PR11MB8125.namprd11.prod.outlook.com (2603:10b6:a03:528::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.14; Fri, 21 Feb
 2025 04:17:35 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1%5]) with mapi id 15.20.8466.015; Fri, 21 Feb 2025
 04:17:35 +0000
Message-ID: <8a5bbbee-9c30-47fe-92a5-670398ce0035@intel.com>
Date: Thu, 20 Feb 2025 20:17:31 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2] Add single engine busyness stats in GPUTOP
To: Soham Purkait <soham.purkait@intel.com>, <igt-dev@lists.freedesktop.org>, 
 <riana.tauro@intel.com>, <lucas.demarchi@intel.com>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>
References: <20250214163200.929653-1-soham.purkait@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <20250214163200.929653-1-soham.purkait@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0021.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::26) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|BY1PR11MB8125:EE_
X-MS-Office365-Filtering-Correlation-Id: 7337b32b-13b0-4e86-e518-08dd522eab33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eUxYS3JCZTMzWDJGb1pGWE1yRkN0Rkthb250SC96TUNFeG9rejhxR1JvU2di?=
 =?utf-8?B?NW9FbGY5OE9CdVhzUVBNZWdNbTZVZEhCSHNVNDlEVW5JMGxwU2haUG0yZE1p?=
 =?utf-8?B?dUNNVDJzdWlSSkxZb3d6Sy9VZW9KWWtnT0lnS0dRUERXWXduL2YvMnpFZWNy?=
 =?utf-8?B?b0hIeCs0TDJuc3hQVWZ4aXlnUEZPdHJqL3dNSlZVaTkyemVPcjdEY0poczRr?=
 =?utf-8?B?c1N4elBwbzdYVVd2dy9USkQ2SVpHdThDcDJpOGxFQ1QvZ1Y1Sm9mbmJZZVRI?=
 =?utf-8?B?RlkzUXp2YjltcmIxUnVnZGhjSmZHQ01KQ25MQmowL3RMUEZNZmZ3YXRFZkwr?=
 =?utf-8?B?R0dxS05xay9NaldFcnhCUDlTUzJMbUdyMURtaWUrakpZL0F4bFpXTGthOW5C?=
 =?utf-8?B?Z3JoQ2M0bXplOTBxVi8ybERuVjBHSUU4WVpkQ21zNGdtbTVBTHhUWUhDbnpR?=
 =?utf-8?B?REdBWTVmQ1NkMkhteDl3OE4vRlJaNGc0ZEZtRzgyK3lzMTJ0N2YvSVEveEFU?=
 =?utf-8?B?SEhUNmc2SDJGRWhDQW1IcFVrcU5rUklmUGk1NUoyVXltK0RidUNsamxlRGpp?=
 =?utf-8?B?MWU3N21XZGJnSk9rTlMwakJKU0ZQRndBbG82UUlyNi9XcHRGVjE2S0xyRVpS?=
 =?utf-8?B?aCtvb3gvWHA1NlBZWlFPbUg5QXBON2hoRjlnRVZ1aXgvOVJPOFJJWnhvVHRD?=
 =?utf-8?B?MTRjQlNZSm9NSzAzdkgxL2VNR1M3S0xmNllXb0JycTByVlZvSlBBQ3hEQXlE?=
 =?utf-8?B?Uk5Rc2hMY011eS84MjNRMnFGelRWSlNOUFJiNkFHNG8yNEZ6QzdNcytZSTk0?=
 =?utf-8?B?TWR5dDBBa2IraE9IYTlqdE55dUw3V3N2d3IrSmxqQUdvUFF0bVVlQzJRZFhq?=
 =?utf-8?B?UmZjWDlwZEtXSzNiZ0w1WThuaEptWTFldVQyL0Ura0xjYnhOazlCcjR2Tmcw?=
 =?utf-8?B?dXlnejR3V2tnMitldWdXdVc0NVJyN3hlcUtVWlhiWFd3RituenJEQkhxMVNL?=
 =?utf-8?B?cld6b0xIOXFCZ2VwY1Z3ZSt6MXNkRFI2VCs5ek9CZE1ZVzV1dXEwNWZkQ3I0?=
 =?utf-8?B?MVdjSy9FNzFNWU1rOHQycWNEY21pSkVvM1RxMjdGajc5V0xPaVpLZjYvcjBp?=
 =?utf-8?B?YWJNcFZpTDNhdi9wTXJZekV0K0xTWFB0cnVQZnVkV0FlWWh3SjlLQ21WNmJ2?=
 =?utf-8?B?Vk96Y2YxSzZMbHdWZ3JJeHBveGFIa0JZTTlNZnl3WHBrcWNOdm5uTWkxbmhv?=
 =?utf-8?B?alVwdTBSelhYeHRVNmY0NW9teFZFc2IzakNZZmNuRHVVNit1WEY2UDlTVERX?=
 =?utf-8?B?Tkp3dzR4VFJDL0JWL1ZEbWxwMXNxZisxdmxORjFiNzZpczNnV1lkS0xUc3Jj?=
 =?utf-8?B?eE5BUlpORUFIT0s5K0NLcmh3Q2g1UUcrTlVVUm9kcXVTY29jOFUvZnlabDBi?=
 =?utf-8?B?QlE4UGhPV0JiRElKSEtOeERMaUZ0d0tFOG5rdFM5R0xWT2hiTFRvb3JKYlN3?=
 =?utf-8?B?QlZqb3NxbDFvakVzeVNhRS83U2gxdUloQUxlNFlMTU9Lam9YVFlwcnFtSWRV?=
 =?utf-8?B?THJjUFgzRXRXdURmVy9uMWlhSG9ZZzcwY00yNlArVFIzR3piLzJLaE5nanU5?=
 =?utf-8?B?SW5ROHBhQkdNOFpEODdpaTI1VHlSeHM3eGMxRVJxRlMzWmxES1hHU1ZobEVn?=
 =?utf-8?B?SVNlb3JOTitsZVdNbVozbDltVlFKdzZHWVBmT0hGcnhNMHk4eFBVS1dTcEp4?=
 =?utf-8?B?YzRqV25GczFjM3dVQS96UGNSc05vb3ZKdTRtQ0VQZ3MwVkZzL1ZWenhGMXVV?=
 =?utf-8?B?bGxCQlpma0VuV2xzOC9MY2RTYzBRbHZIeWFKd1RnVzNFWjNKWlRxVGVEUit1?=
 =?utf-8?Q?c2VeYUPj45sns?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TGQ0M0J2WC8zeUpnSFZMajVUTFhPN3crOGVzSEVTYkV6UGdJMTROQ3J3dGhu?=
 =?utf-8?B?U3R0dm5ZSVBJMTYwb2RGdHpXaXBQTHNtYTl4dlZSVE5EQXVhd1RicGhOam1W?=
 =?utf-8?B?eTliZTcwMXplRFN0L2xjTE1QMndJQ2V0Q21PMzUxSmRBUGNlN3llbjZOamh2?=
 =?utf-8?B?MHF5NnRUNkVHbXJuV2ZibHZpVmk0eGJsZ0JvV0dORDQ5anhpNnNzdFpuMksz?=
 =?utf-8?B?Rm1iaHlJZVZRSmlZTHlFaXpWTkp1RWhLMG1MQmV2NFBZaloxZStZSVYydW5w?=
 =?utf-8?B?TGZEcXR3UXdoaVlYVGo1QkRiVnBUZnFvZ1BScis0NGJ4ZmtLM2hVQWY2eEZ0?=
 =?utf-8?B?SElueUs0cGVaSkk0dGdSTzJ0YW9oQ1JaZWtoV2VOZWQyVUhRODFCdEdlQ043?=
 =?utf-8?B?c1RMZjY5YXI3QU5xb1JheFJxc3QyaCs3MmFCMWRuaFFuaG5wV2p2a1orVGNM?=
 =?utf-8?B?b2p4QnJ0Z1dTdEJWdnpyQWxiQUFGRENEbUdWTkVZN2FDWVBzeGhNdHpCMWgy?=
 =?utf-8?B?c2tRTVIyOUVOOVN4UG1CejhHSkdJdjhUQ3p1Y000N0owS1gxUGtiQ05Kd3hX?=
 =?utf-8?B?L2NacXd3R1Q2SGZ0VzZaa3FxZHphbzVaOS9BR1ZhWjRzc1ordUdFaWx3b1Fw?=
 =?utf-8?B?dWZXaEVBL0tkYmNWdk9JUVY1MDhDdkR2NEZQOFdRWVNWbkhFSzlwbysvZHZI?=
 =?utf-8?B?WHZTT0dLSExCUTNKS1krU1IyMVRuN0M2MjVlNUtVRFc2bURJekN1K0xPb3ht?=
 =?utf-8?B?c1FJU1RUekcwK3NZZDEwNTlmVllvSkE3QUtNUkZndmhxbExVUDJxcW5LbGU0?=
 =?utf-8?B?K0lxYytONUtXclYzU3prT1pYMm40VW9IVDNoZFVtTlRTbVZ2cTJkUU8wSnNw?=
 =?utf-8?B?S0FWV21BUUorK29qbiszTUVVSUozcDRDcGpDZ01kVkxpRFVLREx3NlRFRkdh?=
 =?utf-8?B?OFczb29XVUVXb0lTd2V6bXlFQ0lZbDdDc0l2TFQycW9pUy9ZTlVTcWw3SWV2?=
 =?utf-8?B?OENkQTBJakl5MTNKSGZBTlpTTUEwdHJ4ZlE0UDZZd1luNnJKelU2N0FuZXJa?=
 =?utf-8?B?SGZibUVPWVk3cVhVS1oyZUZheEE5L2RWSTVZbkNUZ0ZkMkYwclAvZkFkWEww?=
 =?utf-8?B?Wkd3THg3NTJXVWMzY2J4bk5va0dOTE43L1BwR1Q3SFlwQUdHN1d3aFpJajRo?=
 =?utf-8?B?WWpZZ01NUWxvN1RrMndmU0puNE1YWXBXUVZ6SGJRUWlsSEkwTWllVUUvZnN4?=
 =?utf-8?B?aGh3eGlRaDJTZlo1aWtsVytEbG1IbDBQUmNFM2F1d3VPTTNDSVNKbWcxWXdl?=
 =?utf-8?B?MFpNTmYxQkdNbkZJVkFoT2x6b28zRnE1dFNpZy8vQ3Z3U2N1M3p2MElkSjBp?=
 =?utf-8?B?SW1leEQydTliN3dtMk1PeGVBQ2xTUUsyY1RaVEhxTVhZazAvbXJqNEMzOEN0?=
 =?utf-8?B?VVljRkQ3SEtBa2hJY2VoanVTc3ZTZzYrYUwvbGVMRllCNytNSGNaZXpZVmps?=
 =?utf-8?B?ck9ZbStrY28xbFh0WWlPa3NlMzRFbEQ3aG80WXNQMDlQR1FNcjZYampmYmdO?=
 =?utf-8?B?akxOR1lETXdyS09qN2txSjdMRHE2dGZwb3cxZEE2VjZXeTUrWmFWcmlOSnda?=
 =?utf-8?B?ejQvbmVKUkZ2clV2bkdsaEM5WXYvY0RlRVlVUlcrNjFDMzdQZGtZd3dmOGxj?=
 =?utf-8?B?YUpFZlZHb29pMGVBTERIOEhaS3hmZW5zNmhTaVJndGlHdlIvWkRYUkp3V3do?=
 =?utf-8?B?SzNkTXNZbUpnc3BGWitLMDZGTlovc3NLcGlLTWs0enRkTGNmTjhnK2FmVjd0?=
 =?utf-8?B?T1NPY1lHZzBsYi9FZGdtaVdSSlRmaUZHeWhKL05rK0x3K0JBdEk3Sll1UGJK?=
 =?utf-8?B?RmN2VEl5NHdiQ0FrR0xYOVhrWXg5bnlCWjJldTZqVlRrLzU5YXpQOVdOV0ZG?=
 =?utf-8?B?MVczbDVKVytpamgzNUtFN1JPd0Z2aWh6M2tOczhDRDQ1RDVMTlB2OWMxd1Fh?=
 =?utf-8?B?N3YrNFRkMXYwRG1ibDNHbFJPejVJM1RqZ2krM3RERjVURmwwdFFRczhwenJq?=
 =?utf-8?B?YkxQZGgxcFhLdkl0RDdGSnhLaEhqMGtPRXR6QjNrV3E2Y3lpQ0dKVE9ZdTdB?=
 =?utf-8?B?bDdzTm1XSUpEaDJDSnBDb0V0VkxYMGdtZzk1N3N1UDgxdEc2NkZNMjdDb1NX?=
 =?utf-8?B?emc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7337b32b-13b0-4e86-e518-08dd522eab33
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2025 04:17:35.2377 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O1X5kykxxqJPN4Zqv2o6Qj9nHJBHQSpXd/UZEtKC9vFMshkgrVjfbS2ZcCrR5AXPH7bxXp7x+xyROO0AtXOjWFVySzEvjrEIX75Q1qZdtdQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8125
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


On 2/14/2025 8:32 AM, Soham Purkait wrote:
> Add single engine busyness support in GPUTOP.
> This uses the PMU interface to display the
> busyness of each engine instances.
>
> ENGINES         BUSY
> Render/3D/0   | 96.5% ███████████████████████████████████████▍|
> Blitter/0     | 91.6% █████████████████████████████████████   |
> Video/0       | 56.2% ███████████████████████████             |
> VideoEnhance/0| 97.7% ████████████████████████████████████████|
> Compute/0     | 48.5% ███████████████████████▍                |
>
> v1 : fixed cosmetic issues
>
> v2 : fix for refactoring GPUTOP into a
>       vendor-agnostic tool (Lucas)
>
> ---
>   lib/igt_device_scan.c        |  82 ++++++++
>   lib/igt_device_scan.h        |   5 +
>   lib/igt_perf.c               |  53 ++++++
>   lib/igt_perf.h               |   2 +
>   tools/gputop/common_gputop.c |  51 +++++
>   tools/gputop/common_gputop.h |  16 ++
>   tools/{ => gputop}/gputop.c  | 246 ++++++++++++++++++++----
>   tools/gputop/meson.build     |   6 +
>   tools/gputop/xe_gputop.c     | 359 +++++++++++++++++++++++++++++++++++
>   tools/gputop/xe_gputop.h     |  74 ++++++++
>   tools/meson.build            |   6 +-
>   11 files changed, 858 insertions(+), 42 deletions(-)
>   create mode 100644 tools/gputop/common_gputop.c
>   create mode 100644 tools/gputop/common_gputop.h
>   rename tools/{ => gputop}/gputop.c (65%)
>   create mode 100644 tools/gputop/meson.build
>   create mode 100644 tools/gputop/xe_gputop.c
>   create mode 100644 tools/gputop/xe_gputop.h
>
> diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
> index 711bedc5c..c71db0094 100644
> --- a/lib/igt_device_scan.c
> +++ b/lib/igt_device_scan.c
> @@ -773,6 +773,9 @@ __copy_dev_to_card(struct igt_device *dev, struct igt_device_card *card)
>   	if (dev->drm_render != NULL)
>   		safe_strncpy(card->render, dev->drm_render,
>   			     sizeof(card->render));
> +	if (dev->driver != NULL)
> +		safe_strncpy(card->driver, dev->driver,
> +			     sizeof(card->driver));
>   
>   	if (dev->pci_slot_name != NULL)
>   		safe_strncpy(card->pci_slot_name, dev->pci_slot_name,
> @@ -820,6 +823,61 @@ static bool __find_first_intel_card_by_driver_name(struct igt_device_card *card,
>   	return false;
>   }
>   
> +/*
> + * Iterate over all igt_devices array and find all discrete/integrated card.
> + * @card: double pointer to igt_device_card structure, containing
> + * an array of igt_device_card structure upon successful return.
> + */
> +static int __find_all_intel_card_by_driver_name(struct igt_device_card **card,
> +						bool want_discrete, const char *drv_name)
> +{
> +	int count = 0;
> +	struct igt_device *dev;
> +	int is_integrated;
> +	struct igt_device_card *tmp;
> +	struct igt_device_card *crd =
> +		(struct igt_device_card *)calloc(1, sizeof(struct igt_device_card));
> +
> +	igt_assert(drv_name);
> +	memset(card, 0, sizeof(*card));
> +
> +	igt_list_for_each_entry(dev, &igt_devs.all, link) {
> +		if (!is_pci_subsystem(dev) || strcmp(dev->driver, drv_name))
> +			continue;
> +
> +		is_integrated = !strncmp(dev->pci_slot_name, INTEGRATED_I915_GPU_PCI_ID,
> +				PCI_SLOT_NAME_SIZE);
> +
> +		if (want_discrete && !is_integrated) {
> +			__copy_dev_to_card(dev, (crd + count));
> +			count++;
> +			tmp = realloc(crd, sizeof(struct igt_device_card) * (1 + count));
> +			if (!tmp) {
> +				free(crd);
> +				return -1;
> +			}
> +			crd = tmp;
> +
> +		} else if (!want_discrete && is_integrated) {
> +			__copy_dev_to_card(dev, (crd + count));
> +			count++;
> +			tmp = realloc(crd, sizeof(struct igt_device_card) * (1 + count));
> +			if (!tmp) {
> +				free(crd);
> +				return -1;
> +			}
> +			crd = tmp;
> +		}
> +	}
> +	if (count == 0) {
> +		free(crd);
> +		return 0;
> +	}
> +
> +	*card = crd;
> +	return count;
> +}
> +
>   bool igt_device_find_first_i915_discrete_card(struct igt_device_card *card)
>   {
>   	igt_assert(card);
> @@ -866,6 +924,30 @@ bool igt_device_find_xe_integrated_card(struct igt_device_card *card)
>   	return __find_first_intel_card_by_driver_name(card, false, "xe");
>   }
>   
> +int igt_device_find_all_xe_integrated_card(struct igt_device_card **card)
> +{
> +	igt_assert(card);
> +	return __find_all_intel_card_by_driver_name(card, false, "xe");
> +}
> +
> +int igt_device_find_all_i915_integrated_card(struct igt_device_card **card)
> +{
> +	igt_assert(card);
> +	return __find_all_intel_card_by_driver_name(card, false, "i915");
> +}
> +
> +int igt_device_find_all_xe_discrete_card(struct igt_device_card **card)
> +{
> +	igt_assert(card);
> +	return __find_all_intel_card_by_driver_name(card, true, "xe");
> +}
> +
> +int igt_device_find_all_i915_discrete_card(struct igt_device_card **card)
> +{
> +	igt_assert(card);
> +	return __find_all_intel_card_by_driver_name(card, true, "i915");
> +}
> +
>   static struct igt_device *igt_device_from_syspath(const char *syspath)
>   {
>   	struct igt_device *dev;
> diff --git a/lib/igt_device_scan.h b/lib/igt_device_scan.h
> index 92741fe3c..da107292a 100644
> --- a/lib/igt_device_scan.h
> +++ b/lib/igt_device_scan.h
> @@ -59,6 +59,7 @@ struct igt_device_card {
>   	char subsystem[NAME_MAX];
>   	char card[NAME_MAX];
>   	char render[NAME_MAX];
> +	char driver[NAME_MAX];
>   	char pci_slot_name[PCI_SLOT_NAME_SIZE+1];
>   	uint16_t pci_vendor, pci_device;
>   };
> @@ -92,6 +93,10 @@ bool igt_device_find_first_i915_discrete_card(struct igt_device_card *card);
>   bool igt_device_find_integrated_card(struct igt_device_card *card);
>   bool igt_device_find_first_xe_discrete_card(struct igt_device_card *card);
>   bool igt_device_find_xe_integrated_card(struct igt_device_card *card);
> +int igt_device_find_all_i915_discrete_card(struct igt_device_card **card);
> +int igt_device_find_all_i915_integrated_card(struct igt_device_card **card);
> +int igt_device_find_all_xe_integrated_card(struct igt_device_card **card);
> +int igt_device_find_all_xe_discrete_card(struct igt_device_card **card);
>   char *igt_device_get_pretty_name(struct igt_device_card *card, bool numeric);
>   int igt_open_card(struct igt_device_card *card);
>   int igt_open_render(struct igt_device_card *card);
> diff --git a/lib/igt_perf.c b/lib/igt_perf.c
> index 3866c6d77..3f2f3311f 100644
> --- a/lib/igt_perf.c
> +++ b/lib/igt_perf.c
> @@ -129,6 +129,59 @@ uint64_t igt_perf_type_id(const char *device)
>   	return strtoull(buf, NULL, 0);
>   }
>   
> +int igt_perf_format(const char *device, const char *name, char *buff, int buflen)
> +{
> +	char buf[NAME_MAX];
> +	ssize_t ret;
> +	int fd;
> +
> +	snprintf(buf, sizeof(buf),
> +		 "/sys/bus/event_source/devices/%s/format/%s", device, name);
> +
> +	fd = open(buf, O_RDONLY);
> +	if (fd < 0)
> +		return -1;
> +
> +	ret = read(fd, buff, buflen - 1);
> +	close(fd);
> +	if (ret < 1)
> +		return -1;
> +
> +	buf[ret] = '\0';
> +
> +	return 0;
> +}
> +
> +uint64_t xe_perf_event_config(int xe, const char *pmu_str)

The above 2 functions are already merged in IGT as part of my C6 tests, 
you can remove them from this patch.

Thanks,

Vinay.

> +{
> +	char buf[150];
> +	ssize_t ret;
> +	int fd;
> +	uint64_t config;
> +	char device[30];
> +
> +	snprintf(buf, sizeof(buf),
> +		 "/sys/bus/event_source/devices/%s/events/%s",
> +		 xe_perf_device(xe, device, sizeof(device)),
> +		 pmu_str);
> +
> +	fd = open(buf, O_RDONLY);
> +	if (fd < 0)
> +		return 0;
> +
> +	ret = read(fd, buf, sizeof(buf) - 1);
> +	close(fd);
> +	if (ret < 1)
> +		return 0;
> +
> +	buf[ret] = '\0';
> +	ret = sscanf(buf, "event=0x%lx", &config);
> +	if (ret != 1)
> +		return 0;
> +
> +	return config;
> +}
> +
>   int igt_perf_events_dir(int i915)
>   {
>   	char buf[80];
> diff --git a/lib/igt_perf.h b/lib/igt_perf.h
> index 3d9ba2917..26b9ffa29 100644
> --- a/lib/igt_perf.h
> +++ b/lib/igt_perf.h
> @@ -54,9 +54,11 @@ perf_event_open(struct perf_event_attr *attr,
>   }
>   
>   uint64_t igt_perf_type_id(const char *device);
> +uint64_t xe_perf_event_config(int xe, const char *pmu_event);
>   int igt_perf_events_dir(int i915);
>   int igt_perf_open(uint64_t type, uint64_t config);
>   int igt_perf_open_group(uint64_t type, uint64_t config, int group);
> +int igt_perf_format(const char *device, const char *name, char *buff, int buflen);
>   
>   const char *i915_perf_device(int i915, char *buf, int buflen);
>   uint64_t i915_perf_type_id(int i915);
> diff --git a/tools/gputop/common_gputop.c b/tools/gputop/common_gputop.c
> new file mode 100644
> index 000000000..1188d8e6a
> --- /dev/null
> +++ b/tools/gputop/common_gputop.c
> @@ -0,0 +1,51 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include "common_gputop.h"
> +
> +static const char * const bars[] = { " ", "▏", "▎", "▍", "▌", "▋", "▊", "▉", "█" };
> +
> +void n_spaces(const unsigned int n)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < n; i++)
> +		putchar(' ');
> +}
> +
> +void print_percentage_bar(double percent, int max_len)
> +{
> +	int bar_len, i, len = max_len - 1;
> +	const int w = 8;
> +
> +	len -= printf("|%5.1f%% ", percent);
> +
> +	/* no space left for bars, do what we can */
> +	if (len < 0)
> +		len = 0;
> +
> +	bar_len = ceil(w * percent * len / 100.0);
> +	if (bar_len > w * len)
> +		bar_len = w * len;
> +
> +	for (i = bar_len; i >= w; i -= w)
> +		printf("%s", bars[w]);
> +	if (i)
> +		printf("%s", bars[i]);
> +
> +	len -= (bar_len + (w - 1)) / w;
> +	n_spaces(len);
> +
> +	putchar('|');
> +}
> +
> +int print_engines_footer(int lines, int con_w, int con_h)
> +{
> +	if (lines++ < con_h)
> +		printf("\n");
> +
> +	return lines;
> +}
> diff --git a/tools/gputop/common_gputop.h b/tools/gputop/common_gputop.h
> new file mode 100644
> index 000000000..29ba48d86
> --- /dev/null
> +++ b/tools/gputop/common_gputop.h
> @@ -0,0 +1,16 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +#ifndef COMMON_GPUTOP_H
> +#define COMMON_GPUTOP_H
> +
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <math.h>
> +
> +void print_percentage_bar(double percent, int max_len);
> +int print_engines_footer(int lines, int con_w, int con_h);
> +void n_spaces(const unsigned int n);
> +
> +#endif // COMMON_GPUTOP_H
> diff --git a/tools/gputop.c b/tools/gputop/gputop.c
> similarity index 65%
> rename from tools/gputop.c
> rename to tools/gputop/gputop.c
> index 43b01f566..e53d1f087 100644
> --- a/tools/gputop.c
> +++ b/tools/gputop/gputop.c
> @@ -1,8 +1,7 @@
>   // SPDX-License-Identifier: MIT
>   /*
> - * Copyright © 2023 Intel Corporation
> + * Copyright © 2025 Intel Corporation
>    */
> -
>   #include <assert.h>
>   #include <ctype.h>
>   #include <dirent.h>
> @@ -31,49 +30,78 @@
>   #include "igt_drm_fdinfo.h"
>   #include "igt_profiling.h"
>   #include "drmtest.h"
> +#include "xe/xe_query.h"
> +#include "igt_perf.h"
> +#include "igt_device_scan.h"
> +#include "xe_gputop.h"
>   
> -enum utilization_type {
> -	UTILIZATION_TYPE_ENGINE_TIME,
> -	UTILIZATION_TYPE_TOTAL_CYCLES,
> +/*
> + * Supported Drivers
> + */
> +static const char * const drivers[] = {
> +	"xe",
> +//    "i915", yet to implement
> +    /*Keep the last one NULL*/
> +	NULL
>   };
>   
> -static const char *bars[] = { " ", "▏", "▎", "▍", "▌", "▋", "▊", "▉", "█" };
> -
> -#define ANSI_HEADER "\033[7m"
> -#define ANSI_RESET "\033[0m"
> +/*
> + * Number of supported drivers needs to be adjusted
> + * as per the letgth of the drivers[] array.
> + */
> +#define NUM_DRIVER 1
>   
> -static void n_spaces(const unsigned int n)
> -{
> -	unsigned int i;
> +/*
> + * Supported operations on driver instances.
> + * Update the array of function pointers for
> + * each individual driver specific function.
> + * Maintain the sequence as per drivers[] array.
> + */
> +void *(*discover_engines[NUM_DRIVER])(const void *obj) = {
> +	xe_discover_engines
> +};
>   
> -	for (i = 0; i < n; i++)
> -		putchar(' ');
> -}
> +void (*pmu_sample[NUM_DRIVER])(const void *obj) = {
> +	xe_pmu_sample
> +};
>   
> -static void print_percentage_bar(double percent, int max_len)
> -{
> -	int bar_len, i, len = max_len - 1;
> -	const int w = 8;
> +int (*pmu_init[NUM_DRIVER])(const void *obj) = {
> +	xe_pmu_init
> +};
>   
> -	len -= printf("|%5.1f%% ", percent);
> +int (*print_engines[NUM_DRIVER])(const void *obj, int lines, int w, int h) = {
> +	xe_print_engines
> +};
>   
> -	/* no space left for bars, do what we can */
> -	if (len < 0)
> -		len = 0;
> +/*
> + * Update this devices[] array with initialized
> + * values as per drivers[] array
> + */
> +struct gputop_device {
> +	bool driver_present;
> +	int len;
> +	void *instances;
> +} devices[] = {
> +	{false, 0, NULL}
> +};
>   
> -	bar_len = ceil(w * percent * len / 100.0);
> -	if (bar_len > w * len)
> -		bar_len = w * len;
> +enum utilization_type {
> +	UTILIZATION_TYPE_ENGINE_TIME,
> +	UTILIZATION_TYPE_TOTAL_CYCLES,
> +};
>   
> -	for (i = bar_len; i >= w; i -= w)
> -		printf("%s", bars[w]);
> -	if (i)
> -		printf("%s", bars[i]);
> +#define ANSI_HEADER "\033[7m"
> +#define ANSI_RESET "\033[0m"
>   
> -	len -= (bar_len + (w - 1)) / w;
> -	n_spaces(len);
> +void xe_populate_device_instances(struct gputop_device *dv);
>   
> -	putchar('|');
> +static int find_Driver(struct igt_device_card *card)
> +{
> +	for (int i = 0; drivers[i]; i++) {
> +		if (strcmp(drivers[i], card->driver) == 0)
> +			return i;
> +	}
> +	return -1;
>   }
>   
>   static int
> @@ -305,7 +333,6 @@ static int client_cmp(const void *_a, const void *_b, void *unused)
>   		return 1;
>   	else
>   		return -1;
> -
>   }
>   
>   static void update_console_size(int *w, int *h)
> @@ -333,6 +360,7 @@ static void clrscr(void)
>   struct gputop_args {
>   	long n_iter;
>   	unsigned long delay_usec;
> +	char *device;
>   };
>   
>   static void help(void)
> @@ -343,16 +371,18 @@ static void help(void)
>   	       "\t-h, --help                show this help\n"
>   	       "\t-d, --delay =SEC[.TENTHS] iterative delay as SECS [.TENTHS]\n"
>   	       "\t-n, --iterations =NUMBER  number of executions\n"
> +	       "\t-D, --device              Device filter"
>   	       , program_invocation_short_name);
>   }
>   
>   static int parse_args(int argc, char * const argv[], struct gputop_args *args)
>   {
> -	static const char cmdopts_s[] = "hn:d:";
> +	static const char cmdopts_s[] = "hn:d:D:";
>   	static const struct option cmdopts[] = {
>   	       {"help", no_argument, 0, 'h'},
>   	       {"delay", required_argument, 0, 'd'},
>   	       {"iterations", required_argument, 0, 'n'},
> +	       {"device", required_argument, 0, 'D'},
>   	       { }
>   	};
>   
> @@ -360,6 +390,7 @@ static int parse_args(int argc, char * const argv[], struct gputop_args *args)
>   	memset(args, 0, sizeof(*args));
>   	args->n_iter = -1;
>   	args->delay_usec = 2 * USEC_PER_SEC;
> +	args->device = NULL;
>   
>   	for (;;) {
>   		int c, idx = 0;
> @@ -383,6 +414,9 @@ static int parse_args(int argc, char * const argv[], struct gputop_args *args)
>   				return -1;
>   			}
>   			break;
> +		case 'D':
> +			args->device = optarg;
> +			break;
>   		case 'h':
>   			help();
>   			return 0;
> @@ -403,6 +437,56 @@ static void sigint_handler(int sig)
>   	stop_top = true;
>   }
>   
> +void xe_populate_device_instances(struct gputop_device *dv)
> +{
> +	struct igt_device_card *card_int = NULL, *card_dis = NULL, *cards_combi = NULL;
> +	int count_int = 0, count_dis = 0;
> +
> +	count_int = igt_device_find_all_xe_integrated_card(&card_int);
> +	count_dis = igt_device_find_all_xe_discrete_card(&card_dis);
> +
> +	if (count_int > 0 || count_dis > 0) {
> +		// Allocate memory for the combined array
> +		cards_combi = (struct igt_device_card *)calloc((count_int + count_dis),
> +							       sizeof(struct igt_device_card));
> +		if (!cards_combi) {
> +			fprintf(stderr, "Memory allocation failed for igt_device_card\n");
> +			if (card_int)
> +				free(card_int);
> +			if (card_dis)
> +				free(card_dis);
> +			exit(EXIT_FAILURE);
> +		}
> +
> +		if (card_int) {
> +			memcpy(cards_combi, card_int,
> +			       count_int * sizeof(struct igt_device_card));
> +			free(card_int);
> +		}
> +
> +		if (card_dis) {
> +			memcpy(cards_combi + count_int,
> +			       card_dis, count_dis * sizeof(struct igt_device_card));
> +			free(card_dis);
> +		}
> +
> +		dv->driver_present = true;
> +		dv->len = count_int + count_dis;
> +		dv->instances = calloc(dv->len, sizeof(struct xe_gputop));
> +		for (int i = 0; i < count_int; i++) {
> +			xe_gputop_init((struct xe_gputop *)dv->instances + i,
> +				       cards_combi + i
> +			       );
> +		}
> +
> +		for (int i = 0; i < count_dis; i++) {
> +			xe_gputop_init((struct xe_gputop *)dv->instances + count_int + i,
> +				       cards_combi + count_int + i
> +			       );
> +		}
> +	}
> +}
> +
>   int main(int argc, char **argv)
>   {
>   	struct gputop_args args;
> @@ -422,6 +506,85 @@ int main(int argc, char **argv)
>   	n = args.n_iter;
>   	period_us = args.delay_usec;
>   
> +	igt_devices_scan();
> +
> +	if (args.device) {
> +		struct igt_device_card *card = calloc(1, sizeof(struct igt_device_card));
> +
> +		if (!igt_device_card_match(args.device, card)) {
> +			printf("No device found for the filter\n"
> +				"Showing for all devices\n");
> +				free(card);
> +		} else {
> +			int driver_no = find_Driver(card);
> +
> +			if (driver_no < 0) {
> +				fprintf(stderr, "The driver %s could not be found.", card->driver);
> +				exit(EXIT_FAILURE);
> +			}
> +
> +			devices[driver_no].driver_present = true;
> +			devices[driver_no].len = 1;
> +			switch (driver_no) {
> +			case 0:
> +				devices[driver_no].instances =
> +					calloc(1, sizeof(struct xe_gputop));
> +				xe_gputop_init(devices[driver_no].instances,
> +					       card
> +					      );
> +				break;
> +			}
> +			goto explore_devices;
> +		}
> +	}
> +
> +	for (int i = 0; drivers[i]; i++) {
> +		switch (i) {
> +		case 0: // xe
> +			xe_populate_device_instances(devices + i);
> +			break;
> +		}
> +	}
> +
> +explore_devices:
> +
> +	for (int i = 0; drivers[i]; i++) {
> +		if (devices[i].driver_present) {
> +			for (int j = 0; j < devices[i].len; j++) {
> +				if (!discover_engines[i](devices[i].instances + j)) {
> +					fprintf(stderr,
> +						"Failed to discover engines! (%s)\n",
> +						strerror(errno));
> +					return EXIT_FAILURE;
> +				}
> +				ret = pmu_init[i](devices[i].instances + j);
> +
> +				if (ret) {
> +					fprintf(stderr,
> +						"Failed to initialize PMU! (%s)\n",
> +						strerror(errno));
> +					if (errno == EACCES && geteuid())
> +						fprintf(stderr,
> +							"\n"
> +							"When running as a normal user CAP_PERFMON is required to access performance\n"
> +							"monitoring. See \"man 7 capabilities\", \"man 8 setcap\", or contact your\n"
> +							"distribution vendor for assistance.\n"
> +							"\n"
> +							"More information can be found at 'Perf events and tool security' document:\n"
> +							"https://www.kernel.org/doc/html/latest/admin-guide/perf-security.html\n");
> +
> +					igt_devices_free();
> +					return EXIT_FAILURE;
> +				}
> +			}
> +		}
> +	}
> +
> +	for (int i = 0; drivers[i]; i++) {
> +		for (int j = 0; devices[i].driver_present && j < devices[i].len; j++)
> +			pmu_sample[i](devices[i].instances + j);
> +	}
> +
>   	clients = igt_drm_clients_init(NULL);
>   	if (!clients)
>   		exit(1);
> @@ -442,7 +605,7 @@ int main(int argc, char **argv)
>   
>   	while ((n != 0) && !stop_top) {
>   		struct igt_drm_client *c, *prevc = NULL;
> -		int i, engine_w = 0, lines = 0;
> +		int k, engine_w = 0, lines = 0;
>   
>   		igt_drm_clients_scan(clients, NULL, NULL, 0, NULL, 0);
>   		igt_drm_clients_sort(clients, client_cmp);
> @@ -450,6 +613,14 @@ int main(int argc, char **argv)
>   		update_console_size(&con_w, &con_h);
>   		clrscr();
>   
> +		for (int i = 0; drivers[i]; i++) {
> +			for (int j = 0; devices[i].driver_present && j < devices[i].len; j++) {
> +				pmu_sample[i](devices[i].instances + j);
> +				lines = print_engines[i](devices[i].instances + j,
> +							 lines, con_w, con_h);
> +			}
> +		}
> +
>   		if (!clients->num_clients) {
>   			const char *msg = " (No GPU clients yet. Start workload to see stats)";
>   
> @@ -457,7 +628,7 @@ int main(int argc, char **argv)
>   			       (int)(con_w - strlen(msg) - 1), msg);
>   		}
>   
> -		igt_for_each_drm_client(clients, c, i) {
> +		igt_for_each_drm_client(clients, c, k) {
>   			assert(c->status != IGT_DRM_CLIENT_PROBE);
>   			if (c->status != IGT_DRM_CLIENT_ALIVE)
>   				break; /* Active clients are first in the array. */
> @@ -489,3 +660,4 @@ int main(int argc, char **argv)
>   
>   	return 0;
>   }
> +
> diff --git a/tools/gputop/meson.build b/tools/gputop/meson.build
> new file mode 100644
> index 000000000..0512ac3d6
> --- /dev/null
> +++ b/tools/gputop/meson.build
> @@ -0,0 +1,6 @@
> +gputop_src = [ 'gputop.c', 'common_gputop.c', 'xe_gputop.c']
> +executable('gputop', sources : gputop_src,
> +           install : true,
> +           install_rpath : bindir_rpathdir,
> +           dependencies : [igt_deps,lib_igt_perf,lib_igt_drm_clients,lib_igt_drm_fdinfo,lib_igt_profiling,math],
> +	   install: true)
> diff --git a/tools/gputop/xe_gputop.c b/tools/gputop/xe_gputop.c
> new file mode 100644
> index 000000000..2751a6e4e
> --- /dev/null
> +++ b/tools/gputop/xe_gputop.c
> @@ -0,0 +1,359 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#include "xe_gputop.h"
> +#include "common_gputop.h"
> +
> +#define engine_ptr(engines, n) (&(engines)->engine + (n))
> +
> +static void __update_sample(struct xe_pmu_counter *counter, uint64_t val)
> +{
> +	counter->val.prev = counter->val.cur;
> +	counter->val.cur = val;
> +}
> +
> +static void update_sample(struct xe_pmu_counter *counter, uint64_t *val)
> +{
> +	if (counter->present)
> +		__update_sample(counter, val[counter->idx]);
> +}
> +
> +static const char *class_display_name(unsigned int class)
> +{
> +	switch (class) {
> +	case DRM_XE_ENGINE_CLASS_RENDER:
> +		return "Render/3D";
> +	case DRM_XE_ENGINE_CLASS_COPY:
> +		return "Blitter";
> +	case DRM_XE_ENGINE_CLASS_VIDEO_DECODE:
> +		return "Video";
> +	case DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE:
> +		return "VideoEnhance";
> +	case DRM_XE_ENGINE_CLASS_COMPUTE:
> +		return "Compute";
> +	default:
> +		return "[unknown]";
> +	}
> +}
> +
> +static inline void *clean_up(void *engines)
> +{
> +	if (engines)
> +		free(engines);
> +
> +	return NULL;
> +}
> +
> +static int _open_pmu(uint64_t type, unsigned int *cnt, struct xe_pmu_counter *pmu, int *fd)
> +{
> +	int fd__ = igt_perf_open_group(type, pmu->config, *fd);
> +
> +	if (fd__ >= 0) {
> +		if (*fd == -1)
> +			*fd = fd__;
> +		pmu->present = true;
> +		pmu->idx = (*cnt)++;
> +	}
> +
> +	return fd__;
> +}
> +
> +/* tr_pmu_name()
> + *
> + * Transliterate pci_slot_id to sysfs device name entry for discrete GPU.
> + * Discrete GPU PCI ID   ("xxxx:yy:zz.z")       device = "xe_xxxx_yy_zz.z".
> + */
> +static char *tr_pmu_name(const struct igt_device_card *card)
> +{
> +	int ret;
> +	const int bufsize = 16;
> +	char *buf, *device = NULL;
> +
> +	assert(card->pci_slot_name[0]);
> +
> +	device = malloc(bufsize);
> +	assert(device);
> +
> +	ret = snprintf(device, bufsize, "xe_%s", card->pci_slot_name);
> +	assert(ret == (bufsize - 1));
> +
> +	buf = device;
> +	for (; *buf; buf++)
> +		if (*buf == ':')
> +			*buf = '_';
> +
> +	return device;
> +}
> +
> +void xe_gputop_init(struct xe_gputop *obj,
> +		    struct igt_device_card *card)
> +{
> +	obj->pmu_device = tr_pmu_name(card);
> +	obj->card = card;
> +}
> +
> +static int pmu_format_shift(int xe, const char *name)
> +{
> +	int start, end, ret;
> +	int format;
> +	char device[80], buff[80];
> +
> +	format = igt_perf_format(xe_perf_device(xe, device, sizeof(device)),
> +				 name, buff, sizeof(buff));
> +	if (format)
> +		return 0;
> +
> +	ret = sscanf(buff, "config:%d-%d", &start, &end);
> +	igt_assert(ret >= 1);
> +
> +	return start;
> +}
> +
> +static int engine_cmp(const void *__a, const void *__b)
> +{
> +	const struct xe_engine *a = (struct xe_engine *)__a;
> +	const struct xe_engine *b = (struct xe_engine *)__b;
> +
> +	if (a->drm_xe_engine.engine_class != b->drm_xe_engine.engine_class)
> +		return a->drm_xe_engine.engine_class - b->drm_xe_engine.engine_class;
> +	else
> +		return a->drm_xe_engine.engine_instance - b->drm_xe_engine.engine_instance;
> +}
> +
> +void *xe_discover_engines(const void *obj)
> +{
> +	struct igt_device_card *card = ((struct xe_gputop *)obj)->card;
> +	struct xe_engines *engines;
> +	int ret = 0;
> +	DIR *d;
> +	struct drm_xe_engine_class_instance *hwe;
> +	int card_fd;
> +
> +	if (!card || !strlen(card->card) || !strlen(card->render))
> +		return NULL;
> +
> +	if (strlen(card->card)) {
> +		card_fd = igt_open_card(card);
> +	} else if (strlen(card->render)) {
> +		card_fd = igt_open_render(card);
> +	} else {
> +		fprintf(stderr, "Failed to detect device!\n");
> +		return clean_up(engines);
> +	}
> +	xe_device_get(card_fd);
> +	engines = malloc(sizeof(struct xe_engines));
> +	if (!engines)
> +		return NULL;
> +
> +	memset(engines, 0, sizeof(*xe_engines));
> +
> +	engines->num_engines = 0;
> +	engines->device = ((struct xe_gputop *)obj)->pmu_device;
> +	xe_for_each_engine(card_fd, hwe) {
> +		uint64_t engine_class, engine_instance, gt_shift, param_config;
> +		struct xe_engine *engine;
> +
> +		engine = engine_ptr(engines, engines->num_engines);
> +		gt_shift = pmu_format_shift(card_fd, "gt");
> +		engine_class = pmu_format_shift(card_fd, "engine_class");
> +		engine_instance = pmu_format_shift(card_fd, "engine_instance");
> +		param_config = (uint64_t)hwe->gt_id << gt_shift | hwe->engine_class << engine_class
> +			| hwe->engine_instance << engine_instance;
> +
> +		engine->drm_xe_engine = *hwe;
> +		engine->busy.config = xe_perf_event_config(card_fd, "engine-active-ticks")
> +			| param_config;
> +		engine->total.config = xe_perf_event_config(card_fd, "engine-total-ticks")
> +			| param_config;
> +
> +		if (engine->busy.config == -1 || engine->total.config == -1) {
> +			ret = ENOENT;
> +			break;
> +		}
> +
> +		ret = asprintf(&engine->display_name, "%s/%u",
> +			       class_display_name(engine->drm_xe_engine.engine_class),
> +			       engine->drm_xe_engine.engine_instance);
> +
> +		if (ret <= 0) {
> +			ret = errno;
> +			break;
> +		}
> +		ret = asprintf(&engine->short_name, "%s/%u",
> +			       xe_engine_class_short_string(engine->drm_xe_engine.engine_class),
> +			       engine->drm_xe_engine.engine_instance);
> +
> +		if (ret <= 0) {
> +			ret = errno;
> +			break;
> +		}
> +
> +		engines->num_engines++;
> +		engines = realloc(engines, sizeof(struct xe_engines) +
> +				  engines->num_engines * sizeof(struct xe_engine));
> +		if (!engines) {
> +			ret = errno;
> +			break;
> +		}
> +	}
> +
> +	if (!ret) {
> +		errno = ret;
> +		return clean_up(engines);
> +	}
> +
> +	qsort(engine_ptr(engines, 0), engines->num_engines,
> +	      sizeof(struct xe_engine), engine_cmp);
> +
> +	engines->root = d;
> +	((struct xe_gputop *)obj)->eng_obj = engines;
> +
> +	return engines;
> +}
> +
> +static uint64_t pmu_read_multi(int fd, unsigned int num, uint64_t *val)
> +{
> +	uint64_t buf[2 + num];
> +	unsigned int i;
> +	ssize_t len;
> +
> +	memset(buf, 0, sizeof(buf));
> +
> +	len = read(fd, buf, sizeof(buf));
> +	assert(len == sizeof(buf));
> +
> +	for (i = 0; i < num; i++)
> +		val[i] = buf[2 + i];
> +
> +	return buf[1];
> +}
> +
> +void xe_pmu_sample(const void *obj)
> +{
> +	struct xe_engines *engines = ((struct xe_gputop *)obj)->eng_obj;
> +	const int num_val = engines->num_counters;
> +	uint64_t val[2 + num_val];
> +	unsigned int i;
> +
> +	engines->ts.prev = engines->ts.cur;
> +	engines->ts.cur = pmu_read_multi(engines->fd, num_val, val);
> +
> +	for (i = 0; i < engines->num_engines; i++) {
> +		struct xe_engine *engine = engine_ptr(engines, i);
> +
> +		update_sample(&engine->busy, val);
> +		update_sample(&engine->total, val);
> +	}
> +}
> +
> +int xe_pmu_init(const void *obj)
> +{
> +	struct xe_engines *engines = ((struct xe_gputop *)obj)->eng_obj;
> +	unsigned int i;
> +	int fd;
> +	struct xe_engine *engine;
> +	uint64_t type = igt_perf_type_id(engines->device);
> +
> +	engines->fd = -1;
> +	engines->num_counters = 0;
> +
> +	engine = engine_ptr(engines, 0);
> +	fd = _open_pmu(type, &engines->num_counters, &engine->busy, &engines->fd);
> +	if (fd < 0)
> +		return -1;
> +	fd = _open_pmu(type, &engines->num_counters, &engine->total, &engines->fd);
> +	if (fd < 0)
> +		return -1;
> +
> +	for (i = 1; i < engines->num_engines; i++) {
> +		engine = engine_ptr(engines, i);
> +		fd = _open_pmu(type, &engines->num_counters, &engine->busy, &engines->fd);
> +		if (fd < 0)
> +			return -1;
> +		fd = _open_pmu(type, &engines->num_counters, &engine->total, &engines->fd);
> +		if (fd < 0)
> +			return -1;
> +	}
> +	return 0;
> +}
> +
> +static double pmu_calc_total(struct xe_pmu_pair *p)
> +{
> +	double v;
> +
> +	v = (p->cur - p->prev) / 1e9;
> +	return v;
> +}
> +
> +static double pmu_calc(struct xe_pmu_pair *p, double total_tick)
> +{
> +	double bz = (p->cur - p->prev) / 1e9;
> +	double total;
> +
> +	total = (bz * 100) / total_tick;
> +	return total;
> +}
> +
> +static int
> +print_engines_header(struct xe_engines *engines,
> +		     int lines, int con_w, int con_h)
> +{
> +	const char *a;
> +
> +	for (unsigned int i = 0;
> +	     i < engines->num_engines && lines < con_h;
> +	     i++) {
> +		struct xe_engine *engine = engine_ptr(engines, i);
> +
> +		if (!engine->num_counters)
> +			continue;
> +
> +		a = "            ENGINES   BUSY  ";
> +
> +		printf("\033[7m%s%*s\033[0m\n",
> +		       a,
> +		       (int)(con_w - strlen(a)), " ");
> +
> +		lines++;
> +
> +		break;
> +	}
> +
> +	return lines;
> +}
> +
> +static int
> +print_engine(struct xe_engines *engines, unsigned int i,
> +	     int lines, int con_w, int con_h)
> +{
> +	struct xe_engine *engine = engine_ptr(engines, i);
> +	double total_tick = pmu_calc_total(&engine->total.val);
> +	double percentage = pmu_calc(&engine->busy.val, total_tick);
> +
> +	printf("%*s", (int)(strlen("            ENGINES")), engine->display_name);
> +	//printf("  %5.1f", percentage);
> +	print_percentage_bar(percentage, con_w - strlen("            ENGINES"));
> +	printf("\n");
> +
> +	return ++lines;
> +}
> +
> +int xe_print_engines(const void *obj, int lines, int w, int h)
> +{
> +	struct xe_engines *engines = ((struct xe_gputop *)obj)->eng_obj;
> +	struct xe_engines *show;
> +
> +	show = engines;
> +
> +	lines = print_engines_header(show, lines, w,  h);
> +
> +	for (unsigned int i = 0; i < show->num_engines && lines < h; i++)
> +		lines = print_engine(show, i, lines, w, h);
> +
> +	lines = print_engines_footer(lines, w, h);
> +
> +	return lines;
> +}
> +
> diff --git a/tools/gputop/xe_gputop.h b/tools/gputop/xe_gputop.h
> new file mode 100644
> index 000000000..0f7291563
> --- /dev/null
> +++ b/tools/gputop/xe_gputop.h
> @@ -0,0 +1,74 @@
> +/* SPDX-License-Identifier: MIT
> + *
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef __XE_GPUTOP_H__
> +#define __XE_GPUTOP_H__
> +
> +#include <dirent.h>
> +
> +#include "igt_device_scan.h"
> +#include "xe/xe_query.h"
> +#include "igt_perf.h"
> +#include "common_gputop.h"
> +
> +struct xe_pmu_pair {
> +	uint64_t cur;
> +	uint64_t prev;
> +};
> +
> +struct xe_pmu_counter {
> +	uint64_t type;
> +	uint64_t config;
> +	unsigned int idx;
> +	struct xe_pmu_pair val;
> +	bool present;
> +};
> +
> +struct xe_engine {
> +	const char *name;
> +	char *display_name;
> +	char *short_name;
> +	struct drm_xe_engine_class_instance drm_xe_engine;
> +	unsigned int num_counters;
> +	struct xe_pmu_counter busy;
> +	struct xe_pmu_counter total;
> +};
> +
> +struct xe_engines {
> +	unsigned int num_engines;
> +	unsigned int num_classes;
> +	unsigned int num_counters;
> +	DIR *root;
> +	int fd;
> +	struct xe_pmu_pair ts;
> +	bool discrete;
> +	char *device;
> +	int num_gts;
> +
> +	/* Do not edit below this line.
> +	 * This structure is reallocated every time a new engine is
> +	 * found and size is increased by sizeof (engine).
> +	 */
> +
> +	struct xe_engine engine;
> +
> +};
> +
> +struct xe_gputop {
> +	char *pmu_device;
> +	struct igt_device_card *card;
> +	struct xe_engines *eng_obj;
> +};
> +
> +void xe_gputop_init(struct xe_gputop *obj,
> +		    struct igt_device_card *card);
> +
> +void *xe_discover_engines(const void *obj);
> +void xe_pmu_sample(const void *obj);
> +int xe_pmu_init(const void *obj);
> +int xe_print_engines(const void *obj, int lines, int w, int h);
> +
> +#endif // __XE_GPUTOP_H__
> +
> diff --git a/tools/meson.build b/tools/meson.build
> index f091af380..7a9fdfb9c 100644
> --- a/tools/meson.build
> +++ b/tools/meson.build
> @@ -68,11 +68,6 @@ if libudev.found()
>   		   install : true)
>   endif
>   
> -executable('gputop', 'gputop.c',
> -           install : true,
> -           install_rpath : bindir_rpathdir,
> -           dependencies : [lib_igt_drm_clients,lib_igt_drm_fdinfo,lib_igt_profiling,math])
> -
>   intel_l3_parity_src = [ 'intel_l3_parity.c', 'intel_l3_udev_listener.c' ]
>   executable('intel_l3_parity', sources : intel_l3_parity_src,
>   	   dependencies : tool_deps,
> @@ -121,3 +116,4 @@ endif
>   subdir('i915-perf')
>   subdir('xe-perf')
>   subdir('null_state_gen')
> +subdir('gputop')
> \ No newline at end of file
