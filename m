Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BFA7C83F1A
	for <igt-dev@archiver.kernel.org>; Thu, 17 Jul 2025 04:39:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 463E610E2E5;
	Thu, 17 Jul 2025 04:39:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HTMXipfm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 790B410E2E5
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Jul 2025 04:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752727169; x=1784263169;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=MH3AeFs36Kz46a0EULv8YRHc+PRCa6YNdKaKoCTbPf4=;
 b=HTMXipfm33sdokbkm5SQOcwZ30HAvwpRW2ejEAFTuXAvKvDsnxVcl/QC
 +HzmNx/JsJ1+DXZPfP3oxqYzSMrmXaob2LrIG3AFkjAa227au4e5O7/oY
 xWqmEJIsTtbWzxfcn0qCn5dDZIi0ZoYi030DrnW30PencU0JkWRcRErO7
 VggkaAU5gLyTLUmV+yoRZnVnV5DGzLVYo3YvXrsLLzZFm4QhaJ0x9DLWq
 hKpUkqxVRxNjlelVATMKDtMwhrsiwiYcYN2+a/zE3HgCEfDb3rHq2kPVb
 d9nwpXAZTn7XNztgzpXZuZiEFfI0i9sKDQOGbDyd+RCff7nLou5zjICHX A==;
X-CSE-ConnectionGUID: aiuGmxWpQ7SYyTEMPYEslQ==
X-CSE-MsgGUID: zUltwV30TbWoZ+xHXE7tBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="65682292"
X-IronPort-AV: E=Sophos;i="6.16,317,1744095600"; d="scan'208";a="65682292"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2025 21:39:29 -0700
X-CSE-ConnectionGUID: jBZ84cbnTB2VRjtdm6Ft3w==
X-CSE-MsgGUID: +MAnOOmEQqiki9YqBrKLEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,317,1744095600"; d="scan'208";a="181374662"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2025 21:39:28 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 16 Jul 2025 21:39:27 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 16 Jul 2025 21:39:27 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.72) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 16 Jul 2025 21:39:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xb0WJd2MK2Aa7eO/WwzMG/LyqlZfBTRNwg6cOpZYO2KpqV1fUjuGTVMA+Kie1QFsaMDKHZq4dzi0ym2bekjwD1a4H3PUNFwBor9M8Ehwiz4kY66Zn8m1ucPCvFb/qL7au3nSJrpDxiSLt2W5+CYMr6E26Fb4+Ntr0wtOyFiNaRjHSlbAXmaqCSbP/5Ee2Ib6mqjBSgRnz9LlpPiLKOIUA+PUpba0Zi305Wp6H0DR5rRQUHobi1Dolczh1+kNeTOWi60unpuMUxHdcXxGvRf+ZaDkU5DKjQK0V0ZCfV9S0V8euSsLl/Uh5F4T08nvOPuffLzG0IkSf1eGXFt3PhkoEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MH3AeFs36Kz46a0EULv8YRHc+PRCa6YNdKaKoCTbPf4=;
 b=gdKZhDFt6ZzRg+jC4WO8De8wwUUhN+F8U10uoiZ/8zG4VUDVwSLEKVOBj6YBYimreFnQOLkEj/yuDt/stG8oyZYmfd0/N6FK7iYh10mQEwC/u4bX6h14VI23/4BPBawFQiwko7TL0u7WGCxEXHiytxQ6vRWaAxbHGFfYJenwOdG7ITsDrqq8vngm98V/RNOgTUE4F7jx8l1LfaWHLG+ITHYiMuPBHJW3kX4M9JnfZXxsj8ZwYygQywBVm4Rbe6yPo+k2WexxLusLM39YraghbH9zxNxSROdfxQK1eJJeUN/nDktqsvZh7UWzgYcJg+sxiMJaLWr+AM14NlDgompVBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by CY8PR11MB7876.namprd11.prod.outlook.com (2603:10b6:930:7d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.37; Thu, 17 Jul
 2025 04:39:24 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%4]) with mapi id 15.20.8922.037; Thu, 17 Jul 2025
 04:39:24 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Borah, Chaitanya Kumar"
 <chaitanya.kumar.borah@intel.com>
Subject: RE: [PATCH i-g-t v2] tests/kms_async_flips: Replace hard coded
 modifiers with async modifiers
Thread-Topic: [PATCH i-g-t v2] tests/kms_async_flips: Replace hard coded
 modifiers with async modifiers
Thread-Index: AQHb9myQitQy+J2S5UqixM2VzgdotbQ1t7SggAACeQCAAABnUA==
Date: Thu, 17 Jul 2025 04:39:24 +0000
Message-ID: <IA0PR11MB7307123FF394DD38B132948EBA51A@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20250716161231.410389-1-santhosh.reddy.guddati@intel.com>
 <IA0PR11MB7307E2B609981E658DF1F188BA51A@IA0PR11MB7307.namprd11.prod.outlook.com>
 <ce6f1b2b-917d-45a6-b57c-39a61c6eafea@intel.com>
In-Reply-To: <ce6f1b2b-917d-45a6-b57c-39a61c6eafea@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|CY8PR11MB7876:EE_
x-ms-office365-filtering-correlation-id: 35bfdefb-d059-4f3d-a21e-08ddc4ebe7dd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|10070799003|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?WVVwREl4VFEwcjdVaE5qdHlVaEVDWCtMckpWeHphcTlwd0xqQXFubktDRWwy?=
 =?utf-8?B?M2xob0pBeHJWdzhoc29vdnE5SXBtWkJ6MjVUL0IybGgybXh1czMrTS9wMzJH?=
 =?utf-8?B?SXAxOUtGT1BNb0tuOVJsSmlmclYyOFAxV2JkVXZVQlhxUlhQaXl6QlRhWitp?=
 =?utf-8?B?NHMxK0F2UFNWaEU2Q2JKeFF1d2Q0bHd1eTZ1aHNKWjdOOVVmN1NXL0c5Snhq?=
 =?utf-8?B?TE9Gc0FuT1BHY0VoRld2bm1hQnk5elorOC9FR1U4M2NFYkRPc0xMeXl2bi9B?=
 =?utf-8?B?OGk1MGhEQzBxOE53Z2FhU3B2Nk9EdnVCYkJXS0pIa0pKbnhkcXlJN2xaTmVW?=
 =?utf-8?B?UXZYUUlsY1FtbGdWdmRlM3ZoNm00Z25ReEE2bk12d05NajA5SzF1YmxENWRP?=
 =?utf-8?B?WWkzbUpUbG02dmhrdHJFVzdCbkJ3a1hhZDdoSWZIZ1FKTmMrYk03ZXpIS3BW?=
 =?utf-8?B?dnFONG1Nd0xKblhSMVVYTzhvSGczaTAzTjRiNWErOWpSQm9wMnovS3pyRmEy?=
 =?utf-8?B?Y29zRW1YdjFnbFNUNWRJMnJRd1RIUXh1ODY2YSsrVStDa0dDaXErbktXWWNn?=
 =?utf-8?B?NTcvT1pKRDFsbGk4cG5TUFhYc0hxQitXMjN5emFUTzBWWmlYdWEyRjg2M3M3?=
 =?utf-8?B?REZBNXJtQ3lrTUg0WEhVRnphcWNWa1JtNVZDOGptblA5R1dBbFBqYklKdGNO?=
 =?utf-8?B?RVJYVGpFcUFqR3RHRVlLdllubjlHZEhPZHpVZkRqTS9RbXI1dDhWbU55UEQy?=
 =?utf-8?B?MVg0MTA3NWhLaVFuUjV4VCtkeWk3WVdDaFY1dEI0TUlZNGFzZ0xBSzdlOTZr?=
 =?utf-8?B?clRvY0pnZjRDK3pEamF5c0wvejlZdE5iSHJ2UW5UMEsxc2ZGWDk3NlVISkRz?=
 =?utf-8?B?dTdVL3h6U05qQ0FpY3NmSG1ZTWR6UDI4RDU4amhEUktiODNodHVWRGF6dGNu?=
 =?utf-8?B?ZXl5WUVQN2NwSWNxaXEvK0xnR1dyN2lzZjZUaERDdUhvT3BpZ1hFekh6akpP?=
 =?utf-8?B?ZG9HWHZpT1NONktsR1pjdW5ERWtxNCt0ZUJSaDc1dnJkUWNnc0NnOXBicUll?=
 =?utf-8?B?a2RJZWhzVkV6Y0txQXdKWW54WmlaNTJ0dGpjQXU2SU1uczBUVTZPM2s3b1VK?=
 =?utf-8?B?RGZqLzRMb2NKS3FsSUpGU2RBdkZqTmRHM3A1Z0hSbnp4Nk85QUFhL01oTERn?=
 =?utf-8?B?MEZZS2hqNWFaN2pMU0xqRDFCVnlXYURsV2VwQ0RCWmxodUZCS2t3T2ZBcEhv?=
 =?utf-8?B?eHpJdFBXWGE2MTR4NUNteHg4d21OYTkvVlpqbFBEUkN3RDByeVVJcDJYajQ3?=
 =?utf-8?B?L2RXVWhqK2xEK2twOGtFbUpwSk9vdkE5U0Q2Z2dydEY2cWZxNEdWYk56Vzl1?=
 =?utf-8?B?eFNRb2Z2bHpDMCtqUXJuNnUyVHR0ZUEraU1lNDJPb3NMMnhVR1MxeUJ6QmM2?=
 =?utf-8?B?L2tuSDdDNWNJTWQrWnR3S1FQQm95bWl3NmRIK3ZOQytlWUw0YVhRSVgxZEtp?=
 =?utf-8?B?elc3bE0rUkhmcVhpN1gxaFRYcVI1cXJTTkNISTVOSklySTZXUS9ZVkNISmRs?=
 =?utf-8?B?MFMxdWZGUEtyVTFjZXpncHlWQ21DWTlxTlFsR0FQMkZpQTFwdE0zZW9TOVlO?=
 =?utf-8?B?TkZDY0NNc2g4YkkxYnNkTzBZSWhLdUZvckcrV2ZndGVJcE1KK3BZYUtFTjZw?=
 =?utf-8?B?TnZhNUNoNGpaVElIcUdKVmlYbnoreUV4aGlIV2NpYzNOcFVZaGwwVy9yWnFz?=
 =?utf-8?B?ZkMzb1BnOW5wUnJhYndsaGRIZ1hEM3RIOExVc3RmU1AxVzZvNktab2dYRnlD?=
 =?utf-8?B?d1hIbTRwbjhNQnV0aUo0UjY4eHdpWXNWRXppdW5aTmlBelBxMVBqTHhiaVBJ?=
 =?utf-8?B?dUU2TkRmNDhEWDVEQU5JRGFndE5pcGx0QWVHQmVGZktaK1UxeGtmeUFIbjJR?=
 =?utf-8?Q?RAXgY2iJQ4c=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(10070799003)(38070700018)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MVA4bWpwc21tcVpNSEhJcTh6M2FvWUZMVkIrZjUyZGhMdkxFOFJHVnNzdEEr?=
 =?utf-8?B?c01wL2d5bnNJVi84RXhOOGFkK0NMQWJObTJzVnhZc2hVYUFCdHZoRXJlcWZ2?=
 =?utf-8?B?Z0lDeGlKK08rM291dWdsQ1lsejJWNlp5MVBBQUdqc3MrS2N0bnBFU2t4eHB3?=
 =?utf-8?B?U2JIdHZubUxXZDFsM0JKaDg4OE9qT2Q5akR1ekFNV0FlbWlpckZiMjdGcUE1?=
 =?utf-8?B?NDdYTGw2S3NyVHR1YjZtMFNQRW51cXpqdUFkbTZWczhNYUkwWCt5bzRCdGVh?=
 =?utf-8?B?YkYrUjdEVWRteW00c0JuNDNpZ1lxWmtzLzJ3MElOL3hOTGtEeXNjaUVhMVho?=
 =?utf-8?B?dTVVOGZJNGkycXFzTmg3YVRsZ05RZGF3MmxTblJCZWM5RVBOdURXYXQxTVZF?=
 =?utf-8?B?cGljWEpQTXdzSndIZUFRWTdEU3dTWWd1VUVPV0thZUF6Mk4vMVdaTTdhRkFa?=
 =?utf-8?B?NUNmRExja0tyL0cwdFdSeUFLLzNYUnpaMmJBQ3VMRlZleWxZMUlOWmpUYjQ1?=
 =?utf-8?B?Ui9iY2x0Yk9aM3kxbTRsK0liMWU0K3c0OUJXS3pzVE16UXQweTlaRXp5b2I5?=
 =?utf-8?B?Y3lCZDFWcXNqaEZIdFN0Y20yWmVoblhrTVJFQkhPWWQxNHk1eEdFU2IxTzh2?=
 =?utf-8?B?YUw4NVdYKzUwRkJLWVRGbzZzNkRaanNuOVNycXB2SXltRXVQTCtoOEdNdFJP?=
 =?utf-8?B?aW84dlEvWTNxNjQzeTdIZlYzNnErUi9nRjJlOUd6VjdmYzY3WUpVdk1WVThE?=
 =?utf-8?B?UTc3eERZQ0hmMytIYnUwWGZuaGtPWHVtMXhLSWNwOGhRcEFlajVGQ2RUeUE4?=
 =?utf-8?B?Z29TZGRqdFhFbUJ2VkFocCs1UTUrUjVFUitSWDdZd2JLaUVXN3lOQlduRlZC?=
 =?utf-8?B?RFpXUkoxRW1KYm5Ya3lUWm1PUDRwMC9jQnpvdGRYRGFqdVV5SURienI2c3E1?=
 =?utf-8?B?alJZNjdKaEZqcjNSaTZ0RmZOQU5RVVM2YnBVZ1BMbWJ5QkM2UFpJT0k5QSsr?=
 =?utf-8?B?bnU3WWE5bW15VWRCbGllYjZUTHZIQXoySHJyU3lVMlU0RGV0S0dSM0F4ejBB?=
 =?utf-8?B?T091cU5WenhvQnhoc1JPZEdXRzB5bDlhQkRIU3NqRHZCNWVZZzhTb1FSeFZE?=
 =?utf-8?B?ekNXWTQxRnlGeFNNNW9hYk1hSmduUy9ad1pMLzdWVEVmK2pyRDU4ZnVhMXlr?=
 =?utf-8?B?UlV6T0JlVUVKS3RIVll1a1M1L29VOW1HUkVCQVF5eVBZcitZcWdoTzRsZDdN?=
 =?utf-8?B?VitzUkZZRmlTS08rVjZVN3pkTGZ4bnpKNFBobDV2bnNoQXpiS3BRWDdTU1pq?=
 =?utf-8?B?VTlpSEpCaVhWQi92M0d1NzVRVTg1Ry8xc25tcUkzOGliRXd2aWNhTTNWazRC?=
 =?utf-8?B?RFprZHd3MWQ5OWZURHF5SnRkQjdQUjNoaS9Tc1QwVk0rZXQvaU56WjRjM0Zu?=
 =?utf-8?B?eW96ZkIrMHUyVndoL3RVMWk1NkNpTlZzQjkyM2tyeEJZY0lsbTZ4SmQzRmEz?=
 =?utf-8?B?RzRTTnVXczNKTTYzZmZTTVRtVCtJVk1sU05kTUdEMGc4U3ArZkNNaUhjemsy?=
 =?utf-8?B?NGtrcU9IUGRzYXg5RkdqYWpFU1VKVlYzMnBiRGtrK0hocFJLNXhXem83SmdV?=
 =?utf-8?B?K29PK0NCRy9DNHRuUEcxamJlRGlUb0M2U3ptTWhkOWd4SExDRTU5VTNFbUN4?=
 =?utf-8?B?STFwYXFpTGRjaDNMSUxBdVNkSmpacWlYZGMyL2hlaTF0ajcvMzlIclVYalg2?=
 =?utf-8?B?UUIxRDRuNVI0U2FYb3NaVk5Cemw1SzN1U2trZUtsN01YUGlZaUpqTHA5a0VO?=
 =?utf-8?B?d3VYYU90NWRJL0pGaGxGQ1RwU0lTa0JMWkFteUt1cjBvRzE4UkNyQzdlMnVl?=
 =?utf-8?B?bERhM3lBOCtlZXR6U3JQenlhYmtDNHNLNE5tN2F5YlFyNlFvQUFTSXZHY2JN?=
 =?utf-8?B?Wlh4R1haeDU1QnFMSUMrclFRMlo2dkhsT0phaE5SaVRhMVJiMVE5RjRWbDZk?=
 =?utf-8?B?cGdKcWIvSmZsY1VUWE1kZmJFQmRlTU1XN2E3RjBLRUZKT0VWTEl5YXVUcTZM?=
 =?utf-8?B?THJXQm5sdGc2NldkQy94K1BZQlo2RmIzRDFrZHVIcjJhZGovSG92amh3ODBK?=
 =?utf-8?B?UmF5ZHZKVDBJNVVUNlBRejFEQkVkdjBFUDlQK3FTTERPSU02em5jODdlQVBN?=
 =?utf-8?Q?OFqgWxyYvkapUqxfur3Pdc6NvBIIKQLoYqrSalZfCkDx?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35bfdefb-d059-4f3d-a21e-08ddc4ebe7dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2025 04:39:24.2807 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zzqlXK/OHgyN0wQh6UI71dovdhVpaZ28s3zvNIn/wcMiAah/MA7h8rgdDf294DrBPB6qYeaP/AoXqvpfnCi1pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7876
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

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFJlZGR5IEd1ZGRhdGksIFNh
bnRob3NoIDxzYW50aG9zaC5yZWRkeS5ndWRkYXRpQGludGVsLmNvbT4NCj4gU2VudDogVGh1cnNk
YXksIEp1bHkgMTcsIDIwMjUgMTA6MDAgQU0NCj4gVG86IE11cnRoeSwgQXJ1biBSIDxhcnVuLnIu
bXVydGh5QGludGVsLmNvbT47IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBC
IFMsIEthcnRoaWsgPGthcnRoaWsuYi5zQGludGVsLmNvbT47IEJvcmFoLCBDaGFpdGFueWEgS3Vt
YXINCj4gPGNoYWl0YW55YS5rdW1hci5ib3JhaEBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggaS1nLXQgdjJdIHRlc3RzL2ttc19hc3luY19mbGlwczogUmVwbGFjZSBoYXJkIGNvZGVk
DQo+IG1vZGlmaWVycyB3aXRoIGFzeW5jIG1vZGlmaWVycw0KPiANCj4gDQo+IA0KPiBPbiAxNy0w
Ny0yMDI1IDA5OjU0LCBNdXJ0aHksIEFydW4gUiB3cm90ZToNCj4gPj4gLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0NCj4gPj4gRnJvbTogUmVkZHkgR3VkZGF0aSwgU2FudGhvc2ggPHNhbnRob3No
LnJlZGR5Lmd1ZGRhdGlAaW50ZWwuY29tPg0KPiA+PiBTZW50OiBXZWRuZXNkYXksIEp1bHkgMTYs
IDIwMjUgOTo0MyBQTQ0KPiA+PiBUbzogaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4g
Pj4gQ2M6IEIgUywgS2FydGhpayA8a2FydGhpay5iLnNAaW50ZWwuY29tPjsgQm9yYWgsIENoYWl0
YW55YSBLdW1hcg0KPiA+PiA8Y2hhaXRhbnlhLmt1bWFyLmJvcmFoQGludGVsLmNvbT47IE11cnRo
eSwgQXJ1biBSDQo+ID4+IDxhcnVuLnIubXVydGh5QGludGVsLmNvbT47IFJlZGR5IEd1ZGRhdGks
IFNhbnRob3NoDQo+ID4+IDxzYW50aG9zaC5yZWRkeS5ndWRkYXRpQGludGVsLmNvbT4NCj4gPj4g
U3ViamVjdDogW1BBVENIIGktZy10IHYyXSB0ZXN0cy9rbXNfYXN5bmNfZmxpcHM6IFJlcGxhY2Ug
aGFyZCBjb2RlZA0KPiA+PiBtb2RpZmllcnMgd2l0aCBhc3luYyBtb2RpZmllcnMNCj4gPj4NCj4g
Pj4gVXNlIHRoZSBJTl9GT1JNQVRTX0FTWU5DIHVBUEkgdG8gZ2V0IHRoZSBsaXN0IG9mIGFzeW5j
IHN1cHBvcnRlZA0KPiBtb2RpZmllcnMuDQo+ID4+IHNlbGVjdCB0aGUgMiB1bmlxdWUgbW9kaWZp
ZXJzIGZyb20gdGhpcyBsaXN0IHRvIHRlc3QgaW52YWxpZCBhc3luYw0KPiA+PiB0ZXN0LCByZW1v
dmluZyB0aGUgaGFyZCBjb2RlZCBkZXBlbmRlbmN5IGFjcm9zcyBwbGF0Zm9ybXMuDQo+ID4+DQo+
ID4+IHYyOiBVc2UgZmlyc3QgYW5kIGxhc3QgbW9kaWZpZXIgZnJvbSB0aGUgYXN5bmMgc3VwcG9y
dGVkIGZvcm1hdCBsaXN0DQo+ID4+IGZvciBpbnZhbGlkIHN1YnRlc3QuDQo+ID4+DQo+ID4+IGNs
b3NlczogaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2RybS94ZS9rZXJuZWwvLS9pc3N1
ZXMvMzc2OA0KPiA+PiBTaWduZWQtb2ZmLWJ5OiBTYW50aG9zaCBSZWRkeSBHdWRkYXRpDQo+ID4+
IDxzYW50aG9zaC5yZWRkeS5ndWRkYXRpQGludGVsLmNvbT4NCj4gPj4gLS0tDQo+ID4+ICAgdGVz
dHMva21zX2FzeW5jX2ZsaXBzLmMgfCAxNiArKysrKysrKystLS0tLS0tDQo+ID4+ICAgMSBmaWxl
IGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkNCj4gPj4NCj4gPj4gZGlm
ZiAtLWdpdCBhL3Rlc3RzL2ttc19hc3luY19mbGlwcy5jIGIvdGVzdHMva21zX2FzeW5jX2ZsaXBz
LmMgaW5kZXgNCj4gPj4gZGRhYzkwNGNlLi4xZDQ2ODRjNTEgMTAwNjQ0DQo+ID4+IC0tLSBhL3Rl
c3RzL2ttc19hc3luY19mbGlwcy5jDQo+ID4+ICsrKyBiL3Rlc3RzL2ttc19hc3luY19mbGlwcy5j
DQo+ID4+IEBAIC01OTgsNiArNTk4LDcgQEAgc3RhdGljIHZvaWQgdGVzdF9pbnZhbGlkKGRhdGFf
dCAqZGF0YSkNCj4gPj4gICAJc3RydWN0IGlndF9mYiBmYlsyXTsNCj4gPj4gICAJZHJtTW9kZU1v
ZGVJbmZvICptb2RlOw0KPiA+PiAgIAlpbnQgZmxhZ3M7DQo+ID4+ICsJdWludDY0X3QgbW9kMSwg
bW9kMjsNCj4gPj4NCj4gPj4gICAJaWd0X2Rpc3BsYXlfY29tbWl0MigmZGF0YS0+ZGlzcGxheSwg
ZGF0YS0+ZGlzcGxheS5pc19hdG9taWMgPw0KPiA+PiBDT01NSVRfQVRPTUlDIDogQ09NTUlUX0xF
R0FDWSk7DQo+ID4+DQo+ID4+IEBAIC02MDcsMTAgKzYwOCwxNiBAQCBzdGF0aWMgdm9pZCB0ZXN0
X2ludmFsaWQoZGF0YV90ICpkYXRhKQ0KPiA+Pg0KPiA+PiAgIAlmbGFncyA9IERSTV9NT0RFX1BB
R0VfRkxJUF9BU1lOQyB8DQo+IERSTV9NT0RFX1BBR0VfRkxJUF9FVkVOVDsNCj4gPj4NCj4gPj4g
Kwltb2QxID0gZGF0YS0+cGxhbmUtPmFzeW5jX21vZGlmaWVyc1swXTsNCj4gPj4gKwltb2QyID0N
Cj4gPj4gK2RhdGEtPnBsYW5lLT5hc3luY19tb2RpZmllcnNbKGRhdGEtPnBsYW5lLT5hc3luY19m
b3JtYXRfbW9kX2NvdW50KSAtDQo+ID4+ICsxXTsNCj4gPiBJIHRoaW5rIHdlIG5lZWQgdG8gY2hl
Y2sgZm9yIElOX0ZPUk1BVFNfQVNZTkMgYW5kIHRoZW4gYXNzaWduLiBUaGVyZSBhcmUNCj4gb3Ro
ZXIgdmVuZG9ycyB3aG8gYXJlIHN0aWxsIG5vdCB1c2luZyB0aGlzIElOX0ZPUk1BVFNfQVNZTkMg
c28gZm9yIHRoZW0NCj4gZGF0YS0+cGxhbmUtPmFzeW5jX21vZGlmaWVycyB3aWxsIGJlIE5VTEwu
IFNvIGluIGNhc2Ugb24gTlVMTCB1c2UgdGhlIGV4aXN0aW5nDQo+IHN0YXRpYyBtb2RpZmllcnMu
DQo+IA0KPiBDdXJyZW50bHkgdGhlIHRlc3QgaXMgaW50ZWwtc3BlY2lmaWMgYW5kIHdpbGwgbm90
IHJ1biBvbiBub24taW50ZWwgcGxhdGZvcm1zLg0KPiANCj4gaWd0X3N1YnRlc3Rfd2l0aF9keW5h
bWljKCJpbnZhbGlkLWFzeW5jLWZsaXAiKSB7DQo+IAkJdGVzdF9pbml0X29wcygmZGF0YSk7DQo+
IAkJLyogVE9ETzogc3VwcG9ydCBtb3JlIHZlbmRvcnMgKi8NCj4gCQlpZ3RfcmVxdWlyZShpc19p
bnRlbF9kZXZpY2UoZGF0YS5kcm1fZmQpKTsNCj4gDQpJZiBpbiBjYXNlIHRoaXMgaXMgcnVuIG9u
bHkgZm9yIEludGVsIHBsYXRmb3Jtcy4NClJldmlld2VkLWJ5OiBBcnVuIFIgTXVydGh5IDxhcnVu
LnJtdXJ0aHlAaW50ZWwuY29tPg0KDQpUaGFua3MgYW5kIFJlZ2FyZHMsDQpBcnVuIFIgTXVydGh5
DQotLS0tLS0tLS0tLS0tLS0tLS0tDQoNCj4gVGhhbmtzLA0KPiBTYW50aG9zaD4NCj4gPiBUaGFu
a3MgYW5kIFJlZ2FyZHMsDQo+ID4gQXJ1biBSIE11cnRoeQ0KPiA+IC0tLS0tLS0tLS0tLS0tLS0t
LS0tDQo+ID4+ICsNCj4gPj4gKwlpZ3RfaW5mbygidXNpbmcgbW9kaWZpZXIxICVzIGFuZCBtb2Rp
ZmllcjIgJXNcbiIsDQo+ID4+ICsJCSBpZ3RfZmJfbW9kaWZpZXJfbmFtZShtb2QxKSwgaWd0X2Zi
X21vZGlmaWVyX25hbWUobW9kMikpOw0KPiA+PiArDQo+ID4+ICAgCWlndF9jcmVhdGVfZmIoZGF0
YS0+ZHJtX2ZkLCB3aWR0aCwgaGVpZ2h0LCBEUk1fRk9STUFUX1hSR0I4ODg4LA0KPiA+PiAtCQkg
ICAgICBJOTE1X0ZPUk1BVF9NT0RfWF9USUxFRCwgJmZiWzBdKTsNCj4gPj4gKwkJICAgICAgbW9k
MSwgJmZiWzBdKTsNCj4gPj4gICAJaWd0X2NyZWF0ZV9mYihkYXRhLT5kcm1fZmQsIHdpZHRoLCBo
ZWlnaHQsIERSTV9GT1JNQVRfWFJHQjg4ODgsDQo+ID4+IC0JCSAgICAgIEk5MTVfRk9STUFUX01P
RF9ZX1RJTEVELCAmZmJbMV0pOw0KPiA+PiArCQkgICAgICBtb2QyLCAmZmJbMV0pOw0KPiA+Pg0K
PiA+PiAgIAlpZ3RfcGxhbmVfc2V0X2ZiKGRhdGEtPnBsYW5lLCAmZmJbMF0pOw0KPiA+PiAgIAlp
Z3RfZGlzcGxheV9jb21taXQyKCZkYXRhLT5kaXNwbGF5LCBkYXRhLT5kaXNwbGF5LmlzX2F0b21p
YyA/DQo+ID4+IENPTU1JVF9BVE9NSUMgOiBDT01NSVRfTEVHQUNZKTsgQEAgLTExMTMsMTEgKzEx
MjAsNiBAQCBpZ3RfbWFpbg0KPiA+PiAgIAkJdGVzdF9pbml0X29wcygmZGF0YSk7DQo+ID4+ICAg
CQkvKiBUT0RPOiBzdXBwb3J0IG1vcmUgdmVuZG9ycyAqLw0KPiA+PiAgIAkJaWd0X3JlcXVpcmUo
aXNfaW50ZWxfZGV2aWNlKGRhdGEuZHJtX2ZkKSk7DQo+ID4+IC0JCWlndF9yZXF1aXJlKGlndF9k
aXNwbGF5X2hhc19mb3JtYXRfbW9kKCZkYXRhLmRpc3BsYXksDQo+ID4+IERSTV9GT1JNQVRfWFJH
Qjg4ODgsDQo+ID4+IC0NCj4gPj4gSTkxNV9GT1JNQVRfTU9EX1hfVElMRUQpKTsNCj4gPj4gLQkJ
aWd0X3JlcXVpcmUoaWd0X2Rpc3BsYXlfaGFzX2Zvcm1hdF9tb2QoJmRhdGEuZGlzcGxheSwNCj4g
Pj4gRFJNX0ZPUk1BVF9YUkdCODg4OCwNCj4gPj4gLQ0KPiA+PiBJOTE1X0ZPUk1BVF9NT0RfWV9U
SUxFRCkpOw0KPiA+PiAtDQo+ID4+ICAgCQlydW5fdGVzdCgmZGF0YSwgdGVzdF9pbnZhbGlkKTsN
Cj4gPj4gICAJfQ0KPiA+Pg0KPiA+PiAtLQ0KPiA+PiAyLjM0LjENCj4gPg0KDQo=
