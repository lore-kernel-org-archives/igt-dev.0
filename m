Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 070DEC25B77
	for <igt-dev@archiver.kernel.org>; Mon, 20 May 2024 10:16:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 652C810E5C1;
	Mon, 20 May 2024 10:16:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NB3KnFHC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C94610E5C1
 for <igt-dev@lists.freedesktop.org>; Mon, 20 May 2024 10:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716200180; x=1747736180;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Q9cHEEAifbr2nXFsY8cNN184eDww/okPO70YfgozeX8=;
 b=NB3KnFHC7TXIgJ+jrj9DWW8mc+xsRtL9r1hFVn3k8p81C+114zeG3ywG
 7TujM0PWSHyx8mce+S0mHgv81z9hNlZD30UvffFE4Q3SON4s33+mo3Tsb
 T1mhEFrP9x0dBn10th/tS95AjWgf4wA8LYn5thXSBZMGFwt5v7u/jerNM
 NSyEOoCK6K8SxnzbRmfOJCdb3PBpKwUeDpYeEYiSu/bkK/MX5ToJOXOmc
 Qz6xWxhIeyy0lY8NbibcFTI+fbVSwct3CHW36foMYtlq0pqTLgPrFbt1/
 Fp8cWqPX04S/W7zD7JXfjP1XgwdcvjRoyyiAQsQA5z3rKMOXc2aeCL2el Q==;
X-CSE-ConnectionGUID: OLBTaVCBRFGkztG4qYcVWQ==
X-CSE-MsgGUID: 8A7lgMr3TNGcVGZgzsS3LA==
X-IronPort-AV: E=McAfee;i="6600,9927,11077"; a="12509773"
X-IronPort-AV: E=Sophos;i="6.08,174,1712646000"; d="scan'208";a="12509773"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2024 03:16:19 -0700
X-CSE-ConnectionGUID: u6TWF74ZROiGAYwSYLoaDw==
X-CSE-MsgGUID: a+9OmiF7Sa+xPgiczEGwuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,174,1712646000"; d="scan'208";a="63709523"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 May 2024 03:16:19 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 20 May 2024 03:16:19 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 20 May 2024 03:16:19 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 20 May 2024 03:16:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kKM4PmYc90it5PlGJiq5TLeFp+Bps98F/olcxNmUGKLUVpxkICwd4r0lYooYpgo9hyOEKBkim7CUUDXOW5ysk9v+4on1gTmXLp8Hf5QyOm7lEiA3M5uKboxhF0GfhtxxCDeMEPYq0qG7M2OJiGsiunXZ46RECz4O2xKeILQxObA3k3otK6sPsTuzjfGmLfpdQH/Fs0IdHbfS+jPjJGBTpe8YtFwWl17etCBWpwO+1NrQ0DaXfsCttre8KPTcKUtsKW8MBr8LhZzk6w5RoyUeut0GMaqarR+fFcyOH+a0srWrR5zHU0NY2bf/YeJmd1iLGGmAv4D2SK0JrPv1xJbGLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q9cHEEAifbr2nXFsY8cNN184eDww/okPO70YfgozeX8=;
 b=DBj31arHyct3JNYZd+IpK7viTM6bXjKYVkJhUooVqiMODR5Hl5bRjbZlIQ7BhZ6D4MpUefRJZ+DvgJzus2jiD3p5ExcVOeaoBAuw6AIAzldCACcxN+llsUWlBoW8nk/ejwzpWDPmGlZetNUjfGELvnKVnUFaLqnfdR8V5msnScezIb0ZktIZqRmuvh/7whwngesPUxiihfaQkqwMCT5hs3V1sPJee9Peg2YOvxDisBfQAAKPcmvRNapDcNqeXdzBzvdtXbnVsfWXOn3TneoPlHB8sj3VFC8pNU5tYHjSsUJo+DqmQA/bBGfX1/wzjAmfR4VUzav7sMJoQCY5QinOWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6097.namprd11.prod.outlook.com (2603:10b6:208:3d7::17)
 by DS0PR11MB8070.namprd11.prod.outlook.com (2603:10b6:8:12d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Mon, 20 May
 2024 10:16:17 +0000
Received: from IA1PR11MB6097.namprd11.prod.outlook.com
 ([fe80::8f29:c6c9:9eb2:6392]) by IA1PR11MB6097.namprd11.prod.outlook.com
 ([fe80::8f29:c6c9:9eb2:6392%5]) with mapi id 15.20.7587.030; Mon, 20 May 2024
 10:16:17 +0000
From: "Piecielska, Katarzyna" <katarzyna.piecielska@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: RE: [PATCH i-g-t] tests/intel/xe_sysfs_defaults: add missing subtest
 description
Thread-Topic: [PATCH i-g-t] tests/intel/xe_sysfs_defaults: add missing subtest
 description
Thread-Index: AQHaqpnNmljAGYApv0+6P4Ss68vh9rGf6C2Q
Date: Mon, 20 May 2024 10:16:16 +0000
Message-ID: <IA1PR11MB609798CB84AF894735D9CD2086E92@IA1PR11MB6097.namprd11.prod.outlook.com>
References: <20240520094039.31187-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20240520094039.31187-1-kamil.konieczny@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6097:EE_|DS0PR11MB8070:EE_
x-ms-office365-filtering-correlation-id: 57b9ace1-1919-4c31-da22-08dc78b5e2de
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|1800799015|366007|376005|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?ZnV4cEFsbCtHWGxnMmpNOVYrdVZRTWVXQWM5dVVObXBLVTVaN09wejFySW9s?=
 =?utf-8?B?a3FmZkVDOHMzMkd6TWY2UFJQZ3h0a1Y1NU5QUmlsWlN5bkpDdkJWcGlMMW4x?=
 =?utf-8?B?eUdGRlFwNUQrVzFMbzNFSkRySlp2YXJtVTNIa0xDem92ZVFKdVJUcjMzeHU4?=
 =?utf-8?B?YkxmTy81bmUxdGN3K1MzYkI3N1BJRnJnUFR4WDVzT3BrOW9rUDZOckFNS29H?=
 =?utf-8?B?VXlTa3RHVzc1YXpkTkhMMnZPQ2hac09vcDNnVXZwMVI2UUxBYkVUZ1ZnWEwr?=
 =?utf-8?B?cHNoYkhJOFhyZXExQSt1Y1JvL1h5am0yTmloK2RVVnBROXdrNWRTaFltQldY?=
 =?utf-8?B?K3dLTmRWNFM2TENSSkl1b3pYQlpMblpjR0tJWXZOdGlwV3UyVStLengyaVp5?=
 =?utf-8?B?bUVGUFMwbjRRWGlTeEhjR25mZ0VFcC9xRkQ5WU5OanVWZEk3dE9OazJqVHdQ?=
 =?utf-8?B?REg0Z1JuTmxHQnJUQzVtTHEvcmlSQ3dleEh0UkhTZk9FcjJ0Qldoand3VS9l?=
 =?utf-8?B?OFdvY3hsSjNkSEFEVEJKWCt0STl0aHZFOU1YL3dHODV4RU0rb3dkYkgrRWVX?=
 =?utf-8?B?bjMxaVNSSC8yc29sRzExYnNSQlNrUXRmaTVLZzJub0lWS1lCR0VEak9LYXY5?=
 =?utf-8?B?Z0V0bzZhNjFqalJZM0U5Y1pDQVJSaXlYTzdTenFIYVMwZUdmeEdiT1l2QlJY?=
 =?utf-8?B?R09nbUhRNmpIMFZ5MDRKYzhiTTFmeFBVSSsrZ05sRVJoUWpPZUJBTHl6cjlP?=
 =?utf-8?B?YTRxQ2w2bitZbURTOGhwdkdpNFllRjNOdDlJWEFnWnZpVCtydXNrN2FlS3No?=
 =?utf-8?B?dE9UM3c2cVhGQnR2cWdYT1VpRXJYbVR5NXE4VlpLUWc3RkgwdXVsVmRkNmx1?=
 =?utf-8?B?b3F4RzR2L0JQbXRxeWpCVTdNOTFxOTk3S2UxQko0Z3ZXaUZWSEZKYkVKdXFJ?=
 =?utf-8?B?a05BR1hQcUtIMXVIZHZ4QWtQQ2U2TmVxQ2pnMWkvaDdDcHV4NUZhRytCZVlX?=
 =?utf-8?B?N2lWTVQxUjlSbkJuaSt3dzZKRlhPNWFld3pJQXdMVWRPbUtSN2ZSclAyRnBC?=
 =?utf-8?B?QTFEOWFMamZDb3F5enE0eUpkOE1sbHJzNW9ua3RMOW1mL0dRRytDU28vaVRO?=
 =?utf-8?B?VlZRSHdJT1l0L3I4K3IyR2hPT2dxNGhlYldBL252VXdxVUlQZHJQK3ROM0Fs?=
 =?utf-8?B?N201RFNxWHd0SXI4K2RiOFBuT2hPTDd5N2hsU0tyMzliOHBnVlBUbFZkcWl6?=
 =?utf-8?B?NlFtUEt1aEFuT3pkS1FEZGVnOG1vbzBab01HVFpDcCtEdEViSnQwWkc5aFNJ?=
 =?utf-8?B?d2ZCc0VIblM2UWNPaytGYTdyZy9yWlR2MFdkNG5uNGQ2M250VmJPeXJIeTFj?=
 =?utf-8?B?TGhqZTgzWi80VkJqSHl2YUtSeVlLNEkyR2hrdkU5RmQ0YU9vdDRXZXdWUnVE?=
 =?utf-8?B?WUZ5dzhHZFNOcE55RWdYTGwrWFgwUm83UXVUVFZvUDNlSzRyNTBVZnd1QURL?=
 =?utf-8?B?YW1YMW05QUphNTJxSldqeW5rN3h2TTVYdzFTMGVJTlNucmpmeWxvQm5aYlJa?=
 =?utf-8?B?YjQ0aENVOVJTa2NSdUNBY1FVcjdvMzBqcDZHZ3VQclBqSEo1bGpad0g4YjND?=
 =?utf-8?B?MVVCRTlyS3I2ZUlwQTVPK2svRDRVSkdhU0pJd0VTajJLZzE1VmNYc3ZIUnBp?=
 =?utf-8?B?NlZZQTNhTFc3bFlhK2RVS3JDSjRFQUVBdWNGWVUxUGNFblBUc0poT3d4N0dx?=
 =?utf-8?B?NTAzODJzVkN0Rm1ueGFOYzJDRVBWczN2VjIydmw2eHpvRkovMnJGdnE0MHVP?=
 =?utf-8?B?UmN4c1hReFlCdFIyc0ZWZz09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6097.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SDQ3bEx4USs2d1pCeDNaVWNjVEFhZkJ2RU41V0NLMEM5amEwNGpZTnliTU1t?=
 =?utf-8?B?a041bHJRMmpTMnhpNTNHRWZ6SWRkVUJ4NnlhNHNEa3ZrbkUrSUxEalAwZE9j?=
 =?utf-8?B?d1ZOYkZweGRVT0wyYnRCOWN0TUZienpCcGtZQWxUamxDOHlINDQ5ZXY3dm1Y?=
 =?utf-8?B?dkcwM2JkaEVZVTZDNDBvek5sRjNZdEx6dTV6b3h6VTcrMXZyUUFhNXprdUlW?=
 =?utf-8?B?ZnVaWWYrQjFSUlU1eitzeG5pa1N6cHdvVFJtNk9GOXhtRE9vWU1rWGMwL2hJ?=
 =?utf-8?B?T3lLT1RYNmhFbWtqRUJmbXdKZyswQW5JUUhEVUx2a2lESEQzUU1la2s5cit5?=
 =?utf-8?B?ZDBGbHFvd3o3Q28xODZLV3FNT0NUWkI3QzhHd082akRYZ2ZFM251bm01WUQ4?=
 =?utf-8?B?V3U5K2s3YzNrb0lMaC9VRHlWUUtMZWx4WEVPNXhyZ01ROFF5Y25SSlBHUlZa?=
 =?utf-8?B?N25lRTc1dmova21hN2FzaFF0d0dTSE41NGxQb3pTOXRvcW05aW9QN1dIcTNC?=
 =?utf-8?B?NWx5SlovR2NLekgvVnJKMTRBMTVpTWtqR2hOUzZBdVFWeDdVL1NGbzJ6NGdy?=
 =?utf-8?B?ZS84UzF2QTNGdmJ2WVFWVmVhWjhFVXV2U1NQY2ZESEtkeTJhWHlDczQrUTJl?=
 =?utf-8?B?WU9aZEJrRW82bVZGeEVGWk1UT21PQnJOSmpzOWdtOUtKVmYrcW9CbTlWbjVE?=
 =?utf-8?B?c2JWdXlJMi9JVVhsNEFqZVdaaXR2SGVpV3YwaG9JYUUzVXlnbUtlRERaeW5l?=
 =?utf-8?B?T2FTU0VNeElGaFdRVmVlZzJGYmpLVzlaTnlVQXRWOE9qNm9MaDI1d0NQUGpD?=
 =?utf-8?B?ZldSbmJFQ1RQSEprRzRxbnBwUFB4MHJCMFA0T1NUblpGZ2lhdVR4TG1ycDQ5?=
 =?utf-8?B?YTcvek82V1dSNTBNQjZHMEFqWlFxYUdEYXBqbENBRTg0QVRjejYwK2FPemJy?=
 =?utf-8?B?cWErc1BKZWxrTkpPbzJpOUJnalRzV1JEZndpT2JzVUJuSytqZmRzdmcxU0Fh?=
 =?utf-8?B?TlluZTA3ZzFhck4wcVpRd1Z3aVp5dFQzb096SGJTVXRvMnFCZTROMFh3dnZs?=
 =?utf-8?B?aWNmbUZvWXZkRHVGVlR6TERtalhsR3VLK0phckRuR2svbzhBN0pUVjUySE5S?=
 =?utf-8?B?TVAweW9DQTlQNWFEaDIvbmdvZ2Y2Q1dRbTIzQXVMd2lvUi8rekd6ZHN1SEh5?=
 =?utf-8?B?VGxOOWZVR3BYWlgxMlhjenJGc2JZdGpZc0NIdkw4THJ0T1BXSG1YSmFEczY1?=
 =?utf-8?B?OXhiVkQ1NkV0bTBzZ1gwdGhnaUFCUDkxbWZZQnZxRVJ4UHlpUXc4TUg5SGFS?=
 =?utf-8?B?YTlhaVZaMWszTkRiU1B0NG1OZVpsaDRsYWZTWW5VT28wSkthaENPNVgycFI1?=
 =?utf-8?B?STJ1RVVVY29pbDFsc3hhRXlIWGp1T3ZGMm96NytpU3pZU0JXYjRtVTh1SXE4?=
 =?utf-8?B?dkJ6Z1JwcmlVUUdyek9TTzBUN244Z20xYURESjZsd2JHRXZMeWVrcTE2OGpr?=
 =?utf-8?B?RURvRGZvbUNJcG1FVDdzcng3Y0w4ZkRwMHk5TTdWODF2RjJrRk9qNStTQ3VX?=
 =?utf-8?B?UnNTOFhxUmI4YitoZ25NbTlieVJzc0lTZEo1Y05RKzUzVnlVaTUrWi9zNVZl?=
 =?utf-8?B?Rm1qQkRWaEVsVUVZVmw1cGVnSk5Eb3NBcStlSFZVa1IrYjJkRkpaTGlHS3FY?=
 =?utf-8?B?M0xZVFZyRzFXNVJDU1hLalNONUpSTXR2b1FkbE01Ykh5RTl1amUyUm93VW5J?=
 =?utf-8?B?S29CUFBQY0tDa2dRclpWSU1JeWpBL2FkUWxDdTcwT2M5VVJwTzNEa1pBcEkr?=
 =?utf-8?B?eFNhS1N1WDBnN0RYSkwzTGVWNTFCZmFRR2lDOUxXcXpwMkJhNDhTWHVOZm5I?=
 =?utf-8?B?TVhyWWNERFRhUUYwWmxaQmkzdXJ3dWxEQytwOUNHaXRDbGtzaWlGWWRTTk1s?=
 =?utf-8?B?bis4SHQzWFhxUUdjR0x1YTVRRUU3RjZSZ21wY2ZzdjdiVElxY3hlQXh0VCtr?=
 =?utf-8?B?RTl5ZlRuVkJIZmlWVmN1aHlrOVVuT1RKanpwdkJWNTFPeDNUTERkQ3Q5TTJx?=
 =?utf-8?B?cVFaVUVMWlluUitwS1JOejlHQlRBeXhxTy9nSENaUU5YY1pHRzFodVFqRXpM?=
 =?utf-8?B?Mjk0ODRvaHVwVFZDVjFMd1ByYzJnRjQ2RHlKaEM2N0I3aXl6RkRhbi9pbVlN?=
 =?utf-8?B?S1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6097.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57b9ace1-1919-4c31-da22-08dc78b5e2de
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2024 10:16:16.9867 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5MbEWx4MwoQ+nmVdGhQWh6DGFOuYr7ptrbQoB2jcgXyfUlBDqo+j/Y41WV5gbOuzWPQO1W9CeDZRGBlKfdGBOXDKDJN3syBxydTXyC513wc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8070
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

TEdUTSDwn5iKDQpBY2tlZC1ieTogS2F0YXJ6eW5hIFBpZWNpZWxza2EgPGthdGFyenluYS5waWVj
aWVsc2thQGludGVsLmNvbT4NCg0KS2FzaWENCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0N
CkZyb206IEthbWlsIEtvbmllY3pueSA8a2FtaWwua29uaWVjem55QGxpbnV4LmludGVsLmNvbT4g
DQpTZW50OiBNb25kYXksIE1heSAyMCwgMjAyNCAxMTo0MSBBTQ0KVG86IGlndC1kZXZAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnDQpDYzogS2FtaWwgS29uaWVjem55IDxrYW1pbC5rb25pZWN6bnlAbGlu
dXguaW50ZWwuY29tPjsgUGllY2llbHNrYSwgS2F0YXJ6eW5hIDxrYXRhcnp5bmEucGllY2llbHNr
YUBpbnRlbC5jb20+OyBNYXVybyBDYXJ2YWxobyBDaGVoYWIgPG1jaGVoYWJAa2VybmVsLm9yZz4N
ClN1YmplY3Q6IFtQQVRDSCBpLWctdF0gdGVzdHMvaW50ZWwveGVfc3lzZnNfZGVmYXVsdHM6IGFk
ZCBtaXNzaW5nIHN1YnRlc3QgZGVzY3JpcHRpb24NCg0KVGhlcmUgaXMgYSB3YXJuaW5nIGZvciBt
aXNzaW5nIHN1YnRlc3QgZG9jdW1lbnRhdGlvbiBldmVuIGZvciBvbmx5IG9uZSBzdWJ0ZXN0IHBy
ZXNlbnQgaW4gdGhpcyB0ZXN0LCBzbyBhZGQgb25lLg0KDQpDYzogS2F0YXJ6eW5hIFBpZWNpZWxz
a2EgPGthdGFyenluYS5waWVjaWVsc2thQGludGVsLmNvbT4NCkNjOiBNYXVybyBDYXJ2YWxobyBD
aGVoYWIgPG1jaGVoYWJAa2VybmVsLm9yZz4NClNpZ25lZC1vZmYtYnk6IEthbWlsIEtvbmllY3pu
eSA8a2FtaWwua29uaWVjem55QGxpbnV4LmludGVsLmNvbT4NCi0tLQ0KIHRlc3RzL2ludGVsL3hl
X3N5c2ZzX2RlZmF1bHRzLmMgfCAxICsNCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykN
Cg0KZGlmZiAtLWdpdCBhL3Rlc3RzL2ludGVsL3hlX3N5c2ZzX2RlZmF1bHRzLmMgYi90ZXN0cy9p
bnRlbC94ZV9zeXNmc19kZWZhdWx0cy5jIGluZGV4IDVjNWRiNzFhNC4uZGQ5NzVjNWJiIDEwMDY0
NA0KLS0tIGEvdGVzdHMvaW50ZWwveGVfc3lzZnNfZGVmYXVsdHMuYw0KKysrIGIvdGVzdHMvaW50
ZWwveGVfc3lzZnNfZGVmYXVsdHMuYw0KQEAgLTEzLDYgKzEzLDcgQEANCiAgKiBUZXN0IGNhdGVn
b3J5OiBmdW5jdGlvbmFsaXR5IHRlc3QNCiAgKg0KICAqIFNVQlRFU1Q6IGVuZ2luZS1kZWZhdWx0
cw0KKyAqIERlc2NyaXB0aW9uOiBjaGVjayBlYWNoIGVuZ2luZSBkZWZhdWx0cyBpbiBzeXNmcy4N
CiAgKi8NCiANCiAjaW5jbHVkZSA8ZGlyZW50Lmg+DQotLQ0KMi40Mi4wDQoNCg==
