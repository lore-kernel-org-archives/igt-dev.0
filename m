Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68355C4450A
	for <igt-dev@archiver.kernel.org>; Thu, 16 Jul 2026 07:29:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD5B810E2F7;
	Thu, 16 Jul 2026 07:29:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N7tzLw/m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51FE310E2F7
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Jul 2026 07:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784186922; x=1815722922;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=fhTET76LzAw8qvTnh/27WhnQbQ0L7b6e+cu+mAM2Piw=;
 b=N7tzLw/m+47JejCUB1/go/QXYCWmUhbo4cTr1PAXnNmnlWYbgDc3Qbkc
 x0zz2h28New5H2CutIQg0jVwfP249ve+1FSrOWi05BJa6R8+qAeZZQR5o
 msMLC6UOggqPH4tFzW2qD3dcR479OCbxW6wIOQcwSYrlIorgPbstVBXIi
 brI3WBn0iZexnLXIZOzmyobEwkbUPm0YzvUoXtAWK8C6IOorVsMVBQgrM
 NEwQ8P3HR7Y2EyBteYq23V9ru+FsWeLslRr9zfTKPG2HOEDfJqUYQiwq9
 seJchjFrni6fIcA3vJXi+qIBxmA76IenYEVl+GHrtM+s2xZSVVRtIvPQt Q==;
X-CSE-ConnectionGUID: tfqGtRVrT0ivCQLu8adGpQ==
X-CSE-MsgGUID: D2fSPWPqTMeWIOzwVAHWUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="88740100"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="88740100"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 00:28:42 -0700
X-CSE-ConnectionGUID: zoaqLPVIQ0Ob9VBKDOUV1w==
X-CSE-MsgGUID: MjgEeCX1SoavLVAyn4mIuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="257065372"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 00:28:42 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 16 Jul 2026 00:28:41 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 16 Jul 2026 00:28:41 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.69) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 16 Jul 2026 00:28:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n+xKqijiiAsCgou8WPl6fQC4ukTstu7tSSE3DHSrFd0ui4bSCeOtye2CErkqFBdisYVTdZm2hT/jP8WQqpmICDYoDgCHhWnZDraWiLG6RNEXcdjFkXK+hOvAau9jQNp6lTpl/4qFpKp/OrPa8SELtjjB7AgzZajXZv300BMr6zp9qjqGSJeu+xFafomsM9tEZACzz7QALbW//aZj4OcDRUVOM0mCeF69sz9LrdlDyoOWeqdB4XIiENFCUfrt3LUbUxpKuLjWtRtwSRwHFkvyRN4GHtiw4Hwnn05u2gB2tXCyHgQfrKafrGPM4OtOd52ax4fC9Un0GDVwFbiiCsxN6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y8Y3ACDhqqanDmcsC7PJl8xegvBeDI9HhtuzJtbboD8=;
 b=MJOGydzM+pI8lMPGzP6nXDhZjQKMvlfbOS9C1fuST/D2Z5Ppp1EVLdY217Ms7gMSHUqXvnt4ceQxhQ5xhk0pgOCc9t6MLFERjFHkGl/RZwWA5nV4zdB+Fvet8mHfyuQwr+EUwiL/mXCXD8A8dyxTq2hZk3JmcQnzJAGvVuxig28rYtIfnCg9VhhE5xOeVoMgfR6g2ZgUvUVOMJBc35gFxDvPgS9rFwQ406T7/bKKmRhSe75RgDnb0f5ip3rI9V7828OPZIFoP/BZMsqqsUp0AkU/Z+ExtZGeocfUroxFxjxYIrMO+13tiiE9rMU1dxX1U1/1nPtkZ+oRLwk695Caog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7424.namprd11.prod.outlook.com (2603:10b6:510:287::7)
 by PH8PR11MB6659.namprd11.prod.outlook.com (2603:10b6:510:1c2::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 07:28:37 +0000
Received: from PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2]) by PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2%5]) with mapi id 15.21.0223.011; Thu, 16 Jul 2026
 07:28:37 +0000
Date: Thu, 16 Jul 2026 07:28:24 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <kamil.konieczny@linux.intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH i-g-t v3 06/31] lib/igt_drm_stub: introduce for tools
 needing driver detection
Message-ID: <rnpyuoo5pdi5v6whq5qzyaxxvmkwjgjozcca6sr4lrlxx5o6vb@q3omkhrxqtol>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <cover.1784117512.git.sebastian.brzezinka@intel.com>
 <20236b1a70d9595799effb782de718298b8a9f91.1784117512.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20236b1a70d9595799effb782de718298b8a9f91.1784117512.git.sebastian.brzezinka@intel.com>
X-ClientProxiedBy: TL2P290CA0020.ISRP290.PROD.OUTLOOK.COM (2603:1096:950:3::9)
 To PH0PR11MB7424.namprd11.prod.outlook.com
 (2603:10b6:510:287::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7424:EE_|PH8PR11MB6659:EE_
X-MS-Office365-Filtering-Correlation-Id: a576b38a-f066-4a4e-9e44-08dee30bd9f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|366016|11063799006|56012099006|6133799003|4143699003|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info: GA2PsAloYHfY9lm9qw0fcfU9UEOs3k27Jm+2eg/x2DmjGu5vHq3Mv/c1HJ0eBSI+9rqLDWorBVOLk0ZbRnnLIS7mXYaKiDS6HQXnfSMU1ItYJzCbHebsZ66Mgxz1/QCEE+ixOL8ppPAWNzlNdkPmk+S2gW0yPukBP0gVKi0bErNrDkhYGXMpvWmnz/h6MQnOqSeDAorRSYpInGMkfsfCHmWuzn7p7wzBuiJuJJHYeCzhN8Wi8pfCOppwHRUi7OUSjHPuG8eunNcnwXraQsZ4xO82MLtRzBVUF47MEyg5xZBEBr8UkzYrYwDFJ8y9BBGwmLqbTercm1ARDM70U9W6cLJUFiGhidGKBIiCtvebwiD6J+0I59iQBiSzPMD0cWPOC2D30ENA9H/qK5B16QA/2Duge0PHBIrYxGg8GlRioXAoKW2eSwimH1HFGgXzP//Jrb08s5suFAMWjLtm9pNPQeCDhHvCqDYfWbdJhZFsXd4+rWghTY8XDrqUiD3LvRs788O69sdXXls8SJ7hmwvyN3VmYqe1MYtzN0uMX8b4y33wmdgzd0BhA7IU8je8Ef0d8fFPgiY5L/ukxg+TXhdSPq0+0CMXu824Q80Vlkmkj/3JhdQ86t2KWKR1u9uMx18eU1LZlfZ0O938AjXuEICbtQ/8t9eBEM8IGisiAxbaZpQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7424.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(11063799006)(56012099006)(6133799003)(4143699003)(18002099003)(22082099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NzBaZkVFQW8wSEZxbUxybGI2dWVlWjdxYVEzQUd5SXl1amdaZ2Z3YkxuaHNP?=
 =?utf-8?B?dk8yc3NQMlZzRFRQS3dhK2l0ZGdYQThDSjNUbWhMTll4aHZvS1Z1Q2tTK0Qy?=
 =?utf-8?B?ZVRQVGxJVUpxeVpaYjdEcUxmaXFYSjFlLzdoS2Zsc3RaZkNFcUw4U3ZDamk5?=
 =?utf-8?B?MEp6Wmo5S3IwcjNtVUtvdGh1TlRlSGlhektJTWM2Mlh0NHZSTEZSbnhCakJZ?=
 =?utf-8?B?YXhpcXhmdmdMNFVYTnMrbUtkUWtwUTg5VS94Mk84NXdNTVNqS1hid3h1aTZp?=
 =?utf-8?B?bEtmMmVuano3MjdGNHVqRVFKSkdsQWhKVlhSMzRLNkt4RzhGVGoyQUVyMXVx?=
 =?utf-8?B?RjBDeHV2UDFlQ29vUWhLRGJ1OGZ5NS9GSWRVakdTWE5kL21RR2dtNWRadkNr?=
 =?utf-8?B?UUlzS3pib01QY0c3T3ErRWhuRCtlS25KZGlOTEFpMXRCUTlHWEdiTFZNano4?=
 =?utf-8?B?YS9Nb3hiaTNDNmxpZC9SUHhRdTNJWkpycTZjWWlMWkFvV2F2WU5ZaGQ4aU1V?=
 =?utf-8?B?WE9oU1U4NGxxZFRtYTlNdlFDRC9pQUVVeDBmWFU5M1Fwem9ZZ0h6TE5KSHpp?=
 =?utf-8?B?TXE1WEppdWxjVUVBeEdXaUwxd0hKTXljK2FPaUVFZ25hanF3WHVrempsZWpT?=
 =?utf-8?B?VW9McmtiUFRrUk5hRE5lVzZSbWFZenl1dVZ5QU82KzVXZDYyRUViU0xzNTBm?=
 =?utf-8?B?VkFnb2xxMmRKa1h4TVQ1a0Mrb3I4VlF6MG9VNVAzZkdRbVNEOGRPbDQ2aTNV?=
 =?utf-8?B?NnBUQXNFdWhMblB6MFJMRnozWlVrZWM3dXFJbDEwKzNTYjVoRTNOQ0lNTnpB?=
 =?utf-8?B?L25Lb0g2T21yUlZXSUtwbGZkVCtRM1FLMW90NGNYMENsK1F4NnZJK3U3eGh1?=
 =?utf-8?B?ZENvVURlUDY0NXhHS1lSdS9jSlJ5TnBYWnV3b2VJdkUzayt3WmY2UzhWVzM4?=
 =?utf-8?B?ck1WY1hEMk1NQmVnbG9uVWk0RGgvMzQveHZST0ZwZzNFRzdwVFlLclJ3Um9C?=
 =?utf-8?B?NWxhYjE3Rm1FK3k3RHJlbW12WUNEL2pnZUxORDMwT1dxNVVIZFd3K1lDdWRB?=
 =?utf-8?B?MHZPaTZ4ZnpBVk0ycGdNMWtxcTRxSjVRdU16dDB1emNsU2VqbGRYeWg4ekls?=
 =?utf-8?B?Q2cwM09Pb25BYVI2M3ZiS1lyazR1UTNaZEo2Y0dqZExqWk5FcXRDKzlzenVP?=
 =?utf-8?B?R1FwdXd5RG5xMG9nN0hkZnpaVjljYUsvd1lPMHZXdFhoL3piWHFxMXlCY04r?=
 =?utf-8?B?MlpMU3RmRHVhakxQd0hmNDczUFNPRWFiY0FVMGlGbngzNmlKRFArSitYSVht?=
 =?utf-8?B?TDdiMVVZWk11RnNsU0hvcWZSMG5KR3Z4eWYxOXppdWhmRkM5Q0lPRThWVXI4?=
 =?utf-8?B?WFRMNmcwREJad3JKY2RIWVI3MjkxZ1pCeFpUdldTOFBCNjhZanRPMm9lMWpD?=
 =?utf-8?B?YURuTnZhT2hvaFJEcHB0RE5hWEtXNUlZTENHdEl3TTB1WnVtS2VhVWtSbEY5?=
 =?utf-8?B?ZjBjOEp2ZG5PNDhDWlN5czBaS3ZxR1k2WTB6dkQ0NURBWm9EZWJFdTJCYTZT?=
 =?utf-8?B?enVVOEo2dC9QYUtYMTl4djhlbzVsaDNCTE1vWWZPR0Y1eEZUcURTQkFWYVB5?=
 =?utf-8?B?SnFLeVdhV25EbjF6VVZDOUZRTXRMNU5YL2tyaWwwYXNubjd6cXpjNk9FME8w?=
 =?utf-8?B?S1dZd3hzZ0xhOFp5MlVRRGdwMnViMHJNVEdmdEhLVnJqUjFzSzg5T2taU2lW?=
 =?utf-8?B?dEJpeWhOVzJhdmlkZ2RTVnlackE1S1ZUekxOaUpDeWhiT05mbmNnMW8yYkM4?=
 =?utf-8?B?V3psWnBUcTdTL3BSRlhIL0JOdFVRaVY4c2Q5cTlReU84RkpxbytuVEZOcUdm?=
 =?utf-8?B?Z3BSRzBtUmVUN2dabnZYb1lYV3l6VlA4am4vQ3o4VGRFWWlIeFg3VG9ubk1r?=
 =?utf-8?B?dSszcUVNZ202TjNsNklCb2x6SnBSWk44aitKSW01TFhUYTJOSzMvZG9URVdj?=
 =?utf-8?B?cTV1Y0dVK3NNOGNGZ3dPT2MvanhFUzdwNXRyWWJKc1FING05Mmg0empjT09I?=
 =?utf-8?B?eXJkU05HNEc3b3NiNUx2NzBPMFZIVUphalFZd2NMRkoyY3NpcUFFSUZTVXdp?=
 =?utf-8?B?TWhtNS9zSXRlSjlLYVVKcnVNK3U5NWpOZEFjVmRvdVNrdUtaNmljVUZ0LzFI?=
 =?utf-8?B?cXlNc25NcDlHaFIzUHo4QTRibFh5UVY0TzF1R3JRaDFPWGJ4Um5OSUdhY2s4?=
 =?utf-8?B?Q2J3c0JzTGlFanExU2lkandFSXlyLzI3czd2WlZqeFBmNmdib0hHM2U2S3Bv?=
 =?utf-8?B?NFFzcUJKTXpraFpYbGM2aVRIZ2QyVTJUVmtWZXY5bUdRWXM2NGwvV004cytF?=
 =?utf-8?Q?kSEJ9n+Qi+3qZEag=3D?=
X-Exchange-RoutingPolicyChecked: kLBB4qGh1ImKfL986h3o61209toFq3WEyOqWbPtJI43b/k5uS8kPhcncaSWMTPiai2Ae1MLjGXvZH02Bn9Q+K2mticYCoKiDgFwQAGXfEkE35auPSi3qKZTI7VWnz76tJVXqhXAXmfPaJB7waDWsDbrHpDLx3wM3dQs5OXwv5AcqwGVqXtTEHxdWyASoAUby3j6ytEZDrrVU7hpOl2RCrtc4gAgn8wOdK2vA0O5MuYlX2zG04ZeIIi0N/OXeR0dz8VUHmT1xMKn+hyk/xwlsNWIKgsN+DyttkaD9c7AWXPs4er84tI1MEu1JT+4iJ5MoSLwacSjqXK+5u3i9lpVwBw==
X-MS-Exchange-CrossTenant-Network-Message-Id: a576b38a-f066-4a4e-9e44-08dee30bd9f2
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 07:28:37.5098 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XMCfcyjwqVR3oxarLejWeanxrt3Fq3/fwysn71h5uCIMPI1p7z4+Y5UfbT3udTOs83zSvK1HJ+Bv3wGhlrQzm/AZCLr479L16L7Ge2oyvGM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6659
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

Hi Sebastian,

On 2026-07-15 at 14:15:16 +0200, Sebastian Brzezinka wrote:
> Add drm/pciaccess-dependent stubs into a new igt_drm_stub.c.  This avoids
> pulling libdrm into tools that only need dep-free logging and exit stubs.
> 
> The new lib_igt_drm_stub static sub-library provides: igt_pci_system_init,
> is_i915_device, is_intel_device, xe_dev_id and __drm_open_driver.
> 
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
> ---

Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

-- 
Best Regards,
Krzysztof
