Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18419CCFA18
	for <igt-dev@archiver.kernel.org>; Tue, 11 Nov 2025 07:13:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5CBE10E33B;
	Tue, 11 Nov 2025 07:13:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lio18aLs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6610510E33B
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Nov 2025 07:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762845234; x=1794381234;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=jG3DZynxZkZ5MUVvqCam5LPCLw0tHI1qrLYHTS66rso=;
 b=Lio18aLs6cg/u41xurAFLnJizeDhlhYhqbw1VXRfP5c6ppbEIHmTuvwo
 bz5ADsk7nlddm9h5ygTbSZL/LjKvOXJJQVi1zBryG7LfPHX+5Nz2fEamT
 Nf/JsOBSuNojT4luPFhmoPR7WsKncudfOepEKDU93lCjr+YlRCoNWh1gq
 yZlxMccgLqZJP6+vB5QFMDW1obedSW8n5W1Tc9bxEqYLlZPPuV2cxbovt
 YE4tkNaFYSEUIt8u/O76SLwoiHWGxKIMWnCXArUWdV4OV3YgeCXo4AQiZ
 WEhXLJGvVHEAheiSA7XNSfzKGRr5tUXmHZvdW93hrmKasqy1By4V8AWzj A==;
X-CSE-ConnectionGUID: B5oz7eMBRH657zGLhs5Y2A==
X-CSE-MsgGUID: UtdAfl7iSgK6J7LgecOlLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="68752875"
X-IronPort-AV: E=Sophos;i="6.19,295,1754982000"; d="scan'208";a="68752875"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 23:13:53 -0800
X-CSE-ConnectionGUID: UYMuNgxfTgugJ+SIu08DNw==
X-CSE-MsgGUID: d5bu6z3QRwyW7I3laoMBmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,295,1754982000"; d="scan'208";a="194080043"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 23:13:53 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 23:13:52 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 10 Nov 2025 23:13:52 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.67)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 23:13:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JvQkWMG9KPrPZBwfqVt4FiQU7tKuSVua2kmyH4S/b9eTPk6zPDwTSlPltxaZSvXqQwt7WtMskN6UP5PIxbEmIqT8lrBuOA2vhnjVRlkigDHSnXazckM14XS3pYaXAre3yljH9+sbEeLP3iV/UcG4BsLZG0kp7cHowcTlp1pdHTN9EJTbUMSfTNSeXpGHiKmS2OA8oBlxaV4J15aD6gCq/5WTy+O/jX+4L+Honv5cFG4iLk+YmhKTHGC+DtBj6unWtegTWtEjYHAg4XO6MwAAeHApwo6xvn1NpUGVooS4dFVlN/d1FXBEXm3TyCfuABvRJBJNnbl/KxXMyBrAHoB/tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jG3DZynxZkZ5MUVvqCam5LPCLw0tHI1qrLYHTS66rso=;
 b=w7czUMpJW1TVr/3DMcCq0opV9MtZbajxjd3v1BVGtBsqaSJNpGYGMeP5fEhXKnirKMC2AEQBQCppna4vu1UmVoAspGrTnXncHzb8pbS3KOKBymIqYPyay19gH14cvAAUm/vPlC0EkRkpWM32yac3jF82DuJmrFnSNds8gcpKGXXOy3BFzz1YogMTwSEJo5j9YW3ynnopTOG2fdWSVm98PAe/ORUFkW1D+sCKID5DGT0HKRsOMGuA6a9SDshSQi1qZ4nrg7P3gAGnktkQsUZHXBCGJ7LuDCeqxHGVTLbBq82SAKbeIFmr4flKpOH7sLAxIt2rB2gWbkHXRgBpJwf6jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB7777.namprd11.prod.outlook.com (2603:10b6:930:71::14)
 by CY8PR11MB7339.namprd11.prod.outlook.com (2603:10b6:930:9f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 07:13:45 +0000
Received: from CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::60a1:eab8:65ee:6bb8]) by CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::60a1:eab8:65ee:6bb8%6]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 07:13:45 +0000
From: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>
To: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Joshi, Kunal1" <kunal1.joshi@intel.com>
Subject: Re: [PATCH v1 8/8] tests/intel/kms_psr2_sf: Skip FBC tests on BMG
 platform
Thread-Topic: [PATCH v1 8/8] tests/intel/kms_psr2_sf: Skip FBC tests on BMG
 platform
Thread-Index: AQHcUnfGrgwNRmg1nEW4a7coC19UHrTtEG6A
Date: Tue, 11 Nov 2025 07:13:44 +0000
Message-ID: <caca8466a2681c8fbc329936e37736bfe2ef7a95.camel@intel.com>
References: <20251110192454.44385-1-mohammed.thasleem@intel.com>
 <20251110192454.44385-9-mohammed.thasleem@intel.com>
In-Reply-To: <20251110192454.44385-9-mohammed.thasleem@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB7777:EE_|CY8PR11MB7339:EE_
x-ms-office365-filtering-correlation-id: 3616460c-1f6b-4588-0ca4-08de20f1da02
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|376014|366016|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?SWdxeHZPNG1oclA4bTk2enRaaWdRWm5CWStUUGpWQ0ZyQ3RxUng1YWZLWjZU?=
 =?utf-8?B?UHoxL0Q3N21wVkpMUDBha3JFZXhyU2dIemY0TWJOTWVnNWpoSXRucG5NNlQ2?=
 =?utf-8?B?M1dTTlV4SXpYQXRXcVZSKy9EQTNRa3Nkd0ZLdVRwdGNxdzRyVnYzYnVjVUdV?=
 =?utf-8?B?bDBJdmQxeTIzQUZpVEtBcHF2SlR5K3VQTDlIRERZS1FsR1UvbDV4S2QvSUVz?=
 =?utf-8?B?UzliUU9XUllqc3RyaElPODhleHNBSWk2M2lFaC9HWm1VWHltdDlHd0xkZ3R5?=
 =?utf-8?B?WlM5NnhxbTJVREROa0Rqdkd2M0k2ekJSdmdTaFBCbTJ0TkxELzJhaVFsMWFU?=
 =?utf-8?B?R3VuMjZyWmVPQWM1UThERUROVjRqK0NCMGdhbUNMK3R0REUyeVNoM2VhS1NL?=
 =?utf-8?B?bHBqSVF6U1p5NmpwZzFPRk5ZZXl4eitHNEhxSm5lZm9ncmc2U09BNVorWnp6?=
 =?utf-8?B?MnBabFcxdDJldkIzSlpGSVphZVpncVlPYkVZZExRQ2NmUXVxZjVSelBMOU9k?=
 =?utf-8?B?V0pualdhTTZlNGdid1hqRm1YMUNjUEhzQkl6K3dNNWhCS0V1SnVIU1NVOW80?=
 =?utf-8?B?eXhZOWxXblV6R3pzYzRVQW5FR3BuNXduZjZhNkVzeWtydDdtQUc3cHZvRW8v?=
 =?utf-8?B?Q1hIeTZ5MGwwQ2xFLzRIbjNwMWtYd29hQmxjZEZjZFN5alNkU1pGbi9RVFBU?=
 =?utf-8?B?YmVDMi9nRFByUG5kby9IL1hMTnZsc25aTmk5d0dvWVh2eHdCUTZBUnR5NTNk?=
 =?utf-8?B?NC9vSWJoTG80aUwxeGpnSi9ka2luOWhSUUpaR2xTRkdvWmx6SVEwNGNkaXNE?=
 =?utf-8?B?S3FrcldnSExkcEdpWWRqNmpFNTBjUkJDaUcyYW5FRmpqVFdMZklWTDg3aVhx?=
 =?utf-8?B?a2NaTEtvZmlUbkduRmdGN3pjMnVERk5vZ01CZVVtejhhWUNqcjJyRytUMmFO?=
 =?utf-8?B?OVNtYUtVUjRTaTVtNHg4amVvKzl6YjljUWJQTmxidUdsdUZaMk8rNjUwRDRp?=
 =?utf-8?B?UHFyYmMzSTdaSkx3LzR0anhSeGNVeW1vSER3ZmhyUDVRS1dBS2Nrb205L2Uv?=
 =?utf-8?B?TjRyRi8xNnRaVWtQYUR5V3lleWJPYkJPWGJWdUhKbWE2RHV0S3kzNUtjd1VF?=
 =?utf-8?B?ZmtrS3U3cUdBcGpVUjlGU0xRVlZxUjhITGJ5YzdRd3VMejRFdFg0eDBHMkFH?=
 =?utf-8?B?K0dXYlpJdjNDMmFqT1paam45OWVKMFREM0trRmxVVGlsclNqVUR5R1k2ZWMw?=
 =?utf-8?B?N3VNdi9kZTNBYURqZ2J0SjVrUSt0d3RuVDFXdDJ4WXFKZ05jL3h2OHlpQWtB?=
 =?utf-8?B?SHRQZnAzMGZSTFZ2MFYwdERMVVFrODgwb2l6dHh3dzN4ekNRdzdIM3g1S3dm?=
 =?utf-8?B?WkVVMzJCWndLR1pPRVBXMzBFRnllZ25odmpmVnBzSVNwZzJDc3o5aXAzUzB0?=
 =?utf-8?B?aGFTSjdhMTQwbkdIdG4wMjFGTmZWZ1AycFZ0Z2R3SWVSU1VOSWluVDZSWUMx?=
 =?utf-8?B?VUlCQWZkRHBCZnhFUk1UeE1RNlFsNmw1c092c1dSN29nU0dqTUxGcHlzSVJu?=
 =?utf-8?B?NENWcGRGdkFVOWE0Y3BHQTF1SStSWUpUdnVVSnlGVFFVZTZIVi9FSnVKeUJU?=
 =?utf-8?B?eG1idkpiejZuZm9sdHovWTAwb1ZDRTB0dFZVTlFNdGtwSFRGQWRtRkdvTUk1?=
 =?utf-8?B?OEZwdzhpNHRnRkMxSnQrM2F3aGxTTXNubVZxL0FzZ3VmREtNbGExNi9vbERJ?=
 =?utf-8?B?WDFxUzJRcEJ4Q1NRMndCL1M3a3ZuK1ZRTE9ySlVqYnduK0RPYy9EMW40OVJ1?=
 =?utf-8?B?Njg1dXNBUERHQVZQSG9rMURjMWVRTE1sQ2lUTHk2cVFSeGVubWNERFJrNG8y?=
 =?utf-8?B?OVAyaEdtdG1pRFFLdS9uV2NlcktpekhSeHJtenBxbW9CdndIdnN6WFdwdnA2?=
 =?utf-8?B?ODB2Mm9XcUd4djJyaTQrN3ZKYVkrcHVpcEhRUlpaWnFnYTNNWG9qMklrNEd5?=
 =?utf-8?B?dVh6NXp1RU05aVhjZ0ZPUGU2eTVoNWxQL1lCZHN4Z2FYem5WUXRxZkxpZkgx?=
 =?utf-8?Q?QQLZx1?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7777.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(376014)(366016)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bGxROTMxemNuN3ppMzQweTE4YitQYUNIVk5IMGVsZ1lvcTJ6OGI5MXlhYTl6?=
 =?utf-8?B?T3ZScUN0QmxNZ0R6YUcyZEFmNldDbG9EZXNCYUllNW1kaXdLV2QxQ2k0K0pD?=
 =?utf-8?B?cGx4djFQdlByU3RPQWd1SEtsQnpsbzNCY0pnS1JzWlhWc1Z4cDFJK2UrWUZ6?=
 =?utf-8?B?L3VrY0tSTEpnOXpCMFJIMTFYTlJVVDBOQU8xZ0F3N3NzeHVrU1U5bVBRZzZR?=
 =?utf-8?B?YU1wL01TOE1hQWNTU1hXUFpESmI0ci9MK3FoZnBYenhSbGVPNkhZVTVyL3lX?=
 =?utf-8?B?VkpucUxJay8vTzZydk11RVlvRDN4SndEM29zSmF3ejg3WDIyQjZYUkIyckRo?=
 =?utf-8?B?dTdidkVnNHpoS0xMalVaZW9iL3hQRXNOZlF3TDQrQXNHNHJidVRtNFZ6TjBV?=
 =?utf-8?B?VHA4WVJMejE1M0czOElqaDN6WkZKOGJXS2RxQXUxQ0JJaG0wUkVmMCtiSnF6?=
 =?utf-8?B?RlduSzdJem1Tc0prcHJHdDdEWnZZUXBNSE5wZ0V4WVhLdld1b2xuU0hnRXow?=
 =?utf-8?B?OGdXcHc5aGxFZjZlSk45eHV4UnM0dE9MYjBuNUYyWGNpaEUzblFWM2tENG13?=
 =?utf-8?B?MFh3RVhhYmRUaGhGYUxHVlhVRVFCUC94bGlxcjhWcmh2aThMODNvRzBHKzR0?=
 =?utf-8?B?NjVvSXQ3VGRyRHhLSkVtQVEwWlMxUis5WVJYV3JlTlhOZUdGbi8rOGxDTGFl?=
 =?utf-8?B?VVU5ZEZqbmV3ZEhaYWVZbnB4QWZTZjNyTks0QjNHeVZpRTRMaFFEZi9Xakhm?=
 =?utf-8?B?UlpZVnBxOHU1akl2Q2ZxS0pkU3FacVI5ZE1nTDJPTjBtMGJ1R3p1cFZMWito?=
 =?utf-8?B?TEsxYkNSVmJiRnYwYzQ5TUhiYm5tMmVpTlpDLzJMaW1OUksxYnhhaVZ6Z25R?=
 =?utf-8?B?UVRYMUtJc1gyTXEzWHVPVnQyekhtdzROTXIxSFBtT2E0YjRsWE5LbGwrelZO?=
 =?utf-8?B?OVBKb05jWkEyWnlHRERtbUhKM1F2SUFrcUlnOFB6TWZpZmZLV1ZtYlhxaGNY?=
 =?utf-8?B?ZzFrazJCanNMRXFnd1I1dFFpL09vWU5VNGNKMVBDYVpQZmNPbEZ6c09pZVhW?=
 =?utf-8?B?TGZkamdEb2tUQWMwV095bmZ1cHFydWtaZjNidUNuN0R4RkJ2VDMzeE1TaW84?=
 =?utf-8?B?UnhpZk84VTFORVFWQnhOQ2dtTVZ4THdBMllyeXJqeW9pdFBZYVdzN3RKcjFj?=
 =?utf-8?B?VHhOS0lJcEtEWDAyM3Vsa25WakRPZ2NQc1N4akRNRlBodUp0dmtVQ1VKRVMv?=
 =?utf-8?B?eDJYOWc3UVVsSXRhN3A0SWhVVnFCSnV1V0FqSytPSUVhcjNXQ1hRd1UvdWkv?=
 =?utf-8?B?Wmx3MjlUZTU5dTVLUmcxOE5ONitPVUFaWXdZNm9jN0swRGcxOWlSLzNkeGgv?=
 =?utf-8?B?UEVpcHZYTlFHVVF1YkZndFlXUUlyV3dwSVNZK1I3Rm1uNjQ2L3BFTnV4RzVV?=
 =?utf-8?B?YllQMzV1UVJ4VjkzZEpFYmt1dDRHbkNraU0zcXo0ZkVsOVhUUGY0K3dwcmp2?=
 =?utf-8?B?MTBwbmdCNlRDSUkvdWd0UTNNOGRqRTZoeDIreUJLbjVnM1VUS1hZamkrWVc5?=
 =?utf-8?B?VTI3M05WeVE1ZURGNGtsam1vV0wya3pCakFta0grb3lGcXlZVTQxUmpUVzBL?=
 =?utf-8?B?bURmdm00TE9BdXZKVEdsK1lTdkQyd2QvQ0FUK0hIUkI2T0VyS0t4Q2VuSG03?=
 =?utf-8?B?clExSDgvZ1dJakZjVUNpMVcyQTYwTENkWTFUQ0J5bnAvQkpQMWtPT3RkbVYw?=
 =?utf-8?B?Rzdta3d4c1VKRU8va2g5c3FneTJDUUtzaEx2ZEtERDVRS2Q4bU5Qb2NBZGZL?=
 =?utf-8?B?eGt1dXBuSXJFZnlBNWhtSTNQWmFtZUU5Wkp6Ymdlc3ZjZ25XMlN5QkxWZ3c2?=
 =?utf-8?B?azFzY1JXbzJYemVza1ZwM0s3cHRkeHBqZEF5TU5QMmNmT3QvaUxlV3JXWm83?=
 =?utf-8?B?OXQ2WTB2Rm9FOXB3eXJvd1NiMUpoaG9jdGx1NHMrVFZGbGVGdU5rY3JYSHRl?=
 =?utf-8?B?d2ljcldPNk9BYmV2UnZlbXlOQ09PNUZHc3NnVnlUQnlDS29XN1Qvci9RRURK?=
 =?utf-8?B?UExnanpBZS9leHI3SkhYMlpkRVVFdjZxKzVOMzBuQXN3VHdjMzlZRlo1V2hn?=
 =?utf-8?B?a2pkM2tSd0VUd3M3OWVVcXB2K216Q2lFMk5jeE1GSUswSXJYZWZPQUNoQ3Nl?=
 =?utf-8?B?YzVWMXJZT2RjNDJlV2VwZCtnMjRVdWE2RUUxOFZYZ2k4VkhjOU5HTmV4OWpD?=
 =?utf-8?Q?Xidge+h7gGqBLDh5COkepWc+fr31cW2Kzd7hHFuFsQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5779449265CD5641B1B25AEF7EA8307C@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7777.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3616460c-1f6b-4588-0ca4-08de20f1da02
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2025 07:13:44.9637 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rTmIx93EjEkTikTwQFkfpbjWNWmnnkk64X1Vk3XK4FWSWk3iIQOSws6pVMjut62hd6npbmrM7L3TX30u+9QVDBkdBCn+VEAwGaFmapjAvTI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7339
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

T24gVHVlLCAyMDI1LTExLTExIGF0IDAwOjU0ICswNTMwLCBNb2hhbW1lZCBUaGFzbGVlbSB3cm90
ZToNCj4gU2tpcCBGQkMgdGVzdHMgb24gQmF0dGxlbWFnZSBwbGF0Zm9ybSBhcyB0aGUgZmVhdHVy
ZSBpcyBub3Qgc3VwcG9ydGVkDQo+IG9uIHRoaXMgaGFyZHdhcmUuDQo+IA0KPiBTaWduZWQtb2Zm
LWJ5OiBNb2hhbW1lZCBUaGFzbGVlbSA8bW9oYW1tZWQudGhhc2xlZW1AaW50ZWwuY29tPg0KPiAt
LS0NCj4gwqB0ZXN0cy9pbnRlbC9rbXNfcHNyMl9zZi5jIHwgNyArKysrKystDQo+IMKgMSBmaWxl
IGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KDQpGb3IgYWxsIHBhdGNo
ZWQgaW4gdGhpcyBzZXJpZXMsDQoNCkFja2VkLWJ5OiBWaW5vZCBHb3ZpbmRhcGlsbGFpIDx2aW5v
ZC5nb3ZpbmRhcGlsbGFpQGludGVsLmNvbT4NCg0KPiANCj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2lu
dGVsL2ttc19wc3IyX3NmLmMgYi90ZXN0cy9pbnRlbC9rbXNfcHNyMl9zZi5jDQo+IGluZGV4IDY4
ODQyYjAyMC4uODEyMGQxYjhmIDEwMDY0NA0KPiAtLS0gYS90ZXN0cy9pbnRlbC9rbXNfcHNyMl9z
Zi5jDQo+ICsrKyBiL3Rlc3RzL2ludGVsL2ttc19wc3IyX3NmLmMNCj4gQEAgLTIwMyw2ICsyMDMs
NyBAQCBlbnVtIHBsYW5lX21vdmVfcG9zdGlvbiB7DQo+IMKgDQo+IMKgdHlwZWRlZiBzdHJ1Y3Qg
ew0KPiDCoAlpbnQgZHJtX2ZkOw0KPiArCXVpbnQzMl90IGRldmlkOw0KPiDCoAlpbnQgZGVidWdm
c19mZDsNCj4gwqAJaWd0X2Rpc3BsYXlfdCBkaXNwbGF5Ow0KPiDCoAlkcm1Nb2RlTW9kZUluZm8g
Km1vZGU7DQo+IEBAIC01NjEsNiArNTYyLDkgQEAgc3RhdGljIHZvaWQgcHJlcGFyZShkYXRhX3Qg
KmRhdGEpDQo+IMKgCWlndF9wbGFuZV9zZXRfcG9zaXRpb24ocHJpbWFyeSwgMCwgMCk7DQo+IMKg
CWlndF9kaXNwbGF5X2NvbW1pdDIoJmRhdGEtPmRpc3BsYXksIENPTU1JVF9BVE9NSUMpOw0KPiDC
oA0KPiArCWlndF9za2lwX29uX2YoSVNfQkFUVExFTUFHRShkYXRhLT5kZXZpZCkgJiYgZGF0YS0N
Cj4gPm9wX2ZiY19tb2RlID09IEZCQ19FTkFCTEVELA0KPiArCQnCoMKgwqDCoMKgICJGQkMgaXNu
J3Qgc3VwcG9ydGVkIG9uIEJNR1xuIik7DQo+ICsNCj4gwqAJaWYgKGRhdGEtPmNvZXhpc3RfZmVh
dHVyZSAmIEZFQVRVUkVfRFNDKQ0KPiDCoAkJaWd0X3JlcXVpcmVfZihpZ3RfaXNfZHNjX2VuYWJs
ZWQoZGF0YS0+ZHJtX2ZkLA0KPiBvdXRwdXQtPm5hbWUpLA0KPiDCoAkJCcKgwqDCoMKgwqAgIkRT
QyBpcyBub3QgZW5hYmxlZFxuIik7DQo+IEBAIC0xMjAyLDcgKzEyMDYsOCBAQCBpZ3RfbWFpbg0K
PiDCoA0KPiDCoAkJZGlzcGxheV9pbml0KCZkYXRhKTsNCj4gwqANCj4gLQkJZGlzcF92ZXIgPQ0K
PiBpbnRlbF9kaXNwbGF5X3ZlcihpbnRlbF9nZXRfZHJtX2RldmlkKGRhdGEuZHJtX2ZkKSk7DQo+
ICsJCWRhdGEuZGV2aWQgPSBpbnRlbF9nZXRfZHJtX2RldmlkKGRhdGEuZHJtX2ZkKTsNCj4gKwkJ
ZGlzcF92ZXIgPSBpbnRlbF9kaXNwbGF5X3ZlcihkYXRhLmRldmlkKTsNCj4gwqAJCWZiY19jaGlw
c2V0X3N1cHBvcnQgPQ0KPiBpbnRlbF9mYmNfc3VwcG9ydGVkX29uX2NoaXBzZXQoZGF0YS5kcm1f
ZmQsIGRhdGEucGlwZSk7DQo+IMKgDQo+IMKgCQlkYXRhLmRhbWFnZV9hcmVhX2NvdW50ID0gTUFY
X0RBTUFHRV9BUkVBUzsNCg0K
