Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C15F8D5D688
	for <igt-dev@archiver.kernel.org>; Thu,  7 Nov 2024 20:08:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 770DA10E8D1;
	Thu,  7 Nov 2024 20:08:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bWbLp0pZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F99B10E8C8
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Nov 2024 20:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731010112; x=1762546112;
 h=message-id:date:subject:to:references:cc:from:
 in-reply-to:mime-version;
 bh=dgMLGbH78kjtkptSl7qffaZ85XptKrZ20jxhlRkbUzk=;
 b=bWbLp0pZBdz/VbL5VukT1p6x6saaqWSW0H2U2MwPxYkKmeaTRXb0GIQG
 5jD4mH8p3ugL5coYXHdVBGhCGR4YJ7FRpw38YoDCc5DHrWT9QSh5DdvYy
 tYOBe9SK8FNUBGkv0rcMiOqVd0FNOE7foTmha8HgkpLpuUMSuQPj39nKn
 +wvo9tj8GUGszfghBXnf6TXRZpYQqcrLG050YGUzsb33apTrZrN5xbdq8
 COVlpRXaTyefxfhfoxcaJ6WOc2NJ5uo901n6jPoQU1zYF0Mu536QNWOoO
 +O8OBkzXcTnOj7otd5gdL6F+6IRXHtfd2UOm45v3a9oZAdGzE0ng+7+lm g==;
X-CSE-ConnectionGUID: 3TfmWyGEQ6+E6MSq4dz7xg==
X-CSE-MsgGUID: Zcvg0gljRd+WxltaUbgXEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11249"; a="41476752"
X-IronPort-AV: E=Sophos;i="6.12,136,1728975600"; d="scan'208,217";a="41476752"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2024 12:08:30 -0800
X-CSE-ConnectionGUID: Y821a2YkSoWI7tkmskWK/g==
X-CSE-MsgGUID: FCODaQF+RqGS/f5j+5mDUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,136,1728975600"; 
 d="scan'208,217";a="122731047"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Nov 2024 12:08:30 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 7 Nov 2024 12:08:29 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 7 Nov 2024 12:08:29 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 7 Nov 2024 12:08:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l/yxDOzr+aJXhy50znCqNDnpxdn9Z4UbSWSKXqOnmYMEOhiO3gbZo2VcmOfL/mtd5KLlG1f4ZAjJjxE0RomgRabKgKEYYEqU5VgAZck+NdBRdUfdaMysawPLNgZ4OUnObxLHItl8+vGF2fV4P6BTAkgBlc1C+Oo6lnaM4sTUo41SOjtU+vMV/D9C6/zOUb5PBz8h1jhR10zcIzL56zmI4rK5LLagyuX9fTjkJxq9tgcBrYkkxG0AY/LwS12YtHrt9a1pMRV1QTlY7f3xhqow1c7rKw14zZPS8rpJ1MZMWZUgUkK7CbUbqpW4sep14f6B54PFhe4QIWIpEX1grvnU/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Gjxvr1rZlENe8eTXHLJYQlBJDzZlMsjIiuSGZMEU68=;
 b=EcY+2NSMmVo/aQlBEMq4WRlqRl8ujVplok9n0vR7b9VIz8jFowwrCU6Su8PRRN/79L3XlilYzJ6UeiqI3yAIkIsAe0ki7cuW5Q/wfiasxT5nTS1P8/ng8dSdvCGkooyTh8cMbTvF5oK7qugPcX3FxDcgkkzRoexVi0WkKDvVxqkb0nIb7n430WXG9WZyAvZzW6pxnGtrmEY+jx5VBiP3VEjK6sNvzbTRAB85OCKkDaxQc28v/ljoc1aVvlaNf/yBlmq1Zl+TDMA+FLjdGAw12hEAwGVr05/jWJbl1CGoknTcDmNQxxgX60ZTptpwFpx6s2EMpcyVBLOKUOJ/5wkDjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7717.namprd11.prod.outlook.com (2603:10b6:510:2b8::8)
 by MW4PR11MB6888.namprd11.prod.outlook.com (2603:10b6:303:22d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Thu, 7 Nov
 2024 20:08:20 +0000
Received: from PH7PR11MB7717.namprd11.prod.outlook.com
 ([fe80::a546:1ad2:2379:b848]) by PH7PR11MB7717.namprd11.prod.outlook.com
 ([fe80::a546:1ad2:2379:b848%3]) with mapi id 15.20.8137.019; Thu, 7 Nov 2024
 20:08:20 +0000
Content-Type: multipart/alternative;
 boundary="------------Rei4KCxEBcjx00l0CR0H6hBl"
Message-ID: <61f40bb5-21ab-4ec8-932c-8d56ffc75fbf@intel.com>
Date: Thu, 7 Nov 2024 12:08:19 -0800
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2ExeFULL=3A_failure_for_tests/intel/xe?=
 =?UTF-8?Q?=5Fvm=3A_Reduce_n=5Fexecs_for_bind-array-enobufs?=
To: <igt-dev@lists.freedesktop.org>
References: <fb348c83c291f4257f525077660b9b67630d25a5.1730838535.git.jagmeet.randhawa@intel.com>
 <173094442551.1419712.788151085923243885@2413ebb6fbb6>
Content-Language: en-US
CC: Kamil Konieczny <kamil.konieczny@linux.intel.com>
From: "Randhawa, Jagmeet" <jagmeet.randhawa@intel.com>
In-Reply-To: <173094442551.1419712.788151085923243885@2413ebb6fbb6>
X-ClientProxiedBy: SJ0PR03CA0349.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::24) To PH7PR11MB7717.namprd11.prod.outlook.com
 (2603:10b6:510:2b8::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7717:EE_|MW4PR11MB6888:EE_
X-MS-Office365-Filtering-Correlation-Id: a941822e-0b10-4268-fb24-08dcff67ecc7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bXpqd0JYak9GOW5QdUZUOUtrZlh5L2ZlUFZobW1RTkZEbmlSb1FHdXg0WW4v?=
 =?utf-8?B?Nko2Q0RXVFNlSnQ2OWxxeVdNQkxZTGhrVERTZGtHWktneXptR3NPWGVFaEh6?=
 =?utf-8?B?YnMybE0yUWN6dUx6c1prQXZORUlKY0lFWTdiZEdoVU5aUE5DMFkya0xzUmNW?=
 =?utf-8?B?ekcrd3RPdUplZ0VnUEMrRWdXOVBqdUc2d2hpcTFDUHd2dzFaR2c5bnMvcVFJ?=
 =?utf-8?B?RGVwM3dHSGFTeEdRdGZ5ODQ5M3c3WUQvMEw4TDFURzZIT2JTWlg1Qm1XZkVW?=
 =?utf-8?B?bGFuSWY1OG1XMDlLVzNjcXNHL0tNZzIzUkZxNVVnVTF1WEZCaVRnMW1EMGVN?=
 =?utf-8?B?Yk1qVGlHMUdhY0gyT2tzRk5zQ2duTzVLOW85UEJSODR2Q3luRVVobFE1WU1C?=
 =?utf-8?B?bXlZZXkvVTFnOEtVeksrQUZGZ1NSUUprNUFrMGc3YkRGamxyY2xjME93cXE5?=
 =?utf-8?B?ZGN1ZnZHUVpYNVpuWGxCaDhqQk5VWS8raGpia3I0aEVpNmUyN2diTDNOMDhM?=
 =?utf-8?B?SjRWSGZTRncrS0FyQ25OYnNXZlA2V2xWZU9xeFVIaXFwNzhxb2tzQ0p5aUxu?=
 =?utf-8?B?bVRsUnlDcnlOc2YyeHFzRi8vWmw1Sm1FZ2duM01GekQrRXltVnp6T0JoUHM3?=
 =?utf-8?B?cFplRDV6UHB0bnZsbEhEbjJmK2o0ZVdQbkVveUpWS1BuNFhQeEhqbFh4dTU3?=
 =?utf-8?B?YWgyYW4zdmQ5QnphVkxPeERGbmRqa1pQcE1CY01mS3hnaVVJcnlJRkNzNUNI?=
 =?utf-8?B?bXRWZi9EaWt5b1ZYV2J5V2FWb3R1cEhPNzdlcy9ESWc0MzhvQjcwUlJXYnNO?=
 =?utf-8?B?aUlhd0NCM1A3TjFXTVB4czNSWVRRc0RwL1BhYWFaYUpoRGprbjdUaU1hUFVN?=
 =?utf-8?B?cDBOdWdrUWozRk9yNG1hQUF6dW1MeWJtQWZGSVFJRTFSemFqVWYzM1lNVkdu?=
 =?utf-8?B?bnhpZEpZc1BmZlNBWTR3RzJ5Q0JkSGs2bDNnOXpJNUJqaFlsOXorUkE5TFBE?=
 =?utf-8?B?S2FwQWxLSzZnTUc2aWc5cG9BMnJObGduRE42N1FkZEpJUm1HK3NqNTFHcFM1?=
 =?utf-8?B?V2JoWXIveVlGWW11MjE5bEFEaTM1WlF1anFzVkUyZ2c0Mzhaa3Z5UFJPVTc4?=
 =?utf-8?B?UlR3NEJyOEdrV1kwUGU5OFJmb2JnRVkrMmc4bXoxQ2lHTGNhZ0I2WFo1Rm1k?=
 =?utf-8?B?TkZGRUJvVFZiOS83cXp3dElFTE1WK0dRcWVpcmxZbFNucDVIMTR2Nm9od29P?=
 =?utf-8?B?Ri9tR3EyT3p0UVR2SVhrME5sQldOM0hDdXFKN3p1eTNrNWtxQTJNbHZhWHln?=
 =?utf-8?B?SWpNclJxSlhoWEJmTTk3TFZ2dGduT2dEUXE1QzB6UnlqRXRqc2pZWjduQkpE?=
 =?utf-8?B?dW5LVzg0LzB4K2VQYU1jKzdIWjZiN1VWQVErK1J4end2MGFPK2wyZzhkcit4?=
 =?utf-8?B?Tlh6TnluUUJLQlpVTGRLU1NDZkFCMXBsUlRLRGpDWEQ1VUY2U3VtK3hzeUk4?=
 =?utf-8?B?M3Z5Z3VIR3pZQmNjY2hxeFhQTTU2Qy8rd2phOEFEZGZmZVE4VXVqT2ZLRWI3?=
 =?utf-8?B?SkZkeG1TeHlPRFBkMlhQQlduWStROC90Y2FDOCt6bHg3dGdBUVY1emRXNE5D?=
 =?utf-8?B?cnJranVxczBFdHJmbTNwdDc0NzIxcE53a0Vxd0FHOTJLSFJWVTVpdjZZVGlK?=
 =?utf-8?B?MTV4WGlVVEpwVkJQUGVrYjdocmRNZ3pOWHlMMlU3cnltWkVkZ1VudStBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7717.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TFpzYS9TYUtqTXhkWDVIUEtjTTZiY3pzdWVWbGo0aTBEMVc3VjdVWnBoV1RK?=
 =?utf-8?B?WTBuZnV4bXNRcUt1M0s2ZmJ4K2JaTnNRenBDa3lMSHJRSGtHeGFIT25KblZ1?=
 =?utf-8?B?VVNyalNYQUpQdFJxMUE0TW1GZFp5RmtLQjVXLzNaZ3k0cjJ3RmRSVmdLNjFX?=
 =?utf-8?B?TU5ZL0hDSEdCN2pjWEUvV3pqNUJxeFdjVStKVFVXK2QwK3F2Wm5MZEd5Z3Rn?=
 =?utf-8?B?SXhSS2xla2dxYnNtQXRBRE5zZWZsSmQybWhIYmZPcHBpMnVuc21kRW0xT2Zx?=
 =?utf-8?B?ZVlyWFQ1UUVsSWU3K2Q2bDdDMTdnd2JxVWtwbisraW5lcGphemFXWVI4dEh6?=
 =?utf-8?B?MnNHZGZLOThXZngwWXdmMVdTcmV4ZGpDV012T1JUSUdjS2JvNUxpYzBsVjhy?=
 =?utf-8?B?cW1jNVM1WDNLZWRmZnhSVjVDTkxOdktFd1JtdWg0WFR0NDNtQUR2Zmk2eXRO?=
 =?utf-8?B?a0dWNDkzbUxBVDVqWkw4MWM1ZmNqdEZ5MUxWZlN3cCt1d3BoRGJhUkRZRUUv?=
 =?utf-8?B?SUN6QklCbjFmZDFSR2VHR0RVeUZxQnI0bHNORkpJYmx2a3hoemlqWFluVDUw?=
 =?utf-8?B?MElsQnJNOUU3QmNvMFo4OU1QYXlMV2ZGaFlQYmUrRFhrVkUzdCtRVUNpOFpn?=
 =?utf-8?B?ZE55U2ZwUUo0bTJHclJhSHozV2E4eHprbFhTK0xoWE9YcENlTFo4R1N1Wm55?=
 =?utf-8?B?ZGlRWWxlYnQxeE5taVRSMWN5MHdyOTdwL2U0ZHJ1ekJsb2NJSnUvRlhjczNr?=
 =?utf-8?B?MVNlK0FCbHU0Tjg3ZE05ODdBOTV1UXJFY1BjS3VhdEtHSWw1VElxemR1L0c0?=
 =?utf-8?B?RzJQT2t5V09rclBrdDlCelhEYkJKYTM1L0RoR0NDeWtBaFBhdVVKb1RwaG85?=
 =?utf-8?B?V3JaY00wTjlra3ZldWNHNVg5M3kraHdhQ3MrVi9qTGJkb1lNUnhwV0MyMHpG?=
 =?utf-8?B?aVQwbVppeWlxNzM0aDFvV2RTM1dBWkhwYjVJOGNGY1lSR2RyS0o2VDhuWjJS?=
 =?utf-8?B?cnlWUGpSVlZEbnl4MUlwdHJEcG1HaGlGTms5WmxFVWV4UGloZWtRUm1BQkFS?=
 =?utf-8?B?SW5penY4eWZpakpnVWVkakZ6REliNTY3eENvUEkzYlZleFF2SnUybG5xdUo0?=
 =?utf-8?B?R2VlenFrdDJXcHMvdTVvMDBOVGY1dFZGdXoxYWxuZmN1bTB4bHhaWlhQMWhj?=
 =?utf-8?B?T0Z0R1paTGg2MGdmKytFUUZTcS92a3FQOE9rK0FyQTduYnlsbFpNSm9UZ2p0?=
 =?utf-8?B?WFdXQU1FeHlMd2R3c2ZPOFZ2ZW9KMXlCUytyWTVuMVAybVNMTy9lSHg5T0h3?=
 =?utf-8?B?cnlQam5MOXNUN1NuMHB2dVdzc2h0K1kvWHQ0eXJ2ak5heGxNZHlYL3pPWllw?=
 =?utf-8?B?WXFPR0xpWTdvWS8zV1VUQldtQTFYWGtPQ0FDQVBiME91Q3JnWHk0QUhjdDFt?=
 =?utf-8?B?MmRTSXVYRUo1TVdROHlsb3FGRytvNVNudHJHaUNYenVpeDBHMWZVeHlsUngr?=
 =?utf-8?B?REtWWG1jWDVGYUFNQ2NTMW1ZN0dOSUlRSUllOXBwcDlIY0lFb1VmNk1ibWZ1?=
 =?utf-8?B?YSsreDBLTWNJUFh0b0lscnRNN2ZMbEhvaFVyNWFMOGhjSHhKM0l2Zkt6alcx?=
 =?utf-8?B?T2phdjJlWSt0R1lxbFpLTDhqS3Q5bkQwcjc5SGdpRFBoQ3E1U3R2MElrZGw0?=
 =?utf-8?B?eHV3NytabHlyV090aGZBNFE2REMwSDAzOHBOUEZCN0dQS2hvWHdYejlRVlBk?=
 =?utf-8?B?RHEzK2VBOTl0bGRCQTBPejRRYjRVNkd3cTkvMy9LUzlrQkQzb1JYUENrNjVl?=
 =?utf-8?B?Z0ZmL2hrTGpQU29ibDBjRmlTTnVlNHUrUzdtOXR3N1ZyZW0rTUdxaHFYWmZI?=
 =?utf-8?B?MWlRWC9vcEFlZ0JLQzNTQWQrQ1RKSEt2MGpDYi9leGNkMUpKYlRXSWE5U1E5?=
 =?utf-8?B?TGZDWFM1eHl2ci85SkhWbngxZy94YkVrRWRTVkJLODlJdVBDZmVGUDhkVmxk?=
 =?utf-8?B?N1pLanpQWFN2ZktVZHV5dUMzOUhFSk9YaXk2Qy96MHp5aDNxenQyRmQvRzJO?=
 =?utf-8?B?RGliR0tNVFhqMjlNdGZIcWZOZTNFVlZGbXhyN0ladk9sdkl5S3gyUmFXRGh6?=
 =?utf-8?B?ZzAxcHptaEdHaDFSMnlQSVEvQnRVMkNGNVdzeklTaGQzZTJ6ZmdmYURDQWxL?=
 =?utf-8?B?ZHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a941822e-0b10-4268-fb24-08dcff67ecc7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7717.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2024 20:08:20.0868 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T5Z0rLvtoKzirik3cDUdXWEDh/DpJ32Bf0l+Eq9HUx1B+7PUkL5Gjkvbae3iRNonhKWX3y3W6P6PmkYKmy/VskuJG1BaJrju6Sii1RIhTZI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6888
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

--------------Rei4KCxEBcjx00l0CR0H6hBl
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi igt-dev,

On 11/6/2024 5:53 PM, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	tests/intel/xe_vm: Reduce n_execs for bind-array-enobufs
> *URL:* 	https://patchwork.freedesktop.org/series/140965/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/index.html
>
>
>   CI Bug Log - changes from XEIGT_8098_full -> XEIGTPW_12042_full
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with XEIGTPW_12042_full absolutely need 
> to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in XEIGTPW_12042_full, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
>
>     Participating hosts (4 -> 4)
>
> No changes in participating hosts
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in 
> XEIGTPW_12042_full:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>  *
>
>     igt@core_getversion@basic:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-433/igt@core_getversion@basic.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-434/igt@core_getversion@basic.html>
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:
>
>       o shard-dg2-set2: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html>
>  *
>
>     igt@kms_flip@plain-flip-fb-recreate@a-dp4:
>
>       o shard-dg2-set2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-463/igt@kms_flip@plain-flip-fb-recreate@a-dp4.html>
>  *
>
>     igt@kms_psr@psr2-cursor-render@edp-1:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-lnl-3/igt@kms_psr@psr2-cursor-render@edp-1.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-lnl-2/igt@kms_psr@psr2-cursor-render@edp-1.html>
>         +1 other test fail
>
>
>         Warnings
>
>   * igt@xe_exec_compute_mode@many-execqueues-userptr-rebind:
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-434/igt@xe_exec_compute_mode@many-execqueues-userptr-rebind.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) ->
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-463/igt@xe_exec_compute_mode@many-execqueues-userptr-rebind.html>
>
>
>     New tests
>
> New tests have been introduced between XEIGT_8098_full and 
> XEIGTPW_12042_full:
>
>
>       New IGT tests (2)
>
>  *
>
>     igt@kms_flip@wf_vblank-ts-check@d-dp5:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [4.36] s
>  *
>
>     igt@kms_lease@atomic-implicit-crtc@pipe-d-dp-5:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.00] s
>
>
>     Known issues
>
> Here are the changes found in XEIGTPW_12042_full that come from known 
> issues:
>
>
>       IGT changes
>
>
>         Issues hit
>
>  *
>
>     igt@core_setmaster@master-drop-set-user:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-464/igt@core_setmaster@master-drop-set-user.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-434/igt@core_setmaster@master-drop-set-user.html>
>         (Intel XE#3339
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3339>)
>  *
>
>     igt@fbdev@info:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-432/igt@fbdev@info.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-434/igt@fbdev@info.html>
>         (Intel XE#2134
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134>)
>  *
>
>     igt@fbdev@write:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-434/igt@fbdev@write.html>
>         (Intel XE#2134
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134>)
>  *
>
>     igt@intel_hwmon@hwmon-read:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-lnl-6/igt@intel_hwmon@hwmon-read.html>
>         (Intel XE#1125
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125>)
>  *
>
>     igt@kms_3d:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-432/igt@kms_3d.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-434/igt@kms_3d.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423>) +1
>         other test skip
>  *
>
>     igt@kms_async_flips@alternate-sync-async-flip:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip.html>
>         (Intel XE#827
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/827>) +1
>         other test fail
>  *
>
>     igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-435/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html>
>         (Intel XE#2550
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2550>)
>         +23 other tests skip
>  *
>
>     igt@kms_atomic_transition@plane-toggle-modeset-transition:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-5/igt@kms_atomic_transition@plane-toggle-modeset-transition.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-3/igt@kms_atomic_transition@plane-toggle-modeset-transition.html>
>         (Intel XE#1426
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426>) +1
>         other test fail
>  *
>
>     igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html>
>         (Intel XE#2231
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231> /
>         Intel XE#2890
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) +1
>         other test skip
>  *
>
>     igt@kms_big_fb@linear-32bpp-rotate-270:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-2/igt@kms_big_fb@linear-32bpp-rotate-270.html>
>         (Intel XE#2327
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327>)
>  *
>
>     igt@kms_big_fb@x-tiled-64bpp-rotate-90:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-lnl-5/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html>
>         (Intel XE#1407
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407>) +3
>         other tests skip
>  *
>
>     igt@kms_big_fb@x-tiled-8bpp-rotate-0:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-lnl-1/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-lnl-5/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html>
>         (Intel XE#2929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2929>)
>  *
>
>     igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +5
>         other tests skip
>  *
>
>     igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-7/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +4
>         other tests skip
>  *
>
>     igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-lnl-8/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +1
>         other test skip
>  *
>
>     igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-435/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html>
>         (Intel XE#367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>)
>  *
>
>     igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-lnl-6/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html>
>         (Intel XE#1512
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512>)
>  *
>
>     igt@kms_bw@linear-tiling-1-displays-2560x1440p:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-2/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html>
>         (Intel XE#367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>)
>  *
>
>     igt@kms_bw@linear-tiling-3-displays-2560x1440p:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-lnl-2/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html>
>         (Intel XE#367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>)
>  *
>
>     igt@kms_ccs@crc-primary-basic-y-tiled-ccs:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-lnl-4/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html>
>         (Intel XE#2887
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) +2
>         other tests skip
>  *
>
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html>
>         (Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>)
>         +128 other tests skip
>  *
>
>     igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-4/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs.html>
>         (Intel XE#2887
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) +4
>         other tests skip
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-5:
>
>       o shard-dg2-set2: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-5.html>
>         (Intel XE#1195
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>)
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:
>
>       o shard-dg2-set2: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html>
>         (Intel XE#3113
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113>)
>  *
>
>     igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-d-dp-5:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-466/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-d-dp-5.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +25
>         other tests skip
>  *
>
>     igt@kms_cdclk@mode-transition@pipe-d-dp-4:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-463/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html>
>         (Intel XE#314
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/314>) +3
>         other tests skip
>  *
>
>     igt@kms_cdclk@plane-scaling:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-lnl-7/igt@kms_cdclk@plane-scaling.html>
>         (Intel XE#1152
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152>) +3
>         other tests skip
>  *
>
>     igt@kms_chamelium_audio@hdmi-audio-edid:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-6/igt@kms_chamelium_audio@hdmi-audio-edid.html>
>         (Intel XE#2252
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252>) +3
>         other tests skip
>  *
>
>     igt@kms_chamelium_frames@dp-crc-single:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-lnl-1/igt@kms_chamelium_frames@dp-crc-single.html>
>         (Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +1
>         other test skip
>  *
>
>     igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html>
>         (Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +2
>         other tests skip
>  *
>
>     igt@kms_color@ctm-blue-to-red:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-2/igt@kms_color@ctm-blue-to-red.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-5/igt@kms_color@ctm-blue-to-red.html>
>         (Intel XE#3007
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007>) +9
>         other tests skip
>  *
>
>     igt@kms_content_protection@content-type-change:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-8/igt@kms_content_protection@content-type-change.html>
>         (Intel XE#2341
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341>)
>  *
>
>     igt@kms_content_protection@dp-mst-lic-type-1:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-4/igt@kms_content_protection@dp-mst-lic-type-1.html>
>         (Intel XE#2390
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390>)
>  *
>
>     igt@kms_content_protection@srm@pipe-a-dp-4:
>
>       o shard-dg2-set2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-463/igt@kms_content_protection@srm@pipe-a-dp-4.html>
>         (Intel XE#1178
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178>)
>  *
>
>     igt@kms_content_protection@type1:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-lnl-1/igt@kms_content_protection@type1.html>
>         (Intel XE#3278
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278>)
>  *
>
>     igt@kms_cursor_crc@cursor-onscreen-256x85:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-lnl-7/igt@kms_cursor_crc@cursor-onscreen-256x85.html>
>         (Intel XE#1424
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424>)
>  *
>
>     igt@kms_cursor_crc@cursor-onscreen-32x32:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-6/igt@kms_cursor_crc@cursor-onscreen-32x32.html>
>         (Intel XE#2320
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320>) +1
>         other test skip
>  *
>
>     igt@kms_cursor_crc@cursor-rapid-movement-64x64:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-5/igt@kms_cursor_crc@cursor-rapid-movement-64x64.html>
>         (Intel XE#3007
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007>) +2
>         other tests skip
>  *
>
>     igt@kms_cursor_crc@cursor-sliding-64x64:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-463/igt@kms_cursor_crc@cursor-sliding-64x64.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-434/igt@kms_cursor_crc@cursor-sliding-64x64.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         +95 other tests skip
>  *
>
>     igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-lnl-3/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html>
>         (Intel XE#309
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/309>) +1
>         other test skip
>  *
>
>     igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-lnl-3/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-lnl-5/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size.html>
>         (Intel XE#1541
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1541>)
>  *
>
>     igt@kms_dsc@dsc-with-output-formats:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-lnl-1/igt@kms_dsc@dsc-with-output-formats.html>
>         (Intel XE#2244
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244>)
>  *
>
>     igt@kms_fbcon_fbt@fbc-suspend:
>
>       o shard-bmg: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-4/igt@kms_fbcon_fbt@fbc-suspend.html>
>         (Intel XE#1695
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1695>)
>  *
>
>     igt@kms_feature_discovery@chamelium:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-8/igt@kms_feature_discovery@chamelium.html>
>         (Intel XE#2372
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372>)
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-435/igt@kms_feature_discovery@chamelium.html>
>         (Intel XE#701
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/701>)
>  *
>
>     igt@kms_feature_discovery@display:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-434/igt@kms_feature_discovery@display.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         +15 other tests skip
>  *
>
>     igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-dp2-hdmi-a3:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-5/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-dp2-hdmi-a3.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-4/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-dp2-hdmi-a3.html>
>         (Intel XE#2882
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882>) +1
>         other test fail
>  *
>
>     igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
>
>       o shard-bmg: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html>
>         (Intel XE#301
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>) +6
>         other tests fail
>  *
>
>     igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:
>
>       o shard-dg2-set2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html>
>         (Intel XE#301
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>) +6
>         other tests fail
>  *
>
>     igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html>
>         (Intel XE#301
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>) +1
>         other test fail
>  *
>
>     igt@kms_flip@2x-flip-vs-suspend:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-lnl-6/igt@kms_flip@2x-flip-vs-suspend.html>
>         (Intel XE#1421
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421>) +3
>         other tests skip
>  *
>
>     igt@kms_flip@bo-too-big-interruptible@a-edp1:
>
>       o shard-lnl: NOTRUN -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-lnl-7/igt@kms_flip@bo-too-big-interruptible@a-edp1.html>
>         (Intel XE#1504
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1504>) +1
>         other test timeout
>  *
>
>     igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-lnl-5/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-lnl-1/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html>
>         (Intel XE#886
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/886>) +1
>         other test fail
>  *
>
>     igt@kms_flip@plain-flip-fb-recreate:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-466/igt@kms_flip@plain-flip-fb-recreate.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-463/igt@kms_flip@plain-flip-fb-recreate.html>
>         (Intel XE#2882
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +2
>         other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html>
>         (Intel XE#2890
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>)
>         +18 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@basic:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-432/igt@kms_frontbuffer_tracking@basic.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-434/igt@kms_frontbuffer_tracking@basic.html>
>         (Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351>)
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html>
>         (Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +11
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html>
>         (Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351> /
>         Intel XE#2890
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>)
>         +11 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:
>
>       o shard-bmg: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html>
>         (Intel XE#2333
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333>) +4
>         other tests fail
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html>
>         (Intel XE#2890
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>)
>         +25 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt.html>
>         (Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +2
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen.html>
>         (Intel XE#2311
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311>)
>         +14 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html>
>         (Intel XE#656
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>) +7
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html>
>         (Intel XE#2313
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313>)
>         +10 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html>
>         (Intel XE#653
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +10
>         other tests skip
>  *
>
>     igt@kms_hdr@static-toggle-suspend:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-lnl-1/igt@kms_hdr@static-toggle-suspend.html>
>         (Intel XE#1503
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503>)
>  *
>
>     igt@kms_joiner@basic-big-joiner:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-8/igt@kms_joiner@basic-big-joiner.html>
>         (Intel XE#346
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/346>)
>  *
>
>     igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:
>
>       o shard-dg2-set2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-435/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html>
>         (Intel XE#616
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/616>) +1
>         other test fail
>  *
>
>     igt@kms_plane_multiple@tiling-yf:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-lnl-5/igt@kms_plane_multiple@tiling-yf.html>
>         (Intel XE#2493
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493>)
>  *
>
>     igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-464/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b.html>
>         (Intel XE#2763
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763>) +5
>         other tests skip
>  *
>
>     igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-432/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d.html>
>         (Intel XE#2763
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +2
>         other tests skip
>  *
>
>     igt@kms_pm_dc@dc5-retention-flops:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-433/igt@kms_pm_dc@dc5-retention-flops.html>
>         (Intel XE#3309
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309>)
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-7/igt@kms_pm_dc@dc5-retention-flops.html>
>         (Intel XE#3309
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309>)
>  *
>
>     igt@kms_pm_dc@dc6-dpms:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-lnl-5/igt@kms_pm_dc@dc6-dpms.html>
>         (Intel XE#1430
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430>)
>  *
>
>     igt@kms_pm_rpm@basic-rte:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-433/igt@kms_pm_rpm@basic-rte.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-434/igt@kms_pm_rpm@basic-rte.html>
>         (Intel XE#2446
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446>) +1
>         other test skip
>  *
>
>     igt@kms_pm_rpm@modeset-lpsp:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-2/igt@kms_pm_rpm@modeset-lpsp.html>
>         (Intel XE#1439
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439> /
>         Intel XE#3141
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141>) +1
>         other test skip
>  *
>
>     igt@kms_pm_rpm@universal-planes:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-lnl-5/igt@kms_pm_rpm@universal-planes.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-lnl-7/igt@kms_pm_rpm@universal-planes.html>
>         (Intel XE#2042
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042>)
>  *
>
>     igt@kms_pm_rpm@universal-planes@plane-50:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-lnl-5/igt@kms_pm_rpm@universal-planes@plane-50.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-lnl-7/igt@kms_pm_rpm@universal-planes@plane-50.html>
>         (Intel XE#3184
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184>)
>  *
>
>     igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-lnl-7/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html>
>         (Intel XE#2893
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893>) +2
>         other tests skip
>  *
>
>     igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-433/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html>
>         (Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>)
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-7/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html>
>         (Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +2
>         other tests skip
>  *
>
>     igt@kms_psr2_su@page_flip-p010:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-6/igt@kms_psr2_su@page_flip-p010.html>
>         (Intel XE#2387
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387>)
>  *
>
>     igt@kms_psr@fbc-pr-cursor-render:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-2/igt@kms_psr@fbc-pr-cursor-render.html>
>         (Intel XE#2234
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234> /
>         Intel XE#2850
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850>) +4
>         other tests skip
>  *
>
>     igt@kms_psr@fbc-pr-suspend:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-lnl-1/igt@kms_psr@fbc-pr-suspend.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406>) +1
>         other test skip
>  *
>
>     igt@kms_psr@fbc-psr-sprite-plane-onoff:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-434/igt@kms_psr@fbc-psr-sprite-plane-onoff.html>
>         (Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351> /
>         Intel XE#2890
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>)
>         +10 other tests skip
>  *
>
>     igt@kms_psr@fbc-psr2-dpms:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-432/igt@kms_psr@fbc-psr2-dpms.html>
>         (Intel XE#2850
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850> /
>         Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>)
>  *
>
>     igt@kms_psr@psr2-sprite-blt:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-5/igt@kms_psr@psr2-sprite-blt.html>
>         (Intel XE#2231
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231> /
>         Intel XE#2890
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) +1
>         other test skip
>  *
>
>     igt@kms_rotation_crc@primary-x-tiled-reflect-x-0:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-lnl-5/igt@kms_rotation_crc@primary-x-tiled-reflect-x-0.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-lnl-7/igt@kms_rotation_crc@primary-x-tiled-reflect-x-0.html>
>         (Intel XE#2055
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2055>)
>  *
>
>     igt@kms_vrr@cmrr@pipe-a-edp-1:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-lnl-3/igt@kms_vrr@cmrr@pipe-a-edp-1.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-lnl-3/igt@kms_vrr@cmrr@pipe-a-edp-1.html>
>         (Intel XE#2159
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2159>) +1
>         other test fail
>  *
>
>     igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-435/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html>
>         (Intel XE#1091
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091> /
>         Intel XE#2849
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849>)
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-8/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html>
>         (Intel XE#1091
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091> /
>         Intel XE#2849
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849>)
>  *
>
>     igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-463/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html>
>         (Intel XE#1280
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>)
>  *
>
>     igt@xe_copy_basic@mem-copy-linear-0x369:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-463/igt@xe_copy_basic@mem-copy-linear-0x369.html>
>         (Intel XE#1123
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123>)
>  *
>
>     igt@xe_eudebug@basic-vm-access-parameters:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-lnl-8/igt@xe_eudebug@basic-vm-access-parameters.html>
>         (Intel XE#2905
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905>) +1
>         other test skip
>  *
>
>     igt@xe_eudebug@basic-vm-bind-metadata-discovery:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-7/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html>
>         (Intel XE#2905
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905>) +5
>         other tests skip
>  *
>
>     igt@xe_eudebug_online@reset-with-attention:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-463/igt@xe_eudebug_online@reset-with-attention.html>
>         (Intel XE#2905
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905>) +5
>         other tests skip
>  *
>
>     igt@xe_evict@evict-beng-threads-large:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-lnl-5/igt@xe_evict@evict-beng-threads-large.html>
>         (Intel XE#688
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/688>) +3
>         other tests skip
>  *
>
>     igt@xe_evict@evict-large-multi-vm-cm:
>
>       o shard-bmg: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-3/igt@xe_evict@evict-large-multi-vm-cm.html>
>         (Intel XE#2364
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364>)
>  *
>
>     igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-2/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-7/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd.html>
>         (Intel XE#3198
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3198>)
>  *
>
>     igt@xe_exec_basic@many-bindexecqueue-rebind:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-6/igt@xe_exec_basic@many-bindexecqueue-rebind.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-5/igt@xe_exec_basic@many-bindexecqueue-rebind.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>)
>         +23 other tests skip
>  *
>
>     igt@xe_exec_basic@multigpu-no-exec-rebind:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-4/igt@xe_exec_basic@multigpu-no-exec-rebind.html>
>         (Intel XE#2322
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322>) +1
>         other test skip
>  *
>
>     igt@xe_exec_basic@multigpu-once-userptr-invalidate:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-lnl-6/igt@xe_exec_basic@multigpu-once-userptr-invalidate.html>
>         (Intel XE#1392
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392>) +1
>         other test skip
>  *
>
>     igt@xe_exec_compute_mode@once-basic:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-434/igt@xe_exec_compute_mode@once-basic.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>)
>         +31 other tests skip
>  *
>
>     igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-466/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate.html>
>         (Intel XE#288
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +10
>         other tests skip
>  *
>
>     igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-lnl-6/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-lnl-5/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html>
>         (Intel XE#1630
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1630>) +1
>         other test fail
>  *
>
>     igt@xe_exec_fault_mode@many-userptr-invalidate-race:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-5/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-6/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html>
>         (Intel XE#1630
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1630>)
>  *
>
>     igt@xe_huc_copy@huc_copy:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-433/igt@xe_huc_copy@huc_copy.html>
>         (Intel XE#255
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/255>)
>  *
>
>     igt@xe_live_ktest@xe_bo:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-434/igt@xe_live_ktest@xe_bo.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-464/igt@xe_live_ktest@xe_bo.html>
>         (Intel XE#1195
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>) +1
>         other test incomplete
>  *
>
>     igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
>
>       o shard-dg2-set2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-466/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html>
>         (Intel XE#1999
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999>) +2
>         other tests fail
>  *
>
>     igt@xe_oa@oa-unit-exclusive-stream-sample-oa:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-466/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html>
>         (Intel XE#2541
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541>) +1
>         other test skip
>  *
>
>     igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:
>
>       o shard-dg2-set2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-433/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html>
>         (Intel XE#1173
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173>) +1
>         other test fail
>  *
>
>     igt@xe_pm@d3cold-mmap-vram:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-464/igt@xe_pm@d3cold-mmap-vram.html>
>         (Intel XE#2284
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284> /
>         Intel XE#366
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/366>)
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-8/igt@xe_pm@d3cold-mmap-vram.html>
>         (Intel XE#2284
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284>)
>  *
>
>     igt@xe_pm@d3hot-basic:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-5/igt@xe_pm@d3hot-basic.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>)
>  *
>
>     igt@xe_pm@d3hot-mmap-vram:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-lnl-2/igt@xe_pm@d3hot-mmap-vram.html>
>         (Intel XE#1948
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1948>)
>  *
>
>     igt@xe_pm@s2idle-exec-after:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-463/igt@xe_pm@s2idle-exec-after.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-434/igt@xe_pm@s2idle-exec-after.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>)
>         +157 other tests skip
>  *
>
>     igt@xe_pm@s3-vm-bind-userptr:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-463/igt@xe_pm@s3-vm-bind-userptr.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-432/igt@xe_pm@s3-vm-bind-userptr.html>
>         (Intel XE#1794
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794>)
>  *
>
>     igt@xe_pm@s4-d3hot-basic-exec:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-lnl-3/igt@xe_pm@s4-d3hot-basic-exec.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.html>
>         (Intel XE#1358
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358> /
>         Intel XE#1607
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607>)
>  *
>
>     igt@xe_pm@vram-d3cold-threshold:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-466/igt@xe_pm@vram-d3cold-threshold.html>
>         (Intel XE#579
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/579>)
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-2/igt@xe_pm@vram-d3cold-threshold.html>
>         (Intel XE#579
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/579>)
>  *
>
>     igt@xe_pm_residency@toggle-gt-c6:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-lnl-1/igt@xe_pm_residency@toggle-gt-c6.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-lnl-2/igt@xe_pm_residency@toggle-gt-c6.html>
>         (Intel XE#958
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/958>)
>  *
>
>     igt@xe_query@multigpu-query-uc-fw-version-guc:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-lnl-2/igt@xe_query@multigpu-query-uc-fw-version-guc.html>
>         (Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) +1
>         other test skip
>  *
>
>     igt@xe_query@multigpu-query-uc-fw-version-huc:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-8/igt@xe_query@multigpu-query-uc-fw-version-huc.html>
>         (Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>)
>
>
>         Possible fixes
>
>  *
>
>     igt@core_hotunplug@hotreplug-lateclose:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-1/igt@core_hotunplug@hotreplug-lateclose.html>
>         (Intel XE#1885
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-8/igt@core_hotunplug@hotreplug-lateclose.html>
>  *
>
>     igt@core_hotunplug@unplug-rescan:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-434/igt@core_hotunplug@unplug-rescan.html>
>         (Intel XE#1885
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-432/igt@core_hotunplug@unplug-rescan.html>
>         +1 other test pass
>  *
>
>     igt@core_setmaster_vs_auth:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-434/igt@core_setmaster_vs_auth.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-464/igt@core_setmaster_vs_auth.html>
>  *
>
>     igt@fbdev@unaligned-write:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-434/igt@fbdev@unaligned-write.html>
>         (Intel XE#2134
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-464/igt@fbdev@unaligned-write.html>
>  *
>
>     igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-434/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-433/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html>
>         +89 other tests pass
>  *
>
>     igt@kms_big_fb@x-tiled-8bpp-rotate-0:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-1/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html>
>         (Intel XE#2231
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231> /
>         Intel XE#2890
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-6/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html>
>         +5 other tests pass
>  *
>
>     igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-lnl-7/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html>
>         (Intel XE#1874
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-lnl-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html>
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:
>
>       o shard-dg2-set2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html>
>         (Intel XE#1195
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html>
>  *
>
>     igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
>
>       o shard-bmg: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html>
>         (Intel XE#877
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/877>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html>
>         +2 other tests pass
>  *
>
>     igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-lnl-6/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions.html>
>         (Intel XE#1541
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1541>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-lnl-6/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions.html>
>  *
>
>     igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:
>
>       o shard-bmg: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html>
>         (Intel XE#301
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html>
>         +4 other tests pass
>  *
>
>     igt@kms_flip@blocking-wf_vblank:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-lnl-6/igt@kms_flip@blocking-wf_vblank.html>
>         (Intel XE#3149
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149> /
>         Intel XE#886
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/886>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-lnl-6/igt@kms_flip@blocking-wf_vblank.html>
>  *
>
>     igt@kms_flip@blocking-wf_vblank@c-edp1:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-lnl-6/igt@kms_flip@blocking-wf_vblank@c-edp1.html>
>         (Intel XE#886
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/886>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-lnl-6/igt@kms_flip@blocking-wf_vblank@c-edp1.html>
>         +1 other test pass
>  *
>
>     igt@kms_flip@flip-vs-suspend-interruptible:
>
>       o shard-dg2-set2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible.html>
>         (Intel XE#1195
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195> /
>         Intel XE#2049
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049> /
>         Intel XE#2597
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-463/igt@kms_flip@flip-vs-suspend-interruptible.html>
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html>
>         (Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351> /
>         Intel XE#2890
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html>
>         +14 other tests pass
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html>
>         (Intel XE#2890
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html>
>         +28 other tests pass
>  *
>
>     igt@kms_plane@pixel-format-source-clamping:
>
>       o shard-bmg: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-7/igt@kms_plane@pixel-format-source-clamping.html>
>         (Intel XE#2566
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566> /
>         Intel XE#877
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/877>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-3/igt@kms_plane@pixel-format-source-clamping.html>
>  *
>
>     igt@kms_plane@pixel-format@pipe-b-plane-0:
>
>       o shard-bmg: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-4/igt@kms_plane@pixel-format@pipe-b-plane-0.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-2/igt@kms_plane@pixel-format@pipe-b-plane-0.html>
>         +1 other test pass
>  *
>
>     igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-1/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html>
>         (Intel XE#3007
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-4/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html>
>         +10 other tests pass
>  *
>
>     igt@kms_pm_dc@dc5-psr:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-lnl-7/igt@kms_pm_dc@dc5-psr.html>
>         (Intel XE#718
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/718>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-lnl-1/igt@kms_pm_dc@dc5-psr.html>
>  *
>
>     igt@kms_pm_rpm@legacy-planes-dpms@plane-41:
>
>       o shard-lnl: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-lnl-5/igt@kms_pm_rpm@legacy-planes-dpms@plane-41.html>
>         (Intel XE#3184
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-lnl-5/igt@kms_pm_rpm@legacy-planes-dpms@plane-41.html>
>         +2 other tests pass
>  *
>
>     igt@kms_pm_rpm@system-suspend-modeset:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-434/igt@kms_pm_rpm@system-suspend-modeset.html>
>         (Intel XE#2446
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-463/igt@kms_pm_rpm@system-suspend-modeset.html>
>         +5 other tests pass
>  *
>
>     igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html>
>         (Intel XE#899
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/899>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html>
>  *
>
>     igt@xe_evict@evict-beng-mixed-many-threads-small:
>
>       o shard-bmg: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-8/igt@xe_evict@evict-beng-mixed-many-threads-small.html>
>         (Intel XE#1473
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-7/igt@xe_evict@evict-beng-mixed-many-threads-small.html>
>  *
>
>     igt@xe_exec_compute_mode@twice-bindexecqueue-rebind:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-1/igt@xe_exec_compute_mode@twice-bindexecqueue-rebind.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-8/igt@xe_exec_compute_mode@twice-bindexecqueue-rebind.html>
>         +27 other tests pass
>  *
>
>     igt@xe_exec_fault_mode@many-userptr-invalidate-race-imm:
>
>       o shard-bmg: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-7/igt@xe_exec_fault_mode@many-userptr-invalidate-race-imm.html>
>         (Intel XE#1630
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1630>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-2/igt@xe_exec_fault_mode@many-userptr-invalidate-race-imm.html>
>  *
>
>     igt@xe_exec_reset@virtual-close-fd:
>
>       o shard-bmg: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-7/igt@xe_exec_reset@virtual-close-fd.html>
>         (Intel XE#1081
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-7/igt@xe_exec_reset@virtual-close-fd.html>
>  *
>
>     igt@xe_exec_threads@threads-shared-vm-userptr-invalidate-race:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-434/igt@xe_exec_threads@threads-shared-vm-userptr-invalidate-race.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-464/igt@xe_exec_threads@threads-shared-vm-userptr-invalidate-race.html>
>         +147 other tests pass
>  *
>
>     igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-434/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html>
>         (Intel XE#2229
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-464/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html>
>         +1 other test pass
>  *
>
>     igt@xe_module_load@reload-no-display:
>
>       o shard-lnl: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-lnl-5/igt@xe_module_load@reload-no-display.html>
>         (Intel XE#2910
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2910>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-lnl-4/igt@xe_module_load@reload-no-display.html>
>  *
>
>     igt@xe_oa@non-zero-reason:
>
>       o shard-lnl: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-lnl-7/igt@xe_oa@non-zero-reason.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-lnl-6/igt@xe_oa@non-zero-reason.html>
>  *
>
>     igt@xe_pm@s4-exec-after:
>
>       o shard-lnl: ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-lnl-2/igt@xe_pm@s4-exec-after.html>
>         (Intel XE#1358
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358> /
>         Intel XE#1607
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-lnl-5/igt@xe_pm@s4-exec-after.html>
>  *
>
>     igt@xe_pm@s4-vm-bind-unbind-all:
>
>       o shard-lnl: ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html>
>         (Intel XE#1794
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-lnl-4/igt@xe_pm@s4-vm-bind-unbind-all.html>
>
>
>         Warnings
>
>  *
>
>     igt@kms_big_fb@4-tiled-64bpp-rotate-90:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-434/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html>
>         (Intel XE#2890
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-466/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html>
>         (Intel XE#316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>) +1
>         other test skip
>  *
>
>     igt@kms_big_fb@x-tiled-64bpp-rotate-90:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-435/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html>
>         (Intel XE#316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-434/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html>
>         (Intel XE#2890
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) +3
>         other tests skip
>  *
>
>     igt@kms_big_fb@y-tiled-64bpp-rotate-90:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-434/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html>
>         (Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351> /
>         Intel XE#2890
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-433/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +1
>         other test skip
>  *
>
>     igt@kms_big_fb@y-tiled-addfb:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-5/igt@kms_big_fb@y-tiled-addfb.html>
>         (Intel XE#2328
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-5/igt@kms_big_fb@y-tiled-addfb.html>
>         (Intel XE#2231
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231> /
>         Intel XE#2890
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>)
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb.html>
>         (Intel XE#619
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/619>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-464/igt@kms_big_fb@y-tiled-addfb.html>
>         (Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351> /
>         Intel XE#2890
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>)
>  *
>
>     igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html>
>         (Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351> /
>         Intel XE#2890
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-463/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html>
>         (Intel XE#607
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/607>)
>  *
>
>     igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html>
>         (Intel XE#2231
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231> /
>         Intel XE#2890
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>)
>  *
>
>     igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-463/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html>
>         (Intel XE#2890
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) +4
>         other tests skip
>  *
>
>     igt@kms_big_fb@yf-tiled-16bpp-rotate-0:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-434/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html>
>         (Intel XE#2890
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-466/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +6
>         other tests skip
>  *
>
>     igt@kms_big_fb@yf-tiled-addfb:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb.html>
>         (Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351> /
>         Intel XE#2890
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-463/igt@kms_big_fb@yf-tiled-addfb.html>
>         (Intel XE#619
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/619>)
>  *
>
>     igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html>
>         (Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351> /
>         Intel XE#2890
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) +4
>         other tests skip
>  *
>
>     igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html>
>         (Intel XE#2231
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231> /
>         Intel XE#2890
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>)
>  *
>
>     igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html>
>         (Intel XE#367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-434/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         +5 other tests skip
>  *
>
>     igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-434/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-463/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html>
>         (Intel XE#2191
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191>) +1
>         other test skip
>  *
>
>     igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-435/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html>
>         (Intel XE#2191
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         +1 other test skip
>  *
>
>     igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-1/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html>
>         (Intel XE#2314
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314> /
>         Intel XE#2894
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-5/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html>
>         (Intel XE#3007
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007>)
>  *
>
>     igt@kms_bw@linear-tiling-4-displays-2560x1440p:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-434/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-435/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html>
>         (Intel XE#367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) +4
>         other tests skip
>  *
>
>     igt@kms_bw@linear-tiling-4-displays-3840x2160p:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-7/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html>
>         (Intel XE#367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-5/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html>
>         (Intel XE#3007
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007>)
>  *
>
>     igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-432/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-434/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html>
>         (Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351> /
>         Intel XE#2890
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) +3
>         other tests skip
>  *
>
>     igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-434/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html>
>         (Intel XE#2890
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-463/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +8
>         other tests skip
>  *
>
>     igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-434/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html>
>         (Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351> /
>         Intel XE#2890
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-463/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +2
>         other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html>
>         (Intel XE#2907
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html>
>         (Intel XE#2890
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>)
>  *
>
>     igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-1/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs.html>
>         (Intel XE#2231
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231> /
>         Intel XE#2890
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-8/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs.html>
>         (Intel XE#2887
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) +2
>         other tests skip
>  *
>
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html>
>         (Intel XE#2890
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html>
>         (Intel XE#2907
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907>) +2
>         other tests skip
>  *
>
>     igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-8/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs.html>
>         (Intel XE#2887
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-5/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs.html>
>         (Intel XE#2231
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231> /
>         Intel XE#2890
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) +2
>         other tests skip
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html>
>         (Intel XE#2890
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) ->
>         INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html>
>         (Intel XE#1727
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727>)
>  *
>
>     igt@kms_ccs@random-ccs-data-y-tiled-ccs:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-463/igt@kms_ccs@random-ccs-data-y-tiled-ccs.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-464/igt@kms_ccs@random-ccs-data-y-tiled-ccs.html>
>         (Intel XE#2890
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>)
>         +10 other tests skip
>  *
>
>     igt@kms_cdclk@mode-transition-all-outputs:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-434/igt@kms_cdclk@mode-transition-all-outputs.html>
>         (Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351> /
>         Intel XE#2890
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-433/igt@kms_cdclk@mode-transition-all-outputs.html>
>         (Intel XE#314
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/314>)
>  *
>
>     igt@kms_chamelium_color@ctm-red-to-blue:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-466/igt@kms_chamelium_color@ctm-red-to-blue.html>
>         (Intel XE#306
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-434/igt@kms_chamelium_color@ctm-red-to-blue.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         +1 other test skip
>  *
>
>     igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-434/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-435/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html>
>         (Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +7
>         other tests skip
>  *
>
>     igt@kms_chamelium_hpd@common-hpd-after-suspend:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-435/igt@kms_chamelium_hpd@common-hpd-after-suspend.html>
>         (Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-434/igt@kms_chamelium_hpd@common-hpd-after-suspend.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         +6 other tests skip
>  *
>
>     igt@kms_chamelium_hpd@dp-hpd-after-suspend:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-6/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html>
>         (Intel XE#2252
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-5/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html>
>         (Intel XE#3007
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007>)
>  *
>
>     igt@kms_chamelium_hpd@dp-hpd-storm:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-1/igt@kms_chamelium_hpd@dp-hpd-storm.html>
>         (Intel XE#3007
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-2/igt@kms_chamelium_hpd@dp-hpd-storm.html>
>         (Intel XE#2252
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252>)
>  *
>
>     igt@kms_content_protection@dp-mst-type-0:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-434/igt@kms_content_protection@dp-mst-type-0.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-435/igt@kms_content_protection@dp-mst-type-0.html>
>         (Intel XE#307
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/307>)
>  *
>
>     igt@kms_content_protection@uevent:
>
>       o shard-dg2-set2: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-466/igt@kms_content_protection@uevent.html>
>         (Intel XE#1188
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-434/igt@kms_content_protection@uevent.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>  *
>
>     igt@kms_cursor_crc@cursor-offscreen-128x42:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-2/igt@kms_cursor_crc@cursor-offscreen-128x42.html>
>         (Intel XE#2320
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-128x42.html>
>         (Intel XE#3007
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007>) +1
>         other test skip
>  *
>
>     igt@kms_cursor_crc@cursor-offscreen-512x170:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-463/igt@kms_cursor_crc@cursor-offscreen-512x170.html>
>         (Intel XE#308
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/308>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-434/igt@kms_cursor_crc@cursor-offscreen-512x170.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         +2 other tests skip
>  *
>
>     igt@kms_cursor_crc@cursor-onscreen-512x512:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-466/igt@kms_cursor_crc@cursor-onscreen-512x512.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-463/igt@kms_cursor_crc@cursor-onscreen-512x512.html>
>         (Intel XE#308
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/308>)
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-1/igt@kms_cursor_crc@cursor-onscreen-512x512.html>
>         (Intel XE#3007
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-512x512.html>
>         (Intel XE#2321
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321>)
>  *
>
>     igt@kms_cursor_crc@cursor-random-32x10:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-434/igt@kms_cursor_crc@cursor-random-32x10.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-435/igt@kms_cursor_crc@cursor-random-32x10.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +4
>         other tests skip
>  *
>
>     igt@kms_cursor_crc@cursor-rapid-movement-128x42:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-1/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html>
>         (Intel XE#3007
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-5/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html>
>         (Intel XE#2320
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320>)
>  *
>
>     igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-466/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-466/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html>
>         (Intel XE#323
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/323>) +2
>         other tests skip
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html>
>         (Intel XE#3007
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html>
>         (Intel XE#2286
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286>)
>  *
>
>     igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html>
>         (Intel XE#3007
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007>) ->
>         DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html>
>         (Intel XE#877
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/877>)
>  *
>
>     igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-1/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html>
>         (Intel XE#2231
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231> /
>         Intel XE#2890
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-6/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html>
>         (Intel XE#1508
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508>)
>  *
>
>     igt@kms_dsc@dsc-basic:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-435/igt@kms_dsc@dsc-basic.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-434/igt@kms_dsc@dsc-basic.html>
>         (Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351>)
>  *
>
>     igt@kms_dsc@dsc-fractional-bpp:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-1/igt@kms_dsc@dsc-fractional-bpp.html>
>         (Intel XE#2231
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231> /
>         Intel XE#2890
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-5/igt@kms_dsc@dsc-fractional-bpp.html>
>         (Intel XE#2244
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244>)
>  *
>
>     igt@kms_dsc@dsc-with-bpc:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-435/igt@kms_dsc@dsc-with-bpc.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-434/igt@kms_dsc@dsc-with-bpc.html>
>         (Intel XE#2890
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) +2
>         other tests skip
>  *
>
>     igt@kms_dsc@dsc-with-bpc-formats:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-464/igt@kms_dsc@dsc-with-bpc-formats.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-434/igt@kms_dsc@dsc-with-bpc-formats.html>
>         (Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351> /
>         Intel XE#2890
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>)
>  *
>
>     igt@kms_fbcon_fbt@psr-suspend:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-433/igt@kms_fbcon_fbt@psr-suspend.html>
>         (Intel XE#776
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/776>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-434/igt@kms_fbcon_fbt@psr-suspend.html>
>         (Intel XE#2890
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>)
>  *
>
>     igt@kms_feature_discovery@display-3x:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-434/igt@kms_feature_discovery@display-3x.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-466/igt@kms_feature_discovery@display-3x.html>
>         (Intel XE#703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/703>)
>  *
>
>     igt@kms_feature_discovery@display-4x:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-434/igt@kms_feature_discovery@display-4x.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-463/igt@kms_feature_discovery@display-4x.html>
>         (Intel XE#1138
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138>)
>  *
>
>     igt@kms_feature_discovery@psr1:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-8/igt@kms_feature_discovery@psr1.html>
>         (Intel XE#2374
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-5/igt@kms_feature_discovery@psr1.html>
>         (Intel XE#3007
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007>)
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-463/igt@kms_feature_discovery@psr1.html>
>         (Intel XE#1135
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-464/igt@kms_feature_discovery@psr1.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>  *
>
>     igt@kms_flip@flip-vs-expired-vblank-interruptible:
>
>       o shard-dg2-set2: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank-interruptible.html>
>         (Intel XE#301
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank-interruptible.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>  *
>
>     igt@kms_flip@flip-vs-suspend:
>
>       o shard-dg2-set2: ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-432/igt@kms_flip@flip-vs-suspend.html>
>         (Intel XE#2625
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-434/igt@kms_flip@flip-vs-suspend.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html>
>         (Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351> /
>         Intel XE#2890
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +1
>         other test skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html>
>         (Intel XE#2890
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +3
>         other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html>
>         (Intel XE#2293
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293> /
>         Intel XE#2380
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html>
>         (Intel XE#2231
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231> /
>         Intel XE#2890
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>)
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html>
>         (Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html>
>         (Intel XE#2890
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>)
>         +25 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt.html>
>         (Intel XE#2231
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231> /
>         Intel XE#2890
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt.html>
>         (Intel XE#2311
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311>) +5
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html>
>         (Intel XE#2890
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html>
>         (Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +24
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html>
>         (Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351> /
>         Intel XE#2890
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html>
>         (Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +7
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-suspend:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-suspend.html>
>         (Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-suspend.html>
>         (Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351> /
>         Intel XE#2890
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>)
>         +10 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move:
>
>       o shard-bmg: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html>
>         (Intel XE#2333
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html>
>         (Intel XE#2231
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231> /
>         Intel XE#2890
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) +1
>         other test skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html>
>         (Intel XE#2231
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231> /
>         Intel XE#2890
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) ->
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html>
>         (Intel XE#2333
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333>) +1
>         other test fail
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move.html>
>         (Intel XE#2311
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move.html>
>         (Intel XE#2231
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231> /
>         Intel XE#2890
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) +6
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html>
>         (Intel XE#2313
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html>
>         (Intel XE#2231
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231> /
>         Intel XE#2890
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) +6
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html>
>         (Intel XE#2890
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html>
>         (Intel XE#653
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +24
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html>
>         (Intel XE#2231
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231> /
>         Intel XE#2890
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html>
>         (Intel XE#2313
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313>) +4
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html>
>         (Intel XE#658
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/658>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html>
>         (Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351> /
>         Intel XE#2890
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>)
>  *
>
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html>
>         (Intel XE#653
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html>
>         (Intel XE#2890
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>)
>         +26 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render.html>
>         (Intel XE#653
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render.html>
>         (Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351> /
>         Intel XE#2890
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) +7
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html>
>         (Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351> /
>         Intel XE#2890
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html>
>         (Intel XE#653
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +8
>         other tests skip
>  *
>
>     igt@kms_hdr@brightness-with-hdr:
>
>       o shard-dg2-set2: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-463/igt@kms_hdr@brightness-with-hdr.html>
>         (Intel XE#3312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3312>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-434/igt@kms_hdr@brightness-with-hdr.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>  *
>
>     igt@kms_joiner@invalid-modeset-big-joiner:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-433/igt@kms_joiner@invalid-modeset-big-joiner.html>
>         (Intel XE#346
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/346>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-434/igt@kms_joiner@invalid-modeset-big-joiner.html>
>         (Intel XE#2890
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>)
>  *
>
>     igt@kms_joiner@invalid-modeset-force-ultra-joiner:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-434/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html>
>         (Intel XE#2890
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-433/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html>
>         (Intel XE#2925
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925>)
>  *
>
>     igt@kms_joiner@invalid-modeset-ultra-joiner:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-434/igt@kms_joiner@invalid-modeset-ultra-joiner.html>
>         (Intel XE#2890
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-466/igt@kms_joiner@invalid-modeset-ultra-joiner.html>
>         (Intel XE#2927
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927>)
>  *
>
>     igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-5/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html>
>         (Intel XE#2501
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2501>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-5/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html>
>         (Intel XE#3007
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007>)
>  *
>
>     igt@kms_plane_multiple@tiling-yf:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-7/igt@kms_plane_multiple@tiling-yf.html>
>         (Intel XE#2493
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-5/igt@kms_plane_multiple@tiling-yf.html>
>         (Intel XE#3007
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007>)
>  *
>
>     igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html>
>         (Intel XE#2763
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-464/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         +1 other test skip
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-5/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html>
>         (Intel XE#2763
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-5/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html>
>         (Intel XE#3007
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007>)
>  *
>
>     igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-464/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20.html>
>         (Intel XE#2763
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>)
>  *
>
>     igt@kms_pm_backlight@brightness-with-dpms:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-464/igt@kms_pm_backlight@brightness-with-dpms.html>
>         (Intel XE#2938
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-434/igt@kms_pm_backlight@brightness-with-dpms.html>
>         (Intel XE#2890
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>)
>  *
>
>     igt@kms_pm_dc@dc5-psr:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-432/igt@kms_pm_dc@dc5-psr.html>
>         (Intel XE#1129
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-434/igt@kms_pm_dc@dc5-psr.html>
>         (Intel XE#2890
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>)
>  *
>
>     igt@kms_pm_dc@dc6-psr:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-6/igt@kms_pm_dc@dc6-psr.html>
>         (Intel XE#2392
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-5/igt@kms_pm_dc@dc6-psr.html>
>         (Intel XE#2231
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231> /
>         Intel XE#2890
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>)
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-464/igt@kms_pm_dc@dc6-psr.html>
>         (Intel XE#1129
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-464/igt@kms_pm_dc@dc6-psr.html>
>         (Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351> /
>         Intel XE#2890
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>)
>  *
>
>     igt@kms_pm_dc@deep-pkgc:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-432/igt@kms_pm_dc@deep-pkgc.html>
>         (Intel XE#908
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/908>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-434/igt@kms_pm_dc@deep-pkgc.html>
>         (Intel XE#2890
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>)
>  *
>
>     igt@kms_pm_rpm@modeset-lpsp-stress:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-1/igt@kms_pm_rpm@modeset-lpsp-stress.html>
>         (Intel XE#2446
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-4/igt@kms_pm_rpm@modeset-lpsp-stress.html>
>         (Intel XE#1439
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439> /
>         Intel XE#3141
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141>)
>  *
>
>     igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-1/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html>
>         (Intel XE#2231
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231> /
>         Intel XE#2890
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-4/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html>
>         (Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>)
>  *
>
>     igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-434/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html>
>         (Intel XE#2890
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-433/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html>
>         (Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +7
>         other tests skip
>  *
>
>     igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-432/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html>
>         (Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-434/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html>
>         (Intel XE#2890
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) +6
>         other tests skip
>  *
>
>     igt@kms_psr2_su@page_flip-nv12:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-434/igt@kms_psr2_su@page_flip-nv12.html>
>         (Intel XE#2890
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-464/igt@kms_psr2_su@page_flip-nv12.html>
>         (Intel XE#1122
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122>)
>  *
>
>     igt@kms_psr2_su@page_flip-xrgb8888:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-433/igt@kms_psr2_su@page_flip-xrgb8888.html>
>         (Intel XE#1122
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-434/igt@kms_psr2_su@page_flip-xrgb8888.html>
>         (Intel XE#2890
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>)
>  *
>
>     igt@kms_psr@fbc-psr-no-drrs:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-466/igt@kms_psr@fbc-psr-no-drrs.html>
>         (Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351> /
>         Intel XE#2890
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-433/igt@kms_psr@fbc-psr-no-drrs.html>
>         (Intel XE#2850
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850> /
>         Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +5
>         other tests skip
>  *
>
>     igt@kms_psr@fbc-psr2-cursor-render:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-2/igt@kms_psr@fbc-psr2-cursor-render.html>
>         (Intel XE#2234
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234> /
>         Intel XE#2850
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-5/igt@kms_psr@fbc-psr2-cursor-render.html>
>         (Intel XE#2231
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231> /
>         Intel XE#2890
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) +1
>         other test skip
>  *
>
>     igt@kms_psr@fbc-psr2-no-drrs:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-463/igt@kms_psr@fbc-psr2-no-drrs.html>
>         (Intel XE#2850
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850> /
>         Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-434/igt@kms_psr@fbc-psr2-no-drrs.html>
>         (Intel XE#2890
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>)
>         +10 other tests skip
>  *
>
>     igt@kms_psr@fbc-psr2-sprite-plane-move:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-434/igt@kms_psr@fbc-psr2-sprite-plane-move.html>
>         (Intel XE#2890
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-433/igt@kms_psr@fbc-psr2-sprite-plane-move.html>
>         (Intel XE#2850
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850> /
>         Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +8
>         other tests skip
>  *
>
>     igt@kms_psr@psr-cursor-plane-move:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-433/igt@kms_psr@psr-cursor-plane-move.html>
>         (Intel XE#2850
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850> /
>         Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-434/igt@kms_psr@psr-cursor-plane-move.html>
>         (Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351>)
>  *
>
>     igt@kms_psr@psr-dpms:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-433/igt@kms_psr@psr-dpms.html>
>         (Intel XE#2850
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850> /
>         Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-434/igt@kms_psr@psr-dpms.html>
>         (Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351> /
>         Intel XE#2890
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) +4
>         other tests skip
>  *
>
>     igt@kms_psr@psr2-primary-page-flip:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-1/igt@kms_psr@psr2-primary-page-flip.html>
>         (Intel XE#2231
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231> /
>         Intel XE#2890
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-7/igt@kms_psr@psr2-primary-page-flip.html>
>         (Intel XE#2234
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234> /
>         Intel XE#2850
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850>) +2
>         other tests skip
>  *
>
>     igt@kms_rotation_crc@primary-rotation-90:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-433/igt@kms_rotation_crc@primary-rotation-90.html>
>         (Intel XE#327
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/327>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-434/igt@kms_rotation_crc@primary-rotation-90.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         +1 other test skip
>  *
>
>     igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html>
>         (Intel XE#2330
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html>
>         (Intel XE#3007
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007>)
>  *
>
>     igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html>
>         (Intel XE#327
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/327>) +1
>         other test skip
>  *
>
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-463/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html>
>         (Intel XE#1127
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127>)
>  *
>
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html>
>         (Intel XE#1127
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         +1 other test skip
>  *
>
>     igt@kms_tiled_display@basic-test-pattern:
>
>       o shard-dg2-set2: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern.html>
>         (Intel XE#1729
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern.html>
>         (Intel XE#362
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/362>)
>  *
>
>     igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html>
>         (Intel XE#2426
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html>
>         (Intel XE#2509
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509>)
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html>
>         (Intel XE#362
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/362>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html>
>         (Intel XE#1500
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500>)
>  *
>
>     igt@kms_vblank@ts-continuation-dpms-suspend:
>
>       o shard-dg2-set2: ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-432/igt@kms_vblank@ts-continuation-dpms-suspend.html>
>         (Intel XE#1034
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1034> /
>         Intel XE#2625
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-434/igt@kms_vblank@ts-continuation-dpms-suspend.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>  *
>
>     igt@kms_vrr@flip-dpms:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-6/igt@kms_vrr@flip-dpms.html>
>         (Intel XE#1499
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-5/igt@kms_vrr@flip-dpms.html>
>         (Intel XE#3007
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007>)
>  *
>
>     igt@kms_vrr@flipline:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-466/igt@kms_vrr@flipline.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-434/igt@kms_vrr@flipline.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         +8 other tests skip
>  *
>
>     igt@kms_writeback@writeback-check-output-xrgb2101010:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-463/igt@kms_writeback@writeback-check-output-xrgb2101010.html>
>         (Intel XE#756
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/756>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-434/igt@kms_writeback@writeback-check-output-xrgb2101010.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>  *
>
>     igt@kms_writeback@writeback-fb-id:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-434/igt@kms_writeback@writeback-fb-id.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-432/igt@kms_writeback@writeback-fb-id.html>
>         (Intel XE#756
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/756>) +1
>         other test skip
>  *
>
>     igt@sriov_basic@enable-vfs-autoprobe-off:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-466/igt@sriov_basic@enable-vfs-autoprobe-off.html>
>         (Intel XE#1091
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091> /
>         Intel XE#2849
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-434/igt@sriov_basic@enable-vfs-autoprobe-off.html>
>         (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> /
>         i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>  *
>
>     igt@xe_compute_preempt@compute-preempt:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-463/igt@xe_compute_preempt@compute-preempt.html>
>         (Intel XE#1280
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-464/igt@xe_compute_preempt@compute-preempt.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>)
>  *
>
>     igt@xe_compute_preempt@compute-threadgroup-preempt:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-434/igt@xe_compute_preempt@compute-threadgroup-preempt.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-463/igt@xe_compute_preempt@compute-threadgroup-preempt.html>
>         (Intel XE#1280
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>)
>  *
>
>     igt@xe_create@multigpu-create-massive-size:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-6/igt@xe_create@multigpu-create-massive-size.html>
>         (Intel XE#2504
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-5/igt@xe_create@multigpu-create-massive-size.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>)
>  *
>
>     igt@xe_eudebug@basic-vm-access-parameters:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-435/igt@xe_eudebug@basic-vm-access-parameters.html>
>         (Intel XE#2905
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-434/igt@xe_eudebug@basic-vm-access-parameters.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>)
>         +13 other tests skip
>  *
>
>     igt@xe_eudebug@discovery-race:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-1/igt@xe_eudebug@discovery-race.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-2/igt@xe_eudebug@discovery-race.html>
>         (Intel XE#2905
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905>)
>  *
>
>     igt@xe_eudebug_online@resume-dss:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-434/igt@xe_eudebug_online@resume-dss.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-435/igt@xe_eudebug_online@resume-dss.html>
>         (Intel XE#2905
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905>)
>         +10 other tests skip
>  *
>
>     igt@xe_eudebug_online@resume-one:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-1/igt@xe_eudebug_online@resume-one.html>
>         (Intel XE#2905
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-5/igt@xe_eudebug_online@resume-one.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) +1
>         other test skip
>  *
>
>     igt@xe_evict@evict-beng-mixed-many-threads-large:
>
>       o shard-bmg: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-4/igt@xe_evict@evict-beng-mixed-many-threads-large.html>
>         (Intel XE#1473
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473>) ->
>         TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-3/igt@xe_evict@evict-beng-mixed-many-threads-large.html>
>         (Intel XE#1473
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473>)
>  *
>
>     igt@xe_exec_basic@multigpu-no-exec-userptr-rebind:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-4/igt@xe_exec_basic@multigpu-no-exec-userptr-rebind.html>
>         (Intel XE#2322
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-5/igt@xe_exec_basic@multigpu-no-exec-userptr-rebind.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) +2
>         other tests skip
>  *
>
>     igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-prefetch:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-1/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-prefetch.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) ->
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-8/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-prefetch.html>
>         (Intel XE#1630
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1630>)
>  *
>
>     igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-463/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html>
>         (Intel XE#288
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-434/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>)
>         +29 other tests skip
>  *
>
>     igt@xe_exec_fault_mode@twice-userptr-prefetch:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-prefetch.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-433/igt@xe_exec_fault_mode@twice-userptr-prefetch.html>
>         (Intel XE#288
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +23
>         other tests skip
>  *
>
>     igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-434/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-464/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html>
>         (Intel XE#2360
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360>)
>  *
>
>     igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-463/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html>
>         (Intel XE#2360
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-434/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) +1
>         other test skip
>  *
>
>     igt@xe_mmap@small-bar:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-463/igt@xe_mmap@small-bar.html>
>         (Intel XE#512
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/512>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-434/igt@xe_mmap@small-bar.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>)
>  *
>
>     igt@xe_oa@polling-small-buf:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-434/igt@xe_oa@polling-small-buf.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-433/igt@xe_oa@polling-small-buf.html>
>         (Intel XE#2541
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541>) +6
>         other tests skip
>  *
>
>     igt@xe_oa@whitelisted-registers-userspace-config:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-432/igt@xe_oa@whitelisted-registers-userspace-config.html>
>         (Intel XE#2541
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-434/igt@xe_oa@whitelisted-registers-userspace-config.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) +6
>         other tests skip
>  *
>
>     igt@xe_pat@pat-index-xelpg:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-463/igt@xe_pat@pat-index-xelpg.html>
>         (Intel XE#979
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/979>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-434/igt@xe_pat@pat-index-xelpg.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>)
>  *
>
>     igt@xe_peer2peer@read:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-434/igt@xe_peer2peer@read.html>
>         (Intel XE#1061
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061>) ->
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-433/igt@xe_peer2peer@read.html>
>         (Intel XE#1173
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173>) +1
>         other test fail
>  *
>
>     igt@xe_pm@d3cold-mmap-system:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-464/igt@xe_pm@d3cold-mmap-system.html>
>         (Intel XE#2284
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284> /
>         Intel XE#366
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/366>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-434/igt@xe_pm@d3cold-mmap-system.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>)
>  *
>
>     igt@xe_pm@s2idle-d3cold-basic-exec:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-434/igt@xe_pm@s2idle-d3cold-basic-exec.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-464/igt@xe_pm@s2idle-d3cold-basic-exec.html>
>         (Intel XE#2284
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284> /
>         Intel XE#366
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/366>) +1
>         other test skip
>  *
>
>     igt@xe_pm@s4-d3hot-basic-exec:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-434/igt@xe_pm@s4-d3hot-basic-exec.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) ->
>         ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-432/igt@xe_pm@s4-d3hot-basic-exec.html>
>         (Intel XE#1358
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358>)
>  *
>
>     igt@xe_query@multigpu-query-engines:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-432/igt@xe_query@multigpu-query-engines.html>
>         (Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-464/igt@xe_query@multigpu-query-engines.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) +4
>         other tests skip
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-5/igt@xe_query@multigpu-query-engines.html>
>         (Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-5/igt@xe_query@multigpu-query-engines.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>)
>  *
>
>     igt@xe_query@multigpu-query-topology:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-434/igt@xe_query@multigpu-query-topology.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-433/igt@xe_query@multigpu-query-topology.html>
>         (Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) +2
>         other tests skip
>  *
>
>     igt@xe_sriov_flr@flr-each-isolation:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-463/igt@xe_sriov_flr@flr-each-isolation.html>
>         (Intel XE#3342
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-434/igt@xe_sriov_flr@flr-each-isolation.html>
>         (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>)
>
these are unrelated to my patch,

Thanks,

Jagmeet

>
>     Build changes
>
>   * IGT: IGT_8098 -> IGTPW_12042
>   * Linux: xe-2168-b925cb281e79b763990ed64267ef82a87ace5060 ->
>     xe-2169-1051f5a468c5531923b01ba67999e502ce47a6b0
>
> IGTPW_12042: c90b9d96eeaa62f09596c5f4e5c759633bbaebcc @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> IGT_8098: 8098
> xe-2168-b925cb281e79b763990ed64267ef82a87ace5060: 
> b925cb281e79b763990ed64267ef82a87ace5060
> xe-2169-1051f5a468c5531923b01ba67999e502ce47a6b0: 
> 1051f5a468c5531923b01ba67999e502ce47a6b0
>
--------------Rei4KCxEBcjx00l0CR0H6hBl
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi igt-dev,<br>
    </p>
    <div class="moz-cite-prefix">On 11/6/2024 5:53 PM, Patchwork wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:173094442551.1419712.788151085923243885@2413ebb6fbb6">
      
      <title>Project List - Patchwork</title>
      <style id="css-table-select" type="text/css">td { padding: 2pt; }</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>tests/intel/xe_vm: Reduce n_execs for bind-array-enobufs</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a href="https://patchwork.freedesktop.org/series/140965/" moz-do-not-send="true" class="moz-txt-link-freetext">https://patchwork.freedesktop.org/series/140965/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/index.html" moz-do-not-send="true" class="moz-txt-link-freetext">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from XEIGT_8098_full -&gt;
        XEIGTPW_12042_full</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with XEIGTPW_12042_full
        absolutely need to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in XEIGTPW_12042_full, please notify your bug team
        (<a class="moz-txt-link-abbreviated" href="mailto:I915-ci-infra@lists.freedesktop.org">I915-ci-infra@lists.freedesktop.org</a>) to allow them<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <h2>Participating hosts (4 -&gt; 4)</h2>
      <p>No changes in participating hosts</p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        XEIGTPW_12042_full:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>
          <p>igt@core_getversion@basic:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-433/igt@core_getversion@basic.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-434/igt@core_getversion@basic.html" moz-do-not-send="true">FAIL</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html" moz-do-not-send="true">INCOMPLETE</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@plain-flip-fb-recreate@a-dp4:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-463/igt@kms_flip@plain-flip-fb-recreate@a-dp4.html" moz-do-not-send="true">FAIL</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr2-cursor-render@edp-1:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-lnl-3/igt@kms_psr@psr2-cursor-render@edp-1.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-lnl-2/igt@kms_psr@psr2-cursor-render@edp-1.html" moz-do-not-send="true">FAIL</a> +1 other test fail</li>
          </ul>
        </li>
      </ul>
      <h4>Warnings</h4>
      <ul>
        <li>igt@xe_exec_compute_mode@many-execqueues-userptr-rebind:
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-434/igt@xe_exec_compute_mode@many-execqueues-userptr-rebind.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-463/igt@xe_exec_compute_mode@many-execqueues-userptr-rebind.html" moz-do-not-send="true">FAIL</a></li>
          </ul>
        </li>
      </ul>
      <h2>New tests</h2>
      <p>New tests have been introduced between XEIGT_8098_full and
        XEIGTPW_12042_full:</p>
      <h3>New IGT tests (2)</h3>
      <ul>
        <li>
          <p>igt@kms_flip@wf_vblank-ts-check@d-dp5:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [4.36] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_lease@atomic-implicit-crtc@pipe-d-dp-5:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.00] s</li>
          </ul>
        </li>
      </ul>
      <h2>Known issues</h2>
      <p>Here are the changes found in XEIGTPW_12042_full that come from
        known issues:</p>
      <h3>IGT changes</h3>
      <h4>Issues hit</h4>
      <ul>
        <li>
          <p>igt@core_setmaster@master-drop-set-user:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-464/igt@core_setmaster@master-drop-set-user.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-434/igt@core_setmaster@master-drop-set-user.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3339" moz-do-not-send="true">Intel XE#3339</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@fbdev@info:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-432/igt@fbdev@info.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-434/igt@fbdev@info.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134" moz-do-not-send="true">Intel XE#2134</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@fbdev@write:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-434/igt@fbdev@write.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134" moz-do-not-send="true">Intel XE#2134</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@intel_hwmon@hwmon-read:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-lnl-6/igt@intel_hwmon@hwmon-read.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125" moz-do-not-send="true">Intel XE#1125</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_3d:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-432/igt@kms_3d.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-434/igt@kms_3d.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@alternate-sync-async-flip:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/827" moz-do-not-send="true">Intel XE#827</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-435/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2550" moz-do-not-send="true">Intel XE#2550</a>) +23 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_atomic_transition@plane-toggle-modeset-transition:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-5/igt@kms_atomic_transition@plane-toggle-modeset-transition.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-3/igt@kms_atomic_transition@plane-toggle-modeset-transition.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426" moz-do-not-send="true">Intel XE#1426</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231" moz-do-not-send="true">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890" moz-do-not-send="true">Intel XE#2890</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-2/igt@kms_big_fb@linear-32bpp-rotate-270.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327" moz-do-not-send="true">Intel XE#2327</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-lnl-5/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407" moz-do-not-send="true">Intel XE#1407</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@x-tiled-8bpp-rotate-0:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-lnl-1/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-lnl-5/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2929" moz-do-not-send="true">Intel XE#2929</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124" moz-do-not-send="true">Intel XE#1124</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-7/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124" moz-do-not-send="true">Intel XE#1124</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-lnl-8/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124" moz-do-not-send="true">Intel XE#1124</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-435/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367" moz-do-not-send="true">Intel XE#367</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-lnl-6/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512" moz-do-not-send="true">Intel XE#1512</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@linear-tiling-1-displays-2560x1440p:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-2/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367" moz-do-not-send="true">Intel XE#367</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@linear-tiling-3-displays-2560x1440p:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-lnl-2/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367" moz-do-not-send="true">Intel XE#367</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-basic-y-tiled-ccs:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-lnl-4/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887" moz-do-not-send="true">Intel XE#2887</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787" moz-do-not-send="true">Intel XE#787</a>) +128 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-4/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887" moz-do-not-send="true">Intel XE#2887</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-5:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-5.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195" moz-do-not-send="true">Intel XE#1195</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113" moz-do-not-send="true">Intel XE#3113</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-d-dp-5:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-466/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-d-dp-5.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send="true">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787" moz-do-not-send="true">Intel XE#787</a>) +25 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cdclk@mode-transition@pipe-d-dp-4:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-463/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314" moz-do-not-send="true">Intel XE#314</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cdclk@plane-scaling:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-lnl-7/igt@kms_cdclk@plane-scaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152" moz-do-not-send="true">Intel XE#1152</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_audio@hdmi-audio-edid:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-6/igt@kms_chamelium_audio@hdmi-audio-edid.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252" moz-do-not-send="true">Intel XE#2252</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_frames@dp-crc-single:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-lnl-1/igt@kms_chamelium_frames@dp-crc-single.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373" moz-do-not-send="true">Intel XE#373</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373" moz-do-not-send="true">Intel XE#373</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_color@ctm-blue-to-red:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-2/igt@kms_color@ctm-blue-to-red.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-5/igt@kms_color@ctm-blue-to-red.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007" moz-do-not-send="true">Intel XE#3007</a>) +9 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@content-type-change:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-8/igt@kms_content_protection@content-type-change.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341" moz-do-not-send="true">Intel XE#2341</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-4/igt@kms_content_protection@dp-mst-lic-type-1.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390" moz-do-not-send="true">Intel XE#2390</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@srm@pipe-a-dp-4:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-463/igt@kms_content_protection@srm@pipe-a-dp-4.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178" moz-do-not-send="true">Intel XE#1178</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@type1:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-lnl-1/igt@kms_content_protection@type1.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278" moz-do-not-send="true">Intel XE#3278</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-onscreen-256x85:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-lnl-7/igt@kms_cursor_crc@cursor-onscreen-256x85.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424" moz-do-not-send="true">Intel XE#1424</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-onscreen-32x32:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-6/igt@kms_cursor_crc@cursor-onscreen-32x32.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320" moz-do-not-send="true">Intel XE#2320</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-rapid-movement-64x64:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-5/igt@kms_cursor_crc@cursor-rapid-movement-64x64.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007" moz-do-not-send="true">Intel XE#3007</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-sliding-64x64:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-463/igt@kms_cursor_crc@cursor-sliding-64x64.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-434/igt@kms_cursor_crc@cursor-sliding-64x64.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575" moz-do-not-send="true">i915#2575</a>) +95 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-lnl-3/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309" moz-do-not-send="true">Intel XE#309</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-lnl-3/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-lnl-5/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1541" moz-do-not-send="true">Intel XE#1541</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dsc@dsc-with-output-formats:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-lnl-1/igt@kms_dsc@dsc-with-output-formats.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244" moz-do-not-send="true">Intel XE#2244</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_fbcon_fbt@fbc-suspend:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-4/igt@kms_fbcon_fbt@fbc-suspend.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1695" moz-do-not-send="true">Intel XE#1695</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_feature_discovery@chamelium:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-8/igt@kms_feature_discovery@chamelium.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372" moz-do-not-send="true">Intel XE#2372</a>)</li>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-435/igt@kms_feature_discovery@chamelium.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/701" moz-do-not-send="true">Intel XE#701</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_feature_discovery@display:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-434/igt@kms_feature_discovery@display.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575" moz-do-not-send="true">i915#2575</a>) +15 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-dp2-hdmi-a3:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-5/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-dp2-hdmi-a3.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-4/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-dp2-hdmi-a3.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882" moz-do-not-send="true">Intel XE#2882</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301" moz-do-not-send="true">Intel XE#301</a>) +6 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301" moz-do-not-send="true">Intel XE#301</a>) +6 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301" moz-do-not-send="true">Intel XE#301</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-suspend:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-lnl-6/igt@kms_flip@2x-flip-vs-suspend.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421" moz-do-not-send="true">Intel XE#1421</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@bo-too-big-interruptible@a-edp1:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-lnl-7/igt@kms_flip@bo-too-big-interruptible@a-edp1.html" moz-do-not-send="true">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1504" moz-do-not-send="true">Intel XE#1504</a>) +1 other test
              timeout</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-lnl-5/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-lnl-1/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886" moz-do-not-send="true">Intel XE#886</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@plain-flip-fb-recreate:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-466/igt@kms_flip@plain-flip-fb-recreate.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-463/igt@kms_flip@plain-flip-fb-recreate.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882" moz-do-not-send="true">Intel XE#2882</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send="true">Intel XE#455</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890" moz-do-not-send="true">Intel XE#2890</a>) +18 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@basic:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-432/igt@kms_frontbuffer_tracking@basic.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-434/igt@kms_frontbuffer_tracking@basic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351" moz-do-not-send="true">Intel XE#2351</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651" moz-do-not-send="true">Intel XE#651</a>) +11 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351" moz-do-not-send="true">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890" moz-do-not-send="true">Intel XE#2890</a>) +11 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333" moz-do-not-send="true">Intel XE#2333</a>) +4 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890" moz-do-not-send="true">Intel XE#2890</a>) +25 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651" moz-do-not-send="true">Intel XE#651</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311" moz-do-not-send="true">Intel XE#2311</a>) +14 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656" moz-do-not-send="true">Intel XE#656</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313" moz-do-not-send="true">Intel XE#2313</a>) +10 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653" moz-do-not-send="true">Intel XE#653</a>) +10 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@static-toggle-suspend:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-lnl-1/igt@kms_hdr@static-toggle-suspend.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503" moz-do-not-send="true">Intel XE#1503</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@basic-big-joiner:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-8/igt@kms_joiner@basic-big-joiner.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346" moz-do-not-send="true">Intel XE#346</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-435/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616" moz-do-not-send="true">Intel XE#616</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@tiling-yf:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-lnl-5/igt@kms_plane_multiple@tiling-yf.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493" moz-do-not-send="true">Intel XE#2493</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-464/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763" moz-do-not-send="true">Intel XE#2763</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-432/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763" moz-do-not-send="true">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send="true">Intel XE#455</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc5-retention-flops:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-433/igt@kms_pm_dc@dc5-retention-flops.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309" moz-do-not-send="true">Intel XE#3309</a>)</li>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-7/igt@kms_pm_dc@dc5-retention-flops.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309" moz-do-not-send="true">Intel XE#3309</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc6-dpms:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-lnl-5/igt@kms_pm_dc@dc6-dpms.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430" moz-do-not-send="true">Intel XE#1430</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@basic-rte:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-433/igt@kms_pm_rpm@basic-rte.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-434/igt@kms_pm_rpm@basic-rte.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446" moz-do-not-send="true">Intel XE#2446</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@modeset-lpsp:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-2/igt@kms_pm_rpm@modeset-lpsp.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439" moz-do-not-send="true">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141" moz-do-not-send="true">Intel XE#3141</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@universal-planes:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-lnl-5/igt@kms_pm_rpm@universal-planes.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-lnl-7/igt@kms_pm_rpm@universal-planes.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042" moz-do-not-send="true">Intel XE#2042</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@universal-planes@plane-50:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-lnl-5/igt@kms_pm_rpm@universal-planes@plane-50.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-lnl-7/igt@kms_pm_rpm@universal-planes@plane-50.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184" moz-do-not-send="true">Intel XE#3184</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-lnl-7/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893" moz-do-not-send="true">Intel XE#2893</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-433/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489" moz-do-not-send="true">Intel XE#1489</a>)</li>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-7/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489" moz-do-not-send="true">Intel XE#1489</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_su@page_flip-p010:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-6/igt@kms_psr2_su@page_flip-p010.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387" moz-do-not-send="true">Intel XE#2387</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-pr-cursor-render:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-2/igt@kms_psr@fbc-pr-cursor-render.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234" moz-do-not-send="true">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850" moz-do-not-send="true">Intel XE#2850</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-pr-suspend:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-lnl-1/igt@kms_psr@fbc-pr-suspend.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406" moz-do-not-send="true">Intel XE#1406</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-psr-sprite-plane-onoff:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-434/igt@kms_psr@fbc-psr-sprite-plane-onoff.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351" moz-do-not-send="true">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890" moz-do-not-send="true">Intel XE#2890</a>) +10 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-psr2-dpms:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-432/igt@kms_psr@fbc-psr2-dpms.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850" moz-do-not-send="true">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929" moz-do-not-send="true">Intel XE#929</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr2-sprite-blt:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-5/igt@kms_psr@psr2-sprite-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231" moz-do-not-send="true">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890" moz-do-not-send="true">Intel XE#2890</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-x-tiled-reflect-x-0:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-lnl-5/igt@kms_rotation_crc@primary-x-tiled-reflect-x-0.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-lnl-7/igt@kms_rotation_crc@primary-x-tiled-reflect-x-0.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2055" moz-do-not-send="true">Intel XE#2055</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-lnl-3/igt@kms_vrr@cmrr@pipe-a-edp-1.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-lnl-3/igt@kms_vrr@cmrr@pipe-a-edp-1.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2159" moz-do-not-send="true">Intel XE#2159</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-435/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091" moz-do-not-send="true">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849" moz-do-not-send="true">Intel XE#2849</a>)</li>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-8/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091" moz-do-not-send="true">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849" moz-do-not-send="true">Intel XE#2849</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-463/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280" moz-do-not-send="true">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send="true">Intel XE#455</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_copy_basic@mem-copy-linear-0x369:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-463/igt@xe_copy_basic@mem-copy-linear-0x369.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123" moz-do-not-send="true">Intel XE#1123</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug@basic-vm-access-parameters:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-lnl-8/igt@xe_eudebug@basic-vm-access-parameters.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905" moz-do-not-send="true">Intel XE#2905</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug@basic-vm-bind-metadata-discovery:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-7/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905" moz-do-not-send="true">Intel XE#2905</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug_online@reset-with-attention:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-463/igt@xe_eudebug_online@reset-with-attention.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905" moz-do-not-send="true">Intel XE#2905</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-beng-threads-large:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-lnl-5/igt@xe_evict@evict-beng-threads-large.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688" moz-do-not-send="true">Intel XE#688</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-large-multi-vm-cm:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-3/igt@xe_evict@evict-large-multi-vm-cm.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364" moz-do-not-send="true">Intel XE#2364</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-2/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-7/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3198" moz-do-not-send="true">Intel XE#3198</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@many-bindexecqueue-rebind:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-6/igt@xe_exec_basic@many-bindexecqueue-rebind.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-5/igt@xe_exec_basic@many-bindexecqueue-rebind.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a>) +23 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@multigpu-no-exec-rebind:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-4/igt@xe_exec_basic@multigpu-no-exec-rebind.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322" moz-do-not-send="true">Intel XE#2322</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@multigpu-once-userptr-invalidate:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-lnl-6/igt@xe_exec_basic@multigpu-once-userptr-invalidate.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392" moz-do-not-send="true">Intel XE#1392</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_compute_mode@once-basic:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-434/igt@xe_exec_compute_mode@once-basic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a>) +31 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-466/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288" moz-do-not-send="true">Intel XE#288</a>) +10 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-lnl-6/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-lnl-5/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1630" moz-do-not-send="true">Intel XE#1630</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@many-userptr-invalidate-race:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-5/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-6/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1630" moz-do-not-send="true">Intel XE#1630</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_huc_copy@huc_copy:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-433/igt@xe_huc_copy@huc_copy.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255" moz-do-not-send="true">Intel XE#255</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_live_ktest@xe_bo:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-434/igt@xe_live_ktest@xe_bo.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-464/igt@xe_live_ktest@xe_bo.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195" moz-do-not-send="true">Intel XE#1195</a>) +1 other test
              incomplete</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-466/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999" moz-do-not-send="true">Intel XE#1999</a>) +2 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_oa@oa-unit-exclusive-stream-sample-oa:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-466/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541" moz-do-not-send="true">Intel XE#2541</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-433/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173" moz-do-not-send="true">Intel XE#1173</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@d3cold-mmap-vram:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-464/igt@xe_pm@d3cold-mmap-vram.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284" moz-do-not-send="true">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366" moz-do-not-send="true">Intel XE#366</a>)</li>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-8/igt@xe_pm@d3cold-mmap-vram.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284" moz-do-not-send="true">Intel XE#2284</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@d3hot-basic:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-5/igt@xe_pm@d3hot-basic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@d3hot-mmap-vram:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-lnl-2/igt@xe_pm@d3hot-mmap-vram.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1948" moz-do-not-send="true">Intel XE#1948</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s2idle-exec-after:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-463/igt@xe_pm@s2idle-exec-after.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-434/igt@xe_pm@s2idle-exec-after.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a>) +157 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s3-vm-bind-userptr:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-463/igt@xe_pm@s3-vm-bind-userptr.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-432/igt@xe_pm@s3-vm-bind-userptr.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794" moz-do-not-send="true">Intel XE#1794</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s4-d3hot-basic-exec:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-lnl-3/igt@xe_pm@s4-d3hot-basic-exec.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358" moz-do-not-send="true">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607" moz-do-not-send="true">Intel XE#1607</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@vram-d3cold-threshold:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-466/igt@xe_pm@vram-d3cold-threshold.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579" moz-do-not-send="true">Intel XE#579</a>)</li>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-2/igt@xe_pm@vram-d3cold-threshold.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579" moz-do-not-send="true">Intel XE#579</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm_residency@toggle-gt-c6:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-lnl-1/igt@xe_pm_residency@toggle-gt-c6.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-lnl-2/igt@xe_pm_residency@toggle-gt-c6.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958" moz-do-not-send="true">Intel XE#958</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_query@multigpu-query-uc-fw-version-guc:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-lnl-2/igt@xe_query@multigpu-query-uc-fw-version-guc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944" moz-do-not-send="true">Intel XE#944</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_query@multigpu-query-uc-fw-version-huc:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-8/igt@xe_query@multigpu-query-uc-fw-version-huc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944" moz-do-not-send="true">Intel XE#944</a>)</li>
          </ul>
        </li>
      </ul>
      <h4>Possible fixes</h4>
      <ul>
        <li>
          <p>igt@core_hotunplug@hotreplug-lateclose:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-1/igt@core_hotunplug@hotreplug-lateclose.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885" moz-do-not-send="true">Intel XE#1885</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-8/igt@core_hotunplug@hotreplug-lateclose.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@core_hotunplug@unplug-rescan:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-434/igt@core_hotunplug@unplug-rescan.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885" moz-do-not-send="true">Intel XE#1885</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-432/igt@core_hotunplug@unplug-rescan.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@core_setmaster_vs_auth:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-434/igt@core_setmaster_vs_auth.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-464/igt@core_setmaster_vs_auth.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@fbdev@unaligned-write:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-434/igt@fbdev@unaligned-write.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134" moz-do-not-send="true">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-464/igt@fbdev@unaligned-write.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-434/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575" moz-do-not-send="true">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-433/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html" moz-do-not-send="true">PASS</a> +89 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@x-tiled-8bpp-rotate-0:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-1/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231" moz-do-not-send="true">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890" moz-do-not-send="true">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-6/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html" moz-do-not-send="true">PASS</a> +5 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-lnl-7/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874" moz-do-not-send="true">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-lnl-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195" moz-do-not-send="true">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877" moz-do-not-send="true">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html" moz-do-not-send="true">PASS</a> +2 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-lnl-6/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1541" moz-do-not-send="true">Intel XE#1541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-lnl-6/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301" moz-do-not-send="true">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html" moz-do-not-send="true">PASS</a> +4 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@blocking-wf_vblank:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-lnl-6/igt@kms_flip@blocking-wf_vblank.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149" moz-do-not-send="true">Intel XE#3149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886" moz-do-not-send="true">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-lnl-6/igt@kms_flip@blocking-wf_vblank.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@blocking-wf_vblank@c-edp1:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-lnl-6/igt@kms_flip@blocking-wf_vblank@c-edp1.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886" moz-do-not-send="true">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-lnl-6/igt@kms_flip@blocking-wf_vblank@c-edp1.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195" moz-do-not-send="true">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049" moz-do-not-send="true">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597" moz-do-not-send="true">Intel XE#2597</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-463/igt@kms_flip@flip-vs-suspend-interruptible.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351" moz-do-not-send="true">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890" moz-do-not-send="true">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html" moz-do-not-send="true">PASS</a> +14 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890" moz-do-not-send="true">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html" moz-do-not-send="true">PASS</a> +28 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@pixel-format-source-clamping:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-7/igt@kms_plane@pixel-format-source-clamping.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566" moz-do-not-send="true">Intel XE#2566</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877" moz-do-not-send="true">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-3/igt@kms_plane@pixel-format-source-clamping.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@pixel-format@pipe-b-plane-0:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-4/igt@kms_plane@pixel-format@pipe-b-plane-0.html" moz-do-not-send="true">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-2/igt@kms_plane@pixel-format@pipe-b-plane-0.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-1/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007" moz-do-not-send="true">Intel XE#3007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-4/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html" moz-do-not-send="true">PASS</a> +10 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc5-psr:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-lnl-7/igt@kms_pm_dc@dc5-psr.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718" moz-do-not-send="true">Intel XE#718</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-lnl-1/igt@kms_pm_dc@dc5-psr.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@legacy-planes-dpms@plane-41:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-lnl-5/igt@kms_pm_rpm@legacy-planes-dpms@plane-41.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184" moz-do-not-send="true">Intel XE#3184</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-lnl-5/igt@kms_pm_rpm@legacy-planes-dpms@plane-41.html" moz-do-not-send="true">PASS</a> +2 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@system-suspend-modeset:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-434/igt@kms_pm_rpm@system-suspend-modeset.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446" moz-do-not-send="true">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-463/igt@kms_pm_rpm@system-suspend-modeset.html" moz-do-not-send="true">PASS</a> +5 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899" moz-do-not-send="true">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-8/igt@xe_evict@evict-beng-mixed-many-threads-small.html" moz-do-not-send="true">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473" moz-do-not-send="true">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-7/igt@xe_evict@evict-beng-mixed-many-threads-small.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_compute_mode@twice-bindexecqueue-rebind:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-1/igt@xe_exec_compute_mode@twice-bindexecqueue-rebind.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-8/igt@xe_exec_compute_mode@twice-bindexecqueue-rebind.html" moz-do-not-send="true">PASS</a> +27 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@many-userptr-invalidate-race-imm:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-7/igt@xe_exec_fault_mode@many-userptr-invalidate-race-imm.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1630" moz-do-not-send="true">Intel XE#1630</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-2/igt@xe_exec_fault_mode@many-userptr-invalidate-race-imm.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_reset@virtual-close-fd:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-7/igt@xe_exec_reset@virtual-close-fd.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081" moz-do-not-send="true">Intel XE#1081</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-7/igt@xe_exec_reset@virtual-close-fd.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_threads@threads-shared-vm-userptr-invalidate-race:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-434/igt@xe_exec_threads@threads-shared-vm-userptr-invalidate-race.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-464/igt@xe_exec_threads@threads-shared-vm-userptr-invalidate-race.html" moz-do-not-send="true">PASS</a> +147 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-434/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229" moz-do-not-send="true">Intel XE#2229</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-464/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_module_load@reload-no-display:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-lnl-5/igt@xe_module_load@reload-no-display.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2910" moz-do-not-send="true">Intel XE#2910</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-lnl-4/igt@xe_module_load@reload-no-display.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_oa@non-zero-reason:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-lnl-7/igt@xe_oa@non-zero-reason.html" moz-do-not-send="true">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-lnl-6/igt@xe_oa@non-zero-reason.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s4-exec-after:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-lnl-2/igt@xe_pm@s4-exec-after.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358" moz-do-not-send="true">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607" moz-do-not-send="true">Intel XE#1607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-lnl-5/igt@xe_pm@s4-exec-after.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794" moz-do-not-send="true">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-lnl-4/igt@xe_pm@s4-vm-bind-unbind-all.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
      </ul>
      <h4>Warnings</h4>
      <ul>
        <li>
          <p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-434/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890" moz-do-not-send="true">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-466/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316" moz-do-not-send="true">Intel XE#316</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-435/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316" moz-do-not-send="true">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-434/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890" moz-do-not-send="true">Intel XE#2890</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-64bpp-rotate-90:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-434/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351" moz-do-not-send="true">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890" moz-do-not-send="true">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-433/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124" moz-do-not-send="true">Intel XE#1124</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-addfb:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-5/igt@kms_big_fb@y-tiled-addfb.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328" moz-do-not-send="true">Intel XE#2328</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-5/igt@kms_big_fb@y-tiled-addfb.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231" moz-do-not-send="true">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890" moz-do-not-send="true">Intel XE#2890</a>)</li>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619" moz-do-not-send="true">Intel XE#619</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-464/igt@kms_big_fb@y-tiled-addfb.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351" moz-do-not-send="true">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890" moz-do-not-send="true">Intel XE#2890</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351" moz-do-not-send="true">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890" moz-do-not-send="true">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-463/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607" moz-do-not-send="true">Intel XE#607</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231" moz-do-not-send="true">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890" moz-do-not-send="true">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124" moz-do-not-send="true">Intel XE#1124</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-463/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124" moz-do-not-send="true">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890" moz-do-not-send="true">Intel XE#2890</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-16bpp-rotate-0:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-434/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890" moz-do-not-send="true">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-466/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124" moz-do-not-send="true">Intel XE#1124</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-addfb:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351" moz-do-not-send="true">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890" moz-do-not-send="true">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-463/igt@kms_big_fb@yf-tiled-addfb.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619" moz-do-not-send="true">Intel XE#619</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124" moz-do-not-send="true">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351" moz-do-not-send="true">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890" moz-do-not-send="true">Intel XE#2890</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124" moz-do-not-send="true">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231" moz-do-not-send="true">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890" moz-do-not-send="true">Intel XE#2890</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367" moz-do-not-send="true">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-434/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575" moz-do-not-send="true">i915#2575</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-434/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575" moz-do-not-send="true">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-463/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191" moz-do-not-send="true">Intel XE#2191</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-435/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191" moz-do-not-send="true">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575" moz-do-not-send="true">i915#2575</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-1/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314" moz-do-not-send="true">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894" moz-do-not-send="true">Intel XE#2894</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-5/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007" moz-do-not-send="true">Intel XE#3007</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@linear-tiling-4-displays-2560x1440p:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-434/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575" moz-do-not-send="true">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-435/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367" moz-do-not-send="true">Intel XE#367</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@linear-tiling-4-displays-3840x2160p:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-7/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367" moz-do-not-send="true">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-5/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007" moz-do-not-send="true">Intel XE#3007</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-432/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send="true">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787" moz-do-not-send="true">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-434/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351" moz-do-not-send="true">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890" moz-do-not-send="true">Intel XE#2890</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-434/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890" moz-do-not-send="true">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-463/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send="true">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787" moz-do-not-send="true">Intel XE#787</a>) +8 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-434/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351" moz-do-not-send="true">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890" moz-do-not-send="true">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-463/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send="true">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787" moz-do-not-send="true">Intel XE#787</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907" moz-do-not-send="true">Intel XE#2907</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890" moz-do-not-send="true">Intel XE#2890</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-1/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231" moz-do-not-send="true">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890" moz-do-not-send="true">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-8/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887" moz-do-not-send="true">Intel XE#2887</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890" moz-do-not-send="true">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907" moz-do-not-send="true">Intel XE#2907</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-8/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887" moz-do-not-send="true">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-5/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231" moz-do-not-send="true">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890" moz-do-not-send="true">Intel XE#2890</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890" moz-do-not-send="true">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727" moz-do-not-send="true">Intel XE#1727</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-y-tiled-ccs:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-463/igt@kms_ccs@random-ccs-data-y-tiled-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send="true">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787" moz-do-not-send="true">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-464/igt@kms_ccs@random-ccs-data-y-tiled-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890" moz-do-not-send="true">Intel XE#2890</a>) +10 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cdclk@mode-transition-all-outputs:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-434/igt@kms_cdclk@mode-transition-all-outputs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351" moz-do-not-send="true">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890" moz-do-not-send="true">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-433/igt@kms_cdclk@mode-transition-all-outputs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314" moz-do-not-send="true">Intel XE#314</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-466/igt@kms_chamelium_color@ctm-red-to-blue.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306" moz-do-not-send="true">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-434/igt@kms_chamelium_color@ctm-red-to-blue.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575" moz-do-not-send="true">i915#2575</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-434/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575" moz-do-not-send="true">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-435/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373" moz-do-not-send="true">Intel XE#373</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-435/igt@kms_chamelium_hpd@common-hpd-after-suspend.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373" moz-do-not-send="true">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-434/igt@kms_chamelium_hpd@common-hpd-after-suspend.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575" moz-do-not-send="true">i915#2575</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_hpd@dp-hpd-after-suspend:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-6/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252" moz-do-not-send="true">Intel XE#2252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-5/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007" moz-do-not-send="true">Intel XE#3007</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_hpd@dp-hpd-storm:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-1/igt@kms_chamelium_hpd@dp-hpd-storm.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007" moz-do-not-send="true">Intel XE#3007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-2/igt@kms_chamelium_hpd@dp-hpd-storm.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252" moz-do-not-send="true">Intel XE#2252</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@dp-mst-type-0:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-434/igt@kms_content_protection@dp-mst-type-0.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575" moz-do-not-send="true">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-435/igt@kms_content_protection@dp-mst-type-0.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307" moz-do-not-send="true">Intel XE#307</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@uevent:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-466/igt@kms_content_protection@uevent.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188" moz-do-not-send="true">Intel XE#1188</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-434/igt@kms_content_protection@uevent.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575" moz-do-not-send="true">i915#2575</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-offscreen-128x42:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-2/igt@kms_cursor_crc@cursor-offscreen-128x42.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320" moz-do-not-send="true">Intel XE#2320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-128x42.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007" moz-do-not-send="true">Intel XE#3007</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-463/igt@kms_cursor_crc@cursor-offscreen-512x170.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308" moz-do-not-send="true">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-434/igt@kms_cursor_crc@cursor-offscreen-512x170.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575" moz-do-not-send="true">i915#2575</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-466/igt@kms_cursor_crc@cursor-onscreen-512x512.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575" moz-do-not-send="true">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-463/igt@kms_cursor_crc@cursor-onscreen-512x512.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308" moz-do-not-send="true">Intel XE#308</a>)</li>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-1/igt@kms_cursor_crc@cursor-onscreen-512x512.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007" moz-do-not-send="true">Intel XE#3007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-512x512.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321" moz-do-not-send="true">Intel XE#2321</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-random-32x10:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-434/igt@kms_cursor_crc@cursor-random-32x10.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575" moz-do-not-send="true">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-435/igt@kms_cursor_crc@cursor-random-32x10.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send="true">Intel XE#455</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-rapid-movement-128x42:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-1/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007" moz-do-not-send="true">Intel XE#3007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-5/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320" moz-do-not-send="true">Intel XE#2320</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-466/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575" moz-do-not-send="true">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-466/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323" moz-do-not-send="true">Intel XE#323</a>) +2 other tests
              skip</li>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007" moz-do-not-send="true">Intel XE#3007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286" moz-do-not-send="true">Intel XE#2286</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007" moz-do-not-send="true">Intel XE#3007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877" moz-do-not-send="true">Intel XE#877</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-1/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231" moz-do-not-send="true">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890" moz-do-not-send="true">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-6/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508" moz-do-not-send="true">Intel XE#1508</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dsc@dsc-basic:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-435/igt@kms_dsc@dsc-basic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send="true">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-434/igt@kms_dsc@dsc-basic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351" moz-do-not-send="true">Intel XE#2351</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dsc@dsc-fractional-bpp:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-1/igt@kms_dsc@dsc-fractional-bpp.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231" moz-do-not-send="true">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890" moz-do-not-send="true">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-5/igt@kms_dsc@dsc-fractional-bpp.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244" moz-do-not-send="true">Intel XE#2244</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dsc@dsc-with-bpc:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-435/igt@kms_dsc@dsc-with-bpc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send="true">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-434/igt@kms_dsc@dsc-with-bpc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890" moz-do-not-send="true">Intel XE#2890</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dsc@dsc-with-bpc-formats:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-464/igt@kms_dsc@dsc-with-bpc-formats.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send="true">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-434/igt@kms_dsc@dsc-with-bpc-formats.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351" moz-do-not-send="true">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890" moz-do-not-send="true">Intel XE#2890</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_fbcon_fbt@psr-suspend:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-433/igt@kms_fbcon_fbt@psr-suspend.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776" moz-do-not-send="true">Intel XE#776</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-434/igt@kms_fbcon_fbt@psr-suspend.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890" moz-do-not-send="true">Intel XE#2890</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_feature_discovery@display-3x:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-434/igt@kms_feature_discovery@display-3x.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575" moz-do-not-send="true">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-466/igt@kms_feature_discovery@display-3x.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/703" moz-do-not-send="true">Intel XE#703</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_feature_discovery@display-4x:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-434/igt@kms_feature_discovery@display-4x.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575" moz-do-not-send="true">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-463/igt@kms_feature_discovery@display-4x.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138" moz-do-not-send="true">Intel XE#1138</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_feature_discovery@psr1:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-8/igt@kms_feature_discovery@psr1.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374" moz-do-not-send="true">Intel XE#2374</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-5/igt@kms_feature_discovery@psr1.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007" moz-do-not-send="true">Intel XE#3007</a>)</li>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-463/igt@kms_feature_discovery@psr1.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135" moz-do-not-send="true">Intel XE#1135</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-464/igt@kms_feature_discovery@psr1.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575" moz-do-not-send="true">i915#2575</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank-interruptible.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301" moz-do-not-send="true">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank-interruptible.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575" moz-do-not-send="true">i915#2575</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-suspend:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-432/igt@kms_flip@flip-vs-suspend.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625" moz-do-not-send="true">Intel XE#2625</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-434/igt@kms_flip@flip-vs-suspend.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575" moz-do-not-send="true">i915#2575</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351" moz-do-not-send="true">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890" moz-do-not-send="true">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send="true">Intel XE#455</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890" moz-do-not-send="true">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send="true">Intel XE#455</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293" moz-do-not-send="true">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380" moz-do-not-send="true">Intel XE#2380</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231" moz-do-not-send="true">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890" moz-do-not-send="true">Intel XE#2890</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651" moz-do-not-send="true">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890" moz-do-not-send="true">Intel XE#2890</a>) +25 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231" moz-do-not-send="true">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890" moz-do-not-send="true">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311" moz-do-not-send="true">Intel XE#2311</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890" moz-do-not-send="true">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651" moz-do-not-send="true">Intel XE#651</a>) +24 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351" moz-do-not-send="true">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890" moz-do-not-send="true">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651" moz-do-not-send="true">Intel XE#651</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-suspend:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-suspend.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651" moz-do-not-send="true">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-suspend.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351" moz-do-not-send="true">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890" moz-do-not-send="true">Intel XE#2890</a>) +10 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333" moz-do-not-send="true">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231" moz-do-not-send="true">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890" moz-do-not-send="true">Intel XE#2890</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231" moz-do-not-send="true">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890" moz-do-not-send="true">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333" moz-do-not-send="true">Intel XE#2333</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311" moz-do-not-send="true">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231" moz-do-not-send="true">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890" moz-do-not-send="true">Intel XE#2890</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313" moz-do-not-send="true">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231" moz-do-not-send="true">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890" moz-do-not-send="true">Intel XE#2890</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890" moz-do-not-send="true">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653" moz-do-not-send="true">Intel XE#653</a>) +24 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231" moz-do-not-send="true">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890" moz-do-not-send="true">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313" moz-do-not-send="true">Intel XE#2313</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658" moz-do-not-send="true">Intel XE#658</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351" moz-do-not-send="true">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890" moz-do-not-send="true">Intel XE#2890</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653" moz-do-not-send="true">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890" moz-do-not-send="true">Intel XE#2890</a>) +26 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653" moz-do-not-send="true">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351" moz-do-not-send="true">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890" moz-do-not-send="true">Intel XE#2890</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351" moz-do-not-send="true">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890" moz-do-not-send="true">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653" moz-do-not-send="true">Intel XE#653</a>) +8 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@brightness-with-hdr:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-463/igt@kms_hdr@brightness-with-hdr.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3312" moz-do-not-send="true">Intel XE#3312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-434/igt@kms_hdr@brightness-with-hdr.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575" moz-do-not-send="true">i915#2575</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-433/igt@kms_joiner@invalid-modeset-big-joiner.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346" moz-do-not-send="true">Intel XE#346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-434/igt@kms_joiner@invalid-modeset-big-joiner.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890" moz-do-not-send="true">Intel XE#2890</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-434/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890" moz-do-not-send="true">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-433/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925" moz-do-not-send="true">Intel XE#2925</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-434/igt@kms_joiner@invalid-modeset-ultra-joiner.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890" moz-do-not-send="true">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-466/igt@kms_joiner@invalid-modeset-ultra-joiner.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927" moz-do-not-send="true">Intel XE#2927</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-5/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2501" moz-do-not-send="true">Intel XE#2501</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-5/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007" moz-do-not-send="true">Intel XE#3007</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@tiling-yf:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-7/igt@kms_plane_multiple@tiling-yf.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493" moz-do-not-send="true">Intel XE#2493</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-5/igt@kms_plane_multiple@tiling-yf.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007" moz-do-not-send="true">Intel XE#3007</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763" moz-do-not-send="true">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send="true">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-464/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575" moz-do-not-send="true">i915#2575</a>) +1 other test skip</li>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-5/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763" moz-do-not-send="true">Intel XE#2763</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-5/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007" moz-do-not-send="true">Intel XE#3007</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575" moz-do-not-send="true">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-464/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763" moz-do-not-send="true">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send="true">Intel XE#455</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_backlight@brightness-with-dpms:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-464/igt@kms_pm_backlight@brightness-with-dpms.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938" moz-do-not-send="true">Intel XE#2938</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-434/igt@kms_pm_backlight@brightness-with-dpms.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890" moz-do-not-send="true">Intel XE#2890</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc5-psr:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-432/igt@kms_pm_dc@dc5-psr.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129" moz-do-not-send="true">Intel XE#1129</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-434/igt@kms_pm_dc@dc5-psr.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890" moz-do-not-send="true">Intel XE#2890</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc6-psr:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-6/igt@kms_pm_dc@dc6-psr.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392" moz-do-not-send="true">Intel XE#2392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-5/igt@kms_pm_dc@dc6-psr.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231" moz-do-not-send="true">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890" moz-do-not-send="true">Intel XE#2890</a>)</li>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-464/igt@kms_pm_dc@dc6-psr.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129" moz-do-not-send="true">Intel XE#1129</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-464/igt@kms_pm_dc@dc6-psr.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351" moz-do-not-send="true">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890" moz-do-not-send="true">Intel XE#2890</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@deep-pkgc:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-432/igt@kms_pm_dc@deep-pkgc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908" moz-do-not-send="true">Intel XE#908</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-434/igt@kms_pm_dc@deep-pkgc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890" moz-do-not-send="true">Intel XE#2890</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-1/igt@kms_pm_rpm@modeset-lpsp-stress.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446" moz-do-not-send="true">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-4/igt@kms_pm_rpm@modeset-lpsp-stress.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439" moz-do-not-send="true">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141" moz-do-not-send="true">Intel XE#3141</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-1/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231" moz-do-not-send="true">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890" moz-do-not-send="true">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-4/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489" moz-do-not-send="true">Intel XE#1489</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-434/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890" moz-do-not-send="true">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-433/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489" moz-do-not-send="true">Intel XE#1489</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-432/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489" moz-do-not-send="true">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-434/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890" moz-do-not-send="true">Intel XE#2890</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_su@page_flip-nv12:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-434/igt@kms_psr2_su@page_flip-nv12.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890" moz-do-not-send="true">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-464/igt@kms_psr2_su@page_flip-nv12.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122" moz-do-not-send="true">Intel XE#1122</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-433/igt@kms_psr2_su@page_flip-xrgb8888.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122" moz-do-not-send="true">Intel XE#1122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-434/igt@kms_psr2_su@page_flip-xrgb8888.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890" moz-do-not-send="true">Intel XE#2890</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-psr-no-drrs:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-466/igt@kms_psr@fbc-psr-no-drrs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351" moz-do-not-send="true">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890" moz-do-not-send="true">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-433/igt@kms_psr@fbc-psr-no-drrs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850" moz-do-not-send="true">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929" moz-do-not-send="true">Intel XE#929</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-psr2-cursor-render:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-2/igt@kms_psr@fbc-psr2-cursor-render.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234" moz-do-not-send="true">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850" moz-do-not-send="true">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-5/igt@kms_psr@fbc-psr2-cursor-render.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231" moz-do-not-send="true">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890" moz-do-not-send="true">Intel XE#2890</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-psr2-no-drrs:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-463/igt@kms_psr@fbc-psr2-no-drrs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850" moz-do-not-send="true">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929" moz-do-not-send="true">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-434/igt@kms_psr@fbc-psr2-no-drrs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890" moz-do-not-send="true">Intel XE#2890</a>) +10 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-psr2-sprite-plane-move:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-434/igt@kms_psr@fbc-psr2-sprite-plane-move.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890" moz-do-not-send="true">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-433/igt@kms_psr@fbc-psr2-sprite-plane-move.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850" moz-do-not-send="true">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929" moz-do-not-send="true">Intel XE#929</a>) +8 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr-cursor-plane-move:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-433/igt@kms_psr@psr-cursor-plane-move.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850" moz-do-not-send="true">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929" moz-do-not-send="true">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-434/igt@kms_psr@psr-cursor-plane-move.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351" moz-do-not-send="true">Intel XE#2351</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr-dpms:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-433/igt@kms_psr@psr-dpms.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850" moz-do-not-send="true">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929" moz-do-not-send="true">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-434/igt@kms_psr@psr-dpms.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351" moz-do-not-send="true">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890" moz-do-not-send="true">Intel XE#2890</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr2-primary-page-flip:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-1/igt@kms_psr@psr2-primary-page-flip.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231" moz-do-not-send="true">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890" moz-do-not-send="true">Intel XE#2890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-7/igt@kms_psr@psr2-primary-page-flip.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234" moz-do-not-send="true">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850" moz-do-not-send="true">Intel XE#2850</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-rotation-90:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-433/igt@kms_rotation_crc@primary-rotation-90.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327" moz-do-not-send="true">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-434/igt@kms_rotation_crc@primary-rotation-90.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575" moz-do-not-send="true">i915#2575</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330" moz-do-not-send="true">Intel XE#2330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007" moz-do-not-send="true">Intel XE#3007</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575" moz-do-not-send="true">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327" moz-do-not-send="true">Intel XE#327</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575" moz-do-not-send="true">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-463/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127" moz-do-not-send="true">Intel XE#1127</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127" moz-do-not-send="true">Intel XE#1127</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575" moz-do-not-send="true">i915#2575</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_tiled_display@basic-test-pattern:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729" moz-do-not-send="true">Intel XE#1729</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362" moz-do-not-send="true">Intel XE#362</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426" moz-do-not-send="true">Intel XE#2426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509" moz-do-not-send="true">Intel XE#2509</a>)</li>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362" moz-do-not-send="true">Intel XE#362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500" moz-do-not-send="true">Intel XE#1500</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vblank@ts-continuation-dpms-suspend:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-432/igt@kms_vblank@ts-continuation-dpms-suspend.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1034" moz-do-not-send="true">Intel XE#1034</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625" moz-do-not-send="true">Intel XE#2625</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-434/igt@kms_vblank@ts-continuation-dpms-suspend.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575" moz-do-not-send="true">i915#2575</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@flip-dpms:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-6/igt@kms_vrr@flip-dpms.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499" moz-do-not-send="true">Intel XE#1499</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-5/igt@kms_vrr@flip-dpms.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007" moz-do-not-send="true">Intel XE#3007</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@flipline:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-466/igt@kms_vrr@flipline.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send="true">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-434/igt@kms_vrr@flipline.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575" moz-do-not-send="true">i915#2575</a>) +8 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-463/igt@kms_writeback@writeback-check-output-xrgb2101010.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756" moz-do-not-send="true">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-434/igt@kms_writeback@writeback-check-output-xrgb2101010.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575" moz-do-not-send="true">i915#2575</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_writeback@writeback-fb-id:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-434/igt@kms_writeback@writeback-fb-id.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575" moz-do-not-send="true">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-432/igt@kms_writeback@writeback-fb-id.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756" moz-do-not-send="true">Intel XE#756</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-466/igt@sriov_basic@enable-vfs-autoprobe-off.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091" moz-do-not-send="true">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849" moz-do-not-send="true">Intel XE#2849</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-434/igt@sriov_basic@enable-vfs-autoprobe-off.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423" moz-do-not-send="true">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575" moz-do-not-send="true">i915#2575</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_compute_preempt@compute-preempt:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-463/igt@xe_compute_preempt@compute-preempt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280" moz-do-not-send="true">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send="true">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-464/igt@xe_compute_preempt@compute-preempt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_compute_preempt@compute-threadgroup-preempt:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-434/igt@xe_compute_preempt@compute-threadgroup-preempt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-463/igt@xe_compute_preempt@compute-threadgroup-preempt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280" moz-do-not-send="true">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send="true">Intel XE#455</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_create@multigpu-create-massive-size:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-6/igt@xe_create@multigpu-create-massive-size.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504" moz-do-not-send="true">Intel XE#2504</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-5/igt@xe_create@multigpu-create-massive-size.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug@basic-vm-access-parameters:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-435/igt@xe_eudebug@basic-vm-access-parameters.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905" moz-do-not-send="true">Intel XE#2905</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-434/igt@xe_eudebug@basic-vm-access-parameters.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a>) +13 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug@discovery-race:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-1/igt@xe_eudebug@discovery-race.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-2/igt@xe_eudebug@discovery-race.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905" moz-do-not-send="true">Intel XE#2905</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug_online@resume-dss:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-434/igt@xe_eudebug_online@resume-dss.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-435/igt@xe_eudebug_online@resume-dss.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905" moz-do-not-send="true">Intel XE#2905</a>) +10 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug_online@resume-one:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-1/igt@xe_eudebug_online@resume-one.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905" moz-do-not-send="true">Intel XE#2905</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-5/igt@xe_eudebug_online@resume-one.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-beng-mixed-many-threads-large:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-4/igt@xe_evict@evict-beng-mixed-many-threads-large.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473" moz-do-not-send="true">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-3/igt@xe_evict@evict-beng-mixed-many-threads-large.html" moz-do-not-send="true">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473" moz-do-not-send="true">Intel XE#1473</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@multigpu-no-exec-userptr-rebind:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-4/igt@xe_exec_basic@multigpu-no-exec-userptr-rebind.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322" moz-do-not-send="true">Intel XE#2322</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-5/igt@xe_exec_basic@multigpu-no-exec-userptr-rebind.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-prefetch:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-1/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-prefetch.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-8/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-prefetch.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1630" moz-do-not-send="true">Intel XE#1630</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-463/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288" moz-do-not-send="true">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-434/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a>) +29 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@twice-userptr-prefetch:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-prefetch.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-433/igt@xe_exec_fault_mode@twice-userptr-prefetch.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288" moz-do-not-send="true">Intel XE#288</a>) +23 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_mix_modes@exec-simple-batch-store-lr:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-434/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-464/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360" moz-do-not-send="true">Intel XE#2360</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-463/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360" moz-do-not-send="true">Intel XE#2360</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-434/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_mmap@small-bar:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-463/igt@xe_mmap@small-bar.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/512" moz-do-not-send="true">Intel XE#512</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-434/igt@xe_mmap@small-bar.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_oa@polling-small-buf:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-434/igt@xe_oa@polling-small-buf.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-433/igt@xe_oa@polling-small-buf.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541" moz-do-not-send="true">Intel XE#2541</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_oa@whitelisted-registers-userspace-config:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-432/igt@xe_oa@whitelisted-registers-userspace-config.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541" moz-do-not-send="true">Intel XE#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-434/igt@xe_oa@whitelisted-registers-userspace-config.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pat@pat-index-xelpg:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-463/igt@xe_pat@pat-index-xelpg.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979" moz-do-not-send="true">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-434/igt@xe_pat@pat-index-xelpg.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_peer2peer@read:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-434/igt@xe_peer2peer@read.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061" moz-do-not-send="true">Intel XE#1061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-433/igt@xe_peer2peer@read.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173" moz-do-not-send="true">Intel XE#1173</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@d3cold-mmap-system:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-464/igt@xe_pm@d3cold-mmap-system.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284" moz-do-not-send="true">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366" moz-do-not-send="true">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-434/igt@xe_pm@d3cold-mmap-system.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-434/igt@xe_pm@s2idle-d3cold-basic-exec.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-464/igt@xe_pm@s2idle-d3cold-basic-exec.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284" moz-do-not-send="true">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366" moz-do-not-send="true">Intel XE#366</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s4-d3hot-basic-exec:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-434/igt@xe_pm@s4-d3hot-basic-exec.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-432/igt@xe_pm@s4-d3hot-basic-exec.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358" moz-do-not-send="true">Intel XE#1358</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_query@multigpu-query-engines:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-432/igt@xe_query@multigpu-query-engines.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944" moz-do-not-send="true">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-464/igt@xe_query@multigpu-query-engines.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a>) +4 other tests
              skip</li>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-bmg-5/igt@xe_query@multigpu-query-engines.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944" moz-do-not-send="true">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-bmg-5/igt@xe_query@multigpu-query-engines.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_query@multigpu-query-topology:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-434/igt@xe_query@multigpu-query-topology.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-433/igt@xe_query@multigpu-query-topology.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944" moz-do-not-send="true">Intel XE#944</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_sriov_flr@flr-each-isolation:</p>
          <ul>
            <li>shard-dg2-set2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8098/shard-dg2-463/igt@xe_sriov_flr@flr-each-isolation.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342" moz-do-not-send="true">Intel XE#3342</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12042/shard-dg2-434/igt@xe_sriov_flr@flr-each-isolation.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130" moz-do-not-send="true">Intel XE#1130</a>)</li>
          </ul>
        </li>
      </ul>
    </blockquote>
    <p>these are unrelated to my patch,</p>
    <p>Thanks,</p>
    <p>Jagmeet<br>
    </p>
    <blockquote type="cite" cite="mid:173094442551.1419712.788151085923243885@2413ebb6fbb6">
      <h2>Build changes</h2>
      <ul>
        <li>IGT: IGT_8098 -&gt; IGTPW_12042</li>
        <li>Linux: xe-2168-b925cb281e79b763990ed64267ef82a87ace5060
          -&gt; xe-2169-1051f5a468c5531923b01ba67999e502ce47a6b0</li>
      </ul>
      <p>IGTPW_12042: c90b9d96eeaa62f09596c5f4e5c759633bbaebcc @
        <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/igt-gpu-tools.git">https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</a><br>
        IGT_8098: 8098<br>
        xe-2168-b925cb281e79b763990ed64267ef82a87ace5060:
        b925cb281e79b763990ed64267ef82a87ace5060<br>
        xe-2169-1051f5a468c5531923b01ba67999e502ce47a6b0:
        1051f5a468c5531923b01ba67999e502ce47a6b0</p>
    </blockquote>
  </body>
</html>

--------------Rei4KCxEBcjx00l0CR0H6hBl--
