Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21491D1039D
	for <igt-dev@archiver.kernel.org>; Wed, 26 Nov 2025 10:51:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A783610E133;
	Wed, 26 Nov 2025 10:51:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OgxDn3H5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E3FF10E133
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Nov 2025 10:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764154273; x=1795690273;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=5wJpNb79B1DeODnRDLphexZ1Up3L9cvDE8xEFf148rU=;
 b=OgxDn3H5jqbukGH4bCK/Yv5g+31t/AIin6b0fDsDumO868Vucc4Zvdei
 IcWCDk3wQbYYD9GrM4AasCzrBT2FegIaSUDfTxf8SAk1eeD/wCP3H3E9K
 Fmj6uangk6TafL0TmTEmMcoeTyR66q1eJnYNAHreUtqdW5I7ElgT3YJ75
 JC+Zn+GcmUc/F32JAEn858uQ6VzWTxxRfg1ATuMWBkh+i36V/F1z/USkK
 E3C75Ub7Epn2AsoSxL+jAF4NLQ//skXebl9NtzE3F/ENAdU21r8gRx6Ae
 jv7B2CDFRnKLou9Er0hOAJzZXoZSyZ43ZktBzzq+l7rLHL29QrvGvcI/J Q==;
X-CSE-ConnectionGUID: JG9Zd+5eQOCeOLtK92eubw==
X-CSE-MsgGUID: 9czRzvsyRlO2cPqk2Lsxuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="66072328"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; d="scan'208";a="66072328"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 02:51:12 -0800
X-CSE-ConnectionGUID: MM1feNGhR9CJatkdxFgpLQ==
X-CSE-MsgGUID: cZ3aelY6TQGDsZ1Z72x/Kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; d="scan'208";a="193332982"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 02:51:12 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 26 Nov 2025 02:51:11 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 26 Nov 2025 02:51:11 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.31) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 26 Nov 2025 02:51:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZcHTHV9ctkZar4ZYc7WpzwzkNbOwBCbr52TK9Ej0egFe8Gw9fE+xHxE872elUNZuXuEDdjwCtry9eQ7U+5rDru7pKI2thKvOMAeKqCszqWIV+2TrK1YfsWtqbvke6GZ/61CiO/g9miUOoncWTurDdtb2jWH0/KJQN/D1+yKwtJyczi1uBrUt1hMd7y8MITb+IODb8xDd2L6cFde3tDgMeDB1yum2mArJuOdA15Aqc1FvhxsWosj000u8AN8B42sQqESacCuwE6QQMtTXFulHXpQ43qK9Q+ub8lcsMm5qwbM2/lREbIsmLxHjy69UVFilVibbEimwo3i/+6FoC41vrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zE4rTCAP2UPkHKhJY6MeeYDoC4a4FeTEPdP7Vl+l668=;
 b=bm6wpev83OgawlAvCvifl2NSfT4CViXXpfhyvoo7L1pVY8UAhPDGC3lKEUjQUEXMeuXMgKG2jJodBKIPcXF122eyr0SZx+NulzGmIh6/9ljTiFvKprSiJz/vpQWetngp+K2vCR2xKqHRC/8B8DSl5xMKJVAKolDBW0ygAn2pFvmb8ZHALUoPe75v5JJNlJNNChHhW6S1MiQTA6cVV2e+XuJ73GehH4hsEo6qCyJPtDTxdWbtJ8LqwlCYp3jGQ9a2hdmGYYf6PRbYabC+cE9wnjH4IGsjDg7XKHBPhqJr134fLDcKFAl99Z3uYXCcMIkxJR+PuSdu/w5lcHHo7R5sgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7151.namprd11.prod.outlook.com (2603:10b6:303:220::5)
 by BL3PR11MB6531.namprd11.prod.outlook.com (2603:10b6:208:38e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Wed, 26 Nov
 2025 10:51:03 +0000
Received: from MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::3e94:e15c:782b:bb92]) by MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::3e94:e15c:782b:bb92%5]) with mapi id 15.20.9366.009; Wed, 26 Nov 2025
 10:51:03 +0000
Message-ID: <a35681a8-4467-462c-ad14-0a7001c28c18@intel.com>
Date: Wed, 26 Nov 2025 16:20:58 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v8 04/10] tests/intel/xe_multi_gpusvm: Add SVM
 multi-GPU atomic operations
To: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Gurram,
 Pravalika" <pravalika.gurram@intel.com>
References: <20251121162537.77551-1-nishit.sharma@intel.com>
 <20251121162537.77551-5-nishit.sharma@intel.com>
 <BL1PR11MB5525A52E3B7659CFCFBE017484D1A@BL1PR11MB5525.namprd11.prod.outlook.com>
 <MW4PR11MB7151C095FCA48709BFA935D8E4D1A@MW4PR11MB7151.namprd11.prod.outlook.com>
 <BL1PR11MB55259FAE7835DF03732BA45184D1A@BL1PR11MB5525.namprd11.prod.outlook.com>
 <7536f57ca621bc2f020c956f536f6f15dbc576e0.camel@intel.com>
Content-Language: en-US
From: "Sharma, Nishit" <nishit.sharma@intel.com>
In-Reply-To: <7536f57ca621bc2f020c956f536f6f15dbc576e0.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0257.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1f1::12) To MW4PR11MB7151.namprd11.prod.outlook.com
 (2603:10b6:303:220::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7151:EE_|BL3PR11MB6531:EE_
X-MS-Office365-Filtering-Correlation-Id: 2376a5ab-3dc8-48f0-89ee-08de2cd9b1dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MXNEbmJwdDBBaUxIa0N3Vi93d096ZnpUTGxuQ3ZHYkcxZnkzanFPV2FqbTJY?=
 =?utf-8?B?K3I1aGJoNyttaFBzK1JuOUxQYmFYNUwvNzVDZUdLbExsM0xoM0ZhVVRBVWtF?=
 =?utf-8?B?blViWS9mcy9VRFh1ajhveWFLS2xLd3JiNE4yMzdqdHl3RndwOTRsME9KbmxC?=
 =?utf-8?B?M1ZkenJmNDNtZGV0K0owNEtRL2hDQkNDNXZld3FINy9HeFRRaS96dUVYd3k3?=
 =?utf-8?B?bVVJTVllZG03cFdwNUE4UldVaURaU1F1RzdJU016VisvZGhlaWV5TzF3dTE3?=
 =?utf-8?B?ZTNFZnBwb04xRVUzUFpPZThvNXBNQVBIMjRCaTBxa0lxWVFhalN0SGtYVTBW?=
 =?utf-8?B?b05sWk42ckNOMzU2d3REbm9xSWpkNE5KMjF1WmNHd3Fodmw0U2VOMmZaR1pp?=
 =?utf-8?B?UTEyQXlZSXAzVmpyTFZIUFRqR0V1dHZJZC80TlMrSjZ5b25OWmk4VTY5cHBm?=
 =?utf-8?B?QlRqcklTUjFvVkdJNFdEbnRPaVdTaU9LcVNuV2liTXJ3dW9iOUpiS1pybG1w?=
 =?utf-8?B?ZGQ3b1NnN2hYMVlwY0JRdjBwTkpuVksxRmI5TXdqbVJVUzlyN2diUFlSQXpu?=
 =?utf-8?B?UGpKR2FDLzIvSlZUSmlERUxHVktDZzRiUi9oTWhhQVY3cHQrQ2kxbHhqSjBo?=
 =?utf-8?B?emJJZ0RJaDAzYWFiVWRXRTFLbDAzOGRzOFhQTjNuRmUzTHNXSHBKS3QrNGZ1?=
 =?utf-8?B?QzdxWHM2eVd5OU00NWp3cC9hd1NsSGZEM0xNV3MxdE5jMnpIMVJVQzZydjVj?=
 =?utf-8?B?UmN6NElZQVRxbXdZczE0YlhpQjlqMVpEZEM1dkpQTXYySXJtY2htVEpDeEFW?=
 =?utf-8?B?UUtUeDVsM3MzUmFEbDI0Q1dEWDEwd1dpalRxQi9Rb3lndzgyVkl0R3NtZldU?=
 =?utf-8?B?REcxc0lOQVpiUmNXZFVjdFBvSG9XaSsvZDNBcXlaNEtteEhqSDlGa0hLUmlU?=
 =?utf-8?B?NmV2MzVPMitJN1N5OWJwU1J6VVVJNzNJbXcySzBBa1ZmR0hpSHlzblpWWlFK?=
 =?utf-8?B?SjhaMmFjd3YwandQSDNrMkVRY1NhRmxFMWZhb2MyeWF4cFBPNC9rRG1sUHo2?=
 =?utf-8?B?RHlnY0FHcUM1UnRGcER1aHR0ZGJObHU2bnR4azl4TFg2b2cxdm5LMkEvbng1?=
 =?utf-8?B?UUdMVFp6SkprRmJMdTMvVFZ5ZHozREw4aVA1UTVsNzZMeVdMMXMzeldEeTRT?=
 =?utf-8?B?bXl6cHY2aHZYQVJFVTRqMnA5dHJGUnk4em9Jd2JyY21HR0FjQ2dPbVZ0cWN0?=
 =?utf-8?B?cmZ1ZVVoK1Jqb280ZHE1YUNvcVZuakVZdkdNRDFXWjgybnhkOVdWaFN0WFNJ?=
 =?utf-8?B?bmhJT2VweU5BRU5FUUNsVEtYYnlGUVRLb2NHcmg0bFptTkRpdTBHb2x6Z2dQ?=
 =?utf-8?B?cnFua1NrWExIYUFMV0hJQTR2NlFvQzI5ejAvRWZxUXZITjErTzZpbmlLNzEv?=
 =?utf-8?B?N0IzTTJWVkwrZ1Bnd1YzTnV4TW1aOUx3bHBBanRQUG0vOTdZaGlCZDVITW1D?=
 =?utf-8?B?bE44NEcrMGVFc1JpN2pDZ3dqRkdudzNKanRHUWxnZVVSeTZZLzdDWjRMMHdx?=
 =?utf-8?B?U2NVOTBGak1tL214SHovdUg5OFhYbFIwQnN3MkxFU0QxWHN4RTYxSnFPZ0lY?=
 =?utf-8?B?azR2bTc2dDM0UHVER1diSlBUeEVQd3Q3ci84bE1NanJkeVZVanZ0OXBMNmdi?=
 =?utf-8?B?dDdEY2hldTNMWDlYRlBjcjZna1VEdVNBcEVMdTBGTTV6bXRXbXI3WjJkM1FE?=
 =?utf-8?B?bFV6Wm9pN3Y3ekJMM0FNc2pIL2FJWkl0cFZuZ2VhZFl6dnYxaTF2MzRtK09n?=
 =?utf-8?B?Y05LSno3Y3FKRnNZMXVaN1hDRmtFUTRLZkdhSDZETk1OUFBtMnlQUExoSnk0?=
 =?utf-8?B?NDJGU0VrL1BaUmNHVzA2OU1PSDBqeHEwMHhnU0JBUEYxUy9HMlZOdCtPeERW?=
 =?utf-8?Q?UcAhhRVHzpQS2CM69728dhLq3xHBoLR8?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7151.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aDNsMXVXa000ellDY0p0ZW52OHhEaFh0N3VuWGNjWGNhY092dTNqaW9VSitp?=
 =?utf-8?B?VHluK1Jkbldhd3ppejZJZVhJNG13a2hJL3hObWVYMzVWdmpzOEt4bmVLMkdx?=
 =?utf-8?B?UW8zM2RJWmszQTl6eklrODlMaDR0TTB6RzQ4dEh6S0liR2dOZFY3TUhYRUcz?=
 =?utf-8?B?NVZCYUxFU1ZVTkV3clpJWU01NjZQeDAvdHNkaTV4dk40MVNDbzNwSnNYR0Vo?=
 =?utf-8?B?MVMrdGxXVW51bk1oMW1lajlGMXFUZTFHNzFEOHRMeERBalhzeXZlZ3pZMm0x?=
 =?utf-8?B?d20wMC9DNm16anVQa1BpWTlUUWg3OEVLUzdnNmQ0OXFQVExaRnZwYjRxL28z?=
 =?utf-8?B?ajNYamVKOHF5MDZ3OUxrRlEwVnlvK1kwTVBnYmMwaUlLWTBNaytGR3hxRzVE?=
 =?utf-8?B?eWdCUjg4dkVHSGF5aStHekxscFo1bU1oTDZlVFZuZy9FRHlXM3NXekMxVFBF?=
 =?utf-8?B?LzdMNUJwV2dZYXdLYVVKOFNrdUk4RW9XTVV1R1pNTDQ4M3ZrUmZNaC9BdDB2?=
 =?utf-8?B?bi9DTzVqcTAyd0RkTml5dGxPSVpGeWpndlJWZUthS0VWT3hxYU14S1VkYXVK?=
 =?utf-8?B?UVVKWjlQNTZ5aHZhQllweWJnblNuV2VpZ2xTWkNqdXpLZEk4OFo1eXlCaXB1?=
 =?utf-8?B?YnhNbElCY1hNZWZmUFpBSVFSYU94cGhlQ2kxY3NReCtRUkJod1JiSS9mNkhJ?=
 =?utf-8?B?aEVFU1hBQ3FiMmRoaDBPZ2JuNk8veFNLWXpOZWsxN1JQVnQ4V1dyUjVpajhL?=
 =?utf-8?B?cFhaOXgvQm1ScDRLYThmbUxYMjViWlArWHZDWE04YmVMS0FqdU9MSTRXNmlY?=
 =?utf-8?B?aWx1SEphZEhKbEthWDIweXk4cDFRaUNINmhwc3FvTFQ1MVQvNWcydkd2TGtr?=
 =?utf-8?B?QmJCK3hveHhqdHFzVXZyWlp0Zmp0YmxFM1JCbFN1TzJ4NUxuelhPbktxVnNP?=
 =?utf-8?B?M3p4ZmlBRkg1ODNjdUpYSFJtL041MjZYUHR2MUVVRS9Pbjg4dDlzNU5Qeis5?=
 =?utf-8?B?eHJxbW1GZU1LSGhjcGpIQ1lMSEZzalhQbnJjV21kL1pQTFRlamE4L0hhMlVx?=
 =?utf-8?B?RTZOR2dHQ2NiZ0VQL1ZQRS8rYjZ2aUVPN2VnQ0JuRUJsTk9mM01YS1h6V0FN?=
 =?utf-8?B?dmlQeVE1Tmh2V1BUWWN0UHMvdUNHZkdCcllMTDBta0plUUFQZWdQdG0yMXZ0?=
 =?utf-8?B?WHdIRlRsWU02THFEakUrbjdnSGtqRXpxMVRPdTZXOVEwb0p0UFBBVFNjYmFH?=
 =?utf-8?B?anFaL0drOXRYdmdKZGxrNzROSTJLOGIxSERXSGc1cGpubXRkTW4vSTcyS25m?=
 =?utf-8?B?MHpRQ2pXV2dValRsbmd1YmdxZ25jZVE2a1dNVVBzME56Z05YdDdlbXBzQ3Nl?=
 =?utf-8?B?M3BmOFd4QVJpanIyblNHa0ZsSUhHZ2M1VlhpRnQ4Qnd1SENlV0U2VEZ2dzlt?=
 =?utf-8?B?ajhGSytUZ0RORXZMZFM5QWNZeE4raEF6S3B4cHJXZ3BJdm1nbEJQZGhmbEcw?=
 =?utf-8?B?VHovbVAxTTR2bnJCRjBRVVpuY3Q4ZWI5cCtmTXdpM3B4eTh3TkFnSFhVMXJi?=
 =?utf-8?B?NDV3STlETHF6UjdxTE1DZmNMd0Qzb3RLSEdIeDF1eWwyMGR2blJDNWxBd2g4?=
 =?utf-8?B?dDlkTWR3OEJzajFITUp2NFFDY05HOHd0K2dCTFRWSE10aDdZeE5Cem40Vkxi?=
 =?utf-8?B?R1BjOWpiMHJBY0tVcVM2OG91Qzg0NEVTNVJZMjl0eTY1cVJjZ0p3TUZ0d1Ri?=
 =?utf-8?B?eWdTSjdOU2YxaVdmcmFFTEhKaWtKa1IyNnlNbU0xRUlsQk10eFBOUExiaEhk?=
 =?utf-8?B?SHRqNkVtaktMb1VSRU9tT2FXVE1obnV6YXdpdzBLQXNsWUZZWVVweHF5eFF1?=
 =?utf-8?B?dmw0WGVWQnVHYU9KeUExMkhEcW16UThBRHJhV1VOY1B6dmlsU1BDSGtFT0hp?=
 =?utf-8?B?UENwY2dlajBrQUZqWlhRSis4NnJiTnFyL1Q3SHdsa0dtYVBLbjIrRGJIVEVp?=
 =?utf-8?B?WjFsYlNVVXR5ekFEcUdxOVYxK3BwcGlEWExKdmFDODlPVXhSZXRmMkNWb3Yw?=
 =?utf-8?B?U3dzeDhhUnZpQkpKM05ONExNK0x0ajd4cEduZWlFMlpCZXc3OHRIVTN2VnJn?=
 =?utf-8?B?NWYxNTF4WjhCeERHcU1NNXlacWluU0JoQTd0YTc3bGowVWRIbDYrY0hSektI?=
 =?utf-8?B?RlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2376a5ab-3dc8-48f0-89ee-08de2cd9b1dc
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7151.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 10:51:03.7685 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: alnSaSBk7LliRY1kAQQG75YvZ585b45MItzzFokQ2bIPa34I1ec84mvWVTweNZG1voukrZe1qceWd0PEEJr17A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6531
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

Hi Thomas, Pravallika,

I think let's not skip the test but add like GPU1 done atomic operation  
(Already doing), Read from GPU2 and perform Atomic operation and read 
from GPU1 as initially Pravlikka suggested.

Any inputs,


Nishit

On 11/26/2025 4:15 PM, Hellstrom, Thomas wrote:
> Hi, Nishit, Pravalika
>
>
> On Tue, 2025-11-25 at 14:47 +0000, Gurram, Pravalika wrote:
>>
>>> -----Original Message-----
>>> From: Sharma, Nishit <nishit.sharma@intel.com>
>>> Sent: Tuesday, November 25, 2025 8:07 PM
>>> To: Gurram, Pravalika <pravalika.gurram@intel.com>; igt-
>>> dev@lists.freedesktop.org; Hellstrom, Thomas
>>> <thomas.hellstrom@intel.com>
>>> Subject: RE: [PATCH i-g-t v8 04/10] tests/intel/xe_multi_gpusvm:
>>> Add SVM
>>> multi-GPU atomic operations
>>>
>>> Can be done but we are checking atomic operation in multi-GPU
>>> scenarios,
>>> so idea was whether all GPUs performing atomic operation correctly
>>> and data
>>> can be read from CPU. GPU1 write - GPU2 read implemented in other
>>> subtests.
>>>
>>> Nishit
>>>
>> Okay, if that is the case, it will be good if we mention " testing
>> GPU -> CPU coherency."
> I think if the test doesn't have any GPU <-> GPU interaction we could
> essentially rely on the other atomic test which exercises simultaneous
> atomic operation. This test would essentially otherwise be two
> standalone single-GPU tests and should be covered in other igts, so I
> suggest skipping this test except for the atomic batch buffer setup
> that could be added to patch 8? Thoughts?
>
> Thomas
>
>
>
>> --Pravalika
>>> -----Original Message-----
>>> From: Gurram, Pravalika <pravalika.gurram@intel.com>
>>> Sent: Tuesday, November 25, 2025 8:01 PM
>>> To: Sharma, Nishit <nishit.sharma@intel.com>; igt-
>>> dev@lists.freedesktop.org; Sharma, Nishit
>>> <nishit.sharma@intel.com>;
>>> Hellstrom, Thomas <thomas.hellstrom@intel.com>
>>> Subject: RE: [PATCH i-g-t v8 04/10] tests/intel/xe_multi_gpusvm:
>>> Add SVM
>>> multi-GPU atomic operations
>>>
>>>
>>>
>>>> -----Original Message-----
>>>> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf
>>>> Of
>>>> nishit.sharma@intel.com
>>>> Sent: Friday, November 21, 2025 9:56 PM
>>>> To: igt-dev@lists.freedesktop.org; Sharma, Nishit
>>>> <nishit.sharma@intel.com>; Hellstrom, Thomas
>>>> <thomas.hellstrom@intel.com>
>>>> Subject: [PATCH i-g-t v8 04/10] tests/intel/xe_multi_gpusvm: Add
>>>> SVM
>>>> multi-GPU atomic operations
>>>>
>>>> From: Nishit Sharma <nishit.sharma@intel.com>
>>>>
>>>> This test performs atomic increment operation on a shared SVM
>>>> buffer
>>>> from both GPUs and the CPU in a multi-GPU environment. It uses
>>>> madvise
>>>> and prefetch to control buffer placement and verifies correctness
>>>> and
>>>> ordering of atomic updates across agents.
>>>>
>>>> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
>>>> ---
>>>>   tests/intel/xe_multi_gpusvm.c | 162
>>>> +++++++++++++++++++++++++++++++++-
>>>>   1 file changed, 160 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/tests/intel/xe_multi_gpusvm.c
>>>> b/tests/intel/xe_multi_gpusvm.c index 471be6449..4e817edf9 100644
>>>> --- a/tests/intel/xe_multi_gpusvm.c
>>>> +++ b/tests/intel/xe_multi_gpusvm.c
>>>> @@ -33,6 +33,17 @@
>>>>    * Description:
>>>>    *	Test cross-GPU memory access with prefetch in multi-GPU
>>>> SVM
>>>> configuration
>>>>    *
>>>> + * SUBTEST: mgpu-atomic-op-basic
>>>> + * Description:
>>>> + *	Test basic cross-GPU atomic increment operations in
>>>> multi-GPU SVM
>>>> configuration
>>>> + *	operation on GPU1 and then atomic operation on GPU2
>>>> using same
>>>> + *	address
>>>> + *
>>>> + * SUBTEST: mgpu-atomic-op-prefetch
>>>> + * Description:
>>>> + *	Tests cross-GPU atomic increment operations with
>>>> explicit memory
>>>> prefetch
>>>> + *	to validate SVM atomic operations in multi-GPU config
>>>> + *
>>>>    */
>>>>
>>>>   #define MAX_XE_REGIONS	8
>>>> @@ -42,10 +53,12 @@
>>>>   #define BIND_SYNC_VAL 0x686868
>>>>   #define EXEC_SYNC_VAL 0x676767
>>>>   #define COPY_SIZE SZ_64M
>>>> +#define	ATOMIC_OP_VAL	56
>>>>
>>>>   #define MULTIGPU_BASIC			BIT(0)
>>>>   #define MULTIGPU_PREFETCH		BIT(1)
>>>>   #define MULTIGPU_XGPU_ACCESS		BIT(2)
>>>> +#define MULTIGPU_ATOMIC_OP		BIT(3)
>>>>
>>>>   struct xe_svm_gpu_info {
>>>>   	bool supports_faults;
>>>> @@ -60,6 +73,16 @@ typedef void (*gpu_pair_fn)(struct
>>> xe_svm_gpu_info
>>>> *src,
>>>>   			    struct drm_xe_engine_class_instance
>>>> *eci,
>>>>   			    unsigned int flags);
>>>>
>>>> +struct test_exec_data {
>>>> +	uint32_t batch[32];
>>>> +	uint64_t pad;
>>>> +	uint64_t vm_sync;
>>>> +	uint64_t exec_sync;
>>>> +	uint32_t data;
>>>> +	uint32_t expected_data;
>>>> +	uint64_t batch_addr;
>>>> +};
>>>> +
>>>>   static void for_each_gpu_pair(int num_gpus,
>>>>   			      struct xe_svm_gpu_info *gpus,
>>>>   			      struct
>>>> drm_xe_engine_class_instance *eci, @@ -
>>>> 71,7 +94,10 @@ static void gpu_mem_access_wrapper(struct
>>>> xe_svm_gpu_info *src,
>>>>   				   struct
>>>> drm_xe_engine_class_instance *eci,
>>>>   				   unsigned int flags);
>>>>
>>>> -static void open_pagemaps(int fd, struct xe_svm_gpu_info *info);
>>>> +static void gpu_atomic_inc_wrapper(struct xe_svm_gpu_info *src,
>>>> +				   struct xe_svm_gpu_info *dst,
>>>> +				   struct
>>>> drm_xe_engine_class_instance *eci,
>>>> +				   unsigned int flags);
>>>>
>>>>   static void
>>>>   create_vm_and_queue(struct xe_svm_gpu_info *gpu, struct
>>>> drm_xe_engine_class_instance *eci, @@ -162,6 +188,35 @@ static
>>>> void
>>>> for_each_gpu_pair(int num_gpus, struct xe_svm_gpu_info *gpus,
>>>>   	}
>>>>   }
>>>>
>>>> +static void open_pagemaps(int fd, struct xe_svm_gpu_info *info);
>>>> +
>>>> +static void
>>>> +atomic_batch_init(int fd, uint32_t vm, uint64_t src_addr,
>>>> +		  uint32_t *bo, uint64_t *addr)
>>>> +{
>>>> +	uint32_t batch_bo_size = BATCH_SIZE(fd);
>>>> +	uint32_t batch_bo;
>>>> +	uint64_t batch_addr;
>>>> +	void *batch;
>>>> +	uint32_t *cmd;
>>>> +	int i = 0;
>>>> +
>>>> +	batch_bo = xe_bo_create(fd, vm, batch_bo_size,
>>>> vram_if_possible(fd, 0), 0);
>>>> +	batch = xe_bo_map(fd, batch_bo, batch_bo_size);
>>>> +	cmd = (uint32_t *)batch;
>>>> +
>>>> +	cmd[i++] = MI_ATOMIC | MI_ATOMIC_INC;
>>>> +	cmd[i++] = src_addr;
>>>> +	cmd[i++] = src_addr >> 32;
>>>> +	cmd[i++] = MI_BATCH_BUFFER_END;
>>>> +
>>>> +	batch_addr = to_user_pointer(batch);
>>>> +	/* Punch a gap in the SVM map where we map the batch_bo
>>>> */
>>>> +	xe_vm_bind_lr_sync(fd, vm, batch_bo, 0, batch_addr,
>>>> batch_bo_size, 0);
>>>> +	*bo = batch_bo;
>>>> +	*addr = batch_addr;
>>>> +}
>>>> +
>>>>   static void batch_init(int fd, uint32_t vm, uint64_t src_addr,
>>>>   		       uint64_t dst_addr, uint64_t copy_size,
>>>>   		       uint32_t *bo, uint64_t *addr) @@ -318,6
>>>> +373,93 @@
>>>> copy_src_dst(struct xe_svm_gpu_info *gpu1,
>>>>   	cleanup_vm_and_queue(gpu1, vm[0], exec_queue[0]);  }
>>>>
>>>> +static void
>>>> +atomic_inc_op(struct xe_svm_gpu_info *gpu1,
>>>> +	      struct xe_svm_gpu_info *gpu2,
>>>> +	      struct drm_xe_engine_class_instance *eci,
>>>> +	      unsigned int flags)
>>>> +{
>>>> +	uint64_t addr;
>>>> +	uint32_t vm[2];
>>>> +	uint32_t exec_queue[2];
>>>> +	uint32_t batch_bo[2];
>>>> +	struct test_exec_data *data;
>>>> +	uint64_t batch_addr[2];
>>>> +	struct drm_xe_sync sync = {};
>>>> +	volatile uint64_t *sync_addr;
>>>> +
>>>> +	/* Skip if either GPU doesn't support faults */
>>>> +	if (mgpu_check_fault_support(gpu1, gpu2))
>>>> +		return;
>>>> +
>>>> +	create_vm_and_queue(gpu1, eci, &vm[0], &exec_queue[0]);
>>>> +	create_vm_and_queue(gpu2, eci, &vm[1], &exec_queue[1]);
>>>> +
>>>> +	data = aligned_alloc(SZ_2M, SZ_4K);
>>>> +	igt_assert(data);
>>>> +	data[0].vm_sync = 0;
>>>> +	addr = to_user_pointer(data);
>>>> +
>>>> +	*(uint64_t *)addr = ATOMIC_OP_VAL - 1;
>>>> +
>>>> +	atomic_batch_init(gpu1->fd, vm[0], addr, &batch_bo[0],
>>>> +&batch_addr[0]);
>>>> +
>>>> +	xe_multigpu_madvise(gpu1->fd, vm[0], addr, SZ_4K, 0,
>>>> +			    DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
>>>> +			    gpu1->fd, 0, gpu1->vram_regions[0],
>>>> exec_queue[0]);
>>>> +
>>>> +	setup_sync(&sync, &sync_addr, BIND_SYNC_VAL);
>>>> +	xe_multigpu_prefetch(gpu1->fd, vm[0], addr, SZ_4K,
>>>> &sync,
>>>> +			     sync_addr, exec_queue[0], flags);
>>>> +	free((void *)sync_addr);
>>>> +
>>>> +	/* Executing ATOMIC_INC on GPU1 */
>>>> +	sync_addr = (void *)((char *)batch_addr[0] + SZ_4K);
>>>> +	sync.addr = to_user_pointer((uint64_t *)sync_addr);
>>>> +	sync.timeline_value = EXEC_SYNC_VAL;
>>>> +	*sync_addr = 0;
>>>> +
>>>> +	xe_exec_sync(gpu1->fd, exec_queue[0], batch_addr[0],
>>>> &sync, 1);
>>>> +	if (*sync_addr != EXEC_SYNC_VAL)
>>>> +		xe_wait_ufence(gpu1->fd, (uint64_t *)sync_addr,
>>>> EXEC_SYNC_VAL, exec_queue[0],
>>>> +			       NSEC_PER_SEC * 10);
>>>> +
>>>> +	igt_assert_eq(*(uint64_t *)addr, ATOMIC_OP_VAL);
>>> This test only doing
>>> GPU0 writes -> CPU reads
>>> GPU1 writes -> CPU reads
>>> GPUs NEVER communicate with each other
>>> Only tests GPU -> CPU coherency
>>> Missing GPU <-> GPU coherency
>>>
>>> am thinking if we do below operation it will be good.
>>> GPU0 writes -> GPU1 READS what GPU0 wrote -> (GPU-to-GPU)
>>> GPU1 writes -> GPU0 READS what GPU1 wrote -> (GPU-to-GPU) This test
>>> GPU-to-GPU shared memory
>>>
>>> -Pravalika
>>> @Hellstrom, Thomas is my understanding is correct?
>>>> +
>>>> +	atomic_batch_init(gpu2->fd, vm[1], addr, &batch_bo[1],
>>>> +&batch_addr[1]);
>>>> +
>>>> +	xe_multigpu_madvise(gpu2->fd, vm[1], addr, SZ_4K, 0,
>>>> +			    DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
>>>> +			    gpu2->fd, 0, gpu2->vram_regions[0],
>>>> exec_queue[0]);
>>>> +
>>>> +	setup_sync(&sync, &sync_addr, BIND_SYNC_VAL);
>>>> +	xe_multigpu_prefetch(gpu2->fd, vm[1], addr, SZ_4K,
>>>> &sync,
>>>> +			     sync_addr, exec_queue[1], flags);
>>>> +	free((void *)sync_addr);
>>>> +
>>>> +	/* Execute ATOMIC_INC on GPU2 */
>>>> +	sync_addr = (void *)((char *)batch_addr[1] + SZ_4K);
>>>> +	sync.addr = to_user_pointer((uint64_t *)sync_addr);
>>>> +	sync.timeline_value = EXEC_SYNC_VAL;
>>>> +	*sync_addr = 0;
>>>> +
>>>> +	xe_exec_sync(gpu2->fd, exec_queue[1], batch_addr[1],
>>>> &sync, 1);
>>>> +	if (*sync_addr != EXEC_SYNC_VAL)
>>>> +		xe_wait_ufence(gpu2->fd, (uint64_t *)sync_addr,
>>>> EXEC_SYNC_VAL, exec_queue[1],
>>>> +			       NSEC_PER_SEC * 10);
>>>> +
>>>> +	igt_assert_eq(*(uint64_t *)addr, ATOMIC_OP_VAL + 1);
>>>> +
>>>> +	munmap((void *)batch_addr[0], BATCH_SIZE(gpu1->fd));
>>>> +	munmap((void *)batch_addr[1], BATCH_SIZE(gpu2->fd));
>>>> +	batch_fini(gpu1->fd, vm[0], batch_bo[0], batch_addr[0]);
>>>> +	batch_fini(gpu2->fd, vm[1], batch_bo[1], batch_addr[1]);
>>>> +	free(data);
>>>> +
>>>> +	cleanup_vm_and_queue(gpu1, vm[0], exec_queue[0]);
>>>> +	cleanup_vm_and_queue(gpu2, vm[1], exec_queue[1]); }
>>>> +
>>>>   static void
>>>>   gpu_mem_access_wrapper(struct xe_svm_gpu_info *src,
>>>>   		       struct xe_svm_gpu_info *dst, @@ -330,6
>>>> +472,18 @@
>>>> gpu_mem_access_wrapper(struct xe_svm_gpu_info *src,
>>>>   	copy_src_dst(src, dst, eci, flags);
>>>>   }
>>>>
>>>> +static void
>>>> +gpu_atomic_inc_wrapper(struct xe_svm_gpu_info *src,
>>>> +		       struct xe_svm_gpu_info *dst,
>>>> +		       struct drm_xe_engine_class_instance *eci,
>>>> +		       unsigned int flags)
>>>> +{
>>>> +	igt_assert(src);
>>>> +	igt_assert(dst);
>>>> +
>>>> +	atomic_inc_op(src, dst, eci, flags); }
>>>> +
>>>>   static void
>>>>   test_mgpu_exec(int gpu_cnt, struct xe_svm_gpu_info *gpus,
>>>>   	       struct drm_xe_engine_class_instance *eci, @@ -
>>>> 337,6 +491,8
>>> @@
>>>> test_mgpu_exec(int gpu_cnt, struct xe_svm_gpu_info *gpus,  {
>>>>   	if (flags & MULTIGPU_XGPU_ACCESS)
>>>>   		for_each_gpu_pair(gpu_cnt, gpus, eci,
>>> gpu_mem_access_wrapper,
>>>> flags);
>>>> +	if (flags & MULTIGPU_ATOMIC_OP)
>>>> +		for_each_gpu_pair(gpu_cnt, gpus, eci,
>>>> gpu_atomic_inc_wrapper, flags);
>>>>   }
>>>>
>>>>   struct section {
>>>> @@ -357,6 +513,8 @@ igt_main
>>>>   	const struct section msections[] = {
>>>>   		{ "xgpu-access-basic", MULTIGPU_BASIC |
>>> MULTIGPU_XGPU_ACCESS },
>>>>   		{ "xgpu-access-prefetch", MULTIGPU_PREFETCH |
>>> MULTIGPU_XGPU_ACCESS
>>>> },
>>>> +		{ "atomic-op-basic", MULTIGPU_BASIC |
>>>> MULTIGPU_ATOMIC_OP },
>>>> +		{ "atomic-op-prefetch", MULTIGPU_PREFETCH |
>>>> MULTIGPU_ATOMIC_OP },
>>>>   		{ NULL },
>>>>   	};
>>>>
>>>> @@ -380,7 +538,7 @@ igt_main
>>>>   		}
>>>>   	}
>>>>
>>>> -	igt_describe("gpu-gpu write-read");
>>>> +	igt_describe("multigpu svm operations");
>>>>   	for (const struct section *s = msections; s->name; s++)
>>>> {
>>>>   		igt_subtest_f("mgpu-%s", s->name)
>>>>   			test_mgpu_exec(gpu_cnt, gpus, &eci, s-
>>>>> flags);
>>>> --
>>>> 2.48.1
