Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5A46C02198
	for <igt-dev@archiver.kernel.org>; Fri, 14 Feb 2025 10:23:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D6F610EC34;
	Fri, 14 Feb 2025 10:23:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ey0wGOqs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D24E810EC34
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Feb 2025 10:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739528590; x=1771064590;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=76LYHpGAUNMIcz2yDVhw1Mo6epqYbb8PjDkuKmZxrP0=;
 b=Ey0wGOqsqluNBBjCrXGV173c1zQlCHMQCC45sgaJomMVP2PHjZnZK7vO
 HK9bBRoSy8QIm5Q3Bv8Q00mgn+2JX/OIQkoE99r+5X/WqKXltoVvxYeC5
 sFuTY2RJZhaC2rgUFHUvMLRjiYNdJUW4CYiXVZ+/HaiADk+cdLZUcvuOq
 bD10ZPZTcbIxXkAGl6i8rVaLEJ+/GRqKvTR6JbAmKptlBu2PWE4M11LAP
 yHh4cKy0JuPUZvRo5TPUH89NYShTxAsluBehrHea51rs8lWKE3tZyi+rG
 mESvf8ut06VLiXkd6LCeDpEw+zZI5NkoiQvEnZllaGcN1FUFj3PxxEHVw w==;
X-CSE-ConnectionGUID: mLA9Ow2AT66EcENiWFm55g==
X-CSE-MsgGUID: VtZjXom8QaSZFeJ6d0WGRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="40136426"
X-IronPort-AV: E=Sophos;i="6.13,285,1732608000"; d="scan'208";a="40136426"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 02:23:10 -0800
X-CSE-ConnectionGUID: NLSNg0G4TUyRsqeUSKgyDA==
X-CSE-MsgGUID: 5tTyC3kaRVSrwyGNyIagHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,285,1732608000"; d="scan'208";a="113401055"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Feb 2025 02:23:10 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 14 Feb 2025 02:23:09 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 14 Feb 2025 02:23:09 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.44) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 14 Feb 2025 02:23:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=stKxbM7TwaWwnxzdHPMMDxya0CRlKAJ82jx39sX3eFO+01kJ3OV3fbp/C4WO6Psv9C+NX4XjK1KJ3W0FNk8ad1OYcuUE6xayGPW3HrkLfDL5kqpua96DSWBDBXGkRKmeEaTFoRfmnrP32tVyYFfjPxuH9Epedm/CUKmQSdfzErKvSxIHS7K27G1Pv7SNQ3Bqkz/OKHMpH271mqAtCQwFyXkRbkExzniI+wIylmDRNvP9K158+ocmu8ptpv5nWf9bfR1D8LN0ot3Po2QAkBNNd4E/DYZifrQ9bWQuTd5AiH5Jt631lSunXfPEFHXPMetyPR3Fs2fkL8LMKbWA2i4Z5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=76LYHpGAUNMIcz2yDVhw1Mo6epqYbb8PjDkuKmZxrP0=;
 b=K4suXnJMZ9LXN4t0q/z20xtTv7R7fkVF1z5PcxyyrwvErdZCfIZAyYK9sG4zcyaU6lIl4+HgYT29Mu67lftwf1ScbZrGDfwftA7PhJw7aGfk9xSQzkewzwZtQg4lNOJ+dm8XEJb9sHi9s8sBOzrvm1DJ2b4i3X8vDQlbHDSITsWJJh6Ed8Nvdu1VBWsygz7JcEUBi7usMy7ofsKLTahTessPsCIxP81N5+lLOykRmL957xJyy3mpVf7qGPOWfPjEXKcfq5Fm4SOQJverTWajbH2vgmRDoB3jJ+sdFkPj3D92KSj6G6zrOqXysF3jqxQEmEkNIgcKAQ4ibv69djCf3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6097.namprd11.prod.outlook.com (2603:10b6:208:3d7::17)
 by SN7PR11MB7018.namprd11.prod.outlook.com (2603:10b6:806:2ad::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Fri, 14 Feb
 2025 10:23:07 +0000
Received: from IA1PR11MB6097.namprd11.prod.outlook.com
 ([fe80::8f29:c6c9:9eb2:6392]) by IA1PR11MB6097.namprd11.prod.outlook.com
 ([fe80::8f29:c6c9:9eb2:6392%6]) with mapi id 15.20.8445.008; Fri, 14 Feb 2025
 10:23:07 +0000
From: "Piecielska, Katarzyna" <katarzyna.piecielska@intel.com>
To: "Sharma, Swati2" <swati2.sharma@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>, "Kempczynski, Zbigniew"
 <zbigniew.kempczynski@intel.com>
Subject: RE: [PATCH i-g-t 3/3] tests/intel/kms_pipe_stress: Fix testplan
 documentation
Thread-Topic: [PATCH i-g-t 3/3] tests/intel/kms_pipe_stress: Fix testplan
 documentation
Thread-Index: AQHbfH+y3/h6A1+xLU+YHRiD+/oZ1rNGm9Pg
Date: Fri, 14 Feb 2025 10:23:07 +0000
Message-ID: <IA1PR11MB609725B38D1A977F7F14536D86FE2@IA1PR11MB6097.namprd11.prod.outlook.com>
References: <20250211122743.329838-1-swati2.sharma@intel.com>
 <20250211122743.329838-4-swati2.sharma@intel.com>
In-Reply-To: <20250211122743.329838-4-swati2.sharma@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6097:EE_|SN7PR11MB7018:EE_
x-ms-office365-filtering-correlation-id: 8a218812-915d-410c-ed43-08dd4ce192dd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?dmVuZkVaQ0VwQlBYUnoyZVhoWW1WOEVGK21CNnBaYy9uTjJPdXFyODE2a3Y5?=
 =?utf-8?B?dEsyUVI5aWYyUlhkRFRiSGdMOUdQd052cVZYR25jUTZuMmxuMGpTTlFhb1NI?=
 =?utf-8?B?VFVzMGpFdXZSMFFYeHpNWkh1aUFkTSsvK0daeXB4MG9EZ1UwTW5jS3BwSzdv?=
 =?utf-8?B?UVd1R3YxQjJNejRlWG54eC81U05odmNtd29FQ050UjJWNlV6Y3lmTEJ5MnJV?=
 =?utf-8?B?V1VCSXJiUUlhR09hM1FtNVQ2WHBaOFRqeTZBazg0VGlVV2RxRGRzdmE0Tk9q?=
 =?utf-8?B?T09KS1lGbXd0OSszYUpHRitTM2V5Y3N0NWtuMXpEZ3gvVmt1RytWR0M2RkNl?=
 =?utf-8?B?WGs2ZHl5RFlmUVNjMTloYjZVQXA5azcxQjZDZHMwRFNlQWZoSVVjV3NUYng5?=
 =?utf-8?B?OUtDNStpNGdOQVAvZ1AwMEVZTEhLdDFXd0JXSVp0R21QWHdvQlZ5UXphK3dS?=
 =?utf-8?B?Ris0L01IaVR6WHFiOEZ0dlZZNkF4dm1BemkvWEwybFVOTUM4ZkVUS1N4b2N5?=
 =?utf-8?B?Q1lyT2ZwQ3Bkb3VBQVVMWU9jalMrODRhSG44S3ZKbCtibzhSellNYmN1RW1p?=
 =?utf-8?B?VWxSdHFBT0VIc240emdJbXg3RVA4YnhMbUkzY1hWdFNITmpxVVRMeWVXdDdK?=
 =?utf-8?B?WFFWTGlKTUdNT2doTnRabHcwVUFuSytaZy82T0pKT2ZuTkpVN2hSVXNPQ1h0?=
 =?utf-8?B?Rnd6YVZSSGtITDNtODNkZm1ZaGdRcEhNOEtpUHRNTG1DaGJaUzNXdVhvWVdS?=
 =?utf-8?B?RXJZaGZ0cDJITjRhZGxiQTI2WG1PTzFnMjNTeFVzYmd2cjdmV2hTZ1Bqa1pI?=
 =?utf-8?B?THAxd2dkMVYvK2s0elU2MHZsVzRlbjAwck9TYWs0MDdGeVA5TXFVamhJaGFJ?=
 =?utf-8?B?cVBoT1M1dTJLRXRQR0FuVkxnWVNxTmVOUWJUZVlnMk1hdVhCN2JoYnF0TEhq?=
 =?utf-8?B?a0oydkpRc0VZR2NJRzFKOWd1NXJlcXlZeXZZTkhqakczWWd1emZicHpNclVm?=
 =?utf-8?B?VEYxR01kdkJIT3h2bGhqaXZoVjY5Z0VCRlI4aktIT2lPWnJyYU5iRkd0QUw1?=
 =?utf-8?B?Nk5VR0FIcGdJYmxySnVjU2VJTXkzTW1ickI3U3YveGRqR0N2UTdGN1JjR3Q4?=
 =?utf-8?B?NmdEa0F1VHpHMHdxRTZvL3EzcDYzekRBNzIvYkM1bEtGbEVyTkF1Y3RVaEk2?=
 =?utf-8?B?UlNEYUJuNDRCcHRqRGRadUJIOWlFZWZhN2FWZ0ZmeWpFNSs4YTAycWs4KzR4?=
 =?utf-8?B?N2pETFdUU1hpS2tZcHh5a1AzeEduNzhLVEJHYWdtTDhtT2dtblpzVzRzWjNO?=
 =?utf-8?B?UTUxNkFzNjh3WWU3aXhCTHgzOXdtWVRUOG5ObXI2L2tHeEd2U3BWNnBQKzA4?=
 =?utf-8?B?VEF6Mi9lakFjWmVxd0J0VG5zbE1BM0hrZzNXODBpT2pCOElhOTR2ZC9pMjVB?=
 =?utf-8?B?bFo5Nkc5ME5Lc29IMDBVbFZaU3NnMTUrSEQraHBtRWtPd0NHS2hpL1cwandr?=
 =?utf-8?B?eVVrejROMnNVc2QwZllXNHQxRWlYNlR1RnNEZjFNVWRQRVhBQU44K2JLcnVE?=
 =?utf-8?B?cThURG15SzBEMHFuSDNhSEtKMjJ5RlNjZ3ltcmhSclpKRGFPaEZtZjhaTCtk?=
 =?utf-8?B?eEJhS09pd0drN1MyNVJXdzdHSzRsWkM1OHlXOWNLM2VWcDhuL0VCRG5YdEJy?=
 =?utf-8?B?V1Y5SzVqSUJpSkptakdOVnZKUjIxK0FKQnNvNmVMSW1kOGlIdjMvdEpTV1N1?=
 =?utf-8?B?Q0lXZkcvZy83bjQ3NFAvRWdiNHpzSFlBRGZzRGFvWWhMZ1RiUFU1UjU5YzhT?=
 =?utf-8?B?ZUdjbzRPVUdMOTVieENGeU9YcVdaZHl5eEtBc0hSOXhuaUQwTGNlQXl5S0ZF?=
 =?utf-8?B?K0Q3c04rdUxUUlNnS0lBVWdxTmlSZ1lkdjN6ZFZJNGZiYkc3amZqOVByVjdX?=
 =?utf-8?Q?QpGB+qDR2iRxLfSmaE2L16149wZdLfnf?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6097.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bExkTnozN0I0Z21OeFl3OUVoTDQ2dzZVclQxM3kzdkhpNmJwTURRWFVCd0Z6?=
 =?utf-8?B?aUUwZnUwM0p6NXRXMnROS3FaT0htKzRVUldlWkFUUm92d0FJclNsenlteUV3?=
 =?utf-8?B?S2FHUW84d2tReExKMWRVOXVWQUg4YmJzZS9tSGVwKzh2R2c1bkdPT29mbTEr?=
 =?utf-8?B?Z09RSnZCcTQxUUZYcnUyQUt0WmJ3WVV6K2hEK0VvMGNldjd5TEQrWTN3VjBT?=
 =?utf-8?B?aWFiZHNNMlkzSTlqcnZnNDFlMVZ2VnR1N2VqbUNzdW12Y0wrREtJQVB2cHZE?=
 =?utf-8?B?cEpMczBZbkw2TlFCL3lJbHN3TG42TlBUeHg1MWdLRU5GbThkTkkrSDVhTnhZ?=
 =?utf-8?B?SFo3QnFaK2YwNzc2emRiWS9xNCtRV21ZMGlGVGFZSHpabk1SZ3NEbVduRk0v?=
 =?utf-8?B?aHhIbUNIS1JNMTZQU0hvejdKVWFPM2ZSbWtGQXFBanNsR2tLNlNqanhIMDBs?=
 =?utf-8?B?YkZycU9pNldYNEdhMDhYamlXVlROeElKclFHeVcxT2RGNVZ4UDZpWE1IUkl1?=
 =?utf-8?B?aFBxL0lnTlNOcE9YZHNwdWtxbHh1dUk2aVlkQzl4ekpybVVyZS9DNVBoRm05?=
 =?utf-8?B?WUlkSTZ0ajZqSjV5Q2YxYkF4TzVhTEN0VEtLQ0JtY1BCaUY1eFNvZUpCcVFW?=
 =?utf-8?B?V0tncUtxUzd6MlNtZWtmV3lzbjM3VWhQTVBVY3IvTXI2ZHNueDRUcGRwVzNM?=
 =?utf-8?B?bkZjRTdmVUdMZVk4cVI5cmsxUWhMUkxPMWdvWHlUVDNaUzlNUVhBU21EVTgr?=
 =?utf-8?B?Y25iUlBKbG1sWUJJd09WRGwrQnZGMDQvcVVtRXF5eU1iV1hJM2VLWjFsYVFD?=
 =?utf-8?B?WXBZdVpndHNwTFg3UzRQWkc2TEpXN254bndUckpQc0dwY2VjZlJvdWV2blpo?=
 =?utf-8?B?UGhyQVVNbkwwclN2RU1KTDB4Ni9uUytkNzR3empRS1JKOE9qMG9PSnlQWVhD?=
 =?utf-8?B?bGJEdmtDcWV0S3ZHS1I2QkkxN3dmSWVmeWN1bmhsUnI5alJEbEt2UGpOMnNh?=
 =?utf-8?B?UW5GdnplZ1pTKzdhVVRpc3VqVmdENzVLMDkyZ09tcWd0WC81Vkxab0FXbng1?=
 =?utf-8?B?R0EvZ3NLRDJiRUtoNVpUSnRwemVyWTF0b3hJTFpONjlreXl4Vm5Wa2EzSUFy?=
 =?utf-8?B?VXE1SkJ3RjJLcHM1VXJhVTcrYldMa3lqSlN1Q3BXNytYVU9UUkxpQ0tZOVdx?=
 =?utf-8?B?NVN1NGlhNVpOdmVLSTdvT3liR3RnNitWME9JTnpxa0FJMEMyOW1YUTRXSGIv?=
 =?utf-8?B?anl3TXZzR2U4MTFMVnR4ZU55amlObURueHQ0c3NjSk5kQ0dXdmxBdEtlRnFp?=
 =?utf-8?B?cnpidEZNaFlTZmJYR0VJTXZ3TEREaW8weWpzL0ozak9CdE9uV1RMOUNxOGdD?=
 =?utf-8?B?cyttWGVDVU5Ka3VJWHBpZWFTc1hqY25QK1FrZTRlVGZrQWU5a3U5TmgwdGNU?=
 =?utf-8?B?d0V0c1lqL0FHcFg1SllsNkNUbXpNaXkvOE9WUkFUMG11RjFZQksvY0JVbzNJ?=
 =?utf-8?B?cjBBcE5YaDhJYXZIT01EV3R2VzdtdjROTXUyTUdscVBuOEZPNW5IbWhwQlhG?=
 =?utf-8?B?NmhUbTM4R0dBUnlVSXZRaStxek5JZVlNZzd3R0Z1ZmJiam1BRFRuRXE4WCs4?=
 =?utf-8?B?MnpMNnVicHBBcHFTWHB2U3lxVGtWSzB2NlNMK091NUN0RTRxbkd4VFc3R3lD?=
 =?utf-8?B?UnM1RVlMaTUzZXhTM0NNdFFKVDlmR0U2aUswSGNhTWVCbW56OFEwR2thS204?=
 =?utf-8?B?ZlpYcEFsNnJNNjhZc3pDbzlvdkRyT0pOdkhobk1MWXdwaVVReE5VRWFJWUgx?=
 =?utf-8?B?bDRubjJNQldvSGhrTmtnWFR5UkdRZzVkOEdqMDlpdGlJNnVPUjc0MnBEZzd2?=
 =?utf-8?B?eXpJaG9XY3ozQy9wb01XZSt0SFg1KytxMUg5M1Q4bGtWMUw5T21PUFY2UGlF?=
 =?utf-8?B?ZGE4YlJBZnFWRW9XUG1NNk5ZMmtGb0p1ZGlNR3I3Z1JodytzU0dUQ25taFp5?=
 =?utf-8?B?RjZOUEpPelh3YVIzdFVZRzNKNEsrNmw1TWhaMDJObSt0QUJjS2ZjN0JWdzFl?=
 =?utf-8?B?Q2x4U05nTkV5akRXSzJWenhYV0xSSjcxVmhzbkcvSEZSRU9oQnlvN3lKVXQr?=
 =?utf-8?B?bXp1TnhNb3BTYU5RTE1WdDdURXYxdDNSeEZqbElDSVZQc0xWcnNlc29CNmpn?=
 =?utf-8?B?aGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6097.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a218812-915d-410c-ed43-08dd4ce192dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2025 10:23:07.1377 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G6wg2J4z/7FbSJNe0pJh5QxJpweTsbAivGZ+sl9lkBiipAAD3sL2RIsxsXNMsZSqVPIpicCsnr2ogI+ZokHjiqJNIF3vuJRCUxk5O+gtIuE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7018
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

DQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBpZ3QtZGV2IDxpZ3QtZGV2LWJv
dW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgU3dhdGkgU2hhcm1hDQpT
ZW50OiBUdWVzZGF5LCBGZWJydWFyeSAxMSwgMjAyNSAxOjI4IFBNDQpUbzogaWd0LWRldkBsaXN0
cy5mcmVlZGVza3RvcC5vcmcNCkNjOiBTaGFybWEsIFN3YXRpMiA8c3dhdGkyLnNoYXJtYUBpbnRl
bC5jb20+OyBLZW1wY3p5bnNraSwgWmJpZ25pZXcgPHpiaWduaWV3LmtlbXBjenluc2tpQGludGVs
LmNvbT4NClN1YmplY3Q6IFtQQVRDSCBpLWctdCAzLzNdIHRlc3RzL2ludGVsL2ttc19waXBlX3N0
cmVzczogRml4IHRlc3RwbGFuIGRvY3VtZW50YXRpb24NCg0KQXMga21zX3BpcGVfc3RyZXNzIGlz
IG1vdmVkIHRvIGRpc3BsYXksIHVwZGF0ZSB0aGUgdGVzdCBkb2N1bWVudGF0aW9uIGFjY29yZGlu
ZyB0byB0aGUga21zIHRlc3RwbGFuIGttc190ZXN0X2NvbmZpZy5qc29uLg0KDQpTaWduZWQtb2Zm
LWJ5OiBTd2F0aSBTaGFybWEgPHN3YXRpMi5zaGFybWFAaW50ZWwuY29tPg0KU2lnbmVkLW9mZi1i
eTogWmJpZ25pZXcgS2VtcGN6eV9za2kgPHpiaWduaWV3LmtlbXBjenluc2tpQGludGVsLmNvbT4N
Ci0tLQ0KIHRlc3RzL2ludGVsL2ttc19waXBlX3N0cmVzcy5jIHwgMyArLS0NCiAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS90ZXN0
cy9pbnRlbC9rbXNfcGlwZV9zdHJlc3MuYyBiL3Rlc3RzL2ludGVsL2ttc19waXBlX3N0cmVzcy5j
IGluZGV4IDc4Y2ZmZTcwNy4uMWZhOGRmNTQzIDEwMDY0NA0KLS0tIGEvdGVzdHMvaW50ZWwva21z
X3BpcGVfc3RyZXNzLmMNCisrKyBiL3Rlc3RzL2ludGVsL2ttc19waXBlX3N0cmVzcy5jDQpAQCAt
MjAsMTMgKzIwLDEyIEBADQogI2luY2x1ZGUgImk5MTUvZ2VtLmgiDQogI2luY2x1ZGUgInhlL3hl
X3F1ZXJ5LmgiDQogLyoqDQotICogVEVTVDogaTkxNSBwaXBlIHN0cmVzcw0KKyAqIFRFU1Q6IGtt
cyBwaXBlIHN0cmVzcw0KICAqIERlc2NyaXB0aW9uOiBTdHJlc3MgdGVzdCBob3cgZ3B1IGFuZCBj
cHUgYmVoYXZlcyBpZiBtYXhpbXVtIGFtb3VudCBvZg0KICAqICAgICAgICAgICAgICBwbGFuZXMs
IGNwdSBhbmQgZ3B1IHV0aWxpemF0aW9uIGlzIGFjaGlldmVkIGluIG9yZGVyIHRvIHJldmVhbA0K
ICAqICAgICAgICAgICAgICBwb3NzaWJsZSBiYW5kd2lkdGgvd2F0ZXJtYXJrIGFuZCBzaW1pbGFy
IHByb2JsZW1zLg0KICAqIENhdGVnb3J5OiBEaXNwbGF5DQogICogTWVnYSBmZWF0dXJlOiBHZW5l
cmFsIERpc3BsYXkgRmVhdHVyZXMNCi0gKiBTdWItY2F0ZWdvcnk6IERpc3BsYXkgVGVzdHMNCiAg
KiBGdW5jdGlvbmFsaXR5OiBrbXNfY29yZQ0KICAqIFRlc3QgY2F0ZWdvcnk6IHN0cmVzcyB0ZXN0
DQogICoNCkxHVE0g8J+Yig0KUmV2aWV3ZWQtYnk6IEthdGFyenluYSBQaWVjaWVsc2thIDxrYXRh
cnp5bmEucGllY2llbHNrYUBpbnRlbC5jb20+DQotLQ0KMi4yNS4xDQoNCg==
