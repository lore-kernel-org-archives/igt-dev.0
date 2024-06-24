Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A083C2BD05
	for <igt-dev@archiver.kernel.org>; Mon, 24 Jun 2024 11:10:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3D8810E3F0;
	Mon, 24 Jun 2024 11:10:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hLFDb9PL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5033610E3EF
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Jun 2024 11:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719227414; x=1750763414;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=7bJfx05zgCNTQNmWE4qDULhqxTOXG29WfyhPZepiPTo=;
 b=hLFDb9PLK7Ko20rHjlC6mZqg2Xne6dZ6BpSY4Mf2EdVkBK7mVCweGRrC
 Nm7oNZpVKHkwxfkuDNy31CLyp4h7FwLYotu1UGVJ6cpPPTIjxJyZRLdnP
 Ah1HhECHArZk07uxUwUFTf+05gQmCS61gjwawu+sgcl3DHYx8kUhaHePU
 QEf3RSzO7uA7ZN5G/acraQO+j45fuDaMazW3OQkCwkxB8dr12OA0fq51m
 Ka+TVa8xn+4IubcZ3l3LEVNx3Ve7cgs47/t/i/jsPOCiyNekUGh8pZBI/
 eS0gAlOHnPVEe9xkruc9xGqPKerMQV/wQ3A28OQ6UpiDDdCf5KQPoopy1 A==;
X-CSE-ConnectionGUID: 41R/eLsCTx6pUhhoU9w5Bw==
X-CSE-MsgGUID: z8HBoIzUSMmkj0pCCRefIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11112"; a="16321679"
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; d="scan'208";a="16321679"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 04:10:10 -0700
X-CSE-ConnectionGUID: M//oCWQsTKCH7xvkkD8spg==
X-CSE-MsgGUID: uMCP1D2DTfaC/Cbuv2l1pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; d="scan'208";a="74018199"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Jun 2024 04:10:10 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 24 Jun 2024 04:10:08 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 24 Jun 2024 04:10:08 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 24 Jun 2024 04:10:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n6cIyCbNpzWL6/XUIAznx9lhcc3PxKxmBg0r4aE/2GNtUqzqcfE/WozmmiLEzFphXhqoibgBMVJSd/mAp3H++kWFy4w5RlyO4u7ROz6Y/P8qlkTK+EvBsJT3Ame8FaWnye4R8GncWfJusGgU7WslVQIyA716XfsQuBDt5rUg/4ZA1fjN5HjQy7PMdNBkw/1exN4SBaJoRGqhFYv9lWQeDMyfclhvJGg6UYPp9MPvIgIZXtO70i6L+xCbANPuyvBXUl+duQDYFcoocgB0DtCbcMkYpQhbcSvLB9/BJoXG8Jf/sj+beYeFKw+w/Gw3p2WOX+qve/gZf6D4NmiWZHeaIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7bJfx05zgCNTQNmWE4qDULhqxTOXG29WfyhPZepiPTo=;
 b=T0KE1LDTLwQAiUHNef6SpJbRkvmCLuJ+DTQVhT2RnC8VFcvOCbMSbkrtO5i5x4GWJC2FxI9yNKRV3/4QBzcRtj/eEVyKmK5UckZ1jh7/NUKkNxm79Lt/HvI217+ShJsRYjTIhOMhZgwfTpN1Q28uf9lwGTnkig9bog9ufykm7cdM2VNKyAoZ5w0TmakMRsjEzw7zwjTtDJOU8oHfYSQpiTruXeWKSn9Zuuf+y/EAIl9Ni4xjP+PVLQUMqtHcuyJjve+itnfG2cYZg5ntwYTLeEyVGsosnOREwYpIiOUqBOo8C6RTHEXIXYgAn1oQeOfc8+VhgR9ljhJMindON7h2Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 DS7PR11MB5989.namprd11.prod.outlook.com (2603:10b6:8:70::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7698.29; Mon, 24 Jun 2024 11:10:06 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::fc1:e80f:134c:5ed2]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::fc1:e80f:134c:5ed2%4]) with mapi id 15.20.7698.025; Mon, 24 Jun 2024
 11:10:06 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "Naladala, Ramanaidu"
 <ramanaidu.naladala@intel.com>
Subject: Re: [PATCH i-g-t v3 0/7] Panel Replay eDP changes
Thread-Topic: [PATCH i-g-t v3 0/7] Panel Replay eDP changes
Thread-Index: AQHavh0oP1hybOZE4Eu/1e15d6J9o7HW0eeA
Date: Mon, 24 Jun 2024 11:10:06 +0000
Message-ID: <c931f10bba6b1e24b271be6b6ef07537b8a81cdd.camel@intel.com>
References: <20240614053839.1822879-1-jouni.hogander@intel.com>
In-Reply-To: <20240614053839.1822879-1-jouni.hogander@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|DS7PR11MB5989:EE_
x-ms-office365-filtering-correlation-id: 77dc702b-6338-4bca-ba14-08dc943e3424
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230037|376011|1800799021|366013|38070700015;
x-microsoft-antispam-message-info: =?utf-8?B?TDFnRHIxSFMybXNxZWtFQTVEaWd2d0pDN0tZMm8wc1BiNm9uRjdwQXBjRi95?=
 =?utf-8?B?THJ4TjN3Z2ZoYkdkaUkwTGxETGU2czlSb0pxYzhiaG5VSmp0NnQ3cG1qdnhJ?=
 =?utf-8?B?citRSkRTSkhldGJRR0s2eko3VitxOEZMQkZQSmVFeWsxdmp5aU1MQ3BWSjBF?=
 =?utf-8?B?RDV1OXhNbVdscGFsUW1TblhSN25kS1UvSTVFcUJML0h6OUNVbDY1bkRVbTZT?=
 =?utf-8?B?VktPemRaWURRRGVCOTdYYkttTVpCR0EzdmI2YW52YnFreXp0ZGU5V1pRbGFI?=
 =?utf-8?B?QnJkQnV6YStFVG5CdzhWZmplRUtCL2V5c0NXOGZETExMMWh5K3JlRXQzQkZo?=
 =?utf-8?B?RWN1bEREOGF5SmJFcW1XbmNXWlQwTmlTY2FxNXpYVHRnSThKUXVCTHJjWDkz?=
 =?utf-8?B?Qlh3UElvNDlXQXVvcmVSelZYMlYyUWhWbDUreHE1MVI5YXMxNFdsaHlZby81?=
 =?utf-8?B?NVIyMHAwNFZzRGhDMTFNSzdYS2J2dkRRcmdXUGd5OHpyZDZuNnUxYU1JOXdq?=
 =?utf-8?B?L1JreUFxS2ZXdFY4SW9sQk5YaXNnSEhkQWFmRFRWZjY0Q3BOUk9rVmRUY21U?=
 =?utf-8?B?N2tOcXY5WEVid1owdDNTSlRzUlQ0Yjd5cmpDRFRoY1JQeTBHOER0QzcvcmJh?=
 =?utf-8?B?RUt4UXpnbnE2S2hsQzRQZTlqT1FwTllycE9GRXlCbEN3QzVxY2UxRFVleXpW?=
 =?utf-8?B?Wk02V01oTmxXV0kxY01JSDViQU9aMkVBWGtpTUdIQ244ZzNJU0xwRTVjYmhk?=
 =?utf-8?B?bk1oK1hrVFNaWHUzM3FiSVNycDRBanN0LzZFRVJoaDUyd2xaNm9WaXQyallY?=
 =?utf-8?B?STRSb04ySUtMbmwyVnpFWWVSa1JRZjBjRkFGUFBZd3RiSENwTFQ0T0ZaR0dB?=
 =?utf-8?B?WlpPNVE5UXN2Y21zd0pKVDBRNDg4Qkx4aFcyOG8yUy9qMXpxNis3WVA3eGdx?=
 =?utf-8?B?MUo2MmR6SkYwbVV3WWU3YmNWbGlqa0VtbGlhQmNWMXE0NUZ0SWM1MC8zWHhK?=
 =?utf-8?B?UnV0YkpIbnBWQlUxZnVGVkZmekJOZ1hCcC8yRWZST3ZCYWRKK1ZHbXBTaGlF?=
 =?utf-8?B?bVFlM2NBTVNLN3FaTzh5LzAyZlI0d0JVNGE5ZEIwUEZndlVOdVh2dVovTnVj?=
 =?utf-8?B?ODAxWGhvUEF0b3J3S3FKSzNlWW40UWltb29nVy9XdVd6cjlycnplVmczWUFo?=
 =?utf-8?B?L0I2Mnd3OWNOVVVKVDBEamE4OFpweldrc3JpaTdJK1JxRG1PTlZKbFp3MGpZ?=
 =?utf-8?B?bGJmVngva2xWdWlvejJLMUlpSjZEQmVyU2lzS2kyOFBnK3ZWR0tJT05meDNp?=
 =?utf-8?B?MERmSmRZSjB1a2N0Zmk3bTlBWFBPaVcvcG9SZWhyclBxV2piL2VQU2Nub3RE?=
 =?utf-8?B?T0s5SitpUktTcUQrUGRmNmgwTEhVSThubUhyN1pJZCswUUM0K090M3JjdTZi?=
 =?utf-8?B?ZURMMVUrOHN6U1hYK0Y3STFvRWlUdittQU9ZOGNLQmIrUlc5NjM0R1pwWjNW?=
 =?utf-8?B?d1JuQlVVbWxVUGRPb0ZuU1AvWlNhV2JJcWhrYkhpRnRPcEFqKzRhSnFPdklJ?=
 =?utf-8?B?NDNnenZqK2h2cERSdWVud3ZLOXY1am5OT0psdzI1WWFkVENLUG5XbU0zRWZ4?=
 =?utf-8?B?VTl2NmtrVDI5eTZHZjkrN29MMkNaeUYvTkF0MTFOV0pvYnFCdmFlV2NGTWV1?=
 =?utf-8?B?bTgxZGNUcnpHdW5odUpxaFdzQkJqZW1RRDBzSjR4NndhcE9jNUovcHN5WFM5?=
 =?utf-8?Q?qBEPI3GIStfLMKK8YUN+irpR5cC37byP6v76Vsq?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(376011)(1800799021)(366013)(38070700015); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WnB3RG5WUWRNNjNvVjNva0NFUVc3U0o0citpS3BQOFliaTVsb0VWVmFWWEpJ?=
 =?utf-8?B?cFdwMFlob2l2T09OTTFzSndYbzRVVTA4VFhxMGxkanVtMVFhWk96Mlpid3Rs?=
 =?utf-8?B?UDdyTkh4MTNFMElrVk1LZ3ZkM001Y2g4NnhZZHl6bXlLMTRxalFEMy9JT3cy?=
 =?utf-8?B?UTFmcmpscUlWdyt2TVY1R3luMURnZ283OU9sOCtiUkMzQXJlK0MwcTd1Tld1?=
 =?utf-8?B?Q0pWdE96TmMxOEVOZmZvT2dwaGR0NGJmcktibjFjS0Uvb0JDckpDMm1BVmNC?=
 =?utf-8?B?THFPMVIrblZaV3VOeCtvaHNXcWl6MUlsQ1Yvc1lDWDZUVjQ2YmVIbmRGdUZI?=
 =?utf-8?B?dXptZUNMSi9FNUE3cnZBcEQ3UGk5ek9LODNyTkF6QStsdXhDWkdjdXdqS01D?=
 =?utf-8?B?MlBaRHNmOXlEVDNWNVdMc0JrbjhnK0U2WHlKZm1QVmxVTktwaHJmUk5IeFF2?=
 =?utf-8?B?YzRhRm9NOWVPKzRLOEJRYVN1ZXFQUm9ISmttMnhSSFE1eXdpVzc0bFduUndl?=
 =?utf-8?B?cTJaeW9XU1crZ3ZVckk2M1JIU2Q5UStCQk8zT2hqS2N1ZGxCR0JYbjgra1Yy?=
 =?utf-8?B?UDUzOEViS3ZSNnFOS2h4cTNNOU5aNWk3RnpoL1h5Sk44dHZidlozRE5Zd0JT?=
 =?utf-8?B?dmZXOWIyeXltYUtOeHg0VVNqT3U1d3hwaWhoL2hvY0RkNE1YaEkxVHZML1JN?=
 =?utf-8?B?WXpHa0ZiVWdrenRMQ1d2bDJQQllRV2J5NklsaGVBUVVYYWVMekUra01Rd2ds?=
 =?utf-8?B?RVNrVDZrUnFtcUdPZGJOYW5NMlNiRndhNC9wVXJtQUIrcFhpTGRrSWdVbnND?=
 =?utf-8?B?alFPdHN6L3hRbThjMnBncEdtTGRWN2RHcThldWdBSUxyOUwxL1RkMXlxbXUw?=
 =?utf-8?B?SnJSYlBwOGI2WXNiOEtqNTZoZ2NKWnhIbkZ1YTg0MlBqZjVmdVZlQk1oMjhn?=
 =?utf-8?B?TTRnVEpnaERScjhNWGhRcXZnZnVmU1Y0UDdOelNDREo0N3ZsbURUK1VDb1N6?=
 =?utf-8?B?Sm9hbzQxV0FrUFBIQm16cVV2RXZHTG5UUG9mcFVBay8zZHJEU2FqeFhyc0xi?=
 =?utf-8?B?NDAvZUY5eFphWlJUdi9rb3ZnWGwxSi93bWJSMURsc2ZhUWJDQXhkR3F6Z2w1?=
 =?utf-8?B?cUZOZlRybHV5SFE1bURGSHNsN3lQTFZCZHVZYWIxbDhkbDVYYlcvVzBtclJX?=
 =?utf-8?B?TE80N1I0dmpUOTZpa3d0Z2ZCSndENTVNajRHQ05vV2VxNHpObVAyQ0orNE42?=
 =?utf-8?B?K2F0SThyVFVTYXBMbDF3YlZqLzcrWTJyaGJKWktGWWRMc0k3R3prNHJaaUJ5?=
 =?utf-8?B?VEVPSEVZV25yVDI2SlBTQ2tWTG5XdkRZb2Q5Vi9FalNiaUFkTkZCWHV3OEF4?=
 =?utf-8?B?UzVOcHJlMGxLZGRHa3JWWVo3ZlBtdEhrN0FlbURqT25YTDU5Tjg1RkdEZ3hE?=
 =?utf-8?B?NURFdlJwMFdqdGFTam5UMWpNWi9SMm9nN1crWDAwZlVuV2RTbDAxREY0VEp1?=
 =?utf-8?B?TnBnT3EwQmJJRnNXcUtqekdoWWhOSXQvSXFLMnhsT2tQYkFsM0QwV0E5Z1Fl?=
 =?utf-8?B?V3RaZUJkZndybm9JWjNIMHFCZ0lHK0kwRzVEYlZhZlRKcm9VQmp2bFdYaWdt?=
 =?utf-8?B?UU5YVW1aTGJ5U2FCUGlJeUxRakZZODI5dmNvd1l2QllpZGJNWHZwTDZDdXRX?=
 =?utf-8?B?dlk4NElKdnVoMWp6bHV2L09tb3c3ak5HUE80eHpvMG9ibTBmTS9nQWdUaVZm?=
 =?utf-8?B?SG80WS95TURuRm1CYUNIVWoxd0YrbWpZbGtqcDlIQmRaQXRZSnFRL0c0UlpB?=
 =?utf-8?B?NzhvQU80cm9PUWk5QzhOenl4bWpKUURjR3hmSWFabis4ZEpOUHpYMzNoa0NH?=
 =?utf-8?B?NW1qWE5CUDAyUCtGYkJWcHpacGQyTU96dm1iWjBTcnNldjlTemRST0FqSlUy?=
 =?utf-8?B?aWI2MnpNS29JcEFsUG1RWFpmdXJFemVocjVKTkY5cW5ZQW9rbURnOHl0R0Mw?=
 =?utf-8?B?NFVZTjFCcXV6cm1GUVZqU1NjYmdKY1FiSFdTcjZGV0ZSRkNNNzJyWHZDTEd4?=
 =?utf-8?B?OFFNZVlySHpzZUZ6WDdFbjhrbnY2eWMyOUcwZXk5d1FCazRYVmJUQ3E2VnBC?=
 =?utf-8?B?b1FtZ2R1bGVpazdpSlFrZERQcHZSQ09uN0lFY2d3MzFaU2taMVVnMENlYjBM?=
 =?utf-8?B?Tnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <44E31ACB684EFC439A903852B1DCB6D6@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77dc702b-6338-4bca-ba14-08dc943e3424
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2024 11:10:06.3191 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rNXHYGMxA+QfEqzpA4bfDQa4e8r0A4I5e9H5WzVHsS1oZtILpNqV/EsbIYnaNS8Ecwy0iWEjRKOB4bRcvf7v/X140lj4JF0vXd9c8EWPY34=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB5989
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

VGhhbmsgeW91IEt1bmFsIGZvciB5b3VyIHJldmlld3MgaGVyZS4gVGhlc2UgYXJlIG5vdyBwdXNo
ZWQuDQoNCkJSLA0KDQpKb3VuaSBIw7ZnYW5kZXINCg0KT24gRnJpLCAyMDI0LTA2LTE0IGF0IDA4
OjM4ICswMzAwLCBKb3VuaSBIw7ZnYW5kZXIgd3JvdGU6DQo+IFRoaXMgcGF0Y2ggc2V0IG1vZGlm
aWVzIGlndCB0ZXN0Y2FzZXMgdXNpbmcgUFNSL1BhbmVsIFJlcGxheSB0byB3b3JrDQo+IG9uIHNl
dHVwcyBoYXZpbmcgZURQIHBhbmVsIHN1cHBvcnRpbmcgUGFuZWwgUmVwbGF5LiBGb2xsb3dpbmcN
Cj4gdGVzdGNhc2VzIGFyZSB0ZXN0ZWQgYmVpbmcgd29ya2luZzoNCj4gDQo+IGttc19mcm9udGJ1
ZmZlcl90cmFja2luZw0KPiBrbXNfcHNyMl9zZg0KPiBrbXNfcG1fZGMNCj4ga21zX3Bzcl9zdHJl
c3NfdGVzdA0KPiBrbXNfcHNyDQo+IA0KPiBJdCBpcyB0ZXN0ZWQgdXNpbmcgY3VycmVudCBkcm0t
dGlwIHdpdGhvdXQgYW55IHBhdGNoZXMgYW5kIHdpdGgNCj4gcGF0Y2hlcyBmcm9tIGZvbGxvd2lu
ZyBwYXRjaCBzZXQgYXBwbGllZDoNCj4gDQo+IGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9w
Lm9yZy9zZXJpZXMvMTMzNjg0Lw0KPiANCj4gdjM6DQo+IMKgIC0gYWRqdXN0IHBvbGwgaW50ZXJ2
YWxzIGluIGlndF9wc3INCj4gdjI6DQo+IMKgIC0gZml4IFBSX01PREUgc2luayBzdXBwb3J0IGNo
ZWNrDQo+IMKgIC0gc2V0IHN0b3JlZCBtb2RlIGluc3RlYWQgb2YgUFNSX01PREVfMl9TRUxfRkVU
Q0gNCj4gDQo+IEpvdW5pIEjDtmdhbmRlciAoNyk6DQo+IMKgIGxpYi9pZ3RfcHNyOiBTZXQgUGFu
ZWwgUmVwbGF5IGRpc2FibGUgYml0IGZvciBQU1IgbW9kZXMNCj4gwqAgbGliL2lndF9wc3I6IFBz
ciBzdGF0dXMgZGVidWdmcyBpbnRlcmZhY2UgcHJpbnQgImVuYWJsZWQiIG5vdA0KPiDCoMKgwqAg
IkVuYWJsZWQiDQo+IMKgIGxpYi9pZ3RfcHNyOiBIYW5kbGUgUFJfTU9ERTJfU0VMX0ZFVENIIGFu
ZCBlRFAgUFJfKiBpbiBwc3IgYWN0aXZlDQo+IMKgwqDCoCBjaGVjaw0KPiDCoCB0ZXN0cy9pbnRl
bC9rbXNfcHNyX3N0cmVzc190ZXN0OiBQcm92aWRlIG91dHB1dCB0byBwc3Jfd2FpdF9lbnRyeQ0K
PiDCoCB0ZXN0cy9rbXNfcHNyMl9zZjogVXNlIHN0b3JlZCBwc3IgbW9kZSBpbnN0ZWFkIG9mIA0K
PiDCoMKgwqAgUFNSX01PREVfMl9TRUxfRkVUQ0gNCj4gwqAgbGliL2lndF9wc3I6IEZpeCBQUl9N
T0RFIHNpbmsgc3VwcG9ydCBjaGVjaw0KPiDCoCBsaWIvaWd0X3BzcjogQWRqdXN0IGlndF93YWl0
IGludGVydmFscw0KPiANCj4gwqBsaWIvaWd0X3Bzci5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCB8IDYwICsrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tDQo+IC0t
DQo+IMKgdGVzdHMvaW50ZWwva21zX3BzcjJfc2YuY8KgwqDCoMKgwqDCoMKgwqAgfMKgIDkgKysr
LS0NCj4gwqB0ZXN0cy9pbnRlbC9rbXNfcHNyX3N0cmVzc190ZXN0LmMgfMKgIDIgKy0NCj4gwqAz
IGZpbGVzIGNoYW5nZWQsIDQ2IGluc2VydGlvbnMoKyksIDI1IGRlbGV0aW9ucygtKQ0KPiANCg0K
