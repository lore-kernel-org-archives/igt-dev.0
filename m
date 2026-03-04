Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EB8DEFCE2A
	for <igt-dev@archiver.kernel.org>; Wed,  4 Mar 2026 17:50:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADC8110EA84;
	Wed,  4 Mar 2026 17:50:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mUDkFy3G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A77710EA87
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Mar 2026 17:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772646657; x=1804182657;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=NFO5OAJbz0vU/lxkLUgv4O+LpmNLs5iVzVcidtVT/Vc=;
 b=mUDkFy3GsDu8OvFUvt8k3NJws+5JMgfp6l99k0gNmIINXHTGrqupgcs2
 pwaO962GcHFivMl14V7fm6ZMK2uou92J7bX9kwLHzmLpnRp66lS1uGfcx
 rNGhKq2AndYcJ5EbvT76p5yeOzZLpUb4bCJAaHsZXsE4OJ2jfKQiDAtdK
 +UjYuqkAr3suKn4qxdk2m3NZEDnk2GAsFFJeyZ2fAizEGVBAd1q3YZnRA
 2Pk2eeZj6Nm1fjmR9Grplgj/clHnP5TeG2QBEGGYo4LiRdwcGjw/tCTV2
 a0ZWjISABNma015tvWQBWyA8o7WkEoyGI93/5J46dThvtb1n8habDyuK3 w==;
X-CSE-ConnectionGUID: s/1Wn6T2SAOwCQfypv/Tkg==
X-CSE-MsgGUID: QvqZSyGCRvOkWDfRoCQgUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="73683958"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="73683958"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 09:50:57 -0800
X-CSE-ConnectionGUID: k9g0VmDxRUWcDz/BlY0TzA==
X-CSE-MsgGUID: LqvJ8AU4QumHnvIr/sUFuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="245031604"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 09:50:56 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 4 Mar 2026 09:50:56 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 4 Mar 2026 09:50:56 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.40) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 4 Mar 2026 09:50:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oheJ3tN6PLNYPo0eX+VweEuFkxVs51EeIUMSBNWmmJal6OYZBsC7k5RxWTTjJ3AYr1m+qsmz4ast/Zhm397VaTEbugRDpHIaqJII6rz5KM3ZXUFkvX4Z2xlAiX7a8AqrsS1lF4QFhn9vUyWRLaLzK0v4bRCRKmebcyl7HLEnM2W/7pCmIdjnhRjfadq6XPiONo8HKm7EUlKjQskHjvjwwI8MCZJn/feTh5SDtg5EHTImBUJ758SW6QyldJP6RtRLfnRZe6fl23UPQ1tWTa2NiL+ZtxtOOoCFfTOHAZ4KNFaQz8Ixl39xWZb30EwFyZihfZeHSdbPzP//1IlmOscnjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wTh4cQ1+uHv5t4tF7EtJLnimUyDFytmMig0VlKmj50I=;
 b=xtnyNVsiByTISBMXG3A4Tiywh8Rg0Bf+JEQjMHsklIxdHVMOd+SQmteE6kdKneoh1koQDZEg+gCdjLvsGu5CRXAUOAyQJkG2FiHj/K0yRun8MvqVVQced1yNGDmSaiFJ33uAkHEi241zFuiVX5862dGHRhpMI1Uxs/1yQyTBRaQ1Scab5vul5u8LVnhru4Fpw7chnEtPOJGAH13HsVbnG0QCACLUF/7xkNibMcplh6ovYyeObusoSuUehR0AQ6Ezk1oRZWly4IgKVkJ99UXKgg7C7obV/c00kViw/CVxKbpBG1fmQy7Hv+5TfJ2OKInJ5s10L28Vi1Z6wNB1o0GXUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by PH3PPF10E309DEE.namprd11.prod.outlook.com (2603:10b6:518:1::d08)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 17:50:51 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c%4]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 17:50:51 +0000
Message-ID: <849a21ad-a404-4278-9dec-f1c0d2b04db2@intel.com>
Date: Wed, 4 Mar 2026 23:20:42 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] intel-ci: Remove chamelium testlist symlinks
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, Mohammed Bilal
 <mohammed.bilal@intel.com>, <igt-dev@lists.freedesktop.org>,
 <kamil.konieczny@intel.com>, <kunal1.joshi@intel.com>,
 <karol.krol@intel.com>, <ryszard.knop@intel.com>
References: <20260302101926.3015380-1-mohammed.bilal@intel.com>
 <20260302101926.3015380-2-mohammed.bilal@intel.com>
 <20260304164312.qoygwexpriuj2kno@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20260304164312.qoygwexpriuj2kno@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0085.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::6) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|PH3PPF10E309DEE:EE_
X-MS-Office365-Filtering-Correlation-Id: bb610ff3-ad04-4d7f-e8fc-08de7a169360
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: gPNCTniVh04C89Dnnp77dIUWTjsIqA/h5r2vKkw1SW/VyyKdcVVXYu8tvPqiyjr7OzVVZ4uq1m1rCmVGL32S6NCD/pFrz4y21WLasX8sQwKy/TKQvuY5ktX82/bixU31QvGXuaULrEmaq2LiHqCNJgsdqXIngYVAL0n8oloxdOK+n/F/Zb3lwe5FGOrmA/QgeUK1zZK/AQ5yu0DyNN1+bDIX9ex1epvyxqFXWBpdsXbsyNEf2FZ7EZ4DlG8FwjALEwD+6J6R5wE2keTYHOX9/OjXhHzcbNKUh1x3kBMsvf+NUzOMdUOkNXe5HSFlfYRdYH+ObLs+nNWG/aO+2kmuSOmrnnxtgt/lmuKoSOsFm/xu8Hvq+wFSWMYuvfL84fXxf4KDgFn/WG5dU9qyoKS9NbJb8qkFoPvlinw4SN+rKJr+VVz7pt3kp2534Ly2NLIXSTm8iusJHGsrQeUjDEOCej0cXdNU9brVwOWNYbT8doafQwOKYz8CSva+G2HPE8DYIdh0gCe1ENcemqpZWPGFNKPX4kxIzZ9s/b3xC/h3ZbFnLnrcMxV6WsGl93SP7NfroL+ZLDwS4DOZDEVJRv+3Ck62ey7L0z8PpPe5pzLU/hJHmV+YhiHahETvEY5v0YSPVc+31uHc3hZektmBsOAQWvBP9DASlPBz6JjLYkrSZ8b01xj/KUP2T8tqzGH8n9mT+e89TBGbr+VM2Qyn0P11tlNyPCsorBwSwD/EXJOJK/0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bzhOVVZuTHZQSWVsbkQrOHpuUlZES2hLbS9uZG5tdlJySnBUMGc3QnJOcUNL?=
 =?utf-8?B?YWxUMENPZE55U1RaOE8wVFJwaGFzaFNqZ0dWNXFKc2FIeFh0TFJMM2NMSkNk?=
 =?utf-8?B?MTBsWmtzRkxSb3A2aU1UZjhQeEJsWHlrNm5FSGpLK0VEMnphRXNsT1BORlNa?=
 =?utf-8?B?QXMwRno4UWNHOHdrMFV4Q1NoTHVZczk3QTZsM2FCY3g5dGlDWitCM0hPeVN6?=
 =?utf-8?B?YVVFbDA3cVo2SUR3NUZ2dVhTeTNUNFF5MUs1TzF4eFJWSXR2aXorR1JFbVNj?=
 =?utf-8?B?ZVd4ZzlWMGdZOG95QzlhKzFyMmFTcXFpZmowN25zTTd2ZG13Ukg5SmZOaXcv?=
 =?utf-8?B?YXNVUjdDSzRDank3UDA5bWhVOTVqWWVqd2VvUUgrTlhRL0JGOExFV01xd3lR?=
 =?utf-8?B?dGtwWVlOcXdodHd1YWw1WFIxSEp1OEJMWGlTdEp0S0xpQlVSdG1LdnNWbHU1?=
 =?utf-8?B?UFp4aXVNQi9RTVRMNy9XSlZRRFNsWmVWdzFWUGxMM3F0eW5FYUNWN3plNnJa?=
 =?utf-8?B?Q214WGFGc0xLSkRlQ1U5S0ZGNS9xblk4QkdJMUt6TDliQXVwb2NzL2lRVUtJ?=
 =?utf-8?B?ZDRoL1hsYmZRUzNCcXl4cmttcE9oSzdGSytBeHBhb1lYS2trY29xQVpVWHBh?=
 =?utf-8?B?cVgwcDJqZitoRDVvMjcrVGxYbGIwUm0zdTBtVW9hUFVEWTQ5YWlPR3kxdXVT?=
 =?utf-8?B?bVYvU3lNMXFoZWdySmpzN1Z6QitLL3hrcW1ndlRBRWdicCttejMvd0VUN0VC?=
 =?utf-8?B?Y1k2MjhzazNCaHVqYWErdHlhUXA5WUNlNWlETzU5c2xNeUYxM0M4WXVzZTdH?=
 =?utf-8?B?cGp3VVdiZWI0d0ZCN0tqSDFjNlBuL2JBbzFTd0hpdlQvenJJdVNpR1Z0VWFO?=
 =?utf-8?B?YmFTT1BEaWZTTEx4by9FR1I5TjRsTjNsY2dZNXYxUVJTc0tUekpUcncySTlB?=
 =?utf-8?B?K1I3YlJTTFBCOC9TYW9XbStyU21kbTkxR0wrV2NCNHY2QUJsU0tKVzJwTVdT?=
 =?utf-8?B?OHlDem9SajJzQ21PRGNiOFlwd2d4cGJ0S1NGVEx1R3dTQnE2S0cra3FpalBN?=
 =?utf-8?B?eFlqcXFNWk45RFdSNS8wa2UvZEl6K0IyZE5Cc3ZwRFkvRVpSUmM2VFYvTWIy?=
 =?utf-8?B?eFNTc1EvUFQ3aW9xMjV2dlJsYzFsUE1YOWhtRDJrc3dhekdHL3hyTDc1bUhK?=
 =?utf-8?B?TE9JMXFwcmszS0NJa0twRTNzcVRLTzhvTGZjK1I0aGlmMkNxQ0QvQU1PK1Rh?=
 =?utf-8?B?dlF4b0NqblNoaG9qenBGZWRpSDlPQkVOcWk4L3d3U0Z1bUZlb2VhSlRteEFt?=
 =?utf-8?B?dUVkV242SXFuQ1RsZ2F5TWhDZ2gydGtNSmhnRUZPL1NQOW16bXg1aDd5YWs4?=
 =?utf-8?B?c21kVWQvZ2dFbjVWdGh4TmdhV0Q3ZkJYWjVuVS8rUm1OSUdlQkJOSkFqa0U2?=
 =?utf-8?B?MWZEZnFVMnJmeUNVd3F2Skg5dFpxcXBLdXl4WmZIckZ1ejMrUlVZREczUzZQ?=
 =?utf-8?B?T1lxZnNvbEhpQnlpaFlxQm5MTXdXSE9pUkR5c1ZrWnkzUnNYTXpaUnBweENM?=
 =?utf-8?B?QlZyVUlpbGp6bHV2NkRZMHpXRWVoL1J0R0xlU1BjZEcyTkdqblVuMUdaWlo5?=
 =?utf-8?B?YlhFT1RsL2xsM21RMDFCcG1zbWY0ZHRPbW1adW1UMXpBakNySCtEU0psWVFw?=
 =?utf-8?B?VmI3KzJicEdocVlobTRtblZ1dHhVOE5EdWt4SXBOUmlDbWMrWUpUWWdqcTJu?=
 =?utf-8?B?blphQWtXNzZoNHptanp1S3ZsejV1YVNpY2tyNUJnRlF3VWFHVnRpeDlRdFlj?=
 =?utf-8?B?QXViR2cxVG5CaVVzWWh5M3AwZ2ZWdGlRWUZaKzFJVnZDVmpzT1pmYkpMbjNt?=
 =?utf-8?B?b1J4dm96bmFvWkhXdm5QL3dOZXBPV3JsYXpSdVoyS1dVMmxZRFJDeCt3eVNj?=
 =?utf-8?B?K0Q2Nk1pSVN0TE9PZ2todDYrT2xNeWpZd3dJejJxd0xydTFRU3QxWjVLVzI0?=
 =?utf-8?B?bDJEK01PT0d2cC9ZU1BzNVlUSUNLSTJ5bDlwMVFCMUdRU3R2M3BEZ2pqQ29H?=
 =?utf-8?B?azQveGgwdi9JREhJSi9FVHpZTytjdXVLVmdNQ0dkbmo2RXlmcFd5ejk2akIr?=
 =?utf-8?B?MHQvTjg1WTZsUEdwQ1A0L0NaWnNVUFBZdHpnekVxV1pYVURhc1N6Q1dLbEVn?=
 =?utf-8?B?YTI2V2FSYWY4RmZ1Zm96TUxCcnZZSnhWNW8wTmRGUGY1Z3NoUnNEaDkzeVVi?=
 =?utf-8?B?Y1pQelBuaGJTUDMydXN4WitLbkhXTk1RaWJ5WktvK0RRTVd1bC9FMWN2dVV5?=
 =?utf-8?B?VzNYYWhBc0tWeis4S3RkN0pMZlFYREMrbkRqb2JERU5xNzhvWm1YQT09?=
X-Exchange-RoutingPolicyChecked: iFclwUMqbMO++sy6N710EzHmJiJLFBa4hyPEgMbr6y+eTXORXMKY/5OY4/xzXBQM5XK++QPcOaiF/YVpjpo5pBczrfCCL9F4sjG8vd0PZFE8+rYo9M2BmlnAOTfYU28bvNLYuHc3841Dyl9tAO1sjzpmD4dyeEo5drncx4misFOhob7TxjZLr7ciLFWLv7hJZpcede6qaNi4YlosBx6EVROhdNMMlwmBxSJXUzL5yhfWxCybqitmR1zxK8axlpGIW6EvOGeuAhBRjbTE0yDXyRNwMKB2aHdmVuZuHlyn1lflDtmET9VLd8RCz1TRSAASr06L8ZJ71e0ZTNxFApUoyg==
X-MS-Exchange-CrossTenant-Network-Message-Id: bb610ff3-ad04-4d7f-e8fc-08de7a169360
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 17:50:51.6906 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h7uNtyCngYok/ysxYZSFVV88mqn/qYtT42aH+pt5+9yP0VRNvtc/Auq8NyNieLsmoB4mON/J8rZXJcn91psslA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF10E309DEE
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

Hi Bilal,

On 04-03-2026 10:13 pm, Kamil Konieczny wrote:
> Hi Mohammed,
> On 2026-03-02 at 15:49:22 +0530, Mohammed Bilal wrote:
>> Remove symlinks before splitting into driver-specific testlists.
>>
>> v2:
>> -Remove symlinks first before renaming (Kamil)
>>
> This is much cleaner for review, before final merge it could be
> squashed into one commit.
>
> LGTM
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>
> Regards,
> Kamil
Patch LGTM

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

>
>> Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>
>> ---
>>   tests/intel-ci/i915.chamelium-only.testlist | 1 -
>>   tests/intel-ci/xe.chamelium-only.testlist   | 1 -
>>   2 files changed, 2 deletions(-)
>>   delete mode 120000 tests/intel-ci/i915.chamelium-only.testlist
>>   delete mode 120000 tests/intel-ci/xe.chamelium-only.testlist
>>
>> diff --git a/tests/intel-ci/i915.chamelium-only.testlist b/tests/intel-ci/i915.chamelium-only.testlist
>> deleted file mode 120000
>> index d7c492973..000000000
>> --- a/tests/intel-ci/i915.chamelium-only.testlist
>> +++ /dev/null
>> @@ -1 +0,0 @@
>> -chamelium-only.testlist
>> \ No newline at end of file
>> diff --git a/tests/intel-ci/xe.chamelium-only.testlist b/tests/intel-ci/xe.chamelium-only.testlist
>> deleted file mode 120000
>> index d7c492973..000000000
>> --- a/tests/intel-ci/xe.chamelium-only.testlist
>> +++ /dev/null
>> @@ -1 +0,0 @@
>> -chamelium-only.testlist
>> \ No newline at end of file
>> -- 
>> 2.48.1
>>
