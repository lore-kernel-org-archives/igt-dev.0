Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAE9AE674B5
	for <igt-dev@archiver.kernel.org>; Mon, 22 Dec 2025 15:52:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B90710E009;
	Mon, 22 Dec 2025 15:52:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PlGK0oLK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5925D10E009
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Dec 2025 15:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766418739; x=1797954739;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=K1tA+hRAcphHA2dC8cqYIZ3//Jbav/7osksGNT2rxP8=;
 b=PlGK0oLK/Vf6t4b96eWJlBheb6FZ0sWMfhYIGoGUPbzdACgIN0OByyST
 C7Ovs8hT2mkkW98GgQoIXDDgUUuwW0w4bmeZ1gGd3BA0tQTeLT8DhVay1
 Um2VrwfQBx1ajlB1iasD8xKgAiCHhP+ue+Fbt0H4wtDwg/O3cY3q+7EnK
 mB01VDb4VA210sSz0VUPe0nVNXH/EzQsvvNFy+5Qys5plpRCwas+9YAV+
 4TlXjJ2303dDci5ZYoZYHNDUbHYuqH17shUDw60bH9cKqIaY/737tMwPU
 WV+Ry6fcwH1AUETygzRaCo2E40MSYU6uy+47yzzmR3NzLERh/YwSKFfhp w==;
X-CSE-ConnectionGUID: k51kYGUJTwKFkT3GCNrzzw==
X-CSE-MsgGUID: 8YXH45TYTuu3jNnTnUGY+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="90934620"
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; d="scan'208,217";a="90934620"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2025 07:52:18 -0800
X-CSE-ConnectionGUID: K7VkQfGzTcKXZk/Zt6K3sA==
X-CSE-MsgGUID: bYoIaHt9Rpy84MFWSa+xoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
 d="scan'208,217";a="199857626"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2025 07:52:17 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 22 Dec 2025 07:52:17 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 22 Dec 2025 07:52:17 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.25) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 22 Dec 2025 07:52:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EMwP4H/G+YE/IerO4/0Yt+GyfrLR0wVfWSrhTh7dWHTm6C34i/9bIwYvTMq4oFXfdHLokRhKTp+TnqYkb7951vjXH0k7r+olwS/gMvpXKqEJoSavWi1fB81M52rWnXYSGH0P+OKyJRXa5ldks/9X+XHWz41GvCO/n1WuHsCMOPrCGTc1Go35W/00nTqkLsD7s11rIVMSE63MuMAjuA2WZG42+BGTklzEq5qFjV6U2PorDmPB/tRsefxU24Pzikw/I0ayWffFqnw5Tvjdgz+bFCXecGX4sAGLTe8ujhlMs7oh1RdQjdErHTiSxOB04W3KF//vMtLlWB8QkD5vkaKHgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M0hsMB+i3YdwZeNLLSWhDw5zgJQ/yH7sR4wxE5b0DN0=;
 b=mybxvIjFiFzgtsHFMHWDswQ8ee9egXHOirOZdVFnEzQ3wvKaC1r38SUg+0YdIeiI+L0ztAnha3oeSs2gNfPervSKVWlGEyCKODY3MZHruWNpSq/hMeFBd2VcEjh6JAhZJ6cOdfKBZwizCM8W2Uolnt5JAoJL/W/TjWtxTfAl3lSrTDV/FBekNe/3K239YBTXQxPTpqpyT2agaZqouIf4L43MfAET7sCb7M5c3A4TzOu0rZmnZHr2DgWuQ/WuaH7twKSZejf2d6lSNv/JOXBGmBBIR/jHGWOaY8GJHzFAeEEkAacLgD2GrMLFTI6ITfNq/JZ9++uF8O3+nwjciC684g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9304.namprd11.prod.outlook.com (2603:10b6:208:57d::5)
 by SN7PR11MB8263.namprd11.prod.outlook.com (2603:10b6:806:26d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Mon, 22 Dec
 2025 15:52:14 +0000
Received: from IA3PR11MB9304.namprd11.prod.outlook.com
 ([fe80::3184:459:b760:70b6]) by IA3PR11MB9304.namprd11.prod.outlook.com
 ([fe80::3184:459:b760:70b6%6]) with mapi id 15.20.9434.009; Mon, 22 Dec 2025
 15:52:14 +0000
Content-Type: multipart/alternative;
 boundary="------------xhveQeHdp2k6omhf3cM9FcJF"
Message-ID: <cbb6a354-35d4-4c08-bbc8-a38586edc435@intel.com>
Date: Mon, 22 Dec 2025 16:52:10 +0100
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBpOTE1LkNJLkJBVDogZmFpbHVyZSBmb3IgaW50ZWwtY2k6?=
 =?UTF-8?Q?_Add_xe=2Ewcl=2Ecore=2Eblocklist=2Etxt?=
To: <igt-dev@lists.freedesktop.org>
References: <20251218175456.65275-1-jakub1.kolakowski@intel.com>
 <176609616805.103427.2016185790027275028@a3b018990fe9>
Content-Language: pl
From: "Kolakowski, Jakub1" <jakub1.kolakowski@intel.com>
In-Reply-To: <176609616805.103427.2016185790027275028@a3b018990fe9>
X-ClientProxiedBy: VIXP296CA0011.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:2a9::10) To IA3PR11MB9304.namprd11.prod.outlook.com
 (2603:10b6:208:57d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9304:EE_|SN7PR11MB8263:EE_
X-MS-Office365-Filtering-Correlation-Id: d9611031-8976-4a35-495c-08de41721363
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|13003099007|8096899003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OXY1UTBWR3hEQjJwNmU2ak5zeXNueDdIemFGNWpNZCtnVHZvb3FDSDBnaTdD?=
 =?utf-8?B?azUwM2pPaTVQRE1mWFF6aUc4LzJDTU9hR3NEWkZwRndPQTQ3MUw4U1dUZkpS?=
 =?utf-8?B?SWVPL29WNXl6U0NROWdOV0lXaXVhc1dGNUczTUVqTTdZREJCRmUvOTBDcGtS?=
 =?utf-8?B?dXZkVVcrR0UwcUdVWk1iZDdxV0RmM1NhY3ZsSmJkT0hBUWlDNCtJdVQ1WlMv?=
 =?utf-8?B?dElxcXducjIxWlBiVXlzZzlrSzJzeVovUXpZU3JqSnNTNXVVbjRaWDBpMkxU?=
 =?utf-8?B?RGF3YWU0VnhKZGx3Q2ZsQm9pUS95UWVDN0JYSWZpa1NKcnE2dzdXKzVhWjdM?=
 =?utf-8?B?N1NFL2UybTlUUXRNQm5WZXV1dDNYdFIvOUF6K1BCMS9RbmtlYUdmc0VybXpu?=
 =?utf-8?B?dm95c05Rc3NVWFpHYmdvbDVpT1pRU0g0K3BlNWpyQUhJNEhqVzlFOVg3Y1p6?=
 =?utf-8?B?UnFocjlsSUpmV25mUEJoV1loZnh6UVQwTEsvcHVYS2QvbG9GZzloUHJabXls?=
 =?utf-8?B?azl4M1JtWXU4UUtXZzZCRG02Y0xZS3FKZUxBeU5DMEFvMnNuanF0bUJ1cnRU?=
 =?utf-8?B?U2t0dFRzL254Y2taSi9sZXVVUWxOeGdhcEt5YXp4WE5vanJabDJWdkxiU0Iz?=
 =?utf-8?B?cThac2pUWjlYbzgyR2pZb1dEcHZuLzhnUGNYbmE1VjRIVDRSd3dUWFRlc2NF?=
 =?utf-8?B?d1RPWFpRZlY4S0I2KzRBeHZWTm1DS3hJWWxkbzlaT0JKbjZpTkVJUE5TSWRF?=
 =?utf-8?B?VjVVdWpSeDg5cTU3MkszQjZDbmlWaEMzUnl4a0UxakFIMnYrSWFPRVdxVVBP?=
 =?utf-8?B?Tkxzb2d3V1NFOW9KSjBoT3RtSHVHcUsya0pqaEdDR1F0TlJIb3Q0Q0V3aGho?=
 =?utf-8?B?VGd5bzVsaVFTOGQ0QUpySExIMGE4MjRRQ09uNFRLUGFjZEdyVnBnZGlUcGtL?=
 =?utf-8?B?VitPTVhwOWczdjV2WUUwTng2dzIyNzZ4NWZrRFFkZCt5YmYrNnhoelNFK0dR?=
 =?utf-8?B?WTBLOTEzbHR1QTZMSEtsMHBpVTQ5bVVEaGJoL0Q4V3FKTmtBSC9QdXpHU01u?=
 =?utf-8?B?STFNaFh0M2VHMjNuYllkNUZyaGFFR0xRQnVsNk5laytzWndsYjN5TU9wRm45?=
 =?utf-8?B?YWxmbVpXK3dvRE1hcE5FN1Y1MCtjUEtNSXVScjFBdmVwdHVuUjhLb2ticVZ2?=
 =?utf-8?B?N2h2eldiYU8wd1VrS1o4cHRrcjZrOUl6bnFRbE1GYTlnRjJQZGhVMHF3c3JY?=
 =?utf-8?B?c2FTYlVnakhUM211NTFybnN2cm9qaUdNNnNieGMrb09pczU4WWZFZWpqTHlJ?=
 =?utf-8?B?QTBJaUhLL0RsVS9LNE01SkJCR0JnMGh2eUFhSTd5SWFvdXY4K0swYUZjOVhx?=
 =?utf-8?B?OTBnR0NhY1loZlRFY3gxS1hCMjFzZ3NueUpjbWQwaFFCVFAxemV4RHAvdTlG?=
 =?utf-8?B?QjhOajVtNEp5THYzZmhSNGY5b1RhWHFJc2JZOW9vRXdlYWJqYlNtNWpCanJs?=
 =?utf-8?B?WFdrUWNqMnlTeWQ4S1JvcHBOYXBvYXlOYXVKdHJLdUpQUzJEVWR1a280ZEow?=
 =?utf-8?B?NEhIZXY0MisxbzRpeDRubWNOT2UrNGpBdGJsK3dFUGFqRTQ5ODQ3aHkwSGt5?=
 =?utf-8?B?dGpKTUtKdlNlaU5DbEp3WTg1S2VNTy8xc0RwekVueTdOSTRwOEROblNMQ1gr?=
 =?utf-8?B?cWdtTVRaNXdWTUw4V0tqT1htMFV4cHRWTVFzR0ROZG5BQ2JsUyt6MmZtN0Mv?=
 =?utf-8?B?dmVab3AySE5vNHluTXQzeHJFMjFlTnVXRGh4VytUZVpFa3JyenNVQ1ViSVFO?=
 =?utf-8?B?WEdIZzY3eEZ5ZFh3SnpRMGhidExleEY4amVTc09EWnVKRjBNNjhqbTNicnhh?=
 =?utf-8?B?cGllekp6N3ZpREY5eXU5Uzd3Y0xCNU0zNUlOamh0anVkblNjdUpLb0dQeHFa?=
 =?utf-8?Q?nT/4BaqzxVg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9304.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(13003099007)(8096899003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V3pHWWxUUXlCM2h1clRkYjV3aS9yRnVKU0NCV094WkR6bm1IcVhBVFg4RVZ4?=
 =?utf-8?B?ajdyYmxNNzlnY3hCZ0NISndhVHpvb202R2F5S0lmS1BZamEwY01wVU1RQWdD?=
 =?utf-8?B?ZUE1aU1NSVZkSUEzclRmaTlYZ1p5bGtKd3FDVTE2M09iTWJ5YWdiSzVpMVNz?=
 =?utf-8?B?bVNVSTZuT3BJL2xNNjZuc21leUdEQ1JaWjV6QUxtOHppUmtvM1MwM2M4cDZB?=
 =?utf-8?B?VzZpb1FLOXZhVVowZGNIZUl3ZWJYOG95VGhJRDVSZDJYNXZpdXJhK0ovZXFw?=
 =?utf-8?B?TVdXTWdqVUpzS3ZnaUt3WlE3QkJzVlN5WFViYW9aZktWN1FuMmJKVWlocHI4?=
 =?utf-8?B?ZCt3M2F5Z1BUb0ZJZ3JJbVg3dXhhbUQvUnNoY2F3UWtWZUttRFVmcngybzhZ?=
 =?utf-8?B?NDNmcFhOZUlWV2VjdkFOUUZ5Mkc3aDF5dWc2dmw5WG0yYmk1Ykgxd1U0Z3JQ?=
 =?utf-8?B?M21COE94dVZiQ1djaDk0SEpqS0tFQzNsby83U2RMdkhHdGk1d1QrSXVPL05K?=
 =?utf-8?B?eER3dUZ0bnhNaWQ2MzU5NlA4RXpqSDlGaysyNWR4QnhwOWIxbFhQb3E2ZGdI?=
 =?utf-8?B?cE9PK1VwYnFIS1A5bXdWTmJmanJLSkxXTE9iblA2RTlmNmdEU3JHQkxyNkFS?=
 =?utf-8?B?N1NTcVV3cStZT3kzMmJTcnNpdXVMTkpHMWIxUFNVZ2hVdlRBMkJaOWtSUHNo?=
 =?utf-8?B?b1FlM1F5QXBHdVZ1azVJVlJhcXZLSnFWaDhSSmROOWttSFpJbVpGTDE1eEhZ?=
 =?utf-8?B?L2I3VWZvOFU4MG5FU3dnU1dSTi9lMmtyYnkvMGZjQVZ5cFVLUndPQWFMeGQ3?=
 =?utf-8?B?Z1FOR1owMUVTTGVybXMrQmtpK2pwdzZsNG9Xekp5dHFBYWlycGppTng2cVp0?=
 =?utf-8?B?UmdlajI5Y2d5WERxV2hFTHh1UVRQRDlyLzVUVXhyUUxmRVJZNWdmZVpGaExn?=
 =?utf-8?B?VGVHbnRqTWkxQ0l4NEptZ3J3dlpiKzFRWTBJZzdFRkZOM2s4N00xcjRTbXgy?=
 =?utf-8?B?OEJrVEozNmZtZktBQzRjWXNQNDVYNXBiL0M4dENaOEFvL21OVVF1RE82dEds?=
 =?utf-8?B?blBRenpnVFQ3QW1qMkhrb3phcEpiaGVOQ2tteGpjcXVxRkpCUThpV3lJVXhk?=
 =?utf-8?B?cWloRUFvWURIT0dQYWhyK1gyTWdNUjh2c2Z5cDdOelhKRFBBTEltaVE1ZkZU?=
 =?utf-8?B?WkxwM1NIRC9ySVJyRUpVOCtEM3hEdEZkQlNVUXFtQ3RpMEdod1pMYzVuQnZY?=
 =?utf-8?B?ZjA1Um5ncXFuRjdFZTVVUjhSMmRtZmVsU3VDMlVnSlhQRFJlVFlvZTcyL1RP?=
 =?utf-8?B?UkxmYTIwR3A2NlFqcHB0d291K1dLWm53Y2RBZ2V2d2pUQXFCSjdJeFdNY2x2?=
 =?utf-8?B?ZlVzTWRZL3VWS09kWFVwNFUvdSt2OHFCaW14SHM4VFZRTTFYMUx3akxOeGs0?=
 =?utf-8?B?T2llZ0RmUnArT0RlQWNBV3NpTGV6SFpIeXpaa2FyMHQxSFMxQ1pNbEE0dm96?=
 =?utf-8?B?NExkbFlNL0VubnZXS2k5MWVQb3hTNkhXcVVCOG9NY0dmQmdHQzlSckIybENn?=
 =?utf-8?B?N1BGVzNocVR6UTIvbFNyYW1LeUQ5K1N1M0tLb0Y1TW0zQXdYR1dJL3g1d1Fj?=
 =?utf-8?B?R0VQRjc1VHpoUXNzUW5WU0VGR0RyNFNFTHkxdGpuTC8zQlBtMGdlT1l1QzhV?=
 =?utf-8?B?TEQwdnlwbjhFYXEzV2hhQWlrRGZJNlBkZFNZMzRBSk43K3orVWJZNXdsSDd4?=
 =?utf-8?B?cUQ5VG9FR1FaS2hkL0pRU3ZWcmc0eU1wUnZndGJpTTJuRFIyNVpoZ3NmdWpK?=
 =?utf-8?B?Q3p0L2FWWjhTVmdwd3BzbEQ0WXZEOGRycmdhNWdjbk5lSkVWMW80cjR5MjI1?=
 =?utf-8?B?Y1U0VGtyYys4Z1poVElLY2VxRHQraEF1NC9sOTRkWG5EY3RtV2VtVE9PZkxV?=
 =?utf-8?B?TXgzTVVpM1o3a1RlRk51bkFnbWhrbWVBV2tvY2JZR3kyUHdjQU1nbk9lU2tm?=
 =?utf-8?B?dDRPd2tNTmw3b3d1U3gxZW10bzNpeG1GWlQvV2pRMXB6RVhlTFZDb0c0RTNH?=
 =?utf-8?B?bFVFZ09IejA5QmI2VXJSRjRSTTJweWo5WEUyQzlGaFhmRWw3bTVIeUh3dGZI?=
 =?utf-8?B?V3c1aVNNeGRJRXVmTkZxN3RqaFNUZXVyRmdtVTRHVDNOaE13V3hodEJZaU0x?=
 =?utf-8?B?WjBtaDVUcTVjR0RhcHZJNmo4aUhQQjgyZ3pFajFHeWcrMm1rSUdTQi9vbDc1?=
 =?utf-8?B?cVczZ2tDSTdXQlZENUFFMVlsRDlvOEdrbDA4cFdjNzRvTklZdWIwaXNsSFkv?=
 =?utf-8?B?cnJSOE90cEtvTDh6eURsclY2NVVIblFhSUlWbDJKWkU3cXBqemJsTGp5WTZK?=
 =?utf-8?Q?TFlhCE6trIpb0NAI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d9611031-8976-4a35-495c-08de41721363
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9304.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2025 15:52:14.2968 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nGAIfLGc/VWiZn5dCu4vDWh3hGn7DYh25rsH8PYUv6xgxYvuFP6BOAJY4HOjb7y/kQTpRkaSgbL0FRDxUfWnJSx89Dq+d1KOguZaw02X4rU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8263
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

--------------xhveQeHdp2k6omhf3cM9FcJF
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 12/18/2025 11:16 PM, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	intel-ci: Add xe.wcl.core.blocklist.txt
> *URL:* 	https://patchwork.freedesktop.org/series/159239/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14238/index.html
>
>
>   CI Bug Log - changes from IGT_8674 -> IGTPW_14238
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with IGTPW_14238 absolutely need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_14238, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
> External URL: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14238/index.html
>
>
>     Participating hosts (43 -> 41)
>
> Missing (2): bat-dg2-13 fi-snb-2520m
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in IGTPW_14238:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>   * igt@kms_busy@basic@flip:
>       o bat-arlh-3: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8674/bat-arlh-3/igt@kms_busy@basic@flip.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14238/bat-arlh-3/igt@kms_busy@basic@flip.html>
>         +1 other test dmesg-warn
>
not related
>
>  *
>
>
>     Known issues
>
> Here are the changes found in IGTPW_14238 that come from known issues:
>
>
>       IGT changes
>
>
>         Issues hit
>
>  *
>
>     igt@i915_selftest@live:
>
>       o bat-jsl-1: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8674/bat-jsl-1/igt@i915_selftest@live.html>
>         -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14238/bat-jsl-1/igt@i915_selftest@live.html>
>         (i915#15394
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15394>)
>         +1 other test dmesg-fail
>  *
>
>     igt@i915_selftest@live@workarounds:
>
>       o bat-dg2-14: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8674/bat-dg2-14/igt@i915_selftest@live@workarounds.html>
>         -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14238/bat-dg2-14/igt@i915_selftest@live@workarounds.html>
>         (i915#12061
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061>)
>         +1 other test dmesg-fail
>       o bat-mtlp-9: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8674/bat-mtlp-9/igt@i915_selftest@live@workarounds.html>
>         -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14238/bat-mtlp-9/igt@i915_selftest@live@workarounds.html>
>         (i915#12061
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061>)
>         +1 other test dmesg-fail
>
>
>         Possible fixes
>
>   * igt@i915_selftest@live:
>       o bat-mtlp-8: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8674/bat-mtlp-8/igt@i915_selftest@live.html>
>         (i915#12061
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14238/bat-mtlp-8/igt@i915_selftest@live.html>
>         +1 other test pass
>
>
>     Build changes
>
>   * CI: CI-20190529 -> None
>   * IGT: IGT_8674 -> IGTPW_14238
>   * Linux: CI_DRM_17706 -> CI_DRM_17708
>
> CI-20190529: 20190529
> CI_DRM_17706: e0eb6ad399f8369d978ca40f07cbf5c6c16647d7 @ 
> git://anongit.freedesktop.org/gfx-ci/linux
> CI_DRM_17708: c25fd3953a459143758264a6c4dab32107bb48c4 @ 
> git://anongit.freedesktop.org/gfx-ci/linux
> IGTPW_14238: 099599f25127a89bdaa7b01a924f6886b5ae01bb @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> IGT_8674: f38f4d8e9c65aff45ac807e646d06e38bc3193a2 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>
--------------xhveQeHdp2k6omhf3cM9FcJF
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 12/18/2025 11:16 PM, Patchwork
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:176609616805.103427.2016185790027275028@a3b018990fe9">
      
      <title>Project List - Patchwork</title>
      <style id="css-table-select" type="text/css">td { padding: 2pt; }</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>intel-ci: Add xe.wcl.core.blocklist.txt</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a href="https://patchwork.freedesktop.org/series/159239/" moz-do-not-send="true" class="moz-txt-link-freetext">https://patchwork.freedesktop.org/series/159239/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14238/index.html" moz-do-not-send="true" class="moz-txt-link-freetext">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14238/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from IGT_8674 -&gt; IGTPW_14238</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with IGTPW_14238 absolutely need
        to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in IGTPW_14238, please notify your bug team
        (<a class="moz-txt-link-abbreviated" href="mailto:I915-ci-infra@lists.freedesktop.org">I915-ci-infra@lists.freedesktop.org</a>) to allow them<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <p>External URL:
        <a class="moz-txt-link-freetext" href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14238/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14238/index.html</a></p>
      <h2>Participating hosts (43 -&gt; 41)</h2>
      <p>Missing (2): bat-dg2-13 fi-snb-2520m </p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        IGTPW_14238:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>igt@kms_busy@basic@flip:
          <ul>
            <li>bat-arlh-3: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8674/bat-arlh-3/igt@kms_busy@basic@flip.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14238/bat-arlh-3/igt@kms_busy@basic@flip.html" moz-do-not-send="true">DMESG-WARN</a> +1 other test
              dmesg-warn</li>
          </ul>
        </li>
      </ul>
    </blockquote>
    not related
    <blockquote type="cite" cite="mid:176609616805.103427.2016185790027275028@a3b018990fe9">
      <ul>
        <li>
          <ul>
          </ul>
          <br>
        </li>
      </ul>
      <h2>Known issues</h2>
      <p>Here are the changes found in IGTPW_14238 that come from known
        issues:</p>
      <h3>IGT changes</h3>
      <h4>Issues hit</h4>
      <ul>
        <li>
          <p>igt@i915_selftest@live:</p>
          <ul>
            <li>bat-jsl-1: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8674/bat-jsl-1/igt@i915_selftest@live.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14238/bat-jsl-1/igt@i915_selftest@live.html" moz-do-not-send="true">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15394" moz-do-not-send="true">i915#15394</a>) +1 other test
              dmesg-fail</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_selftest@live@workarounds:</p>
          <ul>
            <li>bat-dg2-14: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8674/bat-dg2-14/igt@i915_selftest@live@workarounds.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14238/bat-dg2-14/igt@i915_selftest@live@workarounds.html" moz-do-not-send="true">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061" moz-do-not-send="true">i915#12061</a>) +1 other test
              dmesg-fail</li>
            <li>bat-mtlp-9: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8674/bat-mtlp-9/igt@i915_selftest@live@workarounds.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14238/bat-mtlp-9/igt@i915_selftest@live@workarounds.html" moz-do-not-send="true">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061" moz-do-not-send="true">i915#12061</a>) +1 other test
              dmesg-fail</li>
          </ul>
        </li>
      </ul>
      <h4>Possible fixes</h4>
      <ul>
        <li>igt@i915_selftest@live:
          <ul>
            <li>bat-mtlp-8: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8674/bat-mtlp-8/igt@i915_selftest@live.html" moz-do-not-send="true">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061" moz-do-not-send="true">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14238/bat-mtlp-8/igt@i915_selftest@live.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
      </ul>
      <h2>Build changes</h2>
      <ul>
        <li>CI: CI-20190529 -&gt; None</li>
        <li>IGT: IGT_8674 -&gt; IGTPW_14238</li>
        <li>Linux: CI_DRM_17706 -&gt; CI_DRM_17708</li>
      </ul>
      <p>CI-20190529: 20190529<br>
        CI_DRM_17706: e0eb6ad399f8369d978ca40f07cbf5c6c16647d7 @
        git://anongit.freedesktop.org/gfx-ci/linux<br>
        CI_DRM_17708: c25fd3953a459143758264a6c4dab32107bb48c4 @
        git://anongit.freedesktop.org/gfx-ci/linux<br>
        IGTPW_14238: 099599f25127a89bdaa7b01a924f6886b5ae01bb @
        <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/igt-gpu-tools.git">https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</a><br>
        IGT_8674: f38f4d8e9c65aff45ac807e646d06e38bc3193a2 @
        <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/igt-gpu-tools.git">https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</a></p>
    </blockquote>
  </body>
</html>

--------------xhveQeHdp2k6omhf3cM9FcJF--
