Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24A76CE8D6B
	for <igt-dev@archiver.kernel.org>; Mon, 17 Nov 2025 20:40:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BC0910E076;
	Mon, 17 Nov 2025 20:40:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EP8Qbmea";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C67610E076
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Nov 2025 20:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763412008; x=1794948008;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=bokCaUbzdGJ6OlLNYQleOxZAtjflov88aKztEP4OQJE=;
 b=EP8Qbmea9a+kPfTbmh4msulJ54eXPTVTIB1UbyY69YDAnDlrNgAQXG+G
 x1wvaDLX6ZeyLTUvllq9wogg6L+ooQsAsk/nTivugoI4XP40iDOQa1vuW
 tXXDmVd+3Ro3Fmb9Y+LN/6r/N6maSY5tQEBe00rHyE7Tjl7yIC/27Qf4x
 21pNNroWkbfiRK9fgQZkiBpiGWB0YwVouWw212Z57wmzj6/+UfWqQAKgg
 AvmnOp5ShD6m3RuJoyDmDiDRkgNMGIXzT1tdCZCV2e/wQjuulhu2RlM6r
 DBapET5639+SbznCJfrnWIR3QhCc0dZM6hRHV2cwimCNa11p1SV0awjw7 w==;
X-CSE-ConnectionGUID: 1mHf16YgRnCciu1m/eUzcg==
X-CSE-MsgGUID: iKjg6cnbTg2luWwghASi+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="65462342"
X-IronPort-AV: E=Sophos;i="6.19,312,1754982000"; d="scan'208";a="65462342"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 12:40:08 -0800
X-CSE-ConnectionGUID: Jh8LZT+GQUyTlAAPs0aOQw==
X-CSE-MsgGUID: s332nR9YT9Cuh2hWPG8/0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,312,1754982000"; d="scan'208";a="190783473"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 12:40:07 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 12:40:07 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 17 Nov 2025 12:40:07 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.25) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 12:40:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w6w6zEgcezhrxYh9chU/bP6GxLwb+uQDa4cGINCRIdudDhxwTu5/gDLhsOGA++XB4JLlnaN2y4619aUYD1Hc56SG1TMYb9rLvRS66SYgiQ/Z5UNyoGOubRZXlTBdM6LqtKy5aokHfjVaxUnGoGrzttRD3xfQoTYT2lWM9g3kNOV5Q6l+JWW2KzkreJthlx7pTAVbBLnTnIlfd+gkjgd6cTmougIOSL1tv1nqaue3ogXH5gNADeeoxJ0T/+Gn/ZEy9QFRiSll4XAbACavXDya7CoMVR/4D4MyrdZHZhTWfVMTcroXoivhH5r+SZatt69Vjnk3dTp/vhUnKxHeIfwwfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bokCaUbzdGJ6OlLNYQleOxZAtjflov88aKztEP4OQJE=;
 b=DIYBpp8hOybqlog8LDt3xpc3bIqANuLIRMod66HNQbedUNGTJQ0hJy6Lz/IRb0R1ZALtWMijsBmxlXkk/mqnjSozddchgvr4ttVnc3HGqhvueCwlY5WKsldRywWr39P9pUg5r06zRJoPhVBrtN9jwlHdAU7Jo9bsOPmLmUNPy4ZR1WyEhrMLkdiclLyt7uC21VrEHmz3vMs/KrO9JJa2yH0PS1NBfKCaZT8hLhDLumWAmzp9MdQqGW/R1VtgxbRAXgrIG3BoRCJh10rNrZ7yZPu2alRFBbXhyQw4vTQP3A8tKOZiUvxQtqDb0HsUVIU8QSQsgf/YDxVGOwB5smFecg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7733.namprd11.prod.outlook.com (2603:10b6:8:dc::19) by
 DS0PR11MB8666.namprd11.prod.outlook.com (2603:10b6:8:1bd::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.15; Mon, 17 Nov 2025 20:40:02 +0000
Received: from DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::41a9:1573:32ad:202c]) by DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::41a9:1573:32ad:202c%6]) with mapi id 15.20.9320.013; Mon, 17 Nov 2025
 20:40:01 +0000
From: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Sharma, 
 Nishit" <nishit.sharma@intel.com>
Subject: Re: [PATCH i-g-t v7 03/10] tests/intel/xe_multi_gpusvm: Add SVM
 multi-GPU cross-GPU memory access test
Thread-Topic: [PATCH i-g-t v7 03/10] tests/intel/xe_multi_gpusvm: Add SVM
 multi-GPU cross-GPU memory access test
Thread-Index: AQHcVLs7PXB6Ut9aKk662V3pJBhG5rT22roAgAAvN4CAAFFIAA==
Date: Mon, 17 Nov 2025 20:40:01 +0000
Message-ID: <a13b4524d3cabb04cdf847d53287c6f453a2c718.camel@intel.com>
References: <20251113163308.633818-1-nishit.sharma@intel.com>
 <20251113163308.633818-4-nishit.sharma@intel.com>
 <63c6659ae13e5d46c9ed65dbdc9cfbed1d26c363.camel@intel.com>
 <3f2239f2-1608-4343-808e-3acd60cd7545@intel.com>
In-Reply-To: <3f2239f2-1608-4343-808e-3acd60cd7545@intel.com>
Accept-Language: en-SE, en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.54.3 (3.54.3-2.fc41) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7733:EE_|DS0PR11MB8666:EE_
x-ms-office365-filtering-correlation-id: 05059c08-cbd1-4404-e834-08de26197b59
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|10070799003|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?VVBBVkxnRURUZmdTU045N1RPOHB2UmtROHY4aU1tU1Z5WC9lT2krMHBFMHNU?=
 =?utf-8?B?Mkkwb0ZDNlRla1h2R2tSblBQSTRqaU0rN2lKQjcrVVNvdUFGSmdIdm00bk8w?=
 =?utf-8?B?S2YxZm9PSytwRmNNRXVnRVBpQmN5Q3hVaUVLRHJGeDJnUDBGdThUMGNrSjhw?=
 =?utf-8?B?NkVIaXUrWkVqeEZOOVY2N1h3d09aa01ZbHZGY21Cb2JqaWpLZ1JGR2NmOGRJ?=
 =?utf-8?B?UkJwSEl4NlRKOUdEc25kWFR0VlFKN0ovWHlpeStZVGlicytSYTlmK0ZYMVZu?=
 =?utf-8?B?ZldYYXZjTWxxSXNWeWE3MFFOQ2YxL2h6bndIYnMrVk5acmFSdlBpUGJVQk03?=
 =?utf-8?B?VFRRTzd0U21yNWpScEQ4RkJ2RUtYclQybEVuM1dCZ0JvV3pjNWhlSDFhbnJz?=
 =?utf-8?B?SGRXNldWNzFtUTFoR2hKZnVvRnFrS0pHRDFDQnJ2RWxNYWJGZERsd1ZPbGIx?=
 =?utf-8?B?NUVZeDB3Tkh5QkpTeUR0OVJCdEw0ZkZNYTJzQUhwK21NS1h6V2ZLV0I3R3pK?=
 =?utf-8?B?N05VVkJNNTRwbXA5cHh5ait0N2UvaHRFVGlUdVMwVHZPUTdKNWVtNWZ5RG4w?=
 =?utf-8?B?dXRXMVVMd2VxTENMTXBmQ1U1cHNpWFBrS2YrcnlidGFyTmFQQ1AxVEtNU3kr?=
 =?utf-8?B?NnZkU1FzejQxWTRqWXRPU1RpZFI5cmZudEgza0FvWUcxenZ1SmV0WWhYQTRh?=
 =?utf-8?B?VVBrZ0lrSmlscE1RNlFISEZOT1lLYkt3dTlPOG5BMlBMU1cvV3YvZjNmblJm?=
 =?utf-8?B?VVUvcWlZYXZYMGMyWVMvREh2SHlXU0NiM3VzZWtVL1N6WXcxTEFUR1l0YjJj?=
 =?utf-8?B?UWg3ekNGNE91aE1OaDdlbDc3OWNkMkZKTTJZcExTbE03NTZpRHA1WjY1dDR3?=
 =?utf-8?B?bmJXTDFGd2xvWGk5bUJjY3dHeVhQSUxveG9iUGdMZWxSUzY0TXR4SGs4SXUx?=
 =?utf-8?B?bzJ6d0hCWXZ2SWs5MVJFR3QyRFFOK3lWSjQ2Q1Vid2JpTjlVZTFKTWxwNTdw?=
 =?utf-8?B?Ymo2MTh1VldGV2o5M3VVcStKMjh4TW5OblE0a0d1UkZCWGZ6ZDNPUnkySGIv?=
 =?utf-8?B?dXBVZ2cwT1JqZnB4K2FoMWdrZGdCSFV2a2VybE5uaWtWSUxtTVVGMmhkaHVF?=
 =?utf-8?B?UmUrNnJVRXMwYlFybDIxbXc1UFNPYi9ZK1BYZjRjTDloN0s5a1YvYlRudGNw?=
 =?utf-8?B?TFJSVEMvY2NYNS9mU0VQQXl0ZWMrdHFHdHRFT05LU2JDajB2NFQwVjJxdzRU?=
 =?utf-8?B?K05iWjIzZk05bVJWY1FiVkVMNFR0SEpSbXo4Vko0dTl0bjVQNEpycDdvUFd0?=
 =?utf-8?B?ZFhkQzlubVg3RzMwY1NCSXArQmpIQk9DUHVFNEdoQ1VGVUo0UGZLc2JSSXRC?=
 =?utf-8?B?NEZBRnhiUEM4MHRjY3dWektPTnF4QnZkZXAySS9zTGRKSmhPSGVvNEs4ZHFI?=
 =?utf-8?B?dWE4RWsvZlpVQWViUUJDOWVmSTFVQjZTQU53SXIzWllMNWlLNHpqc3hWSEpZ?=
 =?utf-8?B?MCttcWUzMXNIdDJxVno4a0YyWEQ5RXZ3dlU5cjRoWjZIWDloU2diTEs5eDg0?=
 =?utf-8?B?ZWNtRXVzNzZMaGxXVzVhb3ZRS3Z6YnozbGRzT0NjRnRKV0ZrcDQ2Yk5QM093?=
 =?utf-8?B?VVRubWlKK3d6ZUk0NDRtWFVUVS9nblVYRTJCNzY4bUw3MjRlOXlRWDA3U3h1?=
 =?utf-8?B?b1BZZmVTd0pZZmtBRkdvdjAwUlBUQjRYV0JIay9qcHgxY0FycUpzYWRkN1o0?=
 =?utf-8?B?V1U2S0I2OTZmdmJnRTRtaGVjbUtwUXBDREtSbzkveEcvN1lXdElqeDFoRHB3?=
 =?utf-8?B?aFBacW03Sis3bmNHVCt6elRaUWFDMFljOXdJMjdtRDdpVW16UzAzNno5TGJX?=
 =?utf-8?B?WWRiajM0UjJFRDR5Rktybk5jZURIWmU3MGdxNmY2aWZadStuQmNYODNndDRs?=
 =?utf-8?B?Q2xOT2g5Y3h4TUY2Tkh4REtFRzlab21Ca1Q2RlZSRjdzLzNsMGJtQ3lLOVdX?=
 =?utf-8?B?U29YVUd3TjIvdWhTVis2K1JPcGtqZXFSMGwwdzNmQktnZ084NzBKWFpSR2ox?=
 =?utf-8?Q?dET6KT?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7733.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(10070799003)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Sm56VnFWMmNQL1d1WWozeHp3MXU3ZjJpMGI5TlBuamRMallacnBtb2djUVdG?=
 =?utf-8?B?OUFPUlhUVml3cFhOQkFRK3ZMa2lSUEdrMzQyajBVOEtpa0dxS3RhelByV3Nq?=
 =?utf-8?B?MVFHRGpRemxYellZU2NnNDJIMVRKS05YSWRoMSs0Q2JmaGFlTk50SVpXWHZL?=
 =?utf-8?B?ZWFXTytDd0MzajNWdlpDYzAyeEdMWXFlZkxweEMwMERrL25NRWhxRVRYbTRU?=
 =?utf-8?B?QXhPcGNNaE12QkpDLy9jR3FRelp0THovN3RpNDNZZDJwR3BGbmp5R1FqZUM0?=
 =?utf-8?B?SEpvbTRzMUhZQ2V5M3FJanlaWFA3R2kvVFlQMHd2UWEvVG1TYmhTQU81dVhF?=
 =?utf-8?B?UlI5L081ekpLNVZndUdHYlMrOFp5SHpDWnlHeVRESUZ6MDFoS2hIY2xpOVdC?=
 =?utf-8?B?RzNmeEpUZ0pmRnFvQnNUNitTeGVtbjB6OUhuYWxNdzQ2b2kyV3VSU0JLNmkw?=
 =?utf-8?B?K0xUZDZCaTZWamg3Y24xZDEraEJWY01rblFEcVoway9uTk1tdkNPN3hiRHNS?=
 =?utf-8?B?Y3k0NHJ5aTZuQVM0elF3aFk5WTc0WnROU2ZRQngrcWNISnNPTy9IVUE0Wlpw?=
 =?utf-8?B?WFE4WDhyNmtPUFN0dThWOXczUlJ5UTNWVTc1ZjJULzd0Z1RoeTBiT0dBY0lt?=
 =?utf-8?B?SUN4WVRxUWxqWW0rSDJ1TXBFTTJMNVduL21MRTlWejYycDAwVjB4MjRQcXFh?=
 =?utf-8?B?SDBldjJqNjNnTXVORWdBU2VZNUtJU3Y5MkpOTHFMNFM1RUp3eUNMSEgwb1F3?=
 =?utf-8?B?aDVIYk9FbXBPYlpWLzZ4ZkI3Y2s2Q1daeEp2L290TUZMdEpraVlmVFRrTktX?=
 =?utf-8?B?SC9SckcxSEV2L1cxNGpWaGtTRGNTUVB0VC9HWERqTGZoTTZpZVpSSjlNVUNF?=
 =?utf-8?B?NzhVRGZSbkNBeEUyWWhkUEd3NEtMVHEybllQM2dFbTdobG1LeHFVTzhneXB6?=
 =?utf-8?B?elFRWVV1RlhXdlF1QndvV0dPK29PeWg5OE1yOW5UcWpJRU44VDZWVWQwMHFq?=
 =?utf-8?B?Rnova1B0bUl1akZsQW94WTRUeisvc0l0dVpVMzYwMDduRGUxVnN4QTU4UWJq?=
 =?utf-8?B?ZlE0NGJyV1ZlLyt1VkFlWGFYSUMxTW0xWm1MWE50aXdvL3RsRXk4M0RJN0VE?=
 =?utf-8?B?VEdkSTUxRWhvektVSlZrdlFHdWZCQUxBb0ZrNkl3SERzWjFhV3pkdWVDaVBv?=
 =?utf-8?B?N0d1SlVucUd2TnBIM2ZsQ09vQzV3d2EvR3NiNFY1bTVTQUgvQXJYckxQRTRP?=
 =?utf-8?B?cXlkbVMvR3Qvd3hmZ0ZpU2ZCaWZQTVBBMVpQT29oYVFoTndHa0NVVlJXSlRv?=
 =?utf-8?B?UDBScHR2UERPOWZZV2RpNUJEdU1OVWJlT201N3dYQjFsaWprcURuMzJlaE90?=
 =?utf-8?B?NkwraTZvWUNWM0xJcjBKaGoxL20wdnF1cnl1eE1seEZkbkNYZ2lTYjF5MmFP?=
 =?utf-8?B?eFdDa1pLekJONVJKWVlESWFaL3JaVTA1UE9mMnZhNXIwa0xEM1JKanRLVGs5?=
 =?utf-8?B?T0ZmcUFoZ2NJMGFOMmdSZEl2RVgrU3NNRG9hN2phVGc2bmsxc1dOWjhPZ1lT?=
 =?utf-8?B?QmpDdE5zTjU3K1YvVzkwOE9oWmYvVGJheDZwT25MSnpqdDZaYnU3bkgyVi80?=
 =?utf-8?B?cWk3TzZPTGtlSmF6Z0FQaDZmR2RwTWpwcit2ZERsVXg0Q2MweFE4OGhwU0d1?=
 =?utf-8?B?VTlybHIyUE8zY1p0TXlXRXZPWVpPeWd1SDYwc2lOTVpRSU9yMld2TjE3U3pJ?=
 =?utf-8?B?WHBBVk5Yb1pYdy9LTlFEc1Y0ZDNLcjIxUk9XMitHTWpKSEgyRzNieEZ3cTFk?=
 =?utf-8?B?QWlDUFRtZk9oZWpPemQ0eWdFQWI2NUNoM205NlU2V2VwWDVLbU16YVNoTG95?=
 =?utf-8?B?b3dudXBXTWlWMzhtTHAxRjdPTWErdVNkYlA4Z3VuSWtJWHY1MGh2dDVYcXlp?=
 =?utf-8?B?N0NNZXRteld1dE5FdnJSKzRVTXBGOUpwOGZxU2lnZG4yR29IL2h6dHpvNWlK?=
 =?utf-8?B?NmNlbmxGTmhRSjJVaUw3dWtaMUZNWFFDbSttUzBQUW5USjhJL3hGK0tXbHVQ?=
 =?utf-8?B?MG5ZVmFJZUEvdVpQbk42dUpMM0FSMVZJbllYTUNXVmM5cGpSNE1MSW91NlZO?=
 =?utf-8?B?UlFGd2hob3c3bWhOSm5uOEg2RXljdVYyU2FOcmtqWlNhVTZ5UGswODN4L3Zp?=
 =?utf-8?Q?odLOjPh5tiuVsFEmcbAgYxwa6Gdlni6JwwTU2lgGOLpC?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EB7A3802A559524EAF3295C3445F0E12@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7733.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05059c08-cbd1-4404-e834-08de26197b59
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2025 20:40:01.8608 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6Yh3SY1TShs9vsCV+NZ7kUAbKIjMtZPBGPh30SeTGboYdhQ5/4xofWlG44xi9aV8wJPNXPspMm63CGSCfNKCBZey+OC7EqBjUIQlcaRUoRI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8666
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

T24gTW9uLCAyMDI1LTExLTE3IGF0IDIxOjE5ICswNTMwLCBTaGFybWEsIE5pc2hpdCB3cm90ZToN
Cj4gDQo+IE9uIDExLzE3LzIwMjUgNjozMCBQTSwgSGVsbHN0cm9tLCBUaG9tYXMgd3JvdGU6DQo+
ID4gT24gVGh1LCAyMDI1LTExLTEzIGF0IDE2OjMzICswMDAwLCBuaXNoaXQuc2hhcm1hQGludGVs
LmNvbcKgd3JvdGU6DQo+ID4gPiBGcm9tOiBOaXNoaXQgU2hhcm1hIDxuaXNoaXQuc2hhcm1hQGlu
dGVsLmNvbT4NCj4gPiA+IA0KPiA+ID4gVGhpcyB0ZXN0IGFsbG9jYXRlcyBhIGJ1ZmZlciBpbiBT
Vk0sIHdyaXRlcyBkYXRhIHRvIGl0IGZyb20gc3JjDQo+ID4gPiBHUFUgLA0KPiA+ID4gYW5kIHJl
YWRzL3ZlcmlmaWVzDQo+ID4gPiB0aGUgZGF0YSBmcm9tIGRzdCBHUFUuIE9wdGlvbmFsbHksIHRo
ZSBDUFUgYWxzbyByZWFkcyBvciBtb2RpZmllcw0KPiA+ID4gdGhlDQo+ID4gPiBidWZmZXIgYW5k
IGJvdGgNCj4gPiA+IEdQVXMgdmVyaWZ5IHRoZSByZXN1bHRzLCBlbnN1cmluZyBjb3JyZWN0IGNy
b3NzLUdQVSBhbmQgQ1BVDQo+ID4gPiBtZW1vcnkNCj4gPiA+IGFjY2VzcyBpbiBhDQo+ID4gPiBt
dWx0aS1HUFUgZW52aXJvbm1lbnQuDQo+ID4gPiANCj4gPiA+IFNpZ25lZC1vZmYtYnk6IE5pc2hp
dCBTaGFybWEgPG5pc2hpdC5zaGFybWFAaW50ZWwuY29tPg0KPiA+ID4gQWNrZWQtYnk6IFRob21h
cyBIZWxsc3Ryw7ZtIDx0aG9tYXMuaGVsbHN0cm9tQGxpbnV4LmludGVsLmNvbT4NCj4gPiA+IC0t
LQ0KPiA+ID4gwqDCoHRlc3RzL2ludGVsL3hlX211bHRpX2dwdXN2bS5jIHwgMzczDQo+ID4gPiAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ID4gPiDCoMKgdGVzdHMvbWVzb24u
YnVpbGTCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgMSArDQo+ID4gPiDCoMKgMiBmaWxl
cyBjaGFuZ2VkLCAzNzQgaW5zZXJ0aW9ucygrKQ0KPiA+ID4gwqDCoGNyZWF0ZSBtb2RlIDEwMDY0
NCB0ZXN0cy9pbnRlbC94ZV9tdWx0aV9ncHVzdm0uYw0KPiA+ID4gDQo+ID4gPiBkaWZmIC0tZ2l0
IGEvdGVzdHMvaW50ZWwveGVfbXVsdGlfZ3B1c3ZtLmMNCj4gPiA+IGIvdGVzdHMvaW50ZWwveGVf
bXVsdGlfZ3B1c3ZtLmMNCj4gPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4gPiBpbmRleCAw
MDAwMDAwMDAuLjY2MTRlYTNkMQ0KPiA+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ID4gKysrIGIvdGVz
dHMvaW50ZWwveGVfbXVsdGlfZ3B1c3ZtLmMNCj4gPiA+IEBAIC0wLDAgKzEsMzczIEBADQo+ID4g
PiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IE1JVA0KPiA+ID4gKy8qDQo+ID4gPiArICog
Q29weXJpZ2h0IMKpIDIwMjMgSW50ZWwgQ29ycG9yYXRpb24NCj4gPiA+ICsgKi8NCj4gPiA+ICsN
Cj4gPiA+ICsjaW5jbHVkZSA8dW5pc3RkLmg+DQo+ID4gPiArDQo+ID4gPiArI2luY2x1ZGUgImRy
bXRlc3QuaCINCj4gPiA+ICsjaW5jbHVkZSAiaWd0LmgiDQo+ID4gPiArI2luY2x1ZGUgImlndF9t
dWx0aWdwdS5oIg0KPiA+ID4gKw0KPiA+ID4gKyNpbmNsdWRlICJpbnRlbF9ibHQuaCINCj4gPiA+
ICsjaW5jbHVkZSAiaW50ZWxfbW9jcy5oIg0KPiA+ID4gKyNpbmNsdWRlICJpbnRlbF9yZWcuaCIN
Cj4gPiA+ICsNCj4gPiA+ICsjaW5jbHVkZSAieGUveGVfaW9jdGwuaCINCj4gPiA+ICsjaW5jbHVk
ZSAieGUveGVfcXVlcnkuaCINCj4gPiA+ICsjaW5jbHVkZSAieGUveGVfdXRpbC5oIg0KPiA+ID4g
Kw0KPiA+ID4gKy8qKg0KPiA+ID4gKyAqIFRFU1Q6IEJhc2ljIG11bHRpLWdwdSBTVk0gdGVzdGlu
Zw0KPiA+ID4gKyAqIENhdGVnb3J5OiBTVk0NCj4gPiA+ICsgKiBNZWdhIGZlYXR1cmU6IENvbXB1
dGUNCj4gPiA+ICsgKiBTdWItY2F0ZWdvcnk6IENvbXB1dGUgdGVzdHMNCj4gPiA+ICsgKiBGdW5j
dGlvbmFsaXR5OiBTVk0gcDJwIGFjY2VzcywgbWFkdmlzZSBhbmQgcHJlZmV0Y2guDQo+ID4gPiAr
ICogVGVzdCBjYXRlZ29yeTogZnVuY3Rpb25hbGl0eSB0ZXN0DQo+ID4gPiArICoNCj4gPiA+ICsg
KiBTVUJURVNUOiBjcm9zcy1ncHUtbWVtLWFjY2Vzcw0KPiA+ID4gKyAqIERlc2NyaXB0aW9uOg0K
PiA+ID4gKyAqwqDCoMKgwqDCoCBUaGlzIHRlc3QgY3JlYXRlcyB0d28gbWFsbG9jZWQgcmVnaW9u
cywgcGxhY2VzIHRoZQ0KPiA+ID4gZGVzdGluYXRpb24NCj4gPiA+ICsgKsKgwqDCoMKgwqAgcmVn
aW9uIGJvdGggcmVtb3RlbHkgYW5kIGxvY2FsbHkgYW5kIGNvcGllcyB0byBpdC4gUmVhZHMNCj4g
PiA+IGJhY2sgdG8NCj4gPiA+ICsgKsKgwqDCoMKgwqAgc3lzdGVtIG1lbW9yeSBhbmQgY2hlY2tz
IHRoZSByZXN1bHQuDQo+ID4gPiArICoNCj4gPiA+ICsgKi8NCj4gPiA+ICsNCj4gPiA+ICsjZGVm
aW5lIE1BWF9YRV9SRUdJT05TCTgNCj4gPiA+ICsjZGVmaW5lIE1BWF9YRV9HUFVTIDgNCj4gPiA+
ICsjZGVmaW5lIE5VTV9MT09QUyAxDQo+ID4gPiArI2RlZmluZSBCQVRDSF9TSVpFKF9mZCkgQUxJ
R04oU1pfOEssDQo+ID4gPiB4ZV9nZXRfZGVmYXVsdF9hbGlnbm1lbnQoX2ZkKSkNCj4gPiA+ICsj
ZGVmaW5lIEJJTkRfU1lOQ19WQUwgMHg2ODY4NjgNCj4gPiA+ICsjZGVmaW5lIEVYRUNfU1lOQ19W
QUwgMHg2NzY3NjcNCj4gPiA+ICsjZGVmaW5lIENPUFlfU0laRSBTWl82NE0NCj4gPiA+ICsNCj4g
PiA+ICtzdHJ1Y3QgeGVfc3ZtX2dwdV9pbmZvIHsNCj4gPiA+ICsJYm9vbCBzdXBwb3J0c19mYXVs
dHM7DQo+ID4gPiArCWludCB2cmFtX3JlZ2lvbnNbTUFYX1hFX1JFR0lPTlNdOw0KPiA+ID4gKwl1
bnNpZ25lZCBpbnQgbnVtX3JlZ2lvbnM7DQo+ID4gPiArCXVuc2lnbmVkIGludCB2YV9iaXRzOw0K
PiA+ID4gKwlpbnQgZmQ7DQo+ID4gPiArfTsNCj4gPiA+ICsNCj4gPiA+ICtzdHJ1Y3QgbXVsdGln
cHVfb3BzX2FyZ3Mgew0KPiA+ID4gKwlib29sIHByZWZldGNoX3JlcTsNCj4gPiA+ICsJYm9vbCBv
cF9tb2Q7DQo+ID4gPiArfTsNCj4gPiA+ICsNCj4gPiA+ICt0eXBlZGVmIHZvaWQgKCpncHVfcGFp
cl9mbikgKA0KPiA+ID4gKwkJc3RydWN0IHhlX3N2bV9ncHVfaW5mbyAqc3JjLA0KPiA+ID4gKwkJ
c3RydWN0IHhlX3N2bV9ncHVfaW5mbyAqZHN0LA0KPiA+ID4gKwkJc3RydWN0IGRybV94ZV9lbmdp
bmVfY2xhc3NfaW5zdGFuY2UgKmVjaSwNCj4gPiA+ICsJCXZvaWQgKmV4dHJhX2FyZ3MNCj4gPiA+
ICspOw0KPiA+ID4gKw0KPiA+ID4gK3N0YXRpYyB2b2lkIGZvcl9lYWNoX2dwdV9wYWlyKGludCBu
dW1fZ3B1cywNCj4gPiA+ICsJCQnCoMKgwqDCoMKgIHN0cnVjdCB4ZV9zdm1fZ3B1X2luZm8gKmdw
dXMsDQo+ID4gPiArCQkJwqDCoMKgwqDCoCBzdHJ1Y3QNCj4gPiA+IGRybV94ZV9lbmdpbmVfY2xh
c3NfaW5zdGFuY2UNCj4gPiA+ICplY2ksDQo+ID4gPiArCQkJwqDCoMKgwqDCoCBncHVfcGFpcl9m
biBmbiwNCj4gPiA+ICsJCQnCoMKgwqDCoMKgIHZvaWQgKmV4dHJhX2FyZ3MpOw0KPiA+ID4gKw0K
PiA+ID4gK3N0YXRpYyB2b2lkIGdwdV9tZW1fYWNjZXNzX3dyYXBwZXIoc3RydWN0IHhlX3N2bV9n
cHVfaW5mbyAqc3JjLA0KPiA+ID4gKwkJCQnCoMKgIHN0cnVjdCB4ZV9zdm1fZ3B1X2luZm8gKmRz
dCwNCj4gPiA+ICsJCQkJwqDCoCBzdHJ1Y3QNCj4gPiA+IGRybV94ZV9lbmdpbmVfY2xhc3NfaW5z
dGFuY2UgKmVjaSwNCj4gPiA+ICsJCQkJwqDCoCB2b2lkICpleHRyYV9hcmdzKTsNCj4gPiA+ICsN
Cj4gPiA+ICtzdGF0aWMgdm9pZCBvcGVuX3BhZ2VtYXBzKGludCBmZCwgc3RydWN0IHhlX3N2bV9n
cHVfaW5mbyAqaW5mbyk7DQo+ID4gPiArDQo+ID4gPiArc3RhdGljIHZvaWQNCj4gPiA+ICtjcmVh
dGVfdm1fYW5kX3F1ZXVlKHN0cnVjdCB4ZV9zdm1fZ3B1X2luZm8gKmdwdSwgc3RydWN0DQo+ID4g
PiBkcm1feGVfZW5naW5lX2NsYXNzX2luc3RhbmNlICplY2ksDQo+ID4gPiArCQnCoMKgwqAgdWlu
dDMyX3QgKnZtLCB1aW50MzJfdCAqZXhlY19xdWV1ZSkNCj4gPiA+ICt7DQo+ID4gPiArCSp2bSA9
IHhlX3ZtX2NyZWF0ZShncHUtPmZkLA0KPiA+ID4gKwkJCcKgwqAgRFJNX1hFX1ZNX0NSRUFURV9G
TEFHX0xSX01PREUgfA0KPiA+ID4gRFJNX1hFX1ZNX0NSRUFURV9GTEFHX0ZBVUxUX01PREUsIDAp
Ow0KPiA+ID4gKwkqZXhlY19xdWV1ZSA9IHhlX2V4ZWNfcXVldWVfY3JlYXRlKGdwdS0+ZmQsICp2
bSwgZWNpLA0KPiA+ID4gMCk7DQo+ID4gPiArCXhlX3ZtX2JpbmRfbHJfc3luYyhncHUtPmZkLCAq
dm0sIDAsIDAsIDAsIDF1bGwgPDwgZ3B1LQ0KPiA+ID4gPiB2YV9iaXRzLA0KPiA+ID4gKwkJCcKg
wqAgRFJNX1hFX1ZNX0JJTkRfRkxBR19DUFVfQUREUl9NSVJST1IpOw0KPiA+ID4gK30NCj4gPiA+
ICsNCj4gPiA+ICtzdGF0aWMgdm9pZA0KPiA+ID4gK3NldHVwX3N5bmMoc3RydWN0IGRybV94ZV9z
eW5jICpzeW5jLCB2b2xhdGlsZSB1aW50NjRfdA0KPiA+ID4gKipzeW5jX2FkZHIsDQo+ID4gPiB1
aW50NjRfdCB0aW1lbGluZV92YWx1ZSkNCj4gPiA+ICt7DQo+ID4gPiArCSpzeW5jX2FkZHIgPSBt
YWxsb2Moc2l6ZW9mKCoqc3luY19hZGRyKSk7DQo+ID4gPiArCWlndF9hc3NlcnQoKnN5bmNfYWRk
cik7DQo+ID4gPiArCXN5bmMtPmZsYWdzID0gRFJNX1hFX1NZTkNfRkxBR19TSUdOQUw7DQo+ID4g
PiArCXN5bmMtPnR5cGUgPSBEUk1fWEVfU1lOQ19UWVBFX1VTRVJfRkVOQ0U7DQo+ID4gPiArCXN5
bmMtPmFkZHIgPSB0b191c2VyX3BvaW50ZXIoKHVpbnQ2NF90ICopKnN5bmNfYWRkcik7DQo+ID4g
PiArCXN5bmMtPnRpbWVsaW5lX3ZhbHVlID0gdGltZWxpbmVfdmFsdWU7DQo+ID4gPiArCSoqc3lu
Y19hZGRyID0gMDsNCj4gPiA+ICt9DQo+ID4gPiArDQo+ID4gPiArc3RhdGljIHZvaWQNCj4gPiA+
ICtjbGVhbnVwX3ZtX2FuZF9xdWV1ZShzdHJ1Y3QgeGVfc3ZtX2dwdV9pbmZvICpncHUsIHVpbnQz
Ml90IHZtLA0KPiA+ID4gdWludDMyX3QgZXhlY19xdWV1ZSkNCj4gPiA+ICt7DQo+ID4gPiArCXhl
X3ZtX3VuYmluZF9scl9zeW5jKGdwdS0+ZmQsIHZtLCAwLCAwLCAxdWxsIDw8IGdwdS0NCj4gPiA+
ID4gdmFfYml0cyk7DQo+ID4gPiArCXhlX2V4ZWNfcXVldWVfZGVzdHJveShncHUtPmZkLCBleGVj
X3F1ZXVlKTsNCj4gPiA+ICsJeGVfdm1fZGVzdHJveShncHUtPmZkLCB2bSk7DQo+ID4gPiArfQ0K
PiA+ID4gKw0KPiA+ID4gK3N0YXRpYyB2b2lkIHhlX211bHRpZ3B1X21hZHZpc2UoaW50IHNyY19m
ZCwgdWludDMyX3Qgdm0sDQo+ID4gPiB1aW50NjRfdA0KPiA+ID4gYWRkciwgdWludDY0X3Qgc2l6
ZSwNCj4gPiA+ICsJCQkJdWludDY0X3QgZXh0LCB1aW50MzJfdCB0eXBlLCBpbnQNCj4gPiA+IGRz
dF9mZCwgdWludDE2X3QgcG9saWN5LA0KPiA+ID4gKwkJCQl1aW50MTZfdCBpbnN0YW5jZSwgdWlu
dDMyX3QNCj4gPiA+IGV4ZWNfcXVldWUsIGludCBsb2NhbF9mZCwNCj4gPiA+ICsJCQkJdWludDE2
X3QgbG9jYWxfdnJhbSkNCj4gPiA+ICt7DQo+ID4gPiArCWludCByZXQ7DQo+ID4gPiArDQo+ID4g
PiArI2RlZmluZSBTWVNURU1fTUVNT1JZCTANCj4gPiBQbGVhc2UgdXNlIERSTV9YRV9QUkVGRVJS
RURfTE9DX0RFRkFVTFRfU1lTVEVNLg0KPiA+IEEgbmV3IGRlZmluZSBpc24ndCBuZWNlc3Nhcnkg
YW5kIGl0J3MgYWxzbyBpbmNvcnJlY3QuDQo+IFN1cmUsIHdpbGwgdXNlIHRoYXQgYXQgcmVxdWly
ZWQgcGxhY2VzLg0KPiA+IA0KPiA+ID4gKwlpZiAoc3JjX2ZkICE9IGRzdF9mZCkgew0KPiA+ID4g
KwkJcmV0ID0geGVfdm1fbWFkdmlzZShzcmNfZmQsIHZtLCBhZGRyLCBzaXplLCBleHQsDQo+ID4g
PiB0eXBlLCBkc3RfZmQsIHBvbGljeSwgaW5zdGFuY2UpOw0KPiA+ID4gKwkJaWYgKHJldCA9PSAt
RU5PTElOSykgew0KPiA+ID4gKwkJCWlndF9pbmZvKCJObyBmYXN0IGludGVyY29ubmVjdCBiZXR3
ZWVuDQo+ID4gPiBHUFUwDQo+ID4gPiBhbmQgR1BVMSwgZmFsbGluZyBiYWNrIHRvIGxvY2FsIFZS
QU1cbiIpOw0KPiA+ID4gKwkJCXJldCA9IHhlX3ZtX21hZHZpc2Uoc3JjX2ZkLCB2bSwgYWRkciwN
Cj4gPiA+IHNpemUsDQo+ID4gPiBleHQsIHR5cGUsIGxvY2FsX2ZkLA0KPiA+ID4gKwkJCQkJwqDC
oMKgIHBvbGljeSwgbG9jYWxfdnJhbSk7DQo+ID4gUGxlYXNlIHVzZSBEUk1fWEVfUFJFRkVSUkVE
X0xPQ19ERUZBVUxUX0RFVklDRQ0KDQpOb3RlIHRoYXQgdGhpcyBhbHNvIG1lYW5zIHlvdSBjYW4g
c2tpcCB0aGUgbGFzdCB0d28gcGFyYW1ldGVycyB0byB0aGUNCmZ1bmN0aW9uIEFGQUlDVC4NCg0K
L1Rob21hcw0KDQo=
