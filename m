Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91E1BCAC5B0
	for <igt-dev@archiver.kernel.org>; Thu,  2 Oct 2025 07:50:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48D5110E0C8;
	Thu,  2 Oct 2025 07:50:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bAjOMmX1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3956610E0C8
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Oct 2025 07:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759391406; x=1790927406;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PFQ5PsYNA1lq/VKuwm/WT79QSG7WwKSvU3judDH+Zys=;
 b=bAjOMmX1GcklnEnwvwUYcj843l1X3rnrOyx76D3rRhZyMYXS693TWwCG
 K7xo6YUxauV4Q45APPYaOZWANVVG3fFGeiam815zfB6KsTVF/4AglHFLs
 9hFSts3ca2p+ob9StAE/x8tTwWD6q1PgxEYoJRgqw4YiQcgsa7qrTF81T
 5Ef2AQ8KKI3LKehCLdOT9ZNiu/GeTNnm255tFOQrADvU1yneXXMcDZBhx
 uPCMQ+4qDAzWk6jL3JTe4ZfFcbQhWkODBUKM7rl4Ljp6oBXtpYedIo8y9
 b7S43JQCXiOQTcaPeyzSK/yMJ7kBSkB3i7kX4cBEZAqjupjIJZUcFVIB9 Q==;
X-CSE-ConnectionGUID: +2c2paKxQBai623BbplxBg==
X-CSE-MsgGUID: 4iENo+sNQOmIu4XixZ5fyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="61562180"
X-IronPort-AV: E=Sophos;i="6.18,308,1751266800"; d="scan'208";a="61562180"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 00:50:05 -0700
X-CSE-ConnectionGUID: 8QbbAYv6R2SS1IGXx2YdJA==
X-CSE-MsgGUID: FxPCwjjuQ0mRf0gx8SrAKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,308,1751266800"; d="scan'208";a="179397313"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 00:50:04 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 2 Oct 2025 00:50:03 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 2 Oct 2025 00:50:03 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.33) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 2 Oct 2025 00:50:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yl4Okg9y8RbaJa//eAtMZJ0fhfkXDJ6SuOcEFO7FC+Lm8ut6KgBGaQR4RfvqT/QlMW96tnet+He+SWXuT3T4aA0W7z5nRaiFtxtDSQ3UIEAvBpahelUSLwrtKfFRE0aqB7WHh7rR0iE15lJXQ2lSaSsZRlHhzFEAG3j6LhF9ZeA/5fe1fkUssyPkS4al29sxXlA+MIWCjNJcUIwBcHgl23i7KK+CnZVNf+xC1d15ah6bkWWIMBIQ7OFm0NnspfuXXd37Ju9G7n2ujH3c71MGD+Yzynb4UMcviVokUSEWe78thhmMVdSne46fd0wRpkTag5k8ejXiS8Ye15YSpl1emw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PFQ5PsYNA1lq/VKuwm/WT79QSG7WwKSvU3judDH+Zys=;
 b=KIlGtWUq87lbjaCrqVBBx44RD2FuPIeTIfb9joGs48vmd9seVT4B3Kkhs0ugKFPuBItigSaXp9KbqDR45CsYb0NoD5hoasV+yrqgLkSDN37O3xCUh/pz/bvdGqYvLlgkHSRr8ZaxHpxJ+GuI/FFQPgOy3b0AqBg9/4OcthccT12z1+J5loJk4ly+hDgQCaOberPdE99FvLbA45p03Ap5liM7vorXuccUWo6IdJ+H1dHsrEcHL3U+kSZnXx5QkkKHgdQUxGJblQcxFThfiJpuqki/5qH5EblqrJ8Qw3SMaTeifQ077kXUws89WOhjuR1jA9REtmSrg3N+xX8R2olOPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7264.namprd11.prod.outlook.com (2603:10b6:8:13b::5) by
 SA1PR11MB6759.namprd11.prod.outlook.com (2603:10b6:806:25e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Thu, 2 Oct
 2025 07:50:02 +0000
Received: from DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7]) by DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7%4]) with mapi id 15.20.9160.017; Thu, 2 Oct 2025
 07:50:01 +0000
From: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>
To: "Manszewski, Christoph" <christoph.manszewski@intel.com>, "Kempczynski,
 Zbigniew" <zbigniew.kempczynski@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Mika
 Kuoppala" <mika.kuoppala@linux.intel.com>
Subject: RE: [PATCH v9 i-g-t 01/10] lib/xe_eudebug: Fix safe_pipe_read
Thread-Topic: [PATCH v9 i-g-t 01/10] lib/xe_eudebug: Fix safe_pipe_read
Thread-Index: AQHcMspIx6+8+wzq5UikvYejqjQHHrStMXQAgABglYCAAOgMsA==
Date: Thu, 2 Oct 2025 07:50:01 +0000
Message-ID: <DS0PR11MB72647F3EE3DFE97EE0EE3FE4D9E7A@DS0PR11MB7264.namprd11.prod.outlook.com>
References: <20251001115447.11843-1-dominik.karol.piatkowski@intel.com>
 <20251001115447.11843-2-dominik.karol.piatkowski@intel.com>
 <nfbsoyylux5qyvteu7xcuiwteamx2zjry4x6fiyj4u6ve2ghke@yzttaaj55nc3>
 <ddb7f247-9bc0-485d-9c5f-89bae340eee4@intel.com>
In-Reply-To: <ddb7f247-9bc0-485d-9c5f-89bae340eee4@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7264:EE_|SA1PR11MB6759:EE_
x-ms-office365-filtering-correlation-id: 4a868017-6b98-4833-4c68-08de01884b02
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?NVZkMVJrRkVZRHFQazRLREgwaHltSE50TXN0STByRW0yc0ttSVljUkI1Y2Yr?=
 =?utf-8?B?OGRDOHg3Y2p5RkhOTkxoSDF4d0JJSHIrK3Ric2p5RllieG9WZG5BaG4zSzd3?=
 =?utf-8?B?endNY1ZDN0s4Y2VaL1ptRDNRYXoyL2RwcmpGZHRNTWF0VEFQMk5zSEZEdE9L?=
 =?utf-8?B?aWVqREVEUEtCdVE2ZXBySlhJYW9IbTV1cXl2eGUwUGMwRy8xZjM2eERXZ2pa?=
 =?utf-8?B?dlppZk1vbGlRM2NvZWozdVRQSHFZVFVwR3BKSnVmV25LWGo2ME82SG1IdGV6?=
 =?utf-8?B?UHNGREtianY3eFF0T09PSnFUUW1DTnpOWUMvRnVhYng1WFNVZE5VK0RCblpY?=
 =?utf-8?B?Rlp0QjBVdWd2UkVnT0RoMFNWTmU4Sk9NR0d2VitPR2ZrL29ocXNZOHpTR2tV?=
 =?utf-8?B?eDE1RWhRVWJ2L0o4NXJmdS9qTUVqeHlwMWd0dnUzNWRtL25OTDB6ODNtRmwx?=
 =?utf-8?B?Z1pXdFczVXZhdm5YajdESzJ5TmJrWTFEQmV0cVA1VWZ1TUlkajIvNmZCQ0Ez?=
 =?utf-8?B?RjdscFZuVU92VmwzZ2NUZVlndzJPRWptNXQzUDBjcVJRTkZWdWZHejIzRjFC?=
 =?utf-8?B?Z28yaXdUMGNlUk5HUmM4RmJZVTVzOVd1dHNTUXZ5NTdpQ2Z0Yk50WXA1QTB2?=
 =?utf-8?B?Z0dvSHpFZWc1eXZmL0dhSHhrVm1hWVBWa0RjRlBEQ0EvMHRIYmd5ZC9EOXNW?=
 =?utf-8?B?TDdwak9LMy9Ibk9sZFF6dVdSMGh3TEVFQTdYQTNuTGV3dWdkMnlBdURVdWlG?=
 =?utf-8?B?VGhydFB5YmNlU1U5aGVDM1lHb1M3N3FQMmJrRXZIWHBMaTRrNjJCenV1UFho?=
 =?utf-8?B?SGR0K2FzbGo0S3VNV0t4RXJNZXZxRWI0eisxeTBlbXhkeGFDTEJvdGRIelo5?=
 =?utf-8?B?b3BaSUs2WUplb0FldGUxcWVRRTNUcEtkOEEwY3pCY0R6bU1xNW1oaGdSVktG?=
 =?utf-8?B?Vk5FNkVXc0I1NGVjS1M3c1RVNC9UeHpLcVB2eDU5aGlneGplT05KazNINDlG?=
 =?utf-8?B?Q2ZvZW1KTGkwc2ZrNnFJZ002TlB1SjRkYkUwbzlkYVBOOGpCTHhhblRjZkJO?=
 =?utf-8?B?M3ZRODAzbnYva3BQUEEyenNiaVkzaGR1OFRkTTdzY0RxNmVlVlEwbEgvNXVq?=
 =?utf-8?B?a0psN1lIVjJmY08xTGhob242MXdvSVAweDdDOHp4QXE2MGJQS0I3ZnV5bjVw?=
 =?utf-8?B?N1JDYWsvQjgwTEQxYWUzZFpCK0QxU2V4NXlwb1RoSVRmaVBHdHM2ZWx0TW52?=
 =?utf-8?B?SGM2MUxCZ1FKMDh3U0ZJUUFxS2M0ZmVYajdCZHROQkFBNVJjSmlTMTV0aFZo?=
 =?utf-8?B?TXk5QWZwemF1RFZRcVIrWUIzTElBdHUwa0JlSDYzZEZ1bUdjTWVLYXNMN0Fk?=
 =?utf-8?B?dGl3WmxLclVkbFBUWjFsNEh0VThZWHhHRTBzQW1mY2haMGtjMENtL0MvMWtx?=
 =?utf-8?B?M0t0L3Y5TnJwdTFCRXhKT0lNR3UrdUxPRlBDRnJoNlZpUStQTjQvYnlMYXNq?=
 =?utf-8?B?Lzl4REtnVER0a3g1dkQweGhEQzMxemF5VEtHaTlyV0Vra3lRSVhJYitSbDVO?=
 =?utf-8?B?d09keE8xaWNIajA1RFI5VXAxU1VlQStNd1U0YTI0Nm5CN3RxazJwR1pXTmhV?=
 =?utf-8?B?SGpja0ZhYVVpRW84UjlBV1dBa1JUeG1UNGsvZ1hxQ3pVYmlHbmMvS2Vrdi85?=
 =?utf-8?B?UWhvZVJ6enIzKzk3cmc1a2loRHdvN0hNU2ZDV2NvcG0vNjJqNHJVeXdseVBJ?=
 =?utf-8?B?MEVaRm93TjMxZ25IbGZobXFjaW9icVBOSGxsQlhJTUprUVorOFJGSnE1dnJy?=
 =?utf-8?B?VndEem5LclltbGNlOEV1czU5aG9QNnd2eXV4UnNKMkJyN2VqUWVxL0xCZzI3?=
 =?utf-8?B?d05sT2N4UjZDUUYxN21nR2xjVUdlVDQ3TGpCSG5sRys4TnlzWlFDbFVzampW?=
 =?utf-8?B?RlhaaXFPa3JyWlRDTFF0eWkwR2NnOVFTNHRJYWhucWY1ZWplYnhFeHhqcDJX?=
 =?utf-8?B?TzVaWVRyS2ovUk5tSmt6MVc4em51K1I4dXhGSGl5UTZpcnFWY1oxTS9aMDJm?=
 =?utf-8?Q?s4g1FF?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7264.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MmJJMkM5TlBjUi8rNk4rUDUwempoZXdHWGNnQTlZK05OR24rMm5zak5kZmxW?=
 =?utf-8?B?UDdmVnZoUkNWWWloUVBzMWN3a21qYVZWZmpXRkNiTkdsVTFZdjA3QXJQb1gr?=
 =?utf-8?B?RXdKaWo4R25Fc0ZZWW9Gcld5ZWVZQWdFUmowcXQ2bVF1NTRFWGxKbmVjSGU5?=
 =?utf-8?B?LzN0ZklDeUZKMFRUWE9KNTBMU1d5NXl1UWZDUnlwcGU0MFJGVjZnYVJkWXRy?=
 =?utf-8?B?K05nOWExWGhRbjE1ZDY1dkFlTGhIOVRyaEFHS3JaSGVOZCt2WlFGMDdVb3VH?=
 =?utf-8?B?SGZqditKZ3FveWFGY04xbWg5Q0pMVkVSeTg4bCtHd2U3ZGR2YUk5Sm5oTVVo?=
 =?utf-8?B?bWdEc3FuSW9seXdPbFZrRVU1THc2NDVQL1FQdkpkQ0RPZlYyQy9Uck1teHVL?=
 =?utf-8?B?YXNpK29tajFzdnhYV3JObDJYVXBSYTZQVlBLWHZVUGJmUlU0dnBzaFRYVjJq?=
 =?utf-8?B?VGZuREVqUTl4ekplVUs2R3BDc1c5RFZXYWJCZjJuaVREL0RWaXlsd1V0K2xP?=
 =?utf-8?B?LzkzNVZVc0M0eXFPbWs5T0hYYzhZVSszeTlMMTcxZVArTTlOcXJibWI2MUwx?=
 =?utf-8?B?cittQUJtUjh5ZnBsYkN1bHQvVUhqdnpQbk8zRWdUN21jaVdJV3JjSlpOR1B5?=
 =?utf-8?B?M3oxcXpDbnh3NlNmVURsUnFPZElJdFJXV2JqbStKbHBHa1AzSE5zVjdmV0th?=
 =?utf-8?B?K1NwNkVFKzBVdHE3b1Fod0U3eVhIRVNVbWdBd1pyWDZpaVBRVlNycGVXcEdI?=
 =?utf-8?B?N3FkeVd5RWdqMUR3Uys4SnQzREYreU1XaVdDeWphbFNkQ1JROHg5MjdLWW5Z?=
 =?utf-8?B?NnpRcmpuZ2hOQmxIK1A0c3BBLzhUN1owazRWY1ozVlNIdVNEc25lSUpUR3hK?=
 =?utf-8?B?eldoeDk5N3JNRkhlUnRSQmlRT1NabDVwSUhwWDFRYWNQYkVXSlM2c2NPRTA0?=
 =?utf-8?B?bFB6MDVsTXdRWHQ0RG1JTjY0QVhNTmhYemZZdjZBbTNTMzl6QkN1Vm5MTzNZ?=
 =?utf-8?B?K0JQNjk5cVRFTTNES3FUdXMxOVFtNndjWUozY1NjMXM3S3F1WVQrQ3pwY1V5?=
 =?utf-8?B?U0kzdmJtYVZPcnNqZFduMlVQemRhSDhlTTdBV0FkUzFWMG9JM2IrYldobXJy?=
 =?utf-8?B?dlB5WGlaUlRyZWg2cW5McWQ4cE8rNlJwZkVxY2VnUHNVQkZ3cDJmWTE2TWtW?=
 =?utf-8?B?V2EwSjZIeTNmd01pOEY2SzQ2bTdWV243YndQUTJEL2diamNnOVJnN0JKR1Ix?=
 =?utf-8?B?S05VUzFtNU8zM09idXZ2VTlYSE1XRWhwL1pkbkI0a09qZStUelpQVFZxaWFY?=
 =?utf-8?B?UmhRNEtzSmJrTzBkSzVCalc2bnhIN3NseUYwVUpoZ2hVYnVtYkNNeE9vem1r?=
 =?utf-8?B?aUFkM09vc1RtdU1lNzV1VzF6THRvbzA4dWFFdWNaakdTK0xIbU5kdkNrQ1dx?=
 =?utf-8?B?VW5JVlVxUFRZMWdLYTZFU1hCbUVEUnA5LzZRRDR1MjJTM1I1aE02Y08zNm43?=
 =?utf-8?B?cHBsWTN5QkxrTU5BR0pBR0ZyWU9JSlJjbzVkUU9qZEhSOCthOXdGYnZEUEp5?=
 =?utf-8?B?bjc2STNqZWpDaWEwQTFETVpTaVdUWkJtS1FVZUFPc0lkczlVQmh3MGRoUXdD?=
 =?utf-8?B?U1NmMDRCdE1oT3ZVMU9YYVozTFViOVRZaHg5Y3BhK0lGc2NSOFg1Z05lTG9K?=
 =?utf-8?B?WFVnaEdxWS96aGpUNWV4S1FDbDBZVFphNnZjNzBRanJmM0Q2S1U0QnpFT0JX?=
 =?utf-8?B?WjhSdTRVZUg5cTh4c2dtZUtzYnd1RzMxTkJzQ3hCSmZiejV5dzdBM3Jlc0Ny?=
 =?utf-8?B?ZHR4K3dQK1Q5MlVhcjlGeUhRbkt4K0FsVXN4aGwzamMyeGE1YWZ6MkJSa01t?=
 =?utf-8?B?WGxiZ296b0xZcU5sS2dOMDBNVllWSXoyT0VtcHJJL2tqSjdJQUVqSG1Idmpq?=
 =?utf-8?B?NTZWcE81c3pGQXZTMXp1ZDJQejRtNnV3bXJOdDI0a29KSzBEUjhncENLUUZw?=
 =?utf-8?B?S2x2M0VKWXpBeXZ3RW9DcHBNaStuaGJ0TE4rYnVYZlBMY2NkelRSTlIzQmcz?=
 =?utf-8?B?c2ZkZFdtOGc2SzJtV29SR2FsUWk2QmZjK3JwYVdmOERVKzIzVFpESjM4NzFQ?=
 =?utf-8?B?R3NUQUZyT0psUmdXVVFRUGhqTUJVT3RUYVhISk84eDJtV1Y0MnhidU1pTm1J?=
 =?utf-8?B?dmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7264.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a868017-6b98-4833-4c68-08de01884b02
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2025 07:50:01.8573 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Foi2rR9MXOlTwkmCJCWaj2D/wTOwnhd8Hy7WEoK7WUTUK39JvT3vD8sRZabvb3ylrSqLR5wy2nv3JJ+Ua9DpYMUeGIuBKJPUmhaVI8+asS4UT7Wug0W0SEqA6tOoL8ht
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6759
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

SGkgQ2hyaXN0b3BoLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IE1h
bnN6ZXdza2ksIENocmlzdG9waCA8Y2hyaXN0b3BoLm1hbnN6ZXdza2lAaW50ZWwuY29tPg0KPiBT
ZW50OiBXZWRuZXNkYXksIE9jdG9iZXIgMSwgMjAyNSA3OjUwIFBNDQo+IFRvOiBLZW1wY3p5bnNr
aSwgWmJpZ25pZXcgPHpiaWduaWV3LmtlbXBjenluc2tpQGludGVsLmNvbT47IFBpYXRrb3dza2ks
DQo+IERvbWluaWsgS2Fyb2wgPGRvbWluaWsua2Fyb2wucGlhdGtvd3NraUBpbnRlbC5jb20+DQo+
IENjOiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgTWlrYSBLdW9wcGFsYQ0KPiA8bWlr
YS5rdW9wcGFsYUBsaW51eC5pbnRlbC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjkgaS1n
LXQgMDEvMTBdIGxpYi94ZV9ldWRlYnVnOiBGaXggc2FmZV9waXBlX3JlYWQNCj4gDQo+IEhpLA0K
PiANCj4gT24gMS4xMC4yMDI1IDE0OjA0LCBaYmlnbmlldyBLZW1wY3p5xYRza2kgd3JvdGU6DQo+
ID4gT24gV2VkLCBPY3QgMDEsIDIwMjUgYXQgMDE6NTQ6MzhQTSArMDIwMCwgRG9taW5payBLYXJv
bCBQacSFdGtvd3NraQ0KPiB3cm90ZToNCj4gPj4gSW4gY2FzZSBvZiBwb2xsKCkgZmFpbHVyZSwg
c2FmZV9waXBlX3JlYWQgcmV0dXJucyAtRVRJTUVET1VUIHRoYXQgY2FuIGJlDQo+ID4+IG1pc2xl
YWRpbmcsIGFzIHRoZSB1bmRlcmx5aW5nIGVycm9yIG1heSBiZSBkaWZmZXJlbnQuIERvIGFuIGVh
cmx5IHJldHVybg0KPiA+PiB3aXRoIC1lcnJubyBpZiB0aGUgcG9sbCBmYWlscywgdW5sZXNzIGVy
cm5vIGlzIHNldCB0byBFSU5UUiAtIHJlcGVhdCB0aGUNCj4gPj4gcG9sbCBpbiB0aGlzIGNhc2Uu
DQo+IA0KPiBUaGF0IG1ha2VzIHNlbnNlIGhvd2V2ZXIuLi4NCj4gDQo+ID4+DQo+ID4NCj4gPiBM
R1RNLCBidXQgZm9yIGJlaW5nIHN1cmUgbGV0J3Mgd2FpdCBmb3IgQ0kuDQo+ID4NCj4gPiBSZXZp
ZXdlZC1ieTogWmJpZ25pZXcgS2VtcGN6ecWEc2tpIDx6Ymlnbmlldy5rZW1wY3p5bnNraUBpbnRl
bC5jb20+DQo+ID4NCj4gPiAtLQ0KPiA+IFpiaWduaWV3DQo+ID4NCj4gPj4gU2lnbmVkLW9mZi1i
eTogRG9taW5payBLYXJvbCBQacSFdGtvd3NraQ0KPiA8ZG9taW5pay5rYXJvbC5waWF0a293c2tp
QGludGVsLmNvbT4NCj4gPj4gLS0tDQo+ID4+ICAgbGliL3hlL3hlX2V1ZGVidWcuYyB8IDQgKysr
Kw0KPiA+PiAgIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykNCj4gPj4NCj4gPj4gZGlm
ZiAtLWdpdCBhL2xpYi94ZS94ZV9ldWRlYnVnLmMgYi9saWIveGUveGVfZXVkZWJ1Zy5jDQo+ID4+
IGluZGV4IDY2N2MzMWM2ZS4uODQwYjUwMWM1IDEwMDY0NA0KPiA+PiAtLS0gYS9saWIveGUveGVf
ZXVkZWJ1Zy5jDQo+ID4+ICsrKyBiL2xpYi94ZS94ZV9ldWRlYnVnLmMNCj4gPj4gQEAgLTI3MSw2
ICsyNzEsMTAgQEAgc3RhdGljIGludCBzYWZlX3BpcGVfcmVhZChpbnQgcGlwZVsyXSwgdm9pZCAq
YnVmLA0KPiBpbnQgbmJ5dGVzLCBpbnQgdGltZW91dF9tcykNCj4gPj4gICAJCWlmICghcmV0KSB7
DQo+ID4+ICAgCQkJY2F0Y2hfY2hpbGRfZmFpbHVyZSgpOw0KPiA+PiAgIAkJCXQgKz0gaW50ZXJ2
YWxfbXM7DQo+ID4+ICsJCX0gZWxzZSBpZiAocmV0ID09IC0xKSB7DQo+ID4+ICsJCQlpZiAoZXJy
bm8gPT0gRUlOVFIpDQo+ID4+ICsJCQkJY29udGludWU7DQo+IA0KPiAuLi50aGlzIHdvbid0IHBv
bGwgYWdhaW4gZm9yIEVJTlRSIGJlY2F1c2UgcmV0ID09IC0xIHNvICFyZXQgaXMgZmFsc2UNCj4g
YW5kIHdlIGV4aXQgdGhlIGxvb3AuDQoNCkZyb20gcG9sbCgyKToNCiJPbiBlcnJvciwgLTEgaXMg
cmV0dXJuZWQsIGFuZCBlcnJubyBpcyBzZXQgdG8gaW5kaWNhdGUgdGhlIGVycm9yLiINCg0KUmVj
ZWl2aW5nIHNpZ25hbCBkdXJpbmcgcG9sbCgpIHdpbGwgaW50ZXJydXB0IGl0IGFuZCBpdCB3aWxs
IHJldHVybiAtMSB3aXRoDQplcnJubyBzZXQgdG8gRUlOVFIuIEluZGVlZCAhcmV0IGlzIGZhbHNl
IChpdCdzIHRydWUgb25seSBvbiByZXQgPT0gMCksIGJ1dA0Kd2Ugd2lsbCB0aGVuIGVudGVyIHRo
ZSBlbHNlIGlmIHBhcnQsIGNvbXBhcmUgZXJybm8gdG8gRUlOVFIgYW5kIGNvbnRpbnVlIGlmDQp3
ZSBhY3R1YWxseSBnb3QgRUlOVFIgLSBpdCB3aWxsIHRha2UgdXMgdG8gdGhlIGJlZ2lubmluZyBv
ZiB0aGUgbG9vcCwNCnJlcGVhdGluZyB0aGUgcG9sbC4gQW0gSSBtaXNzaW5nIHNvbWV0aGluZyBo
ZXJlPw0KDQpUaGFua3MsDQpEb21pbmlrIEthcm9sDQoNCj4gDQo+IFJlZ2FyZHMsDQo+IENocmlz
dG9waA0KPiA+PiArCQkJcmV0dXJuIC1lcnJubzsNCj4gPj4gICAJCX0NCj4gPj4gICAJfSB3aGls
ZSAoIXJldCAmJiB0IDwgdGltZW91dF9tcyk7DQo+ID4+DQo+ID4+IC0tDQo+ID4+IDIuMzQuMQ0K
PiA+Pg0KDQo=
