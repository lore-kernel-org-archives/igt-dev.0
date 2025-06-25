Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2793C7EE2A
	for <igt-dev@archiver.kernel.org>; Wed, 25 Jun 2025 20:59:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 817B810E121;
	Wed, 25 Jun 2025 20:59:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QROccWb4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95AF510E121
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Jun 2025 20:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750885181; x=1782421181;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=nnNtfxILww1VfbDUIh3CASUYuc91zIpELVPp7R21Mpo=;
 b=QROccWb4j9EUFJxfiivGMyh645qBDdPsM3sSgAkSNMGLL7XMszVnMiZ3
 TTFxBKez7SYRx86gYLgqxnWCOwoqpBHuqgdHAk/4XdFwFMdL7Dr7K2Xq/
 efpVJKUWlMxKbCrqIR+RjJ0YG0e66QysDEhlov+HM3dkYtxwbphuQEadG
 v6PfVuLuf7wrYUqboHnEn1IvyQCzPT0GeYx2SaApCx/VA4bnUkxRjfYwT
 ocMZVSI8H5P8qpU4ooc2ty9FIOU/03MPTM7E1hKRGbelwmkQpiDQGxfZ3
 3aTUAIt69mRrAffWLo+FCgUOnpSwaua2u+AUwLPEhHbBDYJRszNeTQBeH Q==;
X-CSE-ConnectionGUID: 9kU7yQIXQM+ywapRnkjwmQ==
X-CSE-MsgGUID: j0IAb7RUS5OJCHfFkzgVnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="53306292"
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; d="scan'208";a="53306292"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 13:59:41 -0700
X-CSE-ConnectionGUID: 9D0lKTW3TTq/4H4Rt8f5oQ==
X-CSE-MsgGUID: PSmvVTbSScep871jSFxqKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; d="scan'208";a="156587547"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 13:59:41 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 13:59:40 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 25 Jun 2025 13:59:40 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (40.107.102.71)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 13:59:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qm1JNu0fBDFWmpMVKu49EfzKo+HbS7VLfGGI9OwCvOzsNWRn11YU/XlWgztHXig3hWAuJqlfxvNH017p48xJXG/BwaY9t95VbaJURbdRDalK8Y94MZhp7esJMrwzMwA9k++Ckd4Lti2ukGDDhqyJ9V8BC25aXp6jme+RhQfHcwielipQ5y99IocanyjFc1VjcBiYq5YapXe3jbvloF6f1gt1ImggHDv2gvl8aKb+LnmJlBje2W/dJX4PunHXE+FntbEOS6t6VU12T7KITc+kNWPrgayj62Dplrl1RqHMMn+73uVna6/RpPqrskhxkYxW3owesnqF4npX66dcb8z1JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=87UEB6nVpxOlXxT7ZK3BnUP9K8XdtcdDi2HoFITbJO8=;
 b=K0R2st+42MbQONr0PZBG9AxdoEoYMzHkE4bsCgkI+ox+jr3zWyHIg0ykRS5xZIevmc4tv/9QIP/hZzdt+qZn5vI0AMPTwWSpPGYt840OjU7flYWQTJP5zJBK8/35QcIhgRczgpSLfonfacYMDrqnP9GVEwWfmQ4KQKZE6JuIjjUhXwB9DqVzv//NnnSmOVCILxf5CviNhZ/wOp5V3q1rr72I6eWwupBI5qSm7+uzRkuEfnr3+wchPUpebISQOkXabAZ1X1PRemXXOBgtmm8BPCDUIYOWz1uAsVzlvOgqFOZtU0SH4zuqXRMIBpAnkBSxZCsHEYEDXjsMd6FaR717oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB8252.namprd11.prod.outlook.com (2603:10b6:510:1aa::14)
 by SN7PR11MB6604.namprd11.prod.outlook.com (2603:10b6:806:270::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Wed, 25 Jun
 2025 20:59:37 +0000
Received: from PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::625b:17f6:495f:7ad]) by PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::625b:17f6:495f:7ad%6]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 20:59:37 +0000
Message-ID: <aab8180e-fc6a-411f-9786-29ec0d7d7a66@intel.com>
Date: Thu, 26 Jun 2025 02:29:32 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/xe_pmu: Add gt id check while selecting
 engines
To: Riana Tauro <riana.tauro@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <umesh.nerlige.ramappa@intel.com>,
 <soham.purkait@intel.com>
References: <20250625142608.2042599-1-riana.tauro@intel.com>
Content-Language: en-US
From: "Anirban, Sk" <sk.anirban@intel.com>
In-Reply-To: <20250625142608.2042599-1-riana.tauro@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0167.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::15) To PH7PR11MB8252.namprd11.prod.outlook.com
 (2603:10b6:510:1aa::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB8252:EE_|SN7PR11MB6604:EE_
X-MS-Office365-Filtering-Correlation-Id: 02ea3f3b-054c-45ec-440f-08ddb42b3201
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R0J3dnRraWlGVEhpaGpDVitqd0VxakhZc0IwbUNaUlRmLzN1SHFsZWRObnNl?=
 =?utf-8?B?dEtKRWw5WnY0V2RtMTlIci93UTVaL2FXSVdjSFFVUFZYczJNRXRROG5xbmo4?=
 =?utf-8?B?TGZGQ3FudVhvWGJjTXRTOTJIVE9QRTRodWRKL0lnRFhkQWNnOWJUTjJiZzdC?=
 =?utf-8?B?QTdxL0VCcDZ2NUc5a1V4aEg1V01JRHF2QXVxazZUUWI5eVM0VHNqUDVEWjkw?=
 =?utf-8?B?SW9wZTdwRmI5MFpWWkd1QWd1NUZ1aEFEN0ltNUoyTkd4RWNCSDlKRUVVNXNE?=
 =?utf-8?B?ZjN4Z1ZoeGtuZWpodDBWQWdnM0dYajVLZUxNbFo5MzNTYW9GVDNhTTRjTi9F?=
 =?utf-8?B?SVMyTkJDNTNFTDZEa2tET1lXeE41RlhjYVgyQlVhbjlna3Q0eVVyK1hNUnl1?=
 =?utf-8?B?TGVVWDkzSmZCeGtndEg0RHdRcUNyNDFieXRpdGhpVXRkR2pmRHlFbzJQdFhG?=
 =?utf-8?B?OGhKVWMvbjQ1ZFBlMnhIZDZNQU4zR3FVL0pEQWxmZXJCMFVaQk5MN3RseExH?=
 =?utf-8?B?S1UwSXVtemN6anRid1hEcGpITjYvRGhpcG1QamVHV2liQjZHN2NIWlY4bHla?=
 =?utf-8?B?MXRpUmw4Z3BTTmZXN29sdHAyTGtXK1d5NDgxSkFLZ0YxemlwWjEvK3NhMUFr?=
 =?utf-8?B?bDhQOWNpV0x5TENMR21DVDFCRVJ5MWRCanZZN2R3OWJuS2p4NFRta0RKK2tX?=
 =?utf-8?B?WjNtNVNZcE9RYVplRWFwQU41bzZDWTJIdWJtL1NLMzZWdmdVVkFEMW1hNHRX?=
 =?utf-8?B?Z05HaWdaVTJlSllHdWFDdWI2K0JMbWxlWGg3RmtZNUcvdE9QQW8rcDQvNlBw?=
 =?utf-8?B?cVkvM1kxUGk1Y2JHUkhCMFQzVXB4clBYNWdaZURLYko4RXV1NFdaSWpaSHN6?=
 =?utf-8?B?NkJIczhzUHhmaXQ1Yk5FZU1CWHpWR1JzTVFpM1R5R0NyNkNHSmxWM05wTFJi?=
 =?utf-8?B?d1hkaG4xL3laZndRVXJtMGtta21pM1REcmgyOU5ZRnZCNlNvUGRqZUl6RmpW?=
 =?utf-8?B?T1NkTzNSanNVZk1FaTA5VG9OaExSL1YrVGxObi9RdTFaNlBTcFZsWm1kNnRM?=
 =?utf-8?B?UlV5amtqeVhRTyt4c3piSGozanVlQ1ZNOEhjd0VpR1k4ZldJaGpxbGlEcFEy?=
 =?utf-8?B?VUg2TnI4Vy9rc01GNmlKSGVTdGRjdWNjeDAzS2tYYWZSb1AwSXFvT3QxbFZW?=
 =?utf-8?B?UmRRb05LSXRhbjNpblBadWRWNnJXSDZ2VWN3czMxd0F1Q2dBNXZCVHVRaFRS?=
 =?utf-8?B?WTZFL2prcHVGaUFtMXo2QW1JdXVldzlPUTNXelREL3dNRlZFUDQvZ1M3V2xn?=
 =?utf-8?B?NnArZ05qZmhnNjl5QU9mZFhwWUNra29FT1FXbFJ5cXVraUVIVGVqcDc3Ynhy?=
 =?utf-8?B?NUxaR2hHSDZPTll5VURZSWtCTVdjSWYwaFNndTVCQUthUDhGYW52cUpGUXVB?=
 =?utf-8?B?UUU1UXhhLzVpNTZsY2F5T2hlSDh5OGZ6aHhRRk92VXE0dHNHNm5WbjVYTDRp?=
 =?utf-8?B?c1plK3FkU2NaeFJoMTRIMVVNcmhPV1J6dGw3N0xVZVNrTnp5Y2VxblN6cERu?=
 =?utf-8?B?aE1IUXlxRUN0OVU2Q3FjTkh4Qm9qSmoyZFBxbVZ3WHJIVW9EMFNDT3RDbk50?=
 =?utf-8?B?Um5YVk5DT0NadE1KUVA0YmErc29hckhRNWZUNml0WGpjQ2ROMEJ3WnNDYWty?=
 =?utf-8?B?NVdNRk5kSkxndXE4MGI0ZmRRZ0gxb2owWjNVb3dxYlg3OGQvWGJjdzUrZUI3?=
 =?utf-8?B?YXBYck1CS3R4YlYvdU5CeVFiak1HNVludkRGZklDdUwwS3hxUDdsN1FkY3Vk?=
 =?utf-8?B?SXV4Tm9LZmVDMlAra1lTZlFvSEpPV29qV25KRVRNZ2thUEIrSGJ4K1NTRm5l?=
 =?utf-8?B?eGRMaFJwRHREYnAvWEhRelFxdHB0d0JKMEFRUGV1ZFpjN1BVd0prVU4wUC9X?=
 =?utf-8?Q?OI7zl+B8/gs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB8252.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SCthMi9qZmhvWUxZRXE0TTBIaEthMnBFY3lPVDNJcXQxVlorUlJNNGxpeFdI?=
 =?utf-8?B?VG9FdDZiL1FXWGJKYzhvWVJ4d1h3UWdrN091Qy9KSGFiMk5TY1VmUThyVnpI?=
 =?utf-8?B?WkE0cFRPYUM1LzYzTC90ZUhQY0svMFByQWFRR1dIUEgzRzcwOU5KN2lHVDRQ?=
 =?utf-8?B?cElCa3ZVM2d0RUtzRXF4S016MS9EeWNhcHZ5a0tmTXh3a041dE1VOXphUXBT?=
 =?utf-8?B?Z1Q3cU8veTdQTWQ4R1hqREVmSm51eWNrTThSRTk4RG5VcHJPZTVpRTB2b3RG?=
 =?utf-8?B?TnF5NElMbzFHSTNQdnJrdFZBRHN4RW9kV2xwczJyOE1ZRXpyMkZENkZEWmRT?=
 =?utf-8?B?aXU3VnBCMVhUZkM4MXEwd09iczgyemJNNmtuQSt0VlpvaFhuWlY1Q2dCRnl1?=
 =?utf-8?B?ektaTFZyWWNrVTljdUxGSVRNS0Z1amRBQlVkWjhabERkZStuYXlnQTN3RVRK?=
 =?utf-8?B?ZGJNdnlvU3g3S1VmVEpGU0dTV0F6Qm9KbFVkQzBZTGFzTGYxRTVOYTRFQUov?=
 =?utf-8?B?WlNoUWU3a2F3bUFMVXZ1YktIeUhVK0RpQ3JxbjhiL25xdDdLYmxRMHl4SjJU?=
 =?utf-8?B?bHgxUW9LMG5YSkE3cXAyOHBYQklKdFh2RThkT1lGb25QN3pDZ1NEOEpmUlJz?=
 =?utf-8?B?S1c0SzhtNWlTK1FieFdCa013Vmc2dE1DR2crRUR2NTJpR1J3MUl1eEJ6NE8r?=
 =?utf-8?B?YmZmSXhTNHZYb2ljZVRFRStSbUNvVDJCckVieUt6ZDZmd3Z6R2lzNzdMK0J6?=
 =?utf-8?B?N01VVlcrajhtMjFyVTRWNDY2YVRTNUJFZnFaV1JFZ09oTDNTZmtwTG1iYUF3?=
 =?utf-8?B?Y0FxOFVCRnVjKy9QK0dPN1R5UXZmYmI3b1lmSVNRL1k3ZTA3T2FmTndET01I?=
 =?utf-8?B?ejBFdDVTTkpzZGMyL2hPa08rRlM4M2lpNXkralZmMzZJOURybEFsNjh2R3ow?=
 =?utf-8?B?MDFvOE04Z2JuaHVEN0VXaVRxZzFSOXZnZ0VYeERacnVjTmVBVmdQVm8zbk85?=
 =?utf-8?B?R2RWVmFHeHZnK3R3Uk9sYzV3SGFtQkUwdjk4aEhWQ1FFMVNoaGJ5UWhWRDVC?=
 =?utf-8?B?dkpZYVByRm1tNHZ0ZHhMd2FqRWY0dlozdDZyYS92NWgwL01sSUFDNVliTjlU?=
 =?utf-8?B?SFZiS3BsMkVOYXg3akc3dU9Kb2RCb2ZkQ3VyNUpxaVBhZWVlMFFOM0t5MEVh?=
 =?utf-8?B?Z3krL2NRSTVQckkyZTFHekNzdWEyV2Rta3RzelFFUk11bzVtRUV6elY5SXBX?=
 =?utf-8?B?OG52ZVpXc1lta2Z2RHRwNmRNczU1QnRmZUpkd0hnR3VzZVJTL1lBQ2tEWk1S?=
 =?utf-8?B?ZFBBa3V2cFFOaEt3enRTc25ZaUMyb0tBRDlGYlJkWFVKVGNXcElXdEZMZ3FI?=
 =?utf-8?B?bG5lZWZoM2pyZXAvcUVNdE1QdkErbjBnMnRZS2ZuRml6SE9SK2hOREFLZFA5?=
 =?utf-8?B?eVdtVHRTTWtRZXB2OG1jVHBRRmlIVFRBeHUzZi9kaTFMYUpLYllsUHJqS01B?=
 =?utf-8?B?WjZ5NnB5Mk4xdEw4OWVMN0tnRURERFJQZlNFQ0plaTJOMTQ4aWlMYmxNS1JF?=
 =?utf-8?B?WTJVYy9XeWdIZXBCTzMxbTV6dmhWcGF5Y2JWMW1xTEM4UmUwcDlZRlRhc29z?=
 =?utf-8?B?NjdoQVV6a2JrSWIyZWJqQ3Q0MDdYY1BwbFlmL0ZaV1dzM0xqR1BUNDRyS3VY?=
 =?utf-8?B?d3JvOE1oaTNuREhad1lhelkwZWVUL1JPQ0UxZG56QTJDbVVyM1NRMzZGckJR?=
 =?utf-8?B?T09YK1llRElZMG9DdDd2MCsrallSdWVSKzlXSGtNMkFqN0Q1VEsweFdhSGt1?=
 =?utf-8?B?WVFUWDNFWTBYOE52Ulk4QSthYTFSandrUXpqdU5SYTZJeEVodkNYMHRHQlYz?=
 =?utf-8?B?eEJsODZ5aFIxOC9oaFZFTytDSllkbFdWUjA4d3R2WmVQd1ArWis0NG5aTjMx?=
 =?utf-8?B?eGlQeHhESjFLaG5Qdk9UZUFOczh3RE9SS0Zld25qOGtsdEdXcm1iNHhyelJF?=
 =?utf-8?B?bkhYS29Xb2JUVjJTLzZZTVhQS2lpZGhZbGErT001Y3FuSnlGRVRRekJxb1Y1?=
 =?utf-8?B?c0Y1RTRFY0RPTE5IUmRDNDU0QU16RFNMQzlOSHR5YUJuTXhRTDNiTnlzQ1Zx?=
 =?utf-8?Q?eJJmzRYPMZ2Q04MN+iqeBdYPa?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 02ea3f3b-054c-45ec-440f-08ddb42b3201
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8252.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 20:59:37.5566 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hRcvcBM7evDMndWWPRfGKvzJiPLN+b6FGtnPYNVl+YmF+2McZ/EWj/qFJ/89WjV9HGoffx8uoHY/EBRz49jVNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6604
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

Hi Riana,

On 25-06-2025 19:56, Riana Tauro wrote:
> In multi-tile cards like PVC, where engine class and instance numbers
> are identical, gt id distinguishes between engines while selecting for
> load execution or idling.
>
> Check gt id while selecting engines.
>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>   tests/intel/xe_pmu.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
> index 2ac4c7293..0e5a7360f 100644
> --- a/tests/intel/xe_pmu.c
> +++ b/tests/intel/xe_pmu.c
> @@ -321,7 +321,8 @@ static void engine_activity_load_single(int fd, int num_engines,
>   		flag[engine_idx] = TEST_IDLE;
>   
>   		if (eci_->engine_class == eci->engine_class &&
> -		    eci_->engine_instance == eci->engine_instance)
> +		    eci_->engine_instance == eci->engine_instance &&
> +		    eci_->gt_id == eci->gt_id)
>   			flag[engine_idx] = TEST_LOAD;
>   
>   		config = get_event_config(eci_->gt_id, eci_, "engine-active-ticks");
> @@ -379,7 +380,8 @@ static void engine_activity_load_most(int fd, int num_engines, struct drm_xe_eng
>   		flag[engine_idx] = TEST_LOAD;
>   
>   		if (eci_->engine_class == eci->engine_class &&
> -		    eci_->engine_instance == eci->engine_instance) {
> +		    eci_->engine_instance == eci->engine_instance &&
> +		    eci_->gt_id == eci->gt_id) {
>   			flag[engine_idx] = TEST_IDLE;
>   			cork[engine_idx] = NULL;
>   		} else {
manually checked on pvc, looks good to me.

Reviewed-by: Sk Anirban <sk.anirban@intel.com>

Regards,
Anirban
