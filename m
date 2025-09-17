Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 066EBCAC59A
	for <igt-dev@archiver.kernel.org>; Wed, 17 Sep 2025 16:41:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEC7410E1D4;
	Wed, 17 Sep 2025 16:41:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KWiYX3Yn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C62810E1D4
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Sep 2025 16:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758127279; x=1789663279;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=QtG7D+WEh8v3UvQsKATtHv/r7x0Y3qI7p88A7TS+vqE=;
 b=KWiYX3Yn4aiskag2MEPousGGKStMMpXfRGl3k4M5VeX7CsNrweBpim2J
 kJuQsk/KERLsdU/YZ2ywtEmC+Y2TV5SR/EqCrtPs7f6WpZg9pSfHm3i01
 dJHM6bi86vTcN9abUXO02/TkzMlq8ju4TWCS3Cse1h9wpby2FP729m8mB
 FOWSyIcIAjyvCTdW7L6Iu3v5l3MopFUyN1IzpQr/gpqBVtqLHHoYMJ4h1
 +AnhRFOehTBEOe531es/HmzbuorK18rcuavnbK0wYxQ/2hoeEWsg325yU
 1bgpjbCJJ1P+iUOBGTKn0QZbK20XtnfbQgsBHTr0T10sqCYDufMHAmw/H w==;
X-CSE-ConnectionGUID: A/JXCSmyRSiozkRfgPn4dA==
X-CSE-MsgGUID: 4HgQYJOATQOIbhhqhQo1rA==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="60507914"
X-IronPort-AV: E=Sophos;i="6.18,272,1751266800"; d="scan'208";a="60507914"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 09:41:18 -0700
X-CSE-ConnectionGUID: Ph2RHQTKRLeqkgOxKVi3Lw==
X-CSE-MsgGUID: nfRk4I3sS9uCW8YAc+pxSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,272,1751266800"; d="scan'208";a="176062812"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 09:41:19 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 17 Sep 2025 09:41:18 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 17 Sep 2025 09:41:18 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.21) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 17 Sep 2025 09:41:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GWMyKuP2GOUKIrJ5VubyL1eLF6C1bXKu+XTQRHx8e5/wlKlRBneQZN2iwJMBqaIy3vqbCWrQXzteb0ZIQZc4jgPEdYDr0y4ePNCTtb8OiFR0GG7WZFZDLThDUd7bfhE2Er8k994CHrS8/PTMP5cI+vaNFP+pYauFp6MUQUArosP0SaSFhcb0wi9r4dhhHXCYyhtuoXzuCFXoRajvVsxG4grTuxdhmPF5UWjWaLs5UmjbJDbjo7eTtqaFSRzpZBEU8glxULOV42yoRrf8NqtVovwbR3RpxNUh6eS5BMSDAqSuUrp6uzF7RXxzCSMRZoKveUBJADUvhJ12BpfZUSQPlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bGPceXbbjIbr+t/Sqljm7Zobl1L+ErD//oZSjWw27Rg=;
 b=PX4bl0meKEux1vnVKGmnh+syQJ7K3TEl9HaAXmMU9NLOHlHxQzTvyRoUhLFBbR3koa9ce6noDo61yYh5WA4+sEfHnFFMHsFiJ9Unr1kmwhM6Z+9cKSrS76WHKbrmAX28Cw6vo5ll/i1Svlm7mWlNCYVjFxgE6zDnwCNy5OMWAusmuNHAHRTa4w5B/Vfgrguxw5XhkxmCCniWqi6eMziKrEU08S56zpOxtTkfv+cUkzPw+v9quk26wQ1MVjQGG68Qe9bT1e5YhGfudNs3+4E6ezvbm9/+4p/SacAGHf7Gpb4hLljm8Iu9R2l9gnxgtuLz5mYltYPGfFlKBFldl5L/QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2760.namprd11.prod.outlook.com (2603:10b6:a02:c0::26)
 by BN9PR11MB5260.namprd11.prod.outlook.com (2603:10b6:408:135::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Wed, 17 Sep
 2025 16:41:15 +0000
Received: from BYAPR11MB2760.namprd11.prod.outlook.com
 ([fe80::edff:94fd:b8f9:34c7]) by BYAPR11MB2760.namprd11.prod.outlook.com
 ([fe80::edff:94fd:b8f9:34c7%5]) with mapi id 15.20.9115.020; Wed, 17 Sep 2025
 16:41:15 +0000
Message-ID: <af7a393d-41d9-421a-8275-def07168a6aa@intel.com>
Date: Wed, 17 Sep 2025 22:11:09 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t, v2] tests/intel/kms_mmap_write_crc: lower rounds in
 simulation
To: <igt-dev@lists.freedesktop.org>
References: <20250917085818.376666-1-swati2.sharma@intel.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <20250917085818.376666-1-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXP287CA0019.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::28) To BYAPR11MB2760.namprd11.prod.outlook.com
 (2603:10b6:a02:c0::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2760:EE_|BN9PR11MB5260:EE_
X-MS-Office365-Filtering-Correlation-Id: b6244bb2-3e59-42e6-783e-08ddf609047f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SFFCbGFzTXhnMG41ekIwYTZFaHJ0bWNNSXUyQjlETkMya0ZVbDhJU3VXZEx4?=
 =?utf-8?B?K1J0cEtJcEt2LzZNcjgrc3hIWVZmaTFaY3NsTUQ0YnBOaVlnaDk2T0pvY0VU?=
 =?utf-8?B?MXZPMkNlMXRXYVduU09ZTnNKYWRzL0Y1WUlvRnhQV0pET25Jalc2QkoxaXc0?=
 =?utf-8?B?MU9vZittd0JaNkJjYy9PTW9HTHNnS0l6Q2M1cmlsV3VsamVmZGVaWFlhTVlx?=
 =?utf-8?B?T1ZEcGRtdlJVSXFrYUlJbmNpNEo0WlFJRSs3b1FHeWFNeXU3N2hHNlRUU0NV?=
 =?utf-8?B?bC90aG1YS2JEMkNkYTYveVFINi9RVEZFSmtKTU1JL2hIR1dPMzZmeUJIWkQ3?=
 =?utf-8?B?MG01U2FsV3ZnOXd2TFJXVDFIQW5wU0VhMzk3RmdnRGlPM0dCd2cwaVliWmg2?=
 =?utf-8?B?TzFqME11ekVERmF1R1pGdG1GRXVFYnlVeVZiSTZWRlphYnBaMXAwQXB5d3Vr?=
 =?utf-8?B?NlVWZW1FWVVXcEUzS0g5RjFubERaejFNY1FSdW1zMVkySDRsVlcwSVQyZUlK?=
 =?utf-8?B?bnFEOTNWWG1tK2xrTm13azV0eGVYL3o2NnFmTDJGcXJQeGxrRDBvdHQwTU10?=
 =?utf-8?B?b0padis0emhyVnNTVXlKUXZ1cHdpK3NmeHZRQVpHVnRtZVUzYXJVY3hTQ0dw?=
 =?utf-8?B?ZEdxTFlZSEtUZjVtK0JTblhVcXdPQ1YxZGdjNzBUdHFRMUZmYkNKaXRvblBS?=
 =?utf-8?B?U2wyUlpodlNVS0FmVWZLTXJpZFN2Y3lzUEZNWFJ4VWcrbTZKWnMxdkxPdE5a?=
 =?utf-8?B?V3JmK2NhdmU1ZStEWW9aVnl4eHJTb3ZOWlFaeDVrakROOTNiNS9GeTR1TDh4?=
 =?utf-8?B?VGFBekozZnJESFZxWHZWWUoxUFI4TExpbmU2TWkrbEJRMWFNbkROWWpTK0xW?=
 =?utf-8?B?eXZnYUdiSDNRZFJMMThQNkU5dldIZGRxTytpOTEwMmZlWGpQc1JpRTdLRFdL?=
 =?utf-8?B?K2sweWlKOWVkRkZ4YU5WZ3BQRmd4ZDNyQjVrRmo4R3FobStSRnpncWJkaFEy?=
 =?utf-8?B?aHRZcHNFaWFreHRZb1FqdEJPYUxHV2Yvb3VJZFViSGhWWnNPdnBOSmpjUk9s?=
 =?utf-8?B?RXlxTmxKNzY4Q1E4R0hoV0hhUmdENGd3OWppRkt0d2lZazE1UUVCbzVLZWdr?=
 =?utf-8?B?eDBGSzJwNEFTb1ZXUlpCamtveDFmcCtvNHBkNG8vYTJRUk9MZWhHbHo1YlBo?=
 =?utf-8?B?bUg5Nmg3WStUdXp4dDdwa0lzOEk2dFBIYTZTWTJqeTl0OE5BSTdLeGw4UElI?=
 =?utf-8?B?ZTcwdDdXRHVzeVI5V2RrSHROVGs5U3V6VkF4bmQ2eXA1eEx4YndtVjl3MlRs?=
 =?utf-8?B?THFrWHBqV0p6L3B0b1YwRndqQXYyQjNCdUNQbzRBQ3RBWTZOM2hNYXg5Wm9K?=
 =?utf-8?B?ZitIaFJkY1Z0aHg4ZFh6WHdVaHNLQW04anFTWUJlanRmS1pWem9XckJ1SlFi?=
 =?utf-8?B?Y2Rxek4zYWNDV1FJaU1UdDRQMEM3eW83T3RSTDdLdG9kYmJrS0ozVUNCQ2dt?=
 =?utf-8?B?QlQ5ZlFEY2lmcTZtK1ZCMzQ4d2FBY2ZTOUQyYjdmVWl2a0ZuVk11TmlhajNU?=
 =?utf-8?B?U05XRkZMWUtPalFDb1dveDVNQVBWcVdzd3d5TzMyR3NPVUZHcU8zMUJ2Q3U3?=
 =?utf-8?B?ejBvMk9wcU9hMFpTRHl2SWNnVUxRV2dBWVg4RjhUNmVUQVRka0Vob2s4Y05z?=
 =?utf-8?B?MTF1TGkyRGI0b2gxZGMxemRJWnorQjZJemZpSUgvNEM0SnZFdm4xektLNTh2?=
 =?utf-8?B?ekhwTjVoVGpFU1M1UjcwazRvL3cxbmkrOGI0cUU0UzZ0Z2dNenhUQ0hRNUhZ?=
 =?utf-8?B?bnNXazhieUZBNVh2WDF2aFRjMnNpMUlGYm9KSXV3VlpUQmtYZEJ6UnpQSm5x?=
 =?utf-8?B?cVYrSU5HNWpKcWJHZGtZbno2aUJ3WGJ2N25QYjFhbUhFZHJKZjBBNVB5NU8y?=
 =?utf-8?Q?EqglrAOmAl4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2760.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VDBCeFNhZ0UyT0MzZU1KYmhXeUtoWEgwcVBoUDlGNnRibGZPd1loV1pmOG8y?=
 =?utf-8?B?RTQ4SUJCalJ2Sm1mR2pZeEpTeGFDZGx4VEFKS3gvS1VmaFVKa1N1NUlFaStv?=
 =?utf-8?B?RFN2bWJtNXJkTUw5UU0vTTJKWGZycjhoKzhDaExnSmdXNkF6bFVobU5yeTFZ?=
 =?utf-8?B?REduLzlZbXBZQStpZVp6TW9RNG1BdDRDd3dBMm1iaDN6NTFlK1VQemZPbnRx?=
 =?utf-8?B?MWk4WG9FOEdSVS9mZDl6a1JhUTQ4bTJrRVZvQTlna1hBWVpUKzdVZDI4UExU?=
 =?utf-8?B?MitNTjdSRUlvc2pkSkg5VUpad2xGZjk0TnluamJScDBEYzhUZUpaNFI4di95?=
 =?utf-8?B?KzBDdGRmdnVuT2hRL2pRSkRPUEU4RmtuTkRDSkdkWVVhWUpJaWk5WlN6cGky?=
 =?utf-8?B?ODdlRWFtL1Z5bzlaRDkwMENIU3ZaRDR2YUlPMkJNb0lhbkdxSktPVjZQS1NH?=
 =?utf-8?B?d1dkRHA1WW1UMDluQnBwYSt6ek9SdGl1UmpNTFJVbm8rSzR6K3FjTDR4OFlW?=
 =?utf-8?B?S0ZvMVllN1RUaFMyYmJuZ3FseHFHV2UzOERrZ2tlSi9HMFlyVk9ZUWx2U2Vr?=
 =?utf-8?B?OWhibmlmaFFUWXFmMGdYaUxMWnRGZGpaTTc0dmVncndnN2VlUTQxSXBkK1A5?=
 =?utf-8?B?UVh1YUVkSUdqWmFmQ0JtOTUxUEloeExwTmhQWUZKZWMxTEtvcXN1MzlGQ3Rr?=
 =?utf-8?B?UnJXOXVkQXZWL1RlNVpkZTIwcG05NzZvS1JrT2o0eitTR3F5eTI3bEszU1hJ?=
 =?utf-8?B?ekxPb2tkRjhQY0gwSk1WYVJlZVBZNFZSekVHQXFadFU5RWFraUVqdUNESG5U?=
 =?utf-8?B?RGxDNXpuaFRKcUIyNXRldkxMclVDRElQTnZNR1JuZm1UcVFiNmErcXB3TCtm?=
 =?utf-8?B?YWo5VC9QZ3k4anNranlxR2pJZndJSisvVllLSG52V1Q5NmtsclN5Rk5ZTEhX?=
 =?utf-8?B?d1U5QVViTlV0QjdLWlg4d2ZBNnFaRU9QK2k0amtLeVpoVVZIL3ltM3pDSDlB?=
 =?utf-8?B?K0pzYWUrQ003YmUzclZVMjNSNVluYTRrWndJWkQvODRFSFphY2JzQXdzeVFt?=
 =?utf-8?B?d2pJdGRLMkJTek1MYU4yMTliTzlaQUp2WXlIZXY5REJXd3pyVTFLNTZkUmp3?=
 =?utf-8?B?TVV1VmJtUVloemtucVZ1aTBTd0ZZa3lPOTYwMWpoYXdPcmhWYXdIRU9ZYjlm?=
 =?utf-8?B?VmFvMEZ2V2dtK1M2WlBmTUx1KzQvWUx2bXE0NTFLcTdtLytiQmVuYk5RdlEv?=
 =?utf-8?B?ZUUza0pHMVVkTVNGNkJKSkpMNnh1YVZKTkE0Ukwwcmk1bmcrRE9lbEF4K3RW?=
 =?utf-8?B?MVdSbndGVUxkbW56cS9McldFQ0pzcTFCMEJlWTJpcHRNdVpiNDg4ZUg0Mi9O?=
 =?utf-8?B?M0hlb25WWllsS0I5M1lKSWdVWXZOSW05ejVRQ1pkMmZFUzZFVkNUakR3VXdK?=
 =?utf-8?B?c2ptdzhqY2s4TWlPSUM5Wm5NUldkdEJjcXBVL1pLVjdpN25nbWN6YThZM3B3?=
 =?utf-8?B?VkNsREdlb092dTFjWS9QeHJVUWFKU1RKOEZ0MFRzTkdVYWlKKzNQNVNtMFZt?=
 =?utf-8?B?SzRBbEs3aGNNMjNqczloTW81L1c5Qi91OUlQVXV6ZG05cVdJMTBWY3hXSFZL?=
 =?utf-8?B?RHhnMG9DanZtNndFOHNmTVBrcTI2bTVtdkxENTdNQTQyZUM5ZWxDV1hRQWZq?=
 =?utf-8?B?a3BzR3Mra2lQWVdnbC9xYjlLL0tRUzM2cHdoMVAvMTRXNXpUYWcyUFk3VndE?=
 =?utf-8?B?bG9mcEpMQmFlZTM3QmNpMStWYWowT0x5Z3k1RkVjRWRDbklqOWxxRVMyc1M2?=
 =?utf-8?B?bzg5ZzBGZGtRZmduR3NNSEltcFhZbWZVWExjUGZJeXMxLzlLOFFoVHVRSXEv?=
 =?utf-8?B?cW1jeWlRK0Jza2xmdTkySk8vemlibW1jUmJFTUtCcGdyZ29yWDc5TzdDMDVD?=
 =?utf-8?B?TEEvbThTU1o1SzM2YkZ3cWx0N3NFRElKYWVROVI5c0pkVDU3eEdidzVTRStk?=
 =?utf-8?B?MW10YUNhUHl3OXMxOTVnaWxLVHBRUWUzSnZZYitoUEc2TDA0VWtOaHRFMWVS?=
 =?utf-8?B?K3cyUHJyOHAvWWVxUzZnNWNMWlVmMmRhUTN5bisrSVdHcC9yUytOc21MSFVH?=
 =?utf-8?B?eG42OVVveTJBRVFHRnZ3YkxVWTRvWTZqWTU3SllYdEwxUEUwMWxZV2dnNmtW?=
 =?utf-8?B?UEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b6244bb2-3e59-42e6-783e-08ddf609047f
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 16:41:15.0505 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rZ9z4hX4rnb1FDtFVLfcZByE0OaHTXIIfV8rRX+Fe2mwy2FiiYm7qGgAiovsDsyssc8T4CNaDYSWKSyiFt89eYni2dfWp6BlKp6X9RxdaSo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5260
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


On 9/17/2025 2:28 PM, Swati Sharma wrote:
> Reduce iterations from 10 to 5 when running in simulation to
> shorten runtime without loss of coverage.
>
> v2: embed conditional logic inside macro (Ramanaidu)
>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   tests/intel/kms_mmap_write_crc.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tests/intel/kms_mmap_write_crc.c b/tests/intel/kms_mmap_write_crc.c
> index ddc5ed63e..74ba70edd 100644
> --- a/tests/intel/kms_mmap_write_crc.c
> +++ b/tests/intel/kms_mmap_write_crc.c
> @@ -55,7 +55,7 @@
>   IGT_TEST_DESCRIPTION(
>      "Use the display CRC support to validate mmap write to an already uncached future scanout buffer.");
>   
> -#define ROUNDS 10
> +#define ROUNDS (igt_run_in_simulation() ? 5 : 10)

LGTM,

Reviewed-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>

>   
>   typedef struct {
>   	int drm_fd;
