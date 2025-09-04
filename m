Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BED5CA1012
	for <igt-dev@archiver.kernel.org>; Thu,  4 Sep 2025 07:09:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0530910E988;
	Thu,  4 Sep 2025 07:09:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="biwXsxCp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64C7710E988
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Sep 2025 07:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756969791; x=1788505791;
 h=date:from:to:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=HdrOqIhuXJklSxEDKdSqig72lhLWgYErlEWNG1l5g70=;
 b=biwXsxCpOpwSQ2/HXmcrQMqT4hYOT0057ZxB6mUhgrItOuQlisqryWB9
 sVDQIoMiOsNo6nB4pOJrom1u1jKtD+lI2zYiP8a4D2yy1/aqXh0RKqFpr
 8rcGmwmQPioL1QIDd5omqa+YM9lKl2wYMCM3DMfsPQHStFn8alQrnYpE+
 G7ItAEKvLOTOvVE+l+lZGGF6nRyqZ2IB4pXY3Sgm5FLAao/fley0jUdt7
 xbTjT7tlj1AS5PLBLsJ0U7B250yo9988pGKkeN0ixBhQTCZhoHz8H+LA2
 peptEgL86fxbDEBYxpoVEbX3vyQbRXobmwAKbYyHAmUiz61E9LyKGT7Fy A==;
X-CSE-ConnectionGUID: 5FLWs0RoRT+3SF6uVGeoww==
X-CSE-MsgGUID: 1KTiDnVwT765bMGOje4NkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="61932142"
X-IronPort-AV: E=Sophos;i="6.18,237,1751266800"; d="scan'208";a="61932142"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 00:09:51 -0700
X-CSE-ConnectionGUID: Fb6vkcyzToyv+vNdAAIa6g==
X-CSE-MsgGUID: POrqEgctQ0KXZPIbDPwdZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,237,1751266800"; d="scan'208";a="172177063"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 00:09:50 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 4 Sep 2025 00:09:49 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 4 Sep 2025 00:09:49 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.66) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 4 Sep 2025 00:09:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sm9bJSsB+HaqmkMryiTK8tZjzKQf0CdaBKJDqQDTZn+3kemthUcC8vg9u22TXbABINnZQ8Re71ZBY/Kx1Zc8TO3Q3OyAyF+jsNUa1m5mWL8Y/ueJK1KRDXwHBVtVjol3Pkzl35QXlrwmz43cmR4xLAE81uCoM397rMupIoxjr61foX50s8apauF0fDHyVjdOsWf2r3gA7D4hCJ/Ko/pt0IpKZOExT503C148zXJILPwpaEHADFEIcQcaqBZ0i/KtgtyvAuIgSc9ouqS0iQbcPdQRpr+109BLoNEmGtC1LYRBwrh+tLMoW1JPhkY/JgkmLUrm3/Cu0AgfvWb9fjXONQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rx/GtLratQHYeYl2GMwHIhc+6CUs5ycpwz3oQrKE8Ss=;
 b=HqGAnhodiItn00Bc1f1KOCHRM7jRa6crooC7R1xOXyCt3/vflRRX47xD6e+gcCtoZ8iNvgHYFodj/kGlrPh/uUIZTwB8cRMOh+BEOYF0oaizejOi2gXNolWBZbYd1b1fTK/ElY3TCy71LoI5ZoU6djtsqgLYhU6CgjCdK4kPmqMtxdPkjbWr6Rz0NKjTmUI7WRXtFwCMfvGSxoNOeXPrJJgROCOLnIiPEkcq25Eqct/uSAL2FIh0LWbA+rIWvyxMkP19PG79jpd94bwHhwEI3SuCcCDp5Xmp9AeF/fFKe8xjBqWzEfxUN1709gwJBTkITaJaYmV2v+HeuC4ne8+6Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by PH8PR11MB6755.namprd11.prod.outlook.com (2603:10b6:510:1ca::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.18; Thu, 4 Sep
 2025 07:09:46 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%4]) with mapi id 15.20.9073.026; Thu, 4 Sep 2025
 07:09:46 +0000
Date: Thu, 4 Sep 2025 09:09:41 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: <igt-dev@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw6IGZhaWx1?=
 =?utf-8?Q?re_for_tests=2Fintel=2Fxe=5Fexec=5Fmix=5Fmodes?= =?utf-8?Q?=3A?=
 Remove absolute duration value (rev5)
Message-ID: <aLk7NRZCXFvtcz6Q@fdugast-desk>
References: <20250903074646.1789362-1-francois.dugast@intel.com>
 <175695801260.301896.16423295434747562611@1538d3639d33>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <175695801260.301896.16423295434747562611@1538d3639d33>
Organization: Intel Corporation
X-ClientProxiedBy: WA2P291CA0032.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::21) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|PH8PR11MB6755:EE_
X-MS-Office365-Filtering-Correlation-Id: d65fac08-8cc2-4d56-a289-08ddeb820764
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|1800799024|376014|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a1BoQm1JRkpjbHMrU1cya0VvSy8vS2NWQ20yTXFuQ056ODNKUkFmYWFsQ3BC?=
 =?utf-8?B?cHMvb2Zqa0JmMkk0V1BGdXJqT2VWbXpPbm92ajNoN1hNdVNlVXV6dlJ0NEk3?=
 =?utf-8?B?SlVmVnIrWmt0SExtZW42dU5qV0JQWlR1aTNhMVN5ZUJZMUhBdVlXa3ZNc2dT?=
 =?utf-8?B?ODZSSUk3V09mVzlyZGRFamFRQVU4azFaRWVUMDhPTDlXM0YxcE12NkVBSmxt?=
 =?utf-8?B?QkRRU0hlcDdTSDlId0p4bmtZQXNXQmx1YllDZ2pzelZWcmRzZmdhamx5cFg1?=
 =?utf-8?B?TWd1MnRQUTBjbFY1aklMTGVKSkI3SHliZnE2MFhFei9qN3FGUDdBdFZydzFF?=
 =?utf-8?B?akxDb1FZSVBZTlpLSmtCaWYxZ0svT1FYMkpRdy9TYllBK1RxUTNZd2JPeVpI?=
 =?utf-8?B?NDM3WUVjODVtTCtCQUFxMi81azhiT0xDYmxrLzIrbGZaVWlDby9yWEZyTXhz?=
 =?utf-8?B?aUJBZGpMckxLMTA3YU1UNGNzaG1CVnJZbHBWb1VmZThCQ1BWbURveGVvRmxH?=
 =?utf-8?B?cXBhbkFsbGo1TDRORVM2ZWFkSmJFQU1FWkJUNk9Lc0cwaHdkNnRWMU1wU3JG?=
 =?utf-8?B?Sk1jZllBSkM4Q2szZDZrdTh3RDR6ZDJJMFpTVlYyOHIwVG9HQ1ZXZWM0NW43?=
 =?utf-8?B?eWtmWkxGYjRXNkVFT2QvcWlVSmdXUVpucDB4RTRUMzluNEp5WC9uS000M1Bk?=
 =?utf-8?B?cjRwSnNsV1ViSzQ1TzBIVThNczAxV01jRzZrZ0M0c3FMaTlVZnRGcnhqdWFv?=
 =?utf-8?B?YnUrZ3hNTE1NMkNnUlc2ZC9pamVDTEQrYUJzUUg0T3BjZi9PaHluVHBrMnFx?=
 =?utf-8?B?TWExK09QYW1HdndHV1Z2eUFSNERLcVNtRllvVWFqdTZ3aUJ0dTRTMmk0Tm0x?=
 =?utf-8?B?S1UxZHFuUFhPVWpsWjlmMk43K0gvNDZxMVdsc3NuRERub2tnQ1krdktEUXRV?=
 =?utf-8?B?YnUzUFp5cEQ2WlM4VE9HbzFSZkRuUEtwSmo2blY3b3RsWEIyeVVEQUo5TE5a?=
 =?utf-8?B?STlCbGZMcTJZNisvMVJKckl2emZZR1kvb2kxMXNRSVNGZ0VWSGtMQmNwR1hE?=
 =?utf-8?B?VS8weFBlZXRHalI0NW51c0laNnZBcjlFcGxTVVhRVXpFSjJHRFRGeGMrMmdw?=
 =?utf-8?B?Yzg4QWlrQ2FFR210WkQrMGlLU3NsWDRNQUcvRitGMVVSSGdiYkdqZXk4dXps?=
 =?utf-8?B?b0JIa1B2d1RyUGZ2VFk3djFVb0JlU0JGdmpKYXB0eFUvVTNQUjVvZHlKYlA5?=
 =?utf-8?B?MW1BM2cxeWJWemY5VUhWNTBYVnJ4TmdaOHVFazR5akZEYkk4eS9YRWdDU0xn?=
 =?utf-8?B?NHFoTGgxdkRmeG1PUlJ1d3NLLzdkQlFranFBQ0VNeVRuOGhMQkcrN0N5eEFq?=
 =?utf-8?B?ZFJBZEgyZXFJYU5zbFRacjV5Nzc4UmJlRjJ1WjJaQTcrWHVFRDVZUFJGVk9r?=
 =?utf-8?B?L1dyNE90dXVyS2RiTDJKKytNZkthV2ZTUlloRnRwL1dhOTZnYzNUc1dLd2pR?=
 =?utf-8?B?Uzc3blYrYmZTRVQxekN5WFFmL2dOakFXSTVrVS82eXRQVzc1aG1oTklLbHVv?=
 =?utf-8?B?T1JsNlpvbDM3TE5Rcmc2emVXOEVXcDVoeTZXcEsrb3VsVTl2RHlwbDAzcXZ2?=
 =?utf-8?B?QmZuYTA0dWpvNjg4TFlndnVPSGMxT01Fc2cyNEhpZk1jbXh5V2Z4SzU1T2g0?=
 =?utf-8?B?WHZxVkQyL2Z6UVhsZGF1TXlOcXd3UG1BOVpLVEY5L1Rvdm5vVzJPVVNYSlRZ?=
 =?utf-8?B?aTdSeERlNS9NOUs5OEkvelVWRzNFb1BtSDY4SFdOVWdXc3J0alBlVFRPUmQ0?=
 =?utf-8?Q?M2kFJgY8DmwbpdrucQ5H1niUuLr7CJhoWUejo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(13003099007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UW9YMng2MFBYTEd1dmE4L1o0QS8wbnlUaXBkNEFLMlFnbnRNcFNEV3hWbHRY?=
 =?utf-8?B?ZEJ3SHpwTG9NUE03UUp4dmNiUk8rMWlrTDhqekQ0M0xQSlFON1QrSkY5TGpt?=
 =?utf-8?B?NEFMbkMzb3RKNmFHRFdVZk1xaUNPVVdOdGJtaG15SkRHa0pXTHhseEhocU5X?=
 =?utf-8?B?dlFMdWF1Mzh5aVlSNXZHOG1TZitwdElVRjFzbWNtRnM0MEtBZVJOa1NiY3dY?=
 =?utf-8?B?eWI4anZDd2NYMGswd1FiWU9uTGNXYjgvYWd6WC91cS9vbHRlbGsyN1Q5UzJT?=
 =?utf-8?B?MXY4REU1S1BuY3BwOTRGMHhLcVNHaW5ya3dGekZoRk1ReE85eEx6QjA3N1p4?=
 =?utf-8?B?akpRcFdxWkNWM0o5YW1wK3lpS3FibWVmalNQeUdlTlJSU2R1SmYvZFNBbDV3?=
 =?utf-8?B?Nkg3VXBnSndVQi9MbXNpU0EyMStKRCtMTnFadlFYUktxaGVVVyt2OS9oTjl1?=
 =?utf-8?B?Ymp1cTJhVUliTkJOSjd0UTBxRUhpMldNcWsycUdkQWRvUXo4cFdUT2dVYkZr?=
 =?utf-8?B?WXozMXZmVWhkS0VITXpEN1AwVGM1cXFDakpHUHRuT1NsWUV3MjUxT3pKVFhE?=
 =?utf-8?B?aldkYVh4UGxjZUlOUXVoWFJ1OS9EMmcrZlVHUUIvMjJNUUJKQTU2Wm1BMXhB?=
 =?utf-8?B?aGRhdmJDQ2Z5ZVVrLzhVbnFmdFYzRHVEbFhuak9ySWhydEFxWnMya0g0NVJx?=
 =?utf-8?B?K0F3ZTVmdTNHTDVUYTBKU2tzeEZHU3Q4OUdzaGFKOXk4cHhjUDF5NXVRTnE5?=
 =?utf-8?B?RXZ1TFZzVmxXS3RSenU0T0Y3SGY3TTN4MUtFS1Fhd3YrWDlOSFFPTWkyckk3?=
 =?utf-8?B?ZnFzNnIxRDY4eUhKY0UxZXdSbEl5NjBSRUtxdGV3Y09kR2hLTFV6VC9jWlZr?=
 =?utf-8?B?Y3E3aVc0cjNCdCtQc0FNTzNjTXNPRkhSK21uS0JaNUQ3QUYvWTFYc3FxbmFo?=
 =?utf-8?B?YjZFNnlrSHRrSVVJYkhIUG1VMHlzMG8xVFFIcTA1bnp0eVpWcXlXUWVmUjVV?=
 =?utf-8?B?bkVGM2x4VkR6TkQ5VVQ0YXdBdzFNVlArdU1XNFphdFBRMXY3TjVoOXluVGY0?=
 =?utf-8?B?Qml0SzQ3b0N0UU8yamh5VzdaRG1pVGtKWTJsNHNON0tSSEUxQ0tQSlNpOTY0?=
 =?utf-8?B?b2NWR2haYUFwQTVqQ0M5R3NlcTVNazJQb0hMcXV6VGd6R0c3YVVJSHAvWGNV?=
 =?utf-8?B?V0YrdWlDc0d5UzQxVjMvMUprNWc3N0svM1hrSFNyU0ViQnZKbithWVV5L0Rt?=
 =?utf-8?B?MExSVFY2MC9LOG9HT3hTMlRURlluY3g2cnRaTitxK2xFSXIxQkt2anRHbUVp?=
 =?utf-8?B?L0xGUVY0T2gxQVpBUWhVVkF0TFU4VEIrM3VKRk5TY05EWmk4YnplaWxEc2VX?=
 =?utf-8?B?NlhBOThha0g0aDE2NjI2WjlOMGpQQVhMWTFxVWo3K21ucGRQdVFWWHlhek54?=
 =?utf-8?B?RXlVL2ZDcjltanhWV2xJZzZQWjhTYTFsa05kU3Z1RlIxSDZGNzBRYzQ1a3lt?=
 =?utf-8?B?SGNERE9NZFhWaVB3d2hGZmRNZndGUGlEeFNTRnp0eHByQW9nQW4zVVlkTU9I?=
 =?utf-8?B?bDU1S0Vkd2Z4N2Y3SmJpQWV6T3hKLzZJOUNKa2d2VVkxRnhOMVUvV2pNeGMv?=
 =?utf-8?B?ZmQ4SktGVG9nQXlFODVVblB1OVR4RnRmVUlmcjhZWVNkNG04OUo3QjJSYWFo?=
 =?utf-8?B?bG5GVThoZldZcC9QVEVINFpkMHplQmE2a2orQS9nVkY5R0Nkckg0SWZHVlk2?=
 =?utf-8?B?eW42RGExcVNhRkVRWGtSQnJBWDNHOWV0VENpZU1Vb1NGQlgzY0hqVERTdDYx?=
 =?utf-8?B?VDQyaFNHK09iV1M1cHNjZXNBQk1ZQkFuT0h4UGcrSGpzYlRpbHJwYW11MFd2?=
 =?utf-8?B?cDZJUHNXMldka1Q0d0N5NnBJTW9obGxTMkN5RFV3R3lXTnhUNml2WDkrcnM2?=
 =?utf-8?B?Z01rRWI1d3BvSlVIR1JtSVRkdlZzZkNxdTJVRTZPK0pRSFUxYVl6eHkycS9Y?=
 =?utf-8?B?RWFKbnRKOFliS1NLZXBlcGpyVkJqVThkei9aN2pBamFYM0lRazhYaEFWTTVN?=
 =?utf-8?B?cnhKUmdIc3Z0ZGVWYmQ0dTB3U01CQ0hKZlZ5cEllM05sNm9NeGdQWThUeXFI?=
 =?utf-8?B?SEMwRzluM0dDNWNjbndPZUIzMGJua2pnRUxKaHNnUGVNUkpHVmo3UXNQUjlo?=
 =?utf-8?B?b3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d65fac08-8cc2-4d56-a289-08ddeb820764
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 07:09:46.2452 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: isaZsegSVdQghAWSK5UlnZnie9WLih5bHxaGRVlghJHn+99XXX676fpuGgFHezcPzd0w0ypXSQWjjhuMq+BWU2Heiei4kI91GWTw9XAO7Pk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6755
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

On Thu, Sep 04, 2025 at 03:53:32AM +0000, Patchwork wrote:
> Patch Details
> 
> Series:  tests/intel/xe_exec_mix_modes: Remove absolute duration value (rev5)
> URL:     [1]https://patchwork.freedesktop.org/series/144298/
> State:   failure
> Details: [2]https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/index.html
> 
> CI Bug Log - changes from XEIGT_8521_FULL -> XEIGTPW_13682_FULL
> 
> Summary
> 
> FAILURE
> 
> Serious unknown changes coming with XEIGTPW_13682_FULL absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in XEIGTPW_13682_FULL, please notify your bug team
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> Participating hosts (4 -> 3)
> 
> Missing (1): shard-adlp
> 
> Possible new issues
> 
> Here are the unknown changes that may have been introduced in
> XEIGTPW_13682_FULL:
> 
> IGT changes
> 
> Possible regressions
> 
>   • igt@xe_exec_sip@sanity-after-timeout:
>       □ shard-bmg: [3]PASS -> [4]TIMEOUT +1 other test timeout
> 
> Warnings
> 
>   • igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
>       □ shard-dg2-set2: [5]ABORT ([6]Intel XE#4917) -> [7]ABORT

This is unrelated to the test that was changed.

Francois

> 
> New tests
> 
> New tests have been introduced between XEIGT_8521_FULL and XEIGTPW_13682_FULL:
> 
> New IGT tests (36)
> 
>   • igt@kms_cursor_crc@cursor-offscreen-128x42@pipe-a-hdmi-a-2:
> 
>       □ Statuses : 1 pass(s)
>       □ Exec time: [2.68] s
>   • igt@kms_cursor_crc@cursor-onscreen-128x42@pipe-a-hdmi-a-2:
> 
>       □ Statuses : 1 pass(s)
>       □ Exec time: [2.47] s
>   • igt@kms_cursor_crc@cursor-sliding-256x85@pipe-a-hdmi-a-2:
> 
>       □ Statuses : 1 pass(s)
>       □ Exec time: [3.91] s
>   • igt@kms_flip@basic-flip-vs-dpms@d-dp2:
> 
>       □ Statuses : 1 pass(s)
>       □ Exec time: [0.70] s
>   • igt@kms_flip@basic-flip-vs-modeset@d-dp2:
> 
>       □ Statuses : 1 pass(s)
>       □ Exec time: [0.74] s
>   • igt@kms_flip@basic-flip-vs-wf_vblank@d-dp2:
> 
>       □ Statuses : 2 pass(s)
>       □ Exec time: [1.02, 1.04] s
>   • igt@kms_plane_cursor@overlay@pipe-b-edp-1-size-128:
> 
>       □ Statuses : 1 pass(s)
>       □ Exec time: [2.88] s
>   • igt@kms_plane_cursor@overlay@pipe-b-edp-1-size-256:
> 
>       □ Statuses : 1 pass(s)
>       □ Exec time: [3.06] s
>   • igt@kms_plane_cursor@overlay@pipe-b-edp-1-size-64:
> 
>       □ Statuses : 1 pass(s)
>       □ Exec time: [3.94] s
>   • igt@kms_plane_cursor@overlay@pipe-c-dp-2-size-128:
> 
>       □ Statuses : 1 pass(s)
>       □ Exec time: [2.95] s
>   • igt@kms_plane_cursor@overlay@pipe-c-dp-2-size-256:
> 
>       □ Statuses : 1 pass(s)
>       □ Exec time: [2.96] s
>   • igt@kms_plane_cursor@overlay@pipe-c-dp-2-size-64:
> 
>       □ Statuses : 1 pass(s)
>       □ Exec time: [3.02] s
>   • igt@kms_plane_cursor@overlay@pipe-c-edp-1-size-128:
> 
>       □ Statuses : 1 pass(s)
>       □ Exec time: [2.53] s
>   • igt@kms_plane_cursor@overlay@pipe-c-edp-1-size-256:
> 
>       □ Statuses : 1 pass(s)
>       □ Exec time: [2.58] s
>   • igt@kms_plane_cursor@overlay@pipe-c-edp-1-size-64:
> 
>       □ Statuses : 1 pass(s)
>       □ Exec time: [3.33] s
>   • igt@kms_plane_cursor@primary@pipe-a-hdmi-a-2-size-128:
> 
>       □ Statuses : 1 fail(s)
>       □ Exec time: [0.42] s
>   • igt@kms_plane_cursor@primary@pipe-a-hdmi-a-2-size-256:
> 
>       □ Statuses : 1 fail(s)
>       □ Exec time: [0.40] s
>   • igt@kms_plane_cursor@primary@pipe-a-hdmi-a-2-size-64:
> 
>       □ Statuses : 1 fail(s)
>       □ Exec time: [0.53] s
>   • igt@kms_plane_cursor@primary@pipe-b-dp-2-size-128:
> 
>       □ Statuses : 1 pass(s)
>       □ Exec time: [2.93] s
>   • igt@kms_plane_cursor@primary@pipe-b-dp-2-size-256:
> 
>       □ Statuses : 1 pass(s)
>       □ Exec time: [2.93] s
>   • igt@kms_plane_cursor@primary@pipe-b-dp-2-size-64:
> 
>       □ Statuses : 1 pass(s)
>       □ Exec time: [2.99] s
>   • igt@kms_plane_cursor@primary@pipe-b-edp-1-size-128:
> 
>       □ Statuses : 1 pass(s)
>       □ Exec time: [2.68] s
>   • igt@kms_plane_cursor@primary@pipe-b-edp-1-size-256:
> 
>       □ Statuses : 1 pass(s)
>       □ Exec time: [2.77] s
>   • igt@kms_plane_cursor@primary@pipe-b-edp-1-size-64:
> 
>       □ Statuses : 1 pass(s)
>       □ Exec time: [3.52] s
>   • igt@kms_plane_cursor@primary@pipe-c-dp-2-size-128:
> 
>       □ Statuses : 1 pass(s)
>       □ Exec time: [2.96] s
>   • igt@kms_plane_cursor@primary@pipe-c-dp-2-size-256:
> 
>       □ Statuses : 1 pass(s)
>       □ Exec time: [2.92] s
>   • igt@kms_plane_cursor@primary@pipe-c-dp-2-size-64:
> 
>       □ Statuses : 1 pass(s)
>       □ Exec time: [2.99] s
>   • igt@kms_plane_cursor@primary@pipe-c-edp-1-size-128:
> 
>       □ Statuses : 1 pass(s)
>       □ Exec time: [2.41] s
>   • igt@kms_plane_cursor@primary@pipe-c-edp-1-size-256:
> 
>       □ Statuses : 1 pass(s)
>       □ Exec time: [2.41] s
>   • igt@kms_plane_cursor@primary@pipe-c-edp-1-size-64:
> 
>       □ Statuses : 1 pass(s)
>       □ Exec time: [3.20] s
>   • igt@kms_plane_cursor@viewport@pipe-b-edp-1-size-128:
> 
>       □ Statuses : 1 pass(s)
>       □ Exec time: [3.08] s
>   • igt@kms_plane_cursor@viewport@pipe-b-edp-1-size-256:
> 
>       □ Statuses : 1 pass(s)
>       □ Exec time: [3.21] s
>   • igt@kms_plane_cursor@viewport@pipe-b-edp-1-size-64:
> 
>       □ Statuses : 1 pass(s)
>       □ Exec time: [4.07] s
>   • igt@kms_plane_cursor@viewport@pipe-c-edp-1-size-128:
> 
>       □ Statuses : 1 pass(s)
>       □ Exec time: [2.76] s
>   • igt@kms_plane_cursor@viewport@pipe-c-edp-1-size-256:
> 
>       □ Statuses : 1 pass(s)
>       □ Exec time: [2.73] s
>   • igt@kms_plane_cursor@viewport@pipe-c-edp-1-size-64:
> 
>       □ Statuses : 1 pass(s)
>       □ Exec time: [3.50] s
> 
> Known issues
> 
> Here are the changes found in XEIGTPW_13682_FULL that come from known issues:
> 
> IGT changes
> 
> Issues hit
> 
>   • igt@kms_async_flips@async-flip-with-page-flip-events-tiled:
> 
>       □ shard-dg2-set2: [8]PASS -> [9]INCOMPLETE ([10]Intel XE#4912)
>   • igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-d-hdmi-a-6-4:
> 
>       □ shard-dg2-set2: NOTRUN -> [11]INCOMPLETE ([12]Intel XE#4912)
>   • igt@kms_big_fb@4-tiled-8bpp-rotate-270:
> 
>       □ shard-dg2-set2: NOTRUN -> [13]SKIP ([14]Intel XE#316)
>   • igt@kms_big_fb@linear-8bpp-rotate-270:
> 
>       □ shard-bmg: NOTRUN -> [15]SKIP ([16]Intel XE#2327) +1 other test skip
>   • igt@kms_big_fb@linear-8bpp-rotate-90:
> 
>       □ shard-lnl: NOTRUN -> [17]SKIP ([18]Intel XE#1407)
>   • igt@kms_big_fb@y-tiled-32bpp-rotate-90:
> 
>       □ shard-dg2-set2: NOTRUN -> [19]SKIP ([20]Intel XE#1124) +1 other test
>         skip
>   • igt@kms_big_fb@yf-tiled-addfb:
> 
>       □ shard-dg2-set2: NOTRUN -> [21]SKIP ([22]Intel XE#619)
>   • igt@kms_big_fb@yf-tiled-addfb-size-overflow:
> 
>       □ shard-bmg: NOTRUN -> [23]SKIP ([24]Intel XE#610)
>   • igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:
> 
>       □ shard-bmg: NOTRUN -> [25]SKIP ([26]Intel XE#1124) +7 other tests skip
>   • igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
> 
>       □ shard-lnl: NOTRUN -> [27]SKIP ([28]Intel XE#1124) +1 other test skip
>   • igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
> 
>       □ shard-bmg: [29]PASS -> [30]SKIP ([31]Intel XE#2314 / [32]Intel XE#2894)
>   • igt@kms_bw@linear-tiling-2-displays-2560x1440p:
> 
>       □ shard-bmg: NOTRUN -> [33]SKIP ([34]Intel XE#367) +1 other test skip
>   • igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:
> 
>       □ shard-dg2-set2: NOTRUN -> [35]SKIP ([36]Intel XE#787) +174 other tests
>         skip
>   • igt@kms_ccs@crc-primary-basic-y-tiled-ccs:
> 
>       □ shard-bmg: NOTRUN -> [37]SKIP ([38]Intel XE#2887) +8 other tests skip
>   • igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc:
> 
>       □ shard-lnl: NOTRUN -> [39]SKIP ([40]Intel XE#2887) +3 other tests skip
>   • igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:
> 
>       □ shard-bmg: NOTRUN -> [41]SKIP ([42]Intel XE#3432) +1 other test skip
>       □ shard-lnl: NOTRUN -> [43]SKIP ([44]Intel XE#3432)
>   • igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-b-dp-2:
> 
>       □ shard-bmg: NOTRUN -> [45]SKIP ([46]Intel XE#2652 / [47]Intel XE#787) +3
>         other tests skip
>   • igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
> 
>       □ shard-dg2-set2: NOTRUN -> [48]SKIP ([49]Intel XE#455 / [50]Intel XE#787
>         ) +28 other tests skip
>   • igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
> 
>       □ shard-dg2-set2: [51]PASS -> [52]INCOMPLETE ([53]Intel XE#1727 / [54]
>         Intel XE#3113 / [55]Intel XE#4212 / [56]Intel XE#4345 / [57]Intel XE#
>         4522)
>   • igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4:
> 
>       □ shard-dg2-set2: NOTRUN -> [58]INCOMPLETE ([59]Intel XE#1727 / [60]Intel
>         XE#3113 / [61]Intel XE#4212 / [62]Intel XE#4522)
>   • igt@kms_chamelium_color@ctm-limited-range:
> 
>       □ shard-bmg: NOTRUN -> [63]SKIP ([64]Intel XE#2325)
>   • igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k:
> 
>       □ shard-lnl: NOTRUN -> [65]SKIP ([66]Intel XE#373) +2 other tests skip
>   • igt@kms_chamelium_hpd@dp-hpd-storm-disable:
> 
>       □ shard-bmg: NOTRUN -> [67]SKIP ([68]Intel XE#2252) +3 other tests skip
>   • igt@kms_content_protection@legacy@pipe-a-dp-2:
> 
>       □ shard-dg2-set2: NOTRUN -> [69]FAIL ([70]Intel XE#1178)
>   • igt@kms_content_protection@lic-type-0@pipe-a-dp-4:
> 
>       □ shard-dg2-set2: NOTRUN -> [71]FAIL ([72]Intel XE#3304)
>   • igt@kms_content_protection@srm@pipe-a-dp-2:
> 
>       □ shard-bmg: NOTRUN -> [73]FAIL ([74]Intel XE#1178) +1 other test fail
>   • igt@kms_content_protection@uevent@pipe-a-dp-2:
> 
>       □ shard-dg2-set2: NOTRUN -> [75]FAIL ([76]Intel XE#1188)
>   • igt@kms_cursor_crc@cursor-offscreen-128x42:
> 
>       □ shard-bmg: NOTRUN -> [77]SKIP ([78]Intel XE#2320) +1 other test skip
>   • igt@kms_cursor_crc@cursor-offscreen-512x512:
> 
>       □ shard-lnl: NOTRUN -> [79]SKIP ([80]Intel XE#2321)
>   • igt@kms_cursor_crc@cursor-random-512x170:
> 
>       □ shard-bmg: NOTRUN -> [81]SKIP ([82]Intel XE#2321)
>   • igt@kms_cursor_crc@cursor-sliding-128x42:
> 
>       □ shard-lnl: NOTRUN -> [83]SKIP ([84]Intel XE#1424) +1 other test skip
>   • igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
> 
>       □ shard-lnl: NOTRUN -> [85]SKIP ([86]Intel XE#309)
>   • igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
> 
>       □ shard-bmg: [87]PASS -> [88]SKIP ([89]Intel XE#2291) +5 other tests skip
>   • igt@kms_cursor_legacy@flip-vs-cursor-atomic:
> 
>       □ shard-bmg: [90]PASS -> [91]FAIL ([92]Intel XE#4633)
>   • igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
> 
>       □ shard-bmg: NOTRUN -> [93]SKIP ([94]Intel XE#2286)
>   • igt@kms_display_modes@extended-mode-basic:
> 
>       □ shard-bmg: NOTRUN -> [95]SKIP ([96]Intel XE#4302)
>   • igt@kms_dsc@dsc-with-formats:
> 
>       □ shard-bmg: NOTRUN -> [97]SKIP ([98]Intel XE#2244)
>   • igt@kms_feature_discovery@display-4x:
> 
>       □ shard-lnl: NOTRUN -> [99]SKIP ([100]Intel XE#1138)
>   • igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
> 
>       □ shard-bmg: NOTRUN -> [101]SKIP ([102]Intel XE#2316)
>   • igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
> 
>       □ shard-lnl: NOTRUN -> [103]SKIP ([104]Intel XE#1421) +1 other test skip
>   • igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
> 
>       □ shard-bmg: [105]PASS -> [106]SKIP ([107]Intel XE#2316) +5 other tests
>         skip
>   • igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:
> 
>       □ shard-bmg: NOTRUN -> [108]SKIP ([109]Intel XE#2293) +1 other test skip
>   • igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
> 
>       □ shard-lnl: NOTRUN -> [110]SKIP ([111]Intel XE#1401 / [112]Intel XE#1745
>         )
>   • igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-default-mode:
> 
>       □ shard-lnl: NOTRUN -> [113]SKIP ([114]Intel XE#1401)
>   • igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
> 
>       □ shard-bmg: NOTRUN -> [115]SKIP ([116]Intel XE#2293 / [117]Intel XE#2380
>         ) +1 other test skip
>   • igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:
> 
>       □ shard-dg2-set2: NOTRUN -> [118]SKIP ([119]Intel XE#455) +4 other tests
>         skip
>   • igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-fullscreen:
> 
>       □ shard-bmg: NOTRUN -> [120]SKIP ([121]Intel XE#2312) +3 other tests skip
>   • igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff:
> 
>       □ shard-lnl: NOTRUN -> [122]SKIP ([123]Intel XE#656) +7 other tests skip
>   • igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render:
> 
>       □ shard-bmg: NOTRUN -> [124]SKIP ([125]Intel XE#2311) +18 other tests
>         skip
>   • igt@kms_frontbuffer_tracking@drrs-suspend:
> 
>       □ shard-dg2-set2: NOTRUN -> [126]SKIP ([127]Intel XE#651) +7 other tests
>         skip
>   • igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:
> 
>       □ shard-bmg: NOTRUN -> [128]SKIP ([129]Intel XE#5390) +10 other tests
>         skip
>   • igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-render:
> 
>       □ shard-lnl: NOTRUN -> [130]SKIP ([131]Intel XE#651) +3 other tests skip
>   • igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:
> 
>       □ shard-bmg: NOTRUN -> [132]SKIP ([133]Intel XE#2313) +13 other tests
>         skip
>   • igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc:
> 
>       □ shard-dg2-set2: NOTRUN -> [134]SKIP ([135]Intel XE#653) +3 other tests
>         skip
>   • igt@kms_joiner@invalid-modeset-force-big-joiner:
> 
>       □ shard-bmg: [136]PASS -> [137]SKIP ([138]Intel XE#3012)
>   • igt@kms_pipe_stress@stress-xrgb8888-ytiled:
> 
>       □ shard-lnl: NOTRUN -> [139]SKIP ([140]Intel XE#4329)
>   • igt@kms_plane_cursor@primary@pipe-a-hdmi-a-2-size-256 (NEW):
> 
>       □ shard-dg2-set2: NOTRUN -> [141]FAIL ([142]Intel XE#616) +2 other tests
>         fail
>   • igt@kms_plane_multiple@2x-tiling-4:
> 
>       □ shard-bmg: [143]PASS -> [144]SKIP ([145]Intel XE#4596)
>   • igt@kms_plane_multiple@2x-tiling-yf:
> 
>       □ shard-lnl: NOTRUN -> [146]SKIP ([147]Intel XE#4596)
>   • igt@kms_pm_backlight@basic-brightness:
> 
>       □ shard-bmg: NOTRUN -> [148]SKIP ([149]Intel XE#870)
>   • igt@kms_pm_backlight@brightness-with-dpms:
> 
>       □ shard-bmg: NOTRUN -> [150]SKIP ([151]Intel XE#2938)
>   • igt@kms_pm_dc@dc3co-vpb-simulation:
> 
>       □ shard-lnl: NOTRUN -> [152]SKIP ([153]Intel XE#736)
>   • igt@kms_pm_dc@dc5-dpms:
> 
>       □ shard-lnl: [154]PASS -> [155]FAIL ([156]Intel XE#718) +1 other test
>         fail
>   • igt@kms_pm_lpsp@kms-lpsp:
> 
>       □ shard-bmg: NOTRUN -> [157]SKIP ([158]Intel XE#2499)
>   • igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:
> 
>       □ shard-lnl: NOTRUN -> [159]SKIP ([160]Intel XE#1406 / [161]Intel XE#2893
>         ) +1 other test skip
>   • igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
> 
>       □ shard-bmg: NOTRUN -> [162]SKIP ([163]Intel XE#1406 / [164]Intel XE#1489
>         ) +4 other tests skip
>   • igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
> 
>       □ shard-dg2-set2: NOTRUN -> [165]SKIP ([166]Intel XE#1406 / [167]Intel XE
>         #1489) +3 other tests skip
>   • igt@kms_psr2_su@frontbuffer-xrgb8888:
> 
>       □ shard-bmg: NOTRUN -> [168]SKIP ([169]Intel XE#1406 / [170]Intel XE#2387
>         )
>   • igt@kms_psr@fbc-psr2-no-drrs:
> 
>       □ shard-dg2-set2: NOTRUN -> [171]SKIP ([172]Intel XE#1406 / [173]Intel XE
>         #2850 / [174]Intel XE#929) +2 other tests skip
>   • igt@kms_psr@fbc-psr2-sprite-plane-onoff@edp-1:
> 
>       □ shard-lnl: NOTRUN -> [175]SKIP ([176]Intel XE#1406 / [177]Intel XE#4609
>         )
>   • igt@kms_psr@pr-primary-blt:
> 
>       □ shard-lnl: NOTRUN -> [178]SKIP ([179]Intel XE#1406) +1 other test skip
>   • igt@kms_psr@psr-primary-page-flip:
> 
>       □ shard-bmg: NOTRUN -> [180]SKIP ([181]Intel XE#1406 / [182]Intel XE#2234
>         / [183]Intel XE#2850) +9 other tests skip
>   • igt@kms_rotation_crc@primary-rotation-270:
> 
>       □ shard-dg2-set2: NOTRUN -> [184]SKIP ([185]Intel XE#3414)
>   • igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
> 
>       □ shard-bmg: NOTRUN -> [186]SKIP ([187]Intel XE#2330)
>   • igt@kms_rotation_crc@sprite-rotation-270:
> 
>       □ shard-lnl: NOTRUN -> [188]SKIP ([189]Intel XE#3414 / [190]Intel XE#3904
>         )
>   • igt@kms_setmode@invalid-clone-single-crtc-stealing:
> 
>       □ shard-lnl: NOTRUN -> [191]SKIP ([192]Intel XE#1435)
>   • igt@kms_vrr@max-min:
> 
>       □ shard-bmg: NOTRUN -> [193]SKIP ([194]Intel XE#1499) +1 other test skip
>   • igt@xe_eudebug@basic-vm-access-userptr-faultable:
> 
>       □ shard-dg2-set2: NOTRUN -> [195]SKIP ([196]Intel XE#4837) +2 other tests
>         skip
>   • igt@xe_eudebug@basic-vm-bind:
> 
>       □ shard-lnl: NOTRUN -> [197]SKIP ([198]Intel XE#4837) +1 other test skip
>   • igt@xe_eudebug@discovery-empty:
> 
>       □ shard-bmg: NOTRUN -> [199]SKIP ([200]Intel XE#4837) +7 other tests skip
>   • igt@xe_eudebug_sriov@deny-sriov:
> 
>       □ shard-dg2-set2: NOTRUN -> [201]SKIP ([202]Intel XE#4518)
>   • igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:
> 
>       □ shard-bmg: NOTRUN -> [203]SKIP ([204]Intel XE#2322) +6 other tests skip
>       □ shard-dg2-set2: NOTRUN -> [205]SKIP ([206]Intel XE#1392)
>   • igt@xe_exec_basic@multigpu-once-null:
> 
>       □ shard-dg2-set2: [207]PASS -> [208]SKIP ([209]Intel XE#1392) +3 other
>         tests skip
>   • igt@xe_exec_basic@multigpu-once-userptr-invalidate:
> 
>       □ shard-lnl: NOTRUN -> [210]SKIP ([211]Intel XE#1392) +3 other tests skip
>   • igt@xe_exec_fault_mode@twice-userptr-imm:
> 
>       □ shard-dg2-set2: NOTRUN -> [212]SKIP ([213]Intel XE#288) +1 other test
>         skip
>   • igt@xe_exec_system_allocator@many-free:
> 
>       □ shard-bmg: [214]PASS -> [215]ABORT ([216]Intel XE#5790)
>   • igt@xe_exec_system_allocator@many-large-malloc-nomemset:
> 
>       □ shard-dg2-set2: NOTRUN -> [217]SKIP ([218]Intel XE#4915) +53 other
>         tests skip
>   • igt@xe_exec_system_allocator@partial-middle-remap-no-cpu-fault:
> 
>       □ shard-bmg: [219]PASS -> [220]FAIL ([221]Intel XE#4937)
>   • igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-free-huge-nomemset:
> 
>       □ shard-lnl: NOTRUN -> [222]SKIP ([223]Intel XE#4943) +2 other tests skip
>   • igt@xe_exec_system_allocator@threads-many-mmap-new-huge-nomemset:
> 
>       □ shard-bmg: NOTRUN -> [224]SKIP ([225]Intel XE#4943) +10 other tests
>         skip
>   • igt@xe_exec_threads@threads-hang-rebind:
> 
>       □ shard-dg2-set2: [226]PASS -> [227]DMESG-WARN ([228]Intel XE#3876)
>   • igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:
> 
>       □ shard-dg2-set2: [229]PASS -> [230]DMESG-WARN ([231]Intel XE#5893)
>   • igt@xe_live_ktest@xe_eudebug:
> 
>       □ shard-bmg: NOTRUN -> [232]SKIP ([233]Intel XE#2833)
>   • igt@xe_mmap@pci-membarrier-bad-object:
> 
>       □ shard-lnl: NOTRUN -> [234]SKIP ([235]Intel XE#5100)
>   • igt@xe_oa@create-destroy-userspace-config:
> 
>       □ shard-dg2-set2: NOTRUN -> [236]SKIP ([237]Intel XE#3573)
>   • igt@xe_oa@oa-tlb-invalidate:
> 
>       □ shard-bmg: NOTRUN -> [238]SKIP ([239]Intel XE#2248)
>   • igt@xe_pm@d3cold-basic:
> 
>       □ shard-bmg: NOTRUN -> [240]SKIP ([241]Intel XE#2284) +1 other test skip
>   • igt@xe_pm@d3cold-mocs:
> 
>       □ shard-lnl: NOTRUN -> [242]SKIP ([243]Intel XE#2284)
>   • igt@xe_pm@s2idle-exec-after:
> 
>       □ shard-bmg: [244]PASS -> [245]DMESG-FAIL ([246]Intel XE#5545)
>   • igt@xe_pxp@regular-src-to-pxp-dest-rendercopy:
> 
>       □ shard-bmg: NOTRUN -> [247]SKIP ([248]Intel XE#4733) +2 other tests skip
>   • igt@xe_query@multigpu-query-mem-usage:
> 
>       □ shard-bmg: NOTRUN -> [249]SKIP ([250]Intel XE#944)
>   • igt@xe_query@multigpu-query-topology-l3-bank-mask:
> 
>       □ shard-lnl: NOTRUN -> [251]SKIP ([252]Intel XE#944) +1 other test skip
>   • igt@xe_render_copy@render-stress-1-copies:
> 
>       □ shard-dg2-set2: NOTRUN -> [253]SKIP ([254]Intel XE#4814)
> 
> Possible fixes
> 
>   • igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1:
> 
>       □ shard-lnl: [255]FAIL ([256]Intel XE#5993) -> [257]PASS +3 other tests
>         pass
>   • igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
> 
>       □ shard-bmg: [258]SKIP ([259]Intel XE#2291) -> [260]PASS +2 other tests
>         pass
>   • igt@kms_cursor_legacy@flip-vs-cursor-toggle:
> 
>       □ shard-bmg: [261]DMESG-WARN ([262]Intel XE#5354) -> [263]PASS +1 other
>         test pass
>   • igt@kms_dither@fb-8bpc-vs-panel-6bpc:
> 
>       □ shard-bmg: [264]SKIP ([265]Intel XE#1340) -> [266]PASS
>   • igt@kms_flip@2x-plain-flip-fb-recreate:
> 
>       □ shard-bmg: [267]SKIP ([268]Intel XE#2316) -> [269]PASS +1 other test
>         pass
>   • igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4:
> 
>       □ shard-dg2-set2: [270]FAIL ([271]Intel XE#301) -> [272]PASS +1 other
>         test pass
>   • igt@kms_flip@flip-vs-expired-vblank@a-edp1:
> 
>       □ shard-lnl: [273]FAIL ([274]Intel XE#301) -> [275]PASS
>   • igt@kms_flip@flip-vs-expired-vblank@c-edp1:
> 
>       □ shard-lnl: [276]FAIL ([277]Intel XE#301 / [278]Intel XE#3149) -> [279]
>         PASS +1 other test pass
>   • igt@kms_flip@flip-vs-suspend-interruptible:
> 
>       □ shard-dg2-set2: [280]INCOMPLETE ([281]Intel XE#2049 / [282]Intel XE#
>         2597) -> [283]PASS +1 other test pass
>   • igt@kms_hdr@static-swap:
> 
>       □ shard-bmg: [284]SKIP ([285]Intel XE#1503) -> [286]PASS +2 other tests
>         pass
>   • igt@kms_plane_cursor@viewport:
> 
>       □ shard-dg2-set2: [287]FAIL ([288]Intel XE#616) -> [289]PASS +1 other
>         test pass
>   • igt@kms_setmode@clone-exclusive-crtc:
> 
>       □ shard-bmg: [290]SKIP ([291]Intel XE#1435) -> [292]PASS
>   • igt@xe_exec_basic@many-null-defer-mmap:
> 
>       □ shard-bmg: [293]FAIL -> [294]PASS
>   • igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
> 
>       □ shard-dg2-set2: [295]SKIP ([296]Intel XE#1392) -> [297]PASS +8 other
>         tests pass
>   • igt@xe_exec_system_allocator@process-many-mmap-remap-ro-dontunmap:
> 
>       □ shard-bmg: [298]ABORT ([299]Intel XE#3970) -> [300]PASS
>   • igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:
> 
>       □ shard-bmg: [301]FAIL ([302]Intel XE#6006) -> [303]PASS +1 other test
>         pass
> 
> Warnings
> 
>   • igt@kms_content_protection@srm:
> 
>       □ shard-bmg: [304]SKIP ([305]Intel XE#2341) -> [306]FAIL ([307]Intel XE#
>         1178) +1 other test fail
>   • igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:
> 
>       □ shard-bmg: [308]SKIP ([309]Intel XE#2312) -> [310]SKIP ([311]Intel XE#
>         2311) +13 other tests skip
>   • igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
> 
>       □ shard-bmg: [312]SKIP ([313]Intel XE#2311) -> [314]SKIP ([315]Intel XE#
>         2312) +11 other tests skip
>   • igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:
> 
>       □ shard-bmg: [316]SKIP ([317]Intel XE#2312) -> [318]SKIP ([319]Intel XE#
>         5390) +3 other tests skip
>   • igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
> 
>       □ shard-bmg: [320]SKIP ([321]Intel XE#5390) -> [322]SKIP ([323]Intel XE#
>         2312) +5 other tests skip
>   • igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt:
> 
>       □ shard-bmg: [324]SKIP ([325]Intel XE#2312) -> [326]SKIP ([327]Intel XE#
>         2313) +10 other tests skip
>   • igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
> 
>       □ shard-bmg: [328]SKIP ([329]Intel XE#2313) -> [330]SKIP ([331]Intel XE#
>         2312) +9 other tests skip
>   • igt@kms_tiled_display@basic-test-pattern:
> 
>       □ shard-bmg: [332]FAIL ([333]Intel XE#1729) -> [334]SKIP ([335]Intel XE#
>         2426)
>   • igt@kms_tiled_display@basic-test-pattern-with-chamelium:
> 
>       □ shard-bmg: [336]SKIP ([337]Intel XE#2426) -> [338]SKIP ([339]Intel XE#
>         2509)
>   • igt@xe_pmu@fn-engine-activity-sched-if-idle:
> 
>       □ shard-bmg: [340]ABORT ([341]Intel XE#3970) -> [342]DMESG-WARN ([343]
>         Intel XE#3876)
> 
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> Build changes
> 
>   • IGT: IGT_8521 -> IGTPW_13682
> 
> IGTPW_13682: 13682
> IGT_8521: 8521
> xe-3672-09933716bb37eda75f5b3562a76e58a17c447647:
> 09933716bb37eda75f5b3562a76e58a17c447647
> 
> 
> References:
> 
> [1] https://patchwork.freedesktop.org/series/144298/
> [2] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/index.html
> [3] https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8521/shard-bmg-4/igt@xe_exec_sip@sanity-after-timeout.html
> [4] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-bmg-4/igt@xe_exec_sip@sanity-after-timeout.html
> [5] https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8521/shard-dg2-433/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
> [6] https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917
> [7] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-dg2-436/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
> [8] https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8521/shard-dg2-432/igt@kms_async_flips@async-flip-with-page-flip-events-tiled.html
> [9] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-dg2-463/igt@kms_async_flips@async-flip-with-page-flip-events-tiled.html
> [10] https://gitlab.freedesktop.org/drm/xe/kernel/issues/4912
> [11] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-dg2-463/igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-d-hdmi-a-6-4.html
> [12] https://gitlab.freedesktop.org/drm/xe/kernel/issues/4912
> [13] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-dg2-434/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html
> [14] https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
> [15] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-bmg-3/igt@kms_big_fb@linear-8bpp-rotate-270.html
> [16] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
> [17] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-lnl-4/igt@kms_big_fb@linear-8bpp-rotate-90.html
> [18] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
> [19] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-dg2-436/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html
> [20] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
> [21] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb.html
> [22] https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
> [23] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-bmg-6/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
> [24] https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
> [25] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-bmg-4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html
> [26] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
> [27] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-lnl-3/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
> [28] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
> [29] https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8521/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
> [30] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
> [31] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
> [32] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
> [33] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-bmg-1/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html
> [34] https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
> [35] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-dg2-463/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html
> [36] https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
> [37] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-bmg-1/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html
> [38] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
> [39] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-lnl-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc.html
> [40] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
> [41] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html
> [42] https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
> [43] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-lnl-3/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html
> [44] https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
> [45] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-bmg-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-b-dp-2.html
> [46] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
> [47] https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
> [48] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-dg2-436/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html
> [49] https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
> [50] https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
> [51] https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8521/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
> [52] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
> [53] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
> [54] https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
> [55] https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
> [56] https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
> [57] https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
> [58] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html
> [59] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
> [60] https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
> [61] https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
> [62] https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
> [63] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-bmg-6/igt@kms_chamelium_color@ctm-limited-range.html
> [64] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
> [65] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-lnl-4/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html
> [66] https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
> [67] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-bmg-6/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html
> [68] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
> [69] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-dg2-432/igt@kms_content_protection@legacy@pipe-a-dp-2.html
> [70] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
> [71] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-dg2-434/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html
> [72] https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
> [73] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-bmg-2/igt@kms_content_protection@srm@pipe-a-dp-2.html
> [74] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
> [75] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-dg2-432/igt@kms_content_protection@uevent@pipe-a-dp-2.html
> [76] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
> [77] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-128x42.html
> [78] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
> [79] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-lnl-2/igt@kms_cursor_crc@cursor-offscreen-512x512.html
> [80] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
> [81] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-bmg-1/igt@kms_cursor_crc@cursor-random-512x170.html
> [82] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
> [83] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-lnl-7/igt@kms_cursor_crc@cursor-sliding-128x42.html
> [84] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
> [85] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-lnl-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
> [86] https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
> [87] https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8521/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
> [88] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
> [89] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
> [90] https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8521/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
> [91] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
> [92] https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633
> [93] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-bmg-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
> [94] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
> [95] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html
> [96] https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
> [97] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-bmg-1/igt@kms_dsc@dsc-with-formats.html
> [98] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
> [99] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-lnl-7/igt@kms_feature_discovery@display-4x.html
> [100] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
> [101] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
> [102] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
> [103] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-lnl-8/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html
> [104] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
> [105] https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8521/shard-bmg-8/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html
> [106] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-bmg-6/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html
> [107] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
> [108] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html
> [109] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
> [110] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html
> [111] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
> [112] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
> [113] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-default-mode.html
> [114] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
> [115] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html
> [116] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
> [117] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
> [118] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html
> [119] https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
> [120] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-fullscreen.html
> [121] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
> [122] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html
> [123] https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
> [124] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render.html
> [125] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
> [126] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-suspend.html
> [127] https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
> [128] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html
> [129] https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
> [130] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-render.html
> [131] https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
> [132] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html
> [133] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
> [134] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc.html
> [135] https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
> [136] https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8521/shard-bmg-2/igt@kms_joiner@invalid-modeset-force-big-joiner.html
> [137] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html
> [138] https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
> [139] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-lnl-2/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
> [140] https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329
> [141] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-dg2-432/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-2-size-256.html
> [142] https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
> [143] https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8521/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-4.html
> [144] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-4.html
> [145] https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
> [146] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-lnl-3/igt@kms_plane_multiple@2x-tiling-yf.html
> [147] https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
> [148] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-bmg-1/igt@kms_pm_backlight@basic-brightness.html
> [149] https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
> [150] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-bmg-2/igt@kms_pm_backlight@brightness-with-dpms.html
> [151] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
> [152] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-lnl-8/igt@kms_pm_dc@dc3co-vpb-simulation.html
> [153] https://gitlab.freedesktop.org/drm/xe/kernel/issues/736
> [154] https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8521/shard-lnl-2/igt@kms_pm_dc@dc5-dpms.html
> [155] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-lnl-8/igt@kms_pm_dc@dc5-dpms.html
> [156] https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
> [157] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-bmg-2/igt@kms_pm_lpsp@kms-lpsp.html
> [158] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499
> [159] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-lnl-1/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html
> [160] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
> [161] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
> [162] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-bmg-4/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html
> [163] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
> [164] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
> [165] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-dg2-434/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html
> [166] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
> [167] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
> [168] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-bmg-2/igt@kms_psr2_su@frontbuffer-xrgb8888.html
> [169] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
> [170] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
> [171] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-dg2-464/igt@kms_psr@fbc-psr2-no-drrs.html
> [172] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
> [173] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
> [174] https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
> [175] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-lnl-4/igt@kms_psr@fbc-psr2-sprite-plane-onoff@edp-1.html
> [176] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
> [177] https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
> [178] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-lnl-8/igt@kms_psr@pr-primary-blt.html
> [179] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
> [180] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-bmg-3/igt@kms_psr@psr-primary-page-flip.html
> [181] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
> [182] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
> [183] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
> [184] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-dg2-436/igt@kms_rotation_crc@primary-rotation-270.html
> [185] https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
> [186] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-bmg-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
> [187] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
> [188] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-lnl-2/igt@kms_rotation_crc@sprite-rotation-270.html
> [189] https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
> [190] https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
> [191] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-lnl-5/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
> [192] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
> [193] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-bmg-6/igt@kms_vrr@max-min.html
> [194] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
> [195] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-dg2-466/igt@xe_eudebug@basic-vm-access-userptr-faultable.html
> [196] https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
> [197] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-lnl-8/igt@xe_eudebug@basic-vm-bind.html
> [198] https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
> [199] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-bmg-1/igt@xe_eudebug@discovery-empty.html
> [200] https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
> [201] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-dg2-433/igt@xe_eudebug_sriov@deny-sriov.html
> [202] https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518
> [203] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-bmg-4/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html
> [204] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
> [205] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html
> [206] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
> [207] https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8521/shard-dg2-435/igt@xe_exec_basic@multigpu-once-null.html
> [208] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-dg2-432/igt@xe_exec_basic@multigpu-once-null.html
> [209] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
> [210] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-lnl-2/igt@xe_exec_basic@multigpu-once-userptr-invalidate.html
> [211] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
> [212] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-dg2-433/igt@xe_exec_fault_mode@twice-userptr-imm.html
> [213] https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
> [214] https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8521/shard-bmg-1/igt@xe_exec_system_allocator@many-free.html
> [215] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-bmg-4/igt@xe_exec_system_allocator@many-free.html
> [216] https://gitlab.freedesktop.org/drm/xe/kernel/issues/5790
> [217] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-dg2-432/igt@xe_exec_system_allocator@many-large-malloc-nomemset.html
> [218] https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
> [219] https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8521/shard-bmg-8/igt@xe_exec_system_allocator@partial-middle-remap-no-cpu-fault.html
> [220] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-bmg-1/igt@xe_exec_system_allocator@partial-middle-remap-no-cpu-fault.html
> [221] https://gitlab.freedesktop.org/drm/xe/kernel/issues/4937
> [222] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-lnl-4/igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-free-huge-nomemset.html
> [223] https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
> [224] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-bmg-7/igt@xe_exec_system_allocator@threads-many-mmap-new-huge-nomemset.html
> [225] https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
> [226] https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8521/shard-dg2-433/igt@xe_exec_threads@threads-hang-rebind.html
> [227] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-dg2-463/igt@xe_exec_threads@threads-hang-rebind.html
> [228] https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
> [229] https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8521/shard-dg2-432/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html
> [230] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-dg2-463/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html
> [231] https://gitlab.freedesktop.org/drm/xe/kernel/issues/5893
> [232] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-bmg-1/igt@xe_live_ktest@xe_eudebug.html
> [233] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833
> [234] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-lnl-7/igt@xe_mmap@pci-membarrier-bad-object.html
> [235] https://gitlab.freedesktop.org/drm/xe/kernel/issues/5100
> [236] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-dg2-435/igt@xe_oa@create-destroy-userspace-config.html
> [237] https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
> [238] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-bmg-4/igt@xe_oa@oa-tlb-invalidate.html
> [239] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248
> [240] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-bmg-4/igt@xe_pm@d3cold-basic.html
> [241] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
> [242] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-lnl-1/igt@xe_pm@d3cold-mocs.html
> [243] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
> [244] https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8521/shard-bmg-3/igt@xe_pm@s2idle-exec-after.html
> [245] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-bmg-4/igt@xe_pm@s2idle-exec-after.html
> [246] https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
> [247] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-bmg-2/igt@xe_pxp@regular-src-to-pxp-dest-rendercopy.html
> [248] https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
> [249] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-bmg-6/igt@xe_query@multigpu-query-mem-usage.html
> [250] https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
> [251] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-lnl-7/igt@xe_query@multigpu-query-topology-l3-bank-mask.html
> [252] https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
> [253] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-dg2-464/igt@xe_render_copy@render-stress-1-copies.html
> [254] https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814
> [255] https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8521/shard-lnl-8/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html
> [256] https://gitlab.freedesktop.org/drm/xe/kernel/issues/5993
> [257] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-lnl-3/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html
> [258] https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8521/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
> [259] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
> [260] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-bmg-5/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
> [261] https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8521/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
> [262] https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354
> [263] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
> [264] https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8521/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
> [265] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
> [266] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-bmg-4/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
> [267] https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8521/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate.html
> [268] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
> [269] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-bmg-5/igt@kms_flip@2x-plain-flip-fb-recreate.html
> [270] https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8521/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4.html
> [271] https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
> [272] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4.html
> [273] https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8521/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
> [274] https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
> [275] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
> [276] https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8521/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
> [277] https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
> [278] https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
> [279] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
> [280] https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8521/shard-dg2-435/igt@kms_flip@flip-vs-suspend-interruptible.html
> [281] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
> [282] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
> [283] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-dg2-436/igt@kms_flip@flip-vs-suspend-interruptible.html
> [284] https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8521/shard-bmg-6/igt@kms_hdr@static-swap.html
> [285] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
> [286] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-bmg-7/igt@kms_hdr@static-swap.html
> [287] https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8521/shard-dg2-433/igt@kms_plane_cursor@viewport.html
> [288] https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
> [289] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-dg2-463/igt@kms_plane_cursor@viewport.html
> [290] https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8521/shard-bmg-6/igt@kms_setmode@clone-exclusive-crtc.html
> [291] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
> [292] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-bmg-3/igt@kms_setmode@clone-exclusive-crtc.html
> [293] https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8521/shard-bmg-6/igt@xe_exec_basic@many-null-defer-mmap.html
> [294] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-bmg-1/igt@xe_exec_basic@many-null-defer-mmap.html
> [295] https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8521/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html
> [296] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
> [297] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-dg2-435/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html
> [298] https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8521/shard-bmg-5/igt@xe_exec_system_allocator@process-many-mmap-remap-ro-dontunmap.html
> [299] https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970
> [300] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-bmg-6/igt@xe_exec_system_allocator@process-many-mmap-remap-ro-dontunmap.html
> [301] https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8521/shard-bmg-4/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html
> [302] https://gitlab.freedesktop.org/drm/xe/kernel/issues/6006
> [303] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-bmg-5/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html
> [304] https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8521/shard-bmg-6/igt@kms_content_protection@srm.html
> [305] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
> [306] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-bmg-2/igt@kms_content_protection@srm.html
> [307] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
> [308] https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8521/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html
> [309] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
> [310] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html
> [311] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
> [312] https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8521/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
> [313] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
> [314] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
> [315] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
> [316] https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8521/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html
> [317] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
> [318] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html
> [319] https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
> [320] https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8521/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
> [321] https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
> [322] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
> [323] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
> [324] https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8521/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt.html
> [325] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
> [326] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt.html
> [327] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
> [328] https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8521/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
> [329] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
> [330] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
> [331] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
> [332] https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8521/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html
> [333] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
> [334] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern.html
> [335] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
> [336] https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8521/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> [337] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
> [338] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> [339] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
> [340] https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8521/shard-bmg-5/igt@xe_pmu@fn-engine-activity-sched-if-idle.html
> [341] https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970
> [342] https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13682/shard-bmg-3/igt@xe_pmu@fn-engine-activity-sched-if-idle.html
> [343] https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
