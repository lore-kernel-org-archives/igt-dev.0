Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7B8DCAC599
	for <igt-dev@archiver.kernel.org>; Tue, 16 Sep 2025 10:19:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85CF310E095;
	Tue, 16 Sep 2025 10:19:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZATXtBm7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DBBB10E095
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Sep 2025 10:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758017991; x=1789553991;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Zgc4sYYXZ5A6o6j2B6VqxirAafVmOK0rWDxXx/8vTTc=;
 b=ZATXtBm73EdyzkFX3JmzbGtvFgknzJvgJG3O6yLYw5D2MMYovFr5uwaU
 lT5/pbEI+Nmyvq8KuFSZQ343GB/aJXzqMuQMaMR3Gypa3ucxIlEOC7mFv
 Er4YS259fB6Ux0IHTwmsjaWJY2p0s2B81cI+LPxz4oFaek9umyT7+5kld
 kKQnKCHjN6KZAaDAPDbZTTjnARFUCgR7GGlplEQt59VEHvT/NIhSt2mIC
 pv6fUV+DGhvIA2U3+LNb4fRO66CRffFv0ts0uXcUYLG9IKccRgtRNmlBa
 1h2JgMrcFA0zzUOc6850fehfP2kaTbjnkLqOQz9w/SP61VoeFHu2drzco A==;
X-CSE-ConnectionGUID: iorWLmV4THejZU1Vr2bKTw==
X-CSE-MsgGUID: db/qDgSrRDWZBB8jSwat0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60240008"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="60240008"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 03:19:50 -0700
X-CSE-ConnectionGUID: hEtPRJYERjqo1mPh8gxF4g==
X-CSE-MsgGUID: Zuo6X/giRGuhSfPAvRWtog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,268,1751266800"; d="scan'208";a="175685762"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 03:19:49 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 16 Sep 2025 03:19:49 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 16 Sep 2025 03:19:49 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.60) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 16 Sep 2025 03:19:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fzFQOAM/utvvNLw0CLxDAMCpsereXoUHGY5WN5bLmpZ0F9qAiAivN9iT0nQkz00J6WdhkgXRimC88JSG5wJaHLTKdRRthm8bJDz6siXmKz9uuM2PWY3BRzYQnnYx0wS1+XQbagWimUNYxe7xOJZBKR2qHXJ0DWiIVV4P187FSQmpowwidRJoQUBlSpwCQdz72oSxRl98XYJmA8RbHizdTjXW055igZM3AKRRzef3cEJP5GsDq7oF3sAbZDfm0lXqXoGUyW98f66sNzrnErA+LpStEuF8jM2FWl1DH8Oi+m82NoumPy3O/2Y4i0zKelTUkXCjYFDX9FgNi/7D2tizMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0EzLGq4DfV3scph8Noxb4BcFNd5XiWzJN8XDWl2GYKU=;
 b=SKC5wSVg21+koQNuJtM6C1UgO6U+3FRYFytZDiM9L7AKcHmLjy/S4mSz0Hw5vRsek/VsMMz3BF9VGyVhJFH5/zx2a3INU4CgV6aYedPmAKWo6oyopZ+xHLa/PkmiSWjk7GGo3lDyLROjasljTf7R45sO9Twe4X6yFwOY8bj5bjy2SdHxKB2qQJYDv2QY6MF7LadLO6eT+rabiMjNMe2y7gHRQwN2SGDilyvEYhxbvPbR3FNVwsntpVq7J1177Sn23bWwepRTMel7N8Nt6V70cgS2ZeuSGHrFMUF79DNqw2ffBmAnK2/JgkiXFn+OI8xMp/xr2SofbPoClNoVEnPDhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8019.namprd11.prod.outlook.com (2603:10b6:8:12e::18)
 by DS0PR11MB6448.namprd11.prod.outlook.com (2603:10b6:8:c3::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.19; Tue, 16 Sep
 2025 10:19:47 +0000
Received: from DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::d2ab:ff8b:3430:b695]) by DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::d2ab:ff8b:3430:b695%4]) with mapi id 15.20.9094.021; Tue, 16 Sep 2025
 10:19:47 +0000
Date: Tue, 16 Sep 2025 12:19:34 +0200
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Chris Wilson
 <chris.p.wilson@linux.intel.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>, Janusz Krzysztofik
 <janusz.krzysztofik@linux.intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/gem_exec_schedule: Improve
 synchronization in pi-ringfull
Message-ID: <byse6jrqaw4t73cfqabssa6sbuow46vel22hf4l4ixjzlix7df@s5xkxco4othd>
References: <20250915155427.417074-2-krzysztof.niemiec@intel.com>
 <meqnvgkskt6mq3dshte2u6nlmlahdxqkhgnosprvsew3d7suv6@aiqecfel7qoj>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <meqnvgkskt6mq3dshte2u6nlmlahdxqkhgnosprvsew3d7suv6@aiqecfel7qoj>
X-ClientProxiedBy: DUZP191CA0067.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:4fa::26) To DS0PR11MB8019.namprd11.prod.outlook.com
 (2603:10b6:8:12e::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8019:EE_|DS0PR11MB6448:EE_
X-MS-Office365-Filtering-Correlation-Id: 8630f48e-f524-4141-0e00-08ddf50a8fda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ejVETU83U0tzTnk5dHQ4MXFzbFNSWEFNV2MrRUx3MjFJMTBpeDJzQlg1YTVY?=
 =?utf-8?B?SmwvUVNDZVFJRURLS2RleEx6QThjM3Rpc2Q1cy9NRWZRS0pUd1J2TVNHK21s?=
 =?utf-8?B?VGE3bXg0ZlJ6WnpEMCtIL0lFaEVwQVZuRGVFZnViQjJLdEpPU3djeUxpMDlN?=
 =?utf-8?B?TjczRW9OMUlXS3dqMloyVzRYdzhyT3VQdCtQT1VMVUFGckhaSCtQUnZKMnM2?=
 =?utf-8?B?VkF0WlV0QmxRYWJkSkx3VUZpWWRXaVNxZnBJNE5zemprOElFWkVKMG1Jbkg3?=
 =?utf-8?B?bjM3NWZJRVdNWkhvVXpDTXg4RWl6R1RUWTVFU1A3aDdla1U3L3dJei81RVVT?=
 =?utf-8?B?NlQ4SmRPLytUd1UwRC82RFhMRzAxaElGeUcwUEswUGhVd2gxUjBIdi9aWm01?=
 =?utf-8?B?NHRRazNyc2NNQVhPa3RoQmdUTWxEeGp3UnV5cTNzamtYWXdZZXpEWUFHKzJo?=
 =?utf-8?B?SlZiaTBOZXBaWStUZ2hIWUtVMWcwNnlwZlBERnBMem5qcWRmMnFBVGNMNmNu?=
 =?utf-8?B?bTZaRXlXUnlmdU9LdEZIdGZLMlRQdGEybERpcXRDeTdkT3QvR0xEcS9RU0pI?=
 =?utf-8?B?R00wc3dPeCsxeXZCR1FscG1BZldjUy9VQmdmRjdFV0ZkMk5pRmRNTCtKVXdp?=
 =?utf-8?B?VmNiSDhrZUlkMkR1M29XNExxWksyV2M1VGlvR0tCM09BNmQ0SldvYmgzcXdi?=
 =?utf-8?B?c3Jnc0lHT3lrTFYxaXgrc2VSNm9kMEJvZXlCRzd1eVowNXV3Q04xWStueWhQ?=
 =?utf-8?B?M1JMbVQrcnIzZHdOM2p6VWhQRU9TaDRWZWpDcTVNVkFwZ1JXejV5emZmQnFV?=
 =?utf-8?B?d29PTGk3aTFnWUJZVit0NWxRRGloYWs1L2tIRXpwNCtiZ2hjak03R3lxQk92?=
 =?utf-8?B?NXRLZVdpSEtsYlRyRjJqZDZyVXNJTGowWmhxMmtDTEVxUjJZb3RoTWJqeWVw?=
 =?utf-8?B?RGZ3SEJvV1huNlBXejlyRlFlMGhaU0NkNWVjTUw2OStrbmdVS2t3UElmdjZD?=
 =?utf-8?B?UThOQWt4aHk5RTM4UXhJRlBpa2VjdEF6cCtKSmIvL3FnR3o0TkoyeStGTEli?=
 =?utf-8?B?NU1Gc2tGSE1ZRzZnWFpGTzVEYy9jT2ZKMlFWQndCRWEwTVRVMUxmcFl0anZW?=
 =?utf-8?B?cm52WTRBcm0vYkFFYkZZNW1qcDVKSmFqZDZ0eW84YTB4Z0xWejVmN2g5Z0pl?=
 =?utf-8?B?b2FCcjZZYWVMNjFGNVZFSFVFRXpTa2lzcldrWkptSzJhbE1EZ0FXcGlSSzdE?=
 =?utf-8?B?ZWRiZnA2dVFMb1M4ejF4UGJPd1VURFJIakJXUm1xbnFOd2U2WUs4a1lhd29x?=
 =?utf-8?B?aXo0cklMekdWQS9QUlRIYWNoQmFOQThTNDlQTk91QS9CdGxIOHlBOWtZMUU1?=
 =?utf-8?B?dHJCaWpLbGVvc2hMalpCZEVlYzNRR2k4eEZja1Vjekk0dC9menZpTXAybmJK?=
 =?utf-8?B?R1JFZnczcWpQTVQ3QitKbzFuNVdYK0xtT3BuV0x0eGVyOHNNSXd5a3FBSXli?=
 =?utf-8?B?VFAvT1M2dTF4aVNVOWp3cnd1RDdlS1oyZ1o3d2ZzM2hEMFZURVBNMEkvV3Z6?=
 =?utf-8?B?c3RwT3hhbkxlRk9FQlpjS3pKVTcrMFFQUnJvTStnY3VoTzRhZURVQnBGbnlN?=
 =?utf-8?B?ZEpsbThaVXk0Q0hCTEl3V0JwQk5waWp6QUhHbXptU1ByUHVGRGJLV084Y0hx?=
 =?utf-8?B?V1hDWGRyUnVHaitnUjc0WkRlaVNjckU2MEw5MGlpbklCNWdPN3BkckV4UWE0?=
 =?utf-8?B?cEYyT2UvaUFhclk5R2k5MVkwL1RUblFrb1FzZlFUVzRMVkxDWDlheEdjT3VW?=
 =?utf-8?B?K1RhbjAvZkU1WnNDbHNqRnlVRXdPR0VnM0xVTklPQll2L0JXMHQvVlNFdFI2?=
 =?utf-8?B?NzhLWEtZek9FdVNheG5wbUkxZGxIWHE1R2t4S0RpYVNrNjNqYjZESk0zMytY?=
 =?utf-8?Q?0cjfagxWUkk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eFRqZndRS1ZQWHNoajdOYlhIWjFzdmEyelBKUU12TlN3WThBcjE4SnREdHFl?=
 =?utf-8?B?aHRSbUZ2ZmZFSFpoMWhBN2M0SElFVlo2NTZMS3JoUVVUNlArVnN5bXhoVlBE?=
 =?utf-8?B?OGJJN0hCVk4rWER4ME4wcGZUeTljWmkvSC9adjQrVnZtOXhhYkkyczlrWkVJ?=
 =?utf-8?B?OWU0Y3JzUWxzOW00b3Vub2l1WWlqVHl6TGJ2SnIyeG5INXhmSG0vMmF3TURZ?=
 =?utf-8?B?Qmd4TGloWExpVFB4b0FMVUZ1Zi92U3VTV3dnMU5DVlFvMHZpeVRWa3BPdlVT?=
 =?utf-8?B?Z0hPbEZFclM5V2huV2owZG80UEsrZXZncnk2VzBtM3dFT2RRQk5JNDU5NExj?=
 =?utf-8?B?N1prcVlCelVkYUE4d3BDOGd0d2tUQWxTK3EvWnpEMEJ5N2IwNk4wOGRad1Yy?=
 =?utf-8?B?eDUxQVlYZ3VWUG1UNGk3QXhVK2o4SFlZeG5kZzRmMTRqWFA2UnNZSkFmemI2?=
 =?utf-8?B?dlluQjFKdk9GRmZ3NWtYU2VOZTZoTzJUb1FTTjlGTlo2RnFFM2tGQ0ZlQ283?=
 =?utf-8?B?S0M3bVBUV1NKUVBWVlZhbTBuSk5tUFZQdHp2S21VcytscndsbUpIREhwRlVY?=
 =?utf-8?B?SnNvSVlmanZ4QU5DTGp4aEF5L2lITXA4dlhEUXk2dUFDM2tpbndBS1JTYUNl?=
 =?utf-8?B?R3dxNTJmdWtZU01Rei8ra0lkWlRFc3hsV2ZjMm1KK1FTTERHdW5OaTh6eDlM?=
 =?utf-8?B?TWkvTEQ3d0RUdHgvYVZ5Tm1BbnNhRFloNW5keS8vaFRFV1JHM3VBWFg1ZStM?=
 =?utf-8?B?NDljaDNkRFJhUGJYeUZ3OTkzQXJsK2RjQWtTS0lSSGlIZmdpYWh4aWd0M3Q5?=
 =?utf-8?B?WDdlcm1HWjhqaVl1Wmp6TTJKOVN6SVlZZ1dpY3g3N2hoR1NhNkl2TlBnb1Ew?=
 =?utf-8?B?NmRkTzA4ZTA2eU9QdUYvcU4xb2w5WkNtejJsSDVYRWNGNWNHbFVTS0RyTzhp?=
 =?utf-8?B?aWdjSnlOQ25PR2lEamJKemZHUWQwbDNOTlo0STRFYUc3UlJFWm5lWGhEVmM2?=
 =?utf-8?B?eUxuWitCTHU2WEsyTzBCaUhFYXRBNUFrY1pjeUZEK1hob1RTcktMbVZaNmpl?=
 =?utf-8?B?a2lNNTBWWDFwakU5dXFUWHpML2tGY2dabkhoTE0xMnR1RWcwcjAxNlB5dUtF?=
 =?utf-8?B?blVNazhnWWFRbWpSZ1V4Sk0wV0JmSjhRekpRTEF1cDVscUNBZHNJbW1mbkJq?=
 =?utf-8?B?cC9EbWdCbU1icTBQTWxrNkNOT2VSR2U1WEpCMTVScnNIZmJKWGRWUkQ4TUV5?=
 =?utf-8?B?NGpma2xEQUorYmlpMjZaWVlaVjdDck80Mml3UC91Z0lQQWZ3RnBQam1PMlpv?=
 =?utf-8?B?MkE1cG05WmVJTHo5amJpS0VTV1FlMjdxOHZqU0F1TThPcXNIR1RlNW1EM3FZ?=
 =?utf-8?B?c1JSWEFMMFpwYzJTUk8zcGZuN1A4YXM3VUxRenQzckg4eVd2L0NFMGlFcmFz?=
 =?utf-8?B?RTlSVjVjSGNzZXBBWFhja3FFNXdLaElnNzA2eklnVC9XOGkvQnVqZDd0Vkdo?=
 =?utf-8?B?VmpPaWI4YXdhV2tsMkJueFc3cHBsRWRCS3NiMmsycFMvb1ZsZTBwR3B1TEdN?=
 =?utf-8?B?L0lXV21WNTdrR2lqZVZUSWNJeDZESFVUK0JheXduTXk4S2orTVY4em5rYUFl?=
 =?utf-8?B?RDF5TUx4WGhNWXZ0RW5xN2ttVXlUME9WbDFKR3JTWWlNWTd2M3Qvb1lESE5O?=
 =?utf-8?B?clB3NytkeE13ZGljb3c2YkhFdVAxQlBtMXF1TVd6dTdKMEZ1ZDZhOVJmRUxi?=
 =?utf-8?B?aFhkVjJiVUNHckR0eEh5L2JuTWs1NjE1a3YzVmtSbU1aeis4RHdka21ZVDlX?=
 =?utf-8?B?NldWNXZaU3RUZVk4YnBlZC8vMUpWNlNUMGxXaDhNMzdJdjNXdjF2N3doOVRV?=
 =?utf-8?B?RXBBMDltVFcyS0hsWTR1bXBXcEMyUDcrZ1VyTGF6RWdKVnBFQlZ1bUtPRDRq?=
 =?utf-8?B?Ym1BVEtwcDZRNHdCbFkyL25Kam1UbHI3NFlOZUExa2dmTVZKZnRNUzB5WmlW?=
 =?utf-8?B?U1FTTFNvb3NRL0JiNHlJNjFGSzY2b29tN0o4dEFUTy9ubTdPeWE0Nmh0RUF5?=
 =?utf-8?B?c3lhQ0s4eDd2cW5jL3F0NkE4U1ZLdFVFQlo0a0p2cHRCM0hXTkhqQU5YU2l0?=
 =?utf-8?B?NnpUS2NucUIwSFh5akZybHN3T2s0TGw5cFB2TjE3OHQ0Z3JZTHFXdHZmdHgz?=
 =?utf-8?B?OWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8630f48e-f524-4141-0e00-08ddf50a8fda
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 10:19:46.9797 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KxnlyCE377FEHqrHRJnJn9z+57QfZttrmdutk3IP+0e321OH0x/2AeBSSgp5B0Fp4+Z0aGvIy5AYS5Y9mpy0vdY1FYrUfTPSErAg6dMmjn0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6448
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

On 2025-09-16 at 06:48:14 GMT, Zbigniew Kempczyński wrote:
> On Mon, Sep 15, 2025 at 05:54:28PM +0200, Krzysztof Niemiec wrote:
> > Move the interrupt timer from the parent thread to the child thread as
> > an explicit signal raise, and make sure the order of execution between
> > them is always the same. This reduces nondeterminism in the test, fixing
> > bugs like [1], where the child is starved out of CPU time up until the
> > parent gets signalled and monopolizes the CPU before the child could
> > submit its own execbuf, failing the test.
> > 
> > [1] https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14898
> > 
> > Signed-off-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
> > ---
> >  tests/intel/gem_exec_schedule.c | 17 ++++++++++++-----
> >  1 file changed, 12 insertions(+), 5 deletions(-)
> > 
> > diff --git a/tests/intel/gem_exec_schedule.c b/tests/intel/gem_exec_schedule.c
> > index 84219b4cf..d387725d2 100644
> > --- a/tests/intel/gem_exec_schedule.c
> > +++ b/tests/intel/gem_exec_schedule.c
> > @@ -2446,6 +2446,7 @@ static void test_pi_ringfull(int fd, const intel_ctx_cfg_t *cfg,
> >  	unsigned int last, count;
> >  	struct itimerval itv;
> >  	IGT_CORK_HANDLE(c);
> > +	char volatile sync;
> >  	bool *result;
> >  
> >  	/*
> > @@ -2528,10 +2529,15 @@ static void test_pi_ringfull(int fd, const intel_ctx_cfg_t *cfg,
> >  
> >  	/* both parent + child on the same cpu, only parent is RT */
> >  	bind_to_cpu(0);
> > +	sync = 0;
> >  
> >  	igt_fork(child, 1) {
> >  		int err;
> >  
> > +		/* We want the parent to always go first */
> > +		if (!sync)
> > +			sched_yield();
> > +
> >  		/* Replace our batch to avoid conflicts over shared resources? */
> >  		if (!(flags & SHARED)) {
> >  			obj[1].handle = gem_create(fd, 4096);
> > @@ -2542,7 +2548,6 @@ static void test_pi_ringfull(int fd, const intel_ctx_cfg_t *cfg,
> >  
> >  		igt_debug("Waking parent\n");
> >  		kill(getppid(), SIGALRM);
> > -		sched_yield();
> >  		result[1] = true;
> >  
> >  		sigaction(SIGALRM, &sa, NULL);
> > @@ -2566,17 +2571,19 @@ static void test_pi_ringfull(int fd, const intel_ctx_cfg_t *cfg,
> >  
> >  		if (!(flags & SHARED))
> >  			gem_close(fd, obj[1].handle);
> > +
> > +		/* Interrupt parent's execbuf now that the child is done */
> > +		kill(getppid(), SIGALRM);
> >  	}
> >  
> > +	sync = 1;
> 
> Why this assignment would be ever visible in child process?
> 
> I guess you want to use mmaped mem visible to both?

Of course, error on my part. I'll send in v2

Thanks
Krzysztof

> 
> --
> Zbigniew
> 
> > +
> >  	/* Relinquish CPU just to allow child to create a context */
> > -	sleep(1);
> > +	pause();
> >  	igt_assert_f(result[0], "HP context (child) not created\n");
> >  	igt_assert_f(!result[1], "Child released too early!\n");
> >  
> >  	/* Parent sleeps waiting for ringspace, releasing child */
> > -	itv.it_value.tv_sec = 0;
> > -	itv.it_value.tv_usec = 50000;
> > -	setitimer(ITIMER_REAL, &itv, NULL);
> >  	igt_debug("LP parent executing\n");
> >  	igt_assert_eq(__execbuf(fd, &execbuf), -EINTR);
> >  	igt_assert_f(result[1], "Child was not released!\n");
> > -- 
> > 2.45.2
> > 
