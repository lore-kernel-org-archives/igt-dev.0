Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F634C0219B
	for <igt-dev@archiver.kernel.org>; Tue, 11 Feb 2025 12:44:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E903E10E1A9;
	Tue, 11 Feb 2025 12:44:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dNhfisLz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A8DC10E1A9
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Feb 2025 12:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739277873; x=1770813873;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=1M4rbHTEVfVoGbB6Y3sBP6Jj8/53jxFFKN5xzh33fpc=;
 b=dNhfisLzwZ2NmBayjHHmlP0lQJyJ6zaGDwaBpvixCa8/GdVrS7yeTOGu
 Fy2MDLKYjNeFlYs58TKNbz1JZlEzUFMLlhXwigCJXU1jyyWrbpbZJu9Oq
 EaWexhJDohuoHOIHANNhAYNlgBV5fS5spOlaijEFhLlrXvKCoC3VKIwEd
 K1t/xl3mKvQdN7dZLpIANFnJo9AoyXSQjNefgaN/i4gPAw26re/5b9jOv
 9wVT25PCKsXegiIB/H9XFpOroLh5bBv6cRPGHYV/Lti/2IZT4MdUIKlhR
 Wub4/JC+xDUO4td2g8ITAkrMACSJMxhZpXIix6SJdOlPzlmFpyTVU/Ua0 w==;
X-CSE-ConnectionGUID: TAxt2KzPQNCRk9cRgHmPxg==
X-CSE-MsgGUID: 8Lw85serQoC4HHYqYY+ItQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="43655177"
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; d="scan'208";a="43655177"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 04:44:32 -0800
X-CSE-ConnectionGUID: p13XxyXYRrmVR4m1SNnqrA==
X-CSE-MsgGUID: FZQVWJgWQUaR7USop8N0RQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; d="scan'208";a="112456502"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Feb 2025 04:44:32 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 11 Feb 2025 04:44:31 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 11 Feb 2025 04:44:31 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 11 Feb 2025 04:44:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mY8DZ87mxsH3vx9naNp7Pqi7Kc0H2JPdQaWC6V20ldTWb4VICBA8cS7m/Rfvw4GxGowEzQbhIAEG0mqz8GoaUDSzX2KAVnm96ZtvfUvhTduYBbEXK515OoAUhP2SzI99oRGHOPH5CCF4aerWblb/21+sbCZVzWtUrZPQDxtUKVMN4Yo3GmXsVRhN69gcGv6ULjL21/+7SqE6vjV864QInbJCU6icm9Eq5KjFddobhkok3HK8Pskahhx7mtlTQn5TfqDTReIPzUVfsE7dz3MZmSMI/BjdJE6DP2fDg4G73g1nvukwiMAcRk/VC4Tm19hhrI0/6QwViNTdm7pnkLl1aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HHUdaPxYAkeAZbQDEWgdD/G2H+oIuMcGWUECy8pYDew=;
 b=BaKkeUdUfoBYdV6srhxj95poDRUl1OLK0suln76swr9X1Z9ZHx537hbF15un/srjKNllkL1K/uEJ0/uJWIl3ESWpOx7637aTQX74JyMpQLnPwqkrr1wnf9OQLwnIhMnUXjHnPf9DaPKSTLF9CeesbMvv+h8nkFriWOy3Lot4HIe6dP0Zb96Cgzl+0TAp9ZS/mda/JFJq6HAulfxIr2GVaovEx0fWXXmgRhy38fWuJOgiITGNfn47PvrY71UwOzDmUyFJPHUaVCKoq31DJChq0+aI/LNrFOJF4h9aZUGhDFj+dZkqO5BgN178s1B9Z6UFV/PSs+ZusFJW7hUxLbzrSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by PH7PR11MB6606.namprd11.prod.outlook.com (2603:10b6:510:1b1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.10; Tue, 11 Feb
 2025 12:44:28 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%7]) with mapi id 15.20.8422.015; Tue, 11 Feb 2025
 12:44:27 +0000
Message-ID: <95f3a5e7-f8e9-42d2-ad2e-ae2138a71b50@intel.com>
Date: Tue, 11 Feb 2025 18:14:21 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/6] tests/intel/kms_mst_helper: add helper for
 MST-related functions
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, Kunal Joshi <kunal1.joshi@intel.com>
References: <20250210185606.1327892-1-kunal1.joshi@intel.com>
 <20250210185606.1327892-2-kunal1.joshi@intel.com>
 <3494168b-d8cf-4847-b000-6dd21bc0c68f@intel.com>
 <20250211083412.vzt4pgqoyy4fpjwq@kamilkon-desk.igk.intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20250211083412.vzt4pgqoyy4fpjwq@kamilkon-desk.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR01CA0184.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::13) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|PH7PR11MB6606:EE_
X-MS-Office365-Filtering-Correlation-Id: b680d5b5-4e26-430c-6fb8-08dd4a99d23b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U01wVTQ1eExqY1hmSlFWb3lUelFyVUUwL2xDQ0JzQ0poZ2hlRVd6THdXWTBk?=
 =?utf-8?B?S2pHeURTUUxjNUZ4QkpPUE82NVNwSkViRU9iQlNEbTdIanB5ZklhOURZNFc3?=
 =?utf-8?B?YTNOQ1duV0V3dytVMkN5YkhWdjR3MzJvejRzU3JmNENYejlWc1Uwc1FjTjFx?=
 =?utf-8?B?SEY1NmZCdmxmTWNyV1RXOEJCdElvdEtxZ0lMdkJmSzd6RDZ2NE9obU9ONVRr?=
 =?utf-8?B?eFBzUEtNa3VXYk9tdEFLeElMRmdLekFkWUV2YXlyVnFObnM2U2g0RlpDamFO?=
 =?utf-8?B?ajdLOWtXdk51WTM1dnJLUThmMHBCVFZ2WkdLdUc0N2U4bkhCaFh3TkFnV3p2?=
 =?utf-8?B?K0s5Slk4M3RVWXgxbkVqVkFuaForQnJuWkdnbG85S1Z2Qm1GRnpwdkNTYzRN?=
 =?utf-8?B?VGRGQTFxN3grZ1pnZ1NScHNSbkhheGQ3S0dUMzNPUUJReHhGalBTYW1aSXli?=
 =?utf-8?B?L3U1eFEyWWtKRS95KzQxdURobUFITis2MU1qb1VlTUNCNlJsTTZKbHZKQkoz?=
 =?utf-8?B?NW54cWY4a0dtZXlWNXFMNnFlQjhLUVc0WFBhNXYzdG45aGt2QVlJdGMwUTB3?=
 =?utf-8?B?S0FjUFZjODE5aEVyR0owRXcvNVcxNDBhUlNYQjdhemF2VXRxM3BQYlZVdjZY?=
 =?utf-8?B?ZVpRZWhveFg2L1FGWFZtSk5CYUI2NHdVMnBhbmpyK09nYjNpOVJNUk5PNTFL?=
 =?utf-8?B?QkpEemVXbithTGdEQmszZWZMbHA2dk1IZkdVY21YZjJtbFNmVnd1T2xJNFdC?=
 =?utf-8?B?alF4MHhBaW9wb1NrOFh0cHZWZHJIRFdvYi9IWWlRK3lkU1ovcEN1STlBSHhZ?=
 =?utf-8?B?SkI5OEsxK2loVDN4SWkzalVpb2tkVUVuVDNtM1ZtL05pYW9OTUFIbWFMQlU0?=
 =?utf-8?B?enFKT3RjT0U5L3JPUWV6ZWlwTUtlL2ViUWJsQ2NvMWhBbEVTZ29LUXdWRkhE?=
 =?utf-8?B?dnZ5amZ3VmlGMkpBRTgydkdVMFB1ZG96cFBjWFFjdWNYajVLRDZ5RzRJb2hq?=
 =?utf-8?B?OEVNOXBSeWhaVmZPdmRDRkhnWWRramFkYU0vdzZOa1d4MlVvdDFEK3NIUElC?=
 =?utf-8?B?WC9kU3Y3MGZxY25rcjV3RjBKRkRKNkhpMFRPaDVkNDI1ZGtLVkZWVnhXU3hz?=
 =?utf-8?B?SVE0S09EcnM1bVNjeWdYbCtzUVN2L1ZNUkN5c2xOWG1ZSzYxTlQvbzJwNS9o?=
 =?utf-8?B?NVQ3WmxvRFVpMERqVkFEbE5sT2RzaDQxcjYrcVVxRUJnQzdDK2g1M1FHcXRH?=
 =?utf-8?B?bjViQVRwbWFlenM5ejVYQnB3SG8rOFFRQlhlVnltSFBPa0NkYlhwaXY0VG9T?=
 =?utf-8?B?ODVlWmxkWFYzNnc5endrTk4vMXljVGdBbTdHUHhZcFZNOUlxd0t2VGV1dTZ1?=
 =?utf-8?B?cTNPd1VyZkV6N3VSeEVvRUMvaGRXbjdHZDYwRmNubWd0c0lMRzBLc0tmNHA1?=
 =?utf-8?B?Z1lscTMrdExtVC9tRlY4eDBlZTROVi9OcjJGeFN3eVM2elVTNjBKRk1ISFJW?=
 =?utf-8?B?SEdjaUdVWVJHMVJJazE3cEI0MVB2aGRXeVZIOWphbDAzekh2MDRjaCtZeHFv?=
 =?utf-8?B?ZE1aLzRENEQ2bHVJRDBQZ292RXhndWtkYkljdTlvdXk0U2JXV2FPN1BheDFo?=
 =?utf-8?B?MjhBRUc4Um9Rc21GQ1ZWRXRaOHJON3pJRVBKa2ZuR2RrQzZwNzltNHVaVDdZ?=
 =?utf-8?B?UHY3LzdqYzdjUzVWSmV6cmluazNWV3M0K3ZRenVEQ3dIUG9sMkdnR0xmNXA1?=
 =?utf-8?B?TkgyaFI1Yzd4UjFROTU5WkdQUm1GTXNlR2lZZEY5V2xYcTJHMzVjbjVJZnFn?=
 =?utf-8?B?Sk0zYjRWQjZLS2J6aE9QenVvMGZHTFJ1R0F0Y2MzQmxXUERxNy9TUmdpUGpu?=
 =?utf-8?Q?3glRyfDyucEB9?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YlBHcEJwdUxIdDFZZThHNUhUVXpJZ2w5QXhkR2lTRm92bzNTbzNWTWFid0U2?=
 =?utf-8?B?MTZyRithZXlUcXVhWjJNQmVnTGFqSHNOaHdrOWw4OGY5eEhROGxsZlZGTy9O?=
 =?utf-8?B?T2IyK0x2SlQxb2pHK08vYzNsYjQ2QkFBQ3lHbHFRcWl6SjNBa21QL2NIUEl2?=
 =?utf-8?B?MWkvcmVrYldEL0xQOE84RWYwOHFONm8vMzhCNjVOSUI4RDQrbnQ5NzNLakNp?=
 =?utf-8?B?Yko4VjJLQWRnalFKQzVzMnBsTThLb25JYmhWTm1QWHJDMkYwUDBJNVYzdDRp?=
 =?utf-8?B?YXlDaDJveEJBc0FSNjkwU2VjNWMvUklMaFZiUlpnNjZiMEFXVkdaVVZpdFov?=
 =?utf-8?B?R00xb2Z4dW13UnBoejBnZGFDNTV6aUljVFkvZEM0a0g5RXZTR0NyZnRQZUtJ?=
 =?utf-8?B?VndLam1wREZ5bDJhU0FxaURkaXI1TEt4LzBKd0lwNXJTek1Oa2d6bVh2NXdx?=
 =?utf-8?B?YWJZS1l5ZVlldHdRdWxUQ0dLU0ozUDk2SCtzY3hDUCs2TFBBZkgzZm0ycnNh?=
 =?utf-8?B?cTBDb2M0TkNSZHZuUWtzZFd3NVhxVjZNemNpL0krNFgzZ3J1Mjl0S2ZrZ245?=
 =?utf-8?B?RnlxNjRPc0h5Qis4bFVjejlKR2xhS05mYkUyeFVXWkZVa3hNT0NQdW0yd2p5?=
 =?utf-8?B?YVFyUGhJSVdqM2ZManpLQnZzTEcxb0xhTllXWXFpZk5oRHdiT05mdzV1THF5?=
 =?utf-8?B?SnZSc3AzMHM2VTlkejRuV1dHbTlvZ0kvT29McCt4ZnVsSnFKUGYybk1kYkVY?=
 =?utf-8?B?V2ZkTnlFM2pST0lQUHE0YUUwOWJHdjJxRVlqckE2dHZWOCtkK0Q0MGQ0ZTdl?=
 =?utf-8?B?cS9PMXE1TWZXTEpXOXQ0ZTQ4Y0d5VkdZK1Jid1lNR3FnZjlrVlhid2pmK09O?=
 =?utf-8?B?SlNtU2I4SXdjUWlXaE9Gd2FUVTJhU0JmenRZMjV2SVByT0VpeUhIamIxeDg4?=
 =?utf-8?B?YnpnUTBmKzFmZnBLVUltU2V5RnUzcHYwS3ViNVh1NmtBZDlxUUUwdS9DMjZ0?=
 =?utf-8?B?djBtd25LQTBoaFVvSTA5S3pvSHgyOGYvdHliOHFrMnA1alZTVEpyY2djeTgy?=
 =?utf-8?B?MllvYkR2bWozUFFRb0V3YmpXR3A0OXF3L2RCejhOOFk3ZTdzOGtYNjAwejBy?=
 =?utf-8?B?VUdobHY1T1NmcUhsMStTZXV3bHlRU0RsUkNVYXVKQk1odnBUYmVFdUVKM0Vw?=
 =?utf-8?B?bXhUcTRRYnNKU1lkSkZWV2hOeEowcHhjcXlleGdPQ01uUkt2SlROVDYrd0gz?=
 =?utf-8?B?NWtrUUZIcjFjVzVkdkk0RFYyeVZUbXcyTU01WndYekY4NWswUmR0N2JDdlJX?=
 =?utf-8?B?RHhMZTNUNEFZTkhZdTN1ZEc2dkhXemFjN0E2Y2h6QUpDeE1WQjVJdVM3ZHFs?=
 =?utf-8?B?YUc3VXE3VTMwUE9hT0hQd1hLVlovTDFYSzJmUS9SdnVVNzRUZ2Zhbmw2Uk83?=
 =?utf-8?B?WTNKTUZqcDFYQWtXOG9MTWJmZzA1a0sxeFhISEQrYjlzbGFGd0lSOUtnalBu?=
 =?utf-8?B?c0lWMUxUc0h5WDE1eS9NV3pzdHFaQ1dSeDExbjQvTDQvcUNQUFU3M1hLZC85?=
 =?utf-8?B?Y1N0YmFVWlZzZ0pLWWNiUE04S2RuMXhXY2JKZWRFcDhrRmVwY0ZaeGE2RDRn?=
 =?utf-8?B?Q1FHZVdVZDNGeFY5Q2wxdjloME9NQmlhMzdiYWNZNzUyN0ZrWVBuYTA5MTY4?=
 =?utf-8?B?NFJ1eTlKSXNSbTlabGlveXU2eCtTVFFSbFUwUWRnTGF2U0hTRDdJZXFkMWpS?=
 =?utf-8?B?MnlrdGVpeEVyUEtPY2VkWEl0MnNnRjJFdUZOWGVYY2lyNkpYTnIzdzcyZ0Y3?=
 =?utf-8?B?Ukpsd09jaVpLNkJMNzMrWE1SQTB0NTNEOGFIcGhCMVRLMTRMeU9wa0VLdTRH?=
 =?utf-8?B?dUpWdldEMFdKWWM1d1pmNTVkMTNSdnoxVTBQT29ZTWZ5TGo4UDZlWWJmVDRk?=
 =?utf-8?B?VXRCbEhSVmtyanNlUDJMbFRndjZ1MU1QZ1FLL1VucnBza2VKd1JQelNIY2Jy?=
 =?utf-8?B?VVVJUE1EOGFCa1I2c1JFSXh6QWdkdTZXaEtQQ2hVNWluSVluNWVVd3lpU3Vn?=
 =?utf-8?B?L09sVFcyNDJ4NGJyZk14eXh1elZ3RHYybFZ6c21RMWl1TjFBQ0hBVzRQR0dL?=
 =?utf-8?B?T1BhOTRXRzlKZkhZY3hnd3dENS9HRVVKUjZnY250U3Z5N29qTXljakZWN3hV?=
 =?utf-8?B?L2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b680d5b5-4e26-430c-6fb8-08dd4a99d23b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 12:44:27.7713 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6AYU4d6V3G85m8pfR9MwGz608ag5mhPQSy9Aib2Plvvpj9osrO7U8TSkKrgvL/Mh4G0wYsBqGWXzd8PvOs6t8dStOGRTS+RNXfv/Ww1YDLQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6606
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


On 2/11/2025 2:04 PM, Kamil Konieczny wrote:
> Hi Nautiyal,,
> On 2025-02-11 at 09:27:31 +0530, Nautiyal, Ankit K wrote:
> one nit about years in copyrights, see below.
>
>> On 2/11/2025 12:26 AM, Kunal Joshi wrote:
>>> Add helper to centralize commonly used MST-related logic.
>>> igt_find_all_mst_output_in_topology() enumerates MST outputs
>>> that share the same root connector id.
>>>
>>> v2: fix docs (Ankit)
>>>       change return type to int (Ankit)
>>>       split patch (Ankit)
>>>
>>> Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>>> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
>>> ---
>>>    tests/intel/kms_mst_helper.c | 49 ++++++++++++++++++++++++++++++++++++
>>>    tests/intel/kms_mst_helper.h | 15 +++++++++++
>>>    2 files changed, 64 insertions(+)
>>>    create mode 100644 tests/intel/kms_mst_helper.c
>>>    create mode 100644 tests/intel/kms_mst_helper.h
>>>
>>> diff --git a/tests/intel/kms_mst_helper.c b/tests/intel/kms_mst_helper.c
>>> new file mode 100644
>>> index 000000000..fb5aaab77
>>> --- /dev/null
>>> +++ b/tests/intel/kms_mst_helper.c
>>> @@ -0,0 +1,49 @@
>>> +/* SPDX-License-Identifier: MIT */
>>> +/*
>>> + * Copyright © 2023 Intel Corporation
>> s/2023/2025
>>
> Please do not remove old years, rather add new one(s), imho:
>
> s/ 2023 / 2023-2025 /

This is a new file created this year. So there is no old year as far as 
I understand.

Regards,

Ankit

>
> Regards,
> Kamil
>
>>> + */
>>> +
>>> +#include "kms_mst_helper.h"
>>> +
>>> +/*
>>> + * @drm_fd: DRM file descriptor
>>> + * @display: pointer to #igt_display_t structure
>>> + * @output: target output
>>> + * @mst_outputs: filled with mst output of same toplogy as @output
>>> + * @num_mst_outputs: filled with count of mst outputs found in topology
>>> + *
>>> + * Iterates over all connected outputs and adds each DP MST
>>> + * output that shares the same MST connector ID as @output
>>> + * into @mst_outputs.
>>> + *
>>> + * Returns: 0 on success, -1 on failure
>> Just return the ERROR code.
>>
>>
>>> + */
>>> +int igt_find_all_mst_output_in_topology(int drm_fd, igt_display_t *display,
>>> +					 igt_output_t *output,
>>> +					 igt_output_t *mst_outputs[],
>>> +					 int *num_mst_outputs)
>>> +{
>>> +	int output_root_id, root_id;
>>> +	igt_output_t *connector_output;
>>> +
>>> +	if (!igt_check_output_is_dp_mst(output))
>>> +		return -1;
>> return -EINVAL
>>
>>
>>> +
>>> +	output_root_id = igt_get_dp_mst_connector_id(output);
>>> +	if (output_root_id == -EINVAL)
>>> +		return -1;
>> return -EINVAL
>>
>>
>>> +
>>> +	/*
>>> +	 * If output is MST, check all other connected output which shares
>>> +	 * same path and fill mst_outputs and num_mst_outputs
>>> +	 */
>>> +	for_each_connected_output(display, connector_output) {
>>> +		if (!igt_check_output_is_dp_mst(connector_output))
>>> +			continue;
>>> +
>>> +		root_id = igt_get_dp_mst_connector_id(connector_output);
>>> +		if (((*num_mst_outputs) < IGT_MAX_PIPES) && root_id == output_root_id)
>>> +			mst_outputs[(*num_mst_outputs)++] = connector_output;
>>> +	}
>>> +	return 0;
>>> +}
>>> diff --git a/tests/intel/kms_mst_helper.h b/tests/intel/kms_mst_helper.h
>>> new file mode 100644
>>> index 000000000..637ca696e
>>> --- /dev/null
>>> +++ b/tests/intel/kms_mst_helper.h
>>> @@ -0,0 +1,15 @@
>>> +/* SPDX-License-Identifier: MIT */
>>> +/*
>>> + * Copyright © 2023 Intel Corporation
>> s/2023/2025
>>
>>
>> Regards,
>>
>> Ankit
>>
>>> + */
>>> +
>>> +#ifndef KMS_MST_HELPER_H
>>> +#define KMS_MST_HELPER_H
>>> +
>>> +#include "igt.h"
>>> +
>>> +int igt_find_all_mst_output_in_topology(int drm_fd, igt_display_t *display,
>>> +					 igt_output_t *output,
>>> +					 igt_output_t *mst_outputs[],
>>> +					 int *num_mst_outputs);
>>> +#endif
