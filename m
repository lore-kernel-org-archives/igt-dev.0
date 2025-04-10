Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1049C3601E
	for <igt-dev@archiver.kernel.org>; Thu, 10 Apr 2025 07:59:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79BC110E076;
	Thu, 10 Apr 2025 07:59:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QDd5vN8S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5CB710E7B1
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Apr 2025 07:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744271940; x=1775807940;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XA8iVLJUIEKF5gmy2Nvp9Mp+LFafo7OD0gLZEd0PcxQ=;
 b=QDd5vN8SONEZQN7qBad9V5LQ/cgpY+PhVO+sWdenjHdXq46ntp5HdKAc
 0fAsNeAAVoKxnDgAEjJScOgtG92U+Lqc6+jkN4Io+DXOGRwbyi9F5FKZA
 0ZcGLzin3TCnox6NQ06jHZleHXH9Kt4sOjbSl5bGmE7bHn5Ci94Og1PmL
 q3xvUyfUdKHmz5fOiqJCqAXw//CQvKRMF85z/hGwxfXjqM1+lP7YjSjHW
 8RmmXGp7w/fvEhw4z//lSTYHwY0RqFHw+PyI5ssFdB7XfIlKApnxqLzm5
 sKrEXCBEvvqGySpw0tBqvEMChgmNGG4VTY1DkjMUsWCFQwFyiaOqEZoO1 w==;
X-CSE-ConnectionGUID: m0uB7PbrRLO0s+tbOqPKRA==
X-CSE-MsgGUID: 0K7CTg0qTYehQUIi4xVb1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="56756564"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="56756564"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 00:59:00 -0700
X-CSE-ConnectionGUID: xyBWWmC6QtajzRsy3b1u1g==
X-CSE-MsgGUID: 3uihr7zxQ7uR4I8mvHUdCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="133946484"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 00:58:59 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 10 Apr 2025 00:58:58 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 10 Apr 2025 00:58:58 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 10 Apr 2025 00:58:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sPP2kJ/H2VcSc5HCb9Bw+hH6kygtSFnMOYokbx3ptl/ANRzl4FxLKRqKg4rYh4pmgtihZTqx1ON5wWivNebCIF6DMFBjB9uzNCO4hB2oQn8XPa12zUjFtFxhfF0xjRFe5B1PzXLJgnG1Rutxs+ymveQ0hPTL7P7HCn12Ei893JzcW9bllolAWFoiET+veQ4YHhdRA41kJaJomFRBmwCjhKeLneYxVlHO31QFXrBq/FoymAB5Vp0/wcK/X7J+Cg0dvC9IEQCHmtHxwbeT4bil8ZIMTvwyjoPff32HPkkEjBFShbcoQDCzX1bfVnSUpEQ3gh1DBKe9Lvqzcn3xrH25ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XA8iVLJUIEKF5gmy2Nvp9Mp+LFafo7OD0gLZEd0PcxQ=;
 b=ur0ldMyOknukm4KYnwHfXgJCssVy9mCuqA1Q1wTIlpbticF9byyK9zITxehj5ieNmMrnfePN6C7UWh+B572bSiIBwuW1YpbuOnEo4ZUU4fzxPm+fhX1yhI0vzHoZ0uilCL9ewB6l+Gc1kvZu0NKfFRLgP7RYOO3oM7m4wcXVQlsnyKqhyJ5UfFIyA2pySM+TfAPv4V8gVwLko7Utx6QnlSfbS83gvwzOmpqjXCrHhv9M4ivPjFxLSu38xlWI9xZ4YXcu31HIPnWhr2JnRO1lhT8IKlx6bERr2i8VdFyyReTsn75ppsMF9JqqHXKuOPojETl5MMRH7zxZ9DbUUupRvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by SA1PR11MB5900.namprd11.prod.outlook.com (2603:10b6:806:238::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.32; Thu, 10 Apr
 2025 07:58:55 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525%3]) with mapi id 15.20.8632.024; Thu, 10 Apr 2025
 07:58:55 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Gurram, Pravalika" <pravalika.gurram@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Gurram, Pravalika" <pravalika.gurram@intel.com>
Subject: RE: [PATCH i-g-t 2/4] benchmark: Measure allocation time for objects
Thread-Topic: [PATCH i-g-t 2/4] benchmark: Measure allocation time for objects
Thread-Index: AQHbo+zdlmEviD3hrEOmFqd0M7l4D7Ock1LQ
Date: Thu, 10 Apr 2025 07:58:55 +0000
Message-ID: <CH3PR11MB843426BEF3588E3509D346FD8DB72@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20250402164051.671184-1-pravalika.gurram@intel.com>
 <20250402164051.671184-3-pravalika.gurram@intel.com>
In-Reply-To: <20250402164051.671184-3-pravalika.gurram@intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|SA1PR11MB5900:EE_
x-ms-office365-filtering-correlation-id: 5c937a81-2983-4941-b89f-08dd78058aed
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?dmZTQ2FmNWFENDZOS0ZZckdpM3NNU2dBb0l6b0Y4dUlGNi90L3ovZXEydXUz?=
 =?utf-8?B?YlUrY2ozUStPWWdreTA5aW9heWhvR2MzakkzYXA4Njd0R2dZcFRyeEtQVjQ2?=
 =?utf-8?B?UXVtTm1lVTRQUjVyT1NrVTlTZ3RKWXQ2dUttTmVRWFdZajEwMGh6eTladGVC?=
 =?utf-8?B?dmcxdkRFcGE4TFVxTnVQcC9MOUdYNTJhQU15WW1rUUtxOGc3REV0d09aZmFl?=
 =?utf-8?B?TGF1cFlFZm9tS2ZNcXJWVEtBZ1p6MzBqeTdlQjRJVjdTZ3JVcFNSL3JxeHJu?=
 =?utf-8?B?TWZ4Zyt3dWhUSDRYRDVjUE9uN3BpMkE3cDIxeXJobWs2NER4Y1VmekpCRlJt?=
 =?utf-8?B?M1VBYk5xNGlYaUpZdzVCSzZwbm5qdkMzWDAxNHIxRzJqRTNYZmtSOFZUbHVq?=
 =?utf-8?B?cnBTcFlmNkg4Z2VDNXdLM0FDK3BiWFVTeFlweERGbXNJemxlRUFzenRHem9z?=
 =?utf-8?B?ZFdDbFFhbnkrSGNuY1Vrc0dWeWpGR3E5MDc4MWJWTThBMWp1aVBNQ1pKYzRQ?=
 =?utf-8?B?R1U2elM5NVFvZmttYUtIUllTbldLRGIrU3NkRmdkZjdSM1RSQmlaVEw4TTB3?=
 =?utf-8?B?MXJkTktZcWY5YlBWUXViOUwzTWlldGxkK0xyNHJLazZiakprVEZTYVduTHJh?=
 =?utf-8?B?N2FRTUVQb0U2bWpzci9NTDYvQmFpZWI4M01WWWNvd056azhJOGhzbDU5aEk3?=
 =?utf-8?B?Q05xRUtDdXZKU3RETWt1NG5PYmgxZ2F5Z3dRN1pRcnF2U2xsMkNHa3BmYVpR?=
 =?utf-8?B?QVBWUkFoT3ViOU05TlJiQnJEdzNqYUVKMC9JbUk3TEhwcXo1SkJwOXc2cDJ1?=
 =?utf-8?B?RnpxRGUwQTdxVmZvSUZKQ2FrZEVYZXVpcjdVWFdvOXBOSmxjVXBDdWhPREk0?=
 =?utf-8?B?THBONG82UzVWMGFrOFJsUFFtMDFqMGswM2pzU29obTkyMjFCZFVUZmpEOGpQ?=
 =?utf-8?B?SjdQZWVid2dJQXQ1YjBCd29DaE5PVEd5VXg0bHlDWUN6ZlBMbGpYSUhVYkRx?=
 =?utf-8?B?Qy8yaG1kS1FSb1JSNnpKV1RnT1ZYbUpGSEpiQStwTklxeDNPZUlTaWVvcGF2?=
 =?utf-8?B?TUxWT2psanJwSC84T2t6aEVadUdVMm9KUlpnYzNmZzBKbzRIWmg3dEJMQTk0?=
 =?utf-8?B?V3MzM2hEbmw1ZnEzTk9UaE1Wd0pCV09IR01ySThTTWZzdUZMNUUzMGlMTWtM?=
 =?utf-8?B?MmQycElkakh1RXFWdE0ycWQzZlJ0R3JIR3BpdUlpY293b25NUWlCNEVyNEh0?=
 =?utf-8?B?V3pmZzdhWS9xYTdzNm5yMXlBN01mMXJTcnpuWFhmYzVRRERNV2wzcmNhNXh2?=
 =?utf-8?B?bkYyWWd0T3ltc1pMakhaakg1dFc5UjZrSmI0dXNDMDhlUEJpUXFKcURhdnli?=
 =?utf-8?B?TWE5eEhxNzM2SGF2MnB0MmNVdllWNUNMK3ZGRzFWcldpVWZvUTV4d3BkdnRI?=
 =?utf-8?B?Tm5WZkp3Y01tZU1RbzVURGpkOFJtMnpkK1NpV0x6bnFmcVU3YmN4RHJucXNk?=
 =?utf-8?B?cG91TWNRWk1ncDFaS3J1Y3N4ZEcwRm8xZ1h0T1diV3VoNldhNGk4RTltR3g1?=
 =?utf-8?B?cGg1YWhKTk5HeldZSXl4b1pRUFdDbXpCY0VsVzhOYmhhNENTUXBKSDFEV2dS?=
 =?utf-8?B?eGt5aVNIZHpmUkNwWEpuZE01c3hVc1lyMC9kNkluMTYrdG5tYUo5ZUtGSW9Q?=
 =?utf-8?B?eXAxWTRhS2h6UWVoaURuaXBObUVYY1ROb2xqUGJsYmdsdUxCQytMRDUxdVFt?=
 =?utf-8?B?djNSS3E2dEpMVUxRaTNQbmpmMHEyMVg5bFpRSWxkL0ZDWURrU0ZnUWd4U3d2?=
 =?utf-8?B?aDhwekllSVRJSVhqczRuTjcyN0JFZDJaY0Y1b00xWkF3bVMzWHNqalAzZjdM?=
 =?utf-8?B?dHZFbEhDUEUxcWtNY1JTanR6ZFRqY0pDeFFJT293Z2kxMmRjTy9MY1pzUjhl?=
 =?utf-8?Q?4a9S436ez78lZ3faE1nCDD2OAW+CxeEh?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S3hFRjlQeGpDNmZvbnlMV0lLdTg2MEo3Z2dMLzNxVTNlTVhVNEt6T3R5SW51?=
 =?utf-8?B?d01qZWp2ZUhmcFdJdHRlUkdRWkpvSXFvcW5WdG1jZXBkREN2Rkx4elRBdmN5?=
 =?utf-8?B?QU15ZGNuY0tLejVobUQrcE9OdGlzQnJDMkFLSUlJQ3ViL1A3ZEdzcHpDc0gx?=
 =?utf-8?B?d2JjZVAvL1BOQXhEOHpmUUI5a0RBdENoRHFYU1FUd29HaDI1TjhNR3B2YWd4?=
 =?utf-8?B?ODJhb1lWSEdJRlV4d2lIY0psRi9nbTduUktNU3JZMkprU1huRy9IY25iZXNy?=
 =?utf-8?B?Q3VjRjVPRUw4bzBwdzdkZnJoYmZCajUwUmVDeTRoaFkzY3hQL2M5WUdaNWg3?=
 =?utf-8?B?U09rc2s2MmhKN1hQTnViejk4ME1rc1JBL3dYYjRzZy81MmVQcFA4YkJFdTRB?=
 =?utf-8?B?eG9BU0tpeHRvcHdFdmlEaWhGQUQvdWVLRzFuaXg3bEFXdEx6V0ZoT0prLzBM?=
 =?utf-8?B?VnhjQ0ZLT21LSDVDUmNQcnBhY1hCbmVoTDREZlhzbEovdnJweWpVK1gyNHA4?=
 =?utf-8?B?bXlnbWtab28zTDhzMGtzcTBqYmtWeXpxWkozTTRzaXQ0ZWM3ODZ6aVJVbWVK?=
 =?utf-8?B?R2pmZG1SVGsrWThnYjNqU2J2aVRoVVQxdHp1UXZHUC9JTitQcjRXYmtQckZt?=
 =?utf-8?B?T3UzN3JYWGtDZE5qZ1FZTGN2djRjZnlLeThlVkNleUJDRzdIVm9RcnNzaXg3?=
 =?utf-8?B?a1NwajVCblcxOXIrNFBBcy9paGttNjBVU2tjMEhJajQybUlONEZaUzhBbmpn?=
 =?utf-8?B?aDNIZ2k4VEtFRXlDa21BNmtod1pNY2NRanNnWE1DTmhEdm1lMmZreXBSS0tj?=
 =?utf-8?B?REVLelZaRjBPOWo2ZklaTWlZQnYyVUhPekhQWm92ejQ0Y2pZeTFXUDQ4eEdZ?=
 =?utf-8?B?dmRnNTgxRUN4a1dNbkMzQnpkb3EyMnJscmxBK1lEMmtuOW5IbUI1UUZLbkNM?=
 =?utf-8?B?bmtEaGJrZmZCTU5QNTZRMnZrRkdOclNaenhXblRwWVM5dXNzS01YQVFZQ0sx?=
 =?utf-8?B?eWc3MVNlZ2NENUVmVWFveUNtYXpHWnEzaVQvWnI0RjVnUTV6Vm8zZ3c0RE5R?=
 =?utf-8?B?MHhnRkZOcDFZYjQzREtGRGQ2QWRWYndjNkM2NkxtamxBWUR5MGl5L1RKOTJO?=
 =?utf-8?B?bmp2VmhZQUgyL0JGSE5NOWg0dDNJamlGQWVLSUx0MmRKak9qOE1VM25yQ1NK?=
 =?utf-8?B?RkU2RU1TWVEvR0xmMCtsT1VpM0daZnZRSXMzOVppKzBmSTQzcVo2c0RlUEF4?=
 =?utf-8?B?cldpUk03MUg3cFd1dzYvTTRxYkJpc1lDai9ZWDUvVjFhZkx0YlRpdThTSDFR?=
 =?utf-8?B?VnFQaU9UeCtvQUxabllDS3pvM0s0NFFSM29tQmdjakY5YzIvbVdHY0NlVU9h?=
 =?utf-8?B?MWE5ZmdIZzVXREpuSHQrTVBsb1N2UzMvWmlzQTRLSDF2QkJXZW1lRWt3NzJ6?=
 =?utf-8?B?SjRUMkI2RWd3S29OQ1lqUnZSV1NEdHRERVFpS0FHMW1NWEJwckhnK0l0ZGFQ?=
 =?utf-8?B?ZkdQVFd3Vk5LdU9TMnUxZkRnVkFPK1VlZkxYTmpNRVdJN1Y4Z2hnM3VyTVJl?=
 =?utf-8?B?SXZ4N1hERVdmb2xTRjU2L2xwMWJaRzBHa0xrSGlYZVJUaFlYRWlmc2dIYjVH?=
 =?utf-8?B?SVU2YmpWSWM0d0VqdEZLMlhhU0NYRStXMDFqbkRSYnZKTHZFYmZOcmxJbUdh?=
 =?utf-8?B?dnJZVUJycHA1MWJtc3J3SmhTYllkak8vOWxJK3d6MWxNTUFSSk1mZ2RlZHhW?=
 =?utf-8?B?eGUvVytpUzFtVU03MlVQY3B0Z1Q5RmVrRWQrOGpiMU0yV0xkNFRBYTJaa1dM?=
 =?utf-8?B?bFVzTjJ5WlpLOFRlL0c0ckc4OG1ZVGxkdXFGUlV1aFQ1K1hhNElTSTliSFI2?=
 =?utf-8?B?M3lqZko2SXRQNEZyaFFIUzlSeHBsK25MRWgrWnlSbmMxbXhsTEFhRkZQR0Y3?=
 =?utf-8?B?MjJjNjcxZTlNZkk1ZGRXN2x3dlBoV2tkOFpDN3dpYlZkWmxENk9VNWxQY3Z6?=
 =?utf-8?B?OS9RckQ1TG4xM3lWYnRVZkRNZCtXS3dqSFlML21RSWRpb3pzSDI1MmhVQlJv?=
 =?utf-8?B?V3NoTkx1dmViR3lFMUJMKyt0b1VrQ2NDNmFncXdZdDJ5c1p1ak4yelRTZ3Za?=
 =?utf-8?B?Q2NSN2FoT0RteUs1a0dxcHZJZFQ4RGN3Yi9nZDBIb3pXNFJONFBGdTdjMUZy?=
 =?utf-8?B?emc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c937a81-2983-4941-b89f-08dd78058aed
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Apr 2025 07:58:55.6964 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SS1MijAAZRTZiIpGJ51X1BYI1+ZbUttKKudyjcqDjiFhgAwbEK03xWkvIpUJeucOXJUiKwaTCOoJkZonKyPli/s5qNkGRFx8FHIgHy9dkSw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5900
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
di1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIFByYXZhbGlrYQ0K
PiBHdXJyYW0NCj4gU2VudDogMDIgQXByaWwgMjAyNSAxMDoxMSBQTQ0KPiBUbzogaWd0LWRldkBs
aXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IEd1cnJhbSwgUHJhdmFsaWthIDxwcmF2YWxpa2Eu
Z3VycmFtQGludGVsLmNvbT4NCj4gU3ViamVjdDogW1BBVENIIGktZy10IDIvNF0gYmVuY2htYXJr
OiBNZWFzdXJlIGFsbG9jYXRpb24gdGltZSBmb3Igb2JqZWN0cw0KPiANCj4gQSBiYXNpYyBtZWFz
dXJlbWVudCwgaG93IGZhc3QgY2FuIHdlIGNyZWF0ZSBhbmQgcG9wdWxhdGUgYW4gb2JqZWN0IHdp
dGgNCj4gYmFja2luZyBzdG9yYWdlDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBQcmF2YWxpa2EgR3Vy
cmFtIDxwcmF2YWxpa2EuZ3VycmFtQGludGVsLmNvbT4NCj4gLS0tDQo+ICBiZW5jaG1hcmtzL21l
c29uLmJ1aWxkIHwgICAxICsNCj4gIGJlbmNobWFya3MveGVfY3JlYXRlLmMgfCAyMzMNCj4gKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gIDIgZmlsZXMgY2hhbmdl
ZCwgMjM0IGluc2VydGlvbnMoKykNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBiZW5jaG1hcmtzL3hl
X2NyZWF0ZS5jDQo+IA0KPiBkaWZmIC0tZ2l0IGEvYmVuY2htYXJrcy9tZXNvbi5idWlsZCBiL2Jl
bmNobWFya3MvbWVzb24uYnVpbGQgaW5kZXgNCj4gNDQyMWVkZTg2Li4wMDIwM2M2MmUgMTAwNjQ0
DQo+IC0tLSBhL2JlbmNobWFya3MvbWVzb24uYnVpbGQNCj4gKysrIGIvYmVuY2htYXJrcy9tZXNv
bi5idWlsZA0KPiBAQCAtMjIsNiArMjIsNyBAQCBiZW5jaG1hcmtfcHJvZ3MgPSBbDQo+ICAJJ3By
aW1lX2xvb2t1cCcsDQo+ICAJJ3ZnZW1fbW1hcCcsDQo+ICAgICAgICAgICd4ZV9ibHQnLA0KPiAr
ICAgICAgICAneGVfY3JlYXRlJywNCj4gIF0NCj4gDQo+ICBiZW5jaG1hcmtzZGlyID0gam9pbl9w
YXRocyhsaWJleGVjZGlyLCAnYmVuY2htYXJrcycpIGRpZmYgLS1naXQNCj4gYS9iZW5jaG1hcmtz
L3hlX2NyZWF0ZS5jIGIvYmVuY2htYXJrcy94ZV9jcmVhdGUuYyBuZXcgZmlsZSBtb2RlIDEwMDY0
NA0KPiBpbmRleCAwMDAwMDAwMDAuLmNkOTdkNjkyMA0KPiAtLS0gL2Rldi9udWxsDQo+ICsrKyBi
L2JlbmNobWFya3MveGVfY3JlYXRlLmMNCj4gQEAgLTAsMCArMSwyMzMgQEANCj4gKy8qDQo+ICsg
KiBDb3B5cmlnaHQgwqkgMjAyNSBJbnRlbCBDb3Jwb3JhdGlvbg0KPiArICoNCj4gKyAqIFBlcm1p
c3Npb24gaXMgaGVyZWJ5IGdyYW50ZWQsIGZyZWUgb2YgY2hhcmdlLCB0byBhbnkgcGVyc29uDQo+
ICtvYnRhaW5pbmcgYQ0KPiArICogY29weSBvZiB0aGlzIHNvZnR3YXJlIGFuZCBhc3NvY2lhdGVk
IGRvY3VtZW50YXRpb24gZmlsZXMgKHRoZQ0KPiArIlNvZnR3YXJlIiksDQo+ICsgKiB0byBkZWFs
IGluIHRoZSBTb2Z0d2FyZSB3aXRob3V0IHJlc3RyaWN0aW9uLCBpbmNsdWRpbmcgd2l0aG91dA0K
PiArbGltaXRhdGlvbg0KPiArICogdGhlIHJpZ2h0cyB0byB1c2UsIGNvcHksIG1vZGlmeSwgbWVy
Z2UsIHB1Ymxpc2gsIGRpc3RyaWJ1dGUsDQo+ICtzdWJsaWNlbnNlLA0KPiArICogYW5kL29yIHNl
bGwgY29waWVzIG9mIHRoZSBTb2Z0d2FyZSwgYW5kIHRvIHBlcm1pdCBwZXJzb25zIHRvIHdob20N
Cj4gK3RoZQ0KPiArICogU29mdHdhcmUgaXMgZnVybmlzaGVkIHRvIGRvIHNvLCBzdWJqZWN0IHRv
IHRoZSBmb2xsb3dpbmcgY29uZGl0aW9uczoNCj4gKyAqDQo+ICsgKiBUaGUgYWJvdmUgY29weXJp
Z2h0IG5vdGljZSBhbmQgdGhpcyBwZXJtaXNzaW9uIG5vdGljZSAoaW5jbHVkaW5nIHRoZQ0KPiAr
bmV4dA0KPiArICogcGFyYWdyYXBoKSBzaGFsbCBiZSBpbmNsdWRlZCBpbiBhbGwgY29waWVzIG9y
IHN1YnN0YW50aWFsIHBvcnRpb25zDQo+ICtvZiB0aGUNCj4gKyAqIFNvZnR3YXJlLg0KPiArICoN
Cj4gKyAqIFRIRSBTT0ZUV0FSRSBJUyBQUk9WSURFRCAiQVMgSVMiLCBXSVRIT1VUIFdBUlJBTlRZ
IE9GIEFOWSBLSU5ELA0KPiArRVhQUkVTUyBPUg0KPiArICogSU1QTElFRCwgSU5DTFVESU5HIEJV
VCBOT1QgTElNSVRFRCBUTyBUSEUgV0FSUkFOVElFUyBPRg0KPiArTUVSQ0hBTlRBQklMSVRZLA0K
PiArICogRklUTkVTUyBGT1IgQSBQQVJUSUNVTEFSIFBVUlBPU0UgQU5EIE5PTklORlJJTkdFTUVO
VC4gIElOIE5PDQo+IEVWRU5UDQo+ICtTSEFMTA0KPiArICogVEhFIEFVVEhPUlMgT1IgQ09QWVJJ
R0hUIEhPTERFUlMgQkUgTElBQkxFIEZPUiBBTlkgQ0xBSU0sDQo+IERBTUFHRVMgT1INCj4gK09U
SEVSDQo+ICsgKiBMSUFCSUxJVFksIFdIRVRIRVIgSU4gQU4gQUNUSU9OIE9GIENPTlRSQUNULCBU
T1JUIE9SIE9USEVSV0lTRSwNCj4gK0FSSVNJTkcNCj4gKyAqIEZST00sIE9VVCBPRiBPUiBJTiBD
T05ORUNUSU9OIFdJVEggVEhFIFNPRlRXQVJFIE9SIFRIRSBVU0UgT1INCj4gT1RIRVINCj4gK0RF
QUxJTkdTDQo+ICsgKiBJTiBUSEUgU09GVFdBUkUuDQo+ICsgKg0KPiArICogQXV0aG9yczoNCj4g
KyAqICAgIFByYXZhbGlrYSBHdXJyYW0gPHByYXZhbGlrYS5ndXJyYW1AaW50ZWwuY29tPg0KPiAr
ICoNCj4gKyAqLw0KPiArDQo+ICsjaW5jbHVkZSA8dW5pc3RkLmg+DQo+ICsjaW5jbHVkZSA8c3Rk
bGliLmg+DQo+ICsjaW5jbHVkZSA8c3RkaW50Lmg+DQo+ICsjaW5jbHVkZSA8c3RkaW8uaD4NCj4g
KyNpbmNsdWRlIDxzdHJpbmcuaD4NCj4gKyNpbmNsdWRlIDxmY250bC5oPg0KPiArI2luY2x1ZGUg
PGludHR5cGVzLmg+DQo+ICsjaW5jbHVkZSA8ZXJybm8uaD4NCj4gKyNpbmNsdWRlIDxzeXMvc3Rh
dC5oPg0KPiArI2luY2x1ZGUgPHN5cy9pb2N0bC5oPg0KPiArI2luY2x1ZGUgPHN5cy90aW1lLmg+
DQo+ICsjaW5jbHVkZSA8dGltZS5oPg0KPiArDQo+ICsjaW5jbHVkZSAiZHJtLmgiDQo+ICsjaW5j
bHVkZSAiZHJtdGVzdC5oIg0KPiArI2luY2x1ZGUgImk5MTUvZ2VtX2NyZWF0ZS5oIg0KSGVyZSBp
OTE1IHJlbGF0ZWQgbGlicyBhcmUgbm90IHJlcXVpcmVkLg0KPiArI2luY2x1ZGUgImlndF9hdXgu
aCINCj4gKyNpbmNsdWRlICJpZ3Rfc3RhdHMuaCINCj4gKyNpbmNsdWRlICJpbnRlbF9yZWcuaCIN
ClRoaXMgbGliIGlzIHJlcGVhdGVkIGJlbG93DQo+ICsjaW5jbHVkZSAiaW9jdGxfd3JhcHBlcnMu
aCINCj4gKw0KPiArI2luY2x1ZGUgImlndC5oIg0KPiArI2luY2x1ZGUgImlndF9jb3JlLmgiDQpQ
bGVhc2UgY2hlY2sgaWYgdGhlIGFib3ZlIGxpYnMgcmVxdWlyZWQuDQpUaGUgY29kZSBoYXMgc29t
ZSBwcm9ibGVtcywgaGF2ZSB5b3UgdGVzdGVkIGl0IG9uIGFueSBwbGF0Zm9ybSwgaWYgc28gd2hp
Y2ggb25lPw0KPiArI2luY2x1ZGUgImlndF9zeW5jb2JqLmgiDQo+ICsjaW5jbHVkZSAiaW50ZWxf
cmVnLmgiDQo+ICsjaW5jbHVkZSAieGUveGVfaW9jdGwuaCINCj4gKyNpbmNsdWRlICJ4ZS94ZV9x
dWVyeS5oIg0KPiArDQo+ICsNCj4gKyNkZWZpbmUgT0JKRUNUX1NJWkUgKDE8PDIzKQ0KPiArDQo+
ICtzdHJ1Y3QgZGF0YSB7DQo+ICsJdWludDMyX3QgYmF0Y2hbMTZdOw0KPiArCXVpbnQ2NF90IHBh
ZDsNCj4gKwl1aW50MzJfdCBkYXRhOw0KPiArCXVpbnQ2NF90IGFkZHI7DQo+ICt9Ow0KPiArDQo+
ICtzdGF0aWMgZG91YmxlIGVsYXBzZWQoY29uc3Qgc3RydWN0IHRpbWVzcGVjICpzdGFydCwNCj4g
KwkJCQljb25zdCBzdHJ1Y3QgdGltZXNwZWMgKmVuZCkNCj4gK3sNCj4gKwlyZXR1cm4gKGVuZC0+
dHZfc2VjIC0gc3RhcnQtPnR2X3NlYykgKyAxZS05KihlbmQtPnR2X25zZWMgLQ0KPiArc3RhcnQt
PnR2X25zZWMpOyB9DQo+ICsNCj4gK3N0YXRpYyB2b2lkIHN0b3JlX2R3b3JkX2JhdGNoKHN0cnVj
dCBkYXRhICpkYXRhLCB1aW50NjRfdCBhZGRyLCBpbnQNCj4gK3ZhbHVlKSB7DQpXaGVyZSBhcmUg
eW91IHVzaW5nIHZhbHVlIGhlcmUgaXRzIGp1c3QgYSBub3AgcmlnaHQgdGhlbiBubyBuZWVkIG9m
IHBhc3NpbmcgYW55dGhpbmcuDQo+ICsJaW50IGI7DQo+ICsJdWludDY0X3QgYmF0Y2hfb2Zmc2V0
ID0gKGNoYXIgKikmKGRhdGEtPmJhdGNoKSAtIChjaGFyICopZGF0YTsNCj4gKwl1aW50NjRfdCBi
YXRjaF9hZGRyID0gYWRkciArIGJhdGNoX29mZnNldDsNCj4gKwl1aW50NjRfdCBzZGlfb2Zmc2V0
ID0gKGNoYXIgKikmKGRhdGEtPmRhdGEpIC0gKGNoYXIgKilkYXRhOw0KPiArCXVpbnQ2NF90IHNk
aV9hZGRyID0gYWRkciArIHNkaV9vZmZzZXQ7DQo+ICsNCj4gKwliID0gMDsNCj4gKw0KPiArCWRh
dGEtPmJhdGNoW2IrK10gPSBNSV9CQVRDSF9CVUZGRVJfRU5EOw0KPiArCWlndF9hc3NlcnQoYiA8
PSBBUlJBWV9TSVpFKGRhdGEtPmJhdGNoKSk7DQo+ICsNCj4gKwlkYXRhLT5hZGRyID0gYmF0Y2hf
YWRkcjsNCj4gK30NCj4gK3N0YXRpYyB2b2lkIHRlc3RfZXhlYyhpbnQgZmQsIGludCBidXN5KSB7
DQo+ICsJdWludDMyX3Qgdm07DQo+ICsJc2l6ZV90IGJvX3NpemU7DQo+ICsJdWludDMyX3QgYm8g
PSAwOw0KPiArCXN0cnVjdCBkYXRhICpkYXRhOw0KPiArCXVpbnQzMl90IGV4ZWNfcXVldWU7DQo+
ICsJdWludDMyX3Qgc3luY29iajsNCj4gKwlpbnQgdmFsdWUgPSAweDEyMzQ1NjsNCk5vIG5lZWQg
b2YgZGVjbGFyaW5nIHRoaXMsIFBsZWFzZSBvbmNlIGNvcnJlY3QgdGhlIHdvcmtpbmcgb2YgaXQu
DQo+ICsJdWludDY0X3QgYWRkciA9IDB4MTAwMDAwOw0KPiArDQo+ICsJc3RydWN0IGRybV94ZV9z
eW5jIHN5bmMgPSB7DQo+ICsJCS5mbGFncyA9IERSTV9YRV9TWU5DX1RZUEVfU1lOQ09CSiB8DQo+
IERSTV9YRV9TWU5DX0ZMQUdfU0lHTkFMDQo+ICsJfTsNCj4gKwlzdHJ1Y3QgZHJtX3hlX2V4ZWMg
ZXhlYyA9IHsNCj4gKwkJLm51bV9iYXRjaF9idWZmZXIgPSAxLA0KPiArCQkubnVtX3N5bmNzID0g
MSwNCj4gKwkJLnN5bmNzID0gdG9fdXNlcl9wb2ludGVyKCZzeW5jKSwNCj4gKwl9Ow0KPiArDQo+
ICsJc3RydWN0IGRybV94ZV9lbmdpbmVfY2xhc3NfaW5zdGFuY2UgaW5zdCA9IHsNCj4gKwkJLmVu
Z2luZV9jbGFzcyA9IERSTV9YRV9FTkdJTkVfQ0xBU1NfQ09QWSwNCj4gKwl9Ow0KPiArDQo+ICsJ
dm0gPSB4ZV92bV9jcmVhdGUoZmQsIDAsIDApOw0KPiArCWJvX3NpemUgPSBzaXplb2YoKmRhdGEp
Ow0KPiArCWJvX3NpemUgPSB4ZV9iYl9zaXplKGZkLCBib19zaXplKTsNCj4gKw0KPiArCWJvID0g
eGVfYm9fY3JlYXRlKGZkLCB2bSwgYm9fc2l6ZSwNCj4gKwkJCXZyYW1faWZfcG9zc2libGUoZmQs
IDApLA0KPiArDQo+IAlEUk1fWEVfR0VNX0NSRUFURV9GTEFHX05FRURTX1ZJU0lCTEVfVlJBTSk7
DQo+ICsJaWYgKGJ1c3kpIHsNCj4gKwkJc3luY29iaiA9IHN5bmNvYmpfY3JlYXRlKGZkLCAwKTsN
Cj4gKwkJc3luYy5oYW5kbGUgPSBzeW5jb2JqOw0KPiArDQo+ICsJCXhlX3ZtX2JpbmRfYXN5bmMo
ZmQsIHZtLCAwLCBibywgMCwgYWRkciwgYm9fc2l6ZSwgJnN5bmMsIDEpOw0KPiArCQlkYXRhID0g
eGVfYm9fbWFwKGZkLCBibywgYm9fc2l6ZSk7DQo+ICsJCXN0b3JlX2R3b3JkX2JhdGNoKGRhdGEs
IGFkZHIsIHZhbHVlKTsNCj4gKw0KPiArCQlpZ3RfYXNzZXJ0KHN5bmNvYmpfd2FpdChmZCwgJnN5
bmNvYmosIDEsIElOVDY0X01BWCwgMCwNCj4gTlVMTCkpOw0KPiArCQlzeW5jb2JqX3Jlc2V0KGZk
LCAmc3luY29iaiwgMSk7DQo+ICsNCj4gKwkJZXhlY19xdWV1ZSA9IHhlX2V4ZWNfcXVldWVfY3Jl
YXRlKGZkLCB2bSwgJmluc3QsIDApOw0KPiArCQlleGVjLmV4ZWNfcXVldWVfaWQgPSBleGVjX3F1
ZXVlOw0KPiArCQlleGVjLmFkZHJlc3MgPSBkYXRhLT5hZGRyOw0KPiArCQlzeW5jLmZsYWdzICY9
IERSTV9YRV9TWU5DX0ZMQUdfU0lHTkFMOw0KPiArCQl4ZV9leGVjKGZkLCAmZXhlYyk7DQo+ICsN
Cj4gKwkJaWd0X2Fzc2VydChzeW5jb2JqX3dhaXQoZmQsICZzeW5jb2JqLCAxLCBJTlQ2NF9NQVgs
IDAsDQo+IE5VTEwpKTsNCj4gKw0KPiArCQlzeW5jb2JqX2Rlc3Ryb3koZmQsIHN5bmNvYmopOw0K
PiArDQo+ICsJCXhlX2V4ZWNfcXVldWVfZGVzdHJveShmZCwgZXhlY19xdWV1ZSk7DQo+ICsJfQ0K
PiArCW11bm1hcChkYXRhLCBib19zaXplKTsNCj4gKwlnZW1fY2xvc2UoZmQsIGJvKTsNCj4gKw0K
PiArCXhlX3ZtX2Rlc3Ryb3koZmQsIHZtKTsNCj4gK30NCj4gK2ludCBtYWluKGludCBhcmdjLCBj
aGFyICoqYXJndikNCj4gK3sNCj4gKwlpbnQgZmQgPSBkcm1fb3Blbl9kcml2ZXIoRFJJVkVSX1hF
KTsNCj4gKwlpbnQgc2l6ZSA9IDA7DQo+ICsJaW50IGJ1c3kgPSAwOw0KPiArCWludCByZXBzID0g
MTM7DQo+ICsJaW50IG5jcHVzID0gMTsNCj4gKwlpbnQgYywgbiwgczsNCj4gKw0KPiArCXdoaWxl
ICgoYyA9IGdldG9wdCAoYXJnYywgYXJndiwgImJzOnI6ZiIpKSAhPSAtMSkgew0KPiArCQlzd2l0
Y2ggKGMpIHsNCj4gKwkJY2FzZSAncyc6DQo+ICsJCQlzaXplID0gYXRvaShvcHRhcmcpOw0KPiAr
CQkJYnJlYWs7DQo+ICsNCj4gKwkJY2FzZSAncic6DQo+ICsJCQlyZXBzID0gYXRvaShvcHRhcmcp
Ow0KPiArCQkJaWYgKHJlcHMgPCAxKQ0KPiArCQkJCXJlcHMgPSAxOw0KPiArCQkJYnJlYWs7DQo+
ICsNCj4gKwkJY2FzZSAnZic6DQo+ICsJCQluY3B1cyA9IHN5c2NvbmYoX1NDX05QUk9DRVNTT1JT
X09OTE4pOw0KPiArCQkJYnJlYWs7DQo+ICsNCj4gKwkJY2FzZSAnYic6DQo+ICsJCQlidXN5ID0g
dHJ1ZTsNCj4gKwkJCWJyZWFrOw0KPiArDQo+ICsJCWRlZmF1bHQ6DQo+ICsJCQlicmVhazsNCj4g
KwkJfQ0KPiArCX0NCj4gKw0KPiArCWlmIChzaXplID09IDApIHsNCj4gKwkJZm9yIChzID0gNDA5
NjsgcyA8PSAgT0JKRUNUX1NJWkU7IHMgPDw9IDEpIHsNCj4gKwkJCWlndF9zdGF0c190IHN0YXRz
Ow0KPiArDQo+ICsJCQlpZ3Rfc3RhdHNfaW5pdF93aXRoX3NpemUoJnN0YXRzLCByZXBzKTsNCj4g
KwkJCWZvciAobiA9IDA7IG4gPCByZXBzOyBuKyspIHsNCj4gKwkJCQlzdHJ1Y3QgdGltZXNwZWMg
c3RhcnQsIGVuZDsNCj4gKwkJCQl1aW50NjRfdCBjb3VudCA9IDA7DQo+ICsNCj4gKwkJCQljbG9j
a19nZXR0aW1lKENMT0NLX01PTk9UT05JQywgJnN0YXJ0KTsNCj4gKwkJCQlkbyB7DQo+ICsJCQkJ
CWZvciAoYyA9IDA7IGMgPCAxMDAwOyBjKyspDQo+ICsJCQkJCQl0ZXN0X2V4ZWMoZmQsIGJ1c3kp
Ow0KPiArCQkJCQljb3VudCArPSBjOw0KPiArCQkJCQljbG9ja19nZXR0aW1lKENMT0NLX01PTk9U
T05JQywNCj4gJmVuZCk7DQo+ICsJCQkJfSB3aGlsZSAoZW5kLnR2X3NlYyAtIHN0YXJ0LnR2X3Nl
YyA8IDIpOw0KPiArDQo+ICsJCQkJaWd0X3N0YXRzX3B1c2hfZmxvYXQoJnN0YXRzLCBjb3VudCAv
DQo+IGVsYXBzZWQoJnN0YXJ0LCAmZW5kKSk7DQo+ICsJCQl9DQo+ICsJCQlwcmludGYoIiVmXG4i
LCBpZ3Rfc3RhdHNfZ2V0X3RyaW1lYW4oJnN0YXRzKSk7DQo+ICsJCQlpZ3Rfc3RhdHNfZmluaSgm
c3RhdHMpOw0KPiArCQl9DQo+ICsJfSBlbHNlIHsNCj4gKwkJZG91YmxlICpzaGFyZWQ7DQo+ICsN
Cj4gKwkJc2hhcmVkID0gbW1hcCgwLCA0MDk2LCBQUk9UX1dSSVRFLCBNQVBfU0hBUkVEIHwNCj4g
TUFQX0FOT04sIC0xLCAwKTsNCj4gKwkJZm9yIChuID0gMDsgbiA8IHJlcHM7IG4rKykgew0KPiAr
CQkJbWVtc2V0KHNoYXJlZCwgMCwgNDA5Nik7DQo+ICsNCj4gKwkJCWlndF9mb3JrKGNoaWxkLCBu
Y3B1cykgew0KPiArCQkJCXN0cnVjdCB0aW1lc3BlYyBzdGFydCwgZW5kOw0KPiArCQkJCXVpbnQ2
NF90IGNvdW50ID0gMDsNCj4gKw0KPiArCQkJCWNsb2NrX2dldHRpbWUoQ0xPQ0tfTU9OT1RPTklD
LCAmc3RhcnQpOw0KPiArCQkJCWRvIHsNCj4gKwkJCQkJZm9yIChjID0gMDsgYyA8IDEwMDA7IGMr
KykNCj4gKwkJCQkJCXRlc3RfZXhlYyhmZCwgYnVzeSk7DQo+ICsJCQkJCWNvdW50ICs9IGM7DQo+
ICsJCQkJCWNsb2NrX2dldHRpbWUoQ0xPQ0tfTU9OT1RPTklDLA0KPiAmZW5kKTsNCj4gKwkJCQl9
IHdoaWxlIChlbmQudHZfc2VjIC0gc3RhcnQudHZfc2VjIDwgMik7DQo+ICsNCj4gKwkJCQlzaGFy
ZWRbY2hpbGRdID0gY291bnQgLyBlbGFwc2VkKCZzdGFydCwgJmVuZCk7DQo+ICsJCQl9DQo+ICsJ
CQlpZ3Rfd2FpdGNoaWxkcmVuKCk7DQo+ICsNCj4gKwkJCWZvciAoaW50IGNoaWxkID0gMDsgY2hp
bGQgPCBuY3B1czsgY2hpbGQrKykNCj4gKwkJCQlzaGFyZWRbbmNwdXNdICs9IHNoYXJlZFtjaGls
ZF07DQo+ICsNCj4gKwkJCXByaW50ZigiJTcuM2ZcbiIsIHNoYXJlZFtuY3B1c10pOw0KPiArCQl9
DQo+ICsJfQ0KPiArDQo+ICsJcmV0dXJuIDA7DQo+ICt9DQo+IC0tDQo+IDIuMzQuMQ0KDQo=
