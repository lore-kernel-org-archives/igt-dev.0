Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BFE7CFD2F6
	for <igt-dev@archiver.kernel.org>; Thu, 27 Nov 2025 07:22:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 809C610E061;
	Thu, 27 Nov 2025 07:22:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m2wZjlK2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4030D10E061
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Nov 2025 07:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764228158; x=1795764158;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=yCoWXsb04GAKtMqBfhdv42SJL5y/KLBaKvF77ZTYNhU=;
 b=m2wZjlK2G3psJuHdL8fyXOuXcmGLqA0RV987I70b1GqhWj/SJ8R0IVRd
 v386qei7mjNmAUHgrOLlrXEAB3g5IxaGLhwupViLg81OGihHEiiDoHmyF
 yfA4BGuTzjzNtnn7/xgjwnsM37CF8nOILZm3ZDuXc1FGI4SuydHkDa3/D
 fQn7/o7eEtwZpNp5+uuKYOvA5DCsEgrboBWEOW8fte9x0UYnA7Pek8tGc
 RBcd7PaiX7JXt0WnvDx4G2XSQHciwTE5UhTn9CTsWCG6XzzpdlAsX8B4W
 RwiIErBk6QtCS7ksbb95m7n8TnJ6xmbpIok66J8SHyvvC3yum0octZhxd w==;
X-CSE-ConnectionGUID: yuzqQqhiSMSvgyLiF+M5Qg==
X-CSE-MsgGUID: NRIY5gkYQ7aAe9aVNvIRdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="53839977"
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; d="scan'208";a="53839977"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 23:22:37 -0800
X-CSE-ConnectionGUID: lObwrD91RSiz0j6L7eUiWA==
X-CSE-MsgGUID: dNK6Acw9SnmeoVpmK1Z7Yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; d="scan'208";a="193971254"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 23:22:37 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 26 Nov 2025 23:22:37 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 26 Nov 2025 23:22:37 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.18) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 26 Nov 2025 23:22:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NLTzj4sMfAnZTm30V5jNUd5PuY6C74KYNyWWhT9oF+1b0yC6CMtyl1leNGRB+Bzadm0KV0rRmDxnMshn+IMBw40YhwQT61eKemQkvJ9LUIFfhv67MryNtdQLO85ST0yTgr6JwDVCQEIAj15SP8bWCCXcG37lcgz74PqBBPudxmbGmmrzrZdUrmLKEPUUcQ+Pp9rbzD3ngSJw25U33tt0erymEmwcTIIfdKAK60tcl1uSovl8a0GytHz0EpqtTYWyiyRbhZHNF5jvdsFzHZnqgPLsQz/QW6aydmQAond+gICR3jcWy/BSMGnDFX+pUMgGifMeKgnkiijyHAI6M4jsqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SuABVDA5CLo3fiHasv1EpZ5uHfmO+UL3q+cPhl0TTyw=;
 b=dpxuo8hkbjicxBuduEca5FxND56ds7yy86hTaBYmCcnfOTuNXd8qJV6j2IhBpQYxIdhi2YJ2Qud+KfiXhhyxp8AFyn7+Mu/xyu5GEaJ12sk87n2fvDbTldtbOX8kNxs84zAq+YgDNQLHX1v+HbEL1BGDPX4MWedSmeVstRvD7Sgp/+f58aMqerJ7mf+MUyyoqcnVykj8lFfFVTlBlyWynAsagduN9THuxsmHTmpG5hUcmV82eBlUXopQcbuvW5huT57lt1qXo0BOl4bCi89xzJsERx45Gdb2NtTf6hLKgPDsApGE10AhCb78omTplZvxvvahVgUqwyfrzL60XHgk/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by PH0PR11MB4999.namprd11.prod.outlook.com (2603:10b6:510:37::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Thu, 27 Nov
 2025 07:22:35 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc%3]) with mapi id 15.20.9366.012; Thu, 27 Nov 2025
 07:22:35 +0000
Date: Thu, 27 Nov 2025 07:22:25 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v2 1/3] tools/intel_gpu_frequency: print short
 program name
Message-ID: <3nxmi6plv7suu4zg47qo2jfit7s36ga5nx6xb2hr6ql3uixxh6@rusdp7ig74bn>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20251121193539.195005-1-kamil.konieczny@linux.intel.com>
 <20251121193539.195005-2-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20251121193539.195005-2-kamil.konieczny@linux.intel.com>
X-ClientProxiedBy: WA2P291CA0013.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::14) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|PH0PR11MB4999:EE_
X-MS-Office365-Filtering-Correlation-Id: 93fea9e2-b4a6-4726-b97b-08de2d85bc29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QzM2QVdrRDNvaXhaTkpxb0ZVK3dvbGxKaVV3TituaFhqTytnZ0JHa2RBbkc4?=
 =?utf-8?B?VXFnaDhWWFpRZVZVZGxWUEt1a1RoejRTQmJFNDFDU0pOL1EveGUxUVc1MVp4?=
 =?utf-8?B?WkxuUmg0WjJFbUpYek16QzV2Tm5jN2J4NS9IZ3dTZnl1Y3pzMzRSZ1NLZita?=
 =?utf-8?B?QlNram13dmsvQ3FYVHNycDJXZjNHeUdPYmtnRmNvNC9PY2xXaU1Pak5lSmhn?=
 =?utf-8?B?aDl2Rkorb3FLemlEa2REOVRLN2RIMkliOGU1TTVPRVZqWVNmdjVIcGhVRUl4?=
 =?utf-8?B?QS9JS0FZWlBHWFVQUWpPbEY2d2docURvZzFPazZVNnF5MExqejdnK0tEZjZH?=
 =?utf-8?B?cnZmN0Y0SlRZYWx3bUxEQ0pNSFJrTUpsNGFyNkpXeE8vSzZWUTM0bDFSM3dq?=
 =?utf-8?B?TGVZQ0ZTMnRFSFE0b1A1bTdoR1V3WGNHOWJRZXdWMnlPbzd1bm5oUlJBZ0h5?=
 =?utf-8?B?UTlUTWtTblRiMHZqdmRlODBVcXh0T0hJWExNcG9Tb3BrWEFweUZ3VHRZVVJE?=
 =?utf-8?B?WHpqUHVucjk1YTQ5di82cWIrSm1xa2FISXRDVkJoZnY0ZTdRY3ZLZ054L1dp?=
 =?utf-8?B?OUdjUXVRNHhrZS83NVRLeEI2UjF4ZXNsSmpvZGorUlZRd0xVeG1XNGxCSVJL?=
 =?utf-8?B?OXJpOENLMTh2RS9aUEVRYTYrYnNWRHhxRTI4aml4bFlJd2Z1dXVOQmxjcjNu?=
 =?utf-8?B?eXNQTTM4Ni9vZU1nalNTUmdESFlpdDdtckZza3NqYUZ3TU1aUUVpZk5nbTV0?=
 =?utf-8?B?MnNnZ2FMSE9zTlFpQWxnc0t5bkpQa2RuanVVY1hOSHRteHhlTTlDRHZncWFR?=
 =?utf-8?B?VmUyOUd4eDFXUUIrZ2xpU0lha3lHSjFZcC9lT3ptUWlBWlNDbnBTRDZBYnFy?=
 =?utf-8?B?TkNoOXpKdEFVRXp6K0diaDhwTkdFazFJUTNJQjZjZXY1eXVYR0NQWU9WcEpD?=
 =?utf-8?B?TE1tKzNWQ0d0Ykx1anZVeGJOQ3M0UGxvTmJGcVV1eTBCWExQOHExYWNJT1da?=
 =?utf-8?B?cTRhcXE2YnQ4a0Z6TzBKVzRTemtiQlRYZG1HZnJUdy9ERGhNcHNObE9DQUxM?=
 =?utf-8?B?blhTc3I5WUpCWGN3a1BsT3BzS2ZyN1JJSHJJOE0rVUtyS3R4cFhMUmZOWHpl?=
 =?utf-8?B?bU5EdnQzcEhwUWxTNGFvTWROaTdIVWUxb25iS0pZU1orSlFxSkx3TW5PODYr?=
 =?utf-8?B?Z0dwYjdwazUwdkdFWHoxWXJQbGNOWlJPVjMwUW1sQ2diRS9pdzZPTm5hNXZm?=
 =?utf-8?B?S3k4bzZza3kyd2FLV2hYUWdvYTYxNHFkYmxyNjY3alRBZ2JheXRoK1ZkT1hy?=
 =?utf-8?B?MmNwNzlsUkowM1JWU0tmNi9BSWxSbkh4UzJQT3RMeGZDWFN1MitBbUpCVktz?=
 =?utf-8?B?VFQvZFdYU1BEZWZiaDd5eGs5S0Z1NFhPMDM2T2JQbFFPY1F0ZWxoVldrTXRZ?=
 =?utf-8?B?WGwwZ1d6djA2VWVzcW9zNUMzd2dFMkxuWEpjUDgvWnpMdGVhcEFjUGxhNmw3?=
 =?utf-8?B?c1IvTzYrTklUaklwSVVzeTNmNVVKMC9WaysrbWh1bnNDL3ozZXo0Nm9VYnpN?=
 =?utf-8?B?Ri9vL3kwdFdFTEpwd3FndUxWRHZCWE9DV2NRUUV3SEpxemlpcytXTHJGbnBD?=
 =?utf-8?B?L1pEaUVpNS8xem1GK1R0bTRVek9DalhRbXBzTmxwd09BL2l4Ny9QbXNRcGFX?=
 =?utf-8?B?V2Y4My9ZMWZudzdjS1l2c3B3UHF6OGp0TUMrRHk3L1huZFBsYy9nbm5uV0o2?=
 =?utf-8?B?cW1uektkVlNONGp2enBTb3lUZDRTQmZnVnZ1WUlPdnNscnVFTFpZcVNaZHg1?=
 =?utf-8?B?ekdtZytDUktDb20waVhSS0RiczV5QkVRYmxPbWU4TVdDejRzRE40VXMzNHc4?=
 =?utf-8?B?SjNlMHdXQkdLVHJjM0NkK3NEU2RRek05MWJwbXdKSldmZTc1Z2p1ZnhURTVr?=
 =?utf-8?Q?iQ6pw671sQwqyDu1D7AYJdBKJZBE74/E?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NStaSlBPaVNQbXk3WXlka1pBMHRYTGllV3hJcWhXM2FPUmoyVElJaktQUXJH?=
 =?utf-8?B?d0l2UUlxSnpwWmdrc0NjZ3E2STJRMytaYmdSUXJJOHVsZXBaREZXUkxEdHFl?=
 =?utf-8?B?SmJsaDRrZUQvNE95czJSWHBzNVBkOUNZamxUaXplVmdzcXMvZWllaW96RFFL?=
 =?utf-8?B?NzZzbm5HeVo0eWZOYnlrcUxqTU1FanVkSVJ4azh5bjhyUWVOMjJXaUdITERG?=
 =?utf-8?B?TDdRQlFhZ0VWemovQnRBQXR6bG44U3pDMjg4dVJ1N3k0T1BKYjJPVWNNUDBr?=
 =?utf-8?B?M3RYVGRmeDN5dEFYVDlWdXhjR1NJLzB1eU9sNm5MckVTRTdTVUxBTEVPaXIx?=
 =?utf-8?B?UXBvYXVBcGJvNEplbE4vWE9PMVFJVmUzQ25Wb3ltazN2eUhmRTFhaEFDL0dr?=
 =?utf-8?B?VVY2bjIvcEl4NTBETnNjZjRiMmw2UWpJeWEvM2FHWWtDOTNZYVJISWpzT3F6?=
 =?utf-8?B?VEtodnRTWDZQNnVWejlNNTFzVW5WVEY0QVYvSWhDUXZ5SG1ybDFlZmVGY1l1?=
 =?utf-8?B?eVdrdUFDRDhYUzBGVDB6anJrVnJnNitUQVB2ZUpHQXhBNlB2akF2OTJoMjM4?=
 =?utf-8?B?RXNGU0U5RGlYc0NUb2dwUjd3WkFGRG9NbnB3RXBFdDcvc1hreWpVVUxnN1c5?=
 =?utf-8?B?Q0RiOG5KRDM1ODRkcTVoWnNnUk9BbDdMMHJvS0o5MkdGdXpTUnlpdDl6UUVl?=
 =?utf-8?B?QUJCa3hQdDhhcUIwaXExMjdBWTJqc2dtK2dMY1JmNW9zVy9vVlFJeGU4R2Zx?=
 =?utf-8?B?Mno0WDlYajFjN1Q1NEkzOTN0M3VQWE1KalRMSVZ1SlBEaTUwNUVvNFY5Y2Fr?=
 =?utf-8?B?YU41Sy9seUhFMWVnTkZ5TndLMzBVeVN2SUgzYldUQnZLNXVUMUtCZXY5NDhk?=
 =?utf-8?B?Wnpzbk96YXhTaEFFeUppbjU0V2t2UzcwL05RUkt2cG1QV3QxWFVWSmRTUXMr?=
 =?utf-8?B?MTBGaEVUck5hLzZvdW0yRk9aMjhHUE1UYmJSUkxZQ1BrZGRnZkxkMVBYMldu?=
 =?utf-8?B?L1VpVjFNY1dMbVZFd1BJcEdXRGh0UGxQVmlwRGJ0S1JXWmVZMmd1YmxjZ24y?=
 =?utf-8?B?aUt0Rkc5eCtRRmtPY3pMaENjYWdQeHFZa0JnQ2dueDdmZTJseGRZUGx3TXpN?=
 =?utf-8?B?Wng2NGFTQncvRm5rRXlZbkxQMzFFUXhQMWJjY2UyUm5JbDBiYWg5TGx5TFNt?=
 =?utf-8?B?OWh2eHM1OGFkMERISXVjNy83OW90dW43V29TemZjYWlhdVlFcWZTTUNVWTZC?=
 =?utf-8?B?WG01S1dPL3RCT1BEVzNmbUtWWjZXclJnYUpTa04ycTBobWxVMjZVY1QvdDl6?=
 =?utf-8?B?MTAxc1YxYytpbjVxOWZSeExpdFU0NTNOaWkxN1B6TzVXK3V5WjJUQkR0cldV?=
 =?utf-8?B?ZmtYVjlnSGpIWHVKR0RBUzZPd3NpWnczWnB3YUdSY2xqTklJeHF1M3JZTmVR?=
 =?utf-8?B?ZlQ1K3U5R1pVTjNGRjZNNEUxdXhSTFQ5Skh0Q1Rld29hbkdqb2RXMkdkbmY3?=
 =?utf-8?B?b00xM0tMdkMzeW5KbzFpM2toaXFBbWVtQlgwbllqNjRGMzRYMi9LUnp5OWpX?=
 =?utf-8?B?Y2YvdUh1OUMvd21VeXpjcU9vSzlxWFJ2RU8zcU1hcm9ldlpFMHYwaG9FUVA0?=
 =?utf-8?B?Ry9aNXY3S3V6aElJQzl6R29sczMxZzYzU3hBZ1NoaERaT3BFNGdObkpMdnd5?=
 =?utf-8?B?S1h5WlVsUEZSQlVTaHNhYlFMZ0RxQnpkVEJlVFRCb3Y1Z3FWcUl2b2JCTU5i?=
 =?utf-8?B?NHAza0pDM2dvRFNyYjFRcldjSlZINlVXM1VDYUE2T2JaK2lnNDJNTkF5ZTRq?=
 =?utf-8?B?VlpYR0F3RjBzbThUOUhOSDFHK0RlZnp1WjREd1lmdVBYZk1hakR5dEJjSi8x?=
 =?utf-8?B?YTB2U04xb3F1QUxBc1N3TmtuT0VCZHYwckYzdWRhR1ZQOXd6Y0F3WDl2Q01N?=
 =?utf-8?B?L0hiMkg2dGxVVC9va2RqWld0UThFcFZETzZXT1RaNjQzcDkraWNDZ1A1cWp6?=
 =?utf-8?B?RjBtcHpsd2dvd1ZPTzJiTzBjSExQU3RaeldJTUFybSszbWxFZ3hBWWhmSUg5?=
 =?utf-8?B?UjcwNUtYQjNvRCttT0tSeDJXREZlWmM3NmFST3BVSWtOeDJuU3RyaW1vem1K?=
 =?utf-8?B?NnRNa0l0MGxvcllqenRtUmhVcEU0K0NvTkgzZlMxa1o0UzdhL1BwTzFJQ2Rz?=
 =?utf-8?B?OEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 93fea9e2-b4a6-4726-b97b-08de2d85bc29
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 07:22:35.1496 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wNlJJIhLVuublVP70Net9ou0otTAaGX5m4gQKccO/Y9KXzW7s6RsKMz1v67qUgC01qZD27UvKntO+9+JzaqFPzpbR88VLmdqvXvWmWbkWxo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4999
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

Hi Kamil,

> When printing help or version info, print only short program
> name, without a path used to run it. Also while at it, update
> copyright year.
> 
> v2: shorten also name used for version info, update year at
>   version print (Kamil)
> 
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---

Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

-- 
Best Regards,
Krzysztof
