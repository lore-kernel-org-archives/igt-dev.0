Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E15EDC021B8
	for <igt-dev@archiver.kernel.org>; Wed, 26 Feb 2025 23:43:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B6E210E9F5;
	Wed, 26 Feb 2025 23:43:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AWj/q+MA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3C8E10E9F4
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Feb 2025 23:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740613380; x=1772149380;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=l8gXHTMEmX+Zo0HOf8AUHR/KEshPJq/xn3ECppsEKJk=;
 b=AWj/q+MA8lwHk80Pw60D3Ts5f/ezbBJc2bFsuUW5FcnIAHD8edb+AOTJ
 d0ilWtJ9F12/YZMW5PeFhqnZkoTp3ltDRlll0djZ2G3bEMTWSAgBWFi+9
 nf0W7te6sdXhNQN0IgBN0FRcB3a18geKhY85LCOzhvMvWaCvZovXUOQPp
 vdebNseWhZKRCKfkhOrq9XjsLj4W5xWQzyV2cZO1zFnlqdsicbpJJfX/+
 n5Hc86dIPoEj3WGbfnL2HR3omwQYzgEOUkWMUFj5hbDXiLZ6D27m6znAx
 jQQedpDlLl6qJyVxlL7ci8eMNvA+nbv9X75eZGjV4bqIFTgizq9W0/LmY A==;
X-CSE-ConnectionGUID: aOaBG6yVSCW447ZCrg4+ow==
X-CSE-MsgGUID: cqmfyK8/QZ+8sG6YGUpCxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="41367413"
X-IronPort-AV: E=Sophos;i="6.13,318,1732608000"; d="scan'208";a="41367413"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 15:42:59 -0800
X-CSE-ConnectionGUID: bjVdjJ99RlW4qn4pck54oQ==
X-CSE-MsgGUID: EQOCekKSRTm+KPU5S6klmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,318,1732608000"; d="scan'208";a="147675997"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Feb 2025 15:42:59 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 26 Feb 2025 15:42:59 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 26 Feb 2025 15:42:59 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 26 Feb 2025 15:42:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C+VvY0RbKx8YeGhmuhyHFnwkoTuaiEAnV5TcdcvWLoy/OrnfCspZXzXf6+LwEeSQRls4QYQxNWzEj4C0ejvPsOsSU4dhjVezSocstKeUswGncqkPEFiPF2LtJdX9hUViKpXN9/a9S8uWML/eaWsaQ/9uCOkbwQIvoCGcIdJzcG1X0E1KQwHu8qkQrrS2UGql1xmOFOULL0lHdc1gRIgDWIATwveQ2DeTl1nVXXWFNsiQuydEatTH2HA3ioSJ8gCsKf3BEsPtR3fkJwjLheLY2kfbIdPCrTQ1IgvcTMY5KhOm5vHSMqxsl5Hl492U+MVThYlKAQv9yz4M4b0jkfE7qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hnjsijNu+0pxsSawq3371FSpD5IpO0396JUBSPMVklM=;
 b=d9TnGAxJKldyB36tMDC8JKuLQW/EfnyrdAp8X6KdiunBeFbiSVYA21EYnRik6qyu2xyDfFDr+8TmIs5PlruQsorVJr9ToF7yW9XYNhydqoU1Wj/m8UonSE9hT5ANHNusdUhLjklP/gzGkJvqoHkQAmHoLb0wTig0rhprOekEegkNUGv1Ln7DYNaBz/iE4hR0BStEjUBpvYLSKfCo5CthWdH909/j/dD7AKqR57HAqXzL8c3WW6Zi5q1k12hKUN1z4BxZAMmwqT4za3C8nRbMYpIiBU1KaHbLguTqK1G/uOf88gma8qzwA+YrZ0PqLW5wZhYyIloUHMW/dCFi/ouD6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6278.namprd11.prod.outlook.com (2603:10b6:208:3c2::8)
 by SJ0PR11MB6790.namprd11.prod.outlook.com (2603:10b6:a03:483::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.20; Wed, 26 Feb
 2025 23:42:27 +0000
Received: from MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::a9df:4a4d:b9e7:76e2]) by MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::a9df:4a4d:b9e7:76e2%7]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 23:42:27 +0000
Date: Wed, 26 Feb 2025 15:42:24 -0800
From: Harish Chegondi <harish.chegondi@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t] drm-uapi/xe: Sync with PXP and EU stall changes
Message-ID: <Z7-m4Od-vrbZkQaa@intel.com>
References: <20250226204017.100597-1-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20250226204017.100597-1-ashutosh.dixit@intel.com>
X-ClientProxiedBy: BYAPR01CA0062.prod.exchangelabs.com (2603:10b6:a03:94::39)
 To MN0PR11MB6278.namprd11.prod.outlook.com
 (2603:10b6:208:3c2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6278:EE_|SJ0PR11MB6790:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fabb04b-8f2c-4905-244d-08dd56bf39d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y0IrUHh0TmRlQWEvZFFoV2MzSXJxTmoyMzZnY3hXQzViR1laVGxVdDZabXVV?=
 =?utf-8?B?RWJVVWcxOFdPT3N3bG9zSFl0Q3hqemFYTzZTbHYyOVNvRExmc3JsSWp5MlpU?=
 =?utf-8?B?cXdmWUkxS3F4ZmdMZDlKcHJnTHlKTktkVDFBN1F1cHFILzUraGhsbFVFNFlH?=
 =?utf-8?B?c2M4UHFqd0pEallYOHcweXBlM0xiMnhQUWFzRVVRanREMnVCMnRIc3pqSjBz?=
 =?utf-8?B?a1l0KzFEZmFhS2FQc3duSlpycHVwQlNjVmJMSUNJUU0rRSs2WmpFZUlNaVNZ?=
 =?utf-8?B?QlRRVUFiYkxTZ0t0WmpFNEU4eDVXcmFmRVBDeFFXVjJRUDNqU01FOENOZytr?=
 =?utf-8?B?dlJBWHlwdFQ4UWNaTjVGemhCRXpGYlJYOHhhTnlKdzNCL2E2UFpmVVo2NG5U?=
 =?utf-8?B?dWZkd2JMTTVicCt4dk1JZTZ0N1NEUWNFcEpDdzZMU0w5b3dmL0Q5WU4yWkxm?=
 =?utf-8?B?bjF6MzIwKytBcDIwa2NuUXZVL3hjQUJEOXQ1L2o4em5MV3hOcE93aCtpS2pu?=
 =?utf-8?B?YVJaZEpqbFRINTloQ2RoKzJYYUR5cGtrNU1iNkhHUmIrZzJuOWZpK2R4dmd4?=
 =?utf-8?B?MGdiMW9ZOHdxWlFQQnNmUG5BVWZUSm1KRVpGL0hpNFJ1UVNLRG5QdDhKaTBh?=
 =?utf-8?B?M2VQZXFTekpjc3FRL3pFYnkxSFY3dUcrZkx5c3E5TFpMOGgrdzBpQ1ZxU1Zj?=
 =?utf-8?B?VzkwaXZKOThjaDlDd3dDNm03eWtNa3FJeDlIV0k0NThiWW9HMTQxMmNhTnRH?=
 =?utf-8?B?K29sOXJRbVJYQ3F2Zkk3WWlsYnR6YWJaRWxHcE5ReTlhdkFvWWZmZzZXSENu?=
 =?utf-8?B?Mk9ScnFkNGg2akhLbUNsZ1cvN0VkLzFyT2wrZ1VNZ1VOUE1PMzdTTis0SkpO?=
 =?utf-8?B?ckoxeElCSFlYR1QrWFVJRndvK1Z1YndUcnZMOFlxVTRiSnc0TzEzeUJoVXFj?=
 =?utf-8?B?SXI1NHRpTHJsaS83L2huWURGMnJhbWt1SEZ5SWVRd3NkY1JrVFFDVXJxOC92?=
 =?utf-8?B?MmwvREFMSnVKaGxueUY4eFlUaklHMzNISGFYNVdvanBZWW5iSk5oQUJjUlNT?=
 =?utf-8?B?WmhkQ0M5Q1pJU2VGNWtmK25qSlpmd2pRb2RseE1GeU5LdU10aU1NUFpHMmZ3?=
 =?utf-8?B?Q0RJVmppMUxSS0JkVC9VeCsvWFdvL1FzZk5oMjQyYlBPWDFqbDFYamwyUlJj?=
 =?utf-8?B?bkxveFBhTkoyUXFsMWtXTUU2VGsvcEhtK1NYbUs5OFcybm96d0pMYjJsRnlW?=
 =?utf-8?B?T0s1L1lFVHNpUnJWR0R1TldBMmhEZUdiczd4TjNtMnFza2pPM0ZMVGExaXpF?=
 =?utf-8?B?SVhpQ1B0UkNyZXVkaHUxNXQxYnkxRkMzNENtL201TVlXY2lRU2xoSU50TEFy?=
 =?utf-8?B?N3F1cVJ5NkxPODMrcHl0RS9PbC9PWXZsYXVqd2hDRTVxcE9pNUVnMTFsaGRm?=
 =?utf-8?B?Q1dObXRoM2IzUTRyTTdhVTQzUUdWS3hrc2ZkRXdMNG1jZ3N1RmlpdU9ZOUc0?=
 =?utf-8?B?QTNGOVFWMWpPOHlYSFJkQ3hSSzlwTlR4Zno1L1lZOVUydDMyN3REajVvaWdF?=
 =?utf-8?B?d0RCRUhOQ3d3MTJyZVA2YVoyeGtlektWVWEybml3WDhhbWJnTXVjbjhoVzRj?=
 =?utf-8?B?M3NIMUZEcXIvVVJHM3htcG5qYkpVVVIwUlpJOWpEZ05WR1pock1MOXhOdCsx?=
 =?utf-8?B?UGU4UUg3VXNIMmVOeFBjRWVHQVVnMWdpdU9LZGE1bXh5NjdZUGFUSWplL3NO?=
 =?utf-8?B?OW9UbkNyMTNNQUVBNXozNjNBbjNET3dvVG15RlBNYU9PL2lhSytzYzlUUjNz?=
 =?utf-8?B?SzA1RkN3bjE2S3czYmU4QT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6278.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZkcyQW5aTlhSUmUzRW4zMDExSUd2VnJTY0ZEWCt2ckhXaDNSVi9mNlJiaU9y?=
 =?utf-8?B?WWdYbVhRMnY0eWF0Y3d3aVB1Vk9tUUx1NXZRYnc1UXpRSldiNUJIZUlydlpC?=
 =?utf-8?B?dVZwOVlGM2U3SXlDclpzSExFZzFvbGhiOWFBcjV0dkNLeDVTYUhKc1NMS24x?=
 =?utf-8?B?VnJNajYzNFVlTzdWenBTckZ1V3MyMm1pNEtrTy9JSUxaUi96RW51YmthOGRo?=
 =?utf-8?B?ckVmRkUvM3BSTlhiRGQ1cVIvOUVwL0lRYUJRbEdLV2JleE9vRlNkaWkyMTNw?=
 =?utf-8?B?cHpJRmgvYUlvbkZwVGZJWnNPUEhlRTJxdmtOb001UHgrMjlsWHNxS0RRMHZD?=
 =?utf-8?B?ZHY1eUlnZk9Hbnl5NUI0UDFFRGc5djVFRnVsaVhLU3BScnNlYldFSXhudENr?=
 =?utf-8?B?RUVEeVh0Q0dXQjQ4aUplaHUrZHNHVEFQR0VHY3NSam5ZQlhhYnhnUFpIZmM0?=
 =?utf-8?B?T2FtVlNtWlNZTVdsZGRDaStvQ3pBcU9ia0pvcWFFcUIxTHFqNkxad0U1YjMz?=
 =?utf-8?B?WGR6NExHYXZBQ0N2UXY0UERqZ3VJai9IWTU5bnJQR2lYMk9EZGh5SmJoaWxo?=
 =?utf-8?B?NG1RNlZ0cmpuVEpHSDJKUFZFczkzNjhBMWZ4VmVleCtDUWV5a3pQdzFubU95?=
 =?utf-8?B?dnlUMWFkSis5OFc2K0tyb1k4Ulp3cDdueEE5Qlh1YkVOQnBtZG1MWlp0azN6?=
 =?utf-8?B?NFg1UEdKWm1tUXE0NW8wUEdiZUh6b3N6OGxRWXJVVlRVSTRLTFBERkV6Zmlh?=
 =?utf-8?B?d1hlUmVLbTVValRYdXZqcjNPS1dRN2VNTWJyKzFobDhtZDl5dkdWOERoOEV3?=
 =?utf-8?B?MW1iaFF0T2dNTzhDS3hXVUZmU2xQd0c3ZGd5d2ZJWUdUU0xiVDBoWUhPSjA0?=
 =?utf-8?B?ZkRuaTY3R2JRWTBIakZzMGt2WEpVZEE3dEFrc0h1a0RITlV5NUluMDhLTTlD?=
 =?utf-8?B?cmVkeFZYcHQrMmNjdHR5M0JXY1ZiRVFqakRXSWJOalpWZTRZUzNhREtXOU9z?=
 =?utf-8?B?Yml1Rm9VMkE1TjY4WTFPRjRmNHd2b3cxNXRJenBwNTQyTjlPc25WRVBkQlFW?=
 =?utf-8?B?elpGNGtTY25ncEhxN2xjTHYrelQzVDMySHZNR21oTzdzNERoZTIzOVlMTTZN?=
 =?utf-8?B?azF0bGhLL0JMcFIvNDY0VHRXKzQ0S0htYTVrWHBLd240YldJRmM4Y2VFeTJF?=
 =?utf-8?B?WGxSd2EvQ3RFa3NTNTJwV29jRklOQjhvQXdvM0NHK2FlUk9CcHdSWmVTakZV?=
 =?utf-8?B?ZlBzcitza1VYZjhjUENBQlJZZmtURkhkdE1qQnFaU3JuUWNrUHcrcDZnZ2Z3?=
 =?utf-8?B?ZCtNVmVBWU1kUlRtaXorU1RDbTBDS1p1N29GZUhicVlyUHJMbERaVHdTVkpO?=
 =?utf-8?B?ZVkwNEdybGQvbk5ITk91MWx2c2JpWDRoVFhXODAxdnNremFyNlNQZDhiaUMv?=
 =?utf-8?B?d0FEaEE1b29vTkxsY3BjUitEdFN4QUV1RGY4YmgxeThNaWFrNCt6STE4RVRE?=
 =?utf-8?B?cEJ4TUVMdUdCeTB4dG95TlBKTHZpV0JaWVhadUtsQ1c0NGdFNHBXMmdWK3Ny?=
 =?utf-8?B?dUt3M0htTDdYS3JoRFoyRjZGbUhHaC9YOE45ZjZMVVJlUGVkMWloV0dYRTJ4?=
 =?utf-8?B?QWZlemtPNTlzZnp2bHlnM3lxU3pCMmhjNGlFcmNkSGV4YlVDY3VCQTlTV3pB?=
 =?utf-8?B?TkRGL2xSQVRXZjY2eDRZZHQwUy9ETTd2ZjJjNXIreHJYR1JWZWFEOWZZTVBP?=
 =?utf-8?B?QnlwYkgyNWxNbFZiaHVTNG5CQzNIU2I2UGhKRy94YzRGai9JL1Z4b3NhREZn?=
 =?utf-8?B?bTlyZTZ5MEgwaFc3TGV1SXVxblh5N01UM2NEaFFxLzQrVHFDR09JbTh6a2V5?=
 =?utf-8?B?TytjYkNQVDJFUjZuR2M4ZXhYcTdCOHZLMzAyR3hSYTlCTHRKekc3ZTJKNDVq?=
 =?utf-8?B?RFhvMWVRMFA5YjZqM1pzK09yYURUMlpVeVF0UzduekdwcTd4ZlVSdzdxMVNO?=
 =?utf-8?B?dnZhUU1GTFFNREV3WFZkT2thenJLbjVSMFFqL1kveG12QUE2c3JJTGhvaVdV?=
 =?utf-8?B?d0lGczhTTENPTjZUdHFOQ2ZqWjNDQUI1T2Jhc0dlTlV4Vk5OUmZYQ3lodjdC?=
 =?utf-8?B?K04vRnM1aWZlRjRrRWJNK2lBTzB6aVExNlE3UXM1bFdzWk9lamVUajVRd240?=
 =?utf-8?B?NVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fabb04b-8f2c-4905-244d-08dd56bf39d4
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6278.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 23:42:26.8884 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cCoC1AMr/giXFmR4D471kMQxO9Ouk4Vnr0uZY2s5ttTPPzn81RSuNOaoJcE6cI1qGG+c9rPbMDksGilRLZn+tVy6xoF3SFVykkLlMlvjDhc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6790
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

On Wed, Feb 26, 2025 at 12:40:17PM -0800, Ashutosh Dixit wrote:
Hi Ashutosh,

There is a patch series that adds tests for PXP 

https://patchwork.freedesktop.org/series/142450/

The first patch is to update the uAPI in xe_drm.h

Except one patch, all the patches have Reviewed-by.

Should we wait for this patch series to merge?

Thanks
Harish.
> Align with kernel commit cd5bbb2532f2 ("drm/xe/uapi: Add a device query to
> get EU stall sampling information").
> 
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  include/drm-uapi/xe_drm.h | 197 +++++++++++++++++++++++++++++++++++++-
>  1 file changed, 195 insertions(+), 2 deletions(-)
> 
> diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
> index 08e263b3b2..154f947ef0 100644
> --- a/include/drm-uapi/xe_drm.h
> +++ b/include/drm-uapi/xe_drm.h
> @@ -629,6 +629,39 @@ struct drm_xe_query_uc_fw_version {
>  	__u64 reserved;
>  };
>  
> +/**
> + * struct drm_xe_query_pxp_status - query if PXP is ready
> + *
> + * If PXP is enabled and no fatal error has occurred, the status will be set to
> + * one of the following values:
> + * 0: PXP init still in progress
> + * 1: PXP init complete
> + *
> + * If PXP is not enabled or something has gone wrong, the query will be failed
> + * with one of the following error codes:
> + * -ENODEV: PXP not supported or disabled;
> + * -EIO: fatal error occurred during init, so PXP will never be enabled;
> + * -EINVAL: incorrect value provided as part of the query;
> + * -EFAULT: error copying the memory between kernel and userspace.
> + *
> + * The status can only be 0 in the first few seconds after driver load. If
> + * everything works as expected, the status will transition to init complete in
> + * less than 1 second, while in case of errors the driver might take longer to
> + * start returning an error code, but it should still take less than 10 seconds.
> + *
> + * The supported session type bitmask is based on the values in
> + * enum drm_xe_pxp_session_type. TYPE_NONE is always supported and therefore
> + * is not reported in the bitmask.
> + *
> + */
> +struct drm_xe_query_pxp_status {
> +	/** @status: current PXP status */
> +	__u32 status;
> +
> +	/** @supported_session_types: bitmask of supported PXP session types */
> +	__u32 supported_session_types;
> +};
> +
>  /**
>   * struct drm_xe_device_query - Input of &DRM_IOCTL_XE_DEVICE_QUERY - main
>   * structure to query device information
> @@ -648,6 +681,7 @@ struct drm_xe_query_uc_fw_version {
>   *    attributes.
>   *  - %DRM_XE_DEVICE_QUERY_GT_TOPOLOGY
>   *  - %DRM_XE_DEVICE_QUERY_ENGINE_CYCLES
> + *  - %DRM_XE_DEVICE_QUERY_PXP_STATUS
>   *
>   * If size is set to 0, the driver fills it with the required size for
>   * the requested type of data to query. If size is equal to the required
> @@ -700,6 +734,8 @@ struct drm_xe_device_query {
>  #define DRM_XE_DEVICE_QUERY_ENGINE_CYCLES	6
>  #define DRM_XE_DEVICE_QUERY_UC_FW_VERSION	7
>  #define DRM_XE_DEVICE_QUERY_OA_UNITS		8
> +#define DRM_XE_DEVICE_QUERY_PXP_STATUS		9
> +#define DRM_XE_DEVICE_QUERY_EU_STALL		10
>  	/** @query: The type of data to query */
>  	__u32 query;
>  
> @@ -743,8 +779,23 @@ struct drm_xe_device_query {
>   *  - %DRM_XE_GEM_CPU_CACHING_WC - Allocate the pages as write-combined. This
>   *    is uncached. Scanout surfaces should likely use this. All objects
>   *    that can be placed in VRAM must use this.
> + *
> + * This ioctl supports setting the following properties via the
> + * %DRM_XE_GEM_CREATE_EXTENSION_SET_PROPERTY extension, which uses the
> + * generic @drm_xe_ext_set_property struct:
> + *
> + *  - %DRM_XE_GEM_CREATE_SET_PROPERTY_PXP_TYPE - set the type of PXP session
> + *    this object will be used with. Valid values are listed in enum
> + *    drm_xe_pxp_session_type. %DRM_XE_PXP_TYPE_NONE is the default behavior, so
> + *    there is no need to explicitly set that. Objects used with session of type
> + *    %DRM_XE_PXP_TYPE_HWDRM will be marked as invalid if a PXP invalidation
> + *    event occurs after their creation. Attempting to flip an invalid object
> + *    will cause a black frame to be displayed instead. Submissions with invalid
> + *    objects mapped in the VM will be rejected.
>   */
>  struct drm_xe_gem_create {
> +#define DRM_XE_GEM_CREATE_EXTENSION_SET_PROPERTY	0
> +#define   DRM_XE_GEM_CREATE_SET_PROPERTY_PXP_TYPE	0
>  	/** @extensions: Pointer to the first extension struct, if any */
>  	__u64 extensions;
>  
> @@ -811,6 +862,32 @@ struct drm_xe_gem_create {
>  
>  /**
>   * struct drm_xe_gem_mmap_offset - Input of &DRM_IOCTL_XE_GEM_MMAP_OFFSET
> + *
> + * The @flags can be:
> + *  - %DRM_XE_MMAP_OFFSET_FLAG_PCI_BARRIER - For user to query special offset
> + *    for use in mmap ioctl. Writing to the returned mmap address will generate a
> + *    PCI memory barrier with low overhead (avoiding IOCTL call as well as writing
> + *    to VRAM which would also add overhead), acting like an MI_MEM_FENCE
> + *    instruction.
> + *
> + * Note: The mmap size can be at most 4K, due to HW limitations. As a result
> + * this interface is only supported on CPU architectures that support 4K page
> + * size. The mmap_offset ioctl will detect this and gracefully return an
> + * error, where userspace is expected to have a different fallback method for
> + * triggering a barrier.
> + *
> + * Roughly the usage would be as follows:
> + *
> + * .. code-block:: C
> + *
> + *     struct drm_xe_gem_mmap_offset mmo = {
> + *         .handle = 0, // must be set to 0
> + *         .flags = DRM_XE_MMAP_OFFSET_FLAG_PCI_BARRIER,
> + *     };
> + *
> + *     err = ioctl(fd, DRM_IOCTL_XE_GEM_MMAP_OFFSET, &mmo);
> + *     map = mmap(NULL, size, PROT_WRITE, MAP_SHARED, fd, mmo.offset);
> + *     map[i] = 0xdeadbeaf; // issue barrier
>   */
>  struct drm_xe_gem_mmap_offset {
>  	/** @extensions: Pointer to the first extension struct, if any */
> @@ -819,7 +896,8 @@ struct drm_xe_gem_mmap_offset {
>  	/** @handle: Handle for the object being mapped. */
>  	__u32 handle;
>  
> -	/** @flags: Must be zero */
> +#define DRM_XE_MMAP_OFFSET_FLAG_PCI_BARRIER     (1 << 0)
> +	/** @flags: Flags */
>  	__u32 flags;
>  
>  	/** @offset: The fake offset to use for subsequent mmap call */
> @@ -906,6 +984,9 @@ struct drm_xe_vm_destroy {
>   *    will only be valid for DRM_XE_VM_BIND_OP_MAP operations, the BO
>   *    handle MBZ, and the BO offset MBZ. This flag is intended to
>   *    implement VK sparse bindings.
> + *  - %DRM_XE_VM_BIND_FLAG_CHECK_PXP - If the object is encrypted via PXP,
> + *    reject the binding if the encryption key is no longer valid. This
> + *    flag has no effect on BOs that are not marked as using PXP.
>   */
>  struct drm_xe_vm_bind_op {
>  	/** @extensions: Pointer to the first extension struct, if any */
> @@ -996,6 +1077,7 @@ struct drm_xe_vm_bind_op {
>  #define DRM_XE_VM_BIND_FLAG_IMMEDIATE	(1 << 1)
>  #define DRM_XE_VM_BIND_FLAG_NULL	(1 << 2)
>  #define DRM_XE_VM_BIND_FLAG_DUMPABLE	(1 << 3)
> +#define DRM_XE_VM_BIND_FLAG_CHECK_PXP	(1 << 4)
>  	/** @flags: Bind flags */
>  	__u32 flags;
>  
> @@ -1087,6 +1169,24 @@ struct drm_xe_vm_bind {
>  /**
>   * struct drm_xe_exec_queue_create - Input of &DRM_IOCTL_XE_EXEC_QUEUE_CREATE
>   *
> + * This ioctl supports setting the following properties via the
> + * %DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY extension, which uses the
> + * generic @drm_xe_ext_set_property struct:
> + *
> + *  - %DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY - set the queue priority.
> + *    CAP_SYS_NICE is required to set a value above normal.
> + *  - %DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE - set the queue timeslice
> + *    duration in microseconds.
> + *  - %DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE - set the type of PXP session
> + *    this queue will be used with. Valid values are listed in enum
> + *    drm_xe_pxp_session_type. %DRM_XE_PXP_TYPE_NONE is the default behavior, so
> + *    there is no need to explicitly set that. When a queue of type
> + *    %DRM_XE_PXP_TYPE_HWDRM is created, the PXP default HWDRM session
> + *    (%XE_PXP_HWDRM_DEFAULT_SESSION) will be started, if isn't already running.
> + *    Given that going into a power-saving state kills PXP HWDRM sessions,
> + *    runtime PM will be blocked while queues of this type are alive.
> + *    All PXP queues will be killed if a PXP invalidation event occurs.
> + *
>   * The example below shows how to use @drm_xe_exec_queue_create to create
>   * a simple exec_queue (no parallel submission) of class
>   * &DRM_XE_ENGINE_CLASS_RENDER.
> @@ -1110,7 +1210,7 @@ struct drm_xe_exec_queue_create {
>  #define DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY		0
>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY		0
>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE		1
> -
> +#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE		2
>  	/** @extensions: Pointer to the first extension struct, if any */
>  	__u64 extensions;
>  
> @@ -1397,6 +1497,8 @@ struct drm_xe_wait_user_fence {
>  enum drm_xe_observation_type {
>  	/** @DRM_XE_OBSERVATION_TYPE_OA: OA observation stream type */
>  	DRM_XE_OBSERVATION_TYPE_OA,
> +	/** @DRM_XE_OBSERVATION_TYPE_EU_STALL: EU stall sampling observation stream type */
> +	DRM_XE_OBSERVATION_TYPE_EU_STALL,
>  };
>  
>  /**
> @@ -1729,6 +1831,97 @@ struct drm_xe_oa_stream_info {
>  	__u64 reserved[3];
>  };
>  
> +/**
> + * enum drm_xe_pxp_session_type - Supported PXP session types.
> + *
> + * We currently only support HWDRM sessions, which are used for protected
> + * content that ends up being displayed, but the HW supports multiple types, so
> + * we might extend support in the future.
> + */
> +enum drm_xe_pxp_session_type {
> +	/** @DRM_XE_PXP_TYPE_NONE: PXP not used */
> +	DRM_XE_PXP_TYPE_NONE = 0,
> +	/**
> +	 * @DRM_XE_PXP_TYPE_HWDRM: HWDRM sessions are used for content that ends
> +	 * up on the display.
> +	 */
> +	DRM_XE_PXP_TYPE_HWDRM = 1,
> +};
> +
> +/* ID of the protected content session managed by Xe when PXP is active */
> +#define DRM_XE_PXP_HWDRM_DEFAULT_SESSION 0xf
> +
> +/**
> + * enum drm_xe_eu_stall_property_id - EU stall sampling input property ids.
> + *
> + * These properties are passed to the driver at open as a chain of
> + * @drm_xe_ext_set_property structures with @property set to these
> + * properties' enums and @value set to the corresponding values of these
> + * properties. @drm_xe_user_extension base.name should be set to
> + * @DRM_XE_EU_STALL_EXTENSION_SET_PROPERTY.
> + *
> + * With the file descriptor obtained from open, user space must enable
> + * the EU stall stream fd with @DRM_XE_OBSERVATION_IOCTL_ENABLE before
> + * calling read(). EIO errno from read() indicates HW dropped data
> + * due to full buffer.
> + */
> +enum drm_xe_eu_stall_property_id {
> +#define DRM_XE_EU_STALL_EXTENSION_SET_PROPERTY		0
> +	/**
> +	 * @DRM_XE_EU_STALL_PROP_GT_ID: @gt_id of the GT on which
> +	 * EU stall data will be captured.
> +	 */
> +	DRM_XE_EU_STALL_PROP_GT_ID = 1,
> +
> +	/**
> +	 * @DRM_XE_EU_STALL_PROP_SAMPLE_RATE: Sampling rate in
> +	 * GPU cycles from @sampling_rates in struct @drm_xe_query_eu_stall
> +	 */
> +	DRM_XE_EU_STALL_PROP_SAMPLE_RATE,
> +
> +	/**
> +	 * @DRM_XE_EU_STALL_PROP_WAIT_NUM_REPORTS: Minimum number of
> +	 * EU stall data reports to be present in the kernel buffer
> +	 * before unblocking a blocked poll or read.
> +	 */
> +	DRM_XE_EU_STALL_PROP_WAIT_NUM_REPORTS,
> +};
> +
> +/**
> + * struct drm_xe_query_eu_stall - Information about EU stall sampling.
> + *
> + * If a query is made with a struct @drm_xe_device_query where .query
> + * is equal to @DRM_XE_DEVICE_QUERY_EU_STALL, then the reply uses
> + * struct @drm_xe_query_eu_stall in .data.
> + */
> +struct drm_xe_query_eu_stall {
> +	/** @extensions: Pointer to the first extension struct, if any */
> +	__u64 extensions;
> +
> +	/** @capabilities: EU stall capabilities bit-mask */
> +	__u64 capabilities;
> +#define DRM_XE_EU_STALL_CAPS_BASE		(1 << 0)
> +
> +	/** @record_size: size of each EU stall data record */
> +	__u64 record_size;
> +
> +	/** @per_xecore_buf_size: internal per XeCore buffer size */
> +	__u64 per_xecore_buf_size;
> +
> +	/** @reserved: Reserved */
> +	__u64 reserved[5];
> +
> +	/** @num_sampling_rates: Number of sampling rates in @sampling_rates array */
> +	__u64 num_sampling_rates;
> +
> +	/**
> +	 * @sampling_rates: Flexible array of sampling rates
> +	 * sorted in the fastest to slowest order.
> +	 * Sampling rates are specified in GPU clock cycles.
> +	 */
> +	__u64 sampling_rates[];
> +};
> +
>  #if defined(__cplusplus)
>  }
>  #endif
> -- 
> 2.48.1
> 
