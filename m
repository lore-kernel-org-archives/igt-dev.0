Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67BC2C3DA4A
	for <igt-dev@archiver.kernel.org>; Tue, 20 Aug 2024 05:38:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 130D210E4B1;
	Tue, 20 Aug 2024 05:38:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MN5jvJEb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B720610E4B0
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Aug 2024 05:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724132294; x=1755668294;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=CI2SyL9ClJrz9HeipYo1fnNZgJySKDBKXV9qdMau4gk=;
 b=MN5jvJEbf+NM7z/9PIfET807Km3btSzXhPUY1dhG9cxT/PvsSQkQuB/v
 fUtJjxiSJjKmwZpZPlVE2id2si8yBAIBobu5R5CploBHIsIfMaCJKG94p
 FQmPQlX35HXt8ntfmbxfF2m9QMaZnwWp5AYdi11B6yVagHe1pKZiVYbAH
 1hA5yc7RBZnwF9b8kut7/1iqLIP8Wv5g1xd2LxjAEAGOTQPb6ypeQm2LC
 PkNBtYbA7Di+HvSzeMye3SBUGNgZJlNCjrVJy6LuMTGykd+Ts/8gpOfCv
 EZMW89j1lk6cJ4eN85ophuX3RJqFAfhHbjNgOGZaJQ/NH/oOz6Z/8mQkf g==;
X-CSE-ConnectionGUID: c18sigM3Sg2l3bOfd4xXJg==
X-CSE-MsgGUID: j2yVBnf2T5K43OxcF9c6TQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="26205974"
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; d="scan'208,217";a="26205974"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 22:38:13 -0700
X-CSE-ConnectionGUID: o6MxAC+FQMWRavSn5Yxylg==
X-CSE-MsgGUID: 00v3/ZnmRRCCIIp0mp0m/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; d="scan'208,217";a="64982796"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Aug 2024 22:38:12 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 19 Aug 2024 22:38:12 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 19 Aug 2024 22:38:12 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 19 Aug 2024 22:38:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hXN5TenVfn0/t098QL4FN3WBz4tcS9gAGiqGQ9FcPUCDpABZR6o4XrDtb+kIWXZP+2kCwozcRgKckqLKQvJuG7M5JKztgsLsjkfp2kHHQAh8lXK6j5wIuOtXJSiRQHC/ekUUazCqKXMMqgnyliGaUhWGsRpU8InXfZVld4FL0Wk3bC9ZcKmT6JwJwQho0hidb2oGvrHiFkuKri1V3svxRODbu5HGI0GWR+B9P/GF4uelofNLkq9lZMdUFmeuIiq78i20zM65iiZDT789RYYWDVPpBgNaGiMhhsC0LtTDlisbqDOni/JbairbLO5ewZcKX1MScxNkgYEvJxRXYu2LDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w3lqZ6peNhj1r9mhFFfI0xufN0d10DESSRWLQI7VqxE=;
 b=bFboHkP9w1mJYFfG043D+LPOjvChk7Fc0pkR6TwA8Bq+OuL2I3d++2h4f+SvK+UeBGtbSjP5Sml8D+/vKe1irBete8JsvjfvV886PQ94Gsyk8AhFQdOqi6pK7AZhCLOKdeFj/hT6gt1J6TXLzw1f1ZMl0psFCXfPpkYYUO9jlThHsUFi7Wer949WFcQeb0jZ8fezHVSmZD/VI4HgsEaDLyYEm7zcJpCA4peF0vju7tZ221Yh170R/pIpJnFzPE9ZQcBGcNUiAytCkiSUHom3zH8j2IjAr7egCbb7l8vys0YAP0ikbrqcmg9PdXPCZomNrkRce6oUKTI03G3fLbrjjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5293.namprd11.prod.outlook.com (2603:10b6:5:390::20)
 by SA1PR11MB6847.namprd11.prod.outlook.com (2603:10b6:806:29e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Tue, 20 Aug
 2024 05:38:04 +0000
Received: from DM4PR11MB5293.namprd11.prod.outlook.com
 ([fe80::e1f5:3b23:9560:2dc2]) by DM4PR11MB5293.namprd11.prod.outlook.com
 ([fe80::e1f5:3b23:9560:2dc2%4]) with mapi id 15.20.7875.019; Tue, 20 Aug 2024
 05:38:04 +0000
Content-Type: multipart/alternative;
 boundary="------------0rGvBusQ5aX8nQVWqiv0Fexf"
Message-ID: <28cfb915-3871-44da-bc85-decf316a8a12@intel.com>
Date: Tue, 20 Aug 2024 11:07:57 +0530
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH i-g-t] lib/igt_kmod: Unload/Reload the mei Modules Before
 Unloading/Reloading the i915/xe Driver
To: Lucas De Marchi <lucas.demarchi@intel.com>, Daniele Ceraolo Spurio
 <daniele.ceraolospurio@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>
References: <20240815130423.7686-1-krishnaiah.bommu@intel.com>
 <hg3qro3dxili6n3dggarg75abttxeuzsqkibzviogpdvmylq4u@qan2mer3fh3l>
 <a7cca758-ae66-42a6-be4f-c935d2fab785@intel.com>
 <nko5zjbdfw272zgf2di4yzeptujglamsxkryjvicdperonsnqw@ggnhjda4trwj>
Content-Language: en-US
From: "Bommu, Krishnaiah" <krishnaiah.bommu@intel.com>
In-Reply-To: <nko5zjbdfw272zgf2di4yzeptujglamsxkryjvicdperonsnqw@ggnhjda4trwj>
X-ClientProxiedBy: MA0PR01CA0105.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::19) To DM4PR11MB5293.namprd11.prod.outlook.com
 (2603:10b6:5:390::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5293:EE_|SA1PR11MB6847:EE_
X-MS-Office365-Filtering-Correlation-Id: a1c03702-9001-49b1-744b-08dcc0da431d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MEJ2dGdITDJYNTZzempxZHBJTmRKN1NRQ2RGc1pKUVJKdzYyNVBLK0JFNktk?=
 =?utf-8?B?OENPZng5ZUg3ekN6bzdGbEMwcTBCamNtU09tREJCZTE1Y3VpWmpIV21BUEE4?=
 =?utf-8?B?TTQ0YXFxWTMydHloY3JnQml0Y25ISTVxR1N2MlVhalRGK0V2OWJZQmNZbnlv?=
 =?utf-8?B?QWhaQ3ZsLzcrVG92dkpNQ3dkNXRoQnJqblVtczVqaUwrNHF3NE41cy9LN20w?=
 =?utf-8?B?SGhYL3BFMFdHOW00eFYxalJVamNEdjJ0UWxSUFVCV1Fiejd5TlEvczJIaUgz?=
 =?utf-8?B?QXdaREdINkliZGh5bUdGbjBKQS9BSlJTbnFnaVUyYWc1cDREYmZYUXo2TXBp?=
 =?utf-8?B?UHdYNjNtUUptSjEydW1kL0VEeTAzNDNSZDZXVktJSU5NbUF1RFhvWFhWVUxF?=
 =?utf-8?B?aGZ5Wm11M3BlOWR1bGZIbkpOMkg4b1BxMVVhMi9SeTViYmFjbExnSExybEdN?=
 =?utf-8?B?dGFZd2lOM2E3OEt3ZUhGcU1rdlppYVNlVm5mM2U4ZFUyYzJRZUp0NkcwZ2Nn?=
 =?utf-8?B?TVBDNVg1RzBLK2hmT3RZTTNIdkJUczY1RUwyRm1oL2xNRHZQdmhSZHRyTmc2?=
 =?utf-8?B?cllxNGVsS0g1OG5Cdk1ZWC9iM0pNbzRoQzQyNmZGVkVYbTllRTRnT3FjaEZk?=
 =?utf-8?B?MFFUREE3SDJFRFNvL0tSKy9pV3Q2ZERpcjJ0Vng2MmFBWi83UHdIUHl6WmpY?=
 =?utf-8?B?NFdoNUxjTEZyMHdKbVJQa3dGUWRkajVSZzhObFlieDVjVVk1NnpmOXpCaTBt?=
 =?utf-8?B?ZWVmT2o4TGJwUmxXNEQvTldaWldCSXg0TUxCeEZYc3NEc2xWMzk0VGRhSXhq?=
 =?utf-8?B?U2RiTkNtZ2RwaWlqR1lSc0hOa1ZEN2pmbStleFNZaGNkMkFvMHhNWSt5UHFn?=
 =?utf-8?B?Z2NqR2h1TU5WYXY2aDhqNkh3SjBrTEZmS1kxUCtWVHJuVjNkSG1OWDhLekVS?=
 =?utf-8?B?WFV3dTFuai8yWXRjNEc3UVU3SFlBc2YrUnRvOFZ2R09YVnZNYkc0RS9saXg5?=
 =?utf-8?B?U1Bwb1B2VmFONEpsVDA2dWtGazBRdnZqNEF5Nmt4WjlMZjNsVGt4RkNsK1Ja?=
 =?utf-8?B?Y0R0OXNKdlo3MGM3akQ0ZnVPaUMwcTRyZ2dwbERkVE0yYWdJb2twYURsK1VJ?=
 =?utf-8?B?RFFKWTF4UlZUS3luMHRZdUxiakt3Q2xiTDE4dWNkRFlEeE5XOFMzQkR4YmlB?=
 =?utf-8?B?eExkbGdnbW8rdGVTMlMrejRDOHJuOGpWUEdKVU4zYXNqL3p0R0ZkTzJWbmJ5?=
 =?utf-8?B?ZVFVUWhBM0hrNzZkSktIMzFuenpuN1NSSGhDSWRHMjNqb2kxd0ZDT2hVYlpn?=
 =?utf-8?B?VUlJVG83R0FFYlJxaG9kQ0pYZlRaTGpSWlplSzExanRKUjZzcUFTd0xLVzBt?=
 =?utf-8?B?MHBIb2pZVnZBMjA3bVhWZ05MRFI3Z2FZOUgvZTJkQUY0TnZVZXE1TkpQb3Rr?=
 =?utf-8?B?Qm43N0FpV0d5bDIvR2J0bjRsQnYyM3ZkZkVvdFJzZHhQUXZtaksrNUJiNkht?=
 =?utf-8?B?RTdaQUFvSWV5M1pnMklFUVVKRUZlMmN2bXJjbTdpYjRJWjY1blNvMHBSZ2d4?=
 =?utf-8?B?YVp2eTQzRk1GVWNVNlBNa0R4VG44d3g2ekVWQ1BXNmF4NEt0cmJ0R1JaNlVG?=
 =?utf-8?B?ak5pcDk2cVVIckdwdkZFWlRxSCtBTEFzRnp1OWFWd0lNVmxtVHFZcGVUSDRo?=
 =?utf-8?B?dC81ak5DU1ZPbXpMYTYweW5tWldUTUc0UElXTnhQRlk5S0JGZXdxY0dYTldZ?=
 =?utf-8?Q?li4U59f/DsZJ6nCbsQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5293.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dGp2aSttRGhpNE43azBMMDF3OXB2TXVJTXR4cHg4eDBiZEhnajM0cUdMa0Jj?=
 =?utf-8?B?SGE5S09sbWsxekYrYkFOL3ZOMkh1WWlsL3dwb29tUGs2ZU5YdHU4ZEdDcFdH?=
 =?utf-8?B?VjNNUmhFQlB2aWlDUnFIdzJ4dXROY2dDL0JqWVVFQVlKZHBZZjUxT0VReGlk?=
 =?utf-8?B?MEt3VEdnek9XYUp5QUJSTDFsSER2QWp1eUk2c1VjNzNRWTAvdGViY3BReis2?=
 =?utf-8?B?Uko2UUZYUHhOdTIwSWplaG9sV0pkS3JrblNPWTBCT2VuMDNLOVEwU2IyZklm?=
 =?utf-8?B?NTZqOFJhQlhyNTB1RC9YYWtkMzVqVFhpRlRVdXJBWHBCUW9zSHpUYnpoaWxL?=
 =?utf-8?B?WnR5STROaXNyS3VyWE1pT0ZIWDNlb0tScU5RVzR3SDl1MW9LM2tBbjkzOVB6?=
 =?utf-8?B?QnN6bS9sTS9PNEFpUUd5NXNQUnZiNXNQcFdPNDdJVGpESW1KZmZXRU8xMklk?=
 =?utf-8?B?Smh2b0l2T01lbEtvM2hjM3F0TW5pSU5SZ05ldDRjY1NCdm5ETnNHZk1lZnhD?=
 =?utf-8?B?b3YrcUJoOWxzWjRMbmFjRWhQaVo5UE1SWGpwM25XY1NHdnJXcnVGbTFHL3VH?=
 =?utf-8?B?bmZWeEVmMk1CUGJvcGpwUzlReDhqNDc0c2RsS3M2TGJzZ1RFaUZDVVdXdS9J?=
 =?utf-8?B?VkIvUmtDajhBaG44eDM4VEw4ZzkzWHlmalEwcjY4RkRBQnp0cnRDOGVKM25M?=
 =?utf-8?B?dWJZenkzR2xCNHVxelVRYkE5enV2Tko3OFZSZHVBZFJwQWZHUlBSVnNndjVz?=
 =?utf-8?B?T3dOSXVqZ2psUXBvTmFkMnpDczJpMVlEaTNJRit6SUxNWVRKYW45UVJMQnh3?=
 =?utf-8?B?bFZjTWdUa3BRRW9xUDV6MXdwdytwUjR4aVgrb3JRQzBJc2U1Z1lJeEFRcStk?=
 =?utf-8?B?T3ZWM3F0dmQyM2JlRGFYK0JGZXMwVDJHR215Vko5QjJIbDVFMTJHWS81bFZG?=
 =?utf-8?B?LzRpTnEvenV0R2FQUCtOVE1kNjI2Tzc5cVFoZ1VxWjVMTUNLV3ZOUFVDc3Jp?=
 =?utf-8?B?b2JRb205bmZpWGpERldDcXloWmJGQVI4a0Mzc0VMRE04RTRmSDNyMFF6N0VI?=
 =?utf-8?B?RndvWDF1aW96aU9CL2o0T1ptSDdQL3Q2bWpQR3AxWlVqcUVvQXAwRCtjYTJa?=
 =?utf-8?B?VEpJbFpDRnMxL3ZBQWZSQ1pFWGdscVlGbE5zdndmWUREcUg1TEQ3TlB1cEtl?=
 =?utf-8?B?MjYweXZWZk40SGtueGExd3NxUUpBT3AxSnk3TjBGZjQ3UXN4Q2c2cERzSXFs?=
 =?utf-8?B?bHpZSHY0Y1ZybThSYlFJVkh5OUZjUVVUNWg5K0N2RGozdHF5UXdieHJTR2xX?=
 =?utf-8?B?MExhZFFnTDFOYm4xYW0zMXJjYThIYUxKNGI0YVhZMzRFYy9tcmh2UTE0WS9D?=
 =?utf-8?B?NE9LQSszK1RqOEE1dkoyWVBvVGRGeUYxK3JIaUc3anZDYkNjM09FUFdnT1Rp?=
 =?utf-8?B?NVFmUnlyaUdWUTErd1BwVzFqR3RWV00rdUQ5RnlMS2RHZ1RPdzNCYktmS3BX?=
 =?utf-8?B?a2RmQ2Y3OCtOTllUR1F0Kzg4NEt1SHd2T0dMR1dERXZxVjdnV0E5TWxvbFdy?=
 =?utf-8?B?Y3g2bHg5VjQ0SmRWU0ZyN3h5NFcvZnl6emRvSmdwRlFBbHdEMFQvYVdyekIz?=
 =?utf-8?B?Yk1KTnZ3UDU4RFdWL1RLZnIwZ2xKVk0rNlhjaHhOTTgvODNQOXUvK2FpZUJT?=
 =?utf-8?B?NHVjaTBEa1gxR25aU0F2bDFKSS9nT2poSnEwNjNWM1FkRDk3d3NldEZ4b3dv?=
 =?utf-8?B?NXViZm82STNXbjZWclNXaHpkbU1sZDhSVHVScDFlTU45Y25VajdMNXp0UUFh?=
 =?utf-8?B?Q2x5bzNSMTk2eEFackFaTFhOZDlZaXB0ZVRTOE1oek5lR3VyTDFGSkp6ODhL?=
 =?utf-8?B?TnljM2VHSmNCR2dvL09XYmE5OU9vMWhabm8wYWJadnpsSmkxaFQ1ZTdYK1Rs?=
 =?utf-8?B?MXNNelJYa0NMdVUxQ2FuMFJGbGIxYnlmM3c2N1NYRU00dlVFQ2NZTnFoTjhC?=
 =?utf-8?B?V01lZzh0aUdTak9ydE1vdndEVnlsSnZ5ei9lMmkxVk8rZ255eVVPUTh0QnVK?=
 =?utf-8?B?WDcwTngyK0YveDlveXZ6dG5KQUpmclJlU3d5UGJpcS9GOWdEdGVtRVR2WGNm?=
 =?utf-8?B?UWc3aGdJNmdvTXpWeGVHQldRbUtwZHNzVzFvN1VHOS81M1Y2ZGFuTEQ1ZFFz?=
 =?utf-8?B?MGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a1c03702-9001-49b1-744b-08dcc0da431d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5293.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 05:38:04.5852 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /NQVdvw1TajgsdJXOv80G++udCSO9Y7NYaaX1KXhw2WvQNiu9NH8xt9soIXwtdNduvvucWot+aHUPl0qZdR4EmgoSq5biRWvbhHO/KjzkUI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6847
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

--------------0rGvBusQ5aX8nQVWqiv0Fexf
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 15-08-2024 22:55, Lucas De Marchi wrote:
> On Thu, Aug 15, 2024 at 09:57:08AM GMT, Daniele Ceraolo Spurio wrote:
>>
>>
>> On 8/15/2024 8:20 AM, Lucas De Marchi wrote:
>>> On Thu, Aug 15, 2024 at 06:34:23PM GMT, Bommu Krishnaiah wrote:
>>>> To ensure stability and proper module management, this update 
>>>> introduces
>>>> changes to the handling of MEI modules when loading or unloading
>>>> the Intel i915 or Xe drivers.
>>>>
>>>> Key Changes:
>>>> - Unload Order: The `mei_gsc_proxy` module is now unloaded before 
>>>> `mei_gsc`,
>>>> preventing potential failures during the unloading process.
>>>> - Platform-Specific Handling: On platforms where the MEI hardware 
>>>> is integrated
>>>> with the graphics device (e.g., DG2/BMG), the MEI modules depend on 
>>>> the i915/Xe driver.
>>>> Conversely, on newer platforms like CLS, where MEI hardware is 
>>>> separate,
>>>> this dependency does not exist. This update ensures that MEI 
>>>> modules are
>>>> unloaded/reloaded in the correct order based on platform-specific 
>>>> dependencies.
>>>>
>>>> These changes address the need for a more robust handling of MEI 
>>>> modules across
>>>> different hardware platforms, ensuring that the i915/Xe driver can be
>>>> cleanly unloaded and reloaded without issues.
>>>>
>>>> Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
>>>> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>>>> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>>> ---
>>>> lib/igt_kmod.c | 38 ++++++++++++++++++++++++++++++++++++++
>>>> 1 file changed, 38 insertions(+)
>>>>
>>>> diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
>>>> index 464c0dcf4..6ee2b7afe 100644
>>>> --- a/lib/igt_kmod.c
>>>> +++ b/lib/igt_kmod.c
>>>> @@ -480,9 +480,29 @@ igt_intel_driver_load(const char *opts, const 
>>>> char *driver)
>>>> {
>>>>     int ret;
>>>>
>>>> +    const char *mei[] = {
>>>> +        /* mei_gsc uses an i915 aux dev and the other mei mods 
>>>> depend on it */
>>>> +        "mei_pxp",
>>>> +        "mei_hdcp",
>>>> +        "mei_gsc_proxy",
>>>> +        "mei_gsc",
>>>> +        NULL,
>>>
>>> all this manual approach we have for module unloading should be gone
>>> IMO. Replace that with 1) unbind the driver; 2) unload the module.
>>> There's no need afaict to keep tracking what the module uses.
>>>
>>> as for loading, why exactly do we have to do the kernels/depmod
>>> manually?  If we have to do anything manually like that, it means
>>> real users won't have that and we are actually missing the proper
>>> integration. I typed something on the different types of
>>> dependencies (harddep, softdep, weakdep):
>>> https://politreco.com/2024/08/linux-module-dependencies/
>>
>> The mei modules are a bit of an issue because they change behavior 
>> between integrated and discrete. In integrated, they're loaded on the 
>> CPU MEI device (the CSME) and so they're completely independent from 
>> i915/xe and we don't need to unload/load them them to unload/load 
>> i915/xe. On discrete however the MEI device is a child device on the 
>> graphics card, so the mei modules depend on i915/xe and need to be 
>> removed before the graphics driver can be unloaded, but are then 
>> auto-reloaded when the i915/xe is re-loaded. So for IGT we have 2 
>> possible solutions:
>>
>> 1) only unload mei modules if we're on discrete, in which case they 
>> will correctly auto-reload when we re-export the child device.
>> 2) always unload mei modules before unloading i915/xe, but then we 
>> need to manually re-load them because they're not going to be 
>> auto-reloaded on integrated.
>>
>> I'm guessing that if we unplug i915/xe that's going to automatically 
>> unplug the mei driver on the child device so maybe that does help in 
>> avoiding the unload/reload flow?
>
> yes. Just unbinding the driver should make it stop using it and if
> that doesn't work we have something to fix outside of the CI infra.
>
> for the loading part, *if we have no other means*, adding a
> MODULE_SOFTDEP("pre: ...") would do it, although a weakdep +
> request_module() if/when needed would be better (except that
> weakdep is only available on 6.11 and kmod 33)
>
> Lucas De Marchi
>
>>
>> Daniele
>>
>>>
>>> Lucas De Marchi


thank you for your inputs

I tried with module unbind and unload with this mei modules was not 
removed, I will add mei_gsc_proxy removal for discrete platforms with 
MODULE_SOFTDEP

root@DUT6099BMGFRD:/home/gta#

root@DUT6099BMGFRD:/home/gta# lsmod | grep mei

mei_gsc_proxy163840

mei_gsc122881

mei_pxp163840

mei_hdcp286720

mei_me491523 mei_gsc

mei1679368 mei_gsc_proxy,mei_gsc,mei_hdcp,mei_pxp,mei_me

root@DUT6099BMGFRD:/home/gta# echo -n auto > 
/sys/bus/pci/devices/0000\:03\:00.0/power/control

root@DUT6099BMGFRD:/home/gta# echo -n "0000:03:00.0" > 
/sys/bus/pci/drivers/xe/unbind

root@DUT6099BMGFRD:/home/gta# lsmod | grep mei

mei_gsc_proxy163840

mei_gsc122880

mei_pxp163840

mei_hdcp286720

mei_me491523 mei_gsc

mei1679367 mei_gsc_proxy,mei_gsc,mei_hdcp,mei_pxp,mei_me

root@DUT6099BMGFRD:/home/gta#

root@DUT6099BMGFRD:/home/gta# modprobe -r xe

root@DUT6099BMGFRD:/home/gta#

root@DUT6099BMGFRD:/home/gta#

root@DUT6099BMGFRD:/home/gta# lsmod | grep mei

mei_gsc_proxy163840

mei_gsc122880

mei_pxp163840

mei_hdcp286720

mei_me491523 mei_gsc

mei1679367 mei_gsc_proxy,mei_gsc,mei_hdcp,mei_pxp,mei_me

root@DUT6099BMGFRD:/home/gta#


Regards,

Krishna.

>>>
>>>> +    };
>>>> +
>>>>     if (opts)
>>>>         igt_info("Reloading %s with %s\n\n", driver, opts);
>>>>
>>>> +    for (const char **m = mei; *m; m++) {
>>>> +        if (igt_kmod_is_loaded(*m))
>>>> +            continue;
>>>> +
>>>> +        ret = igt_kmod_load(*m, NULL);
>>>> +        if (ret) {
>>>> +            igt_debug("Could not load %s\n", *m);
>>>> +            return ret;
>>>> +        }
>>>> +    }
>>>> +
>>>>     ret = igt_kmod_load(driver, opts);
>>>>     if (ret) {
>>>>         igt_debug("Could not load %s\n", driver);
>>>> @@ -620,9 +640,14 @@ int __igt_intel_driver_unload(char **who, 
>>>> const char *driver)
>>>>     const char *aux[] = {
>>>>         /* gen5: ips uses symbol_get() so only a soft module 
>>>> dependency */
>>>>         "intel_ips",
>>>> +        NULL,
>>>> +    };
>>>> +
>>>> +    const char *mei[] = {
>>>>         /* mei_gsc uses an i915 aux dev and the other mei mods 
>>>> depend on it */
>>>>         "mei_pxp",
>>>>         "mei_hdcp",
>>>> +        "mei_gsc_proxy",
>>>>         "mei_gsc",
>>>>         NULL,
>>>>     };
>>>> @@ -647,6 +672,19 @@ int __igt_intel_driver_unload(char **who, 
>>>> const char *driver)
>>>>         }
>>>>     }
>>>>
>>>> +    for (const char **m = mei; *m; m++) {
>>>> +        if (!igt_kmod_is_loaded(*m))
>>>> +            continue;
>>>> +
>>>> +        ret = igt_kmod_unload(*m);
>>>> +        if (ret) {
>>>> +            if (who)
>>>> +                *who = strdup_realloc(*who, *m);
>>>> +
>>>> +            return ret;
>>>> +        }
>>>> +    }
>>>> +
>>>>     if (igt_kmod_is_loaded(driver)) {
>>>>         ret = igt_kmod_unload(driver);
>>>>         if (ret) {
>>>> -- 
>>>> 2.25.1
>>>>
>>
--------------0rGvBusQ5aX8nQVWqiv0Fexf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 15-08-2024 22:55, Lucas De Marchi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:nko5zjbdfw272zgf2di4yzeptujglamsxkryjvicdperonsnqw@ggnhjda4trwj">On
      Thu, Aug 15, 2024 at 09:57:08AM GMT, Daniele Ceraolo Spurio wrote:
      <br>
      <blockquote type="cite">
        <br>
        <br>
        On 8/15/2024 8:20 AM, Lucas De Marchi wrote:
        <br>
        <blockquote type="cite">On Thu, Aug 15, 2024 at 06:34:23PM GMT,
          Bommu Krishnaiah wrote:
          <br>
          <blockquote type="cite">To ensure stability and proper module
            management, this update introduces
            <br>
            changes to the handling of MEI modules when loading or
            unloading
            <br>
            the Intel i915 or Xe drivers.
            <br>
            <br>
            Key Changes:
            <br>
            - Unload Order: The `mei_gsc_proxy` module is now unloaded
            before `mei_gsc`,
            <br>
            preventing potential failures during the unloading process.
            <br>
            - Platform-Specific Handling: On platforms where the MEI
            hardware is integrated
            <br>
            with the graphics device (e.g., DG2/BMG), the MEI modules
            depend on the i915/Xe driver.
            <br>
            Conversely, on newer platforms like CLS, where MEI hardware
            is separate,
            <br>
            this dependency does not exist. This update ensures that MEI
            modules are
            <br>
            unloaded/reloaded in the correct order based on
            platform-specific dependencies.
            <br>
            <br>
            These changes address the need for a more robust handling of
            MEI modules across
            <br>
            different hardware platforms, ensuring that the i915/Xe
            driver can be
            <br>
            cleanly unloaded and reloaded without issues.
            <br>
            <br>
            Signed-off-by: Bommu Krishnaiah
            <a class="moz-txt-link-rfc2396E" href="mailto:krishnaiah.bommu@intel.com">&lt;krishnaiah.bommu@intel.com&gt;</a>
            <br>
            Cc: Kamil Konieczny <a class="moz-txt-link-rfc2396E" href="mailto:kamil.konieczny@linux.intel.com">&lt;kamil.konieczny@linux.intel.com&gt;</a>
            <br>
            Cc: Daniele Ceraolo Spurio
            <a class="moz-txt-link-rfc2396E" href="mailto:daniele.ceraolospurio@intel.com">&lt;daniele.ceraolospurio@intel.com&gt;</a>
            <br>
            ---
            <br>
            lib/igt_kmod.c | 38 ++++++++++++++++++++++++++++++++++++++
            <br>
            1 file changed, 38 insertions(+)
            <br>
            <br>
            diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
            <br>
            index 464c0dcf4..6ee2b7afe 100644
            <br>
            --- a/lib/igt_kmod.c
            <br>
            +++ b/lib/igt_kmod.c
            <br>
            @@ -480,9 +480,29 @@ igt_intel_driver_load(const char *opts,
            const char *driver)
            <br>
            {
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp;int ret;
            <br>
            <br>
            +&nbsp;&nbsp;&nbsp; const char *mei[] = {
            <br>
            +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* mei_gsc uses an i915 aux dev and the other mei
            mods depend on it */
            <br>
            +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;mei_pxp&quot;,
            <br>
            +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;mei_hdcp&quot;,
            <br>
            +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;mei_gsc_proxy&quot;,
            <br>
            +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;mei_gsc&quot;,
            <br>
            +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NULL,
            <br>
          </blockquote>
          <br>
          all this manual approach we have for module unloading should
          be gone
          <br>
          IMO. Replace that with 1) unbind the driver; 2) unload the
          module.
          <br>
          There's no need afaict to keep tracking what the module uses.
          <br>
          <br>
          as for loading, why exactly do we have to do the
          kernels/depmod
          <br>
          manually?&nbsp; If we have to do anything manually like that, it
          means
          <br>
          real users won't have that and we are actually missing the
          proper
          <br>
          integration. I typed something on the different types of
          <br>
          dependencies (harddep, softdep, weakdep):
          <br>
          <a class="moz-txt-link-freetext" href="https://politreco.com/2024/08/linux-module-dependencies/">https://politreco.com/2024/08/linux-module-dependencies/</a>
          <br>
        </blockquote>
        <br>
        The mei modules are a bit of an issue because they change
        behavior between integrated and discrete. In integrated, they're
        loaded on the CPU MEI device (the CSME) and so they're
        completely independent from i915/xe and we don't need to
        unload/load them them to unload/load i915/xe. On discrete
        however the MEI device is a child device on the graphics card,
        so the mei modules depend on i915/xe and need to be removed
        before the graphics driver can be unloaded, but are then
        auto-reloaded when the i915/xe is re-loaded. So for IGT we have
        2 possible solutions:
        <br>
        <br>
        1) only unload mei modules if we're on discrete, in which case
        they will correctly auto-reload when we re-export the child
        device.
        <br>
        2) always unload mei modules before unloading i915/xe, but then
        we need to manually re-load them because they're not going to be
        auto-reloaded on integrated.
        <br>
        <br>
        I'm guessing that if we unplug i915/xe that's going to
        automatically unplug the mei driver on the child device so maybe
        that does help in avoiding the unload/reload flow?
        <br>
      </blockquote>
      <br>
      yes. Just unbinding the driver should make it stop using it and if
      <br>
      that doesn't work we have something to fix outside of the CI
      infra.
      <br>
      <br>
      for the loading part, *if we have no other means*, adding a
      <br>
      MODULE_SOFTDEP(&quot;pre: ...&quot;) would do it, although a weakdep +
      <br>
      request_module() if/when needed would be better (except that
      <br>
      weakdep is only available on 6.11 and kmod 33)
      <br>
      <br>
      Lucas De Marchi
      <br>
      <br>
      <blockquote type="cite">
        <br>
        Daniele
        <br>
        <br>
        <blockquote type="cite">
          <br>
          Lucas De Marchi
          <br>
        </blockquote>
      </blockquote>
    </blockquote>
    <p><br>
    </p>
    <p>thank you for your inputs</p>
    <p><!--[if gte mso 9]><xml>
 <o:OfficeDocumentSettings>
  <o:AllowPNG/>
 </o:OfficeDocumentSettings>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <w:WordDocument>
  <w:View>Normal</w:View>
  <w:Zoom>0</w:Zoom>
  <w:TrackMoves/>
  <w:TrackFormatting/>
  <w:PunctuationKerning/>
  <w:ValidateAgainstSchemas/>
  <w:SaveIfXMLInvalid>false</w:SaveIfXMLInvalid>
  <w:IgnoreMixedContent>false</w:IgnoreMixedContent>
  <w:AlwaysShowPlaceholderText>false</w:AlwaysShowPlaceholderText>
  <w:DoNotPromoteQF/>
  <w:LidThemeOther>EN-IN</w:LidThemeOther>
  <w:LidThemeAsian>X-NONE</w:LidThemeAsian>
  <w:LidThemeComplexScript>X-NONE</w:LidThemeComplexScript>
  <w:Compatibility>
   <w:BreakWrappedTables/>
   <w:SnapToGridInCell/>
   <w:WrapTextWithPunct/>
   <w:UseAsianBreakRules/>
   <w:DontGrowAutofit/>
   <w:SplitPgBreakAndParaMark/>
   <w:EnableOpenTypeKerning/>
   <w:DontFlipMirrorIndents/>
   <w:OverrideTableStyleHps/>
  </w:Compatibility>
  <w:BrowserLevel>MicrosoftInternetExplorer4</w:BrowserLevel>
  <m:mathPr>
   <m:mathFont m:val="Cambria Math"/>
   <m:brkBin m:val="before"/>
   <m:brkBinSub m:val="&#45;-"/>
   <m:smallFrac m:val="off"/>
   <m:dispDef/>
   <m:lMargin m:val="0"/>
   <m:rMargin m:val="0"/>
   <m:defJc m:val="centerGroup"/>
   <m:wrapIndent m:val="1440"/>
   <m:intLim m:val="subSup"/>
   <m:naryLim m:val="undOvr"/>
  </m:mathPr></w:WordDocument>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <w:LatentStyles DefLockedState="false" DefUnhideWhenUsed="false"
  DefSemiHidden="false" DefQFormat="false" DefPriority="99"
  LatentStyleCount="376">
  <w:LsdException Locked="false" Priority="0" QFormat="true" Name="Normal"/>
  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 1"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 2"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 3"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 4"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 5"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 6"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 7"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 8"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 9"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 7"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 8"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 9"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 1"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 2"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 3"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 4"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 5"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 6"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 7"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 8"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 9"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Normal Indent"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="footnote text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="annotation text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="header"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="footer"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index heading"/>
  <w:LsdException Locked="false" Priority="35" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="caption"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="table of figures"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="envelope address"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="envelope return"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="footnote reference"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="annotation reference"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="line number"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="page number"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="endnote reference"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="endnote text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="table of authorities"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="macro"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="toa heading"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 5"/>
  <w:LsdException Locked="false" Priority="10" QFormat="true" Name="Title"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Closing"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Signature"/>
  <w:LsdException Locked="false" Priority="1" SemiHidden="true"
   UnhideWhenUsed="true" Name="Default Paragraph Font"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text Indent"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Message Header"/>
  <w:LsdException Locked="false" Priority="11" QFormat="true" Name="Subtitle"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Salutation"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Date"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text First Indent"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text First Indent 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Note Heading"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text Indent 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text Indent 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Block Text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Hyperlink"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="FollowedHyperlink"/>
  <w:LsdException Locked="false" Priority="22" QFormat="true" Name="Strong"/>
  <w:LsdException Locked="false" Priority="20" QFormat="true" Name="Emphasis"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Document Map"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Plain Text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="E-mail Signature"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Top of Form"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Bottom of Form"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Normal (Web)"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Acronym"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Address"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Cite"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Code"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Definition"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Keyboard"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Preformatted"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Sample"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Typewriter"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Variable"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Normal Table"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="annotation subject"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="No List"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Outline List 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Outline List 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Outline List 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Simple 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Simple 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Simple 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Colorful 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Colorful 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Colorful 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 7"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 8"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 7"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 8"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table 3D effects 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table 3D effects 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table 3D effects 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Contemporary"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Elegant"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Professional"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Subtle 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Subtle 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Web 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Web 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Web 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Balloon Text"/>
  <w:LsdException Locked="false" Priority="39" Name="Table Grid"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Theme"/>
  <w:LsdException Locked="false" SemiHidden="true" Name="Placeholder Text"/>
  <w:LsdException Locked="false" Priority="1" QFormat="true" Name="No Spacing"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 1"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 1"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 1"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 1"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 1"/>
  <w:LsdException Locked="false" SemiHidden="true" Name="Revision"/>
  <w:LsdException Locked="false" Priority="34" QFormat="true"
   Name="List Paragraph"/>
  <w:LsdException Locked="false" Priority="29" QFormat="true" Name="Quote"/>
  <w:LsdException Locked="false" Priority="30" QFormat="true"
   Name="Intense Quote"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 1"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 1"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 1"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 1"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 1"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 1"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 2"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 2"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 2"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 2"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 2"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 2"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 2"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 2"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 2"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 2"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 2"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 3"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 3"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 3"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 3"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 3"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 3"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 3"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 3"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 3"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 3"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 3"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 4"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 4"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 4"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 4"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 4"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 4"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 4"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 4"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 4"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 4"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 4"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 5"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 5"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 5"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 5"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 5"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 5"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 5"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 5"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 5"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 5"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 5"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 6"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 6"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 6"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 6"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 6"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 6"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 6"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 6"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 6"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 6"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 6"/>
  <w:LsdException Locked="false" Priority="19" QFormat="true"
   Name="Subtle Emphasis"/>
  <w:LsdException Locked="false" Priority="21" QFormat="true"
   Name="Intense Emphasis"/>
  <w:LsdException Locked="false" Priority="31" QFormat="true"
   Name="Subtle Reference"/>
  <w:LsdException Locked="false" Priority="32" QFormat="true"
   Name="Intense Reference"/>
  <w:LsdException Locked="false" Priority="33" QFormat="true" Name="Book Title"/>
  <w:LsdException Locked="false" Priority="37" SemiHidden="true"
   UnhideWhenUsed="true" Name="Bibliography"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="TOC Heading"/>
  <w:LsdException Locked="false" Priority="41" Name="Plain Table 1"/>
  <w:LsdException Locked="false" Priority="42" Name="Plain Table 2"/>
  <w:LsdException Locked="false" Priority="43" Name="Plain Table 3"/>
  <w:LsdException Locked="false" Priority="44" Name="Plain Table 4"/>
  <w:LsdException Locked="false" Priority="45" Name="Plain Table 5"/>
  <w:LsdException Locked="false" Priority="40" Name="Grid Table Light"/>
  <w:LsdException Locked="false" Priority="46" Name="Grid Table 1 Light"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark"/>
  <w:LsdException Locked="false" Priority="51" Name="Grid Table 6 Colorful"/>
  <w:LsdException Locked="false" Priority="52" Name="Grid Table 7 Colorful"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 1"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 1"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 1"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 1"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 2"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 2"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 2"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 2"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 3"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 3"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 3"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 3"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 4"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 4"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 4"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 4"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 5"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 5"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 5"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 5"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 6"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 6"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 6"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 6"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 6"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 6"/>
  <w:LsdException Locked="false" Priority="46" Name="List Table 1 Light"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark"/>
  <w:LsdException Locked="false" Priority="51" Name="List Table 6 Colorful"/>
  <w:LsdException Locked="false" Priority="52" Name="List Table 7 Colorful"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 1"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 1"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 1"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 1"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 2"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 2"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 2"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 2"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 3"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 3"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 3"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 3"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 4"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 4"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 4"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 4"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 5"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 5"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 5"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 5"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 6"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 6"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 6"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 6"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 6"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Mention"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Smart Hyperlink"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Hashtag"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Unresolved Mention"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Smart Link"/>
 </w:LatentStyles>
</xml><![endif]--><!--[if gte mso 10]>
<style>
 /* Style Definitions */
 table.MsoNormalTable
	{mso-style-name:"Table Normal";
	mso-tstyle-rowband-size:0;
	mso-tstyle-colband-size:0;
	mso-style-noshow:yes;
	mso-style-priority:99;
	mso-style-parent:"";
	mso-padding-alt:0cm 5.4pt 0cm 5.4pt;
	mso-para-margin:0cm;
	mso-pagination:widow-orphan;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-ascii-font-family:Calibri;
	mso-ascii-theme-font:minor-latin;
	mso-hansi-font-family:Calibri;
	mso-hansi-theme-font:minor-latin;
	mso-bidi-font-family:"Times New Roman";
	mso-bidi-theme-font:minor-bidi;
	mso-fareast-language:EN-US;}
</style>
<![endif]--></p>
    <p class="MsoNormal">I tried with module unbind and unload with this
      mei modules
      was not removed, I will add mei_gsc_proxy removal for discrete
      platforms with MODULE_SOFTDEP</p>
    <p class="MsoNormal">root@DUT6099BMGFRD:/home/gta#</p>
    <p class="MsoNormal">root@DUT6099BMGFRD:/home/gta# lsmod | grep mei</p>
    <p class="MsoNormal">mei_gsc_proxy<span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      </span>16384<span style="mso-spacerun:yes">&nbsp; </span>0</p>
    <p class="MsoNormal">mei_gsc<span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      </span>12288<span style="mso-spacerun:yes">&nbsp; </span>1</p>
    <p class="MsoNormal">mei_pxp<span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      </span>16384<span style="mso-spacerun:yes">&nbsp; </span>0</p>
    <p class="MsoNormal">mei_hdcp<span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      </span>28672<span style="mso-spacerun:yes">&nbsp; </span>0</p>
    <p class="MsoNormal">mei_me<span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      </span>49152<span style="mso-spacerun:yes">&nbsp; </span>3 mei_gsc</p>
    <p class="MsoNormal">mei<span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      </span>167936<span style="mso-spacerun:yes">&nbsp; </span>8
      mei_gsc_proxy,mei_gsc,mei_hdcp,mei_pxp,mei_me</p>
    <p class="MsoNormal">root@DUT6099BMGFRD:/home/gta# echo -n auto &gt;
      /sys/bus/pci/devices/0000\:03\:00.0/power/control</p>
    <p class="MsoNormal">root@DUT6099BMGFRD:/home/gta# echo -n
      &quot;0000:03:00.0&quot; &gt; /sys/bus/pci/drivers/xe/unbind</p>
    <p class="MsoNormal">root@DUT6099BMGFRD:/home/gta# lsmod | grep mei</p>
    <p class="MsoNormal">mei_gsc_proxy<span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      </span>16384<span style="mso-spacerun:yes">&nbsp; </span>0</p>
    <p class="MsoNormal">mei_gsc<span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      </span>12288<span style="mso-spacerun:yes">&nbsp; </span>0</p>
    <p class="MsoNormal">mei_pxp<span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      </span>16384<span style="mso-spacerun:yes">&nbsp; </span>0</p>
    <p class="MsoNormal">mei_hdcp<span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      </span>28672<span style="mso-spacerun:yes">&nbsp; </span>0</p>
    <p class="MsoNormal">mei_me<span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      </span>49152<span style="mso-spacerun:yes">&nbsp; </span>3 mei_gsc</p>
    <p class="MsoNormal">mei<span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      </span>167936<span style="mso-spacerun:yes">&nbsp; </span>7
      mei_gsc_proxy,mei_gsc,mei_hdcp,mei_pxp,mei_me</p>
    <p class="MsoNormal">root@DUT6099BMGFRD:/home/gta#</p>
    <p class="MsoNormal">root@DUT6099BMGFRD:/home/gta# modprobe -r xe</p>
    <p class="MsoNormal">root@DUT6099BMGFRD:/home/gta#</p>
    <p class="MsoNormal">root@DUT6099BMGFRD:/home/gta#</p>
    <p class="MsoNormal">root@DUT6099BMGFRD:/home/gta# lsmod | grep mei</p>
    <p class="MsoNormal">mei_gsc_proxy<span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      </span>16384<span style="mso-spacerun:yes">&nbsp; </span>0</p>
    <p class="MsoNormal">mei_gsc<span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      </span>12288<span style="mso-spacerun:yes">&nbsp; </span>0</p>
    <p class="MsoNormal">mei_pxp<span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      </span>16384<span style="mso-spacerun:yes">&nbsp; </span>0</p>
    <p class="MsoNormal">mei_hdcp<span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      </span>28672<span style="mso-spacerun:yes">&nbsp; </span>0</p>
    <p class="MsoNormal">mei_me<span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      </span>49152<span style="mso-spacerun:yes">&nbsp; </span>3 mei_gsc</p>
    <p class="MsoNormal">mei<span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      </span>167936<span style="mso-spacerun:yes">&nbsp; </span>7
      mei_gsc_proxy,mei_gsc,mei_hdcp,mei_pxp,mei_me</p>
    <p class="MsoNormal">root@DUT6099BMGFRD:/home/gta#</p>
    <p class="MsoNormal"><br>
    </p>
    <p class="MsoNormal">Regards,</p>
    <p class="MsoNormal">Krishna.<br>
    </p>
    <blockquote type="cite" cite="mid:nko5zjbdfw272zgf2di4yzeptujglamsxkryjvicdperonsnqw@ggnhjda4trwj">
      <blockquote type="cite">
        <blockquote type="cite">
          <br>
          <blockquote type="cite">+&nbsp;&nbsp;&nbsp; };
            <br>
            +
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp;if (opts)
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_info(&quot;Reloading %s with %s\n\n&quot;, driver, opts);
            <br>
            <br>
            +&nbsp;&nbsp;&nbsp; for (const char **m = mei; *m; m++) {
            <br>
            +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (igt_kmod_is_loaded(*m))
            <br>
            +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continue;
            <br>
            +
            <br>
            +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret = igt_kmod_load(*m, NULL);
            <br>
            +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret) {
            <br>
            +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_debug(&quot;Could not load %s\n&quot;, *m);
            <br>
            +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;
            <br>
            +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
            <br>
            +&nbsp;&nbsp;&nbsp; }
            <br>
            +
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp;ret = igt_kmod_load(driver, opts);
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp;if (ret) {
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_debug(&quot;Could not load %s\n&quot;, driver);
            <br>
            @@ -620,9 +640,14 @@ int __igt_intel_driver_unload(char
            **who, const char *driver)
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp;const char *aux[] = {
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* gen5: ips uses symbol_get() so only a soft module
            dependency */
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;intel_ips&quot;,
            <br>
            +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NULL,
            <br>
            +&nbsp;&nbsp;&nbsp; };
            <br>
            +
            <br>
            +&nbsp;&nbsp;&nbsp; const char *mei[] = {
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* mei_gsc uses an i915 aux dev and the other mei
            mods depend on it */
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;mei_pxp&quot;,
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;mei_hdcp&quot;,
            <br>
            +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;mei_gsc_proxy&quot;,
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;mei_gsc&quot;,
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NULL,
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp;};
            <br>
            @@ -647,6 +672,19 @@ int __igt_intel_driver_unload(char
            **who, const char *driver)
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp;}
            <br>
            <br>
            +&nbsp;&nbsp;&nbsp; for (const char **m = mei; *m; m++) {
            <br>
            +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!igt_kmod_is_loaded(*m))
            <br>
            +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continue;
            <br>
            +
            <br>
            +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret = igt_kmod_unload(*m);
            <br>
            +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret) {
            <br>
            +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (who)
            <br>
            +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *who = strdup_realloc(*who, *m);
            <br>
            +
            <br>
            +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;
            <br>
            +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
            <br>
            +&nbsp;&nbsp;&nbsp; }
            <br>
            +
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp;if (igt_kmod_is_loaded(driver)) {
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret = igt_kmod_unload(driver);
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret) {
            <br>
            --&nbsp;<br>
            2.25.1
            <br>
            <br>
          </blockquote>
        </blockquote>
        <br>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------0rGvBusQ5aX8nQVWqiv0Fexf--
