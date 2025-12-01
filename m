Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A319D111A8
	for <igt-dev@archiver.kernel.org>; Mon,  1 Dec 2025 10:38:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1D1610E36D;
	Mon,  1 Dec 2025 10:38:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UopLJb5u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B269B10E36D
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Dec 2025 10:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764585508; x=1796121508;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=YTeiq0976P923IkhX7ZfW8vdl441Fvf8qQgcRAAABTc=;
 b=UopLJb5uAFhkwPHXi1SzQmUNfqafCHEAl0O4YLDZSxuQbSKESEHWx8JQ
 C8QAiZdnU/AgKS/sbfBxbBEjLdOP3vzvQUZVxAAHNrc963R23qyChbnW2
 y5boIknZyjDet/6GsrNWbEJVN5ut4mCwQevDrM17Xh6/mhSbD46ym5e5c
 fHp5387ovbRXSxEA5bb4uwuHftqUR5Q+U5w52S5+WWv6eNw/1P54EU7w1
 DxWieDhNKpndneVzr7FdP5N9WtJBeVKAqEZr8/0hy3LRKcSF0eg6z8Bff
 0ofShqnNtB8Alrdd3t4P1LWmWk/bsG6UEhDQ+HCmAuymybNqwSHULlR7k A==;
X-CSE-ConnectionGUID: nBwUJRa9Qk+dlujsnlul3Q==
X-CSE-MsgGUID: oQUR06/aTpOgg969mvgr5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="66683564"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="66683564"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 02:38:28 -0800
X-CSE-ConnectionGUID: 6pRPMOdPRfa6n11QtgEFeA==
X-CSE-MsgGUID: 6oxS9yWaRxq9UYgZJ/qvfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="198389773"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 02:38:27 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 02:38:26 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 1 Dec 2025 02:38:26 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.16) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 02:38:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g3Ltj4h3m+scGecT6GjBwtoYMKraLcNCDkMK3SA8uNpGfHVOL1URd4h6VflzmPxES9oXMpI8uXe4CPTOX/fqDK3t4VI9sjz9bFp8rc/kZcCNj59Sag7KG9EKi3hMDhu8+mDPnGg5OWvjXbfBKBH2ZF65576o+yNpJ6tYphEuKhoSTUQ35u3TAAJQEgrjcnUBasVLxtqMINpVjy+KGAI0GEpj9HdeX3jYeEGlY2Pmk5uQJNwQ49/AE1ri1Iqr4mPqfBxQNTpLXNdy3jm15GS3Thx8khl/YaBlu90KayzP+hBje6hV8HslNv+ENzaFFvt7OTgZ/Gxx5GyZnsBcnuudAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=apCgBuNTTEn8izyPH371/yvx5UGwzlsjPF0Spv+LHPY=;
 b=ZVPP/zvGBp9bkL/NiDWvv4AnPK8+W4z2icMyAk3NIfr5y+qMn0wNLSmobHXr55DDln2zRF/EQQz/Qz7JzdN85R6jaVyNmttFRsH643bYVQZ/xF8jQ8cDTgGGC2itHMlpHBJ4v7++Yt0Et/ay4gVua5UmgWIJ/OVd+mNnyGg39WZhg4jNBomolP64FjgWuc87SoWzRyLVER8rAKxeY6fs0zTYt/x42qPwzASHHFZClMtXEzM8v6mVTWUFs57jfd1vP78dbXBdzkxORVKOe6IQVj2bMChwvdGY+B1f6VOxyxzGF5i5oxbjHmZn5mxRc6sR4corux55c6GVuCW2M+UGlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by SA0PR11MB4560.namprd11.prod.outlook.com (2603:10b6:806:93::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 10:38:24 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541%2]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 10:38:24 +0000
Message-ID: <58708ef2-0b4d-48cd-ae92-a0e174ee3068@intel.com>
Date: Mon, 1 Dec 2025 16:08:16 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/xe_sriov*: Force disable EU debug
 before running SR-IOV test
To: Pravalika Gurram <pravalika.gurram@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20251201104303.2438191-1-pravalika.gurram@intel.com>
Content-Language: en-US
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
In-Reply-To: <20251201104303.2438191-1-pravalika.gurram@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0082.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::12) To LV3PR11MB8695.namprd11.prod.outlook.com
 (2603:10b6:408:211::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8695:EE_|SA0PR11MB4560:EE_
X-MS-Office365-Filtering-Correlation-Id: a9bf8860-d32b-43ca-8cca-08de30c5c030
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QTBqYktmS2NQVVZQRGsvMHNTaEwwYzgyVkVpRnkyRlROMzZiL1JTOTVrd2s3?=
 =?utf-8?B?aHF1dUZUR0VoWC9HZ0dOd2xrd1M1R3A2VkhXcGx2c2F2TXA4R0tjdXZRMHJy?=
 =?utf-8?B?NThZQ2Nha1lZSFJpRG1kR3k4SDJjbzhYenNLRytOaGg3Z1BYRTUwUmVYSjU0?=
 =?utf-8?B?b2JrV1ZyaXJ1MmlySUdqeFhGOHVzanRTcm1tQ0s4YXhlTUZid0w5TTgyTktR?=
 =?utf-8?B?cDhhNE9Na3ZURk5pbkQrVVdLZTU3b0xJTHI3RjVSWmV5alZGUGxYZVVNSEtl?=
 =?utf-8?B?SjNtWjB5Q0NvOGJaTWt6M3JGYmZSNHlHc0FqNUdsYzVIZVcwQm9iUmpsNVJk?=
 =?utf-8?B?NHVoREFrdnl1NHdKVElvdGE2UXRvZ0x3RENwbFVKb1FRVFphajdJN1BBU3dq?=
 =?utf-8?B?ZTFnc3R2S2hNU1I1a1k1d3FiTjVuRERWdGtyY3MvYjNWZWVha3Y5Qnc0YjRt?=
 =?utf-8?B?Q3dYSWV2ZWpuaG9PYUZNcDJuaDJ2S1pwOFNqeEFjemh1aUh2VS92ZWp0ME1R?=
 =?utf-8?B?bHVPYUlRdk1Lc04rdWpBOWlPSWw5cmtPRnFNZzJJaWRpaVlVR1pJby8wQTds?=
 =?utf-8?B?OWhMenM3eFBmSFdRTE1MdFhsbmVwTDc0ZE96L3FzRCtaN2J2OHNNbDQ5VlpK?=
 =?utf-8?B?cHFPelVzaGYvSmE4ZDBDVE9LL1l5R2R0YVdMWXU4dHdTVVFiY2VIUlNkSzZD?=
 =?utf-8?B?N0hCY1UxVmFFMVZuUVpMY21ScFI1Tnp6VFM2T0dKS3BsTDZURGxDMG5zbjhI?=
 =?utf-8?B?SmFaZEVoeGp4YVZJT1FzMVF0bFRFNGZqVi9OTlpldVM5WVBkbEg0NHdqY0dm?=
 =?utf-8?B?OGhMSlEzL1pSSUFrV05FV2JKT3pUdmVKdnZ1UTEva1czdFQ2ODh3YkhUSVl5?=
 =?utf-8?B?MkxGZzhGdGtkK1BTV3dTMnRnWmVCVndVTTE3VjJhMllQM2xIU0VLaEZhWXNB?=
 =?utf-8?B?OURSdFhFdWo5cWlzc2wzMXBTd0N2L1VpcmFPcndBQlZ6RHNHYWVGS29YYUdD?=
 =?utf-8?B?a3QzTktaQis1clVnK1VIc0pjWXNrd1FERktaUmxzaFE4VTJKcGJyOGZqWnEv?=
 =?utf-8?B?UkI3Z1pjNE1tK2pleHlzNkt2VXBsb1JpeTJIQUVxODlmdllsUEJmS2FqZGhy?=
 =?utf-8?B?SnFKcngxa3Jpc25vaFdpaStzazRRcGxKUXlHQzNJcVord2VFdkIzeHhCeHVJ?=
 =?utf-8?B?VUlHTTdiRFEyazJwV0xUMnZodjFNbkEwblk3aG5CN29IQ3JQc21WR1BKWjJ5?=
 =?utf-8?B?bzJkd1ZoVzJjNnVuYm02bG5CT0JjKzkvY2NxNFJ6NjFHamw2Vk15andGMTc5?=
 =?utf-8?B?aDRtaVM1S214M0FmSXRIU0cxckRvRFdpZkFsbHZsSUNrajdKeTJEcFozK0ZQ?=
 =?utf-8?B?dDN3THhyNzZ5RGtHZWlRMElaeUlZRDVDYzVGVzhRMW1zblFwUG1ja21hTzRy?=
 =?utf-8?B?Zm00YlQ1N1ZsQ1JxMExCdUJKZU81VGRyeGg3aitaeTl6U0NtUWNQUHA5WURP?=
 =?utf-8?B?dDZrV2x5RUFQZnJodmQ2U0RxNHEveUl1TU9SUzV6YjNxbzZnQ0haWjJnYmZy?=
 =?utf-8?B?cTh2WnJ4MkhUd0xQckJYMUM2ZDA3aXd2SGdNV1lOQzl2bTRUZWVROWR2Vmsx?=
 =?utf-8?B?KzQ1WEJpdkxPYUJlUDdpQllGaHJjekdHU1JMbWY4TnhZdlRIVzh4SHl4Z0N6?=
 =?utf-8?B?Y3FzKzVrVVJnNzcxYks5d1J0cTZ2Z3phN2NQTHQrblRaSkY5UGZ4ZEo4cGxX?=
 =?utf-8?B?b2RlWUNsVFN0VkwyRHVqcmVrOEF6cGpHYUNlWnMvaHNrNE9CRkttQW40WFlG?=
 =?utf-8?B?VkRiQ0dZcGpNMzNEcXFHWlAreFJjcktaSy9mT0k0YlNIUkxIS3hZck1WczlR?=
 =?utf-8?B?UkJ2RHlwaVlZZGhuaTRZeDVuL2FaM2o2SlFYTno3K203b0pVbmFBNGIxZ3g5?=
 =?utf-8?Q?AoCEHZT4WveQ0HnSg9e0Ksx6z+Y0ECL/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dHJrUzRaRUFzSTQ2MGc4MzRFNDgrZHg0b0dQT0dUd0s1dkxNYWtpU2haaWx6?=
 =?utf-8?B?THpHYlAzQ2NNYzQ1Tk1uZFJKM3BCdGhHMlk4SDh4dWUzTEVwVjNGT1BZcDY3?=
 =?utf-8?B?VzhleTBKVXA0aGw0ekFta3c0QUdiM1lLWDkvQThoaDRiMDNDa256OER4dTQ1?=
 =?utf-8?B?OEZ6SllBMGlLeGl2L0VpV0dVa3NYZkx4MjBLVlJqQ21EZjgwKzl3YUpBbkMy?=
 =?utf-8?B?Z3FVb3prM2RXeU9sbVBqcERNNThmWXMrTURmYnhUM3NhTzc2cEpNVHNVdXY1?=
 =?utf-8?B?OWRDKzY0MEFBWTcxdG5KWW8rNjExWU5XQnJxNStBNkNNbGJPV01ZRlBCcEU5?=
 =?utf-8?B?dEpacytDVE5pTlBIK2tQT2ZkY3JOajFqcnVOUEZvbUxaeU1hSXh1NERVdUl1?=
 =?utf-8?B?aVpXRTBUVUVtWmw5THA5S05IYUtySXU0Tm5RMkU2elRyenpZSjd1bGRiV0Jl?=
 =?utf-8?B?OTNZdU5XVHhuMHkrYzJBUWh4ZUlsUGVuVjNNaWgzRzBNYTBTUWhVWEFtMEll?=
 =?utf-8?B?MHBOLzErT0NWaFRNZTc4c1B2MUQ4SkEzWlVUV1EreUMyQzJzNmVQSGVIMTcz?=
 =?utf-8?B?ZEFkUlhCaWZ4WDhGdGY3dy8wcHRJR09nU2dDQ3A1UVBWL1d6dXViZ1lqVS96?=
 =?utf-8?B?NW5leStxOXFmYmNxd1hGQlZTaVNpcVB4QXEvQy9td0tZZE5kMnVOajcxMytw?=
 =?utf-8?B?eUEreEZjZng5K3dJMXA1Wk9ndVg4UWJYM1h4c2RUczRSZlBuYzNidXg3M25a?=
 =?utf-8?B?UXRRc0hOMmMrclpsUjAwVHNISFg0aEk3eXl6TWF5ZXNWdXdXdDluS0tSWnZj?=
 =?utf-8?B?YVJrUUNBbFpEbktMU1B5c3B1VzkxVmk5OXlUeTdaamIzaU9pbk5CVFRna1VY?=
 =?utf-8?B?bEZJOGdIcEttN3FaNXRPWVNUcFJ6eEdweitNYWpIc0NXQlJIY1VkM2s2K0Nj?=
 =?utf-8?B?Vzc2OGRxTXV2bmI1ZEpIQjJSWGU0OW1aY2t6aXo4aldacUlxc2R3YWV2bW9C?=
 =?utf-8?B?cHpxSEdjK25tL1NxaWkvRTgrSG5QSUt5TjkrTjF4UkxTVFpweEFpZ2VsSHRZ?=
 =?utf-8?B?U1hUblBmOXpNSk1hU3U0RkdrM3pkUjlRZWNTeE41MDJrblRwV1g4ZFZTQUYr?=
 =?utf-8?B?Sy9tWXU0M2hqMGpsc0g3aW13K3NNaUxublVLd1hyZWdyWTk2eTU3WGF0Szlk?=
 =?utf-8?B?M0NaUE9vUzkrdTFiSkhHMkV4OThNa280UFhvWFRUdm85QXlZTmRRTW0rZWtq?=
 =?utf-8?B?Vlo0SmFZQmdPdVA5OGpoY1NkTGtmbTNCdUtMUUpzTG9SWXJGVmxXZC80dTlC?=
 =?utf-8?B?YVlRRE1oU1pqN1V2V3ZUand3VlZKdHYyWEs1OGNINHI1YWVwbEZabnhNcmJM?=
 =?utf-8?B?ajdLNnJlbUFISnhhdmFGZlZyMHk0OEFMMFlZR3ljaFBSTWVxTWIxeHZ0YkRw?=
 =?utf-8?B?VFlCV3pQaU90RmZRU3dsSnBRK3FLSUgwN09raHdycXZrQU9nSUd0Z1VBZ2V1?=
 =?utf-8?B?UFdNSm4yV2tFZTk3RHNHMFBoVWFUd0JXazhhVDFwemdRSktwVnZWVDUzMmY3?=
 =?utf-8?B?SmlKL0pjdlJnTHd3UHhwaDdBK0J5NTM1MUxBcnh4Rk5QdXBjRHl6S3JIN3FV?=
 =?utf-8?B?dU05ZE5kTUFjU1VtMHVUUkx0R2RDcDRDVVRDTUZRRjI4aTl6akZvVG9DWmYw?=
 =?utf-8?B?R2l5dWZMMGFLUGxrc0t4RGg2NlZLSDhEenl3NUVkSWZjWEI5Rm5xU0RQQlEy?=
 =?utf-8?B?WEkzcHRLb3hGaE1nWTd6NnBsZmJIcklyMVp3ZUtGby9SQ3RLUEZ4S2xvTUFR?=
 =?utf-8?B?SXhPZGorbVNGejFJYmo2VjBxNmlqTEtsbjJwTmRJRnZSeS9pRVhYeStVTlNt?=
 =?utf-8?B?NkNUYzdOS3FUL2RDTG9KMjk4V0VRK3o0OGNGT2dYS0Z3N1h1YlArMXVaQzRX?=
 =?utf-8?B?aXZCbFAxUnpCcnRONFU1ai9JbnhFRUxxZXgyZzRtWE8wd0cxTnJVa3B4SnVn?=
 =?utf-8?B?am1NV0J5dGhxcGJrRlBDdGhramNqKzJUOHRaNmFTUEQ2dE5qOXRUY3dCSjVO?=
 =?utf-8?B?bllwbVZvYzhSM1IwQ0IzTklrTW04c0c3TkcvUGtRaEk3T0pxU3FEY0YxQVMv?=
 =?utf-8?B?SlFuU0xMSnVuWDdEblBNMlJLS3ErUVpGeWUxV3A1TUQ3V3BoNWY4MU54MzBY?=
 =?utf-8?B?UHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a9bf8860-d32b-43ca-8cca-08de30c5c030
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 10:38:24.7286 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2uxCpnK4BgY2q+BC3DDcby6l1NPNeoVG9oS997zQCeBSV2xn0q2LmqLW1KLPI2G2B4WHoNYQZc5mnaJlcINO2byxr7FIr51qq1kwr6C+qto=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4560
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


On 01-Dec-25 4:13 PM, Pravalika Gurram wrote:
> EU debug and SR-IOV cannot be enabled together.
> Failed EU debug tests may leave the feature enabled,
> blocking SR-IOV tests. Explicitly disable EU debug to ensure
> clean state before running SR-IOV test.

Can we improve error handling in EU debug tests than disabling EU debug 
in SRIOV tests?

-Satya.

> Signed-off-by: Pravalika Gurram <pravalika.gurram@intel.com>
> ---
>   tests/intel/xe_sriov_auto_provisioning.c | 2 ++
>   tests/intel/xe_sriov_flr.c               | 2 ++
>   tests/intel/xe_sriov_scheduling.c        | 2 ++
>   tests/intel/xe_sriov_vram.c              | 2 ++
>   tests/sriov_basic.c                      | 2 ++
>   5 files changed, 10 insertions(+)
>
> diff --git a/tests/intel/xe_sriov_auto_provisioning.c b/tests/intel/xe_sriov_auto_provisioning.c
> index 451c3c5ca..c0d038afa 100644
> --- a/tests/intel/xe_sriov_auto_provisioning.c
> +++ b/tests/intel/xe_sriov_auto_provisioning.c
> @@ -12,6 +12,7 @@
>   #include "xe/xe_sriov_debugfs.h"
>   #include "xe/xe_sriov_provisioning.h"
>   #include "xe/xe_query.h"
> +#include "xe/xe_eudebug.h"
>   
>   /**
>    * TEST: xe_sriov_auto_provisioning
> @@ -333,6 +334,7 @@ igt_main_args("", long_opts, help_str, opts_handler, NULL)
>   		int ret;
>   
>   		pf_fd = drm_open_driver(DRIVER_XE);
> +		xe_eudebug_enable(pf_fd, false);
>   		igt_require(igt_sriov_is_pf(pf_fd));
>   		igt_require(igt_sriov_get_enabled_vfs(pf_fd) == 0);
>   
> diff --git a/tests/intel/xe_sriov_flr.c b/tests/intel/xe_sriov_flr.c
> index 3e5835487..d74d2e486 100644
> --- a/tests/intel/xe_sriov_flr.c
> +++ b/tests/intel/xe_sriov_flr.c
> @@ -17,6 +17,7 @@
>   #include "xe/xe_query.h"
>   #include "xe/xe_sriov_provisioning.h"
>   #include "xe/xe_sriov_debugfs.h"
> +#include "xe/xe_eudebug.h"
>   
>   /**
>    * TEST: xe_sriov_flr
> @@ -1030,6 +1031,7 @@ igt_main
>   
>   	igt_fixture {
>   		pf_fd = drm_open_driver(DRIVER_XE);
> +		xe_eudebug_enable(pf_fd, false);
>   		igt_require(igt_sriov_is_pf(pf_fd));
>   		igt_require(igt_sriov_get_enabled_vfs(pf_fd) == 0);
>   		autoprobe = igt_sriov_is_driver_autoprobe_enabled(pf_fd);
> diff --git a/tests/intel/xe_sriov_scheduling.c b/tests/intel/xe_sriov_scheduling.c
> index 5e8c87755..ab25383e2 100644
> --- a/tests/intel/xe_sriov_scheduling.c
> +++ b/tests/intel/xe_sriov_scheduling.c
> @@ -10,6 +10,7 @@
>   #include "xe/xe_ioctl.h"
>   #include "xe/xe_spin.h"
>   #include "xe/xe_sriov_provisioning.h"
> +#include "xe/xe_eudebug.h"
>   
>   /**
>    * TEST: Tests for SR-IOV scheduling parameters.
> @@ -891,6 +892,7 @@ igt_main_args("", long_opts, help_str, subm_opts_handler, NULL)
>   
>   	igt_fixture {
>   		pf_fd = drm_open_driver(DRIVER_XE);
> +		xe_eudebug_enable(pf_fd, false);
>   		igt_require(igt_sriov_is_pf(pf_fd));
>   		igt_require(igt_sriov_get_enabled_vfs(pf_fd) == 0);
>   		autoprobe = igt_sriov_is_driver_autoprobe_enabled(pf_fd);
> diff --git a/tests/intel/xe_sriov_vram.c b/tests/intel/xe_sriov_vram.c
> index 6c3c8e031..8e1aa2e04 100644
> --- a/tests/intel/xe_sriov_vram.c
> +++ b/tests/intel/xe_sriov_vram.c
> @@ -9,6 +9,7 @@
>   #include "intel_vram.h"
>   #include "xe/xe_sriov_provisioning.h"
>   #include "xe/xe_query.h"
> +#include "xe/xe_eudebug.h"
>   
>   /**
>    * TEST: xe_sriov_vram
> @@ -346,6 +347,7 @@ igt_main_args("", long_opts, help_str, opts_handler, NULL)
>   
>   	igt_fixture {
>   		pf_fd = drm_open_driver(DRIVER_XE);
> +		xe_eudebug_enable(pf_fd, false);
>   		igt_require(xe_has_vram(pf_fd));
>   		igt_require(igt_sriov_is_pf(pf_fd));
>   		igt_require(igt_sriov_get_enabled_vfs(pf_fd) == 0);
> diff --git a/tests/sriov_basic.c b/tests/sriov_basic.c
> index 36bca4149..0a4381896 100644
> --- a/tests/sriov_basic.c
> +++ b/tests/sriov_basic.c
> @@ -6,6 +6,7 @@
>   #include "drmtest.h"
>   #include "igt_core.h"
>   #include "igt_sriov_device.h"
> +#include "xe/xe_eudebug.h"
>   
>   IGT_TEST_DESCRIPTION("Basic tests for enabling SR-IOV Virtual Functions");
>   
> @@ -125,6 +126,7 @@ igt_main
>   
>   	igt_fixture {
>   		pf_fd = drm_open_driver(DRIVER_ANY);
> +		xe_eudebug_enable(pf_fd, false);
>   		igt_require(igt_sriov_is_pf(pf_fd));
>   		igt_require(igt_sriov_vfs_supported(pf_fd));
>   		igt_require(igt_sriov_get_enabled_vfs(pf_fd) == 0);
