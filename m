Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98109D49203
	for <igt-dev@archiver.kernel.org>; Mon, 18 Nov 2024 09:48:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4497E10E48B;
	Mon, 18 Nov 2024 09:48:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bq/XCuHp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 742CF10E482
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Nov 2024 09:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731923294; x=1763459294;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=14A+wSS4IJIDaDNPC0t+WeEab6i2N1qSCbdRf4LusyY=;
 b=Bq/XCuHp5+t520yeoN7LPkRKsMYQkM62oappymSb1VBfphSe01HOrimu
 xMDM5IPM0a8ElOxVcuEn2Wni0uO26T7a2SFgUjX7Jsl970/p0tI7Yu3RG
 6+fDc4c2TPAJ5A2fw1Mmak5lT6/D/FlbGyoKtj3sOskWMXtwJxMvsyr6a
 zzaa4KfVEw3rgfaG0fjyn0dW+YpEoS5/kUu1JUKCDEsTHTKebyKkAyHRp
 7U/L3zO384MA042G8JR/0pGukkctJxrDTMM0Z5HsQgdsXOz1kxPSyCSJR
 pJsBgLrcpl37PyQp6N0ifNB3JM/x+NA9CV8/QcR1ZX1/x1EKAoPfqUKVZ g==;
X-CSE-ConnectionGUID: JhjZor+LQK6jeMt/n+fe4Q==
X-CSE-MsgGUID: 9Vc8vhbDQDOzgoIktzKQ3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="31807893"
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; d="scan'208";a="31807893"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 01:48:13 -0800
X-CSE-ConnectionGUID: 7ZRx1nJtSSKx4q42+Y9cpA==
X-CSE-MsgGUID: gRwv6iePRmmLRtCQ8KGLuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; d="scan'208";a="94266574"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Nov 2024 01:48:13 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 18 Nov 2024 01:48:12 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 18 Nov 2024 01:48:12 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.48) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 18 Nov 2024 01:48:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YzcAKL0q4AUF2FnLGX/Aty+yR0DWaF/BaprTcE7C10nm+XsGrXIgRBp4KZzl2XBJlqCZKlmwckyptyX9Nx0QmiHjwUTLAKE4qdl+jhrK/svEhBbtD0Fb+F8cGM+Df6kDIM1wMmAfiJL9Z4t7SRaJKI+359CuDJ1lFt81aKtSvgqkoJoJSqDp4dIv8U5Q+NJ8L8moE6rWHBDm9gd9JNfPh4n1dNJsAeZ7zGU3QjGk7ejXbaMX7ny9cLm5R1azmJnX8m/PEdLJ4aAzT9Upsdf/DSzYZfoue+aOszo+VMx2+yDMtm0jpOD/BdcoIyUFTpX4lLuM7hFx6AKCX4Uj/FAa9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Z3jvPo3jLcaJ4TAeiH2gKL2m9YULj4+hgZ//p+CNZI=;
 b=tGXJLZ0nHcSb3oCBtKk4W2247vhSR14pWxTGGKSGIcRDnTv52vC3F02kmGgRkKJCbPncdjVAwVSG06t96ItCvwoTRDqbJ/fvCHLNRo77/OXP7zYw2tHzA8u/sYUM+0KNFncgmvaVk6RGoay4nLWwMtYIm5GukQWcpS7+k+47oeceSARtRBvzAJAPWu/w9c2vULx8Gc7lLiUVCIYVgT8zO1e2YuyeK+iwkqY1wdkyz1inn/hhhzHy/PB7bWffrInsBJkxxBLIo6En/2f6Cm6bpdzeYe02f6YypqS1UG+sflkg3i5fa+GAYyMngM/FQuQBMrDK7vqyd+ELlM+k5xLrWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN0PR11MB5726.namprd11.prod.outlook.com (2603:10b6:408:164::23)
 by PH7PR11MB5793.namprd11.prod.outlook.com (2603:10b6:510:13a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.24; Mon, 18 Nov
 2024 09:48:09 +0000
Received: from BN0PR11MB5726.namprd11.prod.outlook.com
 ([fe80::e484:b723:d325:e5e0]) by BN0PR11MB5726.namprd11.prod.outlook.com
 ([fe80::e484:b723:d325:e5e0%6]) with mapi id 15.20.8158.023; Mon, 18 Nov 2024
 09:48:09 +0000
Message-ID: <2d152b8b-dd5a-49e5-b348-d6c31df6f6bb@intel.com>
Date: Mon, 18 Nov 2024 15:18:04 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t V2 1/5] lib/igt_kms: Add infra to handle crtc arbitrary
 attributes
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20240924142638.238291-1-bhanuprakash.modem@intel.com>
 <20240924142638.238291-2-bhanuprakash.modem@intel.com>
 <20241115172045.ro55eptvlsmdzfp3@kamilkon-desk.igk.intel.com>
Content-Language: en-US
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20241115172045.ro55eptvlsmdzfp3@kamilkon-desk.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P223CA0030.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::35) To BN0PR11MB5726.namprd11.prod.outlook.com
 (2603:10b6:408:164::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR11MB5726:EE_|PH7PR11MB5793:EE_
X-MS-Office365-Filtering-Correlation-Id: b87805ef-56b2-45dc-dbde-08dd07b61c43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V251aFEyVk95d2QvVTRNSnVuVUplbzRZWkZhNlY1d3R6dEhhKzFsRG01NFJJ?=
 =?utf-8?B?TkhDOHVXcFZKeE9NZGY1OFVEOXRRWmsvOUhYRUMvQWtHbGFoVkJWOXN3akww?=
 =?utf-8?B?dXRxWGxMUVNOL2U4S2diVHZBUXlwVm9RRWs5M1JBM1FtSmNxeFpYU2hwcEt5?=
 =?utf-8?B?M3M5L3dPemcyV0pReVVHS2xOZjJQSDRaMDVuK0xXZ1FQK0hPZG1UMGFscTJw?=
 =?utf-8?B?eSt4aDJWZFdmOVVSQzB2WWFJSTgyVmc3RVEzem1FVFhCeFd0a3JqMUhwS0JB?=
 =?utf-8?B?ZHFMaDI4T0JzQksxQW5lY3BQaDBNajBCY2J2NzFic296eG5QR3lIRTFVVUZT?=
 =?utf-8?B?UmQ2N0V3QUltYTV6VndBL0ZQY0dLTm12Z1RmN1g0Q1VJcm5IMS95YlJJcHlH?=
 =?utf-8?B?YVRFa0NqbW95Nkltbzl4V0hjbkFWN2xMM1NBSTdHVmtwWTE3WFladC80ZXda?=
 =?utf-8?B?cnBINEdJT3NBTnM4WFVkRE11M1R6U1lYekZYZXhlWHRSYW1TY3UyVHhqcE8w?=
 =?utf-8?B?V0hCUDUzTWtBQ0NSRmVVd2lLZWhLZlZDbU1ZeE5wLzd5VkJHamxLckFWWlg4?=
 =?utf-8?B?WkhET2liRS9GenVKTVNJUHhZYnJYRkkzc3IyRlZodmIwWWMvM0NVNEkzVm5B?=
 =?utf-8?B?cFJzOE5uNlJsUkc5SDdIemJ6S2ZBQjdYcDEvdXNUMTRHVTdCbVhZMFdlZUU1?=
 =?utf-8?B?bUlNOGlTZ3BwTWRmTXZlZDFDNlJ2ckwxZTRxVFhCWUM5OWgwb2ord01Sam1U?=
 =?utf-8?B?bTlsS3lpYWlpYTB3Ykc0MkhoU2NWVUI1c0cwRko1N1hVWjE1ZUVSdUJROWcv?=
 =?utf-8?B?a01nTDcvVXRySlZhQkJDQWE3aUIyVW1vNXZkcVRIaisrWGp1Uk9sU0V0cVhL?=
 =?utf-8?B?eXc3VGJNUHBoS0VuK3RodWFTYmZxYXhBa2FweE1nbVRRcmVWb3NpRW4rTGxV?=
 =?utf-8?B?VnhCcDZuTWU5Y1krbEpLQ1NSWWZzd3p0MjIvUHAxdHg4ZEZWNkpyR2l3aUJj?=
 =?utf-8?B?SmkzbCt5WmtScjF2Sm5CWXZxczVKTnhOYUtDemh6OXZGZStXWjNaUWxLMlJZ?=
 =?utf-8?B?SCtaZ1huOVpIRXZmM0oyQXRFdnA1dnhyZmphV2JiNElLL3gwMWdLME9JdzJM?=
 =?utf-8?B?Sko1TFdKY3BoZURZcFBIRXFVb3hISUpmQitGOXZ1QWRHQnY2NzNUNE1ocklh?=
 =?utf-8?B?NWtrQitNZDRjREtFNlpBZmdPdG1UUjc1QnZQcWV6alVuR3ZCK0FjRXNRa1VY?=
 =?utf-8?B?N2ZzRXRhSFkxaDNMSDhyaUNWQUR1TDN4eGptL1huWUd3eTUxVWZPRmVpVHNW?=
 =?utf-8?B?YTZ3c0tLak5NM0tmYXhnU2k2Wld5SkxJQm9WU0pwb3ZUOWduSG9Vc3JHZ1lo?=
 =?utf-8?B?Y3dIclU1RnY3bFo5UUVCREZyUWdKRDBiMzhyOU5kMlJRR3RUMTYreU1VK1BT?=
 =?utf-8?B?VnVUUnIvZU1HUUwvczBweFdUbzNxc2h4bWdXYnI3WjhsalA2RVlKOXg1bGl1?=
 =?utf-8?B?L0F3Y2I4RUpST1FqaEo3SjRlVTRKUlJWVDJuR2NBUWdyaDFnNCsrc0ZUaTlP?=
 =?utf-8?B?ZEFaYy9QVCtiN09xd1JKaHQwM2gxNTFPZjREWjNNMDZtMjJLSTY0cGhxVTRV?=
 =?utf-8?B?bklGVm9TY0RKUFEwelBZYmhCQUJsTU9JSkJUdVRUWFpuZTdudGlRN1IxbVpm?=
 =?utf-8?B?OEFZZFprUktwZ1pSTFRCSmcwcnowNmtNdThPb0ZnSDJ2MDBkellNY1VJQ2dV?=
 =?utf-8?Q?TQ4lHznMEDwRaQu7pE6r1fTlrZ9L30y0SdRjMJF?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5726.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?czU3Wmlza0ZmQWlheStWNFFBR2VOby9vVXZnZWRQRWMrMDJCRm9XL1lRVmpF?=
 =?utf-8?B?UHJoUHphR1JkQ0tvdXl1QmZjT0FZckc0K0hXYlpWYXNqVnova1hWaFpaQ3VU?=
 =?utf-8?B?anFpYmY4VW9CR3pOKzFjVDAwVGpkeTV2bDk5TEZHWmtxVnFqMWNXTTI2Y1ha?=
 =?utf-8?B?VGJJaDlKYnQvaGo1YUxHL3pISHlYdHBhZGZVKzZRTmhRTzRFcStXOGxzV25y?=
 =?utf-8?B?K3A2eER1cVpkZGppc0xkbUdCS1pveDlMOGNiTnhmZlIzcFBhR2h3WS9PVDgw?=
 =?utf-8?B?MUFEaEJMTTRsdjh1cjZnbU42TFFZT3lpeEo2aE12Smo1U0VKZG9aZWxySGJx?=
 =?utf-8?B?bkNzVmZhSllqamVlYzY5OGJreStuN3NOSTAveDI2NEU0U0NwM1NnT1RDZGNP?=
 =?utf-8?B?R0k5L1B2OFdXSUJLSjBWMVNMcXNzNyt3Q0xNYVNZQ1lZN05xaDdiUHFNNnF6?=
 =?utf-8?B?Q3UzbUN3UUJEU25LWHJkWWgyaGJuQy9QRTIrMHlhMmNoSzNkNGw1ekE1dW0z?=
 =?utf-8?B?SWJMU0swL2sraVlZOWcwSHdadlkrUlBXMTB3clkwTWZiVlNxVExONDhnZlF2?=
 =?utf-8?B?eG45SndrUVVOQ0ttZGh5cE9pMnJkc2VtL29BTWpvUFR0MXpodmx4MUs2WlJK?=
 =?utf-8?B?NXJueEIvQUNoSVlvYkpUQXBreE8vT1pad29XYzU4dlVEbHpNb1ZuY0ZVZVN4?=
 =?utf-8?B?ZjJYZXhPeThMU3Y3ZGE3TWo0cEFLUVk3QVFXRUdEbHorV1Z1dUd3T2FpMjIv?=
 =?utf-8?B?cHp0VFFLQkJ6Z2w3Z1lPVm56YVlzTDJCdEU2UVZkRE9IT1ZNTFZmUWZITnlJ?=
 =?utf-8?B?U2QrelZaeGN2aDdrZVgyQVl3MkdnMWVKWmUxY1JmRHQ4b0kybk9CQ2Y2a1dY?=
 =?utf-8?B?RTNZazUwamJIYXQwVEtZN0lrdzl4TTl3Q3hEMTdvUDdEWmJvWEJncXZLc0Ri?=
 =?utf-8?B?ZU95MXh4eWJnb0pubnRCNG9KRFdYOUdnQVNlbDZzUk1ESmZpTWczaG9ZbTlQ?=
 =?utf-8?B?eGdicFBvU08vaVVRaDVjU2J3ei94KzhDelZIVHMydTRob3g1ZFVhMWJrUVJB?=
 =?utf-8?B?YW5wV3NNMjNiVXZwU08wVGFOQ3FWeFMzRENJbjlkeTVpd1ROMXVnVEZ4aXpp?=
 =?utf-8?B?ekR5WVVNMFUwUmtEcm5xSEFhSnVxbGFvTUR6cDdidFFOTEpGOGNDb3ljcUtj?=
 =?utf-8?B?bkJZMWdSVm1ER0xnSmhXc1AweFM2MjJlQ2craHRRNUl3T2ZMSHlEUnBWRmFC?=
 =?utf-8?B?RFBQQ2N4UmowcEMyRUM1R0FaRFB2T2dhNVoxWVZKMTRBdEtIc1d1MnhucU5i?=
 =?utf-8?B?SlBTNUN0RVl4UFIzWHB4bWI1SFdSTlFVcGdUNGU2YnpjWEpsUHRDblJ6RzBP?=
 =?utf-8?B?cGFJOGRaWnBVY2VjY3c4azVLdCtYcExmaEpXQ3Rya3h4VmV3T2EveVBLQXdw?=
 =?utf-8?B?dTVmRkZodjFrbWNNRlQ1RFh1RDRIVCs2VlVrM21qM1FPUWhaUUZCQXpoNC9T?=
 =?utf-8?B?bW1vdjFaSVN4YUU3OHZmYzZ5UkxYMEY3VEEwYmFlU0YwVVRpMHR0YWZFSWl5?=
 =?utf-8?B?YWRvdW5GZU1yZ1BoY2JpcHBoZFdXMFFld01DM2hBK1FwMTFGQnIwNFhkYWNX?=
 =?utf-8?B?aHh1dkxoekg1UjBFQ0ppQStPRHkzNjZvQWl2eW91TUFmN295TlljYS9La1hz?=
 =?utf-8?B?U1ZsL2pCd0J0d2RWZXN6RTRveXVoaHNVZFgxeTRRcUJVNy8wRjRUT2VKMWFN?=
 =?utf-8?B?bTRJcDcxeFcvTzdlcmczQkZWaERDOG45V05Gc0hlUG5jWHNRVEVibWFNNTEz?=
 =?utf-8?B?cTl0TjczeXFWY1o5SEo3TzZtRXp5d3FjZjczMnpCaEZRWG1oWUcrYUV3Y2N6?=
 =?utf-8?B?Z1M2cEpZdmF0bi95WGtmWUhGN1NBSDdlRXZyMGx2U0U0UVY0R2NlTWRJME5Q?=
 =?utf-8?B?SDQ4RTByMjc4RmRncy8yRVR4VnFDeEwybGJVYTl5ekZTQ0Vja1RTTk5IZEZp?=
 =?utf-8?B?Rkh6KzNka0lvWWJFUUpMREhsdENSbnpHRlRCZDdDZkhQajZHZWdYcWE5cUhi?=
 =?utf-8?B?UGZLMXo1QXlFbmpGejQ4SnZGeHZvemxmZ2dpeVRXU2xkSzhNQlFSbzFGTHZv?=
 =?utf-8?B?bmtQRmV6L1BYUmRobXZCVThCSHlqNjNTc21zT3g3VEY3ZFVPSTdCc05IejNo?=
 =?utf-8?B?VUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b87805ef-56b2-45dc-dbde-08dd07b61c43
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5726.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2024 09:48:09.7392 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K/Ib5tPgkdqthqAIUH4aR7LXs+rMpcnP3SDuf5IHQaSWOzK27eNqFZSyqbuihlpUZMh0J+VHvmkPUzqdv7CbH32A8lukDPXahPy2MxGz6LM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5793
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

Hi Kamil,

On 15-11-2024 10:50 pm, Kamil Konieczny wrote:
> Hi Bhanuprakash,
> On 2024-09-24 at 19:56:34 +0530, Bhanuprakash Modem wrote:
>> We may want to poke at various other crtc attributes
>> via sysfs/debugfs. Add a mechamisn to handle crtc
>> arbitrary attributes.
>>
>> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
>> ---
>>   lib/igt_kms.c | 150 ++++++++++++++++++++++++++++++++++++++++++++++++++
>>   lib/igt_kms.h |   3 +
>>   2 files changed, 153 insertions(+)
>>
>> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
>> index b40470c02..c22cdb602 100644
>> --- a/lib/igt_kms.c
>> +++ b/lib/igt_kms.c
>> @@ -92,6 +92,7 @@
>>   #define DISPLAY_TILE_BLOCK 0x12
>>   
>>   typedef bool (*igt_connector_attr_set)(int dir, const char *attr, const char *value);
>> +typedef bool (*igt_crtc_attr_set)(int dir, const char *attr, const char *value);
>>   
>>   struct igt_connector_attr {
>>   	uint32_t connector_type;
>> @@ -102,7 +103,16 @@ struct igt_connector_attr {
>>   	const char *attr, *value, *reset_value;
>>   };
>>   
>> +struct igt_crtc_attr {
>> +	int pipe;
>> +	int idx;
>> +	int dir;
>> +	igt_crtc_attr_set set;
>> +	const char *attr, *value, *reset_value;
>> +};
>> +
>>   static struct igt_connector_attr connector_attrs[MAX_CONNECTORS];
>> +static struct igt_crtc_attr crtc_attrs[IGT_MAX_PIPES];
>>   
>>   /**
>>    * igt_kms_get_base_edid:
>> @@ -1802,6 +1812,125 @@ void kmstest_force_edid(int drm_fd, drmModeConnector *connector,
>>   	igt_assert(ret != -1);
>>   }
>>   
>> +static struct igt_crtc_attr *crtc_attr_find(int idx, enum pipe pipe,
>> +					    igt_crtc_attr_set set,
>> +					    const char *attr)
>> +{
>> +	igt_assert(pipe != PIPE_NONE || pipe >= IGT_MAX_PIPES);
> 
> Why not return NULL for PIPE_NONE?

If we return NULL from here, crtc_attr_set() will allocate some memory 
which is not an valid case. So we must need this check either here or in 
crtc_attr_set().

> Also imho better:
> 
> 	igt_assert(pipe >= 0 && pipe < ARRAY_SIZE());

Sure, will do that in next rev.

> 
>> +
>> +	for (int i = 0; i < ARRAY_SIZE(crtc_attrs); i++) {
>> +		struct igt_crtc_attr *c = &crtc_attrs[i];
>> +
>> +		if (c->idx == idx &&
>> +		    c->pipe == pipe &&
>> +		    c->set == set && !strcmp(c->attr, attr))
>> +			return c;
>> +	}
>> +
>> +	return NULL;
>> +}
>> +
>> +static struct igt_crtc_attr *crtc_attr_find_free(void)
>> +{
>> +	for (int i = 0; i < ARRAY_SIZE(crtc_attrs); i++) {
>> +		struct igt_crtc_attr *c = &crtc_attrs[i];
>> +
>> +		if (!c->attr)
>> +			return c;
>> +	}
>> +
>> +	return NULL;
>> +}
>> +
>> +static struct igt_crtc_attr *crtc_attr_alloc(int idx, enum pipe pipe,
>> +					     int dir, igt_crtc_attr_set set,
>> +					     const char *attr, const char *reset_value)
>> +{
>> +	struct igt_crtc_attr *c = crtc_attr_find_free();
> 
> c could be NULL here, if find_free() failed.

I'll fix this in next rev.

- Bhanu

> 
> Regards,
> Kamil
> 
>> +
>> +	c->idx = idx;
>> +	c->pipe = pipe;
>> +
>> +	c->dir = dir;
>> +	c->set = set;
>> +	c->attr = attr;
>> +	c->reset_value = reset_value;
>> +
>> +	return c;
>> +}
>> +
>> +static void crtc_attr_free(struct igt_crtc_attr *c)
>> +{
>> +	memset(c, 0, sizeof(*c));
>> +}
>> +
>> +static bool crtc_attr_set(int idx, enum pipe pipe,
>> +			  int dir, igt_crtc_attr_set set,
>> +			  const char *attr, const char *value,
>> +			  const char *reset_value)
>> +{
>> +	struct igt_crtc_attr *c;
>> +
>> +	c = crtc_attr_find(idx, pipe, set, attr);
>> +	if (!c)
>> +		c = crtc_attr_alloc(idx, pipe, dir, set, attr, reset_value);
>> +
>> +	c->value = value;
>> +
>> +	if (!c->set(c->dir, c->attr, c->value)) {
>> +		crtc_attr_free(c);
>> +		return false;
>> +	}
>> +
>> +	if (!strcmp(c->value, c->reset_value))
>> +		crtc_attr_free(c);
>> +
>> +	return true;
>> +}
>> +
>> +static bool crtc_attr_set_debugfs(int drm_fd, enum pipe pipe,
>> +				  const char *attr, const char *value,
>> +				  const char *reset_value)
>> +{
>> +	int idx, dir;
>> +
>> +	idx = igt_device_get_card_index(drm_fd);
>> +	if (idx < 0 || idx > 63)
>> +		return false;
>> +
>> +	dir = igt_debugfs_pipe_dir(drm_fd, pipe, O_DIRECTORY);
>> +	if (dir < 0)
>> +		return false;
>> +
>> +	if (!crtc_attr_set(idx, pipe, dir,
>> +			   igt_sysfs_set, attr,
>> +			   value, reset_value))
>> +		return false;
>> +
>> +	igt_info("Crtc-%d/%s is now %s\n", pipe, attr, value);
>> +
>> +	return true;
>> +}
>> +
>> +/**
>> + * kmstest_set_connector_dpms:
>> + *
>> + * Dump all attr state on all crtcs.
>> + */
>> +void dump_crtc_attrs(void)
>> +{
>> +	igt_debug("Current crtc attrs:\n");
>> +
>> +	for (int i = 0; i < ARRAY_SIZE(crtc_attrs); i++) {
>> +		struct igt_crtc_attr *c = &crtc_attrs[i];
>> +
>> +		if (!c->attr)
>> +			continue;
>> +
>> +		igt_debug("\tcrtc-%d/%s: %s\n", c->pipe, c->attr, c->value);
>> +	}
>> +}
>> +
>>   /**
>>    * sort_drm_modes_by_clk_dsc:
>>    * @a: first element
>> @@ -5459,6 +5588,27 @@ void igt_reset_connectors(void)
>>   	}
>>   }
>>   
>> +/**
>> + * igt_reset_crtcs:
>> + *
>> + * Remove any forced state from the crtcs.
>> + */
>> +void igt_reset_crtcs(void)
>> +{
>> +	/*
>> +	 * Reset the crtcs stored in crtc_attrs, avoiding any
>> +	 * functions that are not safe to call in signal handlers
>> +	 */
>> +	for (int i = 0; i < ARRAY_SIZE(crtc_attrs); i++) {
>> +		struct igt_crtc_attr *c = &crtc_attrs[i];
>> +
>> +		if (!c->attr)
>> +			continue;
>> +
>> +		c->set(c->dir, c->attr, c->reset_value);
>> +	}
>> +}
>> +
>>   /**
>>    * igt_watch_uevents:
>>    *
>> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
>> index 25ba50916..97efbefa5 100644
>> --- a/lib/igt_kms.h
>> +++ b/lib/igt_kms.h
>> @@ -1085,6 +1085,9 @@ void igt_pipe_refresh(igt_display_t *display, enum pipe pipe, bool force);
>>   void igt_enable_connectors(int drm_fd);
>>   void igt_reset_connectors(void);
>>   
>> +void igt_reset_crtcs(void);
>> +void dump_crtc_attrs(void);
>> +
>>   uint32_t kmstest_get_vbl_flag(int crtc_offset);
>>   
>>   const struct edid *igt_kms_get_base_edid(void);
>> -- 
>> 2.43.0
>>

