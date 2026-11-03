Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76677606A324
	for <igt-dev@archiver.kernel.org>; Tue,  3 Nov 2026 03:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DJoKXTRt
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 141EC10E165;
	Tue,  3 Nov 2026 03:01:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4BC010E165
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Nov 2026 03:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793674817; x=1825210817;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=44Z4s7AE3TQWXrcOlEoM61aNwbii8hNB/xRkXiaVcpU=;
 b=DJoKXTRtkxtshgtEQS5wbYkqMAbrExbcYVhiLzfnk9X0awXe6XC7kVjt
 RihMkFOQZRb34fH+nWfppjH48GlW5rj3Ww3vLF6tBzRvz0FycGVVtt7Ec
 3hKCFe7kQpO/SFmxoHQzLA/bvon76Ui2eRiiDnfUO0P6Fa5zJYZYiP6ky
 6ZG+wtCGElf7VqAE7IsIoCGg1Bc3pGHYSbSEw2YfsBKKWtAEgJICEJivB
 bDZw5bGBqxeJEp7i0ZlVA0l56ZgD7oo0nJ7gWqNuy81sZNoKhJuf4WpXU
 7mbfqKs2eMnp+gt1AVW3u9RQiQHW51HXnKfUZLALQShhXgMpDfEkCr83p A==;
X-CSE-ConnectionGUID: 4rgKhpTzSMKPw6dyRbfPdw==
X-CSE-MsgGUID: WdN98EQTTnOY8kcUqF515w==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2269167"
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="2269167"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 19:00:16 -0800
X-CSE-ConnectionGUID: s4wvuBmGTc2bGAt58HInCw==
X-CSE-MsgGUID: 8FZJgtpeR8S6cFzavDxErQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="6416154"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 19:00:13 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 19:00:13 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 2 Nov 2026 19:00:13 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.53) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 19:00:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wm8FzNwcJa9R766RPXMupR2FjCiKonFK4y6ol2l3/LAXcy6xjEaSHWeTbIyH2fggQmEAkjDi5sz16GcAqVSF8ZgwmcOSCHAUk4AF2sxI2SC4/WllKSJsgKAfnmLQnvo1KAKFgPi8e4xmlaYwJqJR/1gwayUjFzHP+xSxYRpE1rr3ElUkTJkoR5jeB6A8Kf5uEXCAp4Z/KpERKXN147gtYiWpqhb2A4GTRf3wYSr6HcT26yCaUhaXeO+iUkRgBAJ40bo9Io1uRK1U30hY2wldIcTefYg0uW/P0/Z4bU9ni+wRRaAJ6cz3lemuDSWcaaoh+tYLHMEZrLpvo7UovRUovQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9QrRIYye0A7407Z1SIOcRhXk4RnV0IUX9ZMOhNAHGtk=;
 b=ax/63WdW0/JTavhUsIEMdVlfpVjyIFSkYe+WzHVbS65bAjiD4QqkRsnupgK+xZrgnc2fvcO/WWGRfSAaNY50Tdb62wcmZJ2CI8a0mHJMnuEmbuXWBSh+UtWceLSdEi/CyfPkqjjvlDG5gIx4qrdzWjnbjbbNLacl74Ps87DtutQ8AtbbSCRKviaiyvWW+ZfhyoGdUYTIu6tOYkacHIoGs0G1vt4PYNSMey5Xt4lO7QKw4+JGqwWZ0Uky5HLdMXfZsXIP9scVkeHHohwBWltE3mB1DuczssfGrJTro0OCy1mJGyyQk/aQFEuJKrw5Zb30W2aDblTBTaDbBCC9mQueOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN0PR11MB5709.namprd11.prod.outlook.com (2603:10b6:408:148::6)
 by SA3PR11MB938431.namprd11.prod.outlook.com (2603:10b6:806:531::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 03:00:11 +0000
Received: from BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c]) by BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c%6]) with mapi id 15.21.0569.011; Tue, 3 Nov 2026
 03:00:11 +0000
Message-ID: <73d00f80-1915-4c1d-b6be-96a65394d2b4@intel.com>
Date: Tue, 3 Nov 2026 08:30:03 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/intel/xe_madvise: bound VRAM overpressure by
 available RAM
To: <nishit.sharma@intel.com>, <igt-dev@lists.freedesktop.org>,
 <varun.gupta@intel.com>
References: <20261028053205.1526497-1-nishit.sharma@intel.com>
Content-Language: en-US
From: "Yadav, Arvind" <arvind.yadav@intel.com>
In-Reply-To: <20261028053205.1526497-1-nishit.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0052.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d3::13) To BN0PR11MB5709.namprd11.prod.outlook.com
 (2603:10b6:408:148::6)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR11MB5709:EE_|SA3PR11MB938431:EE_
X-MS-Office365-Filtering-Correlation-Id: b7472690-7205-4342-4040-08df395692fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|10067099003|6133799003|22082099003|261102123227099003|18002099003|56012099006|11063799006|261021121427099003|261022075727099003|261026140227099003|261009223027099003|261026121527099003|261022105027099003|261021123027099003|261028144727099003;
X-Microsoft-Antispam-Message-Info: pUMZz7tWMSMLwoPYzxnAI8KtOQzS+qB613z6lF5nlGSayLj81nB6O7UqLAYJlWO50hhcRegysE6BpR2M/4bpKv441jGXn0KFZpAwypybF1SikkI2bZTY5RYPS5q3Vx/S7aiw052Isr6tgtumroPkm28OSVK/Rn/S1+BeLCu6iAULU4jC+geG4xKAWhPOpPuhkI5sKiUv8ElaGLenW+yd6w7gi9IVq7/ALMf74t8IaFgp1VcKf1Yspw5jGftM+0lgvum5217l3PlWgzkKxMtGkiDxjanjdOySP6TPDE31nQVy7j7m1H9PJCBOreHgNXJJRMmsGXlwQwFTEalVhhtwvFZQLoYkN8nwnjbmT+vs1uMpdkM9kR5NDYVMNb9JuHgacUWAB+vQznFfFxIZNyn00Timst0ugAYyhy0B6r+SJrWxzBy6NfatfQYPhWaeBkcbPB453HyIEE7YTy/yc6HaKe4sBENR80sjIYqGAsYNtbbCSCYylGvl3RmXx3tYFOx9uFLz6gPxnJ8wtOSqOQ0l/tEVNYJE5XJcFrNbQnkgGO5FYdSSrao+N3bpdYiTuQ/kaUZchh0YnmCjB6AGJqTHPIOMecOeM/x65yHfCZoiWkTiQrkIj5Ovqy0xzuDx0rdpiFEwk2PJ1tcQ0uVFfwwtuJ5PUe1XVtJg0c1mf0xGNwM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5709.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(10067099003)(6133799003)(22082099003)(261102123227099003)(18002099003)(56012099006)(11063799006)(261021121427099003)(261022075727099003)(261026140227099003)(261009223027099003)(261026121527099003)(261022105027099003)(261021123027099003)(261028144727099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bEE3RFF3dFVlS05tbmVXem5xWGF2NC8veURPNjUxcGJYbWxQRTFFYXVUK2Zr?=
 =?utf-8?B?Sk5lVGlWdDhHckJveDdSVnVpQUpBSnlkZmdLZ1lNcVduZlprRU5yL2N2OGl5?=
 =?utf-8?B?SjA5UGpQNG9ZNkNKMVpwYWFwRlJUTks4eTBuK0FlYUc1Kzl3OUQ5RzRZcEJy?=
 =?utf-8?B?K3RKOTR0ZEpWVVA5bGRoWkNOZDU5ZFNka3h2M0xzTUdzK0hqeW1VazBwZDFo?=
 =?utf-8?B?N213VWJvaW9FSHVTby9CdGZOS2E0dWc2bnMvWDVWcGFvWXFyM0xpbjZ6MElK?=
 =?utf-8?B?UEdpYmtmNGcyUnZxS1k2ZFBtcmV5ZWo0ak9QUXVPU21yM2xmU3lKYWIwQXRV?=
 =?utf-8?B?RHAvc3B4TVlReVhPdEZuaTlsUlJ5cE1GcEFWSmt2ZytQRXRpK0t3YUNWTUVh?=
 =?utf-8?B?ZnRqQjV3WjA2RjV0cm9oUXl6OWtLQmRFZ3lUaEZLU3VPZStqbEhIa3RycXVV?=
 =?utf-8?B?UlhLVnIzdlNqemNKVkpFRTZ4dG4wSEdna0dNdVQ1aXZzNktVdHhHSW80ejNO?=
 =?utf-8?B?MFhUVURPZnAzLzdhdTNSSXNkbmhqOHEzTjhKY3dpNkY4Sm9qTytYSWtXVEFD?=
 =?utf-8?B?ellRWGlLZmIwUnFIM0RCbjAyZjBkS2d4amUrbjhJMHRFMW1aTGQ2Y09ZeUY4?=
 =?utf-8?B?blVCeitvTWxNQ3NBV1BtVktaeWgwWnNaamhST20yVHkvMU9WV0hsc2hJNjdR?=
 =?utf-8?B?RHgyUGRZR0VMLzNQVTVpK0RoK0prT0ZYQllybUd3dFZPOTVEbDRyeCtDS0Zj?=
 =?utf-8?B?MkE5TkV1NzZtekRLUXFla2ZKZVBMUE1Lc1hDWnpHczlrWm9PczJJUGI0TmZS?=
 =?utf-8?B?YUk2WGt2NUdOM2ZRbVpsVXlhcERSTDIxMVExNzZQMjlqQjN0djJLQlhzSWZz?=
 =?utf-8?B?VEF5NFZzemhLS0RtTy9yV2xEd2lWQVJVbU4vb0dGbkk1Q0pWVHBDNGc0ZHJG?=
 =?utf-8?B?UW41ekJIbXo3ZXVnTzFIZ2xJRFR0RlF0UUdlS0Z5MDZCZFdRWHVOTzM1alNj?=
 =?utf-8?B?Mkd4MW5LQjNjZDNMRkFmeElUa20xVFJvejZScjVpQjk0c0ZVQzZkL2cvSklv?=
 =?utf-8?B?ZGdYWmE4cUozaTZJRFA4dUJ4aWF2bTByZTd0SWNES2dzRXFCRHJRK0FxZCt0?=
 =?utf-8?B?Y3hKQUY4ci9oWi8rYUdPdVhLc0M3QXR6ZWhWaTQvMFpqUXVKMnltT0Y5Y3BI?=
 =?utf-8?B?YVE0MnE1MHpuaFQwMTZwTlE0ZVVuS3hBbXpnbEZEUXdaSC9oSy9XYlRWeWtv?=
 =?utf-8?B?dklLYjAxQU5odTlFNkZUb0pLNDF2TlcxWTFHVnhpc3BZNmw1RW41Q29CaXQv?=
 =?utf-8?B?dUdCZkFodlo5ZEQ3dTZwOUNKVlNRSnEweU5yVlRCYU9lMmx0dmtNai95ZGVP?=
 =?utf-8?B?R1V0VkVkVzROdzdOeXd6Si9nUnR5TDdJcFIxMWFWYUg1TW5ZT21HSFRKbEdC?=
 =?utf-8?B?KzRQNTBOSWRkVWdjTUVxb2I1VFZRYStkdlBCRWVLMXFud0ZLTGQyanpxclVQ?=
 =?utf-8?B?a0o0blNFSGkxZTdUNHlScCtHOG9GV2h0ZVkzQS9qMkNLVGlqMjNRTUE2dGZO?=
 =?utf-8?B?NTZ0OUVyTmdNaXRaWXF5amFza2FtdGlUd2lBU0NQUmNEWWREazl1V2RPYTdo?=
 =?utf-8?B?ZzF2NStRT1JsNVQzaVVlUFF1aUppeHo3L1BBOWI0Q1dtUHZyeTEzRGsvVU8v?=
 =?utf-8?B?dGE1OUFZenZ4anl4bmY5dVZvaC91NENNb3JWY3RqUzl4STUxN0d1OUxsNHpj?=
 =?utf-8?B?QmRmYk1OYldxQ0VsZHJ2Nm5YN3h0cmpxb1ZHSkFDMURKeWVjdUE4Mk5sMm1D?=
 =?utf-8?B?RjYvdEtxcWJGSW1HbnZHeGFNSkdkdnB2ZnJ5bzdDSGxwUVNJWUFpa2JNYmlO?=
 =?utf-8?B?TnZXVkhsWUZVdmNSZzhQdktZRk1CR2Nzci93SFkza0ZCSnBHRGFtNVJ6bWpv?=
 =?utf-8?B?L01UUVpmTUZYRXA0V1FPeWtNaVBnb2hIQlk3d0lveVRiZVZ2K2dQZkM0bE1I?=
 =?utf-8?B?bjlNY0thTXJnRTNMU2RLSmJOcThrZGY4V0ZiOTZOWHNQQUV6RzVzWjk4UXE4?=
 =?utf-8?B?VWFoZTF2azBzeU9kZVdmYWZ4VkxrQjBkZEgrQlQ2MjZEZlFvWGw0anErS1g5?=
 =?utf-8?B?eUVsNnFNTGZGallySGZvRlk0cFNDZFZLQ2xxV0p0Z3I3YUhFRlgzeFJML04v?=
 =?utf-8?B?MDJtSHZHdEFLS0pibUlUakxMT25aMVl1ZWUvQXp0UXJCQ3k3VVVzUmtja29z?=
 =?utf-8?B?SVNySUVjamhpVTlETGFMTk9LR2VrdmhiSkR6V2JCQnhqekllSEsxNjBYOS9T?=
 =?utf-8?B?ckJyTTU1QW0zOTJSMEptNHpEd3IvN21QM245SDBGOUhTWnBHbWFTUT09?=
X-Exchange-RoutingPolicyChecked: LToSOM9LhjPBRtgV59QprNhLnRG/PKQtACLin971P/bIG1Sbf5iy2GuY/beY5SymJk17c76gH2SerXZVVEsOSs95+67mIU15kIHsbofVrIuBRyT7WmwyFuIi0sNaZ3+uhX6ZDfXdooOaMYrqECoI1BbYC3usj5twFyeI/F1GZYUnRDejvhcqGbtetyE+gSHP4+0XMyvjrA89nQHVj7EjOnF4hzOCwMXjF4E2Z/fR5T9wOBHqY0BocAobT0oxEIX0B6zLZs+tVsNnQS15XGCOM9lS4ADEiLaN7OOM/XjoMCNVbCKNVGmNDMktH3umYvgNvDB0jH+rdDNoB4FheUwWwQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: b7472690-7205-4342-4040-08df395692fd
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5709.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 03:00:11.0292 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wMHVC1h3O9iacSZlHWlALQHGDGO7+QvvKcFsbEN8TV3XXM8WJ757GNQBh7jukC3uCAz7Liy2ThFTcUj4vO6ZpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB938431
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 28-10-2026 11:02, nishit.sharma@intel.com wrote:
> From: Nishit Sharma <nishit.sharma@intel.com>
>
> The dGPU memory-pressure helper allocates visible VRAM plus 50% and
> requires enough system RAM for the entire allocation. This skips
> purge-related tests on systems with substantially more VRAM than RAM,
> such as configurations with 256 GiB VRAM and 32 GiB RAM.
>
> Limit the overpressure to the smaller of half the visible VRAM and
> a quarter of available RAM, retaining the existing 64 MiB minimum.
> Apply the RAM requirement only to this overpressure rather than the
> entire VRAM allocation.
>
> This retains pressure beyond visible VRAM while bounding the expected
> system-memory backing needed for eviction. Leave the iGPU shrinker
> path unchanged and log the selected VRAM and overpressure sizes.
>
> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>


LGTM,
Reviewed-by: Arvind Yadav <arvind.yadav@intel.com>

> ---
>   tests/intel/xe_madvise.c | 22 ++++++++++++++--------
>   1 file changed, 14 insertions(+), 8 deletions(-)
>
> diff --git a/tests/intel/xe_madvise.c b/tests/intel/xe_madvise.c
> index a33a08630..383115a74 100644
> --- a/tests/intel/xe_madvise.c
> +++ b/tests/intel/xe_madvise.c
> @@ -78,12 +78,17 @@ static void purgeable_setup_simple_bo(int fd, uint32_t *vm, uint32_t *bo,
>    * trigger_memory_pressure - Force kernel to reclaim DONTNEED BOs
>    * @fd: DRM file descriptor
>    *
> - * dGPU: over-fill VRAM by ~50 % so TTM evicts purgeable BOs.
> + * dGPU: fill VRAM and then over-fill it so TTM has to evict. The DONTNEED
> + * BOs under test were created before the pressure BOs, so they are the
> + * oldest on the LRU and get evicted (purged) first. Only the over-fill part
> + * ends up in system RAM (VRAM-resident pressure BOs do not consume RAM), so
> + * the over-fill is capped by available RAM, which lets the test run on
> + * systems where RAM is much smaller than VRAM.
>    * iGPU: poke the shrinker via igt_purge_vm_caches() (avoids OOM).
>    */
>   static void trigger_memory_pressure(int fd)
>   {
> -	uint64_t mem_size, overpressure;
> +	uint64_t mem_size, overpressure, ram_limit;
>   	const uint64_t chunk = 8ull << 20; /* 8 MiB */
>   	int max_objs, n = 0;
>   	uint32_t *handles;
> @@ -99,16 +104,17 @@ static void trigger_memory_pressure(int fd)
>   
>   	/* dGPU: fill VRAM + 50 % to force TTM eviction */
>   	mem_size = xe_visible_vram_size(fd, 0);
> -	overpressure = mem_size / 2;
> +	ram_limit = (igt_get_avail_ram_mb() << 20) / 4;
> +	overpressure = min_t(uint64_t, mem_size / 2, ram_limit);
>   	if (overpressure < (64 << 20))
>   		overpressure = 64 << 20;
>   	max_objs = DIV_ROUND_UP(mem_size + overpressure, chunk);
>   
> -	/*
> -	 * Pressure BOs are faulted in and kept alive until cleanup. If the
> -	 * system is already low on RAM, this can cause OOM.
> -	 */
> -	igt_require_memory(max_objs, chunk, CHECK_RAM);
> +	igt_debug("memory pressure: vram %" PRIu64 " MiB, over-fill %" PRIu64 " MiB\n",
> +		  mem_size >> 20, overpressure >> 20);
> +
> +	/* Only the over-fill is evicted to system RAM, the rest stays in VRAM */
> +	igt_require_memory(DIV_ROUND_UP(overpressure, chunk), chunk, CHECK_RAM);
>   
>   	/* Separate VM so pressure BOs don't interfere with the test */
>   	vm = xe_vm_create(fd, 0, 0);
