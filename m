Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95E9BC77B7F
	for <igt-dev@archiver.kernel.org>; Tue, 24 Jun 2025 09:21:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 467BA10E55B;
	Tue, 24 Jun 2025 09:21:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nxlW+Ry5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0807610E55B
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Jun 2025 09:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750756906; x=1782292906;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=OiIXS4RM0a9MtvKVCVNJTX2GFviddreHIwlLbgPe/e4=;
 b=nxlW+Ry5/vf69RZ4rglg0Ps4rV34f87CRmHv907C4bqs0iPgT0L9joRI
 9TMSn5sGDYspEv3bnb/W33IMhvnd7U5TDq23aJYdtITJteBsUoU1ABgIC
 dsxe1ZOCm/D8LdYmG0o6i+85r0hXuI7geR3/ZDL75YNKnueNQy6al0uv6
 0GUEDFknbzwYwqAmlF+E84IfcjfpFGz6UnW7adSBIyN+LzQbIFb0Ji09B
 fdltg+lqLTNyUWjmS3/aVQnzxysNs6FQJyz3eFgHZsviq3IrcuUSGrsXm
 21UukXCjseL5CuBiEAyjHx8BjN8j1c5wUwn6ybg/nRHNtn0ZcbggNiVco w==;
X-CSE-ConnectionGUID: +cgNaW8hTF+dtFGabaxnFw==
X-CSE-MsgGUID: jr5pTEJPS2aN0M0SGIIJ8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="52859946"
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; d="scan'208";a="52859946"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 02:21:46 -0700
X-CSE-ConnectionGUID: KDlO8OKdS+2H8kp88fJ0jQ==
X-CSE-MsgGUID: SehzGd1GRXiJ/Pw+UD8wHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; d="scan'208";a="155890356"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 02:21:45 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 02:21:45 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 24 Jun 2025 02:21:45 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.63)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 02:21:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JRmdRRx5c3HvgzgADEJgachjJSRyLdI+Pn3WMhcpDhFb6qzuMNVzkeIOoagnRNNXbLKA2OOOXQTeQp2Vy/1QJU0zUal22QTAvfzaxU+lC9i8p24Ez04U1a2kEaV+O8xV/7ztTp5hTMKMicsPNSR+2pnbRAPchNUpOjhAGTx/VD5wH6OIpy0fY77IRCj+8RSj16i0B5bw8e/vF8yLFYSnEuazz+Y3YyCxuqedb6atU4h+0ErpJI5Du7xkF+q1AsZdrvKdxbDgOomVhNw1fpTREh3aM2QkpBHOGoU3F6Jvp6kUGTziBBph3NITrDyjjfSxapr/CeGrN+ixNNtnFklKQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jeorQUETzT8k8JIVKwbWRvU4QFpefn2Kyou7qABTKtE=;
 b=h25+e14CbQa2EpD4chH04tAZiN3EcJ1zH5Sh9zAdzaiOPNLtfd+SAf4M/QwVienI+4qo9XdtSQ1jsTwwWfpNVUhoPCKKpp1o9wSGKNT+v1RrRQkq91lqgZWs/Qn6U9BrTtO6KkjjPQGQoAUG296TnxoSfgg9mMBBY+a73wuU8OhFF9xSpSyW/nhThmlMxFaKYJF+rJqbz11OJ+Wac154DsLKDuWAubzTsMEUDYLrV8rijo5bfLhV09XF8A8YEh+R3N8hFOr1t9wFyPgV3PsiCOV47bpm6xilAQ13m0P65firR9YaQ78w97RLHaZjqOQVLDdAg7yRGjb1JUEnYCMZFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by MW4PR11MB6570.namprd11.prod.outlook.com (2603:10b6:303:1e3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Tue, 24 Jun
 2025 09:21:15 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%6]) with mapi id 15.20.8880.015; Tue, 24 Jun 2025
 09:21:15 +0000
Message-ID: <3119c0a6-dcae-4870-a66d-ab12a739d881@intel.com>
Date: Tue, 24 Jun 2025 14:51:08 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/3] tests/kms_async_flips: Add hang subtest
To: "B, Jeevan" <jeevan.b@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>, "Murthy,
 Arun R" <arun.r.murthy@intel.com>
References: <20250619112334.744213-1-karthik.b.s@intel.com>
 <20250619112334.744213-2-karthik.b.s@intel.com>
 <DM4PR11MB63127DB8D6E6F7D988DF7B4B9078A@DM4PR11MB6312.namprd11.prod.outlook.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <DM4PR11MB63127DB8D6E6F7D988DF7B4B9078A@DM4PR11MB6312.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0009.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::20) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|MW4PR11MB6570:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f61ffcb-fe64-4302-24f6-08ddb30077b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RXgxdnZRYmJHeTc4WkhobnZPNTBhSUtjYUFQMlZBajhjdFJxMkgyWVRiWDdZ?=
 =?utf-8?B?S3VqVCtZaGtacXFvV1B5dktOaGFsVzJFZXh0TjZQa2oxaTErMXN2SEZ6L2Yy?=
 =?utf-8?B?K3EyR3BCcVorQlVuYlJ3aXp1UlpvMHkrb1hFUUJ1ZXlWbWl2M1M4WTNSdWgx?=
 =?utf-8?B?OXlCc3hxTmc0SlE5dytMbkVnVFdXR2xDRmVRdDlPelMwU0hWNzU0dHQ2QmdO?=
 =?utf-8?B?bytkM3lBN09FYysrZXYzY2xiMkRHM3VkSFkyWW4rME9DT2k3TFk3cXJDMEFV?=
 =?utf-8?B?b2tnK1FaL2J1RUM0bjcwMXJaUWY4Ry9SN29RMndPVGg5OTVETTdjUzh3YitI?=
 =?utf-8?B?aEpCNkFINmZ2K3BPU0pQZTVYWDJuMkxwQUVnWUF4M3RWVlVYQ0UzRWVHS0Qr?=
 =?utf-8?B?bm01YXViRWlzWkZxMkxRT1huSnc4U2lUakMwRnczZWVWNC9wck85TjJvekIy?=
 =?utf-8?B?VzV2UW9LcXVUd2NVc29YWkNlRDlGeFJBSk56bzNvT0NlZVRXTkdhTy83MTVQ?=
 =?utf-8?B?OStXVm8vakFLM3VsQkEyeDJTM245LzVXQWdjbmM2K0VONklyZ2JkVEN5UVJF?=
 =?utf-8?B?S3MwbFB3a1M1TlU0aUNSQStrci8vTFlVM1R0Y3hVTjhFdnhTaXdHNmM5emtQ?=
 =?utf-8?B?R2FSazFtSlk3bHI2K2RmR1hZYUNHeFR1TTdPWmtBaHlERTNBZW1Ea2swMUtu?=
 =?utf-8?B?bUlBWnNHVkVMaWl2TFdLTXNJMkZ4OGNRUWE3NjRGU0FMRUpZNVpFSTZQOU5l?=
 =?utf-8?B?Y3AzYWdTRGF6MHpTNTZrRGRzVnk4SGR0K1BCK3VYbFluZ0RFSytKbG0wL2tQ?=
 =?utf-8?B?T0twQzhSY0hVM3JWZGFzUW9EUm5mNWRKYnJNY1NPUWVqQXh1YUsyRXdlSHVu?=
 =?utf-8?B?MUZlbldCMXVZUzF5dStCcFFETzRQdC9Mb3RmZmx0a1JveE5rUUJHcEJFK0Qr?=
 =?utf-8?B?VVJ4NUVjS3ZSeVZTVjR2c085RC9UeUFxUFlLTGt1bGlnYnhHME5KZUhwdkFT?=
 =?utf-8?B?VDdLMktyeU9kS2Vkb2xrcmFtZWlxTmlCWWwzZDc5blJFK0ZyS1U1MVowOXNk?=
 =?utf-8?B?WkZSM0FuOVpVbE1USXFObUJEZ2NpeEI3TS83YzNYU2dKbnoxc1NabEJhYlVY?=
 =?utf-8?B?VS9hYjZEMDJiTkc2K0ducWVjZWxoZVhLMTVLUjdSMUx5WHI1UEV2K0NsbW50?=
 =?utf-8?B?V1ZCdGxGYTEvZWYvRXpJMktPaXRaUktKR0h4NG84SWxHWXIxVDNpZXR3M0Ev?=
 =?utf-8?B?dkdXYmNVNDVCZExhSFdnUnZRdFhmOVpRcVB0Q2JYay9vUDZ0a0ZodXY2K09O?=
 =?utf-8?B?aS96cnc4YllQeVRLbXZxMHBXeFljbVI4SmNmM3NnR0hHd0t4ektOcmlvbWtG?=
 =?utf-8?B?NHI3aVZWZEx2Ty9FWUIrSWRSUGcyQmRLd2pXbXVzRjM2WXpaWjlGdDA4Qjcw?=
 =?utf-8?B?OGRiT1pyTmM1eE8zeHUwQytmZ2FONVdWcW9SUlI1aWJSZnBzTUd3MG9wT2RR?=
 =?utf-8?B?cURlOWN3cWZnNVdnRm05akFTa1E0M0xSMXU3d2JhTFY3VXBuVzBVeHBvcVJn?=
 =?utf-8?B?Vkk2dUxNQnVKMUJ6YW4rQzJsSmg4RW5JQWNXR3pva2kxM2dwcFNMRWQwWEpn?=
 =?utf-8?B?QTkwVVRpZjJBUGJ5ZXp4ajQ3MjRTT3hPTk5lc281VXFMVVpSR21zZC96OHFC?=
 =?utf-8?B?ZnA5OFhUQ3ZRSHhGS2ZCM2RuV0pHeERDK2p2UU56L2UyQkFMOE9ZWU9yM2NO?=
 =?utf-8?B?ekJhcGYrcHhnZGszSFBVeTNkWTFlZkdrNmxGb0hyT1VMZU5VQ2xuUlc4NHJt?=
 =?utf-8?B?aU1jVVc2WHpRZU5GSTByN04rVlBjclQzQS83RGF5RFpFSnNXTFlWSC96OEZC?=
 =?utf-8?B?TTJMY3BWTkxSYlJ6TEYzSUhNSFZ2L1J6SUFVVVpFemRjY3psZUhnYm1LRlZH?=
 =?utf-8?Q?hwR7/0OeqEg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bkt3ZklhVUs2T25MekF0OXFWbkdJRmt4aUlMSjhUek14dytqYVB5TytSZVEy?=
 =?utf-8?B?Sk03TnMzMjJuL20yNEdPYWplZ2I2Q0pia2QyR0twbGh6alc3eElkVFJQdDl4?=
 =?utf-8?B?WURDYnlINWlxYklNVFNiVHEycFhIb3dBcXl3d0U4Y0RTa04yTFVuZVpLZDFa?=
 =?utf-8?B?RklTUWNoektUMkd3ZENQNnJaaHlsbml5dnRFdDA1TFVsLzZrZnpCdkZGeG5s?=
 =?utf-8?B?bjhlSlV1QktRRnByUWpEaDI3K2wwWDltd0QxaG8xS1lSc21BbzBheWNYNmlr?=
 =?utf-8?B?NFUwY2dHMmFmVVRmYUYzZFcrUFFoRHViVHJuYnIzdDZDVVRsNDVkcjZBZ3Bz?=
 =?utf-8?B?YWo3S09QbGlndTRYWGdPUXRaV1lLa0krdndMWjRLTXJUQzJmbm9XSDFKSmU1?=
 =?utf-8?B?SmVEcjdaTFQ3T0pyYTJWb2FEbDRGeEFFcEp0a2FWaExHWkltM2RYNCtjRmJu?=
 =?utf-8?B?QmxIZ1Nmd1lKa29PUWJTM09LMzhpeWQwbWpQbno2STFRa0N4d3FxcTRTdlcw?=
 =?utf-8?B?azRlQlRHc2hGSmFMbVh6REJiM1BEcHF5eWY5NUt4V1BiNjBqY01OSWdtTTdj?=
 =?utf-8?B?U2ZJc1FNS2xIeWlwZi90ZWhHRUNKdk1wRTRBSmttOG1SS25IL3JXb0FtTnNI?=
 =?utf-8?B?SjVBZWJOY0xnMjdtM09qZXdTOVNncUcyQTRMYjd1emRRR0VyYkZ5UXRKVXdq?=
 =?utf-8?B?YVFBNzVxOTZzcVNkSnF2NWRsekJxU3FYYkdkWGxEL0x3NitSWWROU2ZUd04w?=
 =?utf-8?B?SEdPUVdDaStFSXVsVVVQV21wS2NYbmhkeDNGY2dYbmFmUW9MVUJmQlVsNk5B?=
 =?utf-8?B?ak5BWktwM2llOXVONytiZXo1WWl5cHE5TXh6SHRpM1A3bjN1Ym5YTTFqRWd3?=
 =?utf-8?B?TXN3ektrbzk2aG1icFFkeFMxVG5Fa0VSWjVhbEozWC9vWGx4V3ZTZjFGT0FM?=
 =?utf-8?B?V0dwVWFoZlhLQnNiRC9xeWREa3dhak1oK0JkaHlQc0VyN2ViL2ZnL0ZUelFh?=
 =?utf-8?B?MEwxRWt1Y3BaVzZ2OGhoaTdUbkg1ZEo5dkxEZi9IMWVPbkM5ZnFhWU9qN1JW?=
 =?utf-8?B?Tm5yRzhqRzNCTmYrQThoc3Y4MDc5azZ5OUlDeUttZzNyUUJ5TkJTT2FkNDNz?=
 =?utf-8?B?T3JHL3RaZnMwdEtvdFcrK2l3RFRKZ0hFTXhWZmorRXp5bk9jeXc3L0NQRUpN?=
 =?utf-8?B?eGF6UVVhZEREU2pzWGlncURXYkNMYzFmQkRRb0N3b1dHTmdjN2JhQkdwZnN1?=
 =?utf-8?B?TjlKa24xNlV3MHlJaWxHKzZSTXdkUU85ckRvYlZSamFibFpkL3ZtUTBIZDA1?=
 =?utf-8?B?U056VEdyQXJTUGxCdk9aMW1hb1hGNGpSeHVOaEFWV2VsSklkbllXSkUvcmxm?=
 =?utf-8?B?U1NuV0g4R0RpVWdDbXg3cGtQTkVWWW01d2hMT2xjRmNiUWpxU3U0cCtuK2NV?=
 =?utf-8?B?SlliZ2QzMnkxc1lDd1pkN29qWFg4bWpSQklHbTJxa1ltZTF6TktLMzBuTjQw?=
 =?utf-8?B?SXE5VzZmNE16Z2NYZWh0YkQxTE1rTndqMi9lQUxDbVNBMlRNWlNWVEcrcjJB?=
 =?utf-8?B?bVVybzByUndXbm9SVGlPUHhqZmdaTnlOYklBblAydzJnS2pQUjByZlVaVlN5?=
 =?utf-8?B?MnI0bS9mT1BMTEpDSXEzcWJ6eWpkTGVLc29kN0prWVdNc1ZqenBGNENUbm9z?=
 =?utf-8?B?R1U1QnNOT3ROOERsQkhZajZNQi81SWFlUitFR2tCS0lSbzIxdm1ua0d1Y21B?=
 =?utf-8?B?UUJ1ZEsraU9WU3BtOXQySW41eDl4VkloZTlLY3lrWjRqVGFEZXlwazB6bmNU?=
 =?utf-8?B?QTc5alUya3pJVHZJaFZYR1d5TmFoM3IwbEt5dDNtalFhdktZWmc0OU9ZTnZL?=
 =?utf-8?B?NytsQkZtanZzSDBmV2sxYWU4WGlLRWc0NjY2WmpFSEQ3Y20vWmNCVmljMi8y?=
 =?utf-8?B?b3BFcytJN1pGYmw0c1pZS09IcHo2MzY2MDNtVURhZkd4ZDJwc2JDU0xEQ09S?=
 =?utf-8?B?eGh5V3d1WWlKQ3pIVDJDMzNkbElVS0k0NDlySkFWZXVlWEFlRHk1UXFzWERs?=
 =?utf-8?B?cVBvOG1pU3JKZklmL2h6aStHaUlDenpoSWQ0ckxXK2tOL09RZkdHRGNWbWI1?=
 =?utf-8?B?SXU1VHJHUW1ka2RJVGlxYzdvL2tLUk1oZGw0L3RXR0YvSFJubWZmSHBWY0Fh?=
 =?utf-8?B?dEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f61ffcb-fe64-4302-24f6-08ddb30077b0
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 09:21:14.9057 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YuYI0jCRrkNWJgLQh59iz3IDmCi5nKPgmYGjnwG9RUvufsQHGW/kH61EgVPY6O1r9glm0UQMgO774zvGt1sDkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6570
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


On 6/24/2025 11:16 AM, B, Jeevan wrote:
>> -----Original Message-----
>> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Karthik B
>> S
>> Sent: Thursday, June 19, 2025 4:54 PM
>> To: igt-dev@lists.freedesktop.org
>> Cc: Reddy Guddati, Santhosh <santhosh.reddy.guddati@intel.com>; Murthy,
>> Arun R <arun.r.murthy@intel.com>; B S, Karthik <karthik.b.s@intel.com>
>> Subject: [PATCH i-g-t 2/3] tests/kms_async_flips: Add hang subtest
>>
>> Test functionality of async flips with hang.
>>
>> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
>> ---
>>   tests/kms_async_flips.c | 37 ++++++++++++++++++++++++++++++++++---
>>   1 file changed, 34 insertions(+), 3 deletions(-)
>>
>> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c index
>> 0f2d932e4..8587e4675 100644
>> --- a/tests/kms_async_flips.c
>> +++ b/tests/kms_async_flips.c
>> @@ -86,6 +86,9 @@
>>    * SUBTEST: async-flip-suspend-resume
>>    * Description: Verify the async flip functionality with suspend and resume
>> cycle
>>    *
>> + * SUBTEST: async-flip-hang
>> + * Description: Verify the async flip functionality with hang cycle
>> + *
>>    * SUBTEST: overlay-atomic
>>    * Description: Verify overlay planes with async flips in atomic API
>>    *
>> @@ -132,6 +135,7 @@ typedef struct {
>>   	enum pipe pipe;
>>   	bool alternate_sync_async;
>>   	bool suspend_resume;
>> +	bool hang;
>>   	bool allow_fail;
>>   	struct buf_ops *bops;
>>   	bool atomic_path;
>> @@ -376,8 +380,10 @@ static void test_async_flip(data_t *data)
>>   	int ret, frame;
>>   	long long int fps;
>>   	struct timeval start, end, diff;
>> -	int suspend_time = RUN_TIME / 2;
>> -	bool temp = data->suspend_resume;
>> +	igt_hang_t hang;
>> +	uint64_t ahnd = 0;
>> +	int mid_time = RUN_TIME / 2;
>> +	bool temp = data->suspend_resume || data->hang;
>>
>>   	igt_display_commit2(&data->display, data->display.is_atomic ?
>> COMMIT_ATOMIC : COMMIT_LEGACY);
>>
>> @@ -433,13 +439,29 @@ static void test_async_flip(data_t *data)
>>   				     data->flip_interval, data->refresh_rate,
>> MIN_FLIPS_PER_FRAME);
>>   		}
>>
>> -		if (data->suspend_resume && diff.tv_sec == suspend_time &&
>> temp) {
>> +		if (data->suspend_resume && diff.tv_sec == mid_time &&
>> temp) {
>>   			temp = false;
>>
>> 	igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
>> SUSPEND_TEST_NONE);
>>   
> Can we add a comment line describing what we are doing here.
> /* Trigger a GPU hang at mid-point to test async flip recovery */

Thank you for the review.

Since the test description is already mentioning this, I feel this would 
be a slight overkill to add this and so could be avoided. Please let me 
know if you see this otherwise.

> With this minor suggestion patch LGTM.
>
> Reviewed-by: Jeevan B <jeevan.b@intel.com>

Thank you for the rb.

Thanks,
Karthik.B.S

>> +
>> +		if (data->hang && diff.tv_sec == mid_time && temp) {
>> +			temp = false;
>> +			memset(&hang, 0, sizeof(hang));
>> +
>> +			ahnd = is_i915_device(data->drm_fd) ?
>> +			       get_reloc_ahnd(data->drm_fd, 0) :
>> +			       intel_allocator_open(data->drm_fd, 0,
>> INTEL_ALLOCATOR_RELOC);
>> +			hang = igt_hang_ring_with_ahnd(data->drm_fd,
>> I915_EXEC_DEFAULT, ahnd);
>> +		}
>> +
>>   		frame++;
>>   	} while (diff.tv_sec < RUN_TIME);
>>
>> +	if (data->hang) {
>> +		igt_post_hang_ring(data->drm_fd, hang);
>> +		put_ahnd(ahnd);
>> +	}
>> +
>>   	if (!data->alternate_sync_async) {
>>   		fps = frame * 1000 / RUN_TIME;
>>   		igt_assert_f((fps / 1000) > (data->refresh_rate *
>> MIN_FLIPS_PER_FRAME), @@ -1032,6 +1054,15 @@ igt_main
>>   		data.suspend_resume = false;
>>   	}
>>
>> +	igt_describe("Verify the async flip functionality after hang cycle");
>> +	igt_subtest_with_dynamic("async-flip-hang") {
>> +		igt_require(is_intel_device(data.drm_fd));
>> +		test_init_ops(&data);
>> +		data.hang = true;
>> +		run_test(&data, test_async_flip);
>> +		data.hang = false;
>> +	}
>> +
>>   	igt_fixture {
>>   		for (i = 0; i < NUM_FBS; i++) {
>>   			igt_remove_fb(data.drm_fd, &data.bufs[i]);
>> --
>> 2.43.0
