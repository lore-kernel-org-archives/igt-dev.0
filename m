Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93719C02192
	for <igt-dev@archiver.kernel.org>; Fri,  7 Feb 2025 08:14:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C24C10EA43;
	Fri,  7 Feb 2025 08:14:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VrSqMf6f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEA6810EA43;
 Fri,  7 Feb 2025 08:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738916010; x=1770452010;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=XyKxz6QK24UaMnACSYC1czECOoIrGBK4YSJpYHJoodQ=;
 b=VrSqMf6fIbX91YPejoXvMn+QE5lw7UuEreZQFAgkDVqbMfwPhnsq2AQE
 siYtKqqqpFbU1CH5QI5bZmqZcKDEdQEbLnW83xagENLagra3FTNuUzA8j
 8nCdAr/QDFi8bWKjLLwYl/JM5ivj5JFKzOmbCK9ymD9mq7uT7Pl3HH1sR
 wCu7UtbHAYNPQEcL7Bw4Q/y3WJePI1rvknLImDzsOyoS1QG/T8L60pGef
 GTNL1pqJOLJ7Qb5uJ3IgUflVc7byhqdWhuRiE7dKG5Zpv72GFsnQVSID1
 ZKYw5xNebSPj6+iIA1wp68pt1CgXJW8dfCFjxaleY6WIwiIWryK/8pxQh Q==;
X-CSE-ConnectionGUID: USK5IoVuTPaIoYgVKhb1IQ==
X-CSE-MsgGUID: vIjmrrBwRqOsPiZpte/28Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="27157864"
X-IronPort-AV: E=Sophos;i="6.13,266,1732608000"; d="scan'208";a="27157864"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 00:13:25 -0800
X-CSE-ConnectionGUID: VgMIztOzQ1mTEjTkgyi4TA==
X-CSE-MsgGUID: ofn5JdGUSvu8/x8P4VUjlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="134695503"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Feb 2025 00:13:23 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 7 Feb 2025 00:13:22 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 7 Feb 2025 00:13:22 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.173)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 7 Feb 2025 00:13:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ep3pBFxifsk3zG8lZei0uTeVUdiwn5Or+SDCbLtjZD4eFmtkDZ64tJ3UWsqzr4KpZV8KY+U/5u9WcVTm6p/XWMGlcpqh5bsgYkd97AOi723NOsdFeNaADRgECpSV3vNFEobNcZzkfnr0Xazk+fki21n9UmnhAV05mtrhONFQqwevAGdElBsbLM3ZA3iax89h/5Z1Gf+FGcl6G65x2TrM/UD819sUuv5dZdF7Vorp7rQD6ArHBaszKclncTjziixpQ/Sw3UEeBnZFU7qgTFiNm0FZfMYuyor1iDOvFpDGgfsgw+aoGf9ICk9dop1UXUyAwtsIWDfQVmgNZtZVp5H45g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XyKxz6QK24UaMnACSYC1czECOoIrGBK4YSJpYHJoodQ=;
 b=cI6xokO3Z5jlBxpnOlbJiScWgMtBJrfEXso8sJ21ymSiTiyyc7AfFBl9vn6UKKVogCvFouSCPHN+jMO+oNVBoDyVQhS//Ot6JOkksPhJ6ZVC8eFpokfkfiS4TPRmkGIBaCkJ4nHOeeoP853B+3jW/I3CNNvJgBc5YZlaysL394J4JXANpiVEC2ewhp2cjH1POUU80BcwinRxmp/c9Y2haH0Qc81G+cbFULdSXaRbvOeRJz0Qqhf6dKB9ddNXJP1f6YhJoKlvR0sJ8nPrLMB7MNrn1we5fhylZYSHHrvJnpWTntdQVXLIFfSkkAZgRgDNw27Q3GjnQWAiVBFcFookEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5491.namprd11.prod.outlook.com (2603:10b6:610:d6::19)
 by PH0PR11MB5781.namprd11.prod.outlook.com (2603:10b6:510:14a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Fri, 7 Feb
 2025 08:13:14 +0000
Received: from CH0PR11MB5491.namprd11.prod.outlook.com
 ([fe80::fc35:d6ce:8908:ef2a]) by CH0PR11MB5491.namprd11.prod.outlook.com
 ([fe80::fc35:d6ce:8908:ef2a%6]) with mapi id 15.20.8422.012; Fri, 7 Feb 2025
 08:13:13 +0000
From: "Ravali, JupallyX" <jupallyx.ravali@intel.com>
To: "i915-ci-infra@lists.freedesktop.org"
 <i915-ci-infra@lists.freedesktop.org>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Subject: =?utf-8?B?UkU6IOKclyBYZS5DSS5GdWxsOiBmYWlsdXJlIGZvciBCdW1wIGFib3J0aW5n?=
 =?utf-8?Q?_on_network_failure_deadline_to_40_seconds?=
Thread-Topic: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw6IGZhaWx1cmUgZm9yIEJ1bXAgYWJvcnRpbmcgb24g?=
 =?utf-8?Q?network_failure_deadline_to_40_seconds?=
Thread-Index: AQHbeTUelg5nzT7FYUGLf7zAg3lR+7M7fmTw
Date: Fri, 7 Feb 2025 08:13:13 +0000
Message-ID: <CH0PR11MB54916E8EB855A123DD4364FEEFF12@CH0PR11MB5491.namprd11.prod.outlook.com>
References: <20250206152147.209277-1-peter.senna@linux.intel.com>
 <173889365437.2324859.7581750241661887454@b555e5b46a47>
 <c6213cd1-9446-45f0-b929-cfc2064d716f@linux.intel.com>
In-Reply-To: <c6213cd1-9446-45f0-b929-cfc2064d716f@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5491:EE_|PH0PR11MB5781:EE_
x-ms-office365-filtering-correlation-id: 5883e1f0-a8fa-4bcd-4a36-08dd474f44d0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7053199007|13003099007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?ZGxQZkdEWEE1QzZ5NWRZWG9hRis1d1FpVUlmWjhQRERxY1d3R3Q2YnYrVEZT?=
 =?utf-8?B?RGZxTkZwOG92WURrbHJ0bXBxRXlPeFI1a3p4bHVyN0Njbm9vbi9sNVhxb3Ew?=
 =?utf-8?B?K2NNS21zRGM2elBKa2xjWVZ2dFd6cU9CcjhiZnNZdkJaajVKN0w0VGE0ckl4?=
 =?utf-8?B?WURzKzB6NUVwSjhieXl1TzJPb2FsRzcwZ1p4OHptRkFLMGJCT1pGamtYbUlt?=
 =?utf-8?B?cnNGWWhPV21uZE9rYk51eHpNa1IvUmZvUWk4RjFwQU1VUjRQNFZ2UDZMOHhr?=
 =?utf-8?B?V1EvbUxyamhsRVlKTC84UkVHakFoTkxWSVg0a2k4MXkzb0gwS1B6eTBrRElP?=
 =?utf-8?B?SUtlNXljZkhPditmTmJRMVNXTTM0S0tLTktud1ZldFFSL3pwbU9rQlVJOS9i?=
 =?utf-8?B?U3pPTGRPTUErWmFoTGEwNFJaT2NxQ2tyYnRtdVpoaG1IYW1pbWJjWk80OWdk?=
 =?utf-8?B?eFFwVDR0enUxQ1dvYVM1UFlsQjMzMjdaWFBtMUQrc0Z3ZFcxRGg1R3VBRjZr?=
 =?utf-8?B?SE5zcm1GbEQzNGhkQ2ZzdXdYZnd0RHMwZmlCOVQ3WHVPeHJ1TlUzcUl3QkFl?=
 =?utf-8?B?bThNSGE3dkxtcXNaZWV6cWhjeGJSNDlYbXJaTHFoNkR4YzZLSEYzdVA2ZXJE?=
 =?utf-8?B?VXBIUFRnQTJnVFJQM3M0K3pNTlV2OWpMRC9RbllVeU5lM2RyZ01Ic3V1a25O?=
 =?utf-8?B?UnRiaWUrNStDTnBrbkRsY1JqbkFIek5nSjRscHkydFh4NzVBVFVBd3M1b2lX?=
 =?utf-8?B?bVlwOG14Z0xNeFh4U3NrTk9DNW1tdlArS01TRXNIdTZuZ0xrcVFEd1JVTm14?=
 =?utf-8?B?VFdQZkphM08xbjBXOUp5bDJIanNuYXJXQlZRYURXS1ZNdHFFLzFpNzJFZHpF?=
 =?utf-8?B?LzlGUXZmUmFkUHIvMUdFc2VnMWJ2S01XOElJVmFBSFl2dG5udmhNVXdTV1pw?=
 =?utf-8?B?ck92d1VPbEN0cXpSelhpaHd3djFZRVZIbm1qZ0l5MmNybGoxNjJLbjFSTE5F?=
 =?utf-8?B?YTBqN1BETHR6SUo3cFdJK1ZmVThJOHZZb3hoaFkrKzJsdWY2bUxuUHgrcXR1?=
 =?utf-8?B?Umt1MFl4cENhZDhWY1ZYeUExd2VGUmZpcW1aZWpsVXZMSHMrckNIV2lvc1Vl?=
 =?utf-8?B?MWN5Nm42MnFpZG9XeWwwMjJsbGcyb2tWL1pXVHNIZVdkbENjMzFNcWpTWE5M?=
 =?utf-8?B?VkZDMGdIMDZUN1dLVTJvVmdtRDBUZkYvVzEwY2hGUVFIWjRHVUVmTlBXUys1?=
 =?utf-8?B?czlZZVdwdGloUy8xYk1xNDN6U1JzTTUzbFY1YldOZnVkcndNYWRBa2NIb2ZK?=
 =?utf-8?B?TjFXbXhTZEdvRGZRVVVPUm9CQTZXMU9hVWIvU0x1elc3NjZkbGpHWmszMWta?=
 =?utf-8?B?UnJTOVRzSUlPdFYxKzF5MjFtS0d6TkU3SzlNOWYyYU4yRXVzemp1RUdzSnBj?=
 =?utf-8?B?MUJVdHdubko5ZFE4MmRIQmdDb1FCSjlZOXZidEQ3NUJQUHpqOVpZUkQxekhF?=
 =?utf-8?B?dlVJL0ZjWEpnM2pBenhFSDFJVS9QY0R1MGVCRXU4NCtoMWkwdXMySnFMNXBB?=
 =?utf-8?B?cmhNVFdqQnpHRmZ6c3dOME96UDZvTjFGRmFMOCtqL2lSN2JUMFdac3huTjJz?=
 =?utf-8?B?Mm1BSlg4MXRhQ3p3RmVTZEZiRXhSRDRoNkJWNXpLWnp6MEx1U2hGQW1RMTJW?=
 =?utf-8?B?Sk5UUndzd1ZiSzQzajB3Z2ZIaC9Mb3JPV25xM2o0eGdqTVJzeUhGQlQxWFpR?=
 =?utf-8?B?b0RBQnJtZTNHa3Q5N3V3cHZ3allOR1EzNkFpc2JsSEFzUFRPNHRkVGpPQUJT?=
 =?utf-8?B?TzdKRG1iaDBDQWhsQ0JaN2c3YUh4ZUhOQlJGV0JJeExobnE5M3AydlJnR0pk?=
 =?utf-8?B?cVlWbUx4anR5VjN5elpZTEw1M2xYb244Rm9xWDhkQk1UeVE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5491.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(13003099007)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UE96a29DYmVMMzFOcVlubENDMTJ3SVFFdkNtQU5NbTdTREtYNmxCTUVObWpq?=
 =?utf-8?B?K1R0SkJTdUVNV3RWZzJvZXNJaHNSakdTNjIrUTlUMGVjTy9aSkhIdDIrUnJj?=
 =?utf-8?B?YUcxb2p2NUMrK2tKbGp0Q2lhZUFzdEdpWlNMWFlEcTBNUmpleFhYdzBNQnl2?=
 =?utf-8?B?QU50RktJYjVZMHkySW0rY1lDT2hoRmtnbGZDMmJpa3N6aHJEOFdGbTB1QkFm?=
 =?utf-8?B?ZVBuZHdEUHUxQ2NVQ2hDcnh3S09SVEpTT0hCTjgvenA3Q0Q5T212WUhvcWo2?=
 =?utf-8?B?KzFHZHgzUGhKQkpLSkVCSFJ5WTVJai96WmVsbW92ZWxLTXoyZ2I5U1I3U0xN?=
 =?utf-8?B?dktFSXVJeXNrVXd1dWVWRVNWRzYzVWZ5Vkt0SEdNaFhkNmlEOE1VT3Z6RU4v?=
 =?utf-8?B?dEhLQWR3a1NTQ3lGUS9EZzkwN3pjczFrMTZGQXZyNmhIclZyYTZvdmpXMGc4?=
 =?utf-8?B?KzVKNG5XeHR6REV4YjdINVp4TENiUzJ0YlhCZzdMUUkyQU82SjJQVXB6R2hW?=
 =?utf-8?B?UFZsUWppWk9iZDRhWStLVzFwcytFaEZVSWNTQW9oTU9KNE9ObFJNN1JlM0NV?=
 =?utf-8?B?OGdEN3JLMVc1MDdiUUtxb3ZNSlVURVh1MEgrTkw0TnRTVjgzaVhvL2RGaG1q?=
 =?utf-8?B?Wml0aXhjWDdvTDNTdWp2ZUc5S3F4ZGxQOWRCM2dVbkMzc1lqN1laanBYdFll?=
 =?utf-8?B?SWs4ckREdFdZQ1pSS2VmQjB1ai81TlVEbHE2VFlBNit6RXNVbTVjZDMzR0dK?=
 =?utf-8?B?N21vNG1CbDVCbVorV3hnT3E4YmNHVkNmTHVheGRraDhiNzVMQUtFNnFxb3BZ?=
 =?utf-8?B?SGwwWDZJdWtOYStEZzlKSit4ODdHeXhxRFk0WDJYVlg0VVN1cUlybGhzTDU3?=
 =?utf-8?B?ZmUwV29EOUNlUWtkaG5nWWFuK0xNdmZuUHdGeFowNUVYM3FzNU1iRW9IVWJD?=
 =?utf-8?B?UUxqSHZ1T2poY0JxUFQ5c3MxWU5Ec3NIRlgvMXFqY2ZtWEpyUXQ3TUdFZ3Rs?=
 =?utf-8?B?ZjVlekhHU3JPbkNYTDB3TDhDS3hHaEZaYUMzV01rUDZHU1N4dnprckNMWXVh?=
 =?utf-8?B?M0x3WjRkcnNqaW1kTTNseVkzS2hOWk9GTmM4dUxDdHlBbHIzY3VvcFpGWXR1?=
 =?utf-8?B?MmtDL3Y2clR0T2kwbmtVSGMyeDZua0RvOGV2VEovVk9BbG0rRmtqcTBvK1No?=
 =?utf-8?B?RGxGUnE1SWRYTjVIdUpDeGIyTDIzYTczd3plenEzTXVNL2RFcUt6R3ZTem5q?=
 =?utf-8?B?K3JTTW8vdVArUVNTdmZFbDQ3VHBoRXNJeGVjK3MxVmcwRjN1dG5BRDFPNnVE?=
 =?utf-8?B?OE9BWkFBcS9XSC9laVpJK21NcVJ3dVBkMlIyMnZPbmJPdmFuOXhLREMrKzJj?=
 =?utf-8?B?UFFmWlphYWxPZGNBWVFpSldBTVd2TTRFZndFZzk0VWdIWUJacU1DRHdhYXlI?=
 =?utf-8?B?eWRkTFZ5bFFpTnFLS3k5bWRNbDczWXVSamk4YksyaGh1azBiNWlNcmFOWENz?=
 =?utf-8?B?MVE5TEZBMWxQWlBURWFKT0E1cFAyYkFpTGQ5ZldqRTdxWm5EZThLdjFsdFpU?=
 =?utf-8?B?Y1hKaGZGVDQxTEVzNXFBeGZzN01NT0gyTlBuRkEzWnFhK1hpcmdvTUpJSHhn?=
 =?utf-8?B?aFI1SENpSkwyN1BES2plS3pRMVo1cmNqUHBwblpKTUxJOUlLS3kvUnVFM0hr?=
 =?utf-8?B?U1p4eHFia0x1akVsd1FURGtTL1FtUXhpUjBGbTZVOHZiTHNNcFRTUHVBODFM?=
 =?utf-8?B?NkExN05PdDg1dm9hWTNRV1ppUHRVL2tROWl1K2RrMEVlanI0SlN0aEFuYVVD?=
 =?utf-8?B?RFF4Rk1pTjBseS9UeHlBL2ZtRVNjak1UZnhrSE13MWwyRFc5MnI0N3VvVllQ?=
 =?utf-8?B?YjlrVkZqMExnV2ZubmlML1VFY1RlWkdVWEt5Tk9Tc1FuazIxL3F3UTFxbHp2?=
 =?utf-8?B?WURwN2kvQ0p4QXowZFRXeUM1TEczZXM5Z1VXTlpDaXN2UDNtQisxRFpsbUlP?=
 =?utf-8?B?ekRkU0pkWHJDaEVhZjBxTU9qdjROeElIWXoyR3RFMC9BamNQMkFrN2RQb0g5?=
 =?utf-8?B?SU9lc0xDeGkwYkRBUUpCSnlzRlpwcXNQSUE3aTdEV0hISVpPRWdidXpEUy8x?=
 =?utf-8?Q?rViwIoeINJlnXWCHCmLHT64bT?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5491.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5883e1f0-a8fa-4bcd-4a36-08dd474f44d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2025 08:13:13.8593 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: upjIHqm11vePaqM2vClxRA/3k/EDcTPi8FRBd0ZnqnnyV+vuIIvX97nzx0xch/ZXCQVLBi737uxC9tN7hNECtUEHL5EDkVBBd7od48oZ5pQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5781
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

SGksDQoNCmh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTQ0NDI0Lw0K
WGUuQ0kuRnVsbCAtIEFkZHJlc3NlZCBmYWlsdXJlcywgWGUgY2Fubm90IGJlIHJlLXJlcG9ydGVk
Lg0KDQpUaGFua3MsDQpSYXZhbGkuDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9t
OiBJOTE1LWNpLWluZnJhIDxpOTE1LWNpLWluZnJhLWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnPiBPbiBCZWhhbGYgT2YgUGV0ZXIgU2VubmEgVHNjaHVkaW4NClNlbnQ6IDA3IEZlYnJ1YXJ5
IDIwMjUgMTM6MjENClRvOiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgSTkxNS1jaS1p
bmZyYUBsaXN0cy5mcmVlZGVza3RvcC5vcmcNClN1YmplY3Q6IFJlOiDinJcgWGUuQ0kuRnVsbDog
ZmFpbHVyZSBmb3IgQnVtcCBhYm9ydGluZyBvbiBuZXR3b3JrIGZhaWx1cmUgZGVhZGxpbmUgdG8g
NDAgc2Vjb25kcw0KDQpEZWFyIEk5MTUsDQoNCk9uIDA3LjAyLjIwMjUgMDM6MDAsIFBhdGNod29y
ayB3cm90ZToNCj4gPT0gU2VyaWVzIERldGFpbHMgPT0NCj4gDQo+IFNlcmllczogQnVtcCBhYm9y
dGluZyBvbiBuZXR3b3JrIGZhaWx1cmUgZGVhZGxpbmUgdG8gNDAgc2Vjb25kcw0KPiBVUkwgICA6
IGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTQ0NDI0Lw0KPiBTdGF0
ZSA6IGZhaWx1cmUNCj4gDQo+ID09IFN1bW1hcnkgPT0NCj4gDQo+IENJIEJ1ZyBMb2cgLSBjaGFu
Z2VzIGZyb20gWEVJR1RfODIyNF9mdWxsIC0+IFhFSUdUUFdfMTI1NTZfZnVsbCANCj4gPT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KPiANCj4gU3Vt
bWFyeQ0KPiAtLS0tLS0tDQo+IA0KPiAgICoqRkFJTFVSRSoqDQo+IA0KPiAgIFNlcmlvdXMgdW5r
bm93biBjaGFuZ2VzIGNvbWluZyB3aXRoIFhFSUdUUFdfMTI1NTZfZnVsbCBhYnNvbHV0ZWx5IG5l
ZWQgdG8gYmUNCj4gICB2ZXJpZmllZCBtYW51YWxseS4NCj4gICANCj4gICBJZiB5b3UgdGhpbmsg
dGhlIHJlcG9ydGVkIGNoYW5nZXMgaGF2ZSBub3RoaW5nIHRvIGRvIHdpdGggdGhlIGNoYW5nZXMN
Cj4gICBpbnRyb2R1Y2VkIGluIFhFSUdUUFdfMTI1NTZfZnVsbCwgcGxlYXNlIG5vdGlmeSB5b3Vy
IGJ1ZyB0ZWFtIChJOTE1LWNpLWluZnJhQGxpc3RzLmZyZWVkZXNrdG9wLm9yZykgdG8gYWxsb3cg
dGhlbQ0KPiAgIHRvIGRvY3VtZW50IHRoaXMgbmV3IGZhaWx1cmUgbW9kZSwgd2hpY2ggd2lsbCBy
ZWR1Y2UgZmFsc2UgcG9zaXRpdmVzIGluIENJLg0KPiANCj4gICANCj4gDQo+IFBhcnRpY2lwYXRp
bmcgaG9zdHMgKDQgLT4gNCkNCj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+IA0K
PiAgIE5vIGNoYW5nZXMgaW4gcGFydGljaXBhdGluZyBob3N0cw0KPiANCj4gUG9zc2libGUgbmV3
IGlzc3Vlcw0KPiAtLS0tLS0tLS0tLS0tLS0tLS0tDQo+IA0KPiAgIEhlcmUgYXJlIHRoZSB1bmtu
b3duIGNoYW5nZXMgdGhhdCBtYXkgaGF2ZSBiZWVuIGludHJvZHVjZWQgaW4gWEVJR1RQV18xMjU1
Nl9mdWxsOg0KPiANCj4gIyMjIElHVCBjaGFuZ2VzICMjIw0KPiANCj4gIyMjIyBQb3NzaWJsZSBy
ZWdyZXNzaW9ucyAjIyMjDQo+IA0KPiAgICogaWd0QGttc19mbGlwQHBsYWluLWZsaXAtdHMtY2hl
Y2tAYS1lZHAxOg0KPiAgICAgLSBzaGFyZC1sbmw6ICAgICAgICAgIFtQQVNTXVsxXSAtPiBbSU5D
T01QTEVURV1bMl0NCj4gICAgWzFdOiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9p
bnRlbC14ZS9JR1RfODIyNC9zaGFyZC1sbmwtOC9pZ3RAa21zX2ZsaXBAcGxhaW4tZmxpcC10cy1j
aGVja0BhLWVkcDEuaHRtbA0KPiAgICBbMl06IA0KPiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5v
cmcvdHJlZS9pbnRlbC14ZS9JR1RQV18xMjU1Ni9zaGFyZC1sbmwtNC9pZ3RADQo+IGttc19mbGlw
QHBsYWluLWZsaXAtdHMtY2hlY2tAYS1lZHAxLmh0bWwNCj4gDQo+ICAgKiBpZ3RAeGVfbW9kdWxl
X2xvYWRAcmVsb2FkLW5vLWRpc3BsYXk6DQo+ICAgICAtIHNoYXJkLWRnMi1zZXQyOiAgICAgW1BB
U1NdWzNdIC0+IFtGQUlMXVs0XSArMSBvdGhlciB0ZXN0IGZhaWwNCj4gICAgWzNdOiBodHRwczov
L2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9pbnRlbC14ZS9JR1RfODIyNC9zaGFyZC1kZzItNDY2
L2lndEB4ZV9tb2R1bGVfbG9hZEByZWxvYWQtbm8tZGlzcGxheS5odG1sDQo+ICAgIFs0XTogDQo+
IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2ludGVsLXhlL0lHVFBXXzEyNTU2L3No
YXJkLWRnMi00NjQvaWcNCj4gdEB4ZV9tb2R1bGVfbG9hZEByZWxvYWQtbm8tZGlzcGxheS5odG1s
DQo+IA0KDQpUaGVzZSBhcmUgdW5yZWxhdGVkIHRvIG15IGNoYW5nZS4gUGxlYXNlIGZpeCBhbmQg
cmUtcnVuLg0KDQpUaGFuayB5b3UhDQoNCg0K
