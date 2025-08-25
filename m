Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BC7ECA0EFA
	for <igt-dev@archiver.kernel.org>; Mon, 25 Aug 2025 09:16:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D2D010E250;
	Mon, 25 Aug 2025 09:16:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M3faGIxP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 779D210E250
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Aug 2025 09:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756113358; x=1787649358;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ky63xy3bKpbJL7S/yeOa1C4KAqRSTDLHAy18Xa9FWH8=;
 b=M3faGIxPG9eJv7GO0zmxv/btbew0euqd43Dg9N6W5Oih1nKkhRryj0BP
 MKKclel+2sdz5900NG6H4DXTN0KknPouiizB1lPMRQH2wl5c5vutriUUl
 cbgGYhnbN8OyQAW948sH2Gd8/1wEHvWSGPMIMDBkNfigzmoL4yjg+VSOE
 fomrcN9sfboU2TSBX9c9vJxELQQ9Zo+w6fwMQta7+rkC3ELUhJ+9KjQEv
 QF+LJAgaD0mtdSna3CZ686F1Yi6Cs0D9IHBakbrvxEvHiYXTU7OdTH1x1
 VH9Qi+c15MKavohVRA0K2V9woISdr0eRQ+sWUonNq02knYQ4PvIrkxj0P w==;
X-CSE-ConnectionGUID: BBIOgqf+RLepQBeXm0XU9A==
X-CSE-MsgGUID: pDtkkfRARCyH14AHJWpGQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="75772480"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="75772480"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 02:15:58 -0700
X-CSE-ConnectionGUID: 9IRfkwq1R0yu8RCGVz/mPg==
X-CSE-MsgGUID: rBMUDhcISc2BVMK9gTxWXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="168852673"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 02:15:58 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 25 Aug 2025 02:15:57 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 25 Aug 2025 02:15:57 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.58) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 25 Aug 2025 02:15:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mDw4IX6HtNtbtNpdrB4/KvD3srRjUtVX2NZqng0A8JaMNzLZAIlVNc9U4Id0Zs9dhxGDzaEclGecYE7AMYY/aDHDhbmsNO7Kiv3XjmGPpVLGpkm4M139ZhmXjHIYeKaGlrUaA3IwokHiNPVICRcbBsTKUFLe0Gtqm3/tBUjrH87dNLiymkgUKZLJytokgrfae5zzcFrICc8bghyJuAJcVRynfzvOBhBXLHhOMmD8r0W3HlAmRYHlw4FCWiGTCXc0N9ZSRU4RWvJMHTwXBaApsdGHf9phzQoKKuFOveq5+WWBfjz0bz30rWAs1zWYqXDWyomWGCBV9Ny/BvATjaoj4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3hs8M8xLM7X350fDKjNO1o8XeLpDCnEy4skmFD7s2us=;
 b=INTPXQZtjy/l4yjkRTHPBdhLV7P2q3uqGyGnFhVhqCeHUg9MPWwjtj43Qc0R6U4pcdRSCH7kPTdVAxol1Aw1vBQ0YCGwaz4yaVmjRQI1ndNo2/rd5H2AsiCfXD9M8OuSIjEoh/2IVsnzCZmGCCNZrU66c9LJLk+Q6srvc+S9205iifHNcgyNdTP4mFL4Ld5vHMuIqnrSHQy+4O72I1i1iv70LZlDqXZI/r1A/+GZQ42uRRzrjLmlpg9XcdFYzW3r9ir7LX7K8Sj5+adkRSttMg64U6xG0aC5u6V3ewBif3HeetPRTXmX29tjApUdLhxmIETBySv6XzqNx1UMfJZKuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by SJ1PR11MB6107.namprd11.prod.outlook.com (2603:10b6:a03:48a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Mon, 25 Aug
 2025 09:15:55 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229%6]) with mapi id 15.20.9052.017; Mon, 25 Aug 2025
 09:15:55 +0000
Message-ID: <a6dc87e9-ef46-44b8-a40b-12574737856d@intel.com>
Date: Mon, 25 Aug 2025 11:15:51 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 i-g-t 1/3] tests/intel/xe_sriov_scheduling: Keep K
 submissions in flight
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Adam Miszczak <adam.miszczak@linux.intel.com>, Jakub Kolakowski
 <jakub1.kolakowski@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Satyanarayana K V P
 <satyanarayana.k.v.p@intel.com>
References: <20250825082254.444880-1-marcin.bernatowicz@linux.intel.com>
 <20250825082254.444880-2-marcin.bernatowicz@linux.intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <20250825082254.444880-2-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0036.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::9) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|SJ1PR11MB6107:EE_
X-MS-Office365-Filtering-Correlation-Id: c9b16ffd-9a33-4278-dc06-08dde3b7fee1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YzdOMTFxcFlYR1hwV1NmdGJQUU9zT0t2RmcreEhzbi8rTTNSdlRheHF5OXBn?=
 =?utf-8?B?RjQ5WFFPejVTVTZhY1NvSGF3R1g2RWdhRCtyUmx4enc3UGlwck5OdUl3dG5W?=
 =?utf-8?B?SXRZMHQzL2pLeERzQzhRQXhueDlxR2g0V0gwQ0dLSDF4Tld6VkVjbk5hOXNp?=
 =?utf-8?B?bU9Qd0xXcHlHSlh3MmpCOENSQ0VUN0RFSHFLUm5LQm1ZMytqYXRTZVlqNWVm?=
 =?utf-8?B?ZGdSRkRMUFJ4c0UwL2RVbkoyQysyaDNYMWgxKzBxZGRmVGFvZHZBdVFuWERu?=
 =?utf-8?B?d1FzVVU0Q3ZtVS9peXc1VFBBMTN1REJETlZiUHBDclJJOUo2Q1J4VUl4a081?=
 =?utf-8?B?cldGUkE3NkFFRnFLTC9JakRDNk9hOU1iZDA5azh6WVUyR01EZjZRc1NLL0dt?=
 =?utf-8?B?UUJPMWlBUCtNR3VMYjlMVmE0dTV3NGVEaW44SVFVQTBrTWk4MkFWazEvUURv?=
 =?utf-8?B?RjFPb3l6Z2ZycHpLd2Z1dmlIYUJpZ2thZ1MwQ3kxd1RWNFRJclJOMEZsblJS?=
 =?utf-8?B?eTY0WWlNaUg3THBXVWhaNWFRNENXZjdveWZVTHJ2TU9qbFdpd0o0cmlDb3Ri?=
 =?utf-8?B?TFg1SUlra0p0THRYV21DUStrU3ZVcTR3ZkN5QWx1K2tudmcrUmJ5WVo5aVp2?=
 =?utf-8?B?VVpvODdMOEdQZk45aklOMGhHWi92VStmQkNIb0plamlKQ2dHd0hiWThEcmhZ?=
 =?utf-8?B?NWxESXRJelNnNVA5OTdrMDFoVHdLWkk1VWZLamJhVjI0SzR4Y2NHTVJ1VEtZ?=
 =?utf-8?B?QU9XVEt3OWp1SUtMMGFnMmpDNXVPSnFMZVNOMlhYV29Cd2x4TkpyaVI0UlZu?=
 =?utf-8?B?L1ZvU1NuSWVzNDJ2bHNQdVgrbzNiUWt0TEZIeHM2ZWpkUS9vTHVuR0JDdlNv?=
 =?utf-8?B?TDdHWS9ua1lYME1uWXhhcWh1RHJoWHYrbjVCTTlTQ2VDaXFVK1NVV0xjVjZR?=
 =?utf-8?B?ZmdYL2lWMlQrWWYvZjhNaFBXRlpQdVhITkRkUWFvWFZ6Uk5KRnhYMEtpKzhR?=
 =?utf-8?B?RFZlNDRCMHp5NGdTVy9xOXhuV1lyWXVwTjFJbHUxU2lRSlEzYW9ZTHB6a1p6?=
 =?utf-8?B?ektuak9PWWpKSU5RcVlwQjBHbFlnbzF1SThEUy9adE8vaXpKSnZQTlBGOUd6?=
 =?utf-8?B?WWNKYitqWGZsOFp4SjExeCt3MDRGSHJTZVdTSkVTSlowWU9xZFQraUtjMlBI?=
 =?utf-8?B?bVZEUUlRVUx2QU9WdG5qMlZXNnZOdWp3SFkrKzI1MVlnUWVONWhYbWs3Ukpx?=
 =?utf-8?B?dERXR05PcEdaUys3UkZpaTdDZkFIUVdhYndXQTRLYU1PeFAycEN6b3hDdnlP?=
 =?utf-8?B?cFhvRis3WStkM2ZhRmFPVXg2bDdXY29objFYYjdsbEF1cFVBQUtPWUxrOEdC?=
 =?utf-8?B?S3VUZVRZTmlLN0dla1pEVzJUU3h4V1plemR0SDBIcU5oWDc5M2ZqSHc1TGtq?=
 =?utf-8?B?S3QreFcvei8zY0RzMHJNcytzVDUxUTNRdERUZGlUSU5zZ2xFSHA4SkZKVGZk?=
 =?utf-8?B?WFB1SDdBbVZubDhqemcyaEN6cEcrOUE1Vm5WSWdsN1RZeFZHekxWSXJIMytv?=
 =?utf-8?B?dUhFYysrNUlmOVhFc3Z4cHoyZ3IzM1N3clpoc3YrdHZHWnVEeWJmRkQ2T3BG?=
 =?utf-8?B?T0NoNFlqMERFbFUwUWVxNW5lcFQwdlIyTUhHZlJuNGdMQkhDejFnS0U2S3NF?=
 =?utf-8?B?WXFuejJqbncycGdVd3hIdlg1ek94czFncnYvVlVqTGhEc0pzcXZkU2QreTFU?=
 =?utf-8?B?OGx2WW92TGltampEbGhwVVNyWXBFK1ZVV3RMS1h4VUhtckR1bGFTanJxOVNn?=
 =?utf-8?B?VVc0WGNtNWpwWHQzcHdaUzJSUXFoUnVMemVlMlhRQi9HbHdUV2E2dlVJenND?=
 =?utf-8?B?bk1zNFQ0czRMbzhLaDg1ckF2bjBCSGhweDlBazhMTk1kRzduL1dEdVlTSWRX?=
 =?utf-8?Q?tfObjHi/Wp0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z0xHc1NlZGNaTGlmQldPWlY1R3RJNUdLR01wQlIrYzRpcEpwR293Wll4d1ZL?=
 =?utf-8?B?bkdJT1R5S0FXdlBhUmNVMjhaZ2F5TVlLK0JmRzBhUm5aVTZXdUVMTFVtOWlo?=
 =?utf-8?B?S3I2ekQxY1FOalZXZ2MrbXg0aUg2T3hzeW1LSlhNY2toU1BlUVhibCtYaUcw?=
 =?utf-8?B?ZndQTEtyYUpwdE9XRVNocTJJTFpvdEZHR2pLRHZlWnlva2drM3ZEWnBzU3VP?=
 =?utf-8?B?ZHlqM09tODBpcm1LMDBISW9kSkZGQkJLbkNsaDZsVHMzbnVCc1pOdVBrVTB6?=
 =?utf-8?B?NjQyQmhkOTlEY25KSllwL3BVMllaYitFZ2dUZDNZaEVZUFhVNTdRa1pFTHZo?=
 =?utf-8?B?eDFHSWZidE9GOHlURkZHVysydkErTU9tLytBeDJzSlRDUFpWUXBJSlllemRn?=
 =?utf-8?B?Tzhad3o2K041ZnhkaDhld2s3Y1VOcW1PRGpCTkZWUzFQQUhuZFdnSEZGUkNK?=
 =?utf-8?B?TlVlMFZXTTYwNUUxRVdtbkFTMGJrdHcydHByV3NXN05IMHF2NFp0QXpwOFdI?=
 =?utf-8?B?NUx0QW5Md253ZVUyaFNDUDkrUThYUjhPcnRpem1JSFVxTmFkc0NwSmh0K2Fu?=
 =?utf-8?B?QlE0alFLZktRbnZtaVpBeE5uR0pFVFd4RUplR2M3VlVXZHhkZ1dmbWYvL3RI?=
 =?utf-8?B?ZGdMTTRCRkVUdmhCOC9XMGlueUF6VmVDRnBKYUpwR0xWM1BXTmV0eTMrYlkr?=
 =?utf-8?B?bWthbVNuUDRVZkFKTDkwMzFqSzlzdm5XQy9PaGQzMkVPd2NPUzdHQWFEMS9l?=
 =?utf-8?B?VjRvb0hWUE1ad0MrU01yRUovanQ1SWQvTzYxTEplUzRybGdueFNOekg1ZGRH?=
 =?utf-8?B?WitxOXc4Z1N3VlRMaEc0T3oxd3lERnJvZ2I5RUc2Q3NuaDhpUmR5Ykc1eWts?=
 =?utf-8?B?UkVLMFVBaFM3Q255b1kwRFdKWlZGeEMySVFZY3QzSW1LbU5wUzRSZjNhZWxv?=
 =?utf-8?B?WHFpRjdCRGJ3eGxLVG51djR4andjV1JLU2loaWp6Wm16ejdwZkN5bWNHTEpS?=
 =?utf-8?B?V3V6ZlYyRnlVanRXS3M1bk4zMXlRRkJUMkxScVVWcnRqOHJKb2VuVG9yUTZo?=
 =?utf-8?B?Nm5hd011UHJtdDdFQjkwMDVNNDdFU1JxUENUSjRJdkh0bTRmaTRKT0haamR2?=
 =?utf-8?B?cFpnb3c2emVTKy9TN1BGcnlNK091ZjJqdXJwRHVUVVFqbTZwWWNGOTZFdlRm?=
 =?utf-8?B?SDUxd21SRTRha25NZkJiaHAwbkgvL2dvdXhtU3JPb3RINDZkRStzbXgweUhN?=
 =?utf-8?B?Wk04eHYwVWRCRURHbDJNTjQ5Zy8vdEVYczJ3RmJYWUtIR3BoTkZhYVA0bkpn?=
 =?utf-8?B?cmJtMnVhc3dBeXZEbHNHcmlpVUlxTWxscGpxMEVyWkdmOEpxREtjSWR5ZkhD?=
 =?utf-8?B?ZjNpbXB6cEx0RTJXMlNIck1HOVVmcmRGMnZUSkNkaWRTS0lxK0hmbkhtdFJD?=
 =?utf-8?B?SU9GTlN6cUMwWU9TU1hwK2lrTExUZmwxRUJRY0h5UEM2OVphSEVmZ0tOZDJ0?=
 =?utf-8?B?d1MrU01mUWUxRi9wY2lSTmZjb2dlekl0bkdZY3d1OTZIUitJNVYzTFJNb1ZH?=
 =?utf-8?B?UTNtUXVsbGREekdHQU1QT2NNclFYbjJWdkkwQVRwVXAyemg4VGd1cWhmbmxY?=
 =?utf-8?B?VWlMREhra3FhdEk2RGkxaTNzR05CSFF1Vi8ra1VMWjgxUVVwa2pCN2JXZmox?=
 =?utf-8?B?RnZLNzVKVkxHZGg2VXNFSzdYN2tWOVljekhZeFZocmZJd0U0ZVdKa0xIRDBo?=
 =?utf-8?B?UFBLMWRWZWh6UVNhQWYxZjFrVklicFNrRkh2cElNdjd3QkJOSXp0YkU1K2tP?=
 =?utf-8?B?NzJPRXZoc0M0ZkZVU0dxM0Z1aG1YY3hCSnk3UEtvdzJiVjlITld2R0xKNXFu?=
 =?utf-8?B?cHpnZEYxNyt1TjkxL21wZk84L3krN0MzaUVITThjek9yZHhQdVphMVF1cm8v?=
 =?utf-8?B?TzBYVU8zaDlDVmNmeExTa2lOR0xLUHJEYmdUSG9hdDZ4SVFuL0tGOXUrM3RK?=
 =?utf-8?B?Tm9SV0FKa3VDajNaS1dZQWVEd1hHTlBoT1NhcWhUbUovRzNrN3hSZTBIaWVo?=
 =?utf-8?B?QlZLRHZJZ0lDZkUzYjdKTXFlNUkzdnRLdXlKRkNpa3ZSMXMrbWVhQ0Z4dXNB?=
 =?utf-8?Q?fwliBEuesKCM/2hHdEruhX0iu?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c9b16ffd-9a33-4278-dc06-08dde3b7fee1
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2025 09:15:55.3073 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ntbmJsFBnDHhdM3sUHEvXjy/zSJ99aH/6qpk4Ah/rGzhUiXvYBN02ZHhricRWzGS+0avU0rtGJOuVx0Y8+CHRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6107
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


On 8/25/2025 10:22, Marcin Bernatowicz wrote:
> Refactor submission to a prefill->wait->refill pipeline so each VF can
> keep K jobs in flight. Introduce per-slot resources (addr/bo/spin/
> out-fence) and submit per slot.
>
> This patch sets K=1, preserving current behavior; follow-ups will pick
> a higher/default K and add CLI control. This improves HW saturation and
> is less sensitive to CPU scheduling hiccups, especially for short jobs.
>
> v2: drop redundant num_syncs init; simplify subm_exec_slot (Lukasz)
>
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>

Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>

> Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> ---
>   tests/intel/xe_sriov_scheduling.c | 124 +++++++++++++++++++++---------
>   1 file changed, 87 insertions(+), 37 deletions(-)
>
> diff --git a/tests/intel/xe_sriov_scheduling.c b/tests/intel/xe_sriov_scheduling.c
> index d69315690..df93eaaca 100644
> --- a/tests/intel/xe_sriov_scheduling.c
> +++ b/tests/intel/xe_sriov_scheduling.c
> @@ -51,13 +51,16 @@ struct subm {
>   	int vf_num;
>   	struct subm_work_desc work;
>   	uint32_t expected_ticks;
> -	uint64_t addr;
>   	uint32_t vm;
>   	struct drm_xe_engine_class_instance hwe;
>   	uint32_t exec_queue_id;
> -	uint32_t bo;
> +	/* K slots (K BOs / addresses / mapped spinners / done fences) */
> +	unsigned int slots;
> +	uint64_t *addr;
> +	uint32_t *bo;
>   	size_t bo_size;
> -	struct xe_spin *spin;
> +	struct xe_spin **spin;
> +	uint32_t *done_fence;
>   	struct drm_xe_sync sync[1];
>   	struct drm_xe_exec exec;
>   };
> @@ -78,43 +81,61 @@ struct subm_set {
>   };
>   
>   static void subm_init(struct subm *s, int fd, int vf_num, uint64_t addr,
> -		      struct drm_xe_engine_class_instance hwe)
> +		      struct drm_xe_engine_class_instance hwe,
> +		      unsigned int inflight)
>   {
> +	uint64_t base, stride;
> +
>   	memset(s, 0, sizeof(*s));
>   	s->fd = fd;
>   	s->vf_num = vf_num;
>   	s->hwe = hwe;
>   	snprintf(s->id, sizeof(s->id), "VF%d %d:%d:%d", vf_num,
>   		 hwe.engine_class, hwe.engine_instance, hwe.gt_id);
> -	s->addr = addr ? addr : 0x1a0000;
> +	s->slots = inflight ? inflight : 1;
>   	s->vm = xe_vm_create(s->fd, 0, 0);
>   	s->exec_queue_id = xe_exec_queue_create(s->fd, s->vm, &s->hwe, 0);
>   	s->bo_size = ALIGN(sizeof(struct xe_spin) + xe_cs_prefetch_size(s->fd),
>   			   xe_get_default_alignment(s->fd));
> -	s->bo = xe_bo_create(s->fd, s->vm, s->bo_size,
> -			     vram_if_possible(fd, s->hwe.gt_id),
> -			     DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> -	s->spin = xe_bo_map(s->fd, s->bo, s->bo_size);
> -	xe_vm_bind_sync(s->fd, s->vm, s->bo, 0, s->addr, s->bo_size);
> -	/* out fence */
> -	s->sync[0].type = DRM_XE_SYNC_TYPE_SYNCOBJ;
> -	s->sync[0].flags = DRM_XE_SYNC_FLAG_SIGNAL;
> -	s->sync[0].handle = syncobj_create(s->fd, 0);
> -	s->exec.num_syncs = 1;
> -	s->exec.syncs = to_user_pointer(&s->sync[0]);
> +	s->addr = calloc(s->slots, sizeof(*s->addr));
> +	s->bo = calloc(s->slots, sizeof(*s->bo));
> +	s->spin = calloc(s->slots, sizeof(*s->spin));
> +	s->done_fence = calloc(s->slots, sizeof(*s->done_fence));
> +
> +	igt_assert(s->addr && s->bo && s->spin && s->done_fence);
> +
> +	base = addr ? addr : 0x1a0000;
> +	stride = ALIGN(s->bo_size, 0x10000);
> +	for (unsigned int i = 0; i < s->slots; i++) {
> +		s->addr[i] = base + i * stride;
> +		s->bo[i] = xe_bo_create(s->fd, s->vm, s->bo_size,
> +					vram_if_possible(fd, s->hwe.gt_id),
> +					DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> +		s->spin[i] = xe_bo_map(s->fd, s->bo[i], s->bo_size);
> +		xe_vm_bind_sync(s->fd, s->vm, s->bo[i], 0, s->addr[i], s->bo_size);
> +		s->done_fence[i] = syncobj_create(s->fd, 0);
> +	}
> +
>   	s->exec.num_batch_buffer = 1;
>   	s->exec.exec_queue_id = s->exec_queue_id;
> -	s->exec.address = s->addr;
> +	/* s->exec.address set per submission */
>   }
>   
>   static void subm_fini(struct subm *s)
>   {
> -	xe_vm_unbind_sync(s->fd, s->vm, 0, s->addr, s->bo_size);
> -	gem_munmap(s->spin, s->bo_size);
> -	gem_close(s->fd, s->bo);
> +	for (unsigned int i = 0; i < s->slots; i++) {
> +		xe_vm_unbind_sync(s->fd, s->vm, 0, s->addr[i], s->bo_size);
> +		gem_munmap(s->spin[i], s->bo_size);
> +		gem_close(s->fd, s->bo[i]);
> +		if (s->done_fence[i])
> +			syncobj_destroy(s->fd, s->done_fence[i]);
> +	}
>   	xe_exec_queue_destroy(s->fd, s->exec_queue_id);
>   	xe_vm_destroy(s->fd, s->vm);
> -	syncobj_destroy(s->fd, s->sync[0].handle);
> +	free(s->addr);
> +	free(s->bo);
> +	free(s->spin);
> +	free(s->done_fence);
>   }
>   
>   static void subm_workload_init(struct subm *s, struct subm_work_desc *work)
> @@ -122,25 +143,36 @@ static void subm_workload_init(struct subm *s, struct subm_work_desc *work)
>   	s->work = *work;
>   	s->expected_ticks = xe_spin_nsec_to_ticks(s->fd, s->hwe.gt_id,
>   						  s->work.duration_ms * 1000000);
> -	xe_spin_init_opts(s->spin, .addr = s->addr, .preempt = s->work.preempt,
> -			  .ctx_ticks = s->expected_ticks);
> +	for (unsigned int i = 0; i < s->slots; i++)
> +		xe_spin_init_opts(s->spin[i], .addr = s->addr[i],
> +				  .preempt = s->work.preempt,
> +				  .ctx_ticks = s->expected_ticks);
>   }
>   
> -static void subm_wait(struct subm *s, uint64_t abs_timeout_nsec)
> +static void subm_wait_slot(struct subm *s, unsigned int slot, uint64_t abs_timeout_nsec)
>   {
> -	igt_assert(syncobj_wait(s->fd, &s->sync[0].handle, 1, abs_timeout_nsec,
> -				0, NULL));
> +	igt_assert(syncobj_wait(s->fd, &s->done_fence[slot], 1,
> +				abs_timeout_nsec, 0, NULL));
>   }
>   
> -static void subm_exec(struct subm *s)
> +static void subm_exec_slot(struct subm *s, unsigned int slot)
>   {
> -	syncobj_reset(s->fd, &s->sync[0].handle, 1);
> +	struct timespec tv;
> +
> +	syncobj_reset(s->fd, &s->done_fence[slot], 1);
> +	memset(&s->sync[0], 0, sizeof(s->sync));
> +	s->sync[0].type = DRM_XE_SYNC_TYPE_SYNCOBJ;
> +	s->sync[0].flags = DRM_XE_SYNC_FLAG_SIGNAL;
> +	s->sync[0].handle = s->done_fence[slot];
> +	s->exec.num_syncs = 1;
> +	s->exec.syncs = to_user_pointer(&s->sync[0]);
> +	s->exec.address = s->addr[slot];
>   	xe_exec(s->fd, &s->exec);
>   }
>   
> -static bool subm_is_work_complete(struct subm *s)
> +static bool subm_is_work_complete(struct subm *s, unsigned int slot)
>   {
> -	return s->expected_ticks <= ~s->spin->ticks_delta;
> +	return s->expected_ticks <= ~s->spin[slot]->ticks_delta;
>   }
>   
>   static bool subm_is_exec_queue_banned(struct subm *s)
> @@ -157,6 +189,8 @@ static bool subm_is_exec_queue_banned(struct subm *s)
>   static void subm_exec_loop(struct subm *s, struct subm_stats *stats,
>   			   const struct subm_opts *opts)
>   {
> +	const unsigned int inflight = s->slots;
> +	unsigned int submitted = 0;
>   	struct timespec tv;
>   	unsigned int i;
>   
> @@ -165,16 +199,24 @@ static void subm_exec_loop(struct subm *s, struct subm_stats *stats,
>   		tv.tv_sec * (uint64_t)NSEC_PER_SEC + tv.tv_nsec;
>   	igt_debug("[%s] start_timestamp: %f\n", s->id, stats->start_timestamp * 1e-9);
>   
> -	for (i = 0; i < s->work.repeats; ++i) {
> -		igt_gettime(&tv);
> +	/* Prefill */
> +	if (s->work.repeats) {
> +		unsigned int can_prefill = min(inflight, s->work.repeats);
>   
> -		subm_exec(s);
> +		for (i = 0; i < can_prefill; i++)
> +			subm_exec_slot(s, i % inflight);
> +		submitted = can_prefill;
> +	}
>   
> -		subm_wait(s, INT64_MAX);
> +	/* Process completions in order: sample i -> slot (i % inflight) */
> +	for (i = 0; i < s->work.repeats; ++i) {
> +		unsigned int slot = i % inflight;
>   
> +		igt_gettime(&tv);
> +		subm_wait_slot(s, slot, INT64_MAX);
>   		igt_stats_push(&stats->samples, igt_nsec_elapsed(&tv));
>   
> -		if (!subm_is_work_complete(s)) {
> +		if (!subm_is_work_complete(s, slot)) {
>   			stats->num_early_finish++;
>   
>   			igt_debug("[%s] subm #%d early_finish=%u\n",
> @@ -183,6 +225,14 @@ static void subm_exec_loop(struct subm *s, struct subm_stats *stats,
>   			if (subm_is_exec_queue_banned(s))
>   				break;
>   		}
> +
> +		/* Keep the pipeline full */
> +		if (submitted < s->work.repeats) {
> +			unsigned int next_slot = submitted % inflight;
> +
> +			subm_exec_slot(s, next_slot);
> +			submitted++;
> +		}
>   	}
>   
>   	igt_gettime(&tv);
> @@ -607,7 +657,7 @@ static void throughput_ratio(int pf_fd, int num_vfs, const struct subm_opts *opt
>   		igt_assert_fd(vf_fd);
>   		set->data[n].opts = opts;
>   		subm_init(&set->data[n].subm, vf_fd, vf_ids[n], 0,
> -			  xe_engine(vf_fd, 0)->instance);
> +			  xe_engine(vf_fd, 0)->instance, 1);
>   		subm_workload_init(&set->data[n].subm,
>   				   &(struct subm_work_desc){
>   					.duration_ms = job_sched_params.duration_ms,
> @@ -702,7 +752,7 @@ static void nonpreempt_engine_resets(int pf_fd, int num_vfs,
>   		igt_assert_fd(vf_fd);
>   		set->data[n].opts = opts;
>   		subm_init(&set->data[n].subm, vf_fd, vf_ids[n], 0,
> -			  xe_engine(vf_fd, 0)->instance);
> +			  xe_engine(vf_fd, 0)->instance, 1);
>   		subm_workload_init(&set->data[n].subm,
>   				   &(struct subm_work_desc){
>   					.duration_ms = duration_ms,
