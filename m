Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26DE5D59D6F
	for <igt-dev@archiver.kernel.org>; Fri, 12 Dec 2025 16:49:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C700E10E08F;
	Fri, 12 Dec 2025 16:49:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ASb8Aamu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C7C110E08F
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Dec 2025 16:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765558188; x=1797094188;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=3a/hSOetCe4p9PAXELLlzu7FzGwlCovPRaLffKHcHMo=;
 b=ASb8AamuUQKSCD6YEOCj3knu65V566je1EiyOxhNmvFJR7TuBCQLd6s8
 cjh9sXZSlfRcMoQBVTQzpJCvfky5p9FWPulfob/PY89F7OkABELhEcVKY
 W8kAPs1W1F71PDoXGlk9j14nibi8DvgNiuCrnRQb3BeoqfsKXVQCJZ/+i
 2kbdgE7QsATPBpeCvbrIHE/OErJw1tmRkVQxsnwrfRGtV1FHgZZ2YqV6G
 mPxA+u5zHiI+Ndymz9n/qSRACGfOVOPGkvMFQQfFKVPNEWtrFpyMG3xCJ
 w41LuC1iwf78cMz2B7tiTgQkihSWyKRcUIn9sFR/1Q40ARaNwdxf3gq1v g==;
X-CSE-ConnectionGUID: UB8yAHBRT/ed8gPxAkp+Qw==
X-CSE-MsgGUID: 9iJexdLdTfqa3FVkLeLzlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="71190580"
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; d="scan'208";a="71190580"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 08:49:48 -0800
X-CSE-ConnectionGUID: c7OGVjYwRt25yrkjrqoZwQ==
X-CSE-MsgGUID: 4LX04IkFRD6xv9n8YO+6Lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; d="scan'208";a="201605900"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 08:49:48 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 12 Dec 2025 08:49:46 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 12 Dec 2025 08:49:46 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.30) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 12 Dec 2025 08:49:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rhMPU1AWBFjGI8LghYKkHHGf7WmMUj8BvWlN+DCdj0rwoWcBW8jD63+AiZ6eq6wC0FKe5uAx+x6aa2WsNz3b6pFtyS9/7uMnXkRKY+0pHx17aakBiOPFxMbvWG5KsO9vxGx0ei6EvTvYrtxtsW9nrgmuKpLgcpUyzD0XJLBSl911BJ/fLpaijYqUJFrn7XfoID9JKDRdRoikJPmhZwzLCeLQREooGyggAjlaQH8e6Spu3DfzSwBGW3HklOYfMkv3TNDmvEJYbttsDzfyPzn2MmNVIQxn73W9NnihXRHhHOo0D0geJstGFdKvNYLjJDPhYfPnB0vYfqOL94ozzqMe4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3a/hSOetCe4p9PAXELLlzu7FzGwlCovPRaLffKHcHMo=;
 b=p+EBssc02g94SJVVO/b5DOaZwbb2/FFTdjCTisEylQ5UaryRLQQAF4Y7sdezOlh2Ax4XdoccBxsxbPb1TyVA4cUFB62cPBRQgTFOsBI8sdnItd4XAKVDTDjSpdkFw0dwWYRbuj2Ydkx3G5w3AtrLkZ3cDkSqtYZeizLwo7RtGgxdrF4JnsJNqUySSTdzemCNxo2YuusW5rsfZB1bcbpGmAb1WBqutAy4ZynkqjamsQoeRcQjPm/JoCAeaq2hmKi8hPk9x0VwloNAA+TuWruLe23KyBtkL40PS8TFKtVf8ym/jCBvSGYb/4s/Tk+mIYOYxjElc2uB43gn72mLXrymVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA3PR11MB8046.namprd11.prod.outlook.com (2603:10b6:806:2fb::22)
 by PH7PR11MB6932.namprd11.prod.outlook.com (2603:10b6:510:207::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.11; Fri, 12 Dec
 2025 16:49:43 +0000
Received: from SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::f04:d46a:1742:5c3c]) by SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::f04:d46a:1742:5c3c%4]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 16:49:43 +0000
From: "Wang, X" <x.wang@intel.com>
To: "Vodapalli, Ravi Kumar" <ravi.kumar.vodapalli@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH v8 2/2] lib/intel_device_info: Query runtime xe device
 graphics versionsth
Thread-Topic: [PATCH v8 2/2] lib/intel_device_info: Query runtime xe device
 graphics versionsth
Thread-Index: AQHca4EMeH+giLQdgEGeZ+o4oe2m37UeNsIw
Date: Fri, 12 Dec 2025 16:49:43 +0000
Message-ID: <SA3PR11MB80463C3936A0C00DFD8EF47386AEA@SA3PR11MB8046.namprd11.prod.outlook.com>
References: <20251020231253.138842-1-x.wang@intel.com>
 <20251020231253.138842-3-x.wang@intel.com>
 <20251107194739.s2yrsh2xt7greq3q@kamilkon-DESK.igk.intel.com>
 <SA3PR11MB80466F35AA1F6AA60C0CCDBE86D6A@SA3PR11MB8046.namprd11.prod.outlook.com>
 <bfaf0706-f710-4a45-99df-d2de8f203d3a@intel.com>
In-Reply-To: <bfaf0706-f710-4a45-99df-d2de8f203d3a@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR11MB8046:EE_|PH7PR11MB6932:EE_
x-ms-office365-filtering-correlation-id: 0aa42365-f985-441d-cf5a-08de399e737c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|42112799006|1800799024|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?d1JwSHphWFlPWVZXSmFmNEk1dllQNG9laXZvL1A4SGNndVkyd0NKb1A4cmVE?=
 =?utf-8?B?N2NFUnV6YjF1WWltZmgweUMyYUtKZGxKZlQzazNxblpra2NLVmpnMTBmbWQr?=
 =?utf-8?B?VndIWVBlWmRINzdNR3p1QytMRG5mcHVwRVFEOWhGMGZNWkFDcGFFa0VWUitY?=
 =?utf-8?B?cXIrajFWd29xZmVuTTBCODAzVXBwS002WHZ2cFhqVzBWTmFnaWFUcGN6QWNE?=
 =?utf-8?B?T1J0QTFKaEdEWU9HNU9GOWN1TXIwNW9COTZUTldKalhwSGlKQ0M2SitIYXBk?=
 =?utf-8?B?aks5ZkZvODZMdXZZVWxkUERsb1hhcjd6dmkyRzNuVVMzTE02bEVrckxxbWcv?=
 =?utf-8?B?RzZ0aVhjaDVlOEhVVk81Z1dYQ3FtaFQ5S1dUUWJLaFExLzRzL2F6V3pBbVRG?=
 =?utf-8?B?S3V6YlJsbS9UVVY4ejZ6dGdWK2UyREJzZXdWQlR1SHJOdW9oY0poZUJXRkNt?=
 =?utf-8?B?cHFpM2NldnBmelVyVXdXcnBEWVVRY2M4V0R0WTFLK3I4enZEOG9hMU52c3cz?=
 =?utf-8?B?ek5EOXZTeFJXOFNaQ0I4V2ZlZGhMcDNORktqS3RvQnNuVkc0R1pMSjk0SWlO?=
 =?utf-8?B?YlZyM3VYQTlLL1pVREdQWHlHS1RrNWFubThpSHJ5ejZ4ZDBQK1pZSkVVdW02?=
 =?utf-8?B?cFJHdVJiMk4vd2lIL0NlZko2aG0rdFpHckNaeUlXZm1CeEEwVFJMaEs0cXpr?=
 =?utf-8?B?dlJ3Y1o0Q21DajErcXNmWWYyN3BOQXJRc2I5N05tODFiWFErdW9CVk5hSWVV?=
 =?utf-8?B?SWFCTVVzb3lvSG9DcGZWajVEMjFxV3pTdm1BWkZZTjIwSEJtRm5GNlM4QUJU?=
 =?utf-8?B?alA0SFkwazJSS1ZqVmliQ1hjQWN1eE9BTEdPdzVhSHl4d05JQWdySG9JR3Vz?=
 =?utf-8?B?dnhZajV1VENvNkFBanFBWEJOMXFuanJLTEp5L0lmSHZlT2QzWkQ4OXJkeE5l?=
 =?utf-8?B?OEc1RnNTbFJaOXZOK2tTbERiM3FFVUlIVnVvY0UyMVhSWDhyMVlsOWxSTkxo?=
 =?utf-8?B?eXV1aE9vOTh4MnNPMytDSWhkSXBadmtVeFVlQklFTTFMTGszdEw4d2xKbW5y?=
 =?utf-8?B?Smp4Y0x2YUFZRHEvZTVPMXZrRDR5b0VLcmVrb1B3SE8yQURCS1hHZ0Q3akxC?=
 =?utf-8?B?TFMyM1BBTGRiaExpSW9FNXNUSE1tQnQ2U1FmMWJIWEIvT2NCa1NMWG1UZWQ5?=
 =?utf-8?B?WVBPeURLN0p3U2ZNZWowM1NaQVB0eDFoaTZIMzd2QnZDQ3MzQ1VGZVlqTSs0?=
 =?utf-8?B?cWtBemUzajM4WDZZQXVick1EaHc1TVZGU0c5QmJRbFNEendRYXppL3V0SjVn?=
 =?utf-8?B?QjR3WnJEcWxWZmQ0S2xNbTJVK0NGR3dOdE1IZnVlK284QWErcGV2SU1xZWFM?=
 =?utf-8?B?WmZCL3hCMXhDa2dRZW1GTGpnZmpGSXoxMnp6OS8zcHBDTWRZRkZJMjFtMjd2?=
 =?utf-8?B?TnBXYlB0b2s3WEgveFBrRDFVMXlXNnZmbTArV1V3VE5vWitWTjhyaUZBdGNx?=
 =?utf-8?B?NWRYWGMrbUFiVzZac0lDbEdmVjlqSlhBMHo2amIwQ0tCOWF0ZWpEcURzdzRF?=
 =?utf-8?B?OU5sOU1WUHovV3R2ZzIveFozRlF1RHVBU1Y1RnhwQTZ4U0lJVUtvc0U1elk5?=
 =?utf-8?B?SXZZeTZvQzFGWEMyZDNhS1QwdHhNNnc0bkhmOXhLYlZiNmVPMlBVUC9Ucjlj?=
 =?utf-8?B?ckN2MVFSZlZjaEE1cWtyNjYxUmJXdnBvM3poV081NFpLdmpqeUZOV080U0cw?=
 =?utf-8?B?QlhLMnJ0SWMxQmFWdzE4cE94UUNjeUlMMENFQ01SdkFWRTE0NTE5T2xFSnZn?=
 =?utf-8?B?M3dQUzJNRkpJYStpbE12QVhPNTM4UnZ4d2tYZEUzTm5WamNUeTE3UTgzNk5a?=
 =?utf-8?B?WnFNelZyQWp0RFBRVjIrcGRXQzExMU9sNVdaZTl4WlFReDZsS05QckVVa3Mz?=
 =?utf-8?B?SjFjVlN4YkhxblJicmhjbkFMWXdzSk1idk5jQUNyTzFNZFN6SFRHR1ljY1RT?=
 =?utf-8?B?MVRVaXpHN1ZoSFZhRzhjbE1yUThXNUFJMFNqRWplNWJsSVAwU1ZBTlc4QjZh?=
 =?utf-8?Q?LVwayC?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB8046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(42112799006)(1800799024)(7053199007)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WDFldmFnTTQ5YXZmWTVSWURQeVVBTGNWOUFJdlpSeG15VW1VZElERlJscTdW?=
 =?utf-8?B?TGdNWkNGL0JtWmVDVkh1enMxeWpJYlpVakNPQ2ptbkdCUWsyS0puRG03NVdx?=
 =?utf-8?B?T1JFNzhDd0VsbE1OWVlUeVhhcDdzaDQ4TzZmWWw0T21IMHY1cktBOXJVbXJj?=
 =?utf-8?B?WnJOWlE3UU5MM3h4TThVbFZuTWtJT2Z5dEIrZUhCeXppN0c1SlRqUUFTeFRF?=
 =?utf-8?B?M3JWYXJBbmJZbGc3dkhiYnIrZWhDMkJkUk02NzhNY3FXZzlab3pDN2lKcWpn?=
 =?utf-8?B?Z2FmZ2ZDNjdsbHJHTFlrQ24xVlZpYng5NktFbDZxTS81ZEk1UGJpbHFycTJn?=
 =?utf-8?B?QkFZN1ozM25TeHNRSUNidS90cXgwREVsNWJ6V0c5MHhCbmttVnlhUXJDcWtS?=
 =?utf-8?B?SmU0RUxPM1pXQTE4dnJ5d2lQRW1aNUgzbk56Y2V6QUpyMmZnN0JGL3J5UWxv?=
 =?utf-8?B?cysyY2dSVGlad3NkUUtHdC82WTRxc3l1SnN6Q1ROUXlWdmJJRlVpcFVoNEFm?=
 =?utf-8?B?V0FWd0R4MzNsNG8vOGYyR2V3Nmwxd1FKL09DSXVyeDN4VEp4eEJuYU1ycVZB?=
 =?utf-8?B?aDl1eGY0OUxUS1pKdlQ4bXhCQzdHTVV5dmh3QUdtZmlsOGg0K09waUZqcnpD?=
 =?utf-8?B?MHpQZ1lLVFUyYkt1UE9UT1RhOU1FUnZzUFNmMDJzSTZZSks3RFRKNXJsc1E4?=
 =?utf-8?B?ajQ0VldIMHM4Q2ZWcU5vNkVtQjA1YU11cTUrbmtvdWFVR1g5V1crNTllK2Vw?=
 =?utf-8?B?azYxd2dEWEJZaHRRVjBLSThGcnU0MG1IZU9Fb3ZpTy9tRlR6RUpCRXRpT01Y?=
 =?utf-8?B?OHhoY21vbG9aQnF0RGdxaHVYVzhJWXVoVlc4c0hCN3ZVQnptT00wQ1pKYUJR?=
 =?utf-8?B?alpIaDlKaXkzN0wwd1ZuOXlIaHAycHFKMTdOWWdHcUpNUTNyUklDY2JVdUNh?=
 =?utf-8?B?VFJiQmQzdlJ4dk5HK2ZhQWtYTzYwMlZyd2pKaVdlT2NoN3Z1TCtxT2xENTRL?=
 =?utf-8?B?M3hJYm1tSmwzQXMvT1R6aWxGZmZ0MnErSUR6SXd2U01qWDdndys2K3AyS1VC?=
 =?utf-8?B?MU1PQU43akY1blp3SUFHMTBDUHFCeTI0T0tTTVVVdzNpVE9DZS92SHR4WFQ1?=
 =?utf-8?B?c2pXMk9BY0lRUFplQ3hFSjV3VE1sVEs5bzFTUnllSU5sN3lmemVlbzJIbWpU?=
 =?utf-8?B?UUREUCtSd0JDSWd2UnFYRkZ0M29Zamk2cTZ4aHJlcmtKeUZqRmtMTmljbXZx?=
 =?utf-8?B?eG1GQ2FnUFE0WnBEY0xxKyszMlZjR3VINmx1bFphaTZsUlVienBmQnd3N1px?=
 =?utf-8?B?UlJvNjVpWjVYWkJNb3Y3ejZ5YXlIdDQxV0lLcmtUZG5mMHlzU2oxbXYxK1k2?=
 =?utf-8?B?WmxhUUJrVnJURldtN0tiY0Q3d3Vlb21iRDkwS25OZmtrSXlZVDZyMzFyNkRT?=
 =?utf-8?B?T2NYR0FwdDJYNEQvR1VyYklaNmJUa3U2US8zZ2NXWWVqV2xQYUJ1RmQ3RlV1?=
 =?utf-8?B?R1ZjT25DSTR2WEovaXRxTnkzSW5keHRCTU84dVZqVk5xY0E3QkkzQS9vcExz?=
 =?utf-8?B?Y3Y5MkVaOGNyV1owVEFITzNFeGpJaEdiWWlIZWdZbThvN2ZiN1RYOG5ieVg0?=
 =?utf-8?B?Mk9RUWxQUnA5RkNGR0ZOS3lRWm4wTUx5YUhDR0VKM2dmTnFheWhzRDFGYll1?=
 =?utf-8?B?VWYyRlY2bGZhdFJwYzNLcCtMT0Z3YXlSLzhkUVNhUVRSSnNuSStMOVVyMlRS?=
 =?utf-8?B?SXVDUWxkYUZ2TEYrc2FBTkZKaGNzbkJkWWdkLzRlVWY4U1duRlIwVE5Pc2Qx?=
 =?utf-8?B?Mkp0SUhCN1lrNUxaM01YVmN5NXF0azFXRTBsekh1VXF1OUlJZmlGSkFCNjhl?=
 =?utf-8?B?emk4VktEMis0Z3FnakJNZU16cExsQVpYTWI3NW9EaWhPWGl2clVjWjNIcWVX?=
 =?utf-8?B?MDZnbGsrdjRTMm1tYzRVTmhxSVh4OWh0YUJBNUJwd3RnS2tQNmg2VDJpVHJN?=
 =?utf-8?B?WS9rVXR0N0MwcDd4TXFSR3RyNmxrRlJVQ29IRGN6SDNFZWRYNFlabWZ6ZU5q?=
 =?utf-8?B?T1RMN1loWEQzRWNVejlEcWpwT2pyZHFDd2d3OEV4Uzk0UXVSd3R6bDc0Qi9E?=
 =?utf-8?Q?EM7g=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0aa42365-f985-441d-cf5a-08de399e737c
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2025 16:49:43.7916 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YPyFP6tmKVQM4XV0w+hrUxuSYrUgpclIwA3EoJ+/F8Oxe3t2IrGPDjp/pf0zQ9H11AxE3bCOVvaMI1l3rreECw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6932
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogaWd0LWRldiA8aWd0LWRl
di1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mDQo+IFZvZGFwYWxs
aSwgUmF2aSBLdW1hcg0KPiBTZW50OiBGcmlkYXksIERlY2VtYmVyIDEyLCAyMDI1IDA3OjU2DQo+
IFRvOiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENI
IHY4IDIvMl0gbGliL2ludGVsX2RldmljZV9pbmZvOiBRdWVyeSBydW50aW1lIHhlIGRldmljZQ0K
PiBncmFwaGljcyB2ZXJzaW9uc3RoDQo+IA0KPiANCj4gDQo+IE9uIDExLzE4LzIwMjUgMTE6NDEg
QU0sIFdhbmcsIFggd3JvdGU6DQo+ID4NCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0N
Cj4gPj4gRnJvbTogS2FtaWwgS29uaWVjem55IDxrYW1pbC5rb25pZWN6bnlAbGludXguaW50ZWwu
Y29tPg0KPiA+PiBTZW50OiBGcmlkYXksIE5vdmVtYmVyIDcsIDIwMjUgMTE6NDgNCj4gPj4gVG86
IFdhbmcsIFggPHgud2FuZ0BpbnRlbC5jb20+DQo+ID4+IENjOiBpZ3QtZGV2QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZzsgU3VtbWVycywgU3R1YXJ0DQo+ID4+IDxzdHVhcnQuc3VtbWVyc0BpbnRlbC5j
b20+DQo+ID4+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjggMi8yXSBsaWIvaW50ZWxfZGV2aWNlX2lu
Zm86IFF1ZXJ5IHJ1bnRpbWUgeGUNCj4gPj4gZGV2aWNlIGdyYXBoaWNzIHZlcnNpb25zDQo+ID4+
DQo+ID4+IEhpIFhpbiwNCj4gPj4gT24gMjAyNS0xMC0yMCBhdCAyMzoxMjo1MyArMDAwMCwgWGlu
IFdhbmcgd3JvdGU6DQo+ID4+PiBGb3IgcGxhdGZvcm1zIHdpdGggZ3JhcGhpY3NfdmVyID49IDIw
LCBxdWVyeSB0aGUgcnVudGltZSB4ZSBkZXZpY2UNCj4gPj4+IHZlciBpbnN0ZWFkIG9mIHJlbHlp
bmcgc29sZWx5IG9uIGhhcmRjb2RlZCB2YWx1ZXMgZnJvbSB0aGUgUENJIGRldmljZQ0KPiB0YWJs
ZS4NCj4gPj4+IFRoaXMgZW5hYmxlcyBhY2N1cmF0ZSBJUCBtaW5vciB2ZXJzaW9uIChncmFwaGlj
c19yZWwpIGRldGVjdGlvbiBmb3INCj4gPj4+IHBsYXRmb3JtcyBsaWtlIFhlMiB3aGVyZSBkaWZm
ZXJlbnQgc3RlcHBpbmdzIGhhdmUgZGlmZmVyZW50IElQIHZlcnNpb25zLg0KPiA+Pj4NCj4gPj4+
IEltcGxlbWVudGF0aW9uIGRldGFpbHM6DQo+ID4+PiAtIFVzZSB3ZWFrIHN5bWJvbCBsaW5rYWdl
IGZvciB4ZV9pcHZlcl9jYWNoZV9sb29rdXAoKSB0byBoYW5kbGUgc3RhdGljDQo+ID4+PiAgICBs
aWJyYXJ5IGNvbXBpbGF0aW9uIChsaWJpZ3RfY2hpcHNldC5hLCBsaWJpZ3RfZGV2aWNlX3NjYW4u
YSkgd2l0aG91dA0KPiA+Pj4gICAgeGVfcXVlcnkuYyBkZXBlbmRlbmNpZXMgd2hpY2ggYXJlIHVz
ZWQgZm9yIGk5MTUgdG9vbHMgKGk5MTVfcGVyZiBhbmQNCj4gPj4+ICAgIGludGVsX2dwdV90b3Ap
DQo+ID4+PiAtIFByb3ZpZGUgYSB3ZWFrIHN0dWIgdGhhdCByZXR1cm5zIE5VTEwgd2hlbiB4ZV9x
dWVyeSBpcyBub3QgbGlua2VkDQo+ID4+PiAtIEZvciBHZW4yMCsgcGxhdGZvcm1zLCBwcmVmZXIg
cnVudGltZSB4ZSBkZXZpY2UgdmVyc2lvbnMgb3Zlcg0KPiA+Pj4gc3RhdGljIGRhdGENCj4gPj4+
IC0gRmFsbCBiYWNrIHRvIFBDSSB0YWJsZSBpZiB4ZSBkZXZpY2UgaW5mbyBpcyB1bmF2YWlsYWJs
ZQ0KPiA+Pj4gLSBSZXNldCBjYWNoZSBvbiBxdWVyeSBmYWlsdXJlIHRvIGFsbG93IHJldHJ5DQo+
ID4+Pg0KPiA+Pj4gUmVtb3ZlIGhhcmRjb2RlZCBncmFwaGljc19yZWwgZnJvbSBzdGF0aWMgdGFi
bGUgZW50cmllcyBmb3IgeGUNCj4gPj4+IGRldmljZXMgYXMgdGhleSB3aWxsIGJlIHBvcHVsYXRl
ZCBhdCBydW50aW1lIGZyb20gR01EX0lELg0KPiA+Pj4NCj4gPj4+IFRoaXMgdW5pZmllcyBkZXZp
Y2UgaW5mbyBoYW5kbGluZyBiZXR3ZWVuIGk5MTUgYW5kIHhlIGRyaXZlcnMsIGVuYWJsaW5nOg0K
PiA+Pj4gLSBQbGF0Zm9ybS1zcGVjaWZpYyB3b3JrYXJvdW5kcyBiYXNlZCBvbiBhY2N1cmF0ZSBJ
UCB2ZXJzaW9ucw0KPiA+Pj4gLSBDb25zaXN0ZW50IGRldmljZSBpbmZvIEFQSSBhY3Jvc3MgYm90
aCBkcml2ZXJzDQo+ID4+ICtDYzogIlN0dWFydCBTdW1tZXJzIiA8c3R1YXJ0LnN1bW1lcnNAaW50
ZWwuY29tPg0KPiA+Pj4gU2lnbmVkLW9mZi1ieTogWGluIFdhbmcgPHgud2FuZ0BpbnRlbC5jb20+
DQo+ID4+PiAtLS0NCj4gPj4+ICAgbGliL2ludGVsX2RldmljZV9pbmZvLmMgfCAyNiArKysrKysr
KysrKysrKysrKysrKysrKy0tLQ0KPiA+Pj4gICAxIGZpbGUgY2hhbmdlZCwgMjMgaW5zZXJ0aW9u
cygrKSwgMyBkZWxldGlvbnMoLSkNCj4gPj4+DQo+ID4+PiBkaWZmIC0tZ2l0IGEvbGliL2ludGVs
X2RldmljZV9pbmZvLmMgYi9saWIvaW50ZWxfZGV2aWNlX2luZm8uYyBpbmRleA0KPiA+Pj4gYTg1
M2Y5YWI0Li44N2IxMDY5YmUgMTAwNjQ0DQo+ID4+PiAtLS0gYS9saWIvaW50ZWxfZGV2aWNlX2lu
Zm8uYw0KPiA+Pj4gKysrIGIvbGliL2ludGVsX2RldmljZV9pbmZvLmMNCj4gPj4+IEBAIC0zLDYg
KzMsMTYgQEANCj4gPj4+ICAgI2luY2x1ZGUgImk5MTVfcGNpaWRzX2xvY2FsLmgiDQo+ID4+Pg0K
PiA+Pj4gICAjaW5jbHVkZSA8c3RyaW5ncy5oPiAvKiBmZnMoKSAqLw0KPiA+Pj4gKyNpbmNsdWRl
IDxzdGRkZWYuaD4NCj4gPj4+ICsjaW5jbHVkZSA8c3RyaW5nLmg+DQo+ID4+PiArDQo+ID4+PiAr
LyogV2VhayBzeW1ib2wgc3R1YiAtIHdpbGwgYmUgb3ZlcnJpZGRlbiBpZiB4ZV9xdWVyeS5jIGlz
IGxpbmtlZCAqLw0KPiA+Pj4gK3N0cnVjdCB4ZV9kZXZpY2VfaXB2ZXIgKnhlX2lwdmVyX2NhY2hl
X2xvb2t1cCh1aW50MzJfdCBkZXZpZCkNCj4gPj4+ICtfX2F0dHJpYnV0ZV9fKCh3ZWFrKSk7DQo+
ID4+PiArDQo+ID4+PiArc3RydWN0IHhlX2RldmljZV9pcHZlciAqeGVfaXB2ZXJfY2FjaGVfbG9v
a3VwKHVpbnQzMl90IGRldmlkKSB7DQo+ID4+PiArCXJldHVybiBOVUxMOw0KPiA+Pj4gK30NCj4g
Pj4+DQo+ID4+IFRoaXMgc2VlbXMgd3JvbmcsIHlvdSBjYW5ub3QgY2FjaGUgYnkgZGV2aWQsIGVp
dGhlciB5b3UgYWxyZWFkeSBoYXZlDQo+ID4+IGl0IG9yDQo+ID4gV2h5IGNhbid0IGNhY2hlIHRo
ZSBpcHZlciB3aXRoIHRoZSBkZXZpZCA/PyAgV2UgYXJlIG5vdCBleHBlY3RpbmcgdG8gcmVhZCB0
aGUNCj4gcmVnaXN0ZXIgZXZlcnkgdGltZSwgc28gd2UgbXVzdCBjYWNoZSB0aGUgdmFsdWUgc29t
ZXdoZXJlLg0KPiA+PiBub3QuIEFsc28gZGV2aWQgZGVwZW5kcyBvbiByZWdpc3RlcihzKSByZWFk
aW5nIGFuZCB5b3UgY2FuIGFjY2Vzcw0KPiA+PiB0aGF0IG9ubHkgd2hlbiB5b3UgaGF2ZSBmZCBh
bHJlYWR5IG9wZW5lZC4NCj4gPj4NCj4gPg0KPiA+Pj4gICBzdGF0aWMgY29uc3Qgc3RydWN0IGlu
dGVsX2RldmljZV9pbmZvIGludGVsX2dlbmVyaWNfaW5mbyA9IHsNCj4gPj4+ICAgCS5ncmFwaGlj
c192ZXIgPSAwLA0KPiA+Pj4gQEAgLTUwNSw3ICs1MTUsNiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0
IGludGVsX2RldmljZV9pbmZvDQo+ID4+PiBpbnRlbF9wb250ZXZlY2NoaW9faW5mbyA9IHsNCj4g
Pj4+DQo+ID4+PiAgIHN0YXRpYyBjb25zdCBzdHJ1Y3QgaW50ZWxfZGV2aWNlX2luZm8gaW50ZWxf
bHVuYXJsYWtlX2luZm8gPSB7DQo+ID4+PiAgIAkuZ3JhcGhpY3NfdmVyID0gMjAsDQo+ID4+PiAt
CS5ncmFwaGljc19yZWwgPSA0LA0KPiA+IEluIGZhY3QgdGhlIHB1cnBvc2Ugb2YgdGhlIHBhdGNo
IGlzIHRvIGZpeCB0aGUgLmdyYXBoaWNzX3JlbCBlcnJvciBvbiBzb21lDQo+IGRldmljZXMuIEFu
ZCB3ZSBhbHJlYWR5IGhhdmUgdGhlIGNvcnJlY3QgdmFsdWUgc28gd2UgY2FuIHNhZmVseSByZW1v
dmUgaXQuDQo+ID4gSSBrZWVwIHRoZSAgLmdyYXBoaWNzX3ZlciBoZXJlIGlzIGZvciBzb21lIG9m
IHRoZSB0b29scyBtYXkgbmVlZCB0bw0KPiA+IGNoZWNrIHRoZSBncmFwaGljcyB2ZXIgd2l0aG91
dCBvcGVuaW5nIHRoZSB4ZSBkZXZpY2VzLiBGb3IgdGhpcyBraW5kIG9mIHVzZQ0KPiBjYXNlIHRo
ZSB0b29sIGlzIG5vdCBpbnRlcmVzdGVkIGluIHRoZSAuZ3JhcGhpY3NfcmVsLg0KPiA+DQo+ID4+
IFRoaXMgYWxzbyBzZWVtcyB3cm9uZywgcGxlYXNlIGtlZXAgb2xkIHZhbHVlcyBmb3IgY29tcGF0
aWJpbGl0eSwgaGVyZQ0KPiA+PiBhbmQgYmVsb3cuDQo+ID4+DQo+ID4+IFJlZ2FyZHMsDQo+ID4+
IEthbWlsDQo+ID4+DQo+ID4+PiAgIAkuZGlzcGxheV92ZXIgPSAyMCwNCj4gPj4+ICAgCS5oYXNf
NHRpbGUgPSB0cnVlLA0KPiA+Pj4gICAJLmhhc19mbGF0Y2NzID0gdHJ1ZSwNCj4gPj4+IEBAIC01
MTcsNyArNTI2LDYgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBpbnRlbF9kZXZpY2VfaW5mbw0KPiA+
Pj4gaW50ZWxfbHVuYXJsYWtlX2luZm8gPSB7DQo+ID4+Pg0KPiA+Pj4gICBzdGF0aWMgY29uc3Qg
c3RydWN0IGludGVsX2RldmljZV9pbmZvIGludGVsX2JhdHRsZW1hZ2VfaW5mbyA9IHsNCj4gPj4+
ICAgCS5ncmFwaGljc192ZXIgPSAyMCwNCj4gPj4+IC0JLmdyYXBoaWNzX3JlbCA9IDEsDQo+ID4+
PiAgIAkuZGlzcGxheV92ZXIgPSAxNCwNCj4gPj4+ICAgCS5oYXNfNHRpbGUgPSB0cnVlLA0KPiA+
Pj4gICAJLmhhc19mbGF0Y2NzID0gdHJ1ZSwNCj4gPj4+IEBAIC01MjksNyArNTM3LDYgQEAgc3Rh
dGljIGNvbnN0IHN0cnVjdCBpbnRlbF9kZXZpY2VfaW5mbw0KPiA+Pj4gaW50ZWxfYmF0dGxlbWFn
ZV9pbmZvID0gew0KPiA+Pj4NCj4gPj4+ICAgc3RhdGljIGNvbnN0IHN0cnVjdCBpbnRlbF9kZXZp
Y2VfaW5mbyBpbnRlbF9wYW50aGVybGFrZV9pbmZvID0gew0KPiA+Pj4gICAJLmdyYXBoaWNzX3Zl
ciA9IDMwLA0KPiA+Pj4gLQkuZ3JhcGhpY3NfcmVsID0gMCwNCj4gPj4+ICAgCS5kaXNwbGF5X3Zl
ciA9IDMwLA0KPiA+Pj4gICAJLmhhc180dGlsZSA9IHRydWUsDQo+ID4+PiAgIAkuaGFzX2ZsYXRj
Y3MgPSB0cnVlLA0KPiA+Pj4gQEAgLTY3NSw2ICs2ODIsOCBAQCBjb25zdCBzdHJ1Y3QgaW50ZWxf
ZGV2aWNlX2luZm8NCj4gPj4+ICppbnRlbF9nZXRfZGV2aWNlX2luZm8odWludDE2X3QgZGV2aWQp
ICB7DQo+ID4+PiAgIAlzdGF0aWMgX190aHJlYWQgY29uc3Qgc3RydWN0IGludGVsX2RldmljZV9p
bmZvICpjYWNoZSA9DQo+ID4+ICZpbnRlbF9nZW5lcmljX2luZm87DQo+ID4+PiAgIAlzdGF0aWMg
X190aHJlYWQgdWludDE2X3QgY2FjaGVkX2RldmlkOw0KPiA+Pj4gKwlzdGF0aWMgX190aHJlYWQg
c3RydWN0IGludGVsX2RldmljZV9pbmZvIHhlX2Rldl9pbmZvOw0KPiA+Pj4gKwlzdHJ1Y3QgeGVf
ZGV2aWNlX2lwdmVyICppcHZlcjsNCj4gPj4+ICAgCWludCBpOw0KPiA+Pj4NCj4gPj4+ICAgCWlm
IChjYWNoZWRfZGV2aWQgPT0gZGV2aWQpDQo+ID4+PiBAQCAtNjg5LDYgKzY5OCwxNyBAQCBjb25z
dCBzdHJ1Y3QgaW50ZWxfZGV2aWNlX2luZm8NCj4gPj4gKmludGVsX2dldF9kZXZpY2VfaW5mbyh1
aW50MTZfdCBkZXZpZCkNCj4gPj4+ICAgCWNhY2hlZF9kZXZpZCA9IGRldmlkOw0KPiA+Pj4gICAJ
Y2FjaGUgPSAodm9pZCAqKWludGVsX2RldmljZV9tYXRjaFtpXS5tYXRjaF9kYXRhOw0KPiA+Pj4N
Cj4gPj4+ICsJaWYgKGNhY2hlLT5ncmFwaGljc192ZXIgPj0gMjApIHsNCj4gPiB4ZV9kZXZpY2Vf
Z2V0KGZkKSAoaW4geGVfcXVlcnkuYykgcmVjb3JkcyB0aGUgdHVwbGUgKGdyYXBoaWNzX3ZlciwN
Cj4gZ3JhcGhpY3NfcmVsLCBkZXZpZCkgaW50byB4ZV9pcHZlci5tYXAgb25jZSBpdCBoYXMgZmV0
Y2hlZA0KPiBEUk1fWEVfUVVFUllfR1RfTElTVC9DT05GSUcuIFRoZSBrZXkgaXMgdGhlIFBDSSBk
ZXZpZCwgdGhlIHZhbHVlIGlzIHRoZSBJUA0KPiB2ZXJzaW9uIHdlIGp1c3QgcmVhZCBmcm9tIEdN
RF9JRC4NCj4gPiBFdmVyeSBYZSB1c2XigJFjYXNlIGNhbGxzIHhlX2RldmljZV9nZXQoZmQpIHdo
ZW4gb3BlbmluZyB0aGUgZGV2aWNlOiB0aGUNCj4gPiBjb21tb24gZHJtX29wZW5fZHJpdmVyeyxf
YW5vdGhlcn0oKSBwYXRoIGFscmVhZHkgZG9lcyB0aGlzDQo+ID4gYXV0b21hdGljYWxseSAoc2Vl
IGxpYi9kcm10ZXN0LmMNCj4gPg0KPiA+DQo+ID4+PiArCQlpcHZlciA9IHhlX2lwdmVyX2NhY2hl
X2xvb2t1cChkZXZpZCk7DQo+ID4geGVfaXB2ZXJfY2FjaGVfbG9va3VwKCkgaXMgb25seSBhIG1h
cCBsb29rdXAuIElmIGEgZ2l2ZW4gYnVpbGQoaTkxNSBvbmx5DQo+IHRvb2xzIGFuZCB0ZXN0cykg
ZG9lc27igJl0IGxpbmsgaW4geGVfcXVlcnkuYywgdGhlIHdlYWsgc3R1YiByZXR1cm5zIE5VTEwg
YW5kDQo+IGludGVsX2dldF9kZXZpY2VfaW5mbygpIHdpbGwgbm90IGdvIHRvIHRoZSBpZiAoY2Fj
aGUtPmdyYXBoaWNzX3ZlciA+PSAyMCkgeyAuLi59DQo+IHBhcnQgaW4gdGhlIGludGVsX2dldF9k
ZXZpY2VfaW5mbygpIGZ1bmN0aW9uIHNvIHdlIHN0aWxsIG1ha2UgdGhlIGNvZGUNCj4gY29tcGF0
aWJsZSB3aXRoIGk5MTUgZGV2aWNlcy4NCj4gPg0KPiA+Pj4gKwkJaWYgKGlwdmVyICYmIGlwdmVy
LT5kZXZpZCA9PSBkZXZpZCkgew0KPiA+Pj4gKwkJCW1lbWNweSgmeGVfZGV2X2luZm8sIGNhY2hl
LCBzaXplb2Yoc3RydWN0DQo+ID4+IGludGVsX2RldmljZV9pbmZvKSk7DQo+ID4+PiArCQkJeGVf
ZGV2X2luZm8uZ3JhcGhpY3NfdmVyID0gaXB2ZXItPmdyYXBoaWNzX3ZlcjsNCj4gPj4+ICsJCQl4
ZV9kZXZfaW5mby5ncmFwaGljc19yZWwgPSBpcHZlci0+Z3JhcGhpY3NfcmVsOw0KPiA+Pj4gKwkJ
CWNhY2hlID0gJnhlX2Rldl9pbmZvOw0KPiBjYWNoZSB2YXJpYWJsZSBpcyBhIGNvbnN0YW50IHR5
cGUgd2UgY2Fubm90IHVwZGF0ZSBpdCwgZGlkIHRoZSBjb2RlIGNvbXBpbGVkDQo+IHdpdGhvdXQg
ZXJyb3IuDQo+IA0KY2FjaGUgaXMgZGVjbGFyZWQgYXMgY29uc3Qgc3RydWN0IGludGVsX2Rldmlj
ZV9pbmZvICpjYWNoZSwgc28gdGhlIHBvaW50ZWUgaXMgY29uc3QsIGJ1dCB0aGUgcG9pbnRlciBp
dHNlbGYgaXMgbXV0YWJsZS4gDQpSZWFzc2lnbmluZyBjYWNoZSA9ICZ4ZV9kZXZfaW5mbzsgaXMg
YWxsb3dlZDsgd2hhdOKAmXMgZm9yYmlkZGVuIGlzIG11dGF0aW5nIHRoZSBmaWVsZHMgdGhyb3Vn
aCBjYWNoZS4NClRoZSBjb2RlIGJ1aWxkcyBjbGVhbmx5IChubyB3YXJuaW5ncyBvciBlcnJvcnMp
LiANCg0KWGluDQo+IFJlZ2FyZHMsDQo+IFJhdmkgS3VtYXIgVg0KPiANCj4gPj4+ICsJCX0gZWxz
ZSB7DQo+ID4+PiArCQkJY2FjaGVkX2RldmlkID0gMDsNCj4gPiBUaGlzIGZ1bmN0aW9uIHdpbGwg
YmUgY2FsbGVkIGJlZm9yZSB0aGUgZHJtX29wZW5fZHJpdmVyKCkgc28gd2Ugc2hvdWxkDQo+IHJl
bW92ZSB0aGUgY2FjaGUgaGVyZS4NCj4gPiBjb2RlbmFtZV9pbnRlbCgpICBpcyBjYWxsaW5nIGlu
dGVsX2dldF9kZXZpY2VfaW5mbygpIGF0IHZlcnkgZWFybHkNCj4gPiB0aW1lIGluIGlndF9kZXZp
Y2Vfc2Nhbi5jDQo+ID4+PiArCQl9DQo+ID4+PiArCX0NCj4gPj4+ICAgb3V0Og0KPiA+Pj4gICAJ
cmV0dXJuIGNhY2hlOw0KPiA+Pj4gICB9DQo+ID4+PiAtLQ0KPiA+Pj4gMi40My4wDQo+ID4+Pg0K
DQo=
