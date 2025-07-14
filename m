Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 708A7C83F17
	for <igt-dev@archiver.kernel.org>; Mon, 14 Jul 2025 23:54:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A66310E103;
	Mon, 14 Jul 2025 23:54:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lIAHvdQx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A024810E103
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Jul 2025 23:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752537250; x=1784073250;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=no8BRegZRpS92s82BYbG++3U05lEfXIUiTVaXxAlayA=;
 b=lIAHvdQxNF/GjovgrWEHJwRTOn5C1nBUBnyXnHJW8dXl6R+O1lGW9ocY
 H76mT2NyWianuZJTT4BnTHB9hQtusIplxN8mX0q7Sr47ITNqTyLt+2w2d
 ae9uKB2PE4l08VZbYDZpLgeJabCiCCDZz5ck48HzzKVkR3fn1TcO5cIN7
 erGNdRQ/sChcQZhrOjORiWVEJGbhnvLOLysKJEMdR+iPcuvnkCUWFUBSf
 9bFQ7pogCtgQipkRHmWaRH2RzI6eHg1fp5z5mCiqyQyT+6s8qdxiSvV1p
 vFYmDnkZHaKzTqM8+O1DwMCYHHgzvM7dxZoOGEasMOGa15GyYkqme83En w==;
X-CSE-ConnectionGUID: tr/BNb2BRPeIdZwOCznQfw==
X-CSE-MsgGUID: JuGjgTWRRvCcJjKpG9LuBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="53854346"
X-IronPort-AV: E=Sophos;i="6.16,312,1744095600"; d="scan'208";a="53854346"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 16:54:09 -0700
X-CSE-ConnectionGUID: uFe9wVpXTSiFPp44WYahXA==
X-CSE-MsgGUID: 11YkKz4AQ/+D3KYxUPjKzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,312,1744095600"; d="scan'208";a="156704177"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 16:54:02 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 14 Jul 2025 16:53:50 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 14 Jul 2025 16:53:50 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.64)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 14 Jul 2025 16:53:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jgfF4w55lcEE0yqEuC2udi2Kw513jS+DC9TxYEZF2JueFmjXZYnzp0qgOGnnjcAIHmfgeOCnepa+oP/GAaiscCyKv8WJE1HuOcwrUR57bezsJ2k1QN0nuYPgjBL7t1zTJ9YvD3ElQEX7+n9xSnlYQk3nTHGg2Y7eN1cyeuJSuYxGmleBQKnmRBWqq6wavf2/bNbxKDyJ1/IHfsWfdxYQLpMjMuXXwTnysv+UA2U83+Refml5QDQEGYYM04gKnMZnsFqnSO7f+4GZZMA0UfePhnm1UDvirCJKsPv39vKiz/DjB4O98+vsLjQZH4x40BYEBFJR7sX98RSCttN8un6RTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9hdaZAFOJT8yikEfaFiXAp8NACrNCFyha7Zt+j0KXpM=;
 b=U1ndj/CKuUgKdO60c7zl6n0fVAYAQAiDbuL1usHtfXrT8lZXRAVMX4+e4yBoBtPFg7gUmTLX1XUITr/AfkYeSq+mYPUe/B+E4SJDcd3gIO0x4cpEXn9QZG0F1YbXfy/16WwhpR0I1dLOwQD4wrAGcJ0KByhiaRm5uEdnLHVu7r8RiK5wshVQofeNQbvTExJGtW7f8RHVb3bOxbgZkck49Sr4p3x7Isof+Wo5UQOnHCgVVGAFkFmN/543/w1IxaxHcPAUFaxguqpOKy7HliW13i1Cm503HNKxOHmn0Q0M4OCC0YwJe44LJjP0tYAh48zK62/g8YlkydAr5k6+ci15FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by MW4PR11MB6936.namprd11.prod.outlook.com (2603:10b6:303:226::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.16; Mon, 14 Jul
 2025 23:53:47 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8901.033; Mon, 14 Jul 2025
 23:53:47 +0000
Date: Mon, 14 Jul 2025 16:53:45 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t] tests/intel/xe-oa: Use subslice_mask in
 pec_sanity_check
Message-ID: <aHWYiW4za0JfIkj4@unerlige-desk.amr.corp.intel.com>
References: <20250714212411.2325726-1-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250714212411.2325726-1-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR03CA0086.namprd03.prod.outlook.com
 (2603:10b6:303:b6::31) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|MW4PR11MB6936:EE_
X-MS-Office365-Filtering-Correlation-Id: bfff7da1-96d0-43d9-f4e5-08ddc331ac38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a3hQa25KR3UrekpzWUkrQkYzUGxXMDVwYlhNdnlwd0lkSDk1ZSsxMjEyZ0lu?=
 =?utf-8?B?WGpZb01obm5jczdIYkFUaE9hejErVjY4YlMxQmNUTmdpTjJOajEvdDVHYWR1?=
 =?utf-8?B?UU83ZVJ5SVF6a2tOS2NhMllzTXZnV3lUTXNIWVI3YmxKL0c5UnhRbWpoc3NH?=
 =?utf-8?B?UDcwZjdKVyt6WXMvOHdnWG00Q2JCZ3hKOEladGJzcGx1VFZVYW5SYmo0czNI?=
 =?utf-8?B?YmJSUU02T1B5T0owck9IejhlcEp6bW55VDhWYnVodWQrQnRGYUlVMnVueEsw?=
 =?utf-8?B?TnZKU2ZSUFU2UjhZa1NNZXdiUDV0Z2hBUVNpRkx4TmU0LzhTNWdPdm9Jbk1v?=
 =?utf-8?B?djR2dlAvTHczOTBpUWxiQjBSWFJvL1ZVOEFxNTNWSnZZV2pUUkVDU2VIUTBR?=
 =?utf-8?B?Zzd1dDFGV2xkcFdRWDE1VXBOeWZaM3k5cVI1V0RndDZRSUpldnA5ZTNqaGxt?=
 =?utf-8?B?bVFyajh5NHpWMDhsZTR2U2ZzTkVPNVFQY1hMeTA5NnhmS2Q4MkE4b3Awc0Jo?=
 =?utf-8?B?cXNiNXhVNXRmaVZTYVBXNWd5NWFjRWU0MFE5OXp6Y2h3RjlBMTgxU0kxeWcz?=
 =?utf-8?B?TUMvZFk0Tm1ZeEZzTHhvUG53cWpDQ1FRalllcnA0Y0d5QUp3UmRES2NvL1l6?=
 =?utf-8?B?a3VrcTM5d0xhSG0weVQ4MGFBbkxkdnIybGxTREZDQkhyTm9pL3NOcm9ZVEFN?=
 =?utf-8?B?ejBCdXhxSzl1Rzlmc1p2Y3ZIVmEwaDBWa2ZGc3l6WkxYaXBLT0Y4SEg3aWZz?=
 =?utf-8?B?UmNmaFBMN3lhelV4VVBqWnluaDFIV1ROZUtnUTllZFhNcDZTcngvR2taaTh3?=
 =?utf-8?B?KzRXMDY3cEZmUUs0c25PWlpnL1ZLeDBPL2pHQmRHNGhHa2NTUTNFRm51eXlO?=
 =?utf-8?B?MTYxd0dSYTZuREVCVkg3bkR2QldseCtaRm8rYTMrTm9RUnRKUDIrZHlXS3BI?=
 =?utf-8?B?eFhsQXV1cENMd2dONE1ZakF4S0tZZ1BiRHZSRmI2ak9tc1FpQnNvRmdqL3da?=
 =?utf-8?B?YWo5VU9LWHNPb3Q5NU1yNjgvQXV6VHJYS0lrYWRVcjdwaDdzNUNEZWhhYXNS?=
 =?utf-8?B?UkkvSndLRHZsd3daSy9ieTVYUmJ0SGtJaUhvdVdHS1dCbndyRkpkaFZMVlhU?=
 =?utf-8?B?TXVsRWVDNXVNMXFjYjBtL3N6VUZlSzhWSVVqcUtxeVpMUkE1azR2a1h2S05S?=
 =?utf-8?B?a0lTYk5SL1RUc2hNc1pWc0ZvOElyMjdYZHZsbnVJaytCREhzTWRtcUdFS0RI?=
 =?utf-8?B?ZVpud0NoMHJPZnZ3V1YvUmZMK1M1WFU1RmpCVTNLRWtJUWIxM2x1SW1FVGRL?=
 =?utf-8?B?c0ZtSjJ3OWdSSlBVM04zeHNITUxDOGVmNW4zQ0FVRVo1Q2dBM2NDWGVDUEJl?=
 =?utf-8?B?ZGFKdE9mSitReEVnSW53NmJQRDUrZVFpdXA5QTJaWkR6UE9jQVpNQ0VjemhI?=
 =?utf-8?B?emhiYUpGZ3ZWR0lka0lmcm1sNWtJZWtRUmd3WDZWS2NDMG9rcC9Zb3E2OE1X?=
 =?utf-8?B?UUN0VDlnSytIV1d1aDRmNEd1ZmpqSm9tajYrMVppTitUODlMTkFsblh3T3JS?=
 =?utf-8?B?N1hObkszcVhXdXhQNDN4cFdNbDlBWTZMdjEza1FPdlJPUU8wT0FKSkVMUGcv?=
 =?utf-8?B?bEp2bC94b0VyZ2tpcVNNYU5BcXJ2bnhVOXA0SWN1d3ozeVhtSFhFVW0vSWFj?=
 =?utf-8?B?QnF5QWFjMDAvcHpPN1pkZkF5bWpNZktoMndSTm5LN0FQTWxzUE9HYllFRlRa?=
 =?utf-8?B?N3FnbWxudTIwWW04cDBJUTYrTWxjbUlvMXpNekRJZ3I3TkUrK21HVE8zSXRn?=
 =?utf-8?B?dGpwVEhpQlI2cDY3cTZDVTRFSCtBbEpvUWRKKzZYMUpiSVNJcFFzMVVEOFJC?=
 =?utf-8?B?UEcxaEZCakhFQm8wSGcxenJXZy9FaGUzbGNpV1RmWGJFMDNDMUJGd2o4Z0Ro?=
 =?utf-8?Q?iHp/M8U2g+Q=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NXpDcm9leU4zalpPUmk3TGo3QUhFTERudGEvZU1rSU5NVGlQNEVvaDRRelpR?=
 =?utf-8?B?ZTQwVUlHREl1bXlJK0tvSUdRQzhLcUhDL3dLU2Y4V200YnE1d1RGSE9aUndE?=
 =?utf-8?B?Z2J0Sm41dEF2U2xaakRWNHVoR1NZMUh3b0lpWFVHRi92MW5TRzNsSmhNSE5S?=
 =?utf-8?B?QWFLc2l3amUybjB0VzlFK005OGZybU8wR1JHYnhWeUVQN25DN01HY3hQcHJT?=
 =?utf-8?B?Rzd0c2NmMURvT3FNamRDa0pDczJrV2tqZ0hSem52cS9GQklXRHpjeVQvalNl?=
 =?utf-8?B?Myt0ODhXcnRhVWRqOHZmRXN5ejQ5MUpWenBBS1BKMUhEMVUxelhYWkpha2Ix?=
 =?utf-8?B?eXNENHYvTnFVMFYwUUd6b0lhMXYrdDZxWVhkTmxCMjY5TFNFNWJKajB6NHBr?=
 =?utf-8?B?ZFhxZkMyMDdHbzJqMml4U1grV1dKR1BKdGQvSnV0VjJBVkdOS0ExbE5IeEt0?=
 =?utf-8?B?TFhiSGpUMDVPaTQrMzFhNytqU2V2VWlFK2JWaEdCWXRMOVF5ZExOZnRaRnl2?=
 =?utf-8?B?d2pid0VRdC9qcW80QmxKOTNZVUlEbFNYdVpGUUxmSndWNENtTFFMT3AyR1pN?=
 =?utf-8?B?aFdXeS9rMVpGMGMxbUNrUTVxZ0hFS21YNzZrSVV3RVpYWVZyUncwN3VmMml0?=
 =?utf-8?B?K1VRbDI3OStqd28xbkhNYys4RGpxU0RTenJVSTFld3A0RDMwSENRUk50Vmgv?=
 =?utf-8?B?RE9vREFWVEcxMGg0VWx2RExYRXhYMjlXK1I1U1J6TENyczFIYVdIUUxYUDVu?=
 =?utf-8?B?dk9WcmRuZjNDeTQyUkl4SHFIbHdaN2VYcDRWYldRUTN2ODIvbGhyeTU4OFow?=
 =?utf-8?B?ZndsUFFHSWdnYTcrcE9EbGkydytiQXBqK3IybDVQNTNvb2plWUx4WGdId0F2?=
 =?utf-8?B?TEdocEpuT2xZUGNkZ2YyL0N5Z0EwWWdCT0lpd2NZcVk1Uk14NWZXRGprbmZZ?=
 =?utf-8?B?UkNlT1R2N0tPSUdYNkE5RVp6MFRLV1g1UWdGVlNYL3V5MGRWOUExRURlZUJC?=
 =?utf-8?B?MThDLzMyMUFTYitlQmYyekE4Nlg0TkpSSjBxNUFBbnlmZVlsSGl3bUhqdVFt?=
 =?utf-8?B?ckc3VWE3d2w5T1hOSVd2R2ErejdVNUlZVGQrUkIrbmwvRmFLbGZ2eW1SVXhq?=
 =?utf-8?B?djhOWVYwTHZuYXBWdlh5VVV4YTlDKzlDbG5mMDVuczh3eVU1a0Y5MWQ1UlJO?=
 =?utf-8?B?bTErRE4yTUpFWGxKSWJESExCSlB6NytrK3BIM0xTc2JFQnZNd1BjMXJySFh2?=
 =?utf-8?B?RHc1NnVDUi9XNG1qSmtIalBTMDd2TlcxRHpHcXQ0SE9aUEtuK1NvY1JCVUg5?=
 =?utf-8?B?TFRaTGVUeHVWZllyUGRHS0ZkSlQ4Q2lla0ZCbSt0QkptOTZBb2RYTVdnaXly?=
 =?utf-8?B?UG5NUlZUVGRIb29mbUI4M0hZeWlaWnpsZHFBc1JKeFNWSng3d0s3UFM2WTc2?=
 =?utf-8?B?dTg3Q1BVc01kQXFhU0JHdFRVZDNOZXdHVnVmTzNOOVlQTkkxVHQyUGh5UnVP?=
 =?utf-8?B?V29zTVBGN1pWUzd6b2dEN2pqREtiM3hlRVdYV1d0NUtHYmczYWhxUE96L1Zs?=
 =?utf-8?B?TWl1ZVpwd1VkM2p3RlBHY3pla3RvRFZBZXI0T0hKR2k2NmFsWDVwV2NBR1lt?=
 =?utf-8?B?YityVG05VmllRk14RjZuT0NZSzNjc0NSOGR3ekQ3QWZjSjVxYWlROVA5ODFz?=
 =?utf-8?B?VmdYZTlXUTFEMWRLVzVJYmJnTTZMMzFTd3RkZWtycHdjTEY3YUV6WktydFFM?=
 =?utf-8?B?ZW91YlhWVjJQd2NZNTNPMDFta29GeWxQZmZnWXRNbWRFMXhtR2ZpU1lnL1Er?=
 =?utf-8?B?UWV4RVF0WXpKejlFRGFTRnF0TWxoMi9CWStUcDE0ZnNkemttTVh4Y3JVaEx2?=
 =?utf-8?B?MjI2dnRFalMvdzh4dHAvWm5xUjV2MFRtcURNbFpEMzJvOUFJem13ZHIvRmt2?=
 =?utf-8?B?MnNnbzJRWGVlVEMvT2dPa1ZHWVRaQVFZNCtWOUZ1bitab0lyVFY2MC85eVZU?=
 =?utf-8?B?aEQrZXM5Wmw1cUlCd0tjTVA3MktMZUwrQ0VHcXNJcm1JcFBudldmMlBTRXV6?=
 =?utf-8?B?NDZTWXNsUHg3YnNQS2hKZGNxQzczaFdHZzZlUjhlQzlZY1BLNVRwV21kRTlM?=
 =?utf-8?B?Z1VKVUZ4TVNzRU4rckY0WjUzaGtpejl1L2pDYUsyL2lwQXF0VXN0Ym9ISU9E?=
 =?utf-8?Q?xBpQamDR8je6ry9sEaKpzkc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bfff7da1-96d0-43d9-f4e5-08ddc331ac38
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2025 23:53:46.9949 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MRCHZ0376mD3jjZgVc32kG+B27lKrY/BShBOS23uendjf7xwoWSatkv+qUmMKZ3vm3acK46KCmk9qTVVcnV6AQXW2aWMEJg2pawDeKN+Bec=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6936
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

On Mon, Jul 14, 2025 at 02:24:11PM -0700, Ashutosh Dixit wrote:
>pec_sanity_check previously relied on pec counter values being 0 to ignore
>missing xecores's. However we are now running into situations where pec
>counters are non-zero even when xecores are missing. To get past this, use
>subslice_mask (i.e. mask of present xecore's) to ignore missing xecore's.
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>---
> tests/intel/xe_oa.c | 11 ++++++-----
> 1 file changed, 6 insertions(+), 5 deletions(-)
>
>diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
>index 724fea73f0..2de5802876 100644
>--- a/tests/intel/xe_oa.c
>+++ b/tests/intel/xe_oa.c
>@@ -1023,12 +1023,12 @@ static void pec_sanity_check(const u32 *report0, const u32 *report1,
>
> 		igt_debug("n %d: pec1[n] - pec0[n] %#" PRIx64 ", tick delta %#" PRIx64 "\n",
> 			  n, pec1[n] - pec0[n], tick_delta);
>-		/* 0 value for pec[xecore_idx[i]] indicates missing xecore */
>-		if (pec1[n] && pec0[n])
>+
>+		/* Skip missing xecore's */
>+		if (intel_xe_perf->devinfo.subslice_mask & BIT(i)) {
>+			igt_assert(pec1[n] && pec0[n]);
> 			assert_within_epsilon(pec1[n] - pec0[n], tick_delta, 0.1);
>-		/* Same test_event1_cycles_xecore* should be present in all reports */
>-		if (pec1[n])
>-			igt_assert(pec0[n]);
>+		}
> 	}
>
> 	igt_debug("pec1[2] - pec0[2] %#" PRIx64 ", tick_delta * num_xecores: %#" PRIx64 "\n",
>@@ -1201,6 +1201,7 @@ init_sys_info(void)
> 	igt_debug("n_eu_slices: %"PRIu64"\n", intel_xe_perf->devinfo.n_eu_slices);
> 	igt_debug("n_eu_sub_slices: %"PRIu64"\n", intel_xe_perf->devinfo.n_eu_sub_slices);
> 	igt_debug("n_eus: %"PRIu64"\n", intel_xe_perf->devinfo.n_eus);
>+	igt_debug("subslice_mask: %#"PRIx64"\n", intel_xe_perf->devinfo.subslice_mask);
> 	igt_debug("timestamp_frequency = %"PRIu64"\n",
> 		  intel_xe_perf->devinfo.timestamp_frequency);
> 	igt_assert_neq(intel_xe_perf->devinfo.timestamp_frequency, 0);

LGTM, but a nit: s/xecore_idx/xecore_to_pec/ or something similar to 
indicate that the array indices map to the PEC counter that ticks. That 
way it's easy to understand why you are checking the subslice_mask.

Regardless,

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Thanks,
Umesh

>-- 
>2.48.1
>
