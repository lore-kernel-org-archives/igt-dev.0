Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDFB7CD6E6E
	for <igt-dev@archiver.kernel.org>; Thu, 13 Nov 2025 14:09:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6519F10E824;
	Thu, 13 Nov 2025 14:09:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IDvUqkD+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6738B10E824
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Nov 2025 14:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763042949; x=1794578949;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=BoUQqxdCSuuJnOHCjyEaPQWvwX6nXjZ8OW796Te8xJ4=;
 b=IDvUqkD+vUtDsmY/y/7OXGAZK2ecpIG76rhc4CvBRRCKS/luJk4eUMH/
 9TeiJwJoyxIDsQvVflgdCF/MBV1P8EjrZlEsuKvKnLSP2+OGm74tO1JJx
 uPsqK7p9oFM2w3BTKMbNKcODnKsbP6gjVIyZpThdpCruPis+xjta5Klyb
 qTxz7rBJlDOpcUG/dZ1vyh9DPBDejaNoEVu46bK3LdOT+cIz6+pEz4WFn
 OQMvm4awGATi4ikfzoR7AGpQzNEeqaXw0e4ctlgn8pDO/U0G6R6XHN+Ql
 D74KFY1vUCgjedWrvszysAp0zsp6YUlFyANwPxkrutOYb0N41vQ+kgD2T Q==;
X-CSE-ConnectionGUID: t+OEfCNYSIWwvKh6RJimZg==
X-CSE-MsgGUID: vAdQp0V8Sfa7RFiVmyTFZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="82517761"
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="82517761"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 06:09:08 -0800
X-CSE-ConnectionGUID: WILm8Q/GQJmOP+BSvFNR9A==
X-CSE-MsgGUID: N39muUr4QpO9WkkSwDQwaQ==
X-ExtLoop1: 1
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 06:09:07 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 06:09:07 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 13 Nov 2025 06:09:07 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.29) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 06:09:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U+viVEKwJYGcakxWwE6oOTfCxF/A/2ldFNbu/XZm+bguZ80lt7JfSzh8DbRIKl5lDpJ9jEkVZ543q3kYugXKuyZVHcxy5qMGJ7qUIuCtbAmLEP8iDYq6btJWzouM9avbtaLrmbX51AyBSO5fAn5Ydtzv5coT8RKezQEZRnnnMWws5bHhuMdSc4pa51dkdmbULiubeoh3QQOY0G34LkkmCGip7djR2zmfx/H4OXBv1YaHDN4PnCadY/97Jp9Y9v7BWZKhttuBVLYjWH4dodpaZ3V7dw2q1AyMF+f9/Sc//m3tWKqFJ7YercBhxp1BdjiBzbk2Nw3K1bU5NXseomVV+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pFJIWVqXMH9jqJIeJ9LE1FUiRORAfSLN62hY4uP+YzQ=;
 b=UD3bLegI0Iphwkm/Q9xkbPNs9y9zfjqOtdkNgMadafA50YUuwj3XTUQ4NLfNEtGSNwB7CIGryGzsn8OHaqiXSKFx6/rrfCn38Y+8aVgU18SfXzV9QZ42TqkMKhxPt6KeRgJnLQ2SBCtRU+6FhYY+s/wlFZZfox9tN5CWrsWVXHIxhdiWlH2SQx4F6TungxkhKawgoHL3hMn0es3OFghEEDyQrHzQQX7NbafrgATsHk2eRnepUpp9o9oKF7+uqimBu0jn8mJSGo9FQvDCqjY3FrLJkTGLaBxuC4gZ6EBW4ui+EI+3+vuj6C3Hf+qWjZPoopoVvJXaQJ++s0vxIo+sOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by SN7PR11MB7640.namprd11.prod.outlook.com (2603:10b6:806:341::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Thu, 13 Nov
 2025 14:09:03 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::c0b4:f63a:9c33:ec4a]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::c0b4:f63a:9c33:ec4a%7]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 14:09:03 +0000
Date: Thu, 13 Nov 2025 19:38:56 +0530
From: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] xe_exercise_blt: Insert a flush between two
 consecutive FAST_COPY
Message-ID: <aRXmeM71a30uUiqL@bvivekan-mobl1>
References: <20251110135805.3620715-3-balasubramani.vivekanandan@intel.com>
 <20251110135805.3620715-4-balasubramani.vivekanandan@intel.com>
 <20251111004004.GN3905809@mdroper-desk1.amr.corp.intel.com>
 <thhxod63okvgwseorammrzff6ytzhmbtkd4qkywuaebng4ks7a@dipvmrmy5fta>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <thhxod63okvgwseorammrzff6ytzhmbtkd4qkywuaebng4ks7a@dipvmrmy5fta>
X-ClientProxiedBy: MA5P287CA0109.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b5::14) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|SN7PR11MB7640:EE_
X-MS-Office365-Filtering-Correlation-Id: c79c5f17-6439-4b3f-7a9b-08de22be32fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b0JULyt1dFpPaFlOWVZTSVQ4cklOcjJ4NGxMTmNRVjB2Z3l6Vmhua1NiUDNY?=
 =?utf-8?B?bVUrME9mdHkrQWZ3U1BIc1lhY3BjenZxbUpnRnN0RHhwUkVQZ1c3cVZVYm52?=
 =?utf-8?B?OHlOc2hOZXUvbS9LbTRKZG5ENGJOQ2FFNGxlWXNUYlFyejE3bk82WnBETCtB?=
 =?utf-8?B?OGJZbXYzczZNcE4yQlJ3WTZ1UmQxNGFBZkV3cnhVMEdCMnhhZW9mMEk4TUk0?=
 =?utf-8?B?L1duTjZzOFNYOUNKN3VRWE9IOWxxSEVxK1BmNWx0SkRSL1FSbkJvWkVmUFNu?=
 =?utf-8?B?Rys0SmczS0JvZmQ4R01LRHBPUGUrMFdUbVlveEkrbTBBWVVVM3hTcnUvaWN3?=
 =?utf-8?B?YXhmUDlVaE5RcFFIRHQxcmVWY0tBanVQVHpiQW5MNWpzbGY0ZTVldEZBMW5H?=
 =?utf-8?B?anBSWk5OVXVlTkZ6eUo4b1hRYjRYTkVHSkk0UGpqenBDNGVPN09CWWJRSnlQ?=
 =?utf-8?B?SE1JZnpScE8zRGNDTk1ON2FIcHIvcUh1VWdPMkZRd1ZNZVp6RUN5anpkVG5k?=
 =?utf-8?B?SWl4RWJlRG9RQ1Y5bExOaDhLdm1hdzVLRXEzQnNsVnBVMEFGZDBQZXUwOFdC?=
 =?utf-8?B?SW1pT3R2cUMvYVVPSVRkY3hjV3d0Ull3UXRBemphZXFYc1hqcXVJU2E0MjJq?=
 =?utf-8?B?dnlYMFlvUE9CWU8vQ1JmYXZnMlBUL2NrT2liRHEwZ2hNTVdEVFh5WXhIRjJD?=
 =?utf-8?B?WWV4ODBBVXprMFVBSTFmN1Rhc1duZEc3eWZRcnJXMldRT21pc0lEdmd0WTQr?=
 =?utf-8?B?ZjVidjV5bVFERm9Vc1daTkY2NHRXQ1hlSGJ2N1AwcGdwVGRISnZ0M1doQkdH?=
 =?utf-8?B?YlV0UURMSkdKYUdlcFZhZUQ3Z25sTUo5S3hTLzhEa0swOXlMbEJzSDlqL29u?=
 =?utf-8?B?SmFla0F1UUZNWnd6cVE4YklKaDMyY2VUaGtjWUhVVEFmbk9XUGZaeGYrSzFG?=
 =?utf-8?B?ck10NWhJaTB0SnBqY0VLV2wrVE80NWNzNVZVOExoK3pVenc5bW1Bd2hycHdB?=
 =?utf-8?B?SzB4a0o3U29CK2Vxamk0czRSZFgvZEEwcWF1NGpCUzNjLzZtNXc3NW9hVzJs?=
 =?utf-8?B?MkpwcS91NTlXZjFzUjdmM2N2YXBhQUVuV3lmRVJkY1lIWE1vOThLZ05zVmFQ?=
 =?utf-8?B?cW1KS09VWWttMVZjTHF4VXR1bGFGVmVxb3pHVzQ2NTZHMUZ6bVN3QlRHOXcr?=
 =?utf-8?B?UGxtTi9zU0FwMkdCdDMyMGc2TW5TbmhDTE8yNXZ1WE8rTDJMV3J6VC9MZ3hC?=
 =?utf-8?B?a1VSZ29PTnRGdzM2M2pxRDFTSWkyTlNqRmc2NGxXd2Z2S3c4c1loa3Zldkd2?=
 =?utf-8?B?Uml5aDlqRGRGUDV0NXVZMFYwMG1zMFZRZWtDenF6UUMxeGFZVlZPTUJyT3RI?=
 =?utf-8?B?ck4veS9Hd1VyRkpZa3hTbzZVdWJSR0dwa2xIL2lVVDJjUnJlbXhmMXBheldN?=
 =?utf-8?B?TUxIUi9mSmxRQWVOMjdIM0l6UUkxTVFCeDMycnBldzRvWlo2dkR5KytsYTls?=
 =?utf-8?B?ZlM2MzRVbFJWMzJ0dk9UOUZxcGNSZ3dwYVRnRW5VZm9mS1FQMDJiTEVKaWtI?=
 =?utf-8?B?Y1BuL2dKM3Y5NUVEVW1SeDk4djdoZnlXcC93U09zUEdabkVtOUFxNDl4NTlx?=
 =?utf-8?B?TWQrekh0MlJkSllZbys2ME0yMlRZSHA0QVA4MjZuV2dVNHpOZ2J1NHI2WWJJ?=
 =?utf-8?B?L0x3R0U1dEUxOWJubUl2YkxHVGU1QmRLeFJuMmc2WHhFNmRLaXA2dzBvc0p0?=
 =?utf-8?B?Q0NTeEE4cmN5aTdLODZ6bHgyQjJITkNTNXErRk43WjdUZHUyS2E3UjNGMHpj?=
 =?utf-8?B?SVhVajB5TkR1NFNLUFhBTDVxbHdBRnRuSElUb2QzSWdaNy9DRUVCL0dCUG5w?=
 =?utf-8?B?cEdaTkNTWmpqK0ZqK2dWKzN4MXNNQmx4SWVIQytFNFpCVkhqT05wTGxyYXdw?=
 =?utf-8?Q?XRfb7QHd+nTPC5K+uSMwWF6qLRhK3O4i?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WkRyRUw2eGphaW90MTlsU2dzYjFYaFVVN2s3dnJxK3ZCZGhGRTE1N2dYTld3?=
 =?utf-8?B?V0tORTAvV0I1T0dZWG5LZGdpQ1NzdGYreldZcm94bEpLV3hpNGFJaEhsS1ZK?=
 =?utf-8?B?VHVEUXBvSzlBaEJUR0JMOVJkY0lBYWFCRXM0M1pwaXVsdDRER3hEOTk4V0V2?=
 =?utf-8?B?RThTa0FyTkpVREZGeWUwbGE0Y045YWF0N3BCUmNhNk9iZHl0bXdZL25Md3RK?=
 =?utf-8?B?Z0I5TGtOYk8rZ0U0bEtwQWxsWk1qTkJtMDAvR1J1N3dYS3RkTFpBam9QMHFY?=
 =?utf-8?B?VnhnZmUxYWJMYU1OYnRVK09mdlNqWDg5UEF1VmZUYjF6R3hlNWJWdkQzZ2pp?=
 =?utf-8?B?aWJSMlhEREpYN3VZMUEzMzFHTGUrbG9iWFVmYjNjajUrMFloM2VZd1Y1azBu?=
 =?utf-8?B?ZUpHMENzQTl3c1EvNFlUS1BiZlpyNXo2aGxyVE5nV0lGVTJLTlJyMGpHeml0?=
 =?utf-8?B?NThBNlBxMk5JQzRtZ1BXekpZMUhsMVZUYXQ4ZTMrRk13RHNZMkpkZ1RzRmlQ?=
 =?utf-8?B?TE93ajFIaWo0aU9xdmhFZDhCOEVpWGJQMllPbEpjYzlNcHlJSm9xb28rUktV?=
 =?utf-8?B?NVB6cmVxbTdxck1aVFg0SFgxWXJnbkhYRGtJVmZISUYxTGNsS1c3Wmd4bEtk?=
 =?utf-8?B?bGZtd2NPNDZuaEN3ai90NjdiSk9aUkpSeG03NExxR0c1Q3YzWXVOUHp1MHlq?=
 =?utf-8?B?enRUZWNNaTJUckpIYnEyVmF5SlRSa21GZHhDVVFsUDN4cVhBVVhaNEJPMlJD?=
 =?utf-8?B?Q3NVQ2VVUmhmbVRlVVlXNzhHUlBTM09zTFc5WnlGVU02Ynl5bElzZnRTanhK?=
 =?utf-8?B?eWtzbTJCYm9HZzFVNjdOOXJscG95eEl1V2hnckwrL25JSE5vR3RjN205U3Q1?=
 =?utf-8?B?T0d1T1hXOFpkZ1BxOFpPRmN3U0FFVXdFNjErZFI4b1dVVnVhcWFLWWc0VzFr?=
 =?utf-8?B?dUtCdDF3ekczY1hwNG5HT25SRmFPZHFTRmlMa081K29ReTlXc0w5ekhnT1Yy?=
 =?utf-8?B?c2FFRHVia0sxbDVJZUJ1ejBlbXIwOTVzZTkvRUZVTWRXdFA5TGFKT3hwa3Vt?=
 =?utf-8?B?NjJTc1VBYjVDTkxOb3E5dk1uWFRRVHRrMVJyVDFDTDR1dkhnbHdPQ2JjY0lh?=
 =?utf-8?B?MVZubW9qSXJRUFVKVENqZXp2V2xyREdmY3RvK2FGL1pZVjhmRmMzTlRLMGVM?=
 =?utf-8?B?MlFlQzJFMkJlUC9rYS91RDVBTTVncWxRUk0venE3elRqUko0Z0hQTUdPN25V?=
 =?utf-8?B?YXdMM0hMbk1raHZYMjhKMG1IWnF4UHVsSUJaa1dLU01reDJFdERMWUsvLzV2?=
 =?utf-8?B?aTA4MERZS3JIVjIwWDZONnpjdHRiUFJVS21sQW5YQzdrTTNaeUpZYjdiUGtB?=
 =?utf-8?B?VkgzWjMzSWo5TnhsYWc3Szh3UFRjKzJuczc3UFk4U2VxV2t5SXh5blNPTkxn?=
 =?utf-8?B?TVRNVVRmKy81Q0dBRUJheVNjNGZDVkhmL3JjR3Z2aXYyOHBFOW1zQW5WZld5?=
 =?utf-8?B?RnlGNkVUUGJ4MGJsTnhibkdyaVZ6UzJ3UGpmdU5BcU9LUjNzdXlnMzRvL1hm?=
 =?utf-8?B?bFNxY0JHcWg3V3lWbVVUUTl1QXI4UmdrcjkvNCtLVmFHaXBCWTlzUXBNWkdO?=
 =?utf-8?B?MTZmamJPQzhQMG51YmVMNzR6cDRFVjdDcE5FcUhheWRvWkZIR29vYkpvM2Qv?=
 =?utf-8?B?VWNiVnoxekpxS1crZEFBdVNsaVJBMzdPQnhyVWNaWVNaNmRSMzVPcjJCWGh5?=
 =?utf-8?B?dldNM2YySU9HM0tIZXFVQ1Rtc25tcEdyMytGaCtjc3V4aEFrZ0JhK0srYTdX?=
 =?utf-8?B?OExWWnNkdzRPWHlyQ1RrTUp3dGZjZGhRWFVxV0RBMkJGVVdNRUZzVzlwU0tv?=
 =?utf-8?B?V0VNelBBczY2Zms1VXFqSWRqSHNVNzZIMlBCbUg0M01Qbmc1MzlFVzlrREc2?=
 =?utf-8?B?QW9IYy9weFZZR1k2aDlkMzZPd1gvb0hJNkxrMm4rTDJjdTkrd1UyaFErb1pI?=
 =?utf-8?B?V0lzQUFRcDhBWVkxVjhUM1htczlMMU1tQW5SckZMMU55RHVFRUIzWEo3V2JG?=
 =?utf-8?B?djVYSmZRWUhXZU5rV045V1VCWnc0aS9BVVd0YzVzY05qV0dYUXczKzM0eVc5?=
 =?utf-8?B?VWprMDJ4aS9jeFZSMU82N3FySE03NzZZdUoyZEpNZ3Fud2RSSmQyaG5DVzdP?=
 =?utf-8?Q?fkNGZm6kFd6Koc6DQFeQNrA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c79c5f17-6439-4b3f-7a9b-08de22be32fa
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 14:09:03.5124 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8uINBBH32S3Y/wt3FyBc7HW9sKlopMUs0/Pv3GpiNj5qEkFooSYPz7PYOTJjMaUg/lV3P2bVb+5H+3Q+Ze7XdlvejTKYBwVmdk0nsBvLR9p3rWTNYMREgIZTGv5rpLfE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7640
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

On 12.11.2025 10:06, Zbigniew Kempczyński wrote:
> On Mon, Nov 10, 2025 at 04:40:04PM -0800, Matt Roper wrote:
> > On Mon, Nov 10, 2025 at 07:28:07PM +0530, Balasubramani Vivekanandan wrote:
> > > As per the spec, a flush is required between two dependent BLT
> > > instructions. In fast-copy-emit, the source of the second BLT
> > > instruction was the destination of the previous BLT instuction.
> > > Therefore a flush is required between them.
> > 
> > So this is effectively a read-after-write (RAW) hazard, right?
> 
> If I'm not wrong bspec says:
> 
> 1. flush is required if we mix legacy and new fast blit commands, or
> 2. different sources are copied to single destination, in this case
>    there's risk of out-of-order execution.
> 
> But I haven't found in sequence of obj1->obj2->obj3 flush is necessary.

HW folks mentioned that the following line from Bspec 57555 is where it
asks the user to have a flush between two dependent BLT instructions.

"Command Level or BLIT level dependency must be detected by software and
appropriate flushes or barriers must be introduced between them to
handle producer consumer relationship between the commands." 

I agree, the statement is not clear in explaining the requirement in
detail.

Regards,
Bala

> 
> --
> Zbigniew
> 
> > 
> > > 
> > > Bpsec: 57567,57555
> > > 
> > > Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> > > ---
> > >  include/intel_gpu_commands.h  |  4 ++++
> > >  tests/intel/xe_exercise_blt.c | 14 ++++++++++++++
> > >  2 files changed, 18 insertions(+)
> > > 
> > > diff --git a/include/intel_gpu_commands.h b/include/intel_gpu_commands.h
> > > index cd281ba89..f6d367442 100644
> > > --- a/include/intel_gpu_commands.h
> > > +++ b/include/intel_gpu_commands.h
> > > @@ -445,6 +445,10 @@
> > >  
> > >  #define XE2_STATE_SIP \
> > >  	((0x3 << 29) | (0x0 << 27) | (0x1 << 24) | (0x1 << 17))
> > > +
> > > +#define XE2_MI_FLUSH_DW		(0x26 << 23)
> > > +#define   FLUSH_LEN_DW		(2)
> > > +#define   FLUSH_LEN_QW		(3)
> > 
> > This isn't really for Xe2; according to bspec 6997, MI_FLUSH_DW switched
> > from taking a 32-bit address to a 64-bit address (and thus the size of
> > the instruction increased by one) all the way back in gen8 (BDW).
> > 
> > We should either make this something like MI_FLUSH_DW_GEN8, or just use
> > "MI_FLUSH_DW_CMD | 2" down below like other spots in IGT already do.  If
> > the former, we should also use MI_INSTR rather than an open-coded shift.
> > 
> > >  /*
> > >   * Used to convert any address to canonical form.
> > >   * Starting from gen8, some commands (e.g. STATE_BASE_ADDRESS,
> > > diff --git a/tests/intel/xe_exercise_blt.c b/tests/intel/xe_exercise_blt.c
> > > index a545654d3..06a2eedca 100644
> > > --- a/tests/intel/xe_exercise_blt.c
> > > +++ b/tests/intel/xe_exercise_blt.c
> > > @@ -86,6 +86,7 @@ static int fast_copy_one_bb(int xe,
> > >  	uint64_t bb_offset, alignment;
> > >  	uint64_t bb_pos = 0;
> > >  	int ret = 0;
> > > +	uint32_t *bb;
> > >  
> > >  	alignment = xe_get_default_alignment(xe);
> > >  
> > > @@ -103,6 +104,19 @@ static int fast_copy_one_bb(int xe,
> > >  	blt_tmp.print_bb = blt->print_bb;
> > >  	bb_pos = emit_blt_fast_copy(xe, ahnd, &blt_tmp, bb_pos, false);
> > >  
> > > +	bb = xe_bo_map(xe, blt->bb.handle, blt->bb.size);
> > > +	/*
> > > +	 * Bspec asks to insert a flush between two BLIT instructions to resolve
> > > +	 * BLIT level dependency. Though the spec is not clear in explaining
> > > +	 * it, HW team requested for a flush instuction between these two BLIT
> > > +	 * instuctions as they have a dependency.
> > > +	 */
> > > +	bb[bb_pos++] = XE2_MI_FLUSH_DW | FLUSH_LEN_DW;
> > > +	bb[bb_pos++] = 0;
> > > +	bb[bb_pos++] = 0;
> > > +	bb[bb_pos++] = 0;
> > > +	munmap(bb, blt->bb.size);
> > 
> > This feels like a general facility that should probably be an emit_*()
> > instruction somewhere like lib/intel_blt.c so that it can be used in any
> > test that needs it.
> > 
> > 
> > Matt
> > 
> > > +
> > >  	/* Second blit */
> > >  	blt_copy_init(xe, &blt_tmp);
> > >  	blt_tmp.src = blt->mid;
> > > -- 
> > > 2.43.0
> > > 
> > 
> > -- 
> > Matt Roper
> > Graphics Software Engineer
> > Linux GPU Platform Enablement
> > Intel Corporation
