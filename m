Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9536BC27C4F
	for <igt-dev@archiver.kernel.org>; Tue, 18 Jun 2024 09:55:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B57A10E242;
	Tue, 18 Jun 2024 09:55:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OiL3MGBz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4B1210E242;
 Tue, 18 Jun 2024 09:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718704557; x=1750240557;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=7J7AHDEgeq5yjdqb8X1el073PCNP3Cr2I6vU7I8HsXY=;
 b=OiL3MGBzHM3n+g4y7fO3qIBYmUUxLzXdveCbCPQ+Zmc2oCu0qKlbp8wC
 QfSxbtejDuU1b9ux57TExe435uycPgEcIPXfBwIoTLP6Z3h+YqS4a/ghp
 gRXn3jN9qBi1lpmzN6Qog3zVoCXNjjNWUDO0qGguplMJyDUvsUcz4YpHm
 ps/5cV9mBIIHzIhDNKSQKZ6EusvWDbA6ojpfRodyF/7PjB5F+EvubmyCP
 mDbuWwimETBa1iK3bgKJ1zGq3y6stKoE8A5zrDVegBUvOQu0T/lXyQC6V
 BzXAXpmR4U9HeaZLU9ORopy8AqOI7H9hM5gHGTM/0sXYCgybykZoqmeig A==;
X-CSE-ConnectionGUID: MZWWSW3wTJSqJExQWGgjgQ==
X-CSE-MsgGUID: yZQM+GSJTeOYg5TrYc7TyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="15805293"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="15805293"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2024 02:55:55 -0700
X-CSE-ConnectionGUID: J+NaKwNGTF2uMevSVtBvCA==
X-CSE-MsgGUID: JcAWMKZ/QMaZmMQJXNJ7fA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="41606449"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Jun 2024 02:55:56 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 18 Jun 2024 02:55:55 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 18 Jun 2024 02:55:54 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 18 Jun 2024 02:55:54 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 18 Jun 2024 02:55:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iX7BJ0JyymMk7+VM2jhSdaeEylqixa4/fBdeVXCIDzkTMlyFx62i6FoR/m5Dyc+HalFZZKIw1cEFRz36eVmGyllNgcMIFykSYf6sVT5S93g6etz/YXdlUzTRoQK+eWQuu1aVX82+WpLRKQ+5AmPLmG32T9A4/ExVpc95El8eFBtFmr4zWDBJO458soEZ4/JPChrZfV6l1+w5tDrcrGZg6QhXtDYKeaJTEZTFUlQSnx+s2HDXCyp8L1M6tk5GiMGDK1tMpDm+vf2kInhjmmtRl4H/aFTdz7HJU1cL3dtWkWgSzzO0kSrT9sGktkJjO0loVq8M+ZSCD8nE95uTnmy1jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y1vYshtj5rRlO2bWqpRqnPhW8N648M3JFcfkH9TecD0=;
 b=AWCKymQRdR+yKdCRAfLD6QL9tg5avcTpU7NKpbbPS7kkoAwVN4V9gFbm5cDjFLzRb0A+DkcBeMWnrSwPBZVVMtjWMBzk/CvTP8EOtz3GfL1rvPW2+AKHKjB75mHyspVeclyOUz3Gc4ix2j21sSPxOQKEA2TrpuAmgVFgADvFhS5NHjEqcJyehQgQJh5bmWUrIQTNlJEGXm4r7D5nEdR3sVPQG5Caj53brDR8NWWXN0cYoL96XVzaDafvafSnCicZXOIOqsePh/ct0eX/cdp/HpHbIOHtY9zrd+LKMnDPRo+NsjzvfTdIXaNOTJkPZ7US30XWg38FKLJbfVwcj+gQCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5719.namprd11.prod.outlook.com (2603:10b6:8:10::6) by
 PH7PR11MB6956.namprd11.prod.outlook.com (2603:10b6:510:207::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.33; Tue, 18 Jun
 2024 09:55:51 +0000
Received: from DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::9996:d2ce:a20:d9bf]) by DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::9996:d2ce:a20:d9bf%4]) with mapi id 15.20.7677.030; Tue, 18 Jun 2024
 09:55:51 +0000
Message-ID: <03c9094e-1fb6-4cba-8da3-2628a967c4b5@intel.com>
Date: Tue, 18 Jun 2024 15:25:30 +0530
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2ExeBAT=3A_failure_for_lib/gpgpu=3A_ad?=
 =?UTF-8?Q?d_shader_support_=28rev7=29?=
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 <I915-ci-infra@lists.freedesktop.org>, Jari Tahvanainen
 <jari.tahvanainen@intel.com>
References: <20240612-iga64_inline_ups-v7-0-0d4b840498c7@intel.com>
 <171818753213.68617.8043397927356476587@a6498e030952>
 <20240614132731.vizhnvphj22kyek5@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20240614132731.vizhnvphj22kyek5@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2P153CA0027.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::14)
 To DM8PR11MB5719.namprd11.prod.outlook.com
 (2603:10b6:8:10::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5719:EE_|PH7PR11MB6956:EE_
X-MS-Office365-Filtering-Correlation-Id: fa64bcd1-ae4e-4912-6249-08dc8f7cd60a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|1800799021|376011|366013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eTRLUUJ1dXl0am9Eb3M1ZGt2MFFsUzhpREVLcXBPQ3U5YTFhNXpnd1orUzBz?=
 =?utf-8?B?R1h1MU5xWVNoZzNRUWFKYVZVUTlaWWduWW5OR2NsTHl1dzAzMlp4bDhZOXJD?=
 =?utf-8?B?S1VKOG0xR1pKYjVtSFF5VUo4VUdOSGtReDRnZHBYVGNRNFVxM0svNmxJbUpS?=
 =?utf-8?B?bnlRaXdZa0VhSFVYbEUyOEpZOWVIbElXaXFydkx2NTZIR2VqUGMzQXJkeUV0?=
 =?utf-8?B?U0pzTU9LQVk4MGUrcmsxZXVQMEMyZFpNNDEvam5iNHNva25nUkdBOTdMM0sw?=
 =?utf-8?B?MWZvb29HNktKYVhqWmdtenhkSXovWW85VVBqL3lTU1kyN1RvUC96R29kbmdr?=
 =?utf-8?B?aFJvQWpSWlZiUm9VRWpzTHh3eEJnVDJSTThwUzZCOVM1REV0dHowNkY2NkVa?=
 =?utf-8?B?WTNVeFRQQ2dhMlc3cStENWZIZktNbFRnTnVIMGgrVWdaSzRCM2F6UkRlUVFI?=
 =?utf-8?B?TEVqYVovaWJHR3VGQlc5MzlGSzVIb1E4VjE0WmRCQy8vbG9YeHlkSWQraXhw?=
 =?utf-8?B?RE5CbGl5SGJQSkpLSTRSVHBmbk1BNDJ2VWhFTENBS1pTVGZqS1JxYmZqQlpI?=
 =?utf-8?B?dW45Q0xQZjhCa0ZqMllsZEJJamdJMENza2lCaWp6WXV2SVJacWZtWFc4ZW9j?=
 =?utf-8?B?bUFwcWw4TCtUV0VEVjFJY0t1MHAzTXd5TEtTeW1rZHd5ZHB2Umd5N2Mrc1kx?=
 =?utf-8?B?OGFaTDFla1NPUWJkSWZMNGtXTXpwVXcvMTRHSTFXOEE3bmc3dkt0ZXdXZVMx?=
 =?utf-8?B?TUY1MUpnd2FQV1JjR3U5OXRvanBDOFNDelNqVjVjNnA1b2E2QjRBUFJ3TzF1?=
 =?utf-8?B?NTBDaGJSZlhva2owczhUNUZjeXdraGEzTVhMVTQ2Rkw2b1pxeElhbTFCWjU3?=
 =?utf-8?B?ZExkSG5XSVl6M0gxUEhtS2hyaklwR0I4SThrby9oN0ZjbldWQkI4TXVXVmpW?=
 =?utf-8?B?cEg1V0hIQ2JlZG1zcWZ0alljcE90SFhUVysxbGRhOS9yM2hTMUQyQUViQTFN?=
 =?utf-8?B?WGJMM050Sk84U2p2THhXUm1TOFltYk1IamVBdG1Rd0o0MlRsZlpzekc1NHJH?=
 =?utf-8?B?UU5haExoR2c3YnJXa2xTajJrV1lEbFp6SmZzbjd0b0ZuemVWTEhmdkEzbDdv?=
 =?utf-8?B?djhwYVFwU1ZuVWV0QmVvdVR0TVdTL2J1U3Zyc3B4cktBbnlzOElZVW5CcWhX?=
 =?utf-8?B?Q0s1S3JBdzM2MCtjMFg2dS9Jb2Q2Y0ZXZjJNZ0kyZCsweHZsdzBnVXJuMTEr?=
 =?utf-8?B?TXl3TVB4TFdNRTZPUFAwd1RmWk1yV081NzEzWFhPQkxkWWJna09kV0NRMXlJ?=
 =?utf-8?B?dWJSSHUzVG5PdTk2UEtrbURNa0xaS3VYU2FQSnpMQWpFZ28yaFlqWE9zTjVM?=
 =?utf-8?B?TVBZbVFMZUwvQ2RudUYwbDBDMlNGTE84VXVYVVJaMm4xOFEvUVc0QzRid0w0?=
 =?utf-8?B?S2NDYmgyaEJmYWQ0N2l1R2ozb3c5YW5QWWVPcW81WE10NjBBckk1a05GRkJZ?=
 =?utf-8?B?WmpGMlhtSDhFdVA4RElMK05zVVZUZFM5bVNPeGtZNSt5SnBtNDgzTzNHZGNS?=
 =?utf-8?B?RWZPOW9laHlRREY0REJZdVU2d29EV3JiOHk1Qml2YUIyMGVIRzNLaHo2bDNM?=
 =?utf-8?B?M1dXUGhRL0lzRWo1empVQXJkRlZrWm1TaFdoczBGSklYWGxXa01Ea09yU2RQ?=
 =?utf-8?Q?ohKafeAo+U4TYGNNfk2L?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5719.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(1800799021)(376011)(366013); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R0FkYmthdG1wWnNNME1HUUs4K2xZTTMyRlM1d3MyRXVhenZtbloxQUR1RldL?=
 =?utf-8?B?STRqQnpNeE1kS09ndnFteGhZcDJBb1NLTGNjYWJFazdRaGxwTVNVbHB2Qi92?=
 =?utf-8?B?YUNmek9TbDlTQVZUQm5yL1FCVnlyczBDRm9Ja255cGh1Y3lKOVJBK3RaeHpQ?=
 =?utf-8?B?SGRWSEpxWnlyRXJRd0hPKytXd0RxRkJOMzlac2Z6Z3I2QW1Jek9TMytsQXZy?=
 =?utf-8?B?NGxxc1pwVkhxanM0VU1FNjkrK1VYanRwT01UeDVtZWFlTWIrWGk0M1FkVGZr?=
 =?utf-8?B?cW9tWEdtMVpZYno0aWRwOHgvUVltY3UyaTRYdy9xUW9EMGp2a3hkM3J4UU5k?=
 =?utf-8?B?c2tmSXNIV3krcUJNdTVwSVdiVVFHTCtWdkE4cnNXUlBLdnhmOTE2THhETUVq?=
 =?utf-8?B?QjV4c3hiSi9UdERYMkYvcmV2YzhFd3NhMTl1Q3NhM2NIRzY5VmNjbVpnZlZk?=
 =?utf-8?B?aFZuWVhRNDNzSWd5aFd5cnF5U1JqT0F2M0ZGem9FR2d1bkRoVDVEbksxd3Ez?=
 =?utf-8?B?WWpBTkJXZFhXc0dIRmYvTDNKY0NCemJjcjh4NmNpbHk5QTNvR1JIdjFIeVdW?=
 =?utf-8?B?V2tBR2hZYmd3WUorRDF2eS9UR0MzMG5tdm02dVlicmVxRjZhUlhldzRwSXBk?=
 =?utf-8?B?N3VaVW05QVd6YUtwVncwZDNaYlk4MEtESFYwaEkvcXpYdTBGVE9MYm5obzhD?=
 =?utf-8?B?RUlkZjZydGVvM3FSLzdPaWxHM2dRK3RjaVUxTGtlN1pnTjNoRFdJQVMvNjdV?=
 =?utf-8?B?RFczV0lsSUFML2RZb3VPSmdtMmNnYmdzL0N6cCtwYWJhK0hpd3lTL214eFJp?=
 =?utf-8?B?MGJFdGxseHhDL0pVM1c2Sno1VXo5NzE0QVZQcndhaVE2OVZ6cFY4dVdsa0dL?=
 =?utf-8?B?VmtTYUZocG5rRkJXUVZwM1h2akxaRk85NjR3L3VMV0QwSStTZjl3NHpqQ2Uw?=
 =?utf-8?B?UVBSeldXRW0yUTFqWGRLbmFDZGhodnl3Q1RxR2ZjamV4MXB2L01sendZUnhl?=
 =?utf-8?B?dzZHcGkyWUtwc1htcGlybXZCQnBLNkpSVUFST1ZOcnUwRVhWOXpCWElkSEV6?=
 =?utf-8?B?VlFkakV5Y2hJTWNUSjF0Umd1VnZJVlFBZDJZSDBPZDNwdU1IRVo5RVpEdW0r?=
 =?utf-8?B?d0lPbXhBQm5KSmNMV2o1NmY0akNoMys2eGdiU2RvWmE4cnFKVWlhR01NT0dy?=
 =?utf-8?B?TW5WbXQycC9ESmtNZWdlbVlyMGRnNGh6aUd0YVI1Wnp3SHhPMGtONkxDVHFD?=
 =?utf-8?B?TnczM0E5eEZERDFhN3VzRjY1Q3VGa0dRZDNRb09SdXhIenBpTC9sdmMvUGlp?=
 =?utf-8?B?YWxWQjlFWFdJaHhPb3NvMlVKcDM2RFhLMWtlTTdKbmpDb0FsQnFYV2pvTVBw?=
 =?utf-8?B?YWRUbVNDMHB4TEtkeXE4dEhjWnBkZWIyNGdNc0FzWG5JTHZ0cnhRanhIWUwv?=
 =?utf-8?B?MUE5dDFYVHdaaktBTnFPRDNPUjBLZXB4THFDRFhYOVorL292QkV0aVFMZEdp?=
 =?utf-8?B?WXpsTzFqRjVBbUFCVTRJd2F1bGxPT1BxVFZWMmprV1ZWaVpBM29yNkNsYmJC?=
 =?utf-8?B?SWU0QzlZQUM4M0Z1VEJHMDJaWjIzS3B2b0s2ZXdjaG9oNFY2Q3BSMS9OZVFr?=
 =?utf-8?B?RG04REl2aHhIT1ZYREJUZ2toUUpqWFozeG5rUnVUS1J4Z0RVQVBQeWFRRm02?=
 =?utf-8?B?VVdHWHBYeklja1pRRkNxT2NzWC9RVTU5eU9CQStlcGNDSW42TkFxSkpUR0tG?=
 =?utf-8?B?VjJxeHVxVTNpZkRia3RRbk5McU50ZlZmNGcvbFE0U2hYaFg0b3d5cmd3aVV4?=
 =?utf-8?B?dWdmOXVuOG5vbGtoTWwrb0RYQ3FDQjIvUyt6ckdnS1QyYVo1VEJZR1dZT213?=
 =?utf-8?B?Vko1VUgwUUQ1eVoyeVpQd0xXdmxqRGlFVi9ybFYwbGlKWWQ4WS8vSlhRSGRB?=
 =?utf-8?B?Z1kzWGZiejR1T1kxYVdoQmhxVU5zNzFra1MzWDg0dnhsT1V3SVEzeWZUaVdI?=
 =?utf-8?B?b2w0azFnRXFkQ2FFWEZEaTQwaFlKTCtYZE1GNCs3T0wwS25XVm9EVktBZGIv?=
 =?utf-8?B?aWJ1Ym4xbk5UbzVxemFwNXRRdVBYcTFFSzVSZ3lSS0FvR2szSnplK3ZvVTdT?=
 =?utf-8?B?eE1oVTJDK0FHYVB2c0ZYeWtQYTZSd0o1WG9CQmZUWExkZEEyTEcyVm1HSlp5?=
 =?utf-8?B?MHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fa64bcd1-ae4e-4912-6249-08dc8f7cd60a
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2024 09:55:51.2569 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iDOKQJQizLf6z9f+H1lHwRxwoCdNtQZHQ83L9gpG85omoQ7v0UbiD8FuF/3KssfNkj6gNdAiiwx9FMhTFivBRLRLadlcqzhd5NvhmobYmXY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6956
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



On 14-06-2024 06:57 pm, Kamil Konieczny wrote:
> Hi igt-dev,
> On 2024-06-12 at 10:18:52 -0000, Patchwork wrote:
>> == Series Details ==
>>
>> Series: lib/gpgpu: add shader support (rev7)
>> URL   : https://patchwork.freedesktop.org/series/133020/
>> State : failure
>>
>> == Summary ==
>>
>> CI Bug Log - changes from XEIGT_7882_BAT -> XEIGTPW_11252_BAT
>> ====================================================
>>
>> Summary
>> -------
>>
>>    **FAILURE**
>>
>>    Serious unknown changes coming with XEIGTPW_11252_BAT absolutely need to be
>>    verified manually.
>>    
>>    If you think the reported changes have nothing to do with the changes
>>    introduced in XEIGTPW_11252_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>>    to document this new failure mode, which will reduce false positives in CI.
>>
>>    
>>
>> Participating hosts (4 -> 1)
>> ------------------------------
>>
>>    ERROR: It appears as if the changes made in XEIGTPW_11252_BAT prevented too many machines from booting.
>>
>>    Additional (1): bat-pvc-2
>>    Missing    (4): bat-atsm-2 bat-dg2-oem2 bat-lnl-1 bat-adlp-7
> 
> This is unlikly.
> 
>>
>> Known issues
>> ------------
>>
>>    Here are the changes found in XEIGTPW_11252_BAT that come from known issues:
>>
>> ### IGT changes ###
>>
>> #### Issues hit ####
>>
>>    * igt@kms_addfb_basic@addfb25-x-tiled-legacy:
>>      - bat-pvc-2:          NOTRUN -> [SKIP][1] ([i915#6077]) +30 other tests skip
>>     [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11252/bat-pvc-2/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html
>>
> 
> imho PVC has no display so all kms tests should be blocklisted
> for this particular GPU. Adding Bhanu and Jari to cc.

I'm not sure we have a platform specific blocklist?

- Bhanu

> 
> Regards,
> Kamil
> 
>>    * igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:
>>      - bat-pvc-2:          NOTRUN -> [SKIP][2] ([Intel XE#1024] / [Intel XE#782]) +5 other tests skip
>>     [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11252/bat-pvc-2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
>>
>>    * igt@kms_dsc@dsc-basic:
>>      - bat-pvc-2:          NOTRUN -> [SKIP][3] ([Intel XE#1024] / [Intel XE#784])
>>     [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11252/bat-pvc-2/igt@kms_dsc@dsc-basic.html
>>
>>    * igt@kms_flip@basic-flip-vs-dpms:
>>      - bat-pvc-2:          NOTRUN -> [SKIP][4] ([Intel XE#1024] / [Intel XE#947]) +3 other tests skip
>>     [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11252/bat-pvc-2/igt@kms_flip@basic-flip-vs-dpms.html
>>
>>    * igt@kms_force_connector_basic@force-connector-state:
>>      - bat-pvc-2:          NOTRUN -> [SKIP][5] ([Intel XE#540]) +3 other tests skip
>>     [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11252/bat-pvc-2/igt@kms_force_connector_basic@force-connector-state.html
>>
>>    * igt@kms_frontbuffer_tracking@basic:
>>      - bat-pvc-2:          NOTRUN -> [SKIP][6] ([Intel XE#1024] / [Intel XE#783])
>>     [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11252/bat-pvc-2/igt@kms_frontbuffer_tracking@basic.html
>>
>>    * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
>>      - bat-pvc-2:          NOTRUN -> [SKIP][7] ([Intel XE#829]) +6 other tests skip
>>     [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11252/bat-pvc-2/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html
>>
>>    * igt@kms_prop_blob@basic:
>>      - bat-pvc-2:          NOTRUN -> [SKIP][8] ([Intel XE#780])
>>     [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11252/bat-pvc-2/igt@kms_prop_blob@basic.html
>>
>>    * igt@kms_psr@psr-cursor-plane-move:
>>      - bat-pvc-2:          NOTRUN -> [SKIP][9] ([Intel XE#1024]) +2 other tests skip
>>     [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11252/bat-pvc-2/igt@kms_psr@psr-cursor-plane-move.html
>>
>>    * igt@xe_evict@evict-beng-small-external:
>>      - bat-pvc-2:          NOTRUN -> [FAIL][10] ([Intel XE#1000]) +3 other tests fail
>>     [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11252/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html
>>
>>    * igt@xe_evict@evict-small-cm:
>>      - bat-pvc-2:          NOTRUN -> [DMESG-FAIL][11] ([Intel XE#482]) +3 other tests dmesg-fail
>>     [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11252/bat-pvc-2/igt@xe_evict@evict-small-cm.html
>>
>>    * igt@xe_gt_freq@freq_range_idle:
>>      - bat-pvc-2:          NOTRUN -> [SKIP][12] ([Intel XE#1021]) +1 other test skip
>>     [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11252/bat-pvc-2/igt@xe_gt_freq@freq_range_idle.html
>>
>>    * igt@xe_huc_copy@huc_copy:
>>      - bat-pvc-2:          NOTRUN -> [SKIP][13] ([Intel XE#255])
>>     [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11252/bat-pvc-2/igt@xe_huc_copy@huc_copy.html
>>
>>    * igt@xe_intel_bb@render:
>>      - bat-pvc-2:          NOTRUN -> [SKIP][14] ([Intel XE#532])
>>     [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11252/bat-pvc-2/igt@xe_intel_bb@render.html
>>
>>    * igt@xe_pat@pat-index-xe2:
>>      - bat-pvc-2:          NOTRUN -> [SKIP][15] ([Intel XE#977]) +1 other test skip
>>     [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11252/bat-pvc-2/igt@xe_pat@pat-index-xe2.html
>>
>>    * igt@xe_pat@pat-index-xehpc@render:
>>      - bat-pvc-2:          NOTRUN -> [SKIP][16] ([Intel XE#976])
>>     [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11252/bat-pvc-2/igt@xe_pat@pat-index-xehpc@render.html
>>
>>    * igt@xe_pat@pat-index-xelpg:
>>      - bat-pvc-2:          NOTRUN -> [SKIP][17] ([Intel XE#979])
>>     [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11252/bat-pvc-2/igt@xe_pat@pat-index-xelpg.html
>>
>>    * igt@xe_pm_residency@gt-c6-on-idle:
>>      - bat-pvc-2:          NOTRUN -> [SKIP][18] ([Intel XE#531])
>>     [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11252/bat-pvc-2/igt@xe_pm_residency@gt-c6-on-idle.html
>>
>>    
>>    [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
>>    [Intel XE#1021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1021
>>    [Intel XE#1024]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024
>>    [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
>>    [Intel XE#482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/482
>>    [Intel XE#531]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/531
>>    [Intel XE#532]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/532
>>    [Intel XE#540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/540
>>    [Intel XE#780]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/780
>>    [Intel XE#782]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/782
>>    [Intel XE#783]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/783
>>    [Intel XE#784]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/784
>>    [Intel XE#829]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/829
>>    [Intel XE#947]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/947
>>    [Intel XE#976]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/976
>>    [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
>>    [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
>>    [i915#6077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6077
>>
>>
>> Build changes
>> -------------
>>
>>    * IGT: IGT_7882 -> IGTPW_11252
>>    * Linux: xe-1444-950ce28fe0b31a24c5bddcc337aba9554a41cbb3 -> xe-1447-86b413568d7dbde6078f6c40341f5ae1ae63c552
>>
>>    IGTPW_11252: 11252
>>    IGT_7882: 257418cba11c724111fe0e983649763c407e5bc9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>>    xe-1444-950ce28fe0b31a24c5bddcc337aba9554a41cbb3: 950ce28fe0b31a24c5bddcc337aba9554a41cbb3
>>    xe-1447-86b413568d7dbde6078f6c40341f5ae1ae63c552: 86b413568d7dbde6078f6c40341f5ae1ae63c552
>>
>> == Logs ==
>>
>> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11252/index.html
