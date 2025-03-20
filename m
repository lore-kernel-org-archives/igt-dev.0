Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1445DC28B30
	for <igt-dev@archiver.kernel.org>; Thu, 20 Mar 2025 06:14:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AD5210E58C;
	Thu, 20 Mar 2025 06:14:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bmAPZglQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCDD010E58C
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Mar 2025 06:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742451248; x=1773987248;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6PU+8HUgCcJ1/TD19zjo6YcsjewX4CuDJ8WjXchFb30=;
 b=bmAPZglQhC1oYhc+LcZqbbpvuXE4YinNJFZG+ObatjaEA5XnSrGNAz+T
 BI7fvfllhlJqvX/l6yHsSMjZFfipFA+i9cvUPZ3vonIDoePj3oj7dIcUq
 zOk+OTXgkCFjMLxyI8lq1U9ubtvwhpb2xw+n6eUJti+VhOrfni0CGYO9U
 1k7hzby7DeuGhIQL30CC2Z3LiZaFapWgEG/vekk6v9voV0i97ilJaVZCN
 RXUKhTKDZkiFfPLFfvDiK85N07fPyhiMtW88TlPsE6kWOT5HknvHIsX1P
 Lp1RD+VEYQGTzVYxCsgSmURyvSMYEWos2YO19qEb6oZt6EJWi2YwS2lZD g==;
X-CSE-ConnectionGUID: qnwGUpVlQtqDudUz3lPQaQ==
X-CSE-MsgGUID: 9N5qkZ0fQuut4dXzxDZ8Ig==
X-IronPort-AV: E=McAfee;i="6700,10204,11378"; a="43797559"
X-IronPort-AV: E=Sophos;i="6.14,260,1736841600"; d="scan'208";a="43797559"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2025 23:14:07 -0700
X-CSE-ConnectionGUID: GEE6guxTTwCIAHP3iz/GJw==
X-CSE-MsgGUID: lYO8bX9tQp6Rf8Rzz2Q9uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,260,1736841600"; d="scan'208";a="122690948"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Mar 2025 23:14:07 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 19 Mar 2025 23:14:06 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 19 Mar 2025 23:14:06 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 19 Mar 2025 23:14:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KikibmjfLvn6DDWwYPS8FLM+J8wNlGPWim+fWIlAsArVzYVzyEJcfTYH6vVTZiXAiqDs5OdvhEbSL6kInkAI5bq55Sxd29xoW0wyt2w5IbLCNwbqkQ1kB824w9KPu9aGw5aUm/c1nx8WCxII4wMAbLvzQpH8mAEchl8VIUN1PFnk0M/deLwQKnmffc0v5QMvIWY7qcrrP+ODcPoVX7LD53O4XCDlI/NsP3YfnUUz0Pw8Agcsf2eK7n8nObbtVLKDsF9kaHudWC4/H57J7vUhYOeQzjmwjaPr8see4pB2bMdhJ0q1oq3fRxpvP/MwY7HIPB5mu+5PfrhRelcCUpwvfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6PU+8HUgCcJ1/TD19zjo6YcsjewX4CuDJ8WjXchFb30=;
 b=nrSvWhpV6t5qhcqJpOws69gN5TqYyVmJiT58b8k4DGYOKJa87IamlImzxDw70W0eRNElC4aHoBwNI+Tezb/sNlxge2cQdTN//CkDF9CJUF6S2hdaVxOrSuhVB5JgnaE61WKZx0hkzpJuFyMHICpFkLEcAWXZRWf4hFHVwRufXvQG7NAwhDZarpLmnLtelNIhdxf2UB+2mXL1u4dlnz8ytOqcjzg4mTxWl7sfLd3ZBk2l+sr2muhfwGDTtWvrmBKbac+TsFlAXy3nnpLKg7VxGsb8HF4gedPkzzMsenbfXuHoZR4ZHm5/ra8bF3MaaalBrbVKzSxZsWIGn7olZlyWhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 CH3PR11MB8752.namprd11.prod.outlook.com (2603:10b6:610:1c2::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.33; Thu, 20 Mar 2025 06:13:50 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%6]) with mapi id 15.20.8534.034; Thu, 20 Mar 2025
 06:13:50 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "B S, Karthik" <karthik.b.s@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
Subject: RE: [PATCH i-g-t] lib/igt_kms: Use get_max_pipe_hdisplay in
 joiner_possible fucntions
Thread-Topic: [PATCH i-g-t] lib/igt_kms: Use get_max_pipe_hdisplay in
 joiner_possible fucntions
Thread-Index: AQHbmJXXf42lZ7qx6UaRjSY0dd4/u7N6v56ggADKdYCAAAIdsA==
Date: Thu, 20 Mar 2025 06:13:50 +0000
Message-ID: <DM4PR11MB6312C6CC9055947F5D5E9A1190D82@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20250319061244.769947-1-karthik.b.s@intel.com>
 <DM4PR11MB6312C5E5E228A137C711513290D92@DM4PR11MB6312.namprd11.prod.outlook.com>
 <aadaecb5-0a32-4f93-809e-eaba3bbd83ed@intel.com>
In-Reply-To: <aadaecb5-0a32-4f93-809e-eaba3bbd83ed@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|CH3PR11MB8752:EE_
x-ms-office365-filtering-correlation-id: 01bfc8e6-a18d-425b-71d0-08dd677661f1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?MnVJeWNGa0tXai9yMWkwRkdxakZ3ZVdEQjFEZWhPRmY0SG9QNUhEY0dSRmRW?=
 =?utf-8?B?VW1XN0hERDRNUkl2M1JWYTA2ZlphRnFGOWErMWJ1S044QUhLOGxQcHMwR1NU?=
 =?utf-8?B?bElpY01QN1VoR2pZOGlDZUUzaU1TSXRvV2Njdy9RNzhWaXlWLzNyQm9IbzV1?=
 =?utf-8?B?ckk1NklhRDNLMkF0M1M4STd5S0NhbjRNSFhCSktvQ0o1czNKUGVnWVdrd29O?=
 =?utf-8?B?WTFyYkJORWF3NHlzN1JhMTZRNTFjK2pkMDh1YTFiNytoSEJBTVcxUkd3ZGhx?=
 =?utf-8?B?R2gzeTdiZ0VuL1NFWkdqWjFCWGJmakx5ZXJucWVvV1FwdVpTNUFReE9uWDJ3?=
 =?utf-8?B?b2tJS01xRklrZm5wdUphVU1IUzZCQTFMak1KbHdOdFRMMkJPRHBTUTFsYnM5?=
 =?utf-8?B?b0EvbUFFMTFXZnhEWGdSZmRyajMza1dUYjhLN25VQWZJcHhkWFRSNlEzdEdt?=
 =?utf-8?B?bDY4bTZYbUIyK25sKytqd3dUNUV5dC93MUU5bDFsek9LeWROYzB2UkllWjhK?=
 =?utf-8?B?VnVzZXRQajY3Szl2dEp0aGtIUG1FUFZFdGFUTG1WcTFsSFFDUCtnUDUvN2Yr?=
 =?utf-8?B?anUwR2U3VG5XK0pnRitBamtzcnlXUWc0ZDdqOHNkdWJBTHY4RlJBMEN4emhY?=
 =?utf-8?B?YldNdllCclhXa0dPbGhLQzhKTVBNcDFsYnNhTTdienk2N1NPQXQyNVpJTDIv?=
 =?utf-8?B?MmQ3ZlVQZEx3NjJKcjhTNTFLQnZjK1hOc0VJSzV5RnA0c25NdDRXRi9xL2dl?=
 =?utf-8?B?QXhBUXJtR09KY0VKZWhVdG96SXVUNVRURjlEUVUxNWwyd1MxZHRXa2hUNERV?=
 =?utf-8?B?MjZZbFVWeEQ0VkNLT1V0SkNMd0FMQW94SXVFOE43WlJEeUVCdHl5WlNKZDBQ?=
 =?utf-8?B?bEdFcjFEeTRpVnFNM0pDZi9YZWN3MXZSTzViaE8vRnROazBjU2taZ0hqMjdp?=
 =?utf-8?B?RkVISjFjVEM5ajVGZ2dHVkFhSGtTZExPQzlCSzZ6U1EvakVpbFVvalo0UW4z?=
 =?utf-8?B?RXlyWWRsYzZDc053UWJCWTJtclExWjNoZVVPSmM4OTlNSW5MUi9QVEMrVGpF?=
 =?utf-8?B?Qm8zZklDREtUT2xzbERLZy80Sy9IYTZGZ1pkRXJnSHhWUjdaV0R4N1c1N1pi?=
 =?utf-8?B?UlhmNzRRRkNuTnpOWjVaZk4yNUo2SkZhUytWMFMvcklEMFFMSkNTTURzbTFG?=
 =?utf-8?B?c1J4SGJsaVh3WU93MEd4NHpTa0lEd2tQQjYvSTdIekRPSXlFbGIzbXcrM1lR?=
 =?utf-8?B?anVYWnhEbjBNV0NLMVpIMExEMWZUZVRxMlYrSWREa20yY2NkaG5FR25ndUFK?=
 =?utf-8?B?b2Y5VWhBMUNHYkh5TVNsV2FkeWVPOHVyblhMcWsvSDRBWUl6QjBXNDhUYW9V?=
 =?utf-8?B?UUZIYXdLYkFZMUZWOWk4b1JjRnRma2hKUndnS3RKZHAzdUM4bmQ0ZEdDb0Zt?=
 =?utf-8?B?TW5HWUI2NTdLOWkzeDFEai9sME1qUVYrU2kzZkhkZGNFdEw4ejBzcms1TXcx?=
 =?utf-8?B?c1hHei92V1V1YlRQcitNOGY5bklJbXVBaDFpTzd0anpodHBxbWxlUXE2Q0Jm?=
 =?utf-8?B?WlR5ZDV1TWpaZEJJY2JISVRLRUpFc1ArN2dqSkt5ZVgyUkppYXIzZXpFeHN1?=
 =?utf-8?B?UkFLLzNkeUptd2VHUTNpVzJIdTJvTkQxOGRtejB6Qm5rcVJUelAxYSttOElE?=
 =?utf-8?B?VXBKbXVWQXdnT0FqM0t3TDJuZ1RKVkVGeUpHRE41U0svZWUyZkZHRVd1Tm1j?=
 =?utf-8?B?Vy9SalIvTkxLSTZiQXlsTW9ydFd3eWczTU9wUTZnVmdJU1pyQXVla0ZtbEJO?=
 =?utf-8?B?cy9SM0NTelJoN2ZhQ1JXRHRqMm14aVhVUUV5M29JL1I3TytEWkxnQS9vYXJG?=
 =?utf-8?Q?DE22NmaLdB6q3?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N0VjcHhxTWM4ZEZodkl4L3VvWU5aeWNOcWd6NHlDdi9IS3JySWYxWkhlMjhV?=
 =?utf-8?B?SDRSeC9wRDlUc2ZiR2xMVFFwNVpMRUpLNWFiVGhyMEZBa0tlYThxR0RJQ0ZH?=
 =?utf-8?B?Q1JEME5qcFZydFlLYzNvS2VhblFQUjZCZHU1N21LQU1qeXk1UzF6STZoZGkv?=
 =?utf-8?B?RGRUTGNWZ0phbXpjdHA5RFU0bk1SR0lQMHpwWDkwNnlMaFhLOWpIL1FzeVpF?=
 =?utf-8?B?ZHBrSmdQaGxja3IzWlZJMjU0eGRTS3NGZHR2UlYyRzVTL0pwNDNFSGR0Wkh0?=
 =?utf-8?B?QnU5ZzY2MGhHaUlUUjNyK3Zqbms0WjFneTFhRVR6Tk5BMlpDK3NQRWZWaWcv?=
 =?utf-8?B?RU4rOHdTbzNaNmRueTZQSXRDR09wS0tiYmVLRGFwSWFTMEhJRUlVQ09HL0k4?=
 =?utf-8?B?UjluMzJGcmNYaUw1ajh4akNmTGwwOFRtNVBlekdHV2NsMnY2ZEJMMCszWjJy?=
 =?utf-8?B?dWs4OXBoTThBbHJVbDBKQW9UYk9UTGQzbmxpRHFNVDJCN3FIaXFlSzVKVEh0?=
 =?utf-8?B?YWxOamhQUkczQVh0empRUGtSbFQrOHZCQ0c4V1VyaE5pSjk0ckdLbXdnUGdF?=
 =?utf-8?B?M1FWU1RGdUZreVhTKzFqOWxmVXFjbnBrU29xRUpyUmVpODRkQlh1emlXd2M2?=
 =?utf-8?B?WGNxZFNpZ0tmKzg1QUQvN1Nkd09MYjJ5Si9haEFxQVVJaHd2MS9lVURmYUJx?=
 =?utf-8?B?cVlLcTNSek1jQ2NYaDdYK3FSVjN1Vk1veHFKVVhVZndCazZXckljMmtYNTJP?=
 =?utf-8?B?U3pmRXNpOUEvQUlNMjV2T0o5UXJMK0duYTlKWW9uUHF0RWtOMFFibzArM3RO?=
 =?utf-8?B?NVlsbzdLSm84Q3BzcWVyMUkyTmdJRk16NHEzR0VZSHNpVUJqM1l5ZDhIalht?=
 =?utf-8?B?VzY0YU1LbEJzb21ZT2tORENtRHN2SjBSUC9xZVp2S0ZKSHBraHFDQUdJUmlY?=
 =?utf-8?B?RGpQbnNyRDB4LzJISE5TRmwxVG5ENTJkeFpiVlp4dXA3MVR1eDRXdzJqYnpj?=
 =?utf-8?B?cm45d3hKMHNsdHMrM1gxdXE4dmh3dFdyczFKU0luejRRVDh1YnRjRVVnQ2ta?=
 =?utf-8?B?S1hJd0h1MGx6cTRnbkxMelNnalllanZXYzdnQVV1Q3V4LzFBWVI1RnNLT2JX?=
 =?utf-8?B?Mk9BdS9CNXpKREplK2tyVUFEdWRrZ05IOXd6UE9nOHhmYUhmMVUxcTlmMGZa?=
 =?utf-8?B?c0xDa1hnbTRDamVOdmdOa3dlREoyMUR2MUZJcDJxUTMzNmsvQ0FiT0RaR1A0?=
 =?utf-8?B?KzlmSk9wZFUzMFZVNU1mRklWbFhyVW5wTFpUYTQ1aEhlQkUyNWxodjRrb2lT?=
 =?utf-8?B?ZVR5MDVlb3NTbDJnQUlnRVZiMUF2VjhnRC8va3BvZFJ1anh2a2ZBN1hNR0pC?=
 =?utf-8?B?TmxYZUhVb1pCdFpZQ1pEQmZZUy9HOHhqaUJ0eXZGdHdONTE2Z1QrSXBNcmdp?=
 =?utf-8?B?dkpjc25YQXJPYzg2SXdvT0Q2Y1BqbzBvenFRUkRDSlpxZ2lJMC8yRnhvc2ND?=
 =?utf-8?B?VXRBempUR0FGa2RiSkcyOEtHckpoTFltL3ZwcFdvc3kwYnI1Y0phRWpqN29F?=
 =?utf-8?B?WkVVY2Zzak8zS2J4NTRkMGQyZ0pKNUZCdTFJTGJtN0krZVhveTFwbmN6K0w0?=
 =?utf-8?B?SU5pZkhsaFNBMDdPY05uV1l3WnFNM3pIWVdhRVJyWnFHN3VjR1VXUCt6b1E4?=
 =?utf-8?B?YnFSeVhOQ29PNXp6SllULzJJUmJGdTd5LzVsUmg1SVVUUG1TaTlnd2IxcHk3?=
 =?utf-8?B?a0hEcERWTTRyYnI3cDdSMHgyaDJYeUN3RFFSQXNZc2VFUGlJaUVLaTZHU0F3?=
 =?utf-8?B?V29QWGRLTUxvTE1QcjRXMThhRmlUVHNZTFRLcmNVcHZ4c3RjbXRQdUVUM2VE?=
 =?utf-8?B?SjJBanhaMDBWQjFBVHU0VmxjWERoY1FUQ2dsZmhWQmlXOXdGQWJJN1JuR25a?=
 =?utf-8?B?MDBMVVR5VFRLN3RCc01UZ3NFTm9iUjBIYUt1NXpCZ0Flc21aeU1TeGZkdU0v?=
 =?utf-8?B?RHFKVkhlRkZJL0hhV2NYQnh5YWp6aDQyM3NvbjdQd25Ea3BESkRnTHdWOGtz?=
 =?utf-8?B?TkJXelhONTJNUzhjRG8zaTFnUmJwcmY1RFViVHgvME5BeHpsVUtmQWNPVWpx?=
 =?utf-8?Q?p2MA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01bfc8e6-a18d-425b-71d0-08dd677661f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Mar 2025 06:13:50.3445 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h/xDdHJ0ULy6hV9+/0f/Y+fr39Rpb7X2r9IocYNT27dcLhv1QFE932E89/y/NXfYCSvHemCerfxcaX93zSWv5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8752
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

TEdUTS4NCg0KUmV2aWV3ZWQtYnk6IEplZXZhbiBCIDxqZWV2YW4uYkBpbnRlbC5jb20+DQoNCj4g
LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQiBTLCBLYXJ0aGlrIDxrYXJ0aGlr
LmIuc0BpbnRlbC5jb20+DQo+IFNlbnQ6IFRodXJzZGF5LCBNYXJjaCAyMCwgMjAyNSAxMTozMiBB
TQ0KPiBUbzogQiwgSmVldmFuIDxqZWV2YW4uYkBpbnRlbC5jb20+OyBpZ3QtZGV2QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZw0KPiBDYzogUmVkZHkgR3VkZGF0aSwgU2FudGhvc2ggPHNhbnRob3NoLnJl
ZGR5Lmd1ZGRhdGlAaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIGktZy10XSBsaWIv
aWd0X2ttczogVXNlIGdldF9tYXhfcGlwZV9oZGlzcGxheSBpbg0KPiBqb2luZXJfcG9zc2libGUg
ZnVjbnRpb25zDQo+IA0KPiBIaSBKZWV2YW4sDQo+IA0KPiBPbiAzLzE5LzIwMjUgMTE6MjkgUE0s
IEIsIEplZXZhbiB3cm90ZToNCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4g
RnJvbTogQiBTLCBLYXJ0aGlrIDxrYXJ0aGlrLmIuc0BpbnRlbC5jb20+DQo+ID4+IFNlbnQ6IFdl
ZG5lc2RheSwgTWFyY2ggMTksIDIwMjUgMTE6NDMgQU0NCj4gPj4gVG86IGlndC1kZXZAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnDQo+ID4+IENjOiBSZWRkeSBHdWRkYXRpLCBTYW50aG9zaCA8c2FudGhv
c2gucmVkZHkuZ3VkZGF0aUBpbnRlbC5jb20+OyBCLA0KPiA+PiBKZWV2YW4gPGplZXZhbi5iQGlu
dGVsLmNvbT47IEIgUywgS2FydGhpayA8a2FydGhpay5iLnNAaW50ZWwuY29tPg0KPiA+PiBTdWJq
ZWN0OiBbUEFUQ0ggaS1nLXRdIGxpYi9pZ3Rfa21zOiBVc2UgZ2V0X21heF9waXBlX2hkaXNwbGF5
IGluDQo+ID4+IGpvaW5lcl9wb3NzaWJsZSBmdWNudGlvbnMNCj4gPj4NCj4gPj4gVXBkYXRlICdq
b2luZXJfcG9zc2libGUnIGhlbHBlciBmdW5jdGlvbnMgdG8gdXNlIHRoZSBleGlzdGluZw0KPiA+
PiBnZXRfbWF4X3BpcGVfaGRpc3BsYXkgaGVscGVyLg0KPiA+Pg0KPiA+PiBTaWduZWQtb2ZmLWJ5
OiBLYXJ0aGlrIEIgUyA8a2FydGhpay5iLnNAaW50ZWwuY29tPg0KPiA+PiAtLS0NCj4gPj4gICBs
aWIvaWd0X2ttcy5jIHwgNDUgKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tDQo+ID4+ICAgbGliL2lndF9rbXMuaCB8ICAyICstDQo+ID4+ICAgMiBmaWxlcyBjaGFu
Z2VkLCAyMSBpbnNlcnRpb25zKCspLCAyNiBkZWxldGlvbnMoLSkNCj4gPj4NCj4gPj4gZGlmZiAt
LWdpdCBhL2xpYi9pZ3Rfa21zLmMgYi9saWIvaWd0X2ttcy5jIGluZGV4IGNjM2JiM2FlNy4uOTlj
ODcwN2M3DQo+ID4+IDEwMDY0NA0KPiA+PiAtLS0gYS9saWIvaWd0X2ttcy5jDQo+ID4+ICsrKyBi
L2xpYi9pZ3Rfa21zLmMNCj4gPj4gQEAgLTY0MjgsNiArNjQyOCwyMCBAQCBpbnQgaWd0X2dldF9j
dXJyZW50X2NkY2xrKGludCBmZCkNCj4gPj4gICAJcmV0dXJuIHJlYWRfYW5kX3BhcnNlX2NkY2xr
X2RlYnVnZnMoZmQsICJDdXJyZW50IENEIGNsb2NrDQo+ID4+IGZyZXF1ZW5jeToiKTsgIH0NCj4g
Pj4NCj4gPj4gKy8qKg0KPiA+PiArICogZ2V0X21heF9oZGlzcGxheToNCj4gPj4gKyAqIEBkcm1f
ZmQ6IGRybSBmaWxlIGRlc2NyaXB0b3INCj4gPj4gKyAqDQo+ID4+ICsgKiBSZXR1cm5zOiBUaGUg
bWF4aW11bSBoZGlzcGxheSBzdXBwb3J0ZWQgcGVyIHBpcGUuDQo+ID4+ICsgKi8NCj4gPj4gK3N0
YXRpYyBpbnQgZ2V0X21heF9waXBlX2hkaXNwbGF5KGludCBkcm1fZmQpIHsNCj4gPj4gKwlpbnQg
ZGV2X2lkID0gaW50ZWxfZ2V0X2RybV9kZXZpZChkcm1fZmQpOw0KPiA+PiArDQo+ID4+ICsJcmV0
dXJuIChpbnRlbF9kaXNwbGF5X3ZlcihkZXZfaWQpID49IDMwKSA/IEhESVNQTEFZXzZLX1BFUl9Q
SVBFIDoNCj4gPj4gKwkJCQkJCSAgIEhESVNQTEFZXzVLX1BFUl9QSVBFOw0KPiA+PiArfQ0KPiA+
PiArDQo+ID4+ICAgLyoqDQo+ID4+ICAgICogaWd0X2JpZ2pvaW5lcl9wb3NzaWJsZToNCj4gPj4g
ICAgKiBAZHJtX2ZkOiBkcm0gZmlsZSBkZXNjcmlwdG9yDQo+ID4+IEBAIC02NDQxLDEzICs2NDU1
LDggQEAgaW50IGlndF9nZXRfY3VycmVudF9jZGNsayhpbnQgZmQpDQo+ID4+ICAgICovDQo+ID4+
ICAgYm9vbCBpZ3RfYmlnam9pbmVyX3Bvc3NpYmxlKGludCBkcm1fZmQsIGRybU1vZGVNb2RlSW5m
byAqbW9kZSwgaW50DQo+ID4+IG1heF9kb3RjbG9jaykgIHsNCj4gPj4gLQlpbnQgbWF4X2hkaXNw
bGF5LCBkZXZfaWQ7DQo+ID4+IC0NCj4gPj4gLQlkZXZfaWQgPSBpbnRlbF9nZXRfZHJtX2Rldmlk
KGRybV9mZCk7DQo+ID4+IC0JbWF4X2hkaXNwbGF5ID0gKGludGVsX2Rpc3BsYXlfdmVyKGRldl9p
ZCkgPj0gMzApID8NCj4gPj4gSERJU1BMQVlfNktfUEVSX1BJUEUgOg0KPiA+PiAtCQkJSERJU1BM
QVlfNUtfUEVSX1BJUEU7DQo+ID4+IC0NCj4gPj4gLQlyZXR1cm4gKG1vZGUtPmhkaXNwbGF5ID4g
bWF4X2hkaXNwbGF5IHx8IG1vZGUtPmNsb2NrID4NCj4gPj4gbWF4X2RvdGNsb2NrKTsNCj4gPj4g
KwlyZXR1cm4gKG1vZGUtPmhkaXNwbGF5ID4gZ2V0X21heF9waXBlX2hkaXNwbGF5KGRybV9mZCkg
fHwNCj4gPj4gKwkJbW9kZS0+Y2xvY2sgPiBtYXhfZG90Y2xvY2spOw0KPiA+PiAgIH0NCj4gPj4N
Cj4gPj4gICAvKioNCj4gPj4gQEAgLTY0NjksNyArNjQ3OCw3IEBAIGJvb2wgYmlnam9pbmVyX21v
ZGVfZm91bmQoaW50IGRybV9mZCwNCj4gPj4gZHJtTW9kZUNvbm5lY3RvciAqY29ubmVjdG9yLA0K
PiA+Pg0KPiA+PiAgIAlmb3IgKGludCBpPTA7IGk8IGNvbm5lY3Rvci0+Y291bnRfbW9kZXM7IGkr
Kykgew0KPiA+PiAgIAkJaWYgKGlndF9iaWdqb2luZXJfcG9zc2libGUoZHJtX2ZkLCAmY29ubmVj
dG9yLT5tb2Rlc1tpXSwNCj4gPj4gbWF4X2RvdGNsb2NrKSAmJg0KPiA+PiAtCQkgICAgIWlndF91
bHRyYWpvaW5lcl9wb3NzaWJsZSgmY29ubmVjdG9yLT5tb2Rlc1tpXSwNCj4gPj4gbWF4X2RvdGNs
b2NrKSkgew0KPiA+PiArCQkgICAgIWlndF91bHRyYWpvaW5lcl9wb3NzaWJsZShkcm1fZmQsICZj
b25uZWN0b3ItPm1vZGVzW2ldLA0KPiA+PiArbWF4X2RvdGNsb2NrKSkgew0KPiA+PiAgIAkJCSpt
b2RlID0gY29ubmVjdG9yLT5tb2Rlc1tpXTsNCj4gPj4gICAJCQlmb3VuZCA9IHRydWU7DQo+ID4+
ICAgCQkJYnJlYWs7DQo+ID4+IEBAIC02NDc4LDIwICs2NDg3LDYgQEAgYm9vbCBiaWdqb2luZXJf
bW9kZV9mb3VuZChpbnQgZHJtX2ZkLA0KPiA+PiBkcm1Nb2RlQ29ubmVjdG9yICpjb25uZWN0b3Is
DQo+ID4+ICAgCXJldHVybiBmb3VuZDsNCj4gPj4gICB9DQo+ID4+DQo+ID4+IC0vKioNCj4gPj4g
LSAqIGdldF9tYXhfaGRpc3BsYXk6DQo+ID4+IC0gKiBAZHJtX2ZkOiBkcm0gZmlsZSBkZXNjcmlw
dG9yDQo+ID4+IC0gKg0KPiA+PiAtICogUmV0dXJuczogVGhlIG1heGltdW0gaGRpc3BsYXkgc3Vw
cG9ydGVkIHBlciBwaXBlLg0KPiA+PiAtICovDQo+ID4+IC1zdGF0aWMgaW50IGdldF9tYXhfcGlw
ZV9oZGlzcGxheShpbnQgZHJtX2ZkKSAtew0KPiA+PiAtCWludCBkZXZfaWQgPSBpbnRlbF9nZXRf
ZHJtX2RldmlkKGRybV9mZCk7DQo+ID4+IC0NCj4gPj4gLQlyZXR1cm4gKGludGVsX2Rpc3BsYXlf
dmVyKGRldl9pZCkgPj0gMzApID8gSERJU1BMQVlfNktfUEVSX1BJUEUgOg0KPiA+PiAtCQkJCQkJ
ICAgSERJU1BMQVlfNUtfUEVSX1BJUEU7DQo+ID4+IC19DQo+ID4+IC0NCj4gPj4gICAvKioNCj4g
Pj4gICAgKiBtYXhfbm9uX2pvaW5lcl9tb2RlX2ZvdW5kOg0KPiA+PiAgICAqIEBkcm1fZmQ6IGRy
bSBmaWxlIGRlc2NyaXB0b3INCj4gPj4gQEAgLTY1NjcsOSArNjU2Miw5IEBAIGJvb2wgaWd0X2lz
X2pvaW5lcl9lbmFibGVkX2Zvcl9waXBlKGludCBkcm1mZCwNCj4gPj4gZW51bSBwaXBlIHBpcGUp
DQo+ID4+ICAgICoNCj4gPj4gICAgKiBSZXR1cm5zOiBUcnVlIGlmIG1vZGUgcmVxdWlyZXMgVWx0
cmFqb2luZXIsIGVsc2UgRmFsc2UuDQo+ID4+ICAgICovDQo+ID4+IC1ib29sIGlndF91bHRyYWpv
aW5lcl9wb3NzaWJsZShkcm1Nb2RlTW9kZUluZm8gKm1vZGUsIGludA0KPiA+PiBtYXhfZG90Y2xv
Y2spDQo+ID4+ICtib29sIGlndF91bHRyYWpvaW5lcl9wb3NzaWJsZShpbnQgZHJtX2ZkLCBkcm1N
b2RlTW9kZUluZm8gKm1vZGUsIGludA0KPiA+PiArbWF4X2RvdGNsb2NrKQ0KPiA+PiAgIHsNCj4g
Pj4gLQlyZXR1cm4gKG1vZGUtPmhkaXNwbGF5ID4gMiAqIEhESVNQTEFZXzVLX1BFUl9QSVBFIHx8
DQo+ID4+ICsJcmV0dXJuIChtb2RlLT5oZGlzcGxheSA+IDIgKiBnZXRfbWF4X3BpcGVfaGRpc3Bs
YXkoZHJtX2ZkKSB8fA0KPiA+PiAgIAkJbW9kZS0+Y2xvY2sgPiAyICogbWF4X2RvdGNsb2NrKTsN
Cj4gPj4gICB9DQo+ID4+DQo+ID4gRm9yIHVsdHJham9pbmVyIGhkaXNwbGF5IGxvZ2ljIGZlZWxz
IG9mZiwgd2UgbmVlZCB0byBjb3JyZWN0IHRoaXMuDQo+ID4gTmVlZCB0byBjaGVjayBzcGVjIGFu
ZCB1cGRhdGUuIENvcnJlY3QgbWUgaWYgSSBhbSB3cm9uZw0KPiA+DQo+ID4gQXBhcnQgZnJvbSB0
aGVzZSBjb2RlIExHVE0uDQo+IA0KPiBUaGFuayB5b3UgZm9yIHRoZSByZXZpZXcuDQo+IA0KPiBU
aGUgbG9naWMgZm9yIHVsdHJham9pbmVyIGlzIHNpbWlsYXIgdG8gd2hhdCB3ZSd2ZSBpbiBiaWdq
b2luZXIgYW5kIGFsc28gd2UndmUgdGhlDQo+IHNhbWUgbG9naWMgaW4ga2VybmVsIGFzIHdlbGwu
DQo+IA0KPiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZHJtL3RpcC8tL2Jsb2IvZHJt
LQ0KPiB0aXAvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcC5jP3JlZl90eXBl
PWhlYWRzI0wxMzMzDQo+IA0KPiBUaGFua3MsDQo+IEthcnRoaWsuQi5TDQo+ID4+IEBAIC02NTkx
LDcgKzY1ODYsNyBAQCBib29sIHVsdHJham9pbmVyX21vZGVfZm91bmQoaW50IGRybV9mZCwNCj4g
Pj4gZHJtTW9kZUNvbm5lY3RvciAqY29ubmVjdG9yLA0KPiA+PiAgIAlib29sIGZvdW5kID0gZmFs
c2U7DQo+ID4+DQo+ID4+ICAgCWZvciAoaW50IGkgPSAwOyBpIDwgY29ubmVjdG9yLT5jb3VudF9t
b2RlczsgaSsrKSB7DQo+ID4+IC0JCWlmIChpZ3RfdWx0cmFqb2luZXJfcG9zc2libGUoJmNvbm5l
Y3Rvci0+bW9kZXNbaV0sDQo+ID4+IG1heF9kb3RjbG9jaykpIHsNCj4gPj4gKwkJaWYgKGlndF91
bHRyYWpvaW5lcl9wb3NzaWJsZShkcm1fZmQsICZjb25uZWN0b3ItPm1vZGVzW2ldLA0KPiA+PiAr
bWF4X2RvdGNsb2NrKSkgew0KPiA+PiAgIAkJCSptb2RlID0gY29ubmVjdG9yLT5tb2Rlc1tpXTsN
Cj4gPj4gICAJCQlmb3VuZCA9IHRydWU7DQo+ID4+ICAgCQkJYnJlYWs7DQo+ID4+IGRpZmYgLS1n
aXQgYS9saWIvaWd0X2ttcy5oIGIvbGliL2lndF9rbXMuaCBpbmRleCAyN2I1NDVmNTIuLjAzODFj
ODJhZA0KPiA+PiAxMDA2NDQNCj4gPj4gLS0tIGEvbGliL2lndF9rbXMuaA0KPiA+PiArKysgYi9s
aWIvaWd0X2ttcy5oDQo+ID4+IEBAIC0xMjUyLDcgKzEyNTIsNyBAQCBib29sIGJpZ2pvaW5lcl9t
b2RlX2ZvdW5kKGludCBkcm1fZmQsDQo+ID4+IGRybU1vZGVDb25uZWN0b3IgKmNvbm5lY3Rvciwg
IGJvb2wgbWF4X25vbl9qb2luZXJfbW9kZV9mb3VuZChpbnQNCj4gPj4gZHJtX2ZkLCBkcm1Nb2Rl
Q29ubmVjdG9yICpjb25uZWN0b3IsDQo+ID4+ICAgCQkJICAgICAgIGludCBtYXhfZG90Y2xvY2ss
IGRybU1vZGVNb2RlSW5mbyAqbW9kZSk7DQo+IGJvb2wNCj4gPj4gaWd0X2lzX2pvaW5lcl9lbmFi
bGVkX2Zvcl9waXBlKGludCBkcm1mZCwgZW51bSBwaXBlIHBpcGUpOyAtYm9vbA0KPiA+PiBpZ3Rf
dWx0cmFqb2luZXJfcG9zc2libGUoZHJtTW9kZU1vZGVJbmZvICptb2RlLCBpbnQgbWF4X2RvdGNs
b2NrKTsNCj4gPj4gK2Jvb2wgaWd0X3VsdHJham9pbmVyX3Bvc3NpYmxlKGludCBkcm1mZCwgZHJt
TW9kZU1vZGVJbmZvICptb2RlLCBpbnQNCj4gPj4gK21heF9kb3RjbG9jayk7DQo+ID4+ICAgYm9v
bCB1bHRyYWpvaW5lcl9tb2RlX2ZvdW5kKGludCBkcm1fZmQsIGRybU1vZGVDb25uZWN0b3INCj4g
KmNvbm5lY3RvciwNCj4gPj4gICAJCQkgIGludCBtYXhfZG90Y2xvY2ssIGRybU1vZGVNb2RlSW5m
byAqbW9kZSk7ICBib29sDQo+ID4+IGlndF9oYXNfZm9yY2Vfam9pbmVyX2RlYnVnZnMoaW50IGRy
bWZkLCBjaGFyICpjb25uX25hbWUpOw0KPiA+PiAtLQ0KPiA+PiAyLjQzLjANCg==
