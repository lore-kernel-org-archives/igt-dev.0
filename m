Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4241BEF5864
	for <igt-dev@archiver.kernel.org>; Mon, 23 Feb 2026 05:09:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6B5B10E219;
	Mon, 23 Feb 2026 05:09:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EEhqBmD/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C2A810E219
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 05:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771823379; x=1803359379;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=f39IeeRbHnq1fLsxfi7Pk0qSUUHGU0W5rarPKzHqeDs=;
 b=EEhqBmD/w9F2yGcUdgd6CP72GZr9HI0KFiCpHpsE7i0uRhaR+e/4iEZZ
 2tUqBhmqx1zP9bsfpMHWBg8FF73HRuLZAGy2+R2Tp3o8sx280Ldm//sRX
 7qYTuqSARfYeXxTQ3dZEFZ1ifbD0YBcnBrbP2fIPxgwJRIw5OjQSeLSx7
 C0NIneaIloZmkQb5TVYX5OT7PbH0POHX1eUvuLl3mOhpJOhGfHOD9AJD/
 wtufWBULVFzINUODcJTsMyGRF8icR283TAam8vq5E0evykuKxVhGf4rl/
 H7IXLifrGLBmkE1QBRnVAAhg7wxh0KYhEqwEK1x4goQAgL5/N7beAeTLM g==;
X-CSE-ConnectionGUID: OiUKnwJCTTKD772BZHbO0A==
X-CSE-MsgGUID: kMGpnhAlQXOEMG6mM6NLgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="72518848"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="72518848"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2026 21:09:09 -0800
X-CSE-ConnectionGUID: SArK+DGHSj2rHEwZucDvVg==
X-CSE-MsgGUID: U6xzm1yIRKuvnHXSF9aMNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="219569761"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2026 21:09:09 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sun, 22 Feb 2026 21:09:08 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Sun, 22 Feb 2026 21:09:08 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.29) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sun, 22 Feb 2026 21:09:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C+vUEAZ9ssW6CLqRpdxhzb2/aBDHL/4bf6a7uIkKLwV6Ak5w8U8dC4EBfGBvgbiFuMCTuXeN/gPCYTizYbx4To+3QX7QzcIiHPZoGv0LDxQdaZB8I0C5ygVp/vqrTV1/EHdcrCTONNNNzNkZLJoUyxgZXPQsFeZR8Uo28vBQ4eXUvmaqAQ1nqFAdF0CETkImP+zt/eamaQQgqE/F6x/9HfAjHeckIl5BO7lEIIrCYXttN4VxLj2FOT05zhr0SD2HOoPdpavXeTrXOUP8RdaobExJ1UMgqgrxoNqFDisxml7X9gEoXFik3xZTgt3A3hxldPkdY8F+/I29k16/n+BTvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f39IeeRbHnq1fLsxfi7Pk0qSUUHGU0W5rarPKzHqeDs=;
 b=VZU2B+gX61QmtZXJ8YDdgTeVVm4UkKhcjKLOxsA7Ljs9CzjXhIbEAneWB/g76NjiGmf/L0uhJO17DinbE/pEuXSnf029cgflcZ7ZVSBd6qUaSEelRf1m7dktnHnyQSLte0sUTirVPUaDwevjnqiePMptqtuuRtqQVw1NVv1pbmMMkvaO7Af1AnfCVREL4Qmll0KJ5dF/ihuAojk7wNpSlUNffJuIN0mf71cgpt5hdS8mpkHWiC6IsWIUJ1m6eUz/LAp3HyXQ7etGywt5Gp0DGPDfDrUmJxKnLuBaa+pzgu/NmXvt482y3+HC19NzkXQ4jAn+FFlpG8Ni8ZTbBBVFqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5525.namprd11.prod.outlook.com (2603:10b6:208:31f::10)
 by PH7PR11MB7663.namprd11.prod.outlook.com (2603:10b6:510:27c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 05:09:03 +0000
Received: from BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::7181:6f6e:ae0e:3a4a]) by BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::7181:6f6e:ae0e:3a4a%5]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 05:09:03 +0000
From: "Gurram, Pravalika" <pravalika.gurram@intel.com>
To: "Yadav, Arvind" <arvind.yadav@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>, "Sharma, Nishit"
 <nishit.sharma@intel.com>
Subject: RE: [PATCH i-g-t v3 3/8] tests/intel/xe_madvise: Add
 dontneed-before-mmap subtest
Thread-Topic: [PATCH i-g-t v3 3/8] tests/intel/xe_madvise: Add
 dontneed-before-mmap subtest
Thread-Index: AQHcn7Yo+/EZT06QIE2r4ZYBnsIxXLWPu7HA
Date: Mon, 23 Feb 2026 05:09:03 +0000
Message-ID: <BL1PR11MB5525EA60CF564CF51C1A85E18477A@BL1PR11MB5525.namprd11.prod.outlook.com>
References: <20260217023423.2632617-1-arvind.yadav@intel.com>
 <20260217023423.2632617-4-arvind.yadav@intel.com>
In-Reply-To: <20260217023423.2632617-4-arvind.yadav@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5525:EE_|PH7PR11MB7663:EE_
x-ms-office365-filtering-correlation-id: 853ead87-7ffb-4b3f-2dd5-08de7299a9b5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?aHc5b3FFdzhRUHpqa01zUVFnd3A3U09RSHpxZE9SeTlQTTh2TUtMNkIzNGhx?=
 =?utf-8?B?ZHZkVmoydXF4RUtLMHZOVHRIeXZwQjNFLzR5VmU2eTFYQzh1N3d6amNndDln?=
 =?utf-8?B?dnJrb0cvUVpoNWdlZHg2SnFpSThtWkxrVnl3aW1Xc2xPRzV5aENiT1JncTBq?=
 =?utf-8?B?ZXI3eHg0cFVLSWxIeWxKTFZCaTVsWGhMTU82cEFqbUJmc243eGdoRm44b3JB?=
 =?utf-8?B?R2llZzh6NHZuQktUajV1alVKNU1JL0srYngvTFp0UkxUQTJhS0FOVERzL1BK?=
 =?utf-8?B?UjZNdG9sWjN5SVFBVFh5aWdkM0tGSnZFNS9SZFRVWFFsUUNLK2lwU1lrTWJJ?=
 =?utf-8?B?K2J6OFR1akk1Rms2c2ROVzdyZEtpbHU3MkhkK09rK1NsTkM3Rkdpc1lDN1hl?=
 =?utf-8?B?cWFDZGE2Z1FHWGNaUksyWDI0TXUxd2RwMmVmUGMrQ2ZtbWsrdGZScFBzSTRy?=
 =?utf-8?B?ZklVN2NKRXUzSllFcmJ6WlRLRTVsNEwrUStxak0weEpRd01aM2VNaU9DWmo3?=
 =?utf-8?B?dzMvWTMwNGEzaWdmNFJzc3J6QVlseEFmQ3ZHeWhPMG5oY2lxVytLemVpaC9B?=
 =?utf-8?B?aENyUjBFRGpzcHhtam5zdWxUbFl1MElWMU5nMXJFbGlMRExvMWpVb2k1bWdH?=
 =?utf-8?B?YlRGaktiRUtCT2dpcWVVVXJlQTFRRUJpcDJOMS90SlNaY1ZKaG0yazljaU9Q?=
 =?utf-8?B?WFhodkdkdnp6WVJ5Q3pPa3NQaEFkTHJIam8ya1VtQU9xdWYzZHpLL2RkOVg0?=
 =?utf-8?B?ZXhVZG5iTlZ2UDhiKyt1cUVzYUZoTEZDenpSd2tVTGVuL29KM0ZVY3p2cHF4?=
 =?utf-8?B?K0crUktvcTlNclA0Z2h0ZzdVVjdHY05kdlRyQklza3hBa09EQjUzQjFIMmF2?=
 =?utf-8?B?NGRDS3h4SURpYWhqS25IYmp4aE9tR1o4Smlhd1BrcTk3Q25iNzNlVzRtVko2?=
 =?utf-8?B?eEJnc000djRneXAyV1F5OGgwNnZoOTcrbEFVck1FM1hrRUlPWDVkWDFGSytG?=
 =?utf-8?B?U3p5UXB2SkFJQ2lGNWM2eWwwMG96bCszZWszT2N5cDlsa2hUYVlMY2NScTh6?=
 =?utf-8?B?Rlk3TXgvdWphNzBuNVViN0QrSkM4c3ZKdmpyQVl6TDdVbjlFQkNPcHZuRXg1?=
 =?utf-8?B?ZGw1TGVQVDdEbHcrYkh6ODJzOUJVVWV4aWNoVGlKMXMydFNSZWtOVFQ5d092?=
 =?utf-8?B?QXZoTUV6TXpRR2FBWEQrNXd1SlNEZHpBSXBRQXk5RjVaYjE0UmJaOENxZ3N0?=
 =?utf-8?B?UkM2RXV1TG9EVlFMQzYxczk0a3ZIK2pZQUpSeVhiSmlGMitRanc2R2NJT29q?=
 =?utf-8?B?MWhFcVoreTdnV2h4TkVRam94TTdqY3FQTGdDVzI2QzhnZndUYnB2R2NCcCtI?=
 =?utf-8?B?QU1qTDVaZHlQa21PeThVR2NQNGRkUDNzLzN4V0FOMGw5T0daem9JMG5WRlZV?=
 =?utf-8?B?OFJydmdCWEhTd2FIYUU3OFh0dFd3QitkNDBCMTRneXZDQitGeGdsTlFaQVV4?=
 =?utf-8?B?OVNHTzdFWWJGeFFiOGR1b2ltWElGV1AxcXRPUkFrM0NsMWNOYXgxaWRZWUlQ?=
 =?utf-8?B?YWxQTUhPbW5MOXA2R1JYZ3JteDFHNENnN2FvaHlXL1pGbHJldEdvcGpzNk91?=
 =?utf-8?B?VE1PcFBNbFJSWnZuTXVxTnJpTGVVWEFxVEFZZjJaT2MxdHRaWDJJZk5tN1g0?=
 =?utf-8?B?QzhUSUgya3M5NTVWb2VHOG84SzIwSnMrM1ZNRW1LQ0xCeXhpNUVCazhoTlJH?=
 =?utf-8?B?K2hXVnNvcVhwTExPK0pVMGFJZmlIL0ZRaDBwOUxvRDNPb0JwdlV3NElFWXhI?=
 =?utf-8?B?cG5hYjdSb0xFaGMwVTh6RDZveXozZm5mSUlkRlhNOTE3UzE3RkVLZkJqUXRj?=
 =?utf-8?B?ZmRtbWhaMWpKVVgxQXUvaWJWTXpXem9sdzMrcHRiMlRkM0oyNmxYcWJiMW1p?=
 =?utf-8?B?Z1FHZ1B5SllXd04yb2hqRGRrbWdaT3JTc0laamUvR0Zma0NkZGZwa3dNUGs2?=
 =?utf-8?B?Y0lFLzBWTWRaTzVjUnIyTXdWNnUxT2FVT2dCMnVIREZ3ckNlU3plNThuOXhq?=
 =?utf-8?B?Vk5BVFJzaU53YVhWR3dkc3FkekVuNE54bWlXa2NMSkh2U0FoM1E2ZURRNWZZ?=
 =?utf-8?B?dERsVFQzdXExdmh2Rzc3YmVtTEU0T0xSaStCSWRXbHlnVUlTRXQ3NE9hYnhH?=
 =?utf-8?Q?bWpML7Uezi1kDR4fPiIywQc=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5525.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cXo1ZEY3cDBPZklGV0c4REEwY2x4alpvcjl2MWJNU0lERlg1MG1rcWwzUExP?=
 =?utf-8?B?YTBad1EzRE1qcmpYczdZTEhXbC9FYjdhclJ1UC9xUmZhQzNYRU5CckpRTGNz?=
 =?utf-8?B?d2VTWTlDcnA5bFh4dmpDeG9JN0JVZGwwMUZDb1VUZk5TQlFNM0JURm5IeE1z?=
 =?utf-8?B?aytSYkN3UmNqUjNId0FrbFJKUkdWZzJ1OU41MDltNFkreHJrWkxqRHA0RlRy?=
 =?utf-8?B?V3hDUWl5OEhqM3BURlJrT21tM0VKSURNRk9VcndTSFBuM25kUXVrZCtUMnBh?=
 =?utf-8?B?cWtWK3llRjZKSk1UZG1qOEwxTFJoWUxqWEtrd08xWGVTTGZwT0xxUWw3ZE9m?=
 =?utf-8?B?b2NGSUZobXZRYzREQ3AwQkhHN2htYmh3S1JKdllVMEJBLzlud3Rlc2RMWkVz?=
 =?utf-8?B?dG1WOEtaaDFxVGNjb0lhN0lET1pzVnl5RUVTNm9HUFFkY1JVbkREQTIwaHVv?=
 =?utf-8?B?Vnp2ZDQ3MGY5Q0hTd3laTVNtSUZMTFY0M3JXRitxZlc4emxyRm5qdW9PeklN?=
 =?utf-8?B?UnpTQStRVjNrU1R2N00wYTFHRml3cXUvM1BjaC9Cb0xGcTZDUG1PT0lCY3p4?=
 =?utf-8?B?WmRsNHNybXpyUUNUSHVIUWhTbGR6bk9jM3Noa0JQTmhhdnlxNkg2bHhsRit0?=
 =?utf-8?B?WldFQzIxS2VwWXhDTFIrM1p1N1lHaHNGY0ZJWjhobEtWejZaRm9Zc05kRGxj?=
 =?utf-8?B?L1FBYUdMdjVxQXNoUWRPWmJnK1hXeG5yTDBhWjBBeGJDeW80OE95aytmaEZz?=
 =?utf-8?B?RXE3Yzlvd21KelljeEZwM2VHU1o4QVNubkN4L3VpUTVRZ1J5aVpJaGd5Q2lS?=
 =?utf-8?B?TGtzRmlrYlo0WjNaNzdINCt0YTFDQUFkelU1TVFBTVhCam1HSG5YVCtlTEFn?=
 =?utf-8?B?UUF3anZuLzcxUEdKaHN2UWFuZ0t2MkhoU0VBbE8wSW52cWYya20yTElmNFE1?=
 =?utf-8?B?dWhBdi81cGtaaFlEbUhHK29NQmVEa0R2blhzYmJueTAvNzM0eHRXaHNkUThP?=
 =?utf-8?B?VmM2bHNCbU5zdThocXVvSkxvcHVFdEhBQnVaNWdrbGRCYXVvVUZBVjJUM1RZ?=
 =?utf-8?B?S2JyUGxDOXdRcCswS0x2dFZQRURiN2xaeW9rQlpSa2gyRVNGNzhmVC9KQUt1?=
 =?utf-8?B?TWJ5NXlKRHdKK0dSaVVJZFZ2NVhuL0xndXcvTWFZNUVhcyt1NjFFeTNSVkc0?=
 =?utf-8?B?ZnFURFVMSzNqeTg5NjduR3AwemVWeTVSR3hLZnRsbXBHNEJuYnRqRjY4UUZG?=
 =?utf-8?B?RDNMSVVMVGQ0bUlUOXE3cW11QXdrTUlUa0lDd1MxUXZrVFlmRXZhOFZHc1JC?=
 =?utf-8?B?cUtQY3ZXZjJHdzhrOStDeEJXM3p5c0d2Z3RWcTQvNlZJZFFTd28wa3NTclgz?=
 =?utf-8?B?ZmIwU01HY3pHM2pOZWdtSnovNTd1MlBwN0dRb0JNSm1JV1hlTXhPSldSNHk3?=
 =?utf-8?B?MkFTRWdaL2NHbEFrdEdneGR6aFdkVmMxc3NYSzA5Znp5czZ6M2xhOHFLVmRC?=
 =?utf-8?B?QWlsSGdFdUxJY0RmZVphRjhvOUhPRHFoYStsMG5CaDlBVS9qaTlOc1g4VFdV?=
 =?utf-8?B?N1BQTWpNbStIcm96cE16RC9GcHVWeXNDamlFdlNIUWg1TFpFa2szbnlwSFBv?=
 =?utf-8?B?ZjlWbHVQVTY1NHNTUkd0NDFLNHdHV2pYSWxBcUNDMk91K2VyMUU1RnNDZEhk?=
 =?utf-8?B?UGEraThyV013OGhOeXl4SEtQbnBaUEREbWlrM2NQblN2S2pYNHdGOUI2ZmlG?=
 =?utf-8?B?dWdOdVpsYlRYdENWMDhjVDN3clpDNmdhVWhVV1p5dkpOQWtyY2xWVmlKZ2dD?=
 =?utf-8?B?ZVFLUStGcTkyOWRCcjIzRnZ3RGRMRnp3QlZkbkU1WXM2Z1Z0QnhTL2RieHdt?=
 =?utf-8?B?R3JMekxOeEZoZDRFdVowV3dtNldIV1ZwajJmN2NlTWFqc01jaUl1RkkrYmg5?=
 =?utf-8?B?YlBxR0NmYWQ4K1lEY20xNkJqWGljaEVnYUdvZkEvNmlEYU1OaW9QM1VYUTJS?=
 =?utf-8?B?MlZ0RThTL1hjQUZkYU1mOUYrNTV1aVdvcHdjdlVERGhvWVdLSXN4cTVUKzZx?=
 =?utf-8?B?ajlPelRpQmwvMjZWK3MyejM4aksyRkYwTDdwdHZ5RlhhQlVQdWQ0Vmw3R2wx?=
 =?utf-8?B?TG5xTjNJVWkvUlJPelJmaUlqTWk5eVdUY3VYYk1zVEhRRzZzdE1KUlFSeDlZ?=
 =?utf-8?B?SmVRaThUeW9pc3A0WkIvVmJncldLcE9zcGhKUlFKWWg2Q1BkM0lmOUV3NGhT?=
 =?utf-8?B?cmY0ZHNpVWVYbFErR25DYU45UjVzZ2dzK2J3MUMxUHVSRUlIcDA2Wlo5Y09w?=
 =?utf-8?B?aEdvZXYvRk1EVmRualpKSEMyRmsrZEl3WDVaNnBVWGx3YzhqaFFsQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5525.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 853ead87-7ffb-4b3f-2dd5-08de7299a9b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2026 05:09:03.4975 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1a9A3HiEfudS5OoA1izsZ2hFobkQoJVbHA8Dn9Rx+6du5G++dhXyoGnTsZMHIBA8rD/e0multHab7C1nDIOaZ/2zweUgY2IfmU7jcv2/drE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7663
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogWWFkYXYsIEFydmluZCA8
YXJ2aW5kLnlhZGF2QGludGVsLmNvbT4NCj4gU2VudDogVHVlc2RheSwgMTcgRmVicnVhcnksIDIw
MjYgMDg6MDQgQU0NCj4gVG86IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBC
cm9zdCwgTWF0dGhldyA8bWF0dGhldy5icm9zdEBpbnRlbC5jb20+OyBHaGltaXJheSwgSGltYWwg
UHJhc2FkDQo+IDxoaW1hbC5wcmFzYWQuZ2hpbWlyYXlAaW50ZWwuY29tPjsgdGhvbWFzLmhlbGxz
dHJvbUBsaW51eC5pbnRlbC5jb207DQo+IFNoYXJtYSwgTmlzaGl0IDxuaXNoaXQuc2hhcm1hQGlu
dGVsLmNvbT47IEd1cnJhbSwgUHJhdmFsaWthDQo+IDxwcmF2YWxpa2EuZ3VycmFtQGludGVsLmNv
bT4NCj4gU3ViamVjdDogW1BBVENIIGktZy10IHYzIDMvOF0gdGVzdHMvaW50ZWwveGVfbWFkdmlz
ZTogQWRkIGRvbnRuZWVkLWJlZm9yZS0NCj4gbW1hcCBzdWJ0ZXN0DQo+IA0KPiBUaGlzIHRlc3Qg
dmFsaWRhdGVzIGtlcm5lbCBiZWhhdmlvciB3aGVuIG1hcHBpbmcgYSBCTyB0aGF0IHdhcyBhbHJl
YWR5DQo+IG1hcmtlZCBhcyBwdXJnZWFibGUgYW5kIHB1cmdlZCBiZWZvcmUgbW1hcC4gQWZ0ZXIg
cHVyZ2luZyB0aGUgQk8gdW5kZXINCj4gbWVtb3J5IHByZXNzdXJlLCB0aGUgdGVzdCBhdHRlbXB0
cyB0byBtbWFwIGFuZCBhY2Nlc3MgaXQuIFRoZSBrZXJuZWwgc2hvdWxkDQo+IHRyaWdnZXIgU0lH
QlVTIG9yIFNJR1NFR1Ygd2hlbiBhY2Nlc3NpbmcgdGhlIHB1cmdlZCBtYXBwaW5nLCBjb25maXJt
aW5nDQo+IHRoYXQgcHVyZ2VkIG1lbW9yeSBpcyBwcm9wZXJseSBpbnZhbGlkYXRlZC4NCj4gDQo+
IENjOiBOaXNoaXQgU2hhcm1hIDxuaXNoaXQuc2hhcm1hQGludGVsLmNvbT4NCj4gQ2M6IFByYXZh
bGlrYSBHdXJyYW0gPHByYXZhbGlrYS5ndXJyYW1AaW50ZWwuY29tPg0KPiBDYzogTWF0dGhldyBC
cm9zdCA8bWF0dGhldy5icm9zdEBpbnRlbC5jb20+DQo+IENjOiBUaG9tYXMgSGVsbHN0csO2bSA8
dGhvbWFzLmhlbGxzdHJvbUBsaW51eC5pbnRlbC5jb20+DQo+IENjOiBIaW1hbCBQcmFzYWQgR2hp
bWlyYXkgPGhpbWFsLnByYXNhZC5naGltaXJheUBpbnRlbC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6
IEFydmluZCBZYWRhdiA8YXJ2aW5kLnlhZGF2QGludGVsLmNvbT4NCj4gLS0tDQo+ICB0ZXN0cy9p
bnRlbC94ZV9tYWR2aXNlLmMgfCAyMTkNCj4gKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrDQo+ICB0ZXN0cy9tZXNvbi5idWlsZCAgICAgICAgfCAgIDEgKw0KPiAgMiBmaWxl
cyBjaGFuZ2VkLCAyMjAgaW5zZXJ0aW9ucygrKQ0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHRlc3Rz
L2ludGVsL3hlX21hZHZpc2UuYw0KPiANCj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2ludGVsL3hlX21h
ZHZpc2UuYyBiL3Rlc3RzL2ludGVsL3hlX21hZHZpc2UuYyBuZXcgZmlsZSBtb2RlDQo+IDEwMDY0
NCBpbmRleCAwMDAwMDAwMDAuLjdkYmU3MGY0Mg0KPiAtLS0gL2Rldi9udWxsDQo+ICsrKyBiL3Rl
c3RzL2ludGVsL3hlX21hZHZpc2UuYw0KPiBAQCAtMCwwICsxLDIxOSBAQA0KPiArLy8gU1BEWC1M
aWNlbnNlLUlkZW50aWZpZXI6IE1JVA0KPiArLyoNCj4gKyAqIENvcHlyaWdodCDCqSAyMDI1IElu
dGVsIENvcnBvcmF0aW9uDQo+ICsgKi8NCj4gKw0KPiArLyoqDQo+ICsgKiBURVNUOiBWYWxpZGF0
ZSBwdXJnZWFibGUgQk8gbWFkdmlzZSBmdW5jdGlvbmFsaXR5DQo+ICsgKiBDYXRlZ29yeTogQ29y
ZQ0KPiArICogTWVnYSBmZWF0dXJlOiBHZW5lcmFsIENvcmUgZmVhdHVyZXMNCj4gKyAqIFN1Yi1j
YXRlZ29yeTogTWVtb3J5IG1hbmFnZW1lbnQgdGVzdHMNCj4gKyAqIEZ1bmN0aW9uYWxpdHk6IG1h
ZHZpc2UsIHB1cmdlYWJsZQ0KPiArICovDQo+ICsNCj4gKyNpbmNsdWRlICJpZ3QuaCINCj4gKyNp
bmNsdWRlICJ4ZV9kcm0uaCINCj4gKw0KPiArI2luY2x1ZGUgInhlL3hlX2lvY3RsLmgiDQo+ICsj
aW5jbHVkZSAieGUveGVfcXVlcnkuaCINCj4gKw0KPiArLyogUHVyZ2VhYmxlIHRlc3QgY29uc3Rh
bnRzICovDQo+ICsjZGVmaW5lIFBVUkdFQUJMRV9BRERSCQkweDFhMDAwMA0KPiArI2RlZmluZSBQ
VVJHRUFCTEVfQk9fU0laRQk0MDk2DQo+ICsNCj4gKy8qKg0KPiArICogdHJpZ2dlcl9tZW1vcnlf
cHJlc3N1cmUgLSBGaWxsIFZSQU0gKyAyNSUgdG8gZm9yY2UgcHVyZ2VhYmxlIHJlY2xhaW0NCj4g
KyAqIEBmZDogRFJNIGZpbGUgZGVzY3JpcHRvcg0KPiArICogQHZtOiBWTSBoYW5kbGUgKHVudXNl
ZCwga2VwdCBmb3IgQVBJIGNvbXBhdGliaWxpdHkpDQo+ICsgKg0KPiArICogQWxsb2NhdGVzIEJP
cyBpbiBhIHRlbXBvcmFyeSBWTSB1bnRpbCBWUkFNIGlzIG92ZXJjb21taXR0ZWQsDQo+ICsgKiBm
b3JjaW5nIHRoZSBrZXJuZWwgdG8gcHVyZ2UgRE9OVE5FRUQtbWFya2VkIEJPcy4NCj4gKyAqLw0K
PiArc3RhdGljIHZvaWQgdHJpZ2dlcl9tZW1vcnlfcHJlc3N1cmUoaW50IGZkLCB1aW50MzJfdCB2
bSkgew0KPiArCXVpbnQ2NF90IHZyYW1fc2l6ZSwgb3ZlcnByZXNzdXJlOw0KPiArCWNvbnN0IHVp
bnQ2NF90IGNodW5rID0gOHVsbCA8PCAyMDsgLyogOCBNaUIgKi8NCj4gKwlpbnQgbWF4X29ianMs
IG4gPSAwOw0KPiArCXVpbnQzMl90ICpoYW5kbGVzOw0KPiArCXVpbnQ2NF90IHRvdGFsOw0KPiAr
CXZvaWQgKnA7DQo+ICsJdWludDMyX3QgaGFuZGxlLCB0ZW1wX3ZtOw0KPiArDQo+ICsJLyogVXNl
IGEgc2VwYXJhdGUgVk0gc28gcHJlc3N1cmUgQk9zIGRvbid0IGFmZmVjdCB0aGUgdGVzdCBWTSAq
Lw0KPiArCXRlbXBfdm0gPSB4ZV92bV9jcmVhdGUoZmQsIDAsIDApOw0KPiArDQo+ICsJdnJhbV9z
aXplID0geGVfdmlzaWJsZV92cmFtX3NpemUoZmQsIDApOw0KPiArCS8qIFNjYWxlIG92ZXJwcmVz
c3VyZSB0byAyNSUgb2YgVlJBTSwgbWluaW11bSA2NE1CICovDQo+ICsJb3ZlcnByZXNzdXJlID0g
dnJhbV9zaXplIC8gNDsNCj4gKwlpZiAob3ZlcnByZXNzdXJlIDwgKDY0IDw8IDIwKSkNCj4gKwkJ
b3ZlcnByZXNzdXJlID0gNjQgPDwgMjA7DQo+ICsNCj4gKwltYXhfb2JqcyA9ICh2cmFtX3NpemUg
KyBvdmVycHJlc3N1cmUpIC8gY2h1bmsgKyAxOw0KPiArCWhhbmRsZXMgPSBtYWxsb2MobWF4X29i
anMgKiBzaXplb2YoKmhhbmRsZXMpKTsNCj4gKwlpZ3RfYXNzZXJ0KGhhbmRsZXMpOw0KPiArDQo+
ICsJdG90YWwgPSAwOw0KPiArCXdoaWxlICh0b3RhbCA8IHZyYW1fc2l6ZSArIG92ZXJwcmVzc3Vy
ZSAmJiBuIDwgbWF4X29ianMpIHsNCj4gKwkJaGFuZGxlID0geGVfYm9fY3JlYXRlKGZkLCB0ZW1w
X3ZtLCBjaHVuaywNCj4gKwkJCQkgICAgICB2cmFtX2lmX3Bvc3NpYmxlKGZkLCAwKSwNCj4gKw0K
PiBEUk1fWEVfR0VNX0NSRUFURV9GTEFHX05FRURTX1ZJU0lCTEVfVlJBTSk7DQo+ICsJCWhhbmRs
ZXNbbisrXSA9IGhhbmRsZTsNCj4gKwkJdG90YWwgKz0gY2h1bms7DQo+ICsNCj4gKwkJcCA9IHhl
X2JvX21hcChmZCwgaGFuZGxlLCBjaHVuayk7DQo+ICsJCWlndF9hc3NlcnQocCAhPSBNQVBfRkFJ
TEVEKTsNCj4gKw0KPiArCQkvKiBGYXVsdCBpbiBhbGwgcGFnZXMgc28gdGhleSBhY3R1YWxseSBj
b25zdW1lIFZSQU0gKi8NCj4gKwkJbWVtc2V0KHAsIDB4Q0QsIGNodW5rKTsNCj4gKwkJbXVubWFw
KHAsIGNodW5rKTsNCj4gKwl9DQo+ICsNCj4gKwkvKiBBbGxvdyBzaHJpbmtlciB0aW1lIHRvIHBy
b2Nlc3MgcHJlc3N1cmUgKi8NCj4gKwl1c2xlZXAoMTAwMDAwKTsNCj4gKw0KPiArCWZvciAoaW50
IGkgPSAwOyBpIDwgbjsgaSsrKQ0KPiArCQlnZW1fY2xvc2UoZmQsIGhhbmRsZXNbaV0pOw0KPiAr
DQo+ICsJZnJlZShoYW5kbGVzKTsNCj4gKw0KPiArCXhlX3ZtX2Rlc3Ryb3koZmQsIHRlbXBfdm0p
Ow0KPiArfQ0KPiArDQo+ICtzdGF0aWMgam1wX2J1ZiBqbXA7DQo+ICsNCj4gK19fbm9yZXR1cm4g
c3RhdGljIHZvaWQgc2lndHJhcChpbnQgc2lnKSB7DQo+ICsJc2lnbG9uZ2ptcChqbXAsIHNpZyk7
DQo+ICt9DQo+ICsNCj4gKy8qKg0KPiArICogcHVyZ2VhYmxlX21hcmtfYW5kX3ZlcmlmeV9wdXJn
ZWQgLSBNYXJrIERPTlRORUVELCBwcmVzc3VyZSwgY2hlY2sNCj4gK3B1cmdlZA0KPiArICogQGZk
OiBEUk0gZmlsZSBkZXNjcmlwdG9yDQo+ICsgKiBAdm06IFZNIGhhbmRsZQ0KPiArICogQGFkZHI6
IFZpcnR1YWwgYWRkcmVzcyBvZiB0aGUgQk8NCj4gKyAqIEBzaXplOiBTaXplIG9mIHRoZSBCTw0K
PiArICoNCj4gKyAqIFJldHVybnMgdHJ1ZSBpZiB0aGUgQk8gd2FzIHB1cmdlZCB1bmRlciBtZW1v
cnkgcHJlc3N1cmUuDQo+ICsgKi8NCj4gK3N0YXRpYyBib29sIHB1cmdlYWJsZV9tYXJrX2FuZF92
ZXJpZnlfcHVyZ2VkKGludCBmZCwgdWludDMyX3Qgdm0sDQo+ICt1aW50NjRfdCBhZGRyLCBzaXpl
X3Qgc2l6ZSkgew0KPiArCXVpbnQzMl90IHJldGFpbmVkOw0KPiArDQo+ICsJLyogTWFyayBhcyBE
T05UTkVFRCAqLw0KPiArCXJldGFpbmVkID0geGVfdm1fbWFkdmlzZV9wdXJnZWFibGUoZmQsIHZt
LCBhZGRyLCBzaXplLA0KPiArDQo+IERSTV9YRV9WTUFfUFVSR0VBQkxFX1NUQVRFX0RPTlRORUVE
KTsNCj4gKwlpZiAocmV0YWluZWQgIT0gMSkNCj4gKwkJcmV0dXJuIGZhbHNlOw0KPiArDQo+ICsJ
LyogVHJpZ2dlciBtZW1vcnkgcHJlc3N1cmUgKi8NCj4gKwl0cmlnZ2VyX21lbW9yeV9wcmVzc3Vy
ZShmZCwgdm0pOw0KPiArDQo+ICsJLyogVmVyaWZ5IHB1cmdlZCAqLw0KPiArCXJldGFpbmVkID0g
eGVfdm1fbWFkdmlzZV9wdXJnZWFibGUoZmQsIHZtLCBhZGRyLCBzaXplLA0KPiArDQo+IERSTV9Y
RV9WTUFfUFVSR0VBQkxFX1NUQVRFX1dJTExORUVEKTsNCj4gKwlyZXR1cm4gcmV0YWluZWQgPT0g
MDsNCj4gK30NCj4gKw0KPiArLyoqDQo+ICsgKiBwdXJnZWFibGVfc2V0dXBfc2ltcGxlX2JvIC0g
U2V0dXAgVk0gYW5kIGJpbmQgYSBzaW5nbGUgQk8NCj4gKyAqIEBmZDogRFJNIGZpbGUgZGVzY3Jp
cHRvcg0KPiArICogQHZtOiBPdXRwdXQgVk0gaGFuZGxlDQo+ICsgKiBAYm86IE91dHB1dCBCTyBo
YW5kbGUNCj4gKyAqIEBhZGRyOiBWaXJ0dWFsIGFkZHJlc3MgdG8gYmluZCBhdA0KPiArICogQHNp
emU6IFNpemUgb2YgdGhlIEJPDQo+ICsgKiBAdXNlX3NjcmF0Y2g6IFdoZXRoZXIgdG8gdXNlIHNj
cmF0Y2ggcGFnZSBmbGFnDQo+ICsgKg0KPiArICogSGVscGVyIHRvIGNyZWF0ZSBWTSwgQk8sIGFu
ZCBiaW5kIGl0IGF0IHRoZSBzcGVjaWZpZWQgYWRkcmVzcy4NCj4gKyAqLw0KPiArc3RhdGljIHZv
aWQgcHVyZ2VhYmxlX3NldHVwX3NpbXBsZV9ibyhpbnQgZmQsIHVpbnQzMl90ICp2bSwgdWludDMy
X3QgKmJvLA0KPiArCQkJCSAgICAgIHVpbnQ2NF90IGFkZHIsIHNpemVfdCBzaXplLCBib29sDQo+
IHVzZV9zY3JhdGNoKSB7DQo+ICsJc3RydWN0IGRybV94ZV9zeW5jIHN5bmMgPSB7DQo+ICsJCS50
eXBlID0gRFJNX1hFX1NZTkNfVFlQRV9VU0VSX0ZFTkNFLA0KPiArCQkuZmxhZ3MgPSBEUk1fWEVf
U1lOQ19GTEFHX1NJR05BTCwNCj4gKwkJLnRpbWVsaW5lX3ZhbHVlID0gMSwNCj4gKwl9Ow0KPiAr
CXVpbnQ2NF90IHN5bmNfdmFsID0gMDsNCj4gKw0KPiArCSp2bSA9IHhlX3ZtX2NyZWF0ZShmZCwg
dXNlX3NjcmF0Y2ggPw0KPiBEUk1fWEVfVk1fQ1JFQVRFX0ZMQUdfU0NSQVRDSF9QQUdFIDogMCwg
MCk7DQo+ICsJKmJvID0geGVfYm9fY3JlYXRlKGZkLCAqdm0sIHNpemUsIHZyYW1faWZfcG9zc2li
bGUoZmQsIDApLA0KPiArDQo+IERSTV9YRV9HRU1fQ1JFQVRFX0ZMQUdfTkVFRFNfVklTSUJMRV9W
UkFNKTsNCj4gKw0KPiArCXN5bmMuYWRkciA9IHRvX3VzZXJfcG9pbnRlcigmc3luY192YWwpOw0K
PiArCXhlX3ZtX2JpbmRfYXN5bmMoZmQsICp2bSwgMCwgKmJvLCAwLCBhZGRyLCBzaXplLCAmc3lu
YywgMSk7DQo+ICsJeGVfd2FpdF91ZmVuY2UoZmQsICZzeW5jX3ZhbCwgMSwgMCwgTlNFQ19QRVJf
U0VDKTsgfQ0KPiArDQo+ICsvKioNCj4gKyAqIFNVQlRFU1Q6IGRvbnRuZWVkLWJlZm9yZS1tbWFw
DQo+ICsgKiBEZXNjcmlwdGlvbjogTWFyayBCTyBhcyBET05UTkVFRCBiZWZvcmUgbW1hcCwgdmVy
aWZ5IG1tYXAgZmFpbHMgb3INCj4gK1NJR0JVUyBvbiBhY2Nlc3MNCj4gKyAqIFRlc3QgY2F0ZWdv
cnk6IGZ1bmN0aW9uYWxpdHkgdGVzdA0KPiArICovDQo+ICtzdGF0aWMgdm9pZCB0ZXN0X2RvbnRu
ZWVkX2JlZm9yZV9tbWFwKGludCBmZCwgc3RydWN0DQo+ICtkcm1feGVfZW5naW5lX2NsYXNzX2lu
c3RhbmNlICpod2UpIHsNCj4gKwl1aW50MzJfdCBibywgdm07DQo+ICsJdWludDY0X3QgYWRkciA9
IFBVUkdFQUJMRV9BRERSOw0KPiArCXNpemVfdCBib19zaXplID0gUFVSR0VBQkxFX0JPX1NJWkU7
DQo+ICsJdm9pZCAqbWFwOw0KPiArDQo+ICsJcHVyZ2VhYmxlX3NldHVwX3NpbXBsZV9ibyhmZCwg
JnZtLCAmYm8sIGFkZHIsIGJvX3NpemUsIGZhbHNlKTsNCj4gKwlpZiAoIXB1cmdlYWJsZV9tYXJr
X2FuZF92ZXJpZnlfcHVyZ2VkKGZkLCB2bSwgYWRkciwgYm9fc2l6ZSkpDQo+ICsJCWlndF9za2lw
KCJVbmFibGUgdG8gaW5kdWNlIHB1cmdlIG9uIHRoaXMgcGxhdGZvcm0vY29uZmlnIik7DQo+ICsN
Cj4gKwkvKiBtbWFwIHRoZSBwdXJnZWQgQk8gLSBhY2Nlc3Mgc2hvdWxkIHRyaWdnZXIgU0lHQlVT
ICovDQo+ICsJbWFwID0geGVfYm9fbWFwKGZkLCBibywgYm9fc2l6ZSk7DQo+ICsNCj4gKwl7DQo+
ICsJCXNpZ2hhbmRsZXJfdCBvbGRfc2lnc2Vndiwgb2xkX3NpZ2J1czsNCj4gKwkJY2hhciAqcHRy
ID0gKGNoYXIgKiltYXA7DQo+ICsJCWludCBzaWc7DQo+ICsNCj4gKwkJb2xkX3NpZ3NlZ3YgPSBz
aWduYWwoU0lHU0VHViwgKF9fc2lnaGFuZGxlcl90KXNpZ3RyYXApOw0KPiArCQlvbGRfc2lnYnVz
ID0gc2lnbmFsKFNJR0JVUywgKF9fc2lnaGFuZGxlcl90KXNpZ3RyYXApOw0KPiArDQo+ICsJCXNp
ZyA9IHNpZ3NldGptcChqbXAsIFNJR0JVUyB8IFNJR1NFR1YpOw0KPiArCQlzd2l0Y2ggKHNpZykg
ew0KPiArCQljYXNlIFNJR0JVUzoNCj4gKwkJY2FzZSBTSUdTRUdWOg0KPiArCQkJLyogRXhwZWN0
ZWQgLSBwdXJnZWQgQk8gYWNjZXNzIGZhaWxlZCAqLw0KPiArCQkJYnJlYWs7DQo+ICsJCWNhc2Ug
MDoNCj4gKwkJCSpwdHIgPSAwOw0KPiArCQkJX19hdHRyaWJ1dGVfXyAoKGZhbGx0aHJvdWdoKSk7
DQo+ICsJCWRlZmF1bHQ6DQo+ICsJCQlpZ3RfYXNzZXJ0X2YoZmFsc2UsDQo+ICsJCQkJICAgICAi
QWNjZXNzIHRvIHB1cmdlZCBtbWFwIHNob3VsZCB0cmlnZ2VyDQo+IFNJR0JVUywgZ290IHNpZz0l
ZFxuIiwNCj4gKwkJCQkgICAgIHNpZyk7DQo+ICsJCQlicmVhazsNCj4gKwkJfQ0KPiArDQo+ICsJ
CXNpZ25hbChTSUdCVVMsIG9sZF9zaWdidXMpOw0KPiArCQlzaWduYWwoU0lHU0VHViwgb2xkX3Np
Z3NlZ3YpOw0KPiArCQltdW5tYXAobWFwLCBib19zaXplKTsNCj4gKwl9DQo+ICsNCj4gKwlnZW1f
Y2xvc2UoZmQsIGJvKTsNCj4gKwl4ZV92bV9kZXN0cm95KGZkLCB2bSk7DQo+ICt9DQo+ICsNCj4g
K2ludCBpZ3RfbWFpbigpDQo+ICt7DQo+ICsJc3RydWN0IGRybV94ZV9lbmdpbmVfY2xhc3NfaW5z
dGFuY2UgKmh3ZTsNCj4gKwlpbnQgZmQ7DQo+ICsNCj4gKwlpZ3RfZml4dHVyZSgpIHsNCj4gKwkJ
ZmQgPSBkcm1fb3Blbl9kcml2ZXIoRFJJVkVSX1hFKTsNCj4gKwkJeGVfZGV2aWNlX2dldChmZCk7
DQo+ICsJfQ0KPiArDQo+ICsJaWd0X3N1YnRlc3QoImRvbnRuZWVkLWJlZm9yZS1tbWFwIikNCj4g
KwkJeGVfZm9yX2VhY2hfZW5naW5lKGZkLCBod2UpIHsNCj4gKwkJCXRlc3RfZG9udG5lZWRfYmVm
b3JlX21tYXAoZmQsIGh3ZSk7DQo+ICsJCQlicmVhazsNCj4gKwkJfQ0KPiArDQo+ICsJaWd0X2Zp
eHR1cmUoKSB7DQo+ICsJCXhlX2RldmljZV9wdXQoZmQpOw0KPiArCQlkcm1fY2xvc2VfZHJpdmVy
KGZkKTsNCj4gKwl9DQo+ICt9DQpSZXZpZXdlZC1ieTogUHJhdmFsaWthIEd1cnJhbSA8cHJhdmFs
aWthLmd1cnJhbUBpbnRlbC5jb20+DQo+IGRpZmYgLS1naXQgYS90ZXN0cy9tZXNvbi5idWlsZCBi
L3Rlc3RzL21lc29uLmJ1aWxkIGluZGV4DQo+IDBhZDcyOGI4Ny4uOWQ0MWQ3ZGU2IDEwMDY0NA0K
PiAtLS0gYS90ZXN0cy9tZXNvbi5idWlsZA0KPiArKysgYi90ZXN0cy9tZXNvbi5idWlsZA0KPiBA
QCAtMzEzLDYgKzMxMyw3IEBAIGludGVsX3hlX3Byb2dzID0gWw0KPiAgCSd4ZV9odWNfY29weScs
DQo+ICAJJ3hlX2ludGVsX2JiJywNCj4gIAkneGVfbGl2ZV9rdGVzdCcsDQo+ICsJJ3hlX21hZHZp
c2UnLA0KPiAgCSd4ZV9tZWRpYV9maWxsJywNCj4gIAkneGVfbW1hcCcsDQo+ICAgICAgICAgICd4
ZV9tb2R1bGVfbG9hZCcsDQo+IC0tDQo+IDIuNDMuMA0KDQo=
