Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC7F5C282C5
	for <igt-dev@archiver.kernel.org>; Mon,  3 Mar 2025 08:21:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EE5310E367;
	Mon,  3 Mar 2025 08:21:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YioEb2Tc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F36710E367
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Mar 2025 08:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740990075; x=1772526075;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4xyZX+q5V+mnWCRUxRJTsnkQj95htyDiZFnznD4F/cc=;
 b=YioEb2TcHp84UXgXNKMIyPsc1gmB7UuuaSVEQX7/cIfKTHpDb5qNHiOi
 zrTZTJ9MYVFSCkLZLqHSFt9zpCoW3fJeYqYS6U5pDWv99wAEJKpk5RD0W
 SXTjetPqmyxmaPx2MZf1XKr2o3rZHV8ovqxsNZ10VAwaZLwWV+eQ3wvHb
 ZSEIZ/sJ7fgqfY4kDCGw7Ap7n0fapfUe04LMK9mcK1ZEMDM4hUx+z0VeA
 I5ka3KOrDNY4wNtJexYYY48hwTBoWnCHMvb7vD8CXfK2GlVU4ZA8HEgTi
 ymCGLoFhjuDQ83TOw6opd5wdWYEEcGDeGcs+agUf3AjP9ZkV1M0WiwxDS w==;
X-CSE-ConnectionGUID: 3ohhLP6GRLKvLqqbJJDWiw==
X-CSE-MsgGUID: +g3lc+QwQ1usVw8sIhoBJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11361"; a="45783387"
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; d="scan'208";a="45783387"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 00:21:14 -0800
X-CSE-ConnectionGUID: dkPY5QnRTwWrNVGiquWmRQ==
X-CSE-MsgGUID: BIK8cANgTKSX3i/kZD0Sng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; d="scan'208";a="117682982"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Mar 2025 00:21:13 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 3 Mar 2025 00:21:13 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 3 Mar 2025 00:21:13 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 3 Mar 2025 00:21:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S19ljtZ9+5FjokiRoMLKosLchTl67T4mqWUQVkWlzb0wvtaPk3pdsi/SYObDxFmksS/POLoiUMb+1KrLa2NTbKuMKqEcmGcFnUREHRNmp/xKHPwlr+qeDtUhZbf3VEf0TDlYc6SR9+4OQOcxxr2yCVMLRNsy6FcP9Xm0MT0yaaxaG7e1wn7KWJ2Ded45Lkh3tg6tK7MIqBHWXBScL6ahbb9gw+YDSyMkCVBh2EAOx797XnxQzV6Zky7YRxS3FnO3q6A7cgdvv/zxidR7km/Ncp+M+Ty83ckigV5JKfUNpbHAKF/qfU73px5GMyXKg1FLAc4hP364fprgTt1eICzTuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lxakVyFVRYgLR4/dbudldymzheg/Vw4KG/WKFXWwvpA=;
 b=BzPv7KvCTAf5l6mS0huSTU7ove1wd8wTgQg0TDchulRT/nJr2OqNDUAkaWPjvDaSpM/PvdBwueE4tBbxm9eueGq6kefIn7SaBXiZl+qMjnZJB8StwXkD3B/elJdO6cSyxlG2KckrkGJ5FgNNwo4qT5vr+UT8D5GZmtPW6M1SHaDyKGR7XiUXExX+fI6OI/8Y5eq3dtBe7oTO9ddoBjPZUaSrG4713IuXIR7LGKJtxiPIo2QiNPTdcpVFFCihIOc+lqp5nndqZowB/SCG4W+4SNrlJx0pRezkKulPffOTn2biaRUGImLcixH9levedv1Q6EOgCLkY40QgkJPVTlyYMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by CH3PR11MB7345.namprd11.prod.outlook.com (2603:10b6:610:14a::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.26; Mon, 3 Mar
 2025 08:21:05 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229%6]) with mapi id 15.20.8489.025; Mon, 3 Mar 2025
 08:21:04 +0000
Message-ID: <316c9106-cecf-4682-a28d-64951be3dde4@intel.com>
Date: Mon, 3 Mar 2025 09:20:59 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/2] lib/igt_sriov_device: Add intel_is_vf_device
 helper
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Adam Miszczak <adam.miszczak@linux.intel.com>, Jakub Kolakowski
 <jakub1.kolakowski@intel.com>, =?UTF-8?Q?Micha=C5=82_Wajdeczko?=
 <michal.wajdeczko@intel.com>, =?UTF-8?Q?Micha=C5=82_Winiarski?=
 <michal.winiarski@intel.com>, =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?=
 <piotr.piorkowski@intel.com>, Satyanarayana K V P
 <satyanarayana.k.v.p@intel.com>, Tomasz Lis <tomasz.lis@intel.com>
References: <20250219115314.180382-1-marcin.bernatowicz@linux.intel.com>
 <20250219115314.180382-2-marcin.bernatowicz@linux.intel.com>
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
Content-Language: en-US
In-Reply-To: <20250219115314.180382-2-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR07CA0127.eurprd07.prod.outlook.com
 (2603:10a6:802:16::14) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|CH3PR11MB7345:EE_
X-MS-Office365-Filtering-Correlation-Id: 437061f9-399a-4136-557c-08dd5a2c56cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UTN0dFV3aUM4WFp1VlRXNWZiUm5NczFUVTlZR0tZYU5sMzlQYXlDTnB5T0NB?=
 =?utf-8?B?RzVzZ0R1S1U4Mmlza2o2WVdFNTh4RVN2b0VXVG9YT3RycWFlOVRpV3JxM21y?=
 =?utf-8?B?MXRuQ0FLVnFJNW53SGRkeWtHdnorYzlUSGVjZFcyTkxLbmhFV0RxZnZlaGFD?=
 =?utf-8?B?c0ZWVFozbzE0c1JzL2VHTXFXVlU4WTNVbVhkeTUwcGJlYVJlVEpOYzZLYm9J?=
 =?utf-8?B?YmZobC9SWUUzRTdaYWcwQllla2luK05KWFdOMG02Rnh2WUVVdFY4MjlINUZk?=
 =?utf-8?B?b0xCUElvSzRmMk1SWFpWNEQzTWZ5QVBNU09KUURtVGw5S2pSdjlsQVVDYWxh?=
 =?utf-8?B?WkNJQzlSU1NDelF5b0VxVmdUZFRVZ2Z4Z2t1R2dCS0pKSC80NFBNYUQ4cE44?=
 =?utf-8?B?eUVIUUFGYXZVcjJtU2pKeDhyaXBmalJnRHNBWkRkRU10UHo2MHMvbFB0Y1FI?=
 =?utf-8?B?N1AyOVp3K1MvaUFaeVI0Mll4OUs1YnB0dVFHS0tYWGpaVnVYZlZ0ZGNMNkVm?=
 =?utf-8?B?UldmdnNSZlZiS0lpZG1mSm9kQWh0VEYrMHBzM0h4KytVNHdTK091L1hQT1VM?=
 =?utf-8?B?VUlTU0RaZ2lYUVU4TGdkeVdvcHY4NWFWYUJZcmdiRzBhTGE2ZlkybWZCOVRR?=
 =?utf-8?B?NkFCSG9rWit5Q284aXFRMW9lWFA4K2VnbzZhQWd5SERMRVdpUHlFQVBiRzZ6?=
 =?utf-8?B?b3FXZjZ4MHdHNmg5MWJ6UC9VQ2FGbjBxOGwvbldTNk5hbjZzSnlDcmszMkhT?=
 =?utf-8?B?dXhqSytGTWd2eGM5MlgzWDdRTXNGditMQ0RQVU96MGhWUWJFR3BnWWd5NHlK?=
 =?utf-8?B?aXZidzVHNSthRXhUcmhrVDBDdmpmczkrRGxXN0hnSkZKbG9LcWMyTVMzdXk2?=
 =?utf-8?B?YVZ3a3AyLzJFT1o0K25hRU9yZTlic3hSdU8zdk1OU2I2czFHOWQvMzJYdEFL?=
 =?utf-8?B?L1VnbFVkMVBFZHN4S0NhSWF1OVdoQ0ZlZUMyV1I0VmpwMm9EVVovdFZIWWNi?=
 =?utf-8?B?Qnp5aTRsTUpvbEIrRjI2OWNHYmlKM1FqSS9uQ1dtYVN2VDRoK0I0UFZ2enBB?=
 =?utf-8?B?NE4xdkVoVDFEaHVIbEhvdk1LaHZyOEhXc0YxdFd0UUJTbjBUWlEwb3JNKzY4?=
 =?utf-8?B?N2plNE9MQWw3a01EOUdBYWJUVXRhK3RpMVJ3b0xkeVhxemJxQzV3eCtjS2Vx?=
 =?utf-8?B?elNIRGVyeEdBL0RSVkxYS3FJSjhKeXA5NTNLQlQ5dkJGKy9ualZTRndjaGRv?=
 =?utf-8?B?cVdxdURyMGVkUXhKc0hraUZWdi9BTGFod1N2RStybHIwWHJyM1hOdGR2R054?=
 =?utf-8?B?WHJmQngyN1JpMzVqYmFDOVRrN256MkZyY2VOYXFNZ3ltMVdJUE9FVzZHL3Vr?=
 =?utf-8?B?OVZyN243ZElzaldVQlU1a1F2WmdhRzNJUmhHcGV0SWV2VFRHczh3WWIvQXBQ?=
 =?utf-8?B?YncwKzExUFl4RDlwQTc0dkQrSXF3S2VQYmpTZFQxa1FZcGJaNFZEOTVIdnU5?=
 =?utf-8?B?Q3dxcG5SVjFPNFNUMjNzNUsvVUxzQnI4KzY3YXNZZmZ0ZjNYOTYyaUlCR244?=
 =?utf-8?B?V1dzS1RpT0JBRkw0emhlQnRFbkt3RDlUOXcyWmIzelJ6Mml6ZzZqWFpMd3ZP?=
 =?utf-8?B?aXlBRW5pUnFmejQrT2c0MnA3ZC9qZXlHaTlnN3JjN29SQk5YV3J6WW43Y1lK?=
 =?utf-8?B?dGdWa1lTR1ZoWHRrM3lMNHpTUEszRmNKZ2xkRmcrcWJXNTJaVHFJSmIrRDc5?=
 =?utf-8?B?N3hYdnpiUkJYMDNwNkt6NDgza1c1Y3d1dWFTTUVudFRobmh0NmFBa25RVU55?=
 =?utf-8?B?S2tQQWgycGZHc3VDclNnSE5UM1hITmNQbEY1dU1hcTBtbm1jSk0xZ1pJbU9U?=
 =?utf-8?Q?dOiWnbre8qrBT?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S1llTlZ6bzU4VlIwWFBKOGRCcUgram5vVXN1emV1MktFUjhLRWxFbVBCVWly?=
 =?utf-8?B?VzdHQnJYMWExWGhxTVp3WGN4MUJxdnUxUHNsQm1MZjF6OEp0bGllOUJRZGNH?=
 =?utf-8?B?YWczWFRVV3BBMkRKZkNUc0RBc3pmWmdKaENCR1h4cHRyYjJVcmk5YjFRVHoz?=
 =?utf-8?B?UWpram5ZbHhPUnhzS3pjNnpTUEJvczFHdE85ZG9ETldZWGk3akw3YzhuTERB?=
 =?utf-8?B?UGxiaEsxVjBsRW93V21Na0ZHbHp2NFdYOVBFclI4VkVjL3dlVi9wR1I0Zmxh?=
 =?utf-8?B?NTFHcFBsZUkyNXdndnpJRFZRUDUzbllJUjFkV3dNRWY5aXF4SldZUytCaEF4?=
 =?utf-8?B?Tnl2MWcxdCtIeUQwMnBhb0xaUXVteS9jT0t5cVlYTm5wQnEwb0lsVGNjN0pX?=
 =?utf-8?B?bWsvbDRkMEpkc01hS1FzYVBJQmFlLzMzRmdIMDRLYVpaU1p2aWtsVVlzaVR4?=
 =?utf-8?B?ajFKbzlrd2wrTXVVNWc4clhYNmN5SUJvRUN2OVJQdXp6ZURSSHFTUlNsL1FU?=
 =?utf-8?B?MWtZRG94MW54M2F2dEhHdnhGNXNVd2o0ZDV1VkxBdVAyUkNkNDlnOGU3V1VU?=
 =?utf-8?B?T0NDeVdnRVZtTXpoMG9XMzlMaE90cmtuZzdwVEVjMGViamdqRWFHYW5jc05w?=
 =?utf-8?B?UUNhYVVsbjZ3ZC9sa0toUnQ5L2tYUHJYYkJPOVBMYlN3Umlvby8yUnVlRE9O?=
 =?utf-8?B?WXZ0ekh4dUZMN25ROWcwcitBb3djMURNZUN5VTlSM1haVGZBZE1SRm1vazhR?=
 =?utf-8?B?djMrZ0lRQ2hyY3B2YjNOWHNWd2ZJYkovazhHakhuZWpWMnhkdkJzK0cwbjI5?=
 =?utf-8?B?Sy9kempmZ3ZJVjdreHNZSTNBcVRsK29JMHpyMDc4WkEyOEt1V1dEeVQrcUFj?=
 =?utf-8?B?eVVKNXI0bVhMYUM3WmtlZHpQVWx1OWtWVFA3R0pSVzNtQk5zdHMrYVJraHBE?=
 =?utf-8?B?MEhxRlBoUjB3T3JZd3RIdXZsbmRQM1pWMmJSZzErRTY1aUpidkI3VjVNeXNz?=
 =?utf-8?B?MVZtSEpCcE1mUEI3bzJNTWNlUGF5dGp3WS9DR0g3WWpHd0dQMktWWS80NXJR?=
 =?utf-8?B?T29HWkxIbTV5RGhsS01TNGlGM2NRejNLWXRLQS9uYWoyZnB6YmQ4ckNxdGd0?=
 =?utf-8?B?OFE5KzMrQVBVYUQ0OTg4QVEzWGFLdGRGKytWYmZZV04vZmJCNXRXYTVuaVNO?=
 =?utf-8?B?NENycDg1R2NWOGN6Y3RsRHFDbDhGaFg0Q20zaXNGdU1qYmRObFhlekpGM1RB?=
 =?utf-8?B?NG9GSHkwdEJsbDloQXp1d1R6VnNFSlJlWDg0U0pJSEZUL0tDSjFkdDlUTGQr?=
 =?utf-8?B?bWphS1hrVWxjRXJxRlZDNiszaWRWekhRbkxqL09XTjI0L3V5WFd4K3JGWWlG?=
 =?utf-8?B?M0ZnaGJJRnFhU25sRTArMzZ0NmQ3Zkl6bVp4THdMcUV2L01BWkpQMDg0Umln?=
 =?utf-8?B?MWJIcTBqS2hUa3NvUitrTEZTYzhLMzUzM1hMSnNJbDVzOUJjYW0rV0d6S24x?=
 =?utf-8?B?d2M1ZSsweHNlb3B0RXkxR2VpbzNvSG5nY05zNnBsTEVpT1BZUHZKNmY4ZkJ4?=
 =?utf-8?B?MHpEZmhnMXloODhDYUFtUzg2bkpITmdQbmQra0tmYyswRWRJR1FXa2c0Zzlw?=
 =?utf-8?B?NGVoWEFkQUF1M0RYRVNhRDdqd29uTXg0UWNIY1VPWHFzcjM0UVhJc1I2K3NY?=
 =?utf-8?B?ZVRic0NzMHZ3UG5GbjlwTk0zbkJRU0oxQ2p6a203dUVVYTZ3bUtWNmMyTlRT?=
 =?utf-8?B?YnpzYk9LcWdkcTlPeHU2Yk9MaHdYblhua0M2aDQ1REE3K1NnYjZrbFdvYjFP?=
 =?utf-8?B?Zm1NSThQTWJqdTN5YjRTZTdnOEJCVlkyb3MxeVFOclJib3hRY01qQ1kxeThi?=
 =?utf-8?B?enB6MityaWlUQWdxUGd3cDBsblBnUnFXOVFTQ3FIN3pCOEE3VzBTWEhwdXdh?=
 =?utf-8?B?K2tXb2E3dTdRdVlxeFNmSXRNem5YR20rR1RsbWkwRVJsRk1OS3pFamdHUlJs?=
 =?utf-8?B?YVdGQ0UySDYzSFhUODI5amFkYThLWndIc0pWRmZQM2cxNTJsYzdiN2pmU2Ra?=
 =?utf-8?B?c2l2cEY2QUhQRmQyR1JpQmdjaUVBSWFaY2hQOXNDS2J5MzA4U3EwanRSRzdW?=
 =?utf-8?B?aWxudS9JeUZLejQ1amROV295YlpUYzdFc2lyZUtpM1NmQWRBV1VNKzNqcmIz?=
 =?utf-8?B?eHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 437061f9-399a-4136-557c-08dd5a2c56cc
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2025 08:21:04.0136 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g5wEOiVgsFe4IUp/R84v48f5AtQhIe9mB53Sv8chPKtLoTrs49+TeFo6f0L4SfMwaeicbXT4B7qzFHzqsTFoqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7345
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


On 2/19/2025 12:53, Marcin Bernatowicz wrote:
> Introduce intel_is_vf_device helper to determine whether a given device
> is a Virtual Function (VF). The function reads the VF_CAPABILITY_REGISTER
> and checks if the least significant bit is set to identify VF device.
>
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Michał Winiarski <michal.winiarski@intel.com>
> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
> Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Tomasz Lis <tomasz.lis@intel.com>
> ---
>   lib/igt_sriov_device.c | 26 ++++++++++++++++++++++++++
>   lib/igt_sriov_device.h |  1 +
>   2 files changed, 27 insertions(+)
>
> diff --git a/lib/igt_sriov_device.c b/lib/igt_sriov_device.c
> index 2b83cd43c..ffa996d6b 100644
> --- a/lib/igt_sriov_device.c
> +++ b/lib/igt_sriov_device.c
> @@ -14,6 +14,7 @@
>   #include "igt_device.h"
>   #include "igt_sriov_device.h"
>   #include "igt_sysfs.h"
> +#include "intel_io.h"
>   #include "xe/xe_query.h"
>   
>   /**
> @@ -464,3 +465,28 @@ bool igt_sriov_device_reset(int pf, unsigned int vf_num)
>   
>   	return ret;
>   }
> +
> +/**
> + * intel_is_vf_device - Check if device is VF
> + * @device: device file descriptor
> + *
> + * Determines if a device is a Virtual Function (VF)
> + * by reading VF_CAPABILITY_REGISTER. If the least
> + * significant bit is set the device is VF.
> + *
> + * Return:
> + * True if device is VF, false otherwise.
> + */
> +bool intel_is_vf_device(int fd)
> +{
> +#define VF_CAP_REG		0x1901f8
> +	struct intel_mmio_data mmio_data;
> +	uint32_t value;
> +
> +	intel_register_access_init(&mmio_data, igt_device_get_pci_device(fd), false);
> +	value = intel_register_read(&mmio_data, VF_CAP_REG);
> +	intel_register_access_fini(&mmio_data);
> +	igt_require((value & ~1) == 0);

Is it really needed?

> +
> +	return (value & 1) != 0;

just return value & 1 ?

> +}
> diff --git a/lib/igt_sriov_device.h b/lib/igt_sriov_device.h
> index 2b6acb6d7..912449086 100644
> --- a/lib/igt_sriov_device.h
> +++ b/lib/igt_sriov_device.h
> @@ -33,6 +33,7 @@ void igt_sriov_unbind_vf_drm_driver(int pf, unsigned int vf_num);
>   int igt_sriov_device_sysfs_open(int pf, unsigned int vf_num);
>   bool igt_sriov_device_reset_exists(int pf, unsigned int vf_num);
>   bool igt_sriov_device_reset(int pf, unsigned int vf_num);
> +bool intel_is_vf_device(int device);
>   
>   /**
>    * __is_valid_range - Helper to check VF range is valid
