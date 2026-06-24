Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2973CDB479
	for <igt-dev@archiver.kernel.org>; Wed, 24 Jun 2026 09:54:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D8A410E05E;
	Wed, 24 Jun 2026 09:54:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GjGuGE0/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23A8110E05E
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Jun 2026 09:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782294831; x=1813830831;
 h=content-transfer-encoding:date:message-id:cc:subject:
 from:to:references:in-reply-to:mime-version;
 bh=B8crvt5ABlm5wlQ6wIDp53UShDViEgyx6aF5eZPLz/M=;
 b=GjGuGE0/oYvSFoBs6U301HUJeUQQR569M0hJL9gNiVNYtbKOz0/quJLE
 Dg/Z9sADgzw/UYuZKondvngb9w1RbGz+Q5SyFDkQhp9a/nev5UrV1nLXx
 4OY3KmfsaeDCFpVAIwCT2ulnXrpR/jQ+hAbM8o2u8VCxcBkA3GLr+I+Qc
 YouMb4yVuM26vZvJvlwA4bZUjGDv61adnKddjSzYKoDbRW7J79mlf+Hh/
 1H4Sz3ak049yTqbAHpe00c46H5JF12F/BJDUDm2zlm66hMo+bVu2l+iEf
 nRFg/E2l3683mYO7TLM+N1612e40ffeq16FKbTNyC8YgUoGSSfGN44kR4 w==;
X-CSE-ConnectionGUID: 9loux/MhQkCfWUDnwCgXOA==
X-CSE-MsgGUID: IhuAi4aCRxyyACYFY7qrrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="83101112"
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="83101112"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 02:53:51 -0700
X-CSE-ConnectionGUID: 8UHfOWN7QoqAdphHmcbobQ==
X-CSE-MsgGUID: rElz1oZmSjOz4b+dLoPuRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="247430467"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 02:53:50 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 24 Jun 2026 02:53:50 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 24 Jun 2026 02:53:50 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.20) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 24 Jun 2026 02:53:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vjexiT/N8RuSEjV6l5+Qtxs2CtEur0LG0GgIU63xw3XJQzMwJGG/DGAn5TLpB0FCciM4OFRN5eIzxD1Z/nxflJHZrNWSeXxGmsEB3GEo0WFDp510Hfp0G8BmB6nJ4xRyH1RIqpAv4htSXGG2lbqHNyBETKF58UTYZ3aMQ6aDo+97jSGVpn+xYOxJMsBU2ozDxvvGX+lo+cI07xCbgEccj7obyDjGC5RuQaI4P+B9ElDNEZF6A+Gi56ynPEoCwIYwVVlJuxg3L65Z6HN5SMn2Q7UCcbV9R+ZdzZu0c/SEDm6PZQVnWIQnJFclO1J0rn1Lf8oAFkUqnbwI45zCzG+7HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HTtbYo4aauHHhpNKVmN7Nxh8g+CV3qy4CZKFGhMVV60=;
 b=pHcwhTjUHOHcClBwt0Ehvh9o0kBha0yx8yLbNUxld3xUXCfbdJZGH8IrBOUDXz++/eieNZPCeESffdzkP2NYdQxYzxbDM+7qArLXPnZd5MSOjWYexwBnsaXqWp2DUuKBySlsUnKm4eMMQiKgQ8CDR7/ojweUaIf5LPp2hsMDInjZqLAWLUKjsnbhP+oaoCNJb/kUjP50jlXq2ruK5LhIs7Meed2zZskfD1+IiNgB9sDMFQlxztp9V5GLZfW5X4R2vQ191heGMhWRgtvkDoMaE+EAWyH3n1RXXD88C66bQf10N0+bs89Io1RAqWx8YLlWSf1TzvD+YdpVGeHPkniihw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4SPRMB0067.namprd11.prod.outlook.com (2603:10b6:303:221::22)
 by CY5PR11MB6162.namprd11.prod.outlook.com (2603:10b6:930:29::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.18; Wed, 24 Jun
 2026 09:53:47 +0000
Received: from MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a]) by MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a%3]) with mapi id 15.21.0113.020; Wed, 24 Jun 2026
 09:53:47 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 24 Jun 2026 11:54:16 +0200
Message-ID: <DJH6SPTN4KBN.3JB1UQ6IQ2PS@intel.com>
CC: Andi Shyti <andi.shyti@linux.intel.com>, Janusz Krzysztofik
 <janusz.krzysztofik@linux.intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Krzysztof Karas
 <krzysztof.karas@intel.com>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>
Subject: Re: [PATCH i-g-t 2/3] tests/gpu_buddy: Update buddy allocator tests
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 <igt-dev@lists.freedesktop.org>
X-Mailer: aerc 0.21.0
References: <20260623200152.12996-1-krzysztof.niemiec@intel.com>
 <20260623200152.12996-3-krzysztof.niemiec@intel.com>
In-Reply-To: <20260623200152.12996-3-krzysztof.niemiec@intel.com>
X-ClientProxiedBy: DU2P250CA0021.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:10:231::26) To MW4SPRMB0067.namprd11.prod.outlook.com
 (2603:10b6:303:221::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4SPRMB0067:EE_|CY5PR11MB6162:EE_
X-MS-Office365-Filtering-Correlation-Id: 74ae486c-58e9-47ee-132a-08ded1d67c67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|6133799003|22082099003|4143699003|5023799004|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: gDIuAp2Mp9ejJm5thntGHfdceU4SNfTOwHOqFxoJpBghmc9WVJQ7b/qXQjZ4eY3eXSjFRg62l/lAqwS8IJpnJj2agBe+ZOswPCytC7FdqeuJ+WjnG9ONbrnANmD2sa0JECKwOeOdXejL7HlPphNfnQU4cNqiYOTqL5XpZbpG2DFTWGZObOaqxGSpCZN59XdeYD7bOYoCQoJIbsgY9ZtenWbL8CoDUFIerdHDpRl9nv9jjNMPfTaZvE2A4kIQMRB41yqVCmm1LNfkel2c45QN4B7dyXr0t2++JFOSczIhqz1tKYUjatvlfyoS043cbvp6wKkZQMLePKfrwnDYpWbabJQK5uAYcMIIOs6uIHWUVgvy+z0qwc4VtKEAVVT/wCz+N4GQ0nOjMU7YqZK2yMXZBsY/P9y8pOnT98dSobWVRBEHV6J4wZbt+ESxa5X0ZkaHM3KNVjQCj5PwYx3/KJLr7egbqE7FCT284Fylg3RpXFE9LNUXYTNmJ67Ova+2SRMTJwlAhIHmqrGJTZhbzVmGzi2WkOOIeoyI0MQfLUaOvZ+KefHXyqBORqdFmNjeNzpSFxNtzdvd8XiHox3veoA2a29ap2e23l+unuAnGBuT5dqrNc1uXIK1khDG8dczAKK5z83TwkVgqgSBKpVEvL2CQH2FYleHpCb8M+8cI61UBSw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4SPRMB0067.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(6133799003)(22082099003)(4143699003)(5023799004)(11063799006)(56012099006)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L3d5TWM4Y3JtMmJqTkFhZ3Z2SkpVcDY0bmxNUUdHaE84bGhzNFd6aWluaU9R?=
 =?utf-8?B?SmxTZnZvcjhTcDhVaGtpOU54T0k3QUozZGRvSU56OEJ5Tk96cjZmTEo2UmlX?=
 =?utf-8?B?MGtic1JxSnhjUzkrR0htRTRLVUI3WmhHREx4TzZ3d3k2dFR5UUlWT091UFMz?=
 =?utf-8?B?NGZpdnIwdmNuOGYxc3NyNG9hYUpZWS94TEdXYlFEQ3FEa25jZHRRaktyLy9p?=
 =?utf-8?B?Z3NmMHJPU1hqQU9FMHA0aWFVbVdhOGFQenJpSytzR1Vld2VrRSt5M0J4aU5v?=
 =?utf-8?B?SkpGOThXT1NUby83c29oajQycnJURE55NGdUaEhCbXJGSGtxUHlYKzlFQitH?=
 =?utf-8?B?SkFXQ1NGR0REQ1N1aDhQcVhMVHNiTlJ0M0tQZzFYMGtOVlErNjhXODNCSU5t?=
 =?utf-8?B?R3RZbmZJQmhuRk1hai9NdmY1b25uaFB2RFNNdm9jazRKQ1FsVkhvMzFNV2h6?=
 =?utf-8?B?enh6ZkNlYVJxRWQwSDhMb0JNRVdGMnJyNGwvTkJkNjVxNWR2OTB3WWNqMEwz?=
 =?utf-8?B?Z2hrejIxUmh3cXF2em5oVjd6dlVsakJLT2N5TmorQ0RkbkxIYXNlWk5KZjYx?=
 =?utf-8?B?R2hpd2JJTThwWkppMStpMTNVVVJ2bUVuVlBTZnhLL0pSVkZTTEMwNDVQVWQ3?=
 =?utf-8?B?d1NSblRDOHhTOFJjSlJXaE1ZNCtNYnJPZEpKaStnd2dwS3pMcXArdHJRK3pa?=
 =?utf-8?B?bDFZOE9QTXFOREdJZzBMQlFRUnBjWmsrVmlHR1dOV1d5SGRDVUNpaG9WQVA4?=
 =?utf-8?B?VXBIMzN6MGNWWE44RnBBNTlzeklRYUlBM0cwL295dGphYXhDcENyeUN4cW03?=
 =?utf-8?B?QlNjTlRXWUhEa1JHbElxTWNYNzFlM2xMVm1GOUhqc0swdFZDbzVCdzcwRTZC?=
 =?utf-8?B?dlBjVGVtZzdrWkJsUllnQjF2V3FML1AycFUvdDE1WEIrbmk4Y2dCZ3I2VkVy?=
 =?utf-8?B?bHcyM00wVE5GSU1nZ25tSWJVYmJwcVhWZVhaUnlaOExMVlAzYUFMUkxCRmow?=
 =?utf-8?B?VlpIdWxvYTRRSml2Sk1Gc0IvZHVNWDJCbURqb1hwS2FwWmFWbzhWNzk4NjJV?=
 =?utf-8?B?cmVuMnYrZTNUQ2swNWJHbld5cTltMUdZbk5PV091dWpiRVJHbU94UEJ3L2dj?=
 =?utf-8?B?TkFlZkxuZXMxWlFCK0xmcFhOaVh2MkNJYXFxZi9vUFlUeVJFMXhqUHZjd0Iz?=
 =?utf-8?B?MzUvOUcwa3F6U3ExUDh2UmdRMkZvUkxuU2NPaTZOQW4wZUtaSEVxYVlzcjli?=
 =?utf-8?B?YVJsVSs5RVBtTFArTS9ab3R1SFFuRXhoc1o0UGlOMU5xcTdoSVV1SXJEV3lW?=
 =?utf-8?B?WitNOWFVY214MVJ1V29iTkpRRWdEczFhMkIzNVN4alVhOG5vNTl5NGtlVDJU?=
 =?utf-8?B?ODIyYWhzUmVyZ1Z1VGYrNjN0YUcyYWJqL1ovanJJRkdQVlNiOElJa3AwYStz?=
 =?utf-8?B?YWYvMHR2cnlwT242VmVTdlBwNi9Wek5pUmxkeHVrUEllbGpydFZKM05zSUlu?=
 =?utf-8?B?WitTTVBGUHNOTjNIayt4UHhuNmo5cExKcUxhOVBEekJHb2RRaFJOeDRnZ1di?=
 =?utf-8?B?elVuelU5TFcwNXNkSkdpaXJJTGRneGFlWkJQcVo0K094UWN6elBMeUZaUHRZ?=
 =?utf-8?B?THducGpSeXp6TzNVRDVTWlE1dExuNHYzcER5UXZhK2ltMTZSbWxqNm1mMW1h?=
 =?utf-8?B?d2owdHpkQlg4RUdsQTFxdTl2bFQyTEQrRHFiOGRzZTl3RGl1UW1MSVE4Q2NQ?=
 =?utf-8?B?eGE1WXB6aFUyOGhKWFBRSTMweTNncW9JaU5iSmM3OW55VVJpaVVBcE5GSDUz?=
 =?utf-8?B?aHg5QkpnRWFTemhyaXpYZHBIK0huTHJXYmhiVG1iaGt3WGhud3UyVnVRQ1Mx?=
 =?utf-8?B?THlCd0RucGRlK0Q4KzBLT1poWEVsVllKQ2VoN1NBb1JNMFRhb3pTQ3J5WUZU?=
 =?utf-8?B?b3V4bmRRdkdwY0dkbTF5Tm1maHhRaEdwZjFzRHpSK09Db2xUbU1nTm85MDlu?=
 =?utf-8?B?UlFQcVllODBuRUllZXpRa0Z5ZVVoUmZFMzdmR1I1Rld4TTRZSFI4TklxTkJJ?=
 =?utf-8?B?TXpTMzZpY0pRRHYzcEQwREhxMEMreFNjbDFLS0VHWURoaFkzb3V2bnU1MllL?=
 =?utf-8?B?Mkl6dktDMnBZR1FQRUg2a1FJNnlOYjlJS0J4SzN1eWRiZ3l6Si9nMVRhLzdD?=
 =?utf-8?B?S2hCa01BbnUxN1BtV2h2VFZyMUd3NkNWWG03Z1l1N0FzSmdueTkyTE1RMUtH?=
 =?utf-8?B?TkF1L0twbjNSTjNYMk1zTnBXY2dCaFRCZDE5OS9Vb1k4ZDdxSkNvb25FTVJq?=
 =?utf-8?B?bWlPc2IxMjhoQmRLVmdGdU16eWgyU1JEekp5MFhLZE85T05FTmdJZ2VobExi?=
 =?utf-8?Q?/uKUOGbydbyStiMc=3D?=
X-Exchange-RoutingPolicyChecked: hwCIPQIwFy4LYxPQa3tG58ngU18YuCrDElC6bWH29Kavqivj5exlGmwVxgaiibm4JXQiTC2P7h2Bn205wpdOylZmdy8E92vyiWq3jAWtq3cXtYdFzEciCP/DrJeOEh4/nHIvjSLomG2+ftz+H3LkUSQClwEew9spQtfNJRBM5ZdTZuxGERjUMKV1teiRYq2unb8tGkvqA8pYuBj5IyW4zvEYmRziMflrQOElozHbQggqcd4BjSUHFJ7xQnAdWe7vl/E0g2dhUMPNGEOJt0bTbFo80yJW8bZMaI4n7xCQ4LHsiFLKrYj6oXWw3Q6czWW3RB9eWBkKMzYMCbM7we/P6Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 74ae486c-58e9-47ee-132a-08ded1d67c67
X-MS-Exchange-CrossTenant-AuthSource: MW4SPRMB0067.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 09:53:47.4471 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZVx7F9CPMsHuNIxCK5jvCWxTEdYD70iLVDXW64myI0zCE1ILNmQr8nfk16jxpoN4F8Q49czcda8iEBjAtxj7QuyWpGAyMGVfWcLxkRrKq54=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6162
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

Hi Krzysztof,

On Tue Jun 23, 2026 at 10:01 PM CEST, Krzysztof Niemiec wrote:
> The DRM buddy allocator has been moved one level up, and is now renamed
> to just the GPU buddy allocator. This means that the .ko object used to
> run the KUnit test has been renamed, so IGT tries to run a test that
> doesn't exist anymore.
>
> Rename the drm_buddy.c file to gpu_buddy.c to reflect the kernel change,
> and update the igt_kunit() call to invoke the proper tests. Also update
> tests/meson.build to prevent the build system from trying to build
> drm_buddy, and make it build gpu_buddy in its stead.
>
> Signed-off-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
> ---
>  tests/{drm_buddy.c =3D> gpu_buddy.c} | 4 ++--
>  tests/meson.build                  | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
>  rename tests/{drm_buddy.c =3D> gpu_buddy.c} (51%)
>
> diff --git a/tests/drm_buddy.c b/tests/gpu_buddy.c
> similarity index 51%
> rename from tests/drm_buddy.c
> rename to tests/gpu_buddy.c
> index dbc7c957d..8683b5af0 100644
> --- a/tests/drm_buddy.c
> +++ b/tests/gpu_buddy.c
> @@ -6,9 +6,9 @@
>  #include "igt.h"
>  #include "igt_kmod.h"
> =20
> -IGT_TEST_DESCRIPTION("Basic sanity check of DRM's buddy allocator (struc=
t drm_buddy)");
> +IGT_TEST_DESCRIPTION("Basic sanity check of the GPU buddy allocator (str=
uct gpu_buddy)");
> =20
>  int igt_main()
>  {
> -	igt_kunit("drm_buddy_test", NULL, NULL);
> +	igt_kunit("gpu_buddy_tests", NULL, NULL);
For some reason, I checked it, and igt_kunit uses strstr() to match _test,
so the _tests might be ok. Still, I would prefer the singular form.

But if it works, I'm fine with this.
Reviewed-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>

--=20
Best regards,
Sebastian

