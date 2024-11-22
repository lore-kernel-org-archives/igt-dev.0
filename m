Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9777E65D25
	for <igt-dev@archiver.kernel.org>; Fri, 22 Nov 2024 05:12:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 739B810E208;
	Fri, 22 Nov 2024 05:12:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O4yUwZgy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3547B10E208
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Nov 2024 05:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732252332; x=1763788332;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/1QKcCbHyGPxisQp35T78rOEwzaDQUjVyTrMXv6A6LE=;
 b=O4yUwZgy1wCAWUOsMfHYM23COnYZymVSH2wl+mspr2V8HtL+FLXzUYAx
 yEzUSOfTrzJ5UA1mo9vlz4b+AdgBC/G0+KzdCEaRkIieul6py6lljYon9
 +LEGbaDrzqh+1t4uoN6oSFzBnC7XAAM72R5536d3N+mide8WQxMmAIo/5
 hIwoZfPUmn6yrntzO1TGbXryK2cWuzfq2hzVe68ky2vjGvNwwwnA/WTXE
 ZZZeBqHtcDXocOGVkd92KhEVTIQuVKsx2uk3X96vKdkl0esfEJBV2ER0g
 Ki1clPZnYsTSE9mgATsvYZIFDe3vhiBTfkjM8usJ2htYxa0cXwP9RN+/U w==;
X-CSE-ConnectionGUID: 4Mc5poA3RZuSdO57tf60YA==
X-CSE-MsgGUID: oObgF8TJR0m5wOFgpdcoQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="31751071"
X-IronPort-AV: E=Sophos;i="6.12,174,1728975600"; d="scan'208";a="31751071"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 21:12:12 -0800
X-CSE-ConnectionGUID: +f9zyZ1gS4GyaMAO9VGLpQ==
X-CSE-MsgGUID: VtJLaY4DRZ2j+SmEi7i+Kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,174,1728975600"; d="scan'208";a="95551565"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Nov 2024 21:12:12 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 21 Nov 2024 21:12:11 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 21 Nov 2024 21:12:11 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 21 Nov 2024 21:12:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cUH4kSGWLae8MQbEmdKYnFlativ1sb9A8yoS3Z4kcN0FywWyGGmZ6L+VbLUiD35X2nfshoROf0G0ngN1q8np1K0znAN5FVohR5nujDI0hyUAwWlsM8UV+F1R+idXHxlVqWo5v6Q6JoR8/VSL6YLWJxW6YRJtLU8+8Bnryv49vdFLYWT+pRwq/ieChH45zt9OeOujMderSu8EepleeTkYiJ11J4msacANAEpWwZrgzwsoQwu2Nh60RzmaBtR++I8kgFtssfBDyXe62Y2pQJtfNtfZS8/XJx6ZcNfgEaZWoQMeCdvJdoKJ5pZ6PiuC+rofYCDSwuNoWXjOGr8KLTriAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/1QKcCbHyGPxisQp35T78rOEwzaDQUjVyTrMXv6A6LE=;
 b=Sq74C1LzSeZ73+eztcbp/AyNyfVKp4X3IiEaGiXwjyUCPu1b11LofZWrek85wOCZexZWV1jyzQAIUXY6oiV6msk3cpE1ii3ITrkJO+Vm+58S1SqFwrXZDK9RacrFcdtVFtGkf3c9VwOMJpPAADyQeCe7BuZ2LJPn895txim98np1aCi6tLmeKCVLGLm1YqSYs7AJGckHUbSXjW/BKxdLyrrzoZCCYDKM3d7cwTUiM3T2Sk9X7B7/Y4AIi5vhJjW8187ExZXhSSSE83uVJKiFwY3JMjRc3xTUml6au+iX965XgNs1yhOx756gUkdwAV5R7AwgNPc62enAiFj3moAs2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 CH3PR11MB8313.namprd11.prod.outlook.com (2603:10b6:610:17c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.27; Fri, 22 Nov
 2024 05:12:03 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%4]) with mapi id 15.20.8158.023; Fri, 22 Nov 2024
 05:12:03 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Sharma, Swati2" <swati2.sharma@intel.com>, "Samala, Pranay"
 <pranay.samala@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Lattannavar, Sameer"
 <sameer.lattannavar@intel.com>
Subject: RE: [PATCH i-g-t 1/2] tests/intel/kms_big_fb: Intel display version
 20 onwards doesn't do hflip with tile4
Thread-Topic: [PATCH i-g-t 1/2] tests/intel/kms_big_fb: Intel display version
 20 onwards doesn't do hflip with tile4
Thread-Index: AQHbOZJw0Z2MrM5ry0yRAyuzs950H7LCIXMAgAClYxA=
Date: Fri, 22 Nov 2024 05:12:03 +0000
Message-ID: <DM4PR11MB6312F519422F8C0D65F6074D90232@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20241118081828.1895925-1-pranay.samala@intel.com>
 <20241118081828.1895925-2-pranay.samala@intel.com>
 <531da1ed-5f7c-4275-8bc9-661fee94c9f8@intel.com>
In-Reply-To: <531da1ed-5f7c-4275-8bc9-661fee94c9f8@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|CH3PR11MB8313:EE_
x-ms-office365-filtering-correlation-id: e472214d-30fb-4a4d-00cb-08dd0ab433ac
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?Zm1SUTBSd3BhNC9NNFM4MjYwYldXVzNWTHRDazRJeDZCSWZKNmdnNXprcjd5?=
 =?utf-8?B?NXpkVzB4cStvM2dNclhnZmJ1Rys1ZWY2dHpzQzRBNWZNVHlYRTV3aVdNVGhU?=
 =?utf-8?B?UVVhMHlTMk5FRk9PQzJtL2NhU2pjNmljUE1idnVtUnkzcnNqU2hnMC92UU9n?=
 =?utf-8?B?NjhFMmJqZmMxT1V6dDRLNmwxSTArcmZqbTcwU1ZIcW1pYWNvMlg2QkluakF6?=
 =?utf-8?B?ZzRBY2IxRjZ1YVBhNXRjcGpBdkJtVVhRVzFWL1k3Q01BeGc2L2VmQkJTM1dj?=
 =?utf-8?B?cjM5YXllZ1AyWkxRRDFtOEZLMVNNM1lkY2Y4ZFZBRmYxeDZUOUVVV2JGKy9y?=
 =?utf-8?B?ZGN5M2VjL2NKTzBJcU5IeGdWeUtwOElEY3NFa1VmVlYwOWZvMFdtT1NiaUxR?=
 =?utf-8?B?ZHA1U0U5dUdmRzNMbE9iZDlYUGFvUVYvMCtRQjVjQ2RuVVc2TTcxVmdxWW1F?=
 =?utf-8?B?MmxxbjFCVjN3YUQzQlB4QTdxcmxzaVdpNy9JeXQ4c0RJd0F5dXZxR0VFQ1Ew?=
 =?utf-8?B?RmE4RDN5Z2loZW1VT0ZPZ0x2RTZ6ZG9JZVd6c0FOVzhlUTVGVERGWGRYMCs5?=
 =?utf-8?B?eWIvd2VVVzlmUGcrZzBzeDh0UlZHa3NVMHMyS3JzeWRSbmx3Y1NwUEp3Vm1B?=
 =?utf-8?B?eG0yUUpLc3krTHJqMUJtU2dVTngxTmtBckR3WjdMZUZsSmtZNGhvTU0vMG55?=
 =?utf-8?B?UDVjcytFeW9SWkF5VmhqNHk3dE1WKytIUGV1MDJpWmN3VUwvZ0M1cGRiUGtz?=
 =?utf-8?B?STFMUXJ5YkR4SXByVG4rdHJ0YVUvc1pWZTk2U3lqZWs4TkZPelh2c3lrbXdC?=
 =?utf-8?B?TEV0R3YyWDR1cGE1SVc1Mm1sTEEvKzBJbjNUcVlCem80a2V5cmVJYy9SeitU?=
 =?utf-8?B?WEJRMDVGSHJ0ZVdETVFFV05ISXlndXNNMWlXdkhBeGZuaXFMY0NaVGJ0c3Z3?=
 =?utf-8?B?MUJEVUNqM3ByZHJZSHowUm5nNVRQaklqUVVXcEZnbFU1R0tweXZ4OGdOZUZB?=
 =?utf-8?B?RmhMcVZPUHFBYXFqcWhsaDE3R04zM1BSRFh3TGM4eC9kb2VIK2tPRTVGbVhS?=
 =?utf-8?B?WkRhdjd4bHhXaUtzcnpFajBUUjRPQUJDS2VxNUE5MWExQTBWZmt3NTRaaXBq?=
 =?utf-8?B?ZFZjTmpKSVdyb0dQTXJhMlhtUTZuOHVwMlhFT3E2YXBnNUkveU8rbDJDZi9m?=
 =?utf-8?B?RVpTWmpXZ01qcjJWR3JESHU5SjdQOUE5OUN2L3BkejhmRGFHWW9qS2VwZENy?=
 =?utf-8?B?RVBrOHN2UkNjUGFVWmpiOG0yYTlUSGxKelBncnZySlFPb05GajlYblhycHln?=
 =?utf-8?B?K24xalJya1pBWGYwcFFJMnFFdXMyZ0RZaGpZdENwSHpoSjNYZ1FoVE1vd3l0?=
 =?utf-8?B?N1RHSFF3WWtOUkdGYjR1UWtaRGZmMXd0K0hxZUdyVE5Nc01yTEVJS1MvRjAr?=
 =?utf-8?B?ekNtZWJ3VVc3NEVmNUNpb2hYOUFHK09qdFZnc1l6MHR6RW10S3Yvc241NEVN?=
 =?utf-8?B?UTlpK1VDTC9HK0NScnV2L1gxdG1Qak0xS0E0OGg3TjJMeGVkbHJ6T1NwSllr?=
 =?utf-8?B?YlhKNnB1eklySVFzRFNLeElqTVZpVE9jdjdTNXEwNlNCdDlCUFVXaDdjc1l1?=
 =?utf-8?B?bGpJaUgzQ0EyQWtVUWhrVFA1Z3p5M1poWUdrQWlRRjV6VUFwYnhsY1FSTkVT?=
 =?utf-8?B?QVFvcnF2dUdlSEhHRy9yM1JkNGU2TFNndGNWL2xMam8yRDBiazlHRWMram9p?=
 =?utf-8?B?Y1F3aVZVeHU0Uzg4SCt4dUxiMFI5UUpzbWh6a3JXQmFBTWdtcEVGSzdZcjFC?=
 =?utf-8?Q?EhuAbznlKACmg9qtv2BOYjrCznjcMEO8PFZ6s=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bFdxdWRNSCs3bTI5OWFVWmoyMzNJZ1k3T1NRL2dlYmtIU2ZFeHRub3dEaWd0?=
 =?utf-8?B?WHdUSDBLRGFsOEpVb0pUUHlnazVvYlByNjBuKzhpSUlCcWs3VThFdlpuRzd4?=
 =?utf-8?B?QmcyRElFeTQwbkxOejVYTkE0aGFZaExpSFk3U1lIaVd1bnlOSXBtczNTcmdv?=
 =?utf-8?B?WFl5TWd4ZlJzWEcvMnpHSFNsY3FVY01ITEF1UDQ0enRLQysrVmI2K3Q0Z1Vw?=
 =?utf-8?B?dTcwdm1yaDZrdGI0Yzh3bG5uQ0ZmZkROQzRXOHlLS2daa3RKMGUrZURTZU8z?=
 =?utf-8?B?MGp1V0o3eUVURGJ2ai9HNmJHOE8zTGVSWWR5SVFxSGlOeUd6VW1iUzlPclRP?=
 =?utf-8?B?Sk1qYlAwRmFoUUNCTkE3K0UrRFY5SVhtaE5IR1RPaUQ4Q0Z4UThTMXBkVnJQ?=
 =?utf-8?B?dDVGR28yenkzQm5oNmhxb1ZhaVEzaEwrVGkwSmp1VUM3ampvdzJpUkxyQXpE?=
 =?utf-8?B?cGdzNXV5MHZ6M3I1VDMrYS9qcGJrK3ZDc2xKVXhTSTZLV25Ha2RaQ0Z6TURs?=
 =?utf-8?B?OHRQSFZDQ2Uyc3hid1FwVlFKZ3dwQmo3S0JhRnRBM2NqWGMxeFN3bEtFSmVW?=
 =?utf-8?B?UkNUR2FRVjR1SUVFRzE2aWk4VUFEUjlNVmNFUjhBL281SnBzbFpwbTJIRWVS?=
 =?utf-8?B?RmRzOThxLzhlaDVFSEgrSVd4cXRPV25Ud1MwM0hxcVFOa2EvT1R3a003d2k2?=
 =?utf-8?B?L0M3UFJQVmQ2TXR6dlV6VDAyNk1ic1ZkanV1Wk4ycks3ZWdHejhLZlJndktt?=
 =?utf-8?B?V0dmOXo0QnpQbHFlejhkWlRTMjQ3MmVERGYvN09IamZITkdQYmhZVk5wNUF3?=
 =?utf-8?B?eFFEYkFzVVM1SE9XaHlqOFpvelF6em9RWUYzemFPbFV6M0IrUEg5QS81a3pL?=
 =?utf-8?B?eEs4dW82UExGQk5uVU1BUVg4eThSbG9uVWVCT0ZhdWxRbnhvQTFpcGk2Z0Rj?=
 =?utf-8?B?eDM2WFFhb0lUc3JnSVlUWW94bkZ5S1lmS3JDRER5OEdVeGNNNUdobTZTUmJB?=
 =?utf-8?B?Um9yTExxZEkrTDBTYk43UkJ6LzZNTERVT0pLSXU3WFdTUjFXSmhwMUhMWEF2?=
 =?utf-8?B?ZlhMdEJtS3hSU0dOYmZtU2UybURnZ0xaVDA1V05NSXp5anUyVGdVclR1WHFS?=
 =?utf-8?B?SUNET1JHM0tEeXMxUUVoYXBLWUh4WVlqZEg2WkhPWk9PcEc2U0hISXI2WU5r?=
 =?utf-8?B?dVZWdkVqdzFiN0kxenhDeVFVdGk3bG1NNTNFS0xFQ3F6cDVyaWxMR2dkK0s3?=
 =?utf-8?B?aktCUGNXNFc2Qkp2QVhzbGpWZERnR2E5aTRtN2ZKT1A4Qkt1dm5LTlNlSDFI?=
 =?utf-8?B?dE92Qkh2MG9kVzBmQkpQSy8rdTdHUElvSGlSYlBaN0FFSE9pWXp3SlNvWkVr?=
 =?utf-8?B?UEtGVXdwdW5sd1A2SDVwdWNXbVBBZG5NNVhDZGlPN21UczhUVWU5ZEJIVTYy?=
 =?utf-8?B?dVpCZlNYZm4vNnNtVXBleWlGUHdKOHJ1OC9DdzEzcitTRWdzb0dSOG0xMjRh?=
 =?utf-8?B?eTUzUldDeWcxNGN3VGZLWTROcXBtNHlsNklBM3ZzSFdDUWo4Q2NYWUpjK1RP?=
 =?utf-8?B?MzliLzRKQWNvbUhhSFA1dXBvN3Z5RThYRm9JR20zMEF0UjZuR3JaajJsc3hP?=
 =?utf-8?B?MEFVZlhpTFNCdmRsVFZ6Tmo3U013Z2NVR2ovR2VEckQ0anRxdkw4RjZDdnM1?=
 =?utf-8?B?RVlUL0VwNktDQmc2bE5aQ3ZrUXN6ZERMWDAvMEQvaU1kdVcvRHN2bEN2T0RP?=
 =?utf-8?B?R1Y4OFpaZmxXL1E0clljUE1mbndRRnNJOER0bVI0cVE1Tnl1eTVmK05UMW50?=
 =?utf-8?B?MDI4aFFuMmJCOXczUjlTaFdDWTl1dEN1dmVjT3FFUUYxZFJrRThaQWRSVWVj?=
 =?utf-8?B?RnpXME1XdDVPc29LQnBPbmwwL3ZjeWtwbEJVRmVUVUo4c2tld1E3NzVIR1Mz?=
 =?utf-8?B?VXE4RmNzd0JPaUt0U252N0ExMTA0Z2c5eTMyb0ZYRUFselV3eGZLQVFlT2VY?=
 =?utf-8?B?akVQTWZoTjJpVWlUall3TFVOOUphR3VUSEM5Zi9rQkxmOE9vRWhrYTJZeTVR?=
 =?utf-8?B?aytjWlNUMHdHMFdrcWxoOHhzbU8wS2ZXdmd1SVlZL2hJSDVvLzZPSW1UYStx?=
 =?utf-8?Q?gNmo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e472214d-30fb-4a4d-00cb-08dd0ab433ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2024 05:12:03.3349 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: baiOcyd32dbttyx0+SrCTdBRiC70QqkiT7avG1l+3WGaeovsKDD3WQ2yeRrqrVZiyZvdVNaPOfRwK7+BWk7r+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8313
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

UGxlYXNlIGZpeCB0aGUgd2Fybi4gYmVmb3JlIG1lcmdpbmcNCg0KLi4vdGVzdHMvaW50ZWwva21z
X2JpZ19mYi5jOiBJbiBmdW5jdGlvbiDigJh0ZXN0X3JlcXVpcmVtZW50c+KAmToNCi4uL3Rlc3Rz
L2ludGVsL2ttc19iaWdfZmIuYzo5Njk6Mzk6IHdhcm5pbmc6IGRlY2xhcmF0aW9uIG9mIOKAmGRh
dGHigJkgc2hhZG93cyBhIGdsb2JhbCBkZWNsYXJhdGlvbiBbLVdzaGFkb3ddDQogIDk2OSB8IHN0
YXRpYyBib29sIHRlc3RfcmVxdWlyZW1lbnRzKGRhdGFfdCAqZGF0YSwgaW50IGwpDQogICAgICB8
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIH5+fn5+fn5+Xn5+fg0KLi4vdGVzdHMvaW50
ZWwva21zX2JpZ19mYi5jOjkyODoxNTogbm90ZTogc2hhZG93ZWQgZGVjbGFyYXRpb24gaXMgaGVy
ZQ0KICA5MjggfCBzdGF0aWMgZGF0YV90IGRhdGEgPSB7fTsNCiAgICAgIHwgICAgICAgICAgICAg
ICBefn5+DQpbMjQvMjRdIEdlbmVyYXRpbmcgaW50ZWwtY2ktdGVzdHMgd2l0aCBhIGN1c3RvbSBj
b21tYW5kLg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IGlndC1kZXYg
PGlndC1kZXYtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBTaGFy
bWEsDQo+IFN3YXRpMg0KPiBTZW50OiBGcmlkYXksIE5vdmVtYmVyIDIyLCAyMDI0IDEyOjUwIEFN
DQo+IFRvOiBTYW1hbGEsIFByYW5heSA8cHJhbmF5LnNhbWFsYUBpbnRlbC5jb20+OyBpZ3QtDQo+
IGRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IEIgUywgS2FydGhpayA8a2FydGhpay5i
LnNAaW50ZWwuY29tPjsgTGF0dGFubmF2YXIsIFNhbWVlcg0KPiA8c2FtZWVyLmxhdHRhbm5hdmFy
QGludGVsLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCBpLWctdCAxLzJdIHRlc3RzL2ludGVs
L2ttc19iaWdfZmI6IEludGVsIGRpc3BsYXkgdmVyc2lvbiAyMA0KPiBvbndhcmRzIGRvZXNuJ3Qg
ZG8gaGZsaXAgd2l0aCB0aWxlNA0KPiANCj4gTEdUTQ0KPiANCj4gUmV2aWV3ZWQtYnk6IFN3YXRp
IFNoYXJtYSA8c3dhdGkyLnNoYXJtYUBpbnRlbC5jb20+DQo+IA0KPiBPbiAxOC0xMS0yMDI0IDAx
OjQ4IHBtLCBQcmFuYXkgU2FtYWxhIHdyb3RlOg0KPiA+IEludGVsIGRpc3BsYXkgdmVyc2lvbiAy
MCBvbndhcmRzLCBUaWxlNCBubyBsb25nZXIgY2FuIGJlIHVzZWQgd2l0aA0KPiA+IGhvcml6b250
YWwgZmxpcC4NCj4gPg0KPiA+IEJzcGVjOiA2OTg1Mw0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTog
UHJhbmF5IFNhbWFsYSA8cHJhbmF5LnNhbWFsYUBpbnRlbC5jb20+DQo+ID4gLS0tDQo+ID4gICB0
ZXN0cy9pbnRlbC9rbXNfYmlnX2ZiLmMgfCAxNSArKysrKysrKysrKysrKysNCj4gPiAgIDEgZmls
ZSBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvdGVzdHMv
aW50ZWwva21zX2JpZ19mYi5jIGIvdGVzdHMvaW50ZWwva21zX2JpZ19mYi5jIGluZGV4DQo+ID4g
N2RhM2QxMmQ0Li5hYjQ0YTlhNDIgMTAwNjQ0DQo+ID4gLS0tIGEvdGVzdHMvaW50ZWwva21zX2Jp
Z19mYi5jDQo+ID4gKysrIGIvdGVzdHMvaW50ZWwva21zX2JpZ19mYi5jDQo+ID4gQEAgLTk2NSw2
ICs5NjUsMTkgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCB7DQo+ID4gICAJeyAwLCAiIiB9LA0KPiA+
ICAgCXsgSUdUX1JFRkxFQ1RfWCwgIi1oZmxpcCIgfSwNCj4gPiAgIH07DQo+ID4gKw0KPiA+ICtz
dGF0aWMgYm9vbCB0ZXN0X3JlcXVpcmVtZW50cyhkYXRhX3QgKmRhdGEsIGludCBsKSB7DQo+ID4g
KwkvKiBJbnRlbCBkaXNwbGF5IHZlcnNpb24gMjAgb253YXJkcyBjYW5ub3QgZG8gcmVmbGVjdC14
IHdpdGggdGlsZTQgKi8NCj4gPiArCWlmICghKCFpc19pbnRlbF9kZXZpY2UoZGF0YS0+ZHJtX2Zk
KSB8fA0KPiA+ICsJICAgICAgaW50ZWxfZGlzcGxheV92ZXIoaW50ZWxfZ2V0X2RybV9kZXZpZChk
YXRhLT5kcm1fZmQpKSA8IDIwIHx8DQo+ID4gKwkgICAgICAhKGZsaXB0YWJbbF0uZmxpcCA9PSBJ
R1RfUkVGTEVDVF9YICYmDQo+ID4gKwkgICAgICBkYXRhLT5tb2RpZmllciA9PSBJOTE1X0ZPUk1B
VF9NT0RfNF9USUxFRCkpKQ0KPiA+ICsJCXJldHVybiBmYWxzZTsNCj4gPiArDQo+ID4gKwlyZXR1
cm4gdHJ1ZTsNCj4gPiArfQ0KPiA+ICsNCj4gPiAgIGlndF9tYWluDQo+ID4gICB7DQo+ID4gICAJ
aWd0X2ZpeHR1cmUgew0KPiA+IEBAIC0xMTIzLDYgKzExMzYsOCBAQCBpZ3RfbWFpbg0KPiA+ICAg
CQkJCQlpZ3RfZGVzY3JpYmUoInRlc3QgYXN5bmMgZmxpcCBvbg0KPiBtYXhpbXVtIGhhcmR3YXJl
IHN1cHBvcnRlZCBzdHJpZGUgbGVuZ3RoIGZvciBnaXZlbiBicHAgYW5kIG1vZGlmaWVycy4iKTsN
Cj4gPiAgIAkJCQkJaWd0X3N1YnRlc3RfZigiJXMtbWF4LWh3LXN0cmlkZS0NCj4gJWRicHAtcm90
YXRlLSVkJXMtYXN5bmMtZmxpcCIsIG1vZGlmaWVyc1tpXS5uYW1lLA0KPiA+ICAgCQkJCQkJZm9y
bWF0c1tqXS5icHAsDQo+IHJvdGF0aW9uc1trXS5hbmdsZSwgZmxpcHRhYltsXS5mbGlwbmFtZSkg
ew0KPiA+ICsNCj4gCWlndF9yZXF1aXJlX2YodGVzdF9yZXF1aXJlbWVudHMoJmRhdGEsIGwpLA0K
PiA+ICsJCQkJCQkJCSAgICAgICJDYW4ndCB1c2UNCj4gcmVmbGVjdC14IHdpdGggVGlsZTQgb24g
aW50ZWwgZGlzcGxheQ0KPiA+ICt2ZXJzaW9uIDIwK1xuIik7DQo+ID4NCj4gCWlndF9yZXF1aXJl
KGlndF9oYXNfZHJtX2NhcChkYXRhLmRybV9mZCwNCj4gRFJNX0NBUF9BU1lOQ19QQUdFX0ZMSVAp
KTsNCj4gPg0KPiAJZGF0YS5tYXhfaHdfZmJfd2lkdGggPSBtaW4oZGF0YS5od19zdHJpZGUgLyAo
Zm9ybWF0c1tqXS5icHAgPj4gMyksDQo+IGRhdGEubWF4X2ZiX3dpZHRoKTsNCj4gPiAgIAkJCQkJ
CQl0ZXN0X3NjYW5vdXQoJmRhdGEpOw0K
