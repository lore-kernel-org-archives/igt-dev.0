Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48B09C5AE59
	for <igt-dev@archiver.kernel.org>; Tue,  3 Jun 2025 18:31:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECD2210E612;
	Tue,  3 Jun 2025 18:30:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IC2fQQXq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52BEA10E612
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Jun 2025 18:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748975459; x=1780511459;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=A0S05teGsx0P8uMYSQ43wkUtHoITIm/H6GxdHRg9e5k=;
 b=IC2fQQXqdWlII8wz0I0dFjMr2rUuYQd5PmmjeVkbnTiY6neHcj1G9b+L
 VYnmD7SHIY6OPnfuBoJbzvoccJ8yUNGID9mqt2rzORDAsQ2Mu/uYlVzyX
 ny23akeQnDR6IdqEUPB1IgCZOsLPo6s0BRlw8Ocst2/HXjsnNilukFFt9
 6BQ6QjSqQkGtdCIK9xS9JlJVR4k7807BYcPFtbAUne/+TCwNt4kFVoyud
 m493f9UxWfGDF/b6wLodfV/F2HzB3UFhme41BgRmxFXqWTzrHo0g4nlB2
 aD9kJQDEeAdXDgrK30Vekgm6xPURnfm7tOl1FAmRBnTax26GfRmV9pWsr Q==;
X-CSE-ConnectionGUID: +ZNsNFdRQ5+LvL+wCl8QcQ==
X-CSE-MsgGUID: atfm6mdaR3O2TmlLahtV5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="50901969"
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="50901969"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 11:30:58 -0700
X-CSE-ConnectionGUID: MjgGoz3SRXWUMlKpjY5fBw==
X-CSE-MsgGUID: R1FY8S8iS4igVnfODy7AhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="145898353"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 11:30:57 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 3 Jun 2025 11:30:57 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 3 Jun 2025 11:30:57 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.70)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 3 Jun 2025 11:30:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mGnbdQ7nrmW5E1WgxkvyB7hdjs0jOdbXtbSIXiwAWJ+ommUV3BdqX0jEggxHet5wLXsubPiTE0D5a3ovoUwkFBJhYCffcgQRMgnGoQMTtvsnJ3qIqNWUxmAdHXPFStsue8J3hhKSDvIKxpm5WWEOHi0BMkyXhVjT8Ex37w5u1ANN/Gu+DUq14fwtCJWSF6ihDRyvj8+/mi/dSxeCUETaoWy/yBfdQPzKmN2roVm4/6eyOYbVlGAp8D+qTN+QEkZKReuRZxNjd52EotyLhRVNxTS2PYQA0VEdu+2aBsWlEYrnEBsB78sy0Z5FFqhI1iis/WN+KbCNYV7lfSeM1l3QSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A0S05teGsx0P8uMYSQ43wkUtHoITIm/H6GxdHRg9e5k=;
 b=HnhFwyKWc47WYTT8mOVEuAhEDP6fIy/99YIiWSC8K+1qYCAM6Gbpq2VsNI459iRhXOCDC6jYY9AbfieQksm0H9rFHnDU/FuTWuAX7NXQDJtfW5SsX5AWIoNpoC4GIolJmniB3jIdghnRkHflTtE8/GQsAOetS+GGuEjzkpLEHMEW1g78zJPe7rZC6Z9ar3/x/5nVj5/5KX3WkrpfKzV/J0PmjaLihjta6vL3pfQ8v3S/NYwb9tZbr1IVDhnpWc+INzIdwvXR73Wo4GIXMa6Y1niHanlb5l0Fa6nelgtAsMGQ29Gnjx3c9nmhJVRfX1IJQadsf/U0uxbS+Zw4tZNnlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by SA1PR11MB8840.namprd11.prod.outlook.com (2603:10b6:806:469::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Tue, 3 Jun
 2025 18:30:38 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.8813.018; Tue, 3 Jun 2025
 18:30:38 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>, "Ceraolo Spurio,
 Daniele" <daniele.ceraolospurio@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, "Dugast, Francois" <francois.dugast@intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Harrison, John C"
 <john.c.harrison@intel.com>
Subject: RE: [PATCH] tests/intel/xe_fault_injection: Ignore *ERROR* dmesg
 reports
Thread-Topic: [PATCH] tests/intel/xe_fault_injection: Ignore *ERROR* dmesg
 reports
Thread-Index: AQHb1KMhoy6sed+wdUGlXbhruHKvxLPxsIeAgAAQAZA=
Date: Tue, 3 Jun 2025 18:30:38 +0000
Message-ID: <CH0PR11MB5444976DE5CFFF252E065BD2E56DA@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250603161804.283350-1-jonathan.cavitt@intel.com>
 <143d8b11-3ab1-4574-8f2b-61591bba8f60@intel.com>
In-Reply-To: <143d8b11-3ab1-4574-8f2b-61591bba8f60@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|SA1PR11MB8840:EE_
x-ms-office365-filtering-correlation-id: 6011b34d-701b-41e2-e0b8-08dda2ccbd2a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?aWJVbW84d1hoZ3JFQzhwUTNmaXpBZXBoSkJ0cEVyVEtQVTMvaVlodk1aOEUz?=
 =?utf-8?B?Vjc5T3NLY0FwK3lXNFhGeWVBYTZLdHEzQ0JpYzVvK2c3cVl1R09GRXphSVFI?=
 =?utf-8?B?VjkyOXhNUS8xRWtXeE5VQXNSUkJFQ09GNG4rckVaWGJPT2pCQlJPN1pUQ3p1?=
 =?utf-8?B?ejhDYnBjNTAreU9WM0dZVnVJY1BEVldiM3UrN0NVa2l0aml1bjViK085d1dv?=
 =?utf-8?B?MlJTblZCZEs0WTdBbDQ5Nks4aWMxaFg5WkxZSjlPdmNYS3VxWFBsS1d0YTlZ?=
 =?utf-8?B?V0ZvMWNmNlprclhhMGxIblBxRDM2bUFORUtwRDJIV1JqTysweFNRTmhTeVJl?=
 =?utf-8?B?SFlmcXdkQUYvbis3VXVZTGlYeWltTU53ZDR2R2NBVks4ZmVzUFF2Nm1tRHZO?=
 =?utf-8?B?M012eXZ0ZFBwc2srOVNkNDJYajFMeGNyazIrZkdQa2ttcDc5aWZpUDBnMWY5?=
 =?utf-8?B?c0JZdzJKK1lXQWJlUXNtTThNZ000ODNubW1lTHVDTEZqUXJxOHg5a3Y2UFJn?=
 =?utf-8?B?VktOT1pzcFlDb09QUElNWkVtRjd5NWdLL2QvSWgrMXNkSllSOGVuM2NDb0tU?=
 =?utf-8?B?c2FLd1BhbDgxaEUweEQ0akkzM1VvY3JVbGNMK1VwSXFlT2c2bk1PalBGTTgr?=
 =?utf-8?B?SUorNUk0WGd0anVScTM4WkNHODRIV1ZWc1IvakdvejBzcnJ6dzI4bWFOakJj?=
 =?utf-8?B?a0Y5WkZmOEZ5bFU3WEZLRXFHWkM3WGZGMm5PampCQWx3VkQrWFRjcUdVcFRl?=
 =?utf-8?B?WkZpckYvTHJaVWViNWROWHVXWEdLOHVkbjlwVk5RY2ZCNGQ0QmFLT3Q4YmFm?=
 =?utf-8?B?c0FGczBqTDd6U0tKWnppRzB2N2pYVzIwWHZhNzRETUVrakVuSC9hYXlNcUY3?=
 =?utf-8?B?UkNpcWtYNDVUb0FsMzhUMVpXdVpWVUg5Rk52VGZmc0R4dGgzZks5ZU1GOEt6?=
 =?utf-8?B?c2ZySGFNd2laaU5YUDNZQmJwczF3S0FrdkVwbFMwZWZ5ejVsRGhXUlhZSlBi?=
 =?utf-8?B?ajRwSVZaZTIyVmZhREF2Y25qdGlxRVNtb25RblRlRWZOYUlKSzVqL0RxbnFN?=
 =?utf-8?B?TlhFM0VVUFBLRkkwRnZJc1Z4ZHJGaEZxZEtmN2xXT051alNPbExGUS9TNFdk?=
 =?utf-8?B?dnozOUdjOEFXaml4UFY2TTVNODlHY0JUV243SjFEQi9jMWlGZTVXOEN0K1p2?=
 =?utf-8?B?RnJHK1R2RVM1UHhvVm9Bck1sR2RFY3YwbjgwbUs5czFrK3lLYWVRWEdnQ1Zj?=
 =?utf-8?B?aDhkUGFEUkdsN0JIQkRQU3RVTWhmY3BGQ1VZeFlUTEVLWk5xUkt6bzkwR3Z6?=
 =?utf-8?B?YS9FNjBlMEg0b2I3eGg2RXUwamRldmdzOGY2aU1nL3pFMDA4anFTMWcrQSsz?=
 =?utf-8?B?WmdQNithcDVWNjQxR0ttazZuVlBnbXJBaWlzekFFU0pDenI0UjVKVzFQQmk5?=
 =?utf-8?B?SThuemUzOXZDUmc5d3hiejRmV25qaCtKaDhsTGlLM1pMQnRWUlltK2RhOWRX?=
 =?utf-8?B?dzBVUUFzdjVZSy9PSVMwejdzZmNXNnFQMDlFNk0xWnJOemVpNVRSc3RYNGMx?=
 =?utf-8?B?ck9OQVdEOGIzd25RbTJ0T05KMDNrK0wwWmZZVDFUcW5acEpwNVdOYUZGZDgr?=
 =?utf-8?B?UUNTQmFBM3UzWlBUUUp2cnlBdkxBQi93Y1VJSDJFOXF4WGppSjZhVDIvWnc2?=
 =?utf-8?B?dEdxRHdRMm1Ka1cyZ1lLWXVwRklDRU16dWNBZTZJTTV2dkgrUFFmSnN6RGJW?=
 =?utf-8?B?cHdqS0tHcll1eWtBK0djWFFlQ2NXRGVueXBnL1JMVjFQcmcyRTZydGp2YWNk?=
 =?utf-8?B?YjBJTE9XSWJRdUFCaG9SSzltMnVCUDB2VmVwaHg4MEk1bjYyYnBZZHR5YzdG?=
 =?utf-8?B?d01kNFM3dzVDU01KQXdUNllPc2JrYmkydmg2K0JJejVRT2dUOWZIcHkvYXM1?=
 =?utf-8?B?b2NaSXN2REliTjlNL2Q5d3NUWDBaZUlpem41cUhOSVhDNXNyNnE1WERoSXJp?=
 =?utf-8?B?YUR5KzlFUTdRPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MjU0czR3TFdTcXV4N2JvZktlQmtQcExSd0NYcElyOGdFSnkwR1FsTnBZWVlx?=
 =?utf-8?B?SFp0QU1zaEMvZlgxU3NNMyt4d294VXJaTlA3VmZ4TEVrM2ROWVdKUXJZdlRl?=
 =?utf-8?B?Y0FBZDU4SnRGbGkxTDdaa0EyaUZRdGdqUDdRZjZWa2F2MHRqQ09GWXZoM0NI?=
 =?utf-8?B?WU5sb245azdCSXhxa0k2M0VyOHBUMFV6L3FST3NHQWxpV012YWZkdDkyaEsz?=
 =?utf-8?B?WmJ2VXN6RFRLWjhvejViUksrczUzU3ZZNDcxWmRXOGFKbHp6TXBseDZPUTM5?=
 =?utf-8?B?TVA4UHdrYi95TVJzS1NWN1BvVkEwTzM4bThMUVRCbmV3UGwvWk1DUGFHUW5Y?=
 =?utf-8?B?RFlHdlBFSzZIaVZoN251dEpFQWdkRGlIY2xtWjFxR3hWVFJXTTd6WXNuWWNC?=
 =?utf-8?B?dzBKZ3RSd09Pd3EzYSsxcTlJS0Znczd4eGk1RVJIdEVURkx5V21CbGNKbEJs?=
 =?utf-8?B?UXl3VGIwUitoZHl6QjZOM2oxMkxMeCt4ZEFSRHpwRlBOTEZmU2hqSmc0RXVz?=
 =?utf-8?B?MTc5WEh1TEtCN1Z2am5TTWpCRWVnUk5xZTZmbmpHZFhHbmNwN1VoQmt0dTJH?=
 =?utf-8?B?YWpiYllKYkloelBBSGhrT1JGS0ZhZ3UyM1A3Ung3eWZrNUd3L2V1ZUhack9a?=
 =?utf-8?B?R1FjK0wwSXJ5YWwvbHpmdUp0YXRGSjM4cVphSXNzWEUxeVdZT0VHSURaRnlE?=
 =?utf-8?B?YWZiV1JTaHlZaW02WHAzcDJEWmZFVThQcmlMV01WU0FvaEVKN0F6eE1RRkFR?=
 =?utf-8?B?Y1JoN3BtV0RXcnBWVDluYnJ3WlFSeDF4QVlTS1ppYW1qTUtldUV3VlNIOUtl?=
 =?utf-8?B?UzRqL2h5Y1A4S3Q5YUpXSVlPSXNkZEtwTS9xcjdEeVRTd1d2ZU5VMGxEalB5?=
 =?utf-8?B?dFVpY1lKaTlzUWtIakRWOXRncFdXU3pOaFUwdXZUUGxWbHMrV0M0ZE40TWRC?=
 =?utf-8?B?NW90Qm5xM2QxWkdCbkhaYU1xcmxBSzFXWFkwa1drNWttemwxK2FGVk5HUWlS?=
 =?utf-8?B?YmpjaWRPMXZ1TWJMSXZRVWtjV3BSMmJXdjd0V082SzFwbER0SG95cmNCTVNH?=
 =?utf-8?B?cVhwdXc0SHl2VS9wZnpFYmlwL0FneXpmdm16ZWFSdWorb1FlY3cramk1ZUcz?=
 =?utf-8?B?eE1UZXIya0xJcW95R2xMTHl0c3g4bTZhYXd0cFFseTJVV0lsSW1GVnovTXY5?=
 =?utf-8?B?L3RCbWhRL3dla0poWGZBSDJGRTYwdWtUSW9pRVlPV1MvQmRvSVM2YW4xOUtH?=
 =?utf-8?B?ZUx5MWQ3aDV5WTNyYTdVbCt3dW9rajl4NUg4ektPSEMrQy90VkdURVRBT0x0?=
 =?utf-8?B?YXJMK2hwNDhYcWoxb2FJUW9vVVYyQyt4amU1Uk0ySnhhT3RuM0JhSis4Wmkv?=
 =?utf-8?B?aUFFQ2x5OE02ODhDWWgrS1ErUTNlcGpvYi9wMGd6OUJWOG1FdE01N3cwN0FP?=
 =?utf-8?B?NlFKaFZxTU9JTEVSQnNkSllkeGovYW0vOGwrYmtyelpGdHBwRnhSajZsR3Iw?=
 =?utf-8?B?M21HYlBZSjhyQ0pXUUVobDZ6ZG1JbGpDbHNYL2U1TEs2ZWlmdkZtbldRd2Ez?=
 =?utf-8?B?VlR0c1owYlJCMytvcjZRSDJSeVF2aU1ObTNSUlJuN2Y5VjhUK092V1FGTmpM?=
 =?utf-8?B?V2hUQ1VXUWRYcFJMdi8zeDg2aXdvN3RDdzF6Mk9XUm1uQmRYTDU2VTZrcGJU?=
 =?utf-8?B?elU1dVRHZVcyaGJsUnNnUnJCWmxzZUpwcWxZWTE4MS9aOVJrQ1g5K0FtcHo2?=
 =?utf-8?B?dDE0cGZKc21aUmdHS3NINC84N3QrYkFTU3dleWFtQ3RLRVBidzIrVGNQcXE5?=
 =?utf-8?B?ZVBON2lVUEhZc2htM3l5UExCK2UvWVRoMVN4SlhvbVNWZFN3VFc2ay90eVA1?=
 =?utf-8?B?Z3M3bzQzYWJXbnp1QXA4Syt6aTl6bk9MMlFqRU9xQUd3K0lVOWxJV2lpTTlY?=
 =?utf-8?B?bFB4cGpaekhUNkNkMDQ5VHN0dzRhWnM5dkRFSVVMTnp3U3duZG1aS1Jzdjdl?=
 =?utf-8?B?VGQ0Mmk0cnUwWVFIenJzT0s2M0lkSUdkbUtWODJyQkZtdUhBcmJLa3FYSzM4?=
 =?utf-8?B?N0s0b3NmdytnWWlBV1BQQ2tjMUkzUm0rOFQzeGZTTTdteFlmTndIUHArbVBG?=
 =?utf-8?Q?iM67SLP8XlxjLED511ybus/w3?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6011b34d-701b-41e2-e0b8-08dda2ccbd2a
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2025 18:30:38.6998 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +RQ92fOSHUe17dZTvFty+v8mpzwZC0j1R4MonyWHOuYUhk0fTjmB6ZaKRICsXpJkiI9dZRY7SOlciWa+KeRiuZsCm3wYkYfcrDzEFstJQGQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8840
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

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IFdhamRlY3prbywgTWljaGFsIDxNaWNo
YWwuV2FqZGVjemtvQGludGVsLmNvbT4gDQpTZW50OiBUdWVzZGF5LCBKdW5lIDMsIDIwMjUgMTA6
MjggQU0NClRvOiBDYXZpdHQsIEpvbmF0aGFuIDxqb25hdGhhbi5jYXZpdHRAaW50ZWwuY29tPjsg
aWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCkNjOiBLIFYgUCwgU2F0eWFuYXJheWFuYSA8
c2F0eWFuYXJheWFuYS5rLnYucEBpbnRlbC5jb20+OyBDZXJhb2xvIFNwdXJpbywgRGFuaWVsZSA8
ZGFuaWVsZS5jZXJhb2xvc3B1cmlvQGludGVsLmNvbT47IERlIE1hcmNoaSwgTHVjYXMgPGx1Y2Fz
LmRlbWFyY2hpQGludGVsLmNvbT47IER1Z2FzdCwgRnJhbmNvaXMgPGZyYW5jb2lzLmR1Z2FzdEBp
bnRlbC5jb20+OyBWaXZpLCBSb2RyaWdvIDxyb2RyaWdvLnZpdmlAaW50ZWwuY29tPjsgSGFycmlz
b24sIEpvaG4gQyA8am9obi5jLmhhcnJpc29uQGludGVsLmNvbT4NClN1YmplY3Q6IFJlOiBbUEFU
Q0hdIHRlc3RzL2ludGVsL3hlX2ZhdWx0X2luamVjdGlvbjogSWdub3JlICpFUlJPUiogZG1lc2cg
cmVwb3J0cw0KPiANCj4gSGksDQo+IA0KPiBPbiAwMy4wNi4yMDI1IDE4OjE4LCBKb25hdGhhbiBD
YXZpdHQgd3JvdGU6DQo+ID4gRnJvbTogU2F0eWFuYXJheWFuYSBLIFYgUCA8c2F0eWFuYXJheWFu
YS5rLnYucEBpbnRlbC5jb20+DQo+IA0KPiBzaW5jZSB0aGlzIGxvb2tzIGxpa2UgYSBmb2xsb3ct
dXAgcmV2IG9mIHRoZSBvcmlnaW5hbCBwYXRjaCwgdGhlcmUgd2FzDQo+IG5vIG5lZWQgdG8gY2hh
bmdlIHN1YmplY3QgYW5kIHRoZXJlIHNob3VsZCBiZSBhIGNoYW5nZSBsb2cgYXQgdGhlIGVuZA0K
PiANCj4gPiANCj4gPiBDdXJyZW50bHksIG51bWVyb3VzIGZhdWx0IG1lc3NhZ2VzIGhhdmUgYmVl
biBpbmNsdWRlZCBpbiB0aGUgZG1lc2cNCj4gPiBpZ25vcmUgbGlzdCwgYW5kIHRoaXMgbGlzdCBj
b250aW51ZXMgdG8gZXhwYW5kLiAgRWFjaCB0aW1lIGEgbmV3IGZhdWx0DQo+ID4gaW5qZWN0aW9u
IHBvaW50IGlzIGludHJvZHVjZWQgb3IgYSBuZXcgZmVhdHVyZSBpcyBhY3RpdmF0ZWQsIGFkZGl0
aW9uYWwNCj4gPiBmYXVsdCBtZXNzYWdlcyBhcHBlYXIsIG1ha2luZyBpdCBjdW1iZXJzb21lIHRv
IG1hbmFnZSB0aGUgZG1lc2cgaWdub3JlDQo+ID4gbGlzdC4NCj4gPiANCj4gPiBIb3dldmVyLCB3
ZSBjYW4gc2FmZWx5IGFzc2VydCB0aGF0IGFsbCBkbWVzZyByZXBvcnRzIHRoYXQgY29udGFpbg0K
PiA+ICpFUlJPUiogaW4gdGhlaXIgbWVzc2FnZSBjYW4gYmUgaWdub3JlZCwgc28gYWRkIHRoZW0g
dG8gdGhlIGRtZXNnIGlnbm9yZQ0KPiA+IGxpc3QuICBUaGlzIHVuZm9ydHVuYXRlbHkgZG9lcyBu
b3QgaW5jbHVkZSB0aGUgZGV2aWNlIHByb2JlIGVycm9yDQo+ID4gaXRzZWxmLCBzbyB0aGF0IG11
c3QgYmUgYWRkZWQgc2VwYXJhdGVseS4NCj4gPiANCj4gPiBXaGlsZSB3ZSdyZSBoZXJlLCB3ZSBz
aG91bGQgYWxzbyBhc3NlcnQgdGhhdCBhbnkgZXJyb3JzIHdlIHNlZSBhcmUgb25seQ0KPiA+IGNv
bWluZyBmcm9tIHRoZSB0YXJnZXQgUENJIGRldmljZS4NCj4gPiANCj4gPiBGaXhlczogNWRjZjkx
NTQxNWVlICgidGVzdHMvaW50ZWwveGVfZmF1bHRfaW5qZWN0aW9uOiBJZ25vcmUgZXhwZWN0ZWQg
ZXJyb3JzIikNCj4gDQo+IEknbSBub3Qgc3VyZSBpdCBuZWVkcyBGaXhlczogdGFnIGFzIGl0IHdh
c24ndCBiYWRseSBicm9rZW4NCj4gDQo+ID4gU2lnbmVkLW9mZi1ieTogU2F0eWFuYXJheWFuYSBL
IFYgUCA8c2F0eWFuYXJheWFuYS5rLnYucEBpbnRlbC5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTog
Sm9uYXRoYW4gQ2F2aXR0IDxqb25hdGhhbi5jYXZpdHRAaW50ZWwuY29tPg0KPiA+IFN1Z2dlc3Rl
ZC1ieTogTWljaGFsIFdhamRlY3prbyA8bWljaGFsLndhamRlY3prb0BpbnRlbC5jb20+DQo+ID4g
U3VnZ2VzdGVkLWJ5OiBEYW5pZWxlIENlcmFvbG8gU3B1cmlvIDxkYW5pZWxlLmNlcmFvbG9zcHVy
aW9AaW50ZWwuY29tPg0KPiA+IFN1Z2dlc3RlZC1ieTogTHVjYXMgRGUgTWFyY2hpIDxsdWNhcy5k
ZW1hcmNoaUBpbnRlbC5jb20+DQo+ID4gQ2M6IEZyYW5jb2lzIER1Z2FzdCA8ZnJhbmNvaXMuZHVn
YXN0QGludGVsLmNvbT4NCj4gPiBDYzogUm9kcmlnbyBWaXZpIDxyb2RyaWdvLnZpdmlAaW50ZWwu
Y29tPg0KPiA+IENjOiBKb2huIEhhcnJpc29uIDxqb2huLmMuaGFycmlzb25AaW50ZWwuY29tPg0K
PiA+IA0KPiA+IC0tLQ0KPiA+ICB0ZXN0cy9pbnRlbC94ZV9mYXVsdF9pbmplY3Rpb24uYyB8IDM5
ICsrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAx
NSBpbnNlcnRpb25zKCspLCAyNCBkZWxldGlvbnMoLSkNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEv
dGVzdHMvaW50ZWwveGVfZmF1bHRfaW5qZWN0aW9uLmMgYi90ZXN0cy9pbnRlbC94ZV9mYXVsdF9p
bmplY3Rpb24uYw0KPiA+IGluZGV4IDlmZTZiZmUzNTEuLmE0YTA4YWY1ZjcgMTAwNjQ0DQo+ID4g
LS0tIGEvdGVzdHMvaW50ZWwveGVfZmF1bHRfaW5qZWN0aW9uLmMNCj4gPiArKysgYi90ZXN0cy9p
bnRlbC94ZV9mYXVsdF9pbmplY3Rpb24uYw0KPiA+IEBAIC02NCwyOCArNjQsMTkgQEAgc3RhdGlj
IGludCBmYWlsX2Z1bmN0aW9uX29wZW4odm9pZCkNCj4gPiAgCXJldHVybiBkZWJ1Z2ZzX2ZhaWxf
ZnVuY3Rpb25fZGlyX2ZkOw0KPiA+ICB9DQo+ID4gIA0KPiA+IC1zdGF0aWMgYm9vbCBmdW5jdGlv
bl9pc19wYXJ0X29mX2d1Yyhjb25zdCBjaGFyIGZ1bmN0aW9uX25hbWVbXSkNCj4gPiArc3RhdGlj
IHZvaWQgaWdub3JlX2ZhdWx0c19pbl9kbWVzZyhpbnQgZmQpDQo+IA0KPiBuaXQ6IHRoaXMgY291
bGQgYmUNCj4gDQo+IAlpZ25vcmVfZG1lc2dfZXJyb3JzX2Zyb21fZHV0KGZkKQ0KPiANCj4gYW5k
IHNpbmNlIGl0J3MgcXVpdGUgZ2VuZXJpYyBtYXliZSBpdCBjb3VsZCBtb3ZlZCB0byBsaWIvIG5l
YXINCj4gDQo+IAlpZ3RfZW1pdF9pZ25vcmVfZG1lc2dfcmVnZXgocmVnZXgpDQo+IGFzDQo+IAlp
Z3RfaWdub3JlX2RtZXNnX2Vycm9yc19mcm9tX2R1dChmZCkNCg0KSSBjYW4gdXBkYXRlIHRoZSBm
dW5jdGlvbiBuYW1lLCBidXQgdGhpcyBmdW5jdGlvbiBpcyBvbmx5IGJlaW5nIHVzZWQgaGVyZSwg
c28NCkkgZG9uJ3Qgc2VlIGEgcmVhc29uIHRvIG1vdmUgaXQgdG8gdGhlIGxpYiBmb2xkZXIuDQoN
Cj4gDQo+IA0KPiA+ICB7DQo+ID4gLQlyZXR1cm4gc3Ryc3RyKGZ1bmN0aW9uX25hbWUsICJfZ3Vj
XyIpICE9IE5VTEwgfHwNCj4gPiAtCSAgICAgICBzdHJzdHIoZnVuY3Rpb25fbmFtZSwgIl91Y18i
KSAhPSBOVUxMIHx8DQo+ID4gLQkgICAgICAgc3Ryc3RyKGZ1bmN0aW9uX25hbWUsICJfd29wY21f
IikgIT0gTlVMTDsNCj4gPiAtfQ0KPiA+IC0NCj4gPiAtc3RhdGljIHZvaWQgaWdub3JlX2ZhdWx0
c19pbl9kbWVzZyhjb25zdCBjaGFyIGZ1bmN0aW9uX25hbWVbXSkNCj4gPiAtew0KPiA+IC0JLyog
RHJpdmVyIHByb2JlIGlzIGV4cGVjdGVkIHRvIGZhaWwgaW4gYWxsIGNhc2VzLCBzbyBpZ25vcmUg
aW4gaWd0X3J1bm5lciAqLw0KPiA+IC0JY2hhciByZWdleFsxMDI0XSA9ICJwcm9iZSB3aXRoIGRy
aXZlciB4ZSBmYWlsZWQgd2l0aCBlcnJvciAtMTIiOw0KPiA+IC0NCj4gPiAgCS8qDQo+ID4gLQkg
KiBJZiBHdUMgbW9kdWxlIGZhdWx0IGlzIGluamVjdGVkLCBHdUMgaXMgZXhwZWN0ZWQgdG8gZmFp
bCwNCj4gPiAtCSAqIHNvIGFsc28gaWdub3JlIEd1QyBpbml0IGZhaWx1cmVzIGluIGlndF9ydW5u
ZXIuDQo+ID4gKwkgKiBEcml2ZXIgcHJvYmUgaXMgZXhwZWN0ZWQgdG8gZmFpbCBpbiBhbGwgY2Fz
ZXMsIHNvIGlnbm9yZSBpbiBpZ3RfcnVubmVyLg0KPiA+ICsJICogQWRkaXRpb25hbGx5LCBhbGwg
ZXJyb3ItbGV2ZWwgcmVwb3J0cyBhcmUgZXhwZWN0ZWQsIHNvIGlnbm9yZSB0aG9zZSBhcyB3ZWxs
Lg0KPiA+ICAJICovDQo+ID4gLQlpZiAoZnVuY3Rpb25faXNfcGFydF9vZl9ndWMoZnVuY3Rpb25f
bmFtZSkpIHsNCj4gPiAtCQlzdHJjYXQocmVnZXgsICJ8R1RbMC05YS1mQS1GXSo6IEd1QyBpbml0
IGZhaWxlZCB3aXRoIC1FTk9NRU0iKTsNCj4gPiAtCQlzdHJjYXQocmVnZXgsICJ8R1RbMC05YS1m
QS1GXSo6IEZhaWxlZCB0byBpbml0aWFsaXplIHVDIC4tRU5PTUVNIik7DQo+ID4gLQkJc3RyY2F0
KHJlZ2V4LCAifEdUWzAtOWEtZkEtRl0qOiBGYWlsZWQgdG8gZW5hYmxlIEd1QyBDVCAuLUVOT01F
TSIpOw0KPiA+IC0JCXN0cmNhdChyZWdleCwgInxHVFswLTlhLWZBLUZdKjogR3VDIFBDIHF1ZXJ5
IHRhc2sgc3RhdGUgZmFpbGVkOiAtRU5PTUVNIik7DQo+ID4gLQl9DQo+ID4gKwljaGFyIHN0b3Jl
WzEwMjRdID0gInByb2JlIHdpdGggZHJpdmVyIHhlIGZhaWxlZCB3aXRoIGVycm9yfFxcKkVSUk9S
XFwqIjsNCj4gDQo+IAlzdGF0aWMgY29uc3QgY2hhciBzdG9yZVtdID0gLi4NCj4gDQo+ID4gKwlj
aGFyIHBjaV9zbG90W05BTUVfTUFYXTsNCj4gPiArCWNoYXIgcmVnZXhbMTAyNF07DQo+ID4gKw0K
PiA+ICsJLyogQWxsIGRtZXNnIHJlcG9ydHMgc2hvdWxkIG9ubHkgdGFyZ2V0IHRoZSBwY2kgc2xv
dCBvZiB0aGUgZ2l2ZW4gZmQgKi8NCj4gPiArCWlndF9kZXZpY2VfZ2V0X3BjaV9zbG90X25hbWUo
ZmQsIHBjaV9zbG90KTsNCj4gPiArCXNucHJpbnRmKHJlZ2V4LCAxMDI0LCAiJXM6LiooJXMpIiwg
cGNpX3Nsb3QsIHN0b3JlKTsNCj4gDQo+IAlzbnByaW50ZihyZWdleCwgc2l6ZW9mKHJlZ2V4KSwg
Li4uDQo+IA0KPiA+ICANCj4gPiAgCWlndF9lbWl0X2lnbm9yZV9kbWVzZ19yZWdleChyZWdleCk7
DQo+ID4gIH0NCj4gPiBAQCAtMjM0LDcgKzIyNSw3IEBAIGluamVjdF9mYXVsdF9wcm9iZShpbnQg
ZmQsIGNoYXIgcGNpX3Nsb3RbXSwgY29uc3QgY2hhciBmdW5jdGlvbl9uYW1lW10pDQo+ID4gIAlp
Z3RfaW5mbygiSW5qZWN0aW5nIGVycm9yIFwiJXNcIiAoJWQpIGluIGZ1bmN0aW9uIFwiJXNcIlxu
IiwNCj4gPiAgCQkgc3RyZXJyb3IoLUlOSkVDVF9FUlJOTyksIElOSkVDVF9FUlJOTywgZnVuY3Rp
b25fbmFtZSk7DQo+ID4gIA0KPiA+IC0JaWdub3JlX2ZhdWx0c19pbl9kbWVzZyhmdW5jdGlvbl9u
YW1lKTsNCj4gPiArCWlnbm9yZV9mYXVsdHNfaW5fZG1lc2coZmQpOw0KPiANCj4gbm90IHN1cmUg
aG93IHRoaXMgZmlsdGVyaW5nIHJlYWxseSB3b3JrcywgYnV0IG1heWJlIGl0IHdpbGwgYmUNCj4g
c3VmZmljaWVudCB0byBjYWxsIHRoYXQgb25jZSBpbiB0aGUgZml4dXAgPw0KDQpUaGUgZG1lc2cg
aWdub3JlIGxpc3QgaXMgY2xlYXJlZCBhZnRlciBlYWNoIHRlc3QsIHNvIHdlIG5lZWQgdG8gcmVp
bml0aWFsaXplIGl0IGJlZm9yZQ0KZXZlcnkgdGVzdCBydW4uDQotIEpvbmF0aGFuIENhdml0dA0K
DQo+IA0KPiA+ICAJaW5qZWN0aW9uX2xpc3RfYWRkKGZ1bmN0aW9uX25hbWUpOw0KPiA+ICAJc2V0
X3JldHZhbChmdW5jdGlvbl9uYW1lLCBJTkpFQ1RfRVJSTk8pOw0KPiA+ICANCj4gPiBAQCAtMjk5
LDcgKzI5MCw3IEBAIGV4ZWNfcXVldWVfY3JlYXRlX2ZhaWwoaW50IGZkLCBzdHJ1Y3QgZHJtX3hl
X2VuZ2luZV9jbGFzc19pbnN0YW5jZSAqaW5zdGFuY2UsDQo+ID4gIAlpZ3RfYXNzZXJ0X2VxKF9f
eGVfZXhlY19xdWV1ZV9jcmVhdGUoZmQsIHZtLCAxLCAxLCBpbnN0YW5jZSwgMCwgJmV4ZWNfcXVl
dWVfaWQpLCAwKTsNCj4gPiAgCXhlX2V4ZWNfcXVldWVfZGVzdHJveShmZCwgZXhlY19xdWV1ZV9p
ZCk7DQo+ID4gIA0KPiA+IC0JaWdub3JlX2ZhdWx0c19pbl9kbWVzZyhmdW5jdGlvbl9uYW1lKTsN
Cj4gPiArCWlnbm9yZV9mYXVsdHNfaW5fZG1lc2coZmQpOw0KPiA+ICAJaW5qZWN0aW9uX2xpc3Rf
YWRkKGZ1bmN0aW9uX25hbWUpOw0KPiA+ICAJc2V0X3JldHZhbChmdW5jdGlvbl9uYW1lLCBJTkpF
Q1RfRVJSTk8pOw0KPiA+ICAJaWd0X2Fzc2VydChfX3hlX2V4ZWNfcXVldWVfY3JlYXRlKGZkLCB2
bSwgMSwgMSwgaW5zdGFuY2UsIDAsICZleGVjX3F1ZXVlX2lkKSAhPSAwKTsNCj4gPiBAQCAtMzM0
LDcgKzMyNSw3IEBAIHZtX2NyZWF0ZV9mYWlsKGludCBmZCwgY29uc3QgY2hhciBmdW5jdGlvbl9u
YW1lW10sIHVuc2lnbmVkIGludCBmbGFncykNCj4gPiAgew0KPiA+ICAJaWd0X2Fzc2VydF9lcShz
aW1wbGVfdm1fY3JlYXRlKGZkLCBmbGFncyksIDApOw0KPiA+ICANCj4gPiAtCWlnbm9yZV9mYXVs
dHNfaW5fZG1lc2coZnVuY3Rpb25fbmFtZSk7DQo+ID4gKwlpZ25vcmVfZmF1bHRzX2luX2RtZXNn
KGZkKTsNCj4gPiAgCWluamVjdGlvbl9saXN0X2FkZChmdW5jdGlvbl9uYW1lKTsNCj4gPiAgCXNl
dF9yZXR2YWwoZnVuY3Rpb25fbmFtZSwgSU5KRUNUX0VSUk5PKTsNCj4gPiAgCWlndF9hc3NlcnQo
c2ltcGxlX3ZtX2NyZWF0ZShmZCwgZmxhZ3MpICE9IDApOw0KPiA+IEBAIC0zOTcsNyArMzg4LDcg
QEAgdm1fYmluZF9mYWlsKGludCBmZCwgY29uc3QgY2hhciBmdW5jdGlvbl9uYW1lW10pDQo+ID4g
IA0KPiA+ICAJaWd0X2Fzc2VydF9lcShzaW1wbGVfdm1fYmluZChmZCwgdm0pLCAwKTsNCj4gPiAg
DQo+ID4gLQlpZ25vcmVfZmF1bHRzX2luX2RtZXNnKGZ1bmN0aW9uX25hbWUpOw0KPiA+ICsJaWdu
b3JlX2ZhdWx0c19pbl9kbWVzZyhmZCk7DQo+ID4gIAlpbmplY3Rpb25fbGlzdF9hZGQoZnVuY3Rp
b25fbmFtZSk7DQo+ID4gIAlzZXRfcmV0dmFsKGZ1bmN0aW9uX25hbWUsIElOSkVDVF9FUlJOTyk7
DQo+ID4gIAlpZ3RfYXNzZXJ0KHNpbXBsZV92bV9iaW5kKGZkLCB2bSkgIT0gMCk7DQo+ID4gQEAg
LTQ0NSw3ICs0MzYsNyBAQCBvYV9hZGRfY29uZmlnX2ZhaWwoaW50IGZkLCBpbnQgc3lzZnMsIGlu
dCBkZXZpZCwgY29uc3QgY2hhciBmdW5jdGlvbl9uYW1lW10pDQo+ID4gIAlpZ3RfYXNzZXJ0KGln
dF9zeXNmc19zY2FuZihzeXNmcywgcGF0aCwgIiUiIFBSSXU2NCwgJmNvbmZpZ19pZCkgPT0gMSk7
DQo+ID4gIAlpZ3RfYXNzZXJ0X2VxKGludGVsX3hlX3BlcmZfaW9jdGwoZmQsIERSTV9YRV9PQlNF
UlZBVElPTl9PUF9SRU1PVkVfQ09ORklHLCAmY29uZmlnX2lkKSwgMCk7DQo+ID4gIA0KPiA+IC0J
aWdub3JlX2ZhdWx0c19pbl9kbWVzZyhmdW5jdGlvbl9uYW1lKTsNCj4gPiArCWlnbm9yZV9mYXVs
dHNfaW5fZG1lc2coZmQpOw0KPiA+ICAJaW5qZWN0aW9uX2xpc3RfYWRkKGZ1bmN0aW9uX25hbWUp
Ow0KPiA+ICAJc2V0X3JldHZhbChmdW5jdGlvbl9uYW1lLCBJTkpFQ1RfRVJSTk8pOw0KPiA+ICAJ
aWd0X2Fzc2VydF9sdChpbnRlbF94ZV9wZXJmX2lvY3RsKGZkLCBEUk1fWEVfT0JTRVJWQVRJT05f
T1BfQUREX0NPTkZJRywgJmNvbmZpZyksIDApOw0KPiANCj4gDQo=
