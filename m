Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCD4CCCFA1A
	for <igt-dev@archiver.kernel.org>; Wed, 12 Nov 2025 08:59:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87A5210E1B8;
	Wed, 12 Nov 2025 08:59:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D/9KrDlv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA6AB10E1B8
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Nov 2025 08:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762937997; x=1794473997;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=SXIv0oyrfHb4blqISnfHTZAvHVYAuEiFR2GpnTAY8W8=;
 b=D/9KrDlvuzjQvNJ88WbIQFKEo7RkpJer0NdWZGrJlXUGPg00kVfkEheN
 Ae3u0wBXKRWr8TkQk3aR64LCxt8sGtqjSDNQt+LyQc1oQOTZbDgFhJ1nv
 pTIfEzceRYLES2D4zLnaibK6DEXlHtgW77DtCnze1tetD3PBS0MAw0Vzx
 YqWd1Pui7LsFwZiTHPvkj9i4FtVRy/fW4Q5kUYHXEncKVH6gJEoC2AP1x
 jwJdTROReoMNGSL36SljNeZUvBonEnANnH6UPPuerlBvReeF2QOdakr9+
 JsV2wkIASRKdOYlpqugoFhDRj5VYVfOmAJ38/0Xx9aamdSiI2dMIuy7Ku A==;
X-CSE-ConnectionGUID: 4+ErYT4bS125Oo/QkjkizQ==
X-CSE-MsgGUID: tkrg0eTCSBCvBa2N0AqhRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="65147865"
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; d="scan'208";a="65147865"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 00:59:53 -0800
X-CSE-ConnectionGUID: xIxkb7g6RO2KSeN1D2bzEw==
X-CSE-MsgGUID: z6jrjeKNRbO7Nnp5eznhGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; d="scan'208";a="188422297"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 00:59:52 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 00:59:52 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 12 Nov 2025 00:59:52 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.56) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 00:59:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vPqUbr85sTP8Gv8xxo2KsooHkQaVoj1n4AH9Yq9jy39js16rG7eaaegQ4rzRnJh9k+HS3dkhBiYhwYCVfLGv/N4fJVtWyCneKj4ZnpBftqbDKlh+2nD6a7mkt0Q+z0+DImbnfk884ILMi185VK+cyGSMYlomox8mFnab7CC7QxTC3DZdxif3ruvavSZWxeYEozPUIKGWveRAPDa2nrkLM7LVa2r3dkZ0BUo3ngxGvz+4KJdVT4xDqP15tIGG5oNS2kVeZ8/dsZaERA2AG6ufzS9vQSSnihBgawCQqmb3Pm3JHk2P1QH5wMfBIuM4gUXl1ZwckPzy5Q3CQaxTWL6Y2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SlLKhyAKzzhMVceKNBD6UkoUroFy5pPxGjplD9nLSNk=;
 b=oic9gdr4PgSDePsgwr34GKntK1qf21PN15Z2KCl6XMM38vaQHMVbbbnpSe4f+zCZRcYEx1BxvdVRg+WbqtYkOHJAm+05PApqw8t2Dy2GTwdiV9MEf7THwyEdb9wfee17nqUhJ1pehwvjWAB+dZboJqn/C+xZhe6UpBerj/qYzxuu6ZVfhLeEZ5bDf7XQ5fbnP69WlJBAeuXV9u4cgAD9inTYSzaESeaLm2jnUphtkQI+B0zG6AYt4CmDdQwTNJ7zNxfUw7tUzzTywzpsohDXn3g5QMudLkydRAwzBsa/YzZ6lq2zTqHLHhFnpGtyWrK838KyASzHRV52MDevP/EoJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::839) by DS4PPFA92F35354.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Wed, 12 Nov
 2025 08:59:49 +0000
Received: from SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 ([fe80::e17c:d0f4:db8b:d7e6]) by SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 ([fe80::e17c:d0f4:db8b:d7e6%3]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 08:59:49 +0000
Message-ID: <6281cba2-1851-4700-863b-00068658fa87@intel.com>
Date: Wed, 12 Nov 2025 09:59:45 +0100
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=C3=A2_Xe=2ECI=2EFull=3A_failure_for_lib/xe/xe=5Fqu?=
 =?UTF-8?Q?ery=3A_implement_few_query_helpers_=28rev2=29?=
To: <igt-dev@lists.freedesktop.org>, Patchwork
 <patchwork@emeril.freedesktop.org>
References: <20251107-xe_query_helpers-v2-0-ec66ba6af1c1@intel.com>
 <176266726660.33229.7661785670475680216@10055242dc62>
From: "Hajda, Andrzej" <andrzej.hajda@intel.com>
Content-Language: en-GB
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <176266726660.33229.7661785670475680216@10055242dc62>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA1P291CA0016.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::27) To SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::839)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF7DCFBC32A:EE_|DS4PPFA92F35354:EE_
X-MS-Office365-Filtering-Correlation-Id: d80d8d4d-3636-483f-e109-08de21c9d595
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|376014|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NUQrdXJxR0g2VVRSNWhsbXBVeldCL1BsQUhscERwN3VYN0xGSkRhQnJObmxZ?=
 =?utf-8?B?bnpHREFLUzROQXFTUEl6MFlSM2ZHeXJVczg1bmUxODdkbVVSVWhnMFhKUzBX?=
 =?utf-8?B?bDVaRjJWQ0ZYZmwwK3dZbmdZMk9qMG95SEFPdXNGdmw0cHIvSHRkb0VnTzIr?=
 =?utf-8?B?OHUyaktWS0hmNjUzK1YxVTJCQWpYbFFONUNzOTEwZFFXZVkxb1U1K1Z5MGxr?=
 =?utf-8?B?M3BoODFuQVNORzBzbm5rRlU0UlJ0TmNFb29VVFlpVFNqSzRLV3RkamVBKzFx?=
 =?utf-8?B?MVBtRE0xQS93ZkJlY2xrOGh5WTlWRGVaR2pXS3IySUhPeUxQOGxwVmZLWnRa?=
 =?utf-8?B?RGJvY1oxeWVEY2E4RXhmYVNjNEhydUZXSE8ySTVpbFlmZWtCTFVKb0tIdklu?=
 =?utf-8?B?eHhuWHRHazhZck44R3YwSGFXaUxKdFJySGttY0tUVVhuYnNXblJyYzJMb1NJ?=
 =?utf-8?B?OVlwb2pBY1dYcVlMVVduR290azJjRWpwL0sweEtrNklwcUJyZ2tSOCtvYjJQ?=
 =?utf-8?B?Yk9VS0lQdUJ5TWNxd2lUamtpVmJueHFpV3NMN3h3azBnZXV3VzJlbU5uSStQ?=
 =?utf-8?B?ekRTVGZvR3VDc1FDaTBGRVdCS0oxYkNuTFVIUjdmU2NFTFBKV292Kys2eHFM?=
 =?utf-8?B?cHRhZUNoK2Yza3RWaGZ0TlJhL1BkNHUzV3Y5WW1IOEY5R1ppUjRZeThiNENp?=
 =?utf-8?B?WVJvNWF0OC9XQ2V4Tkh1cSs3aDV3NmVxVk9CV0F1YWtmQUEwMnFsbWQrWnZ0?=
 =?utf-8?B?UlQ1R2dJSkNvdlNKbkxwZnVTRmVTb2I1TVlLUU9wZ3JSdDZpNE52R0Vuamta?=
 =?utf-8?B?WWxFTVR3bU9pN2hjdzlybE0zK1lFTzdCUW91eStreVhlZkN5UVNYTWtpbHIw?=
 =?utf-8?B?b2ZyODRIZjNjN2NpRzFTWFgvdUJnNHEyc1BKNTR4aTdnUWJVTTNvbmV5Lytv?=
 =?utf-8?B?RytJQit1d20rQlYxeHZCLzlFU2VFTHFPNVNtUkt0cVY0QnF3MlJRM2dRRGVQ?=
 =?utf-8?B?OVdzQkVrU1pHVzdKZWtSL0owYlk3WXJDWldrWTdxa3RrNjZBbjlQbEVXYlE5?=
 =?utf-8?B?Vk4yTWFma1d5SUdMelRnWHV0N0tuV2kxdEphQk8xVDdpS2pQMFZLVlprakNR?=
 =?utf-8?B?cnJEazFpbklsUXR3YVJhZ0hybnZXU1B5eWhSa251OStqMzlQNFZKTFh1VkVO?=
 =?utf-8?B?ZlhoSnVtTGdDYkl6ZmlKQ3BYK0lQNXcwZmsxVjJ0OUVNbFdhaXBxL05GamFD?=
 =?utf-8?B?eGlXYmZzUXh6ZUlqemtQUlV0UlJTZytEV0ZnZ0k3ODRVU1ZMR3N5MzR6U0Jt?=
 =?utf-8?B?WXEvVGx5TlJ2TWtiM0JLK244SGpqTWtiV01oTElEUlR2MklWNmZIS2Y0V1FP?=
 =?utf-8?B?OHd4VXFMRWFLbS9zM2FEYkdlVk1qTk1Jc2Q2ZmpzTU0yS0dRMC9IWFgyRjB5?=
 =?utf-8?B?eHl4WlhaWCsyZ29oQXEvekRWU1hWSUh5dEkwYXVYWG9YL3dzZ2plSExsbHFr?=
 =?utf-8?B?WXRpMStpdTdFMXBZcDU5S1dDTzhoTGluVktEUVFrTWEyQktFaEhDdW9Uc2RN?=
 =?utf-8?B?dzJmdjVoVC9BVXRpc01JcjhJWWtYM080SkJIOUdkZlRyZVBkUVJ2c2lUbVUr?=
 =?utf-8?B?M29acHA5SGVjdlNBUjlUbWhGcTdGc2IxZkFORVdpVFkwaFE5eEFGb3BHZFpY?=
 =?utf-8?B?cm9WdEU5ejQ5UjFHeUoxSktuTTdTa2VvNFYra2dlRlFqd0JSK1JlMDkyOHZJ?=
 =?utf-8?B?MDkvRUh2QUs4MjlpcVRTZk90QzE1NU16R0tqcVdXYWM2V1JwYmVNMEkzYmw4?=
 =?utf-8?B?YVN1WTdMN3g2WHROMGFJTWx6eERpVlVDYmJvdkxDblZFVGtOUFJJVUlRQUVZ?=
 =?utf-8?B?dnBGc3llYUIzV3NLUDd1N3F4VnV1RjZSWGtHT2lObDZsUFE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ5PPF7DCFBC32A.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(13003099007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OHpjNTgyK24vNk1wYTRPTzR4SVQwaHc4TFZyTDBWKzRhbWR5R3FVSFQ0a3dy?=
 =?utf-8?B?OHMvRWUwTFJ3K0lZMGRkWCtYL09LbFdxc0UrRG5HYUtFcWFmRldiRFo2OVJU?=
 =?utf-8?B?bDk4VG5iU3o4REtqRmhpNFRrZWU5VXNKYXdYa3lJTWFuUm9JNm9SbTVwSWE5?=
 =?utf-8?B?L3VBbXZoczgzOHV4Uzc3L2hCYWV4WkFhQVhWMVF2c2hMN1I0ZlExNDVNYS9Q?=
 =?utf-8?B?VVdCRGdNRFNQcSswVVNkWEhHS1RYMGFINlJTWm5Tbk1iNnRFWWRUeWk5R1h2?=
 =?utf-8?B?KzVpdUwrbFVCVXFYZFhEREJvMmt2cmpoVFJmMlVJR1NzMVVlQXdwOHNMRGMy?=
 =?utf-8?B?UzdlTkZrSXBBRG1ET0crZGlLZSt3bjJRb2toZE8yaU0zUHV6VzFWV2NnWHJG?=
 =?utf-8?B?bTVrZkIrbDcrcU12TjFmSzlqRHljeGlGdThJN3lnQ2pFQWV6b3BQamVwa001?=
 =?utf-8?B?WHFHSHh4MXczYTJRY2FFb2JYY2hSVFdOLzBLVmtoMUhvN1RpWDVRSFNCaEZs?=
 =?utf-8?B?OTNpblF1NnRXS1lqOEJONXZQSHBNekI5RE1FM3JJM2lxN3NvL0Fmak5RRnZE?=
 =?utf-8?B?Zk8vTDlrc3BuMStLMk9IZlcxZ3NQdGxpdFpWSCtDUWpoQ0N6S2tnL0lZL2gv?=
 =?utf-8?B?MHh1MW5nL3loZkpSSFJDMXRFMU5RangrSGJNUEJ0Q1BpL2U1bmc3UDlTUlNj?=
 =?utf-8?B?S24xRHUrN1hGbnFzT1UvR0RCWlRzakQ1ZlBweGlja3MzR0JPZ3hJUlpBYk4y?=
 =?utf-8?B?YlQwVTNiUEZZc3MyT2wzSWtKWU1ObXFNUFh0dDdQR0Z1dE1iYWF2SEMvWGtu?=
 =?utf-8?B?YUFHeERxT2xDQ0RNcGZQTGdKejg4WHhhRzk2cGJMdXpLYTJwUUdSTjhDU28v?=
 =?utf-8?B?cGc0YlYxU0lUUjVnMDI4dXdmSTFCd21rV2pCZHNvNEVHNmtiUlpOZ1c4aUVp?=
 =?utf-8?B?NDlLR3VZMmp3M0d6NlJVRTF2RzA1d1NmWm1tdnN5Y2NScVFIK3MrcUo5dGR4?=
 =?utf-8?B?TTV4N2dSMVREeDJQUDRwcGFsOW1qeFYxSnZnaThzOHVmVFB6RitkVkZHZklz?=
 =?utf-8?B?Y1NKZlJaaHBva3dxdWZEa1lVSGtxR1U2Vm9CZUtwSkYrYXc4TXQxUlRCQzR3?=
 =?utf-8?B?VXFJdFZhczRyY3RjbE1XWnUzcGF0OU9TNWFoS2JlOHhqYjBJMUl5cHJpY3VI?=
 =?utf-8?B?MXgraUVXM2ROL0FWTkkxWEd4V3lWUXQvVU1NVVczYUF4S1JjRERkRllEY3NQ?=
 =?utf-8?B?SmxTYm0wSVdOaFp4Z255eWY1QkNZdHV4TUxXd0NMSnMwRVhjMzViRjMxS2k3?=
 =?utf-8?B?NzBiNGM1VUY1YmhNVlFnajd4UVBWNWZqcXlVTmp3MkxacjlmbVhYM08rK0l5?=
 =?utf-8?B?U2E2V05kTDFkSXI2cjhWY1YwdmlnSTBZZGtLSDh1VS9MeFpqZ29OQlhTS25j?=
 =?utf-8?B?aUJQZTJjazlTOUJoZFF2WEFia0dnUS83VzhIR1lZWjVXTkRoTmNlcDRUeEZH?=
 =?utf-8?B?bSt3dE1VYzYzOGpCbUpkOVBHaStmRklVQVN3OHMvd21ockJjS0FnRkFKYWpQ?=
 =?utf-8?B?U3dRc2hvcUhpekE1YTNZUStnOTdiYmRXaE43UnM0eUJpeE9PYStLSGpzRlBa?=
 =?utf-8?B?UHJvTTBpcVpRMlNpckg5aGYwcCtVN3RjTksyQ1lQRUtIbGdyeTNoU1h2WDVE?=
 =?utf-8?B?dytrVDdKQlVCa21RMlAzMTFJcmgycnZYc01jZW10Sk1VcjFISnozald3K1Uy?=
 =?utf-8?B?K0RWSVFkZ0JmVUpvZWdGd0xpb3QzM2FOL3k0VnVOeVp5elRrWTJqZUFTZHRL?=
 =?utf-8?B?elk3KzBhOGVIaDduR2hQajU4Y3hsL3VoNU16UjNlYlpzK2ZKbzArOHhrWEpD?=
 =?utf-8?B?OXFaeHNsN3g1cE9qSkR5a3I3N0xqd0NCditaOGhmTWc1N013QTFVMGtqaDd5?=
 =?utf-8?B?Q2oweVlKWThRZ2ZnTEdkZ2k3OTduL1JOTC9raVN4V0Irc2NWcVp0Z1kxTnh2?=
 =?utf-8?B?K3R2djhySDlVL281b1UzVHJaaHhNMktBZWZQWU9JbDlILzJnSVprM1FNUnV1?=
 =?utf-8?B?VThyU2NRYS9nWHlQZFNOc1k2Ukdia1oyeDJXcHB3c2J5UDhJbFFxcitKWTdl?=
 =?utf-8?Q?K//UXni3hEegkasbSx9oRE5as?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d80d8d4d-3636-483f-e109-08de21c9d595
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 08:59:49.8528 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KOlnvAiQ2XW9I/XF2+eW8Q2NoAKLDM1K5uh8uw2vRsYE/brfQq6hgLSvNXpELTRwjAAnNesot5D/lBxQZPYGLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFA92F35354
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

W dniu 09.11.2025 o 06:47, Patchwork pisze:
> *Patch Details*
> *Series:*	lib/xe/xe_query: implement few query helpers (rev2)
> *URL:*	https://patchwork.freedesktop.org/series/157140/ <https:// 
> patchwork.freedesktop.org/series/157140/>
> *State:*	failure
> *Details:*	https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14022/ 
> index.html <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14022/ 
> index.html>
> 
> 
>   CI Bug Log - changes from XEIGT_8614_FULL -> XEIGTPW_14022_FULL
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with XEIGTPW_14022_FULL absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in XEIGTPW_14022_FULL, please notify your bug team (I915-ci- 
> infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> 
>     Participating hosts (4 -> 3)
> 
> Missing (1): shard-adlp
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in 
> XEIGTPW_14022_FULL:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   *
> 
>     igt@panthor/panthor_query@query:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_14022/shard-dg2-432/igt@panthor/
>         panthor_query@query.html> +1 other test skip


Another false positive, the patches do not touches panthor tests.


>   *
> 
>     igt@xe_sriov_flr@flr-each-isolation:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8614/shard-bmg-1/igt@xe_sriov_flr@flr-each-isolation.html> -
>          > FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14022/
>         shard-bmg-6/igt@xe_sriov_flr@flr-each-isolation.html>

Known issue, not related: 
https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6569

Regards
Andrzej


> 
> 
>     Known issues
> 
> Here are the changes found in XEIGTPW_14022_FULL that come from known 
> issues:
> 
> 
>       IGT changes
> 
> 
>         Issues hit
> 
>   *
> 
>     igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14022/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-
>         stride-64bpp-rotate-180-hflip-async-flip.html> (Intel XE#3658
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658>)
>   *
> 
>     igt@kms_big_fb@x-tiled-16bpp-rotate-270:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_14022/shard-dg2-464/igt@kms_big_fb@x-
>         tiled-16bpp-rotate-270.html> (Intel XE#316 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/316>) +1 other test skip
>   *
> 
>     igt@kms_big_fb@x-tiled-32bpp-rotate-90:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14022/shard-bmg-6/igt@kms_big_fb@x-tiled-32bpp-
>         rotate-90.html> (Intel XE#2327 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2327>) +4 other tests skip
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14022/shard-lnl-1/igt@kms_big_fb@x-tiled-32bpp-
>         rotate-90.html> (Intel XE#1407 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1407>)
>   *
> 
>     igt@kms_big_fb@x-tiled-8bpp-rotate-180:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8614/shard-lnl-8/igt@kms_big_fb@x-tiled-8bpp-
>         rotate-180.html> -> ABORT <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14022/shard-lnl-3/igt@kms_big_fb@x-tiled-8bpp-
>         rotate-180.html> (Intel XE#4760 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4760>)
>   *
> 
>     igt@kms_big_fb@y-tiled-32bpp-rotate-0:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14022/shard-lnl-3/igt@kms_big_fb@y-tiled-32bpp-
>         rotate-0.html> (Intel XE#1124 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1124>) +1 other test skip
>   *
> 
>     igt@kms_big_fb@y-tiled-addfb:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14022/shard-bmg-2/igt@kms_big_fb@y-tiled-
>         addfb.html> (Intel XE#2328 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2328>)
>   *
> 
>     igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14022/shard-bmg-4/igt@kms_big_fb@y-tiled-addfb-
>         size-offset-overflow.html> (Intel XE#607 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/607>)
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_14022/shard-dg2-432/igt@kms_big_fb@y-tiled-
>         addfb-size-offset-overflow.html> (Intel XE#607 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/607>)
>   *
> 
>     igt@kms_big_fb@yf-tiled-addfb:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_14022/shard-dg2-435/igt@kms_big_fb@yf-tiled-
>         addfb.html> (Intel XE#619 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/619>)
>   *
> 
>     igt@kms_big_fb@yf-tiled-addfb-size-overflow:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14022/shard-bmg-8/igt@kms_big_fb@yf-tiled-addfb-
>         size-overflow.html> (Intel XE#610 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/610>)
>   *
> 
>     igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14022/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-
>         stride-32bpp-rotate-0.html> (Intel XE#1124 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +9 other
>         tests skip
>   *
> 
>     igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_14022/shard-dg2-432/igt@kms_big_fb@yf-tiled-
>         max-hw-stride-64bpp-rotate-180-hflip-async-flip.html> (Intel
>         XE#1124 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1124>) +3 other tests skip
>   *
> 
>     igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14022/shard-bmg-5/igt@kms_bw@connected-linear-
>         tiling-3-displays-2560x1440p.html> (Intel XE#2314 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2314> / Intel
>         XE#2894 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894>)
>   *
> 
>     igt@kms_bw@linear-tiling-2-displays-2560x1440p:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14022/shard-bmg-1/igt@kms_bw@linear-tiling-2-
>         displays-2560x1440p.html> (Intel XE#367 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/367>) +2 other tests
>         skip
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14022/shard-lnl-4/igt@kms_bw@linear-tiling-2-
>         displays-2560x1440p.html> (Intel XE#367 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/367>)
>   *
> 
>     igt@kms_bw@linear-tiling-3-displays-2160x1440p:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_14022/shard-dg2-432/igt@kms_bw@linear-
>         tiling-3-displays-2160x1440p.html> (Intel XE#367 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/367>) +3 other tests
>         skip
>   *
> 
>     igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14022/shard-bmg-5/igt@kms_ccs@bad-rotation-90-y-
>         tiled-gen12-rc-ccs-cc.html> (Intel XE#2887 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) +14 other
>         tests skip
>   *
> 
>     igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-4:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_14022/shard-dg2-464/igt@kms_ccs@crc-primary-
>         basic-yf-tiled-ccs@pipe-d-dp-4.html> (Intel XE#455 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +21
>         other tests skip
>   *
> 
>     igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-a-dp-4:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_14022/shard-dg2-436/igt@kms_ccs@crc-primary-
>         rotation-180-4-tiled-mtl-rc-ccs@pipe-a-dp-4.html> (Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +76
>         other tests skip
>   *
> 
>     igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_14022/shard-dg2-436/igt@kms_ccs@crc-primary-
>         suspend-4-tiled-bmg-ccs.html> (Intel XE#3442 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3442>)
>   *
> 
>     igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14022/shard-bmg-7/igt@kms_ccs@crc-primary-
>         suspend-4-tiled-mtl-rc-ccs-cc.html> (Intel XE#3432 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3432>) +3 other
>         tests skip
>   *
> 
>     igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14022/shard-lnl-5/igt@kms_ccs@crc-primary-
>         suspend-y-tiled-gen12-rc-ccs.html> (Intel XE#3432 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3432>) +1 other test
>         skip
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14022/shard-bmg-6/igt@kms_ccs@random-ccs-data-4-
>         tiled-lnl-ccs@pipe-d-hdmi-a-3.html> (Intel XE#2652 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2652> / Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +4
>         other tests skip
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14022/shard-lnl-8/igt@kms_ccs@random-ccs-data-4-
>         tiled-mtl-rc-ccs.html> (Intel XE#2887 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) +6 other
>         tests skip
>   *
> 
>     igt@kms_cdclk@mode-transition-all-outputs:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14022/shard-bmg-4/igt@kms_cdclk@mode-transition-
>         all-outputs.html> (Intel XE#2724 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2724>)
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_14022/shard-dg2-432/igt@kms_cdclk@mode-
>         transition-all-outputs.html> (Intel XE#4418 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4418>)
>   *
> 
>     igt@kms_chamelium_color@ctm-blue-to-red:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14022/shard-lnl-8/igt@kms_chamelium_color@ctm-
>         blue-to-red.html> (Intel XE#306 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/306>)
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_14022/shard-dg2-466/
>         igt@kms_chamelium_color@ctm-blue-to-red.html> (Intel XE#306
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>)
>   *
> 
>     igt@kms_chamelium_color@ctm-red-to-blue:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14022/shard-bmg-4/igt@kms_chamelium_color@ctm-
>         red-to-blue.html> (Intel XE#2325 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2325>)
>   *
> 
>     igt@kms_chamelium_edid@dp-edid-resolution-list:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_14022/shard-dg2-436/
>         igt@kms_chamelium_edid@dp-edid-resolution-list.html> (Intel
>         XE#373 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/373>) +5 other tests skip
>   *
> 
>     igt@kms_chamelium_frames@hdmi-crc-fast:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14022/shard-lnl-3/igt@kms_chamelium_frames@hdmi-
>         crc-fast.html> (Intel XE#373 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/373>) +2 other tests skip
>   *
> 
>     igt@kms_chamelium_hpd@dp-hpd-after-suspend:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14022/shard-bmg-4/igt@kms_chamelium_hpd@dp-hpd-
>         after-suspend.html> (Intel XE#2252 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2252>) +6 other
>         tests skip
>   *
> 
>     igt@kms_chamelium_sharpness_filter@filter-basic:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_14022/shard-dg2-463/
>         igt@kms_chamelium_sharpness_filter@filter-basic.html> (Intel
>         XE#6507 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6507>)
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14022/shard-lnl-7/
>         igt@kms_chamelium_sharpness_filter@filter-basic.html> (Intel
>         XE#6507 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6507>)
>   *
> 
>     igt@kms_content_protection@atomic:
> 
>       o shard-dg2-set2: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_14022/shard-dg2-435/
>         igt@kms_content_protection@atomic.html> (Intel XE#1178 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1178>) +1 other test
>         fail
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14022/shard-lnl-2/
>         igt@kms_content_protection@atomic.html> (Intel XE#3278 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3278>)
>   *
> 
>     igt@kms_content_protection@legacy:
> 
>       o shard-bmg: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14022/shard-bmg-7/
>         igt@kms_content_protection@legacy.html> (Intel XE#1178 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1178>) +1 other test
>         fail
>   *
> 
>     igt@kms_content_protection@lic-type-1:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_14022/shard-dg2-463/
>         igt@kms_content_protection@lic-type-1.html> (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +10
>         other tests skip
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14022/shard-bmg-2/igt@kms_content_protection@lic-
>         type-1.html> (Intel XE#2341 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2341>)
>   *
> 
>     igt@kms_cursor_crc@cursor-offscreen-max-size:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14022/shard-bmg-6/igt@kms_cursor_crc@cursor-
>         offscreen-max-size.html> (Intel XE#2320 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2320>) +7 other
>         tests skip
>   *
> 
>     igt@kms_cursor_crc@cursor-random-512x512:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_14022/shard-dg2-434/
>         igt@kms_cursor_crc@cursor-random-512x512.html> (Intel XE#308
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/308>)
>   *
> 
>     igt@kms_cursor_crc@cursor-random-max-size:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14022/shard-lnl-1/igt@kms_cursor_crc@cursor-
>         random-max-size.html> (Intel XE#1424 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1424>)
>   *
> 
>     igt@kms_cursor_crc@cursor-rapid-movement-512x170:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14022/shard-bmg-5/igt@kms_cursor_crc@cursor-
>         rapid-movement-512x170.html> (Intel XE#2321 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2321>)
>   *
> 
>     igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8614/shard-bmg-1/igt@kms_cursor_legacy@2x-long-flip-vs-
>         cursor-legacy.html> -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14022/shard-bmg-6/igt@kms_cursor_legacy@2x-long-
>         flip-vs-cursor-legacy.html> (Intel XE#2291 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2291>)
>   *
> 
>     igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8614/shard-bmg-6/igt@kms_cursor_legacy@cursor-vs-flip-
>         atomic-transitions-varying-size.html> -> DMESG-WARN <https://
>         intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14022/shard-bmg-4/
>         igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-
>         size.html> (Intel XE#5354 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/5354>)
>   *
> 
>     igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14022/shard-bmg-6/igt@kms_cursor_legacy@cursorb-
>         vs-flipb-atomic-transitions.html> (Intel XE#2291 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2291>)
>   *
> 
>     igt@kms_dp_link_training@uhbr-sst:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14022/shard-bmg-6/igt@kms_dp_link_training@uhbr-
>         sst.html> (Intel XE#4354 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/4354>) +1 other test skip
>   *
> 
>     igt@kms_dsc@dsc-fractional-bpp:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14022/shard-bmg-2/igt@kms_dsc@dsc-fractional-
>         bpp.html> (Intel XE#2244 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2244>)
>   *
> 
>     igt@kms_fbcon_fbt@fbc-suspend:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14022/shard-bmg-5/igt@kms_fbcon_fbt@fbc-
>         suspend.html> (Intel XE#5425 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/5425>)
>   *
> 
>     igt@kms_feature_discovery@chamelium:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14022/shard-bmg-7/
>         igt@kms_feature_discovery@chamelium.html> (Intel XE#2372
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372>)
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_14022/shard-dg2-432/
>         igt@kms_feature_discovery@chamelium.html> (Intel XE#701
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/701>)
>   *
> 
>     igt@kms_feature_discovery@display-3x:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14022/shard-bmg-7/
>         igt@kms_feature_discovery@display-3x.html> (Intel XE#2373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373>)
>   *
> 
>     igt@kms_feature_discovery@display-4x:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14022/shard-bmg-2/
>         igt@kms_feature_discovery@display-4x.html> (Intel XE#1138
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138>)
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_14022/shard-dg2-435/
>         igt@kms_feature_discovery@display-4x.html> (Intel XE#1138
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138>)
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14022/shard-lnl-2/
>         igt@kms_feature_discovery@display-4x.html> (Intel XE#1138
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138>)
>   *
> 
>     igt@kms_feature_discovery@psr2:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_14022/shard-dg2-433/
>         igt@kms_feature_discovery@psr2.html> (Intel XE#1135 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1135>)
>   *
> 
>     igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14022/shard-bmg-6/igt@kms_flip@2x-flip-vs-
>         wf_vblank-interruptible.html> (Intel XE#2316 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2316>) +2 other
>         tests skip
>   *
> 
>     igt@kms_flip@2x-plain-flip:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14022/shard-lnl-5/igt@kms_flip@2x-plain-
>         flip.html> (Intel XE#1421 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1421>) +4 other tests skip
>   *
> 
>     igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8614/shard-bmg-1/igt@kms_flip@2x-wf_vblank-ts-check-
>         interruptible.html> -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14022/shard-bmg-6/igt@kms_flip@2x-wf_vblank-ts-
>         check-interruptible.html> (Intel XE#2316 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2316>) +2 other
>         tests skip
>   *
> 
>     igt@kms_flip@flip-vs-expired-vblank@a-edp1:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8614/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@a-
>         edp1.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGTPW_14022/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@a-
>         edp1.html> (Intel XE#301 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/301>) +1 other test fail
>   *
> 
>     igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a6:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8614/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank@d-
>         hdmi-a6.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_14022/shard-dg2-464/igt@kms_flip@flip-vs-expired-
>         vblank@d-hdmi-a6.html> (Intel XE#301 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/301>) +1 other test fail
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-
>     downscaling@pipe-a-valid-mode:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14022/shard-bmg-2/
>         igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-
>         ytilegen12rcccs-downscaling@pipe-a-valid-mode.html> (Intel
>         XE#2293 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2293>) +6 other tests skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14022/shard-bmg-5/
>         igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-
>         downscaling.html> (Intel XE#2293 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2293> / Intel
>         XE#2380 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2380>) +6 other tests skip
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14022/shard-lnl-7/
>         igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-
>         downscaling.html> (Intel XE#1401 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1401> / Intel
>         XE#1745 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1745>) +1 other test skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-
>     downscaling@pipe-a-default-mode:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14022/shard-lnl-7/
>         igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-
>         downscaling@pipe-a-default-mode.html> (Intel XE#1401 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1401>) +1 other test
>         skip
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-indfb-draw-blt:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14022/shard-lnl-8/
>         igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-indfb-draw-
>         blt.html> (Intel XE#6312 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/6312>)
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14022/shard-bmg-6/
>         igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-
>         blt.html> (Intel XE#2312 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2312>) +4 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_14022/shard-dg2-466/
>         igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html>
>         (Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/651>) +16 other tests skip
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14022/shard-lnl-3/
>         igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html>
>         (Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/651>) +4 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14022/shard-bmg-7/
>         igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-
>         mmap-wc.html> (Intel XE#6313 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/6313>) +1 other test skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14022/shard-bmg-7/
>         igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-
>         blt.html> (Intel XE#5390 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/5390>) +9 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-tiling-y:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14022/shard-bmg-6/
>         igt@kms_frontbuffer_tracking@fbc-tiling-y.html> (Intel XE#2352
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-render:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_14022/shard-dg2-435/
>         igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-
>         draw-render.html> (Intel XE#6312 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/6312>) +4 other
>         tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14022/shard-bmg-8/
>         igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-
>         mmap-wc.html> (Intel XE#2311 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2311>) +33 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_14022/shard-dg2-434/
>         igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html> (Intel
>         XE#658 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/658>)
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14022/shard-lnl-4/
>         igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html> (Intel
>         XE#1469 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14022/shard-lnl-1/
>         igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-
>         mmap-wc.html> (Intel XE#656 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/656>) +11 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@plane-fbc-rte:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14022/shard-bmg-6/
>         igt@kms_frontbuffer_tracking@plane-fbc-rte.html> (Intel XE#2350
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350>)
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14022/shard-bmg-5/
>         igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-
>         blt.html> (Intel XE#2313 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2313>) +37 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_14022/shard-dg2-464/
>         igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-
>         blt.html> (Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/653>) +13 other tests skip
>   *
> 
>     igt@kms_hdr@brightness-with-hdr:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14022/shard-lnl-1/igt@kms_hdr@brightness-with-
>         hdr.html> (Intel XE#3374 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/3374> / Intel XE#3544 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3544>)
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14022/shard-bmg-8/igt@kms_hdr@brightness-with-
>         hdr.html> (Intel XE#3374 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/3374> / Intel XE#3544 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3544>)
>   *
> 
>     igt@kms_hdr@static-toggle-dpms:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8614/shard-bmg-8/igt@kms_hdr@static-toggle-dpms.html> ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14022/
>         shard-bmg-6/igt@kms_hdr@static-toggle-dpms.html> (Intel XE#1503
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503>)
>   *
> 
>     igt@kms_joiner@basic-big-joiner:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14022/shard-bmg-1/igt@kms_joiner@basic-big-
>         joiner.html> (Intel XE#346 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/346>)
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_14022/shard-dg2-433/igt@kms_joiner@basic-
>         big-joiner.html> (Intel XE#346 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/346>)
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14022/shard-lnl-4/igt@kms_joiner@basic-big-
>         joiner.html> (Intel XE#346 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/346>)
>   *
> 
>     igt@kms_joiner@basic-ultra-joiner:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_14022/shard-dg2-432/igt@kms_joiner@basic-
>         ultra-joiner.html> (Intel XE#2927 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2927>)
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14022/shard-lnl-8/igt@kms_joiner@basic-ultra-
>         joiner.html> (Intel XE#2927 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2927>)
>   *
> 
>     igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14022/shard-bmg-2/
>         igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html> (Intel
>         XE#2501 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2501>)
>   *
> 
>     igt@kms_panel_fitting@atomic-fastset:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14022/shard-bmg-6/igt@kms_panel_fitting@atomic-
>         fastset.html> (Intel XE#2486 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2486>)
>   *
> 
>     igt@kms_pipe_stress@stress-xrgb8888-ytiled:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14022/shard-bmg-6/igt@kms_pipe_stress@stress-
>         xrgb8888-ytiled.html> (Intel XE#4329 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4329>)
>   *
> 
>     igt@kms_plane_lowres@tiling-none@pipe-b-edp-1:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14022/shard-lnl-5/igt@kms_plane_lowres@tiling-
>         none@pipe-b-edp-1.html> (Intel XE#599 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/599>) +3 other tests
>         skip
>   *
> 
>     igt@kms_plane_lowres@tiling-yf:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14022/shard-bmg-4/igt@kms_plane_lowres@tiling-
>         yf.html> (Intel XE#2393 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2393>)
>   *
> 
>     igt@kms_plane_multiple@2x-tiling-4:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14022/shard-lnl-3/igt@kms_plane_multiple@2x-
>         tiling-4.html> (Intel XE#4596 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4596>)
>   *
> 
>     igt@kms_plane_multiple@2x-tiling-yf:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14022/shard-bmg-2/igt@kms_plane_multiple@2x-
>         tiling-yf.html> (Intel XE#5021 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/5021>)
>   *
> 
>     igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14022/shard-lnl-4/igt@kms_plane_scaling@planes-
>         upscale-20x20-downscale-factor-0-5@pipe-a.html> (Intel XE#2763
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763>) +3
>         other tests skip
>   *
> 
>     igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14022/shard-bmg-4/igt@kms_plane_scaling@planes-
>         upscale-20x20-downscale-factor-0-75@pipe-a.html> (Intel XE#2763
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763>) +4
>         other tests skip
>   *
> 
>     igt@kms_pm_backlight@fade:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14022/shard-bmg-6/igt@kms_pm_backlight@fade.html>
>         (Intel XE#870 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/870>)
>   *
> 
>     igt@kms_pm_dc@dc5-retention-flops:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_14022/shard-dg2-436/igt@kms_pm_dc@dc5-
>         retention-flops.html> (Intel XE#3309 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3309>)
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14022/shard-lnl-7/igt@kms_pm_dc@dc5-retention-
>         flops.html> (Intel XE#3309 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/3309>)
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14022/shard-bmg-8/igt@kms_pm_dc@dc5-retention-
>         flops.html> (Intel XE#3309 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/3309>)
>   *
> 
>     igt@kms_pm_dc@dc6-psr:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8614/shard-lnl-2/igt@kms_pm_dc@dc6-psr.html> -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14022/shard-
>         lnl-3/igt@kms_pm_dc@dc6-psr.html> (Intel XE#718 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/718>)
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14022/shard-bmg-4/igt@kms_pm_dc@dc6-psr.html>
>         (Intel XE#2392 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2392>)
>   *
> 
>     igt@kms_pm_lpsp@kms-lpsp:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14022/shard-bmg-1/igt@kms_pm_lpsp@kms-lpsp.html>
>         (Intel XE#2499 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2499>)
>   *
> 
>     igt@kms_pm_rpm@modeset-lpsp:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14022/shard-bmg-7/igt@kms_pm_rpm@modeset-
>         lpsp.html> (Intel XE#1439 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1439> / Intel XE#3141 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3141> / Intel XE#836
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/836>) +1
>         other test skip
>   *
> 
>     igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14022/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-
>         cursor-plane-move-continuous-exceed-sf.html> (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#2893 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2893> / Intel XE#4608 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4608>) +1 other test skip
>   *
> 
>     igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-
>     sf@pipe-b-edp-1:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14022/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-
>         cursor-plane-move-continuous-exceed-sf@pipe-b-edp-1.html> (Intel
>         XE#1406 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1406> / Intel XE#4608 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4608>) +3 other tests skip
>   *
> 
>     igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14022/shard-bmg-5/igt@kms_psr2_sf@fbc-psr2-
>         cursor-plane-move-continuous-sf.html> (Intel XE#1406 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1406> / Intel
>         XE#1489 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1489>) +9 other tests skip
>   *
> 
>     igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14022/shard-lnl-8/igt@kms_psr2_sf@pr-overlay-
>         plane-move-continuous-exceed-sf.html> (Intel XE#1406 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1406> / Intel
>         XE#2893 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893>)
>   *
> 
>     igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_14022/shard-dg2-435/igt@kms_psr2_sf@psr2-
>         cursor-plane-move-continuous-exceed-fully-sf.html> (Intel
>         XE#1406 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1406> / Intel XE#1489 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1489>) +4 other tests skip
>   *
> 
>     igt@kms_psr2_su@frontbuffer-xrgb8888:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14022/shard-bmg-7/igt@kms_psr2_su@frontbuffer-
>         xrgb8888.html> (Intel XE#1406 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1406> / Intel XE#2387 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2387>)
>   *
> 
>     igt@kms_psr@fbc-pr-cursor-plane-move:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_14022/shard-dg2-463/igt@kms_psr@fbc-pr-
>         cursor-plane-move.html> (Intel XE#1406 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1406> / Intel
>         XE#2850 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2850> / Intel XE#929 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/929>) +9 other tests skip
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14022/shard-lnl-1/igt@kms_psr@fbc-pr-cursor-
>         plane-move.html> (Intel XE#1406 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1406>) +2 other tests skip
>   *
> 
>     igt@kms_psr@pr-sprite-plane-onoff:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14022/shard-bmg-8/igt@kms_psr@pr-sprite-plane-
>         onoff.html> (Intel XE#1406 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1406> / Intel XE#2234 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2234> / Intel
>         XE#2850 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2850>) +10 other tests skip
>   *
> 
>     igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14022/shard-bmg-6/igt@kms_rotation_crc@primary-y-
>         tiled-reflect-x-0.html> (Intel XE#2330 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2330>)
>   *
> 
>     igt@kms_rotation_crc@sprite-rotation-90:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14022/shard-bmg-7/igt@kms_rotation_crc@sprite-
>         rotation-90.html> (Intel XE#3414 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3414> / Intel
>         XE#3904 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904>)
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_14022/shard-dg2-432/
>         igt@kms_rotation_crc@sprite-rotation-90.html> (Intel XE#3414
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414>)
>   *
> 
>     igt@kms_scaling_modes@scaling-mode-center:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14022/shard-bmg-8/igt@kms_scaling_modes@scaling-
>         mode-center.html> (Intel XE#2413 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2413>)
>   *
> 
>     igt@kms_setmode@invalid-clone-exclusive-crtc:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14022/shard-bmg-7/igt@kms_setmode@invalid-clone-
>         exclusive-crtc.html> (Intel XE#1435 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1435>)
>   *
> 
>     igt@kms_sharpness_filter@invalid-filter-with-scaling-mode:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14022/shard-bmg-8/
>         igt@kms_sharpness_filter@invalid-filter-with-scaling-mode.html>
>         (Intel XE#6503 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/6503>) +2 other tests skip
>   *
> 
>     igt@kms_tiled_display@basic-test-pattern:
> 
>       o shard-bmg: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14022/shard-bmg-5/igt@kms_tiled_display@basic-
>         test-pattern.html> (Intel XE#1729 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1729>)
>       o shard-dg2-set2: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_14022/shard-dg2-466/
>         igt@kms_tiled_display@basic-test-pattern.html> (Intel XE#1729
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729>)
>   *
> 
>     igt@kms_tv_load_detect@load-detect:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_14022/shard-dg2-436/
>         igt@kms_tv_load_detect@load-detect.html> (Intel XE#330 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/330>)
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14022/shard-lnl-2/igt@kms_tv_load_detect@load-
>         detect.html> (Intel XE#330 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/330>)
>   *
> 
>     igt@kms_vrr@flip-basic-fastset:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14022/shard-bmg-4/igt@kms_vrr@flip-basic-
>         fastset.html> (Intel XE#1499 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1499>)
>   *
> 
>     igt@panthor/panthor_gem@bo_mmap_offset_invalid_handle:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14022/shard-bmg-5/igt@panthor/
>         panthor_gem@bo_mmap_offset_invalid_handle.html> (Intel XE#6530
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6530>) +2
>         other tests skip
>   *
> 
>     igt@panthor/panthor_query@query:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14022/shard-lnl-8/igt@panthor/
>         panthor_query@query.html> (Intel XE#6530 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/6530>)
>   *
> 
>     igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_14022/shard-dg2-435/igt@sriov_basic@enable-
>         vfs-bind-unbind-each-numvfs-all.html> (Intel XE#1091 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1091> / Intel
>         XE#2849 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849>)
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14022/shard-lnl-2/igt@sriov_basic@enable-vfs-
>         bind-unbind-each-numvfs-all.html> (Intel XE#1091 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1091> / Intel
>         XE#2849 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849>)
>   *
> 
>     igt@xe_copy_basic@mem-copy-linear-0x369:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_14022/shard-dg2-436/igt@xe_copy_basic@mem-
>         copy-linear-0x369.html> (Intel XE#1123 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1123>)
>   *
> 
>     igt@xe_copy_basic@mem-set-linear-0x369:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_14022/shard-dg2-433/igt@xe_copy_basic@mem-
>         set-linear-0x369.html> (Intel XE#1126 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1126>)
>   *
> 
>     igt@xe_eu_stall@invalid-event-report-count:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_14022/shard-dg2-463/igt@xe_eu_stall@invalid-
>         event-report-count.html> (Intel XE#5626 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/5626>)
>   *
> 
>     igt@xe_eudebug@basic-vm-bind-metadata-discovery:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14022/shard-bmg-8/igt@xe_eudebug@basic-vm-bind-
>         metadata-discovery.html> (Intel XE#4837 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4837>) +18 other
>         tests skip
>   *
> 
>     igt@xe_eudebug@multigpu-basic-client-many:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14022/shard-lnl-4/igt@xe_eudebug@multigpu-basic-
>         client-many.html> (Intel XE#4837 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4837>) +4 other
>         tests skip
>   *
> 
>     igt@xe_eudebug@multiple-sessions:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_14022/shard-dg2-463/igt@xe_eudebug@multiple-
>         sessions.html> (Intel XE#4837 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4837>) +7 other tests skip
>   *
> 
>     igt@xe_evict@evict-mixed-many-threads-small:
> 
>       o shard-bmg: NOTRUN -> INCOMPLETE <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_14022/shard-bmg-8/igt@xe_evict@evict-mixed-
>         many-threads-small.html> (Intel XE#6321 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/6321>) +1 other test
>         incomplete
>   *
> 
>     igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14022/shard-lnl-3/igt@xe_evict_ccs@evict-
>         overcommit-parallel-nofree-reopen.html> (Intel XE#688 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/688>) +2 other tests
>         skip
>   *
> 
>     igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14022/shard-bmg-2/igt@xe_exec_basic@multigpu-no-
>         exec-basic-defer-bind.html> (Intel XE#2322 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2322>) +7 other
>         tests skip
>   *
> 
>     igt@xe_exec_basic@multigpu-once-bindexecqueue:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14022/shard-lnl-8/igt@xe_exec_basic@multigpu-
>         once-bindexecqueue.html> (Intel XE#1392 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1392>) +3 other
>         tests skip
>   *
> 
>     igt@xe_exec_fault_mode@once-invalid-userptr-fault:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_14022/shard-dg2-463/
>         igt@xe_exec_fault_mode@once-invalid-userptr-fault.html> (Intel
>         XE#288 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/288>) +15 other tests skip
>   *
> 
>     igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_14022/shard-dg2-433/
>         igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html>
>         (Intel XE#2360 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2360>)
>   *
> 
>     igt@xe_exec_system_allocator@many-64k-mmap-huge:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14022/shard-bmg-2/
>         igt@xe_exec_system_allocator@many-64k-mmap-huge.html> (Intel
>         XE#5007 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5007>)
>   *
> 
>     igt@xe_exec_system_allocator@once-mmap-huge:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14022/shard-lnl-2/
>         igt@xe_exec_system_allocator@once-mmap-huge.html> (Intel XE#4943
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943>) +7
>         other tests skip
>   *
> 
>     igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap-
>     dontunmap-eocheck:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_14022/shard-dg2-463/
>         igt@xe_exec_system_allocator@threads-many-large-mmap-shared-
>         remap-dontunmap-eocheck.html> (Intel XE#4915 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4915>) +203 other
>         tests skip
>   *
> 
>     igt@xe_exec_system_allocator@threads-many-mmap-new-huge-nomemset:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14022/shard-bmg-7/
>         igt@xe_exec_system_allocator@threads-many-mmap-new-huge-
>         nomemset.html> (Intel XE#4943 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4943>) +22 other tests skip
>   *
> 
>     igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
> 
>       o shard-bmg: NOTRUN -> ABORT <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14022/shard-bmg-6/igt@xe_fault_injection@probe-
>         fail-guc-xe_guc_ct_send_recv.html> (Intel XE#5466 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/5466> / Intel
>         XE#5530 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530>)
>   *
> 
>     igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_14022/shard-dg2-464/
>         igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html> (Intel
>         XE#2229 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229>)
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14022/shard-lnl-7/
>         igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html> (Intel
>         XE#2229 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229>)
>   *
> 
>     igt@xe_module_load@force-load:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_14022/shard-dg2-432/
>         igt@xe_module_load@force-load.html> (Intel XE#378 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/378>)
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14022/shard-lnl-1/igt@xe_module_load@force-
>         load.html> (Intel XE#378 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/378>)
>   *
> 
>     igt@xe_oa@syncs-userptr-wait-cfg:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_14022/shard-dg2-432/igt@xe_oa@syncs-userptr-
>         wait-cfg.html> (Intel XE#3573 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/3573>) +6 other tests skip
>   *
> 
>     igt@xe_pat@pat-index-xelpg:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_14022/shard-dg2-434/igt@xe_pat@pat-index-
>         xelpg.html> (Intel XE#979 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/979>)
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14022/shard-lnl-4/igt@xe_pat@pat-index-
>         xelpg.html> (Intel XE#979 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/979>)
>   *
> 
>     igt@xe_pm@d3cold-basic:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14022/shard-bmg-8/igt@xe_pm@d3cold-basic.html>
>         (Intel XE#2284 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2284>)
>   *
> 
>     igt@xe_pxp@pxp-stale-bo-bind-post-rpm:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_14022/shard-dg2-436/igt@xe_pxp@pxp-stale-bo-
>         bind-post-rpm.html> (Intel XE#4733 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4733>) +1 other test
>         skip
>   *
> 
>     igt@xe_pxp@pxp-stale-bo-exec-post-suspend:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14022/shard-bmg-7/igt@xe_pxp@pxp-stale-bo-exec-
>         post-suspend.html> (Intel XE#4733 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4733>) +2 other
>         tests skip
>   *
> 
>     igt@xe_query@multigpu-query-cs-cycles:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_14022/shard-dg2-434/igt@xe_query@multigpu-
>         query-cs-cycles.html> (Intel XE#944 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/944>)
>   *
> 
>     igt@xe_query@multigpu-query-hwconfig:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14022/shard-lnl-5/igt@xe_query@multigpu-query-
>         hwconfig.html> (Intel XE#944 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/944>)
>   *
> 
>     igt@xe_query@multigpu-query-invalid-extension:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14022/shard-bmg-5/igt@xe_query@multigpu-query-
>         invalid-extension.html> (Intel XE#944 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/944>) +1 other test skip
>   *
> 
>     igt@xe_render_copy@render-stress-2-copies:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_14022/shard-dg2-466/
>         igt@xe_render_copy@render-stress-2-copies.html> (Intel XE#4814
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814>)
>   *
> 
>     igt@xe_sriov_auto_provisioning@exclusive-ranges:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_14022/shard-dg2-464/
>         igt@xe_sriov_auto_provisioning@exclusive-ranges.html> (Intel
>         XE#4130 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130>)
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14022/shard-lnl-5/
>         igt@xe_sriov_auto_provisioning@exclusive-ranges.html> (Intel
>         XE#4130 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130>)
>   *
> 
>     igt@xe_sriov_flr@flr-vfs-parallel:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_14022/shard-dg2-432/igt@xe_sriov_flr@flr-
>         vfs-parallel.html> (Intel XE#4273 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4273>)
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14022/shard-lnl-8/igt@xe_sriov_flr@flr-vfs-
>         parallel.html> (Intel XE#4273 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4273>)
> 
> 
>         Possible fixes
> 
>   *
> 
>     igt@core_hotunplug@hotunplug-rescan:
> 
>       o shard-dg2-set2: INCOMPLETE <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGT_8614/shard-dg2-464/igt@core_hotunplug@hotunplug-
>         rescan.html> -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGTPW_14022/shard-dg2-464/igt@core_hotunplug@hotunplug-rescan.html>
>   *
> 
>     igt@intel_hwmon@hwmon-write:
> 
>       o shard-bmg: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8614/shard-bmg-4/igt@intel_hwmon@hwmon-write.html> (Intel
>         XE#4665 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4665>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_14022/shard-bmg-7/igt@intel_hwmon@hwmon-write.html>
>   *
> 
>     igt@kms_async_flips@async-flip-with-page-flip-events-linear-
>     atomic@pipe-c-edp-1:
> 
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8614/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-
>         flip-events-linear-atomic@pipe-c-edp-1.html> (Intel XE#6054
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6054>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14022/
>         shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-
>         events-linear-atomic@pipe-c-edp-1.html> +3 other tests pass
>   *
> 
>     igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-
>     edp-1:
> 
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8614/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-
>         flip-events-linear@pipe-c-edp-1.html> (Intel XE#5993 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/5993>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14022/shard-
>         lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events-
>         linear@pipe-c-edp-1.html> +3 other tests pass
>   *
> 
>     igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8614/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-
>         displays-1920x1080p.html> (Intel XE#2314 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2314> / Intel
>         XE#2894 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2894>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_14022/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-
>         displays-1920x1080p.html>
>   *
> 
>     igt@kms_cursor_edge_walk@128x128-left-edge:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8614/shard-bmg-6/igt@kms_cursor_edge_walk@128x128-left-
>         edge.html> -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGTPW_14022/shard-bmg-4/igt@kms_cursor_edge_walk@128x128-left-
>         edge.html>
>   *
> 
>     igt@kms_cursor_legacy@flip-vs-cursor-atomic:
> 
>       o shard-bmg: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8614/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-
>         atomic.html> (Intel XE#4633 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/4633>) -> PASS <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_14022/shard-bmg-8/
>         igt@kms_cursor_legacy@flip-vs-cursor-atomic.html>
>   *
> 
>     igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
> 
>       o shard-dg2-set2: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8614/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank-
>         interruptible.html> (Intel XE#301 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/301>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14022/shard-
>         dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html>
>   *
> 
>     igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4:
> 
>       o shard-dg2-set2: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8614/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank-
>         interruptible@bd-hdmi-a6-dp4.html> (Intel XE#301 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/301> / Intel XE#3321
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14022/
>         shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-
>         interruptible@bd-hdmi-a6-dp4.html>
>   *
> 
>     igt@kms_flip@2x-plain-flip-fb-recreate:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8614/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-
>         recreate.html> (Intel XE#2316 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2316>) -> PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_14022/shard-bmg-2/igt@kms_flip@2x-
>         plain-flip-fb-recreate.html> +3 other tests pass
>   *
> 
>     igt@kms_flip@modeset-vs-vblank-race-interruptible:
> 
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8614/shard-lnl-8/igt@kms_flip@modeset-vs-vblank-race-
>         interruptible.html> (Intel XE#3098 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3098>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14022/shard-
>         lnl-1/igt@kms_flip@modeset-vs-vblank-race-interruptible.html> +1
>         other test pass
>   *
> 
>     igt@kms_pm_dc@dc5-dpms:
> 
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8614/shard-lnl-8/igt@kms_pm_dc@dc5-dpms.html> (Intel XE#718
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/718>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14022/
>         shard-lnl-3/igt@kms_pm_dc@dc5-dpms.html>
>   *
> 
>     igt@kms_setmode@basic@pipe-a-hdmi-a-6:
> 
>       o shard-dg2-set2: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8614/shard-dg2-432/igt@kms_setmode@basic@pipe-a-hdmi-
>         a-6.html> (Intel XE#6361 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/6361>) -> PASS <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_14022/shard-dg2-432/igt@kms_setmode@basic@pipe-a-
>         hdmi-a-6.html> +2 other tests pass
>   *
> 
>     igt@kms_setmode@basic@pipe-b-edp-1:
> 
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8614/shard-lnl-5/igt@kms_setmode@basic@pipe-b-edp-1.html>
>         (Intel XE#6361 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/6361>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_14022/shard-lnl-8/igt@kms_setmode@basic@pipe-b-edp-1.html>
>   *
> 
>     igt@kms_vblank@query-idle@pipe-d-dp-2:
> 
>       o shard-bmg: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8614/shard-bmg-6/igt@kms_vblank@query-idle@pipe-d-dp-2.html>
>         -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14022/
>         shard-bmg-4/igt@kms_vblank@query-idle@pipe-d-dp-2.html> +5 other
>         tests pass
>   *
> 
>     igt@xe_exec_basic@multigpu-once-bindexecqueue:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8614/shard-dg2-435/igt@xe_exec_basic@multigpu-once-
>         bindexecqueue.html> (Intel XE#1392 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1392>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14022/shard-
>         dg2-466/igt@xe_exec_basic@multigpu-once-bindexecqueue.html> +1
>         other test pass
>   *
> 
>     igt@xe_exec_threads@threads-bal-mixed-fd-basic:
> 
>       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGT_8614/shard-bmg-6/igt@xe_exec_threads@threads-bal-mixed-
>         fd-basic.html> (Intel XE#3428 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/3428>) -> PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_14022/shard-bmg-7/
>         igt@xe_exec_threads@threads-bal-mixed-fd-basic.html> +5 other
>         tests pass
>   *
> 
>     igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:
> 
>       o shard-dg2-set2: DMESG-WARN <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGT_8614/shard-dg2-435/igt@xe_fault_injection@probe-
>         fail-guc-xe_guc_mmio_send_recv.html> (Intel XE#5893 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/5893>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14022/shard-
>         dg2-435/igt@xe_fault_injection@probe-fail-guc-
>         xe_guc_mmio_send_recv.html>
>   *
> 
>     igt@xe_module_load@load:
> 
>       o shard-bmg: (PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8614/shard-bmg-2/igt@xe_module_load@load.html>, PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8614/shard-bmg-2/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8614/shard-bmg-2/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8614/shard-bmg-4/
>         igt@xe_module_load@load.html>, SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8614/shard-bmg-5/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8614/shard-bmg-6/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8614/shard-bmg-7/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8614/shard-bmg-1/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8614/shard-bmg-6/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8614/shard-bmg-8/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8614/shard-bmg-4/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8614/shard-bmg-4/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8614/shard-bmg-1/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8614/shard-bmg-1/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8614/shard-bmg-5/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8614/shard-bmg-5/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8614/shard-bmg-7/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8614/shard-bmg-7/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8614/shard-bmg-5/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8614/shard-bmg-8/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGT_8614/shard-bmg-8/
>         igt@xe_module_load@load.html>) (Intel XE#2457 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2457>) -> (PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14022/shard-
>         bmg-4/igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_14022/shard-bmg-6/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_14022/shard-bmg-6/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_14022/shard-bmg-6/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_14022/shard-bmg-7/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_14022/shard-bmg-5/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_14022/shard-bmg-7/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_14022/shard-bmg-2/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_14022/shard-bmg-2/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_14022/shard-bmg-1/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_14022/shard-bmg-8/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_14022/shard-bmg-8/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_14022/shard-bmg-8/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_14022/shard-bmg-2/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_14022/shard-bmg-7/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_14022/shard-bmg-4/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_14022/shard-bmg-4/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_14022/shard-bmg-5/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_14022/shard-bmg-1/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_14022/shard-bmg-5/
>         igt@xe_module_load@load.html>)
>   *
> 
>     igt@xe_pm@s2idle-basic:
> 
>       o shard-dg2-set2: INCOMPLETE <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGT_8614/shard-dg2-435/igt@xe_pm@s2idle-basic.html>
>         (Intel XE#4504 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4504>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_14022/shard-dg2-464/igt@xe_pm@s2idle-basic.html>
>   *
> 
>     igt@xe_pm_residency@idle-residency:
> 
>       o shard-dg2-set2: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8614/shard-dg2-432/igt@xe_pm_residency@idle-residency.html>
>         (Intel XE#6362 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/6362>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_14022/shard-dg2-436/igt@xe_pm_residency@idle-
>         residency.html> +1 other test pass
>   *
> 
>     igt@xe_pmu@engine-activity-accuracy-90@engine-
>     drm_xe_engine_class_compute0:
> 
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8614/shard-lnl-8/igt@xe_pmu@engine-activity-
>         accuracy-90@engine-drm_xe_engine_class_compute0.html> (Intel
>         XE#6251 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/6251>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_14022/shard-lnl-7/igt@xe_pmu@engine-activity-
>         accuracy-90@engine-drm_xe_engine_class_compute0.html>
>   *
> 
>     igt@xe_sriov_vram@vf-access-after-resize-down:
> 
>       o shard-bmg: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8614/shard-bmg-5/igt@xe_sriov_vram@vf-access-after-resize-
>         down.html> (Intel XE#5937 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/5937>) -> PASS <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_14022/shard-bmg-2/igt@xe_sriov_vram@vf-
>         access-after-resize-down.html>
> 
> 
>         Warnings
> 
>   *
> 
>     igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
> 
>       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGT_8614/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-
>         toggle.html> (Intel XE#3428 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/3428>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_14022/shard-bmg-6/
>         igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html> (Intel
>         XE#2291 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291>)
>   *
> 
>     igt@kms_flip@2x-flip-vs-suspend-interruptible:
> 
>       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGT_8614/shard-bmg-6/igt@kms_flip@2x-flip-vs-suspend-
>         interruptible.html> (Intel XE#3428 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3428>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14022/shard-
>         bmg-6/igt@kms_flip@2x-flip-vs-suspend-interruptible.html> (Intel
>         XE#2316 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316>)
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8614/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-
>         primscrn-pri-indfb-draw-mmap-wc.html> (Intel XE#2311 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2311>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14022/shard-
>         bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-
>         draw-mmap-wc.html> (Intel XE#2312 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) +8 other
>         tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-blt:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8614/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-
>         scndscrn-cur-indfb-draw-blt.html> (Intel XE#2312 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14022/shard-
>         bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-
>         draw-blt.html> (Intel XE#2311 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2311>) +3 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8614/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-
>         primscrn-indfb-plflip-blt.html> (Intel XE#2312 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14022/shard-
>         bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-
>         blt.html> (Intel XE#5390 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/5390>) +2 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8614/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-
>         scndscrn-shrfb-pgflip-blt.html> (Intel XE#5390 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/5390>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14022/shard-
>         bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-
>         blt.html> (Intel XE#2312 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2312>) +1 other test skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8614/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-
>         primscrn-cur-indfb-move.html> (Intel XE#2313 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2313>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14022/shard-
>         bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-
>         move.html> (Intel XE#2312 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2312>) +4 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8614/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-
>         primscrn-spr-indfb-onoff.html> (Intel XE#2312 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14022/shard-
>         bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-
>         onoff.html> (Intel XE#2313 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2313>) +1 other test skip
> 
> 
>     Build changes
> 
>   * IGT: IGT_8614 -> IGTPW_14022
>   * Linux: xe-4073-4dff427fe8bbfd0bdbf7935d23a2aba0c350ab2d ->
>     xe-4074-2bc418aa7efaae562e49d84e8b28f799cf624745
> 
> IGTPW_14022: 14022
> IGT_8614: 8614
> xe-4073-4dff427fe8bbfd0bdbf7935d23a2aba0c350ab2d: 
> 4dff427fe8bbfd0bdbf7935d23a2aba0c350ab2d
> xe-4074-2bc418aa7efaae562e49d84e8b28f799cf624745: 
> 2bc418aa7efaae562e49d84e8b28f799cf624745
> 

