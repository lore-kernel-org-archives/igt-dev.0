Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7C26FF495E
	for <igt-dev@archiver.kernel.org>; Mon, 30 Mar 2026 14:21:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68DF610E77A;
	Mon, 30 Mar 2026 14:21:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q1JqZpFK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A99910E747
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Mar 2026 14:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774880456; x=1806416456;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:content-transfer-encoding:mime-version;
 bh=3jZo4sCyxQzo9n4XLvEwH7LPydrUWkVSrFAgQoGkYxE=;
 b=Q1JqZpFKXdu2IRypQxxBcOdRx75tZNZFT8dbj4ffyidnzqDNe53vy9SH
 cN6qJTLtH20KrGuxFXvfsJLTHzAsu2Uf98arsn5JlKdd8L2X2P12WcOFB
 zK7mpSJr8LYSyqm9u/m/I4FTFTDTug6xr8tTiVOtaNOkxPdXM9GDCdAZN
 DKeaFcg58xg86wEsZjZk1hHdU8rFvQu+u1MJVeRE9QZ9ksQW+S2W35FJ4
 zJTyezgfP9V56+fLD2Ye+8Mi+GqryXb1uCl0sP+h80sw7cK7E+PEGhHg2
 y/OKsJohwfXKNBNJf3vT4uomfWRUhA6U74O7/LIqYsgcDornt+oHUvCA7 A==;
X-CSE-ConnectionGUID: wNvl1pt2THyBibalkxa5aA==
X-CSE-MsgGUID: Gw54p89ORYCbUN5VXrESRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="101333789"
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; d="scan'208";a="101333789"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 07:20:55 -0700
X-CSE-ConnectionGUID: GVeav22YQ22t+azi1ED2Vg==
X-CSE-MsgGUID: tuDyzgHER8KT+8jQgrZ1ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; d="scan'208";a="230117935"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 07:20:55 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 30 Mar 2026 07:20:54 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 30 Mar 2026 07:20:54 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.38) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 30 Mar 2026 07:20:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FvaJspfYdysaLZ4XYAk/B/rEVKv85jpvXUzqadXiT31tVYJpacuaKcGQplorTHp9aMbwtbW3LG4dXFVj259SK01QN4BnnUYJq8h6oE4jTBFs3F9OPPWweDFIIgJAbXoK9Fp0bFl7VM3Otk1n3UL4FpiSfiT8GVOBos7Ls6FSvFj6Dz7msWNwWzZ37oZA8t1l+GiJK75to0bLu8DDgGrQP7tE/py/Rf0WhQZZj+jz7Ni1VPZj4jgXBiKesQiXqmk2q0hjH9yNzf6lzJKukC41XJCtV/BFdVsV0NDEbAkfhCsFcpM6u9Lce4pPAK7xREsU4Wncp49NE8B2gNOz2C44Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3tPSbAiBbmye3SVW0C2sAQk6ZwBudeQUmgKL8tdVFMM=;
 b=QO63xICViFX1yZ/gEtH+LCvesTFjbC36o+Lq/m3meyKX05FhBqV+x/WjuzkPN4g1AHaGJKsKLepTQyhmyTIwYBbCosTqfcAUftVFXsoVNUGg6Z7LMjfV4fyOXKIMkHn06qbSs0jXdsKWwPl+wqRZQZve4WA/mASl9dxANiXrdaaIHP6RSVyuzUrgEW20zmSTaRhjfvKj+HWrhJ/dQDhrP2SKBCH6MvSWggpR1ijkF2lRCBgW4XrlPjYmbqhkFHRlnlyL+kizSK+oaOdobh4kuIBPWmSBHFYsfsC+FOJakTwuZwGkhSqIeK4R+424fGutV40x5vQer1m6H3GRxd7S5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by DS4PPFC77662F02.namprd11.prod.outlook.com (2603:10b6:f:fc02::4c)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.8; Mon, 30 Mar
 2026 14:20:51 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%3]) with mapi id 15.20.9769.006; Mon, 30 Mar 2026
 14:20:51 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, Ryszard Knop
 <ryszard.knop@intel.com>, Krzysztof Karas <krzysztof.karas@intel.com>
Subject: Re: [PATCH i-g-t v2 2/6] runner: Create attachments directory to
 use by hooks
In-Reply-To: <20260324131235.712916-10-zbigniew.kempczynski@intel.com>
References: <20260324131235.712916-8-zbigniew.kempczynski@intel.com>
 <20260324131235.712916-10-zbigniew.kempczynski@intel.com>
Date: Mon, 30 Mar 2026 11:20:46 -0300
Message-ID: <87mrzpxutd.fsf@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BYAPR06CA0018.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::31) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|DS4PPFC77662F02:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d529a56-bd0c-48c3-cc66-08de8e678bc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: Jn0WhdOzURA1Nupq1F/BsKrU9D11NkbWI/3y8TbTK/4L99pyXFhVXR1m5esDsMT4OFqvTzy496AmSSOjncXoOl7EvQfoGk8ruIOKfoIr+PKucZ+V3qXzcDQ/pHsazLRBvV/fdWo+Gv5kRJNEc/5qEV3Cq+BaMj5dmPhlBKIhIyptpR5ctX2/FDOUGVRkL5Yj1A758eTXmGMg/jtTnmcQxgIPAWKg5J4wkclUuvu7MkN167uNJHPZ08uDahedsrfw2MAhTgWx8X6zG0PhArxD6zToBecA34BIbs4jO7I45G5FkFfh0nzifea5qPtJy7hH9l6lcVeHSAz7lyuWheDsgWiQf8ZDVj/yogv74zQXf/AETxUkVJhHkxC6H71BXp3KCTd5scQgm5tynARxDtD6sX3sipK7IryZZnRavQ4t+uLMnGF67kcgww9JqivS9m8hfah1D1VoRHwrSKKC5WlFI5r4cuq8QzWPFXghL77afmJaDOIGAGsaykdvGOsdknPnbOIc4sGi51VDY0QHcu/YVTuGggvcoBFtre/vogGCs1BMIbiGBBqadIvVz1Rv/AXd581uwaFo9qlkDA4tCwXaNyRsVwi4ety86fwXPSbP886mB+N01eUgGmMjYrPAeDuAULJ0fxLQ+m2xCIPZ7IfdeSSlNLfnBtlti7u7bv5621jSLbMgDp95T2JgrPTu6t+x2JQfX4mu+iudIJtuql7/MdzEY+KYdVqUcX8hga/iZ7w=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eTJUMDFDamZNQjVHR3hRU01DWTJtM0NVSjIwSHBoeVlPc2NYckR6UmRwNGdC?=
 =?utf-8?B?R0dXYWo2cjFncm14b1lXNHBHVENQM2JkYUpzOWRyUXpmQlRpbUdlelg5M2k0?=
 =?utf-8?B?TEl0WUN1UzRWOGYyY1FlZFM5Z1BJdFo4YTY1M0xTc3ViWGpnblhJZFc3RXNZ?=
 =?utf-8?B?VnVqUVZyNStSTGZOTHFiTDA3VURXczlGV0VnelhKd01JMzYyMWRSdll1RjFF?=
 =?utf-8?B?TWJNQlp3VGdWdUV4VXBJZVJLMGJCdVNMdnN0cnZaVlM5NGY4ZUc3ME5LWnB6?=
 =?utf-8?B?dXRyaE1xZENLVWE5MnVHUDBncXJtbnRFNDdGRjV4ZnJHZkZoNzJZTXAvUVU0?=
 =?utf-8?B?T1hQRWNPWm1vN09NUkhRaE9NTXNncG9wdW9WTENvUFp3RTR3Q1IrK0hHR1F4?=
 =?utf-8?B?UXdCSHMyTDdmQ3RtN1pYQUkwaUFCREZsUG5RZ01hTlUxRnFYY0JWOGg2L0Jj?=
 =?utf-8?B?bVkvdDREQnVBMUNzYkM0YyszRkVES3hJQ040cThRWGZ3ckk0d0MvbUNKTjdi?=
 =?utf-8?B?YVUxcGRIUmkyMnoyTWxHeXc2eVVCSzJqN1Fsak05ZjlkWW95R2xIWkNhY3ZD?=
 =?utf-8?B?ZThpQlJqd3pwbjZDQWpaRnA0VXd5TUxrYzgveng1SElCdGNqQzFGNFo2Y0Ix?=
 =?utf-8?B?ZkVMRFV4SGIxT1ZXVitJTHhZMjdDYVRld2tCdGJIeVJDVUdoUk1ITnJxL3Jk?=
 =?utf-8?B?T0tGM0Rrb0V5TjhoUGV0SzNIeUM4U1VPL3FPbnoyc2k5MjhRb1pJdFhoYWx2?=
 =?utf-8?B?ZGR1eEppVFl4YzlNWUNMNE9NK2svR0g3Z0lhOFhZUzRPZDV2R0p2aWVFRG9t?=
 =?utf-8?B?SldFYXk4bG9sS0V0MmlFV05qa2VDVjJHMmRFSmdBSVJYZkZmeFRCd3JtWUpu?=
 =?utf-8?B?UWdCazVpTDVVemlwYWhSbFRsQzdka1ZXWkp1bHRCRXJOZkFrb040QnpEWkJq?=
 =?utf-8?B?S2dDMjA0VGx1czZiUmEzVWlldHNjSUZvVHVXMDUvbXpaT1k5WENaelgwWXRH?=
 =?utf-8?B?eW1xeFl1NllHUENXQWVtamNtMVF5MnM5QzNJT0RwbzVOU1kvRVFES01zTCtn?=
 =?utf-8?B?OGFXVHovbTZrT0RBSnAyWGhTYS9xK04vL3hJSGRSWTFtSlhYQXMwVmRuaUNl?=
 =?utf-8?B?TEdEbk1QeDQvVjFPNStDclY5S0QxeGxqQ3BJS0Z0OUMwbTV6dHJuQ1cyRXYr?=
 =?utf-8?B?SUpMbHlWMnNGWTlIcjVZN1NpYWMzVDNGN2hURWJLYjFLM1pRMmZybllaMkJJ?=
 =?utf-8?B?OThDaTRTdm85eC82RW9OZG5JemVnVGhqYkwvVjlaa2F0S1VNaE9xLzF0c0tx?=
 =?utf-8?B?MXRqeHVzWDhMaitnL1dBZTVpRmdwVzRvQ0hXMFNZVTZ1L0ZEQUYxN0NhU2Nq?=
 =?utf-8?B?UXh0OFFDOUlZYnhydnIwU0pGdEJkVjVKR1oyU1FrQ2xiK0RWRVlXSFhzYmVo?=
 =?utf-8?B?dUpwbExjWllJZjZ4ME5Hd3pqZ3pFVGxka3ZwbHZ1NmwyZG5ETng3U1IxeXNZ?=
 =?utf-8?B?ZmJKWWcxbWtTeGNxckEvRVdFOHhOakc2M2V2VENJbklnWERmM2ZyTjlXZC9N?=
 =?utf-8?B?N0ROTG00R3lYSmg1ZHJmVnJlVGFnNFUzUWgxaGwxZnhsZ2VHclB6ZFAzL29L?=
 =?utf-8?B?cml1bUR3Z01LWnFOVlF5cy9ycDJzc0p5cjMrNE1LUnVHVkM5Uzg5bkpyZHUr?=
 =?utf-8?B?TndmK1VDUXBiakhLaVcyT3FoZ2pqUy8zakQ3VVNqZTRYYTR0ck5Eck5FMHhk?=
 =?utf-8?B?TzI4dGxOL0QycXFXWUJPSjFHYXBIclhGM1g1c2ZWYlpuSDdSZlB2NmNWSEIy?=
 =?utf-8?B?eDEybW4xbm5OSEw3ZEQ0TDRSa1FRY0FLd0JwSjFtR3JTOGNUMTd6dkNmTUI0?=
 =?utf-8?B?VitmeHYwMGR1aVJrWXJKYmpyV2thU0YyMUZ0OWxuWWRBRndBRVQzc1NBbDlh?=
 =?utf-8?B?RThZazRCZGM0NFlvMHBxdlY3L3V4Q0hiZDY2UmJkOTJMRFpCbGIvSVh1VVdR?=
 =?utf-8?B?bXNYMGcrVDYyK05vNlEvY2d5WThmcFhLWDF3eW9aMWFxWkpMR0tVMENTN2Vs?=
 =?utf-8?B?NnVEelFpVTQ2bEcxQkcwVXVXSzNOWFNPVWl0b1E4ZWVZRlFCOGprWk5LRDVV?=
 =?utf-8?B?YXJRK2pUdktsMEhqZ0dPV2xZUndndkhwU0FhT05RZ3dXbXcxdHBMRnZrUk9y?=
 =?utf-8?B?N2hRWnNrS0dSRVRRTlQzZXpMSFN3UFVkUjNUSlBCRHVVKzE2cy9hOXk4Uk1Y?=
 =?utf-8?B?VDRlcXd4d3BjQjlMVk03bW1qemNMdEpZb0h5aGphT01XeGJ4eHlyMnM3cDh1?=
 =?utf-8?B?ZHZaSkpmWUpCQWhhbXBsSm5Jb2lFMWNPeXprZVhweXFObHN1ZWlmdz09?=
X-Exchange-RoutingPolicyChecked: Cg9hmoAFa6Jn0yJRDC7vL25B7lk0RWgc0nkp+Eg8iLZ3YEKnOiDL5bmyJi6eGxW5T5DSklhP3fxnQhsQ/bdvvnOQAsb6MBh0HsaZCHO6mxKMRa67y9/32PkNsczGlZWyuuZJT5FvSekrRsSXzbOjFIf5w54gLmBPkCNmgjSUcCrYZmxsybKPCHygVDt6/6LeRAybR4NTyvmelC3bY52kuEDVWDNi651vYSWL3Fx1wPeMU74381r/AA/rudwD1n+xyT9RIbR4pojCrI0du50Au0lOxKuUJaqUZsCdeUhGm8BRLJsesWBCYpxgaaRJjNjzgl0dwJhoLZf4Qg5s0hdNtQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d529a56-bd0c-48c3-cc66-08de8e678bc5
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 14:20:51.3482 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F+0CoTaY7h2pnbwpZhNk5m+x2dyl1uLVoIFR6xDOK3IbRpDueJrN04E/knED+N0D/mCjELj3iHHZGPhPtEnSpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFC77662F02
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

Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel.com> writes:

> Results parsing is currently limited to few predefined files.
>
> Create "attachments" directory and export full path of created directory
> to be used within hooks. From now on environment variable
> IGT_RUNNER_ATTACHMENTS_DIR become visible when igt_runner is used
> to execute tests. This env contains directory where subtests/dynsubtests
> may write auxiliary files which finally be included in results.json.
>
> Signed-off-by: Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Ryszard Knop <ryszard.knop@intel.com>
> Cc: Krzysztof Karas <krzysztof.karas@intel.com>
> ---
> v2: simplify attachment dirname concatenation (Kamil)
>     remove files in attachments dir when overwrite is set (Kamil)
> ---
>  lib/igt_hook.c    |  4 ++++
>  runner/executor.c | 44 +++++++++++++++++++++++++++++++++++++++++---
>  runner/executor.h |  2 ++
>  3 files changed, 47 insertions(+), 3 deletions(-)
>
> diff --git a/lib/igt_hook.c b/lib/igt_hook.c
> index f86ed56f72..57817bdc12 100644
> --- a/lib/igt_hook.c
> +++ b/lib/igt_hook.c
> @@ -518,5 +518,9 @@ available to the command:\n\
>  \n\
>  Note that %s can be passed multiple times. Each descriptor is evaluated =
in turn\n\
>  when matching events and running hook commands.\n\
> +\n\
> +When executed by the igt_runner environment IGT_RUNNER_ATTACHMENTS_DIR\n=
\

Nitpick: s/igt_runner environment/igt_runner, environment/

> +is passed additionally to the hook script. It contains directory where\n=
\
> +script may write additional attachments like guc logs, etc.\n\

Looking at how this is implemented, the attachments directory is not a
hook-specific thing, so I believe documentation for it would be better
placed in igt_runner's help/docs.

>  ", option_name);
>  }
> diff --git a/runner/executor.c b/runner/executor.c
> index 1485b59d1f..bc421f7dbb 100644
> --- a/runner/executor.c
> +++ b/runner/executor.c
> @@ -1779,17 +1779,22 @@ static int execute_next_entry(struct execute_stat=
e *state,
>  	int errpipe[2] =3D { -1, -1 };
>  	int socket[2] =3D { -1, -1 };
>  	int outfd, errfd, socketfd;
> -	char name[32];
> +	char name[32], attname[32];
> +	char attdirname[PATH_MAX];
>  	pid_t child;
>  	int result;
>  	size_t idx =3D state->next;
> =20
>  	snprintf(name, sizeof(name), "%zd", idx);
> +	snprintf(attname, sizeof(attname), "%zd/%s", idx, DIR_ATTACHMENTS);
>  	mkdirat(resdirfd, name, 0777);
> +	mkdirat(resdirfd, attname, 0777);
>  	if ((idirfd =3D openat(resdirfd, name, O_DIRECTORY | O_RDONLY | O_CLOEX=
EC)) < 0) {
>  		errf("Error accessing individual test result directory\n");
>  		return -1;
>  	}
> +	snprintf(attdirname, sizeof(attdirname), "%s/%s",
> +		 settings->results_path, attname);
> =20
>  	if (!open_output_files(idirfd, outputs, true)) {
>  		errf("Error opening output files\n");
> @@ -1870,6 +1875,7 @@ static int execute_next_entry(struct execute_state =
*state,
>  			setenv("IGT_RUNNER_SOCKET_FD", envstring, 1);
>  		}
>  		setenv("IGT_SENTINEL_ON_STDERR", "1", 1);
> +		setenv("IGT_RUNNER_ATTACHMENTS_DIR", attdirname, 1);
> =20
>  		execute_test_process(outfd, errfd, socketfd, settings, entry);
>  		/* unreachable */
> @@ -1950,7 +1956,10 @@ static int remove_file(int dirfd, const char *name=
)
> =20
>  static bool clear_test_result_directory(int dirfd)
>  {
> -	int i;
> +	DIR *dir;
> +	struct dirent *entry;
> +	int i, adirfd;
> +	int ret =3D false;
> =20
>  	for (i =3D 0; i < _F_LAST; i++) {
>  		if (remove_file(dirfd, filenames[i])) {
> @@ -1960,7 +1969,33 @@ static bool clear_test_result_directory(int dirfd)
>  		}
>  	}
> =20
> -	return true;
> +	if ((adirfd =3D openat(dirfd, DIR_ATTACHMENTS, O_DIRECTORY | O_RDONLY |=
 O_CLOEXEC)) < 0) {
> +		errf("Cannot open attachments directory\n");
> +		return false;
> +	}
> +
> +	if ((dir =3D fdopendir(adirfd)) =3D=3D NULL) {
> +		errf("Cannot fdopen attachments directory\n");
> +		goto out1;
> +	}
> +
> +	while ((entry =3D readdir(dir)) !=3D NULL) {
> +		if (!strcmp(entry->d_name, ".") || !strcmp(entry->d_name, ".."))
> +			continue;
> +
> +		if (unlinkat(adirfd, entry->d_name, 0))  {
> +			errf("Error removing %s\n", entry->d_name);
> +			goto out2;
> +		}
> +	}

Since we can't predict that the attachments directory will remain flat,
I think it would be safer to do a recursive cleanup here.  I guess we
could use nftw() in a post-order fashion here?

--
Gustavo Sousa

> +
> +	ret =3D true;
> +out2:
> +	closedir(dir);
> +out1:
> +	close(adirfd);
> +
> +	return ret;
>  }
> =20
>  static bool clear_old_results(char *path)
> @@ -2002,6 +2037,9 @@ static bool clear_old_results(char *path)
>  			close(dirfd);
>  			return false;
>  		}
> +		if (unlinkat(resdirfd, DIR_ATTACHMENTS, AT_REMOVEDIR))
> +			errf("Warning: Cannot remove attachments directory\n");
> +
>  		close(resdirfd);
>  		if (unlinkat(dirfd, name, AT_REMOVEDIR)) {
>  			errf("Warning: Result directory %s contains extra files\n",
> diff --git a/runner/executor.h b/runner/executor.h
> index 3b1cabcf55..bc6ac80dc4 100644
> --- a/runner/executor.h
> +++ b/runner/executor.h
> @@ -25,6 +25,8 @@ enum {
>  	_F_LAST,
>  };
> =20
> +#define DIR_ATTACHMENTS "attachments"
> +
>  bool open_output_files(int dirfd, int *fds, bool write);
>  bool open_output_files_rdonly(int dirfd, int *fds);
>  void close_outputs(int *fds);
> --=20
> 2.43.0
