Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47AA0ECE579
	for <igt-dev@archiver.kernel.org>; Mon,  9 Sep 2024 15:40:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B154C10E5B9;
	Mon,  9 Sep 2024 15:40:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i3hfhqzB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AF1810E5B9
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Sep 2024 15:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725896412; x=1757432412;
 h=date:from:to:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=mbsp0o6iVSF22VacEngD7duMjB5un+hwbzeyf/4nXaI=;
 b=i3hfhqzB09QuidcT3CKgWA+rOGAgxj97ptUQ70Z4cqm7tqXZc9WVFm1q
 0FLZhPQ6zFLiYrq7+A3YfEwdxvXIatqzHdHWKuxwip6HNZqXm7hn7b4vT
 iDSiRnwsVpFU9aOqv+6uDnzANXRVsZp0J1bU2n4Cf4+qT0DDaJ2niekgV
 mRhVZWwN/hRtvzQdu3zvkQ2Ks1dA605kxBIEnXfZBzi47K1fj/tLAEYMY
 XIjykfzsu9uimBWuyVA+2LIkFg55nfNs/D+uKYrvW4nbcn4Jir9rjg/qe
 Rofso63l2k1ssn/SgmWZWKkTgQwgWspyJjIaCSNTRIPQH98/vkbngzOes A==;
X-CSE-ConnectionGUID: sxAWWj0nRLWVIwYo3gUAhQ==
X-CSE-MsgGUID: n+xAfTDaQPW3F9P8iZ07vg==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="42077469"
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; d="scan'208";a="42077469"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2024 08:40:11 -0700
X-CSE-ConnectionGUID: g/QuKahXSTCQ0reuW3HMTg==
X-CSE-MsgGUID: eXis1y19QxOt/VsVW/Ey0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; d="scan'208";a="71121313"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Sep 2024 08:40:11 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 9 Sep 2024 08:40:11 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 9 Sep 2024 08:40:11 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 9 Sep 2024 08:40:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DGxOdPD3CILOw4amB7ZMPRlFZQKOPsIUkqkC8h7sjV4J8R2RnbaeVgTLTIjDmjs0uaJcEiFfsCOcu2GmhgdaDoZujLBSqeeMq32POC/pDdy0aCriGBbhu4UWl5KNYRSpMPxsCHxhgWdpqNFk2HlvjtSggzbTGEF39fL4Me1wQUUcaja1iGGbwdmdRIc/iwu1G+i/v7u1t4jMD/aqUYhHUtH5pbUs2tEoBKZ0jCwixpx3XQdqVeOeWt8WOjEwrXo4tUDEf76ou9SoWGyEYeRLcnlsJtWvPZSkJCy1WBFxlLyUrgE9PlJWjN+VR4Z3ZatQkZFJrH4CQV2lHRWCCBgZmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tlpXKfbiiqDj32/Qvtfo9QtLpSF7PcrDSa5KO6mS03g=;
 b=q9EPSHm+9lh+iDA29SOkG4UxzgmgH4DA8VvgV4EpetOeAnzHWpkYS5ps0TFukEKfuStrpQ85Syw3bS7na4xyqcjsP1E1BO5zn1JwBLJb0YdCUqfvTTErra8mAwu1Zc89H/KJlUA5e90B33YC1htwIv+IUOwhrZq/U3kdRCd76Q3DHx98bSpux+NsGjuBBoxTdRC8VgKzkmD5o65d5fxAAtPdpg4uluCNUnBAs3Rx8RGg+rhsU1FgnZ7h3pqDONbUgV1q0FkLr9HM2Gy+sGmdf5L8PRh/3PtarvTyDxFT9OKvbk8iKAhRaKavXmzTUdbnSwgsZXTNfqc6zzavAdBpIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS7PR11MB6199.namprd11.prod.outlook.com (2603:10b6:8:99::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7918.23; Mon, 9 Sep 2024 15:40:08 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7918.024; Mon, 9 Sep 2024
 15:40:08 +0000
Date: Mon, 9 Sep 2024 10:40:05 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, Tvrtko Ursulin <tursulin@igalia.com>,
 "Tvrtko Ursulin" <tvrtko.ursulin@igalia.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian =?utf-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH i-g-t] lib/igt_drm_fdinfo: Handle (somewhat) amdgpu
 memory stats
Message-ID: <qpnmi3mgg44uchpa34jtgugcxizn345avx236xx4znidlgdvyy@z7pserueavlv>
References: <20240904155919.74744-1-tursulin@igalia.com>
 <g4g7g32mqlhpz34j3u4mztsdjgmimne3srcwipw72y542mkweu@44rhdzyauoxa>
 <20240909152758.4ye4sbd7zgzmttgh@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240909152758.4ye4sbd7zgzmttgh@kamilkon-DESK.igk.intel.com>
X-ClientProxiedBy: MW4PR04CA0352.namprd04.prod.outlook.com
 (2603:10b6:303:8a::27) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS7PR11MB6199:EE_
X-MS-Office365-Filtering-Correlation-Id: d51d19c5-9441-4f09-6132-08dcd0e5aee4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?5wXGB+rT/p7s9orOaYw2t2vg09swnGQUJS8nytCQYbYU5cr+G5Rj1DjdWp?=
 =?iso-8859-1?Q?AegiQHRVBmMvqxNK0e0qfiz/YCDjiT6Wlnl9xcuvHAXp+Bz/oUW9vgjVf9?=
 =?iso-8859-1?Q?bilrR316T1ztcZ9/PUvK5U5Xt+j0UoKqI4c7W57VT6aRT01W0f5cqOjQ0p?=
 =?iso-8859-1?Q?S+04SdYiTbP2ZbkSZ1+XGJJ9vYO2MpExvhihMBKSbBojfWHaDs327nqOV9?=
 =?iso-8859-1?Q?heRoKOVSn9r5org49VOWX14W/k+y9kz960LATxTwClVBmAaATiJx3lbyLf?=
 =?iso-8859-1?Q?4MRy+by2gZ/ZqjCEzQ4m7J/mqPfLle2slj2ixvSc8YSNFsWZxxD7LU+kJg?=
 =?iso-8859-1?Q?dFaoRimTZvB8Gg0mlmIxe46+9PhFa8roD9MvGHYjtqMDDoIVCI/lYpSWNY?=
 =?iso-8859-1?Q?M+6nXFwgUGXaafe787bjubYFrSzCAua7DXfn1vU/baeqlwman0zf4qzVVg?=
 =?iso-8859-1?Q?qJyxmbwpir7/m2I7y92TL1t34voQBLK/8VihcUQDvztBq9ENHHqP/nQnqc?=
 =?iso-8859-1?Q?Z90W5p5Le06O528YlIg1FgfGFuzKWIomWMm9eP70/itV7OLhne39JZIdEq?=
 =?iso-8859-1?Q?XaWMftGiMbYcoXm5/i3hwqOrzVcbxh+OO/nG2PfeAxY4li3i5oapn86CHe?=
 =?iso-8859-1?Q?82il4I7NLtQcx0c978N8xevDc3ZC9HvkeDCo91urT/leuPB9sDk7/3rQaA?=
 =?iso-8859-1?Q?Ym6wrzk1lzG5Ph4oYTaPBHzOlEatElnKHqWM0XarH63sVEivyUop2nYApN?=
 =?iso-8859-1?Q?BGY5UhXkDYmtpnYzRf+bz0BdaA0qiGAvBGTDMYVgpu+KNwxweXuxIMRk0H?=
 =?iso-8859-1?Q?OKdX+xiea23FRwXUcO+B+itbgkVirhQWLBewtfkq2hw21WTumhB1VJlQv6?=
 =?iso-8859-1?Q?Fm04nyq7ljhE22vwFsJ0DYsh2N7Nj8i2FFGzjnp6kOmuFXA+28/oTgMBx3?=
 =?iso-8859-1?Q?k5kaoXtOcIqzD/RctqG2rp9DgknKMsSZDJRllO28jj31QOX5eF/30DjzEg?=
 =?iso-8859-1?Q?Wp4ANUE3mDkSDzd02xqSHQweEybdwyNHHJWREgNuL4Ht4iWggoPM4i7xyz?=
 =?iso-8859-1?Q?U3QEayRKubIYmoh5nIaO6R/UDylpcuQ5OJ7Y3/9sV4qVuVXNJzkQw/iJzy?=
 =?iso-8859-1?Q?dCQjzIB7x6tloLosqE5GGFT0v7/cvHYdZnxouuL1PluKgOggh9q7+znota?=
 =?iso-8859-1?Q?YFQBiT4yRnGVJBi/S2qeeqW7hXNEdC6rlm8Qe0iVWgAZiJMWaER64qDnZS?=
 =?iso-8859-1?Q?STnYB80+29MARWZTkVSW7uE5+gf9j9X5d7SvqQVqgeHSjbu0oxyT/d0+ZU?=
 =?iso-8859-1?Q?lqQdeOZSpFlc8EMc+YBGMaJnJtrHEOUlj9foibcSXLkd8Y9e4WroyPTqfW?=
 =?iso-8859-1?Q?1AwNNv3CNVG/KOrM5r2iOQD9E+KQS79WDyhT+dDxvV8IDkqDe0RMo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?D2rc/yn3EmlEsPZpNv0RD81sTlcQsaQaD7pIyEnv8QulCI4gNo5BdGj06B?=
 =?iso-8859-1?Q?LWaqlad4TufqqMZE/fSKTzVnhL5krGW1iJiUi7yFpGrcXTOFzKDF/Mwa60?=
 =?iso-8859-1?Q?8IlJvffEncwnN0KCPLc0PxdU/UjXJ62gjtoQL+RiT74W4bxZB1Ovl/O5rJ?=
 =?iso-8859-1?Q?uZ+TxdqoovKwqsUkKsqOINtk5U5kwBdgEPR2Dd8gyoEWS1W0aoH5pXPHlF?=
 =?iso-8859-1?Q?WxykLgVgeUNaoPz/XNGCCFwd9LB+mHclGXRbkzvRgodGkOAoT68gSYYxEF?=
 =?iso-8859-1?Q?hfYRY+iQbW92MggL91Rkz+BkE0ac+KVd9IOEnu5IwTSqqIGSCWHBntewdb?=
 =?iso-8859-1?Q?R9zTJCIcgRHPgLL91Z0Fcwbit5htTIeYOw/qzrUXLz+YR+I3+DlkC3313t?=
 =?iso-8859-1?Q?G8zJ15wLWhZvaeb6TSAiGtlYvY/oQw4b4TwgdTJ2idzv7g8xnYS/DleOfx?=
 =?iso-8859-1?Q?0TTeWZrc+vkd3FbvAfhX60S5AdEOkDPBBGQ+XQJHECZRb2ISKj0OQbqoNI?=
 =?iso-8859-1?Q?PDHzCg/xISEKSB4vWZy0/lDQwix8xfEnEirR++tAM1dti0lkdogCToaaHc?=
 =?iso-8859-1?Q?gSb41k0F7Kh402oktACQQZDGjWIKcczVDhEs/KOleqmnpciVWZrEx+yS1E?=
 =?iso-8859-1?Q?4aWe8U5d0DFtLQiItQBjjWSZrn4206eSuH7MboPduZVh2sgZo+xJAIbDVM?=
 =?iso-8859-1?Q?DcEI78daVZ8DkrqV4soqLI9TRlCJCcaJbIFbzW7+7MrDxfvy6pCLtXUMQr?=
 =?iso-8859-1?Q?T+mUcxf9t2NI9w+xpccuh8ZW42lNe6fnqRexgnhRJVLyYruHjetme/Fo8+?=
 =?iso-8859-1?Q?6k/onKe7ulPbrE9g+LE4+g7EVcvwwhB0GtdvG6KkpLGDjVlkGMa2wmq7Zc?=
 =?iso-8859-1?Q?Pws5mYTawYk1UBi1WT2z28lSNDGPTLDxUAw1j5vQoaP1N572DAYQOnqdRw?=
 =?iso-8859-1?Q?jOqf0OpSYZ7uehljV2owfT+TyJs1fyXQBlZ2FI7aUwGMHLGtaAd7ZuUpIm?=
 =?iso-8859-1?Q?q7e4aSWQPoOmAI9lC/N3/8mJUcGZE/WZBKv3+NC/2wQAMmekYO2YxDHAku?=
 =?iso-8859-1?Q?9n6W259KqaNF3TQcIG9WvttsS1rrkpO5MhyuzZ1urKjBIT9VY9E+foUAcU?=
 =?iso-8859-1?Q?ZW1IbXXN6TLmfp/7C2iBwGb2IDL0tp5aEhS967RyvduxAc5eEPb5Ec1aO4?=
 =?iso-8859-1?Q?PlWPhqAeIdIvgFrsOJ9nWTbL/tyxhyGpq2Czq38iICowtEoVy7QMwCTAMC?=
 =?iso-8859-1?Q?w8S84LNDFj3OdRtSLWfEhFy6gSW6CVtNk/xw9uxBm8fWzSrGofzEYf3lMH?=
 =?iso-8859-1?Q?RgSMFqlQ74spZkg8lebW2FzHs5lQ8Xhevx2qOD6afGmQ9oMHoGfwpqkDiD?=
 =?iso-8859-1?Q?WPv33Bmwcqkc4zGdy7seuWE3IyZ8UQASASh+cCrcyYkyE1j8Uqpurz714m?=
 =?iso-8859-1?Q?2a0s35Ifz1yJAJuvGmBt9q/hAMPHFeqwkbrhEdBlx7BWnKJXssm8PC7apb?=
 =?iso-8859-1?Q?5KvmhC7E/UBEv3xWkeMDoVJocWesLiNKrZJRtBxIDLR4yfM8H26Cb8mBX8?=
 =?iso-8859-1?Q?iWQ2AGUb830AXEmc0SjBsNC94CemOCcx6W36kEYjHD5ksTWpnHwgdlGWIl?=
 =?iso-8859-1?Q?qHE6evqzjHhZaRbujIyVsCr4adsGRCJan1gqWDmAdYVq9zTcrlimxvkw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d51d19c5-9441-4f09-6132-08dcd0e5aee4
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2024 15:40:08.1766 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zFJxOtdqcQ/ueQrztaaU5qyt588QMmPFhkt7RjIrdcTODOHj7bavzeSycmW1meP6VAriYfiAnoB4NjApEKwxe4LEicW8ARssALgm6gYSuQg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6199
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

On Mon, Sep 09, 2024 at 05:27:58PM GMT, Kamil Konieczny wrote:
>Hi Lucas,
>On 2024-09-05 at 07:55:14 -0500, Lucas De Marchi wrote:
>> On Wed, Sep 04, 2024 at 04:59:19PM GMT, Tvrtko Ursulin wrote:
>> > From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> >
>> > Code so far only handles the clients using the common DRM helper.
>> >
>> > Handle the amdgpu driver which uses a slightly different set of keys. More
>> > specifically, outputs drm-memory-<region> instead of drm-resident-<region>.
>> >
>> > With this added gputop starts showing resident memory usage for amdgpu.
>> >
>> > v2:
>> > * Semantics of amdgpu drm-memory- are like resident, not total.
>> >
>> > Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> > Cc: Alex Deucher <alexander.deucher@amd.com>
>> > Cc: Christian König <christian.koenig@amd.com>
>> > Cc: Rob Clark <robdclark@chromium.org>
>> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> > Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com> # v1
>>
>> my r-b stands.
>>
>> Lucas De Marchi
>
>Could you look into a regression reported for XeFULL:
>
>igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue:

this has been going for some time and AFAICS points to a kernel bug when
destroying the exec queue - the time for that client is not accounted.
Kind of hard to reproduce, there must be a race hiding somewhere.

>
>https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11696/shard-lnl-2/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html

In commit 5986b136c97c ("tests/intel/xe_drm_fdinfo: Print timestamp for debug")
I added the timestamp recorded by the GPU to debug this.

(xe_drm_fdinfo:1870) DEBUG: ccs: spinner started
(xe_drm_fdinfo:1870) DEBUG: ccs: spinner ended (timestamp=4811350)
(xe_drm_fdinfo:1870) DEBUG: ccs: sample 1: cycles 0, total_cycles 8060935168
(xe_drm_fdinfo:1870) DEBUG: ccs: sample 2: cycles 0, total_cycles 8065771761
(xe_drm_fdinfo:1870) DEBUG: ccs: percent: 0.000000
(xe_drm_fdinfo:1870) CRITICAL: Test assertion failure function check_results, file ../../../usr/src/igt-gpu-tools/tests/intel/xe_drm_fdinfo.c:504:
(xe_drm_fdinfo:1870) CRITICAL: Failed assertion: 95.0 < percent
(xe_drm_fdinfo:1870) CRITICAL: error: 95.000000 >= 0.000000

And from that we can see the spinner actually executed for similar time
as previous runs. However the exec queue recorded 0 in the exec time.

All this is unrelated to the commit by Tvrtko. It's probably reported as
regression as I ended up renaming the test while fixing the igt bug that
was masking this (apparently) real kernel bug.

Lucas De Marchi

>
>Regards,
>Kamil
>
