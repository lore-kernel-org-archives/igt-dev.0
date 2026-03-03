Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FB26EC1430
	for <igt-dev@archiver.kernel.org>; Tue,  3 Mar 2026 11:34:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 190DC10E7A0;
	Tue,  3 Mar 2026 11:34:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HbOjkrbI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BEE310E7A0
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Mar 2026 11:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772537662; x=1804073662;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=J5oT4dGOdHfKGH7ZAGEj4CfGuesZCen/sHklQ2VlllI=;
 b=HbOjkrbIyHgbvPW/PnMrhZadeS7WSdhsG8JttaGoyruDSLiHi0xSo12Q
 JS/0ozwVCWO0ThMPNFrSM7blRPjqNiE4dFFE1fIp2pFpypXOcRzxPC9qk
 xja5c+NqDMITbS6fLQPk4OMptNdFzhx7Q+cTjGHTQTy7NmrYIjU2LdyEp
 MoX1xw3Tcvm2HxPNx7FHBRRhchkKgsDJ8ihepcFW+JvX0ZMXU0qeqr76U
 PKoeuCKcnxhZ7XjUOKL0zZecmbKgwVweAwqmwFzUe2P77mYUWuzLWcRVn
 ueHJXWIZCylOga6PV3AxnD98CC7cfqQPbOdNpbfBU1y4mRhZAnZHNcuoh g==;
X-CSE-ConnectionGUID: GkxGgn3oQNK5e16DbopbgQ==
X-CSE-MsgGUID: EPkB85CgSDmLLS7tBI65iQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="73442256"
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; d="scan'208";a="73442256"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 03:34:21 -0800
X-CSE-ConnectionGUID: Uey04GhZQ6uMufQMJDw5sQ==
X-CSE-MsgGUID: a1EKn4isQTeykFczUs8wwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; d="scan'208";a="222632201"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 03:34:21 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 3 Mar 2026 03:34:20 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 3 Mar 2026 03:34:20 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.37) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 3 Mar 2026 03:34:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CPD1xqmH4IqrqD8RthQTZ/iwgnWo9J+t2fyuKGQupQBzPs5hHMNjl6h6HtZ+U9DKOSJ2fuAfIdd1vSQY3dh3evCrcRskGTLzkRe4YEUM/Glc0jzsubDXVFUuTcfjntCUmqUQcq10aQzTfTgJiA/HFPL7pwnrAaUE8i7qhW27a9uOzjDQwE7hIG3r9d5qrTclj3DnqxuNzB2n1IlwvfeWs9MSNt7vxA5Pnvs2Ix/kcKLiqbX7yu83Tc/TReiMgxbr7VSyej+OOSkuLKKuw53BGZlcDVUH2NnsFBhCem+4dz2RSxYsQR4YvZ5AKjB8eVGn2/C1EAS3yGH60RreW+54AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bDkUoQ1RVHEPqOjVc2XRItMsQliaY2Yd38M/qP/KXqE=;
 b=p1ELmokvJZeiOd+pFKpBcB7DTxX/MuiQQyBCOvc4/dNCR1BQbd93zDQCiOOBWIQFMjRGiMxr4VC5Q9nL3r5eByrs359k72i9ohEXHMFfSAt//grRcDwGb893G4cE7RkBTaRkmMFY6ogwyidouxrATPKh3c2evMMFXmQSRbm3If0LNHLmyQSiVlAKqxqRZkXCm/7zObbLX4UNSFR4A5KT7pii3XvjJ7syGSeWJET2F20DD+CtWE6otee9JFywUw57SCQfMCmeecOb2Lc8YImyB5NdKy5/3w3SGuj+7aFagrXfeZMv+LlPbBbHpTINMbZvDQXW3rOHE36676ZnY8f9RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8208.namprd11.prod.outlook.com (2603:10b6:8:165::18)
 by PH0PR11MB4968.namprd11.prod.outlook.com (2603:10b6:510:39::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 11:34:18 +0000
Received: from DS0PR11MB8208.namprd11.prod.outlook.com
 ([fe80::ecb0:7475:84de:ca9c]) by DS0PR11MB8208.namprd11.prod.outlook.com
 ([fe80::ecb0:7475:84de:ca9c%5]) with mapi id 15.20.9654.022; Tue, 3 Mar 2026
 11:34:17 +0000
Message-ID: <6077b20b-cb43-459c-bdc1-02869bf95e14@intel.com>
Date: Tue, 3 Mar 2026 17:04:09 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] lib/intel_pat: Handle platforms without compressed PAT
 index
To: "Gurram, Pravalika" <pravalika.gurram@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Auld, Matthew" <matthew.auld@intel.com>
References: <20260218103608.2015045-2-sanjay.kumar.yadav@intel.com>
 <BL1PR11MB552518C35C193641C8AC3DB9847FA@BL1PR11MB5525.namprd11.prod.outlook.com>
 <cc6fb449-b15d-4f56-b2c2-4ac7f391b7af@intel.com>
 <BL1PR11MB5525641EFD8BDFFE934FAFEA847FA@BL1PR11MB5525.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Yadav, Sanjay Kumar" <sanjay.kumar.yadav@intel.com>
In-Reply-To: <BL1PR11MB5525641EFD8BDFFE934FAFEA847FA@BL1PR11MB5525.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXPR01CA0099.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::17) To DS0PR11MB8208.namprd11.prod.outlook.com
 (2603:10b6:8:165::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8208:EE_|PH0PR11MB4968:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e6a996c-71b9-4eb4-abbc-08de7918cdfe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: gJeHVW6LoFZG/2mWDC0PVK8W7hnmeya5VcWdv2n9YAVPcz4/9gHblHRqMJFngFe7aInNbXso8YCK3dZAnhD83Q9IfSFMcGNlLZPErKUWZoEmuYwQ7iO6ffpcoTUF6q8faxaCpy3obebxLP1uHK+xSpI5Lv9QYvHUZsV2rRJprMIJpZehCV7odFtJiTXlcjOE1MXHp1YLt2hauGVFa4pmmZu9w7Qovxkmf7OvhcyedWsi44jQS5A78YKHy3XSk8U4kj52sVdMc7unwoJs1xSi7id3A4QlsCAXDIm80HXwymlTnyCYyxJipekhOs660z0wc9h27kiGbTi2dyHVjjec26plHvK4unw+DwXNj8hctASovTd742PPD81Ddc8P7Otw8Pt02WvqYmqRfJjo+ai5F/XKnM8qclWheR7lICP6TnB5tasMDV6OzmLWjBs4jEzmCrTAoMTSPMRdr2H9SwDhcAW+OBPoOC7klPvRSQl0r239HVNXA4xk92zFYsYTS7DEBC7alyUy+IxLcPdIt8QKKwIZbqiv8LJfXwGVidTWcFAl9UOaBYF7seTvVvNqUnCgTa4jhG5u8WNJQWFQoarMnI7NkdBK8srJkKh7u1av1a0bS5OQuHuWN9ox2mbnnUQNZhdPa5MySmRY693yzJshJE3LAfEMLfIJKdxqXeam6mdZ39KLuWHKixx7iTlO4zMY+j2JbmkvHl31I0tIr4VFsVajUfMQJrV9jqGIteALiCc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8208.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NWN3NDRBdmIrRG5uYVE2QWlWZ3Q1VGhjck1sdkFINE1BUG41QnYraEdmVjVm?=
 =?utf-8?B?d1JqT1Z5aGpCUXB3YVA2VUxWVU13TU5lSWZpR05VRUlmem01eDRNa04vUXVH?=
 =?utf-8?B?aENPdlJTUEJsa0xCUFpneU9LOXZWSkJkYXlRbmN4SzM2UXcxMzVEdnk4SHJr?=
 =?utf-8?B?emhySnI5YXBjdHBvOGQ2WW9SSUlZNXg2SFVSVDBXZTg1TFVmb3RNYnIwaVly?=
 =?utf-8?B?cmRLNk1qOUl6bWFueWNmMVpUdVBkU2NHZGVZNzFHMjFaSW5CdlpsTlBOazZq?=
 =?utf-8?B?OXRuNlV6V0gxSm1FOFFzTVpqaTBVRjdqeFUzOGh6N3hjQWUyd1RUUDNjZnRZ?=
 =?utf-8?B?SlF0d2R2c0RHbHlGeHp3a0tjdlpRcW9vQStCMTFYd2puTXJxOENGQ1lKRHcz?=
 =?utf-8?B?VzRnL2ZweGcwTXg1UElidTE0N25aQ3FBSjdvTVRLRjJxU050eCtsTFhHeGhm?=
 =?utf-8?B?eHpEbUpuNjR4bDJFZFFCSHV4RGJ1WWlUczVmb2tqMWNjdFAvb3ptMlAxa2xV?=
 =?utf-8?B?L1JNZ0t1NGY1WmtvNEpuMXN5anI0OGtKNXRvVmhnVWRRNWd5WGdWWkVUdldU?=
 =?utf-8?B?TUFWOFhDK3lZZ240cjlZeWhWOFFqdzNiL0tzMk1CTWcvVkd1RlY5RE5nc3lW?=
 =?utf-8?B?aXg2bDJkUnJqRUFBTFYyalpwcGhXS3NFdFRDNTNUWjhsY3Nnd0NyWHI2ZytR?=
 =?utf-8?B?TFdzZ290OFZpTXpldjNHZ1ViYjFoZUVuV0kyN2JxZjZxVDN0ekRjNFVwWUxB?=
 =?utf-8?B?emd1UUc3aEhUTzFDelpxclVhWG1kWnNETnFYTTN2NXpPSW9OVTd4OWhzUmcy?=
 =?utf-8?B?WEFnT1NQaVlqb1VmME1RTER3YjlHOW84bUk1Z0NacGlDQ3p3WCt2UVA5U1g1?=
 =?utf-8?B?cGsrUjlTN3pvWEpPdkl5T1pLMmVSRktPNWFiOG5rNTBhblJWT1F3cVh6TUl3?=
 =?utf-8?B?WmJtWC81OFV3ZVU5Y2pleFhCN2FIcnBqNG9PaVBIVUx3YXc5aEJReTRnTDkw?=
 =?utf-8?B?NW9WcDk2S0w5eTY3eTlHbHpLQjlWS2ZqRHd1Nnk3T1NidW9EaDVIRksvRjFM?=
 =?utf-8?B?dEl4eGlpSzBmZ0F0MEFLTklLUjNma040VnRuS09EWWdxVzJmUitzZGlkc3dr?=
 =?utf-8?B?ZHJaNHZlaEl3SEVQRWNvRkNpaHM4dFZUdTBodG5yUWlkVWI1MEFaUktHcEIw?=
 =?utf-8?B?ckZJTktFZGJxbUVLNGQrZzhaTEdLaHhzVmRpSVhUSG05ajRXVXlJWUsrUkVD?=
 =?utf-8?B?V2pPdlgxU2JYNjdZWm9SQWpxMjBadXVHeGF1U0E5MWRHQXhWQUNDNmsxa2d5?=
 =?utf-8?B?YTNVUkI1U0ppMUlEdXBvU1BQK3YwdDVhWGxaSlkyZVA1aFNZYWExa2xJUU15?=
 =?utf-8?B?bGdIaFVyTnZJOHg4Rk5wYURJbEJxNG9hL0o3ZzhJdG4vYThoL3RYbE5uL3dD?=
 =?utf-8?B?aHVhSXdMcGtrMW9rS01uRlY2RG4zUjd4TlZ4MXZKUnJyOVpEWVBtSkpwSlor?=
 =?utf-8?B?S3h6UTdhNmN5OVc0Lzh2Y1Q4eitVVHBaazA2eU54UjNZWG1mSkNKRElPckVW?=
 =?utf-8?B?RVlDS3pLSTdMd05yVVk3SjdOQzlJZGhXRndyN3lLTG5hTyt0MktWRnBBd2h4?=
 =?utf-8?B?WTRLM1NBREZmdjYrSTNldm5lb1R1eFA0bXBRSk1uV2tKMSt4ZC9wNjBCNnIx?=
 =?utf-8?B?bGhjN1RzSTNvTlgrNnRnaTh2NVZEK2FBZS9DbjBDZFArMC9XNE1wcjZzM2Qr?=
 =?utf-8?B?VXFqNEtrNEVuSk1FNDFHVUZUcHc2cXZqK2ZTek0zY2FrV1lGTEVJd3FUd0JU?=
 =?utf-8?B?ZnZ4WGFTRGxVL3RZdjZWcVp0ekJMSEtGbUJzRCtJUUZVNHJ1V0dDQTBIN2c4?=
 =?utf-8?B?QW1Ba0FINVBZUGdLYS9uVlRIVzl0T2tscVRYenJ4Ry9YUTJ1Z2pHaWlCSm91?=
 =?utf-8?B?elFtc2IrVUpTOSt1RmVWNGlYSmw2b0hjVlpsVENjaW5tdEl0VUJjMXp1N3JE?=
 =?utf-8?B?VVMyaWhJQ0YweHJaMDZOYlNJblBvZ1hzbzNobVFpdElVUE1UbCt6L05zZ2E4?=
 =?utf-8?B?UmRiV0M4UENOM0ZURCt5U2FhNjh4alVEVkwxb2RxbFZNb28yMDRjdUw1K2ZZ?=
 =?utf-8?B?eXh2TXJ4alRoL25FcGM2Rko2VkZmbTI0eFNtV3cyckhBTWdhSm9ueG0ybWlI?=
 =?utf-8?B?NlloWXBCcVNPMXc5OUcyVE5PWTd6RVZwL2dhYXZUb2U0S2R2c1Mwcm9lUmFw?=
 =?utf-8?B?QjNpbkpVK2FDTllHaFRZRzlRaitkWk1lM2ZzQlZjSUhQRDlMaWlleVN5Q01r?=
 =?utf-8?B?VmtzSS9PcU1ldWI0RnV5WTVkbWd3Qm1jRGIwR0MrRHhZSnVzVHBCOUhMcXRu?=
 =?utf-8?Q?jTQcnMeJRSe5pHtE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e6a996c-71b9-4eb4-abbc-08de7918cdfe
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8208.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 11:34:17.8879 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /ZOwdyKOeAbmrX6TwoczfzEqxKnOpGD3Xhg903xtnPzkJ998hIDbiR1lU84JweTDKa+hRK7KmoqOYtQDqviUdO22dZE961i5m0BEwXV+GZY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4968
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


On 03-03-2026 16:53, Gurram, Pravalika wrote:
>
>> -----Original Message-----
>> From: Yadav, Sanjay Kumar <sanjay.kumar.yadav@intel.com>
>> Sent: Tuesday, 3 March, 2026 04:01 PM
>> To: Gurram, Pravalika <pravalika.gurram@intel.com>; igt-
>> dev@lists.freedesktop.org
>> Cc: Auld, Matthew <matthew.auld@intel.com>
>> Subject: Re: [PATCH] lib/intel_pat: Handle platforms without compressed PAT
>> index
>>
>>
>> On 03-03-2026 15:20, Gurram, Pravalika wrote:
>>>> -----Original Message-----
>>>> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
>>>> Sanjay Yadav
>>>> Sent: Wednesday, 18 February, 2026 04:06 PM
>>>> To: igt-dev@lists.freedesktop.org
>>>> Cc: Auld, Matthew <matthew.auld@intel.com>
>>>> Subject: [PATCH] lib/intel_pat: Handle platforms without compressed
>>>> PAT index
>>>>
>>>> Previously intel_get_pat_idx_uc_comp() would silently return zero on
>>>> platforms where no compressed PAT index exists (e.g. CRI), since
>>>> uc_comp was zero-initialized by default. This could lead to incorrect
>>>> behavior when callers assume the returned index is valid.
>>>>
>>>> Fix this by:
>>>> - Adding XE_PAT_IDX_INVALID sentinel to detect unsupported platforms
>>>> - Initializing uc_comp to XE_PAT_IDX_INVALID in intel_get_pat_idx();
>>>>     only platforms with CCS (graphics_ver 20/30) override it to a valid
>>>>     index
>>>> - Adding igt_assert_f() in intel_get_pat_idx_uc_comp() to fail with
>>>>     a clear error instead of returning an invalid index
>>>>
>>>> Also update the bo-comp-disable-bind test to distinguish between "CCS
>>>> is disabled" and "CCS does not exist" using HAS_FLATCCS(). On
>>>> platforms without CCS, the compressed PAT bind check is skipped since
>>>> there is no valid compressed PAT index to test with.
>>>>
>>>> Suggested-by: Matthew Auld <matthew.auld@intel.com>
>>>> Signed-off-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
>>>> ---
>>>>    lib/intel_pat.c      |  5 +++++
>>>>    lib/intel_pat.h      |  1 +
>>>>    tests/intel/xe_pat.c | 30 ++++++++++++++++++++++--------
>>>>    3 files changed, 28 insertions(+), 8 deletions(-)
>>>>
>>>> diff --git a/lib/intel_pat.c b/lib/intel_pat.c index
>>>> 9815efc18..d30bee453
>>>> 100644
>>>> --- a/lib/intel_pat.c
>>>> +++ b/lib/intel_pat.c
>>>> @@ -98,6 +98,8 @@ static void intel_get_pat_idx(int fd, struct
>>>> intel_pat_cache *pat)  {
>>>>    	uint16_t dev_id = intel_get_drm_devid(fd);
>>>>
>>>> +	pat->uc_comp = XE_PAT_IDX_INVALID;
>>>> +
>>>>    	if (intel_graphics_ver(dev_id) == IP_VER(35, 11)) {
>>>>    		pat->uc = 3;
>>>>    		pat->wb = 2;
>>>> @@ -155,8 +157,11 @@ uint8_t intel_get_pat_idx_uc_comp(int fd)
>>>>    	uint16_t dev_id = intel_get_drm_devid(fd);
>>>>
>>>>    	igt_assert(intel_gen(dev_id) >= 20);
>>>> +	igt_assert(HAS_FLATCCS(dev_id));
>>>>
>>>>    	intel_get_pat_idx(fd, &pat);
>>>> +	igt_assert_f(pat.uc_comp != XE_PAT_IDX_INVALID,
>>>> +		     "No compressed PAT index available on this platform\n");
>>>>    	return pat.uc_comp;
>>>>    }
>>>>
>>>> diff --git a/lib/intel_pat.h b/lib/intel_pat.h index
>>>> e9ade2e2e..e5dd8a0af
>>>> 100644
>>>> --- a/lib/intel_pat.h
>>>> +++ b/lib/intel_pat.h
>>>> @@ -10,6 +10,7 @@
>>>>    #include <stdint.h>
>>>>
>>>>    #define DEFAULT_PAT_INDEX ((uint8_t)-1) /* igt-core can pick 1way
>>>> or better */
>>>> +#define XE_PAT_IDX_INVALID ((uint8_t)-2) /* no such PAT index on
>>>> +this platform */
>>>>    #define XE_PAT_MAX_ENTRIES 32
>>>>
>>>>    struct xe_pat_entry {
>>>> diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c index
>>>> 21547c84e..052b7b699 100644
>>>> --- a/tests/intel/xe_pat.c
>>>> +++ b/tests/intel/xe_pat.c
>>>> @@ -844,15 +844,18 @@ static bool has_no_compression_hint(int fd)
>>>>     * Test category: functionality test
>>>>     * Description: Validates that binding a BO created with
>>>>     * the NO_COMPRESSION flag using a compressed PAT index fails
>>>> - * with -EINVAL on Xe2+ platforms.
>>>> + * with -EINVAL on Xe2+ platforms. On platforms where CCS
>>>> + * does not exist, the test verifies uncompressed access works.
>>>>     */
>>>>
>>>>    static void bo_comp_disable_bind(int fd)  {
>>>>    	size_t size = xe_get_default_alignment(fd);
>>>> -	uint8_t comp_pat_index, uncomp_pat_index;
>>>> -	bool supported;
>>>> +	uint16_t dev_id = intel_get_drm_devid(fd);
>>>> +	bool has_flatccs = HAS_FLATCCS(dev_id);
>>>> +	uint8_t uncomp_pat_index;
>>>>    	uint32_t vm, bo;
>>>> +	bool supported;
>>>>    	int ret;
>>>>
>>>>    	supported = has_no_compression_hint(fd); @@ -868,14 +871,25
>> @@
>>>> static void bo_comp_disable_bind(int fd)
>>>>    	igt_assert_eq(ret, 0);
>>>>    	vm = xe_vm_create(fd, 0, 0);
>>>>
>>>> -	comp_pat_index = intel_get_pat_idx_uc_comp(fd);
>>>>    	uncomp_pat_index = intel_get_pat_idx_uc(fd);
>>>>
>>>> -	igt_assert_eq(__xe_vm_bind(fd, vm, 0, bo, 0, 0x100000,
>>>> -				   size, 0, 0, NULL, 0,
>>>> -				   0, comp_pat_index, 0),
>>>> -		      -EINVAL);
>>>> +	/*
>>>> +	 * On platforms with CCS, binding a NO_COMPRESSION BO with a
>>>> +	 * compressed PAT index must fail. On platforms without CCS,
>>>> +	 * there is no valid compressed PAT index, so skip this check.
>>>> +	 */
>>>> +	if (has_flatccs) {
>>>> +		uint8_t comp_pat_index = intel_get_pat_idx_uc_comp(fd);
>>>> +
>>>> +		igt_assert_eq(__xe_vm_bind(fd, vm, 0, bo, 0, 0x100000,
>>>> +					   size, 0, 0, NULL, 0,
>>>> +					   0, comp_pat_index, 0),
>>>> +			      -EINVAL);
>>>> +	} else {
>>>> +		igt_debug("Platform has no CCS, skipping compressed PAT
>>>> bind check\n");
>>>> +	}
>>> Does this test needs to be skipped here? If yes you need to use
>>> igt_skip And handle the resource cleanup
>> No. The test still has a valid positive path on platforms without CCS:
>> it verifies that binding with the uncompressed PAT index succeeds. Only the
>> compressed-path assertion is not applicable when HAS_FLATCCS(dev_id) is
>> false, so I kept the test running and added a debug log to make that explicit.
>> Skipping the test with igt_skip would drop that coverage.
>>
> Reviewed-by: Pravalika Gurram <pravalika.gurram@intel.com>

Thanks for the prompt review and your time

-Sanjay

>>>> +	/* Uncompressed bind must always succeed */
>>>>    	igt_assert_eq(__xe_vm_bind(fd, vm, 0, bo, 0, 0x100000,
>>>>    				   size, 0, 0, NULL, 0,
>>>>    				   0, uncomp_pat_index, 0),
>>>> --
>>>> 2.52.0
