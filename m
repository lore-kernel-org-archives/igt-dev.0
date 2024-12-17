Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14FA5E77183
	for <igt-dev@archiver.kernel.org>; Wed, 18 Dec 2024 08:28:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C270810E235;
	Wed, 18 Dec 2024 08:28:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kLWXDtgk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C1B210E97E;
 Tue, 17 Dec 2024 13:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734443920; x=1765979920;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=rddpE9C8GWEFRGoWA8VDXJC9kuPJLDziaab7L8gdHYU=;
 b=kLWXDtgkMg291kE7bvrk0nbgv0RYJR1xmqUQxrxWsdObLwzGHmODGVrL
 L41yiU9X3kk2uJWEPc5chOfQn7ds12QRA+w6T3tWWuvUwKGVy7vPWEXlA
 1SEiVaep+Zok0npe4DoM1hWqcSVw8SEa6O/JXfAAuFdp00DBKTNub7rrW
 09K206cSLVDzHID/mNfJu9dIkJ4iiLgoE7niUqTgtqs5EhqUsySll+WyK
 1xI4pPezESwNJjilPBg4ev54IuHhwnkGKOluXkE8Pr3UvT1W5eiBn6zTB
 10z6iQUhy7rM/w0ezEzu3ho8jw0udLgP5PeGguSCbVpnDJyGgVYjS1doK w==;
X-CSE-ConnectionGUID: kHnwRVhBTLCEyZTGG9ND0Q==
X-CSE-MsgGUID: axUhqxaTT/uHhi+Djjqcfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="38543674"
X-IronPort-AV: E=Sophos;i="6.12,242,1728975600"; d="scan'208";a="38543674"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 05:58:40 -0800
X-CSE-ConnectionGUID: GPmLl9W9R6imaMzI4SqwRA==
X-CSE-MsgGUID: FZo9KQD4R9WFJgSth8DoMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,242,1728975600"; d="scan'208";a="97583150"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Dec 2024 05:58:40 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 17 Dec 2024 05:58:39 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 17 Dec 2024 05:58:39 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 17 Dec 2024 05:58:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oBSpro5aF8Tpjcj2uXBhWQi/cvyEZiF0MqpOmLINjxSSbIYSO1qp7Fm8V3TzGrF3tu6IEo6/PkGs79yhqh8ZzE1QD2U2Yuz1UOJ5j0KyvQHAzV5kGKrLd47C2BqpnLduIIKwCJfY0/BoDjcExg8pfNRcS33nFrJ7tGCsOkHhciI8m3nwCUP0EzjnLjnf2BIj/A1wfgi7tgCEqylGBvHBRQshbkmhFsrXlolZCsVSkurt5SLwY1Nv3wewCYaF0YXbGS4Co8x0HFOv0qBiDWIv1uUfNarYV5KBg87DQQVuxPQbZMRk95z3eYnNX5y7XPU7I2xwQu2lAIx2GVu3kjkJlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rddpE9C8GWEFRGoWA8VDXJC9kuPJLDziaab7L8gdHYU=;
 b=V78d56Nwh26fP/n+90xPb3OESA8ZBGyTi6rf6k8UeUgYt/Ha44dIMaHCyLLsHCwezBHoTMk9RJkDvSb/c4Pz2ZMD+GGcjKh/XNsCZxfUDnVkN0/lPS0iUlxYV5SwmgSHcEb3aX+I/Ox0nXrL3BLkzDxsEpJQ5oBu0eTF6DgJiZjpLQ5r1MEom0oAeG9f0HWcEo0CRbCewkgS9m4ay4UDw3xTIGfeAWXgY4Q8kKli3YnUa1tne1k9mrvzaCp+BADI2FwqX3aDzCzNWOboqSnMZVsOS+EOm/9CiAiicXGlGZFeduXklIFVonIMINF2yPY6D7eEhMpV4XpV+pDwsUMSbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5491.namprd11.prod.outlook.com (2603:10b6:610:d6::19)
 by IA0PR11MB7329.namprd11.prod.outlook.com (2603:10b6:208:437::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Tue, 17 Dec
 2024 13:58:08 +0000
Received: from CH0PR11MB5491.namprd11.prod.outlook.com
 ([fe80::fc35:d6ce:8908:ef2a]) by CH0PR11MB5491.namprd11.prod.outlook.com
 ([fe80::fc35:d6ce:8908:ef2a%5]) with mapi id 15.20.8251.015; Tue, 17 Dec 2024
 13:58:08 +0000
From: "Ravali, JupallyX" <jupallyx.ravali@intel.com>
To: "i915-ci-infra@lists.freedesktop.org"
 <i915-ci-infra@lists.freedesktop.org>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Subject: =?utf-8?B?UkU6IOKclyBpOTE1LkNJLkJBVDogZmFpbHVyZSBmb3IgaWd0X2ZhY3RzIGZv?=
 =?utf-8?Q?r_fact_tracking_(rev2)?=
Thread-Topic: =?utf-8?B?4pyXIGk5MTUuQ0kuQkFUOiBmYWlsdXJlIGZvciBpZ3RfZmFjdHMgZm9yIGZh?=
 =?utf-8?Q?ct_tracking_(rev2)?=
Thread-Index: AQHbUEJaLmHzrxdueEWddeP868SVQLLqdd/A
Date: Tue, 17 Dec 2024 13:58:08 +0000
Message-ID: <CH0PR11MB5491FA8DD627EE17318F5735EF042@CH0PR11MB5491.namprd11.prod.outlook.com>
References: <20241216151420.43042-1-peter.senna@linux.intel.com>
 <173438521433.3440302.591192445303267909@b555e5b46a47>
 <d48d2b4a-c16d-4cbe-b5ec-7d8cc03e167d@linux.intel.com>
In-Reply-To: <d48d2b4a-c16d-4cbe-b5ec-7d8cc03e167d@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5491:EE_|IA0PR11MB7329:EE_
x-ms-office365-filtering-correlation-id: cfc9540a-c6bc-4623-95c1-08dd1ea2d63d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|10070799003|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?eVRqTjVBQnRIT3pXbDYweE5oclU3MWhvam1mVkcwQnkvbkdRNUJtSzZvUU5L?=
 =?utf-8?B?TXlkTVBkTlZFeXQxNXkyalJ6YVc0UitOcmJZS3pDeDJLampodFRaQVZGVFlh?=
 =?utf-8?B?c0d3L2RZUllRUFZPaU5FWFlVYkdKeGlESnNzcVNyQ3ZXR1JDZS9zelRhODE4?=
 =?utf-8?B?SzRrcmduUzVGM2RDN2VJK0U4N2FZRVMvdlJGdEhacnRFaFdVU2hyS01GcDNw?=
 =?utf-8?B?dW1WSElyWWt5b282cUZFUzVydkp1WjNOZ1V2dWxpeUNzbFFWUjBFcGFObDdq?=
 =?utf-8?B?cU5wRDR5MkhjZWxBU21RZHFLODVJZ3pQUEFKTUhmc3pIeVZXbFp2NGFUeXZu?=
 =?utf-8?B?K0pIa3Jyc0FWQkJsV3hiM3NOQ3U4QzNaRElTQlZsMFB6Z1ZjMXlBQ1JrYXNL?=
 =?utf-8?B?KzIzdVJTUWFvUWlaYjNCd2JlQnhHUlprTDZOTmIzOTZPL3ZGZkVLdW5MZ3Yr?=
 =?utf-8?B?OUgzSHhDTm5BRElkSjVTOXNmdFpaU0FIRkpySHVDMU5oNllQMG83WHYrb2Y1?=
 =?utf-8?B?MHJLeXhta2gzVy9RbE5JU3hOZzBsdVFzMzM1dXhOZ2RlR3U2cmIzNUJvREFQ?=
 =?utf-8?B?bkJ2RXlrNUhKNFpZSFJ0cFdNQ0JRbmxUaHZHemR4bngwa0NDWmgyNmt3TTY2?=
 =?utf-8?B?aWxlb0VSazJoMCtLM0pxTmRseTJub1FBcitzcXdBUkxCaFVYVG9haVFBazJx?=
 =?utf-8?B?amtDak9HdHN5TFhpZGI4K0VkazhicmZ0VElTNlY0NFY2WGVlYTFvREhXQXdO?=
 =?utf-8?B?MmZNRWtFZ3JLWVZMYndEQUVQcS9WNVo2K3lrN0x4TXZkS25qTzBzYVZaa0sx?=
 =?utf-8?B?WDVORHhqYitYcnhnRTNvekRJd1B2TEMra28wc3p2NzhVQ05IZUMvdmloTWZJ?=
 =?utf-8?B?NGhQWUwweS94MUYrejlHQ2NEdmoxbjhHdUdWVUZtMXp5VmROR1loU3B4azM4?=
 =?utf-8?B?V3dBeTNXRi9kOHNRY3hUWVg0VUEva0hKZ01aKzl1SkdiWjJWcUxvNEg2UTZJ?=
 =?utf-8?B?K1dTNHQ0c2x6OEV4dDZMcHFMU0xSRmQ5cjFabmZ0TFNTNmQ0UThjT1VwV281?=
 =?utf-8?B?VWJDdXY0N1dpTlZ1US9TUFpuUG1ZeHlsbGdKQTVydngwb3loZ2VUZEp1RHFm?=
 =?utf-8?B?Tkh6bWU4alVYT3l4TUF5azdpNVlqUlJuS3pBRVZNcU1iWWZTUlFsbFFxRm54?=
 =?utf-8?B?Si9sUlZSUURhNmttYk1qeUdpWHdWVThqSU5uOTlyWUo0ay9IVFFhR2xYQi9s?=
 =?utf-8?B?TitkMDBKdnI2Mm9TVnF3VUhBUWgxQnZ3SzRsOWl6SlVNWFZMeWFSdCt3R1BJ?=
 =?utf-8?B?OXJxZ0pwdXhYeVpadGhBdEJYckowTlJWd0dwRDhWZFp6cFlsOWhreW85Q1c5?=
 =?utf-8?B?NllBSVJSYlZCVjl3WktrR2N1dm8yK1FaYXYwWDQ0N3RtK1FuZHRLZWV3aElh?=
 =?utf-8?B?SnIxKzRMMkV1Ry9FYmV4SGQzVXNsVmFmUGNoK2pycDZraWRvbERWNDlEUDNz?=
 =?utf-8?B?bDQ2RlI4YVRTbkFIY1B1T1pGNno0Uk8yNjRIVWdXdjZET2J6VEE5QVhWZUhE?=
 =?utf-8?B?d2ZGa2F0ZnVGd2U0ZllHOEczbUxmajhVZERpZTc4ZWFQQlFha2dvZ3ZDRXZy?=
 =?utf-8?B?dTdoOHc4eldTODUyNnpvUGhMRTdhNmJ2c3l0ZUs5UHFTdkkxWmZDbjhBbGVz?=
 =?utf-8?B?ZkRrUm4yUmRkUm1JbnJnZTd5Y2NjZXEvNVVZRG9RcWIvOXFKV2R4REFQY2ty?=
 =?utf-8?B?N1JRb2xPdExZR09abmp0dC92cnRlVHQ4SXRxWTM1SVZLVzhpR2J1czZ1VXhK?=
 =?utf-8?B?Q0RsQXBGQVBrRUFvSVpORDB6Z09nTWphRUEvY3BOdUk2UHpRazRxa1BqMmNY?=
 =?utf-8?B?by9FekNZc2d6dmx0NjlYWWkyYkNVR01FYkZiOUZZYTEzK2c9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5491.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(10070799003)(7053199007)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VElFUGFYa1QxYm9hYXROaythRDI5bzh1bzB1R0xwNG0wRG41N3FOQjFMZ21o?=
 =?utf-8?B?eG1pMHZySDI0OGtaQWIyWWJ0MUtpM2FZVWFSWXUxVE1wcEpBeVluOW52Y0RF?=
 =?utf-8?B?dk9mNXhwNVhKdFVndUp1QVdkZE8xQzQvSnpSeU9FRzczQkpNQkVmcE1kMUY1?=
 =?utf-8?B?Q2QxWXduNTU3S3FoUFhGUDBFREZxVExNU2hZTmhDT09lUFJMNXhiSjMzelMy?=
 =?utf-8?B?dmxEZmtVa1ByQVd0K2F6cDhEbzNpZ0xBNjI2Y2RVRkx6aHJ0M2lHa1ROWmxp?=
 =?utf-8?B?NHVXWHp2aStZbnBmdUhyTG5yZSsyc1p4ZmxtbktadmV5aEtidVpEbnQ5Ujkz?=
 =?utf-8?B?MGdlQS9WOWZUOStNYXp2RDFLRjZiNlVhR0x5eGVLaGpGOG9VajV5cEY5cDRs?=
 =?utf-8?B?QllkVk91SEh5SWVHRVU1UUY0SjFrOUNjZE81SGNPYnZGRk53M1BVb1NObWUr?=
 =?utf-8?B?V1pNRTFPZjJvNDh4S0dZN242eDFqdkNXTWVncmcwZEp5RHF3RmlXc3ZBc2t1?=
 =?utf-8?B?aEFxaWFjckY4TVRFVGhGTm5TM24zbHhWeFpjQ1FWZlpkK1UvTDl2K0VsKzJw?=
 =?utf-8?B?QWVxSElMeXNPRlhPb1NNSER5M1NWT285YlMvcU16ajBsSk9CRFVrcStrVm5O?=
 =?utf-8?B?VkxBeVU0a3lZU3I3QnpzSFRubXBQODRtQjkyMU5qZERTZXBrRHRvT0xVTE9m?=
 =?utf-8?B?d0NSZ0RwMlNKM3hrR1RPZ2dCbFRTNTVYeDRqMGtxcFlnS2s4YkQ5K2E1V3hU?=
 =?utf-8?B?R21HMFpEMnFhWHluMFAwcmh2aGVpRlEvUFZUQWoyOCtxSXpXQjRIL1BiS2xI?=
 =?utf-8?B?UStXT1dkZnNZQi9Wd1UyY1JhVFF2cFNnZHRtRytWb0hqOUN2b3hvQ2cyRkVj?=
 =?utf-8?B?WDI4NVowbWZubnkxKzZHK290OVNHNG9Tb0RibVBvWmdwRlhTOEcxWGl4dUxO?=
 =?utf-8?B?aGhuTVYzSkpJa1JGbVM2T1VrNU1EZ2dFaC9wd1NvazRWOE9OcTVlM21xQ1ps?=
 =?utf-8?B?ZUpXelVIeXFxZWlCVnRJdXRxUHNOMHdvNHcxVDhEUzNITTcwbjM5WnVpeDZJ?=
 =?utf-8?B?eTRVdy9DY3g1bm16VmJYMDc5S2VOK3ZabDF1Q0F0UnJmWXhzWjFqRnpZNURP?=
 =?utf-8?B?Rmh6bW1pUVZMWTBFZmlOMXZPT2tlTmZwNzF6bEtYMUJSbjJ0U3lQd1FCZjVq?=
 =?utf-8?B?Ynl4dXkrektMTVU3d2J5aDJsNDBieHJMbi9QSTNSN1ViOW1QbkxuekhTKzNU?=
 =?utf-8?B?dWR2WjZBN3ZTbUxkdklSUU9Cb1E5RU4xalBvTFFuZWpORjI0ZzFtTWhLMjFU?=
 =?utf-8?B?L1VpaUwyek1uWVJiUVBGRWt3ckFnRWhKaVB2QWlJTHdCSU9oMlk2eFd4R3RB?=
 =?utf-8?B?c3FONTBvQ1NKT0tPdDV5SW1yajNRM2FIQU00a0gzY01NOHkxL1dvOFc5U3Z6?=
 =?utf-8?B?UytwY2h4Zkdodm5sOUVhZW0wNlMvY0Fxc1VWMWJXSis2Y3NVZWpyNmw1WGVJ?=
 =?utf-8?B?NUhBNEVRa2MwdkhLRkpHT09LS0QxWkVBK0VoMFVRSWRYVFFNZGxqRWx3YnNT?=
 =?utf-8?B?enB1a0M2eXo3ckVNRjhVRWpDU0dYZjJuQ1dyZEd5SEdKd0JXQldqcXVMcEkv?=
 =?utf-8?B?aUoyakVKMzVIUmwrTG5XRVRhU1RMTjg3ZTJjV283S2I2RVpHb1crU1c0Ulh1?=
 =?utf-8?B?b3lhMlRUOE5QSTM0Q3VVWGFVMzJQZUxWTVRYaGJQN1NzN1hsNXlOQml3UTNs?=
 =?utf-8?B?TnB1Z05JdCtKSFZUT1RSdk90TzJ3dGJRT3ZKWlh3RkpFbmtXbnVjNmlOREE3?=
 =?utf-8?B?N3VOcXFPV2MvdTc4RTBOeVFUMFNuZEo3YThvQnNsTDI3bU5JckQwbnRpZGMz?=
 =?utf-8?B?V093RnJDSW9XVnEyaFJ5VG81SUo0MERDaTlXbzBkblBreWhpNTBZRWlWaUZL?=
 =?utf-8?B?aVYvWXFyVXd1cjhvamZsVTNPcE9rRnVtbDNnVGlYeC9mNnJBekhoemtkdmll?=
 =?utf-8?B?TzBjaWpSeEdaazNZY01uSXdtUTZTL3VyaW9xSFExQSsvR055MVMwV0RJN0lY?=
 =?utf-8?B?ck5jeTdsQnpWeHVpMVB1YWM3S1B5NG90MmFqd1dyOENLVWZCSXp1Znl5WXVB?=
 =?utf-8?B?Z1BMeWZFMEM0UVAwUmVxZXpTZmFsbisyelExOWUrV1FMcUdaTjJueUhlNldu?=
 =?utf-8?Q?+dMUzrUBMeyb2FzVWZMRWQR7Bwv+I6DmIJC+qXejQ9Dl?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5491.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfc9540a-c6bc-4623-95c1-08dd1ea2d63d
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2024 13:58:08.4062 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vQDBDAe0UsoLuw45nYKIrUuTt0Q/FhQiDM7hpE2bk2YKGEU6kiIigjs1ojNbYks6v2PHI4AN29OSkSdPZ5djDeaivH9MdRGYhmwA1Q0sOdI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7329
X-OriginatorOrg: intel.com
X-Mailman-Approved-At: Wed, 18 Dec 2024 08:28:37 +0000
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

SGkgLA0KDQpodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzE0MjYyOC8t
ICByZS1yZXBvcnRlZA0KDQpYZS5DSS5GdWxsIC0gQWRkcmVzc2VkIGZhaWx1cmVzLCBYZSBjYW5u
b3QgYmUgcmUtcmVwb3J0ZWQuDQppOTE1LkNJLkJBVCAgLSBSZS1yZXBvcnRlZCANCg0KVGhhbmsg
eW91LA0KUmF2YWxpDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBJOTE1LWNp
LWluZnJhIDxpOTE1LWNpLWluZnJhLWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBC
ZWhhbGYgT2YgUGV0ZXIgU2VubmEgVHNjaHVkaW4NClNlbnQ6IDE3IERlY2VtYmVyIDIwMjQgMTA6
NDMNClRvOiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgSTkxNS1jaS1pbmZyYUBsaXN0
cy5mcmVlZGVza3RvcC5vcmcNClN1YmplY3Q6IFJlOiDinJcgaTkxNS5DSS5CQVQ6IGZhaWx1cmUg
Zm9yIGlndF9mYWN0cyBmb3IgZmFjdCB0cmFja2luZyAocmV2MikNCg0KRGVhciBJOTE1LA0KDQpP
biAxNi4xMi4yMDI0IDIyOjQwLCBQYXRjaHdvcmsgd3JvdGU6DQo+ID09IFNlcmllcyBEZXRhaWxz
ID09DQo+IA0KPiBTZXJpZXM6IGlndF9mYWN0cyBmb3IgZmFjdCB0cmFja2luZyAocmV2MikNCj4g
VVJMICAgOiBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzE0MjYyOC8N
Cj4gU3RhdGUgOiBmYWlsdXJlDQo+IA0KPiA9PSBTdW1tYXJ5ID09DQo+IA0KPiBDSSBCdWcgTG9n
IC0gY2hhbmdlcyBmcm9tIElHVF84MTU3IC0+IElHVFBXXzEyMzI1IA0KPiA9PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09DQo+IA0KPiBTdW1tYXJ5DQo+
IC0tLS0tLS0NCj4gDQo+ICAgKipGQUlMVVJFKioNCj4gDQo+ICAgU2VyaW91cyB1bmtub3duIGNo
YW5nZXMgY29taW5nIHdpdGggSUdUUFdfMTIzMjUgYWJzb2x1dGVseSBuZWVkIHRvIGJlDQo+ICAg
dmVyaWZpZWQgbWFudWFsbHkuDQo+ICAgDQo+ICAgSWYgeW91IHRoaW5rIHRoZSByZXBvcnRlZCBj
aGFuZ2VzIGhhdmUgbm90aGluZyB0byBkbyB3aXRoIHRoZSBjaGFuZ2VzDQo+ICAgaW50cm9kdWNl
ZCBpbiBJR1RQV18xMjMyNSwgcGxlYXNlIG5vdGlmeSB5b3VyIGJ1ZyB0ZWFtIChJOTE1LWNpLWlu
ZnJhQGxpc3RzLmZyZWVkZXNrdG9wLm9yZykgdG8gYWxsb3cgdGhlbQ0KPiAgIHRvIGRvY3VtZW50
IHRoaXMgbmV3IGZhaWx1cmUgbW9kZSwgd2hpY2ggd2lsbCByZWR1Y2UgZmFsc2UgcG9zaXRpdmVz
IGluIENJLg0KPiANCj4gICBFeHRlcm5hbCBVUkw6IA0KPiBodHRwczovL2ludGVsLWdmeC1jaS4w
MS5vcmcvdHJlZS9kcm0tdGlwL0lHVFBXXzEyMzI1L2luZGV4Lmh0bWwNCj4gDQo+IFBhcnRpY2lw
YXRpbmcgaG9zdHMgKDQ1IC0+IDQ0KQ0KPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0N
Cj4gDQo+ICAgTWlzc2luZyAgICAoMSk6IGZpLXNuYi0yNTIwbSANCj4gDQo+IFBvc3NpYmxlIG5l
dyBpc3N1ZXMNCj4gLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiANCj4gICBIZXJlIGFyZSB0aGUgdW5r
bm93biBjaGFuZ2VzIHRoYXQgbWF5IGhhdmUgYmVlbiBpbnRyb2R1Y2VkIGluIElHVFBXXzEyMzI1
Og0KPiANCj4gIyMjIElHVCBjaGFuZ2VzICMjIw0KPiANCj4gIyMjIyBQb3NzaWJsZSByZWdyZXNz
aW9ucyAjIyMjDQo+IA0KPiAgICogaWd0QGk5MTVfcG1fcnBtQG1vZHVsZS1yZWxvYWQ6DQo+ICAg
ICAtIGJhdC1hcmxoLTM6ICAgICAgICAgW1BBU1NdWzFdIC0+IFtJTkNPTVBMRVRFXVsyXQ0KPiAg
ICBbMV06IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAvSUdUXzgxNTcv
YmF0LWFybGgtMy9pZ3RAaTkxNV9wbV9ycG1AbW9kdWxlLXJlbG9hZC5odG1sDQo+ICAgIFsyXTog
DQo+IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAvSUdUUFdfMTIzMjUv
YmF0LWFybGgtMy9pZ3RAaTkNCj4gMTVfcG1fcnBtQG1vZHVsZS1yZWxvYWQuaHRtbA0KDQpOb3Qg
cmVsYXRlZCB0byBjaGFuZ2UuIFBsZWFzZSBmaXggYW5kIHJlLXJ1bi4NCg0KVGhhbmsgeW91IQ0K
DQpbLi4uXQ0K
