Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91B8CCF6497
	for <igt-dev@archiver.kernel.org>; Mon, 30 Sep 2024 10:18:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30D3B10E3E5;
	Mon, 30 Sep 2024 10:18:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BoQQUQH/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D0D610E3E5
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Sep 2024 10:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727691534; x=1759227534;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WLOfjzLt952yih5jd4WkPJ9njMRkf9slfVw6iq2YExI=;
 b=BoQQUQH/2Xy+bm+on4FcH0dwL9dk+4eC3YHgiqfCvlF0NKVi4/Cw0xP7
 DOd5guPRrsrmk+/eVZccw5A5XOn0s8DSPlu1y3b5I6NSy9rNBpyFk6JdT
 VBOQVrA5tTsyHD1zxKuiDfJefyXy0imPXVdlgi6MwX+DJ8U3nmg7bibhl
 nVCm6ne2SKk1+l7oPlhsJRX9EQGVur4RgF2o8ynqRXU792cCQHrHqNWGI
 dSppL3ZrP8ZaOiYwdYQVUGtMQxXcZjOdyxpw+Go8Y4ltNNUkJ4SLBr615
 WPeXqQGsIRND9QdUIJqCEJruTqgSjpt5v8OLYLiyau+IiCMklbZJ4alo0 w==;
X-CSE-ConnectionGUID: RHG7P3Y5RVKcfccM3dpgRA==
X-CSE-MsgGUID: 9HJ4acP3QrOumnpaBUdxcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="26657321"
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; d="scan'208";a="26657321"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 03:18:53 -0700
X-CSE-ConnectionGUID: w4XO26gZRZ2fsYq5cy/NGA==
X-CSE-MsgGUID: 1SpH7+k3SnC2+SZmtybCZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; d="scan'208";a="77337082"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Sep 2024 03:18:52 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 30 Sep 2024 03:18:52 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 30 Sep 2024 03:18:51 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 30 Sep 2024 03:18:51 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 30 Sep 2024 03:18:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kR2KbHqSNJJsDGX7RSPGHeHQd2msfP6QuzD4j95catp8wQ18Y9JiWYFHGcQPKnPignySgANsQcyJJ7uM4m2+wBYh3sXmqe0zYOSBpfm13n150Vr9LOdP+C5iOO4U1XJ5uIO8pOzccjh1USQyqSXqk0x06yr/Zn2uNf7/xALql4Lcajyc9LaWZFmm6+tDhcWoKssHrq5tgS1le6/HKjTbGiIDfFiCvnmaQzpNnmMC6x+z/KASqey7NoLzqXRVkf0L5pn7NohGFBbLev7gaiyu7XNPfQf/MVMpvPXnNm/A6rU0UKNJxomfXtQMyTiILLWmFfX+MFrTSMnhpnT3jtPlOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WLOfjzLt952yih5jd4WkPJ9njMRkf9slfVw6iq2YExI=;
 b=UKXwlQv9lgwaCBe1idQa/u3R2zU1hmzeK5nsry6p6EuFmszW2PK2nwvXCqQQ4BOol64AU6kIBMsEZLwlnlmnwS/LqQCLTtq2nHTkHGtQjAqbsQDmR1vP58JAvCQ0vQ7BE4JPGHlxJd33ZD6NtDcZHx64Z7i0P6dQDTtwPn1LHd4B35BurQI7lV/HS8z3NPIbIu6hlvVPv6LRmI2fGog6/DBmW3fAXqkv8Q7b8QgwKBhXahj5Ld1y4t/eLSpHixHIXeJH/DZMwrcw2olM32XyMYthFWH6nBTEPDGJb8sN804I6YJ44Pf4n35G3zMB5I7fAlPTRFSa0OkbU+yoYwWD4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5293.namprd11.prod.outlook.com (2603:10b6:5:390::20)
 by BY1PR11MB8126.namprd11.prod.outlook.com (2603:10b6:a03:52e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26; Mon, 30 Sep
 2024 10:18:49 +0000
Received: from DM4PR11MB5293.namprd11.prod.outlook.com
 ([fe80::e1f5:3b23:9560:2dc2]) by DM4PR11MB5293.namprd11.prod.outlook.com
 ([fe80::e1f5:3b23:9560:2dc2%3]) with mapi id 15.20.8005.026; Mon, 30 Sep 2024
 10:18:49 +0000
From: "Bommu, Krishnaiah" <krishnaiah.bommu@intel.com>
To: "Auld, Matthew" <matthew.auld@intel.com>, "Bernatowicz, Marcin"
 <marcin.bernatowicz@linux.intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Summers, Stuart" <stuart.summers@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel/xe_exec_reset: Skip syncobj_wait during
 the gt_reset
Thread-Topic: [PATCH i-g-t] tests/intel/xe_exec_reset: Skip syncobj_wait
 during the gt_reset
Thread-Index: AQHbDzfy6+8OgO6mh0OcxOR+N0sl97JrazKAgAAEpoCABLUm8A==
Date: Mon, 30 Sep 2024 10:18:49 +0000
Message-ID: <DM4PR11MB52932237D9C02F73FCD9CD6A9D762@DM4PR11MB5293.namprd11.prod.outlook.com>
References: <20240925103141.3442-1-krishnaiah.bommu@intel.com>
 <05ef47a7-663a-4fc4-a069-0c3f3f4c385b@linux.intel.com>
 <53783573-6681-49ec-b400-cb85dfedcf8f@intel.com>
In-Reply-To: <53783573-6681-49ec-b400-cb85dfedcf8f@intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5293:EE_|BY1PR11MB8126:EE_
x-ms-office365-filtering-correlation-id: 7b9fbcbc-c371-45ad-3197-08dce13946a4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?QWlWem9kMmFDUDdRNXpuS2duMlJsakhYM3dUSkMvaDk1MnVweURWNUVNRVE0?=
 =?utf-8?B?aHo2UmpTWTVoN0M5d082T1RmTzBTbnJycnlQc0tVOHJ2YTl4c2I1dWNWKzRJ?=
 =?utf-8?B?Q01TYzNPNFYzU0tuanJNSEpKZmZNT21DQVRyVWZQckRrd0Nlcjk4aEc0Y29l?=
 =?utf-8?B?UlRobWZhcjJOdEVDOUwvWGlMSHh3dzJWbG1zclFNOWZ2d2d3ellnelRZaXFX?=
 =?utf-8?B?bkJxNFBVTTFIRHdFQm9tdkZHQzUzUXVnTVFqVStKakx3L0RvcXp3NGFMUndP?=
 =?utf-8?B?ZzdUZlhLZm8wNTE0Mi80MmNLSDRDbHhnbkE0R1Q2ZkoxOWROWERqV3lybnNj?=
 =?utf-8?B?bHpiaEppeTA4SVhFWkdsR0FkRTBVdXNIcEFjcm9Sdks4NG53WWU4V0NVbjJj?=
 =?utf-8?B?UXVMOEdTLzVYb1ByOWlRbmUwTE5RREVOUnF6MzBjOU1Ha1I5UWNPYW9QQmoz?=
 =?utf-8?B?OFhadzBwZTRneTl5NmtoV3UzeFNIRktZK2NiZmxNdHl5WGVWcklaNUZBQzlT?=
 =?utf-8?B?SjdhYUFwNWZpMjl4aWV3NkJKMGdRRWovakFob2FnRHBXUUM3YWR0eTlNNEgz?=
 =?utf-8?B?TWMxa1NnU1lwejEweldocnRHaGFFYng0SHg2TXFaTGNzZGZDVG1RMGZFdWZs?=
 =?utf-8?B?ODRVNEpXOUFGcFlIT04vNGF3ZzZMdTFJK2xWeXcrdUY1V3J1RjV3dHBPQm93?=
 =?utf-8?B?TTVqd3RKdURDMlNzbHBMbXhBd1JiS0Y5bU4yVXlkMnRRYzgxN255cTdnWk1w?=
 =?utf-8?B?R3dzbDl4bi84VXRWMm9HV1dDS2c5S0x6NVdhTjBDLzJHVkxtRjV2NkJKODRZ?=
 =?utf-8?B?Qmw3dVIrSFhGVmVrdVpWK0Fac2ViK3JVcXVTeDJHdWt2U3JreExUOEVsejBw?=
 =?utf-8?B?WGIvMWRBSUNEUUliNllsaEh3eDAwejBONXl1VDE1SDBOcVZIdW82eWU4YUNC?=
 =?utf-8?B?OWk5U28rQ055aGl4cHVseWdqTkM4VEtyZjFOTnAvYjJ4OUxSRHRaOU9PcUwz?=
 =?utf-8?B?QnJvYTNDV05JbTVWRzhxRXVuOEhpSDl0eEFhLzFTN2JDM1RDS3AwWlpuTVF2?=
 =?utf-8?B?YVpTWUhjQTErSmNjZFFLRWVVR0FXMGtxZVJCRmpvYkRQbDFiSjVMS2hFZVUw?=
 =?utf-8?B?MEUva0ltS1Z3Q05PUnpzTExyQmJPOUM4V2JJMDJLSFE2YmlqQ0FLYjlWZjFr?=
 =?utf-8?B?L3NYZ05Oa1F2UDUrSmQweUpyVHFlY0hDQlNQcUZaUncyRXN6cHhwYzdEL0V0?=
 =?utf-8?B?T1Zmd3pFZUYwY2FJN3FVNGNnbUhIWm5iZGUwWHI3TllqSXBCZ1FMYzB4WUxB?=
 =?utf-8?B?MXRPLytXRzk0OGtlcFU2b3VUOFc1OVRFbXBndit1akNjOE53UnlIWjVZV3Vt?=
 =?utf-8?B?WXN2TnVUQ2w1ay96SWkzdVdRcGxDS1oyb3FDZ1BCaGVBN2VGK1lRYUxYVExI?=
 =?utf-8?B?cGdnbUxWKzFpd2o0ZVo4OWF2Z2UySUllQ1paTUVJQ1huUVVzMkdVN3d1NHB0?=
 =?utf-8?B?bzNWODB3THl5MnZUNTBIdFdIT1ZmSkEvaXlMRUp5cGtpczJsaVEyL2NjQnJK?=
 =?utf-8?B?MjJtZ2JwQzE5SFQ3czFKMFVUTldlbHdOQldocmdUMWZkMHg5TitudWVPdFNW?=
 =?utf-8?B?cUlUR09BRFR5Qm5aUmkwalJKY1hoaDh4VkYwQUI2dTZqdnBoNCtmOUN4OVBh?=
 =?utf-8?B?bFJwTFl3eHAwb2U5TThCaG5mcUM0YUFObUwvNHZMRG9SSCtZR2FYQVdRPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5293.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RVIvVlpZc3hJWEw2Z3hJSEdORUs0bGt3Q25rck01T280MGtXK2F0TnRpN3Y0?=
 =?utf-8?B?ZHZteWVPc2hPVU9iaTB3ZkRFanF4aXB5ZXlkYThZc3RUQVdMUmVybUhRWFJo?=
 =?utf-8?B?T0UyT3JITTJmMEVzWlZCNjdKMEZ0Q2ZzQW9hWlY1Q2t3SmZ3WnhxVkhPYXdC?=
 =?utf-8?B?cy90UFdnZkJBUFNGUk9JN3FUNm1FbCt5Y3ZpK3hKWnNhQndzU1AzUXJzUUxu?=
 =?utf-8?B?MEZuUndHdE9SUUpvUzNhWUJ4amlaUlhvOFpzYXIwQ1NBQzFsT1pORDJKdE9w?=
 =?utf-8?B?OTJIbTVGVk5rbzc5b0ZodlVrcEJWZm8vaEhVSmtUWW1RTFVQemw3WjVGR3Qw?=
 =?utf-8?B?clhQTVorREJBYWpzWDMzVkZERXBsSTl5d3JzV0tSTTdRaHlIWi9yMDlRT2Ni?=
 =?utf-8?B?RTJiU3MvNGlrWFJuY3ZReUd2SlRUS3k1NkdXRUlSSUJhTWRlUm1tbENlMEln?=
 =?utf-8?B?QjJyZnpBSzllbmJDS2pVa1l4VXFEelc1aUUrMUtyaE9wVWxBRk9NRDZhdmtk?=
 =?utf-8?B?NG4xcDdOQUhQS2RxeHJuNEZQQlpncFgyMk01V0huTXVrU2VQTE9MWVdLYmFu?=
 =?utf-8?B?TTcrOVFoL3BMcHpReEpBcnptMFpuc2MwOFZMWkY5WXJKbzNiUTdFMGJhSFpa?=
 =?utf-8?B?UndTd3RhbXNLUGRVcU54UDRhM0ZWQkgyR1hMWG54K0E1OW9VTzhUam92Qnlu?=
 =?utf-8?B?a01uakZwUkRhYnUrN2Nzd3laUXdmWmt5dHZZdERPY05EbjlhTGx4WXVxMWV1?=
 =?utf-8?B?Qy93dWlLOG8xTUhUM2RWanpMdEtFQ1BKWVlscWxIY1BIdkIrUHN1L0NOcjVP?=
 =?utf-8?B?OVdhOGJYNnZZQnRrOWhxWmh4NkgxNVFuY2xnRW9HTm9FcVk0L2s0S3JxQmFN?=
 =?utf-8?B?T01jMW1TVzR1WjdCd1Y5MGJmaTB0VEhTaUI4WHZRaWVRNmFGTzA1WUlFT3cy?=
 =?utf-8?B?cFptTjFEYTVrRmIzT2s5ZVRhUk9yZFN4SzQ0OGlpbUlSR3VPZHVtank5UGky?=
 =?utf-8?B?ZGtjdFQrNHdGZXJVN3hxeWtzOXNKWmtMLzFtbThWRTNuRTlvMXROU0FyVGcr?=
 =?utf-8?B?T0FQNWhTR2J0U3FPNG0yL0tqbmV6R0ZuTEw5cmkvQVVSYnY0ZHJqY2ZwTXE5?=
 =?utf-8?B?ZlBIaEZkRXhncm83WWRxWUlXL3ZEMlRTamdyWkFURWp0TTAxYW9iT211Y0Q0?=
 =?utf-8?B?SXhOeFlicFRZSU52cms3aVQ0UXBla3dYeDdLMGlzczVqci9EaHdUM0c4K1JT?=
 =?utf-8?B?c2ZETHJFc3VOYVF2cnVkNW0zdnpNdy9KTGRUNVllY2gycDVHdHltOUN4NmFa?=
 =?utf-8?B?T0RvanVRYnB6cGpDSUJvT3dETHBPbU00aitxTzVJeFE3SUNiTk44clBiVmwz?=
 =?utf-8?B?QWpXSkx3Y2NuQThmQlhyZGdsajNEeFhSK3g3ZnhLVTlwWE9GcWJrRWtraTBp?=
 =?utf-8?B?ZGRHSDdYMFNqSXZqUE1RMUpvWlIzNWFqNE4rMG9XL3R5a2lUSzVuTnlwYlBw?=
 =?utf-8?B?NXVJdjhadTN5eGk2bU1JVFBFRzEwc2hUZThhZzA5YlE3ckdON1hyM3hJV2lT?=
 =?utf-8?B?RjFqcHFJZWFGaS9FVW5Md2tVbnlmcVZRTlNvWWEvNHJ2QytNelB2NEM4Z256?=
 =?utf-8?B?WGlYYW9UWWE3a1RKNzc2cUZCRy9nZzFwR3BocDNPRnVYSjA0QUM4SEoyemVR?=
 =?utf-8?B?dy9haDIrYjZhU1hOS05VbTFvZWEyY3RNSDdWRUc5OWczeU5yZzdpcDl1UEJL?=
 =?utf-8?B?MzNLQmdxWGh3clZrM3Bqd2RlSW41SldoczQ0aXMvbG9mNmRJSlRJYnFQamR4?=
 =?utf-8?B?T2dEVkp3QW1hQ3ZUak1LMTNWNEh3cnpIUXJTWkdWb1BTVVc3NHIwdWVmbTRm?=
 =?utf-8?B?cTJJdTlURit3Qm9Bd3ZHVFRyTnFEU215RDFpRTdxeHJXRXAwQ1ZVcnFiNXJI?=
 =?utf-8?B?d0l1SXkvTGVzN1VBRDVRQnN4WWF4TUtsRXBrU290clVkOVBNS1g5Yjd6dXRh?=
 =?utf-8?B?T2R6NWFEVmV4cDg1blJHc29tMFQxcXczVDQrT3E4bmpvZS9nTmpVbm1ERmsz?=
 =?utf-8?B?OTllNUM4S0ZxZ2tkQStjSklHODNvZzBYVzM5S2lRRzQ5a0pPRE9Sejd2Qndp?=
 =?utf-8?B?azQ0czhDQ1dFNEx0WUhQSzhveGlaQVpaQisrZXhwd0Foekw0TW9YQWxHU3d2?=
 =?utf-8?B?M2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5293.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b9fbcbc-c371-45ad-3197-08dce13946a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2024 10:18:49.4231 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AiYlKg8sEAtgdlOTLLddRv8+RC33HKsrU2MgLK2Yu7F4pW1MMSkwczZREEeRYAY0mlcWdVj4R2Ss41Fx4LJoyVBbPLoWpIuJiGQHNpotiIs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8126
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQXVsZCwgTWF0dGhldyA8
bWF0dGhldy5hdWxkQGludGVsLmNvbT4NCj4gU2VudDogRnJpZGF5LCBTZXB0ZW1iZXIgMjcsIDIw
MjQgMzo1MiBQTQ0KPiBUbzogQmVybmF0b3dpY3osIE1hcmNpbiA8bWFyY2luLmJlcm5hdG93aWN6
QGxpbnV4LmludGVsLmNvbT47IEJvbW11LA0KPiBLcmlzaG5haWFoIDxrcmlzaG5haWFoLmJvbW11
QGludGVsLmNvbT47IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBTdW1tZXJz
LCBTdHVhcnQgPHN0dWFydC5zdW1tZXJzQGludGVsLmNvbT47IEJyb3N0LCBNYXR0aGV3DQo+IDxt
YXR0aGV3LmJyb3N0QGludGVsLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCBpLWctdF0gdGVz
dHMvaW50ZWwveGVfZXhlY19yZXNldDogU2tpcCBzeW5jb2JqX3dhaXQgZHVyaW5nDQo+IHRoZSBn
dF9yZXNldA0KPiANCj4gT24gMjcvMDkvMjAyNCAxMTowNSwgQmVybmF0b3dpY3osIE1hcmNpbiB3
cm90ZToNCj4gPg0KPiA+DQo+ID4gT24gOS8yNS8yMDI0IDEyOjMxIFBNLCBCb21tdSBLcmlzaG5h
aWFoIHdyb3RlOg0KPiA+PiBGcm9tOiAiQm9tbXUgS3Jpc2huYWlhaCIgPGtyaXNobmFpYWguYm9t
bXVAaW50ZWwuY29tPg0KPiA+Pg0KPiA+PiBTa2lwcGluZyB0aGUgc3luY29ial93YWl0IGZvciB0
aGUgd29ya2xvYWRzIHdoaWNoIGlzIHN1Ym1pdHRlZCBiZWZvcmUNCj4gPj4gZ3QgcmVzZXQsIHNp
bmNlIEFmdGVyIGd0IHJlc2V0IFRoZXJlIGlzIG5vIGV4cGVjdGF0aW9uIGZyb20gdGhlDQo+ID4+
IGhhcmR3YXJlL0d1Qy9LTUQgdGhhdCB0aGUgd29ya2xvYWQgd2lsbCB0aGVuIHJlLWV4ZWN1dGUg
YW5kIGNvbXBsZXRlLg0KPiA+Pg0KPiA+PiBTaWduZWQtb2ZmLWJ5OiBCb21tdSBLcmlzaG5haWFo
IDxrcmlzaG5haWFoLmJvbW11QGludGVsLmNvbT4NCj4gPj4gQ2M6IFN0dWFydCBTdW1tZXJzIDxz
dHVhcnQuc3VtbWVyc0BpbnRlbC5jb20+DQo+ID4+IC0tLQ0KPiA+PiDCoCB0ZXN0cy9pbnRlbC94
ZV9leGVjX3Jlc2V0LmMgfCA4ICsrKysrLS0tDQo+ID4+IMKgIDEgZmlsZSBjaGFuZ2VkLCA1IGlu
c2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+ID4+DQo+ID4+IGRpZmYgLS1naXQgYS90ZXN0
cy9pbnRlbC94ZV9leGVjX3Jlc2V0LmMNCj4gPj4gYi90ZXN0cy9pbnRlbC94ZV9leGVjX3Jlc2V0
LmMgaW5kZXggYjVkNWY0M2VhLi5iMWE3NTQ4YzYgMTAwNjQ0DQo+ID4+IC0tLSBhL3Rlc3RzL2lu
dGVsL3hlX2V4ZWNfcmVzZXQuYw0KPiA+PiArKysgYi90ZXN0cy9pbnRlbC94ZV9leGVjX3Jlc2V0
LmMNCj4gPj4gQEAgLTI2Myw4ICsyNjMsOSBAQCB0ZXN0X2JhbGFuY2VyKGludCBmZCwgaW50IGd0
LCBpbnQgY2xhc3MsIGludA0KPiA+PiBuX2V4ZWNfcXVldWVzLCBpbnQgbl9leGVjcywNCj4gPj4g
wqDCoMKgwqDCoCB9DQo+ID4+IMKgwqDCoMKgwqAgZm9yIChpID0gMDsgaSA8IG5fZXhlY19xdWV1
ZXMgJiYgbl9leGVjczsgaSsrKQ0KPiA+PiAtwqDCoMKgwqDCoMKgwqAgaWd0X2Fzc2VydChzeW5j
b2JqX3dhaXQoZmQsICZzeW5jb2Jqc1tpXSwgMSwgSU5UNjRfTUFYLCAwLA0KPiA+PiAtwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgTlVMTCkpOw0KPiA+PiArwqDCoMKgwqDC
oMKgwqAgaWYgKCEoZmxhZ3MgJiBHVF9SRVNFVCkpDQo+ID4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGlndF9hc3NlcnQoc3luY29ial93YWl0KGZkLCAmc3luY29ianNbaV0sIDEsIElOVDY0X01B
WCwNCj4gPg0KPiA+IFdoYXQgaGFwcGVucyB3aGVuIHRoZSB1c2VyIHdhaXRzIG9uIHN5bmNvYmog
aW4gY2FzZSBvZiBHVCByZXNldCA/DQo+ID4gTWF5YmUgdGhlcmUgaXMgbm8gZXhwZWN0YXRpb24g
dGhhdCB0aGVyZSB3aWxsIGJlIHJlLWV4ZWN1dGUsIGJ1dA0KPiA+IHNob3VsZG4ndCB0aGUgc3lu
Y29iaiBiZSBub3RpZmllZCBvciBhIHRpbWVvdXQgaGl0ID8NCj4gDQo+IFllYWgsIHRoaXMgc291
bmRzIGxpa2UgS01EIGJ1Zy4gRXhwZWN0YXRpb24gaXMgdGhhdCBkbWEgZmVuY2VzIHNob3VsZA0K
PiBldmVudHVhbGx5IHNpZ25hbCBubyBtYXR0ZXIgd2hhdCwgYW5kIGluIGEgcmVhc29uYWJsZSBh
bW91bnQgb2YgdGltZS4NCj4gDQo+IFBvc3NpYmx5IHJlbGV2YW50IGZpeCAodmVyeSByZWNlbnRs
eSBtZXJnZWQpOg0KPiBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gvNjA1
NjgxLz9zZXJpZXM9MTM2NDYzJnJldj0xDQoNCkkgdmVyaWZpZWQgd2l0aCB0aGlzKGh0dHBzOi8v
cGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC82MDU2ODEvP3Nlcmllcz0xMzY0NjMmcmV2
PTEpIHBhdGNoLCBzdGlsbCBJIHNlZSB0aGUgZmFpbHVyZSB3aXRoIHRoaXMgcGF0Y2ggYWxzby4N
Cg0KUmVnYXJkcywNCktyaXNobmEuDQoNCj4gDQo+ID4NCj4gPj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMCwgTlVMTCkpOw0KPiA+PiDCoMKgwqDCoMKg
IGlndF9hc3NlcnQoc3luY29ial93YWl0KGZkLCAmc3luY1swXS5oYW5kbGUsIDEsIElOVDY0X01B
WCwgMCwNCj4gPj4gTlVMTCkpOw0KPiA+PiDCoMKgwqDCoMKgIHN5bmNbMF0uZmxhZ3MgfD0gRFJN
X1hFX1NZTkNfRkxBR19TSUdOQUw7IEBAIC00MTAsNyArNDExLDggQEANCj4gPj4gdGVzdF9sZWdh
Y3lfbW9kZShpbnQgZmQsIHN0cnVjdCBkcm1feGVfZW5naW5lX2NsYXNzX2luc3RhbmNlICplY2ks
DQo+ID4+IMKgwqDCoMKgwqAgfQ0KPiA+PiDCoMKgwqDCoMKgIGZvciAoaSA9IDA7IGkgPCBuX2V4
ZWNfcXVldWVzICYmIG5fZXhlY3M7IGkrKykNCj4gPj4gLcKgwqDCoMKgwqDCoMKgIGlndF9hc3Nl
cnQoc3luY29ial93YWl0KGZkLCAmc3luY29ianNbaV0sIDEsIElOVDY0X01BWCwgMCwNCj4gPj4g
K8KgwqDCoMKgwqDCoMKgIGlmICghKGZsYWdzICYgR1RfUkVTRVQpKQ0KPiA+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBpZ3RfYXNzZXJ0KHN5bmNvYmpfd2FpdChmZCwgJnN5bmNvYmpzW2ldLCAx
LCBJTlQ2NF9NQVgsDQo+ID4+ICswLA0KPiA+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgTlVMTCkpOw0KPiA+PiDCoMKgwqDCoMKgIGlndF9hc3NlcnQoc3luY29i
al93YWl0KGZkLCAmc3luY1swXS5oYW5kbGUsIDEsIElOVDY0X01BWCwgMCwNCj4gPj4gTlVMTCkp
Ow0KPiA+DQo=
