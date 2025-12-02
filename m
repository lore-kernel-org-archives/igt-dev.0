Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED268CFD376
	for <igt-dev@archiver.kernel.org>; Tue,  2 Dec 2025 07:48:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A72A10E5C3;
	Tue,  2 Dec 2025 07:48:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UHwYVivs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4472E10E5C6
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Dec 2025 07:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764661684; x=1796197684;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=zbXrspqtDm0ZuvQDC6IPAgZrU24vtBl8vo/v2aK08m4=;
 b=UHwYVivsgPWBQGAnndCKFC8LKKZI/x62uvpU1GTk0w5O3Z6K1wDNk3qZ
 rbrv9OHjhCaVzIA/RcZKrnezjgS7VTzgVlwaM+jMqzWYo28VWg59KHVmi
 2YS18RXRbbVhz3m2COuC8XyRjo92WsR2QilKd41dHWHuGuWiGeG+XiUkY
 uYVhmzacnrHgdUoIY6bYGhqy9cubZn4yUkuD/i8w4wek3JESMyi5ZGSt/
 vSkbZW6borIWEA3ZCdFWylO19jRVDtDcj3YqPwfSMq6huMyJG9bxr3/sZ
 fX86m0fcG6VBT3Ih6oXmjNIgyynzj9s1Ixn990buDOXpL5aFNnWkgVt3G g==;
X-CSE-ConnectionGUID: KCjsZUT7RKSF+9I+uVOu+A==
X-CSE-MsgGUID: DnxcwuFcT9C1s+YojQN4Vg==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66509747"
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; d="scan'208";a="66509747"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 23:48:03 -0800
X-CSE-ConnectionGUID: +uoknRdaSdaxs/JvtCGjFA==
X-CSE-MsgGUID: oHNPX/2gTn23u53bOBo61Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; d="scan'208";a="194189823"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 23:48:02 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 23:48:02 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 1 Dec 2025 23:48:02 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.46) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 23:48:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pwc699CoU10lbuTmJ0TNS60RrgQnchAGtatK4osL/iFaprqfq8kOm2/0IVig7rA8mnt/djKNJjc/sZgplWL51mDAs1tjIpxy0LeBmFmZlMXlvThbVSWbpZA+OJG9NaEjFdIL4K65/9CYg9oEDI3Kaa1Eljvw0/ZK2hf+QeRum/gyTABWa7N8+WKfimIwfPkauQoyjoWXFHhXYFt2cR04hOsQW6YM5xbAteqJVd+mJRcvCbxCrRTbXr8kj8mY+2SDTp6kIZwJq5nj03rEYOamBpfvcbnceO/kW/IPzkKrB2uX7lEkBXwg6LM7iErsAUR8Sr/3RCVN46VxOOpIbC8u2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zbXrspqtDm0ZuvQDC6IPAgZrU24vtBl8vo/v2aK08m4=;
 b=G1DdrL9sfOVMGukaVdZ3AggLwlErj4bYItZ1gvRzxTjS/RAtKO6QCsft6gLiZzf/v3mgEispSiGZEYK6a0sdC/uGonQDbdFN5xhuaMAxpn1lvaaL/QI3tm2H1oj861vabznELKMZiofz9xGOQdQWQ/vrEq76mfAEoKZquLN0R9NB4tpE6NNmjD+kwdA4/bAg1CuPRkDQ4lHbnkIXSEcl60GNi1+0s9nUCzqBUX3vcGEQdYDHXd2BmqDkTGOiAfUAwBSvcW+XL2bqWvy2sMfxoNfLlchnrJncephNAnvOBeh3XxcBm12Pnx1x1k5S6YDLgyDjepgPv67ROTba92ltuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7733.namprd11.prod.outlook.com (2603:10b6:8:dc::19) by
 DM4PR11MB8132.namprd11.prod.outlook.com (2603:10b6:8:17e::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.17; Tue, 2 Dec 2025 07:47:59 +0000
Received: from DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::41a9:1573:32ad:202c]) by DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::41a9:1573:32ad:202c%6]) with mapi id 15.20.9388.003; Tue, 2 Dec 2025
 07:47:59 +0000
From: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Sharma, 
 Nishit" <nishit.sharma@intel.com>, "Gurram, Pravalika"
 <pravalika.gurram@intel.com>
Subject: Re: [PATCH i-g-t v9 02/10] lib/xe: Add synchronous helpers for VM
 bind/unbind operations
Thread-Topic: [PATCH i-g-t v9 02/10] lib/xe: Add synchronous helpers for VM
 bind/unbind operations
Thread-Index: AQHcYqEuTA94mBgwUU+E2EAMvosbJbUN+rCA
Date: Tue, 2 Dec 2025 07:47:59 +0000
Message-ID: <96b1be299d8ac16040e2b22eddc67b5e95a4b5e3.camel@intel.com>
References: <20251121162537.77551-1-nishit.sharma@intel.com>
 <20251201090201.326595-1-nishit.sharma@intel.com>
 <20251201090201.326595-3-nishit.sharma@intel.com>
In-Reply-To: <20251201090201.326595-3-nishit.sharma@intel.com>
Accept-Language: en-SE, en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.54.3 (3.54.3-2.fc41) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7733:EE_|DM4PR11MB8132:EE_
x-ms-office365-filtering-correlation-id: 1f9fca4b-834b-4779-3379-08de31771d7a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|366016|1800799024|376014|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?UWtBeGJzOGNTcjRqaTZ1MGlwRTVFeUx0aWZqbTc5bEE1cWtiT1dlU0NrSk5z?=
 =?utf-8?B?dWR6MVJGeTFuUmQ2bDhLUXBnTFRIblpYM09aSjdvTXprYys2R3lMQ28vUDR6?=
 =?utf-8?B?cjVlZ0JKMzZaUDlQanY0cEUwTWNCOVl4QTlEemZkeTkxU0Y5ZkJPeGpEMXBm?=
 =?utf-8?B?WGtvSmFxZ3dwTUlHT2RVNXRZZ3lpUWlLSVJEdUVCUXBpUGYzbWVNeUc2YnJZ?=
 =?utf-8?B?VW5YR21iNTlRQTNOV3pDUUFjYXRrdEJlbFhZMnV6a3czelovZmdab0ZpeVMz?=
 =?utf-8?B?M3VsclQzRW9yOGtRN21IUW1sMDVlbzJ5U1lzNlpuUGk5dkpsY3ZPQ0lldG92?=
 =?utf-8?B?dWxSMStJMHRabE5SL0ZHWGVDQ1NiaWNReFl5T1YxQzZURlRCWjlFMDlDT043?=
 =?utf-8?B?c09UTlJmSzZnMnhuVmczNTVlQWF4N3p5M05SZ1lsT3EvNUZjdzZGVSt6UStr?=
 =?utf-8?B?dG9KQTY4UlgzNUV4NEtNRUR1c1BhZHFwc3F6Q09TbzR2aUNGdDRQTUx3c2Za?=
 =?utf-8?B?QlFiN3J5MVBUaHZKTXpTZDdvU0NLeWVzK3hVdkpMcXYwR1M0Y1owTFM2Tkpq?=
 =?utf-8?B?SWd5OUt1TnJpc0hzM2RQek16YzVSNFl5M21Vd09uNHF5d3pSWUZPR3k5RlRj?=
 =?utf-8?B?Y05JaCtqM0dVMWVzdTNpcG56YUpoaXpTVXBQTkxlOWZhNkNFNUZYU0FOTXBU?=
 =?utf-8?B?WGFjRnE0bmt5aEdNT2tZa1g0cVB1UC9MVWk4MWdjT0JIMlNBK3Z5UWJSSVdO?=
 =?utf-8?B?YS9OcGlZTmRrRER6bFZVSFd4QlArd29GalZqOXMrUFl5RmtkRVI0MU5OcUdz?=
 =?utf-8?B?M0JzU1hOaGdDdGplMVlXQzBjUVg2ZHJsZmVRZ2w2UTVsOWNrRDVFRm1SWlpD?=
 =?utf-8?B?TEIwMFp6RHRuQmZxRlRldzhieTNRRlY2UFZzVEJjVU4wdGw5TENNaDNUOFBX?=
 =?utf-8?B?UnBnaHY0cHYxcVVHMXNUNWlXcWpabEF5TENrU3BxNUVybU5RUjRTMlBJZmJD?=
 =?utf-8?B?dzRodGRoRS81TC9vMXRmd1NsbnMxQkNaUE4xL05LMjhSMTByRFZNTXdMcmpI?=
 =?utf-8?B?dFdIT0RBZUUrQmR2MzlPRks4a25raFFvS2tCWEVHSGVtWWp0UXJIK25SWDJZ?=
 =?utf-8?B?aTdYMlBQMzFCL1RvUnVXcGdLTWszLzJpSEJGNjJXMk1VTWF3T2tFb1o3bDNh?=
 =?utf-8?B?U1RrZXdmbVBFbkROcDZQeFFOYTdKekJmcm5zd3lHdlRZR3Y4ZUdLTHp3bEsx?=
 =?utf-8?B?czM3MmFoV2p2Zmt4NGxVbW9lczJML3V4Q0ltaFU3aHRQQXBCVkNibm1JanIv?=
 =?utf-8?B?dFNOMHFCM1NZK1p3M3ZtOXFtYTVVSndwNVY0M3AwRllYL1JrNFhTVmloMVdh?=
 =?utf-8?B?N0VxZFFFMmtxNCtPK2poL0dKR3l3UmY2MnJGaUcvQm5kNXpoaHphRjBCMjFX?=
 =?utf-8?B?dWhNM0NCTmpyb3hGYUtWd0RaUTJUWkl6ZjZ1am5HaTh4WDI1MkwzVjZPN0th?=
 =?utf-8?B?clJ5eVl3NXB4RU8reUFQMjdReTcwZzVUcVorMzJiQ3FZcWdDZmt6M09RVUdJ?=
 =?utf-8?B?TThaeU5YY2NDcTBScmZrSjlaaytXS1F1QUlEZ0hmSkplckdoQm1aTGR3MjdM?=
 =?utf-8?B?V1p1U1U4Mm1BYVBndTBWbzBlUmJDMHhPa1c1NjVFYWxYTEhWVHgrMnkvdWp2?=
 =?utf-8?B?djVGdEdnbURzQmtwMHVRWEpla1JJVUFXOXgyRURIUWpQNnZtTEtFMGVQL3lz?=
 =?utf-8?B?N3AzdE82UXFwUkw1VXlkZWlrdFBma2VpNUpqcWI4NERpUkYwN3pmNTFyOTNU?=
 =?utf-8?B?bWFZTkRaWnYwQmFxSmNsMEtjYm43SUR0OTFxT3V1MlZUSW5oWDhrcy9kL2hU?=
 =?utf-8?B?YWtRd1k5UnJ2SGQ1S0wrVEZGSmovZk1RUU9BTm93ZnhxWnFvSW5vVmppNkxr?=
 =?utf-8?B?eFMwS1FUdUgrMjB1SmdjUWg4Ti9wQWRwNW9mRDVxZmUxTDhDeE1vWElNaGNW?=
 =?utf-8?B?NFN5cWFMQkE0NzU4UXFCbFdWVDZnSjVoOHJJcldiVjkwc2JGQmhoTVQwOHJO?=
 =?utf-8?Q?W5W5NX?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7733.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cXI4OHhpSEk0WTJaZitwVHRQOUkvYm9aTmFhYWVkTFE2M1FYdFJpSDVVWW82?=
 =?utf-8?B?ZC9yemhCaTJHZm9DTE4ycFl5ZG81RitBSEJBUXNNeDVrb2lhNkZRNDNibXZa?=
 =?utf-8?B?WnZxek1wOWRQVHE0NWo4RDVHcDQ0aEgrUmR5amViQmxBV1E1NDZDWForS1VM?=
 =?utf-8?B?elZGSDlGQ0d3cEF4ays5OW4vMXhhNG1WYWhhR2t3aG55SUJTWE9aSllHK1Bx?=
 =?utf-8?B?SUxuMTJIc3VJT0o2NVpqemNRcWtHREd0ZHNPSGkzRG5WUHdnRGdZZHdMR1Fp?=
 =?utf-8?B?WDBhK2hJeThIYTVpMFZqWXg5dXQvdWRKS1NLbXBQcktRalROZm1MSFRvZmVq?=
 =?utf-8?B?bDd6MVNuMm9KTDVab3BHbDFPNEgweDdPWWxUYXlVM05hZThFOUNLbHZwa1hL?=
 =?utf-8?B?OW90MXVTVUlreDRKNkI4ZFNXd29idWRVcnJGWWRFN1ZqZzBKTm85cXJPaXI5?=
 =?utf-8?B?S3oxUTRleWlPL2Q1N1IvZ05GNFk0NFRCOEpySjB3d0ZMeis3QWlvYy9yRVR6?=
 =?utf-8?B?d09FSEpheGxJY3laS2VoczR0Q1RPZ1l0eGxVMEgycHRHUlRCbUYrTTJNTDAx?=
 =?utf-8?B?RmJiRktESWxacEd4U2NsdkRySTlqb0FLbG80WU5Ja1ZxTDFjRDhZdE9Ka1NZ?=
 =?utf-8?B?bTM4blRuN2RKUHVIdklaVVUraGtLK2g2V1M3K0txTVhuT0VubFIvOE5SVG5T?=
 =?utf-8?B?RTF6a2U1cHZYUWlTalV2UXVPd0tKcDZmenJIVEFsSkFXbUFqdDBLdDNiSnAv?=
 =?utf-8?B?Vk5NYU5QZ2hzb1daRFpWQi9Yc1B0cjQxK09rT1hBOUR3YStuU1pFQXJHM29S?=
 =?utf-8?B?RnIyN2swOTAwUjBDcDg0eVZmSm5XNWhyQXNJMnlDRndQanNzc3NSVE90SFdQ?=
 =?utf-8?B?bkYrOUxtVzdsR2wwNG9FZDdpdEtmb1ZJbVpwRnVaTDN2dnM3VG9oRFoyYjZh?=
 =?utf-8?B?UDVGdVdONTZ4bzRzS2d1TVB5ZjBCQ2FCMzJLcmV6czhvMFBGTHpiYmd6Q0J2?=
 =?utf-8?B?UUhCZE1OcHFYSVBqSEpNM2t1V2YrdWNzWHRaaUFPRG9SbVNxZG5IaGxqUHpm?=
 =?utf-8?B?Mk1YMVBzOWZML0FkN2t6elYyUGlyMHkrZU55bzVUdDB3ZmpRNHJLdlVkLzBs?=
 =?utf-8?B?OXo1U2pLY1JvdXdrak9sUTJGWVhuci9IWGpCWk9WRXFqaVJGNHNDb1BOSmFE?=
 =?utf-8?B?c25hdllOK1pQaTZCTVdoaENxMnVWeFZkVkJYS0FzL2lSWlFHUkwyUWlCM25R?=
 =?utf-8?B?cEFUYzIvRk1teUV3Y0R1YmVCUjI0d1lzVENOTllsTFRibUxrci9LVXd0K0Ir?=
 =?utf-8?B?SGlHSDNlTnJlNm56YnFyUHlQYlYvTjl5cEk2ODJxQUpPS2tEcmVHeHA0VHBt?=
 =?utf-8?B?dk0zRTF6aG94eDFRaTBwMlE3TkdocWZ0djVvZTBxM0ZvM2VCb2ZuQVBPdGJW?=
 =?utf-8?B?L0xtTUZOcTBhdmdGUWVOc0VRNTFoS1V0amRXZ0dGL0twQkZLeDVUREc1VldP?=
 =?utf-8?B?SHAzWEtyUVZDRmZSQUh4VzI2WnNEbmZ3dXVpOUNLSEJhRnFjb2p1b3hkS0lv?=
 =?utf-8?B?RnJWVHpHRmVjSWlBNDNTakhFTXJRQXdza0lWc1JTQmxnN1FPUjI4NnBEOE9k?=
 =?utf-8?B?MDFyVmJXMmYwUW1NdVhYa0p1NUpvaWM2RElnOE9IbWc5UHdoWUZYeHlGR29w?=
 =?utf-8?B?STVlaFA4bGlWZWJQSnZSTGFRK0R6UjVsd24vSEE0aUtNcHNQRDYrdnJJS1Bk?=
 =?utf-8?B?L01MaFVTVldLRlRoVmhNTno3dHNMUVUyR0VoR3NkSzFscGlpZ1pzM3pUNDdH?=
 =?utf-8?B?eUhGN3N1WkIyTmtzc3JVUUZ2UVlkK1lLbVhvU2R6K1Ryamo3UzV6ZVJJY2RS?=
 =?utf-8?B?N05JcUFvTUphYmtXblJidmJjWE44NVU2Q1ZNbEZTT2lLdUhyQll4dXVoWjJ0?=
 =?utf-8?B?UzF6VFRteDh1dVdIMXFiMUNlWmlDYmwyVk9sVDgyNXFBNHJEMUcrTXVDclU0?=
 =?utf-8?B?S1M0NjA4SEdBNG5iR0ZwZ29ZN3NPSU9RT0o2RVNZTy9PdUNrR0lEVFAvelp3?=
 =?utf-8?B?ZjZoN2ljYzdGNU9ubGZRQlNBVWNFd0FnZ05qYXQ2YmpyM0dBRkpuUGpkTUJu?=
 =?utf-8?B?WFlocUlpTTArQ0NjMk9FRVA4dGFvMGE4ZWdCczdtaDdKSHFOUjA5aGNhVnlR?=
 =?utf-8?Q?89ztLS0y0nt8qMSV93JXimrzo8v/9cVtiL1Z6Iq05LUb?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <37ACB73BADC754468E341FADEC4B1212@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7733.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f9fca4b-834b-4779-3379-08de31771d7a
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2025 07:47:59.8068 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KuDt9LTC1Je1Shg4phTpjTOSktBXOxmnCGG6PRONz9VySSc7C8J5Lgj9e2o5hP9VF9dzkBmjRpMTStXSrwYljSzI2hqxTTJHv3HqvsYs9jo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8132
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

T24gTW9uLCAyMDI1LTEyLTAxIGF0IDA5OjAxICswMDAwLCBuaXNoaXQuc2hhcm1hQGludGVsLmNv
bSB3cm90ZToNCj4gRnJvbTogTmlzaGl0IFNoYXJtYSA8bmlzaGl0LnNoYXJtYUBpbnRlbC5jb20+
DQo+IA0KPiBJbnRyb2R1Y2Ugc3luY2hyb25vdXMgd3JhcHBlcnMgZm9yIFZNIGJpbmQvdW5iaW5k
IG9wZXJhdGlvbnMgdGhhdA0KPiBoYW5kbGUNCj4gdXNlciBmZW5jZSBhbGxvY2F0aW9uLCB3YWl0
aW5nLCBhbmQgY2xlYW51cCBpbnRlcm5hbGx5LiBUaGlzDQo+IHNpbXBsaWZpZXMNCj4gdGVzdCBj
b2RlIGJ5IGVsaW1pbmF0aW5nIHJlcGV0aXRpdmUgc3luY2hyb25pemF0aW9uIGJvaWxlcnBsYXRl
Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTmlzaGl0IFNoYXJtYSA8bmlzaGl0LnNoYXJtYUBpbnRl
bC5jb20+DQo+IFJldmlld2VkLWJ5OiBUaG9tYXMgSGVsbHN0csO2bSA8dGhvbWFzLmhlbGxzdHJv
bUBsaW51eC5pbnRlbC5jb20+DQo+IC0tLQ0KPiDCoGxpYi94ZS94ZV9pb2N0bC5jIHwgMzkgKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+IMKgMSBmaWxlIGNoYW5nZWQs
IDM5IGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9saWIveGUveGVfaW9jdGwuYyBi
L2xpYi94ZS94ZV9pb2N0bC5jDQo+IGluZGV4IDIyMWZkN2M2Mi4uMzY5YzU4ODdkIDEwMDY0NA0K
PiAtLS0gYS9saWIveGUveGVfaW9jdGwuYw0KPiArKysgYi9saWIveGUveGVfaW9jdGwuYw0KPiBA
QCAtNzQ3LDMgKzc0Nyw0MiBAQCB2b2lkIHhlX3ZtX21hZHZpc2UoaW50IGZkLCB1aW50MzJfdCB2
bSwgdWludDY0X3QNCj4gYWRkciwgdWludDY0X3QgcmFuZ2UsDQo+IMKgCWlndF9hc3NlcnRfZXEo
X194ZV92bV9tYWR2aXNlKGZkLCB2bSwgYWRkciwgcmFuZ2UsIGV4dCwNCj4gdHlwZSwgb3BfdmFs
LCBwb2xpY3ksDQo+IMKgCQkJCcKgwqDCoMKgwqAgaW5zdGFuY2UpLCAwKTsNCj4gwqB9DQo+ICsN
Cj4gKyNkZWZpbmXCoMKgwqDCoMKgwqDCoCBCSU5EX1NZTkNfVkFMwqDCoCAweDY4Njg2OA0KDQpU
aGUgc3BhY2VzIGFib3ZlIGxvb2sgYSBiaXQgd2VpcmQsIHBlcmhhcHMgZml4IGJlZm9yZSBjb21t
aXR0aW5nLg0KDQoNCg0KPiArdm9pZCB4ZV92bV9iaW5kX2xyX3N5bmMoaW50IGZkLCB1aW50MzJf
dCB2bSwgdWludDMyX3QgYm8sIHVpbnQ2NF90DQo+IG9mZnNldCwNCj4gKwkJCXVpbnQ2NF90IGFk
ZHIsIHVpbnQ2NF90IHNpemUsIHVpbnQzMl90DQo+IGZsYWdzKQ0KPiArew0KPiArCXZvbGF0aWxl
IHVpbnQ2NF90ICpzeW5jX2FkZHIgPSBtYWxsb2Moc2l6ZW9mKCpzeW5jX2FkZHIpKTsNCj4gKwlz
dHJ1Y3QgZHJtX3hlX3N5bmMgc3luYyA9IHsNCj4gKwkJLmZsYWdzID0gRFJNX1hFX1NZTkNfRkxB
R19TSUdOQUwsDQo+ICsJCS50eXBlID0gRFJNX1hFX1NZTkNfVFlQRV9VU0VSX0ZFTkNFLA0KPiAr
CQkuYWRkciA9IHRvX3VzZXJfcG9pbnRlcigodWludDY0X3QgKilzeW5jX2FkZHIpLA0KPiArCQku
dGltZWxpbmVfdmFsdWUgPSBCSU5EX1NZTkNfVkFMLA0KPiArCX07DQo+ICsNCj4gKwlpZ3RfYXNz
ZXJ0KCEhc3luY19hZGRyKTsNCj4gKwl4ZV92bV9iaW5kX2FzeW5jX2ZsYWdzKGZkLCB2bSwgMCwg
Ym8sIDAsIGFkZHIsIHNpemUsICZzeW5jLA0KPiAxLCBmbGFncyk7DQo+ICsJaWYgKCpzeW5jX2Fk
ZHIgIT0gQklORF9TWU5DX1ZBTCkNCj4gKwkJeGVfd2FpdF91ZmVuY2UoZmQsICh1aW50NjRfdCAq
KXN5bmNfYWRkciwNCj4gQklORF9TWU5DX1ZBTCwgMCwgTlNFQ19QRVJfU0VDICogMTApOw0KPiAr
CS8qIE9ubHkgZnJlZSBpZiB0aGUgd2FpdCBzdWNjZWVkcyAqLw0KPiArCWZyZWUoKHZvaWQgKilz
eW5jX2FkZHIpOw0KPiArfQ0KPiArDQo+ICt2b2lkIHhlX3ZtX3VuYmluZF9scl9zeW5jKGludCBm
ZCwgdWludDMyX3Qgdm0sIHVpbnQ2NF90IG9mZnNldCwNCj4gKwkJCcKgIHVpbnQ2NF90IGFkZHIs
IHVpbnQ2NF90IHNpemUpDQo+ICt7DQo+ICsJdm9sYXRpbGUgdWludDY0X3QgKnN5bmNfYWRkciA9
IG1hbGxvYyhzaXplb2YoKnN5bmNfYWRkcikpOw0KPiArCXN0cnVjdCBkcm1feGVfc3luYyBzeW5j
ID0gew0KPiArCQkuZmxhZ3MgPSBEUk1fWEVfU1lOQ19GTEFHX1NJR05BTCwNCj4gKwkJLnR5cGUg
PSBEUk1fWEVfU1lOQ19UWVBFX1VTRVJfRkVOQ0UsDQo+ICsJCS5hZGRyID0gdG9fdXNlcl9wb2lu
dGVyKCh1aW50NjRfdCAqKXN5bmNfYWRkciksDQo+ICsJCS50aW1lbGluZV92YWx1ZSA9IEJJTkRf
U1lOQ19WQUwsDQo+ICsJfTsNCj4gKw0KPiArCWlndF9hc3NlcnQoISFzeW5jX2FkZHIpOw0KPiAr
CSpzeW5jX2FkZHIgPSAwOw0KPiArCXhlX3ZtX3VuYmluZF9hc3luYyhmZCwgdm0sIDAsIDAsIGFk
ZHIsIHNpemUsICZzeW5jLCAxKTsNCj4gKwlpZiAoKnN5bmNfYWRkciAhPSBCSU5EX1NZTkNfVkFM
KQ0KPiArCQl4ZV93YWl0X3VmZW5jZShmZCwgKHVpbnQ2NF90ICopc3luY19hZGRyLA0KPiBCSU5E
X1NZTkNfVkFMLCAwLCBOU0VDX1BFUl9TRUMgKiAxMCk7DQo+ICsJZnJlZSgodm9pZCAqKXN5bmNf
YWRkcik7DQo+ICt9DQoNCg==
