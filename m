Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C298FC83F27
	for <igt-dev@archiver.kernel.org>; Tue, 22 Jul 2025 12:24:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7901D10E66D;
	Tue, 22 Jul 2025 12:24:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YqiCPd9q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9217310E66D
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Jul 2025 12:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753187078; x=1784723078;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=jukr0MORV3XP9Nc9VNoCIZ8uBxLwxPeKejk5OqbdAmM=;
 b=YqiCPd9q2nMA3iPsUuNKqENVdcV92daHAvAyBXe9fbIC6QM0z9u0C3/7
 8isTWXUtsCxYI2IZFHtrSuTL6hxXV51HWgaz+oaVJr1GAbmWTsy/dmaTh
 hXb+sCcgA/HlyjtEycwxZ89x49KVhw5TNoXFwgLqLOJbG8cuRrl4Lu7Ww
 YFRm8ed8gw4OvNPBWtE2jQWUQ6Kh+axfrW1zUWsLoVnl3ATILpPwN7+b7
 ZV0ixaWFJN4/gbfcuFLbp8rZObsbiamDd0cBfI93aQ99U0LG4G3LL7OUu
 db+/W7HndqbC2u4nIiMVd22pV8T1/JhoFs9QKm3SokS8t91K3DH45Xiid w==;
X-CSE-ConnectionGUID: +mCc8MoeTdmz+w+B40Pdlw==
X-CSE-MsgGUID: oXQ21MIcSSGxzGQoR/fLcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="66775449"
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; d="scan'208";a="66775449"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 05:24:38 -0700
X-CSE-ConnectionGUID: fGZODocUR0CQStqLdBha2g==
X-CSE-MsgGUID: gLMghoDCSAS0vdaS8LgJMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; d="scan'208";a="159529523"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 05:24:38 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 22 Jul 2025 05:24:37 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 22 Jul 2025 05:24:37 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.61)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 22 Jul 2025 05:24:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eg2Sy7nn67CfjbzWFTFc/uk1Ts+q/mMX8XNRLBei27re0HuJoVAnMIu5c98FhovdKWI7NZxY7ha1Qiq0ADN1XI+saPF5MyHKaWTGAqhZlGrWhQfP6s3JsOZ0z9RRrUlvu0+RjmaSYQJcHeuzl6AYL5RB9y9xiFXDNQ5nPlUai8dO5EW0P23QfbZq051QIjNdLGd62U5AI66JAIQR3wkPwh0aCq0anltY82iXLT453qDVFxbTN7eCBQBr8CMgn1+95UoLLe/2o8TzwxIxbpDtXdkS/SEazfPHxJ31kVUsoyYWYAprQ9QjWez0fSAgsGonx2pOo+RLBT0dbP7U7xDI4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jukr0MORV3XP9Nc9VNoCIZ8uBxLwxPeKejk5OqbdAmM=;
 b=Z7nr+cJNNoGEFrCjc79Y0tY4CEqcyIBhwaUx55R4vAxAOiRdCLWssXcQGv4QbwNZDrX+CM/CxbEpH++gi+AWyLU6eEEOj1Csj6HHivcNGAO4lfawr/DRyJCL3MVuyJmwAidVM/+fW9wXd1yg63XsUmohi20k8NXeoqDCG5UTQZqqECCA2rEQuDDPj4umVXbI0XdJyPPV2UDDPtFPa+veBrXC9nD92DhrLDD4dA/5XxT8hjYz89mnrpcCZ9BunjLWKU9fjvjhWk3PgxuvJTZfAA9iIpqrabcFPmbCaRFaKwmF9K/ubvLdlFi5Ln9ksq9dypRq0ALwGFYH9JBHxbmspg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB5072.namprd11.prod.outlook.com (2603:10b6:a03:2db::18)
 by PH7PR11MB7572.namprd11.prod.outlook.com (2603:10b6:510:27b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Tue, 22 Jul
 2025 12:23:51 +0000
Received: from SJ0PR11MB5072.namprd11.prod.outlook.com
 ([fe80::a14a:e00c:58fc:e4f8]) by SJ0PR11MB5072.namprd11.prod.outlook.com
 ([fe80::a14a:e00c:58fc:e4f8%5]) with mapi id 15.20.8943.029; Tue, 22 Jul 2025
 12:23:50 +0000
From: "Grzelak, Michal" <michal.grzelak@intel.com>
To: "Sharma, Swati2" <swati2.sharma@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t v1 1/1] tests/kms_cursor_legacy: don't inhibit pipe
 CRC calculation
Thread-Topic: [PATCH i-g-t v1 1/1] tests/kms_cursor_legacy: don't inhibit pipe
 CRC calculation
Thread-Index: AQHb9YTuDtlda5YHIUONxKkdf/j8WbQ86vMAgAEZknA=
Date: Tue, 22 Jul 2025 12:23:50 +0000
Message-ID: <SJ0PR11MB5072200D786A086F2E8777398F5CA@SJ0PR11MB5072.namprd11.prod.outlook.com>
References: <20250715123623.832027-1-michal.grzelak@intel.com>
 <ff0b3b95-9048-4fb6-8527-8214722f9260@intel.com>
In-Reply-To: <ff0b3b95-9048-4fb6-8527-8214722f9260@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB5072:EE_|PH7PR11MB7572:EE_
x-ms-office365-filtering-correlation-id: 62d6314a-2e62-425b-0799-08ddc91a9db3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?NEtia3BMK3BiR2lWRE91bTJCLzRIR25SWHlKUHVRMDk4ZDlicldGTWNKRkZE?=
 =?utf-8?B?OWtwODZ6TjdUTDZ0emh1enBhWW8vTEJwQmRuV0tRd3R3Nk55MTlJWjIzNjhG?=
 =?utf-8?B?V3FRdko1SnVlMDExc1RSY2V1YWhUY1hTdU0wYzBQdENmZDJBUWpId1pMY2hp?=
 =?utf-8?B?WE53UC9RdnJyREo3ZmFCR2JPcGEwd3VVNll0UzFCNFVZVzhzU3IzU3ExcG1v?=
 =?utf-8?B?Um4vYUhSSVdSVjdsWFpld3FaZnkraW5acEozY0NkTkQyS0c5NDhldzhONU0y?=
 =?utf-8?B?WDEreWdHSFNJdXRjNkI5eXM3NzVhQU1uOEROdllRNHhvQi8wSWNqWW45dUd0?=
 =?utf-8?B?Q2VRaVhaVWU0RGxram91ZElRaEE4Ulo0enNONS9nYmFUNEc1Z2lMcGNBOEto?=
 =?utf-8?B?VTRQcnhwS3VlTmhpRFlORXhuUVQ1VmtRL09jY3d3VjBSSHA4L0c1ZXJRVWw0?=
 =?utf-8?B?RHFoZlZPd0pSL0VPTitLZzhJRWlTUlpLb0wyVHFCNXdEaDJBVWNvcjEybDlB?=
 =?utf-8?B?NmNUVHcrRG8rZUVHNGE4QjJSQWNJM3JzMkMwanVQMDQ2SFE0dWlSM1BOYnQr?=
 =?utf-8?B?dFJUNnN0dm95ajBXUzROUWVZWmFyZjBESzBNazJnTFZ2WDQ5ZnVCQXJOTVBT?=
 =?utf-8?B?ZGdVVmpzalF4akJxbWJ5ZDhtcHNkVGs4WDJLZTNIQ3R3QmF1eVdxU0ZvL09Y?=
 =?utf-8?B?OE9FREJ5eHFuVDBiSExadk42aUw4dzJHUEE0dEprUEpxV0VZVDFzdmlWZ2R1?=
 =?utf-8?B?YWJCeWpYMytjejYrQWNiN3VjMWRhblpEY3RzbUlhSDJPbWVRZXppcEcvRE1t?=
 =?utf-8?B?aEFoS1IzTzFOcWJnemVNN3p0bnY3TFdwZlcrZ2RZYXJTSmJ0Tm9uRm0zVEx0?=
 =?utf-8?B?WFU3dDZvbVZNMlJOMWZaS2FTTDErRzNGUitkUUNWQkVNblFOamsyeTAveFRW?=
 =?utf-8?B?TXlKZGM1ZTV4UnBoVW1VN2xaSXQwRDZNL2t0Y1BiL2ZpOFo0bm9wSktZRmZY?=
 =?utf-8?B?TU1JM3A4VmN6YmlXVitVbEVJZHNEazRleCtCSi9WR3FMWFppZ25ZSzBUcVpq?=
 =?utf-8?B?TDdTZmh4L0c2WVpJZ2JSMUVwMGo5cG5mcmNhMENZSkdMaTFVTW9iT0NmOHB2?=
 =?utf-8?B?Z21FSlEyaFlDeTQ5K3NxZ1RPMEgvOEo2UlFIOEMyc0J6cXYxaUlRRmQ3czVY?=
 =?utf-8?B?c0Y1S0t1ZGlOQUNCbmxHcGplNnAvZy91VGczWXZQenFUbDdhSXVKelcvaVV0?=
 =?utf-8?B?RTVQdmZjc2pta3JxMFNtRjlqaXN1Q2d2aEwyQ01vQ0ExL0pNOUJaVmovbXVJ?=
 =?utf-8?B?dFFlWkQweFVVTndMWlM3WlhSZWpEdlF4U0cvNThDb2NtN2NZUDhkWlMrUTFz?=
 =?utf-8?B?ZUxtdEJQQmcyMTZuL2VzOWhkWDlRWVRRMUZOUW5GY3N4N1ZJUk96T0dER3ht?=
 =?utf-8?B?UTBKWDkzM283L05xQVhZVUhpZlBQVFJjckF5b3FPWGpDZjc0d1BReHJZZE5B?=
 =?utf-8?B?em1rY0V5YUZlSk5Qd2hKY3p2bEthYkNGdHU2ODdCdVdYT0Z6ZUdKYTQ0VVVX?=
 =?utf-8?B?WFErQ3VZSngvZy9seWxPNWZWNkNTbEtwbVNBbWNCMThBa1dGMTlmNFcxSzY2?=
 =?utf-8?B?NjczZUZ5Smpya0F0T0ZJUUxtN25pSG4ycE5acjJKUk1PaGEvdUZMS1l1MTgz?=
 =?utf-8?B?bXlFb3YxL0k4cGJBVzNRKzNMaTAwK0hyZGhBL2pMOXBwOFg0VnV0OVcvYm5t?=
 =?utf-8?B?MHNwMDR2MTJjV1pieTZYcGUzcWJQS3JtVVdXRE0wa2t3aUViemkvWEtGa2x5?=
 =?utf-8?B?ZldTU1hGWlhzUTVZNk53T3Y4eFl4Y0RiUkhvSjljYXpDNGVkYzRvUHBNNC9J?=
 =?utf-8?B?ektBZE82ZkxaRnBYQjhGbWUzTkhpZ1Nja2dwZjJ1OVluZ0o3WGRHVUE4WDcx?=
 =?utf-8?B?d2MwNHEzQ0RHZnp0d0g2dWc1ZkpnRjB1Ri8xaHhmOTVJVUJXZmVxTm9zaXJF?=
 =?utf-8?B?ZDJDMlh6VWRBPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB5072.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T0tKbXB6bFVLbkFsUjQzWE9KQVdOWERWemlPbFl4STZCSHVOZUp3ZnAwZ1FL?=
 =?utf-8?B?VHdsRzMwbXZKWGo2SUY5TWo2c1lVZHYxUXN4bG1EUVcvZlBvbEo3SGdyNy9X?=
 =?utf-8?B?VEhvbG9rWVFsb1UwMGpmSVlmdlUxT1VVeHVOcGpwaXowelg1OTVHUGc0WVVS?=
 =?utf-8?B?SGpienVkZGN6b3NSczk2SzFmMXNFYnpkRllvdmRqTmN0ZTVtT0Y3TDJPUjEw?=
 =?utf-8?B?SUV1SmlXQ05NUGtFbTNRYytYR3hjY0FhNml4VGVpYWRoTzdDcjZiblFPS0pS?=
 =?utf-8?B?MVhPLzIyNWo1cENtb1Q2dDh3WnNJeW5kbHFvN0R6YU4vYXBFNnhwejlTMU50?=
 =?utf-8?B?ZlloZlF6akRxUTVxd2lHWGx2RVlmdmdQK3YxdC9YN2tLNVp3eHVSMUs5Smsw?=
 =?utf-8?B?SHc3RDcvL2V3VjJ4QmFwN2JNSWJxY1F3NmYwMU9ON25CTTMzTkRrSE82Q2RT?=
 =?utf-8?B?c2NsM0dhc3ltcEdiaEl3NnJ3VzdieWhpUUp0V1o3M1E1ZUZCS0VyWDhBOE9r?=
 =?utf-8?B?aFpyUTdHc09aUm85YnJtbDQxYXpPa290TzBSS2lBVURpRzdSYk1KWmYvajBo?=
 =?utf-8?B?UkhsU2hnM29VYkpubTZFdEsyK25oOW9BSUovR1ByMjJFT2Zpdlo0U0pxOGtM?=
 =?utf-8?B?d3JseStya2lVdDJBcFFleEs5cHRwQ2hQSXBMQWVNQml2UTNLbUlRN3BKeHVY?=
 =?utf-8?B?am9qdFRUU2UzclJtcldnc1BFK1dWb21OU1JRWldzbzhaWUxrWUs2L0IxWHV5?=
 =?utf-8?B?OC9nYkxGeG1DS3ljSFBKKzFNVWwyZFFSNU82MXRBQTFZaGJrUHlKTGl2VjJK?=
 =?utf-8?B?U083MVpZWlRxdUdLN1ZIUDlramdEK2NYa2xJRlJjaHdUWGw5aVdVZWxWcHJo?=
 =?utf-8?B?ZEZkL2k5WjlUcmpaODdTVzlrcGZhNS9jd0x1Q1hHZWNRUGJOSkFpU2VCNUQ0?=
 =?utf-8?B?Qm83VTBNQkxOa29Ra0R3dmJ3MXZsWHNDU1VqSkdkOFFqdzNiNmlpSkRhejNW?=
 =?utf-8?B?b0RTTGRtSitkSjNYNmtqZisyR0xlWmtVcG5aUnVncEQ4cmlvbi95UnZwODN3?=
 =?utf-8?B?SFR1VVFVVEh5U1BFcTBiWXlzOWZEdXU1azN5S01Wd3ZnYW05SDZqRU10Tld5?=
 =?utf-8?B?N2pBbW92d3NaZ3ZLQTVtY2h1WjlSSTJMSlcrcTZYYlMxQ0pCZE4yQkRuSkJs?=
 =?utf-8?B?YTBGc2RSUStQRDJrZk9SRHoxZy9heXNaeGpZNUdKWVQvVS9na2orSDZLV0to?=
 =?utf-8?B?TGJ5MkNFUnN5MXl4MUtaMW1CQ2pYNk11V21jYW5INjhOM3FrSnF4MmZMaGFq?=
 =?utf-8?B?UUU4TllVN3ZlL2FyTWk3RmI0U0NTamNyUnlzcXVQalFyVVVZQTc3NzFSNHlJ?=
 =?utf-8?B?ZmJEU2pON1Q3R2FVTXF0bVByY0FnWFVUWW1PY0QvaWZGdXdpcWtweUtxTXpO?=
 =?utf-8?B?dUZHMklqMWNXSFBpS2t2aFp6b2M3emhxSnRaN1QxTE10c2pvZ1ZEbmF0aW9Z?=
 =?utf-8?B?czNWYUMvUHh6dzFncS8wdTZGMWYvWVI0blNraUZkM0x5RlJ5TXhEd2p5cjNR?=
 =?utf-8?B?ZVdMblV5R0pUYTFTLzZ2RHlkTldEL3RvQVFnMHVoSWJBVTZoVjhTZG1paDJq?=
 =?utf-8?B?UC96VlBrakU4cVh6YlBqaS9KeUt2cTRvUHpaWWNIUXN6Y0E0MVhPbEJKNWQy?=
 =?utf-8?B?Vm9mbmFxdkFnNDM2VG1OM3B4N2ZVYWZsQ2oxNkxWaHJZYkx3eC83ZnY2elRs?=
 =?utf-8?B?MTMxeHZjc2YwbngwMWNNZlVYZ3pEcXV4NTBzVVJ4S1Q1Zkd5MzcxVWNBRTBX?=
 =?utf-8?B?NEo2WkY5cEdRUnhkcDhqNFJrbm9hdU5hKzBCbGE0blh4K0YwRkR2YVRuVjF2?=
 =?utf-8?B?ZEExNnZIa2JjWGJZcnFNeFBoRSs4elk0a2tDQTkwdVdXdUJuaUxNbVpJZ3ls?=
 =?utf-8?B?UEEvRG1JK0lFMXNYdC9MTUN2aFY4Uy9HeDBoNjNDcGRWZ3FFT0YvUlZhUTRL?=
 =?utf-8?B?UUViWFpJS0lMQXk4OHlkdExVOWk4VVZDWE5mQ3RKMGZPU2pNQmNqN2ZsOG1G?=
 =?utf-8?B?N3ZhWEJSSXI1akxycmpiOFlvQ0E2T05BaHk2WGdVUEczQmZEeXZyRUZRZWkr?=
 =?utf-8?Q?aA48wvkZV7NUl4No6yr43al3k?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5072.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62d6314a-2e62-425b-0799-08ddc91a9db3
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2025 12:23:50.8466 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kW+J/cVVaYAaDqSO1XKd2EqZWk4zIUq3Blost7nQZJIHIfDrQjdKPtwwlqurDGJbsi2Y0ugWM4HgbOfSTCquqfmkruMQHt7HT3ZQ82e18ag=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7572
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

SGkgU3dhdGksDQoNCj5Gcm9tOiBTaGFybWEsIFN3YXRpMiA8c3dhdGkyLnNoYXJtYUBpbnRlbC5j
b20+IA0KPlNlbnQ6IE1vbmRheSwgSnVseSAyMSwgMjAyNSA4OjEyIFBNDQo+DQo+SGkgTWljaGFs
LA0KPg0KPk9uIDE1LTA3LTIwMjUgMDY6MDYgcG0sIE1pY2hhxYIgR3J6ZWxhayB3cm90ZToNCj4+
IFJ1bm5pbmcgZWl0aGVyIGZsaXAtdnMtY3Vyc29yLWJ1c3ktY3JjLShsZWdhY3l8YXRvbWljKSBz
dWJ0ZXN0IGZyb20gDQo+PiBrbXNfY3Vyc29yX2xlZ2FjeSByZXN1bHRzIGluIGVudGVyaW5nIFBT
UjEgYWZ0ZXIgdGhlIHRlc3QuIEV2ZW4gd2l0aA0KPj4gUFNSMiBlbmFibGVkIHBhbmVsLCBpdCBp
cyBpbXBvc3NpYmxlIHRvIHN3aXRjaCB0byBQU1IyIHZpYSANCj4+IGk5MTVfZWRwX3Bzcl9kZWJ1
Zy4gS2VybmVsIGRvZXMgc28gYmVjYXVzZSBpdCBwcmV2ZW50cyBpbmhpYml0aW5nIHBpcGUgDQo+
PiBDUkMgY2FsY3VsYXRpb24gd2hpY2ggaXMgYWxsb3dlZCBpbiBQU1IxIGJ1dCBwcm9oaWJpdGVk
IGluIFBTUjIuDQo+PiBUaGVyZWZvcmUgc3VidGVzdHMgZnJvbSBrbXNfcHNyIHRlc3RpbmcgUFNS
MiBmZWF0dXJlIChlLmcuIA0KPj4gcHNyMi1uby1kcnJzLCBwc3IyLXByaW1hcnktYmx0IGV0Yy4p
IGFyZSBmYWlsaW5nIGFmdGVyIHJ1bm5pbmcgYW55IG9mIA0KPj4gdGhvc2Uga21zX2N1cnNvcl9s
ZWdhY3kgc3VidGVzdHMuDQo+Pg0KPj4gUmVzdG9yZSBlbmFibGluZyBQYW5lbCBSZXBsYXkgU2Vs
ZWN0aXZlIFVwZGF0ZSBieSBjbGVhbmluZyBwaXBlIENSQyANCj4+IGNhbGN1bGF0aW9uIGFmdGVy
IHJ1bm5pbmcgdGhlIHN1YnRlc3QuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogTWljaGHFgiBHcnpl
bGFrIDxtaWNoYWwuZ3J6ZWxha0BpbnRlbC5jb20+DQo+PiAtLS0NCj4+ICAgdGVzdHMva21zX2N1
cnNvcl9sZWdhY3kuYyB8IDIgKy0NCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxIGRlbGV0aW9uKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2ttc19jdXJzb3JfbGVn
YWN5LmMgYi90ZXN0cy9rbXNfY3Vyc29yX2xlZ2FjeS5jIA0KPj4gaW5kZXggOWY2ZTY0NGUxLi4y
ZWY5NjkwZWEgMTAwNjQ0DQo+PiAtLS0gYS90ZXN0cy9rbXNfY3Vyc29yX2xlZ2FjeS5jDQo+PiAr
KysgYi90ZXN0cy9rbXNfY3Vyc29yX2xlZ2FjeS5jDQo+PiBAQCAtMTc1MSw3ICsxNzUxLDcgQEAg
c3RhdGljIHZvaWQgZmxpcF92c19jdXJzb3JfYnVzeV9jcmMoaWd0X2Rpc3BsYXlfdCAqZGlzcGxh
eSwgYm9vbCBhdG9taWMpDQo+PiAgIAkvKiBDbGVhbi11cCAqLw0KPj4gICAJaWd0X3BsYW5lX3Nl
dF9mYihwbGFuZV9wcmltYXJ5LCBOVUxMKTsNCj4+ICAgCWlndF9wbGFuZV9zZXRfZmIoY3Vyc29y
LCBOVUxMKTsNCj4+IC0JaWd0X291dHB1dF9zZXRfcGlwZShvdXRwdXQsIFBJUEVfTk9ORSk7DQo+
PiArCWlndF9vdXRwdXRfc2V0X3BpcGUob3V0cHV0LCBwaXBlKTsNCj5EdXJpbmcgY2xlYW4tdXAg
d2Ugc2V0IFBJUEVfTk9ORS4gVGhpcyBpcyBzdGFuZGFyZCBjbGVhbi11cCBwcm9jZXNzLg0KPj4g
ICAJaWd0X2Rpc3BsYXlfY29tbWl0MihkaXNwbGF5LCBkaXNwbGF5LT5pc19hdG9taWMgPyBDT01N
SVRfQVRPTUlDIDogDQo+PiBDT01NSVRfTEVHQUNZKTsNCj4+ICAgDQo+PiAgIAlpZ3RfcGlwZV9j
cmNfc3RvcChwaXBlX2NyYyk7DQo+Q2FuIHlvdSByZS1vcmRlcj8gUHV0IGNyY19zdG9wKCkgZmly
c3QsIGZvbGxvd2VkIGJ5IGNsZWFudXA/IENoZWNrIGlmIGl0IGhlbHBzLg0KDQpUaGFua3MgZm9y
IGNvbW1lbnRzLCByZW9yZGVyaW5nIGluZGVlZCBoZWxwZWQuIEknbGwgc2VuZCBjb3JyZWN0ZWQg
cGF0Y2ggYWRkcmVzc2luZyB0aG9zZS4NCg0KQmVzdCByZWdhcmRzLA0KTWljaGHFgg0KDQo=
