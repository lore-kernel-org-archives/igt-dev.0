Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 485ABC83F1B
	for <igt-dev@archiver.kernel.org>; Mon, 14 Jul 2025 13:33:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0022710E4A3;
	Mon, 14 Jul 2025 13:33:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iwh2hziA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4726E10E4A0
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Jul 2025 13:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752500025; x=1784036025;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=ar6CTBs30NLDlV6diNEM92HlxHPz2cAZNGhYGvhZ9Go=;
 b=iwh2hziAmUwd+HyNNUVDn0GP5KpZnZXA4pmQYFavqnMIi1HaxVZ7OEcd
 +wBtNj80NSpKYWJWzLhJIdAEsUEbyMHWD9pzI2cVGTkf6c4Xfu6TXLbSe
 CPiSXv+zp8lCO0mSkr1nnQiMCYnBak+gcfpklopnNsxR3PZtXUUr6N85v
 y4h+2EytIbUQ/0JJA0pDZD8yDXabJIh1PE1OSvRrjxvDNrAeiBHzGscc9
 TlDrW4W/Y9myxTQHFdn0vLzUyCtuvPaiTQ409AB1rNiMmJf4JGRoywCMI
 0jtSZNPfwmlm4m0o7VHBG+xdrtCMIn/DamlNWt6+I443YZ2FTIH+55rng Q==;
X-CSE-ConnectionGUID: jWCUszUDSXCJCUc5jsLtOg==
X-CSE-MsgGUID: Ssasy+jcRJasSVEoTDXlOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54560961"
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; d="scan'208";a="54560961"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 06:33:44 -0700
X-CSE-ConnectionGUID: qVgKT1SjQX2o/FZSx8fONw==
X-CSE-MsgGUID: SF+o+A1tRJ6W68bmGpZ6bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; d="scan'208";a="161240749"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 06:33:43 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 14 Jul 2025 06:33:40 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 14 Jul 2025 06:33:40 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.64)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 14 Jul 2025 06:33:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rSlyiD7DjXA/3BkXPCFz1eTUezYfqEAsTexiMzYmd2zBDgEK3lMK8H3DqTirBR/hb3vb4H20d+5cEveD8rLGgnzyGKOjH32wDC5dlRvKDhvaElU7i2TREeKzeh9cF1q7mPf8QTYRrdDXozWh9hBimX8H+R4/i+2N42Dl5u7HZOGtU3X+BjTFvYXrEYFUf7rzLMuGMHziddbemXmBlfF+kL0UgEgQtn472v+hdwdcQRe3omTttzpG3pGdwu/htGJy5SWmEw1N3onKBjzEA4WlEN7uFQOZuZMaf3eCPLfA6+0C4yeFy2UTsMrtjtkpN17QliciDkxpZEodd54ZyEUoLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SzQ5WU+ys56nFQHito2QJXl+++ajkYTN0wqojs4KEUI=;
 b=N39QZOF3/IT3QIwMpuvCHVcPd9X4XDuaTbCSUwP1wMc0OUt3HX0oza9apcs1+Oslc6OOh2PGn2rO0BdvFkQJk2Uwr8ORxOB8Gh+jMaBdVPpr0GuSrzKetViFeVnhVm0uCtiFeW1ehNxaokRqcDrB/4jT45ZGXgtAl28N6JmXZyLrM0TRvDU+FJdktEPm7DczgC9G+2PV4fqEIOzJGC3WrO4A6sUTRZTn+8IlveSXobzysJcX0tNxMxMVJkvyhHDOqSMecYpvMimHyrKFUN3iEGY8kagyYWZMy+TrHrAEm+/C6pwUf5et7diQQABaE5mEnEQeySCrXTu/rBRlIekJyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by IA1PR11MB8804.namprd11.prod.outlook.com (2603:10b6:208:597::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.33; Mon, 14 Jul
 2025 13:32:55 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%4]) with mapi id 15.20.8835.026; Mon, 14 Jul 2025
 13:32:55 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250713112354.32032-2-peter.senna@linux.intel.com>
References: <20250713112354.32032-1-peter.senna@linux.intel.com>
 <20250713112354.32032-2-peter.senna@linux.intel.com>
Subject: Re: [PATCH v2 i-g-t 1/2] igt_core_get_igt_hook: igt_hook pointer for
 other libs
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: Peter Senna Tschudin <peter.senna@linux.intel.com>, Gustavo Sousa
 <gustavo.sousa@linux.intel.com>
To: Peter Senna Tschudin <peter.senna@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
Date: Mon, 14 Jul 2025 10:32:49 -0300
Message-ID: <175249996916.2061.11232545398566672850@intel.com>
User-Agent: alot/0.12.dev27+gd21c920b07eb
X-ClientProxiedBy: MW4PR03CA0192.namprd03.prod.outlook.com
 (2603:10b6:303:b8::17) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|IA1PR11MB8804:EE_
X-MS-Office365-Filtering-Correlation-Id: 2be5b0ef-40f1-43a6-3a7c-08ddc2daf0a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dnk5a2Z1aWlaUTU5a2tiejQvT0xaR3RsTnBrdlFpaXhheFhVSFZud1ZpaUd6?=
 =?utf-8?B?dXVlYTY3S2hDcHhhbllydkVLU1c4WFU1STFhaWlLV3JNV1VlSzh2N0wycE44?=
 =?utf-8?B?ekxKcUJIUHpzeHA1MmJkKzZTbUdCSCt0T3B1WFl1WldSb0FIVTVCdGRoci9J?=
 =?utf-8?B?NDRja0pXT05MNllKd0d4aFhFSGtURkUwZUZVZXVGaDBXUFlTWGVld1BqQzM2?=
 =?utf-8?B?U2MrVGdPMFhTRlpLdm10SlgxYVFPcHNPRGJ5WHRIY3Q4OTdTTzZMQTJGbndO?=
 =?utf-8?B?Ykg4aklGUkRZYktMTWkwcDArR3crOVkyNlgvRjRGV1dEUndRV043MjJjR09R?=
 =?utf-8?B?N1pvcWc0SVNyblZXNU9uN01FWFZkaTgvVjVBbGxtS0FzM29lcVkrczQ4T2RR?=
 =?utf-8?B?VU9kR0dzTk1Sai95REx5RGFHdjJSa1VnYUk5blVtcUlQL1lDcFNtQ2R0OUw2?=
 =?utf-8?B?WkxDaGpFeHZaVWhkZWtEcjAzMjNESEJ5ODZtN1B1TkdOR2JWUFltMnI3MzlQ?=
 =?utf-8?B?VWpWaTRaYnJLazhEVTA1bDhJYTNQWEtsTzVuN1ovU0d5dGtaNDFTVzF1WDEz?=
 =?utf-8?B?MW1FZnFqV2ZaMDg3b29NZmtjaVlMR1E1Y0dQQVJMT1lUTTFFNHFueC93a0hC?=
 =?utf-8?B?Mkw5MGxMR2J6TVpGWkZpTHhSaTVxT3JzR3lmUmpCM205MDRyQjFDdU1mRmcx?=
 =?utf-8?B?Vk5GKzhiZVpnbndSQ3lEYTloWW4vRld3dlF6VWlvalFZVlRrNXlpeENOMWxJ?=
 =?utf-8?B?UGdSME1WVDQ3dmFGcDBnZyszREdtZU8weWsvdkZ3UFZPbEVHNmhOeFVaeXVq?=
 =?utf-8?B?RXN3N29xa011N2p3RmlCM25xc25nUjc0cUxDMi9jblN4dGxYYlphL1YxYm5I?=
 =?utf-8?B?OGxKOFArUG90WGlPTXhUb3VQakJiTEc0K2pJK0I1Z3FSNkptdzR0RGlKYXU0?=
 =?utf-8?B?L1FFQmJNRHZkUEhCeFBHMWRidFZQT0ZSSXZVMEJYZUxpL3o0MklMK1FBWEs4?=
 =?utf-8?B?djRIelN6aUVpQWI5M1hWbFdieFYrUllMMXFqU054VVp2UUlzYVVteHpxSDFS?=
 =?utf-8?B?N2N3UHhHRE1Sd2h6akxRdnQxbVNPR3B6OGh5a0VuQnNEaHEwUlZpdUpKTmp2?=
 =?utf-8?B?L1I2QnhmZ0FudWhUSTBxd29IUUNIR2Fob3QrTGhqYnBNbkd3a0N1SzJMVWxT?=
 =?utf-8?B?QlVtb0tmOTdFYVJUWFp4MWkxY01rZEl4MVlXUGdWd25hbnFMc21TOWVYV1lD?=
 =?utf-8?B?ZUlYN3NIZUhoMnBEYVBsUmpJM0gyWFF5dG5sUTZ2ZTE4TlJybG8xTVFUVHR2?=
 =?utf-8?B?RUpRb2NxRE1xSDdGZEo2U1RxaVI4TmV5VjY0UzZpellLd3B2eVJoMnBYcWdW?=
 =?utf-8?B?RWxkcWp3WTY0MTBmbUlSbjBaN280YkVHWUdYN2szVkNkSkd6ZUt0bUQyRG16?=
 =?utf-8?B?VVFrUFNMVmJia2JsQTFabCtCQ2dueWdTME5OK00vbElhVHN4Wm93NzlJYjBP?=
 =?utf-8?B?U1NrTFlOeWN0T3lhcGxzbk1UNUl3K0tPV0kzK0lsUnJ0Vzk5NC9mdS84MHdv?=
 =?utf-8?B?QmJwNDl3N1g4UCtQLy8rd2pOMEpyY3ZrQ2I5RDJWbndiNnlId083WnpaWUlV?=
 =?utf-8?B?T0Q2cG5tL1J5emhLd210VEtNVGV5UFpXdW1ZdFZjSmcxcXA5bUJmdjllMVE3?=
 =?utf-8?B?WmhQbjdtZkl0Y3RmZVJ0SkVVQVNLWHRkaS90NnI3dCsvSUtvVkV6bURORFJT?=
 =?utf-8?B?UVIyQUJNYkllRnl1Ni8vb1c1bHZOZ2xBZUhXOG1GT24zSDVWMUdkY0lMZHAw?=
 =?utf-8?B?K1UyYVkwUDJ3MnB4S0l5bWJPclpmSUc4dG9RYzNiQVFxekJxcXBZOXJ5cnRQ?=
 =?utf-8?B?d2JkSGZDbGJBTzkwS2FvampwWmtkYVJtQ1VqVGg2Y2Q3cnVLUHI3L2VGd2lR?=
 =?utf-8?Q?4kCjcpzR11A=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M002YXc2MzcyY1VEWnAxaXlaMi8rYlJUaHRsaVBzQXU5UGs1Ymp0MUJHamJY?=
 =?utf-8?B?N1AxaW9lc2RDMm82WG54VEpHQ01TY08yN3hHQTRKQ0xuSHNIcFdlUlJiQXBR?=
 =?utf-8?B?RjltcDFPYWVPZU0xbjIramhUeW15U3YrZm8wY0JpaGVBMElLQU1UMXJTelor?=
 =?utf-8?B?WU40SE5WU1RtQi9heUNGdDRiRHU1SW1PSWplcm9VV1FNWCtWUWFZQ2NkNG05?=
 =?utf-8?B?SlJCUHN3eEJITTFGTlF6QSs1QTJBdXNWakRuWWRjbE1JUlBvc3grQjQxNzdO?=
 =?utf-8?B?SDcxQUtiV2l1ekFZeTQ1OHRSV00zckgwWThKbTQ5MU5EKzZoVG5weVkxYXFv?=
 =?utf-8?B?M2RNZWl2YkFZaEpRcU1Xb2dkeWJ4dXpBTkcyUFRlOUpvWWl3RHEyMUozUll4?=
 =?utf-8?B?b1hWMjQvS1phZ2U5d3AyWGVGNC9mOUxpN091Q0ROY3dPMVpVQUJkWWZWV01w?=
 =?utf-8?B?ajUzMThQdy9STGdzWWZ0ZTRGMEdvSnNGWGtkdGE1aDhBWCsrSlI5OWV6T0tk?=
 =?utf-8?B?NTFZejZ1QkNuTllYcG9lYzdkVkVvOWJ3YU5vWEI1bk56Z1pCQ0xLcTcycUhW?=
 =?utf-8?B?U29DaERZdkhrZXMwSEtIRk9DanFMdjBCWHlENmw1cVNObUF2MmM0ck1iQ2I3?=
 =?utf-8?B?VU8wRG5oUVl2SXhCenRKeVpmNk96NWFXWmptc2FtV3RiOWF0WkJKeW1DQXJv?=
 =?utf-8?B?V1ZXSWhUdUhZWTJ2aHBiYVREOWZZTmZVZlluSTZhcTR4MEg0UjdKQm8vVWdm?=
 =?utf-8?B?SmJJbHNEeFZwQXg5RmNudW4yNS9yS3pncEt0a29sL1VrWnJDYjZ2Rkc1NFpn?=
 =?utf-8?B?KzJXV1N3NDhWdVcwbDlOWUNYd2h4S003K0JvbkFCWTYwNjNkTWgyQ2JGeE5Q?=
 =?utf-8?B?WTRqZmlNVVFuNGtQWWRsVGtGOXJtRURUbkZ4Uk4vNDRPYkI0cU9EQ1JTVUlQ?=
 =?utf-8?B?dFh5TmZYZ253V0N0UTczZmJXSzJacHBPL1hCK243RE5mUFRyV0J3ZnpDd0VS?=
 =?utf-8?B?MU92MHhpYXB2VjdNc2h0c05Jd2Y2aUZRcmZ1WWpEdVVoU3hmSm5uQytnNm8v?=
 =?utf-8?B?a3pHUi9IQUQ4bHFCdHduUDNOTVI4ck9sMWhPK1RGL3dCQmVRMis2S2I2QWdq?=
 =?utf-8?B?cVNyMC9YODhkWUxWdzdnRlVFSHI2QlgwVWw3Tys5UmtYNS8zMWh5ekxOWm5T?=
 =?utf-8?B?SC8remRkNWdWWGUxU05PRS8yUTBTVjBQR0ZIMlFMTCtyZWpkU0RwQ013VWQr?=
 =?utf-8?B?ZG5VMFFobTNKQ1VleHNuNGtDa0o5OTRySjQ3UFRmK3lGQ1hwMDlpa1lYOWg1?=
 =?utf-8?B?OTFiVjRiUDRWQlZQblVYbHF0WDRTdk9YWElFZHYvN0lqQnc0dmlkd2t0VWt4?=
 =?utf-8?B?T1NnMFFFcm8rMjRBM0s2M0dyVmNhVlBoVG1kQlloa0g5MmFMZHd6MkdEc2V3?=
 =?utf-8?B?Wk44K0NNN2lnNjRseGU0a3hwMkNqL09MT1BVVlF6VGdkL0UyY3NleWRxdlZO?=
 =?utf-8?B?WXhUeC9ZeVY5RWgvbGFxV3o4YkNkSkpmcVg3R3UvUE5ES2xkQUF0bW54NTdC?=
 =?utf-8?B?Qm9pWitidFdrQUdpNWJYT2hXWGRtWHlmWGNDYWs3eTkvVGh2NzhZakdhaUdM?=
 =?utf-8?B?QS9hNUoyTXdBMnEyNllqN0VkUUQrSUJpUlR1Vnh1V3FyT3BIVVZiTkV0UnFa?=
 =?utf-8?B?enBGNlc1cjhRaVhKOEFab24vVTNDVWcraUg1MTJTdEV2NUdDU0g2SzFGeW9Y?=
 =?utf-8?B?VEV2VENmVy9aSngzK0xkWjc5Q1NpSEY4Z1Y2Z0xiVWQySjk4WnpBY0FxNmQ5?=
 =?utf-8?B?L25hWXRCQSthcnNCZWVEUTRPRzEreXAxQUJSN3ZmZFJONEg3bVhyRmY2WGox?=
 =?utf-8?B?N2FaZkhkbVBWT2ZrZG9MbjJaeDc5cUk4Y0xXL2JLL2dZbCtVQ01zd0JMRDJM?=
 =?utf-8?B?UURaN3M0V3UwdkdlYmVPaXlidHNSa1JwT2Z3a2Vtay9kNVV1MDBETDd2M3ZZ?=
 =?utf-8?B?UUJsYTVYSXM4aVg0MFFwTk5BZExEbUtGMnMvWlE0RUVjcW9RdHZiZGVQcFUw?=
 =?utf-8?B?SlJWVkpkSW9rMzEwc1ZibkxLc3dKWEtlRndhWGtaeG1Wd3BQczRpckVBRXpK?=
 =?utf-8?B?L3MyK1VOMWQ1ZW11VFlydU9xd2c5TU1iQ0J3TWhNSDNCU0w0a0JvL1NZdHBi?=
 =?utf-8?B?a0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2be5b0ef-40f1-43a6-3a7c-08ddc2daf0a8
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2025 13:32:55.5004 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M1sjYSx7jrD6a5voIBY2UeRtdmi5DDzm7B8siylla+NJYNu0rMkQxrP9C4dRUEXBJ1HRF91PUvPh7PYPInxAXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8804
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

Quoting Peter Senna Tschudin (2025-07-13 08:23:53-03:00)
>Previously, all igt_hooks were defined, initialized, and freed within
>lib/igt_core.c, limiting hook creation to this file. To enable other
>libraries to add hooks, introduce a function that returns a pointer to
>the main hook structure.
>
>This change allows hooks to be created from external libraries without
>requiring separate initialization or teardown of the hook
>infrastructure.
>
>Cc: Gustavo Sousa <gustavo.sousa@linux.intel.com>

This e-mail address does not exist. :-)

>Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>---
>
>v2:
> - change function name to igt_core_get_igt_hook()
> - remove duplicated documentation from header=20
>
> lib/igt_core.c | 12 ++++++++++++
> lib/igt_core.h |  2 ++
> 2 files changed, 14 insertions(+)
>
>diff --git a/lib/igt_core.c b/lib/igt_core.c
>index c2674a272..4bfffc3a8 100644
>--- a/lib/igt_core.c
>+++ b/lib/igt_core.c
>@@ -3604,3 +3604,15 @@ unsigned int igt_measured_usleep(unsigned int usec)
>=20
>         return igt_nsec_elapsed(&ts) / NSEC_PER_USEC;
> }
>+
>+/**
>+ * igt_core_get_igt_hook: To allow for using hooks from other libraries, =
this
>+ * function returns the pointer to the struct that is likely already
>+ * initialized.
>+ *
>+ * Returns: Pointer to the igt_hook structure.
>+ */
>+struct igt_hook *igt_core_get_igt_hook(void)
>+{
>+        return igt_hook;
>+}
>diff --git a/lib/igt_core.h b/lib/igt_core.h
>index 2db579423..e658737b0 100644
>--- a/lib/igt_core.h
>+++ b/lib/igt_core.h
>@@ -1601,4 +1601,6 @@ void igt_pci_system_cleanup(void);
> void igt_emit_ignore_dmesg_regex(const char *ignore_dmesg_regex);
>=20
> unsigned int igt_measured_usleep(unsigned int usec);
>+
>+struct igt_hook *igt_core_get_igt_hook(void);
> #endif /* IGT_CORE_H */
>--=20
>2.43.0
>
