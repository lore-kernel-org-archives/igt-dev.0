Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AFE4D68BDC
	for <igt-dev@archiver.kernel.org>; Fri, 15 Nov 2024 23:42:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D59BA10E3CD;
	Fri, 15 Nov 2024 23:42:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lkEeJfka";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2C4710E3CD
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Nov 2024 23:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731714146; x=1763250146;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=Icmgcv5maqK8R06NIdUqKN2/I1cKyUDRtSbU6X/L1kY=;
 b=lkEeJfkaceO5yS1mD344AtO46bLAaNDwnzGocB7Qya7f9jq6F+OwelL3
 MxbJKOFatfsKSEY9XW0XDcOtMss6re72Cjy5ItrjXFUe+VY3beTwig46q
 5fVdidpSUhnxvL1Wve8hSSaIO/A50U7iIFCTCuoBTN+rHuVfM8vFbhSVJ
 bVvTRpmYOihcR+mkeAyZ20rwYkCer9e3gX0WH2TDrxCJ1p3a3hCW8wOtC
 u7LPQCGX4OUYxMdXhRXX3su9M91HgE0Fmek2bL/wa4ibgPH+UNksrJEYB
 Uf3TREkzMbbF35T+CjOaTGFtp3OQ8/MxRnzjh0OrzdctYQojR7GH78NK/ A==;
X-CSE-ConnectionGUID: Un7LwJLoRfGl1YqjNTIWDg==
X-CSE-MsgGUID: J1usctfASXWT1ViyGG/85A==
X-IronPort-AV: E=McAfee;i="6700,10204,11257"; a="31874778"
X-IronPort-AV: E=Sophos;i="6.12,158,1728975600"; d="scan'208";a="31874778"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2024 15:42:26 -0800
X-CSE-ConnectionGUID: NQP0sQTARne/Sh0FrYDo7g==
X-CSE-MsgGUID: Zov4VWDFQwODhqAERsOVhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,158,1728975600"; d="scan'208";a="93154506"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Nov 2024 15:42:25 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 15 Nov 2024 15:42:25 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 15 Nov 2024 15:42:25 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 15 Nov 2024 15:42:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tKr5d3rdmKRRNKEeM4/0CMryOcwop9Vl0xFu0ClZqb46HhDj2IaWK8m2aDVng4qBweXKBgTNmlqz1G69kWvIAVBJQ0Jqh8PLg5Q8bLsknGnFzFVQf4BFJtf/D5weXY4KmcnrnkCEFIgws/Hc3/nPSIj6POOFdBh0uIKLUDVLRbT7gL98hSnbLq32tag/A3Q4RmOUxASbelUkZTbPk2scibWMqSC8KjnGNsprzy562xRgOU4S0dSvd4hu3q8z7RU1R3IwpJcMPBh8pKH+4QjQw/blhirms/aN4U+l7vBFGFOP7zJoAe+ptPwafLKktmZVhHgsBrSGlzHeXKB0iFWeAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Icmgcv5maqK8R06NIdUqKN2/I1cKyUDRtSbU6X/L1kY=;
 b=Qvekt0ceXCsujbh3BfI1Ii5a7VJ8bYSFz1cID3FIxbFnsgtBrPftKyTpQI6f9GEiyRg4buWZTesW6FMJ9pTXCiXtjsjd6K2MWACwOaH0OX3PDSsYAIwaUIBtJ1d4ggJ6e0ioM3uRum+VRNfDz13aihUCuxKrS5s3Wr5DUTBgQKgSATLUU/8HSsCUbyoHURueRIJFocimQi6RGaoIx/zXnMhs/GpIijXS1m6osT25YZxH0qEfSmnw8Jd+7dzasR6s1pZmDsJbcg0EI3z8/ZVoEzcfnAkPkWvjp2GQvPKm4SzQ5vrrj0MKv08WIdx5JWVpfSrWAr0c30szUW08MlxD0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN0PR11MB5711.namprd11.prod.outlook.com (2603:10b6:408:167::22)
 by SJ0PR11MB5086.namprd11.prod.outlook.com (2603:10b6:a03:2d1::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.19; Fri, 15 Nov
 2024 23:42:17 +0000
Received: from BN0PR11MB5711.namprd11.prod.outlook.com
 ([fe80::4137:d45e:2206:50aa]) by BN0PR11MB5711.namprd11.prod.outlook.com
 ([fe80::4137:d45e:2206:50aa%5]) with mapi id 15.20.8158.019; Fri, 15 Nov 2024
 23:42:17 +0000
From: "Taylor, Clinton A" <clinton.a.taylor@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH i-g-t v3 5/9] XE3: tests/kms_addfb_basic: fix x-tiled
 tests for case when there is no x-tile
Thread-Topic: [PATCH i-g-t v3 5/9] XE3: tests/kms_addfb_basic: fix x-tiled
 tests for case when there is no x-tile
Thread-Index: AQHbNuDtSHuTV8lGhE65gh6RG4t+LLK4V3uAgACqxAA=
Date: Fri, 15 Nov 2024 23:42:17 +0000
Message-ID: <9a959681ca5fad5d62b7d4fa21deadaf3005ac40.camel@intel.com>
References: <20241114190339.3885752-1-clinton.a.taylor@intel.com>
 <20241114190339.3885752-6-clinton.a.taylor@intel.com>
 <20241115133105.o7772oanzhwk2kil@kamilkon-desk.igk.intel.com>
In-Reply-To: <20241115133105.o7772oanzhwk2kil@kamilkon-desk.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR11MB5711:EE_|SJ0PR11MB5086:EE_
x-ms-office365-filtering-correlation-id: 45ecc883-e16c-4c40-51c6-08dd05cf23ba
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?OC9FTGc2OVZObEVDdkdnZkg0M2xIKzJVMW1paHJ3QWpZbWxRM0dSbUVHOTlG?=
 =?utf-8?B?S3NybmpibHcxVm5jQ09ET3luRkFGN29Tbm9BSTN4V0JuUGJwc3E0eWNxd1d4?=
 =?utf-8?B?MzhYNTQ0VFc4MWdOeG44Z3A5d2lVSkhVem81ajlyUHBnVU1aM3R0b3VkNjlB?=
 =?utf-8?B?Wkc2T25sMmdBb2kyY0FVdUlIQmp4VkdqOVRZZ1c2ZS8zYjRESHZFL3VEbVJs?=
 =?utf-8?B?QW1vakloV0VtSEIzdTRtNXRCVDZIL0lGNDcvbHBoN2pRM2pjVWwxNXFTSnNV?=
 =?utf-8?B?bGc0dUxDS2pIVlJuTnFlcmlNV2czblNGenB1c0JuY01Xa0RKMjR2RkFuM01u?=
 =?utf-8?B?clppVk1XWHFkY1haMGRoZXVwLytzaWtsWnVkdFNWL3B5dGlFUGtMb0k0bWQ4?=
 =?utf-8?B?TEtybzRHOVFQSG5NUjJyK2ZVY01nS2Q4UGRhc0IzRVRMSUw0RG1CMlphdnh3?=
 =?utf-8?B?OUg4WjJGdE0yZ002L05yazlyaldYMUxJYlhSZnZ6eSt0YkVBMVpnc0lLNDJH?=
 =?utf-8?B?OGU4Z21ORUVudEsxVXM4OGI3SGhBSVZ0TDk2cWkycUFkbUVKWWdlOTROeEdQ?=
 =?utf-8?B?ano3YTQ1SFEyWEdaZXRuQ01neDFSekVVYkdBbE5iSGpXd2ZFemdUQ1ZoSUh3?=
 =?utf-8?B?WkVuUTlKMWk1UEdPRW9GaSt5ckM0TG9wTWtFNTFQZ3RNT25xSjhScG5OcnVk?=
 =?utf-8?B?TE5wUFBvMWd3VWNISGtrOE8wQkRQdlU5aDVYczl6RnF3S1lSNlRxdC9MQjk1?=
 =?utf-8?B?ODA5S3JvajJhNmJjeHQvbDNpa3ovbldUVGVjK1oxY2c2d0JpN2YwYXZHZmJ4?=
 =?utf-8?B?Z2VmVFpOa281Si93TmdKZ0JDWDBwL3dSMWd0cFkydkZGNHJMWGNLZVpvdkZm?=
 =?utf-8?B?UE5KNjYwamhQeWsvMk5sekhEemwvcGxJSUU1d1F1NllhZUJ6MCtPc1Fxbk8r?=
 =?utf-8?B?RjhCMGsrUmhON2V3OVJ5UmhRcUZ3UnJETURBQmIwK3BqYm1IdllmTkkrMGtX?=
 =?utf-8?B?RzdVdUQ2bEF6amhpczYzbjhiazNsNVNNdC9NTUEzK0JhZ1BEcVQ4R05vNEN6?=
 =?utf-8?B?YUlzMlRRTXBOMi9uWTNyRFFRVFRpMFBrMGdPTy9PUjljV3dhdGlPdTdqTGo1?=
 =?utf-8?B?YVZRaDVQaXJWYm1sanlYcWtlY2ZTSklzUUVBZEs0a1FvZW5zZGJKM1paL0ZU?=
 =?utf-8?B?N3hsNnpxMk1WSDJDZDJyY3lqMlkyQ2NUblZIOG8xUmt2emhURWMxd0dSY0RU?=
 =?utf-8?B?bG15bEtEbXQ2cWlZYlovWlJ4dlU5eTV0R0h4U1J0OXEwblZRNjVWVkx3Yk9Z?=
 =?utf-8?B?aXUzMmd5ZDB3YlVlb0w0c2haNUVyQmNNSnVSSVRSTDdqcGJpRVowQkczakgv?=
 =?utf-8?B?K1ZxeGpQeDFpWHBNNkxlSkZqVGNxamIwdGRiamNwZXlCZzRQckFwNHdNMm1J?=
 =?utf-8?B?d1hFcTBGSXhIWDFabjFkYWZYcTcveWsrNkd3STM1LzYxZ0hXdHNjN05Dc0M3?=
 =?utf-8?B?VGhCcjhiOWptdGZkVVlzclRkUG52eFBqY2pHVVREVldQQ015V0lnS0sxdWtv?=
 =?utf-8?B?YnJGRGVHSkZ5RzlXd3pYODdGUUV3ZHBSbEdBd0pkN0IwUHZEYWdjUndzRWlu?=
 =?utf-8?B?Q3NHZ0VhTDJnUVRvTmMzL0RTSE1aYkhGa1Uwb0kxSHZRMlc1QkNyeGNyS3Qr?=
 =?utf-8?B?Mk1rWjhCUGQwdGtpTTJpejFHZlhpVDJtVnBIdDJpa1QyVTZLd0hIM3FqWVMx?=
 =?utf-8?B?TDlEc29DVTZKa3p2RFRhL1pkSlREbFVLbDdwckVpZk4vWlJYekZjQW9VWTkz?=
 =?utf-8?Q?OBDpmVymA2S1lbo9splPXVtr4y0wHkcnb+KQs=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5711.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UXc1RXN4cHFLRmNLRHJYQmhkOTNKQWRhbzR0Vm5VbitBTmkzRmFuTWJzZitj?=
 =?utf-8?B?T1RLZnQ4TEduOVhwN3UrYktiTWo5R1BadHpKMlc5SERJQ0xFUjVNRlR5WEdz?=
 =?utf-8?B?L05nTFhZakZiMGlteGI3TDdiN2Y0Q25RTmo0ZzR5L0s5NXFYbzI4QmcxbnZv?=
 =?utf-8?B?alB5emJyQzF1dHlCUnRQSEpiZWs0T3pUbFVGMnBRL3JJZEwxV0hUaEo5TWd6?=
 =?utf-8?B?bWJNUDBXSFhkMFpZNTFwM29SSG9NNFByRGs4YXZRSUJLT05xdmdaL3NqVFZF?=
 =?utf-8?B?TkxGNzJ5SlVCMGpYamVPb0lJRGt3TVZuMFFSZm1FMXpDUllBbDJPZkh2OUVi?=
 =?utf-8?B?dXBPNjVQYWt3MWpEaXUzMlBDZFVSYkFyV09jc3R4dkx4SWdCQVFqRGJnQkhU?=
 =?utf-8?B?RzBHazZCQ2JtRWp5akY5L1h6ZVBzR3YyQUxhWjdyNmkwYkJlZXpPeTJ1Tmcz?=
 =?utf-8?B?QjR3YnM2TWpDSjY4MWVCZ1JOYUQ0K3hIcFFWbm9IZ3p6VWNqY3JWYWRiMUZW?=
 =?utf-8?B?eUdoRmU5eDA4MVZCZHFxa2lwbHhlaHpFM1hSYURiU1FFU3Y3d1VnQkFlU2JU?=
 =?utf-8?B?NXVoQzQ3V3dGNnQyalN6bWJHeGwxM0c0cThrTjlITU9qUWxxdVB5Y0VsTkNC?=
 =?utf-8?B?TTVXSjBqRlhiRHFFZUNaSFdRMTZsMTdFMkdMV1VCVlRBTjdMTHlaM1M3WkI4?=
 =?utf-8?B?b2RJbTVreWNPSGtGSmluL1d4QUwyaUJpbzdHWjhIaU5qaXFVK2k0YW1veUtG?=
 =?utf-8?B?Z052YnlHWVhmZTZVbjgyWEMwL1J4K20ra0xJNHozSzlhVUtIakdOU3JESmFB?=
 =?utf-8?B?RitqazFSWFRidVVmSmxUMVZISFNRY2YzOVdGamJDSWRINnBKVXE0dERLS3Ru?=
 =?utf-8?B?eXZqK0RYQkhURzZFckkxZW1JSFhmWHptVTBSY1pDZUZxMVRaL2xyVmR3N0V4?=
 =?utf-8?B?WVJPV05pYmJGNll6NTlYS1pMVFljYzduYjBhTENMVjczUFA5Q041dXkzRWZY?=
 =?utf-8?B?djliK2RnRXJ6cHBCL05RaS9rcVljTkhsSm1zTnJ4ZC9pUm9GWSt4NnB5OHdN?=
 =?utf-8?B?TnJEZ1BGcmI3cXlDNmxGZUhOV1dIRGVKQ1Q4WHNLWE5pclFDVFNPcVhOR254?=
 =?utf-8?B?WlZtVkk5bGR0RUVjY3JxanlCVGl1bHhQUVdJUlZhYzhIenpPNnJ2dWVpUjlE?=
 =?utf-8?B?R0t5aDlwRUtuMHBhSDJUeTU2TmJCL1Z3SVNCQ0NXMUg3SXRNYzVkWlpRVFlO?=
 =?utf-8?B?WlJxK0ZnQ2RHTkVPaFoxdDFIOG5xUkc3RnY0VWsyTy9CNW5oZmFsQWU5Rk1p?=
 =?utf-8?B?c1dCdjF5L3ZhbTVUd3RNeWM4VmpEcmpGb3dFSEdxQW1PcWEwRXRPRktrWkpi?=
 =?utf-8?B?UjNKQ0FhNHVtN1Z6WVJPWjhKenQ0SHFmYjJOaDNwZjBZZzE5YmpqSnYwbHoz?=
 =?utf-8?B?YjZrcDdrK2cxR24yVmxQUnZkY2ZnVEQvc3hNMUtJOHAxRXZGbjZIeGZ3TnZn?=
 =?utf-8?B?MjVUcHpZSGNxcVBWMThkQU1Qa1F0SmhSMld1a0cvVXVFRjNWUnIzR1F1M0RC?=
 =?utf-8?B?aXI1Mmt6ZGdZVHh0elRzL2lWa1Jxa2tMSXJhUTRqSlZBYmF5Y2dVS3dTaTZ6?=
 =?utf-8?B?SitCZmFjbENncXBVK28zMjJVS2IrWnZ2NHp0R2g5Y1VRNnhkaUNjNU5TcXV1?=
 =?utf-8?B?U0hLbXI0WTlmNnRPY0lLT2lNNzV3bTdmSk8zaWFQZDZHbkUwZFJmSVk5enZr?=
 =?utf-8?B?M3dMSnFmS2w3ampXeEdicnlaVXpPTW81ZFRvUjcrNkhRcURLZEVkWHlCZmNw?=
 =?utf-8?B?cXFjc1ZhTHFZY0xjVzNYLzhpRloyR0pWdVNZZXBmU3YvQm0zNldWdDhlM2Ra?=
 =?utf-8?B?VkVVWmE3UTEycDJyL2RmWHhZV3JpazJ6WmNha1NEdUJQMWk0RGUya2kyWmRH?=
 =?utf-8?B?WUNXR0FScHRreVhnRnNybE5mYzJBYXZld0w3cTZOVUh3eHMvSWo1czZKNG9u?=
 =?utf-8?B?aFM2dHBWaHhSRzIyWTlFVHhGb2ZlMkozUnR4Zjd5aWxYQjJpQ2k4WWhnY0dN?=
 =?utf-8?B?QkE4VGZuYzNjSHlQdjdpTUQ1YXV2RWdVcDVrVVZKR2wxQThMOERtd1BTSThJ?=
 =?utf-8?B?TlVVMG9tYzRqVkVnSDI0NkQ0TndacTJsQ2VWVGFucnptRDRWUkhpRFU2K2dp?=
 =?utf-8?B?UXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E619048E67459041A6D3322BF2548E92@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5711.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45ecc883-e16c-4c40-51c6-08dd05cf23ba
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2024 23:42:17.1897 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UeG08utyGkm+ShZASmwZL96tGHZ7FOdFj7Q7270Sdnj2OOWZXm0YcQ3A8R508zjvaWHJlFOtqniMWvmP4IfQdMV3RneSpkmt0mucOWUn33g=
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

T24gRnJpLCAyMDI0LTExLTE1IGF0IDE0OjMxICswMTAwLCBLYW1pbCBLb25pZWN6bnkgd3JvdGU6
DQo+IEhpIENsaW50LA0KPiBPbiAyMDI0LTExLTE0IGF0IDExOjAzOjM1IC0wODAwLCBDbGludCBU
YXlsb3Igd3JvdGU6DQo+ID4gRnJvbTogIkhlaWtraWxhLCBKdWhhLXBla2thIiA8anVoYS1wZWtr
YS5oZWlra2lsYUBpbnRlbC5jb20+DQo+IA0KPiBQbGVhc2UgdXNlIGNvcnJlY3QgbmFtZXMgaGVy
ZSwgaXQgc2hvdWxkIGJlOg0KPiANCj4gPiBGcm9tOiAiSnVoYS1wZWtrYSBIZWlra2lsYSIgPGp1
aGEtcGVra2EuaGVpa2tpbGFAaW50ZWwuY29tPg0KPiA+IE9uIFhlMyBkaXNwbGF5IG5vIG1vcmUg
c3VwcG9ydCB4LXRpbGUgYW5kIHdpbGwgZGlzYWJsZSBzdWNoIGZyYW1lYnVmZmVycw0KPiA+IA0K
PiA+IFNpZ25lZC1vZmYtYnk6IEhlaWtraWxhLCBKdWhhLXBla2thIDxqdWhhLXBla2thLmhlaWtr
aWxhQGludGVsLmNvbT4NCj4gDQo+IGFuZCBoZXJlOg0KPiANCj4gU2lnbmVkLW9mZi1ieTogSnVo
YS1wZWtrYSBIZWlra2lsYSA8anVoYS1wZWtrYS5oZWlra2lsYUBpbnRlbC5jb20+DQo+IA0KPiBQ
bGVhc2UgZG8gdGhlIHNhbWUgY29ycmVjdGlvbnMgaW4gb3RoZXIgcGF0Y2hlcyBpbiB0aGlzIHNl
cmllcy4NCj4gDQogIEkgd2lsbCBhc2sgSlAgaWYgaXQncyBvayB0byBjaGFuZ2UgdGhlIG9yaWdp
bmFsIFNPQiBhbmQgQXV0aG9yIGxpbmVzLiBUaGV5IHdlcmUNCm9yaWdpbmFsbHkgY29tbWl0dGVk
IHRoaXMgd2F5Lg0KDQoNCi1DbGludA0KDQo+IFJlZ2FyZHMsDQo+IEthbWlsDQo+IA0KPiA+IFNp
Z25lZC1vZmYtYnk6IENsaW50IFRheWxvciA8Q2xpbnRvbi5BLlRheWxvckBpbnRlbC5jb20+DQo+
ID4gLS0tDQo+ID4gIHRlc3RzL2ttc19hZGRmYl9iYXNpYy5jIHwgMjIgKysrKysrKysrKysrLS0t
LS0tLS0tLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRp
b25zKC0pDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL3Rlc3RzL2ttc19hZGRmYl9iYXNpYy5jIGIv
dGVzdHMva21zX2FkZGZiX2Jhc2ljLmMNCj4gPiBpbmRleCBiMjI4MTg1OTIuLjNiYTg3MTE3YiAx
MDA2NDQNCj4gPiAtLS0gYS90ZXN0cy9rbXNfYWRkZmJfYmFzaWMuYw0KPiA+ICsrKyBiL3Rlc3Rz
L2ttc19hZGRmYl9iYXNpYy5jDQo+ID4gQEAgLTIxNyw2ICsyMTcsMTIgQEAgc3RhdGljIGludCBs
ZWdhY3lfYWRkZmIoaW50IGZkLCBzdHJ1Y3QgZHJtX21vZGVfZmJfY21kICphcmcpDQo+ID4gIAly
ZXR1cm4gZXJyOw0KPiA+ICB9DQo+ID4gIA0KPiA+ICtzdGF0aWMgaW50IGFkZGZiX2V4cGVjdGVk
X3JldChpZ3RfZGlzcGxheV90ICpkaXNwLCBzdHJ1Y3QgZHJtX21vZGVfZmJfY21kMiAqZikNCj4g
PiArew0KPiA+ICsJcmV0dXJuIGlndF9kaXNwbGF5X2hhc19mb3JtYXRfbW9kKGRpc3AsIGYtPnBp
eGVsX2Zvcm1hdCwNCj4gPiArCQkJCQkgIGYtPm1vZGlmaWVyWzBdKSA/IDAgOiAtMTsNCj4gPiAr
fQ0KPiA+ICsNCj4gPiAgc3RhdGljIHZvaWQgaW52YWxpZF90ZXN0cyhpbnQgZmQpDQo+ID4gIHsN
Cj4gPiAgCXN0cnVjdCBkcm1fbW9kZV9mYl9jbWQyIGYgPSB7fTsNCj4gPiBAQCAtNzM1LDggKzc0
MSwxMCBAQCBzdGF0aWMgdm9pZCBhZGRmYjI1X3Rlc3RzKGludCBmZCkNCj4gPiAgCQlpZ3RfZGVz
Y3JpYmUoIkNoZWNrIGlmIGFkZGZiMiBjYWxsIHdvcmtzIGZvciB4LXRpbGluZyIpOw0KPiA+ICAJ
CWlndF9zdWJ0ZXN0KCJhZGRmYjI1LXgtdGlsZWQtbGVnYWN5Iikgew0KPiA+ICAJCQlmLm1vZGlm
aWVyWzBdID0gSTkxNV9GT1JNQVRfTU9EX1hfVElMRUQ7DQo+ID4gLQkJCWRvX2lvY3RsKGZkLCBE
Uk1fSU9DVExfTU9ERV9BRERGQjIsICZmKTsNCj4gPiAtCQkJZG9faW9jdGwoZmQsIERSTV9JT0NU
TF9NT0RFX1JNRkIsICZmLmZiX2lkKTsNCj4gPiArCQkJaWd0X2Fzc2VydF9lcShkcm1Jb2N0bChm
ZCwgRFJNX0lPQ1RMX01PREVfQURERkIyLCAmZiksDQo+ID4gKwkJCQkgICAgICBhZGRmYl9leHBl
Y3RlZF9yZXQoJmRpc3BsYXksICZmKSk7DQo+ID4gKwkJCWlmICghYWRkZmJfZXhwZWN0ZWRfcmV0
KCZkaXNwbGF5LCAmZikpDQo+ID4gKwkJCQlkb19pb2N0bChmZCwgRFJNX0lPQ1RMX01PREVfUk1G
QiwgJmYuZmJfaWQpOw0KPiA+ICAJCQlmLmZiX2lkID0gMDsNCj4gPiAgCQl9DQo+ID4gIA0KPiA+
IEBAIC03NTYsMTIgKzc2NCw2IEBAIHN0YXRpYyB2b2lkIGFkZGZiMjVfdGVzdHMoaW50IGZkKQ0K
PiA+ICAJCWdlbV9jbG9zZShmZCwgZ2VtX2JvKTsNCj4gPiAgfQ0KPiA+ICANCj4gPiAtc3RhdGlj
IGludCBhZGRmYl9leHBlY3RlZF9yZXQoaWd0X2Rpc3BsYXlfdCAqZGlzcCwgc3RydWN0IGRybV9t
b2RlX2ZiX2NtZDIgKmYpDQo+ID4gLXsNCj4gPiAtCXJldHVybiBpZ3RfZGlzcGxheV9oYXNfZm9y
bWF0X21vZChkaXNwLCBmLT5waXhlbF9mb3JtYXQsDQo+ID4gLQkJCQkJICBmLT5tb2RpZmllclsw
XSkgPyAwIDogLTE7DQo+ID4gLX0NCj4gPiAtDQo+ID4gIHN0YXRpYyB2b2lkIGFkZGZiMjVfeXRp
bGUoaW50IGZkKQ0KPiA+ICB7DQo+ID4gIAlzdHJ1Y3QgZHJtX21vZGVfZmJfY21kMiBmID0ge307
DQo+ID4gQEAgLTEwMTIsOCArMTAxNCw2IEBAIGlndF9tYWluDQo+ID4gIA0KPiA+ICAJbWFzdGVy
X3Rlc3RzKGZkKTsNCj4gPiAgDQo+ID4gLQlhZGRmYjI1X3Rlc3RzKGZkKTsNCj4gPiAtDQo+ID4g
IAl0aWxpbmdfdGVzdHMoZmQpOw0KPiA+ICANCj4gPiAgCWlndF9zdWJ0ZXN0X2dyb3VwIHsNCj4g
PiBAQCAtMTAyNSw2ICsxMDI1LDggQEAgaWd0X21haW4NCj4gPiAgCQlpZ3RfZml4dHVyZQ0KPiA+
ICAJCQlpZ3RfcmVxdWlyZV9pbnRlbChmZCk7DQo+ID4gIA0KPiA+ICsJCWFkZGZiMjVfdGVzdHMo
ZmQpOw0KPiA+ICsNCj4gPiAgCQlhZGRmYjI1X3l0aWxlKGZkKTsNCj4gPiAgDQo+ID4gIAkJYWRk
ZmIyNV80dGlsZShmZCk7DQo+ID4gLS0gDQo+ID4gMi4yNS4xDQo+ID4gDQo=
