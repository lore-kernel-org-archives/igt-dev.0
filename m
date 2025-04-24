Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F8A7C369C2
	for <igt-dev@archiver.kernel.org>; Thu, 24 Apr 2025 15:41:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0F3910E82C;
	Thu, 24 Apr 2025 15:41:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JebEv6uS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C756610E82C
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Apr 2025 15:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745509259; x=1777045259;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=T6oRV4OM2b7FIUsAdcwsa54ePoB9Ishlwj4os/jq0IY=;
 b=JebEv6uSdjmRj9q3LL/aY4a7M+P/AfLLP+X9zCNotN4cl+PXAT+Wj17/
 KOHpOGnKQwun4s6VbQCkpsFN+Yo9mSyswfqCxI63UcTppfsyQNfr0HvEB
 GOL74+4jiPOdn+DKsGYUvp1IZ8ejyCg68oTbDGOYmcOpSKldEh601nh5W
 XRICdLjvJVuKrD2micIr2GTFYR+3Bw5oDJdzGLYHPPJqPSaXkABMAn1WU
 PTMcXq2CQ8hF97BkIGSCJJSwaeCTu1p1gy4+eewqR7pQ14M92DiS1XNPa
 wMuvDaY7ctckYe7nkVHZbPsNWPHuSjnlr2rBWkpgxwTm27UjaZZUpt5wM w==;
X-CSE-ConnectionGUID: Qj64j/ABSwuUWMfLGPf4lg==
X-CSE-MsgGUID: RB9ozcVoSUCWxyHMGijQGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="47328307"
X-IronPort-AV: E=Sophos;i="6.15,236,1739865600"; d="scan'208,217";a="47328307"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 08:40:58 -0700
X-CSE-ConnectionGUID: O5rfI0GxRPinwIKJ/082aw==
X-CSE-MsgGUID: sIXcHJy0SaqyfZZ9+UAQWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,236,1739865600"; 
 d="scan'208,217";a="137507310"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 08:40:58 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 24 Apr 2025 08:40:57 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 24 Apr 2025 08:40:57 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 24 Apr 2025 08:40:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jg772zWWFFkHVGueLyY36bSwulZcCjZX6PwbJTTp349I7PnNyxYqBusvrYfs2IDfn13JzT0LR/8mrFTDxtW53U4MWxoT5kQt4qEA4x/ra6VUcnal/4YIQKbrYCQpRAk8PlPPFqWol5DNG2C7jbJqfJktIo1X3f6BuvFkA17Gw+EdmjGKeCaPogpqMa/5aqfr99CGXPwzr4v6XWDummInUcWieb6i6bIAXhLqIAiw+0c/uRujWI+IOPdYZ7FgjllA3Ww/OmXFetKlLiPdQ2Vy4+hTx3lptXuwynVvJCwrd5WOAOxpw7gH11jeX5Dblyn1+QA9pDMTr4SDcgcApP8kPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p8sdbq4Yq/sK3bLYQNcHjBMvUeVwDvXO9qxrAXWfiMc=;
 b=e76UK0gWPCE3z95TWunjBDEDifXVTnrG2fWB+VG+GiJhlRfUBB1Eg6zF6KxQ961i0/DE2K3YRNS3xAUZx9mRMS5zsQrtOrKytpIHq4/v+MU8xVXfhul58dIZBOLH3s+icokd+AAu67bXY2oyaqVXpY2gjXKbF69NmXXuTgvlzWmTvGCAco2fjBmml0z/hQ/wdXL5ubY4bES0JOV0zLGT0VSyVhsNn72r8FZg4vNQDeolDp6FprUK38ofF+ISmjppDagoIxjRvtZHiZAtErGNEUetgr3P+8ZFJjSGBASiY8L8EC9q+4K14WMkj2PviIEEQun2XhehbNxtIz1nSiWFZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8706.namprd11.prod.outlook.com (2603:10b6:610:1d1::22)
 by MW5PR11MB5810.namprd11.prod.outlook.com (2603:10b6:303:192::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.34; Thu, 24 Apr
 2025 15:40:33 +0000
Received: from CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::36d3:6033:a101:f961]) by CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::36d3:6033:a101:f961%4]) with mapi id 15.20.8678.025; Thu, 24 Apr 2025
 15:40:33 +0000
Content-Type: multipart/alternative;
 boundary="------------0J7o5lNIRgDA9HPMhK4h4s53"
Message-ID: <e799d64f-9da9-4500-9ec2-e56a9ddb80af@intel.com>
Date: Thu, 24 Apr 2025 21:10:23 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v9 1/5] lib/igt_device_scan: Add support for the
 device filter
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <riana.tauro@intel.com>,
 <vinay.belgaumkar@intel.com>, <kamil.konieczny@intel.com>,
 <krzysztof.karas@intel.com>, <anshuman.gupta@intel.com>,
 <lucas.demarchi@intel.com>, <rodrigo.vivi@intel.com>,
 <ashutosh.dixit@intel.com>
References: <20250422171108.2170758-1-soham.purkait@intel.com>
 <20250422171108.2170758-2-soham.purkait@intel.com>
 <20250423063109.gadkamns7yzcgy6e@zkempczy-mobl2>
Content-Language: en-US
From: "Purkait, Soham" <soham.purkait@intel.com>
In-Reply-To: <20250423063109.gadkamns7yzcgy6e@zkempczy-mobl2>
X-ClientProxiedBy: MA0PR01CA0068.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::14) To CH3PR11MB8706.namprd11.prod.outlook.com
 (2603:10b6:610:1d1::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8706:EE_|MW5PR11MB5810:EE_
X-MS-Office365-Filtering-Correlation-Id: 33279966-2491-4ee2-3f7c-08dd8346598d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WFZURStBQUw3R0dPLzRLd1JkZWhmNDlnQ0RvU00va0hNOXFQUU1iS1FRdXYx?=
 =?utf-8?B?ZHg1K1d4d21YTG1kTVFnV21XREYzdUFZYTlwK0JSRTF3VkovckpOaCswU3o5?=
 =?utf-8?B?Z3pITStrU002aFE0OTdCK0Y3bU9UZHp6d0kwV3gxeTdtc0oyQU9CSUpyZ1Zi?=
 =?utf-8?B?djQ0TjZVSmM5Y2tvMm5aYTBaQ1RvckpsakFGMXdkR2d1N0c0Yk9aNFZabVh6?=
 =?utf-8?B?STUxZGRyanNBSUZvSVBSc1RQdGhJOFBpWUtrenhjRVhuU0tkWTBNNGF5VUZP?=
 =?utf-8?B?UHhpMFdvQmp6SXhkbjhnSE85THA3azFKVDk3ckFkdHU4U2dESjZBYkcvb1M5?=
 =?utf-8?B?bXdjdEpBMmp0cG83QzBudU5hbnlkZ09vaW9SNXB5Q0FCbmZVMlVLd2RlVmJw?=
 =?utf-8?B?amgvVEpZL2ZlME13eUVFK2V3dTdnQ1pwTjNCYnF5ZG5UOEI5aGZWQmljUDlR?=
 =?utf-8?B?UkR2eDlnbTlMdU9Rb0czemJZYmRDRjVUdTdnQ1cyUGVJcnk4SVpyT2RDY2VF?=
 =?utf-8?B?NGdCU0pMZTdaMTFZcDFjZlJMTkFkNmhuRlJCMlN0cENuUW5LMmpFbFFvTW1z?=
 =?utf-8?B?VlJseE5pZlB4eFAyN2I4czRUbDl6N3liMDdGaVB6N0dFdWNhVWxDRmQ4ek93?=
 =?utf-8?B?Y3dXK0lxUHBmZ2dWcUJlMU5uNUdQdElaN3hZUG1Hc01yTnYwV1VPdzVJY3dL?=
 =?utf-8?B?OVI4Wkx2aiswWW5kLzlXWVJIOGlZK0FIMmRFTFdzRTV2YVljTWpEV1dSMGNz?=
 =?utf-8?B?V3MrQnJjRCtPb1l2N0lDbWhpeitQS0hXOXdkcjVvVmxQQ3NIdnByOUVPVnU4?=
 =?utf-8?B?dVRvNHliWWszeXc0Tmg0OGZrUnB1ODlydXRscS9jamU2VEtVQzh4L2ZkSDN5?=
 =?utf-8?B?TzBOUGVtWDZ5OFJqQlRVOU5LUDNYSzgvRFlCU1FHOHFEVFljNXFXeURyWkRF?=
 =?utf-8?B?S1dQL1pQUEI0SlovYWhWYzJSR0xHdngxYkE0Y05VNFNvZkpueDY1RE1UYW9L?=
 =?utf-8?B?dkZrdm5ScGlJcDlMTUZCeGp6cW5xL2pNR1VqSWxHOU1FL1BkRlNWekUrWVQ0?=
 =?utf-8?B?aWNJbGtreHRDL2tjWkRieE5FWkZ2eU5Tc2RsRnhiWWIveHJUalErL3hMbWF3?=
 =?utf-8?B?VnMyeUVpMHlJeXJ0c296dXhMY3NnN3REVk1sUVkweG5OcHgrVHVrVktOT29I?=
 =?utf-8?B?Y3JrYW9SSHEzYjR3aEVjcnJvcVFXVmZhczdHVmJKS3NMeWlJK3p6TDJCemxj?=
 =?utf-8?B?NWRTcmdkQ3Q0Ylg0em5WdUEyakhZRjlQdUU4Y29Mc29TZnBLU0NsVUFGYzgv?=
 =?utf-8?B?VkllYXhzUEZzRjZoeE04TzR4UURSdzJ3QWpMRm5NaC96aUl1THhaMG5ycGdH?=
 =?utf-8?B?NUdWcmxOeUdKUHFxQ0IxdUczL0FGKzRqa0NCaU1ReG40ZmpJUzRiSlJCbWZP?=
 =?utf-8?B?RUdnK1ZBNHNIWE1tdkFSVnlCSmVQTVJjVVk4VnNhTFBtSmlDYnNINVhOWnpN?=
 =?utf-8?B?VURVcE96OGZITno0SjF1bmZKTFA5TDJlWmFVL3VJMzkzVE1IN2h2MnpubUtv?=
 =?utf-8?B?NVAyVVJxL2lDUDgxdjJDNVJYWTJNRXNJMm1rMlBqcWR0K1NpWG5DN0NYK2hY?=
 =?utf-8?B?REdWMEtjV0RsMUJtUGpKSGdGK3NSdVVEc1UzYlY3VlVvcWFhbnQwZGpoczdh?=
 =?utf-8?B?Ynk3VlNxbW1nZFJ4Ui84TWMyK21NSjBPV3Rvc01uOEx5Z2ZxRjNpZjVCbzA1?=
 =?utf-8?B?VzBWSG1ISG1LNFJHNTMrb1o4N1hRVm14aHZXRUdFakhrbGlWNEY5M0M0eVNK?=
 =?utf-8?B?US9QT0JIVnc1WitTdmJ5VGVwMjBMbWdrSzZGWlpOSXEwNXhzZmxuNmkzQTBm?=
 =?utf-8?B?dVRpWGo2MkRPUW1iUDVFVzhXazRiMC9NVG5US3Z4OXNSVE16SzlseExJanZG?=
 =?utf-8?Q?d3NikVtBNZg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8706.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Tkl6UmhQWUpRbVRBWTlKbm9TMDQrNkNMZzYvTWZsbTN2SmgyZXFCd0p4SmZC?=
 =?utf-8?B?V1g5UHJ6S2lGbFhOWlh6bjU3QmRHMzlneW5vU0ZsZWpyY3RIZ0RqeWhGd1ly?=
 =?utf-8?B?S0kyaldIU25CNnkyb0dJRVZBcU9kQjI4MnZxRDhYTFphQ3JQb042dWxhdUVy?=
 =?utf-8?B?K25aTi9QQWZzYXVjMjhQSjg0QWNXMjhOallYZUFpQ2JNS2l0anFDcHE4aFMx?=
 =?utf-8?B?Q2FYc05ubXkweHBGcVB2UXVSRWpVZXVWelFQNUpTNXIvNW1QRnFVVkV5ZDY2?=
 =?utf-8?B?ems2MVNKVzAxb1pYdW9adUJORUIzSG5mVVozNGg1WXp0Y0lRS2Q5R3RRdGhx?=
 =?utf-8?B?ZndHb1dRZWlsaE84ZXZkWmVCV2h5VGVWK29YZXdTQUpkQXVINjZ0R2V0NHpw?=
 =?utf-8?B?VngxV255QmkxcDhoWFNzeFg3bFVXalpxWlFQY1JWNU9BQ2s2VFF6bG1CTms0?=
 =?utf-8?B?UUh5UTc1SmlXNFJzSlVYYTAyZ25wdzZpbGh3YitZTzdWeXpUVENBM2dvYWhB?=
 =?utf-8?B?K0FuUkY4TVpkSnl6dVdVdzRObDhETS9JUmdVcnhETERWU2FBRlEyMUZETGh2?=
 =?utf-8?B?R3JyaU5JZEVPSyt6cU5KZjJjemdDeTc5cVhIMHNxSDhlN1hCdmp6cjlLS05V?=
 =?utf-8?B?YW03cVJXVGNMeERhdHJYVWpzZUVzamRtQk1idnlQM3psT3NnTjM0enRSaUVo?=
 =?utf-8?B?Rm1aaVdOVVppaFE0eFVOZWh3NDJYdVlIT1ljb3RlVFhEcDRNZHc2WDgzN0RM?=
 =?utf-8?B?cHFhc3hkWFM1ZGp5VS9NZzkva3ZOOXFMN294VVYxa0lnallUSWF2VnBCZ253?=
 =?utf-8?B?a1FjWmJhdnhKM2xpeWFxcWRvMU0vUzhhZVdDdkxCUVJTWmUxbXR0U3JpcHpo?=
 =?utf-8?B?M09PcDZzUzl5ZGY1ZVRoWEFGRkdXY0ZoZ3cyM25nY3FjNFRWaXluN0wzODUy?=
 =?utf-8?B?c1NhK1lTMS9WRUFPbEl1WlRKRWwvMVpLc2ljQkhhcGo4azZ5NmxKYVNPV3Bn?=
 =?utf-8?B?elZ2bmg4c1FXQ09lYmcyWGN6R2dyNWNBdXJCS3QwaDhHQmRaKzNvOUJaMkFV?=
 =?utf-8?B?Q0NucVVhZnVrMGNkWGszUGJDWWlENWprVkRDbit2dDErZFc1QkxFeVpoUFNJ?=
 =?utf-8?B?VjRXMTF0RHJSR1Nyd2dLVnl0MFhSWk9PNFR0enVpeUs2L3dNWUYyM2QybjlC?=
 =?utf-8?B?M1NkbGswZlRZRHZiWHV1bmNNdnR4elVHWkxmTHhrakJuZlZNUXZ3SDZhbTJw?=
 =?utf-8?B?ejNkVmVqd2thRHVhY1pYVWRuOW9wVXJmWG15STVJOE5IcVhBcUpHaGFqeitF?=
 =?utf-8?B?amxqTTFtcXRrVmxlOEltazg5SGRNMXNINUVRemtQUmpBNXNPbEVhRGtmS3RM?=
 =?utf-8?B?MjNKRkd5czBPN3MwQ3J5SEErcEhhN1F3SVE4emN3MFp3dE1zRDlaL0wyWWRi?=
 =?utf-8?B?Uk1TT2kvWTFENDVYbVlEMjBTV0ljMDNRQVNXUm9ZTllKMmgvSkFUSUdDQmVN?=
 =?utf-8?B?U2ptbUJwMzF4STZKY29iRDFGQkhwSVdoVG95Qzh4ZHFxT3poWHNITlMxR2VC?=
 =?utf-8?B?ZjB5RjhidldjQ2Y3bU5IQXpJTWFQZ0EvUk5rVDI1UXFSR3pnSFpqTHp3ek13?=
 =?utf-8?B?d1Y2Y3BBeVcyajJwUGMwRTl0dmQ3bGRqWTZqSFl0NldZbGxRYlFRM2h5eE1R?=
 =?utf-8?B?YnRZOFB1NGhkVTdZRkM2R2IyNkVZTEhFTFdNWThBMDc3ZmliZFlLcURmZGw2?=
 =?utf-8?B?VkFsNXkrVjArZ2tWR1haRTgvZWkyVVQ3TEc0Q1NBNkdMWWw3cFRtempFUW4x?=
 =?utf-8?B?ZVhNYkNwZ1ZGck56YTFqT2NscGpzME8vZFpTby8xdWMzc0pwVElLMkRVRkcv?=
 =?utf-8?B?aXVGNWNaU0xnR3BoTEZFMEh4aTFFTTBRYkNvUWtRU2U0M2lXbDcyVXh3WjNn?=
 =?utf-8?B?MEwzdHdieUlNd21lTjhzR2R1OWZDcVYveHpyWCtSYTJ0SE9mR3ZQU01wdFor?=
 =?utf-8?B?aUUwZXRqakI3UWM1cFdwWTVZdllaV2RDOU1SV280MXVmMEdWVDNnVTlpVnBw?=
 =?utf-8?B?YUd6TnU5UnhRMFY5NWw5SUF6YkRJUUxxVEpoYnY0TTVoTXVIM2NVSGMrUjA5?=
 =?utf-8?B?eXNUUnRYWHhXOUdpaUlUUnRnSXBrTzQ4Wk9lb1RJUmNGQStjdjRxUm5IbFFu?=
 =?utf-8?B?UUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 33279966-2491-4ee2-3f7c-08dd8346598d
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8706.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 15:40:33.4071 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rBFMdHOGz7nUPcDBPuAS/Q+HMClh6zgJZQmMW227JekQbndLtoEy7BODi0uBE17LuZgRIWAYzDKdVy7dnFfV7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5810
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

--------------0J7o5lNIRgDA9HPMhK4h4s53
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 23-04-2025 12:01, Zbigniew Kempczyński wrote:
> On Tue, Apr 22, 2025 at 10:41:04PM +0530, Soham Purkait wrote:
>> Add support for the device filter based on
>> driver string, device type (integrated or discrete)
>> and card number.
>>
>> v5 : Add device filter to filter out
>>       matching devices.           (Zbigniew)
>>
>> v6 : Move device filter with Separate
>>       commit.                     (Zbigniew)
>>
>> v7 : Fix interpretation of card numbering
>>       and add 'all' option for all the cards.
>>                                   (Zbigniew)
>>
>> v8 : Fix for card filter output. (Zbigniew)
>>
>> v9 : Render node enabled with 'device:' option
>>       through iterating only pci subsystem
>>       devices in filter.          (Zbigniew)
>>
>> Signed-off-by: Soham Purkait<soham.purkait@intel.com>
>> ---
>>   lib/igt_device_scan.c | 74 +++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 74 insertions(+)
>>
>> diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
>> index 3f26a1737..8859b9489 100644
>> --- a/lib/igt_device_scan.c
>> +++ b/lib/igt_device_scan.c
>> @@ -1709,6 +1709,74 @@ static struct igt_list_head *filter_sriov(const struct filter_class *fcls,
>>   	return &igt_devs.filtered;
>>   }
>>   
>> +/*
>> + * Find appropriate gpu device through matching driver, device type and
>> + * card filter arguments.
>> + */
>> +static struct igt_list_head *filter_device(const struct filter_class *fcls,
>> +					   const struct filter *filter)
>> +{
>> +	struct igt_device *dev;
>> +	bool allcards = false;
>> +	int card = 0;
>> +	(void)fcls;
>> +
>> +	DBG("filter device\n");
>> +	if (filter->data.card) {
>> +		char crdop[5] = {0};
>> +
>> +		if (sscanf(filter->data.card, "%d", &card) == 1) {
>> +			if (card < 0)
>> +				return &igt_devs.filtered;
>> +		} else {
>> +			card = 0;
>> +			if (sscanf(filter->data.card, "%4s", crdop) == 1) {
>> +				if (!strcmp(crdop, "all"))
>> +					allcards = true;
>> +				else
>> +					return &igt_devs.filtered;
>> +			} else {
>> +				return &igt_devs.filtered;
>> +			}
>> +		}
>> +	} else {
>> +		card = 0;
>> +	}
>> +
>> +	igt_list_for_each_entry(dev, &igt_devs.all, link) {
>> +		if (!is_pci_subsystem(dev))
>> +			continue;
> For 'device' filter this condition should be removed. You contain
> 'subsystem' field in igt_device_card so you may skip cards which
> are not pci on populate_devices().
As far as GPUTOP is concern this could be managed through various means 
as previously it was being handled with in igt_device_card_match_all()
through 'request_pci_ss' flag parameter or through comparing 'subsystem' 
field in populate_devices(), as the case may be.

But if this is removed and then this filter is used with lsgpu, it may 
not open render node if any of the filtered device is not the part of 
pci subsystem.

that is :
lsgpu -d device:
(doesn't open render node).

Regards,
Soham

>
>> +
>> +		/* Skip if 'driver' doesn't match */
>> +		if (filter->data.driver && !strequal(filter->data.driver, dev->driver))
>> +			continue;
>> +
>> +		/* Skip if 'device' doesn't match */
>> +		if (filter->data.device && !is_device_matched(dev, filter->data.device))
>> +			continue;
>> +
>> +		/* We get n-th card */
>> +		if (!allcards && !card) {
>> +			struct igt_device *dup = duplicate_device(dev);
>> +
>> +			igt_list_add_tail(&dup->link, &igt_devs.filtered);
>> +			break;
>> +		} else if (!allcards) {
>> +			card--;
>> +		}
>> +		/* Include all the cards */
>> +		else if (allcards) {
>> +			struct igt_device *dup = duplicate_device(dev);
>> +
>> +			igt_list_add(&dup->link, &igt_devs.filtered);
>> +		}
>> +	}
>> +
>> +	DBG("Filter device filtered size: %d\n", igt_list_length(&igt_devs.filtered));
>> +
>> +	return &igt_devs.filtered;
>> +}
>> +
>>   static bool sys_path_valid(const struct filter_class *fcls,
>>   			   const struct filter *filter)
>>   {
>> @@ -1750,6 +1818,12 @@ static struct filter_class filter_definition_list[] = {
>>   		.help = "sriov:[vendor=%04x/name][,device=%04x][,card=%d][,pf=%d][,vf=%d]",
>>   		.detail = "find pf or vf\n",
>>   	},
>> +	{
>> +		.name = "device",
>> +		.filter_function = filter_device,
>> +		.help = "device:[driver=name][,device=type][,card=%d|all]",
> Or you may add 'bus=pci' in 'device:[driver=name][,bus=all(default)|pci|nonpci][,device=type][,card=all]'
>
> and then use filter in gputop.c:
>
> device:bus=pci,card=all
>
> Another alternative is to fix 'pci' filter to collect all devices
> like 'device' filter is doing now.
>
> --
> Zbigniew
>
>> +		.detail = "find device by driver name, device type and card number\n",
>> +	},
>>   	{
>>   		.name = NULL,
>>   	},
>> -- 
>> 2.34.1
>>
--------------0J7o5lNIRgDA9HPMhK4h4s53
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 23-04-2025 12:01, Zbigniew
      Kempczyński wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20250423063109.gadkamns7yzcgy6e@zkempczy-mobl2">
      <pre wrap="" class="moz-quote-pre">On Tue, Apr 22, 2025 at 10:41:04PM +0530, Soham Purkait wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Add support for the device filter based on
driver string, device type (integrated or discrete)
and card number.

v5 : Add device filter to filter out
&nbsp;&nbsp;&nbsp;&nbsp; matching devices.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (Zbigniew)

v6 : Move device filter with Separate
&nbsp;&nbsp;&nbsp;&nbsp; commit.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (Zbigniew)

v7 : Fix interpretation of card numbering
     and add 'all' option for all the cards.
                                 (Zbigniew)

v8 : Fix for card filter output. (Zbigniew)

v9 : Render node enabled with 'device:' option
     through iterating only pci subsystem
     devices in filter.          (Zbigniew)

Signed-off-by: Soham Purkait <a class="moz-txt-link-rfc2396E" href="mailto:soham.purkait@intel.com">&lt;soham.purkait@intel.com&gt;</a>
---
 lib/igt_device_scan.c | 74 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
index 3f26a1737..8859b9489 100644
--- a/lib/igt_device_scan.c
+++ b/lib/igt_device_scan.c
@@ -1709,6 +1709,74 @@ static struct igt_list_head *filter_sriov(const struct filter_class *fcls,
 	return &amp;igt_devs.filtered;
 }
 
+/*
+ * Find appropriate gpu device through matching driver, device type and
+ * card filter arguments.
+ */
+static struct igt_list_head *filter_device(const struct filter_class *fcls,
+					   const struct filter *filter)
+{
+	struct igt_device *dev;
+	bool allcards = false;
+	int card = 0;
+	(void)fcls;
+
+	DBG(&quot;filter device\n&quot;);
+	if (filter-&gt;data.card) {
+		char crdop[5] = {0};
+
+		if (sscanf(filter-&gt;data.card, &quot;%d&quot;, &amp;card) == 1) {
+			if (card &lt; 0)
+				return &amp;igt_devs.filtered;
+		} else {
+			card = 0;
+			if (sscanf(filter-&gt;data.card, &quot;%4s&quot;, crdop) == 1) {
+				if (!strcmp(crdop, &quot;all&quot;))
+					allcards = true;
+				else
+					return &amp;igt_devs.filtered;
+			} else {
+				return &amp;igt_devs.filtered;
+			}
+		}
+	} else {
+		card = 0;
+	}
+
+	igt_list_for_each_entry(dev, &amp;igt_devs.all, link) {
+		if (!is_pci_subsystem(dev))
+			continue;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
For 'device' filter this condition should be removed. You contain
'subsystem' field in igt_device_card so you may skip cards which
are not pci on populate_devices().<span style="white-space: normal"> 
</span></pre>
    </blockquote>
    As far as GPUTOP is concern this could be managed through various
    means as previously it was being handled with in&nbsp;
    igt_device_card_match_all()<br>
    through 'request_pci_ss' flag parameter or through comparing
    'subsystem' field in populate_devices(), as the case may be.
    <pre wrap="" class="moz-quote-pre"><span style="white-space: normal">But if this is removed and then this filter is used with lsgpu, it may not open render node if any of the filtered device is not the part of
pci subsystem.</span></pre>
    that is :<br>
    lsgpu -d device:<br>
    (doesn't open render node).
    <p>Regards,<br>
      Soham <br>
    </p>
    <blockquote type="cite" cite="mid:20250423063109.gadkamns7yzcgy6e@zkempczy-mobl2">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+
+		/* Skip if 'driver' doesn't match */
+		if (filter-&gt;data.driver &amp;&amp; !strequal(filter-&gt;data.driver, dev-&gt;driver))
+			continue;
+
+		/* Skip if 'device' doesn't match */
+		if (filter-&gt;data.device &amp;&amp; !is_device_matched(dev, filter-&gt;data.device))
+			continue;
+
+		/* We get n-th card */
+		if (!allcards &amp;&amp; !card) {
+			struct igt_device *dup = duplicate_device(dev);
+
+			igt_list_add_tail(&amp;dup-&gt;link, &amp;igt_devs.filtered);
+			break;
+		} else if (!allcards) {
+			card--;
+		}
+		/* Include all the cards */
+		else if (allcards) {
+			struct igt_device *dup = duplicate_device(dev);
+
+			igt_list_add(&amp;dup-&gt;link, &amp;igt_devs.filtered);
+		}
+	}
+
+	DBG(&quot;Filter device filtered size: %d\n&quot;, igt_list_length(&amp;igt_devs.filtered));
+
+	return &amp;igt_devs.filtered;
+}
+
 static bool sys_path_valid(const struct filter_class *fcls,
 			   const struct filter *filter)
 {
@@ -1750,6 +1818,12 @@ static struct filter_class filter_definition_list[] = {
 		.help = &quot;sriov:[vendor=%04x/name][,device=%04x][,card=%d][,pf=%d][,vf=%d]&quot;,
 		.detail = &quot;find pf or vf\n&quot;,
 	},
+	{
+		.name = &quot;device&quot;,
+		.filter_function = filter_device,
+		.help = &quot;device:[driver=name][,device=type][,card=%d|all]&quot;,
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Or you may add 'bus=pci' in 'device:[driver=name][,bus=all(default)|pci|nonpci][,device=type][,card=all]'

and then use filter in gputop.c:

device:bus=pci,card=all

Another alternative is to fix 'pci' filter to collect all devices
like 'device' filter is doing now.

--
Zbigniew

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+		.detail = &quot;find device by driver name, device type and card number\n&quot;,
+	},
 	{
 		.name = NULL,
 	},
-- 
2.34.1

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------0J7o5lNIRgDA9HPMhK4h4s53--
