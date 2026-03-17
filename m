Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 402DFF3380C
	for <igt-dev@archiver.kernel.org>; Tue, 17 Mar 2026 07:44:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF6E210E510;
	Tue, 17 Mar 2026 07:44:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DH9wCZFf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C61D10E510
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Mar 2026 07:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773733453; x=1805269453;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=mkHaA7BXVyQvRWzrHUeyC5P8Fki+iFDvEKRMx9IUOgM=;
 b=DH9wCZFfjhtrBq2Ps07p/lR5FDdjc+gsOMJGfLHu5wZ15AVBhM68ADP9
 5jHwROkwowm6wI2Lj+AHO1rDrrLozVD62PQm5zuPNtEhN8CmKotEM/xu2
 Q5P6tzsOK+2QxDLXFDBWNHQXf/iqvSBgApYtCpcqEiHaUY7uzQPjQECom
 5BFyZqfEmXxadZzNoG+XUXOdp0xgIBFYEmHpwLAK/ClzY2znZ1iVRFgMj
 goTpYOQgqj64qjsgsFJRLQBf+/24N8jd42LNCYCzp9ZqHrcrONzhDsW4W
 qNC0/jf2AyUNWjc8g7eUwSBndkEqmq40dcuDKTTCw/Uy+rse4gtKONI5z A==;
X-CSE-ConnectionGUID: ABZHSVnmTyCBeoLtPbsZ7w==
X-CSE-MsgGUID: UZLcR3OHSPae76OOEmsAiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="77367693"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208,217";a="77367693"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2026 00:44:13 -0700
X-CSE-ConnectionGUID: Dk7lGC40ScaF0b1C6bRJDg==
X-CSE-MsgGUID: WbsJm0gvSm2v+inLX2bYdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
 d="scan'208,217";a="219696780"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2026 00:44:13 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 17 Mar 2026 00:44:12 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 17 Mar 2026 00:44:12 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.14)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 17 Mar 2026 00:44:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a/XuL7OsWMa2XZxsmSf/VPVaNjrz44V7UvAAKHDm9a8QJomVtOGcT1Em1JnYQKWX5BL7CYSnfDr2otUsoNLeLmpxxq5uZ/SEftcsIOPtOz4G/uqQ3nMaXuOtF94Q9uq0t7FQQxs3tdlGu56YkXD2ciHGjGmisS7m9BVQ+IkgLTDddYtjjKmPVJ9hbCTTERIibJgrzJLwQduIVtT/Y0TBvwnrZWQL3uhyOzwZ5sV1G5ot55s7RMpfXL6u7XfJZ5BVE84yURMtNYhP/rtKni2tNrlsDkhE4+tp6Cy5/t+PjmETI3UMtIQ9Lud68jKJFrJpwDgruPRMtn06pW5JXzpwxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Am/nlksWUJRBWjWkyD7jkUKxImuD0AVYMSFVELgxbmY=;
 b=oEaKEta/4OQXlT/NKpLwWQoK+QzfL5iKBPUMmVx0MvviWgggYD+plXU6P9GQdahgzSgXj1nDNMMqx/5zGDNV6enVm68Knio/Va5ocQA+gsbJxN8w9Ww1owJ/r6e5rdO5soBbBgwv9kcCP4laxY5KW3Z1ujAaxlEre8bqSAEcizwSvTUfI8flzRGskUcHVpYMTScNQ3gxMfZ0OdKsGU0zZoQA+KQztm0XoFYFdaxb6M89wI5OsGES42iUjuaueq8zCaIOqsirTUwyMpTU0Gg8o1KY74n455Wo0L+ldH8KOXTh3QOh5GVx7R+asDa5HNNY/v2jjWrmzJxIJAnId94iDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV8PR11MB8485.namprd11.prod.outlook.com (2603:10b6:408:1e6::13)
 by PH0PR11MB4870.namprd11.prod.outlook.com (2603:10b6:510:34::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.8; Tue, 17 Mar
 2026 07:44:09 +0000
Received: from LV8PR11MB8485.namprd11.prod.outlook.com
 ([fe80::9ec6:998a:b515:890c]) by LV8PR11MB8485.namprd11.prod.outlook.com
 ([fe80::9ec6:998a:b515:890c%4]) with mapi id 15.20.9723.014; Tue, 17 Mar 2026
 07:44:09 +0000
Content-Type: multipart/alternative;
 boundary="------------I6AfgxJz7UGhxjV3pdWYEUdT"
Message-ID: <7ad01a56-440f-4731-93dd-f21223b81e1b@intel.com>
Date: Tue, 17 Mar 2026 13:14:02 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v8 1/6] tests/kms_flip: test suspend on one pair of
 pipes
To: =?UTF-8?Q?Micha=C5=82_Grzelak?= <michal.grzelak@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20260309092528.3336467-1-michal.grzelak@intel.com>
 <20260309092528.3336467-2-michal.grzelak@intel.com>
Content-Language: en-GB
From: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
In-Reply-To: <20260309092528.3336467-2-michal.grzelak@intel.com>
X-ClientProxiedBy: MA5PR01CA0227.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1f3::14) To LV8PR11MB8485.namprd11.prod.outlook.com
 (2603:10b6:408:1e6::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR11MB8485:EE_|PH0PR11MB4870:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ff30c6e-b232-45e5-bf68-08de83f8f8fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|22082099003|18002099003|56012099003|8096899003;
X-Microsoft-Antispam-Message-Info: pxm1LxG+5nvjkvLIow80IByO5AfEM03ZSySuWfl+5xZUhNTtGcHreeP4IwSWU1Qb1UlZb3bhP6YhEohsm/iGSbjmLdA/b6bqWoDEoWJ9L7XB2jbYQmQJdcOcvE1YZ23vmOA77TQ4/rO+CXBtB2ogbUwtk9eLIOUO4innjnV7LdETh+L1AhXmMM3WugnrccfycMa7WHZrCCabcSe8TmKktv1IIiJd+ZhgW70ixiEeo5/kd1/emJNWiYX0zAaxLA6gXZRtoh1DGSj8WYcwkFTgLJXaYBgqqBXlJxiAIyY02RcBAjxUcik3iaxejKRQ6NVT1JFx+tUXaG8dqXcRvY3ykcsX+2Cug5HH5Mam+Jd4Jrvlf3cziGfbq0OVnINUcbuFcex6JPla7uNEPr8pm9m+JCoYnRuhn0BTsX/dG8bRPxLUlxa/s47sa6CjjgHdocjlXvE+JjFEOqc5OpuhRzJxHLY/8R3I/Kldw0eLlcUD5DkvCy+iExPTEvwmex1n/X3fAafowWW26iNj/VhUSm2Ps7kd0fekAshUpiX/sdjt+86AE28GLM6mQ2wAwKrxMbww8h8BCmRmiDZdrD4CUFn/OpvpBdQYSigT5f9EvlA1bxmNGunw3weUyk2nbp+9CrSHKVqhc2NzpY+M7dgN4VPQqmvu9fJ43OPdjeJ9E7dmj/L99kRT5AZGouwKoVytLKinrfxXYT+IRe8e2c5an/VN66rROoJwrLbYNqbp02PAihw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR11MB8485.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(18002099003)(56012099003)(8096899003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VG9vSTFEQzN1b3VrMC9kQ0o2UUdQa0RzUklhSXhWSmdVUGxGa09sTWhTOExW?=
 =?utf-8?B?R0hlZVNUUDlZOUZxcHZpOStvcnljUFdCYlQ3L0dITHBwL3FwOXJtNnZ5Qkgx?=
 =?utf-8?B?WlhvYjdRamJqWFEvMDBub01xdTN4cUljcHlkUG44OUZaZ1B1Tm91QmRrUmxN?=
 =?utf-8?B?TzdBT3hSbFpQZUY2Mno1alVUamFwQk5qNC95Z3VHVEJlSDhNN3ZpVDI1bVAz?=
 =?utf-8?B?NUxYZmtvMy9PSDNaZXp5Lzh5bG9wK2lRNXYvQ1B6Q1ZBejFHZ0lRUlVwalNp?=
 =?utf-8?B?Vng5TjZIb2FzajVpcHdmQlpQVlJNdFNtaWFsRmFwblFhT3dwWlVXcWd2UjA4?=
 =?utf-8?B?V21LTzFWaEtxeE96Q21sbWtmeUIxS2VFUjFYZHFFQlVQUVFEYzJKQzN3Ykpo?=
 =?utf-8?B?ajN6LzhPcHAyVDJIdklEQ1p6NVh3TWNsKzJuNnV2aXdtK0JvbEFQVFRtenRa?=
 =?utf-8?B?Y3hCU1U1U0F1SUtvM1djdHBYUlFQbFRzR2xINGFpSkFPUm5FaEZCeXhIN0RC?=
 =?utf-8?B?S0RXMlhZd3M0TEc3SlNTV3kya285aFNQc0d6WXZyallwNmhaMktjclRBaEdk?=
 =?utf-8?B?RjFRTFRpc3NPVFNBbENoL2pmMVNLYVF4dFQ1eU94eU5uVU9UWWRBWUZ2d1JP?=
 =?utf-8?B?aXlGbFk1Q0JWZzRjZHdyTU9jRmJRekZJSnVhbC84cWhUS0NwUll2VkFqN1Y0?=
 =?utf-8?B?Y042K1ExU21aTHFpRkJNd1J1eklSLzlPY0NMYTl6eWZCUVFMa3RGWk9ISGpS?=
 =?utf-8?B?RVZUUXFCbXYvbFord0pPaHo3OVRuQjJ3SzNEOERmNE9uK3Mva1FqbzU5ZkRP?=
 =?utf-8?B?SFk1VGswZklVcm9SZGtVa2xQaXoveHYybG9VWDEvVy85QjJRK3hKUlA0WXJm?=
 =?utf-8?B?Q1RnZnJZWXhRa2UxSHFmSHdEOWZPNGtJd01wVkdUNkx1dGpTV29BTGdvMnhY?=
 =?utf-8?B?NDY5VUtDcDdIRmJlaGx3MHJXQXNJZUxTQmdVdEF4dUVnbk5QcmlTSzlReDJj?=
 =?utf-8?B?NllDSUwrcjFlL1NZOVNCaHIzV2FKTngzK2t1N0hGMUNFSzExVmxIeHpLcGhM?=
 =?utf-8?B?RlUrVVdNTndBNFBGUmJxUW5kamlZanRCYkVTcjhWMnA3b1k1MG4veHlxbXFS?=
 =?utf-8?B?Wno2S2tlQWZNTEZhNWlsYStGSXBYZzZoU0xDWmQyYnNLWkV3dGN3dmUvbEFN?=
 =?utf-8?B?NS9FbVQzNmV2VXNsaXpKejZKdExzOEhIcXBXYUNzMFBlSzdCc2JUMStCT3pj?=
 =?utf-8?B?S0hDNDJ4WXdGbXBpczJqUjU3RnFjdloyaEVVa0NVYnQ2M0xQVzRIekFlL1d0?=
 =?utf-8?B?ZlNVRWdWT0ZRWWp2YUlLVmJoaUhHZmNLQXFHK1UyNmx2QTA5cFNXa3hyT05o?=
 =?utf-8?B?aTRBKzBGVHVud1JkL1Q2RjczUi9QQ0I2aW1UZDV2eWk4ck1qNDBPMG1EOVB6?=
 =?utf-8?B?RVlMUmFJL2FwMU5VMzhOOEJIMk41Z3RjRkJnTU9GR0hvVzJIVXduL0M3eEtl?=
 =?utf-8?B?b1pTaFc0aE4vKzBTYjRmVmdUajlFYUVSZC80VW00QVlKK1hFbXk4MDNYTjZQ?=
 =?utf-8?B?dXR4emdkdlNNR2Rud2czRGFieFlXZjNVRjFmWVEraG4vWVRCcWdlc3NXVlBu?=
 =?utf-8?B?MUtuSmx2Ky81MmZJaFphK3E2N0FhSUtwd29DaXplOG9odUF2SVMxcTYzMFdk?=
 =?utf-8?B?S0Y1M0ZNOGFMVGIyblh3OXd1Zk4wdk0xV1lISG55MDJlbUg3YndxVS9vbS9E?=
 =?utf-8?B?RHd3dW0wUHNlcVZ2aEZBaG9EUFlCVWhGeTQxblg1T0REZHZGaTZsMktkTElq?=
 =?utf-8?B?MjN4SGJPMTQ4d3JmSklMTzc4TEtMOU1YY0lMTnAvZjY2MHpsL08wZXY4NjJB?=
 =?utf-8?B?Q1g5WHk3ZWZTQmNicGNHSHgvOGRPbVRmYTc3eVZzN1JXa3c4WEliRXFDQVk1?=
 =?utf-8?B?WWVCVzV1RnJKZUJpMndBSXNwTGZFUWVOK1p1WXVVbVN2VG9UejNwS1doc21i?=
 =?utf-8?B?VEQyY1VTdGVMUkh6TGk1emE3V3VoclU2cmllTHIwMEtqSTY4L2xTVE5oeTZ0?=
 =?utf-8?B?MmxKU0gwL0JsaG5vK2xzYXM4Y0YzWlFhQmM2UXpTYmhXMktGdi80M1hveSsy?=
 =?utf-8?B?dk96SEFDZUJnQnpGKzNSR3dhakRSTjQxSm9QeFVtejhyd0FiV0xBdVJXRGRl?=
 =?utf-8?B?RWJaQitkL2E1TWp2cmVLVDB1VUc0SjN1UEJiN2t0Z1ZtMWwzdHVPZWdSNEVl?=
 =?utf-8?B?WDFDZE4yeU02dnRDT1MyRCtKOGlxVWFLUENOKzJ5NjlhS1g1cE4vYnNzMXBJ?=
 =?utf-8?B?eGFNVFFKUm9zMndCRVBKWUhQRGV4d2pTTll5WkVJM2Jncm5nVEZMZG5VZFNT?=
 =?utf-8?Q?dHjnmm//DGaMMxkk=3D?=
X-Exchange-RoutingPolicyChecked: LaPI97Ja1d6KHjS9pRL+UwuCub1suj3fW4xfieLCq3wfL/w7N4fB3IrZB8Bk5NKnPgpOEAlgF/A5Sj+HBJtED9AdV8RjjKHa76uKBZdupoj6nSCPe4Nz0kkp6IOskBppI2W9e1SppNFSSNy/yKPTabpMsVQtzZzu9UTxf2Ka7R1zmXaOukzr0BOubqUbP8FiqV1Ryvx3wBdloxwwiii1bFfBL0/w8nxs0Uklzz3iyAMgGCAZWlIzVDdAunHTtra5XdSlDmBiL8FLRSuBMQAcr50qoR2/P6JgmZc1W3qKQM8jF+22OT6e03+TudKkxpf9UASuzcnC1O66XAuNcCWjSg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ff30c6e-b232-45e5-bf68-08de83f8f8fd
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8485.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 07:44:09.2838 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /sOMJ9vuQZB43/D93YrmGd+7xhq+LQsc8Ww4BkxOfEKKuCS6bDqopMNsNB1LFO37jW+fX2/3gXiI6j8k2PC/M3XePgaxwDE6ASUTDkqdAh8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4870
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

--------------I6AfgxJz7UGhxjV3pdWYEUdT
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 09-03-2026 02:55 pm, Michał Grzelak wrote:
> Currently, every pair of ({pipe1, pipe2}, {output1, output2}) is being
> tested in 2x-* subtests. Since suspend shouldn't be tested per pipe, it
> causes unnecessary overhead: with 4 pipes & 4 displays it runs up to 36
> tests. Given that each suspend's dynamic subtest can take up to tens of
> seconds, total duration of the test easily exceeds timeout.
>
> When testing suspend, for each pair of outputs test only first and last
> pipe unless it is said to run on all pipes.
>
> Signed-off-by: Michał Grzelak<michal.grzelak@intel.com>

LGTM:

Reviewed-by: Mohammed Thasleem <mohammed.thasleem@intel.com>

> ---
>   tests/kms_flip.c | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/tests/kms_flip.c b/tests/kms_flip.c
> index 49a5f4ed1..8bda82627 100755
> --- a/tests/kms_flip.c
> +++ b/tests/kms_flip.c
> @@ -1918,6 +1918,12 @@ static void run_pair(int duration, int flags)
>   		for (n = 0; n < resources->count_crtcs; n++) {
>   			for (j = i + 1; j < resources->count_connectors; j++) {
>   				for (m = n + 1; m < resources->count_crtcs; m++) {
> +					/* Limit the execution to 2 CRTCs (first & last) for hang and suspend tests */
> +					if (((flags & TEST_HANG) || (flags & TEST_SUSPEND)) && !all_crtcs &&
> +					    ((n != 0 && n != resources->count_crtcs) ||
> +					    m != resources->count_crtcs - 1))
> +						continue;
> +
>   					memset(&o, 0, sizeof(o));
>   					o.count = 2;
>   					o._connector[0] = resources->connectors[i];
> @@ -1963,8 +1969,8 @@ static void run_pair(int duration, int flags)
>   					crtc_idxs[0] = n;
>   					crtc_idxs[1] = m;
>   
> -					/* Limit the execution to 2 CRTCs (first & last) for hang tests */
> -					if ((flags & TEST_HANG) && !all_crtcs &&
> +					/* Limit the execution to 2 CRTCs (first & last) for hang and suspend tests */
> +					if (((flags & TEST_HANG) || (flags & TEST_SUSPEND)) && !all_crtcs &&
>   					    ((n != 0 && n != resources->count_crtcs) ||
>   					    m != resources->count_crtcs - 1))
>   						continue;
--------------I6AfgxJz7UGhxjV3pdWYEUdT
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 09-03-2026 02:55 pm, Michał Grzelak
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260309092528.3336467-2-michal.grzelak@intel.com">
      <pre wrap="" class="moz-quote-pre">Currently, every pair of ({pipe1, pipe2}, {output1, output2}) is being
tested in 2x-* subtests. Since suspend shouldn't be tested per pipe, it
causes unnecessary overhead: with 4 pipes &amp; 4 displays it runs up to 36
tests. Given that each suspend's dynamic subtest can take up to tens of
seconds, total duration of the test easily exceeds timeout.

When testing suspend, for each pair of outputs test only first and last
pipe unless it is said to run on all pipes.

Signed-off-by: Michał Grzelak <a class="moz-txt-link-rfc2396E" href="mailto:michal.grzelak@intel.com">&lt;michal.grzelak@intel.com&gt;</a></pre>
    </blockquote>
    <p class="MsoPlainText">LGTM:</p>
    <p class="MsoPlainText">Reviewed-by: Mohammed Thasleem &lt;<a href="mailto:mohammed.thasleem@intel.com" class="moz-txt-link-freetext">mohammed.thasleem@intel.com</a>&gt;</p>
    <blockquote type="cite" cite="mid:20260309092528.3336467-2-michal.grzelak@intel.com">
      <pre wrap="" class="moz-quote-pre">
---
 tests/kms_flip.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index 49a5f4ed1..8bda82627 100755
--- a/tests/kms_flip.c
+++ b/tests/kms_flip.c
@@ -1918,6 +1918,12 @@ static void run_pair(int duration, int flags)
 		for (n = 0; n &lt; resources-&gt;count_crtcs; n++) {
 			for (j = i + 1; j &lt; resources-&gt;count_connectors; j++) {
 				for (m = n + 1; m &lt; resources-&gt;count_crtcs; m++) {
+					/* Limit the execution to 2 CRTCs (first &amp; last) for hang and suspend tests */
+					if (((flags &amp; TEST_HANG) || (flags &amp; TEST_SUSPEND)) &amp;&amp; !all_crtcs &amp;&amp;
+					    ((n != 0 &amp;&amp; n != resources-&gt;count_crtcs) ||
+					    m != resources-&gt;count_crtcs - 1))
+						continue;
+
 					memset(&amp;o, 0, sizeof(o));
 					o.count = 2;
 					o._connector[0] = resources-&gt;connectors[i];
@@ -1963,8 +1969,8 @@ static void run_pair(int duration, int flags)
 					crtc_idxs[0] = n;
 					crtc_idxs[1] = m;
 
-					/* Limit the execution to 2 CRTCs (first &amp; last) for hang tests */
-					if ((flags &amp; TEST_HANG) &amp;&amp; !all_crtcs &amp;&amp;
+					/* Limit the execution to 2 CRTCs (first &amp; last) for hang and suspend tests */
+					if (((flags &amp; TEST_HANG) || (flags &amp; TEST_SUSPEND)) &amp;&amp; !all_crtcs &amp;&amp;
 					    ((n != 0 &amp;&amp; n != resources-&gt;count_crtcs) ||
 					    m != resources-&gt;count_crtcs - 1))
 						continue;
</pre>
    </blockquote>
  </body>
</html>

--------------I6AfgxJz7UGhxjV3pdWYEUdT--
