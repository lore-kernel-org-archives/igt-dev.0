Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8736AC3DA4A
	for <igt-dev@archiver.kernel.org>; Mon, 19 Aug 2024 10:10:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 449B710E241;
	Mon, 19 Aug 2024 10:10:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JpPyNyAh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF3C210E240
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Aug 2024 10:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724062247; x=1755598247;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=9fwGYU4AoaIl+vu31+tHFn3kesU7TkFr7GtdQj3ILa4=;
 b=JpPyNyAhBaLvqUluG9AItpGrWOzID9coWWRvOv9OCZYt66wwMTXoa506
 MdU31Q/rvkpLZOlpPcb2kUu3KojdysjDICShZYNEQE/4aWls8jVN1VdZr
 EBIC5oJ5xLAd8FQthz07idcJFDvU4o3DenidUMO4Z1mU/f0PP1gwFoLm6
 ZvktcBdYC/tzY9LnbFqbyd8iuO6DdJex0ilSeIAw2VZvf+Vg7Gk7GWejL
 9m22gg34M8zfwFCYHy/fEczCsXdgKiHVJTSA9OtCcuSpks7B2+pzdenXV
 Bl9Z1sYiXBMPDFomdohZhaCzehGppu+iSQDE0wgGMlWaPxpYlMxNAjTs/ Q==;
X-CSE-ConnectionGUID: Cyq+eln7RrmaX6QHulUlbQ==
X-CSE-MsgGUID: xjYPVl8PQYyCI7AmJaBYLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11168"; a="22458905"
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; d="scan'208";a="22458905"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 03:10:47 -0700
X-CSE-ConnectionGUID: +1k7rm3ZRnithg4TZhD4UA==
X-CSE-MsgGUID: TX98Vr73Q6el99P3GEX3ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; d="scan'208";a="60030188"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Aug 2024 03:10:47 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 19 Aug 2024 03:10:46 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 19 Aug 2024 03:10:46 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 19 Aug 2024 03:10:46 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.43) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 19 Aug 2024 03:10:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=msQ993RaQRrOoE4aKS5QIDgys93MhnFoDrKCs7lXenz77xWNm204kp2o6kGl+GtHPeGkQv/0rc2CLYQaIGcK8B29W22vbxiZAnI/7T5xyhJKyEO0ByfkXkkK+DZcCgN2ZKIBB/f59TD5/m6m7SYeKBEP45pZBLRy0tr/O46R2Cs0hBw4x/Q3gA++54V0jTomtDU+sYGKDoEfqlq2lU/Tc6tHxSGBi/moHRIHezRTdjJy4e9pDXcgwyBT0S7N2EUK0Xo5ZErs20cTL0ffaha9kp6O39968ki3Vt3y5ge7at1+nDpoKP1btkxBqYNaXV7c2+u62MPYM7n6N//XE/2gsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9fwGYU4AoaIl+vu31+tHFn3kesU7TkFr7GtdQj3ILa4=;
 b=kOjTBGgpeKvSCLGhcmMq1/+kjqH12K6ODjyMKnOzXvS6ND29hlL+XPMXM7bXP//ATqDwOkXgQNCYfVxHS8y9B18GysFUWny8OAW4ERBxWx9QeBo5ioV7Shn3R9uv4zkknFzVt/e/KZPMHgiySbvvaDLvEU6qj6UPwjmZS3ZU6ngY5/Pb8yPhf5Q831I2HHQjbtqlp1CGFxeXxE0fbFJUiLyGJzdZPzmnCtZSPy23hF8L/6X4cLb78pQVUwR6zSzmTrCWxSCOfCOdQwZ13YQnox8PVz2DF9qjLvImo5g30roo2OYCzfHACn/GdiYY/BWfYyjzy/tijjmsc2nrxVW5Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7864.namprd11.prod.outlook.com (2603:10b6:208:3df::14)
 by IA1PR11MB6515.namprd11.prod.outlook.com (2603:10b6:208:3a1::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.20; Mon, 19 Aug
 2024 10:10:44 +0000
Received: from IA0PR11MB7864.namprd11.prod.outlook.com
 ([fe80::9333:15de:faa8:4cf9]) by IA0PR11MB7864.namprd11.prod.outlook.com
 ([fe80::9333:15de:faa8:4cf9%5]) with mapi id 15.20.7875.019; Mon, 19 Aug 2024
 10:10:44 +0000
From: "Grzegorzek, Dominik" <dominik.grzegorzek@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Manszewski, Christoph" <christoph.manszewski@intel.com>
CC: "Patelczyk, Maciej" <maciej.patelczyk@intel.com>, "Hajda, Andrzej"
 <andrzej.hajda@intel.com>, "Kempczynski, Zbigniew"
 <zbigniew.kempczynski@intel.com>, "Piatkowski, Dominik Karol"
 <dominik.karol.piatkowski@intel.com>, "Sikora, Pawel"
 <pawel.sikora@intel.com>, "Kuoppala, Mika" <mika.kuoppala@intel.com>, "Mun,
 Gwan-gyeong" <gwan-gyeong.mun@intel.com>, "kamil.konieczny@linux.intel.com"
 <kamil.konieczny@linux.intel.com>, Kolanupaka Naveena
 <kolanupaka.naveena@intel.com>
Subject: Re: [PATCH i-g-t v3 09/14] lib/intel_batchbuffer: Add helper to get
 pointer at specified offset
Thread-Topic: [PATCH i-g-t v3 09/14] lib/intel_batchbuffer: Add helper to get
 pointer at specified offset
Thread-Index: AQHa6lkzao7QrGY/Lkq05OUvWylb+LIua2eA
Date: Mon, 19 Aug 2024 10:10:44 +0000
Message-ID: <3bf5f2e4f9edc0d08fd16be6245d2094c7923fdd.camel@intel.com>
References: <20240809123813.109365-1-christoph.manszewski@intel.com>
 <20240809123813.109365-10-christoph.manszewski@intel.com>
In-Reply-To: <20240809123813.109365-10-christoph.manszewski@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7864:EE_|IA1PR11MB6515:EE_
x-ms-office365-filtering-correlation-id: ef85c395-ec5c-4902-153d-08dcc0373004
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?UmhNVGZCZXljMXdKOFBBTDh3VGdmR3VKY2VoR1pUKzMvT0JsNFp3QjBzTmJr?=
 =?utf-8?B?ZjR2YWp0SW5EejZLTkRHeDRPS0NncnhSa1dtdnZmYVlVRlBOM1lMTjk0K3Nx?=
 =?utf-8?B?d2NNaHovTGxHSktaWHNUbmhiN0lkU1h6b3AyU05Sa2h3Y3VMRE15S2lZT2Uz?=
 =?utf-8?B?RTAzbDFPb3U0U2t5ZWFhYm1FM2ZTZWVnMEFWR29wVEVMNzVQbzFCYVJkUE4x?=
 =?utf-8?B?Wm56UkJBNXRSRHRvOXMxL1JRR1pSVklkRG5wcWpxV3V2WDdmdWtEeXRDWVd1?=
 =?utf-8?B?NHJXNTVSRk0xUWszdjY3UUcrdWZ6d0E1UVRNOFp2UGg5TzVtdmtITDZkZUlp?=
 =?utf-8?B?WVR3UjhIcmc0ZEZKandyRmx3KzM5QUwvd2hYMW5sakZzTzMxN0NENDJsOGk3?=
 =?utf-8?B?Y2wzVE5OTGJDdEFZRTB6bWZncHNKU0pnUHpCcDFBVlkxUHRMZEVaaGptTjF4?=
 =?utf-8?B?aDh6eTh0ZGtESUFDcVVlTUlKV0VWdDJjeVlBV214QzNWS3lDNnNRcE40VGZm?=
 =?utf-8?B?UVdJeUZkM0tVRWE3N2Vxb1ArTWlVbVVIMS9adUcyOWFoWkRyMWUvN1d2Vmx5?=
 =?utf-8?B?VkxuakZFcnBPY3ZwaTVUaXF6SzB1ejhOaWRFRjA3WS9xZ2loWmxRT0xhV0p4?=
 =?utf-8?B?eWFSdVFrRHF6SHZsS0ZseEJsdGtaVXJRdWRMQmZxcjd4SE9ESGViNUdzZk9w?=
 =?utf-8?B?V1ZOQmNUNy9DRkxYRUdIMFV6dmhDYkxDcTJmcVFDMU4zMDZCL0E0VzFPRmEv?=
 =?utf-8?B?R1FFTC9uMnJRaEdhcVVjcDRuQlZGQ09ZVXczRU9UaDYzUVB4eEp5aXZxdFhh?=
 =?utf-8?B?ZVhOV0tuZzBxRnJaelVRTkFWdHR3azlOcUxzTzVMQTlvNjNBQUovUnk3S2pr?=
 =?utf-8?B?RVplc2RQdVRzQ2xaVFJaQ2p1a0kweWpvWFJnL3E4dUlhVmhKODBXWXR6TlFa?=
 =?utf-8?B?Mi9YUHQzT2lwRGduUmttbk5ZNE5nSzRLWWhVRkpOS1lDWkV1L085Ly9oZjQ2?=
 =?utf-8?B?Q3hiclJaeFAzV1ZJRDFyQVVySGk4SFZMM2E1eUc4aStBVTRlcllOTEgxclpw?=
 =?utf-8?B?VzVUek94dFdxaFdYNU40b2R6a1p6eHFrM2lObDdQVHlYS0tKaVRKM3pnUmd6?=
 =?utf-8?B?ZlErTW93V1diSUJwaXhCM2wxUHNtRjJHLzEzZVN0RVRiOGZISFk4VEF0OVNr?=
 =?utf-8?B?STRDM3ZseW5tUncya1lrQ2g1RkFpUlpab1pZWFF0dW9GSjQ0QUpTVzBSTnFs?=
 =?utf-8?B?bnJZRUZuWlZyYi9VdG82KzEyekNqZTVWZnJLbERDVWkzbDJqZDBvY1ZvaTRH?=
 =?utf-8?B?QWVxaWJOQmxrUjljTzN3a21ReGFkMldCYjB5UkNXUFNwSm9hSCtLVFBiY0Zi?=
 =?utf-8?B?L2tac3F2RGYxVEd3TFNVT1ljYmovK2V3TlVoZzJCK21RU0pTOXNkL3cxcmx4?=
 =?utf-8?B?YUllVjAyK0xkVTU3dyt1RTl5eTVsUDh3U0dKUGhacElhQkZzU1NUNWZYbXdH?=
 =?utf-8?B?MXduQXBDcktRTkppYzNPR3Niaytrd2p2WlBWNlZ5bFJVdE5QRGVsY25zZ0ZB?=
 =?utf-8?B?bFloOXdCVURlM0hGc2dRZmlqVUM0Zkt5V09ZZ2xrdi92ZzU0cFdnbWtFK3Z0?=
 =?utf-8?B?TFhFWXRDbVlXYnp5emNRQkVZMHVIbExiTnV0c3EwR1R6UGVKU2lTY2ZFSUI0?=
 =?utf-8?B?MlQ2NEhyL2NYd0tnUk1zcDkxVkJFYjEvclVPWDdQMEdHTE5NdHZnaHczckls?=
 =?utf-8?B?cnVyWVpYWkFwSVZNZFFHeGExSDBwbFduMUlvQlZrbVFhd2F2QVY1ZWlKZHEx?=
 =?utf-8?B?VE5rYjhOWDVGeWppQzFCc3V6OVRZaWI3azM4WWdKRVRYME80VSt1eFFXVS82?=
 =?utf-8?B?TzFHZ3UxblQvUjgxaW03clRzMndCekh0Rk1HZkF0Nml0M3c9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7864.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TVNTbndiUnNkSXFVYWNMVkdGVHZXMG1LTEdsVjBsVFU3Ty9FT0NNU1dHVXcz?=
 =?utf-8?B?dmtJY25DekRPOS9jRVY0bk1UMU80Z21zRFo4aE9TL2VqYkNGWXpobHl4Tk1R?=
 =?utf-8?B?UDRvbGhkcUdSd3NJVjN5QWNFNjd2T2s1NlJQMDVOVFBPSnZMM3V4Q21XNG9r?=
 =?utf-8?B?MzdwK3NoeHpzRWJSSkx6T2V0Y2VsRlZnSkJEVlFDVCtWdjdsU0hXdGIwT09M?=
 =?utf-8?B?UFdTT0ZaU1lHRlZDNmFDZEJVWWV2N1NQdGZMaVdmNGF3bXFBblVUN1VwdU55?=
 =?utf-8?B?NHZWcGo4R1Z2TkFKU204Q29XWCtvWXFSdnB2OHFkcUhSQkVpSWJoZE5vTm9W?=
 =?utf-8?B?NEZ1b0ZVWm5JVWYxS05UZFZaNW5WNGl1REpNQTBXK3JJd0NNNWlsUTBlTUsw?=
 =?utf-8?B?YzZtdkRaVXVabDkyZXAzVm9pUGw3bXNJZ1A5K3l6dXUzeENlL2VtQjhveTFu?=
 =?utf-8?B?d1VCTFREUWs2VkVEbWNnRHYxQWpxTXNQa25meVBiaFlPMERlSERHcDhvaDYx?=
 =?utf-8?B?TlAvdVp1MStHaW9RYk1qZXVkcWlkc3hUaWFpL09Jbkl6Q2ZjRzNTeWI2dVZv?=
 =?utf-8?B?NmNQTnIyaExiMmVxeGQxUStKODZNYWxpQmN3VkpXdG5xek1jWnFLNDdiRzRa?=
 =?utf-8?B?aWJTcmsyME5hZkJqcVVDWTNHVUVXU0tCTEFOTFpGdGoyZlA4MkVFaExOc3dP?=
 =?utf-8?B?bnpSSlZTM2FWV3pzRkZ0SHhxOGQxaXVvdWFiZjE5bWhoNHR1T2RQUmpLS1Nu?=
 =?utf-8?B?L2hkMGphM252eHdHNTdqUFk2S3NnMTdTMTRoR2lxc3puTGYzbGpCZDRJaTAv?=
 =?utf-8?B?elljM3RJbUhwRzdWR3FZTEVyZnFFZVNEMFNCaUoyZGFvUE5DWnFzR2hGKzRI?=
 =?utf-8?B?dVNiR1pRckhWeS9pb2FycE91L2hUK2NVNkIvNlJ0YzlSNzcybkxhOUhnb1FZ?=
 =?utf-8?B?TTJQS0ZUSFN0TWpXNlRkZGY0TW5UZ09hblFnc2JYRHprMnJZdlZvZHFiaUJH?=
 =?utf-8?B?Wjh5YVYvNGo4enZLQWZHbWJYeUppTlJDek1PWm5MU2hCd081Mkt6a1RWdW1O?=
 =?utf-8?B?eGFIdFVtT1JHaG9lNm9rbU1MVnpWS1JTdnpFdjFCMU1zalR4eXlNZEpxdXNa?=
 =?utf-8?B?aXh2RzdScG5CZFhENlBDTDRvRm8yUzk4OEtJWEpOOHBIaksxdVFBdzRSS0RL?=
 =?utf-8?B?a2N2Y3hPVDlsVm1FTWFpL2p0SlZWcDNiOWNTbHcyYVhzRlZsSStCRDBNcSsz?=
 =?utf-8?B?Q3VaaElpWjlDSmZMK2o5WlFlK1ZxUGovM2E3VUJ1OGw1Y0Vvc3ZqbWJzTmtR?=
 =?utf-8?B?SFhqUCtWbXVPMS80czZwQkJRRWg1Ry9qS09USXJ5UlFhY0cyQVRXUFRmT241?=
 =?utf-8?B?TkhWUHVoeVYzUVZBanFjbDRGeTV2QStrR1ZGdU1pZEFiTnFWc2FtMUVMbEVy?=
 =?utf-8?B?eFlsRnd2eDVWOVdxVG9qbWdjUzR0YlppUExHbXlWdmh2Z3ZtdHhMcGVNTkJE?=
 =?utf-8?B?NGdEUWx1aTZReVhpd0NGb1lvTzNHMTRHaG5mZTdNM1dTZmFFcmVJYUJwZmVQ?=
 =?utf-8?B?V2RvQWFocGtqemJwNUdjTFRrRkZETHloZlZWK1hvb0RQT0tTK0ZtS3ljd0c4?=
 =?utf-8?B?R21EUVljajczTG1IR2NEOUpXZHREWnYyTmJ0Zkh5RWFsYmc2N3k5VlRCTVMx?=
 =?utf-8?B?UzdqVCszdkx6STJUOHp4bXdWMmwwL1JMZ1I4QnVrUy96cUZUUy9TbVBkQVIx?=
 =?utf-8?B?QW9sTEhlUTVqTWRad0lOTDMxMDdSWmhQTkMrelc2QXo1YkpvallReHhtN3R5?=
 =?utf-8?B?UnRTUW9uWVNIMmtNUEFlNkJ1MHZRQjhWaHVPeDVMWm9YOGtHaFNKMkxCeVF5?=
 =?utf-8?B?NitEcExlcjRZbG1iTEozcUh5NkNCREtNUjJ6aUNMUWNrVit0aEdvT29rNnYy?=
 =?utf-8?B?aTlyMERjSm9OYUdDcFM0RkhFNndaWEUvMVVFczE0ZGNZbmRpdkZxcnY5TnNz?=
 =?utf-8?B?dFFIY1dsejhSdlJzZWJYVURxZnFUNWI1R0Z2YXJIalIrTGM4REMycXBQUGdx?=
 =?utf-8?B?NnozaUZZMnJJMzBpaE5POFdCMzNZbi9BSEpOMDlLMXZpQVkxZktRekhRTW1y?=
 =?utf-8?B?bjcweHBPYU1Ob2J2QlRsSTVxdk5YZEhYRHBkenBMckp6YWUvWlQrZWlZSmdH?=
 =?utf-8?Q?Uwh8iXa+feEdwJ2a8JkZJwQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <68F2332375742A4A83BD305E088E4D99@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7864.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef85c395-ec5c-4902-153d-08dcc0373004
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2024 10:10:44.0671 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ChPA8qJLHW4Noe8VHQsYLoahXC+rYWBmFfdwnLzS1Bwv7VtDy8zPJm0FT9vd27C1b49LDXF2XRSIrbxfkZm0a8o5wUL+XLtrjHTI0iIl890=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6515
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

T24gRnJpLCAyMDI0LTA4LTA5IGF0IDE0OjM4ICswMjAwLCBDaHJpc3RvcGggTWFuc3pld3NraSB3
cm90ZToNCj4gRnJvbTogQW5kcnplaiBIYWpkYSA8YW5kcnplai5oYWpkYUBpbnRlbC5jb20+DQo+
IA0KPiBUaGUgaGVscGVyIHdpbGwgYmUgdXNlZCB0byBhY2Nlc3MgZGF0YSBwbGFjZWQgaW4gYmF0
Y2hidWZmZXIuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBBbmRyemVqIEhhamRhIDxhbmRyemVqLmhh
amRhQGludGVsLmNvbT4NCj4gQ2M6IE1pa2EgS3VvcHBhbGEgPG1pa2Eua3VvcHBhbGFAaW50ZWwu
Y29tPg0KPiBDYzogRG9taW5payBHcnplZ29yemVrIDxkb21pbmlrLmdyemVnb3J6ZWtAaW50ZWwu
Y29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggTWFuc3pld3NraSA8Y2hyaXN0b3BoLm1h
bnN6ZXdza2lAaW50ZWwuY29tPg0KQWNrZWQtYnk6IERvbWluaWsgR3J6ZWdvcnplayA8ZG9taW5p
ay5ncnplZ29yemVrQGludGVsLmNvbT4NCj4gLS0tDQo+ICBsaWIvaW50ZWxfYmF0Y2hidWZmZXIu
aCB8IDUgKysrKysNCj4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykNCj4gDQo+IGRp
ZmYgLS1naXQgYS9saWIvaW50ZWxfYmF0Y2hidWZmZXIuaCBiL2xpYi9pbnRlbF9iYXRjaGJ1ZmZl
ci5oDQo+IGluZGV4IGNiMzIyMDZlNS4uN2NhZjZjNTE4IDEwMDY0NA0KPiAtLS0gYS9saWIvaW50
ZWxfYmF0Y2hidWZmZXIuaA0KPiArKysgYi9saWIvaW50ZWxfYmF0Y2hidWZmZXIuaA0KPiBAQCAt
MzUzLDYgKzM1MywxMSBAQCBzdGF0aWMgaW5saW5lIHVpbnQzMl90IGludGVsX2JiX29mZnNldChz
dHJ1Y3QgaW50ZWxfYmIgKmliYikNCj4gIAlyZXR1cm4gKHVpbnQzMl90KSAoKHVpbnQ4X3QgKikg
aWJiLT5wdHIgLSAodWludDhfdCAqKSBpYmItPmJhdGNoKTsNCj4gIH0NCj4gIA0KPiArc3RhdGlj
IGlubGluZSB2b2lkICppbnRlbF9iYl9wdHJfZ2V0KHN0cnVjdCBpbnRlbF9iYiAqaWJiLCB1aW50
MzJfdCBvZmZzZXQpDQo+ICt7DQo+ICsJcmV0dXJuICgodWludDhfdCAqKSBpYmItPmJhdGNoICsg
b2Zmc2V0KTsNCj4gK30NCj4gKw0KPiAgc3RhdGljIGlubGluZSB2b2lkIGludGVsX2JiX3B0cl9z
ZXQoc3RydWN0IGludGVsX2JiICppYmIsIHVpbnQzMl90IG9mZnNldCkNCj4gIHsNCj4gIAlpYmIt
PnB0ciA9ICh2b2lkICopICgodWludDhfdCAqKSBpYmItPmJhdGNoICsgb2Zmc2V0KTsNCg0K
