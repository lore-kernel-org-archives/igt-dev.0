Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CD0EC52D7B
	for <igt-dev@archiver.kernel.org>; Wed, 14 Aug 2024 12:25:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C109E10E45F;
	Wed, 14 Aug 2024 12:25:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z69u9nVx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87C0D10E45F
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Aug 2024 12:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723638333; x=1755174333;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=caszrmgmss6l/eQZtMcC3DOw9NKhIaVjin1A3MtQDf0=;
 b=Z69u9nVx/G8//UBqj/XhSZrCa+GP3JHeF53vKvd31fzzrVMa6Bu89Av3
 92MdJXR7Rj4yrZNz2YHe3qJZrRL7Qi+UNDKsGbmEW1ZhYuIdiJ6EYxD6S
 nI5fz04Ks+bg7rGsTs+7UwWBnSpsNCGU5srI+X4Kw+DnXJ4IPA8sjkfDi
 SYHpddjlsWs64DcyST5YX6BRmQDJvxgHbKEM8D22MdY81NOVT5PI0Ocs8
 ZkWjkExLVh+Xct4Jd4o5wfpQGQLIShRur6PI563vir/NLmPmS9zeZtrYG
 wZZoYgRm2wrySIxHChpKshf/gYmUkS1dZxhyX/95QkmMDBDmoCYF/aTln g==;
X-CSE-ConnectionGUID: tJvMqgHeR4ebL/lN9ScWvQ==
X-CSE-MsgGUID: vN504pxaRpeRQl+WLNXP/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="32475123"
X-IronPort-AV: E=Sophos;i="6.10,145,1719903600"; d="scan'208";a="32475123"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 05:25:32 -0700
X-CSE-ConnectionGUID: QVSrgvzdRbuqUrLXufJOaw==
X-CSE-MsgGUID: Lv7fZHCsRVuEXDTZ4bigMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,145,1719903600"; d="scan'208";a="63880041"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Aug 2024 05:25:32 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 14 Aug 2024 05:25:31 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 14 Aug 2024 05:25:31 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 14 Aug 2024 05:25:31 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 14 Aug 2024 05:25:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=au32MEgV501/KL4chgQB/l8qqTdixjGQSdMXqzUlcVmLSbXdm0DfpuPwf2SLg96iEyvsjMHZaB2xWIW731Qi6h5bDlmdjiVC1kg4yZFPu8rd8qnrt8gdOa5qTmsI8fNJzslUPIm8wlSk0LgLsBUsrKHlSrjyTnsZcB+i8VIKFEUYXSV6XHk/i/OOwh8/9CEZpog7sHR3SOEQI29Qa8om3LNxi1kfGu+iGcLgMTJLXo7DIwbTgH5AOKIBr2AQofKEa1VLTJ4Mf9DSxJCLo45ElkE4rcxJ+SFgOmPCw50LJyNtUk4i1dbvByL/o/SURUcO3ulLc47tZcx/8p5P2kolig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mhDf8jJL8NTMJSwgtASUze3H5WT30dWK/grYvg8LvLQ=;
 b=G3coArxsisonIHAAI5qyL17CQUzxv+74k92OI9aKtKOnrS2gNnnCg5GnCMZfPTyjxMNwd0BT7qUBz2wxc5Ty/2109PFD2AtnO84l5LHym6p8ho30MqlECAgTqvwM1ZLhyxtwVVzYuAvzonE0rSChVVVoHVRpFVpYrV2s87NEBIwduChEOgpBDeENh5M6UnhKH7vzRsHLXuc8ro1XRc6CSP4TPoo87N0A+1lm3GFEwPlDLWFR8ugRQyEIZ7QQ5sVYxYuzlSwXxTm7Lwr1lDQIvJ6190Fbwman4TmzT1znsCh7BUgxI9DkknzNbQScZ7vLhrlIrPIiUM600WzbADDuyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by CH0PR11MB5234.namprd11.prod.outlook.com (2603:10b6:610:e1::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.17; Wed, 14 Aug
 2024 12:25:28 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%4]) with mapi id 15.20.7828.031; Wed, 14 Aug 2024
 12:25:28 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <172363699168.1939.14120036984031801571@gjsousa-mobl2>
References: <20240813152141.3151865-1-lucas.demarchi@intel.com>
 <20240813152141.3151865-2-lucas.demarchi@intel.com>
 <172363699168.1939.14120036984031801571@gjsousa-mobl2>
Subject: Re: [PATCH i-g-t 2/2] intel-gfx-fw-info: Allow to print checksum
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>, John Harrison
 <john.c.harrison@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, <igt-dev@lists.freedesktop.org>
Date: Wed, 14 Aug 2024 09:25:24 -0300
Message-ID: <172363832409.1939.8138063044901716592@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: MW4PR03CA0087.namprd03.prod.outlook.com
 (2603:10b6:303:b6::32) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|CH0PR11MB5234:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c5db59b-cb90-4a4b-d918-08dcbc5c2e5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Tzc2aFFBM0tlQUV2dmdNb2ZQYlFxZVhYS2czZkVDWW9iMUtKU3NYd05hbXpC?=
 =?utf-8?B?UlBhc1JpeC81OVR4RVJwRG90M0xOY0FRWGYxU1l0SEtmdnlnOWdBSkc3OUZn?=
 =?utf-8?B?STMzSC9IWnV6TXJpSUpieWFEcjRoU2YxdDVvYmFEUStLdFBQcHVtUUdtekto?=
 =?utf-8?B?MWcvTWI4OFVEOGs1Yk5YbWM5TmZFNVBNVW5rVFdFUU1mQ0RmbEdrcllIc0sx?=
 =?utf-8?B?T3VjbTEyY0xqaEdEejN6VExybVZDT2tUWkxGTzVEZnRaT1ZjamRCak5kMHY1?=
 =?utf-8?B?VGdUeXh0NHp0WTdxZEk5dmVCTS9MdWwrd0F6blptQUxjT3EyajRaR2J1alNE?=
 =?utf-8?B?MS9SSVhKNHI0eUZwYnhHaDB6Rm56YnBrMGJoUnJWTEFIMXg1dDlFK0V2VXpz?=
 =?utf-8?B?dzhmYlZvRzlxaFcxM3hpazdDa3JmSTVibUFSRzdSRk5Uem0zRXBQamRnajNJ?=
 =?utf-8?B?SUNFbjA2cGJmQWNSVk1TWXZwZkZIMWhxb1JNUG0vT0lMV1U2VC9FNm4veURF?=
 =?utf-8?B?WUhJRTNIcmg4RDlvR1pLK1Noa0x5TUcwQ0hwWVNrQUtXaGhjVXNueFRlWjEz?=
 =?utf-8?B?UWxEOWd6VjUxZUxBT3hHMTl0MVQ0dUhyb2thTS9tZ055VUNlaGthdGVMckVY?=
 =?utf-8?B?NnhQTGszWEozbzdVOWt5ZE9SWWphK205bDlDV0hnZ3RkcTh4cjBIUXdTOEFO?=
 =?utf-8?B?aTh0RERFNS9yZjQ1VVc4TnlXMUdJU0tFSGE5R3daazlaSTduOHQ3NmpPWGpN?=
 =?utf-8?B?NTNnWmsvbHZqQ2pGZFA0WitnUjJJdi8rUU9GWWlwTmJRcDFrMldhZ0thNzNV?=
 =?utf-8?B?cVZZRG1za2VtbWtXM2pjbWlqR1BjcnYxczRHN2lZbnVrMy9jYTREV1l4SHpq?=
 =?utf-8?B?U0lZU2dDSU1XVjBvSkZkcnNYbFFXMmhTb0xSODU5ZldBNkZiMzBqc0FoMUdq?=
 =?utf-8?B?QkQxMzVjL1ZPaWljRlc2QkIyZlhNZlBHYmFVMkpzNHpxMm81Q3JralBZOEhU?=
 =?utf-8?B?VTZpeTdYckJqcTJhVEdwaVprY21HSytDdUpHaU53eVpKWVc2Uk1CR0NlSFBN?=
 =?utf-8?B?NHVoRE12UFJKMFNJVGI2cERiaEFkcjZuV3ZDMk9KRTV4Wlc1TVhwL2xnSzB1?=
 =?utf-8?B?Z3FFL0c1dzRpVkpxZVdxS2oyeCthU1drYXc0NnVFRmRpajFieVlZWWE2SEZU?=
 =?utf-8?B?M1JQM0xpNUlSOU1NRVFHbmtaVndvVXIrQXBmRi8xcmpFZFljbjdIZTh3c0Fq?=
 =?utf-8?B?WU56eTdta2I4TkxwVmhsbkRoVzFFQm0zN0dXVHl1d1JITG4xdGRXN2g1cUhV?=
 =?utf-8?B?eStDVjFoM1VzelZnSG05cWR2bmJxMkNzSTkyeUJFM2hXZTloc1ZKVHBwYWIr?=
 =?utf-8?B?WVRkZ2ZSNEFZR090OHN3US9LamFEVUF5cDQ1RDBQQzZob012WFFONkRWOTNZ?=
 =?utf-8?B?alJkbmZndHRxcEhhQnhqaUh6SkVyWTEyMVZsRk0zdUF0dVloQ3Y4WTZ5Qnlk?=
 =?utf-8?B?elgzZjIza0ZCSzFxc3g0TXRqTWZNSFM2REVFSE5EN3RaL1lHdkV5Y0FRYm4v?=
 =?utf-8?B?NmNPenUwY3BqM1k4KzlKWGc3NUpJSVdRSU1rVW96K3NsN01ReWNQNVhYVkl4?=
 =?utf-8?B?S2Rxa0gwL0pMaWZPU1Jiamc2Ty9hTTBSbGpJeTNPZXlFSHZyVmFyZkJYZlpy?=
 =?utf-8?B?aFpuQXVoSHZ0SmFXdk1sUkkxN3pPS2tHVUdkV3lrSDU3azZzVEEzVjlxYXp4?=
 =?utf-8?B?dmRjcHRDYkZSdTMvNzYyanU2VkxhMXRBK09xK0gvZnkva0k5ZUtPaS91YXRV?=
 =?utf-8?B?c1pacEt5MmhxRi9ISEJpQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RTBmU1lxTHlSaVdtanhlTUVONjlkRStPQUU0NnF4TThnTXdDVjhQVFR4c1ZY?=
 =?utf-8?B?aTdpUiszRzN6MzRFclkrN1FhQ0o1U0tMbzh0VzdZRDdiTHllUzRYMFdHaFpN?=
 =?utf-8?B?TmlKYXRDTkFValVES2lvVFdSWVBkRklkclpRdXQrc3ducEt6by9xUDcvTVd2?=
 =?utf-8?B?dU45aUdZMlJMN2dPRkFVMXozdUNhVzdCRU9OdkNQQUNWZzU3Y1A1TmtBVmhr?=
 =?utf-8?B?NWNkemZrTFNSYUdVRVVTUXl3dzNZaGI1UWJZVUpVaEpUcHQxWllJUExHc2g2?=
 =?utf-8?B?VU5HWXJjK05aK2huTUhiSzNTd0N4cXc4SzBrV0g4SXBlTDNiT2VtcmN5YWxa?=
 =?utf-8?B?ekpyUUR2dFY3NWdDdWdwMTFBV1Fheit3QStEMGpJTkFtaVhJWGYxcFVrSWZx?=
 =?utf-8?B?TWdHK2c2a2hQZlU1S0I5YXUxN1ZUak1KekhuSzNYR0s5T2JWdmVyUSsrM20v?=
 =?utf-8?B?Q0lUU0JFMkp0S0RmS2ZGUXJVWDBWZU04RUJaUFArUXIybnFMM3BPa2EyOWV0?=
 =?utf-8?B?eGFCQk1UbWdIRzFOQ2EzNENGZ0RaYkNJdTZWdHh2VnFIV2c5K0UwcHpQbmZt?=
 =?utf-8?B?Tm1kK2lMSUF1azc2Qnd0enV6OXZJVTlkeUVGR29RWTN1TXpxUUlrU2tYZEFN?=
 =?utf-8?B?N2xidzRrMHZnT0RhckpJY2FzbkNjdElINjhuWHNrYjRvN0x6bVVJaVNReWlv?=
 =?utf-8?B?eTMxQldvbmtmMVl6Vk5YNDhSZ2RKR0R4ZkJDbXdpb25tYWtLS1BOS2lWbUxP?=
 =?utf-8?B?QUt1N3NOSTA0YTNIU3FzbGZjak1XMU5qczVvTGxuQUZ3ZVFMeTVlU1Nmall1?=
 =?utf-8?B?cXBwcGNuWjd0bmx1SlZDUEZQejVzRzRNSGZEcHo5VFRocm1FYUpPME1NaW1i?=
 =?utf-8?B?aDdKWVMvVi9pUGM4S2RybEVhQnJ4ZG9uSzdVV096ekNNbzNVajJCZUxCRXZZ?=
 =?utf-8?B?N1Z0eVEwNG12Q0owKytzNmF2VGY2aThMbTJQaUlGQW1jMDAxQ0FYVERicEx4?=
 =?utf-8?B?U2RnTFJMZGJzZTRYS016eUM3blNOMUw4cHpiK096eGFxaGtkYnlVUXZoVTJt?=
 =?utf-8?B?N3RlN3d0TGNrTEVpeCtVZXovcUZQR3E4YzVvWVhPamFrOGxncXIxUFV5eEFo?=
 =?utf-8?B?Wm4xN3F5clR6Wi9KYnFFSzRPR3c3aWdLTlNXejFtUEpwZTg2YmpSY1gvdS9o?=
 =?utf-8?B?V0tubk0rbWNOcjNVSnVJekdoSFY0VEhYQjJhUnVWb2VTc1JrVHRObXMrRFVp?=
 =?utf-8?B?cXFtY2FOVHduaGVPcWdrZTk0YUI5TmRoVk1tQVI3NWpROGMrS1ZkSE1aQUE0?=
 =?utf-8?B?OE94REtmcUpaczFKS09tSDBmaTB6aStjQVlBU3lGTk9CSTVzNGNDMXgwbjIy?=
 =?utf-8?B?c2lXUG5rNGhTZ0ZaTWhXRGF3Ump1S0dGSmZVa3JaODAvRnU1UzJoMWFrZ0pv?=
 =?utf-8?B?aWZTNWRyNWlnTmM0UzQxaVJ5Yk5wR0ZtU09KeWhJMnlDcHI4MThWamp1VElH?=
 =?utf-8?B?L2hVa09ZRUlvb1RHMmQvVVErYVNMUEZiMnB0T2Q2Y0NkdVRENTdheXdFY3pK?=
 =?utf-8?B?ZFlNd255djBHZG1RdHFjT1NaNnBSQS9tOFVCdWVHQ09oeHF0c3Iwdm1CU0dq?=
 =?utf-8?B?RFVwYldwSDZOL0xEQW5LSW5uZkZXcG12ZVFhL21CR2JBcml3NWpoQnJJalRz?=
 =?utf-8?B?cEdwdllHN2ZFSVRtYk85S05yMjhNRmhhendmNi9BWDU0YlMvc1F0VVJIcUdv?=
 =?utf-8?B?RFhEcUpNNnQwZEluUFNEcnN5N0hQekRTUjdOeXY3SUtMSUlFeXlsK0FKalo4?=
 =?utf-8?B?c05CekdBWFljU0I2dXExU3hjbzJ4djFmOExKclppeDc0a3QwajhLK3VoN1k3?=
 =?utf-8?B?d0tqTmpVQWNINnhOczdLeW95ZTEwd2FLTFRNL0JDbTNzcnF3d01ZekoxNDEv?=
 =?utf-8?B?SDl0RDN4WFdFeTE2L1h5Y0JSeWV0SHU3SXd6M3R4Y2xoZVlWc01QVGZSN1ps?=
 =?utf-8?B?cGF3VExLVHF3Vy9CY3ZzV050YWoxSWNQTnJQUG01R1drZ0drVXR1QWVacDBG?=
 =?utf-8?B?TkFUNmlWT3pUeWtySjRHV3Azc1JlVnQyK2tzaWUvUk81VVBqQklNY1lBWGg3?=
 =?utf-8?B?SWFzcVMvRVBuME1WZ1haaC8vQ3p3L3E5cmQ1STgxTHArVXpYUldvcUVBVkZR?=
 =?utf-8?B?NWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c5db59b-cb90-4a4b-d918-08dcbc5c2e5f
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2024 12:25:28.3691 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vONMLMf0byeefdnC24uwNwL+rxzDY6cuqIG1fNl+FPHNFLISDwy635RjEq3STSOc+7pfQ1yDbVSbwpfSm9a9bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5234
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

Quoting Gustavo Sousa (2024-08-14 09:03:11-03:00)
>Quoting Lucas De Marchi (2024-08-13 12:21:41-03:00)
>>Choose a checksum algo and use it to print when parsing a firmware.
>>This may be useful in CI to dump what is the exact firmware used
>>and may also be useful when inspecting the firmware repo and making
>>sure mistakes are not introduced. Configuring intel-gfx-fw-info a diff
>>driver:
>>
>>        firmware $ echo "*.bin   diff=3Dintelfw" >> .git/info/attributes
>>        firmware $ git config --local \
>>                diff.intelfw.textconv \
>>                "<path-to-igt>/tools/intel-gfx-fw-info -c"
>>
>>Example for the LNL update that happened recently:
>>
>>        firmware $ git diff --text bc42cdc34bd8 b5bef5bdbab1 --  xe/lnl_g=
uc_70.bin
>>        diff --git a/xe/lnl_guc_70.bin b/xe/lnl_guc_70.bin
>>        index 785763163..75a1958f7 100644
>>        --- a/xe/lnl_guc_70.bin
>>        +++ b/xe/lnl_guc_70.bin
>>        @@ -1,3 +1,3 @@
>>        -version: 70.20.0
>>        -date: 2024-02-09
>>        -checksum: 0809f459048a23716fd3019074f36812163e027835cbb43acfcfe7=
2cd83fb0cc
>>        +version: 70.29.2
>>        +date: 2024-07-26
>>        +checksum: e7ceae28b06bd71c53fe177f4f6787aac88956d8944fa02b1ab2ec=
53b1e961e4
>>
>>If for some reason there's only a checksum change, something went wrong,
>>and without it we wouldn't notice when using this tool as a diff driver.
>>
>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>
>Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

By the way, "Dump GuC/HuC firmware header" is not a very accurate
description for this command anymore, since we skip doing that after
this. Maybe extend this patch to replace it with "Dump GuC/HuC firmware
information"?

--
Gustavo Sousa

>
>>---
>> tools/intel-gfx-fw-info | 17 +++++++++++++++++
>> 1 file changed, 17 insertions(+)
>>
>>diff --git a/tools/intel-gfx-fw-info b/tools/intel-gfx-fw-info
>>index c0d9b00ac..31dc78776 100755
>>--- a/tools/intel-gfx-fw-info
>>+++ b/tools/intel-gfx-fw-info
>>@@ -6,6 +6,7 @@
>>=20
>> import argparse
>> import logging
>>+import hashlib
>> import sys
>> import typing
>>=20
>>@@ -151,18 +152,26 @@ def parse_args(argv: typing.List[str]) -> argparse.=
Namespace:
>>=20
>>     parser.add_argument("-x", "--raw", action=3D"store_true",
>>                         help=3D"Also print raw header content")
>>+    parser.add_argument("-c", "--checksum", action=3D"store_true",
>>+                        help=3D"Also print checksum")
>>=20
>>     parser.add_argument("filename", help=3D"GuC/HuC firmware file")
>>=20
>>     return parser.parse_args(argv)
>>=20
>>=20
>>+def calculate_checksum(f: typing.BinaryIO) -> str:
>>+    return hashlib.sha256(f.read()).hexdigest()
>>+
>>+
>> def main(argv: typing.List[str]) -> int:
>>     args =3D parse_args(argv)
>>=20
>>     cparser =3D cstruct.cstruct()
>>     cparser.load(CDEF)
>>=20
>>+    checksum =3D None
>>+
>>     try:
>>         with open(args.filename, mode=3D"rb") as f:
>>             magic =3D cparser.magic(f)
>>@@ -171,6 +180,11 @@ def main(argv: typing.List[str]) -> int:
>>                 fw =3D FwGsc(cparser.uc_huc_gsc_header(f))
>>             else:
>>                 fw =3D FwCss(cparser.uc_css_header(f))
>>+
>>+            if args.checksum:
>>+                f.seek(0, 0)
>>+                checksum =3D calculate_checksum(f)
>>+
>>     except FileNotFoundError as e:
>>         logging.fatal(e)
>>         return 1
>>@@ -181,6 +195,9 @@ def main(argv: typing.List[str]) -> int:
>>         print("raw dump:", end=3D"")
>>         cstruct.dumpstruct(fw.fw, color=3Dsys.stdout.isatty())
>>=20
>>+    if checksum:
>>+        print(f"checksum: {checksum}")
>>+
>>     return 0
>>=20
>>=20
>>--=20
>>2.43.0
>>
