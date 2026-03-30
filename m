Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4BFB103D959
	for <igt-dev@archiver.kernel.org>; Mon, 30 Mar 2026 13:52:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C2CE10E1C7;
	Mon, 30 Mar 2026 13:52:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VXDbl4qm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE60810E033
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Mar 2026 13:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774878768; x=1806414768;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=ysqam8sF1pSC14OYXHOit3K9lus/Xwcr0zCzRYaGQWg=;
 b=VXDbl4qmmBuxn28NSWsiPAdMCadP044KlYPkZf7eRkAjrWIHSwlBIqi7
 gp8IBn1AKUxWeluBV12+XXuZATj21LaUxYC8lMc0GEdf0TI8O5iIXbM2s
 qc+gbmomKTZpVmWAH5jNbDBege7bV9zGUOEnTlb/MD24qvvj1RwnQ9sfU
 UJJ2eWzPvMkRk22TzNsyCmgdyO7NViGJlPv0QqRKnanGIA+mbJRTqaGfB
 B5R6yZFMZwHlVVeHs71kRUoUPhvSVCyyQY5EH0xY1NaeCg1LKX+D43syJ
 pFrB8rUAgerDMl2+6lUOCbAyekPSa3H0QhiasyngahW7xBCV+E0/+s/IV Q==;
X-CSE-ConnectionGUID: T6Bk9jy6RNeb4rqwWbZXiw==
X-CSE-MsgGUID: Hli6E/GMQvmBVaHVBa8gOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="75582246"
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; d="scan'208";a="75582246"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 06:52:47 -0700
X-CSE-ConnectionGUID: CMaFxNNOTU2wLwIBslBA/A==
X-CSE-MsgGUID: c2mGQkxaTSmDH+3EQuE2gQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; d="scan'208";a="225950678"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 06:52:47 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 30 Mar 2026 06:52:46 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 30 Mar 2026 06:52:46 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.25) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 30 Mar 2026 06:52:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K/ixO70x0AMijRpPGtFaJZfeiF1RbkAgzTX4PsADKHbgOtHotv/Agyj/Pc6PN9+0INHdrsQF7JvuM/rT4xzHBWCLwZ9qoNRNbgfP/gVtxAlbS1ylYN5qhJYwU6/K5pry2qw1AY2PuWLz+b+nV7+dwAcPZvyk1k4GN+XdLzI1fqKC022T6T6QFJZEtElp/AA9njZa/1nybKage0EzOKuZGr74OIzs0+tsco/+OyqXWMDNM3ARsZb0sPKeGmvroROPe24Ty2kX0kjx5qXL+DHy036KjMe9K4pDstPC2Wm+Cb7hXuVjLsuOMth67luK2JhhqmxZp4+vhoT+K6n+s2WP0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ysqam8sF1pSC14OYXHOit3K9lus/Xwcr0zCzRYaGQWg=;
 b=lRVzcZU0hsU1+fTcqRhqJL+Bhla6v3NpC6haoA3fcOyNfO3FXtTMviIMTzS3BIfLk158UvDllfAu/yUBNdZYBWjVAycWnE5NzNsMhxqDmQTGuhsavUnTjzkYyzfqbddtJv7p0wlZSvb4kgZYCeXV9Y3GCivve5+R4anxmzfhAEVHPf0WD44TcLzBNNsfbSi/mlvZC76fGhsZmNMbvg6eDNqt7rzet6vCDeKTn5Wvw4+xGax2pJQuPwF+Sz/QLWdyy6lXsVA+G6rG0wfKC8x4HV5GczGYt2sXHKG8ymp1LpHQUMpNjH9VDat41oPuOiGdwB+Y8T+IcS2H4RrtDya1Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH3PPF7DB70F9CE.namprd11.prod.outlook.com
 (2603:10b6:518:1::d33) by LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Mon, 30 Mar
 2026 13:52:43 +0000
Received: from PH3PPF7DB70F9CE.namprd11.prod.outlook.com
 ([fe80::316a:2fe8:c3d3:eb91]) by PH3PPF7DB70F9CE.namprd11.prod.outlook.com
 ([fe80::316a:2fe8:c3d3:eb91%8]) with mapi id 15.20.9745.019; Mon, 30 Mar 2026
 13:52:43 +0000
From: "Knop, Ryszard" <ryszard.knop@intel.com>
To: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Heikkila,
 Juha-pekka" <juha-pekka.heikkila@intel.com>, "Karas, Krzysztof"
 <krzysztof.karas@intel.com>, "Sousa, Gustavo" <gustavo.sousa@intel.com>,
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH i-g-t v2 0/6] RFC: Add attachments support
Thread-Topic: [PATCH i-g-t v2 0/6] RFC: Add attachments support
Thread-Index: AQHcu4/swbr9uXeM6E6fK3t4KZ6raLXG0IIAgABHfQCAAAnVgA==
Date: Mon, 30 Mar 2026 13:52:43 +0000
Message-ID: <c48123c078428b7f630de7e4252a91de353d2093.camel@intel.com>
References: <20260324131235.712916-8-zbigniew.kempczynski@intel.com>
 <d259eb2e14d5c60f4e4da139616dbb5b87ac0254.camel@intel.com>
 <20260330131730.jpfzopbtti4cdje5@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20260330131730.jpfzopbtti4cdje5@kamilkon-DESK.igk.intel.com>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH3PPF7DB70F9CE:EE_|LV3PR11MB8603:EE_
x-ms-office365-filtering-correlation-id: 78413b33-3455-463e-3056-08de8e639df1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700021|18002099003|56012099003|22082099003|921020;
x-microsoft-antispam-message-info: q8OArjPj8GzC0JrxWs1uGY9dBRmFZM4ywSOa7XU4tXQWuY9a1MoOzi60l3tupDYFP1qXkiWRDF/PORVA5RIgkIUbBb/6HaGYMaYhPUmfexGQPaEazWkI1SV1ebBotAbxZZ/UBsA2ybilqphOgaunspCb+86phli/tYKOyQwXPeqbYsU6VHcvhSGrqcZRscViVBirjeX33hEq4sll0Yx8c+Q/IvQe4psmV0QokeL+JTsCh8d/ZMav3JN2I4N6Aj5ZyRyJ5uWvuxB10GBdBqgVGWN9L6vlJ3UR9LfhR2KUANR6S4HIlIjW0dWatCv5QJhTFqOKi6NCvTPP44olg4hhnIsEplHFnRSzu9rA7NU2nNuzgnGNqFjpZd/px1SXNsMmlULPLiGkHOn/Fm/EO13/1VBECoOozliYaRxDgcxNh82AMuIO120VrXBdvxDVA8u9o1n9ADRM7DNUYfC9eQ6B/kiFSBaBqrBo6MblQHk3O9wye1LiDgnuZZSKtE11JZ2gbzFeDY9V6WYCt5V5/e8I8wXGOYCbtwtbJxUdMnFeCuTFWNceu4W5zQkSiDgvoOS7eL9vv+OYsw3Ifswb78svJ+cuSmLP+eCvYY1hD1++dARw2E9lFTnCA02o4jVXnFMY6k74agzZGFhH8N7jE61xqkKsOMVplGSl1UrRVPgViQrNs9P11t/I56eHxH8B4NGxhUgmFK2Sxuf8v2zg2gTdQEUDNLivjUeKNqxF8ky9O8btg5z0MWp77jGjvUSRdW0aYkWEowxgNc0O98qhFjJTrVyW2pBNUXh1lY7NoXUG5TyN8f3VQ50ewuvstTnIpnbR
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH3PPF7DB70F9CE.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(18002099003)(56012099003)(22082099003)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UjhPdTBka2tqcmNBejlHWERZMi8zaDV3aXEyK1FSbHozcFhmRDlaN0JrNzhl?=
 =?utf-8?B?bkIxaEdBRXlDMjRrb2d3eGFyWFhpVHNNZVNVSWhZSWtTbzVQMEFWTzNTTU9y?=
 =?utf-8?B?bXdWbWtoellPQWwweHVsYmZOWm04cTd0UUdSTXBVWG9LM0EyZk5MSWMybUt5?=
 =?utf-8?B?RDllRUFGY1REblVXQ1VIQkwyUkpJQndWNnJZRlFyUUl1YU04d1hVMGlXMUhZ?=
 =?utf-8?B?N1BVeFVMOEJYNHVEbmwyS1RiMDhBZkJvVXJyMlNTZHZvMmM4c2ZTMTI3aWEx?=
 =?utf-8?B?QmRwVFpmbUZBaHhKbTRac3U5ZW1menJDNkdnakFhNkVGVm0wbHA4cWY4NGVP?=
 =?utf-8?B?OTAzTnFKcWdmZGczUno3bERTMEh5Nm1CNCtMbzlvajVoVnZ5RWoyMzk5TERw?=
 =?utf-8?B?TE9HeFdjQmtyWTl1WTZwSzNkNGdSYmVsZ0VmblJnMXl4S0hGZlhDeDVOcjdY?=
 =?utf-8?B?REs1YmRNMkZUc1dIV1lmR2JwWU4xSThsWW5jMy9Gb1JiL0NTaXBNMjFvbUlQ?=
 =?utf-8?B?U2dET3RCTEFsWGtDTDJLSEliZElvZjNWZzZSaFd0WURzSU9SZ0cwWk5mOEpQ?=
 =?utf-8?B?Rm1xTDFTRy9ES1p4c3dvaW9PVTJ5YUlGZVU5MElwOWJMNEFLbnRLZmlpUldW?=
 =?utf-8?B?SDR4Q2VHYzZUVjd3VDNoTTFvd1NrRUlTUUw1ZFJLVGFJUHhZQ21mZzFpSDFH?=
 =?utf-8?B?QWdueW9lQkoxQWdUTVVOcEtXWTJ3dGN6QWRQaTlUbm5ieldYeDdvVEdyYmQ2?=
 =?utf-8?B?czVGRUhMRjdBVWVsU1M4bGNLYjVPTVJoS1VEdGJ1RTR3MFIzbGoyaElsYkFJ?=
 =?utf-8?B?YmE0L1BCcDhXSnlkUzZaV0VlSUNvdnU5aGtCWVM2SnVpem83RG5obEY3UVU2?=
 =?utf-8?B?aXhRWnkvU2J0UmxaK3JZdmFVMDU2UWYyRTVwL01HdkwwNXJReGZRR2UrOGpW?=
 =?utf-8?B?cEhkN1ZPdjRBMzB3UGR3ZkFJSndLT1M3akhndWtReHUvQWQvYmZuNG42MzIw?=
 =?utf-8?B?TElMOVNESG5IdTcxKzJpcnAvS3kweWJiUHBQNk1JZUU1TmgrQmxISVhvR2VW?=
 =?utf-8?B?RnVZQzlIeVhNczhEUVJUbjVqVjRRbXllU3NqWm5FU292dzgrbEcwYkRVQU0y?=
 =?utf-8?B?SnlMV2ZuQjVIaGVzU3F6UDdFdE9ZYVRZVitYZXRleitiUm0wL1JCYmpETGhy?=
 =?utf-8?B?U0VGZXptQkNjUFlCK3RieXpoTksrdmIwc0hMajloWXJSZGJrU01UZHVXd0Ra?=
 =?utf-8?B?bzR2d0hYNEdMUWRYZmRDN09CMFF4TlA1a2hRNmNESzlwYm4xVVpDRWI5eVNW?=
 =?utf-8?B?OTV1RHc4cEdnWk9lYjBzcVN5Q3pJWWs5ZXI0VTdQbkVZVW9LWFdUdjdHZDdn?=
 =?utf-8?B?USszSkRXdTNJRVpYZW1HVkFna0JEdnZkd3hTdlg5ZDFBV0lhR0E5bFptVU94?=
 =?utf-8?B?UDhQQTFHUmFrc1A3ZEtDYTRadDBBMEZFSkppT1EyRHQxbFRuZU9rUWlpM1lP?=
 =?utf-8?B?QktHWW1hTm1jRlB4V1JrY0NlbThMUkNYVlVjdWl6M1RIMzdsRTl0UjVadm9Z?=
 =?utf-8?B?MVI5MlN1dFhVR2pCd0p3Z3VOYVhTU2M0bVJCVDhOK1MzWitSaHlncE5MU09a?=
 =?utf-8?B?TW5Eb1VRb2NNU0JyZWlQUG4wMlZFMlozR3BFZmovNlIzanpMR1dWenBETmU3?=
 =?utf-8?B?d1NKYTJwSDFDZXJoT2YvVmFYeGV0ZU5FMWNyaHRwNlZSU0txYXBjUlMyRzIv?=
 =?utf-8?B?ckg1dlFkQzduNVZBYVFaNE1CaGFScDl5bDB5UUw3Mkt0Zk9md2Z1YmRwWjV5?=
 =?utf-8?B?bG9LRHJqaE9USXFUTXVCQzBBOW91RFdtOGg3b00zTkt3eDkyQ29oNk9qdENv?=
 =?utf-8?B?alQyYnI4SHd6SGJHTTJtZlBNMlk3ejF1WVhFeDhxUmpad1VEdlRJUWhnODJn?=
 =?utf-8?B?LzM0RmxRTW5GQ1Zubkl2ODBrSjUrVEdjSzBrVmFGK21oVlE1V3cwbG9FeFZX?=
 =?utf-8?B?YXdtVngwc1g5cENoQmlYTGw3Vnpzd1RmVlhzWDhFT1F5ZWhVdXQyTXozcmJY?=
 =?utf-8?B?Ri9uTnY3ZUNyanZBMUZyU0VoRFVMSExNbVlpc0pueU9WQlVBTUNLWE9lbEJt?=
 =?utf-8?B?S0lYR2lWNko2NmtFSjlleVNkOTFHbUhhczJHSUxHTDdtbGdWcVBiUFlsVVRU?=
 =?utf-8?B?SWZ0UFVxV1VNSmpQbjh5a2pCckNoMG1IeXNsWFZvMzczS2FqUTY1bzR0b0Ri?=
 =?utf-8?B?OGppY2xzZ0hNTEhkQlY0TlJBSFJhWFF4aGlkMW5FR2lMZGlZT2ZyVVBmem4y?=
 =?utf-8?B?Uy8wQ2V2eDkyd2dRSTFOd1BwNnVxcU9tb2NZb3V5SkE2UlNFYnFoeHN6MzlF?=
 =?utf-8?Q?QQ9ZVd0wYrXWIe8Y=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <939A78B36083AD499B6702EB428CA9D2@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Oa7u5LMjc9uTNMCS9Fl7/p8ijvig9iUEVCDJMFidaaD5Vz4fJ0WIQaVwja7hMhcDMFHLmplJr9Aol8w2el2vj2ctb7n7cMzd2rWwII2tp65j678pAEZYG2xM5ed913ZUAng5RzQmVXbbWC9YTsZ8uxyfINE5yYyW+7XVqA+RakdVTq9/sTb+QOvAeOX6g1mKLvsgiqL/lqi/b1rN5/5q64qcq0cz+R3y8gctnnCz5M5GavGF6tFjPk/A91aWoZ21RZfi9RX+tav7yiryju9LjKZxJkR5lO96R6X+recfVrjwcl1xElETzOab4TK2pfIiWs2rFUql9YyMF0MbKCTGqQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH3PPF7DB70F9CE.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78413b33-3455-463e-3056-08de8e639df1
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Mar 2026 13:52:43.5861 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r5cuPSbRjoaMogyfIc43VqSXpPPzC1a25oEq0sV7I3N3S9PYFZrwL0HGFSwfvlHvrthqFklELJDsGzpn0dUapg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8603
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

T24gTW9uLCAyMDI2LTAzLTMwIGF0IDE1OjE3ICswMjAwLCBLYW1pbCBLb25pZWN6bnkgd3JvdGU6
DQo+IEhpIEtub3AsLA0KPiBPbiAyMDI2LTAzLTMwIGF0IDA5OjAxOjM5ICswMDAwLCBLbm9wLCBS
eXN6YXJkIHdyb3RlOg0KPiA+IEhleSBaYmlnbmlldywNCj4gPiANCj4gPiBJbiBnZW5lcmFsLCBJ
J20gbm90IGNvbnZpbmNlZCBwdXR0aW5nIGFsbCBhdHRhY2htZW50cyBpbnRvIHRoZQ0KPiA+IHJl
c3VsdHMuanNvbiBmaWxlIGlzIGEgZ29vZCBpZGVhLiBUaGlzIGludHJvZHVjZXMgYSBzaWduaWZp
Y2FudCBhbW91bnQNCj4gPiBvZiBvdmVyaGVhZCBmb3IgQ0kgcmVwb3J0aW5nIHByb2Nlc3NlcyB0
aGF0IGRvbid0IGNhcmUgYWJvdXQgdGhvc2UNCj4gPiBhdHRhY2htZW50cyAodmlzLCBDQkwsIEpQ
IEhlaWtraWxhJ3MgU0lTTyksIG1ha2VzIHRob3NlIGZpbGVzIGV4dHJlbWVseQ0KPiA+IGxhcmdl
IGFuZCBkaWZmaWN1bHQgZm9yIG1hbnVhbCBpbnNwZWN0aW9uLg0KPiA+IA0KPiA+IENhbiB5b3Ug
Y29uc2lkZXIgc3BlY2lmeWluZyBhdHRhY2htZW50cyBhcyBmaWxlbmFtZXMgdGhhdCBzaG91bGQg
YmUNCj4gPiBwcmVzZW50IGluIGEgZGlyZWN0b3J5IHJlbGF0aXZlIHRvIHRoZSByZXN1bHRzLmpz
b24gaW5zdGVhZD8NCj4gPiANCj4gPiBUaGFua3MsIFJ5c3phcmQNCj4gDQo+IENvdWxkIGl0IGJl
IGFuIG9wdGlvbiAtLWF0dGFjaG1lbnRzWz1sb2d8anNvbl0gd2l0aCBkZWZhdWx0IGxvZz8NCg0K
SU1PIHRoZXJlJ3MgcmVhbGx5IG5vIHBvaW50IGluIGVtYmVkZGluZyB0aGVzZSBpbiB0aGUgSlNP
Ti4gSnVzdCBrZWVwDQp0aGVtIGFzIHNlcGFyYXRlIGZpbGVzIGFsbCB0aGUgdGltZSBhbmQga2Vl
cCB0aGUgd2hvbGUgdGhpbmcgc2ltcGxlLiBJDQpnZXQgaXQsIDIrR0IgSlNPTnMgYXJlIG5vdyBw
b3NzaWJsZSwgYnV0IHRoaXMgZmVhdHVyZSBpcyBnb2luZyB0byBjYXVzZQ0KdGhvc2UgMitHQiBm
aWxlcyB0byBiZWNvbWUgdGhlIHN0YW5kYXJkIG9uY2Ugd2Ugc3RhcnQgYXR0YWNoaW5nIHN0dWZm
Lg0KDQpSeXN6YXJkIA0KDQo+IFNvIGJ5IGRlZmF1bHQgZmlsZXMgd291bGQgb25seSBiZSBzYXZl
ZCBpbiByZXN1bHRzL04vYXR0YWNobWVudA0KPiAod2hlcmUgTiBpcyBhIG51bWJlciBvZiB0ZXN0
IGluIHRlc3RsaXN0KSBhbmQgYWxzbyByZXBvcnRlZCBpbiB0ZXN0DQo+IG91dHB1dCAoaGVuY2Ug
dGhlICdsb2cnLCB0aGVyZSBjb3VsZCBiZSBhbHNvICdub25lJyBmb3Igbm8gcmVwb3J0KS4NCj4g
DQo+IFJlZ2FyZHMsDQo+IEthbWlsDQo+IA0KPiA+IA0KPiA+IE9uIFR1ZSwgMjAyNi0wMy0yNCBh
dCAxNDoxMiArMDEwMCwgWmJpZ25pZXcgS2VtcGN6ecWEc2tpIHdyb3RlOg0KPiA+ID4gVGhpcyBz
ZXJpZXMgaW50cm9kdWNlcyBzdXBwb3J0IGZvciBob29rL3Rlc3Qgd3JpdHRlbiBhdHRhY2htZW50
cy4NCj4gPiA+IEl0IGlzIHNvbWVob3cgbGltaXRlZCBhbmQgc3RpZmYgYnV0IGFsbG93cyB0byB3
cml0ZSBhbnl0aGluZyB0ZXN0L2hvb2sNCj4gPiA+IHdhbnRzIHRvIGF0dGFjaG1lbnRzIGRpcmVj
dG9yeSBhbmQgaWYgbmFtaW5nIGNvbnRyYWN0IHdpbGwgYmUgZnVsZmlsZWQNCj4gPiA+IGNvbnRl
bnQgaW4gYmFzZTY0IGZvcm0gd2lsbCBiZSBpbmNsdWRlZCBpbiBhcHByb3ByaWF0ZSBzdWJ0ZXN0
L2R5bnN1YnRlc3QNCj4gPiA+IHJlc3VsdHMuanNvbiBwYXJ0Lg0KPiA+ID4gDQo+ID4gPiBTZXJp
ZXMgdGFyZ2V0cyBvdXIgbmVlZCB0byBpbmNsdWRlIGd1YyBsb2dzIGZvciBmYWlsZWQgdGVzdHMg
ZXNwZWNpYWxseQ0KPiA+ID4gaW4gdGhlIHBvaW50IG9mIHRpbWUgd2hlbiBpdCBvY2N1cnMuDQo+
ID4gPiANCj4gPiA+IHYyOiAtIGFkZGVkIGNsZWFyaW5nIG9mIGF0dGFjaG1lbnRzIGRpciBpbiBv
dmVyd3JpdGUgbW9kZQ0KPiA+ID4gICAgIC0gZ3VjLWxvZyBob29rIHNjcmlwdCBpcyBub3cgaW5z
dGFsbGVkIHRvIGlndCBkYXRhZGlyL2hvb2tzIGRpcg0KPiA+ID4gICAgIC0gYWRkZWQgaG9vay1l
eGVjLWFsbG93bGlzdCB0byBzZWxlY3RpdmVseSBleGVjdXRlIGhvb2sgc2NyaXB0cw0KPiA+ID4g
DQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBaYmlnbmlldyBLZW1wY3p5xYRza2kgPHpiaWduaWV3Lmtl
bXBjenluc2tpQGludGVsLmNvbT4NCj4gPiA+IENjOiBLYW1pbCBLb25pZWN6bnkgPGthbWlsLmtv
bmllY3pueUBsaW51eC5pbnRlbC5jb20+DQo+ID4gPiBDYzogUnlzemFyZCBLbm9wIDxyeXN6YXJk
Lmtub3BAaW50ZWwuY29tPg0KPiA+ID4gQ2M6IEd1c3Rhdm8gU291c2EgPGd1c3Rhdm8uc291c2FA
aW50ZWwuY29tPg0KPiA+ID4gQ2M6IEtyenlzenRvZiBLYXJhcyA8a3J6eXN6dG9mLmthcmFzQGlu
dGVsLmNvbT4NCj4gPiA+IA0KPiA+ID4gWmJpZ25pZXcgS2VtcGN6ecWEc2tpICg2KToNCj4gPiA+
ICAgcnVubmVyOiBSZW5hbWUgZGlyZmQgdG8gYXZvaWQgY2xhc2ggd2l0aCBkaXJmZCgpDQo+ID4g
PiAgIHJ1bm5lcjogQ3JlYXRlIGF0dGFjaG1lbnRzIGRpcmVjdG9yeSB0byB1c2UgYnkgaG9va3MN
Cj4gPiA+ICAgcnVubmVyOiBBZGQgYXR0YWNobWVudHMgZGlyZWN0b3J5IGNvbnRlbnQgaW4gc3Vi
dGVzdHMgcmVzdWx0cw0KPiA+ID4gICBzY3JpcHRzL2hvb2tzOiBFeGFtcGxlIGd1YyBsb2cgY29w
eSBzY3JpcHQgdG8gYXR0YWNobWVudHMgZGlyDQo+ID4gPiAgIHJ1bm5lcjogUmVuYW1lIHBhcnNp
bmcgZnVuY3Rpb24NCj4gPiA+ICAgcnVubmVyOiBBZGQgaG9vay1leGVjLWFsbG93bGlzdCB0byBl
eGVjdXRlIGhvb2tzIHNlbGVjdGl2ZWx5DQo+ID4gPiANCj4gPiA+ICBsaWIvaWd0X2hvb2suYyAg
ICAgICAgICAgICAgICAgICAgfCAgNCArKw0KPiA+ID4gIHJ1bm5lci9leGVjdXRvci5jICAgICAg
ICAgICAgICAgICB8IDg4ICsrKysrKysrKysrKysrKysrKysrKysrKy0tLS0NCj4gPiA+ICBydW5u
ZXIvZXhlY3V0b3IuaCAgICAgICAgICAgICAgICAgfCAgMiArDQo+ID4gPiAgcnVubmVyL3Jlc3Vs
dGdlbi5jICAgICAgICAgICAgICAgIHwgOTcgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
Kw0KPiA+ID4gIHJ1bm5lci9zZXR0aW5ncy5jICAgICAgICAgICAgICAgICB8IDMxICsrKysrKyst
LS0NCj4gPiA+ICBydW5uZXIvc2V0dGluZ3MuaCAgICAgICAgICAgICAgICAgfCAgMiArDQo+ID4g
PiAgc2NyaXB0cy9ob29rcy9ndWNfY29weV9vbl9mYWlsLnNoIHwgMjQgKysrKysrKysNCj4gPiA+
ICBzY3JpcHRzL21lc29uLmJ1aWxkICAgICAgICAgICAgICAgfCAgMiArDQo+ID4gPiAgOCBmaWxl
cyBjaGFuZ2VkLCAyMzAgaW5zZXJ0aW9ucygrKSwgMjAgZGVsZXRpb25zKC0pDQo+ID4gPiAgY3Jl
YXRlIG1vZGUgMTAwNzU1IHNjcmlwdHMvaG9va3MvZ3VjX2NvcHlfb25fZmFpbC5zaA0K
