Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88C9CCFD31C
	for <igt-dev@archiver.kernel.org>; Mon, 24 Nov 2025 08:55:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 398C610E1E9;
	Mon, 24 Nov 2025 08:55:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dxesOnfE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA0FC10E1E9
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Nov 2025 08:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763974557; x=1795510557;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Q3qS5cacwk/kU3cbZCcIXnTQx6Obdw/T5xpqXq7xZnE=;
 b=dxesOnfECntQaXjTHalnQBeIBhFK7YWtuvImcP4bvEpLacCPsYE2QnWT
 HoMra3O0UnzvsWL3fhHwzfWVGH+OL4p/fa4qAFZPMtoNmzXjX94MNBIFs
 DfhJ05rGicG+kzMZahuo4eCfCy/mFpwua7VtJLEClMkG1vidSH80dW3PQ
 +Oq46NZYdy8lPewjBMAh50ZamYIGfHfOFYPbqP9yW/uw1p9ntfLRU1l6T
 YCv1sO29cmvyn3iUDJqcFxDwUuR4cYTa+8mxIpvZr8IyvAqa4jaC6R6H5
 NdK2MRmKNUzY2EMhq6bCKuRmXQkp6toimKqZan49GaLAzoz35CR5VHYFJ w==;
X-CSE-ConnectionGUID: uexOUpVRT9uEpV1pKN2Neg==
X-CSE-MsgGUID: Hnxu7rcyT6aat0EkLscswA==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="69832363"
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; d="scan'208";a="69832363"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 00:55:56 -0800
X-CSE-ConnectionGUID: UXMp7Tz1T6uoWxAhSdaPnQ==
X-CSE-MsgGUID: s+hybQI3Sdi5gtCfb8/Gsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; d="scan'208";a="196730418"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 00:55:56 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 24 Nov 2025 00:55:55 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 24 Nov 2025 00:55:55 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.6) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 24 Nov 2025 00:55:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L6xNBs7d4nmUjOi5JqB3GPdnjlqoOZT8U/21AjZ0b/UOWZKGxI4R83iMd7JgcRsr0YtpLSQdAyhZtr7vMpulN/lZ/JQFahUwXEy/UGvRNmFIaHyrCGsf3+VdgfBtUoUJIgfSRhH429UlPHsHo1YBua6eHhdHzsmUQ8wSQ8zAXu4RcB0qDrBRdbeVANIEqsA8quIGmbPeiWwKyUM+z2EPz3PCmNnr8SQiOO/5tV9bSYZBQciCfenRsjGf6vrsfFDh1LQimxhI4wpwBGL/c/vS531355bsxKg2IcfNrUUezb0jpKiZSus3czW4D/Ysa5EzX/dea6GX+xSUcWhZrTlB9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q3qS5cacwk/kU3cbZCcIXnTQx6Obdw/T5xpqXq7xZnE=;
 b=dHpt520Xq+kuOAflTBvmFTOA5fbZI4u6mYNPEbyPNZEXoKfv37lX/Gq7k9fiB9QqiXzE8RIsBHQcXmFaCn2iOmFLrsz8jV+of7c1FbDE0uEgCp4ejt6GLgUFaHOD9Y6JiuL9Ydqgu58ps6pO/GFiD7Vh7CUck6iNQHKuOYiuaMjKdMxHBsqL0BBHe606AarAFUoq0Jqxn0JKInfcNrC2njJiiR1K82ixgo9I3jdIe5u3+40GhWTQby0ov8UBd4DJ718VZhJmtIsELavbSm5lFhxnkW7lB8bIFykWUEy8ZIt7jTZ5xu3s6p8Ps1XUMqRdAkysf7c/E3wTPRc4pe4cqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by SJ2PR11MB7476.namprd11.prod.outlook.com (2603:10b6:a03:4c4::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.16; Mon, 24 Nov
 2025 08:55:52 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525%4]) with mapi id 15.20.9343.016; Mon, 24 Nov 2025
 08:55:51 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Hajda, Andrzej" <andrzej.hajda@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: Kamil Konieczny <kamil.konieczny@linux.intel.com>, "Mun, Gwan-gyeong"
 <gwan-gyeong.mun@intel.com>, "Piorkowski, Piotr"
 <piotr.piorkowski@intel.com>, "Manszewski, Christoph"
 <christoph.manszewski@intel.com>
Subject: RE: [PATCH v5 2/5] lib/xe/xe_query: introduce helpers for device query
Thread-Topic: [PATCH v5 2/5] lib/xe/xe_query: introduce helpers for device
 query
Thread-Index: AQHcWtYbcGdj2Xa5a0eOaOoUE2iXUrUBfjnwgAAMSqA=
Date: Mon, 24 Nov 2025 08:55:50 +0000
Message-ID: <CH3PR11MB84348F138D2F23FA354D2A298DD0A@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20251121-xe_query_helpers-v5-0-d69c1c160e96@intel.com>
 <20251121-xe_query_helpers-v5-2-d69c1c160e96@intel.com>
 <CH3PR11MB8434E89B00773717823BD8D08DD0A@CH3PR11MB8434.namprd11.prod.outlook.com>
In-Reply-To: <CH3PR11MB8434E89B00773717823BD8D08DD0A@CH3PR11MB8434.namprd11.prod.outlook.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|SJ2PR11MB7476:EE_
x-ms-office365-filtering-correlation-id: f70267a9-5f37-4e48-0839-08de2b3744bf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|10070799003|1800799024|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?ZlRmQWJYMm5KYXZxdDdxZnhQMFRBRFZiZm00ckRyejR6RU5qMElwd0ZuQzJw?=
 =?utf-8?B?M2pHNzY2V3NEUlprSTRJVUpoV3Y0ZjhndHZnVmQzSmd0b1Z4TU5zbG5ORmZT?=
 =?utf-8?B?THZlOU9rVXZWRW1QZkM2cGpoLzNLYnV5cVJUZVhUd0VPaFJOZzNSVFdLQjBu?=
 =?utf-8?B?TVRweGpESEdVelFnYTRqeXNwblJrQ2U1TDF6c0czSDRiR21Vd09qcHZiQjVE?=
 =?utf-8?B?ZmxmNFRyK1BPU2J0M1hBeWIzYXNlRUk1ZEtRRzBQWmxDYmJCM044UVYxSnhN?=
 =?utf-8?B?VlVwN2hvbWhlZk1TUEQ4KzVWb3dBUURmdTMrS1hxYWUrbm83TFlWYTIxN1pk?=
 =?utf-8?B?S1NKM2ZMRE9ZeDlwWXlHUHp0VmYrSHpHaW80UUhmWWNRdU1pSVZzN0FVRDhn?=
 =?utf-8?B?YzJHZ0hKdXlWNEIwczBELytGL3NSV3pQNUpaSUF6aWt5elhONVdzaEQyOVpX?=
 =?utf-8?B?QVZqakhvMVZlWEdlclg2ejBpNmV1RWtQTy9OTDdyTWR6SmdTZW1UNWlieDNM?=
 =?utf-8?B?cnFKdVFtMVM4a0svcndqeWg1dVZWblFRSmZnb3ZCaTJUdTFWMUwxSzg2ZUl3?=
 =?utf-8?B?ZE4zTEwzSCtXZGdWSThUalpDU3BnZEV1a2FEeVJPWnVSVFZMZm02WTN6a1FP?=
 =?utf-8?B?ZnJ6SVRZb1BlejU4dHFuajdNLzlpNTRNRXJ5NURwcVpVTlRVaTNEZlJoOUo5?=
 =?utf-8?B?OVhrRHVENlAwbnpLL2tWUlVBQkk2aUp4aktob1dneHlmLzhEbGVSNkE0N0JH?=
 =?utf-8?B?SEtXN25xcHFzaEY4UkhzYlhZZityTnJFdkgyUmd1ODV5M0w5UlRldVZielVC?=
 =?utf-8?B?eEc0M2N2YjNNQnlXSWgxcm5VUTZpb2pzbTNlNlJmU2ZoTFpvMEh2NU1OOTJX?=
 =?utf-8?B?ZlZRMTY1bkF2Nnc4aXpDY2w0cGZSMks3YVJQc0NXYUNpb0NOcFBidFVjRm9E?=
 =?utf-8?B?dFAzSWZ4Yno2WHFFcmFFY01Zc1RnODU3RTRBblpIakJzaVNxM3laK1ZaZUNV?=
 =?utf-8?B?V2Q0eisxaVFSVzFrOWtxc2p5em9WTjB3WUFHOElBbDRreGNRQWM3RTdDNTBi?=
 =?utf-8?B?aDVYWktRdUxST2RQNTVxWm9IV2luQmlyRFFVaE8wWFNpMjRPVUx1QWwrdUNj?=
 =?utf-8?B?YnJ5MEFyNk9jK0dhVEtrTzBKL0JjTEdkWjI4c0F5YjhEV08zZ3BMbUozMHh4?=
 =?utf-8?B?UDMyd2pQbXJ2WEJFNkEzR0loZ3ZuejdUeWcwT0htL2ROd2orYktkNUZzVlBY?=
 =?utf-8?B?UkVQcHpVZS9yZEE5WUQyM3VQOWIyazJvNmo2ZHkxVjArcnFVOVhVdGQya1Bn?=
 =?utf-8?B?bmh1cFVzMXRwRlkzRHU3aGFLbWYxMzZyd3NOUHJWK0JMN3R0Tk05L3VGZFFL?=
 =?utf-8?B?MzlNNXc2aEQzZHFRT0MyWkVMejNJSTdTTHk3dklVRWRHNlVsK1dPV1BkLzZG?=
 =?utf-8?B?aDJDcWlxRGxOdG5GM0hBSDkza3pYemdRUE1maTlSMjZ1cVJvQlZncmZMNjc3?=
 =?utf-8?B?eUNEelVmZHBXVFp5cWxrdzFrZVg5ZE5pT2hoVkFXUS9XWXpFZGdaYnZpQmZh?=
 =?utf-8?B?YVBRNFZMNFJJZmdpRW81L0l0SzhjRVE4Vm5OemdpaDFMY1d6djZRRHlwV0FD?=
 =?utf-8?B?M1RDNDcxLzNNNHpmYzFTTWc5T3BjNkdZYmIxRU1JZ1JneE5RcEFPNHVpdnFp?=
 =?utf-8?B?SlVvMlB3Q3MvZWJjMUtBQ0ZwZzhrMVdvMEdHWkFmaUZSamVsNnJHTFFPV1Br?=
 =?utf-8?B?WkhVYWdCTE8vMThPZ3c2RUFNYVNpdnZXcnU2OHh3MlZMVVZ4RDR2VCtNT0kx?=
 =?utf-8?B?OXRhbWo1MkpGR3JybWp5T05mTTRIWU5oN2FHeG4xekhrZUNpeTl5UFNyRHdO?=
 =?utf-8?B?THRzY292KzJPTWU1VE1UTHgrWkkxTmRxbUdvVWJGME5Wbjg1U2M3M0NyY2w4?=
 =?utf-8?B?REVWZUJmbUJtcWcrSEdndFlsV1BXMU82MUt4UTUyR2JwZzJlQi93MzNTNlFl?=
 =?utf-8?B?SmwxSjY5TjVCK0VVdWhzN2FWcXdCdHVyeFY2bWZvUHhMejJjaCt3STl5b2ZN?=
 =?utf-8?Q?aAMMiM?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(10070799003)(1800799024)(38070700021)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SXVuVm15VjVvUjJiSHE3WEM2N3JhQ3BNeXdnWVpRN3hJMnRhd1lZek15Z0xw?=
 =?utf-8?B?N0laZ0htMG5lbUNXaVo0enlPTHZHM2tDRlB5REdWTUZBZi9DODB1U3hQNi9a?=
 =?utf-8?B?M0pmVmd2dmk0WVN6QmxuU3JLL2svOWtYcFFzSDlSRE1KV3E1dkxUMWREdlZO?=
 =?utf-8?B?dkN2QmMxb2R5enZRZTFKY2hyVFlUZ2xyUFUzajZiNzNhVTIrUWJFV2gwS0Jz?=
 =?utf-8?B?OXJ6eGRaUUFOSDRVK1RybEQweGlhSm9VYmVqOUZSUysrRDl2UE9ObmxPaWRD?=
 =?utf-8?B?a2VyN2ZHejV2TmwxdFBMdHh0VlJJdFJQMlFDNVV0ZWxSS2VyWjN1WDJnUEo2?=
 =?utf-8?B?Z2JMYzRkbWo4dmtHL00rZXpQZGViL2tnL0ZRV0pMSjc5a2dWRnQ3UUNTVzhK?=
 =?utf-8?B?WXgwYXBPZTdLcTJ1UWdNaC84WEFsWm5ER3l0RHZFUUg5M0xhcndlT3FXRUJV?=
 =?utf-8?B?eFhwK2tHc3BQMU1UcXVLWk9MWHlIZHlhdEk1OUJMME8wODNnV2RwN2gzVTQr?=
 =?utf-8?B?VURrZGkya2NJUGFQZ3laSFliRHRSeDg4dmtKYStzUkVNbXF6TXhDRTNqcU1j?=
 =?utf-8?B?Zk10NVhaTGtNRnhBcVNiY1RrYWlLd0xlYlRXemllNUI2Q3d0OXN0S3REZ0Nk?=
 =?utf-8?B?a0JJVzR1Q3BDRlhyOHRKcmw2N1poZ1cybGZHZlBkRllsVXkvdXlwMXB0dDlo?=
 =?utf-8?B?eXl3dzlOTkFYY0pMRVpNKzI1eGJEeTZJdk9zQVAxQVBNbEtBVU1RU0JuWHBK?=
 =?utf-8?B?SklLNzNLRXdoanRmNnR1T0o0RWZkUWlyQm1hcUprWnQ5SFpkMzhxdFdQaU1q?=
 =?utf-8?B?c1owekVpU3VINXE5SU9RTzJhVmxOUDdHT0ViNGxlRzRZK1ZrdWpVcVplMjdj?=
 =?utf-8?B?aWJuQjR5aW41Rmd6NkgxUW9RMDZGQXlLeHBXNk1RVjROZDQ3Z0FOdHhsTjNC?=
 =?utf-8?B?YUFhTW9kRGtHK3B6eUcwV1pIRGFpbDhuaDFUc0VGZG9TRXRFbnRXdUlLYm9u?=
 =?utf-8?B?eitDMUFpeGdvdVIyQTFMOTV4WkF0TTMxQUgzdStWL3hLT1NsYXo5ZEpGOFVF?=
 =?utf-8?B?T0tmVHZuN1NTa2dBSFgydUFQZkZKVURibDcyYTFuekRsQ2hSczVXc0hDUDBR?=
 =?utf-8?B?Nm80ek1oVnlhYVdYOE01SkVtWXRjZmJHbkRDT24vaFh3dnlHRmQ0RDA3QlVq?=
 =?utf-8?B?V3dWS1Y4eUJzNEg3NEZ5SHNLVHpWWUFFTGc0dEtGZHV5TWtzRENuVktmd2ZS?=
 =?utf-8?B?T0Iwa0gwMVZPaDRsRFVUVlVvR1RKeHdrZU1abS9IcEg3WUVrOFRwRGpwZi9l?=
 =?utf-8?B?SWF3NEpDa2tYeEE2NXViM3JCT0VFZ2VnOXhROWwxM2hQU3ZPTnhFMlB3ZHU5?=
 =?utf-8?B?cEVNNElWb1M1SEp5eUlObk1IeStrZWUvem5xMDZpKzUxTHVoZVNOdmY3Mk1l?=
 =?utf-8?B?UTdyVnRvcFVxbHhScUw5UUxJY2VNNjVSZ0xBS1BlQkpIemg4Z1BqYlJBMHVv?=
 =?utf-8?B?d0tiTkZjOXVOWEY3aDJ1ME5Ec1ZESlQranVRS0JUWkt5anVKMFZpcnRDREtx?=
 =?utf-8?B?OXB2MjRyRGhZZmpVZjVOVER5RWxwMmpwb3ZIVFRyS2xKYSsrWDNuWWE1cllM?=
 =?utf-8?B?VzJkME5KTWZ2U0h6S2RlUHM5OGdmTU5mYTQ5Z0plYTNzMXpxUHFka2NTZlNT?=
 =?utf-8?B?cCszL2ttTjZhQk5qNkYzUzhwWHJ4MHYrN2czemU4YXRDc0RWNWVVbXpCdzZ3?=
 =?utf-8?B?YkZHT2s4MldYQWFZcVgrcno2S2lwR2FTT3hiUFdhRUV5Qk8zNWhBVGtuZmVX?=
 =?utf-8?B?L2VXSGVzdGt2eDNMMi9Yc2FEODBZaUNxNWh3MTBuNmEwNzVMbGg1NytpWG5s?=
 =?utf-8?B?cmkvWjh4RkNVMzhyR29sQkdFa2dpL2M3eHlxS1NGMU9TQWVUTVZaTHJIYWFl?=
 =?utf-8?B?V2lVZmVuTlhBdnY2ZVZkRlBaZ2FRa0pqcFBvcW1XalJyTjZCSkhDQkZRUzhy?=
 =?utf-8?B?Y1I4UjdxR2p0enI1K1RzbzhndVlpdVlnbHdlcERLL3ZPODVtRjRjaUx4djRB?=
 =?utf-8?B?MUNEaHRRQmNNYWtrdFRwQ1lRUkVkUEtjMzJmR2RCNzNIdGNXV2I0a1lkR3Rw?=
 =?utf-8?B?QkxpTkRuR3BmUFFPemxCYitheFFtKy9TbUFTdjVEU0JEdzljQWcvUFMxR3NR?=
 =?utf-8?B?NURSeEtyYThIeHBoekdUSFpRMG9rdnR0a0ZqNS9NODlKbmt1TVFJMUR0R0pH?=
 =?utf-8?B?bzMwVjBjLzcxOVh4WEFkQnhjbmJ3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f70267a9-5f37-4e48-0839-08de2b3744bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2025 08:55:50.9348 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h8coDp6DMkNda3cT0Wz2nVpZvXspSLM/Akp4Erc2ImF86ABhChTNaI5m5IQF6/Blt1qtMRdIUysQL860Uc0FcZp799ZUTSnmMBaZqZQZD7g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7476
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogRGFuZGFtdWRpLCBQcml5
YW5rYQ0KPiBTZW50OiAyNCBOb3ZlbWJlciAyMDI1IDAxOjQzIFBNDQo+IFRvOiBIYWpkYSwgQW5k
cnplaiA8YW5kcnplai5oYWpkYUBpbnRlbC5jb20+OyBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZw0KPiBDYzogS2FtaWwgS29uaWVjem55IDxrYW1pbC5rb25pZWN6bnlAbGludXguaW50ZWwu
Y29tPjsgTXVuLCBHd2FuLWd5ZW9uZw0KPiA8R3dhbi1neWVvbmcuTXVuQGludGVsLmNvbT47IFBp
b3Jrb3dza2ksIFBpb3RyDQo+IDxQaW90ci5QaW9ya293c2tpQGludGVsLmNvbT47IE1hbnN6ZXdz
a2ksIENocmlzdG9waA0KPiA8Y2hyaXN0b3BoLm1hbnN6ZXdza2lAaW50ZWwuY29tPg0KPiBTdWJq
ZWN0OiBSRTogW1BBVENIIHY1IDIvNV0gbGliL3hlL3hlX3F1ZXJ5OiBpbnRyb2R1Y2UgaGVscGVy
cyBmb3IgZGV2aWNlDQo+IHF1ZXJ5DQo+IA0KPiANCj4gDQo+ID4gLS0tLS1PcmlnaW5hbCBNZXNz
YWdlLS0tLS0NCj4gPiBGcm9tOiBIYWpkYSwgQW5kcnplaiA8YW5kcnplai5oYWpkYUBpbnRlbC5j
b20+DQo+ID4gU2VudDogMjEgTm92ZW1iZXIgMjAyNSAwNDoyOSBQTQ0KPiA+IFRvOiBpZ3QtZGV2
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiA+IENjOiBLYW1pbCBLb25pZWN6bnkgPGthbWlsLmtv
bmllY3pueUBsaW51eC5pbnRlbC5jb20+OyBEYW5kYW11ZGksDQo+ID4gUHJpeWFua2EgPHByaXlh
bmthLmRhbmRhbXVkaUBpbnRlbC5jb20+OyBNdW4sIEd3YW4tZ3llb25nIDxnd2FuLQ0KPiA+IGd5
ZW9uZy5tdW5AaW50ZWwuY29tPjsgUGlvcmtvd3NraSwgUGlvdHIgPHBpb3RyLnBpb3Jrb3dza2lA
aW50ZWwuY29tPjsNCj4gPiBNYW5zemV3c2tpLCBDaHJpc3RvcGggPGNocmlzdG9waC5tYW5zemV3
c2tpQGludGVsLmNvbT47IEhhamRhLCBBbmRyemVqDQo+ID4gPGFuZHJ6ZWouaGFqZGFAaW50ZWwu
Y29tPg0KPiA+IFN1YmplY3Q6IFtQQVRDSCB2NSAyLzVdIGxpYi94ZS94ZV9xdWVyeTogaW50cm9k
dWNlIGhlbHBlcnMgZm9yIGRldmljZQ0KPiA+IHF1ZXJ5DQo+ID4NCj4gPiBIZWxwZXJzIGFic3Ry
YWN0cyBvdXQgY29tbW9uIGJpdHMgb2YNCj4gRFJNX1hFX0RFVklDRV9RVUVSWV9IV0NPTkZJRw0K
PiA+IGlvY3RsOg0KPiA+IC0gcXVlcnkgZGF0YSBzaXplLA0KPiA+IC0gYWxsb2MgbWVtb3J5LA0K
PiA+IC0gZ2V0IGRhdGEsDQo+ID4gLSBlcnJvciBjaGVja3MsDQo+ID4gLSB2YWxncmluZCBhbm5v
dGF0aW9ucy4NCj4gPg0KPiA+IFRoZXJlIGFyZSB0d28gZmxhd29ycywgdG8gZnVsZmlsbCBjdXJy
ZW50IHVzYWdlIHBhdHRlcm5zOg0KPiA+IC0geGVfcXVlcnlfZGV2aWNlX21heV9mYWlsIC0gcmV0
dXJucyBOVUxMIGlmIHF1ZXJ5IGlzIG5vdCBzdXBwb3J0ZWQsDQo+ID4gLSB4ZV9xdWVyeV9kZXZp
Y2UgLSBhc3NlcnRzIG9uIGVycm9yIG90aGVyd2lzZSByZXR1cm5zIHZhbGlkIHBvaW50ZXIuDQo+
ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBBbmRyemVqIEhhamRhIDxhbmRyemVqLmhhamRhQGludGVs
LmNvbT4NCj4gPiAtLS0NCj4gPiAgbGliL3hlL3hlX3F1ZXJ5LmMgfCA0Mw0KPiArKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ID4gIGxpYi94ZS94ZV9xdWVyeS5o
IHwgMjAgKysrKysrKysrKysrKysrKysrKysNCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCA2MyBpbnNl
cnRpb25zKCspDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvbGliL3hlL3hlX3F1ZXJ5LmMgYi9saWIv
eGUveGVfcXVlcnkuYyBpbmRleA0KPiA+DQo+IDUzYWY4NmE5OTM3OGRmZGE2Zjk4OGUwMWE0ZDg0
MmIyNjZlOTRhODAuLmExODViODUyZTE5Yjg3ZTM5M2Y0YmM2DQo+ID4gZWRiZjllMDk1MjQzOWQ1
MTggMTAwNjQ0DQo+ID4gLS0tIGEvbGliL3hlL3hlX3F1ZXJ5LmMNCj4gPiArKysgYi9saWIveGUv
eGVfcXVlcnkuYw0KPiA+IEBAIC0yNSw2ICsyNSw0OSBAQA0KPiA+ICAjaW5jbHVkZSAieGVfcXVl
cnkuaCINCj4gPiAgI2luY2x1ZGUgInhlX2lvY3RsLmgiDQo+ID4NCj4gPiArLyoqDQo+ID4gKyAq
IHhlX3F1ZXJ5X2RldmljZV9tYXlfZmFpbDoNCj4gPiArICogQGZkOiB4ZSBkZXZpY2UgZmQNCj4g
PiArICogQHR5cGU6IHF1ZXJ5IHR5cGUsIG9uZSBvZiBEUk1fWEVfREVWSUNFX1FVRVJZXyogdmFs
dWVzDQo+ID4gKyAqIEBzaXplOiBwb2ludGVyIHRvIGdldCBzaXplIG9mIHJldHVybmVkIGRhdGEs
IGNhbiBiZSBOVUxMDQo+ID4gKyAqDQo+ID4gKyAqIENhbGxzIERSTV9JT0NUTF9YRV9ERVZJQ0Vf
UVVFUlkgaW9jdGwgdG8gcXVlcnkgZGV2aWNlIGluZm9ybWF0aW9uDQo+ID4gKyAqIGFib3V0IHNw
ZWNpZmllZCBAdHlwZS4gUmV0dXJucyBwb2ludGVyIHRvIG1hbGxvYydlZCBkYXRhLCB3aGljaA0K
PiA+ICsgKiBzaG91bGQgYmUgZnJlZWQgbGF0ZXIgYnkgdGhlIHVzZXIuIElmIEBxdWVyeSBpcyBu
b3Qgc3VwcG9ydGVkDQo+ID4gKyAqIGZ1bmN0aW9uIHJldHVybnMgTlVMTC4gT24gYW55IG90aGVy
IGVycm9yIGl0IGFzc2VydHMuDQo+ID4gKyAqLw0KPiA+ICt2b2lkICp4ZV9xdWVyeV9kZXZpY2Vf
bWF5X2ZhaWwoaW50IGZkLCB1aW50MzJfdCB0eXBlLCB1aW50MzJfdCAqc2l6ZSkgew0KPiA+ICsJ
c3RydWN0IGRybV94ZV9kZXZpY2VfcXVlcnkgcXVlcnkgPSB7DQo+ID4gKwkJLmV4dGVuc2lvbnMg
PSAwLA0KPiA+ICsJCS5xdWVyeSA9IHR5cGUsDQo+ID4gKwkJLnNpemUgPSAwLA0KPiA+ICsJCS5k
YXRhID0gMCwNCj4gPiArCX07DQo+ID4gKwl2b2lkICpkYXRhID0gTlVMTDsNCj4gPiArDQo+ID4g
KwkvKiBJbiBjYXNlIG9mIHVuc3VwcG9ydGVkIHF1ZXJ5IHhlIGRyaXZlciB1c3VhbGx5IHJldHVy
bnMgZXJyb3IsDQo+ID4gKwkgKiBidXQgaW4gY2FzZSBvZiBIV0NPTkZJRyBpdCBjYW4gYWxzbyBy
ZXR1cm4gcXVlcnkuc2l6ZSA9PSAwDQo+ID4gKwkgKiBvbiBvbGRlciBwbGF0Zm9ybXMuDQo+ID4g
KwkgKi8NCj4gPiArCWlmIChpZ3RfaW9jdGwoZmQsIERSTV9JT0NUTF9YRV9ERVZJQ0VfUVVFUlks
ICZxdWVyeSkgfHwNCj4gPiAhcXVlcnkuc2l6ZSkNCj4gPiArCQlnb3RvIHNraXBfcXVlcnk7DQo+
IA0KPiBJZiBpb2N0bCBmYWlscyB3aXRoIHNheSBuZWdhdGl2ZSB2YWx1ZSAtMjIgaWYgY29uZGl0
aW9uIGlzIG1ldCBhbmQgZ29lcyB0byBza2lwDQo+IGNvbmRpdGlvbiwgSSB0aGluayB0aGF0J3Mg
bm90IGV4cGVjdGVkIHJpZ2h0Pw0KPiBpZiAoaWd0X2lvY3RsKGZkLCBEUk1fSU9DVExfWEVfREVW
SUNFX1FVRVJZLCAmcXVlcnkpID09IDAgJiYgIXF1ZXJ5LnNpemUpDQo+IGlzIGl0IG5vdCB0aGlz
IHdlIHdhbnQ/DQpPayBnb3QgdGhlIGxvZ2ljIHlvdSB3YW50IGl0IHRvIG1ha2UgaXQgd29yayBm
b3Igb2EgYW5kIGV1IGZvciBvbGRlciBwbGF0Zm9ybXMgYXMgd2VsbCwgDQpXaHkgY2FudCB3ZSBk
byB0aGF0IGNoZWNrIGZvciB0aGF0IHNwZWNpZmljIHR5cGVzIGluc3RlYWQgb2YgdGhpcyBjb25m
dXNpb24gYW5kIHVzZSBvbmx5IG9uZSBmdW5jdGlvbiBpbnN0ZWFkIG9mIHR3byBmdW5jdGlvbnMu
DQo+ID4gKw0KPiA+ICsJZGF0YSA9IG1hbGxvYyhxdWVyeS5zaXplKTsNCj4gPiArCWlndF9hc3Nl
cnQoZGF0YSk7DQo+ID4gKw0KPiA+ICsJcXVlcnkuZGF0YSA9IHRvX3VzZXJfcG9pbnRlcihkYXRh
KTsNCj4gPiArCWlndF9hc3NlcnRfZXEoaWd0X2lvY3RsKGZkLCBEUk1fSU9DVExfWEVfREVWSUNF
X1FVRVJZLCAmcXVlcnkpLA0KPiA+IDApOw0KPiA+ICsNCj4gPiArCVZHKFZBTEdSSU5EX01BS0Vf
TUVNX0RFRklORUQoZGF0YSwgcXVlcnkuc2l6ZSkpOw0KPiA+ICsNCj4gPiArc2tpcF9xdWVyeToN
Cj4gPiArCWlmIChzaXplKQ0KPiA+ICsJCSpzaXplID0gcXVlcnkuc2l6ZTsNCj4gPiArDQo+ID4g
KwlyZXR1cm4gZGF0YTsNCj4gPiArfQ0KPiA+ICsNCj4gPiAgc3RhdGljIHN0cnVjdCBkcm1feGVf
cXVlcnlfY29uZmlnICp4ZV9xdWVyeV9jb25maWdfbmV3KGludCBmZCkgIHsNCj4gPiAgCXN0cnVj
dCBkcm1feGVfcXVlcnlfY29uZmlnICpjb25maWc7DQo+ID4gZGlmZiAtLWdpdCBhL2xpYi94ZS94
ZV9xdWVyeS5oIGIvbGliL3hlL3hlX3F1ZXJ5LmggaW5kZXgNCj4gPg0KPiA2YTk3ZDM4NGEzNjQ5
NzllMWEzZmE0ZTA3ODUzOTcyMzYwNjhkMGZjLi4xNWQ1YzI2YmFmNWJlNmUxMDc0OTUyNA0KPiA+
IDdjYTFhYWVmZWE1NTFkODIxIDEwMDY0NA0KPiA+IC0tLSBhL2xpYi94ZS94ZV9xdWVyeS5oDQo+
ID4gKysrIGIvbGliL3hlL3hlX3F1ZXJ5LmgNCj4gPiBAQCAtMTQzLDkgKzE0MywyOSBAQCB1aW50
MTZfdCB4ZV9ndF9nZXRfdGlsZV9pZChpbnQgZmQsIGludCBndCk7DQo+ID4gdWludDE2X3QgeGVf
dGlsZV9nZXRfbWFpbl9ndF9pZChpbnQgZmQsIHVpbnQ4X3QgdGlsZSk7ICB1aW50MzJfdA0KPiA+
ICp4ZV9od2NvbmZpZ19sb29rdXBfdmFsdWUoaW50IGZkLCBlbnVtIGludGVsX2h3Y29uZmlnIGF0
dHJpYnV0ZSwNCj4gPiB1aW50MzJfdCAqbGVuKTsgIHVpbnQzMl90IHhlX2h3Y29uZmlnX2xvb2t1
cF92YWx1ZV91MzIoaW50IGZkLCBlbnVtDQo+ID4gaW50ZWxfaHdjb25maWcgYXR0cmlidXRlKTsN
Cj4gPiArdm9pZCAqeGVfcXVlcnlfZGV2aWNlX21heV9mYWlsKGludCBmZCwgdWludDMyX3QgdHlw
ZSwgdWludDMyX3QNCj4gPiArKnNpemUpOw0KPiA+ICBpbnQgeGVfcXVlcnlfcHhwX3N0YXR1cyhp
bnQgZmQpOw0KPiA+ICBpbnQgeGVfd2FpdF9mb3JfcHhwX2luaXQoaW50IGZkKTsNCj4gPg0KPiA+
ICsvKioNCj4gPiArICogeGVfcXVlcnlfZGV2aWNlOg0KPiA+ICsgKiBAZmQ6IHhlIGRldmljZSBm
ZA0KPiA+ICsgKiBAdHlwZTogcXVlcnkgdHlwZSwgb25lIG9mIERSTV9YRV9ERVZJQ0VfUVVFUllf
KiB2YWx1ZXMNCj4gPiArICogQHNpemU6IHBvaW50ZXIgdG8gZ2V0IHNpemUgb2YgcmV0dXJuZWQg
ZGF0YSwgY2FuIGJlIE5VTEwNCj4gPiArICoNCj4gPiArICogQ2FsbHMgRFJNX0lPQ1RMX1hFX0RF
VklDRV9RVUVSWSBpb2N0bCB0byBxdWVyeSBkZXZpY2UgaW5mb3JtYXRpb24NCj4gPiArICogYWJv
dXQgc3BlY2lmaWVkIEB0eXBlLiBSZXR1cm5zIHBvaW50ZXIgdG8gbWFsbG9jJ2VkIGRhdGEsIHdo
aWNoDQo+ID4gKyAqIHNob3VsZCBiZSBmcmVlZCBsYXRlciBieSB0aGUgdXNlci4gSWYgQHF1ZXJ5
IGlzIG5vdCBzdXBwb3J0ZWQNCj4gPiArICogb3Igb24gYW55IG90aGVyIGVycm9yIGl0IGFzc2Vy
dHMuDQo+ID4gKyAqLw0KPiA+ICtzdGF0aWMgaW5saW5lIHZvaWQgKnhlX3F1ZXJ5X2RldmljZShp
bnQgZmQsIHVpbnQzMl90IHR5cGUsIHVpbnQzMl90DQo+ID4gKypzaXplKSB7DQo+ID4gKwl2b2lk
ICpkYXRhID0geGVfcXVlcnlfZGV2aWNlX21heV9mYWlsKGZkLCB0eXBlLCBzaXplKTsNCj4gPiAr
DQo+ID4gKwlpZ3RfYXNzZXJ0KGRhdGEpOw0KPiA+ICsJcmV0dXJuIGRhdGE7DQo+ID4gK30NCj4g
PiArDQo+ID4gIHN0cnVjdCB4ZV9kZXZpY2UgKnhlX2RldmljZV9nZXQoaW50IGZkKTsgIHZvaWQg
eGVfZGV2aWNlX3B1dChpbnQgZmQpOw0KPiA+DQo+ID4NCj4gPiAtLQ0KPiA+IDIuNDMuMA0KDQo=
