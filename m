Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1CFEC02188
	for <igt-dev@archiver.kernel.org>; Mon, 27 Jan 2025 16:38:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DC0610E213;
	Mon, 27 Jan 2025 16:38:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j1JZT5b9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D456610E213
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Jan 2025 16:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737995924; x=1769531924;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2IGtnTQ2a265uBZjWCqh9Vmeg3F/Ss082PVOa23HfYg=;
 b=j1JZT5b9aTn1ovJh+kGsYcsa2gnVqLlBBklvELfYuz7+83Qofb1sOIAB
 wst5JCIoGG1hrEUTX/iQOMyjLAgJtkgxZ9QtPq09U8eiD05WEsiJxTLAF
 TdIbq/fJ+zsKDoO/LMR9ZCQlZt+XD6IsRS/6RZ/M900k7v8+s8BK8SYhx
 PBqyqPEIA9q4XlUzArlcSyF47Eu4GCviD+FpXUrkwRJ6SJNVj0PqoFcBH
 UDIjufGpPXa+Ms+XY8HkTAvUr9cCAIo1zmcK0kvcVxe1D5m3DWASm4kVR
 Zf8NAr0FlUgRXZGzzGi4A+nvx12PQM/RhfswtSt6ZaOzYQL/bcTDFaaaU g==;
X-CSE-ConnectionGUID: DTq8clEBSCCuo8nVIpTqvg==
X-CSE-MsgGUID: WtOZ5pYXSoaFEnyAZt6Vjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11328"; a="37666442"
X-IronPort-AV: E=Sophos;i="6.13,238,1732608000"; d="scan'208";a="37666442"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2025 08:38:43 -0800
X-CSE-ConnectionGUID: OxbAf77yRtSam7l4VJrPTg==
X-CSE-MsgGUID: Dx2oXiD+RW6g/VDQk32PZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,238,1732608000"; d="scan'208";a="108300223"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Jan 2025 08:38:43 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 27 Jan 2025 08:38:42 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 27 Jan 2025 08:38:42 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 27 Jan 2025 08:38:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ELhmq2EddD17TWHEVnh+x+bv9WKitMkK4xzZW9diFY1/JoA38yxCRQ2oHSxu6FdQKLb4/s7hzhEcBPSjHlH2TLGa/mpMo3506ISPY+qA2Xtpv1DMHdlq3hwXEUZTW9kqrdqb7Aw24vvW+3rQzf148iaPZFROkEbsgWcSAikuc2iFjQBQahKKuhbVYXX4Jfxz65sG4hfKDLwCVd4SG0Cggckg2DwFEocB+7Zdvd7AA5XsqQfOwHbmm5fk9H/RfwTL1GKlD+JbOIrrXRECu88HZJZ+xbNPZdp+H/5IGGesMoeizSfNh04tuXBVQhYtj1hSpfmU/MxnoHYNmFnDcbifng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2IGtnTQ2a265uBZjWCqh9Vmeg3F/Ss082PVOa23HfYg=;
 b=TdfFVRZdXbjerPUnzqMJGnopW/wUiHHQhXljKYptxp44H4boyAlvzTJEyuWQISMdnFsQhyiurWfStf5nYrkpG/acAWha6L9QfzW05R3VhxSPxEBPGv0XBZeP+NXTbXTK76nmuEp/liZfOTc85GpwnYth5aeq39B1jJmDdcNYURuaZblRu3oBg/cyiEANwfWyEUT87IaQ8L/DmjJE6CSwmm+krAMmhbE3lhGw7AJvsva3+FQvEa2DQgoEwUG04yiekd+TsdRmK5VOOtJ6gkVTXhtb79ElnY6bT37VG+/lgmOPEaOlEtdaFIFid6MxHbySS9PZxGcH6bHdewjor8+NFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by SA3PR11MB7556.namprd11.prod.outlook.com (2603:10b6:806:31f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.20; Mon, 27 Jan
 2025 16:38:24 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.8377.021; Mon, 27 Jan 2025
 16:38:24 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: Peter Senna Tschudin <peter.senna@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Rodrigo.Siqueira@amd.com" <Rodrigo.Siqueira@amd.com>, "Gandi, Ramadevi"
 <ramadevi.gandi@intel.com>, "Knop, Ryszard" <ryszard.knop@intel.com>,
 "Lattannavar, Sameer" <sameer.lattannavar@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, "Saarinen, Jani" <jani.saarinen@intel.com>,
 "Piecielska, Katarzyna" <katarzyna.piecielska@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>, "Taylor, Clinton A"
 <clinton.a.taylor@intel.com>, "Yu, Jianshui" <jianshui.yu@intel.com>,
 "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>,
 "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH i-g-t v3 1/2] lib/igt_kmemleak: library to interact with
 kmemleak
Thread-Topic: [PATCH i-g-t v3 1/2] lib/igt_kmemleak: library to interact with
 kmemleak
Thread-Index: AQHbcNGf/MqtXVY3uUyo+RWQOrC3m7Mqz98A
Date: Mon, 27 Jan 2025 16:38:24 +0000
Message-ID: <CH0PR11MB5444D075498A1D44B88C7230E5EC2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250121112944.115491-1-peter.senna@linux.intel.com>
 <20250127152813.293529-1-peter.senna@linux.intel.com>
 <20250127152813.293529-2-peter.senna@linux.intel.com>
In-Reply-To: <20250127152813.293529-2-peter.senna@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|SA3PR11MB7556:EE_
x-ms-office365-filtering-correlation-id: a846dda7-cb3e-44d2-4f7d-08dd3ef104a2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?cjYzbEh3QWtDS3VUQ2ZyOWVOUERmQWJnYXVqWnkzTERBbXczaG12c1htcEVr?=
 =?utf-8?B?ZGYzRDk1M0dEeE9rTU9oTDJCdFYzN0RhMDZIQ2g5K2lWMk82T0hBMnpYN1l1?=
 =?utf-8?B?RTZsMlVqVUxYODFRNitSZGREb250V0JaT0ZLWHk2cWZoQTlOQ0IrcEpmU1I2?=
 =?utf-8?B?cWNHRHZSRmNVYU03S2FlRjBHZVgwUkhQNmRnNFdnT1pKVE1OQ1lyZnJCYVFw?=
 =?utf-8?B?K3M1eWZFZzNWaUZGWjI4UmdRTVNwRU9qNzJrTTltRXJWdzhHQzV2L3lmRS9i?=
 =?utf-8?B?UXIwc2xBTzNtUmVORGxEY3RWT1pkb3NmZnBFeVZMak5IOEhDUHQ3bms3Q2dl?=
 =?utf-8?B?Z2JCS0JyOXgyN3dwNFRzazRBTHRWL0YzR292b1dYMWRtbW1ZRHFjdGdLT3l3?=
 =?utf-8?B?TE4rem1HYjBZUWdPMHlNR1FMT2ZIVHVPWGVIZnJoVUd1bmtUcHN3OVduRDRH?=
 =?utf-8?B?U1RsSDJqQ01Id3Y3TTJYNzJEUjg3K1FxRU9Nb0E0Znk4aUlCZ3JrdGdOQm95?=
 =?utf-8?B?ZTc0MzVZSDJGR2tmSnJWZm16alZOSlM3REVnajJMQ2R1WnBMR1kvMFVaaWJi?=
 =?utf-8?B?SkNETUVUa3ZUa2U3NkUyR3F2cXZuL0J4d2JtcllXUitWNDdDWG9YZkdOOVh0?=
 =?utf-8?B?TmxrdFpyaGpEcStjVGxLTFZXajVCTDJEQUJYVTI1TjBFV3k5ZHBvVUlxU05Y?=
 =?utf-8?B?eXlHWXhNd0xoZWx0d2g5emkvV0tic1VoUXhzSU50RWh1VVE1UmxKYU5rNDdv?=
 =?utf-8?B?RFBEZ09zaDI5RHd0cE03Uk9QYm5JTW5uQTBiNUJaZlBjZWJBWTBqQ2c1UVpK?=
 =?utf-8?B?TmRNNEc2WWxycFhtcUdVdFp2SXVmbi9LeWZqS3YvbkdIMUw1Nk1tTFNJWHAx?=
 =?utf-8?B?S3krcVBGYWRwcFE0UTk0Z3BkMHNFcjZLeWQyTGJPSFNZanJIaHBFQzVVa3VQ?=
 =?utf-8?B?SzVzSUpZV0hYYSsrMGI3ZDNDeHdzY3g2em1Sd0tKTzhyWldMSEMxaFJiYlNa?=
 =?utf-8?B?ZlBwck42cG1lTlhnRUtxcWVlVUNBRlo5S0JvM3d0cDNKUWpwb2ZXUlFUc0hv?=
 =?utf-8?B?aUErRWw1YjRxdmtybUx2c3BFcFllcDRUa3VtVUsxNXBNUW1wdXRqWmhkOFQ5?=
 =?utf-8?B?c0dpU1lDQW5aUmMyMng4UU01RkZ6Ymw2ZmN0WkdvUklKMThwMUZ5T1FjMlY0?=
 =?utf-8?B?R2F1c0pJL3RFcUJBM2EzZWVBejZOUXlIOUtvMmRBUWZZUFgwdDFOVWs1cGpK?=
 =?utf-8?B?SWdMSUNrV0ovUXptMkZXVW5JeHNhbmc5ME9DVlphT1g1Y1BSME52V20rbGlY?=
 =?utf-8?B?RDluUm1yOGU3czFLMGpRYm13R1I0THhtQ01SRHdydTlTaytpaDlhVVo5Wm1P?=
 =?utf-8?B?SUlQSXBwV3lqODdvcFN0ZXRHa1dKQTh0UVArWkR2Q2FxSXRTb1J4NXIvRFJt?=
 =?utf-8?B?eEVnYzN1V25jbTZHUVc5b3MvWmh1K21rb1huTVQxbTBKRDNmdmpiWXFrNmFK?=
 =?utf-8?B?Snh0Rzk0VjhkcG9JSUhqZXMwYjlvdWFFelVtcWV4d3ZPTGNDQnA3UzU4TnVH?=
 =?utf-8?B?aXNpUlNhS0RHQjJNazkwanp1ODF3Wk1MYlNvUlZ1QUdWOHhRaUFKYmNMNFZi?=
 =?utf-8?B?NXpTbjZpNG9SRm9uRDZBby81SXI2ZFVGY3pSYS9zanUwQ3NTU296aGpweXF3?=
 =?utf-8?B?SGROc3R0T2VMZkFRcno3Qk1hWUN1UWR0QVhDWUtQYng2QUVWdXJTQjY3NHJO?=
 =?utf-8?B?UVA3V2p0SlFuQ243ZGZzUnNaRHM1QlBhYlVKNzJtMzhoWmZ0RDhDUmlQUzdJ?=
 =?utf-8?B?OTJ2YnNEYVhWaGtZM3Q0MzAvcnpRVE8xRzQzY2kxM3laS1RUR0Z3N1pYMm9q?=
 =?utf-8?B?VER6S3NNdmxDRDNDckIrcGlOMzEwa0Q2dHB6QUF1R1NxZzB0NFdkT0Z2Q2Vm?=
 =?utf-8?Q?MzAsK5zwyUXiw6BC4KJGESn4HGt54Trr?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SGRPdFg5ajBkZ0lwVitHamx0cEMrNTRocElrVStXWklmakE1bEc3OGQ4a1RJ?=
 =?utf-8?B?MlhKOUtSRVdsaktVZWVVbTNQWWVqaWorbjREMWVyR0VvSzNTUEkwKytEVzdw?=
 =?utf-8?B?K2FqQjMza3BPeGlvaVpPZEk4Z09tSW95alpRRFdpU2NqTjJyY004NWYrWUd0?=
 =?utf-8?B?aU9TeG9OS2MwaHFweHdNTnZsM1RiQWpERTFDMWdoU0drdUpEako3NGFjczRv?=
 =?utf-8?B?b0IrQjcrMkRvbGt3MHpPNHQ0L2FIWUtZK0twNEM2Sjc2SjFCSjVNcnlIbXNF?=
 =?utf-8?B?QStCWFZ5MFRCWXpoMVU4Vk9oWnp0cVJJU1BwU2svTWt6bjExWUdvNjVhbm1a?=
 =?utf-8?B?emwzT2RCbmhqWk1aM0o2cnRLUURiaEtJNUpja0pjOHFVbWFac3p4U01Panhi?=
 =?utf-8?B?Zkw2YUg2OHlyNURKODRYSUhTQ2dMSXJpbUlQQVpzcjErVUNkNTFaVm10dGQv?=
 =?utf-8?B?QmxCaWJmWUl5bCthWjV4ajg2b1lsbElGSnpYTDcwL1VqUnQwUHl2Q094SEZ4?=
 =?utf-8?B?Y0pxK0kwT3A0WWNQSmZWbW9iUzJMa0I1SXIrNmoycm54YkQwenlDSVh2S3Z1?=
 =?utf-8?B?U3lscjNnOUJyOFc5UW9PRURWcjU0SmZVL2k4WmVzdklyc0ZSVWJ3KzFDZFdp?=
 =?utf-8?B?c0ZrdkpsVWtEVDVxZVJNWU1OS2IrN2Q5MTRzN3J1cS9mcXQwYVIzNlVKbjhP?=
 =?utf-8?B?ZWxWZktQSjd3SDBKdG5HUkxXaVRxZ2NGT2dpaE1DWUcyeTJuU01YYk52eTYy?=
 =?utf-8?B?NS8yR1EvY29UQXR4QXRURkliRTdtVDJ4anNVZTVUa2oxbEJ0ZVlMYUltUzZ3?=
 =?utf-8?B?Y3pjYUtVc2dTSks3YnV3QUxBN3Z5OTRXMENjWkRwM0JYclIwenpSeFRFRml3?=
 =?utf-8?B?bE5SRnd1elZTbmhtMm11NGhSYWtDYXA0b016WThuVGRrMUpLV1pZU1Vjckhv?=
 =?utf-8?B?bVNqWWJ3eXBCTWgvUFcwbTJQVDMvb2Q5L3BiTVh3cThIcHE3d0ZqSGNDbitP?=
 =?utf-8?B?SXhtZ1NibWJ5YjFjM2hadWtUcytpTnBXWElsM25Zajl4UE44WC8ycGhsWU5L?=
 =?utf-8?B?T2gxNUdIZCsrajlCTWVGckdCRnF3QXFXT2dSR2tKbGtwUm9MRVUyUmVwN25y?=
 =?utf-8?B?ZUplYisvMEJLcExLeVl3RjNjaW9Dc1V4TU9paGh1T3V5UkpzWjdmUHFzektl?=
 =?utf-8?B?bWhJcWx3OHVCQ3lVdHd2SkVWanVhRjE5cmRPUlVLRFVQWFlkYmhjcERwL0h2?=
 =?utf-8?B?U0pCbG9aZVRFREMwYi8zeWg4Z1RWUjFMT3plTUViRmFFajRkRGVUY0RoZmkv?=
 =?utf-8?B?ZnRxbmczeWFHZElLQklWdVJSV0I3MVljNlV6L0RhZVBBSTlsY0VKUVVrL0Jn?=
 =?utf-8?B?anlBT1hXSDNoZ1BjczlaaXFkT2N5R25pbGx4bXNmd1ZndWRHRW1ROStaeUNh?=
 =?utf-8?B?TE1qRjJRNE1qUTMxWjhQZjJhWml6bFRndHNoL3JmdldsaFhoV1BuRXRJVXMr?=
 =?utf-8?B?K1BVWXdiL0VCdVc4K1RwNElSN0s5N2NrRHgrUll6V3lJSDZvdTBSQ0tZT2hr?=
 =?utf-8?B?d0ZrNXBlUUw2b05YMjRzcmJDSWNlNDNNNXpaRk9kN1gya213dnpqbENoZzR3?=
 =?utf-8?B?cmpuZ2x6d29KU3ZUOUswUzhuV2F2c29VdkovQ3BZNnYrUDYxdnpITnkrV0JK?=
 =?utf-8?B?RmJMWkF4YUh3eEtWNFZPSGkxc0t1alo3dmFrS0llQXF2TGoxN1dPR1dvTnFj?=
 =?utf-8?B?OVh2bHhpc3l5aFJsajZXbTl5a21Qb243UGFST1BHcW5RRnRlN1BSdVQrMWVm?=
 =?utf-8?B?bEdrWU5SZXF1NlJMdkNob1huNjE3QlFRL1BkYU9EekpmTFQ4a0ZEZTJ5cEJC?=
 =?utf-8?B?STlvQ0praU9JMDAvVVZvQ0xBaHQ0dmtOTk9xekJoR2JnOWFVUGZ4SEd5T0RD?=
 =?utf-8?B?dTU2cVREWWRZZnRjOFhsOWdHcFc1cmhJeFp6RUZoWm81TzBFU0ljUlcyYXVP?=
 =?utf-8?B?UjhxNjZ0WmZFZkpUNlBNMnpMdDhOb2VWdFhJdXExMmdvZHErcFpMRmtBdXRG?=
 =?utf-8?B?VCtwSXJBb04xek14YS9mRnMwdVNoVlJabFVFUTVzN1d3OTBXVTlITHFqUWZN?=
 =?utf-8?Q?xHkvIy9VXZ46kkdMOt8IankgP?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a846dda7-cb3e-44d2-4f7d-08dd3ef104a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jan 2025 16:38:24.1745 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nJK9rpuaan5teotAlE5fCtc465KFBmffdDgmFR5PFO/HLTfrzeN+X1zlfcQlPVcBddX/1goAiMUaAAhYZVetgMNjnExqzxc1D8JRIjonyrg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7556
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

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IFBldGVyIFNlbm5hIFRzY2h1ZGluIDxw
ZXRlci5zZW5uYUBsaW51eC5pbnRlbC5jb20+IA0KU2VudDogTW9uZGF5LCBKYW51YXJ5IDI3LCAy
MDI1IDc6MjggQU0NClRvOiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KQ2M6IFBldGVy
IFNlbm5hIFRzY2h1ZGluIDxwZXRlci5zZW5uYUBsaW51eC5pbnRlbC5jb20+OyBSb2RyaWdvLlNp
cXVlaXJhQGFtZC5jb207IEdhbmRpLCBSYW1hZGV2aSA8cmFtYWRldmkuZ2FuZGlAaW50ZWwuY29t
PjsgS25vcCwgUnlzemFyZCA8cnlzemFyZC5rbm9wQGludGVsLmNvbT47IExhdHRhbm5hdmFyLCBT
YW1lZXIgPHNhbWVlci5sYXR0YW5uYXZhckBpbnRlbC5jb20+OyBEZSBNYXJjaGksIEx1Y2FzIDxs
dWNhcy5kZW1hcmNoaUBpbnRlbC5jb20+OyBTYWFyaW5lbiwgSmFuaSA8amFuaS5zYWFyaW5lbkBp
bnRlbC5jb20+OyBQaWVjaWVsc2thLCBLYXRhcnp5bmEgPGthdGFyenluYS5waWVjaWVsc2thQGlu
dGVsLmNvbT47IFJvcGVyLCBNYXR0aGV3IEQgPG1hdHRoZXcuZC5yb3BlckBpbnRlbC5jb20+OyBU
YXlsb3IsIENsaW50b24gQSA8Y2xpbnRvbi5hLnRheWxvckBpbnRlbC5jb20+OyBZdSwgSmlhbnNo
dWkgPGppYW5zaHVpLnl1QGludGVsLmNvbT47IFZpdmVrYW5hbmRhbiwgQmFsYXN1YnJhbWFuaSA8
YmFsYXN1YnJhbWFuaS52aXZla2FuYW5kYW5AaW50ZWwuY29tPjsgQ2F2aXR0LCBKb25hdGhhbiA8
am9uYXRoYW4uY2F2aXR0QGludGVsLmNvbT4NClN1YmplY3Q6IFtQQVRDSCBpLWctdCB2MyAxLzJd
IGxpYi9pZ3Rfa21lbWxlYWs6IGxpYnJhcnkgdG8gaW50ZXJhY3Qgd2l0aCBrbWVtbGVhaw0KPiAN
Cj4gQWRkcyBhIHNpbXBsZSBsaWJyYXJ5IGZvciBpbnRlcmFjdGluZyB3aXRoIGttZW1sZWFrIGFu
ZCBhZGQNCj4gdW5pdCB0ZXN0aW5nIGZvciB0aGUgbGlicmFyeS4gVGhlcmUgYXJlIHR3byBtb2Rl
cyBpbnRlbmRlZCB0bw0KPiBpbnRlZ3JhdGUgd2l0aCBpZ3RfcnVubmVyOg0KPiAtIG9uY2U6IGNv
bGxlY3Qga21lbWxlYWtzIGFmdGVyIGFsbCB0ZXN0IGNvbXBsZXRlZA0KPiAtIGVhY2g6IGNvbGxl
Y3Qga21lbWxlYWtzIGFmdGVyIGVhY2hiIHRlc3QgY29tcGxldGVzDQo+IA0KPiBUbyB1c2UgdGhl
IGxpYnJhcnkgaW5jbHVkZSAiaWd0X2ttZW1sZWFrLmgiLCBjYWxsDQo+IGlndF9rbWVtbGVha19p
bml0KE5VTEwpIHRvIGNoZWNrIGlmIGttZW1sZWFrIGlzIGVuYWJsZWQgYW5kIGZpbmFsbHkNCj4g
Y2FsbCBpZ3Rfa21lbWxlYWsoKSB0byBjb2xsZWN0IGttZW1sZWFrcy4gaWd0X2ttZW1sZWFrKCkg
ZXhwZWN0IHRoZQ0KPiBmb2xsb3dpbmcgYXJndW1lbnRzOg0KPiAgIC0gY29uc3QgY2hhciAqbGFz
dF90ZXN0OiBOYW1lIG9mIHRoZSBsYXN0IGxlc3Qgb3IgTlVMTA0KPiAgIC0gaW50IHJlc2RpcmZk
OiBmaWxlIGRlc2NyaXB0b3Igb2YgdGhlIHJlc3VsdHMgZGlyZWN0b3J5DQo+ICAgLSBib29sIGtt
ZW1sZWFrX2VhY2g6IEFyZSB3ZSBzY2FubmluZyBvbmNlIG9yIHNjYW5uaW5nIGFmdGVyDQo+ICAg
ICBlYWNoIHRlc3Q/DQo+ICAgLSBib29sIHN5bmM6IHN5bmMgYWZ0ZXIgZWFjaCB3cml0ZT8NCj4g
DQo+IENDOiBSb2RyaWdvLlNpcXVlaXJhQGFtZC5jb20NCj4gQ0M6IHJhbWFkZXZpLmdhbmRpQGlu
dGVsLmNvbQ0KPiBDQzogcnlzemFyZC5rbm9wQGludGVsLmNvbQ0KPiBDQzogc2FtZWVyLmxhdHRh
bm5hdmFyQGludGVsLmNvbQ0KPiBDQzogbHVjYXMuZGVtYXJjaGlAaW50ZWwuY29tDQo+IENDOiBq
YW5pLnNhYXJpbmVuQGludGVsLmNvbQ0KPiBDQzoga2F0YXJ6eW5hLnBpZWNpZWxza2FAaW50ZWwu
Y29tDQo+IENDOiBtYXR0aGV3LmQucm9wZXJAaW50ZWwuY29tDQo+IENDOiBjbGludG9uLmEudGF5
bG9yQGludGVsLmNvbQ0KPiBDQzogamlhbnNodWkueXVAaW50ZWwuY29tDQo+IENDOiBiYWxhc3Vi
cmFtYW5pLnZpdmVrYW5hbmRhbkBpbnRlbC5jb20NCj4gDQo+IFJldmlld2VkLWJ5OiBqb25hdGhh
bi5jYXZpdHRAaW50ZWwuY29tDQoNCk15IHJldmlld2VkLWJ5IHN0aWxsIHN0YW5kcywgdGhvdWdo
IEkgaGF2ZSBhIE5JVC9jb25jZXJuIGJlbG93Og0KDQo+IFNpZ25lZC1vZmYtYnk6IFBldGVyIFNl
bm5hIFRzY2h1ZGluIDxwZXRlci5zZW5uYUBsaW51eC5pbnRlbC5jb20+DQo+IC0tLQ0KPiAgbGli
L2lndF9rbWVtbGVhay5jICAgICAgIHwgMjc0ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKw0KPiAgbGliL2lndF9rbWVtbGVhay5oICAgICAgIHwgIDE2ICsrKw0KPiAgbGli
L21lc29uLmJ1aWxkICAgICAgICAgIHwgICAxICsNCj4gIGxpYi90ZXN0cy9pZ3Rfa21lbWxlYWsu
YyB8IDI2NyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiAgbGliL3Rl
c3RzL21lc29uLmJ1aWxkICAgIHwgICAxICsNCj4gIDUgZmlsZXMgY2hhbmdlZCwgNTU5IGluc2Vy
dGlvbnMoKykNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBsaWIvaWd0X2ttZW1sZWFrLmMNCj4gIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBsaWIvaWd0X2ttZW1sZWFrLmgNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0
NCBsaWIvdGVzdHMvaWd0X2ttZW1sZWFrLmMNCj4gDQoNClsuLi5dDQoNCj4gKw0KPiArCWlndF9z
dWJ0ZXN0X2dyb3VwIHsNCj4gKwkJaWd0X3N1YnRlc3QoInRlc3RfaWd0X2ttZW1sZWFrX29uY2Ui
KQ0KPiArCQkJaWd0X2Fzc2VydChpZ3Rfa21lbWxlYWsoTlVMTCwgcmVzZGlyZmQsIGZhbHNlLCBm
YWxzZSkpOw0KPiArDQo+ICsJCWlndF9zdWJ0ZXN0KCJ0ZXN0X2lndF9rbWVtbGVha19lYWNoIikg
ew0KPiArCQkJaWd0X2Fzc2VydChpZ3Rfa21lbWxlYWsoInRlc3RfbmFtZV8xIiwgcmVzZGlyZmQs
DQo+ICsJCQkJCQl0cnVlLCBmYWxzZSkpOw0KPiArCQkJaWd0X2Fzc2VydChpZ3Rfa21lbWxlYWso
InRlc3RfbmFtZV8yIiwgcmVzZGlyZmQsDQo+ICsJCQkJCQl0cnVlLCBmYWxzZSkpOw0KPiArCQkJ
aWd0X2Fzc2VydChpZ3Rfa21lbWxlYWsoInRlc3RfbmFtZV8zIiwgcmVzZGlyZmQsDQo+ICsJCQkJ
CQl0cnVlLCBmYWxzZSkpOw0KDQpOSVQ6DQpJSVJDLCBpbiB0aGUgZmlyc3QgcmV2aXNpb24gb2Yg
dGhlc2UgdGVzdHMsIHdoZW4gaWd0X2ttZW1sZWFrX2luaXQgd2FzIGluIGNoYXJnZSBvZiB0aGUg
c3luYw0KdmFsdWUsIHdlIHdlcmUgcGFzc2luZyBhIHZhbHVlIG9mICJ0cnVlIiBmb3Igc3luYy4g
IFdhcyB0aGF0IGltcG9ydGFudCB0byBwcmVzZXJ2ZSwgb3IgaXMgaXQNCmFjY2VwdGFibGUgdG8g
cGFzcyBmYWxzZSBoZXJlIGFzIHdlIGRvIGN1cnJlbnRseT8NCi1Kb25hdGhhbiBDYXZpdHQNCg0K
PiArCQl9DQo+ICsJCWlndF9maXh0dXJlIHsNCj4gKwkJCWNsb3NlKHJlc2RpcmZkKTsNCj4gKwkJ
fQ0KPiArCX0NCj4gKwlpZ3RfZml4dHVyZQ0KPiArCQl1bmxpbmthdChyZXNkaXJmZCwgS01FTUxF
QUtSRVNGSUxFTkFNRSwgMCk7DQo+ICt9DQo+IGRpZmYgLS1naXQgYS9saWIvdGVzdHMvbWVzb24u
YnVpbGQgYi9saWIvdGVzdHMvbWVzb24uYnVpbGQNCj4gaW5kZXggMWNlMTlmNjNjLi41YzQyNDA4
ZDUgMTAwNjQ0DQo+IC0tLSBhL2xpYi90ZXN0cy9tZXNvbi5idWlsZA0KPiArKysgYi9saWIvdGVz
dHMvbWVzb24uYnVpbGQNCj4gQEAgLTE2LDYgKzE2LDcgQEAgbGliX3Rlc3RzID0gWw0KPiAgICAg
ICAgICAnaWd0X2t0YXBfcGFyc2VyJywNCj4gIAknaWd0X2xpc3Rfb25seScsDQo+ICAJJ2lndF9p
bnZhbGlkX3N1YnRlc3RfbmFtZScsDQo+ICsJJ2lndF9rbWVtbGVhaycsDQo+ICAJJ2lndF9uZXN0
aW5nJywNCj4gIAknaWd0X25vX2V4aXQnLA0KPiAgCSdpZ3RfcnVubmVyY29tbXNfcGFja2V0cycs
DQo+IC0tIA0KPiAyLjM0LjENCj4gDQo+IA0K
