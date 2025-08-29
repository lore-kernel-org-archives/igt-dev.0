Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 189B4CA0FF0
	for <igt-dev@archiver.kernel.org>; Fri, 29 Aug 2025 22:34:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B46D410EC41;
	Fri, 29 Aug 2025 22:34:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jtRItQb1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C7B710EC3A
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Aug 2025 22:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756506868; x=1788042868;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=AKuipbz4qqXdkqZHkGUxr2WnFpegkcX91M040gcB2lI=;
 b=jtRItQb1stoTfB1oy73vr6Z1AML8L/HX0db+zDT2sEwe7Xq5kw9auNvk
 1D5WMvxH414SEp6IKjcio8vlT76OwiAkEGQ9PiyGbgHAHuT43Zl/VA36E
 9LEhSBfIrbLNhopQ/B+GYW+gObN7mIA2chQ+NTUSaAeiDZppTZpohfdpZ
 sRPb62OO18qRlUpIf/3RgWQNL+3HDRg7XCfoUf/nuVGABqKn9uUTPLQhD
 hXF6ISls1t4ie9N8t//DzVp/pbw44ozWGZxTXvpXSUoBHDu1e0M8hGUk5
 KUPAc9kH5rXyo4u+8XAw+9DwPZKUG0M2I4WZYQcEMNKglRldoVSz1dkjQ w==;
X-CSE-ConnectionGUID: LvhvWIyGSseJm3+CQ/bUCQ==
X-CSE-MsgGUID: mhgbwAMRQNKXbveIV94bLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11537"; a="70230717"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="70230717"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 15:34:27 -0700
X-CSE-ConnectionGUID: wOeybRToTymLE8ZulxLajA==
X-CSE-MsgGUID: GliR7Gh6SqqU+jFZyV5/sQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="169738467"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 15:34:28 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 29 Aug 2025 15:34:27 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 29 Aug 2025 15:34:27 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.51)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 29 Aug 2025 15:34:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VtOml1CVB7k/TO1F8niVVmgflpdnMoJ3qtu5uZmFAWCUBAzmE2htPvbjhp+CmdOyPD22nsEVSev/lanwLf/n5f6gqRfGoQ5oy64S0BTe4Qo27yECr6r+4r+38UVIx4mpRqTyU3fk+y59wlp8TS5/JFrGRBSmosnsvN+bJ07eCEjd/gSirqEBms2JHrakfiLAOhQgUrbxO5SGm+uGHRBWST1NdwkxkBJ/m131wqsg5nS1bNK1aY6V33bVuqrfqKvx5nshlLQm2OKd22hEGJzjFX4imXRbHGUn7y4ETxQHo77MsdnNKfyH2qhxpw9P593n2oc5BVV4xEEnIAl6torZSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J/8dFljSvwc6mbfCrcij1leWB6sjFSsivh+5Ksylapo=;
 b=UI5A9EOzLK1X5KzK8Pck4pukt94g29oKe9qStTomHpdow7g8rr6w9tZdDdhl79sJ1xZFW1kGPAfi2kNr6F1g5KJ5eq12EPinIIU7H60HCcirMDYiNothyEkKrQJBfRE2piWtldOHsEzH3OpWmOiZKAHe6qlAlK14Lcxmm+FLlaLJZQ2toDorYxVN6SbeZLI5CqIBPbbLBCl+/TMZqryaBbzutWnHBCQeeIsg5yS7FjJacBjGN468Vz7qs+7Y+4ZXDx/TDHLlYoa9LvpXLzwFVrj83LxvzfBmiA9omUeacTMJfBG2PmNQHmw6h0KfNp4qDkaNl+9umupSYL6PFJPn8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SJ0PR11MB4816.namprd11.prod.outlook.com (2603:10b6:a03:2ad::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.21; Fri, 29 Aug
 2025 22:34:19 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.9052.019; Fri, 29 Aug 2025
 22:34:19 +0000
Date: Fri, 29 Aug 2025 15:34:17 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>, <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v3 0/2] Add a test for tail address wrap
Message-ID: <aLIq6fFQWitlodG3@unerlige-desk.amr.corp.intel.com>
References: <20250828214907.94311-1-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250828214907.94311-1-umesh.nerlige.ramappa@intel.com>
X-ClientProxiedBy: MW4PR03CA0318.namprd03.prod.outlook.com
 (2603:10b6:303:dd::23) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SJ0PR11MB4816:EE_
X-MS-Office365-Filtering-Correlation-Id: 848d1c49-b267-48ba-5df6-08dde74c316f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UHFDTWRuUTBBaFlRbkQ3T1RlaHh4ZUhiYUNmUmpHazdEYkwrNXJ0cVdhc3k5?=
 =?utf-8?B?UDFtZW0xQ1RzZSt1OXI5SXN5WGVpVmZCM1ZPSFZKV2NhNjdsZDFUWGVIZVJr?=
 =?utf-8?B?dWtCUnY0bHhrY3o1cTdZVHdJeSsvSU42TkVSU09QYnd3c09ab0F0ajRhOUY5?=
 =?utf-8?B?WDlYYnVsVXFjTVVyblFEaDhCVTlqWEN1Vko4anFGNnFUYmRWZXRGQ3FTZUVk?=
 =?utf-8?B?VUZjWnJxQVlTRFk2QjZkRjBKSTJuRFcreWY5RVNrOHphOGgwekw2KzRaNW5B?=
 =?utf-8?B?bklwaCtrb0xzN2ZFbitmWmtqNHdFYWx2dzg4bDhRZ04vb0tMSFkvczE5a1Iz?=
 =?utf-8?B?NVdRUFhYcmcreEVsWmxsUVVqaEwyRExKQUtpQXduSVVpcFd2cW9paGJMOUli?=
 =?utf-8?B?WExOQ3JkU0JBRVlwdURuN2kyY3NZV0JjQVRTRXBWaXVZYkJQUEl0cnNBNWpx?=
 =?utf-8?B?Nnp0YndTSnRxTjZhWmdjTVlUc2FFdEpjeWh6VEl5ZDdlZEIyODFIVXpxRnJl?=
 =?utf-8?B?dFhqc0V3SWwzQlNkTG8yNzJsWGh0dUZkRXkra3ZWc1JUK3RodEpoSHRsRjha?=
 =?utf-8?B?bWlSanRYb3V3V0d3WVBVcWNhamJHVjdFQk9PMUhIWDVLWlFUZ3dhWW8zZ3lo?=
 =?utf-8?B?d3VmVTZYTFdhbTJkZ3o2cytTSkpPS3d6aXpIV2F5QitzMmhDbml1VzAwbzBW?=
 =?utf-8?B?OVpWY1NOdjBLZU9MVjJhWlV0REc5aGRxZjE4T0V3UUE0OGcxMlRmaDVPQzBa?=
 =?utf-8?B?Z3dJQkJiVmkwWi9WK2FwYWMrSnV3MTZIYnR6WEJOd0tTQTNWTW1pVnY2QUhI?=
 =?utf-8?B?OW1nWThGa3NPdXR1TVZha2dyWE43aFJ1MlpDZXJJOGpZTDRFVWswdjdkeWZs?=
 =?utf-8?B?ZXc4TXZhRytCNjROcnNSOXdXNUlGMXYzK2w3azRaenFtdEJLMnByNFZUOFRE?=
 =?utf-8?B?QXVTVGVuSWl6N1hRUGVCbTFVSzhaZnJOMHpmVUoxODlOU2RrTmZmN3hteWtW?=
 =?utf-8?B?dmZVUVl0WC9XMEM1Rk9xSFgvbmVqYlZSd21mbGN4ZlBqNm5CTHFJYm9zaHFl?=
 =?utf-8?B?bTF4dmNBcXZCNFQvckRKdXZYMStWYU9jbzZhUUpSZ09PMG9kVTVPSWlualRy?=
 =?utf-8?B?eklJaDFaeDE5TU9uRm5BV0dJTDNrNkhHQlBoKytQUFNVcnpuUlJlUFNUL0M5?=
 =?utf-8?B?L1dJV3hsT2k3UGJON09uM1gxbDJEU28yRXBxRnVkWXRMd0tONXhENWhxTHdQ?=
 =?utf-8?B?dllnclhIL3REMEZJRUkwRWM1b1gzVU02MnRwdnVFL0daZTNpb0lrYlZweE5B?=
 =?utf-8?B?THFpVWk5aFJ5a1FKK0tBZGJINGJONnNpRmtLRGpHTUg4NTVsdE82VFc1cGxP?=
 =?utf-8?B?bjczSmNTdHByc21jcFpXWURiNW8yZm1YdW1SMGlOSGNJQmtWUGUxanZ6bUlK?=
 =?utf-8?B?UC96Q0dIWlc4d2hMeDd2SllRaU82MWkySmlBQXJjVXNyakNRZDJYRHZ0d1Vx?=
 =?utf-8?B?bUxGdHhQTXBpSFF3cHRXQ2lCS2JtU1R3WVRCN1hhQ1RRdXFSMm5hU2FkMmZt?=
 =?utf-8?B?dGh0T1dFM1pKcHVJdUQySC9MR2FsTUFDbGFwYTBrdEM0eS9wT3M4SitVK0lt?=
 =?utf-8?B?bUV1UHoxYVNlTWlNYVhKelhuM1M1YkFsSlBBM2MzeSt3QVZqQlFvUFYyTGpu?=
 =?utf-8?B?RzUyY3hpYkQyd0l0NUNGcTdOeklOVkhDTURjd2FlUEphdVQrUGkvZFBCZ05w?=
 =?utf-8?B?aWs1WlA1VS9oaWRad0VldmNOcFkwTk9wZ1J6aXlpa2prM3JhYlYvTzNOcHBw?=
 =?utf-8?B?TW5ZL0ZrdVM2UFdSeXlKbkc3b3dDYUp3YkhNYXZ6aGxLb0hFQksxQkRUYXdl?=
 =?utf-8?B?RWgwSGFUVWRGZmNST1BGVDI4eWllZWkzYzd1YW9uVEErSDJqYmp3elZKMnNr?=
 =?utf-8?Q?WKh2gptt+sM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZmRTVENGcGRrQ3dmMDhFd0ZkdXdZYmhlT3M4NENVenVobDhoWlE1N3FtT0Iz?=
 =?utf-8?B?WmhTZHFCSW5WRE9EczlMeHpadXlLeEZYYXRXODdNNkZlNjJLaGdEeEZ2dUlC?=
 =?utf-8?B?OVZFdHVDUExPQzN4NGovR1YwVCtJTUtCRG5xbXo4YWZTQ1pnOGRDV3R5VGV1?=
 =?utf-8?B?bVcwUnp6VlFSU2R6NnFXbmE2UG9PT3Vja3VjYlRxbFgzcStwWS9SN21UNkxH?=
 =?utf-8?B?T1lFdmJtSzRVQ0VBdTlNZEQyOUlDOFA3M3dRS3VEcjZSM0NwTFUyeldSNHBM?=
 =?utf-8?B?SzByeElSQ2VXQjBWTU1wUzZ2bnhlOGlEUGYweUtPalpBWExLdW91QkxpTUYy?=
 =?utf-8?B?V1lPL1BrSEFKZGhwdnRQWGtseEpmdGNyWUtYWDRPTUFyRW1qa3Jtek83RGZz?=
 =?utf-8?B?amdKZHlsYzVnMU9WN0VDbmdBZG9UcWsxNm82MEdOTHRHVzBOaXpJc1lVZldn?=
 =?utf-8?B?c1hCeDFzVU8rZjFneDhNTjJGYnNrdmoyaDlra0tiTVkxV0JTd1p6Y2NDN3VK?=
 =?utf-8?B?WG5SSzc0R3ltbndvdm1pY0JTbWJIZDFyY2RXNCtxYm9GSE1OVkdoQ1RRNTV4?=
 =?utf-8?B?cDdtUFJXUVJDZ0VvaXpnMmx2MnUrbTg4TzRFblkyWFB1OGJoK0s3UmppZUxW?=
 =?utf-8?B?a0tOZVpOdVBTakxLRm1TVkVHTU5yeGdhb3FnRlhEeWZaY3ZOemdDaC9lUEpl?=
 =?utf-8?B?dk1Pc1lWd2lpR3F0NWZqQVh6WHJ5clZBTThHUjJQYUl4TkYvLy9lNU1FNXNr?=
 =?utf-8?B?V3NnTzFrdDlKb3c0NzI2OXZ5TStRN0dxWFd4UGNuTE11Rlk0NGxjc0N5NGU0?=
 =?utf-8?B?bXZZT3orTjM3TFZUSjBRbnNHTTNMSGMwekhjY1o2bWJDNE80VWREaG9IdEta?=
 =?utf-8?B?b1FoVmxaeFZSWUZFM2JZV2hNMHBRaEp2MWF5OGRCaXFhQmk5ajdWU3ZwbTNs?=
 =?utf-8?B?aFF5RnlDZFJrNW02SnFCTkMvODZ5YzI5Y0lPUHl5eXFFNE9QamVuV3I0Qy9I?=
 =?utf-8?B?YWNrZ2hacVRoc3JOMGFQRit6SEZRVzBhQW5WK0lIWnJZQWdka0NzMkM0TWUz?=
 =?utf-8?B?dEZVMFM3QkdZcE9VaE5xemhGT1hpRndZcTRweXllNlM0T1FoaEtCM0RUOHRr?=
 =?utf-8?B?bllzR0xkUVp2RDUzUG1uYlNwRVBZM0U2aktVbFp5K29wZFMyeXkxMTZJZFZu?=
 =?utf-8?B?d2lHMDJKNStnSktyaWkrMnhnTm1vZWphWXl1UEZEWWl5bHUrdTJqMTMyNTE3?=
 =?utf-8?B?ZnFDR2dZSC9tUytETVVJaHdwdGQ1TjJkbTBrMXFlQmQvbmpBaGxyV2Y4azZq?=
 =?utf-8?B?UVdmMlhLcDRyS1RmcVArUDdtSGd6NGk4MEg0UEpDUHdUZEpKVS9YTnZDNHNj?=
 =?utf-8?B?SFdEcm9ZdlZsN2xtWUsrOTNiTWJQYzZEOGNUR1M4ZStWMmROYTN4d3NJSGhW?=
 =?utf-8?B?b0M3WGs2b2xVZzIrc0ptSi9wc2swaStlRDBVUkJST1NWSmUyM2U0dXluaGho?=
 =?utf-8?B?aXA3cVpTWWk2emk5dkRDY01vaEhwN0pwdGpGcng5bXlMVlZBejJ5cnBOTDFk?=
 =?utf-8?B?NjRFRXBmTjdQZlZsdTNOVm5hSUlVeDJWRVZoK0pqME43Z1hnSUo2bmNzQ1Ns?=
 =?utf-8?B?SW5WVG5QM2hrTHRIUGx6ODdFUWVqNjgwRWhZc2svZ3pzVWdlOENRU3d5b1RE?=
 =?utf-8?B?VkJ5elhzWDFsaEVOREJHYnFraXVFZXBlV2pxckVsL1pheGxtUGxHZEpEY3h4?=
 =?utf-8?B?a2JWaVB4eUpwbmlBNU5kZlFKVzRnTFNYazVBNkE4b2ZYSnljTXhiMWRVempr?=
 =?utf-8?B?T1FYMnhPY09vZEFKZ3FCcTZzVkRxaUZLVUtFS1RNVXRQdlJFa2N5RGtsenda?=
 =?utf-8?B?VFZSQXZlK0NLSFNrYm1ObG9qcmJQMnJ0VWVMZWovZXRreEpVNDNhc2xyUlpi?=
 =?utf-8?B?R3FxUDI1c0ZXQTV4WkhhMkNOeCtnSkhFWDBIaG1uL1VIelFRZk9jVEtaUjl2?=
 =?utf-8?B?M3MzSjJ1U25rQ1VUQlFXVHI2Tzh0cUg1OWluOXhPVzRqQlh3Y3RwWEkxcVVh?=
 =?utf-8?B?Qm5OdzhJclNHMTgzUEtXY1FjMWxOR3laOThqU0liVlV1OUNCbnpSR1BhMktu?=
 =?utf-8?B?QU5rY3FyeFAwaUFwak9ZV2IwdUJwNWc2NkhJQWQ2OGdpaVI1MlFyMnRJWmFk?=
 =?utf-8?Q?b2YgO4tDtk7VCbXFtnW1VmU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 848d1c49-b267-48ba-5df6-08dde74c316f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2025 22:34:19.1793 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GKixDUuo/jPmJ5GCbdKBc3pd5YVMHH1i9oiTgQ7EGW7EtUIlFITtT4cFH7oQ9aN9UKFgx3Ta46bM7oNL71vj1GDGPZb2AcFtEMx1iCnkx5M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4816
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

Pushed, Thanks

On Thu, Aug 28, 2025 at 09:49:05PM +0000, Umesh Nerlige Ramappa wrote:
>Use buffer overflow logic to implement tail address wrap test. To do so
>refactor the buffer-fill test before implementing the new test.
>
>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>
>Umesh Nerlige Ramappa (2):
>  tests/intel/xe_oa: Clean up buffer-fill test
>  tests/intel/xe_oa: Add a test for tail address wrap
>
> tests/intel/xe_oa.c | 101 +++++++++++++++++++++++++++++++++++++-------
> 1 file changed, 85 insertions(+), 16 deletions(-)
>
>-- 
>2.43.0
>
