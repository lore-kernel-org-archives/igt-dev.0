Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 605DED68BDA
	for <igt-dev@archiver.kernel.org>; Fri, 15 Nov 2024 23:38:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA53210E3CD;
	Fri, 15 Nov 2024 23:38:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hNVRwc25";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD41410E3CD
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Nov 2024 23:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731713922; x=1763249922;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=9JpM/Kbk3fruGsCibNLxrygGBuxMysa4U++x2gdzQtE=;
 b=hNVRwc25/4AERK4suFx7DFUFbXnj+IugpAsQTMgMVxXO6Je7Fj5Mq60z
 v57H65s200jaa3RBfLGrMK7sLE9CiEBTIzpSEdpptUUSQt/DjR3vBbaFY
 cWE1GVZ+3at14w2QhOn1WRS6aAkq/zCNnV3Gm+sThPpidbfpV9TLcmYf9
 0vQ/CK/J3AGDslOG5gffYJ3mkdLjQ/ZUmNkk3TigLCxEOi4ht2IcRNlOY
 Ib+QWJ35ADEk/yb/eh7+PVL2MZklj7hd2vBLtYjTSnu/XUEfen6N1SQUT
 Io1jcqGQ1ZGlmDNBck3VievJIGUTc2kBH4LohZiL7bczWvQcYRvnBNrUK w==;
X-CSE-ConnectionGUID: H9nhDihLTgy/4z0qp9F/dQ==
X-CSE-MsgGUID: ku7KIJntQOC7DlBTZudF7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11257"; a="31895081"
X-IronPort-AV: E=Sophos;i="6.12,158,1728975600"; d="scan'208";a="31895081"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2024 15:38:42 -0800
X-CSE-ConnectionGUID: lVOqzs/UT0WevTlC7MPQjQ==
X-CSE-MsgGUID: XNLa404kRdSZQA8xlZbs2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,158,1728975600"; d="scan'208";a="89097713"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Nov 2024 15:38:40 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 15 Nov 2024 15:38:39 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 15 Nov 2024 15:38:39 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 15 Nov 2024 15:38:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RrxI2yZje6accK420EXn8iyDHI68KyhYSNawVcS/Mjrady8WMRCYLJd8ynabAal8VJjvvvMoDdmpVxj78aR56nwm2VHI7+tDOPq3tpBRTw6IhJYXqNtfEfbjzaiXqppsUMYITLfwqEUrNKqZcfZIFQlJgPHK0dkKlVf9fEP1w8PvksqdLgg3LYQHCQK/+rEz/yw6Jk8ZK/LUrNvZCe0aYMAh7Hpm2S+cEgwdpS6Hp8/RdADuKRNIKTllK6ZcY1fSYcfdGWQYzlJIrVk7R05XEtxNJs616DJ6aHCB388jZzH4zDipPbHz9MpicM9lALOZVj8eQUSEBprf0ZrjITtQSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9JpM/Kbk3fruGsCibNLxrygGBuxMysa4U++x2gdzQtE=;
 b=Y3J15YIGzDcBOsbpn4KiaNHyawb9nd/bIwNwxGD86Aovv1M3h8YtD6qghGVFaaT8XJDRPr7nGSFBKD1mbcAokgSh47RZuIkgXCvelorUaP0C8ZlkFDgb7XEtq+e+BHoUgOxo/yBJNSPaUG8o/WaFuapF7r598L4HugEhKEW/wHtKz18dGwY/m2VM8Snlk9BqtKzxDg44T5CBZzxtRw7QkkLY+yMEtYjfykHP5Rt8Tzk8zFCOMrXnIJuycyqbGOMUjOciNuY5uL8Yr8U+KpcSagks6Ox+9jLlZtQRmA3WJA44u/2taJqYm382gllDLK/wmuf5eHetF2hR0GeN2eBjew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN0PR11MB5711.namprd11.prod.outlook.com (2603:10b6:408:167::22)
 by SJ0PR11MB5086.namprd11.prod.outlook.com (2603:10b6:a03:2d1::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.19; Fri, 15 Nov
 2024 23:38:30 +0000
Received: from BN0PR11MB5711.namprd11.prod.outlook.com
 ([fe80::4137:d45e:2206:50aa]) by BN0PR11MB5711.namprd11.prod.outlook.com
 ([fe80::4137:d45e:2206:50aa%5]) with mapi id 15.20.8158.019; Fri, 15 Nov 2024
 23:38:30 +0000
From: "Taylor, Clinton A" <clinton.a.taylor@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Pottumuttu, Sai Teja" <sai.teja.pottumuttu@intel.com>
Subject: Re: [PATCH i-g-t v3 1/9] PTL: lib/intel_chipset: add pantherlake
 definition and support
Thread-Topic: [PATCH i-g-t v3 1/9] PTL: lib/intel_chipset: add pantherlake
 definition and support
Thread-Index: AQHbNuDvFFizm0a8W0Or4rL5pF4odrK4B9aAgAD5WwA=
Date: Fri, 15 Nov 2024 23:38:30 +0000
Message-ID: <da10fba7035dd6fac673b121b591a3e249a43124.camel@intel.com>
References: <20241114190339.3885752-1-clinton.a.taylor@intel.com>
 <20241114190339.3885752-2-clinton.a.taylor@intel.com>
 <23b82425-281d-4ff5-b49f-165d1f10ecdb@intel.com>
In-Reply-To: <23b82425-281d-4ff5-b49f-165d1f10ecdb@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR11MB5711:EE_|SJ0PR11MB5086:EE_
x-ms-office365-filtering-correlation-id: 37d1e565-99c0-4649-8acd-08dd05ce9cbc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?aWdDRWJYTmh4cmViVXdwNnY5bFVnaVliR3locnRtcXlpelFIL29vcE4wQkRV?=
 =?utf-8?B?YVRLaTE1L2JJTEpBQk10aUNoekUxUXgzaWljNTNyY3hnWTJtTUxGTDNOdTVa?=
 =?utf-8?B?ZTlFWEFMbFNUM0xDdEQ5RnpRZU5sdStmeDZxdVd2UHh4TnVNT0tUZmZBNUJH?=
 =?utf-8?B?UmptclhGK3F5STlMbU9pS3FQS3ZkR0gxVVBUeWRVN2grdjEwMlQrOFlIWDA1?=
 =?utf-8?B?VkpMVWR3SHgzTHhiNlR1anBmaW9VZk4rNTlGY2VxK01qY2srcGJ5OC9zN2NK?=
 =?utf-8?B?YkY1Vmo2cUZGYTJFRUV0OU5VajdQUWlHa3pITlFjR0FNOU1HTnZUVHUrSkpk?=
 =?utf-8?B?d0pSTU43VXJSODBhdFVBYURtYno4SXNYQXphaXlrQUNRbkpLTytqYjgzTjRX?=
 =?utf-8?B?WEd2c3dKWG1MaDNYWmVRSStydTMvZzVnRU5kbmtzRytyZjRISkFpL2ZhUm1p?=
 =?utf-8?B?VmFJb0d3bjd2Vm1CNktYeDU0M2Q4LzF2NkNIbHBRdWc0VGZvNUd4UVJ1Ymli?=
 =?utf-8?B?cGdZYzdHVFVCRU8zU0orT3hHMVFzRWxxalFnUEsxTEV5SWVRNVptYkFZcHhU?=
 =?utf-8?B?TGdtTkVzWW5Jbkt6TGxnVi96NGJ3Z1FwOGdnYW8zamJwenNqRXFXd0xQV0FE?=
 =?utf-8?B?Z3Y2K3JiUXAvMzRqTjN5dFBZR0FNZVVJMzQ3ZnNubG83M1o0eEQ3SGo1UENB?=
 =?utf-8?B?UjZVdXpyNkdhcnZiSVBhUHIwajVLbkRhSllNQXp3Y1dvN3JmanVxKzluTWtT?=
 =?utf-8?B?K0VEL1g3R0lhQkNlbFpJb2VuQUQwOTk3akxic1BkNzY2NHgrVjhGU0VXVmpQ?=
 =?utf-8?B?NCsvWnBGTGt0TU5LVHd4eU5vamNmd05nL1hwNXlSNUNoZnBMWHkzSzRGSUhF?=
 =?utf-8?B?bEJqZUxZZGNEVnBRS3U0cjZ2bW1CdnNHd05ZRWFUWFlaOUNGdU93bmNReGpo?=
 =?utf-8?B?cXBnKzZ3dTNVR0w0aG5ZbXoxL3hMQ2Izb3F3YjNaMmRuY2lpaWlubFNsMVRJ?=
 =?utf-8?B?RjlTbWZkZkJyZE5QUW5HUmJ4ZnVGWmJrWjU0RjNmdktoeGlGeDNmUVZ5aXhR?=
 =?utf-8?B?bE5XZS9XZkpJWnVNcFZuR3JoYnFHRE5GZFZ5ckg1M3lmZmMrV29SeWV4OEJK?=
 =?utf-8?B?d1VpTE1JQUd4eGZEYWpuWnVOWTljamNqL1poQ2dSMDIrL1hQUmRtMzhXNGp1?=
 =?utf-8?B?WklsYnVaZ213d2hGbHkrR3BNUGdCZHdHSE80QVk5bDBZVTVqeWxGU1J6azli?=
 =?utf-8?B?WEVwc0FKdFVOQVE1TlNiQW5xelUvL2V3NGhzazNmaVRNcFE3OUNhUkhnRklH?=
 =?utf-8?B?dVA2NjFHSTl3cE53U09NSENXRHJ0SDdSZGlOTXBSamlwN29Sd3FwdUNWelhI?=
 =?utf-8?B?dlZRTjM4WGY5NElubGd1dUppWWxWVGJ2K1dYdW5mVHhhMERWRXNFVThXL1I1?=
 =?utf-8?B?TnQzcUtqTERMb3o4aEIzZ3pMZ1NrU0JGMkxTTjR1TjJ1UGdLcW5WRVROcm5K?=
 =?utf-8?B?cWxuSkcxMFZRNkN0clAxOExFaFVnZmVHOHI3czFBdGkwWnlQZVJuWlJvZHZl?=
 =?utf-8?B?RlV1T3h2eWxYeGRpVmVPOUYvK1M1R2ROUFlhVWxOYXA1ZjNXZENqdFUvcjk4?=
 =?utf-8?B?U3ZuanNWUGtkbHdHZ1dud1NWM1hUeWkzb2NJaWNldUIrMU1adDBucS81MkZK?=
 =?utf-8?B?NG1vQlJJMjlWai9pcjNneVNKd1BnOHNQVHVQeW5ReEpkVnhMN2RnV2k1OG0w?=
 =?utf-8?B?Ry9GTlZyalJobjFpeGdQREpLRFYrNFJvT2pybXNGTGtrcTU0RmxJY3M3YmZI?=
 =?utf-8?Q?uI8ccYWxH4gih7G5IscBN6/q6mZU0xu3ssGM8=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5711.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q1ZWc1EyUTFsTmwxKys2TkJCeVNQUVQ5SXowMXFMamViSzhMTzFrVTBBd3Vl?=
 =?utf-8?B?TkJaZGZlbE1OWFl0RVhDOU5KQ1JZbThzVTNIejRNaGRGOG5tc2pEb29RZUxP?=
 =?utf-8?B?d3FhbW5aeUk0dEs4VFFtWHZ2RmwrTlRkd2JPL0tsVXpwUW1wNStOQ0ZXbnRS?=
 =?utf-8?B?KzNMMk9jdjkzZ2FhYk03YzVGeFhkb01mY2x4QVA3Nm9rZ1oyaGViMGtnTjhu?=
 =?utf-8?B?dEFBRXY0cCtGUWJOdXVWTFByaEtBcFlibUZoNjlXTmpqZDMzSmhGekFVNG44?=
 =?utf-8?B?TFhwYWFTa0ExVzVLOUsyUFlLM1dGYU81UUxkTjN4UjBRZk5uN1JYT3V1eFdT?=
 =?utf-8?B?ZThvc0pNZ1FwcUVGVUJxclRRY2N4YlAxTHppOUoxbFFZcEpMc25qMUJ5Z0hp?=
 =?utf-8?B?YWU4aCtUMDE1NWJTUTJnSGNCRnV1L3NQRmFiRmg0cUM0U2YvdVNKUG1tbHNH?=
 =?utf-8?B?ZlVNc1haM3gxc1hhQjNCTkVpVXBuV3ltN3dIbnhrcFlBeDFQOXM4N295dHdF?=
 =?utf-8?B?YzVrNHUvKzNGdHhtQ3BQUlRzU1I4Yy9rOVJuOGlXTVYzYmI2VHMrUlhhOWJJ?=
 =?utf-8?B?TFNna0ZFTm5nSWZKa1dmQ0FhVDVjbUl1dkQ3bGpqM2JaeVNDMDExbXV5eFVF?=
 =?utf-8?B?SS9xdXlRZEx5bjltckJtcWFVbHZrdnB1Q29WVkRJbXF1VXVNUmxaREFEbytI?=
 =?utf-8?B?QjhEZUxqRG4vWmUvVFV0TTZsNzZFM0lDcU9KU2Fjd1M0L2FGRUFzNGRnc3FV?=
 =?utf-8?B?ajk1RHhPRzhNSjdXQW1QUkQ5OXJsK0JSQUMwR2FxYkdTdytDODNBTXkrUjEw?=
 =?utf-8?B?dHhid1RVcjVpU3lqdDBGcEJOc1dQRVFyTzIwL1dieVFobjZJNkhLd3BKVmgz?=
 =?utf-8?B?NHFSZWplL1hkTW0wZSt1MnZsYWRza1I0ZTV0a0QzU3FUdXA0VWtIN044SW5X?=
 =?utf-8?B?RlBrWUdUVkVvYTVXUmdJVkxnOFEwNHkzUFUwZFZGRUM5OUpHLzRZTjMxckJ1?=
 =?utf-8?B?L2lNd21Gc0x4a0RQRTViWk9yS3kvMW5YQnAyOG5wQTd5cTNBWG5MUXlOTFpL?=
 =?utf-8?B?NHkxY3lBQTVzRjFYUkpoN3VUeDgrNGdPWTJZUHliOWgxSTVwelF0bGdCdERK?=
 =?utf-8?B?V29Oalo3SXNGSXVHRWdTbHJIT2w5UUZ6cW5uWnJVSDRYZk95VHh0SnpFOCtt?=
 =?utf-8?B?Vk5HYkQxWVpHM2pmbW9UN04rWVFpOVZheVZMQVBFUGNqTGp2UGhHZ3NENGU5?=
 =?utf-8?B?WHJNV2dHRWNMbUwxc1JiZmRiOFhaMTdHbngyQ2trT3pvQVY1djBJV1Z2YkVq?=
 =?utf-8?B?UTBMK3FEUEN3Y0FUbjNDNSsyYm1Zb0lqSDdQMy9oK091MlJqT1RQZ0pNS0d4?=
 =?utf-8?B?N1dzVk5tZFZ0S3VERnRHVGJtSldBWlM3aDlySG1RblJ0cWlPYS9tUSs0WHB6?=
 =?utf-8?B?UFNBK3htdkFnRkphQThDbEVFd2wzZW5HYkgxV2RXWk5TUU5NdnVjOXRhL0xF?=
 =?utf-8?B?UFFpM1lWV0dNYXZUZmdqd2VqazNPUmRBTTFVR3AybFhBTi9kbWhzSmpTTCsz?=
 =?utf-8?B?UzBEVVVBOWs3aSswRWUxeFBDYUVLcHVESC8rV3pKbjkvazZhdUZlZlVkQytR?=
 =?utf-8?B?U21QY29iMkdVTEk2dDQ0WCt0NVRmS2F1citUcFNMYjVJd1I3OGNlbHVsV1ll?=
 =?utf-8?B?WVNEWWQ0K09Cby85M3pCMHpCV2tqaWtvb0NjZVVNMkNvQVZzRTA5M1l2c1hX?=
 =?utf-8?B?cG5iYUNWZWhXZ2ZMNlBEdFpCczJlWFRCVFpKdEVuSWZrUmozOWxJZzFTeDIx?=
 =?utf-8?B?eVdKU2JvSElOcGJyRXRpdHl3Wk92YnJ1bDdnNDljOXRGNjJmVnUwZERMNVFS?=
 =?utf-8?B?THVHYit6RFp6RHh4MmVIWXZGejd2ajVlVDNYSTJ6cCtXVHhuWUE1RUxOT2p1?=
 =?utf-8?B?UmJ2VkpSMGd4R1RnNk5RZkhPR3g0bjE0VXZRbXpjT2JqNXUxdm9tK0lkUDZV?=
 =?utf-8?B?RlhQb0E5UTUwQ24rMHJod1FuYlo1bVJiRFBSUUlna0hOQTZiMGdnOHFlU0FO?=
 =?utf-8?B?c3R6d09WRXg3TlJxWTdjTVR5cnkyaS9aUWM1bkNqazNta2hjUlpBNUhYdzVS?=
 =?utf-8?B?WHFjek0zNzFyMk1oZ2l0SDZOb3Iza2Q3MGlONEVKU3FpTHBaQ2ZBdDJIaWw3?=
 =?utf-8?B?MkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9A61EA82ED83CF4A86FD674256DACE36@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5711.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37d1e565-99c0-4649-8acd-08dd05ce9cbc
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2024 23:38:30.7454 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tZZqANTC0tvXPvc3Zkei1YkrTE3tN2rVjNE0CSe6AWVy22wMQWMQ0NUT0l/tCh80vItiX6jk+wB+kjy3CQTs4p8XUEtTM+te0isMxcXbpt8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5086
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

T24gRnJpLCAyMDI0LTExLTE1IGF0IDE0OjE2ICswNTMwLCBQb3R0dW11dHR1LCBTYWkgVGVqYSB3
cm90ZToNCj4gT24gMTUtMTEtMjAyNCAwMDozMywgQ2xpbnQgVGF5bG9yIHdyb3RlOg0KPiA+IEZy
b206IE1hdHQgQXR3b29kIDxtYXR0aGV3LnMuYXR3b29kQGludGVsLmNvbT4NCj4gPiANCj4gPiBB
ZGQgc3VwcG9ydCBmb3IgdGhlIHBhbnRoZXJsYWtlIHBsYXRmb3JtIGZvciB4ZS4NCj4gPiANCj4g
PiBTaWduZWQtb2ZmLWJ5OiBNYXR0IEF0d29vZCA8bWF0dGhldy5zLmF0d29vZEBpbnRlbC5jb20+
DQo+ID4gU2lnbmVkLW9mZi1ieTogQ2xpbnQgVGF5bG9yIDxDbGludG9uLkEuVGF5bG9yQGludGVs
LmNvbT4NCj4gDQo+IEkgdGhpbmsgd2UgY2FuIHNxdWFzaCB0aGlzIG9uZSBhbmQgdGhlIG5leHQg
ZmxhdGNjcyBwYXRjaCBzbyB0aGF0IHRoZSANCj4gY29tcGxldGUvY29ycmVjdCBzdXBwb3J0IHN0
YXlzIGluIGEgc2luZ2xlIGNvbW1pdC4NCg0KR29vZCBpZGVhLiBXaWxsIG1ha2UgdGhlIGNoYW5n
ZSBpbiB0aGUgbmV4dCB2ZXJzaW9uLg0KDQotQ2xpbnQNCg0KPiANCj4gDQo+IFRoYW5rcywNCj4g
U2FpIFRlamENCj4gDQo+ID4gLS0tDQo+ID4gICBsaWIvaW50ZWxfY2hpcHNldC5oICAgICB8ICAy
ICsrDQo+ID4gICBsaWIvaW50ZWxfZGV2aWNlX2luZm8uYyB8IDEyICsrKysrKysrKysrKw0KPiA+
ICAgMiBmaWxlcyBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspDQo+ID4gDQo+ID4gZGlmZiAtLWdp
dCBhL2xpYi9pbnRlbF9jaGlwc2V0LmggYi9saWIvaW50ZWxfY2hpcHNldC5oDQo+ID4gaW5kZXgg
MGMwNDQ3NmJmLi5jOTNhZDlmNzUgMTAwNjQ0DQo+ID4gLS0tIGEvbGliL2ludGVsX2NoaXBzZXQu
aA0KPiA+ICsrKyBiL2xpYi9pbnRlbF9jaGlwc2V0LmgNCj4gPiBAQCAtOTIsNiArOTIsOCBAQCBz
dHJ1Y3QgaW50ZWxfZGV2aWNlX2luZm8gew0KPiA+ICAgCWJvb2wgaXNfcG9udGV2ZWNjaGlvIDog
MTsNCj4gPiAgIAlib29sIGlzX2x1bmFybGFrZSA6IDE7DQo+ID4gICAJYm9vbCBpc19iYXR0bGVt
YWdlIDogMTsNCj4gPiArCWJvb2wgaXNfcGFudGhlcmxha2UgOiAxOw0KPiA+ICsNCj4gPiAgIAlj
b25zdCBzdHJ1Y3QgaW50ZWxfY21kc19pbmZvICpjbWRzX2luZm87DQo+ID4gICAJY29uc3QgY2hh
ciAqY29kZW5hbWU7DQo+ID4gICB9Ow0KPiA+IGRpZmYgLS1naXQgYS9saWIvaW50ZWxfZGV2aWNl
X2luZm8uYyBiL2xpYi9pbnRlbF9kZXZpY2VfaW5mby5jDQo+ID4gaW5kZXggNTQ2YjljNjVhLi42
OTEzMmU5MWMgMTAwNjQ0DQo+ID4gLS0tIGEvbGliL2ludGVsX2RldmljZV9pbmZvLmMNCj4gPiAr
KysgYi9saWIvaW50ZWxfZGV2aWNlX2luZm8uYw0KPiA+IEBAIC01MjYsNiArNTI2LDE2IEBAIHN0
YXRpYyBjb25zdCBzdHJ1Y3QgaW50ZWxfZGV2aWNlX2luZm8gaW50ZWxfYmF0dGxlbWFnZV9pbmZv
ID0gew0KPiA+ICAgCS5jbWRzX2luZm8gPSAmeGUyX2NtZHNfaW5mbywNCj4gPiAgIH07DQo+ID4g
ICANCj4gPiArc3RhdGljIGNvbnN0IHN0cnVjdCBpbnRlbF9kZXZpY2VfaW5mbyBpbnRlbF9wYW50
aGVybGFrZV9pbmZvID0gew0KPiA+ICsJLmdyYXBoaWNzX3ZlciA9IDMwLA0KPiA+ICsJLmdyYXBo
aWNzX3JlbCA9IDAsDQo+ID4gKwkuZGlzcGxheV92ZXIgPSAzMCwNCj4gPiArCS5oYXNfNHRpbGUg
PSB0cnVlLA0KPiA+ICsJLmlzX3BhbnRoZXJsYWtlID0gdHJ1ZSwNCj4gPiArCS5jb2RlbmFtZSA9
ICJwYW50aGVybGFrZSIsDQo+ID4gKwkuY21kc19pbmZvID0gJmdlbjEyX3B2Y19jbWRzX2luZm8s
DQo+ID4gK307DQo+ID4gKw0KPiA+ICAgI2RlZmluZSBJTlRFTF9QQ0lfSURfSU5JVChfaWQsIF9p
bmZvKSB7IFwNCj4gPiAgIAkudmVuZG9yX2lkID0gMHg4MDg2LCAuZGV2aWNlX2lkID0gKF9pZCks
IFwNCj4gPiAgIAkuc3VidmVuZG9yX2lkID0gUENJX01BVENIX0FOWSwgLnN1YmRldmljZV9pZCA9
IFBDSV9NQVRDSF9BTlksIFwNCj4gPiBAQCAtNjQyLDYgKzY1Miw4IEBAIHN0YXRpYyBjb25zdCBz
dHJ1Y3QgcGNpX2lkX21hdGNoIGludGVsX2RldmljZV9tYXRjaFtdID0gew0KPiA+ICAgDQo+ID4g
ICAJSU5URUxfQk1HX0lEUyhJTlRFTF9QQ0lfSURfSU5JVCwgJmludGVsX2JhdHRsZW1hZ2VfaW5m
byksDQo+ID4gICANCj4gPiArCUlOVEVMX1BUTF9JRFMoSU5URUxfUENJX0lEX0lOSVQsICZpbnRl
bF9wYW50aGVybGFrZV9pbmZvKSwNCj4gPiArDQo+ID4gICAJSU5URUxfUENJX0lEX0lOSVQoUENJ
X01BVENIX0FOWSwgJmludGVsX2dlbmVyaWNfaW5mbyksDQo+ID4gICB9Ow0KPiA+ICAgDQo=
