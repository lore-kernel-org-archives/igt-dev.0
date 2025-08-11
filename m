Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6266C87FDA
	for <igt-dev@archiver.kernel.org>; Mon, 11 Aug 2025 05:50:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CA7E10E2DA;
	Mon, 11 Aug 2025 05:50:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cOc8QJxl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0672310E2DA
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Aug 2025 05:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754891442; x=1786427442;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pa8LkF6hSwRVMUqEVA1ERwkg/KPuG9FKS9CFAiBWS4Y=;
 b=cOc8QJxlO7+1ESogtyndpTh++TqiaVkES72YkjFAZff6yQae/rqNbmqm
 H8IMfybjOuZjulIqGQUkSRRmpB55QRigRK8CvJD6Lx8ExW3SVKCoiUKgf
 xePCRpa2ohsN8RsGPthY6MQfbj6i4FabDzm/soMc2BvRvNG/ku6hxeP4m
 mcGNZPIQ9niS49VJRLpHXxwOBrkIYEY2PRcH84Dk/xpiCzJpyeM7jQpMD
 dzKIY2FQjIiF0XrzprNxj5eOfL6AH4WVROpm10UTK+6vl9mzgj5tG5GE9
 4AX6Nfzpx4kRvm3Is0KprR5A8sewTExszuZ5b47d/oQbNnh0gLcTNkkIG A==;
X-CSE-ConnectionGUID: tA9FXmEWTlyr5ytBM28uKw==
X-CSE-MsgGUID: H+0uQmmgQ+OFNOHPiVIUfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="44722075"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="44722075"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2025 22:50:41 -0700
X-CSE-ConnectionGUID: YjgmnzCVQP+J3riA4RnVZg==
X-CSE-MsgGUID: c+voUWhDRKq3kVd1LPidlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="169933865"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2025 22:50:42 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Sun, 10 Aug 2025 22:50:41 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Sun, 10 Aug 2025 22:50:41 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (40.107.102.88)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Sun, 10 Aug 2025 22:50:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R6ktidMarRCmzZ82BbItdrMufs9UTrO9xbZgqcPqUz9T8YjhJ41QPCTxYZ3Rluk+bi/xWyduJKXn+v7+q2BPhYtdc/JdhfRHCq0/7DPudV8Br3Unk+ZMt0CPjpuP3fQ1oQcMK7vWvUj2sCHYojZ3wvwHhIC2pEKa+pYz0adyiWP6LRTz8AjPaSooBF3Lc2/LxA9GHhM+A5n/M0i0H39U5brxij5Q5IXLkz/Mn3coz4U0ggteWN+ckHFlirflWxT3wVRuxEjJ0XFqHVwtnNy7msFkqpnZ7801aN/Jnm1ujbBKjVkkV8NG9L7H2MWHK6jYi4zo/c4Ku3pLi21YyFOjCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=15KuPX2U+tzJ6EUU2ZZUTAkR1ybAYPT8grWIA8KWyZs=;
 b=bqUPPeJObkCNugnb+JxgQJEGcUQxPQAqGGTzXzZPdP6DCSO9wrycqPoejCmc8h7g8cdDQUMmImNDLit4oH6ymIIFSSrvaUD0gf6xb5CpiYX/DCijHsTkJ8UiDOlIlhWpHk5dKDCMIgN94wEdJolxNYJ221Xjma1zw9uuZfUjUjJZxuvgZc92QGaBa94XGYatgo5+ha+i2kWBrHYOeADPAyrxlchWWzN5mOp2WlveH+WHlKahxNjoGjQHqFo2BEVn5Rb1yFrEVNfGyH6f2gHChLbMhcAGyMKVmkr/hExdWChM9u1PoiZSDAXnB3Ui/CmDl+8biakluDE2AmcC8Ui/rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by SJ0PR11MB5087.namprd11.prod.outlook.com (2603:10b6:a03:2ad::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Mon, 11 Aug
 2025 05:50:39 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%4]) with mapi id 15.20.9009.018; Mon, 11 Aug 2025
 05:50:39 +0000
Message-ID: <63871c07-6045-4d29-ba81-546df4f9a73a@intel.com>
Date: Mon, 11 Aug 2025 11:20:31 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1] tests/fbdev: Skip resolution mismatch due to KMD
 issue
To: Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <chaitanya.kumar.borah@intel.com>
References: <20250810182741.1167155-1-ramanaidu.naladala@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20250810182741.1167155-1-ramanaidu.naladala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0072.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::19) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|SJ0PR11MB5087:EE_
X-MS-Office365-Filtering-Correlation-Id: 18832a13-6e5d-4df0-e344-08ddd89affdf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bnFwbzUvR1ovTlV6cGRyZTZteFhKTTFubmZaQVludjhoU1FRL2l5Y0VQdXE5?=
 =?utf-8?B?cGFsQXZNMTlhQ2JqWmxxR2RwYjJrMG1SdXNwa0l6R3AzZDhINWpHSVcwYkpv?=
 =?utf-8?B?K3ZWZTZ0MnJYL0xobld3YlErcFRuUGxIVFZVczFsb1VTWm9MV1kweTVUL1JR?=
 =?utf-8?B?ZHNMcEk5M1Bud1IvRCtlekhSVVN4dGQwQ1pPaHJTS0JiWDAvbHRTQ1FmR2J6?=
 =?utf-8?B?VDBKa1BRdFRkaGl6TXpMNjNRVW1hU004Yk5MdjFHUXZydFZ0VnQwUHJidlRZ?=
 =?utf-8?B?UkpmajJseTNWM2Q4V0hVM1hXVEdIVklweDhhdGsvMUdaYmhLTW9weTNsdXpT?=
 =?utf-8?B?TTdkY3RvSU9NM2pzV0tFZVE5LzVITmhRdEhvalVkV1Rqb2pzUTVVMTkydFR6?=
 =?utf-8?B?OWhGZlU4YXp0UnNVczhRczByZEEvRTVsbGlDZXhDbGRIK2dJWG8zemFXNjRr?=
 =?utf-8?B?d3VwczdSYVd0UFhqd0tpS0dKLzlsTFhXMTlBNm5zMitLYlhDMlhuOEVDQTNK?=
 =?utf-8?B?djJPRStPOXdUNWtxZVEySTJidEl1RjJYYmZNSnh4MjlRcStjV3cxOFNqaG9E?=
 =?utf-8?B?d0xuYnRVanNhQ1UwaU9aaE9Majk2WjdieG13QUZoRG1IaG9Mc0YvUmpTUjhI?=
 =?utf-8?B?SER3YzlVRlhaMWgxQ3NaMVVqbmxJcTh0Y2t1d2U2Y1pJSXIzQ1pOd3NIS2xx?=
 =?utf-8?B?UVNUdC90TUtzN3EzdlA1UVlYMWVVNmZ6SS9oUGpDYUc0K0NsT2l6aW0wOHVa?=
 =?utf-8?B?S0l2RDRBOTJjbkh0dVhqSmZ3TW1aemhwbS9QNmJ1dVhIK2lCUU5XMWRKMTlZ?=
 =?utf-8?B?RHZFVGFBMmo5MXdmbXBtaXBiblMrelNVa3RrSE54U1Y5RTkyZ1BVc0VmWnBr?=
 =?utf-8?B?RDBRZ2swK0FPZ1Y5cWwweGZRMWZ0cXhjNVFvNmFlUEwzUGJYa1FRdzZLNmJZ?=
 =?utf-8?B?VlhaNXh5dm9tWXlRaWZUV2pia1hyUDVGOEd5YTBOZVpTK1Uya2pzUTFXK0tO?=
 =?utf-8?B?OXd2RW16MmZseTMzVXA3RXpGQVgwSXBhZGtnbWZlcGN6bk5oTTJSQk5GeVRE?=
 =?utf-8?B?RmFiZWxyVmVUR3lUallzR29EZnNmZFYzb3ltdHRlVTI2M25sS28vMGNwS29U?=
 =?utf-8?B?Z3dTUDRIZjFnQWczYllnaWZBUlpsYVJpV2ZML3hpOVFibUo4Z0xvTzBWMGpJ?=
 =?utf-8?B?b2NkT0NndDk4bWJKRHdHRlRkMThjaDJHV0dpWTgyR0FBMjhWNUdRM1hOS1RN?=
 =?utf-8?B?TVR5azlYV2kxOWpBOGRnVFQ5NnAvUWh3NlFZejk3QTdIeC95MmdqTTBXR3ZX?=
 =?utf-8?B?Q0NZeDN3RGZGa05LZS8wbDArSWl6dldOWG16VHg1RFZRNjAzWWZMU2hCRlNi?=
 =?utf-8?B?OHBGRHdEVHVENlErSkhyckZiUFkrZmhEYWxlNkdxMHRsdTdoS3VuQWdkd1FR?=
 =?utf-8?B?YnBiZWJsWS9sRlJQWW1Vb01sSXRDRW1NSHA4VlZzRmJXOG9YYkcreHpmaWJ0?=
 =?utf-8?B?Y2pEc090ZzhuMDRJYlB5OTl3eFkvSEhaYk1EckF1Y1NYMnVDb3dzRW9FRVpT?=
 =?utf-8?B?RnM0dFhxUHVwL00rN1dNcmJlOFczR1l3aUhOYzRUSFhiTjFyL0JZREZWaG8x?=
 =?utf-8?B?MzFjZldmb09XamlVemQ3L09NUnI5RWN1YXZndGJOSkNpZlJTMDBtb3EwUXgw?=
 =?utf-8?B?NjY2L1FPL29HSG5xY2RoWHdhdVpDcnQ4elpxdllWV2VBMkZuOE9LWU5tSGs4?=
 =?utf-8?B?bElCVFNLRUxjMHpSMWxGYnh1eTVOWXdwVWpTN2hscjA3NXZFSkxpNWxESU1s?=
 =?utf-8?B?NFYxR2NwcDR4YXVNN3J6NC9GSlBCbythM0hDMjFzbVBRZGZDdW1hUGt2Uk55?=
 =?utf-8?B?eTNTNnBnVTVYK0Z6ZVcyYkxFSzgvMjl0Nk5YQkFPbnRNSG5UbTlhdDhVbWtH?=
 =?utf-8?Q?PBvCRfszrE8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZUxxUmZoZk5hTUNxSmVaT0NMbzFKSCtlZ0JOclI3N1BETG1UUmFZVGlpQ29m?=
 =?utf-8?B?Ky9sT2szLzNqeWorK3FhLzdjMDI4emgxbm5XSTZPdVYvS21rUkl1RzhCYVRy?=
 =?utf-8?B?YXVIaVlieWFac0FDOElYRjFhclI5RlhjS0tXa0FaempPTVFYQVVyM2hRL0RI?=
 =?utf-8?B?ODZzSjFxY2dzenJXMzR4c2lKdnEvYUw1OVJiTkJQa2orcnhXQ3BvQW9iMFdH?=
 =?utf-8?B?TkZLNk1vbS9ZNmt6Z2FOcENTNVNQZGlGbGJZUFpOUXVhVGdZeWpoUjFka1VF?=
 =?utf-8?B?YjkySTRaS3g5Z3hQbDFTUzQzWnZLUXhDUmsyTjUrTm1JSmlGbDhndkRiMFhp?=
 =?utf-8?B?Mzk0Ny9WaVVXNzQwMkdRQURwR051V3JhemU5SjhlQXdja2k4ZVNSNEtMVDlG?=
 =?utf-8?B?dEdtelhoQVY5b04zcEpocWpHNTA4UlBXU2tnOC9kRUR2TVlMN3RqM3RnT0E1?=
 =?utf-8?B?M25QU2dCK3lKOE54cDRGcm9ZdVhvajgwdnBHN2ljT3dGV2JMMXIxQ09LcjJV?=
 =?utf-8?B?MkxLZEZqRlV3dlBzR2p1bGkwSXBMdUlTZWFib0NPR1BLV1ltenpxRTh6T3Ix?=
 =?utf-8?B?TWJscG9zVHVFZ29aVDdPYTg2WWkraExrcTZWbWkzaVduKzliVGtLMHNKa2dh?=
 =?utf-8?B?WW16eGhvbDRrV0hBOFdQUGZhRDFrdDdZUTNUS05ZKzFHTGxUWjFjL1d5dElz?=
 =?utf-8?B?eXM0aTlodExnWVFhU0ZtWjUxc3dMZUFmVnIxZ3htTUQzK0xweGNvZlYxRnUx?=
 =?utf-8?B?YkxudnNkdC95ZlM0R3FsbWxtejNYSU5rMTU0b0trNThaNi9pclVCMWR1MFVE?=
 =?utf-8?B?dEYreXJQVGp5SVVpVEVvM2owTTFHMURXbmFmTTNOU0poR043ZlVhZUoxNGNQ?=
 =?utf-8?B?UDIyTTVaQ3NmN2hiWWJlUDE2TXVrcUpuQVpsVUluZGdkMFlYdHhVa3BGeVJM?=
 =?utf-8?B?TXYrTXFWUWN3R256NU1RYjB4KzFmejVwazM0OU84V2VVT2R3cXE0OS9TT1NV?=
 =?utf-8?B?YjNUMm10L1RDTmJKcXBnQXY1WkVqbXRPY0UxTVluNDVPTllGVEt1SEVEU2pn?=
 =?utf-8?B?aEdLSGhqZk1GWForN2Qyd1BVTXdwSSsrQ0xJeHNOUVoyUDg2MnhpTW1MSEZt?=
 =?utf-8?B?Z3M2N1ZCb053TXBVeWVMOHJkVE5Qa2Y1bFdEaVZkTHBFYi8zVzF0Q0IrU3dK?=
 =?utf-8?B?eG4yVlFpT3RGcTF0RklObmJ6Z0tCaE5xQVFnRDZERm9BTDZhT2k4Nk1EQjlx?=
 =?utf-8?B?RTNRc2tJWG90NG5jOUR5Q3BaN3RzeWlwWVltWmxZS2RzcUFrNi9MbVUrZ1Vj?=
 =?utf-8?B?eDRTOVZaNERXbkh6RnB0bzMrbzFMK0xiQ0luUk5vRUxpNjhja1JSSzhxaGxH?=
 =?utf-8?B?VVVEV0xNR2V6SzBWcFJOaDdsYm9BcWdhMWorLzZiNWFVVm5JeS9pNGFQRlB3?=
 =?utf-8?B?RzcxZGt5TXd2eHdLYVBvQXdPYUJaRW0xcncvcTdoSzBzeWZLWHUzRGlyQ0t3?=
 =?utf-8?B?YVpBRDliYVlTa2lvVkVtaDdlenp6KzZKc1lFSHlLd2w2NXNUeng5VVpzMCs4?=
 =?utf-8?B?TUVZM01mcGJ2L1kyRkhJYlczV3ZJTitRNS9uaUF6UlB5YUNUZWFCeW5zYUg3?=
 =?utf-8?B?VXU4VnJadkdncGZRa0ZuenBpRHNUbEJaVGVlL0tBL3QxWmhOeGZHbWJ4T1R3?=
 =?utf-8?B?U0tZZ042eis2YnRhaGVabWs1QW1aWUZQbVUzczI1WU5tTk5UVmhxOWZsNEtT?=
 =?utf-8?B?Z2dQOG1YY0tPMXhXQnpMRE9ZUXVPc3F6RXNWeENadzZqclpVVG1ldGM1VDIy?=
 =?utf-8?B?MkpUSmkrRmJndjVaM0JwbTYxRFpIdnpST2IxSTF0OWMwSWlnY05QdHNrcU1o?=
 =?utf-8?B?aDdsSE9yRDhhWm1nOHBHa2I4djJrbXBFTFZ3M0cvT3lodlRmRjRTdElLUFg5?=
 =?utf-8?B?OG0yb0h3RjI2cW9JUHJkTm5hT05aRURrcjhiRlJMZVVzMlRWTXdpQWZPK2JL?=
 =?utf-8?B?b1dUREdlVExUYU9XT3JHYTFkVnFBR3JrOXFNSTZNdGtzQU1ON2ltNUMzRG54?=
 =?utf-8?B?TnpzUmFIbjQ0QW1zeEp2c2QxK0s1OVVVWEZCNlNadEhTdmd3NTJnQ1NXR08y?=
 =?utf-8?B?THdobldoRWt6YXJTcHg3VStWdllkZi9NMDBTTXc5SDlUWUh1YWdieGUzWjJZ?=
 =?utf-8?B?SlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 18832a13-6e5d-4df0-e344-08ddd89affdf
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2025 05:50:38.9282 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: obWiuL6CZkkj8uVsj+rNEf1UMkPRWLQglo9W9qLRXsv7sFCLiI6DSOcNoKfGIbsQWgA2UEdVSUL55nKAApznIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5087
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

Hi Ramanaidu,

Can you please mention which KMD issue we are referring here?
Do we have gitlab issue# ?

On 10-08-2025 11:57 pm, Naladala Ramanaidu wrote:
> Add a conditional skip to handle cases where xres/yres do not match
> xres_virtual/yres_virtual. This is a temporary workaround for a KMD
> issue that causes incorrect virtual resolution reporting.
>
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>   tests/fbdev.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
>
> diff --git a/tests/fbdev.c b/tests/fbdev.c
> index fca688407..9d386307f 100644
> --- a/tests/fbdev.c
> +++ b/tests/fbdev.c
> @@ -170,6 +170,16 @@ static void mode_tests(int fd)
>   		struct fb_var_screeninfo pan_var;
>   		int expected_ret;
>   
> +		/*
> +		 * FIXME: This test skips when xres/yres do not match xres_virtual/yres_virtual
> +		 * due to a KMD issue that causes incorrect virtual resolution reporting. Once
> +		 * the KMD issue is resolved this skip condition should be removed to restore
> +		 * full resolution validation.
> +		 */
> +		igt_skip_on_f((var_info.xres != var_info.xres_virtual) ||
> +			      (var_info.yres != var_info.yres_virtual),
> +			      "Resolutions not matching\n");
> +
>   		memset(&pan_var, 0, sizeof(pan_var));
>   
>   		/*

