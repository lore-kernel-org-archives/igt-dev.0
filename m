Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32906FF8868
	for <igt-dev@archiver.kernel.org>; Tue, 28 Apr 2026 11:29:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA8BC10EB1A;
	Tue, 28 Apr 2026 11:29:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PKt9V4GQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B000C10EB1A
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Apr 2026 11:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777375743; x=1808911743;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=eQvc8/sqQWgQk6ti0yzD9+KliH+FTXoDYBOAMBR5GG8=;
 b=PKt9V4GQaDoYc5yTb5IUEMy9dw5hYql5oU5DADjcKME9w6xEdc6WznUw
 xuaeLaXWtTO9dZdKfvZSR6vaxQIgI7OiNMKpWaeMu4dJWgbWVuBpNxDZX
 CPtUzWAw9f+LmYuZCwWv/xPYogdMWc4yNalqbLFnLTqggSiqiKBeicIXm
 RVK6QCVKfQKiKZsYdJW/6AlWzff5EEcFWkND/NcAktnOd4unLuRI+3Nu8
 GVr2mKW1mZPptR0J2skuoH8d/hZwO0gVKc/dr8i1dHrMgZoqN5illkIvM
 GghnpVFqWKunTH8YXtQyNInKxkmcIhymiun+jNktAKmUrOMo7ITx7RvT4 g==;
X-CSE-ConnectionGUID: LP9c4mvHS9Si7JGscTz6aA==
X-CSE-MsgGUID: UM+c7IJxRKyKAsL/Qb5zGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="88591641"
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; d="scan'208";a="88591641"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 04:29:02 -0700
X-CSE-ConnectionGUID: ls1htGjRRYqb+utuT88vQQ==
X-CSE-MsgGUID: fU7L7UUvRsi2F58a9VhkUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; d="scan'208";a="229362003"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 04:29:01 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 28 Apr 2026 04:29:00 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 28 Apr 2026 04:29:00 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.48) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 28 Apr 2026 04:28:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UDcb6Je/C8522MVdYevFFpK4FKmQAMdnjlvPCUcckpjYsKcost/Mw8AVoPmBniU/SgbxdmZeNu5T3Q6gSlqZHxUTU2NnjR3RXItIvK80x0OC+6y7VkWIIysWI5gL3Bd6Rjo/yhFJfLHUKrN/X291m7g9R6UvDHFx+EtzBMO5FMRdP5S2XW27ut7gPKnlua//K/vla11vA2CL2Xhuev+yZGbSaT1tTtvAAKCNQ+WB8nnTaaZESneRi4A43o2/9wLQYhxgpYaDwZp2tFHTLeVt/bDxOWOxwC+iyB3dC1RZXB5kriJrhL3D7Z5XjQLkIK+hJYwxWSE3pOorvd6Jzsc7IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2rICh9bf7j4d678JfDD3cecjELLEiEIrLCJKW40mkpw=;
 b=gkAxj+z4Nn8gz/cu3Ec9R/16maUX8FQtnPd16aJUno912IxwQILc+KElqY0JbzHD/gkYBpXb+MVkgN9pywApYt3UKutUeUiiQL95EO6dy5oIF6FhZ3CF7YuOKmvz7mOFejhYvkePdRVawNZpnehdJfyQke2EZIQ14Grv0lPbAKkq2I7F1hRbD42bWCGspupTdZsBkQ7TbTciHG+Bm9w6TGcElr2wYVsDfewSBnb1hFCReymk4DaCauasHkqLmL+fvDc/x1dC/H3AcobCSY+aDPyORwTEDx66oGIN+SNfTu4aIT1UqxAQ71EJfieRC1yg/uVk7gWaYfem9DbyxNm1mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5880.namprd11.prod.outlook.com (2603:10b6:510:143::14)
 by PH7PR11MB6699.namprd11.prod.outlook.com (2603:10b6:510:1ad::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Tue, 28 Apr
 2026 11:28:54 +0000
Received: from PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd]) by PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd%5]) with mapi id 15.20.9870.013; Tue, 28 Apr 2026
 11:28:54 +0000
Message-ID: <970d91a8-cc66-499d-9f7f-5103a7d3f17a@intel.com>
Date: Tue, 28 Apr 2026 16:58:44 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t, v3 1/5] lib/igt_hdr: Move HDR helpers from kms_hdr
 into shared library
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, Suraj Kandpal <suraj.kandpal@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>, Juha-Pekka Heikkila
 <juha-pekka.heikkila@intel.com>, Karthik B S <karthik.b.s@intel.com>
References: <20260417213818.2050571-1-swati2.sharma@intel.com>
 <20260417213818.2050571-2-swati2.sharma@intel.com>
 <20260420184633.sxlkomq6m4u2y65k@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20260420184633.sxlkomq6m4u2y65k@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0004.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:174::6) To PH0PR11MB5880.namprd11.prod.outlook.com
 (2603:10b6:510:143::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5880:EE_|PH7PR11MB6699:EE_
X-MS-Office365-Filtering-Correlation-Id: caecf49a-91c1-478e-6b6f-08dea5195488
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|22082099003|56012099003|18002099003; 
X-Microsoft-Antispam-Message-Info: GUDTxGInIoFjfEFPlDBUlBYFcSdanKSsbQkMkvhrrHNRwTrObxrsuPG10xAqgaOyyYonIU5EaCQzGzm+8IE4Wrm5J3JPqly82xIEM4AXkpcH0S3DWR91puJQuZCxXCuqPFrQR5j2Vat0ZIC6lGe5/7NlM+CDnB/yThMLujjeKYftWFXTTNbOtRN/jJtFmQ55/Q+u6x/jRmZEFVGbKCse6ku2YEJaACLL2Dg6xrhrsWUYjgd3/ZisFLX62O7QfV/3lB9lkzEkX+00X2LdEV/ErjnJHBV2yTDvUYQiZwwMonhNuhMkwPFtZdnJqWckY81nPMq+X2IawkWDYWgpS8YASp2qTQgjthlMiHg5gRJYzDbS4Oj87gqcL+2ZKrCmIBmcCOzakVKvepGtp+QAEmMJJuGKVFD0KNCDFJl50A5unaPxZrY6kqUbCpvM/1TJqpgLkTIpNB8UnEFgnp0ConpZ4dmftcsLcPvWp1V0X52UeaJbyxSmD/RV6aO8eFJtH5SEZcC2fH4/5iSlhP4kKV1hYMZLna9/2bFhjY9hWo2Sycnq+TsJKEX6ShkMmOb3PnPkdvnMrv/7j7a5fU1haI6iZ54YXVovGZqp7FAFUW9ERQnhyUQO1rYhSAs/7rdrUmNM7tMGIXzi2EzVFrjpVhv/pE52+f/u04SnoWYn+zjCqITS77fkkHo96aOVg6eJeHEkFjdHOvN1GUEGY86G12WGAfZatd6HsMoXSodcglR0wrk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5880.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T284dzYvdlBkbmlQQ1hHNlFVcWJyODMvRHA1UndpYklxeGtlZDlUTGxwRUlY?=
 =?utf-8?B?TzQ3RXIxRFprSFhEeVlYcGhoRkRTVUc5czJOc0lxb3JtM1FBcW9RUTRrRmlS?=
 =?utf-8?B?NTRFamt4a09IbjZZdlI4dXN2K1ZGYmFzN1hpdFhmQmwzR0lqbzJmTmVpeHBz?=
 =?utf-8?B?cXBVcEc3UXFFYkUzUXB3aFdGK1RpUWRKUDZQM20wWmpPaVVFK1gyeTBjSVJr?=
 =?utf-8?B?c3BINnRmRzNMTXFJUVRxSWcrVkUyRnNSLytzWGNRTHBqSGdqaFFyOEpKSXlL?=
 =?utf-8?B?Z09VQXBoODhQT29GUzFpb1ltWjljYXVLRTFpSlJhUEFncGtNQzRiMGQ1R2RK?=
 =?utf-8?B?OTRNcEY5Ti9RNWJmV1gyK29CWnVsK1kxTHZPYUM4Z3F1eU1ONW1md2ZIL1ZU?=
 =?utf-8?B?RVhXYVE3QlFMWDZGR1VuQ1NDTk12d0ZuTEppU3VaUWZJSndnYVB5MER0Mmpm?=
 =?utf-8?B?QUFrKzVENnM3cXlWRG1TSlZ0Vk9WR01na2h1V3pVanJoNjhuWjdCTlVHczFz?=
 =?utf-8?B?aEZEeWRMNGJUUjNyWDdGMHNvVVZBa0hDK1U0dklxR05WYXdxSU1GOEcvaldI?=
 =?utf-8?B?OGFCNit3aGFTQ2V1YWREejlNNHp6N0NQczdSaU1vVWRjOHM5Ti9QUkUrLzRV?=
 =?utf-8?B?dFdWMnBNeXI4aW5DbGIwYjRNUkk0amNZNzRWYWl4OU5jT0pmaXF5Y3JIdnli?=
 =?utf-8?B?aGduak1wWjdMdjN3SmZuekwwbE9BYU94anhtQXQ5RXhaeDBOcTBVWWxUVno5?=
 =?utf-8?B?UTkydkJ0aEhEa05BaTNjakVJeEdlZzI3WE9vQ0J1LzcyRDBWUnRVTE5qUE52?=
 =?utf-8?B?eHllMzFiY3dkSU9IRDc2dXZqbHNPR2xpQTRzNlpqamRVeXVrQ2xxSkJ5WDVY?=
 =?utf-8?B?bkI5Y0djR2creFRkVUYyYno2MnhmOWpTZUU3dTVRRFdPNVBYYk1laVRVbTlI?=
 =?utf-8?B?aStHdXZHU1EzRGpsYlNUNzJlM2QrejZYRkRFQkI5TE5DSHpYYU1RbVk5bHlG?=
 =?utf-8?B?dDNydldQQy9HNlJmK1Z1RTdhRHErU3RTcjNNWmo1VnNQZlA4U00yQ0NmS2Va?=
 =?utf-8?B?Rm04T1VlZy8wRnNQYmhHWURkbktQS2d6MEFUdVB0S21ETFRCNFhuV25sbWVM?=
 =?utf-8?B?REFCbUduNDdyZlg0Z3hOWXppRWJRTHUvbzNxbURhYWZNVXNWRzVCaTJkMW5T?=
 =?utf-8?B?L2xCUWxXQlUzQVhFNGpnZk8zMXlRTVlndU0yMGVDRWVvVG1zVjlrb0hNZHBw?=
 =?utf-8?B?Qmt6YmtJY083QlNGczVpbnJITm8zN0Y0dVhYaVFyZTNwUjBLREF1NGszOEF2?=
 =?utf-8?B?ajRvdWtiQWlYTkh3Q3YySmxxTEFIeXpua2Q1dTBFWE82cDlvei8wVFlnVDJz?=
 =?utf-8?B?YWNPVC9pOUVYUFM0ekVkYllBMVlGLy84bWI2WnBDUHZUTVBHSjQycm1kYXhO?=
 =?utf-8?B?WUVRZkk5MWJPdmorNkMwS1RZaEZNTEF4VU5ZRU0wMXZGWFNtQVMrdHJDRnJ6?=
 =?utf-8?B?bGJpQy9wUHdDUytNWW56bzdidXV0WnkxMVpFeVFUbVV6WExZc3VVWmVKT0Yx?=
 =?utf-8?B?UWY5RFNNUjViNTBuOHkzZ0htRFN6bStMNjVwaDIza1c0aHdkcHVReEtwaXNw?=
 =?utf-8?B?cFhuM3RqeUxJQ0VCNDhzV3hzS2QzZkY5M3VWajZCQ3BwNll2blI4cEpOVVJC?=
 =?utf-8?B?dFZLamQzVjF1aEtCZ2wyRHVuaEY0RGFYZ3dCcHBSYnd6YVNnVzQ0NTFtQUdr?=
 =?utf-8?B?QmZtcEgyRFdjZ2RRQWVYT2RHNkovNm80MDR5eGJ6ZnhkMWNoM0k3NzNCNk5R?=
 =?utf-8?B?eEtsczV3VFRzMHJJTm05TW9YOHhLOS9aNU9wNDFscitZSmlWMVo5dkJTRW5x?=
 =?utf-8?B?UWRHY1FzaGxCT2JQMkg1bkVvNlI2cVgzQmJ2NUhaRE5wT2VGQlN1a2phYXFU?=
 =?utf-8?B?UUpWN0VNWDdiS1UybWFlVmsxaWE0UzZpMUoyTGQrWnh0T2ZOay9KZEVVTGcw?=
 =?utf-8?B?Z2RzVWJ4UFZBY0JVQkhuNlhWdmNjWUx0dnNBMHJ2bDNOcDV1QjZjdm53Yk9o?=
 =?utf-8?B?TlpNWHdkQVcwRlN2MmprZ0w1S0pBUUl0UUFlZ05LYTNaZDc3c2hiSWd5T0VK?=
 =?utf-8?B?NDA0aVI2WUF5azR1WXNCWTNaNEJ3d2FsNHI1N0o4YUN6alZlZTBFWS9xTHZ1?=
 =?utf-8?B?M2piNmkwYzhkc1NkU2VlbXFBWWlhUmIvTkduZE1tdjB0d0t3bnNIYVJmZjJE?=
 =?utf-8?B?b0RhdzhsSVpPVjRQTzdSdExmWi94cHVOQWdhNkpacit0eitpSG5xSjFZcUR1?=
 =?utf-8?B?OHJrUSszY25JanhWKzYxQWxWajI3WW1qakVZcjhXMWdKb0tSSVRTbjFWWlZH?=
 =?utf-8?Q?Un0duKJEh6e6odVU=3D?=
X-Exchange-RoutingPolicyChecked: eIxY7R/J9GfgfAL+qUkSvgSkeOhT3RG27YfapWAyDjvCKbMZiFlYzFlRZgk10TFmgd+ZS4GAIlMOrva8uTJTMkFxUlCF/+sXjIBRz4B0FJCFlxQD9T0K35qEowRZkTWNsrwhY/OGgDzXCfqbQWcw2nbpc+DvnKtkJEcBe3axb9NYOdMDaOLNe9bTNUrrIWavmbPJhfUa4T/DBrO5ufNJyvxfKzRaabTqXycfS1hUJz9ZspjG6bb7xSpjthcCz/8o7/AkFxu4yLh13jmmhpdXbG58WBYGW31wayWQuF5QXqzM3UYxxgzH8F5Hu0/9pQBf6TnojuPaFj56TtBULI4MvQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: caecf49a-91c1-478e-6b6f-08dea5195488
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5880.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 11:28:54.7688 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tnS3wFLMNE2y7YaUFvRIVr2qa8e6FRj8iJfCURx+KIafeZsW8FXlEBqg0cnXVSRK3SBIB/j/V91GtUo/R7D6cQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6699
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

On 21-04-2026 12:16 am, Kamil Konieczny wrote:
> Hi Swati,
> On 2026-04-18 at 03:08:14 +0530, Swati Sharma wrote:
>> Introduce lib/igt_hdr.{c,h} containing metadata fill helpers, EOTF enums,
>> ST2084 construction, and blob programming utilities. This allows
>> kms_hdr and upcoming tests (e.g., HDR support in kms_frontbuffer_tracking)
>> to share common HDR code.
>>
>> v2: -place igt headers in alphabetical order (Kamil)
>>
>> Co-developed-by: Claude Opus 4.6
>> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
>> Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
>> ---
>>   lib/igt_hdr.c   | 217 +++++++++++++++++++++++++++++++++++
>>   lib/igt_hdr.h   |  33 ++++++
>>   lib/meson.build |   1 +
>>   tests/kms_hdr.c | 297 ++++++++----------------------------------------
>>   4 files changed, 300 insertions(+), 248 deletions(-)
>>   create mode 100644 lib/igt_hdr.c
>>   create mode 100644 lib/igt_hdr.h
>>
>> diff --git a/lib/igt_hdr.c b/lib/igt_hdr.c
>> new file mode 100644
>> index 000000000..5feb1d917
>> --- /dev/null
>> +++ b/lib/igt_hdr.c
>> @@ -0,0 +1,217 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2025 Intel Corporation
> Year 2026.
Ack
>
>> + */
>> +
>> +#include "igt.h"
>> +#include "igt_edid.h"
>> +#include "igt_hdr.h"
>> +
>> +#include <fcntl.h>
>> +#include <termios.h>
>> +#include <unistd.h>
>> +
>> +/* HDR EDID parsing. */
> Should this be in lib/igt_edid.c?

As per

commit a2fd0489c87a4d647c339f98057e6a1550e0e2f5
Author: Simon Ser <simon.ser@intel.com>
Date:   Tue Apr 16 14:27:46 2019 +0300

     lib/igt_edid: new library for generating EDIDs

This commit introduces a new little library to generate EDIDs.

>
>> +#define CTA_EXTENSION_VERSION		0x03
>> +#define HDR_STATIC_METADATA_BLOCK       0x06
>> +#define USE_EXTENDED_TAG		0x07
>> +
>> +static bool cta_block(const char *edid_ext)
>> +{
>> +	/*
>> +	 * Byte 1: 0x07 indicates Extended Tag
>> +	 * Byte 2: 0x06 indicates HDMI Static Metadata Block
>> +	 * Byte 3: bits 0 to 5 identify EOTF functions supported by sink
>> +	 *	       where ET_0: Traditional Gamma - SDR Luminance Range
>> +	 *	             ET_1: Traditional Gamma - HDR Luminance Range
>> +	 *	             ET_2: SMPTE ST 2084
>> +	 *	             ET_3: Hybrid Log-Gamma (HLG)
>> +	 *	             ET_4 to ET_5: Reserved for future use
>> +	 */
>> +
>> +	if ((((edid_ext[0] & 0xe0) >> 5 == USE_EXTENDED_TAG) &&
>> +	      (edid_ext[1] == HDR_STATIC_METADATA_BLOCK)) &&
>> +	     ((edid_ext[2] & HDMI_EOTF_TRADITIONAL_GAMMA_HDR) ||
>> +	      (edid_ext[2] & HDMI_EOTF_SMPTE_ST2084)))
>> +			return true;
>> +
>> +	return false;
>> +}
>> +
>> +/* Returns true if panel supports HDR. */
> All public lib functions, this one and following ones, needs
> a description, see for example lib/igt_configfs.c
Ack
>
>> +bool igt_is_panel_hdr(int fd, igt_output_t *output)
> Or maybe it should be in lib/igt_hdr_panel.h|c?
I guess not required, lets have one lib for hdr related func()
>
> +cc Karthik and J-P
>
>> +{
>> +	bool ok;
>> +	int i, j, offset;
>> +	uint64_t edid_blob_id;
>> +	drmModePropertyBlobRes *edid_blob;
>> +	const struct edid_ext *edid_ext;
>> +	const struct edid *edid;
>> +	const struct edid_cea *edid_cea;
>> +	const char *cea_data;
>> +	bool ret = false;
>> +
>> +	ok = kmstest_get_property(fd, output->id,
>> +			DRM_MODE_OBJECT_CONNECTOR, "EDID",
>> +			NULL, &edid_blob_id, NULL);
>> +
>> +	if (!ok || !edid_blob_id)
>> +		return ret;
>> +
>> +	edid_blob = drmModeGetPropertyBlob(fd, edid_blob_id);
>> +	igt_assert(edid_blob);
>> +
>> +	edid = (const struct edid *) edid_blob->data;
>> +	igt_assert(edid);
>> +
>> +	for (i = 0; i < edid->extensions_len; i++) {
>> +		edid_ext = &edid->extensions[i];
>> +		edid_cea = &edid_ext->data.cea;
>> +
>> +		/* HDR not defined in CTA Extension Version < 3. */
>> +		if ((edid_ext->tag != EDID_EXT_CEA) ||
>> +		    (edid_cea->revision != CTA_EXTENSION_VERSION))
>> +				continue;
>> +		else {
>> +			offset = edid_cea->dtd_start;
>> +			cea_data = edid_cea->data;
>> +
>> +			for (j = 0; j < offset; j += (cea_data[j] & 0x1f) + 1) {
>> +				ret = cta_block(cea_data + j);
>> +
>> +				if (ret)
>> +					break;
>> +			}
>> +		}
>> +	}
>> +
>> +	drmModeFreePropertyBlob(edid_blob);
>> +
>> +	return ret;
>> +}
>> +
>> +/* Converts a double to 861-G spec FP format. */
>> +uint16_t igt_hdr_calc_float(double val)
>> +{
>> +	return (uint16_t)(val * 50000.0);
>> +}
>> +
>> +/* Fills some test values for ST2084 HDR output metadata.
>> + *
>> + * Note: there isn't really a standard for what the metadata is supposed
>> + * to do on the display side of things. The display is free to ignore it
>> + * and clip the output, use it to help tonemap to the content range,
>> + * or do anything they want, really.
>> + */
>> +void igt_hdr_fill_st2084(struct hdr_output_metadata *meta)
>> +{
>> +	memset(meta, 0, sizeof(*meta));
>> +
>> +	meta->metadata_type = HDMI_STATIC_METADATA_TYPE1;
>> +	meta->hdmi_metadata_type1.eotf = HDMI_EOTF_SMPTE_ST2084;
>> +
>> +	/* Rec. 2020 */
>> +	meta->hdmi_metadata_type1.display_primaries[0].x =
>> +		igt_hdr_calc_float(0.708); /* Red */
>> +	meta->hdmi_metadata_type1.display_primaries[0].y =
>> +		igt_hdr_calc_float(0.292);
>> +	meta->hdmi_metadata_type1.display_primaries[1].x =
>> +		igt_hdr_calc_float(0.170); /* Green */
>> +	meta->hdmi_metadata_type1.display_primaries[1].y =
>> +		igt_hdr_calc_float(0.797);
>> +	meta->hdmi_metadata_type1.display_primaries[2].x =
>> +		igt_hdr_calc_float(0.131); /* Blue */
>> +	meta->hdmi_metadata_type1.display_primaries[2].y =
>> +		igt_hdr_calc_float(0.046);
>> +	meta->hdmi_metadata_type1.white_point.x = igt_hdr_calc_float(0.3127);
>> +	meta->hdmi_metadata_type1.white_point.y = igt_hdr_calc_float(0.3290);
>> +
>> +	meta->hdmi_metadata_type1.max_display_mastering_luminance =
>> +		1000; /* 1000 nits */
>> +	meta->hdmi_metadata_type1.min_display_mastering_luminance =
>> +		500;				   /* 0.05 nits */
>> +	meta->hdmi_metadata_type1.max_fall = 1000; /* 1000 nits */
>> +	meta->hdmi_metadata_type1.max_cll = 500;   /* 500 nits */
>> +}
>> +
>> +/* Fills some test values for HDR metadata targeting SDR. */
>> +void igt_hdr_fill_sdr(struct hdr_output_metadata *meta)
>> +{
>> +	memset(meta, 0, sizeof(*meta));
>> +
>> +	meta->metadata_type = HDMI_STATIC_METADATA_TYPE1;
>> +	meta->hdmi_metadata_type1.eotf = HDMI_EOTF_TRADITIONAL_GAMMA_SDR;
>> +
>> +	/* Rec. 709 */
>> +	meta->hdmi_metadata_type1.display_primaries[0].x =
>> +		igt_hdr_calc_float(0.640); /* Red */
>> +	meta->hdmi_metadata_type1.display_primaries[0].y =
>> +		igt_hdr_calc_float(0.330);
>> +	meta->hdmi_metadata_type1.display_primaries[1].x =
>> +		igt_hdr_calc_float(0.300); /* Green */
>> +	meta->hdmi_metadata_type1.display_primaries[1].y =
>> +		igt_hdr_calc_float(0.600);
>> +	meta->hdmi_metadata_type1.display_primaries[2].x =
>> +		igt_hdr_calc_float(0.150); /* Blue */
>> +	meta->hdmi_metadata_type1.display_primaries[2].y =
>> +		igt_hdr_calc_float(0.006);
>> +	meta->hdmi_metadata_type1.white_point.x = igt_hdr_calc_float(0.3127);
>> +	meta->hdmi_metadata_type1.white_point.y = igt_hdr_calc_float(0.3290);
>> +
>> +	meta->hdmi_metadata_type1.max_display_mastering_luminance = 0;
>> +	meta->hdmi_metadata_type1.min_display_mastering_luminance = 0;
>> +	meta->hdmi_metadata_type1.max_fall = 0;
>> +	meta->hdmi_metadata_type1.max_cll = 0;
>> +}
>> +
>> +/* Sets the HDR output metadata prop. */
>> +void igt_hdr_set_metadata(igt_output_t *output,
>> +                          const struct hdr_output_metadata *meta)
>> +{
>> +	igt_output_replace_prop_blob(output,
>> +				     IGT_CONNECTOR_HDR_OUTPUT_METADATA, meta,
>> +				     meta ? sizeof(*meta) : 0);
>> +}
>> +
>> +/* Sets the HDR output metadata prop with invalid size. */
>> +int igt_hdr_set_invalid_metadata(igt_output_t *output,
> Do we need this function in lib?
hmm, we can move this to test binary
>
>> +                                 const struct hdr_output_metadata *meta,
>> +				 size_t len)
>> +{
>> +	igt_output_replace_prop_blob(output,
>> +				     IGT_CONNECTOR_HDR_OUTPUT_METADATA, meta,
>> +				     meta ? len : 0);
>> +
>> +	return igt_display_try_commit_atomic(output->display,
>> +	                                     DRM_MODE_ATOMIC_ALLOW_MODESET,
>> +					     NULL);
>> +}
>> +
>> +/* Returns true if an output supports max bpc property. */
>> +bool igt_output_supports_max_bpc(igt_output_t *output)
>> +{
>> +	return igt_output_has_prop(output, IGT_CONNECTOR_MAX_BPC) &&
>> +	       igt_output_get_prop(output, IGT_CONNECTOR_MAX_BPC);
>> +}
>> +
>> +/* Returns true if an output supports HDR metadata property. */
>> +bool igt_output_supports_hdr(igt_output_t *output)
>> +{
>> +	return igt_output_has_prop(output, IGT_CONNECTOR_HDR_OUTPUT_METADATA);
>> +}
>> +
>> +void igt_hdr_disable(igt_output_t *output)
>> +{
>> +	igt_hdr_set_metadata(output, NULL);
>> +	igt_output_set_prop_value(output, IGT_CONNECTOR_MAX_BPC, 8);
>> +}
>> +
>> +void igt_hdr_enable(igt_output_t *output)
>> +{
>> +	struct hdr_output_metadata meta;
>> +
>> +	/* Fill HDR metadata and enable it on the output */
>> +	igt_hdr_fill_st2084(&meta);
>> +	igt_hdr_set_metadata(output, &meta);
>> +	igt_output_set_prop_value(output, IGT_CONNECTOR_MAX_BPC, 10);
>> +}
>> diff --git a/lib/igt_hdr.h b/lib/igt_hdr.h
>> new file mode 100644
>> index 000000000..0df1ac5ed
>> --- /dev/null
>> +++ b/lib/igt_hdr.h
>> @@ -0,0 +1,33 @@
>> +#ifndef IGT_HDR_H
>> +#define IGT_HDR_H
>> +
>> +#include "igt_edid.h"
>> +#include "igt_kms.h"
>> +
>> +enum hdmi_eotf {
>> +	HDMI_EOTF_TRADITIONAL_GAMMA_SDR,
>> +	HDMI_EOTF_TRADITIONAL_GAMMA_HDR,
>> +	HDMI_EOTF_SMPTE_ST2084,
>> +};
>> +
>> +/* DRM HDR definitions. Not in the UAPI header, unfortunately. */
>> +enum hdmi_metadata_type {
>> +	HDMI_STATIC_METADATA_TYPE1 = 0,
>> +};
>> +
>> +bool igt_is_panel_hdr(int fd, igt_output_t *output);
>> +
>> +uint16_t igt_hdr_calc_float(double val);
>> +void igt_hdr_fill_st2084(struct hdr_output_metadata *meta);
>> +void igt_hdr_fill_sdr(struct hdr_output_metadata *meta);
>> +
>> +void igt_hdr_set_metadata(igt_output_t *output,
>> +                          const struct hdr_output_metadata *meta);
>> +int igt_hdr_set_invalid_metadata(igt_output_t *output,
>> +                                 const struct hdr_output_metadata *meta,
>> +				 size_t len);
>> +
>> +bool igt_output_supports_max_bpc(igt_output_t *output);
>> +bool igt_output_supports_hdr(igt_output_t *output);
>> +
>> +#endif /* IGT_HDR_H */
>> diff --git a/lib/meson.build b/lib/meson.build
>> index 0e7efadf3..d76a0d332 100644
>> --- a/lib/meson.build
>> +++ b/lib/meson.build
>> @@ -111,6 +111,7 @@ lib_sources = [
>>   	'igt_vc4.c',
>>   	'igt_vmwgfx.c',
>>   	'igt_psr.c',
>> +	'igt_hdr.c',
> Can you move it down to more proper place along with igt_psr.c?
Ack
>
> Regards,
> Kamil
>
>>   	'igt_amd.c',
>>   	'igt_edid.c',
>>   	'igt_eld.c',
>> diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
>> index b215b0e6c..eb336f14d 100644
>> --- a/tests/kms_hdr.c
>> +++ b/tests/kms_hdr.c
>> @@ -33,6 +33,7 @@
>>   #include <termios.h>
>>   #include <unistd.h>
>>   #include "igt_edid.h"
>> +#include "igt_hdr.h"
>>   
>>   /**
>>    * SUBTEST: bpc-switch
>> @@ -70,24 +71,8 @@
>>   
>>   IGT_TEST_DESCRIPTION("Test HDR metadata interfaces and bpc switch");
>>   
>> -/* HDR EDID parsing. */
>> -#define CTA_EXTENSION_VERSION		0x03
>> -#define HDR_STATIC_METADATA_BLOCK       0x06
>> -#define USE_EXTENDED_TAG		0x07
>> -
>>   #define BACKLIGHT_PATH "/sys/class/backlight"
>>   
>> -/* DRM HDR definitions. Not in the UAPI header, unfortunately. */
>> -enum hdmi_metadata_type {
>> -	HDMI_STATIC_METADATA_TYPE1 = 0,
>> -};
>> -
>> -enum hdmi_eotf {
>> -	HDMI_EOTF_TRADITIONAL_GAMMA_SDR,
>> -	HDMI_EOTF_TRADITIONAL_GAMMA_HDR,
>> -	HDMI_EOTF_SMPTE_ST2084,
>> -};
>> -
>>   /* HDR test formats: 10bpc + FP16 */
>>   static const uint32_t hdr_test_formats[] = {
>>   	DRM_FORMAT_XRGB2101010,
>> @@ -154,59 +139,6 @@ static void draw_hdr_pattern(igt_fb_t *fb)
>>   	igt_paint_test_pattern_color_fb(fb->fd, fb, 1.0, 1.0, 1.0);
>>   }
>>   
>> -/* Converts a double to 861-G spec FP format. */
>> -static uint16_t calc_hdr_float(double val)
>> -{
>> -	return (uint16_t)(val * 50000.0);
>> -}
>> -
>> -/* Fills some test values for ST2084 HDR output metadata.
>> - *
>> - * Note: there isn't really a standard for what the metadata is supposed
>> - * to do on the display side of things. The display is free to ignore it
>> - * and clip the output, use it to help tonemap to the content range,
>> - * or do anything they want, really.
>> - */
>> -static void fill_hdr_output_metadata_st2084(struct hdr_output_metadata *meta)
>> -{
>> -	memset(meta, 0, sizeof(*meta));
>> -
>> -	meta->metadata_type = HDMI_STATIC_METADATA_TYPE1;
>> -	meta->hdmi_metadata_type1.eotf = HDMI_EOTF_SMPTE_ST2084;
>> -
>> -	/* Rec. 2020 */
>> -	meta->hdmi_metadata_type1.display_primaries[0].x =
>> -		calc_hdr_float(0.708); /* Red */
>> -	meta->hdmi_metadata_type1.display_primaries[0].y =
>> -		calc_hdr_float(0.292);
>> -	meta->hdmi_metadata_type1.display_primaries[1].x =
>> -		calc_hdr_float(0.170); /* Green */
>> -	meta->hdmi_metadata_type1.display_primaries[1].y =
>> -		calc_hdr_float(0.797);
>> -	meta->hdmi_metadata_type1.display_primaries[2].x =
>> -		calc_hdr_float(0.131); /* Blue */
>> -	meta->hdmi_metadata_type1.display_primaries[2].y =
>> -		calc_hdr_float(0.046);
>> -	meta->hdmi_metadata_type1.white_point.x = calc_hdr_float(0.3127);
>> -	meta->hdmi_metadata_type1.white_point.y = calc_hdr_float(0.3290);
>> -
>> -	meta->hdmi_metadata_type1.max_display_mastering_luminance =
>> -		1000; /* 1000 nits */
>> -	meta->hdmi_metadata_type1.min_display_mastering_luminance =
>> -		500;				   /* 0.05 nits */
>> -	meta->hdmi_metadata_type1.max_fall = 1000; /* 1000 nits */
>> -	meta->hdmi_metadata_type1.max_cll = 500;   /* 500 nits */
>> -}
>> -
>> -/* Sets the HDR output metadata prop. */
>> -static void set_hdr_output_metadata(data_t *data,
>> -				    struct hdr_output_metadata const *meta)
>> -{
>> -	igt_output_replace_prop_blob(data->output,
>> -				     IGT_CONNECTOR_HDR_OUTPUT_METADATA, meta,
>> -				     meta ? sizeof(*meta) : 0);
>> -}
>> -
>>   /* Prepare test data. */
>>   static void prepare_test(data_t *data, igt_output_t *output, igt_crtc_t *crtc)
>>   {
>> @@ -308,13 +240,6 @@ static void test_bpc_switch_on_output(data_t *data, igt_crtc_t *crtc,
>>   	igt_remove_fb(data->fd, &afb);
>>   }
>>   
>> -/* Returns true if an output supports max bpc property. */
>> -static bool has_max_bpc(igt_output_t *output)
>> -{
>> -	return igt_output_has_prop(output, IGT_CONNECTOR_MAX_BPC) &&
>> -	       igt_output_get_prop(output, IGT_CONNECTOR_MAX_BPC);
>> -}
>> -
>>   static void test_bpc_switch(data_t *data, uint32_t flags)
>>   {
>>   	igt_display_t *display = &data->display;
>> @@ -325,7 +250,7 @@ static void test_bpc_switch(data_t *data, uint32_t flags)
>>   	for_each_connected_output(display, output) {
>>   		igt_crtc_t *crtc;
>>   
>> -		if (!has_max_bpc(output)) {
>> +		if (!igt_output_supports_max_bpc(output)) {
>>   			igt_info("%s: Doesn't support IGT_CONNECTOR_MAX_BPC.\n",
>>   				 igt_output_name(output));
>>   			continue;
>> @@ -375,92 +300,6 @@ static void test_bpc_switch(data_t *data, uint32_t flags)
>>   	}
>>   }
>>   
>> -static bool cta_block(const char *edid_ext)
>> -{
>> -	/*
>> -	 * Byte 1: 0x07 indicates Extended Tag
>> -	 * Byte 2: 0x06 indicates HDMI Static Metadata Block
>> -	 * Byte 3: bits 0 to 5 identify EOTF functions supported by sink
>> -	 *	       where ET_0: Traditional Gamma - SDR Luminance Range
>> -	 *	             ET_1: Traditional Gamma - HDR Luminance Range
>> -	 *	             ET_2: SMPTE ST 2084
>> -	 *	             ET_3: Hybrid Log-Gamma (HLG)
>> -	 *	             ET_4 to ET_5: Reserved for future use
>> -	 */
>> -
>> -	if ((((edid_ext[0] & 0xe0) >> 5 == USE_EXTENDED_TAG) &&
>> -	      (edid_ext[1] == HDR_STATIC_METADATA_BLOCK)) &&
>> -	     ((edid_ext[2] & HDMI_EOTF_TRADITIONAL_GAMMA_HDR) ||
>> -	      (edid_ext[2] & HDMI_EOTF_SMPTE_ST2084)))
>> -			return true;
>> -
>> -	return false;
>> -}
>> -
>> -/* Returns true if panel supports HDR. */
>> -static bool is_panel_hdr(data_t *data, igt_output_t *output)
>> -{
>> -	bool ok;
>> -	int i, j, offset;
>> -	uint64_t edid_blob_id;
>> -	drmModePropertyBlobRes *edid_blob;
>> -	const struct edid_ext *edid_ext;
>> -	const struct edid *edid;
>> -	const struct edid_cea *edid_cea;
>> -	const char *cea_data;
>> -	bool ret = false;
>> -
>> -	ok = kmstest_get_property(data->fd, output->id,
>> -			DRM_MODE_OBJECT_CONNECTOR, "EDID",
>> -			NULL, &edid_blob_id, NULL);
>> -
>> -	if (!ok || !edid_blob_id)
>> -		return ret;
>> -
>> -	edid_blob = drmModeGetPropertyBlob(data->fd, edid_blob_id);
>> -	igt_assert(edid_blob);
>> -
>> -	edid = (const struct edid *) edid_blob->data;
>> -	igt_assert(edid);
>> -
>> -	drmModeFreePropertyBlob(edid_blob);
>> -
>> -	for (i = 0; i < edid->extensions_len; i++) {
>> -		edid_ext = &edid->extensions[i];
>> -		edid_cea = &edid_ext->data.cea;
>> -
>> -		/* HDR not defined in CTA Extension Version < 3. */
>> -		if ((edid_ext->tag != EDID_EXT_CEA) ||
>> -		    (edid_cea->revision != CTA_EXTENSION_VERSION))
>> -				continue;
>> -		else {
>> -			offset = edid_cea->dtd_start;
>> -			cea_data = edid_cea->data;
>> -
>> -			for (j = 0; j < offset; j += (cea_data[j] & 0x1f) + 1) {
>> -				ret = cta_block(cea_data + j);
>> -
>> -				if (ret)
>> -					break;
>> -			}
>> -		}
>> -	}
>> -
>> -	return ret;
>> -}
>> -
>> -/* Sets the HDR output metadata prop with invalid size. */
>> -static int set_invalid_hdr_output_metadata(data_t *data,
>> -					   struct hdr_output_metadata const *meta,
>> -					   size_t length)
>> -{
>> -	igt_output_replace_prop_blob(data->output,
>> -				     IGT_CONNECTOR_HDR_OUTPUT_METADATA, meta,
>> -				     meta ? length : 0);
>> -
>> -	return igt_display_try_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
>> -}
>> -
>>   static void adjust_brightness(data_t *data, uint32_t flags)
>>   {
>>   	igt_backlight_context_t context;
>> @@ -484,7 +323,6 @@ static void adjust_brightness(data_t *data, uint32_t flags)
>>   }
>>   
>>   static void test_static_toggle(data_t *data, igt_crtc_t *crtc,
>> -			       igt_output_t *output,
>>   			       uint32_t format, uint32_t flags)
>>   {
>>   	igt_display_t *display = &data->display;
>> @@ -500,30 +338,30 @@ static void test_static_toggle(data_t *data, igt_crtc_t *crtc,
>>   
>>   	draw_hdr_pattern(&afb);
>>   
>> -	fill_hdr_output_metadata_st2084(&hdr);
>> +	igt_hdr_fill_st2084(&hdr);
>>   
>>   	/* Start with no metadata. */
>>   	igt_plane_set_fb(data->primary, &afb);
>>   	igt_plane_set_size(data->primary, data->w, data->h);
>> -	set_hdr_output_metadata(data, NULL);
>> +	igt_hdr_set_metadata(data->output, NULL);
>>   	igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 8);
>>   
>>   	if (flags & TEST_NEEDS_DSC) {
>> -		igt_force_dsc_enable(data->fd, output->name);
>> -		igt_assert(igt_is_force_dsc_enabled(data->fd, output->name));
>> +		igt_force_dsc_enable(data->fd, data->output->name);
>> +		igt_assert(igt_is_force_dsc_enabled(data->fd, data->output->name));
>>   	}
>>   
>>   	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
>>   	igt_assert_output_bpc_equal(crtc,
>> -				    output, 8);
>> +				    data->output, 8);
>>   
>>   	if (flags & TEST_NEEDS_DSC) {
>> -		igt_force_dsc_disable(data->fd, output->name);
>> -		igt_assert(igt_is_force_dsc_disabled(data->fd, output->name));
>> +		igt_force_dsc_disable(data->fd, data->output->name);
>> +		igt_assert(igt_is_force_dsc_disabled(data->fd, data->output->name));
>>   	}
>>   
>>   	/* Apply HDR metadata and 10bpc. We expect a modeset for entering. */
>> -	set_hdr_output_metadata(data, &hdr);
>> +	igt_hdr_set_metadata(data->output, &hdr);
>>   	igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 10);
>>   	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
>>   	if (flags & TEST_INVALID_HDR) {
>> @@ -537,7 +375,7 @@ static void test_static_toggle(data_t *data, igt_crtc_t *crtc,
>>   	}
>>   
>>   	igt_assert_output_bpc_equal(crtc,
>> -				    output, 10);
>> +				    data->output, 10);
>>   
>>   	/* Verify that the CRC are equal after DPMS or suspend. */
>>   	igt_pipe_crc_collect_crc(data->pipe_crc, &ref_crc);
>> @@ -545,23 +383,23 @@ static void test_static_toggle(data_t *data, igt_crtc_t *crtc,
>>   	igt_pipe_crc_collect_crc(data->pipe_crc, &new_crc);
>>   
>>   	/* Disable HDR metadata and drop back to 8bpc. We expect a modeset for exiting. */
>> -	set_hdr_output_metadata(data, NULL);
>> +	igt_hdr_set_metadata(data->output, NULL);
>>   	igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 8);
>>   
>>   	if (flags & TEST_NEEDS_DSC) {
>> -		igt_force_dsc_enable(data->fd, output->name);
>> -		igt_assert(igt_is_force_dsc_enabled(data->fd, output->name));
>> +		igt_force_dsc_enable(data->fd, data->output->name);
>> +		igt_assert(igt_is_force_dsc_enabled(data->fd, data->output->name));
>>   	}
>>   
>>   	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
>>   	igt_assert_output_bpc_equal(crtc,
>> -				    output, 8);
>> +				    data->output, 8);
>>   
>>   	igt_assert_crc_equal(&ref_crc, &new_crc);
>>   
>>   	if (flags & TEST_NEEDS_DSC) {
>> -		igt_force_dsc_disable(data->fd, output->name);
>> -		igt_assert(igt_is_force_dsc_disabled(data->fd, output->name));
>> +		igt_force_dsc_disable(data->fd, data->output->name);
>> +		igt_assert(igt_is_force_dsc_disabled(data->fd, data->output->name));
>>   	}
>>   
>>   cleanup:
>> @@ -569,38 +407,7 @@ cleanup:
>>   	igt_remove_fb(data->fd, &afb);
>>   }
>>   
>> -/* Fills some test values for HDR metadata targeting SDR. */
>> -static void fill_hdr_output_metadata_sdr(struct hdr_output_metadata *meta)
>> -{
>> -	memset(meta, 0, sizeof(*meta));
>> -
>> -	meta->metadata_type = HDMI_STATIC_METADATA_TYPE1;
>> -	meta->hdmi_metadata_type1.eotf = HDMI_EOTF_TRADITIONAL_GAMMA_SDR;
>> -
>> -	/* Rec. 709 */
>> -	meta->hdmi_metadata_type1.display_primaries[0].x =
>> -		calc_hdr_float(0.640); /* Red */
>> -	meta->hdmi_metadata_type1.display_primaries[0].y =
>> -		calc_hdr_float(0.330);
>> -	meta->hdmi_metadata_type1.display_primaries[1].x =
>> -		calc_hdr_float(0.300); /* Green */
>> -	meta->hdmi_metadata_type1.display_primaries[1].y =
>> -		calc_hdr_float(0.600);
>> -	meta->hdmi_metadata_type1.display_primaries[2].x =
>> -		calc_hdr_float(0.150); /* Blue */
>> -	meta->hdmi_metadata_type1.display_primaries[2].y =
>> -		calc_hdr_float(0.006);
>> -	meta->hdmi_metadata_type1.white_point.x = calc_hdr_float(0.3127);
>> -	meta->hdmi_metadata_type1.white_point.y = calc_hdr_float(0.3290);
>> -
>> -	meta->hdmi_metadata_type1.max_display_mastering_luminance = 0;
>> -	meta->hdmi_metadata_type1.min_display_mastering_luminance = 0;
>> -	meta->hdmi_metadata_type1.max_fall = 0;
>> -	meta->hdmi_metadata_type1.max_cll = 0;
>> -}
>> -
>>   static void test_static_swap(data_t *data, igt_crtc_t *crtc,
>> -			     igt_output_t *output,
>>   			     uint32_t format, uint32_t flags)
>>   {
>>   	igt_display_t *display = &data->display;
>> @@ -622,26 +429,26 @@ static void test_static_swap(data_t *data, igt_crtc_t *crtc,
>>   	igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 8);
>>   
>>   	if (flags & TEST_NEEDS_DSC) {
>> -		igt_force_dsc_enable(data->fd, output->name);
>> -		igt_assert(igt_is_force_dsc_enabled(data->fd, output->name));
>> +		igt_force_dsc_enable(data->fd, data->output->name);
>> +		igt_assert(igt_is_force_dsc_enabled(data->fd, data->output->name));
>>   	}
>>   
>>   	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
>>   	igt_assert_output_bpc_equal(crtc,
>> -				    output, 8);
>> +				    data->output, 8);
>>   
>>   	if (flags & TEST_NEEDS_DSC) {
>> -		igt_force_dsc_disable(data->fd, output->name);
>> -		igt_assert(igt_is_force_dsc_disabled(data->fd, output->name));
>> +		igt_force_dsc_disable(data->fd, data->output->name);
>> +		igt_assert(igt_is_force_dsc_disabled(data->fd, data->output->name));
>>   	}
>>   
>>   	/* Enter HDR, a modeset is allowed here. */
>> -	fill_hdr_output_metadata_st2084(&hdr);
>> -	set_hdr_output_metadata(data, &hdr);
>> +	igt_hdr_fill_st2084(&hdr);
>> +	igt_hdr_set_metadata(data->output, &hdr);
>>   	igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 10);
>>   	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
>>   	igt_assert_output_bpc_equal(crtc,
>> -				    output, 10);
>> +				    data->output, 10);
>>   
>>   	igt_pipe_crc_collect_crc(data->pipe_crc, &ref_crc);
>>   
>> @@ -652,21 +459,21 @@ static void test_static_swap(data_t *data, igt_crtc_t *crtc,
>>   	hdr.hdmi_metadata_type1.max_fall = 200;
>>   	hdr.hdmi_metadata_type1.max_cll = 100;
>>   
>> -	set_hdr_output_metadata(data, &hdr);
>> +	igt_hdr_set_metadata(data->output, &hdr);
>>   	if (is_amdgpu_device(data->fd))
>>   		igt_display_commit_atomic(display, 0, NULL);
>>   	else
>>   		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
>>   
>>   	if (flags & TEST_NEEDS_DSC) {
>> -		igt_force_dsc_enable(data->fd, output->name);
>> -		igt_assert(igt_is_force_dsc_enabled(data->fd, output->name));
>> +		igt_force_dsc_enable(data->fd, data->output->name);
>> +		igt_assert(igt_is_force_dsc_enabled(data->fd, data->output->name));
>>   	}
>>   	/* Enter SDR via metadata, no modeset allowed for
>>   	 * amd driver, whereas a modeset is required for
>>   	 * intel driver. */
>> -	fill_hdr_output_metadata_sdr(&hdr);
>> -	set_hdr_output_metadata(data, &hdr);
>> +	igt_hdr_fill_sdr(&hdr);
>> +	igt_hdr_set_metadata(data->output, &hdr);
>>   	if (is_amdgpu_device(data->fd))
>>   		igt_display_commit_atomic(display, 0, NULL);
>>   	else
>> @@ -675,45 +482,39 @@ static void test_static_swap(data_t *data, igt_crtc_t *crtc,
>>   	igt_pipe_crc_collect_crc(data->pipe_crc, &new_crc);
>>   
>>   	/* Exit SDR and enter 8bpc, cleanup. */
>> -	set_hdr_output_metadata(data, NULL);
>> +	igt_hdr_set_metadata(data->output, NULL);
>>   	igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 8);
>>   	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
>>   	igt_assert_output_bpc_equal(crtc,
>> -				    output, 8);
>> +				    data->output, 8);
>>   
>>   	/* Verify that the CRC didn't change while cycling metadata. */
>>   	igt_assert_crc_equal(&ref_crc, &new_crc);
>>   
>>   	if (flags & TEST_NEEDS_DSC) {
>> -		igt_force_dsc_disable(data->fd, output->name);
>> -		igt_assert(igt_is_force_dsc_disabled(data->fd, output->name));
>> +		igt_force_dsc_disable(data->fd, data->output->name);
>> +		igt_assert(igt_is_force_dsc_disabled(data->fd, data->output->name));
>>   	}
>>   
>>   	test_fini(data);
>>   	igt_remove_fb(data->fd, &afb);
>>   }
>>   
>> -static void test_invalid_metadata_sizes(data_t *data, igt_output_t *output)
>> +static void test_invalid_metadata_sizes(data_t *data)
>>   {
>>   	struct hdr_output_metadata hdr;
>>   	size_t metadata_size = sizeof(hdr);
>>   
>> -	fill_hdr_output_metadata_st2084(&hdr);
>> +	igt_hdr_fill_st2084(&hdr);
>>   
>> -	igt_assert_eq(set_invalid_hdr_output_metadata(data, &hdr, 1), -EINVAL);
>> -	igt_assert_eq(set_invalid_hdr_output_metadata(data, &hdr, metadata_size + 1), -EINVAL);
>> -	igt_assert_eq(set_invalid_hdr_output_metadata(data, &hdr, metadata_size - 1), -EINVAL);
>> -	igt_assert_eq(set_invalid_hdr_output_metadata(data, &hdr, metadata_size * 2), -EINVAL);
>> +	igt_assert_eq(igt_hdr_set_invalid_metadata(data->output, &hdr, 1), -EINVAL);
>> +	igt_assert_eq(igt_hdr_set_invalid_metadata(data->output, &hdr, metadata_size + 1), -EINVAL);
>> +	igt_assert_eq(igt_hdr_set_invalid_metadata(data->output, &hdr, metadata_size - 1), -EINVAL);
>> +	igt_assert_eq(igt_hdr_set_invalid_metadata(data->output, &hdr, metadata_size * 2), -EINVAL);
>>   
>>   	test_fini(data);
>>   }
>>   
>> -/* Returns true if an output supports HDR metadata property. */
>> -static bool has_hdr(igt_output_t *output)
>> -{
>> -	return igt_output_has_prop(output, IGT_CONNECTOR_HDR_OUTPUT_METADATA);
>> -}
>> -
>>   static void test_hdr(data_t *data, uint32_t flags)
>>   {
>>   	igt_display_t *display = &data->display;
>> @@ -729,20 +530,20 @@ static void test_hdr(data_t *data, uint32_t flags)
>>   		 * set MAX_BPC property to 10bpc prior to setting
>>   		 * HDR metadata property. Therefore, checking.
>>   		 */
>> -		if (!has_max_bpc(output) || !has_hdr(output)) {
>> +		if (!igt_output_supports_max_bpc(output) || !igt_output_supports_hdr(output)) {
>>   			igt_info("%s: Doesn't support IGT_CONNECTOR_MAX_BPC or IGT_CONNECTOR_HDR_OUTPUT_METADATA.\n",
>>   				 igt_output_name(output));
>>   			continue;
>>   		}
>>   
>>   		/* For negative test, panel should be non-hdr. */
>> -		if ((flags & TEST_INVALID_HDR) && is_panel_hdr(data, output)) {
>> +		if ((flags & TEST_INVALID_HDR) && igt_is_panel_hdr(data->fd, output)) {
>>   			igt_info("%s: Can't run negative test on HDR panel.\n",
>>   				 igt_output_name(output));
>>   			continue;
>>   		}
>>   
>> -		if ((flags & ~TEST_INVALID_HDR) && !is_panel_hdr(data, output)) {
>> +		if ((flags & ~TEST_INVALID_HDR) && !igt_is_panel_hdr(data->fd, output)) {
>>   			igt_info("%s: Can't run HDR tests on non-HDR panel.\n",
>>   				 igt_output_name(output));
>>   			continue;
>> @@ -772,8 +573,8 @@ static void test_hdr(data_t *data, uint32_t flags)
>>   					     crtc);
>>   
>>   				/* Signal HDR requirement via metadata */
>> -				fill_hdr_output_metadata_st2084(&hdr);
>> -				set_hdr_output_metadata(data, &hdr);
>> +				igt_hdr_fill_st2084(&hdr);
>> +				igt_hdr_set_metadata(data->output, &hdr);
>>   				if (igt_display_try_commit2(display, display->is_atomic ?
>>   							    COMMIT_ATOMIC : COMMIT_LEGACY)) {
>>   					igt_info("%s: Couldn't set HDR metadata\n",
>> @@ -796,7 +597,7 @@ static void test_hdr(data_t *data, uint32_t flags)
>>   				else
>>   					flags &= ~TEST_NEEDS_DSC;
>>   
>> -				set_hdr_output_metadata(data, NULL);
>> +				igt_hdr_set_metadata(data->output, NULL);
>>   				igt_display_commit2(display, display->is_atomic ?
>>   						    COMMIT_ATOMIC : COMMIT_LEGACY);
>>   
>> @@ -811,13 +612,13 @@ static void test_hdr(data_t *data, uint32_t flags)
>>   						     TEST_INVALID_HDR | TEST_BRIGHTNESS))
>>   						test_static_toggle(data,
>>   								   crtc,
>> -								   output, hdr_test_formats[i], flags);
>> +								   hdr_test_formats[i], flags);
>>   					if (flags & TEST_SWAP)
>>   						test_static_swap(data,
>>   								 crtc,
>> -								 output, hdr_test_formats[i], flags);
>> +								 hdr_test_formats[i], flags);
>>   					if (flags & TEST_INVALID_METADATA_SIZES)
>> -						test_invalid_metadata_sizes(data, output);
>> +						test_invalid_metadata_sizes(data);
>>   				}
>>   			}
>>   
>> -- 
>> 2.25.1
>>
