Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7B35C3600C
	for <igt-dev@archiver.kernel.org>; Tue,  8 Apr 2025 13:01:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D42A10E227;
	Tue,  8 Apr 2025 13:01:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jw0GfVV7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87E8210E227
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Apr 2025 13:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744117279; x=1775653279;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dvDctf0LCk+GLX61+wnasjVi2Rg8Htws6yPqU5TUnys=;
 b=jw0GfVV7RpH8YfJcGF5fNQt8HDCV8ElsvhXS1fIwDiauK6E91DUbllli
 KMHotIVCQelJao8HyKHOVw/92XdigqBtj7UzOXWjVDcyCZmX8KGBp6Rph
 UWORvXCGAx/bXEPdmM+Xo5qPzYt+KaVAYQBhzMO5WA3DPV9GER+gyt13l
 UijjGVtQ69K6b3c8EG9eW/FmP60Gd2y4VI+VLj1siYTc3sPgVHWGRr/D1
 thsHFVr8ZrYbxHulr4X7U14l++yadcoW3zOdiZhkJ92Fzw8NsWK+/+G3R
 YBAWqufC/Vell46hYBQ2i12ZxrhzZ6VXXCPmujlP9ZXajXQxfxascJTjq g==;
X-CSE-ConnectionGUID: uWZ2nEM6SaijTFbvdzvR3g==
X-CSE-MsgGUID: cBoquj5BSyOBWj70GStVmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="70925070"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; d="scan'208";a="70925070"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 06:01:19 -0700
X-CSE-ConnectionGUID: KUqQX84tRMiTtfHvpKKofA==
X-CSE-MsgGUID: 8K1zvY2uQECFkp2/VdiuEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; d="scan'208";a="128594864"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Apr 2025 06:01:19 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 8 Apr 2025 06:01:18 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 8 Apr 2025 06:01:18 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 8 Apr 2025 06:01:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qj+TnB5XdIc3+jF1M9olkJaC3VaRLSD7temUs3nVLC2ax/7SnA43pDWkfKZTPWc3kpTPs1JoP2dqHGiEj1gzGYSnX5Bna5R1jPd0lFHqBH96M2begjNf1LrVcaMtdlBwGYhuxqUS/0eSwhpI/6tAjFUimxCw2wRBrozFFnDhKpfZXHEuh4eV86tzoc0iFfjQcvgOEdDtBjopVESRiugkDGpxqbo3uf40sFvAvsmWmg9Nnt2D5Y4TiwVmeLhgTVYdMal0WEBbAblLdVeEAKYzUh+FccNZ/rI20wz7+IuYptZCOSrV5Oa7iUvk0LLuD3zhhmL6ytnlmsZmDwe+PdemQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dvDctf0LCk+GLX61+wnasjVi2Rg8Htws6yPqU5TUnys=;
 b=AMg1oGZkcFSNFk1796GhmChVytTKb4RSbnffvFa0QMq3K67Hbiio6j2g6FbAsR/MTNKGvzK0/frgOBkpeDt26WQi186C6iBNiSpvJs4fRzTF6tiKyjeieBgH+5ynwAPfB0BFbZihFHHkfElA8k5jin8yIve2ZUHkS059//0EGh49AbzwhRx6vQ9I8JMTugVn/3UvEB/mYezv1GrjaOAxtuZCBz1/se/MTfj2KpnniupmTA4ZuiKeUEbZ86oVJv1Wfb88/3MxY57THSdzgZf+2sQYFbpOp2Jj3RTiOKpxAqqQZKSrd4TFHq4z2ZIc7fA+bDzO/77vBkbFO6X0mR9/Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB5910.namprd11.prod.outlook.com (2603:10b6:303:189::5)
 by DM3PPF3E6742BA8.namprd11.prod.outlook.com (2603:10b6:f:fc00::f1a)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.35; Tue, 8 Apr
 2025 13:00:57 +0000
Received: from MW4PR11MB5910.namprd11.prod.outlook.com
 ([fe80::9b12:3de0:79aa:a1fe]) by MW4PR11MB5910.namprd11.prod.outlook.com
 ([fe80::9b12:3de0:79aa:a1fe%5]) with mapi id 15.20.8606.029; Tue, 8 Apr 2025
 13:00:57 +0000
From: "Thomas, Sobin" <sobin.thomas@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Konieczny, Kamil" <kamil.konieczny@intel.com>, "Piatkowski, Dominik Karol"
 <dominik.karol.piatkowski@intel.com>
Subject: RE: [PATCH v1 i-g-t 1/1] tests/intel/xe_fault_injection: Inject fault
 for xe_hw_engine_class_to_str
Thread-Topic: [PATCH v1 i-g-t 1/1] tests/intel/xe_fault_injection: Inject
 fault for xe_hw_engine_class_to_str
Thread-Index: AQHbqIOItVjB2yySBkeyT5L2Morwo7OZuzUA
Date: Tue, 8 Apr 2025 13:00:57 +0000
Message-ID: <MW4PR11MB591027708C4C3BC9F4DB8C3094B52@MW4PR11MB5910.namprd11.prod.outlook.com>
References: <20250401120657.1829327-1-sobin.thomas@intel.com>
 <20250401120657.1829327-2-sobin.thomas@intel.com>
 <20250408124112.z6h5ow5q4ywi4cfy@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20250408124112.z6h5ow5q4ywi4cfy@kamilkon-DESK.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB5910:EE_|DM3PPF3E6742BA8:EE_
x-ms-office365-filtering-correlation-id: eb24356d-fb0f-4794-6627-08dd769d675f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?M0RmUkxjbUhma0lCK0RJaGpSYzNScHlzSXptSncvTmI5WUhhcnUrbFR0MGFi?=
 =?utf-8?B?ckxOeHQ0clowWWpXYVBFOUJwVmNYUlpDQk5EOE5UclF3UXEvUzV3Q2wrcnc2?=
 =?utf-8?B?blM1MXNPU2dsTEErRUEvQzB3bzdaWnRLU3JueFBOelZEODQ1RWxyTGJHejEz?=
 =?utf-8?B?UnpNczF6SVpjVXJzTG5xNGhhNHNGRlgrUTRPM3FjalpaZk9tR1BHdG1DdjFT?=
 =?utf-8?B?cFM3SVo3VXJyUlpyQ0JIbmNoM0g2V1pSODcwWW43ZFRab2t0QU1BSHJ2WHd1?=
 =?utf-8?B?b0gwbUJ1SzcvZ3FzVXF2SFRRZk9lcjZxMGZGbkJXR0hGVzFkYTBoWW83Z3dF?=
 =?utf-8?B?N1VRTjduaE0vYU1aWUFMcmNydTBQWVBrRkZucnN4dWQ4U3lJVnphMnpOZFZ0?=
 =?utf-8?B?RFZFcytWTG5MaFZkL1JWa2M4Smd5bnU2cXV0V0l5QzdpK3RLbC8ycmxZKzk3?=
 =?utf-8?B?YmtNTmNuVHdIMWRqV3Z1bWJ4cytLRUJEYnVENUQ5ZW9LamJWYlhmdEJSYjZu?=
 =?utf-8?B?MzFlSStJQlorekl1bTg1RmgyWFBZSkM4NnRVdzdPSkNEbW90YjRNVm5IUjFu?=
 =?utf-8?B?ZDhaSWZaOElwK2ZXdWRlUXhVRW5OWU5hSlBVTGl6ODBPWEdxc3cxck96RjNu?=
 =?utf-8?B?TENyOVdzNEhGS2tkanB6dk13ekFlT0dxbkg1T3BZdzBEUjdoTXBwblFBeDVt?=
 =?utf-8?B?ampUQkNEeW5Sb0hZbmhpNGRWWmZaNUNKbFYrU3FidElLYXVwYmw0Tk1tSHpa?=
 =?utf-8?B?NVoxU3lOU1NONkdSNUZMMG81aHRXRHZ0RXBGdW1ybzkyZmxNV05LVy8xRElz?=
 =?utf-8?B?TUdZcFprbldTVDZEdXQyQXMyNFEyREIvR05vU09Mb0VUbHhpa25iV1FpWEV1?=
 =?utf-8?B?dDhRb3pscjBSb3l2Rzg2MklCZmZWS3FvVmQyOEFNQkRHdnU2TTUwMGJvdTAv?=
 =?utf-8?B?eWx2OW5zS1BaNlRTOWhocllwTTM1ZG9GSnQ3bi9pRk43Tlo5cUtRZ2E5Q2Yr?=
 =?utf-8?B?dzl0Sk9oSFAydEJ1UUliMHRqVzU0dkxHYWdZTUU0dldabGZGalc1ZDc2dXhO?=
 =?utf-8?B?a2ZNTGxyY0dTNytROGhyckpjUUMrTmxEd0tZSkhiZGZGeEpJVi9qelBpTTdn?=
 =?utf-8?B?Q2Z3SVdvNTVHZ21MWlBtQW9vM2Jpcm1sSzViR0RDb3NaQytsRCtGV0NieVR3?=
 =?utf-8?B?eFFsM0lqYXRzeEJkQUFkd0x6NU9XamZGTXh0aXJ0Q0UxOG5Lald1UGd0RkhN?=
 =?utf-8?B?Zm5iRWlXb3NoMTYxdkZQS2hQd0pVK3l6ZTZLcGdubnB0K2g4MzlYb003SFRN?=
 =?utf-8?B?MndFSUZXdWppZUVLWlFaQk02QmRhaHlXS3J3N2Jxa09Ycml0d0xBNHpUZUhM?=
 =?utf-8?B?K2FiYkltdytyY3poQnpLbS9KcUR4OTlVdHVtKzJPVEpFMmRtdkFTajF0UHpi?=
 =?utf-8?B?QWx6QW5VMFc2cVlWTnB1VkNFcHVNY28vSmpHRG1Zelk0RVdHOWFOQ1VCa1dC?=
 =?utf-8?B?OVNNSVNDZlYzVEJUczQxOGV6UjZnZC8wSUlWNTFGL1kzQVRiSE8wcVpmMy9G?=
 =?utf-8?B?SjlBUjhxYWw1ek9aazdERnBFOE1NTUQrZWZKMExoOVFEMUtVL0t4ZE9YSVRp?=
 =?utf-8?B?NHprQTBsTUtkNVRyRmJxVnZaU2NaN1JmVU1xWloxODhsL3Zwc0pJY09TVXRM?=
 =?utf-8?B?RVNFMXVXR0tTckJTK0hkVGFlM3plZ0REb00rQjYwVHYxT2VYbHhjczZpSFVS?=
 =?utf-8?B?UTdnVGtXa1dxRTBxczlUQlJOYXViTVlYZ0QveWdwZHN2eHdkTzdkTkIxTmdP?=
 =?utf-8?B?OTdLSkNWVGd2bFVJakhkOXh4dmc4cnp0ZCtGWGxta2NzOE9Bd0NhM2FzWE55?=
 =?utf-8?B?ZkdGSFNyNVEzTUFmR1ZFYU5NaTF1NFVqSE5zWUxiMldvcjA2citoWk14Q3BO?=
 =?utf-8?B?M0JsRjZzMnZSTS96aTUvTHU5eDNhNDYrb2ZETHJDZmdlZGUrR290WGNKZGhN?=
 =?utf-8?Q?EVqy2aDieWoTxY6S34Ki8GYcH9sulA=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB5910.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SlQ0S21MNzJZcHlRZ1YvTzRldTU3TkFvN2pFdXlLdnUzM0d3R3FkSUN4RDVZ?=
 =?utf-8?B?amIzYVFSbXU2M1NmV2xrQWlHSE1hcklYU3BCSTRqMHNHQUdEcUlEcDJGZWkr?=
 =?utf-8?B?Q2RhV3dBZkd4YlpZT3gvOXVtVFZrK3poZUlSWGlDRlN3d1NQR3FKMXlzaWFs?=
 =?utf-8?B?dW9IV0V5S28zUExtUEplSWdRTlJyZlBISk1JUy9zMXpqbmxjY1lVR2tETkRz?=
 =?utf-8?B?T0I4L3JaYWlyMDlmWkpVQ2d2RnUvY2tIMVhMQ0FlSjVzQkFYU2dvcVdTWXRB?=
 =?utf-8?B?Y1g3OGRCSEIrUDM2MFpXUEV1Mmg0c1pVT3pXTFE4RTVCcm93cnp6ZnZMN0Ex?=
 =?utf-8?B?eFQxWkNBVDBoMGkzZlZsSFBwLzBIK2RYZ25EWFB0bjJyS3JwaU5oOXBmdnFD?=
 =?utf-8?B?b1l3cHoyY1VtT0VSdVdhSVFCUVh2d0JPakZZVmhYZzNzOWdGUkptRzliWUo5?=
 =?utf-8?B?UExzd0tINm96K3lyUEtNTy9TYldqaHF4NUl4WHV2cEpjdU5XYkptTmJOaEVJ?=
 =?utf-8?B?WmYrWTNkTW56UTJJVlJNQ1BOZHJZRHNSQVlYYjhlL1ZUMjUxaXVkMXVla3l5?=
 =?utf-8?B?K0FDdWlRUWsvcko0SjVudU42TVhMdzNnOFhpMGZwNFRKSHZRWlhHblhjOTFX?=
 =?utf-8?B?ZGE3NkhqaVQvYWp4OEdhcWppdkpEK1JKb3ozY01zMGhlZ1ovNnFBc0xMN3B4?=
 =?utf-8?B?SDg2cFhVMEZTWndLRThCbEQ3VFBSems1SHJUOFdpUDVaSUE0MWZhSzVwdmxt?=
 =?utf-8?B?bThVY29STkJnM0c5NnNIUjhzY2hGcExmbkp3bDNudWtlbTJrOXlSQVkva2Fi?=
 =?utf-8?B?SVlPSFlGZTROblRPNXdlKzcrS3ZlMzhYZzBpNC81RkdWS3pTdlRidFFtSUhK?=
 =?utf-8?B?eGh5VlFIWXlDQUsvLzlYTkNoTG1mSlFJNnN6a2h3OEJuT2pIckg0Q1IyQXJU?=
 =?utf-8?B?dUFUdXdpT3dsTVVsN2d3K3hBR0RtWVRReG5tUWpOTmRXTXoyZEdJcFRCQU9G?=
 =?utf-8?B?emxyaElKTTAwb016cmsvQ0Q0TkVBUUw5WTlISTRaMkJYTVlycmg2a1doRC9U?=
 =?utf-8?B?c1I1cll6a2dDOTBmUVVxODZUN05IcFYrd1YwMytsNW9zd3k3UERFdFBWamt0?=
 =?utf-8?B?VVBaSWxCNlI4TXVGY2pQaStCQkhpZXNxNkJYczZxclhyWllKbXpwVXlGcTBZ?=
 =?utf-8?B?UXhLTitvNi9Od0NQUEVuaWJncFE5VzBCRy9zaHhBNW42QVZDd2F5L3BvejZQ?=
 =?utf-8?B?bERYeGdiY0FLQ0dUUkxwTFRhQmxzL0xlZGJwYnJ1Znk2UWo3V1IzKyt2OVZx?=
 =?utf-8?B?WE9ZTW4wcVdSdEVTRE4wOTd4c3A4Nlc3NUxFSXU3Z0xkdkFJb2d4eTBsRjF0?=
 =?utf-8?B?YUI5Vnl3aW9nODhod2tpaStLdU1LNUJlVVQ1cEk0QW9IKzZVSUFpTWNnM1ZE?=
 =?utf-8?B?a3d3d2JUdGIyNFNYQlZPZWNqblJUZ3ovS095Z3NzSXl1enpPb3NyeUdmSXha?=
 =?utf-8?B?S0twYU4raytpQnlobXF4RXNKL2hVcFhLT0dRZDJKOVc0VkZNTGljS0ZxaUts?=
 =?utf-8?B?Y3pXdFREa1czUk9NM0NlakFiUWhtazMweHZ0c3R5MFZVQmtNTG5TOXZFcGhm?=
 =?utf-8?B?SW8vSEJMTzMxU0RPTnlnVlh2a0U3TkNyL3J5WHNRN1lkNTNHclpXNDZER09r?=
 =?utf-8?B?bTlOQ3hSczRBa1JnTGMwdy9GVjQwT3BuUGJlQ280SmlnM0F4cENwRkNRR2dJ?=
 =?utf-8?B?NW5TVHlBQXAxZTR1SkpIdUJQVDNyS3BVcWVxMXhoYkNqNjR2eVFjb2t3MjVY?=
 =?utf-8?B?ejV5VmdHMDJCdit0UzZwcmVKUnI1UVRlWjMvSlM3OXBteGg3MlZNSS9oZStJ?=
 =?utf-8?B?alBaTFBoMXhxVTJlNEltajBNYXNBNEduV0tjNUZUd0hPdjBsaHQrQzJLVUpF?=
 =?utf-8?B?SnR1dW5lN3MrYmNkRFFjUkQwSmx3QVVDVGt3Mk5CZkJNaGVGY1ppV0RaY28y?=
 =?utf-8?B?WFA0N3BuRmFOd2I5czJONmVhRVBvVDcrRElpbXZtZERPZDU1MGhDR1MwOFV5?=
 =?utf-8?B?WTBJTzhheG1DdGhZa3hQNTZuWVVXV2JXNmxWOHdmZDYwQngyNUZrR1I4QjVx?=
 =?utf-8?Q?fkmcp+GMSDPhXyHcUvmAKu9Pf?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5910.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb24356d-fb0f-4794-6627-08dd769d675f
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2025 13:00:57.2310 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BRshbSgLpHpqr6UmsoV5MdnqVOUHItsi5RLNjIOiuGVaKhnh5EFbSUZxePOU6i59ThKzea1pNgl7c5mqRgqggw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF3E6742BA8
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

SGkgS2FtaWwsDQoNCkkgd2lsbCBhZGQgci1iIGNoYW5nZXMuIA0KVGhpcyBwYXRjaCBoYXMgZGVw
ZW5kZW5jeSBvbiB0aGUga2VybmVsIGZhdWx0IGluamVjdGlvbiBjb2RlLiBTbyB3aWxsIGJlIHBp
Y2tpbmcgdXAgYWZ0ZXIga2VybmVsIGNoYW5nZXMgYXJlIG1lcmdlZC4NCg0KUmVnYXJkcywNClNv
YmluIFRob21hcw0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogS2FtaWwgS29u
aWVjem55IDxrYW1pbC5rb25pZWN6bnlAbGludXguaW50ZWwuY29tPiANClNlbnQ6IFR1ZXNkYXks
IEFwcmlsIDgsIDIwMjUgNjoxMSBQTQ0KVG86IFRob21hcywgU29iaW4gPHNvYmluLnRob21hc0Bp
bnRlbC5jb20+DQpDYzogaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IEtvbmllY3pueSwg
S2FtaWwgPGthbWlsLmtvbmllY3pueUBpbnRlbC5jb20+OyBQaWF0a293c2tpLCBEb21pbmlrIEth
cm9sIDxkb21pbmlrLmthcm9sLnBpYXRrb3dza2lAaW50ZWwuY29tPg0KU3ViamVjdDogUmU6IFtQ
QVRDSCB2MSBpLWctdCAxLzFdIHRlc3RzL2ludGVsL3hlX2ZhdWx0X2luamVjdGlvbjogSW5qZWN0
IGZhdWx0IGZvciB4ZV9od19lbmdpbmVfY2xhc3NfdG9fc3RyDQoNCkhpIHJlcGxhY2Vfd2l0aCwN
Ck9uIDIwMjUtMDQtMDEgYXQgMTI6MDY6NTcgKzAwMDAsIHJlcGxhY2Vfd2l0aCBTb2JpbiBUaG9t
YXMgd3JvdGU6DQo+IEZyb206IFNvYmluIFRob21hcyA8c29iaW4udGhvbWFzQGludGVsLmNvbT4N
Cj4gDQo+IFVzZSB0aGUgZmF1bHQgaW5qZWN0aW9uIGluZnJhc3RydWN0dXJlIHRvIG1ha2UgdGFy
Z2V0ZWQgZmF1bHQgDQo+IGluamVjdGlvbiBpbiBmdW5jdGlvbnMgeGVfaHdfZW5naW5lX2NsYXNz
X3RvX3N0ciBhbmQgY2hlY2sgdGhlIGVycm9yIA0KPiBoYW5kbGluZyBpbiB0aGUNCj4geGVfaHdf
ZW5naW5lX2NsYXNzX3N5c2ZzX2luaXQoKSBzbyB0aGF0IG1vcmUgY29kZSBwYXRocyBpbnZvbHZp
bmcgDQo+IGVycm9yIGhhbmRsaW5nIGlzIHRlc3RlZC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFNv
YmluIFRob21hcyA8c29iaW4udGhvbWFzQGludGVsLmNvbT4NCg0KV2h5IHlvdSBkaWQgbm90IGFk
ZGVkIGhlcmUgci1iIGZyb20gUHJpeWFua2E/DQoNCkFsc28gcGxlYXNlIGxvb2sgYXQgcmVwb3J0
IGZyb20gQ0kgZm9yIFhlLkZ1bGwgLSB0aGVyZSBhcmUgZmFpbHVyZXMgZm9yIHlvdXIgbmV3bHkg
YWRkZWQgc3VidGVzdCwgZG8gaXQgd2FpdCBmb3Iga2VybmVsIHBhdGNoIHRvIGJlIG1lcmdlZD8N
ClBsZWFzZSByZXBseSB0byBmYWlsdXJlIG1haWxzIGZyb20gQ0kgYW5kIGFkZCBhbHNvIENJLWJ1
Zy1maWxpbmcgdGVhbSBvbiBDYyAoYWRkcmVzcyBpcyBnaXZlbiBpbiB0aGVyZSkuDQoNClJlZ2Fy
ZHMsDQpLYW1pbA0KDQo+IC0tLQ0KPiAgdGVzdHMvaW50ZWwveGVfZmF1bHRfaW5qZWN0aW9uLmMg
fCAyICsrDQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0t
Z2l0IGEvdGVzdHMvaW50ZWwveGVfZmF1bHRfaW5qZWN0aW9uLmMgDQo+IGIvdGVzdHMvaW50ZWwv
eGVfZmF1bHRfaW5qZWN0aW9uLmMNCj4gaW5kZXggMjRjMTE0YmE3Li45NGMxYmJmMzggMTAwNjQ0
DQo+IC0tLSBhL3Rlc3RzL2ludGVsL3hlX2ZhdWx0X2luamVjdGlvbi5jDQo+ICsrKyBiL3Rlc3Rz
L2ludGVsL3hlX2ZhdWx0X2luamVjdGlvbi5jDQo+IEBAIC0xNzMsNiArMTczLDcgQEAgc3RhdGlj
IHZvaWQgc2V0X3JldHZhbChjb25zdCBjaGFyIGZ1bmN0aW9uX25hbWVbXSwgbG9uZyBsb25nIHJl
dHZhbCkNCj4gICAqIEB4ZV9ndWNfY3RfaW5pdDoJCXhlX2d1Y19jdF9pbml0DQo+ICAgKiBAeGVf
Z3VjX2xvZ19pbml0OgkJeGVfZ3VjX2xvZ19pbml0DQo+ICAgKiBAeGVfZ3VjX3JlbGF5X2luaXQ6
CQl4ZV9ndWNfcmVsYXlfaW5pdA0KPiArICogQHhlX2h3X2VuZ2luZV9jbGFzc190b19zdHI6CXhl
X2h3X2VuZ2luZV9jbGFzc190b19zdHINCj4gICAqIEB4ZV9tbWlvX3Byb2JlX2Vhcmx5Ogl4ZV9t
bWlvX3Byb2JlX2Vhcmx5DQo+ICAgKiBAeGVfcGNvZGVfcHJvYmVfZWFybHk6CXhlX3Bjb2RlX3By
b2JlX2Vhcmx5DQo+ICAgKiBAeGVfcG1faW5pdF9lYXJseToJCXhlX3BtX2luaXRfZWFybHkNCj4g
QEAgLTM4OCw2ICszODksNyBAQCBpZ3RfbWFpbg0KPiAgCQl7ICJ4ZV9ndWNfY3RfaW5pdCIgfSwN
Cj4gIAkJeyAieGVfZ3VjX2xvZ19pbml0IiB9LA0KPiAgCQl7ICJ4ZV9ndWNfcmVsYXlfaW5pdCIg
fSwNCj4gKwkJeyAieGVfaHdfZW5naW5lX2NsYXNzX3RvX3N0ciIgfSwNCj4gIAkJeyAieGVfbW1p
b19wcm9iZV9lYXJseSIgfSwNCj4gIAkJeyAieGVfcGNvZGVfcHJvYmVfZWFybHkiIH0sDQo+ICAJ
CXsgInhlX3BtX2luaXRfZWFybHkiIH0sDQo+IC0tDQo+IDIuMzQuMQ0KPiANCg==
