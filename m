Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 784E4D65C42
	for <igt-dev@archiver.kernel.org>; Thu, 14 Nov 2024 06:07:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3527510E33E;
	Thu, 14 Nov 2024 06:07:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M7mYBCnM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C75AA10E33E
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Nov 2024 06:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731564425; x=1763100425;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=tLYdRatm7RnW92+EWKMquwCOUHvGHnnhgK06VkJI34A=;
 b=M7mYBCnMWBCXJpzZBYcQUbAWczom5jIidQN+RvTiIAFxyUmdYk8LbTYh
 GxpONAbKjizWq7Oqm5iAcNPfn1g3hPhVFjGmbgFUUmS7cWSW275wpMoME
 /TL/fIr5lpSVU83eg1JPD3Ly2RxArImtQXT4kcuZ/Ul+UriNnBXW615Tn
 F+k4V1gcfSnKbVc5aqkK/HtrioLx+BZgAPnnjuBCGAsmGWfyi+t+O1Yu3
 FqRJLzg/0Shz4ANC2t7S6N7blzXKlvJQVdasVcRw0D8m+o/BqU03vBR0m
 kw6+yi6zw9adSWGtOaFIm2y9YHaEgj6+ZI0dW8lnk+aUmPAPTHGAC2TnR g==;
X-CSE-ConnectionGUID: gJ2EIsiRRGe5xlq2l5S3vw==
X-CSE-MsgGUID: qDHK+4kuRG2Y03RMaD+9pw==
X-IronPort-AV: E=McAfee;i="6700,10204,11255"; a="30892240"
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; d="scan'208";a="30892240"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 22:07:04 -0800
X-CSE-ConnectionGUID: XzyX8ohfSYy/t0upDwxRqQ==
X-CSE-MsgGUID: 9tFYPJVGSW27geEcB9pHYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; d="scan'208";a="88079897"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Nov 2024 22:07:04 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 13 Nov 2024 22:07:03 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 13 Nov 2024 22:07:03 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 13 Nov 2024 22:07:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qfe49wpZITUOvwNg11B/NIBmIz2riyUuKJ1Pn0j9RY+XBy3dZ6vn9z/3f/rVdRJ+FBH+aXF0n1Lt1S4sg8lEg9EyvGSzbo8Tm/6zBdxrFVXkw8bIFsotbnePvHQcmEITELE8tGPONUpFdXFqM89TG+UJa8IMVHlICR7C9UNtYAtMxO1ysvVlVOrKUgpS2q+M8zuC16t8HBZ/HLlwV8HypJps+vLe0MOuWgx/4RiRkPru6u1Khh1iz5qnGpLvP8ODOXVe/MWylPABCPDpyE76ikeRFrY2YMwC+xcxVu9MwTz7ddjEpyTzfBTgYaHP2osKyR4qqZaAFY5ppY0lRSiWdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eW7+eqyJn8+eNW6Rdj4WINYWOs8Cm/DnDomqyvurK30=;
 b=y3WiSEAFmkUM6QrV1kuHkwJSlwbDtH7q8tcnenibmVh8KKuTcAWu7Oeb58jlVE6oICqzdkXFNP4r+k0vvapTTNPUFbtHr6feEQamM2CMGk95uvQUHCcmsyky2ofFemej5nfb2JvYskAgdYrk1hDgaOCogGNwWvy4fSHuPew9ZYRQhYRM09IeTOscoJTiXLWcWmzMgIwgYYTTbvDXuQqWgpjwCwo7Eyocbh41P8yOED3cThMUqOI+5jSBJlGvLjBfPMR96ENrbhlwzz3rSEqt8Iihgt8d1fKTZoJh4G86DHgljlnGLGNcC1qeMc6zlQi+1CoWfdyygHPnJWAjYleEQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by CY8PR11MB6891.namprd11.prod.outlook.com (2603:10b6:930:5c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Thu, 14 Nov
 2024 06:07:01 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%6]) with mapi id 15.20.8137.027; Thu, 14 Nov 2024
 06:07:01 +0000
Message-ID: <ec09d4b9-990e-43ec-a3a8-7600dcbc3f30@intel.com>
Date: Thu, 14 Nov 2024 11:36:55 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/kms_dirtyfb: Add skip condition for bmg
 platform
To: Mohammed Thasleem <mohammed.thasleem@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20241113174118.158849-1-mohammed.thasleem@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20241113174118.158849-1-mohammed.thasleem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0120.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:27::35) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|CY8PR11MB6891:EE_
X-MS-Office365-Filtering-Correlation-Id: f0dc4115-03b1-40c5-f154-08dd04728dda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZTQwa1UzWkcyVGJYRGFjYStqSldnMERTV3B6a0FXVkh4YmFpZ3FzakcwdTRW?=
 =?utf-8?B?cng1VWhVbkphVjVmWFI2dVN4cGlPUjlGdnV2WkloWlVkM3BiTVZ2WWRTMG1C?=
 =?utf-8?B?cUhSQWxrRlY2UFhkdXh2VnU5WTF0TE9WYUdtVGN1ckFVVUdvZW1ZTGZudG5T?=
 =?utf-8?B?Nkk4VjJ0V0lUY2ZVaXR6L3FCc0MySEttNUpZQVgxWXhOZk10THhOcXpFVXdt?=
 =?utf-8?B?enpkUjFUSnBFNklHbHNlK1ZwRnJadS9GWnplbVU0bnVmSDFlelVFMTJhMnlh?=
 =?utf-8?B?ZmhCODlkL0ZTMzlRN3FsRzUzV2ZpRkVVZWJYcjZ6L0tZVWV1MHpxMU1RWkd0?=
 =?utf-8?B?Z1hVdzBJaXg5cDNCbmQrdmIvQVpsL2p0WmVFZW5GTks5UkZnSVFHR2tZRHgw?=
 =?utf-8?B?YzdRTlZQaWpOOXdIZHJuRVZiSGQ3TnRZZHJoRVViVFp1ZkE0dldFWVFuT2Er?=
 =?utf-8?B?ODZHeTVrMFlZekNYSDltOTR2VWZ1WHMvZFAzdjdUdjhOcy9nMVBOK3YwRXQ4?=
 =?utf-8?B?bXgvMFFTNkhTT3BKUmszMjRJankxM2RhU1pQUEFqTGJQejBlVTlRSGsvOUNJ?=
 =?utf-8?B?M2gyMzgzNFV4TWZnMUVHV013bU9wNytNaldFTWt1K0M5ZDlhZFFsc1J0eFRF?=
 =?utf-8?B?emtrMGR2RXpQcWJOb29oc1p0ZnVrUG5LcW5ieE5tdlppNU5RRGZyeG14Vkxs?=
 =?utf-8?B?d1FlYmZ6Um9oNGNNK1hvYjlTM2pidWptQ3VKWFZBNjI2U0NvN3plSThuS3RQ?=
 =?utf-8?B?OVZYTnVEVzBScmUrQXJQY3VmdTd2YU5GclRuNlpXQXE4OVY4eGdKRTI0TTIw?=
 =?utf-8?B?aWNGVGV4Q1R6andvOXNTN0t2a2ZGSUl4SCtzbnhwUDFERWtZalQ4aklNbFJQ?=
 =?utf-8?B?U0FmVDNPV3NwQlFFZ2xTWXprSDhMMnNNMFJGK2p2NmJMUmxmanZCbDF4emQ5?=
 =?utf-8?B?MVZ1TjkybVd6bGdMS0VBZ1lzMHRPNzZyb1Y1Z01rZXhmYlRrMk5pSmNQcWJ5?=
 =?utf-8?B?ZWlTRnVVMzFFQmVZZWJtWmlvQjRzc0JDQWY2bkNZbkFYM3R4RE1YQWZ6cXJG?=
 =?utf-8?B?M3BNY21BbGRWc05Lc3NmQ2RqMEd4L2VieFlGaE9TVXpoSWg5dFdmQncxclMx?=
 =?utf-8?B?SWpVOG9vUGVpemZUekFzcDRrcmtRWVpPa0JmS1JQRnZzWDBwZHJBTzJtVGFT?=
 =?utf-8?B?VnlyRSsvVTBXWUp5WUFhUjhlWWJDVm9vaG1oK0dRcWR1UlhtK0FFMnU0UnQz?=
 =?utf-8?B?YjZGbTN0N1c5aldNNUF4N0xlRkV2b2NnLzFCQ2NxQXNPUmRBdWNDeXB1bzVD?=
 =?utf-8?B?QmMvYjlTZm55MFAvREJ4VWozVHpLY0Y4Qk1maVh0NzYzMUZOVUt5WmtjeWpC?=
 =?utf-8?B?V0lBSkI2VGY1SXVqVU15Ym4vL3BKQVpobTdBc2kvbTV4UUJwZ3ZMSGowc215?=
 =?utf-8?B?R3luN2FsMUJ2U2RiWnBKUExIRmF1OTZFVnQwUUNMb1VuTExlNy9uSmUyVkhj?=
 =?utf-8?B?VXNBOEY4bEZaS0ZHbm1KMk5vejg3VGxjakpmVkt0amVBeWhKbEZnQzF6Mk9R?=
 =?utf-8?B?L2hyVTBRQkt6SlhiZG5PRlhlVmlPbElJdTlYbEZKZWhsT2lYOW5rSDZFaFBu?=
 =?utf-8?B?Njh6SXdDQ1pHN2pNV1ZIdFp2bWlZS2JwY3N1U1dTaVZFK1NrTnRqd0t0bXhV?=
 =?utf-8?B?eG12b01XMHhXdWwxSzh3aWpmY3JqNjBkQjV5TTl0eG41S2xwRUJ0eklKOHYz?=
 =?utf-8?Q?zYB/gBgeEZByKhdSlvNV3vfiOW2TXA84kbt50O+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?enpRdk9ETjVJMUF2aW5OeitCcW01ZVNQV0RROStWSzhNWDhzS3N3WUNGVUNF?=
 =?utf-8?B?bDdqQ3hQWTJlbEdKaGJmc29mdGpGMWJGZERFTGNkTW9TVHV4a1hhazIwbzlB?=
 =?utf-8?B?KzlQS1pqY0hPOHZDWHhzNm5IWVZ3S3VnbWUzdVNHcTc4RXBicUZsTVo3UWF6?=
 =?utf-8?B?dS9QNE83OStEU2F3b3Rsdkp0RjdyTGFyeEdKdWdBME9mYnl6QmY3RmhsZXQ5?=
 =?utf-8?B?UGw2TEN4QjZNZUZTVFZKaDA0aXJyWThVaEc5OTEvZGluV1ZTRDBMVjZJelFk?=
 =?utf-8?B?RDl5aGhRSjhaZXk3RE9LU2dxTXNJV1dtVXVMT3RkTmVTdU5wWTRwUUVRZm11?=
 =?utf-8?B?VUFTZjBQUzFvYnk5OXlHME9mT2svMFdGd2hJdjFQK08zZUlVUmNzd1NYN3Mw?=
 =?utf-8?B?NlB3NjJkWDVzdzByaStzNEtPMjhIc0JWVE5SQmE2Z2xzTmkzZEZsNTFDZEdP?=
 =?utf-8?B?ZS9Yc3NEL2I1b3NsRk5BM1VPODBHcHh4eHk0RFR2N3haVFk4WDNlRVYwTUNp?=
 =?utf-8?B?YjJYdGFTRHNnMUhPS0wycWl3T0VxTWdGZTNmbTQ0MzVQeS9wNE9oT1hXZjky?=
 =?utf-8?B?N2VRUGVsUmVSanRoekdkL1JMQUIxQWE1MVBtQWZRRmovVytyUW5rdzBYUXZZ?=
 =?utf-8?B?emcxK2JaWGhnREp5UzFyNlRtZ0pCdTE5SWEvZjBicDZJN0JzU21JNlZ0V2dy?=
 =?utf-8?B?Y2pxS0lxaUl2dHNhTmJzWE1DTVlwcW5nL2VzTUx1VEF5VVAwQmMrMGFwMjRT?=
 =?utf-8?B?TmdvOWJ5N3JZY3BxTVlJNVVsOU9IRE1lV09Dc2Z2bmV0dENZcG81K3BlcTkw?=
 =?utf-8?B?QU9USEFXM2pKaWpWQmpQM1paenJqM1MrejhSdTJId21mUmwrbjVaVU5WUDBz?=
 =?utf-8?B?aWNwTFVTN2RnNTJPRVo4OHlrYm53bzlQUEIySUxTRkVuWjk0UjcwajRxUWJV?=
 =?utf-8?B?bkVWT0NFTUtxeXBrRW9ESEhQbTQ1U2tjVExhTG9UQ1FVMmJqZ0dzZDA3QVVH?=
 =?utf-8?B?YnhFZVA2QmhjSDRWMWh6V1llSHZkS1BTWVVna1VRQkZ4ay9MUzNHMTBlQ3Qw?=
 =?utf-8?B?S21rd0xCLytCa0UzTEtWL3NTNVNJd0xTbXE0ZUMxWWV2VWF4UzhpY2ZlNHV1?=
 =?utf-8?B?OEJKMmFVU1dqVHdqU3VicjZVRHJHemJZcjBRL0xxSGdXVmxWNFd5ZVkwd0lO?=
 =?utf-8?B?c1F1S0VWbHoveHhxcUpKT2kxZmdPcXZ4MFIyUUYyY2J1cmVjYmt1ZkNveFM0?=
 =?utf-8?B?dERwN2tQU3R4ZWh5SWVzcmZlSTJreDltT2ZtNFg4VDJmaC9wSDNISmV6NXZW?=
 =?utf-8?B?UUYzNjk0Um9kckZPWEM3UFFWajR6T0lucEZJaXQ3UHdqcHZYQURQZjJSUkdz?=
 =?utf-8?B?YnpaN2hTb0pJSEJmNW9HaklVWDYrelpUTm1yL2ZNMVNQcnFnaU9kR1pBelds?=
 =?utf-8?B?MWNKZmFGcEVkSjd0N1hwS3BUU2hVZ1VFRmJVQzJyWm9LcUdIZVk5MFMvZU15?=
 =?utf-8?B?Y2s2dy9YQ29CTVJlb3NRNHhEWGVWVE1taHNQYzRGWlhoK05rdDVLSWYvN2lV?=
 =?utf-8?B?aytGcGdYZWN2WTMvb0p6V2t5NXRUeE1YNGN5QWhWVHlYLzdqWDE4VnI0anU3?=
 =?utf-8?B?dmRhOTBYaXN4NTNoU1gvcnAwUmQ0Qk5DQTRNTmV2WXFScmZQaHJ4NnUySGZ6?=
 =?utf-8?B?bDROS2lsQ29lMXplaEdMV2pZMUVZVFVIdldDU0VNcS9pTUlRZW9NZ3h3YW9U?=
 =?utf-8?B?T1RCRE1JcHUwMFVrL05KNEtDS0pxcU5PcmZsV1dpV1pBemxSdGJ1ek5DM08x?=
 =?utf-8?B?ZnQxNG85ejFnVzgwbWxsQU4zdndJTnc3S0phTSs0M0RsSzJXVXRZMmJCcTU0?=
 =?utf-8?B?RHRUSXVobnlBSjBWUW82NjJVa0dnaVZwRkFmbDNsRFJDN0FhbWFVWHJadUZL?=
 =?utf-8?B?bC9neklJSTduclVlNFFBa2trOWdPS29PMkUzMWFncnNaUEFJdVo5am1zcTJU?=
 =?utf-8?B?VjRnem1vbFFWT3FRcGxSdWQ3YXhpMXk5ZUZCRlJtRC9VNEFVWm14d2wrWGd0?=
 =?utf-8?B?eVBlclk1ckpsT2JRakZBcVpibjRRN0M4T1I0OFpveDljT2hVVGY3d3B6S1Fv?=
 =?utf-8?B?RkxhRHJkYlRBYU1EZVI0TE0xMnY0QkV0SzM0MU9idm5ncnFIcWVubitDcnhB?=
 =?utf-8?B?Tnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f0dc4115-03b1-40c5-f154-08dd04728dda
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2024 06:07:01.2217 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 52qi2/SY5NdPeLzbWG2Zzhzd9z/1tkEl6yOQF/AyKEhNFwASjsmaWkirDwa9+jXu9Qqm4XvCGZ1k0y3iDK/52w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6891
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

Hi Thasleem,

Add bspec id. in commit message.

On 13-11-2024 11:11 pm, Mohammed Thasleem wrote:
> FBC test isn't supported on bmg, skip the test on this platform.
>
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
> ---
>   tests/intel/kms_dirtyfb.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/tests/intel/kms_dirtyfb.c b/tests/intel/kms_dirtyfb.c
> index 35df9be3b..e20fde777 100644
> --- a/tests/intel/kms_dirtyfb.c
> +++ b/tests/intel/kms_dirtyfb.c
> @@ -54,7 +54,7 @@ IGT_TEST_DESCRIPTION("Test the DIRTYFB ioctl is working properly with "
>   #endif
>   
>   typedef struct {
> -	int drm_fd;
> +	int drm_fd, devid;
>   	int debugfs_fd;
>   	igt_display_t display;
>   	drmModeModeInfo *mode;
> @@ -345,6 +345,9 @@ igt_main
>   		igt_display_require(&data.display, data.drm_fd);
>   		igt_display_require_output(&data.display);
>   		igt_require(data.display.is_atomic);
> +		data.devid = intel_get_drm_devid(data.drm_fd);
> +		igt_require_f(!IS_BATTLEMAGE(data.devid),
> +			     "FBC isn't supported on BMG\n");
>   
>   		data.bops = buf_ops_create(data.drm_fd);
>   		data.rendercopy = igt_get_render_copyfunc(intel_get_drm_devid(data.drm_fd));
